import Grothe.RealOpaque
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

set_option warningAsError true

/-!
# The finite-matrix constant (the upper proof's own copy of the definitions)

Self-standing definitions of:
* the scalar optimum `scalarOpt A = sup_{|εᵢ| = |δⱼ| = 1} |∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ|`;
* the vector optimum `vectorOpt A = sup_{‖xᵢ‖ = ‖yⱼ‖ = 1} |∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫|`;
* `IsBound K`: `∀ m n A, vectorOpt A ≤ K * scalarOpt A`;
* `complexGrothendieckConstant = sInf {K | IsBound K}`;

Also proves `constant_lt_of_upperBelow : UpperBelow c → complexGrothendieckConstant < c` without
any external dependencies.

Agent-ID: gemini-21d5
-/

namespace Grothe.Upper.Optima

open scoped ComplexConjugate

noncomputable section

/-- Values `‖∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ‖` over unimodular scalars `|εᵢ| = |δⱼ| = 1`. -/
def scalarValues {m n : ℕ} (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ε : Fin m → ℂ) (δ : Fin n → ℂ),
    (∀ i, ‖ε i‖ = 1) ∧ (∀ j, ‖δ j‖ = 1) ∧
    r = ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖}

/-- The scalar optimum `C(A)`. -/
def scalarOpt {m n : ℕ} (A : Fin m → Fin n → ℂ) : ℝ := sSup (scalarValues A)

/-- Values `‖∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫‖` over unit vectors `xᵢ, yⱼ ∈ ℂ^ι` for any finite type `ι`. -/
def vectorValues {m n : ℕ} (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ι : Type) (_ : Fintype ι)
      (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) ∧ (∀ j, ‖y j‖ = 1) ∧
    r = ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖}

/-- The vector optimum `V(A)`. -/
def vectorOpt {m n : ℕ} (A : Fin m → Fin n → ℂ) : ℝ := sSup (vectorValues A)

/-- `K` is a complex Grothendieck bound: `V(A) ≤ K · C(A)` for all finite complex matrices `A`. -/
def IsBound (K : ℝ) : Prop :=
  ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ), vectorOpt A ≤ K * scalarOpt A

/-- The complex Grothendieck constant `K_G^ℂ = inf {K | IsBound K}`. -/
def complexGrothendieckConstant : ℝ := sInf {K | IsBound K}

/-- Some Grothendieck bound is strictly below `c`. -/
def UpperBelow (c : ℝ) : Prop := ∃ K, IsBound K ∧ K < c

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

theorem bounds_bddBelow : BddBelow {K | IsBound K} :=
  ⟨0, fun _ hK => zero_le_one.trans (one_le_of_isBound hK)⟩

/-- `UpperBelow c` implies `complexGrothendieckConstant < c`. -/
theorem constant_lt_of_upperBelow {c : ℝ} (h : UpperBelow c) :
    complexGrothendieckConstant < c := by
  obtain ⟨K, hK, hlt⟩ := h
  exact lt_of_le_of_lt (csInf_le bounds_bddBelow hK) hlt

end

end Grothe.Upper.Optima
