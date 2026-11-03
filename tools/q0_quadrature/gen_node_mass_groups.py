#!/usr/bin/env python3
"""Generate compact, bounded kernel-checkable candidate batches.
Agent-ID: codex-aa04. These do not prove actual root/weight enclosures.
"""
from pathlib import Path
import hashlib, json, sys
ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT/'data/q0_quadrature/gauss_mass/rounded_node_mass.json'
PANEL = ROOT/'data/q0_quadrature/gauss_mass/panels_N601_Q64_cap1e20.json'
DIR = ROOT/'Grothe/UpperChaos'
CHUNK = 128
GROUP = 8

def generate():
    assert hashlib.sha256(PANEL.read_bytes()).hexdigest() == '59a4f5fda639d83959a55a3a85e355c4f233312ea65d349e502761ae38a34e1d'
    src = json.loads(DATA.read_bytes())
    rows = src['records']
    panels = json.loads(PANEL.read_bytes())['panels']
    # Derive this enumeration independently from the original panel orders,
    # not from the candidate rows being checked.
    schedule = [(panel, rule) for panel, info in enumerate(panels)
                for rule in range(info['order'])]
    assert len(schedule) == len(rows)
    assert all((row[0],row[1]) == address for row, address in zip(rows,schedule))
    assert len(rows) == 21577
    files = {}
    for start in range(0, len(rows), CHUNK * GROUP):
        group = start // (CHUNK * GROUP)
        name = f'Q0NodeMassGroup{group:03d}'
        ns = f'Grothe.UpperChaos.{name}'
        # Serial imports prevent 22 memory-heavy Lean elaborations at once.
        dep = 'Q0NodeMassCheck' if group == 0 else f'Q0NodeMassGroup{group-1:03d}'
        lines = [f'import Grothe.UpperChaos.{dep}', '',
          '/-! Generated candidate arithmetic: source-node soundness remains open.',
          'Agent-ID: codex-aa04. -/', f'namespace {ns}', '',
          'open Grothe.UpperChaos.Q0NodeMassCheck', '']
        chunks = []
        for ci, offset in enumerate(range(start, min(start + CHUNK*GROUP, len(rows)), CHUNK)):
            seq = rows[offset:offset+CHUNK]
            chunks.append((ci,offset,seq))
            lines += [f'def rows{ci} : List Row := [']
            for i, (panel, rule, node, weight, term) in enumerate(seq,offset):
                lines.append(f'  ⟨{i}, {panel}, {rule}, {node}, {weight}, {term}⟩' + (',' if i != offset+len(seq)-1 else ''))
            lines += [']', '',
              f'theorem checked{ci} : rows{ci}.all valid = true := by decide +kernel',
              f'theorem indices{ci} : rows{ci}.map Row.index = List.range\' {offset} {len(seq)} := by decide +kernel',
              f'def addresses{ci} : List (ℕ × ℕ × ℕ) := [']
            for i, (panel, rule) in enumerate(schedule[offset:offset+len(seq)],offset):
                lines.append(f'  ({i}, {panel}, {rule})' + (',' if i != offset+len(seq)-1 else ''))
            lines += [']',
              f'theorem positions{ci} : (rows{ci}.map (fun r => (r.index, r.panel, r.rule))) = addresses{ci} := by decide +kernel',
              f'theorem count{ci} : rows{ci}.length = {len(seq)} := by decide +kernel',
              f'theorem total{ci} : (rows{ci}.map Row.termUpper).sum = {sum(r[4] for r in seq)} := by decide +kernel', '']
        join = ' ++ '.join(f'rows{ci}' for ci, _, _ in chunks)
        address_join = ' ++ '.join(f'addresses{ci}' for ci, _, _ in chunks)
        many = len(chunks) > 1
        checked_rules = (['List.all_append'] if many else []) + [f'checked{ci}' for ci,_,_ in chunks] + (['Bool.and_self'] if many else [])
        indices_rules = (['List.map_append'] if many else []) + [f'indices{ci}' for ci,_,_ in chunks] + (['List.append_assoc'] if many else [])
        count_rules = (['List.length_append'] if many else []) + [f'count{ci}' for ci,_,_ in chunks]
        total_rules = (['List.map_append', 'List.sum_append'] if many else []) + [f'total{ci}' for ci,_,_ in chunks]
        positions_rules = (['List.map_append'] if many else []) + [f'positions{ci}' for ci,_,_ in chunks]
        lines += [f'def rows : List Row := {join}',
          f'def addresses : List (ℕ × ℕ × ℕ) := {address_join}', '',
          'theorem checked : rows.all valid = true := by',
          '  simp only [rows, '+', '.join(checked_rules)+']', '',
          'theorem positions : (rows.map (fun r => (r.index, r.panel, r.rule))) = addresses := by',
          '  simp only [rows, addresses, '+', '.join(positions_rules)+']', '',
          f'theorem indices : rows.map Row.index = List.range\' {start} {sum(len(seq) for _, _, seq in chunks)} := by',
          '  simp only [rows, '+', '.join(indices_rules)+']']
        if len(chunks) > 1:
            steps = []
            for j, (_, offset, seq) in enumerate(chunks[:-1]):
                rest = sum(len(later) for _, _, later in chunks[j+1:])
                steps.append(f'← List.range\'_append_1 (s := {offset}) (m := {len(seq)}) (n := {rest})')
            lines += ['  rw [' + ',\n    '.join(steps) + ']']
        lines += ['',
          f'theorem count : rows.length = {sum(len(seq) for _, _, seq in chunks)} := by',
          '  simp only [rows, '+', '.join(count_rules)+']',
          '',
          f'theorem total : (rows.map Row.termUpper).sum = {sum(r[4] for _,_,seq in chunks for r in seq)} := by',
          '  simp only [rows, '+', '.join(total_rules)+']',
          '', f'end {ns}', '']
        files[DIR/f'{name}.lean'] = '\n'.join(lines).encode()
    groups = list(range((len(rows) + CHUNK*GROUP - 1) // (CHUNK*GROUP)))
    sizes = [min(CHUNK*GROUP, len(rows)-g*CHUNK*GROUP) for g in groups]
    totals = [sum(r[4] for r in rows[g*CHUNK*GROUP:(g+1)*CHUNK*GROUP]) for g in groups]
    refs = [f'Grothe.UpperChaos.Q0NodeMassGroup{g:03d}' for g in groups]
    lines = [*(f'import {ref}' for ref in refs), '',
      '/-! Full candidate-row coverage and exact integer sum. Actual Gauss',
      'node/weight enclosures and their production binding remain separate.',
      'Agent-ID: codex-aa04. -/',
      'namespace Grothe.UpperChaos.Q0NodeMassAll', '',
      'open Grothe.UpperChaos.Q0NodeMassCheck', '']
    join = ' ++ '.join(f'{ref}.rows' for ref in refs)
    addresses = ' ++ '.join(f'{ref}.addresses' for ref in refs)
    lines += [f'def rows : List Row := {join}',
      f'def addresses : List (ℕ × ℕ × ℕ) := {addresses}', '',
      'theorem checked : rows.all valid = true := by',
      '  simp only [rows, List.all_append, '+', '.join(f'{ref}.checked' for ref in refs)+', Bool.and_self]', '',
      'theorem positions : (rows.map (fun r => (r.index, r.panel, r.rule))) = addresses := by',
      '  simp only [rows, addresses, List.map_append, '+', '.join(f'{ref}.positions' for ref in refs)+']', '',
      f'theorem indices : rows.map Row.index = List.range\' 0 {len(rows)} := by',
      '  simp only [rows, List.map_append, '+', '.join(f'{ref}.indices' for ref in refs)+', List.append_assoc]']
    steps=[]
    for j, _ in enumerate(groups[:-1]):
        steps.append(f'← List.range\'_append_1 (s := {j*CHUNK*GROUP}) (m := {sizes[j]}) (n := {sum(sizes[j+1:])})')
    lines += ['  rw ['+',\n    '.join(steps)+']', '',
      'theorem ordinal_nodup : (rows.map Row.index).Nodup := by',
      '  rw [indices]',
      '  exact List.nodup_range\' _', '',
      f'theorem count : rows.length = {len(rows)} := by',
      '  simp only [rows, List.length_append, '+', '.join(f'{ref}.count' for ref in refs)+']', '',
      f'theorem total : (rows.map Row.termUpper).sum = {sum(totals)} := by',
      '  simp only [rows, List.map_append, List.sum_append, '+', '.join(f'{ref}.total' for ref in refs)+']', '',
      'theorem each_valid (r : Row) (hr : r ∈ rows) : valid r = true :=',
      '  (List.all_eq_true.mp checked) r hr', '',
      f'theorem total_lt_cap : (rows.map Row.termUpper).sum * 100 < 107 * (10^18 : ℕ) := by',
      '  rw [total]',
      '  decide +kernel', '',
      'end Grothe.UpperChaos.Q0NodeMassAll', '']
    files[DIR/'Q0NodeMassAll.lean'] = '\n'.join(lines).encode()
    audit_targets = [f'``{ref}.{name}' for ref in refs for name in ('checked','positions','indices','count','total')]
    audit_targets += [f'``Grothe.UpperChaos.Q0NodeMassAll.{name}' for name in
                      ('checked','positions','indices','ordinal_nodup','count','total','each_valid','total_lt_cap')]
    audit_targets += [f'``Grothe.UpperChaos.Q0NodeMassLedger.{name}' for name in
                      ('historical_underflow_le','mass_cap_lt_norm_sq','rawUpper_lt_cap')]
    audit_targets += [f'``Grothe.UpperChaos.Q0NodeMassMajorant.{name}' for name in
                      ('exp_neg_le_majorant','weighted_node_le','weighted_nodes_le')]
    audit = ['import Grothe.UpperChaos.Q0NodeMassAll',
      'import Grothe.UpperChaos.Q0NodeMassLedger',
      'import Grothe.UpperChaos.Q0NodeMassMajorant',
      'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
      '/-! Full candidate arithmetic axiom audit. Agent-ID: codex-aa04. -/',
      'open Lean Elab Command', '', 'run_cmd do',
      '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
      '  let targets : Array Name := #[', '    '+',\n    '.join(audit_targets)+']',
      '  for target in targets do',
      '    let dependencies ← Lean.collectAxioms target',
      '    logInfo m!"Node-mass full audit {target}: {dependencies}"',
      '    for dependency in dependencies do',
      '      unless allowed.contains dependency do',
      '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    files[DIR/'Q0NodeMassAllAudit.lean'] = '\n'.join(audit).encode()
    return files

if __name__ == '__main__':
    files=generate()
    if sys.argv[1:] == ['--check']:
        for path, content in files.items(): assert path.read_bytes() == content, path
    elif not sys.argv[1:]:
        for path, content in files.items(): path.write_bytes(content)
    else: raise SystemExit('usage: gen_node_mass_groups.py [--check]')
    print(f'{len(files)} generated groups; {sum(map(len,files.values()))} bytes')
