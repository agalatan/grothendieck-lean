import Grothe.UpperChaos.TaylorFirstIntegerGrade088Group013Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade088Group013Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade088Part06656.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade088Part06656 = 5730123653119210890347191842523007454918171630602817095923255834470094905574747671606487006501206549856256 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade088Part06720.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade088Part06720 = 12410347298471313794837206519475867902305676536088806709916231576917036308671838579649269540289016177360896 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade088Part06784.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade088Part06784 = 9736103114491986965211729287107724115003184862490582931084686871266872620326213946486947969301927476330496 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade088Part06848.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade088Part06848 = 2886622900034155847302669736669581672072733800520826785791102786242093314860296476121200918331732611039232 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade088Part06912.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade088Part06912 = 12717572759032820213982060933247355623972077751883409633060440635298653269167168059625876414709726655283200 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade088Part06976.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade088Part06976 = 13092873044203143523831841458887735135290563533896210522568288156279890685679563042890549079820909229899776 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade088Part07040.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade088Part07040 = 6480702687628141867910320898515810844737676559458054823611406736317973330707682333971252177752704401014784 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade088Part07104.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade088Part07104 = 7911846067859914251719547259815903329782263562335355050271649253812955081444057335254085702016597258928128 := by decide +kernel

theorem group_length : firstCenterIntegerGrade088Group013.size = 512 := by
  simp only [firstCenterIntegerGrade088Group013, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade088Group013 = 70966191524840687355142567936242986078082348237276063552227061850605569516431567445605668808723820359712768 := by
  simp only [firstCenterIntegerGrade088Group013, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade088Group013Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group013Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade088Group013Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
