import Grothe.UpperChaos.OriginalRow227TriangleData0049
import Grothe.UpperChaos.OriginalRow227TriangleData0050
import Grothe.UpperChaos.OriginalRow227TriangleData0065
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0049
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_36, Icur := OriginalRow227TriangleData0049.coefficient3_35,
    output := OriginalRow227TriangleData0065.coefficient4_35, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_37, Icur := OriginalRow227TriangleData0049.coefficient3_36,
    output := OriginalRow227TriangleData0065.coefficient4_36, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_38, Icur := OriginalRow227TriangleData0049.coefficient3_37,
    output := OriginalRow227TriangleData0065.coefficient4_37, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_39, Icur := OriginalRow227TriangleData0049.coefficient3_38,
    output := OriginalRow227TriangleData0065.coefficient4_38, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_40, Icur := OriginalRow227TriangleData0049.coefficient3_39,
    output := OriginalRow227TriangleData0065.coefficient4_39, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_41, Icur := OriginalRow227TriangleData0049.coefficient3_40,
    output := OriginalRow227TriangleData0065.coefficient4_40, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_42, Icur := OriginalRow227TriangleData0049.coefficient3_41,
    output := OriginalRow227TriangleData0065.coefficient4_41, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_43, Icur := OriginalRow227TriangleData0049.coefficient3_42,
    output := OriginalRow227TriangleData0065.coefficient4_42, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_44, Icur := OriginalRow227TriangleData0049.coefficient3_43,
    output := OriginalRow227TriangleData0065.coefficient4_43, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_45, Icur := OriginalRow227TriangleData0049.coefficient3_44,
    output := OriginalRow227TriangleData0065.coefficient4_44, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_46, Icur := OriginalRow227TriangleData0049.coefficient3_45,
    output := OriginalRow227TriangleData0065.coefficient4_45, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_47, Icur := OriginalRow227TriangleData0049.coefficient3_46,
    output := OriginalRow227TriangleData0065.coefficient4_46, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_48, Icur := OriginalRow227TriangleData0049.coefficient3_47,
    output := OriginalRow227TriangleData0065.coefficient4_47, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_49, Icur := OriginalRow227TriangleData0049.coefficient3_48,
    output := OriginalRow227TriangleData0065.coefficient4_48, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_50, Icur := OriginalRow227TriangleData0049.coefficient3_49,
    output := OriginalRow227TriangleData0065.coefficient4_49, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_51, Icur := OriginalRow227TriangleData0049.coefficient3_50,
    output := OriginalRow227TriangleData0065.coefficient4_50, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_52, Icur := OriginalRow227TriangleData0049.coefficient3_51,
    output := OriginalRow227TriangleData0065.coefficient4_51, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_53, Icur := OriginalRow227TriangleData0049.coefficient3_52,
    output := OriginalRow227TriangleData0065.coefficient4_52, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_54, Icur := OriginalRow227TriangleData0049.coefficient3_53,
    output := OriginalRow227TriangleData0065.coefficient4_53, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_55, Icur := OriginalRow227TriangleData0049.coefficient3_54,
    output := OriginalRow227TriangleData0065.coefficient4_54, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_56, Icur := OriginalRow227TriangleData0049.coefficient3_55,
    output := OriginalRow227TriangleData0065.coefficient4_55, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_57, Icur := OriginalRow227TriangleData0049.coefficient3_56,
    output := OriginalRow227TriangleData0065.coefficient4_56, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_58, Icur := OriginalRow227TriangleData0049.coefficient3_57,
    output := OriginalRow227TriangleData0065.coefficient4_57, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_59, Icur := OriginalRow227TriangleData0049.coefficient3_58,
    output := OriginalRow227TriangleData0065.coefficient4_58, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_60, Icur := OriginalRow227TriangleData0049.coefficient3_59,
    output := OriginalRow227TriangleData0065.coefficient4_59, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_61, Icur := OriginalRow227TriangleData0049.coefficient3_60,
    output := OriginalRow227TriangleData0065.coefficient4_60, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_62, Icur := OriginalRow227TriangleData0049.coefficient3_61,
    output := OriginalRow227TriangleData0065.coefficient4_61, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_63, Icur := OriginalRow227TriangleData0049.coefficient3_62,
    output := OriginalRow227TriangleData0065.coefficient4_62, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_64, Icur := OriginalRow227TriangleData0049.coefficient3_63,
    output := OriginalRow227TriangleData0065.coefficient4_63, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0049.coefficient3_65, Icur := OriginalRow227TriangleData0049.coefficient3_64,
    output := OriginalRow227TriangleData0065.coefficient4_64, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0050.coefficient3_66, Icur := OriginalRow227TriangleData0049.coefficient3_65,
    output := OriginalRow227TriangleData0065.coefficient4_65, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0050.coefficient3_67, Icur := OriginalRow227TriangleData0050.coefficient3_66,
    output := OriginalRow227TriangleData0065.coefficient4_66, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0049

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0049.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
