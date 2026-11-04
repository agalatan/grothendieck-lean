import Grothe.UpperChaos.OriginalRow227TriangleData0735
import Grothe.UpperChaos.OriginalRow227TriangleData0736
import Grothe.UpperChaos.OriginalRow227TriangleData0748
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0732
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_83, Icur := OriginalRow227TriangleData0735.coefficient50_82,
    output := OriginalRow227TriangleData0748.coefficient51_82, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_84, Icur := OriginalRow227TriangleData0735.coefficient50_83,
    output := OriginalRow227TriangleData0748.coefficient51_83, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_85, Icur := OriginalRow227TriangleData0735.coefficient50_84,
    output := OriginalRow227TriangleData0748.coefficient51_84, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_86, Icur := OriginalRow227TriangleData0735.coefficient50_85,
    output := OriginalRow227TriangleData0748.coefficient51_85, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_87, Icur := OriginalRow227TriangleData0735.coefficient50_86,
    output := OriginalRow227TriangleData0748.coefficient51_86, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_88, Icur := OriginalRow227TriangleData0735.coefficient50_87,
    output := OriginalRow227TriangleData0748.coefficient51_87, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_89, Icur := OriginalRow227TriangleData0735.coefficient50_88,
    output := OriginalRow227TriangleData0748.coefficient51_88, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_90, Icur := OriginalRow227TriangleData0735.coefficient50_89,
    output := OriginalRow227TriangleData0748.coefficient51_89, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_91, Icur := OriginalRow227TriangleData0735.coefficient50_90,
    output := OriginalRow227TriangleData0748.coefficient51_90, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_92, Icur := OriginalRow227TriangleData0735.coefficient50_91,
    output := OriginalRow227TriangleData0748.coefficient51_91, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_93, Icur := OriginalRow227TriangleData0735.coefficient50_92,
    output := OriginalRow227TriangleData0748.coefficient51_92, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_94, Icur := OriginalRow227TriangleData0735.coefficient50_93,
    output := OriginalRow227TriangleData0748.coefficient51_93, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_95, Icur := OriginalRow227TriangleData0735.coefficient50_94,
    output := OriginalRow227TriangleData0748.coefficient51_94, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_96, Icur := OriginalRow227TriangleData0735.coefficient50_95,
    output := OriginalRow227TriangleData0748.coefficient51_95, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_97, Icur := OriginalRow227TriangleData0735.coefficient50_96,
    output := OriginalRow227TriangleData0748.coefficient51_96, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_98, Icur := OriginalRow227TriangleData0735.coefficient50_97,
    output := OriginalRow227TriangleData0748.coefficient51_97, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_99, Icur := OriginalRow227TriangleData0735.coefficient50_98,
    output := OriginalRow227TriangleData0748.coefficient51_98, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_100, Icur := OriginalRow227TriangleData0735.coefficient50_99,
    output := OriginalRow227TriangleData0748.coefficient51_99, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_101, Icur := OriginalRow227TriangleData0735.coefficient50_100,
    output := OriginalRow227TriangleData0748.coefficient51_100, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_102, Icur := OriginalRow227TriangleData0735.coefficient50_101,
    output := OriginalRow227TriangleData0748.coefficient51_101, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_103, Icur := OriginalRow227TriangleData0735.coefficient50_102,
    output := OriginalRow227TriangleData0748.coefficient51_102, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_104, Icur := OriginalRow227TriangleData0735.coefficient50_103,
    output := OriginalRow227TriangleData0748.coefficient51_103, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_105, Icur := OriginalRow227TriangleData0735.coefficient50_104,
    output := OriginalRow227TriangleData0748.coefficient51_104, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_106, Icur := OriginalRow227TriangleData0735.coefficient50_105,
    output := OriginalRow227TriangleData0748.coefficient51_105, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_107, Icur := OriginalRow227TriangleData0735.coefficient50_106,
    output := OriginalRow227TriangleData0748.coefficient51_106, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_108, Icur := OriginalRow227TriangleData0735.coefficient50_107,
    output := OriginalRow227TriangleData0748.coefficient51_107, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_109, Icur := OriginalRow227TriangleData0735.coefficient50_108,
    output := OriginalRow227TriangleData0748.coefficient51_108, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_110, Icur := OriginalRow227TriangleData0735.coefficient50_109,
    output := OriginalRow227TriangleData0748.coefficient51_109, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_111, Icur := OriginalRow227TriangleData0735.coefficient50_110,
    output := OriginalRow227TriangleData0748.coefficient51_110, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0735.coefficient50_112, Icur := OriginalRow227TriangleData0735.coefficient50_111,
    output := OriginalRow227TriangleData0748.coefficient51_111, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0736.coefficient50_113, Icur := OriginalRow227TriangleData0735.coefficient50_112,
    output := OriginalRow227TriangleData0748.coefficient51_112, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0736.coefficient50_114, Icur := OriginalRow227TriangleData0736.coefficient50_113,
    output := OriginalRow227TriangleData0748.coefficient51_113, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0732

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0732.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
