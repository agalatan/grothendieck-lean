import Grothe.Haagerup.Phase
import Grothe.UpperChaos.Charge
import Grothe.UpperChaos.LawY
import Grothe.UpperChaos.DiagonalPairing
import Grothe.Upper.Haagerup

/-!
# The phase kernel from its Hermite energies

The one-coordinate Mehler pairing is diagonal in the complex Hermite basis.  Charge selection
reduces the phase pairing to the coefficients `(k+1,k)`, so their squared norms determine its
radial kernel, including the boundary of the unit disk.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Grothe.UpperChaos
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.Haag

noncomputable section

private lemma mp_first : MeasurePreserving (Prod.fst : ℂ × ℂ → ℂ) mu2 gaussC := by
  refine ⟨measurable_fst, ?_⟩
  rw [Measure.map_fst_prod, measure_univ, one_smul]

private lemma mp_mehler {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    MeasurePreserving (fun u : ℂ × ℂ => ρ * u.1 + sig ρ * u.2) mu2 gaussC :=
  ⟨by fun_prop, map_mehlerY hρ⟩

private def PX1 : Lp ℂ 2 gaussC →ₗᵢ[ℂ] Lp ℂ 2 mu2 :=
  Lp.compMeasurePreservingₗᵢ ℂ Prod.fst mp_first

private def PY1 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) : Lp ℂ 2 gaussC →ₗᵢ[ℂ] Lp ℂ 2 mu2 :=
  Lp.compMeasurePreservingₗᵢ ℂ _ (mp_mehler hρ)

