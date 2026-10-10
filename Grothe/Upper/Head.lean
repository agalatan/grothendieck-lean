import Grothe.Upper.Bivariate
import Grothe.Upper.IntervalSound
import GrotheKernel.Table

/-!
# Soundness of the head computation

The kernel routine `GrotheKernel.bivarT` encloses the first `K` radial coefficients of the kernel
polynomial of a finite exact table, `tabPoly P Q (tabR rows)`.

* `tabPoly_coeff`: that polynomial is the finite sum `Σ_{p ∈ headIdx N} Ê p · termOf p`, where
  `Ê = tabVal rows` is the table as a function (the sum of the listed values of an index);
* `memB_bivarT`: soundness of the truncated composition;
* `head_sound`: the scaled integer `headInt` bounds the head of the residual
  `Σ_{j < (N+1)/2} |ĥ_j − c·δ_{j0}|` of the kernel `ĥ` of the table.
-/

namespace Grothe.Upper

open GrotheKernel Polynomial Finset

noncomputable section

/-! ### Rational coefficient lists -/

/-- Real polynomial with rational coefficient list (Horner form). -/
def ofListQ : List ℚ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofListQ l

lemma coeff_ofListQ (l : List ℚ) (n : ℕ) : (ofListQ l).coeff n = ((l.getD n 0 : ℚ) : ℝ) := by
  induction l generalizing n with
  | nil => simp [ofListQ]
  | cons a l ih =>
    cases n with
    | zero => simp [ofListQ]
    | succ n =>
      simp only [ofListQ, coeff_add, coeff_C_succ, coeff_X_mul, zero_add, ih, List.getD_cons_succ]

/-- `‖P‖_𝒜 ≤ Σ|Pⱼ|` for a rational coefficient list. -/
lemma l1_ofListQ_le (l : List ℚ) : l1 (ofListQ l) ≤ (((l.map fun q => |q|).sum : ℚ) : ℝ) := by
  induction l with
  | nil => simp [ofListQ]
  | cons a l ih =>
    simp only [ofListQ, List.map_cons, List.sum_cons]
    calc l1 (C (a : ℝ) + X * ofListQ l)
        ≤ l1 (C (a : ℝ)) + l1 (X * ofListQ l) := l1_add_le _ _
      _ ≤ |(a : ℝ)| + l1 X * l1 (ofListQ l) := by
          gcongr
          · exact (l1_C _).le
          · exact l1_mul_le _ _
      _ ≤ |(a : ℝ)| + (((l.map fun q => |q|).sum : ℚ) : ℝ) := by
          rw [l1_X, one_mul]; gcongr
      _ = _ := by push_cast; rfl

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

lemma memB_ofListQ (l : List ℚ) (N : ℕ) : memB N (ofListQ l) (l.map ofRatI) := by
  intro n _
  rw [coeff_ofListQ, getD_map_ofRatI]
  exact mem_ofRatI _

/-! ### The kernel polynomial of a finite table -/

/-- A real table row: the `m` index and its `(n, E[n,m])` entries. -/
abbrev RowR := ℕ × List (ℕ × ℝ)

/-- `Σ_{(n,c) ∈ row} c · X^{⌊n/2⌋} · P^n`. -/
def rowPoly (P : ℝ[X]) : List (ℕ × ℝ) → ℝ[X]
  | [] => 0
  | (n, c) :: rest => C c * (X ^ (n / 2) * P ^ n) + rowPoly P rest

/-- The contribution `X^{⌊m/2⌋} · Q^m · rowPoly` of one row. -/
def rowTerm (P Q : ℝ[X]) (r : RowR) : ℝ[X] := X ^ (r.1 / 2) * (Q ^ r.1 * rowPoly P r.2)

/-- The kernel polynomial of the table. -/
def tabPoly (P Q : ℝ[X]) : List RowR → ℝ[X]
  | [] => 0
  | r :: rest => rowTerm P Q r + tabPoly P Q rest

