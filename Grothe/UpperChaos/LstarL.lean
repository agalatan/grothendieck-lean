import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Analysis.Complex.Basic

/-!
# The `L*L` identity for an integral operator

For a kernel `L : X → Y → ℂ` and `g : Y → ℂ`, with the triple product integrable,

    ∫ₓ ‖∫_y L(x, y) g(y)‖² = Re ∫_{(y, y')} conj(g y) g(y') M(y, y'),   M(y, y') = ∫ₓ conj(L(x, y)) L(x, y'),

and hence `∫ₓ ‖∫_y L g‖² ≤ ∫_{(y, y')} ‖g y‖ ‖g y'‖ ‖M(y, y')‖`. Together with the Schur test
(`SchurTest.lean`) applied to a majorant of `‖M‖`, this bounds the operator norm of `L` (step 3 of the `hardy`
plan, `data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md`).
-/

open MeasureTheory Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos.LstarL

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y] {μ : Measure X} {ν : Measure Y}
  [SFinite μ] [SFinite ν]

/-- The integrand on `X × (Y × Y)`. -/
def tri (L : X → Y → ℂ) (g : Y → ℂ) (p : X × (Y × Y)) : ℂ :=
  conj (L p.1 p.2.1 * g p.2.1) * (L p.1 p.2.2 * g p.2.2)

/-- `‖∫ f‖² = Re ∫∫ conj(f y) f(y')`. -/
lemma norm_integral_sq (f : Y → ℂ) :
    ‖∫ y, f y ∂ν‖ ^ 2 = (∫ q : Y × Y, conj (f q.1) * f q.2 ∂(ν.prod ν)).re := by
  rw [integral_prod_mul (fun y => conj (f y)) f, integral_conj, mul_comm, Complex.mul_conj,
    Complex.ofReal_re, Complex.normSq_eq_norm_sq]

theorem integral_norm_sq_eq (L : X → Y → ℂ) (g : Y → ℂ)
    (hint : Integrable (tri L g) (μ.prod (ν.prod ν))) :
    ∫ x, ‖∫ y, L x y * g y ∂ν‖ ^ 2 ∂μ =
      (∫ q : Y × Y, conj (g q.1) * g q.2 * ∫ x, conj (L x q.1) * L x q.2 ∂μ ∂(ν.prod ν)).re := by
  simp_rw [norm_integral_sq]
  have h1 : ∀ x, (∫ q : Y × Y, conj (L x q.1 * g q.1) * (L x q.2 * g q.2) ∂(ν.prod ν))
      = ∫ q : Y × Y, tri L g (x, q) ∂(ν.prod ν) := fun x => rfl
  simp_rw [h1]
  have hre := integral_re hint.integral_prod_left
  simp only [RCLike.re_to_complex] at hre
  rw [hre, integral_integral_swap (f := fun x q => tri L g (x, q)) hint]
  congr 1
  refine integral_congr_ae (Filter.Eventually.of_forall fun q => ?_)
  simp only [tri]
  rw [← integral_const_mul]
  congr 1; ext x
  simp only [map_mul]; ring

theorem integral_norm_sq_le (L : X → Y → ℂ) (g : Y → ℂ)
    (hint : Integrable (tri L g) (μ.prod (ν.prod ν))) :
    ∫ x, ‖∫ y, L x y * g y ∂ν‖ ^ 2 ∂μ ≤
      ∫ q : Y × Y, ‖g q.1‖ * ‖g q.2‖ * ‖∫ x, conj (L x q.1) * L x q.2 ∂μ‖ ∂(ν.prod ν) := by
  rw [integral_norm_sq_eq L g hint]
  refine (Complex.re_le_norm _).trans ((norm_integral_le_integral_norm _).trans (le_of_eq ?_))
  congr 1; ext q
  simp

end Grothe.UpperChaos.LstarL
