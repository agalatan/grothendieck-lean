import Grothe.Upper.IntervalSound
import Grothe.Upper.Composition
import GrotheKernel.Bivar

/-!
# Two-coordinate roundings: soundness of the bivariate composition and the table tail

A two-coordinate rounding has the radial kernel `K(t) = Σ_{n,m} μ[n,m] ρ(t)^n σ(t)^m` with
`ρ(t) = t·P(t²)`, `σ(t) = t·Q(t²)` and a table `μ` supported on `n + m` odd.  Its radial
coefficient sequence is the coefficient sequence of (writing `X = t²`)

  `B(X) = Σ_{(n,m)} μ[n,m] · X^{⌊n/2⌋ + ⌊m/2⌋} · P^n · Q^m`,

an infinite sum of polynomials.  The certificate knows a finite part of the table (`tabPoly`,
enclosed by `GrotheKernel.bivarFull`) and only the mass of the rest.

* `memB_bivarFull`: the kernel routine encloses every coefficient of the known part;
* `memS_bivarCol`, `bivarCol_tail`: the retained column and the discarded coefficients;
* `tsum_abs_unknown_le_split`: when `‖P‖_𝒜, ‖Q‖_𝒜 ≤ 1`, the unknown part of a summable table,
  of mass at most `UW` on the indices with `m > MW` and at most `UZ` on the others (`n > NZ`), has
  coefficient norm at most `UZ · ‖P‖_𝒜^{NZ+1} + UW · ‖Q‖_𝒜^{MW+1}`;
* `bivar_remainder_le_split`: hence the true kernel is the retained known part plus a remainder
  bounded by the discarded known coefficients plus that quantity, which is exactly what
  `bound_of_branches` consumes.

(`l1_unknown_le`, `tsum_abs_unknown_le`, `bivar_remainder_le` are the versions with a single
mass bound `T` and the factor `max(‖P‖_𝒜^{NZ+1}, ‖Q‖_𝒜^{MW+1})`.)
-/

namespace Grothe.Upper

open GrotheKernel Polynomial Finset

noncomputable section

/-! ### The known part of the table as a polynomial -/

/-- A real table row: the `m` index and its `(n, μ[n,m])` entries. -/
abbrev RowR := ℕ × List (ℕ × ℝ)

/-- `Σ_{(n,c) ∈ row} c · X^{⌊n/2⌋} · P^n`. -/
def rowPoly (P : ℝ[X]) : List (ℕ × ℝ) → ℝ[X]
  | [] => 0
  | (n, c) :: rest => C c * (X ^ (n / 2) * P ^ n) + rowPoly P rest

/-- The contribution `X^{⌊m/2⌋} · Q^m · rowPoly` of one row. -/
def rowTerm (P Q : ℝ[X]) (r : RowR) : ℝ[X] := X ^ (r.1 / 2) * (Q ^ r.1 * rowPoly P r.2)

/-- The known part `B` of the kernel polynomial. -/
def tabPoly (P Q : ℝ[X]) : List RowR → ℝ[X]
  | [] => 0
  | r :: rest => rowTerm P Q r + tabPoly P Q rest

/-- The interval row encloses the real row (same indices, enclosed values). -/
def RowMem (row : List (ℕ × ℝ)) (rowI : List (ℕ × Ival)) : Prop :=
  List.Forall₂ (fun (e : ℕ × ℝ) (eI : ℕ × Ival) => e.1 = eI.1 ∧ mem e.2 eI.2) row rowI

/-- The interval table encloses the real table. -/
def TabMem (tab : List RowR) (tabI : List RowI) : Prop :=
  List.Forall₂ (fun (r : RowR) (rI : RowI) => r.1 = rI.1 ∧ RowMem r.2 rI.2) tab tabI

/-! ### Powers -/

/-- The `n`-th power as an interval list. -/
def powI (P : List Ival) : ℕ → List Ival
  | 0 => [ofRatI 1]
  | n + 1 => convI P (powI P n)

lemma powsI_eq (P : List Ival) : ∀ N, powsI P N = (List.range (N + 1)).map (powI P) := by
  intro N
  induction N with
  | zero => simp [powsI, powI]
  | succ N ih =>
    have hl : (List.map (powI P) (List.range (N + 1))).getLastD [] = powI P N := by
      rw [List.range_succ, List.map_append, List.map_singleton, List.getLastD_concat]
    simp only [powsI, ih, hl]
    rw [List.range_succ (n := N + 1), List.map_append, List.map_singleton]
    rfl

lemma powsI_getD (P : List Ival) (N n : ℕ) (hn : n ≤ N) : (powsI P N).getD n [] = powI P n := by
  rw [powsI_eq, List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range (by omega)]
  rfl

lemma memB_one (N : ℕ) : memB N (1 : ℝ[X]) [ofRatI 1] := by
  have := memB_single (N := N) (mem_ofRatI 1)
  simpa using this

