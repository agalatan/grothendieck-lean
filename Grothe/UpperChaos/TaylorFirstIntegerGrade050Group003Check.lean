import Grothe.UpperChaos.TaylorFirstIntegerGrade050Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade050Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade050Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade050Part01536 = 241351909586284227208353739021623989727582407036581057590581461804695873669739744368332897493368952135939522560 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade050Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade050Part01600 = 222636097568482308887527295791363492551281034605831142503613602736658165385825097814833857882833643343301312512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade050Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade050Part01664 = 158820613116450920401351632836652708079131165203170798070055668152758154904138033207295423947116702501590532096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade050Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade050Part01728 = 97693003593702416561867571771668315211429872576904860987389221082475040587727439248677769283307314388767080448 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade050Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade050Part01792 = 91397789455229290543925686741476452843806100018990107195965098301239124426814625087809474435638305418700128256 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade050Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade050Part01856 = 84295480458899145177571714291288886985802404464981702958137340491121857209111093880432909806577061545432317952 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade050Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade050Part01920 = 58443414683513225148719509808394146506457580544799076992570732795744306857109254129586854904318974522116014080 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade050Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade050Part01984 = 10344889669380504852402600427682990401362753504900553706771178117620661723213591631216172739966292629036990464 := by decide +kernel

theorem group_length : firstCenterIntegerGrade050Group003.size = 512 := by
  simp only [firstCenterIntegerGrade050Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade050Group003 = 964983198131942038781719750690150982306853317956159300005084303482313184763678879368185360493127246484883898368 := by
  simp only [firstCenterIntegerGrade050Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade050Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade050Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
