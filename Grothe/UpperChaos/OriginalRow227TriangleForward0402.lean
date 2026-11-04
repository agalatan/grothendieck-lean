import Grothe.UpperChaos.OriginalRow227TriangleData0403
import Grothe.UpperChaos.OriginalRow227TriangleData0404
import Grothe.UpperChaos.OriginalRow227TriangleData0418
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0402
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_59, Icur := OriginalRow227TriangleData0403.coefficient26_58,
    output := OriginalRow227TriangleData0418.coefficient27_58, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_60, Icur := OriginalRow227TriangleData0403.coefficient26_59,
    output := OriginalRow227TriangleData0418.coefficient27_59, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_61, Icur := OriginalRow227TriangleData0403.coefficient26_60,
    output := OriginalRow227TriangleData0418.coefficient27_60, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_62, Icur := OriginalRow227TriangleData0403.coefficient26_61,
    output := OriginalRow227TriangleData0418.coefficient27_61, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_63, Icur := OriginalRow227TriangleData0403.coefficient26_62,
    output := OriginalRow227TriangleData0418.coefficient27_62, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_64, Icur := OriginalRow227TriangleData0403.coefficient26_63,
    output := OriginalRow227TriangleData0418.coefficient27_63, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_65, Icur := OriginalRow227TriangleData0403.coefficient26_64,
    output := OriginalRow227TriangleData0418.coefficient27_64, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_66, Icur := OriginalRow227TriangleData0403.coefficient26_65,
    output := OriginalRow227TriangleData0418.coefficient27_65, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_67, Icur := OriginalRow227TriangleData0403.coefficient26_66,
    output := OriginalRow227TriangleData0418.coefficient27_66, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_68, Icur := OriginalRow227TriangleData0403.coefficient26_67,
    output := OriginalRow227TriangleData0418.coefficient27_67, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_69, Icur := OriginalRow227TriangleData0403.coefficient26_68,
    output := OriginalRow227TriangleData0418.coefficient27_68, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_70, Icur := OriginalRow227TriangleData0403.coefficient26_69,
    output := OriginalRow227TriangleData0418.coefficient27_69, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_71, Icur := OriginalRow227TriangleData0403.coefficient26_70,
    output := OriginalRow227TriangleData0418.coefficient27_70, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_72, Icur := OriginalRow227TriangleData0403.coefficient26_71,
    output := OriginalRow227TriangleData0418.coefficient27_71, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_73, Icur := OriginalRow227TriangleData0403.coefficient26_72,
    output := OriginalRow227TriangleData0418.coefficient27_72, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_74, Icur := OriginalRow227TriangleData0403.coefficient26_73,
    output := OriginalRow227TriangleData0418.coefficient27_73, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_75, Icur := OriginalRow227TriangleData0403.coefficient26_74,
    output := OriginalRow227TriangleData0418.coefficient27_74, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_76, Icur := OriginalRow227TriangleData0403.coefficient26_75,
    output := OriginalRow227TriangleData0418.coefficient27_75, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_77, Icur := OriginalRow227TriangleData0403.coefficient26_76,
    output := OriginalRow227TriangleData0418.coefficient27_76, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_78, Icur := OriginalRow227TriangleData0403.coefficient26_77,
    output := OriginalRow227TriangleData0418.coefficient27_77, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_79, Icur := OriginalRow227TriangleData0403.coefficient26_78,
    output := OriginalRow227TriangleData0418.coefficient27_78, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_80, Icur := OriginalRow227TriangleData0403.coefficient26_79,
    output := OriginalRow227TriangleData0418.coefficient27_79, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_81, Icur := OriginalRow227TriangleData0403.coefficient26_80,
    output := OriginalRow227TriangleData0418.coefficient27_80, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_82, Icur := OriginalRow227TriangleData0403.coefficient26_81,
    output := OriginalRow227TriangleData0418.coefficient27_81, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_83, Icur := OriginalRow227TriangleData0403.coefficient26_82,
    output := OriginalRow227TriangleData0418.coefficient27_82, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_84, Icur := OriginalRow227TriangleData0403.coefficient26_83,
    output := OriginalRow227TriangleData0418.coefficient27_83, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_85, Icur := OriginalRow227TriangleData0403.coefficient26_84,
    output := OriginalRow227TriangleData0418.coefficient27_84, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_86, Icur := OriginalRow227TriangleData0403.coefficient26_85,
    output := OriginalRow227TriangleData0418.coefficient27_85, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_87, Icur := OriginalRow227TriangleData0403.coefficient26_86,
    output := OriginalRow227TriangleData0418.coefficient27_86, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0403.coefficient26_88, Icur := OriginalRow227TriangleData0403.coefficient26_87,
    output := OriginalRow227TriangleData0418.coefficient27_87, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_89, Icur := OriginalRow227TriangleData0403.coefficient26_88,
    output := OriginalRow227TriangleData0418.coefficient27_88, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root27,
    Inext := OriginalRow227TriangleData0404.coefficient26_90, Icur := OriginalRow227TriangleData0404.coefficient26_89,
    output := OriginalRow227TriangleData0418.coefficient27_89, hC := OriginalRow227TriangleRoots00.root27_pos, hAC := OriginalRow227TriangleRoots00.product27_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0402

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0402.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
