import Grothe.LowerAnalytic.Witness
import Grothe.LowerAnalytic.GaussianRadial
import Grothe.LowerAnalytic.WickChaos
import Grothe.Lower.Support
import Grothe.Lower.RowData

/-!
# The scalar cap of the witness: the exact interface to the certificate (L5, cap half)

For unimodular `f, g ∈ L²(γ_n)` write `h = (f+g)/2`, `k = (f−g)/2` (so `|h|² + |k|² = 1` a.e.),
`P = P₁,₀`, `Q = P₂,₁`.  Since `T = P − eQ + ν(1 − P − Q)` (the witness with the weight `e` and the
identity tail `ν`) is self-adjoint, the **polarisation identity** (`VOf_eq`; the identity
(eq:identity) of the paper is the case `ν = 0`, `VOf_zero`) holds for every pair, with `t = ‖Ph‖`:

  `Re ⟪f, T g⟫ = ⟪h, T h⟫ − ⟪k, T k⟫`
  `= t² − e‖Qh‖² − ‖Pk‖² + e‖Qk‖² + ν(‖h‖² − t² − ‖Qh‖²) − ν(‖k‖² − ‖Pk‖² − ‖Qk‖²)`.

For a unimodular pair `‖h‖² + ‖k‖² = 1`, and in **hat units** `ε̂ = (e+ν)/(1−ν)`, `ν̂ = ν/(1−ν)`
(`T = (1−ν)(P − ε̂Q + ν̂)`; `VOf_eq_hat`, `ν ≠ 1`):

  `Re ⟪f, T g⟫ = (1−ν)[t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖Qk‖² + ν̂(1 − 2‖k‖²)] = (1−ν) V̂ + ν`,
  `V̂ = t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖Qk‖² − 2ν̂‖k‖²` (`VhatOf`).

After a phase (`g ↦ θg`, `|θ| = 1`) the pairing is real and nonnegative, so the scalar cap
`‖⟪f, T g⟫‖ ≤ B` becomes the bound `V ≤ B` for the **scalar profile value** `V = Re ⟪f, T g⟫`, and a
cap `c` of the hat value gives the endpoint `B = (1−ν)c + ν` (`witnessCap_of_VhatOf_le`).  The rows
of a certificate bound the hat value, and their constant `ε` is the hat weight `ε̂`.

The reduction below is stated for every witness whose hat weight is the constant of the rows, `ε̂ = ε`
(hypothesis `epsHat e ν = ε`), and it bounds the hat value `V̂`.  The envelope bounds `V̂` using
`‖v‖² = 2`, `0 ≤ t ≤ 9/10`, the mass row and `SharedReduction rowData V̂ t Qh v`. The bound `t ≤ 9/10` is proved
(`tOf_le`): `t = ‖Ph‖` with `|h| ≤ 1`, `‖Ph‖² = Re⟪h, Ph⟫ ≤ E|Ph|`, and `Ph = Σₗ cₗ zₗ` is a complex
Gaussian, so `E|Ph| = (√π/2)‖Ph‖` (`integral_norm_linL`, by the rotation invariance
`integral_two_linear` and the planar radius `integral_norm_gauss2` of `GaussianRadial.lean`); hence
`t ≤ √π/2 < 0.9`.  The Stein side uses `‖Qk‖ ≤ ρ`, which is proved
(`normQk_le_rho`, item L3): `Qk ∈ H₂,₁` is a combination of Wick cubics (`exists_wick_repr`), so
`Qk/‖Qk‖ = a + ib` a.e. with `a, b` real polynomials, `Chaos3 a` and `Circular Jstd a b`
(`WickChaos.lean`), `∫ a² = 1/2`; the certified first-moment bound `E √U ≤ ρ` of the law
`U = a² + b²` (`gaussian_moments`, field `mh`, which rests on the sixth-moment inequality, proved
through the tensor facts `Circular.tensorFacts`) gives `E|Qk/‖Qk‖| ≤ ρ`, and
`‖Qk‖² = Re⟪k, Qk⟫ ≤ E|Qk|` with `|k| ≤ 1`.
Hence the remaining hypothesis of the scalar cap, per admissible pair with `V ≥ 0`, is exactly
(`ReductionHyp`):

* a coupling vector `v` with `‖v‖² = 2` (on paper `v = z₁(|z₁|² − 2)` in the frame with `Ph = t z₁`)
  and `SharedReduction rowData V̂ t Qh v` (L4: the Gaussian reduction of the rows with the shared
  residual, gate variable and potentials).

For a unimodular pair the tail of the hat value is global: `Re⟪f, g⟫ = ‖h‖² − ‖k‖²`
(`re_inner_eq_normSq_hOf_sub`), so `−2‖k‖² = Re⟪f, g⟫ − 1` (`re_inner_sub_one`), the form in which
the integrated fibre bound carries the tail.

Here `L²(γ_n)` is the real inner product space `E` of `SharedReduction` through Mathlib's
`InnerProductSpace ℝ (Lp ℂ 2 μ)` (real part of the complex inner product, same norm).
-/

namespace Grothe.LowerAnalytic

open MeasureTheory MvPolynomial Grothe.Lower
open scoped ComplexConjugate

noncomputable section

variable (n : ℕ)

/-! ### Self-adjointness and the polarisation identity -/

lemma inner_witnessOf_symm (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] (e ν : ℝ)
    (x y : L2G n) :
    inner ℂ (witnessOf n K e ν x) y = inner ℂ x (witnessOf n K e ν y) := by
  simp only [witnessOf_apply, inner_add_left, inner_add_right, inner_sub_left, inner_sub_right,
    inner_smul_left, inner_smul_right, Submodule.inner_starProjection_left_eq_right,
    Complex.conj_ofReal]

/-- Polarisation: `Re ⟪h + k, T (h − k)⟫ = Re ⟪h, T h⟫ − Re ⟪k, T k⟫` for the self-adjoint `T`. -/
lemma re_inner_witnessOf_polar (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] (e ν : ℝ)
    (h k : L2G n) :
    (inner ℂ (h + k) (witnessOf n K e ν (h - k))).re
      = (inner ℂ h (witnessOf n K e ν h)).re - (inner ℂ k (witnessOf n K e ν k)).re := by
  rw [map_sub, inner_add_left, inner_sub_right, inner_sub_right]
  have hs : inner ℂ k (witnessOf n K e ν h) = conj (inner ℂ h (witnessOf n K e ν k)) := by
    rw [← inner_conj_symm, inner_witnessOf_symm]
  rw [hs]
  simp only [Complex.sub_re, Complex.add_re, Complex.conj_re]
  ring

/-! ### The quantities of the scalar reduction -/

