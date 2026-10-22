import Grothe.LowerAnalytic.Witness
import Grothe.LowerAnalytic.GaussianRadial
import Grothe.Lower.RowCheck

/-!
# The scalar cap of the witness: the exact interface to the certificate (L5, cap half)

For unimodular `f, g ∈ L²(γ_n)` write `h = (f+g)/2`, `k = (f−g)/2` (so `|h|² + |k|² = 1` a.e.),
`P = P₁,₀`, `Q = P₂,₁`.  Since `T = P − εQ` is self-adjoint, the **polarisation identity**
(`VOf_eq`, the identity (eq:identity) of the paper) holds for every pair:

  `Re ⟪f, T g⟫ = ⟪h, T h⟫ − ⟪k, T k⟫ = t² − ε‖Qh‖² − ‖Pk‖² + ε‖Qk‖²`,   `t = ‖Ph‖`.

After a phase (`g ↦ θg`, `|θ| = 1`) the pairing is real and nonnegative, so the scalar cap
`‖⟪f, T g⟫‖ ≤ Bcap` is the bound `V ≤ Bcap` for the **scalar profile value** `V = Re ⟪f, T g⟫`.
The certificate (`lower_bound_data`) gives `V ≤ Bcap` from `‖v‖² = 2`, `0 ≤ t ≤ 9/10`, the crude row
`RowOf crudeRow V t Qh v` and `SharedReduction rowData V t Qh v`.  The bound `t ≤ 9/10` is proved
(`tOf_le`): `t = ‖Ph‖` with `|h| ≤ 1`, `‖Ph‖² = Re⟪h, Ph⟫ ≤ E|Ph|`, and `Ph = Σₗ cₗ zₗ` is a complex
Gaussian, so `E|Ph| = (√π/2)‖Ph‖` (`integral_norm_linL`, by the rotation invariance
`integral_two_linear` and the planar radius `integral_norm_gauss2` of `GaussianRadial.lean`); hence
`t ≤ √π/2 < 0.9`.  The crude row follows from the identity and `‖Qk‖ ≤ ρ` (the first-moment bound of
the normalised cubic `Qk/‖Qk‖`, item L3).  Hence the remaining hypotheses of the scalar cap, per
admissible pair with `V ≥ 0`, are exactly (`ReductionHyp`):

* `‖Qk‖ ≤ ρ` (L3: `‖Qk‖ ≤ E|Qk/‖Qk‖| ≤ ρ`, the first-moment bound of a circular cubic);
* a coupling vector `v` with `‖v‖² = 2` (on paper `v = z₁(|z₁|² − 2)` in the frame with `Ph = t z₁`)
  and `SharedReduction rowData V t Qh v` (L4: the Gaussian reduction of the rows with the shared
  residual, gate variable and potentials).

Here `L²(γ_n)` is the real inner product space `E` of `lower_bound_data` through Mathlib's
`InnerProductSpace ℝ (Lp ℂ 2 μ)` (real part of the complex inner product, same norm).

* `witnessCap_of_reduction : (∀ f g unimodular, 0 ≤ VOf f g → ReductionHyp n f g) → WitnessCap n Bcap`;
* `lower_bound_of_reduction`: the same hypotheses for all `n ≥ N` give `Llow < K` for every
  Grothendieck bound `K` (through `transferInputs_of_witnessCap` and `lower_bound_of_transferL2`).
-/

namespace Grothe.LowerAnalytic

open MeasureTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

variable (n : ℕ)

/-! ### Self-adjointness and the polarisation identity -/

lemma inner_witnessOf_symm (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection] (x y : L2G n) :
    inner ℂ (witnessOf n K x) y = inner ℂ x (witnessOf n K y) := by
  simp only [witnessOf, FunLike.coe_sub, Pi.sub_apply, FunLike.coe_smul, Pi.smul_apply,
    inner_sub_left, inner_sub_right, inner_smul_left, inner_smul_right,
    Submodule.inner_starProjection_left_eq_right, Complex.conj_ofReal]

