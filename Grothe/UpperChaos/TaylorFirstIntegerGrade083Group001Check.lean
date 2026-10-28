import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part00512 = 558450302644476305975235541517551385835839885212842831035696966567886789849085977513052893328188406153951051776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part00576 = 2629340803339401021080397901626134558117765096746575776667127993349282232753388801990488971206454404230856835072 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part00640 = 2416765051627980826018376005355564574528157828369501326791011968420137926639773325578057314379405558584247844864 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part00704 = 1915982608246368045744526058097714740222488259967986378707118032240995164377879464268832256225444376090301693952 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part00768 = 249046326254353310323466930990644367256401081131863240908231884197021922029576224437686525911103589252385996800 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part00832 = 1806523259848709608204757791598044376952132610903908607472445816543297237280785729493581839958802238745799032832 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part00896 = 1419466386874928039114375623496844799983119560078328145663656509645341124440410457716954795934691808858582548480 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part00960 = 905140282779463381667521482493676639463838121921381065196150640609220046864660339871928385467281051759725772800 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group001.size = 512 := by
  simp only [firstCenterIntegerGrade083Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group001 = 11900715021615680538128657335176175442359742444332387372441439811573182444235560320870582982411371433675850776576 := by
  simp only [firstCenterIntegerGrade083Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
