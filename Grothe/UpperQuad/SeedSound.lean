import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Seed

/-!
# Soundness of the seed series (obligation S2 of #303, the finite part)

The series `Σ_n t_n(x)`, `t_n(x) = (−x)ⁿ (2n)!/(4ⁿ (n!)³ (n+1))`, is evaluated by the loop of
`seedJ0SeriesI`; here the loop is shown to enclose the partial sums and the next term, and the
seed enclosure is shown sound for any real number `J` within the stated tail distance of the
partial sum (`hJ`).  That `J₀(x) = OriginalPositiveMoment.moment 0 x` satisfies `hJ` is the
analytic part of S2 (the Kummer series of the moment with the geometric tail), kept as a
hypothesis in the bridge.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad

/-- The series terms `t_n(x) = (−x)ⁿ (2n)! / (4ⁿ (n!)³ (n+1))`. -/
noncomputable def seedTerm (x : ℝ) (n : ℕ) : ℝ :=
  (-x) ^ n * ((2 * n).factorial : ℝ) / (4 ^ n * ((n.factorial : ℝ)) ^ 3 * (n + 1))

lemma seedTerm_zero (x : ℝ) : seedTerm x 0 = 1 := by simp [seedTerm]

/-- `t_{n+1} = t_n · (−x) · (2n+1) / (2 (n+1) (n+2))`. -/
lemma seedTerm_succ (x : ℝ) (n : ℕ) :
    seedTerm x (n + 1) = seedTerm x n * (-x) * (2 * n + 1) / (2 * (n + 1) * (n + 2)) := by
  unfold seedTerm
  have h2 : (2 * (n + 1)).factorial = (2 * n + 2) * ((2 * n + 1) * (2 * n).factorial) := by
    rw [show 2 * (n + 1) = 2 * n + 1 + 1 by ring, Nat.factorial_succ, Nat.factorial_succ]
  rw [h2, Nat.factorial_succ, pow_succ, pow_succ]
  push_cast
  have hf : ((n.factorial : ℝ)) ≠ 0 := by positivity
  have h4 : ((4 : ℝ) ^ n) ≠ 0 := by positivity
  field_simp
  ring

