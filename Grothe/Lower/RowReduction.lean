import Grothe.LowerAnalytic.WitnessCap
import Grothe.Lower.RowDataTypes
import Grothe.LowerAnalytic.WickCubic

/-!
# The per-row Gaussian reduction: frame, h-side identity, gate algebra, assembly (L4)

The scalar cap of the witness rests on `SharedReduction rowData V t Qh v` for every unimodular pair
(`ReductionHyp`, `WitnessCap.lean`).  This file proves the parts of the paper's row reduction
(`handoff/research-third-decimal/PLAN_L4.md`) that need no new Gaussian infrastructure.

* **Frame.** `exists_frame_vector`: a unit `ζ ∈ H₁,₀` with `P₁,₀h = t ζ`.
* **The h-side identity** (`hside_identity`, `VOf_frame`): for `ζ ∈ H₁,₀` unit with `Ph = tζ`, a
  coupling vector `v ∈ H₂,₁` with `‖v‖² = 2`, and real `ℓ, β`, with `L = ℓζ + βv`,

  `t² − ε‖Qh‖² = t² − 2ℓt + 2β²/ε + 2 Re⟪L, h⟫ − ε‖Qh + (β/ε)v‖²`  (an exact identity),

  so `V = t² − 2ℓt + 2β²/ε + 2 Re⟪L, h⟫ + (ε‖Qk‖² − ‖Pk‖²) − ε‖Qh + (β/ε)v‖²`.  The real inner
  product of `L²(γ_n)` is the real part of the complex one (`real_inner_L2G`).
* **Gate algebra.** `Sym3.form`/`Sym2.form` are the Hermitian forms `y*My` of the rational gate
  matrices; `psdOK` is an exact LDLᵀ positivity check with soundness `form_nonneg_of_psdOK`; the
  shell inequalities `shell0_le` (`E ⪰ diag(−1, ε, ε)`), `shellR_le`, `shellR_le'` (`R ⪰ diag(−1, ε)`,
  `R ⪰ diag(ε, 0)`); the identity `gateForm_eq_Eform` between the retained gate form of a row,
  `X*NX + 2Re(conj X₁ (g·X))` with `N = E − diag(ε − δ, 0, 0)`, `g = δb`, and the paper's
  `X*EX − (ε − δ)|X₁|² + 2δ Re(conj X₁ (b·X))`.  The three `E`-gates of all 19 rows are checked
  exactly (`rowData_gatesOK`, kernel `decide`).
* **The coupling vector** `vL n l = z_l(|z_l|² − 4)/(2√2)`, i.e. `ζ(|ζ|² − 2)` for the unit
  coordinate `ζ = z_l/√2`: `vL_mem_H21` and `norm_vL_sq : ‖vL n l‖² = 2`, from the Gaussian
  moments `E|z|⁴ = 8`, `E|z|⁶ = 48` (`inner_zL_zL_ite`, `inner_wL_zL`, `gE_X_pow_six`, …).
* **Assembly** (`rowSharedWith_of_bracket`): the row inequality `RowSharedWith` from the a.e. fibre
  bound `Bk ≤ Ψ(δ|p|)` of the pre-potential bracket and the integrated k-side bound, with the law
  `U = |p|²/τ²` of the residual `p` at scale `τ = ‖p‖₂ > 0`.

What remains for L4 is listed in `PLAN_L4.md`: the unitary frame, the product split of the Gaussian
measure, the mixed chaos decomposition with the Parseval identities for `‖Pk‖²`, `‖Qk‖²`, the fibre
potential `Ψ_r` and its properties, the bridge from `p/τ` to a circular cubic, and the node caps.
-/

open MeasureTheory
open scoped ComplexConjugate

/-! ### Gate algebra -/

namespace Grothe.Lower

/-- The Hermitian form `y* M y` of a real symmetric `3×3` matrix on `ℂ³`. -/
def Sym3.form (M : Sym3) (y1 y2 y3 : ℂ) : ℝ :=
  M.m11 * hre y1 y1 + 2 * M.m12 * hre y1 y2 + 2 * M.m13 * hre y1 y3 + M.m22 * hre y2 y2
    + 2 * M.m23 * hre y2 y3 + M.m33 * hre y3 y3

lemma hre_self (y : ℂ) : hre y y = ‖y‖ ^ 2 := by
  rw [hre_eq, Complex.sq_norm, Complex.normSq_apply]

/-- The gate form is `X*NX` plus the coupling term. -/
lemma gateForm_eq_form_add (N : Sym3) (g1 g2 g3 : ℚ) (X1 X2 X3 : ℂ) :
    gateForm N g1 g2 g3 X1 X2 X3
      = N.form X1 X2 X3 + 2 * (g1 * hre X1 X1 + g2 * hre X1 X2 + g3 * hre X1 X3) := rfl

