#!/usr/bin/env python3
"""Generate selected-root rules joined to LeanCert bounds.

Every proof is a Lean obligation; the input hash pins the source brackets but
does not certify them.  Mathematical Gaussian-rule identity is separate.
Agent-ID: codex-aa04.
"""
from fractions import Fraction
from pathlib import Path
import hashlib
import json
import sys

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/gauss_mass/gauss_rules_certified.json'
OUT = ROOT / 'Grothe/UpperChaos'
SHA = '1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1'
DENOMINATOR = 2 ** 640


def generate():
    raw = DATA.read_bytes()
    if hashlib.sha256(raw).hexdigest() != SHA:
        raise ValueError('source bracket digest differs from pinned input')
    rules = json.loads(raw)['rules']
    if sorted(map(int, rules)) != list(range(1, 65)):
        raise ValueError('expected one source rule for each order 1 through 64')
    files = {}
    for n in range(1, 65):
        rows = rules[str(n)]
        if len(rows) != n:
            raise ValueError(f'order {n} has {len(rows)} brackets')
        name = f'Q0GaussSelectedRule{n:02d}'
        fq = f'Grothe.UpperChaos.{name}'
        rule = f'Grothe.UpperChaos.Q0LegendreRule{n:02d}'
        weight = f'Grothe.UpperChaos.Q0LegendreWeightRule{n:02d}'
        join = f'Grothe.UpperChaos.Q0LegendreRootWeightRule{n:02d}'
        lines = [
            'import Grothe.UpperChaos.Q0GaussSelected',
            'import Grothe.UpperChaos.Q0GaussBracketInterior',
            f'import {join}',
            'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
            '/-! Selected original roots with LeanCert formula-weight bounds.',
            'Gauss-rule identity and the integration remainder are separate.',
            'Agent-ID: codex-aa04. -/',
            *(['set_option maxRecDepth 8192', ''] if n >= 60 else []),
            f'namespace {fq}', '',
            'open Grothe.UpperChaos.Q0LegendreInteger',
            'open Grothe.UpperChaos.Q0LegendreRuleBase',
            'open Grothe.UpperChaos.Q0GaussSelected',
            'open LeanCert.Core', '',
            f'noncomputable def root : Fin {n} → ℝ := Classical.choose {rule}.all_unique', '',
            f'theorem root_spec (i : Fin {n}) :',
            f'    root i ∈ Set.Icc ((({rule}.bracketAt i).1 : ℝ) / denominator)',
            f'      ((({rule}.bracketAt i).2 : ℝ) / denominator) ∧',
            f'      (realPair (root i) {n-1}).2 = 0 := by',
            f'  exact (Classical.choose_spec {rule}.all_unique).1 i', '',
            f'def lower : Fin {n} → ℚ := ![' +
            ', '.join(f'{weight}.r{i:02d}Interval.lo.toRat' for i in range(n)) + ']',
            f'def upper : Fin {n} → ℚ := ![' +
            ', '.join(f'{weight}.r{i:02d}Upper' for i in range(n)) + ']', '',
        ]
        for i, row in enumerate(rows):
            ends = []
            for side in ('lower', 'upper'):
                value = Fraction(row['node_' + side]) * DENOMINATOR
                if value.denominator != 1:
                    raise ValueError(f'order {n}, root {i}: non-dyadic endpoint')
                ends.append(value.numerator)
            lo, hi = ends
            tag = f'r{i:02d}'
            idx = f'({i} : Fin {n})'
            cast_rules = ['denominator', 'Int.cast_pow', 'Int.cast_ofNat']
            if lo < 0 or hi < 0:
                cast_rules.append('Int.cast_neg')
            if abs(lo) == 1 or abs(hi) == 1:
                cast_rules.append('Int.cast_one')
            cast_simp = ', '.join([f'{weight}.{tag}Input'] + cast_rules)
            lines += [
                f'theorem spec{tag} :',
                f'    root {idx} ∈ Set.Icc ((({lo} : ℤ) : ℝ) / denominator)',
                f'      ((({hi} : ℤ) : ℝ) / denominator) ∧',
                f'      (realPair (root {idx}) {n-1}).2 = 0 := by',
                f'  simpa [{rule}.bracketAt, {rule}.brackets] using root_spec {idx}', '',
                f'theorem interior{tag} : |root {idx}| < 1 := by',
                f'  exact interior_of_integer_bracket ({lo}) ({hi}) denominator denominator_pos',
                f'    (by decide +kernel) (by decide +kernel) spec{tag}.1', '',
                f'theorem lower{tag} : ({weight}.{tag}Interval.lo.toRat : ℝ) ≤ root {idx} := by',
                f'  have hle : (({lo} : ℤ) : ℚ) / denominator ≤ (({hi} : ℤ) : ℚ) / denominator := by',
                f'    simpa only [{cast_simp}] using {weight}.{tag}Input.le',
                f'  have hmem := mem_rational_interval_of_integer_bracket ({lo}) ({hi}) denominator hle spec{tag}.1',
                f'  have hinput : root {idx} ∈ {weight}.{tag}Input := by',
                f'    simpa only [{cast_simp}] using hmem',
                f'  exact (IntervalDyadic.mem_ofIntervalRat hinput (-256) (by decide)).1', '',
                f'theorem weight{tag} : weight {n-1} (root {idx}) ≤ ({weight}.{tag}Upper : ℝ) := by',
                f'  exact {join}.bound{tag} spec{tag}.1', '',
            ]
        lines += [f'noncomputable def selected : SelectedRule {n} where',
                  '  root := root', '  lower := lower', '  upper := upper',
                  '  interior := by', '    intro i', '    fin_cases i']
        lines += [f'    · exact interiorr{i:02d}' for i in range(n)]
        lines += ['  isRoot := by', '    intro i', '    exact (root_spec i).2',
                  '  lower_le := by', '    intro i', '    fin_cases i']
        lines += [f'    · simpa [lower] using lowerr{i:02d}' for i in range(n)]
        lines += ['  weight_le := by', '    intro i', '    fin_cases i']
        lines += [f'    · simpa [upper] using weightr{i:02d}' for i in range(n)]
        lines += ['  injective := by',
                  f'    apply injective_of_ordered_integer_brackets {n} {rule}.brackets',
                  f'      {rule}.count denominator denominator_pos {rule}.ordered root',
                  '    intro i', f'    simpa only [{rule}.bracketAt] using (root_spec i).1', '',
                  'def indexedContext : Array (ℚ × ℚ) := #[' +
                  ', '.join(f'({weight}.r{i:02d}Interval.lo.toRat, {weight}.r{i:02d}Upper)' for i in range(n)) + ']', '',
                  f'theorem context_lookup (i : Fin {n}) :',
                  '    indexedContext[i.val]? = some (selected.lower i, selected.upper i) := by',
                  ('  fin_cases i; rfl' if n == 1 else '  fin_cases i <;> rfl'), '',
                  f'end {fq}', '', 'open Lean Elab Command',
                  'run_cmd do',
                  '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
                  f'  let targets : Array Name := #[``{fq}.root_spec, ``{fq}.selected, ``{fq}.context_lookup]',
                  '  for target in targets do',
                  '    let dependencies ← Lean.collectAxioms target',
                  '    logInfo m!"Selected rule audit {target}: {dependencies}"',
                  '    for dependency in dependencies do',
                  '      unless allowed.contains dependency do',
                  '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
        files[OUT / f'{name}.lean'] = '\n'.join(lines).encode()
    imports = [f'import Grothe.UpperChaos.Q0GaussSelectedRule{n:02d}' for n in range(1, 65)]
    imports += ['', '/-! Every selected rule runs its own strict axiom audit.',
                'Agent-ID: codex-aa04. -/', '']
    files[OUT / 'Q0GaussSelectedRulesAudit.lean'] = '\n'.join(imports).encode()
    return files


if __name__ == '__main__':
    generated = generate()
    if sys.argv[1:] == ['--check']:
        for path, contents in generated.items():
            if path.read_bytes() != contents:
                raise ValueError(f'generated file differs: {path}')
    elif not sys.argv[1:]:
        for path, contents in generated.items():
            path.write_bytes(contents)
    else:
        raise SystemExit('usage: gen_gauss_selected_rules.py [--check]')
    print(f'{len(generated)} generated modules, {sum(map(len, generated.values()))} bytes')
