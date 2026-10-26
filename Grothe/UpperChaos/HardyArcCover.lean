import Grothe.UpperChaos.HardyArcSound
import Grothe.UpperChaos.HardyArcCircle

/-!
# Soundness of the arc cover

For the radius `ρ = 4149/4000` and `j = 9/20`: if the kernel accepts the piece `[lo, hi]` (scaled `s = tan(θ/2)`) of a
chart, then for every angle `θ` of that piece the continued correlation satisfies
`‖HholPair F G (R(±ρ e^{iθ}))‖² ≤ v/D` (`leaf_bound`), and the integral of this square over the piece is at most the
kernel's contribution (`leaf_integral`). Step 4 of the `hardy` plan.
-/

open MeasureTheory Real
open scoped ComplexConjugate

namespace Grothe.UpperChaos.HardyArcCover

open GrotheKernel GrotheKernel.HardyArc Grothe.Upper HardyArcSound HardyArcCircle SchurMain SchurKernel

/-- The radius and the reference precision. -/
def rhoQ : ℚ := 4149 / 4000
def jQ : ℚ := 9 / 20

/-- The squared correlation along a chart. -/
noncomputable def gF (F G : ℂ × ℂ → ℂ) (neg : Bool) (θ : ℝ) : ℝ :=
  ‖HholPair F G (Rt (HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2

variable {F G : ℂ × ℂ → ℂ} (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1)
  (hG : ∀ u, ‖G u‖ ≤ 1)
include hFm hGm hF hG

/-- **The pointwise bound on an accepted piece.** -/
theorem leaf_bound {neg : Bool} {lo hi : ℤ} {v : ℤ}
    (hpos : posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) = true)
    (hv : schurValue (ofRatI jQ) (Rbox hardyData (circleBox (ofRatI rhoQ) neg ⟨lo, hi⟩)) = some v)
    {θ : ℝ} (h1 : 2 * arctan ((lo : ℝ) / D) ≤ θ) (h2 : θ ≤ 2 * arctan ((hi : ℝ) / D)) :
    gF F G neg θ ≤ (v : ℝ) / D := by
  have hD := D_pos
  obtain ⟨hlo, hhi⟩ := tan_half_mem h1 h2
  have hθ1 : -π < θ := by have := neg_pi_div_two_lt_arctan ((lo : ℝ) / D); linarith
  have hθ2 : θ < π := by have := arctan_lt_pi_div_two ((hi : ℝ) / D); linarith
  have he := exp_eq_chart hθ1 hθ2
  set τ := tan (θ / 2)
  have hτ : mem τ ⟨lo, hi⟩ := by
    refine ⟨?_, ?_⟩
    · have := (div_le_iff₀ hD).1 hlo; simpa [mul_comm] using this
    · have := (le_div_iff₀ hD).1 hhi; simpa [mul_comm] using this
  have hchart := memC_circleBox (mem_ofRatI rhoQ) hτ hpos neg
  have hpt : chartPt (rhoQ : ℝ) neg τ = HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) := by
    rw [he, chartPt]; push_cast; ring
  rw [hpt] at hchart
  obtain ⟨hZ, hT, hb⟩ := schurValue_sound (memSC_Rbox hchart) (mem_ofRatI jQ) hv
  have hj0 : (0 : ℝ) < (jQ : ℝ) := by norm_num [jQ]
  exact (norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG).trans hb

end Grothe.UpperChaos.HardyArcCover
