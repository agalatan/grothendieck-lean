import Grothe.UpperChaos.OriginalRow227TriangleData1963
import Grothe.UpperChaos.OriginalRow227TriangleData1967
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots08
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1951
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots08.root287, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_287, Icur := OriginalRow227TriangleData1963.coefficient190_286,
    output := OriginalRow227TriangleData1967.coefficient191_286, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots08.root288, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_288, Icur := OriginalRow227TriangleData1963.coefficient190_287,
    output := OriginalRow227TriangleData1967.coefficient191_287, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots09.root289, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_289, Icur := OriginalRow227TriangleData1963.coefficient190_288,
    output := OriginalRow227TriangleData1967.coefficient191_288, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots09.root290, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_290, Icur := OriginalRow227TriangleData1963.coefficient190_289,
    output := OriginalRow227TriangleData1967.coefficient191_289, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots09.root291, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_291, Icur := OriginalRow227TriangleData1963.coefficient190_290,
    output := OriginalRow227TriangleData1967.coefficient191_290, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots09.root292, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_292, Icur := OriginalRow227TriangleData1963.coefficient190_291,
    output := OriginalRow227TriangleData1967.coefficient191_291, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots09.root293, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_293, Icur := OriginalRow227TriangleData1963.coefficient190_292,
    output := OriginalRow227TriangleData1967.coefficient191_292, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots09.root294, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_294, Icur := OriginalRow227TriangleData1963.coefficient190_293,
    output := OriginalRow227TriangleData1967.coefficient191_293, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots09.root295, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_295, Icur := OriginalRow227TriangleData1963.coefficient190_294,
    output := OriginalRow227TriangleData1967.coefficient191_294, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots09.root296, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_296, Icur := OriginalRow227TriangleData1963.coefficient190_295,
    output := OriginalRow227TriangleData1967.coefficient191_295, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots09.root297, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_297, Icur := OriginalRow227TriangleData1963.coefficient190_296,
    output := OriginalRow227TriangleData1967.coefficient191_296, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots09.root298, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_298, Icur := OriginalRow227TriangleData1963.coefficient190_297,
    output := OriginalRow227TriangleData1967.coefficient191_297, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots09.root299, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_299, Icur := OriginalRow227TriangleData1963.coefficient190_298,
    output := OriginalRow227TriangleData1967.coefficient191_298, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots09.root300, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_300, Icur := OriginalRow227TriangleData1963.coefficient190_299,
    output := OriginalRow227TriangleData1967.coefficient191_299, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots09.root301, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_301, Icur := OriginalRow227TriangleData1963.coefficient190_300,
    output := OriginalRow227TriangleData1967.coefficient191_300, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots09.root302, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_302, Icur := OriginalRow227TriangleData1963.coefficient190_301,
    output := OriginalRow227TriangleData1967.coefficient191_301, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots09.root303, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_303, Icur := OriginalRow227TriangleData1963.coefficient190_302,
    output := OriginalRow227TriangleData1967.coefficient191_302, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots09.root304, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_304, Icur := OriginalRow227TriangleData1963.coefficient190_303,
    output := OriginalRow227TriangleData1967.coefficient191_303, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots09.root305, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_305, Icur := OriginalRow227TriangleData1963.coefficient190_304,
    output := OriginalRow227TriangleData1967.coefficient191_304, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_306, Icur := OriginalRow227TriangleData1963.coefficient190_305,
    output := OriginalRow227TriangleData1967.coefficient191_305, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_307, Icur := OriginalRow227TriangleData1963.coefficient190_306,
    output := OriginalRow227TriangleData1967.coefficient191_306, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_308, Icur := OriginalRow227TriangleData1963.coefficient190_307,
    output := OriginalRow227TriangleData1967.coefficient191_307, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_309, Icur := OriginalRow227TriangleData1963.coefficient190_308,
    output := OriginalRow227TriangleData1967.coefficient191_308, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_310, Icur := OriginalRow227TriangleData1963.coefficient190_309,
    output := OriginalRow227TriangleData1967.coefficient191_309, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root191,
    Inext := OriginalRow227TriangleData1963.coefficient190_311, Icur := OriginalRow227TriangleData1963.coefficient190_310,
    output := OriginalRow227TriangleData1967.coefficient191_310, hC := OriginalRow227TriangleRoots05.root191_pos, hAC := OriginalRow227TriangleRoots05.product191_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1951

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1951.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
