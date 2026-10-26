import Grothe.Upper.Haagerup
import Grothe.Upper.ResolventTail
import GrotheKernel.ResolventCompletion

/-!
# Soundness of finite resolvent completion certificates

The original finite head and its signed resolvent correction are combined
before taking the coefficient norm. A degree bound ensures that the interval
calculation controls every coefficient of the resulting polynomial.
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
theorem memB_completedHeadI (N k : ℕ) (pl rl rs ds : List ℚ) :
    memB N (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds)
      (completedHeadI N k pl rl rs ds) := by
  have hp := memB_ofListQ pl N
  have hr := memB_ofListQ rl N
  have ha : memB N (X * (ofListQ pl) ^ 2)
      (zeroI :: convI (pl.map ofRatI) (pl.map ofRatI)) := by
    rw [sq]
    exact memB_mono (memB_X_mul (memB_conv hp hp)) (Nat.le_succ N)
  have ht : memB N (compTerm (ofListQ pl) k)
      (List.replicate k zeroI ++ polyPowI (pl.map ofRatI) (2*k+1)) := by
    simpa only [compTerm, shiftX] using
      (memB_shiftX (K := N) (k := k) (PowerTail.mem_polyPowI pl (2*k+1) (N-k)))
  have hh := memB_conv hp (memB_hornerI ha rs)
  have hc := memB_conv (memB_conv hr ht)
    (memB_hornerI (memB_neg (memB_conv hr ha)) ds)
  exact memB_add hh hc

/-- Acceptance bounds the complete residual when its degree is below `N`. -/
theorem completedHead_le_of_check (N k : ℕ) (pl rl rs ds : List ℚ) (slope cap : ℚ)
    (hdeg : (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ)).natDegree < N)
    (hc : completedHeadOK N k pl rl rs ds slope cap = true) :
    l1 (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ)) ≤ (cap : ℝ) := by
  have hb := memB_add (memB_completedHeadI N k pl rl rs ds)
    (memB_single (N := N) (mem_neg (mem_ofRatI slope)))
  have hs : memB N (completedPolynomial (ofListQ pl) (ofListQ rl) k rs ds -
      C (slope : ℝ))
      (addL (completedHeadI N k pl rl rs ds) [negI (ofRatI slope)]) := by
    simpa only [map_neg, sub_eq_add_neg] using hb
  simp only [completedHeadOK, decide_eq_true_eq] at hc
  rw [l1_eq_sum_range _ hdeg]
  apply le_of_mul_le_mul_right _ D_pos
  exact (absSum_le hs).trans ((Int.cast_le.mpr hc).trans (ofRatLo_le cap))

end
end Grothe.Upper.ResolventCertificate
