import Grothe.UpperChaos.OriginalRow227TriangleData0144
import Grothe.UpperChaos.OriginalRow227TriangleData0145
import Grothe.UpperChaos.OriginalRow227TriangleData0160
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0144
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots00.root10, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_10, Icur := OriginalRow227TriangleData0144.coefficient9_9,
    output := OriginalRow227TriangleData0160.coefficient10_9, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots00.root11, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_11, Icur := OriginalRow227TriangleData0144.coefficient9_10,
    output := OriginalRow227TriangleData0160.coefficient10_10, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots00.root12, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_12, Icur := OriginalRow227TriangleData0144.coefficient9_11,
    output := OriginalRow227TriangleData0160.coefficient10_11, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots00.root13, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_13, Icur := OriginalRow227TriangleData0144.coefficient9_12,
    output := OriginalRow227TriangleData0160.coefficient10_12, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots00.root14, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_14, Icur := OriginalRow227TriangleData0144.coefficient9_13,
    output := OriginalRow227TriangleData0160.coefficient10_13, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots00.root15, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_15, Icur := OriginalRow227TriangleData0144.coefficient9_14,
    output := OriginalRow227TriangleData0160.coefficient10_14, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots00.root16, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_16, Icur := OriginalRow227TriangleData0144.coefficient9_15,
    output := OriginalRow227TriangleData0160.coefficient10_15, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots00.root17, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_17, Icur := OriginalRow227TriangleData0144.coefficient9_16,
    output := OriginalRow227TriangleData0160.coefficient10_16, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots00.root18, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_18, Icur := OriginalRow227TriangleData0144.coefficient9_17,
    output := OriginalRow227TriangleData0160.coefficient10_17, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots00.root19, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_19, Icur := OriginalRow227TriangleData0144.coefficient9_18,
    output := OriginalRow227TriangleData0160.coefficient10_18, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots00.root20, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_20, Icur := OriginalRow227TriangleData0144.coefficient9_19,
    output := OriginalRow227TriangleData0160.coefficient10_19, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots00.root21, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_21, Icur := OriginalRow227TriangleData0144.coefficient9_20,
    output := OriginalRow227TriangleData0160.coefficient10_20, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots00.root22, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_22, Icur := OriginalRow227TriangleData0144.coefficient9_21,
    output := OriginalRow227TriangleData0160.coefficient10_21, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots00.root23, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_23, Icur := OriginalRow227TriangleData0144.coefficient9_22,
    output := OriginalRow227TriangleData0160.coefficient10_22, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots00.root24, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_24, Icur := OriginalRow227TriangleData0144.coefficient9_23,
    output := OriginalRow227TriangleData0160.coefficient10_23, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots00.root25, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_25, Icur := OriginalRow227TriangleData0144.coefficient9_24,
    output := OriginalRow227TriangleData0160.coefficient10_24, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots00.root26, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_26, Icur := OriginalRow227TriangleData0144.coefficient9_25,
    output := OriginalRow227TriangleData0160.coefficient10_25, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots00.root27, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_27, Icur := OriginalRow227TriangleData0144.coefficient9_26,
    output := OriginalRow227TriangleData0160.coefficient10_26, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots00.root28, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_28, Icur := OriginalRow227TriangleData0144.coefficient9_27,
    output := OriginalRow227TriangleData0160.coefficient10_27, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots00.root29, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_29, Icur := OriginalRow227TriangleData0144.coefficient9_28,
    output := OriginalRow227TriangleData0160.coefficient10_28, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots00.root30, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_30, Icur := OriginalRow227TriangleData0144.coefficient9_29,
    output := OriginalRow227TriangleData0160.coefficient10_29, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots00.root31, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_31, Icur := OriginalRow227TriangleData0144.coefficient9_30,
    output := OriginalRow227TriangleData0160.coefficient10_30, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots00.root32, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_32, Icur := OriginalRow227TriangleData0144.coefficient9_31,
    output := OriginalRow227TriangleData0160.coefficient10_31, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots01.root33, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_33, Icur := OriginalRow227TriangleData0144.coefficient9_32,
    output := OriginalRow227TriangleData0160.coefficient10_32, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots01.root34, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_34, Icur := OriginalRow227TriangleData0144.coefficient9_33,
    output := OriginalRow227TriangleData0160.coefficient10_33, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots01.root35, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_35, Icur := OriginalRow227TriangleData0144.coefficient9_34,
    output := OriginalRow227TriangleData0160.coefficient10_34, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots01.root36, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_36, Icur := OriginalRow227TriangleData0144.coefficient9_35,
    output := OriginalRow227TriangleData0160.coefficient10_35, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots01.root37, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_37, Icur := OriginalRow227TriangleData0144.coefficient9_36,
    output := OriginalRow227TriangleData0160.coefficient10_36, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots01.root38, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_38, Icur := OriginalRow227TriangleData0144.coefficient9_37,
    output := OriginalRow227TriangleData0160.coefficient10_37, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots01.root39, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0144.coefficient9_39, Icur := OriginalRow227TriangleData0144.coefficient9_38,
    output := OriginalRow227TriangleData0160.coefficient10_38, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0145.coefficient9_40, Icur := OriginalRow227TriangleData0144.coefficient9_39,
    output := OriginalRow227TriangleData0160.coefficient10_39, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0145.coefficient9_41, Icur := OriginalRow227TriangleData0145.coefficient9_40,
    output := OriginalRow227TriangleData0160.coefficient10_40, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0144

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0144.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
