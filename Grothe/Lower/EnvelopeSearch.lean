-- Grothe/Lower/EnvelopeSearch.lean
import Grothe.Lower.AdaptiveSearch
import Grothe.Lower.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic

/-!
# Adaptive construction of quadratic row envelopes

The local test chooses one row whose two endpoint values are below the target.
The search constructs its partition, rather than consuming a stored cover.
Its completeness theorem uses a strict pointwise envelope margin and a uniform
Lipschitz bound to prove that a sufficiently deep search must succeed. The final
constructor searches for its own depth, justified by that theorem.

Agent-ID: codex-6a2f. Refs #462.
-/

namespace Grothe.Lower.EnvelopeSearch

/-- The linear parameter and constant of `t² - 2ℓt + C`. -/
abbrev Quad := ℚ × ℚ

structure Interval where
  lo : ℚ
  hi : ℚ
  deriving Repr, DecidableEq

def Interval.mid (d : Interval) : ℚ := (d.lo + d.hi) / 2
def Interval.left (d : Interval) : Interval := ⟨d.lo, d.mid⟩
def Interval.right (d : Interval) : Interval := ⟨d.mid, d.hi⟩
def Interval.mem (d : Interval) (x : ℝ) : Prop := (d.lo : ℝ) ≤ x ∧ x ≤ d.hi

def eval (r : Quad) (t : ℚ) : ℚ := t ^ 2 - 2 * r.1 * t + r.2
noncomputable def value (r : Quad) (t : ℝ) : ℝ := t ^ 2 - 2 * (r.1 : ℝ) * t + r.2

@[simp] theorem eval_cast (r : Quad) (t : ℚ) : (eval r t : ℝ) = value r t := by
  simp [eval, value]

/-- A single row certifies a cell by convexity of its quadratic. -/
def test (rows : List Quad) (B : ℚ) (d : Interval) : Bool :=
  rows.any fun r => decide (eval r d.lo ≤ B ∧ eval r d.hi ≤ B)

abbrev search (rows : List Quad) (B : ℚ) :=
  AdaptiveSearch.search (test rows B) Interval.left Interval.right

theorem split_cover (d : Interval) (x : ℝ) (h : d.mem x) :
    d.left.mem x ∨ d.right.mem x := by
  rcases le_total x (d.mid : ℝ) with hx | hx
  · exact Or.inl ⟨h.1, hx⟩
  · exact Or.inr ⟨hx, h.2⟩

theorem test_sound (rows : List Quad) (B : ℚ) (d : Interval)
    (h : test rows B d = true) (x : ℝ) (hx : d.mem x) :
    ∃ r ∈ rows, value r x ≤ (B : ℝ) := by
  obtain ⟨r, hr, hends⟩ := List.any_eq_true.mp h
  have he : eval r d.lo ≤ B ∧ eval r d.hi ≤ B := of_decide_eq_true hends
  have hm : quadMax r.2 (-2 * r.1) 1 d.lo d.hi ≤ B := by
    norm_num only [quadMax, show ¬ (1 : ℚ) < 0 by norm_num, ite_false]
    apply max_le
    · convert he.1 using 1; simp only [quadVal, eval]; ring
    · convert he.2 using 1; simp only [quadVal, eval]; ring
  have hb := (quadVal_le_quadMax r.2 (-2 * r.1) 1 d.lo d.hi x hx.1 hx.2).trans
    (show (quadMax r.2 (-2 * r.1) 1 d.lo d.hi : ℝ) ≤ B by exact_mod_cast hm)
  refine ⟨r, hr, ?_⟩
  convert hb using 1; simp only [value]; push_cast; ring

