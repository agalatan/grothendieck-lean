import Grothe.UpperChaos.IndependentMomentJets
import Grothe.UpperChaos.BipartiteCoefficientJets

/-!
# Gate-ordered finite physical jets and the Hermite contractions

Agent-ID: codex-2ca4.

The derivative order is x, v, y, u from outermost to innermost, exactly the
order used by `BipartiteCoefficientJets.pairJet`. This avoids any assumption
about commuting mixed derivatives. The u/y derivatives insert the same
physical variable; v/x then perform the finite contraction at zero.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.PhysicalGateJets

open IndependentSourceMoments IndependentSourcePolynomial IndependentMomentJets
open HermiteFallingFactorial HolomorphicCoefficientJets
open BipartitePolynomialL2 BipartiteCoefficientJets

noncomputable section

/-- The exact one-physical-variable coherent moment, in gate coordinates
`((y,u),(x,v))`, retaining its inverse-rate Gaussian mass. -/
def physicalCoherentMoment (r : ℝ) (p q : ℕ) (s : PairSources) : ℂ :=
  Complex.exp (-s.2.1 * s.1.1) * Complex.exp (-s.2.2 * s.1.2) *
    momentValue r (s.1.1 + s.1.2) (s.2.1 + s.2.2) p q

private theorem inner_u_jet (p q c : ℕ) {r : ℝ} (hr : 0 < r) (x y v : ℂ) :
    iteratedDeriv c (fun u => physicalCoherentMoment r p q ((y, u), (x, v))) 0 =
      ∑ i ∈ Finset.range (c + 1), ((c.choose i : ℂ) * (-v) ^ i) *
        (Complex.exp (-x * y) * momentValue r y (x + v) (p + (c - i)) q) := by
  unfold physicalCoherentMoment
  simp only [mul_assoc]
  rw [iteratedDeriv_const_mul_field,
    first_source_exponential_jet p q c hr y (x + v) (-v), Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  ring

/-- The two inner source derivatives are an exact finite double sum. -/
theorem inner_yu_jet (p q b c : ℕ) {r : ℝ} (hr : 0 < r) (x v : ℂ) :
    iteratedDeriv b (fun y => iteratedDeriv c (fun u =>
      physicalCoherentMoment r p q ((y, u), (x, v))) 0) 0 =
      ∑ i ∈ Finset.range (c + 1), ∑ k ∈ Finset.range (b + 1),
        (((c.choose i : ℂ) * (-v) ^ i) * ((b.choose k : ℂ) * (-x) ^ k)) *
          momentValue r 0 (x + v) (p + (c - i) + (b - k)) q := by
  have he := funext (fun y => inner_u_jet p q c hr x y v)
  rw [he]
  have hM (i : ℕ) : ContDiff ℂ b
      (fun y => momentValue r y (x + v) (p + (c - i)) q) :=
    contDiff_momentValue_a _ _ _ hr _
  rw [iteratedDeriv_fun_sum (fun i hi =>
    (contDiff_const.mul ((by fun_prop : ContDiff ℂ b
      (fun y : ℂ => Complex.exp (-x * y))).mul (hM i))).contDiffAt)]
  apply Finset.sum_congr rfl
  intro i hi
  rw [iteratedDeriv_const_mul_field]
  have hm := first_source_exponential_jet (p + (c - i)) q b hr 0 (x + v) (-x)
  simp only [zero_add] at hm
  rw [hm, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  ring

private theorem outer_v_monomial_jet (p q i k d : ℕ) {r : ℝ} (hr : 0 < r)
    (c x : ℂ) :
    iteratedDeriv d (fun v => c * (x ^ k * (v ^ i *
      momentValue r 0 (x + v) p q))) 0 =
      c * (d.descFactorial i : ℂ) *
        (x ^ k * momentValue r 0 x p (q + (d - i))) := by
  have hM : ContDiff ℂ d (fun v => momentValue r 0 (x + v) p q) :=
    (contDiff_momentValue_b p q d hr 0).comp (contDiff_const.add contDiff_id)
  rw [iteratedDeriv_const_mul_field, iteratedDeriv_const_mul_field,
    iteratedDeriv_pow_mul_zero i d _ hM.contDiffAt,
    iteratedDeriv_momentValue_b_shift p q (d - i) hr 0 x]
  ring

/-- Finite linearity of the two outer jets, specialized to the physical
moment family. Its smoothness is derived from the dominated moment theorem. -/
theorem outer_xv_finite_jet {ι : Type*} (t : Finset ι) (c : ι → ℂ)
    (i k p q : ι → ℕ) (a d : ℕ) {r : ℝ} (hr : 0 < r) :
    iteratedDeriv a (fun x => iteratedDeriv d (fun v =>
      ∑ j ∈ t, c j * (x ^ k j * (v ^ i j *
        momentValue r 0 (x + v) (p j) (q j)))) 0) 0 =
      ∑ j ∈ t, c j * (d.descFactorial (i j) : ℂ) *
        (a.descFactorial (k j) : ℂ) *
          momentValue r 0 0 (p j) (q j + (d - i j) + (a - k j)) := by
  have hv (j : ι) (x : ℂ) : ContDiff ℂ d
      (fun v => c j * (x ^ k j * (v ^ i j *
        momentValue r 0 (x + v) (p j) (q j)))) := by
    have hM : ContDiff ℂ d (fun v => momentValue r 0 (x + v) (p j) (q j)) :=
      (contDiff_momentValue_b _ _ _ hr 0).comp (contDiff_const.add contDiff_id)
    exact contDiff_const.mul (contDiff_const.mul ((contDiff_id.pow _).mul hM))
  have he : (fun x => iteratedDeriv d (fun v =>
      ∑ j ∈ t, c j * (x ^ k j * (v ^ i j *
        momentValue r 0 (x + v) (p j) (q j)))) 0) =
      fun x => ∑ j ∈ t, c j * (d.descFactorial (i j) : ℂ) *
        (x ^ k j * momentValue r 0 x (p j) (q j + (d - i j))) := by
    funext x
    rw [iteratedDeriv_fun_sum (fun j hj => (hv j x).contDiffAt)]
    apply Finset.sum_congr rfl
    intro j hj
    exact outer_v_monomial_jet (p j) (q j) (i j) (k j) d hr (c j) x
  rw [he]
  have hx (j : ι) : ContDiff ℂ a
      (fun x => c j * (d.descFactorial (i j) : ℂ) *
        (x ^ k j * momentValue r 0 x (p j) (q j + (d - i j)))) :=
    contDiff_const.mul ((contDiff_id.pow _).mul
      (contDiff_momentValue_b _ _ _ hr 0))
  rw [iteratedDeriv_fun_sum (fun j hj => (hx j).contDiffAt)]
  apply Finset.sum_congr rfl
  intro j hj
  rw [iteratedDeriv_const_mul_field,
    iteratedDeriv_pow_mul_zero (k j) a _
      (contDiff_momentValue_b (p j) (q j + (d - i j)) a hr 0).contDiffAt,
    iteratedDeriv_momentValue_b (p j) (q j + (d - i j)) (a - k j) hr]
  ring

/-- The exact finite contraction formula for the full gate-ordered moment
jet. The first pair of powers is `(outgoing.q,incoming.p)`. -/
theorem pairJet_physicalCoherentMoment (p q a b c d : ℕ) {r : ℝ} (hr : 0 < r) :
    pairJet ((b, c), (a, d)) (physicalCoherentMoment r p q) =
      ∑ i ∈ Finset.range (c + 1), ∑ k ∈ Finset.range (b + 1),
        (((-1 : ℂ) ^ i * (c.choose i : ℂ) * (d.descFactorial i : ℂ)) *
          ((-1 : ℂ) ^ k * (b.choose k : ℂ) * (a.descFactorial k : ℂ))) *
          momentValue r 0 0 (p + (c - i) + (b - k)) (q + (d - i) + (a - k)) := by
  classical
  unfold pairJet outerJet innerJet
  simp_rw [inner_yu_jet p q b c hr]
  let t := (Finset.range (c + 1)).product (Finset.range (b + 1))
  let coeff (j : ℕ × ℕ) : ℂ :=
    ((-1 : ℂ) ^ j.1 * (c.choose j.1 : ℂ)) *
      ((-1 : ℂ) ^ j.2 * (b.choose j.2 : ℂ))
  have he (x v : ℂ) :
      (∑ i ∈ Finset.range (c + 1), ∑ k ∈ Finset.range (b + 1),
        (((c.choose i : ℂ) * (-v) ^ i) * ((b.choose k : ℂ) * (-x) ^ k)) *
          momentValue r 0 (x + v) (p + (c - i) + (b - k)) q) =
      ∑ j ∈ t, coeff j * (x ^ j.2 * (v ^ j.1 *
        momentValue r 0 (x + v) (p + (c - j.1) + (b - j.2)) q)) := by
    rw [show t = (Finset.range (c + 1)).product (Finset.range (b + 1)) from rfl,
      Finset.sum_product]
    apply Finset.sum_congr rfl
    intro i hi
    apply Finset.sum_congr rfl
    intro k hk
    simp only [coeff]
    rw [neg_pow v i, neg_pow x k]
    ring
  simp_rw [he]
  rw [outer_xv_finite_jet t coeff Prod.fst Prod.snd
    (fun j => p + (c - j.1) + (b - j.2)) (fun _ => q) a d hr]
  rw [show t = (Finset.range (c + 1)).product (Finset.range (b + 1)) from rfl,
    Finset.sum_product]
  apply Finset.sum_congr rfl
  intro i hi
  apply Finset.sum_congr rfl
  intro k hk
  simp only [coeff]
  ring

private theorem physical_Hermite_product (p q a b c d : ℕ) (r : ℝ) (z : ℂ) :
    integrand r 0 0 p q z * conj (ev z (H a b)) * ev z (H c d) =
      ∑ i ∈ Finset.range (c + 1), ∑ k ∈ Finset.range (b + 1),
        (((-1 : ℂ) ^ i * (c.choose i : ℂ) * (d.descFactorial i : ℂ)) *
          ((-1 : ℂ) ^ k * (b.choose k : ℂ) * (a.descFactorial k : ℂ))) *
          integrand r 0 0 (p + (c - i) + (b - k)) (q + (d - i) + (a - k)) z := by
  calc
    _ = (ev z (H c d) * conj (ev z (H a b))) * integrand r 0 0 p q z := by ring
    _ = _ := by
      rw [conj_ev_H_swap]
      simp only [ev_H_eq_fallingFactorial, Finset.sum_mul, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i hi
      apply Finset.sum_congr rfl
      intro k hk
      simp only [integrand, pow_add]
      ring

theorem integrable_physical_Hermite_product (p q a b c d : ℕ) {r : ℝ} (hr : 0 < r) :
    Integrable (fun z => integrand r 0 0 p q z *
      conj (ev z (H a b)) * ev z (H c d)) gaussC := by
  simp_rw [physical_Hermite_product]
  exact integrable_finsetSum _ fun i hi => integrable_finsetSum _ fun k hk =>
    (integrable_integrand (p + (c - i) + (b - k))
      (q + (d - i) + (a - k)) hr 0 0).const_mul _

/-- The full gate-ordered source jet equals the actual outgoing/incoming
Hermite matrix integrand for every pair of Hermite indices and every
physical monomial. There is no derivative-under-integral step here. -/
theorem pairJet_eq_integral_Hermite_product (p q a b c d : ℕ) {r : ℝ} (hr : 0 < r) :
    pairJet ((b, c), (a, d)) (physicalCoherentMoment r p q) =
      ∫ z, integrand r 0 0 p q z * conj (ev z (H a b)) * ev z (H c d) ∂gaussC := by
  rw [pairJet_physicalCoherentMoment p q a b c d hr]
  simp_rw [physical_Hermite_product]
  rw [integral_finsetSum _ fun i hi => integrable_finsetSum _ fun k hk =>
    (integrable_integrand (p + (c - i) + (b - k))
      (q + (d - i) + (a - k)) hr 0 0).const_mul _]
  apply Finset.sum_congr rfl
  intro i hi
  rw [integral_finsetSum _ fun k hk =>
    (integrable_integrand (p + (c - i) + (b - k))
      (q + (d - i) + (a - k)) hr 0 0).const_mul _]
  apply Finset.sum_congr rfl
  intro k hk
  rw [integral_const_mul, integral_eq_momentValue _ _ hr]

end
end Grothe.UpperChaos.PhysicalGateJets
