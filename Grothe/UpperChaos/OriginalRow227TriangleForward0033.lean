import Grothe.UpperChaos.OriginalRow227TriangleData0033
import Grothe.UpperChaos.OriginalRow227TriangleData0034
import Grothe.UpperChaos.OriginalRow227TriangleData0049
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0033
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_35, Icur := OriginalRow227TriangleData0033.coefficient2_34,
    output := OriginalRow227TriangleData0049.coefficient3_34, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_36, Icur := OriginalRow227TriangleData0033.coefficient2_35,
    output := OriginalRow227TriangleData0049.coefficient3_35, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_37, Icur := OriginalRow227TriangleData0033.coefficient2_36,
    output := OriginalRow227TriangleData0049.coefficient3_36, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_38, Icur := OriginalRow227TriangleData0033.coefficient2_37,
    output := OriginalRow227TriangleData0049.coefficient3_37, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_39, Icur := OriginalRow227TriangleData0033.coefficient2_38,
    output := OriginalRow227TriangleData0049.coefficient3_38, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_40, Icur := OriginalRow227TriangleData0033.coefficient2_39,
    output := OriginalRow227TriangleData0049.coefficient3_39, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_41, Icur := OriginalRow227TriangleData0033.coefficient2_40,
    output := OriginalRow227TriangleData0049.coefficient3_40, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_42, Icur := OriginalRow227TriangleData0033.coefficient2_41,
    output := OriginalRow227TriangleData0049.coefficient3_41, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_43, Icur := OriginalRow227TriangleData0033.coefficient2_42,
    output := OriginalRow227TriangleData0049.coefficient3_42, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_44, Icur := OriginalRow227TriangleData0033.coefficient2_43,
    output := OriginalRow227TriangleData0049.coefficient3_43, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_45, Icur := OriginalRow227TriangleData0033.coefficient2_44,
    output := OriginalRow227TriangleData0049.coefficient3_44, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_46, Icur := OriginalRow227TriangleData0033.coefficient2_45,
    output := OriginalRow227TriangleData0049.coefficient3_45, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_47, Icur := OriginalRow227TriangleData0033.coefficient2_46,
    output := OriginalRow227TriangleData0049.coefficient3_46, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_48, Icur := OriginalRow227TriangleData0033.coefficient2_47,
    output := OriginalRow227TriangleData0049.coefficient3_47, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_49, Icur := OriginalRow227TriangleData0033.coefficient2_48,
    output := OriginalRow227TriangleData0049.coefficient3_48, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_50, Icur := OriginalRow227TriangleData0033.coefficient2_49,
    output := OriginalRow227TriangleData0049.coefficient3_49, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_51, Icur := OriginalRow227TriangleData0033.coefficient2_50,
    output := OriginalRow227TriangleData0049.coefficient3_50, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_52, Icur := OriginalRow227TriangleData0033.coefficient2_51,
    output := OriginalRow227TriangleData0049.coefficient3_51, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_53, Icur := OriginalRow227TriangleData0033.coefficient2_52,
    output := OriginalRow227TriangleData0049.coefficient3_52, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_54, Icur := OriginalRow227TriangleData0033.coefficient2_53,
    output := OriginalRow227TriangleData0049.coefficient3_53, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_55, Icur := OriginalRow227TriangleData0033.coefficient2_54,
    output := OriginalRow227TriangleData0049.coefficient3_54, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_56, Icur := OriginalRow227TriangleData0033.coefficient2_55,
    output := OriginalRow227TriangleData0049.coefficient3_55, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_57, Icur := OriginalRow227TriangleData0033.coefficient2_56,
    output := OriginalRow227TriangleData0049.coefficient3_56, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_58, Icur := OriginalRow227TriangleData0033.coefficient2_57,
    output := OriginalRow227TriangleData0049.coefficient3_57, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_59, Icur := OriginalRow227TriangleData0033.coefficient2_58,
    output := OriginalRow227TriangleData0049.coefficient3_58, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_60, Icur := OriginalRow227TriangleData0033.coefficient2_59,
    output := OriginalRow227TriangleData0049.coefficient3_59, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_61, Icur := OriginalRow227TriangleData0033.coefficient2_60,
    output := OriginalRow227TriangleData0049.coefficient3_60, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_62, Icur := OriginalRow227TriangleData0033.coefficient2_61,
    output := OriginalRow227TriangleData0049.coefficient3_61, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_63, Icur := OriginalRow227TriangleData0033.coefficient2_62,
    output := OriginalRow227TriangleData0049.coefficient3_62, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0033.coefficient2_64, Icur := OriginalRow227TriangleData0033.coefficient2_63,
    output := OriginalRow227TriangleData0049.coefficient3_63, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0034.coefficient2_65, Icur := OriginalRow227TriangleData0033.coefficient2_64,
    output := OriginalRow227TriangleData0049.coefficient3_64, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0034.coefficient2_66, Icur := OriginalRow227TriangleData0034.coefficient2_65,
    output := OriginalRow227TriangleData0049.coefficient3_65, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0033

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0033.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
