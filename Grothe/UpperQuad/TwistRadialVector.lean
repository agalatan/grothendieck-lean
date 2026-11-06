import Grothe.UpperQuad.TwistRadialDescent
import Grothe.UpperQuad.HermiteRadialVector
import Grothe.UpperQuad.TwistPanelRemainder

/-!
# The full vector of descended twisted radial components

The scalar analytic continuation is assembled in exactly the finite Euclidean space used by
`TwistPanels.remainder_of_ellipses`. Its norm uses the full graded rectangle, with no reflection
factor. The production cutoff satisfies `2*Q = Dout+1`, so the radial Hermite bound applies to
this complete vector without a mode-count factor. Analyticity includes the origin whenever the
actual profile is nonzero there.

Agent-ID: codex-1a87. Refs #334, #342, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
open PolynomialHermite FinitePolynomialMehler

noncomputable section

private lemma mode_bounds {j : ℕ} (x : idx3 (twistParams j).Q) :
    x.1.1 < (twistParams j).Q ∧ x.1.2.1 ≤ x.1.1 + 1 ∧ x.1.2.2 ≤ x.1.1 := by
  have hx := x.2
  simp only [idx3, Finset.mem_sigma, Finset.mem_product, Finset.mem_range] at hx
  omega

/-- The actual descended extension in the complete vector space of the remainder theorem. -/
def descendedVector (j : ℕ) (σ : ℝ) (s : ℂ) : TwistPanels.Vector j :=
  WithLp.toLp 2 fun x ↦ descended j x.1.1 x.1.2.1 x.1.2.2 σ s

@[simp] theorem descendedVector_apply (j : ℕ) (σ : ℝ) (s : ℂ)
    (x : idx3 (twistParams j).Q) :
    descendedVector j σ s x = descended j x.1.1 x.1.2.1 x.1.2.2 σ s := rfl

/-- Every component at a complex square recovers the original radial expression. -/
theorem descendedVector_sq_apply (j : ℕ) (σ : ℝ) (r : ℂ)
    (x : idx3 (twistParams j).Q) :
    descendedVector j σ (r ^ 2) x = radial j x.1.1 x.1.2.1 x.1.2.2 σ r := by
  obtain ⟨_, hc, hd⟩ := mode_bounds x
  exact descended_sq j _ _ _ hc hd σ r

/-- Componentwise analyticity gives analyticity of the complete finite vector. -/
theorem analyticAt_descendedVector (j : ℕ) (hj : 0 < j) (σ : ℝ) {s : ℂ}
    (hv : QuadRem.vC s ≠ 0) : AnalyticAt ℂ (descendedVector j σ) s := by
  have hpi : AnalyticAt ℂ
      (fun z : ℂ ↦ fun x : idx3 (twistParams j).Q ↦
        descended j x.1.1 x.1.2.1 x.1.2.2 σ z) s := by
    apply AnalyticAt.pi
    intro x
    obtain ⟨_, hc, hd⟩ := mode_bounds x
    exact analyticAt_descended j _ _ _ hj hc hd σ hv
  exact ((EuclideanSpace.equiv (idx3 (twistParams j).Q) ℂ).symm.analyticAt _).comp hpi

/-- Nonvanishing of the actual profile supplies neighborhood analyticity on any set. -/
theorem analyticOnNhd_descendedVector (j : ℕ) (hj : 0 < j) (σ : ℝ) {S : Set ℂ}
    (hv : ∀ s ∈ S, QuadRem.vC s ≠ 0) :
    AnalyticOnNhd ℂ (descendedVector j σ) S :=
  fun s hs ↦ analyticAt_descendedVector j hj σ (hv s hs)

/-- The differentiability hypothesis used by the vector-valued ellipse theorem. -/
theorem differentiableAt_descendedVector (j : ℕ) (hj : 0 < j) (σ : ℝ) {s : ℂ}
    (hv : QuadRem.vC s ≠ 0) : DifferentiableAt ℂ (descendedVector j σ) s :=
  (analyticAt_descendedVector j hj σ hv).differentiableAt

/-- The vector's real slice is the full production integrand, without factorial scaling. -/
theorem descendedVector_real (j : ℕ) (σ s : ℝ) (hs : 0 ≤ s) (hv : vprof s ≠ 0)
    (hσ : σ = profileSign s) (x : idx3 (twistParams j).Q) :
    descendedVector j σ (s : ℂ) x =
      (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ) := by
  obtain ⟨_, hc, hd⟩ := mode_bounds x
  exact descended_real j _ _ _ hc hd σ s hs hv hσ

