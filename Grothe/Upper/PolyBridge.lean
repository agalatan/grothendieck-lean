import Grothe.Upper.Interface
import Grothe.Upper.IntervalSound

/-!
# Bridge between `compose`, `sProf` and the Horner form

* `ofListQ` is multiplicative on `convQ`, so `coeffQ (listPowQ row k) m` is a polynomial coefficient;
* `sProf row n = compose hRat (ofListQ row) n` (as reals);
* `compose c E n = (E * hornerPoly cs (X * E^2)).coeff n` when `c j = cs.getD j 0`.
-/

namespace Grothe.Upper

open Polynomial GrotheKernel

noncomputable section

@[simp] lemma ofListQ_nil : ofListQ [] = 0 := rfl
@[simp] lemma ofListQ_cons (a : ℚ) (l : List ℚ) : ofListQ (a :: l) = C (a : ℝ) + X * ofListQ l := rfl

lemma ofListQ_addLQ (l m : List ℚ) : ofListQ (addLQ l m) = ofListQ l + ofListQ m := by
  induction l generalizing m with
  | nil => simp [addLQ]
  | cons a l ih =>
    cases m with
    | nil => simp [addLQ]
    | cons b m =>
      simp only [addLQ, ofListQ_cons, ih]
      push_cast
      simp only [C_add]
      ring

lemma ofListQ_map_mul (a : ℚ) (m : List ℚ) :
    ofListQ (m.map (a * ·)) = C (a : ℝ) * ofListQ m := by
  induction m with
  | nil => simp
  | cons b m ih =>
    simp only [List.map_cons, ofListQ_cons, ih]
    push_cast
    simp only [C_mul]
    ring

lemma ofListQ_convQ (l m : List ℚ) : ofListQ (convQ l m) = ofListQ l * ofListQ m := by
  induction l with
  | nil => simp [convQ]
  | cons a l ih =>
    simp only [convQ, ofListQ_addLQ, ofListQ_map_mul, ofListQ_cons, ih, Rat.cast_zero, C_0,
      zero_add]
    ring

lemma ofListQ_listPowQ (l : List ℚ) (n : ℕ) : ofListQ (listPowQ l n) = ofListQ l ^ n := by
  induction n with
  | zero => simp [listPowQ]
  | succ n ih => rw [listPowQ, ofListQ_convQ, ih, pow_succ, mul_comm]

lemma coeff_ofListQ (l : List ℚ) (n : ℕ) : (ofListQ l).coeff n = (coeffQ l n : ℝ) := by
  induction l generalizing n with
  | nil => simp [coeffQ]
  | cons a l ih =>
    cases n with
    | zero => simp [coeffQ]
    | succ n =>
      simp only [ofListQ_cons, coeff_add, coeff_C_succ, coeff_X_mul, zero_add, ih]
      simp [coeffQ]

/-- `sProf` is the radial composition of `hRat` with the row polynomial. -/
lemma sProf_eq_compose (row : List ℚ) (n : ℕ) :
    ((sProf row n : ℚ) : ℝ) = compose (fun j => (hRat j : ℝ)) (ofListQ row) n := by
  unfold sProf compose
  push_cast
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [← ofListQ_listPowQ, coeff_ofListQ]

/-- `polySum cs E = Σ_{j < |cs|} C cs_j · X^j · E^{2j+1}`. -/
def polySum (cs : List ℝ) (E : ℝ[X]) : ℝ[X] :=
  ∑ j ∈ Finset.range cs.length, C (cs.getD j 0) * (X ^ j * E ^ (2 * j + 1))

