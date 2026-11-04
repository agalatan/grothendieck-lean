import Grothe.UpperChaos.OriginalRow227TriangleData0253
import Grothe.UpperChaos.OriginalRow227TriangleData0254
import Grothe.UpperChaos.OriginalRow227TriangleData0268
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0252
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_49, Icur := OriginalRow227TriangleData0253.coefficient16_48,
    output := OriginalRow227TriangleData0268.coefficient17_48, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_50, Icur := OriginalRow227TriangleData0253.coefficient16_49,
    output := OriginalRow227TriangleData0268.coefficient17_49, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_51, Icur := OriginalRow227TriangleData0253.coefficient16_50,
    output := OriginalRow227TriangleData0268.coefficient17_50, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_52, Icur := OriginalRow227TriangleData0253.coefficient16_51,
    output := OriginalRow227TriangleData0268.coefficient17_51, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_53, Icur := OriginalRow227TriangleData0253.coefficient16_52,
    output := OriginalRow227TriangleData0268.coefficient17_52, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_54, Icur := OriginalRow227TriangleData0253.coefficient16_53,
    output := OriginalRow227TriangleData0268.coefficient17_53, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_55, Icur := OriginalRow227TriangleData0253.coefficient16_54,
    output := OriginalRow227TriangleData0268.coefficient17_54, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_56, Icur := OriginalRow227TriangleData0253.coefficient16_55,
    output := OriginalRow227TriangleData0268.coefficient17_55, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_57, Icur := OriginalRow227TriangleData0253.coefficient16_56,
    output := OriginalRow227TriangleData0268.coefficient17_56, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_58, Icur := OriginalRow227TriangleData0253.coefficient16_57,
    output := OriginalRow227TriangleData0268.coefficient17_57, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_59, Icur := OriginalRow227TriangleData0253.coefficient16_58,
    output := OriginalRow227TriangleData0268.coefficient17_58, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_60, Icur := OriginalRow227TriangleData0253.coefficient16_59,
    output := OriginalRow227TriangleData0268.coefficient17_59, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_61, Icur := OriginalRow227TriangleData0253.coefficient16_60,
    output := OriginalRow227TriangleData0268.coefficient17_60, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_62, Icur := OriginalRow227TriangleData0253.coefficient16_61,
    output := OriginalRow227TriangleData0268.coefficient17_61, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_63, Icur := OriginalRow227TriangleData0253.coefficient16_62,
    output := OriginalRow227TriangleData0268.coefficient17_62, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_64, Icur := OriginalRow227TriangleData0253.coefficient16_63,
    output := OriginalRow227TriangleData0268.coefficient17_63, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_65, Icur := OriginalRow227TriangleData0253.coefficient16_64,
    output := OriginalRow227TriangleData0268.coefficient17_64, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_66, Icur := OriginalRow227TriangleData0253.coefficient16_65,
    output := OriginalRow227TriangleData0268.coefficient17_65, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_67, Icur := OriginalRow227TriangleData0253.coefficient16_66,
    output := OriginalRow227TriangleData0268.coefficient17_66, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_68, Icur := OriginalRow227TriangleData0253.coefficient16_67,
    output := OriginalRow227TriangleData0268.coefficient17_67, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_69, Icur := OriginalRow227TriangleData0253.coefficient16_68,
    output := OriginalRow227TriangleData0268.coefficient17_68, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_70, Icur := OriginalRow227TriangleData0253.coefficient16_69,
    output := OriginalRow227TriangleData0268.coefficient17_69, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_71, Icur := OriginalRow227TriangleData0253.coefficient16_70,
    output := OriginalRow227TriangleData0268.coefficient17_70, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_72, Icur := OriginalRow227TriangleData0253.coefficient16_71,
    output := OriginalRow227TriangleData0268.coefficient17_71, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_73, Icur := OriginalRow227TriangleData0253.coefficient16_72,
    output := OriginalRow227TriangleData0268.coefficient17_72, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_74, Icur := OriginalRow227TriangleData0253.coefficient16_73,
    output := OriginalRow227TriangleData0268.coefficient17_73, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_75, Icur := OriginalRow227TriangleData0253.coefficient16_74,
    output := OriginalRow227TriangleData0268.coefficient17_74, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_76, Icur := OriginalRow227TriangleData0253.coefficient16_75,
    output := OriginalRow227TriangleData0268.coefficient17_75, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_77, Icur := OriginalRow227TriangleData0253.coefficient16_76,
    output := OriginalRow227TriangleData0268.coefficient17_76, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0253.coefficient16_78, Icur := OriginalRow227TriangleData0253.coefficient16_77,
    output := OriginalRow227TriangleData0268.coefficient17_77, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0254.coefficient16_79, Icur := OriginalRow227TriangleData0253.coefficient16_78,
    output := OriginalRow227TriangleData0268.coefficient17_78, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root17,
    Inext := OriginalRow227TriangleData0254.coefficient16_80, Icur := OriginalRow227TriangleData0254.coefficient16_79,
    output := OriginalRow227TriangleData0268.coefficient17_79, hC := OriginalRow227TriangleRoots00.root17_pos, hAC := OriginalRow227TriangleRoots00.product17_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0252

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0252.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
