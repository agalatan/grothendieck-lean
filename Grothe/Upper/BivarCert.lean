import Grothe.Upper.BivarCertDefs
import Grothe.Upper.Checker

/-!
# Certificates with two-coordinate branches: soundness and assembly

For a certificate `C` with `certOK C = true`:

* `finite_certC_exact`: the kernel's scaled value `dloIntC C / D` is a `FiniteCertC C`, i.e.
  for every assignment of true tables `μ` enclosed by the data,
  `mix₀ − Σ_{n=1}^{K−1} |mixₙ| − Σᵢ wtᵢ (majTailᵢ + highTailᵢ) ≥ dloIntC C / D`;
* `bound_of_certC`: `FiniteCertC C Dlo` plus the analytic hypotheses of every branch gives
  `IsGrothendieckBound (massQ C / (Dlo − restQ C))`.

The analytic hypotheses of a two-coordinate branch `d` with true table `μ` are: domination of
the radial kernel with coefficients `bivarKernel P Q μ` (the validity of the rounding),
summability of `|μ|`, `Σ_{p ∉ tabIdx d} |μ p| ≤ T`, `μ p = 0` for `n + m` even, and the box
enclosures `TabIn μ d`.
-/

namespace Grothe.Upper

open GrotheKernel Polynomial Finset

/-! ### Data facts -/

lemma certOK_iff {C : Cert} (h : certOK C = true) :
    C.wts.length = C.specs.length ∧ C.specs.length ≠ 0 ∧ 0 < C.K ∧
      (∀ w ∈ C.wts, 0 < w) ∧ ∀ s ∈ C.specs, specOK s = true := by
  unfold certOK at h
  simp only [Bool.and_eq_true, beq_iff_eq, bne_iff_ne, ne_eq, decide_eq_true_eq,
    List.all_eq_true] at h
  exact ⟨h.1.1.1.1, h.1.1.1.2, h.1.1.2, h.1.2, h.2⟩

lemma specOK_scalar {row : List ℚ} (h : specOK (.scalar row) = true) : (absL row).sum ≤ 1 := by
  simpa [specOK] using h

lemma specOK_bivar {d : BivarData} (h : specOK (.bivar d) = true) :
    tabOK d = true ∧ coversBox d = true ∧ (absL d.P).sum ≤ 1 ∧ (absL d.Q).sum ≤ 1 ∧
      (absL d.P).sum ^ (d.NZ + 1) ≤ d.Mx ∧ (absL d.Q).sum ^ (d.MW + 1) ≤ d.Mx ∧ 0 ≤ d.T := by
  unfold specOK at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  exact ⟨h.1.1.1.1.1.1, h.1.1.1.1.1.2, h.1.1.1.1.2, h.1.1.1.2, h.1.1.2, h.1.2, h.2⟩

lemma specAt_mem (C : Cert) (i : Fin C.specs.length) : specAt C i ∈ C.specs := by
  unfold specAt
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem i.2]
  exact List.getElem_mem _

lemma specOK_at {C : Cert} (h : certOK C = true) (i : Fin C.specs.length) :
    specOK (specAt C i) = true := (certOK_iff h).2.2.2.2 _ (specAt_mem C i)

lemma wtQC_pos {C : Cert} (h : certOK C = true) (i : Fin C.specs.length) : 0 < wtQC C i := by
  have hc := certOK_iff h
  unfold wtQC
  have hi : (i : ℕ) < C.wts.length := by rw [hc.1]; exact i.2
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]
  exact hc.2.2.2.1 _ (List.getElem_mem _)

lemma absL_sum_eq (row : List ℚ) : (absL row).sum = ((row.map fun q => |q|).sum) := rfl

/-- `‖P‖_𝒜 ≤ Σ|Pⱼ|` for a rational coefficient list. -/
lemma l1_le_absL (row : List ℚ) : l1 (ofListQ row) ≤ (((absL row).sum : ℚ) : ℝ) :=
  l1_ofListQ_le row

lemma l1_le_one_of {row : List ℚ} (h : (absL row).sum ≤ 1) : l1 (ofListQ row) ≤ 1 :=
  (l1_le_absL row).trans (by exact_mod_cast h)

/-! ### Real-valued objects -/

noncomputable section

