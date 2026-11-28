import Grothe.LowerAnalytic.CapGridTNu

/-!
# The kernel matrix with a tail encloses the integrated majorant

The analogue of the second half of `CapCheckSound.lean` for the checker with a tail: for a grid that
passes `gridOKNu`, every entry of the kernel matrix `matINu` encloses the corresponding entry of the
integrated coefficient matrix `TintNu` of the grid weights.

* `matINu_eq`: the tabulated matrix is `matOfNu` of the weighted cell functionals `cwSpecNu` and the
  tail functional;
* `mem_cwSpecNu`: `cwSpecNu gd T w P` encloses `SWNu gd w P = Σ_cells (cell weight w) · (cell
  functional of P)` (the weights by `mem_cellWt`, the tables by `TablesOK`);
* `mem_entryOfNu`, `mem_matINu`: the entries (`TintNu_grid`, with the tail weights `1/(1 + ν)`, `1`,
  `1/(1 − ν)` and the constant `−ν`).
-/

open MeasureTheory Real Set Finset GrotheKernel Grothe.Interval
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

/-! ### The weighted moments -/

/-- `Σᵢ Rad(i, m) Σⱼ wᵢⱼ AngC(j, n)` for the weights with a tail. -/
def wmCrNu (gd : GridDataNu) (w m : ℕ) (n : ℤ) : ℝ :=
  ∑ i ∈ range gd.Nr, radI (i * gd.h) ((i + 1) * gd.h) m
    * ∑ j ∈ range gd.N, cellWtR gd i j w * angC (thN gd.N j) (thN gd.N (j + 1)) n
/-- `Σᵢ Rad(i, m) Σⱼ wᵢⱼ AngS(j, n)` for the weights with a tail. -/
def wmSrNu (gd : GridDataNu) (w m : ℕ) (n : ℤ) : ℝ :=
  ∑ i ∈ range gd.Nr, radI (i * gd.h) ((i + 1) * gd.h) m
    * ∑ j ∈ range gd.N, cellWtR gd i j w * angS (thN gd.N j) (thN gd.N (j + 1)) n

/-- The weighted moments of the kernel (specification of the tabulated ones). -/
def wmCNu (gd : GridDataNu) (T : Tables) (w m : ℕ) (n : ℤ) : Ival :=
  sumI (List.range gd.Nr) fun i =>
    mulI (T.radAt i m) (angSumCW gd.N (fun w i j => cellWt gd w i j) T w n i)
def wmSNu (gd : GridDataNu) (T : Tables) (w m : ℕ) (n : ℤ) : Ival :=
  sumI (List.range gd.Nr) fun i =>
    mulI (T.radAt i m) (angSumSW gd.N (fun w i j => cellWt gd w i j) T w n i)

section wm

variable {gd : GridDataNu} {ell beta : ℚ} (hok : gridOKNu gd ell beta = true) {T : Tables}
  (hT : TablesOK gd.Nr gd.N gd.h T)
include hok hT

lemma mem_wmCNu (w : ℕ) {m : ℕ} (hm : m ≤ 16) {n : ℤ} (hn : n.natAbs ≤ 12) :
    mem (wmCrNu gd w m n) (wmCNu gd T w m n) :=
  mem_sumI_range _ _ _ fun i hi => mem_mul (hT.1 i hi m hm)
    (mem_sumI_range _ _ _ fun j hj =>
      mem_mul (mem_cellWt gd ell beta i j (gridOKNu_cell hok hi hj) w) (mem_angCAt hT hj hn))

lemma mem_wmSNu (w : ℕ) {m : ℕ} (hm : m ≤ 16) {n : ℤ} (hn : n.natAbs ≤ 12) :
    mem (wmSrNu gd w m n) (wmSNu gd T w m n) :=
  mem_sumI_range _ _ _ fun i hi => mem_mul (hT.1 i hi m hm)
    (mem_sumI_range _ _ _ fun j hj =>
      mem_mul (mem_cellWt gd ell beta i j (gridOKNu_cell hok hi hj) w) (mem_angSAt hT hj hn))

end wm

/-! ### Polynomial functionals -/

/-- The weighted sum over the cells of the cell functional of `P`. -/
def SWNu (gd : GridDataNu) (w : ℕ) (P : CP) : ℝ :=
  ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, cellWtR gd i j w * cellTNu gd i j P

lemma SWNu_eq (gd : GridDataNu) (w : ℕ) (P : CP) :
    SWNu gd w P = ((CP.polar P).map fun t => t.cc.val * wmCrNu gd w t.m t.n
      + t.cs.val * wmSrNu gd w t.m t.n).sum := by
  unfold SWNu cellTNu cellTerms
  simp_rw [← List.sum_map_mul_left]
  rw [sum_list_comm]
  congr 1
  refine List.map_congr_left fun t _ => ?_
  unfold wmCrNu wmSrNu
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Finset.mul_sum, Finset.mul_sum, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  ring

