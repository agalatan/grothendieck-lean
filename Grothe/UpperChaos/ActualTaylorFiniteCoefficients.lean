import Grothe.UpperChaos.ActualTaylorCoherent
import Grothe.UpperChaos.GaussianFockBessel
import Grothe.UpperChaos.HermiteC2Basis

/-!
# Actual multiplier matrix entries in finite coherent Hermite blocks

Agent-ID: codex-2ca4.

This is a finite-degree coefficient bridge. The physical kernel is built from
the production normalized Hermite functions before integrating the actual
multiplier `taylorPhasePower`; the base response F0 is excluded. Gaussian Fock
orthogonality then extracts exactly the retained normalized matrix entries.

No operator-entry identity, integrability or coefficient identity is assumed.
The finite source block is not yet identified with the corresponding block of
the full exponential coherent transform. Source-space extraction and physical
Wick evaluation reduce the remaining comparison to a finite algebraic identity.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.ActualTaylorFiniteCoefficients

open ActualTaylorCoherent GaussianFockBessel

noncomputable section

private def damping (j : ℕ) (z : ℂ) : ℂ :=
  Complex.exp (-((ActualTaylorCoherent.rate j - 1 : ℝ) : ℂ) * (Complex.normSq z : ℂ))

private theorem norm_damping_le_one (j : ℕ) (z : ℂ) : ‖damping j z‖ ≤ 1 := by
  have hε : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by
    norm_num [Grothe.Upper.phaseEpsQ]
  have hr : 0 ≤ ActualTaylorCoherent.rate j - 1 := by
    simpa only [ActualTaylorCoherent.rate, add_sub_cancel_left] using
      mul_nonneg (Nat.cast_nonneg j) hε
  rw [damping, Complex.norm_exp]
  apply Real.exp_le_one_iff.mpr
  simpa only [Complex.mul_re, Complex.neg_re, Complex.ofReal_re,
    Complex.ofReal_im, Complex.neg_im, neg_zero, zero_mul, sub_zero] using
      mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hr) (Complex.normSq_nonneg z)

/-- Every physical polynomial times the actual multiplier is absolutely
integrable. This uses the nonnegative damping, not a phase-bound certificate. -/
theorem integrable_polynomial_multiplier (Q : P4) (j : ℕ) :
    Integrable (fun zw => ev4 zw Q * taylorPhasePower j zw) mu2 := by
  have h₁ : Integrable (fun zw : ℂ × ℂ =>
      ev4 zw (Q * multiplierPolynomial j) * damping j zw.1) mu2 :=
    (integrable_ev4 (Q * multiplierPolynomial j)).mul_bdd
    (by unfold damping; fun_prop)
    (Filter.Eventually.of_forall fun zw : ℂ × ℂ => norm_damping_le_one j zw.1)
  have h : Integrable (fun zw : ℂ × ℂ =>
      ev4 zw (Q * multiplierPolynomial j) * damping j zw.1 * damping j zw.2) mu2 :=
    h₁.mul_bdd
      (by unfold damping; fun_prop)
      (Filter.Eventually.of_forall fun zw : ℂ × ℂ => norm_damping_le_one j zw.2)
  refine h.congr (Filter.Eventually.of_forall fun zw => ?_)
  rw [taylorPhasePower_eq_polynomial]
  simp only [ev4, map_mul, damping]
  ring

private def matrixPolynomial (m n : Idx2) : P4 :=
  C ((nrm2 m : ℂ) * (nrm2 n : ℂ)) *
    sX (conjP (H m.1.1 m.1.2)) * sY 0 (conjP (H m.2.1 m.2.2)) *
      sX (H n.1.1 n.1.2) * sY 0 (H n.2.1 n.2.2)