/-- The real weight of branch `i`. -/
def wtC (C : Cert) (i : ℕ) : ℝ := (wtQC C i : ℝ)

/-- The kernel coefficient sequence of branch `i`, given the true tables `μ`. -/
def kernelC (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) (i : ℕ) : ℕ → ℝ :=
  match specAt C i with
  | .scalar row => compose h (ofListQ row)
  | .bivar d => bivarKernel (ofListQ d.P) (ofListQ d.Q) (μ i)

/-- The exact retained column of branch `i`. -/
def colR (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) (i : ℕ) (n : ℕ) : ℝ :=
  match specAt C i with
  | .scalar row => Real.pi * (sProf row n : ℝ)
  | .bivar d => (tabPoly (ofListQ d.P) (ofListQ d.Q) (tabR (μ i) d)).coeff n

/-- The retained part of branch `i`. -/
def retainedC (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) (i : ℕ) (n : ℕ) : ℝ :=
  if n < C.K then colR C μ i n else 0

/-- The mixed retained coefficient. -/
def mixC (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ i : Fin C.specs.length, wtC C i * colR C μ i n

/-- The majorant tail budget of a Haagerup branch. -/
def majTailC (C : Cert) (i : ℕ) : ℝ :=
  match specAt C i with
  | .scalar row => 1 - ∑ n ∈ range C.K, Real.pi * (sProf (absL row) n : ℝ)
  | .bivar _ => 0

/-- The discarded known coefficients of a two-coordinate branch. -/
def highTailC (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) (i : ℕ) : ℝ :=
  match specAt C i with
  | .scalar _ => 0
  | .bivar d => ∑ n ∈ Ico C.K (fullLenB d), |(tabPoly (ofListQ d.P) (ofListQ d.Q) (tabR (μ i) d)).coeff n|

/-- The analytic tail budget of branch `i`. -/
def extraC (C : Cert) (i : ℕ) : ℝ := (extraQ (specAt C i) : ℝ)

/-- The true tables are enclosed by the data. -/
def TabInAll (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) : Prop :=
  ∀ (i : Fin C.specs.length) (d : BivarData), specAt C i = .bivar d → TabIn (μ i) d

/-- **The finite certificate statement.** -/
def FiniteCertC (C : Cert) (Dlo : ℚ) : Prop :=
  ∀ μ : ℕ → ℕ × ℕ → ℝ, TabInAll C μ →
    (Dlo : ℝ) ≤ mixC C μ 0 - ∑ n ∈ Icc 1 (C.K - 1), |mixC C μ n|
      - ∑ i : Fin C.specs.length, wtC C i * (majTailC C i + highTailC C μ i)

/-! ### Haagerup branches (generic retained length) -/

lemma hRatQN_getD (K k : ℕ) (hk : k < K) : (hRatQN K).getD k 0 = hRat k := by
  show (hRatFrom 0 (hRat 0) K).getD k 0 = _
  rw [hRatFrom_getD K 0 k hk, Nat.zero_add]

/-- The real list `h_j/π`, `j < K`. -/
def hRatsN (K : ℕ) : List ℝ := (hRatQN K).map (Rat.cast : ℚ → ℝ)

lemma hRatsN_getD (K k : ℕ) (hk : k < K) : (hRatsN K).getD k 0 = (hRat k : ℝ) := by
  unfold hRatsN; rw [getD_map_cast, hRatQN_getD K k hk]

lemma forall₂_hRatsN (K : ℕ) : List.Forall₂ mem (hRatsN K) (hRatLN K) := by
  unfold hRatsN hRatLN
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  exact List.forall₂_same.2 fun q _ => mem_ofRatI q

lemma hRatQN_mem_nonneg {K : ℕ} {q : ℚ} (hq : q ∈ hRatQN K) : 0 ≤ q := by
  obtain ⟨k, hk, rfl⟩ := List.getElem_of_mem hq
  have hk' : k < K := by simpa [hRatQN, hRatFrom_length] using hk
  have := hRatQN_getD K k hk'
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hk, Option.getD_some] at this
  rw [this]
  exact hRat_nonneg k

lemma lowerOf_hRatsN (K : ℕ) : LowerOf (hRatsN K) (hRatLoN K) := by
  unfold LowerOf hRatsN hRatLoN
  rw [List.forall₂_map_left_iff, List.forall₂_map_right_iff]
  exact List.forall₂_same.2 fun q hq => ⟨ofRatLo_nonneg (hRatQN_mem_nonneg hq), ofRatLo_le q⟩

