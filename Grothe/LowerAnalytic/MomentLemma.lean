import Mathlib

/-!
# The scalar three-moment lemma

If `Z ≥ 0` has `E Z = 1`,
`E Z² = m > 1` and `E Z³ ≤ N` with `N > m²`, then with `α = (N−m)/(m−1)`, `β = (N−m²)/(m−1)`,

  `E √Z ≤ (1 + √β) / √(α + 2√β)`.

Proof: with `r, s > 0`, `r² + s² = α`, `r²s² = β`, `A = r+s`, `D = rs`, `c = 1/(2A³D)`, the cubic
`p(z) = c[z³ + (−2A²+3D)z² + (A⁴−A²D+3D²)z + D²(A²+D)]` satisfies the polynomial identity
`p(y²) − y = c (y−r)²(y−s)²((y+A)² + D) ≥ 0`, so `√Z ≤ p(Z)` pointwise; integrating and using
`E Z³ ≤ N` (the leading coefficient is positive) gives `E√Z ≤ (1+D)/A`, which is the stated
value since `√β = D` and `√(α + 2√β) = A`.
-/

namespace Grothe.LowerAnalytic

open MeasureTheory

noncomputable section

/-- The cubic majorant `p` of `√·` determined by `A = r+s`, `D = rs`. -/
def pMaj (A D z : ℝ) : ℝ :=
  1 / (2 * A ^ 3 * D) *
    (z ^ 3 + (-2 * A ^ 2 + 3 * D) * z ^ 2 + (A ^ 4 - A ^ 2 * D + 3 * D ^ 2) * z + D ^ 2 * (A ^ 2 + D))

lemma pMaj_identity (r s y : ℝ) (hr : 0 < r) (hs : 0 < s) :
    pMaj (r + s) (r * s) (y ^ 2) - y
      = 1 / (2 * (r + s) ^ 3 * (r * s)) *
          ((y - r) ^ 2 * (y - s) ^ 2 * ((y + (r + s)) ^ 2 + r * s)) := by
  unfold pMaj
  have h1 : (r + s) ≠ 0 := by positivity
  have h2 : r * s ≠ 0 := by positivity
  field_simp
  ring

lemma sqrt_le_pMaj (r s : ℝ) (hr : 0 < r) (hs : 0 < s) (z : ℝ) (hz : 0 ≤ z) :
    √z ≤ pMaj (r + s) (r * s) z := by
  have hy := Real.sq_sqrt hz
  have hid := pMaj_identity r s (√z) hr hs
  rw [hy] at hid
  have hpos : 0 ≤ 1 / (2 * (r + s) ^ 3 * (r * s)) *
      ((√z - r) ^ 2 * (√z - s) ^ 2 * ((√z + (r + s)) ^ 2 + r * s)) := by positivity
  linarith

/-- Existence of the root parameters `r, s`. -/
lemma exists_rs (α β m : ℝ) (hm : 1 < m) (hαβ : α - β = m) (hβ : 0 < β) :
    ∃ r s : ℝ, 0 < r ∧ 0 < s ∧ r ^ 2 + s ^ 2 = α ∧ r ^ 2 * s ^ 2 = β := by
  have hα : 0 < α := by linarith
  have hαm : α = m + β := by linarith
  have hdisc : 0 < α ^ 2 - 4 * β := by
    rw [hαm]
    nlinarith [sq_nonneg (β - 1), mul_pos (by linarith : (0:ℝ) < m - 1) hβ]
  obtain ⟨q, hq0, hq2⟩ : ∃ q : ℝ, 0 ≤ q ∧ q ^ 2 = α ^ 2 - 4 * β :=
    ⟨√(α ^ 2 - 4 * β), Real.sqrt_nonneg _, Real.sq_sqrt hdisc.le⟩
  have hqα : q < α := by nlinarith
  have ha : 0 < (α - q) / 2 := by linarith
  have hb : 0 < (α + q) / 2 := by linarith
  refine ⟨√((α - q) / 2), √((α + q) / 2), Real.sqrt_pos.2 ha, Real.sqrt_pos.2 hb, ?_, ?_⟩
  · rw [Real.sq_sqrt ha.le, Real.sq_sqrt hb.le]; ring
  · rw [Real.sq_sqrt ha.le, Real.sq_sqrt hb.le]; nlinarith

