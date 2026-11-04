import Grothe.UpperChaos.OriginalRow227TriangleData0776
import Grothe.UpperChaos.OriginalRow227TriangleData0777
import Grothe.UpperChaos.OriginalRow227TriangleData0789
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0773
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots04.root150, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_150, Icur := OriginalRow227TriangleData0776.coefficient53_149,
    output := OriginalRow227TriangleData0789.coefficient54_149, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots04.root151, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_151, Icur := OriginalRow227TriangleData0776.coefficient53_150,
    output := OriginalRow227TriangleData0789.coefficient54_150, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots04.root152, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_152, Icur := OriginalRow227TriangleData0776.coefficient53_151,
    output := OriginalRow227TriangleData0789.coefficient54_151, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots04.root153, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_153, Icur := OriginalRow227TriangleData0776.coefficient53_152,
    output := OriginalRow227TriangleData0789.coefficient54_152, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots04.root154, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_154, Icur := OriginalRow227TriangleData0776.coefficient53_153,
    output := OriginalRow227TriangleData0789.coefficient54_153, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots04.root155, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_155, Icur := OriginalRow227TriangleData0776.coefficient53_154,
    output := OriginalRow227TriangleData0789.coefficient54_154, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots04.root156, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_156, Icur := OriginalRow227TriangleData0776.coefficient53_155,
    output := OriginalRow227TriangleData0789.coefficient54_155, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots04.root157, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_157, Icur := OriginalRow227TriangleData0776.coefficient53_156,
    output := OriginalRow227TriangleData0789.coefficient54_156, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots04.root158, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_158, Icur := OriginalRow227TriangleData0776.coefficient53_157,
    output := OriginalRow227TriangleData0789.coefficient54_157, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots04.root159, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_159, Icur := OriginalRow227TriangleData0776.coefficient53_158,
    output := OriginalRow227TriangleData0789.coefficient54_158, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots04.root160, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_160, Icur := OriginalRow227TriangleData0776.coefficient53_159,
    output := OriginalRow227TriangleData0789.coefficient54_159, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root161, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_161, Icur := OriginalRow227TriangleData0776.coefficient53_160,
    output := OriginalRow227TriangleData0789.coefficient54_160, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root162, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_162, Icur := OriginalRow227TriangleData0776.coefficient53_161,
    output := OriginalRow227TriangleData0789.coefficient54_161, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root163, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_163, Icur := OriginalRow227TriangleData0776.coefficient53_162,
    output := OriginalRow227TriangleData0789.coefficient54_162, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root164, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_164, Icur := OriginalRow227TriangleData0776.coefficient53_163,
    output := OriginalRow227TriangleData0789.coefficient54_163, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_165, Icur := OriginalRow227TriangleData0776.coefficient53_164,
    output := OriginalRow227TriangleData0789.coefficient54_164, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_166, Icur := OriginalRow227TriangleData0776.coefficient53_165,
    output := OriginalRow227TriangleData0789.coefficient54_165, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_167, Icur := OriginalRow227TriangleData0776.coefficient53_166,
    output := OriginalRow227TriangleData0789.coefficient54_166, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_168, Icur := OriginalRow227TriangleData0776.coefficient53_167,
    output := OriginalRow227TriangleData0789.coefficient54_167, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_169, Icur := OriginalRow227TriangleData0776.coefficient53_168,
    output := OriginalRow227TriangleData0789.coefficient54_168, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_170, Icur := OriginalRow227TriangleData0776.coefficient53_169,
    output := OriginalRow227TriangleData0789.coefficient54_169, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_171, Icur := OriginalRow227TriangleData0776.coefficient53_170,
    output := OriginalRow227TriangleData0789.coefficient54_170, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_172, Icur := OriginalRow227TriangleData0776.coefficient53_171,
    output := OriginalRow227TriangleData0789.coefficient54_171, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_173, Icur := OriginalRow227TriangleData0776.coefficient53_172,
    output := OriginalRow227TriangleData0789.coefficient54_172, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_174, Icur := OriginalRow227TriangleData0776.coefficient53_173,
    output := OriginalRow227TriangleData0789.coefficient54_173, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_175, Icur := OriginalRow227TriangleData0776.coefficient53_174,
    output := OriginalRow227TriangleData0789.coefficient54_174, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_176, Icur := OriginalRow227TriangleData0776.coefficient53_175,
    output := OriginalRow227TriangleData0789.coefficient54_175, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_177, Icur := OriginalRow227TriangleData0776.coefficient53_176,
    output := OriginalRow227TriangleData0789.coefficient54_176, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_178, Icur := OriginalRow227TriangleData0776.coefficient53_177,
    output := OriginalRow227TriangleData0789.coefficient54_177, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0776.coefficient53_179, Icur := OriginalRow227TriangleData0776.coefficient53_178,
    output := OriginalRow227TriangleData0789.coefficient54_178, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0777.coefficient53_180, Icur := OriginalRow227TriangleData0776.coefficient53_179,
    output := OriginalRow227TriangleData0789.coefficient54_179, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots01.root54,
    Inext := OriginalRow227TriangleData0777.coefficient53_181, Icur := OriginalRow227TriangleData0777.coefficient53_180,
    output := OriginalRow227TriangleData0789.coefficient54_180, hC := OriginalRow227TriangleRoots01.root54_pos, hAC := OriginalRow227TriangleRoots01.product54_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0773

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0773.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