/-- **The retained gate form in the paper's variables**: with `N = E − diag(ε − δ, 0, 0)` and
`g = δb`, `X*NX + 2Re(conj X₁ (g·X)) = X*EX − (ε − δ)|X₁|² + 2δ Re(conj X₁ (b·X))` (step 6 of
`AUDIT_DELTA.md`). -/
lemma gateForm_eq_Eform (E : Sym3) (δ b1 b2 b3 : ℚ) (X1 X2 X3 : ℂ) :
    gateForm (E.subDiag (ε - δ) 0 0) (δ * b1) (δ * b2) (δ * b3) X1 X2 X3
      = E.form X1 X2 X3 - (ε - δ) * ‖X1‖ ^ 2
        + 2 * δ * (conj X1 * ((b1 : ℂ) * X1 + (b2 : ℂ) * X2 + (b3 : ℂ) * X3)).re := by
  simp only [gateForm, Sym3.form, Sym3.subDiag, hre_eq, Complex.sq_norm, Complex.normSq_apply,
    Complex.mul_re, Complex.mul_im, Complex.add_re, Complex.add_im, Complex.conj_re,
    Complex.conj_im, Complex.ratCast_re, Complex.ratCast_im]
  push_cast
  ring

/-- The gate expression of a row in the paper's variables. -/
lemma Row.gate_eq (r : Row) (X1 X2 X3 : ℂ) :
    r.gate X1 X2 X3 = r.E.form X1 X2 X3 - (ε - r.delta) * ‖X1‖ ^ 2
      + 2 * r.delta * (conj X1 * ((r.b1 : ℂ) * X1 + (r.b2 : ℂ) * X2 + (r.b3 : ℂ) * X3)).re :=
  gateForm_eq_Eform r.E r.delta r.b1 r.b2 r.b3 X1 X2 X3