/-- Polarisation: `Re ⟪h + k, T (h − k)⟫ = Re ⟪h, T h⟫ − Re ⟪k, T k⟫` for the self-adjoint `T`. -/
lemma re_inner_witnessOf_polar (K : Submodule ℂ (L2G n)) [K.HasOrthogonalProjection]
    (h k : L2G n) :
    (inner ℂ (h + k) (witnessOf n K (h - k))).re
      = (inner ℂ h (witnessOf n K h)).re - (inner ℂ k (witnessOf n K k)).re := by
  rw [map_sub, inner_add_left, inner_sub_right, inner_sub_right]
  have e : inner ℂ k (witnessOf n K h) = conj (inner ℂ h (witnessOf n K k)) := by
    rw [← inner_conj_symm, inner_witnessOf_symm]
  rw [e]
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

/-- The scalar profile value `V = Re ⟪f, T g⟫`. -/
def VOf (f g : L2G n) : ℝ := (inner ℂ f (witness n g)).re

lemma hOf_add_kOf (f g : L2G n) : hOf n f g + kOf n f g = f := by
  unfold hOf kOf; rw [← smul_add, add_add_sub_cancel, ← two_smul ℂ f, smul_smul,
    inv_mul_cancel₀ two_ne_zero, one_smul]

lemma hOf_sub_kOf (f g : L2G n) : hOf n f g - kOf n f g = g := by
  unfold hOf kOf; rw [← smul_sub, add_sub_sub_cancel, ← two_smul ℂ g, smul_smul,
    inv_mul_cancel₀ two_ne_zero, one_smul]

/-- **The exact identity** `Re ⟪f, T g⟫ = t² − ε‖Qh‖² − ‖Pk‖² + ε‖Qk‖²` (eq:identity). -/
theorem VOf_eq (f g : L2G n) :
    VOf n f g = tOf n f g ^ 2 - ε * ‖QhOf n f g‖ ^ 2 - ‖PkOf n f g‖ ^ 2 + ε * ‖QkOf n f g‖ ^ 2 := by
  have h := re_inner_witnessOf_polar n (H21 n) (hOf n f g) (kOf n f g)
  rw [hOf_add_kOf, hOf_sub_kOf, re_inner_witnessOf, re_inner_witnessOf] at h
  unfold VOf witness tOf QhOf PkOf QkOf
  rw [h]; ring

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
  rw [hx]; exact Finset.sum_congr rfl fun l _ => hx2 l

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
    have h4 : ((‖w‖ ^ 2 : ℝ) : ℂ) = ((2 * s ^ 2 : ℝ) : ℂ) := by
      rw [Complex.ofReal_pow, ← h3]; exact h.symm
    exact Complex.ofReal_injective h4
  have e3 : ‖w‖ = √2 * s := by
    rw [← Real.sqrt_sq (norm_nonneg w), e2, Real.sqrt_mul (by norm_num), Real.sqrt_sq hs.le]
  rw [e1, e3]; ring

