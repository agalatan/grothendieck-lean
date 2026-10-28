import Grothe.UpperChaos.FixedChaosMatrix

/-! Positive rational enclosures for the production smoothing recurrence.
Agent-ID: codex-7c2e -/

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

private theorem positive_step {u U v V x X y Y : ℝ} (a c : ℕ)
    (hu : 0 ≤ u ∧ u ≤ U) (hv : 0 ≤ v ∧ v ≤ V)
    (hx : 0 ≤ x ∧ x ≤ X) (hy : 0 ≤ y ∧ y ≤ Y) :
    0 ≤ u * a * x + v * c * y ∧
      u * a * x + v * c * y ≤ U * a * X + V * c * Y := by
  constructor
  · exact add_nonneg
      (mul_nonneg (mul_nonneg hu.1 (Nat.cast_nonneg a)) hx.1)
      (mul_nonneg (mul_nonneg hv.1 (Nat.cast_nonneg c)) hy.1)
  · exact add_le_add
      (mul_le_mul (mul_le_mul_of_nonneg_right hu.2 (Nat.cast_nonneg a)) hx.2 hx.1
        (mul_nonneg (hu.1.trans hu.2) (Nat.cast_nonneg a)))
      (mul_le_mul (mul_le_mul_of_nonneg_right hv.2 (Nat.cast_nonneg c)) hy.2 hy.1
        (mul_nonneg (hv.1.trans hv.2) (Nat.cast_nonneg c)))

/-- Monotone propagation uses no cancellation: nonnegative scalar bounds give
bounds on the complete unnormalized matrix entry at every degree. -/
theorem matrixRecurrence_bounds {u U v V w W : ℝ}
    (hu : 0 ≤ u ∧ u ≤ U) (hv : 0 ≤ v ∧ v ≤ V) (hw : 0 ≤ w ∧ w ≤ W)
    (j i : Idx2) :
    0 ≤ matrixRecurrence u v w j i ∧
      matrixRecurrence u v w j i ≤ matrixRecurrence U V W j i := by
  rcases j with ⟨⟨p, q⟩, r, s⟩
  rcases i with ⟨⟨a, b⟩, c, d⟩
  cases p with
  | succ p =>
    simpa only [matrixRecurrence] using positive_step a c hu hv
      (matrixRecurrence_bounds hu hv hw ((p, q), (r, s)) ((a - 1, b), (c, d)))
      (matrixRecurrence_bounds hu hv hw ((p, q), (r, s)) ((a, b), (c - 1, d)))
  | zero =>
    cases q with
    | succ q =>
      simpa only [matrixRecurrence] using positive_step b d hu hv
        (matrixRecurrence_bounds hu hv hw ((0, q), (r, s)) ((a, b - 1), (c, d)))
        (matrixRecurrence_bounds hu hv hw ((0, q), (r, s)) ((a, b), (c, d - 1)))
    | zero =>
      cases r with
      | succ r =>
        simpa only [matrixRecurrence] using positive_step a c hv hw
          (matrixRecurrence_bounds hu hv hw ((0, 0), (r, s)) ((a - 1, b), (c, d)))
          (matrixRecurrence_bounds hu hv hw ((0, 0), (r, s)) ((a, b), (c - 1, d)))
      | zero =>
        cases s with
        | succ s =>
          simpa only [matrixRecurrence] using positive_step b d hv hw
            (matrixRecurrence_bounds hu hv hw ((0, 0), (0, s)) ((a, b - 1), (c, d)))
            (matrixRecurrence_bounds hu hv hw ((0, 0), (0, s)) ((a, b), (c, d - 1)))
        | zero =>
          simp only [matrixRecurrence]
          split_ifs <;> norm_num
termination_by tdeg j
decreasing_by
  all_goals simp only [tdeg]
  all_goals omega

/-- A ring homomorphism commutes with the complete finite recurrence. -/
theorem matrixRecurrence_map {R S : Type*} [Semiring R] [Semiring S]
    (f : R →+* S) (u v w : R) (j i : Idx2) :
    f (matrixRecurrence u v w j i) = matrixRecurrence (f u) (f v) (f w) j i := by
  rcases j with ⟨⟨p, q⟩, r, s⟩
  rcases i with ⟨⟨a, b⟩, c, d⟩
  cases p with
  | succ p =>
    simp only [matrixRecurrence, map_add, map_mul, map_natCast]
    rw [matrixRecurrence_map f u v w ((p, q), (r, s)) ((a - 1, b), (c, d)),
      matrixRecurrence_map f u v w ((p, q), (r, s)) ((a, b), (c - 1, d))]
  | zero =>
    cases q with
    | succ q =>
      simp only [matrixRecurrence, map_add, map_mul, map_natCast]
      rw [matrixRecurrence_map f u v w ((0, q), (r, s)) ((a, b - 1), (c, d)),
        matrixRecurrence_map f u v w ((0, q), (r, s)) ((a, b), (c, d - 1))]
    | zero =>
      cases r with
      | succ r =>
        simp only [matrixRecurrence, map_add, map_mul, map_natCast]
        rw [matrixRecurrence_map f u v w ((0, 0), (r, s)) ((a - 1, b), (c, d)),
          matrixRecurrence_map f u v w ((0, 0), (r, s)) ((a, b), (c - 1, d))]
      | zero =>
        cases s with
        | succ s =>
          simp only [matrixRecurrence, map_add, map_mul, map_natCast]
          rw [matrixRecurrence_map f u v w ((0, 0), (0, s)) ((a, b - 1), (c, d)),
            matrixRecurrence_map f u v w ((0, 0), (0, s)) ((a, b), (c, d - 1))]
        | zero =>
          simp only [matrixRecurrence]
          split_ifs <;> simp
