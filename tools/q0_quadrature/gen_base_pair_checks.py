#!/usr/bin/env python3
"""Bounded-process arithmetic checks for direct base-pair leaves.

Agent-ID: codex-aa04. The canonical leaf renderer supplies all original literal
data and semantic proofs. This renderer moves those unchanged declarations into
shared data and a thin facade, expands each nonlinear Verified obligation into
its local operations, and assembles the accepted checks using proof constants.
No certificate, rectangle, arithmetic budget or numerical input is changed.

The limit below counts substantive closed arithmetic decisions in each checker
module. Literal interval well-formedness proofs remain with the data. It is a
source-level work bound, NOT a measured RSS bound: a single multiplication may
still be expensive, and post-hold compiler measurements are required.
"""
from dataclasses import dataclass
import re

from gen_base_pair_leaf import render_cell
from gen_profile_model import rat


CHECKS_PER_MODULE = 4
_DECL = re.compile(
    r'^(?:private )?(?:noncomputable )?(def|theorem) ([A-Za-z0-9_]+)\b', re.M)


@dataclass(frozen=True)
class Block:
    text: str
    decisions: int


def declarations(source):
    """Parse only our canonical, one-declaration-per-line generated format.

    Unknown commands cannot silently disappear: all text preceding the first
    declaration, every complete declaration body, and the final semantic proof
    are preserved by the caller. Names are checked for duplicates.
    """
    matches = list(_DECL.finditer(source))
    if not matches or source[:matches[0].start()].strip():
        raise ValueError('unexpected text before generated declarations')
    result = []
    seen = set()
    for i, match in enumerate(matches):
        kind, name = match.groups()
        if name in seen:
            raise ValueError(f'duplicate generated declaration: {name}')
        seen.add(name)
        end = matches[i + 1].start() if i + 1 < len(matches) else len(source)
        text = source[match.start():end].rstrip()
        # Imported declarations need accessible names; mathematical bodies stay
        # byte-identical. Unrelated trace_defs callers keep private declarations.
        text = re.sub(r'^private ', '', text)
        result.append((kind, name, text))
    return result


def _decision(name, goal):
    return Block(f'theorem {name} :\n    {goal} := by\n  decide +kernel\n', 1)


def _proof(name, goal, body):
    return Block(f'theorem {name} :\n    {goal} := by\n{body}\n', 0)


def _list(terms):
    return '[' + ', '.join(terms) + ']'


def trace_parts(prefix, trace, argument, input_terms=None):
    """Literal tail aliases and tail-first local checks, with no full decide.

    The original trace declaration is retained. Aliases share its existing
    product/result models; their budgets and coefficient values come from the
    same committed transcript. The final goal's conversion binds the aliases
    back to the original checker and its canonical input coefficient list.
    """
    steps, values = trace['steps'], trace['values']
    if len(steps) != len(values):
        raise ValueError('trace length mismatch')
    if input_terms is None:
        input_terms = ['constant ' + rat(v) for v in values]
    if len(input_terms) != len(steps):
        raise ValueError('trace input term length mismatch')
    count = len(steps)
    definitions = [f'def {prefix}Tail{count} : Trace := .nil\n']
    blocks = [_proof(f'{prefix}Horner{count}_checked',
                     f'{prefix}Tail{count}.check {argument} [] = true', '  rfl')]
    for i in reversed(range(count)):
        step = steps[i]
        mb, ab = rat(step['mulBudget']), rat(step['addBudget'])
        # The canonical trace renderer currently requires zero add budgets.
        # Reject a future change rather than silently certifying a different trace.
        if step['addBudget'] != '0':
            raise ValueError('canonical trace requires zero addBudget')
        definitions.append(f'def {prefix}Tail{i} : Trace :=\n'
                           f'  .cons {prefix}product{i} {prefix}result{i} '
                           f'{mb} {ab} {prefix}Tail{i + 1}\n')
        tail_output = f'{prefix}Tail{i + 1}.output'
        mul = f'{prefix}Horner{i}_mul_checked'
        add = f'{prefix}Horner{i}_add_checked'
        mul_goal = f'mulOK {tail_output} {argument} {prefix}product{i} {mb} = true'
        add_goal = (f'addOK {prefix}product{i} ({input_terms[i]}) '
                    f'{prefix}result{i} {ab} = true')
        # Keep both numerical operations and their logical assembly in one
        # bounded block; the module partitioner never separates this triple.
        blocks.append(Block(
            _decision(mul, mul_goal).text + '\n' + _decision(add, add_goal).text + '\n' +
            _proof(f'{prefix}Horner{i}_checked',
                   f'{prefix}Tail{i}.check {argument} {_list(input_terms[i:])} = true',
                   f'  exact Trace.check_cons {argument} ({input_terms[i]})\n'
                   f'    {_list(input_terms[i + 1:])}\n'
                   f'    {prefix}product{i} {prefix}result{i} {mb} {ab} {prefix}Tail{i + 1}\n'
                   f'    {prefix}Horner{i + 1}_checked {mul} {add}').text, 2))
    return definitions, blocks


