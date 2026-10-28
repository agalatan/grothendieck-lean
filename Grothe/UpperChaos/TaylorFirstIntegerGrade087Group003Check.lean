import Grothe.UpperChaos.TaylorFirstIntegerGrade087Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade087Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade087Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade087Part01536 = 23705507976139200649595794605308432856929128363878442823757136456019166785685351829526421333466873993069854720 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade087Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade087Part01600 = 279156255248090990516864237626456745377980842045572089868911442654610881844708945057521345672945886716435103744 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade087Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade087Part01664 = 275792451277221186575034047626994391673831541151805151340594810457739388957610612950604020840715040704897744896 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade087Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade087Part01728 = 245127720085664334006534085953962832715374489084339493444257318921019100368327410926004417256390648865388232704 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade087Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade087Part01792 = 312317240886570591123150202695442314806052997630998819510599123513974385492634999444729045295809007171141632 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade087Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade087Part01856 = 212714787646065924450733839493601025709337738883656493752078547927189226989778310665487981473454362941749985280 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade087Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade087Part01920 = 182093332063433225160852794097932384945441461598174459807619235525281887568006617522109856901917500554245832704 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade087Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade087Part01984 = 41322451809625535375440705639513424175248985933138196989326244301613609921318811140833453218431521772365938688 := by decide +kernel

theorem group_length : firstCenterIntegerGrade087Group003.size = 512 := by
  simp only [firstCenterIntegerGrade087Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade087Group003 = 1260224823347126967326178655246464679768950240058195326846055335366987236820928695091532225742617644555323834368 := by
  simp only [firstCenterIntegerGrade087Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade087Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade087Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