/-- The real quadratic form of a checked matrix is nonnegative. -/
lemma Sym3.realForm_nonneg (M : Sym3) (h : M.psdOK = true) (x1 x2 x3 : ℝ) :
    0 ≤ M.m11 * x1 ^ 2 + 2 * M.m12 * x1 * x2 + 2 * M.m13 * x1 * x3 + M.m22 * x2 ^ 2
      + 2 * M.m23 * x2 * x3 + M.m33 * x3 ^ 2 := by
  simp only [Sym3.psdOK, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨h1, h2⟩, h3⟩ := h
  have h1R : (0 : ℝ) < M.m11 := by exact_mod_cast h1
  have h2R : (0 : ℝ) < M.m22 * M.m11 - M.m12 ^ 2 := by exact_mod_cast h2
  have h3R : (0 : ℝ) ≤ (M.m22 * M.m11 - M.m12 ^ 2) * (M.m33 * M.m11 - M.m13 ^ 2)
      - (M.m23 * M.m11 - M.m12 * M.m13) ^ 2 := by exact_mod_cast h3
  obtain ⟨s11, hs11⟩ : ∃ s : ℝ, s = M.m22 * M.m11 - M.m12 ^ 2 := ⟨_, rfl⟩
  obtain ⟨s12, hs12⟩ : ∃ s : ℝ, s = M.m23 * M.m11 - M.m12 * M.m13 := ⟨_, rfl⟩
  obtain ⟨s22, hs22⟩ : ∃ s : ℝ, s = M.m33 * M.m11 - M.m13 ^ 2 := ⟨_, rfl⟩
  rw [← hs11] at h2R
  rw [← hs11, ← hs12, ← hs22] at h3R
  have key : (M.m11 : ℝ) * s11 * (M.m11 * x1 ^ 2 + 2 * M.m12 * x1 * x2 + 2 * M.m13 * x1 * x3
        + M.m22 * x2 ^ 2 + 2 * M.m23 * x2 * x3 + M.m33 * x3 ^ 2)
      = s11 * (M.m11 * x1 + M.m12 * x2 + M.m13 * x3) ^ 2 + (s11 * x2 + s12 * x3) ^ 2
        + (s11 * s22 - s12 ^ 2) * x3 ^ 2 := by
    rw [hs11, hs12, hs22]; ring
  have hpos : (0 : ℝ) < M.m11 * s11 := mul_pos h1R h2R
  have h0 : 0 ≤ (M.m11 : ℝ) * s11 * (M.m11 * x1 ^ 2 + 2 * M.m12 * x1 * x2 + 2 * M.m13 * x1 * x3
      + M.m22 * x2 ^ 2 + 2 * M.m23 * x2 * x3 + M.m33 * x3 ^ 2) := by
    rw [key]
    have := mul_nonneg h3R (sq_nonneg x3)
    positivity
  exact (mul_nonneg_iff_of_pos_left hpos).1 h0

/-- **Soundness of the `3×3` check**: the Hermitian form is nonnegative on `ℂ³`. -/
theorem Sym3.form_nonneg_of_psdOK (M : Sym3) (h : M.psdOK = true) (y1 y2 y3 : ℂ) :
    0 ≤ M.form y1 y2 y3 := by
  have hr := M.realForm_nonneg h y1.re y2.re y3.re
  have hi := M.realForm_nonneg h y1.im y2.im y3.im
  simp only [Sym3.form, hre_eq]
  nlinarith [hr, hi]

/-- The Hermitian form `y* M y` of a real symmetric `2×2` matrix on `ℂ²`. -/
def Sym2.form (M : Sym2) (y1 y2 : ℂ) : ℝ :=
  M.m11 * hre y1 y1 + 2 * M.m12 * hre y1 y2 + M.m22 * hre y2 y2

lemma Sym2.realForm_nonneg (M : Sym2) (h : M.psdOK = true) (x1 x2 : ℝ) :
    0 ≤ M.m11 * x1 ^ 2 + 2 * M.m12 * x1 * x2 + M.m22 * x2 ^ 2 := by
  simp only [Sym2.psdOK, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨h1, h2⟩ := h
  have h1R : (0 : ℝ) < M.m11 := by exact_mod_cast h1
  have h2R : (0 : ℝ) ≤ M.m11 * M.m22 - M.m12 ^ 2 := by exact_mod_cast h2
  have key : (M.m11 : ℝ) * (M.m11 * x1 ^ 2 + 2 * M.m12 * x1 * x2 + M.m22 * x2 ^ 2)
      = (M.m11 * x1 + M.m12 * x2) ^ 2 + (M.m11 * M.m22 - M.m12 ^ 2) * x2 ^ 2 := by ring
  have h0 : 0 ≤ (M.m11 : ℝ) * (M.m11 * x1 ^ 2 + 2 * M.m12 * x1 * x2 + M.m22 * x2 ^ 2) := by
    rw [key]
    have := mul_nonneg h2R (sq_nonneg x2)
    positivity
  exact (mul_nonneg_iff_of_pos_left h1R).1 h0

/-- **Soundness of the `2×2` check.** -/
theorem Sym2.form_nonneg_of_psdOK (M : Sym2) (h : M.psdOK = true) (y1 y2 : ℂ) :
    0 ≤ M.form y1 y2 := by
  have hr := M.realForm_nonneg h y1.re y2.re
  have hi := M.realForm_nonneg h y1.im y2.im
  simp only [Sym2.form, hre_eq]
  nlinarith [hr, hi]

/-- **Shell 0 of the `E`-gate**: `E ⪰ diag(−1, ε, ε)` gives
`−|y₁|² + ε|y₂|² + ε|y₃|² ≤ y*Ey`. -/
theorem shell0_le (E : Sym3) (h : (E.subDiag (-1) ε ε).psdOK = true) (y1 y2 y3 : ℂ) :
    -‖y1‖ ^ 2 + ε * ‖y2‖ ^ 2 + ε * ‖y3‖ ^ 2 ≤ E.form y1 y2 y3 := by
  have h0 := Sym3.form_nonneg_of_psdOK _ h y1 y2 y3
  simp only [Sym3.form, Sym3.subDiag, hre_self] at h0 ⊢
  push_cast at h0
  linarith

/-- **Shell 0 of the `R`-gate**: `R ⪰ diag(−1, ε)` gives `−|y₁|² + ε|y₂|² ≤ y*Ry`. -/
theorem shellR_le (R : Sym2) (h : (R.subDiag (-1) ε).psdOK = true) (y1 y2 : ℂ) :
    -‖y1‖ ^ 2 + ε * ‖y2‖ ^ 2 ≤ R.form y1 y2 := by
  have h0 := Sym2.form_nonneg_of_psdOK _ h y1 y2
  simp only [Sym2.form, Sym2.subDiag, hre_self] at h0 ⊢
  push_cast at h0
  linarith

/-- **Shell `(1,1)` of the `R`-gate**: `R ⪰ diag(ε, 0)` gives `ε|y₁|² ≤ y*Ry`. -/
theorem shellR_le' (R : Sym2) (h : (R.subDiag ε 0).psdOK = true) (y1 y2 : ℂ) :
    ε * ‖y1‖ ^ 2 ≤ R.form y1 y2 := by
  have h0 := Sym2.form_nonneg_of_psdOK _ h y1 y2
  simp only [Sym2.form, Sym2.subDiag, hre_self] at h0 ⊢
  push_cast at h0
  linarith

/-- The three `E`-gates of a row: `E ⪰ 0`, `E ⪰ diag(−1, ε, ε)`, `N = E − diag(ε − δ, 0, 0) ⪰ 0`. -/
def rowGatesOK (r : Row) : Bool :=
  r.E.psdOK && (r.E.subDiag (-1) ε ε).psdOK && r.N.psdOK

/-- **The `E`-gates of all 19 rows hold** (exact rational arithmetic). -/
theorem rowData_gatesOK : rowData.all rowGatesOK = true := by decide +kernel

/-! ### Assembly of the row inequality from the fibre bound -/

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]

/-- The normalised law `U = |p|²/τ²` of a residual at scale `τ > 0`: `|p|² = τ² U`. -/
lemma sq_norm_eq_sq_mul_law {Ω : Type*} (p : Ω → ℂ) (τ : ℝ) (hτ : τ ≠ 0) (ω : Ω) :
    ‖p ω‖ ^ 2 = τ ^ 2 * (‖p ω‖ ^ 2 / τ ^ 2) := by
  field_simp

/-- `δ τ √U = δ |p|` for `U = |p|²/τ²`, `τ > 0`. -/
lemma scale_sqrt_law {Ω : Type*} (p : Ω → ℂ) (τ δ : ℝ) (hτ : 0 < τ) (ω : Ω) :
    δ * τ * √(‖p ω‖ ^ 2 / τ ^ 2) = δ * ‖p ω‖ := by
  rw [Real.sqrt_div' _ (sq_nonneg τ), Real.sqrt_sq (norm_nonneg _), Real.sqrt_sq hτ.le]
  field_simp

/-- **The row inequality from the fibre bound.**  If the pre-potential bracket `Bk` of the row
satisfies `Bk ≤ Ψ(δ|p|)` a.e. (the pointwise fibre bound) and the integrated k-side bound

  `V ≤ t² − 2ℓt + 2β²/ε + E Bk − δτ² − E[gate(p, X₂, X₃)] − ε‖Qh + (β/ε)v‖²`

holds, then `RowSharedWith` holds with the law `U = |p|²/τ²`. -/
theorem rowSharedWith_of_bracket (r : Row) {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] (Ψ : ℝ → ℝ)
    (hΨ : CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax)
    (p X2 X3 : Ω → ℂ) (τ : ℝ) (hτ : 0 < τ) (U : Ω → ℝ) (hU : ∀ ω, U ω = ‖p ω‖ ^ 2 / τ ^ 2)
    (Bk : Ω → ℝ) (hBk : ∀ᵐ ω ∂μ, Bk ω ≤ Ψ (r.delta * ‖p ω‖))
    (hBi : Integrable Bk μ) (hΨi : Integrable (fun ω => Ψ (r.delta * ‖p ω‖)) μ)
    (hgi : Integrable (fun ω => r.gate (p ω) (X2 ω) (X3 ω)) μ)
    (V t : ℝ) (Qh v : H)
    (hk : V ≤ t ^ 2 - 2 * r.ell * t + 2 * r.beta ^ 2 / ε + ∫ ω, Bk ω ∂μ - r.delta * τ ^ 2
      - ∫ ω, r.gate (p ω) (X2 ω) (X3 ω) ∂μ - ε * ‖Qh + ((r.beta : ℝ) / ε) • v‖ ^ 2) :
    RowSharedWith r Ψ μ U p X2 X3 τ V t Qh v := by
  have e : ∀ ω, (r.delta : ℝ) * τ * √(U ω) = r.delta * ‖p ω‖ := fun ω => by
    rw [hU]; exact scale_sqrt_law p τ r.delta hτ ω
  simp only [RowSharedWith, e]
  refine ⟨hΨ, hΨi, hgi, ?_⟩
  have := integral_mono_ae hBi hΨi hBk
  linarith

end Grothe.Lower

/-! ### The frame and the h-side identity on `L²(γ_n)` -/

namespace Grothe.LowerAnalytic

open Grothe.Lower MvPolynomial

noncomputable section

variable (n : ℕ)

/-- The real inner product of `L²(γ_n)` is the real part of the complex one. -/
lemma real_inner_L2G (f g : L2G n) : inner ℝ f g = (inner ℂ f g).re := by
  have hi : Integrable (fun x => conj (f x) * g x) (stdGaussian (n + n)) :=
    (L2.integrable_inner (𝕜 := ℂ) f g).congr
      (Filter.Eventually.of_forall fun x => RCLike.inner_apply' _ _)
  have h := integral_re hi
  simp only [RCLike.re_to_complex] at h
  rw [L2.inner_def, inner_L2, ← h]
  refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
  simp [Complex.inner, mul_comm]

/-- **The frame vector**: a unit `ζ ∈ H₁,₀` with `P₁,₀h = t ζ`, `t = ‖P₁,₀h‖` (`ζ = Ph/t` if
`t > 0`, `ζ = z₁/√2` otherwise). -/
lemma exists_frame_vector (hn : 0 < n) (h : L2G n) :
    ∃ ζ ∈ H10 n, ‖ζ‖ = 1 ∧
      (H10 n).starProjection h = ((‖(H10 n).starProjection h‖ : ℝ) : ℂ) • ζ := by
  by_cases hP : (H10 n).starProjection h = 0
  · have h2 : ‖zL n ⟨0, hn⟩‖ = √2 := by
      rw [← norm_zL_sq n ⟨0, hn⟩, Real.sqrt_sq (norm_nonneg _)]
    refine ⟨((√2)⁻¹ : ℂ) • zL n ⟨0, hn⟩, Submodule.smul_mem _ _ (zL_mem_H10 n _), ?_, ?_⟩
    · rw [norm_smul, h2, norm_inv, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (Real.sqrt_nonneg _), inv_mul_cancel₀ (by positivity)]
    · rw [hP, norm_zero]; simp
  · have hne : ‖(H10 n).starProjection h‖ ≠ 0 := norm_ne_zero_iff.2 hP
    refine ⟨((‖(H10 n).starProjection h‖⁻¹ : ℝ) : ℂ) • (H10 n).starProjection h,
      Submodule.smul_mem _ _ (Submodule.starProjection_apply_mem _ _), ?_, ?_⟩
    · rw [norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_inv, abs_norm,
        inv_mul_cancel₀ hne]
    · rw [smul_smul, ← Complex.ofReal_mul, mul_inv_cancel₀ hne, Complex.ofReal_one, one_smul]

/-- **The h-side identity**: for a unit `ζ ∈ H₁,₀` with `Ph = tζ`, a coupling vector `v ∈ H₂,₁`
with `‖v‖² = 2`, real `ℓ, β`, and `L = ℓζ + βv`,

  `t² − ε‖Qh‖² = t² − 2ℓt + 2β²/ε + 2 Re⟪L, h⟫ − ε‖Qh + (β/ε)v‖²`

(the retained square of the paper's h-side, HJM (8.5) with the square kept). -/
theorem hside_identity (ℓ β t : ℝ) (h ζ v : L2G n) (hζ : ζ ∈ H10 n) (hζ1 : ‖ζ‖ = 1)
    (hP : (H10 n).starProjection h = (t : ℂ) • ζ) (hv : v ∈ H21 n) (hv2 : ‖v‖ ^ 2 = 2) :
    t ^ 2 - ε * ‖(H21 n).starProjection h‖ ^ 2
      = t ^ 2 - 2 * ℓ * t + 2 * β ^ 2 / ε
        + 2 * (inner ℂ ((ℓ : ℂ) • ζ + (β : ℂ) • v) h).re
        - ε * ‖(H21 n).starProjection h + (β / ε) • v‖ ^ 2 := by
  have hε : (0 : ℝ) < ε := by unfold ε; norm_num
  -- `Re⟪ζ, h⟫ = t`
  have h1 : (inner ℂ ζ h).re = t := by
    have : inner ℂ ζ h = inner ℂ ζ ((H10 n).starProjection h) := by
      rw [← Submodule.inner_starProjection_left_eq_right,
        Submodule.starProjection_eq_self_iff.2 hζ]
    rw [this, hP, inner_smul_right, inner_self_eq_norm_sq_to_K, hζ1]
    simp
  -- `Re⟪v, Qh⟫ = Re⟪v, h⟫`
  have h2 : inner ℂ v ((H21 n).starProjection h) = inner ℂ v h := by
    rw [← Submodule.inner_starProjection_left_eq_right,
      Submodule.starProjection_eq_self_iff.2 hv]
  -- the expanded square
  have h3 : ‖(H21 n).starProjection h + (β / ε) • v‖ ^ 2
      = ‖(H21 n).starProjection h‖ ^ 2 + 2 * (β / ε) * (inner ℂ v h).re + (β / ε) ^ 2 * 2 := by
    rw [norm_add_sq_real, real_inner_smul_right, real_inner_L2G,
      ← inner_conj_symm ((H21 n).starProjection h) v, Complex.conj_re, h2, norm_smul,
      mul_pow, Real.norm_eq_abs, sq_abs, hv2]
    ring
  -- the linear term
  have h4 : (inner ℂ ((ℓ : ℂ) • ζ + (β : ℂ) • v) h).re = ℓ * t + β * (inner ℂ v h).re := by
    rw [inner_add_left, inner_smul_left, inner_smul_left, Complex.conj_ofReal,
      Complex.conj_ofReal, Complex.add_re, Complex.re_ofReal_mul, Complex.re_ofReal_mul, h1]
  rw [h3, h4]
  field_simp
  ring

/-- **The scalar profile value in a frame**: `V = t² − 2ℓt + 2β²/ε + 2 Re⟪L, h⟫ + (ε‖Qk‖² − ‖Pk‖²)
− ε‖Qh + (β/ε)v‖²` for `Ph = tζ`, `L = ℓζ + βv`. -/
theorem VOf_frame (f g : L2G n) (ℓ β : ℝ) (ζ v : L2G n) (hζ : ζ ∈ H10 n) (hζ1 : ‖ζ‖ = 1)
    (hP : (H10 n).starProjection (hOf n f g) = ((tOf n f g : ℝ) : ℂ) • ζ) (hv : v ∈ H21 n)
    (hv2 : ‖v‖ ^ 2 = 2) :
    VOf n f g = tOf n f g ^ 2 - 2 * ℓ * tOf n f g + 2 * β ^ 2 / ε
      + 2 * (inner ℂ ((ℓ : ℂ) • ζ + (β : ℂ) • v) (hOf n f g)).re
      + (ε * ‖QkOf n f g‖ ^ 2 - ‖PkOf n f g‖ ^ 2)
      - ε * ‖QhOf n f g + (β / ε) • v‖ ^ 2 := by
  have := hside_identity n ℓ β (tOf n f g) (hOf n f g) ζ v hζ hζ1 hP hv hv2
  rw [VOf_eq]
  unfold QhOf
  linarith

/-! ### The coupling vector `v = ζ(|ζ|² − 2)` -/

/-! ### Gaussian moments of degree four and six -/

lemma gE_X_pow_four {d : ℕ} (i : Fin d) : gaussE d (X i ^ 4) = 3 := by
  have h := gE_X_sq_mul_X_sq i i
  rw [← pow_add] at h
  norm_num at h
  exact h

lemma gE_X_pow_six {d : ℕ} (i : Fin d) : gaussE d (X i ^ 6) = 15 := by
  have hE := gaussE_isGaussianExpectation d
  have h := hE.ibp i (X i ^ 5)
  rw [pderiv_pow, pderiv_X_self, mul_one] at h
  rw [show X i ^ 6 = X i * X i ^ 5 by ring, h]
  simp only [Nat.cast_ofNat, Nat.add_one_sub_one]
  rw [ofNat_mul_apply, gE_X_pow_four]; norm_num

lemma gE_X_pow_four_mul_X_sq {d : ℕ} {i j : Fin d} (hij : i ≠ j) :
    gaussE d (X i ^ 4 * X j ^ 2) = 3 := by
  have hE := gaussE_isGaussianExpectation d
  have h := hE.ibp i (X i ^ 3 * X j ^ 2)
  rw [pderiv_mul, pderiv_pow, pderiv_X_self, pderiv_pow, pderiv_X_of_ne (Ne.symm hij)] at h
  rw [show X i ^ 4 * X j ^ 2 = X i * (X i ^ 3 * X j ^ 2) by ring, h]
  simp only [Nat.cast_ofNat, Nat.add_one_sub_one, mul_one, mul_zero, add_zero]
  rw [mul_assoc, ofNat_mul_apply, gE_X_sq_mul_X_sq]; simp [hij]

/-- `E[X_i R] = 0` when `R` does not depend on `X_i`. -/
lemma gE_X_mul_eq_zero {d : ℕ} (i : Fin d) (R : MvPolynomial (Fin d) ℝ) (h : pderiv i R = 0) :
    gaussE d (X i * R) = 0 := by
  rw [(gaussE_isGaussianExpectation d).ibp, h, map_zero]

/-! ### Complex integrals of polynomial type -/

/-- A complex integrand whose real and imaginary parts are polynomials. -/
lemma integral_eq_gaussE (F : (Fin (n + n) → ℝ) → ℂ) (P Q : MvPolynomial (Fin (n + n)) ℝ)
    (h : ∀ x, F x = ⟨eval x P, eval x Q⟩) :
    ∫ x, F x ∂(stdGaussian (n + n)) = ⟨gaussE (n + n) P, gaussE (n + n) Q⟩ := by
  have e : F = fun x => ((eval x P : ℝ) : ℂ) + ((eval x Q : ℝ) : ℂ) * Complex.I := by
    funext x; rw [h x]; apply Complex.ext <;> simp
  rw [e, integral_add (integrable_eval P).ofReal ((integrable_eval Q).ofReal.mul_const _),
    integral_mul_const, integral_complex_ofReal, integral_complex_ofReal]
  apply Complex.ext <;> simp [gaussE_apply]

lemma inner_eq_of_ae (u v : L2G n) (F G : (Fin (n + n) → ℝ) → ℂ)
    (hu : ∀ᵐ x ∂(stdGaussian (n + n)), u x = F x)
    (hv : ∀ᵐ x ∂(stdGaussian (n + n)), v x = G x) (P Q : MvPolynomial (Fin (n + n)) ℝ)
    (h : ∀ x, conj (F x) * G x = ⟨eval x P, eval x Q⟩) :
    inner ℂ u v = ⟨gaussE (n + n) P, gaussE (n + n) Q⟩ := by
  rw [inner_L2, ← integral_eq_gaussE n (fun x => conj (F x) * G x) P Q h]
  refine integral_congr_ae ?_
  filter_upwards [hu, hv] with x h1 h2
  rw [h1, h2]

lemma norm_sq_eq_of_ae (u : L2G n) (F : (Fin (n + n) → ℝ) → ℂ)
    (hu : ∀ᵐ x ∂(stdGaussian (n + n)), u x = F x) (P : MvPolynomial (Fin (n + n)) ℝ)
    (h : ∀ x, ‖F x‖ ^ 2 = eval x P) : ‖u‖ ^ 2 = gaussE (n + n) P := by
  have h1 := inner_eq_of_ae n u u F F hu hu P 0 (fun x => by
    rw [Complex.conj_mul', ← h x, ← Complex.ofReal_pow]
    refine Complex.ext ?_ ?_
    · simp only [Complex.ofReal_re]
    · simp only [Complex.ofReal_im, map_zero])
  have h2 := inner_self_eq_norm_sq (𝕜 := ℂ) u
  rw [h1] at h2
  simpa using h2.symm

/-- `∂_i ((X_a² + X_b²) X_c) = 0` when `i ∉ {a, b, c}`. -/
lemma pderiv_quad_zero {d : ℕ} {i a b c : Fin d} (ha : a ≠ i) (hb : b ≠ i) (hc : c ≠ i) :
    pderiv i ((X a ^ 2 + X b ^ 2) * X c : MvPolynomial (Fin d) ℝ) = 0 := by
  simp only [pderiv_mul, pderiv_pow, map_add, pderiv_X_of_ne ha, pderiv_X_of_ne hb,
    pderiv_X_of_ne hc, mul_zero, zero_mul, add_zero]

/-! ### Index bookkeeping -/

lemma castAdd_ne_castAdd {l m : Fin n} (h : l ≠ m) : Fin.castAdd n l ≠ Fin.castAdd n m := by
  intro e; exact h (Fin.ext (by simpa using congrArg Fin.val e))

lemma natAdd_ne_natAdd {l m : Fin n} (h : l ≠ m) : Fin.natAdd n l ≠ Fin.natAdd n m := by
  intro e; exact h (Fin.ext (by simpa using congrArg Fin.val e))

/-! ### The inner products `⟪z_l, z_m⟫` and `⟪z_l|z_l|², z_m⟫` -/

/-- `⟪z_l, z_m⟫ = 2δ_{lm}`. -/
lemma inner_zL_zL_ite (l m : Fin n) : inner ℂ (zL n l) (zL n m) = if l = m then 2 else 0 := by
  rw [inner_eq_of_ae n (zL n l) (zL n m) (zc n l) (zc n m) (MemLp.coeFn_toLp _)
    (MemLp.coeFn_toLp _)
    (X (Fin.castAdd n l) * X (Fin.castAdd n m) + X (Fin.natAdd n l) * X (Fin.natAdd n m))
    (X (Fin.castAdd n l) * X (Fin.natAdd n m) - X (Fin.natAdd n l) * X (Fin.castAdd n m))
    (fun x => by
      apply Complex.ext <;> simp [zc]
      ring)]
  by_cases h : l = m
  · subst h
    simp only [ite_true]
    apply Complex.ext
    · simp only [Complex.re_ofNat]
      rw [← sq, ← sq, map_add, gE_X_sq, gE_X_sq]; norm_num
    · simp only [Complex.im_ofNat]
      rw [mul_comm (X (Fin.natAdd n l)), sub_self, map_zero]
  · simp only [h, ite_false]
    apply Complex.ext
    · simp only [Complex.zero_re]
      rw [map_add, gE_X_mul_eq_zero _ _ (pderiv_X_of_ne (castAdd_ne_castAdd n (Ne.symm h))),
        gE_X_mul_eq_zero _ _ (pderiv_X_of_ne (natAdd_ne_natAdd n (Ne.symm h))), add_zero]
    · simp only [Complex.zero_im]
      rw [map_sub, gE_X_mul_eq_zero _ _ (pderiv_X_of_ne (castAdd_ne_natAdd n l m).symm),
        gE_X_mul_eq_zero _ _ (pderiv_X_of_ne (castAdd_ne_natAdd n m l)), sub_zero]

/-- `⟪z_l |z_l|², z_m⟫ = 8δ_{lm}`. -/
lemma inner_wL_zL (l m : Fin n) : inner ℂ (wL n l l l) (zL n m) = if l = m then 8 else 0 := by
  rw [inner_eq_of_ae n (wL n l l l) (zL n m) (wc n l l l) (zc n m) (MemLp.coeFn_toLp _)
    (MemLp.coeFn_toLp _)
    ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
      * (X (Fin.castAdd n l) * X (Fin.castAdd n m) + X (Fin.natAdd n l) * X (Fin.natAdd n m)))
    ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
      * (X (Fin.castAdd n l) * X (Fin.natAdd n m) - X (Fin.natAdd n l) * X (Fin.castAdd n m)))
    (fun x => by apply Complex.ext <;> (simp [wc, zc]; ring))]
  have hab := castAdd_ne_natAdd n l l
  by_cases h : l = m
  · subst h
    simp only [ite_true]
    apply Complex.ext
    · simp only [Complex.re_ofNat]
      rw [show (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
          * (X (Fin.castAdd n l) * X (Fin.castAdd n l) + X (Fin.natAdd n l) * X (Fin.natAdd n l))
          = X (Fin.castAdd n l) ^ 2 * X (Fin.castAdd n l) ^ 2
            + X (Fin.castAdd n l) ^ 2 * X (Fin.natAdd n l) ^ 2
            + X (Fin.natAdd n l) ^ 2 * X (Fin.castAdd n l) ^ 2
            + X (Fin.natAdd n l) ^ 2 * X (Fin.natAdd n l) ^ 2 by ring,
        map_add, map_add, map_add, gE_X_sq_mul_X_sq, gE_X_sq_mul_X_sq, gE_X_sq_mul_X_sq,
        gE_X_sq_mul_X_sq]
      simp only [ite_true, hab, hab.symm, ite_false]
      norm_num
    · simp only [Complex.im_ofNat]
      rw [mul_comm (X (Fin.natAdd n l)), sub_self, mul_zero, map_zero]
  · simp only [h, ite_false]
    have hac := castAdd_ne_castAdd n (Ne.symm h)
    have hbd := natAdd_ne_natAdd n (Ne.symm h)
    have had := castAdd_ne_natAdd n l m
    have hbc := castAdd_ne_natAdd n m l
    apply Complex.ext
    · simp only [Complex.zero_re]
      rw [show (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
          * (X (Fin.castAdd n l) * X (Fin.castAdd n m) + X (Fin.natAdd n l) * X (Fin.natAdd n m))
          = X (Fin.castAdd n m) * ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2) * X (Fin.castAdd n l))
            + X (Fin.natAdd n m) * ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2) * X (Fin.natAdd n l))
          by ring, map_add, gE_X_mul_eq_zero _ _ (pderiv_quad_zero hac.symm hbc.symm hac.symm),
        gE_X_mul_eq_zero _ _ (pderiv_quad_zero had hbd.symm hbd.symm), add_zero]
    · simp only [Complex.zero_im]
      rw [show (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
          * (X (Fin.castAdd n l) * X (Fin.natAdd n m) - X (Fin.natAdd n l) * X (Fin.castAdd n m))
          = X (Fin.natAdd n m) * ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2) * X (Fin.castAdd n l))
            - X (Fin.castAdd n m) * ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2) * X (Fin.natAdd n l))
          by ring, map_sub, gE_X_mul_eq_zero _ _ (pderiv_quad_zero had hbd.symm had),
        gE_X_mul_eq_zero _ _ (pderiv_quad_zero hac.symm hbc.symm hbc.symm), sub_zero]

