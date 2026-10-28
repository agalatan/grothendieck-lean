import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part04608 = 47538820964686645221446025819542300493157120771105899565955717290790226431997753153836572572807066994868224 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part04672 = 12964362178728033010087381726369185694693148563330663187748353123752911363282428257415758155860993627914240 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part04736 = 27545238286865896259270652272511348973407572954323474054623040791795388388016706974672622564513976651087872 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part04800 = 28561837314218647510425127929399119774752753823060574958986373439904259059797399512909260216037523532546048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part04864 = 26161514200108282175710147589639046660087697622189529229233060415210453218999065641236305175067684014915584 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part04928 = 21887497982835470261019923072219783073598784240720363293104533611385326859716796564205533674806570431545344 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part04992 = 13506248106215280310798539659285832879505064243938759491048223012904691329963150792599838934038268998582272 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part05056 = 11596913687698299931500838261645007430376152814383028764063055343319364973213072231808495213214416787996672 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group009.size = 512 := by
  simp only [firstCenterIntegerGrade077Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group009 = 189762432721356554680258636330611624979578295033052292544762357029062621624986373128684386506346501039456256 := by
  simp only [firstCenterIntegerGrade077Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
