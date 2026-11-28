import Grothe.LowerAnalytic.CapGridT
import Grothe.LowerAnalytic.IntervalSound

/-!
# Interval lemmas of the cap checker (`GrotheCapsKernel`)

`TablesOK Nr N h T`: the shared tables enclose the one-dimensional integrals `radI`, `tailI`, `angC`, `angS` (the only
analytic input; closed by the table enclosures). The interval arithmetic of the kernel is sound (`mem_sumI`,
`mem_sqrt2I`, `mem_ofKQ`, `mem_polyI`, `mem_tailPolyI`, `mem_entryPolys_*`, `bounds_of_mem`); the enclosure of the
integrated matrix of the checker with a tail uses them (`CapCheckNuMat.lean`).
-/

open MeasureTheory Real Set Finset GrotheKernel Grothe.Interval
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### Generic interval sums -/

lemma list_sum_range {M : Type*} [AddCommMonoid M] (n : ℕ) (f : ℕ → M) :
    ((List.range n).map f).sum = ∑ i ∈ range n, f i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ, ih]; simp

lemma mem_foldl_sumI {α : Type*} (l : List α) (f : α → Ival) (x : α → ℝ) (h : ∀ i ∈ l, mem (x i) (f i)) :
    ∀ (acc : Ival) (a : ℝ), mem a acc →
      mem (a + (l.map x).sum) (l.foldl (fun acc i => addI acc (f i)) acc) := by
  induction l with
  | nil => intro acc a ha; simpa using ha
  | cons i l ih =>
    intro acc a ha
    simp only [List.foldl_cons, List.map_cons, List.sum_cons]
    rw [← add_assoc]
    exact ih (fun j hj => h j (List.mem_cons_of_mem _ hj)) _ _
      (mem_add ha (h i List.mem_cons_self))

lemma mem_foldl0 {α : Type*} (l : List α) (f : α → Ival) (x : α → ℝ) (h : ∀ i ∈ l, mem (x i) (f i)) :
    mem ((l.map x).sum) (l.foldl (fun acc i => addI acc (f i)) zeroI) := by
  have := mem_foldl_sumI l f x h zeroI 0 mem_zero
  rwa [zero_add] at this

lemma mem_sumI (l : List ℕ) (f : ℕ → Ival) (x : ℕ → ℝ) (h : ∀ i ∈ l, mem (x i) (f i)) :
    mem ((l.map x).sum) (sumI l f) := mem_foldl0 l f x h

lemma mem_sumI_range (n : ℕ) (f : ℕ → Ival) (x : ℕ → ℝ) (h : ∀ i < n, mem (x i) (f i)) :
    mem (∑ i ∈ range n, x i) (sumI (List.range n) f) := by
  rw [← list_sum_range]
  exact mem_sumI _ _ _ fun i hi => h i (List.mem_range.1 hi)

lemma mem_sqrt2I : mem √2 sqrt2I := by
  have hD : (0 : ℝ) < (D : ℝ) := D_pos
  have key : ((sqrt2lo : ℤ) : ℝ) ^ 2 ≤ 2 * (D : ℝ) ^ 2 ∧ 2 * (D : ℝ) ^ 2 ≤ ((sqrt2lo + 1 : ℤ) : ℝ) ^ 2 := by
    have h1 : (sqrt2lo : ℤ) ^ 2 ≤ 2 * D ^ 2 ∧ 2 * D ^ 2 ≤ (sqrt2lo + 1) ^ 2 := by
      unfold sqrt2lo D K; norm_num
    exact ⟨by exact_mod_cast h1.1, by exact_mod_cast h1.2⟩
  have hs : (0 : ℝ) ≤ √2 * D := by positivity
  have hsq : (√2 * (D : ℝ)) ^ 2 = 2 * (D : ℝ) ^ 2 := by
    rw [mul_pow, Real.sq_sqrt (by norm_num)]
  constructor
  · show ((sqrt2lo : ℤ) : ℝ) ≤ √2 * D
    by_contra hc
    have hc := not_le.1 hc
    nlinarith [key.1, hsq, hc, hs]
  · show √2 * D ≤ (((sqrt2lo + 1 : ℤ)) : ℝ)
    have hl : (0 : ℝ) ≤ ((sqrt2lo + 1 : ℤ) : ℝ) := by unfold sqrt2lo; norm_num
    by_contra hc
    have hc := not_le.1 hc
    nlinarith [key.2, hsq, hc, hl]

lemma mem_ofKQ (x : KQ) : mem x.val (ofKQ x) :=
  mem_add (mem_ofRatI x.p) (mem_mul (mem_ofRatI x.q) mem_sqrt2I)


/-! ### The tables -/

