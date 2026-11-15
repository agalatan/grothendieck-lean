"""Replay the unchanged October Stein package in isolated mode.

Agent-ID: codex-a7c4. The five Python files and three JSON witnesses in
remote_stein_original are verbatim archive members; see REMOTE.md.
Use python3 -I remote_replay.py [--dependency-dir /path/to/site-packages].
The optional path is explicit and intended for an existing python-flint install.
No optimized (-O) Python is accepted by the original verifier.
"""
import argparse
import hashlib
import json
from pathlib import Path
import runpy
import sys
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--dependency-dir', type=Path)
parser.add_argument('--part', choices=['all', 'stein', 'benchmark'], default='all')
args = parser.parse_args()
if not __debug__:
    raise RuntimeError('Do not use -O: certificate assertions must remain enabled.')
sys.dont_write_bytecode = True
base = Path(__file__).resolve().parent
original = base / 'remote_stein_original'
if args.dependency_dir:
    sys.path.insert(0, str(args.dependency_dir.resolve(strict=True)))
sys.path.insert(0, str(original))
import flint

files = sorted(p for p in original.iterdir() if p.suffix in ['.py', '.json'])
manifest = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in files}
start = time.monotonic()
if args.part == 'stein':
    import check_stein
    check_stein.verify()
elif args.part == 'benchmark':
    runpy.run_path(str(original / 'benchmark.py'), run_name='__main__')
else:
    runpy.run_path(str(original / 'verify.py'), run_name='__main__')
result = {
    'agent_id': 'codex-a7c4',
    'part': args.part,
    'status': 'PASS',
    'python': sys.version.split()[0],
    'python_flint': flint.__version__,
    'elapsed_seconds': round(time.monotonic() - start, 3),
    'scope': {
        'all': 'Peak row only; numerical acceptance conditional on mathematical inputs in REMOTE.md.',
        'stein': 'Exact Stein cuts only, conditional on stored profile caps; not a full remote certificate.',
        'benchmark': 'Gaussian benchmark only; no arbitrary-remote upper bound checked.',
    }[args.part],
    'sha256': manifest,
}
(base / ('remote_replay_' + args.part + '.json')).write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2), flush=True)
