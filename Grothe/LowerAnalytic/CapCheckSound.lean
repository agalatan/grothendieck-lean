import Grothe.LowerAnalytic.CapGridT
import Grothe.Upper.IntervalSound

/-!
# Soundness of the cap checker (`GrotheKernel/CapCheck.lean`)

* `TablesOK Nr N h T`: the shared tables enclose the one-dimensional integrals `radI`, `tailI`,
  `angC`, `angS` (the only analytic input; closed by the table enclosures, L-e);
* `matI_mem`: then every entry of the kernel matrix `matI` encloses the corresponding entry of the
  integrated coefficient matrix `Tint` of the grid prices (`Tint_grid` + interval arithmetic);
* `pot_le_of_nodeOK`: `nodeOK` (grid check + piece check at `cap + capPad`) gives
  `Ψ(s) − capPad ≤ cap` for the potential of the row.
-/

open MeasureTheory Real Set Finset GrotheKernel Grothe.Upper
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
  have := (hT.2.2 j hj n.natAbs hn).1
  unfold Tables.angCAt
  rw [angC_natAbs]
  exact_mod_cast this

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

lemma ediv_pow_le (x : ℤ) (k : ℕ) : ((x / 2 ^ k : ℤ) : ℝ) ≤ (x : ℝ) / 2 ^ k := by
  have hk : (0 : ℤ) < 2 ^ k := by positivity
  rw [le_div_iff₀ (by positivity)]
  have := Int.ediv_mul_le x hk.ne'
  exact_mod_cast this

lemma le_neg_ediv_neg_pow (x : ℤ) (k : ℕ) : (x : ℝ) / 2 ^ k ≤ ((-((-x) / 2 ^ k) : ℤ) : ℝ) := by
  have h := ediv_pow_le (-x) k
  push_cast at h ⊢
  rw [neg_div] at h
  linarith

lemma two50_eq : (two50 : ℝ) = 2 ^ 50 := by norm_num [two50]
lemma two100_eq : (two100 : ℝ) = 2 ^ 100 := by norm_num [two100, two50]
lemma D_eq : ((D : ℤ) : ℝ) = 2 ^ 128 := by norm_num [D, K]

/-- **The integer weights enclose the rational weights.** -/
lemma mem_wI (gd : GridData) (w i j : ℕ) : mem (wQ gd w i j) (wI gd w i j) := by
  unfold mem wI wQ
  rw [D_eq]
  rcases w with _ | _ | _ | w
  · simp only [GridData.na, GridData.nb]; push_cast; rw [two50_eq]
    constructor <;> apply le_of_eq <;> ring
  · simp only [GridData.pa, GridData.pb, GridData.gg]
    push_cast; rw [two50_eq, two100_eq]
    have e : ((((gd.PA i j : ℝ) / 2 ^ 50 + (gd.PB i j : ℝ) / 2 ^ 50) / 2
        - (gd.G i j : ℝ) / 2 ^ 100 * (((gd.PA i j : ℝ) / 2 ^ 50) ^ 2 - ((gd.PB i j : ℝ) / 2 ^ 50) ^ 2) ^ 2
          / 16)) * 2 ^ 128
        = ((gd.PA i j : ℝ) + gd.PB i j) * 2 ^ 77
          - ((gd.G i j : ℝ) * ((gd.PA i j : ℝ) ^ 2 - (gd.PB i j : ℝ) ^ 2) ^ 2) / 2 ^ 176 := by ring
    rw [e]
    have h1 := ediv_pow_le ((gd.G i j : ℤ) * ((gd.PA i j : ℤ) ^ 2 - (gd.PB i j : ℤ) ^ 2) ^ 2) 176
    have h2 := le_neg_ediv_neg_pow ((gd.G i j : ℤ) * ((gd.PA i j : ℤ) ^ 2 - (gd.PB i j : ℤ) ^ 2) ^ 2) 176
    push_cast at h1 h2 ⊢
    constructor <;> linarith
  · simp only [GridData.na, GridData.nb, GridData.pa, GridData.pb, GridData.gg]
    push_cast; rw [two50_eq, two100_eq]
    have e : (((gd.NA i j : ℝ) / 2 ^ 50 - (gd.NB i j : ℝ) / 2 ^ 50) / 2
        + (gd.G i j : ℝ) / 2 ^ 100 * (((gd.PA i j : ℝ) / 2 ^ 50) ^ 2 - ((gd.PB i j : ℝ) / 2 ^ 50) ^ 2)
          / 4) * 2 ^ 128
        = ((gd.NA i j : ℝ) - gd.NB i j) * 2 ^ 77
          + ((gd.G i j : ℝ) * ((gd.PA i j : ℝ) ^ 2 - (gd.PB i j : ℝ) ^ 2)) / 2 ^ 74 := by ring
    rw [e]
    have h1 := ediv_pow_le ((gd.G i j : ℤ) * ((gd.PA i j : ℤ) ^ 2 - (gd.PB i j : ℤ) ^ 2)) 74
    have h2 := le_neg_ediv_neg_pow ((gd.G i j : ℤ) * ((gd.PA i j : ℤ) ^ 2 - (gd.PB i j : ℤ) ^ 2)) 74
    push_cast at h1 h2 ⊢
    constructor <;> linarith
  · simp only [GridData.gg]; push_cast; rw [two100_eq]
    constructor <;> apply le_of_eq <;> ring

