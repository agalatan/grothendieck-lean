import Mathlib

/-!
# The anchored-pair majorant of `|L + p| + |L − p|` (route Core, pointwise)

For complex `L, p`, prices `A₀, B₀ > 0` and `R ≥ |L|` (`anchored_potential_formalization.md`
§2, eqs. (2)–(4)):

  `|L + p| + |L − p| ≤ (|L+p|² + A₀²)/(2A₀) + (|L−p|² + B₀²)/(2B₀) − T²/(2D)`,
  `T = 4 Re(p L̄) − (A₀² − B₀²)`, `D = S(S² + 4R² + 4R|A₀ − B₀|)`, `S = A₀ + B₀`.

The proof is the exact identity
  `2DA₀B₀(Maj − A − B) = (B₀(d−S)u − A₀(d+S)v)² + (B₀u² + A₀v²)(D − K)`
(`A = |L+p|`, `B = |L−p|`, `d = A − B`, `u = A − A₀`, `v = B − B₀`, `K = A₀(d+S)² + B₀(d−S)²`) and
`D − K = S(4R² − d² + 4R|A₀−B₀| − 2d(A₀−B₀)) ≥ 0` from `|d| ≤ 2|L| ≤ 2R`.  The plain Young bound
(`T²/(2D)` dropped) is `young_pair`.

* `anchored_real`: the real inequality for any `A, B` with `|A − B| ≤ 2R`;
* `anchored_pair`: the complex statement;
* `anchored_pair_poly`: the same majorant written as a polynomial in `p` (the form that is
  integrated: `|L ± p|² = |L|² + |p|² ± 2 Re(p L̄)`).
-/

open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

/-- The denominator `D = S(S² + 4R² + 4R|A₀ − B₀|)`. -/
noncomputable def majD (A0 B0 R : ℝ) : ℝ :=
  (A0 + B0) * ((A0 + B0) ^ 2 + 4 * R ^ 2 + 4 * R * |A0 - B0|)

lemma majD_pos {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : 0 ≤ R) : 0 < majD A0 B0 R := by
  unfold majD
  have : 0 ≤ 4 * R * |A0 - B0| := by have := abs_nonneg (A0 - B0); positivity
  have : 0 < (A0 + B0) ^ 2 := by positivity
  have : 0 < A0 + B0 := by linarith
  positivity

/-- **The anchored majorant, real form.** -/
theorem anchored_real {A B A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : 0 ≤ R)
    (hd : |A - B| ≤ 2 * R) :
    A + B ≤ (A ^ 2 + A0 ^ 2) / (2 * A0) + (B ^ 2 + B0 ^ 2) / (2 * B0)
      - (A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
  have hD := majD_pos hA hB hR
  set D := majD A0 B0 R with hDdef
  set S := A0 + B0
  set d := A - B
  set u := A - A0
  set v := B - B0
  set K := A0 * (d + S) ^ 2 + B0 * (d - S) ^ 2
  have hDK : 0 ≤ D - K := by
    have e : D - K = S * (4 * R ^ 2 - d ^ 2 + 4 * R * |A0 - B0| - 2 * d * (A0 - B0)) := by
      simp only [hDdef, majD, K, S, d]; ring
    rw [e]
    have hS : 0 < S := by simp only [S]; linarith
    have h1 : d * (A0 - B0) ≤ |d| * |A0 - B0| := by rw [← abs_mul]; exact le_abs_self _
    have h2 : |d| * |A0 - B0| ≤ 2 * R * |A0 - B0| := mul_le_mul_of_nonneg_right hd (abs_nonneg _)
    have h3 : d ^ 2 ≤ (2 * R) ^ 2 := by
      rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) hd 2
    have : 0 ≤ 4 * R ^ 2 - d ^ 2 + 4 * R * |A0 - B0| - 2 * d * (A0 - B0) := by nlinarith
    positivity
  have key : 2 * D * A0 * B0 * ((A ^ 2 + A0 ^ 2) / (2 * A0) + (B ^ 2 + B0 ^ 2) / (2 * B0)
      - (A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * D) - (A + B))
      = (B0 * (d - S) * u - A0 * (d + S) * v) ^ 2 + (B0 * u ^ 2 + A0 * v ^ 2) * (D - K) := by
    simp only [K, S, d, u, v]
    field_simp
    ring
  have hpos : 0 ≤ 2 * D * A0 * B0 * ((A ^ 2 + A0 ^ 2) / (2 * A0) + (B ^ 2 + B0 ^ 2) / (2 * B0)
      - (A ^ 2 - B ^ 2 - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * D) - (A + B)) := by
    rw [key]; positivity
  have h2D : 0 < 2 * D * A0 * B0 := by positivity
  have := (mul_nonneg_iff_of_pos_left h2D).1 hpos
  linarith

