import Mathlib
import GrotheCapsKernel.Basic

/-!
# Soundness of the fixed-point interval kernel

`mem x I` means `I.lo ≤ x·D ≤ I.hi`, i.e. `x ∈ [I.lo/D, I.hi/D]`.  Every kernel operation is
shown to preserve membership; interval lists represent real polynomials coefficient-wise
(`memB N p L`: coefficients of index `< N`).
-/

namespace Grothe.Upper

open GrotheKernel Polynomial

lemma D_pos : (0 : ℝ) < (D : ℝ) := by unfold D K; positivity

lemma D_pos_int : (0 : ℤ) < D := by unfold D K; positivity

/-- `x ∈ [I.lo/D, I.hi/D]`. -/
def mem (x : ℝ) (I : Ival) : Prop := (I.lo : ℝ) ≤ x * D ∧ x * D ≤ I.hi

lemma mem_zeroI_iff (x : ℝ) : mem x zeroI ↔ x = 0 := by
  simp only [mem, zeroI, Int.cast_zero, ← le_antisymm_iff, eq_comm (a := (0 : ℝ)), mul_eq_zero,
    D_pos.ne', or_false]

lemma mem_zero : mem 0 zeroI := (mem_zeroI_iff 0).2 rfl

lemma mem_add {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x + y) (addI a b) := by
  unfold mem addI at *
  push_cast
  constructor <;> linarith [hx.1, hx.2, hy.1, hy.2]

lemma mem_neg {x : ℝ} {a : Ival} (hx : mem x a) : mem (-x) (negI a) := by
  unfold mem negI at *
  push_cast
  constructor <;> linarith [hx.1, hx.2]

lemma shDown_le {m : ℤ} {r : ℝ} (h : (m : ℝ) ≤ r * D) : (shDown m : ℝ) ≤ r := by
  have : ((m / D : ℤ) : ℝ) * D ≤ m := by exact_mod_cast Int.ediv_mul_le m D_pos_int.ne'
  exact le_of_mul_le_mul_right (this.trans h) D_pos

lemma le_shUp {m : ℤ} {r : ℝ} (h : r * D ≤ m) : r ≤ (shUp m : ℝ) := by
  have : (((-m) / D : ℤ) : ℝ) * D ≤ -(m : ℝ) := by
    exact_mod_cast Int.ediv_mul_le (-m) D_pos_int.ne'
  unfold shUp
  push_cast
  exact le_of_mul_le_mul_right (by linarith) D_pos

lemma mul_bounds {x y a b c d : ℝ} (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y ∧
      x * y ≤ max (max (a * c) (a * d)) (max (b * c) (b * d)) := by
  have h1 : min (a * y) (b * y) ≤ x * y ∧ x * y ≤ max (a * y) (b * y) := by
    rcases le_total 0 y with hy0 | hy0
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_right hx.1 hy0),
        (mul_le_mul_of_nonneg_right hx.2 hy0).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_right hx.2 hy0),
        (mul_le_mul_of_nonpos_right hx.1 hy0).trans (le_max_left _ _)⟩
  have h2 : ∀ e : ℝ, min (e * c) (e * d) ≤ e * y ∧ e * y ≤ max (e * c) (e * d) := by
    intro e
    rcases le_total 0 e with he | he
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hy.1 he),
        (mul_le_mul_of_nonneg_left hy.2 he).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hy.2 he),
        (mul_le_mul_of_nonpos_left hy.1 he).trans (le_max_left _ _)⟩
  exact ⟨(min_le_min (h2 a).1 (h2 b).1).trans h1.1, h1.2.trans (max_le_max (h2 a).2 (h2 b).2)⟩

lemma mem_mul {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x * y) (mulI a b) := by
  have hb := mul_bounds hx hy
  rw [show x * D * (y * D) = x * y * D * D by ring] at hb
  exact ⟨shDown_le (by push_cast; exact hb.1), le_shUp (by push_cast; exact hb.2)⟩

