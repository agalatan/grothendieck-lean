import Grothe.UpperReplacement.Covariance
import Grothe.UpperReplacement.CircleCheck
import Grothe.UpperChaos.HardyGaussianSound
import Grothe.UpperChaos.SchurMainGaussian
import Mathlib.Analysis.Real.Pi.Bounds
import Grothe.UpperChaos.HardyReal
import Grothe.UpperReplacement.Pair
import Grothe.Haagerup.PhaseCoefficients

-- Section: CircleSound

set_option warningAsError true

/-!
# Sound adaptive circle means for the actual symmetric response pair

Agent-ID: codex-a7c4.

The quadrature proof is adapted from the reviewed local gemini-21d5 draft. Its covariance
adapter uses the generic curve proved here, and its Schur step bounds both response orientations
before averaging. The accepted leaves always use whole-box bounds; midpoint tightness only
chooses how far to subdivide.

Source SHA256: f866907223b6f6f337a68bbf9417bf3cbaf4ea7a71dc49984a98af5a3e5ea752
-/

namespace Grothe.UpperReplacement.CircleSound

open MeasureTheory ProbabilityTheory Complex Real Finset Polynomial
open GrotheKernel GrotheKernel.HardyArc Grothe.Upper Grothe.UpperChaos
open HardyArcSound HardyArcCircle SchurMain SchurKernel Sym2R CircleCheck
open scoped ComplexConjugate InnerProductSpace

noncomputable section

theorem gtRData_smoothing_eq (pl ql : List ℚ) :
    (gtRData pl ql).m00 = hardyData.m00 ∧
      (gtRData pl ql).m01 = hardyData.m01 ∧
      (gtRData pl ql).m11 = hardyData.m11 := ⟨rfl, rfl, rfl⟩

theorem gaussianDen_eq (j : Ival) (R : SC) :
    gaussianDen j R = HardyGaussianCheck.denOf j R := rfl

theorem gaussianBoxOK_eq (j : Ival) (R : SC) (cap : Ival) :
    gaussianBoxOK j R cap = HardyGaussianCheck.boxOK j R cap := rfl

