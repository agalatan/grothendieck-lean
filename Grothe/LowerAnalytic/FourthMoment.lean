import Grothe.LowerAnalytic.CircularTensor
import Grothe.LowerAnalytic.Gaussian

/-!
# The fourth-moment cap for a pair of cubic chaoses

For real polynomials `a`, `b` in the third chaos (`Chaos3`) with `E a² = E b² = 1/2` and
`E ab = 0`, the second moment of `U = a² + b²` (`radU`) satisfies `E U² ≤ 62`
(`gE_radU_sq_le`), and in particular the cap `E U² ≤ 2 + (31/4)²` of the lower certificate
(`gaussian_radU_cap`).

The scalar bound follows directly from the exact fourth cumulant. For `f = ∂³F/6`, write
`N = Σ f²`, `s = tenS f`, and `h = tenH f`. The identities `E F² = 6N` and
`E F⁴ − 3(E F²)² = 1296(s + 3h/2)`, together with `s ≤ N²` and `h ≤ s`, give
`E F⁴ ≤ 93(E F²)²` (`Chaos3.fourth_le`). The tensor inequalities are finite-dimensional
Cauchy–Schwarz and contraction under averaging; they need no symmetry or positivity premise.
The scalar theorem uses only `IsGaussianExpectation` and `Chaos3`. The established interface
`chaos3_fourth_le` retains its positivity parameter.

For the pair, `a⁴ + b⁴ + ¼(a+b)⁴ + ¼(b−a)⁴ = (3/2)U²` gives
`E U² ≤ (2/3)(93/4 + 93/4 + 93/4 + 93/4) = 62`.
-/

open MeasureTheory MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

variable [DecidableEq ι]

/-- The sharp fourth-moment bound of the third chaos follows from its Wick identity. -/
theorem Chaos3.fourth_le {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    E (F ^ 4) ≤ 93 * E (F ^ 2) ^ 2 := by
  have h4 := hF.wick4 hE
  have h2 : E (F ^ 2) = 6 * ∑ a, ∑ b, ∑ c, cubicKernel F a b c ^ 2 := by
    simpa only [sq] using hF.gE_sq_eq_kernel hE
  rw [h2] at h4 ⊢
  nlinarith [tenS_le_sq_sum (cubicKernel F), tenH_le_tenS (cubicKernel F)]

variable (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P))
include hpos

/-- **The fourth moment of the third chaos**: `E F⁴ ≤ 93 (E F²)²`. -/
theorem chaos3_fourth_le {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    E (F * F * (F * F)) ≤ 93 * E (F * F) ^ 2 := by
  clear hpos
  simpa only [pow_succ, pow_zero, mul_one, mul_assoc] using hF.fourth_le hE

/-- **The fourth-moment cap** for a normalized pair in the third chaos: `E U² ≤ 62`. -/
theorem gE_radU_sq_le {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2) (hab : E (a * b) = 0) :
    E (radU a b * radU a b) ≤ 62 := by
  obtain ⟨sp, sm⟩ := gE_add_sub_sq (v := 1) (by rw [haa]) (by rw [hbb]) hab
  have h1 := chaos3_fourth_le hE hpos ha
  have h2 := chaos3_fourth_le hE hpos hb
  have h3 := chaos3_fourth_le hE hpos (ha.add hb)
  have h4 := chaos3_fourth_le hE hpos (ha.sub hb)
  rw [haa] at h1
  rw [hbb] at h2
  rw [sp] at h3
  rw [sm] at h4
  have e : (6 : MvPolynomial ι ℝ) * (radU a b * radU a b)
      = 4 * (a * a * (a * a)) + 4 * (b * b * (b * b))
        + (a + b) * (a + b) * ((a + b) * (a + b)) + (b - a) * (b - a) * ((b - a) * (b - a)) := by
    unfold radU; ring
  have h := congrArg E e
  rw [ofNat_mul_apply, map_add, map_add, map_add, ofNat_mul_apply, ofNat_mul_apply] at h
  nlinarith

end expectation

/-- **The cap on `E|q|⁴` for the Gaussian law**: for a normalized pair in the third chaos,
`E U² ≤ 62 ≤ 2 + (31/4)²` under the standard Gaussian measure. -/
theorem gaussian_radU_cap {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2)
    (hbb : ∫ x, eval x b ^ 2 ∂(stdGaussian d) = 1 / 2)
    (hab : ∫ x, eval x a * eval x b ∂(stdGaussian d) = 0) :
    ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) ≤ 62 := by
  have toE : ∀ P Q : MvPolynomial (Fin d) ℝ,
      ∫ x, eval x P * eval x Q ∂(stdGaussian d) = gaussE d (P * Q) := fun P Q => by
    rw [gaussE_apply]; simp only [map_mul]
  have sqE : ∀ P : MvPolynomial (Fin d) ℝ,
      ∫ x, eval x P ^ 2 ∂(stdGaussian d) = gaussE d (P * P) := fun P => by
    rw [← toE]; simp only [sq]
  rw [sqE] at haa hbb ⊢
  rw [toE] at hab
  exact gE_radU_sq_le (gaussE_isGaussianExpectation d) gaussE_mul_self_nonneg ha hb haa hbb hab

end

end Grothe.LowerAnalytic
