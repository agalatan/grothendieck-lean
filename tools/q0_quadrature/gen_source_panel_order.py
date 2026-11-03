#!/usr/bin/env python3
"""Generate split source-panel ordering certificates.

The input hashes only choose the exact existing Lean panel blocks; Lean must
replay every adjacent comparison. Gaps are permitted. Agent-ID: codex-aa04.
"""
from fractions import Fraction
from hashlib import sha256
from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parents[2]
DATA = ROOT / 'data/q0_quadrature/gauss_mass/panels_N601_Q64_cap1e20.json'
OUT = ROOT / 'Grothe/UpperChaos'
SHA = '59a4f5fda639d83959a55a3a85e355c4f233312ea65d349e502761ae38a34e1d'
BLOCK = 64


def generate():
    raw = DATA.read_bytes()
    if sha256(raw).hexdigest() != SHA:
        raise ValueError('source panel digest mismatch')
    panels = json.loads(raw)['panels']
    if len(panels) != 1289:
        raise ValueError('unexpected source panel count')
    if any(Fraction(p['lo']) >= Fraction(p['hi']) for p in panels):
        raise ValueError('empty or reversed panel')
    if any(Fraction(a['hi']) > Fraction(b['lo']) for a, b in zip(panels, panels[1:])):
        raise ValueError('overlapping or out-of-order panels')
    gaps = sum(Fraction(a['hi']) < Fraction(b['lo']) for a, b in zip(panels, panels[1:]))
    if gaps != 3:
        raise ValueError(f'unexpected number of gaps: {gaps}')
    blocks = [panels[i:i+BLOCK] for i in range(0, len(panels), BLOCK)]
    core = '''import Grothe.UpperChaos.Q0GaussAddressScan
import Mathlib.Data.List.Chain

/-! Ordering relation for the exact production source panel table.
Strict gaps are allowed and are not covered by any panel.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourcePanelOrder

open Grothe.UpperChaos.Q0GaussAddress

/-- A later panel starts no earlier than the earlier panel ends and is
itself well-formed. The last conjunct makes the relation transitive. -/
def follows (p q : Panel) : Prop := p.hi ≤ q.lo ∧ q.lo ≤ q.hi

instance : DecidableRel follows := fun _ _ => inferInstance

instance : Trans follows follows follows where
  trans := by
    intro p q r hpq hqr
    exact ⟨le_trans hpq.1 (le_trans hpq.2 hqr.1), hqr.2⟩

/-- Compose two checked adjacent-panel chains using their actual boundary. -/
theorem chain_append_known (xs ys : List Panel) (p q : Panel)
    (hx : xs.IsChain follows) (hy : ys.IsChain follows)
    (hxp : xs.getLast? = some p) (hyq : ys.head? = some q)
    (hpq : follows p q) : (xs ++ ys).IsChain follows := by
  apply List.IsChain.append hx hy
  intro x hxmem y hymem
  have hxp' : x = p := by simpa [hxp] using hxmem
  have hyq' : y = q := by simpa [hyq] using hymem
  subst x
  subst y
  exact hpq

end Grothe.UpperChaos.Q0SourcePanelOrder
'''
    files = {'Q0SourcePanelOrderCore.lean': core.encode()}
    for i, block in enumerate(blocks):
        name = f'Q0SourcePanelOrderBlock{i:03}'
        body = f'''import Grothe.UpperChaos.Q0SourcePanelOrderCore

/-! Independently checked consecutive source-panel block {i:03};
gaps are allowed. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourcePanelOrder
open Grothe.UpperChaos.Q0GaussAddress
set_option maxRecDepth 8192
set_option maxHeartbeats 0

theorem block{i:03}_chain : panelBlock{i:03}.toList.IsChain follows := by
  decide +kernel

end Grothe.UpperChaos.Q0SourcePanelOrder
'''
        files[name + '.lean'] = body.encode()

    lines = [f'import Grothe.UpperChaos.Q0SourcePanelOrderBlock{i:03}'
             for i in range(len(blocks))]
    lines += ['import Lean.Util.CollectAxioms', 'import Lean.Elab.Command', '',
              '/-! Source-panel chain assembled from independently checked',
              'blocks and actual adjacent boundary links. No interpolation',
              'over the three panel gaps is claimed. Agent-ID: codex-aa04. -/',
              'namespace Grothe.UpperChaos.Q0SourcePanelOrder', '',
              'open Grothe.UpperChaos.Q0GaussAddress',
              'open Grothe.UpperChaos.Q0GaussAddressScan', '',
              'set_option maxRecDepth 65536', 'set_option maxHeartbeats 0', '']
    last = len(blocks)-1
    lines += [f'theorem suffix{last:03}_chain : panelBlock{last:03}.toList.IsChain follows :=',
              f'  block{last:03}_chain', '']
    for i in range(last-1, -1, -1):
        suffix = ' ++ '.join(f'panelBlock{j:03}.toList' for j in range(i, len(blocks)))
        rest = ' ++ '.join(f'panelBlock{j:03}.toList' for j in range(i+1, len(blocks)))
        end = len(blocks[i])-1
        lines += [f'theorem suffix{i:03}_chain : ({suffix}).IsChain follows := by',
                  f'  apply chain_append_known panelBlock{i:03}.toList ({rest})',
                  f'    (panelBlock{i:03}[{end}]\'(by decide +kernel))',
                  f'    (panelBlock{i+1:03}[0]\'(by decide +kernel))',
                  f'  · exact block{i:03}_chain',
                  f'  · exact suffix{i+1:03}_chain',
                  '  · decide +kernel',
                  '  · decide +kernel',
                  '  · decide +kernel', '']
    lines += ['/-- All actual source panels are ordered and nonoverlapping. -/',
              'theorem source_panels_chain : sourcePanels.IsChain follows := by',
              '  simpa only [sourcePanels] using suffix000_chain', '',
              '/-- Any two source panels in list order are nonoverlapping. -/',
              'theorem source_panels_pairwise : sourcePanels.Pairwise follows :=',
              '  List.isChain_iff_pairwise.mp source_panels_chain', '',
              '/-- Source panel positions preserve the physical ordering. -/',
              'theorem panel_hi_le_of_index_lt (i j : Fin sourcePanels.length)',
              '    (hij : i.val < j.val) :',
              '    (sourcePanels.get i).hi ≤ (sourcePanels.get j).lo := by',
              '  have h := source_panels_pairwise.rel_getElem_of_lt i.isLt j.isLt hij',
              '  exact h.1', '',
              'end Grothe.UpperChaos.Q0SourcePanelOrder', '',
              'open Lean Elab Command', 'run_cmd do',
              '  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]',
              '  for target in #[``Grothe.UpperChaos.Q0SourcePanelOrder.source_panels_chain,',
              '      ``Grothe.UpperChaos.Q0SourcePanelOrder.source_panels_pairwise,',
              '      ``Grothe.UpperChaos.Q0SourcePanelOrder.panel_hi_le_of_index_lt] do',
              '    let dependencies ← Lean.collectAxioms target',
              '    for dependency in dependencies do',
              '      unless allowed.contains dependency do',
              '        throwError m!"{target} uses unexpected axiom {dependency}"', '']
    files['Q0SourcePanelOrderAll.lean'] = '\n'.join(lines).encode()
    return files


if __name__ == '__main__':
    generated = generate()
    if sys.argv[1:] == ['--check']:
        for name, data in generated.items():
            if (OUT / name).read_bytes() != data:
                raise ValueError(f'generated file differs: {name}')
    elif not sys.argv[1:]:
        for name, data in generated.items():
            (OUT / name).write_bytes(data)
    else:
        raise SystemExit('usage: gen_source_panel_order.py [--check]')
    print(f'{len(generated)} generated modules, {sum(map(len, generated.values()))} bytes')
