import Grothe.LowerAnalytic.CapMajorant
import Grothe.LowerAnalytic.QuarticNewton

/-!
# Rational recovery of a joint complex support defect

The anisotropic quadratic majorant of `|l + (x + iy)| + |l - (x + iy)|` has a
nonnegative defect for every positive weight `lam` and nonnegative `l`; no comparison
between `l` and `lam` is required. A rational formula recovers at least the sharp fraction
`81 / 250` of that defect. Quartic Newton iteration then recovers it with an explicit
relative error.
These are pointwise algebraic statements, with no assertion about a Grothendieck endpoint.

Agent-ID: codex-c8a4
Refs #377
-/

namespace Grothe.LowerAnalytic.JointDefect

noncomputable section

/-- The anisotropic quadratic majorant. -/
def quadratic (lam l x y : ℝ) : ℝ :=
  (lam + l ^ 2 / lam) + x ^ 2 / (lam + l ^ 2 / lam) + y ^ 2 / lam

/-- The exact joint support of the two complex unit disks. -/
def support (l x y : ℝ) : ℝ :=
  ‖(l : ℂ) + (x + y * Complex.I)‖ + ‖(l : ℂ) - (x + y * Complex.I)‖

/-- The difference of the two support radii. -/
def innerRoot (l x y : ℝ) : ℝ :=
  |‖(l : ℂ) + (x + y * Complex.I)‖ - ‖(l : ℂ) - (x + y * Complex.I)‖|

/-- The gap between the quadratic bound and exact support. -/
def gap (lam l x y : ℝ) : ℝ := quadratic lam l x y - support l x y

/-- A rational correction evaluated without either complex norm. -/
def rationalCorrection (lam l x y : ℝ) : ℝ :=
  let H := quadratic lam l x y
  (H ^ 4 - 4 * H ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) + 16 * l ^ 2 * x ^ 2) /
    (2 * H ^ 3)

private lemma radius_squares (l x y : ℝ) :
    ‖(l : ℂ) + (x + y * Complex.I)‖ ^ 2 = (l + x) ^ 2 + y ^ 2 ∧
    ‖(l : ℂ) - (x + y * Complex.I)‖ ^ 2 = (l - x) ^ 2 + y ^ 2 ∧
    ‖(x : ℂ) + y * Complex.I‖ ^ 2 = x ^ 2 + y ^ 2 := by
  refine ⟨?_, ?_, ?_⟩ <;> simp [Complex.sq_norm, Complex.normSq_apply] <;> ring

private lemma support_geometry (l x y : ℝ) (hl : 0 ≤ l) :
    0 ≤ innerRoot l x y ∧ innerRoot l x y ≤ support l x y ∧
    innerRoot l x y ≤ 2 * l ∧
    innerRoot l x y ^ 2 ≤ 4 * (x ^ 2 + y ^ 2) ∧
    support l x y ^ 2 + innerRoot l x y ^ 2 = 4 * (l ^ 2 + x ^ 2 + y ^ 2) ∧
    support l x y ^ 2 * innerRoot l x y ^ 2 = 16 * l ^ 2 * x ^ 2 := by
  have hrs := radius_squares l x y
  have hdiff := norm_add_sub_norm_sub_le (l : ℂ) ((x : ℂ) + y * Complex.I)
  have hother := norm_add_sub_norm_sub_le ((x : ℂ) + y * Complex.I) (l : ℂ)
  have hdiff' : innerRoot l x y ≤ 2 * l := by
    simpa [innerRoot, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hl] using hdiff
  have hother' : innerRoot l x y ≤ 2 * ‖(x : ℂ) + y * Complex.I‖ := by
    simpa only [innerRoot, add_comm, norm_sub_rev] using hother
  have hb : 0 ≤ innerRoot l x y := abs_nonneg _
  have hbsq : innerRoot l x y ^ 2 ≤ 4 * (x ^ 2 + y ^ 2) := by
    have h := mul_self_le_mul_self hb hother'
    nlinarith [hrs.2.2]
  refine ⟨hb, ?_, hdiff', hbsq, ?_, ?_⟩
  · apply abs_sub_le_iff.mpr
    constructor <;> dsimp [support] <;>
      linarith [norm_nonneg ((l : ℂ) + (x + y * Complex.I)),
        norm_nonneg ((l : ℂ) - (x + y * Complex.I))]
  · dsimp [support, innerRoot]
    rw [sq_abs]
    nlinarith [hrs.1, hrs.2.1]
  · dsimp [support, innerRoot]
    rw [sq_abs]
    calc
      _ = (‖(l : ℂ) + (x + y * Complex.I)‖ ^ 2 -
          ‖(l : ℂ) - (x + y * Complex.I)‖ ^ 2) ^ 2 := by ring
      _ = 16 * l ^ 2 * x ^ 2 := by rw [hrs.1, hrs.2.1]; ring