/-- `Σ_cells TzWNu` in terms of the weighted sums. -/
lemma sum_TzWNu (gd : GridDataNu) (ell beta : ℚ) (I J : ℕ) :
    ∑ i ∈ range gd.Nr, ∑ j ∈ range gd.N, TzWNu ell beta (cellWtR gd i j) (cellTNu gd i j) I J
      = if I = 0 then
          (if J = 0 then SWNu gd 1 oneCP + SWNu gd 4 (l2CP ell beta) + SWNu gd 6 (l4CP ell beta)
          else SWNu gd 2 (uCP ell beta (J - 1)) + SWNu gd 5 (l2uCP ell beta (J - 1)))
        else if J = 0 then SWNu gd 2 (uCP ell beta (I - 1)) + SWNu gd 5 (l2uCP ell beta (I - 1))
        else SWNu gd 0 (gCP (I - 1) (J - 1)) - SWNu gd 3 (uuCP ell beta (I - 1) (J - 1)) := by
  unfold TzWNu SWNu
  split_ifs <;> simp only [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]

/-! ### The memo tables -/

/-- The specification of the weighted cell functional with a tail. -/
def cwSpecNu (gd : GridDataNu) (T : Tables) (w : ℕ) (P : CP) : Ival :=
  polyI (fun m n => wmCNu gd T w m n.natAbs)
    (fun m n => if n < 0 then negI (wmSNu gd T w m n.natAbs) else wmSNu gd T w m n.natAbs) P

