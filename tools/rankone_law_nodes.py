#!/usr/bin/env python3
"""Bind a checked explicit source-node table to the exact law interface.

The node cap proofs are an explicit input premise. The hull, tail, hashes and
PAD accounting are independently recomputed here; no Gaussian integration is
claimed by this adapter.
"""
import argparse
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import sys

sys.dont_write_bytecode=True
spec=importlib.util.spec_from_file_location('rankone_law',Path(__file__).with_name('rankone_law.py'))
L=importlib.util.module_from_spec(spec);spec.loader.exec_module(L)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--nodes',type=Path,required=True)
    p.add_argument('--bank',type=Path,required=True)
    p.add_argument('--row',type=int,required=True)
    p.add_argument('--inherited',type=Path,default=Path('handoff/lower-stein/cert-jointmoment-lifted-codex/inherited.json'))
    p.add_argument('--out',type=Path,required=True)
    a=p.parse_args();table=json.loads(a.nodes.read_text());bank=json.loads(a.bank.read_text())
    inh=json.loads(a.inherited.read_text());row=inh['rows'][a.row]
    old=L.source_from_table(row['table'],row['smax'],Q(row['delta']))
    PAD=Q(1,10**11)
    raw={'A':bank['semiconvex_coefficient'],
         'nodes':[{'r':n['r'],'G':str(Q(n['cap'])-PAD),'f':n['scalar_f']} for n in table['nodes']],
         'tail':{'start':table['nodes'][-1]['r'],'coefficients':list(map(str,old.at(Q(table['nodes'][-1]['r'])))),'f':'0'}}
    new,hull=L.lifted_source(raw)
    doc={'format':'rankone-source-selection/v1','row_index':a.row,'row':bank['row'],
         'old_source_pieces':old.encode(),'new_source_pieces':new.encode(),
         'source_proof_obligations':['Every explicit node bounds F(r,f) by its effective cap; the referenced analytic node-table checker and its Gaussian premises supply this proof.',
             'The joint convexity of F+A*r² gives the lifted hull for interpolated scalar tests, with A=c²/d from the same fixed row/test geometry.'],
         'source_pad_ledger':{'external_PAD':str(PAD),'multiplicity':1,
             'identity':'Use H=F-PAD. Node G=effective_cap-PAD bounds H, so its lifted hull plus the single external PAD bounds F. The old f=0 tail is raw table plus that same PAD.'},
         'construction':{'kind':'lifted-node-table','node_table':str(a.nodes),'node_table_sha256':L.sha(a.nodes),
              'bank':str(a.bank),'bank_sha256':L.sha(a.bank),'inherited':str(a.inherited),'inherited_sha256':L.sha(a.inherited)},
         'summary':{'explicit_nodes':len(table['nodes']),'lifted_hull_nodes':len(hull),'source_cells':len(new.pieces)}}
    L.write_json(a.out,doc);L.verify_source_selection(doc)
    print(json.dumps({'status':'PASS_EXACT_SOURCE_HULL_CONDITIONAL_ON_NODE_CAPS',**doc['summary'],'selection':str(a.out),'sha256':L.sha(a.out)},indent=2))


if __name__=='__main__':
    L.require(__debug__,'Do not use -O or -OO');main()
