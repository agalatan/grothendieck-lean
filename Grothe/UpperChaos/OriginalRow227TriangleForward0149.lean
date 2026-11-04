import Grothe.UpperChaos.OriginalRow227TriangleData0149
import Grothe.UpperChaos.OriginalRow227TriangleData0150
import Grothe.UpperChaos.OriginalRow227TriangleData0165
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0149
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_170, Icur := OriginalRow227TriangleData0149.coefficient9_169,
    output := OriginalRow227TriangleData0165.coefficient10_169, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_171, Icur := OriginalRow227TriangleData0149.coefficient9_170,
    output := OriginalRow227TriangleData0165.coefficient10_170, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_172, Icur := OriginalRow227TriangleData0149.coefficient9_171,
    output := OriginalRow227TriangleData0165.coefficient10_171, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_173, Icur := OriginalRow227TriangleData0149.coefficient9_172,
    output := OriginalRow227TriangleData0165.coefficient10_172, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_174, Icur := OriginalRow227TriangleData0149.coefficient9_173,
    output := OriginalRow227TriangleData0165.coefficient10_173, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_175, Icur := OriginalRow227TriangleData0149.coefficient9_174,
    output := OriginalRow227TriangleData0165.coefficient10_174, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_176, Icur := OriginalRow227TriangleData0149.coefficient9_175,
    output := OriginalRow227TriangleData0165.coefficient10_175, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_177, Icur := OriginalRow227TriangleData0149.coefficient9_176,
    output := OriginalRow227TriangleData0165.coefficient10_176, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_178, Icur := OriginalRow227TriangleData0149.coefficient9_177,
    output := OriginalRow227TriangleData0165.coefficient10_177, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_179, Icur := OriginalRow227TriangleData0149.coefficient9_178,
    output := OriginalRow227TriangleData0165.coefficient10_178, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_180, Icur := OriginalRow227TriangleData0149.coefficient9_179,
    output := OriginalRow227TriangleData0165.coefficient10_179, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_181, Icur := OriginalRow227TriangleData0149.coefficient9_180,
    output := OriginalRow227TriangleData0165.coefficient10_180, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_182, Icur := OriginalRow227TriangleData0149.coefficient9_181,
    output := OriginalRow227TriangleData0165.coefficient10_181, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_183, Icur := OriginalRow227TriangleData0149.coefficient9_182,
    output := OriginalRow227TriangleData0165.coefficient10_182, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_184, Icur := OriginalRow227TriangleData0149.coefficient9_183,
    output := OriginalRow227TriangleData0165.coefficient10_183, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_185, Icur := OriginalRow227TriangleData0149.coefficient9_184,
    output := OriginalRow227TriangleData0165.coefficient10_184, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_186, Icur := OriginalRow227TriangleData0149.coefficient9_185,
    output := OriginalRow227TriangleData0165.coefficient10_185, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_187, Icur := OriginalRow227TriangleData0149.coefficient9_186,
    output := OriginalRow227TriangleData0165.coefficient10_186, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_188, Icur := OriginalRow227TriangleData0149.coefficient9_187,
    output := OriginalRow227TriangleData0165.coefficient10_187, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_189, Icur := OriginalRow227TriangleData0149.coefficient9_188,
    output := OriginalRow227TriangleData0165.coefficient10_188, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_190, Icur := OriginalRow227TriangleData0149.coefficient9_189,
    output := OriginalRow227TriangleData0165.coefficient10_189, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_191, Icur := OriginalRow227TriangleData0149.coefficient9_190,
    output := OriginalRow227TriangleData0165.coefficient10_190, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_192, Icur := OriginalRow227TriangleData0149.coefficient9_191,
    output := OriginalRow227TriangleData0165.coefficient10_191, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_193, Icur := OriginalRow227TriangleData0149.coefficient9_192,
    output := OriginalRow227TriangleData0165.coefficient10_192, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_194, Icur := OriginalRow227TriangleData0149.coefficient9_193,
    output := OriginalRow227TriangleData0165.coefficient10_193, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_195, Icur := OriginalRow227TriangleData0149.coefficient9_194,
    output := OriginalRow227TriangleData0165.coefficient10_194, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_196, Icur := OriginalRow227TriangleData0149.coefficient9_195,
    output := OriginalRow227TriangleData0165.coefficient10_195, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_197, Icur := OriginalRow227TriangleData0149.coefficient9_196,
    output := OriginalRow227TriangleData0165.coefficient10_196, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_198, Icur := OriginalRow227TriangleData0149.coefficient9_197,
    output := OriginalRow227TriangleData0165.coefficient10_197, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0149.coefficient9_199, Icur := OriginalRow227TriangleData0149.coefficient9_198,
    output := OriginalRow227TriangleData0165.coefficient10_198, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0150.coefficient9_200, Icur := OriginalRow227TriangleData0149.coefficient9_199,
    output := OriginalRow227TriangleData0165.coefficient10_199, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots00.root10,
    Inext := OriginalRow227TriangleData0150.coefficient9_201, Icur := OriginalRow227TriangleData0150.coefficient9_200,
    output := OriginalRow227TriangleData0165.coefficient10_200, hC := OriginalRow227TriangleRoots00.root10_pos, hAC := OriginalRow227TriangleRoots00.product10_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0149

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0149.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
