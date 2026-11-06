import Grothe.UpperQuad.TwistEllipseGeometry
import Grothe.UpperQuad.TwistEllipseMajorantSound

/-!
# Actual disk geometry for the twisted ellipse checker

This module connects the checker's rational square-root bounds and interval shift bounds to
points in an accepted production-profile disk. The sharp imaginary bounds are supplied by
`TwistEllipseGeometry`. The profile, norm, and angle witnesses come from the existing disk
checker. No estimate for the twisted phase or conditional vector is proved here.

Agent-ID: codex-40e8. Refs #343, #334.
-/

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad Grothe.UpperQuad.QuadRem

/-- The checker's real-square rational bounds every square root at a disk point. -/
theorem diskPoint_root_re_sq_bound {ε : ℝ} {x R : ℚ} {z ζ : ℂ}
    (hd : DiskPoint ε x R z ζ) : ζ.re ^ 2 ≤ (sqrtReSqQ x R : ℝ) := by
  have he : (sqrtReSqQ x R : ℝ) = X2 (x : ℝ) (R : ℝ) := by
    unfold sqrtReSqQ X2
    push_cast
    rfl
  rw [he]
  exact hd.zeta_re_sq_le

/-- The checker's imaginary-square rational includes the sharp positive-center disk bound. -/
theorem diskPoint_root_im_sq_bound {ε : ℝ} {x R : ℚ} {z ζ : ℂ}
    (hd : DiskPoint ε x R z ζ) : ζ.im ^ 2 ≤ (sqrtImSqQ x R : ℝ) := by
  have hgeneral : ζ.im ^ 2 ≤ (|(x : ℝ)| + R - ((x : ℝ) - R)) / 2 := by
    rw [im_sq_eq, hd.norm_zeta_sq, hd.hζ]
    linarith [hd.norm_le, hd.re_ge]
  unfold sqrtImSqQ
  split_ifs with hx
  · push_cast
    have hx' : (0 : ℝ) < x := by exact_mod_cast hx
    exact le_min hgeneral (sqrt_im_sq_le_disk hx' hd.hζ hd.hz)
  · push_cast
    exact hgeneral

/-- Both rational square-root bounds at an actual disk point. -/
theorem diskPoint_root_sq_bounds {ε : ℝ} {x R : ℚ} {z ζ : ℂ}
    (hd : DiskPoint ε x R z ζ) :
    ζ.re ^ 2 ≤ (sqrtReSqQ x R : ℝ) ∧ ζ.im ^ 2 ≤ (sqrtImSqQ x R : ℝ) :=
  ⟨diskPoint_root_re_sq_bound hd, diskPoint_root_im_sq_bound hd⟩

/-- The accepted upper norm interval contains a nonnegative bound valid throughout the disk. -/
theorem a2hiI_disk_bound {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ))
    {at0 e a2hi : Ival} {T Dv : ℝ} (hf : EllCheck.ProfileFacts pos x R at0 e T Dv)
    (h : EllCheck.a2hiI x R at0 e = some a2hi) :
    ∃ Ahi, mem Ahi a2hi ∧ 0 ≤ Ahi ∧
      ∀ z ζ, DiskPoint (EllCheck.sgn pos) x R z ζ →
        ‖ζ / wC (EllCheck.sgn pos) z‖ ^ 2 ≤ Ahi := by
  obtain ⟨Ahi, hAm, hA⟩ := EllCheck.a2hiI_sound hR hf h
  refine ⟨Ahi, hAm, ?_, fun z ζ hd ↦ hd.norm_shift_sq_le.trans hA⟩
  exact le_trans (by positivity) hA

/-- The accepted lower norm interval contains a lower bound valid throughout the disk.
Strict positivity is recovered separately when a K division accepts this interval. -/
theorem a2loI_disk_bound {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ))
    {at0 e a2lo : Ival} {T Dv : ℝ} (hf : EllCheck.ProfileFacts pos x R at0 e T Dv)
    (h : EllCheck.a2loI x R at0 e = some a2lo) :
    ∃ Alo, mem Alo a2lo ∧
      ∀ z ζ, DiskPoint (EllCheck.sgn pos) x R z ζ →
        Alo ≤ ‖ζ / wC (EllCheck.sgn pos) z‖ ^ 2 := by
  obtain ⟨Alo, hAm, hA⟩ := EllCheck.a2loI_sound hR hf h
  exact ⟨Alo, hAm, fun z ζ hd ↦ hA.trans hd.norm_shift_sq_ge⟩

