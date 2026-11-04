import Grothe.UpperChaos.OriginalRow227TriangleData1770
import Grothe.UpperChaos.OriginalRow227TriangleData1771
import Grothe.UpperChaos.OriginalRow227TriangleData1777
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1761
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_188, Icur := OriginalRow227TriangleData1770.coefficient155_187,
    output := OriginalRow227TriangleData1777.coefficient156_187, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_189, Icur := OriginalRow227TriangleData1770.coefficient155_188,
    output := OriginalRow227TriangleData1777.coefficient156_188, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_190, Icur := OriginalRow227TriangleData1770.coefficient155_189,
    output := OriginalRow227TriangleData1777.coefficient156_189, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_191, Icur := OriginalRow227TriangleData1770.coefficient155_190,
    output := OriginalRow227TriangleData1777.coefficient156_190, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_192, Icur := OriginalRow227TriangleData1770.coefficient155_191,
    output := OriginalRow227TriangleData1777.coefficient156_191, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_193, Icur := OriginalRow227TriangleData1770.coefficient155_192,
    output := OriginalRow227TriangleData1777.coefficient156_192, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_194, Icur := OriginalRow227TriangleData1770.coefficient155_193,
    output := OriginalRow227TriangleData1777.coefficient156_193, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_195, Icur := OriginalRow227TriangleData1770.coefficient155_194,
    output := OriginalRow227TriangleData1777.coefficient156_194, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_196, Icur := OriginalRow227TriangleData1770.coefficient155_195,
    output := OriginalRow227TriangleData1777.coefficient156_195, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_197, Icur := OriginalRow227TriangleData1770.coefficient155_196,
    output := OriginalRow227TriangleData1777.coefficient156_196, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_198, Icur := OriginalRow227TriangleData1770.coefficient155_197,
    output := OriginalRow227TriangleData1777.coefficient156_197, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_199, Icur := OriginalRow227TriangleData1770.coefficient155_198,
    output := OriginalRow227TriangleData1777.coefficient156_198, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_200, Icur := OriginalRow227TriangleData1770.coefficient155_199,
    output := OriginalRow227TriangleData1777.coefficient156_199, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_201, Icur := OriginalRow227TriangleData1770.coefficient155_200,
    output := OriginalRow227TriangleData1777.coefficient156_200, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_202, Icur := OriginalRow227TriangleData1770.coefficient155_201,
    output := OriginalRow227TriangleData1777.coefficient156_201, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_203, Icur := OriginalRow227TriangleData1770.coefficient155_202,
    output := OriginalRow227TriangleData1777.coefficient156_202, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_204, Icur := OriginalRow227TriangleData1770.coefficient155_203,
    output := OriginalRow227TriangleData1777.coefficient156_203, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_205, Icur := OriginalRow227TriangleData1770.coefficient155_204,
    output := OriginalRow227TriangleData1777.coefficient156_204, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_206, Icur := OriginalRow227TriangleData1770.coefficient155_205,
    output := OriginalRow227TriangleData1777.coefficient156_205, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_207, Icur := OriginalRow227TriangleData1770.coefficient155_206,
    output := OriginalRow227TriangleData1777.coefficient156_206, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_208, Icur := OriginalRow227TriangleData1770.coefficient155_207,
    output := OriginalRow227TriangleData1777.coefficient156_207, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_209, Icur := OriginalRow227TriangleData1770.coefficient155_208,
    output := OriginalRow227TriangleData1777.coefficient156_208, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_210, Icur := OriginalRow227TriangleData1770.coefficient155_209,
    output := OriginalRow227TriangleData1777.coefficient156_209, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_211, Icur := OriginalRow227TriangleData1770.coefficient155_210,
    output := OriginalRow227TriangleData1777.coefficient156_210, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root212, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_212, Icur := OriginalRow227TriangleData1770.coefficient155_211,
    output := OriginalRow227TriangleData1777.coefficient156_211, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root213, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_213, Icur := OriginalRow227TriangleData1770.coefficient155_212,
    output := OriginalRow227TriangleData1777.coefficient156_212, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root214, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_214, Icur := OriginalRow227TriangleData1770.coefficient155_213,
    output := OriginalRow227TriangleData1777.coefficient156_213, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root215, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_215, Icur := OriginalRow227TriangleData1770.coefficient155_214,
    output := OriginalRow227TriangleData1777.coefficient156_214, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root216, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_216, Icur := OriginalRow227TriangleData1770.coefficient155_215,
    output := OriginalRow227TriangleData1777.coefficient156_215, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root217, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1770.coefficient155_217, Icur := OriginalRow227TriangleData1770.coefficient155_216,
    output := OriginalRow227TriangleData1777.coefficient156_216, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root218, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_218, Icur := OriginalRow227TriangleData1770.coefficient155_217,
    output := OriginalRow227TriangleData1777.coefficient156_217, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root219, IC := OriginalRow227TriangleRoots04.root156,
    Inext := OriginalRow227TriangleData1771.coefficient155_219, Icur := OriginalRow227TriangleData1771.coefficient155_218,
    output := OriginalRow227TriangleData1777.coefficient156_218, hC := OriginalRow227TriangleRoots04.root156_pos, hAC := OriginalRow227TriangleRoots04.product156_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1761

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1761.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