/-- The real rows of an exact table. -/
def tabR (rows : List RowQ) : List RowR :=
  rows.map fun r => (r.1, r.2.map fun e => (e.1, ((e.2 : ℚ) : ℝ)))

/-- The entries of an exact table with their index pairs `(n, m)`. -/
def flat (rows : List RowQ) : List ((ℕ × ℕ) × ℚ) :=
  rows.flatMap fun r => r.2.map fun e => ((e.1, r.1), e.2)

/-- The table as a function of the index pair `(n, m)`: the sum of the listed values of that
index (zero if the index is not listed). -/
def tabVal (rows : List RowQ) (p : ℕ × ℕ) : ℚ :=
  ((flat rows).map fun e => if e.1 = p then e.2 else 0).sum

lemma rowTerm_eq_sum (P Q : ℝ[X]) (m : ℕ) (row : List (ℕ × ℚ)) :
    rowTerm P Q (m, row.map fun e => (e.1, ((e.2 : ℚ) : ℝ)))
      = ((row.map fun e => ((e.1, m), e.2)).map fun e : (ℕ × ℕ) × ℚ =>
          C ((e.2 : ℚ) : ℝ) * termOf P Q e.1).sum := by
  unfold rowTerm
  induction row with
  | nil => simp [rowPoly]
  | cons e rest ih =>
    simp only [List.map_cons, rowPoly, List.sum_cons] at ih ⊢
    rw [mul_add, mul_add, ih]
    congr 1
    unfold termOf shiftOf
    simp only
    rw [pow_add]
    ring

lemma tabPoly_eq_flat (P Q : ℝ[X]) (rows : List RowQ) :
    tabPoly P Q (tabR rows)
      = ((flat rows).map fun e : (ℕ × ℕ) × ℚ => C ((e.2 : ℚ) : ℝ) * termOf P Q e.1).sum := by
  unfold tabR flat
  induction rows with
  | nil => simp [tabPoly]
  | cons r rest ih =>
    simp only [List.map_cons, tabPoly, List.flatMap_cons, List.map_append, List.sum_append]
    rw [ih, rowTerm_eq_sum]

lemma list_sum_eq_finset (P Q : ℝ[X]) (S : Finset (ℕ × ℕ)) :
    ∀ es : List ((ℕ × ℕ) × ℚ), (∀ e ∈ es, e.1 ∈ S) →
      (es.map fun e : (ℕ × ℕ) × ℚ => C ((e.2 : ℚ) : ℝ) * termOf P Q e.1).sum
        = ∑ p ∈ S, C ((((es.map fun e => if e.1 = p then e.2 else 0).sum : ℚ)) : ℝ)
            * termOf P Q p := by
  intro es
  induction es with
  | nil => intro _; simp
  | cons e es ih =>
    intro h
    simp only [List.map_cons, List.sum_cons]
    rw [ih fun e' he' => h e' (List.mem_cons_of_mem _ he')]
    have h1 : ∑ p ∈ S, C (((if e.1 = p then e.2 else 0 : ℚ)) : ℝ) * termOf P Q p
        = C ((e.2 : ℚ) : ℝ) * termOf P Q e.1 := by
      rw [Finset.sum_eq_single_of_mem e.1 (h e List.mem_cons_self) fun p _ hp => by
        rw [ite_eq_right (Ne.symm hp)]; simp]
      rw [ite_eq_left rfl]
    rw [← h1, ← Finset.sum_add_distrib]
    refine sum_congr rfl fun p _ => ?_
    rw [Rat.cast_add, C_add, add_mul]

lemma flat_mem_headIdx {N : ℕ} {rows : List RowQ} (hw : tabWithin N rows = true) :
    ∀ e ∈ flat rows, e.1 ∈ headIdx N := by
  intro e he
  unfold flat at he
  obtain ⟨r, hr, he⟩ := List.mem_flatMap.1 he
  obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
  unfold tabWithin at hw
  rw [List.all_eq_true] at hw
  have h1 := Bool.and_eq_true_iff.1 (hw r hr)
  have h2 := List.all_eq_true.1 h1.2 e' he'
  rw [decide_eq_true_eq] at h2
  exact mem_headIdx.2 h2

