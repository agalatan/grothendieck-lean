import Grothe.UpperChaos.OriginalRow227TriangleData0695
import Grothe.UpperChaos.OriginalRow227TriangleData0696
import Grothe.UpperChaos.OriginalRow227TriangleData0708
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0692
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_48, Icur := OriginalRow227TriangleData0695.coefficient47_47,
    output := OriginalRow227TriangleData0708.coefficient48_47, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_49, Icur := OriginalRow227TriangleData0695.coefficient47_48,
    output := OriginalRow227TriangleData0708.coefficient48_48, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_50, Icur := OriginalRow227TriangleData0695.coefficient47_49,
    output := OriginalRow227TriangleData0708.coefficient48_49, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_51, Icur := OriginalRow227TriangleData0695.coefficient47_50,
    output := OriginalRow227TriangleData0708.coefficient48_50, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_52, Icur := OriginalRow227TriangleData0695.coefficient47_51,
    output := OriginalRow227TriangleData0708.coefficient48_51, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_53, Icur := OriginalRow227TriangleData0695.coefficient47_52,
    output := OriginalRow227TriangleData0708.coefficient48_52, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_54, Icur := OriginalRow227TriangleData0695.coefficient47_53,
    output := OriginalRow227TriangleData0708.coefficient48_53, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_55, Icur := OriginalRow227TriangleData0695.coefficient47_54,
    output := OriginalRow227TriangleData0708.coefficient48_54, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_56, Icur := OriginalRow227TriangleData0695.coefficient47_55,
    output := OriginalRow227TriangleData0708.coefficient48_55, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_57, Icur := OriginalRow227TriangleData0695.coefficient47_56,
    output := OriginalRow227TriangleData0708.coefficient48_56, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_58, Icur := OriginalRow227TriangleData0695.coefficient47_57,
    output := OriginalRow227TriangleData0708.coefficient48_57, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_59, Icur := OriginalRow227TriangleData0695.coefficient47_58,
    output := OriginalRow227TriangleData0708.coefficient48_58, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_60, Icur := OriginalRow227TriangleData0695.coefficient47_59,
    output := OriginalRow227TriangleData0708.coefficient48_59, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_61, Icur := OriginalRow227TriangleData0695.coefficient47_60,
    output := OriginalRow227TriangleData0708.coefficient48_60, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_62, Icur := OriginalRow227TriangleData0695.coefficient47_61,
    output := OriginalRow227TriangleData0708.coefficient48_61, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_63, Icur := OriginalRow227TriangleData0695.coefficient47_62,
    output := OriginalRow227TriangleData0708.coefficient48_62, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_64, Icur := OriginalRow227TriangleData0695.coefficient47_63,
    output := OriginalRow227TriangleData0708.coefficient48_63, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_65, Icur := OriginalRow227TriangleData0695.coefficient47_64,
    output := OriginalRow227TriangleData0708.coefficient48_64, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_66, Icur := OriginalRow227TriangleData0695.coefficient47_65,
    output := OriginalRow227TriangleData0708.coefficient48_65, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_67, Icur := OriginalRow227TriangleData0695.coefficient47_66,
    output := OriginalRow227TriangleData0708.coefficient48_66, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_68, Icur := OriginalRow227TriangleData0695.coefficient47_67,
    output := OriginalRow227TriangleData0708.coefficient48_67, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_69, Icur := OriginalRow227TriangleData0695.coefficient47_68,
    output := OriginalRow227TriangleData0708.coefficient48_68, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_70, Icur := OriginalRow227TriangleData0695.coefficient47_69,
    output := OriginalRow227TriangleData0708.coefficient48_69, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_71, Icur := OriginalRow227TriangleData0695.coefficient47_70,
    output := OriginalRow227TriangleData0708.coefficient48_70, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_72, Icur := OriginalRow227TriangleData0695.coefficient47_71,
    output := OriginalRow227TriangleData0708.coefficient48_71, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_73, Icur := OriginalRow227TriangleData0695.coefficient47_72,
    output := OriginalRow227TriangleData0708.coefficient48_72, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_74, Icur := OriginalRow227TriangleData0695.coefficient47_73,
    output := OriginalRow227TriangleData0708.coefficient48_73, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_75, Icur := OriginalRow227TriangleData0695.coefficient47_74,
    output := OriginalRow227TriangleData0708.coefficient48_74, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_76, Icur := OriginalRow227TriangleData0695.coefficient47_75,
    output := OriginalRow227TriangleData0708.coefficient48_75, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0695.coefficient47_77, Icur := OriginalRow227TriangleData0695.coefficient47_76,
    output := OriginalRow227TriangleData0708.coefficient48_76, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_78, Icur := OriginalRow227TriangleData0695.coefficient47_77,
    output := OriginalRow227TriangleData0708.coefficient48_77, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root48,
    Inext := OriginalRow227TriangleData0696.coefficient47_79, Icur := OriginalRow227TriangleData0696.coefficient47_78,
    output := OriginalRow227TriangleData0708.coefficient48_78, hC := OriginalRow227TriangleRoots01.root48_pos, hAC := OriginalRow227TriangleRoots01.product48_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0692

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0692.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
