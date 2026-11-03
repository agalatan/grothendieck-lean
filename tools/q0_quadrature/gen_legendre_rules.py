#!/usr/bin/env python3
"""Generate the original dyadic brackets' sign, existence and order checks.
Agent-ID: codex-aa04. Quadrature/weight semantics remain separate.
"""
from fractions import Fraction as Q
from pathlib import Path
import hashlib, json, sys
ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT/'data/q0_quadrature/gauss_mass/gauss_rules_certified.json'
OUT = ROOT/'Grothe/UpperChaos'
SHA='1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1'
D=2**640

def generate():
    raw=INPUT.read_bytes()
    assert hashlib.sha256(raw).hexdigest()==SHA
    rules=json.loads(raw)['rules']
    assert sorted(map(int,rules)) == list(range(1,65))
    files={}
    for n in range(1,65):
        rows=rules[str(n)]
        assert len(rows)==n
        name=f'Q0LegendreRule{n:02d}'
        dep='Q0LegendreRuleBase' if n==1 else f'Q0LegendreRule{n-1:02d}'
        lines=[f'import Grothe.UpperChaos.{dep}', '',
          '/-! Generated original 640-bit root bracket checks.',
          'Gaussian quadrature and weight semantics remain separate.',
          'Agent-ID: codex-aa04. -/',f'namespace Grothe.UpperChaos.{name}', '',
          'open Grothe.UpperChaos.Q0LegendreInteger Grothe.UpperChaos.Q0LegendreRuleBase', '']
        pairs=[]
        for i,row in enumerate(rows):
            endpoints=[]
            for side in ('lower','upper'):
                X=Q(row['node_'+side])*D
                assert X.denominator==1
                sign=row[side+'_P_sign']
                assert sign in (-1,1)
                endpoints.append(X.numerator)
                expr=f'(integerPair ({X.numerator} : ℤ) denominator {n-1}).2'
                prop=f'0 < {expr}' if sign>0 else f'{expr} < 0'
                lines += [f'theorem sign{i:02d}_{side} : {prop} := by decide +kernel']
            lo,hi=endpoints
            assert -D < lo < hi < D and (not pairs or pairs[-1][1] < lo)
            pairs.append((lo,hi))
            left,right=f'sign{i:02d}_lower',f'sign{i:02d}_upper'
            orientation='Or.inl' if row['lower_P_sign'] < 0 else 'Or.inr'
            assert row['lower_P_sign'] == -row['upper_P_sign']
            pair=f'⟨le_of_lt {left}, le_of_lt {right}⟩' if orientation=='Or.inl' else f'⟨le_of_lt {right}, le_of_lt {left}⟩'
            lines += [f'theorem root{i:02d} :',
              f'    ∃ x ∈ Set.Icc ((({lo} : ℤ) : ℝ) / denominator) ((({hi} : ℤ) : ℝ) / denominator),',
              f'      (realPair x {n-1}).2 = 0 := by',
              f'  apply root_of_integer_endpoint_signs ({lo} : ℤ) ({hi} : ℤ) denominator',
              '  · exact denominator_pos', '  · norm_num', f'  · exact {orientation} {pair}', '']
        lines += ['def brackets : List (ℤ × ℤ) := [']
        lines += [f'  ({lo}, {hi})'+(',' if i+1<len(pairs) else '') for i,(lo,hi) in enumerate(pairs)]
        lines += [']', '',f'theorem count : brackets.length = {n} := by decide +kernel',
          'theorem bounded : brackets.all (fun p => decide (-denominator < p.1 ∧ p.1 < p.2 ∧ p.2 < denominator)) = true := by',
          '  decide +kernel',
          'theorem ordered : brackets.Pairwise (fun a b => a.2 < b.1) := by decide +kernel', '',
          'theorem exists_each (i : Fin brackets.length) :',
          f'    ∃ x ∈ Set.Icc (((brackets.get i).1 : ℝ) / denominator) (((brackets.get i).2 : ℝ) / denominator), (realPair x {n-1}).2 = 0 := by',
          '  fin_cases i']
        lines += [f'  · simpa [brackets] using root{i:02d}' for i in range(n)]
        lines += ['', f'def bracketAt (i : Fin {n}) : ℤ × ℤ :=',
          '  brackets.get ⟨i.val, by simpa only [count] using i.isLt⟩', '',
          f'theorem all_unique : ∃ root : Fin {n} → ℝ,',
          f'    (∀ i, root i ∈ Set.Icc (((bracketAt i).1 : ℝ) / denominator) (((bracketAt i).2 : ℝ) / denominator) ∧ (realPair (root i) {n-1}).2 = 0) ∧',
          f'    (∀ i x, x ∈ Set.Icc (((bracketAt i).1 : ℝ) / denominator) (((bracketAt i).2 : ℝ) / denominator) → (realPair x {n-1}).2 = 0 → x = root i) := by',
          f'  exact select_from_ordered_brackets {n-1} brackets count denominator denominator_pos ordered exists_each', '',
          f'end Grothe.UpperChaos.{name}', '']
        files[OUT/(name+'.lean')]='\n'.join(lines).encode()
    targets=[f'``Grothe.UpperChaos.Q0LegendreRule{n:02d}.{t}' for n in range(1,65)
             for t in ('count','bounded','ordered','exists_each','all_unique')]
    targets += [f'``Grothe.UpperChaos.Q0LegendreInteger.{t}' for t in
                ('integerPair_sound','root_of_integer_endpoint_signs','roots_exhausted',
                 'root_unique_in_disjoint_brackets','select_from_ordered_brackets')]
    audit=['import Grothe.UpperChaos.Q0LegendreRule64',
      'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
      '/-! Full original-bracket root audit. Agent-ID: codex-aa04. -/',
      'open Lean Elab Command', 'run_cmd do',
      '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
      '  let targets : Array Name := #[', '    '+',\n    '.join(targets)+']',
      '  for target in targets do',
      '    let dependencies ← Lean.collectAxioms target',
      '    logInfo m!"Legendre rules audit {target}: {dependencies}"',
      '    for dependency in dependencies do',
      '      unless allowed.contains dependency do',
      '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    files[OUT/'Q0LegendreRulesAudit.lean']='\n'.join(audit).encode()
    return files
if __name__=='__main__':
    files=generate()
    if sys.argv[1:]==['--check']:
        for p,b in files.items(): assert p.read_bytes()==b, p
    elif not sys.argv[1:]:
        for p,b in files.items(): p.write_bytes(b)
    else: raise SystemExit('usage: gen_legendre_rules.py [--check]')
    print(f'{len(files)} source-generated rules, {sum(map(len,files.values()))} bytes')
