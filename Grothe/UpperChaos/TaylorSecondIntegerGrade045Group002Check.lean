import Grothe.UpperChaos.TaylorSecondIntegerGrade045Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade045Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade045Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade045Part01024 = 3901085379513283829007453523527744328483334099729042411609088670934831283821667751090629626701143956713897984 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade045Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade045Part01088 = 2485707994951941435600825011190693523615591493098530137688262762113614668205480418691502436085889647765356544 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade045Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade045Part01152 = 2959316091126831000648126160403553885800625073555316708779821768599297645637929024678215356303070668647301120 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade045Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade045Part01216 = 1835858499631715562447027838630086871366849926316356830741129452188346817284314415927445181975736674991210496 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade045Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade045Part01280 = 996918633028705637826357571662871955535026861283151285570979237824669308046751311237344888174377280970162176 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade045Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade045Part01344 = 1418640688807194551540000759948142473790730045267510214164703558024541156410561871433845877046039484500541440 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade045Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade045Part01408 = 914284865946822475562215268697760724083077649092763711654554875936591312450638933020929343179078920084389888 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade045Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade045Part01472 = 686742035129620124938432635111743650038251987002865128884874052764396688964833400658439756959032869698666496 := by decide +kernel

theorem group_length : secondCenterIntegerGrade045Group002.size = 512 := by
  simp only [secondCenterIntegerGrade045Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade045Group002 = 15198554188136114617570438769172597412713487135345536429093414378386288880822177126738352466424369503371526144 := by
  simp only [secondCenterIntegerGrade045Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade045Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade045Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
