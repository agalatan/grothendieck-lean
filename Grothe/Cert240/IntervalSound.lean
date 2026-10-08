import Mathlib
import GrotheKernel.Basic

/-!
# Soundness of the fixed-point interval kernel

`mem x I` means `I.lo ≤ x·D ≤ I.hi`, i.e. `x ∈ [I.lo/D, I.hi/D]`.  Every kernel operation is
shown to preserve membership; interval lists represent real polynomials coefficient-wise
(`memB N p L`: coefficients of index `< N`).
-/

namespace Grothe.Cert240

open GrotheKernel Polynomial

lemma D_eq : (D : ℝ) = 2 ^ 128 := by unfold D K; norm_num

lemma D_pos : (0 : ℝ) < (D : ℝ) := by rw [D_eq]; positivity

lemma D_pos_int : (0 : ℤ) < D := by unfold D K; positivity

lemma D_ne_zero_int : (D : ℤ) ≠ 0 := D_pos_int.ne'

/-- `x ∈ [I.lo/D, I.hi/D]`. -/
def mem (x : ℝ) (I : Ival) : Prop := (I.lo : ℝ) ≤ x * D ∧ x * D ≤ I.hi

lemma mem_zeroI_iff (x : ℝ) : mem x zeroI ↔ x = 0 := by
  unfold mem zeroI
  simp only [Int.cast_zero]
  constructor
  · rintro ⟨h1, h2⟩
    have : x * D = 0 := le_antisymm h2 h1
    rcases mul_eq_zero.1 this with h | h
    · exact h
    · exact absurd h D_pos.ne'
  · rintro rfl; simp

lemma mem_zero : mem 0 zeroI := (mem_zeroI_iff 0).2 rfl

lemma mem_add {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x + y) (addI a b) := by
  unfold mem addI at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2, hy.1, hy.2]

lemma mem_neg {x : ℝ} {a : Ival} (hx : mem x a) : mem (-x) (negI a) := by
  unfold mem negI at *
  push_cast
  constructor <;> nlinarith [hx.1, hx.2]

lemma shDown_mul_le (m : ℤ) : (shDown m : ℝ) * D ≤ m := by
  unfold shDown
  have := Int.ediv_mul_le m D_ne_zero_int
  exact_mod_cast this

lemma le_shUp_mul (m : ℤ) : (m : ℝ) ≤ (shUp m : ℝ) * D := by
  unfold shUp
  have := Int.ediv_mul_le (-m) D_ne_zero_int
  have h : (-((-m) / D) : ℤ) * D ≥ m := by linarith
  exact_mod_cast h

lemma mul_bounds {x y a b c d : ℝ} (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y ∧
      x * y ≤ max (max (a * c) (a * d)) (max (b * c) (b * d)) := by
  have h1 : min (a * y) (b * y) ≤ x * y := by
    rcases le_total 0 y with hy0 | hy0
    · exact (min_le_left _ _).trans (mul_le_mul_of_nonneg_right hx.1 hy0)
    · exact (min_le_right _ _).trans (mul_le_mul_of_nonpos_right hx.2 hy0)
  have h1' : x * y ≤ max (a * y) (b * y) := by
    rcases le_total 0 y with hy0 | hy0
    · exact (mul_le_mul_of_nonneg_right hx.2 hy0).trans (le_max_right _ _)
    · exact (mul_le_mul_of_nonpos_right hx.1 hy0).trans (le_max_left _ _)
  have h2 : ∀ e : ℝ, min (e * c) (e * d) ≤ e * y ∧ e * y ≤ max (e * c) (e * d) := by
    intro e
    rcases le_total 0 e with he | he
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hy.1 he),
        (mul_le_mul_of_nonneg_left hy.2 he).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hy.2 he),
        (mul_le_mul_of_nonpos_left hy.1 he).trans (le_max_left _ _)⟩
  exact ⟨(min_le_min (h2 a).1 (h2 b).1).trans h1, h1'.trans (max_le_max (h2 a).2 (h2 b).2)⟩

