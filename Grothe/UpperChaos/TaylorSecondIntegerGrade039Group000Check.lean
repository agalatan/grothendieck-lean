import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade039Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade039Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade039Part00000 = 917372332961468111066076435013096258739177818006687749218492969573618515892962544377527537787722166007383457792 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade039Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade039Part00064 = 1410682052355953876836229486499361131447148994327590482206185831449911445351924275292833928076494873171452755968 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade039Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade039Part00128 = 374137147434801422253087717930268772310345364953806433055545803999612849694785044954292805066314480840842674176 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade039Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade039Part00192 = 351724210378175342257888802471482006191099865190242591305312177962779681677683259217395947972223263691841208320 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade039Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade039Part00256 = 117706417831231058877185727903700008728405556738532808635185788976286541012688171350255886303116340403705479168 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade039Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade039Part00320 = 221809341224512450939287775444320238664719580740014036217771763172342869990481877792961922800338119422306680832 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade039Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade039Part00384 = 84141225104249446185920367568255842959292165516650289438109272496248810814002285850975187887568252887912939520 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade039Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade039Part00448 = 58293098716104658538665000486190254274351760933820978870500801164481083441381773159435476517413831313507483648 := by decide +kernel

theorem group_length : secondCenterIntegerGrade039Group000.size = 512 := by
  simp only [secondCenterIntegerGrade039Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade039Group000 = 3535865826006496366954341313316674513314541106407345368947104408795281797875909231995678692411191327738952679424 := by
  simp only [secondCenterIntegerGrade039Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade039Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
