import Grothe.Upper.Bivar
import Grothe.Upper.Assembly

/-!
# Certificates with two-coordinate branches: data format and the table bridge

A certificate (`Cert`) is a list of branches with positive weights and a common retained
length `K`.  A branch is either a Haagerup branch `𝔥 ∘ ρ` (`BranchSpec.scalar`, the
preprocessor `ρ(t) = t·P(t²)` given by the coefficient list of `P`) or a two-coordinate branch
(`BranchSpec.bivar`, `BivarData`): the kernel `Σ_{n,m} μ[n,m] ρ(t)^n σ(t)^m` with
`ρ(t) = t·P(t²)`, `σ(t) = t·Q(t²)`, a finite known part of the table (rows `(m, [(n, lo, hi), …])`
enclosing `μ[n,m]`), the mass `T` of the unknown part, and a rational `Mx ≥ max(‖P‖_𝒜^{NZ+1},
‖Q‖_𝒜^{MW+1})`.

The *true* table of a two-coordinate branch is a function `μ : ℕ × ℕ → ℝ` (zero unless `n+m` is
odd); `TabIn μ d` says the known entries are enclosed.  The bridge `tabPoly_eq_knownSum`
identifies the polynomial computed by the kernel routine with the finite sum `knownCoeff` over
the index set `tabIdx d`, provided the indices are listed once (`idxNodup`).
-/

namespace Grothe.Upper

open GrotheKernel Polynomial Finset

/-! ### Data -/

/-- Data of a two-coordinate branch.  All numbers are exact rationals.

* `tab`: the known part of the chaos-mass table, as rows `(m, [(n, lo, hi), …])` with
  `lo ≤ μ[n,m] ≤ hi`; only `n + m` odd, `n ≤ NZ`, `m ≤ MW`, each index listed once;
* `P`, `Q`: the preprocessors `ρ(t) = t·P(t²)`, `σ(t) = t·Q(t²)` (coefficient lists of `P`, `Q`),
  of coefficient norm at most one;
* `NZ`, `MW`: the index bounds of the known part (every unknown index has `n > NZ` or `m > MW`);
* `T`: an upper bound for the total absolute mass of the unknown part of the table
  (`1 − Σ_{known} μ` in the symmetric case, by Parseval);
* `Mx`: an upper bound for `max((Σ|Pⱼ|)^{NZ+1}, (Σ|Qⱼ|)^{MW+1})`, so that the unknown part
  contributes at most `T · Mx` to the coefficient norm of the kernel. -/
structure BivarData where
  tab : List (ℕ × List (ℕ × ℚ × ℚ))
  P : List ℚ
  Q : List ℚ
  NZ : ℕ
  MW : ℕ
  T : ℚ
  Mx : ℚ
  deriving Repr

/-- A branch of the mixture. -/
inductive BranchSpec
  /-- Haagerup's kernel composed with the preprocessor `ρ(t) = t·P(t²)` (coefficients of `P`);
  the tail beyond the retained length is bounded by the positive coefficient majorant. -/
  | scalar (row : List ℚ)
  /-- A two-coordinate branch. -/
  | bivar (d : BivarData)
  deriving Repr

/-- A certificate: branches, positive weights, retained length. -/
structure Cert where
  specs : List BranchSpec
  wts : List ℚ
  K : ℕ
  deriving Repr

/-! ### Interval and real forms of a table -/

/-- The interval table. -/
def tabI (d : BivarData) : List RowI :=
  d.tab.map fun r => (r.1, r.2.map fun e => (e.1, boxI e.2.1 e.2.2))

/-- The listed indices `(n, m)`. -/
def idxList (d : BivarData) : List (ℕ × ℕ) :=
  d.tab.flatMap fun r => r.2.map fun e => (e.1, r.1)

/-- The known index set. -/
def tabIdx (d : BivarData) : Finset (ℕ × ℕ) := (idxList d).toFinset

/-- Data side condition: all `n ≤ NZ`, `m ≤ MW`, indices listed once. -/
def tabOK (d : BivarData) : Bool :=
  (d.tab.all fun r => r.1 ≤ d.MW && r.2.all fun e => e.1 ≤ d.NZ) && (idxList d).Nodup

noncomputable section

/-- The real table with the true values `μ`. -/
def tabR (μ : ℕ × ℕ → ℝ) (d : BivarData) : List RowR :=
  d.tab.map fun r => (r.1, r.2.map fun e => (e.1, μ (e.1, r.1)))

