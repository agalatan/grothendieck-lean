#!/usr/bin/env python3
"""Generate Lean lookup links to the selected rules. Agent-ID: codex-aa04.

The generated theorems are proof obligations, not evidence of acceptance.
"""
from pathlib import Path
import sys
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'Grothe/UpperChaos/Q0GaussSelectedLookup.lean'

def generate():
    lines = ['import Grothe.UpperChaos.Q0GaussSelectedRulesAudit',
             'import Grothe.UpperChaos.Q0GaussIndexedContext',
             'import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
             '/-! Connect safe order/rule context lookup to the same',
             'selected-root families. Agent-ID: codex-aa04. -/',
             'namespace Grothe.UpperChaos.Q0GaussSelectedLookup', '']
    targets = []
    for n in range(1, 65):
        selected = f'Grothe.UpperChaos.Q0GaussSelectedRule{n:02d}'
        rule = f'Grothe.UpperChaos.Q0GaussIndexedContext.rule{n:02d}'
        name = f'rule{n:02d}'
        targets += [f'``Grothe.UpperChaos.Q0GaussSelectedLookup.order{n:02d}',
                    f'``Grothe.UpperChaos.Q0GaussSelectedLookup.{name}']
        lines += [f'theorem order{n:02d} :',
                  f'    Grothe.UpperChaos.Q0GaussIndexedContext.rules[{n-1}]? = some {rule} := by',
                  '  rfl', '',
                  f'theorem {name} (i : Fin {n}) :',
                  f'    {rule}[i.val]? = some ({selected}.selected.lower i,',
                  f'      {selected}.selected.upper i) := by',
                  f'  change {selected}.indexedContext[i.val]? = _',
                  f'  exact {selected}.context_lookup i', '']
    lines += ['end Grothe.UpperChaos.Q0GaussSelectedLookup', '', 'open Lean Elab Command',
              'run_cmd do',
              '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
              '  let targets : Array Name := #[', '    '+',\n    '.join(targets)+']',
              '  for target in targets do',
              '    let dependencies ← Lean.collectAxioms target',
              '    logInfo m!"Selected context audit {target}: {dependencies}"',
              '    for dependency in dependencies do',
              '      unless allowed.contains dependency do',
              '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    return '\n'.join(lines).encode()

if __name__ == '__main__':
    contents = generate()
    if sys.argv[1:] == ['--check']:
        if OUT.read_bytes() != contents:
            raise ValueError(f'generated file differs: {OUT}')
    elif not sys.argv[1:]:
        OUT.write_bytes(contents)
    else:
        raise SystemExit('usage: gen_gauss_selected_lookup.py [--check]')
    print(f'1 generated module, {len(contents)} bytes')
