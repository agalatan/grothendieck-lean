import Grothe.UpperChaos.OriginalRow227TriangleData0113
import Grothe.UpperChaos.OriginalRow227TriangleData0114
import Grothe.UpperChaos.OriginalRow227TriangleData0129
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0113
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root40, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_40, Icur := OriginalRow227TriangleData0113.coefficient7_39,
    output := OriginalRow227TriangleData0129.coefficient8_39, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root41, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_41, Icur := OriginalRow227TriangleData0113.coefficient7_40,
    output := OriginalRow227TriangleData0129.coefficient8_40, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root42, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_42, Icur := OriginalRow227TriangleData0113.coefficient7_41,
    output := OriginalRow227TriangleData0129.coefficient8_41, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_43, Icur := OriginalRow227TriangleData0113.coefficient7_42,
    output := OriginalRow227TriangleData0129.coefficient8_42, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_44, Icur := OriginalRow227TriangleData0113.coefficient7_43,
    output := OriginalRow227TriangleData0129.coefficient8_43, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_45, Icur := OriginalRow227TriangleData0113.coefficient7_44,
    output := OriginalRow227TriangleData0129.coefficient8_44, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_46, Icur := OriginalRow227TriangleData0113.coefficient7_45,
    output := OriginalRow227TriangleData0129.coefficient8_45, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_47, Icur := OriginalRow227TriangleData0113.coefficient7_46,
    output := OriginalRow227TriangleData0129.coefficient8_46, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_48, Icur := OriginalRow227TriangleData0113.coefficient7_47,
    output := OriginalRow227TriangleData0129.coefficient8_47, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_49, Icur := OriginalRow227TriangleData0113.coefficient7_48,
    output := OriginalRow227TriangleData0129.coefficient8_48, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_50, Icur := OriginalRow227TriangleData0113.coefficient7_49,
    output := OriginalRow227TriangleData0129.coefficient8_49, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_51, Icur := OriginalRow227TriangleData0113.coefficient7_50,
    output := OriginalRow227TriangleData0129.coefficient8_50, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_52, Icur := OriginalRow227TriangleData0113.coefficient7_51,
    output := OriginalRow227TriangleData0129.coefficient8_51, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_53, Icur := OriginalRow227TriangleData0113.coefficient7_52,
    output := OriginalRow227TriangleData0129.coefficient8_52, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_54, Icur := OriginalRow227TriangleData0113.coefficient7_53,
    output := OriginalRow227TriangleData0129.coefficient8_53, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_55, Icur := OriginalRow227TriangleData0113.coefficient7_54,
    output := OriginalRow227TriangleData0129.coefficient8_54, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_56, Icur := OriginalRow227TriangleData0113.coefficient7_55,
    output := OriginalRow227TriangleData0129.coefficient8_55, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_57, Icur := OriginalRow227TriangleData0113.coefficient7_56,
    output := OriginalRow227TriangleData0129.coefficient8_56, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_58, Icur := OriginalRow227TriangleData0113.coefficient7_57,
    output := OriginalRow227TriangleData0129.coefficient8_57, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_59, Icur := OriginalRow227TriangleData0113.coefficient7_58,
    output := OriginalRow227TriangleData0129.coefficient8_58, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_60, Icur := OriginalRow227TriangleData0113.coefficient7_59,
    output := OriginalRow227TriangleData0129.coefficient8_59, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_61, Icur := OriginalRow227TriangleData0113.coefficient7_60,
    output := OriginalRow227TriangleData0129.coefficient8_60, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_62, Icur := OriginalRow227TriangleData0113.coefficient7_61,
    output := OriginalRow227TriangleData0129.coefficient8_61, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_63, Icur := OriginalRow227TriangleData0113.coefficient7_62,
    output := OriginalRow227TriangleData0129.coefficient8_62, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_64, Icur := OriginalRow227TriangleData0113.coefficient7_63,
    output := OriginalRow227TriangleData0129.coefficient8_63, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_65, Icur := OriginalRow227TriangleData0113.coefficient7_64,
    output := OriginalRow227TriangleData0129.coefficient8_64, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_66, Icur := OriginalRow227TriangleData0113.coefficient7_65,
    output := OriginalRow227TriangleData0129.coefficient8_65, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_67, Icur := OriginalRow227TriangleData0113.coefficient7_66,
    output := OriginalRow227TriangleData0129.coefficient8_66, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_68, Icur := OriginalRow227TriangleData0113.coefficient7_67,
    output := OriginalRow227TriangleData0129.coefficient8_67, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0113.coefficient7_69, Icur := OriginalRow227TriangleData0113.coefficient7_68,
    output := OriginalRow227TriangleData0129.coefficient8_68, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_70, Icur := OriginalRow227TriangleData0113.coefficient7_69,
    output := OriginalRow227TriangleData0129.coefficient8_69, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0114.coefficient7_71, Icur := OriginalRow227TriangleData0114.coefficient7_70,
    output := OriginalRow227TriangleData0129.coefficient8_70, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0113

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0113.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
