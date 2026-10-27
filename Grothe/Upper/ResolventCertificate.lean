import Grothe.Upper.Haagerup
import Grothe.Upper.ResolventTail
import Grothe.Haagerup.CanonicalArithmetic

/-!
# Soundness of finite resolvent completion certificates

The original finite head and its signed resolvent correction are combined
before taking the coefficient norm. The interval calculation controls a
coefficient prefix; a degree bound identifies it with the complete norm.
-/

namespace Grothe.Upper.ResolventCertificate

open Polynomial Finset GrotheKernel
open Grothe.Upper.ResolventTail

noncomputable section

lemma summable_abs_coeff (Q : ℝ[X]) : Summable fun n => |Q.coeff n| :=
  summable_of_ne_finset_zero (s := Q.support) fun n hn => by
    simp [Polynomial.notMem_support_iff.mp hn]

lemma tsum_abs_coeff_eq_l1 (Q : ℝ[X]) : (∑' n, |Q.coeff n|) = l1 Q := by
  rw [tsum_eq_sum (s := Q.support) (fun n hn => by
    simp [Polynomial.notMem_support_iff.mp hn])]
  rfl

lemma polynomial_residual_eq_l1 (Q : ℝ[X]) (s : ℝ) :
    |Q.coeff 0 - s| + ∑' n, |Q.coeff (n+1)| = l1 (Q-C s) := by
  rw [← tsum_abs_coeff_eq_l1, (summable_abs_coeff (Q-C s)).tsum_eq_zero_add]
  simp only [coeff_sub, coeff_C_zero, coeff_C_succ, sub_zero]

/-- A finite composition head followed by its finite resolvent completion. -/
def completedPolynomial (P R : ℝ[X]) (k : ℕ) (rs ds : List ℚ) : ℝ[X] :=
  P * hornerP (X * P ^ 2) rs +
    (R * compTerm P k) * hornerP (-(R * (X * P ^ 2))) ds

/-- Polynomial Horner evaluation with a prescribed final tail. -/
def hornerWithTailP (Y tail : ℝ[X]) : List ℚ → ℝ[X]
  | [] => tail
  | r :: rs => C (r : ℝ) + Y * hornerWithTailP Y tail rs

lemma hornerWithTailP_eq (Y tail : ℝ[X]) (rs : List ℚ) :
    hornerWithTailP Y tail rs = hornerP Y rs + Y ^ rs.length * tail := by
  induction rs with
  | nil => simp [hornerWithTailP, hornerP]
  | cons r rs ih =>
    simp only [hornerWithTailP, hornerP, ih, List.length_cons, pow_succ]
    ring

/-- Outward Horner arithmetic also encloses an arbitrary initial polynomial tail. -/
theorem memB_hornerWithTailI {N : ℕ} {Y tail : ℝ[X]} {y t : List Ival}
    (hy : memB N Y y) (ht : memB N tail t) (rs : List ℚ) :
    memB N (hornerWithTailP Y tail rs) (hornerWithTailI N y t rs) := by
  induction rs with
  | nil => exact ht
  | cons r rs ih =>
    exact memB_take (memB_add (memB_single (mem_ofRatI r)) (memB_conv hy ih))

/-- Folding the head over its resolvent correction avoids a separate high power. -/
lemma completedPolynomial_eq_hornerWithTail (P R : ℝ[X]) (k : ℕ) (rs ds : List ℚ)
    (hlen : rs.length = k) :
    completedPolynomial P R k rs ds =
      P * hornerWithTailP (X*P^2) (R*hornerP (-(R*(X*P^2))) ds) rs := by
  unfold completedPolynomial
  rw [hornerWithTailP_eq, hlen]
  have ht : compTerm P k = P*(X*P^2)^k := by
    simpa [compTerm] using compTerm_geometric P 0 k
  rw [ht]
  ring

/-- A coarse degree bound that also covers empty coefficient lists. -/
lemma natDegree_hornerP_le (Y : ℝ[X]) (rs : List ℚ) :
    (hornerP Y rs).natDegree ≤ rs.length * Y.natDegree := by
  induction rs with
  | nil => simp [hornerP]
  | cons a rs ih =>
    simp only [hornerP, List.length_cons]
    refine (natDegree_add_le _ _).trans (max_le (by simp) ?_)
    have h := (natDegree_mul_le (p := Y) (q := hornerP Y rs)).trans
      (Nat.add_le_add_left ih Y.natDegree)
    simpa only [Nat.add_mul, Nat.one_mul, Nat.add_comm] using h

/-- Every retained interval encloses the corresponding completed coefficient. -/
theorem memB_completedHeadI (N k : ℕ) (pl rl rs ds : List ℚ) (hlen : rs.length = k) :
    memB N (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds)
      (completedHeadI N k pl rl rs ds) := by
  have hp := memB_ofListQ pl N
  have hr := memB_ofListQ rl N
  have ha : memB N (X * (ofListQ pl) ^ 2)
      (zeroI :: convI (pl.map ofRatI) (pl.map ofRatI)) := by
    rw [sq]
    exact memB_mono (memB_X_mul (memB_conv hp hp)) (Nat.le_succ N)
  have ht := memB_conv hr (memB_hornerI (memB_neg (memB_conv hr ha)) ds)
  have hh := memB_conv hp (memB_hornerWithTailI ha ht rs)
  have htake : rs.take k = rs := by rw [← hlen, List.take_length]
  rw [completedPolynomial_eq_hornerWithTail _ _ _ _ _ hlen]
  simpa only [completedHeadI, htake] using hh

/-- The interval check controls its coefficient prefix without a degree premise. -/
theorem completedPrefix_le_of_check (N k : ℕ) (pl rl rs ds : List ℚ) (slope cap : ℚ)
    (hlen : rs.length = k)
    (hc : completedHeadOK N k pl rl rs ds slope cap = true) :
    (∑ n ∈ range N, |(completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ)).coeff n|) ≤ (cap : ℝ) := by
  have hb := memB_add (memB_completedHeadI N k pl rl rs ds hlen)
    (memB_single (N := N) (mem_neg (mem_ofRatI slope)))
  have hs : memB N (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ))
      (addL (completedHeadI N k pl rl rs ds) [negI (ofRatI slope)]) := by
    simpa only [map_neg, sub_eq_add_neg] using hb
  simp only [completedHeadOK, decide_eq_true_eq] at hc
  apply le_of_mul_le_mul_right _ D_pos
  exact (absSum_le hs).trans ((Int.cast_le.mpr hc).trans (ofRatLo_le cap))

/-- Acceptance bounds the complete residual when its degree is below `N`. -/
theorem completedHead_le_of_check (N k : ℕ) (pl rl rs ds : List ℚ) (slope cap : ℚ)
    (hlen : rs.length = k)
    (hdeg : (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ)).natDegree < N)
    (hc : completedHeadOK N k pl rl rs ds slope cap = true) :
    l1 (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ)) ≤ (cap : ℝ) := by
  rw [l1_eq_sum_range _ hdeg]
  exact completedPrefix_le_of_check N k pl rl rs ds slope cap hlen hc

end
end Grothe.Upper.ResolventCertificate
