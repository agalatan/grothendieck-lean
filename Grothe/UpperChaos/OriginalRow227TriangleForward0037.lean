import Grothe.UpperChaos.OriginalRow227TriangleData0037
import Grothe.UpperChaos.OriginalRow227TriangleData0038
import Grothe.UpperChaos.OriginalRow227TriangleData0053
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0037
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_163, Icur := OriginalRow227TriangleData0037.coefficient2_162,
    output := OriginalRow227TriangleData0053.coefficient3_162, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_164, Icur := OriginalRow227TriangleData0037.coefficient2_163,
    output := OriginalRow227TriangleData0053.coefficient3_163, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_165, Icur := OriginalRow227TriangleData0037.coefficient2_164,
    output := OriginalRow227TriangleData0053.coefficient3_164, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_166, Icur := OriginalRow227TriangleData0037.coefficient2_165,
    output := OriginalRow227TriangleData0053.coefficient3_165, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_167, Icur := OriginalRow227TriangleData0037.coefficient2_166,
    output := OriginalRow227TriangleData0053.coefficient3_166, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_168, Icur := OriginalRow227TriangleData0037.coefficient2_167,
    output := OriginalRow227TriangleData0053.coefficient3_167, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_169, Icur := OriginalRow227TriangleData0037.coefficient2_168,
    output := OriginalRow227TriangleData0053.coefficient3_168, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_170, Icur := OriginalRow227TriangleData0037.coefficient2_169,
    output := OriginalRow227TriangleData0053.coefficient3_169, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_171, Icur := OriginalRow227TriangleData0037.coefficient2_170,
    output := OriginalRow227TriangleData0053.coefficient3_170, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_172, Icur := OriginalRow227TriangleData0037.coefficient2_171,
    output := OriginalRow227TriangleData0053.coefficient3_171, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_173, Icur := OriginalRow227TriangleData0037.coefficient2_172,
    output := OriginalRow227TriangleData0053.coefficient3_172, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_174, Icur := OriginalRow227TriangleData0037.coefficient2_173,
    output := OriginalRow227TriangleData0053.coefficient3_173, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_175, Icur := OriginalRow227TriangleData0037.coefficient2_174,
    output := OriginalRow227TriangleData0053.coefficient3_174, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_176, Icur := OriginalRow227TriangleData0037.coefficient2_175,
    output := OriginalRow227TriangleData0053.coefficient3_175, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_177, Icur := OriginalRow227TriangleData0037.coefficient2_176,
    output := OriginalRow227TriangleData0053.coefficient3_176, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_178, Icur := OriginalRow227TriangleData0037.coefficient2_177,
    output := OriginalRow227TriangleData0053.coefficient3_177, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_179, Icur := OriginalRow227TriangleData0037.coefficient2_178,
    output := OriginalRow227TriangleData0053.coefficient3_178, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_180, Icur := OriginalRow227TriangleData0037.coefficient2_179,
    output := OriginalRow227TriangleData0053.coefficient3_179, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_181, Icur := OriginalRow227TriangleData0037.coefficient2_180,
    output := OriginalRow227TriangleData0053.coefficient3_180, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_182, Icur := OriginalRow227TriangleData0037.coefficient2_181,
    output := OriginalRow227TriangleData0053.coefficient3_181, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_183, Icur := OriginalRow227TriangleData0037.coefficient2_182,
    output := OriginalRow227TriangleData0053.coefficient3_182, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_184, Icur := OriginalRow227TriangleData0037.coefficient2_183,
    output := OriginalRow227TriangleData0053.coefficient3_183, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_185, Icur := OriginalRow227TriangleData0037.coefficient2_184,
    output := OriginalRow227TriangleData0053.coefficient3_184, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_186, Icur := OriginalRow227TriangleData0037.coefficient2_185,
    output := OriginalRow227TriangleData0053.coefficient3_185, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_187, Icur := OriginalRow227TriangleData0037.coefficient2_186,
    output := OriginalRow227TriangleData0053.coefficient3_186, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_188, Icur := OriginalRow227TriangleData0037.coefficient2_187,
    output := OriginalRow227TriangleData0053.coefficient3_187, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_189, Icur := OriginalRow227TriangleData0037.coefficient2_188,
    output := OriginalRow227TriangleData0053.coefficient3_188, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_190, Icur := OriginalRow227TriangleData0037.coefficient2_189,
    output := OriginalRow227TriangleData0053.coefficient3_189, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_191, Icur := OriginalRow227TriangleData0037.coefficient2_190,
    output := OriginalRow227TriangleData0053.coefficient3_190, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0037.coefficient2_192, Icur := OriginalRow227TriangleData0037.coefficient2_191,
    output := OriginalRow227TriangleData0053.coefficient3_191, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0038.coefficient2_193, Icur := OriginalRow227TriangleData0037.coefficient2_192,
    output := OriginalRow227TriangleData0053.coefficient3_192, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots00.root3,
    Inext := OriginalRow227TriangleData0038.coefficient2_194, Icur := OriginalRow227TriangleData0038.coefficient2_193,
    output := OriginalRow227TriangleData0053.coefficient3_193, hC := OriginalRow227TriangleRoots00.root3_pos, hAC := OriginalRow227TriangleRoots00.product3_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0037

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0037.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
