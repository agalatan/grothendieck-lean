import Grothe.UpperChaos.TaylorSecondIntegerGrade024Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade024Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade024Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade024Part00000 = 8334227901790925475401445102396468082086095751274945976073391095563203884340017784512220566045715738763554979840 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade024Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade024Part00064 = 2830902594966650507334037889318234341014514060734986206479213013208950234588853613090473918278936521014578774016 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade024Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade024Part00128 = 1275597164801963714755525439803381524460888280913729074936239406060141347608501736128038798834285781389280280576 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade024Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade024Part00192 = 822720772026527514275257074052804749576295673250565306934708512817914103487799604756880991524371736914219237376 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade024Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade024Part00256 = 514420025231574138832607897765646977772389360823185384701383346471117764497754622932852366570408741064163721216 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade024Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade024Part00320 = 381891799702080473993908366021133432341070176247280608981790269848560687541738049202185180242824106266937262080 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade024Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade024Part00384 = 184020051302582166647505200292481925112473987024820596353543806316163653116581200901317886795494054785842151424 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade024Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade024Part00448 = 139886274079965463680323000185076828228179547888725996714742330242674664587323497835794929789125553773474742272 := by decide +kernel

theorem group_length : secondCenterIntegerGrade024Group000.size = 512 := by
  simp only [secondCenterIntegerGrade024Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade024Group000 = 14483666583902269454920609969835227860591906838158239151175011780528726339768570109359764638081162233972051148800 := by
  simp only [secondCenterIntegerGrade024Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade024Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade024Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade024Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
