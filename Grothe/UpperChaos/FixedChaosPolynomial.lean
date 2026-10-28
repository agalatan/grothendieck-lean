import Grothe.UpperChaos.FixedChaosSmoothing

/-!
# Finite Gaussian-moment formula for every actual smoothing entry

The matrix entry is reduced to a finite polynomial calculation in the actual
production matrix entries. No saved numerical matrix is assumed correct.
This direct formula is a soundness bridge; efficient symmetric-power evaluation
and numerical enclosures remain separate work.

Agent-ID: codex-7c2e
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

noncomputable section

abbrev P8 := MvPolynomial (Fin 8) ℂ
abbrev Sample := (ℂ × ℂ) × (ℂ × ℂ)

def gaussianCoords (v : Sample) : Fin 8 → ℂ :=
  ![v.1.1, conj v.1.1, v.1.2, conj v.1.2,
    v.2.1, conj v.2.1, v.2.2, conj v.2.2]

def evaluate (v : Sample) (P : P8) : ℂ := eval (gaussianCoords v) P

private lemma evaluate_monomial (v : Sample) (s : Fin 8 →₀ ℕ) (c : ℂ) :
    evaluate v (monomial s c) = c *
      ((v.1.1 ^ s 0 * conj v.1.1 ^ s 1) * (v.1.2 ^ s 2 * conj v.1.2 ^ s 3)) *
      ((v.2.1 ^ s 4 * conj v.2.1 ^ s 5) * (v.2.2 ^ s 6 * conj v.2.2 ^ s 7)) := by
  rw [evaluate, eval_monomial, Finsupp.prod_fintype _ _ (fun _ => pow_zero _),
    Fin.prod_univ_eight]
  simp only [gaussianCoords, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val,
    Fin.isValue]
  ring

theorem integrable_evaluate (P : P8) :
    Integrable (fun v => evaluate v P) (mu2.prod mu2) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    simp_rw [evaluate_monomial]
    exact (((integrable_monomial (s 0) (s 1)).mul_prod
      (integrable_monomial (s 2) (s 3))).const_mul c).mul_prod
      ((integrable_monomial (s 4) (s 5)).mul_prod (integrable_monomial (s 6) (s 7)))
  | add P Q hP hQ =>
    simp only [evaluate, map_add] at *
    exact hP.add hQ

/-- The exact four-independent-complex-Gaussian monomial moment. -/
def monomialMoment (s : Fin 8 →₀ ℕ) : ℂ :=
  (mom (s 0) (s 1) * mom (s 2) (s 3)) *
    (mom (s 4) (s 5) * mom (s 6) (s 7))

lemma integral_evaluate_monomial (s : Fin 8 →₀ ℕ) (c : ℂ) :
    (∫ v, evaluate v (monomial s c) ∂(mu2.prod mu2)) = c * monomialMoment s := by
  have hpair (a b d e : ℕ) :
      (∫ u : ℂ × ℂ, (u.1 ^ a * conj u.1 ^ b) * (u.2 ^ d * conj u.2 ^ e) ∂mu2) =
        mom a b * mom d e := by
    rw [integral_prod_mul (μ := gaussC) (ν := gaussC)
      (f := fun z : ℂ => z ^ a * conj z ^ b) (g := fun z : ℂ => z ^ d * conj z ^ e),
      integral_moment, integral_moment]
    rfl
  simp_rw [evaluate_monomial]
  rw [integral_prod_mul (μ := mu2) (ν := mu2)
    (f := fun u : ℂ × ℂ => c *
      ((u.1 ^ s 0 * conj u.1 ^ s 1) * (u.2 ^ s 2 * conj u.2 ^ s 3)))
    (g := fun u : ℂ × ℂ =>
      (u.1 ^ s 4 * conj u.1 ^ s 5) * (u.2 ^ s 6 * conj u.2 ^ s 7)),
    integral_const_mul, hpair, hpair]
  simp only [monomialMoment, mul_assoc]

/-- A finite sum of coefficients times factorial moments; it contains no integral. -/
def finiteMoment (P : P8) : ℂ :=
  ∑ s ∈ P.support, P.coeff s * monomialMoment s

theorem integral_evaluate_eq_finiteMoment (P : P8) :
    (∫ v, evaluate v P ∂(mu2.prod mu2)) = finiteMoment P := by
  conv_lhs => rw [P.as_sum]
  simp only [evaluate, map_sum]
  change (∫ v, ∑ s ∈ P.support, evaluate v (monomial s (P.coeff s)) ∂(mu2.prod mu2)) = _
  rw [integral_finsetSum _ (fun s _ => integrable_evaluate (monomial s (P.coeff s)))]
  exact Finset.sum_congr rfl (fun s _ => integral_evaluate_monomial s (P.coeff s))

def pull (a b : P8) : CPoly →+* P8 := eval₂Hom C ![a, b]