private lemma majorant_algebra (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l) :
    0 < quadratic lam l x y ∧
    0 ≤ quadratic lam l x y ^ 2 - 2 * (l ^ 2 + x ^ 2 + y ^ 2) ∧
    0 ≤ quadratic lam l x y ^ 4 -
      4 * quadratic lam l x y ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) +
      16 * l ^ 2 * x ^ 2 := by
  let C := lam + l ^ 2 / lam
  let u := x ^ 2 / C
  let w := y ^ 2 / lam
  let s := u + w
  let d := lam - l ^ 2 / lam
  have hC : 0 < C := by dsimp [C]; positivity
  have hu : 0 ≤ u := by dsimp [u]; positivity
  have hw : 0 ≤ w := by dsimp [w]; positivity
  have hs : 0 ≤ s := add_nonneg hu hw
  have hCl : 2 * l ≤ C :=
    two_mul_le_add_of_sq_le_mul hlam.le (div_nonneg (sq_nonneg l) hlam.le)
      (by rw [mul_div_cancel₀ _ (ne_of_gt hlam)])
  have hH : quadratic lam l x y = C + s := by
    dsimp [quadratic, C, s, u, w]
    ring
  have hbranch : quadratic lam l x y ^ 2 - 2 * (l ^ 2 + x ^ 2 + y ^ 2) =
      lam ^ 2 + (l ^ 2 / lam) ^ 2 + s ^ 2 + 2 * (l ^ 2 / lam) * w := by
    dsimp [quadratic, C, s, u, w]
    field_simp
    ring
  have hfactor : 0 ≤ (s + C) ^ 2 - 4 * l ^ 2 := by nlinarith
  refine ⟨by rw [hH]; positivity, by rw [hbranch]; positivity, ?_⟩
  by_cases hs0 : s = 0
  · have hu0 : u = 0 := by linarith
    have hw0 : w = 0 := by linarith
    have hx0 : x = 0 := by
      have := (div_eq_zero_iff).mp hu0
      rcases this with hx | hc
      · nlinarith [sq_nonneg x]
      · exact False.elim ((ne_of_gt hC) hc)
    have hy0 : y = 0 := by
      have := (div_eq_zero_iff).mp hw0
      rcases this with hy | hlam0
      · nlinarith [sq_nonneg y]
      · exact False.elim ((ne_of_gt hlam) hlam0)
    rw [hx0, hy0]
    norm_num [quadratic]
    have := mul_nonneg (sq_nonneg C) (by nlinarith [hCl] : 0 ≤ C ^ 2 - 4 * l ^ 2)
    dsimp [C] at this
    nlinarith
  · have hspos : 0 < s := lt_of_le_of_ne hs (Ne.symm hs0)
    have hid : (quadratic lam l x y ^ 4 -
        4 * quadratic lam l x y ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) +
        16 * l ^ 2 * x ^ 2) * s =
        u * (s - C) ^ 2 * ((s + C) ^ 2 - 4 * l ^ 2) +
          w * (s - d) ^ 2 * (s + C) ^ 2 := by
      dsimp [quadratic, C, s, u, w, d]
      field_simp
      ring
    have hn : 0 ≤ (quadratic lam l x y ^ 4 -
        4 * quadratic lam l x y ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) +
        16 * l ^ 2 * x ^ 2) * s := by rw [hid]; positivity
    exact nonneg_of_mul_nonneg_left hn hspos

