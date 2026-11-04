import Grothe.UpperChaos.OriginalRow227TriangleData0614
import Grothe.UpperChaos.OriginalRow227TriangleData0615
import Grothe.UpperChaos.OriginalRow227TriangleData0628
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0612
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_42, Icur := OriginalRow227TriangleData0614.coefficient41_41,
    output := OriginalRow227TriangleData0628.coefficient42_41, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_43, Icur := OriginalRow227TriangleData0614.coefficient41_42,
    output := OriginalRow227TriangleData0628.coefficient42_42, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_44, Icur := OriginalRow227TriangleData0614.coefficient41_43,
    output := OriginalRow227TriangleData0628.coefficient42_43, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_45, Icur := OriginalRow227TriangleData0614.coefficient41_44,
    output := OriginalRow227TriangleData0628.coefficient42_44, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_46, Icur := OriginalRow227TriangleData0614.coefficient41_45,
    output := OriginalRow227TriangleData0628.coefficient42_45, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_47, Icur := OriginalRow227TriangleData0614.coefficient41_46,
    output := OriginalRow227TriangleData0628.coefficient42_46, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_48, Icur := OriginalRow227TriangleData0614.coefficient41_47,
    output := OriginalRow227TriangleData0628.coefficient42_47, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_49, Icur := OriginalRow227TriangleData0614.coefficient41_48,
    output := OriginalRow227TriangleData0628.coefficient42_48, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_50, Icur := OriginalRow227TriangleData0614.coefficient41_49,
    output := OriginalRow227TriangleData0628.coefficient42_49, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_51, Icur := OriginalRow227TriangleData0614.coefficient41_50,
    output := OriginalRow227TriangleData0628.coefficient42_50, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_52, Icur := OriginalRow227TriangleData0614.coefficient41_51,
    output := OriginalRow227TriangleData0628.coefficient42_51, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_53, Icur := OriginalRow227TriangleData0614.coefficient41_52,
    output := OriginalRow227TriangleData0628.coefficient42_52, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_54, Icur := OriginalRow227TriangleData0614.coefficient41_53,
    output := OriginalRow227TriangleData0628.coefficient42_53, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_55, Icur := OriginalRow227TriangleData0614.coefficient41_54,
    output := OriginalRow227TriangleData0628.coefficient42_54, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_56, Icur := OriginalRow227TriangleData0614.coefficient41_55,
    output := OriginalRow227TriangleData0628.coefficient42_55, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_57, Icur := OriginalRow227TriangleData0614.coefficient41_56,
    output := OriginalRow227TriangleData0628.coefficient42_56, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_58, Icur := OriginalRow227TriangleData0614.coefficient41_57,
    output := OriginalRow227TriangleData0628.coefficient42_57, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_59, Icur := OriginalRow227TriangleData0614.coefficient41_58,
    output := OriginalRow227TriangleData0628.coefficient42_58, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_60, Icur := OriginalRow227TriangleData0614.coefficient41_59,
    output := OriginalRow227TriangleData0628.coefficient42_59, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_61, Icur := OriginalRow227TriangleData0614.coefficient41_60,
    output := OriginalRow227TriangleData0628.coefficient42_60, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_62, Icur := OriginalRow227TriangleData0614.coefficient41_61,
    output := OriginalRow227TriangleData0628.coefficient42_61, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_63, Icur := OriginalRow227TriangleData0614.coefficient41_62,
    output := OriginalRow227TriangleData0628.coefficient42_62, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_64, Icur := OriginalRow227TriangleData0614.coefficient41_63,
    output := OriginalRow227TriangleData0628.coefficient42_63, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_65, Icur := OriginalRow227TriangleData0614.coefficient41_64,
    output := OriginalRow227TriangleData0628.coefficient42_64, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_66, Icur := OriginalRow227TriangleData0614.coefficient41_65,
    output := OriginalRow227TriangleData0628.coefficient42_65, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_67, Icur := OriginalRow227TriangleData0614.coefficient41_66,
    output := OriginalRow227TriangleData0628.coefficient42_66, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_68, Icur := OriginalRow227TriangleData0614.coefficient41_67,
    output := OriginalRow227TriangleData0628.coefficient42_67, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_69, Icur := OriginalRow227TriangleData0614.coefficient41_68,
    output := OriginalRow227TriangleData0628.coefficient42_68, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_70, Icur := OriginalRow227TriangleData0614.coefficient41_69,
    output := OriginalRow227TriangleData0628.coefficient42_69, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0614.coefficient41_71, Icur := OriginalRow227TriangleData0614.coefficient41_70,
    output := OriginalRow227TriangleData0628.coefficient42_70, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_72, Icur := OriginalRow227TriangleData0614.coefficient41_71,
    output := OriginalRow227TriangleData0628.coefficient42_71, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_73, Icur := OriginalRow227TriangleData0615.coefficient41_72,
    output := OriginalRow227TriangleData0628.coefficient42_72, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0612

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0612.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
