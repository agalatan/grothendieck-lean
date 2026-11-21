import Grothe.UpperReplacement.HeadPolynomial

set_option warningAsError true

/-!
# Finite polynomial enclosure interfaces

Agent-ID: codex-a7c4. Composition, truncation, weighted addition, and extraction of the
linear and nonlinear bounds all preserve the signed coefficient intervals.
-/

namespace Grothe.UpperReplacement

open Finset Polynomial Upper GrotheKernel

noncomputable section

theorem gradePolynomial_coeff_stable (g : ℕ → ℝ) (P : ℝ[X]) {n K : ℕ} (hn : n ≤ K) :
    (gradePolynomial K P g).coeff n = (gradePolynomial n P g).coeff n := by
  simp only [gradePolynomial, finsetSum_coeff, coeff_C_mul]
  symm
  apply sum_subset (range_mono (by omega))
  intro j _ hj
  have hjn : n < j := by simp only [mem_range] at hj; omega
  rw [coeff_X_pow_mul', ite_eq_right (by omega), mul_zero]

/-- The first `N` coefficients of a polynomial, with exact zero extension. -/
def polynomialHead (N : ℕ) (p : ℝ[X]) : ℝ[X] :=
  ∑ j ∈ range N, monomial j (p.coeff j)

theorem polynomialHead_coeff (N : ℕ) (p : ℝ[X]) (n : ℕ) :
    (polynomialHead N p).coeff n = if n < N then p.coeff n else 0 := by
  simp [polynomialHead, finsetSum_coeff, coeff_monomial]

theorem memB_polynomialHead {M N : ℕ} {p : ℝ[X]} {L : List Ival}
    (h : memB N p L) (hL : L.length ≤ N) : memB M (polynomialHead N p) L := by
  intro n _
  rw [polynomialHead_coeff]
  by_cases hn : n < N
  · rw [ite_eq_left hn]
    exact h n hn
  · rw [ite_eq_right hn, List.getD_eq_default _ _ (by omega)]
    exact mem_zero

namespace HeadCompute

theorem haagAux_eq (n k : ℕ) :
    haagAux n k (haagR k) = (List.range n).map fun i ↦ haagR (k + i) := by
  induction n generalizing k with
  | zero => rfl
  | succ n ih =>
    rw [haagAux, List.range_succ_eq_map, List.map_cons, List.map_map]
    rw [show haagR k * (((2 * k + 1) ^ 2 : ℕ) : ℚ) /
      ((4 * (k + 1) * (k + 2) : ℕ) : ℚ) = haagR (k + 1) from rfl, ih]
    congr 1
    apply List.map_congr_left
    intro i _
    simp only [Function.comp_apply]
    congr 1
    omega

theorem haagList_eq (N : ℕ) : haagList N = (List.range N).map haagR := by
  rw [haagList, show (1 : ℚ) = haagR 0 from rfl, haagAux_eq]
  simp

theorem mem_phaseCoefficients {pi : Ival} (hpi : mem Real.pi pi) (N : ℕ) :
    List.Forall₂ mem ((List.range N).map haagCoeff) (phaseCoefficients N pi) := by
  have h (l : List ℕ) : List.Forall₂ mem (l.map haagCoeff)
      ((l.map haagR).map fun r ↦ mulI pi (ofRatI (r / 4))) := by
    induction l with
    | nil => exact List.Forall₂.nil
    | cons k l ih =>
      apply List.Forall₂.cons ?_ ih
      convert mem_mul hpi (mem_ofRatI (haagR k / 4)) using 1
      simp only [haagCoeff, Rat.cast_div, Rat.cast_ofNat]
      ring
  simpa only [phaseCoefficients, haagList_eq] using h (List.range N)

theorem memB_phaseHead {pi : Ival} (hpi : mem Real.pi pi) (K : ℕ) (pl : List ℚ) :
    memB (K + 1) (gradePolynomial K (ofListQ pl) haagCoeff)
      (compose (K + 1) pl (phaseCoefficients (K + 1) pi)) := by
  rw [← composePolynomial_eq]
  exact memB_compose pl (mem_phaseCoefficients hpi (K + 1))

theorem memB_sumL {ι : Type*} {M : ℕ} (l : List ι) (p : ι → ℝ[X]) (v : ι → List Ival)
    (h : ∀ x ∈ l, memB M (p x) (v x)) :
    memB M (l.map p).sum (sumL (l.map v)) := by
  induction l with
  | nil => exact memB_zero M
  | cons x l ih =>
    exact memB_add (h x List.mem_cons_self)
      (ih fun y hy ↦ h y (List.mem_cons_of_mem _ hy))

theorem memB_drop_one {K : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB (K + 1) p L) :
    memB K (divX p) (L.drop 1) := by
  intro n hn
  rw [coeff_divX]
  have he : (L.drop 1).getD n zeroI = L.getD (n + 1) zeroI := by
    simp only [List.getD_eq_getElem?_getD, List.getElem?_drop, Nat.add_comm]
  rw [he]
  exact h (n + 1) (by omega)

/-- Extract the two numerical inequalities, retaining the actual signed linear coefficient. -/
theorem bounds_of_head_check {K : ℕ} {p : ℝ[X]} {L : List Ival}
    (h : memB (K + 1) p L) {c H : ℚ}
    (hc : ofRatHi c ≤ (L.getD 0 zeroI).lo)
    (hH : absSum (L.drop 1) ≤ ofRatLo H) :
    (c : ℝ) ≤ p.coeff 0 ∧ ∑ j ∈ range K, |p.coeff (j + 1)| ≤ (H : ℝ) := by
  constructor
  · have h0 := (h 0 (by omega)).1
    have h1 : (ofRatHi c : ℝ) ≤ ((L.getD 0 zeroI).lo : ℝ) := by exact_mod_cast hc
    exact le_of_mul_le_mul_right ((le_ofRatHi c).trans (h1.trans h0)) D_pos
  · have ha := absSum_le (memB_drop_one h)
    simp only [coeff_divX] at ha
    have hb : (absSum (L.drop 1) : ℝ) ≤ (H : ℝ) * D :=
      (Int.cast_le.mpr hH).trans (ofRatLo_le H)
    exact le_of_mul_le_mul_right (ha.trans hb) D_pos

end HeadCompute

end

end Grothe.UpperReplacement
