import Grothe.UpperChaos.RationalUnitTaylorSource
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.Data.ZMod.Basic

/-!
# Degree parity of the actual rational Taylor sources

Weighted homogeneity in `ZMod 2` records the parity of every monomial, including
the lower-degree terms of Hermite polynomials. Every unit Taylor source is odd;
each of its two affine phase-numerator terms is even. This is the invariant
needed to eliminate square roots from the subsequent Wick polynomial.

Agent-ID: codex-2ca4
-/

open MvPolynomial

namespace Grothe.UpperChaos.RationalSourceParity
open RationalComplexHermite RationalPhaseInvariant RationalPhaseImaginary
open RationalUnitTaylorSource
noncomputable section

abbrev TotalParity {σ : Type*} (P : MvPolynomial σ ℚ) (d : ZMod 2) : Prop :=
  IsWeightedHomogeneous (fun _ : σ => (1 : ZMod 2)) P d

private theorem totalParity_pderiv {σ : Type*} {P : MvPolynomial σ ℚ}
    {d : ZMod 2} (hP : TotalParity P d) (i : σ) :
    TotalParity (pderiv i P) (d + 1) := by
  classical
  intro s hs
  rw [coeff_pderiv] at hs
  have h := hP (left_ne_zero_of_mul hs)
  rw [map_add, Finsupp.weight_single, one_nsmul] at h
  have htwo : (1 : ZMod 2) + 1 = 0 := by decide +kernel
  calc
    Finsupp.weight (fun _ : σ => (1 : ZMod 2)) s =
        (Finsupp.weight (fun _ : σ => (1 : ZMod 2)) s + 1) + 1 := by
      rw [add_assoc, htwo, add_zero]
    _ = d + 1 := congrArg (fun x : ZMod 2 => x + 1) h

private theorem totalParity_ratA0 {P : RatPoly} {d : ZMod 2}
    (hP : TotalParity P d) : TotalParity (ratA0 P) (d + 1) := by
  have hm := (isWeightedHomogeneous_X ℚ (fun _ : Fin 2 => (1 : ZMod 2)) 0).mul hP
  rw [add_comm] at hm
  exact hm.sub (totalParity_pderiv hP 1)

private theorem totalParity_ratA1 {P : RatPoly} {d : ZMod 2}
    (hP : TotalParity P d) : TotalParity (ratA1 P) (d + 1) := by
  have hm := (isWeightedHomogeneous_X ℚ (fun _ : Fin 2 => (1 : ZMod 2)) 1).mul hP
  rw [add_comm] at hm
  exact hm.sub (totalParity_pderiv hP 0)

/-- All terms of a rational Hermite polynomial have its index-sum parity. -/
theorem totalParity_ratH (p q : ℕ) : TotalParity (ratH p q) ((p + q : ℕ) : ZMod 2) := by
  induction p with
  | zero =>
      induction q with
      | zero =>
          change TotalParity (1 : RatPoly) 0
          exact isWeightedHomogeneous_one ℚ _
      | succ q ih =>
          have hd : ((0 + (q + 1) : ℕ) : ZMod 2) = ((0 + q : ℕ) : ZMod 2) + 1 := by
            push_cast
            ring
          rw [ratH_zero_succ, hd]
          exact totalParity_ratA1 ih
  | succ p ih =>
      have hd : (((p + 1) + q : ℕ) : ZMod 2) = ((p + q : ℕ) : ZMod 2) + 1 := by
        push_cast
        ring
      rw [ratH_succ_left, hd]
      exact totalParity_ratA0 ih

private theorem parityWeight_mapDomain {σ τ : Type*} (f : σ → τ) (s : σ →₀ ℕ) :
    Finsupp.weight (fun _ : τ => (1 : ZMod 2)) (s.mapDomain f) =
      Finsupp.weight (fun _ : σ => (1 : ZMod 2)) s := by
  classical
  simp only [Finsupp.weight_apply]
  exact Finsupp.sum_mapDomain_index (fun _ => zero_nsmul (1 : ZMod 2))
    (fun _ _ _ => add_nsmul _ _ _)

/-- Renaming variables preserves total-degree parity, even for noninjective maps. -/
theorem totalParity_rename {σ τ : Type*} (f : σ → τ) {P : MvPolynomial σ ℚ}
    {d : ZMod 2} (hP : TotalParity P d) : TotalParity (rename f P) d := by
  classical
  rw [P.as_sum, map_sum]
  apply IsWeightedHomogeneous.sum
  intro s hs
  rw [rename_monomial]
  apply isWeightedHomogeneous_monomial
  exact (parityWeight_mapDomain f s).trans (hP (mem_support_iff.mp hs))

