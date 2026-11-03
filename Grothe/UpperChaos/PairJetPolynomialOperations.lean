import Grothe.UpperChaos.BipartiteCoefficientJets
import Mathlib.Analysis.Calculus.Deriv.CompMul
import Mathlib.Analysis.Calculus.ContDiff.Comp

/-!
# Finite-sum and diagonal-scaling operations for gate-ordered source jets

Agent-ID: codex-2ca4.

Diagonal scaling is unconditional: Mathlib's derivative fallback is compatible
with scalar precomposition, including zero scales. Finite-sum linearity uses
ordinary joint analytic regularity, proved here for all monomial times kernel
functions. No coefficient equality or integral interchange is a premise.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.PairJetPolynomialOperations

open BipartitePolynomialL2 BipartiteCoefficientJets
open ActualSourceCoefficientExtraction GaussianFockBessel

noncomputable section

/-- Scalar rescaling of iterated derivatives, including nonsmooth functions
and zero scales. This follows the unconditional first-derivative API. -/
theorem iteratedDeriv_comp_mul_left (n : ℕ) (a : ℂ) (F : ℂ → ℂ) :
    iteratedDeriv n (fun z => F (a * z)) =
      fun z => a ^ n * iteratedDeriv n F (a * z) := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [iteratedDeriv_succ, ih]
      funext z
      rw [deriv_const_mul_field, deriv_comp_mul_left, iteratedDeriv_succ]
      simp only [smul_eq_mul, pow_succ]
      ring

theorem iteratedDeriv_comp_mul_left_zero (n : ℕ) (a : ℂ) (F : ℂ → ℂ) :
    iteratedDeriv n (fun z => F (a * z)) 0 = a ^ n * iteratedDeriv n F 0 := by
  simpa only [mul_zero] using congrFun (iteratedDeriv_comp_mul_left n a F) 0

/-- Four independent diagonal scales in gate order ((y,u),(x,v)). -/
def scaleSources (a : PairSources) (zw : PairSources) : PairSources :=
  ((a.1.1 * zw.1.1, a.1.2 * zw.1.2),
    (a.2.1 * zw.2.1, a.2.2 * zw.2.2))

def scaleWeight (n : PairPowers) (a : PairSources) : ℂ :=
  (a.1.1 ^ n.1.1 * a.1.2 ^ n.1.2) *
    (a.2.1 ^ n.2.1 * a.2.2 ^ n.2.2)

/-- Two-variable diagonal scaling, used independently on each source pair. -/
theorem outerJet_scale (n : ℕ × ℕ) (a b : ℂ) (F : ℂ × ℂ → ℂ) :
    outerJet n (fun w => F (a * w.1, b * w.2)) =
      (a ^ n.1 * b ^ n.2) * outerJet n F := by
  have hi (x : ℂ) :
      iteratedDeriv n.2 (fun v => F (a * x, b * v)) 0 =
        b ^ n.2 * iteratedDeriv n.2 (fun v => F (a * x, v)) 0 :=
    iteratedDeriv_comp_mul_left_zero n.2 b (fun v => F (a * x, v))
  unfold outerJet
  simp_rw [hi]
  rw [iteratedDeriv_const_mul_field,
    iteratedDeriv_comp_mul_left_zero n.1 a
      (fun x => iteratedDeriv n.2 (fun v => F (x, v)) 0)]
  ring

/-- The actual four-source scaling identity, with no extra assumptions. -/
theorem pairJet_scale (n : PairPowers) (a : PairSources) (F : PairSources → ℂ) :
    pairJet n (fun zw => F (scaleSources a zw)) = scaleWeight n a * pairJet n F := by
  have hi : innerJet n.1 (fun zw => F (scaleSources a zw)) =
      fun w => (a.1.1 ^ n.1.1 * a.1.2 ^ n.1.2) *
        innerJet n.1 F (a.2.1 * w.1, a.2.2 * w.2) := by
    funext w
    exact outerJet_scale n.1 a.1.1 a.1.2
      (fun z => F (z, (a.2.1 * w.1, a.2.2 * w.2)))
  unfold pairJet
  rw [hi, outerJet_const_mul, outerJet_scale]
  unfold scaleWeight
  ring

theorem pairJet_const_mul (n : PairPowers) (c : ℂ) (F : PairSources → ℂ) :
    pairJet n (fun zw => c * F zw) = c * pairJet n F := by
  simp only [pairJet, outerJet, innerJet, iteratedDeriv_const_mul_field]

section Parameters

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]

