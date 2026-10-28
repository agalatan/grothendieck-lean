import Grothe.UpperChaos.TaylorFirstIntegerGrade072Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade072Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade072Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade072Part03584 = 258786006006319904658133483416434355742160189613905868500521262092104264373608486535717218002939187984072704 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade072Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade072Part03648 = 220426347985000999676815350854481228151800688357492416028998451150158283762726060761775348982894486855090176 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade072Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade072Part03712 = 211057571012308214374051164831013883757395128318861624168008909541681590941040833469684097874347021897302016 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade072Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade072Part03776 = 34046191327212106225872594124042959589210836433156300362206222789982416437120493362198858539827938348498944 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade072Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade072Part03840 = 242183636316735851878580879766223655930780662752641067678821258826299260629948678675554028697155797109440512 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade072Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade072Part03904 = 221365598119738339742119022092940116403633653595842839305183023472053139339945220795513324999551376781475840 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade072Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade072Part03968 = 181057881432595297794192358702507775081366097691369986999205851810528464944735560497136370093303710548492288 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade072Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade072Part04032 = 142186452754269709623322131433860668956840577514405886494187708380239810745753864267395770372696705584857088 := by decide +kernel

theorem group_length : firstCenterIntegerGrade072Group007.size = 512 := by
  simp only [firstCenterIntegerGrade072Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade072Group007 = 1511109684954180423973086985221504643613187834277675989537132688063047231174879198364975017562716225109229568 := by
  simp only [firstCenterIntegerGrade072Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade072Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade072Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
