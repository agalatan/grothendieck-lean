import Grothe.UpperChaos.OriginalRow227TriangleData0503
import Grothe.UpperChaos.OriginalRow227TriangleData0504
import Grothe.UpperChaos.OriginalRow227TriangleData0517
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0501
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_66, Icur := OriginalRow227TriangleData0503.coefficient33_65,
    output := OriginalRow227TriangleData0517.coefficient34_65, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_67, Icur := OriginalRow227TriangleData0503.coefficient33_66,
    output := OriginalRow227TriangleData0517.coefficient34_66, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_68, Icur := OriginalRow227TriangleData0503.coefficient33_67,
    output := OriginalRow227TriangleData0517.coefficient34_67, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_69, Icur := OriginalRow227TriangleData0503.coefficient33_68,
    output := OriginalRow227TriangleData0517.coefficient34_68, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_70, Icur := OriginalRow227TriangleData0503.coefficient33_69,
    output := OriginalRow227TriangleData0517.coefficient34_69, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_71, Icur := OriginalRow227TriangleData0503.coefficient33_70,
    output := OriginalRow227TriangleData0517.coefficient34_70, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_72, Icur := OriginalRow227TriangleData0503.coefficient33_71,
    output := OriginalRow227TriangleData0517.coefficient34_71, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_73, Icur := OriginalRow227TriangleData0503.coefficient33_72,
    output := OriginalRow227TriangleData0517.coefficient34_72, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_74, Icur := OriginalRow227TriangleData0503.coefficient33_73,
    output := OriginalRow227TriangleData0517.coefficient34_73, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_75, Icur := OriginalRow227TriangleData0503.coefficient33_74,
    output := OriginalRow227TriangleData0517.coefficient34_74, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_76, Icur := OriginalRow227TriangleData0503.coefficient33_75,
    output := OriginalRow227TriangleData0517.coefficient34_75, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_77, Icur := OriginalRow227TriangleData0503.coefficient33_76,
    output := OriginalRow227TriangleData0517.coefficient34_76, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_78, Icur := OriginalRow227TriangleData0503.coefficient33_77,
    output := OriginalRow227TriangleData0517.coefficient34_77, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_79, Icur := OriginalRow227TriangleData0503.coefficient33_78,
    output := OriginalRow227TriangleData0517.coefficient34_78, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_80, Icur := OriginalRow227TriangleData0503.coefficient33_79,
    output := OriginalRow227TriangleData0517.coefficient34_79, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_81, Icur := OriginalRow227TriangleData0503.coefficient33_80,
    output := OriginalRow227TriangleData0517.coefficient34_80, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_82, Icur := OriginalRow227TriangleData0503.coefficient33_81,
    output := OriginalRow227TriangleData0517.coefficient34_81, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_83, Icur := OriginalRow227TriangleData0503.coefficient33_82,
    output := OriginalRow227TriangleData0517.coefficient34_82, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_84, Icur := OriginalRow227TriangleData0503.coefficient33_83,
    output := OriginalRow227TriangleData0517.coefficient34_83, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_85, Icur := OriginalRow227TriangleData0503.coefficient33_84,
    output := OriginalRow227TriangleData0517.coefficient34_84, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_86, Icur := OriginalRow227TriangleData0503.coefficient33_85,
    output := OriginalRow227TriangleData0517.coefficient34_85, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_87, Icur := OriginalRow227TriangleData0503.coefficient33_86,
    output := OriginalRow227TriangleData0517.coefficient34_86, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_88, Icur := OriginalRow227TriangleData0503.coefficient33_87,
    output := OriginalRow227TriangleData0517.coefficient34_87, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_89, Icur := OriginalRow227TriangleData0503.coefficient33_88,
    output := OriginalRow227TriangleData0517.coefficient34_88, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_90, Icur := OriginalRow227TriangleData0503.coefficient33_89,
    output := OriginalRow227TriangleData0517.coefficient34_89, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_91, Icur := OriginalRow227TriangleData0503.coefficient33_90,
    output := OriginalRow227TriangleData0517.coefficient34_90, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_92, Icur := OriginalRow227TriangleData0503.coefficient33_91,
    output := OriginalRow227TriangleData0517.coefficient34_91, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_93, Icur := OriginalRow227TriangleData0503.coefficient33_92,
    output := OriginalRow227TriangleData0517.coefficient34_92, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_94, Icur := OriginalRow227TriangleData0503.coefficient33_93,
    output := OriginalRow227TriangleData0517.coefficient34_93, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0503.coefficient33_95, Icur := OriginalRow227TriangleData0503.coefficient33_94,
    output := OriginalRow227TriangleData0517.coefficient34_94, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_96, Icur := OriginalRow227TriangleData0503.coefficient33_95,
    output := OriginalRow227TriangleData0517.coefficient34_95, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root34,
    Inext := OriginalRow227TriangleData0504.coefficient33_97, Icur := OriginalRow227TriangleData0504.coefficient33_96,
    output := OriginalRow227TriangleData0517.coefficient34_96, hC := OriginalRow227TriangleRoots01.root34_pos, hAC := OriginalRow227TriangleRoots01.product34_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0501

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0501.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
