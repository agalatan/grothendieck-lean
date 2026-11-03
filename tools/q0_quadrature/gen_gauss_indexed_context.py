#!/usr/bin/env python3
"""Generate same-row source-address to LeanCert context checks.

Each row is checked against a safe dynamic lookup using the corresponding
source panel order and that row's rule index.  This links data to the
explicit normalized contexts, not to the mathematical Gauss quadrature rule.
Agent-ID: codex-aa04.
"""
from pathlib import Path
import hashlib
import json
import sys

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/gauss_mass'
OUT = ROOT / 'Grothe/UpperChaos'
INPUTS = {
    'panels_N601_Q64_cap1e20.json': '59a4f5fda639d83959a55a3a85e355c4f233312ea65d349e502761ae38a34e1d',
    'gauss_rules_certified.json': '1c3d217d0fe21f998a513d4272b57320d5b7caa60a76aa4b1dc7861179e219a1',
}
TOTAL, CHUNK, GROUP = 21577, 128, 1024


def generate():
    for name, digest in INPUTS.items():
        if hashlib.sha256((DATA / name).read_bytes()).hexdigest() != digest:
            raise ValueError(f'input digest mismatch: {name}')
    rules = json.loads((DATA / 'gauss_rules_certified.json').read_bytes())['rules']
    if sorted(map(int, rules)) != list(range(1, 65)):
        raise ValueError('unexpected rule orders')
    if any(len(rules[str(n)]) != n for n in range(1, 65)):
        raise ValueError('unexpected rule lengths')
    files = {}
    base = [
        'import Grothe.UpperChaos.Q0GaussAddress',
        'import Grothe.UpperChaos.Q0LegendreWeightRule64', '',
        '/-! Safe indexed context lookup. Actual Gauss-rule identity remains',
        'separate. Agent-ID: codex-aa04. -/',
        'set_option maxRecDepth 8192', '',
        'namespace Grothe.UpperChaos.Q0GaussIndexedContext', '',
        'open Grothe.UpperChaos.Q0GaussAddress',
        'open Grothe.UpperChaos.Q0GaussPhysicalCheck', '',
    ]
    for n in range(1, 65):
        base.append(f'def rule{n:02d} : Array (ℚ × ℚ) := #[')
        for i in range(n):
            ref = f'Grothe.UpperChaos.Q0LegendreWeightRule{n:02d}.r{i:02d}'
            comma = ',' if i + 1 < n else ''
            base.append(f'  ({ref}Interval.lo.toRat, {ref}Upper){comma}')
        base += [']', '']
    base += [
        'def rules : Array (Array (ℚ × ℚ)) := #[' +
        ', '.join(f'rule{n:02d}' for n in range(1, 65)) + ']', '',
        '/-- No fallback exists for an invalid panel, order or rule index. -/',
        'def contextAt (r : Row) : Option (ℚ × ℚ) := do',
        '  let block ← panelBlocks[r.panel / 64]?',
        '  let panel ← block[r.panel % 64]?',
        '  if panel.order = 0 then none else do',
        '    let rule ← rules[panel.order - 1]?',
        '    rule[r.rule]?', '',
        'def contextOK (r : Row) : Bool :=',
        '  decide (contextAt r = some (r.normalizedLower, r.normalizedUpperWeight))', '',
        '/-- The successful dynamic lookup is tied to the same row being checked. -/',
        'theorem contextOK_sound (r : Row) (h : contextOK r = true) :',
        '    contextAt r = some (r.normalizedLower, r.normalizedUpperWeight) :=',
        '  of_decide_eq_true h', '',
        'end Grothe.UpperChaos.Q0GaussIndexedContext', '',
    ]
    files[OUT / 'Q0GaussIndexedContext.lean'] = '\n'.join(base).encode()
    refs = []
    for start in range(0, TOTAL, GROUP):
        gi = start // GROUP
        name = f'Q0GaussIndexedContextGroup{gi:03d}'
        ref = f'Grothe.UpperChaos.{name}'
        refs.append(ref)
        previous = 'Q0GaussIndexedContext' if gi == 0 else f'Q0GaussIndexedContextGroup{gi-1:03d}'
        physical = f'Grothe.UpperChaos.Q0GaussPhysicalGroup{gi:03d}'
        indexes = range((min(GROUP, TOTAL - start) + CHUNK - 1) // CHUNK)
        lines = [f'import Grothe.UpperChaos.{previous}', f'import {physical}', '',
                 '/-! Generated same-row context checks. Agent-ID: codex-aa04. -/',
                 f'namespace {ref}', '', 'open Grothe.UpperChaos.Q0GaussIndexedContext', '']
        for ci in indexes:
            lines += [f'theorem checked{ci} : ({physical}.rows{ci}).all contextOK = true := by',
                      '  decide +kernel', '']
        simp = [f'{physical}.rows'] + (['List.all_append'] if len(indexes) > 1 else [])
        simp += [f'checked{i}' for i in indexes]
        if len(indexes) > 1:
            simp.append('Bool.and_self')
        lines += [f'theorem checked : ({physical}.rows).all contextOK = true := by',
                  f'  simp only [{", ".join(simp)}]', '', f'end {ref}', '']
        files[OUT / f'{name}.lean'] = '\n'.join(lines).encode()
    lines = [f'import {refs[-1]}', 'import Grothe.UpperChaos.Q0GaussPhysicalAll', '',
             '/-! Same-row normalized context lookup for all listed physical rows.',
             'Actual Gauss-rule identity and complete schedule coverage remain separate.',
             'Agent-ID: codex-aa04. -/',
             'namespace Grothe.UpperChaos.Q0GaussIndexedContextAll', '',
             'open Grothe.UpperChaos.Q0GaussIndexedContext', '',
             'theorem checked : (Grothe.UpperChaos.Q0GaussPhysicalAll.rows).all contextOK = true := by',
             '  simp only [Grothe.UpperChaos.Q0GaussPhysicalAll.rows, List.all_append, ' +
             ', '.join(r + '.checked' for r in refs) + ', Bool.and_self]', '',
             'theorem each_context (r : Grothe.UpperChaos.Q0GaussPhysicalCheck.Row)',
             '    (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :',
             '    contextAt r = some (r.normalizedLower, r.normalizedUpperWeight) := by',
             '  exact contextOK_sound r ((List.all_eq_true.mp checked) r hr)', '',
             'end Grothe.UpperChaos.Q0GaussIndexedContextAll', '']
    files[OUT / 'Q0GaussIndexedContextAll.lean'] = '\n'.join(lines).encode()
    targets = [r + '.checked' for r in refs] + [
        'Grothe.UpperChaos.Q0GaussIndexedContext.contextOK_sound',
        'Grothe.UpperChaos.Q0GaussIndexedContextAll.checked',
        'Grothe.UpperChaos.Q0GaussIndexedContextAll.each_context']
    audit = ['import Grothe.UpperChaos.Q0GaussIndexedContextAll',
             'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
             '/-! Strict indexed-context audit. Agent-ID: codex-aa04. -/',
             'open Lean Elab Command', 'run_cmd do',
             '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
             '  let targets : Array Name := #[',
             '    ' + ',\n    '.join('``' + t for t in targets) + ']',
             '  for target in targets do',
             '    let dependencies ← Lean.collectAxioms target',
             '    logInfo m!"Gauss indexed-context audit {target}: {dependencies}"',
             '    for dependency in dependencies do',
             '      unless allowed.contains dependency do',
             '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    files[OUT / 'Q0GaussIndexedContextAllAudit.lean'] = '\n'.join(audit).encode()
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
        raise SystemExit('usage: gen_gauss_indexed_context.py [--check]')
    print(f'{len(generated)} generated modules, {sum(map(len, generated.values()))} bytes')
