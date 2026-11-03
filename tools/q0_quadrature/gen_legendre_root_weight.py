#!/usr/bin/env python3
"""Join selected original recurrence roots to checked formula weight bounds.
Agent-ID: codex-aa04. Gauss rule exactness/identity remains separate.
"""
from fractions import Fraction as Q
from pathlib import Path
import hashlib,json,sys
ROOT=Path(__file__).resolve().parents[2]; INPUT=ROOT/'data/q0_quadrature/gauss_mass/gauss_rules_certified.json'; OUT=ROOT/'Grothe/UpperChaos'
SHA='1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1'; D=2**640

def generate():
 raw=INPUT.read_bytes(); assert hashlib.sha256(raw).hexdigest()==SHA
 rules=json.loads(raw)['rules']; files={}
 for n in range(1,65):
  name=f'Q0LegendreRootWeightRule{n:02d}'; rule=f'Grothe.UpperChaos.Q0LegendreRule{n:02d}'; wr=f'Grothe.UpperChaos.Q0LegendreWeightRule{n:02d}'
  dep='Q0GaussPhysical' if n==1 else f'Q0LegendreRootWeightRule{n-1:02d}'
  lines=[f'import Grothe.UpperChaos.{dep}',f'import {rule}',f'import {wr}','',
   '/-! Actual selected recurrence roots satisfy checked formula-weight bounds.',
   'Gauss-rule identity and original integration error remain separate.',
   'Agent-ID: codex-aa04. -/',f'namespace Grothe.UpperChaos.{name}','',
   'open Grothe.UpperChaos.Q0LegendreInteger Grothe.UpperChaos.Q0LegendreRuleBase','']
  for i,row in enumerate(rules[str(n)]):
   lo=Q(row['node_lower'])*D; hi=Q(row['node_upper'])*D
   assert lo.denominator==hi.denominator==1
   lo,hi=lo.numerator,hi.numerator; tag=f'r{i:02d}'
   cast_rules=['denominator','Int.cast_pow','Int.cast_ofNat']
   if lo < 0 or hi < 0: cast_rules.append('Int.cast_neg')
   if abs(lo)==1 or abs(hi)==1: cast_rules.append('Int.cast_one')
   cast_simp=', '.join([f'{wr}.{tag}Input']+cast_rules)
   lines += [f'theorem bound{tag} {{x : ℝ}}',
     f'    (hx : x ∈ Set.Icc ((({lo} : ℤ) : ℝ) / denominator) ((({hi} : ℤ) : ℝ) / denominator)) :',
     f'    weight {n-1} x ≤ ({wr}.{tag}Upper : ℝ) := by',
     f'  apply {wr}.{tag}Bound',
     f'  have hle : (({lo} : ℤ) : ℚ) / denominator ≤ (({hi} : ℤ) : ℚ) / denominator := by',
     f'    simpa only [{cast_simp}] using {wr}.{tag}Input.le',
     f'  have hmem := mem_rational_interval_of_integer_bracket ({lo}) ({hi}) denominator hle hx',
     f'  simpa only [{cast_simp}] using hmem','',
     f'theorem root{tag} :',
     f'    ∃ x ∈ Set.Icc ((({lo} : ℤ) : ℝ) / denominator) ((({hi} : ℤ) : ℝ) / denominator),',
     f'      (realPair x {n-1}).2 = 0 ∧ weight {n-1} x ≤ ({wr}.{tag}Upper : ℝ) := by',
     f'  obtain ⟨x, hx, hr⟩ := {rule}.root{i:02d}',
     f'  exact ⟨x, hx, hr, bound{tag} hx⟩','']
  lines += [f'end Grothe.UpperChaos.{name}','']
  files[OUT/(name+'.lean')]='\n'.join(lines).encode()
 lines=['import Grothe.UpperChaos.Q0LegendreRootWeightRule64','import Lean.Util.CollectAxioms','import Lean.Elab.Command','',
  '/-! Strict audit of actual recurrence-root/formula-weight joins. Agent-ID: codex-aa04. -/',
  'open Lean Elab Command','']
 for n in range(1,65):
  targets=[f'``Grothe.UpperChaos.Q0LegendreRootWeightRule{n:02d}.rootr{i:02d}' for i in range(n)]
  lines += ['run_cmd do','  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
   '  let targets : Array Name := #[','    '+',\n    '.join(targets)+']','  for target in targets do',
   '    let dependencies ← Lean.collectAxioms target','    logInfo m!"Legendre root-weight audit {target}: {dependencies}"',
   '    for dependency in dependencies do','      unless allowed.contains dependency do',
   '        throwError m!"{target} uses unexpected axiom {dependency}"','']
 files[OUT/'Q0LegendreRootWeightRulesAudit.lean']='\n'.join(lines).encode()
 return files
if __name__=='__main__':
 files=generate()
 if sys.argv[1:]==['--check']:
  for p,b in files.items(): assert p.read_bytes()==b,p
 elif not sys.argv[1:]:
  for p,b in files.items(): p.write_bytes(b)
 else: raise SystemExit('usage: gen_legendre_root_weight.py [--check]')
 print(f'{len(files)} generated root-weight modules, {sum(map(len,files.values()))} bytes')