lemma horner_eq_polySum (cs : List ℝ) (E : ℝ[X]) :
    E * hornerPoly cs (X * E ^ 2) = polySum cs E := by
  induction cs with
  | nil => simp [hornerPoly, polySum]
  | cons a rest ih =>
    have e1 : E * C a = C a * (X ^ 0 * E ^ (2 * 0 + 1)) := by ring
    have e2 : X * E ^ 2 * polySum rest E
        = ∑ j ∈ Finset.range rest.length, C (rest.getD j 0) * (X ^ (j + 1) * E ^ (2 * (j + 1) + 1)) := by
      unfold polySum
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun j _ => by ring
    simp only [hornerPoly]
    rw [mul_add, mul_left_comm, ih, e1, e2]
    unfold polySum
    rw [List.length_cons, Finset.sum_range_succ']
    simp only [List.getD_cons_succ, List.getD_cons_zero]
    ring

lemma coeff_polySum (cs : List ℝ) (E : ℝ[X]) (n : ℕ) :
    (polySum cs E).coeff n
      = ∑ j ∈ Finset.range cs.length,
          cs.getD j 0 * (if j ≤ n then (E ^ (2 * j + 1)).coeff (n - j) else 0) := by
  unfold polySum
  rw [finset_sum_coeff]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [coeff_C_mul, coeff_X_pow_mul']

/-- `compose (getD cs) E n` is a coefficient of `polySum cs E`. -/
lemma compose_getD_eq_coeff (cs : List ℝ) (E : ℝ[X]) (n : ℕ) :
    compose (fun j => cs.getD j 0) E n = (polySum cs E).coeff n := by
  rw [coeff_polySum]
  unfold compose
  set f : ℕ → ℝ := fun j => cs.getD j 0 * (if j ≤ n then (E ^ (2 * j + 1)).coeff (n - j) else 0)
    with hf
  have h1 : ∑ j ∈ Finset.range (n + 1), cs.getD j 0 * (E ^ (2 * j + 1)).coeff (n - j)
      = ∑ j ∈ Finset.range (cs.length + n + 1), f j := by
    rw [← Finset.sum_subset (Finset.range_mono (by omega : n + 1 ≤ cs.length + n + 1))]
    · refine Finset.sum_congr rfl fun j hj => ?_
      rw [Finset.mem_range] at hj
      simp [hf, Nat.lt_succ_iff.mp hj]
    · intro j _ hj
      rw [Finset.mem_range] at hj
      simp [hf, show ¬ j ≤ n by omega]
  have h2 : ∑ j ∈ Finset.range cs.length, f j = ∑ j ∈ Finset.range (cs.length + n + 1), f j := by
    apply Finset.sum_subset (Finset.range_mono (by omega))
    intro j _ hj
    rw [Finset.mem_range, not_lt] at hj
    simp [hf, List.getD_eq_getElem?_getD, List.getElem?_eq_none hj]
  rw [h1, h2]

/-- The composition only depends on the coefficients `c_j`, `j ≤ n`. -/
lemma compose_congr {c c' : ℕ → ℝ} (E : ℝ[X]) (n : ℕ) (h : ∀ j ≤ n, c j = c' j) :
    compose c E n = compose c' E n := by
  unfold compose
  refine Finset.sum_congr rfl fun j hj => ?_
  rw [Finset.mem_range] at hj
  rw [h j (by omega)]

lemma getD_ofFn_lt {α : Type*} {N : ℕ} (f : Fin N → α) (z : α) (j : ℕ) (hj : j < N) :
    (List.ofFn f).getD j z = f ⟨j, hj⟩ := by
  rw [List.getD_eq_getElem?_getD, List.getElem?_ofFn]
  simp [hj]

lemma getD_ofFn_ge {α : Type*} {N : ℕ} (f : Fin N → α) (z : α) (j : ℕ) (hj : N ≤ j) :
    (List.ofFn f).getD j z = z := by
  rw [List.getD_eq_getElem?_getD, List.getElem?_ofFn]
  simp [show ¬ j < N by omega]

/-- `Forall₂` for two `ofFn` lists from pointwise membership. -/
lemma forall₂_ofFn {N : ℕ} (f : Fin N → ℝ) (g : Fin N → Ival) (h : ∀ i, mem (f i) (g i)) :
    List.Forall₂ mem (List.ofFn f) (List.ofFn g) := by
  rw [List.forall₂_iff_get]
  refine ⟨by simp, fun i h1 h2 => ?_⟩
  simp only [List.get_eq_getElem, List.getElem_ofFn]
  exact h _

end

end Grothe.Upper
