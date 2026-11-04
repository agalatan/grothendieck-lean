import Grothe.UpperChaos.OriginalRow227TriangleData1045
import Grothe.UpperChaos.OriginalRow227TriangleData1046
import Grothe.UpperChaos.OriginalRow227TriangleData1057
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1041
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_108, Icur := OriginalRow227TriangleData1045.coefficient75_107,
    output := OriginalRow227TriangleData1057.coefficient76_107, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_109, Icur := OriginalRow227TriangleData1045.coefficient75_108,
    output := OriginalRow227TriangleData1057.coefficient76_108, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_110, Icur := OriginalRow227TriangleData1045.coefficient75_109,
    output := OriginalRow227TriangleData1057.coefficient76_109, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_111, Icur := OriginalRow227TriangleData1045.coefficient75_110,
    output := OriginalRow227TriangleData1057.coefficient76_110, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_112, Icur := OriginalRow227TriangleData1045.coefficient75_111,
    output := OriginalRow227TriangleData1057.coefficient76_111, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_113, Icur := OriginalRow227TriangleData1045.coefficient75_112,
    output := OriginalRow227TriangleData1057.coefficient76_112, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_114, Icur := OriginalRow227TriangleData1045.coefficient75_113,
    output := OriginalRow227TriangleData1057.coefficient76_113, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_115, Icur := OriginalRow227TriangleData1045.coefficient75_114,
    output := OriginalRow227TriangleData1057.coefficient76_114, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_116, Icur := OriginalRow227TriangleData1045.coefficient75_115,
    output := OriginalRow227TriangleData1057.coefficient76_115, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_117, Icur := OriginalRow227TriangleData1045.coefficient75_116,
    output := OriginalRow227TriangleData1057.coefficient76_116, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_118, Icur := OriginalRow227TriangleData1045.coefficient75_117,
    output := OriginalRow227TriangleData1057.coefficient76_117, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_119, Icur := OriginalRow227TriangleData1045.coefficient75_118,
    output := OriginalRow227TriangleData1057.coefficient76_118, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_120, Icur := OriginalRow227TriangleData1045.coefficient75_119,
    output := OriginalRow227TriangleData1057.coefficient76_119, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_121, Icur := OriginalRow227TriangleData1045.coefficient75_120,
    output := OriginalRow227TriangleData1057.coefficient76_120, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_122, Icur := OriginalRow227TriangleData1045.coefficient75_121,
    output := OriginalRow227TriangleData1057.coefficient76_121, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_123, Icur := OriginalRow227TriangleData1045.coefficient75_122,
    output := OriginalRow227TriangleData1057.coefficient76_122, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_124, Icur := OriginalRow227TriangleData1045.coefficient75_123,
    output := OriginalRow227TriangleData1057.coefficient76_123, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_125, Icur := OriginalRow227TriangleData1045.coefficient75_124,
    output := OriginalRow227TriangleData1057.coefficient76_124, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_126, Icur := OriginalRow227TriangleData1045.coefficient75_125,
    output := OriginalRow227TriangleData1057.coefficient76_125, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_127, Icur := OriginalRow227TriangleData1045.coefficient75_126,
    output := OriginalRow227TriangleData1057.coefficient76_126, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_128, Icur := OriginalRow227TriangleData1045.coefficient75_127,
    output := OriginalRow227TriangleData1057.coefficient76_127, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_129, Icur := OriginalRow227TriangleData1045.coefficient75_128,
    output := OriginalRow227TriangleData1057.coefficient76_128, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_130, Icur := OriginalRow227TriangleData1045.coefficient75_129,
    output := OriginalRow227TriangleData1057.coefficient76_129, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_131, Icur := OriginalRow227TriangleData1045.coefficient75_130,
    output := OriginalRow227TriangleData1057.coefficient76_130, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_132, Icur := OriginalRow227TriangleData1045.coefficient75_131,
    output := OriginalRow227TriangleData1057.coefficient76_131, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_133, Icur := OriginalRow227TriangleData1045.coefficient75_132,
    output := OriginalRow227TriangleData1057.coefficient76_132, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_134, Icur := OriginalRow227TriangleData1045.coefficient75_133,
    output := OriginalRow227TriangleData1057.coefficient76_133, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_135, Icur := OriginalRow227TriangleData1045.coefficient75_134,
    output := OriginalRow227TriangleData1057.coefficient76_134, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_136, Icur := OriginalRow227TriangleData1045.coefficient75_135,
    output := OriginalRow227TriangleData1057.coefficient76_135, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1045.coefficient75_137, Icur := OriginalRow227TriangleData1045.coefficient75_136,
    output := OriginalRow227TriangleData1057.coefficient76_136, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1046.coefficient75_138, Icur := OriginalRow227TriangleData1045.coefficient75_137,
    output := OriginalRow227TriangleData1057.coefficient76_137, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root76,
    Inext := OriginalRow227TriangleData1046.coefficient75_139, Icur := OriginalRow227TriangleData1046.coefficient75_138,
    output := OriginalRow227TriangleData1057.coefficient76_138, hC := OriginalRow227TriangleRoots02.root76_pos, hAC := OriginalRow227TriangleRoots02.product76_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1041

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1041.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
