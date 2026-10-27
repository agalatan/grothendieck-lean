#!/usr/bin/env python3
"""Prepare an inactive row12 Lean overlay; native verification belongs to CI.

Consumes explicitly adopted row12 proposals and separate anchored recipes. It
never edits the running research tree, public proof roots or shared grid source.
"""
from pathlib import Path
import argparse
import contextlib
import hashlib
import importlib.util
import io
import json
import os
import re
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
PLAN = Path('data/caps-m/plan/row-certificates')
DEFAULT_OUT = Path('handoff/caps-centre/row12-candidate')
GRIDS = [(400,128,'1/50'), (1600,256,'1/200'), (1600,1024,'1/200'),
         (1600,1152,'1/200'), (3200,256,'1/400')]


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True)+'\n').encode()


def module(name):
    spec=importlib.util.spec_from_file_location('row_candidate_'+name, ROOT/'tools'/f'{name}.py')
    value=importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def row_assembly(indices, ranges):
    imports=['import Grothe.LowerAnalytic.CapRows',
             'import Grothe.LowerAnalytic.CapRow12.Recipes']
    imports += [f'import Grothe.LowerAnalytic.CapRow12.AnchorRange{n:02d}' for n in range(len(ranges))]
    imports += [f'import Grothe.LowerAnalytic.CapPieces.N12x{i}' for i in indices]
    lines=imports+['', '/-! Row12 candidate assembly: native prerequisites remain unverified until CI. -/',
        '', 'open GrotheKernel Grothe.Lower', '', 'namespace Grothe.LowerAnalytic', '',
        'private theorem row12LocalizedCaps : ExclCaps 12 row12LocalizedExclusions := by',
        '  intro i hmem _hi',
        '  simp only [row12LocalizedExclusions, List.mem_cons, List.not_mem_nil, or_false] at hmem',
        '  rcases hmem with '+' | '.join('rfl' for _ in indices)]
    for i in indices:
        lines += [f'  · simpa only [NodeCap] using (nodeCap_12x{i} (by simp))']
    cuts=[hi for _,hi in ranges[:-1]]
    cases=[f'i < {cuts[0]}']+[f'({lo} ≤ i ∧ i < {hi})' for lo,hi in ranges[1:-1]]+[f'{ranges[-1][0]} ≤ i']
    pats=['h']+['⟨h1, h2⟩']*(len(ranges)-2)+['h']
    lines += ['', '/-- The vertex caps of row index12, after all generated native prerequisites pass. -/',
        'theorem vertexCapsRow12 : VertexCapsRow 12 := by', '  intro i hi hc',
        '  rcases (show '+' ∨ '.join(cases)+' by omega) with '+' | '.join(pats),
        '  · exact nodeCap_of_rangeOK row12AnchorRange00 row12LocalizedCaps (Nat.zero_le _) h hi hc']
    for n in range(1,len(ranges)-1):
        lines += [f'  · exact nodeCap_of_rangeOK row12AnchorRange{n:02d} row12LocalizedCaps h1 h2 hi hc']
    lines += [f'  · exact nodeCap_of_rangeOK row12AnchorRange{len(ranges)-1:02d} row12LocalizedCaps h hi hi hc',
              '', 'end Grothe.LowerAnalytic', '']
    return '\n'.join(lines).encode()


