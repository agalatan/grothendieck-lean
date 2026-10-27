import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.MeasureTheory.Function.L2Space

/-!
# Compressing multiplication by a common bounded response

Multiplication by a disk-valued response is a contraction on `L²`. Compressing
that same operator between two orthonormal feature banks gives a contraction
matrix. In particular, entries sharing a Hermite coefficient must agree;
they are not freely chosen covariance blocks.

This file constructs multiplication by a measurable bounded response on `L²`,
proves the Hilbert-space certificate and a three-grade coefficient cut. It does
not prove the Gaussian/Laguerre orthonormality or improve a Grothendieck
endpoint. The Gaussian feature and coefficient extraction remain explicit
obligations.

With `R = |Z|²`, the scalar features are
`1`, `R - 1`, `R²/2 - 2*R + 1`. The charge-one features are
`Z`, `Z*(R-2)/sqrt(2)`, `Z*(R²/2-3*R+3)/sqrt(3)`.
Their product identities give the three entries appearing in `three_grade_cut`.
Applying Bessel to `conj(Z)*f`, whose squared norm is at most `E R = 1`,
then proves that cut once the extraction hypotheses have been established.
-/

namespace Grothe.LowerAnalytic.ResponseCompression

open scoped ComplexConjugate
open Finset

noncomputable section

variable {ι κ E F : Type*}
variable [Fintype ι] [Fintype κ]
variable [NormedAddCommGroup E] [InnerProductSpace ℂ E]
variable [NormedAddCommGroup F] [InnerProductSpace ℂ F]

/-- The squared norm of a finite orthonormal expansion. -/
theorem norm_sq_sum (v : κ → E) (hv : Orthonormal ℂ v) (b : κ → ℂ) :
    ‖∑ j, b j • v j‖ ^ 2 = ∑ j, ‖b j‖ ^ 2 := by
  classical
  rw [@InnerProductSpace.norm_sq_eq_re_inner ℂ]
  rw [show (inner ℂ (∑ j, b j • v j) (∑ j, b j • v j)) =
      ∑ j, conj (b j) * b j by simpa using hv.inner_sum b b univ]
  simp [Complex.sq_norm, Complex.normSq_apply]

/-- A compression of a contraction is a contraction. The same `T` occurs in
every matrix entry; no independent completion of the entries is permitted. -/
theorem compression_bessel (T : E →ₗ[ℂ] F)
    (hT : ∀ x, ‖T x‖ ≤ ‖x‖)
    (u : ι → F) (hu : Orthonormal ℂ u)
    (v : κ → E) (hv : Orthonormal ℂ v) (b : κ → ℂ) :
    ∑ i, ‖∑ j, b j * inner ℂ (u i) (T (v j))‖ ^ 2 ≤ ∑ j, ‖b j‖ ^ 2 := by
  classical
  have hb := hu.sum_inner_products_le (T (∑ j, b j • v j)) (s := univ)
  have hn := hT (∑ j, b j • v j)
  have hs : ‖T (∑ j, b j • v j)‖ ^ 2 ≤ ‖∑ j, b j • v j‖ ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) hn 2
  calc
    ∑ i, ‖∑ j, b j * inner ℂ (u i) (T (v j))‖ ^ 2
        = ∑ i, ‖inner ℂ (u i) (T (∑ j, b j • v j))‖ ^ 2 := by
          simp [map_sum, map_smul, inner_sum, inner_smul_right]
    _ ≤ ‖T (∑ j, b j • v j)‖ ^ 2 := by simpa using hb
    _ ≤ ‖∑ j, b j • v j‖ ^ 2 := hs
    _ = ∑ j, ‖b j‖ ^ 2 := norm_sq_sum v hv b

