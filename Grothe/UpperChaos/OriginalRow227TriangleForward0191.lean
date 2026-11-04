import Grothe.UpperChaos.OriginalRow227TriangleData0192
import Grothe.UpperChaos.OriginalRow227TriangleData0193
import Grothe.UpperChaos.OriginalRow227TriangleData0207
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0191
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root13, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_13, Icur := OriginalRow227TriangleData0192.coefficient12_12,
    output := OriginalRow227TriangleData0207.coefficient13_12, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root14, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_14, Icur := OriginalRow227TriangleData0192.coefficient12_13,
    output := OriginalRow227TriangleData0207.coefficient13_13, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root15, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_15, Icur := OriginalRow227TriangleData0192.coefficient12_14,
    output := OriginalRow227TriangleData0207.coefficient13_14, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root16, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_16, Icur := OriginalRow227TriangleData0192.coefficient12_15,
    output := OriginalRow227TriangleData0207.coefficient13_15, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_17, Icur := OriginalRow227TriangleData0192.coefficient12_16,
    output := OriginalRow227TriangleData0207.coefficient13_16, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_18, Icur := OriginalRow227TriangleData0192.coefficient12_17,
    output := OriginalRow227TriangleData0207.coefficient13_17, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_19, Icur := OriginalRow227TriangleData0192.coefficient12_18,
    output := OriginalRow227TriangleData0207.coefficient13_18, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_20, Icur := OriginalRow227TriangleData0192.coefficient12_19,
    output := OriginalRow227TriangleData0207.coefficient13_19, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_21, Icur := OriginalRow227TriangleData0192.coefficient12_20,
    output := OriginalRow227TriangleData0207.coefficient13_20, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_22, Icur := OriginalRow227TriangleData0192.coefficient12_21,
    output := OriginalRow227TriangleData0207.coefficient13_21, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_23, Icur := OriginalRow227TriangleData0192.coefficient12_22,
    output := OriginalRow227TriangleData0207.coefficient13_22, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_24, Icur := OriginalRow227TriangleData0192.coefficient12_23,
    output := OriginalRow227TriangleData0207.coefficient13_23, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_25, Icur := OriginalRow227TriangleData0192.coefficient12_24,
    output := OriginalRow227TriangleData0207.coefficient13_24, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_26, Icur := OriginalRow227TriangleData0192.coefficient12_25,
    output := OriginalRow227TriangleData0207.coefficient13_25, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_27, Icur := OriginalRow227TriangleData0192.coefficient12_26,
    output := OriginalRow227TriangleData0207.coefficient13_26, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_28, Icur := OriginalRow227TriangleData0192.coefficient12_27,
    output := OriginalRow227TriangleData0207.coefficient13_27, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_29, Icur := OriginalRow227TriangleData0192.coefficient12_28,
    output := OriginalRow227TriangleData0207.coefficient13_28, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_30, Icur := OriginalRow227TriangleData0192.coefficient12_29,
    output := OriginalRow227TriangleData0207.coefficient13_29, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_31, Icur := OriginalRow227TriangleData0192.coefficient12_30,
    output := OriginalRow227TriangleData0207.coefficient13_30, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_32, Icur := OriginalRow227TriangleData0192.coefficient12_31,
    output := OriginalRow227TriangleData0207.coefficient13_31, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_33, Icur := OriginalRow227TriangleData0192.coefficient12_32,
    output := OriginalRow227TriangleData0207.coefficient13_32, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_34, Icur := OriginalRow227TriangleData0192.coefficient12_33,
    output := OriginalRow227TriangleData0207.coefficient13_33, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_35, Icur := OriginalRow227TriangleData0192.coefficient12_34,
    output := OriginalRow227TriangleData0207.coefficient13_34, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_36, Icur := OriginalRow227TriangleData0192.coefficient12_35,
    output := OriginalRow227TriangleData0207.coefficient13_35, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_37, Icur := OriginalRow227TriangleData0192.coefficient12_36,
    output := OriginalRow227TriangleData0207.coefficient13_36, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_38, Icur := OriginalRow227TriangleData0192.coefficient12_37,
    output := OriginalRow227TriangleData0207.coefficient13_37, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_39, Icur := OriginalRow227TriangleData0192.coefficient12_38,
    output := OriginalRow227TriangleData0207.coefficient13_38, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_40, Icur := OriginalRow227TriangleData0192.coefficient12_39,
    output := OriginalRow227TriangleData0207.coefficient13_39, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_41, Icur := OriginalRow227TriangleData0192.coefficient12_40,
    output := OriginalRow227TriangleData0207.coefficient13_40, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0192.coefficient12_42, Icur := OriginalRow227TriangleData0192.coefficient12_41,
    output := OriginalRow227TriangleData0207.coefficient13_41, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0193.coefficient12_43, Icur := OriginalRow227TriangleData0192.coefficient12_42,
    output := OriginalRow227TriangleData0207.coefficient13_42, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root13,
    Inext := OriginalRow227TriangleData0193.coefficient12_44, Icur := OriginalRow227TriangleData0193.coefficient12_43,
    output := OriginalRow227TriangleData0207.coefficient13_43, hC := OriginalRow227TriangleRoots00.root13_pos, hAC := OriginalRow227TriangleRoots00.product13_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0191

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0191.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
