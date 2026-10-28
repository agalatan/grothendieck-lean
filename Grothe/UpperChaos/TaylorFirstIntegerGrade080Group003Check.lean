import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part01536 = 457668780539828013398477019016774470744989220382889112421977657439529488341518667984348317809842057939242713088 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part01600 = 402870976792454771745813713776130353886194468923297747666604704075068679421400051531408718642831968937678209024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part01664 = 342676542652948319889045765974138545646715825773067264147760811565329507541974705566621078677332728770342158336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part01728 = 4100723428118765408181042238176900678784348598962517449762287594077256994978661634912358711046690509573586944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part01792 = 292789194217157799225177190482670324020279379657385446117358394192208268941450090068769548814100283657138733056 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part01856 = 243883742400955796083358147086969799464726681134738244523614069328544127145591096640134531853792642133812838400 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part01920 = 201188130686037620888121268235444971218798774134293162850446149452472845935202233397061346322294116599487004672 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part01984 = 14478350860045103762077303243380924389971420357973473199519317692679398043923280035683438929926196977389797376 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group003.size = 512 := by
  simp only [firstCenterIntegerGrade080Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group003 = 1959656441577546190400251450053686290050460118962606968377043391339909572366038786858939339761166685524665040896 := by
  simp only [firstCenterIntegerGrade080Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