/-! ### The coupling vector -/

/-- **The coupling vector** `v_l = z_l(|z_l|² − 4)/(2√2)`, i.e. `ζ(|ζ|² − 2)` for the unit
coordinate `ζ = z_l/√2`. -/
def vL (l : Fin n) : L2G n :=
  (((2 * √2)⁻¹ : ℝ) : ℂ) • (wL n l l l - (4 : ℂ) • zL n l)

lemma vL_coeFn (l : Fin n) :
    ∀ᵐ x ∂(stdGaussian (n + n)),
      vL n l x = (((2 * √2)⁻¹ : ℝ) : ℂ) * (wc n l l l x - 4 * zc n l x) := by
  filter_upwards [Lp.coeFn_smul ((((2 * √2)⁻¹ : ℝ) : ℂ)) (wL n l l l - (4 : ℂ) • zL n l),
    Lp.coeFn_sub (wL n l l l) ((4 : ℂ) • zL n l), Lp.coeFn_smul (4 : ℂ) (zL n l),
    MemLp.coeFn_toLp (memLp_wc n l l l), MemLp.coeFn_toLp (memLp_zc n l)] with x h1 h2 h3 h4 h5
  rw [vL, h1, Pi.smul_apply, h2, Pi.sub_apply, h3, Pi.smul_apply, smul_eq_mul, smul_eq_mul]
  unfold wL zL at *
  rw [h4, h5]

