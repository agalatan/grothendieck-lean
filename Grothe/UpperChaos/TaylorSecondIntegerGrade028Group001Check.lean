import Grothe.UpperChaos.TaylorSecondIntegerGrade028Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade028Group001Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade028Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade028Part00512 = 90740396462078678375429762696436783301022099923251530658119647112956810251142987731368525770472167634739658752 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade028Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade028Part00576 = 56440303267927020902982194366514647322227113748122508085173127375245803296294753155184328521833563596322242560 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade028Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade028Part00640 = 39495271122518991676317812648076005645127200405895123578676522443544268627874867753629677221232481790920228864 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade028Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade028Part00704 = 31626359767841107072830481839353677346187775629332085547097957231596611441240111125342235817098196074836787200 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade028Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade028Part00768 = 28961952273574887607120968303751260032803190269577875007905831534243071322443129397427379732065577713329504256 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade028Part00832.size = 38 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade028Part00832 = 8483109939089195591299282441639922123930339339682130405789525950351627782077327008290483370388306084782669824 := by decide +kernel

theorem group_length : secondCenterIntegerGrade028Group001.size = 358 := by
  simp only [secondCenterIntegerGrade028Group001, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy secondCenterIntegerGrade028Group001 = 255747392833029881225980502295772295771297719315861253282762611647938192721073176171242630433090292894931091456 := by
  simp only [secondCenterIntegerGrade028Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade028Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade028Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade028Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
