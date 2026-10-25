import Grothe.Upper.PowerTail
import GrotheKernel.ResolventTail

/-!
# Signed Abel tails with a polynomial resolvent certificate

A finite inverse defect controls every signed geometric partial sum in the
Wiener norm. Summation by parts then retains cancellation in a decreasing
coefficient series. Coefficient locality passes the finite estimate to the
entire composition tail; no analytic continuation is assumed.
-/
namespace Grothe.Upper.ResolventTail

open Polynomial Finset
noncomputable section

lemma l1_neg (S : ℝ[X]) : l1 (-S) = l1 S := by
  simp [l1_def]

lemma l1_sub_le (S T : ℝ[X]) : l1 (S-T) ≤ l1 S+l1 T := by
  simpa only [sub_eq_add_neg, l1_neg] using l1_add_le S (-T)

lemma l1_smul_le (a : ℝ) (S : ℝ[X]) : l1 (a • S) ≤ |a| * l1 S := by
  rw [smul_eq_C_mul]
  simpa only [l1_C] using l1_mul_le (C a) S

/-- An a posteriori inverse certificate, without constructing an infinite inverse. -/
theorem inverse_defect_bound (D R S : ℝ[X]) {eta F : ℝ}
    (he : eta < 1) (hdef : l1 (1-R*D) ≤ eta)
    (hprod : l1 (R*(D*S)) ≤ F) : l1 S ≤ F/(1-eta) := by
  have hi : S = (1-R*D)*S+R*(D*S) := by ring
  have h : l1 S ≤ eta*l1 S+F := by
    calc
      _ = l1 ((1-R*D)*S+R*(D*S)) := congrArg l1 hi
      _ ≤ l1 ((1-R*D)*S)+l1 (R*(D*S)) := l1_add_le _ _
      _ ≤ eta*l1 S+F := add_le_add
        ((l1_mul_le _ _).trans (mul_le_mul_of_nonneg_right hdef (l1_nonneg _))) hprod
  apply (le_div_iff₀ (by linarith : 0 < 1-eta)).2
  nlinarith

lemma geometric_difference (A T : ℝ[X]) (n : ℕ) :
    (1-A)*(∑ i ∈ range n, T*A^i) = T-T*A^n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [sum_range_succ, mul_add, ih, pow_succ]
    ring

/-- Only the norm of the already combined seed `R*T` is charged. -/
theorem geometric_prefix_bound (A T R : ℝ[X]) {eta B : ℝ}
    (hA : l1 A ≤ 1) (he : eta < 1) (hdef : l1 (1-R*(1-A)) ≤ eta)
    (hseed : l1 (R*T) ≤ B) (n : ℕ) :
    l1 (∑ i ∈ range n, T*A^i) ≤ 2*B/(1-eta) := by
  apply inverse_defect_bound (1-A) R _ he hdef
  rw [geometric_difference]
  have hp : l1 (A^n) ≤ 1 := (l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg A) hA)
  have hb : 0 ≤ B := (l1_nonneg _).trans hseed
  have hid : R*(T-T*A^n) = R*T-(R*T)*A^n := by ring
  rw [hid]
  calc
    _ ≤ l1 (R*T)+l1 ((R*T)*A^n) := l1_sub_le _ _
    _ ≤ B+B*1 := add_le_add hseed
      ((l1_mul_le _ _).trans (mul_le_mul hseed hp (l1_nonneg _) hb))
    _ = _ := by ring

