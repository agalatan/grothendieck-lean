import Grothe.UpperChaos.OriginalRow227TriangleData0447
import Grothe.UpperChaos.OriginalRow227TriangleData0448
import Grothe.UpperChaos.OriginalRow227TriangleData0461
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0445
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_62, Icur := OriginalRow227TriangleData0447.coefficient29_61,
    output := OriginalRow227TriangleData0461.coefficient30_61, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_63, Icur := OriginalRow227TriangleData0447.coefficient29_62,
    output := OriginalRow227TriangleData0461.coefficient30_62, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_64, Icur := OriginalRow227TriangleData0447.coefficient29_63,
    output := OriginalRow227TriangleData0461.coefficient30_63, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_65, Icur := OriginalRow227TriangleData0447.coefficient29_64,
    output := OriginalRow227TriangleData0461.coefficient30_64, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_66, Icur := OriginalRow227TriangleData0447.coefficient29_65,
    output := OriginalRow227TriangleData0461.coefficient30_65, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_67, Icur := OriginalRow227TriangleData0447.coefficient29_66,
    output := OriginalRow227TriangleData0461.coefficient30_66, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_68, Icur := OriginalRow227TriangleData0447.coefficient29_67,
    output := OriginalRow227TriangleData0461.coefficient30_67, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_69, Icur := OriginalRow227TriangleData0447.coefficient29_68,
    output := OriginalRow227TriangleData0461.coefficient30_68, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_70, Icur := OriginalRow227TriangleData0447.coefficient29_69,
    output := OriginalRow227TriangleData0461.coefficient30_69, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_71, Icur := OriginalRow227TriangleData0447.coefficient29_70,
    output := OriginalRow227TriangleData0461.coefficient30_70, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_72, Icur := OriginalRow227TriangleData0447.coefficient29_71,
    output := OriginalRow227TriangleData0461.coefficient30_71, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_73, Icur := OriginalRow227TriangleData0447.coefficient29_72,
    output := OriginalRow227TriangleData0461.coefficient30_72, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_74, Icur := OriginalRow227TriangleData0447.coefficient29_73,
    output := OriginalRow227TriangleData0461.coefficient30_73, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_75, Icur := OriginalRow227TriangleData0447.coefficient29_74,
    output := OriginalRow227TriangleData0461.coefficient30_74, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_76, Icur := OriginalRow227TriangleData0447.coefficient29_75,
    output := OriginalRow227TriangleData0461.coefficient30_75, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_77, Icur := OriginalRow227TriangleData0447.coefficient29_76,
    output := OriginalRow227TriangleData0461.coefficient30_76, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_78, Icur := OriginalRow227TriangleData0447.coefficient29_77,
    output := OriginalRow227TriangleData0461.coefficient30_77, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_79, Icur := OriginalRow227TriangleData0447.coefficient29_78,
    output := OriginalRow227TriangleData0461.coefficient30_78, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_80, Icur := OriginalRow227TriangleData0447.coefficient29_79,
    output := OriginalRow227TriangleData0461.coefficient30_79, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_81, Icur := OriginalRow227TriangleData0447.coefficient29_80,
    output := OriginalRow227TriangleData0461.coefficient30_80, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_82, Icur := OriginalRow227TriangleData0447.coefficient29_81,
    output := OriginalRow227TriangleData0461.coefficient30_81, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_83, Icur := OriginalRow227TriangleData0447.coefficient29_82,
    output := OriginalRow227TriangleData0461.coefficient30_82, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_84, Icur := OriginalRow227TriangleData0447.coefficient29_83,
    output := OriginalRow227TriangleData0461.coefficient30_83, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_85, Icur := OriginalRow227TriangleData0447.coefficient29_84,
    output := OriginalRow227TriangleData0461.coefficient30_84, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_86, Icur := OriginalRow227TriangleData0447.coefficient29_85,
    output := OriginalRow227TriangleData0461.coefficient30_85, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_87, Icur := OriginalRow227TriangleData0447.coefficient29_86,
    output := OriginalRow227TriangleData0461.coefficient30_86, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_88, Icur := OriginalRow227TriangleData0447.coefficient29_87,
    output := OriginalRow227TriangleData0461.coefficient30_87, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_89, Icur := OriginalRow227TriangleData0447.coefficient29_88,
    output := OriginalRow227TriangleData0461.coefficient30_88, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_90, Icur := OriginalRow227TriangleData0447.coefficient29_89,
    output := OriginalRow227TriangleData0461.coefficient30_89, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0447.coefficient29_91, Icur := OriginalRow227TriangleData0447.coefficient29_90,
    output := OriginalRow227TriangleData0461.coefficient30_90, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0448.coefficient29_92, Icur := OriginalRow227TriangleData0447.coefficient29_91,
    output := OriginalRow227TriangleData0461.coefficient30_91, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root30,
    Inext := OriginalRow227TriangleData0448.coefficient29_93, Icur := OriginalRow227TriangleData0448.coefficient29_92,
    output := OriginalRow227TriangleData0461.coefficient30_92, hC := OriginalRow227TriangleRoots00.root30_pos, hAC := OriginalRow227TriangleRoots00.product30_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0445

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0445.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