private theorem memSC_Rbox_data {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {t : ℂ} {T : CI} (ht : memC t T) :
    memSC (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) (Rbox dat T) := by
  have he : covarianceData ⟨dat.m00, dat.m01, dat.m11⟩ pl ql = dat := by
    cases dat
    simp_all [covarianceData]
  rw [← he]
  exact covarianceCurve_mem ⟨hm00, hm01, hm11⟩ pl ql ht

private theorem differentiableOn_pair_covariance {F G : ℂ × ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hFb : ∀ u, ‖F u‖ ≤ 1) (hGb : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {U : Set ℂ} (hU : IsOpen U)
    (hpos : ∀ t ∈ U, ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l) :
    DifferentiableOn ℂ
      (fun t ↦ HholSymPair F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql t)) U := by
  obtain ⟨ha, hb, hc⟩ := covarianceCurve_differentiable ⟨m00, m01, m11⟩ pl ql
  exact differentiableOn_HholSymPair_curve hF hG hFb hGb hU
    ha.differentiableOn hb.differentiableOn hc.differentiableOn hpos

/-- Squared correlation along half-circle chart `neg` at radius `rho`. -/
def pairCircleValue (F G : ℂ × ℂ → ℂ) (R : ℂ → Sym2C) (rho : ℝ) (neg : Bool) (θ : ℝ) : ℝ :=
  ‖HholSymPair F G (R (HardyArcSound.sig neg * (rho : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2

lemma pairCircleValue_intervalIntegrable {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 rho r : ℝ} {pl ql : List ℚ} (hρ0 : 0 ≤ rho) (hr : rho < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    (neg : Bool) (a b : ℝ) :
    IntervalIntegrable (pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) rho neg) volume a b := by
  have hd := differentiableOn_pair_covariance hFm hGm hF hG Metric.isOpen_ball hU
  have hmaps : ∀ θ : ℝ, HardyArcSound.sig neg * (rho : ℂ) * Complex.exp (θ * Complex.I) ∈
      Metric.ball (0 : ℂ) r := fun θ => by
    rw [Metric.mem_ball, dist_zero_right, norm_mul, norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one]
    have hs : ‖HardyArcSound.sig neg‖ = 1 := by cases neg <;> simp [HardyArcSound.sig]
    rw [hs, one_mul, Complex.norm_of_nonneg hρ0]
    exact hr
  have hcont : Continuous fun θ : ℝ =>
      HardyArcSound.sig neg * (rho : ℂ) * Complex.exp (θ * Complex.I) := by fun_prop
  exact ((continuous_norm.comp (hd.continuousOn.comp_continuous hcont hmaps)).pow 2).intervalIntegrable a b

lemma ceilDiv_sound (a b : ℤ) (hb : 0 < b) : (a : ℝ) / (b : ℝ) ≤ (ceilDiv a b : ℝ) := by
  have hbR : (0 : ℝ) < (b : ℝ) := by exact_mod_cast hb
  rw [div_le_iff₀ hbR]
  set q : ℤ := (-a) / b
  have hq : q * b ≤ -a := Int.ediv_mul_le (-a) hb.ne'
  have hqR : (q : ℝ) * (b : ℝ) ≤ -(a : ℝ) := by exact_mod_cast hq
  have hc : (ceilDiv a b : ℝ) = -(q : ℝ) := by
    change ((-((-a) / b) : ℤ) : ℝ) = -(q : ℝ)
    rw [Int.cast_neg]
  rw [hc]
  linarith

lemma shUp_sound (x : ℤ) : (x : ℝ) / (D : ℝ) ≤ (shUp x : ℝ) := by
  have hD : (0 : ℤ) < D := by exact_mod_cast D_pos
  change (x : ℝ) / (D : ℝ) ≤ (ceilDiv x D : ℝ)
  exact ceilDiv_sound x D hD

lemma arcLenUp_sound {lo hi : ℤ} (h : lo ≤ hi) (hs : 0 ≤ lo ∨ hi ≤ 0) :
    2 * Real.arctan ((hi : ℝ) / D) - 2 * Real.arctan ((lo : ℝ) / D) ≤ (arcLenUp lo hi : ℝ) / D := by
  have hD := D_pos
  have hab : (lo : ℝ) / D ≤ (hi : ℝ) / D := div_le_div_of_nonneg_right (by exact_mod_cast h) hD.le
  have hsR : 0 ≤ (lo : ℝ) / D ∨ (hi : ℝ) / D ≤ 0 := by
    rcases hs with h0 | h0
    · exact Or.inl (div_nonneg (by exact_mod_cast h0) hD.le)
    · exact Or.inr (div_nonpos_of_nonpos_of_nonneg (by exact_mod_cast h0) hD.le)
  have harc := arctan_sub_le hab hsR
  have hmin : min (((lo : ℝ) / D) ^ 2) (((hi : ℝ) / D) ^ 2) =
      ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2 := by
    rw [div_pow, div_pow, min_div_div_right (sq_nonneg (D : ℝ))]
    simp only [Int.cast_min, Int.cast_mul, pow_two]
  have hden0 : (0 : ℤ) < D * D + min (lo * lo) (hi * hi) := by
    have hD2 : (0 : ℤ) < D * D := mul_pos (by exact_mod_cast hD) (by exact_mod_cast hD)
    have hm : 0 ≤ min (lo * lo) (hi * hi) := le_min (mul_self_nonneg _) (mul_self_nonneg _)
    omega
  have hdenR : (0 : ℝ) < (D : ℝ) ^ 2 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) := by
    have : (0 : ℝ) < ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ) := by exact_mod_cast hden0
    simpa only [Int.cast_add, Int.cast_mul, pow_two] using this
  have halg : 2 * (((hi : ℝ) / D - (lo : ℝ) / D) /
      (1 + ((min (lo * lo) (hi * hi) : ℤ) : ℝ) / (D : ℝ) ^ 2)) =
      (((2 * (hi - lo) * D * D : ℤ) : ℝ) /
        ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ)) / D := by
    push_cast
    field_simp
  calc 2 * Real.arctan ((hi : ℝ) / D) - 2 * Real.arctan ((lo : ℝ) / D)
      = 2 * (Real.arctan ((hi : ℝ) / D) - Real.arctan ((lo : ℝ) / D)) := by ring
    _ ≤ 2 * (((hi : ℝ) / D - (lo : ℝ) / D) /
        (1 + min (((lo : ℝ) / D) ^ 2) (((hi : ℝ) / D) ^ 2))) := by linarith
    _ = (((2 * (hi - lo) * D * D : ℤ) : ℝ) /
        ((D * D + min (lo * lo) (hi * hi) : ℤ) : ℝ)) / D := by rw [hmin, halg]
    _ ≤ (arcLenUp lo hi : ℝ) / D :=
        div_le_div_of_nonneg_right (ceilDiv_sound _ _ hden0) hD.le

lemma gaussVal_sound {R : Sym2C} {RI : SC} {j : ℝ} {jI : Ival} {v : ℤ}
    (hR : memSC R RI) (hj : mem j jI) (hg : gaussVal jI RI = some v) :
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧
      1 / HardyGaussianSound.denominator R j ≤ (v : ℝ) / D := by
  rw [gaussVal_eq_spec] at hg
  dsimp only at hg
  split_ifs at hg with hp hb
  try contradiction
  injection hg with hv
  rw [hv] at hb
  have hmem : mem ((v : ℝ) / D) ⟨v, v⟩ := by
    have hD := D_pos.ne'
    exact ⟨by field_simp; rfl, by field_simp; rfl⟩
  rw [gaussianBoxOK_eq] at hb
  exact HardyGaussianSound.box_sound hR hj hmem hb

lemma leafGauss_sound {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ : ℚ} {r : ℝ} (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    {neg : Bool} {w tol : ℤ} {last : Bool} {lo hi out : ℤ}
    (hlo_hi : lo ≤ hi) (hsign : 0 ≤ lo ∨ hi ≤ 0)
    (hl : leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol last lo hi = some out) :
    ∫ θ in (2 * Real.arctan ((lo : ℝ) / D))..(2 * Real.arctan ((hi : ℝ) / D)),
      pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) (rhoQ : ℝ) neg θ ≤ (out : ℝ) / D := by
  have hD := D_pos
  unfold leafGauss at hl
  split_ifs at hl with hcond; try contradiction
  simp only [Bool.and_eq_true] at hcond
  obtain ⟨_, hpos_s⟩ := hcond
  cases hgv : gaussVal (ofRatI jQ) (Rbox dat (circleBox (ofRatI rhoQ) neg ⟨lo, hi⟩)) with
  | none => rw [hgv] at hl; simp at hl
  | some v =>
    rw [hgv] at hl
    dsimp only at hl
    split_ifs at hl with hacc; try contradiction
    injection hl with hout
    subst hout
    set a := 2 * Real.arctan ((lo : ℝ) / D)
    set b := 2 * Real.arctan ((hi : ℝ) / D)
    have hab : a ≤ b := by
      dsimp only [a, b]
      have : (lo : ℝ) / D ≤ (hi : ℝ) / D :=
        div_le_div_of_nonneg_right (by exact_mod_cast hlo_hi) hD.le
      linarith [Real.arctan_mono this]
    have hpt : ∀ θ ∈ Set.Icc a b,
        pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) (rhoQ : ℝ) neg θ ≤ (v : ℝ) / D := by
      intro θ hθ
      have htan := tan_half_mem hθ.1 hθ.2
      have hs_mem : mem (Real.tan (θ / 2)) ⟨lo, hi⟩ := by
        constructor
        · exact (div_le_iff₀ hD).1 htan.1
        · exact (le_div_iff₀ hD).1 htan.2
      have hcb := memC_circleBox (mem_ofRatI rhoQ) hs_mem hpos_s neg
      have hR := memSC_Rbox_data hm00 hm01 hm11 hP hQ hcb
      obtain ⟨hZ, hT, hden⟩ := gaussVal_sound hR (mem_ofRatI jQ) hgv
      have hexp := exp_eq_chart
        (by linarith [hθ.1, Real.neg_pi_div_two_lt_arctan ((lo : ℝ) / D)] : -Real.pi < θ)
        (by linarith [hθ.2, Real.arctan_lt_pi_div_two ((hi : ℝ) / D)] : θ < Real.pi)
      have hchart : HardyArcSound.sig neg * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) =
          chartPt (rhoQ : ℝ) neg (Real.tan (θ / 2)) := by
        rw [hexp, chartPt]; push_cast; ring
      unfold pairCircleValue
      rw [hchart]
      exact (norm_HholSymPair_sq_le
        (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG)
        (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hGm hFm hG hF)).trans hden
    have hv0 : 0 ≤ (v : ℝ) / D :=
      (sq_nonneg _).trans (hpt a ⟨le_rfl, hab⟩)
    have hint := pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU neg a b
    calc ∫ θ in a..b, pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) (rhoQ : ℝ) neg θ
        ≤ ∫ _ in a..b, ((v : ℝ) / D) :=
          intervalIntegral.integral_mono_on hab hint intervalIntegrable_const hpt
      _ = (b - a) * ((v : ℝ) / D) := by
        simp only [intervalIntegral.integral_const, smul_eq_mul]
      _ ≤ ((arcLenUp lo hi : ℝ) / D) * ((v : ℝ) / D) :=
          mul_le_mul_of_nonneg_right (arcLenUp_sound hlo_hi hsign) hv0
      _ = (((v * arcLenUp lo hi : ℤ) : ℝ) / D) / D := by push_cast; ring
      _ ≤ (shUp (v * arcLenUp lo hi) : ℝ) / D :=
          div_le_div_of_nonneg_right (shUp_sound _) hD.le

