import Grothe.UpperChaos.GradedHermite

/-!
# Pointwise representatives of graded finite Hermite expansions

The pointwise function is the finite sum of normalized Hermite polynomials.
It is continuous and square-integrable, represents `gradedHermite`, and obeys
the charge-one rotation identity at every point.

The `ChargeFn` structure lives in `ComparisonPieces`. A downstream adapter
can package measurable, `MemLp`, and rotation using the results here without
making this generic module depend on the comparison or phase certificates.

Agent-ID: codex-2ca4
-/

open MeasureTheory
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- The canonical pointwise polynomial representing a graded finite Hermite expansion. -/
def gradedHermiteFn (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (u : ℂ × ℂ) : ℂ :=
  ∑ i ∈ gradedSupport N, (gradedHermiteCoeff a i : ℂ) * hfun2 i u

/-- Normalized tensor Hermite functions are continuous polynomials. -/
theorem continuous_hfun2 (i : Idx2) : Continuous (hfun2 i) := by
  unfold hfun2 H2
  exact continuous_const.mul
    (((continuous_ev _).comp continuous_fst).mul ((continuous_ev _).comp continuous_snd))

/-- The canonical pointwise representative is continuous. -/
theorem continuous_gradedHermiteFn (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    Continuous (gradedHermiteFn N a) := by
  unfold gradedHermiteFn
  exact continuous_finsetSum _ (fun i _ => continuous_const.mul (continuous_hfun2 i))

/-- Pointwise measurability, as needed by the comparison's function interface. -/
theorem measurable_gradedHermiteFn (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    Measurable (gradedHermiteFn N a) :=
  (continuous_gradedHermiteFn N a).measurable

/-- Every finite graded polynomial belongs to the Gaussian `L²` space. -/
theorem memLp_gradedHermiteFn (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    MemLp (gradedHermiteFn N a) 2 mu2 := by
  unfold gradedHermiteFn
  exact memLp_finsetSum _ (fun i _ => (memLp_hfun2 i).const_mul _)

/-- The finite pointwise sum is a representative of the previously defined `Lp` vector. -/
theorem coeFn_gradedHermite (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    gradedHermite N a =ᵐ[mu2] gradedHermiteFn N a := by
  have hterm (i : Idx2) :
      ((gradedHermiteCoeff a i : ℂ) • hvec2 i : Lp ℂ 2 mu2) =ᵐ[mu2]
        fun u => (gradedHermiteCoeff a i : ℂ) * hfun2 i u := by
    refine (Lp.coeFn_smul _ _).trans ?_
    filter_upwards [(memLp_hfun2 i).coeFn_toLp] with u hu
    change (gradedHermiteCoeff a i : ℂ) * hvec2 i u =
      (gradedHermiteCoeff a i : ℂ) * hfun2 i u
    exact congrArg (fun z => (gradedHermiteCoeff a i : ℂ) * z) hu
  simp only [gradedHermite, hermiteFinite]
  refine (Lp.coeFn_finsetSum _ _).trans ?_
  have hs := eventuallyEq_sum (s := gradedSupport N) (fun i _ => hterm i)
  filter_upwards [hs] with u hu
  simpa only [Finset.sum_apply, gradedHermiteFn] using hu

/-- Passing the canonical pointwise function to `Lp` recovers the graded expansion exactly. -/
theorem toLp_gradedHermiteFn (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    (memLp_gradedHermiteFn N a).toLp (gradedHermiteFn N a) = gradedHermite N a := by
  apply Lp.ext
  exact (memLp_gradedHermiteFn N a).coeFn_toLp.trans (coeFn_gradedHermite N a).symm

/-- Addition of coefficients agrees with pointwise addition of the canonical representatives. -/
theorem gradedHermiteFn_add (N : ℕ) (a b : ℕ → ℕ → ℕ → ℚ) :
    gradedHermiteFn N (fun q c d => a q c d + b q c d) =
      fun u => gradedHermiteFn N a u + gradedHermiteFn N b u := by
  funext u
  simp only [gradedHermiteFn, gradedHermiteCoeff, Rat.cast_add, add_mul,
    Finset.sum_add_distrib]

/-- Rational scaling of coefficients agrees with pointwise complex scaling. -/
theorem gradedHermiteFn_const_mul (N : ℕ) (r : ℚ) (a : ℕ → ℕ → ℕ → ℚ) :
    gradedHermiteFn N (fun q c d => r * a q c d) =
      fun u => (r : ℂ) * gradedHermiteFn N a u := by
  funext u
  simp only [gradedHermiteFn, gradedHermiteCoeff, Rat.cast_mul, mul_assoc, Finset.mul_sum]

/-- A charge-one normalized tensor Hermite mode obeys the rotation law pointwise. -/
theorem hfun2_rot2_of_charge (i : Idx2)
    (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) (c : ℂ) (u : ℂ × ℂ)
    (hc : ‖c‖ = 1) : hfun2 i (rot2 c u) = c * hfun2 i u := by
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]
    simp
  have hphase : c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2) = c := by
    rw [hi, pow_succ]
    calc
      c ^ (i.1.2 + i.2.2) * c * conj c ^ (i.1.2 + i.2.2) =
          c * (conj c * c) ^ (i.1.2 + i.2.2) := by
        rw [mul_pow]
        ring
      _ = c := by simp only [hcc, one_pow, mul_one]
  simp only [hfun2, H2_rot2 hcc, hphase]
  ring

/-- The canonical finite representative has charge one at every point. -/
theorem gradedHermiteFn_rot2 (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (c : ℂ) (u : ℂ × ℂ) (hc : ‖c‖ = 1) :
    gradedHermiteFn N a (rot2 c u) = c * gradedHermiteFn N a u := by
  unfold gradedHermiteFn
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl (fun i hi => ?_)
  rw [hfun2_rot2_of_charge i (mem_gradedSupport_iff.mp hi).2 c u hc]
  ring

end

end Grothe.UpperChaos
