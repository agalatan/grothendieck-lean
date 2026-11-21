import Grothe.UpperReplacement.Pair
import Grothe.UpperReplacement.CircleCheck
import Grothe.UpperChaos.HardyArcRegion
import Grothe.UpperChaos.HardyArcCircle
import Mathlib.Analysis.Complex.AbsMax

set_option warningAsError true

/-!
# Separate polynomial covariance curves for the mixture channels

Agent-ID: codex-a7c4, gemini-1aa9.

The interval checker already accepts arbitrary coefficient lists and smoothing matrices.
This module supplies the corresponding analytic curve and soundness theorems, both via a
2D disk quadtree and via the 1D quarter-circle tube cover extended to the open ball by
symmetry and the maximum modulus principle.
-/

namespace Grothe.UpperReplacement

open UpperChaos UpperChaos.HardyArcSound UpperChaos.HardyArcRegion UpperChaos.HardyArcCircle
open GrotheKernel GrotheKernel.HardyArc Grothe.Upper
open scoped ComplexConjugate

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

/-! ### Symmetry, trimming, and 1D quarter-circle tube soundness -/

/-- Stripping trailing zeros preserves the polynomial `ofListQ p`. -/
theorem ofListQ_trimQ : ∀ p : List ℚ, ofListQ (CircleCheck.trimQ p) = ofListQ p
  | [] => rfl
  | a :: rest => by
    have ih := ofListQ_trimQ rest
    unfold CircleCheck.trimQ
    cases h : CircleCheck.trimQ rest with
    | nil =>
      rw [h] at ih
      have hrest : ofListQ rest = 0 := ih.symm
      by_cases ha : a = 0
      · subst ha
        simp [ofListQ, hrest]
      · have hne : (a == 0) = false := beq_false_of_ne ha
        simp [hne, ofListQ, hrest]
    | cons b r =>
      rw [h] at ih
      show Polynomial.C (a : ℝ) + Polynomial.X * ofListQ (b :: r) =
        Polynomial.C (a : ℝ) + Polynomial.X * ofListQ rest
      rw [ih]

theorem covarianceCurve_trimQ (M : Sym2R) (p q : List ℚ) (t : ℂ) :
    covarianceCurve M (CircleCheck.trimQ p) (CircleCheck.trimQ q) t = covarianceCurve M p q t := by
  simp only [covarianceCurve, ofListQ_trimQ]

theorem covarianceCurve_neg (M : Sym2R) (p q : List ℚ) (t : ℂ) :
    covarianceCurve M p q (-t) =
      ⟨-(covarianceCurve M p q t).a, -(covarianceCurve M p q t).b, -(covarianceCurve M p q t).c⟩ := by
  simp only [covarianceCurve, neg_sq]
  congr 1 <;> ring

private theorem aeval_ofListQ_conj (p : List ℚ) (z : ℂ) :
    Polynomial.aeval (conj z) (ofListQ p) = conj (Polynomial.aeval z (ofListQ p)) := by
  induction p with
  | nil => simp [ofListQ]
  | cons a rest ih =>
    simp only [ofListQ, map_add, map_mul, Polynomial.aeval_C, Polynomial.aeval_X,
      Complex.coe_algebraMap, Complex.conj_ofReal, ih]

theorem covarianceCurve_conj (M : Sym2R) (p q : List ℚ) (t : ℂ) :
    covarianceCurve M p q (conj t) =
      ⟨conj (covarianceCurve M p q t).a, conj (covarianceCurve M p q t).b,
        conj (covarianceCurve M p q t).c⟩ := by
  simp only [covarianceCurve]
  have hsq : conj t ^ 2 = conj (t ^ 2) := (map_pow (starRingEnd ℂ) t 2).symm
  rw [hsq, aeval_ofListQ_conj, aeval_ofListQ_conj]
  simp only [map_add, map_mul, map_pow, Complex.conj_ofReal]

