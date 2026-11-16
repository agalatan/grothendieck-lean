import Mathlib

/-!
# The anchored-pair majorant, with an identity tail (route Core, pointwise)

**Setting.**  A tail `ν ≥ 0` and prices `d₂, d₃ > ν`.  Put `eᵢ = dᵢ − ν`, `σ = e₂ + e₃`,
`δ = e₃ − e₂` and `Δ = d₂d₃ − ν² = e₂e₃ + νσ`.  For complex `A, B` and phases `w = (f, g)`,
`|f| = |g| = 1`:

* `majEll`: the affine piece `ℓ_w(A, B) = Re(f̄A) + Re(ḡB) + ν Re(f̄g)`;
* `psiT`: the pair potential `Ψ_ν(A, B) = sup_w ℓ_w(A, B)` of a witness with the identity tail `ν`;
  at `ν = 0` it is `|A| + |B|` (`psiT_zero`);
* `majPhi`: the dual majorant `Φ_d(A, B) = (d₂ + d₃)/2 + (d₃|A|² + d₂|B|² + 2ν Re(A B̄))/(2Δ)`;
* `majH`: `h(L, p) = 4 Re(p L̄) − c₀ − c₁|L|²`, with the centre (`majC0`, `majC1`)
  `c₀ = d₂² − d₃² + ν(d₂ − d₃)(e₂² + e₃²)/(e₂e₃)`, `c₁ = −4ν(d₂ − d₃)/(e₂e₃)`;
* `majGammaStar`: `γ*(R) = 8σ(e₂e₃)²/(Δ(Δ(σ² + 2R|δ|)² + 16R²(e₂e₃)²))`, with the denominator
  `majGammaDen`.

**Theorem** (`anchored_pair_nu`).  For `|L| ≤ R`, `0 ≤ γ ≤ γ*(R)`, every `p` and all phases,

  `ℓ_w(L + p, L − p) ≤ Φ_d(L + p, L − p) − (γ/16) h(L, p)²`.

