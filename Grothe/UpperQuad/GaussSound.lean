import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Gauss
import Grothe.UpperChaos.Q0LegendreWeight
import Grothe.UpperChaos.Q0GaussPhysical

/-!
# Soundness of the Gauss–Legendre layer (obligation S6a of #303, the finite part)

`legendrePairI` encloses `Q0LegendreInteger.realPair`, `weightI` encloses
`weight`, `panelNodesWeights` encloses `panelNode` /
`panelWeight` at every root lying in its bracket, and a bracket with a sign change of `P_n`
contains a root (intermediate value theorem).  The identification of the brackets with the
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

end Grothe.UpperQuad
