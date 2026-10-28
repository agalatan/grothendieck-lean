import Grothe.UpperChaos.TaylorFirstIntegerGrade084Group011Data
import Grothe.UpperChaos.ArraySquareEnergy
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Kernel checks for actual bounded source parts, not a Gaussian certificate. -/
namespace Grothe.UpperChaos.TaylorFirstIntegerGrade084Group011Check
open ArraySquareEnergy

private theorem len0 : firstCenterIntegerGrade084Part05632.size = 64 := by decide +kernel
private theorem sum0 : energy firstCenterIntegerGrade084Part05632 = 15455138381140808688094033541048734966910019214913536373231400679480683405056836488183433339168616131592192 := by decide +kernel
private theorem len1 : firstCenterIntegerGrade084Part05696.size = 64 := by decide +kernel
private theorem sum1 : energy firstCenterIntegerGrade084Part05696 = 7655181389082859117442889734219676603877803392201518413376315861747100223623322645589439246776384891125760 := by decide +kernel
private theorem len2 : firstCenterIntegerGrade084Part05760.size = 64 := by decide +kernel
private theorem sum2 : energy firstCenterIntegerGrade084Part05760 = 7337617857832178801428291637883613055347097027621417502685603497336677399498121662887656616931774762582016 := by decide +kernel
private theorem len3 : firstCenterIntegerGrade084Part05824.size = 64 := by decide +kernel
private theorem sum3 : energy firstCenterIntegerGrade084Part05824 = 13724627642079316586046602685407777408510357511560916292585516916850076291154894748315857256593091243016192 := by decide +kernel
private theorem len4 : firstCenterIntegerGrade084Part05888.size = 64 := by decide +kernel
private theorem sum4 : energy firstCenterIntegerGrade084Part05888 = 14034569923817691783916597033676992534628594371370940373320838970459566459338841179895882213825254946504704 := by decide +kernel
private theorem len5 : firstCenterIntegerGrade084Part05952.size = 64 := by decide +kernel
private theorem sum5 : energy firstCenterIntegerGrade084Part05952 = 6888266973236774185561044776249433903376043249430637295256646292438860470719946423762848636008312512446464 := by decide +kernel
private theorem len6 : firstCenterIntegerGrade084Part06016.size = 64 := by decide +kernel
private theorem sum6 : energy firstCenterIntegerGrade084Part06016 = 6916592909674877365534559085630161911061009439891036977364382213349283887118479481470000840670614078357504 := by decide +kernel
private theorem len7 : firstCenterIntegerGrade084Part06080.size = 64 := by decide +kernel
private theorem sum7 : energy firstCenterIntegerGrade084Part06080 = 15323703367758612114951221060937667334791199738264856416379204249352953575335542993136935332657762335195136 := by decide +kernel

theorem group_length : firstCenterIntegerGrade084Group011.size = 512 := by
  simp only [firstCenterIntegerGrade084Group011, Array.size_append, len0, len1, len2, len3, len4, len5, len6, len7]

theorem group_energy : energy firstCenterIntegerGrade084Group011 = 87335698444623118642975239555054057718502123945254859644199908681015201711845985623242053482631810900819968 := by
  simp only [firstCenterIntegerGrade084Group011, energy_append, sum0, sum1, sum2, sum3, sum4, sum5, sum6, sum7]
  decide +kernel

end Grothe.UpperChaos.TaylorFirstIntegerGrade084Group011Check
open Lean Elab Command
run_cmd do
  for target in #[``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group011Check.group_length,
      ``Grothe.UpperChaos.TaylorFirstIntegerGrade084Group011Check.group_energy] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"
