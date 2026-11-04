import Grothe.UpperChaos.OriginalRow227TriangleData0516
import Grothe.UpperChaos.OriginalRow227TriangleData0517
import Grothe.UpperChaos.OriginalRow227TriangleData0530
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0514
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_35, Icur := OriginalRow227TriangleData0516.coefficient34_34,
    output := OriginalRow227TriangleData0530.coefficient35_34, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_36, Icur := OriginalRow227TriangleData0516.coefficient34_35,
    output := OriginalRow227TriangleData0530.coefficient35_35, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_37, Icur := OriginalRow227TriangleData0516.coefficient34_36,
    output := OriginalRow227TriangleData0530.coefficient35_36, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_38, Icur := OriginalRow227TriangleData0516.coefficient34_37,
    output := OriginalRow227TriangleData0530.coefficient35_37, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_39, Icur := OriginalRow227TriangleData0516.coefficient34_38,
    output := OriginalRow227TriangleData0530.coefficient35_38, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_40, Icur := OriginalRow227TriangleData0516.coefficient34_39,
    output := OriginalRow227TriangleData0530.coefficient35_39, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_41, Icur := OriginalRow227TriangleData0516.coefficient34_40,
    output := OriginalRow227TriangleData0530.coefficient35_40, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_42, Icur := OriginalRow227TriangleData0516.coefficient34_41,
    output := OriginalRow227TriangleData0530.coefficient35_41, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_43, Icur := OriginalRow227TriangleData0516.coefficient34_42,
    output := OriginalRow227TriangleData0530.coefficient35_42, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_44, Icur := OriginalRow227TriangleData0516.coefficient34_43,
    output := OriginalRow227TriangleData0530.coefficient35_43, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_45, Icur := OriginalRow227TriangleData0516.coefficient34_44,
    output := OriginalRow227TriangleData0530.coefficient35_44, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_46, Icur := OriginalRow227TriangleData0516.coefficient34_45,
    output := OriginalRow227TriangleData0530.coefficient35_45, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_47, Icur := OriginalRow227TriangleData0516.coefficient34_46,
    output := OriginalRow227TriangleData0530.coefficient35_46, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_48, Icur := OriginalRow227TriangleData0516.coefficient34_47,
    output := OriginalRow227TriangleData0530.coefficient35_47, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_49, Icur := OriginalRow227TriangleData0516.coefficient34_48,
    output := OriginalRow227TriangleData0530.coefficient35_48, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_50, Icur := OriginalRow227TriangleData0516.coefficient34_49,
    output := OriginalRow227TriangleData0530.coefficient35_49, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_51, Icur := OriginalRow227TriangleData0516.coefficient34_50,
    output := OriginalRow227TriangleData0530.coefficient35_50, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_52, Icur := OriginalRow227TriangleData0516.coefficient34_51,
    output := OriginalRow227TriangleData0530.coefficient35_51, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_53, Icur := OriginalRow227TriangleData0516.coefficient34_52,
    output := OriginalRow227TriangleData0530.coefficient35_52, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_54, Icur := OriginalRow227TriangleData0516.coefficient34_53,
    output := OriginalRow227TriangleData0530.coefficient35_53, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_55, Icur := OriginalRow227TriangleData0516.coefficient34_54,
    output := OriginalRow227TriangleData0530.coefficient35_54, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_56, Icur := OriginalRow227TriangleData0516.coefficient34_55,
    output := OriginalRow227TriangleData0530.coefficient35_55, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_57, Icur := OriginalRow227TriangleData0516.coefficient34_56,
    output := OriginalRow227TriangleData0530.coefficient35_56, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_58, Icur := OriginalRow227TriangleData0516.coefficient34_57,
    output := OriginalRow227TriangleData0530.coefficient35_57, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_59, Icur := OriginalRow227TriangleData0516.coefficient34_58,
    output := OriginalRow227TriangleData0530.coefficient35_58, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_60, Icur := OriginalRow227TriangleData0516.coefficient34_59,
    output := OriginalRow227TriangleData0530.coefficient35_59, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_61, Icur := OriginalRow227TriangleData0516.coefficient34_60,
    output := OriginalRow227TriangleData0530.coefficient35_60, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_62, Icur := OriginalRow227TriangleData0516.coefficient34_61,
    output := OriginalRow227TriangleData0530.coefficient35_61, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_63, Icur := OriginalRow227TriangleData0516.coefficient34_62,
    output := OriginalRow227TriangleData0530.coefficient35_62, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0516.coefficient34_64, Icur := OriginalRow227TriangleData0516.coefficient34_63,
    output := OriginalRow227TriangleData0530.coefficient35_63, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0517.coefficient34_65, Icur := OriginalRow227TriangleData0516.coefficient34_64,
    output := OriginalRow227TriangleData0530.coefficient35_64, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root35,
    Inext := OriginalRow227TriangleData0517.coefficient34_66, Icur := OriginalRow227TriangleData0517.coefficient34_65,
    output := OriginalRow227TriangleData0530.coefficient35_65, hC := OriginalRow227TriangleRoots01.root35_pos, hAC := OriginalRow227TriangleRoots01.product35_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0514

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0514.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
