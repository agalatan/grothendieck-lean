import Grothe.UpperChaos.OriginalRow227TriangleData0963
import Grothe.UpperChaos.OriginalRow227TriangleData0964
import Grothe.UpperChaos.OriginalRow227TriangleData0975
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0959
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 97, IA := shift, ID := OriginalRow227TriangleRoots05.root165, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_165, Icur := OriginalRow227TriangleData0963.coefficient68_164,
    output := OriginalRow227TriangleData0975.coefficient69_164, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 98, IA := shift, ID := OriginalRow227TriangleRoots05.root166, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_166, Icur := OriginalRow227TriangleData0963.coefficient68_165,
    output := OriginalRow227TriangleData0975.coefficient69_165, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 99, IA := shift, ID := OriginalRow227TriangleRoots05.root167, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_167, Icur := OriginalRow227TriangleData0963.coefficient68_166,
    output := OriginalRow227TriangleData0975.coefficient69_166, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 100, IA := shift, ID := OriginalRow227TriangleRoots05.root168, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_168, Icur := OriginalRow227TriangleData0963.coefficient68_167,
    output := OriginalRow227TriangleData0975.coefficient69_167, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 101, IA := shift, ID := OriginalRow227TriangleRoots05.root169, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_169, Icur := OriginalRow227TriangleData0963.coefficient68_168,
    output := OriginalRow227TriangleData0975.coefficient69_168, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 102, IA := shift, ID := OriginalRow227TriangleRoots05.root170, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_170, Icur := OriginalRow227TriangleData0963.coefficient68_169,
    output := OriginalRow227TriangleData0975.coefficient69_169, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 103, IA := shift, ID := OriginalRow227TriangleRoots05.root171, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_171, Icur := OriginalRow227TriangleData0963.coefficient68_170,
    output := OriginalRow227TriangleData0975.coefficient69_170, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 104, IA := shift, ID := OriginalRow227TriangleRoots05.root172, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_172, Icur := OriginalRow227TriangleData0963.coefficient68_171,
    output := OriginalRow227TriangleData0975.coefficient69_171, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 105, IA := shift, ID := OriginalRow227TriangleRoots05.root173, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_173, Icur := OriginalRow227TriangleData0963.coefficient68_172,
    output := OriginalRow227TriangleData0975.coefficient69_172, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 106, IA := shift, ID := OriginalRow227TriangleRoots05.root174, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_174, Icur := OriginalRow227TriangleData0963.coefficient68_173,
    output := OriginalRow227TriangleData0975.coefficient69_173, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 107, IA := shift, ID := OriginalRow227TriangleRoots05.root175, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_175, Icur := OriginalRow227TriangleData0963.coefficient68_174,
    output := OriginalRow227TriangleData0975.coefficient69_174, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 108, IA := shift, ID := OriginalRow227TriangleRoots05.root176, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_176, Icur := OriginalRow227TriangleData0963.coefficient68_175,
    output := OriginalRow227TriangleData0975.coefficient69_175, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 109, IA := shift, ID := OriginalRow227TriangleRoots05.root177, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_177, Icur := OriginalRow227TriangleData0963.coefficient68_176,
    output := OriginalRow227TriangleData0975.coefficient69_176, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 110, IA := shift, ID := OriginalRow227TriangleRoots05.root178, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_178, Icur := OriginalRow227TriangleData0963.coefficient68_177,
    output := OriginalRow227TriangleData0975.coefficient69_177, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 111, IA := shift, ID := OriginalRow227TriangleRoots05.root179, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_179, Icur := OriginalRow227TriangleData0963.coefficient68_178,
    output := OriginalRow227TriangleData0975.coefficient69_178, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 112, IA := shift, ID := OriginalRow227TriangleRoots05.root180, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_180, Icur := OriginalRow227TriangleData0963.coefficient68_179,
    output := OriginalRow227TriangleData0975.coefficient69_179, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 113, IA := shift, ID := OriginalRow227TriangleRoots05.root181, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_181, Icur := OriginalRow227TriangleData0963.coefficient68_180,
    output := OriginalRow227TriangleData0975.coefficient69_180, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 114, IA := shift, ID := OriginalRow227TriangleRoots05.root182, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_182, Icur := OriginalRow227TriangleData0963.coefficient68_181,
    output := OriginalRow227TriangleData0975.coefficient69_181, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 115, IA := shift, ID := OriginalRow227TriangleRoots05.root183, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_183, Icur := OriginalRow227TriangleData0963.coefficient68_182,
    output := OriginalRow227TriangleData0975.coefficient69_182, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 116, IA := shift, ID := OriginalRow227TriangleRoots05.root184, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_184, Icur := OriginalRow227TriangleData0963.coefficient68_183,
    output := OriginalRow227TriangleData0975.coefficient69_183, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 117, IA := shift, ID := OriginalRow227TriangleRoots05.root185, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_185, Icur := OriginalRow227TriangleData0963.coefficient68_184,
    output := OriginalRow227TriangleData0975.coefficient69_184, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 118, IA := shift, ID := OriginalRow227TriangleRoots05.root186, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_186, Icur := OriginalRow227TriangleData0963.coefficient68_185,
    output := OriginalRow227TriangleData0975.coefficient69_185, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 119, IA := shift, ID := OriginalRow227TriangleRoots05.root187, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_187, Icur := OriginalRow227TriangleData0963.coefficient68_186,
    output := OriginalRow227TriangleData0975.coefficient69_186, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 120, IA := shift, ID := OriginalRow227TriangleRoots05.root188, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_188, Icur := OriginalRow227TriangleData0963.coefficient68_187,
    output := OriginalRow227TriangleData0975.coefficient69_187, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 121, IA := shift, ID := OriginalRow227TriangleRoots05.root189, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_189, Icur := OriginalRow227TriangleData0963.coefficient68_188,
    output := OriginalRow227TriangleData0975.coefficient69_188, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 122, IA := shift, ID := OriginalRow227TriangleRoots05.root190, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_190, Icur := OriginalRow227TriangleData0963.coefficient68_189,
    output := OriginalRow227TriangleData0975.coefficient69_189, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 123, IA := shift, ID := OriginalRow227TriangleRoots05.root191, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_191, Icur := OriginalRow227TriangleData0963.coefficient68_190,
    output := OriginalRow227TriangleData0975.coefficient69_190, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 124, IA := shift, ID := OriginalRow227TriangleRoots05.root192, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_192, Icur := OriginalRow227TriangleData0963.coefficient68_191,
    output := OriginalRow227TriangleData0975.coefficient69_191, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 125, IA := shift, ID := OriginalRow227TriangleRoots06.root193, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_193, Icur := OriginalRow227TriangleData0963.coefficient68_192,
    output := OriginalRow227TriangleData0975.coefficient69_192, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 126, IA := shift, ID := OriginalRow227TriangleRoots06.root194, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0963.coefficient68_194, Icur := OriginalRow227TriangleData0963.coefficient68_193,
    output := OriginalRow227TriangleData0975.coefficient69_193, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 127, IA := shift, ID := OriginalRow227TriangleRoots06.root195, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_195, Icur := OriginalRow227TriangleData0963.coefficient68_194,
    output := OriginalRow227TriangleData0975.coefficient69_194, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos },
  { charge := 128, IA := shift, ID := OriginalRow227TriangleRoots06.root196, IC := OriginalRow227TriangleRoots02.root69,
    Inext := OriginalRow227TriangleData0964.coefficient68_196, Icur := OriginalRow227TriangleData0964.coefficient68_195,
    output := OriginalRow227TriangleData0975.coefficient69_195, hC := OriginalRow227TriangleRoots02.root69_pos, hAC := OriginalRow227TriangleRoots02.product69_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0959

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0959.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
