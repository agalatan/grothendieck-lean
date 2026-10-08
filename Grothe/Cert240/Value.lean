import Grothe.Cert240.Checker

/-!
# The explicit certified value

`dloIntFinal` is evaluated by `native_decide` (compiled kernel code, about 25 minutes).  The
resulting rational is `Dlo = 242211386207595090474349798194917751060 / 2^128 ≈ 0.7117952905`.
-/

namespace Grothe.Cert240

open GrotheKernel

/-- The scaled certified value (`native_decide`; trusts the compiled kernel evaluation). -/
theorem dloIntFinal_ge : (242211386207595090474349798194917751060 : ℤ) ≤ dloIntFinal := by
  native_decide

/-- The explicit rational `Dlo` certified by the checker. -/
def Dlo240 : ℚ := 242211386207595090474349798194917751060 / 340282366920938463463374607431768211456

/-- **The finite certificate holds with the explicit value `Dlo240`.** -/
theorem finite_certificate_240 : FiniteCertificate240 Dlo240 := by
  refine finite_certificate_240_exact.mono ?_
  unfold Dlo240
  have hD : ((D : ℤ) : ℚ) = 340282366920938463463374607431768211456 := by
    unfold D K; norm_num
  rw [hD, div_le_div_iff_of_pos_right (by norm_num)]
  exact_mod_cast dloIntFinal_ge

end Grothe.Cert240
