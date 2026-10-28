import Grothe.UpperChaos.TaylorFirstIntegerGrade064Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade064Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade064Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade064Part01536 = 1039248178948267399003361256251947593705155668128359032208965649990802841424400097808468852017239001392853549056 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade064Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade064Part01600 = 800885324027395037073149009570277483363215765789803239664501368335525651152324654485554836959677029900403867648 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade064Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade064Part01664 = 615493749488075115164620899670602881949097500791504136147650706149577088210206855428331328211079183309863911424 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade064Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade064Part01728 = 473636129785438323111932955250442289848027683500033296991396216474215787496888824853122864316286434943499763712 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade064Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade064Part01792 = 365655873872470147266796781946395483200012149600191280081568791192417080562489065114295820711669849511497302016 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade064Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade064Part01856 = 283107455333579194828780738095911844678620751576694951154456108843598519032147244665754236026576684751664447488 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade064Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade064Part01920 = 219293013101982538526356831879992652351715161966478607194976685632428571233158785689057663031780089668661411840 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade064Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade064Part01984 = 134105871011934279941026479851708822286281114640370886846162197682942106323303030209270239238158110239481659392 := by decide +kernel

theorem group_length : firstCenterIntegerGrade064Group003.size = 512 := by
  simp only [firstCenterIntegerGrade064Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade064Group003 = 3931425595569142034916024952517279051382125795993435430289677724301507645434918558253855840512466383717925912576 := by
  simp only [firstCenterIntegerGrade064Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade064Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade064Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
