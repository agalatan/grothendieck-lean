import Grothe.UpperChaos.TaylorFirstIntegerGrade080Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade080Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade080Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade080Part02048 = 150655585059752902057068256697503707218982350078120045306753121444169608642159452217263459171267455692226691072 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade080Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade080Part02112 = 135337113524553617772529007479656481231078412144874088480831382785166101459509299290673958731550093553367515136 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade080Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade080Part02176 = 110977002771022561283190628411236726679795409862351499697798802380130300308278659616983989097943967421331144704 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade080Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade080Part02240 = 91040108331824985851476893441880140262422478597062748121035828820410965133178558235321912952539472928029278208 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade080Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade080Part02304 = 24167194365442294934304776210450545722585083717697202653469687317280389751056061096955279782808897309376512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade080Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade080Part02368 = 74630324019261488453230613308440466033197456948680625699742653227057147912132726248233642856759118007092903936 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade080Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade080Part02432 = 61038445521067232367595482275946971209689836085586823788396587315852224244278473403996510276769899800768282624 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade080Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade080Part02496 = 49768507646232361809923032746404041781533400945089620683924224122901704302538977895375334672811954530525642752 := by decide +kernel

theorem group_length : firstCenterIntegerGrade080Group004.size = 512 := by
  simp only [firstCenterIntegerGrade080Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade080Group004 = 673471254068080591889948219137278984962421929745483148981136069783005332391827202968945763039424770830650834944 := by
  simp only [firstCenterIntegerGrade080Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade080Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade080Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
