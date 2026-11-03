#!/usr/bin/env python3
"""Generate LeanCert enclosures of formula weights on source root brackets.
Agent-ID: codex-aa04. Actual Gauss-rule identity remains separate.
"""
from fractions import Fraction as Q
from pathlib import Path
import hashlib,json,sys
ROOT=Path(__file__).resolve().parents[2]
INPUT=ROOT/'data/q0_quadrature/gauss_mass/gauss_rules_certified.json'
OUT=ROOT/'Grothe/UpperChaos'
SHA='1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1'
D=2**640; B=2**256; PREC=10**30

def generate():
 raw=INPUT.read_bytes(); assert hashlib.sha256(raw).hexdigest()==SHA
 rules=json.loads(raw)['rules']; assert sorted(map(int,rules))==list(range(1,65))
 files={}
 for n in range(1,65):
  entries=rules[str(n)]; assert len(entries)==n
  name=f'Q0LegendreWeightRule{n:02d}'
  dep='Q0LegendreWeightCert' if n==1 else f'Q0LegendreWeightRule{n-1:02d}'
  lines=[f'import Grothe.UpperChaos.{dep}','','/-! Generated LeanCert formula-weight enclosures.',
   'Actual Gauss rule and original fine weight intervals remain separate.',
   'Agent-ID: codex-aa04. -/','open LeanCert.Core','',
   f'namespace Grothe.UpperChaos.{name}','','open Grothe.UpperChaos.Q0LegendreInteger','']
  for i,row in enumerate(entries):
   lo=Q(row['node_lower'])*D;hi=Q(row['node_upper'])*D
   assert lo.denominator==hi.denominator==1
   source=Q(row['weight_upper']); w=-(-source.numerator*PREC//source.denominator)
   low=(Q(row['node_lower'])*B).__floor__(); tag=f'r{i:02d}'
   lines += [f'def {tag}Input : IntervalRat :=',
     f'  ⟨({lo.numerator} : ℚ) / 2^640, ({hi.numerator} : ℚ) / 2^640, by decide +kernel⟩',
     f'def {tag}Interval : IntervalDyadic := IntervalDyadic.ofIntervalRat {tag}Input (-256)',
     f'def {tag}Upper : ℚ := {w} / 10^30','',
     f'theorem {tag}Lower : {tag}Interval.lo.toRat = ({low} : ℚ) / 2^256 := by decide +kernel',
     f'theorem {tag}Checked : weightCheck {n-1} {tag}Interval {tag}Upper = true := by decide +kernel',
     f'theorem {tag}Bound {{x : ℝ}} (hx : x ∈ {tag}Input) : weight {n-1} x ≤ ({tag}Upper : ℝ) := by',
     f'  exact weightCheck_sound {n-1} {tag}Interval {tag}Upper {tag}Checked',
     '    (IntervalDyadic.mem_ofIntervalRat hx (-256) (by decide))','']
  lines += [f'end Grothe.UpperChaos.{name}','']
  files[OUT/(name+'.lean')]='\n'.join(lines).encode()
 lines=['import Grothe.UpperChaos.Q0LegendreWeightRule64','import Lean.Util.CollectAxioms',
   'import Lean.Elab.Command','','/-! Full normalized weight audit. Agent-ID: codex-aa04. -/',
   'open Lean Elab Command','']
 for n in range(1,65):
  targets=[f'``Grothe.UpperChaos.Q0LegendreWeightRule{n:02d}.r{i:02d}{suffix}'
           for i in range(n) for suffix in ('Lower','Bound')]
  if n == 1: targets += ['``Grothe.UpperChaos.Q0LegendreInteger.weightCheck_sound']
  lines += ['run_cmd do',
   '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
   '  let targets : Array Name := #[','    '+',\n    '.join(targets)+']',
   '  for target in targets do','    let dependencies ← Lean.collectAxioms target',
   '    logInfo m!"Legendre weight audit {target}: {dependencies}"',
   '    for dependency in dependencies do','      unless allowed.contains dependency do',
   '        throwError m!"{target} uses unexpected axiom {dependency}"','']
 files[OUT/'Q0LegendreWeightRulesAudit.lean']='\n'.join(lines).encode()
 return files
if __name__=='__main__':
 files=generate()
 if sys.argv[1:]==['--check']:
  for path,b in files.items(): assert path.read_bytes()==b,path
 elif not sys.argv[1:]:
  for path,b in files.items(): path.write_bytes(b)
 else: raise SystemExit('usage: gen_legendre_weight_rules.py [--check]')
 print(f'{len(files)} weight-rule modules, {sum(map(len,files.values()))} bytes')
