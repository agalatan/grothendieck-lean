import Grothe.UpperChaos.OriginalRow227TriangleData0915
import Grothe.UpperChaos.OriginalRow227TriangleData0916
import Grothe.UpperChaos.OriginalRow227TriangleData0927
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0911
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_161, Icur := OriginalRow227TriangleData0915.coefficient64_160,
    output := OriginalRow227TriangleData0927.coefficient65_160, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_162, Icur := OriginalRow227TriangleData0915.coefficient64_161,
    output := OriginalRow227TriangleData0927.coefficient65_161, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_163, Icur := OriginalRow227TriangleData0915.coefficient64_162,
    output := OriginalRow227TriangleData0927.coefficient65_162, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_164, Icur := OriginalRow227TriangleData0915.coefficient64_163,
    output := OriginalRow227TriangleData0927.coefficient65_163, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_165, Icur := OriginalRow227TriangleData0915.coefficient64_164,
    output := OriginalRow227TriangleData0927.coefficient65_164, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_166, Icur := OriginalRow227TriangleData0915.coefficient64_165,
    output := OriginalRow227TriangleData0927.coefficient65_165, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_167, Icur := OriginalRow227TriangleData0915.coefficient64_166,
    output := OriginalRow227TriangleData0927.coefficient65_166, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_168, Icur := OriginalRow227TriangleData0915.coefficient64_167,
    output := OriginalRow227TriangleData0927.coefficient65_167, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_169, Icur := OriginalRow227TriangleData0915.coefficient64_168,
    output := OriginalRow227TriangleData0927.coefficient65_168, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_170, Icur := OriginalRow227TriangleData0915.coefficient64_169,
    output := OriginalRow227TriangleData0927.coefficient65_169, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_171, Icur := OriginalRow227TriangleData0915.coefficient64_170,
    output := OriginalRow227TriangleData0927.coefficient65_170, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_172, Icur := OriginalRow227TriangleData0915.coefficient64_171,
    output := OriginalRow227TriangleData0927.coefficient65_171, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_173, Icur := OriginalRow227TriangleData0915.coefficient64_172,
    output := OriginalRow227TriangleData0927.coefficient65_172, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_174, Icur := OriginalRow227TriangleData0915.coefficient64_173,
    output := OriginalRow227TriangleData0927.coefficient65_173, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_175, Icur := OriginalRow227TriangleData0915.coefficient64_174,
    output := OriginalRow227TriangleData0927.coefficient65_174, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_176, Icur := OriginalRow227TriangleData0915.coefficient64_175,
    output := OriginalRow227TriangleData0927.coefficient65_175, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_177, Icur := OriginalRow227TriangleData0915.coefficient64_176,
    output := OriginalRow227TriangleData0927.coefficient65_176, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_178, Icur := OriginalRow227TriangleData0915.coefficient64_177,
    output := OriginalRow227TriangleData0927.coefficient65_177, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_179, Icur := OriginalRow227TriangleData0915.coefficient64_178,
    output := OriginalRow227TriangleData0927.coefficient65_178, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_180, Icur := OriginalRow227TriangleData0915.coefficient64_179,
    output := OriginalRow227TriangleData0927.coefficient65_179, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_181, Icur := OriginalRow227TriangleData0915.coefficient64_180,
    output := OriginalRow227TriangleData0927.coefficient65_180, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_182, Icur := OriginalRow227TriangleData0915.coefficient64_181,
    output := OriginalRow227TriangleData0927.coefficient65_181, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_183, Icur := OriginalRow227TriangleData0915.coefficient64_182,
    output := OriginalRow227TriangleData0927.coefficient65_182, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_184, Icur := OriginalRow227TriangleData0915.coefficient64_183,
    output := OriginalRow227TriangleData0927.coefficient65_183, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_185, Icur := OriginalRow227TriangleData0915.coefficient64_184,
    output := OriginalRow227TriangleData0927.coefficient65_184, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_186, Icur := OriginalRow227TriangleData0915.coefficient64_185,
    output := OriginalRow227TriangleData0927.coefficient65_185, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_187, Icur := OriginalRow227TriangleData0915.coefficient64_186,
    output := OriginalRow227TriangleData0927.coefficient65_186, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_188, Icur := OriginalRow227TriangleData0915.coefficient64_187,
    output := OriginalRow227TriangleData0927.coefficient65_187, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_189, Icur := OriginalRow227TriangleData0915.coefficient64_188,
    output := OriginalRow227TriangleData0927.coefficient65_188, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0915.coefficient64_190, Icur := OriginalRow227TriangleData0915.coefficient64_189,
    output := OriginalRow227TriangleData0927.coefficient65_189, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0916.coefficient64_191, Icur := OriginalRow227TriangleData0915.coefficient64_190,
    output := OriginalRow227TriangleData0927.coefficient65_190, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root65,
    Inext := OriginalRow227TriangleData0916.coefficient64_192, Icur := OriginalRow227TriangleData0916.coefficient64_191,
    output := OriginalRow227TriangleData0927.coefficient65_191, hC := OriginalRow227TriangleRoots02.root65_pos, hAC := OriginalRow227TriangleRoots02.product65_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0911

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0911.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