private theorem ev4_matrixPolynomial (m n : Idx2) (zw : ℂ × ℂ) :
    ev4 zw (matrixPolynomial m n) = conj (hfun2 m zw) * hfun2 n zw := by
  simp only [matrixPolynomial, ev4, map_mul, eval_C]
  change ((nrm2 m : ℂ) * (nrm2 n : ℂ)) *
    ev4 zw (sX (conjP (H m.1.1 m.1.2))) *
      ev4 zw (sY 0 (conjP (H m.2.1 m.2.2))) *
        ev4 zw (sX (H n.1.1 n.1.2)) * ev4 zw (sY 0 (H n.2.1 n.2.2)) = _
  rw [ev4_sX, ev4_sY, ev4_sX, ev4_sY, ev_conjP, ev_conjP]
  simp only [sig, norm_zero, zero_pow (by decide : (2 : ℕ) ≠ 0),
    sub_zero, Real.sqrt_one, Complex.ofReal_one, zero_mul, one_mul,
    zero_add, hfun2, H2, map_mul, Complex.conj_ofReal]
  ring

/-- The actual normalized Hermite matrix entry of multiplication by (i*phi)^j. -/
def matrixEntry (j : ℕ) (m n : Idx2) : ℂ :=
  ∫ zw, conj (hfun2 m zw) * taylorPhasePower j zw * hfun2 n zw ∂mu2

/-- The zero Taylor power gives the identity matrix, fixing its normalization. -/
theorem matrixEntry_zero (m n : Idx2) :
    matrixEntry 0 m n = if m = n then (1 : ℂ) else 0 := by
  simpa only [matrixEntry, taylorPhasePower, pow_zero, mul_one, hvec2,
    inner_toLp2] using inner_hvec2 m n

/-- Actual matrix entries exist absolutely without an assumed PhiBound. -/
theorem integrable_matrixEntry (j : ℕ) (m n : Idx2) :
    Integrable (fun zw => conj (hfun2 m zw) * taylorPhasePower j zw * hfun2 n zw)
      mu2 := by
  refine (integrable_polynomial_multiplier (matrixPolynomial m n) j).congr
    (Filter.Eventually.of_forall fun zw => ?_)
  rw [ev4_matrixPolynomial]
  ring

/-- Both Hermite normalization factors are retained in every matrix entry. -/
theorem matrixEntry_eq_unnormalized (j : ℕ) (m n : Idx2) :
    matrixEntry j m n = ((nrm2 m : ℂ) * (nrm2 n : ℂ)) *
      ∫ zw, conj (H2 m zw) * taylorPhasePower j zw * H2 n zw ∂mu2 := by
  rw [matrixEntry, ← integral_const_mul]
  apply integral_congr_ae
  refine Filter.Eventually.of_forall fun zw => ?_
  simp only [hfun2, map_mul, Complex.conj_ofReal]
  ring

/-- A finite physical Hermite generating block. Source grouping is
((outgoing-z, incoming-z), (outgoing-w, incoming-w)). Each normalized Hermite
factor and normalized source monomial contributes one inverse square root of
the same factorial, so their product has the ordinary generating factorial. -/
def finiteHermiteKernel (S : Finset (Idx2 × Idx2))
    (zw : ℂ × ℂ) (Z : Sources8) : ℂ :=
  ∑ mn ∈ S, (conj (hfun2 mn.1 zw) * hfun2 mn.2 zw) *
    monomial8 (matrixIndexEquiv mn) Z

/-- Integrate the actual multiplier against a finite physical generating block. -/
def finiteTransform (j : ℕ) (S : Finset (Idx2 × Idx2)) (Z : Sources8) : ℂ :=
  ∫ zw, taylorPhasePower j zw * finiteHermiteKernel S zw Z ∂mu2

