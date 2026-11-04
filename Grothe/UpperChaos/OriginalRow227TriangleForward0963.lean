import Grothe.UpperChaos.OriginalRow227TriangleData0967
import Grothe.UpperChaos.OriginalRow227TriangleData0968
import Grothe.UpperChaos.OriginalRow227TriangleData0979
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0963
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 225, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_293, Icur := OriginalRow227TriangleData0967.coefficient68_292,
    output := OriginalRow227TriangleData0979.coefficient69_292, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 226, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_294, Icur := OriginalRow227TriangleData0967.coefficient68_293,
    output := OriginalRow227TriangleData0979.coefficient69_293, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 227, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_295, Icur := OriginalRow227TriangleData0967.coefficient68_294,
    output := OriginalRow227TriangleData0979.coefficient69_294, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 228, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_296, Icur := OriginalRow227TriangleData0967.coefficient68_295,
    output := OriginalRow227TriangleData0979.coefficient69_295, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 229, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_297, Icur := OriginalRow227TriangleData0967.coefficient68_296,
    output := OriginalRow227TriangleData0979.coefficient69_296, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 230, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_298, Icur := OriginalRow227TriangleData0967.coefficient68_297,
    output := OriginalRow227TriangleData0979.coefficient69_297, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 231, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_299, Icur := OriginalRow227TriangleData0967.coefficient68_298,
    output := OriginalRow227TriangleData0979.coefficient69_298, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 232, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_300, Icur := OriginalRow227TriangleData0967.coefficient68_299,
    output := OriginalRow227TriangleData0979.coefficient69_299, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 233, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_301, Icur := OriginalRow227TriangleData0967.coefficient68_300,
    output := OriginalRow227TriangleData0979.coefficient69_300, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 234, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_302, Icur := OriginalRow227TriangleData0967.coefficient68_301,
    output := OriginalRow227TriangleData0979.coefficient69_301, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 235, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_303, Icur := OriginalRow227TriangleData0967.coefficient68_302,
    output := OriginalRow227TriangleData0979.coefficient69_302, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 236, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_304, Icur := OriginalRow227TriangleData0967.coefficient68_303,
    output := OriginalRow227TriangleData0979.coefficient69_303, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 237, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_305, Icur := OriginalRow227TriangleData0967.coefficient68_304,
    output := OriginalRow227TriangleData0979.coefficient69_304, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 238, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_306, Icur := OriginalRow227TriangleData0967.coefficient68_305,
    output := OriginalRow227TriangleData0979.coefficient69_305, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 239, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_307, Icur := OriginalRow227TriangleData0967.coefficient68_306,
    output := OriginalRow227TriangleData0979.coefficient69_306, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 240, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_308, Icur := OriginalRow227TriangleData0967.coefficient68_307,
    output := OriginalRow227TriangleData0979.coefficient69_307, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 241, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_309, Icur := OriginalRow227TriangleData0967.coefficient68_308,
    output := OriginalRow227TriangleData0979.coefficient69_308, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 242, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_310, Icur := OriginalRow227TriangleData0967.coefficient68_309,
    output := OriginalRow227TriangleData0979.coefficient69_309, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 243, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_311, Icur := OriginalRow227TriangleData0967.coefficient68_310,
    output := OriginalRow227TriangleData0979.coefficient69_310, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 244, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_312, Icur := OriginalRow227TriangleData0967.coefficient68_311,
    output := OriginalRow227TriangleData0979.coefficient69_311, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 245, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_313, Icur := OriginalRow227TriangleData0967.coefficient68_312,
    output := OriginalRow227TriangleData0979.coefficient69_312, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 246, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_314, Icur := OriginalRow227TriangleData0967.coefficient68_313,
    output := OriginalRow227TriangleData0979.coefficient69_313, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 247, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_315, Icur := OriginalRow227TriangleData0967.coefficient68_314,
    output := OriginalRow227TriangleData0979.coefficient69_314, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 248, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_316, Icur := OriginalRow227TriangleData0967.coefficient68_315,
    output := OriginalRow227TriangleData0979.coefficient69_315, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 249, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_317, Icur := OriginalRow227TriangleData0967.coefficient68_316,
    output := OriginalRow227TriangleData0979.coefficient69_316, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 250, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_318, Icur := OriginalRow227TriangleData0967.coefficient68_317,
    output := OriginalRow227TriangleData0979.coefficient69_317, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 251, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_319, Icur := OriginalRow227TriangleData0967.coefficient68_318,
    output := OriginalRow227TriangleData0979.coefficient69_318, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 252, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_320, Icur := OriginalRow227TriangleData0967.coefficient68_319,
    output := OriginalRow227TriangleData0979.coefficient69_319, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 253, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_321, Icur := OriginalRow227TriangleData0967.coefficient68_320,
    output := OriginalRow227TriangleData0979.coefficient69_320, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 254, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0967.coefficient68_322, Icur := OriginalRow227TriangleData0967.coefficient68_321,
    output := OriginalRow227TriangleData0979.coefficient69_321, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 255, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0968.coefficient68_323, Icur := OriginalRow227TriangleData0967.coefficient68_322,
    output := OriginalRow227TriangleData0979.coefficient69_322, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 256, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0968.coefficient68_324, Icur := OriginalRow227TriangleData0968.coefficient68_323,
    output := OriginalRow227TriangleData0979.coefficient69_323, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0963

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0963.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
