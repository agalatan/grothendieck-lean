#!/usr/bin/env python3
"""Measure the three reported base-pair memory cases in an owned Linux job.

Agent-ID: codex-7c2e. Run after the normal proof check has populated this
branch's verified cache. Each profile and leaf's data, every checker, and final
facade are rechecked separately. GNU time reports process peak RSS; the sampler
also records group RSS and stops only its own process group above the limit.
Requires the exact successful branch build. It does not prepare dependencies,
build Grothe, install a toolchain, or publish a cache. A private warm job still
requires the team's current compiler lease.
"""
import argparse
import json
import os
from pathlib import Path
import re
import signal
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
CASES = [
    'Q0BasePairRoot2Profile', 'Q0BasePairRoot2Leaf0011',
    'Q0BasePairRoot6Profile', 'Q0BasePairRoot6Leaf0011',
    'Q0BasePairRoot10Profile', 'Q0BasePairRoot10Leaf0101',
]
RSS_LIMIT_BYTES = 2_000_000_000


def process_tree(pid):
    todo, seen, values = [pid], set(), []
    while todo:
        child = todo.pop()
        if child in seen:
            continue
        seen.add(child)
        try:
            proc = Path('/proc') / str(child)
            status = proc.joinpath('status').read_text()
            rss = re.search(r'^VmRSS:\s+(\d+) kB$', status, re.M)
            high = re.search(r'^VmHWM:\s+(\d+) kB$', status, re.M)
            values.append((int(rss[1]) * 1024 if rss else 0,
                           int(high[1]) * 1024 if high else 0))
            todo.extend(map(int, proc.joinpath('task', str(child), 'children').read_text().split()))
        except (FileNotFoundError, ProcessLookupError):
            continue
    return values


def process_group_exists(pgid):
    try:
        os.killpg(pgid, 0)
        return True
    except ProcessLookupError:
        return False


