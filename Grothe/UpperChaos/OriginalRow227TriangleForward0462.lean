import Grothe.UpperChaos.OriginalRow227TriangleData0464
import Grothe.UpperChaos.OriginalRow227TriangleData0465
import Grothe.UpperChaos.OriginalRow227TriangleData0478
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0462
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_159, Icur := OriginalRow227TriangleData0464.coefficient30_158,
    output := OriginalRow227TriangleData0478.coefficient31_158, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_160, Icur := OriginalRow227TriangleData0464.coefficient30_159,
    output := OriginalRow227TriangleData0478.coefficient31_159, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_161, Icur := OriginalRow227TriangleData0464.coefficient30_160,
    output := OriginalRow227TriangleData0478.coefficient31_160, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_162, Icur := OriginalRow227TriangleData0464.coefficient30_161,
    output := OriginalRow227TriangleData0478.coefficient31_161, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_163, Icur := OriginalRow227TriangleData0464.coefficient30_162,
    output := OriginalRow227TriangleData0478.coefficient31_162, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_164, Icur := OriginalRow227TriangleData0464.coefficient30_163,
    output := OriginalRow227TriangleData0478.coefficient31_163, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_165, Icur := OriginalRow227TriangleData0464.coefficient30_164,
    output := OriginalRow227TriangleData0478.coefficient31_164, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_166, Icur := OriginalRow227TriangleData0464.coefficient30_165,
    output := OriginalRow227TriangleData0478.coefficient31_165, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_167, Icur := OriginalRow227TriangleData0464.coefficient30_166,
    output := OriginalRow227TriangleData0478.coefficient31_166, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_168, Icur := OriginalRow227TriangleData0464.coefficient30_167,
    output := OriginalRow227TriangleData0478.coefficient31_167, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_169, Icur := OriginalRow227TriangleData0464.coefficient30_168,
    output := OriginalRow227TriangleData0478.coefficient31_168, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_170, Icur := OriginalRow227TriangleData0464.coefficient30_169,
    output := OriginalRow227TriangleData0478.coefficient31_169, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_171, Icur := OriginalRow227TriangleData0464.coefficient30_170,
    output := OriginalRow227TriangleData0478.coefficient31_170, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_172, Icur := OriginalRow227TriangleData0464.coefficient30_171,
    output := OriginalRow227TriangleData0478.coefficient31_171, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_173, Icur := OriginalRow227TriangleData0464.coefficient30_172,
    output := OriginalRow227TriangleData0478.coefficient31_172, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_174, Icur := OriginalRow227TriangleData0464.coefficient30_173,
    output := OriginalRow227TriangleData0478.coefficient31_173, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_175, Icur := OriginalRow227TriangleData0464.coefficient30_174,
    output := OriginalRow227TriangleData0478.coefficient31_174, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_176, Icur := OriginalRow227TriangleData0464.coefficient30_175,
    output := OriginalRow227TriangleData0478.coefficient31_175, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_177, Icur := OriginalRow227TriangleData0464.coefficient30_176,
    output := OriginalRow227TriangleData0478.coefficient31_176, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_178, Icur := OriginalRow227TriangleData0464.coefficient30_177,
    output := OriginalRow227TriangleData0478.coefficient31_177, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_179, Icur := OriginalRow227TriangleData0464.coefficient30_178,
    output := OriginalRow227TriangleData0478.coefficient31_178, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_180, Icur := OriginalRow227TriangleData0464.coefficient30_179,
    output := OriginalRow227TriangleData0478.coefficient31_179, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_181, Icur := OriginalRow227TriangleData0464.coefficient30_180,
    output := OriginalRow227TriangleData0478.coefficient31_180, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_182, Icur := OriginalRow227TriangleData0464.coefficient30_181,
    output := OriginalRow227TriangleData0478.coefficient31_181, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_183, Icur := OriginalRow227TriangleData0464.coefficient30_182,
    output := OriginalRow227TriangleData0478.coefficient31_182, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_184, Icur := OriginalRow227TriangleData0464.coefficient30_183,
    output := OriginalRow227TriangleData0478.coefficient31_183, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_185, Icur := OriginalRow227TriangleData0464.coefficient30_184,
    output := OriginalRow227TriangleData0478.coefficient31_184, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_186, Icur := OriginalRow227TriangleData0464.coefficient30_185,
    output := OriginalRow227TriangleData0478.coefficient31_185, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_187, Icur := OriginalRow227TriangleData0464.coefficient30_186,
    output := OriginalRow227TriangleData0478.coefficient31_186, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0464.coefficient30_188, Icur := OriginalRow227TriangleData0464.coefficient30_187,
    output := OriginalRow227TriangleData0478.coefficient31_187, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_189, Icur := OriginalRow227TriangleData0464.coefficient30_188,
    output := OriginalRow227TriangleData0478.coefficient31_188, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root31,
    Inext := OriginalRow227TriangleData0465.coefficient30_190, Icur := OriginalRow227TriangleData0465.coefficient30_189,
    output := OriginalRow227TriangleData0478.coefficient31_189, hC := OriginalRow227TriangleRoots00.root31_pos, hAC := OriginalRow227TriangleRoots00.product31_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0462

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0462.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
