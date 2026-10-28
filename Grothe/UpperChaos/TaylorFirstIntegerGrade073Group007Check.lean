import Grothe.UpperChaos.TaylorFirstIntegerGrade073Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade073Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade073Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade073Part03584 = 378865618315992684946548661278561643391786605318580372897006567219445686642593400334544549134473554045173760 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade073Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade073Part03648 = 269672176131702678043384127144685826466152872193906117912535029362643007772045079226016534784201422448623616 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade073Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade073Part03712 = 199556178084836862498263573525390618778473228825040413210347922981991350446618586720536432611287237790793728 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade073Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade073Part03776 = 180588889677805558736386911047451561020477000526210389623559206428831674033699361329344577760162081635565568 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade073Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade073Part03840 = 188565760620549963100532444880167214642593560115144357536509120909187592884333469951271689408326665903276032 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade073Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade073Part03904 = 18954182073246206668051414841040989712687342242679844786439109407991251287517247087011917913319203563110400 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade073Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade073Part03968 = 188885601127066946497405850467147769244110687962582750258015614277707782359783490046907930524879532555501568 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade073Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade073Part04032 = 172423616720289005178963617751657302907911063957952853779327956231966166978193086239104993856916772804886528 := by decide +kernel

theorem group_length : firstCenterIntegerGrade073Group007.size = 512 := by
  simp only [firstCenterIntegerGrade073Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade073Group007 = 1597512022751489905669536600936102926164192361142097100003740526819764512404783720934738625993566470746931200 := by
  simp only [firstCenterIntegerGrade073Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade073Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade073Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
