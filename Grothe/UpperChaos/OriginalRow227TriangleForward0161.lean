import Grothe.UpperChaos.OriginalRow227TriangleData0161
import Grothe.UpperChaos.OriginalRow227TriangleData0162
import Grothe.UpperChaos.OriginalRow227TriangleData0177
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0161
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots01.root43, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_43, Icur := OriginalRow227TriangleData0161.coefficient10_42,
    output := OriginalRow227TriangleData0177.coefficient11_42, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots01.root44, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_44, Icur := OriginalRow227TriangleData0161.coefficient10_43,
    output := OriginalRow227TriangleData0177.coefficient11_43, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots01.root45, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_45, Icur := OriginalRow227TriangleData0161.coefficient10_44,
    output := OriginalRow227TriangleData0177.coefficient11_44, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots01.root46, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_46, Icur := OriginalRow227TriangleData0161.coefficient10_45,
    output := OriginalRow227TriangleData0177.coefficient11_45, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots01.root47, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_47, Icur := OriginalRow227TriangleData0161.coefficient10_46,
    output := OriginalRow227TriangleData0177.coefficient11_46, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots01.root48, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_48, Icur := OriginalRow227TriangleData0161.coefficient10_47,
    output := OriginalRow227TriangleData0177.coefficient11_47, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots01.root49, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_49, Icur := OriginalRow227TriangleData0161.coefficient10_48,
    output := OriginalRow227TriangleData0177.coefficient11_48, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots01.root50, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_50, Icur := OriginalRow227TriangleData0161.coefficient10_49,
    output := OriginalRow227TriangleData0177.coefficient11_49, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots01.root51, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_51, Icur := OriginalRow227TriangleData0161.coefficient10_50,
    output := OriginalRow227TriangleData0177.coefficient11_50, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots01.root52, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_52, Icur := OriginalRow227TriangleData0161.coefficient10_51,
    output := OriginalRow227TriangleData0177.coefficient11_51, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots01.root53, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_53, Icur := OriginalRow227TriangleData0161.coefficient10_52,
    output := OriginalRow227TriangleData0177.coefficient11_52, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots01.root54, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_54, Icur := OriginalRow227TriangleData0161.coefficient10_53,
    output := OriginalRow227TriangleData0177.coefficient11_53, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots01.root55, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_55, Icur := OriginalRow227TriangleData0161.coefficient10_54,
    output := OriginalRow227TriangleData0177.coefficient11_54, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots01.root56, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_56, Icur := OriginalRow227TriangleData0161.coefficient10_55,
    output := OriginalRow227TriangleData0177.coefficient11_55, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots01.root57, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_57, Icur := OriginalRow227TriangleData0161.coefficient10_56,
    output := OriginalRow227TriangleData0177.coefficient11_56, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_58, Icur := OriginalRow227TriangleData0161.coefficient10_57,
    output := OriginalRow227TriangleData0177.coefficient11_57, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_59, Icur := OriginalRow227TriangleData0161.coefficient10_58,
    output := OriginalRow227TriangleData0177.coefficient11_58, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_60, Icur := OriginalRow227TriangleData0161.coefficient10_59,
    output := OriginalRow227TriangleData0177.coefficient11_59, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_61, Icur := OriginalRow227TriangleData0161.coefficient10_60,
    output := OriginalRow227TriangleData0177.coefficient11_60, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_62, Icur := OriginalRow227TriangleData0161.coefficient10_61,
    output := OriginalRow227TriangleData0177.coefficient11_61, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_63, Icur := OriginalRow227TriangleData0161.coefficient10_62,
    output := OriginalRow227TriangleData0177.coefficient11_62, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_64, Icur := OriginalRow227TriangleData0161.coefficient10_63,
    output := OriginalRow227TriangleData0177.coefficient11_63, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_65, Icur := OriginalRow227TriangleData0161.coefficient10_64,
    output := OriginalRow227TriangleData0177.coefficient11_64, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_66, Icur := OriginalRow227TriangleData0161.coefficient10_65,
    output := OriginalRow227TriangleData0177.coefficient11_65, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_67, Icur := OriginalRow227TriangleData0161.coefficient10_66,
    output := OriginalRow227TriangleData0177.coefficient11_66, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_68, Icur := OriginalRow227TriangleData0161.coefficient10_67,
    output := OriginalRow227TriangleData0177.coefficient11_67, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_69, Icur := OriginalRow227TriangleData0161.coefficient10_68,
    output := OriginalRow227TriangleData0177.coefficient11_68, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_70, Icur := OriginalRow227TriangleData0161.coefficient10_69,
    output := OriginalRow227TriangleData0177.coefficient11_69, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_71, Icur := OriginalRow227TriangleData0161.coefficient10_70,
    output := OriginalRow227TriangleData0177.coefficient11_70, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0161.coefficient10_72, Icur := OriginalRow227TriangleData0161.coefficient10_71,
    output := OriginalRow227TriangleData0177.coefficient11_71, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0162.coefficient10_73, Icur := OriginalRow227TriangleData0161.coefficient10_72,
    output := OriginalRow227TriangleData0177.coefficient11_72, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots00.root11,
    Inext := OriginalRow227TriangleData0162.coefficient10_74, Icur := OriginalRow227TriangleData0162.coefficient10_73,
    output := OriginalRow227TriangleData0177.coefficient11_73, hC := OriginalRow227TriangleRoots00.root11_pos, hAC := OriginalRow227TriangleRoots00.product11_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0161

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0161.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
