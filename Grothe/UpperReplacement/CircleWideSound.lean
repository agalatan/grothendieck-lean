import Grothe.UpperReplacement.Channels
import Grothe.UpperReplacement.CircleWide
import Grothe.Upper.Residual

set_option warningAsError true

/-!
# Soundness of the adaptive contours with explicit tolerance

Agent-ID: codex-a7c4, gemini-1aa9. The tolerance controls subdivision only. The proved whole-box
bounds (both the original four-chart checker and the cancellation-free quarter-circle checker
with Lipschitz polynomial enclosures) bound the full circle integral by the stated rational budget.
-/

namespace Grothe.UpperReplacement.CircleWideSound

open MeasureTheory Finset Polynomial Upper UpperChaos GrotheKernel GrotheKernel.HardyArc
open UpperChaos.HardyArcSound UpperChaos.HardyArcCircle SchurMain SchurKernel CircleCheck CircleSound
open scoped ComplexConjugate

noncomputable section

theorem hmean_of_check {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {pl ql : List ℚ} {dat : RData}
    (hm00 : mem m00 dat.m00) (hm01 : mem m01 dat.m01) (hm11 : mem m11 dat.m11)
    (hP : dat.P = pl.map ofRatI) (hQ : dat.Q = ql.map ofRatI)
    {rhoQ jQ budgetQ : ℚ} {r : ℝ} {depth : ℕ} {tolerance : ℤ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    (hc : CircleWide.meanOK dat rhoQ jQ budgetQ depth tolerance = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholSymPair F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql
        (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ (budgetQ : ℝ) := by
  have hD := D_pos
  have hD0 : (0 : ℤ) ≤ D := by exact_mod_cast hD.le
  unfold CircleWide.meanOK at hc
  dsimp only at hc
  cases ha : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) tolerance depth (-D) 0 with
  | none => rw [ha] at hc; simp at hc
  | some a =>
  rw [ha] at hc
  cases hb : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat false (D / 64) tolerance depth 0 D with
  | none => rw [hb] at hc; simp at hc
  | some b =>
  rw [hb] at hc
  cases hc' : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) tolerance depth (-D) 0 with
  | none => rw [hc'] at hc; simp at hc
  | some c =>
  rw [hc'] at hc
  cases hd : coverGauss (ofRatI jQ) (ofRatI rhoQ) dat true (D / 64) tolerance depth 0 D with
  | none => rw [hd] at hc; simp at hc
  | some d =>
  rw [hd, decide_eq_true_eq] at hc
  have ia := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64) tolerance
    depth (-D) 0 a (by omega) (Or.inr le_rfl) ha
  have ib := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU false (D / 64) tolerance
    depth 0 D b hD0 (Or.inl le_rfl) hb
  have ic := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64) tolerance
    depth (-D) 0 c (by omega) (Or.inr le_rfl) hc'
  have id' := coverGauss_sound hFm hGm hF hG hm00 hm01 hm11 hP hQ hρ0 hj0 hr hU true (D / 64) tolerance
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

theorem pairEnergy_self (F : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : pairEnergy F F nm = energy F nm := by
  rw [pairEnergy_eq_overlap]
  unfold energy
  apply tsum_congr
  intro i
  rw [← Complex.normSq_eq_norm_sq]
  simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im, Complex.normSq_apply]
  ring

theorem HholSymPair_self (F : ℂ × ℂ → ℂ) (R : Sym2C) :
    HholSymPair F F R = HholPair F F R := by
  unfold HholSymPair
  ring

theorem hardy_of_checks {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {M : Sym2R} {MI : SR} (hM : memSR M MI) (pl ql : List ℚ)
    {rho region j budget : ℚ} {depth : ℕ} {tolerance : ℤ}
    (hrho : 1 < rho) (hr : rho < region) (hr2 : region ≤ 2)
    (hj : 0 < j) (hB : 0 ≤ budget)
    (hregion : CircleCheck.regionOK (covarianceData MI pl ql) region = true)
    (hcircle : CircleWide.meanOK (covarianceData MI pl ql) rho j budget depth tolerance = true)
    {h : ℕ → ℝ} (hs : Summable fun k ↦ |h k|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun k ↦ (h k : ℂ) * (t : ℂ) ^ (2 * k + 1))
        (HholSymPair F G (covarianceCurve M pl ql t))) (J : ℕ) :
    ∑ k ∈ range J, h k ^ 2 * (rho : ℝ) ^ (2 * (2 * k + 1)) ≤ (budget : ℝ) := by
  have hr0 : 0 < region := (zero_lt_one.trans hrho).trans hr
  have hpos := covariance_kerPos_on_ball hM pl ql hr0 hr2 hregion
  have hdiff := covarianceCurve_differentiable M pl ql
  have hm := hmean_of_check hFm hGm hF hG hM.1 hM.2.1 hM.2.2
    (dat := covarianceData MI pl ql) rfl rfl
    (by exact_mod_cast (zero_lt_one.trans hrho).le) (by exact_mod_cast hj)
    (by exact_mod_cast hB) (by exact_mod_cast hr) hpos hcircle
  exact hardy_of_symmetric_pair_curve hFm hGm hF hG
    (by exact_mod_cast zero_lt_one.trans hrho) (by exact_mod_cast hr)
    (by exact_mod_cast hrho.trans hr)
    hdiff.1.differentiableOn hdiff.2.1.differentiableOn hdiff.2.2.differentiableOn
    hpos hs hreal hm J

/-- Direct tail estimate from a full Hardy budget, with no linear-subtraction premise. -/
theorem tail_of_budget {h : ℕ → ℝ} {rho B T : ℚ} {N : ℕ}
    (hrho : 1 < rho)
    (hB : ∀ J, ∑ k ∈ range J, h k ^ 2 * (rho : ℝ) ^ (2 * (2 * k + 1)) ≤ (B : ℝ))
    (hT : 0 ≤ T)
    (hnum : B * rho⁻¹ ^ (2 * (2 * N + 1)) ≤ T ^ 2 * (1 - rho⁻¹ ^ 4)) :
    ∑' n, |h (n + N)| ≤ (T : ℝ) :=
  hardy_tail h rho (by exact_mod_cast hrho) B hB N T
    (by exact_mod_cast hT) (by exact_mod_cast hnum)

/-! ### Quarter-circle Lipschitz & cancellation-free Gaussian soundness -/

private theorem memC_mulR {a : ℝ} {A : Ival} {z : ℂ} {Z : CI}
    (ha : mem a A) (hz : memC z Z) : memC ((a : ℂ) * z) (mulR A Z) := by
  refine ⟨?_, ?_⟩
  · simpa [mulR, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im] using mem_mul ha hz.1
  · simpa [mulR, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im] using mem_mul ha hz.2

private theorem memSC_combineM {M : Sym2R} {MI : SR} (hM : memSR M MI)
    {p q : ℂ} {P Q : CI} (hp : memC p P) (hq : memC q Q) :
    memSC ⟨(M.a : ℂ) ^ 2 * p + (M.b : ℂ) ^ 2 * q,
        (M.a : ℂ) * M.b * p + (M.b : ℂ) * M.c * q,
        (M.b : ℂ) ^ 2 * p + (M.c : ℂ) ^ 2 * q⟩
      (combineM (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b)
        (mulI MI.b MI.c) (mulI MI.c MI.c) P Q) := by
  have ha2 : mem (M.a ^ 2) (mulI MI.a MI.a) := by simpa [sq] using mem_mul hM.1 hM.1
  have hb2 : mem (M.b ^ 2) (mulI MI.b MI.b) := by simpa [sq] using mem_mul hM.2.1 hM.2.1
  have hab : mem (M.a * M.b) (mulI MI.a MI.b) := mem_mul hM.1 hM.2.1
  have hbc : mem (M.b * M.c) (mulI MI.b MI.c) := mem_mul hM.2.1 hM.2.2
  have hc2 : mem (M.c ^ 2) (mulI MI.c MI.c) := by simpa [sq] using mem_mul hM.2.2 hM.2.2
  refine ⟨?_, ?_, ?_⟩
  · simpa [combineM, Complex.ofReal_pow] using
      memC_add (memC_mulR ha2 hp) (memC_mulR hb2 hq)
  · simpa [combineM, Complex.ofReal_mul] using
      memC_add (memC_mulR hab hp) (memC_mulR hbc hq)
  · simpa [combineM, Complex.ofReal_pow] using
      memC_add (memC_mulR hb2 hp) (memC_mulR hc2 hq)

private theorem memC_bloatC {z z₀ : ℂ} {Z₀ : CI} {rad : ℤ}
    (hz₀ : memC z₀ Z₀) (hdist : ‖z - z₀‖ ≤ (rad : ℝ) / D) :
    memC z (bloatC Z₀ rad) := by
  have hD := D_pos
  have hre : |z.re - z₀.re| ≤ (rad : ℝ) / D := by
    simpa only [Complex.sub_re] using (Complex.abs_re_le_norm (z - z₀)).trans hdist
  have him : |z.im - z₀.im| ≤ (rad : ℝ) / D := by
    simpa only [Complex.sub_im] using (Complex.abs_im_le_norm (z - z₀)).trans hdist
  rw [abs_le] at hre him
  have hre1 : -((rad : ℝ)) ≤ (z.re - z₀.re) * D := by
    have h1 : (-(rad : ℝ)) / D ≤ z.re - z₀.re := by rw [neg_div]; exact hre.1
    exact (div_le_iff₀ hD).mp h1
  have hre2 : (z.re - z₀.re) * D ≤ (rad : ℝ) := (le_div_iff₀ hD).mp hre.2
  have him1 : -((rad : ℝ)) ≤ (z.im - z₀.im) * D := by
    have h1 : (-(rad : ℝ)) / D ≤ z.im - z₀.im := by rw [neg_div]; exact him.1
    exact (div_le_iff₀ hD).mp h1
  have him2 : (z.im - z₀.im) * D ≤ (rad : ℝ) := (le_div_iff₀ hD).mp him.2
  refine ⟨⟨?_, ?_⟩, ⟨?_, ?_⟩⟩ <;> simp only [bloatC, Int.cast_sub, Int.cast_add] <;>
    linarith [hz₀.1.1, hz₀.1.2, hz₀.2.1, hz₀.2.2]

private theorem norm_pow_sub_pow_le {t t₀ : ℂ} {r : ℝ} (hr : 0 ≤ r)
    (ht : ‖t‖ ≤ r) (ht₀ : ‖t₀‖ ≤ r) (n : ℕ) :
    ‖t ^ (n + 1) - t₀ ^ (n + 1)‖ ≤ ((n + 1 : ℕ) : ℝ) * r ^ n * ‖t - t₀‖ := by
  have hid : t ^ (n + 1) - t₀ ^ (n + 1) =
      (∑ i ∈ range (n + 1), t ^ i * t₀ ^ (n - i)) * (t - t₀) := by
    have h := geom_sum₂_mul t t₀ (n + 1)
    simpa only [Nat.add_sub_cancel] using h.symm
  rw [hid, norm_mul]
  refine mul_le_mul_of_nonneg_right ?_ (norm_nonneg _)
  calc ‖∑ i ∈ range (n + 1), t ^ i * t₀ ^ (n - i)‖
      ≤ ∑ i ∈ range (n + 1), ‖t ^ i * t₀ ^ (n - i)‖ := norm_sum_le _ _
    _ ≤ ∑ _i ∈ range (n + 1), r ^ n := by
        refine sum_le_sum fun i hi ↦ ?_
        have hi' : i ≤ n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hi)
        rw [norm_mul, norm_pow, norm_pow]
        calc ‖t‖ ^ i * ‖t₀‖ ^ (n - i)
            ≤ r ^ i * r ^ (n - i) :=
              mul_le_mul (pow_le_pow_left₀ (norm_nonneg _) ht i)
                (pow_le_pow_left₀ (norm_nonneg _) ht₀ (n - i)) (by positivity) (by positivity)
          _ = r ^ (i + (n - i)) := (pow_add r i (n - i)).symm
          _ = r ^ n := by rw [Nat.add_sub_of_le hi']
    _ = ((n + 1 : ℕ) : ℝ) * r ^ n := by
        simp [Finset.sum_const, nsmul_eq_mul]

private theorem norm_oddPoly_sub_aux {t t₀ : ℂ} {rho : ℚ} (hr : 0 ≤ (rho : ℝ))
    (ht : ‖t‖ ≤ (rho : ℝ)) (ht₀ : ‖t₀‖ ≤ (rho : ℝ)) :
    ∀ (p : List ℚ) (k : ℕ),
      ‖t ^ (2 * k + 1) * Polynomial.aeval (t ^ 2) (ofListQ p) -
        t₀ ^ (2 * k + 1) * Polynomial.aeval (t₀ ^ 2) (ofListQ p)‖ ≤
        (lipBoundAux (rho * rho) k (rho ^ (2 * k)) p : ℝ) * ‖t - t₀‖
  | [], k => by simp [ofListQ, lipBoundAux]
  | c :: cs, k => by
    have ih := norm_oddPoly_sub_aux hr ht ht₀ cs (k + 1)
    have hsplit :
        t ^ (2 * k + 1) * Polynomial.aeval (t ^ 2) (ofListQ (c :: cs)) -
          t₀ ^ (2 * k + 1) * Polynomial.aeval (t₀ ^ 2) (ofListQ (c :: cs)) =
        (c : ℂ) * (t ^ (2 * k + 1) - t₀ ^ (2 * k + 1)) +
          (t ^ (2 * (k + 1) + 1) * Polynomial.aeval (t ^ 2) (ofListQ cs) -
            t₀ ^ (2 * (k + 1) + 1) * Polynomial.aeval (t₀ ^ 2) (ofListQ cs)) := by
      simp only [ofListQ, map_add, map_mul, Polynomial.aeval_C, Polynomial.aeval_X,
        Complex.coe_algebraMap, Complex.ofReal_ratCast]
      have h1 : t ^ (2 * (k + 1) + 1) = t ^ (2 * k + 1) * t ^ 2 := by ring
      have h2 : t₀ ^ (2 * (k + 1) + 1) = t₀ ^ (2 * k + 1) * t₀ ^ 2 := by ring
      rw [h1, h2]
      ring
    rw [hsplit]
    have hpow := norm_pow_sub_pow_le hr ht ht₀ (2 * k)
    have hac : ((if c < 0 then -c else c : ℚ) : ℝ) = |(c : ℝ)| := by
      split_ifs with hc
      · rw [Rat.cast_neg, abs_of_neg (by exact_mod_cast hc)]
      · rw [abs_of_nonneg (by exact_mod_cast (not_lt.mp hc))]
    have hpow_eq : rho ^ (2 * (k + 1)) = rho ^ (2 * k) * (rho * rho) := by ring
    rw [hpow_eq] at ih
    have hterm1 : ‖(c : ℂ) * (t ^ (2 * k + 1) - t₀ ^ (2 * k + 1))‖ ≤
        ((2 * k + 1 : ℕ) : ℝ) * |(c : ℝ)| * (rho : ℝ) ^ (2 * k) * ‖t - t₀‖ := by
      rw [norm_mul, Complex.norm_ratCast]
      calc |(c : ℝ)| * ‖t ^ (2 * k + 1) - t₀ ^ (2 * k + 1)‖
          ≤ |(c : ℝ)| * (((2 * k + 1 : ℕ) : ℝ) * (rho : ℝ) ^ (2 * k) * ‖t - t₀‖) :=
            mul_le_mul_of_nonneg_left hpow (abs_nonneg _)
        _ = ((2 * k + 1 : ℕ) : ℝ) * |(c : ℝ)| * (rho : ℝ) ^ (2 * k) * ‖t - t₀‖ := by ring
    have hlhs : (lipBoundAux (rho * rho) k (rho ^ (2 * k)) (c :: cs) : ℝ) =
        ((2 * k + 1 : ℕ) : ℝ) * |(c : ℝ)| * (rho : ℝ) ^ (2 * k) +
          (lipBoundAux (rho * rho) (k + 1) (rho ^ (2 * k) * (rho * rho)) cs : ℝ) := by
      change ((((2 * k + 1 : ℕ) : ℚ) * (if c < 0 then -c else c) * rho ^ (2 * k) +
          lipBoundAux (rho * rho) (k + 1) (rho ^ (2 * k) * (rho * rho)) cs : ℚ) : ℝ) = _
      simp only [Rat.cast_add, Rat.cast_mul, Rat.cast_natCast, Rat.cast_pow, hac]
    rw [hlhs, add_mul]
    exact (norm_add_le _ _).trans (add_le_add hterm1 ih)

private theorem norm_oddPoly_sub_le {t t₀ : ℂ} {rho : ℚ} (hr : 0 ≤ (rho : ℝ))
    (ht : ‖t‖ ≤ (rho : ℝ)) (ht₀ : ‖t₀‖ ≤ (rho : ℝ)) (p : List ℚ) :
    ‖t * Polynomial.aeval (t ^ 2) (ofListQ p) -
      t₀ * Polynomial.aeval (t₀ ^ 2) (ofListQ p)‖ ≤
      (lipBoundQ p rho : ℝ) * ‖t - t₀‖ := by
  simpa only [lipBoundQ, mul_zero, zero_add, pow_one, pow_zero] using
    norm_oddPoly_sub_aux hr ht ht₀ p 0

private theorem norm_circle_sub_le {rho : ℝ} (hρ : 0 ≤ rho) (θ θ₀ : ℝ) :
    ‖(rho : ℂ) * Complex.exp (θ * Complex.I) - (rho : ℂ) * Complex.exp (θ₀ * Complex.I)‖ ≤
      rho * |θ - θ₀| := by
  have he : (rho : ℂ) * Complex.exp (θ * Complex.I) - (rho : ℂ) * Complex.exp (θ₀ * Complex.I) =
      (rho : ℂ) * Complex.exp (θ₀ * Complex.I) *
        (Complex.exp (Complex.I * ((θ - θ₀ : ℝ) : ℂ)) - 1) := by
    rw [mul_sub, mul_one, mul_assoc, ← Complex.exp_add]
    congr 2
    have : (θ₀ : ℂ) * Complex.I + Complex.I * ((θ - θ₀ : ℝ) : ℂ) = (θ : ℂ) * Complex.I := by
      push_cast; ring
    rw [this]
  rw [he, norm_mul, norm_mul, Complex.norm_of_nonneg hρ, Complex.norm_exp_ofReal_mul_I, mul_one]
  exact mul_le_mul_of_nonneg_left
    (Real.norm_exp_I_mul_ofReal_sub_one_le.trans (le_of_eq (Real.norm_eq_abs _))) hρ

private theorem lipBoundAux_nonneg {rho2 : ℚ} (hr : 0 ≤ rho2) :
    ∀ (p : List ℚ) (k : ℕ) {rpow : ℚ}, 0 ≤ rpow → 0 ≤ lipBoundAux rho2 k rpow p
  | [], _, _, _ => le_rfl
  | c :: cs, k, rpow, hrp => by
    unfold lipBoundAux
    have hac : 0 ≤ if c < 0 then -c else c := by split_ifs <;> linarith
    have h1 : 0 ≤ ((2 * k + 1 : ℕ) : ℚ) * (if c < 0 then -c else c) * rpow := by positivity
    have h2 : 0 ≤ lipBoundAux rho2 (k + 1) (rpow * rho2) cs :=
      lipBoundAux_nonneg hr cs (k + 1) (mul_nonneg hrp hr)
    linarith

private theorem lipBoundQ_nonneg (p : List ℚ) (rho : ℚ) : 0 ≤ lipBoundQ p rho :=
  lipBoundAux_nonneg (mul_self_nonneg rho) p 0 zero_le_one

private def trSym2R (A B : Sym2R) : ℝ := A.a * B.a + 2 * (A.b * B.b) + A.c * B.c

private theorem mem_trSym2 {A B : Sym2R} {AI BI : SR} (hA : memSR A AI) (hB : memSR B BI) :
    mem (trSym2R A B) (trSym2 AI BI) := by
  simpa only [trSym2R, trSym2, Int.cast_ofNat] using
    mem_add (mem_add (mem_mul hA.1 hB.1) (mem_mul (mem_intI 2) (mem_mul hA.2.1 hB.2.1)))
      (mem_mul hA.2.2 hB.2.2)

private theorem PD_add_smul {S₁ S₂ : Sym2R} {c₁ c₂ : ℝ}
    (h₁ : S₁.PD) (h₂ : S₂.PD) (hc₁ : 0 < c₁) (hc₂ : 0 < c₂) :
    (Sym2R.add (Sym2R.smul c₁ S₁) (Sym2R.smul c₂ S₂)).PD := by
  refine ⟨?_, ?_⟩
  · simp only [Sym2R.add, Sym2R.smul]
    nlinarith [h₁.1, h₂.1]
  · have hcross : 0 ≤ S₁.a * S₂.c + S₂.a * S₁.c - 2 * S₁.b * S₂.b := by
      have hid : S₁.a * S₂.a * (S₁.a * S₂.c + S₂.a * S₁.c - 2 * S₁.b * S₂.b) =
          (S₁.a * S₂.b - S₂.a * S₁.b) ^ 2 + S₁.a ^ 2 * S₂.det + S₂.a ^ 2 * S₁.det := by
        simp only [Sym2R.det]; ring
      have hpos : 0 < S₁.a * S₂.a := mul_pos h₁.1 h₂.1
      have hrhs : 0 ≤ (S₁.a * S₂.b - S₂.a * S₁.b) ^ 2 + S₁.a ^ 2 * S₂.det + S₂.a ^ 2 * S₁.det := by
        nlinarith [sq_nonneg (S₁.a * S₂.b - S₂.a * S₁.b), sq_nonneg S₁.a, sq_nonneg S₂.a,
          h₁.2, h₂.2]
      nlinarith
    have hdet : (Sym2R.add (Sym2R.smul c₁ S₁) (Sym2R.smul c₂ S₂)).det =
        c₁ ^ 2 * S₁.det + c₂ ^ 2 * S₂.det +
          c₁ * c₂ * (S₁.a * S₂.c + S₂.a * S₁.c - 2 * S₁.b * S₂.b) := by
      simp only [Sym2R.add, Sym2R.smul, Sym2R.det]; ring
    rw [hdet]
    nlinarith [sq_pos_of_pos hc₁, sq_pos_of_pos hc₂, mul_pos hc₁ hc₂, h₁.2, h₂.2]

private theorem T_eq_combo (gp gm : Sym2R)
    (hdz : (Sym2R.smul (1 / 2) (Sym2R.add gp gm)).det ≠ 0) :
    let z := Sym2R.smul (1 / 2) (Sym2R.add gp gm)
    let cr := Sym2R.smul (1 / 2) (Sym2R.add gp (Sym2R.smul (-1) gm))
    Sym2R.add z (Sym2R.smul (-1) (Sym2R.smul z.det⁻¹ (sand cr z.adj))) =
      Sym2R.add (Sym2R.smul (gp.det / (2 * z.det)) gm)
        (Sym2R.smul (gm.det / (2 * z.det)) gp) := by
  intro z cr
  have hz0 : z.det ≠ 0 := hdz
  have hdet : z.det = (1 / 2 * (gp.a + gm.a)) * (1 / 2 * (gp.c + gm.c)) -
      (1 / 2 * (gp.b + gm.b)) ^ 2 := by
    simp only [z, Sym2R.add, Sym2R.smul, Sym2R.det]
  generalize z.det = d at hz0 hdet ⊢
  simp only [Sym2R.add, Sym2R.smul, sand, Sym2R.adj]
  congr 1 <;> (field_simp [hz0]; rw [hdet]; simp only [z, cr, Sym2R.add, Sym2R.smul, Sym2R.det]; ring)

private theorem P1_identity (gp gm : Sym2R) (j : ℝ)
    (hdz : (Sym2R.smul (1 / 2) (Sym2R.add gp gm)).det ≠ 0) :
    let z := Sym2R.smul (1 / 2) (Sym2R.add gp gm)
    let cr := Sym2R.smul (1 / 2) (Sym2R.add gp (Sym2R.smul (-1) gm))
    let Tr := Sym2R.add z (Sym2R.smul (-1) (Sym2R.smul z.det⁻¹ (sand cr z.adj)))
    z.det * (Sym2R.add Tr ⟨j, 0, j⟩).det =
      gp.det * gm.det +
        j * ((1 / 2) * (gp.det * (gm.a + gm.c) + gm.det * (gp.a + gp.c))) +
        j * j * z.det := by
  intro z cr Tr
  have hz0 : z.det ≠ 0 := hdz
  have hTr : Tr = Sym2R.add (Sym2R.smul (gp.det / (2 * z.det)) gm)
      (Sym2R.smul (gm.det / (2 * z.det)) gp) := T_eq_combo gp gm hdz
  rw [hTr]
  have hdet : z.det = (1 / 2 * (gp.a + gm.a)) * (1 / 2 * (gp.c + gm.c)) -
      (1 / 2 * (gp.b + gm.b)) ^ 2 := by
    simp only [z, Sym2R.add, Sym2R.smul, Sym2R.det]
  generalize z.det = d at hz0 hdet ⊢
  simp only [Sym2R.add, Sym2R.smul, Sym2R.det]
  field_simp [hz0]
  rw [hdet]
  ring

private theorem P2_identity (z ar ci : Sym2R) (hz0 : z.det ≠ 0) :
    z.det * (Sym2R.add ar (Sym2R.smul z.det⁻¹ (sand ci z.adj))).det =
      z.det * ar.det + trSym2R ar.adj (sand ci z.adj) + ci.det * ci.det := by
  have hdet : z.det = z.a * z.c - z.b ^ 2 := rfl
  generalize z.det = d at hz0 hdet ⊢
  simp only [Sym2R.add, Sym2R.smul, sand, Sym2R.adj, Sym2R.det, trSym2R]
  field_simp [hz0]
  rw [hdet]
  ring

private theorem fastGaussVal_sound {R : Sym2C} {RI : SC} {j : ℝ} {jI : Ival} {v : ℤ}
    (hR : memSC R RI) (hj : mem j jI) (hg : fastGaussVal jI RI = some v) :
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧
      1 / HardyGaussianSound.denominator R j ≤ (v : ℝ) / D := by
  unfold fastGaussVal at hg
  dsimp only at hg
  by_cases h1 : (posI (HardyArc.invIm RI false).2.normSq &&
      posI (HardyArc.invIm RI true).2.normSq &&
      posI ((HardyArc.invIm RI false).1.re.add (negjI jI)).a &&
      posI ((HardyArc.invIm RI false).1.re.add (negjI jI)).det &&
      posI ((HardyArc.invIm RI true).1.re.add (negjI jI)).a &&
      posI ((HardyArc.invIm RI true).1.re.add (negjI jI)).det) = true
  · simp only [h1, Bool.not_true, Bool.false_eq_true, ↓reduceIte] at hg
    by_cases h2 : (posI (SR.smul half (((HardyArc.invIm RI false).1.re.add (negjI jI)).add
        ((HardyArc.invIm RI true).1.re.add (negjI jI)))).det &&
      posI (SR.smul half (((HardyArc.invIm RI false).1.re.add (negjI jI)).add
        ((HardyArc.invIm RI true).1.re.add (negjI jI)))).a) = true
    · simp only [h2, Bool.not_true, Bool.false_eq_true, ↓reduceIte] at hg
      split_ifs at hg with h3
      · injection hg with hv
        subst hv
        simp only [Bool.and_eq_true] at h1 h2 h3
        obtain ⟨⟨⟨⟨⟨hnp, hnm⟩, hgp_a⟩, hgp_d⟩, hgm_a⟩, hgm_d⟩ := h1
        obtain ⟨hdz_pos, hza_pos⟩ := h2
        obtain ⟨⟨_hp1_pos, _hp2_pos⟩, hbig_pos⟩ := h3
        have hdp := memC_dpm hR false
        have hdm := memC_dpm hR true
        rw [sig_false] at hdp
        rw [sig_true] at hdm
        have hdp0 : dpm R 1 ≠ 0 := fun h0 ↦ by
          have := pos_of_posI (mem_normSq hdp) hnp
          simp [h0] at this
        have hdm0 : dpm R (-1) ≠ 0 := fun h0 ↦ by
          have := pos_of_posI (mem_normSq hdm) hnm
          simp [h0] at this
        have hIp := memSC_invIm hR false hnp
        have hIm := memSC_invIm hR true hnm
        rw [sig_false] at hIp
        rw [sig_true] at hIm
        have hRp := memSR_re hIp
        have hRm := memSR_re hIm
        have hGp : memSR (gpmR R j 1) (SR.add (SC.re (HardyArc.invIm RI false).1) (negjI jI)) :=
          memSR_add hRp (memSR_smul mem_neg_one ⟨hj, mem_zero, hj⟩)
        have hGm : memSR (gpmR R j (-1)) (SR.add (SC.re (HardyArc.invIm RI true).1) (negjI jI)) :=
          memSR_add hRm (memSR_smul mem_neg_one ⟨hj, mem_zero, hj⟩)
        have hGpPD : (gpmR R j 1).PD := ⟨pos_of_posI hGp.1 hgp_a, pos_of_posI (mem_det hGp) hgp_d⟩
        have hGmPD : (gpmR R j (-1)).PD := ⟨pos_of_posI hGm.1 hgm_a, pos_of_posI (mem_det hGm) hgm_d⟩
        have hAr : memSR (Sym2R.smul (1 / 2) (Sym2R.add (SchurKernel.re (HardyArcSound.invIm R 1))
            (SchurKernel.re (HardyArcSound.invIm R (-1)))))
            (SR.smul half (SR.add (SC.re (HardyArc.invIm RI false).1) (SC.re (HardyArc.invIm RI true).1))) :=
          memSR_smul mem_half (memSR_add hRp hRm)
        have hZ : memSR (zR R j) (SR.smul half (SR.add
            (SR.add (SC.re (HardyArc.invIm RI false).1) (negjI jI))
            (SR.add (SC.re (HardyArc.invIm RI true).1) (negjI jI)))) :=
          memSR_smul mem_half (memSR_add hGp hGm)
        have hZPD : (zR R j).PD := ⟨pos_of_posI hZ.1 hza_pos, pos_of_posI (mem_det hZ) hdz_pos⟩
        have hCi : memSR (ciR R) (SR.smul half (SR.add (SC.im (HardyArc.invIm RI false).1)
            (SR.smul (negI (intI 1)) (SC.im (HardyArc.invIm RI true).1)))) :=
          memSR_smul mem_half (memSR_add (memSR_im hIp) (memSR_smul mem_neg_one (memSR_im hIm)))
        set gp := gpmR R j 1
        set gm := gpmR R j (-1)
        set z := zR R j
        set ar := Sym2R.smul (1 / 2) (Sym2R.add (SchurKernel.re (HardyArcSound.invIm R 1))
          (SchurKernel.re (HardyArcSound.invIm R (-1))))
        set ci := ciR R
        set Tr := Sym2R.add z (Sym2R.smul (-1) (Sym2R.smul z.det⁻¹ (sand (crR R j) z.adj)))
        set Er := Sym2R.smul (1 / 2)
          (Sym2R.add (sand (crR R j) (Sym2R.smul z.det⁻¹ z.adj))
            (sand ci (Sym2R.smul z.det⁻¹ z.adj)))
        have hTeq : T (Bj R j) R.Cmat = Tr := by
          simp only [T, Kr, Tr, z]
          rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0]
        have hEeq : E (Bj R j) R.Cmat = Er := by
          simp only [E, Kr, Ki, Er, z, ci, sand_smul]
          rw [Z_Bj_eq hdp0 hdm0, re_Cmat_eq (j := j) hdp0 hdm0, im_Cmat_eq hdp0 hdm0]
        have hTPD : Tr.PD := by
          rw [show Tr = Sym2R.add (Sym2R.smul (gp.det / (2 * z.det)) gm)
              (Sym2R.smul (gm.det / (2 * z.det)) gp) from T_eq_combo gp gm hZPD.2.ne']
          exact PD_add_smul hGmPD hGpPD (div_pos hGpPD.2 (by linarith [hZPD.2]))
            (div_pos hGmPD.2 (by linarith [hZPD.2]))
        have hAr_eq : ar = Sym2R.add z ⟨j, 0, j⟩ := by
          simp only [ar, z, zR, gpmR, Sym2R.add, Sym2R.smul]
          congr 1 <;> ring
        have hTEJ_eq : Sym2R.add (Sym2R.add Tr (Sym2R.smul 2 Er)) ⟨j, 0, j⟩ =
            Sym2R.add ar (Sym2R.smul z.det⁻¹ (sand ci z.adj)) := by
          rw [hAr_eq]
          simp only [Tr, Er, Sym2R.add, Sym2R.smul, sand, Sym2R.adj]
          congr 1 <;> ring
        set P1R := gp.det * gm.det +
          j * ((1 / 2) * (gp.det * (gm.a + gm.c) + gm.det * (gp.a + gp.c))) + j * j * z.det
        set P2R := z.det * ar.det + trSym2R ar.adj (sand ci z.adj) + ci.det * ci.det
        have hP1eq : z.det * (Sym2R.add Tr ⟨j, 0, j⟩).det = P1R := P1_identity gp gm j hZPD.2.ne'
        have hP2eq : z.det * (Sym2R.add (Sym2R.add Tr (Sym2R.smul 2 Er)) ⟨j, 0, j⟩).det = P2R := by
          rw [hTEJ_eq]
          exact P2_identity z ar ci hZPD.2.ne'
        have hP1m : mem P1R _ :=
          mem_add (mem_add (mem_mul (mem_det hGp) (mem_det hGm))
            (mem_mul hj (mem_mul mem_half (mem_add (mem_mul (mem_det hGp) (mem_add hGm.1 hGm.2.2))
              (mem_mul (mem_det hGm) (mem_add hGp.1 hGp.2.2))))))
            (mem_mul (mem_mul hj hj) (mem_det hZ))
        have hP2m : mem P2R _ :=
          mem_add (mem_add (mem_mul (mem_det hZ) (mem_det hAr))
            (mem_trSym2 (memSR_adj hAr) (memSR_sand hCi (memSR_adj hZ))))
            (mem_mul (mem_det hCi) (mem_det hCi))
        set bigDenR := 16 * (j * j) * (Complex.normSq (dpm R 1) * Complex.normSq (dpm R (-1))) *
          (P1R * P2R)
        have hBigm : mem bigDenR _ :=
          mem_mul (mem_mul (mem_mul (mem_intI 16) (mem_mul hj hj))
            (mem_mul (mem_normSq hdp) (mem_normSq hdm))) (mem_mul hP1m hP2m)
        have hdenEq : HardyGaussianSound.denominator R j = bigDenR / z.det := by
          have hz0 : z.det ≠ 0 := hZPD.2.ne'
          unfold HardyGaussianSound.denominator
          rw [normSq_detIm, Z_Bj_eq hdp0 hdm0, hTeq, hEeq]
          have hs1 : GaussianAmplitude.shifted Tr j = Sym2R.add Tr ⟨j, 0, j⟩ := by
            simp [GaussianAmplitude.shifted, Sym2R.add]
          have hs2 : GaussianAmplitude.shifted (Sym2R.add Tr (Sym2R.smul 2 Er)) j =
              Sym2R.add (Sym2R.add Tr (Sym2R.smul 2 Er)) ⟨j, 0, j⟩ := by
            simp [GaussianAmplitude.shifted, Sym2R.add]
          rw [hs1, hs2]
          have h1' : (Sym2R.add Tr ⟨j, 0, j⟩).det = P1R / z.det := by
            rw [← hP1eq, mul_div_cancel_left₀ _ hz0]
          have h2' : (Sym2R.add (Sym2R.add Tr (Sym2R.smul 2 Er)) ⟨j, 0, j⟩).det = P2R / z.det := by
            rw [← hP2eq, mul_div_cancel_left₀ _ hz0]
          rw [h1', h2']
          dsimp only [bigDenR, z]
          field_simp [hz0]
        have hinv := mem_mul (mem_det hZ) (mem_invPosI hBigm hbig_pos)
        refine ⟨?_, ?_, ?_⟩
        · rw [Z_Bj_eq hdp0 hdm0]; exact hZPD
        · rw [hTeq]; exact hTPD
        · have hval : 1 / HardyGaussianSound.denominator R j = z.det * bigDenR⁻¹ := by
            rw [hdenEq, one_div, inv_div, div_eq_mul_inv]
          rw [hval, le_div_iff₀ D_pos]
          exact hinv.2
    · have h2f : (posI (SR.smul half (((HardyArc.invIm RI false).1.re.add (negjI jI)).add
          ((HardyArc.invIm RI true).1.re.add (negjI jI)))).det &&
        posI (SR.smul half (((HardyArc.invIm RI false).1.re.add (negjI jI)).add
          ((HardyArc.invIm RI true).1.re.add (negjI jI)))).a) = false :=
        Bool.eq_false_iff.mpr h2
      simp [h2f] at hg
  · have h1f : (posI (HardyArc.invIm RI false).2.normSq &&
        posI (HardyArc.invIm RI true).2.normSq &&
        posI ((HardyArc.invIm RI false).1.re.add (negjI jI)).a &&
        posI ((HardyArc.invIm RI false).1.re.add (negjI jI)).det &&
        posI ((HardyArc.invIm RI true).1.re.add (negjI jI)).a &&
        posI ((HardyArc.invIm RI true).1.re.add (negjI jI)).det) = false :=
      Bool.eq_false_iff.mpr h1
    simp [h1f] at hg

private theorem gaussian_neg (R : Sym2C) (j : ℝ) :
    let Rn : Sym2C := ⟨-R.a, -R.b, -R.c⟩
    Z (Bj Rn j) = Z (Bj R j) ∧
      T (Bj Rn j) Rn.Cmat = T (Bj R j) R.Cmat ∧
      HardyGaussianSound.denominator Rn j = HardyGaussianSound.denominator R j := by
  intro Rn
  have hdet : Rn.detIm = R.detIm := by
    simp only [Rn, Sym2C.detIm, Sym2C.sq]; ring
  have hA : Rn.Amat = R.Amat := by
    simp only [Rn, Sym2C.Amat, Sym2C.sq, hdet]
    congr 1 <;> ring
  have hC : Rn.Cmat = ⟨-R.Cmat.a, -R.Cmat.b, -R.Cmat.c⟩ := by
    simp only [Rn, Sym2C.Cmat, hA]
    congr 1 <;> ring
  have hBj : Bj Rn j = Bj R j := by simp only [Bj, hA]
  have hreC : SchurKernel.re Rn.Cmat = Sym2R.smul (-1) (SchurKernel.re R.Cmat) := by
    simp only [hC, SchurKernel.re, Sym2R.smul, Complex.neg_re]
    congr 1 <;> ring
  have himC : SchurKernel.im Rn.Cmat = Sym2R.smul (-1) (SchurKernel.im R.Cmat) := by
    simp only [hC, SchurKernel.im, Sym2R.smul, Complex.neg_im]
    congr 1 <;> ring
  have hsand_neg : ∀ (X N : Sym2R), sand (Sym2R.smul (-1) X) N = sand X N := fun X N ↦ by
    simp only [sand, Sym2R.smul]; congr 1 <;> ring
  have hKr : Kr (Bj Rn j) Rn.Cmat = Kr (Bj R j) R.Cmat := by
    simp only [Kr, hBj, hreC, hsand_neg]
  have hKi : Ki (Bj Rn j) Rn.Cmat = Ki (Bj R j) R.Cmat := by
    simp only [Ki, hBj, himC, hsand_neg]
  have hT : T (Bj Rn j) Rn.Cmat = T (Bj R j) R.Cmat := by
    unfold T; rw [hKr, hBj]
  have hE : E (Bj Rn j) Rn.Cmat = E (Bj R j) R.Cmat := by
    unfold E; rw [hKr, hKi]
  refine ⟨by rw [hBj], hT, ?_⟩
  unfold HardyGaussianSound.denominator; rw [hdet, hT, hE, hBj]

private theorem gaussian_conj (R : Sym2C) (j : ℝ) :
    let Rc : Sym2C := ⟨conj R.a, conj R.b, conj R.c⟩
    Z (Bj Rc j) = Z (Bj R j) ∧
      T (Bj Rc j) Rc.Cmat = T (Bj R j) R.Cmat ∧
      HardyGaussianSound.denominator Rc j = HardyGaussianSound.denominator R j := by
  intro Rc
  have hdet : Rc.detIm = conj R.detIm := by
    simp only [Rc, Sym2C.detIm, Sym2C.sq, map_sub, map_add, map_mul, map_one]
  have hA : Rc.Amat = ⟨conj R.Amat.a, conj R.Amat.b, conj R.Amat.c⟩ := by
    simp only [Rc, Sym2C.Amat, Sym2C.sq, hdet, map_div₀, map_sub, map_add, map_mul, map_one]
  have hC : Rc.Cmat = ⟨conj R.Cmat.a, conj R.Cmat.b, conj R.Cmat.c⟩ := by
    simp only [Rc, Sym2C.Cmat, hA, map_add, map_mul]
  have hZ : Z (Bj Rc j) = Z (Bj R j) := by
    simp only [Z, Bj, hA, SchurKernel.re, Complex.sub_re, Complex.conj_re, Complex.ofReal_re]
  have hreC : SchurKernel.re Rc.Cmat = SchurKernel.re R.Cmat := by
    simp only [hC, SchurKernel.re, Complex.conj_re]
  have himC : SchurKernel.im Rc.Cmat = Sym2R.smul (-1) (SchurKernel.im R.Cmat) := by
    simp only [hC, SchurKernel.im, Sym2R.smul, Complex.conj_im]
    congr 1 <;> ring
  have hsand_neg : ∀ (X N : Sym2R), sand (Sym2R.smul (-1) X) N = sand X N := fun X N ↦ by
    simp only [sand, Sym2R.smul]; congr 1 <;> ring
  have hKr : Kr (Bj Rc j) Rc.Cmat = Kr (Bj R j) R.Cmat := by
    simp only [Kr, hZ, hreC]
  have hKi : Ki (Bj Rc j) Rc.Cmat = Ki (Bj R j) R.Cmat := by
    simp only [Ki, hZ, himC, hsand_neg]
  have hT : T (Bj Rc j) Rc.Cmat = T (Bj R j) R.Cmat := by
    simp only [T, hZ, hKr]
  have hE : E (Bj Rc j) Rc.Cmat = E (Bj R j) R.Cmat := by
    simp only [E, hKr, hKi]
  refine ⟨hZ, hT, ?_⟩
  simp only [HardyGaussianSound.denominator, hdet, RCLike.norm_conj, hZ, hT, hE]

/-- Sum of the four symmetric quarter-circle values at angle `θ ∈ [0, π/2]`. -/
private def fourQuarterValue (F G : ℂ × ℂ → ℂ) (R : ℂ → Sym2C) (rho : ℝ) (θ : ℝ) : ℝ :=
  pairCircleValue F G R rho false θ + pairCircleValue F G R rho false (-θ) +
    pairCircleValue F G R rho true θ + pairCircleValue F G R rho true (-θ)

private theorem fourQuarterValue_intervalIntegrable {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {m00 m01 m11 rho r : ℝ} {pl ql : List ℚ} (hρ0 : 0 ≤ rho) (hr : rho < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r,
      ∃ l > 0, KerPos (covarianceCurve ⟨m00, m01, m11⟩ pl ql t) l)
    (a b : ℝ) :
    IntervalIntegrable
      (fourQuarterValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) rho) volume a b := by
  have hf := pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU false a b
  have ht := pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU true a b
  have hfn : IntervalIntegrable
      (fun θ ↦ pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) rho false (-θ))
      volume a b := by
    simpa using (IntervalIntegrable.iff_comp_neg (a := -a) (b := -b)).mp
      (pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU false (-a) (-b))
  have htn : IntervalIntegrable
      (fun θ ↦ pairCircleValue F G (covarianceCurve ⟨m00, m01, m11⟩ pl ql) rho true (-θ))
      volume a b := by
    simpa using (IntervalIntegrable.iff_comp_neg (a := -a) (b := -b)).mp
      (pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU true (-a) (-b))
  exact ((hf.add hfn).add ht).add htn

private theorem leafFast_sound {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {M : Sym2R} {MI : SR} (hM : memSR M MI) {pl ql : List ℚ}
    {rhoQ jQ : ℚ} {r : ℝ} (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (covarianceCurve M pl ql t) l)
    {w tol : ℤ} {last : Bool} {lo hi out : ℤ}
    (hlo0 : 0 ≤ lo) (hlo_hi : lo ≤ hi)
    (hl : leafFast (ofRatI jQ) (ofRatI rhoQ)
        (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
        (pl.map ofRatI) (ql.map ofRatI)
        (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
        w tol last lo hi = some out) :
    ∫ θ in (2 * Real.arctan ((lo : ℝ) / D))..(2 * Real.arctan ((hi : ℝ) / D)),
      fourQuarterValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) θ ≤ 4 * ((out : ℝ) / D) := by
  have hD := D_pos
  unfold leafFast at hl
  dsimp only at hl
  set mid := (lo + hi) / 2
  by_cases hcond : (decide (hi - lo ≤ w) &&
      posI (addI (intI 1) (mulI ⟨mid, mid⟩ ⟨mid, mid⟩))) = true
  · simp only [hcond, ↓reduceIte] at hl
    simp only [Bool.and_eq_true] at hcond
    obtain ⟨_, hpos_mid⟩ := hcond
    set rhoI := ofRatI rhoQ
    set t0Box := circleBox rhoI false ⟨mid, mid⟩
    set p0Box := CI.mul t0Box (CI.horner (CI.mul t0Box t0Box) (pl.map ofRatI))
    set q0Box := CI.mul t0Box (CI.horner (CI.mul t0Box t0Box) (ql.map ofRatI))
    set dtheta := max (arcLenUp lo mid) (arcLenUp mid hi)
    set dt := shUp (rhoI.hi * dtheta)
    set lipP := ofRatHi (lipBoundQ pl rhoQ)
    set lipQ := ofRatHi (lipBoundQ ql rhoQ)
    set rBox := combineM (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b)
      (mulI MI.b MI.c) (mulI MI.c MI.c)
      (bloatC p0Box (shUp (lipP * dt))) (bloatC q0Box (shUp (lipQ * dt)))
    cases hgv : fastGaussVal (ofRatI jQ) rBox with
    | none => rw [hgv] at hl; simp at hl
    | some v =>
      rw [hgv] at hl
      dsimp only at hl
      have hout : out = shUp (v * arcLenUp lo hi) := by
        split_ifs at hl <;> simp_all
      subst hout
      set a := 2 * Real.arctan ((lo : ℝ) / D)
      set b := 2 * Real.arctan ((hi : ℝ) / D)
      have hab : a ≤ b := by
        dsimp only [a, b]
        have : (lo : ℝ) / D ≤ (hi : ℝ) / D :=
          div_le_div_of_nonneg_right (by exact_mod_cast hlo_hi) hD.le
        linarith [Real.arctan_mono this]
      have hmid1 : lo ≤ mid := by omega
      have hmid2 : mid ≤ hi := by omega
      set θ₀ := 2 * Real.arctan ((mid : ℝ) / D)
      have ht0_mem : memC (((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)) t0Box := by
        have htan := tan_half_mem (a := (mid : ℝ) / D) (b := (mid : ℝ) / D) (θ := θ₀) le_rfl le_rfl
        have hs : mem (Real.tan (θ₀ / 2)) ⟨mid, mid⟩ :=
          ⟨(div_le_iff₀ hD).1 htan.1, (le_div_iff₀ hD).1 htan.2⟩
        have hcb := memC_circleBox (mem_ofRatI rhoQ) hs hpos_mid false
        have hexp := exp_eq_chart
          (by linarith [Real.neg_pi_div_two_lt_arctan ((mid : ℝ) / D)] : -Real.pi < θ₀)
          (by linarith [Real.arctan_lt_pi_div_two ((mid : ℝ) / D)] : θ₀ < Real.pi)
        have hchart : ((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I) =
            chartPt (rhoQ : ℝ) false (Real.tan (θ₀ / 2)) := by
          rw [hexp, chartPt, sig_false]; push_cast; ring
        rwa [hchart]
      have hp0_mem : memC ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)) *
          Polynomial.aeval ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)) ^ 2) (ofListQ pl))
          p0Box := by
        rw [aeval_ofListQ, sq]
        exact memC_mul ht0_mem (memC_horner (memC_mul ht0_mem ht0_mem) (forall2_ofRatI pl))
      have hq0_mem : memC ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)) *
          Polynomial.aeval ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)) ^ 2) (ofListQ ql))
          q0Box := by
        rw [aeval_ofListQ, sq]
        exact memC_mul ht0_mem (memC_horner (memC_mul ht0_mem ht0_mem) (forall2_ofRatI ql))
      have hpt : ∀ θ ∈ Set.Icc a b,
          fourQuarterValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) θ ≤ 4 * ((v : ℝ) / D) := by
        intro θ hθ
        have hdist_θ : |θ - θ₀| ≤ (dtheta : ℝ) / D := by
          have h1 := arcLenUp_sound hmid1 (Or.inl hlo0)
          have h2 := arcLenUp_sound hmid2 (Or.inl (hlo0.trans hmid1))
          have hd1 : ((arcLenUp lo mid : ℤ) : ℝ) / D ≤ (dtheta : ℝ) / D :=
            div_le_div_of_nonneg_right (by exact_mod_cast le_max_left _ _) hD.le
          have hd2 : ((arcLenUp mid hi : ℤ) : ℝ) / D ≤ (dtheta : ℝ) / D :=
            div_le_div_of_nonneg_right (by exact_mod_cast le_max_right _ _) hD.le
          rw [abs_le]
          constructor <;> linarith [hθ.1, hθ.2]
        have hdt : ‖((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) -
            ((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)‖ ≤ (dt : ℝ) / D := by
          have hrho_hi : (rhoQ : ℝ) ≤ (rhoI.hi : ℝ) / D :=
            (le_div_iff₀ hD).mpr (mem_ofRatI rhoQ).2
          calc _ ≤ (rhoQ : ℝ) * |θ - θ₀| := norm_circle_sub_le hρ0 θ θ₀
            _ ≤ ((rhoI.hi : ℝ) / D) * ((dtheta : ℝ) / D) :=
              mul_le_mul hrho_hi hdist_θ (abs_nonneg _) (hρ0.trans hrho_hi)
            _ = (((rhoI.hi * dtheta : ℤ) : ℝ) / D) / D := by push_cast; ring
            _ ≤ (dt : ℝ) / D := div_le_div_of_nonneg_right (shUp_sound _) hD.le
        have hnt : ‖((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)‖ ≤ (rhoQ : ℝ) := by
          rw [norm_mul, Complex.norm_of_nonneg hρ0, Complex.norm_exp_ofReal_mul_I, mul_one]
        have hnt0 : ‖((rhoQ : ℝ) : ℂ) * Complex.exp (θ₀ * Complex.I)‖ ≤ (rhoQ : ℝ) := by
          rw [norm_mul, Complex.norm_of_nonneg hρ0, Complex.norm_exp_ofReal_mul_I, mul_one]
        have hlipP_le : (lipBoundQ pl rhoQ : ℝ) ≤ (lipP : ℝ) / D :=
          (le_div_iff₀ hD).mpr (le_ofRatHi _)
        have hlipQ_le : (lipBoundQ ql rhoQ : ℝ) ≤ (lipQ : ℝ) / D :=
          (le_div_iff₀ hD).mpr (le_ofRatHi _)
        have hp_mem : memC ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)) *
            Polynomial.aeval ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)) ^ 2) (ofListQ pl))
            (bloatC p0Box (shUp (lipP * dt))) := by
          refine memC_bloatC hp0_mem ?_
          calc _ ≤ (lipBoundQ pl rhoQ : ℝ) * _ := norm_oddPoly_sub_le hρ0 hnt hnt0 pl
            _ ≤ ((lipP : ℝ) / D) * ((dt : ℝ) / D) :=
              mul_le_mul hlipP_le hdt (norm_nonneg _)
                ((Rat.cast_nonneg.mpr (lipBoundQ_nonneg pl rhoQ)).trans hlipP_le)
            _ = (((lipP * dt : ℤ) : ℝ) / D) / D := by push_cast; ring
            _ ≤ (shUp (lipP * dt) : ℝ) / D := div_le_div_of_nonneg_right (shUp_sound _) hD.le
        have hq_mem : memC ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)) *
            Polynomial.aeval ((((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)) ^ 2) (ofListQ ql))
            (bloatC q0Box (shUp (lipQ * dt))) := by
          refine memC_bloatC hq0_mem ?_
          calc _ ≤ (lipBoundQ ql rhoQ : ℝ) * _ := norm_oddPoly_sub_le hρ0 hnt hnt0 ql
            _ ≤ ((lipQ : ℝ) / D) * ((dt : ℝ) / D) :=
              mul_le_mul hlipQ_le hdt (norm_nonneg _)
                ((Rat.cast_nonneg.mpr (lipBoundQ_nonneg ql rhoQ)).trans hlipQ_le)
            _ = (((lipQ * dt : ℤ) : ℝ) / D) / D := by push_cast; ring
            _ ≤ (shUp (lipQ * dt) : ℝ) / D := div_le_div_of_nonneg_right (shUp_sound _) hD.le
        have hR : memSC (covarianceCurve M pl ql (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))
            rBox := memSC_combineM hM hp_mem hq_mem
        obtain ⟨hZ, hT, hden⟩ := fastGaussVal_sound hR (mem_ofRatI jQ) hgv
        set t := ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)
        set R0 := covarianceCurve M pl ql t
        have hq1 : pairCircleValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) false θ ≤ (v : ℝ) / D := by
          simp only [pairCircleValue, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul]
          exact (norm_HholSymPair_sq_le
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG)
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hGm hFm hG hF)).trans hden
        have ht_conj : ((rhoQ : ℝ) : ℂ) * Complex.exp (((-θ : ℝ) : ℂ) * Complex.I) = conj t := by
          simp only [t, map_mul, Complex.conj_ofReal, ← Complex.exp_conj, Complex.conj_I,
            Complex.ofReal_neg]
          congr 2; ring
        have hq2 : pairCircleValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) false (-θ) ≤ (v : ℝ) / D := by
          simp only [pairCircleValue, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul,
            ht_conj, covarianceCurve_conj]
          obtain ⟨hZc, hTc, hdc⟩ := gaussian_conj R0 jQ
          rw [← hZc] at hZ; rw [← hTc] at hT; rw [← hdc] at hden
          exact (norm_HholSymPair_sq_le
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG)
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hGm hFm hG hF)).trans hden
        have hq3 : pairCircleValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) true θ ≤ (v : ℝ) / D := by
          have ht_neg : (-1 : ℂ) * ((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I) = -t := by
            simp only [t]; ring
          simp only [pairCircleValue, HardyArcSound.sig, ↓reduceIte, ht_neg, covarianceCurve_neg]
          obtain ⟨hZn, hTn, hdn⟩ := gaussian_neg R0 jQ
          rw [← hZn] at hZ; rw [← hTn] at hT; rw [← hdn] at hden
          exact (norm_HholSymPair_sq_le
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG)
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hGm hFm hG hF)).trans hden
        have hq4 : pairCircleValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) true (-θ) ≤ (v : ℝ) / D := by
          have ht_nc : (-1 : ℂ) * ((rhoQ : ℝ) : ℂ) * Complex.exp (((-θ : ℝ) : ℂ) * Complex.I) =
              -(conj t) := by
            rw [← ht_conj]; ring
          simp only [pairCircleValue, HardyArcSound.sig, ↓reduceIte, ht_nc, covarianceCurve_neg,
            covarianceCurve_conj]
          obtain ⟨hZc, hTc, hdc⟩ := gaussian_conj R0 jQ
          obtain ⟨hZn, hTn, hdn⟩ := gaussian_neg ⟨conj R0.a, conj R0.b, conj R0.c⟩ jQ
          rw [← hZc, ← hZn] at hZ; rw [← hTc, ← hTn] at hT; rw [← hdc, ← hdn] at hden
          exact (norm_HholSymPair_sq_le
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hGm hF hG)
            (SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hGm hFm hG hF)).trans hden
        unfold fourQuarterValue
        linarith
      have hv0 : 0 ≤ (v : ℝ) / D := by
        have h0 := hpt a ⟨le_rfl, hab⟩
        have hnn : 0 ≤ fourQuarterValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) a := by
          unfold fourQuarterValue pairCircleValue
          positivity
        linarith
      have hint := fourQuarterValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU a b
      calc ∫ θ in a..b, fourQuarterValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) θ
          ≤ ∫ _ in a..b, (4 * ((v : ℝ) / D)) :=
            intervalIntegral.integral_mono_on hab hint intervalIntegrable_const hpt
        _ = (b - a) * (4 * ((v : ℝ) / D)) := by
            simp only [intervalIntegral.integral_const, smul_eq_mul]
        _ = 4 * ((b - a) * ((v : ℝ) / D)) := by ring
        _ ≤ 4 * (((arcLenUp lo hi : ℝ) / D) * ((v : ℝ) / D)) := by
            gcongr
            exact arcLenUp_sound hlo_hi (Or.inl hlo0)
        _ = 4 * ((((v * arcLenUp lo hi : ℤ) : ℝ) / D) / D) := by push_cast; ring
        _ ≤ 4 * ((shUp (v * arcLenUp lo hi) : ℝ) / D) := by
            gcongr
            exact shUp_sound _
  · rw [Bool.eq_false_iff.mpr hcond] at hl; simp at hl