/-- Ordinary joint regularity is preserved by every finite scalar partial
derivative. The proof uses the parameterized Frechet derivative API. -/
theorem contDiff_parameter_jet {F : E × ℂ → ℂ}
    (hF : ContDiff ℂ ⊤ F) (k : ℕ) :
    ContDiff ℂ ⊤ (fun p : E × ℂ =>
      iteratedDeriv k (fun z => F (p.1, z)) p.2) := by
  induction k with
  | zero => simpa only [iteratedDeriv_zero] using hF
  | succ k ih =>
      have hc : ContDiff ℂ ⊤ (fun p : (E × ℂ) × ℂ =>
          iteratedDeriv k (fun z => F (p.1.1, z)) p.2) :=
        ih.comp (show ContDiff ℂ ⊤ (fun p : (E × ℂ) × ℂ =>
          (p.1.1, p.2)) by fun_prop)
      have hd : ContDiff ℂ ⊤ (fun p : E × ℂ =>
          fderiv ℂ (fun z => iteratedDeriv k (fun w => F (p.1, w)) z) p.2 1) :=
        hc.fderiv_apply contDiff_snd contDiff_const le_top
      simpa only [iteratedDeriv_succ, deriv] using hd

theorem contDiff_parameter_jet_zero {F : E × ℂ → ℂ}
    (hF : ContDiff ℂ ⊤ F) (k : ℕ) :
    ContDiff ℂ ⊤ (fun p : E => iteratedDeriv k (fun z => F (p, z)) 0) :=
  (contDiff_parameter_jet hF k).comp
    (show ContDiff ℂ ⊤ (fun p : E => (p, (0 : ℂ))) by fun_prop)

end Parameters

/-- Regularity of the first completed partial derivative, leaving y,x,v free. -/
theorem contDiff_uJet {F : PairSources → ℂ} (hF : ContDiff ℂ ⊤ F) (k : ℕ) :
    ContDiff ℂ ⊤ (fun yw : ℂ × (ℂ × ℂ) =>
      iteratedDeriv k (fun u => F ((yw.1, u), yw.2)) 0) := by
  exact contDiff_parameter_jet_zero
    (hF.comp (show ContDiff ℂ ⊤ (fun p : (ℂ × (ℂ × ℂ)) × ℂ =>
      ((p.1.1, p.2), p.1.2)) by fun_prop)) k

theorem contDiff_innerJet {F : PairSources → ℂ}
    (hF : ContDiff ℂ ⊤ F) (n : ℕ × ℕ) :
    ContDiff ℂ ⊤ (innerJet n F) := by
  exact contDiff_parameter_jet_zero
    ((contDiff_uJet hF n.2).comp
      (show ContDiff ℂ ⊤ (fun p : (ℂ × ℂ) × ℂ => (p.2, p.1)) by fun_prop)) n.1

theorem outerJet_finset_sum {ι : Type*} (t : Finset ι)
    (F : ι → ℂ × ℂ → ℂ) (hF : ∀ i ∈ t, ContDiff ℂ ⊤ (F i)) (n : ℕ × ℕ) :
    outerJet n (fun w => ∑ i ∈ t, F i w) = ∑ i ∈ t, outerJet n (F i) := by
  classical
  have hi (x : ℂ) :
      iteratedDeriv n.2 (fun v => ∑ i ∈ t, F i (x, v)) 0 =
        ∑ i ∈ t, iteratedDeriv n.2 (fun v => F i (x, v)) 0 := by
    exact iteratedDeriv_fun_sum (fun i hit =>
      (((hF i hit).comp (by fun_prop)).of_le le_top).contDiffAt)
  unfold outerJet
  simp_rw [hi]
  exact iteratedDeriv_fun_sum (fun i hit =>
    ((contDiff_parameter_jet_zero (hF i hit) n.2).of_le le_top).contDiffAt)

theorem innerJet_finset_sum {ι : Type*} (t : Finset ι)
    (F : ι → PairSources → ℂ) (hF : ∀ i ∈ t, ContDiff ℂ ⊤ (F i))
    (n : ℕ × ℕ) (w : ℂ × ℂ) :
    innerJet n (fun zw => ∑ i ∈ t, F i zw) w =
      ∑ i ∈ t, innerJet n (F i) w := by
  classical
  have hi (y : ℂ) :
      iteratedDeriv n.2 (fun u => ∑ i ∈ t, F i ((y, u), w)) 0 =
        ∑ i ∈ t, iteratedDeriv n.2 (fun u => F i ((y, u), w)) 0 := by
    exact iteratedDeriv_fun_sum (fun i hit =>
      (((hF i hit).comp (by fun_prop)).of_le le_top).contDiffAt)
  unfold innerJet
  simp_rw [hi]
  exact iteratedDeriv_fun_sum (fun i hit =>
    (((contDiff_uJet (hF i hit) n.2).comp
      (show ContDiff ℂ ⊤ (fun y : ℂ => (y, w)) by fun_prop)).of_le le_top).contDiffAt)

