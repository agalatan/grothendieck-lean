import Mathlib
import GrotheKernel.Basic

/-!
# Soundness of the fixed-point interval kernel

`mem x I` means `I.lo ≤ x·D ≤ I.hi`, i.e. `x ∈ [I.lo/D, I.hi/D]`.  Every kernel operation is
shown to preserve membership; interval lists represent real polynomials coefficient-wise
(`memB N p L`: coefficients of index `< N`).
-/

namespace Grothe.Upper

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
/-! ### Interval lists as coefficient sequences -/

/-- `L` encloses the terms of `f` of index `< N`. -/
def memS (N : ℕ) (f : ℕ → ℝ) (L : List Ival) : Prop :=
  ∀ n, n < N → mem (f n) (L.getD n zeroI)

/-- `L` encloses the coefficients of `p` of index `< N`. -/
abbrev memB (N : ℕ) (p : ℝ[X]) (L : List Ival) : Prop := memS N p.coeff L

lemma memS_mono {N M : ℕ} {f : ℕ → ℝ} {L : List Ival} (h : memS N f L) (hM : M ≤ N) :
    memS M f L := fun n hn => h n (lt_of_lt_of_le hn hM)

lemma memB_mono {N M : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) (hM : M ≤ N) :
    memB M p L := memS_mono h hM

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

lemma memS_add {N : ℕ} {f g : ℕ → ℝ} {L M : List Ival} (hf : memS N f L) (hg : memS N g M) :
    memS N (fun n => f n + g n) (addL L M) := by
  intro n hn
  rw [getD_addL]
  exact mem_add (hf n hn) (hg n hn)

lemma memB_add {N : ℕ} {p q : ℝ[X]} {L M : List Ival} (hp : memB N p L) (hq : memB N q M) :
    memB N (p + q) (addL L M) := by
  intro n hn
  rw [getD_addL, coeff_add]
  exact mem_add (hp n hn) (hq n hn)

lemma memS_map_mulI {N : ℕ} {a : ℝ} {I : Ival} {f : ℕ → ℝ} {M : List Ival}
    (ha : mem a I) (hf : memS N f M) : memS N (fun n => a * f n) (M.map (mulI I)) := by
  intro n hn
  rw [getD_map_mulI]
  exact mem_mul ha (hf n hn)

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

lemma memS_take {N : ℕ} {f : ℕ → ℝ} {L : List Ival} (h : memS N f L) : memS N f (L.take N) := by
  intro n hn
  rw [getD_take _ _ _ _ hn]
  exact h n hn

