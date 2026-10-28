#!/usr/bin/env python3
"""Render exact j=0 leaf witnesses as Lean proofs, Agent-ID: codex-aa04.

The external transcript is untrusted. Every coordinate, Horner operation,
reciprocal remainder and exponential is independently checked in Lean.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path

from gen_profile_model import model, rat
from gen_source_row_models import trace_defs
from gen_scalar_cert import render as scalar_render

ROOT = Path(__file__).resolve().parents[2]
INPUT = ROOT / 'data/q0_quadrature/base-pair-leaf-pilot-trace.json'
OUT = ROOT / 'Grothe/UpperChaos'


def model_name(name):
    return name + 'Model'


def certificate(name, entry, kind, center_index=None):
    """Share the analytic soundness proof; emit only finite witness data."""
    namespace = 'Rectangle' + kind + 'Certificate'
    lines = [trace_defs(entry['trace'], name),
             f'private def {name}Certificate : {namespace}.Certificate := {{']
    if kind == 'Reciprocal':
        for key in ['center', 'radius', 'error']:
            lines.append(f'  {key} := {rat(entry[key])}')
        for key in ['center_pos', 'radius_nonneg', 'radius_lt_one', 'error_nonneg']:
            lines.append(f'  {key} := by decide +kernel')
        lines.append(f'  terms := {entry["terms"]}')
        models = ['scaled', 'delta', 'argument', 'geometric', 'output']
        budgets = ['scaledBudget', 'argumentBudget', 'geometricBudget']
    else:
        lines.extend([f'  center := Q0BasePairLeafScalars.center{center_index}',
                      f'  degree := {entry["degree"]}',
                      f'  error := {rat(entry["error"])}',
                      '  error_nonneg := by decide +kernel',
                      f'  centerInterval := Q0BasePairLeafScalars.bound{center_index}',
                      f'  centerApprox := {rat(entry["centerApprox"])}'])
        models = ['delta', 'series', 'centered', 'centerValue', 'output']
        budgets = ['deltaBudget', 'seriesBudget', 'productBudget']
    for key in models:
        lines.append(f'  {key} := {model_name(entry[key])}')
    lines.append(f'  trace := {name}trace')
    for key in budgets:
        lines.append(f'  {key} := {rat(entry[key])}')
    lines.extend(['}', f'private theorem {name}_checked :',
                  f'    {namespace}.Verified {model_name(entry["input"])} {name}Certificate := by',
                  '  decide +kernel\n'])
    return '\n'.join(lines)


def scalar_key(e):
    if e.get('kind') == 'upper':
        return (str(Q(e['upper'])), '0', str(Q(e['scalarInterval']['hi'])))
    return (str(Q(e['center'])), str(Q(e['centerInterval']['lo'])),
            str(Q(e['centerInterval']['hi'])))


def scalar_data(data):
    entries, index = [], {}
    uppers = []
    for cell in data['cells']:
        for e in cell['exponentials']:
            if e.get('kind') == 'upper':
                uppers.append(e)
                continue
            key = scalar_key(e)
            if key not in index:
                index[key] = len(entries)
                entries.append(dict(zip(['input', 'lo', 'hi'], key)))
    raw = (json.dumps({'centers': entries}, indent=2) + '\n').encode()
    text = scalar_render(raw).replace('Q0RectangleScalarCertificates', 'Q0BasePairLeafScalars')
    text = text.replace('tools/q0_quadrature/gen_scalar_cert.py',
                        'tools/q0_quadrature/gen_base_pair_leaf.py (scalar subrenderer)')
    additional = []
    for entry in uppers:
        key = scalar_key(entry)
        if key in index:
            continue
        i = index[key] = len(index)
        additional.append(f'''
def center{i} : ℚ := {rat(key[0])}
def bound{i} : IntervalRat := ⟨0, {rat(key[2])}, by decide +kernel⟩
private theorem center{i}_upper_checked :
    checkUpperBoundDyadicChecked (.exp (.const center{i})) 0 0 (by norm_num)
      bound{i}.hi (-256) 64 = true := by decide +kernel
theorem exp_center{i}_mem : Real.exp (center{i} : ℝ) ∈ bound{i} := by
  have hu := verify_upper_bound_dyadic_checked (.exp (.const center{i}))
    0 0 (by norm_num) bound{i}.hi (-256) 64 (by norm_num)
    center{i}_upper_checked 0 (by norm_num)
  exact ⟨by simpa only [bound{i}, Rat.cast_zero] using (Real.exp_pos (center{i} : ℝ)).le,
    by simpa only [Expr.eval] using hu⟩
''')
    text = text.replace('\nend Grothe.UpperChaos.Q0BasePairLeafScalars',
                        '\n'.join(additional) + '\nend Grothe.UpperChaos.Q0BasePairLeafScalars')
    all_entries = [dict(zip(['input', 'lo', 'hi'], key)) for key in index]
    full_raw = (json.dumps({'centers': all_entries}, indent=2) + '\n').encode()
    text = text.replace(hashlib.sha256(raw).hexdigest(), hashlib.sha256(full_raw).hexdigest())
    return text, index


def common_certificate(cell):
    """Assembly is separated from expensive cell arithmetic and profile data."""
    a = cell['assembly']
    fields = ['twiceRadial', 'firstOutput', 'twiceProfile', 'negArgument',
              'companionFactor', 'companionNumerator', 'companionOutput']
    budgets = ['twiceRadialBudget', 'firstBudget', 'twiceProfileBudget',
               'negArgumentBudget', 'factorBudget', 'numeratorBudget', 'companionBudget']
    lines = ['private def pairCertificate : Q0BasePairModelAssembly.Certificate := {']
    lines += [f'  {k} := {model_name(a[k])}' for k in fields]
    lines += [f'  {k} := {rat(a[k])}' for k in budgets]
    lines += ['}', 'private theorem pair_checked :',
              '    pairCertificate.Verified sModel profileModel argumentModel commonModel := by',
              '  decide +kernel\n']
    return '\n'.join(lines)


def render_cell(data, cell, digest, scalar_indices, shared_profile=None):
    chart = cell['cell']['chart']
    title = 'Direct' if chart == 'direct' else 'Reciprocal'
    namespace = f'Q0BasePair{title}Leaf'
    eta = rat(data['eta'])
    slo, shi = map(Q, cell['cell']['s'])
    alo, ahi = map(Q, cell['cell']['aux'])
    sc, sh = rat((slo + shi)/2), rat((shi-slo)/2)
    ac, ah = rat((alo + ahi)/2), rat((ahi-alo)/2)
    out = [f'''import Grothe.UpperChaos.Q0ProfileRectangleModel
import Grothe.UpperChaos.RectangleCoordinates
import Grothe.UpperChaos.RectangleReciprocalCertificate
import Grothe.UpperChaos.RectangleExpCertificate
import Grothe.UpperChaos.Q0BasePairLeafScalars
import Grothe.UpperChaos.Q0BasePairCommonModel
import Grothe.UpperChaos.Q0BasePairModelAssembly
import Grothe.UpperChaos.Q0BasePairCellIntegral

/-! Generated by tools/q0_quadrature/gen_base_pair_leaf.py.
Transcript SHA256: {digest}
Actual {chart} degree-one pair on one physical rectangle. This is a leaf
certificate, not a full-domain integral or a final bound. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.{namespace}
open MeasureTheory LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck RectangleHornerTrace
open LeanCertProductionProfile
set_option maxRecDepth 100000
set_option maxHeartbeats 0

noncomputable def radial (x : ℝ) : ℝ := ({sc} : ℝ) + {sh} * x
noncomputable def auxiliary (y : ℝ) : ℝ := ({ac} : ℝ) + {ah} * y
''']
    for name, node in cell['nodes'].items():
        if shared_profile and name in ('s', 'profile'):
            out.append(f'def {model_name(name)} : Model := {shared_profile}.{model_name(name)}\n')
            continue
        out.append(f'def {model_name(name)} : Model := {model(node)}\n')
    if shared_profile:
        out[0] = f'import Grothe.UpperChaos.{shared_profile}\n' + out[0]
    else:
        out.append(trace_defs(cell['profile']['trace'], 'profile'))
        out.append('''private theorem profile_checked :
    profiletrace.check sModel Q0ProfileRectangleModel.inputs = true := by decide +kernel
''')
    for c in cell['reciprocals']:
        out.append(certificate(c['output'], c, 'Reciprocal'))
    for e in cell['exponentials']:
        key = scalar_key(e)
        if e.get('kind') == 'upper':
            name, arg, index = e['output'], model_name(e['input']), scalar_indices[key]
            out.append(f'''private theorem {name}_upper_checked :
    (range {arg}).hi = Q0BasePairLeafScalars.center{index} := by decide +kernel
private theorem {name}_checked :
    intervalInputOK Q0BasePairLeafScalars.bound{index} {rat(e['centerApprox'])}
      {model_name(name)} {rat(e['budget'])} = true := by decide +kernel
''')
        else:
            out.append(certificate(e['output'], e, 'Exp', scalar_indices[key]))
    # Exact arithmetic checks used outside the shared nonlinear certificates.
    for op in cell['operations']:
        if op.get('scope', 'top') != 'top' or op['op'] not in ('add', 'mul', 'scale'):
            continue
        name = op['output']
        inputs = [model_name(n) for n in op['inputs']]
        operands = (rat(op['scalar']) + ' ' + inputs[0]) if op['op'] == 'scale' else ' '.join(inputs)
        out.append(f'''private theorem {name}_checked :
    {op['op']}OK {operands} {model_name(name)} {rat(op['budget'])} = true := by
  decide +kernel
''')
    out.append(common_certificate(cell))
    out.append(render_sound(data, cell, scalar_indices, sc, sh, ac, ah, shared_profile))
    out.append(render_integral(data, cell, sc, sh, ac, ah))
    out.append(f'\nend Grothe.UpperChaos.{namespace}\n')
    return namespace + '.lean', '\n'.join(out)


def render_integral(data, cell, sc, sh, ac, ah):
    chart = cell['cell']['chart']
    eta = rat(data['eta'])
    slo, shi = map(rat, cell['cell']['s'])
    alo, ahi = map(rat, cell['cell']['aux'])
    first = 'directFirst' if chart == 'direct' else 'reciprocalFirst'
    companion = 'directCompanion' if chart == 'direct' else 'reciprocalCompanion'
    positive_aux = ' (by decide +kernel)' if chart == 'reciprocal' else ''
    return f'''
def firstInterval : IntervalRat := Q0BasePairCellIntegral.modelIntegral {sh} {ah} firstOutputModel
def companionInterval : IntervalRat :=
  Q0BasePairCellIntegral.modelIntegral {sh} {ah} companionOutputModel

/-- Actual signed physical-cell integrals, with the auxiliary variable outermost. -/
theorem integrals_mem :
    (∫ u in ({alo} : ℝ)..{ahi}, ∫ s in ({slo} : ℝ)..{shi},
      Q0BasePairKernelContinuity.{first} {eta} s u) ∈ firstInterval ∧
    (∫ u in ({alo} : ℝ)..{ahi}, ∫ s in ({slo} : ℝ)..{shi},
      Q0BasePairKernelContinuity.{companion} {eta} s u) ∈ companionInterval := by
  have h := Q0BasePairCellIntegral.{chart}_pair_integral_mem {eta}
    {sc} {sh} {ac} {ah} firstOutputModel companionOutputModel
    (by decide +kernel) (by decide +kernel){positive_aux} (fun x y hx hy => by
      simpa only [Q0BasePairKernelContinuity.{first},
        Q0BasePairKernelContinuity.{companion}, radial, auxiliary,
        Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using pair_contains x y hx hy)
  norm_num only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] at h
  convert h using 1 <;> norm_num [firstInterval, companionInterval]
'''


def render_sound(data, cell, scalar_indices, sc, sh, ac, ah, shared_profile=None):
    chart = cell['cell']['chart']
    eta = rat(data['eta'])
    ops = {op['output']: op for op in cell['operations'] if op.get('scope') == 'top'}
    def budget(name):
        return rat(ops[name]['budget'])
    if chart == 'direct':
        out = [f'''private def commonCertificate : Q0BasePairCommonModel.DirectCertificate := {{
  dampedGaussian := commonProduct1Model
  dividedOnce := commonProduct2Model
  output := commonModel
  gaussianBudget := {budget('commonProduct1')}
  onceBudget := {budget('commonProduct2')}
  outputBudget := {budget('common')}
}}
private theorem common_verified :
    commonCertificate.Verified dampingModel gaussianModel inverseModel := by decide +kernel
''']
        denominator = '(1 + k^2 * u^2)'
        argument = f'(u^2 * s / {denominator})'
        first, companion = 'first', 'companion'
    else:
        out = [f'''private def commonCertificate : Q0BasePairCommonModel.ReciprocalCertificate := {{
  dividedOnce := remainingProductModel
  factor := remainingModel
  auxSquare := aux2Model
  undamped := undampedCommonModel
  output := commonModel
  onceBudget := {budget('remainingProduct')}
  factorBudget := {budget('remaining')}
  squareBudget := {budget('aux2')}
  undampedBudget := {budget('undampedCommon')}
}}
private theorem common_verified :
    commonCertificate.Verified {eta} auxModel gaussianModel inverseModel := by decide +kernel
''']
        denominator = '(u^2 + k^2)'
        argument = f'(s / {denominator})'
        first, companion = 'reciprocalFirst', 'reciprocalCompanion'
    meanings = {
        's': 's', 'aux': 'u', 'profile': 'k', 'one': '1',
        'aux2': 'u^2', 'profile2': 'k^2',
        'denominatorProduct': 'k^2 * u^2', 'denominator': denominator,
        'inverse': denominator + '⁻¹',
        'argumentProduct': 'u^2 * s', 'argument': argument,
        'dampingArgument': f'-(({eta} : ℝ)^2 * u^2)',
        'damping': f'Real.exp (-(({eta} : ℝ)^2 * u^2))',
        'negS': '-s', 'negArgumentForGaussian': f'-{argument}',
        'gaussianArgument': f'-s - {argument}',
        'gaussian': f'Real.exp (-s - {argument})',
    }
    out.append(f'''/-- Both actual signed kernels are enclosed, with no numerical hypotheses. -/
theorem pair_contains (x y : ℝ) (hx : |x| ≤ 1) (hy : |y| ≤ 1) :
    Contains firstOutputModel x y
      (Q0BasePairKernel.{first} {eta} (radial x) (q0Kappa (radial x)) (auxiliary y)) ∧
    Contains companionOutputModel x y
      (Q0BasePairKernel.{companion} {eta} (radial x) (q0Kappa (radial x)) (auxiliary y)) := by
  let s := radial x
  let u := auxiliary y
  let k := q0Kappa s
  have hs : Contains sModel x y s := by
    simpa only [s, radial, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using
      RectangleCoordinates.x_sound {sc} {sh} sModel (by decide +kernel) hx hy
  have haux : Contains auxModel x y u := by
    simpa only [u, auxiliary, Rat.cast_div, Rat.cast_one, Rat.cast_ofNat] using
      RectangleCoordinates.y_sound {ac} {ah} auxModel (by decide +kernel) hx hy
  have hprofile : Contains profileModel x y k :=
    Q0ProfileRectangleModel.profile_of_trace sModel profiletrace profile_checked hx hy hs
  have hone : Contains oneModel x y (1 : ℝ) := by
    simpa [oneModel, constant, IntervalRat.singleton] using contains_constant 1 x y
''')
    for op in cell['operations']:
        if op.get('scope', 'top') != 'top':
            continue
        name, kind = op['output'], op['op']
        if name not in meanings or name in ('s', 'aux', 'profile', 'one'):
            continue
        typ = f'Contains {model_name(name)} x y ({meanings[name]})'
        if kind in ('add', 'mul', 'scale'):
            ins = op['inputs']
            terms = [model_name(v) for v in ins]
            if kind == 'scale':
                terms.insert(0, rat(op['scalar']))
            terms += [model_name(name), rat(op['budget']), name+'_checked', 'hx', 'hy']
            terms += [('hs' if n == 's' else 'h'+n) for n in ins]
            call = f'{kind}_sound {" ".join(terms)}'
            if kind == 'scale':
                proof = f'convert {call} using 1\n    push_cast\n    ring'
            elif kind == 'mul':
                proof = f'simpa only [pow_two, div_eq_mul_inv] using {call}'
            else:
                proof = f'simpa only [sub_eq_add_neg] using {call}'
            out.append(f'  have h{name} : {typ} := by\n    {proof}\n')
        elif kind == 'inverse':
            out.append(f'''  have h{name} : {typ} :=
    RectangleReciprocalCertificate.sound denominatorModel inverseCertificate
      inverse_checked hx hy hdenominator
''')
        elif kind in ('exp', 'expUpper'):
            e = next(e for e in cell['exponentials'] if e['output'] == name)
            key = scalar_key(e)
            index = scalar_indices[key]
            if kind == 'expUpper':
                out.append(f'''  have h{name} : {typ} := by
    apply RectangleExpCertificate.upper_model {model_name(e['input'])} {model_name(name)}
      {rat(e['scalarInterval']['hi'])} {rat(e['centerApprox'])} {rat(e['budget'])}
      (by decide +kernel) _ {name}_checked hx hy h{e['input']}
    rw [{name}_upper_checked]
    exact Q0BasePairLeafScalars.exp_center{index}_mem.2
''')
            else:
                out.append(f'''  have h{name} : {typ} :=
    RectangleExpCertificate.sound {model_name(e['input'])} {name}Certificate
      {name}_checked Q0BasePairLeafScalars.exp_center{index}_mem hx hy h{e['input']}
''')
        else:
            raise ValueError(f'unsupported semantic event {kind}/{name}')
    if chart == 'direct':
        out.append('''  have hcommon := commonCertificate.direct_sound
    dampingModel gaussianModel inverseModel common_verified hx hy hdamping hgaussian hinverse
  exact pairCertificate.direct_sound sModel profileModel argumentModel commonModel
    pair_checked hx hy hs hprofile hargument hcommon
''')
    else:
        out.append(f'''  have hcommon := commonCertificate.reciprocal_sound {eta}
    auxModel gaussianModel inverseModel common_verified hx hy haux hgaussian hinverse
  simpa only [Rat.cast_div, Rat.cast_one, Rat.cast_ofNat, s, k, u, pairCertificate] using
    pairCertificate.reciprocal_sound sModel profileModel argumentModel commonModel
      pair_checked hx hy hs hprofile hargument hcommon
''')
    text = '\n'.join(out)
    if shared_profile:
        text = text.replace(
            'Q0ProfileRectangleModel.profile_of_trace sModel profiletrace profile_checked hx hy hs',
            f'{shared_profile}.profile_contains hx hy hs')
    return text


def generate(raw):
    data = json.loads(raw)
    scalars, indices = scalar_data(data)
    result = {'Q0BasePairLeafScalars.lean': scalars}
    for cell in data['cells']:
        name, source = render_cell(data, cell, hashlib.sha256(raw).hexdigest(), indices)
        if name in result:
            raise ValueError('pilot contains duplicate chart')
        result[name] = source
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    for name, text in generate(INPUT.read_bytes()).items():
        path = OUT/name
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit(f'{path} differs from generated leaf')
        else:
            path.write_text(text)


if __name__ == '__main__':
    main()
