import Grothe.UpperChaos.OriginalRow227TriangleData1776
import Grothe.UpperChaos.OriginalRow227TriangleData1777
import Grothe.UpperChaos.OriginalRow227TriangleData1782
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1766
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_157, Icur := OriginalRow227TriangleData1776.coefficient156_156,
    output := OriginalRow227TriangleData1782.coefficient157_156, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_158, Icur := OriginalRow227TriangleData1776.coefficient156_157,
    output := OriginalRow227TriangleData1782.coefficient157_157, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_159, Icur := OriginalRow227TriangleData1776.coefficient156_158,
    output := OriginalRow227TriangleData1782.coefficient157_158, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_160, Icur := OriginalRow227TriangleData1776.coefficient156_159,
    output := OriginalRow227TriangleData1782.coefficient157_159, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_161, Icur := OriginalRow227TriangleData1776.coefficient156_160,
    output := OriginalRow227TriangleData1782.coefficient157_160, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_162, Icur := OriginalRow227TriangleData1776.coefficient156_161,
    output := OriginalRow227TriangleData1782.coefficient157_161, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_163, Icur := OriginalRow227TriangleData1776.coefficient156_162,
    output := OriginalRow227TriangleData1782.coefficient157_162, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_164, Icur := OriginalRow227TriangleData1776.coefficient156_163,
    output := OriginalRow227TriangleData1782.coefficient157_163, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_165, Icur := OriginalRow227TriangleData1776.coefficient156_164,
    output := OriginalRow227TriangleData1782.coefficient157_164, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_166, Icur := OriginalRow227TriangleData1776.coefficient156_165,
    output := OriginalRow227TriangleData1782.coefficient157_165, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_167, Icur := OriginalRow227TriangleData1776.coefficient156_166,
    output := OriginalRow227TriangleData1782.coefficient157_166, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_168, Icur := OriginalRow227TriangleData1776.coefficient156_167,
    output := OriginalRow227TriangleData1782.coefficient157_167, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_169, Icur := OriginalRow227TriangleData1776.coefficient156_168,
    output := OriginalRow227TriangleData1782.coefficient157_168, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_170, Icur := OriginalRow227TriangleData1776.coefficient156_169,
    output := OriginalRow227TriangleData1782.coefficient157_169, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_171, Icur := OriginalRow227TriangleData1776.coefficient156_170,
    output := OriginalRow227TriangleData1782.coefficient157_170, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_172, Icur := OriginalRow227TriangleData1776.coefficient156_171,
    output := OriginalRow227TriangleData1782.coefficient157_171, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_173, Icur := OriginalRow227TriangleData1776.coefficient156_172,
    output := OriginalRow227TriangleData1782.coefficient157_172, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_174, Icur := OriginalRow227TriangleData1776.coefficient156_173,
    output := OriginalRow227TriangleData1782.coefficient157_173, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_175, Icur := OriginalRow227TriangleData1776.coefficient156_174,
    output := OriginalRow227TriangleData1782.coefficient157_174, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_176, Icur := OriginalRow227TriangleData1776.coefficient156_175,
    output := OriginalRow227TriangleData1782.coefficient157_175, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_177, Icur := OriginalRow227TriangleData1776.coefficient156_176,
    output := OriginalRow227TriangleData1782.coefficient157_176, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_178, Icur := OriginalRow227TriangleData1776.coefficient156_177,
    output := OriginalRow227TriangleData1782.coefficient157_177, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_179, Icur := OriginalRow227TriangleData1776.coefficient156_178,
    output := OriginalRow227TriangleData1782.coefficient157_178, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_180, Icur := OriginalRow227TriangleData1776.coefficient156_179,
    output := OriginalRow227TriangleData1782.coefficient157_179, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_181, Icur := OriginalRow227TriangleData1776.coefficient156_180,
    output := OriginalRow227TriangleData1782.coefficient157_180, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_182, Icur := OriginalRow227TriangleData1776.coefficient156_181,
    output := OriginalRow227TriangleData1782.coefficient157_181, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_183, Icur := OriginalRow227TriangleData1776.coefficient156_182,
    output := OriginalRow227TriangleData1782.coefficient157_182, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_184, Icur := OriginalRow227TriangleData1776.coefficient156_183,
    output := OriginalRow227TriangleData1782.coefficient157_183, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_185, Icur := OriginalRow227TriangleData1776.coefficient156_184,
    output := OriginalRow227TriangleData1782.coefficient157_184, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1776.coefficient156_186, Icur := OriginalRow227TriangleData1776.coefficient156_185,
    output := OriginalRow227TriangleData1782.coefficient157_185, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1777.coefficient156_187, Icur := OriginalRow227TriangleData1776.coefficient156_186,
    output := OriginalRow227TriangleData1782.coefficient157_186, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root157,
    Inext := OriginalRow227TriangleData1777.coefficient156_188, Icur := OriginalRow227TriangleData1777.coefficient156_187,
    output := OriginalRow227TriangleData1782.coefficient157_187, hC := OriginalRow227TriangleRoots04.root157_pos, hAC := OriginalRow227TriangleRoots04.product157_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1766

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1766.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
