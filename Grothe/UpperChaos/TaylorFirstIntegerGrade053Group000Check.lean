import Grothe.UpperChaos.TaylorFirstIntegerGrade053Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade053Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade053Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade053Part00000 = 200704198930084974937496452210091550999072678260842048658733584830162240001042818810778568617769964570592201932800 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade053Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade053Part00064 = 135655040278898035037893157655165431555701547054434056226956205288835489871834616787609359288691333421976038408192 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade053Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade053Part00128 = 109939810629084821883212138498925062805198291605631564460930339753834307737538320740209869879245351464988405923840 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade053Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade053Part00192 = 88064440804621149614620983066617655054898661328763985354119325145045593441862938101977587206635770783377173512192 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade053Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade053Part00256 = 86399970019290101499945322120698934272637112481997761799989670586727899158123697031485759631248061535312785965056 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade053Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade053Part00320 = 150119951142172872174563438952267484567088916844015283117910888564078001078470820609266323043349009659291066433536 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade053Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade053Part00384 = 99561610110824136756497432075702190507606958675709629632730453306487497549219737842807956543839097645076953694208 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade053Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade053Part00448 = 56520127419725950064305530376559147982248668544429003506157376009996242421443913057918065977642395346514862931968 := by decide +kernel

theorem group_length : firstCenterIntegerGrade053Group000.size = 512 := by
  simp only [firstCenterIntegerGrade053Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade053Group000 = 926965149334702041968534454956027457744452834795823332757527843485167271259536862982053490188420984427129488801792 := by
  simp only [firstCenterIntegerGrade053Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade053Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade053Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
