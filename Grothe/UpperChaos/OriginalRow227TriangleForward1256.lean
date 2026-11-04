import Grothe.UpperChaos.OriginalRow227TriangleData1262
import Grothe.UpperChaos.OriginalRow227TriangleData1263
import Grothe.UpperChaos.OriginalRow227TriangleData1272
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1256
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_96, Icur := OriginalRow227TriangleData1262.coefficient95_95,
    output := OriginalRow227TriangleData1272.coefficient96_95, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_97, Icur := OriginalRow227TriangleData1262.coefficient95_96,
    output := OriginalRow227TriangleData1272.coefficient96_96, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_98, Icur := OriginalRow227TriangleData1262.coefficient95_97,
    output := OriginalRow227TriangleData1272.coefficient96_97, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_99, Icur := OriginalRow227TriangleData1262.coefficient95_98,
    output := OriginalRow227TriangleData1272.coefficient96_98, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_100, Icur := OriginalRow227TriangleData1262.coefficient95_99,
    output := OriginalRow227TriangleData1272.coefficient96_99, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_101, Icur := OriginalRow227TriangleData1262.coefficient95_100,
    output := OriginalRow227TriangleData1272.coefficient96_100, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_102, Icur := OriginalRow227TriangleData1262.coefficient95_101,
    output := OriginalRow227TriangleData1272.coefficient96_101, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_103, Icur := OriginalRow227TriangleData1262.coefficient95_102,
    output := OriginalRow227TriangleData1272.coefficient96_102, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_104, Icur := OriginalRow227TriangleData1262.coefficient95_103,
    output := OriginalRow227TriangleData1272.coefficient96_103, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_105, Icur := OriginalRow227TriangleData1262.coefficient95_104,
    output := OriginalRow227TriangleData1272.coefficient96_104, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_106, Icur := OriginalRow227TriangleData1262.coefficient95_105,
    output := OriginalRow227TriangleData1272.coefficient96_105, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_107, Icur := OriginalRow227TriangleData1262.coefficient95_106,
    output := OriginalRow227TriangleData1272.coefficient96_106, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_108, Icur := OriginalRow227TriangleData1262.coefficient95_107,
    output := OriginalRow227TriangleData1272.coefficient96_107, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_109, Icur := OriginalRow227TriangleData1262.coefficient95_108,
    output := OriginalRow227TriangleData1272.coefficient96_108, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_110, Icur := OriginalRow227TriangleData1262.coefficient95_109,
    output := OriginalRow227TriangleData1272.coefficient96_109, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_111, Icur := OriginalRow227TriangleData1262.coefficient95_110,
    output := OriginalRow227TriangleData1272.coefficient96_110, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_112, Icur := OriginalRow227TriangleData1262.coefficient95_111,
    output := OriginalRow227TriangleData1272.coefficient96_111, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_113, Icur := OriginalRow227TriangleData1262.coefficient95_112,
    output := OriginalRow227TriangleData1272.coefficient96_112, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_114, Icur := OriginalRow227TriangleData1262.coefficient95_113,
    output := OriginalRow227TriangleData1272.coefficient96_113, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_115, Icur := OriginalRow227TriangleData1262.coefficient95_114,
    output := OriginalRow227TriangleData1272.coefficient96_114, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_116, Icur := OriginalRow227TriangleData1262.coefficient95_115,
    output := OriginalRow227TriangleData1272.coefficient96_115, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_117, Icur := OriginalRow227TriangleData1262.coefficient95_116,
    output := OriginalRow227TriangleData1272.coefficient96_116, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_118, Icur := OriginalRow227TriangleData1262.coefficient95_117,
    output := OriginalRow227TriangleData1272.coefficient96_117, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_119, Icur := OriginalRow227TriangleData1262.coefficient95_118,
    output := OriginalRow227TriangleData1272.coefficient96_118, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_120, Icur := OriginalRow227TriangleData1262.coefficient95_119,
    output := OriginalRow227TriangleData1272.coefficient96_119, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_121, Icur := OriginalRow227TriangleData1262.coefficient95_120,
    output := OriginalRow227TriangleData1272.coefficient96_120, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_122, Icur := OriginalRow227TriangleData1262.coefficient95_121,
    output := OriginalRow227TriangleData1272.coefficient96_121, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_123, Icur := OriginalRow227TriangleData1262.coefficient95_122,
    output := OriginalRow227TriangleData1272.coefficient96_122, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root124, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_124, Icur := OriginalRow227TriangleData1262.coefficient95_123,
    output := OriginalRow227TriangleData1272.coefficient96_123, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root125, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1262.coefficient95_125, Icur := OriginalRow227TriangleData1262.coefficient95_124,
    output := OriginalRow227TriangleData1272.coefficient96_124, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root126, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1263.coefficient95_126, Icur := OriginalRow227TriangleData1262.coefficient95_125,
    output := OriginalRow227TriangleData1272.coefficient96_125, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root127, IC := OriginalRow227TriangleRoots02.root96,
    Inext := OriginalRow227TriangleData1263.coefficient95_127, Icur := OriginalRow227TriangleData1263.coefficient95_126,
    output := OriginalRow227TriangleData1272.coefficient96_126, hC := OriginalRow227TriangleRoots02.root96_pos, hAC := OriginalRow227TriangleRoots02.product96_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1256

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1256.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