lemma mem_mul {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x * y) (mulI a b) := by
  unfold mem at *
  unfold mulI
  simp only
  have hb := mul_bounds hx hy
  set m : ℤ := min (min (a.lo * b.lo) (a.lo * b.hi)) (min (a.hi * b.lo) (a.hi * b.hi)) with hm
  set M : ℤ := max (max (a.lo * b.lo) (a.lo * b.hi)) (max (a.hi * b.lo) (a.hi * b.hi)) with hM
  have hmc : (m : ℝ) = min (min ((a.lo : ℝ) * b.lo) (a.lo * b.hi)) (min (a.hi * b.lo) (a.hi * b.hi)) := by
    rw [hm]; push_cast; rfl
  have hMc : (M : ℝ) = max (max ((a.lo : ℝ) * b.lo) (a.lo * b.hi)) (max (a.hi * b.lo) (a.hi * b.hi)) := by
    rw [hM]; push_cast; rfl
  have hD := D_pos
  constructor
  · have h1 := shDown_mul_le m
    rw [hmc] at h1
    have h2 : (shDown m : ℝ) * D ≤ (x * D) * (y * D) := h1.trans hb.1
    have h3 : (x * D) * (y * D) = (x * y * D) * D := by ring
    rw [h3] at h2
    exact le_of_mul_le_mul_right h2 hD
  · have h1 := le_shUp_mul M
    rw [hMc] at h1
    have h2 : (x * D) * (y * D) ≤ (shUp M : ℝ) * D := hb.2.trans h1
    have h3 : (x * D) * (y * D) = (x * y * D) * D := by ring
    rw [h3] at h2
    exact le_of_mul_le_mul_right h2 hD

lemma abs_le_absUpper {x : ℝ} {a : Ival} (hx : mem x a) : |x| * D ≤ absUpper a := by
  unfold mem at hx
  unfold absUpper
  push_cast
  have hD := D_pos
  rcases le_total 0 x with h0 | h0
  · rw [abs_of_nonneg h0]
    exact hx.2.trans ((le_max_right _ _).trans (le_max_left _ _))
  · rw [abs_of_nonpos h0]
    have : -x * D ≤ -(a.lo : ℝ) := by linarith [hx.1]
    exact this.trans ((le_max_left _ _).trans (le_max_left _ _))

lemma absUpper_nonneg (a : Ival) : (0 : ℤ) ≤ absUpper a := le_max_right _ _

/-! ### Rationals -/

lemma ofRatLo_le (q : ℚ) : (ofRatLo q : ℝ) ≤ (q : ℝ) * D := by
  unfold ofRatLo
  have h : ((Rat.floor (q * (D : ℚ)) : ℤ) : ℚ) ≤ q * (D : ℚ) := Rat.le_floor_iff.1 le_rfl
  have h' : ((Rat.floor (q * (D : ℚ)) : ℤ) : ℝ) ≤ ((q * (D : ℚ) : ℚ) : ℝ) := by exact_mod_cast h
  push_cast at h'
  exact h'

lemma le_ofRatHi (q : ℚ) : (q : ℝ) * D ≤ (ofRatHi q : ℝ) := by
  unfold ofRatHi
  have h : ((Rat.floor (-(q * (D : ℚ))) : ℤ) : ℚ) ≤ -(q * (D : ℚ)) := Rat.le_floor_iff.1 le_rfl
  have h' : ((Rat.floor (-(q * (D : ℚ))) : ℤ) : ℝ) ≤ ((-(q * (D : ℚ)) : ℚ) : ℝ) := by exact_mod_cast h
  push_cast at h' ⊢
  linarith

lemma mem_ofRatI (q : ℚ) : mem (q : ℝ) (ofRatI q) := ⟨ofRatLo_le q, le_ofRatHi q⟩

