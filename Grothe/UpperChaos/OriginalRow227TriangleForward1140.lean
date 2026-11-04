import Grothe.UpperChaos.OriginalRow227TriangleData1145
import Grothe.UpperChaos.OriginalRow227TriangleData1146
import Grothe.UpperChaos.OriginalRow227TriangleData1156
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1140
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_117, Icur := OriginalRow227TriangleData1145.coefficient84_116,
    output := OriginalRow227TriangleData1156.coefficient85_116, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_118, Icur := OriginalRow227TriangleData1145.coefficient84_117,
    output := OriginalRow227TriangleData1156.coefficient85_117, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_119, Icur := OriginalRow227TriangleData1145.coefficient84_118,
    output := OriginalRow227TriangleData1156.coefficient85_118, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_120, Icur := OriginalRow227TriangleData1145.coefficient84_119,
    output := OriginalRow227TriangleData1156.coefficient85_119, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_121, Icur := OriginalRow227TriangleData1145.coefficient84_120,
    output := OriginalRow227TriangleData1156.coefficient85_120, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_122, Icur := OriginalRow227TriangleData1145.coefficient84_121,
    output := OriginalRow227TriangleData1156.coefficient85_121, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_123, Icur := OriginalRow227TriangleData1145.coefficient84_122,
    output := OriginalRow227TriangleData1156.coefficient85_122, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_124, Icur := OriginalRow227TriangleData1145.coefficient84_123,
    output := OriginalRow227TriangleData1156.coefficient85_123, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_125, Icur := OriginalRow227TriangleData1145.coefficient84_124,
    output := OriginalRow227TriangleData1156.coefficient85_124, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_126, Icur := OriginalRow227TriangleData1145.coefficient84_125,
    output := OriginalRow227TriangleData1156.coefficient85_125, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_127, Icur := OriginalRow227TriangleData1145.coefficient84_126,
    output := OriginalRow227TriangleData1156.coefficient85_126, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_128, Icur := OriginalRow227TriangleData1145.coefficient84_127,
    output := OriginalRow227TriangleData1156.coefficient85_127, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_129, Icur := OriginalRow227TriangleData1145.coefficient84_128,
    output := OriginalRow227TriangleData1156.coefficient85_128, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_130, Icur := OriginalRow227TriangleData1145.coefficient84_129,
    output := OriginalRow227TriangleData1156.coefficient85_129, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_131, Icur := OriginalRow227TriangleData1145.coefficient84_130,
    output := OriginalRow227TriangleData1156.coefficient85_130, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_132, Icur := OriginalRow227TriangleData1145.coefficient84_131,
    output := OriginalRow227TriangleData1156.coefficient85_131, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_133, Icur := OriginalRow227TriangleData1145.coefficient84_132,
    output := OriginalRow227TriangleData1156.coefficient85_132, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_134, Icur := OriginalRow227TriangleData1145.coefficient84_133,
    output := OriginalRow227TriangleData1156.coefficient85_133, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_135, Icur := OriginalRow227TriangleData1145.coefficient84_134,
    output := OriginalRow227TriangleData1156.coefficient85_134, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_136, Icur := OriginalRow227TriangleData1145.coefficient84_135,
    output := OriginalRow227TriangleData1156.coefficient85_135, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_137, Icur := OriginalRow227TriangleData1145.coefficient84_136,
    output := OriginalRow227TriangleData1156.coefficient85_136, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots04.root138, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_138, Icur := OriginalRow227TriangleData1145.coefficient84_137,
    output := OriginalRow227TriangleData1156.coefficient85_137, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots04.root139, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_139, Icur := OriginalRow227TriangleData1145.coefficient84_138,
    output := OriginalRow227TriangleData1156.coefficient85_138, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots04.root140, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_140, Icur := OriginalRow227TriangleData1145.coefficient84_139,
    output := OriginalRow227TriangleData1156.coefficient85_139, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots04.root141, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_141, Icur := OriginalRow227TriangleData1145.coefficient84_140,
    output := OriginalRow227TriangleData1156.coefficient85_140, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots04.root142, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_142, Icur := OriginalRow227TriangleData1145.coefficient84_141,
    output := OriginalRow227TriangleData1156.coefficient85_141, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots04.root143, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_143, Icur := OriginalRow227TriangleData1145.coefficient84_142,
    output := OriginalRow227TriangleData1156.coefficient85_142, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots04.root144, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_144, Icur := OriginalRow227TriangleData1145.coefficient84_143,
    output := OriginalRow227TriangleData1156.coefficient85_143, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_145, Icur := OriginalRow227TriangleData1145.coefficient84_144,
    output := OriginalRow227TriangleData1156.coefficient85_144, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1145.coefficient84_146, Icur := OriginalRow227TriangleData1145.coefficient84_145,
    output := OriginalRow227TriangleData1156.coefficient85_145, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1146.coefficient84_147, Icur := OriginalRow227TriangleData1145.coefficient84_146,
    output := OriginalRow227TriangleData1156.coefficient85_146, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots02.root85,
    Inext := OriginalRow227TriangleData1146.coefficient84_148, Icur := OriginalRow227TriangleData1146.coefficient84_147,
    output := OriginalRow227TriangleData1156.coefficient85_147, hC := OriginalRow227TriangleRoots02.root85_pos, hAC := OriginalRow227TriangleRoots02.product85_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1140

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1140.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
