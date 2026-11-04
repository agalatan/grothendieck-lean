import Grothe.UpperChaos.OriginalRow227TriangleData0987
import Grothe.UpperChaos.OriginalRow227TriangleData0988
import Grothe.UpperChaos.OriginalRow227TriangleData0999
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0983
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_167, Icur := OriginalRow227TriangleData0987.coefficient70_166,
    output := OriginalRow227TriangleData0999.coefficient71_166, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_168, Icur := OriginalRow227TriangleData0987.coefficient70_167,
    output := OriginalRow227TriangleData0999.coefficient71_167, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_169, Icur := OriginalRow227TriangleData0987.coefficient70_168,
    output := OriginalRow227TriangleData0999.coefficient71_168, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_170, Icur := OriginalRow227TriangleData0987.coefficient70_169,
    output := OriginalRow227TriangleData0999.coefficient71_169, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_171, Icur := OriginalRow227TriangleData0987.coefficient70_170,
    output := OriginalRow227TriangleData0999.coefficient71_170, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_172, Icur := OriginalRow227TriangleData0987.coefficient70_171,
    output := OriginalRow227TriangleData0999.coefficient71_171, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_173, Icur := OriginalRow227TriangleData0987.coefficient70_172,
    output := OriginalRow227TriangleData0999.coefficient71_172, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_174, Icur := OriginalRow227TriangleData0987.coefficient70_173,
    output := OriginalRow227TriangleData0999.coefficient71_173, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_175, Icur := OriginalRow227TriangleData0987.coefficient70_174,
    output := OriginalRow227TriangleData0999.coefficient71_174, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_176, Icur := OriginalRow227TriangleData0987.coefficient70_175,
    output := OriginalRow227TriangleData0999.coefficient71_175, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_177, Icur := OriginalRow227TriangleData0987.coefficient70_176,
    output := OriginalRow227TriangleData0999.coefficient71_176, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_178, Icur := OriginalRow227TriangleData0987.coefficient70_177,
    output := OriginalRow227TriangleData0999.coefficient71_177, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_179, Icur := OriginalRow227TriangleData0987.coefficient70_178,
    output := OriginalRow227TriangleData0999.coefficient71_178, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_180, Icur := OriginalRow227TriangleData0987.coefficient70_179,
    output := OriginalRow227TriangleData0999.coefficient71_179, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_181, Icur := OriginalRow227TriangleData0987.coefficient70_180,
    output := OriginalRow227TriangleData0999.coefficient71_180, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_182, Icur := OriginalRow227TriangleData0987.coefficient70_181,
    output := OriginalRow227TriangleData0999.coefficient71_181, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_183, Icur := OriginalRow227TriangleData0987.coefficient70_182,
    output := OriginalRow227TriangleData0999.coefficient71_182, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_184, Icur := OriginalRow227TriangleData0987.coefficient70_183,
    output := OriginalRow227TriangleData0999.coefficient71_183, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_185, Icur := OriginalRow227TriangleData0987.coefficient70_184,
    output := OriginalRow227TriangleData0999.coefficient71_184, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_186, Icur := OriginalRow227TriangleData0987.coefficient70_185,
    output := OriginalRow227TriangleData0999.coefficient71_185, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_187, Icur := OriginalRow227TriangleData0987.coefficient70_186,
    output := OriginalRow227TriangleData0999.coefficient71_186, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_188, Icur := OriginalRow227TriangleData0987.coefficient70_187,
    output := OriginalRow227TriangleData0999.coefficient71_187, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_189, Icur := OriginalRow227TriangleData0987.coefficient70_188,
    output := OriginalRow227TriangleData0999.coefficient71_188, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_190, Icur := OriginalRow227TriangleData0987.coefficient70_189,
    output := OriginalRow227TriangleData0999.coefficient71_189, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_191, Icur := OriginalRow227TriangleData0987.coefficient70_190,
    output := OriginalRow227TriangleData0999.coefficient71_190, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_192, Icur := OriginalRow227TriangleData0987.coefficient70_191,
    output := OriginalRow227TriangleData0999.coefficient71_191, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_193, Icur := OriginalRow227TriangleData0987.coefficient70_192,
    output := OriginalRow227TriangleData0999.coefficient71_192, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_194, Icur := OriginalRow227TriangleData0987.coefficient70_193,
    output := OriginalRow227TriangleData0999.coefficient71_193, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_195, Icur := OriginalRow227TriangleData0987.coefficient70_194,
    output := OriginalRow227TriangleData0999.coefficient71_194, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0987.coefficient70_196, Icur := OriginalRow227TriangleData0987.coefficient70_195,
    output := OriginalRow227TriangleData0999.coefficient71_195, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0988.coefficient70_197, Icur := OriginalRow227TriangleData0987.coefficient70_196,
    output := OriginalRow227TriangleData0999.coefficient71_196, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots02.root71,
    Inext := OriginalRow227TriangleData0988.coefficient70_198, Icur := OriginalRow227TriangleData0988.coefficient70_197,
    output := OriginalRow227TriangleData0999.coefficient71_197, hC := OriginalRow227TriangleRoots02.root71_pos, hAC := OriginalRow227TriangleRoots02.product71_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0983

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0983.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
