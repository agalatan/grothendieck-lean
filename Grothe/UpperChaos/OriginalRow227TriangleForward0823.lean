import Grothe.UpperChaos.OriginalRow227TriangleData0826
import Grothe.UpperChaos.OriginalRow227TriangleData0827
import Grothe.UpperChaos.OriginalRow227TriangleData0839
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0823
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_90, Icur := OriginalRow227TriangleData0826.coefficient57_89,
    output := OriginalRow227TriangleData0839.coefficient58_89, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_91, Icur := OriginalRow227TriangleData0826.coefficient57_90,
    output := OriginalRow227TriangleData0839.coefficient58_90, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_92, Icur := OriginalRow227TriangleData0826.coefficient57_91,
    output := OriginalRow227TriangleData0839.coefficient58_91, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_93, Icur := OriginalRow227TriangleData0826.coefficient57_92,
    output := OriginalRow227TriangleData0839.coefficient58_92, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_94, Icur := OriginalRow227TriangleData0826.coefficient57_93,
    output := OriginalRow227TriangleData0839.coefficient58_93, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_95, Icur := OriginalRow227TriangleData0826.coefficient57_94,
    output := OriginalRow227TriangleData0839.coefficient58_94, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_96, Icur := OriginalRow227TriangleData0826.coefficient57_95,
    output := OriginalRow227TriangleData0839.coefficient58_95, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_97, Icur := OriginalRow227TriangleData0826.coefficient57_96,
    output := OriginalRow227TriangleData0839.coefficient58_96, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_98, Icur := OriginalRow227TriangleData0826.coefficient57_97,
    output := OriginalRow227TriangleData0839.coefficient58_97, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_99, Icur := OriginalRow227TriangleData0826.coefficient57_98,
    output := OriginalRow227TriangleData0839.coefficient58_98, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_100, Icur := OriginalRow227TriangleData0826.coefficient57_99,
    output := OriginalRow227TriangleData0839.coefficient58_99, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_101, Icur := OriginalRow227TriangleData0826.coefficient57_100,
    output := OriginalRow227TriangleData0839.coefficient58_100, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_102, Icur := OriginalRow227TriangleData0826.coefficient57_101,
    output := OriginalRow227TriangleData0839.coefficient58_101, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_103, Icur := OriginalRow227TriangleData0826.coefficient57_102,
    output := OriginalRow227TriangleData0839.coefficient58_102, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_104, Icur := OriginalRow227TriangleData0826.coefficient57_103,
    output := OriginalRow227TriangleData0839.coefficient58_103, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_105, Icur := OriginalRow227TriangleData0826.coefficient57_104,
    output := OriginalRow227TriangleData0839.coefficient58_104, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_106, Icur := OriginalRow227TriangleData0826.coefficient57_105,
    output := OriginalRow227TriangleData0839.coefficient58_105, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_107, Icur := OriginalRow227TriangleData0826.coefficient57_106,
    output := OriginalRow227TriangleData0839.coefficient58_106, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_108, Icur := OriginalRow227TriangleData0826.coefficient57_107,
    output := OriginalRow227TriangleData0839.coefficient58_107, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_109, Icur := OriginalRow227TriangleData0826.coefficient57_108,
    output := OriginalRow227TriangleData0839.coefficient58_108, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_110, Icur := OriginalRow227TriangleData0826.coefficient57_109,
    output := OriginalRow227TriangleData0839.coefficient58_109, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_111, Icur := OriginalRow227TriangleData0826.coefficient57_110,
    output := OriginalRow227TriangleData0839.coefficient58_110, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_112, Icur := OriginalRow227TriangleData0826.coefficient57_111,
    output := OriginalRow227TriangleData0839.coefficient58_111, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_113, Icur := OriginalRow227TriangleData0826.coefficient57_112,
    output := OriginalRow227TriangleData0839.coefficient58_112, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_114, Icur := OriginalRow227TriangleData0826.coefficient57_113,
    output := OriginalRow227TriangleData0839.coefficient58_113, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_115, Icur := OriginalRow227TriangleData0826.coefficient57_114,
    output := OriginalRow227TriangleData0839.coefficient58_114, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_116, Icur := OriginalRow227TriangleData0826.coefficient57_115,
    output := OriginalRow227TriangleData0839.coefficient58_115, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_117, Icur := OriginalRow227TriangleData0826.coefficient57_116,
    output := OriginalRow227TriangleData0839.coefficient58_116, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_118, Icur := OriginalRow227TriangleData0826.coefficient57_117,
    output := OriginalRow227TriangleData0839.coefficient58_117, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0826.coefficient57_119, Icur := OriginalRow227TriangleData0826.coefficient57_118,
    output := OriginalRow227TriangleData0839.coefficient58_118, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_120, Icur := OriginalRow227TriangleData0826.coefficient57_119,
    output := OriginalRow227TriangleData0839.coefficient58_119, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root58,
    Inext := OriginalRow227TriangleData0827.coefficient57_121, Icur := OriginalRow227TriangleData0827.coefficient57_120,
    output := OriginalRow227TriangleData0839.coefficient58_120, hC := OriginalRow227TriangleRoots01.root58_pos, hAC := OriginalRow227TriangleRoots01.product58_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0823

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0823.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
