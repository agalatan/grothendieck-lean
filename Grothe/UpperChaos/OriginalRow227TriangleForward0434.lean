import Grothe.UpperChaos.OriginalRow227TriangleData0436
import Grothe.UpperChaos.OriginalRow227TriangleData0437
import Grothe.UpperChaos.OriginalRow227TriangleData0450
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0434
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_157, Icur := OriginalRow227TriangleData0436.coefficient28_156,
    output := OriginalRow227TriangleData0450.coefficient29_156, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_158, Icur := OriginalRow227TriangleData0436.coefficient28_157,
    output := OriginalRow227TriangleData0450.coefficient29_157, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_159, Icur := OriginalRow227TriangleData0436.coefficient28_158,
    output := OriginalRow227TriangleData0450.coefficient29_158, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_160, Icur := OriginalRow227TriangleData0436.coefficient28_159,
    output := OriginalRow227TriangleData0450.coefficient29_159, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_161, Icur := OriginalRow227TriangleData0436.coefficient28_160,
    output := OriginalRow227TriangleData0450.coefficient29_160, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_162, Icur := OriginalRow227TriangleData0436.coefficient28_161,
    output := OriginalRow227TriangleData0450.coefficient29_161, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_163, Icur := OriginalRow227TriangleData0436.coefficient28_162,
    output := OriginalRow227TriangleData0450.coefficient29_162, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_164, Icur := OriginalRow227TriangleData0436.coefficient28_163,
    output := OriginalRow227TriangleData0450.coefficient29_163, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_165, Icur := OriginalRow227TriangleData0436.coefficient28_164,
    output := OriginalRow227TriangleData0450.coefficient29_164, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_166, Icur := OriginalRow227TriangleData0436.coefficient28_165,
    output := OriginalRow227TriangleData0450.coefficient29_165, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_167, Icur := OriginalRow227TriangleData0436.coefficient28_166,
    output := OriginalRow227TriangleData0450.coefficient29_166, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_168, Icur := OriginalRow227TriangleData0436.coefficient28_167,
    output := OriginalRow227TriangleData0450.coefficient29_167, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_169, Icur := OriginalRow227TriangleData0436.coefficient28_168,
    output := OriginalRow227TriangleData0450.coefficient29_168, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_170, Icur := OriginalRow227TriangleData0436.coefficient28_169,
    output := OriginalRow227TriangleData0450.coefficient29_169, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_171, Icur := OriginalRow227TriangleData0436.coefficient28_170,
    output := OriginalRow227TriangleData0450.coefficient29_170, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_172, Icur := OriginalRow227TriangleData0436.coefficient28_171,
    output := OriginalRow227TriangleData0450.coefficient29_171, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_173, Icur := OriginalRow227TriangleData0436.coefficient28_172,
    output := OriginalRow227TriangleData0450.coefficient29_172, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_174, Icur := OriginalRow227TriangleData0436.coefficient28_173,
    output := OriginalRow227TriangleData0450.coefficient29_173, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_175, Icur := OriginalRow227TriangleData0436.coefficient28_174,
    output := OriginalRow227TriangleData0450.coefficient29_174, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_176, Icur := OriginalRow227TriangleData0436.coefficient28_175,
    output := OriginalRow227TriangleData0450.coefficient29_175, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_177, Icur := OriginalRow227TriangleData0436.coefficient28_176,
    output := OriginalRow227TriangleData0450.coefficient29_176, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_178, Icur := OriginalRow227TriangleData0436.coefficient28_177,
    output := OriginalRow227TriangleData0450.coefficient29_177, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_179, Icur := OriginalRow227TriangleData0436.coefficient28_178,
    output := OriginalRow227TriangleData0450.coefficient29_178, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_180, Icur := OriginalRow227TriangleData0436.coefficient28_179,
    output := OriginalRow227TriangleData0450.coefficient29_179, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_181, Icur := OriginalRow227TriangleData0436.coefficient28_180,
    output := OriginalRow227TriangleData0450.coefficient29_180, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_182, Icur := OriginalRow227TriangleData0436.coefficient28_181,
    output := OriginalRow227TriangleData0450.coefficient29_181, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_183, Icur := OriginalRow227TriangleData0436.coefficient28_182,
    output := OriginalRow227TriangleData0450.coefficient29_182, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_184, Icur := OriginalRow227TriangleData0436.coefficient28_183,
    output := OriginalRow227TriangleData0450.coefficient29_183, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_185, Icur := OriginalRow227TriangleData0436.coefficient28_184,
    output := OriginalRow227TriangleData0450.coefficient29_184, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0436.coefficient28_186, Icur := OriginalRow227TriangleData0436.coefficient28_185,
    output := OriginalRow227TriangleData0450.coefficient29_185, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_187, Icur := OriginalRow227TriangleData0436.coefficient28_186,
    output := OriginalRow227TriangleData0450.coefficient29_186, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots00.root29,
    Inext := OriginalRow227TriangleData0437.coefficient28_188, Icur := OriginalRow227TriangleData0437.coefficient28_187,
    output := OriginalRow227TriangleData0450.coefficient29_187, hC := OriginalRow227TriangleRoots00.root29_pos, hAC := OriginalRow227TriangleRoots00.product29_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0434

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0434.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
