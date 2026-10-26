#!/usr/bin/env python3
"""Stdlib checks for clone-local archived sources; no research data required."""
import hashlib
from pathlib import Path
import subprocess
import sys
import tempfile

sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_source_paths import ARCHIVED_ROOTS, resolve_archived_handoff_path


def require(ok, message):
    if not ok:
        raise AssertionError(message)


def main():
    checks=0
    with tempfile.TemporaryDirectory(prefix='rankone-source-paths-') as temp:
        root=Path(temp).resolve()/'clone'
        handoff=root/'handoff'/'fixtures'
        handoff.mkdir(parents=True)
        source=handoff/'source.json'
        content=b'{"fixture":"clone-local"}\n'
        source.write_bytes(content)
        outside=Path(temp)/'outside.json'
        outside.write_bytes(b'outside must never become a source')
        relative=source.relative_to(root)
        accepted=[relative,source]
        accepted.extend(old/relative for old in ARCHIVED_ROOTS)
        internal=handoff/'internal.json'
        internal.symlink_to(source)
        accepted.append(internal.relative_to(root))
        digest=hashlib.sha256(content).hexdigest()
        for path in accepted:
            resolved=resolve_archived_handoff_path(path,root)
            require(resolved==source, 'Wrong clone-local source')
            require(hashlib.sha256(resolved.read_bytes()).hexdigest()==digest,
                    'Source digest changed during rebasing')
            checks+=1
        external=handoff/'escape.json'
        external.symlink_to(outside)
        bad=[outside,Path('/unknown/checkout')/relative,
             Path('/unknown/handoff/fixtures/source.json'),
             Path('../outside.json'),Path('handoff/../outside.json'),
             Path('tools/source.json'),Path('handoff'),
             Path('handoff/fixtures/missing.json'),external.relative_to(root)]
        bad.extend(old/'handoff/../outside.json' for old in ARCHIVED_ROOTS)
        bad.extend(old/'handoff/fixtures/missing.json' for old in ARCHIVED_ROOTS)
        for path in bad:
            try:
                resolve_archived_handoff_path(path,root)
            except (ValueError,FileNotFoundError):
                checks+=1
            else:
                raise AssertionError('Accepted outside or malformed source: '+str(path))
        # A changed local file is still rejected by the original digest check.
        source.write_bytes(b'{"fixture":"tampered"}\n')
        resolved=resolve_archived_handoff_path(ARCHIVED_ROOTS[0]/relative,root)
        require(hashlib.sha256(resolved.read_bytes()).hexdigest()!=digest,
                'Rebasing hid a changed source hash')
        checks+=1
    # The sibling resolver must import under isolated Python before --help.
    tools=Path(__file__).resolve().parent
    for name in ('rankone_replay_optimize_localized.py',
                 'rankone_replay_verify_transport.py',
                 'rankone_analytic_localized_convert.py'):
        result=subprocess.run([sys.executable,'-B','-I',str(tools/name),'--help'],
                              capture_output=True,text=True)
        require(result.returncode==0 and 'usage:' in result.stdout,
                name+' failed isolated import/help: '+result.stderr)
        checks+=1
    print('PASS',checks,'clone-local source, rejection, digest and isolated-import checks')


if __name__=='__main__':
    main()
