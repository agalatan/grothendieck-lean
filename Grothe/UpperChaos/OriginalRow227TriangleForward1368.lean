import Grothe.UpperChaos.OriginalRow227TriangleData1374
import Grothe.UpperChaos.OriginalRow227TriangleData1375
import Grothe.UpperChaos.OriginalRow227TriangleData1384
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1368
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_171, Icur := OriginalRow227TriangleData1374.coefficient106_170,
    output := OriginalRow227TriangleData1384.coefficient107_170, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_172, Icur := OriginalRow227TriangleData1374.coefficient106_171,
    output := OriginalRow227TriangleData1384.coefficient107_171, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_173, Icur := OriginalRow227TriangleData1374.coefficient106_172,
    output := OriginalRow227TriangleData1384.coefficient107_172, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_174, Icur := OriginalRow227TriangleData1374.coefficient106_173,
    output := OriginalRow227TriangleData1384.coefficient107_173, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_175, Icur := OriginalRow227TriangleData1374.coefficient106_174,
    output := OriginalRow227TriangleData1384.coefficient107_174, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_176, Icur := OriginalRow227TriangleData1374.coefficient106_175,
    output := OriginalRow227TriangleData1384.coefficient107_175, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_177, Icur := OriginalRow227TriangleData1374.coefficient106_176,
    output := OriginalRow227TriangleData1384.coefficient107_176, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_178, Icur := OriginalRow227TriangleData1374.coefficient106_177,
    output := OriginalRow227TriangleData1384.coefficient107_177, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_179, Icur := OriginalRow227TriangleData1374.coefficient106_178,
    output := OriginalRow227TriangleData1384.coefficient107_178, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_180, Icur := OriginalRow227TriangleData1374.coefficient106_179,
    output := OriginalRow227TriangleData1384.coefficient107_179, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_181, Icur := OriginalRow227TriangleData1374.coefficient106_180,
    output := OriginalRow227TriangleData1384.coefficient107_180, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_182, Icur := OriginalRow227TriangleData1374.coefficient106_181,
    output := OriginalRow227TriangleData1384.coefficient107_181, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_183, Icur := OriginalRow227TriangleData1374.coefficient106_182,
    output := OriginalRow227TriangleData1384.coefficient107_182, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_184, Icur := OriginalRow227TriangleData1374.coefficient106_183,
    output := OriginalRow227TriangleData1384.coefficient107_183, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_185, Icur := OriginalRow227TriangleData1374.coefficient106_184,
    output := OriginalRow227TriangleData1384.coefficient107_184, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_186, Icur := OriginalRow227TriangleData1374.coefficient106_185,
    output := OriginalRow227TriangleData1384.coefficient107_185, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_187, Icur := OriginalRow227TriangleData1374.coefficient106_186,
    output := OriginalRow227TriangleData1384.coefficient107_186, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_188, Icur := OriginalRow227TriangleData1374.coefficient106_187,
    output := OriginalRow227TriangleData1384.coefficient107_187, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_189, Icur := OriginalRow227TriangleData1374.coefficient106_188,
    output := OriginalRow227TriangleData1384.coefficient107_188, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_190, Icur := OriginalRow227TriangleData1374.coefficient106_189,
    output := OriginalRow227TriangleData1384.coefficient107_189, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_191, Icur := OriginalRow227TriangleData1374.coefficient106_190,
    output := OriginalRow227TriangleData1384.coefficient107_190, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_192, Icur := OriginalRow227TriangleData1374.coefficient106_191,
    output := OriginalRow227TriangleData1384.coefficient107_191, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_193, Icur := OriginalRow227TriangleData1374.coefficient106_192,
    output := OriginalRow227TriangleData1384.coefficient107_192, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_194, Icur := OriginalRow227TriangleData1374.coefficient106_193,
    output := OriginalRow227TriangleData1384.coefficient107_193, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_195, Icur := OriginalRow227TriangleData1374.coefficient106_194,
    output := OriginalRow227TriangleData1384.coefficient107_194, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_196, Icur := OriginalRow227TriangleData1374.coefficient106_195,
    output := OriginalRow227TriangleData1384.coefficient107_195, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_197, Icur := OriginalRow227TriangleData1374.coefficient106_196,
    output := OriginalRow227TriangleData1384.coefficient107_196, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_198, Icur := OriginalRow227TriangleData1374.coefficient106_197,
    output := OriginalRow227TriangleData1384.coefficient107_197, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_199, Icur := OriginalRow227TriangleData1374.coefficient106_198,
    output := OriginalRow227TriangleData1384.coefficient107_198, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1374.coefficient106_200, Icur := OriginalRow227TriangleData1374.coefficient106_199,
    output := OriginalRow227TriangleData1384.coefficient107_199, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_201, Icur := OriginalRow227TriangleData1374.coefficient106_200,
    output := OriginalRow227TriangleData1384.coefficient107_200, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots03.root107,
    Inext := OriginalRow227TriangleData1375.coefficient106_202, Icur := OriginalRow227TriangleData1375.coefficient106_201,
    output := OriginalRow227TriangleData1384.coefficient107_201, hC := OriginalRow227TriangleRoots03.root107_pos, hAC := OriginalRow227TriangleRoots03.product107_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1368

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1368.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
