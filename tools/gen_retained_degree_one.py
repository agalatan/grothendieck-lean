#!/usr/bin/env python3
"""Export the complete retained grade-zero matrix/table certificate.

Agent-ID: codex-7c2e. This uses the actual pinned raw binary64 records,
actual frozen correction, production rational matrices and stored energies.
It does not assert Gaussian accuracy of the raw coefficients.
"""
import argparse
import ast
from fractions import Fraction as F
import hashlib
import json
from math import isqrt
from pathlib import Path
import struct
import zipfile


ACTUAL_CONSUMERS = r'''
/-- A grade-zero output uses both grade-zero inputs and no other grade. -/
private theorem output_congr (a b : ℕ → ℕ → ℕ → ℚ)
    (h0 : a 0 0 0 = b 0 0 0) (h1 : a 0 1 0 = b 0 1 0) (c d : ℕ) :
    productionSmoothedCoeff a 0 c d = productionSmoothedCoeff b 0 c d := by
  have hmatrix : gradeCoefficientMatrixQ 0 a = gradeCoefficientMatrixQ 0 b := by
    ext i j
    fin_cases i <;> fin_cases j
    · exact h0
    · exact h1
  simp only [productionSmoothedCoeff, hmatrix]

/-- The same complete rational output, with all higher source grades free. -/
theorem retained_output_first (a : ℕ → ℕ → ℕ → ℚ)
    (h0 : a 0 0 0 = sourceFirstQ) (h1 : a 0 1 0 = sourceSecondQ) :
    productionSmoothedCoeff (retainedProductionCoeff a) 0 0 0 = outputFirstQ := by
  have ha0 : retainedProductionCoeff a 0 0 0 = inputCoeff 0 0 0 := by
    norm_num [retainedProductionCoeff, inputCoeff, h0]
  have ha1 : retainedProductionCoeff a 0 1 0 = inputCoeff 0 1 0 := by
    norm_num [retainedProductionCoeff, inputCoeff, h1]
  rw [output_congr _ inputCoeff ha0 ha1]
  exact output_first

theorem retained_output_second (a : ℕ → ℕ → ℕ → ℚ)
    (h0 : a 0 0 0 = sourceFirstQ) (h1 : a 0 1 0 = sourceSecondQ) :
    productionSmoothedCoeff (retainedProductionCoeff a) 0 1 0 = outputSecondQ := by
  have ha0 : retainedProductionCoeff a 0 0 0 = inputCoeff 0 0 0 := by
    norm_num [retainedProductionCoeff, inputCoeff, h0]
  have ha1 : retainedProductionCoeff a 0 1 0 = inputCoeff 0 1 0 := by
    norm_num [retainedProductionCoeff, inputCoeff, h1]
  rw [output_congr _ inputCoeff ha0 ha1]
  exact output_second

private theorem energy_graded_one_zero (a : ℕ → ℕ → ℕ → ℚ) :
    energy (gradedHermite 251 a) (1, 0) = (a 0 0 0 : ℝ) ^ 2 := by
  rw [← norm_energyBlock_sq, EuclideanSpace.norm_sq_eq]
  change (∑ i : Fin 2 × Fin 1,
    ‖⟪hvec2 ((blockEquiv (1, 0)) i).1, gradedHermite 251 a⟫_ℂ‖ ^ 2) = _
  simp only [Fintype.sum_prod_type, Fin.sum_univ_two, Fin.sum_univ_one]
  change ‖⟪hvec2 (linearMode 1), gradedHermite 251 a⟫_ℂ‖ ^ 2 +
    ‖⟪hvec2 (linearMode 0), gradedHermite 251 a⟫_ℂ‖ ^ 2 = _
  norm_num [inner_hvec2_gradedHermite, linearMode, Complex.norm_ratCast, sq_abs]

private theorem energy_graded_zero_one (a : ℕ → ℕ → ℕ → ℚ) :
    energy (gradedHermite 251 a) (0, 1) = (a 0 1 0 : ℝ) ^ 2 := by
  rw [← norm_energyBlock_sq, EuclideanSpace.norm_sq_eq]
  change (∑ i : Fin 1 × Fin 2,
    ‖⟪hvec2 ((blockEquiv (0, 1)) i).1, gradedHermite 251 a⟫_ℂ‖ ^ 2) = _
  simp only [Fintype.sum_prod_type, Fin.sum_univ_two, Fin.sum_univ_one]
  change ‖⟪hvec2 (linearMode 3), gradedHermite 251 a⟫_ℂ‖ ^ 2 +
    ‖⟪hvec2 (linearMode 2), gradedHermite 251 a⟫_ℂ‖ ^ 2 = _
  norm_num [inner_hvec2_gradedHermite, linearMode, Complex.norm_ratCast, sq_abs]

/-- The complete first retained-output energy at the pinned source words. -/
theorem retained_energy_first (a : ℕ → ℕ → ℕ → ℚ)
    (h0 : a 0 0 0 = sourceFirstQ) (h1 : a 0 1 0 = sourceSecondQ) :
    energy (retainedSmoothed a) (1, 0) = (outputFirstQ : ℝ) ^ 2 := by
  rw [retainedSmoothed, energy_graded_one_zero, retained_output_first a h0 h1]

theorem retained_energy_second (a : ℕ → ℕ → ℕ → ℚ)
    (h0 : a 0 0 0 = sourceFirstQ) (h1 : a 0 1 0 = sourceSecondQ) :
    energy (retainedSmoothed a) (0, 1) = (outputSecondQ : ℝ) ^ 2 := by
  rw [retainedSmoothed, energy_graded_zero_one, retained_output_second a h0 h1]

/-- Both actual degree-one energies of the same retained rational output
are compared with the current parsed table. Higher grades remain arbitrary. -/
theorem retained_table_residual (a : ℕ → ℕ → ℕ → ℚ)
    (h0 : a 0 0 0 = sourceFirstQ) (h1 : a 0 1 0 = sourceSecondQ) :
    |energy (retainedSmoothed a) (1, 0) - (Grothe.Upper.energyTable (1, 0) : ℝ)| +
      |energy (retainedSmoothed a) (0, 1) - (Grothe.Upper.energyTable (0, 1) : ℝ)| ≤
        (1 / 10 ^ 15 : ℝ) := by
  rw [retained_energy_first a h0 h1, retained_energy_second a h0 h1]
  have h := stored_table_residual
  rw [output_first, output_second] at h
  exact_mod_cast h

/-- Grade zero has no reflected coordinates, so the constructive full
dyadic reference uses the same two pinned canonical source words exactly. -/
theorem dyadic_reference_table_residual (g : ℕ → ℕ → ℕ → ℚ)
    (h0 : g 0 0 0 = sourceFirstQ) (h1 : g 0 1 0 = sourceSecondQ) :
    |energy (retainedSmoothed (dyadicTensorReference g)) (1, 0) -
        (Grothe.Upper.energyTable (1, 0) : ℝ)| +
      |energy (retainedSmoothed (dyadicTensorReference g)) (0, 1) -
        (Grothe.Upper.energyTable (0, 1) : ℝ)| ≤ (1 / 10 ^ 15 : ℝ) := by
  apply retained_table_residual
  · simpa only [dyadicTensorReference, rationalTensorCompletion,
      Nat.zero_le, ite_true] using h0
  · simpa only [dyadicTensorReference, rationalTensorCompletion,
      Nat.zero_add, le_refl, ite_true] using h1
'''


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def parse_npy(data):
    if data[:8] != b'\x93NUMPY\x01\x00':
        raise ValueError('Expected a version-one NumPy array')
    length = int.from_bytes(data[8:10], 'little')
    return ast.literal_eval(data[10:10 + length].decode()), data[10 + length:]


