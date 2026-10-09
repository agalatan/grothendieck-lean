import Grothe.Upper.CheckerDefs
import Grothe.Upper.PolyBridge

/-!
# Soundness lemmas of the interval checker

Enclosure lemmas for the constants (`π`), for rational coefficient lists and for the recursion
of Haagerup's coefficients; they are composed into the soundness of the certificate's columns in
`Cert.lean`.
-/

namespace Grothe.Upper

open GrotheKernel Polynomial
open scoped ComplexConjugate

/-! ### Basic enclosures -/

lemma mem_pi : mem Real.pi piI := by
  unfold piI
  apply mem_boxI
  · have := Real.pi_gt_d20
    exact_mod_cast this.le
  · have := Real.pi_lt_d20
    exact_mod_cast this.le

lemma ofRatLo_nonneg {q : ℚ} (hq : 0 ≤ q) : 0 ≤ ofRatLo q := by
  unfold ofRatLo
  have hD : (0 : ℚ) ≤ (D : ℚ) := by unfold D K; positivity
  exact Rat.le_floor_iff.2 (by simpa using mul_nonneg hq hD)

lemma pi_lo : 0 ≤ piI.lo ∧ (piI.lo : ℝ) ≤ Real.pi * D := by
  refine ⟨ofRatLo_nonneg (by norm_num), ?_⟩
  exact (mem_pi).1

lemma getD_map_ofRatI (l : List ℚ) (n : ℕ) :
    (l.map ofRatI).getD n zeroI = ofRatI (l.getD n 0) := by
  induction l generalizing n with
  | nil => simp [ofRatI_zero]
  | cons a l ih =>
    cases n with
    | zero => simp
    | succ n =>
      rw [List.map_cons, List.getD_cons_succ, List.getD_cons_succ]
      exact ih n

lemma getD_map_ofRatLo (l : List ℚ) (n : ℕ) :
    (l.map ofRatLo).getD n 0 = ofRatLo (l.getD n 0) := by
  induction l generalizing n with
  | nil => simp [ofRatLo, Rat.floor]
  | cons a l ih =>
    cases n with
    | zero => simp
    | succ n =>
      rw [List.map_cons, List.getD_cons_succ, List.getD_cons_succ]
      exact ih n

lemma getD_map_cast (l : List ℚ) (n : ℕ) :
    (l.map (Rat.cast : ℚ → ℝ)).getD n 0 = (l.getD n 0 : ℝ) := by
  induction l generalizing n with
  | nil => simp
  | cons a l ih =>
    cases n with
    | zero => simp
    | succ n =>
      rw [List.map_cons, List.getD_cons_succ, List.getD_cons_succ]
      exact ih n

lemma memB_ofListQ (l : List ℚ) (N : ℕ) : memB N (ofListQ l) (l.map ofRatI) := by
  intro n _
  rw [coeff_ofListQ, getD_map_ofRatI]
  exact mem_ofRatI _

lemma getD_map_abs_nonneg (l : List ℚ) (n : ℕ) : 0 ≤ (l.map fun q => |q|).getD n 0 := by
  induction l generalizing n with
  | nil => simp
  | cons a l ih =>
    cases n with
    | zero => simp
    | succ n => simp only [List.map_cons, List.getD_cons_succ]; exact ih n

lemma memLoB_ofListQ_abs (l : List ℚ) (N : ℕ) :
    memLoB N (ofListQ (l.map fun q => |q|)) ((l.map fun q => |q|).map ofRatLo) := by
  intro n _
  rw [coeff_ofListQ, getD_map_ofRatLo]
  exact ⟨ofRatLo_nonneg (getD_map_abs_nonneg l n), ofRatLo_le _⟩

/-! ### The Haagerup coefficient lists -/

lemma hRatFrom_length (j : ℕ) (q : ℚ) : ∀ n, (hRatFrom j q n).length = n := by
  intro n
  induction n generalizing j q with
  | zero => rfl
  | succ n ih => simp [hRatFrom, ih]

lemma hRatFrom_getD : ∀ (n j k : ℕ), k < n → (hRatFrom j (hRat j) n).getD k 0 = hRat (j + k) := by
  intro n
  induction n with
  | zero => intro j k hk; omega
  | succ n ih =>
    intro j k hk
    cases k with
    | zero => simp [hRatFrom]
    | succ k =>
      show (hRatFrom (j + 1) (hRat (j + 1)) n).getD k 0 = _
      rw [ih (j + 1) k (by omega)]
      congr 1; omega

/-! ### The branch columns -/

end Grothe.Upper
