import Grothe.UpperChaos.Rounder
import Mathlib.Tactic

/-! Algebraic normalization bridge for the global profile-root cover.
No numerical coefficient or interval claim is made here. Agent-ID: codex-e4b7. -/

namespace Grothe.UpperChaos.ProfileRootScreen

noncomputable def gammaFactor (j : ℕ) : ℝ :=
  Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) / nrmHalf j

noncomputable def normalizationRatio (j : ℕ) : ℝ :=
  ((2 * j).factorial : ℝ) / (4 ^ j * (j.factorial : ℝ) ^ 2)

/-- Each profile factor is positive, with a rational square up to √π. -/
theorem gammaFactor_sq (j : ℕ) :
    0 < gammaFactor j ∧
      gammaFactor j ^ 2 * (Real.sqrt Real.pi * normalizationRatio j) =
        1 + (Grothe.Upper.aQ : ℝ) ^ 2 := by
  have hpos : 0 < Real.sqrt Real.pi * normalizationRatio j := by
    dsimp [normalizationRatio]
    positivity
  have hn : nrmHalf j ^ 2 = Real.sqrt Real.pi * normalizationRatio j := by
    dsimp [nrmHalf, normalizationRatio]
    rw [Real.sq_sqrt (by positivity)]
    ring
  have hnpos : 0 < nrmHalf j := by
    dsimp [nrmHalf]
    exact Real.sqrt_pos.2 (by positivity)
  constructor
  · dsimp [gammaFactor]
    positivity
  · dsimp [gammaFactor]
    rw [div_pow, hn, Real.sq_sqrt (by positivity)]
    have hnorm : 0 < normalizationRatio j := by dsimp [normalizationRatio]; positivity
    field_simp [ne_of_gt hnorm, ne_of_gt (Real.sqrt_pos.2 Real.pi_pos)]

end Grothe.UpperChaos.ProfileRootScreen

namespace Grothe.UpperChaos.ProfileRootScreen

/-- Turn squared endpoint certificates into an interval for a positive factor. -/
theorem positive_factor_between_of_square_bounds
    (g p b A L U pLo pHi : ℝ)
    (hg : 0 < g) (hp : 0 < p) (hb : 0 < b)
    (hL : 0 ≤ L) (hU : 0 ≤ U) (hpLo : pLo ≤ p) (hpHi : p ≤ pHi)
    (hEq : g ^ 2 * (p * b) = A)
    (hLower : L ^ 2 * (pHi * b) ≤ A)
    (hUpper : A ≤ U ^ 2 * (pLo * b)) :
    L ≤ g ∧ g ≤ U := by
  have hpb : 0 < p * b := mul_pos hp hb
  constructor
  · apply (sq_le_sq₀ hL hg.le).1
    apply le_of_mul_le_mul_right _ hpb
    calc
      L ^ 2 * (p * b) ≤ L ^ 2 * (pHi * b) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hpHi hb.le) (sq_nonneg L)
      _ ≤ A := hLower
      _ = g ^ 2 * (p * b) := hEq.symm
  · apply (sq_le_sq₀ hg.le hU).1
    apply le_of_mul_le_mul_right _ hpb
    calc
      g ^ 2 * (p * b) = A := hEq
      _ ≤ U ^ 2 * (pLo * b) := hUpper
      _ ≤ U ^ 2 * (p * b) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hpLo hb.le) (sq_nonneg U)

end Grothe.UpperChaos.ProfileRootScreen

namespace Grothe.UpperChaos.ProfileRootScreen

/-- A rational squared endpoint test encloses the actual positive profile factor. -/
theorem gammaFactor_bounds (j : ℕ) (L U pLo pHi : ℝ)
    (hL : 0 ≤ L) (hU : 0 ≤ U)
    (hpLo : pLo ≤ Real.sqrt Real.pi) (hpHi : Real.sqrt Real.pi ≤ pHi)
    (hLower : L ^ 2 * (pHi * normalizationRatio j) ≤
      1 + (Grothe.Upper.aQ : ℝ) ^ 2)
    (hUpper : 1 + (Grothe.Upper.aQ : ℝ) ^ 2 ≤
      U ^ 2 * (pLo * normalizationRatio j)) :
    L ≤ gammaFactor j ∧ gammaFactor j ≤ U := by
  have hgamma := gammaFactor_sq j
  have hpi : 0 < Real.sqrt Real.pi := Real.sqrt_pos.2 Real.pi_pos
  have hb : 0 < normalizationRatio j := by dsimp [normalizationRatio]; positivity
  exact positive_factor_between_of_square_bounds (gammaFactor j) (Real.sqrt Real.pi)
    (normalizationRatio j) (1 + (Grothe.Upper.aQ : ℝ) ^ 2) L U pLo pHi
    hgamma.1 hpi hb hL hU hpLo hpHi hgamma.2 hLower hUpper

end Grothe.UpperChaos.ProfileRootScreen
