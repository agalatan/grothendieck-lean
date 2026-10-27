/- Intended path: Grothe/Upper/GroupedComparison.lean -/
import Grothe.Upper.BandComparison

/-!
# Orthogonal groups of spectrally localized errors

Errors within each group have disjoint supports. Their squared norms therefore
add before the triangle inequality is applied between groups. This avoids
charging a broad band simultaneously against mutually disjoint pieces.
-/

namespace Grothe.Upper.BandComparison

open Finset

variable {ι κ α : Type*} {V : ι → Type*} [∀ i, NormedAddCommGroup (V i)]
  [DecidableEq κ] [DecidableEq α]

/-- A groupwise Pythagorean bound followed by a triangle bound between groups.
Only norms and disjoint supports are needed; the blocks need not be Hilbert spaces. -/
theorem quadratic_sum_le_grouped (S : Finset ι) (J : Finset κ) (G : Finset α)
    (d : κ → ∀ i, V i) (e : κ → ℝ) (group : κ → α) (radius : α → ℝ)
    (hgroup : ∀ j ∈ J, group j ∈ G)
    (he : ∀ j ∈ J, 0 ≤ e j)
    (hd : ∀ j ∈ J, ∑ i ∈ S, ‖d j i‖ ^ 2 ≤ e j ^ 2)
    (hseparate : ∀ j ∈ J, ∀ k ∈ J, group j = group k → j ≠ k →
      ∀ i ∈ S, d j i = 0 ∨ d k i = 0)
    (hradius : ∀ g ∈ G, 0 ≤ radius g ∧
      ∑ j ∈ J.filter (fun j => group j = g), e j ^ 2 ≤ radius g ^ 2) :
    ∑ i ∈ S, ‖∑ j ∈ J, d j i‖ ^ 2 ≤ (∑ g ∈ G, radius g) ^ 2 := by
  classical
  let Jg : α → Finset κ := fun g => J.filter (fun j => group j = g)
  have hJg (g : α) (j : κ) (hj : j ∈ Jg g) : j ∈ J := (mem_filter.mp hj).1
  have hblock (g : α) (hg : g ∈ G) :
      ∑ i ∈ S, ‖∑ j ∈ Jg g, d j i‖ ^ 2 ≤ radius g ^ 2 := by
    have hh := quadratic_sum_le_overlap S (Jg g) d e (fun j k => decide (j = k))
      (fun j hj => he j (hJg g j hj))
      (fun j hj => hd j (hJg g j hj))
      (fun j hj k hk hjk i hi => by
        have hjg : group j = g := (mem_filter.mp hj).2
        have hkg : group k = g := (mem_filter.mp hk).2
        have hne : j ≠ k := by simpa using hjk
        exact hseparate j (hJg g j hj) k (hJg g k hk) (hjg.trans hkg.symm) hne i hi)
    have heq : (∑ j ∈ Jg g, ∑ k ∈ Jg g,
        if decide (j = k) then e j * e k else 0) =
        ∑ j ∈ Jg g, e j ^ 2 := by
      apply sum_congr rfl
      intro j hj
      simp [hj, pow_two]
    exact heq ▸ hh |>.trans (hradius g hg).2
  have hsum (i : ι) : (∑ g ∈ G, ∑ j ∈ Jg g, d j i) = ∑ j ∈ J, d j i := by
    exact sum_fiberwise_of_maps_to hgroup (fun j => d j i)
  have hh := quadratic_sum_le_overlap S G (fun g i => ∑ j ∈ Jg g, d j i)
    radius (fun _ _ => true) (fun g hg => (hradius g hg).1) hblock
    (by simp)
  simp only [ite_true] at hh
  simp_rw [hsum] at hh
  have hq : (∑ g ∈ G, ∑ h ∈ G, radius g * radius h) =
      (∑ g ∈ G, radius g) ^ 2 := by
    rw [pow_two, sum_mul]
    apply sum_congr rfl
    intro g hg
    rw [mul_sum]
  rwa [hq] at hh

end Grothe.Upper.BandComparison
