import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group010Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group010Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part05120.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part05120 = 35981804865912965484092965855080112752658169009990831342955098684922982661774452453004347990813829266145280 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part05184.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part05184 = 21783311540419267888784085638596874012579092529810323075321728901226204966753113299388348681283738466779136 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part05248.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part05248 = 1770808286257037628780337332854203746075246587211199615940456915653229028309838798167947963271781940199424 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part05312.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part05312 = 8405107764827683680902916259775812072143197015021271297293365729110317307069820062911646259058060633833472 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part05376.size = 26 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part05376 = 3841328194422207520349384875633402913482317361369076613170195006466305835609308396082517595312983904354304 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group010.size = 282 := by
  simp only [firstCenterIntegerGrade072Group010, Array.size_append, len0, len1, len2, len3, len4]

theorem group_energy : energy firstCenterIntegerGrade072Group010 = 71782360651839162202909689961940405496938022503402701944680845237379039799516533009554808489740394211311616 := by
  simp only [firstCenterIntegerGrade072Group010, energy_append, sum0, sum1, sum2, sum3, sum4]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group010Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group010Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group010Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
