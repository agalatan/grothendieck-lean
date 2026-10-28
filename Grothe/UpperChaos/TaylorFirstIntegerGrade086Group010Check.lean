import Grothe.UpperChaos.TaylorFirstIntegerGrade086Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade086Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade086Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade086Part05120 = 3628008382016744109640056457464370241346150435020370707104200817767208016431224079162935744223683786309632 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade086Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade086Part05184 = 34104518787326008314434087334376081160151476106110834719381465925726231725438481786617425134700369872420864 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade086Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade086Part05248 = 32889406571533998150418275491280284854038655908339562598951524518423330153294049340258740517513614818541568 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade086Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade086Part05312 = 26200864843699415641153018506028368864624155864659962538335635094805186765819585294835650299929119913148416 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade086Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade086Part05376 = 2005854340165243288361461414810088053952994669794602244588923365680251954958322273106581636781896877735936 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade086Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade086Part05440 = 23400507229374848567673731298488463126710634519731303421042608087854131736909832522179868553781470579130368 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade086Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade086Part05504 = 20411466940177667782241579207126243373020183398747400686305717772825615026940647446115874761009104703979520 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade086Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade086Part05568 = 9205577526138385595925352344301698112343757389187872333925298463306686805887315295081361251802807598579712 := by decide +kernel

theorem group_length : firstCenterIntegerGrade086Group010.size = 512 := by
  simp only [firstCenterIntegerGrade086Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade086Group010 = 151846204620432311449847562053875597786188008291591909249635374046388642185679458037358437899742068149846016 := by
  simp only [firstCenterIntegerGrade086Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade086Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade086Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