So `Φ_d − (γ/16)h²` majorises `Ψ_ν(L + p, L − p)`; the statement is pointwise in the phases.
`γ ≤ γ*(R)` is a condition without division on the data,
`γ · majGammaDen ≤ 8σ(e₂e₃)²` (`le_majGammaStar_iff`).  This is Theorem 1 of the note
`research/identity-tail/sources/lemma-2026-11-15/PROOF.tex` (issue #183), whose
proof is followed; the equation numbers below are those of the note:

* Lemma 1, identity (1.1) (`majPhi_sub_majEll`, `majEll_le_majPhi`): with `M = [[d₂, −ν], [−ν, d₃]]`,
  `Φ_d(V) − ℓ_w(V) = ½ (V − Mw)* M⁻¹ (V − Mw) ≥ 0`.  This is the case `γ = 0`, and it needs only
  `d₂ > 0` and `Δ > 0`;
* Lemma 3 (`maj_key_bound`): `|H̃| ≤ Γ_s |s − e₂f − e₃g|` for `s ≥ 0`, where
  `H̃ = 2s(Re f − Re g) + (δ/(e₂e₃))(σ² − s²)` and `Γ_s = (σ² + s|δ|)/(e₂e₃)`;
* Lemma 2 (`maj_completed_square`): for a real `L = l`, with `N = |2l − e₂f − e₃g|²`,
  `W = σp + δl − Δ(f − g)` and `q = σ − 2γΔl²`, identity (7.1) reads
  `Φ_d − (γ/16)h² − ℓ_w = (N − κH̃²)/(2σ) + (q/(2Δ))(Re W/σ − t*)² + (Im W)²/(2Δσ)`,
  `κ = γΔ²/(8q)`, with `H̃` at `s = 2l` and `t*` the minimiser of (5.3); and `κ Γ_{2l}² ≤ 1` is
  `γ ≤ γ*(l)`, which follows from `γ ≤ γ*(R)`;
* a general `L` is rotated to `|L|` (`majEll_mul_unit`, `majPhi_mul_unit`, `majH_mul_unit`).

**The case `ν = 0`** (`A₀ = d₂`, `B₀ = d₃`, `S = A₀ + B₀`) is the anchored-pair majorant of
`|L + p| + |L − p|` (`anchored_potential_formalization.md` §2, eqs. (2)–(4); AF eq. (4)).  Then
`c₁ = 0`, `c₀ = A₀² − B₀²` and `γ*(R) = 8/D`, `D = S(S² + 4R² + 4R|A₀ − B₀|)` (`majD`,
`majGammaStar_zero`), and the theorem reads

  `|L + p| + |L − p| ≤ (|L+p|² + A₀²)/(2A₀) + (|L−p|² + B₀²)/(2B₀) − T²/(2D)`,
  `T = 4 Re(p L̄) − (A₀² − B₀²)`.

* `anchored_real`: the real form, for any real `A, B` with `|A − B| ≤ 2R`: `anchored_pair_nu` at
  `ν = 0`, `γ = 8/D`, `L = (A − B)/2`, `p = (A + B)/2` and the phases `(1, −1)`;
* `anchored_pair`: the complex statement, by `anchored_real` at `A = |L + p|`, `B = |L − p|`
  (`|A − B| ≤ 2|L| ≤ 2R`);
* `anchored_pair_poly`: the same majorant written as a polynomial in `p` (the form that is
  integrated: `|L ± p|² = |L|² + |p|² ± 2 Re(p L̄)`);
* `young_pair`: the plain Young bound (`T²/(2D)` dropped).

**The pair potential** `Ψ_ν` (`psiT`) is the integrand of the fibre potential (`Jpot` in
`FibreSup.lean`).  It is used only through its affine pieces: `majEll_le_psiT` (every piece is below
it) and `psiT_le` (a bound of every piece bounds it).  They give `Ψ_0(A, B) = |A| + |B|`
(`psiT_zero`), `|A| + |B| − |ν| ≤ Ψ_ν(A, B) ≤ |A| + |B| + |ν|` (`add_le_psiT`, `psiT_le_add`), the
symmetries `Ψ_ν(B, A) = Ψ_ν(Ā, B̄) = Ψ_ν(Av, Bv) = Ψ_ν(A, B)` for `|v| = 1` (`psiT_comm`, `psiT_conj`,
`psiT_mul_unit`, `psiT_neg`), the Lipschitz bound `psiT_le_add_norm`, convexity (`psiT_convex`) and
continuity (`continuous_psiT`).
-/

open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

/-! ### The majorant with a tail: definitions -/

/-- The dual majorant `Φ_d(A, B) = (d₂ + d₃)/2 + (d₃|A|² + d₂|B|² + 2ν Re(A B̄))/(2Δ)`,
`Δ = d₂d₃ − ν²`. -/
noncomputable def majPhi (d2 d3 ν : ℝ) (A B : ℂ) : ℝ :=
  (d2 + d3) / 2
    + (d3 * ‖A‖ ^ 2 + d2 * ‖B‖ ^ 2 + 2 * ν * (A * conj B).re) / (2 * (d2 * d3 - ν ^ 2))

/-- The affine piece `ℓ_w(A, B) = Re(f̄A) + Re(ḡB) + ν Re(f̄g)` of the phases `w = (f, g)`. -/
noncomputable def majEll (ν : ℝ) (f g A B : ℂ) : ℝ :=
  (conj f * A).re + (conj g * B).re + ν * (conj f * g).re

/-- The centre `c₀ = d₂² − d₃² + ν(d₂ − d₃)(e₂² + e₃²)/(e₂e₃)`, `eᵢ = dᵢ − ν`. -/
noncomputable def majC0 (d2 d3 ν : ℝ) : ℝ :=
  d2 ^ 2 - d3 ^ 2 + ν * (d2 - d3) * ((d2 - ν) ^ 2 + (d3 - ν) ^ 2) / ((d2 - ν) * (d3 - ν))

/-- The centre `c₁ = −4ν(d₂ − d₃)/(e₂e₃)`, `eᵢ = dᵢ − ν`. -/
noncomputable def majC1 (d2 d3 ν : ℝ) : ℝ := -(4 * ν * (d2 - d3)) / ((d2 - ν) * (d3 - ν))

/-- `h(L, p) = 4 Re(p L̄) − c₀ − c₁|L|²`. -/
noncomputable def majH (d2 d3 ν : ℝ) (L p : ℂ) : ℝ :=
  4 * (p * conj L).re - majC0 d2 d3 ν - majC1 d2 d3 ν * ‖L‖ ^ 2

/-- The denominator `Δ(Δ(σ² + 2R|δ|)² + 16R²(e₂e₃)²)` of `γ*(R)`.  (The `D_ν(R)` of the note, for
which `γ*(R) = 8/D_ν(R)`, is this divided by `σ(e₂e₃)²`; at `ν = 0` it is `majD`.) -/
noncomputable def majGammaDen (d2 d3 ν R : ℝ) : ℝ :=
  (d2 * d3 - ν ^ 2) * ((d2 * d3 - ν ^ 2) * ((d2 + d3 - 2 * ν) ^ 2 + 2 * R * |d3 - d2|) ^ 2
    + 16 * R ^ 2 * ((d2 - ν) * (d3 - ν)) ^ 2)

/-- The coefficient `γ*(R) = 8σ(e₂e₃)²/(Δ(Δ(σ² + 2R|δ|)² + 16R²(e₂e₃)²))` (eq. (1) of the note). -/
noncomputable def majGammaStar (d2 d3 ν R : ℝ) : ℝ :=
  8 * (d2 + d3 - 2 * ν) * ((d2 - ν) * (d3 - ν)) ^ 2 / majGammaDen d2 d3 ν R

private lemma re_sq_add_im_sq {f : ℂ} (hf : ‖f‖ = 1) : f.re ^ 2 + f.im ^ 2 = 1 := by
  have h := Complex.normSq_eq_norm_sq f
  rw [hf, Complex.normSq_apply] at h
  linarith

private lemma maj_pos {d2 d3 ν : ℝ} (hν : 0 ≤ ν) (h2 : ν < d2) (h3 : ν < d3) :
    0 < d2 - ν ∧ 0 < d3 - ν ∧ 0 < d2 * d3 - ν ^ 2 := by
  have he2 : 0 < d2 - ν := by linarith
  have he3 : 0 < d3 - ν := by linarith
  exact ⟨he2, he3, by linarith [mul_pos he2 he3, mul_nonneg hν he2.le, mul_nonneg hν he3.le]⟩

lemma majGammaDen_pos {d2 d3 ν R : ℝ} (hν : 0 ≤ ν) (h2 : ν < d2) (h3 : ν < d3) (hR : 0 ≤ R) :
    0 < majGammaDen d2 d3 ν R := by
  obtain ⟨-, -, hΔ⟩ := maj_pos hν h2 h3
  have hσ : 0 < d2 + d3 - 2 * ν := by linarith
  have hG : 0 < (d2 + d3 - 2 * ν) ^ 2 + 2 * R * |d3 - d2| :=
    add_pos_of_pos_of_nonneg (pow_pos hσ 2) (by positivity)
  unfold majGammaDen
  exact mul_pos hΔ (add_pos_of_pos_of_nonneg (mul_pos hΔ (pow_pos hG 2)) (by positivity))

/-- **The cell condition** (eq. (3) of the note): `γ ≤ γ*(R)` iff
`γ Δ(Δ(σ² + 2R|δ|)² + 16R²(e₂e₃)²) ≤ 8σ(e₂e₃)²`, a comparison of the cell data without division. -/
lemma le_majGammaStar_iff {d2 d3 ν R γ : ℝ} (hν : 0 ≤ ν) (h2 : ν < d2) (h3 : ν < d3)
    (hR : 0 ≤ R) :
    γ ≤ majGammaStar d2 d3 ν R
      ↔ γ * majGammaDen d2 d3 ν R ≤ 8 * (d2 + d3 - 2 * ν) * ((d2 - ν) * (d3 - ν)) ^ 2 :=
  le_div_iff₀ (majGammaDen_pos hν h2 h3 hR)

/-! ### Lemma 1: the gap of an affine piece -/

/-- **Lemma 1, identity (1.1).**  With `M = [[d₂, −ν], [−ν, d₃]]` and `Mw = (d₂f − νg, d₃g − νf)`:
`Φ_d(V) − ℓ_w(V) = ½ (V − Mw)* M⁻¹ (V − Mw)`, `M⁻¹ = Δ⁻¹ [[d₃, ν], [ν, d₂]]`. -/
theorem majPhi_sub_majEll {d2 d3 ν : ℝ} (hΔ : d2 * d3 - ν ^ 2 ≠ 0) {f g : ℂ} (hf : ‖f‖ = 1)
    (hg : ‖g‖ = 1) (A B : ℂ) :
    majPhi d2 d3 ν A B - majEll ν f g A B
      = (d3 * ‖A - (d2 * f - ν * g)‖ ^ 2 + d2 * ‖B - (d3 * g - ν * f)‖ ^ 2
          + 2 * ν * ((A - (d2 * f - ν * g)) * conj (B - (d3 * g - ν * f))).re)
        / (2 * (d2 * d3 - ν ^ 2)) := by
  have hf2 := re_sq_add_im_sq hf
  have hg2 := re_sq_add_im_sq hg
  simp only [majPhi, majEll, ← Complex.normSq_eq_norm_sq, Complex.normSq_apply, Complex.mul_re,
    Complex.mul_im, Complex.sub_re, Complex.sub_im, Complex.conj_re, Complex.conj_im,
    Complex.ofReal_re, Complex.ofReal_im]
  field_simp
  linear_combination (-((d2 * d3 - ν ^ 2) * d2)) * hf2 + (-((d2 * d3 - ν ^ 2) * d3)) * hg2

/-- The form `x* (Δ M⁻¹) x = d₃|a|² + d₂|b|² + 2ν Re(a b̄)` is nonnegative for `d₂ > 0`, `Δ > 0`. -/
private lemma maj_form_nonneg {d2 d3 ν : ℝ} (h2 : 0 < d2) (hΔ : 0 < d2 * d3 - ν ^ 2) (a b : ℂ) :
    0 ≤ d3 * ‖a‖ ^ 2 + d2 * ‖b‖ ^ 2 + 2 * ν * (a * conj b).re := by
  have e : d2 * (d3 * ‖a‖ ^ 2 + d2 * ‖b‖ ^ 2 + 2 * ν * (a * conj b).re)
      = ‖(d2 : ℂ) * b + ν * a‖ ^ 2 + (d2 * d3 - ν ^ 2) * ‖a‖ ^ 2 := by
    simp only [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
      Complex.add_re, Complex.add_im, Complex.conj_re, Complex.conj_im, Complex.ofReal_re,
      Complex.ofReal_im]
    ring
  have h : 0 ≤ d2 * (d3 * ‖a‖ ^ 2 + d2 * ‖b‖ ^ 2 + 2 * ν * (a * conj b).re) := by
    rw [e]; positivity
  exact (mul_nonneg_iff_of_pos_left h2).1 h

/-- **Lemma 1, the uncorrected majorant**: `ℓ_w ≤ Φ_d` for all phases as soon as `M` is positive
definite (`d₂ > 0`, `d₂d₃ > ν²`).  This is the case `γ = 0`; it does not need `dᵢ > ν`. -/
theorem majEll_le_majPhi {d2 d3 ν : ℝ} (h2 : 0 < d2) (hΔ : ν ^ 2 < d2 * d3) {f g : ℂ}
    (hf : ‖f‖ = 1) (hg : ‖g‖ = 1) (A B : ℂ) : majEll ν f g A B ≤ majPhi d2 d3 ν A B := by
  have hΔ' : 0 < d2 * d3 - ν ^ 2 := by linarith
  have h := majPhi_sub_majEll hΔ'.ne' hf hg A B
  have hq := maj_form_nonneg h2 hΔ' (A - (d2 * f - ν * g)) (B - (d3 * g - ν * f))
  have : 0 ≤ majPhi d2 d3 ν A B - majEll ν f g A B := by
    rw [h]; exact div_nonneg hq (by positivity)
  linarith

/-! ### Lemma 3: the key inequality -/

/-- **Lemma 3 (the key inequality)**, multiplied by `e₂e₃`: for phases `f, g` and `s ≥ 0`,
`|e₂e₃ H̃| ≤ (σ² + s|δ|) |s − e₂f − e₃g|`, `e₂e₃ H̃ = 2s e₂e₃ (Re f − Re g) + δ(σ² − s²)`.

Proof: with `r = s − e₂f − e₃g`, `a = |f − g|`, `b = |e₂f + e₃g|`: identities (4.1)–(4.2) give
`e₂e₃ H̃ = 2e₂e₃ Re((f − g) r̄) + δ(b² − s²)`; then `|Re((f − g) r̄)| ≤ a|r|`, `|b − s| ≤ |r|`, and
`2e₂e₃ a + |δ| b ≤ 4e₂e₃ + δ²` because `b² = σ² − e₂e₃a²` (4.3) and
`(2e₂e₃(2 − a) + δ²)² − δ²b² = e₂e₃(2 − a)²σ²`. -/
theorem maj_key_bound {e2 e3 s : ℝ} (he2 : 0 < e2) (he3 : 0 < e3) (hs : 0 ≤ s) {f g : ℂ}
    (hf : ‖f‖ = 1) (hg : ‖g‖ = 1) :
    |2 * s * (e2 * e3) * (f.re - g.re) + (e3 - e2) * ((e2 + e3) ^ 2 - s ^ 2)|
      ≤ ((e2 + e3) ^ 2 + s * |e3 - e2|) * ‖(s : ℂ) - e2 * f - e3 * g‖ := by
  have hf2 := re_sq_add_im_sq hf
  have hg2 := re_sq_add_im_sq hg
  obtain ⟨a, ha⟩ : ∃ a : ℝ, a = ‖f - g‖ := ⟨_, rfl⟩
  obtain ⟨b, hb⟩ : ∃ b : ℝ, b = ‖(e2 : ℂ) * f + e3 * g‖ := ⟨_, rfl⟩
  obtain ⟨ρ, hρ⟩ : ∃ ρ : ℝ, ρ = ‖(s : ℂ) - e2 * f - e3 * g‖ := ⟨_, rfl⟩
  obtain ⟨x, hx⟩ : ∃ x : ℝ, x = ((f - g) * conj ((s : ℂ) - e2 * f - e3 * g)).re := ⟨_, rfl⟩
  have hb0 : 0 ≤ b := hb ▸ norm_nonneg _
  have hρ0 : 0 ≤ ρ := hρ ▸ norm_nonneg _
  have ha2 : a ≤ 2 := by
    rw [ha]; exact (norm_sub_le f g).trans (by rw [hf, hg]; norm_num)
  -- (4.3): `a² = 2 − 2 Re(f ḡ)` and `b² = σ² − e₂e₃ a²`
  have haS : a ^ 2 = 2 - 2 * (f.re * g.re + f.im * g.im) := by
    rw [ha, ← Complex.normSq_eq_norm_sq, Complex.normSq_apply, Complex.sub_re, Complex.sub_im]
    linear_combination hf2 + hg2
  have hbS : b ^ 2 = (e2 + e3) ^ 2 - e2 * e3 * a ^ 2 := by
    rw [haS, hb, ← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
    simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im]
    linear_combination e2 ^ 2 * hf2 + e3 ^ 2 * hg2
  -- (4.1)–(4.2): `e₂e₃ H̃ = 2 e₂e₃ x + δ (b² − s²)`, `x = Re((f − g) r̄)`
  have hxe : x = s * (f.re - g.re) + (e3 - e2) * (1 - (f.re * g.re + f.im * g.im)) := by
    rw [hx]
    simp only [Complex.mul_re, Complex.mul_im, Complex.sub_re, Complex.sub_im, Complex.conj_re,
      Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im]
    linear_combination (-e2) * hf2 + e3 * hg2
  have hH : 2 * s * (e2 * e3) * (f.re - g.re) + (e3 - e2) * ((e2 + e3) ^ 2 - s ^ 2)
      = 2 * (e2 * e3) * x + (e3 - e2) * ((b - s) * (b + s)) := by
    have : (b - s) * (b + s) = b ^ 2 - s ^ 2 := by ring
    rw [this, hbS, haS, hxe]; ring
  -- Cauchy–Schwarz and the reverse triangle inequality
  have hxa : |x| ≤ a * ρ := by
    rw [hx, ha, hρ, ← Complex.norm_conj ((s : ℂ) - e2 * f - e3 * g), ← norm_mul]
    exact Complex.abs_re_le_norm _
  have hbs : |b - s| ≤ ρ := by
    have h := abs_norm_sub_norm_le ((e2 : ℂ) * f + e3 * g) (s : ℂ)
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hs, ← hb, ← norm_neg] at h
    rw [hρ]
    convert h using 2
    ring
  -- the one-variable bound
  have h1 : |e3 - e2| * b ≤ 2 * (e2 * e3) * (2 - a) + (e3 - e2) ^ 2 := by
    have hr0 : 0 ≤ 2 * (e2 * e3) * (2 - a) + (e3 - e2) ^ 2 :=
      add_nonneg (mul_nonneg (by positivity) (by linarith)) (sq_nonneg _)
    refine le_of_pow_le_pow_left₀ two_ne_zero hr0 ?_
    have e : (2 * (e2 * e3) * (2 - a) + (e3 - e2) ^ 2) ^ 2 - (|e3 - e2| * b) ^ 2
        = e2 * e3 * (2 - a) ^ 2 * (e2 + e3) ^ 2 := by
      rw [mul_pow, sq_abs, hbS]; ring
    have : 0 ≤ e2 * e3 * (2 - a) ^ 2 * (e2 + e3) ^ 2 := by positivity
    linarith
  rw [hH, ← hρ]
  calc |2 * (e2 * e3) * x + (e3 - e2) * ((b - s) * (b + s))|
      ≤ |2 * (e2 * e3) * x| + |(e3 - e2) * ((b - s) * (b + s))| := abs_add_le _ _
    _ = 2 * (e2 * e3) * |x| + |e3 - e2| * (|b - s| * (b + s)) := by
        rw [abs_mul (2 * (e2 * e3)) x, abs_mul (e3 - e2), abs_mul (b - s),
          abs_of_pos (by positivity : (0 : ℝ) < 2 * (e2 * e3)),
          abs_of_nonneg (by linarith : 0 ≤ b + s)]
    _ ≤ 2 * (e2 * e3) * (a * ρ) + |e3 - e2| * (ρ * (b + s)) := by gcongr
    _ = ρ * (2 * (e2 * e3) * a + |e3 - e2| * b + |e3 - e2| * s) := by ring
    _ ≤ ρ * (2 * (e2 * e3) * 2 + (e3 - e2) ^ 2 + |e3 - e2| * s) :=
        mul_le_mul_of_nonneg_left (by linarith) hρ0
    _ = ((e2 + e3) ^ 2 + s * |e3 - e2|) * ρ := by ring

