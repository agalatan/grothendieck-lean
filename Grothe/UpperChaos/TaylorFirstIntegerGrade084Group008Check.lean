import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group008Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group008Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part04096.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part04096 = 369485659379829898064441278348970295888934118747036399340654436748256320784414747525380730193383748225990656 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part04160.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part04160 = 252485251889142571396299610067513000538839801000492012755312473161605294610596975891341412872826643107807232 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part04224.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part04224 = 2850863148935187465713987532842857328665221545968739182510585635707655051908046168938572315957207249190912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part04288.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part04288 = 183617710125926368692074531006119147091487673484505976588190537075516758791630906419031332636478495944343552 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part04352.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part04352 = 137638254818781070272495590415432862785803471952228960594213594861994501802915589677823626347564553369288704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part04416.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part04416 = 98341256578543235151427550494349859007528406336253716295783338256195281969072142779070142471519585859272704 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part04480.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part04480 = 2083521703839329239523789609993612416780403176409373377304802656727634982413822606505399330300098955444224 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part04544.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part04544 = 70940576277697488630677745560489675890717670343299755228702176804347595806325946078908905988476398106312704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group008.size = 512 := by
  simp only [firstCenterIntegerGrade084Group008, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group008 = 1117443093922695148912654083035711310948756766586194933362671945200351043799278177147000122156506730817650688 := by
  simp only [firstCenterIntegerGrade084Group008, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group008Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group008Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group008Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
