import Grothe.UpperChaos.PhiHorner
import LeanCert.Engine.TaylorModel.ExpLog

/-! The normalized integer Horner representation of LeanCert's exponential
Taylor polynomial, at any degree. On the listed indices the factorial ratios
are integers, so a generator can keep the Horner leaves exact and perform a
single final division. The identities do not assume a numerical enclosure.
Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.ExponentialHorner

open LeanCert.Engine

def coefficients (n : ℕ) : List ℚ :=
  (List.range (n + 1)).map (fun k => (n.factorial : ℚ) / k.factorial)

/-- One reusable identity supports adaptive choices of Taylor degree. -/
theorem scaled_horner (n : ℕ) (z : ℝ) :
    (n.factorial : ℝ)⁻¹ * evalG (fun c : ℚ => (c : ℝ)) (coefficients n) z =
      Polynomial.aeval z (TaylorModel.expTaylorPoly n) := by
  rw [coefficients, evalG_range_map, TaylorModel.expTaylorPoly_aeval_eq]
  simp only [iteratedDeriv_eq_iterate, Real.iter_deriv_exp, Real.exp_zero, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k _
  have hn : (n.factorial : ℝ) ≠ 0 := by exact_mod_cast n.factorial_ne_zero
  push_cast
  field_simp

end Grothe.UpperChaos.ExponentialHorner
