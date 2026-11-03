import Mathlib

/-!
# The statement: what this repository proves about the complex Grothendieck constant

This file is the whole claim. It imports only Mathlib and contains only definitions, no proofs:
reading it is enough to know what a theorem `Grothe.Statement.UpperTarget` (or `LowerTarget`) asserts,
without reading any of the proof modules.

For a complex `m × n` matrix `A` (a function `Fin m → Fin n → ℂ`):

* the **scalar optimum** `C(A) = sup |∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ|` over unimodular scalars `|εᵢ| = |δⱼ| = 1`;
* the **vector optimum** `V(A) = sup |∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫|` over unit vectors `xᵢ, yⱼ` of a complex
  Hilbert space. Finitely many vectors span a finite-dimensional subspace, so it suffices to take
  `xᵢ, yⱼ ∈ ℂ^ι` (`EuclideanSpace ℂ ι`) for every finite type `ι`;
* `K` is a **Grothendieck bound** if `V(A) ≤ K · C(A)` for every matrix of every size;
* the **complex Grothendieck constant** `K_G^ℂ` is the infimum of all Grothendieck bounds.

Mathlib's inner product is conjugate-linear in the first slot, so the one-dimensional case of
`⟪xᵢ, yⱼ⟫` is `conj(εᵢ) δⱼ`, exactly the scalar problem.

The two targets are stated directly in terms of Grothendieck bounds, so they do not depend on Lean's
convention for the infimum of an empty or unbounded set: `UpperTarget` says some bound is below
`1.404598149141`, `LowerTarget` says every bound is above `1.401697117301`. The constant `K_G^ℂ` is
defined as the infimum of all bounds for reference; the proof modules show that `UpperTarget` implies
`K_G^ℂ < 1.404598149141` and that `LowerTarget` implies `1.401697117301 ≤ K_G^ℂ` (and the strict form
once a bound is known to exist). The suprema `C(A)`, `V(A)` are over nonempty bounded sets of reals.
-/

namespace Grothe.Statement

open scoped ComplexConjugate

noncomputable section

/-- The values `‖∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ‖` over unimodular `εᵢ, δⱼ`. -/
def scalarValues {m n : ℕ} (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ε : Fin m → ℂ) (δ : Fin n → ℂ), (∀ i, ‖ε i‖ = 1) ∧ (∀ j, ‖δ j‖ = 1) ∧
    r = ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖}

/-- The scalar optimum `C(A)`. -/
def scalarOpt {m n : ℕ} (A : Fin m → Fin n → ℂ) : ℝ := sSup (scalarValues A)

/-- The values `‖∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫‖` over unit vectors `xᵢ, yⱼ` of `ℂ^ι`, for any finite type `ι`. -/
def vectorValues {m n : ℕ} (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ι : Type) (_ : Fintype ι) (x : Fin m → EuclideanSpace ℂ ι)
      (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) ∧ (∀ j, ‖y j‖ = 1) ∧ r = ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖}

/-- The vector optimum `V(A)`. -/
def vectorOpt {m n : ℕ} (A : Fin m → Fin n → ℂ) : ℝ := sSup (vectorValues A)

/-- `K` is a Grothendieck bound: `V(A) ≤ K · C(A)` for every complex matrix `A`. -/
def IsBound (K : ℝ) : Prop :=
  ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ), vectorOpt A ≤ K * scalarOpt A

/-- The complex Grothendieck constant `K_G^ℂ`: the smallest Grothendieck bound. -/
def complexGrothendieckConstant : ℝ := sInf {K | IsBound K}

/-- **The upper-bound target:** some Grothendieck bound is below `1.404598149141`
(hence `K_G^ℂ < 1.404598149141`). -/
def UpperTarget : Prop := ∃ K, IsBound K ∧ K < 1404598149141 / 1000000000000

/-- **The lower-bound target:** every Grothendieck bound is above `1.401697117301`
(hence `1.401697117301 ≤ K_G^ℂ`, and `<` as soon as some bound exists). -/
def LowerTarget : Prop := ∀ K, IsBound K → 1401697117301 / 1000000000000 < K

end

end Grothe.Statement
