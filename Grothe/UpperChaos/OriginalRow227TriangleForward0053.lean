import Grothe.UpperChaos.OriginalRow227TriangleData0053
import Grothe.UpperChaos.OriginalRow227TriangleData0054
import Grothe.UpperChaos.OriginalRow227TriangleData0069
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0053
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_164, Icur := OriginalRow227TriangleData0053.coefficient3_163,
    output := OriginalRow227TriangleData0069.coefficient4_163, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_165, Icur := OriginalRow227TriangleData0053.coefficient3_164,
    output := OriginalRow227TriangleData0069.coefficient4_164, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_166, Icur := OriginalRow227TriangleData0053.coefficient3_165,
    output := OriginalRow227TriangleData0069.coefficient4_165, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_167, Icur := OriginalRow227TriangleData0053.coefficient3_166,
    output := OriginalRow227TriangleData0069.coefficient4_166, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_168, Icur := OriginalRow227TriangleData0053.coefficient3_167,
    output := OriginalRow227TriangleData0069.coefficient4_167, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_169, Icur := OriginalRow227TriangleData0053.coefficient3_168,
    output := OriginalRow227TriangleData0069.coefficient4_168, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_170, Icur := OriginalRow227TriangleData0053.coefficient3_169,
    output := OriginalRow227TriangleData0069.coefficient4_169, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_171, Icur := OriginalRow227TriangleData0053.coefficient3_170,
    output := OriginalRow227TriangleData0069.coefficient4_170, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_172, Icur := OriginalRow227TriangleData0053.coefficient3_171,
    output := OriginalRow227TriangleData0069.coefficient4_171, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_173, Icur := OriginalRow227TriangleData0053.coefficient3_172,
    output := OriginalRow227TriangleData0069.coefficient4_172, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_174, Icur := OriginalRow227TriangleData0053.coefficient3_173,
    output := OriginalRow227TriangleData0069.coefficient4_173, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_175, Icur := OriginalRow227TriangleData0053.coefficient3_174,
    output := OriginalRow227TriangleData0069.coefficient4_174, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_176, Icur := OriginalRow227TriangleData0053.coefficient3_175,
    output := OriginalRow227TriangleData0069.coefficient4_175, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_177, Icur := OriginalRow227TriangleData0053.coefficient3_176,
    output := OriginalRow227TriangleData0069.coefficient4_176, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_178, Icur := OriginalRow227TriangleData0053.coefficient3_177,
    output := OriginalRow227TriangleData0069.coefficient4_177, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_179, Icur := OriginalRow227TriangleData0053.coefficient3_178,
    output := OriginalRow227TriangleData0069.coefficient4_178, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_180, Icur := OriginalRow227TriangleData0053.coefficient3_179,
    output := OriginalRow227TriangleData0069.coefficient4_179, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_181, Icur := OriginalRow227TriangleData0053.coefficient3_180,
    output := OriginalRow227TriangleData0069.coefficient4_180, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_182, Icur := OriginalRow227TriangleData0053.coefficient3_181,
    output := OriginalRow227TriangleData0069.coefficient4_181, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_183, Icur := OriginalRow227TriangleData0053.coefficient3_182,
    output := OriginalRow227TriangleData0069.coefficient4_182, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_184, Icur := OriginalRow227TriangleData0053.coefficient3_183,
    output := OriginalRow227TriangleData0069.coefficient4_183, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_185, Icur := OriginalRow227TriangleData0053.coefficient3_184,
    output := OriginalRow227TriangleData0069.coefficient4_184, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_186, Icur := OriginalRow227TriangleData0053.coefficient3_185,
    output := OriginalRow227TriangleData0069.coefficient4_185, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_187, Icur := OriginalRow227TriangleData0053.coefficient3_186,
    output := OriginalRow227TriangleData0069.coefficient4_186, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_188, Icur := OriginalRow227TriangleData0053.coefficient3_187,
    output := OriginalRow227TriangleData0069.coefficient4_187, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_189, Icur := OriginalRow227TriangleData0053.coefficient3_188,
    output := OriginalRow227TriangleData0069.coefficient4_188, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_190, Icur := OriginalRow227TriangleData0053.coefficient3_189,
    output := OriginalRow227TriangleData0069.coefficient4_189, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_191, Icur := OriginalRow227TriangleData0053.coefficient3_190,
    output := OriginalRow227TriangleData0069.coefficient4_190, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_192, Icur := OriginalRow227TriangleData0053.coefficient3_191,
    output := OriginalRow227TriangleData0069.coefficient4_191, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0053.coefficient3_193, Icur := OriginalRow227TriangleData0053.coefficient3_192,
    output := OriginalRow227TriangleData0069.coefficient4_192, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0054.coefficient3_194, Icur := OriginalRow227TriangleData0053.coefficient3_193,
    output := OriginalRow227TriangleData0069.coefficient4_193, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots00.root4,
    Inext := OriginalRow227TriangleData0054.coefficient3_195, Icur := OriginalRow227TriangleData0054.coefficient3_194,
    output := OriginalRow227TriangleData0069.coefficient4_194, hC := OriginalRow227TriangleRoots00.root4_pos, hAC := OriginalRow227TriangleRoots00.product4_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0053

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0053.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
