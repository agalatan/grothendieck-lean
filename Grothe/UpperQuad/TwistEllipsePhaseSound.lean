import Grothe.UpperQuad.TwistEllipseCheck
import Grothe.UpperQuad.QuadEllipseDiskSound

/-!
# Arithmetic soundness of the twisted phase and translation expressions

This module proves that successful interval evaluations dominate the corresponding explicit
real expressions. An exponential evaluation supplies an enclosed dominating witness, rather
than membership of the exponential at every input in its argument interval.

These results do not identify the expressions with a bound for the production phase polynomial
or twisted conditional vector. Those analytic inequalities are separate obligations.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- The squared two-variable phase expression with natural inverse powers. -/
noncomputable def phaseSq (g : Power) (eta S : ℝ) : ℝ :=
  eta⁻¹ ^ phaseDegree g / (1 - eta) ^ 2 *
    Real.exp (4 * (powerNat g : ℝ) * (21 / 20 : ℝ) * S / (1 - eta))

/-- The phase expression is nonnegative for a nonnegative parameter. -/
theorem phaseSq_nonneg (g : Power) {eta : ℝ} (heta : 0 ≤ eta) (S : ℝ) :
    0 ≤ phaseSq g eta S := by
  unfold phaseSq
  positivity

/-- A successful phase evaluation recovers `0 < η < 1` and encloses an upper bound
of the explicit phase expression. The input `S` can be any enclosed real number. -/
theorem phaseSqI_sound {g : Power} {eta : ℚ} {S : ℝ} {s u : Ival}
    (hS : mem S s) (h : phaseSqI g eta s = some u) :
    0 < (eta : ℝ) ∧ (eta : ℝ) < 1 ∧
      ∃ v, mem v u ∧ phaseSq g eta S ≤ v := by
  unfold phaseSqI at h
  obtain ⟨hdom, h⟩ := EllCheck.guard'_bind h
  obtain ⟨hpos, h⟩ := EllCheck.guard'_bind h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hdom
  simp only [Bool.and_eq_true] at hpos
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨exponent, hexponent, ex, hex, pre, hpre, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  have heta0 : (0 : ℝ) < eta := by exact_mod_cast hdom.1
  have heta1 : (eta : ℝ) < 1 := by exact_mod_cast hdom.2
  have ht := EllCheck.mem_qI eta
  have hom := mem_subI EllCheck.P (mem_one EllCheck.P) ht
  have hc := EllCheck.mem_qI (4 * (powerNat g : ℚ) * (21 / 20 : ℚ))
  push_cast at hc
  obtain ⟨hem, -⟩ := EllCheck.mem_dv (mem_mulI EllCheck.P hc hS) hom hexponent
  obtain ⟨v, hvm, hv⟩ := EllCheck.expUp_sound hem hex
  have hinv := mem_invI EllCheck.P ht (lo_pos_of_isPos hpos.1)
  obtain ⟨hprem, -⟩ := EllCheck.mem_dv
    (EllCheck.mem_powB hinv (phaseDegree g)) (mem_sqI EllCheck.P hom) hpre
  refine ⟨heta0, heta1, _, mem_mulI EllCheck.P hprem hvm, ?_⟩
  unfold phaseSq
  rw [one_div, ← sq]
  exact mul_le_mul_of_nonneg_left hv (by positivity)

/-- The squared translation expression, with `B2` the imaginary-shift square bound. -/
noncomputable def upsYSq (g : Power) (eta Y B2 : ℝ) : ℝ :=
  phaseSq g eta (Y + B2) *
    Real.exp (2 * B2 + 2 * Real.sqrt (2 * (degree g : ℝ)) * Real.sqrt B2)

/-- A successful Y evaluation encloses an upper bound of the explicit translation
expression. Arithmetic soundness holds for all enclosed real inputs; geometry applications
supply nonnegative `Y` and `B2` separately. -/
theorem upsYI_sound {g : Power} {eta : ℚ} {Y B2 : ℝ} {y2 b2 u : Ival}
    (hY : mem Y y2) (hB2 : mem B2 b2) (h : upsYI g eta y2 b2 = some u) :
    0 < (eta : ℝ) ∧ (eta : ℝ) < 1 ∧
      ∃ v, mem v u ∧ upsYSq g eta Y B2 ≤ v := by
  unfold upsYI at h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨phase, hphase, shift, hshift, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  obtain ⟨heta0, heta1, V, hVm, hV⟩ := phaseSqI_sound
    (mem_addI EllCheck.P hY hB2) hphase
  have hD : mem (2 * (degree g : ℝ)) (ofNat EllCheck.P (2 * degree g)) := by
    simpa only [Nat.cast_mul, Nat.cast_ofNat] using mem_ofNat EllCheck.P (2 * degree g)
  have hcross := mem_mulI EllCheck.P
    (mem_sqrtI EllCheck.P (by positivity : 0 ≤ 2 * (degree g : ℝ)) hD)
    (mem_sqrtI EllCheck.P (bval_nonneg b2) (mem_absUpper b2))
  have he := mem_mulN EllCheck.P 2 (mem_addI EllCheck.P hB2 hcross)
  obtain ⟨W, hWm, hW⟩ := EllCheck.expUp_sound he hshift
  have hBval : B2 ≤ bval b2 := (le_abs_self B2).trans (abs_le_bval hB2)
  have hcross_le :
      Real.sqrt (2 * (degree g : ℝ)) * Real.sqrt B2 ≤
        Real.sqrt (2 * (degree g : ℝ)) * Real.sqrt (bval b2) :=
    mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt hBval) (Real.sqrt_nonneg _)
  have hE : Real.exp (2 * B2 + 2 * Real.sqrt (2 * (degree g : ℝ)) * Real.sqrt B2) ≤ W := by
    calc
      Real.exp (2 * B2 + 2 * Real.sqrt (2 * (degree g : ℝ)) * Real.sqrt B2)
          ≤ Real.exp (2 * (B2 + Real.sqrt (2 * (degree g : ℝ)) *
              Real.sqrt (bval b2))) :=
        Real.exp_le_exp.mpr (by nlinarith only [hcross_le])
      _ ≤ W := hW
  refine ⟨heta0, heta1, _, mem_mulI EllCheck.P hVm hWm, ?_⟩
  unfold upsYSq
  exact mul_le_mul hV hE (Real.exp_pos _).le
    ((phaseSq_nonneg g heta0.le (Y + B2)).trans hV)

end Grothe.UpperQuad.TwistEllCheck