/-- The quadratic expression bounds the exact joint support. -/
theorem support_le_quadratic (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l) :
    support l x y ≤ quadratic lam l x y := by
  obtain ⟨hH, hbranch, hpoly⟩ := majorant_algebra lam l x y hlam hl
  obtain ⟨hb, hbS, _, _, hsum, hprod⟩ := support_geometry l x y hl
  have hS : 0 ≤ support l x y := by dsimp [support]; positivity
  have hid : (quadratic lam l x y ^ 2 - support l x y ^ 2) *
      (quadratic lam l x y ^ 2 - innerRoot l x y ^ 2) =
      quadratic lam l x y ^ 4 -
      4 * quadratic lam l x y ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) +
      16 * l ^ 2 * x ^ 2 := by
    calc
      _ = quadratic lam l x y ^ 4 - quadratic lam l x y ^ 2 *
          (support l x y ^ 2 + innerRoot l x y ^ 2) +
          support l x y ^ 2 * innerRoot l x y ^ 2 := by ring
      _ = _ := by rw [hsum, hprod]; ring
  have hsq : support l x y ^ 2 ≤ quadratic lam l x y ^ 2 := by
    by_contra hn
    have hlt : quadratic lam l x y ^ 2 < support l x y ^ 2 := lt_of_not_ge hn
    have hp : 0 < quadratic lam l x y ^ 2 - innerRoot l x y ^ 2 := by
      nlinarith [hsum]
    have hneg := mul_neg_of_neg_of_pos
      (sub_neg.mpr hlt) hp
    rw [hid] at hneg
    linarith
  nlinarith

private lemma innerRoot_le_four_fifths (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l) :
    innerRoot l x y ≤ (4 / 5 : ℝ) * quadratic lam l x y := by
  let C := lam + l ^ 2 / lam
  have hC : 0 < C := by dsimp [C]; positivity
  have hClam : lam ≤ C := by
    exact le_add_of_nonneg_right (div_nonneg (sq_nonneg l) hlam.le)
  have hCl : 2 * l ≤ C :=
    two_mul_le_add_of_sq_le_mul hlam.le (div_nonneg (sq_nonneg l) hlam.le)
      (by rw [mul_div_cancel₀ _ (ne_of_gt hlam)])
  obtain ⟨hb, _, hbl, hbsq, _, _⟩ := support_geometry l x y hl
  have hbC : innerRoot l x y ≤ C := hbl.trans hCl
  have hCy : y ^ 2 / C ≤ y ^ 2 / lam :=
    div_le_div_of_nonneg_left (sq_nonneg y) hlam hClam
  have hH : C + (x ^ 2 + y ^ 2) / C ≤ quadratic lam l x y := by
    dsimp [quadratic]
    dsimp [C] at hCy ⊢
    rw [add_div]
    linarith
  have hmul : C * (C + (x ^ 2 + y ^ 2) / C) ≤ C * quadratic lam l x y :=
    mul_le_mul_of_nonneg_left hH hC.le
  have hbase : C ^ 2 + x ^ 2 + y ^ 2 ≤ C * quadratic lam l x y := by
    convert hmul using 1
    field_simp
    ring
  have hfac : 0 ≤ (C - innerRoot l x y) * (4 * C - innerRoot l x y) := by
    apply mul_nonneg <;> linarith
  have hscaled : 0 ≤ C * ((4 / 5 : ℝ) * quadratic lam l x y - innerRoot l x y) := by
    nlinarith
  exact sub_nonneg.mp (nonneg_of_mul_nonneg_right hscaled hC)

