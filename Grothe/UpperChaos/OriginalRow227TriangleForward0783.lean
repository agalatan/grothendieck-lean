import Grothe.UpperChaos.OriginalRow227TriangleData0786
import Grothe.UpperChaos.OriginalRow227TriangleData0787
import Grothe.UpperChaos.OriginalRow227TriangleData0799
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0783
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_55, Icur := OriginalRow227TriangleData0786.coefficient54_54,
    output := OriginalRow227TriangleData0799.coefficient55_54, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_56, Icur := OriginalRow227TriangleData0786.coefficient54_55,
    output := OriginalRow227TriangleData0799.coefficient55_55, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_57, Icur := OriginalRow227TriangleData0786.coefficient54_56,
    output := OriginalRow227TriangleData0799.coefficient55_56, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_58, Icur := OriginalRow227TriangleData0786.coefficient54_57,
    output := OriginalRow227TriangleData0799.coefficient55_57, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_59, Icur := OriginalRow227TriangleData0786.coefficient54_58,
    output := OriginalRow227TriangleData0799.coefficient55_58, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_60, Icur := OriginalRow227TriangleData0786.coefficient54_59,
    output := OriginalRow227TriangleData0799.coefficient55_59, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_61, Icur := OriginalRow227TriangleData0786.coefficient54_60,
    output := OriginalRow227TriangleData0799.coefficient55_60, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_62, Icur := OriginalRow227TriangleData0786.coefficient54_61,
    output := OriginalRow227TriangleData0799.coefficient55_61, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_63, Icur := OriginalRow227TriangleData0786.coefficient54_62,
    output := OriginalRow227TriangleData0799.coefficient55_62, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_64, Icur := OriginalRow227TriangleData0786.coefficient54_63,
    output := OriginalRow227TriangleData0799.coefficient55_63, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_65, Icur := OriginalRow227TriangleData0786.coefficient54_64,
    output := OriginalRow227TriangleData0799.coefficient55_64, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_66, Icur := OriginalRow227TriangleData0786.coefficient54_65,
    output := OriginalRow227TriangleData0799.coefficient55_65, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_67, Icur := OriginalRow227TriangleData0786.coefficient54_66,
    output := OriginalRow227TriangleData0799.coefficient55_66, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_68, Icur := OriginalRow227TriangleData0786.coefficient54_67,
    output := OriginalRow227TriangleData0799.coefficient55_67, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_69, Icur := OriginalRow227TriangleData0786.coefficient54_68,
    output := OriginalRow227TriangleData0799.coefficient55_68, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_70, Icur := OriginalRow227TriangleData0786.coefficient54_69,
    output := OriginalRow227TriangleData0799.coefficient55_69, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_71, Icur := OriginalRow227TriangleData0786.coefficient54_70,
    output := OriginalRow227TriangleData0799.coefficient55_70, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_72, Icur := OriginalRow227TriangleData0786.coefficient54_71,
    output := OriginalRow227TriangleData0799.coefficient55_71, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_73, Icur := OriginalRow227TriangleData0786.coefficient54_72,
    output := OriginalRow227TriangleData0799.coefficient55_72, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_74, Icur := OriginalRow227TriangleData0786.coefficient54_73,
    output := OriginalRow227TriangleData0799.coefficient55_73, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_75, Icur := OriginalRow227TriangleData0786.coefficient54_74,
    output := OriginalRow227TriangleData0799.coefficient55_74, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_76, Icur := OriginalRow227TriangleData0786.coefficient54_75,
    output := OriginalRow227TriangleData0799.coefficient55_75, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_77, Icur := OriginalRow227TriangleData0786.coefficient54_76,
    output := OriginalRow227TriangleData0799.coefficient55_76, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_78, Icur := OriginalRow227TriangleData0786.coefficient54_77,
    output := OriginalRow227TriangleData0799.coefficient55_77, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_79, Icur := OriginalRow227TriangleData0786.coefficient54_78,
    output := OriginalRow227TriangleData0799.coefficient55_78, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_80, Icur := OriginalRow227TriangleData0786.coefficient54_79,
    output := OriginalRow227TriangleData0799.coefficient55_79, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_81, Icur := OriginalRow227TriangleData0786.coefficient54_80,
    output := OriginalRow227TriangleData0799.coefficient55_80, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_82, Icur := OriginalRow227TriangleData0786.coefficient54_81,
    output := OriginalRow227TriangleData0799.coefficient55_81, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_83, Icur := OriginalRow227TriangleData0786.coefficient54_82,
    output := OriginalRow227TriangleData0799.coefficient55_82, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0786.coefficient54_84, Icur := OriginalRow227TriangleData0786.coefficient54_83,
    output := OriginalRow227TriangleData0799.coefficient55_83, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0787.coefficient54_85, Icur := OriginalRow227TriangleData0786.coefficient54_84,
    output := OriginalRow227TriangleData0799.coefficient55_84, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root55,
    Inext := OriginalRow227TriangleData0787.coefficient54_86, Icur := OriginalRow227TriangleData0787.coefficient54_85,
    output := OriginalRow227TriangleData0799.coefficient55_85, hC := OriginalRow227TriangleRoots01.root55_pos, hAC := OriginalRow227TriangleRoots01.product55_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0783

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0783.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