lemma abs_le_absUpper {x : ℝ} {a : Ival} (hx : mem x a) : |x| * D ≤ absUpper a := by
  have h : |x * D| ≤ max (-(a.lo : ℝ)) a.hi := abs_le.2
    ⟨by linarith [hx.1, le_max_left (-(a.lo : ℝ)) a.hi], hx.2.trans (le_max_right _ _)⟩
  rw [abs_mul, abs_of_pos D_pos] at h
  unfold absUpper
  push_cast
  exact h.trans (le_max_left _ _)

/-! ### Rationals -/

lemma ofRatLo_le (q : ℚ) : (ofRatLo q : ℝ) ≤ (q : ℝ) * D := by
  have h : ((ofRatLo q : ℤ) : ℚ) ≤ q * (D : ℚ) := Rat.le_floor_iff.1 le_rfl
  exact_mod_cast h

lemma le_ofRatHi (q : ℚ) : (q : ℝ) * D ≤ (ofRatHi q : ℝ) := by
  have h : ((Rat.floor (-(q * (D : ℚ))) : ℤ) : ℚ) ≤ -(q * (D : ℚ)) := Rat.le_floor_iff.1 le_rfl
  have h' : ((Rat.floor (-(q * (D : ℚ))) : ℤ) : ℝ) ≤ -((q : ℝ) * D) := by exact_mod_cast h
  unfold ofRatHi
  push_cast
  linarith

lemma mem_ofRatI (q : ℚ) : mem (q : ℝ) (ofRatI q) := ⟨ofRatLo_le q, le_ofRatHi q⟩

lemma ofRatI_zero : ofRatI 0 = zeroI := by simp [ofRatI, ofRatLo, ofRatHi, zeroI, Rat.floor]

/-! ### Interval lists as coefficient sequences -/

/-- `L` encloses the coefficients of `p` of index `< N`. -/
def memB (N : ℕ) (p : ℝ[X]) (L : List Ival) : Prop :=
  ∀ n, n < N → mem (p.coeff n) (L.getD n zeroI)

lemma memB_mono {N M : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) (hM : M ≤ N) :
    memB M p L := fun n hn => h n (lt_of_lt_of_le hn hM)

lemma memB_zero (N : ℕ) : memB N 0 [] := fun _ _ => by simpa using mem_zero

lemma getD_addL (l m : List Ival) (n : ℕ) :
    (addL l m).getD n zeroI = addI (l.getD n zeroI) (m.getD n zeroI) := by
  have z1 : ∀ a, addI zeroI a = a := fun ⟨_, _⟩ => by simp [addI, zeroI]
  have z2 : ∀ a, addI a zeroI = a := fun ⟨_, _⟩ => by simp [addI, zeroI]
  induction l generalizing m n with
  | nil => simp [addL, z1]
  | cons a l ih =>
    cases m with
    | nil => simp [addL, z2]
    | cons b m =>
      cases n with
      | zero => rfl
      | succ n => simp only [addL, List.getD_cons_succ]; exact ih m n

lemma memB_add {N : ℕ} {p q : ℝ[X]} {L M : List Ival} (hp : memB N p L) (hq : memB N q M) :
    memB N (p + q) (addL L M) := fun n hn => by
  rw [getD_addL, coeff_add]
  exact mem_add (hp n hn) (hq n hn)

lemma memB_C_mul {N : ℕ} {a : ℝ} {I : Ival} {q : ℝ[X]} {M : List Ival}
    (ha : mem a I) (hq : memB N q M) : memB N (C a * q) (M.map (mulI I)) := fun n hn => by
  have hz : mulI I zeroI = zeroI := by simp [mulI, zeroI, shDown, shUp]
  rw [← hz, List.getD_map, coeff_C_mul]
  exact mem_mul ha (hq n hn)

lemma memB_X_mul {N : ℕ} {r : ℝ[X]} {R : List Ival} (hr : memB N r R) :
    memB (N + 1) (X * r) (zeroI :: R) := fun n hn => by
  cases n with
  | zero => simpa using mem_zero
  | succ n => rw [coeff_X_mul, List.getD_cons_succ]; exact hr n (by omega)

