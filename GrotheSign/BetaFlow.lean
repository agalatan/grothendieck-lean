import GrotheSign.Basic
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Finite beta multipliers and preservation for triangular coefficient flows

The integrating factor for the diagonal coefficient `-harmonicGenerator k c` is the finite
Pochhammer product `(c)_k`. The preservation results below state the derivative and forcing
hypotheses explicitly; identifying a particular inverse-series flow with these hypotheses is a
separate step. No existence theorem for an infinite system is used.

Proof implementation: codex-1a87. Refs #365.
-/

set_option warningAsError true

namespace GrotheSign

open Finset Set

/-- The finite harmonic generator of a beta multiplier. -/
noncomputable def harmonicGenerator (k : ℕ) (c : ℝ) : ℝ :=
  ∑ j ∈ Finset.range k, 1 / (c + j)

/-- The positive integrating factor `(c)_k`. -/
noncomputable def betaPochhammer (k : ℕ) (c : ℝ) : ℝ :=
  (ascPochhammer ℝ k).eval c

/-- The coefficient multiplier transporting the initial parameter `c₀` to `c`. -/
noncomputable def betaMultiplier (c₀ : ℝ) (k : ℕ) (c : ℝ) : ℝ :=
  betaPochhammer k c₀ / betaPochhammer k c

@[simp] theorem harmonicGenerator_zero (c : ℝ) : harmonicGenerator 0 c = 0 := by
  simp [harmonicGenerator]

theorem harmonicGenerator_succ (k : ℕ) (c : ℝ) :
    harmonicGenerator (k + 1) c = harmonicGenerator k c + 1 / (c + k) := by
  simp [harmonicGenerator, Finset.sum_range_succ]

@[simp] theorem betaPochhammer_zero (c : ℝ) : betaPochhammer 0 c = 1 := by
  simp [betaPochhammer]

theorem betaPochhammer_succ (k : ℕ) (c : ℝ) :
    betaPochhammer (k + 1) c = betaPochhammer k c * (c + k) :=
  ascPochhammer_succ_eval k c

theorem betaPochhammer_pos (k : ℕ) {c : ℝ} (hc : 0 < c) : 0 < betaPochhammer k c :=
  ascPochhammer_pos k c hc

/-- Logarithmic differentiation of the finite Pochhammer product. -/
theorem hasDerivAt_betaPochhammer (k : ℕ) {c : ℝ} (hc : 0 < c) :
    HasDerivAt (betaPochhammer k) (betaPochhammer k c * harmonicGenerator k c) c := by
  induction k with
  | zero =>
    have hfun : betaPochhammer 0 = fun _ : ℝ ↦ (1 : ℝ) := by
      funext x
      exact betaPochhammer_zero x
    rw [hfun, harmonicGenerator_zero, mul_zero]
    exact hasDerivAt_const c (1 : ℝ)
  | succ k ih =>
    have hck : c + (k : ℝ) ≠ 0 := ne_of_gt (add_pos_of_pos_of_nonneg hc (Nat.cast_nonneg k))
    have hd := ih.mul ((hasDerivAt_id c).add_const (k : ℝ))
    have he : betaPochhammer k c * harmonicGenerator k c * (c + k) +
        betaPochhammer k c * 1 =
        betaPochhammer (k + 1) c * harmonicGenerator (k + 1) c := by
      rw [betaPochhammer_succ, harmonicGenerator_succ]
      field_simp [hck]
    have hd' : HasDerivAt (fun x : ℝ ↦ betaPochhammer k x * (x + (k : ℝ)))
        (betaPochhammer (k + 1) c * harmonicGenerator (k + 1) c) c := hd.congr_deriv he
    simpa only [← betaPochhammer_succ] using hd'

/-- The exact derivative of each finite beta multiplier. -/
theorem hasDerivAt_betaMultiplier (c₀ : ℝ) (k : ℕ) {c : ℝ} (hc : 0 < c) :
    HasDerivAt (betaMultiplier c₀ k)
      (-harmonicGenerator k c * betaMultiplier c₀ k c) c := by
  have hpc : betaPochhammer k c ≠ 0 := (betaPochhammer_pos k hc).ne'
  have hd := (hasDerivAt_const c (betaPochhammer k c₀)).div
    (hasDerivAt_betaPochhammer k hc) hpc
  have he : (0 * betaPochhammer k c -
      betaPochhammer k c₀ * (betaPochhammer k c * harmonicGenerator k c)) /
      betaPochhammer k c ^ 2 = -harmonicGenerator k c * betaMultiplier c₀ k c := by
    unfold betaMultiplier
    field_simp [hpc]
    ring
  exact hd.congr_deriv he

/-- Multiplying the scalar equation by `(c)_k` cancels its diagonal term. -/
theorem hasDerivAt_betaPochhammer_mul (k : ℕ) {c : ℝ} (hc : 0 < c)
    {p : ℝ → ℝ} {f : ℝ}
    (hp : HasDerivAt p (-harmonicGenerator k c * p c + f) c) :
    HasDerivAt (fun x ↦ betaPochhammer k x * p x) (betaPochhammer k c * f) c := by
  exact ((hasDerivAt_betaPochhammer k hc).mul hp).congr_deriv (by ring)

