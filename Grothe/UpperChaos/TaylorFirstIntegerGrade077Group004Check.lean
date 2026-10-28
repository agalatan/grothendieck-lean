import Grothe.UpperChaos.TaylorFirstIntegerGrade077Group004Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade077Group004Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade077Part02048.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade077Part02048 = 170032068715270309672978513653056544141761055853265029156072672515719485761640675387545186339177557557354954752 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade077Part02112.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade077Part02112 = 139044372184086763607502733597437381105204954227640905833008966668688999119384745375563399200378927759214247936 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade077Part02176.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade077Part02176 = 112581518703381156587292539091453949889210379030655847645872754313849653311933359509913328971522829429671723008 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade077Part02240.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade077Part02240 = 90908304118064792790275978293574330752187391807962250253739712952407043729975138006945124024377534115955605504 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade077Part02304.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade077Part02304 = 6148659555931947515804866454145884743312349707732628410874366278681684306113232235553752192340813380476469248 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade077Part02368.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade077Part02368 = 67269543274037959026200244258412246020976065116140153296260571502806049881610802814446135717635022472882421760 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade077Part02432.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade077Part02432 = 59466236563898807109008973140186384505219943432178673837306322816696382249640272996459987986034322018538618880 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade077Part02496.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade077Part02496 = 48383762264690273127685958523659222177370517752432542774610053528438793437916376268552996177808316036626251776 := by decide +kernel

theorem group_length : firstCenterIntegerGrade077Group004.size = 512 := by
  simp only [firstCenterIntegerGrade077Group004, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade077Group004 = 693834465379362009436749807011925943335242656928008031207745420577288091798214602594979910609275322770720292864 := by
  simp only [firstCenterIntegerGrade077Group004, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade077Group004Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group004Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade077Group004Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
