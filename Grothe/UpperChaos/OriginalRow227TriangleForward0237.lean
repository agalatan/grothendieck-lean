import Grothe.UpperChaos.OriginalRow227TriangleData0238
import Grothe.UpperChaos.OriginalRow227TriangleData0239
import Grothe.UpperChaos.OriginalRow227TriangleData0253
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0237
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_48, Icur := OriginalRow227TriangleData0238.coefficient15_47,
    output := OriginalRow227TriangleData0253.coefficient16_47, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_49, Icur := OriginalRow227TriangleData0238.coefficient15_48,
    output := OriginalRow227TriangleData0253.coefficient16_48, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_50, Icur := OriginalRow227TriangleData0238.coefficient15_49,
    output := OriginalRow227TriangleData0253.coefficient16_49, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_51, Icur := OriginalRow227TriangleData0238.coefficient15_50,
    output := OriginalRow227TriangleData0253.coefficient16_50, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_52, Icur := OriginalRow227TriangleData0238.coefficient15_51,
    output := OriginalRow227TriangleData0253.coefficient16_51, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_53, Icur := OriginalRow227TriangleData0238.coefficient15_52,
    output := OriginalRow227TriangleData0253.coefficient16_52, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_54, Icur := OriginalRow227TriangleData0238.coefficient15_53,
    output := OriginalRow227TriangleData0253.coefficient16_53, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_55, Icur := OriginalRow227TriangleData0238.coefficient15_54,
    output := OriginalRow227TriangleData0253.coefficient16_54, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_56, Icur := OriginalRow227TriangleData0238.coefficient15_55,
    output := OriginalRow227TriangleData0253.coefficient16_55, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_57, Icur := OriginalRow227TriangleData0238.coefficient15_56,
    output := OriginalRow227TriangleData0253.coefficient16_56, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_58, Icur := OriginalRow227TriangleData0238.coefficient15_57,
    output := OriginalRow227TriangleData0253.coefficient16_57, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_59, Icur := OriginalRow227TriangleData0238.coefficient15_58,
    output := OriginalRow227TriangleData0253.coefficient16_58, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_60, Icur := OriginalRow227TriangleData0238.coefficient15_59,
    output := OriginalRow227TriangleData0253.coefficient16_59, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_61, Icur := OriginalRow227TriangleData0238.coefficient15_60,
    output := OriginalRow227TriangleData0253.coefficient16_60, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_62, Icur := OriginalRow227TriangleData0238.coefficient15_61,
    output := OriginalRow227TriangleData0253.coefficient16_61, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_63, Icur := OriginalRow227TriangleData0238.coefficient15_62,
    output := OriginalRow227TriangleData0253.coefficient16_62, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_64, Icur := OriginalRow227TriangleData0238.coefficient15_63,
    output := OriginalRow227TriangleData0253.coefficient16_63, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_65, Icur := OriginalRow227TriangleData0238.coefficient15_64,
    output := OriginalRow227TriangleData0253.coefficient16_64, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_66, Icur := OriginalRow227TriangleData0238.coefficient15_65,
    output := OriginalRow227TriangleData0253.coefficient16_65, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_67, Icur := OriginalRow227TriangleData0238.coefficient15_66,
    output := OriginalRow227TriangleData0253.coefficient16_66, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_68, Icur := OriginalRow227TriangleData0238.coefficient15_67,
    output := OriginalRow227TriangleData0253.coefficient16_67, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_69, Icur := OriginalRow227TriangleData0238.coefficient15_68,
    output := OriginalRow227TriangleData0253.coefficient16_68, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_70, Icur := OriginalRow227TriangleData0238.coefficient15_69,
    output := OriginalRow227TriangleData0253.coefficient16_69, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_71, Icur := OriginalRow227TriangleData0238.coefficient15_70,
    output := OriginalRow227TriangleData0253.coefficient16_70, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_72, Icur := OriginalRow227TriangleData0238.coefficient15_71,
    output := OriginalRow227TriangleData0253.coefficient16_71, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_73, Icur := OriginalRow227TriangleData0238.coefficient15_72,
    output := OriginalRow227TriangleData0253.coefficient16_72, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_74, Icur := OriginalRow227TriangleData0238.coefficient15_73,
    output := OriginalRow227TriangleData0253.coefficient16_73, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_75, Icur := OriginalRow227TriangleData0238.coefficient15_74,
    output := OriginalRow227TriangleData0253.coefficient16_74, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_76, Icur := OriginalRow227TriangleData0238.coefficient15_75,
    output := OriginalRow227TriangleData0253.coefficient16_75, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0238.coefficient15_77, Icur := OriginalRow227TriangleData0238.coefficient15_76,
    output := OriginalRow227TriangleData0253.coefficient16_76, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_78, Icur := OriginalRow227TriangleData0238.coefficient15_77,
    output := OriginalRow227TriangleData0253.coefficient16_77, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root16,
    Inext := OriginalRow227TriangleData0239.coefficient15_79, Icur := OriginalRow227TriangleData0239.coefficient15_78,
    output := OriginalRow227TriangleData0253.coefficient16_78, hC := OriginalRow227TriangleRoots00.root16_pos, hAC := OriginalRow227TriangleRoots00.product16_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0237

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0237.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
