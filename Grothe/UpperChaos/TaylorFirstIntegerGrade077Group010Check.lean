import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part05120 = 21520973476146224750625247634154547666016058557935808453721059905677187130478624428218311338495486069833728 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part05184 = 22081620385617443081428520206644385142843326490548899323289493385080047946850626388010106668437228549570560 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part05248 = 22587620100575096753416262227536417147276394171869566568616301965448693118911165394005796553751461053333504 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part05312 = 13319899162874792748405706244496310459049847430497666395958187686604448967569839378075237188616596171522048 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part05376 = 13046347777927423484703575982265719696200606226110705008924846527816847949726808534195190754217369523978240 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part05440 = 18842970542106619566326072695358752130606080190295862569237629134430435710325130368954653951416799871369216 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part05504 = 16259914945386066643459542422908902683400925063413878517422231076595124436416656848872264028548360925347840 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part05568 = 15215132121747972536784680619206965169020917309174103023208419077738088507489560402884545166468393981706240 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group010.size = 512 := by
  simp only [firstCenterIntegerGrade077Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group010 = 142874478512381639565149608032572000094414155439846489860378168759390873767768411743216105649951696146661376 := by
  simp only [firstCenterIntegerGrade077Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
