import Grothe.UpperChaos.OriginalRow227TriangleData0616
import Grothe.UpperChaos.OriginalRow227TriangleData0617
import Grothe.UpperChaos.OriginalRow227TriangleData0630
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0614
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_106, Icur := OriginalRow227TriangleData0616.coefficient41_105,
    output := OriginalRow227TriangleData0630.coefficient42_105, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_107, Icur := OriginalRow227TriangleData0616.coefficient41_106,
    output := OriginalRow227TriangleData0630.coefficient42_106, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_108, Icur := OriginalRow227TriangleData0616.coefficient41_107,
    output := OriginalRow227TriangleData0630.coefficient42_107, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_109, Icur := OriginalRow227TriangleData0616.coefficient41_108,
    output := OriginalRow227TriangleData0630.coefficient42_108, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_110, Icur := OriginalRow227TriangleData0616.coefficient41_109,
    output := OriginalRow227TriangleData0630.coefficient42_109, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_111, Icur := OriginalRow227TriangleData0616.coefficient41_110,
    output := OriginalRow227TriangleData0630.coefficient42_110, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_112, Icur := OriginalRow227TriangleData0616.coefficient41_111,
    output := OriginalRow227TriangleData0630.coefficient42_111, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_113, Icur := OriginalRow227TriangleData0616.coefficient41_112,
    output := OriginalRow227TriangleData0630.coefficient42_112, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_114, Icur := OriginalRow227TriangleData0616.coefficient41_113,
    output := OriginalRow227TriangleData0630.coefficient42_113, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_115, Icur := OriginalRow227TriangleData0616.coefficient41_114,
    output := OriginalRow227TriangleData0630.coefficient42_114, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_116, Icur := OriginalRow227TriangleData0616.coefficient41_115,
    output := OriginalRow227TriangleData0630.coefficient42_115, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_117, Icur := OriginalRow227TriangleData0616.coefficient41_116,
    output := OriginalRow227TriangleData0630.coefficient42_116, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_118, Icur := OriginalRow227TriangleData0616.coefficient41_117,
    output := OriginalRow227TriangleData0630.coefficient42_117, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_119, Icur := OriginalRow227TriangleData0616.coefficient41_118,
    output := OriginalRow227TriangleData0630.coefficient42_118, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_120, Icur := OriginalRow227TriangleData0616.coefficient41_119,
    output := OriginalRow227TriangleData0630.coefficient42_119, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_121, Icur := OriginalRow227TriangleData0616.coefficient41_120,
    output := OriginalRow227TriangleData0630.coefficient42_120, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_122, Icur := OriginalRow227TriangleData0616.coefficient41_121,
    output := OriginalRow227TriangleData0630.coefficient42_121, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_123, Icur := OriginalRow227TriangleData0616.coefficient41_122,
    output := OriginalRow227TriangleData0630.coefficient42_122, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_124, Icur := OriginalRow227TriangleData0616.coefficient41_123,
    output := OriginalRow227TriangleData0630.coefficient42_123, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_125, Icur := OriginalRow227TriangleData0616.coefficient41_124,
    output := OriginalRow227TriangleData0630.coefficient42_124, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_126, Icur := OriginalRow227TriangleData0616.coefficient41_125,
    output := OriginalRow227TriangleData0630.coefficient42_125, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_127, Icur := OriginalRow227TriangleData0616.coefficient41_126,
    output := OriginalRow227TriangleData0630.coefficient42_126, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_128, Icur := OriginalRow227TriangleData0616.coefficient41_127,
    output := OriginalRow227TriangleData0630.coefficient42_127, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots04.root129, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_129, Icur := OriginalRow227TriangleData0616.coefficient41_128,
    output := OriginalRow227TriangleData0630.coefficient42_128, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots04.root130, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_130, Icur := OriginalRow227TriangleData0616.coefficient41_129,
    output := OriginalRow227TriangleData0630.coefficient42_129, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots04.root131, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_131, Icur := OriginalRow227TriangleData0616.coefficient41_130,
    output := OriginalRow227TriangleData0630.coefficient42_130, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots04.root132, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_132, Icur := OriginalRow227TriangleData0616.coefficient41_131,
    output := OriginalRow227TriangleData0630.coefficient42_131, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots04.root133, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_133, Icur := OriginalRow227TriangleData0616.coefficient41_132,
    output := OriginalRow227TriangleData0630.coefficient42_132, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots04.root134, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_134, Icur := OriginalRow227TriangleData0616.coefficient41_133,
    output := OriginalRow227TriangleData0630.coefficient42_133, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots04.root135, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_135, Icur := OriginalRow227TriangleData0616.coefficient41_134,
    output := OriginalRow227TriangleData0630.coefficient42_134, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots04.root136, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_136, Icur := OriginalRow227TriangleData0616.coefficient41_135,
    output := OriginalRow227TriangleData0630.coefficient42_135, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots04.root137, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0617.coefficient41_137, Icur := OriginalRow227TriangleData0617.coefficient41_136,
    output := OriginalRow227TriangleData0630.coefficient42_136, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0614

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0614.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
