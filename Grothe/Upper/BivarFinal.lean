import Grothe.Upper.BivarCert
import Grothe.Upper.BivarData

/-!
# The bound certified by `certData`

The interval checker certifies `FiniteCertC certData dloNeededQ` (by `native_decide` on the
scaled integer `dloIntC certData`), and the assembly turns it into
`IsGrothendieckBound targetQ`, conditional on domination of Haagerup's kernel and on the
analytic hypotheses of the two-coordinate branches (`BivarHyps`).
-/

namespace Grothe

open Upper GrotheKernel

/-- The data side conditions hold. -/
theorem certData_ok : certOK certData = true := by native_decide

/-- The required value, scaled (rounded up). -/
def dloNeededInt : Int := ofRatHi dloNeededQ

/-- **The finite computation.** -/
theorem dloIntC_ge : dloNeededInt ≤ dloIntC certData := by native_decide

lemma dloNeeded_le : dloNeededQ ≤ (dloIntC certData : ℚ) / ((D : ℤ) : ℚ) := by
  have h1 : (dloNeededQ : ℝ) * D ≤ (dloNeededInt : ℝ) := le_ofRatHi _
  have h2 : (dloNeededInt : ℝ) ≤ (dloIntC certData : ℝ) := by exact_mod_cast dloIntC_ge
  have hD := D_pos
  have : (dloNeededQ : ℝ) ≤ (dloIntC certData : ℝ) / D := by
    rw [le_div_iff₀ hD]; linarith
  have e : ((((dloIntC certData : ℚ) / ((D : ℤ) : ℚ) : ℚ)) : ℝ) = (dloIntC certData : ℝ) / D := by
    push_cast; rfl
  exact_mod_cast (e ▸ this)

theorem finite_certC : FiniteCertC certData dloNeededQ :=
  (finite_certC_exact certData_ok).mono dloNeeded_le

theorem rest_lt_needed : 0 < dloNeededQ - restQ certData := by native_decide

theorem target_numeric : massQ certData ≤ targetQ * (dloNeededQ - restQ certData) := by
  native_decide

/-- **Main theorem for `certData`.**  Conditional on domination of Haagerup's kernel and, for
every two-coordinate branch `i` with data `d` and true table `μ i`: validity of the rounding
(`DominatedKernel (radialKernel (bivarKernel P Q (μ i)))`), summability of `|μ i|`, vanishing
on even `n + m`, unknown mass `≤ d.T`, and the box enclosures of the known entries. -/
theorem complex_grothendieck_upper' (hh : DominatedKernel (radialKernel h))
    (μ : ℕ → ℕ × ℕ → ℝ) (hb : BivarHyps certData μ) :
    IsGrothendieckBound (targetQ : ℝ) := by
  have hpos : 0 < (dloNeededQ : ℝ) - restQ certData := by exact_mod_cast rest_lt_needed
  have hB := bound_of_certC certData_ok hh μ hb dloNeededQ finite_certC hpos
  refine hB.mono ?_
  rw [div_le_iff₀ hpos]
  exact_mod_cast target_numeric

end Grothe
