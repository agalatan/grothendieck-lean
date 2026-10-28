import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part05632 = 6123695844307479412225478457803179334523678540921264225673186303239445833354252939501073338708062340382720 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part05696 = 14789753118364745797295772296746263089128058781321463178798643065223709979333455577585524307609819063255040 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part05760 = 17245822021448894966004133246795221870238974373815829627483651232556190516168348515915491028948607760859136 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part05824 = 13279058930681591597896134984213955844426335494329050093601621859312995636078034381988122516721623153770496 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part05888 = 4155338122339049583822712840643931378189820899662176071078853013391864562484847816599032350364076253118464 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade082Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade082Part05952 = 16317422067184859286501493983811673654216213958228006404229413953268382383067956916710658859072182145777664 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade082Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade082Part06016 = 17689096461392221934236587189716570524157194550934516955688954662955733443802185221758018268298270050615296 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade082Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade082Part06080 = 19061356755528382981472499319211072911946018083772290803524796568076520907850493418630655805490547730153472 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group011.size = 512 := by
  simp only [firstCenterIntegerGrade082Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade082Group011 = 108661543321247225559454812318941868606826294682984597360079120658024843262139574788688576475213188497932288 := by
  simp only [firstCenterIntegerGrade082Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
