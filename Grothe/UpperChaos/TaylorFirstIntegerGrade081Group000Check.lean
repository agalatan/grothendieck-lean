import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part00000 = 4016059737441904223241691034491429040401846686896425647899821441195467741328468072526640111559740442503895056384 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part00064 = 4273537370671295847806272456200342505616257102201521689500684395699575431428289697680454610162015670572905660416 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part00128 = 4384793463870205004695424631401973467283622225822018963870073881295408012374579281939516722964261437416948105216 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part00192 = 3843853955070647633667845133765303809918481814867501124852664131299554070527274141397042947497554823634963398656 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part00256 = 491638534863107987751809982681543196048989935072245257843808003588337776259924656004850628427230956203322376192 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part00320 = 4228768246428506169313138811235564935579236971180051130522185155870766419411015128223075626919484206939753152512 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part00384 = 4007434684915109424715457393688674140807833141109326498819019194660793445056922346495052214048976586505747169280 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part00448 = 3686805184523022660086601433471980714188085927640752781950221906932096004327379138705606889479965423939243474944 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group000.size = 512 := by
  simp only [firstCenterIntegerGrade081Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group000 = 28932891177783798951278240876936811809844353804789843095258478110541998900713852462972239751059229547716778393600 := by
  simp only [firstCenterIntegerGrade081Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