/-- Positive definiteness of a real symmetric 2×2 matrix is equivalent to strict positivity of its
quadratic form on nonzero vectors. -/
theorem PD_iff_form_pos (S : Sym2R) :
    S.PD ↔ ∀ v : ℝ × ℝ, v ≠ (0, 0) → 0 < S.q v := by
  constructor
  · intro hS v hv
    have hv2 : 0 < v.1 ^ 2 + v.2 ^ 2 := by
      rcases not_and_or.mp (mt Prod.ext_iff.mpr hv) with h1 | h2
      · nlinarith [sq_pos_of_ne_zero h1, sq_nonneg v.2]
      · nlinarith [sq_pos_of_ne_zero h2, sq_nonneg v.1]
    have hc : 0 < S.c := by
      have := hS.2
      simp only [Sym2R.det] at this
      nlinarith [sq_nonneg S.b, hS.1]
    have hμ : 0 < S.det / (S.a + S.c) := div_pos hS.2 (by linarith [hS.1])
    exact (mul_pos hμ hv2).trans_le (q_ge_of_PD hS v)
  · intro hpos
    have ha : 0 < S.a := by
      simpa [Sym2R.q, Sym2R.bil] using hpos (1, 0) (by simp)
    have hne : (-S.b, S.a) ≠ (0, 0) := fun h ↦ ha.ne' (congrArg Prod.snd h)
    have hq : 0 < S.q (-S.b, S.a) := hpos (-S.b, S.a) hne
    have hid : S.q (-S.b, S.a) = S.a * S.det := by
      simp only [Sym2R.q, Sym2R.bil, Sym2R.det]
      ring
    rw [hid] at hq
    exact ⟨ha, by nlinarith⟩

/-- `I ± Re R ≻ 0` on an enclosed complex symmetric matrix `R`. -/
def TubePD (R : Sym2C) : Prop :=
  (Sym2R.add ⟨1, 0, 1⟩ (Sym2R.smul (-1) (SchurKernel.re R))).PD ∧
    (Sym2R.add ⟨1, 0, 1⟩ (SchurKernel.re R)).PD

private theorem tubePD_neg {R : Sym2C} (h : TubePD R) :
    TubePD ⟨-R.a, -R.b, -R.c⟩ := by
  have he1 : Sym2R.add ⟨1, 0, 1⟩ (Sym2R.smul (-1) (SchurKernel.re ⟨-R.a, -R.b, -R.c⟩)) =
      Sym2R.add ⟨1, 0, 1⟩ (SchurKernel.re R) := by
    simp only [Sym2R.add, Sym2R.smul, SchurKernel.re, Complex.neg_re]
    congr 1 <;> ring
  have he2 : Sym2R.add ⟨1, 0, 1⟩ (SchurKernel.re ⟨-R.a, -R.b, -R.c⟩) =
      Sym2R.add ⟨1, 0, 1⟩ (Sym2R.smul (-1) (SchurKernel.re R)) := by
    simp only [Sym2R.add, Sym2R.smul, SchurKernel.re, Complex.neg_re]
    congr 1 <;> ring
  exact ⟨he1 ▸ h.2, he2 ▸ h.1⟩

private theorem tubePD_conj {R : Sym2C} (h : TubePD R) :
    TubePD ⟨conj R.a, conj R.b, conj R.c⟩ := by
  have he : SchurKernel.re ⟨conj R.a, conj R.b, conj R.c⟩ = SchurKernel.re R := by
    simp only [SchurKernel.re, Complex.conj_re]
  simpa only [TubePD, he] using h

private theorem tubeOK_sound {R : Sym2C} {RI : SC} (hR : memSC R RI)
    (h : tubeOK RI = true) : TubePD R := by
  simp only [tubeOK, Bool.and_eq_true] at h
  have hone : memSR ⟨1, 0, 1⟩ ⟨intI 1, zeroI, intI 1⟩ :=
    ⟨by simpa using mem_intI 1, mem_zero, by simpa using mem_intI 1⟩
  have hre : memSR (SchurKernel.re R) (SC.re RI) := memSR_re hR
  exact ⟨PD_of_gate (memSR_add hone (memSR_smul mem_neg_one hre)) h.1,
    PD_of_gate (memSR_add hone hre) h.2⟩