/-- **The three-moment lemma.** -/
theorem moment_lemma {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (Z : Ω → ℝ) (hZ : ∀ ω, 0 ≤ Z ω)
    (hZ1 : Integrable Z μ) (hZ2 : Integrable (fun ω => Z ω ^ 2) μ)
    (hZ3 : Integrable (fun ω => Z ω ^ 3) μ)
    (m N : ℝ) (h1 : ∫ ω, Z ω ∂μ = 1) (h2 : ∫ ω, Z ω ^ 2 ∂μ = m) (h3 : ∫ ω, Z ω ^ 3 ∂μ ≤ N)
    (hm : 1 < m) (hN : m ^ 2 < N) :
    ∫ ω, √(Z ω) ∂μ
      ≤ (1 + √((N - m ^ 2) / (m - 1))) / √((N - m) / (m - 1) + 2 * √((N - m ^ 2) / (m - 1))) := by
  have hm1 : 0 < m - 1 := by linarith
  obtain ⟨α, hα⟩ : ∃ α : ℝ, α = (N - m) / (m - 1) := ⟨_, rfl⟩
  obtain ⟨β, hβ⟩ : ∃ β : ℝ, β = (N - m ^ 2) / (m - 1) := ⟨_, rfl⟩
  rw [← hα, ← hβ]
  have hαβ : α - β = m := by rw [hα, hβ]; field_simp; ring
  have hβ0 : 0 < β := by rw [hβ]; exact div_pos (by nlinarith) hm1
  have hN' : N = m + α * (m - 1) := by rw [hα, div_mul_cancel₀ _ hm1.ne']; ring
  obtain ⟨r, s, hr, hs, hrs1, hrs2⟩ := exists_rs α β m hm hαβ hβ0
  have hA : 0 < r + s := by positivity
  have hD : 0 < r * s := by positivity
  -- pointwise majorant
  have hpt : ∀ ω, √(Z ω) ≤ pMaj (r + s) (r * s) (Z ω) := fun ω => sqrt_le_pMaj r s hr hs _ (hZ ω)
  -- integrability
  have hsqrt : Integrable (fun ω => √(Z ω)) μ := by
    refine Integrable.mono' ((integrable_const (1 : ℝ)).add hZ1)
      (Real.continuous_sqrt.comp_aestronglyMeasurable hZ1.aestronglyMeasurable)
      (Filter.Eventually.of_forall fun ω => ?_)
    show ‖√(Z ω)‖ ≤ 1 + Z ω
    rw [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _),
      Real.sqrt_le_left (by linarith [hZ ω])]
    nlinarith [hZ ω]
  have hB : Integrable (fun ω => (-2 * (r + s) ^ 2 + 3 * (r * s)) * Z ω ^ 2) μ := hZ2.const_mul _
  have hC : Integrable (fun ω => ((r + s) ^ 4 - (r + s) ^ 2 * (r * s) + 3 * (r * s) ^ 2) * Z ω) μ :=
    hZ1.const_mul _
  have hAB : Integrable (fun ω => Z ω ^ 3 + (-2 * (r + s) ^ 2 + 3 * (r * s)) * Z ω ^ 2) μ :=
    hZ3.add hB
  have hABC : Integrable (fun ω => Z ω ^ 3 + (-2 * (r + s) ^ 2 + 3 * (r * s)) * Z ω ^ 2
      + ((r + s) ^ 4 - (r + s) ^ 2 * (r * s) + 3 * (r * s) ^ 2) * Z ω) μ := hAB.add hC
  have hp : Integrable (fun ω => pMaj (r + s) (r * s) (Z ω)) μ := by
    unfold pMaj
    exact (hABC.add (integrable_const _)).const_mul _
  have hint : ∫ ω, pMaj (r + s) (r * s) (Z ω) ∂μ
      = 1 / (2 * (r + s) ^ 3 * (r * s)) *
        ((∫ ω, Z ω ^ 3 ∂μ) + (-2 * (r + s) ^ 2 + 3 * (r * s)) * m
          + ((r + s) ^ 4 - (r + s) ^ 2 * (r * s) + 3 * (r * s) ^ 2) * 1
          + (r * s) ^ 2 * ((r + s) ^ 2 + r * s)) := by
    unfold pMaj
    rw [integral_const_mul, integral_add hABC (integrable_const _), integral_add hAB hC,
      integral_add hZ3 hB, integral_const_mul, integral_const_mul, integral_const,
      h1, h2, probReal_univ, one_smul]
  have hc : 0 < 1 / (2 * (r + s) ^ 3 * (r * s)) := by positivity
  have hkey : 1 / (2 * (r + s) ^ 3 * (r * s)) *
        (N + (-2 * (r + s) ^ 2 + 3 * (r * s)) * m
          + ((r + s) ^ 4 - (r + s) ^ 2 * (r * s) + 3 * (r * s) ^ 2) * 1
          + (r * s) ^ 2 * ((r + s) ^ 2 + r * s)) = (1 + r * s) / (r + s) := by
    rw [hN', ← hαβ, ← hrs1, ← hrs2]
    field_simp
    ring
  have hsβ : √β = r * s := by
    rw [← hrs2, Real.sqrt_eq_iff_mul_self_eq (by positivity) hD.le]; ring
  have hsα : √(α + 2 * (r * s)) = r + s := by
    rw [← hrs1, show r ^ 2 + s ^ 2 + 2 * (r * s) = (r + s) ^ 2 by ring, Real.sqrt_sq hA.le]
  rw [hsβ, hsα]
  calc ∫ ω, √(Z ω) ∂μ ≤ ∫ ω, pMaj (r + s) (r * s) (Z ω) ∂μ := integral_mono hsqrt hp hpt
    _ ≤ 1 / (2 * (r + s) ^ 3 * (r * s)) *
        (N + (-2 * (r + s) ^ 2 + 3 * (r * s)) * m
          + ((r + s) ^ 4 - (r + s) ^ 2 * (r * s) + 3 * (r * s) ^ 2) * 1
          + (r * s) ^ 2 * ((r + s) ^ 2 + r * s)) := by
        rw [hint]
        exact mul_le_mul_of_nonneg_left (by linarith) hc.le
    _ = (1 + r * s) / (r + s) := hkey

end

end Grothe.LowerAnalytic
