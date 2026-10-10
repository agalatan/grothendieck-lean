import Grothe.Lower.Basic

/-!
# Tensor Bernstein bounds for polynomials in two variables

A polynomial `∑_{k ≤ nx} ∑_{j ≤ ny} a_{kj} x^k y^j` on a box `[xl, xh] × [yl, yh]` is a convex
combination of its tensor Bernstein coefficients: on `[l, h]` the univariate polynomial
`∑_{k ≤ n} c_k x^k` equals `∑_{m ≤ n} β_m(c) B_{n,m}(s)` with `x = l + (h − l) s`
(`bern1_identity`), the coefficients `β_m(c)` (`bern1`) are linear in `c`, and applying this in
`x` and then in `y` writes the polynomial in the product basis `B_{nx,m}(s) B_{ny,m'}(t)`, which
is nonnegative and sums to one.  Hence the polynomial is at least its smallest tensor Bernstein
coefficient (`bern2_lower`).

A certificate is a dense rational coefficient matrix (row `k` lists the coefficients of `x^k`
as a polynomial in `y`) and a binary subdivision tree (`Cover`) of the box; the computable
checker `coverOK` verifies that every leaf box has only positive tensor Bernstein coefficients,
and `coverOK_sound` turns a successful check into nonnegativity on the whole box.  Univariate
polynomials are the case `ny = 0` with splits in `x` only.
-/

namespace Grothe.LowerAnalytic

open Finset Grothe.Lower

/-- Power-basis coefficient of `s^k` in `∑_{j ≤ n} c_j (l + (h − l) s)^j`. -/
def bernA1 {R : Type*} [Field R] (c : ℕ → R) (n : ℕ) (l h : R) (k : ℕ) : R :=
  (h - l) ^ k * ∑ j ∈ range (n + 1), if k ≤ j then c j * (j.choose k : R) * l ^ (j - k) else 0

/-- The `m`-th Bernstein coefficient of `∑_{j ≤ n} c_j x^j` on `[l, h]`. -/
def bern1 {R : Type*} [Field R] (c : ℕ → R) (n : ℕ) (l h : R) (m : ℕ) : R :=
  ∑ k ∈ range (m + 1), bernA1 c n l h k * ((m.choose k : R) / (n.choose k : R))

/-- The Bernstein basis polynomial `C(n, m) s^m (1 − s)^(n − m)`. -/
noncomputable def bbasis (n m : ℕ) (s : ℝ) : ℝ := (n.choose m : ℝ) * s ^ m * (1 - s) ^ (n - m)

lemma bern1_cast (c : ℕ → ℚ) (n : ℕ) (l h : ℚ) (m : ℕ) :
    ((bern1 c n l h m : ℚ) : ℝ) = bern1 (fun k => (c k : ℝ)) n l h m := by
  simp only [bern1, bernA1]
  push_cast
  refine Finset.sum_congr rfl fun k _ => ?_
  congr 2
  refine Finset.sum_congr rfl fun j _ => ?_
  split_ifs <;> push_cast <;> rfl

lemma filter_le_range' {n j : ℕ} (hj : j ≤ n) :
    (range (n + 1)).filter (fun k => k ≤ j) = range (j + 1) := by
  ext k; simp only [Finset.mem_filter, Finset.mem_range]; omega

lemma filter_ge_range' {n k : ℕ} :
    (range (n + 1)).filter (fun m => k ≤ m) = Finset.Ico k (n + 1) := by
  ext m; simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_Ico]; omega

lemma bbasis_nonneg (n m : ℕ) {s : ℝ} (hs0 : 0 ≤ s) (hs1 : s ≤ 1) : 0 ≤ bbasis n m s := by
  have : 0 ≤ 1 - s := by linarith
  unfold bbasis; positivity

lemma bbasis_sum (n : ℕ) (s : ℝ) : ∑ m ∈ range (n + 1), bbasis n m s = 1 := by
  calc ∑ m ∈ range (n + 1), bbasis n m s
      = ∑ m ∈ range (n + 1), s ^ m * (1 - s) ^ (n - m) * (n.choose m : ℝ) :=
        Finset.sum_congr rfl fun m _ => by simp only [bbasis]; ring
    _ = (s + (1 - s)) ^ n := (add_pow s (1 - s) n).symm
    _ = 1 := by simp