/-- The true values are enclosed by the listed boxes. -/
def TabIn (μ : ℕ × ℕ → ℝ) (d : BivarData) : Prop :=
  ∀ r ∈ d.tab, ∀ e ∈ r.2, ((e.2.1 : ℚ) : ℝ) ≤ μ (e.1, r.1) ∧ μ (e.1, r.1) ≤ ((e.2.2 : ℚ) : ℝ)

lemma tabMem_of_tabIn {μ : ℕ × ℕ → ℝ} {d : BivarData} (h : TabIn μ d) :
    TabMem (tabR μ d) (tabI d) := by
  unfold TabMem tabR tabI
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  refine List.forall₂_same.2 fun r hr => ⟨rfl, ?_⟩
  unfold RowMem
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  refine List.forall₂_same.2 fun e he => ⟨rfl, ?_⟩
  exact mem_boxI (h r hr e he).1 (h r hr e he).2

lemma tabBounds_of_ok {d : BivarData} (h : tabOK d = true) : TabBounds (tabI d) d.NZ d.MW := by
  unfold tabOK at h
  simp only [Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at h
  intro rI hrI
  unfold tabI at hrI
  obtain ⟨r, hr, rfl⟩ := List.mem_map.1 hrI
  refine ⟨(h.1 r hr).1, fun e he => ?_⟩
  obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
  exact (h.1 r hr).2 e' he'

lemma idxNodup_of_ok {d : BivarData} (h : tabOK d = true) : (idxList d).Nodup := by
  unfold tabOK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  exact h.2

/-! ### The bridge -/

lemma rowPoly_eq_sum (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (m : ℕ) (row : List (ℕ × ℚ × ℚ)) :
    X ^ (m / 2) * (Q ^ m * rowPoly P (row.map fun e => (e.1, μ (e.1, m))))
      = ((row.map fun e => (e.1, m)).map fun p => C (μ p) * termOf P Q p).sum := by
  induction row with
  | nil => simp [rowPoly]
  | cons e rest ih =>
    simp only [List.map_cons, rowPoly, List.sum_cons]
    rw [mul_add, mul_add, ih]
    congr 1
    unfold termOf shiftOf
    simp only
    rw [pow_add]
    ring

lemma tabPoly_eq_idxSum (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (d : BivarData) :
    tabPoly P Q (tabR μ d) = ((idxList d).map fun p => C (μ p) * termOf P Q p).sum := by
  unfold tabR idxList
  induction d.tab with
  | nil => simp [tabPoly]
  | cons r rest ih =>
    simp only [List.map_cons, tabPoly, rowTerm, List.flatMap_cons, List.map_append,
      List.sum_append]
    rw [ih, rowPoly_eq_sum]

/-- **The bridge**: with the indices listed once, the known polynomial is the finite sum over
the index set. -/
theorem tabPoly_eq_knownSum (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) {d : BivarData}
    (hnd : (idxList d).Nodup) :
    tabPoly P Q (tabR μ d) = ∑ p ∈ tabIdx d, C (μ p) * termOf P Q p := by
  rw [tabPoly_eq_idxSum]
  unfold tabIdx
  rw [List.sum_toFinset _ hnd]

/-- The known coefficients are the coefficients of the known polynomial. -/
theorem knownCoeff_eq_coeff (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) {d : BivarData}
    (hnd : (idxList d).Nodup) (j : ℕ) :
    knownCoeff P Q μ (tabIdx d) j = (tabPoly P Q (tabR μ d)).coeff j := by
  rw [tabPoly_eq_knownSum P Q μ hnd]
  unfold knownCoeff
  rw [finsetSum_coeff]
  exact sum_congr rfl fun p _ => by rw [coeff_C_mul]

/-- The unknown indices lie outside the box `[0, NZ] × [0, MW]`… provided the known part is
*complete* on the box; this is the hypothesis `hout` of the final theorem, recorded as a
definition for readability. -/
def Complete (d : BivarData) : Prop := ∀ p ∉ tabIdx d, d.NZ < p.1 ∨ d.MW < p.2

/-! ### Degree bound and the tail as a finite sum -/

/-- A safe length for the known polynomial: `natDegree < fullLenB`. -/
def fullLenB (d : BivarData) : ℕ :=
  (d.NZ + d.MW) / 2 + 1 + d.NZ * d.P.length + d.MW * d.Q.length

lemma natDegree_rowPoly_le (P : ℝ[X]) {NZ : ℕ} (row : List (ℕ × ℝ)) (hb : ∀ e ∈ row, e.1 ≤ NZ)
    {dP : ℕ} (hP : P.natDegree ≤ dP) : (rowPoly P row).natDegree ≤ NZ / 2 + NZ * dP := by
  induction row with
  | nil => simp [rowPoly]
  | cons e rest ih =>
    simp only [rowPoly]
    refine (natDegree_add_le _ _).trans (max_le ?_ (ih fun e' he' => hb e' (List.mem_cons_of_mem _ he')))
    have hn := hb e (List.mem_cons_self)
    refine (natDegree_C_mul_le _ _).trans ((natDegree_mul_le).trans ?_)
    have h1 : (X ^ (e.1 / 2) : ℝ[X]).natDegree ≤ NZ / 2 := by
      rw [natDegree_X_pow]; omega
    have h2 : (P ^ e.1).natDegree ≤ NZ * dP :=
      natDegree_pow_le.trans (Nat.mul_le_mul hn hP)
    omega

lemma natDegree_tabPoly_lt (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) {d : BivarData} (hok : tabOK d = true)
    (hP : P.natDegree ≤ d.P.length) (hQ : Q.natDegree ≤ d.Q.length) :
    (tabPoly P Q (tabR μ d)).natDegree < fullLenB d := by
  have hb := tabBounds_of_ok hok
  unfold fullLenB
  suffices hs : (tabPoly P Q (tabR μ d)).natDegree
      ≤ d.MW / 2 + d.MW * d.Q.length + (d.NZ / 2 + d.NZ * d.P.length) by omega
  unfold tabR
  have : ∀ tab : List (ℕ × List (ℕ × ℚ × ℚ)),
      (∀ r ∈ tab, r.1 ≤ d.MW ∧ ∀ e ∈ r.2, e.1 ≤ d.NZ) →
      (tabPoly P Q (tab.map fun r => (r.1, r.2.map fun e => (e.1, μ (e.1, r.1))))).natDegree
        ≤ d.MW / 2 + d.MW * d.Q.length + (d.NZ / 2 + d.NZ * d.P.length) := by
    intro tab
    induction tab with
    | nil => intro _; simp [tabPoly]
    | cons r rest ih =>
      intro hr
      simp only [List.map_cons, tabPoly, rowTerm]
      refine (natDegree_add_le _ _).trans (max_le ?_ (ih fun r' hr' => hr r' (List.mem_cons_of_mem _ hr')))
      have hr0 := hr r (List.mem_cons_self)
      refine (natDegree_mul_le).trans ?_
      have h1 : (X ^ (r.1 / 2) : ℝ[X]).natDegree ≤ d.MW / 2 := by rw [natDegree_X_pow]; omega
      have h2 : (Q ^ r.1 * rowPoly P (r.2.map fun e => (e.1, μ (e.1, r.1)))).natDegree
          ≤ d.MW * d.Q.length + (d.NZ / 2 + d.NZ * d.P.length) := by
        refine (natDegree_mul_le).trans (add_le_add ?_ ?_)
        · exact natDegree_pow_le.trans (Nat.mul_le_mul hr0.1 hQ)
        · refine natDegree_rowPoly_le P _ (fun e he => ?_) hP
          obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
          exact hr0.2 e' he'
      omega
  refine this d.tab fun r hr => ?_
  have := hb (r.1, r.2.map fun e => (e.1, boxI e.2.1 e.2.2)) (by
    unfold tabI; exact List.mem_map.2 ⟨r, hr, rfl⟩)
  refine ⟨this.1, fun e he => ?_⟩
  exact this.2 (e.1, boxI e.2.1 e.2.2) (List.mem_map.2 ⟨e, he, rfl⟩)

/-- The tail of the known coefficients beyond `K` is the finite sum up to `fullLenB`. -/
theorem tsum_known_tail_eq (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) {d : BivarData} (hok : tabOK d = true)
    (hP : P.natDegree ≤ d.P.length) (hQ : Q.natDegree ≤ d.Q.length) (K : ℕ) :
    ∑' j, |knownCoeff P Q μ (tabIdx d) (j + K)|
      = ∑ n ∈ Ico K (fullLenB d), |(tabPoly P Q (tabR μ d)).coeff n| := by
  have hnd := idxNodup_of_ok hok
  have hdeg := natDegree_tabPoly_lt P Q μ hok hP hQ
  have hsupp : ∀ j ∉ range (fullLenB d - K), |knownCoeff P Q μ (tabIdx d) (j + K)| = 0 := by
    intro j hj
    rw [knownCoeff_eq_coeff P Q μ hnd, coeff_eq_zero_of_natDegree_lt
      (by simp only [mem_range, not_lt] at hj; omega), abs_zero]
  rw [tsum_eq_sum hsupp, Finset.sum_Ico_eq_sum_range]
  exact sum_congr rfl fun j _ => by rw [knownCoeff_eq_coeff P Q μ hnd, add_comm]

end

end Grothe.Upper