private lemma rational_factor_bounds {H S b : ℝ} (hH : 0 < H) (hb : 0 ≤ b)
    (hbS : b ≤ S) (hSH : S ≤ H) (hbH : b ≤ (4 / 5 : ℝ) * H) :
    (81 / 250 : ℝ) * (H - S) ≤ (H - S) * (H + S) * (H ^ 2 - b ^ 2) / (2 * H ^ 3) ∧
      (H - S) * (H + S) * (H ^ 2 - b ^ 2) / (2 * H ^ 3) ≤ H - S := by
  have hS : 0 ≤ S := hb.trans hbS
  have hgap : 0 ≤ H - S := sub_nonneg.mpr hSH
  have hfac : 0 ≤ H ^ 2 - b ^ 2 := by nlinarith
  have hd : 0 < 2 * H ^ 3 := by positivity
  have hup : (H + S) * (H ^ 2 - b ^ 2) ≤ 2 * H ^ 3 := by
    have h := mul_le_mul (by linarith : H + S ≤ 2 * H)
      (by nlinarith [sq_nonneg b] : H ^ 2 - b ^ 2 ≤ H ^ 2) hfac (by positivity)
    nlinarith
  have hlow : (81 / 125 : ℝ) * H ^ 3 ≤ (H + S) * (H ^ 2 - b ^ 2) := by
    have h := mul_le_mul_of_nonneg_right (by linarith : H + b ≤ H + S) hfac
    have hf : 0 ≤ ((4 / 5 : ℝ) * H - b) *
        (b ^ 2 + (9 / 5 : ℝ) * H * b + (11 / 25 : ℝ) * H ^ 2) := by
      apply mul_nonneg (sub_nonneg.mpr hbH)
      positivity
    nlinarith
  constructor
  · apply (le_div_iff₀ hd).2
    have := mul_le_mul_of_nonneg_left hlow hgap
    nlinarith
  · apply (div_le_iff₀ hd).2
    have := mul_le_mul_of_nonneg_left hup hgap
    nlinarith

/-- The norm-free correction recovers between `81 / 250` and all of the joint defect. -/
theorem rationalCorrection_bounds (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l) :
    (81 / 250 : ℝ) * gap lam l x y ≤ rationalCorrection lam l x y ∧
      rationalCorrection lam l x y ≤ gap lam l x y := by
  obtain ⟨hb, hbS, _, _, hsum, hprod⟩ := support_geometry l x y hl
  have h := rational_factor_bounds (majorant_algebra lam l x y hlam hl).1 hb hbS
    (support_le_quadratic lam l x y hlam hl) (innerRoot_le_four_fifths lam l x y hlam hl)
  have hid : (quadratic lam l x y - support l x y) *
      (quadratic lam l x y + support l x y) *
      (quadratic lam l x y ^ 2 - innerRoot l x y ^ 2) =
      quadratic lam l x y ^ 4 -
      4 * quadratic lam l x y ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) +
      16 * l ^ 2 * x ^ 2 := by
    calc
      _ = quadratic lam l x y ^ 4 - quadratic lam l x y ^ 2 *
          (support l x y ^ 2 + innerRoot l x y ^ 2) +
          support l x y ^ 2 * innerRoot l x y ^ 2 := by ring
      _ = _ := by rw [hsum, hprod]; ring
  simpa only [gap, rationalCorrection, hid] using h

/-- The lower fraction `81 / 250` is attained at `lam = l = x = 1`, `y = 0`. -/
theorem rationalCorrection_sharp :
    gap 1 1 1 0 = 1 / 2 ∧ rationalCorrection 1 1 1 0 = 81 / 500 := by
  norm_num [gap, quadratic, support, rationalCorrection]

