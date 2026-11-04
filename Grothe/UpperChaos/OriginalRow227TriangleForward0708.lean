import Grothe.UpperChaos.OriginalRow227TriangleData0711
import Grothe.UpperChaos.OriginalRow227TriangleData0712
import Grothe.UpperChaos.OriginalRow227TriangleData0724
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0708
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root145, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_145, Icur := OriginalRow227TriangleData0711.coefficient48_144,
    output := OriginalRow227TriangleData0724.coefficient49_144, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root146, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_146, Icur := OriginalRow227TriangleData0711.coefficient48_145,
    output := OriginalRow227TriangleData0724.coefficient49_145, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_147, Icur := OriginalRow227TriangleData0711.coefficient48_146,
    output := OriginalRow227TriangleData0724.coefficient49_146, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_148, Icur := OriginalRow227TriangleData0711.coefficient48_147,
    output := OriginalRow227TriangleData0724.coefficient49_147, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_149, Icur := OriginalRow227TriangleData0711.coefficient48_148,
    output := OriginalRow227TriangleData0724.coefficient49_148, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_150, Icur := OriginalRow227TriangleData0711.coefficient48_149,
    output := OriginalRow227TriangleData0724.coefficient49_149, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_151, Icur := OriginalRow227TriangleData0711.coefficient48_150,
    output := OriginalRow227TriangleData0724.coefficient49_150, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_152, Icur := OriginalRow227TriangleData0711.coefficient48_151,
    output := OriginalRow227TriangleData0724.coefficient49_151, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_153, Icur := OriginalRow227TriangleData0711.coefficient48_152,
    output := OriginalRow227TriangleData0724.coefficient49_152, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_154, Icur := OriginalRow227TriangleData0711.coefficient48_153,
    output := OriginalRow227TriangleData0724.coefficient49_153, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_155, Icur := OriginalRow227TriangleData0711.coefficient48_154,
    output := OriginalRow227TriangleData0724.coefficient49_154, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_156, Icur := OriginalRow227TriangleData0711.coefficient48_155,
    output := OriginalRow227TriangleData0724.coefficient49_155, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_157, Icur := OriginalRow227TriangleData0711.coefficient48_156,
    output := OriginalRow227TriangleData0724.coefficient49_156, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_158, Icur := OriginalRow227TriangleData0711.coefficient48_157,
    output := OriginalRow227TriangleData0724.coefficient49_157, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_159, Icur := OriginalRow227TriangleData0711.coefficient48_158,
    output := OriginalRow227TriangleData0724.coefficient49_158, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_160, Icur := OriginalRow227TriangleData0711.coefficient48_159,
    output := OriginalRow227TriangleData0724.coefficient49_159, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_161, Icur := OriginalRow227TriangleData0711.coefficient48_160,
    output := OriginalRow227TriangleData0724.coefficient49_160, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_162, Icur := OriginalRow227TriangleData0711.coefficient48_161,
    output := OriginalRow227TriangleData0724.coefficient49_161, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_163, Icur := OriginalRow227TriangleData0711.coefficient48_162,
    output := OriginalRow227TriangleData0724.coefficient49_162, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_164, Icur := OriginalRow227TriangleData0711.coefficient48_163,
    output := OriginalRow227TriangleData0724.coefficient49_163, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_165, Icur := OriginalRow227TriangleData0711.coefficient48_164,
    output := OriginalRow227TriangleData0724.coefficient49_164, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_166, Icur := OriginalRow227TriangleData0711.coefficient48_165,
    output := OriginalRow227TriangleData0724.coefficient49_165, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_167, Icur := OriginalRow227TriangleData0711.coefficient48_166,
    output := OriginalRow227TriangleData0724.coefficient49_166, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_168, Icur := OriginalRow227TriangleData0711.coefficient48_167,
    output := OriginalRow227TriangleData0724.coefficient49_167, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_169, Icur := OriginalRow227TriangleData0711.coefficient48_168,
    output := OriginalRow227TriangleData0724.coefficient49_168, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_170, Icur := OriginalRow227TriangleData0711.coefficient48_169,
    output := OriginalRow227TriangleData0724.coefficient49_169, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_171, Icur := OriginalRow227TriangleData0711.coefficient48_170,
    output := OriginalRow227TriangleData0724.coefficient49_170, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_172, Icur := OriginalRow227TriangleData0711.coefficient48_171,
    output := OriginalRow227TriangleData0724.coefficient49_171, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_173, Icur := OriginalRow227TriangleData0711.coefficient48_172,
    output := OriginalRow227TriangleData0724.coefficient49_172, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0711.coefficient48_174, Icur := OriginalRow227TriangleData0711.coefficient48_173,
    output := OriginalRow227TriangleData0724.coefficient49_173, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_175, Icur := OriginalRow227TriangleData0711.coefficient48_174,
    output := OriginalRow227TriangleData0724.coefficient49_174, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root49,
    Inext := OriginalRow227TriangleData0712.coefficient48_176, Icur := OriginalRow227TriangleData0712.coefficient48_175,
    output := OriginalRow227TriangleData0724.coefficient49_175, hC := OriginalRow227TriangleRoots01.root49_pos, hAC := OriginalRow227TriangleRoots01.product49_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0708

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0708.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
