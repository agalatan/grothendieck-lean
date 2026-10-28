import Grothe.UpperChaos.TaylorFirstIntegerGrade059Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade059Group002Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade059Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade059Part01024 = 7888166347344049012146819397386646699231880356987885391741585697179860343842284352598323868201823660252149579776 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade059Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade059Part01088 = 6602053046787613433705634192967566418121159797440253144318365298439934522038356755072117692659096758997789704192 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade059Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade059Part01152 = 5486638960513693204450450034095357876475897676600371205967958606521191688764906131883470373644937817881508315136 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade059Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade059Part01216 = 4671147563677036197848509216864422964086818520474351717880851890720807006864403338844577343159568857502687690752 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade059Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade059Part01280 = 4263113188187512823716766128811350121129541515608241689045064450067801032680213405673863511833809228308984889344 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade059Part01344.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade059Part01344 = 2085257860765173635122169948920762384460190876911692257918688236691395100350992799557190239584013962488890523648 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade059Part01408.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade059Part01408 = 1257068378302145906767047422292294762435668326560092849191878029710407676955514519450645362888978022827139530752 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade059Part01472.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade059Part01472 = 920502724599108176034749067453372084372944971749901313780542457625439238787321128781738634796615705235407503360 := by decide +kernel

theorem group_length : firstCenterIntegerGrade059Group002.size = 512 := by
  simp only [firstCenterIntegerGrade059Group002, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade059Group002 = 33173948070176332389792145408791773310314102042332789569844934666956836610283992431861927026768844013494557736960 := by
  simp only [firstCenterIntegerGrade059Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade059Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade059Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
