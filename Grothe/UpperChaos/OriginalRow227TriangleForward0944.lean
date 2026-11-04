import Grothe.UpperChaos.OriginalRow227TriangleData0948
import Grothe.UpperChaos.OriginalRow227TriangleData0949
import Grothe.UpperChaos.OriginalRow227TriangleData0960
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0944
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root68, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_68, Icur := OriginalRow227TriangleData0948.coefficient67_67,
    output := OriginalRow227TriangleData0960.coefficient68_67, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root69, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_69, Icur := OriginalRow227TriangleData0948.coefficient67_68,
    output := OriginalRow227TriangleData0960.coefficient68_68, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root70, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_70, Icur := OriginalRow227TriangleData0948.coefficient67_69,
    output := OriginalRow227TriangleData0960.coefficient68_69, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root71, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_71, Icur := OriginalRow227TriangleData0948.coefficient67_70,
    output := OriginalRow227TriangleData0960.coefficient68_70, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root72, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_72, Icur := OriginalRow227TriangleData0948.coefficient67_71,
    output := OriginalRow227TriangleData0960.coefficient68_71, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root73, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_73, Icur := OriginalRow227TriangleData0948.coefficient67_72,
    output := OriginalRow227TriangleData0960.coefficient68_72, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_74, Icur := OriginalRow227TriangleData0948.coefficient67_73,
    output := OriginalRow227TriangleData0960.coefficient68_73, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_75, Icur := OriginalRow227TriangleData0948.coefficient67_74,
    output := OriginalRow227TriangleData0960.coefficient68_74, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_76, Icur := OriginalRow227TriangleData0948.coefficient67_75,
    output := OriginalRow227TriangleData0960.coefficient68_75, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_77, Icur := OriginalRow227TriangleData0948.coefficient67_76,
    output := OriginalRow227TriangleData0960.coefficient68_76, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_78, Icur := OriginalRow227TriangleData0948.coefficient67_77,
    output := OriginalRow227TriangleData0960.coefficient68_77, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_79, Icur := OriginalRow227TriangleData0948.coefficient67_78,
    output := OriginalRow227TriangleData0960.coefficient68_78, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_80, Icur := OriginalRow227TriangleData0948.coefficient67_79,
    output := OriginalRow227TriangleData0960.coefficient68_79, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_81, Icur := OriginalRow227TriangleData0948.coefficient67_80,
    output := OriginalRow227TriangleData0960.coefficient68_80, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_82, Icur := OriginalRow227TriangleData0948.coefficient67_81,
    output := OriginalRow227TriangleData0960.coefficient68_81, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_83, Icur := OriginalRow227TriangleData0948.coefficient67_82,
    output := OriginalRow227TriangleData0960.coefficient68_82, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_84, Icur := OriginalRow227TriangleData0948.coefficient67_83,
    output := OriginalRow227TriangleData0960.coefficient68_83, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_85, Icur := OriginalRow227TriangleData0948.coefficient67_84,
    output := OriginalRow227TriangleData0960.coefficient68_84, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_86, Icur := OriginalRow227TriangleData0948.coefficient67_85,
    output := OriginalRow227TriangleData0960.coefficient68_85, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_87, Icur := OriginalRow227TriangleData0948.coefficient67_86,
    output := OriginalRow227TriangleData0960.coefficient68_86, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_88, Icur := OriginalRow227TriangleData0948.coefficient67_87,
    output := OriginalRow227TriangleData0960.coefficient68_87, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_89, Icur := OriginalRow227TriangleData0948.coefficient67_88,
    output := OriginalRow227TriangleData0960.coefficient68_88, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_90, Icur := OriginalRow227TriangleData0948.coefficient67_89,
    output := OriginalRow227TriangleData0960.coefficient68_89, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_91, Icur := OriginalRow227TriangleData0948.coefficient67_90,
    output := OriginalRow227TriangleData0960.coefficient68_90, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_92, Icur := OriginalRow227TriangleData0948.coefficient67_91,
    output := OriginalRow227TriangleData0960.coefficient68_91, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_93, Icur := OriginalRow227TriangleData0948.coefficient67_92,
    output := OriginalRow227TriangleData0960.coefficient68_92, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_94, Icur := OriginalRow227TriangleData0948.coefficient67_93,
    output := OriginalRow227TriangleData0960.coefficient68_93, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_95, Icur := OriginalRow227TriangleData0948.coefficient67_94,
    output := OriginalRow227TriangleData0960.coefficient68_94, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_96, Icur := OriginalRow227TriangleData0948.coefficient67_95,
    output := OriginalRow227TriangleData0960.coefficient68_95, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0948.coefficient67_97, Icur := OriginalRow227TriangleData0948.coefficient67_96,
    output := OriginalRow227TriangleData0960.coefficient68_96, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_98, Icur := OriginalRow227TriangleData0948.coefficient67_97,
    output := OriginalRow227TriangleData0960.coefficient68_97, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root68,
    Inext := OriginalRow227TriangleData0949.coefficient67_99, Icur := OriginalRow227TriangleData0949.coefficient67_98,
    output := OriginalRow227TriangleData0960.coefficient68_98, hC := OriginalRow227TriangleRoots02.root68_pos, hAC := OriginalRow227TriangleRoots02.product68_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0944

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0944.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
