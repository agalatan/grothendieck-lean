import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group012Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group012Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part06144.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part06144 = 6722895616424544214567023789805258958092912894754348735071467262687446177690301733157629798350509184122880 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part06208.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part06208 = 4774465698448961214416200270124252988826076904892180815396705719747527175577268151077432311309281886470144 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part06272.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part06272 = 11433006425676717529409702327263107795095095754646215156773061328674132666217889722914796877267792146989056 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part06336.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part06336 = 10121511818312391546766966152658828922916345057003012525175305762650968820365250693962653444390623037620224 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part06400.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part06400 = 1777453523574995141564914718729006706798687836310358242988336472613039525591709959034901265254241986936832 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part06464.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part06464 = 10948718885971100092772717065128894487197578292035656180948257079770337664666998650835017465047750237224960 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part06528.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part06528 = 11741265251668394879971703200943541054523491130041702503697913187884826725549383949656568203132608352092160 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part06592.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part06592 = 5634198148206744439937197991867098174588992258184294734857915079794738748689305072999114726684430824374272 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group012.size = 512 := by
  simp only [firstCenterIntegerGrade088Group012, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group012 = 63153515368283849059406425516519989088039180127867768894908961893823017504348107933638114091437237655830528 := by
  simp only [firstCenterIntegerGrade088Group012, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group012Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group012Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group012Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
