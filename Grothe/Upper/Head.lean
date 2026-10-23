import Grothe.Upper.Bivariate
import Grothe.Upper.IntervalSound
import GrotheKernel.Table

/-!
# Soundness of the head computation

The kernel routine `GrotheKernel.bivarT` encloses the first `K` radial coefficients of the kernel
polynomial of a finite exact table, `tabPoly P Q rows`.

* `tabPoly_coeff`: that polynomial is the finite sum `Σ_{p ∈ headIdx N} Ê p · termOf p`, where
  `Ê = tabVal rows` is the table as a function (the sum of the listed values of an index);
* `memB_bivarT`: soundness of the truncated composition;
* `head_le_of_check`: if the Boolean check `headOK` accepts, the head of the residual
  `Σ_{j < (N+1)/2} |ĥ_j − c·δ_{j0}|` of the kernel `ĥ` of the table is at most the cap.
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

lemma memB_ofListQ (l : List ℚ) (N : ℕ) : memB N (ofListQ l) (l.map ofRatI) := fun n _ => by
  rw [coeff_ofListQ, ← ofRatI_zero, List.getD_map]
  exact mem_ofRatI _

/-! ### The kernel polynomial of an exact table -/

/-- `Σ_{(n,c) ∈ row} c · X^{⌊n/2⌋} · P^n`. -/
def rowPoly (P : ℝ[X]) (row : List (ℕ × ℚ)) : ℝ[X] :=
  (row.map fun e => C (e.2 : ℝ) * (X ^ (e.1 / 2) * P ^ e.1)).sum

/-- The kernel polynomial `Σ_{(m, row)} X^{⌊m/2⌋} · Q^m · rowPoly row` of an exact table. -/
def tabPoly (P Q : ℝ[X]) (rows : List RowQ) : ℝ[X] :=
  (rows.map fun r => X ^ (r.1 / 2) * (Q ^ r.1 * rowPoly P r.2)).sum

/-- The entries of an exact table with their index pairs `(n, m)`. -/
def flat (rows : List RowQ) : List ((ℕ × ℕ) × ℚ) :=
  rows.flatMap fun r => r.2.map fun e => ((e.1, r.1), e.2)

/-- The table as a function of the index pair `(n, m)`: the sum of the listed values of that
index (zero if the index is not listed). -/
def tabVal (rows : List RowQ) (p : ℕ × ℕ) : ℚ :=
  ((flat rows).map fun e => if e.1 = p then e.2 else 0).sum

lemma tabWithin_iff {N : ℕ} {rows : List RowQ} :
    tabWithin N rows = true ↔ ∀ r ∈ rows, 3 * r.1 ≤ N ∧ ∀ e ∈ r.2, e.1 + 3 * r.1 ≤ N := by
  simp [tabWithin]

lemma tabPoly_eq_flat (P Q : ℝ[X]) (rows : List RowQ) :
    tabPoly P Q rows
      = ((flat rows).map fun e : (ℕ × ℕ) × ℚ => C ((e.2 : ℚ) : ℝ) * termOf P Q e.1).sum := by
  induction rows with
  | nil => rfl
  | cons r rest ih =>
    simp only [tabPoly, flat, List.map_cons, List.sum_cons, List.flatMap_cons, List.map_append,
      List.sum_append] at ih ⊢
    rw [ih, rowPoly, ← List.sum_map_mul_left, ← List.sum_map_mul_left, List.map_map]
    congr 2
    refine List.map_congr_left fun e _ => ?_
    simp only [Function.comp, termOf, shiftOf, pow_add]
    ring

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

/-- **The kernel polynomial of the table is the finite sum over `headIdx N`.** -/
theorem tabPoly_coeff (P Q : ℝ[X]) {N : ℕ} {rows : List RowQ} (hw : tabWithin N rows = true)
    (j : ℕ) : (tabPoly P Q rows).coeff j
      = ∑ p ∈ headIdx N, ((tabVal rows p : ℚ) : ℝ) * (termOf P Q p).coeff j := by
  have hS : ∀ e ∈ flat rows, e.1 ∈ headIdx N := by
    intro e he
    obtain ⟨r, hr, he⟩ := List.mem_flatMap.1 he
    obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
    exact mem_headIdx.2 ((tabWithin_iff.1 hw r hr).2 e' he')
  rw [tabPoly_eq_flat, list_sum_eq_finset P Q (headIdx N) _ hS, finsetSum_coeff]
  exact sum_congr rfl fun p _ => by rw [coeff_C_mul]; rfl

/-! ### Soundness of the truncated composition -/

lemma getD_iterL (f : List Ival → List Ival) :
    ∀ (n : ℕ) (L : List Ival) (k : ℕ), k < n → (iterL f n L).getD k [] = f^[k] L
  | 0, _, _, hk => absurd hk (Nat.not_lt_zero _)
  | n + 1, L, 0, _ => rfl
  | n + 1, L, k + 1, hk => by
    rw [iterL, List.getD_cons_succ, getD_iterL f n (f L) k (by omega),
      Function.iterate_succ_apply]