/-- The block matrix with identity diagonal blocks and the compression as its
off-diagonal block has nonnegative quadratic form. This is an inverse-free
form of the Gram PSD certificate. -/
theorem compression_block_nonneg (T : E →ₗ[ℂ] F)
    (hT : ∀ x, ‖T x‖ ≤ ‖x‖)
    (u : ι → F) (hu : Orthonormal ℂ u)
    (v : κ → E) (hv : Orthonormal ℂ v) (a : ι → ℂ) (b : κ → ℂ) :
    0 ≤ (∑ i, ‖a i‖ ^ 2) + (∑ j, ‖b j‖ ^ 2)
      + 2 * (inner ℂ (∑ i, a i • u i) (T (∑ j, b j • v j))).re := by
  have hr := (Complex.abs_re_le_norm
    (inner ℂ (∑ i, a i • u i) (T (∑ j, b j • v j)))).trans
    (norm_inner_le_norm (∑ i, a i • u i) (T (∑ j, b j • v j)))
  have hn := hT (∑ j, b j • v j)
  have hm := mul_le_mul_of_nonneg_left hn (norm_nonneg (∑ i, a i • u i))
  have ha := norm_sq_sum u hu a
  have hb := norm_sq_sum v hv b
  have he : -(‖∑ i, a i • u i‖ * ‖∑ j, b j • v j‖) ≤
      (inner ℂ (∑ i, a i • u i) (T (∑ j, b j • v j))).re := by
    have := neg_abs_le (inner ℂ (∑ i, a i • u i) (T (∑ j, b j • v j))).re
    linarith
  nlinarith [sq_nonneg (‖∑ i, a i • u i‖ - ‖∑ j, b j • v j‖)]

/-- The finite coefficient cut linking linear, cubic and quintic coefficients
of one response. The hypotheses explicitly expose the Gaussian extraction
that has not yet been formalized in this module. -/
theorem three_grade_cut (U : Fin 3 → E) (hU : Orthonormal ℂ U)
    (x : E) (hx : ‖x‖ ^ 2 ≤ 1) (a0 a1 a2 : ℂ)
    (h0 : inner ℂ (U 0) x = a0)
    (h1 : inner ℂ (U 1) x = a0 + (Real.sqrt 2 : ℂ) * a1)
    (h2 : inner ℂ (U 2) x = (Real.sqrt 2 : ℂ) * a1 + (Real.sqrt 3 : ℂ) * a2) :
    ‖a0‖ ^ 2 + ‖a0 + (Real.sqrt 2 : ℂ) * a1‖ ^ 2
      + ‖(Real.sqrt 2 : ℂ) * a1 + (Real.sqrt 3 : ℂ) * a2‖ ^ 2 ≤ 1 := by
  have h := hU.sum_inner_products_le x (s := univ)
  simpa [Fin.sum_univ_three, h0, h1, h2] using h.trans hx

/-- The same certificate in unnormalized polynomial coordinates; this form
can be evaluated using rational coefficients only. -/
theorem three_grade_cut_unnormalized (U : Fin 3 → E) (hU : Orthonormal ℂ U)
    (x : E) (hx : ‖x‖ ^ 2 ≤ 1) (A0 A1 A2 : ℂ)
    (h0 : inner ℂ (U 0) x = A0)
    (h1 : inner ℂ (U 1) x = A0 + A1)
    (h2 : inner ℂ (U 2) x = A1 + A2) :
    ‖A0‖ ^ 2 + ‖A0 + A1‖ ^ 2 + ‖A1 + A2‖ ^ 2 ≤ 1 := by
  have h := hU.sum_inner_products_le x (s := univ)
  simpa [Fin.sum_univ_three, h0, h1, h2] using h.trans hx

/-- A two-by-two same-driver moment compression. In the Gaussian application
the repeated off-diagonal entry and the `b0 + 2*b1 + 2*b2` entry follow from
`(R-1)^2 = 1 + 2*(R-1) + 2*(R^2/2-2*R+1)`; the extraction is explicit. -/
theorem two_by_two_moment_cut (T : E →ₗ[ℂ] F)
    (hT : ∀ x, ‖T x‖ ≤ ‖x‖)
    (u : Fin 2 → F) (hu : Orthonormal ℂ u)
    (v : Fin 2 → E) (hv : Orthonormal ℂ v) (b0 b1 b2 : ℂ)
    (h00 : inner ℂ (u 0) (T (v 0)) = b0)
    (h01 : inner ℂ (u 0) (T (v 1)) = b1)
    (h10 : inner ℂ (u 1) (T (v 0)) = b1)
    (h11 : inner ℂ (u 1) (T (v 1)) = b0 + 2*b1 + 2*b2)
    (x y : ℂ) :
    ‖x*b0 + y*b1‖ ^ 2 + ‖x*b1 + y*(b0 + 2*b1 + 2*b2)‖ ^ 2
      ≤ ‖x‖ ^ 2 + ‖y‖ ^ 2 := by
  have h := compression_bessel T hT u hu v hv ![x,y]
  simpa [Fin.sum_univ_two, h00, h01, h10, h11] using h

