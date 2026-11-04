import Grothe.UpperChaos.OriginalRow227TriangleData1232
import Grothe.UpperChaos.OriginalRow227TriangleData1233
import Grothe.UpperChaos.OriginalRow227TriangleData1242
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1226
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_93, Icur := OriginalRow227TriangleData1232.coefficient92_92,
    output := OriginalRow227TriangleData1242.coefficient93_92, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_94, Icur := OriginalRow227TriangleData1232.coefficient92_93,
    output := OriginalRow227TriangleData1242.coefficient93_93, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_95, Icur := OriginalRow227TriangleData1232.coefficient92_94,
    output := OriginalRow227TriangleData1242.coefficient93_94, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_96, Icur := OriginalRow227TriangleData1232.coefficient92_95,
    output := OriginalRow227TriangleData1242.coefficient93_95, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_97, Icur := OriginalRow227TriangleData1232.coefficient92_96,
    output := OriginalRow227TriangleData1242.coefficient93_96, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_98, Icur := OriginalRow227TriangleData1232.coefficient92_97,
    output := OriginalRow227TriangleData1242.coefficient93_97, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_99, Icur := OriginalRow227TriangleData1232.coefficient92_98,
    output := OriginalRow227TriangleData1242.coefficient93_98, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_100, Icur := OriginalRow227TriangleData1232.coefficient92_99,
    output := OriginalRow227TriangleData1242.coefficient93_99, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_101, Icur := OriginalRow227TriangleData1232.coefficient92_100,
    output := OriginalRow227TriangleData1242.coefficient93_100, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_102, Icur := OriginalRow227TriangleData1232.coefficient92_101,
    output := OriginalRow227TriangleData1242.coefficient93_101, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_103, Icur := OriginalRow227TriangleData1232.coefficient92_102,
    output := OriginalRow227TriangleData1242.coefficient93_102, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_104, Icur := OriginalRow227TriangleData1232.coefficient92_103,
    output := OriginalRow227TriangleData1242.coefficient93_103, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_105, Icur := OriginalRow227TriangleData1232.coefficient92_104,
    output := OriginalRow227TriangleData1242.coefficient93_104, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_106, Icur := OriginalRow227TriangleData1232.coefficient92_105,
    output := OriginalRow227TriangleData1242.coefficient93_105, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_107, Icur := OriginalRow227TriangleData1232.coefficient92_106,
    output := OriginalRow227TriangleData1242.coefficient93_106, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_108, Icur := OriginalRow227TriangleData1232.coefficient92_107,
    output := OriginalRow227TriangleData1242.coefficient93_107, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_109, Icur := OriginalRow227TriangleData1232.coefficient92_108,
    output := OriginalRow227TriangleData1242.coefficient93_108, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_110, Icur := OriginalRow227TriangleData1232.coefficient92_109,
    output := OriginalRow227TriangleData1242.coefficient93_109, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_111, Icur := OriginalRow227TriangleData1232.coefficient92_110,
    output := OriginalRow227TriangleData1242.coefficient93_110, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_112, Icur := OriginalRow227TriangleData1232.coefficient92_111,
    output := OriginalRow227TriangleData1242.coefficient93_111, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_113, Icur := OriginalRow227TriangleData1232.coefficient92_112,
    output := OriginalRow227TriangleData1242.coefficient93_112, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_114, Icur := OriginalRow227TriangleData1232.coefficient92_113,
    output := OriginalRow227TriangleData1242.coefficient93_113, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_115, Icur := OriginalRow227TriangleData1232.coefficient92_114,
    output := OriginalRow227TriangleData1242.coefficient93_114, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_116, Icur := OriginalRow227TriangleData1232.coefficient92_115,
    output := OriginalRow227TriangleData1242.coefficient93_115, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_117, Icur := OriginalRow227TriangleData1232.coefficient92_116,
    output := OriginalRow227TriangleData1242.coefficient93_116, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_118, Icur := OriginalRow227TriangleData1232.coefficient92_117,
    output := OriginalRow227TriangleData1242.coefficient93_117, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_119, Icur := OriginalRow227TriangleData1232.coefficient92_118,
    output := OriginalRow227TriangleData1242.coefficient93_118, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_120, Icur := OriginalRow227TriangleData1232.coefficient92_119,
    output := OriginalRow227TriangleData1242.coefficient93_119, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_121, Icur := OriginalRow227TriangleData1232.coefficient92_120,
    output := OriginalRow227TriangleData1242.coefficient93_120, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1232.coefficient92_122, Icur := OriginalRow227TriangleData1232.coefficient92_121,
    output := OriginalRow227TriangleData1242.coefficient93_121, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_123, Icur := OriginalRow227TriangleData1232.coefficient92_122,
    output := OriginalRow227TriangleData1242.coefficient93_122, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root93,
    Inext := OriginalRow227TriangleData1233.coefficient92_124, Icur := OriginalRow227TriangleData1233.coefficient92_123,
    output := OriginalRow227TriangleData1242.coefficient93_123, hC := OriginalRow227TriangleRoots02.root93_pos, hAC := OriginalRow227TriangleRoots02.product93_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1226

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1226.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
