import Grothe.UpperChaos.Q0GaussQPoly
import Grothe.UpperChaos.Q0GaussPolynomialOrder01
import Grothe.UpperChaos.Q0GaussPolynomialOrder02
import Grothe.UpperChaos.Q0GaussPolynomialOrder03
import Grothe.UpperChaos.Q0GaussPolynomialOrder04
import Grothe.UpperChaos.Q0LegendreWeight

/-!
# Degree-zero mass of recurrence-root Gauss rules of orders one to four

Agent-ID: codex-2ca4. Version 2 complete source draft; NOT COMPILED.

This core imports only QPoly, the four small-order polynomial certificate
modules, and the existing Legendre weight definition. It does not import
SelectedRule, physical bounds, the selected-root family, or production mass.
The four generated certificate modules must themselves be checked before
this draft can be delivered.

The theorem concerns any injective family of roots of the existing realPair
recurrence, and sums the existing Q0LegendreInteger.weight. No new root or
weight definition is introduced. The separate Q0GaussSourcePanelMass wrapper
recovers the SelectedRule adapter and actual source-panel conclusion.
-/

open Polynomial MeasureTheory
open scoped BigOperators

namespace Grothe.UpperChaos.Q0GaussSmallOrderMass

open Q0GaussExactness.QPolyCertificates Q0GaussPolynomialData
open Q0LegendreInteger

private theorem source01 : SourcePair 0 p00 p01 := sourcePair_zero

private theorem source02 : SourcePair 1 p01 p02 :=
  sourcePair_step 0 p00 p01 p02 source01
    Q0GaussPolynomialOrder02.recurrence_checked

private theorem source03 : SourcePair 2 p02 p03 :=
  sourcePair_step 1 p01 p02 p03 source02
    Q0GaussPolynomialOrder03.recurrence_checked

private theorem source04 : SourcePair 3 p03 p04 :=
  sourcePair_step 2 p02 p03 p04 source03
    Q0GaussPolynomialOrder04.recurrence_checked

private theorem reference_weight_sum01 (node : Fin 1 → ℝ)
    (hinj : Function.Injective node)
    (hroot : ∀ i, (realPair (node i) 0).2 = 0) :
    (∑ i, Q0LegendreInteger.weight 0 (node i)) = 2 := by
  have h := actual_exactness_of_check 0 p00 p01 w01 r01
    source01 Q0GaussPolynomialOrder01.identities_checked
    node hinj hroot (1 : ℝ[X]) (by norm_num)
  simpa [Q0LegendreInteger.weight, one_add_one_eq_two] using h.symm

private theorem reference_weight_sum02 (node : Fin 2 → ℝ)
    (hinj : Function.Injective node)
    (hroot : ∀ i, (realPair (node i) 1).2 = 0) :
    (∑ i, Q0LegendreInteger.weight 1 (node i)) = 2 := by
  have h := actual_exactness_of_check 1 p01 p02 w02 r02
    source02 Q0GaussPolynomialOrder02.identities_checked
    node hinj hroot (1 : ℝ[X]) (by norm_num)
  simpa [Q0LegendreInteger.weight, one_add_one_eq_two] using h.symm

private theorem reference_weight_sum03 (node : Fin 3 → ℝ)
    (hinj : Function.Injective node)
    (hroot : ∀ i, (realPair (node i) 2).2 = 0) :
    (∑ i, Q0LegendreInteger.weight 2 (node i)) = 2 := by
  have h := actual_exactness_of_check 2 p02 p03 w03 r03
    source03 Q0GaussPolynomialOrder03.identities_checked
    node hinj hroot (1 : ℝ[X]) (by norm_num)
  simpa [Q0LegendreInteger.weight, one_add_one_eq_two] using h.symm

private theorem reference_weight_sum04 (node : Fin 4 → ℝ)
    (hinj : Function.Injective node)
    (hroot : ∀ i, (realPair (node i) 3).2 = 0) :
    (∑ i, Q0LegendreInteger.weight 3 (node i)) = 2 := by
  have h := actual_exactness_of_check 3 p03 p04 w04 r04
    source04 Q0GaussPolynomialOrder04.identities_checked
    node hinj hroot (1 : ℝ[X]) (by norm_num)
  simpa [Q0LegendreInteger.weight, one_add_one_eq_two] using h.symm

/-- The existing recurrence weights sum to two for any complete injective
root family of an order from one to four. -/
theorem recurrence_weight_sum (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 4)
    (node : Fin n → ℝ) (hinj : Function.Injective node)
    (hroot : ∀ i, (realPair (node i) (n - 1)).2 = 0) :
    (∑ i, Q0LegendreInteger.weight (n - 1) (node i)) = 2 := by
  have hcases : n = 1 ∨ n = 2 ∨ n = 3 ∨ n = 4 := by omega
  rcases hcases with h | h | h | h
  · subst n
    exact reference_weight_sum01 node hinj hroot
  · subst n
    exact reference_weight_sum02 node hinj hroot
  · subst n
    exact reference_weight_sum03 node hinj hroot
  · subst n
    exact reference_weight_sum04 node hinj hroot

end Grothe.UpperChaos.Q0GaussSmallOrderMass