/-- **The table hypothesis**: the shared tables enclose the one-dimensional integrals. -/
def TablesOK (Nr N : ℕ) (h : ℚ) (T : Tables) : Prop :=
  (∀ i < Nr, ∀ m ≤ 16, mem (radI (i * h) ((i + 1) * h) m) (T.radAt i m)) ∧
  (∀ m ≤ 16, mem (tailI (Nr * h) m) (T.tailAt m)) ∧
  (∀ j < N, ∀ n : ℕ, n ≤ 12 →
    mem (angC (thN N j) (thN N (j + 1)) n) ((T.ang.getD j #[]).getD n (zeroI, zeroI)).1 ∧
    mem (angS (thN N j) (thN N (j + 1)) n) ((T.ang.getD j #[]).getD n (zeroI, zeroI)).2)

lemma angC_neg (a b : ℝ) (n : ℤ) : angC a b (-n) = angC a b n := by
  simp [angC, neg_mul, cos_neg]
lemma angS_neg (a b : ℝ) (n : ℤ) : angS a b (-n) = -angS a b n := by
  simp only [angS, Int.cast_neg, neg_mul, sin_neg, intervalIntegral.integral_neg]; ring

lemma angC_natAbs (a b : ℝ) (n : ℤ) : angC a b n = angC a b (n.natAbs : ℤ) := by
  rcases Int.natAbs_eq n with e | e
  · conv_lhs => rw [e]
  · conv_lhs => rw [e]
    rw [angC_neg]

lemma mem_angCAt {Nr N : ℕ} {h : ℚ} {T : Tables} (hT : TablesOK Nr N h T) {j : ℕ} (hj : j < N)
    {n : ℤ} (hn : n.natAbs ≤ 12) : mem (angC (thN N j) (thN N (j + 1)) n) (T.angCAt j n) := by
  unfold Tables.angCAt
  rw [angC_natAbs]
  exact_mod_cast (hT.2.2 j hj n.natAbs hn).1

lemma mem_angSAt {Nr N : ℕ} {h : ℚ} {T : Tables} (hT : TablesOK Nr N h T) {j : ℕ} (hj : j < N)
    {n : ℤ} (hn : n.natAbs ≤ 12) : mem (angS (thN N j) (thN N (j + 1)) n) (T.angSAt j n) := by
  have := (hT.2.2 j hj n.natAbs hn).2
  unfold Tables.angSAt
  split_ifs with hneg
  · have e : n = -(n.natAbs : ℤ) := by omega
    conv => arg 1; rw [e, angS_neg]
    exact mem_neg (by exact_mod_cast this)
  · have e : n = (n.natAbs : ℤ) := by omega
    conv => arg 1; rw [e]
    exact_mod_cast this

/-! ### The weights -/

lemma two50_eq : (two50 : ℝ) = 2 ^ 50 := by norm_num [two50]
lemma two100_eq : (two100 : ℝ) = 2 ^ 100 := by norm_num [two100, two50]
/-! ### The weighted moments -/

section wm

variable {gd : GridData} {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T)

end wm


/-! ### Polynomial functionals -/

lemma mem_polyI (fC fS : ℕ → ℤ → Ival) (xC xS : ℕ → ℤ → ℝ) (P : CP)
    (hC : ∀ t ∈ CP.polar P, mem (xC t.m t.n) (fC t.m t.n))
    (hS : ∀ t ∈ CP.polar P, mem (xS t.m t.n) (fS t.m t.n)) :
    mem (((CP.polar P).map fun t => t.cc.val * xC t.m t.n + t.cs.val * xS t.m t.n).sum)
      (polyI fC fS P) :=
  mem_foldl0 _ _ _ fun t ht => mem_add (mem_mul (mem_ofKQ _) (hC t ht)) (mem_mul (mem_ofKQ _) (hS t ht))

lemma mem_tailPolyI {T : Tables} {R : ℝ} (hT : ∀ m ≤ 16, mem (tailI R m) (T.tailAt m)) (P : CP)
    (hm : ∀ t ∈ CP.polar P, t.m ≤ 16) : mem (tailTerms (CP.polar P) R) (tailPolyI T P) := by
  have e : tailPolyI T P = (CP.polar P).foldl (fun acc t => addI acc
      (if t.n = 0 then mulI (ofKQ t.cc) (T.tailAt t.m) else zeroI)) zeroI := by
    unfold tailPolyI
    congr 1; funext acc t
    split_ifs
    · rfl
    · simp [addI, zeroI]
  rw [e, tailTerms]
  refine mem_foldl0 _ _ _ fun t ht => ?_
  split_ifs
  · exact mem_mul (mem_ofKQ _) (hT t.m (hm t ht))
  · exact mem_zero

lemma sum_list_comm {α : Type*} (ts : List α) (n k : ℕ) (g : ℕ → ℕ → α → ℝ) :
    ∑ i ∈ range n, ∑ j ∈ range k, (ts.map (g i j)).sum
      = (ts.map fun t => ∑ i ∈ range n, ∑ j ∈ range k, g i j t).sum := by
  induction ts with
  | nil => simp
  | cons t ts ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [← ih, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_add_distrib


/-! ### The memo tables -/

lemma memo_getD {α : Type} (k : ℕ) (f : ℕ → α) (d : α) (i : ℕ) (e : α) :
    (memo k f d).getD i e = if i < k then f i else e := by
  unfold memo
  split_ifs with h
  · simp [Array.getD, h]
  · simp [Array.getD, h]

lemma get3_memo3 {α : Type} (k1 : ℕ) (k2 : ℕ → ℕ) (k3 : ℕ → ℕ → ℕ) (f : ℕ → ℕ → ℕ → α) (d : α)
    (a b c : ℕ) : get3 (memo3 k1 k2 k3 f d) a b c (fun _ => f a b c) = f a b c := by
  unfold get3 memo3
  by_cases h1 : a < k1
  · by_cases h2 : b < k2 a
    · simp only [memo_getD, h1, h2, ↓reduceIte]
      split
      · simp [memo]
      · rfl
    · simp only [memo_getD, h1, h2, ↓reduceIte]
      split
      · rename_i h; simp at h
      · rfl
  · simp only [memo_getD, h1, ↓reduceIte]
    split
    · rename_i h; simp [Array.getD] at h
    · rfl


/-! ### The weighted cell functionals -/

/-! ### The entries -/

lemma mem_entryPolys_l2 (ell beta : ℚ) : l2CP ell beta ∈ entryPolys ell beta := by
  simp [entryPolys]
lemma mem_entryPolys_one (ell beta : ℚ) : oneCP ∈ entryPolys ell beta := by
  simp [entryPolys]
lemma mem_entryPolys_u (ell beta : ℚ) {j : ℕ} (hj : j < 12) : uCP ell beta j ∈ entryPolys ell beta := by
  simp only [entryPolys, List.mem_append, List.mem_map, List.mem_range]
  exact Or.inl (Or.inl (Or.inr ⟨j, hj, rfl⟩))
lemma mem_entryPolys_g (ell beta : ℚ) {i j : ℕ} (hi : i < 12) (hj : j < 12) :
    gCP i j ∈ entryPolys ell beta := by
  simp only [entryPolys, List.mem_append, List.mem_map, List.mem_range]
  refine Or.inl (Or.inr ⟨12 * i + j, by omega, ?_⟩)
  congr 1 <;> omega
lemma mem_entryPolys_uu (ell beta : ℚ) {i j : ℕ} (hi : i < 12) (hj : j < 12) :
    uuCP ell beta i j ∈ entryPolys ell beta := by
  simp only [entryPolys, List.mem_append, List.mem_map, List.mem_range]
  refine Or.inr ⟨12 * i + j, by omega, ?_⟩
  congr 1 <;> omega

section entries

variable {gd : GridData} {ell beta : ℚ} (hok : gridOK gd ell beta = true)
  (hp : polyBoundsOK ell beta = true) {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T)
include hok hp hT

end entries


/-! ### Symmetry and the full matrix -/

lemma GF_symm (i j : ℕ) (z : ℂ) : GF i j z = GF j i z := by
  simp only [GF, Complex.mul_re, Complex.conj_re, Complex.conj_im]; ring

lemma toArray_map_range_getD {α : Type} (n : ℕ) (f : ℕ → α) (e : α) {i : ℕ} (hi : i < n) :
    (((List.range n).map f).toArray).getD i e = f i := by
  simp [Array.getD, hi]

lemma loQ_at (A : Array (Array Ival)) {I J : ℕ} (hI : I < A.size) (hJ : J < (A.getD I #[]).size) :
    QMat.at (loQ A) I J = ((A.getD I #[]).getD J zeroI).lo / (D : ℚ) := by
  unfold loQ QMat.at
  simp [Array.getD, hI, List.getD_eq_getElem?_getD] at hJ ⊢
  simp [hJ]

lemma hiQ_at (A : Array (Array Ival)) {I J : ℕ} (hI : I < A.size) (hJ : J < (A.getD I #[]).size) :
    QMat.at (hiQ A) I J = ((A.getD I #[]).getD J zeroI).hi / (D : ℚ) := by
  unfold hiQ QMat.at
  simp [Array.getD, hI, List.getD_eq_getElem?_getD] at hJ ⊢
  simp [hJ]

lemma bounds_of_mem {x : ℝ} {I : Ival} (h : mem x I) :
    ((I.lo / (D : ℚ) : ℚ) : ℝ) ≤ x ∧ x ≤ ((I.hi / (D : ℚ) : ℚ) : ℝ) := by
  have hD : (0 : ℝ) < (D : ℝ) := D_pos
  obtain ⟨h1, h2⟩ := h
  push_cast
  exact ⟨(div_le_iff₀ hD).2 h1, (le_div_iff₀ hD).2 h2⟩

end

end Grothe.LowerAnalytic