lemma mem_boxI {x : ℝ} {lo hi : ℚ} (h1 : (lo : ℝ) ≤ x) (h2 : x ≤ hi) : mem x (boxI lo hi) := by
  refine ⟨(ofRatLo_le lo).trans ?_, le_trans ?_ (le_ofRatHi hi)⟩
  · exact mul_le_mul_of_nonneg_right h1 D_pos.le
  · exact mul_le_mul_of_nonneg_right h2 D_pos.le

lemma ofRatI_zero : ofRatI 0 = zeroI := by
  simp [ofRatI, ofRatLo, ofRatHi, zeroI, Rat.floor]

/-! ### Interval lists as polynomials -/

/-- `L` encloses the coefficients of `p` of index `< N`. -/
def memB (N : ℕ) (p : ℝ[X]) (L : List Ival) : Prop :=
  ∀ n, n < N → mem (p.coeff n) (L.getD n zeroI)

lemma memB_mono {N M : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) (hM : M ≤ N) :
    memB M p L := fun n hn => h n (lt_of_lt_of_le hn hM)

lemma memB_zero (N : ℕ) : memB N 0 [] := by
  intro n _
  simp only [coeff_zero, List.getD_nil]
  exact mem_zero

lemma addI_zeroI (a : Ival) : addI a zeroI = a := by cases a; simp [addI, zeroI]
lemma zeroI_addI (a : Ival) : addI zeroI a = a := by cases a; simp [addI, zeroI]

lemma mulI_zeroI (a : Ival) : mulI a zeroI = zeroI := by
  simp [mulI, zeroI, shDown, shUp]

lemma getD_addL (l m : List Ival) (n : ℕ) :
    (addL l m).getD n zeroI = addI (l.getD n zeroI) (m.getD n zeroI) := by
  induction l generalizing m n with
  | nil => simp [addL, zeroI_addI]
  | cons a l ih =>
    cases m with
    | nil => simp [addL, addI_zeroI]
    | cons b m =>
      cases n with
      | zero => simp [addL]
      | succ n =>
        show (addI a b :: addL l m).getD (n + 1) zeroI
          = addI ((a :: l).getD (n + 1) zeroI) ((b :: m).getD (n + 1) zeroI)
        rw [List.getD_cons_succ, List.getD_cons_succ, List.getD_cons_succ]
        exact ih m n

lemma getD_map_mulI (a : Ival) (m : List Ival) (n : ℕ) :
    (m.map (mulI a)).getD n zeroI = mulI a (m.getD n zeroI) := by
  induction m generalizing n with
  | nil => simp [mulI_zeroI]
  | cons b m ih =>
    cases n with
    | zero => simp
    | succ n =>
      rw [List.map_cons, List.getD_cons_succ, List.getD_cons_succ]
      exact ih n

lemma getD_take {α : Type*} (l : List α) (N n : ℕ) (z : α) (hn : n < N) :
    (l.take N).getD n z = l.getD n z := by
  induction l generalizing N n with
  | nil => simp
  | cons a l ih =>
    cases N with
    | zero => omega
    | succ N =>
      cases n with
      | zero => simp
      | succ n =>
        rw [List.take_succ_cons, List.getD_cons_succ, List.getD_cons_succ]
        exact ih N n (by omega)

lemma memB_add {N : ℕ} {p q : ℝ[X]} {L M : List Ival} (hp : memB N p L) (hq : memB N q M) :
    memB N (p + q) (addL L M) := by
  intro n hn
  rw [getD_addL, coeff_add]
  exact mem_add (hp n hn) (hq n hn)

lemma memB_C_mul {N : ℕ} {a : ℝ} {I : Ival} {q : ℝ[X]} {M : List Ival}
    (ha : mem a I) (hq : memB N q M) : memB N (C a * q) (M.map (mulI I)) := by
  intro n hn
  rw [getD_map_mulI, coeff_C_mul]
  exact mem_mul ha (hq n hn)

