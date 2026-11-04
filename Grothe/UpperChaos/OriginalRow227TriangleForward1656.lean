import Grothe.UpperChaos.OriginalRow227TriangleData1665
import Grothe.UpperChaos.OriginalRow227TriangleData1666
import Grothe.UpperChaos.OriginalRow227TriangleData1672
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1656
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_173, Icur := OriginalRow227TriangleData1665.coefficient140_172,
    output := OriginalRow227TriangleData1672.coefficient141_172, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_174, Icur := OriginalRow227TriangleData1665.coefficient140_173,
    output := OriginalRow227TriangleData1672.coefficient141_173, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_175, Icur := OriginalRow227TriangleData1665.coefficient140_174,
    output := OriginalRow227TriangleData1672.coefficient141_174, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_176, Icur := OriginalRow227TriangleData1665.coefficient140_175,
    output := OriginalRow227TriangleData1672.coefficient141_175, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_177, Icur := OriginalRow227TriangleData1665.coefficient140_176,
    output := OriginalRow227TriangleData1672.coefficient141_176, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_178, Icur := OriginalRow227TriangleData1665.coefficient140_177,
    output := OriginalRow227TriangleData1672.coefficient141_177, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_179, Icur := OriginalRow227TriangleData1665.coefficient140_178,
    output := OriginalRow227TriangleData1672.coefficient141_178, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_180, Icur := OriginalRow227TriangleData1665.coefficient140_179,
    output := OriginalRow227TriangleData1672.coefficient141_179, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_181, Icur := OriginalRow227TriangleData1665.coefficient140_180,
    output := OriginalRow227TriangleData1672.coefficient141_180, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_182, Icur := OriginalRow227TriangleData1665.coefficient140_181,
    output := OriginalRow227TriangleData1672.coefficient141_181, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_183, Icur := OriginalRow227TriangleData1665.coefficient140_182,
    output := OriginalRow227TriangleData1672.coefficient141_182, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_184, Icur := OriginalRow227TriangleData1665.coefficient140_183,
    output := OriginalRow227TriangleData1672.coefficient141_183, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_185, Icur := OriginalRow227TriangleData1665.coefficient140_184,
    output := OriginalRow227TriangleData1672.coefficient141_184, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_186, Icur := OriginalRow227TriangleData1665.coefficient140_185,
    output := OriginalRow227TriangleData1672.coefficient141_185, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_187, Icur := OriginalRow227TriangleData1665.coefficient140_186,
    output := OriginalRow227TriangleData1672.coefficient141_186, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_188, Icur := OriginalRow227TriangleData1665.coefficient140_187,
    output := OriginalRow227TriangleData1672.coefficient141_187, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_189, Icur := OriginalRow227TriangleData1665.coefficient140_188,
    output := OriginalRow227TriangleData1672.coefficient141_188, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_190, Icur := OriginalRow227TriangleData1665.coefficient140_189,
    output := OriginalRow227TriangleData1672.coefficient141_189, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_191, Icur := OriginalRow227TriangleData1665.coefficient140_190,
    output := OriginalRow227TriangleData1672.coefficient141_190, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_192, Icur := OriginalRow227TriangleData1665.coefficient140_191,
    output := OriginalRow227TriangleData1672.coefficient141_191, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_193, Icur := OriginalRow227TriangleData1665.coefficient140_192,
    output := OriginalRow227TriangleData1672.coefficient141_192, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_194, Icur := OriginalRow227TriangleData1665.coefficient140_193,
    output := OriginalRow227TriangleData1672.coefficient141_193, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_195, Icur := OriginalRow227TriangleData1665.coefficient140_194,
    output := OriginalRow227TriangleData1672.coefficient141_194, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_196, Icur := OriginalRow227TriangleData1665.coefficient140_195,
    output := OriginalRow227TriangleData1672.coefficient141_195, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_197, Icur := OriginalRow227TriangleData1665.coefficient140_196,
    output := OriginalRow227TriangleData1672.coefficient141_196, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_198, Icur := OriginalRow227TriangleData1665.coefficient140_197,
    output := OriginalRow227TriangleData1672.coefficient141_197, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_199, Icur := OriginalRow227TriangleData1665.coefficient140_198,
    output := OriginalRow227TriangleData1672.coefficient141_198, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_200, Icur := OriginalRow227TriangleData1665.coefficient140_199,
    output := OriginalRow227TriangleData1672.coefficient141_199, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_201, Icur := OriginalRow227TriangleData1665.coefficient140_200,
    output := OriginalRow227TriangleData1672.coefficient141_200, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1665.coefficient140_202, Icur := OriginalRow227TriangleData1665.coefficient140_201,
    output := OriginalRow227TriangleData1672.coefficient141_201, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root203, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_203, Icur := OriginalRow227TriangleData1665.coefficient140_202,
    output := OriginalRow227TriangleData1672.coefficient141_202, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root204, IC := OriginalRow227TriangleRoots04.root141,
    Inext := OriginalRow227TriangleData1666.coefficient140_204, Icur := OriginalRow227TriangleData1666.coefficient140_203,
    output := OriginalRow227TriangleData1672.coefficient141_203, hC := OriginalRow227TriangleRoots04.root141_pos, hAC := OriginalRow227TriangleRoots04.product141_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1656

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1656.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
