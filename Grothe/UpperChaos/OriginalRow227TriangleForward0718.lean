import Grothe.UpperChaos.OriginalRow227TriangleData0721
import Grothe.UpperChaos.OriginalRow227TriangleData0722
import Grothe.UpperChaos.OriginalRow227TriangleData0734
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0718
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_50, Icur := OriginalRow227TriangleData0721.coefficient49_49,
    output := OriginalRow227TriangleData0734.coefficient50_49, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_51, Icur := OriginalRow227TriangleData0721.coefficient49_50,
    output := OriginalRow227TriangleData0734.coefficient50_50, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_52, Icur := OriginalRow227TriangleData0721.coefficient49_51,
    output := OriginalRow227TriangleData0734.coefficient50_51, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_53, Icur := OriginalRow227TriangleData0721.coefficient49_52,
    output := OriginalRow227TriangleData0734.coefficient50_52, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_54, Icur := OriginalRow227TriangleData0721.coefficient49_53,
    output := OriginalRow227TriangleData0734.coefficient50_53, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_55, Icur := OriginalRow227TriangleData0721.coefficient49_54,
    output := OriginalRow227TriangleData0734.coefficient50_54, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_56, Icur := OriginalRow227TriangleData0721.coefficient49_55,
    output := OriginalRow227TriangleData0734.coefficient50_55, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_57, Icur := OriginalRow227TriangleData0721.coefficient49_56,
    output := OriginalRow227TriangleData0734.coefficient50_56, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_58, Icur := OriginalRow227TriangleData0721.coefficient49_57,
    output := OriginalRow227TriangleData0734.coefficient50_57, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_59, Icur := OriginalRow227TriangleData0721.coefficient49_58,
    output := OriginalRow227TriangleData0734.coefficient50_58, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_60, Icur := OriginalRow227TriangleData0721.coefficient49_59,
    output := OriginalRow227TriangleData0734.coefficient50_59, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_61, Icur := OriginalRow227TriangleData0721.coefficient49_60,
    output := OriginalRow227TriangleData0734.coefficient50_60, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_62, Icur := OriginalRow227TriangleData0721.coefficient49_61,
    output := OriginalRow227TriangleData0734.coefficient50_61, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_63, Icur := OriginalRow227TriangleData0721.coefficient49_62,
    output := OriginalRow227TriangleData0734.coefficient50_62, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_64, Icur := OriginalRow227TriangleData0721.coefficient49_63,
    output := OriginalRow227TriangleData0734.coefficient50_63, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_65, Icur := OriginalRow227TriangleData0721.coefficient49_64,
    output := OriginalRow227TriangleData0734.coefficient50_64, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_66, Icur := OriginalRow227TriangleData0721.coefficient49_65,
    output := OriginalRow227TriangleData0734.coefficient50_65, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_67, Icur := OriginalRow227TriangleData0721.coefficient49_66,
    output := OriginalRow227TriangleData0734.coefficient50_66, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_68, Icur := OriginalRow227TriangleData0721.coefficient49_67,
    output := OriginalRow227TriangleData0734.coefficient50_67, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_69, Icur := OriginalRow227TriangleData0721.coefficient49_68,
    output := OriginalRow227TriangleData0734.coefficient50_68, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_70, Icur := OriginalRow227TriangleData0721.coefficient49_69,
    output := OriginalRow227TriangleData0734.coefficient50_69, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_71, Icur := OriginalRow227TriangleData0721.coefficient49_70,
    output := OriginalRow227TriangleData0734.coefficient50_70, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_72, Icur := OriginalRow227TriangleData0721.coefficient49_71,
    output := OriginalRow227TriangleData0734.coefficient50_71, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_73, Icur := OriginalRow227TriangleData0721.coefficient49_72,
    output := OriginalRow227TriangleData0734.coefficient50_72, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_74, Icur := OriginalRow227TriangleData0721.coefficient49_73,
    output := OriginalRow227TriangleData0734.coefficient50_73, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_75, Icur := OriginalRow227TriangleData0721.coefficient49_74,
    output := OriginalRow227TriangleData0734.coefficient50_74, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_76, Icur := OriginalRow227TriangleData0721.coefficient49_75,
    output := OriginalRow227TriangleData0734.coefficient50_75, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_77, Icur := OriginalRow227TriangleData0721.coefficient49_76,
    output := OriginalRow227TriangleData0734.coefficient50_76, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_78, Icur := OriginalRow227TriangleData0721.coefficient49_77,
    output := OriginalRow227TriangleData0734.coefficient50_77, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0721.coefficient49_79, Icur := OriginalRow227TriangleData0721.coefficient49_78,
    output := OriginalRow227TriangleData0734.coefficient50_78, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_80, Icur := OriginalRow227TriangleData0721.coefficient49_79,
    output := OriginalRow227TriangleData0734.coefficient50_79, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root50,
    Inext := OriginalRow227TriangleData0722.coefficient49_81, Icur := OriginalRow227TriangleData0722.coefficient49_80,
    output := OriginalRow227TriangleData0734.coefficient50_80, hC := OriginalRow227TriangleRoots01.root50_pos, hAC := OriginalRow227TriangleRoots01.product50_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0718

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0718.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
