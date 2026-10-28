import Grothe.UpperChaos.TaylorSecondIntegerGrade039Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade039Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade039Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade039Part01024 = 3284463028842221075025978971376591134586091048621885775374212408541943366170390161576745550704041861798952960 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade039Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade039Part01088 = 4067608414369193561980489778471216180066631746550500872713617005272631898120233678550352740541916585639542784 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade039Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade039Part01152 = 2125137509141919305335019092733018694807725685103011971437823953414324595897455279770668655229849972116553728 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade039Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade039Part01216 = 2193116823483382778296868928907594586972353640547650120920063687791774117683730857962557330882878221911588864 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade039Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade039Part01280 = 1714333411654715963592940058243464110201918490649273523695951233954223621551925798253839924194695062229090304 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade039Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade039Part01344 = 892823315251523555899700677192751126304970007372191053994543553650982159896049060093988814169054012074098688 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade039Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade039Part01408 = 1266015823957563653636765376102362352159994300615913399381353235332375020267112254365601344190946861572423680 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade039Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade039Part01472 = 542458783334629479598435923031628625411485876271770870136327341896875342879159649074249594621800091888910336 := by decide +kernel

theorem group_length : secondCenterIntegerGrade039Group002.size = 512 := by
  simp only [secondCenterIntegerGrade039Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade039Group002 = 16085957110035149373366198806058626810511170795732197587653892419855130122466056739648003954535182669231161344 := by
  simp only [secondCenterIntegerGrade039Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade039Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade039Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
