import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part07168 = 6500308163565902518568673642246744784389132519232800823384243622086845046918903543540240511938975305302016 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part07232 = 2255071267777529207779844120486225698048188251976966654163163418101340239298136130036855065498307644096512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part07296.size = 14 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part07296 = 452056078677438514502392837003545810040868334300243255821188187810628146016936880706481415301625790070784 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group014.size = 142 := by
  simp only [firstCenterIntegerGrade084Group014, Array.size_append, len0, len1, len2]

theorem group_energy : energy firstCenterIntegerGrade084Group014 = 9207435510020870240850910599736516292478189105510010733368595227998813432233976554283576992738908739469312 := by
  simp only [firstCenterIntegerGrade084Group014, energy_append, sum0, sum1, sum2]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
