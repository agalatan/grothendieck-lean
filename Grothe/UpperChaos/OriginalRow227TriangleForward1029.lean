import Grothe.UpperChaos.OriginalRow227TriangleData1033
import Grothe.UpperChaos.OriginalRow227TriangleData1034
import Grothe.UpperChaos.OriginalRow227TriangleData1045
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1029
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_107, Icur := OriginalRow227TriangleData1033.coefficient74_106,
    output := OriginalRow227TriangleData1045.coefficient75_106, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_108, Icur := OriginalRow227TriangleData1033.coefficient74_107,
    output := OriginalRow227TriangleData1045.coefficient75_107, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_109, Icur := OriginalRow227TriangleData1033.coefficient74_108,
    output := OriginalRow227TriangleData1045.coefficient75_108, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_110, Icur := OriginalRow227TriangleData1033.coefficient74_109,
    output := OriginalRow227TriangleData1045.coefficient75_109, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_111, Icur := OriginalRow227TriangleData1033.coefficient74_110,
    output := OriginalRow227TriangleData1045.coefficient75_110, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_112, Icur := OriginalRow227TriangleData1033.coefficient74_111,
    output := OriginalRow227TriangleData1045.coefficient75_111, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_113, Icur := OriginalRow227TriangleData1033.coefficient74_112,
    output := OriginalRow227TriangleData1045.coefficient75_112, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_114, Icur := OriginalRow227TriangleData1033.coefficient74_113,
    output := OriginalRow227TriangleData1045.coefficient75_113, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_115, Icur := OriginalRow227TriangleData1033.coefficient74_114,
    output := OriginalRow227TriangleData1045.coefficient75_114, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_116, Icur := OriginalRow227TriangleData1033.coefficient74_115,
    output := OriginalRow227TriangleData1045.coefficient75_115, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_117, Icur := OriginalRow227TriangleData1033.coefficient74_116,
    output := OriginalRow227TriangleData1045.coefficient75_116, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_118, Icur := OriginalRow227TriangleData1033.coefficient74_117,
    output := OriginalRow227TriangleData1045.coefficient75_117, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_119, Icur := OriginalRow227TriangleData1033.coefficient74_118,
    output := OriginalRow227TriangleData1045.coefficient75_118, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_120, Icur := OriginalRow227TriangleData1033.coefficient74_119,
    output := OriginalRow227TriangleData1045.coefficient75_119, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_121, Icur := OriginalRow227TriangleData1033.coefficient74_120,
    output := OriginalRow227TriangleData1045.coefficient75_120, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_122, Icur := OriginalRow227TriangleData1033.coefficient74_121,
    output := OriginalRow227TriangleData1045.coefficient75_121, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_123, Icur := OriginalRow227TriangleData1033.coefficient74_122,
    output := OriginalRow227TriangleData1045.coefficient75_122, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_124, Icur := OriginalRow227TriangleData1033.coefficient74_123,
    output := OriginalRow227TriangleData1045.coefficient75_123, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_125, Icur := OriginalRow227TriangleData1033.coefficient74_124,
    output := OriginalRow227TriangleData1045.coefficient75_124, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_126, Icur := OriginalRow227TriangleData1033.coefficient74_125,
    output := OriginalRow227TriangleData1045.coefficient75_125, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_127, Icur := OriginalRow227TriangleData1033.coefficient74_126,
    output := OriginalRow227TriangleData1045.coefficient75_126, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_128, Icur := OriginalRow227TriangleData1033.coefficient74_127,
    output := OriginalRow227TriangleData1045.coefficient75_127, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_129, Icur := OriginalRow227TriangleData1033.coefficient74_128,
    output := OriginalRow227TriangleData1045.coefficient75_128, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_130, Icur := OriginalRow227TriangleData1033.coefficient74_129,
    output := OriginalRow227TriangleData1045.coefficient75_129, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_131, Icur := OriginalRow227TriangleData1033.coefficient74_130,
    output := OriginalRow227TriangleData1045.coefficient75_130, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_132, Icur := OriginalRow227TriangleData1033.coefficient74_131,
    output := OriginalRow227TriangleData1045.coefficient75_131, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_133, Icur := OriginalRow227TriangleData1033.coefficient74_132,
    output := OriginalRow227TriangleData1045.coefficient75_132, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_134, Icur := OriginalRow227TriangleData1033.coefficient74_133,
    output := OriginalRow227TriangleData1045.coefficient75_133, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_135, Icur := OriginalRow227TriangleData1033.coefficient74_134,
    output := OriginalRow227TriangleData1045.coefficient75_134, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1033.coefficient74_136, Icur := OriginalRow227TriangleData1033.coefficient74_135,
    output := OriginalRow227TriangleData1045.coefficient75_135, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1034.coefficient74_137, Icur := OriginalRow227TriangleData1033.coefficient74_136,
    output := OriginalRow227TriangleData1045.coefficient75_136, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1034.coefficient74_138, Icur := OriginalRow227TriangleData1034.coefficient74_137,
    output := OriginalRow227TriangleData1045.coefficient75_137, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1029

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1029.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