private lemma evaluate_pull (v : Sample) (a b : P8) (z : ℂ)
    (ha : evaluate v a = z) (hb : evaluate v b = conj z) (P : CPoly) :
    evaluate v (pull a b P) = ev z P := by
  induction P using MvPolynomial.induction_on with
  | C c => simp [pull, evaluate, ev]
  | add P Q hP hQ =>
    simp only [map_add, evaluate, ev] at *
    simp only [hP, hQ]
  | mul_X P i hP =>
    simp only [map_mul, evaluate, ev] at *
    simp only [hP]
    congr 1
    fin_cases i
    · simpa [pull, zv, evaluate] using ha
    · simpa [pull, zv, evaluate] using hb

def smoothFirst : P8 :=
  C (m00 : ℂ) * X 0 + C (m01 : ℂ) * X 2 + C (n00 : ℂ) * X 4 + C (n01 : ℂ) * X 6
def smoothFirstConj : P8 :=
  C (m00 : ℂ) * X 1 + C (m01 : ℂ) * X 3 + C (n00 : ℂ) * X 5 + C (n01 : ℂ) * X 7
def smoothSecond : P8 :=
  C (m01 : ℂ) * X 0 + C (m11 : ℂ) * X 2 + C (n01 : ℂ) * X 4 + C (n11 : ℂ) * X 6
def smoothSecondConj : P8 :=
  C (m01 : ℂ) * X 1 + C (m11 : ℂ) * X 3 + C (n01 : ℂ) * X 5 + C (n11 : ℂ) * X 7

private lemma evaluate_input_first (v : Sample) (P : CPoly) :
    evaluate v (pull (X 0) (X 1) P) = ev v.1.1 P :=
  evaluate_pull v _ _ _ (by simp [evaluate, gaussianCoords]) (by simp [evaluate, gaussianCoords]) P

private lemma evaluate_input_second (v : Sample) (P : CPoly) :
    evaluate v (pull (X 2) (X 3) P) = ev v.1.2 P :=
  evaluate_pull v _ _ _ (by simp [evaluate, gaussianCoords]) (by simp [evaluate, gaussianCoords]) P

private lemma evaluate_smooth_first (v : Sample) (P : CPoly) :
    evaluate v (pull smoothFirst smoothFirstConj P) = ev (smoothArg v.1 v.2).1 P :=
  evaluate_pull v _ _ _ (by simp [evaluate, gaussianCoords, smoothFirst, smoothArg])
    (by simp [evaluate, gaussianCoords, smoothFirstConj, smoothArg]) P

private lemma evaluate_smooth_second (v : Sample) (P : CPoly) :
    evaluate v (pull smoothSecond smoothSecondConj P) = ev (smoothArg v.1 v.2).2 P :=
  evaluate_pull v _ _ _ (by simp [evaluate, gaussianCoords, smoothSecond, smoothArg])
    (by simp [evaluate, gaussianCoords, smoothSecondConj, smoothArg]) P

/-- The polynomial for the actual normalized Hermite pairing before integration. -/
def entryPolynomial (j i : Idx2) : P8 :=
  C ((nrm2 j : ℂ) * (nrm2 i : ℂ)) *
    (pull (X 0) (X 1) (conjP (H j.1.1 j.1.2)) *
      pull (X 2) (X 3) (conjP (H j.2.1 j.2.2))) *
    (pull smoothFirst smoothFirstConj (H i.1.1 i.1.2) *
      pull smoothSecond smoothSecondConj (H i.2.1 i.2.2))

theorem evaluate_entryPolynomial (v : Sample) (j i : Idx2) :
    evaluate v (entryPolynomial j i) = conj (hfun2 j v.1) * hfun2 i (smoothArg v.1 v.2) := by
  have hmul (P Q : P8) : evaluate v (P * Q) = evaluate v P * evaluate v Q := map_mul _ _ _
  have hC (c : ℂ) : evaluate v (C c) = c := eval_C c
  simp only [entryPolynomial, hmul, hC, evaluate_input_first, evaluate_input_second,
    evaluate_smooth_first, evaluate_smooth_second, ev_conjP, hfun2, H2,
    map_mul, Complex.conj_ofReal]
  ring

/-- Every actual smoothing entry is exactly a finite factorial-moment sum.
This discharges the analytic matrix-entry identity at every degree; numerical
enclosures and a faster evaluation algorithm are not asserted here. -/
theorem actualEntry_eq_finiteMoment (j i : Idx2) :
    actualEntry j i = finiteMoment (entryPolynomial j i) := by
  rw [actualEntry, hvec2, hvec2, smoothOp_toLp' (measurable_hfun2 i),
    inner_toLp2]
  rw [← integral_evaluate_eq_finiteMoment,
    integral_prod _ (integrable_evaluate (entryPolynomial j i))]
  apply integral_congr_ae
  filter_upwards [] with x
  simp_rw [evaluate_entryPolynomial]
  exact (integral_const_mul (conj (hfun2 j x))
    (fun Z => hfun2 i (smoothArg x Z))).symm

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_eq_finiteMoment' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualEntry_eq_finiteMoment