lemma memB_take {N : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) : memB N p (L.take N) :=
  fun n hn => by
    rw [List.getD_eq_getElem?_getD, List.getElem?_take_of_lt hn, ← List.getD_eq_getElem?_getD]
    exact h n hn

lemma memB_conv {L : List Ival} : ∀ {N : ℕ} {p q : ℝ[X]} {M : List Ival},
    memB N p L → memB N q M → memB N (p * q) (convI L M) := by
  induction L with
  | nil =>
    intro N p q M hp _ n hn
    simp only [convI, List.getD_nil, mem_zeroI_iff, coeff_mul]
    refine Finset.sum_eq_zero fun ij hij => ?_
    have := (mem_zeroI_iff _).1 (by simpa using hp ij.1 (by simp at hij; omega))
    rw [this, zero_mul]
  | cons a L ih =>
    intro N p q M hp hq
    cases N with
    | zero => intro n hn; omega
    | succ N =>
      have h0 : mem (p.coeff 0) a := by simpa using hp 0 (Nat.succ_pos N)
      have hXm := memB_X_mul (ih (p := divX p) (fun n hn => by
        simpa [coeff_divX] using hp (n + 1) (by omega)) (memB_mono hq (Nat.le_succ N)))
      have hpq : p * q = C (p.coeff 0) * q + X * (divX p * q) := by
        conv_lhs => rw [← X_mul_divX_add p]
        ring
      rw [hpq]
      simp only [convI]
      split_ifs with hz
      · -- the entry is the zero interval: the constant coefficient vanishes
        obtain ⟨lo, hi⟩ := a
        simp only [Bool.and_eq_true, beq_iff_eq] at hz
        obtain ⟨rfl, rfl⟩ := hz
        rw [show (⟨0, 0⟩ : Ival) = zeroI from rfl, mem_zeroI_iff] at h0
        rw [h0, map_zero, zero_mul, zero_add]
        exact hXm
      · exact memB_add (memB_C_mul h0 hq) hXm

lemma memB_single {N : ℕ} {a : ℝ} {I : Ival} (ha : mem a I) : memB N (C a) [I] := by
  intro n _
  cases n with
  | zero => simpa using ha
  | succ n => simpa [coeff_C_succ] using mem_zero

/-! ### Extracting the inequalities -/

/-- `absSum L` bounds `D · Σ_{n < N} |pₙ|` for every `N` with `memB N p L`. -/
lemma absSum_le {N : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) :
    (∑ n ∈ Finset.range N, |p.coeff n|) * D ≤ (absSum L : ℝ) := by
  have h1 : (∑ n ∈ Finset.range N, |p.coeff n|) * D
      ≤ ∑ n ∈ Finset.range N, (absUpper (L.getD n zeroI) : ℝ) := by
    rw [Finset.sum_mul]
    exact Finset.sum_le_sum fun n hn => abs_le_absUpper (h n (Finset.mem_range.1 hn))
  refine h1.trans ?_
  have hz : absUpper zeroI = 0 := by simp [absUpper, zeroI]
  have key : ∀ (L : List Ival) (N : ℕ),
      ∑ n ∈ Finset.range N, absUpper (L.getD n zeroI) ≤ (L.map absUpper).sum := by
    intro L
    induction L with
    | nil => intro N; simp [hz]
    | cons a l ih =>
      intro N
      cases N with
      | zero =>
        simp only [Finset.range_zero, Finset.sum_empty, List.map_cons, List.sum_cons]
        exact add_nonneg (le_max_right _ _) (List.sum_nonneg fun x hx => by
          obtain ⟨y, _, rfl⟩ := List.mem_map.1 hx
          exact le_max_right _ _)
      | succ N =>
        rw [Finset.sum_range_succ']
        simpa [add_comm] using ih N
  exact_mod_cast key L N

end Grothe.Upper
