#!/usr/bin/env python3
"""Generate bounded exact physical-row and certified-mass projection checks.
Agent-ID: codex-aa04. Actual Gauss-rule identity remains separate.
"""
from fractions import Fraction as Q
from pathlib import Path
import hashlib,json,sys
ROOT=Path(__file__).resolve().parents[2]; DATA=ROOT/'data/q0_quadrature/gauss_mass'; OUT=ROOT/'Grothe/UpperChaos'
FILES={'gauss_rules_certified.json':'1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1',
 'panels_N601_Q64_cap1e20.json':'59a4f5fda639d83959a55a3a85e355c4f233312ea65d349e502761ae38a34e1d',
 'rounded_node_mass.json':'acb8e33d8271ba5bd8369cc04fcb23788413e2af9ae0bcdce1464bd82c8bfa6e'}
CHUNK=128; GROUP=8; B=2**256; P=10**30

def rat(x):
 x=Q(x); return f'(({x.numerator} : ℚ) / {x.denominator})'
def generate():
 for name,sha in FILES.items(): assert hashlib.sha256((DATA/name).read_bytes()).hexdigest()==sha
 rules=json.loads((DATA/'gauss_rules_certified.json').read_bytes())['rules']
 panels=json.loads((DATA/'panels_N601_Q64_cap1e20.json').read_bytes())['panels']
 candidates=json.loads((DATA/'rounded_node_mass.json').read_bytes())['records']
 schedule=[(pi,ri) for pi,p in enumerate(panels) for ri in range(p['order'])]
 assert len(candidates)==len(schedule)==21577
 assert all((r[0],r[1])==s for r,s in zip(candidates,schedule))
 files={}
 for start in range(0,len(candidates),CHUNK*GROUP):
  group=start//(CHUNK*GROUP); name=f'Q0GaussPhysicalGroup{group:03d}'
  dep='Q0GaussPhysicalCheck' if group==0 else f'Q0GaussPhysicalGroup{group-1:03d}'
  target=f'Grothe.UpperChaos.Q0NodeMassGroup{group:03d}'
  lines=[f'import Grothe.UpperChaos.{dep}',f'import {target}','',
   '/-! Generated candidate panel comparisons. Actual quadrature identity',
   'and exact source input binding remain separate. Agent-ID: codex-aa04. -/',
   f'namespace Grothe.UpperChaos.{name}','','open Grothe.UpperChaos.Q0GaussPhysicalCheck','']
  chunks=[]
  for ci,offset in enumerate(range(start,min(start+CHUNK*GROUP,len(candidates)),CHUNK)):
   seq=candidates[offset:offset+CHUNK]; chunks.append(ci)
   lines += [f'def rows{ci} : List Row := [']
   for index,(pi,ri,node,w,term) in enumerate(seq,offset):
    panel=panels[pi]; rule=rules[str(panel['order'])][ri]; lo,hi=Q(panel['lo']),Q(panel['hi'])
    raw=Q(rule['node_lower']); nlo=Q((raw*B).__floor__(),B)
    u=Q(rule['weight_upper']); up=Q(-(-u.numerator*P//u.denominator),P)
    assert 0<=lo<hi and Q(node,10**9)<=lo+(hi-lo)/2*(1+nlo)
    assert (hi-lo)/2*up<=Q(w,10**12)
    lines.append(f'  ⟨{index}, {pi}, {ri}, {rat(lo)}, {rat(hi)}, {rat(nlo)}, {rat(up)}, {node}, {w}⟩'+(',' if index+1<offset+len(seq) else ''))
   lines += [']','',f'theorem checked{ci} : rows{ci}.all valid = true := by decide +kernel',
    f'theorem projection{ci} :',
    f'    rows{ci}.map (fun r => (r.index, r.panel, r.rule, r.physicalLower, r.physicalUpperWeight)) =',
    f'      ({target}.rows{ci}).map (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)) := by',
    '  decide +kernel','']
  many=len(chunks)>1; join=' ++ '.join(f'rows{i}' for i in chunks)
  lines += [f'def rows : List Row := {join}','',
   'theorem checked : rows.all valid = true := by',
   '  simp only [rows, '+', '.join((['List.all_append'] if many else [])+[f'checked{i}' for i in chunks]+(['Bool.and_self'] if many else []))+']','',
   'theorem projection :',
   '    rows.map (fun r => (r.index, r.panel, r.rule, r.physicalLower, r.physicalUpperWeight)) =',
   f'      ({target}.rows).map (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)) := by',
   '  simp only [rows, '+target+'.rows, '+', '.join((['List.map_append'] if many else [])+[f'projection{i}' for i in chunks])+']','',
   f'end Grothe.UpperChaos.{name}','']
  files[OUT/(name+'.lean')]='\n'.join(lines).encode()
 refs=[f'Grothe.UpperChaos.Q0GaussPhysicalGroup{i:03d}' for i in range((len(candidates)+CHUNK*GROUP-1)//(CHUNK*GROUP))]
 lines=[f'import {refs[-1]}','import Grothe.UpperChaos.Q0NodeMassAll','',
  '/-! Complete candidate physical checks; quadrature/source semantics are',
  'still separate. Agent-ID: codex-aa04. -/',
  'namespace Grothe.UpperChaos.Q0GaussPhysicalAll','','open Grothe.UpperChaos.Q0GaussPhysicalCheck','',
  'def rows : List Row := '+' ++ '.join(r+'.rows' for r in refs),'',
  'theorem checked : rows.all valid = true := by',
  '  simp only [rows, List.all_append, '+', '.join(r+'.checked' for r in refs)+', Bool.and_self]','',
  'theorem each_valid (r : Row) (hr : r ∈ rows) : valid r = true := (List.all_eq_true.mp checked) r hr','',
  'theorem projection :',
  '    rows.map (fun r => (r.index, r.panel, r.rule, r.physicalLower, r.physicalUpperWeight)) =',
  '      (Grothe.UpperChaos.Q0NodeMassAll.rows).map (fun r => (r.index, r.panel, r.rule, r.nodeLower, r.weightUpper)) := by',
  '  simp only [rows, Grothe.UpperChaos.Q0NodeMassAll.rows, List.map_append, '+', '.join(r+'.projection' for r in refs)+']','',
  'end Grothe.UpperChaos.Q0GaussPhysicalAll','']
 files[OUT/'Q0GaussPhysicalAll.lean']='\n'.join(lines).encode()
 targets=[f'``{r}.{x}' for r in refs for x in ('checked','projection')]+[f'``Grothe.UpperChaos.Q0GaussPhysicalAll.{x}' for x in ('checked','each_valid','projection')]+['``Grothe.UpperChaos.Q0GaussPhysicalCheck.valid_sound','``Grothe.UpperChaos.Q0GaussPhysicalCheck.actual_of_checks']
 audit=['import Grothe.UpperChaos.Q0GaussPhysicalAll','import Lean.Util.CollectAxioms','import Lean.Elab.Command','',
  '/-! Full physical candidate audit. Agent-ID: codex-aa04. -/','open Lean Elab Command','run_cmd do',
  '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
  '  let targets : Array Name := #[','    '+',\n    '.join(targets)+']',
  '  for target in targets do','    let dependencies ← Lean.collectAxioms target',
  '    logInfo m!"Gauss physical audit {target}: {dependencies}"',
  '    for dependency in dependencies do','      unless allowed.contains dependency do',
  '        throwError m!"{target} uses unexpected axiom {dependency}"','']
 files[OUT/'Q0GaussPhysicalAllAudit.lean']='\n'.join(audit).encode()
 return files
if __name__=='__main__':
 files=generate()
 if sys.argv[1:]==['--check']:
  for p,b in files.items(): assert p.read_bytes()==b,p
 elif not sys.argv[1:]:
  for p,b in files.items(): p.write_bytes(b)
 else: raise SystemExit('usage: gen_gauss_physical_groups.py [--check]')
 print(f'{len(files)} generated modules, {sum(map(len,files.values()))} bytes')
