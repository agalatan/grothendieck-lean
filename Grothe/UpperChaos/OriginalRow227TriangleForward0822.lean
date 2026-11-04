import Grothe.UpperChaos.OriginalRow227TriangleData0825
import Grothe.UpperChaos.OriginalRow227TriangleData0826
import Grothe.UpperChaos.OriginalRow227TriangleData0838
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0822
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots01.root58, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_58, Icur := OriginalRow227TriangleData0825.coefficient57_57,
    output := OriginalRow227TriangleData0838.coefficient58_57, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots01.root59, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_59, Icur := OriginalRow227TriangleData0825.coefficient57_58,
    output := OriginalRow227TriangleData0838.coefficient58_58, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots01.root60, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_60, Icur := OriginalRow227TriangleData0825.coefficient57_59,
    output := OriginalRow227TriangleData0838.coefficient58_59, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots01.root61, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_61, Icur := OriginalRow227TriangleData0825.coefficient57_60,
    output := OriginalRow227TriangleData0838.coefficient58_60, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots01.root62, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_62, Icur := OriginalRow227TriangleData0825.coefficient57_61,
    output := OriginalRow227TriangleData0838.coefficient58_61, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots01.root63, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_63, Icur := OriginalRow227TriangleData0825.coefficient57_62,
    output := OriginalRow227TriangleData0838.coefficient58_62, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots01.root64, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_64, Icur := OriginalRow227TriangleData0825.coefficient57_63,
    output := OriginalRow227TriangleData0838.coefficient58_63, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root65, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_65, Icur := OriginalRow227TriangleData0825.coefficient57_64,
    output := OriginalRow227TriangleData0838.coefficient58_64, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root66, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_66, Icur := OriginalRow227TriangleData0825.coefficient57_65,
    output := OriginalRow227TriangleData0838.coefficient58_65, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root67, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_67, Icur := OriginalRow227TriangleData0825.coefficient57_66,
    output := OriginalRow227TriangleData0838.coefficient58_66, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_68, Icur := OriginalRow227TriangleData0825.coefficient57_67,
    output := OriginalRow227TriangleData0838.coefficient58_67, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_69, Icur := OriginalRow227TriangleData0825.coefficient57_68,
    output := OriginalRow227TriangleData0838.coefficient58_68, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_70, Icur := OriginalRow227TriangleData0825.coefficient57_69,
    output := OriginalRow227TriangleData0838.coefficient58_69, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_71, Icur := OriginalRow227TriangleData0825.coefficient57_70,
    output := OriginalRow227TriangleData0838.coefficient58_70, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_72, Icur := OriginalRow227TriangleData0825.coefficient57_71,
    output := OriginalRow227TriangleData0838.coefficient58_71, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_73, Icur := OriginalRow227TriangleData0825.coefficient57_72,
    output := OriginalRow227TriangleData0838.coefficient58_72, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_74, Icur := OriginalRow227TriangleData0825.coefficient57_73,
    output := OriginalRow227TriangleData0838.coefficient58_73, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_75, Icur := OriginalRow227TriangleData0825.coefficient57_74,
    output := OriginalRow227TriangleData0838.coefficient58_74, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_76, Icur := OriginalRow227TriangleData0825.coefficient57_75,
    output := OriginalRow227TriangleData0838.coefficient58_75, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_77, Icur := OriginalRow227TriangleData0825.coefficient57_76,
    output := OriginalRow227TriangleData0838.coefficient58_76, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_78, Icur := OriginalRow227TriangleData0825.coefficient57_77,
    output := OriginalRow227TriangleData0838.coefficient58_77, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_79, Icur := OriginalRow227TriangleData0825.coefficient57_78,
    output := OriginalRow227TriangleData0838.coefficient58_78, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_80, Icur := OriginalRow227TriangleData0825.coefficient57_79,
    output := OriginalRow227TriangleData0838.coefficient58_79, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_81, Icur := OriginalRow227TriangleData0825.coefficient57_80,
    output := OriginalRow227TriangleData0838.coefficient58_80, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_82, Icur := OriginalRow227TriangleData0825.coefficient57_81,
    output := OriginalRow227TriangleData0838.coefficient58_81, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_83, Icur := OriginalRow227TriangleData0825.coefficient57_82,
    output := OriginalRow227TriangleData0838.coefficient58_82, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_84, Icur := OriginalRow227TriangleData0825.coefficient57_83,
    output := OriginalRow227TriangleData0838.coefficient58_83, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_85, Icur := OriginalRow227TriangleData0825.coefficient57_84,
    output := OriginalRow227TriangleData0838.coefficient58_84, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_86, Icur := OriginalRow227TriangleData0825.coefficient57_85,
    output := OriginalRow227TriangleData0838.coefficient58_85, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0825.coefficient57_87, Icur := OriginalRow227TriangleData0825.coefficient57_86,
    output := OriginalRow227TriangleData0838.coefficient58_86, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_88, Icur := OriginalRow227TriangleData0825.coefficient57_87,
    output := OriginalRow227TriangleData0838.coefficient58_87, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_89, Icur := OriginalRow227TriangleData0826.coefficient57_88,
    output := OriginalRow227TriangleData0838.coefficient58_88, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0822

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0822.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
