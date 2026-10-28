import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part05632 = 17145346982658549272743002315170260863443516252300020387624455868174668322718159429578322296031309849427968 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part05696 = 17314426306134576028846285958395923148582398746333952930081628951286624913838761862910458309585708997672960 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part05760 = 18002666152455001909576154850013941209928923722296823021722391308419209199793998415072381686294656369819648 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part05824 = 9131727061830904753931522641717613537436534967484991193995883454463300650734263727767504261375673883426816 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part05888 = 9741815313721401615454511285387446893234779179830749620128707070329521280480149520938332036219730395136000 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part05952 = 19858390947997106767238769635106921327830314065573007306573051788206265789192517610876009687838313045557248 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part06016 = 15497789309213934418740979257861084382155298143893626586099110350359095105133441252492127250235122817957888 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part06080 = 12078302781590483862696700816987439408876783431364030098902707481900931745285377156715650834404673438351360 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group011.size = 512 := by
  simp only [firstCenterIntegerGrade081Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group011 = 118770464855601958629227926760640630771488548509077201145127936273139617007176668976350786361985188797349888 := by
  simp only [firstCenterIntegerGrade081Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
