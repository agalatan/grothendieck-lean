import Grothe.UpperReplacement.Pair
import Grothe.UpperChaos.HardyArcRegion

/-!
# Separate polynomial covariance curves for the mixture channels

Agent-ID: codex-a7c4.

The interval checker already accepts arbitrary coefficient lists and smoothing matrices.
This module supplies the corresponding analytic curve and soundness theorem without fixing
the incumbent primary polynomial, auxiliary polynomial, or contour radius.
-/

namespace Grothe.UpperReplacement

open UpperChaos UpperChaos.HardyArcSound UpperChaos.HardyArcRegion
open GrotheKernel GrotheKernel.HardyArc Grothe.Upper

noncomputable section

def covarianceCurve (M : Sym2R) (p q : List ℚ) (t : ℂ) : Sym2C :=
  let a := t * Polynomial.aeval (t ^ 2) (ofListQ p)
  let b := t * Polynomial.aeval (t ^ 2) (ofListQ q)
  ⟨(M.a : ℂ) ^ 2 * a + (M.b : ℂ) ^ 2 * b,
    (M.a : ℂ) * M.b * a + (M.b : ℂ) * M.c * b,
    (M.b : ℂ) ^ 2 * a + (M.c : ℂ) ^ 2 * b⟩

def covarianceData (M : SR) (p q : List ℚ) : RData :=
  ⟨M.a, M.b, M.c, p.map ofRatI, q.map ofRatI⟩

theorem covarianceCurve_differentiable (M : Sym2R) (p q : List ℚ) :
    Differentiable ℂ (fun t ↦ (covarianceCurve M p q t).a) ∧
    Differentiable ℂ (fun t ↦ (covarianceCurve M p q t).b) ∧
    Differentiable ℂ (fun t ↦ (covarianceCurve M p q t).c) := by
  constructor
  · exact ((differentiable_const _).mul (differentiable_odd _)).add
      ((differentiable_const _).mul (differentiable_odd _))
  constructor
  · exact ((differentiable_const _).mul (differentiable_odd _)).add
      ((differentiable_const _).mul (differentiable_odd _))
  · exact ((differentiable_const _).mul (differentiable_odd _)).add
      ((differentiable_const _).mul (differentiable_odd _))

