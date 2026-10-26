import Grothe.Upper.ResolventTail
import Grothe.Upper.FiniteDifference
import Mathlib.Tactic.LinearCombination

/-!
# Resolvent completion of a completely monotone tail

The finite head is completed by the canonical finite-difference expansion of
its resolvent boundary. A single identity controls every expansion order,
including the inverse defect and the finite endpoint. Coefficient locality
then removes that endpoint without constructing an infinite inverse.
-/

namespace Grothe.Upper.ResolventCompletion

open Polynomial Finset Filter ResolventTail FiniteDifference
open scoped Topology

noncomputable section

/-- The first `m` resolvent boundary terms at the tail index `K`. -/
def completion (a : ℕ → ℝ) (A T R : ℝ[X]) (K m : ℕ) : ℝ[X] :=
  ∑ j ∈ range m, iterDiff j a K • ((-(R*A))^j*(R*T))

private def partialSum (a : ℕ → ℝ) (A T : ℝ[X]) (K n : ℕ) : ℝ[X] :=
  ∑ i ∈ range n, a (K+i) • (T*A^i)

private lemma partial_step (a : ℕ → ℝ) (A T R : ℝ[X]) (K j n : ℕ) :
    partialSum (iterDiff j a) A T K n = iterDiff j a K • (R*T) +
      (-(R*A))*partialSum (iterDiff (j+1) a) A T K n +
      (1-R*(1-A))*partialSum (iterDiff j a) A T K n -
      iterDiff j a (K+n) • ((R*T)*A^n) := by
  have h : (1-A)*partialSum (iterDiff j a) A T K n = iterDiff j a K • T -
      A*partialSum (iterDiff (j+1) a) A T K n - iterDiff j a (K+n) • (T*A^n) := by
    simpa only [partialSum, iterDiff_succ_apply, Nat.add_assoc, Nat.add_zero] using
      weighted_geometric_difference (fun i => iterDiff j a (K+i)) A T n
  calc
    _ = (1-R*(1-A))*partialSum (iterDiff j a) A T K n +
        R*((1-A)*partialSum (iterDiff j a) A T K n) := by ring
    _ = _ := by rw [h]; simp only [smul_eq_C_mul]; ring

private lemma partial_completion_identity (a : ℕ → ℝ) (A T R : ℝ[X]) (K m n : ℕ) :
    partialSum a A T K n - completion a A T R K m =
      (-(R*A))^m*partialSum (iterDiff m a) A T K n +
      (1-R*(1-A))*(∑ j ∈ range m, (-(R*A))^j*partialSum (iterDiff j a) A T K n) -
      ∑ j ∈ range m, iterDiff j a (K+n) • ((-(R*A))^j*(R*T)*A^n) := by
  induction m with
  | zero => simp [completion]
  | succ m ih =>
    have hstep := partial_step a A T R K m n
    have hc : completion a A T R K (m+1) = completion a A T R K m +
        iterDiff m a K • ((-(R*A))^m*(R*T)) := by
      simp only [completion, sum_range_succ]
    rw [hc, sum_range_succ, sum_range_succ, pow_succ]
    simp only [smul_eq_C_mul] at ih hstep ⊢
    linear_combination ih + (-(R*A))^m*hstep

private theorem partial_completion_bound (a : ℕ → ℝ) (A T R : ℝ[X]) (K m n : ℕ)
    (ha : CompletelyMonotone a) {eta B C : ℝ}
    (hA : l1 A ≤ 1) (he : eta < 1) (hdef : l1 (1-R*(1-A)) ≤ eta)
    (hseed : l1 (R*T) ≤ B) (hRA : l1 (R*A) ≤ C) :
    l1 (partialSum a A T K n - completion a A T R K m) ≤
      (2*B/(1-eta))*(C^m*iterDiff m a K + eta*∑ j ∈ range m, C^j*iterDiff j a K) +
      B*∑ j ∈ range m, C^j*iterDiff j a (K+n) := by
  have hb : 0 ≤ B := (l1_nonneg _).trans hseed
  have hc : 0 ≤ C := (l1_nonneg _).trans hRA
  have heta : 0 ≤ eta := (l1_nonneg _).trans hdef
  let M := 2*B/(1-eta)
  have hm : 0 ≤ M := div_nonneg (by positivity) (by linarith)
  have hpow (j : ℕ) : l1 ((-(R*A))^j) ≤ C^j := by
    apply (l1_pow_le _ _).trans
    rw [l1_neg]
    exact pow_le_pow_left₀ (l1_nonneg _) hRA j
  have hs (j : ℕ) : l1 (partialSum (iterDiff j a) A T K n) ≤ iterDiff j a K*M := by
    exact decreasing_weights_bound (fun i => iterDiff j a (K+i)) (fun i => T*A^i)
      (fun i => ha j _) (fun i => ha.iterDiff_succ_le j _) hm
      (geometric_prefix_bound A T R hA he hdef hseed) n
  have hterm (j : ℕ) : l1 ((-(R*A))^j*partialSum (iterDiff j a) A T K n) ≤
      C^j*iterDiff j a K*M := by
    exact (l1_mul_le _ _).trans ((mul_le_mul (hpow j) (hs j) (l1_nonneg _)
      (pow_nonneg hc j)).trans_eq (by ring))
  have hmain := hterm m
  have hsum : l1 (∑ j ∈ range m, (-(R*A))^j*partialSum (iterDiff j a) A T K n) ≤
      M*∑ j ∈ range m, C^j*iterDiff j a K := by
    refine (l1_sum_le _ _).trans ((sum_le_sum fun j _ => hterm j).trans_eq ?_)
    rw [← sum_mul]
    ring
  have hdefect : l1 ((1-R*(1-A))*
      (∑ j ∈ range m, (-(R*A))^j*partialSum (iterDiff j a) A T K n)) ≤
      eta*(M*∑ j ∈ range m, C^j*iterDiff j a K) :=
    (l1_mul_le _ _).trans (mul_le_mul hdef hsum (l1_nonneg _) heta)
  have hAn : l1 (A^n) ≤ 1 := (l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg A) hA)
  have hboundary : l1 (∑ j ∈ range m, iterDiff j a (K+n) •
      ((-(R*A))^j*(R*T)*A^n)) ≤ B*∑ j ∈ range m, C^j*iterDiff j a (K+n) := by
    refine (l1_sum_le _ _).trans ?_
    calc
      _ ≤ ∑ j ∈ range m, iterDiff j a (K+n)*(C^j*B) := by
        apply sum_le_sum
        intro j _
        refine (l1_smul_le _ _).trans ?_
        rw [abs_of_nonneg (ha j _)]
        apply mul_le_mul_of_nonneg_left _ (ha j _)
        have hp : l1 ((-(R*A))^j*(R*T)) ≤ C^j*B :=
          (l1_mul_le _ _).trans (mul_le_mul (hpow j) hseed (l1_nonneg _) (pow_nonneg hc j))
        exact (l1_mul_le _ _).trans ((mul_le_mul hp hAn (l1_nonneg _)
          (mul_nonneg (pow_nonneg hc j) hb)).trans_eq (mul_one _))
      _ = _ := by rw [mul_sum]; apply sum_congr rfl; intro j _; ring
  rw [partial_completion_identity]
  exact (l1_sub_le _ _).trans ((add_le_add
    ((l1_add_le _ _).trans (add_le_add hmain hdefect)) hboundary).trans_eq (by dsimp [M]; ring))