/-- The ordinary coefficient-energy check admits this rational profile. -/
theorem fake_radial_parseval :
    (4/5 : ℝ)^2 + (3/10 : ℝ)^2 + (0 : ℝ)^2 ≤ 1 := by norm_num

/-- The same-driver two-by-two cut rejects that profile, already on its
second column. This does not assert existence of a Gaussian response. -/
theorem fake_radial_rejected :
    1 < ‖(3/10 : ℂ)‖ ^ 2 + ‖(4/5 : ℂ) + 2*(3/10 : ℂ) + 2*(0 : ℂ)‖ ^ 2 := by
  norm_num [Complex.sq_norm, Complex.normSq_apply]

/-- The omitted companion must remain free: setting `b2 = -1/2` repairs the
preceding artificial profile without exhausting its coefficient-energy budget. -/
theorem fake_radial_repair_energy :
    (4/5 : ℝ)^2 + (3/10 : ℝ)^2 + (-1/2 : ℝ)^2 = 49/50 := by norm_num

/-- The repaired two-by-two matrix is a contraction for every complex input.
This is a regression example against silently zeroing unresolved companions. -/
theorem fake_radial_repair (x y : ℂ) :
    ‖(4/5 : ℂ)*x + (3/10 : ℂ)*y‖ ^ 2
      + ‖(3/10 : ℂ)*x + (2/5 : ℂ)*y‖ ^ 2 ≤ ‖x‖ ^ 2 + ‖y‖ ^ 2 := by
  have hid : ‖x‖ ^ 2 + ‖y‖ ^ 2
      - (‖(4/5 : ℂ)*x + (3/10 : ℂ)*y‖ ^ 2
        + ‖(3/10 : ℂ)*x + (2/5 : ℂ)*y‖ ^ 2)
      = (3/100 : ℝ) * ‖3*x-4*y‖ ^ 2 + (27/100 : ℝ) * ‖y‖ ^ 2 := by
    simp only [Complex.sq_norm, Complex.normSq_apply]
    norm_num
    ring
  have hp : 0 ≤ (3/100 : ℝ) * ‖3*x-4*y‖ ^ 2 + (27/100 : ℝ) * ‖y‖ ^ 2 := by positivity
  linarith

/-- A second artificial profile passes the unnormalized coefficient-energy
check. The next theorem shows why coefficient energy alone is insufficient. -/
theorem fake_visible_parseval :
    (21/25 : ℝ)^2 + (21/50 : ℝ)^2 / 2 + (0 : ℝ)^2 / 3 ≤ 1 := by norm_num

/-- The three-grade cut rejects the same profile by the exact margin
`73/1250`. A nonzero next companion is required to repair this profile. -/
theorem fake_visible_rejected :
    ‖(21/25 : ℂ)‖ ^ 2 + ‖(21/25 : ℂ) + (-21/50 : ℂ)‖ ^ 2
      + ‖(-21/50 : ℂ) + (0 : ℂ)‖ ^ 2 = 1323/1250 := by
  norm_num [Complex.sq_norm, Complex.normSq_apply]

/-- For the fixed first two real coefficients of the diagnostic profile, the
same-response cut forces a strictly positive quintic companion. -/
theorem forced_visible_companion (m2 : ℝ)
    (h : (21/25 : ℝ)^2 + (21/50 : ℝ)^2 + (m2-21/50)^2 ≤ 1) :
    21/50 - Real.sqrt (59/500) ≤ m2 := by
  have hsq := Real.sq_sqrt (show (0 : ℝ) ≤ 59/500 by norm_num)
  have hpos := Real.sqrt_nonneg (59/500 : ℝ)
  nlinarith [sq_nonneg (m2 - 21/50 + Real.sqrt (59/500))]

