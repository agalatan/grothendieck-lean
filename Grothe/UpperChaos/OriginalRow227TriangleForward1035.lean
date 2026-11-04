import Grothe.UpperChaos.OriginalRow227TriangleData1039
import Grothe.UpperChaos.OriginalRow227TriangleData1040
import Grothe.UpperChaos.OriginalRow227TriangleData1051
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1035
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_299, Icur := OriginalRow227TriangleData1039.coefficient74_298,
    output := OriginalRow227TriangleData1051.coefficient75_298, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_300, Icur := OriginalRow227TriangleData1039.coefficient74_299,
    output := OriginalRow227TriangleData1051.coefficient75_299, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_301, Icur := OriginalRow227TriangleData1039.coefficient74_300,
    output := OriginalRow227TriangleData1051.coefficient75_300, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_302, Icur := OriginalRow227TriangleData1039.coefficient74_301,
    output := OriginalRow227TriangleData1051.coefficient75_301, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_303, Icur := OriginalRow227TriangleData1039.coefficient74_302,
    output := OriginalRow227TriangleData1051.coefficient75_302, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_304, Icur := OriginalRow227TriangleData1039.coefficient74_303,
    output := OriginalRow227TriangleData1051.coefficient75_303, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_305, Icur := OriginalRow227TriangleData1039.coefficient74_304,
    output := OriginalRow227TriangleData1051.coefficient75_304, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_306, Icur := OriginalRow227TriangleData1039.coefficient74_305,
    output := OriginalRow227TriangleData1051.coefficient75_305, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_307, Icur := OriginalRow227TriangleData1039.coefficient74_306,
    output := OriginalRow227TriangleData1051.coefficient75_306, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_308, Icur := OriginalRow227TriangleData1039.coefficient74_307,
    output := OriginalRow227TriangleData1051.coefficient75_307, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_309, Icur := OriginalRow227TriangleData1039.coefficient74_308,
    output := OriginalRow227TriangleData1051.coefficient75_308, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_310, Icur := OriginalRow227TriangleData1039.coefficient74_309,
    output := OriginalRow227TriangleData1051.coefficient75_309, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_311, Icur := OriginalRow227TriangleData1039.coefficient74_310,
    output := OriginalRow227TriangleData1051.coefficient75_310, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_312, Icur := OriginalRow227TriangleData1039.coefficient74_311,
    output := OriginalRow227TriangleData1051.coefficient75_311, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_313, Icur := OriginalRow227TriangleData1039.coefficient74_312,
    output := OriginalRow227TriangleData1051.coefficient75_312, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_314, Icur := OriginalRow227TriangleData1039.coefficient74_313,
    output := OriginalRow227TriangleData1051.coefficient75_313, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_315, Icur := OriginalRow227TriangleData1039.coefficient74_314,
    output := OriginalRow227TriangleData1051.coefficient75_314, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_316, Icur := OriginalRow227TriangleData1039.coefficient74_315,
    output := OriginalRow227TriangleData1051.coefficient75_315, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_317, Icur := OriginalRow227TriangleData1039.coefficient74_316,
    output := OriginalRow227TriangleData1051.coefficient75_316, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_318, Icur := OriginalRow227TriangleData1039.coefficient74_317,
    output := OriginalRow227TriangleData1051.coefficient75_317, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_319, Icur := OriginalRow227TriangleData1039.coefficient74_318,
    output := OriginalRow227TriangleData1051.coefficient75_318, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_320, Icur := OriginalRow227TriangleData1039.coefficient74_319,
    output := OriginalRow227TriangleData1051.coefficient75_319, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_321, Icur := OriginalRow227TriangleData1039.coefficient74_320,
    output := OriginalRow227TriangleData1051.coefficient75_320, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_322, Icur := OriginalRow227TriangleData1039.coefficient74_321,
    output := OriginalRow227TriangleData1051.coefficient75_321, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_323, Icur := OriginalRow227TriangleData1039.coefficient74_322,
    output := OriginalRow227TriangleData1051.coefficient75_322, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_324, Icur := OriginalRow227TriangleData1039.coefficient74_323,
    output := OriginalRow227TriangleData1051.coefficient75_323, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots10.root325, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_325, Icur := OriginalRow227TriangleData1039.coefficient74_324,
    output := OriginalRow227TriangleData1051.coefficient75_324, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots10.root326, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_326, Icur := OriginalRow227TriangleData1039.coefficient74_325,
    output := OriginalRow227TriangleData1051.coefficient75_325, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root327, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_327, Icur := OriginalRow227TriangleData1039.coefficient74_326,
    output := OriginalRow227TriangleData1051.coefficient75_326, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root328, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1039.coefficient74_328, Icur := OriginalRow227TriangleData1039.coefficient74_327,
    output := OriginalRow227TriangleData1051.coefficient75_327, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root329, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1040.coefficient74_329, Icur := OriginalRow227TriangleData1039.coefficient74_328,
    output := OriginalRow227TriangleData1051.coefficient75_328, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root330, IC := OriginalRow227TriangleRoots02.root75,
    Inext := OriginalRow227TriangleData1040.coefficient74_330, Icur := OriginalRow227TriangleData1040.coefficient74_329,
    output := OriginalRow227TriangleData1051.coefficient75_329, hC := OriginalRow227TriangleRoots02.root75_pos, hAC := OriginalRow227TriangleRoots02.product75_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1035

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1035.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
