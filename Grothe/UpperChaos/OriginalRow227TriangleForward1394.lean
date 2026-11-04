import Grothe.UpperChaos.OriginalRow227TriangleData1401
import Grothe.UpperChaos.OriginalRow227TriangleData1402
import Grothe.UpperChaos.OriginalRow227TriangleData1410
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1394
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_110, Icur := OriginalRow227TriangleData1401.coefficient109_109,
    output := OriginalRow227TriangleData1410.coefficient110_109, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_111, Icur := OriginalRow227TriangleData1401.coefficient109_110,
    output := OriginalRow227TriangleData1410.coefficient110_110, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_112, Icur := OriginalRow227TriangleData1401.coefficient109_111,
    output := OriginalRow227TriangleData1410.coefficient110_111, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_113, Icur := OriginalRow227TriangleData1401.coefficient109_112,
    output := OriginalRow227TriangleData1410.coefficient110_112, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_114, Icur := OriginalRow227TriangleData1401.coefficient109_113,
    output := OriginalRow227TriangleData1410.coefficient110_113, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_115, Icur := OriginalRow227TriangleData1401.coefficient109_114,
    output := OriginalRow227TriangleData1410.coefficient110_114, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_116, Icur := OriginalRow227TriangleData1401.coefficient109_115,
    output := OriginalRow227TriangleData1410.coefficient110_115, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_117, Icur := OriginalRow227TriangleData1401.coefficient109_116,
    output := OriginalRow227TriangleData1410.coefficient110_116, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_118, Icur := OriginalRow227TriangleData1401.coefficient109_117,
    output := OriginalRow227TriangleData1410.coefficient110_117, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_119, Icur := OriginalRow227TriangleData1401.coefficient109_118,
    output := OriginalRow227TriangleData1410.coefficient110_118, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_120, Icur := OriginalRow227TriangleData1401.coefficient109_119,
    output := OriginalRow227TriangleData1410.coefficient110_119, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_121, Icur := OriginalRow227TriangleData1401.coefficient109_120,
    output := OriginalRow227TriangleData1410.coefficient110_120, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_122, Icur := OriginalRow227TriangleData1401.coefficient109_121,
    output := OriginalRow227TriangleData1410.coefficient110_121, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_123, Icur := OriginalRow227TriangleData1401.coefficient109_122,
    output := OriginalRow227TriangleData1410.coefficient110_122, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_124, Icur := OriginalRow227TriangleData1401.coefficient109_123,
    output := OriginalRow227TriangleData1410.coefficient110_123, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_125, Icur := OriginalRow227TriangleData1401.coefficient109_124,
    output := OriginalRow227TriangleData1410.coefficient110_124, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_126, Icur := OriginalRow227TriangleData1401.coefficient109_125,
    output := OriginalRow227TriangleData1410.coefficient110_125, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_127, Icur := OriginalRow227TriangleData1401.coefficient109_126,
    output := OriginalRow227TriangleData1410.coefficient110_126, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_128, Icur := OriginalRow227TriangleData1401.coefficient109_127,
    output := OriginalRow227TriangleData1410.coefficient110_127, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_129, Icur := OriginalRow227TriangleData1401.coefficient109_128,
    output := OriginalRow227TriangleData1410.coefficient110_128, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_130, Icur := OriginalRow227TriangleData1401.coefficient109_129,
    output := OriginalRow227TriangleData1410.coefficient110_129, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_131, Icur := OriginalRow227TriangleData1401.coefficient109_130,
    output := OriginalRow227TriangleData1410.coefficient110_130, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_132, Icur := OriginalRow227TriangleData1401.coefficient109_131,
    output := OriginalRow227TriangleData1410.coefficient110_131, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_133, Icur := OriginalRow227TriangleData1401.coefficient109_132,
    output := OriginalRow227TriangleData1410.coefficient110_132, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_134, Icur := OriginalRow227TriangleData1401.coefficient109_133,
    output := OriginalRow227TriangleData1410.coefficient110_133, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_135, Icur := OriginalRow227TriangleData1401.coefficient109_134,
    output := OriginalRow227TriangleData1410.coefficient110_134, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_136, Icur := OriginalRow227TriangleData1401.coefficient109_135,
    output := OriginalRow227TriangleData1410.coefficient110_135, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_137, Icur := OriginalRow227TriangleData1401.coefficient109_136,
    output := OriginalRow227TriangleData1410.coefficient110_136, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_138, Icur := OriginalRow227TriangleData1401.coefficient109_137,
    output := OriginalRow227TriangleData1410.coefficient110_137, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1401.coefficient109_139, Icur := OriginalRow227TriangleData1401.coefficient109_138,
    output := OriginalRow227TriangleData1410.coefficient110_138, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1402.coefficient109_140, Icur := OriginalRow227TriangleData1401.coefficient109_139,
    output := OriginalRow227TriangleData1410.coefficient110_139, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots03.root110,
    Inext := OriginalRow227TriangleData1402.coefficient109_141, Icur := OriginalRow227TriangleData1402.coefficient109_140,
    output := OriginalRow227TriangleData1410.coefficient110_140, hC := OriginalRow227TriangleRoots03.root110_pos, hAC := OriginalRow227TriangleRoots03.product110_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1394

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1394.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
