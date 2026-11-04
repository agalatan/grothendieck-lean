import Grothe.UpperChaos.OriginalRow227TriangleData1649
import Grothe.UpperChaos.OriginalRow227TriangleData1650
import Grothe.UpperChaos.OriginalRow227TriangleData1657
import Grothe.UpperChaos.OriginalRow227TriangleRoots04
import Grothe.UpperChaos.OriginalRow227TriangleRoots05
import Grothe.UpperChaos.OriginalRow227TriangleRoots06
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1641
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_171, Icur := OriginalRow227TriangleData1649.coefficient138_170,
    output := OriginalRow227TriangleData1657.coefficient139_170, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_172, Icur := OriginalRow227TriangleData1649.coefficient138_171,
    output := OriginalRow227TriangleData1657.coefficient139_171, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_173, Icur := OriginalRow227TriangleData1649.coefficient138_172,
    output := OriginalRow227TriangleData1657.coefficient139_172, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_174, Icur := OriginalRow227TriangleData1649.coefficient138_173,
    output := OriginalRow227TriangleData1657.coefficient139_173, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_175, Icur := OriginalRow227TriangleData1649.coefficient138_174,
    output := OriginalRow227TriangleData1657.coefficient139_174, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_176, Icur := OriginalRow227TriangleData1649.coefficient138_175,
    output := OriginalRow227TriangleData1657.coefficient139_175, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_177, Icur := OriginalRow227TriangleData1649.coefficient138_176,
    output := OriginalRow227TriangleData1657.coefficient139_176, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_178, Icur := OriginalRow227TriangleData1649.coefficient138_177,
    output := OriginalRow227TriangleData1657.coefficient139_177, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_179, Icur := OriginalRow227TriangleData1649.coefficient138_178,
    output := OriginalRow227TriangleData1657.coefficient139_178, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_180, Icur := OriginalRow227TriangleData1649.coefficient138_179,
    output := OriginalRow227TriangleData1657.coefficient139_179, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_181, Icur := OriginalRow227TriangleData1649.coefficient138_180,
    output := OriginalRow227TriangleData1657.coefficient139_180, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_182, Icur := OriginalRow227TriangleData1649.coefficient138_181,
    output := OriginalRow227TriangleData1657.coefficient139_181, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_183, Icur := OriginalRow227TriangleData1649.coefficient138_182,
    output := OriginalRow227TriangleData1657.coefficient139_182, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_184, Icur := OriginalRow227TriangleData1649.coefficient138_183,
    output := OriginalRow227TriangleData1657.coefficient139_183, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_185, Icur := OriginalRow227TriangleData1649.coefficient138_184,
    output := OriginalRow227TriangleData1657.coefficient139_184, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_186, Icur := OriginalRow227TriangleData1649.coefficient138_185,
    output := OriginalRow227TriangleData1657.coefficient139_185, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_187, Icur := OriginalRow227TriangleData1649.coefficient138_186,
    output := OriginalRow227TriangleData1657.coefficient139_186, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_188, Icur := OriginalRow227TriangleData1649.coefficient138_187,
    output := OriginalRow227TriangleData1657.coefficient139_187, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_189, Icur := OriginalRow227TriangleData1649.coefficient138_188,
    output := OriginalRow227TriangleData1657.coefficient139_188, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_190, Icur := OriginalRow227TriangleData1649.coefficient138_189,
    output := OriginalRow227TriangleData1657.coefficient139_189, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_191, Icur := OriginalRow227TriangleData1649.coefficient138_190,
    output := OriginalRow227TriangleData1657.coefficient139_190, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_192, Icur := OriginalRow227TriangleData1649.coefficient138_191,
    output := OriginalRow227TriangleData1657.coefficient139_191, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_193, Icur := OriginalRow227TriangleData1649.coefficient138_192,
    output := OriginalRow227TriangleData1657.coefficient139_192, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_194, Icur := OriginalRow227TriangleData1649.coefficient138_193,
    output := OriginalRow227TriangleData1657.coefficient139_193, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_195, Icur := OriginalRow227TriangleData1649.coefficient138_194,
    output := OriginalRow227TriangleData1657.coefficient139_194, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_196, Icur := OriginalRow227TriangleData1649.coefficient138_195,
    output := OriginalRow227TriangleData1657.coefficient139_195, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots06.root197, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_197, Icur := OriginalRow227TriangleData1649.coefficient138_196,
    output := OriginalRow227TriangleData1657.coefficient139_196, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots06.root198, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_198, Icur := OriginalRow227TriangleData1649.coefficient138_197,
    output := OriginalRow227TriangleData1657.coefficient139_197, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots06.root199, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_199, Icur := OriginalRow227TriangleData1649.coefficient138_198,
    output := OriginalRow227TriangleData1657.coefficient139_198, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots06.root200, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1649.coefficient138_200, Icur := OriginalRow227TriangleData1649.coefficient138_199,
    output := OriginalRow227TriangleData1657.coefficient139_199, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots06.root201, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_201, Icur := OriginalRow227TriangleData1649.coefficient138_200,
    output := OriginalRow227TriangleData1657.coefficient139_200, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots06.root202, IC := OriginalRow227TriangleRoots04.root139,
    Inext := OriginalRow227TriangleData1650.coefficient138_202, Icur := OriginalRow227TriangleData1650.coefficient138_201,
    output := OriginalRow227TriangleData1657.coefficient139_201, hC := OriginalRow227TriangleRoots04.root139_pos, hAC := OriginalRow227TriangleRoots04.product139_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1641

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1641.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