def render(base_ref=None):
    names=[PLAN/n for n in ('row12.json','row12-pieces.json','row12-selection.json','row12-anchors.json','row12-generation.json')]
    payloads={str(p):(ROOT/p).read_bytes() for p in names}
    config=json.loads(payloads[str(names[4])])
    require(config.get('row')==12 and config.get('piece_chunk')==4 and config.get('anchor_range_size')==16,
            'Unsupported row generation configuration')
    require(config.get('certificate_grids')==[list(g) for g in GRIDS], 'Generation grid configuration differs')
    base_ref=base_ref or config['canonical_base']
    base=subprocess.check_output(['git','rev-parse',base_ref+'^{commit}'],cwd=ROOT,text=True).strip()
    adoption=json.loads(payloads[str(names[0])])
    require(adoption.get('format')=='caps-row-certificate-plan/v1' and adoption.get('row')==12
            and adoption.get('row_complete_research_gate') is True and adoption.get('cap_up')=='0'
            and adoption.get('status')=='prepared_proposals_not_native_verified', 'Wrong or incomplete row adoption plan')
    for label,name in (('pieces',names[1]),('selection',names[2])):
        binding=adoption['outputs'][label]
        require(binding['file']==name.name and binding['sha256']==sha(payloads[str(name)]),
                'Piece/selection bytes differ from exact adopted plan: '+label)
    expected_grids=[{'index':i,'tuple':list(g)} for i,g in enumerate(GRIDS)]
    require(adoption['grid_catalogue']['entries']==expected_grids, 'Adopted exact grid catalogue differs')
    nodes=json.loads(payloads[str(names[1])]);selection=json.loads(payloads[str(names[2])])
    original=json.loads((ROOT/'data/caps-m-pieces/pieces.json').read_text())
    expected={n['i'] for n in original if n['k']==12}
    require(len(nodes)==88 and {n['i'] for n in nodes}==expected and all(n['k']==12 for n in nodes),
            'Candidate must contain exactly all88 row12 localized nodes')
    require(sum(len(n['pieces']) for n in nodes)==4562,'Candidate must retain all4562 row12 pieces')
    require(set(selection)=={f'12:{i}' for i in expected},'Selection must cover row12 exactly')
    for n in nodes:
        item=selection[f"12:{n['i']}"]
        require(item.get('excl')==[] and len(item['grids'])==len(n['pieces']), 'No omitted piece or grid')
        require(type(item['chunk']) is int and item['chunk']>0,'Invalid piece chunk')
        require(item['chunk']==config['piece_chunk'],'Piece chunk differs from generation configuration')
        require(all(type(g) is int and 0<=g<len(GRIDS) for g in item['grids']),'Unregistered exact grid')
    anchor=module('gen_cap_row_anchors')
    anchor_plan=json.loads(payloads[str(names[3])])
    require(anchor_plan==anchor.build_plan(ROOT),'Anchored plan no longer binds canonical inputs')
    outputs={str(p):data for p,data in anchor.lean_outputs(anchor_plan).items()}
    piece=module('gen_cap_pieces')
    with tempfile.TemporaryDirectory(prefix='row12-candidate-') as temp:
        piece.ROOT=temp
        with contextlib.redirect_stdout(io.StringIO()):
            piece.write_nodes(str(ROOT/names[1]),str(ROOT/names[2]))
        outputs.update({str(p.relative_to(temp)):p.read_bytes() for p in Path(temp).rglob('*.lean')})
    # These are candidate overlays, never writes to public pinned/shared modules.
    def canonical(name):
        return subprocess.check_output(['git','show',base+':'+name],cwd=ROOT).decode()
    range_path='Grothe/LowerAnalytic/CapPieceRange.lean'
    source=canonical(range_path)
    old='def pieceGrids : List (ℕ × ℕ × ℚ) := [(400, 128, 1 / 50), (1600, 256, 1 / 200), (1600, 1024, 1 / 200)]'
    new=old[:-1]+', (1600, 1152, 1 / 200), (3200, 256, 1 / 400)]'
    require(source.count(old)==1,'Canonical grid definition changed; review overlay')
    outputs[range_path]=source.replace(old,new).replace(
        '/-- The grids of the pieces: `400 × 128`, `1600 × 256`, `1600 × 1024` on `[0, 8]`. -/',
        '/-- Stable certificate grids on `[0, 8]`, including both exact research refinements. -/').encode()
    nodes_path='Grothe/LowerAnalytic/CapPieceNodes.lean'
    source=canonical(nodes_path);old='rcases hG with rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num'
    require(source.count(old)==1,'Canonical grid soundness proof changed; review overlay')
    outputs[nodes_path]=source.replace(old,'rcases hG with rfl | rfl | rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num').encode()
    # 25anchor ranges over396indices; final native fact has symbolic upper length.
    ranges=[(lo,min(lo+16,396)) for lo in range(0,396,16)]
    outputs['Grothe/LowerAnalytic/CapRow12/Assembly.lean']=row_assembly(sorted(expected),ranges)
    native=[];compute_roots=[]
    for name,data in sorted(outputs.items()):
        if not name.endswith('.lean'):
            continue
        text=data.decode()
        facts=re.findall(r'^theorem\s+([A-Za-z0-9_]+)\s*:[\s\S]*?(?=\n(?:theorem|end)\b|\Z)',text,re.M)
        if re.search(r':=\s*by\s+native_decide\b',text):
            require(len(facts)==1,'Expected one sequential native fact per leaf: '+name)
            native += ['Grothe.LowerAnalytic.'+facts[0]]
            compute_roots += [name]
    meta={'agent_id':'codex-15b7','format':'caps-row-lean-candidate/v1','row_index':12,
        'scope':'Inactive generated Lean proposal overlay; no native verification, activation, row proof or cache claim.',
        'canonical_base':base,
        'localized_nodes':88,'localized_pieces':4562,'anchored_vertices':223,'row_nodes':396,
        'certificate_grids':GRIDS,'inputs_sha256':{n:sha(b) for n,b in payloads.items()},
        'generators_sha256':{n:sha((ROOT/n).read_bytes()) for n in ('tools/gen_cap_row_candidate.py','tools/gen_cap_pieces.py','tools/gen_cap_row_anchors.py','tools/caps_row_plan.py')},
        'native_declarations':sorted(native),'compute_roots':sorted(compute_roots),
        'required_declarations':['Grothe.LowerAnalytic.vertexCapsRow12'],
        'new_modules_excluded_until_activation':[n for n in sorted(outputs) if n.endswith('.lean') and n not in (range_path,nodes_path)],
        'overlaid_shared_modules':[range_path,nodes_path],
        'files_sha256':{n:sha(b) for n,b in sorted(outputs.items())},
        'remaining_global_rows':[13,14,15],'native_verified':False,'activated':False}
    outputs['row12-candidate.json']=encoded(meta)
    return outputs,meta


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out',type=Path,default=DEFAULT_OUT)
    parser.add_argument('--base',help='Explicit canonical commit; defaults to durable row12-generation.json')
    parser.add_argument('--check',action='store_true')
    args=parser.parse_args()
    target=(ROOT/args.out).resolve()
    require(target.is_relative_to(ROOT/'handoff/caps-centre') and target!=ROOT/'handoff/caps-centre',
            'Candidate output must be a dedicated owned handoff directory')
    outputs,meta=render(args.base)
    resolved_outputs=[]
    for name in outputs:
        resolved=(target/name).resolve()
        require(resolved.is_relative_to(target) and resolved!=target,
                'Candidate output escapes through a nested path or symlink: '+name)
        resolved_outputs.append(resolved)
    require(len(resolved_outputs)==len(set(resolved_outputs)), 'Candidate output paths alias one another')
    expected_lean={n for n in outputs if n.endswith('.lean')}
    actual_lean={str(p.relative_to(target)) for p in target.rglob('*.lean')} if target.exists() else set()
    require(not actual_lean-expected_lean,'Unexpected stale candidate Lean files; preserve and review')
    if args.check:
        require(all((target/n).is_file() and (target/n).read_bytes()==data for n,data in outputs.items()),
                'Generated candidate differs or is missing')
    else:
        require(all(not (target/n).exists() or (target/n).read_bytes()==data for n,data in outputs.items()),
                'Existing candidate differs; preserve and use a NEW --out directory')
        for name,data in outputs.items():
            path=target/name;path.parent.mkdir(parents=True,exist_ok=True)
            require(path.resolve().is_relative_to(target),'Candidate output parent changed: '+name)
            require(not path.exists() or path.read_bytes()==data,'Existing candidate differs; preserve and use NEW --out: '+str(path))
            if not path.exists():
                with path.open('xb') as stream:
                    stream.write(data);stream.flush();os.fsync(stream.fileno())
    print(json.dumps({'row':12,'localized_nodes':88,'localized_pieces':4562,'anchors':223,
        'native_facts_prepared':len(meta['native_declarations']),'files':len(outputs),'output':str(target),
        'checked':args.check,'native_verified':False}))


if __name__=='__main__':
    main()
