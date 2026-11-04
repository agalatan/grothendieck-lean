import Grothe.UpperChaos.OriginalRow227TriangleData1201
import Grothe.UpperChaos.OriginalRow227TriangleData1202
import Grothe.UpperChaos.OriginalRow227TriangleData1212
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1196
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_154, Icur := OriginalRow227TriangleData1201.coefficient89_153,
    output := OriginalRow227TriangleData1212.coefficient90_153, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_155, Icur := OriginalRow227TriangleData1201.coefficient89_154,
    output := OriginalRow227TriangleData1212.coefficient90_154, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_156, Icur := OriginalRow227TriangleData1201.coefficient89_155,
    output := OriginalRow227TriangleData1212.coefficient90_155, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_157, Icur := OriginalRow227TriangleData1201.coefficient89_156,
    output := OriginalRow227TriangleData1212.coefficient90_156, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_158, Icur := OriginalRow227TriangleData1201.coefficient89_157,
    output := OriginalRow227TriangleData1212.coefficient90_157, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_159, Icur := OriginalRow227TriangleData1201.coefficient89_158,
    output := OriginalRow227TriangleData1212.coefficient90_158, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_160, Icur := OriginalRow227TriangleData1201.coefficient89_159,
    output := OriginalRow227TriangleData1212.coefficient90_159, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_161, Icur := OriginalRow227TriangleData1201.coefficient89_160,
    output := OriginalRow227TriangleData1212.coefficient90_160, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_162, Icur := OriginalRow227TriangleData1201.coefficient89_161,
    output := OriginalRow227TriangleData1212.coefficient90_161, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_163, Icur := OriginalRow227TriangleData1201.coefficient89_162,
    output := OriginalRow227TriangleData1212.coefficient90_162, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_164, Icur := OriginalRow227TriangleData1201.coefficient89_163,
    output := OriginalRow227TriangleData1212.coefficient90_163, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_165, Icur := OriginalRow227TriangleData1201.coefficient89_164,
    output := OriginalRow227TriangleData1212.coefficient90_164, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_166, Icur := OriginalRow227TriangleData1201.coefficient89_165,
    output := OriginalRow227TriangleData1212.coefficient90_165, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_167, Icur := OriginalRow227TriangleData1201.coefficient89_166,
    output := OriginalRow227TriangleData1212.coefficient90_166, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_168, Icur := OriginalRow227TriangleData1201.coefficient89_167,
    output := OriginalRow227TriangleData1212.coefficient90_167, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_169, Icur := OriginalRow227TriangleData1201.coefficient89_168,
    output := OriginalRow227TriangleData1212.coefficient90_168, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_170, Icur := OriginalRow227TriangleData1201.coefficient89_169,
    output := OriginalRow227TriangleData1212.coefficient90_169, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_171, Icur := OriginalRow227TriangleData1201.coefficient89_170,
    output := OriginalRow227TriangleData1212.coefficient90_170, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_172, Icur := OriginalRow227TriangleData1201.coefficient89_171,
    output := OriginalRow227TriangleData1212.coefficient90_171, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_173, Icur := OriginalRow227TriangleData1201.coefficient89_172,
    output := OriginalRow227TriangleData1212.coefficient90_172, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_174, Icur := OriginalRow227TriangleData1201.coefficient89_173,
    output := OriginalRow227TriangleData1212.coefficient90_173, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_175, Icur := OriginalRow227TriangleData1201.coefficient89_174,
    output := OriginalRow227TriangleData1212.coefficient90_174, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_176, Icur := OriginalRow227TriangleData1201.coefficient89_175,
    output := OriginalRow227TriangleData1212.coefficient90_175, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_177, Icur := OriginalRow227TriangleData1201.coefficient89_176,
    output := OriginalRow227TriangleData1212.coefficient90_176, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_178, Icur := OriginalRow227TriangleData1201.coefficient89_177,
    output := OriginalRow227TriangleData1212.coefficient90_177, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_179, Icur := OriginalRow227TriangleData1201.coefficient89_178,
    output := OriginalRow227TriangleData1212.coefficient90_178, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_180, Icur := OriginalRow227TriangleData1201.coefficient89_179,
    output := OriginalRow227TriangleData1212.coefficient90_179, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_181, Icur := OriginalRow227TriangleData1201.coefficient89_180,
    output := OriginalRow227TriangleData1212.coefficient90_180, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_182, Icur := OriginalRow227TriangleData1201.coefficient89_181,
    output := OriginalRow227TriangleData1212.coefficient90_181, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1201.coefficient89_183, Icur := OriginalRow227TriangleData1201.coefficient89_182,
    output := OriginalRow227TriangleData1212.coefficient90_182, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1202.coefficient89_184, Icur := OriginalRow227TriangleData1201.coefficient89_183,
    output := OriginalRow227TriangleData1212.coefficient90_183, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1202.coefficient89_185, Icur := OriginalRow227TriangleData1202.coefficient89_184,
    output := OriginalRow227TriangleData1212.coefficient90_184, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1196

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1196.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
