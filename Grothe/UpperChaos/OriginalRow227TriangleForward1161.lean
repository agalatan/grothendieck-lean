import Grothe.UpperChaos.OriginalRow227TriangleData1166
import Grothe.UpperChaos.OriginalRow227TriangleData1167
import Grothe.UpperChaos.OriginalRow227TriangleData1177
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward1161
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 1, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_87, Icur := OriginalRow227TriangleData1166.coefficient86_86,
    output := OriginalRow227TriangleData1177.coefficient87_86, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 2, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_88, Icur := OriginalRow227TriangleData1166.coefficient86_87,
    output := OriginalRow227TriangleData1177.coefficient87_87, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 3, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_89, Icur := OriginalRow227TriangleData1166.coefficient86_88,
    output := OriginalRow227TriangleData1177.coefficient87_88, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 4, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_90, Icur := OriginalRow227TriangleData1166.coefficient86_89,
    output := OriginalRow227TriangleData1177.coefficient87_89, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 5, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_91, Icur := OriginalRow227TriangleData1166.coefficient86_90,
    output := OriginalRow227TriangleData1177.coefficient87_90, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 6, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_92, Icur := OriginalRow227TriangleData1166.coefficient86_91,
    output := OriginalRow227TriangleData1177.coefficient87_91, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 7, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_93, Icur := OriginalRow227TriangleData1166.coefficient86_92,
    output := OriginalRow227TriangleData1177.coefficient87_92, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 8, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_94, Icur := OriginalRow227TriangleData1166.coefficient86_93,
    output := OriginalRow227TriangleData1177.coefficient87_93, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 9, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_95, Icur := OriginalRow227TriangleData1166.coefficient86_94,
    output := OriginalRow227TriangleData1177.coefficient87_94, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 10, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_96, Icur := OriginalRow227TriangleData1166.coefficient86_95,
    output := OriginalRow227TriangleData1177.coefficient87_95, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 11, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_97, Icur := OriginalRow227TriangleData1166.coefficient86_96,
    output := OriginalRow227TriangleData1177.coefficient87_96, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 12, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_98, Icur := OriginalRow227TriangleData1166.coefficient86_97,
    output := OriginalRow227TriangleData1177.coefficient87_97, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 13, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_99, Icur := OriginalRow227TriangleData1166.coefficient86_98,
    output := OriginalRow227TriangleData1177.coefficient87_98, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 14, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_100, Icur := OriginalRow227TriangleData1166.coefficient86_99,
    output := OriginalRow227TriangleData1177.coefficient87_99, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 15, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_101, Icur := OriginalRow227TriangleData1166.coefficient86_100,
    output := OriginalRow227TriangleData1177.coefficient87_100, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 16, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_102, Icur := OriginalRow227TriangleData1166.coefficient86_101,
    output := OriginalRow227TriangleData1177.coefficient87_101, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 17, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_103, Icur := OriginalRow227TriangleData1166.coefficient86_102,
    output := OriginalRow227TriangleData1177.coefficient87_102, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 18, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_104, Icur := OriginalRow227TriangleData1166.coefficient86_103,
    output := OriginalRow227TriangleData1177.coefficient87_103, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 19, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_105, Icur := OriginalRow227TriangleData1166.coefficient86_104,
    output := OriginalRow227TriangleData1177.coefficient87_104, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 20, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_106, Icur := OriginalRow227TriangleData1166.coefficient86_105,
    output := OriginalRow227TriangleData1177.coefficient87_105, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 21, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_107, Icur := OriginalRow227TriangleData1166.coefficient86_106,
    output := OriginalRow227TriangleData1177.coefficient87_106, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 22, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_108, Icur := OriginalRow227TriangleData1166.coefficient86_107,
    output := OriginalRow227TriangleData1177.coefficient87_107, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 23, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_109, Icur := OriginalRow227TriangleData1166.coefficient86_108,
    output := OriginalRow227TriangleData1177.coefficient87_108, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 24, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_110, Icur := OriginalRow227TriangleData1166.coefficient86_109,
    output := OriginalRow227TriangleData1177.coefficient87_109, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 25, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_111, Icur := OriginalRow227TriangleData1166.coefficient86_110,
    output := OriginalRow227TriangleData1177.coefficient87_110, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 26, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_112, Icur := OriginalRow227TriangleData1166.coefficient86_111,
    output := OriginalRow227TriangleData1177.coefficient87_111, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 27, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_113, Icur := OriginalRow227TriangleData1166.coefficient86_112,
    output := OriginalRow227TriangleData1177.coefficient87_112, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 28, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_114, Icur := OriginalRow227TriangleData1166.coefficient86_113,
    output := OriginalRow227TriangleData1177.coefficient87_113, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 29, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_115, Icur := OriginalRow227TriangleData1166.coefficient86_114,
    output := OriginalRow227TriangleData1177.coefficient87_114, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 30, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1166.coefficient86_116, Icur := OriginalRow227TriangleData1166.coefficient86_115,
    output := OriginalRow227TriangleData1177.coefficient87_115, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 31, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_117, Icur := OriginalRow227TriangleData1166.coefficient86_116,
    output := OriginalRow227TriangleData1177.coefficient87_116, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos },
  { charge := 32, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots02.root87,
    Inext := OriginalRow227TriangleData1167.coefficient86_118, Icur := OriginalRow227TriangleData1167.coefficient86_117,
    output := OriginalRow227TriangleData1177.coefficient87_117, hC := OriginalRow227TriangleRoots02.root87_pos, hAC := OriginalRow227TriangleRoots02.product87_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward1161

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward1161.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
