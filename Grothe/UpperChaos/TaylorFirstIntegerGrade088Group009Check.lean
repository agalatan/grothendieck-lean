import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group009Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group009Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part04608.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part04608 = 4817001137474125684678945967757415900201635098150825831391031308111168133119202750222300147822252901007360 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part04672.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part04672 = 75705844109025027287917458135416416836549282602036088965546781568053943012901257947978434711044235393499136 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part04736.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part04736 = 64656872108123412003057565241236185754655918542502875050976171534287915060410849878095557252349468145090560 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part04800.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part04800 = 52816682265328064972797945174930973191868763269070399910879627350845567614752065171999060482722453520384000 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part04864.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part04864 = 6325582289073083926078198778062708643149345555149350277568444134484801749766715837535733286600679152943104 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part04928.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part04928 = 53922762835691162724553571060467323221328041635798852086058112049316265163002467676277364714447370991960064 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part04992.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part04992 = 47873968307188986295583525813512690368453469231681515790307081790612679149845585095602173818702363315142656 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part05056.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part05056 = 2255601601503914786386248615002980001929804971982124599897494972755186057572832876229138673029010442682368 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group009.size = 512 := by
  simp only [firstCenterIntegerGrade088Group009, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group009 = 308374314653407777681053458786386693918136260906372032512624744708467525941370977233939763086717833862709248 := by
  simp only [firstCenterIntegerGrade088Group009, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group009Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group009Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group009Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
