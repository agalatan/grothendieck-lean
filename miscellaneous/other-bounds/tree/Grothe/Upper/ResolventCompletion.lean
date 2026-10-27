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

open Polynomial Finset ResolventTail FiniteDifference

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

private def partialRemainder (a : ℕ → ℝ) (A T R : ℝ[X]) (K m n : ℕ) : ℝ[X] :=
  (-(R*A))^m*partialSum (iterDiff m a) A T K n +
    (1-R*(1-A))*(∑ j ∈ range m, (-(R*A))^j*partialSum (iterDiff j a) A T K n)

private theorem partial_remainder_bound (a : ℕ → ℝ) (A T R : ℝ[X]) (K m n : ℕ)
    (ha : CompletelyMonotone a) (B : ℕ → ℝ) {eta : ℝ}
    (hA : l1 A ≤ 1) (he : eta < 1) (hdef : l1 (1-R*(1-A)) ≤ eta)
    (hseed : ∀ j ≤ m, l1 ((-(R*A))^j*(R*T)) ≤ B j) :
    l1 (partialRemainder a A T R K m n) ≤
      (2/(1-eta))*(B m*iterDiff m a K + eta*∑ j ∈ range m, B j*iterDiff j a K) := by
  have heta : 0 ≤ eta := (l1_nonneg _).trans hdef
  have hterm (j : ℕ) (hj : j ≤ m) :
      l1 ((-(R*A))^j*partialSum (iterDiff j a) A T K n) ≤
        (2/(1-eta))*(B j*iterDiff j a K) := by
    have hb : 0 ≤ B j := (l1_nonneg _).trans (hseed j hj)
    have hm : 0 ≤ 2*B j/(1-eta) := div_nonneg (by positivity) (by linarith)
    have hs : l1 (R*((-(R*A))^j*T)) ≤ B j := by
      have hi : R*((-(R*A))^j*T) = (-(R*A))^j*(R*T) := by ring
      rw [hi]
      exact hseed j hj
    have hi : (-(R*A))^j*partialSum (iterDiff j a) A T K n =
        partialSum (iterDiff j a) A ((-(R*A))^j*T) K n := by
      simp only [partialSum, mul_sum, smul_eq_C_mul]
      apply sum_congr rfl
      intro i _
      ring
    rw [hi]
    calc
      _ ≤ iterDiff j a K*(2*B j/(1-eta)) :=
        decreasing_weights_bound (fun i => iterDiff j a (K+i))
          (fun i => ((-(R*A))^j*T)*A^i) (fun i => ha j _)
          (fun i => ha.iterDiff_succ_le j _) hm
          (geometric_prefix_bound A ((-(R*A))^j*T) R hA he hdef hs) n
      _ = _ := by ring
  have hsum : l1 (∑ j ∈ range m, (-(R*A))^j*partialSum (iterDiff j a) A T K n) ≤
      (2/(1-eta))*∑ j ∈ range m, B j*iterDiff j a K := by
    refine (l1_sum_le _ _).trans ((sum_le_sum fun j hj =>
      hterm j (Nat.le_of_lt (mem_range.mp hj))).trans_eq ?_)
    rw [mul_sum]
  have hdefect : l1 ((1-R*(1-A))*
      (∑ j ∈ range m, (-(R*A))^j*partialSum (iterDiff j a) A T K n)) ≤
      eta*((2/(1-eta))*∑ j ∈ range m, B j*iterDiff j a K) :=
    (l1_mul_le _ _).trans (mul_le_mul hdef hsum (l1_nonneg _) heta)
  exact (l1_add_le _ _).trans ((add_le_add (hterm m le_rfl) hdefect).trans_eq (by ring))

