import Grothe.UpperChaos.OriginalRow227TriangleData0590
import Grothe.UpperChaos.OriginalRow227TriangleData0591
import Grothe.UpperChaos.OriginalRow227TriangleData0604
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0588
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_168, Icur := OriginalRow227TriangleData0590.coefficient39_167,
    output := OriginalRow227TriangleData0604.coefficient40_167, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_169, Icur := OriginalRow227TriangleData0590.coefficient39_168,
    output := OriginalRow227TriangleData0604.coefficient40_168, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_170, Icur := OriginalRow227TriangleData0590.coefficient39_169,
    output := OriginalRow227TriangleData0604.coefficient40_169, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_171, Icur := OriginalRow227TriangleData0590.coefficient39_170,
    output := OriginalRow227TriangleData0604.coefficient40_170, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_172, Icur := OriginalRow227TriangleData0590.coefficient39_171,
    output := OriginalRow227TriangleData0604.coefficient40_171, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_173, Icur := OriginalRow227TriangleData0590.coefficient39_172,
    output := OriginalRow227TriangleData0604.coefficient40_172, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_174, Icur := OriginalRow227TriangleData0590.coefficient39_173,
    output := OriginalRow227TriangleData0604.coefficient40_173, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_175, Icur := OriginalRow227TriangleData0590.coefficient39_174,
    output := OriginalRow227TriangleData0604.coefficient40_174, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_176, Icur := OriginalRow227TriangleData0590.coefficient39_175,
    output := OriginalRow227TriangleData0604.coefficient40_175, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_177, Icur := OriginalRow227TriangleData0590.coefficient39_176,
    output := OriginalRow227TriangleData0604.coefficient40_176, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_178, Icur := OriginalRow227TriangleData0590.coefficient39_177,
    output := OriginalRow227TriangleData0604.coefficient40_177, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_179, Icur := OriginalRow227TriangleData0590.coefficient39_178,
    output := OriginalRow227TriangleData0604.coefficient40_178, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_180, Icur := OriginalRow227TriangleData0590.coefficient39_179,
    output := OriginalRow227TriangleData0604.coefficient40_179, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_181, Icur := OriginalRow227TriangleData0590.coefficient39_180,
    output := OriginalRow227TriangleData0604.coefficient40_180, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_182, Icur := OriginalRow227TriangleData0590.coefficient39_181,
    output := OriginalRow227TriangleData0604.coefficient40_181, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_183, Icur := OriginalRow227TriangleData0590.coefficient39_182,
    output := OriginalRow227TriangleData0604.coefficient40_182, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_184, Icur := OriginalRow227TriangleData0590.coefficient39_183,
    output := OriginalRow227TriangleData0604.coefficient40_183, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_185, Icur := OriginalRow227TriangleData0590.coefficient39_184,
    output := OriginalRow227TriangleData0604.coefficient40_184, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_186, Icur := OriginalRow227TriangleData0590.coefficient39_185,
    output := OriginalRow227TriangleData0604.coefficient40_185, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_187, Icur := OriginalRow227TriangleData0590.coefficient39_186,
    output := OriginalRow227TriangleData0604.coefficient40_186, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_188, Icur := OriginalRow227TriangleData0590.coefficient39_187,
    output := OriginalRow227TriangleData0604.coefficient40_187, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_189, Icur := OriginalRow227TriangleData0590.coefficient39_188,
    output := OriginalRow227TriangleData0604.coefficient40_188, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_190, Icur := OriginalRow227TriangleData0590.coefficient39_189,
    output := OriginalRow227TriangleData0604.coefficient40_189, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_191, Icur := OriginalRow227TriangleData0590.coefficient39_190,
    output := OriginalRow227TriangleData0604.coefficient40_190, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_192, Icur := OriginalRow227TriangleData0590.coefficient39_191,
    output := OriginalRow227TriangleData0604.coefficient40_191, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_193, Icur := OriginalRow227TriangleData0590.coefficient39_192,
    output := OriginalRow227TriangleData0604.coefficient40_192, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_194, Icur := OriginalRow227TriangleData0590.coefficient39_193,
    output := OriginalRow227TriangleData0604.coefficient40_193, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_195, Icur := OriginalRow227TriangleData0590.coefficient39_194,
    output := OriginalRow227TriangleData0604.coefficient40_194, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_196, Icur := OriginalRow227TriangleData0590.coefficient39_195,
    output := OriginalRow227TriangleData0604.coefficient40_195, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0590.coefficient39_197, Icur := OriginalRow227TriangleData0590.coefficient39_196,
    output := OriginalRow227TriangleData0604.coefficient40_196, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0591.coefficient39_198, Icur := OriginalRow227TriangleData0590.coefficient39_197,
    output := OriginalRow227TriangleData0604.coefficient40_197, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots01.root40,
    Inext := OriginalRow227TriangleData0591.coefficient39_199, Icur := OriginalRow227TriangleData0591.coefficient39_198,
    output := OriginalRow227TriangleData0604.coefficient40_198, hC := OriginalRow227TriangleRoots01.root40_pos, hAC := OriginalRow227TriangleRoots01.product40_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0588

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0588.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
