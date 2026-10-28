import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group014Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group014Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part07168.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part07168 = 7378456320903339085399605304929588781874100509923243508942593057705051270024393000082204662386225131290624 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part07232.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part07232 = 11922126925299519326735621991879219129916566952918598228028429515889661666473208828598227037647033532940288 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part07296.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part07296 = 5769571774020243595572835771361686782764532270700357857824092891248047485626756951139627427248487868137472 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part07360.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part07360 = 6229002185281442461182094179607946911629460282198112561182885682204680552671228767803460900597072924770304 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part07424.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part07424 = 12949192889269076950340708940410520665771249989008897274142056958080591809259905374482480761857752401182720 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part07488.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part07488 = 9293614064458264766154064761095638764930800497307770831036888460308054940663785903358819519503645211099136 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part07552.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part07552 = 292123874522316260051788321301738896756409699001497459378563091259905988199413147558470212007187598802944 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part07616.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part07616 = 8617378921656105659051682680175285747134278857354919958521015511919313356257193297387457443828235287658496 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group014.size = 512 := by
  simp only [firstCenterIntegerGrade090Group014, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group014 = 62451466955410308104488401950761625680777399058413397679056525168615307069175885270410747965075639955881984 := by
  simp only [firstCenterIntegerGrade090Group014, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group014Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group014Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group014Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