lemma memB_take {N : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) : memB N p (L.take N) :=
  memS_take h

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
      have hXm := memB_X_mul (ih hdiv hq')
      have hpq : p * q = C (p.coeff 0) * q + X * (divX p * q) := by
        conv_lhs => rw [← X_mul_divX_add p]
        ring
      simp only [convI]
      split_ifs with hz
      · -- the entry is the zero interval: the constant coefficient vanishes
        have ha : a = zeroI := by
          obtain ⟨lo, hi⟩ := a
          simp only [Bool.and_eq_true, beq_iff_eq] at hz
          obtain ⟨h1, h2⟩ := hz
          simp only [zeroI, Ival.mk.injEq]
          exact ⟨h1, h2⟩
        rw [ha, mem_zeroI_iff] at h0
        rw [hpq, h0, map_zero, zero_mul, zero_add]
        exact hXm
      · rw [hpq]
        exact memB_add (memB_C_mul h0 hq) hXm

/-- Real Horner polynomial `c₀ + G·(c₁ + G·(…))`. -/
noncomputable def hornerPoly : List ℝ → ℝ[X] → ℝ[X]
  | [], _ => 0
  | a :: rest, G => C a + G * hornerPoly rest G

lemma memB_single {N : ℕ} {a : ℝ} {I : Ival} (ha : mem a I) : memB N (C a) [I] := by
  intro n _
  cases n with
  | zero => simpa using ha
  | succ n => simp only [coeff_C_succ, List.getD_cons_succ, List.getD_nil]; exact mem_zero

/-- Soundness of the truncated Horner evaluation `hornerX`: with `G'` enclosing `Gp` (at every
length), `hornerX G' N cs` encloses `c₀ + X·Gp·(c₁ + X·Gp·(…))` to length `N`. -/
lemma memB_hornerX {Gp : ℝ[X]} {G' : List Ival} (hG : ∀ N, memB N Gp G') :
    ∀ {N : ℕ} {cs : List ℝ} {csI : List Ival}, List.Forall₂ mem cs csI →
      memB N (hornerPoly cs (X * Gp)) (hornerX G' N csI) := by
  intro N
  induction N with
  | zero => intro cs csI _ n hn; omega
  | succ N ih =>
    intro cs csI h
    cases h with
    | nil => simpa [hornerPoly, hornerX] using memB_zero (N + 1)
    | @cons c cI cs csI hc hcs =>
      simp only [hornerPoly, hornerX]
      have hV := memB_take (memB_conv (hG N) (ih hcs))
      have hX := memB_X_mul hV
      have := memB_add (memB_single hc) hX
      rw [mul_assoc]
      simpa [addL, addI_zeroI] using this

/-- Soundness of `composeI`: the first `N` coefficients of `P · hornerPoly cs (X P²)`. -/
lemma memB_composeI {P : ℝ[X]} {PI : List Ival} (hP : ∀ N, memB N P PI) {N : ℕ}
    {cs : List ℝ} {csI : List Ival} (hcs : List.Forall₂ mem cs csI) :
    memB N (P * hornerPoly cs (X * P ^ 2)) (composeI N PI csI) := by
  have hG : ∀ N, memB N (P ^ 2) (convI PI PI) := fun N => by
    rw [pow_two]; exact memB_conv (hP N) (hP N)
  exact memB_take (memB_conv (hP N) (memB_hornerX hG hcs))

/-! ### Extracting the inequalities -/

lemma headLo_le {N : ℕ} {f : ℕ → ℝ} {L : List Ival} (hN : 0 < N) (h : memS N f L) :
    (headLo L : ℝ) ≤ f 0 * D := (h 0 hN).1

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

/-- `absSumFrom k L` bounds `D · Σ_{k ≤ n < N} |f n|` for every `N` with `memS N f L`. -/
lemma absSumFrom_le {k N : ℕ} {f : ℕ → ℝ} {L : List Ival} (h : memS N f L) :
    (∑ n ∈ Finset.Ico k N, |f n|) * D ≤ (absSumFrom k L : ℝ) := by
  have h1 : ∀ n ∈ Finset.Ico k N, |f n| * D ≤ (absUpper (L.getD n zeroI) : ℝ) := by
    intro n hn
    rw [Finset.mem_Ico] at hn
    exact abs_le_absUpper (h n hn.2)
  have h2 : (∑ n ∈ Finset.Ico k N, |f n|) * D
      ≤ ∑ n ∈ Finset.Ico k N, (absUpper (L.getD n zeroI) : ℝ) := by
    rw [Finset.sum_mul]
    exact Finset.sum_le_sum h1
  refine h2.trans ?_
  have h3 : ∑ n ∈ Finset.Ico k N, absUpper (L.getD n zeroI)
      = ∑ j ∈ Finset.range (N - k), absUpper ((L.drop k).getD j zeroI) := by
    rw [Finset.sum_Ico_eq_sum_range]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_drop]
  have h4 := sum_range_getD_le absUpper absUpper_nonneg absUpper_zeroI (L.drop k) (N - k)
  have h5 : absSumFrom k L = ((L.drop k).map absUpper).sum := by
    unfold absSumFrom; rw [foldl_add_eq]; simp
  rw [h5]
  have : (∑ n ∈ Finset.Ico k N, absUpper (L.getD n zeroI) : ℤ) ≤ ((L.drop k).map absUpper).sum := by
    rw [h3]; exact h4
  exact_mod_cast this

/-! ### Weighted mixtures -/

/-- Soundness of `mixL`: it encloses `Σᵢ wᵢ · fᵢ`. -/
lemma memS_mixL {N : ℕ} : ∀ {m : ℕ} {w : Fin m → ℝ} {wI : Fin m → Ival}
    (_ : ∀ i, mem (w i) (wI i)) {f : Fin m → ℕ → ℝ} {fI : Fin m → List Ival}
    (_ : ∀ i, memS N (f i) (fI i)),
    memS N (fun n => ∑ i, w i * f i n) (mixL (List.ofFn wI) (List.ofFn fI)) := by
  intro m
  induction m with
  | zero =>
    intro w wI _ f fI _ n _
    simp only [List.ofFn_zero, mixL, Finset.univ_eq_empty, Finset.sum_empty, List.getD_nil]
    exact mem_zero
  | succ m ih =>
    intro w wI hw f fI hf
    rw [List.ofFn_succ, List.ofFn_succ]
    simp only [mixL, Fin.sum_univ_succ]
    exact memS_add (memS_map_mulI (hw 0) (hf 0))
      (ih (fun i => hw i.succ) (fun i => hf i.succ))

/-- Soundness of `wTailUp`: `w · t ≤ wTailUp wI tI / D` when `w ∈ wI`, `0 < w`, `0 ≤ t` and
`t · D ≤ tI`. -/
lemma wTailUp_le {w t : ℝ} {wI : Ival} {tI : ℤ} (hw : mem w wI) (hw0 : 0 < w) (ht0 : 0 ≤ tI)
    (ht : t * D ≤ tI) : w * t * D ≤ (wTailUp wI tI : ℝ) := by
  unfold wTailUp
  have hD := D_pos
  have h1 := le_shUp_mul (wI.hi * tI)
  push_cast at h1
  have h2 : w * D ≤ wI.hi := hw.2
  have ht0' : (0 : ℝ) ≤ tI := by exact_mod_cast ht0
  have hwD : 0 < w * D := mul_pos hw0 hD
  have hhi : (0 : ℝ) ≤ wI.hi := by linarith
  have h3 : (w * D) * (t * D) ≤ (wI.hi : ℝ) * tI := by
    rcases le_or_gt 0 t with ht' | ht'
    · exact mul_le_mul h2 ht (by positivity) hhi
    · have h5 : t * D ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ht'.le hD.le
      have h6 : (w * D) * (t * D) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hwD.le h5
      have h7 : (0 : ℝ) ≤ (wI.hi : ℝ) * tI := mul_nonneg hhi ht0'
      linarith
  have h4 : w * t * D * D ≤ (shUp (wI.hi * tI) : ℝ) * D := by nlinarith
  exact le_of_mul_le_mul_right h4 hD

/-! ### Lower-only arithmetic -/

/-- `L` holds nonnegative lower bounds of the terms of `f` of index `< N`. -/
def memLo (N : ℕ) (f : ℕ → ℝ) (L : List ℤ) : Prop :=
  ∀ n, n < N → 0 ≤ L.getD n 0 ∧ (L.getD n 0 : ℝ) ≤ f n * D

/-- `L` holds nonnegative lower bounds of the coefficients of `p` of index `< N`. -/
abbrev memLoB (N : ℕ) (p : ℝ[X]) (L : List ℤ) : Prop := memLo N p.coeff L

lemma memLo_mono {N M : ℕ} {f : ℕ → ℝ} {L : List ℤ} (h : memLo N f L) (hM : M ≤ N) :
    memLo M f L := fun n hn => h n (lt_of_lt_of_le hn hM)

lemma memLo_nonneg {N : ℕ} {f : ℕ → ℝ} {L : List ℤ} (h : memLo N f L) {n : ℕ} (hn : n < N) :
    0 ≤ f n := by
  have := h n hn
  have hD := D_pos
  have h1 : (0 : ℝ) ≤ L.getD n 0 := by exact_mod_cast this.1
  nlinarith [this.2]

lemma memLoB_zero (N : ℕ) : memLoB N 0 [] := by
  intro n _
  simp

lemma getD_addLo (l m : List ℤ) (n : ℕ) :
    (addLo l m).getD n 0 = l.getD n 0 + m.getD n 0 := by
  induction l generalizing m n with
  | nil => simp [addLo]
  | cons a l ih =>
    cases m with
    | nil => simp [addLo]
    | cons b m =>
      cases n with
      | zero => simp [addLo]
      | succ n =>
        show ((a + b) :: addLo l m).getD (n + 1) 0
          = (a :: l).getD (n + 1) 0 + (b :: m).getD (n + 1) 0
        rw [List.getD_cons_succ, List.getD_cons_succ, List.getD_cons_succ]
        exact ih m n

lemma mulLo_zero (a : ℤ) : mulLo a 0 = 0 := by simp [mulLo, shDown]

lemma getD_map_mulLo (a : ℤ) (m : List ℤ) (n : ℕ) :
    (m.map (mulLo a)).getD n 0 = mulLo a (m.getD n 0) := by
  induction m generalizing n with
  | nil => simp [mulLo_zero]
  | cons b m ih =>
    cases n with
    | zero => simp
    | succ n =>
      rw [List.map_cons, List.getD_cons_succ, List.getD_cons_succ]
      exact ih n

lemma getD_take_int (l : List ℤ) (N n : ℕ) (hn : n < N) : (l.take N).getD n 0 = l.getD n 0 :=
  getD_take l N n 0 hn

lemma shDown_nonneg {x : ℤ} (hx : 0 ≤ x) : 0 ≤ shDown x :=
  Int.ediv_nonneg hx D_pos_int.le

/-- Lower bound of a product of nonnegative scaled numbers. -/
lemma mulLo_le {x y : ℝ} {a b : ℤ} (ha : 0 ≤ a ∧ (a : ℝ) ≤ x * D) (hb : 0 ≤ b ∧ (b : ℝ) ≤ y * D) :
    0 ≤ mulLo a b ∧ (mulLo a b : ℝ) ≤ x * y * D := by
  refine ⟨shDown_nonneg (mul_nonneg ha.1 hb.1), ?_⟩
  unfold mulLo
  have hD := D_pos
  have h1 := shDown_mul_le (a * b)
  push_cast at h1
  have ha0 : (0 : ℝ) ≤ a := by exact_mod_cast ha.1
  have hb0 : (0 : ℝ) ≤ b := by exact_mod_cast hb.1
  have h2 : (a : ℝ) * b ≤ (x * D) * (y * D) := mul_le_mul ha.2 hb.2 hb0 (by linarith)
  have h3 : (shDown (a * b) : ℝ) * D ≤ (x * y * D) * D := by nlinarith
  exact le_of_mul_le_mul_right h3 hD

lemma memLo_add {N : ℕ} {f g : ℕ → ℝ} {L M : List ℤ} (hf : memLo N f L) (hg : memLo N g M) :
    memLo N (fun n => f n + g n) (addLo L M) := by
  intro n hn
  rw [getD_addLo]
  obtain ⟨h1, h2⟩ := hf n hn
  obtain ⟨h3, h4⟩ := hg n hn
  refine ⟨add_nonneg h1 h3, ?_⟩
  push_cast
  linarith

lemma memLoB_add {N : ℕ} {p q : ℝ[X]} {L M : List ℤ} (hp : memLoB N p L) (hq : memLoB N q M) :
    memLoB N (p + q) (addLo L M) := by
  have := memLo_add hp hq
  intro n hn
  simpa [coeff_add] using this n hn

lemma memLo_map_mulLo {N : ℕ} {a : ℝ} {aI : ℤ} {f : ℕ → ℝ} {M : List ℤ}
    (ha : 0 ≤ aI ∧ (aI : ℝ) ≤ a * D) (hf : memLo N f M) :
    memLo N (fun n => a * f n) (M.map (mulLo aI)) := by
  intro n hn
  rw [getD_map_mulLo]
  exact mulLo_le ha (hf n hn)

lemma memLoB_C_mul {N : ℕ} {a : ℝ} {aI : ℤ} {q : ℝ[X]} {M : List ℤ}
    (ha : 0 ≤ aI ∧ (aI : ℝ) ≤ a * D) (hq : memLoB N q M) :
    memLoB N (C a * q) (M.map (mulLo aI)) := by
  have := memLo_map_mulLo ha hq
  intro n hn
  simpa [coeff_C_mul] using this n hn

lemma memLoB_X_mul {N : ℕ} {r : ℝ[X]} {R : List ℤ} (hr : memLoB N r R) :
    memLoB (N + 1) (X * r) (0 :: R) := by
  intro n hn
  cases n with
  | zero => simp
  | succ n =>
    rw [coeff_X_mul, List.getD_cons_succ]
    exact hr n (by omega)

lemma memLo_take {N : ℕ} {f : ℕ → ℝ} {L : List ℤ} (h : memLo N f L) : memLo N f (L.take N) := by
  intro n hn
  rw [getD_take_int _ _ _ hn]
  exact h n hn

lemma memLoB_conv {L : List ℤ} : ∀ {N : ℕ} {p q : ℝ[X]} {M : List ℤ},
    memLoB N p L → memLoB N q M → memLoB N (p * q) (convLo L M) := by
  induction L with
  | nil =>
    intro N p q M hp hq n hn
    simp only [convLo, List.getD_nil, Int.cast_zero, le_refl, true_and]
    rw [coeff_mul]
    refine mul_nonneg (Finset.sum_nonneg fun ij hij => ?_) D_pos.le
    have hij' : ij.1 + ij.2 = n := by simpa using hij
    exact mul_nonneg (memLo_nonneg hp (by omega)) (memLo_nonneg hq (by omega))
  | cons a L ih =>
    intro N p q M hp hq
    cases N with
    | zero => intro n hn; omega
    | succ N =>
      have h0 : 0 ≤ a ∧ (a : ℝ) ≤ p.coeff 0 * D := by simpa using hp 0 (Nat.succ_pos N)
      have hdiv : memLoB N (divX p) L := by
        intro n hn
        rw [coeff_divX]
        simpa using hp (n + 1) (by omega)
      have hq' : memLoB N q M := memLo_mono hq (Nat.le_succ N)
      have hXm := memLoB_X_mul (ih hdiv hq')
      have hpq : p * q = C (p.coeff 0) * q + X * (divX p * q) := by
        conv_lhs => rw [← X_mul_divX_add p]
        ring
      simp only [convLo]
      split_ifs with hz
      · -- a zero lower bound: the (nonnegative) contribution of the constant term is dropped
        rw [hpq]
        intro n hn
        have hX := hXm n hn
        have hc : 0 ≤ (C (p.coeff 0) * q).coeff n := by
          rw [coeff_C_mul]
          have hp0 : 0 ≤ p.coeff 0 := memLo_nonneg hp (Nat.succ_pos N)
          exact mul_nonneg hp0 (memLo_nonneg hq hn)
        refine ⟨hX.1, ?_⟩
        rw [coeff_add]
        have hD := D_pos
        nlinarith [hX.2]
      · rw [hpq]
        exact memLoB_add (memLoB_C_mul h0 hq) hXm

lemma memLoB_single {N : ℕ} {a : ℝ} {aI : ℤ} (ha : 0 ≤ aI ∧ (aI : ℝ) ≤ a * D) :
    memLoB N (C a) [aI] := by
  intro n _
  cases n with
  | zero => simpa using ha
  | succ n => simp

/-- Pairwise lower bounds of a real list. -/
def LowerOf (cs : List ℝ) (csI : List ℤ) : Prop :=
  List.Forall₂ (fun (c : ℝ) (cI : ℤ) => 0 ≤ cI ∧ (cI : ℝ) ≤ c * D) cs csI

lemma memLoB_hornerLo {Gp : ℝ[X]} {G' : List ℤ} (hG : ∀ N, memLoB N Gp G') :
    ∀ {N : ℕ} {cs : List ℝ} {csI : List ℤ}, LowerOf cs csI →
      memLoB N (hornerPoly cs (X * Gp)) (hornerLo G' N csI) := by
  intro N
  induction N with
  | zero => intro cs csI _ n hn; omega
  | succ N ih =>
    intro cs csI h
    cases h with
    | nil => simpa [hornerPoly, hornerLo] using memLoB_zero (N + 1)
    | @cons c cI cs csI hc hcs =>
      simp only [hornerPoly, hornerLo]
      have hV := memLo_take (memLoB_conv (hG N) (ih hcs))
      have hX := memLoB_X_mul hV
      have := memLoB_add (memLoB_single hc) hX
      rw [mul_assoc]
      simpa [addLo] using this

lemma memLoB_composeLo {P : ℝ[X]} {PI : List ℤ} (hP : ∀ N, memLoB N P PI) {N : ℕ}
    {cs : List ℝ} {csI : List ℤ} (hcs : LowerOf cs csI) :
    memLoB N (P * hornerPoly cs (X * P ^ 2)) (composeLo N PI csI) := by
  have hG : ∀ N, memLoB N (P ^ 2) (convLo PI PI) := fun N => by
    rw [pow_two]; exact memLoB_conv (hP N) (hP N)
  exact memLo_take (memLoB_conv (hP N) (memLoB_hornerLo hG hcs))

lemma getD_eq_zero_of_length_le {l : List ℤ} {n : ℕ} (h : l.length ≤ n) : l.getD n 0 = 0 := by
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_none h]
  rfl

/-- `L.sum ≤ D · Σ_{n<N} f n` when `L` holds lower bounds and has length at most `N`. -/
lemma sum_le_of_memLo : ∀ {L : List ℤ} {N : ℕ} {f : ℕ → ℝ}, memLo N f L → L.length ≤ N →
    (L.sum : ℝ) ≤ (∑ n ∈ Finset.range N, f n) * D := by
  intro L
  induction L with
  | nil =>
    intro N f h _
    simp only [List.sum_nil, Int.cast_zero]
    refine mul_nonneg (Finset.sum_nonneg fun n hn => ?_) D_pos.le
    exact memLo_nonneg h (Finset.mem_range.1 hn)
  | cons a L ih =>
    intro N f h hL
    cases N with
    | zero => simp at hL
    | succ N =>
      have h0 := (h 0 (Nat.succ_pos N)).2
      simp only [List.getD_cons_zero] at h0
      have hL' : memLo N (fun n => f (n + 1)) L := fun n hn => by
        simpa using h (n + 1) (by omega)
      have := ih hL' (by simpa using hL)
      rw [List.sum_cons, Finset.sum_range_succ', Int.cast_add, add_mul]
      linarith

end Grothe.Upper
