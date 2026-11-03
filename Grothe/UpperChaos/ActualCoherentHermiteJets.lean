import Grothe.UpperChaos.HermiteFallingFactorial
import Grothe.UpperChaos.ActualTaylorFiniteCoefficients
import Grothe.UpperChaos.ActualSourceCoefficientExtraction
import Grothe.UpperChaos.GateFockCoefficients
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas

/-!
# Finite coherent source derivatives are the actual Hermite insertions

Agent-ID: codex-2ca4.

This proves the Hermite generating identity as an identity of finite source
derivatives of the actual exponential, for every pair of natural indices.
There is no infinite generating series and no interchange with physical
integration. The last integral is an integral of an already identified
pointwise finite derivative, not a derivative of an integral.

The remaining coefficient bridge is to identify the finite Gaussian source
extraction formula with these finite derivatives after physical integration.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualCoherentHermiteJets

open ActualTaylorCoherent ActualTaylorFiniteCoefficients HermiteFallingFactorial
open ActualSourceCoefficientExtraction GateFockCoefficients

noncomputable section

/-- The elementary polynomial chain rule in the source that translates the
second physical variable. This is proved for the existing `CPoly`. -/
private theorem hasDerivAt_eval_shift (P : CPoly) (a b x : ℂ) :
    HasDerivAt (fun t : ℂ => eval ![a, b - t] P)
      (-eval ![a, b - x] (pderiv 1 P)) x := by
  induction P using MvPolynomial.induction_on with
  | C c => simpa using hasDerivAt_const x c
  | add P Q hP hQ =>
      simpa only [map_add, neg_add] using hP.fun_add hQ
  | mul_X P i hP =>
      fin_cases i
      · convert hP.fun_mul (hasDerivAt_const x a) using 1 <;>
          simp [pderiv_X, mul_comm]
      · convert hP.fun_mul ((hasDerivAt_id' x).const_sub b) using 1 <;>
          simp [pderiv_X]
        ring

/-- The physical Hermite polynomial after the two source translations. -/
def shiftedHermite (z x y : ℂ) (p q : ℕ) : ℂ :=
  eval ![conj z - y, z - x] (H p q)

/-- The outgoing exponential in the production coherent pair. -/
def outgoing (z x y : ℂ) : ℂ :=
  Complex.exp (x * conj z + y * z - x * y)

private theorem hasDerivAt_outgoing_x (z x y : ℂ) :
    HasDerivAt (fun t => outgoing z t y)
      (Complex.exp (x * conj z + y * z - x * y) * (conj z - y)) x := by
  have h : HasDerivAt (fun t : ℂ => t * conj z + y * z - t * y)
      (conj z - y) x := by
    exact ((hasDerivAt_mul_const (x := x) (conj z)).add_const (y * z)).fun_sub
      (hasDerivAt_mul_const (x := x) y)
  simpa only [outgoing] using h.cexp

private theorem hasDerivAt_outgoing_y (z x y : ℂ) :
    HasDerivAt (fun t => outgoing z x t)
      (Complex.exp (x * conj z + y * z - x * y) * (z - x)) y := by
  have h : HasDerivAt (fun t : ℂ => x * conj z + t * z - x * t)
      (z - x) y := by
    exact ((hasDerivAt_mul_const (x := y) z).const_add (x * conj z)).fun_sub
      (hasDerivAt_const_mul (x := y) x)
  simpa only [outgoing] using h.cexp

/-- Differentiating the source applies the actual physical Hermite creation
operator, including its negative contraction term. -/
private theorem hasDerivAt_shiftedHermite_outgoing (z x y : ℂ) (p q : ℕ) :
    HasDerivAt (fun t => shiftedHermite z t y p q * outgoing z t y)
      (shiftedHermite z x y (p + 1) q * outgoing z x y) x := by
  have h := (hasDerivAt_eval_shift (H p q) (conj z - y) z x).fun_mul
    (hasDerivAt_outgoing_x z x y)
  convert h using 1 <;>
    simp only [shiftedHermite, H_succ_left, A0, map_sub, map_mul, eval_X,
      Matrix.cons_val_zero, outgoing]
  ring

private theorem iteratedDeriv_outgoing_y (z x : ℂ) (q : ℕ) (y : ℂ) :
    iteratedDeriv q (fun t => outgoing z x t) y =
      (z - x) ^ q * outgoing z x y := by
  induction q generalizing y with
  | zero => simp
  | succ q ih =>
      rw [iteratedDeriv_succ, funext ih]
      have h := (hasDerivAt_outgoing_y z x y).const_mul ((z - x) ^ q)
      calc
        _ = (z - x) ^ q *
            (Complex.exp (x * conj z + y * z - x * y) * (z - x)) := h.deriv
        _ = _ := by rw [pow_succ]; unfold outgoing; ring

/-- All finite mixed outgoing derivatives, with the source translations still
visible. This is a proved generating identity, not an input hypothesis. -/
theorem mixed_outgoing_derivative (z : ℂ) (p q : ℕ) (x y : ℂ) :
    iteratedDeriv p (fun a => iteratedDeriv q (fun b => outgoing z a b) y) x =
      shiftedHermite z x y p q * outgoing z x y := by
  induction p generalizing x with
  | zero =>
      rw [iteratedDeriv_zero, iteratedDeriv_outgoing_y]
      simp [shiftedHermite, H_zero_eq_X1_pow]
  | succ p ih =>
      rw [iteratedDeriv_succ, funext ih]
      exact (hasDerivAt_shiftedHermite_outgoing z x y p q).deriv

private theorem ev_conj_point (z : ℂ) (p q : ℕ) :
    ev (conj z) (H p q) = conj (ev z (H p q)) := by
  rw [ev_H_eq_fallingFactorial, conj_ev_H_eq_fallingFactorial]
  simp only [Complex.conj_conj]

/-- The outgoing source exponents `(p,q)` give the conjugate physical Hermite
factor, exactly as required by the matrix-entry pairing. -/
theorem mixed_outgoing_at_zero (z : ℂ) (p q : ℕ) :
    iteratedDeriv p (fun x => iteratedDeriv q (fun y => outgoing z x y) 0) 0 =
      conj (ev z (H p q)) := by
  rw [mixed_outgoing_derivative]
  simpa [shiftedHermite, outgoing, ev, zv] using ev_conj_point z p q

/-- Incoming sources have the opposite physical conjugation convention. -/
theorem mixed_incoming_at_zero (z : ℂ) (p q : ℕ) :
    iteratedDeriv p (fun u => iteratedDeriv q (fun v =>
      Complex.exp (u * z + v * conj z - u * v)) 0) 0 = ev z (H p q) := by
  have h := mixed_outgoing_at_zero (conj z) p q
  rw [ev_conj_point, Complex.conj_conj] at h
  simpa only [outgoing, Complex.conj_conj] using h

/-- Finite derivatives of the existing four-source coherent pair. The source
order here is `(x,y,u,v)`; the gate index performs its separate permutation. -/
def pairJet (m n : ℕ × ℕ) (z : ℂ) : ℂ :=
  iteratedDeriv m.1 (fun x => iteratedDeriv m.2 (fun y =>
    iteratedDeriv n.1 (fun u => iteratedDeriv n.2 (fun v =>
      coherentPair x y u v z) 0) 0) 0) 0

/-- Every finite coherent source derivative is the actual unnormalized
outgoing/incoming Hermite insertion, with no factorial or conjugation loss. -/
theorem pairJet_eq (m n : ℕ × ℕ) (z : ℂ) :
    pairJet m n z = conj (ev z (H m.1 m.2)) * ev z (H n.1 n.2) := by
  unfold pairJet
  simp only [coherentPair, iteratedDeriv_const_mul_field,
    iteratedDeriv_mul_const_field]
  change
    (iteratedDeriv m.1 (fun x => iteratedDeriv m.2 (fun y => outgoing z x y) 0) 0) *
      (iteratedDeriv n.1 (fun u => iteratedDeriv n.2 (fun v =>
        Complex.exp (u * z + v * conj z - u * v)) 0) 0) = _
  rw [mixed_outgoing_at_zero, mixed_incoming_at_zero]

/-- The physical two-coordinate jet with the original Hermite normalization. -/
def normalizedPhysicalJet (m n : Idx2) (zw : ℂ × ℂ) : ℂ :=
  ((nrm2 m : ℂ) * (nrm2 n : ℂ)) *
    (pairJet m.1 n.1 zw.1 * pairJet m.2 n.2 zw.2)

theorem normalizedPhysicalJet_eq (m n : Idx2) (zw : ℂ × ℂ) :
    normalizedPhysicalJet m n zw = conj (hfun2 m zw) * hfun2 n zw := by
  simp only [normalizedPhysicalJet, pairJet_eq, hfun2, H2, map_mul,
    Complex.conj_ofReal]
  ring

private theorem sqrt_fac2 (m : Idx2) :
    Real.sqrt (fac2 m : ℝ) =
      (Real.sqrt (m.1.1.factorial : ℝ) * Real.sqrt (m.1.2.factorial : ℝ)) *
        (Real.sqrt (m.2.1.factorial : ℝ) * Real.sqrt (m.2.2.factorial : ℝ)) := by
  have ha : (0 : ℝ) ≤ (m.1.1.factorial : ℝ) := Nat.cast_nonneg _
  have hb : (0 : ℝ) ≤ (m.1.2.factorial : ℝ) := Nat.cast_nonneg _
  have hc : (0 : ℝ) ≤ (m.2.1.factorial : ℝ) := Nat.cast_nonneg _
  simp only [fac2, Nat.cast_mul]
  rw [Real.sqrt_mul (mul_nonneg ha hb), Real.sqrt_mul ha, Real.sqrt_mul hc]

/-- The eight Gaussian source normalizations in the actual gate order equal
the two production Hermite normalization factors. -/
theorem gate_normalization_eq (m n : Idx2) :
    normalization4 (gateMatrixIndexEquiv (m, n)).1 *
      normalization4 (gateMatrixIndexEquiv (m, n)).2 = nrm2 m * nrm2 n := by
  simp only [gateMatrixIndexEquiv, Equiv.coe_fn_mk, normalization4, nrm2,
    sqrt_fac2, mul_inv_rev]
  ring

/-- Integrability concerns the actual finite derivative after its pointwise
identification, so no derivative-under-integral premise occurs. -/
theorem integrable_actual_physical_jet (j : ℕ) (m n : Idx2) :
    Integrable (fun zw => taylorPhasePower j zw * normalizedPhysicalJet m n zw) mu2 := by
  refine (integrable_matrixEntry j m n).congr
    (Filter.Eventually.of_forall fun zw => ?_)
  change conj (hfun2 m zw) * taylorPhasePower j zw * hfun2 n zw =
    taylorPhasePower j zw * normalizedPhysicalJet m n zw
  rw [normalizedPhysicalJet_eq]
  ring

/-- The actual multiplier integrated against its finite coherent source jet
gives precisely the normalized Hermite matrix entry. F0 is excluded. -/
theorem integral_actual_physical_jet (j : ℕ) (m n : Idx2) :
    (∫ zw, taylorPhasePower j zw * normalizedPhysicalJet m n zw ∂mu2) =
      matrixEntry j m n := by
  unfold matrixEntry
  apply integral_congr_ae
  refine Filter.Eventually.of_forall fun zw => ?_
  change taylorPhasePower j zw * normalizedPhysicalJet m n zw =
    conj (hfun2 m zw) * taylorPhasePower j zw * hfun2 n zw
  rw [normalizedPhysicalJet_eq]
  ring

end
end Grothe.UpperChaos.ActualCoherentHermiteJets
