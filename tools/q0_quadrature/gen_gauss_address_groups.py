#!/usr/bin/env python3
"""Generate source-panel address checks for physical Gauss rows.

The input hash pins the panel schedule.  Lean rechecks every physical row's
panel lookup, endpoint equality, rule-index bounds and cumulative ordinal.
Chunked scans check the cumulative panel offsets.  Source evaluator,
Gauss-rule identity and the schedule bijection remain separate.
Agent-ID: codex-aa04.
"""
from fractions import Fraction
from pathlib import Path
import hashlib
import json
import sys

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/gauss_mass/panels_N601_Q64_cap1e20.json'
OUT = ROOT / 'Grothe/UpperChaos'
SHA = '59a4f5fda639d83959a55a3a85e355c4f233312ea65d349e502761ae38a34e1d'
BLOCK = 64
CHUNK = 128
GROUP = 1024
TOTAL = 21577


def rat(value):
    x = Fraction(value)
    return f'(({x.numerator} : ℚ) / {x.denominator})'


def generate():
    raw = DATA.read_bytes()
    if hashlib.sha256(raw).hexdigest() != SHA:
        raise ValueError('panel source digest differs from pinned input')
    panels = json.loads(raw)['panels']
    files = {}
    base = [
        'import Grothe.UpperChaos.Q0GaussPhysicalCheck', '',
        '/-! Hash-pinned source panel table and safe indexed row checks.',
        'No production Gauss identity or integration-remainder claim is made.',
        'Agent-ID: codex-aa04. -/',
        'set_option maxRecDepth 8192', '',
        'namespace Grothe.UpperChaos.Q0GaussAddress', '',
        'open Grothe.UpperChaos.Q0GaussPhysicalCheck', '',
        'structure Panel where', '  lo : ℚ', '  hi : ℚ', '  order : ℕ', '  offset : ℕ',
        '  deriving DecidableEq', '',
    ]
    chunks = [panels[i:i + BLOCK] for i in range(0, len(panels), BLOCK)]
    starts = []
    ends = []
    offset = 0
    for bi, block in enumerate(chunks):
        starts.append(offset)
        base.append(f'def panelBlock{bi:03d} : Array Panel := #[')
        for pi, panel in enumerate(block):
            end = ',' if pi + 1 < len(block) else ''
            base.append(f'    ⟨{rat(panel["lo"])}, {rat(panel["hi"])}, {panel["order"]}, {offset}⟩{end}')
            offset += panel['order']
        ends.append(offset)
        base.append(']')
        base.append('')
    base += [
        'def panelBlocks : Array (Array Panel) := #[' + ', '.join(f'panelBlock{bi:03d}' for bi in range(len(chunks))) + ']', '',
        '/-- Each successful lookup supplies a real panel entry; no default',
        'value is used for an out-of-bounds panel or rule index. -/',
        'def addressOK (r : Row) : Bool :=',
        '  match panelBlocks[r.panel / 64]? with',
        '  | none => false',
        '  | some block =>',
        '    match block[r.panel % 64]? with',
        '    | none => false',
        '    | some p => decide (r.lo = p.lo ∧ r.hi = p.hi ∧',
        '        1 ≤ p.order ∧ p.order ≤ 64 ∧ r.rule < p.order ∧',
        '        r.index = p.offset + r.rule)', '',
        '/-- Recover safe panel and rule indices and exact source endpoints. -/',
        'theorem addressOK_sound (r : Row) (h : addressOK r = true) :',
        '    ∃ block p, panelBlocks[r.panel / 64]? = some block ∧',
        '      block[r.panel % 64]? = some p ∧',
        '      r.panel / 64 < panelBlocks.size ∧ r.panel % 64 < block.size ∧',
        '      r.lo = p.lo ∧ r.hi = p.hi ∧',
        '      1 ≤ p.order ∧ p.order ≤ 64 ∧ r.rule < p.order ∧',
        '      r.index = p.offset + r.rule := by',
        '  cases hb : panelBlocks[r.panel / 64]? with',
        '  | none => simp [addressOK, hb] at h',
        '  | some block =>',
        '    cases hp : block[r.panel % 64]? with',
        '    | none => simp [addressOK, hb, hp] at h',
        '    | some p =>',
        '      have hv : r.lo = p.lo ∧ r.hi = p.hi ∧',
        '          1 ≤ p.order ∧ p.order ≤ 64 ∧ r.rule < p.order ∧',
        '          r.index = p.offset + r.rule := by',
        '        apply of_decide_eq_true',
        '        simpa [addressOK, hb, hp] using h',
        '      exact ⟨block, p, rfl, hp, (Array.getElem?_eq_some_iff.mp hb).choose,',
        '        (Array.getElem?_eq_some_iff.mp hp).choose, hv⟩', '',
        '/-- Check consecutive panel offsets against a running source ordinal. -/',
        'def scan : List Panel → ℕ → Option ℕ',
        '  | [], start => some start',
        '  | p :: ps, start =>',
        '    if p.offset = start ∧ 1 ≤ p.order ∧ p.order ≤ 64 then',
        '      scan ps (start + p.order)',
        '    else none', '',
        '/-- Successful scans expose the next panel and the remaining scan. -/',
        'theorem scan_cons_sound (p : Panel) (ps : List Panel) (start finish : ℕ)',
        '    (h : scan (p :: ps) start = some finish) :',
        '    (p.offset = start ∧ 1 ≤ p.order ∧ p.order ≤ 64) ∧',
        '      scan ps (start + p.order) = some finish := by',
        '  by_cases hp : p.offset = start ∧ 1 ≤ p.order ∧ p.order ≤ 64',
        '  · exact ⟨hp, by simpa [scan, hp] using h⟩',
        '  · simp [scan, hp] at h', '',
        '/-- Separately checked consecutive blocks compose without replaying',
        'the numerical scan in a single giant computation. -/',
        'theorem scan_append (xs ys : List Panel) (start : ℕ) :',
        '    scan (xs ++ ys) start = (scan xs start).bind (scan ys) := by',
        '  induction xs generalizing start with',
        '  | nil => rfl',
        '  | cons p ps ih =>',
        '    by_cases hp : p.offset = start ∧ 1 ≤ p.order ∧ p.order ≤ 64',
        '    · simpa [scan, hp] using ih (start + p.order)',
        '    · simp [scan, hp]', '',
        '/-- A successful scan cannot reduce the running ordinal. -/',
        'theorem scan_mono (ps : List Panel) (start finish : ℕ)',
        '    (h : scan ps start = some finish) : start ≤ finish := by',
        '  induction ps generalizing start with',
        '  | nil =>',
        '    have heq : start = finish := by simpa [scan] using h',
        '    omega',
        '  | cons p ps ih =>',
        '    by_cases hp : p.offset = start ∧ 1 ≤ p.order ∧ p.order ≤ 64',
        '    · have ht : scan ps (start + p.order) = some finish := by',
        '        simpa [scan, hp] using h',
        '      have hm := ih (start + p.order) ht',
        '      omega',
        '    · simp [scan, hp] at h', '',
        'end Grothe.UpperChaos.Q0GaussAddress', '',
    ]
    files[OUT / 'Q0GaussAddress.lean'] = '\n'.join(base).encode()

    refs = []
    for start in range(0, TOTAL, GROUP):
        gi = start // GROUP
        name = f'Q0GaussAddressGroup{gi:03d}'
        ref = f'Grothe.UpperChaos.{name}'
        refs.append(ref)
        dep = 'Q0GaussAddress' if gi == 0 else f'Q0GaussAddressGroup{gi-1:03d}'
        physical = f'Grothe.UpperChaos.Q0GaussPhysicalGroup{gi:03d}'
        lines = [f'import Grothe.UpperChaos.{dep}', f'import {physical}', '',
                 '/-! Generated safe source-panel checks. Agent-ID: codex-aa04. -/',
                 f'namespace {ref}', '', 'open Grothe.UpperChaos.Q0GaussAddress', '']
        indexes = list(range((min(GROUP, TOTAL - start) + CHUNK - 1) // CHUNK))
        for ci in indexes:
            lines += [f'theorem checked{ci} : ({physical}.rows{ci}).all addressOK = true := by',
                      '  decide +kernel', '']
        simp = ([f'{physical}.rows', 'List.all_append'] if len(indexes) > 1
                else [f'{physical}.rows'])
        simp += [f'checked{i}' for i in indexes]
        if len(indexes) > 1:
            simp.append('Bool.and_self')
        lines += [f'theorem checked : ({physical}.rows).all addressOK = true := by',
                  f'  simp only [{", ".join(simp)}]', '', f'end {ref}', '']
        files[OUT / f'{name}.lean'] = '\n'.join(lines).encode()

    lines = [f'import {refs[-1]}', 'import Grothe.UpperChaos.Q0GaussPhysicalAll', '',
             '/-! Source panel address checks for all physical rows.',
             'Full source schedule and mathematical Gauss-rule identity remain separate.',
             'Agent-ID: codex-aa04. -/',
             'namespace Grothe.UpperChaos.Q0GaussAddressAll', '',
             'open Grothe.UpperChaos.Q0GaussAddress', '',
             'theorem checked : (Grothe.UpperChaos.Q0GaussPhysicalAll.rows).all addressOK = true := by',
             '  simp only [Grothe.UpperChaos.Q0GaussPhysicalAll.rows, List.all_append, ' +
             ', '.join(r + '.checked' for r in refs) + ', Bool.and_self]', '',
             'theorem each_source (r : Grothe.UpperChaos.Q0GaussPhysicalCheck.Row)',
             '    (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :',
             '    ∃ block p, panelBlocks[r.panel / 64]? = some block ∧',
             '      block[r.panel % 64]? = some p ∧',
             '      r.panel / 64 < panelBlocks.size ∧ r.panel % 64 < block.size ∧',
             '      r.lo = p.lo ∧ r.hi = p.hi ∧',
             '      1 ≤ p.order ∧ p.order ≤ 64 ∧ r.rule < p.order ∧',
             '      r.index = p.offset + r.rule := by',
             '  exact addressOK_sound r ((List.all_eq_true.mp checked) r hr)', '',
             'end Grothe.UpperChaos.Q0GaussAddressAll', '']
    files[OUT / 'Q0GaussAddressAll.lean'] = '\n'.join(lines).encode()
    scan_names = [f'panelBlock{bi:03d}_scan' for bi in range(len(chunks))]
    scan = ['import Grothe.UpperChaos.Q0GaussAddress', '',
            '/-! Chunked kernel checks of all source panel offsets and sizes.',
            'Schedule bijection and production Gauss identity remain separate.',
            'Agent-ID: codex-aa04. -/',
            'namespace Grothe.UpperChaos.Q0GaussAddressScan', '',
            'open Grothe.UpperChaos.Q0GaussAddress', '']
    for bi, (start, end) in enumerate(zip(starts, ends)):
        scan += [f'theorem {scan_names[bi]} :',
                 f'    scan panelBlock{bi:03d}.toList {start} = some {end} := by',
                 '  decide +kernel', '']
    scan += ['theorem sizes : panelBlocks.map Array.size = #[' +
             ', '.join(str(len(block)) for block in chunks) + '] := by',
             '  decide +kernel', '',
             'def sourcePanels : List Panel := ' +
             ' ++ '.join(f'panelBlock{bi:03d}.toList' for bi in range(len(chunks))), '',
             f'theorem complete_scan : scan sourcePanels 0 = some {TOTAL} := by',
             '  simp only [sourcePanels, scan_append, ' + ', '.join(scan_names) +
             ', Option.bind_some]', '',
             'end Grothe.UpperChaos.Q0GaussAddressScan', '']
    files[OUT / 'Q0GaussAddressScan.lean'] = '\n'.join(scan).encode()
    targets = [r + '.checked' for r in refs] + [
        'Grothe.UpperChaos.Q0GaussAddress.addressOK_sound',
        'Grothe.UpperChaos.Q0GaussAddress.scan_cons_sound',
        'Grothe.UpperChaos.Q0GaussAddress.scan_append',
        'Grothe.UpperChaos.Q0GaussAddress.scan_mono',
        'Grothe.UpperChaos.Q0GaussAddressScan.sizes',
        'Grothe.UpperChaos.Q0GaussAddressScan.complete_scan',
        'Grothe.UpperChaos.Q0GaussAddressAll.checked',
        'Grothe.UpperChaos.Q0GaussAddressAll.each_source']
    audit = ['import Grothe.UpperChaos.Q0GaussAddressAll',
             'import Grothe.UpperChaos.Q0GaussAddressScan',
             'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
             '/-! Strict source-address audit. Agent-ID: codex-aa04. -/',
             'open Lean Elab Command', 'run_cmd do',
             '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
             '  let targets : Array Name := #[',
             '    ' + ',\n    '.join('``' + t for t in targets) + ']',
             '  for target in targets do',
             '    let dependencies ← Lean.collectAxioms target',
             '    logInfo m!"Gauss address audit {target}: {dependencies}"',
             '    for dependency in dependencies do',
             '      unless allowed.contains dependency do',
             '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    files[OUT / 'Q0GaussAddressAllAudit.lean'] = '\n'.join(audit).encode()
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
        raise SystemExit('usage: gen_gauss_address_groups.py [--check]')
    print(f'{len(generated)} generated modules, {sum(map(len, generated.values()))} bytes')