lemma mem_sProfN (K : ℕ) (row : List ℚ) (n : ℕ) (hn : n < K) :
    mem ((sProf row n : ℚ) : ℝ) ((composeI K (row.map ofRatI) (hRatLN K)).getD n zeroI) := by
  have hP : ∀ N, memB N (ofListQ row) (row.map ofRatI) := fun N => memB_ofListQ _ _
  have key := memB_composeI hP (forall₂_hRatsN K) n hn
  rw [horner_eq_polySum, ← compose_getD_eq_coeff] at key
  rw [sProf_eq_compose]
  have e : compose (fun j => (hRat j : ℝ)) (ofListQ row) n
      = compose (fun j => (hRatsN K).getD j 0) (ofListQ row) n :=
    compose_congr _ _ fun j hj => by rw [hRatsN_getD K j (by omega)]
  rw [e]
  exact key

lemma memS_scalarColI (K : ℕ) (row : List ℚ) :
    memS K (fun n => Real.pi * (sProf row n : ℝ)) (scalarColI K row).1 := by
  intro n hn
  unfold scalarColI
  simp only
  rw [getD_map_mulI]
  exact mem_mul mem_pi (mem_sProfN K row n hn)

lemma majSumLoN_le (K : ℕ) (row : List ℚ) :
    (majSumLoN K row : ℝ) ≤ (∑ n ∈ range K, Real.pi * (sProf (absL row) n : ℝ)) * D := by
  have hP : ∀ N, memLoB N (ofListQ (absL row)) ((absL row).map ofRatLo) := fun N =>
    memLoB_ofListQ_abs _ _
  have key := memLoB_composeLo hP (N := K) (lowerOf_hRatsN K)
  have hS : memLo K (fun n => (sProf (absL row) n : ℝ))
      (composeLo K ((absL row).map ofRatLo) (hRatLoN K)) := by
    intro n hn
    have k := key n hn
    rw [horner_eq_polySum, ← compose_getD_eq_coeff] at k
    beta_reduce
    rw [sProf_eq_compose]
    have e : compose (fun j => (hRat j : ℝ)) (ofListQ (absL row)) n
        = compose (fun j => (hRatsN K).getD j 0) (ofListQ (absL row)) n :=
      compose_congr _ _ fun j hj => by rw [hRatsN_getD K j (by omega)]
    rw [e]
    exact k
  have hπ := memLo_map_mulLo pi_lo hS
  unfold majSumLoN
  refine sum_le_of_memLo hπ ?_
  simp only [List.length_map, composeLo]
  exact List.length_take_le _ _

/-! ### The columns -/

lemma colC_eq (C : Cert) (i : Fin C.specs.length) : colC C i = colOfSpec C.K (specAt C i) := by
  unfold colC allColsC specAt
  rw [List.map_map, List.getD_eq_getElem?_getD, List.getElem?_map, List.getD_eq_getElem?_getD,
    List.getElem?_eq_getElem i.2]
  rfl

lemma memS_colC {C : Cert} (hok : certOK C = true) {μ : ℕ → ℕ × ℕ → ℝ} (hμ : TabInAll C μ)
    (i : Fin C.specs.length) : memS C.K (colR C μ i) (colC C i).1 := by
  rw [colC_eq]
  unfold colR
  have hs := specOK_at hok i
  rcases h : specAt C i with row | d
  · simp only [colOfSpec]
    exact memS_scalarColI C.K row
  · simp only [colOfSpec, bivarColI]
    rw [h] at hs
    have hd := specOK_bivar hs
    exact memS_bivarCol (fun N => memB_ofListQ _ _) (fun N => memB_ofListQ _ _)
      (tabMem_of_tabIn (hμ i d h)) (tabBounds_of_ok hd.1) C.K