private theorem coverFast_sound {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {M : Sym2R} {MI : SR} (hM : memSR M MI) {pl ql : List ℚ}
    {rhoQ jQ : ℚ} {r : ℝ} (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (covarianceCurve M pl ql t) l)
    (w tol : ℤ) :
    ∀ (depth : ℕ) (lo hi out : ℤ), 0 ≤ lo → lo ≤ hi →
      coverFast (ofRatI jQ) (ofRatI rhoQ)
        (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
        (pl.map ofRatI) (ql.map ofRatI)
        (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
        w tol depth lo hi = some out →
      ∫ θ in (2 * Real.arctan ((lo : ℝ) / D))..(2 * Real.arctan ((hi : ℝ) / D)),
        fourQuarterValue F G (covarianceCurve M pl ql) (rhoQ : ℝ) θ ≤ 4 * ((out : ℝ) / D) := by
  intro depth
  induction depth with
  | zero =>
    intro lo hi out hlo0 hlo_hi hc
    unfold coverFast at hc
    change (match leafFast (ofRatI jQ) (ofRatI rhoQ)
        (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
        (pl.map ofRatI) (ql.map ofRatI)
        (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
        w tol true lo hi with
      | some x => some x | none => none) = some out at hc
    cases hl : leafFast (ofRatI jQ) (ofRatI rhoQ)
        (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
        (pl.map ofRatI) (ql.map ofRatI)
        (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
        w tol true lo hi with
    | none => rw [hl] at hc; simp at hc
    | some x =>
      rw [hl] at hc
      injection hc with hx; subst hx
      exact leafFast_sound hFm hGm hF hG hM hρ0 hj0 hr hU hlo0 hlo_hi hl
  | succ d ih =>
    intro lo hi out hlo0 hlo_hi hc
    unfold coverFast at hc
    cases hl : leafFast (ofRatI jQ) (ofRatI rhoQ)
        (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
        (pl.map ofRatI) (ql.map ofRatI)
        (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
        w tol (d + 1 == 0) lo hi with
    | some x =>
      rw [hl] at hc
      injection hc with hx; subst hx
      exact leafFast_sound hFm hGm hF hG hM hρ0 hj0 hr hU hlo0 hlo_hi hl
    | none =>
      rw [hl] at hc
      dsimp only at hc
      set mid := (lo + hi) / 2
      cases hc1 : coverFast (ofRatI jQ) (ofRatI rhoQ)
          (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
          (pl.map ofRatI) (ql.map ofRatI)
          (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
          w tol d lo mid with
      | none => rw [hc1] at hc; simp at hc
      | some x =>
        rw [hc1] at hc
        cases hc2 : coverFast (ofRatI jQ) (ofRatI rhoQ)
            (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
            (pl.map ofRatI) (ql.map ofRatI)
            (ofRatHi (lipBoundQ pl rhoQ)) (ofRatHi (lipBoundQ ql rhoQ))
            w tol d mid hi with
        | none => rw [hc2] at hc; simp at hc
        | some y =>
          rw [hc2] at hc
          injection hc with hxy; subst hxy
          have hi1 := ih lo mid x hlo0 (by omega) hc1
          have hi2 := ih mid hi y (by omega) (by omega) hc2
          rw [← intervalIntegral.integral_add_adjacent_intervals
            (fourQuarterValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU _ _)
            (fourQuarterValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU _ _)
            (b := 2 * Real.arctan ((mid : ℝ) / D))]
          calc _ ≤ 4 * ((x : ℝ) / D) + 4 * ((y : ℝ) / D) := add_le_add hi1 hi2
            _ = 4 * (((x + y : ℤ) : ℝ) / D) := by push_cast; ring

theorem hmean_of_quarterMeanOK {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G) (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {M : Sym2R} {MI : SR} (hM : memSR M MI) {pl ql : List ℚ}
    {rhoQ jQ budgetQ : ℚ} {r : ℝ} {depth : ℕ} {tolerance : ℤ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (covarianceCurve M pl ql t) l)
    (hc : CircleWide.quarterMeanOK MI pl ql rhoQ jQ budgetQ depth tolerance = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholSymPair F G (covarianceCurve M pl ql
        (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ (budgetQ : ℝ) := by
  have hD := D_pos
  have hD0 : (0 : ℤ) ≤ D := by exact_mod_cast hD.le
  set pl' := trimQ pl
  set ql' := trimQ ql
  have hRtrim : covarianceCurve M pl' ql' = covarianceCurve M pl ql :=
    funext (covarianceCurve_trimQ M pl ql)
  have hU' : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (covarianceCurve M pl' ql' t) l := by
    simpa only [hRtrim] using hU
  unfold CircleWide.quarterMeanOK at hc
  dsimp only at hc
  cases hq : coverFast (ofRatI jQ) (ofRatI rhoQ)
      (mulI MI.a MI.a) (mulI MI.b MI.b) (mulI MI.a MI.b) (mulI MI.b MI.c) (mulI MI.c MI.c)
      (pl'.map ofRatI) (ql'.map ofRatI)
      (ofRatHi (lipBoundQ pl' rhoQ)) (ofRatHi (lipBoundQ ql' rhoQ))
      (D / 8) tolerance depth 0 D with
  | none => rw [hq] at hc; simp at hc
  | some q =>
    rw [hq, decide_eq_true_eq] at hc
    have iq := coverFast_sound hFm hGm hF hG hM hρ0 hj0 hr hU' (D / 8) tolerance depth 0 D q
      le_rfl hD0 hq
    have e_zero : 2 * Real.arctan (((0 : ℤ) : ℝ) / D) = 0 := by simp
    have e_pos : 2 * Real.arctan ((D : ℝ) / D) = Real.pi / 2 := by
      rw [div_self hD.ne', Real.arctan_one]; ring
    rw [e_zero, e_pos, hRtrim] at iq
    set R := covarianceCurve M pl ql
    have hint := pairCircleValue_intervalIntegrable hFm hGm hF hG hρ0 hr hU
    have hf : (fun θ : ℝ ↦ ‖HholSymPair F G (R (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2) =
        pairCircleValue F G R (rhoQ : ℝ) false := by
      funext θ; simp [pairCircleValue, HardyArcSound.sig]
    rw [hf]
    have hper : Function.Periodic (pairCircleValue F G R (rhoQ : ℝ) false) (2 * Real.pi) := fun θ ↦ by
      simp only [pairCircleValue]; congr 4; push_cast
      rw [add_mul, Complex.exp_add, Complex.exp_two_pi_mul_I, mul_one]
    have hshift : ∫ θ in (0 : ℝ)..2 * Real.pi, pairCircleValue F G R (rhoQ : ℝ) false θ =
        ∫ θ in (-(Real.pi / 2))..(-(Real.pi / 2) + 2 * Real.pi),
          pairCircleValue F G R (rhoQ : ℝ) false θ := by
      simpa using hper.intervalIntegral_add_eq 0 (-(Real.pi / 2))
    rw [hshift, ← intervalIntegral.integral_add_adjacent_intervals
      (hint false _ _) (hint false _ _) (b := Real.pi / 2)]
    have hsecond : ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi),
        pairCircleValue F G R (rhoQ : ℝ) false θ =
        ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ := by
      have e : ∀ θ : ℝ, pairCircleValue F G R (rhoQ : ℝ) false (θ + Real.pi) =
          pairCircleValue F G R (rhoQ : ℝ) true θ := fun θ ↦ by
        simp only [pairCircleValue, HardyArcSound.sig, Bool.false_eq_true, ↓reduceIte, one_mul]
        congr 4; push_cast
        rw [add_mul, Complex.exp_add, Complex.exp_pi_mul_I]; ring
      calc ∫ θ in (Real.pi / 2)..(-(Real.pi / 2) + 2 * Real.pi),
              pairCircleValue F G R (rhoQ : ℝ) false θ
          = ∫ θ in (-(Real.pi / 2) + Real.pi)..(Real.pi / 2 + Real.pi),
              pairCircleValue F G R (rhoQ : ℝ) false θ := by congr 1 <;> ring
        _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2),
              pairCircleValue F G R (rhoQ : ℝ) false (θ + Real.pi) :=
            (intervalIntegral.integral_comp_add_right
              (pairCircleValue F G R (rhoQ : ℝ) false) Real.pi).symm
        _ = ∫ θ in (-(Real.pi / 2))..(Real.pi / 2),
              pairCircleValue F G R (rhoQ : ℝ) true θ := by simp only [e]
    rw [hsecond]
    have hsplit : ∀ neg : Bool,
        ∫ θ in (-(Real.pi / 2))..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) neg θ =
        (∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) neg θ) +
          (∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) neg (-θ)) := by
      intro neg
      rw [← intervalIntegral.integral_add_adjacent_intervals
        (hint neg _ _) (hint neg _ _) (b := 0)]
      have hneg : ∫ θ in (-(Real.pi / 2))..(0 : ℝ), pairCircleValue F G R (rhoQ : ℝ) neg θ =
          ∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) neg (-θ) := by
        simp [intervalIntegral.integral_comp_neg]
      rw [hneg, add_comm]
    rw [hsplit false, hsplit true]
    have hfn : IntervalIntegrable (fun θ ↦ pairCircleValue F G R (rhoQ : ℝ) false (-θ))
        volume 0 (Real.pi / 2) := by
      simpa using (IntervalIntegrable.iff_comp_neg (a := -(0 : ℝ)) (b := -(Real.pi / 2))).mp
        (hint false _ _)
    have htn : IntervalIntegrable (fun θ ↦ pairCircleValue F G R (rhoQ : ℝ) true (-θ))
        volume 0 (Real.pi / 2) := by
      simpa using (IntervalIntegrable.iff_comp_neg (a := -(0 : ℝ)) (b := -(Real.pi / 2))).mp
        (hint true _ _)
    have hcomb :
        ((∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) false θ) +
          (∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) false (-θ))) +
        ((∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true θ) +
          (∫ θ in (0 : ℝ)..(Real.pi / 2), pairCircleValue F G R (rhoQ : ℝ) true (-θ))) =
        ∫ θ in (0 : ℝ)..(Real.pi / 2), fourQuarterValue F G R (rhoQ : ℝ) θ := by
      unfold fourQuarterValue
      rw [intervalIntegral.integral_add (((hint false _ _).add hfn).add (hint true _ _)) htn,
        intervalIntegral.integral_add ((hint false _ _).add hfn) (hint true _ _),
        intervalIntegral.integral_add (hint false _ _) hfn]
      ring
    rw [hcomb, inv_mul_le_iff₀ (by positivity)]
    have hsum : 4 * ((q : ℝ) / D) ≤ 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) := by
      have h1 : ((4 * q : ℤ) : ℝ) ≤ (ofRatLo (2 * piLo20Q * budgetQ) : ℝ) := by exact_mod_cast hc
      have h2 := ofRatLo_le (2 * piLo20Q * budgetQ)
      push_cast at h1 h2
      rw [show (4 : ℝ) * ((q : ℝ) / D) = (4 * (q : ℝ)) / D by ring, div_le_iff₀ hD]
      linarith
    have hpi : (piLo20Q : ℝ) ≤ Real.pi := by
      have hp := Real.pi_gt_d20
      have heq : (piLo20Q : ℝ) = 3.14159265358979323846 := by norm_num [piLo20Q]
      linarith
    have h2pi : 2 * (piLo20Q : ℝ) * (budgetQ : ℝ) ≤ 2 * Real.pi * (budgetQ : ℝ) :=
      mul_le_mul_of_nonneg_right (by linarith) hB0
    linarith

theorem hardy_of_quarter_checks {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF : ∀ u, ‖F u‖ ≤ 1) (hG : ∀ u, ‖G u‖ ≤ 1)
    {M : Sym2R} {MI : SR} (hM : memSR M MI) (pl ql : List ℚ)
    {rho region j budget : ℚ} {tubeDepth meanDepth : ℕ} {tolerance : ℤ}
    (hrho : 1 < rho) (hr : rho < region)
    (hj : 0 < j) (hB : 0 ≤ budget)
    (htube : CircleCheck.tubeQuarterOK MI pl ql region tubeDepth = true)
    (hcircle : CircleWide.quarterMeanOK MI pl ql rho j budget meanDepth tolerance = true)
    {h : ℕ → ℝ} (hs : Summable fun k ↦ |h k|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun k ↦ (h k : ℂ) * (t : ℂ) ^ (2 * k + 1))
        (HholSymPair F G (covarianceCurve M pl ql t))) (J : ℕ) :
    ∑ k ∈ range J, h k ^ 2 * (rho : ℝ) ^ (2 * (2 * k + 1)) ≤ (budget : ℝ) := by
  have hr0 : 0 < region := (zero_lt_one.trans hrho).trans hr
  have hpos := covariance_kerPos_on_ball_of_tube hM pl ql hr0 htube
  have hdiff := covarianceCurve_differentiable M pl ql
  have hm := hmean_of_quarterMeanOK hFm hGm hF hG hM
    (by exact_mod_cast (zero_lt_one.trans hrho).le) (by exact_mod_cast hj)
    (by exact_mod_cast hB) (by exact_mod_cast hr) hpos hcircle
  exact hardy_of_symmetric_pair_curve hFm hGm hF hG
    (by exact_mod_cast zero_lt_one.trans hrho) (by exact_mod_cast hr)
    (by exact_mod_cast hrho.trans hr)
    hdiff.1.differentiableOn hdiff.2.1.differentiableOn hdiff.2.2.differentiableOn
    hpos hs hreal hm J

end

end Grothe.UpperReplacement.CircleWideSound
