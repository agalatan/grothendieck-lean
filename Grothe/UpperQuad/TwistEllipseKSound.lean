import Grothe.UpperQuad.TwistEllipsePhaseSound
import Grothe.UpperQuad.TwistEllipseColumnSound
import Grothe.UpperQuad.TwistEllipseMajorantSound

/-!
# Arithmetic soundness of the coarse twisted K expression

The coefficient polynomial uses every degree through the production cutoff. Its interval
Horner evaluation encloses the exact finite sum when every coefficient has the proved column
interpretation. A successful K evaluation checks its square-root and division domains and
encloses a dominating witness for the explicit coarse K expression.

This file proves arithmetic soundness only. The Gaussian column bound, canonical coefficient
estimate, and comparison with the actual twisted conditional vector are separate analytic
obligations.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- The exact finite coefficient polynomial through degree `D + 35j`. -/
noncomputable def coarseKPoly (g : Power) (z : ℝ) : ℝ :=
  ∑ m ∈ Finset.range (totalDegree g + 1), columnCoeff g m * z ^ m

/-- Every term of the coefficient polynomial is nonnegative at a nonnegative argument. -/
theorem coarseKPoly_nonneg (g : Power) {z : ℝ} (hz : 0 ≤ z) : 0 ≤ coarseKPoly g z := by
  unfold coarseKPoly
  exact Finset.sum_nonneg fun m _ ↦
    mul_nonneg (columnCoeff_nonneg g m) (pow_nonneg hz m)

