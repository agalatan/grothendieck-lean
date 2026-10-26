import Grothe.Upper.Compose
import Grothe.Upper.Head
import GrotheKernel.PowerTail

/-!
# Retaining cancellation in powers before bounding a series tail

A polynomial with Wiener norm one can have a power of strictly smaller norm.
For P⁴ this gives the price q^(k/2) for the kth radial composition term.
The remaining one-dimensional tail has a finite, outward-rounded telescoping
certificate; it is not bounded by the unweighted tail of the original series.
-/

namespace Grothe.Upper.PowerTail

open Polynomial Finset GrotheKernel
noncomputable section

lemma compTerm_power_bound {P : ℝ[X]} (hP : l1 P ≤ 1) {q : ℝ}
    (hq : 0 ≤ q) (hpow : l1 (P ^ 4) ≤ q) (k : ℕ) :
    l1 (compTerm P k) ≤ q ^ (k / 2) := by
  have he : 2*k+1 = 4*(k/2)+(2*(k%2)+1) := by omega
  have hrem : l1 (P ^ (2*(k%2)+1)) ≤ 1 :=
    (l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hP)
  have hp : l1 (P ^ (2*k+1)) ≤ q ^ (k/2) := by
    rw [he, pow_add, pow_mul]
    exact (l1_mul_le _ _).trans ((mul_le_mul
      ((l1_pow_le _ _).trans (pow_le_pow_left₀ (l1_nonneg _) hpow _))
      hrem (l1_nonneg _) (pow_nonneg hq _)).trans_eq (mul_one _))
  exact (l1_mul_le _ _).trans ((mul_le_mul
    ((l1_pow_le _ _).trans (by simp)) hp (l1_nonneg _) zero_le_one).trans_eq (one_mul _))

lemma weighted_composition {c : ℕ → ℝ} (hc : Summable fun k => |c k|)
    {P : ℝ[X]} (hP : l1 P ≤ 1) (w : ℕ → ℝ)
    (hw0 : ∀ k, 0 ≤ w k) (hw1 : ∀ k, w k ≤ 1)
    (hterm : ∀ k, l1 (compTerm P k) ≤ w k) :
    ∑' n, |compCoeff c P n| ≤ ∑' k, |c k| * w k := by
  have hsw : Summable fun k => |c k| * w k :=
    Summable.of_nonneg_of_le (fun k => mul_nonneg (abs_nonneg _) (hw0 k))
      (fun k => mul_le_of_le_one_right (abs_nonneg _) (hw1 k)) hc
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro J
  exact sum_abs_tsum_le (range J) (fun k n => c k * (compTerm P k).coeff n)
    (fun n _ => (summable_compCoeff_term hc hP n).norm) hsw fun k => by
      simp only [abs_mul, ← mul_sum]
      exact mul_le_mul_of_nonneg_left ((sum_abs_coeff_le_l1 _ _).trans (hterm k)) (abs_nonneg _)

def telescope (k : ℕ) (q : ℝ) : ℕ → ℝ
  | 0 => 1 / k
  | n+1 => (1 / k - 1 / (k+2)) + q * telescope (k+2) q n

lemma mem_polyPowI (pl : List ℚ) (power N : ℕ) :
    memB N ((ofListQ pl)^power) (polyPowI (pl.map ofRatI) power) := by
  induction power with
  | zero => simpa [polyPowI] using (memB_single (N := N) (mem_ofRatI 1))
  | succ n ih =>
    simpa [polyPowI, pow_succ, mul_comm] using memB_conv (memB_ofListQ pl N) ih

lemma power_norm_of_check (pl : List ℚ) (power N : ℕ) (q : ℚ)
    (hdeg : ((ofListQ pl)^power).natDegree < N)
    (hc : powerNormOK pl power q = true) :
    l1 ((ofListQ pl)^power) ≤ (q : ℝ) := by
  simp only [powerNormOK, decide_eq_true_eq] at hc
  rw [l1_eq_sum_range _ hdeg]
  apply le_of_mul_le_mul_right _ D_pos
  exact (absSum_le (mem_polyPowI pl power N)).trans ((Int.cast_le.mpr hc).trans (ofRatLo_le q))

lemma mem_powIval (q : ℚ) (n : ℕ) :
    mem ((q : ℝ)^n) (powIval (ofRatI q) n) := by
  induction n with
  | zero => simpa [powIval] using mem_ofRatI 1
  | succ n ih => simpa [powIval, pow_succ, mul_comm] using mem_mul (mem_ofRatI q) ih

lemma mem_telescope (k n : ℕ) (q : ℚ) :
    mem (telescope k (q : ℝ) n) (telescopeI k (ofRatI q) n) := by
  induction n generalizing k with
  | zero => simpa [telescope, telescopeI] using mem_ofRatI (1/(k : ℚ))
  | succ n ih =>
    have hd : mem (1/(k : ℝ)-1/((k+2 : ℕ) : ℝ))
        (ofRatI (1/(k : ℚ)-1/((k+2 : ℕ) : ℚ))) := by
      convert mem_ofRatI (1/(k : ℚ)-1/((k+2 : ℕ) : ℚ)) using 1; push_cast; rfl
    simpa [telescope, telescopeI] using mem_add hd (mem_mul (mem_ofRatI q) (ih (k+2)))

lemma tail_numeric_of_check (k n : ℕ) (q gamma cap : ℚ)
    (hc : powerTailOK k n q gamma cap = true) :
    (gamma : ℝ)/2 * (q : ℝ)^(k/2) * telescope k (q : ℝ) n ≤ (cap : ℝ) := by
  have hm : mem ((gamma : ℝ)/2*((q : ℝ)^(k/2)*telescope k (q : ℝ) n))
      (powerTailI k n q gamma) := by
    apply mem_mul
    · convert mem_ofRatI (gamma/2) using 1; push_cast; rfl
    · exact mem_mul (mem_powIval q (k/2)) (mem_telescope k n q)
  simp only [powerTailOK, decide_eq_true_eq] at hc
  have hh := hm.2.trans ((Int.cast_le.mpr hc).trans (ofRatLo_le cap))
  exact le_of_mul_le_mul_right (by simpa [mul_assoc] using hh) D_pos

