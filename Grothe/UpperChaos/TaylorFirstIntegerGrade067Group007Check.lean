import Grothe.UpperChaos.TaylorFirstIntegerGrade067Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade067Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade067Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade067Part03584 = 431892790687711237665734039653947326145213020935355465577239479934707249025693535340105744893071367346323456 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade067Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade067Part03648 = 373253647704088192172292248972935513949926595593579834945329760957767107088866976068702292345273163202953216 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade067Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade067Part03712 = 282934543114835654612168664194533935234998907935450630937078268608492160418021959862328539327477859737403392 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade067Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade067Part03776 = 201923658122500885165070765578828371956693485067974110459183823932135643656815468000207559321394174857576448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade067Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade067Part03840 = 137580154595958257993808770617388629701226623398290823286489555406416668249180833223551838485604441773834240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade067Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade067Part03904 = 92207149468310363243114496863668441167613616576615815969283156064118454253446421324577152319664395850350592 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade067Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade067Part03968 = 85615876270692256681148308579881754429458700263638174745961093185706057560921564360624422300505330996477952 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade067Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade067Part04032 = 57939590993994382691770746155917969512319132437340838016276656232766831077103139977125093020033064605057024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade067Group007.size = 512 := by
  simp only [firstCenterIntegerGrade067Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade067Group007 = 1663347410958091230225108040617101942097450082208245693936841794322110171330049898157222642013023798369976320 := by
  simp only [firstCenterIntegerGrade067Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade067Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade067Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