/-- The positive signed-profile condition returned by a disk certificate fixes the real slice. -/
theorem descendedVector_real_of_sign (j : ℕ) (σ s : ℝ) (hs : 0 ≤ s)
    (hσ : σ = 1 ∨ σ = -1) (hpos : 0 < σ * vprof s)
    (x : idx3 (twistParams j).Q) :
    descendedVector j σ (s : ℂ) x =
      (twistIntegrand j x.1.1 x.1.2.1 x.1.2.2 s : ℂ) := by
  have hv : vprof s ≠ 0 := by
    intro h
    simp only [h, mul_zero, lt_self_iff_false] at hpos
  apply descendedVector_real j σ s hs hv _ x
  rcases hσ with rfl | rfl
  · have hn : ¬vprof s < 0 := by nlinarith only [hpos]
    simp only [profileSign, hn, ite_false]
  · have hn : vprof s < 0 := by nlinarith only [hpos]
    simp only [profileSign, hn, ite_true]

/-- The Euclidean norm is exactly the full nested graded square sum. -/
theorem norm_descendedVector_sq (j : ℕ) (σ : ℝ) (s : ℂ) :
    ‖descendedVector j σ s‖ ^ 2 =
      ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1), ‖descended j q c d σ s‖ ^ 2 := by
  rw [sum3_eq, descendedVector, EuclideanSpace.norm_eq,
    Real.sq_sqrt (Finset.sum_nonneg fun _ _ ↦ sq_nonneg _),
    ← Finset.sum_coe_sort (idx3 (twistParams j).Q)]

/-- The production output degree contains both triangles of the full graded rectangle. -/
theorem twice_Q_eq_Dout_add_one (j : ℕ) :
    2 * (twistParams j).Q = (twistParams j).Dout + 1 := by
  unfold twistParams
  split_ifs <;> rfl

/-- Finite Mehler controls the full descended vector by its conditional coefficient energy.
The panel sign contributes norm one; there is no reflection or mode-count factor. -/
theorem norm_descendedVector_sq_le (j : ℕ) (σ : ℝ) (hσ : |σ| = 1)
    (r : ℂ) (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    ‖descendedVector j σ (r ^ 2)‖ ^ 2 ≤
      Real.exp (-2 * (r ^ 2).re) * (t ^ (twistParams j).Dout)⁻¹ * (1 - t ^ 2)⁻¹ *
        Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) *
          ∑ cd ∈ indices (twistParams j).Dout,
            ‖GaussianShift.coefficient j r (shift r).re (shift r).im cd‖ ^ 2 := by
  have hσn : ‖(σ : ℂ)‖ = 1 := by
    simpa only [Complex.norm_real, Real.norm_eq_abs] using hσ
  rw [norm_descendedVector_sq]
  calc
    _ = ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2),
        ∑ d ∈ Finset.range (q + 1),
          ‖Complex.exp (-(r ^ 2)) * normalizedHf (q - d) (q + 1 - c) r r *
            GaussianShift.coefficient j r (shift r).re (shift r).im (c, d)‖ ^ 2 := by
      apply Finset.sum_congr rfl
      intro q _
      apply Finset.sum_congr rfl
      intro c hc
      apply Finset.sum_congr rfl
      intro d hd
      have hc' : c ≤ q + 1 := by simp only [Finset.mem_range] at hc; omega
      have hd' : d ≤ q := by simp only [Finset.mem_range] at hd; omega
      rw [descended_sq j q c d hc' hd' σ r]
      simp only [radial, norm_mul, hσn, mul_one]
    _ ≤ _ := HermiteRadialVector.sum_radial_sq_le
      (twistParams j).Q (twistParams j).Dout (twice_Q_eq_Dout_add_one j).le
      (fun c d ↦ GaussianShift.coefficient j r (shift r).re (shift r).im (c, d))
      r t ht0 ht1

/-- The same bound at any chosen square root of the production variable. -/
theorem norm_descendedVector_sq_le_of_sq (j : ℕ) (σ : ℝ) (hσ : |σ| = 1)
    {s r : ℂ} (hr : r ^ 2 = s) (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    ‖descendedVector j σ s‖ ^ 2 ≤
      Real.exp (-2 * s.re) * (t ^ (twistParams j).Dout)⁻¹ * (1 - t ^ 2)⁻¹ *
        Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) *
          ∑ cd ∈ indices (twistParams j).Dout,
            ‖GaussianShift.coefficient j r (shift r).re (shift r).im cd‖ ^ 2 := by
  simpa only [hr] using norm_descendedVector_sq_le j σ hσ r t ht0 ht1