/-- Soundness for every successful adaptive run, with no separate cover check. -/
theorem search_envelope {rows : List Quad} {B : ℚ} {depth : ℕ}
    {d : Interval} {tree : AdaptiveSearch.Tree}
    (h : search rows B depth d = some tree) (_hd : d.lo ≤ d.hi)
    {x : ℝ} (hx : (d.lo : ℝ) ≤ x) (hx' : x ≤ d.hi) :
    ∃ r ∈ rows, value r x ≤ (B : ℝ) :=
  AdaptiveSearch.valid_sound (test rows B) Interval.left Interval.right Interval.mem
    (fun x => ∃ r ∈ rows, value r x ≤ (B : ℝ)) (test_sound rows B) split_cover
    tree d (AdaptiveSearch.search_sound _ _ _ h) x ⟨hx, hx'⟩

/-- Consumer for any scalar objective bounded by every row in the bank. -/
theorem search_bound {rows : List Quad} {B : ℚ} {depth : ℕ}
    {d : Interval} {tree : AdaptiveSearch.Tree}
    (h : search rows B depth d = some tree) (hd : d.lo ≤ d.hi)
    {x V : ℝ} (hx : (d.lo : ℝ) ≤ x) (hx' : x ≤ d.hi)
    (hrows : ∀ r ∈ rows, V ≤ value r x) : V ≤ (B : ℝ) := by
  obtain ⟨r, hr, hb⟩ := search_envelope h hd hx hx'
  exact (hrows r hr).trans hb

/-- A computable bound on the absolute linear parameters of every row. -/
def ellBound : List Quad → ℚ
  | [] => 0
  | r :: rs => |r.1| + ellBound rs

theorem ellBound_nonneg (rows : List Quad) : 0 ≤ ellBound rows := by
  induction rows with
  | nil => exact le_refl 0
  | cons r rs ih => exact add_nonneg (abs_nonneg _) ih

theorem abs_ell_le {rows : List Quad} {r : Quad} (h : r ∈ rows) : |r.1| ≤ ellBound rows := by
  induction rows with
  | nil => simp at h
  | cons s rs ih =>
    rcases List.mem_cons.mp h with rfl | hr
    · exact le_add_of_nonneg_right (ellBound_nonneg rs)
    · exact (ih hr).trans (le_add_of_nonneg_left (abs_nonneg _))

/-- Explicit common Lipschitz constant on the root interval. -/
def lipschitz (rows : List Quad) (root : Interval) : ℚ :=
  2 * (max |root.lo| |root.hi| + ellBound rows)

theorem lipschitz_nonneg (rows : List Quad) (root : Interval) : 0 ≤ lipschitz rows root := by
  exact mul_nonneg (by norm_num) (add_nonneg
    ((abs_nonneg root.lo).trans (le_max_left _ _)) (ellBound_nonneg rows))

theorem value_lipschitz (rows : List Quad) (root : Interval) {r : Quad} (hr : r ∈ rows)
    {x y : ℝ} (hx : root.mem x) (hy : root.mem y) :
    |value r x - value r y| ≤ (lipschitz rows root : ℝ) * |x - y| := by
  let R : ℝ := max |(root.lo : ℝ)| |(root.hi : ℝ)|
  have hxabs : |x| ≤ R := abs_le.mpr ⟨by
    have := neg_abs_le (root.lo : ℝ)
    have : |(root.lo : ℝ)| ≤ R := le_max_left _ _
    linarith [hx.1, neg_abs_le (root.lo : ℝ)], by
    have : |(root.hi : ℝ)| ≤ R := le_max_right _ _
    linarith [hx.2, le_abs_self (root.hi : ℝ)]⟩
  have hyabs : |y| ≤ R := abs_le.mpr ⟨by
    have : |(root.lo : ℝ)| ≤ R := le_max_left _ _
    linarith [hy.1, neg_abs_le (root.lo : ℝ)], by
    have : |(root.hi : ℝ)| ≤ R := le_max_right _ _
    linarith [hy.2, le_abs_self (root.hi : ℝ)]⟩
  have hell : |(r.1 : ℝ)| ≤ (ellBound rows : ℝ) := by exact_mod_cast abs_ell_le hr
  have hcoeff : |x + y - 2 * (r.1 : ℝ)| ≤ (lipschitz rows root : ℝ) := by
    have hc : (lipschitz rows root : ℝ) = 2 * (R + (ellBound rows : ℝ)) := by
      simp [lipschitz, R]
    rw [hc]
    rcases abs_le.mp hxabs with ⟨hx0, hx1⟩
    rcases abs_le.mp hyabs with ⟨hy0, hy1⟩
    rcases abs_le.mp hell with ⟨he0, he1⟩
    exact abs_le.mpr ⟨by linarith, by linarith⟩
  calc |value r x - value r y| = |(x - y) * (x + y - 2 * (r.1 : ℝ))| := by
        congr 1; simp only [value]; ring
    _ = |x - y| * |x + y - 2 * (r.1 : ℝ)| := abs_mul _ _
    _ ≤ |x - y| * (lipschitz rows root : ℝ) :=
      mul_le_mul_of_nonneg_left hcoeff (abs_nonneg _)
    _ = _ := mul_comm _ _

/-- Once the cell width is small enough, a midpoint witness certifies both
endpoints. The row may vary from cell to cell. -/
theorem test_of_margin (rows : List Quad) (B : ℚ) (root d : Interval) (δ : ℝ)
    (hd : d.lo ≤ d.hi) (hlo : root.lo ≤ d.lo) (hhi : d.hi ≤ root.hi)
    (hmargin : ∀ x : ℝ, root.mem x → ∃ r ∈ rows, value r x ≤ (B : ℝ) - δ)
    (hwidth : (lipschitz rows root : ℝ) * ((d.hi : ℝ) - d.lo) ≤ δ) :
    test rows B d = true := by
  have hdR : (d.lo : ℝ) ≤ d.hi := by exact_mod_cast hd
  have hloR : (root.lo : ℝ) ≤ d.lo := by exact_mod_cast hlo
  have hhiR : (d.hi : ℝ) ≤ root.hi := by exact_mod_cast hhi
  have hm : (d.mid : ℝ) = ((d.lo : ℝ) + d.hi) / 2 := by simp [Interval.mid]
  have hmid : root.mem d.mid := ⟨by rw [hm]; linarith, by rw [hm]; linarith⟩
  obtain ⟨r, hr, hv⟩ := hmargin d.mid hmid
  have hend : ∀ t : ℚ, d.lo ≤ t → t ≤ d.hi → eval r t ≤ B := by
    intro t ht0 ht1
    have ht0R : (d.lo : ℝ) ≤ t := by exact_mod_cast ht0
    have ht1R : (t : ℝ) ≤ d.hi := by exact_mod_cast ht1
    have ht : root.mem t := ⟨hloR.trans ht0R, ht1R.trans hhiR⟩
    have hdist : |(t : ℝ) - d.mid| ≤ (d.hi : ℝ) - d.lo := by
      rw [hm]; exact abs_le.mpr ⟨by linarith, by linarith⟩
    have hL : (0 : ℝ) ≤ lipschitz rows root := by exact_mod_cast lipschitz_nonneg rows root
    have hvdiff := (le_abs_self (value r t - value r d.mid)).trans
      ((value_lipschitz rows root hr ht hmid).trans
        (mul_le_mul_of_nonneg_left hdist hL))
    have hreal : value r t ≤ (B : ℝ) := by linarith
    exact_mod_cast (show (eval r t : ℝ) ≤ B by simpa using hreal)
  exact List.any_eq_true.mpr ⟨r, hr, by
    simp only [decide_eq_true_eq]
    exact ⟨hend d.lo le_rfl hd, hend d.hi hd le_rfl⟩⟩

/-- A numerical resolution bound guarantees acceptance of every cell at that
depth. This is the invariant that proves successful termination. -/
theorem uniform_of_margin (rows : List Quad) (B : ℚ) (root : Interval) (δ : ℝ)
    (hmargin : ∀ x : ℝ, root.mem x → ∃ r ∈ rows, value r x ≤ (B : ℝ) - δ) :
    ∀ depth (d : Interval), d.lo ≤ d.hi → root.lo ≤ d.lo → d.hi ≤ root.hi →
      (lipschitz rows root : ℝ) * ((d.hi : ℝ) - d.lo) ≤ δ * 2 ^ depth →
      AdaptiveSearch.Uniform (test rows B) Interval.left Interval.right depth d := by
  intro depth
  induction depth with
  | zero =>
    intro d hd hlo hhi hw
    exact test_of_margin rows B root d δ hd hlo hhi hmargin (by simpa using hw)
  | succ depth ih =>
    intro d hd hlo hhi hw
    have hmid0 : d.lo ≤ d.mid := by dsimp [Interval.mid]; linarith
    have hmid1 : d.mid ≤ d.hi := by dsimp [Interval.mid]; linarith
    have hm : (d.mid : ℝ) = ((d.lo : ℝ) + d.hi) / 2 := by simp [Interval.mid]
    constructor
    · apply ih d.left hmid0 hlo (hmid1.trans hhi)
      dsimp only [Interval.left]
      rw [hm]
      rw [pow_succ] at hw
      nlinarith
    · apply ih d.right hmid1 (hlo.trans hmid0) hhi
      dsimp only [Interval.right]
      rw [hm]
      rw [pow_succ] at hw
      nlinarith

/-- An explicit depth budget suffices for the adaptive constructor. -/
theorem search_complete_of_margin (rows : List Quad) (B : ℚ) (root : Interval)
    (δ : ℝ) (depth : ℕ) (hd : root.lo ≤ root.hi)
    (hmargin : ∀ x : ℝ, root.mem x → ∃ r ∈ rows, value r x ≤ (B : ℝ) - δ)
    (hwidth : (lipschitz rows root : ℝ) * ((root.hi : ℝ) - root.lo) ≤ δ * 2 ^ depth) :
    ∃ tree, search rows B depth root = some tree :=
  AdaptiveSearch.search_complete_of_uniform _ _ _ depth root
    (uniform_of_margin rows B root δ hmargin depth root hd le_rfl le_rfl hwidth)

/-- Strict envelope margin guarantees eventual successful search. The proof
does not run the search or require a previously stored partition. -/
theorem search_eventually (rows : List Quad) (B : ℚ) (root : Interval)
    (hd : root.lo ≤ root.hi) (δ : ℝ) (hδ : 0 < δ)
    (hmargin : ∀ x : ℝ, root.mem x → ∃ r ∈ rows, value r x ≤ (B : ℝ) - δ) :
    ∃ depth tree, search rows B depth root = some tree := by
  obtain ⟨n, hn⟩ := exists_nat_gt
    ((lipschitz rows root : ℝ) * ((root.hi : ℝ) - root.lo) / δ)
  have hnpow : (n : ℝ) ≤ 2 ^ n := by
    exact_mod_cast (Nat.le_of_lt (Nat.lt_two_pow_self (n := n)))
  have hw : (lipschitz rows root : ℝ) * ((root.hi : ℝ) - root.lo) ≤ δ * 2 ^ n := by
    have h := (div_lt_iff₀ hδ).mp hn
    nlinarith
  obtain ⟨tree, ht⟩ := search_complete_of_margin rows B root δ n hd hmargin hw
  exact ⟨n, tree, ht⟩

/-- The partition is an executable witness, justified by the strict-margin
theorem. Neither its depth nor its cells appear in the source of the proof. -/
def construct (rows : List Quad) (B : ℚ) (root : Interval)
    (hd : root.lo ≤ root.hi)
    (hmargin : ∃ δ : ℝ, 0 < δ ∧
      ∀ x : ℝ, root.mem x → ∃ r ∈ rows, value r x ≤ (B : ℝ) - δ) :
    {tree : AdaptiveSearch.Tree //
      AdaptiveSearch.valid (test rows B) Interval.left Interval.right tree root = true} :=
  AdaptiveSearch.synthesize _ _ _ root (by
    obtain ⟨δ, hδ, hm⟩ := hmargin
    exact search_eventually rows B root hd δ hδ hm)

/-- The unevaluated constructed partition bounds the envelope everywhere. -/
theorem construct_envelope (rows : List Quad) (B : ℚ) (root : Interval)
    (hd : root.lo ≤ root.hi)
    (hmargin : ∃ δ : ℝ, 0 < δ ∧
      ∀ x : ℝ, root.mem x → ∃ r ∈ rows, value r x ≤ (B : ℝ) - δ)
    (x : ℝ) (hx : root.mem x) : ∃ r ∈ rows, value r x ≤ (B : ℝ) :=
  AdaptiveSearch.valid_sound (test rows B) Interval.left Interval.right Interval.mem
    (fun x => ∃ r ∈ rows, value r x ≤ (B : ℝ)) (test_sound rows B) split_cover
    (construct rows B root hd hmargin).val root
    (construct rows B root hd hmargin).property x hx

end Grothe.Lower.EnvelopeSearch
