import Grothe.UpperChaos.TaylorFirstIntegerGrade076Group007Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade076Group007Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade076Part03584.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade076Part03584 = 703319699678486634175250783282215438941708555775645294641249088189604093571231425566415440268065846293692416 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade076Part03648.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade076Part03648 = 448815942358345873091680587329259000403113750709193992306932386076702914701449388464313796402802883532161024 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade076Part03712.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade076Part03712 = 295222337249403545111996222420480858624637664912738676932200630966872891881331668257959752788053589865005056 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade076Part03776.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade076Part03776 = 232271378294488231894983704333546943964002146798645434318890705605920475661562463510127523604479051978244096 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade076Part03840.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade076Part03840 = 181846796052021935609455937947614896780129879322604482366553268171633642443930976398786954574120361811509248 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade076Part03904.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade076Part03904 = 22931137958500208126446189644903378029936558948952546927814618701245020033403129257145787423762316999524352 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade076Part03968.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade076Part03968 = 168584292600346935596557623723229194767860361247251674948184542051705735091833915587706542805053798187270144 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade076Part04032.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade076Part04032 = 138399019821762907490311061126978487013046124623140361043509851618855334407078859445113987561948219002847232 := by decide +kernel

theorem group_length : firstCenterIntegerGrade076Group007.size = 512 := by
  simp only [firstCenterIntegerGrade076Group007, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade076Group007 = 2191390604013356271096682109808228198524435042338172463485335091382540107791821826487569785428286067670253568 := by
  simp only [firstCenterIntegerGrade076Group007, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade076Group007Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group007Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade076Group007Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
