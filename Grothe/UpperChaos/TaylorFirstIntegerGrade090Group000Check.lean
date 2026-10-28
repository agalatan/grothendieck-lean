import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group000Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part00000 = 1412547067878566624881792279514626496329345627107373753823449128259666843881411451504226436711500368007747600384 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part00064 = 1579747452826778130007614809620485672559883510243614372028466646369971897041862849485833524179783160398950961313 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part00128 = 1615418264315210814776142843442938619297361136529845256533964066020758897165871665955747302672454749163337547776 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part00192 = 176615633363370111591847168906348523812065521013943157986407379042821096080954462655475433542914708132430086144 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part00256 = 1698820582217005665053237026029955969869178717704946172815433393189465307584384555756167626193980579513759862784 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part00320 = 1636056026971957934830488462051567693457585816453727914360674225595407440844257164118707107485591701410730213376 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part00384 = 506825983536244062439195336494106010120429416839109083724806741651144426407961033243224006148758826397990912 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part00448 = 1599022957060576054086847913308908749121465885661166256744367715870455540254390851396106923104343870973272915968 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group000.size = 512 := by
  simp only [firstCenterIntegerGrade090Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group000 = 9718734810617001579290409698211325830457006644131455993376487361090198167279540961905507577896717896426627178657 := by
  simp only [firstCenterIntegerGrade090Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
