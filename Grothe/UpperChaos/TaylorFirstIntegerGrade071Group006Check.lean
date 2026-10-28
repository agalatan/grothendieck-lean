import Grothe.UpperChaos.TaylorFirstIntegerGrade071Group006Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade071Group006Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade071Part03072.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade071Part03072 = 266074425316763806233799653686599134336941536576023573200634717812408962594400049879568513694752859255472128 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade071Part03136.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade071Part03136 = 2262792858825223306998916564992610081764885252468962325941734055545396476184929103947813719441126791042826240 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade071Part03200.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade071Part03200 = 1692583720294097374351752700530327708176717474382923291748453781369303053075800698197767564652251917410369536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade071Part03264.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade071Part03264 = 1159411283497045596806290980037324538469480362012439112747997458540339566231567426983762138072191348259160064 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade071Part03328.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade071Part03328 = 797075439829743835360105174901923399299673762653764279854126263228151742576822207012728027844426509026590720 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade071Part03392.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade071Part03392 = 534117867242325990832980086736515260068197485967128960890349542234638086987565947300913105848798706778767360 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade071Part03456.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade071Part03456 = 355772913818823103464012216032531889072015159275855896720378015732965470501447380732513649750492213105655808 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade071Part03520.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade071Part03520 = 278976981689178559047026033134073225139702143775535973772539724604159505852490072536145076738558686551605248 := by decide +kernel

theorem group_length : firstCenterIntegerGrade071Group006.size = 512 := by
  simp only [firstCenterIntegerGrade071Group006, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade071Group006 = 7346805490513201573094883410051905236327613177112633414876213559067362864005022886591211796042599031430447104 := by
  simp only [firstCenterIntegerGrade071Group006, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade071Group006Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group006Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade071Group006Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