/-- Horner evaluation encloses the exact polynomial when the list has the production length
and each of its entries encloses the corresponding column coefficient. -/
theorem mem_horner_columnCoeffs {g : Power} {cs : List Ival} {z : ℝ} {zi : Ival}
    (hlen : cs.length = totalDegree g + 1)
    (hcoeff : ∀ m, m < totalDegree g + 1 →
      mem (columnCoeff g m) (cs.getD m zeroI))
    (hz : mem z zi) : mem (coarseKPoly g z) (EllCheck.horner cs zi) := by
  let G := (List.range (totalDegree g + 1)).map (columnCoeff g)
  have hGlen : G.length = totalDegree g + 1 := by simp [G]
  have hGget : ∀ m, m < totalDegree g + 1 → G.getD m 0 = columnCoeff g m := by
    intro m hm
    dsimp only [G]
    rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hm]
    simp only [Option.map_some, Option.getD_some]
  have hh := EllCheck.mem_horner hz cs G (hlen.trans hGlen.symm) (by
    intro m hm
    have hm' : m < totalDegree g + 1 := by omega
    rw [hGget m hm']
    exact hcoeff m hm')
  have hsum : (∑ m ∈ Finset.range G.length, G.getD m 0 * z ^ m) = coarseKPoly g z := by
    unfold coarseKPoly
    rw [hGlen]
    apply Finset.sum_congr rfl
    intro m hm
    rw [hGget m (Finset.mem_range.mp hm)]
  rwa [hsum] at hh

/-- The coarse K expression squared. The shift scaling occurs in `8 (θ²/Alo) / λ`;
the column coefficients also depend on `λ`, with no additional reciprocal-rate prefactor. -/
noncomputable def coarseKSq (g : Power) (eta Y theta Alo : ℝ) : ℝ :=
  4 * phaseSq g eta Y * theta *
    (coarseKPoly g (Real.sqrt (8 * (theta ^ 2 / Alo) / (lambdaQ g : ℝ)))) ^ 2

/-- The explicit K expression is nonnegative for nonnegative phase and angle parameters. -/
theorem coarseKSq_nonneg (g : Power) {eta theta : ℝ} (heta : 0 ≤ eta)
    (htheta : 0 ≤ theta) (Y Alo : ℝ) : 0 ≤ coarseKSq g eta Y theta Alo := by
  have hp := phaseSq_nonneg g heta Y
  unfold coarseKSq
  positivity

/-- Successful K arithmetic with a proved coefficient list recovers every real domain
condition and encloses a dominating witness for `coarseKSq`. The executable length guard
binds the list to the full production degree range. -/
theorem upsKI_sound_of_coeffs {g : Power} {cs : List Ival} {eta : ℚ}
    {Y KP Alo : ℝ} {y2 ki ai u : Ival}
    (hcoeff : ∀ m, m < totalDegree g + 1 →
      mem (columnCoeff g m) (cs.getD m zeroI))
    (hY : mem Y y2) (hKP : mem KP ki) (hA : mem Alo ai)
    (h : upsKI g cs eta y2 ki ai = some u) :
    0 < 1 - KP ^ 2 ∧ 0 < Alo ∧ 0 < (eta : ℝ) ∧ (eta : ℝ) < 1 ∧
      ∃ v, mem v u ∧ coarseKSq g eta Y (1 / Real.sqrt (1 - KP ^ 2)) Alo ≤ v := by
  unfold upsKI at h
  obtain ⟨hlen, h⟩ := EllCheck.guard'_bind h
  obtain ⟨hompos, h⟩ := EllCheck.guard'_bind h
  obtain ⟨hcpos, h⟩ := EllCheck.guard'_bind h
  have hlen' : cs.length = totalDegree g + 1 := by simpa only [beq_iff_eq] using hlen
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨q2, hq2, arg2, harg2, phase, hphase, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  have hom := mem_subI EllCheck.P (mem_one EllCheck.P) (mem_sqI EllCheck.P hKP)
  have hdom := pos_of_isPos hompos hom
  have hKPdom : 0 < 1 - KP ^ 2 := by simpa only [sq] using hdom
  have hc := mem_sqrtI EllCheck.P hdom.le hom
  let T : ℝ := 1 / Real.sqrt (1 - KP ^ 2)
  have hT : mem T (invI EllCheck.P
      (sqrtI EllCheck.P (subI EllCheck.P (ofInt EllCheck.P 1) (sqI EllCheck.P ki)))) := by
    simpa only [T, sq] using mem_invI EllCheck.P hc (lo_pos_of_isPos hcpos)
  obtain ⟨hqm, hApos⟩ := EllCheck.mem_dv (mem_sqI EllCheck.P hT) hA hq2
  have hqm' : mem (T ^ 2 / Alo) q2 := by simpa only [sq] using hqm
  obtain ⟨hargm, hlampos⟩ := EllCheck.mem_dv (mem_mulN EllCheck.P 8 hqm')
    (EllCheck.mem_qI (lambdaQ g)) harg2
  have harg0 : 0 ≤ 8 * (T ^ 2 / Alo) / (lambdaQ g : ℝ) := by positivity
  have hz := mem_sqrtI EllCheck.P harg0 hargm
  have hpoly := mem_horner_columnCoeffs hlen' hcoeff hz
  obtain ⟨heta0, heta1, V, hVm, hV⟩ := phaseSqI_sound hY hphase
  have hT0 : 0 ≤ T := by dsimp only [T]; positivity
  have hfactor : 0 ≤ T *
      (coarseKPoly g (Real.sqrt (8 * (T ^ 2 / Alo) / (lambdaQ g : ℝ)))) ^ 2 :=
    mul_nonneg hT0 (sq_nonneg _)
  have hmono := mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_right hV hfactor) (by norm_num : (0 : ℝ) ≤ 4)
  refine ⟨hKPdom, hApos, heta0, heta1, _,
    mem_mulN EllCheck.P 4 (mem_mulI EllCheck.P hVm
      (mem_mulI EllCheck.P hT (mem_sqI EllCheck.P hpoly))), ?_⟩
  change coarseKSq g eta Y T Alo ≤ _
  unfold coarseKSq
  convert hmono using 1 <;> ring

/-- The internally cached column list supplies every coefficient premise of K arithmetic
at the same production power and degree cutoff. -/
theorem upsKI_sound {g : Power} {cs : List Ival} {eta : ℚ}
    {Y KP Alo : ℝ} {y2 ki ai u : Ival}
    (hcs : columnCoeffs g = some cs)
    (hY : mem Y y2) (hKP : mem KP ki) (hA : mem Alo ai)
    (h : upsKI g cs eta y2 ki ai = some u) :
    0 < 1 - KP ^ 2 ∧ 0 < Alo ∧ 0 < (eta : ℝ) ∧ (eta : ℝ) < 1 ∧
      ∃ v, mem v u ∧ coarseKSq g eta Y (1 / Real.sqrt (1 - KP ^ 2)) Alo ≤ v := by
  obtain ⟨-, hcoeff⟩ := columnCoeffs_sound g hcs
  exact upsKI_sound_of_coeffs hcoeff hY hKP hA h

end Grothe.UpperQuad.TwistEllCheck
