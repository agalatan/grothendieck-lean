import Grothe.UpperChaos.OriginalRow227TriangleData1617
import Grothe.UpperChaos.OriginalRow227TriangleData1618
import Grothe.UpperChaos.OriginalRow227TriangleData1625
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1609
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_167, Icur := OriginalRow227TriangleData1617.coefficient134_166,
    output := OriginalRow227TriangleData1625.coefficient135_166, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_168, Icur := OriginalRow227TriangleData1617.coefficient134_167,
    output := OriginalRow227TriangleData1625.coefficient135_167, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_169, Icur := OriginalRow227TriangleData1617.coefficient134_168,
    output := OriginalRow227TriangleData1625.coefficient135_168, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_170, Icur := OriginalRow227TriangleData1617.coefficient134_169,
    output := OriginalRow227TriangleData1625.coefficient135_169, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_171, Icur := OriginalRow227TriangleData1617.coefficient134_170,
    output := OriginalRow227TriangleData1625.coefficient135_170, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_172, Icur := OriginalRow227TriangleData1617.coefficient134_171,
    output := OriginalRow227TriangleData1625.coefficient135_171, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_173, Icur := OriginalRow227TriangleData1617.coefficient134_172,
    output := OriginalRow227TriangleData1625.coefficient135_172, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_174, Icur := OriginalRow227TriangleData1617.coefficient134_173,
    output := OriginalRow227TriangleData1625.coefficient135_173, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_175, Icur := OriginalRow227TriangleData1617.coefficient134_174,
    output := OriginalRow227TriangleData1625.coefficient135_174, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_176, Icur := OriginalRow227TriangleData1617.coefficient134_175,
    output := OriginalRow227TriangleData1625.coefficient135_175, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_177, Icur := OriginalRow227TriangleData1617.coefficient134_176,
    output := OriginalRow227TriangleData1625.coefficient135_176, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_178, Icur := OriginalRow227TriangleData1617.coefficient134_177,
    output := OriginalRow227TriangleData1625.coefficient135_177, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_179, Icur := OriginalRow227TriangleData1617.coefficient134_178,
    output := OriginalRow227TriangleData1625.coefficient135_178, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_180, Icur := OriginalRow227TriangleData1617.coefficient134_179,
    output := OriginalRow227TriangleData1625.coefficient135_179, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_181, Icur := OriginalRow227TriangleData1617.coefficient134_180,
    output := OriginalRow227TriangleData1625.coefficient135_180, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_182, Icur := OriginalRow227TriangleData1617.coefficient134_181,
    output := OriginalRow227TriangleData1625.coefficient135_181, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_183, Icur := OriginalRow227TriangleData1617.coefficient134_182,
    output := OriginalRow227TriangleData1625.coefficient135_182, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_184, Icur := OriginalRow227TriangleData1617.coefficient134_183,
    output := OriginalRow227TriangleData1625.coefficient135_183, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_185, Icur := OriginalRow227TriangleData1617.coefficient134_184,
    output := OriginalRow227TriangleData1625.coefficient135_184, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_186, Icur := OriginalRow227TriangleData1617.coefficient134_185,
    output := OriginalRow227TriangleData1625.coefficient135_185, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_187, Icur := OriginalRow227TriangleData1617.coefficient134_186,
    output := OriginalRow227TriangleData1625.coefficient135_186, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_188, Icur := OriginalRow227TriangleData1617.coefficient134_187,
    output := OriginalRow227TriangleData1625.coefficient135_187, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_189, Icur := OriginalRow227TriangleData1617.coefficient134_188,
    output := OriginalRow227TriangleData1625.coefficient135_188, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_190, Icur := OriginalRow227TriangleData1617.coefficient134_189,
    output := OriginalRow227TriangleData1625.coefficient135_189, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_191, Icur := OriginalRow227TriangleData1617.coefficient134_190,
    output := OriginalRow227TriangleData1625.coefficient135_190, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_192, Icur := OriginalRow227TriangleData1617.coefficient134_191,
    output := OriginalRow227TriangleData1625.coefficient135_191, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_193, Icur := OriginalRow227TriangleData1617.coefficient134_192,
    output := OriginalRow227TriangleData1625.coefficient135_192, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_194, Icur := OriginalRow227TriangleData1617.coefficient134_193,
    output := OriginalRow227TriangleData1625.coefficient135_193, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_195, Icur := OriginalRow227TriangleData1617.coefficient134_194,
    output := OriginalRow227TriangleData1625.coefficient135_194, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1617.coefficient134_196, Icur := OriginalRow227TriangleData1617.coefficient134_195,
    output := OriginalRow227TriangleData1625.coefficient135_195, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1618.coefficient134_197, Icur := OriginalRow227TriangleData1617.coefficient134_196,
    output := OriginalRow227TriangleData1625.coefficient135_196, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root135,
    Inext := OriginalRow227TriangleData1618.coefficient134_198, Icur := OriginalRow227TriangleData1618.coefficient134_197,
    output := OriginalRow227TriangleData1625.coefficient135_197, hC := OriginalRow227TriangleRoots04.root135_pos, hAC := OriginalRow227TriangleRoots04.product135_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1609

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1609.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
