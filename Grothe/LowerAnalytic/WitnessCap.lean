import Grothe.LowerAnalytic.Witness
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
`RowOf crudeRow V t Qh v` and `SharedReduction rowData V t Qh v`.  The crude row follows from the
identity and `‖Qk‖ ≤ ρ` (the first-moment bound of the normalised cubic `Qk/‖Qk‖`, item L3).  Hence
the remaining hypotheses of the scalar cap, per admissible pair with `V ≥ 0`, are exactly
(`ReductionHyp`):

* `t ≤ 9/10` (on paper `t = ‖Ph‖ ≤ E|z₁|/‖z₁‖₂ = √π/2 < 0.9` since `|h| ≤ 1`);
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

/-! ### The remaining hypotheses and the scalar cap -/

/-- **The remaining inputs of the scalar cap for one pair** (`V ≥ 0` after the phase): the bound
`t ≤ 9/10`, the first-moment bound `‖Qk‖ ≤ ρ` of the cubic residual (crude row, L3), and a
coupling vector `v` with `‖v‖² = 2` and the simultaneous Gaussian reduction of the rows
`SharedReduction rowData V t Qh v` (L4). -/
def ReductionHyp (f g : L2G n) : Prop :=
  tOf n f g ≤ 9 / 10 ∧ ‖QkOf n f g‖ ≤ ρ ∧
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
  obtain ⟨ht1, hk, v, hv, hshared⟩ := hred f (θ • g) hf (smul_mem_unimod n hθ hg) hV
  rw [← hval]
  exact lower_bound_data _ _ _ v hv (norm_nonneg _) ht1 (rowOf_crude n f (θ • g) hk v) hshared

/-- **The lower bound from the reduction hypotheses**: `Llow < K` for every Grothendieck bound `K`
if `ReductionHyp` holds for the unimodular pairs with `V ≥ 0` in every dimension `n ≥ N`. -/
theorem lower_bound_of_reduction {K : ℝ} (N : ℕ)
    (hred : ∀ n, N ≤ n → ∀ f g : L2G n, f ∈ Unimod (stdGaussian (n + n)) →
      g ∈ Unimod (stdGaussian (n + n)) → 0 ≤ VOf n f g → ReductionHyp n f g)
    (hK : IsGrothendieckBound K) : (Llow : ℝ) < K :=
  lower_bound_of_witnessCap N (fun n hn => witnessCap_of_reduction n (hred n hn)) hK

end

end Grothe.LowerAnalytic