def stop_own_group(proc, grace=10):
    # The group belongs to the session created by measure(), even if its
    # /usr/bin/time leader has already exited. Waiting on that leader alone
    # does not establish that the measured descendants have stopped.
    pgid = proc.pid
    try:
        os.killpg(pgid, signal.SIGTERM)
    except ProcessLookupError:
        proc.wait(timeout=max(grace, 1))
        return
    deadline = time.monotonic() + grace
    while process_group_exists(pgid) and time.monotonic() < deadline:
        proc.poll()
        time.sleep(0.05)
    if process_group_exists(pgid):
        try:
            os.killpg(pgid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    proc.wait(timeout=max(grace, 1))


def measure(command, label, out, timeout):
    timing, log = out / (label + '.time.txt'), out / (label + '.log')
    start = time.monotonic()
    sampled_peak, group_peak, stopped = 0, 0, None
    env = dict(os.environ, LC_ALL='C')
    with log.open('w') as stream:
        proc = subprocess.Popen(['/usr/bin/time', '-v', '-o', str(timing), *command],
                                cwd=ROOT, env=env, stdout=stream,
                                stderr=subprocess.STDOUT, start_new_session=True)
        try:
            while proc.poll() is None:
                members = process_tree(proc.pid)
                sampled_peak = max(sampled_peak, max((h for _, h in members), default=0))
                group_peak = max(group_peak, sum(r for r, _ in members))
                if sampled_peak >= RSS_LIMIT_BYTES:
                    stopped = 'process RSS limit'
                elif time.monotonic() - start >= timeout:
                    stopped = 'wall-clock limit'
                if stopped:
                    stop_own_group(proc)
                    break
                time.sleep(0.1)
        finally:
            leader_exited = proc.poll() is not None
            group_remains = process_group_exists(proc.pid)
            if not leader_exited or group_remains:
                if leader_exited and stopped is None:
                    stopped = 'owned process group outlived leader'
                stop_own_group(proc)
    text = timing.read_text() if timing.exists() else ''
    peak = re.search(r'Maximum resident set size \(kbytes\): (\d+)', text)
    peak_bytes = int(peak[1]) * 1024 if peak else None
    return dict(label=label, command=command, exit_code=proc.returncode,
                seconds=time.monotonic() - start, peak_rss_bytes=peak_bytes,
                sampled_process_peak_bytes=sampled_peak,
                sampled_group_peak_bytes=group_peak, stopped=stopped,
                passed=proc.returncode == 0 and peak_bytes is not None and
                peak_bytes < RSS_LIMIT_BYTES and stopped is None)


def case_modules(case):
    directory = ROOT / 'Grothe/UpperChaos'
    checks = sorted(directory.glob(case + 'Check[0-9][0-9][0-9].lean'))
    paths = [directory / (case + 'Data.lean'), *checks, directory / (case + '.lean')]
    if not checks or not all(p.is_file() for p in paths):
        raise ValueError('missing generated case modules: ' + case)
    return [(str(p.relative_to(ROOT)), 'Grothe.UpperChaos.' + p.stem) for p in paths]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--case', action='append', choices=CASES)
    parser.add_argument('--timeout', type=int, default=600, help='seconds per process group')
    args = parser.parse_args()
    if sys.platform != 'linux':
        parser.error('run only in an authorized owned Linux job, never on the shared laptop')
    if args.timeout <= 0:
        parser.error('positive timeout required')
    out = Path(os.environ['OUT']).resolve()
    out.mkdir(parents=True, exist_ok=True)
    report = dict(agent='codex-7c2e', commit=subprocess.check_output(
        ['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
        rss_limit_bytes=RSS_LIMIT_BYTES, measurements=[], passed=False,
        scope='representative profiles and reported large leaves, not a full-build RSS bound')
    try:
        marker = ROOT / '.lake/build/built-commit'
        if not marker.is_file() or marker.read_text().strip() != report['commit']:
            report['stopped'] = 'exact successful branch build is required; no dependency rebuild attempted'
            return 1
        subprocess.run([sys.executable, 'scripts/caps_stamp.py', '--check-cache'], cwd=ROOT, check=True)
        for case in args.case or CASES:
            for path, module in case_modules(case):
                measured = measure(['lake', 'env', 'lean', '-DwarningAsError=true', '-o',
                                    str(out / (module + '.olean')), path],
                                   module, out, args.timeout)
                report['measurements'].append(measured)
                if not measured['passed']:
                    return 1
        for root in [2, 6, 10]:
            for suffix in ['Audit', 'Integral']:
                module = 'Grothe.UpperChaos.Q0BasePairRoot' + str(root) + suffix
                path = module.replace('.', '/') + '.lean'
                measured = measure(['lake', 'env', 'lean', '-DwarningAsError=true', '-o',
                                    str(out / (module + '.olean')), path], module, out, args.timeout)
                report['measurements'].append(measured)
                if not measured['passed']:
                    return 1
        family = re.compile(r'Q0BasePairRoot(?:2|6|10)(?:Profile|Scalars|Audit|Integral|Leaf[01]+)'
                            r'(?:Data|Check[0-9]{3})?\.lean')
        sources = [p for p in (ROOT / 'Grothe/UpperChaos').iterdir() if family.fullmatch(p.name)]
        oleans = [ROOT / '.lake/build/lib/lean/Grothe/UpperChaos' / (p.stem + '.olean')
                  for p in sources]
        stems = {p.stem for p in sources}
        build = ROOT / '.lake/build'
        products = sorted(p for p in build.rglob('Q0BasePairRoot*')
                          if p.is_file() and p.name.split('.', 1)[0] in stems)
        report.update(family_source_modules=len(sources), source_bytes=sum(p.stat().st_size for p in sources),
                      compiled_modules=sum(p.is_file() for p in oleans),
                      olean_bytes=sum(p.stat().st_size for p in oleans if p.is_file()),
                      family_build_product_bytes=sum(p.stat().st_size for p in products),
                      family_build_products=[dict(path=str(p.relative_to(build)), bytes=p.stat().st_size)
                                             for p in products],
                      artifact_scope='all existing named family products under .lake/build; '
                                     'includes Integral and sidecars, excludes shared dependencies '
                                     'and isolated measurement outputs')
        report['passed'] = report['compiled_modules'] == report['family_source_modules']
        if not report['passed']:
            report['stopped'] = 'incomplete compiled-artifact inventory'
        return 0 if report['passed'] else 1
    finally:
        (out / 'memory-report.json').write_text(json.dumps(report, indent=2) + '\n')
        print(json.dumps({k: v for k, v in report.items()
                          if k not in ('measurements', 'family_build_products')}, indent=2))


if __name__ == '__main__':
    raise SystemExit(main())