/-- Abel summation transports a uniform signed partial-sum bound to every
finite sum with nonnegative decreasing weights. -/
theorem decreasing_weights_bound (a : ℕ → ℝ) (T : ℕ → ℝ[X]) {M : ℝ}
    (ha : ∀ i, 0 ≤ a i) (hdec : ∀ i, a (i+1) ≤ a i) (hM : 0 ≤ M)
    (hprefix : ∀ n, l1 (∑ i ∈ range n, T i) ≤ M) (n : ℕ) :
    l1 (∑ i ∈ range n, a i • T i) ≤ a 0*M := by
  cases n with
  | zero => simpa using mul_nonneg (ha 0) hM
  | succ n =>
    rw [sum_range_by_parts]
    simp only [Nat.add_sub_cancel]
    have hfirst : l1 (a n • ∑ i ∈ range (n+1), T i) ≤ a n*M := by
      exact (l1_smul_le _ _).trans (by rw [abs_of_nonneg (ha n)]; exact mul_le_mul_of_nonneg_left (hprefix _) (ha n))
    have hrest : l1 (∑ i ∈ range n, (a (i+1)-a i) • ∑ j ∈ range (i+1), T j) ≤
        (a 0-a n)*M := by
      calc
        _ ≤ ∑ i ∈ range n, l1 ((a (i+1)-a i) • ∑ j ∈ range (i+1), T j) := l1_sum_le _ _
        _ ≤ ∑ i ∈ range n, (a i-a (i+1))*M := by
          refine sum_le_sum fun i _ => (l1_smul_le _ _).trans ?_
          rw [abs_of_nonpos (sub_nonpos.mpr (hdec i)), neg_sub]
          exact mul_le_mul_of_nonneg_left (hprefix _) (sub_nonneg.mpr (hdec i))
        _ = _ := by rw [← sum_mul, sum_range_sub' a n]
    exact (l1_sub_le _ _).trans ((add_le_add hfirst hrest).trans_eq (by ring))

lemma compTerm_geometric (P : ℝ[X]) (K i : ℕ) :
    compTerm P (K+i) = compTerm P K*(X*P^2)^i := by
  unfold compTerm
  rw [mul_pow, pow_add, ← pow_mul]
  have hp : 2*(K+i)+1 = (2*K+1)+2*i := by omega
  rw [hp, pow_add]
  ring

/-- The combined seed can be certified at a short power, while all remaining
powers retain the proved fourth-power contraction. -/
theorem seed_power_bound (P R : ℝ[X]) {q b : ℝ} (hP : l1 P ≤ 1)
    (hq : 0 ≤ q) (hpow : l1 (P^4) ≤ q) (s K : ℕ) (hs : s ≤ 2*K+1)
    (hseed : l1 (R*P^s) ≤ b) :
    l1 (R*compTerm P K) ≤ b*q^((2*K+1-s)/4) := by
  let t := 2*K+1-s
  have he : 2*K+1 = s+4*(t/4)+t%4 := by dsimp [t]; omega
  have hrem : l1 (P^(t%4)) ≤ 1 := (l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hP)
  have hmain : l1 ((P^4)^(t/4)) ≤ q^(t/4) :=
    (l1_pow_le _ _).trans (pow_le_pow_left₀ (l1_nonneg _) hpow _)
  have hp : l1 (R*P^(2*K+1)) ≤ b*q^(t/4) := by
    have hid : R*P^(2*K+1) = (R*P^s)*(P^4)^(t/4)*P^(t%4) := by
      rw [he, pow_add, pow_add, pow_mul]
      ring
    rw [hid]
    have hb : 0 ≤ b := (l1_nonneg _).trans hseed
    exact (l1_mul_le _ _).trans ((mul_le_mul
      ((l1_mul_le _ _).trans (mul_le_mul hseed hmain (l1_nonneg _) hb))
      hrem (l1_nonneg _) (mul_nonneg hb (pow_nonneg hq _))).trans_eq (mul_one _))
  have hid : R*compTerm P K = X^K*(R*P^(2*K+1)) := by unfold compTerm; ring
  rw [hid]
  exact (l1_mul_le _ _).trans ((mul_le_mul
    ((l1_pow_le _ _).trans (by simp)) hp (l1_nonneg _) zero_le_one).trans_eq (one_mul _))

lemma compTerm_coeff_zero (P : ℝ[X]) {k n : ℕ} (hn : n < k) :
    (compTerm P k).coeff n = 0 := by
  simp [compTerm, coeff_X_pow_mul', Nat.not_le.mpr hn]

/-- Every coefficient only sees finitely many terms, so the finite Abel bound
controls the complete composition tail, without an exchange of two series. -/
theorem composition_tail_bound (a : ℕ → ℝ) (P R : ℝ[X]) (K : ℕ)
    (ha : ∀ i, 0 ≤ a i) (hdec : ∀ i, a (i+1) ≤ a i)
    (hP : l1 P ≤ 1) {eta B : ℝ} (he : eta < 1)
    (hdef : l1 (1-R*(1-X*P^2)) ≤ eta) (hseed : l1 (R*compTerm P K) ≤ B) :
    ∑' n, |compCoeff (fun k => if k < K then 0 else a k) P n| ≤
      a K*(2*B/(1-eta)) := by
  have hb : 0 ≤ B := (l1_nonneg _).trans hseed
  have hm : 0 ≤ 2*B/(1-eta) := div_nonneg (by positivity) (by linarith)
  have hA : l1 (X*P^2) ≤ 1 := by
    exact (l1_mul_le _ _).trans ((mul_le_mul
      (by simp : l1 (X : ℝ[X]) ≤ 1)
      ((l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hP))
      (l1_nonneg _) zero_le_one).trans_eq (one_mul _))
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro J
  let S : ℝ[X] := ∑ i ∈ range J, a (K+i) • compTerm P (K+i)
  have hid (n : ℕ) (hn : n < J) :
      compCoeff (fun k => if k < K then 0 else a k) P n = S.coeff n := by
    unfold compCoeff
    rw [tsum_eq_sum (s := range (K+J))]
    · rw [sum_range_add]
      have hz : ∑ k ∈ range K, (if k < K then 0 else a k)*(compTerm P k).coeff n = 0 := by
        apply sum_eq_zero
        intro k hk
        simp [mem_range.mp hk]
      rw [hz, zero_add]
      simp only [S, finsetSum_coeff, coeff_smul, smul_eq_mul]
      apply sum_congr rfl
      intro i _
      simp [show ¬ K+i < K by omega]
    · intro k hk
      rw [compTerm_coeff_zero P (by have := mem_range.not.mp hk; omega), mul_zero]
  calc
    _ = ∑ n ∈ range J, |S.coeff n| := sum_congr rfl fun n hn => congrArg abs (hid n (mem_range.mp hn))
    _ ≤ l1 S := sum_abs_coeff_le_l1 _ _
    _ ≤ a K*(2*B/(1-eta)) := by
      dsimp only [S]
      simp_rw [compTerm_geometric P K]
      exact decreasing_weights_bound (fun i => a (K+i))
        (fun i => compTerm P K*(X*P^2)^i) (fun i => ha _) (fun i => hdec _)
        hm (geometric_prefix_bound _ _ _ hA he hdef hseed) J

lemma memB_neg {N : ℕ} {S : ℝ[X]} {L : List GrotheKernel.Ival}
    (h : memB N S L) : memB N (-S) (L.map GrotheKernel.negI) := by
  intro n hn
  have hz : GrotheKernel.negI GrotheKernel.zeroI = GrotheKernel.zeroI := by
    rfl
  rw [← hz, List.getD_map, coeff_neg]
  exact mem_neg (h n hn)

lemma defect_of_check (pl rl : List ℚ) (N : ℕ) (eta : ℚ)
    (hdeg : (1-ofListQ rl*(1-X*(ofListQ pl)^2)).natDegree < N)
    (hc : GrotheKernel.resolventNormOK pl rl eta = true) :
    l1 (1-ofListQ rl*(1-X*(ofListQ pl)^2)) ≤ (eta : ℝ) := by
  have hp := memB_ofListQ pl N
  have hr := memB_ofListQ rl N
  have hone : memB N (1 : ℝ[X]) [GrotheKernel.ofRatI 1] := by
    simpa using (memB_single (N := N) (mem_ofRatI 1))
  have hA := memB_mono (memB_X_mul (memB_conv hp hp)) (Nat.le_succ N)
  have hd := memB_add hone (memB_neg hA)
  have hb := memB_add hone (memB_neg (memB_conv hr hd))
  simp only [← sub_eq_add_neg, ← pow_two] at hb
  change memB N (1-ofListQ rl*(1-X*(ofListQ pl)^2))
    (GrotheKernel.resolventDefectI pl rl) at hb
  simp only [GrotheKernel.resolventNormOK, decide_eq_true_eq] at hc
  rw [l1_eq_sum_range _ hdeg]
  apply le_of_mul_le_mul_right _ D_pos
  exact (absSum_le hb).trans ((Int.cast_le.mpr hc).trans (ofRatLo_le eta))

lemma seed_of_check (pl rl : List ℚ) (s N : ℕ) (b : ℚ)
    (hdeg : (ofListQ rl*(ofListQ pl)^s).natDegree < N)
    (hc : GrotheKernel.seedNormOK pl rl s b = true) :
    l1 (ofListQ rl*(ofListQ pl)^s) ≤ (b : ℝ) := by
  have hb := memB_conv (memB_ofListQ rl N) (PowerTail.mem_polyPowI pl s N)
  simp only [GrotheKernel.seedNormOK, decide_eq_true_eq] at hc
  rw [l1_eq_sum_range _ hdeg]
  apply le_of_mul_le_mul_right _ D_pos
  exact (absSum_le hb).trans ((Int.cast_le.mpr hc).trans (ofRatLo_le b))

lemma tail_numeric_of_check (k s : ℕ) (q b gamma eta cap : ℚ)
    (hc : GrotheKernel.resolventTailOK k s q b gamma eta cap = true) :
    (2*(b : ℝ)*gamma / (((k+1)*(2*k+1) : ℕ) : ℝ) / (1-eta))*
      (q : ℝ)^((2*k+1-s)/4) ≤ (cap : ℝ) := by
  have hp : mem (2*(b : ℝ)*gamma / (((k+1)*(2*k+1) : ℕ) : ℝ) / (1-eta))
      (GrotheKernel.ofRatI (2*b*gamma / (((k+1)*(2*k+1) : ℕ) : ℚ) / (1-eta))) := by
    convert mem_ofRatI (2*b*gamma / (((k+1)*(2*k+1) : ℕ) : ℚ) / (1-eta)) using 1
    push_cast
    rfl
  have hm := mem_mul hp (PowerTail.mem_powIval q ((2*k+1-s)/4))
  change mem _ (GrotheKernel.resolventTailI k s q b gamma eta) at hm
  simp only [GrotheKernel.resolventTailOK, decide_eq_true_eq] at hc
  exact le_of_mul_le_mul_right (hm.2.trans ((Int.cast_le.mpr hc).trans (ofRatLo_le cap))) D_pos

end
end Grothe.Upper.ResolventTail