/-- **The kernel polynomial of the table is the finite sum over `headIdx N`.** -/
theorem tabPoly_coeff (P Q : ℝ[X]) {N : ℕ} {rows : List RowQ} (hw : tabWithin N rows = true)
    (j : ℕ) : (tabPoly P Q (tabR rows)).coeff j
      = ∑ p ∈ headIdx N, ((tabVal rows p : ℚ) : ℝ) * (termOf P Q p).coeff j := by
  rw [tabPoly_eq_flat, list_sum_eq_finset P Q (headIdx N) _ (flat_mem_headIdx hw), finsetSum_coeff]
  exact sum_congr rfl fun p _ => by rw [coeff_C_mul]; rfl

/-! ### Enclosures of tables -/

/-- The interval row encloses the real row (same indices, enclosed values). -/
def RowMem (row : List (ℕ × ℝ)) (rowI : List (ℕ × Ival)) : Prop :=
  List.Forall₂ (fun (e : ℕ × ℝ) (eI : ℕ × Ival) => e.1 = eI.1 ∧ mem e.2 eI.2) row rowI

/-- The interval table encloses the real table. -/
def TabMem (tab : List RowR) (tabI : List RowI) : Prop :=
  List.Forall₂ (fun (r : RowR) (rI : RowI) => r.1 = rI.1 ∧ RowMem r.2 rI.2) tab tabI

lemma tabMem (rows : List RowQ) : TabMem (tabR rows) (tabI rows) := by
  unfold TabMem tabR tabI
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  refine List.forall₂_same.2 fun r _ => ⟨rfl, ?_⟩
  unfold RowMem
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  exact List.forall₂_same.2 fun e _ => ⟨rfl, mem_ofRatI _⟩

/-- Data side conditions: all row indices `≤ MW`, all entry indices `≤ NZ`. -/
def TabBounds (tabI : List RowI) (NZ MW : ℕ) : Prop :=
  ∀ rI ∈ tabI, rI.1 ≤ MW ∧ ∀ e ∈ rI.2, e.1 ≤ NZ

lemma tabBounds_of_within {N : ℕ} {rows : List RowQ} (hw : tabWithin N rows = true) :
    TabBounds (tabI rows) N (N / 3) := by
  unfold tabWithin at hw
  rw [List.all_eq_true] at hw
  intro rI hrI
  unfold tabI at hrI
  obtain ⟨r, hr, rfl⟩ := List.mem_map.1 hrI
  have h1 := Bool.and_eq_true_iff.1 (hw r hr)
  have h0 := of_decide_eq_true h1.1
  refine ⟨?_, ?_⟩
  · simp only
    omega
  · intro e he
    obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
    have h2 := List.all_eq_true.1 h1.2 e' he'
    rw [decide_eq_true_eq] at h2
    simp only
    omega

/-! ### Soundness of the truncated composition -/

/-- The `n`-th power truncated to `K` coefficients, as an interval list. -/
def powT (K : ℕ) (P : List Ival) : ℕ → List Ival
  | 0 => [ofRatI 1]
  | n + 1 => (convI P (powT K P n)).take K

lemma powsT_eq (K : ℕ) (P : List Ival) :
    ∀ N, powsT K P N = (List.range (N + 1)).map (powT K P) := by
  intro N
  induction N with
  | zero => simp [powsT, powT]
  | succ N ih =>
    have hl : (List.map (powT K P) (List.range (N + 1))).getLastD [] = powT K P N := by
      rw [List.range_succ, List.map_append, List.map_singleton, List.getLastD_concat]
    simp only [powsT, ih, hl]
    rw [List.range_succ (n := N + 1), List.map_append, List.map_singleton]
    rfl

lemma powsT_getD (K : ℕ) (P : List Ival) (N n : ℕ) (hn : n ≤ N) :
    (powsT K P N).getD n [] = powT K P n := by
  rw [powsT_eq, List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range (by omega)]
  rfl

