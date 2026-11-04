import Grothe.UpperChaos.OriginalRow227TriangleData0488
import Grothe.UpperChaos.OriginalRow227TriangleData0489
import Grothe.UpperChaos.OriginalRow227TriangleData0502
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0486
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_33, Icur := OriginalRow227TriangleData0488.coefficient32_32,
    output := OriginalRow227TriangleData0502.coefficient33_32, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_34, Icur := OriginalRow227TriangleData0488.coefficient32_33,
    output := OriginalRow227TriangleData0502.coefficient33_33, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_35, Icur := OriginalRow227TriangleData0488.coefficient32_34,
    output := OriginalRow227TriangleData0502.coefficient33_34, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_36, Icur := OriginalRow227TriangleData0488.coefficient32_35,
    output := OriginalRow227TriangleData0502.coefficient33_35, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_37, Icur := OriginalRow227TriangleData0488.coefficient32_36,
    output := OriginalRow227TriangleData0502.coefficient33_36, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_38, Icur := OriginalRow227TriangleData0488.coefficient32_37,
    output := OriginalRow227TriangleData0502.coefficient33_37, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_39, Icur := OriginalRow227TriangleData0488.coefficient32_38,
    output := OriginalRow227TriangleData0502.coefficient33_38, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_40, Icur := OriginalRow227TriangleData0488.coefficient32_39,
    output := OriginalRow227TriangleData0502.coefficient33_39, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_41, Icur := OriginalRow227TriangleData0488.coefficient32_40,
    output := OriginalRow227TriangleData0502.coefficient33_40, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_42, Icur := OriginalRow227TriangleData0488.coefficient32_41,
    output := OriginalRow227TriangleData0502.coefficient33_41, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_43, Icur := OriginalRow227TriangleData0488.coefficient32_42,
    output := OriginalRow227TriangleData0502.coefficient33_42, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_44, Icur := OriginalRow227TriangleData0488.coefficient32_43,
    output := OriginalRow227TriangleData0502.coefficient33_43, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_45, Icur := OriginalRow227TriangleData0488.coefficient32_44,
    output := OriginalRow227TriangleData0502.coefficient33_44, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_46, Icur := OriginalRow227TriangleData0488.coefficient32_45,
    output := OriginalRow227TriangleData0502.coefficient33_45, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_47, Icur := OriginalRow227TriangleData0488.coefficient32_46,
    output := OriginalRow227TriangleData0502.coefficient33_46, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_48, Icur := OriginalRow227TriangleData0488.coefficient32_47,
    output := OriginalRow227TriangleData0502.coefficient33_47, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_49, Icur := OriginalRow227TriangleData0488.coefficient32_48,
    output := OriginalRow227TriangleData0502.coefficient33_48, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_50, Icur := OriginalRow227TriangleData0488.coefficient32_49,
    output := OriginalRow227TriangleData0502.coefficient33_49, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_51, Icur := OriginalRow227TriangleData0488.coefficient32_50,
    output := OriginalRow227TriangleData0502.coefficient33_50, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_52, Icur := OriginalRow227TriangleData0488.coefficient32_51,
    output := OriginalRow227TriangleData0502.coefficient33_51, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_53, Icur := OriginalRow227TriangleData0488.coefficient32_52,
    output := OriginalRow227TriangleData0502.coefficient33_52, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_54, Icur := OriginalRow227TriangleData0488.coefficient32_53,
    output := OriginalRow227TriangleData0502.coefficient33_53, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_55, Icur := OriginalRow227TriangleData0488.coefficient32_54,
    output := OriginalRow227TriangleData0502.coefficient33_54, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_56, Icur := OriginalRow227TriangleData0488.coefficient32_55,
    output := OriginalRow227TriangleData0502.coefficient33_55, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_57, Icur := OriginalRow227TriangleData0488.coefficient32_56,
    output := OriginalRow227TriangleData0502.coefficient33_56, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_58, Icur := OriginalRow227TriangleData0488.coefficient32_57,
    output := OriginalRow227TriangleData0502.coefficient33_57, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_59, Icur := OriginalRow227TriangleData0488.coefficient32_58,
    output := OriginalRow227TriangleData0502.coefficient33_58, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_60, Icur := OriginalRow227TriangleData0488.coefficient32_59,
    output := OriginalRow227TriangleData0502.coefficient33_59, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_61, Icur := OriginalRow227TriangleData0488.coefficient32_60,
    output := OriginalRow227TriangleData0502.coefficient33_60, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0488.coefficient32_62, Icur := OriginalRow227TriangleData0488.coefficient32_61,
    output := OriginalRow227TriangleData0502.coefficient33_61, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0489.coefficient32_63, Icur := OriginalRow227TriangleData0488.coefficient32_62,
    output := OriginalRow227TriangleData0502.coefficient33_62, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root33,
    Inext := OriginalRow227TriangleData0489.coefficient32_64, Icur := OriginalRow227TriangleData0489.coefficient32_63,
    output := OriginalRow227TriangleData0502.coefficient33_63, hC := OriginalRow227TriangleRoots01.root33_pos, hAC := OriginalRow227TriangleRoots01.product33_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0486

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0486.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
