import Grothe.UpperQuad.TwistRadialVector
import Grothe.UpperQuad.TwistProfileSign

/-!
# The concrete twisted continuation on every production panel

The panel sign is the actual profile sign at its left endpoint. Nonvanishing through the
closed ellipse supplies both analyticity of the descended vector and constancy of this sign
on the real panel. Thus only profile nonvanishing, boundary norm caps and the summed numerical
remainder remain as inputs to the actual twisted remainder theorem.

Agent-ID: codex-1a87. Refs #334, #343.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistRadialExt

open Set GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.F0ConditionalEvaluator
open Grothe.UpperChaos.Q0GaussAddressScan Grothe.UpperChaos.Q0GaussProductionMass

noncomputable section

/-- The sign of the actual profile at the left endpoint of a production panel. -/
def panelSign (p : Fin sourcePanels.length) : ℝ :=
  profileSign (sourcePanels.get p).lo

/-- The fixed panel sign always has absolute value one. -/
theorem abs_panelSign (p : Fin sourcePanels.length) : |panelSign p| = 1 := by
  unfold panelSign profileSign
  split_ifs <;> norm_num

/-- Nonvanishing on the closed ellipse includes the entire real panel. -/
theorem profile_nonzero_real_of_ellipse (p : Fin sourcePanels.length) {ρ : ℝ}
    (hρ : 1 < ρ)
    (hv : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ →
      QuadRem.vC (Remainder.ellipsePt (sourcePanels.get p).lo
        (sourcePanels.get p).hi w) ≠ 0)
    {s : ℝ} (hs : s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi) :
    vprof s ≠ 0 := by
  obtain ⟨hw, hpt, _⟩ := Remainder.ellipsePt_arccos (source_panel_lt p) hs
  have h := hv _ (by rw [hw]; exact (inv_lt_one_of_one_lt₀ hρ).le)
    (by rw [hw]; exact hρ.le)
  rw [hpt, QuadRem.vC_ofReal] at h
  exact Complex.ofReal_ne_zero.mp h

/-- The fixed sign agrees with the physical profile sign throughout an admissible panel. -/
theorem panelSign_eq_of_ellipse (p : Fin sourcePanels.length) {ρ : ℝ}
    (hρ : 1 < ρ)
    (hv : ∀ w : ℂ, ρ⁻¹ ≤ ‖w‖ → ‖w‖ ≤ ρ →
      QuadRem.vC (Remainder.ellipsePt (sourcePanels.get p).lo
        (sourcePanels.get p).hi w) ≠ 0)
    {s : ℝ} (hs : s ∈ Icc ((sourcePanels.get p).lo : ℝ) (sourcePanels.get p).hi) :
    panelSign p = profileSign s := by
  apply TwistProfileSign.profileSign_eq_of_nonzero_Icc
    ⟨le_rfl, (source_panel_lt p).le⟩ hs
  intro x hx
  exact profile_nonzero_real_of_ellipse p hρ hv hx

/-- Profile nonvanishing and boundary caps for the concrete descended vectors discharge the
full covered-set twisted remainder. The theorem applies to the origin panel as well. -/
theorem remainder_of_descended_ellipses (j : ℕ) (hj : j = 1 ∨ j = 2 ∨ j = 3)
    (radius cap : Fin sourcePanels.length → ℝ)
    (hradius : ∀ p, 1 < radius p)
    (hv : ∀ p, ∀ w : ℂ, (radius p)⁻¹ ≤ ‖w‖ → ‖w‖ ≤ radius p →
      QuadRem.vC (Remainder.ellipsePt (sourcePanels.get p).lo
        (sourcePanels.get p).hi w) ≠ 0)
    (hcap : ∀ p, ∀ w : ℂ, ‖w‖ = radius p →
      ‖descendedVector j (panelSign p)
        (Remainder.ellipsePt (sourcePanels.get p).lo (sourcePanels.get p).hi w)‖ ≤ cap p)
    {ρ : ℝ}
    (hsum : ∑ p, 2 * (((sourcePanels.get p).hi : ℝ) - (sourcePanels.get p).lo) *
      (2 * cap p * ((radius p)⁻¹) ^ (2 * (sourcePanels.get p).order) /
        (1 - (radius p)⁻¹)) ≤ ρ) : TwistRemainderHyp j ρ := by
  have hj0 : 0 < j := by omega
  apply TwistPanels.remainder_of_ellipses j hj
    (fun p ↦ descendedVector j (panelSign p)) radius cap hradius
    (fun p w h1 h2 ↦ differentiableAt_descendedVector j hj0 (panelSign p) (hv p w h1 h2))
    hcap _ hsum
  intro p x s hs hs0
  exact descendedVector_real j (panelSign p) s hs0.le
    (profile_nonzero_real_of_ellipse p (hradius p) (hv p) hs)
    (panelSign_eq_of_ellipse p (hradius p) (hv p) hs) x

end

end Grothe.UpperQuad.TwistRadialExt