private theorem totalParity_pair (i k : Fin 4) :
    TotalParity (X i * X k : RatPoly4) 0 := by
  have h := (isWeightedHomogeneous_X ℚ (fun _ : Fin 4 => (1 : ZMod 2)) i).mul
    (isWeightedHomogeneous_X (R := ℚ) (fun _ : Fin 4 => (1 : ZMod 2)) k)
  have htwo : (1 : ZMod 2) + 1 = 0 := by decide +kernel
  simpa only [htwo] using h

private theorem totalParity_phaseTermQ (t : (ℕ × ℕ × ℕ) × ℚ) :
    TotalParity (phaseTermQ t) 0 := by
  have hnz : TotalParity normZQ 0 := totalParity_pair 0 1
  have hnw : TotalParity normWQ 0 := totalParity_pair 2 3
  have hr : TotalParity realPartQ 0 :=
    ((totalParity_pair 1 2).add (totalParity_pair 0 3)).C_mul (1 / 2 : ℚ)
  simpa only [phaseTermQ, nsmul_zero, add_zero] using
    ((((hnz.pow t.1.1).C_mul t.2).mul (hnw.pow t.1.2.1)).mul (hr.pow t.1.2.2))

private theorem totalParity_phaseInvariantQ (ts : List ((ℕ × ℕ × ℕ) × ℚ)) :
    TotalParity (phaseInvariantQ ts) 0 := by
  induction ts with
  | nil =>
      change TotalParity (0 : RatPoly4) 0
      exact isWeightedHomogeneous_zero ℚ _ _
  | cons t ts ih =>
      change TotalParity (phaseTermQ t + phaseInvariantQ ts) 0
      exact (totalParity_phaseTermQ t).add ih

/-- Every monomial of the actual unit source has odd total degree. -/
theorem totalParity_unitSourceQ (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) : TotalParity (unitSourceQ ts i j) 1 := by
  have hfirst := totalParity_rename firstVariables
    (totalParity_ratH (i.1.val - i.2.2.val) (i.1.val + 1 - i.2.1.val))
  have hsecond := totalParity_rename secondVariables
    (totalParity_ratH i.2.2.val i.2.1.val)
  have him : TotalParity imaginaryFactorQ 0 :=
    ((totalParity_pair 1 2).sub (totalParity_pair 0 3)).C_mul (1 / 2 : ℚ)
  have hphase : TotalParity ((imaginaryFactorQ * phaseInvariantQ ts) ^ j) 0 := by
    simpa only [add_zero, nsmul_zero] using (him.mul (totalParity_phaseInvariantQ ts)).pow j
  have htotal : (i.1.val - i.2.2.val + (i.1.val + 1 - i.2.1.val)) +
      (i.2.2.val + i.2.1.val) = 2 * i.1.val + 1 := by
    have hc := i.2.1.isLt
    have hd := i.2.2.isLt
    omega
  have hdegree : (((i.1.val - i.2.2.val + (i.1.val + 1 - i.2.1.val) : ℕ) : ZMod 2) +
      ((i.2.2.val + i.2.1.val : ℕ) : ZMod 2)) = 1 := by
    rw [← Nat.cast_add, htotal]
    push_cast
    have htwo : (2 : ZMod 2) = 0 := by decide +kernel
    rw [htwo, zero_mul, zero_add]
  simpa only [unitSourceQ, firstHermiteQ, secondHermiteQ, hdegree, add_zero] using
    (hfirst.mul hsecond).mul hphase

/-- Each term of the affine phase numerator makes the actual source even. -/
theorem totalParity_unitSourceQ_mul_X (ts : List ((ℕ × ℕ × ℕ) × ℚ)) {N : ℕ}
    (i : GradedIdx N) (j : ℕ) (k : Fin 4) : TotalParity (unitSourceQ ts i j * X k) 0 := by
  have h := (totalParity_unitSourceQ ts i j).mul
    (isWeightedHomogeneous_X (R := ℚ) (fun _ : Fin 4 => (1 : ZMod 2)) k)
  have htwo : (1 : ZMod 2) + 1 = 0 := by decide +kernel
  simpa only [htwo] using h

end
end Grothe.UpperChaos.RationalSourceParity
