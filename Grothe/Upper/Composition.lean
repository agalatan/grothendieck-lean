import Grothe.Upper.Interface
import Grothe.Upper.Preprocessor
import Grothe.Upper.Mixture

/-!
# Radial composition with a preprocessor

For a polynomial `E` (with `ρ(t) = t·E(t²)`) and a coefficient sequence `c` with `∑|cₙ| < ∞`,
the radial kernel of `c` evaluated at `ρ^phys z = z·E(|z|²)` equals the radial kernel of the
composed coefficients `compose c E` (`radialKernel_comp`), for `‖z‖ ≤ 1` and `‖E‖_𝒜 ≤ 1`.
Moreover composition contracts the coefficient `ℓ¹` norm (`tsum_abs_compose_le`).
-/

namespace Grothe

open Finset Polynomial Upper

noncomputable section

/-- `∑_{k<K} |coeff p k| ≤ ‖p‖_𝒜`. -/
lemma sum_abs_coeff_le_l1 (p : ℝ[X]) (K : ℕ) : ∑ k ∈ range K, |p.coeff k| ≤ l1 p := by
  rw [l1_eq_sum_range p (N := max K (p.natDegree + 1)) (by omega)]
  apply sum_le_sum_of_subset_of_nonneg
  · intro k hk; exact mem_range.2 (lt_of_lt_of_le (mem_range.1 hk) (le_max_left _ _))
  · intro k _ _; exact abs_nonneg _

/-- `|E(x)| ≤ ‖E‖_𝒜` for `|x| ≤ 1`. -/
lemma abs_eval_le_l1 (E : ℝ[X]) {x : ℝ} (hx : |x| ≤ 1) : |E.eval x| ≤ l1 E := by
  rw [eval_eq_sum_range]
  refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
  refine (sum_le_sum fun k _ => ?_).trans (sum_abs_coeff_le_l1 E _)
  rw [abs_mul, abs_pow]
  calc |E.coeff k| * |x| ^ k ≤ |E.coeff k| * 1 ^ k := by gcongr
    _ = |E.coeff k| := by simp

lemma natDegree_ofListQ_le (l : List ℚ) : (ofListQ l).natDegree ≤ l.length := by
  induction l with
  | nil => simp [ofListQ]
  | cons a l ih =>
    simp only [ofListQ, List.length_cons]
    refine (natDegree_add_le _ _).trans (max_le ?_ ?_)
    · simp
    · refine (natDegree_mul_le).trans ?_
      simp only [natDegree_X]
      omega

/-- Linearity of `compose` in the coefficient sequence. -/
lemma compose_add (c r : ℕ → ℝ) (E : ℝ[X]) (n : ℕ) :
    compose (fun k => c k + r k) E n = compose c E n + compose r E n := by
  unfold compose
  rw [← sum_add_distrib]
  refine sum_congr rfl fun j _ => ?_
  ring

/-- Termwise bound. -/
lemma abs_compose_le (r : ℕ → ℝ) (E : ℝ[X]) (n : ℕ) :
    |compose r E n| ≤ ∑ j ∈ range (n + 1), |r j| * |(E ^ (2 * j + 1)).coeff (n - j)| := by
  unfold compose
  refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq ?_)
  simp [abs_mul]

/-- Partial sums of `|compose r E|` are bounded by `∑_{j<N} |r_j|` when `‖E‖_𝒜 ≤ 1`. -/
lemma sum_abs_compose_le (r : ℕ → ℝ) (E : ℝ[X]) (hE : l1 E ≤ 1) (N : ℕ) :
    ∑ n ∈ range N, |compose r E n| ≤ ∑ j ∈ range N, |r j| := by
  calc ∑ n ∈ range N, |compose r E n|
      ≤ ∑ n ∈ range N, ∑ j ∈ range (n + 1), |r j| * |(E ^ (2 * j + 1)).coeff (n - j)| :=
        sum_le_sum fun n _ => abs_compose_le r E n
    _ = ∑ j ∈ range N, ∑ n ∈ Ico j N, |r j| * |(E ^ (2 * j + 1)).coeff (n - j)| := by
        apply Finset.sum_comm'
        intro n j
        simp only [mem_range, mem_Ico]
        omega
    _ = ∑ j ∈ range N, |r j| * ∑ k ∈ range (N - j), |(E ^ (2 * j + 1)).coeff k| := by
        refine sum_congr rfl fun j _ => ?_
        rw [Finset.sum_Ico_eq_sum_range, Finset.mul_sum]
        refine sum_congr rfl fun k _ => ?_
        rw [Nat.add_sub_cancel_left]
    _ ≤ ∑ j ∈ range N, |r j| * 1 := by
        apply sum_le_sum
        intro j _
        apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
        exact (sum_abs_coeff_le_l1 _ _).trans
          ((l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hE))
    _ = ∑ j ∈ range N, |r j| := by simp

