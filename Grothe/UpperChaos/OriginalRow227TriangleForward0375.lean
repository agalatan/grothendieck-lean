import Grothe.UpperChaos.OriginalRow227TriangleData0376
import Grothe.UpperChaos.OriginalRow227TriangleData0377
import Grothe.UpperChaos.OriginalRow227TriangleData0391
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0375
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_153, Icur := OriginalRow227TriangleData0376.coefficient24_152,
    output := OriginalRow227TriangleData0391.coefficient25_152, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_154, Icur := OriginalRow227TriangleData0376.coefficient24_153,
    output := OriginalRow227TriangleData0391.coefficient25_153, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_155, Icur := OriginalRow227TriangleData0376.coefficient24_154,
    output := OriginalRow227TriangleData0391.coefficient25_154, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_156, Icur := OriginalRow227TriangleData0376.coefficient24_155,
    output := OriginalRow227TriangleData0391.coefficient25_155, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_157, Icur := OriginalRow227TriangleData0376.coefficient24_156,
    output := OriginalRow227TriangleData0391.coefficient25_156, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_158, Icur := OriginalRow227TriangleData0376.coefficient24_157,
    output := OriginalRow227TriangleData0391.coefficient25_157, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_159, Icur := OriginalRow227TriangleData0376.coefficient24_158,
    output := OriginalRow227TriangleData0391.coefficient25_158, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_160, Icur := OriginalRow227TriangleData0376.coefficient24_159,
    output := OriginalRow227TriangleData0391.coefficient25_159, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_161, Icur := OriginalRow227TriangleData0376.coefficient24_160,
    output := OriginalRow227TriangleData0391.coefficient25_160, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_162, Icur := OriginalRow227TriangleData0376.coefficient24_161,
    output := OriginalRow227TriangleData0391.coefficient25_161, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_163, Icur := OriginalRow227TriangleData0376.coefficient24_162,
    output := OriginalRow227TriangleData0391.coefficient25_162, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_164, Icur := OriginalRow227TriangleData0376.coefficient24_163,
    output := OriginalRow227TriangleData0391.coefficient25_163, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_165, Icur := OriginalRow227TriangleData0376.coefficient24_164,
    output := OriginalRow227TriangleData0391.coefficient25_164, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_166, Icur := OriginalRow227TriangleData0376.coefficient24_165,
    output := OriginalRow227TriangleData0391.coefficient25_165, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_167, Icur := OriginalRow227TriangleData0376.coefficient24_166,
    output := OriginalRow227TriangleData0391.coefficient25_166, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_168, Icur := OriginalRow227TriangleData0376.coefficient24_167,
    output := OriginalRow227TriangleData0391.coefficient25_167, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_169, Icur := OriginalRow227TriangleData0376.coefficient24_168,
    output := OriginalRow227TriangleData0391.coefficient25_168, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_170, Icur := OriginalRow227TriangleData0376.coefficient24_169,
    output := OriginalRow227TriangleData0391.coefficient25_169, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_171, Icur := OriginalRow227TriangleData0376.coefficient24_170,
    output := OriginalRow227TriangleData0391.coefficient25_170, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_172, Icur := OriginalRow227TriangleData0376.coefficient24_171,
    output := OriginalRow227TriangleData0391.coefficient25_171, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_173, Icur := OriginalRow227TriangleData0376.coefficient24_172,
    output := OriginalRow227TriangleData0391.coefficient25_172, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_174, Icur := OriginalRow227TriangleData0376.coefficient24_173,
    output := OriginalRow227TriangleData0391.coefficient25_173, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_175, Icur := OriginalRow227TriangleData0376.coefficient24_174,
    output := OriginalRow227TriangleData0391.coefficient25_174, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_176, Icur := OriginalRow227TriangleData0376.coefficient24_175,
    output := OriginalRow227TriangleData0391.coefficient25_175, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_177, Icur := OriginalRow227TriangleData0376.coefficient24_176,
    output := OriginalRow227TriangleData0391.coefficient25_176, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_178, Icur := OriginalRow227TriangleData0376.coefficient24_177,
    output := OriginalRow227TriangleData0391.coefficient25_177, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_179, Icur := OriginalRow227TriangleData0376.coefficient24_178,
    output := OriginalRow227TriangleData0391.coefficient25_178, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_180, Icur := OriginalRow227TriangleData0376.coefficient24_179,
    output := OriginalRow227TriangleData0391.coefficient25_179, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_181, Icur := OriginalRow227TriangleData0376.coefficient24_180,
    output := OriginalRow227TriangleData0391.coefficient25_180, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0376.coefficient24_182, Icur := OriginalRow227TriangleData0376.coefficient24_181,
    output := OriginalRow227TriangleData0391.coefficient25_181, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0377.coefficient24_183, Icur := OriginalRow227TriangleData0376.coefficient24_182,
    output := OriginalRow227TriangleData0391.coefficient25_182, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root25,
    Inext := OriginalRow227TriangleData0377.coefficient24_184, Icur := OriginalRow227TriangleData0377.coefficient24_183,
    output := OriginalRow227TriangleData0391.coefficient25_183, hC := OriginalRow227TriangleRoots00.root25_pos, hAC := OriginalRow227TriangleRoots00.product25_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0375

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0375.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
