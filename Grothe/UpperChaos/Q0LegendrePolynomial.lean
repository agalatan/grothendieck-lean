import Grothe.UpperChaos.Q0LegendreRoots

/-! Polynomial degree bounds for the explicit Legendre recurrence. This
does not yet identify the roots with the Gaussian quadrature rule.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0LegendreInteger

open Polynomial

noncomputable def polyPair : ℕ → ℝ[X] × ℝ[X]
  | 0 => (1, X)
  | k + 1 =>
      let p := polyPair k
      (p.2, C (((k + 2 : ℕ) : ℝ)⁻¹) *
        (C (((2 * k + 3 : ℕ) : ℝ)) * (X * p.2) - C (((k + 1 : ℕ) : ℝ)) * p.1))

theorem eval_polyPair (k : ℕ) (x : ℝ) :
    ((polyPair k).1.eval x, (polyPair k).2.eval x) = realPair x k := by
  induction k with
  | zero => simp [polyPair, realPair]
  | succ k ih =>
      have h1 := congrArg Prod.fst ih
      have h2 := congrArg Prod.snd ih
      change (polyPair k).1.eval x = (realPair x k).1 at h1
      change (polyPair k).2.eval x = (realPair x k).2 at h2
      simp only [polyPair, realPair, Polynomial.eval_mul,
        Polynomial.eval_sub, Polynomial.eval_C, Polynomial.eval_X]
      rw [h1, h2]
      congr 1
      ring

theorem degree_polyPair (k : ℕ) :
    (polyPair k).1.natDegree ≤ k ∧ (polyPair k).2.natDegree ≤ k + 1 := by
  induction k with
  | zero => simp [polyPair]
  | succ k ih =>
      simp only [polyPair]
      constructor
      · exact ih.2
      · have hx : (X * (polyPair k).2).natDegree ≤ 1 + (polyPair k).2.natDegree := by
          simpa using (natDegree_mul_le (p := (X : ℝ[X])) (q := (polyPair k).2))
        have ha : (C (((2 * k + 3 : ℕ) : ℝ)) * (X * (polyPair k).2)).natDegree ≤ k + 2 := by
          have h := (natDegree_C_mul_le (((2 * k + 3 : ℕ) : ℝ)) (X * (polyPair k).2)).trans hx
          omega
        have hb : (C (((k + 1 : ℕ) : ℝ)) * (polyPair k).1).natDegree ≤ k + 2 := by
          have h := natDegree_C_mul_le (((k + 1 : ℕ) : ℝ)) (polyPair k).1
          omega
        have hc : (C (((2 * k + 3 : ℕ) : ℝ)) * (X * (polyPair k).2) -
            C (((k + 1 : ℕ) : ℝ)) * (polyPair k).1).natDegree ≤ k + 2 := by
          exact (natDegree_sub_le _ _).trans (max_le ha hb)
        exact (natDegree_C_mul_le _ _).trans hc

theorem realPair_one (k : ℕ) : realPair 1 k = (1, 1) := by
  induction k with
  | zero => simp [realPair]
  | succ k ih =>
      simp only [realPair, ih]
      congr 1
      push_cast
      have hk : (k : ℝ) + 2 ≠ 0 := by positivity
      field_simp
      ring

theorem polyPair_second_ne_zero (k : ℕ) : (polyPair k).2 ≠ 0 := by
  intro h
  have hv := congrArg Prod.snd (eval_polyPair k 1)
  simp only [realPair_one] at hv
  rw [h, Polynomial.eval_zero] at hv
  norm_num at hv

/-- Once `k + 1` distinct roots have been found, there are no others. -/
theorem roots_exhausted (k : ℕ) (chosen : Finset ℝ)
    (hcard : chosen.card = k + 1)
    (hroot : ∀ x ∈ chosen, (realPair x k).2 = 0) :
    ∀ x : ℝ, (realPair x k).2 = 0 ↔ x ∈ chosen := by
  let p := (polyPair k).2
  have hp : p ≠ 0 := polyPair_second_ne_zero k
  have heval (x : ℝ) : p.eval x = (realPair x k).2 := by
    exact congrArg Prod.snd (eval_polyPair k x)
  have hbound : p.natDegree ≤ chosen.card := by
    rw [hcard]
    exact (degree_polyPair k).2
  have hchosen : ∀ x ∈ chosen, p.eval x = 0 := by
    intro x hx
    rw [heval]
    exact hroot x hx
  have hroots : p.roots = chosen.val :=
    roots_eq_of_natDegree_le_card_of_ne_zero hchosen hbound hp
  intro x
  rw [← heval]
  change p.IsRoot x ↔ x ∈ chosen
  rw [← Polynomial.mem_roots hp, hroots]
  rfl

/-- Disjoint brackets with the full degree number of roots contain exactly
one root each. Endpoint roots remain permitted. -/
theorem root_unique_in_disjoint_brackets (k : ℕ)
    (lo hi root : Fin (k + 1) → ℝ)
    (hinside : ∀ i, root i ∈ Set.Icc (lo i) (hi i))
    (hroot : ∀ i, (realPair (root i) k).2 = 0)
    (hdisjoint : ∀ i j, i ≠ j → Disjoint (Set.Icc (lo i) (hi i)) (Set.Icc (lo j) (hi j))) :
    ∀ i x, x ∈ Set.Icc (lo i) (hi i) → (realPair x k).2 = 0 → x = root i := by
  classical
  have hinj : Function.Injective root := by
    intro i j heq
    by_contra hij
    have hmem : root i ∈ Set.Icc (lo j) (hi j) := by simpa [heq] using hinside j
    exact Set.disjoint_left.mp (hdisjoint i j hij) (hinside i) hmem
  let chosen := Finset.univ.image root
  have hcard : chosen.card = k + 1 := by
    simp [chosen, Finset.card_image_of_injective _ hinj]
  have hchosen : ∀ x ∈ chosen, (realPair x k).2 = 0 := by
    intro x hx
    obtain ⟨j, _, rfl⟩ := Finset.mem_image.mp hx
    exact hroot j
  intro i x hx hz
  have hmem : x ∈ chosen := (roots_exhausted k chosen hcard hchosen x).mp hz
  obtain ⟨j, _, hj⟩ := Finset.mem_image.mp hmem
  by_cases hij : i = j
  · subst j
    exact hj.symm
  · have hmemj : x ∈ Set.Icc (lo j) (hi j) := by simpa [hj] using hinside j
    exact (Set.disjoint_left.mp (hdisjoint i j hij) hx hmemj).elim

end Grothe.UpperChaos.Q0LegendreInteger
