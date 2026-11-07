import Grothe.UpperQuad.QuadEllipsePanelSound
import Grothe.UpperQuad.TwistRadialPanels

/-!
# Disk coverage and profile signs for accepted twisted panel geometry

The existing geometry check covers the whole closed Bernstein ellipse by its real-centered
disks. Strict profile separation on each disk therefore supplies nonvanishing on the whole
ellipse and fixes the physical profile sign, including at the left endpoint of the origin panel.
No bound on the untwisted integrand is used.

Agent-ID: codex-1a87. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistEllCheck

open Set Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
open Grothe.UpperChaos.Q0GaussAddressScan
open QuadRem Remainder

noncomputable section

/-- Accepted plan geometry covers every point of the closed annulus image by a plan disk. -/
theorem exists_disk_of_planGeomOK {lo hi : ℚ} {pl : EllCheck.Plan}
    (hgeo : EllCheck.planGeomOK lo hi pl = true) {w : ℂ}
    (h1 : (pl.rho : ℝ)⁻¹ ≤ ‖w‖) (h2 : ‖w‖ ≤ (pl.rho : ℝ)) :
    ∃ i : ℕ, i < pl.m ∧
      ‖ellipsePt lo hi w - (EllCheck.diskCentre lo hi pl i : ℝ)‖ ≤ (pl.R : ℝ) := by
  obtain ⟨hρ, hm, hR, hcov, -, -, hlh⟩ := EllCheck.planGeomOK_spec hgeo
  have hR' : (0 : ℝ) ≤ pl.R := by exact_mod_cast hR
  have hlh' : (lo : ℝ) < hi := by exact_mod_cast hlh
  have hρ' : (1 : ℝ) < pl.rho := by exact_mod_cast hρ
  obtain ⟨A, hA⟩ : ∃ A : ℝ, A = ((EllCheck.halfAxes lo hi pl).1 : ℝ) := ⟨_, rfl⟩
  obtain ⟨B, hB⟩ : ∃ B : ℝ, B = ((EllCheck.halfAxes lo hi pl).2 : ℝ) := ⟨_, rfl⟩
  have hAe : A = ((hi : ℝ) - lo) / 2 *
      (((pl.rho : ℝ) + (pl.rho : ℝ)⁻¹) / 2) := by
    rw [hA]
    unfold EllCheck.halfAxes
    push_cast
    ring
  have hBe : B = ((hi : ℝ) - lo) / 2 *
      (((pl.rho : ℝ) - (pl.rho : ℝ)⁻¹) / 2) := by
    rw [hB]
    unfold EllCheck.halfAxes
    push_cast
    ring
  have hA0 : 0 < A := by
    rw [hAe]
    have h1 : 0 < (pl.rho : ℝ) := by linarith
    have h2 : 0 < ((hi : ℝ) - lo) / 2 := by linarith
    positivity
  have hm' : 0 < pl.m := by omega
  have hcov' : (A / pl.m) ^ 2 + B ^ 2 ≤ (pl.R : ℝ) ^ 2 := by
    rw [hA, hB]
    exact_mod_cast hcov
  obtain ⟨hre, him⟩ := ellipsePt_re_im_le hlh'.le hρ' h1 h2
  rw [← hAe] at hre
  rw [← hBe] at him
  obtain ⟨i, hi', hiz⟩ := exists_disk_cover hA0 hm' hcov' hR' hre him
  refine ⟨i, hi', ?_⟩
  have hx : ((EllCheck.diskCentre lo hi pl i : ℚ) : ℝ) =
      ((lo : ℝ) + hi) / 2 - A + 2 * A / pl.m * (i + 1 / 2) := by
    unfold EllCheck.diskCentre
    rw [hA]
    push_cast
    ring
  rw [hx]
  exact hiz

/-- Strict separation on all covering disks makes the actual profile nonzero on the ellipse. -/
theorem vC_ne_zero_of_planGeomOK {lo hi : ℚ} {pl : EllCheck.Plan} {pos : Bool}
    (hgeo : EllCheck.planGeomOK lo hi pl = true)
    (hdisks : ∀ i : ℕ, i < pl.m →
      devR (EllCheck.diskCentre lo hi pl i) pl.R <
        EllCheck.sgn pos * tcoef 0 (EllCheck.diskCentre lo hi pl i))
    {w : ℂ} (h1 : (pl.rho : ℝ)⁻¹ ≤ ‖w‖) (h2 : ‖w‖ ≤ (pl.rho : ℝ)) :
    vC (ellipsePt lo hi w) ≠ 0 := by
  obtain ⟨_, _, hR, _, _, _, _⟩ := EllCheck.planGeomOK_spec hgeo
  have hR' : (0 : ℝ) ≤ pl.R := by exact_mod_cast hR
  obtain ⟨i, hi', hiz⟩ := exists_disk_of_planGeomOK hgeo h1 h2
  exact EllCheck.vC_ne_zero_of_disk hR' (hdisks i hi') (EllCheck.sgn_cases pos) hiz