private theorem tubeCover_sound {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℚ} :
    ∀ (depth : ℕ) (lo hi : ℤ),
      tubeCover (ofRatI r) (covarianceData MI p q) false depth lo hi = true →
      ∀ θ : ℝ, 2 * Real.arctan ((lo : ℝ) / D) ≤ θ → θ ≤ 2 * Real.arctan ((hi : ℝ) / D) →
        TubePD (covarianceCurve M p q ((r : ℂ) * Complex.exp (θ * Complex.I))) := by
  intro depth
  induction depth with
  | zero =>
    intro lo hi h θ hlo hhi
    simp only [tubeCover, Bool.or_false, Bool.and_eq_true] at h
    have hD := D_pos
    have htan := tan_half_mem hlo hhi
    have hs : mem (Real.tan (θ / 2)) ⟨lo, hi⟩ :=
      ⟨(div_le_iff₀ hD).1 htan.1, (le_div_iff₀ hD).1 htan.2⟩
    have hcb := memC_circleBox (mem_ofRatI r) hs h.1 false
    have hexp := exp_eq_chart
      (by linarith [hlo, Real.neg_pi_div_two_lt_arctan ((lo : ℝ) / D)] : -Real.pi < θ)
      (by linarith [hhi, Real.arctan_lt_pi_div_two ((hi : ℝ) / D)] : θ < Real.pi)
    have hpt : (r : ℂ) * Complex.exp (θ * Complex.I) =
        chartPt (r : ℝ) false (Real.tan (θ / 2)) := by
      rw [hexp, chartPt, sig_false]
      push_cast
      ring
    rw [hpt]
    exact tubeOK_sound (covarianceCurve_mem hM p q hcb) h.2
  | succ d ih =>
    intro lo hi h θ hlo hhi
    simp only [tubeCover, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with ⟨hpos, htube⟩ | ⟨hl, hr⟩
    · have hD := D_pos
      have htan := tan_half_mem hlo hhi
      have hs : mem (Real.tan (θ / 2)) ⟨lo, hi⟩ :=
        ⟨(div_le_iff₀ hD).1 htan.1, (le_div_iff₀ hD).1 htan.2⟩
      have hcb := memC_circleBox (mem_ofRatI r) hs hpos false
      have hexp := exp_eq_chart
        (by linarith [hlo, Real.neg_pi_div_two_lt_arctan ((lo : ℝ) / D)] : -Real.pi < θ)
        (by linarith [hhi, Real.arctan_lt_pi_div_two ((hi : ℝ) / D)] : θ < Real.pi)
      have hpt : (r : ℂ) * Complex.exp (θ * Complex.I) =
          chartPt (r : ℝ) false (Real.tan (θ / 2)) := by
        rw [hexp, chartPt, sig_false]
        push_cast
        ring
      rw [hpt]
      exact tubeOK_sound (covarianceCurve_mem hM p q hcb) htube
    · set mid := (lo + hi) / 2
      rcases le_total θ (2 * Real.arctan ((mid : ℝ) / D)) with hle | hle
      · exact ih lo mid hl θ hlo hle
      · exact ih mid hi hr θ hle hhi

private theorem tubePD_on_sphere_of_quarter {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℚ} {depth : ℕ}
    (h : CircleCheck.tubeQuarterOK MI p q r depth = true) :
    ∀ t ∈ Metric.sphere (0 : ℂ) (r : ℝ), TubePD (covarianceCurve M p q t) := by
  have hcov : ∀ θ : ℝ, 0 ≤ θ → θ ≤ Real.pi / 2 →
      TubePD (covarianceCurve M p q ((r : ℂ) * Complex.exp (θ * Complex.I))) := by
    intro θ h0 hpi
    have hD := D_pos
    have hq := tubeCover_sound hM (CircleCheck.trimQ p) (CircleCheck.trimQ q) depth 0 D h θ
      (by simpa using h0)
      (by rwa [div_self hD.ne', Real.arctan_one,
        show (2 : ℝ) * (Real.pi / 4) = Real.pi / 2 by ring])
    simpa only [covarianceCurve_trimQ] using hq
  intro t ht
  rw [Metric.mem_sphere, dist_zero_right] at ht
  have ht_polar : t = (r : ℂ) * Complex.exp ((t.arg : ℂ) * Complex.I) := by
    have hnorm := Complex.norm_mul_exp_arg_mul_I t
    rw [ht] at hnorm
    exact hnorm.symm
  have harg_lo : -Real.pi < t.arg := Complex.neg_pi_lt_arg t
  have harg_hi : t.arg ≤ Real.pi := Complex.arg_le_pi t
  rcases le_total 0 t.arg with h0 | h0
  · rcases le_total t.arg (Real.pi / 2) with h1 | h1
    · rw [ht_polar]
      exact hcov t.arg h0 h1
    · have h2 : 0 ≤ Real.pi - t.arg := by linarith
      have h3 : Real.pi - t.arg ≤ Real.pi / 2 := by linarith
      have heq : t = -(conj ((r : ℂ) * Complex.exp (((Real.pi - t.arg : ℝ) : ℂ) * Complex.I))) := by
        conv_lhs => rw [ht_polar]
        rw [map_mul, map_ratCast, ← Complex.exp_conj]
        simp only [map_mul, Complex.conj_ofReal, Complex.conj_I]
        have harg : -(((Real.pi - t.arg : ℝ) : ℂ) * Complex.I) =
            (t.arg : ℂ) * Complex.I - Real.pi * Complex.I := by push_cast; ring
        rw [mul_neg, harg, Complex.exp_sub, Complex.exp_pi_mul_I]
        ring
      rw [heq, covarianceCurve_neg, covarianceCurve_conj]
      exact tubePD_neg (tubePD_conj (hcov (Real.pi - t.arg) h2 h3))
  · rcases le_total (-(Real.pi / 2)) t.arg with h1 | h1
    · have h2 : 0 ≤ -t.arg := by linarith
      have h3 : -t.arg ≤ Real.pi / 2 := by linarith
      have heq : t = conj ((r : ℂ) * Complex.exp (((-t.arg : ℝ) : ℂ) * Complex.I)) := by
        conv_lhs => rw [ht_polar]
        rw [map_mul, map_ratCast, ← Complex.exp_conj]
        simp only [map_mul, Complex.ofReal_neg, map_neg, Complex.conj_ofReal, Complex.conj_I]
        congr 2
        ring
      rw [heq, covarianceCurve_conj]
      exact tubePD_conj (hcov (-t.arg) h2 h3)
    · have h2 : 0 ≤ t.arg + Real.pi := by linarith
      have h3 : t.arg + Real.pi ≤ Real.pi / 2 := by linarith
      have heq : t = -((r : ℂ) * Complex.exp (((t.arg + Real.pi : ℝ) : ℂ) * Complex.I)) := by
        conv_lhs => rw [ht_polar]
        have harg : ((t.arg + Real.pi : ℝ) : ℂ) * Complex.I =
            (t.arg : ℂ) * Complex.I + Real.pi * Complex.I := by push_cast; ring
        rw [harg, Complex.exp_add, Complex.exp_pi_mul_I]
        ring
      rw [heq, covarianceCurve_neg]
      exact tubePD_neg (hcov (t.arg + Real.pi) h2 h3)

/-- By the maximum modulus principle applied to `t ↦ exp(± vᵀ R(t) v)`, `I ± Re R ≻ 0` on
`|t| = r` propagates to the open ball `|t| < r`. -/
private theorem tubePD_on_ball_of_sphere (M : Sym2R) (p q : List ℚ) {r : ℝ} (hr0 : 0 < r)
    (hsph : ∀ t ∈ Metric.sphere (0 : ℂ) r, TubePD (covarianceCurve M p q t)) :
    ∀ t ∈ Metric.ball (0 : ℂ) r, TubePD (covarianceCurve M p q t) := by
  obtain ⟨hda, hdb, hdc⟩ := covarianceCurve_differentiable M p q
  intro t ht
  have hcomp : IsCompact (Metric.sphere (0 : ℂ) r) := isCompact_sphere 0 r
  have hne : (Metric.sphere (0 : ℂ) r).Nonempty :=
    ⟨(r : ℂ), by simp [abs_of_nonneg hr0.le]⟩
  have hbound : ∀ (sgn : ℝ), sgn = 1 ∨ sgn = -1 → ∀ v : ℝ × ℝ, v ≠ (0, 0) →
      sgn * (SchurKernel.re (covarianceCurve M p q t)).q v < v.1 ^ 2 + v.2 ^ 2 := by
    intro sgn hsgn v hv
    set g : ℂ → ℂ := fun z ↦ (sgn : ℂ) * (covarianceCurve M p q z).form v v
    have hgd : Differentiable ℂ g := by
      unfold g Sym2C.form
      exact (differentiable_const _).mul
        ((((hda.mul (differentiable_const _)).mul (differentiable_const _)).add
          (hdb.mul (differentiable_const _))).add
          ((hdc.mul (differentiable_const _)).mul (differentiable_const _)))
    have hf : Differentiable ℂ (fun z ↦ Complex.exp (g z)) := Complex.differentiable_exp.comp hgd
    have hgre : ∀ z : ℂ, (g z).re = sgn * (SchurKernel.re (covarianceCurve M p q z)).q v := fun z ↦ by
      simp only [g, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero,
        re_form]
    obtain ⟨z₀, hz₀, hmax⟩ := hcomp.exists_isMaxOn hne hf.continuous.norm.continuousOn
    have hle : ‖Complex.exp (g t)‖ ≤ ‖Complex.exp (g z₀)‖ :=
      Complex.norm_le_of_forall_mem_frontier_norm_le Metric.isBounded_ball hf.diffContOnCl
        (fun w hw ↦ hmax (Metric.frontier_ball_subset_sphere hw)) (subset_closure ht)
    rw [Complex.norm_exp, Complex.norm_exp, Real.exp_le_exp, hgre t, hgre z₀] at hle
    have hpd := hsph z₀ hz₀
    rcases hsgn with rfl | rfl
    · have hq := (PD_iff_form_pos _).mp hpd.1 v hv
      simp only [Sym2R.q, Sym2R.bil, Sym2R.add, Sym2R.smul] at hq
      simp only [Sym2R.q, Sym2R.bil] at hle ⊢
      linarith
    · have hq := (PD_iff_form_pos _).mp hpd.2 v hv
      simp only [Sym2R.q, Sym2R.bil, Sym2R.add] at hq
      simp only [Sym2R.q, Sym2R.bil] at hle ⊢
      linarith
  constructor
  · rw [PD_iff_form_pos]
    intro v hv
    have h1 := hbound 1 (Or.inl rfl) v hv
    simp only [Sym2R.q, Sym2R.bil, Sym2R.add, Sym2R.smul] at h1 ⊢
    linarith
  · rw [PD_iff_form_pos]
    intro v hv
    have h2 := hbound (-1) (Or.inr rfl) v hv
    simp only [Sym2R.q, Sym2R.bil, Sym2R.add] at h2 ⊢
    linarith

/-- If `A = I - σ Re R ≻ 0` for any real `σ`, then `det(I - σ R) ≠ 0` and `Re (I - σ R)⁻¹ ≻ 0`. -/
private theorem gates_of_tube {R : Sym2C} {σ : ℝ}
    (hA : (Sym2R.add ⟨1, 0, 1⟩ (Sym2R.smul (-σ) (SchurKernel.re R))).PD) :
    dpm R (σ : ℂ) ≠ 0 ∧ (SchurKernel.re (HardyArcSound.invIm R (σ : ℂ))).PD := by
  set A := Sym2R.add ⟨1, 0, 1⟩ (Sym2R.smul (-σ) (SchurKernel.re R))
  set m00 : ℂ := 1 - (σ : ℂ) * R.a
  set m01 : ℂ := -((σ : ℂ) * R.b)
  set m11 : ℂ := 1 - (σ : ℂ) * R.c
  have hherm : ∀ z₁ z₂ : ℂ,
      (conj z₁ * (m00 * z₁ + m01 * z₂) + conj z₂ * (m01 * z₁ + m11 * z₂)).re =
        A.q (z₁.re, z₂.re) + A.q (z₁.im, z₂.im) := fun z₁ z₂ ↦ by
    simp only [A, m00, m01, m11, Sym2R.q, Sym2R.bil, Sym2R.add, Sym2R.smul, SchurKernel.re,
      Complex.add_re, Complex.mul_re, Complex.sub_re, Complex.neg_re, Complex.conj_re,
      Complex.conj_im, Complex.one_re, Complex.one_im, Complex.ofReal_re, Complex.ofReal_im,
      Complex.add_im, Complex.mul_im, Complex.sub_im, Complex.neg_im]
    ring
  have hqnonneg : ∀ v : ℝ × ℝ, 0 ≤ A.q v := fun v ↦ by
    by_cases hv : v = (0, 0)
    · subst hv; simp [Sym2R.q, Sym2R.bil]
    · exact ((PD_iff_form_pos A).mp hA v hv).le
  have hherm_pos : ∀ z₁ z₂ : ℂ, (z₁, z₂) ≠ (0, 0) →
      0 < (conj z₁ * (m00 * z₁ + m01 * z₂) + conj z₂ * (m01 * z₁ + m11 * z₂)).re := by
    intro z₁ z₂ hz
    rw [hherm]
    by_cases hr : (z₁.re, z₂.re) = (0, 0)
    · have hi : (z₁.im, z₂.im) ≠ (0, 0) := by
        intro hi
        apply hz
        have h1 : z₁ = 0 := Complex.ext (congrArg Prod.fst hr) (congrArg Prod.fst hi)
        have h2 : z₂ = 0 := Complex.ext (congrArg Prod.snd hr) (congrArg Prod.snd hi)
        exact Prod.ext h1 h2
      linarith [hqnonneg (z₁.re, z₂.re), (PD_iff_form_pos A).mp hA _ hi]
    · linarith [(PD_iff_form_pos A).mp hA _ hr, hqnonneg (z₁.im, z₂.im)]
  have hdne : dpm R (σ : ℂ) ≠ 0 := by
    intro hd0
    have hdet : m00 * m11 - m01 * m01 = 0 := by
      have : m00 * m11 - m01 * m01 = dpm R (σ : ℂ) := by
        simp only [m00, m01, m11, dpm]; ring
      rw [this, hd0]
    by_cases hm : m00 = 0 ∧ m01 = 0
    · have hpos := hherm_pos 1 0 (by simp)
      simp [hm.1, hm.2] at hpos
    · have hz : (-m01, m00) ≠ (0, 0) := by
        intro h
        apply hm
        exact ⟨congrArg Prod.snd h, neg_eq_zero.mp (congrArg Prod.fst h)⟩
      have hpos := hherm_pos (-m01) m00 hz
      have hzero1 : m00 * (-m01) + m01 * m00 = 0 := by ring
      have hzero2 : m01 * (-m01) + m11 * m00 = 0 := by linear_combination hdet
      rw [hzero1, hzero2] at hpos
      simp at hpos
  refine ⟨hdne, (PD_iff_form_pos _).mpr fun x hx ↦ ?_⟩
  set S := HardyArcSound.invIm R (σ : ℂ)
  set z₁ : ℂ := S.a * (x.1 : ℂ) + S.b * (x.2 : ℂ)
  set z₂ : ℂ := S.b * (x.1 : ℂ) + S.c * (x.2 : ℂ)
  set d := dpm R (σ : ℂ)
  have hm1 : m00 * z₁ + m01 * z₂ = (x.1 : ℂ) := by
    have hd : d ≠ 0 := hdne
    have h1 : m00 * z₁ + m01 * z₂ =
        ((1 - (σ : ℂ) * R.a) * (1 - (σ : ℂ) * R.c) - ((σ : ℂ) * R.b) ^ 2) * (x.1 : ℂ) / d := by
      simp only [m00, m01, z₁, z₂, S, HardyArcSound.invIm, d]
      ring
    rw [h1]
    change d * (x.1 : ℂ) / d = (x.1 : ℂ)
    exact mul_div_cancel_left₀ _ hd
  have hm2 : m01 * z₁ + m11 * z₂ = (x.2 : ℂ) := by
    have hd : d ≠ 0 := hdne
    have h2 : m01 * z₁ + m11 * z₂ =
        ((1 - (σ : ℂ) * R.a) * (1 - (σ : ℂ) * R.c) - ((σ : ℂ) * R.b) ^ 2) * (x.2 : ℂ) / d := by
      simp only [m01, m11, z₁, z₂, S, HardyArcSound.invIm, d]
      ring
    rw [h2]
    change d * (x.2 : ℂ) / d = (x.2 : ℂ)
    exact mul_div_cancel_left₀ _ hd
  have hz : (z₁, z₂) ≠ (0, 0) := by
    intro h0
    obtain ⟨h1, h2⟩ := Prod.mk.inj h0
    rw [h1, h2] at hm1 hm2
    simp only [mul_zero, add_zero] at hm1 hm2
    exact hx (Prod.ext (Complex.ofReal_eq_zero.mp hm1.symm) (Complex.ofReal_eq_zero.mp hm2.symm))
  have hpos := hherm_pos z₁ z₂ hz
  rw [hm1, hm2] at hpos
  have hqeq : (SchurKernel.re S).q x = (conj z₁ * (x.1 : ℂ) + conj z₂ * (x.2 : ℂ)).re := by
    simp only [z₁, z₂, Sym2R.q, Sym2R.bil, SchurKernel.re, Complex.add_re, Complex.mul_re,
      Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im, Complex.add_im,
      Complex.mul_im]
    ring
  rw [hqeq]
  exact hpos

/-- A successful 1D quarter-circle tube cover at radius `r` certifies `KerPos` on the full open
ball `|t| < r` via oddness, conjugation symmetry, and the maximum modulus principle. -/
theorem covariance_kerPos_on_ball_of_tube {M : Sym2R} {MI : SR} (hM : memSR M MI)
    (p q : List ℚ) {r : ℚ} (hr0 : 0 < r) {depth : ℕ}
    (h : CircleCheck.tubeQuarterOK MI p q r depth = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (r : ℝ), ∃ l > 0, KerPos (covarianceCurve M p q t) l := by
  have hball := tubePD_on_ball_of_sphere M p q (by exact_mod_cast hr0)
    (tubePD_on_sphere_of_quarter hM p q h)
  intro t ht
  have hpd := hball t ht
  have hp := gates_of_tube (R := covarianceCurve M p q t) (σ := 1) (by simpa using hpd.1)
  have hm := gates_of_tube (R := covarianceCurve M p q t) (σ := -1) (by
    have he : Sym2R.smul (-(-1 : ℝ)) (SchurKernel.re (covarianceCurve M p q t)) =
        SchurKernel.re (covarianceCurve M p q t) := by
      simp [Sym2R.smul]
    simpa only [he] using hpd.2)
  exact kerPos_of_gates (by simpa using hp.1) (by simpa using hm.1)
    (by simpa using hp.2) (by simpa using hm.2)

end

end Grothe.UpperReplacement
