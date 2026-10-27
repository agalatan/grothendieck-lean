import Grothe.LowerAnalytic.CapTables
import Grothe.HJM.OriginPanelAlgebra

/-!
# Signed polynomial Gaussian moment enclosures

Agent-ID: codex-aa04. Concrete numerical integral bounds require a separate check.

The complete signed polynomial is integrated before its coefficients are
bounded. Only the Taylor remainder uses the coefficient norm. There is no
degree cutoff and no imported quadrature result.
-/

open MeasureTheory Set Finset Real

namespace Grothe.HJM.OriginMoment

open Grothe.LowerAnalytic.CapTab
open Grothe.HJM.OriginPanel Grothe.Lower
open scoped ComplexConjugate

/-- The two list evaluators implement the same ascending-coefficient
polynomial. This lets moment integration reuse the existing CapTab lemmas
without changing the actual phase-panel polynomial. -/
lemma evalQ_eq_pev (p : List ℚ) (t : ℝ) : evalQ p t = pev p t := by
  induction p with
  | nil => simp [evalQ, Grothe.Lower.evalL, pev]
  | cons a p ih => simp only [evalQ_cons, pev, ih]

/-- On the open interior of a certified panel, the piecewise approximation
selects that panel even at a later subdivision of it. Shared endpoints are
excluded only for integral congruence, where they have measure zero. -/
theorem approxList_eq_on_open (re im : List ℚ) {lo hi : ℚ} {ps : List Panel}
    (hc : covers lo hi ps = true) {p : Panel} (hp : p ∈ ps) {t : ℝ}
    (ht : (p.a : ℝ) < t ∧ t < (p.b : ℝ)) :
    approxList re im ps t = panelApprox re im p t := by
  induction ps generalizing lo with
  | nil => simp at hp
  | cons q qs ih =>
    simp only [covers, Bool.and_eq_true, decide_eq_true_eq] at hc
    rcases hc with ⟨⟨_hlo, _hpositive⟩, htail⟩
    rcases List.mem_cons.mp hp with heq | hp
    · subst p
      have hmem : (q.a : ℝ) ≤ t ∧ t ≤ (q.b : ℝ) := ⟨ht.1.le, ht.2.le⟩
      simp only [approxList, ite_eq_left hmem]
    · have hle : (q.b : ℝ) ≤ p.a := by
        exact_mod_cast (covers_panel_bounds htail p hp).1
      have hnot : ¬ ((q.a : ℝ) ≤ t ∧ t ≤ (q.b : ℝ)) := by
        intro h
        linarith [ht.1, h.2]
      rw [approxList, ite_eq_right hnot]
      exact ih htail hp

/-- The local coordinate for a subpanel `[c-h,c+h]`, as a rational list. -/
def subpanelCoordinate (p : Panel) (c h : ℚ) : List ℚ :=
  [(c - center p) / halfWidth p, h / halfWidth p]

theorem evalQ_subpanelCoordinate (p : Panel) (c h : ℚ) (y : ℝ) :
    evalQ (subpanelCoordinate p c h) y =
      coordinate p ((c : ℝ) + (h : ℝ) * y) := by
  simp only [subpanelCoordinate, evalQ_cons, evalQ_nil, Rat.cast_div,
    Rat.cast_sub, mul_zero, add_zero, coordinate]
  ring

/-- Polynomial in normalized coordinate `y`: the signed real part of the
test against the phase approximant, with the physical factor `2 h t²`.
The test polynomial uses squared radius `t²` and is conjugated only at the
last multiplication. -/
def signedCellPolynomial (test : CList) (re im : List ℚ)
    (p : Panel) (c h : ℚ) : List ℚ :=
  let t2 := mulQ [c, h] [c, h]
  let w := compQ p.w (subpanelCoordinate p c h)
  let vl := scaleL p.k (mulQ (compQ re t2) w)
  let vr := scaleL p.k (mulQ (compQ im t2) w)
  let tl := compQ test.re t2
  let tr := compQ test.im t2
  scaleL (2 * h) (mulQ t2 (addLq (mulQ tl vl) (mulQ tr vr)))

