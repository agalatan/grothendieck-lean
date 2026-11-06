import Grothe.UpperQuad.TwistEllipseDiskGeometry
import Grothe.UpperQuad.TwistEllipsePhaseSound
import Grothe.UpperQuad.TwistEllipseSound
import Grothe.UpperQuad.TwistYEnvelope

/-!
# Accepted Y disks bound the actual twisted vector

The disk checker supplies uniform geometric and arithmetic witnesses for the explicit Y
envelope. These witnesses bound the complete descended production vector. A rejected angle
defect uses the squared shift norm as its imaginary-square bound; no K estimate is used.

Agent-ID: codex-2f3d. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistEllCheck

open GrotheQuad QuadRem TaylorShift

noncomputable section

/-- The analytic Y envelope is exactly the product evaluated by the twisted disk checker. -/
theorem yBoundSq_eq_checker (g : Power) (t eta L X Y B2 : ℝ) :
    TwistRadialExt.yBoundSq (powerNat g) t eta L X Y B2 =
      Real.exp (-2 * L) * (primarySq g t X Y * upsYSq g eta Y B2) := by
  rw [TwistRadialExt.yBoundSq_eq]
  unfold primarySq upsYSq phaseSq degree phaseDegree
  ring

/-- A successful Y disk supplies a common enclosed bound for the actual full vector.
The canonical coefficient table is unused in this mode. -/
theorem diskM2_y_sound (hc : EllCheck.chatOK = true) {g : Power} {coeffs : List Ival}
    {pos : Bool} {x : ℚ} {pl : Plan} (hR : 0 ≤ (pl.geometry.R : ℝ))
    (hmode : pl.mode = .y) {u : Ival} (h : diskM2 g coeffs pos x pl = some u) :
    devR x pl.geometry.R < EllCheck.sgn pos * tcoef 0 x ∧
      ∃ B, mem B u ∧ ∀ σ : ℝ, |σ| = 1 →
        ∀ z : ℂ, ‖z - (x : ℂ)‖ ≤ pl.geometry.R →
          ‖TwistRadialExt.descendedVector (powerNat g) σ z‖ ^ 2 ≤ B := by
  unfold diskM2 at h
  simp only [Option.bind_eq_bind, Option.bind_eq_some_iff] at h
  obtain ⟨⟨at0, e⟩, hprof, a2hi, ha2, uy, huy, m, hm, er, her, h⟩ := h
  simp only [Option.pure_def, Option.some.injEq] at h
  subst h
  have hy : (match EllCheck.defectI x pl.geometry.R at0 e with
      | some k => shiftImSqI a2hi k
      | none => some a2hi).bind
        (fun b2 ↦ upsYI g pl.etaY (EllCheck.qI (sqrtImSqQ x pl.geometry.R)) b2) =
      some uy := by
    cases hdef : EllCheck.defectI x pl.geometry.R at0 e <;>
      simpa only [upsI, hmode, hdef, Option.bind_eq_bind] using huy
  obtain ⟨b2, hb2, hups⟩ := Option.bind_eq_some_iff.mp hy
  obtain ⟨hsgn, B2, hBm, _, hgeom⟩ := diskProfile_shift_geometry hc hR hprof ha2 hb2
  obtain ⟨heta0, heta1, U, hUm, hU⟩ := upsYI_sound (EllCheck.mem_qI _) hBm hups
  obtain ⟨ht0, ht1, M, hMm, hM⟩ := mehI_sound hm
  obtain ⟨E, hEm, hE⟩ := EllCheck.expUp_sound (EllCheck.mem_qI _) her
  have hcast : (((-2 * (x - pl.geometry.R) : ℚ) : ℝ)) =
      -2 * ((x : ℝ) - (pl.geometry.R : ℝ)) := by
    push_cast
    ring
  rw [hcast] at hE
  have hprimary0 := primarySq_nonneg g ht0.le ht1.le
    (sqrtReSqQ x pl.geometry.R) (sqrtImSqQ x pl.geometry.R)
  have hups0 : 0 ≤ upsYSq g pl.etaY (sqrtImSqQ x pl.geometry.R) B2 :=
    mul_nonneg (phaseSq_nonneg g heta0.le _) (Real.exp_pos _).le
  have hM0 := hprimary0.trans hM
  have hE0 := (Real.exp_pos _).le.trans hE
  refine ⟨hsgn, E * (M * U),
    mem_mulI EllCheck.P hEm (mem_mulI EllCheck.P hMm hUm), ?_⟩
  intro σ hσ z hz
  obtain ⟨r, hr⟩ := IsAlgClosed.exists_pow_nat_eq z (by norm_num : 0 < 2)
  have hd : DiskPoint (EllCheck.sgn pos) x pl.geometry.R z r :=
    ⟨hR, hz, hr, EllCheck.sgn_cases pos, hsgn⟩
  obtain ⟨hX, hY, hB⟩ := hgeom z r hz hr
  have hBshift : (TwistRadialExt.shift r).im ^ 2 ≤ B2 := by
    rw [TwistRadialExt.shift_im_sq_eq _ (EllCheck.sgn_cases pos) r, hr]
    exact hB
  have hactual := TwistRadialExt.norm_descendedVector_sq_le_yBoundSq
    (powerNat g) (by simp [powerNat]) σ hσ hr
    ht0 ht1 heta0 heta1 hd.re_ge hX hY hBshift
  rw [yBoundSq_eq_checker] at hactual
  exact hactual.trans
    (mul_le_mul hE (mul_le_mul hM hU hups0 hM0)
      (mul_nonneg hprimary0 hups0) hE0)