theorem coverGauss_sound {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ : ℚ} {r : ℝ} (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    (neg : Bool) (w tol : ℤ) :
    ∀ (depth : ℕ) (lo hi out : ℤ), lo ≤ hi → (0 ≤ lo ∨ hi ≤ 0) →
      coverGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol depth lo hi = some out →
      ∫ θ in (2 * Real.arctan ((lo : ℝ) / D))..(2 * Real.arctan ((hi : ℝ) / D)),
        pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) (rhoQ : ℝ) neg θ ≤ (out : ℝ) / D := by
  intro depth
  induction depth with
  | zero =>
    intro lo hi out hlo_hi hsign hc
    unfold coverGauss at hc
    change (match leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol true lo hi with
      | some x => some x | none => none) = some out at hc
    cases hl : leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol true lo hi with
    | none => rw [hl] at hc; simp at hc
    | some x =>
      rw [hl] at hc
      injection hc with hx
      subst hx
      exact leafGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU hlo_hi hsign hl
  | succ d ih =>
    intro lo hi out hlo_hi hsign hc
    unfold coverGauss at hc
    cases hl : leafGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol (d + 1 == 0) lo hi with
    | some x =>
      rw [hl] at hc
      injection hc with hx
      subst hx
      exact leafGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU hlo_hi hsign hl
    | none =>
      rw [hl] at hc
      dsimp only at hc
      set mid := (lo + hi) / 2
      cases hc1 : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol d lo mid with
      | none => rw [hc1] at hc; simp at hc
      | some x =>
        rw [hc1] at hc
        cases hc2 : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat neg w tol d mid hi with
        | none => rw [hc2] at hc; simp at hc
        | some y =>
          rw [hc2] at hc
          injection hc with hxy
          subst hxy
          have hmid1 : lo ≤ mid := by omega
          have hmid2 : mid ≤ hi := by omega
          have hs1 : 0 ≤ lo ∨ mid ≤ 0 := by rcases hsign with h0 | h0 <;> omega
          have hs2 : 0 ≤ mid ∨ hi ≤ 0 := by rcases hsign with h0 | h0 <;> omega
          have hi1 := ih lo mid x hmid1 hs1 hc1
          have hi2 := ih mid hi y hmid2 hs2 hc2
          rw [← intervalIntegral.integral_add_adjacent_intervals
            (pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU neg _ _)
            (pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU neg _ _)
            (b := 2 * Real.arctan ((mid : ℝ) / D))]
          calc _ ≤ (x : ℝ) / D + (y : ℝ) / D := add_le_add hi1 hi2
            _ = ((x + y : ℤ) : ℝ) / D := by push_cast; ring

