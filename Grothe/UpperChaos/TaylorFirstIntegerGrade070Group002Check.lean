import Grothe.UpperChaos.TaylorFirstIntegerGrade070Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade070Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade070Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade070Part01024 = 1744970527611383203934479330427478372279461895986997797652732580613182926002124349332200229675464890393670189056 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade070Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade070Part01088 = 405424008905805727017714119273586514140855411617392120094413507606483828821776106728171171129259804427810766848 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade070Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade070Part01152 = 1313270246959426404045539385832543805245569345542895600667493053765564432728227454693043290561329273575030390784 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade070Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade070Part01216 = 1598281087576804275436529584889263930214519410275430520927306085108522865089607645635780153561607707742588370944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade070Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade070Part01280 = 1475181935980125895121272257247106987978381660570599562245997297793357862747475268978427012595823180890834468864 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade070Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade070Part01344 = 1311234014673847718028602652968152191250912504175974808257400408045646578812287202056284752399456918559413764096 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade070Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade070Part01408 = 1132566664620571155328941295722755733038875036632877471448324183123879382635242070673008773683251031126440935424 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade070Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade070Part01472 = 954678091583594389458383805508180016168857435845858214791034231468448938953177089950232444313889009994051878912 := by decide +kernel

theorem group_length : firstCenterIntegerGrade070Group002.size = 512 := by
  simp only [firstCenterIntegerGrade070Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade070Group002 = 9935606577911558768371462431869067550317432700648026096084701347525086815789917188047147827920081816709840764928 := by
  simp only [firstCenterIntegerGrade070Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade070Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade070Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
