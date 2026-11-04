import Grothe.UpperChaos.OriginalRow227TriangleData1901
import Grothe.UpperChaos.OriginalRow227TriangleData1906
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleRoots10
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1890
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots09.root306, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_306, Icur := OriginalRow227TriangleData1901.coefficient177_305,
    output := OriginalRow227TriangleData1906.coefficient178_305, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots09.root307, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_307, Icur := OriginalRow227TriangleData1901.coefficient177_306,
    output := OriginalRow227TriangleData1906.coefficient178_306, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots09.root308, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_308, Icur := OriginalRow227TriangleData1901.coefficient177_307,
    output := OriginalRow227TriangleData1906.coefficient178_307, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots09.root309, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_309, Icur := OriginalRow227TriangleData1901.coefficient177_308,
    output := OriginalRow227TriangleData1906.coefficient178_308, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots09.root310, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_310, Icur := OriginalRow227TriangleData1901.coefficient177_309,
    output := OriginalRow227TriangleData1906.coefficient178_309, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots09.root311, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_311, Icur := OriginalRow227TriangleData1901.coefficient177_310,
    output := OriginalRow227TriangleData1906.coefficient178_310, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots09.root312, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_312, Icur := OriginalRow227TriangleData1901.coefficient177_311,
    output := OriginalRow227TriangleData1906.coefficient178_311, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots09.root313, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_313, Icur := OriginalRow227TriangleData1901.coefficient177_312,
    output := OriginalRow227TriangleData1906.coefficient178_312, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots09.root314, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_314, Icur := OriginalRow227TriangleData1901.coefficient177_313,
    output := OriginalRow227TriangleData1906.coefficient178_313, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots09.root315, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_315, Icur := OriginalRow227TriangleData1901.coefficient177_314,
    output := OriginalRow227TriangleData1906.coefficient178_314, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots09.root316, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_316, Icur := OriginalRow227TriangleData1901.coefficient177_315,
    output := OriginalRow227TriangleData1906.coefficient178_315, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots09.root317, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_317, Icur := OriginalRow227TriangleData1901.coefficient177_316,
    output := OriginalRow227TriangleData1906.coefficient178_316, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots09.root318, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_318, Icur := OriginalRow227TriangleData1901.coefficient177_317,
    output := OriginalRow227TriangleData1906.coefficient178_317, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots09.root319, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_319, Icur := OriginalRow227TriangleData1901.coefficient177_318,
    output := OriginalRow227TriangleData1906.coefficient178_318, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots09.root320, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_320, Icur := OriginalRow227TriangleData1901.coefficient177_319,
    output := OriginalRow227TriangleData1906.coefficient178_319, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots10.root321, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_321, Icur := OriginalRow227TriangleData1901.coefficient177_320,
    output := OriginalRow227TriangleData1906.coefficient178_320, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots10.root322, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_322, Icur := OriginalRow227TriangleData1901.coefficient177_321,
    output := OriginalRow227TriangleData1906.coefficient178_321, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots10.root323, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_323, Icur := OriginalRow227TriangleData1901.coefficient177_322,
    output := OriginalRow227TriangleData1906.coefficient178_322, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots10.root324, IC := OriginalRow227TriangleRoots05.root178,
    Inext := OriginalRow227TriangleData1901.coefficient177_324, Icur := OriginalRow227TriangleData1901.coefficient177_323,
    output := OriginalRow227TriangleData1906.coefficient178_323, hC := OriginalRow227TriangleRoots05.root178_pos, hAC := OriginalRow227TriangleRoots05.product178_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1890

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1890.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
