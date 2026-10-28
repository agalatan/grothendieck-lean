import Grothe.UpperChaos.TaylorFirstIntegerGrade068Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade068Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade068Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade068Part03584 = 374644574299609236349936397440999279679228950299657364162186749748497678329078098526996917760634413729710080 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade068Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade068Part03648 = 298806756050908901207395471640836112497423774579120494578736128065877846802268612402299534826527583952175104 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade068Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade068Part03712 = 69002593152049666714895566182249440496276476856370244641828648284609967625847190471822966583054465014693888 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade068Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade068Part03776 = 244269614467030918311031196921741936141891172933377314088445043414703808225166440312101747372869386502144000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade068Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade068Part03840 = 196451871919006260998571430178606980984359362788656209769431645430854576696777699472569948388729388579946496 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade068Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade068Part03904 = 140442798830045319717253097295505346443361929949236452894141452455644098599958187773431902697965275257503744 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade068Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade068Part03968 = 95900893058304150404642513931283980700566359316960321602739933701229286457626435030562822840800253478699008 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade068Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade068Part04032 = 66482045557158938398665741211250955050572785737966488174333481373364388584964788576044579657697467857633280 := by decide +kernel

theorem group_length : firstCenterIntegerGrade068Group007.size = 512 := by
  simp only [firstCenterIntegerGrade068Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade068Group007 = 1486001147334113392102391414802474031993680812461344889911843082474781651321687452565830420128278234372505600 := by
  simp only [firstCenterIntegerGrade068Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade068Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade068Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
