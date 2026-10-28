import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part05632 = 8832474162627262782630525090176723041278176877874129077935312053091743689122271212229978704281087640600576 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part05696 = 5994563593851123874837795069598934066991861592545391347628696253940985813353698302634797214847792343678976 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part05760 = 14545440698227997121641557782439777782048420571508165464416594106335356613422848667562477765369098739384320 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part05824 = 14414988017430944444904430917233767589259224320584418865778927933312727614647960016230058297146119439777792 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part05888 = 9980237897625431021216076595263850952352421418874757963216111537203440815711773700756947041145906226266112 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part05952 = 6616002336866442263519018882131525656406834277988983230262050877950567469855853676340799126252457585278976 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part06016 = 15407474529208441157938272969503090226140808558102127288593772592713814579141994588361829528417480688533504 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part06080 = 16335292549592280744284960480995940220372874400958052578824465352920713284612166939029451516748822306881536 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group011.size = 512 := by
  simp only [firstCenterIntegerGrade083Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group011 = 92126473785429923410972637787343609534850622018436025816655930707469349879868567103146339194208764970401792 := by
  simp only [firstCenterIntegerGrade083Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
