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

omit hFm hGm hF hG in
/-- What an accepted leaf means. -/
lemma leafAttempt_some {neg : Bool} {w tol : ℤ} {last : Bool} {lo hi x : ℤ}
    (h : leafAttempt (ofRatI jQ) (ofRatI rhoQ) hardyData neg w tol last lo hi = some x) :
    ∃ v, posI (addI (intI 1) (mulI ⟨lo, hi⟩ ⟨lo, hi⟩)) = true ∧
      schurValue (ofRatI jQ) (Rbox hardyData (circleBox (ofRatI rhoQ) neg ⟨lo, hi⟩)) = some v ∧
      x = shUp (v * arcLenUp lo hi) := by
  unfold leafAttempt at h
  split_ifs at h with hc
  · simp only [Bool.and_eq_true] at hc
    split at h
    · rename_i v hv
      simp only at h
      split_ifs at h
      exact ⟨v, hc.2, hv, (Option.some.inj h).symm⟩
    · exact absurd h (by simp)

omit hFm hGm hF hG in
lemma ceilDiv_ge {a b : ℤ} (hb : 0 < b) : (a : ℝ) / b ≤ (ceilDiv a b : ℝ) := by
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  rw [div_le_iff₀ hbR]
  have h := Int.ediv_mul_le (-a) hb.ne'
  have h' : (((-a) / b : ℤ) : ℝ) * b ≤ -(a : ℝ) := by exact_mod_cast h
  change (a : ℝ) ≤ ((-((-a) / b) : ℤ) : ℝ) * b
  push_cast
  linarith

omit hFm hGm hF hG in
/-- The kernel's arc length is at least the real arc length. -/
lemma arcLen_le {lo hi : ℤ} (hlh : lo ≤ hi) (hs : 0 ≤ lo ∨ hi ≤ 0) :
    2 * arctan ((hi : ℝ) / D) - 2 * arctan ((lo : ℝ) / D) ≤ (arcLenUp lo hi : ℝ) / D := by
  have hD := D_pos
  have hsR : 0 ≤ (lo : ℝ) / D ∨ (hi : ℝ) / D ≤ 0 := by
    rcases hs with hs | hs
    · left; exact div_nonneg (by exact_mod_cast hs) hD.le
    · right; exact div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast hs) hD.le
  have h3 := arctan_sub_le (div_le_div_of_nonneg_right (by exact_mod_cast hlh) hD.le) hsR
  have hm : (0 : ℤ) ≤ min (lo * lo) (hi * hi) := le_min (mul_self_nonneg _) (mul_self_nonneg _)
  have hDD : (0 : ℤ) < D * D + min (lo * lo) (hi * hi) := by have := D_pos_int; positivity
  have hc := ceilDiv_ge (a := 2 * (hi - lo) * D * D) hDD
  have hmin : min (((lo : ℝ) / D) ^ 2) (((hi : ℝ) / D) ^ 2) = ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2 := by
    push_cast; rw [div_pow, div_pow, min_div_div_right (by positivity)]; ring_nf
  rw [hmin] at h3
  have key : 2 * (((hi : ℝ) / D - (lo : ℝ) / D) / (1 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2)) =
      ((2 * (hi - lo) * D * D : ℤ) : ℝ) / ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ) / D := by
    have : ((min (lo * lo) (hi * hi) : ℤ) : ℝ) ≥ 0 := by exact_mod_cast hm
    push_cast; field_simp
  have : (arcLenUp lo hi : ℝ) = (ceilDiv (2 * (hi - lo) * D * D) (D * D + min (lo * lo) (hi * hi)) : ℝ) := rfl
  calc 2 * arctan ((hi : ℝ) / D) - 2 * arctan ((lo : ℝ) / D)
      ≤ 2 * (((hi : ℝ) / D - (lo : ℝ) / D) / (1 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2)) := by linarith
    _ = ((2 * (hi - lo) * D * D : ℤ) : ℝ) / ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ) / D := key
    _ ≤ (arcLenUp lo hi : ℝ) / D := by rw [this]; gcongr

/-- **The integral over an accepted piece.** -/
theorem leaf_integral {neg : Bool} {w tol : ℤ} {last : Bool} {lo hi x : ℤ} (hlh : lo ≤ hi) (hs : 0 ≤ lo ∨ hi ≤ 0)
    (h : leafAttempt (ofRatI jQ) (ofRatI rhoQ) hardyData neg w tol last lo hi = some x)
    (hint : IntervalIntegrable (gF F G neg) volume (2 * arctan ((lo : ℝ) / D)) (2 * arctan ((hi : ℝ) / D))) :
    ∫ θ in (2 * arctan ((lo : ℝ) / D))..(2 * arctan ((hi : ℝ) / D)), gF F G neg θ ≤ (x : ℝ) / D := by
  obtain ⟨v, hpos, hv, rfl⟩ := leafAttempt_some h
  have hD := D_pos
  have hab : 2 * arctan ((lo : ℝ) / D) ≤ 2 * arctan ((hi : ℝ) / D) := by
    have := arctan_strictMono.monotone (div_le_div_of_nonneg_right (by exact_mod_cast hlh : (lo : ℝ) ≤ hi) hD.le)
    linarith
  have hpt : ∀ θ ∈ Set.Icc (2 * arctan ((lo : ℝ) / D)) (2 * arctan ((hi : ℝ) / D)), gF F G neg θ ≤ (v : ℝ) / D :=
    fun θ hθ => leaf_bound hFm hGm hF hG hpos hv hθ.1 hθ.2
  have hv0 : 0 ≤ (v : ℝ) / D := by
    have h0 : 0 ≤ gF F G neg (2 * arctan ((lo : ℝ) / D)) := by unfold gF; positivity
    exact h0.trans (hpt _ ⟨le_rfl, hab⟩)
  calc ∫ θ in (2 * arctan ((lo : ℝ) / D))..(2 * arctan ((hi : ℝ) / D)), gF F G neg θ
      ≤ ∫ θ in (2 * arctan ((lo : ℝ) / D))..(2 * arctan ((hi : ℝ) / D)), (v : ℝ) / D :=
        intervalIntegral.integral_mono_on hab hint intervalIntegrable_const hpt
    _ = (v : ℝ) / D * (2 * arctan ((hi : ℝ) / D) - 2 * arctan ((lo : ℝ) / D)) := by
        rw [intervalIntegral.integral_const, smul_eq_mul]; ring
    _ ≤ (v : ℝ) / D * ((arcLenUp lo hi : ℝ) / D) := mul_le_mul_of_nonneg_left (arcLen_le hlh hs) hv0
    _ ≤ (shUp (v * arcLenUp lo hi) : ℝ) / D := by
        have := le_shUp (m := v * arcLenUp lo hi) (r := (v : ℝ) * arcLenUp lo hi / D)
          (by rw [div_mul_cancel₀ _ hD.ne']; push_cast; rfl)
        rw [le_div_iff₀ hD]
        calc (v : ℝ) / D * ((arcLenUp lo hi : ℝ) / D) * D = (v : ℝ) * arcLenUp lo hi / D := by field_simp
          _ ≤ _ := this

end Grothe.UpperChaos.HardyArcCover
