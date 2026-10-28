import Grothe.UpperChaos.TaylorFirstIntegerGrade027Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade027Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade027Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade027Part00512 = 2835162418964106725675488844091700108895841120749313658969158335563959959736088412817984904262430632208536436736 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade027Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade027Part00576 = 1694570832397541494994167392849257956670977354198342307630541185996951309680107234903995590985472814181691424768 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade027Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade027Part00640 = 874930159195336631718097026848838843035034949528536663825088713902817826448712588737648567324225311568983752704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade027Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade027Part00704 = 577351135546934850434498703734841919200496227535915021297389501426537477999134996681094618194975583870235181056 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade027Part00768.size = 44 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade027Part00768 = 221750192594546364723778428728738398755518433791835369923023676824080852199525917063148939755825297801481289728 := by decide +kernel

theorem group_length : firstCenterIntegerGrade027Group001.size = 300 := by
  simp only [firstCenterIntegerGrade027Group001, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade027Group001 = 6203764738698466067546030396253377226557868085803943021645201413714347426063569150203872620522929639630928084992 := by
  simp only [firstCenterIntegerGrade027Group001, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade027Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade027Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade027Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
