import Grothe.UpperChaos.OriginalRow227TriangleData0864
import Grothe.UpperChaos.OriginalRow227TriangleData0865
import Grothe.UpperChaos.OriginalRow227TriangleData0876
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0860
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_61, Icur := OriginalRow227TriangleData0864.coefficient60_60,
    output := OriginalRow227TriangleData0876.coefficient61_60, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_62, Icur := OriginalRow227TriangleData0864.coefficient60_61,
    output := OriginalRow227TriangleData0876.coefficient61_61, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_63, Icur := OriginalRow227TriangleData0864.coefficient60_62,
    output := OriginalRow227TriangleData0876.coefficient61_62, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_64, Icur := OriginalRow227TriangleData0864.coefficient60_63,
    output := OriginalRow227TriangleData0876.coefficient61_63, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_65, Icur := OriginalRow227TriangleData0864.coefficient60_64,
    output := OriginalRow227TriangleData0876.coefficient61_64, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_66, Icur := OriginalRow227TriangleData0864.coefficient60_65,
    output := OriginalRow227TriangleData0876.coefficient61_65, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_67, Icur := OriginalRow227TriangleData0864.coefficient60_66,
    output := OriginalRow227TriangleData0876.coefficient61_66, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_68, Icur := OriginalRow227TriangleData0864.coefficient60_67,
    output := OriginalRow227TriangleData0876.coefficient61_67, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_69, Icur := OriginalRow227TriangleData0864.coefficient60_68,
    output := OriginalRow227TriangleData0876.coefficient61_68, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_70, Icur := OriginalRow227TriangleData0864.coefficient60_69,
    output := OriginalRow227TriangleData0876.coefficient61_69, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_71, Icur := OriginalRow227TriangleData0864.coefficient60_70,
    output := OriginalRow227TriangleData0876.coefficient61_70, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_72, Icur := OriginalRow227TriangleData0864.coefficient60_71,
    output := OriginalRow227TriangleData0876.coefficient61_71, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_73, Icur := OriginalRow227TriangleData0864.coefficient60_72,
    output := OriginalRow227TriangleData0876.coefficient61_72, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_74, Icur := OriginalRow227TriangleData0864.coefficient60_73,
    output := OriginalRow227TriangleData0876.coefficient61_73, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_75, Icur := OriginalRow227TriangleData0864.coefficient60_74,
    output := OriginalRow227TriangleData0876.coefficient61_74, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_76, Icur := OriginalRow227TriangleData0864.coefficient60_75,
    output := OriginalRow227TriangleData0876.coefficient61_75, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_77, Icur := OriginalRow227TriangleData0864.coefficient60_76,
    output := OriginalRow227TriangleData0876.coefficient61_76, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_78, Icur := OriginalRow227TriangleData0864.coefficient60_77,
    output := OriginalRow227TriangleData0876.coefficient61_77, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_79, Icur := OriginalRow227TriangleData0864.coefficient60_78,
    output := OriginalRow227TriangleData0876.coefficient61_78, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_80, Icur := OriginalRow227TriangleData0864.coefficient60_79,
    output := OriginalRow227TriangleData0876.coefficient61_79, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_81, Icur := OriginalRow227TriangleData0864.coefficient60_80,
    output := OriginalRow227TriangleData0876.coefficient61_80, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_82, Icur := OriginalRow227TriangleData0864.coefficient60_81,
    output := OriginalRow227TriangleData0876.coefficient61_81, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_83, Icur := OriginalRow227TriangleData0864.coefficient60_82,
    output := OriginalRow227TriangleData0876.coefficient61_82, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_84, Icur := OriginalRow227TriangleData0864.coefficient60_83,
    output := OriginalRow227TriangleData0876.coefficient61_83, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_85, Icur := OriginalRow227TriangleData0864.coefficient60_84,
    output := OriginalRow227TriangleData0876.coefficient61_84, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_86, Icur := OriginalRow227TriangleData0864.coefficient60_85,
    output := OriginalRow227TriangleData0876.coefficient61_85, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_87, Icur := OriginalRow227TriangleData0864.coefficient60_86,
    output := OriginalRow227TriangleData0876.coefficient61_86, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_88, Icur := OriginalRow227TriangleData0864.coefficient60_87,
    output := OriginalRow227TriangleData0876.coefficient61_87, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_89, Icur := OriginalRow227TriangleData0864.coefficient60_88,
    output := OriginalRow227TriangleData0876.coefficient61_88, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0864.coefficient60_90, Icur := OriginalRow227TriangleData0864.coefficient60_89,
    output := OriginalRow227TriangleData0876.coefficient61_89, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_91, Icur := OriginalRow227TriangleData0864.coefficient60_90,
    output := OriginalRow227TriangleData0876.coefficient61_90, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root61,
    Inext := OriginalRow227TriangleData0865.coefficient60_92, Icur := OriginalRow227TriangleData0865.coefficient60_91,
    output := OriginalRow227TriangleData0876.coefficient61_91, hC := OriginalRow227TriangleRoots01.root61_pos, hAC := OriginalRow227TriangleRoots01.product61_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0860

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0860.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
