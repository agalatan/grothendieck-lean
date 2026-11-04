import Grothe.UpperQuad.IntervalSound
import GrotheQuadKernel.Seed
import Grothe.UpperChaos.OriginalMomentRatios

/-!
# Soundness of the moment-ratio recurrence (obligation S3 of #303)

The kernel's `ratiosI P xI H` runs `r_h = (h+½)/(h+2+x−x·r_{h+1})` backwards from `r_H ∈ [0, 1]`
in interval arithmetic.  Master proves `ratio h x = PositiveRatio.next h x (ratio (h+1) x)`
(`OriginalPositiveMoment.ratio_eq_next`) and `ratio h x ∈ (0, 1]` (`ratio_mem_unit`), so every
`ratio h x` lies in the `h`-th interval.

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos

lemma mem_ratioNextI (P : ℕ) (hP : 1 ≤ P) (h : ℕ) {x r : ℝ} {xI rI : Ival} (hx : mem x xI)
    (hr : mem r rI) (hden : isPos (ratioDen P h xI rI) = true) :
    mem (PositiveRatio.next h x r) (ratioNextI P h xI rI) := by
  unfold ratioNextI ratioDen PositiveRatio.next PositiveRatio.denominator
  have hnum : mem ((h : ℝ) + 1 / 2) (divN P 2 (ofNat P (2 * h + 1))) := by
    have := mem_divN P hP (by norm_num : 0 < 2) (mem_ofNat P (2 * h + 1))
    convert this using 1
    push_cast
    ring
  have hd : mem ((h : ℝ) + 2 + x - x * r)
      (addI P (ofNat P (h + 2)) (mulI P xI (subI P (ofInt P 1) rI))) := by
    have := mem_addI P (mem_ofNat P (h + 2)) (mem_mulI P hx (mem_subI P (mem_one P) hr))
    convert this using 1
    push_cast
    ring
  exact mem_divI P hnum hd (lo_pos_of_isPos hden)

/-- The unrolled loop of `ratiosI`: the list `[r_0, …, r_{H-1}]` built from the terminal `unit`. -/
lemma ratios_loop_sound (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : 0 ≤ x) (hxI : mem x xI) :
    ∀ (H : ℕ) (r : Ival) (acc : List Ival), ratioLoopOK P xI H r = true →
      mem (OriginalPositiveMoment.ratio H x) r →
      (∀ j, j < acc.length → mem (OriginalPositiveMoment.ratio (H + j) x) (acc.getD j zeroI)) →
      ∀ j, j < (ratioLoop P xI H r acc).length →
        mem (OriginalPositiveMoment.ratio j x) ((ratioLoop P xI H r acc).getD j zeroI) := by
  intro H
  induction H with
  | zero =>
    intro r acc _ hr hacc j hj
    simp only [ratioLoop] at hj ⊢
    simpa using hacc j hj
  | succ H ih =>
    intro r acc hok hr hacc
    simp only [ratioLoopOK, Bool.and_eq_true] at hok
    have hr' : mem (OriginalPositiveMoment.ratio H x) (ratioNextI P H xI r) := by
      rw [OriginalPositiveMoment.ratio_eq_next H hx]
      exact mem_ratioNextI P hP H hxI hr hok.1
    apply ih (ratioNextI P H xI r) (ratioNextI P H xI r :: acc) hok.2 hr'
    intro j hj
    cases j with
    | zero => simpa using hr'
    | succ j =>
      simp only [List.getD_cons_succ]
      have := hacc j (by simpa using hj)
      simpa [show H + (j + 1) = H + 1 + j by ring] using this

/-- Every computed ratio encloses the actual moment ratio. -/
lemma mem_ratiosI (P : ℕ) (hP : 1 ≤ P) {x : ℝ} {xI : Ival} (hx : 0 ≤ x) (hxI : mem x xI) (H : ℕ)
    (hv : ratiosValid P xI H = true) (j : ℕ) (hj : j < (ratiosI P xI H).size) :
    mem (OriginalPositiveMoment.ratio j x) ((ratiosI P xI H).getD j zeroI) := by
  have hunit : mem (OriginalPositiveMoment.ratio H x) ⟨0, 1, 0⟩ := by
    obtain ⟨h0, h1⟩ := OriginalPositiveMoment.ratio_mem_unit H x
    constructor
    · simp; exact h0.le
    · simpa using h1
  have := ratios_loop_sound P hP hx hxI H ⟨0, 1, 0⟩ [] hv hunit (by simp) j
    (by simpa [ratiosI] using hj)
  simpa [ratiosI, Array.getD_eq_getD_getElem?, List.getD_eq_getElem?_getD, List.getElem?_toArray] using this

end Grothe.UpperQuad
