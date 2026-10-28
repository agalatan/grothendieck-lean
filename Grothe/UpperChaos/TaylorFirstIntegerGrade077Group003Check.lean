import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part01536 = 519956015620192604598330620604497823946615886549198896362415245006955280598400543824285946905859543489207861248 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part01600 = 435481862741875752513348987918723183782396150516599292710281356599006949181591139624350177944454073328993304576 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part01664 = 7466570564498043130113453227637017701984747411350068112169653472581334798008830401240010211363183364382130176 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part01728 = 371518555829338375931868610359234985497405412134714579449050426666058911838410812222453167419144376505562300416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part01792 = 308750614131824566517946533481301299481134347758599427231510810440381993965176404820859044042987772336618340352 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part01856 = 254805821053097676685597584524120135163524093808784756243908446417962570292120797173322163835504179689958670336 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part01920 = 209176113518549475233644899551997400263829057572467271475747377965888079050519392722564447260873481883924561920 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part01984 = 981437252674686483620367189201113230807550127287960210121368435034489551326360616028000351447621129232973824 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group003.size = 512 := by
  simp only [firstCenterIntegerGrade077Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group003 = 2108136990712051181094471056856712959067697245879002251795204685003869609275554281405102957971634231727880142848 := by
  simp only [firstCenterIntegerGrade077Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
