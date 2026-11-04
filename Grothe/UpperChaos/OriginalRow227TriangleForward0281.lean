import Grothe.UpperChaos.OriginalRow227TriangleData0282
import Grothe.UpperChaos.OriginalRow227TriangleData0283
import Grothe.UpperChaos.OriginalRow227TriangleData0297
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0281
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_19, Icur := OriginalRow227TriangleData0282.coefficient18_18,
    output := OriginalRow227TriangleData0297.coefficient19_18, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_20, Icur := OriginalRow227TriangleData0282.coefficient18_19,
    output := OriginalRow227TriangleData0297.coefficient19_19, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_21, Icur := OriginalRow227TriangleData0282.coefficient18_20,
    output := OriginalRow227TriangleData0297.coefficient19_20, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_22, Icur := OriginalRow227TriangleData0282.coefficient18_21,
    output := OriginalRow227TriangleData0297.coefficient19_21, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_23, Icur := OriginalRow227TriangleData0282.coefficient18_22,
    output := OriginalRow227TriangleData0297.coefficient19_22, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_24, Icur := OriginalRow227TriangleData0282.coefficient18_23,
    output := OriginalRow227TriangleData0297.coefficient19_23, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_25, Icur := OriginalRow227TriangleData0282.coefficient18_24,
    output := OriginalRow227TriangleData0297.coefficient19_24, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_26, Icur := OriginalRow227TriangleData0282.coefficient18_25,
    output := OriginalRow227TriangleData0297.coefficient19_25, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_27, Icur := OriginalRow227TriangleData0282.coefficient18_26,
    output := OriginalRow227TriangleData0297.coefficient19_26, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_28, Icur := OriginalRow227TriangleData0282.coefficient18_27,
    output := OriginalRow227TriangleData0297.coefficient19_27, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_29, Icur := OriginalRow227TriangleData0282.coefficient18_28,
    output := OriginalRow227TriangleData0297.coefficient19_28, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_30, Icur := OriginalRow227TriangleData0282.coefficient18_29,
    output := OriginalRow227TriangleData0297.coefficient19_29, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_31, Icur := OriginalRow227TriangleData0282.coefficient18_30,
    output := OriginalRow227TriangleData0297.coefficient19_30, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_32, Icur := OriginalRow227TriangleData0282.coefficient18_31,
    output := OriginalRow227TriangleData0297.coefficient19_31, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_33, Icur := OriginalRow227TriangleData0282.coefficient18_32,
    output := OriginalRow227TriangleData0297.coefficient19_32, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_34, Icur := OriginalRow227TriangleData0282.coefficient18_33,
    output := OriginalRow227TriangleData0297.coefficient19_33, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_35, Icur := OriginalRow227TriangleData0282.coefficient18_34,
    output := OriginalRow227TriangleData0297.coefficient19_34, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_36, Icur := OriginalRow227TriangleData0282.coefficient18_35,
    output := OriginalRow227TriangleData0297.coefficient19_35, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_37, Icur := OriginalRow227TriangleData0282.coefficient18_36,
    output := OriginalRow227TriangleData0297.coefficient19_36, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_38, Icur := OriginalRow227TriangleData0282.coefficient18_37,
    output := OriginalRow227TriangleData0297.coefficient19_37, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_39, Icur := OriginalRow227TriangleData0282.coefficient18_38,
    output := OriginalRow227TriangleData0297.coefficient19_38, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_40, Icur := OriginalRow227TriangleData0282.coefficient18_39,
    output := OriginalRow227TriangleData0297.coefficient19_39, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_41, Icur := OriginalRow227TriangleData0282.coefficient18_40,
    output := OriginalRow227TriangleData0297.coefficient19_40, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_42, Icur := OriginalRow227TriangleData0282.coefficient18_41,
    output := OriginalRow227TriangleData0297.coefficient19_41, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_43, Icur := OriginalRow227TriangleData0282.coefficient18_42,
    output := OriginalRow227TriangleData0297.coefficient19_42, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_44, Icur := OriginalRow227TriangleData0282.coefficient18_43,
    output := OriginalRow227TriangleData0297.coefficient19_43, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_45, Icur := OriginalRow227TriangleData0282.coefficient18_44,
    output := OriginalRow227TriangleData0297.coefficient19_44, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_46, Icur := OriginalRow227TriangleData0282.coefficient18_45,
    output := OriginalRow227TriangleData0297.coefficient19_45, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_47, Icur := OriginalRow227TriangleData0282.coefficient18_46,
    output := OriginalRow227TriangleData0297.coefficient19_46, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0282.coefficient18_48, Icur := OriginalRow227TriangleData0282.coefficient18_47,
    output := OriginalRow227TriangleData0297.coefficient19_47, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0283.coefficient18_49, Icur := OriginalRow227TriangleData0282.coefficient18_48,
    output := OriginalRow227TriangleData0297.coefficient19_48, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root19,
    Inext := OriginalRow227TriangleData0283.coefficient18_50, Icur := OriginalRow227TriangleData0283.coefficient18_49,
    output := OriginalRow227TriangleData0297.coefficient19_49, hC := OriginalRow227TriangleRoots00.root19_pos, hAC := OriginalRow227TriangleRoots00.product19_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0281

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0281.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