/-- Monomials in the Bernstein basis. -/
lemma pow_eq_bbasis (n k : ℕ) (hk : k ≤ n) (s : ℝ) : s ^ k = ∑ m ∈ range (n + 1),
    (if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0) * bbasis n m s := by
  have hck : (0 : ℝ) < n.choose k := by exact_mod_cast Nat.choose_pos hk
  have e1 : ∀ m ∈ range (n + 1),
      (if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0) * bbasis n m s
        = if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) * bbasis n m s else 0 := by
    intro m _; split_ifs <;> simp
  rw [Finset.sum_congr rfl e1, ← Finset.sum_filter, filter_ge_range', Finset.sum_Ico_eq_sum_range,
    show n + 1 - k = n - k + 1 by omega]
  have key : ∀ i ∈ range (n - k + 1),
      ((k + i).choose k : ℝ) / (n.choose k : ℝ) * bbasis n (k + i) s
        = s ^ k * (((n - k).choose i : ℝ) * s ^ i * (1 - s) ^ (n - k - i)) := by
    intro i hi
    have hi' : i ≤ n - k := by simpa [Nat.lt_succ_iff] using hi
    have hc := Nat.choose_mul (n := n) (k := k + i) (s := k) (by omega)
    rw [show k + i - k = i by omega] at hc
    have hcast : (n.choose (k + i) : ℝ) * ((k + i).choose k : ℝ)
        = (n.choose k : ℝ) * ((n - k).choose i : ℝ) := by exact_mod_cast hc
    simp only [bbasis]
    rw [show n - (k + i) = n - k - i by omega, pow_add]
    field_simp
    linear_combination (s ^ k * s ^ i * (1 - s) ^ (n - k - i)) * hcast
  rw [Finset.sum_congr rfl key, ← Finset.mul_sum]
  have h1 : ∑ i ∈ range (n - k + 1), ((n - k).choose i : ℝ) * s ^ i * (1 - s) ^ (n - k - i) = 1 :=
    bbasis_sum (n - k) s
  rw [h1, mul_one]

/-- **Bernstein identity**: `∑_{k ≤ n} c_k (l + (h − l) s)^k = ∑_{m ≤ n} β_m(c) B_{n,m}(s)`. -/
theorem bern1_identity (c : ℕ → ℝ) (n : ℕ) (l h s : ℝ) :
    ∑ k ∈ range (n + 1), c k * (l + (h - l) * s) ^ k
      = ∑ m ∈ range (n + 1), bern1 c n l h m * bbasis n m s := by
  have hval : ∑ k ∈ range (n + 1), c k * (l + (h - l) * s) ^ k
      = ∑ k ∈ range (n + 1), bernA1 c n l h k * s ^ k := by
    have e2 : ∀ j ∈ range (n + 1), c j * (l + (h - l) * s) ^ j
        = ∑ k ∈ range (n + 1),
            if k ≤ j then c j * (j.choose k : ℝ) * l ^ (j - k) * ((h - l) ^ k * s ^ k) else 0 := by
      intro j hj
      have hj' : j ≤ n := by simpa [Nat.lt_succ_iff] using hj
      rw [add_comm l, add_pow, Finset.mul_sum, ← Finset.sum_filter, filter_le_range' hj']
      exact Finset.sum_congr rfl fun k _ => by rw [mul_pow]; ring
    rw [Finset.sum_congr rfl e2, Finset.sum_comm]
    refine Finset.sum_congr rfl fun k _ => ?_
    simp only [bernA1]
    rw [Finset.mul_sum, Finset.sum_mul]
    refine Finset.sum_congr rfl fun j _ => ?_
    split_ifs <;> ring
  rw [hval]
  have e3 : ∀ k ∈ range (n + 1), bernA1 c n l h k * s ^ k = ∑ m ∈ range (n + 1),
      bernA1 c n l h k * ((if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0)
        * bbasis n m s) := by
    intro k hk
    rw [pow_eq_bbasis n k (by simpa [Nat.lt_succ_iff] using hk), Finset.mul_sum]
  rw [Finset.sum_congr rfl e3, Finset.sum_comm]
  refine Finset.sum_congr rfl fun m hm => ?_
  have hm' : m ≤ n := by simpa [Nat.lt_succ_iff] using hm
  simp only [bern1]
  rw [Finset.sum_mul]
  have e4 : ∀ k ∈ range (n + 1),
      bernA1 c n l h k * ((if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0)
        * bbasis n m s)
        = if k ≤ m then bernA1 c n l h k * ((m.choose k : ℝ) / (n.choose k : ℝ)) * bbasis n m s
          else 0 := by
    intro k _; split_ifs <;> ring
  rw [Finset.sum_congr rfl e4, ← Finset.sum_filter, filter_le_range' hm']

