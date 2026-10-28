import Grothe.UpperChaos.TaylorSecondIntegerGrade021Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade021Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade021Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade021Part00000 = 16871207904361687495430936260998275818529659988081009971711066798445336902098606258260556520189261347984353787904 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade021Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade021Part00064 = 3444968608718847776827000969139431285299079995009965066177032435582206274004440829959840870895142903064916131840 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade021Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade021Part00128 = 1479036250593076279953722146360651791083264273740195111882966313475871985888259742981418880961632170747088601088 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade021Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade021Part00192 = 866967882718926364842419806220083100131219175129919897044732976937442888811891750423751901744806213554570002432 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade021Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade021Part00256 = 510092419103106916302442246051080730487003963380610997472486584061737868440832627325753773757211578219158831104 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade021Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade021Part00320 = 223190992139252027456795498055667266350423533220374155386126500793607400674376046521311227629540553550379089920 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade021Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade021Part00384 = 179358476233510225396032760387471729883094665352377832914119479324902833249440752809745058822967708708155424768 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade021Part00448.size = 58 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade021Part00448 = 125799979655075339317903401967558492594828410830822313632278302948786308880902541104909446102073120724178960384 := by decide +kernel

theorem group_length : secondCenterIntegerGrade021Group000.size = 506 := by
  simp only [secondCenterIntegerGrade021Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade021Group000 = 23700622513523482425527253089180220214358574004745275346220809391569892462048750549387287680102635596552800829440 := by
  simp only [secondCenterIntegerGrade021Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade021Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade021Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade021Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
