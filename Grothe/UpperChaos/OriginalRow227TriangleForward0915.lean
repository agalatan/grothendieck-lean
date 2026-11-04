import Grothe.UpperChaos.OriginalRow227TriangleData0919
import Grothe.UpperChaos.OriginalRow227TriangleData0920
import Grothe.UpperChaos.OriginalRow227TriangleData0931
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0915
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_289, Icur := OriginalRow227TriangleData0919.coefficient64_288,
    output := OriginalRow227TriangleData0931.coefficient65_288, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_290, Icur := OriginalRow227TriangleData0919.coefficient64_289,
    output := OriginalRow227TriangleData0931.coefficient65_289, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_291, Icur := OriginalRow227TriangleData0919.coefficient64_290,
    output := OriginalRow227TriangleData0931.coefficient65_290, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_292, Icur := OriginalRow227TriangleData0919.coefficient64_291,
    output := OriginalRow227TriangleData0931.coefficient65_291, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_293, Icur := OriginalRow227TriangleData0919.coefficient64_292,
    output := OriginalRow227TriangleData0931.coefficient65_292, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_294, Icur := OriginalRow227TriangleData0919.coefficient64_293,
    output := OriginalRow227TriangleData0931.coefficient65_293, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_295, Icur := OriginalRow227TriangleData0919.coefficient64_294,
    output := OriginalRow227TriangleData0931.coefficient65_294, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_296, Icur := OriginalRow227TriangleData0919.coefficient64_295,
    output := OriginalRow227TriangleData0931.coefficient65_295, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_297, Icur := OriginalRow227TriangleData0919.coefficient64_296,
    output := OriginalRow227TriangleData0931.coefficient65_296, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_298, Icur := OriginalRow227TriangleData0919.coefficient64_297,
    output := OriginalRow227TriangleData0931.coefficient65_297, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_299, Icur := OriginalRow227TriangleData0919.coefficient64_298,
    output := OriginalRow227TriangleData0931.coefficient65_298, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_300, Icur := OriginalRow227TriangleData0919.coefficient64_299,
    output := OriginalRow227TriangleData0931.coefficient65_299, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_301, Icur := OriginalRow227TriangleData0919.coefficient64_300,
    output := OriginalRow227TriangleData0931.coefficient65_300, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_302, Icur := OriginalRow227TriangleData0919.coefficient64_301,
    output := OriginalRow227TriangleData0931.coefficient65_301, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_303, Icur := OriginalRow227TriangleData0919.coefficient64_302,
    output := OriginalRow227TriangleData0931.coefficient65_302, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_304, Icur := OriginalRow227TriangleData0919.coefficient64_303,
    output := OriginalRow227TriangleData0931.coefficient65_303, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_305, Icur := OriginalRow227TriangleData0919.coefficient64_304,
    output := OriginalRow227TriangleData0931.coefficient65_304, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_306, Icur := OriginalRow227TriangleData0919.coefficient64_305,
    output := OriginalRow227TriangleData0931.coefficient65_305, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_307, Icur := OriginalRow227TriangleData0919.coefficient64_306,
    output := OriginalRow227TriangleData0931.coefficient65_306, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_308, Icur := OriginalRow227TriangleData0919.coefficient64_307,
    output := OriginalRow227TriangleData0931.coefficient65_307, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_309, Icur := OriginalRow227TriangleData0919.coefficient64_308,
    output := OriginalRow227TriangleData0931.coefficient65_308, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_310, Icur := OriginalRow227TriangleData0919.coefficient64_309,
    output := OriginalRow227TriangleData0931.coefficient65_309, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_311, Icur := OriginalRow227TriangleData0919.coefficient64_310,
    output := OriginalRow227TriangleData0931.coefficient65_310, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_312, Icur := OriginalRow227TriangleData0919.coefficient64_311,
    output := OriginalRow227TriangleData0931.coefficient65_311, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_313, Icur := OriginalRow227TriangleData0919.coefficient64_312,
    output := OriginalRow227TriangleData0931.coefficient65_312, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_314, Icur := OriginalRow227TriangleData0919.coefficient64_313,
    output := OriginalRow227TriangleData0931.coefficient65_313, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_315, Icur := OriginalRow227TriangleData0919.coefficient64_314,
    output := OriginalRow227TriangleData0931.coefficient65_314, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_316, Icur := OriginalRow227TriangleData0919.coefficient64_315,
    output := OriginalRow227TriangleData0931.coefficient65_315, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_317, Icur := OriginalRow227TriangleData0919.coefficient64_316,
    output := OriginalRow227TriangleData0931.coefficient65_316, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0919.coefficient64_318, Icur := OriginalRow227TriangleData0919.coefficient64_317,
    output := OriginalRow227TriangleData0931.coefficient65_317, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0920.coefficient64_319, Icur := OriginalRow227TriangleData0919.coefficient64_318,
    output := OriginalRow227TriangleData0931.coefficient65_318, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0920.coefficient64_320, Icur := OriginalRow227TriangleData0920.coefficient64_319,
    output := OriginalRow227TriangleData0931.coefficient65_319, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0915

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0915.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