lemma tail_colC {C : Cert} (hok : certOK C = true) {μ : ℕ → ℕ × ℕ → ℝ} (hμ : TabInAll C μ)
    (i : Fin C.specs.length) :
    0 ≤ (colC C i).2 ∧ (majTailC C i + highTailC C μ i) * D ≤ ((colC C i).2 : ℝ) := by
  rw [colC_eq]
  unfold majTailC highTailC
  have hs := specOK_at hok i
  have hD := D_pos
  rcases h : specAt C i with row | d
  · simp only [colOfSpec, scalarColI]
    refine ⟨le_max_left _ _, ?_⟩
    have := majSumLoN_le C.K row
    push_cast
    refine le_trans ?_ (le_max_right _ _)
    rw [add_zero, sub_mul, one_mul]
    linarith
  · simp only [colOfSpec, bivarColI]
    rw [h] at hs
    have hd := specOK_bivar hs
    have := bivarCol_tail (P := ofListQ d.P) (Q := ofListQ d.Q) (PI := PI d) (QI := QI d)
      (fun N => memB_ofListQ d.P N) (fun N => memB_ofListQ d.Q N)
      (tabMem_of_tabIn (hμ i d h)) (tabBounds_of_ok hd.1) C.K (fullLenB d)
    rw [zero_add]
    exact this

lemma mem_wtC (C : Cert) (i : ℕ) : mem (wtC C i) (wtIC C i) := mem_ofRatI _

lemma wtC_pos {C : Cert} (hok : certOK C = true) (i : Fin C.specs.length) : 0 < wtC C i := by
  unfold wtC; exact_mod_cast wtQC_pos hok i

lemma IccC_eq_Ico (K : ℕ) : Icc 1 (K - 1) = Ico 1 K := by
  ext n; simp only [mem_Icc, mem_Ico]; omega

/-- **Soundness of the finite certificate.** -/
theorem finite_certC_exact {C : Cert} (hok : certOK C = true) :
    FiniteCertC C ((dloIntC C : ℚ) / ((D : ℤ) : ℚ)) := by
  intro μ hμ
  have hc := certOK_iff hok
  have hcol := fun i => memS_colC hok hμ i
  have htail := fun i => tail_colC hok hμ i
  have hmix : memS C.K (mixC C μ) (mixColC C) := memS_mixL (mem_wtC C ·) hcol
  have hD := D_pos
  have h1 : (headLo (mixColC C) : ℝ) ≤ mixC C μ 0 * D := headLo_le hc.2.2.1 hmix
  have h2 : (∑ n ∈ Icc 1 (C.K - 1), |mixC C μ n|) * D ≤ (absSumFrom 1 (mixColC C) : ℝ) := by
    rw [IccC_eq_Ico]; exact absSumFrom_le hmix
  have h3 : (∑ i : Fin C.specs.length, wtC C i * (majTailC C i + highTailC C μ i)) * D
      ≤ (tailsIntC C : ℝ) := by
    unfold tailsIntC
    rw [List.sum_ofFn]
    push_cast
    rw [sum_mul]
    exact sum_le_sum fun i _ =>
      wTailUp_le (mem_wtC C i) (wtC_pos hok i) (htail i).1 (htail i).2
  rw [Rat.cast_div, Rat.cast_intCast, Rat.cast_intCast, div_le_iff₀ hD, sub_mul, sub_mul]
  unfold dloIntC
  push_cast
  linarith

/-- `FiniteCertC` is monotone. -/
lemma FiniteCertC.mono {C : Cert} {Dlo Dlo' : ℚ} (h : FiniteCertC C Dlo) (hle : Dlo' ≤ Dlo) :
    FiniteCertC C Dlo' := by
  intro μ hμ
  have := h μ hμ
  have hle' : (Dlo' : ℝ) ≤ Dlo := by exact_mod_cast hle
  linarith

/-! ### Assembly -/

/-- Composing a dominated radial kernel with an admissible preprocessor row. -/
theorem dominated_compose_row {c : ℕ → ℝ} (hc : Summable fun n => |c n|)
    (hdom : DominatedKernel (radialKernel c)) (row : List ℚ) (hrow : l1 (ofListQ row) ≤ 1) :
    DominatedKernel (radialKernel (compose c (ofListQ row))) := by
  have he : ∑ j ∈ range (row.length + 1), |(ofListQ row).coeff j| ≤ 1 :=
    (sum_abs_coeff_le_l1 _ _).trans hrow
  have hpre := hdom.comp_physPoly (fun j => (ofListQ row).coeff j) _ he
  refine hpre.congr_disc fun z hz => ?_
  rw [physPoly_coeff_eq (ofListQ row) (Nat.lt_succ_of_le (natDegree_ofListQ_le row)) z,
    radialKernel_comp _ hc _ hrow hz]