def _certificate_goals(kind, source, c):
    """The conjuncts of the existing reusable Verified propositions, in order."""
    if kind == 'Reciprocal':
        return [
            f'intervalSubset (IntervalRat.mul\n'
            f'      (IntervalRat.sub (range {source}) (IntervalRat.singleton {c}.center))\n'
            f'      (IntervalRat.singleton (1 / {c}.center)))\n'
            f'      (errorInterval {c}.radius {c}.radius_nonneg) = true',
            f'scaleOK (1 / {c}.center) {source} {c}.scaled {c}.scaledBudget = true',
            f'addOK {c}.scaled (constant (-1)) {c}.delta 0 = true',
            f'scaleOK (-1) {c}.delta {c}.argument {c}.argumentBudget = true',
            f'{c}.trace.check {c}.argument '
            f'((List.replicate {c}.terms (1 : ℚ)).map constant) = true',
            f'scaleOK (1 / {c}.center) {c}.trace.output {c}.geometric '
            f'{c}.geometricBudget = true',
            f'{c}.center⁻¹ * ({c}.radius^{c}.terms / (1 - {c}.radius)) ≤ {c}.error',
            f'roundOK {c}.geometric.coefficients\n'
            f'      (IntervalRat.add {c}.geometric.remainder '
            f'(errorInterval {c}.error {c}.error_nonneg))\n'
            f'      {c}.output 0 = true',
        ], 4, f'{c}.argument'
    if kind == 'Exp':
        return [
            f'addOK {source} (constant (-{c}.center)) {c}.delta {c}.deltaBudget = true',
            f'{c}.trace.check {c}.delta '
            f'((ExponentialHorner.coefficients {c}.degree).map constant) = true',
            f'scaleOK (1 / ({c}.degree.factorial : ℚ)) {c}.trace.output '
            f'{c}.series {c}.seriesBudget = true',
            f'LeanCert.Engine.TaylorModel.expRemainderBound (range {c}.delta) '
            f'{c}.degree ≤ {c}.error',
            f'roundOK {c}.series.coefficients\n'
            f'      (IntervalRat.add {c}.series.remainder '
            f'(errorInterval {c}.error {c}.error_nonneg))\n'
            f'      {c}.centered 0 = true',
            f'intervalInputOK {c}.centerInterval {c}.centerApprox {c}.centerValue 0 = true',
            f'mulOK {c}.centered {c}.centerValue {c}.output {c}.productBudget = true',
        ], 1, f'{c}.delta'
    raise ValueError(f'unsupported certificate: {kind}')


def certificate_parts(entry, kind):
    name = entry['output']
    c = name + 'Certificate'
    source = entry['input'] + 'Model'
    goals, trace_index, argument = _certificate_goals(kind, source, c)
    definitions, blocks = trace_parts(name, entry['trace'], argument)
    fields = []
    for i, goal in enumerate(goals):
        field = f'{name}Field{i}_checked'
        fields.append(field)
        if i == trace_index:
            blocks.append(_proof(field, goal,
                                 f'  exact {name}Horner0_checked'))
        else:
            blocks.append(_decision(field, goal))
    blocks.append(_proof(name + '_checked',
                         f'Rectangle{kind}Certificate.Verified {source} {c}',
                         '  exact ⟨' + ', '.join(fields) + '⟩'))
    return definitions, blocks


