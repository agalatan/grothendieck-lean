import Grothe.UpperChaos.OriginalRow227TriangleData1068
import Grothe.UpperChaos.OriginalRow227TriangleData1069
import Grothe.UpperChaos.OriginalRow227TriangleData1079
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1063
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_110, Icur := OriginalRow227TriangleData1068.coefficient77_109,
    output := OriginalRow227TriangleData1079.coefficient78_109, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_111, Icur := OriginalRow227TriangleData1068.coefficient77_110,
    output := OriginalRow227TriangleData1079.coefficient78_110, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_112, Icur := OriginalRow227TriangleData1068.coefficient77_111,
    output := OriginalRow227TriangleData1079.coefficient78_111, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_113, Icur := OriginalRow227TriangleData1068.coefficient77_112,
    output := OriginalRow227TriangleData1079.coefficient78_112, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_114, Icur := OriginalRow227TriangleData1068.coefficient77_113,
    output := OriginalRow227TriangleData1079.coefficient78_113, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_115, Icur := OriginalRow227TriangleData1068.coefficient77_114,
    output := OriginalRow227TriangleData1079.coefficient78_114, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_116, Icur := OriginalRow227TriangleData1068.coefficient77_115,
    output := OriginalRow227TriangleData1079.coefficient78_115, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_117, Icur := OriginalRow227TriangleData1068.coefficient77_116,
    output := OriginalRow227TriangleData1079.coefficient78_116, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_118, Icur := OriginalRow227TriangleData1068.coefficient77_117,
    output := OriginalRow227TriangleData1079.coefficient78_117, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_119, Icur := OriginalRow227TriangleData1068.coefficient77_118,
    output := OriginalRow227TriangleData1079.coefficient78_118, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_120, Icur := OriginalRow227TriangleData1068.coefficient77_119,
    output := OriginalRow227TriangleData1079.coefficient78_119, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_121, Icur := OriginalRow227TriangleData1068.coefficient77_120,
    output := OriginalRow227TriangleData1079.coefficient78_120, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_122, Icur := OriginalRow227TriangleData1068.coefficient77_121,
    output := OriginalRow227TriangleData1079.coefficient78_121, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_123, Icur := OriginalRow227TriangleData1068.coefficient77_122,
    output := OriginalRow227TriangleData1079.coefficient78_122, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_124, Icur := OriginalRow227TriangleData1068.coefficient77_123,
    output := OriginalRow227TriangleData1079.coefficient78_123, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_125, Icur := OriginalRow227TriangleData1068.coefficient77_124,
    output := OriginalRow227TriangleData1079.coefficient78_124, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_126, Icur := OriginalRow227TriangleData1068.coefficient77_125,
    output := OriginalRow227TriangleData1079.coefficient78_125, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_127, Icur := OriginalRow227TriangleData1068.coefficient77_126,
    output := OriginalRow227TriangleData1079.coefficient78_126, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_128, Icur := OriginalRow227TriangleData1068.coefficient77_127,
    output := OriginalRow227TriangleData1079.coefficient78_127, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_129, Icur := OriginalRow227TriangleData1068.coefficient77_128,
    output := OriginalRow227TriangleData1079.coefficient78_128, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_130, Icur := OriginalRow227TriangleData1068.coefficient77_129,
    output := OriginalRow227TriangleData1079.coefficient78_129, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_131, Icur := OriginalRow227TriangleData1068.coefficient77_130,
    output := OriginalRow227TriangleData1079.coefficient78_130, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_132, Icur := OriginalRow227TriangleData1068.coefficient77_131,
    output := OriginalRow227TriangleData1079.coefficient78_131, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_133, Icur := OriginalRow227TriangleData1068.coefficient77_132,
    output := OriginalRow227TriangleData1079.coefficient78_132, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_134, Icur := OriginalRow227TriangleData1068.coefficient77_133,
    output := OriginalRow227TriangleData1079.coefficient78_133, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_135, Icur := OriginalRow227TriangleData1068.coefficient77_134,
    output := OriginalRow227TriangleData1079.coefficient78_134, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_136, Icur := OriginalRow227TriangleData1068.coefficient77_135,
    output := OriginalRow227TriangleData1079.coefficient78_135, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_137, Icur := OriginalRow227TriangleData1068.coefficient77_136,
    output := OriginalRow227TriangleData1079.coefficient78_136, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_138, Icur := OriginalRow227TriangleData1068.coefficient77_137,
    output := OriginalRow227TriangleData1079.coefficient78_137, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1068.coefficient77_139, Icur := OriginalRow227TriangleData1068.coefficient77_138,
    output := OriginalRow227TriangleData1079.coefficient78_138, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1069.coefficient77_140, Icur := OriginalRow227TriangleData1068.coefficient77_139,
    output := OriginalRow227TriangleData1079.coefficient78_139, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root78,
    Inext := OriginalRow227TriangleData1069.coefficient77_141, Icur := OriginalRow227TriangleData1069.coefficient77_140,
    output := OriginalRow227TriangleData1079.coefficient78_140, hC := OriginalRow227TriangleRoots02.root78_pos, hAC := OriginalRow227TriangleRoots02.product78_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1063

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1063.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
