import Grothe.UpperChaos.RectangleHornerTrace
import Grothe.UpperChaos.PointwiseGeometricEnclosure

/-! A reusable, source-independent reciprocal certificate for rectangle models.
The finite transcript, relative denominator enclosure, and analytic remainder
are all checked. One soundness proof applies to every cell and truncation length.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.RectangleReciprocalCertificate

open LeanCert.Core RectangleCoefficientArithmetic RectangleModelCheck
open RectangleHornerTrace PointwiseGeometricEnclosure

theorem eval1_replicate_one (n : ℕ) (z : ℝ) :
    eval1 (List.replicate n (1 : ℚ)) z = ∑ k ∈ Finset.range n, z^k := by
  induction n with
  | zero => simp [eval1, evalG]
  | succ n ih =>
    have hcons : eval1 (List.replicate (n + 1) (1 : ℚ)) z =
        1 + z * eval1 (List.replicate n (1 : ℚ)) z := by
      simp only [List.replicate_succ, eval1, evalG_cons, Rat.cast_one]
    rw [hcons]
    rw [ih, Finset.sum_range_succ']
    simp [Finset.mul_sum, pow_succ, mul_comm, add_comm]

structure Certificate where
  center : ℚ
  radius : ℚ
  error : ℚ
  center_pos : 0 < center
  radius_nonneg : 0 ≤ radius
  radius_lt_one : radius < 1
  error_nonneg : 0 ≤ error
  terms : ℕ
  scaled : Model
  delta : Model
  argument : Model
  geometric : Model
  output : Model
  trace : Trace
  scaledBudget : ℚ
  argumentBudget : ℚ
  geometricBudget : ℚ

/-- Every obligation is finite exact rational arithmetic over the witness.
In generated applications this proposition is proved by kernel reduction. -/
def Verified (input : Model) (c : Certificate) : Prop :=
  intervalSubset
    (IntervalRat.mul
      (IntervalRat.sub (range input) (IntervalRat.singleton c.center))
      (IntervalRat.singleton (1 / c.center)))
    (errorInterval c.radius c.radius_nonneg) = true ∧
  scaleOK (1 / c.center) input c.scaled c.scaledBudget = true ∧
  addOK c.scaled (constant (-1)) c.delta 0 = true ∧
  scaleOK (-1) c.delta c.argument c.argumentBudget = true ∧
  c.trace.check c.argument ((List.replicate c.terms (1 : ℚ)).map constant) = true ∧
  scaleOK (1 / c.center) c.trace.output c.geometric c.geometricBudget = true ∧
  c.center⁻¹ * (c.radius^c.terms / (1 - c.radius)) ≤ c.error ∧
  roundOK c.geometric.coefficients
    (IntervalRat.add c.geometric.remainder (errorInterval c.error c.error_nonneg))
    c.output 0 = true

instance (input : Model) (c : Certificate) : Decidable (Verified input c) := by
  unfold Verified
  infer_instance

/-- A verified witness converts a model of the actual denominator to a model
of its reciprocal. No pointwise denominator estimate is left to the caller. -/
theorem sound (input : Model) (c : Certificate) (hc : Verified input c)
    {x y β : ℝ} (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hβ : Contains input x y β) :
    Contains c.output x y β⁻¹ := by
  rcases hc with ⟨hdev, hs, hd, ha, ht, hg, he, ho⟩
  have hB : (c.center : ℝ) ≠ 0 := by exact_mod_cast c.center_pos.ne'
  have hdv : |β / (c.center : ℝ) - 1| ≤ (c.radius : ℝ) := by
    have h := mem_of_intervalSubset hdev
      (IntervalRat.mem_mul
        (IntervalRat.mem_sub (mem_range hx hy hβ) (IntervalRat.mem_singleton c.center))
        (IntervalRat.mem_singleton (1 / c.center)))
    have hid : (β - (c.center : ℝ)) * ((1 / c.center : ℚ) : ℝ) =
        β / (c.center : ℝ) - 1 := by
      push_cast
      field_simp [hB]
    rw [hid] at h
    apply abs_le.mpr
    simpa only [errorInterval, IntervalRat.mem_def, Rat.cast_neg] using h
  have hscaled := scale_sound (1 / c.center) input c.scaled c.scaledBudget hs hx hy hβ
  have hdelta := add_sound c.scaled (constant (-1)) c.delta 0 hd hx hy hscaled
    (contains_constant (-1) x y)
  have hdelta_id : ((1 / c.center : ℚ) : ℝ) * β + ((-1 : ℚ) : ℝ) =
      β / (c.center : ℝ) - 1 := by push_cast; ring
  rw [hdelta_id] at hdelta
  have hargument0 := scale_sound (-1) c.delta c.argument c.argumentBudget ha hx hy hdelta
  have hargument : Contains c.argument x y (-(β / (c.center : ℝ) - 1)) := by
    simpa only [Rat.cast_neg, Rat.cast_one, neg_one_mul] using hargument0
  have htrace := c.trace.rational_sound c.argument (List.replicate c.terms (1 : ℚ))
    ht hx hy hargument
  have hgeometric := scale_sound (1 / c.center) c.trace.output c.geometric
    c.geometricBudget hg hx hy htrace
  have hgeometric_id : ((1 / c.center : ℚ) : ℝ) *
      eval1 (List.replicate c.terms (1 : ℚ)) (-(β / (c.center : ℝ) - 1)) =
      inverseAround β c.center c.terms := by
    rw [eval1_replicate_one]
    simp only [inverseAround, one_div, Rat.cast_inv]
  rw [hgeometric_id] at hgeometric
  have htail := abs_inv_sub_inverseAround_le β (c.center : ℝ) (c.radius : ℝ) c.terms
    (by exact_mod_cast c.center_pos) (by exact_mod_cast c.radius_nonneg)
    (by exact_mod_cast c.radius_lt_one) hdv
  have hbudget : (c.center : ℝ)⁻¹ *
      ((c.radius : ℝ)^c.terms / (1 - (c.radius : ℝ))) ≤ (c.error : ℝ) := by
    have h : ((c.center⁻¹ * (c.radius^c.terms / (1 - c.radius)) : ℚ) : ℝ) ≤
        (c.error : ℝ) := Rat.cast_le.mpr he
    push_cast at h
    exact h
  have herror : β⁻¹ - inverseAround β c.center c.terms ∈
      errorInterval c.error c.error_nonneg := by
    simpa only [errorInterval, IntervalRat.mem_def, Rat.cast_neg] using
      abs_le.mp (htail.trans hbudget)
  apply round_sound _ _ c.output 0 ho hx hy
  have hsum := IntervalRat.mem_add hgeometric herror
  have hid : β⁻¹ - eval2 c.geometric.coefficients x y =
      (inverseAround β c.center c.terms - eval2 c.geometric.coefficients x y) +
        (β⁻¹ - inverseAround β c.center c.terms) := by ring
  rw [hid]
  exact hsum

end Grothe.UpperChaos.RectangleReciprocalCertificate