lemma memB_X_mul {N : ℕ} {r : ℝ[X]} {R : List Ival} (hr : memB N r R) :
    memB (N + 1) (X * r) (zeroI :: R) := by
  intro n hn
  cases n with
  | zero => simp only [coeff_X_mul_zero, List.getD_cons_zero]; exact mem_zero
  | succ n =>
    rw [coeff_X_mul, List.getD_cons_succ]
    exact hr n (by omega)

lemma memB_take {N : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) : memB N p (L.take N) := by
  intro n hn
  rw [getD_take _ _ _ _ hn]
  exact h n hn

lemma memB_nil_coeff {N : ℕ} {p : ℝ[X]} (h : memB N p []) {n : ℕ} (hn : n < N) : p.coeff n = 0 := by
  have := h n hn
  simpa [mem_zeroI_iff] using this

lemma memB_conv {L : List Ival} : ∀ {N : ℕ} {p q : ℝ[X]} {M : List Ival},
    memB N p L → memB N q M → memB N (p * q) (convI L M) := by
  induction L with
  | nil =>
    intro N p q M hp _ n hn
    simp only [convI, List.getD_nil]
    rw [mem_zeroI_iff, coeff_mul]
    apply Finset.sum_eq_zero
    intro ij hij
    have hij' : ij.1 + ij.2 = n := by simpa using hij
    have : ij.1 < N := by omega
    rw [memB_nil_coeff hp this, zero_mul]
  | cons a L ih =>
    intro N p q M hp hq
    cases N with
    | zero => intro n hn; omega
    | succ N =>
      have h0 : mem (p.coeff 0) a := by simpa using hp 0 (Nat.succ_pos N)
      have hdiv : memB N (divX p) L := by
        intro n hn
        rw [coeff_divX]
        simpa using hp (n + 1) (by omega)
      have hq' : memB N q M := memB_mono hq (Nat.le_succ N)
      have hmul := ih hdiv hq'
      have hXm := memB_X_mul hmul
      have hCm := memB_C_mul h0 hq
      have hsum := memB_add hCm hXm
      have hpq : p * q = C (p.coeff 0) * q + X * (divX p * q) := by
        conv_lhs => rw [← X_mul_divX_add p]
        ring
      rw [hpq]
      simpa [convI] using hsum

/-- Real Horner polynomial `c₀ + G·(c₁ + G·(…))`. -/
noncomputable def hornerPoly : List ℝ → ℝ[X] → ℝ[X]
  | [], _ => 0
  | a :: rest, G => C a + G * hornerPoly rest G

lemma memB_single {N : ℕ} {a : ℝ} {I : Ival} (ha : mem a I) : memB N (C a) [I] := by
  intro n _
  cases n with
  | zero => simpa using ha
  | succ n => simp only [coeff_C_succ, List.getD_cons_succ, List.getD_nil]; exact mem_zero

lemma memB_hornerT {N : ℕ} {G : ℝ[X]} {GI : List Ival} (hG : memB N G GI) :
    ∀ {cs : List ℝ} {csI : List Ival}, List.Forall₂ mem cs csI →
      memB N (hornerPoly cs G) (hornerT N GI csI) := by
  intro cs csI h
  induction h with
  | nil => simpa [hornerPoly, hornerT] using memB_zero N
  | cons ha _ ih =>
    simp only [hornerPoly, hornerT]
    exact memB_add (memB_single ha) (memB_take (memB_conv hG ih))

/-! ### Extracting the final inequality -/

lemma headLo_le {N : ℕ} {p : ℝ[X]} {L : List Ival} (hN : 0 < N) (h : memB N p L) :
    (headLo L : ℝ) ≤ p.coeff 0 * D := (h 0 hN).1

lemma foldl_add_eq (f : Ival → ℤ) (l : List Ival) (s : ℤ) :
    l.foldl (fun s a => s + f a) s = s + (l.map f).sum := by
  induction l generalizing s with
  | nil => simp
  | cons a l ih => simp [List.foldl_cons, ih, add_assoc]