theorem covarianceCurve_mem {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {t : ℂ} {T : CI} (ht : memC t T) :
    memSC (covarianceCurve M p q t) (Rbox (covarianceData MI p q) T) := by
  have ht2 := memC_mul ht ht
  have hp : memC (t * Polynomial.aeval (t ^ 2) (ofListQ p))
      (CI.mul T (CI.horner (CI.mul T T) (p.map ofRatI))) := by
    rw [aeval_ofListQ, sq]
    exact memC_mul ht (memC_horner ht2 (forall2_ofRatI p))
  have hq : memC (t * Polynomial.aeval (t ^ 2) (ofListQ q))
      (CI.mul T (CI.horner (CI.mul T T) (q.map ofRatI))) := by
    rw [aeval_ofListQ, sq]
    exact memC_mul ht (memC_horner ht2 (forall2_ofRatI q))
  have ha := memC_ofR hM.1
  have hb := memC_ofR hM.2.1
  have hc := memC_ofR hM.2.2
  refine ⟨?_, ?_, ?_⟩
  · convert memC_add (memC_mul (memC_mul ha ha) hp) (memC_mul (memC_mul hb hb) hq)
      using 1 <;> first | rfl | (simp only [covarianceCurve]; ring)
  · exact memC_add (memC_mul (memC_mul ha hb) hp) (memC_mul (memC_mul hb hc) hq)
  · convert memC_add (memC_mul (memC_mul hb hb) hp) (memC_mul (memC_mul hc hc) hq)
      using 1 <;> first | rfl | (simp only [covarianceCurve]; ring)

/-- The positivity gates concern any enclosed covariance, including every mixture channel. -/
theorem kerPos_of_enclosed_gates {R : Sym2C} {RI : SC}
    (hR : memSC R RI) (hg : kerGates RI = true) : ∃ l > 0, KerPos R l := by
  simp only [kerGates, Bool.and_eq_true] at hg
  obtain ⟨⟨⟨hp1, hp2⟩, hP⟩, hM⟩ := hg
  have hdp := memC_dpm hR false
  have hdm := memC_dpm hR true
  rw [sig_false] at hdp
  rw [sig_true] at hdm
  have hdp0 : dpm R 1 ≠ 0 := fun h0 ↦ by
    have := pos_of_posI (mem_normSq hdp) hp1
    simp [h0] at this
  have hdm0 : dpm R (-1) ≠ 0 := fun h0 ↦ by
    have := pos_of_posI (mem_normSq hdm) hp2
    simp [h0] at this
  have hIp := memSC_invIm hR false hp1
  have hIm := memSC_invIm hR true hp2
  rw [sig_false] at hIp
  rw [sig_true] at hIm
  exact kerPos_of_gates hdp0 hdm0
    (PD_of_gate (memSR_re hIp) hP) (PD_of_gate (memSR_re hIm) hM)

/-- A successful finite disk cover gives positivity for the actual parameterized curve. -/
theorem covariance_discCover_sound {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r2 : ℤ} :
    ∀ (depth : ℕ) (xlo xhi ylo yhi : ℤ),
      discCover (covarianceData MI p q) r2 depth xlo xhi ylo yhi = true →
      ∀ t : ℂ, mem t.re ⟨xlo, xhi⟩ → mem t.im ⟨ylo, yhi⟩ →
        Complex.normSq t < (r2 : ℝ) / D → ∃ l > 0, KerPos (covarianceCurve M p q t) l := by
  intro depth
  induction depth with
  | zero =>
    intro xlo xhi ylo yhi h t hx hy hr
    simp only [discCover, Bool.or_eq_true, Bool.or_false] at h
    rcases h with h | h
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact kerPos_of_enclosed_gates (covarianceCurve_mem hM p q ⟨hx, hy⟩) h
  | succ d ih =>
    intro xlo xhi ylo yhi h t hx hy hr
    simp only [discCover, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with (h | h) | ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩
    · exact absurd (outside_sound h hx hy) (not_le.2 hr)
    · exact kerPos_of_enclosed_gates (covarianceCurve_mem hM p q ⟨hx, hy⟩) h
    · set xm := (xlo + xhi) / 2
      set ym := (ylo + yhi) / 2
      rcases le_total (t.re * D) xm with hxl | hxl <;>
        rcases le_total (t.im * D) ym with hyl | hyl
      · exact ih _ _ _ _ h1 t ⟨hx.1, hxl⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h3 t ⟨hx.1, hxl⟩ ⟨hyl, hy.2⟩ hr
      · exact ih _ _ _ _ h2 t ⟨hxl, hx.2⟩ ⟨hy.1, hyl⟩ hr
      · exact ih _ _ _ _ h4 t ⟨hxl, hx.2⟩ ⟨hyl, hy.2⟩ hr

theorem covariance_kerPos_on_ball {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℚ} (hr0 : 0 < r) (hr2 : r ≤ 2)
    (h : discCheck (covarianceData MI p q) (ofRatHi (r ^ 2)) = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (r : ℝ), ∃ l > 0, KerPos (covarianceCurve M p q t) l := by
  intro t ht
  have hD := D_pos
  rw [Metric.mem_ball, dist_zero_right] at ht
  have hr : (0 : ℝ) < r := by exact_mod_cast hr0
  have hnorm : ‖t‖ < 2 := ht.trans_le (by exact_mod_cast hr2)
  have hre : |t.re| < 2 := (Complex.abs_re_le_norm t).trans_lt hnorm
  have him : |t.im| < 2 := (Complex.abs_im_le_norm t).trans_lt hnorm
  have hx : mem t.re ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 hre
    constructor <;> push_cast <;> nlinarith
  have hy : mem t.im ⟨-2 * D, 2 * D⟩ := by
    obtain ⟨a, b⟩ := abs_lt.1 him
    constructor <;> push_cast <;> nlinarith
  refine covariance_discCover_sound hM p q 30 _ _ _ _ h t hx hy ?_
  have h1 : Complex.normSq t < (r : ℝ) ^ 2 := by
    rw [Complex.normSq_eq_norm_sq]
    exact pow_lt_pow_left₀ ht (norm_nonneg _) (by norm_num)
  have h2 : ((r ^ 2 : ℚ) : ℝ) * D ≤ (ofRatHi (r ^ 2) : ℝ) := le_ofRatHi _
  rw [lt_div_iff₀ hD]
  push_cast at h2
  nlinarith

end

end Grothe.UpperReplacement