/-- `81 / 250` is the greatest universal fraction recovered by the rational correction. -/
theorem rationalCorrection_factor_iff (C : ℝ) :
    (∀ lam l x y : ℝ, 0 < lam → 0 ≤ l →
      C * gap lam l x y ≤ rationalCorrection lam l x y) ↔ C ≤ (81 / 250 : ℝ) := by
  constructor
  · intro h
    have h1 := h 1 1 1 0 (by norm_num) (by norm_num)
    rw [rationalCorrection_sharp.1, rationalCorrection_sharp.2] at h1
    linarith
  · intro hC lam l x y hlam hl
    have hgap : 0 ≤ gap lam l x y :=
      sub_nonneg.mpr (support_le_quadratic lam l x y hlam hl)
    exact (mul_le_mul_of_nonneg_right hC hgap).trans
      (rationalCorrection_bounds lam l x y hlam hl).1

/-- The correction obtained after `n` rational Newton steps. -/
def correction (lam l x y : ℝ) (n : ℕ) : ℝ :=
  quadratic lam l x y - QuarticNewton.iterate (support l x y) (innerRoot l x y)
    (quadratic lam l x y - rationalCorrection lam l x y) n

/-- The zeroth correction is the original rational formula. -/
@[simp] theorem correction_zero (lam l x y : ℝ) :
    correction lam l x y 0 = rationalCorrection lam l x y := by
  simp [correction, QuarticNewton.iterate]

/-- Each new correction is evaluated by a rational recurrence involving no complex norms. -/
theorem correction_succ (lam l x y : ℝ) (hl : 0 ≤ l) (n : ℕ) :
    correction lam l x y (n + 1) = correction lam l x y n +
      ((quadratic lam l x y - correction lam l x y n) ^ 4 -
        4 * (quadratic lam l x y - correction lam l x y n) ^ 2 *
          (l ^ 2 + x ^ 2 + y ^ 2) + 16 * l ^ 2 * x ^ 2) /
      (4 * (quadratic lam l x y - correction lam l x y n) ^ 3 -
        8 * (l ^ 2 + x ^ 2 + y ^ 2) *
          (quadratic lam l x y - correction lam l x y n)) := by
  obtain ⟨_, _, _, _, hsum, hprod⟩ := support_geometry l x y hl
  let z := QuarticNewton.iterate (support l x y) (innerRoot l x y)
    (quadratic lam l x y - rationalCorrection lam l x y) n
  have hz : quadratic lam l x y - correction lam l x y n = z := by
    dsimp [z, correction]
    ring
  have hp : QuarticNewton.polynomial (support l x y) (innerRoot l x y) z =
      z ^ 4 - 4 * z ^ 2 * (l ^ 2 + x ^ 2 + y ^ 2) + 16 * l ^ 2 * x ^ 2 := by
    unfold QuarticNewton.polynomial
    calc
      _ = z ^ 4 - z ^ 2 * (support l x y ^ 2 + innerRoot l x y ^ 2) +
          support l x y ^ 2 * innerRoot l x y ^ 2 := by ring
      _ = _ := by rw [hsum, hprod]; ring
  have hd : QuarticNewton.denominator (support l x y) (innerRoot l x y) z =
      4 * z ^ 3 - 8 * (l ^ 2 + x ^ 2 + y ^ 2) * z := by
    unfold QuarticNewton.denominator
    calc
      _ = 4 * z ^ 3 - 2 * z * (support l x y ^ 2 + innerRoot l x y ^ 2) := by ring
      _ = _ := by rw [hsum]; ring
  rw [hz]
  change quadratic lam l x y - (z -
    QuarticNewton.polynomial (support l x y) (innerRoot l x y) z /
      QuarticNewton.denominator (support l x y) (innerRoot l x y) z) = _
  rw [hp, hd]
  linarith [hz]