lemma sum_range_getD_le (f : Ival → ℤ) (hf : ∀ a, 0 ≤ f a) (hz : f zeroI = 0) (l : List Ival) :
    ∀ N : ℕ, ∑ k ∈ Finset.range N, f (l.getD k zeroI) ≤ (l.map f).sum := by
  induction l with
  | nil => intro N; simp [hz]
  | cons a l ih =>
    intro N
    cases N with
    | zero =>
      simp only [Finset.range_zero, Finset.sum_empty, List.map_cons, List.sum_cons]
      have := List.sum_nonneg (l := l.map f) (fun x hx => by
        obtain ⟨y, _, rfl⟩ := List.mem_map.1 hx
        exact hf y)
      linarith [hf a]
    | succ N =>
      rw [Finset.sum_range_succ']
      simp only [List.getD_cons_succ, List.getD_cons_zero, List.map_cons, List.sum_cons]
      linarith [ih N]

lemma absUpper_zeroI : absUpper zeroI = 0 := by simp [absUpper, zeroI]

lemma tail_abs_sum_le {N M : ℕ} {p : ℝ[X]} {L : List Ival} (hMN : M < N) (h : memB N p L) :
    (∑ n ∈ Finset.Icc 1 M, |p.coeff n|) * D ≤ (tailAbsSum L : ℝ) := by
  have h1 : ∀ n ∈ Finset.Icc 1 M, |p.coeff n| * D ≤ (absUpper (L.getD n zeroI) : ℝ) := by
    intro n hn
    rw [Finset.mem_Icc] at hn
    exact abs_le_absUpper (h n (by omega))
  have h2 : (∑ n ∈ Finset.Icc 1 M, |p.coeff n|) * D
      ≤ ∑ n ∈ Finset.Icc 1 M, (absUpper (L.getD n zeroI) : ℝ) := by
    rw [Finset.sum_mul]
    exact Finset.sum_le_sum h1
  refine h2.trans ?_
  have h3 : ∑ n ∈ Finset.Icc 1 M, absUpper (L.getD n zeroI)
      = ∑ k ∈ Finset.range M, absUpper ((L.drop 1).getD k zeroI) := by
    have e : Finset.Icc 1 M = Finset.Ico 1 (M + 1) := by
      ext n; simp [Finset.mem_Icc, Finset.mem_Ico]
    rw [e, Finset.sum_Ico_eq_sum_range]
    refine Finset.sum_congr (by simp) fun k _ => ?_
    rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_drop, add_comm]
  have h4 := sum_range_getD_le absUpper absUpper_nonneg absUpper_zeroI (L.drop 1) M
  have h5 : tailAbsSum L = ((L.drop 1).map absUpper).sum := by
    unfold tailAbsSum; rw [foldl_add_eq]; simp
  rw [h5]
  have : (∑ n ∈ Finset.Icc 1 M, absUpper (L.getD n zeroI) : ℤ) ≤ ((L.drop 1).map absUpper).sum := by
    rw [h3]; exact h4
  exact_mod_cast this

/-- The kernel's `dloInt` certifies `P₀ − Σ_{n=1}^{M} |Pₙ|` for `P = E · hornerPoly cs (G)`. -/
theorem dloInt_sound {N M : ℕ} (hMN : M < N) {E G : ℝ[X]} {EI GI : List Ival}
    (hE : memB N E EI) (hG : memB N G GI) {cs : List ℝ} {csI : List Ival}
    (hcs : List.Forall₂ mem cs csI) :
    (dloInt N EI GI csI : ℝ) / D ≤
      (E * hornerPoly cs G).coeff 0 - ∑ n ∈ Finset.Icc 1 M, |(E * hornerPoly cs G).coeff n| := by
  have hS := memB_hornerT hG hcs
  have hP := memB_conv hE hS
  have h1 := headLo_le (by omega) hP
  have h2 := tail_abs_sum_le hMN hP
  have hD := D_pos
  rw [div_le_iff₀ hD]
  unfold dloInt
  simp only
  push_cast
  linarith

end Grothe.Cert240