section Multiplication

open MeasureTheory

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
variable (f : Ω → ℂ) (hfm : AEStronglyMeasurable f μ)
variable (hfb : ∀ᵐ ω ∂μ, ‖f ω‖ ≤ 1)

include hfm hfb

private theorem response_mul_memLp (x : Lp ℂ 2 μ) :
    MemLp (fun ω => f ω * x ω) 2 μ := by
  apply (Lp.memLp x).of_le_mul (c := (1 : ℝ))
    (hfm.mul (Lp.memLp x).aestronglyMeasurable)
  filter_upwards [hfb] with ω hω
  change ‖f ω * x ω‖ ≤ 1 * ‖x ω‖
  rw [norm_mul, one_mul]
  exact mul_le_of_le_one_left (norm_nonneg _) hω

/-- Multiplication by one common disk-valued response, on the actual `L²`
space over an arbitrary measure. -/
def mulResponse : Lp ℂ 2 μ →ₗ[ℂ] Lp ℂ 2 μ where
  toFun x := (response_mul_memLp f hfm hfb x).toLp (fun ω => f ω * x ω)
  map_add' x y := by
    apply Lp.ext
    filter_upwards [MemLp.coeFn_toLp (response_mul_memLp f hfm hfb (x+y)),
      MemLp.coeFn_toLp (response_mul_memLp f hfm hfb x),
      MemLp.coeFn_toLp (response_mul_memLp f hfm hfb y),
      Lp.coeFn_add x y,
      Lp.coeFn_add ((response_mul_memLp f hfm hfb x).toLp _)
        ((response_mul_memLp f hfm hfb y).toLp _)] with ω hxy hx hy ha hb
    simp only [hxy, hb, Pi.add_apply, hx, hy, ha, mul_add]
  map_smul' c x := by
    apply Lp.ext
    filter_upwards [MemLp.coeFn_toLp (response_mul_memLp f hfm hfb (c • x)),
      MemLp.coeFn_toLp (response_mul_memLp f hfm hfb x),
      Lp.coeFn_smul c x,
      Lp.coeFn_smul c ((response_mul_memLp f hfm hfb x).toLp _)] with ω hcx hx ha hb
    simp only [RingHom.id_apply, hcx, hb, Pi.smul_apply, hx, ha, smul_eq_mul]
    ring

theorem mulResponse_ae (x : Lp ℂ 2 μ) :
    mulResponse f hfm hfb x =ᵐ[μ] fun ω => f ω * x ω :=
  MemLp.coeFn_toLp (response_mul_memLp f hfm hfb x)

/-- The operator used by the compression theorem is a contraction as a
consequence of the actual pointwise boundedness hypothesis. -/
theorem mulResponse_contracts (x : Lp ℂ 2 μ) :
    ‖mulResponse f hfm hfb x‖ ≤ ‖x‖ := by
  apply Lp.norm_le_norm_of_ae_le
  filter_upwards [hfb, mulResponse_ae f hfm hfb x] with ω hω he
  rw [he, norm_mul]
  exact mul_le_of_le_one_left (norm_nonneg _) hω

/-- A directly usable same-response multiplication compression cut. -/
theorem bounded_response_compression
    (u : ι → Lp ℂ 2 μ) (hu : Orthonormal ℂ u)
    (v : κ → Lp ℂ 2 μ) (hv : Orthonormal ℂ v) (b : κ → ℂ) :
    ∑ i, ‖∑ j, b j * inner ℂ (u i) (mulResponse f hfm hfb (v j))‖ ^ 2
      ≤ ∑ j, ‖b j‖ ^ 2 :=
  compression_bessel (mulResponse f hfm hfb) (mulResponse_contracts f hfm hfb)
    u hu v hv b

end Multiplication

end

end Grothe.LowerAnalytic.ResponseCompression
