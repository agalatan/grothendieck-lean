import Grothe.UpperChaos.OriginalRow227TriangleData1079
import Grothe.UpperChaos.OriginalRow227TriangleData1080
import Grothe.UpperChaos.OriginalRow227TriangleData1090
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1074
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_111, Icur := OriginalRow227TriangleData1079.coefficient78_110,
    output := OriginalRow227TriangleData1090.coefficient79_110, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_112, Icur := OriginalRow227TriangleData1079.coefficient78_111,
    output := OriginalRow227TriangleData1090.coefficient79_111, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_113, Icur := OriginalRow227TriangleData1079.coefficient78_112,
    output := OriginalRow227TriangleData1090.coefficient79_112, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_114, Icur := OriginalRow227TriangleData1079.coefficient78_113,
    output := OriginalRow227TriangleData1090.coefficient79_113, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_115, Icur := OriginalRow227TriangleData1079.coefficient78_114,
    output := OriginalRow227TriangleData1090.coefficient79_114, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_116, Icur := OriginalRow227TriangleData1079.coefficient78_115,
    output := OriginalRow227TriangleData1090.coefficient79_115, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_117, Icur := OriginalRow227TriangleData1079.coefficient78_116,
    output := OriginalRow227TriangleData1090.coefficient79_116, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_118, Icur := OriginalRow227TriangleData1079.coefficient78_117,
    output := OriginalRow227TriangleData1090.coefficient79_117, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_119, Icur := OriginalRow227TriangleData1079.coefficient78_118,
    output := OriginalRow227TriangleData1090.coefficient79_118, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_120, Icur := OriginalRow227TriangleData1079.coefficient78_119,
    output := OriginalRow227TriangleData1090.coefficient79_119, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_121, Icur := OriginalRow227TriangleData1079.coefficient78_120,
    output := OriginalRow227TriangleData1090.coefficient79_120, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_122, Icur := OriginalRow227TriangleData1079.coefficient78_121,
    output := OriginalRow227TriangleData1090.coefficient79_121, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_123, Icur := OriginalRow227TriangleData1079.coefficient78_122,
    output := OriginalRow227TriangleData1090.coefficient79_122, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_124, Icur := OriginalRow227TriangleData1079.coefficient78_123,
    output := OriginalRow227TriangleData1090.coefficient79_123, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_125, Icur := OriginalRow227TriangleData1079.coefficient78_124,
    output := OriginalRow227TriangleData1090.coefficient79_124, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_126, Icur := OriginalRow227TriangleData1079.coefficient78_125,
    output := OriginalRow227TriangleData1090.coefficient79_125, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_127, Icur := OriginalRow227TriangleData1079.coefficient78_126,
    output := OriginalRow227TriangleData1090.coefficient79_126, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_128, Icur := OriginalRow227TriangleData1079.coefficient78_127,
    output := OriginalRow227TriangleData1090.coefficient79_127, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_129, Icur := OriginalRow227TriangleData1079.coefficient78_128,
    output := OriginalRow227TriangleData1090.coefficient79_128, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_130, Icur := OriginalRow227TriangleData1079.coefficient78_129,
    output := OriginalRow227TriangleData1090.coefficient79_129, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_131, Icur := OriginalRow227TriangleData1079.coefficient78_130,
    output := OriginalRow227TriangleData1090.coefficient79_130, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_132, Icur := OriginalRow227TriangleData1079.coefficient78_131,
    output := OriginalRow227TriangleData1090.coefficient79_131, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_133, Icur := OriginalRow227TriangleData1079.coefficient78_132,
    output := OriginalRow227TriangleData1090.coefficient79_132, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_134, Icur := OriginalRow227TriangleData1079.coefficient78_133,
    output := OriginalRow227TriangleData1090.coefficient79_133, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_135, Icur := OriginalRow227TriangleData1079.coefficient78_134,
    output := OriginalRow227TriangleData1090.coefficient79_134, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_136, Icur := OriginalRow227TriangleData1079.coefficient78_135,
    output := OriginalRow227TriangleData1090.coefficient79_135, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_137, Icur := OriginalRow227TriangleData1079.coefficient78_136,
    output := OriginalRow227TriangleData1090.coefficient79_136, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_138, Icur := OriginalRow227TriangleData1079.coefficient78_137,
    output := OriginalRow227TriangleData1090.coefficient79_137, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_139, Icur := OriginalRow227TriangleData1079.coefficient78_138,
    output := OriginalRow227TriangleData1090.coefficient79_138, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1079.coefficient78_140, Icur := OriginalRow227TriangleData1079.coefficient78_139,
    output := OriginalRow227TriangleData1090.coefficient79_139, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1080.coefficient78_141, Icur := OriginalRow227TriangleData1079.coefficient78_140,
    output := OriginalRow227TriangleData1090.coefficient79_140, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root79,
    Inext := OriginalRow227TriangleData1080.coefficient78_142, Icur := OriginalRow227TriangleData1080.coefficient78_141,
    output := OriginalRow227TriangleData1090.coefficient79_141, hC := OriginalRow227TriangleRoots02.root79_pos, hAC := OriginalRow227TriangleRoots02.product79_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1074

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1074.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
