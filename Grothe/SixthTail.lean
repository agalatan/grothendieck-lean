import Grothe.WallisTail

/-!
# The sixth (origin-layer) kernel tail

Upstream (Section 6.2 of the source) proves, via Laguerre energy identities, that the
unweighted coefficient tail of the origin-layer kernel satisfies

  `T₆ ≤ √(a W₁₂₀) + √(b W₁₂₀) + √(ab)/241²`,  `a = 1.174`, `b = 1.176`.

That energy argument is *not* formalised here; it enters the final theorem as a hypothesis.
What the note adds, and what we prove here, is the strictly rational bound (equation (7))
obtained by substituting `W₁₂₀ ≤ 1/(48 (120 + 1/16)³)`:

  `T₆ < 258088051054978 / 10¹⁸`,

replacing the source reserve `2.615·10⁻⁴`.  The three radicals are bounded by the rationals
`118878237195126/10¹⁸`, `118979453251942/10¹⁸`, `20230360607910/10¹⁸`, each checked by squaring.
-/

namespace Grothe

noncomputable section

lemma sqrt_aW_le : Real.sqrt (1.174 * W 120) ≤ 118878237195126 / 10 ^ 18 := by
  rw [Real.sqrt_le_left (by norm_num)]
  have h1 := W_le 120
  have h2 : 1.174 * W 120 ≤ 1.174 * (1 / (48 * (((120 : ℕ) : ℝ) + 1 / 16) ^ 3)) := by gcongr
  refine h2.trans ?_
  norm_num

lemma sqrt_bW_le : Real.sqrt (1.176 * W 120) ≤ 118979453251942 / 10 ^ 18 := by
  rw [Real.sqrt_le_left (by norm_num)]
  have h1 := W_le 120
  have h2 : 1.176 * W 120 ≤ 1.176 * (1 / (48 * (((120 : ℕ) : ℝ) + 1 / 16) ^ 3)) := by gcongr
  refine h2.trans ?_
  norm_num

lemma sqrt_ab_div_le : Real.sqrt (1.174 * 1.176) / 241 ^ 2 ≤ 20230360607910 / 10 ^ 18 := by
  rw [div_le_iff₀ (by norm_num), Real.sqrt_le_left (by norm_num)]
  norm_num

/-- **Equation (7) of the note**: the energy majorant of the sixth tail is at most
`258088051054978 / 10¹⁸` (given the proven bound `W₁₂₀ ≤ 1/(48 (120+1/16)³)`). -/
theorem sixth_majorant_le :
    Real.sqrt (1.174 * W 120) + Real.sqrt (1.176 * W 120) + Real.sqrt (1.174 * 1.176) / 241 ^ 2
      ≤ 258088051054978 / 10 ^ 18 := by
  have := add_le_add (add_le_add sqrt_aW_le sqrt_bW_le) sqrt_ab_div_le
  refine this.trans (le_of_eq ?_)
  norm_num

/-- **The source's reserve (6.13)**: with the weaker `W₁₂₀ ≤ 1/(48·119³)` one only gets
`2.615·10⁻⁴ = 523/2000000`. -/
theorem sixth_majorant_le_source :
    Real.sqrt (1.174 * W 120) + Real.sqrt (1.176 * W 120) + Real.sqrt (1.174 * 1.176) / 241 ^ 2
      ≤ 523 / 2000000 := by
  have hW := W_le_source 120 (by norm_num)
  have h1 : Real.sqrt (1.174 * W 120) ≤ 0.00012048 := by
    rw [Real.sqrt_le_left (by norm_num)]
    have : 1.174 * W 120 ≤ 1.174 * (1 / (48 * (((120 : ℕ) : ℝ) - 1) ^ 3)) := by gcongr
    refine this.trans ?_
    norm_num
  have h2 : Real.sqrt (1.176 * W 120) ≤ 0.00012058 := by
    rw [Real.sqrt_le_left (by norm_num)]
    have : 1.176 * W 120 ≤ 1.176 * (1 / (48 * (((120 : ℕ) : ℝ) - 1) ^ 3)) := by gcongr
    refine this.trans ?_
    norm_num
  have h3 : Real.sqrt (1.174 * 1.176) / 241 ^ 2 ≤ 0.00002024 := by
    rw [div_le_iff₀ (by norm_num), Real.sqrt_le_left (by norm_num)]
    norm_num
  linarith

end

end Grothe