/-- `h = (f + g)/2`. -/
def hOf (f g : L2G n) : L2G n := (2 : ℂ)⁻¹ • (f + g)

/-- `k = (f − g)/2`. -/
def kOf (f g : L2G n) : L2G n := (2 : ℂ)⁻¹ • (f - g)

/-- `t = ‖P₁,₀ h‖`. -/
def tOf (f g : L2G n) : ℝ := ‖(H10 n).starProjection (hOf n f g)‖

/-- `Qh = P₂,₁ h`. -/
def QhOf (f g : L2G n) : L2G n := (H21 n).starProjection (hOf n f g)

/-- `Qk = P₂,₁ k`. -/
def QkOf (f g : L2G n) : L2G n := (H21 n).starProjection (kOf n f g)

/-- `Pk = P₁,₀ k`. -/
def PkOf (f g : L2G n) : L2G n := (H10 n).starProjection (kOf n f g)

/-- The scalar profile value `V = Re ⟪f, T g⟫` of the witness with weight `e` and tail `ν`. -/
def VOf (e ν : ℝ) (f g : L2G n) : ℝ := (inner ℂ f (witness n e ν g)).re

lemma hOf_add_kOf (f g : L2G n) : hOf n f g + kOf n f g = f := by
  unfold hOf kOf; rw [← smul_add, add_add_sub_cancel, ← two_smul ℂ f, smul_smul,
    inv_mul_cancel₀ two_ne_zero, one_smul]

lemma hOf_sub_kOf (f g : L2G n) : hOf n f g - kOf n f g = g := by
  unfold hOf kOf; rw [← smul_sub, add_sub_sub_cancel, ← two_smul ℂ g, smul_smul,
    inv_mul_cancel₀ two_ne_zero, one_smul]

/-- **The exact identity** (eq:identity, with the tail `ν`), for every pair:
`Re ⟪f, T g⟫ = t² − e‖Qh‖² − ‖Pk‖² + e‖Qk‖² + ν(‖h‖² − t² − ‖Qh‖²) − ν(‖k‖² − ‖Pk‖² − ‖Qk‖²)`. -/
theorem VOf_eq (e ν : ℝ) (f g : L2G n) :
    VOf n e ν f g = tOf n f g ^ 2 - e * ‖QhOf n f g‖ ^ 2 - ‖PkOf n f g‖ ^ 2 + e * ‖QkOf n f g‖ ^ 2
      + ν * (‖hOf n f g‖ ^ 2 - tOf n f g ^ 2 - ‖QhOf n f g‖ ^ 2)
      - ν * (‖kOf n f g‖ ^ 2 - ‖PkOf n f g‖ ^ 2 - ‖QkOf n f g‖ ^ 2) := by
  have h := re_inner_witnessOf_polar n (H21 n) e ν (hOf n f g) (kOf n f g)
  rw [hOf_add_kOf, hOf_sub_kOf, re_inner_witnessOf, re_inner_witnessOf] at h
  unfold VOf witness tOf QhOf PkOf QkOf
  rw [h]; ring

/-- **The exact identity without tail** (eq:identity): at `ν = 0`,
`Re ⟪f, T g⟫ = t² − e‖Qh‖² − ‖Pk‖² + e‖Qk‖²`. -/
theorem VOf_zero (e : ℝ) (f g : L2G n) :
    VOf n e 0 f g = tOf n f g ^ 2 - e * ‖QhOf n f g‖ ^ 2 - ‖PkOf n f g‖ ^ 2 + e * ‖QkOf n f g‖ ^ 2 := by
  simpa using VOf_eq n e 0 f g

/-! ### Hat units and the endpoint -/

/-- `ε̂ = (e + ν)/(1 − ν)`: the weight of `P₂,₁` in hat units, `T = (1−ν)(P₁,₀ − ε̂ P₂,₁ + ν̂)`. -/
def epsHat (e ν : ℝ) : ℝ := (e + ν) / (1 - ν)

/-- `ν̂ = ν/(1 − ν)`: the tail in hat units. -/
def nuHat (ν : ℝ) : ℝ := ν / (1 - ν)

/-- **The profile value in hat units**: `V̂ = t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖Qk‖² − 2ν̂‖k‖²`. -/
def VhatOf (e ν : ℝ) (f g : L2G n) : ℝ :=
  tOf n f g ^ 2 - epsHat e ν * ‖QhOf n f g‖ ^ 2 - ‖PkOf n f g‖ ^ 2
    + epsHat e ν * ‖QkOf n f g‖ ^ 2 - 2 * nuHat ν * ‖kOf n f g‖ ^ 2

/-- Without tail the hat value is the profile value. -/
lemma VhatOf_zero (e : ℝ) (f g : L2G n) : VhatOf n e 0 f g = VOf n e 0 f g := by
  rw [VOf_zero]; simp [VhatOf, epsHat, nuHat]

/-- A unimodular function has norm one in `L²(γ_n)`. -/
lemma norm_sq_of_mem_unimod {f : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n))) : ‖f‖ ^ 2 = 1 := by
  have hf' : ∀ᵐ x ∂(stdGaussian (n + n)), ‖f x‖ = 1 := hf
  have hre : (inner ℂ f f).re = ‖f‖ ^ 2 := by rw [inner_self_eq_norm_sq_to_K]; norm_cast
  have h2 : ∫ x, conj (f x) * f x ∂(stdGaussian (n + n)) = 1 := by
    rw [integral_congr_ae (g := fun _ => (1 : ℂ))]
    · simp
    · filter_upwards [hf'] with x hx
      rw [Complex.conj_mul', hx]; norm_num
  rw [← hre, inner_L2, h2, Complex.one_re]

/-- `‖h‖² + ‖k‖² = 1` for a unimodular pair (parallelogram law). -/
lemma normSq_hOf_add_normSq_kOf {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) : ‖hOf n f g‖ ^ 2 + ‖kOf n f g‖ ^ 2 = 1 := by
  have e1 := norm_sq_of_mem_unimod n hf
  have e2 := norm_sq_of_mem_unimod n hg
  have hp := parallelogram_law_with_norm ℂ f g
  have h2 : ‖(2 : ℂ)⁻¹‖ = 2⁻¹ := by simp
  rw [hOf, kOf, norm_smul, norm_smul, mul_pow, mul_pow, h2]
  linarith

/-- **The identity in hat units**: for a unimodular pair and `ν ≠ 1`,
`Re ⟪f, T g⟫ = (1−ν)[t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖Qk‖² + ν̂(1 − 2‖k‖²)] = (1−ν) V̂ + ν`. -/
theorem VOf_eq_hat (e : ℝ) {ν : ℝ} (hν : ν ≠ 1) {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n))) :
    VOf n e ν f g = (1 - ν) * VhatOf n e ν f g + ν := by
  have h1 : (1 : ℝ) - ν ≠ 0 := sub_ne_zero.2 (Ne.symm hν)
  have hk1 := normSq_hOf_add_normSq_kOf n hf hg
  rw [VOf_eq, VhatOf, epsHat, nuHat]
  field_simp
  linear_combination ν * hk1

