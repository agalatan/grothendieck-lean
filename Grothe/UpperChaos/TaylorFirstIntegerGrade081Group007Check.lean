import Grothe.UpperChaos.TaylorFirstIntegerGrade081Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade081Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade081Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade081Part03584 = 19885428705437958336606365131862203898717585644026368340072991658212944718841290054794624160636091064385536 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade081Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade081Part03648 = 1644975072992889972377907710513573337232451336300883617265116224011035043253556604647399368066992415052922880 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade081Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade081Part03712 = 1149500015216495928749221992246217092560462994634969269451304718357600752105593203610499213639831753207054336 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade081Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade081Part03776 = 794901924327009891776812100501438374187867525697761518567273330161571249559957155927333931512943417034276864 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade081Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade081Part03840 = 452805238930274914147805483534407527144180985872950531646108964090487662342984330683629837761387957044903936 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade081Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade081Part03904 = 105119969491524033725852999395840607467015289087935136217241056126229982880282015530333146380894280678899712 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade081Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade081Part03968 = 388517447344634929434280697704129756518337298862538791245320155518623275544322893890090025014351619814326272 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade081Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade081Part04032 = 262112682980216410550969899287296590227875702714357642523247528196547128817296936666038068936782529853128704 := by decide +kernel

theorem group_length : firstCenterIntegerGrade081Group007.size = 512 := by
  simp only [firstCenterIntegerGrade081Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade081Group007 = 4817817779988484039099457248314765489236908718815422875255684968120308039222834431010118215473820063749898240 := by
  simp only [firstCenterIntegerGrade081Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade081Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade081Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
