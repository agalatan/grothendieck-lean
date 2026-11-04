import Grothe.UpperChaos.OriginalRow227TriangleData0418
import Grothe.UpperChaos.OriginalRow227TriangleData0419
import Grothe.UpperChaos.OriginalRow227TriangleData0433
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0417
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_60, Icur := OriginalRow227TriangleData0418.coefficient27_59,
    output := OriginalRow227TriangleData0433.coefficient28_59, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_61, Icur := OriginalRow227TriangleData0418.coefficient27_60,
    output := OriginalRow227TriangleData0433.coefficient28_60, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_62, Icur := OriginalRow227TriangleData0418.coefficient27_61,
    output := OriginalRow227TriangleData0433.coefficient28_61, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_63, Icur := OriginalRow227TriangleData0418.coefficient27_62,
    output := OriginalRow227TriangleData0433.coefficient28_62, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_64, Icur := OriginalRow227TriangleData0418.coefficient27_63,
    output := OriginalRow227TriangleData0433.coefficient28_63, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_65, Icur := OriginalRow227TriangleData0418.coefficient27_64,
    output := OriginalRow227TriangleData0433.coefficient28_64, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_66, Icur := OriginalRow227TriangleData0418.coefficient27_65,
    output := OriginalRow227TriangleData0433.coefficient28_65, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_67, Icur := OriginalRow227TriangleData0418.coefficient27_66,
    output := OriginalRow227TriangleData0433.coefficient28_66, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_68, Icur := OriginalRow227TriangleData0418.coefficient27_67,
    output := OriginalRow227TriangleData0433.coefficient28_67, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_69, Icur := OriginalRow227TriangleData0418.coefficient27_68,
    output := OriginalRow227TriangleData0433.coefficient28_68, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_70, Icur := OriginalRow227TriangleData0418.coefficient27_69,
    output := OriginalRow227TriangleData0433.coefficient28_69, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_71, Icur := OriginalRow227TriangleData0418.coefficient27_70,
    output := OriginalRow227TriangleData0433.coefficient28_70, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_72, Icur := OriginalRow227TriangleData0418.coefficient27_71,
    output := OriginalRow227TriangleData0433.coefficient28_71, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_73, Icur := OriginalRow227TriangleData0418.coefficient27_72,
    output := OriginalRow227TriangleData0433.coefficient28_72, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_74, Icur := OriginalRow227TriangleData0418.coefficient27_73,
    output := OriginalRow227TriangleData0433.coefficient28_73, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_75, Icur := OriginalRow227TriangleData0418.coefficient27_74,
    output := OriginalRow227TriangleData0433.coefficient28_74, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_76, Icur := OriginalRow227TriangleData0418.coefficient27_75,
    output := OriginalRow227TriangleData0433.coefficient28_75, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_77, Icur := OriginalRow227TriangleData0418.coefficient27_76,
    output := OriginalRow227TriangleData0433.coefficient28_76, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_78, Icur := OriginalRow227TriangleData0418.coefficient27_77,
    output := OriginalRow227TriangleData0433.coefficient28_77, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_79, Icur := OriginalRow227TriangleData0418.coefficient27_78,
    output := OriginalRow227TriangleData0433.coefficient28_78, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_80, Icur := OriginalRow227TriangleData0418.coefficient27_79,
    output := OriginalRow227TriangleData0433.coefficient28_79, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_81, Icur := OriginalRow227TriangleData0418.coefficient27_80,
    output := OriginalRow227TriangleData0433.coefficient28_80, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_82, Icur := OriginalRow227TriangleData0418.coefficient27_81,
    output := OriginalRow227TriangleData0433.coefficient28_81, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_83, Icur := OriginalRow227TriangleData0418.coefficient27_82,
    output := OriginalRow227TriangleData0433.coefficient28_82, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_84, Icur := OriginalRow227TriangleData0418.coefficient27_83,
    output := OriginalRow227TriangleData0433.coefficient28_83, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_85, Icur := OriginalRow227TriangleData0418.coefficient27_84,
    output := OriginalRow227TriangleData0433.coefficient28_84, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_86, Icur := OriginalRow227TriangleData0418.coefficient27_85,
    output := OriginalRow227TriangleData0433.coefficient28_85, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_87, Icur := OriginalRow227TriangleData0418.coefficient27_86,
    output := OriginalRow227TriangleData0433.coefficient28_86, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_88, Icur := OriginalRow227TriangleData0418.coefficient27_87,
    output := OriginalRow227TriangleData0433.coefficient28_87, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0418.coefficient27_89, Icur := OriginalRow227TriangleData0418.coefficient27_88,
    output := OriginalRow227TriangleData0433.coefficient28_88, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0419.coefficient27_90, Icur := OriginalRow227TriangleData0418.coefficient27_89,
    output := OriginalRow227TriangleData0433.coefficient28_89, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root28,
    Inext := OriginalRow227TriangleData0419.coefficient27_91, Icur := OriginalRow227TriangleData0419.coefficient27_90,
    output := OriginalRow227TriangleData0433.coefficient28_90, hC := OriginalRow227TriangleRoots00.root28_pos, hAC := OriginalRow227TriangleRoots00.product28_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0417

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0417.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
