import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part00512 = 9490491648605407594146023562089313640929993208191362926668377698878597974718140609536650528911967194308436557824 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part00576 = 7881561146612283802895842932663166290884378263872087711424176484583419788264876537481301600295991597077819817984 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part00640 = 6197052231750688735534002776618978958216621441187911895625601121922408963064549100895460293845062639354766163968 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part00704 = 4561571945423934669058077012915495937613309703196283942658191162795296827638006355577220007029192247739525627904 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part00768 = 3210278037890507539052694120256274972308676634137756686109858120771202694507763105937473898332551485749876228096 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part00832 = 2274177957061673029749123746134977775621382876206073266254533042049668249504307044035092579144420272311298424832 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part00896 = 576915441589232189169704569854036359413055399331347796041424123170108177012905064499696132366868649576281145344 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part00960 = 1238856055072588173835389852603350103655413355483613455053705116559476216936609532416001459972161760273729847296 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group001.size = 512 := by
  simp only [firstCenterIntegerGrade072Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group001 = 35430904464006315733440858573135594038642830881606437679835866870730178891647157350378896499898215846391733813248 := by
  simp only [firstCenterIntegerGrade072Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
