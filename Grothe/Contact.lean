import Mathlib

/-!
# Haagerup's contact point: the exact arithmetic of the source's final audit

The source compares its repaired slope `Γ₀ = 0.71179516600840569540` with Haagerup's constant
`γ_H = π(1 + x_H)/8`, where `x_H` solves `2x·₂F₁(½,½;2;x²) = 1 + x` (source (2.5)–(2.6)).  Its
script `audit_best7_final_arithmetic.py` checks, with exact rationals:

* `Φ(x₊) > 0` for the degree-63 partial sum of `Φ(x) = 2x·₂F₁(½,½;2;x²) − 1 − x` at
  `x₊ = 0.812557858821473` (all omitted terms are positive, so `Φ(x₊) > 0`, hence `x_H < x₊`
  by monotonicity of `Φ` — the analytic step is not formalised here);
* `γ_H ≤ π(1 + x₊)/8 < 0.71178980668499814812` (we use Mathlib's `Real.pi_lt_d20` instead
  of the script's Machin partial sums);
* the gain `Γ₀ − γ_H > 5.3593234075·10⁻⁶` and the reciprocal `1/Γ₀ < 1.404898554745441`.
-/

namespace Grothe

/-- Partial sums of the hypergeometric series `₂F₁(½,½;2;x²) = Σ Aₙ x^{2n}`, with
`A₀ = 1`, `Aₙ₊₁/Aₙ = (2n+1)²/(4(n+1)(n+2))`. -/
def hypPartial (x : ℚ) : ℕ → ℚ × ℚ
  | 0 => (1, 1)
  | n + 1 =>
    let p := hypPartial x n
    let term := p.1 * ((2 * n + 1) ^ 2 : ℚ) / (4 * (n + 1) * (n + 2)) * (x * x)
    (term, p.2 + term)

/-- `x₊ = 812557858821473 / 10¹⁵`. -/
def xPlus : ℚ := 812557858821473 / 10 ^ 15

/-- The degree-63 partial sum of `Φ(x₊)` is positive (indeed `> 7.0246·10⁻¹⁷`). -/
theorem phi_partial_pos : 2 * xPlus * (hypPartial xPlus 63).2 - 1 - xPlus > 70246 / 10 ^ 21 := by
  native_decide

/-- Haagerup's constant is below `0.71178980668499814812` (given `x_H ≤ x₊`). -/
theorem gammaH_upper : Real.pi * (1 + (812557858821473 : ℝ) / 10 ^ 15) / 8
    < 0.71178980668499814812 := by
  have := Real.pi_lt_d20
  nlinarith

/-- The source's gain over Haagerup. -/
theorem gain_over_haagerup :
    (0.71179516600840569540 : ℝ) - 0.71178980668499814812 > 5.3593234075e-6 := by norm_num

/-- The source's reciprocal bound `1/Γ₀ < 1.404898554745441`. -/
theorem reciprocal_bound : (1 : ℝ) / 0.71179516600840569540 < 1.404898554745441 := by norm_num

/-- Haagerup's bound `γ_H⁻¹ > 1.404909132735795` (source: improvement over Haagerup is
`> 1.0578·10⁻⁵`): the reciprocal of the upper bound for `γ_H`. -/
theorem haagerup_reciprocal_lower :
    (1 : ℝ) / 0.71178980668499814812 > 1.404909132735795 := by norm_num

end Grothe
