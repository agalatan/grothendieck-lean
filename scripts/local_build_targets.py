#!/usr/bin/env python3
"""Targets of the laptop's master build (scripts/master_build_job.sh, AGENTS.md §5).

Prints, one per line, the modules of the root `Grothe` that the laptop compiles: every import of `Grothe.lean`,
except
  * the modules whose name matches a pattern of `data/local-build-exclude.txt` (the node caps and the upper-bound
    trees: hundreds of CPU-hours, verified by CI only), and
  * every module that imports one of those, directly or through other modules of the project.

Usage:
    python3 scripts/local_build_targets.py              the targets, for `lake build $(...)`
    python3 scripts/local_build_targets.py --summary    counts, and the modules skipped only because of their imports

It reads sources only (the `import` lines at the top of each file), so it needs no build and runs in a second.
"""
import argparse
import re
import sys
from pathlib import Path

ROOT_MODULE = 'Grothe'
EXCLUDE_FILE = 'data/local-build-exclude.txt'
_IMPORT = re.compile(r'^(?:public\s+|meta\s+|private\s+)*import\s+(?:all\s+)?([A-Za-z_][\w.]*)')


def imports_of(path: Path) -> list[str]:
    """The modules imported by a Lean file: its leading `import` lines, skipping blank lines and comments."""
    found, depth = [], 0
    for raw in path.read_text(encoding='utf-8').splitlines():
        line = raw.strip()
        if depth:                                   # inside a block comment /- ... -/
            depth += line.count('/-') - line.count('-/')
            depth = max(depth, 0)
            continue
        if not line or line.startswith('--'):
            continue
        if line.startswith('/-'):
            depth = line.count('/-') - line.count('-/')
            depth = max(depth, 0)
            continue
        m = _IMPORT.match(line)
        if not m:
            break                                   # the header is over: imports come first in a Lean file
        found.append(m.group(1))
    return found


def module_path(root: Path, module: str) -> Path:
    return root / (module.replace('.', '/') + '.lean')


def load_patterns(path: Path) -> list[re.Pattern]:
    pats = []
    for raw in path.read_text(encoding='utf-8').splitlines():
        line = raw.strip()
        if line and not line.startswith('#'):
            pats.append(re.compile(line))
    return pats


def plan(root: Path):
    """Returns (root imports, modules matching a pattern, modules skipped for their imports, targets)."""
    patterns = load_patterns(root / EXCLUDE_FILE)
    roots = imports_of(module_path(root, ROOT_MODULE))
    project = ROOT_MODULE + '.'

    def matches(mod: str) -> bool:
        return any(p.fullmatch(mod) for p in patterns)

    heavy: dict[str, bool] = {}                     # module -> is it skipped (itself or through an import)?

    def is_heavy(mod: str) -> bool:
        # iterative depth-first search: the import graph is deep, and recursion would overflow
        stack = [mod]
        while stack:
            cur = stack[-1]
            if cur in heavy:
                stack.pop()
                continue
            if matches(cur):
                heavy[cur] = True
                stack.pop()
                continue
            path = module_path(root, cur)
            deps = [d for d in imports_of(path) if d.startswith(project)] if path.exists() else []
            pending = [d for d in deps if d not in heavy]
            if pending:
                stack.extend(pending)
                continue
            heavy[cur] = any(heavy[d] for d in deps)
            stack.pop()
        return heavy[mod]

    matched = [m for m in roots if matches(m)]
    dependents = [m for m in roots if not matches(m) and is_heavy(m)]
    targets = [m for m in roots if not is_heavy(m)]
    return roots, matched, dependents, targets


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--root', default=str(Path(__file__).resolve().parent.parent), help='repository root')
    ap.add_argument('--summary', action='store_true', help='print counts and the modules skipped for their imports')
    args = ap.parse_args()
    root = Path(args.root)
    roots, matched, dependents, targets = plan(root)
    if not targets:
        print('local_build_targets: no target left; check ' + EXCLUDE_FILE, file=sys.stderr)
        return 1
    if args.summary:
        print(f'imports of {ROOT_MODULE}.lean: {len(roots)}')
        print(f'skipped by a pattern of {EXCLUDE_FILE}: {len(matched)}')
        print(f'skipped because they import a skipped module: {len(dependents)}')
        for m in dependents:
            print(f'  {m}')
        print(f'targets: {len(targets)}')
    else:
        print('\n'.join(targets))
    return 0


if __name__ == '__main__':
    sys.exit(main())