def partition(blocks, limit=CHECKS_PER_MODULE):
    if limit < 2:
        raise ValueError('limit must fit one complete Horner step')
    chunks, current, count = [], [], 0
    for block in blocks:
        if block.decisions > limit:
            raise ValueError('unsplittable check exceeds module budget')
        if current and count + block.decisions > limit:
            chunks.append(current)
            current, count = [], 0
        current.append(block)
        count += block.decisions
    if current:
        chunks.append(current)
    return chunks


def check_output_inventory(directory, outputs):
    """Reject stale helpers without deleting any files implicitly.

    Root integral/assembly modules are intentionally outside this generator's
    ownership. The pattern includes only its literal-data/check/facade family.
    """
    families = set()
    for name in outputs:
        match = re.fullmatch(r'(Q0BasePairRoot[0-9]+)(?:Profile|Scalars|Audit|Leaf[01]+)'
                             r'(?:Data|Check[0-9]{3})?\.lean', name)
        if not match:
            raise ValueError(f'unexpected generated output: {name}')
        families.add(match[1])
    if len(families) != 1:
        raise ValueError('one generated root family required')
    family = families.pop()
    pattern = re.compile(re.escape(family) +
                         r'(?:Profile|Scalars|Audit|Leaf[01]+)'
                         r'(?:Data|Check[0-9]{3})?\.lean')
    existing = {p.name for p in directory.glob(family + '*.lean')
                if pattern.fullmatch(p.name)}
    stale = existing - outputs.keys()
    if stale:
        raise ValueError('stale generated outputs require explicit cleanup: ' + ', '.join(sorted(stale)))


def _checker_modules(namespace, blocks):
    end = f'\nend Grothe.UpperChaos.{namespace}\n'
    previous_module = namespace + 'Data'
    header = (f'namespace Grothe.UpperChaos.{namespace}\n'
              'open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck '
              'RectangleHornerTrace\n'
              'set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n')
    result = {}
    for i, chunk in enumerate(partition(blocks)):
        module = f'{namespace}Check{i:03d}'
        result[module + '.lean'] = (
            f'import Grothe.UpperChaos.{previous_module}\n\n'
            f'/-! Generated bounded arithmetic block ({sum(b.decisions for b in chunk)} '
            f'closed operations, maximum {CHECKS_PER_MODULE}).\n'
            'tools/q0_quadrature/gen_base_pair_checks.py; Agent-ID: codex-aa04. -/\n' +
            header + '\n'.join(b.text for b in chunk) + end)
        previous_module = module
    return result, previous_module


def render_profile_bundle(original, trace, namespace):
    """Split the shared per-root Horner trace without replacing profile inputs.

    The inputs are the existing interval models enclosing actual profile
    coefficients, NOT exact constant models at their numerical centers.
    """
    first = original.index('def sModel')
    semantic = original.index('theorem profile_contains')
    header = original[:first]
    items = declarations(original[first:semantic])
    if [name for kind, name, _ in items if kind == 'theorem'] != ['profile_checked']:
        raise ValueError('unexpected shared profile proof layout')
    terms = [f'Q0ProfileRectangleModel.inputs.getD {i} (constant 0)'
             for i in range(len(trace['steps']))]
    definitions, blocks = trace_parts('profile', trace, 'sModel', terms)
    # Bind back to the original input list. Lean must check definitional equality
    # of the entire list, including every original input remainder interval.
    proof = _proof('profile_checked',
                   'profiletrace.check sModel Q0ProfileRectangleModel.inputs = true',
                   '  exact profileHorner0_checked').text
    end = f'\nend Grothe.UpperChaos.{namespace}\n'
    literal_data = [text for kind, _, text in items if kind == 'def']
    result = {namespace + 'Data.lean':
              'import Grothe.UpperChaos.RectangleHornerTraceStep\n' +
              header + '\n\n'.join(literal_data + definitions) + end}
    checkers, last = _checker_modules(namespace, blocks)
    result.update(checkers)
    scope = header[header.index(f'namespace Grothe.UpperChaos.{namespace}'):]
    result[namespace + '.lean'] = (f'import Grothe.UpperChaos.{last}\n\n' + scope +
                                    proof + '\n' + original[semantic:])
    return result