def weightedTail (a : ℕ → ℝ) (q : ℝ) (k : ℕ) : ℝ :=
  ∑' i, a (i+k)*q^((i+k)/2)

lemma summable_weighted (a : ℕ → ℝ) (ha : Summable a) {q : ℝ}
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) (k : ℕ) :
    Summable fun i => a (i+k)*q^((i+k)/2) := by
  apply Summable.of_norm_bounded ((summable_nat_add_iff k).mpr ha).norm
  intro i
  simp only [Real.norm_eq_abs, abs_mul, abs_of_nonneg (pow_nonneg hq0 _)]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hq0 hq1)

lemma weightedTail_pair (a : ℕ → ℝ) (ha : Summable a) {q : ℝ}
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) (k : ℕ) :
    weightedTail a q k = a k*q^(k/2)+a (k+1)*q^((k+1)/2)+weightedTail a q (k+2) := by
  have h := (summable_weighted a ha hq0 hq1 k).sum_add_tsum_nat_add 2
  have he : (∑' i, a (i+2+k)*q^((i+2+k)/2)) = weightedTail a q (k+2) := by
    apply tsum_congr
    intro i
    congr 2 <;> omega
  simp only [sum_range_succ, sum_range_zero, zero_add] at h
  rw [he] at h
  simpa only [weightedTail, Nat.add_comm 1 k] using h.symm

/-- A finite weighted telescope dominates the entire infinite suffix. The
coarse and two-step bounds can come from any nonnegative summable sequence. -/
theorem weighted_tail_bound (a : ℕ → ℝ) (ha : Summable a) (ha0 : ∀ k, 0 ≤ a k)
    (q gamma : ℝ) (hq0 : 0 ≤ q) (hq1 : q ≤ 1) (start : ℕ)
    (hcoarse : ∀ k, start ≤ k → (∑' i, a (i+k)) ≤ gamma/(2*k))
    (hpair : ∀ k, start ≤ k → a k+a (k+1) ≤ gamma/2*(1/k-1/(k+2)))
    (n k : ℕ) (hk : start ≤ k) :
    weightedTail a q k ≤ gamma/2*q^(k/2)*telescope k q n := by
  induction n generalizing k with
  | zero =>
    have hp : ∀ i, q^((i+k)/2) ≤ q^(k/2) := by
      intro i
      apply pow_le_pow_of_le_one hq0 hq1
      omega
    have hs : Summable fun i => a (i+k) := (summable_nat_add_iff k).mpr ha
    calc
      weightedTail a q k ≤ ∑' i, a (i+k)*q^(k/2) := by
        exact (summable_weighted a ha hq0 hq1 k).tsum_le_tsum
          (fun i => mul_le_mul_of_nonneg_left (hp i) (ha0 _)) (hs.mul_right _)
      _ = (∑' i, a (i+k))*q^(k/2) := tsum_mul_right
      _ ≤ gamma/(2*k)*q^(k/2) := mul_le_mul_of_nonneg_right (hcoarse k hk) (pow_nonneg hq0 _)
      _ = gamma/2*q^(k/2)*telescope k q 0 := by rw [telescope]; ring
  | succ n ih =>
    have hp : q^((k+1)/2) ≤ q^(k/2) := by
      apply pow_le_pow_of_le_one hq0 hq1
      omega
    have hh := ih (k+2) (by omega)
    have he : (k+2)/2 = k/2+1 := by omega
    rw [he,pow_succ] at hh
    rw [weightedTail_pair a ha hq0 hq1 k]
    calc
      _ ≤ (a k+a (k+1))*q^(k/2) + gamma/2*(q^(k/2)*q)*telescope (k+2) q n := by
        nlinarith [mul_le_mul_of_nonneg_left hp (ha0 (k+1))]
      _ ≤ (gamma/2*(1/k-1/(k+2)))*q^(k/2) + gamma/2*(q^(k/2)*q)*telescope (k+2) q n :=
        add_le_add (mul_le_mul_of_nonneg_right (hpair k hk) (pow_nonneg hq0 _)) le_rfl
      _ = gamma/2*q^(k/2)*telescope k q (n+1) := by rw [telescope]; ring

/-- A coherent boundary phase prevents every finite-power norm saving. -/
lemma eval_neg_one_le (P : ℝ[X]) : |P.eval (-1)| ≤ l1 P := by
  calc
    |P.eval (-1)| = |∑ n ∈ P.support, P.coeff n*(-1 : ℝ)^n| := by
      rw [Polynomial.eval_eq_sum]
      rfl
    _ ≤ ∑ n ∈ P.support, |P.coeff n*(-1 : ℝ)^n| := Finset.abs_sum_le_sum_abs _ _
    _ = l1 P := by simp [l1_def,abs_mul]

/-- In particular, a normalized cubic/degree-seven preprocessor with its
nonlinear coefficients at odd radial indices cannot use this tail gain. -/
theorem no_power_saving_of_boundary (P : ℝ[X]) (hP : l1 P ≤ 1)
    (he : |P.eval (-1)| = 1) (n : ℕ) : l1 (P^n) = 1 := by
  apply le_antisymm ((l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hP))
  have h := eval_neg_one_le (P^n)
  simpa only [Polynomial.eval_pow,abs_pow,he,one_pow] using h

end
end Grothe.Upper.PowerTail