theorem summable_abs_compose (r : ℕ → ℝ) (hr : Summable fun n => |r n|) (E : ℝ[X])
    (hE : l1 E ≤ 1) : Summable fun n => |compose r E n| :=
  summable_of_sum_range_le (fun _ => abs_nonneg _) fun N =>
    (sum_abs_compose_le r E hE N).trans (hr.sum_le_tsum _ fun _ _ => abs_nonneg _)

/-- **Composition contracts the coefficient norm**: `∑|(r∘E)ₙ| ≤ ∑|rₙ|`. -/
theorem tsum_abs_compose_le (r : ℕ → ℝ) (hr : Summable fun n => |r n|) (E : ℝ[X])
    (hE : l1 E ≤ 1) : ∑' n, |compose r E n| ≤ ∑' n, |r n| := by
  apply Real.tsum_le_of_sum_le (fun n => abs_nonneg _)
  intro s
  calc ∑ n ∈ s, |compose r E n|
      ≤ ∑ n ∈ range (s.sup id + 1), |compose r E n| := by
        apply sum_le_sum_of_subset_of_nonneg
        · intro n hn; exact mem_range.2 (Nat.lt_succ_of_le (le_sup (f := id) hn))
        · intro n _ _; exact abs_nonneg _
    _ ≤ ∑ j ∈ range (s.sup id + 1), |r j| := sum_abs_compose_le r E hE _
    _ ≤ ∑' j, |r j| := hr.sum_le_tsum _ fun _ _ => abs_nonneg _

/-! ### The kernel identity on the closed unit disc -/

