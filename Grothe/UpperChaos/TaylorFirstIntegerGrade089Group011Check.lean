import Grothe.UpperChaos.TaylorFirstIntegerGrade089Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade089Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade089Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade089Part05632 = 19754372897134005741801822679184446429224047967537929752841786583162021519503019716457777445090558660837376 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade089Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade089Part05696 = 18556361129549183444713096985924017145928559411917791992307586119965870044895452829856767958207355527626752 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade089Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade089Part05760 = 8119041302686168982597002195992534226890811833029892670425104606747242064691164567414540586909745962549248 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade089Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade089Part05824 = 8400333592236880116830022043673993709408741010183278459014914801519189601449541990545481891664229134499840 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade089Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade089Part05888 = 14674749980626000108721003469880811431426219122482796449968752533275417327253245754215584124363521222770688 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade089Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade089Part05952 = 12335976904591119556358776232795890090338384631756433619392595839793446915700097981559184707976068421648384 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade089Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade089Part06016 = 1273094530177299140412632452967495913928670337933187806975018654923154182940452836919617536381100970999808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade089Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade089Part06080 = 11599865659384676638791163984763101128074750415762757052412103699673851185005233584967552465256350046224384 := by decide +kernel

theorem group_length : firstCenterIntegerGrade089Group011.size = 512 := by
  simp only [firstCenterIntegerGrade089Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade089Group011 = 94713795996385333730225520045182290075220184730604067803337862839060192841438209261936506715848929947156480 := by
  simp only [firstCenterIntegerGrade089Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade089Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade089Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