private theorem finiteIntegrand_eq_sum (j : ℕ) (S : Finset (Idx2 × Idx2))
    (Z : Sources8) (zw : ℂ × ℂ) :
    taylorPhasePower j zw * finiteHermiteKernel S zw Z =
      ∑ mn ∈ S, (conj (hfun2 mn.1 zw) * taylorPhasePower j zw * hfun2 mn.2 zw) *
        monomial8 (matrixIndexEquiv mn) Z := by
  classical
  simp only [finiteHermiteKernel, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro mn hmn
  ring

theorem integrable_finiteTransform (j : ℕ) (S : Finset (Idx2 × Idx2)) (Z : Sources8) :
    Integrable (fun zw => taylorPhasePower j zw * finiteHermiteKernel S zw Z) mu2 := by
  classical
  simp_rw [finiteIntegrand_eq_sum]
  exact integrable_finsetSum S fun mn _ =>
    (integrable_matrixEntry j mn.1 mn.2).mul_const (monomial8 (matrixIndexEquiv mn) Z)

/-- Finite integration yields the actual normalized matrix entries as coefficients. -/
theorem finiteTransform_eq_sum (j : ℕ) (S : Finset (Idx2 × Idx2)) (Z : Sources8) :
    finiteTransform j S Z =
      ∑ mn ∈ S, matrixEntry j mn.1 mn.2 * monomial8 (matrixIndexEquiv mn) Z := by
  classical
  unfold finiteTransform
  simp_rw [finiteIntegrand_eq_sum]
  rw [integral_finsetSum S fun mn _ =>
    (integrable_matrixEntry j mn.1 mn.2).mul_const (monomial8 (matrixIndexEquiv mn) Z)]
  apply Finset.sum_congr rfl
  intro mn hmn
  simp only [integral_mul_const, matrixEntry]

/-- Every finite generating block is an actual square-integrable Fock function. -/
theorem memLp_finiteTransform (j : ℕ) (S : Finset (Idx2 × Idx2)) :
    MemLp (finiteTransform j S) 2 sourceMeasure8 := by
  classical
  have h := memLp_finsetSum S fun mn _ =>
    (memLp_monomial8 (matrixIndexEquiv mn)).const_mul (matrixEntry j mn.1 mn.2)
  exact MemLp.ae_eq
    (Filter.Eventually.of_forall fun Z => (finiteTransform_eq_sum j S Z).symm) h

/-- Gaussian source coefficients recover exactly the retained actual matrix entries.
No coefficient or operator-entry identity is an input to this theorem. -/
theorem coefficient8_finiteTransform (j : ℕ) (S : Finset (Idx2 × Idx2))
    (m n : Idx2) :
    coefficient8 (finiteTransform j S) (matrixIndexEquiv (m, n)) =
      if (m, n) ∈ S then matrixEntry j m n else 0 := by
  classical
  unfold coefficient8
  simp_rw [finiteTransform_eq_sum, Finset.mul_sum]
  have hi (mn : Idx2 × Idx2) : Integrable (fun Z =>
      conj (monomial8 (matrixIndexEquiv (m, n)) Z) *
        (matrixEntry j mn.1 mn.2 * monomial8 (matrixIndexEquiv mn) Z)) sourceMeasure8 := by
    have h := (((memLp_monomial8 (matrixIndexEquiv (m, n))).star).integrable_mul
      (memLp_monomial8 (matrixIndexEquiv mn))).const_mul (matrixEntry j mn.1 mn.2)
    refine h.congr (Filter.Eventually.of_forall fun Z => ?_)
    change matrixEntry j mn.1 mn.2 *
      (conj (monomial8 (matrixIndexEquiv (m, n)) Z) * monomial8 (matrixIndexEquiv mn) Z) = _
    ring
  rw [integral_finsetSum S fun mn _ => hi mn]
  have hterm (mn : Idx2 × Idx2) :
      (∫ Z, conj (monomial8 (matrixIndexEquiv (m, n)) Z) *
        (matrixEntry j mn.1 mn.2 * monomial8 (matrixIndexEquiv mn) Z) ∂sourceMeasure8) =
      if mn = (m, n) then matrixEntry j mn.1 mn.2 else 0 := by
    have hp (Z : Sources8) :
        conj (monomial8 (matrixIndexEquiv (m, n)) Z) *
          (matrixEntry j mn.1 mn.2 * monomial8 (matrixIndexEquiv mn) Z) =
        matrixEntry j mn.1 mn.2 *
          (conj (monomial8 (matrixIndexEquiv (m, n)) Z) *
            monomial8 (matrixIndexEquiv mn) Z) := by ring
    simp_rw [hp]
    rw [integral_const_mul, integral_monomial8]
    by_cases hm : mn = (m, n)
    · subst mn
      simp
    · have he : matrixIndexEquiv (m, n) ≠ matrixIndexEquiv mn := by
        intro he
        exact hm (matrixIndexEquiv.injective he).symm
      simp [hm, he]
  simp_rw [hterm]
  simp

end
end Grothe.UpperChaos.ActualTaylorFiniteCoefficients
