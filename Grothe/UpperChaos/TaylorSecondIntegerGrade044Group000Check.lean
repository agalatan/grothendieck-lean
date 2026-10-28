import Grothe.UpperChaos.TaylorSecondIntegerGrade044Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade044Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade044Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade044Part00000 = 767219190869228568890131282837481906330909981435907352601148743416344793755481233984487803156712358213696094208 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade044Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade044Part00064 = 658105467654180242970263707941418283715421773104458863940714748811645680098967580762924666365923563905155596288 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade044Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade044Part00128 = 478292759378747294532303578228011550233155219279787712325217713631679622057354673747131870129800874912949207040 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade044Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade044Part00192 = 138285298818312563435101429874802415321515212160441513829542552976404911821409921321938776475673977832328921088 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade044Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade044Part00256 = 101352481908884056450039010202462103818219524616656220241542250594704633131596201121963475435705473065625321472 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade044Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade044Part00320 = 71441489890148269240718927596824677645179072236423670564491568876701691762538023614873013053514669452167217152 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade044Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade044Part00384 = 53186558786251981394409249281035951149355435205047358401404047228430032043412752316571352872898176631537926144 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade044Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade044Part00448 = 50950870834125612198282683655122782105141287759252438591705593790396878271491383279011547166916375374437810176 := by decide +kernel

theorem group_length : secondCenterIntegerGrade044Group000.size = 512 := by
  simp only [secondCenterIntegerGrade044Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade044Group000 = 2318834118139878589111249869617159670318897505797975130495767219326308242942251770148902504657145469387898093568 := by
  simp only [secondCenterIntegerGrade044Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade044Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade044Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