/-- A canonical resolvent completion keeps head-tail cancellation inside the
finite polynomial. Complete monotonicity controls every remainder order. -/
theorem composition_completion_bound (a : ℕ → ℝ) (P R : ℝ[X]) (K m : ℕ)
    (ha : CompletelyMonotone a) (hzero : Tendsto a atTop (𝓝 0))
    (hP : l1 P ≤ 1) {eta B C : ℝ} (he : eta < 1)
    (hdef : l1 (1-R*(1-X*P^2)) ≤ eta) (hseed : l1 (R*compTerm P K) ≤ B)
    (hRA : l1 (R*(X*P^2)) ≤ C) :
    ∑' n, |compCoeff (fun k => if k < K then 0 else a k) P n -
      (completion a (X*P^2) (compTerm P K) R K m).coeff n| ≤
      (2*B/(1-eta))*(C^m*iterDiff m a K + eta*∑ j ∈ range m, C^j*iterDiff j a K) := by
  have hA : l1 (X*P^2) ≤ 1 := by
    exact (l1_mul_le _ _).trans ((mul_le_mul
      (by simp : l1 (X : ℝ[X]) ≤ 1)
      ((l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hP))
      (l1_nonneg _) zero_le_one).trans_eq (one_mul _))
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro J
  have ht (j : ℕ) : Tendsto (fun n : ℕ => iterDiff j a (K+(J+n))) atTop (𝓝 0) := by
    simpa [Function.comp_def, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
      (ha.tendsto_iterDiff_zero hzero j).comp (tendsto_add_atTop_nat (K+J))
  have hb : Tendsto (fun n : ℕ => ∑ j ∈ range m, C^j*iterDiff j a (K+(J+n))) atTop (𝓝 0) := by
    simpa using tendsto_finsetSum (range m) (fun j _ => (ht j).const_mul (C^j))
  have hlim : Tendsto (fun n : ℕ =>
      (2*B/(1-eta))*(C^m*iterDiff m a K + eta*∑ j ∈ range m, C^j*iterDiff j a K) +
        B*∑ j ∈ range m, C^j*iterDiff j a (K+(J+n))) atTop
      (𝓝 ((2*B/(1-eta))*(C^m*iterDiff m a K + eta*∑ j ∈ range m, C^j*iterDiff j a K))) := by
    simpa using tendsto_const_nhds.add (hb.const_mul B)
  apply ge_of_tendsto hlim
  apply Eventually.of_forall
  intro n
  let S := partialSum a (X*P^2) (compTerm P K) K (J+n)
  let Q := completion a (X*P^2) (compTerm P K) R K m
  have hcoeff (j : ℕ) (hj : j < J) :
      compCoeff (fun k => if k < K then 0 else a k) P j = S.coeff j := by
    have h := compCoeff_tail_eq_sum_coeff a P K (J+n) j (by omega)
    simpa only [S, partialSum, compTerm_geometric P K] using h
  calc
    _ = ∑ j ∈ range J, |(S-Q).coeff j| := by
      apply sum_congr rfl
      intro j hj
      rw [coeff_sub, hcoeff j (mem_range.mp hj)]
    _ ≤ l1 (S-Q) := sum_abs_coeff_le_l1 _ _
    _ ≤ _ := partial_completion_bound a (X*P^2) (compTerm P K) R K m (J+n)
      ha hA he hdef hseed hRA

end
end Grothe.Upper.ResolventCompletion
