import Grothe.HJM.OriginMomentEnclosure

/-!
# Signed radial phase-mean cell polynomial

Agent-ID codex-aa04. This defines the radial-mean
polynomial, with the 2t Jacobian; the prior witness integral uses 2t².
No complete numerical enclosure, Gaussian integral bridge or native fact is
claimed by this module.
-/

open MeasureTheory Set Real

namespace Grothe.HJM.OriginUnweightedMeanPolynomial

open Grothe.Lower Grothe.LowerAnalytic.CapTab
open Grothe.HJM.OriginPanel Grothe.HJM.OriginMoment

/-- Polynomial in normalized cell coordinate for one phase component,
including the local Jacobian 2h and physical radial factor t. -/
def meanCellPolynomial (part : List ℚ) (p : Panel) (c h : ℚ) : List ℚ :=
  let t := [c, h]
  let t2 := mulQ t t
  let w := compQ p.w (subpanelCoordinate p c h)
  let v := scaleL p.k (mulQ (compQ part t2) w)
  scaleL (2 * h) (mulQ t v)

/-- Exact interpretation of the generated polynomial. -/
theorem meanCellPolynomial_eval (part : List ℚ) (p : Panel) (c h : ℚ) (y : ℝ) :
    pev (meanCellPolynomial part p c h) y =
      2 * (h : ℝ) * ((c : ℝ) + (h : ℝ) * y) *
        ((p.k : ℝ) * evalQ p.w (coordinate p ((c : ℝ) + (h : ℝ) * y)) *
          evalQ part (((c : ℝ) + (h : ℝ) * y) ^ 2)) := by
  rw [← evalQ_eq_pev]
  simp only [meanCellPolynomial, evalQ_scale, evalQ_mul, evalQ_comp,
    evalQ_square, evalQ_subpanelCoordinate, evalQ_cons, evalQ_nil,
    Rat.cast_mul, Rat.cast_ofNat, mul_zero, add_zero]
  ring

noncomputable def meanRealIntegrand (re im : List ℚ) (ps : List Panel) (t : ℝ) : ℝ :=
  2 * t * exp (-t ^ 2) * (approxList re im ps t).re

noncomputable def meanImagIntegrand (re im : List ℚ) (ps : List Panel) (t : ℝ) : ℝ :=
  2 * t * exp (-t ^ 2) * (approxList re im ps t).im

theorem meanReal_on_subpanel (re im : List ℚ) {lo hi : ℚ} {ps : List Panel}
    (hc : covers lo hi ps = true) {p : Panel} (hp : p ∈ ps) {c h : ℚ} (hh : 0 < h)
    (ha : p.a ≤ c - h) (hb : c + h ≤ p.b) {t : ℝ}
    (ht : t ∈ Ioo ((c - h : ℚ) : ℝ) ((c + h : ℚ) : ℝ)) :
    meanRealIntegrand re im ps t = (h : ℝ)⁻¹ *
      pev (meanCellPolynomial re p c h) ((t - c) / h) * exp (-t ^ 2) := by
  have hhR : (0 : ℝ) < h := by exact_mod_cast hh
  have haR : (p.a : ℝ) ≤ (c - h : ℚ) := by exact_mod_cast ha
  have hbR : ((c + h : ℚ) : ℝ) ≤ p.b := by exact_mod_cast hb
  have hpopen : (p.a : ℝ) < t ∧ t < (p.b : ℝ) := ⟨haR.trans_lt ht.1, ht.2.trans_le hbR⟩
  have hselect := approxList_eq_on_open re im hc hp hpopen
  have hcoord : (c : ℝ) + (h : ℝ) * ((t - (c : ℝ)) / h) = t := by
    field_simp [hhR.ne']
    ring
  rw [meanRealIntegrand, hselect, meanCellPolynomial_eval, hcoord]
  simp only [panelApprox, evalC, Complex.mul_re, Complex.add_re, Complex.ofReal_re,
    Complex.ofReal_im, Complex.I_re, Complex.I_im, zero_mul, mul_zero, one_mul, sub_zero,
    zero_add, add_zero]
  field_simp [hhR.ne']
  ring

theorem meanImag_on_subpanel (re im : List ℚ) {lo hi : ℚ} {ps : List Panel}
    (hc : covers lo hi ps = true) {p : Panel} (hp : p ∈ ps) {c h : ℚ} (hh : 0 < h)
    (ha : p.a ≤ c - h) (hb : c + h ≤ p.b) {t : ℝ}
    (ht : t ∈ Ioo ((c - h : ℚ) : ℝ) ((c + h : ℚ) : ℝ)) :
    meanImagIntegrand re im ps t = (h : ℝ)⁻¹ *
      pev (meanCellPolynomial im p c h) ((t - c) / h) * exp (-t ^ 2) := by
  have hhR : (0 : ℝ) < h := by exact_mod_cast hh
  have haR : (p.a : ℝ) ≤ (c - h : ℚ) := by exact_mod_cast ha
  have hbR : ((c + h : ℚ) : ℝ) ≤ p.b := by exact_mod_cast hb
  have hpopen : (p.a : ℝ) < t ∧ t < (p.b : ℝ) := ⟨haR.trans_lt ht.1, ht.2.trans_le hbR⟩
  have hselect := approxList_eq_on_open re im hc hp hpopen
  have hcoord : (c : ℝ) + (h : ℝ) * ((t - (c : ℝ)) / h) = t := by
    field_simp [hhR.ne']
    ring
  rw [meanImagIntegrand, hselect, meanCellPolynomial_eval, hcoord]
  simp only [panelApprox, evalC, Complex.mul_im, Complex.add_im, Complex.ofReal_re,
    Complex.ofReal_im, Complex.I_re, Complex.I_im, zero_mul, mul_zero, one_mul, sub_zero,
    zero_add, add_zero]
  field_simp [hhR.ne']
  ring

end Grothe.HJM.OriginUnweightedMeanPolynomial
