#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Test receipt auditing, not quadrature.

The committed receipt supplies real test data. A valid aggregation must pass;
each damaged copy must fail. Fresh quadrature remains a separate obligation.
"""
import copy
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('matrix_verify', HERE / 'verify.py')
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)


def main():
    result = json.loads((HERE / 'result.json').read_text())
    good = {'status': v.PARTIAL, 'sha256': result['sha256'],
            'shift_curvature_constant': 480, 'rows': result['rows']}
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-receipt-') as folder:
        root = Path(folder)
        source, output = root / 'input.json', root / 'output.json'
        source.write_text(json.dumps(good))
        v.combine([source], output)
        assert json.loads(output.read_text()) == result
        output.unlink()
        cases = ['duplicate job', 'missing job', 'stale hash', 'negative index',
                 'invalid PSD enclosure', 'changed reserve', 'changed shift',
                 'invalid multiplier', 'missing cone interval']
        for name in cases:
            data = copy.deepcopy(good)
            if name == 'duplicate job':
                data['rows'].append(data['rows'][0])
            elif name == 'missing job':
                data['rows'].pop()
            elif name == 'stale hash':
                data['sha256'] = {}
            elif name == 'negative index':
                data['rows'][0]['index'] = -1
            elif name == 'missing cone interval':
                row = next(r for r in data['rows'] if r['index'] < 8 and len(r['leaves']) > 2)
                row['leaves'].pop(1)
            elif name == 'invalid multiplier':
                row = next(r for r in data['rows'] if r['index'] < 8)
                row['leaves'][0] = re.sub(r'lambda=\d+/128', 'lambda=49/128', row['leaves'][0])
            else:
                row = next(r for r in data['rows'] if r['index'] >= 8)
                line = row['leaves'][0]
                m = v.PAT.fullmatch(line)
                assert m
                if name == 'invalid PSD enclosure':
                    pairs = re.sub(r'\[[^,]+,[^\]]+\]', '[0x1p+10,0x1p+10]', m[8], count=1)
                    line = line.replace(m[8], pairs)
                elif name == 'changed reserve':
                    line = line.replace('reserve=' + m[6], 'reserve=0x0p+0')
                else:
                    line = line.replace('w=[' + m[2] + ',' + m[3] + ']', 'w=[0x1p+0,0x1p+0]')
                row['leaves'][0] = line
            source.write_text(json.dumps(data))
            try:
                v.combine([source], output)
            except (AssertionError, ValueError):
                print('PASS rejected', name)
            else:
                raise RuntimeError('accepted ' + name)
            assert not output.exists()
    subprocess.run([sys.executable, '-I', str(HERE / 'joint_family.py')], check=True)
    for script in ('verify.py', 'joint_family.py', 'test_receipts.py'):
        for opt in ('-O', '-OO'):
            assert subprocess.run([sys.executable, '-I', opt, str(HERE / script)],
                                  capture_output=True).returncode != 0
    print('PASS receipt and scalar checks; fresh quadrature is separate')


if __name__ == '__main__':
    main()
