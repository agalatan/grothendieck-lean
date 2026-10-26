"""Compact a midcaps output file for the handoff: the exact piece quadratics (huge rationals, recomputed by the replay anyway) are replaced
by their float values (field q_float, information only) and the LDL pivot is dropped.  usage: compact.py in.json out.json"""
import sys, json
from fractions import Fraction as F
D = json.load(open(sys.argv[1]))
for nd in D['nodes']:
    for p in nd['pieces']:
        if 'q' in p: p['q_float'] = [float(F(x)) for x in p.pop('q')]
        p.pop('minpivot', None)
json.dump(D, open(sys.argv[2], 'w'), separators=(',', ':'))
