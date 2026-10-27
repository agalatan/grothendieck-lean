-- Grothe/LowerAnalytic/CircularFourth.lean
import Grothe.LowerAnalytic.JointContractions

/-!
# The sharp fourth moment of circular cubic chaos

The complex coefficient tensor `t` has squared norm `1/2` under the usual
normalisation. Its four contraction invariants in `JointSixth.gram_chi` are
each at most `1/4`, by Hilbert–Schmidt contraction and symmetrisation.
Consequently `E |q|⁴ ≤ 44`. The one-coordinate Wick cubic attains this value;
see `docs/CIRCULAR_FOURTH_MOMENT.md` for the product-formula proof and example.
-/

open MeasureTheory MvPolynomial ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-- Squared Hilbert–Schmidt norm of a complex three-tensor. -/
def cubicTensorNormSq (t : ι → ι → ι → ℂ) : ℝ :=
  ∑ i, ∑ j, ∑ k, Complex.normSq (t i j k)

private lemma normSq_sum_mul_conj_le {κ : Type*} [Fintype κ] (u v : κ → ℂ) :
    Complex.normSq (∑ i, u i * conj (v i)) ≤
      (∑ i, Complex.normSq (u i)) * ∑ i, Complex.normSq (v i) := by
  have hn : ‖∑ i, u i * conj (v i)‖ ≤ ∑ i, ‖u i‖ * ‖v i‖ := by
    simpa only [norm_mul, Complex.norm_conj] using
      (norm_sum_le Finset.univ (fun i => u i * conj (v i)))
  have hc := Finset.sum_mul_sq_le_sq_mul_sq Finset.univ (fun i => ‖u i‖) (fun i => ‖v i‖)
  rw [Complex.normSq_eq_norm_sq]
  calc
    _ ≤ (∑ i, ‖u i‖ * ‖v i‖) ^ 2 := pow_le_pow_left₀ (norm_nonneg _) hn 2
    _ ≤ _ := by simpa only [Complex.normSq_eq_norm_sq] using hc

/-- A one-slot Gram contraction has Hilbert–Schmidt norm at most `‖t‖²`. -/
theorem gramN_le_tensorNormSq_sq (t : ι → ι → ι → ℂ) :
    gramN t ≤ cubicTensorNormSq t ^ 2 := by
  unfold gramN ctN cubicTensorNormSq
  calc
    _ ≤ ∑ a, ∑ b, (∑ j, ∑ k, Complex.normSq (t a j k)) *
        (∑ j, ∑ k, Complex.normSq (t b j k)) := by
      refine Finset.sum_le_sum fun a _ => Finset.sum_le_sum fun b _ => ?_
      have h := normSq_sum_mul_conj_le (fun p : ι × ι => t a p.1 p.2)
        (fun p : ι × ι => t b p.1 p.2)
      simpa only [Fintype.sum_prod_type] using h
    _ = _ := by
      simp only [← Finset.mul_sum, ← Finset.sum_mul]
      ring

/-- The same estimate holds for the contraction in the third slot. -/
theorem gramH_le_tensorNormSq_sq (t : ι → ι → ι → ℂ) :
    gramH t ≤ cubicTensorNormSq t ^ 2 := by
  have hs : cubicTensorNormSq (fun i j k => t j k i) = cubicTensorNormSq t := by
    unfold cubicTensorNormSq
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun _ _ => Finset.sum_comm
  have he : gramH t = gramN (fun i j k => t j k i) := rfl
  rw [he]
  simpa only [hs] using gramN_le_tensorNormSq_sq (fun i j k => t j k i)

section circular

