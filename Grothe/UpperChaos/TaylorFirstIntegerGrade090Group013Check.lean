import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part06656 = 6323920768866550714481608556033862302379763731758438064292715384465030220792348047986081482174274344058880 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part06720 = 4103565709823779760419286178706129310297141924155331866566153305062655097483876780327626134404095809683456 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part06784 = 10164228116820987823811983775116331554351000005113637478955877004525666946115871979999135338993540269080576 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part06848 = 9965860605013940530553729373230049787240387411580254295921823977317068430010777256696847222317352398880768 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part06912 = 1102110993879283611117139290581037055797602981374671392728902471296011338465559979395145762021825641971712 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part06976 = 10027725099217821739169426142416678389238521862539017716233278100007324598906236230159013745995773921722368 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part07040 = 11294725348397623789734196450351237184916784572395237774832612736190088533465299239813962156473374251941888 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part07104 = 3868579432248108166656155048723159141051344972350242479741601937074029598770469215145897357735486744952832 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group013.size = 512 := by
  simp only [firstCenterIntegerGrade090Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group013 = 56850716074268096135943524815158484725272547461266831069272964915937874764010438729523709200115723382292480 := by
  simp only [firstCenterIntegerGrade090Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
