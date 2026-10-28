import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part05632 = 14616118460596454558896330952568787359746081044035947574090885572913129655900436241108823292296199443316736 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part05696 = 13586225406409974866643499383374361913348743179134524969546554755295917461724944084563206581748747707875328 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part05760 = 7950462170889779928181748864040028509683986909245508525818010921017467158209899292393815771988291154345984 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part05824 = 6603306278157321670102117079459151891392536018662491037992741399307877814953006021748434665807307023056896 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part05888 = 13748739163665084085882712432107541153660910573343007612275832431515885515060941708979709274343372463538176 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part05952 = 12318413206389897529771783628640273627584101130987467264864924769615437874709806025650170336995491409035264 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part06016 = 2189835653116150054553629386280421192272301189941311633672976931787413928998163556718194174857798897106944 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part06080 = 12119821786588501936401676977020491737897817427804837828225107040149604309081184499463545780766793948725248 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group011.size = 512 := by
  simp only [firstCenterIntegerGrade085Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group011 = 83132922125813164630433498703491057385586477473155096446487033821602733718638381430625899878804002047000576 := by
  simp only [firstCenterIntegerGrade085Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
