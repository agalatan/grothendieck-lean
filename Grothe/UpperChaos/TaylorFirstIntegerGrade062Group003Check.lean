import Grothe.UpperChaos.TaylorFirstIntegerGrade062Group003Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade062Group003Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade062Part01536.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade062Part01536 = 1097680113135994160602346112158301821347248866260558222027691545085607503586831487732152261347578688686767734784 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade062Part01600.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade062Part01600 = 834724170916637500871416939945261870678347745352039154887024443864695600827188716454845507781680825810018107392 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade062Part01664.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade062Part01664 = 635474461278121908609696259468244950921629391888588528664885472180565443764199777504278142455311286001828102144 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade062Part01728.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade062Part01728 = 485275043964907198101098322021565132220089339240561656572445486010976378336056756562084562019199197029980962816 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade062Part01792.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade062Part01792 = 372405397141910350674047615790353228780031139166276606927577375636519958589344110642728919375645204540502835200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade062Part01856.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade062Part01856 = 287519356193011556214979274992438854744668502679694135008165304981946286541051545131908219681465215809012891648 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade062Part01920.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade062Part01920 = 223134258793803459984161634909278512816408042135374126725222071514840409316546127376157262104695747352557780992 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade062Part01984.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade062Part01984 = 173491897110354698259750746753201712270376543601281029678853638391875310847732889587673443382212142142152769536 := by decide +kernel

theorem group_length : firstCenterIntegerGrade062Group003.size = 512 := by
  simp only [firstCenterIntegerGrade062Group003, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade062Group003 = 4109704698534740833317496906038646083778799570324373460491865337667026891808951410991828318147788307372821184512 := by
  simp only [firstCenterIntegerGrade062Group003, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade062Group003Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group003Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade062Group003Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