lemma vL_mem_chargeOne3 (l : Fin n) : vL n l ∈ chargeOne3 n :=
  Submodule.smul_mem _ _ (Submodule.sub_mem _
    (Submodule.subset_span (Or.inr ⟨(l, l, l), rfl⟩))
    (Submodule.smul_mem _ _ (Submodule.subset_span (Or.inl ⟨l, rfl⟩))))

lemma inner_vL_zL (l m : Fin n) : inner ℂ (vL n l) (zL n m) = 0 := by
  rw [vL, inner_smul_left, inner_sub_left, inner_smul_left, inner_wL_zL, inner_zL_zL_ite]
  split_ifs <;> norm_num [Complex.ext_iff]

/-- `v_l ⊥ H₁,₀`. -/
lemma vL_mem_orthogonal (l : Fin n) : vL n l ∈ (H10 n)ᗮ := by
  have h : H10 n ≤ (ℂ ∙ vL n l)ᗮ := by
    refine Submodule.span_le.2 ?_
    rintro _ ⟨m, rfl⟩
    exact Submodule.mem_orthogonal_singleton_iff_inner_right.2 (inner_vL_zL n l m)
  exact Submodule.orthogonal_le h
    (Submodule.le_orthogonal_orthogonal _ (Submodule.mem_span_singleton_self _))

