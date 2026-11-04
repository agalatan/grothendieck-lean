import Grothe.UpperChaos.OriginalRow227TriangleData1714
import Grothe.UpperChaos.OriginalRow227TriangleData1715
import Grothe.UpperChaos.OriginalRow227TriangleData1721
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1705
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_180, Icur := OriginalRow227TriangleData1714.coefficient147_179,
    output := OriginalRow227TriangleData1721.coefficient148_179, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_181, Icur := OriginalRow227TriangleData1714.coefficient147_180,
    output := OriginalRow227TriangleData1721.coefficient148_180, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_182, Icur := OriginalRow227TriangleData1714.coefficient147_181,
    output := OriginalRow227TriangleData1721.coefficient148_181, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_183, Icur := OriginalRow227TriangleData1714.coefficient147_182,
    output := OriginalRow227TriangleData1721.coefficient148_182, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_184, Icur := OriginalRow227TriangleData1714.coefficient147_183,
    output := OriginalRow227TriangleData1721.coefficient148_183, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_185, Icur := OriginalRow227TriangleData1714.coefficient147_184,
    output := OriginalRow227TriangleData1721.coefficient148_184, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_186, Icur := OriginalRow227TriangleData1714.coefficient147_185,
    output := OriginalRow227TriangleData1721.coefficient148_185, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_187, Icur := OriginalRow227TriangleData1714.coefficient147_186,
    output := OriginalRow227TriangleData1721.coefficient148_186, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_188, Icur := OriginalRow227TriangleData1714.coefficient147_187,
    output := OriginalRow227TriangleData1721.coefficient148_187, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_189, Icur := OriginalRow227TriangleData1714.coefficient147_188,
    output := OriginalRow227TriangleData1721.coefficient148_188, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_190, Icur := OriginalRow227TriangleData1714.coefficient147_189,
    output := OriginalRow227TriangleData1721.coefficient148_189, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_191, Icur := OriginalRow227TriangleData1714.coefficient147_190,
    output := OriginalRow227TriangleData1721.coefficient148_190, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_192, Icur := OriginalRow227TriangleData1714.coefficient147_191,
    output := OriginalRow227TriangleData1721.coefficient148_191, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_193, Icur := OriginalRow227TriangleData1714.coefficient147_192,
    output := OriginalRow227TriangleData1721.coefficient148_192, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_194, Icur := OriginalRow227TriangleData1714.coefficient147_193,
    output := OriginalRow227TriangleData1721.coefficient148_193, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_195, Icur := OriginalRow227TriangleData1714.coefficient147_194,
    output := OriginalRow227TriangleData1721.coefficient148_194, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_196, Icur := OriginalRow227TriangleData1714.coefficient147_195,
    output := OriginalRow227TriangleData1721.coefficient148_195, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_197, Icur := OriginalRow227TriangleData1714.coefficient147_196,
    output := OriginalRow227TriangleData1721.coefficient148_196, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_198, Icur := OriginalRow227TriangleData1714.coefficient147_197,
    output := OriginalRow227TriangleData1721.coefficient148_197, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_199, Icur := OriginalRow227TriangleData1714.coefficient147_198,
    output := OriginalRow227TriangleData1721.coefficient148_198, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_200, Icur := OriginalRow227TriangleData1714.coefficient147_199,
    output := OriginalRow227TriangleData1721.coefficient148_199, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_201, Icur := OriginalRow227TriangleData1714.coefficient147_200,
    output := OriginalRow227TriangleData1721.coefficient148_200, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_202, Icur := OriginalRow227TriangleData1714.coefficient147_201,
    output := OriginalRow227TriangleData1721.coefficient148_201, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_203, Icur := OriginalRow227TriangleData1714.coefficient147_202,
    output := OriginalRow227TriangleData1721.coefficient148_202, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_204, Icur := OriginalRow227TriangleData1714.coefficient147_203,
    output := OriginalRow227TriangleData1721.coefficient148_203, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root205, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_205, Icur := OriginalRow227TriangleData1714.coefficient147_204,
    output := OriginalRow227TriangleData1721.coefficient148_204, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root206, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_206, Icur := OriginalRow227TriangleData1714.coefficient147_205,
    output := OriginalRow227TriangleData1721.coefficient148_205, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root207, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_207, Icur := OriginalRow227TriangleData1714.coefficient147_206,
    output := OriginalRow227TriangleData1721.coefficient148_206, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root208, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_208, Icur := OriginalRow227TriangleData1714.coefficient147_207,
    output := OriginalRow227TriangleData1721.coefficient148_207, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root209, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1714.coefficient147_209, Icur := OriginalRow227TriangleData1714.coefficient147_208,
    output := OriginalRow227TriangleData1721.coefficient148_208, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root210, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_210, Icur := OriginalRow227TriangleData1714.coefficient147_209,
    output := OriginalRow227TriangleData1721.coefficient148_209, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root211, IC := OriginalRow227TriangleRoots04.root148,
    Inext := OriginalRow227TriangleData1715.coefficient147_211, Icur := OriginalRow227TriangleData1715.coefficient147_210,
    output := OriginalRow227TriangleData1721.coefficient148_210, hC := OriginalRow227TriangleRoots04.root148_pos, hAC := OriginalRow227TriangleRoots04.product148_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1705

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1705.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