/-- No coefficientwise absolute value is taken in this identity. -/
theorem signedCellPolynomial_eval (test : CList) (re im : List ℚ)
    (p : Panel) (c h : ℚ) (y : ℝ) :
    pev (signedCellPolynomial test re im p c h) y =
      (2 * (h : ℝ)) * ((c : ℝ) + (h : ℝ) * y) ^ 2 *
        (conj (evalC test (((c : ℝ) + (h : ℝ) * y) ^ 2)) *
          panelApprox re im p ((c : ℝ) + (h : ℝ) * y)).re := by
  have hcomp (r : List ℚ) :
      evalQ (compQ r (mulQ [c, h] [c, h])) y =
        evalQ r (((c : ℝ) + (h : ℝ) * y) ^ 2) := by
    rw [evalQ_comp, evalQ_square]
  have hw : evalQ (compQ p.w (subpanelCoordinate p c h)) y =
      evalQ p.w (coordinate p ((c : ℝ) + (h : ℝ) * y)) := by
    rw [evalQ_comp, evalQ_subpanelCoordinate]
  have hRe (q : CList) (s : ℝ) : (evalC q s).re = evalQ q.re s := by
    simp [evalC]
  have hIm (q : CList) (s : ℝ) : (evalC q s).im = evalQ q.im s := by
    simp [evalC]
  have hreal (x : ℝ) :
      (conj (evalC test (x ^ 2)) * panelApprox re im p x).re =
        ((p.k : ℝ) * evalQ p.w (coordinate p x)) *
          (evalQ test.re (x ^ 2) * evalQ re (x ^ 2) +
            evalQ test.im (x ^ 2) * evalQ im (x ^ 2)) := by
    simp only [panelApprox, Complex.mul_re, Complex.conj_re, Complex.conj_im,
      Complex.ofReal_re, Complex.ofReal_im, hRe, hIm, zero_mul, sub_zero, add_zero,
      neg_mul, sub_neg_eq_add]
    ring
  rw [hreal]
  rw [← evalQ_eq_pev]
  unfold signedCellPolynomial
  simp only [evalQ_scale, evalQ_mul, evalQ_add, hcomp, hw, evalQ_cons,
    evalQ_nil, Rat.cast_mul, Rat.cast_ofNat, mul_zero, add_zero]
  ring

/-- The real integrand corresponding to a finite signed test polynomial. -/
noncomputable def signedApproxIntegrand (test : CList) (re im : List ℚ)
    (ps : List Panel) (t : ℝ) : ℝ :=
  2 * t ^ 2 * exp (-t ^ 2) *
    (conj (evalC test (t ^ 2)) * approxList re im ps t).re

