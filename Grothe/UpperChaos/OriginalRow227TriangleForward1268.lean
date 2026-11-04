import Grothe.UpperChaos.OriginalRow227TriangleData1274
import Grothe.UpperChaos.OriginalRow227TriangleData1275
import Grothe.UpperChaos.OriginalRow227TriangleData1284
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1268
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_161, Icur := OriginalRow227TriangleData1274.coefficient96_160,
    output := OriginalRow227TriangleData1284.coefficient97_160, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_162, Icur := OriginalRow227TriangleData1274.coefficient96_161,
    output := OriginalRow227TriangleData1284.coefficient97_161, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_163, Icur := OriginalRow227TriangleData1274.coefficient96_162,
    output := OriginalRow227TriangleData1284.coefficient97_162, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_164, Icur := OriginalRow227TriangleData1274.coefficient96_163,
    output := OriginalRow227TriangleData1284.coefficient97_163, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_165, Icur := OriginalRow227TriangleData1274.coefficient96_164,
    output := OriginalRow227TriangleData1284.coefficient97_164, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_166, Icur := OriginalRow227TriangleData1274.coefficient96_165,
    output := OriginalRow227TriangleData1284.coefficient97_165, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_167, Icur := OriginalRow227TriangleData1274.coefficient96_166,
    output := OriginalRow227TriangleData1284.coefficient97_166, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_168, Icur := OriginalRow227TriangleData1274.coefficient96_167,
    output := OriginalRow227TriangleData1284.coefficient97_167, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_169, Icur := OriginalRow227TriangleData1274.coefficient96_168,
    output := OriginalRow227TriangleData1284.coefficient97_168, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_170, Icur := OriginalRow227TriangleData1274.coefficient96_169,
    output := OriginalRow227TriangleData1284.coefficient97_169, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_171, Icur := OriginalRow227TriangleData1274.coefficient96_170,
    output := OriginalRow227TriangleData1284.coefficient97_170, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_172, Icur := OriginalRow227TriangleData1274.coefficient96_171,
    output := OriginalRow227TriangleData1284.coefficient97_171, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_173, Icur := OriginalRow227TriangleData1274.coefficient96_172,
    output := OriginalRow227TriangleData1284.coefficient97_172, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_174, Icur := OriginalRow227TriangleData1274.coefficient96_173,
    output := OriginalRow227TriangleData1284.coefficient97_173, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_175, Icur := OriginalRow227TriangleData1274.coefficient96_174,
    output := OriginalRow227TriangleData1284.coefficient97_174, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_176, Icur := OriginalRow227TriangleData1274.coefficient96_175,
    output := OriginalRow227TriangleData1284.coefficient97_175, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_177, Icur := OriginalRow227TriangleData1274.coefficient96_176,
    output := OriginalRow227TriangleData1284.coefficient97_176, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_178, Icur := OriginalRow227TriangleData1274.coefficient96_177,
    output := OriginalRow227TriangleData1284.coefficient97_177, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_179, Icur := OriginalRow227TriangleData1274.coefficient96_178,
    output := OriginalRow227TriangleData1284.coefficient97_178, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_180, Icur := OriginalRow227TriangleData1274.coefficient96_179,
    output := OriginalRow227TriangleData1284.coefficient97_179, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_181, Icur := OriginalRow227TriangleData1274.coefficient96_180,
    output := OriginalRow227TriangleData1284.coefficient97_180, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_182, Icur := OriginalRow227TriangleData1274.coefficient96_181,
    output := OriginalRow227TriangleData1284.coefficient97_181, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_183, Icur := OriginalRow227TriangleData1274.coefficient96_182,
    output := OriginalRow227TriangleData1284.coefficient97_182, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_184, Icur := OriginalRow227TriangleData1274.coefficient96_183,
    output := OriginalRow227TriangleData1284.coefficient97_183, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_185, Icur := OriginalRow227TriangleData1274.coefficient96_184,
    output := OriginalRow227TriangleData1284.coefficient97_184, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_186, Icur := OriginalRow227TriangleData1274.coefficient96_185,
    output := OriginalRow227TriangleData1284.coefficient97_185, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_187, Icur := OriginalRow227TriangleData1274.coefficient96_186,
    output := OriginalRow227TriangleData1284.coefficient97_186, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_188, Icur := OriginalRow227TriangleData1274.coefficient96_187,
    output := OriginalRow227TriangleData1284.coefficient97_187, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_189, Icur := OriginalRow227TriangleData1274.coefficient96_188,
    output := OriginalRow227TriangleData1284.coefficient97_188, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1274.coefficient96_190, Icur := OriginalRow227TriangleData1274.coefficient96_189,
    output := OriginalRow227TriangleData1284.coefficient97_189, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1275.coefficient96_191, Icur := OriginalRow227TriangleData1274.coefficient96_190,
    output := OriginalRow227TriangleData1284.coefficient97_190, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root97,
    Inext := OriginalRow227TriangleData1275.coefficient96_192, Icur := OriginalRow227TriangleData1275.coefficient96_191,
    output := OriginalRow227TriangleData1284.coefficient97_191, hC := OriginalRow227TriangleRoots03.root97_pos, hAC := OriginalRow227TriangleRoots03.product97_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1268

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1268.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
