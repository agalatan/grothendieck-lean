import Grothe.UpperChaos.OriginalRow227TriangleData0298
import Grothe.UpperChaos.OriginalRow227TriangleData0299
import Grothe.UpperChaos.OriginalRow227TriangleData0313
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0297
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_52, Icur := OriginalRow227TriangleData0298.coefficient19_51,
    output := OriginalRow227TriangleData0313.coefficient20_51, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_53, Icur := OriginalRow227TriangleData0298.coefficient19_52,
    output := OriginalRow227TriangleData0313.coefficient20_52, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_54, Icur := OriginalRow227TriangleData0298.coefficient19_53,
    output := OriginalRow227TriangleData0313.coefficient20_53, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_55, Icur := OriginalRow227TriangleData0298.coefficient19_54,
    output := OriginalRow227TriangleData0313.coefficient20_54, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_56, Icur := OriginalRow227TriangleData0298.coefficient19_55,
    output := OriginalRow227TriangleData0313.coefficient20_55, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_57, Icur := OriginalRow227TriangleData0298.coefficient19_56,
    output := OriginalRow227TriangleData0313.coefficient20_56, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_58, Icur := OriginalRow227TriangleData0298.coefficient19_57,
    output := OriginalRow227TriangleData0313.coefficient20_57, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_59, Icur := OriginalRow227TriangleData0298.coefficient19_58,
    output := OriginalRow227TriangleData0313.coefficient20_58, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_60, Icur := OriginalRow227TriangleData0298.coefficient19_59,
    output := OriginalRow227TriangleData0313.coefficient20_59, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_61, Icur := OriginalRow227TriangleData0298.coefficient19_60,
    output := OriginalRow227TriangleData0313.coefficient20_60, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_62, Icur := OriginalRow227TriangleData0298.coefficient19_61,
    output := OriginalRow227TriangleData0313.coefficient20_61, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_63, Icur := OriginalRow227TriangleData0298.coefficient19_62,
    output := OriginalRow227TriangleData0313.coefficient20_62, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_64, Icur := OriginalRow227TriangleData0298.coefficient19_63,
    output := OriginalRow227TriangleData0313.coefficient20_63, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_65, Icur := OriginalRow227TriangleData0298.coefficient19_64,
    output := OriginalRow227TriangleData0313.coefficient20_64, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_66, Icur := OriginalRow227TriangleData0298.coefficient19_65,
    output := OriginalRow227TriangleData0313.coefficient20_65, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_67, Icur := OriginalRow227TriangleData0298.coefficient19_66,
    output := OriginalRow227TriangleData0313.coefficient20_66, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_68, Icur := OriginalRow227TriangleData0298.coefficient19_67,
    output := OriginalRow227TriangleData0313.coefficient20_67, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_69, Icur := OriginalRow227TriangleData0298.coefficient19_68,
    output := OriginalRow227TriangleData0313.coefficient20_68, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_70, Icur := OriginalRow227TriangleData0298.coefficient19_69,
    output := OriginalRow227TriangleData0313.coefficient20_69, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_71, Icur := OriginalRow227TriangleData0298.coefficient19_70,
    output := OriginalRow227TriangleData0313.coefficient20_70, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_72, Icur := OriginalRow227TriangleData0298.coefficient19_71,
    output := OriginalRow227TriangleData0313.coefficient20_71, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_73, Icur := OriginalRow227TriangleData0298.coefficient19_72,
    output := OriginalRow227TriangleData0313.coefficient20_72, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_74, Icur := OriginalRow227TriangleData0298.coefficient19_73,
    output := OriginalRow227TriangleData0313.coefficient20_73, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_75, Icur := OriginalRow227TriangleData0298.coefficient19_74,
    output := OriginalRow227TriangleData0313.coefficient20_74, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_76, Icur := OriginalRow227TriangleData0298.coefficient19_75,
    output := OriginalRow227TriangleData0313.coefficient20_75, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_77, Icur := OriginalRow227TriangleData0298.coefficient19_76,
    output := OriginalRow227TriangleData0313.coefficient20_76, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_78, Icur := OriginalRow227TriangleData0298.coefficient19_77,
    output := OriginalRow227TriangleData0313.coefficient20_77, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_79, Icur := OriginalRow227TriangleData0298.coefficient19_78,
    output := OriginalRow227TriangleData0313.coefficient20_78, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_80, Icur := OriginalRow227TriangleData0298.coefficient19_79,
    output := OriginalRow227TriangleData0313.coefficient20_79, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0298.coefficient19_81, Icur := OriginalRow227TriangleData0298.coefficient19_80,
    output := OriginalRow227TriangleData0313.coefficient20_80, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0299.coefficient19_82, Icur := OriginalRow227TriangleData0298.coefficient19_81,
    output := OriginalRow227TriangleData0313.coefficient20_81, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root20,
    Inext := OriginalRow227TriangleData0299.coefficient19_83, Icur := OriginalRow227TriangleData0299.coefficient19_82,
    output := OriginalRow227TriangleData0313.coefficient20_82, hC := OriginalRow227TriangleRoots00.root20_pos, hAC := OriginalRow227TriangleRoots00.product20_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0297

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0297.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