lemma coeff_absL_eq (row : List ℚ) (n : ℕ) :
    (ofListQ (absL row)).coeff n = |(ofListQ row).coeff n| := by
  unfold absL
  rw [coeff_ofListQ, coeff_ofListQ]
  unfold coeffQ
  have : ∀ (l : List ℚ) (n : ℕ), (l.map fun q => |q|).getD n 0 = |l.getD n 0| := by
    intro l
    induction l with
    | nil => intro n; simp
    | cons a l ih =>
      intro n
      cases n with
      | zero => simp
      | succ n => simp only [List.map_cons, List.getD_cons_succ]; exact ih n
  rw [this, Rat.cast_abs]

/-- **The majorant tail bound** of a Haagerup branch with retained length `K`. -/
theorem scalar_tail_leN (hsum : ∑' n, h n ≤ 1) (K : ℕ) (row : List ℚ)
    (hrow : (absL row).sum ≤ 1) :
    ∑' n, |compose h (ofListQ row) (n + K)|
      ≤ 1 - ∑ n ∈ range K, Real.pi * (sProf (absL row) n : ℝ) := by
  have hl1 : l1 (ofListQ row) ≤ 1 := l1_le_one_of hrow
  have hl1a : l1 (ofListQ (absL row)) ≤ 1 := by
    refine (l1_le_absL _).trans ?_
    have : (absL (absL row)).sum = (absL row).sum := by
      unfold absL; rw [List.map_map]; congr 1
      exact List.map_congr_left fun q _ => by simp [abs_abs]
    rw [this]; exact_mod_cast hrow
  have hE : ∀ n, |(ofListQ row).coeff n| ≤ (ofListQ (absL row)).coeff n :=
    fun n => (coeff_absL_eq row n).ge
  have hEa : ∀ n, 0 ≤ (ofListQ (absL row)).coeff n :=
    fun n => (coeff_absL_eq row n).symm ▸ abs_nonneg _
  have hg0 : ∀ n, 0 ≤ compose h (ofListQ (absL row)) n := compose_nonneg h_nonneg hEa
  have hg_sum : Summable fun n => compose h (ofListQ (absL row)) n := by
    have := summable_abs_compose h h_summable _ hl1a
    exact this.congr fun n => abs_of_nonneg (hg0 n)
  have hg_le : ∑' n, compose h (ofListQ (absL row)) n ≤ 1 := by
    calc ∑' n, compose h (ofListQ (absL row)) n
        = ∑' n, |compose h (ofListQ (absL row)) n| :=
          tsum_congr fun n => (abs_of_nonneg (hg0 n)).symm
      _ ≤ ∑' n, |h n| := tsum_abs_compose_le h h_summable _ hl1a
      _ = ∑' n, h n := tsum_congr fun n => abs_of_nonneg (h_nonneg n)
      _ ≤ 1 := hsum
  have hf_sum : Summable fun n => |compose h (ofListQ row) (n + K)| :=
    (summable_nat_add_iff (f := fun n => |compose h (ofListQ row) n|) K).mpr
      (summable_abs_compose h h_summable _ hl1)
  have hsplit := hg_sum.sum_add_tsum_nat_add K
  have e : ∑ n ∈ range K, Real.pi * (sProf (absL row) n : ℝ)
      = ∑ n ∈ range K, compose h (ofListQ (absL row)) n :=
    sum_congr rfl fun n _ => (compose_h_eq_pi_sProf _ _).symm
  rw [e]
  calc ∑' n, |compose h (ofListQ row) (n + K)|
      ≤ ∑' n, compose h (ofListQ (absL row)) (n + K) :=
        Summable.tsum_le_tsum (fun n => abs_compose_le_majorant h_nonneg hE _) hf_sum
          ((summable_nat_add_iff (f := fun n => compose h (ofListQ (absL row)) n) K).mpr hg_sum)
    _ = ∑' n, compose h (ofListQ (absL row)) n
          - ∑ n ∈ range K, compose h (ofListQ (absL row)) n := by linarith
    _ ≤ 1 - ∑ n ∈ range K, compose h (ofListQ (absL row)) n := by linarith

/-- Reduction of the remainder of a branch to its tail when the retained part is exact. -/
lemma remainder_eq_tail (K : ℕ) (f : ℕ → ℝ) (hf : Summable fun n => |f n|) (P : ℕ → ℝ)
    (hP : ∀ n, P n = if n < K then f n else 0) :
    ∑' n, |f n - P n| = ∑' n, |f (n + K)| := by
  have hPs : Summable fun n => |P n| :=
    summable_of_ne_finset_zero (s := range K) fun n hn => by
      rw [hP, ite_eq_right (by simpa using hn), abs_zero]
  have hR : Summable fun n => |f n - P n| :=
    Summable.of_nonneg_of_le (fun n => abs_nonneg _) (fun n => abs_sub _ _) (hf.add hPs)
  rw [← hR.sum_add_tsum_nat_add K]
  have e1 : ∑ n ∈ range K, |f n - P n| = 0 :=
    sum_eq_zero fun n hn => by
      rw [hP, ite_eq_left (by simpa using hn), sub_self, abs_zero]
  rw [e1, zero_add]
  refine tsum_congr fun n => ?_
  rw [hP, ite_eq_right (by omega), sub_zero]

lemma max_le_Mx {d : BivarData} (hd : (absL d.P).sum ^ (d.NZ + 1) ≤ d.Mx)
    (hd' : (absL d.Q).sum ^ (d.MW + 1) ≤ d.Mx) :
    max (l1 (ofListQ d.P) ^ (d.NZ + 1)) (l1 (ofListQ d.Q) ^ (d.MW + 1)) ≤ (d.Mx : ℝ) := by
  have h1 : l1 (ofListQ d.P) ^ (d.NZ + 1) ≤ (d.Mx : ℝ) := by
    calc l1 (ofListQ d.P) ^ (d.NZ + 1) ≤ (((absL d.P).sum : ℚ) : ℝ) ^ (d.NZ + 1) :=
          pow_le_pow_left₀ (l1_nonneg _) (l1_le_absL _) _
      _ ≤ (d.Mx : ℝ) := by exact_mod_cast hd
  have h2 : l1 (ofListQ d.Q) ^ (d.MW + 1) ≤ (d.Mx : ℝ) := by
    calc l1 (ofListQ d.Q) ^ (d.MW + 1) ≤ (((absL d.Q).sum : ℚ) : ℝ) ^ (d.MW + 1) :=
          pow_le_pow_left₀ (l1_nonneg _) (l1_le_absL _) _
      _ ≤ (d.Mx : ℝ) := by exact_mod_cast hd'
  exact max_le h1 h2

/-- Every unknown index is outside the box or has even parity (where `μ` vanishes). -/
lemma out_of_covers {d : BivarData} (hc : coversBox d = true) (μ : ℕ × ℕ → ℝ)
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) :
    ∀ p ∉ tabIdx d, d.NZ < p.1 ∨ d.MW < p.2 ∨ μ p = 0 := by
  intro p hp
  by_contra hcon
  push Not at hcon
  obtain ⟨h1, h2, h3⟩ := hcon
  unfold coversBox at hc
  simp only [List.all_eq_true, List.mem_range, Bool.or_eq_true, beq_iff_eq,
    List.contains_iff_mem] at hc
  rcases hc p.1 (by omega) p.2 (by omega) with h | h
  · exact h3 (hpar p h)
  · exact hp (List.mem_toFinset.2 h)

/-- The remainder of a two-coordinate branch. -/
theorem bivar_tail_leC {d : BivarData} (hs : specOK (.bivar d) = true) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0)
    (hT : ∑' p : {p // p ∉ tabIdx d}, |μ p| ≤ (d.T : ℝ)) (K : ℕ) :
    ∑' j, |bivarKernel (ofListQ d.P) (ofListQ d.Q) μ j
        - (if j < K then (tabPoly (ofListQ d.P) (ofListQ d.Q) (tabR μ d)).coeff j else 0)|
      ≤ ∑ n ∈ Ico K (fullLenB d), |(tabPoly (ofListQ d.P) (ofListQ d.Q) (tabR μ d)).coeff n|
        + (d.T : ℝ) * d.Mx := by
  have hd := specOK_bivar hs
  have hnd := idxNodup_of_ok hd.1
  have hP : l1 (ofListQ d.P) ≤ 1 := l1_le_one_of hd.2.2.1
  have hQ : l1 (ofListQ d.Q) ≤ 1 := l1_le_one_of hd.2.2.2.1
  have hdegP : (ofListQ d.P).natDegree ≤ d.P.length := natDegree_ofListQ_le _
  have hdegQ : (ofListQ d.Q).natDegree ≤ d.Q.length := natDegree_ofListQ_le _
  have hhi := tsum_known_tail_eq (ofListQ d.P) (ofListQ d.Q) μ hd.1 hdegP hdegQ K
  have key := bivar_remainder_le (ofListQ d.P) (ofListQ d.Q) hP hQ μ hμ (tabIdx d)
    (out_of_covers hd.2.1 μ hpar) (d.T : ℝ) hT K _ hhi.le
  have e : ∀ j, (if j < K then knownCoeff (ofListQ d.P) (ofListQ d.Q) μ (tabIdx d) j else 0)
      = (if j < K then (tabPoly (ofListQ d.P) (ofListQ d.Q) (tabR μ d)).coeff j else 0) := by
    intro j; split_ifs
    · exact knownCoeff_eq_coeff _ _ μ hnd j
    · rfl
  simp_rw [e] at key
  refine key.trans (add_le_add le_rfl ?_)
  exact mul_le_mul_of_nonneg_left (max_le_Mx hd.2.2.2.2.1 hd.2.2.2.2.2.1)
    (by exact_mod_cast hd.2.2.2.2.2.2)

lemma extraC_eq (C : Cert) (i : ℕ) {d : BivarData} (h : specAt C i = .bivar d) :
    extraC C i = (d.T : ℝ) * d.Mx := by
  unfold extraC extraQ; rw [h]; push_cast; rfl

lemma extraC_scalar (C : Cert) (i : ℕ) {row : List ℚ} (h : specAt C i = .scalar row) :
    extraC C i = 0 := by
  unfold extraC extraQ; rw [h]; simp

lemma restQ_eq (C : Cert) : ((restQ C : ℚ) : ℝ) = ∑ i : Fin C.specs.length, wtC C i * extraC C i := by
  unfold restQ wtC extraC
  rw [List.sum_ofFn]
  push_cast
  rfl

lemma massQ_eq (C : Cert) : ((massQ C : ℚ) : ℝ) = ∑ i : Fin C.specs.length, wtC C i := by
  unfold massQ wtC
  rw [List.sum_ofFn]
  push_cast
  rfl

/-- The analytic hypotheses of the two-coordinate branches. -/
structure BivarHyps (C : Cert) (μ : ℕ → ℕ × ℕ → ℝ) : Prop where
  valid : ∀ (i : Fin C.specs.length) (d : BivarData), specAt C i = .bivar d →
    DominatedKernel (radialKernel (bivarKernel (ofListQ d.P) (ofListQ d.Q) (μ i)))
  summable : ∀ (i : Fin C.specs.length) (d : BivarData), specAt C i = .bivar d →
    Summable fun p => |μ i p|
  parity : ∀ (i : Fin C.specs.length) (d : BivarData), specAt C i = .bivar d →
    ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ i p = 0
  rest : ∀ (i : Fin C.specs.length) (d : BivarData), specAt C i = .bivar d →
    ∑' p : {p // p ∉ tabIdx d}, |μ i p| ≤ (d.T : ℝ)
  enclosed : TabInAll C μ

set_option maxHeartbeats 4000000 in
/-- **Assembly.** -/
theorem bound_of_certC {C : Cert} (hok : certOK C = true) (hh : DominatedKernel (radialKernel h))
    (μ : ℕ → ℕ × ℕ → ℝ) (hb : BivarHyps C μ) (Dlo : ℚ) (hfin : FiniteCertC C Dlo)
    (hpos : 0 < (Dlo : ℝ) - restQ C) :
    IsGrothendieckBound ((massQ C : ℝ) / ((Dlo : ℝ) - restQ C)) := by
  have hc := certOK_iff hok
  have hsum : ∑' n, h n ≤ 1 := tsum_le_one_of_dominated h_nonneg hh
  have hm : 0 < C.specs.length := Nat.pos_of_ne_zero hc.2.1
  -- summability
  have hk : ∀ i : Fin C.specs.length, Summable fun n => |kernelC C μ i n| := by
    intro i
    have hs := specOK_at hok i
    unfold kernelC
    rcases h : specAt C i with row | d
    · simp only
      rw [h] at hs
      exact summable_abs_compose _ h_summable _ (l1_le_one_of (specOK_scalar hs))
    · simp only
      rw [h] at hs
      have hd := specOK_bivar hs
      exact summable_abs_bivarKernel _ _ (l1_le_one_of hd.2.2.1) (l1_le_one_of hd.2.2.2.1) _
        (hb.summable i d h)
  -- domination
  have hdom : ∀ i : Fin C.specs.length, DominatedKernel (radialKernel (kernelC C μ i)) := by
    intro i
    have hs := specOK_at hok i
    unfold kernelC
    rcases h : specAt C i with row | d
    · simp only
      rw [h] at hs
      exact dominated_compose_row h_summable hh row (l1_le_one_of (specOK_scalar hs))
    · simp only
      exact hb.valid i d h
  -- retained parts
  have hP : ∀ (i : Fin C.specs.length) n, C.K ≤ n → retainedC C μ i n = 0 := fun i n hn => by
    unfold retainedC; rw [ite_eq_right (by omega)]
  -- tails
  have hτ : ∀ i : Fin C.specs.length, ∑' n, |kernelC C μ i n - retainedC C μ i n|
      ≤ majTailC C i + highTailC C μ i + extraC C i := by
    intro i
    have hs := specOK_at hok i
    unfold kernelC retainedC colR majTailC highTailC
    rcases h : specAt C i with row | d
    · simp only
      rw [h] at hs
      rw [extraC_scalar C i h, add_zero, add_zero]
      rw [remainder_eq_tail C.K _ (summable_abs_compose _ h_summable _
        (l1_le_one_of (specOK_scalar hs))) _ (fun n => by
          split_ifs <;> simp [compose_h_eq_pi_sProf])]
      exact scalar_tail_leN hsum C.K row (specOK_scalar hs)
    · simp only
      rw [h] at hs
      rw [extraC_eq C i h, zero_add]
      exact bivar_tail_leC hs (μ i) (hb.summable i d h) (hb.parity i d h) (hb.rest i d h) C.K
  have hfin' := hfin μ hb.enclosed
  have hmix : ∀ n, n < C.K → mixC C μ n = ∑ i : Fin C.specs.length, wtC C i * retainedC C μ i n := by
    intro n hn
    unfold mixC retainedC
    exact sum_congr rfl fun i _ => by rw [ite_eq_left hn]
  have hslope : (Dlo : ℝ) - restQ C
      ≤ ∑ i : Fin C.specs.length, wtC C i * retainedC C μ i 0
        - ∑ n ∈ Icc 1 (C.K - 1), |∑ i : Fin C.specs.length, wtC C i * retainedC C μ i n|
        - ∑ i : Fin C.specs.length, wtC C i * (majTailC C i + highTailC C μ i + extraC C i) := by
    rw [← hmix 0 hc.2.2.1]
    have e : ∑ n ∈ Icc 1 (C.K - 1), |∑ i : Fin C.specs.length, wtC C i * retainedC C μ i n|
        = ∑ n ∈ Icc 1 (C.K - 1), |mixC C μ n| :=
      sum_congr rfl fun n hn => by rw [hmix n (by simp only [mem_Icc] at hn; omega)]
    rw [e]
    have e2 : ∑ i : Fin C.specs.length, wtC C i * (majTailC C i + highTailC C μ i + extraC C i)
        = ∑ i : Fin C.specs.length, wtC C i * (majTailC C i + highTailC C μ i)
          + ∑ i : Fin C.specs.length, wtC C i * extraC C i := by
      rw [← sum_add_distrib]; exact sum_congr rfl fun i _ => by ring
    rw [e2, ← restQ_eq]
    linarith
  have hB := bound_of_branches hm (fun i => wtC C i) (wtC_pos hok) (fun i => kernelC C μ i) hk hdom
    C.K hc.2.2.1 (fun i => retainedC C μ i) hP _ hτ _ hpos hslope
  rw [massQ_eq]
  exact hB

end

end Grothe.Upper
