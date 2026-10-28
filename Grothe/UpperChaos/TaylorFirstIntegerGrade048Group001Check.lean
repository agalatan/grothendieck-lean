import Grothe.UpperChaos.TaylorFirstIntegerGrade048Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade048Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade048Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade048Part00512 = 70008156145173865257090046960327277282146858431203157155901709565182793177493943742428837955108393270231443701760 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade048Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade048Part00576 = 44462262369143321539236804941046582585796753668123657103823272571963334734998586887095554838823405762645225111552 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade048Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade048Part00640 = 44294262073212089149282524362802427078266631818923538501707864655984776137552880874035629888776710376602367688704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade048Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade048Part00704 = 12741268083998066059958877798944835169805707293753754982895422394745405127720081830033176087805060866171484504064 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade048Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade048Part00768 = 9522502565332463726642563549013487290840947468937018974567573769160849544054283154131123366951065442972078178304 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade048Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade048Part00832 = 7990772579567695983100353000922725122373276419821472502208962331418805780825431948536919852044481164054838116352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade048Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade048Part00896 = 10429092373863093624624531089780288107674011639130483985190399193855790738471976888379556992563598292402034442240 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade048Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade048Part00960 = 3624574986285500278454704969205333420838035755645966374286976508826020736371877767532607593674949440788857094144 := by decide +kernel

theorem group_length : firstCenterIntegerGrade048Group001.size = 512 := by
  simp only [firstCenterIntegerGrade048Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade048Group001 = 203072891176576095618390406672042956057742222495539049580582180991137775977489063092173406575747664615868328837120 := by
  simp only [firstCenterIntegerGrade048Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade048Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade048Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