/-- `physPoly` of the coefficients of `E` is `z ↦ z · E(‖z‖²)`. -/
lemma physPoly_coeff_eq (E : ℝ[X]) {N : ℕ} (hN : E.natDegree < N) (z : ℂ) :
    physPoly (fun j => E.coeff j) N z = z * ((E.eval (‖z‖ ^ 2) : ℝ) : ℂ) := by
  unfold physPoly
  rw [eval_eq_sum_range' hN]
  push_cast
  rw [Finset.mul_sum]
  refine sum_congr rfl fun j _ => ?_
  rw [pow_mul]
  ring

/-- The composed series term: `f j m = [j ≤ m] c_j · [x^{m-j}]E^{2j+1} · z · x^m`. -/
def compTerm (c : ℕ → ℝ) (E : ℝ[X]) (z : ℂ) (j m : ℕ) : ℂ :=
  if j ≤ m then (c j : ℂ) * ((E ^ (2 * j + 1)).coeff (m - j) : ℂ)
    * (z * ((‖z‖ ^ 2 : ℝ) : ℂ) ^ m) else 0

lemma compTerm_eq_zero_of_lt {c E z j m} (h : m < j) : compTerm c E z j m = 0 := by
  unfold compTerm; rw [ite_eq_right (by omega)]

lemma compTerm_eq_zero_of_degree {c : ℕ → ℝ} {E : ℝ[X]} {z : ℂ} {j m : ℕ}
    (h : j + (E ^ (2 * j + 1)).natDegree < m) : compTerm c E z j m = 0 := by
  unfold compTerm
  split_ifs with hj
  · rw [coeff_eq_zero_of_natDegree_lt (by omega)]; simp
  · rfl

lemma norm_compTerm_le (c : ℕ → ℝ) (E : ℝ[X]) {z : ℂ} (hz : ‖z‖ ≤ 1) (j m : ℕ) :
    ‖compTerm c E z j m‖ ≤
      if j ≤ m then |c j| * |(E ^ (2 * j + 1)).coeff (m - j)| else 0 := by
  unfold compTerm
  split_ifs with hj
  · rw [norm_mul, norm_mul, norm_mul, norm_pow, Complex.norm_real, Complex.norm_real,
      Complex.norm_real, Real.norm_eq_abs, Real.norm_eq_abs, Real.norm_eq_abs, abs_pow,
      abs_norm]
    have h1 : ‖z‖ * (‖z‖ ^ 2) ^ m ≤ 1 := by
      calc ‖z‖ * (‖z‖ ^ 2) ^ m ≤ 1 * (1 ^ 2) ^ m := by gcongr
        _ = 1 := by simp
    calc |c j| * |(E ^ (2 * j + 1)).coeff (m - j)| * (‖z‖ * (‖z‖ ^ 2) ^ m)
        ≤ |c j| * |(E ^ (2 * j + 1)).coeff (m - j)| * 1 :=
          mul_le_mul_of_nonneg_left h1 (by positivity)
      _ = _ := mul_one _
  · simp

/-- For fixed `j`, summing the composed terms over `m` recovers `c_j z x^j E(x)^{2j+1}`. -/
lemma tsum_compTerm_eq (c : ℕ → ℝ) (E : ℝ[X]) (z : ℂ) (j : ℕ) :
    ∑' m, compTerm c E z j m
      = (c j : ℂ) * (z * ((‖z‖ ^ 2 : ℝ) : ℂ) ^ j * (((E.eval (‖z‖ ^ 2)) : ℝ) : ℂ) ^ (2 * j + 1)) := by
  set D := (E ^ (2 * j + 1)).natDegree with hD
  have hsupp : ∀ m ∉ (range (D + 1)).map (addLeftEmbedding j), compTerm c E z j m = 0 := by
    intro m hm
    simp only [mem_map, mem_range, addLeftEmbedding_apply, not_exists, not_and] at hm
    by_cases hj : m < j
    · exact compTerm_eq_zero_of_lt hj
    · apply compTerm_eq_zero_of_degree
      by_contra hcon
      push Not at hcon
      exact hm (m - j) (by omega) (by omega)
  rw [tsum_eq_sum hsupp, Finset.sum_map]
  simp only [addLeftEmbedding_apply]
  have : ∀ k, compTerm c E z j (j + k)
      = (c j : ℂ) * (z * ((‖z‖ ^ 2 : ℝ) : ℂ) ^ j) * (((E ^ (2 * j + 1)).coeff k : ℝ) : ℂ)
          * ((‖z‖ ^ 2 : ℝ) : ℂ) ^ k := by
    intro k
    unfold compTerm
    rw [ite_eq_left (by omega), Nat.add_sub_cancel_left, pow_add]
    ring
  simp_rw [this]
  have hev : ((E.eval (‖z‖ ^ 2) : ℝ) : ℂ) ^ (2 * j + 1)
      = ∑ k ∈ range (D + 1), (((E ^ (2 * j + 1)).coeff k : ℝ) : ℂ) * ((‖z‖ ^ 2 : ℝ) : ℂ) ^ k := by
    rw [← Complex.ofReal_pow, ← eval_pow,
      eval_eq_sum_range' (p := E ^ (2 * j + 1)) (n := D + 1) (by omega)]
    push_cast
    exact sum_congr rfl fun k _ => by ring
  rw [hev, Finset.mul_sum, Finset.mul_sum]
  exact sum_congr rfl fun k _ => by ring

/-- Absolute summability of the double series. -/
lemma summable_compTerm_uncurry (c : ℕ → ℝ) (hc : Summable fun n => |c n|) (E : ℝ[X])
    (hE : l1 E ≤ 1) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    Summable (Function.uncurry (compTerm c E z)) := by
  set g : ℕ × ℕ → ℝ := fun p =>
    if p.1 ≤ p.2 then |c p.1| * |(E ^ (2 * p.1 + 1)).coeff (p.2 - p.1)| else 0 with hg
  have hg0 : 0 ≤ g := fun p => by
    simp only [hg]; split_ifs <;> positivity
  have hgsum : Summable g := by
    rw [summable_prod_of_nonneg hg0]
    constructor
    · intro j
      apply summable_of_ne_finset_zero (s := (range ((E ^ (2 * j + 1)).natDegree + 1)).map
        (addLeftEmbedding j))
      intro m hm
      simp only [mem_map, mem_range, addLeftEmbedding_apply, not_exists, not_and] at hm
      simp only [hg]
      split_ifs with hj
      · rw [coeff_eq_zero_of_natDegree_lt]
        · simp
        · by_contra hcon
          push Not at hcon
          exact hm (m - j) (by omega) (by omega)
      · rfl
    · refine Summable.of_nonneg_of_le (fun j => tsum_nonneg fun m => hg0 (j, m)) (fun j => ?_) hc
      -- ∑' m, g (j, m) = |c j| * ∑_{k ≤ D} |coeff k| ≤ |c j|
      set D := (E ^ (2 * j + 1)).natDegree
      have hsupp : ∀ m ∉ (range (D + 1)).map (addLeftEmbedding j), g (j, m) = 0 := by
        intro m hm
        simp only [mem_map, mem_range, addLeftEmbedding_apply, not_exists, not_and] at hm
        simp only [hg]
        split_ifs with hj
        · rw [coeff_eq_zero_of_natDegree_lt]
          · simp
          · by_contra hcon
            push Not at hcon
            exact hm (m - j) (by omega) (by omega)
        · rfl
      rw [tsum_eq_sum hsupp, Finset.sum_map]
      simp only [addLeftEmbedding_apply, hg]
      have : ∀ k ∈ range (D + 1),
          (if j ≤ j + k then |c j| * |(E ^ (2 * j + 1)).coeff (j + k - j)| else 0)
            = |c j| * |(E ^ (2 * j + 1)).coeff k| := by
        intro k _
        rw [ite_eq_left (by omega), Nat.add_sub_cancel_left]
      rw [sum_congr rfl this, ← Finset.mul_sum]
      calc |c j| * ∑ k ∈ range (D + 1), |(E ^ (2 * j + 1)).coeff k|
          ≤ |c j| * 1 := by
            apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
            exact (sum_abs_coeff_le_l1 _ _).trans
              ((l1_pow_le _ _).trans (pow_le_one₀ (l1_nonneg _) hE))
        _ = |c j| := mul_one _
  refine Summable.of_norm_bounded hgsum fun p => ?_
  exact norm_compTerm_le c E hz p.1 p.2

/-- **The kernel identity on the closed unit disc.** -/
theorem radialKernel_comp (c : ℕ → ℝ) (hc : Summable fun n => |c n|) (E : ℝ[X])
    (hE : l1 E ≤ 1) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    radialKernel c (z * ((E.eval (‖z‖ ^ 2) : ℝ) : ℂ)) = radialKernel (compose c E) z := by
  have hx1 : |‖z‖ ^ 2| ≤ 1 := by
    rw [abs_of_nonneg (by positivity)]
    calc ‖z‖ ^ 2 ≤ 1 ^ 2 := by gcongr
      _ = 1 := by norm_num
  have hv : |E.eval (‖z‖ ^ 2)| ≤ 1 := (abs_eval_le_l1 E hx1).trans hE
  set v : ℝ := E.eval (‖z‖ ^ 2) with hvdef
  -- LHS termwise
  have hL : ∀ n, (c n : ℂ) * ((z * (v : ℂ)) * ((‖z * (v : ℂ)‖ : ℝ) : ℂ) ^ (2 * n))
      = ∑' m, compTerm c E z n m := by
    intro n
    rw [tsum_compTerm_eq]
    have hn : ((‖z * (v : ℂ)‖ : ℝ) : ℂ) ^ (2 * n)
        = ((‖z‖ ^ 2 : ℝ) : ℂ) ^ n * ((v : ℝ) : ℂ) ^ (2 * n) := by
      have hr : (‖z * (v : ℂ)‖ : ℝ) ^ (2 * n) = (‖z‖ ^ 2) ^ n * v ^ (2 * n) := by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, mul_pow, pow_mul ‖z‖ 2 n,
          pow_mul |v| 2 n, sq_abs, ← pow_mul v 2 n]
      rw [← Complex.ofReal_pow, hr]
      push_cast
      ring
    rw [hn]
    ring
  -- RHS termwise
  have hR : ∀ m, ((compose c E m : ℝ) : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * m))
      = ∑' j, compTerm c E z j m := by
    intro m
    have hsupp : ∀ j ∉ range (m + 1), compTerm c E z j m = 0 := fun j hj =>
      compTerm_eq_zero_of_lt (by simpa using hj)
    rw [tsum_eq_sum hsupp]
    unfold compose
    push_cast
    rw [Finset.sum_mul]
    refine sum_congr rfl fun j hj => ?_
    unfold compTerm
    rw [ite_eq_left (by simpa using Nat.lt_succ_iff.mp (mem_range.1 hj))]
    push_cast
    rw [pow_mul, ← Complex.ofReal_pow]
    try ring
  unfold radialKernel
  simp_rw [hL, hR]
  have hsum := summable_compTerm_uncurry c hc E hE hz
  have h1 : ∀ j, Summable fun m => compTerm c E z j m := fun j => hsum.prod_factor j
  have h2 : ∀ m, Summable fun j => compTerm c E z j m := fun m =>
    summable_of_ne_finset_zero (s := range (m + 1)) fun j hj =>
      compTerm_eq_zero_of_lt (by simpa using hj)
  exact (hsum.tsum_comm' h1 h2).symm

end

end Grothe
