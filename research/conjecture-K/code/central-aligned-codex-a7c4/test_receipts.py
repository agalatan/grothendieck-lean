#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Exact auditor corruption controls.
Run with a directory containing all twenty freshly generated region receipts.
This exercises the auditor; it does not replace fresh source quadrature.
"""
import argparse
import copy
import importlib.util
import json
import math
from pathlib import Path
import subprocess
import sys
import tempfile

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('central',HERE/'verify.py')
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)


def reject(name, action):
    try:
        action()
    except (AssertionError,ValueError):
        print('PASS rejected',name)
    else:
        raise RuntimeError('accepted '+name)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('receipts',type=Path)
    args = parser.parse_args()
    paths = sorted(args.receipts.glob('region-*.json'))
    assert len(paths) == 20
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-central-tests-') as td:
        out = Path(td)/'combined.json'
        v.combine(paths,out)
        reject('missing shift region',lambda:v.combine(paths[:-1],out))
        reject('duplicate shift region',lambda:v.combine(paths+[paths[0]],out))
    good = json.loads(paths[9].read_text())
    v.validate(good)
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-chart-tests-') as td:
        out = Path(td)
        for c in range(4):
            part = copy.deepcopy(good)
            part.update(status=v.CHART,chart=c)
            part['leaves'] = [r for r in part['leaves'] if r[0] == c]
            v.validate(part,c)
            reject('single chart as full region',lambda:v.validate(part))
            (out/f"chart-{good['index']:02}-{c}.json").write_text(json.dumps(part))
        v.assemble_region(good['index'],out)
        assembled = json.loads((out/f"region-{good['index']:02}.json").read_text())
        assert assembled['points'] == good['points'] and assembled['leaves'] == good['leaves']
    leaf = next(r for r in good['leaves'] if r[3] == 'c')
    chart,root,path,_ = leaf
    lo,hi = v.amplitude_roots()[root]
    cell = (v.F(good['index'],16),v.F(good['index']+1,16),v.F(-1),v.F(1),lo,hi)
    for digit in path:
        step = int(digit)
        cell = v.split(cell,step//2)[step%2]
    key = v.corners(chart,cell)[0]
    point_index = next(i for i,r in enumerate(good['points']) if tuple(map(v.F,r[:4])) == key)
    cases = ['stale sources','negative region index','missing chart root','missing terminal box',
             'duplicate terminal box','duplicate point','missing corner','invalid inherited region',
             'changed curvature interval','invalid point enclosure','failed interpolation']
    for name in cases:
        data = copy.deepcopy(good)
        if name == 'stale sources':
            data['sha256'] = {}
        elif name == 'negative region index':
            data['index'] = -1
        elif name == 'missing chart root':
            data['leaves'] = [r for r in data['leaves'] if (r[0],r[1]) != (0,0)]
        elif name == 'missing terminal box':
            data['leaves'].remove(leaf)
        elif name == 'duplicate terminal box':
            data['leaves'].append(copy.deepcopy(leaf))
        elif name == 'duplicate point':
            data['points'].append(copy.deepcopy(data['points'][point_index]))
        elif name == 'missing corner':
            data['points'].pop(point_index)
        elif name == 'invalid inherited region':
            next(r for r in data['leaves'] if r == leaf)[3] = 'o'
        elif name == 'changed curvature interval':
            m = v.BASE_PATTERN.fullmatch(data['curvature'][0])
            assert m
            data['curvature'][0] = data['curvature'][0].replace('w=['+m[1]+','+m[2]+']','w=[0x0p+0,0x1p+1]')
        elif name == 'invalid point enclosure':
            data['points'][point_index][4] = '0x1p+20'
        else:
            target = v.target(*key)
            upper = float(target)
            while v.F(upper) >= target:
                upper = math.nextafter(upper,-math.inf)
            assert target-v.F(upper) < sum(v.errors(chart,cell,v.curvature_bounds(good['index'],good['curvature'])))
            data['points'][point_index][4] = upper.hex()
        reject(name,lambda:v.validate(data))
    archive_spec = importlib.util.spec_from_file_location('archive',HERE/'archive_receipts.py')
    archive = importlib.util.module_from_spec(archive_spec)
    archive_spec.loader.exec_module(archive)
    with tempfile.TemporaryDirectory(prefix='codex-a7c4-archive-tests-') as td:
        out = Path(td)
        raw = max(paths,key=lambda p:p.stat().st_size).read_bytes()
        index = v.validate(json.loads(raw))
        archive.pack_record(raw,out)
        header = out/f'region-{index:02}-header.json'
        assert archive.restore_record(header) == raw
        assert all(p.stat().st_size <= archive.LIMIT for p in out.iterdir())
        metadata = json.loads(header.read_text())
        chunk = out/metadata['chunks']['points'][0]['file']
        chunk.write_bytes(chunk.read_bytes()+b' ')
        reject('changed receipt archive chunk',lambda:archive.restore_record(header))
    for script in ('verify.py','test_receipts.py','phase_radius.py','archive_receipts.py'):
        for opt in ('-O','-OO'):
            result = subprocess.run([sys.executable,'-I',opt,str(HERE/script)],capture_output=True)
            assert result.returncode != 0 and b'Assertions must be enabled' in result.stderr
    print('PASS complete cover audit and corruption controls; source replay is separate')


if __name__ == '__main__':
    main()