/-- The translated Gaussian coefficient bound gives the Y estimate for the actual full vector. -/
theorem norm_descendedVector_sq_le_y (j : ℕ) (hj : 0 < j) (σ : ℝ) (hσ : |σ| = 1)
    (r : ℂ) (t eta : ℝ) (ht0 : 0 < t) (ht1 : t < 1)
    (heta0 : 0 < eta) (heta1 : eta < 1) :
    ‖descendedVector j σ (r ^ 2)‖ ^ 2 ≤
      Real.exp (-2 * (r ^ 2).re) * (t ^ (twistParams j).Dout)⁻¹ * (1 - t ^ 2)⁻¹ *
        Real.exp (2 * t * r.re ^ 2 / (1 + t) + 2 * t * r.im ^ 2 / (1 - t)) *
          (Real.exp (2 * (shift r).im ^ 2 +
            2 * |(shift r).im| * Real.sqrt (2 * (twistParams j).Dout)) *
              GaussianShift.phaseEnvelopeSq j eta r (shift r).im) := by
  have hcoeff := GaussianShift.sum_coefficient_sq_le j hj heta0 heta1
    r (shift r).re (shift r).im (twistParams j).Dout (indices (twistParams j).Dout)
    (fun cd hcd ↦ mem_indices.mp hcd)
  have ht2 : 0 < 1 - t ^ 2 := by
    nlinarith [mul_pos (sub_pos.mpr ht1) (show 0 < 1 + t by linarith)]
  exact (norm_descendedVector_sq_le j σ hσ r t ht0 ht1).trans
    (mul_le_mul_of_nonneg_left hcoeff (by positivity))

/-- The signed continuation shift differs from the disk geometry shift by the panel sign.
This identity also holds at a profile zero under totalized division. -/
theorem shift_eq_sign_mul (σ : ℝ) (hσ : σ = 1 ∨ σ = -1) (r : ℂ) :
    shift r = (σ : ℂ) * (r / QuadRem.wC σ (r ^ 2)) := by
  rcases hσ with rfl | rfl
  · simp only [shift, QuadRem.wC, Complex.ofReal_one, mul_one, one_mul]
  · simp only [shift, QuadRem.wC, Complex.ofReal_neg, Complex.ofReal_one,
      mul_neg_one, neg_mul, div_neg, one_mul, neg_neg]

/-- Squared norms are unchanged by the fixed panel sign. -/
theorem norm_shift_sq_eq (σ : ℝ) (hσ : σ = 1 ∨ σ = -1) (r : ℂ) :
    ‖shift r‖ ^ 2 = ‖r / QuadRem.wC σ (r ^ 2)‖ ^ 2 := by
  rw [shift_eq_sign_mul σ hσ r]
  rcases hσ with rfl | rfl <;> simp

/-- The imaginary-square bound from disk geometry applies to the signed continuation shift. -/
theorem shift_im_sq_eq (σ : ℝ) (hσ : σ = 1 ∨ σ = -1) (r : ℂ) :
    (shift r).im ^ 2 = (r / QuadRem.wC σ (r ^ 2)).im ^ 2 := by
  rw [shift_eq_sign_mul σ hσ r]
  rcases hσ with rfl | rfl <;> simp

/-- The complex square itself is independent of the choice of panel sign. -/
theorem shift_sq_eq (σ : ℝ) (hσ : σ = 1 ∨ σ = -1) (r : ℂ) :
    (shift r) ^ 2 = (r / QuadRem.wC σ (r ^ 2)) ^ 2 := by
  rw [shift_eq_sign_mul σ hσ r]
  rcases hσ with rfl | rfl <;> simp

/-- In particular the positive real-square condition used by K transports unchanged. -/
theorem shift_sq_re_eq (σ : ℝ) (hσ : σ = 1 ∨ σ = -1) (r : ℂ) :
    ((shift r) ^ 2).re = ((r / QuadRem.wC σ (r ^ 2)) ^ 2).re :=
  congrArg Complex.re (shift_sq_eq σ hσ r)

end

end Grothe.UpperQuad.TwistRadialExt
