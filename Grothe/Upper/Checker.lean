import Grothe.Upper.CheckerDefs
import Grothe.Upper.PolyBridge

/-!
# The finite certificate: soundness of the concrete computation

`finite_certificate_exact` proves `FiniteCertificate (dloIntFinal / D)` *without* any
evaluation: it is the composition of the soundness lemmas.  Evaluating `dloIntFinal` (by
`native_decide`, see `Value.lean`) then yields an explicit rational `Dlo`.
-/

namespace Grothe.Upper

open GrotheKernel Polynomial
open scoped ComplexConjugate

/-! ### Data facts -/

lemma wtQ_pos (i : Fin branches) : 0 < wtQ i := by revert i; native_decide

lemma wt_pos (i : Fin branches) : 0 < wt i := by
  unfold wt; exact_mod_cast wtQ_pos i

lemma mem_wt (i : Fin branches) : mem (wt i) (wtI i) := mem_ofRatI _

lemma cutoff_le_fullLen (i : Fin branches) (h : tag i = .origin ∨ tag i = .originStar) :
    cutoff ≤ fullLen i := by
  revert i; native_decide

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

lemma hRatQ_getD (k : ℕ) (hk : k < cutoff) : hRatQ.getD k 0 = hRat k := by
  show (hRatFrom 0 (hRat 0) cutoff).getD k 0 = _
  rw [hRatFrom_getD cutoff 0 k hk, Nat.zero_add]

/-- The real coefficient list `h_j/π`, `j < cutoff`. -/
noncomputable def hRats : List ℝ := hRatQ.map (Rat.cast : ℚ → ℝ)

lemma hRats_getD (k : ℕ) (hk : k < cutoff) : hRats.getD k 0 = (hRat k : ℝ) := by
  unfold hRats; rw [getD_map_cast, hRatQ_getD k hk]

lemma forall₂_hRats : List.Forall₂ mem hRats hRatL := by
  unfold hRats hRatL
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  exact List.forall₂_same.2 fun q _ => mem_ofRatI q

lemma hRatQ_mem_nonneg {q : ℚ} (hq : q ∈ hRatQ) : 0 ≤ q := by
  obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hq
  have hk' : k < cutoff := by simpa [hRatQ, hRatFrom_length] using hk
  have := hRatQ_getD k hk'
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hk, Option.getD_some] at this
  rw [this]
  exact hRat_nonneg k

lemma lowerOf_hRats : LowerOf hRats hRatLo := by
  unfold LowerOf hRats hRatLo
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  exact List.forall₂_same.2 fun q hq => ⟨ofRatLo_nonneg (hRatQ_mem_nonneg hq), ofRatLo_le q⟩

/-! ### The scalar columns -/

/-- Enclosure of the exact scalar profiles. -/
lemma mem_sProf (i : Fin branches) (n : ℕ) (hn : n < cutoff) :
    mem ((sProf (rowQ i) n : ℚ) : ℝ) ((sProfL i).getD n zeroI) := by
  have hP : ∀ N, memB N (ofListQ (rowQ i)) (rowI i) := fun N => memB_ofListQ _ _
  have key := memB_composeI hP forall₂_hRats n hn
  unfold sProfL
  rw [horner_eq_polySum, ← compose_getD_eq_coeff] at key
  rw [sProf_eq_compose]
  have e : compose (fun j => (hRat j : ℝ)) (ofListQ (rowQ i)) n
      = compose (fun j => hRats.getD j 0) (ofListQ (rowQ i)) n :=
    compose_congr _ _ fun j hj => by rw [hRats_getD j (by omega)]
  rw [e]
  exact key

lemma mem_col_scalar (i : Fin branches) (n : ℕ) (hn : n < cutoff) :
    mem (Real.pi * (sProf (rowQ i) n : ℝ)) (((sProfL i).map (mulI piI)).getD n zeroI) := by
  rw [getD_map_mulI]
  exact mem_mul mem_pi (mem_sProf i n hn)

