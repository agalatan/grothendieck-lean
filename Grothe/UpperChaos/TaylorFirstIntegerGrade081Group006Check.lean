import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part03072 = 8820570622425069237139286626891478429356924823253171007851792406724561452306424294512537803537459457873149952 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part03136 = 10677732668001283172896559997993516668525985354490177154059811292212981646884604113212835303027522103200972800 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part03200 = 8255013600544944511021740836418993871847355513930117514214729357761815551487111059637443468441026547450642432 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part03264 = 6219538624222933671464343991122622595411436278325501942674895324413636816281092268807710709299807853777780736 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part03328 = 5406742293820475622705731908072810707538162019165566550250672786622512245870841705784215359092795010711552 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part03392 = 4580631268594651905333220960694177582669260278136050669828676170065763672790895400631929093891805614400602112 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part03456 = 3321026058315451253254344018405005871949593667043519733365744678896806687000450588923731695846457811195133952 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part03520 = 2371707010936955596610882536126863018501197272296975172393035924070335264231081003732055427967699432102690816 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group006.size = 512 := by
  simp only [firstCenterIntegerGrade081Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group006 = 44251626595335109823343084699560730848969291349494678760938935826932523603227529571164027717370871615011684352 := by
  simp only [firstCenterIntegerGrade081Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