theorem hmean_of_circleMeanOK {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ budgetQ : ℚ} {r : ℝ} {depth : ℕ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    (hc : circleMeanOK dat rhoQ jQ budgetQ depth = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholSymPair F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql
        (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ (budgetQ : ℝ) := by
  have hD := D_pos
  have hD0 : (0 : ℤ) ≤ D := by exact_mod_cast hD.le
  unfold circleMeanOK at hc
  dsimp only at hc
  cases ha : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) (D / 40) depth (-D) 0 with
  | none => rw [ha] at hc; simp at hc
  | some a =>
  rw [ha] at hc
  cases hb : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) (D / 40) depth 0 D with
  | none => rw [hb] at hc; simp at hc
  | some b =>
  rw [hb] at hc
  cases hc' : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) (D / 40) depth (-D) 0 with
  | none => rw [hc'] at hc; simp at hc
  | some c =>
  rw [hc'] at hc
  cases hd : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) (D / 40) depth 0 D with
  | none => rw [hd] at hc; simp at hc
  | some d =>
  rw [hd, decide_eq_true_eq] at hc
  have ia := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64) (D / 40)
    depth (-D) 0 a (by omega) (Or.inr le_rfl) ha
  have ib := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64) (D / 40)
    depth 0 D b hD0 (Or.inl le_rfl) hb
  have ic := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64) (D / 40)
    depth (-D) 0 c (by omega) (Or.inr le_rfl) hc'
  have id' := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64) (D / 40)
    depth 0 D d hD0 (Or.inl le_rfl) hd
  have e_neg : 2 * Real.arctan (((-D : ℤ) : ℝ) / D) = -(Real.pi / 2) := by
    rw [Int.cast_neg, neg_div_self hD.ne', Real.arctan_neg, Real.arctan_one]; ring
  have e_zero : 2 * Real.arctan (((0 : ℤ) : ℝ) / D) = 0 := by simp
  have e_pos : 2 * Real.arctan ((D : ℝ) / D) = Real.pi / 2 := by
    rw [div_self hD.ne', Real.arctan_one]; ring
  rw [e_neg, e_zero] at ia ic
  rw [e_zero, e_pos] at ib id'
  set R := covarianceCurve ⟨m00, m01, m11⟩ pl ql
  have hint := pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU
  have hfalse : ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) false θ ≤
      ((a + b : ℤ) : ℝ) / D := by
    rw [← intervalIntegral.integral_add_adjacent_intervals (hint false _ _) (hint false _ _) (b := 0)]
    calc _ ≤ (a : ℝ) / D + (b : ℝ) / D := add_le_add ia ib
      _ = ((a + b : ℤ) : ℝ) / D := by push_cast; ring
  have htrue : ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ ≤
      ((c + d : ℤ) : ℝ) / D := by
    rw [← intervalIntegral.integral_add_adjacent_intervals (hint true _ _) (hint true _ _) (b := 0)]
    calc _ ≤ (c : ℝ) / D + (d : ℝ) / D := add_le_add ic id'
      _ = ((c + d : ℤ) : ℝ) / D := by push_cast; ring
  have hf : (fun θ : ℝ => ‖HholSymPair F G (R (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2) =
      pairCircleValue F G R (rhoQ : ℝ) false := by
    funext θ; simp [pairCircleValue, HardyArcSound.sig]
  rw [hf]
  have hper : Function.Periodic (pairCircleValue F G R (rhoQ : ℝ) false) (2 * Real.pi) := fun θ => by
    simp only [pairCircleValue]; congr 4; push_cast
    rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
  have hshift : ∫ θ in (0 : ℝ)..2 * Real.pi, pairCircleValue F G R (rhoQ : ℝ) false θ =
      ∫ θ in (-(Real.pi / 2))..(-(Real.pi / 2) + 2 * Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ := by
    simpa using hper.intervalIntegral_add_eq 0 (-(Real.pi / 2))
  rw [hshift, ← intervalIntegral.integral_add_adjacent_intervals
    (hint false _ _) (hint false _ _) (b := Real.pi / 2)]
  have hsecond : ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ =
      ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ := by
    have e : ∀ θ : ℝ, pairCircleValue F G R (rhoQ : ℝ) false (θ + Real.pi) = pairCircleValue F G R (rhoQ : ℝ) true θ := by
      intro θ
      simp only [pairCircleValue, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul]
      congr 4; push_cast
      rw [add_mul, Complex.exp_add, Complex.exp_pi_mul_I]; ring
    calc ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ
        = ∫ θ in (-(Real.pi / 2) + Real.pi)..(Real.pi / 2 + Real.pi), pairCircleValue F G R (rhoQ : ℝ) false θ := by
          congr 1 <;> ring
      _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) false (θ + Real.pi) :=
          (intervalIntegral.integral_comp_add_right (pairCircleValue F G R (rhoQ : ℝ) false) Real.pi).symm
      _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ := by simp only [e]
  rw [hsecond, inv_mul_le_iff₀ (by positivity)]
  have hsum : ((a + b + c + d : ℤ) : ℝ) / D ≤ 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) := by
    rw [div_le_iff₀ hD]
    have h1 : ((a + b + c + d : ℤ) : ℝ) ≤ (ofRatLo (2 * piLo20Q * budgetQ) : ℝ) := by exact_mod_cast hc
    have h2 := ofRatLo_le (2 * piLo20Q * budgetQ)
    push_cast at h2
    linarith
  have hpi : (piLo20Q : ℝ) ≤ Real.pi := by
    have hp := Real.pi_gt_d20
    have heq : (piLo20Q : ℝ) = 3.14159265358979323846 := by norm_num [piLo20Q]
    linarith
  have h2pi : 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) ≤ 2 * Real.pi * (budgetQ : ℝ) :=
    mul_le_mul_of_nonneg_right (by linarith) hB0
  have habcd : ((a + b : ℤ) : ℝ) / D + ((c + d : ℤ) : ℝ) / D = ((a + b + c + d : ℤ) : ℝ) / D := by
    push_cast; ring
  linarith


end

end Grothe.UpperReplacement.CircleSound

-- Section: RealIdentification

set_option warningAsError true

/-!
# Real-axis identification of the separate left and right cell responses

Agent-ID: codex-a7c4.

The Gaussian product-law calculation is adapted from the local gemini-21d5 unsmoothed draft,
with distinct functions in the two slots. Averaging the two actual orientations then identifies
precisely the real cross-energy sequence used by the certificate.
-/

open MeasureTheory Real Polynomial
open scoped ComplexConjugate

namespace Grothe.UpperReplacement

open UpperChaos Upper

noncomputable section

theorem covarianceCurve_real (M : Sym2R) (pl ql : List ℚ) (t : ℝ) :
    covarianceCurve M pl ql (t : ℂ) =
      HardyReal.Rre (M.a ^ 2 * (t * (ofListQ pl).eval (t ^ 2)) + M.b ^ 2 * (t * (ofListQ ql).eval (t ^ 2)))
        (M.a * M.b * (t * (ofListQ pl).eval (t ^ 2)) + M.b * M.c * (t * (ofListQ ql).eval (t ^ 2)))
        (M.b ^ 2 * (t * (ofListQ pl).eval (t ^ 2)) + M.c ^ 2 * (t * (ofListQ ql).eval (t ^ 2))) := by
  have ev (P : ℝ[X]) : Polynomial.aeval ((t : ℂ) ^ 2) P = ((P.eval (t ^ 2) : ℝ) : ℂ) := by
    rw [← Complex.ofReal_pow]
    exact (Polynomial.ofReal_eval (K := ℂ) _ _).symm
  simp only [covarianceCurve, HardyReal.Rre, ev]
  push_cast
  ring_nf

theorem mehler_pair_real {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF1 : ∀ u, ‖F u‖ ≤ 1) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    {p q : ℝ} (hp_lt : p ^ 2 < 1) (hq_lt : q ^ 2 < 1) :
    (∫ ω, conj (F (Xof ω)) * G (Yof p q ω) ∂mu4) = HholPair F G (HardyReal.Rre p 0 q) := by
  have hk11 : 0 < HardyReal.k11 p 0 := by simp only [HardyReal.k11]; nlinarith
  have hkdet : 0 < HardyReal.kdet p 0 q := by
    have he : HardyReal.kdet p 0 q = (1 - p ^ 2) * (1 - q ^ 2) := by
      simp only [HardyReal.kdet, HardyReal.k11, HardyReal.k12, HardyReal.k22]; ring
    rw [he]; exact mul_pos (by linarith) (by linarith)
  set hGpair : (ℂ × ℂ) × (ℂ × ℂ) → ℂ := fun z => conj (F z.1) * G z.2
  have hm_pair : Measurable hGpair :=
    (Complex.continuous_conj.measurable.comp (hFm.comp measurable_fst)).mul (hGm.comp measurable_snd)
  have hn_pair : ∀ z, ‖hGpair z‖ ≤ 1 := fun z => by
    dsimp only [hGpair]
    rw [norm_mul, Complex.norm_conj]
    exact (mul_le_mul (hF1 z.1) (hG1 z.2) (norm_nonneg _) zero_le_one).trans_eq (one_mul 1)
  let shuffle : ((ℂ × ℂ) × (ℂ × ℂ)) ≃ᵐ ((ℂ × ℂ) × (ℂ × ℂ)) :=
    MeasurableEquiv.ofInvolutive HardyReal.shuffle (fun _ => rfl)
      (by unfold HardyReal.shuffle; fun_prop)
  have hmp : MeasurePreserving shuffle mu4 (mu2.prod mu2) :=
    HardyReal.measurePreserving_shuffle_prod Grothe.LowerAnalytic.gaussC
  have hs11 : HardyReal.s11 p 0 = √(1 - p ^ 2) := by simp [HardyReal.s11, HardyReal.k11]
  have hs21 : HardyReal.s21 p 0 q = 0 := by simp [HardyReal.s21, HardyReal.k12]
  have hs22 : HardyReal.s22 p 0 q = √(1 - q ^ 2) := by
    have hne : 1 - p ^ 2 ≠ 0 := by linarith
    have hdet : HardyReal.kdet p 0 q = (1 - p ^ 2) * (1 - q ^ 2) := by
      simp only [HardyReal.kdet, HardyReal.k11, HardyReal.k12, HardyReal.k22]
      ring
    rw [HardyReal.s22, hdet]
    simp only [HardyReal.k11, zero_pow (by decide : 2 ≠ 0), sub_zero]
    rw [mul_div_cancel_left₀ _ hne]
  have hmeh : ∫ ω, conj (F (Xof ω)) * G (Yof p q ω) ∂mu4 = HholPair F G (HardyReal.Rre p 0 q) := by
    have hswap := hmp.integral_comp' (fun ω => hGpair (Xof ω, Yof p q ω))
    change ∫ v, hGpair (Xof (shuffle v), Yof p q (shuffle v)) ∂(mu2.prod mu2) =
      ∫ ω, hGpair (Xof ω, Yof p q ω) ∂mu4 at hswap
    rw [← hswap]
    have hpt : ∀ v : (ℂ × ℂ) × (ℂ × ℂ),
        (Xof (shuffle v),
         Yof p q (shuffle v)) =
        (v.1, HardyReal.mulRc p 0 q v.1 + HardyReal.mulSc p 0 q v.2) := fun v => by
      have hsig_p : Grothe.UpperChaos.sig (p : ℂ) = ((√(1 - p ^ 2) : ℝ) : ℂ) := by
        simp [Grothe.UpperChaos.sig, Complex.norm_real, sq_abs]
      have hsig_q : Grothe.UpperChaos.sig (q : ℂ) = ((√(1 - q ^ 2) : ℝ) : ℂ) := by
        simp [Grothe.UpperChaos.sig, Complex.norm_real, sq_abs]
      rw [show shuffle v = HardyReal.shuffle v from rfl]
      simp only [HardyReal.shuffle, Xof, Yof, mY,
        HardyReal.mulRc, HardyReal.mulSc, hs11, hs21, hs22, hsig_p, hsig_q]
      ext <;> simp
    simp_rw [hpt]
    have hint : Integrable (fun v : (ℂ × ℂ) × (ℂ × ℂ) ↦
        hGpair (v.1, HardyReal.mulRc p 0 q v.1 + HardyReal.mulSc p 0 q v.2)) (mu2.prod mu2) :=
      HardyReal.integrable_of_le_one
        (hm_pair.comp (measurable_fst.prodMk
        (((by unfold HardyReal.mulRc; fun_prop : Measurable (HardyReal.mulRc p 0 q)).comp measurable_fst).add
          ((by unfold HardyReal.mulSc; fun_prop : Measurable (HardyReal.mulSc p 0 q)).comp measurable_snd))))
        (fun _ => hn_pair _)
    rw [integral_prod _ hint]
    rw [HardyReal.integral_pair_eq_kHol hk11 hkdet hm_pair hn_pair]
    rfl
  exact hmeh

/-- The radial power series at a nonnegative real argument, independently of the response. -/
theorem hasSum_odd_radial {h : ℕ → ℝ} (hs : Summable fun n ↦ |h n|)
    {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    HasSum (fun n ↦ (h n : ℂ) * (t : ℂ) ^ (2 * n + 1)) (radialKernel h t) := by
  have hz : ‖(t : ℂ)‖ ≤ 1 := by simpa only [Complex.norm_real, Real.norm_of_nonneg ht0] using ht1
  have he : ∀ n, (h n : ℂ) * ((t : ℂ) * (‖(t : ℂ)‖ : ℂ) ^ (2 * n)) =
      (h n : ℂ) * (t : ℂ) ^ (2 * n + 1) := by
    intro n
    rw [Complex.norm_real, Real.norm_of_nonneg ht0]
    ring
  have hsum := (summable_radial_term hs hz).hasSum
  simp_rw [he] at hsum
  simpa only [radialKernel, he] using hsum

/-- The actual pair continuation has exactly the signed coefficients used in the finite head. -/
theorem hreal_cell_pair {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF1 : ∀ u, ‖F u‖ ≤ 1) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hFc : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    (hGc : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u)
    (hFL : MemLp F 2 mu2) (hGL : MemLp G 2 mu2)
    {pl ql : List ℚ} (hP : Grothe.l1 (ofListQ pl) ≤ 1) (hQ : Grothe.l1 (ofListQ ql) ≤ 1)
    (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j ↦ (bivarKernel (ofListQ pl) (ofListQ ql)
        (pairEnergy (hFL.toLp F) (hGL.toLp G)) j : ℂ) * (t : ℂ) ^ (2 * j + 1))
      (HholSymPair F G (covarianceCurve ⟨1, 0, 1⟩ pl ql t)) := by
  let p := t * (ofListQ pl).eval (t ^ 2)
  let q := t * (ofListQ ql).eval (t ^ 2)
  have hp := HardyReal.abs_mul_eval_le hP ht0.le ht1.le
  have hq := HardyReal.abs_mul_eval_le hQ ht0.le ht1.le
  have hp_lt : p ^ 2 < 1 := by
    have := sq_le_sq' (abs_le.mp hp).1 (abs_le.mp hp).2
    nlinarith
  have hq_lt : q ^ 2 < 1 := by
    have := sq_le_sq' (abs_le.mp hq).1 (abs_le.mp hq).2
    nlinarith
  have hz : ‖(t : ℂ)‖ ≤ 1 := by
    rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]
    exact ht1.le
  have hB := Bm_pair_polyKernel (chargeOne_toLp hFL hFc) (chargeOne_toLp hGL hGc)
    hP hQ hz (norm_polyKernel_le hP hz) (norm_polyKernel_le hQ hz)
  rw [Bm_pair_toLp hFL hGL, Bm_pair_toLp hGL hFL,
    HardyReal.polyKernel_real _ ht0.le, HardyReal.polyKernel_real _ ht0.le] at hB
  rw [mehler_pair_real hFm hGm hF1 hG1 hp_lt hq_lt,
    mehler_pair_real hGm hFm hG1 hF1 hp_lt hq_lt] at hB
  have hR : covarianceCurve ⟨1, 0, 1⟩ pl ql (t : ℂ) = HardyReal.Rre p 0 q := by
    rw [covarianceCurve_real]
    congr 1 <;> dsimp only [p, q] <;> ring
  rw [hR, HholSymPair, hB]
  exact hasSum_odd_radial
    (summable_abs_bivarKernel _ _ hP hQ _ (summable_abs_pairEnergy _ _)) ht0.le ht1.le

/-- Real identification for `GT` with arbitrary preprocessors `((ofListQ pl), (ofListQ ql))` (`l1 ≤ 1`). -/
theorem hreal_gt_channel (hφ : PhiBound) {pl ql : List ℚ} (hP : Grothe.l1 (ofListQ pl) ≤ 1) (hQ : Grothe.l1 (ofListQ ql) ≤ 1)
    (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1) :
    HasSum (fun j => (bivarKernel (ofListQ pl) (ofListQ ql) (energy ((memLp_GT hφ).toLp GT)) j : ℂ) * (t : ℂ) ^ (2 * j + 1))
      (HholPair Tround Tround (covarianceCurve ⟨m00, m01, m11⟩ pl ql t)) := by
  set p := t * (ofListQ pl).eval (t ^ 2)
  set q := t * (ofListQ ql).eval (t ^ 2)
  have hp_t : |p| ≤ t := HardyReal.abs_mul_eval_le hP ht0.le ht1.le
  have hq_t : |q| ≤ t := HardyReal.abs_mul_eval_le hQ ht0.le ht1.le
  have hp1 : |p| ≤ 1 := hp_t.trans ht1.le
  have hq1 : |q| ≤ 1 := hq_t.trans ht1.le
  have hP_norm : ‖Grothe.polyKernel (ofListQ pl) (t : ℂ)‖ ≤ 1 := by
    rw [HardyReal.polyKernel_real (ofListQ pl) ht0.le, Complex.norm_real, Real.norm_eq_abs]; exact hp1
  have hQ_norm : ‖Grothe.polyKernel (ofListQ ql) (t : ℂ)‖ ≤ 1 := by
    rw [HardyReal.polyKernel_real (ofListQ ql) ht0.le, Complex.norm_real, Real.norm_eq_abs]; exact hq1
  have hz : ‖(t : ℂ)‖ ≤ 1 := by rw [Complex.norm_real, Real.norm_of_nonneg ht0.le]; exact ht1.le
  have hB := Bm_polyKernel (chargeOne_toLp (memLp_GT hφ) fun c u hc => GT_rot2 hc u)
    hP hQ hz hP_norm hQ_norm
  rw [Bm_toLp (memLp_GT hφ) hP_norm hQ_norm, HardyReal.polyKernel_real (ofListQ pl) ht0.le,
    HardyReal.polyKernel_real (ofListQ ql) ht0.le] at hB
  change ∫ ω, conj (GT (Xof ω)) * GT (Yof p q ω) ∂mu4 = _ at hB
  -- `I - R² ≻ 0` on `(0, 1)`:
  set a := m00 ^ 2 * p + m01 ^ 2 * q
  set b := m00 * m01 * p + m01 * m11 * q
  set c := m01 ^ 2 * p + m11 ^ 2 * q
  have hK : ∀ x₁ x₂ : ℝ, (1 - t ^ 2) * (x₁ ^ 2 + x₂ ^ 2) ≤
      HardyReal.k11 a b * x₁ ^ 2 + 2 * HardyReal.k12 a b c * x₁ * x₂ + HardyReal.k22 b c * x₂ ^ 2 := by
    intro x₁ x₂
    have := HardyReal.normR_le hp_t hq_t x₁ x₂
    simp only [HardyReal.k11, HardyReal.k12, HardyReal.k22, a, b, c] at *
    nlinarith
  have hk11 : 0 < HardyReal.k11 a b := by have := hK 1 0; nlinarith
  have hkdet : 0 < HardyReal.kdet a b c := by
    have h := hK (-HardyReal.k12 a b c) (HardyReal.k11 a b)
    have e : HardyReal.k11 a b * (-HardyReal.k12 a b c) ^ 2
        + 2 * HardyReal.k12 a b c * (-HardyReal.k12 a b c) * HardyReal.k11 a b
        + HardyReal.k22 b c * HardyReal.k11 a b ^ 2 =
        HardyReal.k11 a b * HardyReal.kdet a b c := by simp only [HardyReal.kdet]; ring
    rw [e] at h
    have hpos : 0 < (1 - t ^ 2) * ((-HardyReal.k12 a b c) ^ 2 + HardyReal.k11 a b ^ 2) := by
      have : 0 < 1 - t ^ 2 := by nlinarith
      positivity
    exact (pos_iff_pos_of_mul_pos (hpos.trans_le h)).1 hk11
  have hmeh : ∫ ω, conj (GT (Xof ω)) * GT (Yof p q ω) ∂mu4 =
      HholPair Tround Tround (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) := by
    rw [HardyReal.mehler_smoothed hφ,
      ← integral_map (HardyReal.mehlerPair p q).continuous.measurable.aemeasurable
        HardyReal.measurable_hT.aestronglyMeasurable,
      HardyReal.law_swap hp1 hq1 rfl rfl rfl hk11 hkdet,
      integral_map (HardyReal.pairMap a b c).continuous.measurable.aemeasurable
        HardyReal.measurable_hT.aestronglyMeasurable,
      integral_prod (fun v => HardyReal.hT (HardyReal.pairMap a b c v))
        (HardyReal.integrable_of_le_one
          (HardyReal.measurable_hT.comp (HardyReal.pairMap a b c).continuous.measurable)
          fun _ => HardyReal.norm_hT_le hφ _)]
    simp only [HardyReal.pairMap, LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk]
    rw [HardyReal.integral_pair_eq_kHol hk11 hkdet HardyReal.measurable_hT (HardyReal.norm_hT_le hφ),
      covarianceCurve_real]
    rfl
  rw [hmeh] at hB
  rw [hB]
  exact hasSum_odd_radial
    (summable_abs_bivarKernel (ofListQ pl) (ofListQ ql) hP hQ
      (energy ((memLp_GT hφ).toLp GT)) (summable_abs_energy _)) ht0.le ht1.le



end

end Grothe.UpperReplacement

-- Section: PhaseChannels

set_option warningAsError true

/-!
# Exact embedded phase channels

Agent-ID: codex-a7c4.

Adapted from the local gemini-21d5 general Hardy draft. The second preprocessor is zero:
the response uses only the first coordinate. This gives the same one-coordinate phase kernel
with a simpler covariance for the separate Hardy certificate.
Source SHA256: f866907223b6f6f337a68bbf9417bf3cbaf4ea7a71dc49984a98af5a3e5ea752
-/

open MeasureTheory Finset Polynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperReplacement

open UpperChaos Upper

noncomputable section

/-- One-coordinate Gaussian phase embedded into `ℂ × ℂ`. -/
def phase2 (u : ℂ × ℂ) : ℂ := Grothe.Haag.ph u.1

lemma measurable_phase2 : Measurable phase2 := Grothe.Haag.measurable_ph.comp measurable_fst

lemma norm_phase2_le (u : ℂ × ℂ) : ‖phase2 u‖ ≤ 1 := Grothe.Haag.norm_ph_le u.1

lemma phase2_rot2 {c : ℂ} (hc : ‖c‖ = 1) (u : ℂ × ℂ) : phase2 (rot2 c u) = c * phase2 u := by
  simp only [phase2, rot2, Grothe.Haag.ph, norm_mul, hc, one_mul]
  ring

lemma memLp_phase2 : MemLp phase2 2 mu2 :=
  MemLp.of_bound measurable_phase2.aestronglyMeasurable 1
    (Filter.Eventually.of_forall norm_phase2_le)

lemma energy_phase2_odd_zero (k : ℕ) :
    energy (memLp_phase2.toLp phase2) (2 * k + 1, 0) = haagCoeff k := by
  unfold energy
  set i₀ : Idx2 := ((k + 1, k), (0, 0))
  have hi₀ : i₀ ∈ bideg ⁻¹' {(2 * k + 1, 0)} := by
    change (k + 1 + k, (0 : ℕ) + 0) = (2 * k + 1, 0)
    apply Prod.ext
    · omega
    · rfl
  rw [tsum_eq_single (⟨i₀, hi₀⟩ : ↑(bideg ⁻¹' {(2 * k + 1, 0)}))]
  · rw [inner_hvec2_left]
    have hint : ∫ u, conj (H2 i₀ u) * (memLp_phase2.toLp phase2) u ∂mu2 =
        ∫ z₁, conj (ev z₁ (H (k + 1) k)) * Grothe.Haag.ph z₁ ∂Grothe.LowerAnalytic.gaussC := by
      have h1 : ∫ u, conj (H2 i₀ u) * (memLp_phase2.toLp phase2) u ∂mu2 =
          ∫ u, conj (H2 i₀ u) * phase2 u ∂mu2 := by
        refine integral_congr_ae ?_
        filter_upwards [memLp_phase2.coeFn_toLp] with u hu; rw [hu]
      rw [h1]
      have h2 : ∀ u : ℂ × ℂ, conj (H2 i₀ u) * phase2 u =
          (conj (ev u.1 (H (k + 1) k)) * Grothe.Haag.ph u.1) * (1 : ℂ) := fun u => by
        simp [H2, i₀, phase2, H_zero_zero, ev]
      simp_rw [h2]
      rw [show mu2 = Grothe.LowerAnalytic.gaussC.prod Grothe.LowerAnalytic.gaussC from rfl,
        integral_prod_mul (fun z₁ : ℂ => conj (ev z₁ (H (k + 1) k)) * Grothe.Haag.ph z₁)
          (fun _ : ℂ => (1 : ℂ)), integral_const, probReal_univ, one_smul, mul_one]
    have hnrm : nrm2 i₀ = nrm (k + 1) k := by simp [nrm2, nrm, fac2, i₀]
    have hinner : ⟪hvec (k + 1, k), Grothe.Haag.phaseLp⟫_ℂ =
        (nrm (k + 1) k : ℂ) *
          ∫ z₁, conj (ev z₁ (H (k + 1) k)) * Grothe.Haag.ph z₁ ∂Grothe.LowerAnalytic.gaussC := by
      rw [hvec, Grothe.Haag.phaseLp, UpperChaos.inner_toLp]
      simp only [hfun, map_mul, Complex.conj_ofReal]
      rw [← integral_const_mul]
      exact integral_congr_ae (Filter.Eventually.of_forall fun z => by ring)
    rw [hint, hnrm, ← hinner]
    exact Grothe.Haag.phase_energy k
  · intro b hb
    have hb_deg : bideg b.1 = (2 * k + 1, 0) := b.2
    have h2 : b.1.2 = (0, 0) := by
      simp only [bideg, Prod.mk.injEq] at hb_deg
      ext <;> simp <;> omega
    have hne : b.1.1.1 + b.1.2.1 ≠ b.1.1.2 + b.1.2.2 + 1 := by
      intro hch
      apply hb
      apply Subtype.ext
      simp only [bideg, Prod.mk.injEq] at hb_deg
      have hp1 : b.1.1.1 = k + 1 := by omega
      have hq1 : b.1.1.2 = k := by omega
      exact Prod.ext (Prod.ext hp1 hq1) h2
    rw [inner_hvec2_left]
    have hint : ∫ u, conj (H2 b.1 u) * (memLp_phase2.toLp phase2) u ∂mu2 =
        ∫ u, conj (H2 b.1 u) * phase2 u ∂mu2 := by
      refine integral_congr_ae ?_
      filter_upwards [memLp_phase2.coeFn_toLp] with u hu; rw [hu]
    rw [hint, integral_H2_charge_one memLp_phase2 (fun _ u hc => phase2_rot2 hc u) hne]
    simp

/-- Exact polynomial formula for the radial coefficients of any `phase` channel `(P, 0)`. -/
theorem phase_bivarKernel_eq (P : ℝ[X]) (n : ℕ) :
    bivarKernel P 0 (energy (memLp_phase2.toLp phase2)) n =
      ∑ k ∈ range (n + 1), haagCoeff k * (X ^ k * P ^ (2 * k + 1)).coeff n := by
  unfold bivarKernel
  have hpar := energy_eq_zero_of_even memLp_phase2 (fun _ u hc => phase2_rot2 hc u)
  set S : Finset (ℕ × ℕ) := (range (n + 1)).image (fun k => (2 * k + 1, 0))
  rw [tsum_eq_sum (s := S)]
  · rw [sum_image (fun a _ b _ hab => by injection hab with h1 _; omega)]
    refine sum_congr rfl fun k _ => ?_
    rw [energy_phase2_odd_zero k]
    congr 1
    have hshift : shiftOf (2 * k + 1, 0) = k := by
      unfold shiftOf
      dsimp only
      omega
    simp only [termOf, hshift, pow_zero, mul_one]
  · intro p hp
    rcases Nat.eq_zero_or_pos p.2 with hm0 | hm_pos
    · rcases Nat.even_or_odd p.1 with ⟨k, hk⟩ | ⟨k, hk⟩
      · have hev : (p.1 + p.2) % 2 = 0 := by omega
        rw [hpar p hev, zero_mul]
      · have hkn : n < k := by
          by_contra hle
          apply hp
          rw [mem_image]
          exact ⟨k, mem_range.2 (by omega), Prod.ext (by omega) hm0.symm⟩
        have hsh : shiftOf p = k := by simp only [shiftOf]; omega
        rw [termOf, hsh, coeff_X_pow_mul', ite_eq_right (by omega), mul_zero]
    · have h0 : (0 : ℝ[X]) ^ p.2 = 0 := zero_pow hm_pos.ne'
      simp [termOf, h0]


end

end Grothe.UpperReplacement
