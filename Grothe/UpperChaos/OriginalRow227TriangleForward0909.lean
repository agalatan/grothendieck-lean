import Grothe.UpperChaos.OriginalRow227TriangleData0913
import Grothe.UpperChaos.OriginalRow227TriangleData0914
import Grothe.UpperChaos.OriginalRow227TriangleData0925
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0909
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_97, Icur := OriginalRow227TriangleData0913.coefficient64_96,
    output := OriginalRow227TriangleData0925.coefficient65_96, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_98, Icur := OriginalRow227TriangleData0913.coefficient64_97,
    output := OriginalRow227TriangleData0925.coefficient65_97, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_99, Icur := OriginalRow227TriangleData0913.coefficient64_98,
    output := OriginalRow227TriangleData0925.coefficient65_98, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_100, Icur := OriginalRow227TriangleData0913.coefficient64_99,
    output := OriginalRow227TriangleData0925.coefficient65_99, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_101, Icur := OriginalRow227TriangleData0913.coefficient64_100,
    output := OriginalRow227TriangleData0925.coefficient65_100, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_102, Icur := OriginalRow227TriangleData0913.coefficient64_101,
    output := OriginalRow227TriangleData0925.coefficient65_101, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_103, Icur := OriginalRow227TriangleData0913.coefficient64_102,
    output := OriginalRow227TriangleData0925.coefficient65_102, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_104, Icur := OriginalRow227TriangleData0913.coefficient64_103,
    output := OriginalRow227TriangleData0925.coefficient65_103, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_105, Icur := OriginalRow227TriangleData0913.coefficient64_104,
    output := OriginalRow227TriangleData0925.coefficient65_104, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_106, Icur := OriginalRow227TriangleData0913.coefficient64_105,
    output := OriginalRow227TriangleData0925.coefficient65_105, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_107, Icur := OriginalRow227TriangleData0913.coefficient64_106,
    output := OriginalRow227TriangleData0925.coefficient65_106, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_108, Icur := OriginalRow227TriangleData0913.coefficient64_107,
    output := OriginalRow227TriangleData0925.coefficient65_107, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_109, Icur := OriginalRow227TriangleData0913.coefficient64_108,
    output := OriginalRow227TriangleData0925.coefficient65_108, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_110, Icur := OriginalRow227TriangleData0913.coefficient64_109,
    output := OriginalRow227TriangleData0925.coefficient65_109, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_111, Icur := OriginalRow227TriangleData0913.coefficient64_110,
    output := OriginalRow227TriangleData0925.coefficient65_110, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_112, Icur := OriginalRow227TriangleData0913.coefficient64_111,
    output := OriginalRow227TriangleData0925.coefficient65_111, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_113, Icur := OriginalRow227TriangleData0913.coefficient64_112,
    output := OriginalRow227TriangleData0925.coefficient65_112, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_114, Icur := OriginalRow227TriangleData0913.coefficient64_113,
    output := OriginalRow227TriangleData0925.coefficient65_113, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_115, Icur := OriginalRow227TriangleData0913.coefficient64_114,
    output := OriginalRow227TriangleData0925.coefficient65_114, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_116, Icur := OriginalRow227TriangleData0913.coefficient64_115,
    output := OriginalRow227TriangleData0925.coefficient65_115, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_117, Icur := OriginalRow227TriangleData0913.coefficient64_116,
    output := OriginalRow227TriangleData0925.coefficient65_116, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_118, Icur := OriginalRow227TriangleData0913.coefficient64_117,
    output := OriginalRow227TriangleData0925.coefficient65_117, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_119, Icur := OriginalRow227TriangleData0913.coefficient64_118,
    output := OriginalRow227TriangleData0925.coefficient65_118, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_120, Icur := OriginalRow227TriangleData0913.coefficient64_119,
    output := OriginalRow227TriangleData0925.coefficient65_119, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_121, Icur := OriginalRow227TriangleData0913.coefficient64_120,
    output := OriginalRow227TriangleData0925.coefficient65_120, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_122, Icur := OriginalRow227TriangleData0913.coefficient64_121,
    output := OriginalRow227TriangleData0925.coefficient65_121, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_123, Icur := OriginalRow227TriangleData0913.coefficient64_122,
    output := OriginalRow227TriangleData0925.coefficient65_122, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_124, Icur := OriginalRow227TriangleData0913.coefficient64_123,
    output := OriginalRow227TriangleData0925.coefficient65_123, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_125, Icur := OriginalRow227TriangleData0913.coefficient64_124,
    output := OriginalRow227TriangleData0925.coefficient65_124, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0913.coefficient64_126, Icur := OriginalRow227TriangleData0913.coefficient64_125,
    output := OriginalRow227TriangleData0925.coefficient65_125, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0914.coefficient64_127, Icur := OriginalRow227TriangleData0913.coefficient64_126,
    output := OriginalRow227TriangleData0925.coefficient65_126, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root128, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0914.coefficient64_128, Icur := OriginalRow227TriangleData0914.coefficient64_127,
    output := OriginalRow227TriangleData0925.coefficient65_127, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0909

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0909.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
