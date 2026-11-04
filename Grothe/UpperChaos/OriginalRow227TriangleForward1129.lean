import Grothe.UpperChaos.OriginalRow227TriangleData1134
import Grothe.UpperChaos.OriginalRow227TriangleData1135
import Grothe.UpperChaos.OriginalRow227TriangleData1145
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1129
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_116, Icur := OriginalRow227TriangleData1134.coefficient83_115,
    output := OriginalRow227TriangleData1145.coefficient84_115, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_117, Icur := OriginalRow227TriangleData1134.coefficient83_116,
    output := OriginalRow227TriangleData1145.coefficient84_116, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_118, Icur := OriginalRow227TriangleData1134.coefficient83_117,
    output := OriginalRow227TriangleData1145.coefficient84_117, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_119, Icur := OriginalRow227TriangleData1134.coefficient83_118,
    output := OriginalRow227TriangleData1145.coefficient84_118, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_120, Icur := OriginalRow227TriangleData1134.coefficient83_119,
    output := OriginalRow227TriangleData1145.coefficient84_119, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_121, Icur := OriginalRow227TriangleData1134.coefficient83_120,
    output := OriginalRow227TriangleData1145.coefficient84_120, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_122, Icur := OriginalRow227TriangleData1134.coefficient83_121,
    output := OriginalRow227TriangleData1145.coefficient84_121, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_123, Icur := OriginalRow227TriangleData1134.coefficient83_122,
    output := OriginalRow227TriangleData1145.coefficient84_122, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_124, Icur := OriginalRow227TriangleData1134.coefficient83_123,
    output := OriginalRow227TriangleData1145.coefficient84_123, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_125, Icur := OriginalRow227TriangleData1134.coefficient83_124,
    output := OriginalRow227TriangleData1145.coefficient84_124, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_126, Icur := OriginalRow227TriangleData1134.coefficient83_125,
    output := OriginalRow227TriangleData1145.coefficient84_125, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_127, Icur := OriginalRow227TriangleData1134.coefficient83_126,
    output := OriginalRow227TriangleData1145.coefficient84_126, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_128, Icur := OriginalRow227TriangleData1134.coefficient83_127,
    output := OriginalRow227TriangleData1145.coefficient84_127, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_129, Icur := OriginalRow227TriangleData1134.coefficient83_128,
    output := OriginalRow227TriangleData1145.coefficient84_128, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_130, Icur := OriginalRow227TriangleData1134.coefficient83_129,
    output := OriginalRow227TriangleData1145.coefficient84_129, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_131, Icur := OriginalRow227TriangleData1134.coefficient83_130,
    output := OriginalRow227TriangleData1145.coefficient84_130, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_132, Icur := OriginalRow227TriangleData1134.coefficient83_131,
    output := OriginalRow227TriangleData1145.coefficient84_131, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_133, Icur := OriginalRow227TriangleData1134.coefficient83_132,
    output := OriginalRow227TriangleData1145.coefficient84_132, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_134, Icur := OriginalRow227TriangleData1134.coefficient83_133,
    output := OriginalRow227TriangleData1145.coefficient84_133, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_135, Icur := OriginalRow227TriangleData1134.coefficient83_134,
    output := OriginalRow227TriangleData1145.coefficient84_134, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_136, Icur := OriginalRow227TriangleData1134.coefficient83_135,
    output := OriginalRow227TriangleData1145.coefficient84_135, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_137, Icur := OriginalRow227TriangleData1134.coefficient83_136,
    output := OriginalRow227TriangleData1145.coefficient84_136, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_138, Icur := OriginalRow227TriangleData1134.coefficient83_137,
    output := OriginalRow227TriangleData1145.coefficient84_137, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_139, Icur := OriginalRow227TriangleData1134.coefficient83_138,
    output := OriginalRow227TriangleData1145.coefficient84_138, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_140, Icur := OriginalRow227TriangleData1134.coefficient83_139,
    output := OriginalRow227TriangleData1145.coefficient84_139, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_141, Icur := OriginalRow227TriangleData1134.coefficient83_140,
    output := OriginalRow227TriangleData1145.coefficient84_140, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_142, Icur := OriginalRow227TriangleData1134.coefficient83_141,
    output := OriginalRow227TriangleData1145.coefficient84_141, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_143, Icur := OriginalRow227TriangleData1134.coefficient83_142,
    output := OriginalRow227TriangleData1145.coefficient84_142, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_144, Icur := OriginalRow227TriangleData1134.coefficient83_143,
    output := OriginalRow227TriangleData1145.coefficient84_143, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1134.coefficient83_145, Icur := OriginalRow227TriangleData1134.coefficient83_144,
    output := OriginalRow227TriangleData1145.coefficient84_144, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_146, Icur := OriginalRow227TriangleData1134.coefficient83_145,
    output := OriginalRow227TriangleData1145.coefficient84_145, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root84,
    Inext := OriginalRow227TriangleData1135.coefficient83_147, Icur := OriginalRow227TriangleData1135.coefficient83_146,
    output := OriginalRow227TriangleData1145.coefficient84_146, hC := OriginalRow227TriangleRoots02.root84_pos, hAC := OriginalRow227TriangleRoots02.product84_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1129

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1129.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
