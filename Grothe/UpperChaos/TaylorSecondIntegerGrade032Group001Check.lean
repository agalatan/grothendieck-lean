import Grothe.UpperChaos.TaylorSecondIntegerGrade032Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade032Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade032Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade032Part00512 = 107391858888691279657942816721877993035473537661810340984611598514157786889499326087129036909318497143200153600 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade032Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade032Part00576 = 69682348600351429996116376014176344116135471927275835353314433062900328633251353969113919383469842311946436608 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade032Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade032Part00640 = 33207222352071310812229998851734759212907697091987327833897408016685528785577787483624237508058063498918232064 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade032Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade032Part00704 = 33255527017750703019028916149384213365680990105769501706859575874396758616484447214424266751247841415430930432 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade032Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade032Part00768 = 17169607202824213042686551082740705221026138597121923356435246046598076867906914061601336840859744974539849728 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade032Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade032Part00832 = 12782813316322325891938011257090305804186395889289303157320884226492376636583682669094495263128669066912333824 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade032Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade032Part00896 = 10604111788964674476571646072038380435129118122535693996316435470948911297777200915036691547167700268949176320 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade032Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade032Part00960 = 8102086270669774225489947373923910723306079961543962529257135670425538061449316838951361756361147570146246656 := by decide +kernel

theorem group_length : secondCenterIntegerGrade032Group001.size = 512 := by
  simp only [secondCenterIntegerGrade032Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade032Group001 = 292195575437645711122004263522966611913845429357333888918012716882605305788530029238975345959611506250043359232 := by
  simp only [secondCenterIntegerGrade032Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade032Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade032Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade032Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
