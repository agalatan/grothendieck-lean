import Grothe.UpperChaos.TaylorFirstIntegerGrade090Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade090Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade090Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade090Part05120 = 41834379990071142315854861256636564537110858932924318089897861650049522602583373033490882514771353773539328 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade090Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade090Part05184 = 37586860695439126722389390673901190247969661646363765661385232437714156094416188268680616567356293285675008 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade090Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade090Part05248 = 2907784712537703217268291727168168802570012220067892034255440577509410661806617584273793388272886749331456 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade090Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade090Part05312 = 37344575000220533370963031788214926561094000060085994530982561677996844711992754778934705563814758774210560 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade090Part05376.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade090Part05376 = 33264382796709553401878115201872126099345216843149896830899518622452487519610855462336255041179124959805440 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade090Part05440.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade090Part05440 = 931274410491407182136322526062450624412722657799005063042873216089533328618739236156730660842911215648768 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade090Part05504.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade090Part05504 = 29458225898856708609860787989716453389757099841753804550901005345955844478919530177274893501859216654073856 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade090Part05568.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade090Part05568 = 25349455690313886166472628207851147185299910054130910453050110688605172107491347574029029275887428731666432 := by decide +kernel

theorem group_length : firstCenterIntegerGrade090Group010.size = 512 := by
  simp only [firstCenterIntegerGrade090Group010, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade090Group010 = 208676939194640060986823429371423027447559482256275587214414604216372971505439406115176906513983974143950848 := by
  simp only [firstCenterIntegerGrade090Group010, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade090Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade090Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
