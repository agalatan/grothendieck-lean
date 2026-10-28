import Grothe.UpperChaos.TaylorFirstIntegerGrade082Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade082Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade082Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade082Part06656 = 22106258588815426926644901299655175774543511688485788568486782655995185632331270933613690673206847176966144 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade082Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade082Part06720 = 417853802569047995996037604101834417581873587074772691068362677624821073254053334853285036447119393685504 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade082Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade082Part06784 = 14213770084949691692538471420997420484479026499538220597756445934842954616456226897337939926830264365350912 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade082Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade082Part06848 = 6923184029759953244759330476934208560320827973473381698369949756616060506499125764480683819777892953358336 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade082Part06912.size = 60 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade082Part06912 = 2861682125590458778205626016481796543904432168020145285716031353891257598036168144119484615795631445770240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade082Group013.size = 316 := by
  simp only [firstCenterIntegerGrade082Group013, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade082Group013 = 46522748631684578638144366818170435780829671916592308841397572378970279426576845074405084072057755335131136 := by
  simp only [firstCenterIntegerGrade082Group013, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade082Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade082Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