def rat(q):
    return f'({q.numerator} / {q.denominator} : ℚ)'


def render(data):
    a, b = map(F, data['raw'])
    x, y = map(F, data['outputs'])
    t, v = map(F, data['table'])
    lines = [
        'import Grothe.UpperChaos.Binary64Center',
        'import Grothe.UpperChaos.ProductionDegreeOneMatrix',
        'import Grothe.UpperChaos.FrozenSourceBinding',
        'import Grothe.UpperChaos.ProductionRetainedSource',
        'import Grothe.UpperChaos.ProductionF0RationalCompletion',
        'import Grothe.Upper.EnergyDegreeOneLookup',
        'import Lean.Util.CollectAxioms', '',
        '/-! Generated by tools/gen_retained_degree_one.py from the pinned',
        'raw source, correction and table; see degree-one-table.json.',
        'This is the complete numerical grade zero, with two output energies.',
        'Gaussian accuracy of its input centers remains a separate obligation.',
        'Agent-ID: codex-7c2e. -/',
        'set_option warningAsError true',
        'open MeasureTheory',
        'open scoped InnerProductSpace',
        'namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries',
        'namespace RetainedDegreeOne', '',
        f'def sourceFirstQ : ℚ := {rat(a)}',
        f'def sourceSecondQ : ℚ := {rat(b)}', '',
        f'theorem decode_first : Binary64Center.decode {data["words"][0]} =',
        '    some sourceFirstQ := by decide +kernel',
        f'theorem decode_second : Binary64Center.decode {data["words"][1]} =',
        '    some sourceSecondQ := by decide +kernel', '',
        '/-- Isolate grade zero and add its actual frozen correction once.',
        'The zero extension isolates this grade; it does not discard inputs',
        'within a grade or assert that higher actual F0 grades vanish. -/',
        'def inputCoeff (q c d : ℕ) : ℚ :=',
        '  if q = 0 ∧ d = 0 then',
        '    if c = 0 then sourceFirstQ + frozenCorrectionCoeff 0 0 0',
        '    else if c = 1 then sourceSecondQ + frozenCorrectionCoeff 0 1 0',
        '    else 0',
        '  else 0', '',
        f'def outputFirstQ : ℚ := {rat(x)}',
        f'def outputSecondQ : ℚ := {rat(y)}', '',
    ]
    for label, c in [('first', 0), ('second', 1)]:
        out = 'outputFirstQ' if c == 0 else 'outputSecondQ'
        lines += [
            '/-- Exact output of the production rational matrix calculation. -/',
            f'theorem output_{label} :',
            f'    productionSmoothedCoeff inputCoeff 0 {c} 0 = {out} := by',
            '  norm_num [productionSmoothedCoeff, productionSavedMatrixQ,',
            '    gradeCoefficientMatrixQ, Matrix.mul_apply, Matrix.transpose_apply,',
            '    Fin.sum_univ_succ, inputCoeff, sourceFirstQ, sourceSecondQ,',
            '    DegreeOneMatrix.zero, DegreeOneMatrix.one00, DegreeOneMatrix.one01,',
            '    DegreeOneMatrix.one10, DegreeOneMatrix.one11,',
            '    FrozenSourceBinding.coefficient_first, FrozenSourceBinding.coefficient_second,',
            '    outputFirstQ, outputSecondQ]', '',
        ]
    lines += [
        '/-- Complete degree-one table residual by exact rational arithmetic. -/',
        'theorem rational_table_residual :',
        f'    |outputFirstQ ^ 2 - {rat(t)}| +',
        f'      |outputSecondQ ^ 2 - {rat(v)}| ≤ (1 / 10^15 : ℚ) := by',
        '  norm_num [outputFirstQ, outputSecondQ]', '',
        '/-- Both actual stored entries and both actual matrix outputs are used.',
        'No approximate matrix or source-equality hypothesis is assumed here. -/',
        'theorem stored_table_residual :',
        '    |productionSmoothedCoeff inputCoeff 0 0 0 ^ 2 -',
        '        Grothe.Upper.energyTable (1, 0)| +',
        '      |productionSmoothedCoeff inputCoeff 0 1 0 ^ 2 -',
        '        Grothe.Upper.energyTable (0, 1)| ≤ (1 / 10^15 : ℚ) := by',
        '  rw [output_first, output_second,',
        '    Grothe.Upper.EnergyDegreeOneLookup.one_zero,',
        '    Grothe.Upper.EnergyDegreeOneLookup.zero_one]',
        '  exact rational_table_residual', '',
        'end RetainedDegreeOne',
        'end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries', '',
        'run_cmd do',
        '  let allowed : Array Lean.Name := #[`propext, `Classical.choice, `Quot.sound]',
        '  for target in #[',
    ]
    names = ['decode_first', 'decode_second', 'output_first', 'output_second',
             'rational_table_residual', 'stored_table_residual',
             'retained_output_first', 'retained_output_second',
             'retained_energy_first', 'retained_energy_second',
             'retained_table_residual', 'dyadic_reference_table_residual']
    prefix = 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.RetainedDegreeOne.'
    lines += ['      ``' + prefix + n + (',' if i < len(names) - 1 else '] do')
              for i, n in enumerate(names)]
    lines += [
        '    let dependencies ← Lean.collectAxioms target',
        '    Lean.logInfo m!"Actual retained grade-zero audit {target}: {dependencies}"',
        '    let unexpected := dependencies.filter fun n => !allowed.contains n',
        '    unless unexpected.isEmpty do throwError m!"Unexpected grade-zero axioms: {unexpected}"', '',
    ]
    return '\n'.join(lines).replace('\nend RetainedDegreeOne\n',
        '\n' + ACTUAL_CONSUMERS + '\nend RetainedDegreeOne\n')


