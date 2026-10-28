import Grothe.UpperChaos.TaylorFirstIntegerGrade083Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade083Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade083Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade083Part04608 = 17527684218458367574516230402078913918571940116569785961182811392797094303904287521826568529037336330108928 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade083Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade083Part04672 = 42222228942847960668001526723059195305421573336233135820830226759557338165980008289916834183454335814336512 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade083Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade083Part04736 = 62026977245895197312822206610041497446250306091902024717202905794830404903058785715983034728346521264193536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade083Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade083Part04800 = 58317422170525357053065716384274290671572262083500109099485924223669361235671479844914348304279616549289984 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade083Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade083Part04864 = 14214060789025258439407833376618047414403224448289286282146852486616275952834816125696706167165244583968768 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade083Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade083Part04928 = 36431555199233732284607260350432439416751149882306796026067944166604098668568159126191592651077100914081792 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade083Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade083Part04992 = 42018020607973156548292046965193713833085408655400641478708414902990982526306181663458780689287366460833792 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade083Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade083Part05056 = 35016294137204183003318281055008978653031684443874839406005595642665177438516483183780704031813770045030400 := by decide +kernel

theorem group_length : firstCenterIntegerGrade083Group009.size = 512 := by
  simp only [firstCenterIntegerGrade083Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade083Group009 = 307774243311163212884031101866707076659087549058076618791630675369730733194840201471768569284461291961843712 := by
  simp only [firstCenterIntegerGrade083Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade083Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade083Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
