import Grothe.UpperChaos.OriginalRow227TriangleData0001
import Grothe.UpperChaos.OriginalRow227TriangleData0002
import Grothe.UpperChaos.OriginalRow227TriangleData0017
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0001
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_33, Icur := OriginalRow227TriangleData0001.coefficient0_32,
    output := OriginalRow227TriangleData0017.coefficient1_32, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_34, Icur := OriginalRow227TriangleData0001.coefficient0_33,
    output := OriginalRow227TriangleData0017.coefficient1_33, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_35, Icur := OriginalRow227TriangleData0001.coefficient0_34,
    output := OriginalRow227TriangleData0017.coefficient1_34, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_36, Icur := OriginalRow227TriangleData0001.coefficient0_35,
    output := OriginalRow227TriangleData0017.coefficient1_35, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_37, Icur := OriginalRow227TriangleData0001.coefficient0_36,
    output := OriginalRow227TriangleData0017.coefficient1_36, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_38, Icur := OriginalRow227TriangleData0001.coefficient0_37,
    output := OriginalRow227TriangleData0017.coefficient1_37, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_39, Icur := OriginalRow227TriangleData0001.coefficient0_38,
    output := OriginalRow227TriangleData0017.coefficient1_38, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_40, Icur := OriginalRow227TriangleData0001.coefficient0_39,
    output := OriginalRow227TriangleData0017.coefficient1_39, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_41, Icur := OriginalRow227TriangleData0001.coefficient0_40,
    output := OriginalRow227TriangleData0017.coefficient1_40, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_42, Icur := OriginalRow227TriangleData0001.coefficient0_41,
    output := OriginalRow227TriangleData0017.coefficient1_41, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_43, Icur := OriginalRow227TriangleData0001.coefficient0_42,
    output := OriginalRow227TriangleData0017.coefficient1_42, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_44, Icur := OriginalRow227TriangleData0001.coefficient0_43,
    output := OriginalRow227TriangleData0017.coefficient1_43, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_45, Icur := OriginalRow227TriangleData0001.coefficient0_44,
    output := OriginalRow227TriangleData0017.coefficient1_44, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_46, Icur := OriginalRow227TriangleData0001.coefficient0_45,
    output := OriginalRow227TriangleData0017.coefficient1_45, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_47, Icur := OriginalRow227TriangleData0001.coefficient0_46,
    output := OriginalRow227TriangleData0017.coefficient1_46, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_48, Icur := OriginalRow227TriangleData0001.coefficient0_47,
    output := OriginalRow227TriangleData0017.coefficient1_47, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_49, Icur := OriginalRow227TriangleData0001.coefficient0_48,
    output := OriginalRow227TriangleData0017.coefficient1_48, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_50, Icur := OriginalRow227TriangleData0001.coefficient0_49,
    output := OriginalRow227TriangleData0017.coefficient1_49, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_51, Icur := OriginalRow227TriangleData0001.coefficient0_50,
    output := OriginalRow227TriangleData0017.coefficient1_50, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_52, Icur := OriginalRow227TriangleData0001.coefficient0_51,
    output := OriginalRow227TriangleData0017.coefficient1_51, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_53, Icur := OriginalRow227TriangleData0001.coefficient0_52,
    output := OriginalRow227TriangleData0017.coefficient1_52, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_54, Icur := OriginalRow227TriangleData0001.coefficient0_53,
    output := OriginalRow227TriangleData0017.coefficient1_53, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_55, Icur := OriginalRow227TriangleData0001.coefficient0_54,
    output := OriginalRow227TriangleData0017.coefficient1_54, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_56, Icur := OriginalRow227TriangleData0001.coefficient0_55,
    output := OriginalRow227TriangleData0017.coefficient1_55, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_57, Icur := OriginalRow227TriangleData0001.coefficient0_56,
    output := OriginalRow227TriangleData0017.coefficient1_56, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_58, Icur := OriginalRow227TriangleData0001.coefficient0_57,
    output := OriginalRow227TriangleData0017.coefficient1_57, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_59, Icur := OriginalRow227TriangleData0001.coefficient0_58,
    output := OriginalRow227TriangleData0017.coefficient1_58, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_60, Icur := OriginalRow227TriangleData0001.coefficient0_59,
    output := OriginalRow227TriangleData0017.coefficient1_59, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_61, Icur := OriginalRow227TriangleData0001.coefficient0_60,
    output := OriginalRow227TriangleData0017.coefficient1_60, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_62, Icur := OriginalRow227TriangleData0001.coefficient0_61,
    output := OriginalRow227TriangleData0017.coefficient1_61, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0001.coefficient0_63, Icur := OriginalRow227TriangleData0001.coefficient0_62,
    output := OriginalRow227TriangleData0017.coefficient1_62, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root1,
    Inext := OriginalRow227TriangleData0002.coefficient0_64, Icur := OriginalRow227TriangleData0001.coefficient0_63,
    output := OriginalRow227TriangleData0017.coefficient1_63, hC := OriginalRow227TriangleRoots00.root1_pos, hAC := OriginalRow227TriangleRoots00.product1_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0001

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0001.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