def render_cell_bundle(data, cell, digest, scalar_indices, *, shared_profile,
                       namespace, scalars, previous=None):
    """Emit data -> bounded checks -> original public facade for one direct cell.

    The data module imports the previous finished leaf. Thus importing all the
    generated roots cannot run heavy helpers from different leaves of a single
    root concurrently. Different roots retain their existing independence.
    """
    if cell['cell']['chart'] != 'direct' or not shared_profile:
        raise ValueError('modular renderer currently requires a shared direct profile')
    _, original = render_cell(data, cell, digest, scalar_indices, shared_profile)
    original = original.replace('Q0BasePairDirectLeaf', namespace).replace(
        'Q0BasePairLeafScalars', scalars)
    marker = '/-- Both actual signed kernels are enclosed, with no numerical hypotheses. -/'
    declarations_start = original.index('noncomputable def radial')
    semantics_start = original.index(marker)
    header = original[:declarations_start]
    semantic_proofs = original[semantics_start:]
    items = declarations(original[declarations_start:semantics_start])
    literal_data = [text for kind, _, text in items if kind == 'def']
    certificates = {v['output']: (v, 'Reciprocal') for v in cell['reciprocals']}
    certificates.update({v['output']: (v, 'Exp') for v in cell['exponentials']
                         if v.get('kind') != 'upper'})
    blocks = []
    assemblies = []
    consumed = set()
    for kind, name, text in items:
        if kind != 'theorem':
            continue
        base = name.removesuffix('_checked')
        if name.endswith('_checked') and base in certificates:
            entry, cert_kind = certificates[base]
            extra_data, checks = certificate_parts(entry, cert_kind)
            literal_data.extend(extra_data)
            blocks.extend(checks)
            consumed.add(base)
        elif name == 'pair_checked':
            fields = ['twiceRadial', 'firstOutput', 'twiceProfile', 'negArgument',
                      'companionFactor', 'companionNumerator', 'companionOutput']
            assemblies.append(_proof(name,
                'pairCertificate.Verified sModel profileModel argumentModel commonModel',
                '  exact ⟨' + ', '.join(f + '_checked' for f in fields) + '⟩').text)
        elif name == 'common_verified':
            assemblies.append(_proof(name,
                'commonCertificate.Verified dampingModel gaussianModel inverseModel',
                '  exact ⟨commonProduct1_checked, commonProduct2_checked, common_checked⟩').text)
        else:
            if text.count('decide +kernel') != 1:
                raise ValueError(f'unexpected arithmetic proof: {name}')
            blocks.append(Block(text + '\n', 1))
    if consumed != certificates.keys():
        raise ValueError('not all nonlinear certificates were split')
    if len(assemblies) != 2:
        raise ValueError('missing pair/common assembly')

    end = f'\nend Grothe.UpperChaos.{namespace}\n'
    predecessor = f'import Grothe.UpperChaos.{previous}\n' if previous else ''
    note = ('/- Arithmetic is split across bounded checker modules. Literal data\n'
            'and mathematical inputs are unchanged. RSS has not been measured. -/\n')
    result = {namespace + 'Data.lean':
              'import Grothe.UpperChaos.RectangleHornerTraceStep\n' +
              predecessor + header + note + '\n\n'.join(literal_data) + end}
    checkers, previous_module = _checker_modules(namespace, blocks)
    result.update(checkers)
    # Keep the same opens/options as the original semantic proof, but import
    # only the completed chain. Data already imports the original prerequisites.
    scope = header[header.index(f'namespace Grothe.UpperChaos.{namespace}'):]
    result[namespace + '.lean'] = (
        f'import Grothe.UpperChaos.{previous_module}\n\n' + note + scope +
        '\n'.join(assemblies) + '\n' + semantic_proofs)
    return result
