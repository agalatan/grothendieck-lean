import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part01536 = 663633066491211348061199032661509221779469215526983315673480509483369932662728211714973551094884845415531806720 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part01600 = 555712444001041037069514029966575156890180108451996939772635930246513178802176511250137135057440844152840388608 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part01664 = 422252944570267485203902429941501930889535116572801990137133115533293256753561997394040246197269235732060307456 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part01728 = 36894866479085952086291471348520436649882939659625786118381904779054928582039374159893321935166836446716755968 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part01792 = 373081719865487732173455604019578564765302408074504341710516163984273956126275972447173968505433620383967215616 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part01856 = 301747751537506268943238814931978103459921991126661624695863457058264226959869003609804065170157755329981448192 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part01920 = 242349126668653210407828758256633473204922233851476655212435084323824934956456509958705170161172519937424490496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part01984 = 194362342260259180230498132643832977801419614520391303037082989026740688488291587128263720746346269630418386944 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group003.size = 512 := by
  simp only [firstCenterIntegerGrade073Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group003 = 2790034261873512214175928273770129865440633627784441956357529154435335103331399167662991178867871927028940800000 := by
  simp only [firstCenterIntegerGrade073Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
