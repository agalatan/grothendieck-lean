import Grothe.UpperChaos.OriginalRow227TriangleData0269
import Grothe.UpperChaos.OriginalRow227TriangleData0270
import Grothe.UpperChaos.OriginalRow227TriangleData0284
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0268
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 65, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_82, Icur := OriginalRow227TriangleData0269.coefficient17_81,
    output := OriginalRow227TriangleData0284.coefficient18_81, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 66, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_83, Icur := OriginalRow227TriangleData0269.coefficient17_82,
    output := OriginalRow227TriangleData0284.coefficient18_82, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 67, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_84, Icur := OriginalRow227TriangleData0269.coefficient17_83,
    output := OriginalRow227TriangleData0284.coefficient18_83, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 68, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_85, Icur := OriginalRow227TriangleData0269.coefficient17_84,
    output := OriginalRow227TriangleData0284.coefficient18_84, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 69, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_86, Icur := OriginalRow227TriangleData0269.coefficient17_85,
    output := OriginalRow227TriangleData0284.coefficient18_85, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 70, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_87, Icur := OriginalRow227TriangleData0269.coefficient17_86,
    output := OriginalRow227TriangleData0284.coefficient18_86, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 71, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_88, Icur := OriginalRow227TriangleData0269.coefficient17_87,
    output := OriginalRow227TriangleData0284.coefficient18_87, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 72, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_89, Icur := OriginalRow227TriangleData0269.coefficient17_88,
    output := OriginalRow227TriangleData0284.coefficient18_88, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 73, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_90, Icur := OriginalRow227TriangleData0269.coefficient17_89,
    output := OriginalRow227TriangleData0284.coefficient18_89, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 74, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_91, Icur := OriginalRow227TriangleData0269.coefficient17_90,
    output := OriginalRow227TriangleData0284.coefficient18_90, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 75, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_92, Icur := OriginalRow227TriangleData0269.coefficient17_91,
    output := OriginalRow227TriangleData0284.coefficient18_91, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 76, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_93, Icur := OriginalRow227TriangleData0269.coefficient17_92,
    output := OriginalRow227TriangleData0284.coefficient18_92, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 77, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_94, Icur := OriginalRow227TriangleData0269.coefficient17_93,
    output := OriginalRow227TriangleData0284.coefficient18_93, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 78, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_95, Icur := OriginalRow227TriangleData0269.coefficient17_94,
    output := OriginalRow227TriangleData0284.coefficient18_94, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 79, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_96, Icur := OriginalRow227TriangleData0269.coefficient17_95,
    output := OriginalRow227TriangleData0284.coefficient18_95, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 80, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_97, Icur := OriginalRow227TriangleData0269.coefficient17_96,
    output := OriginalRow227TriangleData0284.coefficient18_96, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 81, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_98, Icur := OriginalRow227TriangleData0269.coefficient17_97,
    output := OriginalRow227TriangleData0284.coefficient18_97, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 82, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_99, Icur := OriginalRow227TriangleData0269.coefficient17_98,
    output := OriginalRow227TriangleData0284.coefficient18_98, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 83, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_100, Icur := OriginalRow227TriangleData0269.coefficient17_99,
    output := OriginalRow227TriangleData0284.coefficient18_99, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 84, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_101, Icur := OriginalRow227TriangleData0269.coefficient17_100,
    output := OriginalRow227TriangleData0284.coefficient18_100, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 85, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_102, Icur := OriginalRow227TriangleData0269.coefficient17_101,
    output := OriginalRow227TriangleData0284.coefficient18_101, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 86, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_103, Icur := OriginalRow227TriangleData0269.coefficient17_102,
    output := OriginalRow227TriangleData0284.coefficient18_102, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 87, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_104, Icur := OriginalRow227TriangleData0269.coefficient17_103,
    output := OriginalRow227TriangleData0284.coefficient18_103, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 88, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_105, Icur := OriginalRow227TriangleData0269.coefficient17_104,
    output := OriginalRow227TriangleData0284.coefficient18_104, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 89, IA := shift, ID := OriginalRow227TriangleRoots03.root106, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_106, Icur := OriginalRow227TriangleData0269.coefficient17_105,
    output := OriginalRow227TriangleData0284.coefficient18_105, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 90, IA := shift, ID := OriginalRow227TriangleRoots03.root107, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_107, Icur := OriginalRow227TriangleData0269.coefficient17_106,
    output := OriginalRow227TriangleData0284.coefficient18_106, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 91, IA := shift, ID := OriginalRow227TriangleRoots03.root108, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_108, Icur := OriginalRow227TriangleData0269.coefficient17_107,
    output := OriginalRow227TriangleData0284.coefficient18_107, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 92, IA := shift, ID := OriginalRow227TriangleRoots03.root109, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_109, Icur := OriginalRow227TriangleData0269.coefficient17_108,
    output := OriginalRow227TriangleData0284.coefficient18_108, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 93, IA := shift, ID := OriginalRow227TriangleRoots03.root110, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_110, Icur := OriginalRow227TriangleData0269.coefficient17_109,
    output := OriginalRow227TriangleData0284.coefficient18_109, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 94, IA := shift, ID := OriginalRow227TriangleRoots03.root111, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0269.coefficient17_111, Icur := OriginalRow227TriangleData0269.coefficient17_110,
    output := OriginalRow227TriangleData0284.coefficient18_110, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 95, IA := shift, ID := OriginalRow227TriangleRoots03.root112, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_112, Icur := OriginalRow227TriangleData0269.coefficient17_111,
    output := OriginalRow227TriangleData0284.coefficient18_111, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos },
  { charge := 96, IA := shift, ID := OriginalRow227TriangleRoots03.root113, IC := OriginalRow227TriangleRoots00.root18,
    Inext := OriginalRow227TriangleData0270.coefficient17_113, Icur := OriginalRow227TriangleData0270.coefficient17_112,
    output := OriginalRow227TriangleData0284.coefficient18_112, hC := OriginalRow227TriangleRoots00.root18_pos, hAC := OriginalRow227TriangleRoots00.product18_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0268

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0268.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
