import Grothe.UpperQuad.TwistLoopSound
import Grothe.UpperChaos.ProductionF0Radial
import Grothe.UpperChaos.HermiteConjugation

/-!
# The radial reduction of the twisted coefficients

For the charge-one mode `i = gradedMode q c d` the Hermite coefficient of the Taylor source is the
radial integral of the twisted conditional coefficient (`docs/UPPER_CLOSURE.md` §8.1, §8.3):

    a_j(q,c,d) = ⟨hvec2 i, hpow j⟩ = ∫_{s > 0} e^{−s} ψ_{(q,c,d)}(s) J^{(j)}_{c,d}(s) ds,

`ψ_{(q,c,d)}(s) = conj h_{q+1−c, q−d}(√s) = psiR q c d s` (`conj_primary_psiR`), by Fubini on
`mu2`, the rotation invariance of the charge-one integrand and the radial law of `|z|²`
(`inner_hvec2_hpow_eq_radial`, the analogue of `baseGradedCoefficient_eq_radial`).  Since
`J^{(j)}_{c,d}` is real, so is `a_j(q,c,d)` (`twistCoefficient_eq_ofReal`).

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open MeasureTheory Set GrotheQuad Grothe.UpperChaos Grothe.LowerAnalytic
open Grothe.UpperChaos.FixedChaosSmoothing
open scoped ComplexConjugate InnerProductSpace

noncomputable section

/-- The unscaled Taylor source in `L²(mu2)`. -/
def hpowL2 (j : ℕ) : Lp ℂ 2 mu2 := (chargeFn_hpow phiBound j).memLp.toLp (hpow j)

/-- The Hermite coefficient `a_j(q,c,d) = ⟨hvec2 (gradedMode q c d), hpow j⟩`. -/
def twistCoefficient (j q c d : ℕ) : ℂ := ⟪hvec2 (gradedMode q c d), hpowL2 j⟫_ℂ

/-- The radial integrand `e^{−s} ψ_{(q,c,d)}(s) Re J^{(j)}_{c,d}(s)`. -/
def twistIntegrand (j q c d : ℕ) (s : ℝ) : ℝ :=
  Real.exp (-s) * (psiR q c d s * (twistCoef j s (c, d)).re)

lemma hpow_rot2 {c : ℂ} (hc : ‖c‖ = 1) (j : ℕ) (u : ℂ × ℂ) : hpow j (rot2 c u) = c * hpow j u := by
  simp only [hpow, F0_rot2 hc, phiT_rot2 hc]; ring

/-- The twisted conditional slice `∫ conj(h_i(z, w)) hpow j (z, w) dγ(w)`. -/
def twistSlice (j : ℕ) (i : Idx2) (z : ℂ) : ℂ :=
  ∫ w, conj (hfun2 i (z, w)) * hpow j (z, w) ∂gaussC

lemma integrable_twist (j : ℕ) (i : Idx2) :
    Integrable (fun u => conj (hfun2 i u) * hpow j u) mu2 :=
  (memLp_hfun2 i).star.integrable_mul (chargeFn_hpow phiBound j).memLp

lemma measurable_twistSlice (j : ℕ) (i : Idx2) : Measurable (twistSlice j i) := by
  have hm : Measurable (fun u : ℂ × ℂ => conj (hfun2 i u) * hpow j u) :=
    (Complex.continuous_conj.comp (continuous_hfun2 i)).measurable.mul (chargeFn_hpow phiBound j).meas
  exact hm.stronglyMeasurable.integral_prod_right'.measurable

lemma twistSlice_rot (j : ℕ) (i : Idx2) (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) (c z : ℂ)
    (hc : ‖c‖ = 1) : twistSlice j i (c * z) = twistSlice j i z := by
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]
    norm_num
  have hrot := integral_rot_gaussC c hc (fun w : ℂ => conj (hfun2 i (c * z, w)) * hpow j (c * z, w))
  calc
    _ = ∫ w, conj (hfun2 i (c * z, c * w)) * hpow j (c * z, c * w) ∂gaussC := hrot.symm
    _ = _ := by
      apply integral_congr_ae
      filter_upwards [] with w
      change conj (hfun2 i (rot2 c (z, w))) * hpow j (rot2 c (z, w)) = _
      rw [hfun2_rot2_of_charge i hi c (z, w) hc, hpow_rot2 hc]
      simp only [map_mul]
      calc (conj c * conj (hfun2 i (z, w))) * (c * hpow j (z, w)) =
          (conj c * c) * (conj (hfun2 i (z, w)) * hpow j (z, w)) := by ring
        _ = _ := by rw [hcc, one_mul]

