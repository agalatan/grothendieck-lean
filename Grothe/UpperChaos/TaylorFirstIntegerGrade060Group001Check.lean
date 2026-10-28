import Grothe.UpperChaos.TaylorFirstIntegerGrade060Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade060Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade060Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade060Part00512 = 30609261848322442753804065792041324990365522115320375865891536400466632239347595478601529389905466469328994959360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade060Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade060Part00576 = 19671383586542275330682272601694397453471171688311985265954491802396232872998688011138076889318571641602974941184 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade060Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade060Part00640 = 13156182203175850029283897870427033815307716761375443720451907246740359382083833548947699283804672661119265931264 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade060Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade060Part00704 = 10108763548741860580435574897938224208263349634724153844757768412813759691285927172714702477482665806686930862080 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade060Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade060Part00768 = 9066010995121281738121300676550046001822148738624257832079416472583221949051835530352065370486769717071023439872 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade060Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade060Part00832 = 8794905491945787055371271234710095142342197218733959105420374630954227404809627098392986392959377511575854252032 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade060Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade060Part00896 = 8534331823373359194362643446261717426407055522449623847283389378267086289476390648202205212284392750015703941120 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade060Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade060Part00960 = 7975918073120478134353953122791772944747322026071509297977220060598376295017844922022864492658632727736229036032 := by decide +kernel

theorem group_length : firstCenterIntegerGrade060Group001.size = 512 := by
  simp only [firstCenterIntegerGrade060Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade060Group001 = 107916757570343334816414979642414611982726483705611308779816104404819896124071742410372129508900549285136977362944 := by
  simp only [firstCenterIntegerGrade060Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade060Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade060Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
