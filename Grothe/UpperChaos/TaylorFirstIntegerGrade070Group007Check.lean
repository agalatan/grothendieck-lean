import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part03584 = 383385696366590078234630854471101039401852875457448302512301485688971144756090983093599818015148394298736640 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part03648 = 359105332031583733958157173699753559752189696047334489290816939233219947520156687085021814269070760849965056 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part03712 = 304004395051311569872798360951810900285440729961624274137065812193863241901513429496518383702051588082237440 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part03776 = 247271011122974613660222664879783086412923305142474812039752327951136571468477489564150036760607496194752512 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part03840 = 206574753703119848869568504065988741631894472951145332681860468899485062835097033556098367098033556150026240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part03904 = 172136755375927933720837140735612435989813457434908835027433137176026643661619076729886184503731219647692800 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part03968 = 42168174810552952817344377948033973631275050115364327739026746442947548755743864512604180960813623099260928 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part04032 = 97574554434112745289462824742034907110731923471344282633426631016194083744816375873985591601294790507888640 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group007.size = 512 := by
  simp only [firstCenterIntegerGrade070Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group007 = 1812220672896173476423021901494118644216121510581644656061683548601844244643514939911864376910751428830560256 := by
  simp only [firstCenterIntegerGrade070Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
