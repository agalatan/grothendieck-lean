#!/usr/bin/env python3
"""Agent-ID: codex-a7c4. Refs #431. Complex neighborhoods of direct real boxes.
The radius applies to directly certified leaves, not automatically to every
inherited-region leaf. All statements require the full real-plane audit first.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

if not __debug__:
    raise RuntimeError('Assertions must be enabled')
HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('central',HERE/'verify.py')
v = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v)


def radius_for_margin(margin):
    assert margin > 0
    radius = v.F(1)
    while 18*radius >= margin:
        radius /= 2
    assert radius <= 1 and 18*radius < margin
    return radius


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('receipts',type=Path)
    parser.add_argument('--output',type=Path,required=True)
    args = parser.parse_args()
    # The imaginary increment adds a nonnegative Q0, shift and quartic target.
    assert v.QA > 0 and v.QB > 0 and v.QA*v.QB-v.QC*v.QC > 0
    # Convexity and 0<=R(D)<=C||D||^2 imply R(Y)-R(X)<=4C||Y||||Y-X||.
    # For X real, ||X||^2<=2 and ||Im Y||<=delta<=1, ||Y||<2.
    c = v.F(217,100)
    assert 8*c < 18
    seen = set()
    minimum = None
    count = 0
    radius_counts = {}
    receipts = []
    for path in sorted(args.receipts.glob('region-*.json')):
        data = json.loads(path.read_text())
        index = v.validate(data)
        assert index not in seen
        seen.add(index)
        curvature = v.curvature_bounds(index,data['curvature'])
        points = {tuple(map(v.F,row[:4])):v.hex_fraction(row[4])-v.target(*map(v.F,row[:4]))
                  for row in data['points']}
        for chart,root,steps,kind in data['leaves']:
            if kind != 'c':
                continue
            lo,hi = v.amplitude_roots()[root]
            cell = (v.F(index,16),v.F(index+1,16),v.F(-1),v.F(1),lo,hi)
            for digit in steps:
                step = int(digit)
                cell = v.split(cell,step//2)[step%2]
            margin = -max(points[k] for k in v.corners(chart,cell))-sum(v.errors(chart,cell,curvature))
            assert margin > 0
            minimum = margin if minimum is None else min(minimum,margin)
            radius = radius_for_margin(margin)
            radius_counts[radius] = radius_counts.get(radius,0)+1
            count += 1
        receipts.append({'index':index,'sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
    assert seen == set(range(20)) and minimum is not None
    radius = radius_for_margin(minimum)
    assert radius <= 1 and 8*c*radius < minimum
    assert min(radius_counts) == radius and sum(radius_counts.values()) == count
    result = {'agent_id':'codex-a7c4','status':'PASS complex neighborhoods of direct real boxes only',
              'direct_boxes':count,'minimum_normalized_margin':str(minimum),
              'imaginary_direction_norm_radius':str(radius),
              'per_leaf_radius_rule':'largest dyadic radius <= 1 with 18*radius < leaf margin',
              'per_leaf_radius_counts':[[str(r),n] for r,n in sorted(radius_counts.items())],
              'extension_cost_upper':str(8*c*radius),'complete_complex_interior':False,
              'receipts':receipts,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(result['status'],'boxes',count,'radius',radius,flush=True)


if __name__ == '__main__':
    main()