/-! ### The weighted moments -/

/-- `Σᵢ Rad(i, m) Σⱼ wᵢⱼ AngC(j, n)`. -/
def wmCr (gd : GridData) (w m : ℕ) (n : ℤ) : ℝ :=
  ∑ i ∈ range gd.Nr, radI (i * gd.h) ((i + 1) * gd.h) m
    * ∑ j ∈ range gd.N, (wQ gd w i j : ℝ) * angC (thN gd.N j) (thN gd.N (j + 1)) n
/-- `Σᵢ Rad(i, m) Σⱼ wᵢⱼ AngS(j, n)`. -/
def wmSr (gd : GridData) (w m : ℕ) (n : ℤ) : ℝ :=
  ∑ i ∈ range gd.Nr, radI (i * gd.h) ((i + 1) * gd.h) m
    * ∑ j ∈ range gd.N, (wQ gd w i j : ℝ) * angS (thN gd.N j) (thN gd.N (j + 1)) n

section wm

variable {gd : GridData} {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T)

include hT in
lemma mem_wmC (w : ℕ) {m : ℕ} (hm : m ≤ 16) {n : ℤ} (hn : n.natAbs ≤ 12) :
    mem (wmCr gd w m n) (wmC gd T w m n) :=
  mem_sumI_range _ _ _ fun i hi => mem_mul (hT.1 i hi m hm)
    (mem_sumI_range _ _ _ fun _ hj => mem_mul (mem_wI _ _ _ _) (mem_angCAt hT hj hn))

include hT in
lemma mem_wmS (w : ℕ) {m : ℕ} (hm : m ≤ 16) {n : ℤ} (hn : n.natAbs ≤ 12) :
    mem (wmSr gd w m n) (wmS gd T w m n) :=
  mem_sumI_range _ _ _ fun i hi => mem_mul (hT.1 i hi m hm)
    (mem_sumI_range _ _ _ fun _ hj => mem_mul (mem_wI _ _ _ _) (mem_angSAt hT hj hn))

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

/-- The weighted sum over the cells of the cell functional of `P`. -/
def SW (gd : GridData) (w : ℕ) (P : CP) : ℝ :=
  ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, (wQ gd w i j : ℝ) * cellT gd i j P

