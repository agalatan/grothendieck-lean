import Grothe.UpperChaos.OriginalRow227RatioData09
import Grothe.UpperChaos.OriginalRow227TriangleData0009
import Grothe.UpperChaos.OriginalRow227TriangleData0010
import Grothe.UpperChaos.OriginalRow227TriangleRoots09
import Grothe.UpperChaos.OriginalRow227TriangleShared
import Lean.Elab.Command
import Lean.Util.CollectAxioms

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace Grothe.UpperChaos.OriginalRow227TriangleZero09
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

open OriginalRow227TriangleShared

def entries : Array (ZeroEntry (-768)) := #[
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[0]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root289,
    IU := OriginalRow227TriangleData0009.coefficient0_288, next := OriginalRow227TriangleData0009.coefficient0_289, hS := OriginalRow227TriangleRoots09.root289_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[1]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root290,
    IU := OriginalRow227TriangleData0009.coefficient0_289, next := OriginalRow227TriangleData0009.coefficient0_290, hS := OriginalRow227TriangleRoots09.root290_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[2]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root291,
    IU := OriginalRow227TriangleData0009.coefficient0_290, next := OriginalRow227TriangleData0009.coefficient0_291, hS := OriginalRow227TriangleRoots09.root291_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[3]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root292,
    IU := OriginalRow227TriangleData0009.coefficient0_291, next := OriginalRow227TriangleData0009.coefficient0_292, hS := OriginalRow227TriangleRoots09.root292_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[4]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root293,
    IU := OriginalRow227TriangleData0009.coefficient0_292, next := OriginalRow227TriangleData0009.coefficient0_293, hS := OriginalRow227TriangleRoots09.root293_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[5]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root294,
    IU := OriginalRow227TriangleData0009.coefficient0_293, next := OriginalRow227TriangleData0009.coefficient0_294, hS := OriginalRow227TriangleRoots09.root294_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[6]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root295,
    IU := OriginalRow227TriangleData0009.coefficient0_294, next := OriginalRow227TriangleData0009.coefficient0_295, hS := OriginalRow227TriangleRoots09.root295_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[7]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root296,
    IU := OriginalRow227TriangleData0009.coefficient0_295, next := OriginalRow227TriangleData0009.coefficient0_296, hS := OriginalRow227TriangleRoots09.root296_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[8]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root297,
    IU := OriginalRow227TriangleData0009.coefficient0_296, next := OriginalRow227TriangleData0009.coefficient0_297, hS := OriginalRow227TriangleRoots09.root297_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[9]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root298,
    IU := OriginalRow227TriangleData0009.coefficient0_297, next := OriginalRow227TriangleData0009.coefficient0_298, hS := OriginalRow227TriangleRoots09.root298_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[10]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root299,
    IU := OriginalRow227TriangleData0009.coefficient0_298, next := OriginalRow227TriangleData0009.coefficient0_299, hS := OriginalRow227TriangleRoots09.root299_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[11]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root300,
    IU := OriginalRow227TriangleData0009.coefficient0_299, next := OriginalRow227TriangleData0009.coefficient0_300, hS := OriginalRow227TriangleRoots09.root300_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[12]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root301,
    IU := OriginalRow227TriangleData0009.coefficient0_300, next := OriginalRow227TriangleData0009.coefficient0_301, hS := OriginalRow227TriangleRoots09.root301_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[13]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root302,
    IU := OriginalRow227TriangleData0009.coefficient0_301, next := OriginalRow227TriangleData0009.coefficient0_302, hS := OriginalRow227TriangleRoots09.root302_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[14]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root303,
    IU := OriginalRow227TriangleData0009.coefficient0_302, next := OriginalRow227TriangleData0009.coefficient0_303, hS := OriginalRow227TriangleRoots09.root303_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[15]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root304,
    IU := OriginalRow227TriangleData0009.coefficient0_303, next := OriginalRow227TriangleData0009.coefficient0_304, hS := OriginalRow227TriangleRoots09.root304_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[16]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root305,
    IU := OriginalRow227TriangleData0009.coefficient0_304, next := OriginalRow227TriangleData0009.coefficient0_305, hS := OriginalRow227TriangleRoots09.root305_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[17]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root306,
    IU := OriginalRow227TriangleData0009.coefficient0_305, next := OriginalRow227TriangleData0009.coefficient0_306, hS := OriginalRow227TriangleRoots09.root306_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[18]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root307,
    IU := OriginalRow227TriangleData0009.coefficient0_306, next := OriginalRow227TriangleData0009.coefficient0_307, hS := OriginalRow227TriangleRoots09.root307_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[19]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root308,
    IU := OriginalRow227TriangleData0009.coefficient0_307, next := OriginalRow227TriangleData0009.coefficient0_308, hS := OriginalRow227TriangleRoots09.root308_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[20]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root309,
    IU := OriginalRow227TriangleData0009.coefficient0_308, next := OriginalRow227TriangleData0009.coefficient0_309, hS := OriginalRow227TriangleRoots09.root309_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[21]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root310,
    IU := OriginalRow227TriangleData0009.coefficient0_309, next := OriginalRow227TriangleData0009.coefficient0_310, hS := OriginalRow227TriangleRoots09.root310_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[22]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root311,
    IU := OriginalRow227TriangleData0009.coefficient0_310, next := OriginalRow227TriangleData0009.coefficient0_311, hS := OriginalRow227TriangleRoots09.root311_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[23]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root312,
    IU := OriginalRow227TriangleData0009.coefficient0_311, next := OriginalRow227TriangleData0009.coefficient0_312, hS := OriginalRow227TriangleRoots09.root312_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[24]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root313,
    IU := OriginalRow227TriangleData0009.coefficient0_312, next := OriginalRow227TriangleData0009.coefficient0_313, hS := OriginalRow227TriangleRoots09.root313_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[25]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root314,
    IU := OriginalRow227TriangleData0009.coefficient0_313, next := OriginalRow227TriangleData0009.coefficient0_314, hS := OriginalRow227TriangleRoots09.root314_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[26]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root315,
    IU := OriginalRow227TriangleData0009.coefficient0_314, next := OriginalRow227TriangleData0009.coefficient0_315, hS := OriginalRow227TriangleRoots09.root315_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[27]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root316,
    IU := OriginalRow227TriangleData0009.coefficient0_315, next := OriginalRow227TriangleData0009.coefficient0_316, hS := OriginalRow227TriangleRoots09.root316_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[28]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root317,
    IU := OriginalRow227TriangleData0009.coefficient0_316, next := OriginalRow227TriangleData0009.coefficient0_317, hS := OriginalRow227TriangleRoots09.root317_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[29]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root318,
    IU := OriginalRow227TriangleData0009.coefficient0_317, next := OriginalRow227TriangleData0009.coefficient0_318, hS := OriginalRow227TriangleRoots09.root318_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[30]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root319,
    IU := OriginalRow227TriangleData0009.coefficient0_318, next := OriginalRow227TriangleData0009.coefficient0_319, hS := OriginalRow227TriangleRoots09.root319_pos },
  { IA := shift, IR := (OriginalRow227RatioData09.checkpoints[31]'(by rw [OriginalRow227RatioData09.checkpoints_size]; decide)), IS := OriginalRow227TriangleRoots09.root320,
    IU := OriginalRow227TriangleData0009.coefficient0_319, next := OriginalRow227TriangleData0010.coefficient0_320, hS := OriginalRow227TriangleRoots09.root320_pos }
]

theorem checked : blockCheck ZeroEntry.check entries = true := by
  decide +kernel

end Grothe.UpperChaos.OriginalRow227TriangleZero09

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for dependency in (← Lean.collectAxioms ``Grothe.UpperChaos.OriginalRow227TriangleZero09.checked) do
    unless allowed.contains dependency do
      throwError m!"unexpected axiom {dependency}"