private lemma endpoint_coeff_zero (P S : ℝ[X]) {N n : ℕ} (hn : n < N) :
    (S*(X*P^2)^N).coeff n = 0 := by
  have hi : S*(X*P^2)^N = X^N*(S*(P^2)^N) := by rw [mul_pow]; ring
  rw [hi, coeff_X_pow_mul', ite_eq_right (Nat.not_le.mpr hn)]

/-- Certifying each combined resolvent seed retains its cancellation. The finite
endpoint has no effect on any fixed coefficient prefix, so complete monotonicity
suffices without an assumption that the coefficient sequence tends to zero. -/
theorem composition_completion_bound_of_seeds (a : ℕ → ℝ) (P R : ℝ[X]) (K m : ℕ)
    (ha : CompletelyMonotone a) (B : ℕ → ℝ)
    (hP : l1 P ≤ 1) {eta : ℝ} (he : eta < 1)
    (hdef : l1 (1-R*(1-X*P^2)) ≤ eta)
    (hseed : ∀ j ≤ m, l1 ((-(R*(X*P^2)))^j*(R*compTerm P K)) ≤ B j) :
    ∑' n, |compCoeff (fun k => if k < K then 0 else a k) P n -
      (completion a (X*P^2) (compTerm P K) R K m).coeff n| ≤
      (2/(1-eta))*(B m*iterDiff m a K + eta*∑ j ∈ range m, B j*iterDiff j a K) := by
  have hA : l1 (X*P^2) ≤ 1 := by
    exact (l1_mul_le _ _).trans ((mul_le_mul
      (by simp : l1 (X : ℝ[X]) ≤ 1)
      ((l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hP))
      (l1_nonneg _) zero_le_one).trans_eq (one_mul _))
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro J
  let S := partialSum a (X*P^2) (compTerm P K) K J
  let Q := completion a (X*P^2) (compTerm P K) R K m
  let U := partialRemainder a (X*P^2) (compTerm P K) R K m J
  have hcoeff (j : ℕ) (hj : j < J) :
      compCoeff (fun k => if k < K then 0 else a k) P j = S.coeff j := by
    have h := compCoeff_tail_eq_sum_coeff a P K J j hj
    simpa only [S, partialSum, compTerm_geometric P K] using h
  have hlocal (j : ℕ) (hj : j < J) : (S-Q).coeff j = U.coeff j := by
    have hboundary : (∑ i ∈ range m, iterDiff i a (K+J) •
        ((-(R*(X*P^2)))^i*(R*compTerm P K)*(X*P^2)^J)).coeff j = 0 := by
      rw [finsetSum_coeff]
      apply sum_eq_zero
      intro i _
      rw [coeff_smul, endpoint_coeff_zero P _ hj, smul_zero]
    have hi := congrArg (fun V : ℝ[X] => V.coeff j)
      (partial_completion_identity a (X*P^2) (compTerm P K) R K m J)
    simpa only [S, Q, U, partialRemainder, coeff_sub, hboundary, sub_zero] using hi
  calc
    _ = ∑ j ∈ range J, |U.coeff j| := by
      apply sum_congr rfl
      intro j hj
      rw [hcoeff j (mem_range.mp hj), ← coeff_sub, hlocal j (mem_range.mp hj)]
    _ ≤ l1 U := sum_abs_coeff_le_l1 _ _
    _ ≤ _ := partial_remainder_bound a (X*P^2) (compTerm P K) R K m J
      ha B hA he hdef hseed

/-- A uniform resolvent-ratio bound supplies the combined seeds geometrically.
This recovers the scalar completion budget for every completely monotone tail. -/
theorem composition_completion_bound (a : ℕ → ℝ) (P R : ℝ[X]) (K m : ℕ)
    (ha : CompletelyMonotone a) (hP : l1 P ≤ 1) {eta B C : ℝ} (he : eta < 1)
    (hdef : l1 (1-R*(1-X*P^2)) ≤ eta) (hseed : l1 (R*compTerm P K) ≤ B)
    (hRA : l1 (R*(X*P^2)) ≤ C) :
    ∑' n, |compCoeff (fun k => if k < K then 0 else a k) P n -
      (completion a (X*P^2) (compTerm P K) R K m).coeff n| ≤
      (2*B/(1-eta))*(C^m*iterDiff m a K + eta*∑ j ∈ range m, C^j*iterDiff j a K) := by
  have hc : 0 ≤ C := (l1_nonneg _).trans hRA
  have hs (j : ℕ) : l1 ((-(R*(X*P^2)))^j*(R*compTerm P K)) ≤ C^j*B := by
    have hp : l1 ((-(R*(X*P^2)))^j) ≤ C^j := by
      apply (l1_pow_le _ _).trans
      rw [l1_neg]
      exact pow_le_pow_left₀ (l1_nonneg _) hRA j
    exact (l1_mul_le _ _).trans (mul_le_mul hp hseed (l1_nonneg _) (pow_nonneg hc j))
  refine (composition_completion_bound_of_seeds a P R K m ha (fun j => C^j*B)
    hP he hdef (fun j _ => hs j)).trans_eq ?_
  have hi : (∑ j ∈ range m, C^j*B*iterDiff j a K) =
      B*∑ j ∈ range m, C^j*iterDiff j a K := by
    rw [mul_sum]
    apply sum_congr rfl
    intro j _
    ring
  rw [hi]
  ring

end
end Grothe.Upper.ResolventCompletion
