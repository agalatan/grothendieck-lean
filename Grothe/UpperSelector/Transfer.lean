import Grothe.UpperSelector.Phase
import Grothe.UpperSelector.Radial
import Grothe.UpperSelector.Aggregation

/-! # Power series of the angular selector with a signed polynomial preprocessor -/

open MeasureTheory Complex Finset
open scoped Polynomial

set_option warningAsError true

namespace Haagerup.AngularSelector

noncomputable section

private theorem polynomial_wiener (P : ℝ[X]) : WienerBound P.coeff (l1 P) := by
  have h := hasSum_sum_of_ne_finset_zero (L := .unconditional ℕ) (s := range (P.natDegree + 1))
    (f := fun n => |P.coeff n|) fun n hn => by
      rw [Polynomial.coeff_eq_zero_of_natDegree_lt (by simpa using hn), abs_zero]
  exact ⟨h.summable, h.tsum_eq.le.trans_eq (l1_eq_sum_range P (Nat.lt_succ_self _)).symm⟩

private theorem polynomial_hasSum (P : ℝ[X]) (x : ℝ) :
    HasSum (fun n => P.coeff n * x ^ n) (P.eval x) := by
  rw [Polynomial.eval_eq_sum_range]
  exact hasSum_sum_of_ne_finset_zero fun n hn => by
    rw [Polynomial.coeff_eq_zero_of_natDegree_lt (by simpa using hn), zero_mul]

private theorem convolution_hasSum {f g : ℕ → ℝ} {x a b : ℝ}
    (hf : HasSum (fun n => f n * x ^ n) a) (hg : HasSum (fun n => g n * x ^ n) b) :
    HasSum (fun n => wienerConv f g n * x ^ n) (a * b) := by
  have h := hasSum_sum_range_mul_of_summable_norm hf.summable.norm hg.summable.norm
  rw [hf.tsum_eq, hg.tsum_eq] at h
  refine h.congr_fun fun n => ?_
  rw [wienerConv, sum_mul]
  refine sum_congr rfl fun i hi => ?_
  have hpow : x ^ n = x ^ i * x ^ (n - i) := by
    rw [← pow_add, Nat.add_sub_of_le (Nat.le_of_lt_succ (mem_range.mp hi))]
  rw [hpow]
  ring

/-- The signed row in scalar phase degree 2k+1, before shifting by k and weighting by the phase mass. -/
def preprocessedRow (R : ℝ[X]) (t : ℝ) (k n : ℕ) : ℝ :=
  wienerConv ((R ^ (2 * k + 1)).coeff) (angularRow t k) n

theorem preprocessedRow_wiener (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) (k : ℕ) :
    WienerBound (preprocessedRow R t k) 1 := by
  have h := (polynomial_wiener (R ^ (2 * k + 1))).convolution (angularRow_wienerBound t k)
  exact ⟨h.1, h.2.trans (by rw [mul_one]; exact (l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hR))⟩

private theorem preprocessedRow_hasSum (R : ℝ[X]) {z : ℂ} (hz : ‖z‖ ≤ 1) (t : ℝ) (k : ℕ) :
    HasSum (fun n => preprocessedRow R t k n * (‖z‖ ^ 2) ^ n)
      ((R.eval (‖z‖ ^ 2)) ^ (2 * k + 1) *
        ∫ u : ℂ × ℂ, Real.cos (t * (normSq u.1 + normSq (mY z u) - 2)) ^ (2 * k + 1) ∂mu2) := by
  simpa only [preprocessedRow, Polynomial.eval_pow] using
    convolution_hasSum (polynomial_hasSum (R ^ (2 * k + 1)) (‖z‖ ^ 2)) (angularRow_hasSum_complex hz t k)

/-- Full scalar transfer coefficients, including the preprocessing, phase mass and grade shifts. -/
def selectorCoeff (R : ℝ[X]) (t : ℝ) : ℕ → ℝ :=
  gradeSeries fun k j => haagCoeff k * preprocessedRow R t k j

