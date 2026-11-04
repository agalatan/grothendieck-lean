import Grothe.UpperChaos.OriginalRow227TriangleData0813
import Grothe.UpperChaos.OriginalRow227TriangleData0814
import Grothe.UpperChaos.OriginalRow227TriangleData0826
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0810
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_89, Icur := OriginalRow227TriangleData0813.coefficient56_88,
    output := OriginalRow227TriangleData0826.coefficient57_88, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_90, Icur := OriginalRow227TriangleData0813.coefficient56_89,
    output := OriginalRow227TriangleData0826.coefficient57_89, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_91, Icur := OriginalRow227TriangleData0813.coefficient56_90,
    output := OriginalRow227TriangleData0826.coefficient57_90, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_92, Icur := OriginalRow227TriangleData0813.coefficient56_91,
    output := OriginalRow227TriangleData0826.coefficient57_91, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_93, Icur := OriginalRow227TriangleData0813.coefficient56_92,
    output := OriginalRow227TriangleData0826.coefficient57_92, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_94, Icur := OriginalRow227TriangleData0813.coefficient56_93,
    output := OriginalRow227TriangleData0826.coefficient57_93, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_95, Icur := OriginalRow227TriangleData0813.coefficient56_94,
    output := OriginalRow227TriangleData0826.coefficient57_94, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_96, Icur := OriginalRow227TriangleData0813.coefficient56_95,
    output := OriginalRow227TriangleData0826.coefficient57_95, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_97, Icur := OriginalRow227TriangleData0813.coefficient56_96,
    output := OriginalRow227TriangleData0826.coefficient57_96, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_98, Icur := OriginalRow227TriangleData0813.coefficient56_97,
    output := OriginalRow227TriangleData0826.coefficient57_97, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_99, Icur := OriginalRow227TriangleData0813.coefficient56_98,
    output := OriginalRow227TriangleData0826.coefficient57_98, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_100, Icur := OriginalRow227TriangleData0813.coefficient56_99,
    output := OriginalRow227TriangleData0826.coefficient57_99, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_101, Icur := OriginalRow227TriangleData0813.coefficient56_100,
    output := OriginalRow227TriangleData0826.coefficient57_100, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_102, Icur := OriginalRow227TriangleData0813.coefficient56_101,
    output := OriginalRow227TriangleData0826.coefficient57_101, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_103, Icur := OriginalRow227TriangleData0813.coefficient56_102,
    output := OriginalRow227TriangleData0826.coefficient57_102, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_104, Icur := OriginalRow227TriangleData0813.coefficient56_103,
    output := OriginalRow227TriangleData0826.coefficient57_103, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_105, Icur := OriginalRow227TriangleData0813.coefficient56_104,
    output := OriginalRow227TriangleData0826.coefficient57_104, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_106, Icur := OriginalRow227TriangleData0813.coefficient56_105,
    output := OriginalRow227TriangleData0826.coefficient57_105, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_107, Icur := OriginalRow227TriangleData0813.coefficient56_106,
    output := OriginalRow227TriangleData0826.coefficient57_106, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_108, Icur := OriginalRow227TriangleData0813.coefficient56_107,
    output := OriginalRow227TriangleData0826.coefficient57_107, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_109, Icur := OriginalRow227TriangleData0813.coefficient56_108,
    output := OriginalRow227TriangleData0826.coefficient57_108, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_110, Icur := OriginalRow227TriangleData0813.coefficient56_109,
    output := OriginalRow227TriangleData0826.coefficient57_109, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_111, Icur := OriginalRow227TriangleData0813.coefficient56_110,
    output := OriginalRow227TriangleData0826.coefficient57_110, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_112, Icur := OriginalRow227TriangleData0813.coefficient56_111,
    output := OriginalRow227TriangleData0826.coefficient57_111, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_113, Icur := OriginalRow227TriangleData0813.coefficient56_112,
    output := OriginalRow227TriangleData0826.coefficient57_112, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_114, Icur := OriginalRow227TriangleData0813.coefficient56_113,
    output := OriginalRow227TriangleData0826.coefficient57_113, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_115, Icur := OriginalRow227TriangleData0813.coefficient56_114,
    output := OriginalRow227TriangleData0826.coefficient57_114, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_116, Icur := OriginalRow227TriangleData0813.coefficient56_115,
    output := OriginalRow227TriangleData0826.coefficient57_115, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_117, Icur := OriginalRow227TriangleData0813.coefficient56_116,
    output := OriginalRow227TriangleData0826.coefficient57_116, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0813.coefficient56_118, Icur := OriginalRow227TriangleData0813.coefficient56_117,
    output := OriginalRow227TriangleData0826.coefficient57_117, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_119, Icur := OriginalRow227TriangleData0813.coefficient56_118,
    output := OriginalRow227TriangleData0826.coefficient57_118, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root57,
    Inext := OriginalRow227TriangleData0814.coefficient56_120, Icur := OriginalRow227TriangleData0814.coefficient56_119,
    output := OriginalRow227TriangleData0826.coefficient57_119, hC := OriginalRow227TriangleRoots01.root57_pos, hAC := OriginalRow227TriangleRoots01.product57_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0810

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0810.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
