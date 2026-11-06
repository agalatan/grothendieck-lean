import Grothe.UpperQuad.TwistBridge
import Grothe.UpperQuad.TailBound

/-!
# The tail and the root gaps of the twisted quadrature

As for the checker (`TailBound.lean`, part (T) of `docs/QUAD_CHECKER.md` §12.4): the part of the
coefficient `a_j(q,c,d)` carried by the radial event `|z|² ∈ S` is
`twistPart j S q c d = ⟪h_{qcd}, hpow j · 1_{|z|² ∈ S}⟫`, by Bessel and `|hpow j| ≤ 1` the parts on
the uncovered set `tailSet = (100, ∞) ∪ gaps` have squared `ℓ²` norm at most `10⁻³¹`
(`norm_twistTail_sq_le`), and the part on the covered set is the radial integral over the panels
(`twistPart_eq_radial`).  So the remainder hypothesis reduces to the covered set:

    TwistRemainderHyp j ρ :  Σ_{q < Q_j} Σ_{c,d} ‖twistPart j tailSetᶜ q c d − â_j(q,c,d)‖² ≤ ρ²

gives `TwistQuadHyp j (ρ + 10⁻¹⁵)` (`twistQuadHyp_of_remainder`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open MeasureTheory Set GrotheQuad Grothe.UpperChaos Grothe.UpperQuad.Tail Grothe.LowerAnalytic
open Grothe.UpperChaos.FixedChaosSmoothing
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-- The part of `a_j(q,c,d)` carried by the radial event `S`. -/
def twistPart (j : ℕ) (S : Set ℝ) (q c d : ℕ) : ℂ :=
  ∫ u in radialSet S, conj (hfun2 (gradedMode q c d) u) * hpow j u ∂mu2

theorem twistCoefficient_eq_part_add (j : ℕ) {S : Set ℝ} (hS : MeasurableSet S) (q c d : ℕ) :
    twistCoefficient j q c d = twistPart j S q c d + twistPart j Sᶜ q c d := by
  unfold twistCoefficient hpowL2 hvec2 twistPart
  rw [inner_toLp2, radialSet_compl,
    integral_add_compl (measurableSet_radialSet hS) (integrable_twist j _)]

/-- `hpow j` restricted to the radial event, in `L²(mu2)`. -/
def hpowPart (j : ℕ) (S : Set ℝ) (hS : MeasurableSet S) : Lp ℂ 2 mu2 :=
  ((chargeFn_hpow phiBound j).memLp.indicator (measurableSet_radialSet hS)).toLp _

lemma inner_hvec2_hpowPart (j : ℕ) {S : Set ℝ} (hS : MeasurableSet S) (i : Idx2) :
    ⟪hvec2 i, hpowPart j S hS⟫_ℂ = ∫ u in radialSet S, conj (hfun2 i u) * hpow j u ∂mu2 := by
  rw [hvec2, hpowPart, inner_toLp2, ← integral_indicator (measurableSet_radialSet hS)]
  congr 1
  funext u
  by_cases hu : u ∈ radialSet S <;> simp [hu]

lemma norm_hpow_le_one (j : ℕ) (u : ℂ × ℂ) : ‖hpow j u‖ ≤ 1 := by
  have hφu : |phiT u| ≤ 1 := by
    have := phiBound u; rw [← sq_le_one_iff_abs_le_one]; linarith
  rw [hpow, norm_mul, norm_pow, norm_mul, Complex.norm_I, one_mul, Complex.norm_real,
    Real.norm_eq_abs]
  calc |phiT u| ^ j * ‖F0 u‖ ≤ 1 * 1 :=
        mul_le_mul (pow_le_one₀ (abs_nonneg _) hφu) (Grothe.Haag.norm_ph_le _) (norm_nonneg _)
          zero_le_one
    _ = 1 := one_mul 1

lemma norm_hpowPart_sq_le (j : ℕ) {S : Set ℝ} (hS : MeasurableSet S) :
    ‖hpowPart j S hS‖ ^ 2 ≤ mu2.real (radialSet S) := by
  unfold hpowPart
  rw [norm_toLp_sq_eq_integral]
  have hI : Integrable ((radialSet S).indicator (fun _ => (1 : ℝ))) mu2 :=
    (integrable_const 1).indicator (measurableSet_radialSet hS)
  calc
    _ ≤ ∫ u, (radialSet S).indicator (fun _ => (1 : ℝ)) u ∂mu2 := by
      apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => sq_nonneg _) hI
      exact Filter.Eventually.of_forall fun u => by
        by_cases hu : u ∈ radialSet S
        · simp only [Set.indicator_of_mem hu]
          have hF := norm_hpow_le_one j u
          have h0 := norm_nonneg (hpow j u)
          change ‖hpow j u‖ ^ 2 ≤ 1
          nlinarith [hF]
        · simp [hu]
    _ = mu2.real (radialSet S) := integral_indicator_one (measurableSet_radialSet hS)

