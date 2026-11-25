import Grothe.LowerAnalytic.RadiusCheck
import Grothe.LowerAnalytic.RadiusRows.Row00
import Grothe.LowerAnalytic.RadiusRows.Row01
import Grothe.LowerAnalytic.RadiusRows.Row02
import Grothe.LowerAnalytic.RadiusRows.Row03
import Grothe.LowerAnalytic.RadiusRows.Row04
import Grothe.LowerAnalytic.RadiusRows.Row05
import Grothe.LowerAnalytic.RadiusRows.Row06
import Grothe.LowerAnalytic.RadiusRows.Row07
import Grothe.LowerAnalytic.RadiusRows.Row08
import Grothe.LowerAnalytic.RadiusRows.Row09
import Grothe.LowerAnalytic.RadiusRows.Row10
import Grothe.LowerAnalytic.RadiusRows.Row11
import Grothe.LowerAnalytic.RadiusRows.Row12
import Grothe.LowerAnalytic.RadiusRows.Row13
import Grothe.LowerAnalytic.RadiusRows.Row14
import Grothe.LowerAnalytic.RadiusRows.Row15
import Grothe.LowerAnalytic.RadiusRows.Row16
import Grothe.LowerAnalytic.RadiusRows.Row17
import Grothe.LowerAnalytic.RadiusRows.Row18
import Grothe.LowerAnalytic.RadiusRows.Row19
import Grothe.LowerAnalytic.RadiusRows.Row20
import Grothe.LowerAnalytic.RadiusRows.Row21
import Grothe.LowerAnalytic.RadiusRows.Row22

/-!
# The certified cubic radius upper bound `E|q| ≤ (93/100) ‖q‖₂` on `H₂,₁(ℂⁿ)`

Assembles the 23 kernel-checked rows (`Row00`–`Row22`, covering `s = E|q|⁴ − 2 ∈ [0, 42]`)
with the soundness theorem `radiusRow_sound` (`RadiusCheck.lean`), the antiholomorphic Stein
calculus (`AntiStein.lean`) and the circular fourth-moment cap `E|q|⁴ ≤ 44`
(`Circular.gaussian_fourth_moment_le_44`) to prove the strict normalized bound

  `∫ x, √(eval x (radU a b)) ∂(stdGaussian d) < 93 / 100`

for every normalized circular cubic Gaussian chaos `q = a + i b` in any finite dimension
(giving the homogeneous bound `E|q| ≤ (93/100) ‖q‖₂` on all of `H₂,₁`, including `q = 0`, in
`WitnessCap.lean`). All 23 rows are verified by proof-producing kernel reduction (`decide +kernel`)
with no `native_decide` axioms.
-/

open MeasureTheory MvPolynomial Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The 23 rows of the certified cubic radius bound covering `s ∈ [0, 42]`. -/
def radiusRows : List RadiusRow :=
  [radiusRow00, radiusRow01, radiusRow02, radiusRow03, radiusRow04, radiusRow05,
   radiusRow06, radiusRow07, radiusRow08, radiusRow09, radiusRow10, radiusRow11,
   radiusRow12, radiusRow13, radiusRow14, radiusRow15, radiusRow16, radiusRow17,
   radiusRow18, radiusRow19, radiusRow20, radiusRow21, radiusRow22]

/-- The 23 `s`-intervals form a contiguous cover of `[0, 42]`. -/
theorem radiusRows_chain : chainTo RadiusRow.sLo RadiusRow.sHi 0 42 radiusRows = true := by
  decide +kernel

/-- Every row in `radiusRows` passes `checkRadiusRow · (93 / 100)`. -/
theorem radiusRows_ok : ∀ r ∈ radiusRows, checkRadiusRow r (93 / 100) = true := by
  intro r hr
  simp only [radiusRows, List.mem_cons, List.not_mem_nil, or_false] at hr
  rcases hr with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact radiusRow00_ok
  · exact radiusRow01_ok
  · exact radiusRow02_ok
  · exact radiusRow03_ok
  · exact radiusRow04_ok
  · exact radiusRow05_ok
  · exact radiusRow06_ok
  · exact radiusRow07_ok
  · exact radiusRow08_ok
  · exact radiusRow09_ok
  · exact radiusRow10_ok
  · exact radiusRow11_ok
  · exact radiusRow12_ok
  · exact radiusRow13_ok
  · exact radiusRow14_ok
  · exact radiusRow15_ok
  · exact radiusRow16_ok
  · exact radiusRow17_ok
  · exact radiusRow18_ok
  · exact radiusRow19_ok
  · exact radiusRow20_ok
  · exact radiusRow21_ok
  · exact radiusRow22_ok

/-- **Certified cubic radius upper bound (`< 93/100`)**: for every normalized circular cubic
Gaussian chaos `q = a + i b` (`Chaos3 a`, `E a² = 1/2`, `Circular J a b`), `E|q| < 93/100`. -/
theorem first_moment_lt_93 {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) :
    ∫ x, √(eval x (radU a b)) ∂(stdGaussian d) < 93 / 100 := by
  have hE := gaussE_isGaussianExpectation d
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by simp only [map_mul]; ring)
  set s : ℝ := ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2
  have hs0 : 0 ≤ s := by
    have h4 := hc.fourth_moment_contractions hE ha
    rw [haa'] at h4
    have heq : gaussE d (radU a b ^ 2) = ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) := by
      rw [gaussE_apply]; simp only [map_pow]
    have := gramN_nonneg (gramT J a b)
    have := gramH_nonneg (gramT J a b)
    have := gramB_nonneg (gramT J a b)
    have := gramY_nonneg (gramT J a b)
    linarith
  have hs42 : s ≤ 42 := by
    have hcap := hc.gaussian_fourth_moment_le_44 a b ha haa
    linarith
  obtain ⟨r, hr, hlo, hhi⟩ := chainTo_sound RadiusRow.sLo RadiusRow.sHi radiusRows 0 42
    radiusRows_chain s (by simpa using hs0) (by simpa using hs42)
  have hlt := radiusRow_sound a b ha haa hc r (93 / 100) (radiusRows_ok r hr) hlo hhi
  simpa using hlt

/-- Non-strict form `E|q| ≤ 93/100` for every normalized circular cubic Gaussian chaos. -/
theorem first_moment_le_93 {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) :
    ∫ x, √(eval x (radU a b)) ∂(stdGaussian d) ≤ 93 / 100 :=
  (first_moment_lt_93 a b ha haa hc).le

end Grothe.LowerAnalytic
