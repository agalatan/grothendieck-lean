import Grothe.UpperChaos.OriginalRow227TriangleData0314
import Grothe.UpperChaos.OriginalRow227TriangleData0315
import Grothe.UpperChaos.OriginalRow227TriangleData0329
import Grothe.UpperChaos.OriginalRow227TriangleRoots00
import Grothe.UpperChaos.OriginalRow227TriangleRoots02
import Grothe.UpperChaos.OriginalRow227TriangleRoots03
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0313
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_85, Icur := OriginalRow227TriangleData0314.coefficient20_84,
    output := OriginalRow227TriangleData0329.coefficient21_84, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_86, Icur := OriginalRow227TriangleData0314.coefficient20_85,
    output := OriginalRow227TriangleData0329.coefficient21_85, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_87, Icur := OriginalRow227TriangleData0314.coefficient20_86,
    output := OriginalRow227TriangleData0329.coefficient21_86, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_88, Icur := OriginalRow227TriangleData0314.coefficient20_87,
    output := OriginalRow227TriangleData0329.coefficient21_87, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_89, Icur := OriginalRow227TriangleData0314.coefficient20_88,
    output := OriginalRow227TriangleData0329.coefficient21_88, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_90, Icur := OriginalRow227TriangleData0314.coefficient20_89,
    output := OriginalRow227TriangleData0329.coefficient21_89, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_91, Icur := OriginalRow227TriangleData0314.coefficient20_90,
    output := OriginalRow227TriangleData0329.coefficient21_90, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_92, Icur := OriginalRow227TriangleData0314.coefficient20_91,
    output := OriginalRow227TriangleData0329.coefficient21_91, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_93, Icur := OriginalRow227TriangleData0314.coefficient20_92,
    output := OriginalRow227TriangleData0329.coefficient21_92, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_94, Icur := OriginalRow227TriangleData0314.coefficient20_93,
    output := OriginalRow227TriangleData0329.coefficient21_93, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_95, Icur := OriginalRow227TriangleData0314.coefficient20_94,
    output := OriginalRow227TriangleData0329.coefficient21_94, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_96, Icur := OriginalRow227TriangleData0314.coefficient20_95,
    output := OriginalRow227TriangleData0329.coefficient21_95, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_97, Icur := OriginalRow227TriangleData0314.coefficient20_96,
    output := OriginalRow227TriangleData0329.coefficient21_96, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_98, Icur := OriginalRow227TriangleData0314.coefficient20_97,
    output := OriginalRow227TriangleData0329.coefficient21_97, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_99, Icur := OriginalRow227TriangleData0314.coefficient20_98,
    output := OriginalRow227TriangleData0329.coefficient21_98, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_100, Icur := OriginalRow227TriangleData0314.coefficient20_99,
    output := OriginalRow227TriangleData0329.coefficient21_99, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_101, Icur := OriginalRow227TriangleData0314.coefficient20_100,
    output := OriginalRow227TriangleData0329.coefficient21_100, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_102, Icur := OriginalRow227TriangleData0314.coefficient20_101,
    output := OriginalRow227TriangleData0329.coefficient21_101, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_103, Icur := OriginalRow227TriangleData0314.coefficient20_102,
    output := OriginalRow227TriangleData0329.coefficient21_102, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_104, Icur := OriginalRow227TriangleData0314.coefficient20_103,
    output := OriginalRow227TriangleData0329.coefficient21_103, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_105, Icur := OriginalRow227TriangleData0314.coefficient20_104,
    output := OriginalRow227TriangleData0329.coefficient21_104, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_106, Icur := OriginalRow227TriangleData0314.coefficient20_105,
    output := OriginalRow227TriangleData0329.coefficient21_105, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_107, Icur := OriginalRow227TriangleData0314.coefficient20_106,
    output := OriginalRow227TriangleData0329.coefficient21_106, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_108, Icur := OriginalRow227TriangleData0314.coefficient20_107,
    output := OriginalRow227TriangleData0329.coefficient21_107, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_109, Icur := OriginalRow227TriangleData0314.coefficient20_108,
    output := OriginalRow227TriangleData0329.coefficient21_108, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_110, Icur := OriginalRow227TriangleData0314.coefficient20_109,
    output := OriginalRow227TriangleData0329.coefficient21_109, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_111, Icur := OriginalRow227TriangleData0314.coefficient20_110,
    output := OriginalRow227TriangleData0329.coefficient21_110, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_112, Icur := OriginalRow227TriangleData0314.coefficient20_111,
    output := OriginalRow227TriangleData0329.coefficient21_111, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_113, Icur := OriginalRow227TriangleData0314.coefficient20_112,
    output := OriginalRow227TriangleData0329.coefficient21_112, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root114, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0314.coefficient20_114, Icur := OriginalRow227TriangleData0314.coefficient20_113,
    output := OriginalRow227TriangleData0329.coefficient21_113, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root115, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_115, Icur := OriginalRow227TriangleData0314.coefficient20_114,
    output := OriginalRow227TriangleData0329.coefficient21_114, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root116, IC := OriginalRow227TriangleRoots00.root21,
    Inext := OriginalRow227TriangleData0315.coefficient20_116, Icur := OriginalRow227TriangleData0315.coefficient20_115,
    output := OriginalRow227TriangleData0329.coefficient21_115, hC := OriginalRow227TriangleRoots00.root21_pos, hAC := OriginalRow227TriangleRoots00.product21_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0313

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0313.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