variable [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
  (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ}
  (ha : Chaos3 a) (hc : Circular J a b)
include hE ha hc

/-- The complex tensor carries half the variance of the circular cubic. -/
theorem Circular.cubicTensorNormSq_eq : cubicTensorNormSq (gramT J a b) = E (a * a) := by
  let f := cubicKernel a
  let g := cubicKernel b
  let t := gramT J a b
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = E (a * a) := (hc.gE_sq_eq hE).symm
  have hf : 6 * (∑ i, ∑ j, ∑ k, f i j k ^ 2) = E (a * a) := by
    simpa only [f] using (ha.gE_sq_eq_kernel hE).symm
  have hg : 6 * (∑ i, ∑ j, ∑ k, g i j k ^ 2) = E (a * a) := by
    simpa only [g, hbb] using (hb.gE_sq_eq_kernel hE).symm
  have hN : (∑ i, (ctN t i i).re) = cubicTensorNormSq t := by
    simp only [ctN, Complex.re_sum, Complex.mul_conj, Complex.ofReal_re, cubicTensorNormSq]
  have hH : (∑ i, (ctH t i i).re) = cubicTensorNormSq t := by
    simp only [ctH, Complex.re_sum, Complex.mul_conj, Complex.ofReal_re, cubicTensorNormSq]
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun _ _ => Finset.sum_comm
  have hfg (i : ι) : kerGs f f i i + kerGs g g i i =
      ((ctH t i i).re + 2 * (ctN t i i).re) / 9 := by
    have h := Htau2_re f g i i
    rw [Htau2_eq hc.isCplx hc.tauC_eq i i] at h
    simpa [t, f, g, gramT, Complex.add_re, Complex.mul_re] using h.symm
  have hsum := Finset.sum_congr rfl fun i (_ : i ∈ Finset.univ) => hfg i
  simp only [← Finset.sum_div, Finset.sum_add_distrib, ← Finset.mul_sum] at hsum
  rw [hN, hH] at hsum
  have hft : (∑ i, kerGs f f i i) = ∑ i, ∑ j, ∑ k, f i j k ^ 2 := by
    unfold kerGs
    simp only [← sq]
    exact Finset.sum_congr rfl fun _ _ => Finset.sum_comm
  have hgt : (∑ i, kerGs g g i i) = ∑ i, ∑ j, ∑ k, g i j k ^ 2 := by
    unfold kerGs
    simp only [← sq]
    exact Finset.sum_congr rfl fun _ _ => Finset.sum_comm
  rw [hft, hgt] at hsum
  dsimp [t] at hsum
  linarith

/-- The fourth moment expressed in the four nonnegative complex contractions. -/
theorem Circular.fourth_moment_contractions :
    E (radU a b ^ 2) - 8 * E (a * a) ^ 2 =
      32 * gramN (gramT J a b) + 8 * gramH (gramT J a b)
        + 32 * gramB (gramT J a b) + 96 * gramY (gramT J a b) := by
  have h4 := ha.wick4 hE
  rw [hc.gE_pow_four hE, show a ^ 2 = a * a by ring] at h4
  have hs := hc.jointS0_eq
  have hh := hc.jointH0_eq
  unfold jointS0 at hs
  unfold jointH0 at hh
  nlinarith

/-- Sharp dimension-free fourth-moment bound at an arbitrary scale. -/
theorem Circular.fourth_moment_le : E (radU a b ^ 2) ≤ 176 * E (a * a) ^ 2 := by
  let t := gramT J a b
  let A := E (a * a) ^ 2
  have hA : 0 ≤ A := sq_nonneg _
  have ht : cubicTensorNormSq t = E (a * a) := hc.cubicTensorNormSq_eq hE ha
  have hn : gramN t ≤ A := by simpa [ht, A] using gramN_le_tensorNormSq_sq t
  have hh : gramH t ≤ A := by simpa [ht, A] using gramH_le_tensorNormSq_sq t
  have hb : gramB t ≤ A := (gramT_schatten J a b).trans hn
  have hyz : gramY t ≤ gramZ t := gramT_symm J a b
  have hzsq := gramZ_sq_le t
  have hh0 := gramH_nonneg t
  have hz : gramZ t ≤ A := by
    apply le_of_sq_le_sq' hA
    exact hzsq.trans (by simpa [sq] using mul_le_mul hn hh hh0 hA)
  have hy : gramY t ≤ A := hyz.trans hz
  have h := hc.fourth_moment_contractions hE ha
  change E (radU a b ^ 2) - 8 * A =
    32 * gramN t + 8 * gramH t + 32 * gramB t + 96 * gramY t at h
  change E (radU a b ^ 2) ≤ 176 * A
  linarith

/-- The same bound in the intrinsic form `E U² ≤ 44 (E U)²`. -/
theorem Circular.fourth_moment_le_variance :
    E (radU a b ^ 2) ≤ 44 * E (radU a b) ^ 2 := by
  have hU : E (radU a b) = 2 * E (a * a) := by
    simp only [radU, map_add]
    rw [← hc.gE_sq_eq hE]
    ring
  rw [hU]
  nlinarith [hc.fourth_moment_le hE ha]

/-- The normalized bound used by the lower reduction. -/
theorem Circular.fourth_moment_le_44 (haa : E (a * a) = 1 / 2) : E (radU a b ^ 2) ≤ 44 := by
  have h := hc.fourth_moment_le hE ha
  rw [haa] at h
  norm_num at h
  exact h

end circular

/-- The sharp bound in the Gaussian integral form used by the lower reduction. -/
theorem Circular.gaussian_fourth_moment_le_44 {d : ℕ}
    (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) :
    ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) ≤ 44 := by
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply]
    simpa only [map_mul, sq] using haa
  have h := hc.fourth_moment_le_44 (gaussE_isGaussianExpectation d) ha haa'
  rw [gaussE_apply] at h
  simpa only [map_pow] using h

/-- The sharp range for the lower certificate's fluctuation parameter. -/
theorem Circular.gaussian_x_le_sqrt42 {d : ℕ}
    (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) :
    √(∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2) ≤ √42 := by
  apply Real.sqrt_le_sqrt
  linarith [hc.gaussian_fourth_moment_le_44 a b ha haa]

end

end Grothe.LowerAnalytic
