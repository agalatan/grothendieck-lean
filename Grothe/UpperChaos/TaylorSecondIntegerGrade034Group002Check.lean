import Grothe.UpperChaos.TaylorSecondIntegerGrade034Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade034Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade034Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade034Part01024 = 5998613736058273277238323255535355517751314240369709376407191943261035354893057682553678911796334931300319232 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade034Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade034Part01088 = 4417560106029485261573361218173178374656215168618793617318592877395721860726512386159619443680640729845071872 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade034Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade034Part01152 = 3269420845412674027983157190502768098618264888732600705554952270660405868462599983407014466862156297011200000 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade034Part01216.size = 44 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade034Part01216 = 2021856007494157800046001637966052294561157392456841658668404402067926124607492465351780958223199447952654336 := by decide +kernel

theorem group_length : secondCenterIntegerGrade034Group002.size = 236 := by
  simp only [secondCenterIntegerGrade034Group002, Array.size_append, len0, len1, len2, len3]

theorem group_energy : energy secondCenterIntegerGrade034Group002 = 15707450694994590366840843302177354285586951690177945357949141493385089208689662517472093780562331406109245440 := by
  simp only [secondCenterIntegerGrade034Group002, energy_append, sum0, sum1, sum2, sum3]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade034Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade034Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade034Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
