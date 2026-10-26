import Mathlib
import Grothe.LowerAnalytic.CapLinAlgDefs

/-!
# Exact quadratic-form checks for the cap certificates (route Core, finite-dimensional part)

Matrices are lists of rows of rationals (`QMat`, entry `m.at i j`, zero outside the list), vectors
are functions `ℕ → ℝ`; `qf m n w = Σ_{i,j<n} m_ij w_i w_j`.

* `ldl`: exact `LDLᵀ` elimination (no proof needed: only its output is checked);
* `ldlOK m n` checks `m = L diag(d) Lᵀ` entrywise and `d ≥ 0` for `(L, d) = ldl m n`;
  `qf_nonneg_of_ldlOK`: then `qf m n w ≥ 0` for every `w`;
* `loewnerUp lo hi n`: from entrywise enclosures `lo ≤ T ≤ hi` of a symmetric real matrix, the
  rational matrix `mid + ρ I` (`ρ` = the largest row sum of the radii) with
  `qf T n w ≤ qf (loewnerUp lo hi n) n w` (`qf_le_loewnerUp`; AF §5).
-/

open Finset

namespace Grothe.LowerAnalytic

/-- The real quadratic form `Σ_{i,j<n} m_ij w_i w_j`. -/
noncomputable def qf (m : ℕ → ℕ → ℝ) (n : ℕ) (w : ℕ → ℝ) : ℝ :=
  ∑ i ∈ range n, ∑ j ∈ range n, m i j * w i * w j

lemma QMat.at_ofFn {n : ℕ} (f : ℕ → ℕ → ℚ) {i j : ℕ} (hi : i < n) (hj : j < n) :
    (QMat.ofFn n f).at i j = f i j := by
  simp [QMat.at, QMat.ofFn, List.getD_eq_getElem?_getD, hi, hj]

/-! ### Exact `LDLᵀ` -/

lemma sum_range_map {n : ℕ} (f : ℕ → ℚ) : ((List.range n).map f).sum = ∑ k ∈ range n, f k := by
  induction n with
  | zero => simp
  | succ n ih => rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ, ih]; simp

/-- **Soundness of the `LDLᵀ` check.** -/
theorem qf_nonneg_of_ldlOK {m : QMat} {n : ℕ} (h : ldlOK m n = true) (w : ℕ → ℝ) :
    0 ≤ qf (fun i j => (m.at i j : ℝ)) n w := by
  simp only [ldlOK, Bool.and_eq_true, List.all_eq_true, List.mem_range, beq_iff_eq,
    decide_eq_true_eq] at h
  obtain ⟨hid, hd⟩ := h
  generalize ldl m n = r at hid hd
  have e : qf (fun i j => (m.at i j : ℝ)) n w
      = ∑ k ∈ range n, (r.2.getD k 0 : ℝ) * (∑ i ∈ range n, (r.1.at i k : ℝ) * w i) ^ 2 := by
    unfold qf
    have : ∀ i ∈ range n, ∀ j ∈ range n, (m.at i j : ℝ) * w i * w j
        = ∑ k ∈ range n, (r.2.getD k 0 : ℝ) * (((r.1.at i k : ℝ) * w i) * ((r.1.at j k : ℝ) * w j)) := by
      intro i hi j hj
      rw [hid i (mem_range.1 hi) j (mem_range.1 hj), sum_range_map]
      push_cast
      rw [Finset.sum_mul, Finset.sum_mul]
      refine Finset.sum_congr rfl fun k _ => by ring
    rw [Finset.sum_congr rfl fun i hi => Finset.sum_congr rfl fun j hj => this i hi j hj]
    have e2 : ∀ k ∈ range n, (r.2.getD k 0 : ℝ) * (∑ i ∈ range n, (r.1.at i k : ℝ) * w i) ^ 2
        = ∑ i ∈ range n, ∑ j ∈ range n,
            (r.2.getD k 0 : ℝ) * (((r.1.at i k : ℝ) * w i) * ((r.1.at j k : ℝ) * w j)) := by
      intro k _
      rw [sq, Finset.sum_mul_sum, Finset.mul_sum]
      exact Finset.sum_congr rfl fun i _ => by rw [Finset.mul_sum]
    exact (Finset.sum_congr rfl fun i _ => Finset.sum_comm).trans
      (Finset.sum_comm.trans (Finset.sum_congr rfl e2).symm)
  rw [e]
  refine Finset.sum_nonneg fun k hk => mul_nonneg ?_ (sq_nonneg _)
  exact_mod_cast hd k (mem_range.1 hk)

