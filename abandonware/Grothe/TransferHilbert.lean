import Grothe.Lower.TransferFinite

/-!
# Finite Gram representations and transfer in arbitrary inner product spaces

A finite family in a complex inner product space has exactly the same norms and Gram matrix as
a family in `ℂᵈ`, with `d` at most the number of vectors. This justifies the finite-dimensional
definition of the vector optimum without imposing completeness or a dimension assumption on
the original space.

Consequently every Grothendieck bound controls finite pairings of unit vectors, or vectors in
the closed unit ball, in any complex inner product space.

Agent-ID: codex-c8a4. Refs #368.
-/

namespace Grothe

noncomputable section

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- A finite family admits a Euclidean realization of its norms and complete Gram matrix in
dimension at most the number of vectors. -/
theorem exists_euclidean_gram {ι : Type*} [Fintype ι] (v : ι → H) :
    ∃ d ≤ Fintype.card ι, ∃ w : ι → EuclideanSpace ℂ (Fin d),
      (∀ i, ‖w i‖ = ‖v i‖) ∧ ∀ i j, inner ℂ (w i) (w j) = inner ℂ (v i) (v j) := by
  let S := Submodule.span ℂ (Set.range v)
  have : FiniteDimensional ℂ S := FiniteDimensional.span_of_finite ℂ (Set.finite_range v)
  let e := (stdOrthonormalBasis ℂ S).repr
  let vS (i : ι) : S := ⟨v i, Submodule.subset_span ⟨i, rfl⟩⟩
  refine ⟨Module.finrank ℂ S, finrank_range_le_card v, fun i ↦ e (vS i), ?_, ?_⟩
  · intro i
    exact e.norm_map (vS i)
  · intro i j
    exact e.inner_map_map (vS i) (vS j)

variable {m n : ℕ}

/-- The vector optimum bounds pairings of vectors in the closed unit ball of an arbitrary
complex inner product space. -/
theorem le_vectorOpt_of_innerProductSpace_ball (A : Fin m → Fin n → ℂ)
    {x : Fin m → H} {y : Fin n → H} (hx : ∀ i, ‖x i‖ ≤ 1) (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ vectorOpt A := by
  obtain ⟨d, _, w, hw, hinner⟩ := exists_euclidean_gram (Sum.elim x y)
  simpa only [hinner, Sum.elim_inl, Sum.elim_inr] using
    Lower.le_vectorOpt_of_ball A (x := fun i ↦ w (Sum.inl i))
      (y := fun j ↦ w (Sum.inr j))
      (fun i ↦ (hw (Sum.inl i)).trans_le (hx i))
      (fun j ↦ (hw (Sum.inr j)).trans_le (hy j))

/-- The vector optimum bounds pairings of unit vectors in any complex inner product space. -/
theorem le_vectorOpt_of_innerProductSpace (A : Fin m → Fin n → ℂ)
    {x : Fin m → H} {y : Fin n → H} (hx : ∀ i, ‖x i‖ = 1) (hy : ∀ j, ‖y j‖ = 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ vectorOpt A :=
  le_vectorOpt_of_innerProductSpace_ball A (fun i ↦ (hx i).le) (fun j ↦ (hy j).le)

/-- A Grothendieck bound applies to closed-unit-ball families in arbitrary complex inner
product spaces, including infinite-dimensional spaces. -/
theorem IsGrothendieckBound.innerProductSpace_ball {K : ℝ} (hK : IsGrothendieckBound K)
    (A : Fin m → Fin n → ℂ) {x : Fin m → H} {y : Fin n → H}
    (hx : ∀ i, ‖x i‖ ≤ 1) (hy : ∀ j, ‖y j‖ ≤ 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ K * scalarOpt A :=
  (le_vectorOpt_of_innerProductSpace_ball A hx hy).trans (hK m n A)

/-- A Grothendieck bound applies to unit-vector families in any complex inner product space. -/
theorem IsGrothendieckBound.innerProductSpace {K : ℝ} (hK : IsGrothendieckBound K)
    (A : Fin m → Fin n → ℂ) {x : Fin m → H} {y : Fin n → H}
    (hx : ∀ i, ‖x i‖ = 1) (hy : ∀ j, ‖y j‖ = 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ K * scalarOpt A :=
  hK.innerProductSpace_ball A (fun i ↦ (hx i).le) (fun j ↦ (hy j).le)

end

end Grothe
