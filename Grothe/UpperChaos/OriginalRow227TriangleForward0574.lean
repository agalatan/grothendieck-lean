import Grothe.UpperChaos.OriginalRow227TriangleData0576
import Grothe.UpperChaos.OriginalRow227TriangleData0577
import Grothe.UpperChaos.OriginalRow227TriangleData0590
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0574
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_167, Icur := OriginalRow227TriangleData0576.coefficient38_166,
    output := OriginalRow227TriangleData0590.coefficient39_166, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_168, Icur := OriginalRow227TriangleData0576.coefficient38_167,
    output := OriginalRow227TriangleData0590.coefficient39_167, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_169, Icur := OriginalRow227TriangleData0576.coefficient38_168,
    output := OriginalRow227TriangleData0590.coefficient39_168, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_170, Icur := OriginalRow227TriangleData0576.coefficient38_169,
    output := OriginalRow227TriangleData0590.coefficient39_169, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_171, Icur := OriginalRow227TriangleData0576.coefficient38_170,
    output := OriginalRow227TriangleData0590.coefficient39_170, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_172, Icur := OriginalRow227TriangleData0576.coefficient38_171,
    output := OriginalRow227TriangleData0590.coefficient39_171, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_173, Icur := OriginalRow227TriangleData0576.coefficient38_172,
    output := OriginalRow227TriangleData0590.coefficient39_172, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_174, Icur := OriginalRow227TriangleData0576.coefficient38_173,
    output := OriginalRow227TriangleData0590.coefficient39_173, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_175, Icur := OriginalRow227TriangleData0576.coefficient38_174,
    output := OriginalRow227TriangleData0590.coefficient39_174, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_176, Icur := OriginalRow227TriangleData0576.coefficient38_175,
    output := OriginalRow227TriangleData0590.coefficient39_175, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_177, Icur := OriginalRow227TriangleData0576.coefficient38_176,
    output := OriginalRow227TriangleData0590.coefficient39_176, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_178, Icur := OriginalRow227TriangleData0576.coefficient38_177,
    output := OriginalRow227TriangleData0590.coefficient39_177, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_179, Icur := OriginalRow227TriangleData0576.coefficient38_178,
    output := OriginalRow227TriangleData0590.coefficient39_178, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_180, Icur := OriginalRow227TriangleData0576.coefficient38_179,
    output := OriginalRow227TriangleData0590.coefficient39_179, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_181, Icur := OriginalRow227TriangleData0576.coefficient38_180,
    output := OriginalRow227TriangleData0590.coefficient39_180, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_182, Icur := OriginalRow227TriangleData0576.coefficient38_181,
    output := OriginalRow227TriangleData0590.coefficient39_181, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_183, Icur := OriginalRow227TriangleData0576.coefficient38_182,
    output := OriginalRow227TriangleData0590.coefficient39_182, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_184, Icur := OriginalRow227TriangleData0576.coefficient38_183,
    output := OriginalRow227TriangleData0590.coefficient39_183, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_185, Icur := OriginalRow227TriangleData0576.coefficient38_184,
    output := OriginalRow227TriangleData0590.coefficient39_184, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_186, Icur := OriginalRow227TriangleData0576.coefficient38_185,
    output := OriginalRow227TriangleData0590.coefficient39_185, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_187, Icur := OriginalRow227TriangleData0576.coefficient38_186,
    output := OriginalRow227TriangleData0590.coefficient39_186, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_188, Icur := OriginalRow227TriangleData0576.coefficient38_187,
    output := OriginalRow227TriangleData0590.coefficient39_187, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_189, Icur := OriginalRow227TriangleData0576.coefficient38_188,
    output := OriginalRow227TriangleData0590.coefficient39_188, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_190, Icur := OriginalRow227TriangleData0576.coefficient38_189,
    output := OriginalRow227TriangleData0590.coefficient39_189, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_191, Icur := OriginalRow227TriangleData0576.coefficient38_190,
    output := OriginalRow227TriangleData0590.coefficient39_190, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_192, Icur := OriginalRow227TriangleData0576.coefficient38_191,
    output := OriginalRow227TriangleData0590.coefficient39_191, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_193, Icur := OriginalRow227TriangleData0576.coefficient38_192,
    output := OriginalRow227TriangleData0590.coefficient39_192, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_194, Icur := OriginalRow227TriangleData0576.coefficient38_193,
    output := OriginalRow227TriangleData0590.coefficient39_193, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_195, Icur := OriginalRow227TriangleData0576.coefficient38_194,
    output := OriginalRow227TriangleData0590.coefficient39_194, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0576.coefficient38_196, Icur := OriginalRow227TriangleData0576.coefficient38_195,
    output := OriginalRow227TriangleData0590.coefficient39_195, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0577.coefficient38_197, Icur := OriginalRow227TriangleData0576.coefficient38_196,
    output := OriginalRow227TriangleData0590.coefficient39_196, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots01.root39,
    Inext := OriginalRow227TriangleData0577.coefficient38_198, Icur := OriginalRow227TriangleData0577.coefficient38_197,
    output := OriginalRow227TriangleData0590.coefficient39_197, hC := OriginalRow227TriangleRoots01.root39_pos, hAC := OriginalRow227TriangleRoots01.product39_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0574

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0574.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
