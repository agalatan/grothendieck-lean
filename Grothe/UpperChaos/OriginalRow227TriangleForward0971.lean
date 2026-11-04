import Grothe.UpperChaos.OriginalRow227TriangleData0975
import Grothe.UpperChaos.OriginalRow227TriangleData0976
import Grothe.UpperChaos.OriginalRow227TriangleData0987
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0971
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_166, Icur := OriginalRow227TriangleData0975.coefficient69_165,
    output := OriginalRow227TriangleData0987.coefficient70_165, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_167, Icur := OriginalRow227TriangleData0975.coefficient69_166,
    output := OriginalRow227TriangleData0987.coefficient70_166, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_168, Icur := OriginalRow227TriangleData0975.coefficient69_167,
    output := OriginalRow227TriangleData0987.coefficient70_167, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_169, Icur := OriginalRow227TriangleData0975.coefficient69_168,
    output := OriginalRow227TriangleData0987.coefficient70_168, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_170, Icur := OriginalRow227TriangleData0975.coefficient69_169,
    output := OriginalRow227TriangleData0987.coefficient70_169, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_171, Icur := OriginalRow227TriangleData0975.coefficient69_170,
    output := OriginalRow227TriangleData0987.coefficient70_170, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_172, Icur := OriginalRow227TriangleData0975.coefficient69_171,
    output := OriginalRow227TriangleData0987.coefficient70_171, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_173, Icur := OriginalRow227TriangleData0975.coefficient69_172,
    output := OriginalRow227TriangleData0987.coefficient70_172, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_174, Icur := OriginalRow227TriangleData0975.coefficient69_173,
    output := OriginalRow227TriangleData0987.coefficient70_173, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_175, Icur := OriginalRow227TriangleData0975.coefficient69_174,
    output := OriginalRow227TriangleData0987.coefficient70_174, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_176, Icur := OriginalRow227TriangleData0975.coefficient69_175,
    output := OriginalRow227TriangleData0987.coefficient70_175, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_177, Icur := OriginalRow227TriangleData0975.coefficient69_176,
    output := OriginalRow227TriangleData0987.coefficient70_176, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_178, Icur := OriginalRow227TriangleData0975.coefficient69_177,
    output := OriginalRow227TriangleData0987.coefficient70_177, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_179, Icur := OriginalRow227TriangleData0975.coefficient69_178,
    output := OriginalRow227TriangleData0987.coefficient70_178, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_180, Icur := OriginalRow227TriangleData0975.coefficient69_179,
    output := OriginalRow227TriangleData0987.coefficient70_179, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_181, Icur := OriginalRow227TriangleData0975.coefficient69_180,
    output := OriginalRow227TriangleData0987.coefficient70_180, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_182, Icur := OriginalRow227TriangleData0975.coefficient69_181,
    output := OriginalRow227TriangleData0987.coefficient70_181, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_183, Icur := OriginalRow227TriangleData0975.coefficient69_182,
    output := OriginalRow227TriangleData0987.coefficient70_182, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_184, Icur := OriginalRow227TriangleData0975.coefficient69_183,
    output := OriginalRow227TriangleData0987.coefficient70_183, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_185, Icur := OriginalRow227TriangleData0975.coefficient69_184,
    output := OriginalRow227TriangleData0987.coefficient70_184, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_186, Icur := OriginalRow227TriangleData0975.coefficient69_185,
    output := OriginalRow227TriangleData0987.coefficient70_185, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_187, Icur := OriginalRow227TriangleData0975.coefficient69_186,
    output := OriginalRow227TriangleData0987.coefficient70_186, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_188, Icur := OriginalRow227TriangleData0975.coefficient69_187,
    output := OriginalRow227TriangleData0987.coefficient70_187, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_189, Icur := OriginalRow227TriangleData0975.coefficient69_188,
    output := OriginalRow227TriangleData0987.coefficient70_188, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_190, Icur := OriginalRow227TriangleData0975.coefficient69_189,
    output := OriginalRow227TriangleData0987.coefficient70_189, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_191, Icur := OriginalRow227TriangleData0975.coefficient69_190,
    output := OriginalRow227TriangleData0987.coefficient70_190, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_192, Icur := OriginalRow227TriangleData0975.coefficient69_191,
    output := OriginalRow227TriangleData0987.coefficient70_191, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_193, Icur := OriginalRow227TriangleData0975.coefficient69_192,
    output := OriginalRow227TriangleData0987.coefficient70_192, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_194, Icur := OriginalRow227TriangleData0975.coefficient69_193,
    output := OriginalRow227TriangleData0987.coefficient70_193, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0975.coefficient69_195, Icur := OriginalRow227TriangleData0975.coefficient69_194,
    output := OriginalRow227TriangleData0987.coefficient70_194, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_196, Icur := OriginalRow227TriangleData0975.coefficient69_195,
    output := OriginalRow227TriangleData0987.coefficient70_195, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root70,
    Inext := OriginalRow227TriangleData0976.coefficient69_197, Icur := OriginalRow227TriangleData0976.coefficient69_196,
    output := OriginalRow227TriangleData0987.coefficient70_196, hC := OriginalRow227TriangleRoots02.root70_pos, hAC := OriginalRow227TriangleRoots02.product70_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0971

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0971.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