lemma memB_pow {P : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI) (N n : ℕ) (hn : n ≤ N) :
    memB K (P ^ n) ((powsT K PI N).getD n []) := by
  rw [powsT, getD_iterL _ _ _ _ (by omega)]
  induction n with
  | zero => simpa using memB_single (N := K) (mem_ofRatI 1)
  | succ n ih =>
    rw [Function.iterate_succ_apply', pow_succ']
    exact memB_take (memB_conv hP (ih (by omega)))

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
  split_ifs with hk
  · exact h _ (by omega)
  · exact mem_zero

lemma memB_rowSumT {P : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI) (NZ : ℕ)
    {row : List (ℕ × ℚ)} (hb : ∀ e ∈ row, e.1 ≤ NZ) :
    memB K (rowPoly P row) (rowSumT K (powsT K PI NZ) (row.map fun e => (e.1, ofRatI e.2))) := by
  induction row with
  | nil => simpa [rowPoly, rowSumT] using memB_zero K
  | cons e rest ih =>
    obtain ⟨n, c⟩ := e
    have h1 : memB K (C (c : ℝ) * (X ^ (n / 2) * P ^ n))
        (shiftX (n / 2) ((((powsT K PI NZ).getD n []).take (K - n / 2)).map (mulI (ofRatI c)))) := by
      rw [mul_left_comm]
      exact memB_shiftX (memB_C_mul (mem_ofRatI c) (memB_take
        (memB_mono (memB_pow hP NZ n (hb _ List.mem_cons_self)) (Nat.sub_le _ _))))
    exact memB_add h1 (ih fun e he => hb e (List.mem_cons_of_mem _ he))

/-- **Soundness of the truncated bivariate routine.** -/
theorem memB_bivarT {P Q : ℝ[X]} {PI QI : List Ival} {K : ℕ} (hP : memB K P PI)
    (hQ : memB K Q QI) {rows : List RowQ} {NZ MW : ℕ}
    (hb : ∀ r ∈ rows, r.1 ≤ MW ∧ ∀ e ∈ r.2, e.1 ≤ NZ) :
    memB K (tabPoly P Q rows) (bivarT K (tabI rows) PI QI NZ MW) := by
  have e : bivarT K (tabI rows) PI QI NZ MW
      = sumL ((tabI rows).map (rowTermT K (powsT K PI NZ) (powsT K QI MW))) := by
    rfl
  rw [e]
  clear e
  unfold tabPoly tabI
  induction rows with
  | nil => simpa [sumL] using memB_zero K
  | cons r rest ih =>
    simp only [List.map_cons, List.sum_cons, sumL]
    have hr := hb r List.mem_cons_self
    refine memB_add ?_ (ih fun r hr => hb r (List.mem_cons_of_mem _ hr))
    exact memB_take (memB_shiftX (memB_mono (memB_conv (memB_pow hQ MW r.1 hr.1)
      (memB_rowSumT hP NZ hr.2)) (Nat.sub_le _ _)))

/-! ### The head of the residual -/

/-- **Soundness of the head check.**  If `headOK` accepts, the head
`Σ_{j < (N+1)/2} |ĥ_j − c·δ_{j0}|` of the residual of the kernel `ĥ` of the table is at most
`cap`. -/
theorem head_le_of_check {N : ℕ} {rows : List RowQ} {pl ql : List ℚ} {c cap : ℚ}
    (h : headOK N rows pl ql c cap = true) :
    ∑ j ∈ range ((N + 1) / 2),
        |∑ p ∈ headIdx N, ((tabVal rows p : ℚ) : ℝ) * (termOf (ofListQ pl) (ofListQ ql) p).coeff j
          - if j = 0 then (c : ℝ) else 0| ≤ cap := by
  simp only [headOK, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hw, hcap⟩ := h
  have hB := memB_bivarT (K := (N + 1) / 2) (memB_ofListQ pl _) (memB_ofListQ ql _)
    (rows := rows) (NZ := N) (MW := N / 3) fun r hr => by
      have := tabWithin_iff.1 hw r hr
      exact ⟨by omega, fun e he => by have := this.2 e he; omega⟩
  have hc : memB ((N + 1) / 2) (C (-(c : ℝ))) [negI (ofRatI c)] :=
    memB_single (mem_neg (mem_ofRatI c))
  have h1 := absSum_le (memB_add hB hc)
  have h2 : (headInt N rows pl ql c : ℝ) ≤ cap * D := (Int.cast_le.2 hcap).trans (ofRatLo_le _)
  refine le_of_mul_le_mul_right ((le_of_eq ?_).trans (h1.trans h2)) D_pos
  congr 1
  refine sum_congr rfl fun j _ => ?_
  rw [coeff_add, coeff_C, tabPoly_coeff _ _ hw]
  congr 1
  split_ifs <;> ring

end

end Grothe.Upper
