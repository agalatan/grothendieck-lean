import Grothe.Upper.Checker

/-!
# The certified value

`dloIntFinal` is the scaled integer `mix₀ − Σ_{n≥1}|mixₙ| − Σᵢ wtᵢ (majTailᵢ + highTailᵢ)`
computed by the interval kernel (the `49` branch columns in parallel tasks); the one
`native_decide` below evaluates it and compares it with the threshold
`DloNeeded = 0.7117963574001465` required by the assembly.  Its exact value is
`Dlo = dloIntFinal / 2¹²⁸ = 242211749261977464268894054327787713931 / 2¹²⁸ ≈ 0.71179635740059`.
-/

namespace Grothe.Upper

open GrotheKernel

/-- `DloNeeded` scaled by `2¹²⁸` (rounded up). -/
def DloNeededInt : ℤ := 242211749261824103449536951366484966336

lemma DloNeededInt_ge : (DloNeeded : ℚ) * ((D : ℤ) : ℚ) ≤ (DloNeededInt : ℚ) := by
  unfold DloNeeded DloNeededInt D K; norm_num

/-- The certified scaled value clears the threshold (`native_decide`; trusts the compiled
evaluation of the Mathlib-free kernel). -/
theorem dloIntFinal_ge : DloNeededInt ≤ dloIntFinal := by native_decide

/-- The explicit certified value `Dlo = dloIntFinal / 2¹²⁸`. -/
def Dlo : ℚ := (dloIntFinal : ℚ) / ((D : ℤ) : ℚ)

/-- **The finite certificate holds with the certified value.** -/
theorem finite_certificate : FiniteCertificate Dlo := finite_certificate_exact

/-- The certified value clears the threshold. -/
theorem dlo_ge_needed : DloNeeded ≤ Dlo := by
  unfold Dlo
  have hD : (0 : ℚ) < ((D : ℤ) : ℚ) := by unfold D K; norm_num
  rw [le_div_iff₀ hD]
  calc (DloNeeded : ℚ) * ((D : ℤ) : ℚ) ≤ (DloNeededInt : ℚ) := DloNeededInt_ge
    _ ≤ (dloIntFinal : ℚ) := by exact_mod_cast dloIntFinal_ge

end Grothe.Upper
