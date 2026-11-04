import Grothe.UpperChaos.OriginalRow227TriangleData0316
import Grothe.UpperChaos.OriginalRow227TriangleData0317
import Grothe.UpperChaos.OriginalRow227TriangleData0331
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0315
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 129, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_149, Icur := OriginalRow227TriangleData0316.coefficient20_148,
    output := OriginalRow227TriangleData0331.coefficient21_148, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 130, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_150, Icur := OriginalRow227TriangleData0316.coefficient20_149,
    output := OriginalRow227TriangleData0331.coefficient21_149, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 131, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_151, Icur := OriginalRow227TriangleData0316.coefficient20_150,
    output := OriginalRow227TriangleData0331.coefficient21_150, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 132, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_152, Icur := OriginalRow227TriangleData0316.coefficient20_151,
    output := OriginalRow227TriangleData0331.coefficient21_151, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 133, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_153, Icur := OriginalRow227TriangleData0316.coefficient20_152,
    output := OriginalRow227TriangleData0331.coefficient21_152, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 134, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_154, Icur := OriginalRow227TriangleData0316.coefficient20_153,
    output := OriginalRow227TriangleData0331.coefficient21_153, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 135, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_155, Icur := OriginalRow227TriangleData0316.coefficient20_154,
    output := OriginalRow227TriangleData0331.coefficient21_154, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 136, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_156, Icur := OriginalRow227TriangleData0316.coefficient20_155,
    output := OriginalRow227TriangleData0331.coefficient21_155, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 137, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_157, Icur := OriginalRow227TriangleData0316.coefficient20_156,
    output := OriginalRow227TriangleData0331.coefficient21_156, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 138, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_158, Icur := OriginalRow227TriangleData0316.coefficient20_157,
    output := OriginalRow227TriangleData0331.coefficient21_157, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 139, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_159, Icur := OriginalRow227TriangleData0316.coefficient20_158,
    output := OriginalRow227TriangleData0331.coefficient21_158, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 140, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_160, Icur := OriginalRow227TriangleData0316.coefficient20_159,
    output := OriginalRow227TriangleData0331.coefficient21_159, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 141, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_161, Icur := OriginalRow227TriangleData0316.coefficient20_160,
    output := OriginalRow227TriangleData0331.coefficient21_160, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 142, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_162, Icur := OriginalRow227TriangleData0316.coefficient20_161,
    output := OriginalRow227TriangleData0331.coefficient21_161, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 143, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_163, Icur := OriginalRow227TriangleData0316.coefficient20_162,
    output := OriginalRow227TriangleData0331.coefficient21_162, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 144, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_164, Icur := OriginalRow227TriangleData0316.coefficient20_163,
    output := OriginalRow227TriangleData0331.coefficient21_163, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 145, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_165, Icur := OriginalRow227TriangleData0316.coefficient20_164,
    output := OriginalRow227TriangleData0331.coefficient21_164, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 146, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_166, Icur := OriginalRow227TriangleData0316.coefficient20_165,
    output := OriginalRow227TriangleData0331.coefficient21_165, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 147, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_167, Icur := OriginalRow227TriangleData0316.coefficient20_166,
    output := OriginalRow227TriangleData0331.coefficient21_166, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 148, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_168, Icur := OriginalRow227TriangleData0316.coefficient20_167,
    output := OriginalRow227TriangleData0331.coefficient21_167, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 149, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_169, Icur := OriginalRow227TriangleData0316.coefficient20_168,
    output := OriginalRow227TriangleData0331.coefficient21_168, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 150, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_170, Icur := OriginalRow227TriangleData0316.coefficient20_169,
    output := OriginalRow227TriangleData0331.coefficient21_169, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 151, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_171, Icur := OriginalRow227TriangleData0316.coefficient20_170,
    output := OriginalRow227TriangleData0331.coefficient21_170, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 152, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_172, Icur := OriginalRow227TriangleData0316.coefficient20_171,
    output := OriginalRow227TriangleData0331.coefficient21_171, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 153, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_173, Icur := OriginalRow227TriangleData0316.coefficient20_172,
    output := OriginalRow227TriangleData0331.coefficient21_172, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 154, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_174, Icur := OriginalRow227TriangleData0316.coefficient20_173,
    output := OriginalRow227TriangleData0331.coefficient21_173, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 155, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_175, Icur := OriginalRow227TriangleData0316.coefficient20_174,
    output := OriginalRow227TriangleData0331.coefficient21_174, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 156, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_176, Icur := OriginalRow227TriangleData0316.coefficient20_175,
    output := OriginalRow227TriangleData0331.coefficient21_175, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 157, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_177, Icur := OriginalRow227TriangleData0316.coefficient20_176,
    output := OriginalRow227TriangleData0331.coefficient21_176, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 158, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0316.coefficient20_178, Icur := OriginalRow227TriangleData0316.coefficient20_177,
    output := OriginalRow227TriangleData0331.coefficient21_177, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 159, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_179, Icur := OriginalRow227TriangleData0316.coefficient20_178,
    output := OriginalRow227TriangleData0331.coefficient21_178, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 160, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0317.coefficient20_180, Icur := OriginalRow227TriangleData0317.coefficient20_179,
    output := OriginalRow227TriangleData0331.coefficient21_179, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0315

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0315.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