def generate(repo, check=False):
    meta = json.loads((repo / 'data/retained-f0/source.json').read_text())
    source = repo / 'data/retained-f0' / meta['source_file']
    assert sha(source) == meta['sha256']
    assert source.stat().st_size == meta['size_bytes']
    assert meta['payload_offset'] == 128
    words, raw = [], []
    # Complete q=0 source: block1[0,0] and block0[0,0], no reflection.
    with source.open('rb') as stream:
        for index in [251**2, 0]:
            stream.seek(128 + 8 * index)
            block = stream.read(8)
            words.append(struct.unpack('<Q', block)[0])
            raw.append(F(struct.unpack('<d', block)[0]))
    frozen_meta = json.loads((repo / 'data/taylor-approximants/frozen-integers.json').read_text())
    correction = repo / 'data/taylor-approximants' / frozen_meta['source_file']
    assert sha(correction) == frozen_meta['source_sha256']
    with zipfile.ZipFile(correction) as archive:
        header, payload = parse_npy(archive.read('C0.npy'))
    assert header == {'descr': '<f8', 'fortran_order': False, 'shape': (2, 1)}
    frozen = [F(q) for q in struct.unpack('<dd', payload)]
    config_path = repo / 'data/retained-f0/degree-one-rounding.json'
    config = json.loads(config_path.read_text())
    S, D = config['scale'], config['denominator']
    u, v, w = [F(isqrt(S * S * config[k] ** 2 // D**2), S) for k in ['u', 'v', 'w']]
    a, b = [raw[i] + frozen[i] for i in range(2)]
    outputs = [u * a + v * b, v * a + w * b]
    table_path = repo / 'data/upper-preprocess/certificate.json'
    entries = json.loads(table_path.read_text())['energies']
    target = [sum((F(q) for n, m, q in entries if (n, m) == pair), F(0))
              for pair in [(1, 0), (0, 1)]]
    residual = sum(abs(x*x - t) for x, t in zip(outputs, target))
    assert residual <= F(1, 10**15)
    data = dict(agent_id='codex-7c2e', grade=0, raw_source_sha256=meta['sha256'],
                frozen_source_sha256=frozen_meta['source_sha256'],
                matrix_config_sha256=sha(config_path), table_source_sha256=sha(table_path),
                flat_indices=[251**2, 0], words=words, raw=list(map(str, raw)),
                frozen=list(map(str, frozen)), matrix=list(map(str, [u, v, w])),
                outputs=list(map(str, outputs)), table=list(map(str, target)),
                exact_residual=str(residual), cap='1/1000000000000000',
                status='Exact complete grade-zero arithmetic; generated Lean requires checking; Gaussian input accuracy remains open.')
    outputs_to_check = {
        repo / 'data/retained-f0/degree-one-table.json': json.dumps(data, indent=2) + '\n',
        repo / 'Grothe/UpperChaos/ProductionDegreeOneTable.lean': render(data),
    }
    for path, text in outputs_to_check.items():
        if check:
            if path.read_text() != text:
                raise SystemExit(f'Generated file differs: {path}')
        else:
            path.write_text(text)
    print(json.dumps({'grade': 0, 'exact_residual': str(residual), 'status': data['status']}))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    generate(args.repo, args.check)
