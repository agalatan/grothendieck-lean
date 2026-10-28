import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part03072 = 1261768726830211195662228586970134713601498928608288603543404896469234096800559068229094647526256827210661888 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part03136 = 1057286854853473320564112305033060668883512595482546627725324089627113542560760535457578921837128291310370816 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part03200 = 739048910859967564325516826276614227625674534095879219504685020352748834214794421037245976504877234450857984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part03264 = 431147457865325497942032933467387291209367242502523222028247405695763176471585493031842515299682358847864832 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part03328 = 331830696221853531511639221724320064685600614633328072677766346384959849898098218190742079286660825557762048 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part03392 = 263003252201369928034393118344870698497941328209198867926984355825653770959958688817647857134395226832502784 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part03456 = 182646273597783625172635697942007645380652164573221131078189534616249351723218985303595767441758579213729792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part03520 = 219119392773148102815284153611946965318506724417820118350735318265407426742911866281007827784414293630386176 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group006.size = 512 := by
  simp only [firstCenterIntegerGrade060Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group006 = 4485851565203132766027842843370342275202754132522805862835336967237130049371887276348755592815173637054136320 := by
  simp only [firstCenterIntegerGrade060Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
