import Grothe.UpperChaos.TaylorFirstIntegerGrade078Group005Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade078Group005Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade078Part02560.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade078Part02560 = 34998099335474015107903985428061793047821082014241471490261620440402803466427891606537778798657845945778044928 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade078Part02624.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade078Part02624 = 36923727514085762062346103760636170034091874282104056218143150228289050135484747715038554574089704447659737088 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade078Part02688.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade078Part02688 = 30128036070645475778959244761813218534651092897060496140317134289363606314547981326325545432156295253612036096 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade078Part02752.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade078Part02752 = 24438822595677583162973522687698120253154984496042002569853035201279749296413026384939165636496220857332400128 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade078Part02816.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade078Part02816 = 4113756236263448237069438171888086336277208083674112923485357654402688755084538486092458526161113727939641344 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade078Part02880.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade078Part02880 = 15430550703853353007226967993374739568789434772064011051202533047168802892367633286241876404638340545322680320 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade078Part02944.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade078Part02944 = 15297364405563659672136392849767762014907974529057006683836499111811594511531531157057370451552956150628483072 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade078Part03008.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade078Part03008 = 11702734055861214786771867447393551466964588937963035152246752028940217497307070383717952135798143360362872832 := by decide +kernel

theorem group_length : firstCenterIntegerGrade078Group005.size = 512 := by
  simp only [firstCenterIntegerGrade078Group005, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade078Group005 = 173033090917424511815387523100633441256658240012206192229346082001658512869164420345950701959550620288635895808 := by
  simp only [firstCenterIntegerGrade078Group005, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade078Group005Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group005Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade078Group005Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
