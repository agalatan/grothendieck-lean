import Grothe.UpperChaos.TaylorSecondIntegerGrade027Group000Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade027Group000Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade027Part00000.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade027Part00000 = 4907663342568849986313677647283788050890975598637652417484657966157996352525135715377286758474653744293384028160 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade027Part00064.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade027Part00064 = 1932849417925768198323100066868751878996129790577222136125561711149123876609691857984943510283473666887892598784 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade027Part00128.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade027Part00128 = 1048936227928712896741223638417637507817684639985104925146016239857208961686826303115747734911218102099700088832 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade027Part00192.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade027Part00192 = 601144109292479841925800935134753741923160214338632337473884918572624284554828069141111963015126976502901506048 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade027Part00256.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade027Part00256 = 367123163800916651597620065062575516634959767034369125204204916172931535635873906828773896424177101711807086592 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade027Part00320.size = 64 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade027Part00320 = 398527505360346484889492633190374545130535761831321344156068854301816022424370019535512958957007845077949612032 := by decide +kernel
private theorem len6 : secondCenterIntegerGrade027Part00384.size = 64 := by decide +kernel
private theorem sum6 : energy secondCenterIntegerGrade027Part00384 = 238328715168839520203973490215858083489460552927673416898979905467867073259612792703598833944539774482405916672 := by decide +kernel
private theorem len7 : secondCenterIntegerGrade027Part00448.size = 64 := by decide +kernel
private theorem sum7 : energy secondCenterIntegerGrade027Part00448 = 168327196342286410091238947142502228955194119095805216767477129909387676764222663905697492454925969909495103488 := by decide +kernel

theorem group_length : secondCenterIntegerGrade027Group000.size = 512 := by
  simp only [secondCenterIntegerGrade027Group000, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy secondCenterIntegerGrade027Group000 = 9662899678388199990086127423316241553838100444427780919256851641588955783460561328592673148465123180965535940608 := by
  simp only [secondCenterIntegerGrade027Group000, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade027Group000Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade027Group000Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade027Group000Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
