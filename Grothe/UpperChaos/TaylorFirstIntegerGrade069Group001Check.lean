import Grothe.UpperChaos.TaylorFirstIntegerGrade069Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade069Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade069Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade069Part00512 = 12257805559338880747318182267849475481919665198327542292299025806065896676075086008296326537822371531229298163712 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade069Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade069Part00576 = 6153818675407979682764730589529293523817127450152178813020665342905740501893676287860309864490263378723801661440 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade069Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade069Part00640 = 5545159005198297897929599592213573817737209558310554871241383909205265450337260329796041115319591354234293977088 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade069Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade069Part00704 = 3537976042036532721921038917788499510374083944621585716259047448511624207411577797404461515662665470968713969664 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade069Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade069Part00768 = 4338609866924941996094400369889153121626485065681136664427760730059374087932936373824933301884423111064357437440 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade069Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade069Part00832 = 3080203878081294208008933430432438311865792818081361551452391632478328270706677404650130179539253093094429556736 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade069Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade069Part00896 = 2389915648432394517393037579776554689287657881522058062946293002661544001859509192618904886464422794817618051072 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade069Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade069Part00960 = 2105067557449568021253245786983218654359623635788226819244036379628130607372184766172911598911631252792465686528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade069Group001.size = 512 := by
  simp only [firstCenterIntegerGrade069Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade069Group001 = 39408556232869889792683168534462207110987645552484644790890604251515903803588908160624019000094621986924978503680 := by
  simp only [firstCenterIntegerGrade069Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade069Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade069Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
