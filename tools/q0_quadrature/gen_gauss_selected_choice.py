#!/usr/bin/env python3
"""Generate the finite-order dependent selected-rule interface.

The generated Lean proof checks the relationship to each selected rule's
own exact context; production table and quadrature semantics are separate.
Agent-ID: codex-aa04.
"""
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'Grothe/UpperChaos/Q0GaussSelectedChoice.lean'


def generate():
    lines = [
        'import Grothe.UpperChaos.Q0GaussSelectedRulesAudit',
        'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
        '/-! Dependent selection of the checked original root families for',
        'all supported orders. Production context table and Gaussian',
        'quadrature identity remain separate. Agent-ID: codex-aa04. -/',
        'set_option maxRecDepth 8192', '',
        'namespace Grothe.UpperChaos.Q0GaussSelectedChoice', '',
        'open Grothe.UpperChaos.Q0GaussSelected', '',
        'noncomputable def selectedFor (n : ℕ) (h : 1 ≤ n ∧ n ≤ 64) : SelectedRule n :=',
    ]
    for n in range(1, 64):
        prefix = '  if' if n == 1 else '  else if'
        lines += [f'{prefix} h{n:02d} : n = {n} then by',
                  '    subst n',
                  f'    exact Grothe.UpperChaos.Q0GaussSelectedRule{n:02d}.selected']
    lines += ['  else by', '    have h64 : n = 64 := by omega', '    subst n',
              '    exact Grothe.UpperChaos.Q0GaussSelectedRule64.selected', '',
              'def contextFor (n : ℕ) : Option (Array (ℚ × ℚ)) :=',
              '  match n with']
    for n in range(1, 65):
        lines.append(f'  | {n} => some Grothe.UpperChaos.Q0GaussSelectedRule{n:02d}.indexedContext')
    lines += ['  | _ => none', '',
              '-- The 64 dependent cases share one elaboration budget.',
              'set_option maxHeartbeats 4000000 in',
              'theorem selected_context (n : ℕ) (h : 1 ≤ n ∧ n ≤ 64) (i : Fin n) :',
              '    (do let t ← contextFor n; t[i.val]?) =',
              '      some ((selectedFor n h).lower i, (selectedFor n h).upper i) := by',
              '  have hlo : 1 ≤ n := h.1', '  have hhi : n ≤ 64 := h.2',
              '  interval_cases n']
    for n in range(1, 65):
        lines += ['  · simpa [contextFor, selectedFor] using',
                  f'      Grothe.UpperChaos.Q0GaussSelectedRule{n:02d}.context_lookup i']
    lines += ['', 'end Grothe.UpperChaos.Q0GaussSelectedChoice', '',
              'open Lean Elab Command', 'run_cmd do',
              '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
              '  let targets : Array Name := #[',
              '    ``Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor,',
              '    ``Grothe.UpperChaos.Q0GaussSelectedChoice.selected_context]',
              '  for target in targets do',
              '    let dependencies ← Lean.collectAxioms target',
              '    logInfo m!"Selected choice audit {target}: {dependencies}"',
              '    for dependency in dependencies do',
              '      unless allowed.contains dependency do',
              '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    return '\n'.join(lines).encode()


if __name__ == '__main__':
    generated = generate()
    if sys.argv[1:] == ['--check']:
        if OUT.read_bytes() != generated:
            raise ValueError(f'generated file differs: {OUT}')
    elif not sys.argv[1:]:
        OUT.write_bytes(generated)
    else:
        raise SystemExit('usage: gen_gauss_selected_choice.py [--check]')
    print(f'1 generated module, {len(generated)} bytes')
