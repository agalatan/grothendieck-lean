import Grothe.UpperChaos.TaylorSecondIntegerGrade041Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade041Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade041Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade041Part01024 = 4311803168028506644979583043878225339805296545895168594508908302593553587545378709847111869972975545609093120 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade041Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade041Part01088 = 3188732876065872439215730650397759239937920122098026740807679092094783957294441619499457878554744106755555328 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade041Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade041Part01152 = 2385736370554601247379606885646905956787016083598644315974017598067998899133864065458129960749746001721425920 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade041Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade041Part01216 = 1558464208702691785232733792659265791539834555237604650098750246822666051377820984544570044995460704952647680 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade041Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade041Part01280 = 1895414827521343320105543367108951283229022698637381624042201995278284706964854723904773697983880417048002560 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade041Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade041Part01344 = 1017449143070674728480801843494359109872924017082580897029466921995605824986694287220074783577942089592209408 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade041Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade041Part01408 = 1054064049655175207204018236181704876796137566238926868937988303977502318348701156163111876046411620803411968 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade041Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade041Part01472 = 624918915036845616604027950099754726919039033168926906836754676121491685565581342577318621137098574472937472 := by decide +kernel

theorem group_length : secondCenterIntegerGrade041Group002.size = 512 := by
  simp only [secondCenterIntegerGrade041Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade041Group002 = 16036583558635710989202045769466926324887190621957260598235767136951887031217336889214548733018259060955283456 := by
  simp only [secondCenterIntegerGrade041Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade041Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade041Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
