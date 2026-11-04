import Grothe.UpperChaos.OriginalRow227TriangleData0208
import Grothe.UpperChaos.OriginalRow227TriangleData0209
import Grothe.UpperChaos.OriginalRow227TriangleData0223
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0207
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_46, Icur := OriginalRow227TriangleData0208.coefficient13_45,
    output := OriginalRow227TriangleData0223.coefficient14_45, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_47, Icur := OriginalRow227TriangleData0208.coefficient13_46,
    output := OriginalRow227TriangleData0223.coefficient14_46, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_48, Icur := OriginalRow227TriangleData0208.coefficient13_47,
    output := OriginalRow227TriangleData0223.coefficient14_47, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_49, Icur := OriginalRow227TriangleData0208.coefficient13_48,
    output := OriginalRow227TriangleData0223.coefficient14_48, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_50, Icur := OriginalRow227TriangleData0208.coefficient13_49,
    output := OriginalRow227TriangleData0223.coefficient14_49, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_51, Icur := OriginalRow227TriangleData0208.coefficient13_50,
    output := OriginalRow227TriangleData0223.coefficient14_50, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_52, Icur := OriginalRow227TriangleData0208.coefficient13_51,
    output := OriginalRow227TriangleData0223.coefficient14_51, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_53, Icur := OriginalRow227TriangleData0208.coefficient13_52,
    output := OriginalRow227TriangleData0223.coefficient14_52, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_54, Icur := OriginalRow227TriangleData0208.coefficient13_53,
    output := OriginalRow227TriangleData0223.coefficient14_53, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_55, Icur := OriginalRow227TriangleData0208.coefficient13_54,
    output := OriginalRow227TriangleData0223.coefficient14_54, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_56, Icur := OriginalRow227TriangleData0208.coefficient13_55,
    output := OriginalRow227TriangleData0223.coefficient14_55, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_57, Icur := OriginalRow227TriangleData0208.coefficient13_56,
    output := OriginalRow227TriangleData0223.coefficient14_56, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_58, Icur := OriginalRow227TriangleData0208.coefficient13_57,
    output := OriginalRow227TriangleData0223.coefficient14_57, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_59, Icur := OriginalRow227TriangleData0208.coefficient13_58,
    output := OriginalRow227TriangleData0223.coefficient14_58, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_60, Icur := OriginalRow227TriangleData0208.coefficient13_59,
    output := OriginalRow227TriangleData0223.coefficient14_59, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_61, Icur := OriginalRow227TriangleData0208.coefficient13_60,
    output := OriginalRow227TriangleData0223.coefficient14_60, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_62, Icur := OriginalRow227TriangleData0208.coefficient13_61,
    output := OriginalRow227TriangleData0223.coefficient14_61, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_63, Icur := OriginalRow227TriangleData0208.coefficient13_62,
    output := OriginalRow227TriangleData0223.coefficient14_62, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_64, Icur := OriginalRow227TriangleData0208.coefficient13_63,
    output := OriginalRow227TriangleData0223.coefficient14_63, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_65, Icur := OriginalRow227TriangleData0208.coefficient13_64,
    output := OriginalRow227TriangleData0223.coefficient14_64, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_66, Icur := OriginalRow227TriangleData0208.coefficient13_65,
    output := OriginalRow227TriangleData0223.coefficient14_65, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_67, Icur := OriginalRow227TriangleData0208.coefficient13_66,
    output := OriginalRow227TriangleData0223.coefficient14_66, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_68, Icur := OriginalRow227TriangleData0208.coefficient13_67,
    output := OriginalRow227TriangleData0223.coefficient14_67, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_69, Icur := OriginalRow227TriangleData0208.coefficient13_68,
    output := OriginalRow227TriangleData0223.coefficient14_68, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_70, Icur := OriginalRow227TriangleData0208.coefficient13_69,
    output := OriginalRow227TriangleData0223.coefficient14_69, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_71, Icur := OriginalRow227TriangleData0208.coefficient13_70,
    output := OriginalRow227TriangleData0223.coefficient14_70, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_72, Icur := OriginalRow227TriangleData0208.coefficient13_71,
    output := OriginalRow227TriangleData0223.coefficient14_71, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_73, Icur := OriginalRow227TriangleData0208.coefficient13_72,
    output := OriginalRow227TriangleData0223.coefficient14_72, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_74, Icur := OriginalRow227TriangleData0208.coefficient13_73,
    output := OriginalRow227TriangleData0223.coefficient14_73, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_75, Icur := OriginalRow227TriangleData0208.coefficient13_74,
    output := OriginalRow227TriangleData0223.coefficient14_74, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0209.coefficient13_76, Icur := OriginalRow227TriangleData0208.coefficient13_75,
    output := OriginalRow227TriangleData0223.coefficient14_75, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0209.coefficient13_77, Icur := OriginalRow227TriangleData0209.coefficient13_76,
    output := OriginalRow227TriangleData0223.coefficient14_76, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0207

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0207.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