/-- The cell polynomial is exactly the actual piecewise test integrand on
any strict subdivision of its original phase panel. -/
theorem signedApproxIntegrand_on_subpanel (test : CList) (re im : List ℚ)
    {lo hi : ℚ} {ps : List Panel} (hc : covers lo hi ps = true)
    {p : Panel} (hp : p ∈ ps) {c h : ℚ} (hh : 0 < h)
    (ha : p.a ≤ c - h) (hb : c + h ≤ p.b) {t : ℝ}
    (ht : t ∈ Ioo ((c - h : ℚ) : ℝ) ((c + h : ℚ) : ℝ)) :
    signedApproxIntegrand test re im ps t = (h : ℝ)⁻¹ *
      pev (signedCellPolynomial test re im p c h) ((t - c) / h) * exp (-t ^ 2) := by
  have hhR : (0 : ℝ) < h := by exact_mod_cast hh
  have haR : (p.a : ℝ) ≤ (c - h : ℚ) := by exact_mod_cast ha
  have hbR : ((c + h : ℚ) : ℝ) ≤ p.b := by exact_mod_cast hb
  have hpopen : (p.a : ℝ) < t ∧ t < (p.b : ℝ) := ⟨haR.trans_lt ht.1, ht.2.trans_le hbR⟩
  have hselect := approxList_eq_on_open re im hc hp hpopen
  have hcoord : (c : ℝ) + (h : ℝ) * ((t - (c : ℝ)) / h) = t := by
    field_simp [hhR.ne']
    ring
  rw [signedApproxIntegrand, hselect, signedCellPolynomial_eval, hcoord]
  field_simp [hhR.ne']

def coeffNorm (p : List ℚ) : ℚ := (p.map abs).sum

lemma coeffNorm_nonneg (p : List ℚ) : 0 ≤ coeffNorm p := by
  apply List.sum_nonneg
  intro a ha
  obtain ⟨b, _hb, rfl⟩ := List.mem_map.mp ha
  exact abs_nonneg b

lemma abs_pev_le_coeffNorm (p : List ℚ) (t : ℝ) (ht : |t| ≤ 1) :
    |pev p t| ≤ (coeffNorm p : ℝ) := by
  induction p with
  | nil => simp [pev, coeffNorm]
  | cons a p ih =>
    calc
      |pev (a :: p) t| ≤ |(a : ℝ)| + |t| * |pev p t| := by
        simpa only [pev, abs_mul] using abs_add_le (a : ℝ) (t * pev p t)
      _ ≤ |(a : ℝ)| + 1 * (coeffNorm p : ℝ) :=
        add_le_add le_rfl (mul_le_mul ht ih (abs_nonneg _) zero_le_one)
      _ = _ := by simp [coeffNorm]

def localExp (c h : ℚ) : List ℚ := [0, -2 * c * h, -h ^ 2]
def variation (c h : ℚ) : ℚ := 2 * c * h + h ^ 2
def taylor (c h : ℚ) (n : ℕ) : List ℚ := (expPoly (localExp c h) n).1
def integralTaylor (p : List ℚ) (c h : ℚ) (n : ℕ) : ℚ :=
  pint (pmul p (taylor c h n)) 0 (-1) 1
def error (p : List ℚ) (c h : ℚ) (n : ℕ) : ℚ :=
  2 * coeffNorm p * expRem (variation c h) n

lemma localExp_eval (c h : ℚ) (t : ℝ) :
    pev (localExp c h) t = -2 * (c : ℝ) * (h : ℝ) * t - (h : ℝ) ^ 2 * t ^ 2 := by
  simp [localExp, pev]
  ring

lemma localExp_abs_le {c h : ℚ} (hc : 0 ≤ c) (hh : 0 ≤ h)
    (t : ℝ) (ht : t ∈ Icc (-1 : ℝ) 1) :
    |pev (localExp c h) t| ≤ (variation c h : ℝ) := by
  have hcR : (0 : ℝ) ≤ c := by exact_mod_cast hc
  have hhR : (0 : ℝ) ≤ h := by exact_mod_cast hh
  have ht1 : |t| ≤ 1 := abs_le.mpr ⟨by linarith [ht.1], ht.2⟩
  have ht2 : t ^ 2 ≤ 1 := by
    have hs := (sq_le_sq₀ (abs_nonneg t) (by norm_num : (0 : ℝ) ≤ 1)).mpr ht1
    simpa only [sq_abs, one_pow] using hs
  rw [localExp_eval]
  calc
    _ ≤ |-2 * (c : ℝ) * (h : ℝ) * t| + |(h : ℝ) ^ 2 * t ^ 2| :=
      abs_sub _ _
    _ = 2 * (c : ℝ) * (h : ℝ) * |t| + (h : ℝ) ^ 2 * t ^ 2 := by
      rw [show -2 * (c : ℝ) * (h : ℝ) * t = -(2 * (c : ℝ) * (h : ℝ) * t) by ring,
        abs_neg, abs_mul, abs_of_nonneg (by positivity : (0 : ℝ) ≤ 2 * c * h),
        abs_of_nonneg (by positivity : (0 : ℝ) ≤ (h : ℝ) ^ 2 * t ^ 2)]
    _ ≤ 2 * (c : ℝ) * (h : ℝ) + (h : ℝ) ^ 2 :=
      add_le_add
        (by simpa only [mul_one] using
          mul_le_mul_of_nonneg_left ht1 (by positivity : (0 : ℝ) ≤ 2 * (c : ℝ) * (h : ℝ)))
        (by simpa only [mul_one] using mul_le_mul_of_nonneg_left ht2 (sq_nonneg (h : ℝ)))
    _ = _ := by simp [variation]

/-- A signed polynomial times the local exponential is enclosed on [-1,1]. -/
theorem local_integral_enclosure (p : List ℚ) {c h : ℚ} (hc : 0 ≤ c) (hh : 0 ≤ h)
    (hU : variation c h ≤ 1) (n : ℕ) (hn : 0 < n) :
    ((integralTaylor p c h n - error p c h n : ℚ) : ℝ) ≤
      (∫ t in (-1 : ℝ)..1, pev p t * exp (pev (localExp c h) t)) ∧
    (∫ t in (-1 : ℝ)..1, pev p t * exp (pev (localExp c h) t)) ≤
      ((integralTaylor p c h n + error p c h n : ℚ) : ℝ) := by
  let E : ℝ := expRem (variation c h) n
  let A : ℝ := coeffNorm p
  let S : ℝ → ℝ := pev (taylor c h n)
  have hcS : Continuous S := continuous_pev _
  have hcP : Continuous (pev p) := continuous_pev _
  have hcF : Continuous (fun t => pev p t * exp (pev (localExp c h) t)) := by
    exact hcP.mul (Real.continuous_exp.comp (continuous_pev _))
  have hpt : ∀ t ∈ Icc (-1 : ℝ) 1,
      |pev p t * exp (pev (localExp c h) t) - pev p t * S t| ≤ A * E := by
    intro t ht
    have hu := localExp_abs_le hc hh t ht
    have hb := Real.exp_bound (hu.trans (by exact_mod_cast hU)) hn
    have hE : |exp (pev (localExp c h) t) - S t| ≤ E := by
      rw [show S t = ∑ k ∈ range n, pev (localExp c h) t ^ k / k.factorial by
        exact (pev_expPoly _ t n).1]
      refine hb.trans ?_
      unfold E expRem
      push_cast
      exact mul_le_mul_of_nonneg_right (pow_le_pow_left₀ (abs_nonneg _) hu n) (by positivity)
    have hp := abs_pev_le_coeffNorm p t (abs_le.mpr ⟨by linarith [ht.1], ht.2⟩)
    rw [← mul_sub, abs_mul]
    have hA : 0 ≤ A := by
      dsimp only [A]
      exact_mod_cast coeffNorm_nonneg p
    exact mul_le_mul hp hE (abs_nonneg _) hA
  have hJ : (∫ t in (-1 : ℝ)..1, pev p t * S t) = (integralTaylor p c h n : ℝ) := by
    simpa only [integralTaylor, S, ← pev_pmul, pow_zero, one_mul,
      Rat.cast_neg, Rat.cast_one] using
      integral_pev (-1) 1 (pmul p (taylor c h n)) 0
  have hlow : (∫ t in (-1 : ℝ)..1, pev p t * S t - A * E) ≤
      ∫ t in (-1 : ℝ)..1, pev p t * exp (pev (localExp c h) t) := by
    apply intervalIntegral.integral_mono_on (by norm_num)
      (((hcP.mul hcS).sub continuous_const).intervalIntegrable _ _)
      (hcF.intervalIntegrable _ _)
    intro t ht
    change pev p t * S t - A * E ≤ pev p t * exp (pev (localExp c h) t)
    have hh := (abs_le.mp (hpt t ht)).1
    linarith
  have hhigh : (∫ t in (-1 : ℝ)..1, pev p t * exp (pev (localExp c h) t)) ≤
      ∫ t in (-1 : ℝ)..1, pev p t * S t + A * E := by
    apply intervalIntegral.integral_mono_on (by norm_num)
      (hcF.intervalIntegrable _ _)
      (((hcP.mul hcS).add continuous_const).intervalIntegrable _ _)
    intro t ht
    change pev p t * exp (pev (localExp c h) t) ≤ pev p t * S t + A * E
    have hh := (abs_le.mp (hpt t ht)).2
    linarith
  have hlow' : (integralTaylor p c h n : ℝ) - 2 * A * E ≤
      ∫ t in (-1 : ℝ)..1, pev p t * exp (pev (localExp c h) t) := by
    have he : (∫ t in (-1 : ℝ)..1, pev p t * S t - A * E) =
        (integralTaylor p c h n : ℝ) - 2 * A * E := by
      rw [intervalIntegral.integral_sub ((hcP.mul hcS).intervalIntegrable (-1) 1)
        intervalIntegrable_const, hJ, intervalIntegral.integral_const]
      simp only [smul_eq_mul]
      ring
    rwa [he] at hlow
  have hhigh' : (∫ t in (-1 : ℝ)..1, pev p t * exp (pev (localExp c h) t)) ≤
      (integralTaylor p c h n : ℝ) + 2 * A * E := by
    have he : (∫ t in (-1 : ℝ)..1, pev p t * S t + A * E) =
        (integralTaylor p c h n : ℝ) + 2 * A * E := by
      rw [intervalIntegral.integral_add ((hcP.mul hcS).intervalIntegrable (-1) 1)
        intervalIntegrable_const, hJ, intervalIntegral.integral_const]
      simp only [smul_eq_mul]
      ring
    rwa [he] at hhigh
  constructor
  · simpa only [error, Rat.cast_sub, Rat.cast_mul, Rat.cast_ofNat, A, E] using hlow'
  · simpa only [error, Rat.cast_add, Rat.cast_mul, Rat.cast_ofNat, A, E] using hhigh'

/-- The local polynomial integral enclosed by Taylor, multiplied by the
nonnegative Gaussian center factor. The signs of the integral bounds matter:
the coefficient interval used for multiplication must switch at zero. -/
def panelBounds (p : List ℚ) (c h : ℚ) (n : ℕ) : ℚ × ℚ :=
  let X := expNegEnc (c ^ 2)
  let lo := integralTaylor p c h n - error p c h n
  let hi := integralTaylor p c h n + error p c h n
  (if 0 ≤ lo then X.1 * lo else X.2 * lo,
    if 0 ≤ hi then X.2 * hi else X.1 * hi)

theorem panelBounds_sound (p : List ℚ) {c h : ℚ} (hc : 0 ≤ c) (hh : 0 ≤ h)
    (hc8 : c ≤ 8) (hU : variation c h ≤ 1) (n : ℕ) (hn : 0 < n) :
    ((panelBounds p c h n).1 : ℝ) ≤
      exp (-(c : ℝ) ^ 2) * (∫ t in (-1 : ℝ)..1,
        pev p t * exp (pev (localExp c h) t)) ∧
    exp (-(c : ℝ) ^ 2) * (∫ t in (-1 : ℝ)..1,
        pev p t * exp (pev (localExp c h) t)) ≤ ((panelBounds p c h n).2 : ℝ) := by
  have hcc : c ^ 2 ≤ (1024 : ℚ) := by
    nlinarith [mul_nonneg hc (sub_nonneg.mpr hc8)]
  have hX := expNegEnc_sound (x := c ^ 2) (sq_nonneg c) hcc
  have he : exp (-((c ^ 2 : ℚ) : ℝ)) = exp (-(c : ℝ) ^ 2) := by push_cast; rfl
  rw [he] at hX
  have hlocal := local_integral_enclosure p hc hh hU n hn
  constructor
  · simpa only [panelBounds] using scale_lo hX.1 hX.2.1 hX.2.2 hlocal.1
  · simpa only [panelBounds] using scale_hi hX.1 hX.2.1 hX.2.2 hlocal.2

/-- A caller supplies the polynomial integrand on a panel. The polynomial
already includes the Jacobian `h`; outside the panel, `f` is arbitrary.
Only equality on the open interval is required, so adjacent piecewise
polynomials may disagree at their shared endpoints. -/
theorem gaussian_integral_panel {f : ℝ → ℝ} (p : List ℚ) {c h : ℚ}
    (hc : 0 ≤ c) (hh : 0 < h) (hc8 : c ≤ 8) (hU : variation c h ≤ 1)
    (n : ℕ) (hn : 0 < n)
    (hf : ∀ t ∈ Ioo ((c - h : ℚ) : ℝ) ((c + h : ℚ) : ℝ),
      f t = (h : ℝ)⁻¹ * pev p ((t - (c : ℝ)) / h) * exp (-t ^ 2)) :
    ((panelBounds p c h n).1 : ℝ) ≤
      (∫ t in ((c - h : ℚ) : ℝ)..((c + h : ℚ) : ℝ), f t) ∧
    (∫ t in ((c - h : ℚ) : ℝ)..((c + h : ℚ) : ℝ), f t) ≤
      ((panelBounds p c h n).2 : ℝ) := by
  have hhR : (0 : ℝ) < h := by exact_mod_cast hh
  let F : ℝ → ℝ := fun t => (h : ℝ)⁻¹ * pev p ((t - (c : ℝ)) / h) * exp (-t ^ 2)
  have hab : ((c - h : ℚ) : ℝ) ≤ ((c + h : ℚ) : ℝ) := by push_cast; linarith
  have hcongr : (∫ t in ((c - h : ℚ) : ℝ)..((c + h : ℚ) : ℝ), f t) =
      ∫ t in ((c - h : ℚ) : ℝ)..((c + h : ℚ) : ℝ), F t :=
    intervalIntegral.integral_congr_Ioo_of_le hab (fun t ht => hf t ht)
  have hchange := intervalIntegral.smul_integral_comp_add_mul F (h : ℝ) (c : ℝ)
    (a := (-1 : ℝ)) (b := (1 : ℝ))
  have hpanel : (∫ t in ((c - h : ℚ) : ℝ)..((c + h : ℚ) : ℝ), F t) =
      (h : ℝ) * ∫ t in (-1 : ℝ)..1, F ((c : ℝ) + (h : ℝ) * t) := by
    push_cast
    simpa only [smul_eq_mul, mul_one, mul_neg, sub_eq_add_neg] using hchange.symm
  have hlocal : (h : ℝ) * ∫ t in (-1 : ℝ)..1, F ((c : ℝ) + (h : ℝ) * t) =
      exp (-(c : ℝ) ^ 2) * ∫ t in (-1 : ℝ)..1,
        pev p t * exp (pev (localExp c h) t) := by
    rw [← intervalIntegral.integral_const_mul, ← intervalIntegral.integral_const_mul]
    apply intervalIntegral.integral_congr
    intro t _ht
    dsimp only [F]
    rw [localExp_eval]
    have hcoord : (((c : ℝ) + (h : ℝ) * t) - c) / h = t := by
      apply (div_eq_iff hhR.ne').2
      ring
    rw [hcoord, show -((c : ℝ) + (h : ℝ) * t) ^ 2 =
      -(c : ℝ) ^ 2 + (-2 * (c : ℝ) * (h : ℝ) * t - (h : ℝ) ^ 2 * t ^ 2) by ring,
      Real.exp_add]
    field_simp [hhR.ne']
  rw [hcongr, hpanel, hlocal]
  exact panelBounds_sound p hc hh.le hc8 hU n hn

def panelCenter (edges : ℕ → ℚ) (i : ℕ) : ℚ := (edges i + edges (i + 1)) / 2
def panelRadius (edges : ℕ → ℚ) (i : ℕ) : ℚ := (edges (i + 1) - edges i) / 2

/-- A cell agreeing with a continuous polynomial--Gaussian expression on its
interior is interval integrable; no continuity across shared endpoints is
needed. -/
theorem intervalIntegrable_of_cell {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b)
    (p : List ℚ) (c h : ℝ)
    (hpiece : ∀ t ∈ Ioo a b, f t = h⁻¹ * pev p ((t - c) / h) * exp (-t ^ 2)) :
    IntervalIntegrable f volume a b := by
  let g : ℝ → ℝ := fun t => h⁻¹ * pev p ((t - c) / h) * exp (-t ^ 2)
  have hs : Continuous (fun t : ℝ => (t - c) / h) := by fun_prop
  have hp := (continuous_pev p).comp hs
  have he : Continuous (fun t : ℝ => exp (-t ^ 2)) := by fun_prop
  have hg : Continuous g := (continuous_const.mul hp).mul he
  apply (hg.intervalIntegrable a b).congr_uIoo
  intro t ht
  have ht' : t ∈ Ioo a b := by simpa only [uIoo_of_le hab] using ht
  exact (hpiece t ht').symm

/-- Contiguous signed polynomial cells give one exact interval for their
combined Gaussian integral. The hypotheses expose only the actual local
polynomial identities and ordinary interval integrability. -/
theorem gaussian_integral_partition {f : ℝ → ℝ} (edges : ℕ → ℚ)
    (polys : ℕ → List ℚ) (N order : ℕ) (horder : 0 < order)
    (hfirst : 0 ≤ edges 0)
    (hstep : ∀ i < N, edges i < edges (i + 1))
    (hlast : edges N ≤ 8)
    (hvar : ∀ i < N, variation (panelCenter edges i) (panelRadius edges i) ≤ 1)
    (hpiece : ∀ i < N, ∀ t ∈ Ioo (edges i : ℝ) (edges (i + 1) : ℝ),
      f t = (panelRadius edges i : ℝ)⁻¹ *
        pev (polys i) ((t - (panelCenter edges i : ℝ)) / (panelRadius edges i : ℝ)) *
        exp (-t ^ 2)) :
    ((∑ i ∈ range N, (panelBounds (polys i) (panelCenter edges i)
      (panelRadius edges i) order).1 : ℚ) : ℝ) ≤
      (∫ t in (edges 0 : ℝ)..(edges N : ℝ), f t) ∧
    (∫ t in (edges 0 : ℝ)..(edges N : ℝ), f t) ≤
      ((∑ i ∈ range N, (panelBounds (polys i) (panelCenter edges i)
        (panelRadius edges i) order).2 : ℚ) : ℝ) := by
  have hintegrable (i : ℕ) (hi : i < N) :
      IntervalIntegrable f volume (edges i) (edges (i + 1)) := by
    apply intervalIntegrable_of_cell (by exact_mod_cast (hstep i hi).le)
      (polys i) (panelCenter edges i) (panelRadius edges i)
    exact hpiece i hi
  have hmono : MonotoneOn edges (Set.Iic N) := by
    apply monotoneOn_of_le_add_one Set.ordConnected_Iic
    intro i _hi _hmember hnext
    exact (hstep i (by simp only [Set.mem_Iic] at hnext; omega)).le
  have hedge (i : ℕ) (hi : i < N) : 0 ≤ edges i ∧ edges (i + 1) ≤ 8 := by
    constructor
    · exact hfirst.trans (hmono (show 0 ∈ Set.Iic N from Nat.zero_le N)
        (show i ∈ Set.Iic N from Nat.le_of_lt hi) (Nat.zero_le i))
    · exact (hmono (show i + 1 ∈ Set.Iic N from by omega)
        (show N ∈ Set.Iic N from le_rfl) (by omega)).trans hlast
  have hcell (i : ℕ) (hi : i < N) :
      (((panelBounds (polys i) (panelCenter edges i) (panelRadius edges i) order).1 : ℚ) : ℝ) ≤
        (∫ t in (edges i : ℝ)..(edges (i + 1) : ℝ), f t) ∧
      (∫ t in (edges i : ℝ)..(edges (i + 1) : ℝ), f t) ≤
        (((panelBounds (polys i) (panelCenter edges i) (panelRadius edges i) order).2 : ℚ) : ℝ) := by
    have he := hedge i hi
    have hc : 0 ≤ panelCenter edges i := by
      unfold panelCenter
      linarith [hstep i hi]
    have hh : 0 < panelRadius edges i := by
      unfold panelRadius
      linarith [hstep i hi]
    have hc8 : panelCenter edges i ≤ 8 := by
      unfold panelCenter
      linarith [hstep i hi]
    have hleft : panelCenter edges i - panelRadius edges i = edges i := by
      unfold panelCenter panelRadius
      ring
    have hright : panelCenter edges i + panelRadius edges i = edges (i + 1) := by
      unfold panelCenter panelRadius
      ring
    have hp := gaussian_integral_panel (polys i) hc hh hc8 (hvar i hi) order horder
      (by simpa only [hleft, hright] using hpiece i hi)
    simpa only [hleft, hright] using hp
  have hlo : (∑ i ∈ range N, (((panelBounds (polys i) (panelCenter edges i)
      (panelRadius edges i) order).1 : ℚ) : ℝ)) ≤
      ∑ i ∈ range N, ∫ t in (edges i : ℝ)..(edges (i + 1) : ℝ), f t :=
    sum_le_sum fun i hi => (hcell i (mem_range.mp hi)).1
  have hhi : (∑ i ∈ range N, ∫ t in (edges i : ℝ)..(edges (i + 1) : ℝ), f t) ≤
      ∑ i ∈ range N, (((panelBounds (polys i) (panelCenter edges i)
        (panelRadius edges i) order).2 : ℚ) : ℝ) :=
    sum_le_sum fun i hi => (hcell i (mem_range.mp hi)).2
  have hsum := intervalIntegral.sum_integral_adjacent_intervals hintegrable
  rw [hsum] at hlo hhi
  constructor
  · simpa only [Rat.cast_sum] using hlo
  · simpa only [Rat.cast_sum] using hhi

/-- The actual piecewise polynomial is identically zero beyond its proved
radius-eight cover. -/
theorem signedApproxIntegrand_zero_above (test : CList) (re im : List ℚ)
    {ps : List Panel} (hc : covers 0 8 ps = true) {t : ℝ} (ht : 8 < t) :
    signedApproxIntegrand test re im ps t = 0 := by
  rw [signedApproxIntegrand, approxList_zero_of_gt re im ps hc t (by simpa using ht)]
  simp

/-- Exact signed-moment bridge for the finite witness. Each subcell is
contained in an accepted phase panel, the cells partition `[0,8]`, and the
Gaussian tail of the approximant vanishes. All inputs are rational lists;
the statement does not assert that any numerical check has passed. -/
theorem signedApprox_integral_partition (test : CList) (re im : List ℚ)
    {ps : List Panel} (hc : covers 0 8 ps = true)
    (edges : ℕ → ℚ) (parent : ℕ → Panel) (N order : ℕ) (horder : 0 < order)
    (hfirst : edges 0 = 0) (hlast : edges N = 8)
    (hstep : ∀ i < N, edges i < edges (i + 1))
    (hparent : ∀ i < N, parent i ∈ ps ∧ (parent i).a ≤ edges i ∧
      edges (i + 1) ≤ (parent i).b)
    (hvar : ∀ i < N, variation (panelCenter edges i) (panelRadius edges i) ≤ 1) :
    let polys := fun i => signedCellPolynomial test re im (parent i)
      (panelCenter edges i) (panelRadius edges i)
    ((∑ i ∈ range N, (panelBounds (polys i) (panelCenter edges i)
      (panelRadius edges i) order).1 : ℚ) : ℝ) ≤
      (∫ t in Ioi (0 : ℝ), signedApproxIntegrand test re im ps t) ∧
    (∫ t in Ioi (0 : ℝ), signedApproxIntegrand test re im ps t) ≤
      ((∑ i ∈ range N, (panelBounds (polys i) (panelCenter edges i)
        (panelRadius edges i) order).2 : ℚ) : ℝ) := by
  dsimp only
  let f := signedApproxIntegrand test re im ps
  let polys := fun i => signedCellPolynomial test re im (parent i)
    (panelCenter edges i) (panelRadius edges i)
  have hpiece (i : ℕ) (hi : i < N) :
      ∀ t ∈ Ioo (edges i : ℝ) (edges (i + 1) : ℝ),
        f t = (panelRadius edges i : ℝ)⁻¹ *
          pev (polys i) ((t - (panelCenter edges i : ℝ)) / (panelRadius edges i : ℝ)) *
          exp (-t ^ 2) := by
    intro t ht
    have hh : 0 < panelRadius edges i := by unfold panelRadius; linarith [hstep i hi]
    have hleft : panelCenter edges i - panelRadius edges i = edges i := by
      unfold panelCenter panelRadius; ring
    have hright : panelCenter edges i + panelRadius edges i = edges (i + 1) := by
      unfold panelCenter panelRadius; ring
    obtain ⟨hp, ha, hb⟩ := hparent i hi
    have ha' : (parent i).a ≤ panelCenter edges i - panelRadius edges i := by
      simpa only [hleft] using ha
    have hb' : panelCenter edges i + panelRadius edges i ≤ (parent i).b := by
      simpa only [hright] using hb
    exact signedApproxIntegrand_on_subpanel test re im hc hp hh ha' hb'
      (by simpa only [hleft, hright] using ht)
  have hinterval (i : ℕ) (hi : i < N) :
      IntervalIntegrable f volume (edges i) (edges (i + 1)) := by
    apply intervalIntegrable_of_cell (by exact_mod_cast (hstep i hi).le)
      (polys i) (panelCenter edges i) (panelRadius edges i)
    exact hpiece i hi
  have hint : IntervalIntegrable f volume 0 8 := by
    have hh := IntervalIntegrable.trans_iterate hinterval
    simpa only [hfirst, hlast, Rat.cast_zero, Rat.cast_ofNat] using hh
  have hzero : ∀ t ∈ Ioi (8 : ℝ), f t = 0 := fun t ht =>
    signedApproxIntegrand_zero_above test re im hc ht
  have htail : IntegrableOn f (Ioi (8 : ℝ)) volume := by
    have hz : IntegrableOn (fun _ : ℝ => (0 : ℝ)) (Ioi (8 : ℝ)) volume :=
      integrableOn_zero
    refine hz.congr_fun ?_ measurableSet_Ioi
    intro t ht
    exact (hzero t ht).symm
  have htailzero : (∫ t in Ioi (8 : ℝ), f t) = 0 :=
    setIntegral_eq_zero_of_forall_eq_zero hzero
  have hsplit := intervalIntegral.integral_interval_add_Ioi' hint htail
  have heq : (∫ t in (0 : ℝ)..8, f t) = ∫ t in Ioi (0 : ℝ), f t := by
    simpa only [htailzero, add_zero] using hsplit
  have hbound := gaussian_integral_partition edges polys N order horder
    (by simpa only [hfirst] using (show (0 : ℚ) ≤ 0 by norm_num))
    hstep (by simpa only [hlast] using (show (8 : ℚ) ≤ 8 by norm_num)) hvar hpiece
  simpa only [hfirst, hlast, Rat.cast_zero, Rat.cast_ofNat, heq, f, polys] using hbound

end Grothe.HJM.OriginMoment