/-- Every rational Newton correction lies between the initial correction and the exact gap. -/
theorem correction_bounds (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l)
    (n : ℕ) :
    0 ≤ rationalCorrection lam l x y ∧
    rationalCorrection lam l x y ≤ correction lam l x y n ∧
    correction lam l x y n ≤ gap lam l x y := by
  obtain ⟨hb, hbS, _, _, _, _⟩ := support_geometry l x y hl
  have hr := rationalCorrection_bounds lam l x y hlam hl
  have hgap : 0 ≤ gap lam l x y :=
    sub_nonneg.mpr (support_le_quadratic lam l x y hlam hl)
  have hz : support l x y ≤ quadratic lam l x y - rationalCorrection lam l x y := by
    dsimp [gap] at hr
    linarith [hr.2]
  have hi := (QuarticNewton.iterate_bounds hb hbS hz n).1
  have ha := QuarticNewton.iterate_antitone hb hbS hz (Nat.zero_le n)
  simp only [QuarticNewton.iterate] at ha
  dsimp [correction, gap] at hi ha ⊢
  refine ⟨by nlinarith [hr.1], ?_, ?_⟩ <;> linarith

/-- The rational corrections increase monotonically. -/
theorem correction_monotone (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l) :
    Monotone (correction lam l x y) := by
  obtain ⟨hb, hbS, _, _, _, _⟩ := support_geometry l x y hl
  have hr := (rationalCorrection_bounds lam l x y hlam hl).2
  have hz : support l x y ≤ quadratic lam l x y - rationalCorrection lam l x y := by
    dsimp [gap] at hr
    linarith
  intro m n hmn
  exact sub_le_sub_left (QuarticNewton.iterate_antitone hb hbS hz hmn) _

/-- The explicit relative error of the rational correction hierarchy. -/
theorem correction_error (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l)
    (n : ℕ) :
    gap lam l x y - correction lam l x y n ≤
      (169 / 250 : ℝ) * (3 / 4 : ℝ) ^ n * gap lam l x y := by
  obtain ⟨hb, hbS, _, _, _, _⟩ := support_geometry l x y hl
  have hr := rationalCorrection_bounds lam l x y hlam hl
  have hz : support l x y ≤ quadratic lam l x y - rationalCorrection lam l x y := by
    dsimp [gap] at hr
    linarith [hr.2]
  have hinit : quadratic lam l x y - rationalCorrection lam l x y - support l x y ≤
      (169 / 250 : ℝ) * gap lam l x y := by
    dsimp [gap] at hr ⊢
    linarith [hr.1]
  calc
    gap lam l x y - correction lam l x y n =
        QuarticNewton.iterate (support l x y) (innerRoot l x y)
          (quadratic lam l x y - rationalCorrection lam l x y) n - support l x y := by
      simp [gap, correction]
    _ ≤ (3 / 4 : ℝ) ^ n *
        (quadratic lam l x y - rationalCorrection lam l x y - support l x y) :=
      (QuarticNewton.iterate_bounds hb hbS hz n).2
    _ ≤ (3 / 4 : ℝ) ^ n * ((169 / 250 : ℝ) * gap lam l x y) :=
      mul_le_mul_of_nonneg_left hinit (by positivity)
    _ = _ := by ring

/-- Thirty-one steps recover at least `9999 / 10000` of the exact defect. -/
theorem correction_31 (lam l x y : ℝ) (hlam : 0 < lam) (hl : 0 ≤ l) :
    (9999 / 10000 : ℝ) * gap lam l x y ≤ correction lam l x y 31 := by
  have he := correction_error lam l x y hlam hl 31
  have hg : 0 ≤ gap lam l x y :=
    sub_nonneg.mpr (support_le_quadratic lam l x y hlam hl)
  have hc : (169 / 250 : ℝ) * (3 / 4 : ℝ) ^ 31 ≤ 1 / 10000 := by norm_num
  have := mul_le_mul_of_nonneg_right hc hg
  linarith

end

end Grothe.LowerAnalytic.JointDefect