/-- Lower bound of the majorant sum. -/
lemma majSumLo_le (i : Fin branches) :
    (majSumLo i : ℝ) ≤ (∑ n ∈ Finset.range cutoff, Real.pi * (sProf (absRow i) n : ℝ)) * D := by
  have hP : ∀ N, memLoB N (ofListQ (absRow i)) ((absRow i).map ofRatLo) := fun N =>
    memLoB_ofListQ_abs _ _
  have key := memLoB_composeLo hP (N := cutoff) lowerOf_hRats
  have hS : memLo cutoff (fun n => (sProf (absRow i) n : ℝ))
      (composeLo cutoff ((absRow i).map ofRatLo) hRatLo) := by
    intro n hn
    have k := key n hn
    rw [horner_eq_polySum, ← compose_getD_eq_coeff] at k
    beta_reduce
    rw [sProf_eq_compose]
    have e : compose (fun j => (hRat j : ℝ)) (ofListQ (absRow i)) n
        = compose (fun j => hRats.getD j 0) (ofListQ (absRow i)) n :=
      compose_congr _ _ fun j hj => by rw [hRats_getD j (by omega)]
    rw [e]
    exact k
  have hπ := memLo_map_mulLo pi_lo hS
  unfold majSumLo
  refine sum_le_of_memLo hπ ?_
  simp only [List.length_map, composeLo]
  exact List.length_take_le _ _

/-! ### The origin columns -/

/-- The real list of the truncated origin coefficients. -/
noncomputable def headList (A B : ℕ → ℂ) : List ℝ := List.ofFn fun n : Fin modes => headCoeff A B n

lemma headList_getD (A B : ℕ → ℂ) : (fun j => (headList A B).getD j 0) = headCoeff A B := by
  funext j
  by_cases hj : j < modes
  · unfold headList; rw [getD_ofFn_lt _ _ j hj]
  · unfold headList
    rw [getD_ofFn_ge _ _ j (by omega)]
    unfold headCoeff
    rw [ite_eq_right hj]

lemma mem_headCoeff {reLo reHi imLo imHi reLo' reHi' imLo' imHi' : List ℚ} {A B : ℕ → ℂ}
    (hA : InBox reLo reHi imLo imHi A) (hB : InBox reLo' reHi' imLo' imHi' B) (n : ℕ)
    (hn : n < modes) :
    mem (headCoeff A B n) (originI reLo reHi imLo imHi reLo' reHi' imLo' imHi' n) := by
  unfold headCoeff originI
  rw [ite_eq_left hn]
  obtain ⟨⟨a1, a2⟩, ⟨a3, a4⟩⟩ := hA n hn
  obtain ⟨⟨b1, b2⟩, ⟨b3, b4⟩⟩ := hB n hn
  have e : (A n * conj (B n)).re = (A n).re * (B n).re + (A n).im * (B n).im := by
    simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im]; ring
  rw [e]
  exact mem_add (mem_mul (mem_boxI a1 a2) (mem_boxI b1 b2))
    (mem_mul (mem_boxI a3 a4) (mem_boxI b3 b4))

lemma forall₂_headA {A B : ℕ → ℂ} (hA : InBox aReLo aReHi aImLo aImHi A)
    (hB : InBox bReLo bReHi bImLo bImHi B) : List.Forall₂ mem (headList A B) headA :=
  forall₂_ofFn _ _ fun n => mem_headCoeff hA hB n n.2

lemma forall₂_headS {A B : ℕ → ℂ} (hA : InBox asReLo asReHi asImLo asImHi A)
    (hB : InBox bsReLo bsReHi bsImLo bsImHi B) : List.Forall₂ mem (headList A B) headS :=
  forall₂_ofFn _ _ fun n => mem_headCoeff hA hB n n.2

/-- Enclosure of the full finite composition of an origin branch. -/
lemma memS_originCol (i : Fin branches) {A B : ℕ → ℂ} {head : List Ival}
    (hh : List.Forall₂ mem (headList A B) head) :
    memS (fullLen i) (compose (headCoeff A B) (polyOf i)) (originCol i head) := by
  have hP : ∀ N, memB N (polyOf i) (rowI i) := fun N => memB_ofListQ _ _
  have key := memB_composeI hP (N := fullLen i) hh
  intro n hn
  have k := key n hn
  rw [horner_eq_polySum, ← compose_getD_eq_coeff, headList_getD] at k
  exact k

/-! ### The branch columns -/

lemma colOf_eq (i : Fin branches) : colOf i = branchCol i := by
  unfold colOf allCols
  rw [List.map_ofFn, getD_ofFn_lt _ _ i i.2]
  rfl

lemma absSumFrom_nonneg (k : ℕ) (L : List Ival) : 0 ≤ absSumFrom k L := by
  unfold absSumFrom
  rw [foldl_add_eq, zero_add]
  exact List.sum_nonneg fun x hx => by
    obtain ⟨y, _, rfl⟩ := List.mem_map.1 hx
    exact absUpper_nonneg y

