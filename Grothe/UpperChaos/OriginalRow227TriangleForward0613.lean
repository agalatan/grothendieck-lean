import Grothe.UpperChaos.OriginalRow227TriangleData0615
import Grothe.UpperChaos.OriginalRow227TriangleData0616
import Grothe.UpperChaos.OriginalRow227TriangleData0629
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
namespace Grothe.UpperChaos.OriginalRow227TriangleForward0613
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ForwardEntry (-768)) := #[
  { charge := 33, IA := shift, ID := OriginalRow227TriangleRoots02.root74, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_74, Icur := OriginalRow227TriangleData0615.coefficient41_73,
    output := OriginalRow227TriangleData0629.coefficient42_73, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 34, IA := shift, ID := OriginalRow227TriangleRoots02.root75, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_75, Icur := OriginalRow227TriangleData0615.coefficient41_74,
    output := OriginalRow227TriangleData0629.coefficient42_74, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 35, IA := shift, ID := OriginalRow227TriangleRoots02.root76, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_76, Icur := OriginalRow227TriangleData0615.coefficient41_75,
    output := OriginalRow227TriangleData0629.coefficient42_75, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 36, IA := shift, ID := OriginalRow227TriangleRoots02.root77, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_77, Icur := OriginalRow227TriangleData0615.coefficient41_76,
    output := OriginalRow227TriangleData0629.coefficient42_76, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 37, IA := shift, ID := OriginalRow227TriangleRoots02.root78, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_78, Icur := OriginalRow227TriangleData0615.coefficient41_77,
    output := OriginalRow227TriangleData0629.coefficient42_77, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 38, IA := shift, ID := OriginalRow227TriangleRoots02.root79, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_79, Icur := OriginalRow227TriangleData0615.coefficient41_78,
    output := OriginalRow227TriangleData0629.coefficient42_78, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 39, IA := shift, ID := OriginalRow227TriangleRoots02.root80, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_80, Icur := OriginalRow227TriangleData0615.coefficient41_79,
    output := OriginalRow227TriangleData0629.coefficient42_79, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 40, IA := shift, ID := OriginalRow227TriangleRoots02.root81, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_81, Icur := OriginalRow227TriangleData0615.coefficient41_80,
    output := OriginalRow227TriangleData0629.coefficient42_80, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 41, IA := shift, ID := OriginalRow227TriangleRoots02.root82, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_82, Icur := OriginalRow227TriangleData0615.coefficient41_81,
    output := OriginalRow227TriangleData0629.coefficient42_81, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 42, IA := shift, ID := OriginalRow227TriangleRoots02.root83, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_83, Icur := OriginalRow227TriangleData0615.coefficient41_82,
    output := OriginalRow227TriangleData0629.coefficient42_82, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 43, IA := shift, ID := OriginalRow227TriangleRoots02.root84, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_84, Icur := OriginalRow227TriangleData0615.coefficient41_83,
    output := OriginalRow227TriangleData0629.coefficient42_83, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 44, IA := shift, ID := OriginalRow227TriangleRoots02.root85, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_85, Icur := OriginalRow227TriangleData0615.coefficient41_84,
    output := OriginalRow227TriangleData0629.coefficient42_84, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 45, IA := shift, ID := OriginalRow227TriangleRoots02.root86, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_86, Icur := OriginalRow227TriangleData0615.coefficient41_85,
    output := OriginalRow227TriangleData0629.coefficient42_85, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 46, IA := shift, ID := OriginalRow227TriangleRoots02.root87, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_87, Icur := OriginalRow227TriangleData0615.coefficient41_86,
    output := OriginalRow227TriangleData0629.coefficient42_86, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 47, IA := shift, ID := OriginalRow227TriangleRoots02.root88, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_88, Icur := OriginalRow227TriangleData0615.coefficient41_87,
    output := OriginalRow227TriangleData0629.coefficient42_87, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 48, IA := shift, ID := OriginalRow227TriangleRoots02.root89, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_89, Icur := OriginalRow227TriangleData0615.coefficient41_88,
    output := OriginalRow227TriangleData0629.coefficient42_88, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 49, IA := shift, ID := OriginalRow227TriangleRoots02.root90, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_90, Icur := OriginalRow227TriangleData0615.coefficient41_89,
    output := OriginalRow227TriangleData0629.coefficient42_89, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 50, IA := shift, ID := OriginalRow227TriangleRoots02.root91, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_91, Icur := OriginalRow227TriangleData0615.coefficient41_90,
    output := OriginalRow227TriangleData0629.coefficient42_90, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 51, IA := shift, ID := OriginalRow227TriangleRoots02.root92, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_92, Icur := OriginalRow227TriangleData0615.coefficient41_91,
    output := OriginalRow227TriangleData0629.coefficient42_91, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 52, IA := shift, ID := OriginalRow227TriangleRoots02.root93, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_93, Icur := OriginalRow227TriangleData0615.coefficient41_92,
    output := OriginalRow227TriangleData0629.coefficient42_92, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 53, IA := shift, ID := OriginalRow227TriangleRoots02.root94, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_94, Icur := OriginalRow227TriangleData0615.coefficient41_93,
    output := OriginalRow227TriangleData0629.coefficient42_93, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 54, IA := shift, ID := OriginalRow227TriangleRoots02.root95, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_95, Icur := OriginalRow227TriangleData0615.coefficient41_94,
    output := OriginalRow227TriangleData0629.coefficient42_94, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 55, IA := shift, ID := OriginalRow227TriangleRoots02.root96, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_96, Icur := OriginalRow227TriangleData0615.coefficient41_95,
    output := OriginalRow227TriangleData0629.coefficient42_95, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 56, IA := shift, ID := OriginalRow227TriangleRoots03.root97, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_97, Icur := OriginalRow227TriangleData0615.coefficient41_96,
    output := OriginalRow227TriangleData0629.coefficient42_96, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 57, IA := shift, ID := OriginalRow227TriangleRoots03.root98, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_98, Icur := OriginalRow227TriangleData0615.coefficient41_97,
    output := OriginalRow227TriangleData0629.coefficient42_97, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 58, IA := shift, ID := OriginalRow227TriangleRoots03.root99, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_99, Icur := OriginalRow227TriangleData0615.coefficient41_98,
    output := OriginalRow227TriangleData0629.coefficient42_98, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 59, IA := shift, ID := OriginalRow227TriangleRoots03.root100, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_100, Icur := OriginalRow227TriangleData0615.coefficient41_99,
    output := OriginalRow227TriangleData0629.coefficient42_99, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 60, IA := shift, ID := OriginalRow227TriangleRoots03.root101, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_101, Icur := OriginalRow227TriangleData0615.coefficient41_100,
    output := OriginalRow227TriangleData0629.coefficient42_100, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 61, IA := shift, ID := OriginalRow227TriangleRoots03.root102, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_102, Icur := OriginalRow227TriangleData0615.coefficient41_101,
    output := OriginalRow227TriangleData0629.coefficient42_101, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 62, IA := shift, ID := OriginalRow227TriangleRoots03.root103, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0615.coefficient41_103, Icur := OriginalRow227TriangleData0615.coefficient41_102,
    output := OriginalRow227TriangleData0629.coefficient42_102, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 63, IA := shift, ID := OriginalRow227TriangleRoots03.root104, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_104, Icur := OriginalRow227TriangleData0615.coefficient41_103,
    output := OriginalRow227TriangleData0629.coefficient42_103, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos },
  { charge := 64, IA := shift, ID := OriginalRow227TriangleRoots03.root105, IC := OriginalRow227TriangleRoots01.root42,
    Inext := OriginalRow227TriangleData0616.coefficient41_105, Icur := OriginalRow227TriangleData0616.coefficient41_104,
    output := OriginalRow227TriangleData0629.coefficient42_104, hC := OriginalRow227TriangleRoots01.root42_pos, hAC := OriginalRow227TriangleRoots01.product42_pos }
]

theorem checked : blockCheck ForwardEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleForward0613

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleForward0613.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