lemma norm_add_sub_norm_sub_le (L p : ℂ) : |‖L + p‖ - ‖L - p‖| ≤ 2 * ‖L‖ := by
  rw [abs_le]
  constructor
  · have : ‖L - p‖ ≤ ‖L + p‖ + 2 * ‖L‖ := by
      calc ‖L - p‖ = ‖2 * L - (L + p)‖ := by ring_nf
        _ ≤ ‖2 * L‖ + ‖L + p‖ := norm_sub_le _ _
        _ = ‖L + p‖ + 2 * ‖L‖ := by rw [norm_mul]; norm_num; ring
    linarith
  · have : ‖L + p‖ ≤ ‖L - p‖ + 2 * ‖L‖ := by
      calc ‖L + p‖ = ‖2 * L - (L - p)‖ := by ring_nf
        _ ≤ ‖2 * L‖ + ‖L - p‖ := norm_sub_le _ _
        _ = ‖L - p‖ + 2 * ‖L‖ := by rw [norm_mul]; norm_num; ring
    linarith

lemma normSq_add_eq (L p : ℂ) : ‖L + p‖ ^ 2 = ‖L‖ ^ 2 + ‖p‖ ^ 2 + 2 * (p * conj L).re := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq,
    Complex.normSq_add]
  simp [Complex.mul_re]; ring

lemma normSq_sub_eq (L p : ℂ) : ‖L - p‖ ^ 2 = ‖L‖ ^ 2 + ‖p‖ ^ 2 - 2 * (p * conj L).re := by
  rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq,
    Complex.normSq_sub]
  simp [Complex.mul_re]; ring

/-- **The anchored-pair majorant** (AF eq. (4)). -/
theorem anchored_pair (L p : ℂ) {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : ‖L‖ ≤ R) :
    ‖L + p‖ + ‖L - p‖ ≤ (‖L + p‖ ^ 2 + A0 ^ 2) / (2 * A0) + (‖L - p‖ ^ 2 + B0 ^ 2) / (2 * B0)
      - (4 * (p * conj L).re - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
  have hT : ‖L + p‖ ^ 2 - ‖L - p‖ ^ 2 = 4 * (p * conj L).re := by
    rw [normSq_add_eq, normSq_sub_eq]; ring
  have h := anchored_real hA hB ((norm_nonneg L).trans hR)
    ((norm_add_sub_norm_sub_le L p).trans (by linarith))
  rw [hT] at h
  exact h

/-- **The anchored-pair majorant as a polynomial in `p`**: with `x = Re(p L̄)`,
`|L + p| + |L − p| ≤ ν(|L|² + |p|²) + 2δν x + (A₀ + B₀)/2 − (4x − (A₀² − B₀²))²/(2D)`,
`ν = (1/A₀ + 1/B₀)/2`, `δν = (1/A₀ − 1/B₀)/2`. -/
theorem anchored_pair_poly (L p : ℂ) {A0 B0 R : ℝ} (hA : 0 < A0) (hB : 0 < B0) (hR : ‖L‖ ≤ R) :
    ‖L + p‖ + ‖L - p‖ ≤ (1 / A0 + 1 / B0) / 2 * (‖L‖ ^ 2 + ‖p‖ ^ 2)
      + 2 * ((1 / A0 - 1 / B0) / 2) * (p * conj L).re + (A0 + B0) / 2
      - (4 * (p * conj L).re - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 R) := by
  have h := anchored_pair L p hA hB hR
  rw [normSq_add_eq, normSq_sub_eq] at h
  have e : (‖L‖ ^ 2 + ‖p‖ ^ 2 + 2 * (p * conj L).re + A0 ^ 2) / (2 * A0)
      + (‖L‖ ^ 2 + ‖p‖ ^ 2 - 2 * (p * conj L).re + B0 ^ 2) / (2 * B0)
      = (1 / A0 + 1 / B0) / 2 * (‖L‖ ^ 2 + ‖p‖ ^ 2)
        + 2 * ((1 / A0 - 1 / B0) / 2) * (p * conj L).re + (A0 + B0) / 2 := by
    field_simp; ring
  linarith

/-- **The plain Young bound** (route P): `|L + p| + |L − p| ≤ ν(|L|² + |p|²) + 2δν Re(p L̄) + (A₀+B₀)/2`. -/
theorem young_pair (L p : ℂ) {A0 B0 : ℝ} (hA : 0 < A0) (hB : 0 < B0) :
    ‖L + p‖ + ‖L - p‖ ≤ (1 / A0 + 1 / B0) / 2 * (‖L‖ ^ 2 + ‖p‖ ^ 2)
      + 2 * ((1 / A0 - 1 / B0) / 2) * (p * conj L).re + (A0 + B0) / 2 := by
  have h := anchored_pair_poly L p hA hB le_rfl
  have : 0 ≤ (4 * (p * conj L).re - (A0 ^ 2 - B0 ^ 2)) ^ 2 / (2 * majD A0 B0 ‖L‖) :=
    div_nonneg (sq_nonneg _) (by have := majD_pos hA hB (norm_nonneg L); positivity)
  linarith

end Grothe.LowerAnalytic