/-- The accepted defect witness bounds the actual theta ratio throughout the disk. -/
theorem defectI_disk_theta {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ))
    {at0 e kp : Ival} {T Dv : ℝ} (hf : EllCheck.ProfileFacts pos x R at0 e T Dv)
    (h : EllCheck.defectI x R at0 e = some kp) :
    (R : ℝ) < x ∧ ∃ KP, mem KP kp ∧ 0 ≤ KP ∧ KP < 1 ∧
      ∀ z ζ, DiskPoint (EllCheck.sgn pos) x R z ζ →
        0 < ((ζ / wC (EllCheck.sgn pos) z) ^ 2).re ∧
        ‖ζ / wC (EllCheck.sgn pos) z‖ ^ 2 / ((ζ / wC (EllCheck.sgn pos) z) ^ 2).re ≤
          1 / Real.sqrt (1 - KP ^ 2) := by
  obtain ⟨hxR, KP, hKm, hkle, hK1, hK0⟩ := EllCheck.defectI_sound hR hf h
  refine ⟨hxR, KP, hKm, hK0, hK1, ?_⟩
  intro z ζ hd
  obtain ⟨_, hre, hθ⟩ := hd.shift_angle hxR (lt_of_le_of_lt hkle hK1)
  have hk0 := EllCheck.diskPoint_kp_nonneg hd hxR
  have hsq : DiskPoint.kp (EllCheck.sgn pos) x R ^ 2 ≤ KP ^ 2 :=
    pow_le_pow_left₀ hk0 hkle 2
  have hs : 0 < Real.sqrt (1 - KP ^ 2) := Real.sqrt_pos.mpr (by nlinarith)
  exact ⟨hre, hθ.trans (one_div_le_one_div_of_le hs (Real.sqrt_le_sqrt (by linarith)))⟩

/-- The same branch expression used by `upsI` encloses an actual imaginary-shift square bound.
Accepted defects use the rationalized estimate; a rejected defect uses the full squared norm. -/
theorem shift_choice_disk_bound {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ))
    {at0 e a2hi b2 : Ival} {T Dv Ahi : ℝ}
    (hf : EllCheck.ProfileFacts pos x R at0 e T Dv)
    (hAm : mem Ahi a2hi) (hA0 : 0 ≤ Ahi)
    (hA : ∀ z ζ, DiskPoint (EllCheck.sgn pos) x R z ζ →
      ‖ζ / wC (EllCheck.sgn pos) z‖ ^ 2 ≤ Ahi)
    (h : (match EllCheck.defectI x R at0 e with
      | some kp => shiftImSqI a2hi kp
      | none => some a2hi) = some b2) :
    ∃ B2, mem B2 b2 ∧ 0 ≤ B2 ∧
      ∀ z ζ, DiskPoint (EllCheck.sgn pos) x R z ζ →
        (ζ / wC (EllCheck.sgn pos) z).im ^ 2 ≤ B2 := by
  cases hdef : EllCheck.defectI x R at0 e with
  | none =>
    simp only [hdef, Option.some.injEq] at h
    subst b2
    refine ⟨Ahi, hAm, hA0, ?_⟩
    intro z ζ hd
    have him : (ζ / wC (EllCheck.sgn pos) z).im ^ 2 ≤
        ‖ζ / wC (EllCheck.sgn pos) z‖ ^ 2 := by
      rw [← sq_abs]
      exact pow_le_pow_left₀ (abs_nonneg _) (Complex.abs_im_le_norm _) 2
    exact him.trans (hA z ζ hd)
  | some kp =>
    simp only [hdef] at h
    obtain ⟨hxR, KP, hKm, hkle, hK1, hK0⟩ := EllCheck.defectI_sound hR hf hdef
    obtain ⟨_, hBm⟩ := shiftImSqI_sound hAm hKm h
    refine ⟨_, hBm, ?_, ?_⟩
    · exact div_nonneg (mul_nonneg hA0 (sq_nonneg KP)) (by positivity)
    · intro z ζ hd
      exact diskPoint_shift_im_sq_le_sharp hd hxR hK0 hK1 hkle (hA z ζ hd)

/-- An accepted profile and shift branch supply all Y geometry for actual disk points.
The complex square root is arbitrary, so this bridge does not assume a square-root branch. -/
theorem diskProfile_shift_geometry (hc : EllCheck.chatOK = true)
    {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ)) {at0 e a2hi b2 : Ival}
    (hprof : EllCheck.diskProfile pos x R = some (at0, e))
    (ha2 : EllCheck.a2hiI x R at0 e = some a2hi)
    (hb2 : (match EllCheck.defectI x R at0 e with
      | some kp => shiftImSqI a2hi kp
      | none => some a2hi) = some b2) :
    devR x R < EllCheck.sgn pos * tcoef 0 x ∧
      ∃ B2, mem B2 b2 ∧ 0 ≤ B2 ∧
        ∀ z ζ : ℂ, ‖z - (x : ℂ)‖ ≤ R → ζ ^ 2 = z →
          ζ.re ^ 2 ≤ (sqrtReSqQ x R : ℝ) ∧ ζ.im ^ 2 ≤ (sqrtImSqQ x R : ℝ) ∧
            (ζ / wC (EllCheck.sgn pos) z).im ^ 2 ≤ B2 := by
  obtain ⟨T, Dv, hf⟩ := EllCheck.ProfileFacts.mk' hc hR hprof
  obtain ⟨Ahi, hAm, hA0, hA⟩ := a2hiI_disk_bound hR hf ha2
  obtain ⟨B2, hBm, hB0, hB⟩ := shift_choice_disk_bound hR hf hAm hA0 hA hb2
  refine ⟨hf.hsgn, B2, hBm, hB0, ?_⟩
  intro z ζ hz hζ
  have hd : DiskPoint (EllCheck.sgn pos) x R z ζ :=
    ⟨hR, hz, hζ, EllCheck.sgn_cases pos, hf.hsgn⟩
  obtain ⟨hX, hY⟩ := diskPoint_root_sq_bounds hd
  exact ⟨hX, hY, hB z ζ hd⟩

end Grothe.UpperQuad.TwistEllCheck
