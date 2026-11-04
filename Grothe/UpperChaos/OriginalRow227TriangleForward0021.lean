import Grothe.UpperChaos.OriginalRow227TriangleData0021
import Grothe.UpperChaos.OriginalRow227TriangleData0022
import Grothe.UpperChaos.OriginalRow227TriangleData0037
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0021
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 161, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_162, Icur := OriginalRow227TriangleData0021.coefficient1_161,
    output := OriginalRow227TriangleData0037.coefficient2_161, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 162, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_163, Icur := OriginalRow227TriangleData0021.coefficient1_162,
    output := OriginalRow227TriangleData0037.coefficient2_162, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 163, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_164, Icur := OriginalRow227TriangleData0021.coefficient1_163,
    output := OriginalRow227TriangleData0037.coefficient2_163, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 164, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_165, Icur := OriginalRow227TriangleData0021.coefficient1_164,
    output := OriginalRow227TriangleData0037.coefficient2_164, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 165, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_166, Icur := OriginalRow227TriangleData0021.coefficient1_165,
    output := OriginalRow227TriangleData0037.coefficient2_165, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 166, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_167, Icur := OriginalRow227TriangleData0021.coefficient1_166,
    output := OriginalRow227TriangleData0037.coefficient2_166, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 167, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_168, Icur := OriginalRow227TriangleData0021.coefficient1_167,
    output := OriginalRow227TriangleData0037.coefficient2_167, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 168, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_169, Icur := OriginalRow227TriangleData0021.coefficient1_168,
    output := OriginalRow227TriangleData0037.coefficient2_168, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 169, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_170, Icur := OriginalRow227TriangleData0021.coefficient1_169,
    output := OriginalRow227TriangleData0037.coefficient2_169, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 170, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_171, Icur := OriginalRow227TriangleData0021.coefficient1_170,
    output := OriginalRow227TriangleData0037.coefficient2_170, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 171, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_172, Icur := OriginalRow227TriangleData0021.coefficient1_171,
    output := OriginalRow227TriangleData0037.coefficient2_171, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 172, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_173, Icur := OriginalRow227TriangleData0021.coefficient1_172,
    output := OriginalRow227TriangleData0037.coefficient2_172, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 173, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_174, Icur := OriginalRow227TriangleData0021.coefficient1_173,
    output := OriginalRow227TriangleData0037.coefficient2_173, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 174, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_175, Icur := OriginalRow227TriangleData0021.coefficient1_174,
    output := OriginalRow227TriangleData0037.coefficient2_174, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 175, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_176, Icur := OriginalRow227TriangleData0021.coefficient1_175,
    output := OriginalRow227TriangleData0037.coefficient2_175, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 176, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_177, Icur := OriginalRow227TriangleData0021.coefficient1_176,
    output := OriginalRow227TriangleData0037.coefficient2_176, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 177, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_178, Icur := OriginalRow227TriangleData0021.coefficient1_177,
    output := OriginalRow227TriangleData0037.coefficient2_177, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 178, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_179, Icur := OriginalRow227TriangleData0021.coefficient1_178,
    output := OriginalRow227TriangleData0037.coefficient2_178, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 179, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_180, Icur := OriginalRow227TriangleData0021.coefficient1_179,
    output := OriginalRow227TriangleData0037.coefficient2_179, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 180, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_181, Icur := OriginalRow227TriangleData0021.coefficient1_180,
    output := OriginalRow227TriangleData0037.coefficient2_180, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 181, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_182, Icur := OriginalRow227TriangleData0021.coefficient1_181,
    output := OriginalRow227TriangleData0037.coefficient2_181, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 182, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_183, Icur := OriginalRow227TriangleData0021.coefficient1_182,
    output := OriginalRow227TriangleData0037.coefficient2_182, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 183, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_184, Icur := OriginalRow227TriangleData0021.coefficient1_183,
    output := OriginalRow227TriangleData0037.coefficient2_183, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 184, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_185, Icur := OriginalRow227TriangleData0021.coefficient1_184,
    output := OriginalRow227TriangleData0037.coefficient2_184, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 185, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_186, Icur := OriginalRow227TriangleData0021.coefficient1_185,
    output := OriginalRow227TriangleData0037.coefficient2_185, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 186, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_187, Icur := OriginalRow227TriangleData0021.coefficient1_186,
    output := OriginalRow227TriangleData0037.coefficient2_186, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 187, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_188, Icur := OriginalRow227TriangleData0021.coefficient1_187,
    output := OriginalRow227TriangleData0037.coefficient2_187, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 188, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_189, Icur := OriginalRow227TriangleData0021.coefficient1_188,
    output := OriginalRow227TriangleData0037.coefficient2_188, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 189, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_190, Icur := OriginalRow227TriangleData0021.coefficient1_189,
    output := OriginalRow227TriangleData0037.coefficient2_189, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 190, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0021.coefficient1_191, Icur := OriginalRow227TriangleData0021.coefficient1_190,
    output := OriginalRow227TriangleData0037.coefficient2_190, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 191, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_192, Icur := OriginalRow227TriangleData0021.coefficient1_191,
    output := OriginalRow227TriangleData0037.coefficient2_191, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos },
  { charge := 192, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots00.root2,
    Inext := OriginalRow227TriangleData0022.coefficient1_193, Icur := OriginalRow227TriangleData0022.coefficient1_192,
    output := OriginalRow227TriangleData0037.coefficient2_192, hC := OriginalRow227TriangleRoots00.root2_pos, hAC := OriginalRow227TriangleRoots00.product2_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0021

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0021.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