/-- The accepted disk sign is the physical signed-profile positivity on the full real panel. -/
theorem sign_pos_of_planGeomOK {lo hi : ℚ} {pl : EllCheck.Plan} {pos : Bool}
    (hgeo : EllCheck.planGeomOK lo hi pl = true)
    (hdisks : ∀ i : ℕ, i < pl.m →
      devR (EllCheck.diskCentre lo hi pl i) pl.R <
        EllCheck.sgn pos * tcoef 0 (EllCheck.diskCentre lo hi pl i))
    {s : ℝ} (hs : s ∈ Icc (lo : ℝ) hi) :
    0 < EllCheck.sgn pos * vprof s := by
  obtain ⟨hρ, _, hR, _, _, _, hlh⟩ := EllCheck.planGeomOK_spec hgeo
  have hR' : (0 : ℝ) ≤ pl.R := by exact_mod_cast hR
  have hlh' : (lo : ℝ) < hi := by exact_mod_cast hlh
  have hρ' : (1 : ℝ) < pl.rho := by exact_mod_cast hρ
  obtain ⟨hw, hpt, -⟩ := ellipsePt_arccos hlh' hs
  obtain ⟨i, hi', hiz⟩ := exists_disk_of_planGeomOK hgeo
    (by rw [hw]; exact inv_le_one_of_one_le₀ hρ'.le)
    (by rw [hw]; exact hρ'.le)
  rw [hpt, ← Complex.ofReal_sub, Complex.norm_real, Real.norm_eq_abs] at hiz
  exact EllCheck.sign_of_disk hR' (hdisks i hi') (EllCheck.sgn_cases pos) hiz

/-- The disk sign agrees with `profileSign` at every real panel point. -/
theorem sgn_eq_profileSign_of_planGeomOK {lo hi : ℚ} {pl : EllCheck.Plan} {pos : Bool}
    (hgeo : EllCheck.planGeomOK lo hi pl = true)
    (hdisks : ∀ i : ℕ, i < pl.m →
      devR (EllCheck.diskCentre lo hi pl i) pl.R <
        EllCheck.sgn pos * tcoef 0 (EllCheck.diskCentre lo hi pl i))
    {s : ℝ} (hs : s ∈ Icc (lo : ℝ) hi) :
    EllCheck.sgn pos = profileSign s := by
  have hpos := sign_pos_of_planGeomOK hgeo hdisks hs
  rcases EllCheck.sgn_cases pos with hsign | hsign
  · rw [hsign] at hpos ⊢
    have hn : ¬vprof s < 0 := by nlinarith only [hpos]
    simp only [profileSign, hn, ite_false]
  · rw [hsign] at hpos ⊢
    have hn : vprof s < 0 := by nlinarith only [hpos]
    simp only [profileSign, hn, ite_true]

/-- On a production panel the accepted disk sign is exactly the fixed continuation sign. -/
theorem sgn_eq_panelSign_of_planGeomOK (p : Fin sourcePanels.length)
    {pl : EllCheck.Plan} {pos : Bool}
    (hgeo : EllCheck.planGeomOK (sourcePanels.get p).lo (sourcePanels.get p).hi pl = true)
    (hdisks : ∀ i : ℕ, i < pl.m →
      devR (EllCheck.diskCentre (sourcePanels.get p).lo (sourcePanels.get p).hi pl i) pl.R <
        EllCheck.sgn pos *
          tcoef 0 (EllCheck.diskCentre (sourcePanels.get p).lo (sourcePanels.get p).hi pl i)) :
    EllCheck.sgn pos = TwistRadialExt.panelSign p := by
  obtain ⟨_, _, _, _, _, _, hlh⟩ := EllCheck.planGeomOK_spec hgeo
  have hlh' : ((sourcePanels.get p).lo : ℝ) < (sourcePanels.get p).hi := by
    exact_mod_cast hlh
  exact sgn_eq_profileSign_of_planGeomOK hgeo hdisks ⟨le_rfl, hlh'.le⟩

end

end Grothe.UpperQuad.TwistEllCheck