private def B1 {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (F G : Lp ℂ 2 gaussC) : ℂ :=
  ⟪PX1 F, PY1 hρ G⟫_ℂ

private lemma B1_eq_integral {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (F G : Lp ℂ 2 gaussC) :
    B1 hρ F G = ∫ u, conj (F u.1) * G (ρ * u.1 + sig ρ * u.2) ∂mu2 := by
  rw [B1, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [Lp.coeFn_compMeasurePreserving F mp_first,
    Lp.coeFn_compMeasurePreserving G (mp_mehler hρ)] with u h1 h2
  change ⟪(Lp.compMeasurePreserving Prod.fst mp_first F : _ → ℂ) u,
    (Lp.compMeasurePreserving _ (mp_mehler hρ) G : _ → ℂ) u⟫_ℂ = _
  rw [h1, h2, RCLike.inner_apply, mul_comm]
  rfl

private lemma B1_hvec {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (i j : ℕ × ℕ) :
    B1 hρ (hvec i) (hvec j) = if i = j then ρ ^ i.1 * conj ρ ^ i.2 else 0 := by
  rw [B1_eq_integral]
  have hx := mp_first.quasiMeasurePreserving.ae_eq_comp (memLp_hfun i).coeFn_toLp
  have hy := (mp_mehler hρ).quasiMeasurePreserving.ae_eq_comp (memLp_hfun j).coeFn_toLp
  rw [integral_congr_ae (g := fun u => ((nrm i.1 i.2 : ℂ) * nrm j.1 j.2)
    * (conj (ev u.1 (H i.1 i.2)) * ev (ρ * u.1 + sig ρ * u.2) (H j.1 j.2))) ?_]
  · rw [integral_const_mul, integral_mehler hρ]
    by_cases h : i = j
    · subst h
      simp only [and_self, ↓reduceIte]
      have hn : ((nrm i.1 i.2 : ℂ) * nrm i.1 i.2)
          * ((i.1.factorial * i.2.factorial : ℕ) : ℂ) = 1 := by
        exact_mod_cast nrm_sq_mul i.1 i.2
      linear_combination (ρ ^ i.1 * conj ρ ^ i.2) * hn
    · have h' : ¬(i.1 = j.1 ∧ i.2 = j.2) := fun h' => h (Prod.ext h'.1 h'.2)
      simp [h, h']
  · filter_upwards [hx, hy] with u h1 h2
    simp only [Function.comp, hvec] at h1 h2 ⊢
    rw [h1, h2]
    simp [hfun, Complex.conj_ofReal]
    ring

/-- The one-coordinate Mehler expansion on the full closed disk. -/
private theorem mehler_one {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) (F G : Lp ℂ 2 gaussC) :
    HasSum (fun i => conj ⟪hvec i, F⟫_ℂ * (ρ ^ i.1 * conj ρ ^ i.2)
      * ⟪hvec i, G⟫_ℂ) (B1 hρ F G) := by
  simpa only [hermiteBasis_apply, B1, LinearIsometry.coe_toContinuousLinearMap] using
    hasSum_diagonal_pairing hermiteBasis PX1.toContinuousLinearMap
      (PY1 hρ).toContinuousLinearMap (fun i => ρ ^ i.1 * conj ρ ^ i.2)
      (fun i j => by simpa only [hermiteBasis_apply, B1,
        LinearIsometry.coe_toContinuousLinearMap] using B1_hvec hρ i j) F G

private lemma ph_div_pos (z : ℂ) {r : ℝ} (hr : 0 < r) : ph (z / (r : ℂ)) = ph z := by
  unfold ph
  rw [norm_div, Complex.norm_real, Real.norm_of_nonneg hr.le, Complex.ofReal_div]
  have hr' : (r : ℂ) ≠ 0 := by exact_mod_cast hr.ne'
  simp [div_eq_mul_inv, hr', mul_assoc]

private lemma B1_phase_eq {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    B1 hρ phaseLp phaseLp = Phi2 ρ √(1 - ‖ρ‖ ^ 2) := by
  rw [B1_eq_integral]
  have hx := mp_first.quasiMeasurePreserving.ae_eq_comp memLp_ph.coeFn_toLp
  have hy := (mp_mehler hρ).quasiMeasurePreserving.ae_eq_comp memLp_ph.coeFn_toLp
  rw [integral_congr_ae (g := fun u => conj (ph u.1) * ph (ρ * u.1 + sig ρ * u.2))
    (by
      filter_upwards [hx, hy] with u h1 h2
      simp only [Function.comp_apply] at h1 h2
      change conj ((memLp_ph.toLp ph) u.1) *
        (memLp_ph.toLp ph) (ρ * u.1 + sig ρ * u.2) = _
      rw [h1, h2])]
  have hmap : g4.map (Prod.map cxs cxs) = mu2 := by
    rw [← Measure.map_prod_map _ _ measurable_cxs measurable_cxs, map_cxs]
  have hm : Measurable (fun u : ℂ × ℂ => conj (ph u.1) * ph (ρ * u.1 + sig ρ * u.2)) := by
    have := measurable_ph
    fun_prop
  rw [← hmap, integral_map (measurable_cxs.prodMap measurable_cxs).aemeasurable
    hm.aestronglyMeasurable]
  refine integral_congr_ae (Filter.Eventually.of_forall fun p => ?_)
  have he : ρ * cxs p.1 + sig ρ * cxs p.2
      = (ρ * cx p.1 + sig ρ * cx p.2) / ((√2 : ℝ) : ℂ) := by
    unfold cxs
    ring
  change conj (ph (cxs p.1)) * ph (ρ * cxs p.1 + sig ρ * cxs p.2) = _
  rw [he, ph_div_pos _ (by positivity), cxs, ph_div_pos _ (by positivity)]
  rfl

private lemma phase_coefficient_zero {p q : ℕ} (hpq : p ≠ q + 1) :
    ⟪hvec (p, q), phaseLp⟫_ℂ = 0 := by
  rw [inner_hvec_left]
  have hi : ∫ z, conj (ev z (H p q)) * phaseLp z ∂gaussC
      = ∫ z, conj (ev z (H p q)) * ph z ∂gaussC := by
    refine integral_congr_ae ?_
    filter_upwards [memLp_ph.coeFn_toLp] with z hz
    rw [phaseLp, hz]
  rw [hi, integral_H_charge_one (G := ph) ?_ hpq, mul_zero]
  intro c z hc
  simp only [ph, norm_mul, hc, one_mul]
  ring

/-- The squared phase coefficients determine Haagerup's radial kernel. -/
theorem Phi2_radial_of_phase_energy
    (hcoeff : ∀ k, ‖⟪hvec (k + 1, k), phaseLp⟫_ℂ‖ ^ 2 = haagCoeff k)
    {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) : Phi2 ρ √(1 - ‖ρ‖ ^ 2) = radialKernel haagCoeff ρ := by
  have hs := mehler_one hρ phaseLp phaseLp
  have hinj : Function.Injective (fun k : ℕ => (k + 1, k)) := by
    intro a b h
    exact congrArg Prod.snd h
  have hz : ∀ i : ℕ × ℕ, i ∉ Set.range (fun k : ℕ => (k + 1, k)) →
      conj ⟪hvec i, phaseLp⟫_ℂ * (ρ ^ i.1 * conj ρ ^ i.2) * ⟪hvec i, phaseLp⟫_ℂ = 0 := by
    intro i hi
    have h : i.1 ≠ i.2 + 1 := fun h => hi ⟨i.2, Prod.ext h.symm rfl⟩
    rw [phase_coefficient_zero h, mul_zero]
  have hs' := (hinj.hasSum_iff hz).2 hs
  have he : ∀ k, conj ⟪hvec (k + 1, k), phaseLp⟫_ℂ * (ρ ^ (k + 1) * conj ρ ^ k)
      * ⟪hvec (k + 1, k), phaseLp⟫_ℂ = (haagCoeff k : ℂ) * (ρ * (‖ρ‖ : ℂ) ^ (2 * k)) := by
    intro k
    have hc : conj ⟪hvec (k + 1, k), phaseLp⟫_ℂ * ⟪hvec (k + 1, k), phaseLp⟫_ℂ
        = (haagCoeff k : ℂ) := by
      rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hcoeff]
    have hp : ρ ^ (k + 1) * conj ρ ^ k = ρ * (‖ρ‖ : ℂ) ^ (2 * k) := by
      calc
        _ = ρ * (ρ * conj ρ) ^ k := by rw [mul_pow, pow_succ]; ring
        _ = _ := by rw [mul_comm ρ (conj ρ), ← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq,
          Complex.ofReal_pow, pow_mul]
    rw [hp, ← hc]
    ring
  have hs'' : HasSum (fun k => (haagCoeff k : ℂ) * (ρ * (‖ρ‖ : ℂ) ^ (2 * k)))
      (B1 hρ phaseLp phaseLp) := hs'.congr_fun (fun k => (he k).symm)
  rw [← B1_phase_eq hρ]
  exact hs''.tsum_eq.symm

end

end Grothe.Haag
