import Grothe.UpperChaos.TaylorFirstIntegerGrade042Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade042Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade042Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade042Part01536 = 36088384779270636944492026912325058310566828796692845524084120177428616197524394651143997500240647445557542912 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade042Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade042Part01600 = 10615525592475723648224089178034061818273194176652023476698271325657799213343723808364715580248289989418287104 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade042Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade042Part01664 = 12114512933524664597072453674179322231310110387493739751674737434929185966074865981298783742608947799950098432 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade042Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade042Part01728 = 10500788430831773914158505356817956203605318921030160415126207321312105541642544076504846589017691882203906048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade042Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade042Part01792 = 18733119948288814201057195506376166412815124604079367529866191799350647565810976692475452892467482188394266624 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade042Part01856.size = 36 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade042Part01856 = 18831124123622336828453132635548969674618497424090037872920495736172335505185918160155881343370664175663579136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade042Group003.size = 356 := by
  simp only [firstCenterIntegerGrade042Group003, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy firstCenterIntegerGrade042Group003 = 106883455808013950133457403263281534651189074310038174570370023794850689989582423369943677647953723481187680256 := by
  simp only [firstCenterIntegerGrade042Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade042Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade042Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
