import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part00512 = 18904210600017515554943283224229573988280459027936062009155635299013927808879440857523792820777939573383047938048 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part00576 = 13333524114287876602152460187630369187950472322395674977832324371676663422109739026943256336720692569802643865600 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part00640 = 9173270510994135924219405424150819297657633618475779836654135752576482733867768606965390297000141256060196356096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part00704 = 6219040148524161275789139016989870403464539633326923603727135982195466202853317692117147391491869161770413195264 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part00768 = 4407126570470359882069303346529515284921132527594309149256449681938354656482457780102437138754349932313141313536 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part00832 = 3560339859128572036071147801462990863835201452162750757930237421424411433026651720541718954198000900616296071168 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part00896 = 3275014545865258899474913468564421281744156465764112228504376795779165571418782869322696169906044487962078478336 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part00960 = 2761184082050060765920718379378180929139411002447680650699365375620113082638465269620388056892123734515596132352 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group001.size = 512 := by
  simp only [firstCenterIntegerGrade066Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group001 = 61633710431337940940640370848935741236993006050103293213759660680224584911276623823136827165741161616423413350400 := by
  simp only [firstCenterIntegerGrade066Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