/-! ### Lemma 2: elimination of `p` -/

/-- **Lemma 2 (elimination of `p`) and the last step of the proof of Theorem 1**, in the variables
`a = Φ_d − ℓ_w`, `h`, `N = |2l − e₂f − e₃g|²`, `W = σp + δl − Δ(f − g)`, `H = e₂e₃ H̃`, `P = e₂e₃`,
`G = e₂e₃ Γ(l)`.  Hypothesis `hA` is the completed square (2.4) (with (1.1), (3.2)),
`2Δσ a = ΔN + |W|²`; `hB` is identity (3.3), `σP h = ΔH + 4lP Re W`; `hcell` is `γ ≤ γ*(l)` and
`hkey` is Lemma 3.  The proof is identity (7.1) multiplied by `2Δσ²P⁴q`, `q = σ − 2γΔl²`:
`2Δσ²P⁴q (a − (γ/16)h²) = σP²Δ (P²qN − (γΔ²/8)H²) + P⁴qσ (Im W)² + (P²q Re W − (γΔ²/2) lP H)²`
(the scalar minimisation (5.3)–(5.4)). -/
theorem maj_completed_square {a h N W1 W2 H σ Δ P γ l G : ℝ} (hσ : 0 < σ) (hΔ : 0 < Δ)
    (hP : 0 < P) (hγ : 0 < γ) (hG : 0 < G) (hN : 0 ≤ N)
    (hA : 2 * Δ * σ * a = Δ * N + W1 ^ 2 + W2 ^ 2)
    (hB : σ * P * h = Δ * H + 4 * l * P * W1)
    (hcell : γ * Δ ^ 2 * G ^ 2 ≤ 8 * P ^ 2 * (σ - 2 * γ * Δ * l ^ 2))
    (hkey : H ^ 2 ≤ G ^ 2 * N) : 0 ≤ a - γ / 16 * h ^ 2 := by
  obtain ⟨q, hq⟩ : ∃ q : ℝ, q = σ - 2 * γ * Δ * l ^ 2 := ⟨_, rfl⟩
  rw [← hq] at hcell
  have hq0 : 0 < q := by
    have h1 : 0 < γ * Δ ^ 2 * G ^ 2 := by positivity
    exact (mul_pos_iff_of_pos_left (by positivity : (0 : ℝ) < 8 * P ^ 2)).1 (h1.trans_le hcell)
  have h1 : γ * Δ ^ 2 * H ^ 2 ≤ 8 * P ^ 2 * q * N :=
    calc γ * Δ ^ 2 * H ^ 2 ≤ γ * Δ ^ 2 * (G ^ 2 * N) :=
          mul_le_mul_of_nonneg_left hkey (by positivity)
      _ = γ * Δ ^ 2 * G ^ 2 * N := by ring
      _ ≤ 8 * P ^ 2 * q * N := mul_le_mul_of_nonneg_right hcell hN
  have e : 2 * Δ * σ ^ 2 * P ^ 4 * q * (a - γ / 16 * h ^ 2)
      = σ * P ^ 2 * Δ * (P ^ 2 * q * N - γ * Δ ^ 2 / 8 * H ^ 2) + P ^ 4 * q * σ * W2 ^ 2
        + (P ^ 2 * q * W1 - γ * Δ ^ 2 / 2 * l * P * H) ^ 2 := by
    rw [hq]
    linear_combination (P ^ 4 * (σ - 2 * γ * Δ * l ^ 2) * σ) * hA
      - (P ^ 2 * (σ - 2 * γ * Δ * l ^ 2) * γ * Δ / 8 * (σ * P * h + Δ * H + 4 * l * P * W1)) * hB
  have h2 : 0 ≤ 2 * Δ * σ ^ 2 * P ^ 4 * q * (a - γ / 16 * h ^ 2) := by
    rw [e]
    have : 0 ≤ P ^ 2 * q * N - γ * Δ ^ 2 / 8 * H ^ 2 := by linarith
    positivity
  exact (mul_nonneg_iff_of_pos_left (by positivity)).1 h2

