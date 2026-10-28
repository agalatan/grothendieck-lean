import Grothe.UpperChaos.TaylorFirstIntegerGrade079Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade079Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade079Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade079Part05632 = 22187653943493708699316829508247085972588919687822332729734289264430870810990512923585868691687611220099072 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade079Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade079Part05696 = 17695192506140552727553557617041580120113990974870153588234000690019185161059034769560313045848823796072448 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade079Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade079Part05760 = 6427234390880192270072677684994983087071845294185457866996598680078867171291748985344398580844932555079680 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade079Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade079Part05824 = 8710534270984917322539786807983928331093134261154935188122411368705762354663078430339256292043482210500608 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade079Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade079Part05888 = 13160519539378081440589270101852871906962448728402136654024038484524028585678129963755799415560574102142976 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade079Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade079Part05952 = 15086284354627308891067919974428880569107189828775276807218940292291449499371358468863139427816998413795328 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade079Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade079Part06016 = 12246596379070833536343574957106772324995959475790324459485122492670229902235258175104851412208010888478720 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade079Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade079Part06080 = 2499635809402714484358661690756820689449613857596999083185132482965097334471075811575695333910242836611072 := by decide +kernel

theorem group_length : firstCenterIntegerGrade079Group011.size = 512 := by
  simp only [firstCenterIntegerGrade079Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade079Group011 = 98013651193978309371842278342412923001383102108597616377000533755685490819760197528129322199920676022779904 := by
  simp only [firstCenterIntegerGrade079Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade079Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade079Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