lemma get3_cellW (gd : GridDataNu) (i j w : ℕ) :
    get3 (memo gd.Nr (fun i => memo gd.N (fun j => cellW gd i j) #[]) #[]) i j w
      (fun _ => cellWt gd w i j) = cellWt gd w i j :=
  get3_memo3 gd.Nr (fun _ => gd.N) (fun _ _ => 7) (fun i j w => cellWt gd w i j) zeroI i j w

theorem matINu_eq (ell beta : ℚ) (gd : GridDataNu) (T : Tables) :
    matINu ell beta gd T = matOfNu ell beta gd.nu (cwSpecNu gd T) (tailPolyI T) := by
  unfold matINu cwSpecNu wmCNu wmSNu
  simp only [get3_memo3, get3_cellW]

/-! ### The weighted cell functionals -/

lemma wmCrNu_natAbs (gd : GridDataNu) (w m : ℕ) (n : ℤ) :
    wmCrNu gd w m n = wmCrNu gd w m (n.natAbs : ℤ) := by
  unfold wmCrNu
  simp only [show ∀ a b, angC a b n = angC a b (n.natAbs : ℤ) from fun a b => angC_natAbs a b n]

lemma wmSrNu_neg (gd : GridDataNu) (w m : ℕ) {n : ℤ} (hn : n < 0) :
    wmSrNu gd w m n = -wmSrNu gd w m (n.natAbs : ℤ) := by
  have e : n = -(n.natAbs : ℤ) := by omega
  unfold wmSrNu
  simp only [show ∀ a b, angS a b n = -angS a b (n.natAbs : ℤ) from fun a b => by
    conv_lhs => rw [e]
    rw [angS_neg]]
  simp only [mul_neg, Finset.sum_neg_distrib]

lemma wmSrNu_pos (gd : GridDataNu) (w m : ℕ) {n : ℤ} (hn : ¬ n < 0) :
    wmSrNu gd w m n = wmSrNu gd w m (n.natAbs : ℤ) := by
  have e : n = (n.natAbs : ℤ) := by omega
  conv_lhs => rw [e]

/-- **The weighted cell functional with a tail is enclosed.** -/
lemma mem_cwSpecNu {gd : GridDataNu} {ell beta : ℚ} (hok : gridOKNu gd ell beta = true)
    {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T) (w : ℕ) (P : CP)
    (hb : ∀ t ∈ CP.polar P, t.m ≤ 16 ∧ t.n.natAbs ≤ 12) :
    mem (SWNu gd w P) (cwSpecNu gd T w P) := by
  rw [SWNu_eq]
  refine mem_polyI _ _ _ _ P (fun t ht => ?_) (fun t ht => ?_)
  · rw [wmCrNu_natAbs]
    exact mem_wmCNu hok hT w (hb t ht).1 (by simpa [Int.natAbs_abs] using (hb t ht).2)
  · have h1 := mem_wmSNu hok hT w (hb t ht).1 (n := (t.n.natAbs : ℤ))
      (by simpa [Int.natAbs_abs] using (hb t ht).2)
    split_ifs with hn
    · rw [wmSrNu_neg gd w t.m hn]; exact mem_neg h1
    · rw [wmSrNu_pos gd w t.m hn]; exact h1

/-! ### The entries -/

lemma mem_entryPolysNu_of {ell beta : ℚ} {P : CP} (h : P ∈ entryPolys ell beta) :
    P ∈ entryPolysNu ell beta := by
  unfold entryPolysNu
  exact List.mem_append_left _ (List.mem_append_left _ h)
lemma mem_entryPolysNu_l4 (ell beta : ℚ) : l4CP ell beta ∈ entryPolysNu ell beta := by
  unfold entryPolysNu
  exact List.mem_append_left _ (List.mem_append_right _ List.mem_cons_self)
lemma mem_entryPolysNu_l2u (ell beta : ℚ) {j : ℕ} (hj : j < 12) :
    l2uCP ell beta j ∈ entryPolysNu ell beta := by
  unfold entryPolysNu
  exact List.mem_append_right _ (List.mem_map.2 ⟨j, List.mem_range.2 hj, rfl⟩)

lemma polyBoundsNu_of {ell beta : ℚ} (hp : polyBoundsOKNu ell beta = true) {P : CP}
    (hP : P ∈ entryPolysNu ell beta) : ∀ t ∈ CP.polar P, t.m ≤ 16 ∧ t.n.natAbs ≤ 12 := by
  intro t ht
  have := List.all_eq_true.1 (List.all_eq_true.1 hp P hP) t ht
  simpa using this

section entries

variable {gd : GridDataNu} {ell beta : ℚ} (hok : gridOKNu gd ell beta = true)
  (hp : polyBoundsOKNu ell beta = true) {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T)
include hok hp hT

/-- **Every upper-triangle entry of the matrix with a tail is enclosed.** -/
theorem mem_entryOfNu {I J : ℕ} (hI : I < 13) (hJ : J < 13) :
    mem (TintNu ell beta gd.nu (gridWtsNu hok) I J)
      (entryOfNu ell beta gd.nu (cwSpecNu gd T) (tailPolyI T) I J) := by
  have hb := fun P (hP : P ∈ entryPolysNu ell beta) => polyBoundsNu_of hp hP
  have hm := fun P (hP : P ∈ entryPolysNu ell beta) t (ht : t ∈ CP.polar P) => (hb P hP t ht).1
  have htail := fun P (hP : P ∈ entryPolysNu ell beta) =>
    mem_tailPolyI (R := ((gd.Nr : ℚ) * gd.h : ℚ)) (T := T) (by
      intro m hm'; have := hT.2.1 m hm'; push_cast; exact this) P (hm P hP)
  have hν0 := gridOKNu_nu0 hok
  have hν1 := gridOKNu_nu1 hok
  obtain ⟨t0, t1, t2, t3, t4, t5, t6⟩ := tailWtR_eq gd hν0 hν1
  have c0 : (1 : ℝ) / (1 + gd.nu) = ((1 / (1 + gd.nu) : ℚ) : ℝ) := by push_cast; rfl
  have c4 : (1 : ℝ) / (1 - gd.nu) = ((1 / (1 - gd.nu) : ℚ) : ℝ) := by push_cast; rfl
  have el2 := mem_entryPolysNu_of (mem_entryPolys_l2 ell beta)
  have e1 := mem_entryPolysNu_of (mem_entryPolys_one ell beta)
  rw [TintNu_grid hok, sum_TzWNu]
  unfold entryOfNu TzWNu tailTNu
  push_cast at htail
  rw [t0, t1, t2, t3, t4, t5, t6, c0, c4]
  by_cases h1 : I = 0
  · by_cases h2 : J = 0
    · simp only [h1, h2, and_self, ↓reduceIte]
      have key := mem_add (mem_add (mem_add (mem_cwSpecNu hok hT 4 _ (hb _ el2))
        (mem_cwSpecNu hok hT 1 _ (hb _ e1)))
        (mem_cwSpecNu hok hT 6 _ (hb _ (mem_entryPolysNu_l4 ell beta))))
        (mem_add (mem_add (mem_mul (mem_ofRatI (1 / (1 - gd.nu))) (htail _ el2)) (htail _ e1))
          (mem_neg (mem_ofRatI gd.nu)))
      convert key using 1
      ring
    · simp only [h1, h2, and_false, ↓reduceIte, zero_mul, add_zero, sub_zero]
      exact mem_add
        (mem_cwSpecNu hok hT 2 _ (hb _ (mem_entryPolysNu_of (mem_entryPolys_u _ _ (by omega)))))
        (mem_cwSpecNu hok hT 5 _ (hb _ (mem_entryPolysNu_l2u _ _ (by omega))))
  · by_cases h2 : J = 0
    · simp only [h1, h2, false_and, ↓reduceIte, zero_mul, add_zero, sub_zero]
      exact mem_add
        (mem_cwSpecNu hok hT 2 _ (hb _ (mem_entryPolysNu_of (mem_entryPolys_u _ _ (by omega)))))
        (mem_cwSpecNu hok hT 5 _ (hb _ (mem_entryPolysNu_l2u _ _ (by omega))))
    · simp only [h1, h2, false_and, ↓reduceIte, zero_mul, sub_zero]
      have eg := mem_entryPolysNu_of (mem_entryPolys_g ell beta (i := I - 1) (j := J - 1)
        (by omega) (by omega))
      have euu := mem_entryPolysNu_of (mem_entryPolys_uu ell beta (i := I - 1) (j := J - 1)
        (by omega) (by omega))
      have key := mem_add (mem_add (mem_cwSpecNu hok hT 0 _ (hb _ eg))
        (mem_neg (mem_cwSpecNu hok hT 3 _ (hb _ euu))))
        (mem_mul (mem_ofRatI (1 / (1 + gd.nu))) (htail _ eg))
      convert key using 1

end entries

/-! ### Symmetry and the full matrix -/

lemma TzNu_symm (ℓ β ν : ℝ) (wt : WtsNu ℓ β ν) (z : ℂ) (I J : ℕ) :
    TzNu ℓ β ν wt z I J = TzNu ℓ β ν wt z J I := by
  unfold TzNu
  split_ifs <;> first | rfl | (simp only [GF_symm]; ring)

lemma TintNu_symm (ℓ β ν : ℝ) (wt : WtsNu ℓ β ν) (I J : ℕ) :
    TintNu ℓ β ν wt I J = TintNu ℓ β ν wt J I := by
  unfold TintNu
  simp_rw [TzNu_symm ℓ β ν wt _ I J]
  simp only [and_comm]

lemma matOfNu_getD (ell beta nu : ℚ) (cw : ℕ → CP → Ival) (tl : CP → Ival) {I J : ℕ} (hI : I < 13)
    (hJ : J < 13) : ((matOfNu ell beta nu cw tl).getD I #[]).getD J zeroI
      = if I ≤ J then entryOfNu ell beta nu cw tl I J else entryOfNu ell beta nu cw tl J I := by
  unfold matOfNu
  rw [toArray_map_range_getD _ _ _ hI, toArray_map_range_getD _ _ _ hJ]

/-- **The kernel matrix with a tail encloses the integrated majorant**, entry by entry, as rational
bounds (the form the piece checks use). -/
theorem bounds_matINu {gd : GridDataNu} {ell beta : ℚ} (hok : gridOKNu gd ell beta = true)
    (hp : polyBoundsOKNu ell beta = true) {T : Tables} (hT : TablesOK gd.Nr gd.N gd.h T)
    {I J : ℕ} (hI : I < 13) (hJ : J < 13) :
    ((QMat.at (loQ (matINu ell beta gd T)) I J : ℚ) : ℝ) ≤ TintNu ell beta gd.nu (gridWtsNu hok) I J ∧
      TintNu ell beta gd.nu (gridWtsNu hok) I J ≤ ((QMat.at (hiQ (matINu ell beta gd T)) I J : ℚ) : ℝ) := by
  have hM : ((matINu ell beta gd T).getD I #[]).getD J zeroI
      = if I ≤ J then entryOfNu ell beta gd.nu (cwSpecNu gd T) (tailPolyI T) I J
        else entryOfNu ell beta gd.nu (cwSpecNu gd T) (tailPolyI T) J I := by
    rw [matINu_eq, matOfNu_getD _ _ _ _ _ hI hJ]
  have hmem : mem (TintNu ell beta gd.nu (gridWtsNu hok) I J)
      (((matINu ell beta gd T).getD I #[]).getD J zeroI) := by
    rw [hM]
    split_ifs
    · exact mem_entryOfNu hok hp hT hI hJ
    · rw [TintNu_symm]; exact mem_entryOfNu hok hp hT hJ hI
  have hsz : I < (matINu ell beta gd T).size := by rw [matINu_eq]; simp [matOfNu, hI]
  have hsz2 : J < ((matINu ell beta gd T).getD I #[]).size := by
    rw [matINu_eq]; unfold matOfNu; rw [toArray_map_range_getD _ _ _ hI]; simp [hJ]
  rw [loQ_at _ hsz hsz2, hiQ_at _ hsz hsz2]
  exact bounds_of_mem hmem

end

end Grothe.LowerAnalytic
