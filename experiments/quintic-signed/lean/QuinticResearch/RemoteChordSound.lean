import QuinticResearch.RemoteRadialCertificate
import Grothe.LowerAnalytic.Bernstein2

/-! Soundness of the radius-dependent chord certificate. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic.RemoteRadial
open Finset

private theorem sumTo_eq (n : ℕ) (f : ℕ → ℚ) : sumTo n f = ∑ i ∈ range n, f i := by
  induction n with
  | zero => simp [sumTo]
  | succ n ih =>
    simpa only [sumTo, List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil,
      sum_range_succ] using congrArg (· + f n) ih

private theorem shifted_eq (p : Pol) (hp : 0 < p.length) (l h : ℚ) (k : ℕ) :
    shifted p l h k = bernA1 (coeff p) (p.length-1) l h k := by
  unfold shifted bernA1
  rw [sumTo_eq, show p.length-1+1=p.length by omega]
  congr 1
  rw [← sum_filter]
  have he : (range p.length).filter (fun j => k ≤ j) = Ico k p.length := by
    ext x
    simp [and_comm]
  rw [he, sum_Ico_eq_sum_range]
  apply sum_congr rfl
  intro j hj
  simp [Nat.add_comm k j]

private theorem bernstein_eq (p : Pol) (hp : 0 < p.length) (l h : ℚ) (i : ℕ) :
    bernstein p l h i = bern1 (coeff p) (p.length-1) l h i := by
  unfold bernstein bern1
  rw [sumTo_eq]
  apply sum_congr rfl
  intro k hk
  rw [shifted_eq _ hp]
  ring

/-- The verified Bernstein coefficients imply a nonnegative real polynomial
at every radius in every closed cell, for both multipliers and endpoint debits. -/
theorem chord_polynomial_nonneg {i : ℕ} (hi : i<32) {s d : ℚ}
    (hs : s ∈ ([1,2]:List ℚ)) (hd : d ∈ ([0,nu]:List ℚ)) {x : ℝ}
    (hx0 : (edge i:ℝ) ≤ x) (hx1 : x ≤ (edge (i+1):ℝ)) :
    let c := chord s (edge i) (edge (i+1))
    let p := add (times [c.1,0,c.2] (denominator s d)) [-1]
    0 ≤ ∑ j ∈ range p.length, (coeff p j:ℝ)*x^j := by
  let c := chord s (edge i) (edge (i+1))
  let p := add (times [c.1,0,c.2] (denominator s d)) [-1]
  change 0 ≤ ∑ j ∈ range p.length, (coeff p j:ℝ)*x^j
  have hlen : 0 < p.length := by simp [p, add, times, denominator]
  have hlen' : p.length-1+1=p.length := by omega
  have hc := List.all_eq_true.mp allChords i (List.mem_range.mpr hi)
  have hsc := List.all_eq_true.mp hc s hs
  have hdc := List.all_eq_true.mp hsc d hd
  have hbern (j : ℕ) (hj : j<p.length) : (0:ℝ) ≤ bern1 (fun k => (coeff p k:ℝ))
      (p.length-1) (edge i) (edge (i+1)) j := by
    have hjcheck := List.all_eq_true.mp hdc j (List.mem_range.mpr hj)
    have hp : 0 ≤ bernstein p (edge i) (edge (i+1)) j := of_decide_eq_true hjcheck
    rw [← bern1_cast, ← bernstein_eq p hlen]
    exact_mod_cast hp
  have hgrid : (List.range 32).all (fun j => decide (edge j < edge (j+1))) = true := by decide +kernel
  have hstep : (edge i:ℝ) < (edge (i+1):ℝ) := by
    exact_mod_cast (of_decide_eq_true (List.all_eq_true.mp hgrid i (List.mem_range.mpr hi)) :
      edge i < edge (i+1))
  obtain ⟨t, ht0, ht1, rfl⟩ := exists_param hx0 hx1 hstep
  have hid := bern1_identity (fun k => (coeff p k:ℝ)) (p.length-1) (edge i) (edge (i+1)) t
  rw [hlen'] at hid
  rw [hid]
  exact sum_nonneg fun j hj => mul_nonneg (hbern j (mem_range.mp hj))
    (bbasis_nonneg _ _ ht0 ht1)

end Grothe.LowerAnalytic.RemoteRadial
