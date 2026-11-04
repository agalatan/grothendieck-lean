import Grothe.UpperChaos.OriginalRow227TriangleData1173
import Grothe.UpperChaos.OriginalRow227TriangleData1174
import Grothe.UpperChaos.OriginalRow227TriangleData1184
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1168
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_311, Icur := OriginalRow227TriangleData1173.coefficient86_310,
    output := OriginalRow227TriangleData1184.coefficient87_310, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_312, Icur := OriginalRow227TriangleData1173.coefficient86_311,
    output := OriginalRow227TriangleData1184.coefficient87_311, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_313, Icur := OriginalRow227TriangleData1173.coefficient86_312,
    output := OriginalRow227TriangleData1184.coefficient87_312, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_314, Icur := OriginalRow227TriangleData1173.coefficient86_313,
    output := OriginalRow227TriangleData1184.coefficient87_313, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_315, Icur := OriginalRow227TriangleData1173.coefficient86_314,
    output := OriginalRow227TriangleData1184.coefficient87_314, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_316, Icur := OriginalRow227TriangleData1173.coefficient86_315,
    output := OriginalRow227TriangleData1184.coefficient87_315, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_317, Icur := OriginalRow227TriangleData1173.coefficient86_316,
    output := OriginalRow227TriangleData1184.coefficient87_316, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_318, Icur := OriginalRow227TriangleData1173.coefficient86_317,
    output := OriginalRow227TriangleData1184.coefficient87_317, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_319, Icur := OriginalRow227TriangleData1173.coefficient86_318,
    output := OriginalRow227TriangleData1184.coefficient87_318, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_320, Icur := OriginalRow227TriangleData1173.coefficient86_319,
    output := OriginalRow227TriangleData1184.coefficient87_319, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_321, Icur := OriginalRow227TriangleData1173.coefficient86_320,
    output := OriginalRow227TriangleData1184.coefficient87_320, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_322, Icur := OriginalRow227TriangleData1173.coefficient86_321,
    output := OriginalRow227TriangleData1184.coefficient87_321, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_323, Icur := OriginalRow227TriangleData1173.coefficient86_322,
    output := OriginalRow227TriangleData1184.coefficient87_322, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_324, Icur := OriginalRow227TriangleData1173.coefficient86_323,
    output := OriginalRow227TriangleData1184.coefficient87_323, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_325, Icur := OriginalRow227TriangleData1173.coefficient86_324,
    output := OriginalRow227TriangleData1184.coefficient87_324, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_326, Icur := OriginalRow227TriangleData1173.coefficient86_325,
    output := OriginalRow227TriangleData1184.coefficient87_325, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_327, Icur := OriginalRow227TriangleData1173.coefficient86_326,
    output := OriginalRow227TriangleData1184.coefficient87_326, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_328, Icur := OriginalRow227TriangleData1173.coefficient86_327,
    output := OriginalRow227TriangleData1184.coefficient87_327, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_329, Icur := OriginalRow227TriangleData1173.coefficient86_328,
    output := OriginalRow227TriangleData1184.coefficient87_328, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_330, Icur := OriginalRow227TriangleData1173.coefficient86_329,
    output := OriginalRow227TriangleData1184.coefficient87_329, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots10.root331, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_331, Icur := OriginalRow227TriangleData1173.coefficient86_330,
    output := OriginalRow227TriangleData1184.coefficient87_330, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots10.root332, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_332, Icur := OriginalRow227TriangleData1173.coefficient86_331,
    output := OriginalRow227TriangleData1184.coefficient87_331, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root333, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_333, Icur := OriginalRow227TriangleData1173.coefficient86_332,
    output := OriginalRow227TriangleData1184.coefficient87_332, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root334, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_334, Icur := OriginalRow227TriangleData1173.coefficient86_333,
    output := OriginalRow227TriangleData1184.coefficient87_333, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root335, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_335, Icur := OriginalRow227TriangleData1173.coefficient86_334,
    output := OriginalRow227TriangleData1184.coefficient87_334, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root336, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_336, Icur := OriginalRow227TriangleData1173.coefficient86_335,
    output := OriginalRow227TriangleData1184.coefficient87_335, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root337, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_337, Icur := OriginalRow227TriangleData1173.coefficient86_336,
    output := OriginalRow227TriangleData1184.coefficient87_336, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root338, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_338, Icur := OriginalRow227TriangleData1173.coefficient86_337,
    output := OriginalRow227TriangleData1184.coefficient87_337, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root339, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_339, Icur := OriginalRow227TriangleData1173.coefficient86_338,
    output := OriginalRow227TriangleData1184.coefficient87_338, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root340, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1173.coefficient86_340, Icur := OriginalRow227TriangleData1173.coefficient86_339,
    output := OriginalRow227TriangleData1184.coefficient87_339, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root341, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_341, Icur := OriginalRow227TriangleData1173.coefficient86_340,
    output := OriginalRow227TriangleData1184.coefficient87_340, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root342, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1174.coefficient86_342, Icur := OriginalRow227TriangleData1174.coefficient86_341,
    output := OriginalRow227TriangleData1184.coefficient87_341, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1168

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1168.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
