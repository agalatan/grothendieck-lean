import Grothe.UpperChaos.OriginalRow227TriangleData0723
import Grothe.UpperChaos.OriginalRow227TriangleData0724
import Grothe.UpperChaos.OriginalRow227TriangleData0736
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0720
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_114, Icur := OriginalRow227TriangleData0723.coefficient49_113,
    output := OriginalRow227TriangleData0736.coefficient50_113, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_115, Icur := OriginalRow227TriangleData0723.coefficient49_114,
    output := OriginalRow227TriangleData0736.coefficient50_114, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_116, Icur := OriginalRow227TriangleData0723.coefficient49_115,
    output := OriginalRow227TriangleData0736.coefficient50_115, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_117, Icur := OriginalRow227TriangleData0723.coefficient49_116,
    output := OriginalRow227TriangleData0736.coefficient50_116, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_118, Icur := OriginalRow227TriangleData0723.coefficient49_117,
    output := OriginalRow227TriangleData0736.coefficient50_117, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_119, Icur := OriginalRow227TriangleData0723.coefficient49_118,
    output := OriginalRow227TriangleData0736.coefficient50_118, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_120, Icur := OriginalRow227TriangleData0723.coefficient49_119,
    output := OriginalRow227TriangleData0736.coefficient50_119, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_121, Icur := OriginalRow227TriangleData0723.coefficient49_120,
    output := OriginalRow227TriangleData0736.coefficient50_120, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_122, Icur := OriginalRow227TriangleData0723.coefficient49_121,
    output := OriginalRow227TriangleData0736.coefficient50_121, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_123, Icur := OriginalRow227TriangleData0723.coefficient49_122,
    output := OriginalRow227TriangleData0736.coefficient50_122, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_124, Icur := OriginalRow227TriangleData0723.coefficient49_123,
    output := OriginalRow227TriangleData0736.coefficient50_123, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_125, Icur := OriginalRow227TriangleData0723.coefficient49_124,
    output := OriginalRow227TriangleData0736.coefficient50_124, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_126, Icur := OriginalRow227TriangleData0723.coefficient49_125,
    output := OriginalRow227TriangleData0736.coefficient50_125, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_127, Icur := OriginalRow227TriangleData0723.coefficient49_126,
    output := OriginalRow227TriangleData0736.coefficient50_126, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_128, Icur := OriginalRow227TriangleData0723.coefficient49_127,
    output := OriginalRow227TriangleData0736.coefficient50_127, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_129, Icur := OriginalRow227TriangleData0723.coefficient49_128,
    output := OriginalRow227TriangleData0736.coefficient50_128, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_130, Icur := OriginalRow227TriangleData0723.coefficient49_129,
    output := OriginalRow227TriangleData0736.coefficient50_129, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_131, Icur := OriginalRow227TriangleData0723.coefficient49_130,
    output := OriginalRow227TriangleData0736.coefficient50_130, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_132, Icur := OriginalRow227TriangleData0723.coefficient49_131,
    output := OriginalRow227TriangleData0736.coefficient50_131, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_133, Icur := OriginalRow227TriangleData0723.coefficient49_132,
    output := OriginalRow227TriangleData0736.coefficient50_132, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_134, Icur := OriginalRow227TriangleData0723.coefficient49_133,
    output := OriginalRow227TriangleData0736.coefficient50_133, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_135, Icur := OriginalRow227TriangleData0723.coefficient49_134,
    output := OriginalRow227TriangleData0736.coefficient50_134, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_136, Icur := OriginalRow227TriangleData0723.coefficient49_135,
    output := OriginalRow227TriangleData0736.coefficient50_135, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_137, Icur := OriginalRow227TriangleData0723.coefficient49_136,
    output := OriginalRow227TriangleData0736.coefficient50_136, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_138, Icur := OriginalRow227TriangleData0723.coefficient49_137,
    output := OriginalRow227TriangleData0736.coefficient50_137, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_139, Icur := OriginalRow227TriangleData0723.coefficient49_138,
    output := OriginalRow227TriangleData0736.coefficient50_138, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_140, Icur := OriginalRow227TriangleData0723.coefficient49_139,
    output := OriginalRow227TriangleData0736.coefficient50_139, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_141, Icur := OriginalRow227TriangleData0723.coefficient49_140,
    output := OriginalRow227TriangleData0736.coefficient50_140, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_142, Icur := OriginalRow227TriangleData0723.coefficient49_141,
    output := OriginalRow227TriangleData0736.coefficient50_141, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0723.coefficient49_143, Icur := OriginalRow227TriangleData0723.coefficient49_142,
    output := OriginalRow227TriangleData0736.coefficient50_142, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0724.coefficient49_144, Icur := OriginalRow227TriangleData0723.coefficient49_143,
    output := OriginalRow227TriangleData0736.coefficient50_143, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0724.coefficient49_145, Icur := OriginalRow227TriangleData0724.coefficient49_144,
    output := OriginalRow227TriangleData0736.coefficient50_144, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0720

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0720.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
