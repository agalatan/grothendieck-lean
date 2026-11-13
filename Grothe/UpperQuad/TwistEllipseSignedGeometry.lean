import Grothe.UpperQuad.TwistEllipseDiskGeometry
import Grothe.UpperQuad.TwistRadialVector

/-!
# Disk geometry for the actual signed continuation shift

The accepted profile, angle defect, and lower shift-norm evaluations supply the geometric
inputs of a K bound for the actual continuation shift. Squared norms and complex squares are
unchanged by the disk's fixed sign. Positivity of the enclosed lower norm witness is recovered
separately from successful K arithmetic.

Agent-ID: codex-2f3d. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad QuadRem TaylorShift

/-- Accepted disk geometry supplies K bounds for the actual signed continuation shift. -/
theorem diskProfile_signed_k_geometry (hc : EllCheck.chatOK = true)
    {pos : Bool} {x R : ℚ} (hR : 0 ≤ (R : ℝ)) {at0 e kp a2lo : Ival}
    (hprof : EllCheck.diskProfile pos x R = some (at0, e))
    (hdef : EllCheck.defectI x R at0 e = some kp)
    (ha2 : EllCheck.a2loI x R at0 e = some a2lo) :
    devR x R < EllCheck.sgn pos * tcoef 0 x ∧
      ∃ KP Alo, mem KP kp ∧ mem Alo a2lo ∧ 0 ≤ KP ∧ KP < 1 ∧
        ∀ z r : ℂ, ‖z - (x : ℂ)‖ ≤ R → r ^ 2 = z →
          r.re ^ 2 ≤ (sqrtReSqQ x R : ℝ) ∧ r.im ^ 2 ≤ (sqrtImSqQ x R : ℝ) ∧
            Alo ≤ ‖TwistRadialExt.shift r‖ ^ 2 ∧
              0 < ((TwistRadialExt.shift r) ^ 2).re ∧
                ‖TwistRadialExt.shift r‖ ^ 2 / ((TwistRadialExt.shift r) ^ 2).re ≤
                  1 / Real.sqrt (1 - KP ^ 2) := by
  obtain ⟨T, Dv, hf⟩ := EllCheck.ProfileFacts.mk' hc hR hprof
  obtain ⟨Alo, hAm, hA⟩ := a2loI_disk_bound hR hf ha2
  obtain ⟨_, KP, hKm, hK0, hK1, htheta⟩ := defectI_disk_theta hR hf hdef
  refine ⟨hf.hsgn, KP, Alo, hKm, hAm, hK0, hK1, fun z r hz hr => ?_⟩
  have hd : DiskPoint (EllCheck.sgn pos) x R z r :=
    ⟨hR, hz, hr, EllCheck.sgn_cases pos, hf.hsgn⟩
  obtain ⟨hX, hY⟩ := diskPoint_root_sq_bounds hd
  have hn : ‖TwistRadialExt.shift r‖ ^ 2 = ‖r / wC (EllCheck.sgn pos) z‖ ^ 2 := by
    simpa only [hr] using TwistRadialExt.norm_shift_sq_eq _ (EllCheck.sgn_cases pos) r
  have hre : ((TwistRadialExt.shift r) ^ 2).re =
      ((r / wC (EllCheck.sgn pos) z) ^ 2).re := by
    simpa only [hr] using TwistRadialExt.shift_sq_re_eq _ (EllCheck.sgn_cases pos) r
  obtain ⟨hpos, hratio⟩ := htheta z r hd
  refine ⟨hX, hY, (hA z r hd).trans_eq hn.symm, ?_, ?_⟩
  · rwa [hre]
  · rwa [hn, hre]

end Grothe.UpperQuad.TwistEllCheck