lemma memB_one (N : ℕ) : memB N (1 : ℝ[X]) [ofRatI 1] := by
  have := memB_single (N := N) (mem_ofRatI 1)
  simpa using this

lemma memB_powT {P : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI) (n : ℕ) :
    memB K (P ^ n) (powT K PI n) := by
  induction n with
  | zero => simpa [powT] using memB_one K
  | succ n ih =>
    simp only [powT, pow_succ']
    exact memB_take (memB_conv hP ih)

lemma getD_shiftX (k : ℕ) (R : List Ival) (n : ℕ) :
    (shiftX k R).getD n zeroI = if k ≤ n then R.getD (n - k) zeroI else zeroI := by
  unfold shiftX
  induction k generalizing n with
  | zero => simp
  | succ k ih =>
    cases n with
    | zero => simp [List.replicate_succ]
    | succ n =>
      rw [List.replicate_succ, List.cons_append, List.getD_cons_succ, ih]
      simp only [Nat.add_le_add_iff_right, Nat.add_sub_add_right]

lemma memB_shiftX {K k : ℕ} {r : ℝ[X]} {R : List Ival} (h : memB (K - k) r R) :
    memB K (X ^ k * r) (shiftX k R) := by
  intro n hn
  rw [coeff_X_pow_mul', getD_shiftX]
  by_cases hk : k ≤ n
  · rw [ite_eq_left hk, ite_eq_left hk]
    exact h _ (by omega)
  · rw [ite_eq_right hk, ite_eq_right hk]
    exact mem_zero

lemma memB_rowSumT {P : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI) (NZ : ℕ) :
    ∀ {row : List (ℕ × ℝ)} {rowI : List (ℕ × Ival)}, RowMem row rowI →
      (∀ e ∈ rowI, e.1 ≤ NZ) → memB K (rowPoly P row) (rowSumT K (powsT K PI NZ) rowI) := by
  intro row rowI h
  induction h with
  | nil => intro _; simpa [rowPoly, rowSumT] using memB_zero K
  | @cons e eI row rowI he _ ih =>
    intro hb
    obtain ⟨n, c⟩ := e
    obtain ⟨n', I⟩ := eI
    obtain ⟨rfl, hc⟩ := he
    simp only [rowPoly, rowSumT]
    have hn : n ≤ NZ := hb (n, I) List.mem_cons_self
    have hpow : memB K (P ^ n) ((powsT K PI NZ).getD n []) := by
      rw [powsT_getD K PI NZ n hn]; exact memB_powT hP n
    have h1 : memB K (C c * (X ^ (n / 2) * P ^ n))
        (shiftX (n / 2) ((((powsT K PI NZ).getD n []).take (K - n / 2)).map (mulI I))) := by
      rw [mul_left_comm]
      exact memB_shiftX (memB_C_mul hc (memB_take (memB_mono hpow (Nat.sub_le _ _))))
    exact memB_add h1 (ih fun e he => hb e (List.mem_cons_of_mem _ he))

lemma memB_rowTermT {P Q : ℝ[X]} {PI QI : List Ival} {K : ℕ} (hP : memB K P PI)
    (hQ : memB K Q QI) (NZ MW : ℕ) {r : RowR} {rI : RowI} (hr : r.1 = rI.1 ∧ RowMem r.2 rI.2)
    (hm : rI.1 ≤ MW) (hb : ∀ e ∈ rI.2, e.1 ≤ NZ) :
    memB K (rowTerm P Q r) (rowTermT K (powsT K PI NZ) (powsT K QI MW) rI) := by
  obtain ⟨m, row⟩ := r
  obtain ⟨m', rowI⟩ := rI
  obtain ⟨rfl, hrow⟩ := hr
  unfold rowTerm rowTermT
  simp only at hm hb ⊢
  have hq : memB K (Q ^ m) ((powsT K QI MW).getD m []) := by
    rw [powsT_getD K QI MW m hm]; exact memB_powT hQ m
  exact memB_take (memB_shiftX
    (memB_mono (memB_conv hq (memB_rowSumT hP NZ hrow hb)) (Nat.sub_le _ _)))

lemma memB_sumL {K : ℕ} : ∀ {ps : List ℝ[X]} {Ls : List (List Ival)},
    List.Forall₂ (fun (p : ℝ[X]) (L : List Ival) => memB K p L) ps Ls →
      memB K ps.sum (sumL Ls) := by
  intro ps Ls h
  induction h with
  | nil => simpa [sumL] using memB_zero K
  | cons hp _ ih => simp only [List.sum_cons, sumL]; exact memB_add hp ih

lemma tabPoly_eq_sum (P Q : ℝ[X]) (tab : List RowR) :
    tabPoly P Q tab = (tab.map (rowTerm P Q)).sum := by
  induction tab with
  | nil => rfl
  | cons r rest ih => simp [tabPoly, ih]

lemma bivarT_eq_seq (K : ℕ) (tab : List RowI) (P Q : List Ival) (NZ MW : ℕ) :
    bivarT K tab P Q NZ MW = bivarTSeq K tab P Q NZ MW := by
  unfold bivarT bivarTSeq
  simp only [List.map_map]
  rfl

/-- **Soundness of the truncated bivariate routine.** -/
theorem memB_bivarT {P Q : ℝ[X]} {PI QI : List Ival} {K : ℕ} (hP : memB K P PI)
    (hQ : memB K Q QI) {tab : List RowR} {tabI : List RowI} (ht : TabMem tab tabI)
    {NZ MW : ℕ} (hb : TabBounds tabI NZ MW) :
    memB K (tabPoly P Q tab) (bivarT K tabI PI QI NZ MW) := by
  rw [bivarT_eq_seq, tabPoly_eq_sum]
  unfold bivarTSeq
  apply memB_sumL
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  revert hb
  induction ht with
  | nil => intro; exact List.Forall₂.nil
  | @cons r rI tab tabI hr _ ih =>
    intro hb
    refine List.Forall₂.cons ?_ (ih fun x hx => hb x (List.mem_cons_of_mem _ hx))
    have hb' := hb rI List.mem_cons_self
    exact memB_rowTermT hP hQ NZ MW hr hb'.1 hb'.2

/-! ### The head of the residual -/

/-- Scaled upper bound for the head `Σ_{j < (N+1)/2} |ĥ_j − c·δ_{j0}|` of the residual of the
kernel `ĥ` of the exact table `rows`, with `P`, `Q` given by the coefficient lists `pl`, `ql`. -/
def headInt (N : ℕ) (rows : List RowQ) (pl ql : List ℚ) (c : ℚ) : ℤ :=
  headDev ((N + 1) / 2) (GrotheKernel.tabI rows) (pl.map ofRatI) (ql.map ofRatI) N (N / 3)
    (ofRatI c)

/-- **Soundness of the head computation.** -/
theorem head_sound {N : ℕ} {rows : List RowQ} (hw : tabWithin N rows = true) (pl ql : List ℚ)
    (c : ℚ) :
    (∑ j ∈ range ((N + 1) / 2),
        |∑ p ∈ headIdx N, ((tabVal rows p : ℚ) : ℝ) * (termOf (ofListQ pl) (ofListQ ql) p).coeff j
          - if j = 0 then (c : ℝ) else 0|) * D ≤ (headInt N rows pl ql c : ℝ) := by
  have hB := memB_bivarT (K := (N + 1) / 2) (memB_ofListQ pl _) (memB_ofListQ ql _) (tabMem rows)
    (tabBounds_of_within hw)
  have hc : memB ((N + 1) / 2) (C (-(c : ℝ))) [negI (ofRatI c)] :=
    memB_single (mem_neg (mem_ofRatI c))
  have h := absSumFrom_le (k := 0) (memB_add hB hc)
  rw [← Finset.range_eq_Ico] at h
  refine le_trans (le_of_eq ?_) h
  congr 1
  refine sum_congr rfl fun j _ => ?_
  rw [coeff_add, coeff_C, tabPoly_coeff _ _ hw]
  congr 1
  split_ifs <;> ring

end

end Grothe.Upper