/-- The loop of `seedJ0SeriesI`: from `(t, s)` enclosing `(t_i, Σ_{n≤i} t_n)`, `fuel` more terms
(with `negx` enclosing `−x`). -/
lemma seedLoop_sound (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {negx : Ival} (hx : mem (-x) negx) :
    ∀ (fuel i : ℕ) (t s : Ival), mem (seedTerm x i) t →
      mem (∑ n ∈ Finset.range (i + 1), seedTerm x n) s →
      mem (∑ n ∈ Finset.range (i + fuel + 1), seedTerm x n)
        (seedLoop P negx fuel i t s).1 ∧
      mem (seedTerm x (i + fuel)) (seedLoop P negx fuel i t s).2 := by
  intro fuel
  induction fuel with
  | zero =>
    intro i t s ht hs
    simpa [seedLoop] using ⟨hs, ht⟩
  | succ fuel ih =>
    intro i t s ht hs
    have ht' : mem (seedTerm x (i + 1))
        (divN P (2 * (i + 1) * (i + 2)) (mulN P (2 * i + 1) (mulI P t negx))) := by
      have h := mem_divN P hP (by positivity : 0 < 2 * (i + 1) * (i + 2))
        (mem_mulN P (2 * i + 1) (mem_mulI P ht hx))
      rw [seedTerm_succ]
      convert h using 1
      push_cast
      ring
    have hs' : mem (∑ n ∈ Finset.range (i + 1 + 1), seedTerm x n)
        (addI P s (divN P (2 * (i + 1) * (i + 2)) (mulN P (2 * i + 1) (mulI P t negx)))) := by
      rw [Finset.sum_range_succ]
      exact mem_addI P hs ht'
    have := ih (i + 1) _ _ ht' hs'
    rw [show i + 1 + fuel = i + (fuel + 1) by ring] at this
    simpa [seedLoop] using this

lemma mem_seedSeries (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {x : ℝ} {xI : Ival} (hx0 : 0 ≤ x) (hx : mem x xI) :
    mem (∑ n ∈ Finset.range (N + 1), seedTerm x n) (seedSeries P N xI).1 ∧
      mem (seedTerm x N) (seedSeries P N xI).2 := by
  have hneg : mem (-x) (negI (clampI xI)) := mem_negI (mem_clampI hx0 hx)
  have h1 : mem (seedTerm x 0) (ofInt P 1) := by rw [seedTerm_zero]; exact mem_one P
  have h2 : mem (∑ n ∈ Finset.range (0 + 1), seedTerm x n) (ofInt P 1) := by
    simp [seedTerm_zero]; exact mem_one P
  have := seedLoop_sound P hP hneg N 0 _ _ h1 h2
  simpa [seedSeries] using this

lemma mem_seedNext (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {x : ℝ} {xI : Ival} (hx0 : 0 ≤ x) (hx : mem x xI) :
    mem (seedTerm x (N + 1)) (seedNext P N xI) := by
  have hneg : mem (-x) (negI (clampI xI)) := mem_negI (mem_clampI hx0 hx)
  have h := mem_divN P hP (by positivity : 0 < 2 * (N + 1) * (N + 2))
    (mem_mulN P (2 * N + 1) (mem_mulI P (mem_seedSeries P hP N hx0 hx).2 hneg))
  unfold seedNext
  rw [seedTerm_succ]
  convert h using 1
  push_cast
  ring

/-- The series enclosure is sound for every `J` within the geometric tail of the partial sum
(the analytic content of S2 is the hypothesis `hJ` for `J = J₀(x)`). -/
lemma mem_seedJ0SeriesI (P : ℕ) (hP : 1 ≤ P) (N : ℕ) {x J : ℝ} {xI : Ival} (hx0 : 0 ≤ x)
    (hx : mem x xI) (hv : seedSeriesValid P N xI = true)
    (hJ : |J - ∑ n ∈ Finset.range (N + 1), seedTerm x n| ≤
      |seedTerm x (N + 1)| * ((N + 3) / ((N : ℝ) + 3 - x))) :
    mem J (seedJ0SeriesI P N xI) := by
  have hden : mem ((N : ℝ) + 3 - x) (seedDen P N xI) := by
    unfold seedDen
    have := mem_subI P (mem_ofNat P (N + 3)) (mem_clampI hx0 hx)
    push_cast at this
    exact this
  have hpos : (0 : ℝ) < (N : ℝ) + 3 - x := pos_of_isPos hv hden
  have hU : mem ((N + 3 : ℕ) * bval (seedNext P N xI)) (mulN P (N + 3) (absUpper (seedNext P N xI))) :=
    mem_mulN P (N + 3) (mem_absUpper _)
  have hT := mem_divI P hU hden (lo_pos_of_isPos hv)
  unfold seedJ0SeriesI
  simp only [hv, ↓reduceIte]
  have hy : |J - ∑ n ∈ Finset.range (N + 1), seedTerm x n| ≤
      bval (divI P (mulN P (N + 3) (absUpper (seedNext P N xI))) (seedDen P N xI)) := by
    have hb := abs_le_bval hT
    have htn : |seedTerm x (N + 1)| ≤ bval (seedNext P N xI) :=
      abs_le_bval (mem_seedNext P hP N hx0 hx)
    have hTv : |seedTerm x (N + 1)| * ((N + 3) / ((N : ℝ) + 3 - x)) ≤
        (N + 3 : ℕ) * bval (seedNext P N xI) / ((N : ℝ) + 3 - x) := by
      push_cast
      rw [mul_div_assoc', div_le_div_iff_of_pos_right hpos]
      nlinarith [bval_nonneg (seedNext P N xI), abs_nonneg (seedTerm x (N + 1))]
    calc _ ≤ _ := hJ
      _ ≤ (N + 3 : ℕ) * bval (seedNext P N xI) / ((N : ℝ) + 3 - x) := hTv
      _ ≤ |(N + 3 : ℕ) * bval (seedNext P N xI) / ((N : ℝ) + 3 - x)| := le_abs_self _
      _ ≤ _ := hb
  have := mem_widen P (mem_seedSeries P hP N hx0 hx).1 hy
  simpa using this

end Grothe.UpperQuad