lemma memB_powI {P : ℝ[X]} {PI : List Ival} (hP : ∀ N, memB N P PI) (n : ℕ) :
    ∀ N, memB N (P ^ n) (powI PI n) := by
  intro N
  induction n generalizing N with
  | zero => simpa [powI] using memB_one N
  | succ n ih =>
    simp only [powI, pow_succ']
    exact memB_conv (hP N) (ih N)

/-! ### Shifts, rows and the full polynomial -/

lemma memB_shiftX {r : ℝ[X]} {R : List Ival} (h : ∀ N, memB N r R) (k : ℕ) :
    ∀ N, memB N (X ^ k * r) (shiftX k R) := by
  induction k with
  | zero => intro N; simpa [shiftX] using h N
  | succ k ih =>
    intro N
    cases N with
    | zero => intro n hn; omega
    | succ N =>
      have := memB_X_mul (ih N)
      rw [pow_succ', mul_assoc]
      simpa [shiftX, List.replicate_succ] using this

lemma memB_rowSumI {P : ℝ[X]} {PI : List Ival} (hP : ∀ N, memB N P PI) (NZ : ℕ) :
    ∀ {row : List (ℕ × ℝ)} {rowI : List (ℕ × Ival)}, RowMem row rowI →
      (∀ e ∈ rowI, e.1 ≤ NZ) → ∀ N, memB N (rowPoly P row) (rowSumI (powsI PI NZ) rowI) := by
  intro row rowI h
  induction h with
  | nil => intro _ N; simpa [rowPoly, rowSumI] using memB_zero N
  | @cons e eI row rowI he _ ih =>
    intro hb N
    obtain ⟨n, c⟩ := e
    obtain ⟨n', I⟩ := eI
    obtain ⟨rfl, hc⟩ := he
    simp only [rowPoly, rowSumI]
    have hn : n ≤ NZ := hb (n, I) (List.mem_cons_self)
    have hpow : ∀ N, memB N (P ^ n) ((powsI PI NZ).getD n []) := by
      intro N; rw [powsI_getD PI NZ n hn]; exact memB_powI hP n N
    have h1 : ∀ N, memB N (C c * (X ^ (n / 2) * P ^ n))
        (shiftX (n / 2) (((powsI PI NZ).getD n []).map (mulI I))) := by
      intro N
      have := memB_shiftX (fun N => memB_C_mul hc (hpow N)) (n / 2) N
      rw [mul_left_comm]
      exact this
    exact memB_add (h1 N) (ih (fun e he => hb e (List.mem_cons_of_mem _ he)) N)

lemma memB_rowTermI {P Q : ℝ[X]} {PI QI : List Ival} (hP : ∀ N, memB N P PI)
    (hQ : ∀ N, memB N Q QI) (NZ MW : ℕ) {r : RowR} {rI : RowI} (hr : r.1 = rI.1 ∧ RowMem r.2 rI.2)
    (hm : rI.1 ≤ MW) (hb : ∀ e ∈ rI.2, e.1 ≤ NZ) :
    ∀ N, memB N (rowTerm P Q r) (rowTermI (powsI PI NZ) (powsI QI MW) rI) := by
  intro N
  obtain ⟨m, row⟩ := r
  obtain ⟨m', rowI⟩ := rI
  obtain ⟨rfl, hrow⟩ := hr
  unfold rowTerm rowTermI
  simp only at hm hb ⊢
  have hq : ∀ N, memB N (Q ^ m) ((powsI QI MW).getD m []) := by
    intro N; rw [powsI_getD QI MW m hm]; exact memB_powI hQ m N
  exact memB_shiftX (fun N => memB_conv (hq N) (memB_rowSumI hP NZ hrow hb N)) (m / 2) N

lemma memB_sumL : ∀ {ps : List ℝ[X]} {Ls : List (List Ival)},
    List.Forall₂ (fun (p : ℝ[X]) (L : List Ival) => ∀ N, memB N p L) ps Ls →
      ∀ N, memB N ps.sum (sumL Ls) := by
  intro ps Ls h
  induction h with
  | nil => intro N; simpa [sumL] using memB_zero N
  | cons hp _ ih => intro N; simp only [List.sum_cons, sumL]; exact memB_add (hp N) (ih N)

lemma tabPoly_eq_sum (P Q : ℝ[X]) (tab : List RowR) :
    tabPoly P Q tab = (tab.map (rowTerm P Q)).sum := by
  induction tab with
  | nil => rfl
  | cons r rest ih => simp [tabPoly, ih]

/-- Data side conditions: all row indices `≤ MW`, all entry indices `≤ NZ`. -/
def TabBounds (tabI : List RowI) (NZ MW : ℕ) : Prop :=
  ∀ rI ∈ tabI, rI.1 ≤ MW ∧ ∀ e ∈ rI.2, e.1 ≤ NZ

lemma bivarFull_eq_seq (tab : List RowI) (P Q : List Ival) (NZ MW : ℕ) :
    bivarFull tab P Q NZ MW = bivarFullSeq tab P Q NZ MW := by
  unfold bivarFull bivarFullSeq
  simp only [List.map_map]
  rfl

/-- **Soundness of the bivariate routine.** -/
theorem memB_bivarFull {P Q : ℝ[X]} {PI QI : List Ival} (hP : ∀ N, memB N P PI)
    (hQ : ∀ N, memB N Q QI) {tab : List RowR} {tabI : List RowI} (ht : TabMem tab tabI)
    {NZ MW : ℕ} (hb : TabBounds tabI NZ MW) :
    ∀ N, memB N (tabPoly P Q tab) (bivarFull tabI PI QI NZ MW) := by
  rw [bivarFull_eq_seq, tabPoly_eq_sum]
  unfold bivarFullSeq
  apply memB_sumL
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  revert hb
  induction ht with
  | nil => intro; exact List.Forall₂.nil
  | @cons r rI tab tabI hr _ ih =>
    intro hb
    refine List.Forall₂.cons ?_ (ih fun x hx => hb x (List.mem_cons_of_mem _ hx))
    have hb' := hb rI (List.mem_cons_self)
    exact memB_rowTermI hP hQ NZ MW hr hb'.1 hb'.2

/-- The retained column encloses the first `K` coefficients. -/
theorem memS_bivarCol {P Q : ℝ[X]} {PI QI : List Ival} (hP : ∀ N, memB N P PI)
    (hQ : ∀ N, memB N Q QI) {tab : List RowR} {tabI : List RowI} (ht : TabMem tab tabI)
    {NZ MW : ℕ} (hb : TabBounds tabI NZ MW) (K : ℕ) :
    memS K (tabPoly P Q tab).coeff (bivarCol tabI PI QI NZ MW K).1 :=
  memS_take (memB_bivarFull hP hQ ht hb K)

lemma absSumFrom_nonneg_bivar (k : ℕ) (L : List Ival) : 0 ≤ absSumFrom k L := by
  unfold absSumFrom
  rw [foldl_add_eq, zero_add]
  exact List.sum_nonneg fun x hx => by
    obtain ⟨y, _, rfl⟩ := List.mem_map.1 hx
    exact absUpper_nonneg y

/-- The discarded coefficients are bounded by the computed scaled integer, for every `N`. -/
theorem bivarCol_tail {P Q : ℝ[X]} {PI QI : List Ival} (hP : ∀ N, memB N P PI)
    (hQ : ∀ N, memB N Q QI) {tab : List RowR} {tabI : List RowI} (ht : TabMem tab tabI)
    {NZ MW : ℕ} (hb : TabBounds tabI NZ MW) (K N : ℕ) :
    0 ≤ (bivarCol tabI PI QI NZ MW K).2 ∧
      (∑ n ∈ Ico K N, |(tabPoly P Q tab).coeff n|) * D ≤ ((bivarCol tabI PI QI NZ MW K).2 : ℝ) :=
  ⟨absSumFrom_nonneg_bivar _ _, absSumFrom_le (memB_bivarFull hP hQ ht hb N)⟩

/-! ### The unknown part of the table -/

/-- The index shift `⌊n/2⌋ + ⌊m/2⌋` (`= (n+m−1)/2` for `n+m` odd). -/
def shiftOf (p : ℕ × ℕ) : ℕ := p.1 / 2 + p.2 / 2

/-- The monomial-like polynomial `X^{shift} · P^n · Q^m` of an index pair. -/
def termOf (P Q : ℝ[X]) (p : ℕ × ℕ) : ℝ[X] := X ^ shiftOf p * (P ^ p.1 * Q ^ p.2)

lemma l1_termOf_le (P Q : ℝ[X]) (p : ℕ × ℕ) : l1 (termOf P Q p) ≤ l1 P ^ p.1 * l1 Q ^ p.2 := by
  unfold termOf
  have hX : l1 (X ^ shiftOf p) ≤ 1 := (l1_pow_le X _).trans (by rw [l1_X, one_pow])
  have hPp : l1 (P ^ p.1) ≤ l1 P ^ p.1 := l1_pow_le P _
  have hQp : l1 (Q ^ p.2) ≤ l1 Q ^ p.2 := l1_pow_le Q _
  calc l1 (X ^ shiftOf p * (P ^ p.1 * Q ^ p.2))
      ≤ l1 (X ^ shiftOf p) * (l1 (P ^ p.1) * l1 (Q ^ p.2)) :=
        (l1_mul_le _ _).trans (mul_le_mul_of_nonneg_left (l1_mul_le _ _) (l1_nonneg _))
    _ ≤ 1 * (l1 P ^ p.1 * l1 Q ^ p.2) :=
        mul_le_mul hX (mul_le_mul hPp hQp (l1_nonneg _) (pow_nonneg (l1_nonneg _) _))
          (mul_nonneg (l1_nonneg _) (l1_nonneg _)) zero_le_one
    _ = _ := one_mul _

lemma pow_mul_pow_le_one {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (n m : ℕ) :
    l1 P ^ n * l1 Q ^ m ≤ 1 :=
  calc l1 P ^ n * l1 Q ^ m ≤ 1 * 1 :=
        mul_le_mul (pow_le_one₀ (l1_nonneg _) hP) (pow_le_one₀ (l1_nonneg _) hQ)
          (pow_nonneg (l1_nonneg _) _) zero_le_one
    _ = 1 := one_mul _

/-- Outside the known box, `‖P‖^n ‖Q‖^m ≤ max(‖P‖^{NZ+1}, ‖Q‖^{MW+1})`. -/
lemma pow_mul_pow_le_max {a b : ℝ} (ha0 : 0 ≤ a) (ha1 : a ≤ 1) (hb0 : 0 ≤ b) (hb1 : b ≤ 1)
    {n m NZ MW : ℕ} (h : NZ < n ∨ MW < m) :
    a ^ n * b ^ m ≤ max (a ^ (NZ + 1)) (b ^ (MW + 1)) := by
  rcases h with h | h
  · calc a ^ n * b ^ m ≤ a ^ n * 1 := by gcongr; exact pow_le_one₀ hb0 hb1
      _ = a ^ n := mul_one _
      _ ≤ a ^ (NZ + 1) := pow_le_pow_of_le_one ha0 ha1 (by omega)
      _ ≤ _ := le_max_left _ _
  · calc a ^ n * b ^ m ≤ 1 * b ^ m := by gcongr; exact pow_le_one₀ ha0 ha1
      _ = b ^ m := one_mul _
      _ ≤ b ^ (MW + 1) := pow_le_pow_of_le_one hb0 hb1 (by omega)
      _ ≤ _ := le_max_right _ _

/-- **Finite unknown part.** -/
theorem l1_unknown_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (S : Finset (ℕ × ℕ)) {NZ MW : ℕ} (hS : ∀ p ∈ S, NZ < p.1 ∨ MW < p.2) :
    l1 (∑ p ∈ S, C (μ p) * termOf P Q p)
      ≤ (∑ p ∈ S, |μ p|) * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
  calc l1 (∑ p ∈ S, C (μ p) * termOf P Q p)
      ≤ ∑ p ∈ S, l1 (C (μ p) * termOf P Q p) := l1_sum_le _ _
    _ ≤ ∑ p ∈ S, |μ p| * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
        refine sum_le_sum fun p hp => ?_
        refine (l1_C_mul_le _ _).trans (mul_le_mul_of_nonneg_left ?_ (abs_nonneg _))
        exact (l1_termOf_le P Q p).trans
          (pow_mul_pow_le_max (l1_nonneg P) hP (l1_nonneg Q) hQ (hS p hp))
    _ = _ := by rw [sum_mul]

/-- The infinite unknown part, coefficientwise: `U j = Σ'_{p ∉ Kn} μ p · [X^j] termOf p`. -/
def unknownCoeff (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (Kn : Finset (ℕ × ℕ)) (j : ℕ) : ℝ :=
  ∑' p : {p // p ∉ Kn}, μ p * (termOf P Q p).coeff j

lemma abs_coeff_termOf_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) (j : ℕ) :
    |(termOf P Q p).coeff j| ≤ 1 := by
  have h1 : |(termOf P Q p).coeff j| ≤ l1 (termOf P Q p) := by
    have := sum_abs_coeff_le_l1 (termOf P Q p) (j + 1)
    refine le_trans ?_ this
    exact single_le_sum (f := fun k => |(termOf P Q p).coeff k|) (fun k _ => abs_nonneg _)
      (mem_range.2 (Nat.lt_succ_self j))
  exact h1.trans ((l1_termOf_le P Q p).trans (pow_mul_pow_le_one hP hQ _ _))

lemma summable_unknown_term (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (Kn : Finset (ℕ × ℕ)) (j : ℕ) :
    Summable fun p : {p // p ∉ Kn} => |μ p * (termOf P Q p).coeff j| := by
  refine Summable.of_nonneg_of_le (fun p => abs_nonneg _) (fun p => ?_)
    (hμ.subtype {p | p ∉ Kn})
  rw [abs_mul]
  exact mul_le_of_le_one_right (abs_nonneg _) (abs_coeff_termOf_le P Q hP hQ p j)

/-- **The infinite unknown part has coefficient norm at most `T · max(…)`.** -/
theorem tsum_abs_unknown_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (Kn : Finset (ℕ × ℕ)) {NZ MW : ℕ}
    (hout : ∀ p ∉ Kn, NZ < p.1 ∨ MW < p.2 ∨ μ p = 0) (T : ℝ)
    (hT : ∑' p : {p // p ∉ Kn}, |μ p| ≤ T) :
    ∑' j, |unknownCoeff P Q μ Kn j| ≤ T * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
  -- the per-index bound, trivial where `μ` vanishes
  have hbound : ∀ (p : {p // p ∉ Kn}) (J : ℕ), |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j|
      ≤ |μ p| * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
    intro p J
    rcases hout p p.2 with h | h | h
    · exact mul_le_mul_of_nonneg_left ((sum_abs_coeff_le_l1 _ _).trans ((l1_termOf_le P Q p).trans
        (pow_mul_pow_le_max (l1_nonneg P) hP (l1_nonneg Q) hQ (Or.inl h)))) (abs_nonneg _)
    · exact mul_le_mul_of_nonneg_left ((sum_abs_coeff_le_l1 _ _).trans ((l1_termOf_le P Q p).trans
        (pow_mul_pow_le_max (l1_nonneg P) hP (l1_nonneg Q) hQ (Or.inr h)))) (abs_nonneg _)
    · simp [h]
  have hM0 : 0 ≤ max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) :=
    le_max_of_le_left (pow_nonneg (l1_nonneg _) _)
  have hsub : Summable fun p : {p // p ∉ Kn} => |μ p| := hμ.subtype _
  -- the per-index bound: `Σ_{j<J} |U j| ≤ Σ'_{p ∉ Kn} |μ p| · ‖termOf p‖_𝒜`
  have key : ∀ J : ℕ, ∑ j ∈ range J, |unknownCoeff P Q μ Kn j|
      ≤ T * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
    intro J
    have h1 : ∀ j, |unknownCoeff P Q μ Kn j|
        ≤ ∑' p : {p // p ∉ Kn}, |μ p| * |(termOf P Q p).coeff j| := by
      intro j
      unfold unknownCoeff
      have := norm_tsum_le_tsum_norm
        (f := fun p : {p // p ∉ Kn} => μ p * (termOf P Q p).coeff j)
        (by simpa [Real.norm_eq_abs] using summable_unknown_term P Q hP hQ μ hμ Kn j)
      simpa only [Real.norm_eq_abs, abs_mul] using this
    have h2 : ∑ j ∈ range J, ∑' p : {p // p ∉ Kn}, |μ p| * |(termOf P Q p).coeff j|
        = ∑' p : {p // p ∉ Kn}, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| := by
      rw [← Summable.tsum_finsetSum]
      · refine tsum_congr fun p => ?_
        rw [mul_sum]
      · intro j _
        simpa [abs_mul] using summable_unknown_term P Q hP hQ μ hμ Kn j
    have h3 : ∑' p : {p // p ∉ Kn}, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j|
        ≤ ∑' p : {p // p ∉ Kn}, |μ p| * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
      refine Summable.tsum_le_tsum (fun p => hbound p J) ?_ (hsub.mul_right _)
      exact Summable.of_nonneg_of_le (fun p => by positivity) (fun p => hbound p J)
        (hsub.mul_right (max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1))))
    calc ∑ j ∈ range J, |unknownCoeff P Q μ Kn j|
        ≤ ∑ j ∈ range J, ∑' p : {p // p ∉ Kn}, |μ p| * |(termOf P Q p).coeff j| :=
          sum_le_sum fun j _ => h1 j
      _ ≤ ∑' p : {p // p ∉ Kn}, |μ p| * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := h2 ▸ h3
      _ = (∑' p : {p // p ∉ Kn}, |μ p|) * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) :=
          tsum_mul_right
      _ ≤ _ := mul_le_mul_of_nonneg_right hT hM0
  exact Real.tsum_le_of_sum_le (fun j => abs_nonneg _) fun s =>
    (sum_le_sum_of_subset_of_nonneg (fun j hj => mem_range.2 (Nat.lt_succ_of_le
      (le_sup (f := id) hj))) (fun j _ _ => abs_nonneg _)).trans (key _)

/-! ### The true kernel: known part plus unknown part -/

/-- The true radial coefficient sequence of the branch: `Σ'_{p} μ p · [X^j] termOf p`. -/
def bivarKernel (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (j : ℕ) : ℝ := ∑' p, μ p * (termOf P Q p).coeff j

/-- The known part as a finite sum over `Kn`. -/
def knownCoeff (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (Kn : Finset (ℕ × ℕ)) (j : ℕ) : ℝ :=
  ∑ p ∈ Kn, μ p * (termOf P Q p).coeff j

lemma summable_kernel_term (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (j : ℕ) : Summable fun p => μ p * (termOf P Q p).coeff j := by
  refine Summable.of_norm_bounded hμ fun p => ?_
  rw [Real.norm_eq_abs, abs_mul]
  exact mul_le_of_le_one_right (abs_nonneg _) (abs_coeff_termOf_le P Q hP hQ p j)

/-- `bivarKernel = knownCoeff + unknownCoeff`. -/
theorem bivarKernel_split (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (Kn : Finset (ℕ × ℕ)) (j : ℕ) :
    bivarKernel P Q μ j = knownCoeff P Q μ Kn j + unknownCoeff P Q μ Kn j := by
  unfold bivarKernel knownCoeff unknownCoeff
  have hs := summable_kernel_term P Q hP hQ μ hμ j
  rw [← Finset.tsum_subtype Kn (fun p => μ p * (termOf P Q p).coeff j)]
  have h1 := hs.subtype {p | p ∈ Kn}
  have h2 := hs.subtype {p | p ∈ Kn}ᶜ
  exact (h1.tsum_add_tsum_compl h2).symm

/-- The true kernel is absolutely summable. -/
theorem summable_abs_bivarKernel (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) : Summable fun j => |bivarKernel P Q μ j| := by
  have hk : ∀ j, |bivarKernel P Q μ j| ≤ ∑' p, |μ p| * |(termOf P Q p).coeff j| := by
    intro j
    unfold bivarKernel
    have := norm_tsum_le_tsum_norm (f := fun p => μ p * (termOf P Q p).coeff j)
      (by simpa [Real.norm_eq_abs, abs_mul] using (summable_kernel_term P Q hP hQ μ hμ j).norm)
    simpa only [Real.norm_eq_abs, abs_mul] using this
  refine summable_of_sum_range_le (c := ∑' p, |μ p|) (fun _ => abs_nonneg _) fun J => ?_
  have hterm : ∀ j, Summable fun p => |μ p| * |(termOf P Q p).coeff j| := fun j => by
    simpa [abs_mul] using (summable_kernel_term P Q hP hQ μ hμ j).norm
  calc ∑ j ∈ range J, |bivarKernel P Q μ j|
      ≤ ∑ j ∈ range J, ∑' p, |μ p| * |(termOf P Q p).coeff j| := sum_le_sum fun j _ => hk j
    _ = ∑' p, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| := by
        rw [← Summable.tsum_finsetSum fun j _ => hterm j]
        exact tsum_congr fun p => by rw [mul_sum]
    _ ≤ ∑' p, |μ p| := by
        have hle : ∀ p, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| ≤ |μ p| := fun p =>
          mul_le_of_le_one_right (abs_nonneg _) ((sum_abs_coeff_le_l1 _ _).trans
            ((l1_termOf_le P Q p).trans (pow_mul_pow_le_one hP hQ _ _)))
        exact Summable.tsum_le_tsum hle
          (Summable.of_nonneg_of_le (fun p => by positivity) hle hμ) hμ

/-- **The remainder of a two-coordinate branch** after retaining the first `K` coefficients of
its known part: at most the discarded known coefficients plus `T · max(‖P‖^{NZ+1}, ‖Q‖^{MW+1})`. -/
theorem bivar_remainder_le (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (Kn : Finset (ℕ × ℕ)) {NZ MW : ℕ}
    (hout : ∀ p ∉ Kn, NZ < p.1 ∨ MW < p.2 ∨ μ p = 0) (T : ℝ)
    (hT : ∑' p : {p // p ∉ Kn}, |μ p| ≤ T) (K : ℕ) (hi : ℝ) (hhi : ∑' j, |knownCoeff P Q μ Kn (j + K)| ≤ hi) :
    ∑' j, |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)|
      ≤ hi + T * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
  -- known part is a finite sum of polynomials, hence finitely supported
  have hkfin : Summable fun j => |knownCoeff P Q μ Kn j| := by
    have hpoly : knownCoeff P Q μ Kn = (∑ p ∈ Kn, C (μ p) * termOf P Q p).coeff := by
      funext j; unfold knownCoeff; rw [finsetSum_coeff]
      exact sum_congr rfl fun p _ => by rw [coeff_C_mul]
    rw [hpoly]
    exact summable_of_ne_finset_zero (s := range ((∑ p ∈ Kn, C (μ p) * termOf P Q p).natDegree + 1))
      fun j hj => by
        rw [coeff_eq_zero_of_natDegree_lt (by simpa using hj), abs_zero]
  have hU : Summable fun j => |unknownCoeff P Q μ Kn j| := by
    have hb := summable_abs_bivarKernel P Q hP hQ μ hμ
    refine Summable.of_nonneg_of_le (fun j => abs_nonneg _) (fun j => ?_) (hb.add hkfin)
    have e : unknownCoeff P Q μ Kn j = bivarKernel P Q μ j - knownCoeff P Q μ Kn j := by
      rw [bivarKernel_split P Q hP hQ μ hμ Kn j]; ring
    rw [e]; exact abs_sub _ _
  have hdiff : ∀ j, |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)|
      ≤ (if j < K then 0 else |knownCoeff P Q μ Kn j|) + |unknownCoeff P Q μ Kn j| := by
    intro j
    rw [bivarKernel_split P Q hP hQ μ hμ Kn j]
    split_ifs
    · simp
    · simpa [sub_zero] using abs_add_le (knownCoeff P Q μ Kn j) (unknownCoeff P Q μ Kn j)
  have hk2 : Summable fun j => (if j < K then 0 else |knownCoeff P Q μ Kn j|) :=
    Summable.of_nonneg_of_le (fun j => by split_ifs <;> positivity)
      (fun j => by split_ifs <;> simp) hkfin
  have hsum : Summable fun j => |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)| :=
    Summable.of_nonneg_of_le (fun j => abs_nonneg _) hdiff (hk2.add hU)
  calc ∑' j, |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)|
      ≤ ∑' j, ((if j < K then 0 else |knownCoeff P Q μ Kn j|) + |unknownCoeff P Q μ Kn j|) :=
        Summable.tsum_le_tsum hdiff hsum (hk2.add hU)
    _ = ∑' j, (if j < K then 0 else |knownCoeff P Q μ Kn j|) + ∑' j, |unknownCoeff P Q μ Kn j| :=
        hk2.tsum_add hU
    _ ≤ hi + T * max (l1 P ^ (NZ + 1)) (l1 Q ^ (MW + 1)) := by
        refine add_le_add ?_ (tsum_abs_unknown_le P Q hP hQ μ hμ Kn hout T hT)
        rw [← hk2.sum_add_tsum_nat_add K]
        have h0 : ∑ j ∈ range K, (if j < K then 0 else |knownCoeff P Q μ Kn j|) = 0 :=
          sum_eq_zero fun j hj => by simp [mem_range.1 hj]
        rw [h0, zero_add]
        refine le_trans (le_of_eq (tsum_congr fun j => ?_)) hhi
        simp

/-! ### The unknown part, split by the `W`-degree -/

lemma pow_mul_pow_le_W {a b : ℝ} (ha0 : 0 ≤ a) (ha1 : a ≤ 1) (hb0 : 0 ≤ b) (hb1 : b ≤ 1)
    {n m MW : ℕ} (h : MW < m) : a ^ n * b ^ m ≤ b ^ (MW + 1) :=
  calc a ^ n * b ^ m ≤ 1 * b ^ m := by gcongr; exact pow_le_one₀ ha0 ha1
    _ = b ^ m := one_mul _
    _ ≤ b ^ (MW + 1) := pow_le_pow_of_le_one hb0 hb1 (by omega)

lemma pow_mul_pow_le_Z {a b : ℝ} (ha0 : 0 ≤ a) (ha1 : a ≤ 1) (hb0 : 0 ≤ b) (hb1 : b ≤ 1)
    {n m NZ : ℕ} (h : NZ < n) : a ^ n * b ^ m ≤ a ^ (NZ + 1) :=
  calc a ^ n * b ^ m ≤ a ^ n * 1 := by gcongr; exact pow_le_one₀ hb0 hb1
    _ = a ^ n := mul_one _
    _ ≤ a ^ (NZ + 1) := pow_le_pow_of_le_one ha0 ha1 (by omega)

/-- **The infinite unknown part, split by the `W`-degree**: the indices with `MW < m` carry mass at
most `UW` and are bounded by `‖Q‖^{MW+1}`, the others (with `NZ < n` or vanishing weight) carry mass
at most `UZ` and are bounded by `‖P‖^{NZ+1}`. -/
theorem tsum_abs_unknown_le_split (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (Kn : Finset (ℕ × ℕ)) {NZ MW : ℕ}
    (hout : ∀ p ∉ Kn, NZ < p.1 ∨ MW < p.2 ∨ μ p = 0) (UZ UW : ℝ)
    (hW : ∑' p : {p // p ∉ Kn}, (if MW < p.1.2 then |μ p| else 0) ≤ UW)
    (hZ : ∑' p : {p // p ∉ Kn}, (if MW < p.1.2 then 0 else |μ p|) ≤ UZ) :
    ∑' j, |unknownCoeff P Q μ Kn j| ≤ UZ * l1 P ^ (NZ + 1) + UW * l1 Q ^ (MW + 1) := by
  set A := l1 Q ^ (MW + 1) with hA
  set B := l1 P ^ (NZ + 1) with hB
  have hA0 : 0 ≤ A := pow_nonneg (l1_nonneg _) _
  have hB0 : 0 ≤ B := pow_nonneg (l1_nonneg _) _
  -- the per-index weight
  let g : {p // p ∉ Kn} → ℝ := fun p =>
    (if MW < p.1.2 then |μ p| else 0) * A + (if MW < p.1.2 then 0 else |μ p|) * B
  have hbound : ∀ (p : {p // p ∉ Kn}) (J : ℕ),
      |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| ≤ g p := by
    intro p J
    have hterm : ∑ j ∈ range J, |(termOf P Q p).coeff j| ≤ l1 P ^ p.1.1 * l1 Q ^ p.1.2 :=
      (sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le P Q p)
    simp only [g]
    by_cases hm : MW < p.1.2
    · rw [ite_eq_left hm, ite_eq_left hm, zero_mul, add_zero]
      exact mul_le_mul_of_nonneg_left (hterm.trans
        (pow_mul_pow_le_W (l1_nonneg P) hP (l1_nonneg Q) hQ hm)) (abs_nonneg _)
    · rw [ite_eq_right hm, ite_eq_right hm, zero_mul, zero_add]
      rcases hout p p.2 with h | h | h
      · exact mul_le_mul_of_nonneg_left (hterm.trans
          (pow_mul_pow_le_Z (l1_nonneg P) hP (l1_nonneg Q) hQ h)) (abs_nonneg _)
      · exact absurd h hm
      · simp [h]
  have hsub : Summable fun p : {p // p ∉ Kn} => |μ p| := hμ.subtype _
  have hgW : Summable fun p : {p // p ∉ Kn} => (if MW < p.1.2 then |μ p| else 0) :=
    Summable.of_nonneg_of_le (fun p => by split_ifs <;> positivity)
      (fun p => by split_ifs <;> simp) hsub
  have hgZ : Summable fun p : {p // p ∉ Kn} => (if MW < p.1.2 then 0 else |μ p|) :=
    Summable.of_nonneg_of_le (fun p => by split_ifs <;> positivity)
      (fun p => by split_ifs <;> simp) hsub
  have hg : Summable g := (hgW.mul_right A).add (hgZ.mul_right B)
  have hg_tsum : ∑' p, g p ≤ UZ * B + UW * A := by
    simp only [g]
    rw [(hgW.mul_right A).tsum_add (hgZ.mul_right B), tsum_mul_right, tsum_mul_right]
    nlinarith [mul_le_mul_of_nonneg_right hW hA0, mul_le_mul_of_nonneg_right hZ hB0]
  have key : ∀ J : ℕ, ∑ j ∈ range J, |unknownCoeff P Q μ Kn j| ≤ UZ * B + UW * A := by
    intro J
    have h1 : ∀ j, |unknownCoeff P Q μ Kn j|
        ≤ ∑' p : {p // p ∉ Kn}, |μ p| * |(termOf P Q p).coeff j| := by
      intro j
      unfold unknownCoeff
      have := norm_tsum_le_tsum_norm
        (f := fun p : {p // p ∉ Kn} => μ p * (termOf P Q p).coeff j)
        (by simpa [Real.norm_eq_abs] using summable_unknown_term P Q hP hQ μ hμ Kn j)
      simpa only [Real.norm_eq_abs, abs_mul] using this
    have h2 : ∑ j ∈ range J, ∑' p : {p // p ∉ Kn}, |μ p| * |(termOf P Q p).coeff j|
        = ∑' p : {p // p ∉ Kn}, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j| := by
      rw [← Summable.tsum_finsetSum]
      · refine tsum_congr fun p => ?_
        rw [mul_sum]
      · intro j _
        simpa [abs_mul] using summable_unknown_term P Q hP hQ μ hμ Kn j
    have h3 : ∑' p : {p // p ∉ Kn}, |μ p| * ∑ j ∈ range J, |(termOf P Q p).coeff j|
        ≤ ∑' p, g p := by
      refine Summable.tsum_le_tsum (fun p => hbound p J) ?_ hg
      exact Summable.of_nonneg_of_le (fun p => by positivity) (fun p => hbound p J) hg
    calc ∑ j ∈ range J, |unknownCoeff P Q μ Kn j|
        ≤ ∑ j ∈ range J, ∑' p : {p // p ∉ Kn}, |μ p| * |(termOf P Q p).coeff j| :=
          sum_le_sum fun j _ => h1 j
      _ ≤ ∑' p, g p := h2 ▸ h3
      _ ≤ UZ * B + UW * A := hg_tsum
  exact Real.tsum_le_of_sum_le (fun j => abs_nonneg _) fun s =>
    (sum_le_sum_of_subset_of_nonneg (fun j hj => mem_range.2 (Nat.lt_succ_of_le
      (le_sup (f := id) hj))) (fun j _ _ => abs_nonneg _)).trans (key _)

/-- **The remainder of a two-coordinate branch** (split form): at most the discarded known
coefficients plus `UZ ‖P‖^{NZ+1} + UW ‖Q‖^{MW+1}`. -/
theorem bivar_remainder_le_split (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (Kn : Finset (ℕ × ℕ)) {NZ MW : ℕ}
    (hout : ∀ p ∉ Kn, NZ < p.1 ∨ MW < p.2 ∨ μ p = 0) (UZ UW : ℝ)
    (hW : ∑' p : {p // p ∉ Kn}, (if MW < p.1.2 then |μ p| else 0) ≤ UW)
    (hZ : ∑' p : {p // p ∉ Kn}, (if MW < p.1.2 then 0 else |μ p|) ≤ UZ)
    (K : ℕ) (hi : ℝ) (hhi : ∑' j, |knownCoeff P Q μ Kn (j + K)| ≤ hi) :
    ∑' j, |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)|
      ≤ hi + (UZ * l1 P ^ (NZ + 1) + UW * l1 Q ^ (MW + 1)) := by
  have hkfin : Summable fun j => |knownCoeff P Q μ Kn j| := by
    have hpoly : knownCoeff P Q μ Kn = (∑ p ∈ Kn, C (μ p) * termOf P Q p).coeff := by
      funext j; unfold knownCoeff; rw [finsetSum_coeff]
      exact sum_congr rfl fun p _ => by rw [coeff_C_mul]
    rw [hpoly]
    exact summable_of_ne_finset_zero (s := range ((∑ p ∈ Kn, C (μ p) * termOf P Q p).natDegree + 1))
      fun j hj => by
        rw [coeff_eq_zero_of_natDegree_lt (by simpa using hj), abs_zero]
  have hU : Summable fun j => |unknownCoeff P Q μ Kn j| := by
    have hb := summable_abs_bivarKernel P Q hP hQ μ hμ
    refine Summable.of_nonneg_of_le (fun j => abs_nonneg _) (fun j => ?_) (hb.add hkfin)
    have e : unknownCoeff P Q μ Kn j = bivarKernel P Q μ j - knownCoeff P Q μ Kn j := by
      rw [bivarKernel_split P Q hP hQ μ hμ Kn j]; ring
    rw [e]; exact abs_sub _ _
  have hdiff : ∀ j, |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)|
      ≤ (if j < K then 0 else |knownCoeff P Q μ Kn j|) + |unknownCoeff P Q μ Kn j| := by
    intro j
    rw [bivarKernel_split P Q hP hQ μ hμ Kn j]
    split_ifs
    · simp
    · simpa [sub_zero] using abs_add_le (knownCoeff P Q μ Kn j) (unknownCoeff P Q μ Kn j)
  have hk2 : Summable fun j => (if j < K then 0 else |knownCoeff P Q μ Kn j|) :=
    Summable.of_nonneg_of_le (fun j => by split_ifs <;> positivity)
      (fun j => by split_ifs <;> simp) hkfin
  have hsum : Summable fun j => |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)| :=
    Summable.of_nonneg_of_le (fun j => abs_nonneg _) hdiff (hk2.add hU)
  calc ∑' j, |bivarKernel P Q μ j - (if j < K then knownCoeff P Q μ Kn j else 0)|
      ≤ ∑' j, ((if j < K then 0 else |knownCoeff P Q μ Kn j|) + |unknownCoeff P Q μ Kn j|) :=
        Summable.tsum_le_tsum hdiff hsum (hk2.add hU)
    _ = ∑' j, (if j < K then 0 else |knownCoeff P Q μ Kn j|) + ∑' j, |unknownCoeff P Q μ Kn j| :=
        hk2.tsum_add hU
    _ ≤ hi + (UZ * l1 P ^ (NZ + 1) + UW * l1 Q ^ (MW + 1)) := by
        refine add_le_add ?_ (tsum_abs_unknown_le_split P Q hP hQ μ hμ Kn hout UZ UW hW hZ)
        rw [← hk2.sum_add_tsum_nat_add K]
        have h0 : ∑ j ∈ range K, (if j < K then 0 else |knownCoeff P Q μ Kn j|) = 0 :=
          sum_eq_zero fun j hj => by simp [mem_range.1 hj]
        rw [h0, zero_add]
        refine le_trans (le_of_eq (tsum_congr fun j => ?_)) hhi
        simp

end

end Grothe.Upper
