import Grothe.UpperChaos.TaylorFirstIntegerGrade066Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade066Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade066Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade066Part03072 = 1189879110760194035845534746728740532043764894805499981847663435582010370396455282039486724206811587870195712 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade066Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade066Part03136 = 1026310951522949935861943792456639785029133233188994139297149134679198006976897322141084569893090397800890368 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade066Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade066Part03200 = 573299687312611976257256277419402977640941034006953462649683733252226135243060379899354483450785407065653248 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade066Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade066Part03264 = 389015664683894243742046289240146998484784814541750249329385245618102516052225561661684254876251246510997504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade066Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade066Part03328 = 719921915763693777723863912362152870747710807784301086064609195660899815301761626286505153083982181463752704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade066Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade066Part03392 = 676757534628914090957775791117322111415537996423196453015124057380875139248516140102900987092062868550451200 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade066Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade066Part03456 = 634632703990522094145013671667697523181258599773711816518265402241540047114140802084050746275131404895387648 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade066Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade066Part03520 = 528080721642725328638180474283051180321047728085168965557144093893186026443239457202603194430232220491841536 := by decide +kernel

theorem group_length : firstCenterIntegerGrade066Group006.size = 512 := by
  simp only [firstCenterIntegerGrade066Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade066Group006 = 5737898290305505483171614955275153978864179108609576154279024298308038056776296571417670113308347314649169920 := by
  simp only [firstCenterIntegerGrade066Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade066Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade066Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
