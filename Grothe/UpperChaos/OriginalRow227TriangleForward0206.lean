import Grothe.UpperChaos.OriginalRow227TriangleData0207
import Grothe.UpperChaos.OriginalRow227TriangleData0208
import Grothe.UpperChaos.OriginalRow227TriangleData0222
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0206
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root14, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_14, Icur := OriginalRow227TriangleData0207.coefficient13_13,
    output := OriginalRow227TriangleData0222.coefficient14_13, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root15, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_15, Icur := OriginalRow227TriangleData0207.coefficient13_14,
    output := OriginalRow227TriangleData0222.coefficient14_14, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root16, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_16, Icur := OriginalRow227TriangleData0207.coefficient13_15,
    output := OriginalRow227TriangleData0222.coefficient14_15, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_17, Icur := OriginalRow227TriangleData0207.coefficient13_16,
    output := OriginalRow227TriangleData0222.coefficient14_16, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_18, Icur := OriginalRow227TriangleData0207.coefficient13_17,
    output := OriginalRow227TriangleData0222.coefficient14_17, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_19, Icur := OriginalRow227TriangleData0207.coefficient13_18,
    output := OriginalRow227TriangleData0222.coefficient14_18, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_20, Icur := OriginalRow227TriangleData0207.coefficient13_19,
    output := OriginalRow227TriangleData0222.coefficient14_19, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_21, Icur := OriginalRow227TriangleData0207.coefficient13_20,
    output := OriginalRow227TriangleData0222.coefficient14_20, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_22, Icur := OriginalRow227TriangleData0207.coefficient13_21,
    output := OriginalRow227TriangleData0222.coefficient14_21, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_23, Icur := OriginalRow227TriangleData0207.coefficient13_22,
    output := OriginalRow227TriangleData0222.coefficient14_22, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_24, Icur := OriginalRow227TriangleData0207.coefficient13_23,
    output := OriginalRow227TriangleData0222.coefficient14_23, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_25, Icur := OriginalRow227TriangleData0207.coefficient13_24,
    output := OriginalRow227TriangleData0222.coefficient14_24, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_26, Icur := OriginalRow227TriangleData0207.coefficient13_25,
    output := OriginalRow227TriangleData0222.coefficient14_25, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_27, Icur := OriginalRow227TriangleData0207.coefficient13_26,
    output := OriginalRow227TriangleData0222.coefficient14_26, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_28, Icur := OriginalRow227TriangleData0207.coefficient13_27,
    output := OriginalRow227TriangleData0222.coefficient14_27, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_29, Icur := OriginalRow227TriangleData0207.coefficient13_28,
    output := OriginalRow227TriangleData0222.coefficient14_28, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_30, Icur := OriginalRow227TriangleData0207.coefficient13_29,
    output := OriginalRow227TriangleData0222.coefficient14_29, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_31, Icur := OriginalRow227TriangleData0207.coefficient13_30,
    output := OriginalRow227TriangleData0222.coefficient14_30, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_32, Icur := OriginalRow227TriangleData0207.coefficient13_31,
    output := OriginalRow227TriangleData0222.coefficient14_31, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_33, Icur := OriginalRow227TriangleData0207.coefficient13_32,
    output := OriginalRow227TriangleData0222.coefficient14_32, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_34, Icur := OriginalRow227TriangleData0207.coefficient13_33,
    output := OriginalRow227TriangleData0222.coefficient14_33, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_35, Icur := OriginalRow227TriangleData0207.coefficient13_34,
    output := OriginalRow227TriangleData0222.coefficient14_34, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_36, Icur := OriginalRow227TriangleData0207.coefficient13_35,
    output := OriginalRow227TriangleData0222.coefficient14_35, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_37, Icur := OriginalRow227TriangleData0207.coefficient13_36,
    output := OriginalRow227TriangleData0222.coefficient14_36, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_38, Icur := OriginalRow227TriangleData0207.coefficient13_37,
    output := OriginalRow227TriangleData0222.coefficient14_37, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_39, Icur := OriginalRow227TriangleData0207.coefficient13_38,
    output := OriginalRow227TriangleData0222.coefficient14_38, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_40, Icur := OriginalRow227TriangleData0207.coefficient13_39,
    output := OriginalRow227TriangleData0222.coefficient14_39, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_41, Icur := OriginalRow227TriangleData0207.coefficient13_40,
    output := OriginalRow227TriangleData0222.coefficient14_40, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_42, Icur := OriginalRow227TriangleData0207.coefficient13_41,
    output := OriginalRow227TriangleData0222.coefficient14_41, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0207.coefficient13_43, Icur := OriginalRow227TriangleData0207.coefficient13_42,
    output := OriginalRow227TriangleData0222.coefficient14_42, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_44, Icur := OriginalRow227TriangleData0207.coefficient13_43,
    output := OriginalRow227TriangleData0222.coefficient14_43, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root14,
    Inext := OriginalRow227TriangleData0208.coefficient13_45, Icur := OriginalRow227TriangleData0208.coefficient13_44,
    output := OriginalRow227TriangleData0222.coefficient14_44, hC := OriginalRow227TriangleRoots00.root14_pos, hAC := OriginalRow227TriangleRoots00.product14_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0206

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0206.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
