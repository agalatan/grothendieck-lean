import Grothe.Upper.Checker

/-!
# The certified value

`dloIntFinal` is the scaled integer `P₀ − Σ_{n≥1}|Pₙ|` computed by the interval kernel; the one
`native_decide` below evaluates it (compiled kernel code, roughly 80 minutes) and compares it with
the threshold `DloNeeded = 0.71179527215609909` required by the assembly.  Its exact value is
`Dlo = dloIntFinal / 2¹²⁸ ≈ 0.7117952721565`.
-/

namespace Grothe.Upper

open GrotheKernel

/-- `DloNeeded` scaled by `2¹²⁸` (rounded up). -/
def DloNeededInt : ℤ := 242211379972410963915579386827419700064

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
