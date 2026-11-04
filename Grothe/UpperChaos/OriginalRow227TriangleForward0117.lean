import Grothe.UpperChaos.OriginalRow227TriangleData0117
import Grothe.UpperChaos.OriginalRow227TriangleData0118
import Grothe.UpperChaos.OriginalRow227TriangleData0133
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0117
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_168, Icur := OriginalRow227TriangleData0117.coefficient7_167,
    output := OriginalRow227TriangleData0133.coefficient8_167, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_169, Icur := OriginalRow227TriangleData0117.coefficient7_168,
    output := OriginalRow227TriangleData0133.coefficient8_168, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_170, Icur := OriginalRow227TriangleData0117.coefficient7_169,
    output := OriginalRow227TriangleData0133.coefficient8_169, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_171, Icur := OriginalRow227TriangleData0117.coefficient7_170,
    output := OriginalRow227TriangleData0133.coefficient8_170, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_172, Icur := OriginalRow227TriangleData0117.coefficient7_171,
    output := OriginalRow227TriangleData0133.coefficient8_171, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_173, Icur := OriginalRow227TriangleData0117.coefficient7_172,
    output := OriginalRow227TriangleData0133.coefficient8_172, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_174, Icur := OriginalRow227TriangleData0117.coefficient7_173,
    output := OriginalRow227TriangleData0133.coefficient8_173, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_175, Icur := OriginalRow227TriangleData0117.coefficient7_174,
    output := OriginalRow227TriangleData0133.coefficient8_174, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_176, Icur := OriginalRow227TriangleData0117.coefficient7_175,
    output := OriginalRow227TriangleData0133.coefficient8_175, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_177, Icur := OriginalRow227TriangleData0117.coefficient7_176,
    output := OriginalRow227TriangleData0133.coefficient8_176, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_178, Icur := OriginalRow227TriangleData0117.coefficient7_177,
    output := OriginalRow227TriangleData0133.coefficient8_177, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_179, Icur := OriginalRow227TriangleData0117.coefficient7_178,
    output := OriginalRow227TriangleData0133.coefficient8_178, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_180, Icur := OriginalRow227TriangleData0117.coefficient7_179,
    output := OriginalRow227TriangleData0133.coefficient8_179, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_181, Icur := OriginalRow227TriangleData0117.coefficient7_180,
    output := OriginalRow227TriangleData0133.coefficient8_180, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_182, Icur := OriginalRow227TriangleData0117.coefficient7_181,
    output := OriginalRow227TriangleData0133.coefficient8_181, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_183, Icur := OriginalRow227TriangleData0117.coefficient7_182,
    output := OriginalRow227TriangleData0133.coefficient8_182, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_184, Icur := OriginalRow227TriangleData0117.coefficient7_183,
    output := OriginalRow227TriangleData0133.coefficient8_183, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_185, Icur := OriginalRow227TriangleData0117.coefficient7_184,
    output := OriginalRow227TriangleData0133.coefficient8_184, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_186, Icur := OriginalRow227TriangleData0117.coefficient7_185,
    output := OriginalRow227TriangleData0133.coefficient8_185, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_187, Icur := OriginalRow227TriangleData0117.coefficient7_186,
    output := OriginalRow227TriangleData0133.coefficient8_186, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_188, Icur := OriginalRow227TriangleData0117.coefficient7_187,
    output := OriginalRow227TriangleData0133.coefficient8_187, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_189, Icur := OriginalRow227TriangleData0117.coefficient7_188,
    output := OriginalRow227TriangleData0133.coefficient8_188, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_190, Icur := OriginalRow227TriangleData0117.coefficient7_189,
    output := OriginalRow227TriangleData0133.coefficient8_189, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_191, Icur := OriginalRow227TriangleData0117.coefficient7_190,
    output := OriginalRow227TriangleData0133.coefficient8_190, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_192, Icur := OriginalRow227TriangleData0117.coefficient7_191,
    output := OriginalRow227TriangleData0133.coefficient8_191, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_193, Icur := OriginalRow227TriangleData0117.coefficient7_192,
    output := OriginalRow227TriangleData0133.coefficient8_192, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_194, Icur := OriginalRow227TriangleData0117.coefficient7_193,
    output := OriginalRow227TriangleData0133.coefficient8_193, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_195, Icur := OriginalRow227TriangleData0117.coefficient7_194,
    output := OriginalRow227TriangleData0133.coefficient8_194, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_196, Icur := OriginalRow227TriangleData0117.coefficient7_195,
    output := OriginalRow227TriangleData0133.coefficient8_195, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0117.coefficient7_197, Icur := OriginalRow227TriangleData0117.coefficient7_196,
    output := OriginalRow227TriangleData0133.coefficient8_196, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0118.coefficient7_198, Icur := OriginalRow227TriangleData0117.coefficient7_197,
    output := OriginalRow227TriangleData0133.coefficient8_197, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root8,
    Inext := OriginalRow227TriangleData0118.coefficient7_199, Icur := OriginalRow227TriangleData0118.coefficient7_198,
    output := OriginalRow227TriangleData0133.coefficient8_198, hC := OriginalRow227TriangleRoots00.root8_pos, hAC := OriginalRow227TriangleRoots00.product8_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0117

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0117.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
