import Grothe.UpperQuad.TwistEllipseCheck
import Grothe.UpperQuad.QuadEllipseDiskSound

/-!
# Arithmetic soundness of the shift-angle and primary Mehler expressions

The shift-angle helper encloses its explicit rationalized expression and checks the domain of
its square root. The primary Mehler helper encloses a dominating witness for its explicit real
expression, using exactly the rational `sqrtReSqQ` and `sqrtImSqQ` values from the checker.

No theorem here identifies these quantities with bounds for the actual twisted integrand or
supplies the geometric inequalities required by that application.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad

/-- A successful shift-angle evaluation checks `1-KP² > 0` and encloses the
rationalized expression `Ahi KP² / (2(1+√(1-KP²)))`. -/
theorem shiftImSqI_sound {Ahi KP : ℝ} {ai ki u : Ival}
    (hA : mem Ahi ai) (hKP : mem KP ki) (h : shiftImSqI ai ki = some u) :
    0 < 1 - KP ^ 2 ∧
      mem (Ahi * KP ^ 2 / (2 * (1 + Real.sqrt (1 - KP ^ 2)))) u := by
  unfold shiftImSqI at h
  obtain ⟨hpos, h⟩ := EllCheck.guard'_bind h
  have hk2 := mem_sqI EllCheck.P hKP
  have hom := mem_subI EllCheck.P (mem_one EllCheck.P) hk2
  have hompos := pos_of_isPos hpos hom
  have hsqrt := mem_sqrtI EllCheck.P hompos.le hom
  have hden := mem_mulN EllCheck.P 2
    (mem_addI EllCheck.P (mem_one EllCheck.P) hsqrt)
  obtain ⟨hm, -⟩ := EllCheck.mem_dv (mem_mulI EllCheck.P hA hk2) hden h
  exact ⟨by simpa only [sq] using hompos, by simpa only [sq, Nat.cast_ofNat] using hm⟩

/-- The primary Mehler expression, with the production degree and natural inverse powers. -/
noncomputable def primarySq (g : Power) (tau X Y : ℝ) : ℝ :=
  tau⁻¹ ^ degree g / (1 - tau ^ 2) *
    Real.exp (2 * tau * X / (1 + tau) + 2 * tau * Y / (1 - tau))

/-- The primary expression is nonnegative on the closed parameter range. -/
theorem primarySq_nonneg (g : Power) {tau : ℝ} (ht0 : 0 ≤ tau) (ht1 : tau ≤ 1)
    (X Y : ℝ) : 0 ≤ primarySq g tau X Y := by
  have hden : 0 ≤ 1 - tau ^ 2 := by nlinarith
  unfold primarySq
  positivity

/-- A successful primary Mehler evaluation recovers `0 < τ < 1` and encloses an
upper bound of the expression at the checker's exact rational geometric inputs. -/
theorem mehI_sound {g : Power} {tau x R : ℚ} {u : Ival}
    (h : mehI g tau x R = some u) :
    0 < (tau : ℝ) ∧ (tau : ℝ) < 1 ∧
      ∃ v, mem v u ∧ primarySq g tau (sqrtReSqQ x R) (sqrtImSqQ x R) ≤ v := by
  unfold mehI at h
  obtain ⟨hdom, h⟩ := EllCheck.guard'_bind h
  obtain ⟨htp, h⟩ := EllCheck.guard'_bind h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hdom
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨e1, he1, e2, he2, ex, hex, pre, hpre, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  have ht0 : (0 : ℝ) < tau := by exact_mod_cast hdom.1
  have ht1 : (tau : ℝ) < 1 := by exact_mod_cast hdom.2
  have ht := EllCheck.mem_qI tau
  have hX := EllCheck.mem_qI (sqrtReSqQ x R)
  have hY := EllCheck.mem_qI (sqrtImSqQ x R)
  obtain ⟨he1m, -⟩ := EllCheck.mem_dv
    (mem_mulN EllCheck.P 2 (mem_mulI EllCheck.P ht hX))
    (mem_addI EllCheck.P (mem_one EllCheck.P) ht) he1
  obtain ⟨he2m, -⟩ := EllCheck.mem_dv
    (mem_mulN EllCheck.P 2 (mem_mulI EllCheck.P ht hY))
    (mem_subI EllCheck.P (mem_one EllCheck.P) ht) he2
  obtain ⟨V, hVm, hV⟩ := EllCheck.expUp_sound (mem_addI EllCheck.P he1m he2m) hex
  have hinv := mem_invI EllCheck.P ht (lo_pos_of_isPos htp)
  obtain ⟨hprem, -⟩ := EllCheck.mem_dv (EllCheck.mem_powB hinv (degree g))
    (mem_subI EllCheck.P (mem_one EllCheck.P) (mem_sqI EllCheck.P ht)) hpre
  have hexp : Real.exp
      (2 * (tau : ℝ) * (sqrtReSqQ x R : ℝ) / (1 + tau) +
        2 * (tau : ℝ) * (sqrtImSqQ x R : ℝ) / (1 - tau)) ≤ V := by
    convert hV using 2
    ring
  have hden : 0 < 1 - (tau : ℝ) ^ 2 := by nlinarith
  refine ⟨ht0, ht1, _, mem_mulI EllCheck.P hprem hVm, ?_⟩
  unfold primarySq
  rw [one_div, ← sq]
  exact mul_le_mul_of_nonneg_left hexp (by positivity)

end Grothe.UpperQuad.TwistEllCheck