lemma twistSlice_eq_norm (j : ℕ) (i : Idx2) (hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1) (z : ℂ) :
    twistSlice j i z = twistSlice j i (‖z‖ : ℂ) := by
  by_cases hz : z = 0
  · simp [hz]
  · have hn : (‖z‖ : ℂ) ≠ 0 := by exact_mod_cast (norm_ne_zero_iff.mpr hz)
    let c : ℂ := z / (‖z‖ : ℂ)
    have hc : ‖c‖ = 1 := by
      dsimp only [c]
      rw [norm_div, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (norm_nonneg z)]
      exact div_self (norm_ne_zero_iff.mpr hz)
    have he : c * (‖z‖ : ℂ) = z := by dsimp only [c]; exact div_mul_cancel₀ z hn
    have h := twistSlice_rot j i hi c (‖z‖ : ℂ) hc
    rw [he] at h
    exact h

lemma twistSlice_eq (j : ℕ) (i : Idx2) (s : ℝ) :
    twistSlice j i (Real.sqrt s : ℂ) = conj (hfun i.1 (Real.sqrt s : ℂ)) * twistCoef j s i.2 := by
  unfold twistSlice twistCoef
  simp_rw [hfun2_eq_coordinate_product, map_mul, mul_assoc]
  rw [integral_const_mul]

/-- The primary factor `conj h_{q+1−c, q−d}(√s) = ψ_{(q,c,d)}(s)` for every mode. -/
theorem conj_primary_psiR (q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q) {s : ℝ} (hs : 0 ≤ s) :
    conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) = (psiR q c d s : ℂ) := by
  unfold psiR radialKM
  split_ifs with hcd
  · exact RadialLaguerre.conj_primary_laguerre q c d hd hcd hs
  · -- the swapped pair: `conj h_{p,p'} = h_{p',p}` and the canonical form of `(d+1, c−1)`
    have hswap : conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) =
        hfun (q - d, q + 1 - c) (Real.sqrt s : ℂ) := by
      simp only [hfun, map_mul, Complex.conj_ofReal, conj_ev_H_swap]
      congr 2
      unfold nrm
      rw [mul_comm (Nat.factorial _)]
    have hcan := RadialLaguerre.conj_primary_laguerre q (d + 1) (c - 1) (by omega) (by omega) hs
    have h1 : q + 1 - (d + 1) = q - d := by omega
    have h2 : q - (c - 1) = q + 1 - c := by omega
    rw [h1, h2] at hcan
    rw [hswap]
    have := congrArg conj hcan
    rw [Complex.conj_conj, Complex.conj_ofReal] at this
    rw [this]
    congr 2 <;> omega

/-- **The radial reduction**: `a_j(q,c,d) = ∫_{s>0} e^{−s} ψ_{(q,c,d)}(s) J^{(j)}_{c,d}(s) ds`. -/
theorem twistCoefficient_eq_radial (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q) :
    twistCoefficient j q c d =
      ∫ s in Ioi (0 : ℝ), (Real.exp (-s) : ℂ) * ((psiR q c d s : ℂ) * twistCoef j s (c, d)) := by
  let i := gradedMode q c d
  have hi : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1 := by
    show q + 1 - c + c = q - d + d + 1
    omega
  have hm : Measurable (fun s : ℝ => twistSlice j i (Real.sqrt s : ℂ)) :=
    (measurable_twistSlice j i).comp (Complex.measurable_ofReal.comp Real.continuous_sqrt.measurable)
  unfold twistCoefficient hpowL2 hvec2
  rw [inner_toLp2]
  calc
    _ = ∫ z, twistSlice j i z ∂gaussC := integral_prod _ (integrable_twist j i)
    _ = ∫ z, twistSlice j i (Real.sqrt (‖z‖ ^ 2) : ℂ) ∂gaussC := by
      apply integral_congr_ae
      filter_upwards [] with z
      rw [Real.sqrt_sq (norm_nonneg z)]
      exact twistSlice_eq_norm j i hi z
    _ = ∫ s : ℝ in Ioi 0, (Real.exp (-s) : ℂ) * twistSlice j i (Real.sqrt s : ℂ) :=
      integral_gaussC_norm_sq_complex _ hm
    _ = _ := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro s hs
      simp only
      rw [twistSlice_eq]
      change (Real.exp (-s) : ℂ) * (conj (hfun (q + 1 - c, q - d) (Real.sqrt s : ℂ)) *
        twistCoef j s (c, d)) = _
      rw [conj_primary_psiR q c d hc hd (le_of_lt hs)]

/-- The coefficient is real: `a_j(q,c,d) = ∫_{s>0} e^{−s} ψ Re J`. -/
theorem twistCoefficient_eq_ofReal (j q c d : ℕ) (hc : c ≤ q + 1) (hd : d ≤ q) :
    twistCoefficient j q c d = ((∫ s in Ioi (0 : ℝ), twistIntegrand j q c d s : ℝ) : ℂ) := by
  rw [twistCoefficient_eq_radial j q c d hc hd, ← integral_ofReal]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro s _
  simp only [twistIntegrand]
  rw [twistCoef_eq_re j s (c, d)]
  push_cast
  ring

end

end Grothe.UpperQuad