/-- The computed column of branch `i` encloses its exact column. -/
lemma memS_colOf {A B A' B' : ℕ → ℂ} (hA : InBox aReLo aReHi aImLo aImHi A)
    (hB : InBox bReLo bReHi bImLo bImHi B) (hA' : InBox asReLo asReHi asImLo asImHi A')
    (hB' : InBox bsReLo bsReHi bsImLo bsImHi B') (i : Fin branches) :
    memS cutoff (col A B A' B' i) (colOf i).1 := by
  rw [colOf_eq]
  unfold branchCol col
  rcases h : tag i with _ | r | _ | _
  · simp only
    exact fun n hn => mem_col_scalar i n hn
  · simp only
    exact fun n hn => mem_col_scalar i n hn
  · simp only
    exact memS_take (memS_mono (memS_originCol i (forall₂_headA hA hB))
      (cutoff_le_fullLen i (Or.inl h)))
  · simp only
    exact memS_take (memS_mono (memS_originCol i (forall₂_headS hA' hB'))
      (cutoff_le_fullLen i (Or.inr h)))

/-- The computed tail budget of branch `i` bounds its exact tail budget. -/
lemma tail_colOf {A B A' B' : ℕ → ℂ} (hA : InBox aReLo aReHi aImLo aImHi A)
    (hB : InBox bReLo bReHi bImLo bImHi B) (hA' : InBox asReLo asReHi asImLo asImHi A')
    (hB' : InBox bsReLo bsReHi bsImLo bsImHi B') (i : Fin branches) :
    0 ≤ (colOf i).2 ∧ (majTail i + highTail A B A' B' i) * D ≤ ((colOf i).2 : ℝ) := by
  rw [colOf_eq]
  unfold branchCol majTail highTail col
  have hD := D_pos
  rcases h : tag i with _ | r | _ | _
  · simp only
    refine ⟨le_max_left _ _, ?_⟩
    have := majSumLo_le i
    push_cast
    refine le_trans ?_ (le_max_right _ _)
    rw [add_zero, sub_mul, one_mul]
    linarith
  · simp
  · simp only
    refine ⟨absSumFrom_nonneg _ _, ?_⟩
    rw [zero_add]
    exact absSumFrom_le (memS_originCol i (forall₂_headA hA hB))
  · simp only
    refine ⟨absSumFrom_nonneg _ _, ?_⟩
    rw [zero_add]
    exact absSumFrom_le (memS_originCol i (forall₂_headS hA' hB'))

/-! ### The certificate -/

lemma Icc_eq_Ico : Finset.Icc 1 (cutoff - 1) = Finset.Ico 1 cutoff := by
  ext n; simp only [Finset.mem_Icc, Finset.mem_Ico]; omega

/-- **Soundness of the finite certificate** for the exactly computed scaled integer. -/
theorem finite_certificate_exact :
    FiniteCertificate ((dloIntFinal : ℚ) / ((D : ℤ) : ℚ)) := by
  intro A B A' B' hA hB hA' hB'
  have hcol := fun i => memS_colOf hA hB hA' hB' i
  have htail := fun i => tail_colOf hA hB hA' hB' i
  have hmix : memS cutoff (mix A B A' B') mixCol := memS_mixL mem_wt hcol
  have hD := D_pos
  have h1 : (headLo mixCol : ℝ) ≤ mix A B A' B' 0 * D := headLo_le (by decide) hmix
  have h2 : (∑ n ∈ Finset.Icc 1 (cutoff - 1), |mix A B A' B' n|) * D
      ≤ (absSumFrom 1 mixCol : ℝ) := by
    rw [Icc_eq_Ico]; exact absSumFrom_le hmix
  have h3 : (∑ i, wt i * (majTail i + highTail A B A' B' i)) * D ≤ (tailsInt : ℝ) := by
    unfold tailsInt
    rw [List.sum_ofFn]
    push_cast
    rw [Finset.sum_mul]
    exact Finset.sum_le_sum fun i _ =>
      wTailUp_le (mem_wt i) (wt_pos i) (htail i).1 (htail i).2
  rw [Rat.cast_div, Rat.cast_intCast, Rat.cast_intCast, div_le_iff₀ hD, sub_mul, sub_mul]
  unfold dloIntFinal
  push_cast
  linarith

/-- `FiniteCertificate` is monotone: any smaller `Dlo` also works. -/
lemma FiniteCertificate.mono {Dlo Dlo' : ℚ} (h : FiniteCertificate Dlo) (hle : Dlo' ≤ Dlo) :
    FiniteCertificate Dlo' := by
  intro A B A' B' hA hB hA' hB'
  have := h A B A' B' hA hB hA' hB'
  have hle' : (Dlo' : ℝ) ≤ Dlo := by exact_mod_cast hle
  linarith

end Grothe.Upper
