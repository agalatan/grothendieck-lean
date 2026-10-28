import Grothe.UpperChaos.TaylorFirstIntegerGrade075Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade075Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade075Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade075Part00512 = 6433673324447874353876115358410869431956444081481896303167268522802386406888279359784291845270993388807106068480 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade075Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade075Part00576 = 5264528279577136914410628611424224578919222904540132673515460830738904467648222025484046068275914886094474182656 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade075Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade075Part00640 = 4273996204056633283051785149227523101286474086539659109504322193126016877878137602217337860887394816797293150208 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade075Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade075Part00704 = 2075582091741314029667311888181258185633343506028467037685246162931598688005842218918367404398119065762773598208 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade075Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade075Part00768 = 1282072442252215680486978724193170788556507766194750891717482991293627537911927614484895480132398780722391810048 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade075Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade075Part00832 = 2477849158019652424401195759127117363763470725125695820007726131372514573454151444761173309233717749055079055360 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade075Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade075Part00896 = 1779017676115101451146402470110579862760202392681519747865083153687823723320875749980295380365816211581920346112 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade075Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade075Part00960 = 1340631590329148266232318881654944099411114422468785298354079119418580201716982270267740857677486173707302862848 := by decide +kernel

theorem group_length : firstCenterIntegerGrade075Group001.size = 512 := by
  simp only [firstCenterIntegerGrade075Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade075Group001 = 24927350766539076403272736842329687412286779885060906881816669105371452476824418285898148206241841072528341073920 := by
  simp only [firstCenterIntegerGrade075Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade075Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade075Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