theorem selectorCoeff_wiener (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) :
    WienerBound (selectorCoeff R t) 1 := by
  have rows (k : ℕ) : WienerBound (fun j => haagCoeff k * preprocessedRow R t k j) (haagCoeff k) := by
    simpa only [mul_one] using (preprocessedRow_wiener R hR t k).const_mul (phaseMass_nonneg k)
  have h := gradeSeries_wienerBound rows phaseMass_summable.hasSum
  exact ⟨h.1, h.2.trans phaseMass_le_one⟩

private theorem selectorCoeff_hasSum (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    HasSum (fun n => selectorCoeff R t n * (‖z‖ ^ 2) ^ n)
      (∑' k, (‖z‖ ^ 2) ^ k * (haagCoeff k * ((R.eval (‖z‖ ^ 2)) ^ (2 * k + 1) *
        ∫ u : ℂ × ℂ, Real.cos (t * (normSq u.1 + normSq (mY z u) - 2)) ^ (2 * k + 1) ∂mu2))) := by
  refine gradeSeries_hasSum (by rw [abs_of_nonneg (sq_nonneg _)]; exact pow_le_one₀ (norm_nonneg _) hz)
    (b := haagCoeff) (fun k => ?_) phaseMass_summable (fun k => ?_)
  · simpa only [mul_one] using (preprocessedRow_wiener R hR t k).const_mul (phaseMass_nonneg k)
  · simpa only [mul_assoc] using (preprocessedRow_hasSum R hz t k).mul_left (haagCoeff k)

