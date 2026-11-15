"""Replay the weaker October package directly from its archived bytes.

Agent-ID: codex-a7c4. The archive is kept outside Git (INVENTORY.md).
python3 -I remote_legacy_replay.py --archive PACKAGE.zip [--dependency-dir DIR]

Only the assignment to ROOT is replaced, to serve read-only files from the
archive instead of extracting its >300KB certificate. Acceptance expressions
are unchanged. Stored kernel-grid enclosures are NOT recomputed here: this is
an algebraic replay conditional on those grids, not a fresh full certificate.
"""
import argparse
import fnmatch
import hashlib
import json
from pathlib import Path
import sys
import time
import zipfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--archive', type=Path, required=True)
parser.add_argument('--dependency-dir', type=Path)
args = parser.parse_args()
if not __debug__:
    raise RuntimeError('Do not use -O.')
sys.dont_write_bytecode = True
if args.dependency_dir:
    sys.path.insert(0, str(args.dependency_dir.resolve(strict=True)))
archive = args.archive.resolve(strict=True)
prefix = 'cubic-chaos-improved-certificate/'
sys.path.insert(0, str(archive) + '/' + prefix.rstrip('/'))
started = time.monotonic()
with zipfile.ZipFile(archive) as package:
    class ArchivePath:
        def __init__(self, name):
            self.name = name
        def __truediv__(self, name):
            return ArchivePath(self.name + name)
        def read_text(self):
            return package.read(self.name).decode()
        def glob(self, pattern):
            return [ArchivePath(name) for name in sorted(package.namelist())
                    if fnmatch.fnmatchcase(name, self.name + pattern)]
        def __lt__(self, other):
            return self.name < other.name

    outputs = {}
    original_argv = sys.argv
    sys.argv = ['remote_legacy_replay.py']
    for name in ['verify_improved_moment.py', 'replay_certificate.py', 'verify_obstruction.py']:
        source = package.read(prefix + name).decode()
        original_sha = hashlib.sha256(source.encode()).hexdigest()
        needle = 'ROOT=Path(__file__).resolve().parent'
        if name != 'verify_improved_moment.py':
            assert source.count(needle) == 1
            source = source.replace(needle, 'ROOT=ARCHIVE_ROOT')
        print('REPLAY', name, flush=True)
        exec(compile(source, str(archive) + '/' + prefix + name, 'exec'), {
            '__name__': '__main__', '__file__': name,
            'ARCHIVE_ROOT': ArchivePath(prefix),
        })
        outputs[name] = {'status': 'PASS', 'original_sha256': original_sha}
    sys.argv = original_argv
result = {
    'agent_id': 'codex-a7c4', 'status': 'PASS conditional on stored kernel grids',
    'scope': 'Peak row; 1977/40 sixth-moment coefficient. Not a replay of the stronger 40.45313 theorem.',
    'archive_sha256': hashlib.sha256(archive.read_bytes()).hexdigest(),
    'checks': outputs, 'elapsed_seconds': round(time.monotonic() - started, 3),
}
Path(__file__).with_name('remote_legacy_result.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2), flush=True)
