import Grothe.UpperChaos.GeometricInverse
import LeanCert.Core.IntervalRat.Basic

/-!
# Pointwise geometric-reciprocal enclosures

The point type and approximation representation are arbitrary. In particular,
the approximation may be evaluation of a bivariate rational polynomial on a
normalized square. No univariate Taylor-model structure is used.

Agent-ID: codex-8c4d
-/

open LeanCert.Core

namespace Grothe.UpperChaos.PointwiseGeometricEnclosure

/-- On a domain, the difference between the represented function and the
approximation lies in a single fixed rational remainder interval. -/
def Encloses {α : Type*} (domain : Set α) (approx f : α → ℝ)
    (remainder : IntervalRat) : Prop :=
  ∀ x ∈ domain, f x - approx x ∈ remainder

/-- Symmetric interval for a nonnegative rational absolute-error budget. -/
def errorInterval (E : ℚ) (hE : 0 ≤ E) : IntervalRat :=
  ⟨-E, E, (neg_nonpos.mpr hE).trans hE⟩

/-- If `f` is enclosed by an approximation and `g` is uniformly within `E`
of `f`, the same approximation encloses `g` after remainder inflation. -/
theorem encloses_inflate {α : Type*} (domain : Set α) (approx f g : α → ℝ)
    (remainder : IntervalRat) (E : ℚ) (hE : 0 ≤ E)
    (hmodel : Encloses domain approx f remainder)
    (herror : ∀ x ∈ domain, |g x - f x| ≤ (E : ℝ)) :
    Encloses domain approx g (IntervalRat.add remainder (errorInterval E hE)) := by
  intro x hx
  have herr : g x - f x ∈ errorInterval E hE := by
    simpa [errorInterval, IntervalRat.mem_def] using (abs_le.mp (herror x hx))
  have hsum := IntervalRat.mem_add (hmodel x hx) herr
  have heq : g x - approx x = (f x - approx x) + (g x - f x) := by ring
  rw [heq]
  exact hsum

/-- A model of the finite geometric approximation encloses the actual
reciprocal after its remainder is enlarged by a rational error budget. -/
theorem encloses_inv_of_geometric {α : Type*} (domain : Set α)
    (approx β : α → ℝ) (remainder : IntervalRat) (E : ℚ) (hE : 0 ≤ E)
    (B q : ℝ) (n : ℕ) (hB : 0 < B) (hq : 0 ≤ q) (hq1 : q < 1)
    (hdev : ∀ x ∈ domain, |β x / B - 1| ≤ q)
    (hmodel : Encloses domain approx (fun x => inverseAround (β x) B n) remainder)
    (hbudget : B⁻¹ * (q ^ n / (1 - q)) ≤ (E : ℝ)) :
    Encloses domain approx (fun x => (β x)⁻¹)
      (IntervalRat.add remainder (errorInterval E hE)) := by
  apply encloses_inflate domain approx (fun x => inverseAround (β x) B n)
    (fun x => (β x)⁻¹) remainder E hE hmodel
  intro x hx
  exact (abs_inv_sub_inverseAround_le (β x) B q n hB hq hq1 (hdev x hx)).trans hbudget

end Grothe.UpperChaos.PointwiseGeometricEnclosure
