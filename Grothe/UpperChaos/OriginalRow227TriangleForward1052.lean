import Grothe.UpperChaos.OriginalRow227TriangleData1057
import Grothe.UpperChaos.OriginalRow227TriangleData1058
import Grothe.UpperChaos.OriginalRow227TriangleData1068
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1052
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_109, Icur := OriginalRow227TriangleData1057.coefficient76_108,
    output := OriginalRow227TriangleData1068.coefficient77_108, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_110, Icur := OriginalRow227TriangleData1057.coefficient76_109,
    output := OriginalRow227TriangleData1068.coefficient77_109, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_111, Icur := OriginalRow227TriangleData1057.coefficient76_110,
    output := OriginalRow227TriangleData1068.coefficient77_110, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_112, Icur := OriginalRow227TriangleData1057.coefficient76_111,
    output := OriginalRow227TriangleData1068.coefficient77_111, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_113, Icur := OriginalRow227TriangleData1057.coefficient76_112,
    output := OriginalRow227TriangleData1068.coefficient77_112, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_114, Icur := OriginalRow227TriangleData1057.coefficient76_113,
    output := OriginalRow227TriangleData1068.coefficient77_113, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_115, Icur := OriginalRow227TriangleData1057.coefficient76_114,
    output := OriginalRow227TriangleData1068.coefficient77_114, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_116, Icur := OriginalRow227TriangleData1057.coefficient76_115,
    output := OriginalRow227TriangleData1068.coefficient77_115, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_117, Icur := OriginalRow227TriangleData1057.coefficient76_116,
    output := OriginalRow227TriangleData1068.coefficient77_116, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_118, Icur := OriginalRow227TriangleData1057.coefficient76_117,
    output := OriginalRow227TriangleData1068.coefficient77_117, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_119, Icur := OriginalRow227TriangleData1057.coefficient76_118,
    output := OriginalRow227TriangleData1068.coefficient77_118, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_120, Icur := OriginalRow227TriangleData1057.coefficient76_119,
    output := OriginalRow227TriangleData1068.coefficient77_119, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_121, Icur := OriginalRow227TriangleData1057.coefficient76_120,
    output := OriginalRow227TriangleData1068.coefficient77_120, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_122, Icur := OriginalRow227TriangleData1057.coefficient76_121,
    output := OriginalRow227TriangleData1068.coefficient77_121, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_123, Icur := OriginalRow227TriangleData1057.coefficient76_122,
    output := OriginalRow227TriangleData1068.coefficient77_122, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_124, Icur := OriginalRow227TriangleData1057.coefficient76_123,
    output := OriginalRow227TriangleData1068.coefficient77_123, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_125, Icur := OriginalRow227TriangleData1057.coefficient76_124,
    output := OriginalRow227TriangleData1068.coefficient77_124, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_126, Icur := OriginalRow227TriangleData1057.coefficient76_125,
    output := OriginalRow227TriangleData1068.coefficient77_125, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_127, Icur := OriginalRow227TriangleData1057.coefficient76_126,
    output := OriginalRow227TriangleData1068.coefficient77_126, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_128, Icur := OriginalRow227TriangleData1057.coefficient76_127,
    output := OriginalRow227TriangleData1068.coefficient77_127, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_129, Icur := OriginalRow227TriangleData1057.coefficient76_128,
    output := OriginalRow227TriangleData1068.coefficient77_128, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_130, Icur := OriginalRow227TriangleData1057.coefficient76_129,
    output := OriginalRow227TriangleData1068.coefficient77_129, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_131, Icur := OriginalRow227TriangleData1057.coefficient76_130,
    output := OriginalRow227TriangleData1068.coefficient77_130, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_132, Icur := OriginalRow227TriangleData1057.coefficient76_131,
    output := OriginalRow227TriangleData1068.coefficient77_131, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_133, Icur := OriginalRow227TriangleData1057.coefficient76_132,
    output := OriginalRow227TriangleData1068.coefficient77_132, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_134, Icur := OriginalRow227TriangleData1057.coefficient76_133,
    output := OriginalRow227TriangleData1068.coefficient77_133, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_135, Icur := OriginalRow227TriangleData1057.coefficient76_134,
    output := OriginalRow227TriangleData1068.coefficient77_134, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_136, Icur := OriginalRow227TriangleData1057.coefficient76_135,
    output := OriginalRow227TriangleData1068.coefficient77_135, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_137, Icur := OriginalRow227TriangleData1057.coefficient76_136,
    output := OriginalRow227TriangleData1068.coefficient77_136, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1057.coefficient76_138, Icur := OriginalRow227TriangleData1057.coefficient76_137,
    output := OriginalRow227TriangleData1068.coefficient77_137, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_139, Icur := OriginalRow227TriangleData1057.coefficient76_138,
    output := OriginalRow227TriangleData1068.coefficient77_138, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root77,
    Inext := OriginalRow227TriangleData1058.coefficient76_140, Icur := OriginalRow227TriangleData1058.coefficient76_139,
    output := OriginalRow227TriangleData1068.coefficient77_139, hC := OriginalRow227TriangleRoots02.root77_pos, hAC := OriginalRow227TriangleRoots02.product77_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1052

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1052.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
