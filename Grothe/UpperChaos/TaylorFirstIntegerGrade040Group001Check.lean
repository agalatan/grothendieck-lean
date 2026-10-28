import Grothe.UpperChaos.TaylorFirstIntegerGrade040Group001Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade040Group001Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade040Part00512.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade040Part00512 = 21975291691795454189021148220039677857283066029791887648750763550002257218009323853379872161202115309631763906560 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade040Part00576.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade040Part00576 = 19416640367388317374827626130805953174394003508238142269090937248313611999237786072654815589570475786967292313600 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade040Part00640.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade040Part00640 = 4366106676125560806107252827947655543045890451759800858401651593336216102165009470017196404984082115355566145536 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade040Part00704.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade040Part00704 = 5146530085001108563093224774332200585731323327948453984873449549265662810752530827426514785841541240265409298432 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade040Part00768.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade040Part00768 = 1429890522903939379271891388256290245036863289116559812650332259399790040051809817207954171428774041130448715776 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade040Part00832.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade040Part00832 = 1133894157784481516896472411774730619800024554314509205816586618362992873015185679714962093521405444563295797248 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade040Part00896.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade040Part00896 = 358567978512506543242763068848742412584579912670885956155447651350399754901641222709372492862039102277860458496 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade040Part00960.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade040Part00960 = 316525980010066005683836190814442687163706036440144282648727622337771310544227808166956923131496759954740609024 := by decide +kernel

theorem group_length : firstCenterIntegerGrade040Group001.size = 512 := by
  simp only [firstCenterIntegerGrade040Group001, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade040Group001 = 54143447459521434378144215012819693125039457110280384018387896092368702108677514751277644622541929800146377244672 := by
  simp only [firstCenterIntegerGrade040Group001, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade040Group001Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group001Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade040Group001Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