/-! ### The Loewner upper matrix of an interval matrix -/

lemma rowsum_le_rhoM (lo hi : QMat) (n : ℕ) {i : ℕ} (hi' : i < n) :
    ∑ j ∈ range n, radM lo hi i j ≤ rhoM lo hi n := by
  rw [← sum_range_map]
  unfold rhoM
  have key : ∀ (l : List ℕ) (a : ℚ), i ∈ l →
      ((List.range n).map (radM lo hi i)).sum
        ≤ l.foldl (fun acc i => max acc ((List.range n).map (radM lo hi i)).sum) a := by
    have mono : ∀ (l : List ℕ) (a : ℚ),
        a ≤ l.foldl (fun acc i => max acc ((List.range n).map (radM lo hi i)).sum) a := by
      intro l
      induction l with
      | nil => intro a; exact le_rfl
      | cons x xs ih => intro a; exact (le_max_left _ _).trans (ih _)
    intro l
    induction l with
    | nil => intro a h; simp at h
    | cons x xs ih =>
      intro a h
      rcases List.mem_cons.1 h with rfl | h
      · exact (le_max_right _ _).trans (mono _ _)
      · exact ih _ h
  exact key _ 0 (List.mem_range.2 hi')

/-- **The Loewner bound** (AF §5): a real matrix with entries in `[lo, hi]` is below
`mid + ρ I` in quadratic-form order. -/
theorem qf_le_loewnerUp {lo up : QMat} {n : ℕ} (hok : enclOK lo up n = true) (T : ℕ → ℕ → ℝ)
    (hT : ∀ i < n, ∀ j < n, (lo.at i j : ℝ) ≤ T i j ∧ T i j ≤ up.at i j) (w : ℕ → ℝ) :
    qf T n w ≤ qf (fun i j => ((loewnerUp lo up n).at i j : ℝ)) n w := by
  simp only [enclOK, List.all_eq_true, List.mem_range, Bool.and_eq_true, decide_eq_true_eq,
    beq_iff_eq] at hok
  have hsym : ∀ i < n, ∀ j < n, radM lo up i j = radM lo up j i := by
    intro i hm j hj
    obtain ⟨⟨-, h1⟩, h2⟩ := hok i hm j hj
    simp only [radM, h1, h2]
  -- |T − mid| ≤ rad
  have hdev : ∀ i < n, ∀ j < n, |T i j - midM lo up i j| ≤ radM lo up i j := by
    intro i hm j hj
    obtain ⟨h1, h2⟩ := hT i hm j hj
    rw [abs_le]; simp only [midM, radM]; push_cast; constructor <;> linarith
  have hup : ∀ i ∈ range n, ∀ j ∈ range n, ((loewnerUp lo up n).at i j : ℝ)
      = midM lo up i j + if i = j then (rhoM lo up n : ℝ) else 0 := by
    intro i hm j hj
    rw [loewnerUp, QMat.at_ofFn _ (mem_range.1 hm) (mem_range.1 hj)]
    split_ifs <;> push_cast <;> ring
  have hR : qf (fun i j => ((loewnerUp lo up n).at i j : ℝ)) n w
      = ∑ i ∈ range n, ∑ j ∈ range n, (midM lo up i j : ℝ) * w i * w j
        + ∑ i ∈ range n, (rhoM lo up n : ℝ) * w i ^ 2 := by
    unfold qf
    beta_reduce
    rw [Finset.sum_congr rfl fun i hm => Finset.sum_congr rfl fun j hj => by rw [hup i hm j hj]]
    have hdiag : ∀ i ∈ range n,
        ∑ j ∈ range n, (if i = j then (rhoM lo up n : ℝ) else 0) * w i * w j
          = (rhoM lo up n : ℝ) * w i ^ 2 := by
      intro i hm
      rw [Finset.sum_eq_single i (fun j _ hj => by simp [Ne.symm hj])
        (fun h => absurd hm h)]
      simp; ring
    have split : ∀ i ∈ range n, ∑ j ∈ range n,
        ((midM lo up i j : ℝ) + (if i = j then (rhoM lo up n : ℝ) else 0)) * w i * w j
          = ∑ j ∈ range n, (midM lo up i j : ℝ) * w i * w j + (rhoM lo up n : ℝ) * w i ^ 2 := by
      intro i hm
      rw [← hdiag i hm, ← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun j _ => by ring
    rw [Finset.sum_congr rfl split, Finset.sum_add_distrib]
  rw [hR]
  unfold qf
  -- Σ (T − mid) w_i w_j ≤ Σ rad (w_i² + w_j²)/2 ≤ ρ Σ w_i²
  have h1 : ∑ i ∈ range n, ∑ j ∈ range n, (T i j - midM lo up i j) * w i * w j
      ≤ ∑ i ∈ range n, ∑ j ∈ range n, (radM lo up i j : ℝ) * ((w i ^ 2 + w j ^ 2) / 2) := by
    refine Finset.sum_le_sum fun i hm => Finset.sum_le_sum fun j hj => ?_
    have hd := hdev i (mem_range.1 hm) j (mem_range.1 hj)
    have hr : (0 : ℝ) ≤ radM lo up i j := (abs_nonneg _).trans hd
    have hw : |w i * w j| ≤ (w i ^ 2 + w j ^ 2) / 2 := by
      rw [abs_le]; constructor <;> nlinarith [sq_nonneg (w i - w j), sq_nonneg (w i + w j)]
    calc (T i j - midM lo up i j) * w i * w j = (T i j - midM lo up i j) * (w i * w j) := by ring
      _ ≤ |(T i j - midM lo up i j) * (w i * w j)| := le_abs_self _
      _ = |T i j - midM lo up i j| * |w i * w j| := abs_mul _ _
      _ ≤ (radM lo up i j : ℝ) * ((w i ^ 2 + w j ^ 2) / 2) :=
          mul_le_mul hd hw (abs_nonneg _) hr
  have h2 : ∑ i ∈ range n, ∑ j ∈ range n, (radM lo up i j : ℝ) * ((w i ^ 2 + w j ^ 2) / 2)
      = ∑ i ∈ range n, (∑ j ∈ range n, (radM lo up i j : ℝ)) * w i ^ 2 := by
    have e1 : ∀ i ∈ range n, ∑ j ∈ range n, (radM lo up i j : ℝ) * ((w i ^ 2 + w j ^ 2) / 2)
        = (∑ j ∈ range n, (radM lo up i j : ℝ)) * w i ^ 2 / 2
          + ∑ j ∈ range n, (radM lo up i j : ℝ) * w j ^ 2 / 2 := by
      intro i _
      rw [Finset.sum_mul, Finset.sum_div, ← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun j _ => by ring
    rw [Finset.sum_congr rfl e1, Finset.sum_add_distrib]
    have e2 : ∑ i ∈ range n, ∑ j ∈ range n, (radM lo up i j : ℝ) * w j ^ 2 / 2
        = ∑ i ∈ range n, (∑ j ∈ range n, (radM lo up i j : ℝ)) * w i ^ 2 / 2 := by
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun j hj => ?_
      rw [Finset.sum_mul, Finset.sum_div]
      refine Finset.sum_congr rfl fun i hm => ?_
      rw [hsym i (mem_range.1 hm) j (mem_range.1 hj)]
    rw [e2, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun i _ => by ring
  have h3 : ∑ i ∈ range n, (∑ j ∈ range n, (radM lo up i j : ℝ)) * w i ^ 2
      ≤ ∑ i ∈ range n, (rhoM lo up n : ℝ) * w i ^ 2 := by
    refine Finset.sum_le_sum fun i hm => mul_le_mul_of_nonneg_right ?_ (sq_nonneg _)
    exact_mod_cast rowsum_le_rhoM lo up n (mem_range.1 hm)
  have hsplitT : ∑ i ∈ range n, ∑ j ∈ range n, T i j * w i * w j
      = ∑ i ∈ range n, ∑ j ∈ range n, (midM lo up i j : ℝ) * w i * w j
        + ∑ i ∈ range n, ∑ j ∈ range n, (T i j - midM lo up i j) * w i * w j := by
    rw [← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun i _ => by
      rw [← Finset.sum_add_distrib]; exact Finset.sum_congr rfl fun j _ => by ring
  linarith

end Grothe.LowerAnalytic
