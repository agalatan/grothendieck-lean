/-
Copyright (c) 2026 Alin Galatan. Released under Apache 2.0 license as described in the file LICENSE.
Authors: Alin Galatan
-/
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-!
# The statement: the complex Grothendieck constant and Haagerup's value

The definitions that occur in the statement of the main theorem (Theorem 1.1 of the article), following (1.1), (1.2)
and (1.4) of the article. For a complex `m × n` matrix `A`:

* the scalar optimum `scalarOpt A = C(A) = sup |∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ|` over complex scalars with `|εᵢ| = |δⱼ| = 1`;
* the vector optimum `vectorOpt A = V(A) = sup |∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫|` over unit vectors `xᵢ, yⱼ` of `ℂ^ι`, for every
  finite type `ι` (the inner product is conjugate-linear in the first argument);
* `IsBound K`: `V(A) ≤ K * C(A)` for all `m`, `n` and all `A`;
* `complexGrothendieckConstant = K_G^ℂ = sInf {K | IsBound K}`;
* Haagerup's integral `gammaDagger = γ† = ∫₀^{π/2} cos² t / √(1 + sin² t) dt` (`= 0.711958659778…`); Haagerup's value
  is `1 / gammaDagger = 1.404575934664…`.

The file imports only Mathlib and can be read alone. Remarks on the definitions:

* The article defines `C(A)` and `V(A)` with `|εᵢ| ≤ 1` and `‖xᵢ‖ ≤ 1`, in an arbitrary Hilbert space, and notes that
  the suprema do not change under the restrictions made here (convexity; only the span of the vectors matters).
* `sSup` and `sInf` of real sets are the supremum and the infimum only for nonempty bounded sets. All sets here are
  such: the two sets of values are nonempty and bounded above by `∑ᵢⱼ |aᵢⱼ|` (`scalarValues_bddAbove`,
  `vectorValues_bddAbove`, `vectorValues_nonempty` in `Haagerup/Transfer.lean`); the set of bounds is bounded below
  (`bounds_bddBelow`, proved here) and nonempty (`Haagerup.isBound` in `Haagerup.lean`).

Besides the definitions the file proves three elementary facts: every bound is at least `1` (`one_le_of_isBound`),
so the set of bounds is bounded below (`bounds_bddBelow`), and a number above a bound is a bound (`IsBound.mono`).
-/

set_option warningAsError true

namespace Haagerup.Statement

open scoped ComplexConjugate

noncomputable section

/-- Values `‖∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ‖` over unimodular scalars `|εᵢ| = |δⱼ| = 1`. -/
def scalarValues {m n : ℕ} (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ε : Fin m → ℂ) (δ : Fin n → ℂ),
    (∀ i, ‖ε i‖ = 1) ∧ (∀ j, ‖δ j‖ = 1) ∧
    r = ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖}

/-- The scalar optimum `C(A)` of (1.1): the supremum of `scalarValues A`. -/
def scalarOpt {m n : ℕ} (A : Fin m → Fin n → ℂ) : ℝ := sSup (scalarValues A)

/-- Values `‖∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫‖` over unit vectors `xᵢ, yⱼ ∈ ℂ^ι` for any finite type `ι`. -/
def vectorValues {m n : ℕ} (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ι : Type) (_ : Fintype ι)
      (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) ∧ (∀ j, ‖y j‖ = 1) ∧
    r = ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖}

/-- The vector optimum `V(A)` of (1.1): the supremum of `vectorValues A`. -/
def vectorOpt {m n : ℕ} (A : Fin m → Fin n → ℂ) : ℝ := sSup (vectorValues A)

/-- `K` is a complex Grothendieck bound: `V(A) ≤ K · C(A)` for all finite complex matrices `A`. -/
def IsBound (K : ℝ) : Prop :=
  ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ), vectorOpt A ≤ K * scalarOpt A

/-- The complex Grothendieck constant `K_G^ℂ`: the infimum of the Grothendieck bounds (1.2). -/
def complexGrothendieckConstant : ℝ := sInf {K | IsBound K}

/-- Haagerup's integral `γ† = ∫₀^{π/2} cos² t / √(1 + sin² t) dt` of (1.4); Haagerup's value is `1 / γ†`. -/
def gammaDagger : ℝ :=
  ∫ t in (0 : ℝ)..(Real.pi / 2), Real.cos t ^ 2 / √(1 + Real.sin t ^ 2)

/-- Every Grothendieck bound satisfies `1 ≤ K`, witnessed by the `1 × 1` matrix `[1]`. -/
theorem one_le_of_isBound {K : ℝ} (hK : IsBound K) : 1 ≤ K := by
  let A : Fin 1 → Fin 1 → ℂ := fun _ _ => 1
  have hS_le : scalarOpt A ≤ 1 := by
    refine csSup_le ⟨1, fun _ => 1, fun _ => 1, fun _ => norm_one, fun _ => norm_one, by simp [A]⟩ ?_
    rintro r ⟨ε, δ, hε, hδ, rfl⟩
    simp [A, hε 0, hδ 0]
  have hV_ge : 1 ≤ vectorOpt A := by
    have hbdd : BddAbove (vectorValues A) := by
      refine ⟨1, ?_⟩
      rintro r ⟨ι, _, x, y, hx, hy, rfl⟩
      simpa [A, hx 0, hy 0] using norm_inner_le_norm (𝕜 := ℂ) (x 0) (y 0)
    refine le_csSup hbdd ⟨Unit, inferInstance,
      fun _ => EuclideanSpace.single () 1, fun _ => EuclideanSpace.single () 1,
      fun _ => by simp, fun _ => by simp, ?_⟩
    simp [A]
  have hS_ge : 0 ≤ scalarOpt A :=
    Real.sSup_nonneg fun r ⟨_, _, _, _, hr⟩ => hr ▸ norm_nonneg _
  have h1 := hV_ge.trans (hK 1 1 A)
  have hK0 : 0 ≤ K := by
    by_contra hneg
    push Not at hneg
    have : K * scalarOpt A ≤ 0 := mul_nonpos_of_nonpos_of_nonneg hneg.le hS_ge
    linarith
  nlinarith [mul_le_mul_of_nonneg_left hS_le hK0]

/-- The set of Grothendieck bounds is bounded below (by `0`), so its infimum is the greatest lower bound. -/
theorem bounds_bddBelow : BddBelow {K | IsBound K} :=
  ⟨0, fun _ hK => zero_le_one.trans (one_le_of_isBound hK)⟩

/-- A number above a Grothendieck bound is a Grothendieck bound. -/
theorem IsBound.mono {K K' : ℝ} (hK : IsBound K) (h : K ≤ K') : IsBound K' :=
  fun m n A => (hK m n A).trans
    (mul_le_mul_of_nonneg_right h (Real.sSup_nonneg fun _ ⟨_, _, _, _, hr⟩ => hr ▸ norm_nonneg _))

end

end Haagerup.Statement