/-- The affine parameter of a point of `[l, h]`. -/
lemma exists_param {l h x : ℝ} (hl : l ≤ x) (hh : x ≤ h) (hlh : l < h) :
    ∃ s : ℝ, 0 ≤ s ∧ s ≤ 1 ∧ x = l + (h - l) * s := by
  have hw : 0 < h - l := by linarith
  refine ⟨(x - l) / (h - l), div_nonneg (by linarith) hw.le, by rw [div_le_one hw]; linarith, ?_⟩
  field_simp
  ring

/-- **Tensor Bernstein bound.**  If every tensor Bernstein coefficient of
`∑_{k ≤ nx} ∑_{j ≤ ny} a_{kj} x^k y^j` on `[xl, xh] × [yl, yh]` is at least `b`, so is the
polynomial on the box. -/
theorem bern2_lower (a : ℕ → ℕ → ℝ) (nx ny : ℕ) (xl xh yl yh x y b : ℝ)
    (hxl : xl ≤ x) (hxh : x ≤ xh) (hx : xl < xh) (hyl : yl ≤ y) (hyh : y ≤ yh) (hy : yl < yh)
    (hb : ∀ m ∈ range (nx + 1), ∀ m' ∈ range (ny + 1),
      b ≤ bern1 (fun j => bern1 (fun k => a k j) nx xl xh m) ny yl yh m') :
    b ≤ ∑ k ∈ range (nx + 1), ∑ j ∈ range (ny + 1), a k j * x ^ k * y ^ j := by
  obtain ⟨s, hs0, hs1, rfl⟩ := exists_param hxl hxh hx
  obtain ⟨t, ht0, ht1, rfl⟩ := exists_param hyl hyh hy
  have e1 : ∑ k ∈ range (nx + 1), ∑ j ∈ range (ny + 1),
      a k j * (xl + (xh - xl) * s) ^ k * (yl + (yh - yl) * t) ^ j
      = ∑ j ∈ range (ny + 1), (∑ k ∈ range (nx + 1), a k j * (xl + (xh - xl) * s) ^ k)
          * (yl + (yh - yl) * t) ^ j := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun j _ => by rw [Finset.sum_mul]
  have e2 : ∑ j ∈ range (ny + 1), (∑ k ∈ range (nx + 1), a k j * (xl + (xh - xl) * s) ^ k)
          * (yl + (yh - yl) * t) ^ j
      = ∑ m ∈ range (nx + 1), bbasis nx m s *
          ∑ j ∈ range (ny + 1), bern1 (fun k => a k j) nx xl xh m * (yl + (yh - yl) * t) ^ j := by
    have hj : ∀ j, ∑ k ∈ range (nx + 1), a k j * (xl + (xh - xl) * s) ^ k
        = ∑ m ∈ range (nx + 1), bern1 (fun k => a k j) nx xl xh m * bbasis nx m s :=
      fun j => bern1_identity (fun k => a k j) nx xl xh s
    simp_rw [hj, Finset.sum_mul, Finset.mul_sum]
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl fun m _ => Finset.sum_congr rfl fun j _ => by ring
  rw [e1, e2]
  have hm : ∀ m, ∑ j ∈ range (ny + 1), bern1 (fun k => a k j) nx xl xh m * (yl + (yh - yl) * t) ^ j
      = ∑ m' ∈ range (ny + 1), bern1 (fun j => bern1 (fun k => a k j) nx xl xh m) ny yl yh m'
          * bbasis ny m' t :=
    fun m => bern1_identity (fun j => bern1 (fun k => a k j) nx xl xh m) ny yl yh t
  simp_rw [hm]
  calc b = ∑ m ∈ range (nx + 1), bbasis nx m s * ∑ m' ∈ range (ny + 1), b * bbasis ny m' t := by
        simp_rw [← Finset.mul_sum, bbasis_sum, mul_one, ← Finset.sum_mul, bbasis_sum, one_mul]
    _ ≤ _ := by
      refine Finset.sum_le_sum fun m hm => mul_le_mul_of_nonneg_left
        (Finset.sum_le_sum fun m' hm' => mul_le_mul_of_nonneg_right (hb m hm m' hm')
          (bbasis_nonneg _ _ ht0 ht1)) (bbasis_nonneg _ _ hs0 hs1)

/-! ### Rational certificates -/

/-- Coefficient of `x^k y^j` in a dense matrix (row `k` = coefficients of `x^k` in `y`). -/
def mc (M : List (List ℚ)) (k j : ℕ) : ℚ := coeffL (M.getD k []) j

/-- Evaluation of a dense coefficient matrix. -/
noncomputable def eval2 (M : List (List ℚ)) (x y : ℝ) : ℝ :=
  evalL (M.map fun r => evalL (r.map ((↑) : ℚ → ℝ)) y) x

/-- Tensor Bernstein coefficient `(m, m')` of `M` on a box. -/
def bern2 (M : List (List ℚ)) (nx ny : ℕ) (xl xh yl yh : ℚ) (m m' : ℕ) : ℚ :=
  bern1 (fun j => bern1 (fun k => mc M k j) nx xl xh m) ny yl yh m'

/-- A binary subdivision tree of a box. -/
inductive Cover
  | leaf
  | splitX (l r : Cover)
  | splitY (l r : Cover)

/-- Every leaf box of the subdivision has positive tensor Bernstein coefficients. -/
def coverOK (M : List (List ℚ)) (nx ny : ℕ) : Cover → ℚ → ℚ → ℚ → ℚ → Bool
  | .leaf, xl, xh, yl, yh => decide (xl < xh) && decide (yl < yh) &&
      (List.range (nx + 1)).all fun m => (List.range (ny + 1)).all fun m' =>
        decide (0 < bern2 M nx ny xl xh yl yh m m')
  | .splitX l r, xl, xh, yl, yh =>
      coverOK M nx ny l xl ((xl + xh) / 2) yl yh && coverOK M nx ny r ((xl + xh) / 2) xh yl yh
  | .splitY l r, xl, xh, yl, yh =>
      coverOK M nx ny l xl xh yl ((yl + yh) / 2) && coverOK M nx ny r xl xh ((yl + yh) / 2) yh

/-- The matrix fits in degree `(nx, ny)`. -/
def fitsDeg (M : List (List ℚ)) (nx ny : ℕ) : Bool :=
  decide (M.length ≤ nx + 1) && M.all fun r => decide (r.length ≤ ny + 1)

lemma evalL_cast_eq_sum (r : List ℚ) (ny : ℕ) (hr : r.length ≤ ny + 1) (y : ℝ) :
    evalL (r.map ((↑) : ℚ → ℝ)) y = ∑ j ∈ range (ny + 1), ((coeffL r j : ℚ) : ℝ) * y ^ j := by
  rw [evalL_map_cast]
  refine Finset.sum_subset (Finset.range_subset_range.2 hr) fun j _ hj => ?_
  simp only [Finset.mem_range, not_lt] at hj
  simp [coeffL, List.getElem?_eq_none hj]

lemma eval2_eq_sum (M : List (List ℚ)) (nx ny : ℕ) (hM : fitsDeg M nx ny = true) (x y : ℝ) :
    eval2 M x y = ∑ k ∈ range (nx + 1), ∑ j ∈ range (ny + 1),
      ((mc M k j : ℚ) : ℝ) * x ^ k * y ^ j := by
  simp only [fitsDeg, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at hM
  obtain ⟨hlen, hrows⟩ := hM
  rw [eval2, evalL_eq_sum, List.length_map]
  refine (Finset.sum_subset (Finset.range_subset_range.2 hlen) fun k _ hk => ?_).trans
    (Finset.sum_congr rfl fun k hk => ?_)
  · simp only [Finset.mem_range, not_lt] at hk
    simp [coeffL, List.getElem?_eq_none hk]
  · by_cases hk' : k < M.length
    · have hc : coeffL (M.map fun r => evalL (r.map ((↑) : ℚ → ℝ)) y) k
          = evalL ((M.getD k []).map ((↑) : ℚ → ℝ)) y := by
        simp [coeffL, List.getElem?_eq_getElem hk']
      rw [hc, evalL_cast_eq_sum _ ny (hrows _ (by simp [List.getElem?_eq_getElem hk'])),
        Finset.sum_mul]
      exact Finset.sum_congr rfl fun j _ => by simp only [mc]; ring
    · push Not at hk'
      simp [coeffL, mc, List.getElem?_eq_none hk']

/-- Soundness of the subdivision check: the polynomial is nonnegative on the whole box. -/
theorem coverOK_sound (M : List (List ℚ)) (nx ny : ℕ) (hM : fitsDeg M nx ny = true) :
    ∀ (T : Cover) (xl xh yl yh : ℚ), coverOK M nx ny T xl xh yl yh = true →
      ∀ x y : ℝ, (xl : ℝ) ≤ x → x ≤ xh → (yl : ℝ) ≤ y → y ≤ yh → 0 ≤ eval2 M x y
  | .leaf, xl, xh, yl, yh, hT, x, y, h1, h2, h3, h4 => by
    simp only [coverOK, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true,
      List.mem_range] at hT
    obtain ⟨⟨hx, hy⟩, hb⟩ := hT
    rw [eval2_eq_sum M nx ny hM]
    refine bern2_lower _ nx ny xl xh yl yh x y 0 h1 h2 (by exact_mod_cast hx) h3 h4
      (by exact_mod_cast hy) fun m hm m' hm' => ?_
    have := hb m (Finset.mem_range.1 hm) m' (Finset.mem_range.1 hm')
    have hc : ((bern2 M nx ny xl xh yl yh m m' : ℚ) : ℝ)
        = bern1 (fun j => bern1 (fun k => ((mc M k j : ℚ) : ℝ)) nx xl xh m) ny yl yh m' := by
      simp only [bern2]
      rw [bern1_cast]
      simp only [bern1_cast]
    rw [← hc]
    exact_mod_cast this.le
  | .splitX l r, xl, xh, yl, yh, hT, x, y, h1, h2, h3, h4 => by
    simp only [coverOK, Bool.and_eq_true] at hT
    rcases le_total x (((xl + xh) / 2 : ℚ) : ℝ) with hx | hx
    · exact coverOK_sound M nx ny hM l _ _ _ _ hT.1 x y h1 hx h3 h4
    · exact coverOK_sound M nx ny hM r _ _ _ _ hT.2 x y hx h2 h3 h4
  | .splitY l r, xl, xh, yl, yh, hT, x, y, h1, h2, h3, h4 => by
    simp only [coverOK, Bool.and_eq_true] at hT
    rcases le_total y (((yl + yh) / 2 : ℚ) : ℝ) with hy | hy
    · exact coverOK_sound M nx ny hM l _ _ _ _ hT.1 x y h1 h2 h3 hy
    · exact coverOK_sound M nx ny hM r _ _ _ _ hT.2 x y h1 h2 hy h4

end Grothe.LowerAnalytic