private lemma radial_value (h : ℕ → ℝ) (z : ℂ) :
    radialKernel h z = z * ((∑' n, h n * (‖z‖ ^ 2) ^ n : ℝ) : ℂ) := by
  rw [radialKernel, Complex.ofReal_tsum, ← tsum_mul_left]
  refine tsum_congr fun n => ?_
  push_cast
  rw [pow_mul]
  ring

private lemma scalar_factor (z : ℂ) (p c : ℝ) (k : ℕ) :
    (haagCoeff k : ℂ) * (z * p * c * (‖z * p * c‖ : ℂ) ^ (2 * k)) =
      z * (((‖z‖ ^ 2) ^ k * (haagCoeff k * (p ^ (2 * k + 1) * c ^ (2 * k + 1))) : ℝ) : ℂ) := by
  have habs (a : ℝ) : |a| ^ (2 * k) = a ^ (2 * k) := by rw [pow_mul, sq_abs, ← pow_mul]
  have hn : ‖z * (p : ℂ) * (c : ℂ)‖ ^ (2 * k) =
      ‖z‖ ^ (2 * k) * p ^ (2 * k) * c ^ (2 * k) := by
    simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, habs]
  rw [← Complex.ofReal_pow, hn]
  push_cast
  simp only [pow_succ, pow_mul]
  ring

/-- The coefficients used in the Wiener certificate are the full power series of the
finite-matrix selector kernel, for arbitrary complex correlations throughout the closed disk. -/
theorem selectorKernel_eq_radial (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    selectorKernel (radialKernel haagCoeff) R t z = radialKernel (selectorCoeff R t) z := by
  let x := ‖z‖ ^ 2
  let p := R.eval x
  let c (u : ℂ × ℂ) := Real.cos (t * (normSq u.1 + normSq (mY z u) - 2))
  let F (k : ℕ) (u : ℂ × ℂ) := x ^ k * (haagCoeff k * (p ^ (2 * k + 1) * (c u) ^ (2 * k + 1)))
  have hx0 : 0 ≤ x := sq_nonneg _
  have hx1 : x ≤ 1 := pow_le_one₀ (norm_nonneg _) hz
  have hp : |p| ≤ 1 := by
    refine le_trans ?_ hR
    rw [show p = R.eval x from rfl, Polynomial.eval_eq_sum_range, l1_eq_sum_range R (Nat.lt_succ_self _)]
    refine (abs_sum_le_sum_abs _ _).trans (sum_le_sum fun n _ => ?_)
    rw [abs_mul, abs_of_nonneg (pow_nonneg hx0 _)]
    exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hx0 hx1)
  have hm (k : ℕ) : AEStronglyMeasurable (F k) mu2 := by dsimp [F, c, mY]; fun_prop
  have hb (k : ℕ) (u : ℂ × ℂ) : ‖F k u‖ ≤ haagCoeff k := by
    change |x ^ k * (haagCoeff k * (p ^ (2 * k + 1) * (c u) ^ (2 * k + 1)))| ≤ _
    simp only [abs_mul, abs_pow, abs_of_nonneg hx0, abs_of_nonneg (phaseMass_nonneg k)]
    have hc : |c u| ≤ 1 := abs_le.mpr ⟨Real.neg_one_le_cos _, Real.cos_le_one _⟩
    have hpc : |p| ^ (2 * k + 1) * |c u| ^ (2 * k + 1) ≤ 1 :=
      (mul_le_of_le_one_right (by positivity) (pow_le_one₀ (abs_nonneg _) hc)).trans
        (pow_le_one₀ (abs_nonneg _) hp)
    calc
      _ ≤ haagCoeff k * (|p| ^ (2 * k + 1) * |c u| ^ (2 * k + 1)) :=
        mul_le_of_le_one_left (by positivity [phaseMass_nonneg k]) (pow_le_one₀ hx0 hx1)
      _ ≤ _ := mul_le_of_le_one_right (phaseMass_nonneg k) hpc
  have hs (u : ℂ × ℂ) : Summable fun k => F k u :=
    (Summable.of_nonneg_of_le (fun k => norm_nonneg _) (fun k => hb k u) phaseMass_summable).of_norm
  have hi := hasSum_integral_of_dominated_convergence (μ := mu2) (fun k _ => haagCoeff k) hm
    (fun k => ae_of_all _ (hb k)) (ae_of_all _ fun _ => phaseMass_summable)
    (integrable_const _) (ae_of_all _ fun u => (hs u).hasSum)
  have he (u : ℂ × ℂ) : radialKernel haagCoeff (polyKernel R z * c u) =
      z * ((∑' k, F k u : ℝ) : ℂ) := by
    rw [radialKernel, Complex.ofReal_tsum, ← tsum_mul_left]
    exact tsum_congr fun k => scalar_factor z p (c u) k
  have intF (k : ℕ) : (∫ u, F k u ∂mu2) =
      x ^ k * (haagCoeff k * (p ^ (2 * k + 1) * ∫ u, (c u) ^ (2 * k + 1) ∂mu2)) := by
    simp only [F, integral_const_mul]
  change (∫ u, radialKernel haagCoeff (polyKernel R z * c u) ∂mu2) = _
  simp_rw [he]
  rw [integral_const_mul, integral_complex_ofReal, radial_value]
  congr 2
  rw [← hi.tsum_eq, (selectorCoeff_hasSum R hR t hz).tsum_eq]
  exact tsum_congr intF

/-- The angular selector can be used directly by Haagerup's tensor-power transfer theorem. -/
theorem selectorCoeff_dominated (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) :
    DominatedKernel (radialKernel (selectorCoeff R t)) := by
  intro m n A ι _ x y hx hy
  convert phaseSelector_dominated R hR t m n A ι x y hx hy using 1
  refine congrArg (fun a : ℂ => ‖a‖) ?_
  exact sum_congr rfl fun i _ => sum_congr rfl fun j _ => congrArg (A i j * ·)
    (selectorKernel_eq_radial R hR t (by simpa [hx i, hy j] using norm_inner_le_norm (𝕜 := ℂ) (x i) (y j))).symm

end

end Haagerup.AngularSelector
