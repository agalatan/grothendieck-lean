import Mathlib

/-!
# Joint convexity and argument allocation

The physical potential minus `2β²/ε` is a supremum of functions jointly affine in the
parameters `(M, ℓ, β, ω)`, hence jointly convex.  Convexity then allows averaging two
profiles while splitting the scalar argument with arbitrary nonnegative scales
`λ₁, λ₂` satisfying `wλ₁ + (1−w)λ₂ = d`, and the convexity of `β ↦ β²` produces the exact
penalty `g = 2w(1−w)(β₁−β₂)²/ε`.
-/

namespace Grothe.LowerAnalytic

open Set

/-- A pointwise supremum of convex functions (bounded above at every point) is convex. -/
theorem convexOn_ciSup {P : Type*} [AddCommGroup P] [Module ℝ P] {ι : Type*} [Nonempty ι]
    (f : ι → P → ℝ) (hf : ∀ i, ConvexOn ℝ univ (f i))
    (hb : ∀ x, BddAbove (range fun i => f i x)) :
    ConvexOn ℝ univ (fun x => ⨆ i, f i x) := by
  refine ⟨convex_univ, fun x _ y _ a b ha hb' hab => ?_⟩
  simp only [smul_eq_mul]
  apply ciSup_le
  intro i
  have h1 := (hf i).2 (mem_univ x) (mem_univ y) ha hb' hab
  simp only [smul_eq_mul] at h1
  calc f i (a • x + b • y) ≤ a * f i x + b * f i y := h1
    _ ≤ (a * ⨆ j, f j x) + (b * ⨆ j, f j y) :=
        add_le_add (mul_le_mul_of_nonneg_left (le_ciSup (hb x) i) ha)
          (mul_le_mul_of_nonneg_left (le_ciSup (hb y) i) hb')

/-- **Argument allocation.**  For jointly convex `Ψ` on parameters × scalar argument, averaging
the parameters with weights `w, 1−w` and splitting the argument `s` as `λ₁s/d, λ₂s/d` with
`wλ₁ + (1−w)λ₂ = d` gives `Ψ(av, s) ≤ wΨ(p₁, λ₁s/d) + (1−w)Ψ(p₂, λ₂s/d)`. -/
theorem allocation {P : Type*} [AddCommGroup P] [Module ℝ P] (Ψ : P × ℝ → ℝ)
    (hΨ : ConvexOn ℝ univ Ψ) (p1 p2 : P) (w l1 l2 d s : ℝ) (hw0 : 0 ≤ w) (hw1 : w ≤ 1)
    (hd : d ≠ 0) (hsum : w * l1 + (1 - w) * l2 = d) :
    Ψ (w • p1 + (1 - w) • p2, s) ≤ w * Ψ (p1, l1 * s / d) + (1 - w) * Ψ (p2, l2 * s / d) := by
  have h := hΨ.2 (mem_univ (p1, l1 * s / d)) (mem_univ (p2, l2 * s / d)) hw0
    (by linarith : (0 : ℝ) ≤ 1 - w) (by ring : w + (1 - w) = 1)
  simp only [smul_eq_mul] at h
  convert h using 2
  rw [Prod.smul_mk, Prod.smul_mk, Prod.mk_add_mk]
  congr 1
  simp only [smul_eq_mul]
  field_simp
  linear_combination (-s) * hsum

/-- The β²-penalty: `w β₁² + (1−w) β₂² − (wβ₁ + (1−w)β₂)² = w(1−w)(β₁−β₂)²`. -/
lemma beta_penalty (w b1 b2 : ℝ) :
    w * b1 ^ 2 + (1 - w) * b2 ^ 2 - (w * b1 + (1 - w) * b2) ^ 2 = w * (1 - w) * (b1 - b2) ^ 2 := by
  ring

/-- **Allocation with the `2β²/ε` term.**  With `Ψ' : (params × β) × ω → ℝ` jointly convex and
`Ψ(p, β, ω) = Ψ'((p,β),ω) + 2β²/ε`, averaging gives the extra gain
`g = 2w(1−w)(β₁−β₂)²/ε`. -/
theorem allocation_with_beta {P : Type*} [AddCommGroup P] [Module ℝ P]
    (Ψ' : (P × ℝ) × ℝ → ℝ) (hΨ : ConvexOn ℝ univ Ψ') (ε : ℝ) (hε : 0 < ε)
    (p1 p2 : P) (b1 b2 w l1 l2 d s : ℝ) (hw0 : 0 ≤ w) (hw1 : w ≤ 1)
    (hd : d ≠ 0) (hsum : w * l1 + (1 - w) * l2 = d) :
    Ψ' ((w • p1 + (1 - w) • p2, w * b1 + (1 - w) * b2), s) + 2 * (w * b1 + (1 - w) * b2) ^ 2 / ε
      ≤ w * (Ψ' ((p1, b1), l1 * s / d) + 2 * b1 ^ 2 / ε)
        + (1 - w) * (Ψ' ((p2, b2), l2 * s / d) + 2 * b2 ^ 2 / ε)
        - 2 * w * (1 - w) * (b1 - b2) ^ 2 / ε := by
  have h := allocation Ψ' hΨ (p1, b1) (p2, b2) w l1 l2 d s hw0 hw1 hd hsum
  have e : (w • (p1, b1) + (1 - w) • (p2, b2) : P × ℝ)
      = (w • p1 + (1 - w) • p2, w * b1 + (1 - w) * b2) := by
    rw [Prod.smul_mk, Prod.smul_mk, Prod.mk_add_mk]; rfl
  rw [e] at h
  have hb := beta_penalty w b1 b2
  have : 2 * (w * b1 + (1 - w) * b2) ^ 2 / ε
      = w * (2 * b1 ^ 2 / ε) + (1 - w) * (2 * b2 ^ 2 / ε) - 2 * w * (1 - w) * (b1 - b2) ^ 2 / ε := by
    field_simp
    linear_combination (2 : ℝ) * hb
  linarith

end Grothe.LowerAnalytic
