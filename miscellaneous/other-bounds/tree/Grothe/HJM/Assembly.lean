import Grothe.HJM.Mixture
import Grothe.HJM.CauchyTails
import Grothe.HJM.Finite67
import Grothe.HJM.Origin
import Grothe.Haagerup.Identity

/-!
# Assembly of the HJM bound (HJM §6)

The HJM mixture has six dominated radial branches: the scalar branches `compCoeff haagCoeff (P r)`, `r < 5`
(Haagerup's kernel composed with the preprocessors), and the origin branch `Origin.coeff`, with the signed weights
`w_r` of `Grothe.HJM.Data` (`hc`, `wt`). Their absolute weights sum to exactly `selectorMass`.

`hjm_bound_of_head` combines `mixture_bound` with the published ledger of `ScalarTailRefinement`:
* the tails beyond mode 120 are proved: branches 1–4 by Cauchy estimates (`Cauchy.weighted_tails`), branch 5 by
  `branch5_tail`;
* the remaining inputs are explicit hypotheses: the slope `q̂₀ ≥ slopeLower`, the prefix
  `Σ_{1 ≤ n < 120} |q̂_n| ≤ prefixUpper` (finite sums over the six coefficient tables), and the origin tail
  `|w₆| Σ_{n≥120} |k_{6,n}| ≤ originTailBudget` (HJM 6.27: `< 1.040122407805933·10⁻⁷`).
-/

namespace Grothe.HJM

open Grothe.Upper Finset

noncomputable section

/-- The six branch coefficient series. -/
def hc : Fin 6 → ℕ → ℝ :=
  ![compCoeff haagCoeff (P 0), compCoeff haagCoeff (P 1), compCoeff haagCoeff (P 2), compCoeff haagCoeff (P 3),
    compCoeff haagCoeff (P 4), Origin.coeff]

/-- The six signed weights. -/
def wt (r : Fin 6) : ℝ := ((weights.getD r 0 : ℚ) : ℝ)

/-- The mixture coefficients `q̂_n = Σ_r w_r k_{r,n}`. -/
def qhat (n : ℕ) : ℝ := ∑ r, wt r * hc r n

/-- The budget left for the origin tail after the Cauchy tails of branches 1–4. -/
def originTailBudget : ℚ := ScalarTailRefinement.otherTailsUpper - Cauchy.cauchyBudget

lemma summable_hc (r : Fin 6) : Summable fun n => |hc r n| := by
  fin_cases r
  all_goals first
    | exact Origin.coeff_summable
    | exact summable_abs_compCoeff summable_haagCoeff (l1_P _)

lemma dominated_hc (r : Fin 6) : DominatedKernel (radialKernel (hc r)) := by
  fin_cases r
  all_goals first
    | exact Origin.kernel_dominated
    | exact dominated_branch summable_haagCoeff haagerup_dominated _

lemma weights_mass : ∑ r, |wt r| = (ScalarTailRefinement.selectorMass : ℝ) := by
  have h : (|weights.getD 0 0| + |weights.getD 1 0| + |weights.getD 2 0| + |weights.getD 3 0| +
      |weights.getD 4 0| + |weights.getD 5 0| : ℚ) = ScalarTailRefinement.selectorMass := by
    decide +kernel
  simp only [Fin.sum_univ_six, wt]
  exact_mod_cast h

lemma wt_four : |wt 4| = (ScalarTailRefinement.branch5Weight : ℝ) := by
  have h : |weights.getD 4 0| = ScalarTailRefinement.branch5Weight := by decide +kernel
  simp only [wt]
  exact_mod_cast h

/-- The tail of `q̂` beyond mode 120 is at most the weighted branch tails. -/
lemma qhat_tail_le :
    ∑' n, |qhat (n + 120)| ≤ ∑ r, |wt r| * ∑' n, |hc r (n + 120)| := by
  have hs : ∀ r, Summable fun n => |wt r| * |hc r (n + 120)| := fun r =>
    ((summable_nat_add_iff 120).2 (summable_hc r)).mul_left _
  have hb : ∀ n, |qhat (n + 120)| ≤ ∑ r, |wt r| * |hc r (n + 120)| := fun n => by
    unfold qhat
    refine (abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
    exact sum_congr rfl fun r _ => abs_mul _ _
  have hS : Summable fun n => ∑ r, |wt r| * |hc r (n + 120)| := summable_sum fun r _ => hs r
  have hq : Summable fun n => |qhat (n + 120)| :=
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _) hb hS
  calc ∑' n, |qhat (n + 120)| ≤ ∑' n, ∑ r, |wt r| * |hc r (n + 120)| := Summable.tsum_le_tsum hb hq hS
    _ = ∑ r, ∑' n, |wt r| * |hc r (n + 120)| := Summable.tsum_finsetSum fun r _ => hs r
    _ = ∑ r, |wt r| * ∑' n, |hc r (n + 120)| := sum_congr rfl fun r _ => tsum_mul_left

lemma summable_qhat : Summable fun n => |qhat n| := by
  have hb : ∀ n, |qhat n| ≤ ∑ r, |wt r| * |hc r n| := fun n => by
    unfold qhat
    refine (abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
    exact sum_congr rfl fun r _ => abs_mul _ _
  exact Summable.of_nonneg_of_le (fun _ => abs_nonneg _) hb
    (summable_sum fun r _ => (summable_hc r).mul_left _)

/-- The residual splits into the prefix and the tail beyond mode 120. -/
lemma residual_split :
    ∑' n, |qhat (n + 1)| = ∑ n ∈ range 119, |qhat (n + 1)| + ∑' n, |qhat (n + 120)| := by
  have h1 : Summable fun n => |qhat (n + 1)| := (summable_nat_add_iff 1).2 summable_qhat
  rw [← h1.sum_add_tsum_nat_add 119]

/-- **The HJM bound from its head**: with the slope, the prefix and the origin tail as hypotheses, the mixture
certifies `K_G^ℂ ≤ reciprocalClaim`. -/
theorem hjm_bound_of_head
    (hslope : (ScalarTailRefinement.slopeLower : ℝ) ≤ qhat 0)
    (hprefix : ∑ n ∈ range 119, |qhat (n + 1)| ≤ (ScalarTailRefinement.prefixUpper : ℝ))
    (h6 : |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (originTailBudget : ℝ)) :
    IsGrothendieckBound (ScalarTailRefinement.reciprocalClaim : ℝ) := by
  set T : Fin 6 → ℝ := fun r => |wt r| * ∑' n, |hc r (n + 120)| with hT
  have hcauchy : T 0 + T 1 + T 2 + T 3 ≤ (Cauchy.cauchyBudget : ℝ) := Cauchy.weighted_tails
  have h5 : T 4 ≤ (ScalarTailRefinement.finite67Upper : ℝ) + (ScalarTailRefinement.outerReserve : ℝ) := by
    simp only [hT]; rw [wt_four]; exact branch5_tail
  have hother : T 0 + T 1 + T 2 + T 3 + T 5 ≤ (ScalarTailRefinement.otherTailsUpper : ℝ) := by
    have e : (originTailBudget : ℝ) = (ScalarTailRefinement.otherTailsUpper : ℝ) - Cauchy.cauchyBudget := by
      simp [originTailBudget]
    have : T 5 ≤ (originTailBudget : ℝ) := h6
    linarith
  -- the ledger
  have hscore := ScalarTailRefinement.normalized_score_of_published_budgets (qhat 0)
    (∑ n ∈ range 119, |qhat (n + 1)|) (ScalarTailRefinement.finite67Upper)
    (T 0 + T 1 + T 2 + T 3 + T 5) (T 4 - ScalarTailRefinement.finite67Upper)
    (ScalarTailRefinement.selectorMass) hslope hprefix le_rfl hother (by linarith) rfl
  have htail : ∑' n, |qhat (n + 120)| ≤ T 0 + T 1 + T 2 + T 3 + T 4 + T 5 := by
    have := qhat_tail_le
    simp only [Fin.sum_univ_six] at this
    exact this
  have hres : ∑' n, |qhat (n + 1)| ≤
      ∑ n ∈ range 119, |qhat (n + 1)| + ((ScalarTailRefinement.finite67Upper : ℝ) +
        (T 0 + T 1 + T 2 + T 3 + T 5) + (T 4 - ScalarTailRefinement.finite67Upper)) := by
    rw [residual_split]; linarith
  have hmass : (0 : ℝ) < ScalarTailRefinement.selectorMass := by
    norm_num [ScalarTailRefinement.selectorMass]
  have hclaim : (0 : ℝ) < ScalarTailRefinement.reciprocalClaim := by
    norm_num [ScalarTailRefinement.reciprocalClaim]
  -- the score with the actual residual
  have hscore' : 1 / (ScalarTailRefinement.reciprocalClaim : ℝ) <
      (qhat 0 - ∑' n, |qhat (n + 1)|) / ScalarTailRefinement.selectorMass := by
    refine hscore.trans_le (div_le_div_of_nonneg_right ?_ hmass.le)
    linarith
  have hpos : 0 < qhat 0 - ∑' n, |qhat (n + 1)| := by
    have := (div_pos one_pos hclaim).trans hscore'
    exact (div_pos_iff_of_pos_right hmass).1 this
  -- the mixture
  have hmix := mixture_bound univ wt hc (fun r _ => summable_hc r) (fun r _ => dominated_hc r) hmass
    (le_of_eq weights_mass) (by simpa [qhat] using hpos)
  refine hmix.mono (le_of_lt ?_)
  have e : ∑ r, wt r * hc r 0 - ∑' n, |∑ r, wt r * hc r (n + 1)| = qhat 0 - ∑' n, |qhat (n + 1)| := rfl
  rw [e, div_lt_iff₀ hpos]
  rw [lt_div_iff₀ hmass, one_div, inv_mul_eq_div, div_lt_iff₀ hclaim] at hscore'
  linarith

end

end Grothe.HJM
