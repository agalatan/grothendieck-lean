import Grothe.UpperChaos.OriginalRow227TriangleData0852
import Grothe.UpperChaos.OriginalRow227TriangleData0853
import Grothe.UpperChaos.OriginalRow227TriangleData0865
import Grothe.UpperChaos.OriginalRow227TriangleRoots01
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0849
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_92, Icur := OriginalRow227TriangleData0852.coefficient59_91,
    output := OriginalRow227TriangleData0865.coefficient60_91, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_93, Icur := OriginalRow227TriangleData0852.coefficient59_92,
    output := OriginalRow227TriangleData0865.coefficient60_92, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_94, Icur := OriginalRow227TriangleData0852.coefficient59_93,
    output := OriginalRow227TriangleData0865.coefficient60_93, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_95, Icur := OriginalRow227TriangleData0852.coefficient59_94,
    output := OriginalRow227TriangleData0865.coefficient60_94, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_96, Icur := OriginalRow227TriangleData0852.coefficient59_95,
    output := OriginalRow227TriangleData0865.coefficient60_95, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_97, Icur := OriginalRow227TriangleData0852.coefficient59_96,
    output := OriginalRow227TriangleData0865.coefficient60_96, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_98, Icur := OriginalRow227TriangleData0852.coefficient59_97,
    output := OriginalRow227TriangleData0865.coefficient60_97, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_99, Icur := OriginalRow227TriangleData0852.coefficient59_98,
    output := OriginalRow227TriangleData0865.coefficient60_98, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_100, Icur := OriginalRow227TriangleData0852.coefficient59_99,
    output := OriginalRow227TriangleData0865.coefficient60_99, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_101, Icur := OriginalRow227TriangleData0852.coefficient59_100,
    output := OriginalRow227TriangleData0865.coefficient60_100, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_102, Icur := OriginalRow227TriangleData0852.coefficient59_101,
    output := OriginalRow227TriangleData0865.coefficient60_101, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_103, Icur := OriginalRow227TriangleData0852.coefficient59_102,
    output := OriginalRow227TriangleData0865.coefficient60_102, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_104, Icur := OriginalRow227TriangleData0852.coefficient59_103,
    output := OriginalRow227TriangleData0865.coefficient60_103, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_105, Icur := OriginalRow227TriangleData0852.coefficient59_104,
    output := OriginalRow227TriangleData0865.coefficient60_104, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_106, Icur := OriginalRow227TriangleData0852.coefficient59_105,
    output := OriginalRow227TriangleData0865.coefficient60_105, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_107, Icur := OriginalRow227TriangleData0852.coefficient59_106,
    output := OriginalRow227TriangleData0865.coefficient60_106, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_108, Icur := OriginalRow227TriangleData0852.coefficient59_107,
    output := OriginalRow227TriangleData0865.coefficient60_107, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_109, Icur := OriginalRow227TriangleData0852.coefficient59_108,
    output := OriginalRow227TriangleData0865.coefficient60_108, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_110, Icur := OriginalRow227TriangleData0852.coefficient59_109,
    output := OriginalRow227TriangleData0865.coefficient60_109, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_111, Icur := OriginalRow227TriangleData0852.coefficient59_110,
    output := OriginalRow227TriangleData0865.coefficient60_110, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_112, Icur := OriginalRow227TriangleData0852.coefficient59_111,
    output := OriginalRow227TriangleData0865.coefficient60_111, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_113, Icur := OriginalRow227TriangleData0852.coefficient59_112,
    output := OriginalRow227TriangleData0865.coefficient60_112, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_114, Icur := OriginalRow227TriangleData0852.coefficient59_113,
    output := OriginalRow227TriangleData0865.coefficient60_113, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_115, Icur := OriginalRow227TriangleData0852.coefficient59_114,
    output := OriginalRow227TriangleData0865.coefficient60_114, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_116, Icur := OriginalRow227TriangleData0852.coefficient59_115,
    output := OriginalRow227TriangleData0865.coefficient60_115, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root117, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_117, Icur := OriginalRow227TriangleData0852.coefficient59_116,
    output := OriginalRow227TriangleData0865.coefficient60_116, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root118, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_118, Icur := OriginalRow227TriangleData0852.coefficient59_117,
    output := OriginalRow227TriangleData0865.coefficient60_117, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root119, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_119, Icur := OriginalRow227TriangleData0852.coefficient59_118,
    output := OriginalRow227TriangleData0865.coefficient60_118, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root120, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_120, Icur := OriginalRow227TriangleData0852.coefficient59_119,
    output := OriginalRow227TriangleData0865.coefficient60_119, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root121, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0852.coefficient59_121, Icur := OriginalRow227TriangleData0852.coefficient59_120,
    output := OriginalRow227TriangleData0865.coefficient60_120, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root122, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_122, Icur := OriginalRow227TriangleData0852.coefficient59_121,
    output := OriginalRow227TriangleData0865.coefficient60_121, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root123, IC := OriginalRow227TriangleRoots01.root60,
    Inext := OriginalRow227TriangleData0853.coefficient59_123, Icur := OriginalRow227TriangleData0853.coefficient59_122,
    output := OriginalRow227TriangleData0865.coefficient60_122, hC := OriginalRow227TriangleRoots01.root60_pos, hAC := OriginalRow227TriangleRoots01.product60_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0849

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0849.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
