import Grothe.UpperChaos.OriginalRow227TriangleData0851
import Grothe.UpperChaos.OriginalRow227TriangleData0852
import Grothe.UpperChaos.OriginalRow227TriangleData0864
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0848
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_60, Icur := OriginalRow227TriangleData0851.coefficient59_59,
    output := OriginalRow227TriangleData0864.coefficient60_59, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_61, Icur := OriginalRow227TriangleData0851.coefficient59_60,
    output := OriginalRow227TriangleData0864.coefficient60_60, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_62, Icur := OriginalRow227TriangleData0851.coefficient59_61,
    output := OriginalRow227TriangleData0864.coefficient60_61, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_63, Icur := OriginalRow227TriangleData0851.coefficient59_62,
    output := OriginalRow227TriangleData0864.coefficient60_62, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_64, Icur := OriginalRow227TriangleData0851.coefficient59_63,
    output := OriginalRow227TriangleData0864.coefficient60_63, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_65, Icur := OriginalRow227TriangleData0851.coefficient59_64,
    output := OriginalRow227TriangleData0864.coefficient60_64, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_66, Icur := OriginalRow227TriangleData0851.coefficient59_65,
    output := OriginalRow227TriangleData0864.coefficient60_65, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_67, Icur := OriginalRow227TriangleData0851.coefficient59_66,
    output := OriginalRow227TriangleData0864.coefficient60_66, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_68, Icur := OriginalRow227TriangleData0851.coefficient59_67,
    output := OriginalRow227TriangleData0864.coefficient60_67, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_69, Icur := OriginalRow227TriangleData0851.coefficient59_68,
    output := OriginalRow227TriangleData0864.coefficient60_68, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_70, Icur := OriginalRow227TriangleData0851.coefficient59_69,
    output := OriginalRow227TriangleData0864.coefficient60_69, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_71, Icur := OriginalRow227TriangleData0851.coefficient59_70,
    output := OriginalRow227TriangleData0864.coefficient60_70, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_72, Icur := OriginalRow227TriangleData0851.coefficient59_71,
    output := OriginalRow227TriangleData0864.coefficient60_71, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_73, Icur := OriginalRow227TriangleData0851.coefficient59_72,
    output := OriginalRow227TriangleData0864.coefficient60_72, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_74, Icur := OriginalRow227TriangleData0851.coefficient59_73,
    output := OriginalRow227TriangleData0864.coefficient60_73, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_75, Icur := OriginalRow227TriangleData0851.coefficient59_74,
    output := OriginalRow227TriangleData0864.coefficient60_74, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_76, Icur := OriginalRow227TriangleData0851.coefficient59_75,
    output := OriginalRow227TriangleData0864.coefficient60_75, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_77, Icur := OriginalRow227TriangleData0851.coefficient59_76,
    output := OriginalRow227TriangleData0864.coefficient60_76, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_78, Icur := OriginalRow227TriangleData0851.coefficient59_77,
    output := OriginalRow227TriangleData0864.coefficient60_77, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_79, Icur := OriginalRow227TriangleData0851.coefficient59_78,
    output := OriginalRow227TriangleData0864.coefficient60_78, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_80, Icur := OriginalRow227TriangleData0851.coefficient59_79,
    output := OriginalRow227TriangleData0864.coefficient60_79, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_81, Icur := OriginalRow227TriangleData0851.coefficient59_80,
    output := OriginalRow227TriangleData0864.coefficient60_80, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_82, Icur := OriginalRow227TriangleData0851.coefficient59_81,
    output := OriginalRow227TriangleData0864.coefficient60_81, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_83, Icur := OriginalRow227TriangleData0851.coefficient59_82,
    output := OriginalRow227TriangleData0864.coefficient60_82, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_84, Icur := OriginalRow227TriangleData0851.coefficient59_83,
    output := OriginalRow227TriangleData0864.coefficient60_83, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_85, Icur := OriginalRow227TriangleData0851.coefficient59_84,
    output := OriginalRow227TriangleData0864.coefficient60_84, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_86, Icur := OriginalRow227TriangleData0851.coefficient59_85,
    output := OriginalRow227TriangleData0864.coefficient60_85, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_87, Icur := OriginalRow227TriangleData0851.coefficient59_86,
    output := OriginalRow227TriangleData0864.coefficient60_86, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_88, Icur := OriginalRow227TriangleData0851.coefficient59_87,
    output := OriginalRow227TriangleData0864.coefficient60_87, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0851.coefficient59_89, Icur := OriginalRow227TriangleData0851.coefficient59_88,
    output := OriginalRow227TriangleData0864.coefficient60_88, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_90, Icur := OriginalRow227TriangleData0851.coefficient59_89,
    output := OriginalRow227TriangleData0864.coefficient60_89, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_91, Icur := OriginalRow227TriangleData0852.coefficient59_90,
    output := OriginalRow227TriangleData0864.coefficient60_90, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0848

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0848.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