/-- `Re ⟪f, g⟫ = ‖h‖² − ‖k‖²` (`f = h + k`, `g = h − k`). -/
lemma re_inner_eq_normSq_hOf_sub (f g : L2G n) :
    (inner ℂ f g).re = ‖hOf n f g‖ ^ 2 - ‖kOf n f g‖ ^ 2 := by
  have hh : (inner ℂ (hOf n f g) (hOf n f g)).re = ‖hOf n f g‖ ^ 2 := by
    rw [inner_self_eq_norm_sq_to_K]; norm_cast
  have hk : (inner ℂ (kOf n f g) (kOf n f g)).re = ‖kOf n f g‖ ^ 2 := by
    rw [inner_self_eq_norm_sq_to_K]; norm_cast
  have hs : (inner ℂ (kOf n f g) (hOf n f g)).re = (inner ℂ (hOf n f g) (kOf n f g)).re := by
    rw [← inner_conj_symm, Complex.conj_re]
  have e : inner ℂ f g = inner ℂ (hOf n f g + kOf n f g) (hOf n f g - kOf n f g) := by
    rw [hOf_add_kOf, hOf_sub_kOf]
  rw [e, inner_add_left, inner_sub_right, inner_sub_right, Complex.add_re, Complex.sub_re,
    Complex.sub_re, hh, hk, hs]
  ring

/-- **The tail in its global form**: for a unimodular pair `Re ⟪f, g⟫ − 1 = −2‖k‖²`. -/
lemma re_inner_sub_one {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) :
    (inner ℂ f g).re - 1 = -2 * ‖kOf n f g‖ ^ 2 := by
  linarith [re_inner_eq_normSq_hOf_sub n f g, normSq_hOf_add_normSq_kOf n hf hg]

/-! ### The first chaos is Gaussian: `‖P₁,₀ h‖ ≤ √π/2` for `|h| ≤ 1` -/

/-- `Σₗ cₗ zₗ` as a function. -/
def linC (c : Fin n → ℂ) (x : Fin (n + n) → ℝ) : ℂ := ∑ l, c l * zc n l x

/-- The real coefficient vector of `Re Σₗ cₗ zₗ`. -/
def aVec (c : Fin n → ℂ) : Fin (n + n) → ℝ := Fin.append (fun l => (c l).re) (fun l => -(c l).im)

/-- The real coefficient vector of `Im Σₗ cₗ zₗ`. -/
def bVec (c : Fin n → ℂ) : Fin (n + n) → ℝ := Fin.append (fun l => (c l).im) (fun l => (c l).re)

