import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part00512 = 3436964493264823002027257788585083274964691238063623189988161147108419909502157064077170384623805869786132381696 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part00576 = 355190964047118831653727283321968846965938573343105252362500317548977138626754380649842448450425054322388631552 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part00640 = 3301901352485837007889156237745187412886864807572173708294008369439156143679883861739564205669201822440027586560 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part00704 = 2725658935386403583424570094822799710164299166114699677442990735363342365745091450473983714174441650340036083712 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part00768 = 2181864174284087884538367862535495329391871993624129955863540232654229168111220876217980104227392212187849162752 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part00832 = 1025542745194706009831312212187731275215726317448028743697812676874194221295161206653681257085111164466815303680 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part00896 = 687687555565555961712562559150728266799638439017546687614323911926837942354406605298099797162620585156391469056 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part00960 = 1299757035985371824452128835995823347978765032645217533716605163720441713424377908772397517620334395058485723136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group001.size = 512 := by
  simp only [firstCenterIntegerGrade080Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group001 = 15014567256213904105529082874344817464367795567828524748979942554635598602739053353882719429013332753758126342144 := by
  simp only [firstCenterIntegerGrade080Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
