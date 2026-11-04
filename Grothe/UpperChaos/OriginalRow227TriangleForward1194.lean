import Grothe.UpperChaos.OriginalRow227TriangleData1199
import Grothe.UpperChaos.OriginalRow227TriangleData1200
import Grothe.UpperChaos.OriginalRow227TriangleData1210
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1194
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_90, Icur := OriginalRow227TriangleData1199.coefficient89_89,
    output := OriginalRow227TriangleData1210.coefficient90_89, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_91, Icur := OriginalRow227TriangleData1199.coefficient89_90,
    output := OriginalRow227TriangleData1210.coefficient90_90, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_92, Icur := OriginalRow227TriangleData1199.coefficient89_91,
    output := OriginalRow227TriangleData1210.coefficient90_91, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_93, Icur := OriginalRow227TriangleData1199.coefficient89_92,
    output := OriginalRow227TriangleData1210.coefficient90_92, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_94, Icur := OriginalRow227TriangleData1199.coefficient89_93,
    output := OriginalRow227TriangleData1210.coefficient90_93, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_95, Icur := OriginalRow227TriangleData1199.coefficient89_94,
    output := OriginalRow227TriangleData1210.coefficient90_94, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_96, Icur := OriginalRow227TriangleData1199.coefficient89_95,
    output := OriginalRow227TriangleData1210.coefficient90_95, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_97, Icur := OriginalRow227TriangleData1199.coefficient89_96,
    output := OriginalRow227TriangleData1210.coefficient90_96, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_98, Icur := OriginalRow227TriangleData1199.coefficient89_97,
    output := OriginalRow227TriangleData1210.coefficient90_97, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_99, Icur := OriginalRow227TriangleData1199.coefficient89_98,
    output := OriginalRow227TriangleData1210.coefficient90_98, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_100, Icur := OriginalRow227TriangleData1199.coefficient89_99,
    output := OriginalRow227TriangleData1210.coefficient90_99, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_101, Icur := OriginalRow227TriangleData1199.coefficient89_100,
    output := OriginalRow227TriangleData1210.coefficient90_100, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_102, Icur := OriginalRow227TriangleData1199.coefficient89_101,
    output := OriginalRow227TriangleData1210.coefficient90_101, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_103, Icur := OriginalRow227TriangleData1199.coefficient89_102,
    output := OriginalRow227TriangleData1210.coefficient90_102, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_104, Icur := OriginalRow227TriangleData1199.coefficient89_103,
    output := OriginalRow227TriangleData1210.coefficient90_103, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_105, Icur := OriginalRow227TriangleData1199.coefficient89_104,
    output := OriginalRow227TriangleData1210.coefficient90_104, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_106, Icur := OriginalRow227TriangleData1199.coefficient89_105,
    output := OriginalRow227TriangleData1210.coefficient90_105, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_107, Icur := OriginalRow227TriangleData1199.coefficient89_106,
    output := OriginalRow227TriangleData1210.coefficient90_106, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_108, Icur := OriginalRow227TriangleData1199.coefficient89_107,
    output := OriginalRow227TriangleData1210.coefficient90_107, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_109, Icur := OriginalRow227TriangleData1199.coefficient89_108,
    output := OriginalRow227TriangleData1210.coefficient90_108, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_110, Icur := OriginalRow227TriangleData1199.coefficient89_109,
    output := OriginalRow227TriangleData1210.coefficient90_109, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_111, Icur := OriginalRow227TriangleData1199.coefficient89_110,
    output := OriginalRow227TriangleData1210.coefficient90_110, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_112, Icur := OriginalRow227TriangleData1199.coefficient89_111,
    output := OriginalRow227TriangleData1210.coefficient90_111, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_113, Icur := OriginalRow227TriangleData1199.coefficient89_112,
    output := OriginalRow227TriangleData1210.coefficient90_112, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_114, Icur := OriginalRow227TriangleData1199.coefficient89_113,
    output := OriginalRow227TriangleData1210.coefficient90_113, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_115, Icur := OriginalRow227TriangleData1199.coefficient89_114,
    output := OriginalRow227TriangleData1210.coefficient90_114, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_116, Icur := OriginalRow227TriangleData1199.coefficient89_115,
    output := OriginalRow227TriangleData1210.coefficient90_115, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_117, Icur := OriginalRow227TriangleData1199.coefficient89_116,
    output := OriginalRow227TriangleData1210.coefficient90_116, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_118, Icur := OriginalRow227TriangleData1199.coefficient89_117,
    output := OriginalRow227TriangleData1210.coefficient90_117, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1199.coefficient89_119, Icur := OriginalRow227TriangleData1199.coefficient89_118,
    output := OriginalRow227TriangleData1210.coefficient90_118, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1200.coefficient89_120, Icur := OriginalRow227TriangleData1199.coefficient89_119,
    output := OriginalRow227TriangleData1210.coefficient90_119, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots02.root90,
    Inext := OriginalRow227TriangleData1200.coefficient89_121, Icur := OriginalRow227TriangleData1200.coefficient89_120,
    output := OriginalRow227TriangleData1210.coefficient90_120, hC := OriginalRow227TriangleRoots02.root90_pos, hAC := OriginalRow227TriangleRoots02.product90_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1194

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1194.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
