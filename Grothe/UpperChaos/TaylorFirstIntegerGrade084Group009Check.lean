import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part04608 = 55890737066893984527944864931987898548011658486048937336628610928258212036401886893948678458756015922872320 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part04672 = 48408390732353314374026643831874708984806255122180820447853898403974071561369750159517597896551028817395712 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part04736 = 3803568619322275599099181708585458193094164654736554631237364580214911841311117757299462981282018743025664 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part04800 = 52328035687097103370351944306838132416958396820668271901233554772482691576751995968636365487986491900559360 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part04864 = 52927214724478842427380579960149724733309640063220643723569190817319974527864099397684441541513013253636096 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part04928 = 45287669223065758406907295349742140915697388026405058209499665865523108958574503782899293988742494796382208 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part04992 = 3794177237495361030448792357307846122583794063187122819545808214073564037093387648569178099603024449110016 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part05056 = 40961727391589016162331437136448185740035822758609712704466054461364875320973361773055284954286207493210112 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group009.size = 512 := by
  simp only [firstCenterIntegerGrade084Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group009 = 303401520682295655898490739582934095654497119995057121774034148043211409860340103381610303408720295376191488 := by
  simp only [firstCenterIntegerGrade084Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
