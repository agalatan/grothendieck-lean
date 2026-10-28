import Grothe.UpperChaos.TaylorFirstIntegerGrade085Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade085Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade085Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade085Part01536 = 346576814352503335534881123723320071224753830366924798637259637119644795940193955750331651799308052121914441728 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade085Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade085Part01600 = 313525955934509619700755828059065401311414788628147527150018206101140585460751239237839058223720197947029192704 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade085Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade085Part01664 = 805850687302905423633836208383339553205457954040015721727235699600597102453404362272142312042211833571966976 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade085Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade085Part01728 = 276497011892275022416597367679663369262330554643819680930871176707853032525191077500494631981154126906150354944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade085Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade085Part01792 = 240529490443784233471062697413973316644941750015052742952453886631789279078529786858811364975362163993980436480 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade085Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade085Part01856 = 203397719263823397808087183522373492419942686868259188494473414952750598871251263857194292133173496448129433600 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade085Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade085Part01920 = 2380628531929944926448630923127387124149967776203453921640590445259222970967734554108544565814305935102836736 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade085Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade085Part01984 = 174195055850865338615775265923249081404503564613980195138692904557065237880117648606949272316593040192870285312 := by decide +kernel

theorem group_length : firstCenterIntegerGrade085Group003.size = 512 := by
  simp only [firstCenterIntegerGrade085Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade085Group003 = 1557908526956993797897241933453155458945242600866427602947137052215103349829456110728000958307167595378748948480 := by
  simp only [firstCenterIntegerGrade085Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade085Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade085Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
