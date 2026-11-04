import Grothe.UpperChaos.OriginalRow227TriangleData0065
import Grothe.UpperChaos.OriginalRow227TriangleData0066
import Grothe.UpperChaos.OriginalRow227TriangleData0081
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0065
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_37, Icur := OriginalRow227TriangleData0065.coefficient4_36,
    output := OriginalRow227TriangleData0081.coefficient5_36, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_38, Icur := OriginalRow227TriangleData0065.coefficient4_37,
    output := OriginalRow227TriangleData0081.coefficient5_37, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_39, Icur := OriginalRow227TriangleData0065.coefficient4_38,
    output := OriginalRow227TriangleData0081.coefficient5_38, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_40, Icur := OriginalRow227TriangleData0065.coefficient4_39,
    output := OriginalRow227TriangleData0081.coefficient5_39, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_41, Icur := OriginalRow227TriangleData0065.coefficient4_40,
    output := OriginalRow227TriangleData0081.coefficient5_40, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_42, Icur := OriginalRow227TriangleData0065.coefficient4_41,
    output := OriginalRow227TriangleData0081.coefficient5_41, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_43, Icur := OriginalRow227TriangleData0065.coefficient4_42,
    output := OriginalRow227TriangleData0081.coefficient5_42, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_44, Icur := OriginalRow227TriangleData0065.coefficient4_43,
    output := OriginalRow227TriangleData0081.coefficient5_43, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_45, Icur := OriginalRow227TriangleData0065.coefficient4_44,
    output := OriginalRow227TriangleData0081.coefficient5_44, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_46, Icur := OriginalRow227TriangleData0065.coefficient4_45,
    output := OriginalRow227TriangleData0081.coefficient5_45, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_47, Icur := OriginalRow227TriangleData0065.coefficient4_46,
    output := OriginalRow227TriangleData0081.coefficient5_46, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_48, Icur := OriginalRow227TriangleData0065.coefficient4_47,
    output := OriginalRow227TriangleData0081.coefficient5_47, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_49, Icur := OriginalRow227TriangleData0065.coefficient4_48,
    output := OriginalRow227TriangleData0081.coefficient5_48, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_50, Icur := OriginalRow227TriangleData0065.coefficient4_49,
    output := OriginalRow227TriangleData0081.coefficient5_49, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_51, Icur := OriginalRow227TriangleData0065.coefficient4_50,
    output := OriginalRow227TriangleData0081.coefficient5_50, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_52, Icur := OriginalRow227TriangleData0065.coefficient4_51,
    output := OriginalRow227TriangleData0081.coefficient5_51, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_53, Icur := OriginalRow227TriangleData0065.coefficient4_52,
    output := OriginalRow227TriangleData0081.coefficient5_52, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_54, Icur := OriginalRow227TriangleData0065.coefficient4_53,
    output := OriginalRow227TriangleData0081.coefficient5_53, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_55, Icur := OriginalRow227TriangleData0065.coefficient4_54,
    output := OriginalRow227TriangleData0081.coefficient5_54, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_56, Icur := OriginalRow227TriangleData0065.coefficient4_55,
    output := OriginalRow227TriangleData0081.coefficient5_55, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_57, Icur := OriginalRow227TriangleData0065.coefficient4_56,
    output := OriginalRow227TriangleData0081.coefficient5_56, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_58, Icur := OriginalRow227TriangleData0065.coefficient4_57,
    output := OriginalRow227TriangleData0081.coefficient5_57, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_59, Icur := OriginalRow227TriangleData0065.coefficient4_58,
    output := OriginalRow227TriangleData0081.coefficient5_58, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_60, Icur := OriginalRow227TriangleData0065.coefficient4_59,
    output := OriginalRow227TriangleData0081.coefficient5_59, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_61, Icur := OriginalRow227TriangleData0065.coefficient4_60,
    output := OriginalRow227TriangleData0081.coefficient5_60, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_62, Icur := OriginalRow227TriangleData0065.coefficient4_61,
    output := OriginalRow227TriangleData0081.coefficient5_61, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_63, Icur := OriginalRow227TriangleData0065.coefficient4_62,
    output := OriginalRow227TriangleData0081.coefficient5_62, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_64, Icur := OriginalRow227TriangleData0065.coefficient4_63,
    output := OriginalRow227TriangleData0081.coefficient5_63, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_65, Icur := OriginalRow227TriangleData0065.coefficient4_64,
    output := OriginalRow227TriangleData0081.coefficient5_64, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0065.coefficient4_66, Icur := OriginalRow227TriangleData0065.coefficient4_65,
    output := OriginalRow227TriangleData0081.coefficient5_65, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0066.coefficient4_67, Icur := OriginalRow227TriangleData0065.coefficient4_66,
    output := OriginalRow227TriangleData0081.coefficient5_66, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root5,
    Inext := OriginalRow227TriangleData0066.coefficient4_68, Icur := OriginalRow227TriangleData0066.coefficient4_67,
    output := OriginalRow227TriangleData0081.coefficient5_67, hC := OriginalRow227TriangleRoots00.root5_pos, hAC := OriginalRow227TriangleRoots00.product5_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0065

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0065.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
