import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part03584 = 7163000072542176671739179069469255535327221566852574422927761419149221337791019314936283800901507681878016 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part03648 = 3262623849932982442763058398138972206638352350656330948459530697290279268373537197841309755415488525924040704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part03712 = 2416808082884036055227082767260390383675013397354375799472553296137042614068667857807441627702026941207937024 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part03776 = 1754965424164622655641372952060744504108915496691857425515210890071302005214900718465755186698256127845466112 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part03840 = 3605640172599776377234429288732851072322720224674672899314780471766661503874444218693460296880069160206336 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part03904 = 1250357382182394636502666406974467531514988340671271098623921461714311043757613098188614708688941963540430848 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part03968 = 874494515784028273336750115340082311151887647200840150749413379811174125928887608506354855873952671877562368 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part04032 = 588508745967294724367062456534847194433386653823623345654569118807788125757385197174415117623301126144131072 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group007.size = 512 := by
  simp only [firstCenterIntegerGrade085Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group007 = 10158526641160500740886966704667706238130193828189826015797441385722813065942657141517520996099748933381652480 := by
  simp only [firstCenterIntegerGrade085Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
