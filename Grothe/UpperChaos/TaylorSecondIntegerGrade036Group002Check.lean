import Grothe.UpperChaos.TaylorSecondIntegerGrade036Group002Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorSecondIntegerGrade036Group002Check
open ArraySquareEnergy

private theorem len0 : secondCenterIntegerGrade036Part01024.size = 64 := by decide +kernel
private theorem sum0 : energy secondCenterIntegerGrade036Part01024 = 3640400433072840361696000368459046081921499587256857218671817180981929941891201271318866225419349392384589824 := by decide +kernel
private theorem len1 : secondCenterIntegerGrade036Part01088.size = 64 := by decide +kernel
private theorem sum1 : energy secondCenterIntegerGrade036Part01088 = 4374917910712347199792985512896938267981211947432785910969785914307924872724491610167052549148384949132328960 := by decide +kernel
private theorem len2 : secondCenterIntegerGrade036Part01152.size = 64 := by decide +kernel
private theorem sum2 : energy secondCenterIntegerGrade036Part01152 = 3183166931439103633516464693618490434847495571538907571073320446063276106918901032101118887808733707371544576 := by decide +kernel
private theorem len3 : secondCenterIntegerGrade036Part01216.size = 64 := by decide +kernel
private theorem sum3 : energy secondCenterIntegerGrade036Part01216 = 1721714473672354126336895658843338150464872407424143914725365268059358608541189309346206602373502503705640960 := by decide +kernel
private theorem len4 : secondCenterIntegerGrade036Part01280.size = 64 := by decide +kernel
private theorem sum4 : energy secondCenterIntegerGrade036Part01280 = 1655422074353456092454776292087191174741845962444201011724117237472106742418949750162643468665461481211428864 := by decide +kernel
private theorem len5 : secondCenterIntegerGrade036Part01344.size = 62 := by decide +kernel
private theorem sum5 : energy secondCenterIntegerGrade036Part01344 = 2025555849784570740488120402813564724376788481008428634651402166085127648594670308380085262975294465516765184 := by decide +kernel

theorem group_length : secondCenterIntegerGrade036Group002.size = 382 := by
  simp only [secondCenterIntegerGrade036Group002, Array.size_append, len0, len1, len2, len3, len4, len5]

theorem group_energy : energy secondCenterIntegerGrade036Group002 = 16601177673034672154285242928718568834333713957105324261815808212969723921089403281475972996390726499322298368 := by
  simp only [secondCenterIntegerGrade036Group002, energy_append, sum0, sum1, sum2, sum3, sum4, sum5]
  decide +kernel

end Grothe.UpperChaos.TaylorSecondIntegerGrade036Group002Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorSecondIntegerGrade036Group002Check.group_length,
      ``Grothe.UpperChaos.TaylorSecondIntegerGrade036Group002Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