/-- **Bessel** for the parts of the twisted coefficients. -/
theorem sum_norm_twistPart_sq_le (j N : ℕ) {S : Set ℝ} (hS : MeasurableSet S) :
    ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖twistPart j S q c d‖ ^ 2 ≤ mu2.real (radialSet S) := by
  have h := hasSum_energy2 (hpowPart j S hS)
  have hle := sum_le_hasSum (gradedSupport N)
    (fun i _ => sq_nonneg ‖⟪hvec2 i, hpowPart j S hS⟫_ℂ‖) h
  rw [sum_gradedSupport N (fun i => ‖⟪hvec2 i, hpowPart j S hS⟫_ℂ‖ ^ 2),
    sum_bounded_graded_eq_range N
      (fun q c d => ‖⟪hvec2 (gradedMode q c d), hpowPart j S hS⟫_ℂ‖ ^ 2)] at hle
  simp_rw [inner_hvec2_hpowPart] at hle
  exact hle.trans (norm_hpowPart_sq_le j hS)

/-- **(T)**: the tail and the gaps carry at most `10⁻³¹` of the squared `ℓ²` norm. -/
theorem norm_twistTail_sq_le (j N : ℕ) :
    ∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖twistPart j tailSet q c d‖ ^ 2 ≤ 1 / 10 ^ 31 := by
  calc _ ≤ mu2.real (radialSet tailSet) := sum_norm_twistPart_sq_le j N measurableSet_tailSet
    _ = ∫ s in tailSet ∩ Ioi 0, Real.exp (-s) := by
        rw [mu2_real_radialSet, gaussC_real_radial measurableSet_tailSet]
    _ ≤ 1 / 10 ^ 31 := integral_tailSet_le

/-- The part on a radial event is the radial integral over `(0, ∞) ∩ S`. -/
theorem twistPart_eq_radial (j : ℕ) {S : Set ℝ} (hS : MeasurableSet S) (q c d : ℕ)
    (hc : c ≤ q + 1) (hd : d ≤ q) :
    twistPart j S q c d = ∫ s in Ioi (0 : ℝ) ∩ S, (twistIntegrand j q c d s : ℂ) := by
  let i := gradedMode q c d
  have hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
    show q + 1 - c + c = q - d + d + 1
    omega
  have hm : Measurable (fun s : ℝ => twistSlice j i (Real.sqrt s : ℂ)) :=
    (measurable_twistSlice j i).comp (Complex.measurable_ofReal.comp Real.continuous_sqrt.measurable)
  have hA : MeasurableSet {z : ℂ | ‖z‖ ^ 2 ∈ S} := (measurable_norm.pow_const 2) hS
  unfold twistPart radialSet
  calc ∫ u in {z : ℂ | ‖z‖ ^ 2 ∈ S} ×ˢ univ, conj (hfun2 i u) * hpow j u ∂mu2
      = ∫ z in {z : ℂ | ‖z‖ ^ 2 ∈ S}, twistSlice j i z ∂gaussC := by
        rw [setIntegral_prod _ (integrable_twist j i).integrableOn]
        simp only [Measure.restrict_univ]
        rfl
    _ = ∫ z, S.indicator (fun s => twistSlice j i (Real.sqrt s : ℂ)) (‖z‖ ^ 2) ∂gaussC := by
        rw [← integral_indicator hA]
        apply integral_congr_ae
        filter_upwards with z
        by_cases hz : ‖z‖ ^ 2 ∈ S
        · rw [Set.indicator_of_mem hz, Set.indicator_of_mem (show z ∈ {z : ℂ | ‖z‖ ^ 2 ∈ S} from hz),
            Real.sqrt_sq (norm_nonneg z)]
          exact twistSlice_eq_norm j i hi z
        · rw [Set.indicator_of_notMem hz,
            Set.indicator_of_notMem (show z ∉ {z : ℂ | ‖z‖ ^ 2 ∈ S} from hz)]
    _ = ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) *
          S.indicator (fun s => twistSlice j i (Real.sqrt s : ℂ)) s :=
        integral_gaussC_norm_sq_complex _ (hm.indicator hS)
    _ = ∫ s in Ioi (0 : ℝ),
          S.indicator (fun s => (Real.exp (-s) : ℂ) * twistSlice j i (Real.sqrt s : ℂ)) s := by
        apply setIntegral_congr_fun measurableSet_Ioi
        intro s _
        by_cases hs : s ∈ S
        · simp only [Set.indicator_of_mem hs]
        · simp only [Set.indicator_of_notMem hs, mul_zero]
    _ = ∫ s in Ioi (0 : ℝ) ∩ S, (Real.exp (-s) : ℂ) * twistSlice j i (Real.sqrt s : ℂ) :=
        setIntegral_indicator hS
    _ = _ := by
        apply setIntegral_congr_fun (measurableSet_Ioi.inter hS)
        intro s hs
        simp only
        rw [twistSlice_eq]
        change (Real.exp (-s) : ℂ) * (conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) *
          twistCoef j s (c, d)) = _
        rw [conj_primary_psiR q c d hc hd (le_of_lt hs.1), twistCoef_eq_re j s (c, d)]
        simp only [twistIntegrand]
        push_cast
        ring

