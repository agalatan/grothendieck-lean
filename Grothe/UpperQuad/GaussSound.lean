import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Gauss
import Grothe.UpperChaos.Q0LegendreWeight
import Grothe.UpperChaos.Q0GaussPhysical
import Grothe.UpperChaos.RadialLaguerre

/-!
# Soundness of the Gauss–Legendre layer (obligation S6a of #303, the finite part)

`legendrePairI` encloses `Q0LegendreInteger.realPair`, `weightI` encloses
`weight`, `panelNodesWeights` encloses `panelNode` /
`panelWeight` at every root lying in its bracket, and a bracket with a sign change of `P_n`
contains a root (intermediate value theorem); the radial Laguerre factors `radialRowI` enclose
`RadialLaguerre.radialFactor`: the diagonal of the Laguerre table through master's explicit sum
`assocLaguerre` and the rest by Pascal's rule (`assocLaguerre_pascal`).  The identification of the brackets with the
roots `Q0GaussSelectedChoice` uses (`root_spec`: the root lies in master's bracket, whose
literal equals the kernel's) is done where the data modules are bound.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.Q0LegendreInteger

lemma mem_legendrePairI (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : mem x xI) (k : ℕ) :
    mem (realPair x k).1 (legendrePairI P xI k).1 ∧
      mem (realPair x k).2 (legendrePairI P xI k).2 := by
  induction k with
  | zero =>
    simp only [realPair, legendrePairI]
    exact ⟨mem_one P, hx⟩
  | succ k ih =>
    simp only [realPair, legendrePairI]
    refine ⟨ih.2, ?_⟩
    have h := mem_divN P hP (by omega : 0 < k + 2)
      (mem_subI P (mem_mulN P (2 * k + 3) (mem_mulI P hx ih.2)) (mem_mulN P (k + 1) ih.1))
    convert h using 1
    push_cast
    ring

/-- `P_n x = (realPair x (n−1)).2` for `n ≥ 1`, `P_0 = 1`. -/
noncomputable def legendreP (x : ℝ) (n : ℕ) : ℝ :=
  match n with
  | 0 => 1
  | k + 1 => (realPair x k).2

lemma mem_legendreI (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : mem x xI) (n : ℕ) :
    mem (legendreP x n) (legendreI P xI n) := by
  cases n with
  | zero => simpa [legendreP, legendreI] using mem_one P
  | succ k => exact (mem_legendrePairI P hP hx k).2

lemma legendreP_eq_fst (x : ℝ) (k : ℕ) : legendreP x k = (realPair x k).1 := by
  cases k with
  | zero => simp [legendreP, realPair]
  | succ k => simp [legendreP, realPair]

/-- `weightI P n x` encloses `weight (n−1) x` for `n ≥ 1` (given the divisor's
positivity flag). -/
lemma mem_weightI (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : mem x xI) (n : ℕ) (hn : 1 ≤ n)
    (hden : 0 < (mulN P (n * n) (sqI P (legendreI P xI (n - 1)))).lo) :
    mem (weight (n - 1) x) (weightI P n xI) := by
  unfold weight weightI
  have hnum : mem (2 * (1 - x ^ 2)) (mulN P 2 (subI P (ofInt P 1) (sqI P xI))) := by
    have := mem_mulN P 2 (mem_subI P (mem_one P) (mem_sqI P hx))
    convert this using 1
    push_cast
    ring
  have hpm : mem ((realPair x (n - 1)).1) (legendreI P xI (n - 1)) := by
    rw [← legendreP_eq_fst]
    exact mem_legendreI P hP hx (n - 1)
  have hd : mem ((((n - 1 : ℕ) + 1 : ℕ) : ℝ) ^ 2 * (realPair x (n - 1)).1 ^ 2)
      (mulN P (n * n) (sqI P (legendreI P xI (n - 1)))) := by
    have := mem_mulN P (n * n) (mem_sqI P hpm)
    convert this using 1
    rw [Nat.sub_add_cancel hn]
    push_cast
    ring
  exact mem_divI P hnum hd hden

/-- The physical node of a panel `[lo, hi]` at the root `x`. -/
lemma mem_panelNode (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : mem x xI) (loN hiN : ℤ)
    (loD hiD : ℕ) (hlo : 0 < loD) (hhi : 0 < hiD) :
    mem (panelNode ((loN : ℝ) / loD) ((hiN : ℝ) / hiD) x)
      (addI P (ratI P loN loD) (mulI P (divN P 2 (subI P (ratI P hiN hiD) (ratI P loN loD)))
        (addI P (ofInt P 1) xI))) := by
  unfold panelNode
  have h := mem_addI P (mem_ratI P hP loN hlo)
    (mem_mulI P (mem_divN P hP (by norm_num : 0 < 2) (mem_subI P (mem_ratI P hP hiN hhi) (mem_ratI P hP loN hlo)))
      (mem_addI P (mem_one P) hx))
  convert h using 1

/-- `P_n` is continuous. -/
lemma continuous_realPair (k : ℕ) :
    Continuous (fun x : ℝ => (realPair x k).1) ∧ Continuous (fun x : ℝ => (realPair x k).2) := by
  induction k with
  | zero => simp only [realPair]; exact ⟨continuous_const, continuous_id⟩
  | succ k ih =>
    simp only [realPair]
    refine ⟨ih.2, ?_⟩
    have h1 := ih.1
    have h2 := ih.2
    fun_prop

lemma continuous_legendreP (n : ℕ) : Continuous (fun x : ℝ => legendreP x n) := by
  cases n with
  | zero => simp only [legendreP]; exact continuous_const
  | succ k => exact (continuous_realPair k).2

/-- A bracket on which `P_n` changes sign (as decided by the enclosures) contains a root. -/
lemma root_of_bracketOK (P n : ℕ) (hP : 1 ≤ P) {b : Bracket} (h : bracketOK P n b = true) :
    ∃ x : ℝ, mem x b.toIval ∧ legendreP x n = 0 := by
  unfold bracketOK at h
  simp only [Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨hle, -⟩, -⟩, hsign⟩ := h
  set lo : ℝ := (b.lo : ℝ) * (2 : ℝ) ^ (-(b.e : ℤ)) with hlo
  set hi : ℝ := (b.hi : ℝ) * (2 : ℝ) ^ (-(b.e : ℤ)) with hhi
  have hle' : lo ≤ hi := by
    rw [hlo, hhi]
    exact mul_le_mul_of_nonneg_right (by exact_mod_cast hle) (two_zpow_pos _).le
  have hml : mem lo ⟨b.lo, b.lo, -(b.e : ℤ)⟩ := ⟨le_refl _, le_refl _⟩
  have hmh : mem hi ⟨b.hi, b.hi, -(b.e : ℤ)⟩ := ⟨le_refl _, le_refl _⟩
  have hpl := mem_legendreI P hP hml n
  have hph := mem_legendreI P hP hmh n
  have hcont := (continuous_legendreP n).continuousOn (s := Set.Icc lo hi)
  have hroot : ∃ x ∈ Set.Icc lo hi, legendreP x n = 0 := by
    rcases hsign with ⟨hneg, hpos⟩ | ⟨hpos, hneg⟩
    · have h1 := neg_of_isNeg hneg hpl
      have h2 := pos_of_isPos hpos hph
      obtain ⟨x, hx, hx0⟩ := intermediate_value_Icc hle' hcont ⟨h1.le, h2.le⟩
      exact ⟨x, hx, hx0⟩
    · have h1 := pos_of_isPos hpos hpl
      have h2 := neg_of_isNeg hneg hph
      obtain ⟨x, hx, hx0⟩ := intermediate_value_Icc' hle' hcont ⟨h2.le, h1.le⟩
      exact ⟨x, hx, hx0⟩
  obtain ⟨x, ⟨hx1, hx2⟩, hx0⟩ := hroot
  exact ⟨x, ⟨hx1, hx2⟩, hx0⟩


/-! ### The radial Laguerre factors (`RadialLaguerre.radialFactor`) -/

lemma mem_powTable (P : ℕ) {x : ℝ} {xI : Ival} (hx : mem x xI) (M i : ℕ) (hi : i ≤ M) :
    mem (x ^ i) ((powTable P xI M).getD i zeroI) := by
  unfold powTable
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hi' : i < M + 1 := by omega
  simp only [hi', ↓reduceDIte, Option.getD_some]
  exact mem_powI P hx i

lemma factT_eq (n : ℕ) (hn : n ≤ 502) : factT n = n.factorial := by
  unfold factT factTable
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hn' : n < 503 := by omega
  simp only [hn', ↓reduceDIte, Option.getD_some, factNat_eq]

lemma binomRowArr_size (n M : ℕ) : (binomRowArr n M).size = M + 1 := by
  induction M with
  | zero => rfl
  | succ M ih => simp [binomRowArr, ih]

/-- The running product gives the binomials of the row (`i ≤ n`). -/
lemma binomRowArr_getD (n M : ℕ) :
    ∀ i, i ≤ M → i ≤ n → (binomRowArr n M).getD i 0 = n.choose i := by
  induction M with
  | zero =>
    intro i hi _
    interval_cases i
    rw [Nat.choose_zero_right]
    rfl
  | succ M ih =>
    intro i hi hin
    simp only [binomRowArr]
    rw [Array.getD_eq_getD_getElem?, Array.getElem?_push, binomRowArr_size]
    split_ifs with h
    · subst h
      simp only [Option.getD_some]
      rw [ih M le_rfl (by omega), ← Nat.choose_succ_right_eq, Nat.mul_div_cancel _ (by omega)]
    · rw [← Array.getD_eq_getD_getElem?]
      exact ih i (by omega) hin

lemma binomT_eq (n i : ℕ) (hn : n ≤ 502) (hi : i ≤ n) : binomT n i = n.choose i := by
  unfold binomT binomTable
  have hn' : n < 503 := by omega
  simp only [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn, hn', ↓reduceDIte, Option.getD_some]
  rw [← Array.getD_eq_getD_getElem?]
  exact binomRowArr_getD n n i hi hi

/-- The recursive specification of the term table `u_j = (−s)^j / j!`. -/
def negExpRec (P : ℕ) (negs : Ival) : ℕ → Ival
  | 0 => ofInt P 1
  | j + 1 => divN P (j + 1) (mulI P (negExpRec P negs j) negs)

lemma negExpTerms_size (P : ℕ) (negs : Ival) (M : ℕ) : (negExpTerms P negs M).size = M + 1 := by
  induction M with
  | zero => rfl
  | succ M ih => simp [negExpTerms, ih]

lemma negExpTerms_getD (P : ℕ) (negs : Ival) (M : ℕ) :
    ∀ j, j ≤ M → (negExpTerms P negs M).getD j zeroI = negExpRec P negs j := by
  induction M with
  | zero =>
    intro j hj
    interval_cases j
    rfl
  | succ M ih =>
    intro j hj
    simp only [negExpTerms]
    rw [Array.getD_eq_getD_getElem?, Array.getElem?_push, negExpTerms_size]
    split_ifs with h
    · subst h
      simp only [Option.getD_some, negExpRec]
      rw [ih M (le_refl M)]
    · rw [← Array.getD_eq_getD_getElem?]
      exact ih j (by omega)

lemma mem_negExpRec (P : ℕ) (hP : 1 ≤ P) {s : ℝ} {negs : Ival} (hs : mem (-s) negs) (j : ℕ) :
    mem ((-s) ^ j / (j.factorial : ℝ)) (negExpRec P negs j) := by
  induction j with
  | zero =>
    show mem _ (ofInt P 1)
    simpa using mem_one P
  | succ j ih =>
    simp only [negExpRec]
    have h := mem_divN P hP (by omega : 0 < j + 1) (mem_mulI P ih hs)
    convert h using 1
    rw [pow_succ, Nat.factorial_succ]
    push_cast
    field_simp

lemma mem_negExpTerms (P : ℕ) (hP : 1 ≤ P) {s : ℝ} {sI : Ival} (hs : mem s sI) (M j : ℕ) (hj : j ≤ M) :
    mem ((-s) ^ j / (j.factorial : ℝ)) ((negExpTerms P (negI sI) M).getD j zeroI) := by
  rw [negExpTerms_getD P (negI sI) M j hj]
  exact mem_negExpRec P hP (mem_negI hs) j

lemma mem_assocLaguerreI (P : ℕ) (k m : ℕ) (hkm : m + k ≤ 502) {s : ℝ}
    {uTab : Array Ival} (hu : ∀ j, j ≤ m → mem ((-s) ^ j / (j.factorial : ℝ)) (uTab.getD j zeroI)) :
    mem (RadialLaguerre.assocLaguerre k m s) (assocLaguerreI P k m uTab) := by
  unfold RadialLaguerre.assocLaguerre assocLaguerreI
  apply mem_sumRangeI P (m + 1)
  intro j hj
  rw [binomT_eq (m + k) (m - j) hkm (by omega)]
  have h := mem_mulN P ((m + k).choose (m - j)) (hu j (by omega))
  convert h using 1
  rw [neg_pow]
  ring

lemma mem_normFactorI (P : ℕ) (hP : 1 ≤ P) (k m : ℕ) (hkm : m + k ≤ 502) :
    mem (Real.sqrt ((m.factorial : ℝ) / ((m + k).factorial : ℝ))) (normFactorI P k m) := by
  unfold normFactorI
  apply mem_sqrtI P (by positivity)
  rw [factT_eq m (by omega), factT_eq (m + k) hkm]
  exact mem_divI P (mem_ofNat P _) (mem_ofNat P _) (ofNat_lo_pos P hP (Nat.factorial_pos _))

/-! ### The Laguerre table by Pascal's rule -/

lemma assocLaguerre_zero (k : ℕ) (s : ℝ) : RadialLaguerre.assocLaguerre k 0 s = 1 := by
  simp [RadialLaguerre.assocLaguerre]

/-- Pascal's rule on the binomials of the explicit sum: `L_{m+1}^{(k)} = L_{m+1}^{(k+1)} − L_m^{(k+1)}`. -/
lemma assocLaguerre_pascal (k m : ℕ) (s : ℝ) :
    RadialLaguerre.assocLaguerre k (m + 1) s =
      RadialLaguerre.assocLaguerre (k + 1) (m + 1) s - RadialLaguerre.assocLaguerre (k + 1) m s := by
  have hterm : ∀ j ∈ Finset.range (m + 1),
      (-1 : ℝ) ^ j * ((m + 1 + k).choose (m + 1 - j) : ℝ) / (j.factorial : ℝ) * s ^ j =
        (-1 : ℝ) ^ j * ((m + 1 + (k + 1)).choose (m + 1 - j) : ℝ) / (j.factorial : ℝ) * s ^ j -
          (-1 : ℝ) ^ j * ((m + (k + 1)).choose (m - j) : ℝ) / (j.factorial : ℝ) * s ^ j := by
    intro j hj
    rw [Finset.mem_range] at hj
    have h : (m + 1 + (k + 1)).choose (m + 1 - j) =
        (m + (k + 1)).choose (m - j) + (m + 1 + k).choose (m + 1 - j) := by
      rw [show m + 1 + (k + 1) = m + (k + 1) + 1 by ring, show m + 1 - j = m - j + 1 by omega,
        Nat.choose_succ_succ', show m + (k + 1) = m + 1 + k by ring]
    rw [h]
    push_cast
    ring
  unfold RadialLaguerre.assocLaguerre
  rw [Finset.sum_range_succ, Finset.sum_congr rfl hterm, Finset.sum_sub_distrib,
    Finset.sum_range_succ (fun j => (-1 : ℝ) ^ j * ((m + 1 + (k + 1)).choose (m + 1 - j) : ℝ) /
      (j.factorial : ℝ) * s ^ j) (m + 1)]
  simp only [Nat.sub_self, Nat.choose_zero_right, Nat.cast_one]
  ring

lemma lagLevel_getD (P K k : ℕ) (uTab prev : Array Ival) (m : ℕ) (hm : m ≤ K - k) :
    (lagLevel P K k uTab prev).getD m zeroI =
      if m = 0 then ofInt P 1 else if m = K - k then assocLaguerreI P k m uTab
      else subI P (prev.getD m zeroI) (prev.getD (m - 1) zeroI) := by
  unfold lagLevel
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hm' : m < K - k + 1 := by omega
  simp only [hm', ↓reduceDIte, Option.getD_some]

lemma lagLevels_size (P K : ℕ) (uTab : Array Ival) (i : ℕ) :
    (lagLevels P K uTab i).size = i + 1 := by
  induction i with
  | zero => rfl
  | succ i ih => simp [lagLevels, ih]

lemma lagLevels_getD_succ (P K : ℕ) (uTab : Array Ival) (i : ℕ) :
    (lagLevels P K uTab (i + 1)).getD (i + 1) #[] =
      lagLevel P K (K - (i + 1)) uTab ((lagLevels P K uTab i).getD i #[]) := by
  simp only [lagLevels]
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_push, lagLevels_size]
  simp

/-- The levels already built do not change when the table grows. -/
lemma lagLevels_getD_of_le (P K : ℕ) (uTab : Array Ival) (n j : ℕ) (hj : j ≤ n) :
    (lagLevels P K uTab n).getD j #[] = (lagLevels P K uTab j).getD j #[] := by
  induction n with
  | zero =>
    have : j = 0 := by omega
    subst this
    rfl
  | succ n ih =>
    rcases Nat.lt_or_ge j (n + 1) with h | h
    · rw [← ih (by omega)]
      simp only [lagLevels]
      rw [Array.getD_eq_getD_getElem?, Array.getElem?_push, lagLevels_size]
      have hne : ¬ j = n + 1 := by omega
      simp only [hne, ↓reduceIte]
      rw [← Array.getD_eq_getD_getElem?]
    · have : j = n + 1 := by omega
      subst this
      rfl

/-- Every entry of the level `K − i` of the Laguerre table encloses `L_m^{(K−i)}(s)`, `m ≤ i`
(`uTab` encloses the terms `u_j = (−s)^j/j!`, `j ≤ K`). -/
lemma mem_lagLevels (P K : ℕ) (hK : K ≤ 502) {s : ℝ} {uTab : Array Ival}
    (hu : ∀ j, j ≤ K → mem ((-s) ^ j / (j.factorial : ℝ)) (uTab.getD j zeroI)) (i : ℕ)
    (hi : i ≤ K) :
    ∀ m, m ≤ i → mem (RadialLaguerre.assocLaguerre (K - i) m s)
      (((lagLevels P K uTab i).getD i #[]).getD m zeroI) := by
  induction i with
  | zero =>
    intro m hm
    have hm0 : m = 0 := by omega
    subst hm0
    show mem _ (((#[lagLevel P K K uTab #[]] : Array (Array Ival)).getD 0 #[]).getD 0 zeroI)
    rw [show (#[lagLevel P K K uTab #[]] : Array (Array Ival)).getD 0 #[] = lagLevel P K K uTab #[]
      from rfl, lagLevel_getD P K K uTab #[] 0 (by omega), Nat.sub_zero, assocLaguerre_zero]
    split_ifs with h
    · exact mem_one P
    all_goals exact absurd rfl h
  | succ i ih =>
    intro m hm
    rw [lagLevels_getD_succ, lagLevel_getD P K (K - (i + 1)) uTab _ m (by omega)]
    have hKi : K - (i + 1) + 1 = K - i := by omega
    split_ifs with h0 hd
    · subst h0
      rw [assocLaguerre_zero]
      exact mem_one P
    · exact mem_assocLaguerreI P (K - (i + 1)) m (by omega) (fun j hj => hu j (by omega))
    · obtain ⟨m', rfl⟩ := Nat.exists_eq_add_one_of_ne_zero h0
      rw [assocLaguerre_pascal, hKi, Nat.add_sub_cancel]
      exact mem_subI P (ih (by omega) (m' + 1) (by omega)) (ih (by omega) m' (by omega))

/-- The Laguerre table encloses `L_m^{(k)}(s)` at the index `(K − k, m)`, `k ≤ K`, `m ≤ K − k`. -/
lemma mem_lagTable (P K : ℕ) (hK : K ≤ 502) {s : ℝ} {uTab : Array Ival}
    (hu : ∀ j, j ≤ K → mem ((-s) ^ j / (j.factorial : ℝ)) (uTab.getD j zeroI)) (k m : ℕ)
    (hk : k ≤ K) (hm : m ≤ K - k) :
    mem (RadialLaguerre.assocLaguerre k m s)
      (((lagTable P K uTab).getD (K - k) #[]).getD m zeroI) := by
  unfold lagTable
  rw [lagLevels_getD_of_le P K uTab K (K - k) (by omega)]
  have h := mem_lagLevels P K hK hu (K - k) (by omega) m hm
  rwa [show K - (K - k) = k by omega] at h

/-! ### The radial factors -/

lemma mem_radialFactorI (P : ℕ) (hP : 1 ≤ P) (k m : ℕ) (hkm : m + k ≤ 502) {s : ℝ} {lag : Ival}
    {rPow : Array Ival} (hlag : mem (RadialLaguerre.assocLaguerre k m s) lag)
    (hr : mem (Real.sqrt s ^ k) (rPow.getD k zeroI)) :
    mem (RadialLaguerre.radialFactor k m s) (radialFactorI P k m lag rPow) := by
  unfold RadialLaguerre.radialFactor RadialLaguerre.normalizedLaguerre radialFactorI
  have hv : mem (Real.sqrt s ^ k * (Real.sqrt ((m.factorial : ℝ) / ((m + k).factorial : ℝ)) *
      RadialLaguerre.assocLaguerre k m s))
      (mulI P (rPow.getD k zeroI) (mulI P (normFactorI P k m) lag)) :=
    mem_mulI P hr (mem_mulI P (mem_normFactorI P hP k m hkm) hlag)
  split_ifs with hk
  · have hk' : m % 2 = 1 := by simpa using hk
    have hneg : ((-1 : ℝ) ^ m) = -1 := by
      rw [← Nat.div_add_mod m 2, hk', pow_add, pow_mul]; simp
    rw [hneg]
    have := mem_negI hv
    convert this using 1
    ring
  · have hk' : m % 2 = 0 := by
      have := Nat.mod_two_eq_zero_or_one m
      simp at hk
      omega
    have hone : ((-1 : ℝ) ^ m) = 1 := by
      rw [← Nat.div_add_mod m 2, hk', add_zero, pow_mul]; simp
    rw [hone]
    convert hv using 1
    ring

/-- The radial row of the charge `k ≤ 251` from the Laguerre table of depth `251` and the power
table of `√s` encloses `ψ_{k,m}(s)` for `m ≤ M ≤ 251 − k`. -/
lemma mem_radialRowI (P : ℕ) (hP : 1 ≤ P) (k M : ℕ) {s : ℝ} {sI : Ival} (hs0 : 0 ≤ s)
    (hs : mem s sI) (hk : k ≤ 251) (hM : M ≤ 251 - k) (m : ℕ) (hm : m ≤ M) :
    mem (RadialLaguerre.radialFactor k m s)
      ((radialRowI P k M ((lagTable P 251 (negExpTerms P (negI sI) 251)).getD (251 - k) #[])
        (powTable P (sqrtI P sI) 251)).getD m zeroI) := by
  unfold radialRowI
  rw [Array.getD_eq_getD_getElem?, Array.getElem?_ofFn]
  have hm' : m < M + 1 := by omega
  simp only [hm', ↓reduceDIte, Option.getD_some]
  exact mem_radialFactorI P hP k m (by omega)
    (mem_lagTable P 251 (by norm_num) (fun j hj => mem_negExpTerms P hP hs 251 j hj) k m hk
      (by omega))
    (mem_powTable P (mem_sqrtI P hs0 hs) 251 k hk)

end Grothe.UpperQuad