/-- Finite-sum linearity with genuine joint regularity, not a jet-equality premise. -/
theorem pairJet_finset_sum {ι : Type*} (t : Finset ι)
    (F : ι → PairSources → ℂ) (hF : ∀ i ∈ t, ContDiff ℂ ⊤ (F i)) (n : PairPowers) :
    pairJet n (fun zw => ∑ i ∈ t, F i zw) = ∑ i ∈ t, pairJet n (F i) := by
  have hi : innerJet n.1 (fun zw => ∑ i ∈ t, F i zw) =
      fun w => ∑ i ∈ t, innerJet n.1 (F i) w :=
    funext (innerJet_finset_sum t F hF n.1)
  unfold pairJet
  rw [hi]
  exact outerJet_finset_sum t _ (fun i hit => contDiff_innerJet (hF i hit) n.1) n.2

theorem pairJet_weighted_finset_sum {ι : Type*} (t : Finset ι) (d : ι → ℂ)
    (F : ι → PairSources → ℂ) (hF : ∀ i ∈ t, ContDiff ℂ ⊤ (F i)) (n : PairPowers) :
    pairJet n (fun zw => ∑ i ∈ t, d i * F i zw) =
      ∑ i ∈ t, d i * pairJet n (F i) := by
  rw [pairJet_finset_sum t _ (fun i hit => contDiff_const.mul (hF i hit))]
  simp only [pairJet_const_mul]

/-- All the regularity assumptions above are proved for the actual elementary
kernel summands. This needs no Schur positivity. -/
theorem contDiff_monomial_kernel (e : PairPowers) (c : ℂ) (p q r s : ℝ) :
    ContDiff ℂ ⊤ (fun zw =>
      BipartitePolynomialL2.monomial e zw * kernel c p q r s zw) := by
  unfold BipartitePolynomialL2.monomial kernel coupling image
  fun_prop

theorem pairJet_finite_polynomial_kernel {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → PairPowers) (c : ℂ) (p q r s : ℝ) (n : PairPowers) :
    pairJet n (fun zw =>
      (∑ i ∈ t, d i * BipartitePolynomialL2.monomial (e i) zw) * kernel c p q r s zw) =
      ∑ i ∈ t, d i * pairJet n (fun zw =>
        BipartitePolynomialL2.monomial (e i) zw * kernel c p q r s zw) := by
  simp_rw [Finset.sum_mul, mul_assoc]
  exact pairJet_weighted_finset_sum t d _
    (fun i hit => contDiff_monomial_kernel (e i) c p q r s) n

/-- Finite polynomial extension of normalized Gaussian source extraction.
The original Schur assumptions are unchanged, and every integral is justified
by the existing L2 coefficient pairing. -/
theorem integral_source_pair_polynomial_eq_jet {ι : Type*} (t : Finset ι)
    (d : ι → ℂ) (e : ι → PairPowers) (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) - (p * q + r * s) ^ 2)
    (n : PairPowers) :
    (∫ zw, conj (monomial4 n zw) *
      ((∑ i ∈ t, d i * BipartitePolynomialL2.monomial (e i) zw) *
        kernel c p q r s zw) ∂pairMeasure) =
      (normalization4 n : ℂ) * pairJet n (fun zw =>
        (∑ i ∈ t, d i * BipartitePolynomialL2.monomial (e i) zw) * kernel c p q r s zw) := by
  classical
  have hi (i : ι) : Integrable (fun zw => conj (monomial4 n zw) *
      (BipartitePolynomialL2.monomial (e i) zw * kernel c p q r s zw)) pairMeasure :=
    ((memLp_monomial4 n).star.integrable_mul
      (memLp_monomial_kernel (e i) c hA hdet)).congr
        (Filter.Eventually.of_forall fun zw => rfl)
  have hp (zw : PairSources) :
      conj (monomial4 n zw) *
        ((∑ i ∈ t, d i * BipartitePolynomialL2.monomial (e i) zw) * kernel c p q r s zw) =
      ∑ i ∈ t, d i * (conj (monomial4 n zw) *
        (BipartitePolynomialL2.monomial (e i) zw * kernel c p q r s zw)) := by
    simp only [Finset.sum_mul, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hit
    ring
  simp_rw [hp]
  rw [integral_finsetSum t fun i hit => (hi i).const_mul (d i),
    pairJet_finite_polynomial_kernel, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hit
  rw [integral_const_mul, integral_source_pair_eq_jet c hA hdet]
  ring

end
end Grothe.UpperChaos.PairJetPolynomialOperations