lemma linC_re (c : Fin n → ℂ) (x : Fin (n + n) → ℝ) :
    (linC n c x).re = ∑ i, aVec n c i * x i := by
  simp only [linC, Complex.re_sum, Complex.mul_re, zc, aVec, Fin.sum_univ_add, Fin.append_left,
    Fin.append_right, ← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl fun l _ => by ring

lemma linC_im (c : Fin n → ℂ) (x : Fin (n + n) → ℝ) :
    (linC n c x).im = ∑ i, bVec n c i * x i := by
  simp only [linC, Complex.im_sum, Complex.mul_im, zc, bVec, Fin.sum_univ_add, Fin.append_left,
    Fin.append_right, ← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl fun l _ => by ring

lemma norm_linC (c : Fin n → ℂ) (x : Fin (n + n) → ℝ) :
    ‖linC n c x‖ = √((∑ i, aVec n c i * x i) ^ 2 + (∑ i, bVec n c i * x i) ^ 2) := by
  rw [Complex.norm_def, Complex.normSq_apply, linC_re, linC_im]
  congr 1; ring

lemma sum_aVec_sq (c : Fin n → ℂ) : ∑ i, aVec n c i ^ 2 = ∑ l, ‖c l‖ ^ 2 := by
  simp only [aVec, Fin.sum_univ_add, Fin.append_left, Fin.append_right, neg_sq,
    ← Finset.sum_add_distrib, Complex.sq_norm, Complex.normSq_apply]
  exact Finset.sum_congr rfl fun l _ => by ring

lemma sum_bVec_sq (c : Fin n → ℂ) : ∑ i, bVec n c i ^ 2 = ∑ l, ‖c l‖ ^ 2 := by
  simp only [bVec, Fin.sum_univ_add, Fin.append_left, Fin.append_right,
    ← Finset.sum_add_distrib, Complex.sq_norm, Complex.normSq_apply]
  exact Finset.sum_congr rfl fun l _ => by ring

lemma sum_aVec_mul_bVec (c : Fin n → ℂ) : ∑ i, aVec n c i * bVec n c i = 0 := by
  simp only [aVec, bVec, Fin.sum_univ_add, Fin.append_left, Fin.append_right,
    ← Finset.sum_add_distrib]
  exact Finset.sum_eq_zero fun l _ => by ring

lemma coeFn_finset_sum {ι : Type*} (s : Finset ι) (f : ι → L2G n) :
    ⇑(∑ i ∈ s, f i) =ᵐ[stdGaussian (n + n)] fun x => ∑ i ∈ s, f i x := by
  classical
  induction s using Finset.induction_on with
  | empty =>
    simp only [Finset.sum_empty]
    filter_upwards [Lp.coeFn_zero ℂ 2 (stdGaussian (n + n))] with x hx
    simp
  | insert i s hi ih =>
    rw [Finset.sum_insert hi]
    filter_upwards [Lp.coeFn_add (f i) (∑ j ∈ s, f j), ih] with x h1 h2
    rw [h1, Pi.add_apply, h2, Finset.sum_insert hi]

lemma linL_ae (c : Fin n → ℂ) :
    ⇑(∑ l, c l • zL n l : L2G n) =ᵐ[stdGaussian (n + n)] linC n c := by
  have h1 := coeFn_finset_sum n Finset.univ (fun l => c l • zL n l)
  have h2 : ∀ᵐ x ∂(stdGaussian (n + n)), ∀ l, (c l • zL n l) x = c l * zc n l x :=
    ae_all_iff.2 fun l => by
      filter_upwards [Lp.coeFn_smul (c l) (zL n l), MemLp.coeFn_toLp (memLp_zc n l)] with x hx hz
      rw [hx, Pi.smul_apply, smul_eq_mul, zL, hz]
  filter_upwards [h1, h2] with x hx hx2
  exact hx.trans (Finset.sum_congr rfl fun l _ => hx2 l)

/-- **The first chaos is Gaussian**: `E|w| = (√π/2) ‖w‖` for `w = Σₗ cₗ zₗ`. -/
lemma integral_norm_linL (c : Fin n → ℂ) :
    ∫ x, ‖(∑ l, c l • zL n l : L2G n) x‖ ∂(stdGaussian (n + n))
      = (√Real.pi / 2) * ‖(∑ l, c l • zL n l : L2G n)‖ := by
  by_cases hc : ∀ l, c l = 0
  · have hw : (∑ l, c l • zL n l : L2G n) = 0 := by simp [hc]
    rw [hw, norm_zero, mul_zero]
    exact integral_eq_zero_of_ae (by
      filter_upwards [Lp.coeFn_zero ℂ 2 (stdGaussian (n + n))] with x hx; simp)
  push Not at hc
  obtain ⟨l₀, hl₀⟩ := hc
  have hsum : 0 ≤ ∑ l, ‖c l‖ ^ 2 := Finset.sum_nonneg fun _ _ => sq_nonneg _
  obtain ⟨s, hsdef⟩ : ∃ s, s = √(∑ l, ‖c l‖ ^ 2) := ⟨_, rfl⟩
  have hs : 0 < s := hsdef ▸ Real.sqrt_pos.2 (Finset.sum_pos' (fun _ _ => sq_nonneg _)
    ⟨l₀, Finset.mem_univ _, pow_pos (norm_pos_iff.2 hl₀) 2⟩)
  have hs2 : s ^ 2 = ∑ l, ‖c l‖ ^ 2 := hsdef ▸ Real.sq_sqrt hsum
  have hd : 2 ≤ n + n := by have := Fin.pos l₀; omega
  have hA := integral_two_linear hd (aVec n c) (bVec n c) s hs (by rw [sum_aVec_sq, hs2])
    (by rw [sum_bVec_sq, hs2]) (sum_aVec_mul_bVec n c) (fun p => √(p.1 ^ 2 + p.2 ^ 2)) (by fun_prop)
  have hB := integral_two_linear hd (aVec n c) (bVec n c) s hs (by rw [sum_aVec_sq, hs2])
    (by rw [sum_bVec_sq, hs2]) (sum_aVec_mul_bVec n c) (fun p => p.1 ^ 2 + p.2 ^ 2) (by fun_prop)
  obtain ⟨w, hw⟩ : ∃ w : L2G n, w = ∑ l, c l • zL n l := ⟨_, rfl⟩
  rw [← hw]
  dsimp only at hA hB
  have hae := hw ▸ linL_ae n c
  have e1 : ∫ x, ‖w x‖ ∂(stdGaussian (n + n)) = s * (√2 * √Real.pi / 2) := by
    have e0 : (fun x => ‖w x‖) =ᵐ[stdGaussian (n + n)]
        fun x => √((∑ i, aVec n c i * x i) ^ 2 + (∑ i, bVec n c i * x i) ^ 2) :=
      hae.mono fun x hx => by simp only; rw [hx, norm_linC]
    rw [integral_congr_ae e0, hA]
    simp_rw [mul_pow, ← mul_add, Real.sqrt_mul (sq_nonneg s), Real.sqrt_sq hs.le]
    rw [integral_const_mul, integral_norm_gauss2]
  have e2 : ‖w‖ ^ 2 = 2 * s ^ 2 := by
    have h := inner_self_eq_norm_sq_to_K (𝕜 := ℂ) w
    rw [inner_L2] at h
    have h2 : ∫ x, conj (w x) * w x ∂(stdGaussian (n + n))
        = ((∫ x, ‖w x‖ ^ 2 ∂(stdGaussian (n + n)) : ℝ) : ℂ) := by
      rw [← integral_complex_ofReal]; congr 1; ext x; rw [Complex.conj_mul']; push_cast; rfl
    rw [h2] at h
    have h3 : ∫ x, ‖w x‖ ^ 2 ∂(stdGaussian (n + n)) = 2 * s ^ 2 := by
      have e0 : (fun x => ‖w x‖ ^ 2) =ᵐ[stdGaussian (n + n)]
          fun x => (∑ i, aVec n c i * x i) ^ 2 + (∑ i, bVec n c i * x i) ^ 2 :=
        hae.mono fun x hx => by simp only; rw [hx, norm_linC, Real.sq_sqrt (by positivity)]
      rw [integral_congr_ae e0, hB]
      simp_rw [mul_pow, ← mul_add]
      rw [integral_const_mul, integral_add, integral_sq_fst_gauss2, integral_sq_snd_gauss2]
      · ring
      · exact Integrable.comp_fst (integrable_pow_gaussian 2) _
      · exact Integrable.comp_snd (integrable_pow_gaussian 2) _
    exact Complex.ofReal_injective (by rw [Complex.ofReal_pow, ← h3]; exact h.symm)
  have e3 : ‖w‖ = √2 * s := by
    rw [← Real.sqrt_sq (norm_nonneg w), e2, Real.sqrt_mul (by norm_num), Real.sqrt_sq hs.le]
  rw [e1, e3]; ring

/-- `‖Π h‖² = Re⟪h, Π h⟫ ≤ E|Π h|` for a projection of a function bounded by one. -/
private lemma norm_sq_starProjection_le_integral (K : Submodule ℂ (L2G n))
    [K.HasOrthogonalProjection] {h : L2G n} (hh : ∀ᵐ x ∂(stdGaussian (n + n)), ‖h x‖ ≤ 1) :
    ‖K.starProjection h‖ ^ 2 ≤ ∫ x, ‖K.starProjection h x‖ ∂(stdGaussian (n + n)) := by
  rw [← re_inner_starProjection K h]
  calc (inner ℂ h (K.starProjection h)).re ≤ ‖inner ℂ h (K.starProjection h)‖ :=
        Complex.re_le_norm _
    _ ≤ ∫ x, ‖conj (h x) * K.starProjection h x‖ ∂(stdGaussian (n + n)) := by
        rw [inner_L2]
        exact norm_integral_le_integral_norm _
    _ ≤ _ := integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
        ((Lp.memLp _).integrable one_le_two).norm (by
          filter_upwards [hh] with x hx
          rw [norm_mul, Complex.norm_conj]
          exact mul_le_of_le_one_left (norm_nonneg _) hx)

/-- **`‖P₁,₀ h‖ ≤ √π/2` for `|h| ≤ 1` a.e.** (the paper's `t ≤ E|z₁| = √π/2`): `‖Ph‖² = Re⟪h, Ph⟫
≤ E|Ph| = (√π/2)‖Ph‖` since `Ph` is a complex Gaussian. -/
theorem norm_starProjection_H10_le (h : L2G n) (hh : ∀ᵐ x ∂(stdGaussian (n + n)), ‖h x‖ ≤ 1) :
    ‖(H10 n).starProjection h‖ ≤ √Real.pi / 2 := by
  obtain ⟨w, hw⟩ : ∃ w : L2G n, w = (H10 n).starProjection h := ⟨_, rfl⟩
  obtain ⟨c, hc⟩ :=
    (Submodule.mem_span_range_iff_exists_fun ℂ).1 (hw ▸ (H10 n).starProjection_apply_mem h)
  have hw2 : ‖w‖ ^ 2 ≤ (√Real.pi / 2) * ‖w‖ := by
    have e := norm_sq_starProjection_le_integral n (H10 n) hh
    rw [← hw] at e
    exact e.trans_eq (by rw [← hc]; exact integral_norm_linL n c)
  rw [← hw]
  rcases (norm_nonneg w).eq_or_lt with h0 | h0
  · rw [← h0]; positivity
  · nlinarith

lemma norm_hOf_le {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) :
    ∀ᵐ x ∂(stdGaussian (n + n)), ‖hOf n f g x‖ ≤ 1 := by
  have hf' : ∀ᵐ x ∂(stdGaussian (n + n)), ‖f x‖ = 1 := hf
  have hg' : ∀ᵐ x ∂(stdGaussian (n + n)), ‖g x‖ = 1 := hg
  filter_upwards [Lp.coeFn_smul ((2 : ℂ)⁻¹) (f + g), Lp.coeFn_add f g, hf', hg'] with x h1 h2 h3 h4
  have h2n : ‖(2 : ℂ)⁻¹‖ = 2⁻¹ := by simp
  rw [hOf, h1, Pi.smul_apply, h2, Pi.add_apply, norm_smul, h2n]
  calc 2⁻¹ * ‖f x + g x‖ ≤ 2⁻¹ * (‖f x‖ + ‖g x‖) :=
        mul_le_mul_of_nonneg_left (norm_add_le _ _) (by norm_num)
    _ = 1 := by rw [h3, h4]; norm_num

/-- `t = ‖P₁,₀ h‖ ≤ √π/2` for a unimodular pair. -/
theorem tOf_le_sqrt_pi {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) : tOf n f g ≤ √Real.pi / 2 :=
  norm_starProjection_H10_le n _ (norm_hOf_le n hf hg)

/-- **`t ≤ 9/10`** for a unimodular pair (`√π/2 < 0.9` since `π < 3.24`). -/
theorem tOf_le {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) : tOf n f g ≤ 9 / 10 := by
  refine (tOf_le_sqrt_pi n hf hg).trans ?_
  have : √Real.pi ≤ 9 / 5 := by
    rw [Real.sqrt_le_left (by norm_num)]
    linarith [Real.pi_lt_d2]
  linarith

/-! ### `H₂,₁` consists of circular cubics: the first-moment bound -/

/-- Every element of `H₂,₁` is a combination of Wick cubics. -/
theorem exists_wick_repr {ψ : L2G n} (hψ : ψ ∈ H21 n) :
    ∃ c : Fin n × Fin n × Fin n → ℂ, ψ = ∑ p, c p • wickL n p.1 p.2.1 p.2.2 := by
  obtain ⟨h1, h2⟩ := Submodule.mem_inf.1 hψ
  rw [chargeOne3, Submodule.span_union, Submodule.mem_sup] at h1
  obtain ⟨y, hy, z, hz, rfl⟩ := h1
  obtain ⟨d, rfl⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hy
  obtain ⟨c, rfl⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hz
  refine ⟨c, ?_⟩
  have hmem : (∑ l, d l • zL n l + ∑ p, c p • wL n p.1 p.2.1 p.2.2)
      - ∑ p, c p • wickL n p.1 p.2.1 p.2.2 ∈ H10 n := by
    have e : (∑ l, d l • zL n l + ∑ p, c p • wL n p.1 p.2.1 p.2.2)
        - ∑ p, c p • wickL n p.1 p.2.1 p.2.2
        = ∑ l, d l • zL n l + ∑ p, c p • ((if p.1 = p.2.2 then (2 : ℂ) else 0) • zL n p.2.1
          + (if p.2.1 = p.2.2 then (2 : ℂ) else 0) • zL n p.1) := by
      rw [add_sub_assoc, ← Finset.sum_sub_distrib]
      congr 1
      refine Finset.sum_congr rfl fun p _ => ?_
      rw [← smul_sub, wickL]
      congr 1
      abel
    rw [e]
    exact Submodule.add_mem _
      (Submodule.sum_mem _ fun l _ => Submodule.smul_mem _ _ (zL_mem_H10 n l))
      (Submodule.sum_mem _ fun p _ => Submodule.smul_mem _ _ (Submodule.add_mem _
        (Submodule.smul_mem _ _ (zL_mem_H10 n _)) (Submodule.smul_mem _ _ (zL_mem_H10 n _))))
  have hperp : (∑ l, d l • zL n l + ∑ p, c p • wL n p.1 p.2.1 p.2.2)
      - ∑ p, c p • wickL n p.1 p.2.1 p.2.2 ∈ (H10 n)ᗮ :=
    Submodule.sub_mem _ h2 (Submodule.sum_mem _ fun p _ => Submodule.smul_mem _ _
      (Submodule.mem_inf.1 (wickL_mem_H21 n _ _ _)).2)
  have h0 := Submodule.mem_inf.2 ⟨hmem, hperp⟩
  rwa [Submodule.inf_orthogonal_eq_bot, Submodule.mem_bot, sub_eq_zero] at h0

/-- The real part of `Σ_p c_p W_p`. -/
def reP (c : Fin n × Fin n × Fin n → ℂ) : MvPolynomial (Fin (n + n)) ℝ :=
  ∑ p, (C (c p).re * reW n p.1 p.2.1 p.2.2 - C (c p).im * imW n p.1 p.2.1 p.2.2)

/-- The imaginary part of `Σ_p c_p W_p`. -/
def imP (c : Fin n × Fin n × Fin n → ℂ) : MvPolynomial (Fin (n + n)) ℝ :=
  ∑ p, (C (c p).re * imW n p.1 p.2.1 p.2.2 + C (c p).im * reW n p.1 p.2.1 p.2.2)

lemma chaos3_reP (c : Fin n × Fin n × Fin n → ℂ) : Chaos3 (reP n c) :=
  Chaos3.finset_sum _ fun _ _ =>
    ((chaos3_imW n _ _ _).const_mul _).sub ((chaos3_reW n _ _ _).const_mul _)

lemma circular_reP_imP (c : Fin n × Fin n × Fin n → ℂ) : Circular (Jstd n) (reP n c) (imP n c) where
  anti := Jstd_anti n
  sq_diag := Jstd_sq_diag n
  sq_off := Jstd_sq_off n
  da := by
    unfold reP imP
    rw [rotD_finset_sum, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [rotD_sub, rotD_C_mul, rotD_C_mul, rotD_reW, rotD_imW]; ring
  db := by
    unfold reP imP
    rw [rotD_finset_sum]
    refine Finset.sum_congr rfl fun p _ => ?_
    rw [rotD_add, rotD_C_mul, rotD_C_mul, rotD_reW, rotD_imW]; ring

lemma wickL_ae (a b c : Fin n) :
    ⇑(wickL n a b c) =ᵐ[stdGaussian (n + n)]
      fun x => (⟨eval x (reW n a b c), eval x (imW n a b c)⟩ : ℂ) := by
  have e1 := Lp.coeFn_sub (wL n a b c - (if a = c then (2 : ℂ) else 0) • zL n b)
    ((if b = c then (2 : ℂ) else 0) • zL n a)
  have e2 := Lp.coeFn_sub (wL n a b c) ((if a = c then (2 : ℂ) else 0) • zL n b)
  filter_upwards [e1, e2, Lp.coeFn_smul (if a = c then (2 : ℂ) else 0) (zL n b),
    Lp.coeFn_smul (if b = c then (2 : ℂ) else 0) (zL n a), MemLp.coeFn_toLp (memLp_wc n a b c),
    MemLp.coeFn_toLp (memLp_zc n b), MemLp.coeFn_toLp (memLp_zc n a)] with x h1 h2 h3 h4 h5 h6 h7
  rw [wickL, h1, Pi.sub_apply, h2, Pi.sub_apply, h3, h4, Pi.smul_apply, Pi.smul_apply, wL, h5, zL,
    zL, h6, h7, smul_eq_mul, smul_eq_mul]
  exact Complex.ext (by simp only [eval_reW]) (by simp only [eval_imW])

lemma repr_ae (c : Fin n × Fin n × Fin n → ℂ) :
    ⇑(∑ p, c p • wickL n p.1 p.2.1 p.2.2 : L2G n) =ᵐ[stdGaussian (n + n)]
      fun x => (⟨eval x (reP n c), eval x (imP n c)⟩ : ℂ) := by
  have h1 := coeFn_finset_sum n Finset.univ (fun p => c p • wickL n p.1 p.2.1 p.2.2)
  have h2 : ∀ᵐ x ∂(stdGaussian (n + n)), ∀ p : Fin n × Fin n × Fin n,
      (c p • wickL n p.1 p.2.1 p.2.2) x
        = c p * ⟨eval x (reW n p.1 p.2.1 p.2.2), eval x (imW n p.1 p.2.1 p.2.2)⟩ :=
    ae_all_iff.2 fun p => by
      filter_upwards [Lp.coeFn_smul (c p) (wickL n p.1 p.2.1 p.2.2), wickL_ae n p.1 p.2.1 p.2.2]
        with x hx hw
      rw [hx, Pi.smul_apply, smul_eq_mul, hw]
  filter_upwards [h1, h2] with x hx hx2
  rw [hx]
  simp only [hx2]
  apply Complex.ext <;>
    simp [reP, imP, Complex.re_sum, Complex.im_sum, Complex.mul_re, Complex.mul_im, map_sum,
      map_sub, map_add, map_mul, eval_C]

/-- A unit combination `Σ_p c_p W_p` of Wick cubics has `E (Re)² = 1/2`. -/
theorem integral_reP_sq_eq_half (c : Fin n × Fin n × Fin n → ℂ)
    (h1 : ‖(∑ p, c p • wickL n p.1 p.2.1 p.2.2 : L2G n)‖ = 1) :
    ∫ x, eval x (reP n c) ^ 2 ∂(stdGaussian (n + n)) = 1 / 2 := by
  obtain ⟨A, hA⟩ : ∃ A, A = reP n c := ⟨_, rfl⟩
  obtain ⟨B, hB⟩ : ∃ B, B = imP n c := ⟨_, rfl⟩
  obtain ⟨ψ, hψe⟩ : ∃ ψ : L2G n, ψ = ∑ p, c p • wickL n p.1 p.2.1 p.2.2 := ⟨_, rfl⟩
  rw [← hψe] at h1
  rw [← hA]
  have hae : ⇑ψ =ᵐ[stdGaussian (n + n)] fun x => (⟨eval x A, eval x B⟩ : ℂ) := by
    rw [hψe, hA, hB]; exact repr_ae n c
  have hc : Circular (Jstd n) A B := hA ▸ hB ▸ circular_reP_imP n c
  have hE := gaussE_isGaussianExpectation (n + n)
  have hnorm : ∫ x, (eval x A ^ 2 + eval x B ^ 2) ∂(stdGaussian (n + n)) = 1 := by
    have h := inner_self_eq_norm_sq_to_K (𝕜 := ℂ) ψ
    rw [inner_L2, h1] at h
    have h2 : ∫ x, conj (ψ x) * ψ x ∂(stdGaussian (n + n))
        = ((∫ x, (eval x A ^ 2 + eval x B ^ 2) ∂(stdGaussian (n + n)) : ℝ) : ℂ) := by
      rw [← integral_complex_ofReal]
      refine integral_congr_ae (hae.mono fun x hx => ?_)
      simp only at hx ⊢
      rw [hx, Complex.conj_mul', ← Complex.ofReal_pow, Complex.sq_norm, Complex.normSq_mk]
      push_cast; ring
    rw [h2] at h
    exact Complex.ofReal_injective (by rw [h]; norm_num)
  have hAB : ∫ x, eval x A ^ 2 ∂(stdGaussian (n + n))
      = ∫ x, eval x B ^ 2 ∂(stdGaussian (n + n)) := by
    simpa only [gaussE_apply, map_mul, sq] using hc.gE_sq_eq hE
  have hiA : Integrable (fun x => eval x A ^ 2) (stdGaussian (n + n)) :=
    (integrable_eval (A ^ 2)).congr (Filter.Eventually.of_forall fun x => by simp)
  have hiB : Integrable (fun x => eval x B ^ 2) (stdGaussian (n + n)) :=
    (integrable_eval (B ^ 2)).congr (Filter.Eventually.of_forall fun x => by simp)
  rw [integral_add hiA hiB] at hnorm
  linarith

/-- **The first-moment bound on `H₂,₁`**: `E|ψ| ≤ ρ` for every unit `ψ ∈ H₂,₁`. -/
theorem integral_norm_le_rho_of_mem_H21 {ψ : L2G n} (hψ : ψ ∈ H21 n)
    (h1 : ‖ψ‖ = 1) : ∫ x, ‖ψ x‖ ∂(stdGaussian (n + n)) ≤ ρ := by
  obtain ⟨c, rfl⟩ := exists_wick_repr n hψ
  have hM := gaussian_moments _ _ (chaos3_reP n c) (integral_reP_sq_eq_half n c h1)
    (circular_reP_imP n c)
  refine le_trans (le_of_eq ?_) hM.mh
  refine integral_congr_ae ((repr_ae n c).mono fun x hx => ?_)
  simp only at hx ⊢
  rw [hx, Complex.norm_def, Complex.normSq_mk, radU]
  simp only [map_add, map_mul]

lemma norm_kOf_le {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) :
    ∀ᵐ x ∂(stdGaussian (n + n)), ‖kOf n f g x‖ ≤ 1 := by
  have hf' : ∀ᵐ x ∂(stdGaussian (n + n)), ‖f x‖ = 1 := hf
  have hg' : ∀ᵐ x ∂(stdGaussian (n + n)), ‖g x‖ = 1 := hg
  filter_upwards [Lp.coeFn_smul ((2 : ℂ)⁻¹) (f - g), Lp.coeFn_sub f g, hf', hg'] with x h1 h2 h3 h4
  have h2n : ‖(2 : ℂ)⁻¹‖ = 2⁻¹ := by simp
  rw [kOf, h1, Pi.smul_apply, h2, Pi.sub_apply, norm_smul, h2n]
  calc 2⁻¹ * ‖f x - g x‖ ≤ 2⁻¹ * (‖f x‖ + ‖g x‖) :=
        mul_le_mul_of_nonneg_left (norm_sub_le _ _) (by norm_num)
    _ = 1 := by rw [h3, h4]; norm_num

/-- **Projection duality on `H₂,₁`**: the projection of a function bounded by one has norm at most
`ρ`, since `‖Πc‖² = Re⟪c, Πc⟫ ≤ E|Πc| ≤ ρ‖Πc‖` (`integral_norm_le_rho_of_mem_H21`). -/
theorem norm_starProjection_H21_le_rho {c : L2G n}
    (hc : ∀ᵐ x ∂(stdGaussian (n + n)), ‖c x‖ ≤ 1) : ‖(H21 n).starProjection c‖ ≤ ρ := by
  obtain ⟨w, hw⟩ : ∃ w : L2G n, w = (H21 n).starProjection c := ⟨_, rfl⟩
  have hmem : w ∈ H21 n := hw ▸ (H21 n).starProjection_apply_mem c
  rw [← hw]
  rcases (norm_nonneg w).eq_or_lt with h0 | h0
  · rw [← h0]; unfold ρ; norm_num
  have hu : ‖((‖w‖ : ℂ))⁻¹ • w‖ = 1 := by
    rw [norm_smul, norm_inv, Complex.norm_real, Real.norm_eq_abs, abs_norm, inv_mul_cancel₀ h0.ne']
  have h3 := integral_norm_le_rho_of_mem_H21 n (Submodule.smul_mem _ ((‖w‖ : ℂ)⁻¹) hmem) hu
  have h4 : ∫ x, ‖(((‖w‖ : ℂ))⁻¹ • w : L2G n) x‖ ∂(stdGaussian (n + n))
      = ‖w‖⁻¹ * ∫ x, ‖w x‖ ∂(stdGaussian (n + n)) := by
    rw [← integral_const_mul]
    refine integral_congr_ae ?_
    filter_upwards [Lp.coeFn_smul ((‖w‖ : ℂ)⁻¹) w] with x hx
    rw [hx, Pi.smul_apply, norm_smul, norm_inv, Complex.norm_real, Real.norm_eq_abs, abs_norm]
  rw [h4, inv_mul_le_iff₀ h0] at h3
  have hw2 : ‖w‖ ^ 2 ≤ ∫ x, ‖w x‖ ∂(stdGaussian (n + n)) :=
    hw ▸ norm_sq_starProjection_le_integral n (H21 n) hc
  nlinarith

/-- **The crude-row input** `‖P₂,₁ k‖ ≤ ρ` for a unimodular pair (L3), from the first-moment bound
on `H₂,₁`. -/
theorem normQk_le_rho {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) : ‖QkOf n f g‖ ≤ ρ :=
  norm_starProjection_H21_le_rho n (norm_kOf_le n hf hg)

/-- **Sharp first-moment bound on `H₂,₁`**: `E|ψ| ≤ 93/100` for every unit `ψ ∈ H₂,₁`
(from the antiholomorphic Stein calculus and kernel-verified 23-row certificate
`first_moment_le_93`). -/
theorem integral_norm_le_93_of_mem_H21 {ψ : L2G n} (hψ : ψ ∈ H21 n)
    (h1 : ‖ψ‖ = 1) : ∫ x, ‖ψ x‖ ∂(stdGaussian (n + n)) ≤ 93 / 100 := by
  obtain ⟨c, rfl⟩ := exists_wick_repr n hψ
  have h93 := first_moment_le_93 _ _ (chaos3_reP n c) (integral_reP_sq_eq_half n c h1)
    (circular_reP_imP n c)
  refine le_trans (le_of_eq ?_) h93
  refine integral_congr_ae ((repr_ae n c).mono fun x hx ↦ ?_)
  simp only at hx ⊢
  rw [hx, Complex.norm_def, Complex.normSq_mk, radU]
  simp only [map_add, map_mul]

/-- **Homogeneous sharp first-moment bound on `H₂,₁`**: `E|ψ| ≤ (93/100) ‖ψ‖` for every
`ψ ∈ H₂,₁`. -/
theorem integral_norm_le_93_mul_norm_of_mem_H21 {ψ : L2G n} (hψ : ψ ∈ H21 n) :
    ∫ x, ‖ψ x‖ ∂(stdGaussian (n + n)) ≤ (93 / 100) * ‖ψ‖ := by
  rcases (norm_nonneg ψ).eq_or_lt with h0 | h0
  · have hψ0 : ψ = 0 := norm_eq_zero.1 h0.symm
    rw [hψ0, norm_zero, mul_zero]
    refine le_of_eq (integral_eq_zero_of_ae ?_)
    filter_upwards [Lp.coeFn_zero ℂ 2 (stdGaussian (n + n))] with x hx
    rw [hx]; simp
  · have hu : ‖((‖ψ‖ : ℂ))⁻¹ • ψ‖ = 1 := by
      rw [norm_smul, norm_inv, Complex.norm_real, Real.norm_eq_abs, abs_norm,
        inv_mul_cancel₀ h0.ne']
    have h3 := integral_norm_le_93_of_mem_H21 n (Submodule.smul_mem _ ((‖ψ‖ : ℂ)⁻¹) hψ) hu
    have h4 : ∫ x, ‖(((‖ψ‖ : ℂ))⁻¹ • ψ : L2G n) x‖ ∂(stdGaussian (n + n))
        = ‖ψ‖⁻¹ * ∫ x, ‖ψ x‖ ∂(stdGaussian (n + n)) := by
      rw [← integral_const_mul]
      refine integral_congr_ae ?_
      filter_upwards [Lp.coeFn_smul ((‖ψ‖ : ℂ)⁻¹) ψ] with x hx
      rw [hx, Pi.smul_apply, norm_smul, norm_inv, Complex.norm_real, Real.norm_eq_abs, abs_norm]
    rw [h4, inv_mul_le_iff₀ h0] at h3
    linarith

/-- **Sharp projection duality on `H₂,₁`**: the projection of a function bounded by one has norm at
most `93/100`, since `‖Πc‖² = Re⟪c, Πc⟫ ≤ E|Πc| ≤ (93/100) ‖Πc‖`. -/
theorem norm_starProjection_H21_le_93 {c : L2G n}
    (hc : ∀ᵐ x ∂(stdGaussian (n + n)), ‖c x‖ ≤ 1) :
    ‖(H21 n).starProjection c‖ ≤ 93 / 100 := by
  obtain ⟨w, hw⟩ : ∃ w : L2G n, w = (H21 n).starProjection c := ⟨_, rfl⟩
  have hmem : w ∈ H21 n := hw ▸ (H21 n).starProjection_apply_mem c
  rw [← hw]
  rcases (norm_nonneg w).eq_or_lt with h0 | h0
  · rw [← h0]; norm_num
  · have h3 := integral_norm_le_93_mul_norm_of_mem_H21 n hmem
    have hw2 : ‖w‖ ^ 2 ≤ ∫ x, ‖w x‖ ∂(stdGaussian (n + n)) :=
      hw ▸ norm_sq_starProjection_le_integral n (H21 n) hc
    nlinarith

/-- **Sharp cubic projection bound** `‖P₂,₁ k‖ ≤ 93/100` for a unimodular pair. -/
theorem normQk_le_93 {f g : L2G n} (hf : f ∈ Unimod (stdGaussian (n + n)))
    (hg : g ∈ Unimod (stdGaussian (n + n))) : ‖QkOf n f g‖ ≤ 93 / 100 :=
  norm_starProjection_H21_le_93 n (norm_kOf_le n hf hg)

/-! ### The remaining hypotheses and the scalar cap -/

/-- **The remaining input of the scalar cap for one pair** (`V ≥ 0` after the phase): a coupling
vector `v` with `‖v‖² = 2` and the simultaneous Gaussian reduction of the rows
`SharedReduction rowData V̂ t Qh v` (L4) for the hat value `V̂ = VhatOf n e ν f g` of the witness
with weight `e` and tail `ν`.  The rows bound the hat value of a witness whose hat weight is their
constant, `epsHat e ν = ε`; for the certified witness `(e, ν) = (ε, 0)` the hat value is the profile
value `VOf n ε 0 f g` (`VhatOf_zero`).  (`t ≤ 9/10` is proved, `tOf_le`; the crude-row input
`‖Qk‖ ≤ ρ` is proved, `normQk_le_rho`.) -/
def ReductionHyp (e ν : ℝ) (f g : L2G n) : Prop :=
  ∃ v : L2G n, ‖v‖ ^ 2 = 2 ∧
    SharedReduction rowData (VhatOf n e ν f g) (tOf n f g) (QhOf n f g) v

lemma exists_phase (w : ℂ) : ∃ θ : ℂ, ‖θ‖ = 1 ∧ θ * w = ‖w‖ := by
  by_cases hw : w = 0
  · exact ⟨1, by simp, by simp [hw]⟩
  · have hw' : (‖w‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 hw
    refine ⟨conj w / ‖w‖, ?_, ?_⟩
    · rw [norm_div, Complex.norm_conj, Complex.norm_real, Real.norm_eq_abs, abs_norm,
        div_self (norm_ne_zero_iff.2 hw)]
    · rw [div_mul_eq_mul_div, Complex.conj_mul', sq, mul_div_assoc, div_self hw', mul_one]

lemma smul_mem_unimod {μ : Measure (Fin (n + n) → ℝ)} {θ : ℂ} (hθ : ‖θ‖ = 1) {g : Lp ℂ 2 μ}
    (hg : g ∈ Unimod μ) : θ • g ∈ Unimod μ := by
  have hg' : ∀ᵐ x ∂μ, ‖g x‖ = 1 := hg
  show ∀ᵐ x ∂μ, ‖(θ • g) x‖ = 1
  filter_upwards [Lp.coeFn_smul θ g, hg'] with x h1 h2
  rw [h1, Pi.smul_apply, norm_smul, hθ, h2, one_mul]

/-- **The endpoint in hat units** (with the phase reduction): for a tail `ν < 1`, a cap `c` of the
hat value `V̂` over the unimodular pairs with `V ≥ 0` gives the scalar cap `B = (1−ν)c + ν` of the
witness.  At `ν = 0` this is `B = c` for `V̂ = V`. -/
theorem witnessCap_of_VhatOf_le {e ν c : ℝ} (hν : ν < 1)
    (h : ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) → g ∈ Unimod (stdGaussian (n + n)) →
      0 ≤ VOf n e ν f g → VhatOf n e ν f g ≤ c) :
    WitnessCap n e ν ((1 - ν) * c + ν) := by
  intro f hf g hg
  obtain ⟨θ, hθ, hθw⟩ := exists_phase (inner ℂ f (witness n e ν g))
  have hval : VOf n e ν f (θ • g) = ‖inner ℂ f (witness n e ν g)‖ := by
    rw [VOf, map_smul, inner_smul_right, hθw, Complex.ofReal_re]
  have hg' := smul_mem_unimod n hθ hg
  have hc := h f (θ • g) hf hg' (hval ▸ norm_nonneg _)
  rw [← hval, VOf_eq_hat n e hν.ne hf hg']
  linarith [mul_le_mul_of_nonneg_left hc (sub_nonneg.2 hν.le)]

end

end Grothe.LowerAnalytic
