import Grothe.UpperChaos.OriginalRow227TriangleData1788
import Grothe.UpperChaos.OriginalRow227TriangleData1789
import Grothe.UpperChaos.OriginalRow227TriangleData1794
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1778
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_159, Icur := OriginalRow227TriangleData1788.coefficient158_158,
    output := OriginalRow227TriangleData1794.coefficient159_158, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_160, Icur := OriginalRow227TriangleData1788.coefficient158_159,
    output := OriginalRow227TriangleData1794.coefficient159_159, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_161, Icur := OriginalRow227TriangleData1788.coefficient158_160,
    output := OriginalRow227TriangleData1794.coefficient159_160, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_162, Icur := OriginalRow227TriangleData1788.coefficient158_161,
    output := OriginalRow227TriangleData1794.coefficient159_161, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_163, Icur := OriginalRow227TriangleData1788.coefficient158_162,
    output := OriginalRow227TriangleData1794.coefficient159_162, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_164, Icur := OriginalRow227TriangleData1788.coefficient158_163,
    output := OriginalRow227TriangleData1794.coefficient159_163, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_165, Icur := OriginalRow227TriangleData1788.coefficient158_164,
    output := OriginalRow227TriangleData1794.coefficient159_164, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_166, Icur := OriginalRow227TriangleData1788.coefficient158_165,
    output := OriginalRow227TriangleData1794.coefficient159_165, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_167, Icur := OriginalRow227TriangleData1788.coefficient158_166,
    output := OriginalRow227TriangleData1794.coefficient159_166, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_168, Icur := OriginalRow227TriangleData1788.coefficient158_167,
    output := OriginalRow227TriangleData1794.coefficient159_167, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_169, Icur := OriginalRow227TriangleData1788.coefficient158_168,
    output := OriginalRow227TriangleData1794.coefficient159_168, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_170, Icur := OriginalRow227TriangleData1788.coefficient158_169,
    output := OriginalRow227TriangleData1794.coefficient159_169, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_171, Icur := OriginalRow227TriangleData1788.coefficient158_170,
    output := OriginalRow227TriangleData1794.coefficient159_170, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_172, Icur := OriginalRow227TriangleData1788.coefficient158_171,
    output := OriginalRow227TriangleData1794.coefficient159_171, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_173, Icur := OriginalRow227TriangleData1788.coefficient158_172,
    output := OriginalRow227TriangleData1794.coefficient159_172, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_174, Icur := OriginalRow227TriangleData1788.coefficient158_173,
    output := OriginalRow227TriangleData1794.coefficient159_173, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_175, Icur := OriginalRow227TriangleData1788.coefficient158_174,
    output := OriginalRow227TriangleData1794.coefficient159_174, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_176, Icur := OriginalRow227TriangleData1788.coefficient158_175,
    output := OriginalRow227TriangleData1794.coefficient159_175, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_177, Icur := OriginalRow227TriangleData1788.coefficient158_176,
    output := OriginalRow227TriangleData1794.coefficient159_176, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_178, Icur := OriginalRow227TriangleData1788.coefficient158_177,
    output := OriginalRow227TriangleData1794.coefficient159_177, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_179, Icur := OriginalRow227TriangleData1788.coefficient158_178,
    output := OriginalRow227TriangleData1794.coefficient159_178, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_180, Icur := OriginalRow227TriangleData1788.coefficient158_179,
    output := OriginalRow227TriangleData1794.coefficient159_179, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_181, Icur := OriginalRow227TriangleData1788.coefficient158_180,
    output := OriginalRow227TriangleData1794.coefficient159_180, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_182, Icur := OriginalRow227TriangleData1788.coefficient158_181,
    output := OriginalRow227TriangleData1794.coefficient159_181, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_183, Icur := OriginalRow227TriangleData1788.coefficient158_182,
    output := OriginalRow227TriangleData1794.coefficient159_182, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_184, Icur := OriginalRow227TriangleData1788.coefficient158_183,
    output := OriginalRow227TriangleData1794.coefficient159_183, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_185, Icur := OriginalRow227TriangleData1788.coefficient158_184,
    output := OriginalRow227TriangleData1794.coefficient159_184, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_186, Icur := OriginalRow227TriangleData1788.coefficient158_185,
    output := OriginalRow227TriangleData1794.coefficient159_185, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_187, Icur := OriginalRow227TriangleData1788.coefficient158_186,
    output := OriginalRow227TriangleData1794.coefficient159_186, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1788.coefficient158_188, Icur := OriginalRow227TriangleData1788.coefficient158_187,
    output := OriginalRow227TriangleData1794.coefficient159_187, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_189, Icur := OriginalRow227TriangleData1788.coefficient158_188,
    output := OriginalRow227TriangleData1794.coefficient159_188, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root159,
    Inext := OriginalRow227TriangleData1789.coefficient158_190, Icur := OriginalRow227TriangleData1789.coefficient158_189,
    output := OriginalRow227TriangleData1794.coefficient159_189, hC := OriginalRow227TriangleRoots04.root159_pos, hAC := OriginalRow227TriangleRoots04.product159_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1778

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1778.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