/-- Nonnegative forcing makes the Pochhammer-weighted solution nondecreasing. -/
theorem monotoneOn_betaPochhammer_mul (k : ℕ) {c₀ c₁ : ℝ} (hc₀ : 0 < c₀)
    {p f : ℝ → ℝ}
    (hd : ∀ c ∈ Icc c₀ c₁,
      HasDerivAt p (-harmonicGenerator k c * p c + f c) c)
    (hf : ∀ c ∈ Icc c₀ c₁, 0 ≤ f c) :
    MonotoneOn (fun c ↦ betaPochhammer k c * p c) (Icc c₀ c₁) := by
  have hw (c : ℝ) (hc : c ∈ Icc c₀ c₁) :=
    hasDerivAt_betaPochhammer_mul k (hc₀.trans_le hc.1) (hd c hc)
  apply monotoneOn_of_hasDerivWithinAt_nonneg (convex_Icc c₀ c₁)
    (fun c hc ↦ (hw c hc).continuousAt.continuousWithinAt)
    (fun c hc ↦ (hw c (interior_subset hc)).hasDerivWithinAt)
  intro c hc
  exact mul_nonneg (betaPochhammer_pos k (hc₀.trans_le (interior_subset hc).1)).le
    (hf c (interior_subset hc))

/-- A scalar beta-flow equation preserves a nonnegative initial value. -/
theorem nonneg_of_beta_ode (k : ℕ) {c₀ c₁ : ℝ} (hc₀ : 0 < c₀) (hc₁ : c₀ ≤ c₁)
    {p f : ℝ → ℝ} (hp₀ : 0 ≤ p c₀)
    (hd : ∀ c ∈ Icc c₀ c₁,
      HasDerivAt p (-harmonicGenerator k c * p c + f c) c)
    (hf : ∀ c ∈ Icc c₀ c₁, 0 ≤ f c) : 0 ≤ p c₁ := by
  have hm := monotoneOn_betaPochhammer_mul k hc₀ hd hf
  have hw : 0 ≤ betaPochhammer k c₁ * p c₁ :=
    (mul_nonneg (betaPochhammer_pos k hc₀).le hp₀).trans
      (hm ⟨le_rfl, hc₁⟩ ⟨hc₁, le_rfl⟩ hc₁)
  exact nonneg_of_mul_nonneg_right hw (betaPochhammer_pos k (hc₀.trans_le hc₁))

/-- Strictly positive interior forcing yields a strictly positive value after the initial time. -/
theorem pos_of_beta_ode (k : ℕ) {c₀ c₁ : ℝ} (hc₀ : 0 < c₀) (hc₁ : c₀ < c₁)
    {p f : ℝ → ℝ} (hp₀ : 0 ≤ p c₀)
    (hd : ∀ c ∈ Icc c₀ c₁,
      HasDerivAt p (-harmonicGenerator k c * p c + f c) c)
    (hf : ∀ c ∈ Ioo c₀ c₁, 0 < f c) : 0 < p c₁ := by
  have hw (c : ℝ) (hc : c ∈ Icc c₀ c₁) :=
    hasDerivAt_betaPochhammer_mul k (hc₀.trans_le hc.1) (hd c hc)
  have hm : StrictMonoOn (fun c ↦ betaPochhammer k c * p c) (Icc c₀ c₁) := by
    apply strictMonoOn_of_hasDerivWithinAt_pos (convex_Icc c₀ c₁)
      (fun c hc ↦ (hw c hc).continuousAt.continuousWithinAt)
      (fun c hc ↦ (hw c (interior_subset hc)).hasDerivWithinAt)
    intro c hc
    exact mul_pos (betaPochhammer_pos k (hc₀.trans_le (interior_subset hc).1))
      (hf c (by simpa only [interior_Icc] using hc))
  have hpos : 0 < betaPochhammer k c₁ * p c₁ :=
    (mul_nonneg (betaPochhammer_pos k hc₀).le hp₀).trans_lt
      (hm ⟨le_rfl, hc₁.le⟩ ⟨hc₁.le, le_rfl⟩ hc₁)
  exact pos_of_mul_pos_right hpos (betaPochhammer_pos k (hc₀.trans_le hc₁.le)).le

/-- Triangular beta-flow preservation, with only the positive-index initial values assumed.
The forcing hypothesis refers only to the lower positive indices at the same parameter. -/
theorem triangular_beta_ode_nonneg (p f : ℕ → ℝ → ℝ) {c₀ : ℝ} (hc₀ : 0 < c₀)
    (hp₀ : ∀ k, 1 ≤ k → 0 ≤ p k c₀)
    (hd : ∀ k, 1 ≤ k → ∀ c, c₀ ≤ c →
      HasDerivAt (p k) (-harmonicGenerator k c * p k c + f k c) c)
    (hf : ∀ k, 1 ≤ k → ∀ c, c₀ ≤ c →
      (∀ i, 1 ≤ i → i < k → 0 ≤ p i c) → 0 ≤ f k c) :
    ∀ k, 1 ≤ k → ∀ c, c₀ ≤ c → 0 ≤ p k c := by
  intro k
  induction k using Nat.strong_induction_on with
  | h k ih =>
    intro hk c hc
    apply nonneg_of_beta_ode k hc₀ hc (hp₀ k hk)
    · intro x hx
      exact hd k hk x hx.1
    · intro x hx
      exact hf k hk x hx.1 (fun i hi hik ↦ ih i hik hi x hx.1)

end GrotheSign
