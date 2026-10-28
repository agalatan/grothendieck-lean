import Grothe.UpperChaos.TaylorSecondIntegerGrade034Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade034Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade034Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade034Part00512 = 97754979165145191840234605166393873791312160416646324615749424429212095430255042426524537112095072376724652032 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade034Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade034Part00576 = 47668755061376559964897263757731239872394565257209054063406442743904725755410121055726858661344889911013015552 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade034Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade034Part00640 = 46134783444294991943014857846962257981513166963325459840444792053207553343364680841753929664033379567657811968 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade034Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade034Part00704 = 37479835849303860177103031393112639989083341110369661843994342706603170009220705187668020509019700529482170368 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade034Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade034Part00768 = 18149814938608592857796848095841821086883111815847921073688129799352328603948780846611974203609304076432441344 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade034Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade034Part00832 = 13772736430685669522984082049868707810407869861458824418989152206148616930728020355864597300972823379355631616 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade034Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade034Part00896 = 7589131974712351450392048564289299753526916413641593987191639749770005663703602075268906437687364299853398016 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade034Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade034Part00960 = 6389070002467750885057921376317183402034913609814188905368974197303446412404416906255152923660669422405681152 := by decide +kernel

theorem group_length : secondCenterIntegerGrade034Group001.size = 512 := by
  simp only [secondCenterIntegerGrade034Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade034Group001 = 274939106866594968641480658250517023687156045448313028748832897885501942149035369695673976812423203562924802048 := by
  simp only [secondCenterIntegerGrade034Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade034Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade034Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade034Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