termination_by tdeg j
decreasing_by
  all_goals simp only [tdeg]
  all_goals omega

open Grothe.Upper

def sqrtEtaLoQ : ℚ := 8944271909999158785636694674925104941762 / 10000000000000000000000000000000000000000
def sqrtEtaHiQ : ℚ := 8944271909999158785636694674925104941763 / 10000000000000000000000000000000000000000

def projectionQ : ℚ := 1 / (1 + bQ ^ 2)
def m00LoQ : ℚ := projectionQ + sqrtEtaLoQ * (1 - projectionQ)
def m00HiQ : ℚ := projectionQ + sqrtEtaHiQ * (1 - projectionQ)
def m01LoQ : ℚ := projectionQ * bQ * (1 - sqrtEtaHiQ)
def m01HiQ : ℚ := projectionQ * bQ * (1 - sqrtEtaLoQ)
def m11LoQ : ℚ := projectionQ * bQ ^ 2 + sqrtEtaLoQ * (1 - projectionQ * bQ ^ 2)
def m11HiQ : ℚ := projectionQ * bQ ^ 2 + sqrtEtaHiQ * (1 - projectionQ * bQ ^ 2)

private theorem sqrt_eta_interval :
    (sqrtEtaLoQ : ℝ) ≤ Real.sqrt (etaQ : ℝ) ∧
      Real.sqrt (etaQ : ℝ) ≤ (sqrtEtaHiQ : ℝ) := by
  have hs : Real.sqrt (etaQ : ℝ) ^ 2 = (4 / 5 : ℝ) := by
    calc
      _ = (etaQ : ℝ) := Real.sq_sqrt (by norm_num [etaQ])
      _ = 4 / 5 := by norm_num [etaQ]
  have hp := Real.sqrt_nonneg (etaQ : ℝ)
  norm_num [sqrtEtaLoQ, sqrtEtaHiQ]
  constructor <;> nlinarith

/-- Enclosures of the actual three production entries, from a kernel-checked
rational enclosure of sqrt(4/5). -/
theorem production_matrix_interval :
    (0 ≤ m00LoQ ∧ (m00LoQ : ℝ) ≤ m00 ∧ m00 ≤ (m00HiQ : ℝ)) ∧
    (0 ≤ m01LoQ ∧ (m01LoQ : ℝ) ≤ m01 ∧ m01 ≤ (m01HiQ : ℝ)) ∧
    (0 ≤ m11LoQ ∧ (m11LoQ : ℝ) ≤ m11 ∧ m11 ≤ (m11HiQ : ℝ)) := by
  obtain ⟨hl, hu⟩ := sqrt_eta_interval
  norm_num [sqrtEtaLoQ, sqrtEtaHiQ] at hl hu
  refine ⟨⟨?_, ?_, ?_⟩, ⟨?_, ?_, ?_⟩, ⟨?_, ?_, ?_⟩⟩
  all_goals norm_num [m00LoQ, m00HiQ, m01LoQ, m01HiQ, m11LoQ, m11HiQ,
    projectionQ, sqrtEtaLoQ, sqrtEtaHiQ, m00, m01, m11, pu, bQ]
  all_goals nlinarith only [hl, hu]

noncomputable section

theorem actualEntry_eq_real_recurrence (j i : Idx2) :
    actualEntry j i =
      ((nrm2 j * nrm2 i * matrixRecurrence m00 m01 m11 j i : ℝ) : ℂ) := by
  have hcast : ((matrixRecurrence m00 m01 m11 j i : ℝ) : ℂ) =
      matrixRecurrence (m00 : ℂ) (m01 : ℂ) (m11 : ℂ) j i :=
    matrixRecurrence_map Complex.ofRealHom m00 m01 m11 j i
  rw [actualEntry_eq_matrixRecurrence, ← hcast]
  simp

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.production_matrix_interval' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.production_matrix_interval