lemma sum_list_comm {α : Type*} (ts : List α) (n k : ℕ) (g : ℕ → ℕ → α → ℝ) :
    ∑ i ∈ range n, ∑ j ∈ range k, (ts.map (g i j)).sum
      = (ts.map fun t => ∑ i ∈ range n, ∑ j ∈ range k, g i j t).sum := by
  induction ts with
  | nil => simp
  | cons t ts ih =>
    simp only [List.map_cons, List.sum_cons]
    rw [← ih, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_add_distrib

lemma SW_eq (gd : GridData) (w : ℕ) (P : CP) :
    SW gd w P = ((CP.polar P).map fun t => t.cc.val * wmCr gd w t.m t.n
      + t.cs.val * wmSr gd w t.m t.n).sum := by
  unfold SW cellT cellTerms
  simp_rw [← List.sum_map_mul_left]
  rw [sum_list_comm]
  congr 1
  refine List.map_congr_left fun t _ => ?_
  unfold wmCr wmSr
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Finset.mul_sum, Finset.mul_sum, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  ring

/-- `Σ_cells TzW` in terms of the weighted sums. -/
lemma sum_TzW (gd : GridData) (ell beta : ℚ) (I J : ℕ) :
    ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, TzW ell beta (cellWts gd i j) (cellT gd i j) I J
      = if I = 0 then (if J = 0 then SW gd 0 (l2CP ell beta) + SW gd 1 oneCP
          else SW gd 2 (uCP ell beta (J - 1)))
        else if J = 0 then SW gd 2 (uCP ell beta (I - 1))
        else SW gd 0 (gCP (I - 1) (J - 1)) - SW gd 3 (uuCP ell beta (I - 1) (J - 1)) := by
  unfold TzW SW
  split_ifs <;>
    simp only [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib, cellWts, wQ]


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

/-- The specification of the weighted cell functional. -/
def cwSpec (gd : GridData) (T : Tables) (w : ℕ) (P : CP) : Ival :=
  polyI (fun m n => wmC gd T w m n.natAbs)
    (fun m n => if n < 0 then negI (wmS gd T w m n.natAbs) else wmS gd T w m n.natAbs) P

lemma wmC_eq_mCW (gd : GridData) (T : Tables) (w m k : ℕ) :
    wmC gd T w m (k : ℤ) = mCW gd T (fun w n i => angSumCW gd.N (fun w i j => wI gd w i j) T w ↑n i) w m k :=
  rfl
lemma wmS_eq_mCW (gd : GridData) (T : Tables) (w m k : ℕ) :
    wmS gd T w m (k : ℤ) = mCW gd T (fun w n i => angSumSW gd.N (fun w i j => wI gd w i j) T w ↑n i) w m k :=
  rfl

theorem matI_eq (ell beta : ℚ) (gd : GridData) (T : Tables) :
    matI ell beta gd T = matOf ell beta (cwSpec gd T) (tailPolyI T) := by
  unfold matI cwSpec
  simp only [get3_memo3, wmC_eq_mCW, wmS_eq_mCW]


/-! ### The weighted cell functionals -/

lemma wmCr_natAbs (gd : GridData) (w m : ℕ) (n : ℤ) : wmCr gd w m n = wmCr gd w m (n.natAbs : ℤ) := by
  unfold wmCr
  simp only [show ∀ a b, angC a b n = angC a b (n.natAbs : ℤ) from fun a b => angC_natAbs a b n]

lemma wmSr_neg (gd : GridData) (w m : ℕ) {n : ℤ} (hn : n < 0) :
    wmSr gd w m n = -wmSr gd w m (n.natAbs : ℤ) := by
  have e : n = -(n.natAbs : ℤ) := by omega
  unfold wmSr
  simp only [show ∀ a b, angS a b n = -angS a b (n.natAbs : ℤ) from fun a b => by
    conv_lhs => rw [e]
    rw [angS_neg]]
  simp only [mul_neg, Finset.sum_neg_distrib]

lemma wmSr_pos (gd : GridData) (w m : ℕ) {n : ℤ} (hn : ¬ n < 0) :
    wmSr gd w m n = wmSr gd w m (n.natAbs : ℤ) := by
  have e : n = (n.natAbs : ℤ) := by omega
  conv_lhs => rw [e]

/-- **The weighted cell functional is enclosed.** -/
lemma mem_cwSpec {gd : GridData} {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T) (w : ℕ) (P : CP)
    (hb : ∀ t ∈ CP.polar P, t.m ≤ 16 ∧ t.n.natAbs ≤ 12) : mem (SW gd w P) (cwSpec gd T w P) := by
  rw [SW_eq]
  refine mem_polyI _ _ _ _ P (fun t ht => ?_) (fun t ht => ?_)
  · rw [wmCr_natAbs]
    exact mem_wmC hT w (hb t ht).1 (by simpa [Int.natAbs_abs] using (hb t ht).2)
  · have h1 := mem_wmS hT w (hb t ht).1 (n := (t.n.natAbs : ℤ)) (by simpa [Int.natAbs_abs] using (hb t ht).2)
    split_ifs with hn
    · rw [wmSr_neg gd w t.m hn]; exact mem_neg h1
    · rw [wmSr_pos gd w t.m hn]; exact h1

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

lemma polyBounds_of {ell beta : ℚ} (hp : polyBoundsOK ell beta = true) {P : CP}
    (hP : P ∈ entryPolys ell beta) : ∀ t ∈ CP.polar P, t.m ≤ 16 ∧ t.n.natAbs ≤ 12 := by
  intro t ht
  have := List.all_eq_true.1 (List.all_eq_true.1 hp P hP) t ht
  simpa using this

section entries

variable {gd : GridData} {ell beta : ℚ} (hok : gridOK gd ell beta = true)
  (hp : polyBoundsOK ell beta = true) {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T)
include hok hp hT

/-- **Every upper-triangle entry is enclosed.** -/
theorem mem_entryOf {I J : ℕ} (hI : I < 13) (hJ : J < 13) :
    mem (Tint ell beta (gridPrices hok) I J) (entryOf ell beta (cwSpec gd T) (tailPolyI T) I J) := by
  have hNr : (0 : ℝ) < gd.Nr := by exact_mod_cast gridOK_Nr hok
  have hb := fun P (hP : P ∈ entryPolys ell beta) => polyBounds_of hp hP
  have hm := fun P (hP : P ∈ entryPolys ell beta) t (ht : t ∈ CP.polar P) => (hb P hP t ht).1
  have htail := fun P (hP : P ∈ entryPolys ell beta) =>
    mem_tailPolyI (R := ((gd.Nr : ℚ) * gd.h : ℚ)) (T := T) (by
      intro m hm'; have := hT.2.1 m hm'; push_cast; exact this) P (hm P hP)
  rw [Tint_grid hok, sum_TzW]
  unfold entryOf TzW tailWts tailT
  push_cast at htail
  split_ifs with h1 h2 h3
  · simp only [one_mul]
    rw [show SW gd 0 (l2CP ell beta) + SW gd 1 oneCP
        + (tailTerms (CP.polar (l2CP ell beta)) (gd.Nr * gd.h) + tailTerms (CP.polar oneCP) (gd.Nr * gd.h))
        = SW gd 0 (l2CP ell beta) + SW gd 1 oneCP
        + (tailTerms (CP.polar (l2CP ell beta)) (gd.Nr * gd.h) + tailTerms (CP.polar oneCP) (gd.Nr * gd.h))
        from rfl]
    exact mem_add (mem_add (mem_cwSpec hT 0 _ (hb _ (mem_entryPolys_l2 _ _)))
      (mem_cwSpec hT 1 _ (hb _ (mem_entryPolys_one _ _))))
      (mem_add (htail _ (mem_entryPolys_l2 _ _)) (htail _ (mem_entryPolys_one _ _)))
  · simp only [zero_mul, add_zero]
    exact mem_cwSpec hT 2 _ (hb _ (mem_entryPolys_u _ _ (by omega)))
  · simp only [zero_mul, add_zero]
    exact mem_cwSpec hT 2 _ (hb _ (mem_entryPolys_u _ _ (by omega)))
  · simp only [one_mul, zero_mul, sub_zero]
    rw [sub_eq_add_neg]
    exact mem_add (mem_add (mem_cwSpec hT 0 _ (hb _ (mem_entryPolys_g _ _ (by omega) (by omega))))
      (mem_neg (mem_cwSpec hT 3 _ (hb _ (mem_entryPolys_uu _ _ (by omega) (by omega))))))
      (htail _ (mem_entryPolys_g _ _ (by omega) (by omega)))

end entries


/-! ### Symmetry and the full matrix -/

lemma GF_symm (i j : ℕ) (z : ℂ) : GF i j z = GF j i z := by
  simp only [GF, Complex.mul_re, Complex.conj_re, Complex.conj_im]; ring

lemma Tz_symm (ℓ β : ℝ) (pr : Prices ℓ β) (z : ℂ) (I J : ℕ) : Tz ℓ β pr z I J = Tz ℓ β pr z J I := by
  unfold Tz
  split_ifs <;> first | rfl | (simp only [HF, GF_symm]; ring)

lemma Tint_symm (ℓ β : ℝ) (pr : Prices ℓ β) (I J : ℕ) : Tint ℓ β pr I J = Tint ℓ β pr J I := by
  unfold Tint; simp_rw [Tz_symm ℓ β pr _ I J]

lemma toArray_map_range_getD {α : Type} (n : ℕ) (f : ℕ → α) (e : α) {i : ℕ} (hi : i < n) :
    (((List.range n).map f).toArray).getD i e = f i := by
  simp [Array.getD, hi]

lemma matOf_getD (ell beta : ℚ) (cw : ℕ → CP → Ival) (tl : CP → Ival) {I J : ℕ} (hI : I < 13)
    (hJ : J < 13) : ((matOf ell beta cw tl).getD I #[]).getD J zeroI
      = if I ≤ J then entryOf ell beta cw tl I J else entryOf ell beta cw tl J I := by
  unfold matOf
  rw [toArray_map_range_getD _ _ _ hI, toArray_map_range_getD _ _ _ hJ]

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
