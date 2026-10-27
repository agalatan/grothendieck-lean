import Grothe.HJM.OriginPanelAlgebra
import Grothe.UpperChaos.HardyArcSound

/-!
# Exact interval ranges of the actual origin numerators

Agent-ID: codex-aa04. These generic enclosure lemmas
bind exact rational Horner inputs to the two existing origin numerators. They
contain no numerical energy claim and do not assert that these simple Horner
ranges are sufficiently sharp for the eventual integral certificate.
-/

namespace Grothe.HJM.OriginEnergyPolynomialRange

open GrotheKernel Grothe.Upper Grothe.UpperChaos.HardyArcSound
open Grothe.HJM.OriginPanel

/-- Interval Horner for ascending coefficient lists. -/
def hornerI : List Ival → Ival → Ival
  | [], _ => zeroI
  | a :: p, x => addI a (mulI x (hornerI p x))

/-- Complex interval Horner for a pair of real coefficient lists. -/
def hornerCI (p : CList) (x : Ival) : GrotheKernel.HardyArc.CI :=
  ⟨hornerI (p.re.map ofRatI) x, hornerI (p.im.map ofRatI) x⟩

/-- Interval square with the valid lower endpoint clipped to zero. -/
def squareI (a : Ival) : Ival :=
  let q := mulI a a
  ⟨max 0 q.lo, q.hi⟩

def normSqI (z : GrotheKernel.HardyArc.CI) : Ival :=
  addI (squareI z.re) (squareI z.im)

/-- Every exact rational coefficient is contained in its rounded interval. -/
theorem rational_coeffs_mem (p : List ℚ) :
    List.Forall₂ (fun (a : ℚ) i => mem (a : ℝ) i) p (p.map ofRatI) := by
  induction p with
  | nil => exact List.Forall₂.nil
  | cons a p ih => exact List.Forall₂.cons (mem_ofRatI a) ih

/-- Interval Horner encloses the corresponding exact rational polynomial. -/
theorem mem_hornerI {s : ℝ} {x : Ival} (hs : mem s x) :
    ∀ {p : List ℚ} {is : List Ival},
      List.Forall₂ (fun (a : ℚ) i => mem (a : ℝ) i) p is →
      mem (evalQ p s) (hornerI is x)
  | [], [], _ => by simpa [hornerI, evalQ_nil] using mem_zero
  | _ :: _, _ :: _, List.Forall₂.cons ha hp => by
      simpa [hornerI, evalQ_cons] using mem_add ha (mem_mul hs (mem_hornerI hs hp))

theorem mem_evalC_hornerCI (p : CList) {s : ℝ} {x : Ival} (hs : mem s x) :
    memC (evalC p s) (hornerCI p x) := by
  constructor
  · simpa [hornerCI, evalC, Complex.add_re, Complex.mul_re] using
      mem_hornerI hs (rational_coeffs_mem p.re)
  · simpa [hornerCI, evalC, Complex.add_im, Complex.mul_im] using
      mem_hornerI hs (rational_coeffs_mem p.im)

/-- Any complex interval range is also a range for its exact squared modulus. -/
theorem mem_squareI {v : ℝ} {a : Ival} (hv : mem v a) :
    mem (v ^ 2) (squareI a) := by
  have hm : mem (v ^ 2) (mulI a a) := by
    simpa [pow_two] using mem_mul hv hv
  constructor
  · change ((max 0 (mulI a a).lo : ℤ) : ℝ) ≤ v ^ 2 * D
    rw [Int.cast_max, Int.cast_zero]
    exact max_le (mul_nonneg (sq_nonneg v) D_pos.le) hm.1
  · exact hm.2

theorem mem_normSqI {z : ℂ} {Z : GrotheKernel.HardyArc.CI}
    (hz : memC z Z) : mem (Complex.normSq z) (normSqI Z) := by
  simpa [normSqI, Complex.normSq_apply] using
    mem_add (mem_squareI hz.1) (mem_squareI hz.2)

def left : CList := ⟨OriginData.leftReal, OriginData.leftImag⟩
def right : CList := ⟨OriginData.rightReal, OriginData.rightImag⟩

/-- The inputs are the actual asymmetric response numerators, not a surrogate. -/
theorem mem_leftNumerator {s : ℝ} {x : Ival} (hs : mem s x) :
    memC (Origin.leftNumerator s) (hornerCI left x) := by
  simpa only [left, evalC_left] using mem_evalC_hornerCI left hs

theorem mem_rightNumerator {s : ℝ} {x : Ival} (hs : mem s x) :
    memC (Origin.rightNumerator s) (hornerCI right x) := by
  simpa only [right, evalC_right] using mem_evalC_hornerCI right hs

theorem mem_leftNormSq {s : ℝ} {x : Ival} (hs : mem s x) :
    mem (Complex.normSq (Origin.leftNumerator s)) (normSqI (hornerCI left x)) :=
  mem_normSqI (mem_leftNumerator hs)

theorem mem_rightNormSq {s : ℝ} {x : Ival} (hs : mem s x) :
    mem (Complex.normSq (Origin.rightNumerator s)) (normSqI (hornerCI right x)) :=
  mem_normSqI (mem_rightNumerator hs)

end Grothe.HJM.OriginEnergyPolynomialRange
