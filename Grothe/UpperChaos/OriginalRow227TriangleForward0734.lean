import Grothe.UpperChaos.OriginalRow227TriangleData0737
import Grothe.UpperChaos.OriginalRow227TriangleData0738
import Grothe.UpperChaos.OriginalRow227TriangleData0750
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0734
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root147, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_147, Icur := OriginalRow227TriangleData0737.coefficient50_146,
    output := OriginalRow227TriangleData0750.coefficient51_146, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root148, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_148, Icur := OriginalRow227TriangleData0737.coefficient50_147,
    output := OriginalRow227TriangleData0750.coefficient51_147, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root149, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_149, Icur := OriginalRow227TriangleData0737.coefficient50_148,
    output := OriginalRow227TriangleData0750.coefficient51_148, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_150, Icur := OriginalRow227TriangleData0737.coefficient50_149,
    output := OriginalRow227TriangleData0750.coefficient51_149, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_151, Icur := OriginalRow227TriangleData0737.coefficient50_150,
    output := OriginalRow227TriangleData0750.coefficient51_150, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_152, Icur := OriginalRow227TriangleData0737.coefficient50_151,
    output := OriginalRow227TriangleData0750.coefficient51_151, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_153, Icur := OriginalRow227TriangleData0737.coefficient50_152,
    output := OriginalRow227TriangleData0750.coefficient51_152, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_154, Icur := OriginalRow227TriangleData0737.coefficient50_153,
    output := OriginalRow227TriangleData0750.coefficient51_153, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_155, Icur := OriginalRow227TriangleData0737.coefficient50_154,
    output := OriginalRow227TriangleData0750.coefficient51_154, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_156, Icur := OriginalRow227TriangleData0737.coefficient50_155,
    output := OriginalRow227TriangleData0750.coefficient51_155, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_157, Icur := OriginalRow227TriangleData0737.coefficient50_156,
    output := OriginalRow227TriangleData0750.coefficient51_156, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_158, Icur := OriginalRow227TriangleData0737.coefficient50_157,
    output := OriginalRow227TriangleData0750.coefficient51_157, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_159, Icur := OriginalRow227TriangleData0737.coefficient50_158,
    output := OriginalRow227TriangleData0750.coefficient51_158, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_160, Icur := OriginalRow227TriangleData0737.coefficient50_159,
    output := OriginalRow227TriangleData0750.coefficient51_159, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_161, Icur := OriginalRow227TriangleData0737.coefficient50_160,
    output := OriginalRow227TriangleData0750.coefficient51_160, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_162, Icur := OriginalRow227TriangleData0737.coefficient50_161,
    output := OriginalRow227TriangleData0750.coefficient51_161, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_163, Icur := OriginalRow227TriangleData0737.coefficient50_162,
    output := OriginalRow227TriangleData0750.coefficient51_162, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_164, Icur := OriginalRow227TriangleData0737.coefficient50_163,
    output := OriginalRow227TriangleData0750.coefficient51_163, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_165, Icur := OriginalRow227TriangleData0737.coefficient50_164,
    output := OriginalRow227TriangleData0750.coefficient51_164, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_166, Icur := OriginalRow227TriangleData0737.coefficient50_165,
    output := OriginalRow227TriangleData0750.coefficient51_165, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_167, Icur := OriginalRow227TriangleData0737.coefficient50_166,
    output := OriginalRow227TriangleData0750.coefficient51_166, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_168, Icur := OriginalRow227TriangleData0737.coefficient50_167,
    output := OriginalRow227TriangleData0750.coefficient51_167, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_169, Icur := OriginalRow227TriangleData0737.coefficient50_168,
    output := OriginalRow227TriangleData0750.coefficient51_168, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_170, Icur := OriginalRow227TriangleData0737.coefficient50_169,
    output := OriginalRow227TriangleData0750.coefficient51_169, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_171, Icur := OriginalRow227TriangleData0737.coefficient50_170,
    output := OriginalRow227TriangleData0750.coefficient51_170, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_172, Icur := OriginalRow227TriangleData0737.coefficient50_171,
    output := OriginalRow227TriangleData0750.coefficient51_171, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_173, Icur := OriginalRow227TriangleData0737.coefficient50_172,
    output := OriginalRow227TriangleData0750.coefficient51_172, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_174, Icur := OriginalRow227TriangleData0737.coefficient50_173,
    output := OriginalRow227TriangleData0750.coefficient51_173, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_175, Icur := OriginalRow227TriangleData0737.coefficient50_174,
    output := OriginalRow227TriangleData0750.coefficient51_174, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0737.coefficient50_176, Icur := OriginalRow227TriangleData0737.coefficient50_175,
    output := OriginalRow227TriangleData0750.coefficient51_175, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0738.coefficient50_177, Icur := OriginalRow227TriangleData0737.coefficient50_176,
    output := OriginalRow227TriangleData0750.coefficient51_176, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root51,
    Inext := OriginalRow227TriangleData0738.coefficient50_178, Icur := OriginalRow227TriangleData0738.coefficient50_177,
    output := OriginalRow227TriangleData0750.coefficient51_177, hC := OriginalRow227TriangleRoots01.root51_pos, hAC := OriginalRow227TriangleRoots01.product51_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0734

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0734.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
