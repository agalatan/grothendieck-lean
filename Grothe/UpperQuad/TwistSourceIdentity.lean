import Grothe.UpperQuad.TwistFactorPolynomial
import Grothe.UpperChaos.HermiteBasis
import Grothe.UpperChaos.HermiteConjugation

/-!
# The actual twisted source as a damped polynomial

On the real radial slice, the Taylor multiplier is the evaluated polynomial `Q` times Gaussian
damping. Conjugation swaps the Hermite indices while leaving the real normalization unchanged.
Separating the radial and auxiliary damping gives the polynomial used by the Gaussian tilt.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistSourceIdentity

open Complex MvPolynomial Grothe.UpperChaos
open scoped ComplexConjugate

noncomputable section

local notation "ε" => (Grothe.Upper.phaseEpsQ : ℝ)

/-- The actual Hermite source has exactly the polynomial factor and the two Gaussian factors. -/
theorem source_eq_damped_polynomial (j c d : ℕ) (r : ℝ) (w : ℂ) :
    conj (hfun (c, d) w) * (I * (phiT ((r : ℂ), w) : ℂ)) ^ j =
      (Real.exp (-((j : ℝ) * ε) * r ^ 2) : ℂ) *
        ((Real.exp (-((j : ℝ) * ε) * normSq w) : ℂ) *
          ev w ((nrm c d : ℂ) • (H d c * TwistFactorPolynomial.Q (r : ℂ) ^ j))) := by
  have hexp : (Real.exp (-ε * (r ^ 2 + normSq w)) : ℂ) ^ j =
      (Real.exp (-((j : ℝ) * ε) * r ^ 2) : ℂ) *
        (Real.exp (-((j : ℝ) * ε) * normSq w) : ℂ) := by
    have hsplit : (j : ℝ) * (-ε * (r ^ 2 + normSq w)) =
        -((j : ℝ) * ε) * r ^ 2 + -((j : ℝ) * ε) * normSq w := by ring
    rw [← Complex.ofReal_pow, ← Real.exp_nat_mul, hsplit, Real.exp_add, Complex.ofReal_mul]
  rw [← TwistFactorPolynomial.ev_Q_damped r w, mul_pow]
  simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap]
  rw [hexp]
  simp only [ev, smul_eval, map_mul, map_pow]
  ring

end

end Grothe.UpperQuad.TwistSourceIdentity