/-- **`v_l ∈ H₂,₁`.** -/
theorem vL_mem_H21 (l : Fin n) : vL n l ∈ H21 n :=
  Submodule.mem_inf.2 ⟨vL_mem_chargeOne3 n l, vL_mem_orthogonal n l⟩

/-- `‖z_l(|z_l|² − 4)‖² = 16`. -/
lemma norm_sq_wL_sub (l : Fin n) : ‖wL n l l l - (4 : ℂ) • zL n l‖ ^ 2 = 16 := by
  have hab := castAdd_ne_natAdd n l l
  rw [norm_sq_eq_of_ae n _ (fun x => wc n l l l x - 4 * zc n l x) ?_
    ((X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
      * (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2 - 4) ^ 2) ?_]
  · rw [show (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2)
        * (X (Fin.castAdd n l) ^ 2 + X (Fin.natAdd n l) ^ 2 - (4 : MvPolynomial (Fin (n + n)) ℝ)) ^ 2
        = X (Fin.castAdd n l) ^ 6 + X (Fin.natAdd n l) ^ 6
          + 3 * (X (Fin.castAdd n l) ^ 4 * X (Fin.natAdd n l) ^ 2)
          + 3 * (X (Fin.natAdd n l) ^ 4 * X (Fin.castAdd n l) ^ 2)
          + 16 * X (Fin.castAdd n l) ^ 2 + 16 * X (Fin.natAdd n l) ^ 2
          - 8 * (X (Fin.castAdd n l) ^ 2 * X (Fin.castAdd n l) ^ 2)
          - 16 * (X (Fin.castAdd n l) ^ 2 * X (Fin.natAdd n l) ^ 2)
          - 8 * (X (Fin.natAdd n l) ^ 2 * X (Fin.natAdd n l) ^ 2) by ring]
    simp only [map_add, map_sub]
    repeat rw [ofNat_mul_apply]
    rw [gE_X_pow_six, gE_X_pow_six, gE_X_pow_four_mul_X_sq hab, gE_X_pow_four_mul_X_sq hab.symm,
      gE_X_sq, gE_X_sq, gE_X_sq_mul_X_sq, gE_X_sq_mul_X_sq, gE_X_sq_mul_X_sq]
    simp only [ite_true, hab, ite_false]
    norm_num
  · filter_upwards [Lp.coeFn_sub (wL n l l l) ((4 : ℂ) • zL n l), Lp.coeFn_smul (4 : ℂ) (zL n l),
      MemLp.coeFn_toLp (memLp_wc n l l l), MemLp.coeFn_toLp (memLp_zc n l)] with x h2 h3 h4 h5
    rw [h2, Pi.sub_apply, h3, Pi.smul_apply, smul_eq_mul]
    unfold wL zL at *
    rw [h4, h5]
  · intro x
    simp only [wc, zc, Complex.sq_norm, Complex.normSq_apply, Complex.sub_re, Complex.sub_im,
      Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im, Complex.re_ofNat,
      Complex.im_ofNat, map_add, map_sub, map_mul, map_pow, eval_X, map_ofNat]
    ring

/-- **`‖v_l‖² = 2`.** -/
theorem norm_vL_sq (l : Fin n) : ‖vL n l‖ ^ 2 = 2 := by
  rw [vL, norm_smul, mul_pow, norm_sq_wL_sub, Complex.norm_real, Real.norm_eq_abs, abs_inv,
    abs_of_pos (by positivity), inv_pow, mul_pow, Real.sq_sqrt (by norm_num)]
  norm_num

end

end Grothe.LowerAnalytic