/-! ### Theorem 1 -/

/-- Theorem 1 for a real `L = l ∈ [0, R]` and `γ > 0`, with `γ ≤ γ*(R)` as the cell condition. -/
private lemma anchored_nu_real {d2 d3 ν R γ l : ℝ} (hν : 0 ≤ ν) (h2 : ν < d2) (h3 : ν < d3)
    (hl : 0 ≤ l) (hlR : l ≤ R) (hγ0 : 0 < γ)
    (hγ : γ * majGammaDen d2 d3 ν R ≤ 8 * (d2 + d3 - 2 * ν) * ((d2 - ν) * (d3 - ν)) ^ 2)
    {f g : ℂ} (hf : ‖f‖ = 1) (hg : ‖g‖ = 1) (p : ℂ) :
    majEll ν f g (l + p) (l - p)
      ≤ majPhi d2 d3 ν (l + p) (l - p) - γ / 16 * majH d2 d3 ν l p ^ 2 := by
  obtain ⟨he2, he3, hΔ⟩ := maj_pos hν h2 h3
  -- Lemma 3 at `s = 2l`
  have hk := maj_key_bound he2 he3 (mul_nonneg zero_le_two hl) hf hg
  rw [show d3 - ν - (d2 - ν) = d3 - d2 by ring,
    show d2 - ν + (d3 - ν) = d2 + d3 - 2 * ν by ring] at hk
  -- the coordinates
  have hN : ‖((2 * l : ℝ) : ℂ) - (d2 - ν : ℝ) * f - (d3 - ν : ℝ) * g‖ ^ 2
      = (2 * l - (d2 - ν) * f.re - (d3 - ν) * g.re) ^ 2
        + ((d2 - ν) * f.im + (d3 - ν) * g.im) ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
    simp only [Complex.sub_re, Complex.sub_im, Complex.mul_re, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im]
    ring
  have hk2 : (2 * (2 * l) * ((d2 - ν) * (d3 - ν)) * (f.re - g.re)
        + (d3 - d2) * ((d2 + d3 - 2 * ν) ^ 2 - (2 * l) ^ 2)) ^ 2
      ≤ ((d2 + d3 - 2 * ν) ^ 2 + 2 * l * |d3 - d2|) ^ 2
        * ((2 * l - (d2 - ν) * f.re - (d3 - ν) * g.re) ^ 2
          + ((d2 - ν) * f.im + (d3 - ν) * g.im) ^ 2) := by
    rw [← hN, ← mul_pow, ← sq_abs]
    exact pow_le_pow_left₀ (abs_nonneg _) hk 2
  -- Lemma 1 and the completed square (2.1)–(2.4), with (3.2)
  have hA : 2 * (d2 * d3 - ν ^ 2) * (d2 + d3 - 2 * ν)
        * (majPhi d2 d3 ν (l + p) (l - p) - majEll ν f g (l + p) (l - p))
      = (d2 * d3 - ν ^ 2) * ((2 * l - (d2 - ν) * f.re - (d3 - ν) * g.re) ^ 2
          + ((d2 - ν) * f.im + (d3 - ν) * g.im) ^ 2)
        + ((d2 + d3 - 2 * ν) * p.re + (d3 - d2) * l - (d2 * d3 - ν ^ 2) * (f.re - g.re)) ^ 2
        + ((d2 + d3 - 2 * ν) * p.im - (d2 * d3 - ν ^ 2) * (f.im - g.im)) ^ 2 := by
    have hΔ' := hΔ.ne'
    rw [majPhi_sub_majEll hΔ' hf hg]
    simp only [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
      Complex.add_re, Complex.add_im, Complex.sub_re, Complex.sub_im, Complex.conj_re,
      Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im]
    field_simp
    ring
  -- identity (3.3)
  have hB : (d2 + d3 - 2 * ν) * ((d2 - ν) * (d3 - ν)) * majH d2 d3 ν l p
      = (d2 * d3 - ν ^ 2) * (2 * (2 * l) * ((d2 - ν) * (d3 - ν)) * (f.re - g.re)
          + (d3 - d2) * ((d2 + d3 - 2 * ν) ^ 2 - (2 * l) ^ 2))
        + 4 * l * ((d2 - ν) * (d3 - ν))
          * ((d2 + d3 - 2 * ν) * p.re + (d3 - d2) * l - (d2 * d3 - ν ^ 2) * (f.re - g.re)) := by
    have he2' := he2.ne'
    have he3' := he3.ne'
    simp only [majH, majC0, majC1, ← Complex.normSq_eq_norm_sq, Complex.normSq_apply,
      Complex.mul_re, Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im]
    field_simp
    ring
  -- `γ ≤ γ*(R)` gives `γ ≤ γ*(l)`
  unfold majGammaDen at hγ
  obtain ⟨σ, hσd⟩ : ∃ σ : ℝ, σ = d2 + d3 - 2 * ν := ⟨_, rfl⟩
  obtain ⟨Δ, hΔd⟩ : ∃ Δ : ℝ, Δ = d2 * d3 - ν ^ 2 := ⟨_, rfl⟩
  obtain ⟨P, hPd⟩ : ∃ P : ℝ, P = (d2 - ν) * (d3 - ν) := ⟨_, rfl⟩
  obtain ⟨δ, hδd⟩ : ∃ δ : ℝ, δ = |d3 - d2| := ⟨_, rfl⟩
  rw [← hσd, ← hΔd] at hA hB
  rw [← hPd] at hB
  rw [← hσd, ← hΔd, ← hPd, ← hδd] at hγ
  rw [← hσd, ← hPd, ← hδd] at hk2
  have hσ : 0 < σ := by rw [hσd]; linarith
  have hΔ0 : 0 < Δ := hΔd ▸ hΔ
  have hP : 0 < P := hPd ▸ mul_pos he2 he3
  have hδ0 : 0 ≤ δ := hδd ▸ abs_nonneg _
  have hG : 0 < σ ^ 2 + 2 * l * δ := add_pos_of_pos_of_nonneg (pow_pos hσ 2) (by positivity)
  have hcell : γ * Δ ^ 2 * (σ ^ 2 + 2 * l * δ) ^ 2 ≤ 8 * P ^ 2 * (σ - 2 * γ * Δ * l ^ 2) := by
    have hG2 : (σ ^ 2 + 2 * l * δ) ^ 2 ≤ (σ ^ 2 + 2 * R * δ) ^ 2 := by gcongr
    have hl2 : l ^ 2 ≤ R ^ 2 := by gcongr
    have h1 : γ * Δ * (Δ * (σ ^ 2 + 2 * l * δ) ^ 2 + 16 * l ^ 2 * P ^ 2)
        ≤ γ * Δ * (Δ * (σ ^ 2 + 2 * R * δ) ^ 2 + 16 * R ^ 2 * P ^ 2) := by gcongr
    linarith
  have := maj_completed_square hσ hΔ0 hP hγ0 hG (by positivity) hA hB hcell hk2
  linarith

/-- Rotation invariance of `ℓ_w`. -/
lemma majEll_mul_unit (ν : ℝ) (f g A B : ℂ) {v : ℂ} (hv : ‖v‖ = 1) :
    majEll ν (f * v) (g * v) (A * v) (B * v) = majEll ν f g A B := by
  have hvv : conj v * v = 1 := by rw [Complex.conj_mul', hv]; norm_num
  have t1 : conj (f * v) * (A * v) = conj f * A := by
    rw [map_mul]; linear_combination (conj f * A) * hvv
  have t2 : conj (g * v) * (B * v) = conj g * B := by
    rw [map_mul]; linear_combination (conj g * B) * hvv
  have t3 : conj (f * v) * (g * v) = conj f * g := by
    rw [map_mul]; linear_combination (conj f * g) * hvv
  rw [majEll, t1, t2, t3, majEll]

/-- Rotation invariance of `Φ_d`. -/
lemma majPhi_mul_unit (d2 d3 ν : ℝ) (A B : ℂ) {v : ℂ} (hv : ‖v‖ = 1) :
    majPhi d2 d3 ν (A * v) (B * v) = majPhi d2 d3 ν A B := by
  have hvv : v * conj v = 1 := by rw [Complex.mul_conj', hv]; norm_num
  have t : A * v * conj (B * v) = A * conj B := by
    rw [map_mul]; linear_combination (A * conj B) * hvv
  rw [majPhi, t, norm_mul, norm_mul, hv, mul_one, mul_one, majPhi]

/-- Rotation invariance of `h`. -/
lemma majH_mul_unit (d2 d3 ν : ℝ) (L p : ℂ) {v : ℂ} (hv : ‖v‖ = 1) :
    majH d2 d3 ν (L * v) (p * v) = majH d2 d3 ν L p := by
  have hvv : v * conj v = 1 := by rw [Complex.mul_conj', hv]; norm_num
  have t : p * v * conj (L * v) = p * conj L := by
    rw [map_mul]; linear_combination (p * conj L) * hvv
  rw [majH, t, norm_mul, hv, mul_one, majH]

/-- **The anchored-pair majorant with a tail `ν`** (Theorem 1): for `ν ≥ 0`, prices `d₂, d₃ > ν`,
`|L| ≤ R`, `0 ≤ γ ≤ γ*(R)`, every `p` and all phases `|f| = |g| = 1`,

  `Re(f̄(L + p)) + Re(ḡ(L − p)) + ν Re(f̄g) ≤ Φ_d(L + p, L − p) − (γ/16)(4 Re(p L̄) − c₀ − c₁|L|²)²`.

At `ν = 0` this is AF eq. (4) (`anchored_real`, `anchored_pair`). -/
theorem anchored_pair_nu (L p : ℂ) {f g : ℂ} {d2 d3 ν R γ : ℝ} (hν : 0 ≤ ν) (h2 : ν < d2)
    (h3 : ν < d3) (hR : ‖L‖ ≤ R) (hγ0 : 0 ≤ γ) (hγ : γ ≤ majGammaStar d2 d3 ν R)
    (hf : ‖f‖ = 1) (hg : ‖g‖ = 1) :
    majEll ν f g (L + p) (L - p)
      ≤ majPhi d2 d3 ν (L + p) (L - p) - γ / 16 * majH d2 d3 ν L p ^ 2 := by
  rcases hγ0.eq_or_lt with rfl | hγpos
  · -- `γ = 0`: Lemma 1
    obtain ⟨-, -, hΔ⟩ := maj_pos hν h2 h3
    have hΔ' : ν ^ 2 < d2 * d3 := by linarith
    have h := majEll_le_majPhi (hν.trans_lt h2) hΔ' hf hg (L + p) (L - p)
    simpa using h
  · -- `γ > 0`: rotate `L` to `|L|`
    have hcell := (le_majGammaStar_iff hν h2 h3 ((norm_nonneg L).trans hR)).1 hγ
    obtain ⟨u, hu, hL⟩ := Complex.exists_norm_mul_eq_self L
    have hcu : ‖conj u‖ = 1 := by rw [Complex.norm_conj, hu]
    have huu : u * conj u = 1 := by rw [Complex.mul_conj', hu]; norm_num
    have hLu : L * conj u = (‖L‖ : ℂ) := by
      linear_combination (‖L‖ : ℂ) * huu - conj u * hL
    have key := anchored_nu_real hν h2 h3 (norm_nonneg L) hR hγpos hcell
      (by rw [norm_mul, hf, hcu, mul_one] : ‖f * conj u‖ = 1)
      (by rw [norm_mul, hg, hcu, mul_one] : ‖g * conj u‖ = 1) (p * conj u)
    have e1 := majEll_mul_unit ν f g (L + p) (L - p) hcu
    have e2 := majPhi_mul_unit d2 d3 ν (L + p) (L - p) hcu
    have e3 := majH_mul_unit d2 d3 ν L p hcu
    rw [add_mul, sub_mul, hLu] at e1 e2
    rw [hLu] at e3
    rw [e1, e2, e3] at key
    exact key

/-! ### The case `ν = 0`: AF eq. (4) -/

/-- The denominator `D = S(S² + 4R² + 4R|A₀ − B₀|)`. -/
noncomputable def majD (A0 B0 R : ℝ) : ℝ :=
  (A0 + B0) * ((A0 + B0) ^ 2 + 4 * R ^ 2 + 4 * R * |A0 - B0|)

lemma majD_pos {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : 0 ≤ R) : 0 < majD A0 B0 R := by
  unfold majD
  have : 0 ≤ 4 * R * |A0 - B0| := by have := abs_nonneg (A0 - B0); positivity
  have : 0 < (A0 + B0) ^ 2 := by positivity
  have : 0 < A0 + B0 := by linarith
  positivity

/-- At `ν = 0` the denominator of `γ*(R)` is `(A₀B₀)² S D`. -/
lemma majGammaDen_zero (A0 B0 R : ℝ) :
    majGammaDen A0 B0 0 R = (A0 * B0) ^ 2 * ((A0 + B0) * majD A0 B0 R) := by
  have h := sq_abs (B0 - A0)
  rw [majGammaDen, majD, abs_sub_comm A0 B0]
  linear_combination (4 * (A0 * B0) ^ 2 * R ^ 2) * h

/-- At `ν = 0`, `γ*(R) = 8/D` is the coefficient of AF eq. (4) (identity (6.3)). -/
lemma majGammaStar_zero {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : 0 ≤ R) :
    majGammaStar A0 B0 0 R = 8 / majD A0 B0 R := by
  have hD := (majD_pos hA hB hR).ne'
  rw [majGammaStar, majGammaDen_zero]
  field_simp
  ring

/-- **The anchored majorant, real form** (AF eq. (4)): `anchored_pair_nu` at `ν = 0` and
`γ = γ*(R) = 8/D`, for the real `L = (A − B)/2`, `p = (A + B)/2` and the phases `(1, −1)`. -/
theorem anchored_real {A B A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : 0 ≤ R)
    (hd : |A - B| ≤ 2 * R) :
    A + B ≤ (A ^ 2 + A0 ^ 2) / (2 * A0) + (B ^ 2 + B0 ^ 2) / (2 * B0)
      - (A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
  have hD := majD_pos hA hB hR
  have hL : ‖(((A - B) / 2 : ℝ) : ℂ)‖ ≤ R := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_div, abs_two]; linarith
  have h := anchored_pair_nu (((A - B) / 2 : ℝ) : ℂ) (((A + B) / 2 : ℝ) : ℂ) (f := 1) (g := -1)
    le_rfl hA hB hL (div_nonneg (by norm_num) hD.le) (majGammaStar_zero hA hB hR).ge
    (by simp) (by simp)
  have e1 : (((A - B) / 2 : ℝ) : ℂ) + (((A + B) / 2 : ℝ) : ℂ) = (A : ℂ) := by push_cast; ring
  have e2 : (((A - B) / 2 : ℝ) : ℂ) - (((A + B) / 2 : ℝ) : ℂ) = ((-B : ℝ) : ℂ) := by
    push_cast; ring
  have e3 : majEll 0 1 (-1) (A : ℂ) ((-B : ℝ) : ℂ) = A + B := by simp [majEll]
  have e4 : majPhi A0 B0 0 (A : ℂ) ((-B : ℝ) : ℂ)
      = (A ^ 2 + A0 ^ 2) / (2 * A0) + (B ^ 2 + B0 ^ 2) / (2 * B0) := by
    rw [majPhi, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs, Real.norm_eq_abs,
      abs_neg, sq_abs, sq_abs]
    field_simp; ring
  have e5 : majH A0 B0 0 (((A - B) / 2 : ℝ) : ℂ) (((A + B) / 2 : ℝ) : ℂ)
      = A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2) := by
    rw [majH, majC0, majC1, Complex.conj_ofReal, ← Complex.ofReal_mul, Complex.ofReal_re]; ring
  have e6 : 8 / majD A0 B0 R / 16 * (A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2)) ^ 2
      = (A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
    field_simp; ring
  rw [e1, e2, e3, e4, e5, e6] at h
  exact h

lemma norm_add_sub_norm_sub_le (L p : ℂ) : |‖L + p‖ - ‖L - p‖| ≤ 2 * ‖L‖ := by
  calc |‖L + p‖ - ‖L - p‖| = |‖L + p‖ - ‖p - L‖| := by rw [norm_sub_rev L p]
    _ ≤ ‖L + p - (p - L)‖ := abs_norm_sub_norm_le _ _
    _ = 2 * ‖L‖ := by rw [show L + p - (p - L) = 2 * L by ring, norm_mul]; norm_num

lemma normSq_add_eq (L p : ℂ) : ‖L + p‖ ^ 2 = ‖L‖ ^ 2 + ‖p‖ ^ 2 + 2 * (p * conj L).re := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq,
    Complex.normSq_add]
  simp [Complex.mul_re]; ring

lemma normSq_sub_eq (L p : ℂ) : ‖L - p‖ ^ 2 = ‖L‖ ^ 2 + ‖p‖ ^ 2 - 2 * (p * conj L).re := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq,
    Complex.normSq_sub]
  simp [Complex.mul_re]; ring

/-- **The anchored-pair majorant** (AF eq. (4)). -/
theorem anchored_pair (L p : ℂ) {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : ‖L‖ ≤ R) :
    ‖L + p‖ + ‖L - p‖ ≤ (‖L + p‖ ^ 2 + A0 ^ 2) / (2 * A0) + (‖L - p‖ ^ 2 + B0 ^ 2) / (2 * B0)
      - (4 * (p * conj L).re - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
  have hT : ‖L + p‖ ^ 2 - ‖L - p‖ ^ 2 = 4 * (p * conj L).re := by
    rw [normSq_add_eq, normSq_sub_eq]; ring
  have h := anchored_real hA hB ((norm_nonneg L).trans hR)
    ((norm_add_sub_norm_sub_le L p).trans (by linarith))
  rwa [hT] at h

/-- **The anchored-pair majorant as a polynomial in `p`**: with `x = Re(p L̄)`,
`|L + p| + |L − p| ≤ ν(|L|² + |p|²) + 2δν x + (A₀ + B₀)/2 − (4x − (A₀² − B₀²))²/(2D)`,
`ν = (1/A₀ + 1/B₀)/2`, `δν = (1/A₀ − 1/B₀)/2`. -/
theorem anchored_pair_poly (L p : ℂ) {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : ‖L‖ ≤ R) :
    ‖L + p‖ + ‖L - p‖ ≤ (1 / A0 + 1 / B0) / 2 * (‖L‖ ^ 2 + ‖p‖ ^ 2)
      + 2 * ((1 / A0 - 1 / B0) / 2) * (p * conj L).re + (A0 + B0) / 2
      - (4 * (p * conj L).re - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
  have h := anchored_pair L p hA hB hR
  rw [normSq_add_eq, normSq_sub_eq] at h
  have e : (‖L‖ ^ 2 + ‖p‖ ^ 2 + 2 * (p * conj L).re + A0 ^ 2) / (2 * A0)
      + (‖L‖ ^ 2 + ‖p‖ ^ 2 - 2 * (p * conj L).re + B0 ^ 2) / (2 * B0)
      = (1 / A0 + 1 / B0) / 2 * (‖L‖ ^ 2 + ‖p‖ ^ 2)
        + 2 * ((1 / A0 - 1 / B0) / 2) * (p * conj L).re + (A0 + B0) / 2 := by
    field_simp; ring
  linarith

/-- **The plain Young bound** (route P): `|L + p| + |L − p| ≤ ν(|L|² + |p|²) + 2δν Re(p L̄) + (A₀+B₀)/2`. -/
theorem young_pair (L p : ℂ) {A0 B0 : ℝ} (hA : 0 < A0) (hB : 0 < B0) :
    ‖L + p‖ + ‖L - p‖ ≤ (1 / A0 + 1 / B0) / 2 * (‖L‖ ^ 2 + ‖p‖ ^ 2)
      + 2 * ((1 / A0 - 1 / B0) / 2) * (p * conj L).re + (A0 + B0) / 2 := by
  have h := anchored_pair_poly L p hA hB le_rfl
  have : 0 ≤ (4 * (p * conj L).re - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 ‖L‖) :=
    div_nonneg (sq_nonneg _) (by have := majD_pos hA hB (norm_nonneg L); positivity)
  linarith

/-! ### The pair potential `Ψ_ν` -/

/-- `Re(f̄ w) ≤ |w|` for `|f| ≤ 1`. -/
lemma re_conj_mul_le_norm {f : ℂ} (hf : ‖f‖ ≤ 1) (w : ℂ) : (conj f * w).re ≤ ‖w‖ := by
  refine (Complex.re_le_norm _).trans ?_
  rw [norm_mul, Complex.norm_conj]
  exact mul_le_of_le_one_left (norm_nonneg _) hf

/-- `|ν Re(f̄ g)| ≤ |ν|` on the closed unit disc. -/
lemma abs_mul_re_conj_mul_le (ν : ℝ) {f g : ℂ} (hf : ‖f‖ ≤ 1) (hg : ‖g‖ ≤ 1) :
    |ν * (conj f * g).re| ≤ |ν| := by
  have h : |(conj f * g).re| ≤ 1 := by
    refine (Complex.abs_re_le_norm _).trans ?_
    rw [norm_mul, Complex.norm_conj]
    exact (mul_le_mul hf hg (norm_nonneg _) zero_le_one).trans_eq (one_mul 1)
  rw [abs_mul]
  exact mul_le_of_le_one_right (abs_nonneg _) h

/-- Every `w` has a phase: `|f| = 1` and `Re(f̄ w) = |w|`. -/
lemma exists_unit_re_conj_mul (w : ℂ) : ∃ f : ℂ, ‖f‖ = 1 ∧ (conj f * w).re = ‖w‖ := by
  obtain ⟨u, hu, hw⟩ := Complex.exists_norm_mul_eq_self w
  have huu : conj u * u = 1 := by rw [Complex.conj_mul', hu]; norm_num
  have e : conj u * w = (‖w‖ : ℂ) := by linear_combination (‖w‖ : ℂ) * huu - conj u * hw
  exact ⟨u, hu, by rw [e, Complex.ofReal_re]⟩

/-- An affine piece is at most `|A| + |B| + |ν|` (for `f`, `g` of the closed unit disc). -/
lemma majEll_le_add (ν : ℝ) {f g : ℂ} (hf : ‖f‖ ≤ 1) (hg : ‖g‖ ≤ 1) (A B : ℂ) :
    majEll ν f g A B ≤ ‖A‖ + ‖B‖ + |ν| := by
  unfold majEll
  linarith [re_conj_mul_le_norm hf A, re_conj_mul_le_norm hg B,
    (le_abs_self _).trans (abs_mul_re_conj_mul_le ν hf hg)]

/-- **The pair potential with a tail**: `Ψ_ν(A, B) = sup_{|f| = |g| = 1} ℓ_w(A, B)`, the supremum
of the affine pieces `Re(f̄A) + Re(ḡB) + ν Re(f̄g)` over the phases. -/
noncomputable def psiT (ν : ℝ) (A B : ℂ) : ℝ :=
  ⨆ w : {w : ℂ × ℂ // ‖w.1‖ = 1 ∧ ‖w.2‖ = 1}, majEll ν w.1.1 w.1.2 A B

/-- Every affine piece is below `Ψ_ν`. -/
lemma majEll_le_psiT (ν : ℝ) {f g : ℂ} (hf : ‖f‖ = 1) (hg : ‖g‖ = 1) (A B : ℂ) :
    majEll ν f g A B ≤ psiT ν A B :=
  le_ciSup (f := fun w : {w : ℂ × ℂ // ‖w.1‖ = 1 ∧ ‖w.2‖ = 1} => majEll ν w.1.1 w.1.2 A B)
    ⟨‖A‖ + ‖B‖ + |ν|, by rintro _ ⟨w, rfl⟩; exact majEll_le_add ν w.2.1.le w.2.2.le A B⟩
    ⟨(f, g), hf, hg⟩

/-- A bound of every affine piece is a bound of `Ψ_ν`. -/
lemma psiT_le {ν : ℝ} {A B : ℂ} {c : ℝ}
    (h : ∀ f g : ℂ, ‖f‖ = 1 → ‖g‖ = 1 → majEll ν f g A B ≤ c) : psiT ν A B ≤ c := by
  have : Nonempty {w : ℂ × ℂ // ‖w.1‖ = 1 ∧ ‖w.2‖ = 1} := ⟨⟨(1, 1), by simp⟩⟩
  exact ciSup_le fun w => h _ _ w.2.1 w.2.2

/-- `Ψ_ν(A, B) ≤ |A| + |B| + |ν|`. -/
lemma psiT_le_add (ν : ℝ) (A B : ℂ) : psiT ν A B ≤ ‖A‖ + ‖B‖ + |ν| :=
  psiT_le fun _ _ hf hg => majEll_le_add ν hf.le hg.le A B

/-- `|A| + |B| − |ν| ≤ Ψ_ν(A, B)` (the phases of `A` and `B`). -/
lemma add_le_psiT (ν : ℝ) (A B : ℂ) : ‖A‖ + ‖B‖ - |ν| ≤ psiT ν A B := by
  obtain ⟨f, hf, hfA⟩ := exists_unit_re_conj_mul A
  obtain ⟨g, hg, hgB⟩ := exists_unit_re_conj_mul B
  refine le_trans ?_ (majEll_le_psiT ν hf hg A B)
  rw [majEll, hfA, hgB]
  linarith [(neg_abs_le _).trans' (neg_le_neg (abs_mul_re_conj_mul_le ν hf.le hg.le))]

/-- **Without a tail** the pair potential is `|A| + |B|`. -/
lemma psiT_zero (A B : ℂ) : psiT 0 A B = ‖A‖ + ‖B‖ :=
  le_antisymm ((psiT_le_add 0 A B).trans_eq (by simp)) ((add_le_psiT 0 A B).trans_eq' (by simp))

lemma majEll_swap (ν : ℝ) (f g A B : ℂ) : majEll ν g f B A = majEll ν f g A B := by
  simp only [majEll, Complex.mul_re, Complex.conj_re, Complex.conj_im]; ring

/-- `Ψ_ν` is symmetric. -/
lemma psiT_comm (ν : ℝ) (A B : ℂ) : psiT ν B A = psiT ν A B := by
  refine le_antisymm (psiT_le fun f g hf hg => ?_) (psiT_le fun f g hf hg => ?_) <;>
  · rw [majEll_swap]; exact majEll_le_psiT ν hg hf _ _

lemma majEll_conj (ν : ℝ) (f g A B : ℂ) :
    majEll ν (conj f) (conj g) (conj A) (conj B) = majEll ν f g A B := by
  simp only [majEll, Complex.mul_re, Complex.conj_re, Complex.conj_im]; ring

/-- `Ψ_ν(Ā, B̄) = Ψ_ν(A, B)`. -/
lemma psiT_conj (ν : ℝ) (A B : ℂ) : psiT ν (conj A) (conj B) = psiT ν A B := by
  refine le_antisymm (psiT_le fun f g hf hg => ?_) (psiT_le fun f g hf hg => ?_)
  · have e := majEll_conj ν (conj f) (conj g) A B
    rw [Complex.conj_conj, Complex.conj_conj] at e
    rw [e]
    exact majEll_le_psiT ν ((Complex.norm_conj f).trans hf) ((Complex.norm_conj g).trans hg) A B
  · rw [← majEll_conj]
    exact majEll_le_psiT ν ((Complex.norm_conj f).trans hf) ((Complex.norm_conj g).trans hg) _ _

/-- Rotation invariance of `Ψ_ν`. -/
lemma psiT_mul_unit (ν : ℝ) (A B : ℂ) {v : ℂ} (hv : ‖v‖ = 1) :
    psiT ν (A * v) (B * v) = psiT ν A B := by
  have hv' : ‖conj v‖ = 1 := (Complex.norm_conj v).trans hv
  have hvv : conj v * v = 1 := by rw [Complex.conj_mul', hv]; norm_num
  refine le_antisymm (psiT_le fun f g hf hg => ?_) (psiT_le fun f g hf hg => ?_)
  · have e := majEll_mul_unit ν (f * conj v) (g * conj v) A B hv
    rw [mul_assoc, mul_assoc, hvv, mul_one, mul_one] at e
    rw [e]
    exact majEll_le_psiT ν (by rw [norm_mul, hf, hv', mul_one]) (by rw [norm_mul, hg, hv', mul_one])
      A B
  · rw [← majEll_mul_unit ν f g A B hv]
    exact majEll_le_psiT ν (by rw [norm_mul, hf, hv, mul_one]) (by rw [norm_mul, hg, hv, mul_one])
      _ _

/-- `Ψ_ν(−A, −B) = Ψ_ν(A, B)`. -/
lemma psiT_neg (ν : ℝ) (A B : ℂ) : psiT ν (-A) (-B) = psiT ν A B := by
  simpa using psiT_mul_unit ν A B (v := -1) (by simp)

/-- `Ψ_ν` is `1`-Lipschitz in each argument. -/
lemma psiT_le_add_norm (ν : ℝ) (A B A' B' : ℂ) :
    psiT ν A B ≤ psiT ν A' B' + ‖A - A'‖ + ‖B - B'‖ :=
  psiT_le fun f g hf hg => by
    have e : majEll ν f g A B
        = majEll ν f g A' B' + (conj f * (A - A')).re + (conj g * (B - B')).re := by
      simp only [majEll, mul_sub, Complex.sub_re]; ring
    rw [e]
    linarith [majEll_le_psiT ν hf hg A' B', re_conj_mul_le_norm hf.le (A - A'),
      re_conj_mul_le_norm hg.le (B - B')]

/-- **`Ψ_ν` is convex** (a supremum of affine functions of `(A, B)`). -/
lemma psiT_convex (ν : ℝ) {θ : ℝ} (h0 : 0 ≤ θ) (h1 : θ ≤ 1) (A B A' B' : ℂ) :
    psiT ν ((θ : ℂ) * A + ((1 - θ : ℝ) : ℂ) * A') ((θ : ℂ) * B + ((1 - θ : ℝ) : ℂ) * B')
      ≤ θ * psiT ν A B + (1 - θ) * psiT ν A' B' :=
  psiT_le fun f g hf hg => by
    have e : majEll ν f g ((θ : ℂ) * A + ((1 - θ : ℝ) : ℂ) * A')
        ((θ : ℂ) * B + ((1 - θ : ℝ) : ℂ) * B')
        = θ * majEll ν f g A B + (1 - θ) * majEll ν f g A' B' := by
      simp only [majEll, Complex.mul_re, Complex.mul_im, Complex.add_re, Complex.add_im,
        Complex.ofReal_re, Complex.ofReal_im, Complex.conj_re, Complex.conj_im]
      ring
    rw [e]
    have := mul_le_mul_of_nonneg_left (majEll_le_psiT ν hf hg A B) h0
    have := mul_le_mul_of_nonneg_left (majEll_le_psiT ν hf hg A' B') (by linarith : 0 ≤ 1 - θ)
    linarith

/-- `Ψ_ν` is continuous. -/
lemma continuous_psiT (ν : ℝ) : Continuous fun w : ℂ × ℂ => psiT ν w.1 w.2 := by
  refine (LipschitzWith.of_dist_le_mul (K := 2) fun x y => ?_).continuous
  have d1 : ‖x.1 - y.1‖ ≤ dist x y := by
    rw [← dist_eq_norm, Prod.dist_eq]; exact le_max_left _ _
  have d2 : ‖x.2 - y.2‖ ≤ dist x y := by
    rw [← dist_eq_norm, Prod.dist_eq]; exact le_max_right _ _
  have h1 := psiT_le_add_norm ν x.1 x.2 y.1 y.2
  have h2 := psiT_le_add_norm ν y.1 y.2 x.1 x.2
  rw [norm_sub_rev y.1, norm_sub_rev y.2] at h2
  rw [Real.dist_eq, abs_sub_le_iff]
  push_cast
  constructor <;> linarith

end Grothe.LowerAnalytic