/-- **The remainder hypothesis on the covered set** (the analogue of the checker's
`QuadRemainderHyp`): on the panels, the parts of the coefficients and their exact Gauss sums differ
by at most `ρ` in `ℓ²` over the center's support. -/
def TwistRemainderHyp (j : ℕ) (ρ : ℝ) : Prop :=
  ∑ q ∈ Finset.range (twistParams j).Q, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    ‖twistPart j tailSetᶜ q c d - (twistGauss j q c d : ℂ)‖ ^ 2 ≤ ρ ^ 2

/-- The covered-set remainder and the tail give the remainder hypothesis of the bridge. -/
theorem twistQuadHyp_of_remainder (j : ℕ) {ρ : ℝ} (hρ : 0 ≤ ρ) (h : TwistRemainderHyp j ρ) :
    TwistQuadHyp j (1 / 10 ^ 15 + ρ) := by
  unfold TwistQuadHyp
  set Q := (twistParams j).Q
  have hterm : ∀ q c d, q < Q → c < q + 2 → d < q + 1 →
      ((∫ s in Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d) ^ 2 ≤
        (‖twistPart j tailSet q c d‖ + ‖twistPart j tailSetᶜ q c d - (twistGauss j q c d : ℂ)‖) ^ 2 := by
    intro q c d _ hc hd
    have h1 := twistCoefficient_eq_part_add j measurableSet_tailSet q c d
    rw [twistCoefficient_eq_ofReal j q c d (by omega) (by omega)] at h1
    have h2 : (((∫ s in Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d : ℝ) : ℂ) =
        twistPart j tailSet q c d + (twistPart j tailSetᶜ q c d - (twistGauss j q c d : ℂ)) := by
      push_cast; rw [h1]; ring
    have h3 : |(∫ s in Ioi (0 : ℝ), twistIntegrand j q c d s) - twistGauss j q c d| ≤
        ‖twistPart j tailSet q c d‖ + ‖twistPart j tailSetᶜ q c d - (twistGauss j q c d : ℂ)‖ := by
      rw [← Real.norm_eq_abs, ← Complex.norm_real, h2]
      exact norm_add_le _ _
    rw [← sq_abs]
    exact pow_le_pow_left₀ (abs_nonneg _) h3 2
  have hsum := Finset.sum_le_sum fun q hq => Finset.sum_le_sum fun c hc => Finset.sum_le_sum
    fun d hd => hterm q c d (Finset.mem_range.mp hq) (Finset.mem_range.mp hc)
      (Finset.mem_range.mp hd)
  refine hsum.trans (sum3_add_sq_le Q _ _ (by norm_num) hρ ?_ h)
  calc _ ≤ (1 : ℝ) / 10 ^ 31 := norm_twistTail_sq_le j Q
    _ ≤ (1 / 10 ^ 15) ^ 2 := by norm_num

end

end Grothe.UpperQuad