/-- **`‖P₁,₀ h‖ ≤ √π/2` for `|h| ≤ 1` a.e.** (the paper's `t ≤ E|z₁| = √π/2`): `‖Ph‖² = Re⟪h, Ph⟫
≤ E|Ph| = (√π/2)‖Ph‖` since `Ph` is a complex Gaussian. -/
theorem norm_starProjection_H10_le (h : L2G n) (hh : ∀ᵐ x ∂(stdGaussian (n + n)), ‖h x‖ ≤ 1) :
    ‖(H10 n).starProjection h‖ ≤ √Real.pi / 2 := by
  obtain ⟨w, hw⟩ : ∃ w : L2G n, w = (H10 n).starProjection h := ⟨_, rfl⟩
  have hmem : w ∈ H10 n := by rw [hw, Submodule.starProjection_apply]; exact Submodule.coe_mem _
  obtain ⟨c, hc⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hmem
  have hw2 : ‖w‖ ^ 2 ≤ (√Real.pi / 2) * ‖w‖ := by
    have e := re_inner_starProjection (H10 n) h
    rw [← hw] at e
    rw [← e]
    calc (inner ℂ h w).re ≤ ‖inner ℂ h w‖ := Complex.re_le_norm _
      _ ≤ ∫ x, ‖conj (h x) * w x‖ ∂(stdGaussian (n + n)) := by
          rw [inner_L2]; exact norm_integral_le_integral_norm _
      _ ≤ ∫ x, ‖w x‖ ∂(stdGaussian (n + n)) :=
          integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
            ((Lp.memLp w).integrable one_le_two).norm (by
              filter_upwards [hh] with x hx
              rw [norm_mul, Complex.norm_conj]
              exact mul_le_of_le_one_left (norm_nonneg _) hx)
      _ = (√Real.pi / 2) * ‖w‖ := by rw [← hc]; exact integral_norm_linL n c
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

/-! ### The remaining hypotheses and the scalar cap -/

/-- **The remaining inputs of the scalar cap for one pair** (`V ≥ 0` after the phase): the
first-moment bound `‖Qk‖ ≤ ρ` of the cubic residual (crude row, L3), and a coupling vector `v` with
`‖v‖² = 2` and the simultaneous Gaussian reduction of the rows `SharedReduction rowData V t Qh v`
(L4).  (`t ≤ 9/10` is proved: `tOf_le`.) -/
def ReductionHyp (f g : L2G n) : Prop :=
  ‖QkOf n f g‖ ≤ ρ ∧
    ∃ v : L2G n, ‖v‖ ^ 2 = 2 ∧ SharedReduction rowData (VOf n f g) (tOf n f g) (QhOf n f g) v

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

/-- The crude row from the identity and `‖Qk‖ ≤ ρ`. -/
lemma rowOf_crude (f g : L2G n) (hk : ‖QkOf n f g‖ ≤ ρ) (v : L2G n) :
    RowOf crudeRow (VOf n f g) (tOf n f g) (QhOf n f g) v := by
  unfold RowOf RowHolds crudeRow
  simp only [Rat.cast_zero, Rat.cast_mul, Rat.cast_pow, mul_zero, zero_mul, add_zero, zero_div,
    zero_smul, sub_zero]
  have hε : (0 : ℝ) ≤ ε := by unfold ε; norm_num
  have hρ : (0 : ℝ) ≤ ρ := by unfold ρ; norm_num
  have h2 := pow_le_pow_left₀ (norm_nonneg _) hk 2
  rw [VOf_eq]
  nlinarith [sq_nonneg ‖PkOf n f g‖]

/-- **The scalar cap from the reduction hypotheses**: `WitnessCap n Bcap`, i.e.
`‖⟪f, T g⟫‖ ≤ Bcap` for a.e. unimodular `f, g`, from `ReductionHyp` on the pairs with `V ≥ 0`
(the phase-rotated pairs). -/
theorem witnessCap_of_reduction
    (hred : ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) → g ∈ Unimod (stdGaussian (n + n)) →
      0 ≤ VOf n f g → ReductionHyp n f g) :
    WitnessCap n Bcap := by
  intro f hf g hg
  obtain ⟨θ, hθ, hθw⟩ := exists_phase (inner ℂ f (witness n g))
  have hval : VOf n f (θ • g) = ‖inner ℂ f (witness n g)‖ := by
    rw [VOf, map_smul, inner_smul_right, hθw, Complex.ofReal_re]
  have hV : 0 ≤ VOf n f (θ • g) := hval ▸ norm_nonneg _
  have hg' := smul_mem_unimod n hθ hg
  obtain ⟨hk, v, hv, hshared⟩ := hred f (θ • g) hf hg' hV
  rw [← hval]
  exact lower_bound_data _ _ _ v hv (norm_nonneg _) (tOf_le n hf hg') (rowOf_crude n f (θ • g) hk v)
    hshared

/-- **The lower bound from the reduction hypotheses**: `Llow < K` for every Grothendieck bound `K`
if `ReductionHyp` holds for the unimodular pairs with `V ≥ 0` in every dimension `n ≥ N`. -/
theorem lower_bound_of_reduction {K : ℝ} (N : ℕ)
    (hred : ∀ n, N ≤ n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 0 ≤ VOf n f g → ReductionHyp n f g)
    (hK : IsGrothendieckBound K) : (Llow : ℝ) < K :=
  lower_bound_of_witnessCap N (fun n hn => witnessCap_of_reduction n (hred n hn)) hK

end

end Grothe.LowerAnalytic