/-- The executable upper endpoint bounds the actual squared vector norm on an accepted Y disk. -/
theorem norm_descendedVector_sq_le_diskM2_y (hc : EllCheck.chatOK = true)
    (σ : ℝ) (hσ : |σ| = 1)
    {g : Power} {coeffs : List Ival} {pos : Bool} {x : ℚ} {pl : Plan}
    (hR : 0 ≤ (pl.geometry.R : ℝ)) (hmode : pl.mode = .y) {u : Ival}
    (h : diskM2 g coeffs pos x pl = some u) {z : ℂ}
    (hz : ‖z - (x : ℂ)‖ ≤ pl.geometry.R) :
    ‖TwistRadialExt.descendedVector (powerNat g) σ z‖ ^ 2 ≤
      (upperQ u : ℝ) := by
  obtain ⟨_, B, hBm, hB⟩ := diskM2_y_sound hc hR hmode h
  exact (hB σ hσ z hz).trans (le_upperQ_of_mem hBm)

/-- The same accepted Y disk excludes every zero of the actual production profile. -/
theorem vC_ne_zero_of_diskM2_y (hc : EllCheck.chatOK = true)
    {g : Power} {coeffs : List Ival} {pos : Bool} {x : ℚ} {pl : Plan}
    (hR : 0 ≤ (pl.geometry.R : ℝ)) (hmode : pl.mode = .y) {u : Ival}
    (h : diskM2 g coeffs pos x pl = some u) {z : ℂ}
    (hz : ‖z - (x : ℂ)‖ ≤ pl.geometry.R) : vC z ≠ 0 := by
  obtain ⟨hsgn, _⟩ := diskM2_y_sound hc hR hmode h
  obtain ⟨r, hr⟩ := IsAlgClosed.exists_pow_nat_eq z (by norm_num : 0 < 2)
  have hd : DiskPoint (EllCheck.sgn pos) x pl.geometry.R z r :=
    ⟨hR, hz, hr, EllCheck.sgn_cases pos, hsgn⟩
  exact norm_pos_iff.mp ((sub_pos.mpr hsgn).trans_le hd.norm_vC_ge)

/-- A certified nonnegative cap on the returned squared mass supplies a panel norm cap. -/
theorem norm_descendedVector_le_of_diskM2_y (hc : EllCheck.chatOK = true)
    (σ : ℝ) (hσ : |σ| = 1)
    {g : Power} {coeffs : List Ival} {pos : Bool} {x : ℚ} {pl : Plan}
    (hR : 0 ≤ (pl.geometry.R : ℝ)) (hmode : pl.mode = .y) {u : Ival}
    (h : diskM2 g coeffs pos x pl = some u) {z : ℂ}
    (hz : ‖z - (x : ℂ)‖ ≤ pl.geometry.R) {M : ℝ} (hM : 0 ≤ M)
    (hcap : (upperQ u : ℝ) ≤ M ^ 2) :
    ‖TwistRadialExt.descendedVector (powerNat g) σ z‖ ≤ M :=
  (sq_le_sq₀ (norm_nonneg _) hM).mp
    ((norm_descendedVector_sq_le_diskM2_y hc σ hσ hR hmode h hz).trans hcap)

end

end Grothe.UpperQuad.TwistEllCheck
