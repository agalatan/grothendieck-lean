import Grothe.UpperChaos.OriginalRow227TriangleData0931
import Grothe.UpperChaos.OriginalRow227TriangleData0932
import Grothe.UpperChaos.OriginalRow227TriangleData0943
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0927
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_290, Icur := OriginalRow227TriangleData0931.coefficient65_289,
    output := OriginalRow227TriangleData0943.coefficient66_289, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_291, Icur := OriginalRow227TriangleData0931.coefficient65_290,
    output := OriginalRow227TriangleData0943.coefficient66_290, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_292, Icur := OriginalRow227TriangleData0931.coefficient65_291,
    output := OriginalRow227TriangleData0943.coefficient66_291, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_293, Icur := OriginalRow227TriangleData0931.coefficient65_292,
    output := OriginalRow227TriangleData0943.coefficient66_292, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_294, Icur := OriginalRow227TriangleData0931.coefficient65_293,
    output := OriginalRow227TriangleData0943.coefficient66_293, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_295, Icur := OriginalRow227TriangleData0931.coefficient65_294,
    output := OriginalRow227TriangleData0943.coefficient66_294, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_296, Icur := OriginalRow227TriangleData0931.coefficient65_295,
    output := OriginalRow227TriangleData0943.coefficient66_295, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_297, Icur := OriginalRow227TriangleData0931.coefficient65_296,
    output := OriginalRow227TriangleData0943.coefficient66_296, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_298, Icur := OriginalRow227TriangleData0931.coefficient65_297,
    output := OriginalRow227TriangleData0943.coefficient66_297, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_299, Icur := OriginalRow227TriangleData0931.coefficient65_298,
    output := OriginalRow227TriangleData0943.coefficient66_298, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_300, Icur := OriginalRow227TriangleData0931.coefficient65_299,
    output := OriginalRow227TriangleData0943.coefficient66_299, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_301, Icur := OriginalRow227TriangleData0931.coefficient65_300,
    output := OriginalRow227TriangleData0943.coefficient66_300, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_302, Icur := OriginalRow227TriangleData0931.coefficient65_301,
    output := OriginalRow227TriangleData0943.coefficient66_301, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_303, Icur := OriginalRow227TriangleData0931.coefficient65_302,
    output := OriginalRow227TriangleData0943.coefficient66_302, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_304, Icur := OriginalRow227TriangleData0931.coefficient65_303,
    output := OriginalRow227TriangleData0943.coefficient66_303, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_305, Icur := OriginalRow227TriangleData0931.coefficient65_304,
    output := OriginalRow227TriangleData0943.coefficient66_304, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_306, Icur := OriginalRow227TriangleData0931.coefficient65_305,
    output := OriginalRow227TriangleData0943.coefficient66_305, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_307, Icur := OriginalRow227TriangleData0931.coefficient65_306,
    output := OriginalRow227TriangleData0943.coefficient66_306, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_308, Icur := OriginalRow227TriangleData0931.coefficient65_307,
    output := OriginalRow227TriangleData0943.coefficient66_307, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_309, Icur := OriginalRow227TriangleData0931.coefficient65_308,
    output := OriginalRow227TriangleData0943.coefficient66_308, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_310, Icur := OriginalRow227TriangleData0931.coefficient65_309,
    output := OriginalRow227TriangleData0943.coefficient66_309, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_311, Icur := OriginalRow227TriangleData0931.coefficient65_310,
    output := OriginalRow227TriangleData0943.coefficient66_310, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_312, Icur := OriginalRow227TriangleData0931.coefficient65_311,
    output := OriginalRow227TriangleData0943.coefficient66_311, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_313, Icur := OriginalRow227TriangleData0931.coefficient65_312,
    output := OriginalRow227TriangleData0943.coefficient66_312, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_314, Icur := OriginalRow227TriangleData0931.coefficient65_313,
    output := OriginalRow227TriangleData0943.coefficient66_313, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_315, Icur := OriginalRow227TriangleData0931.coefficient65_314,
    output := OriginalRow227TriangleData0943.coefficient66_314, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_316, Icur := OriginalRow227TriangleData0931.coefficient65_315,
    output := OriginalRow227TriangleData0943.coefficient66_315, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_317, Icur := OriginalRow227TriangleData0931.coefficient65_316,
    output := OriginalRow227TriangleData0943.coefficient66_316, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_318, Icur := OriginalRow227TriangleData0931.coefficient65_317,
    output := OriginalRow227TriangleData0943.coefficient66_317, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0931.coefficient65_319, Icur := OriginalRow227TriangleData0931.coefficient65_318,
    output := OriginalRow227TriangleData0943.coefficient66_318, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_320, Icur := OriginalRow227TriangleData0931.coefficient65_319,
    output := OriginalRow227TriangleData0943.coefficient66_319, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root66,
    Inext := OriginalRow227TriangleData0932.coefficient65_321, Icur := OriginalRow227TriangleData0932.coefficient65_320,
    output := OriginalRow227TriangleData0943.coefficient66_320, hC := OriginalRow227TriangleRoots02.root66_pos, hAC := OriginalRow227TriangleRoots02.product66_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0927

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0927.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
