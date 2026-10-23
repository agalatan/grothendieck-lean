import Grothe.UpperChaos.Kernel2
import Grothe.Haagerup.Identity

/-!
# Two-channel Gaussian rounding with a disk-valued function on `ℂ²` (S5 of PLAN_UPPER)

Let `G : ℂ² → ℂ` be measurable, disk-valued and of charge one, and `P, Q` real polynomials with
`‖P‖_𝒜, ‖Q‖_𝒜 ≤ 1`.  For unit families `xᵢ, yⱼ` round by

    εᵢ = G(⟪g, Lₚxᵢ⟫/√2, ⟪g', L_Q xᵢ⟫/√2),   δⱼ = G(⟪g, Rₚyⱼ⟫/√2, ⟪g', R_Q yⱼ⟫/√2)

with two independent standard Gaussian vectors `g, g'` and the tensor realisations `L, R` of
`Realise.lean`.  Then `E[conj εᵢ δⱼ] = radialKernel (bivarKernel P Q (energy G)) ⟪xᵢ, yⱼ⟫`
(`rounding_diskKernel`), so this kernel is a `DiskKernel`, hence dominated.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-! ### Planar Gaussians -/

/-- `(a, b) ↦ (a + ib)/√2`. -/
def cxs (q : ℝ × ℝ) : ℂ := cx q / ((√2 : ℝ) : ℂ)

lemma continuous_cxs : Continuous cxs := by
  unfold cxs; fun_prop

lemma measurable_cxs : Measurable cxs := continuous_cxs.measurable

lemma map_cxs : g2.map cxs = gaussC := by
  have h := (measurePreserving_finTwoArrow (gaussianReal 0 1)).map_eq
  have e : toC = cxs ∘ MeasurableEquiv.finTwoArrow := by
    funext x; simp [toC, cxs, cx, MeasurableEquiv.finTwoArrow, Complex.ext_iff]
  rw [gaussC, Grothe.LowerAnalytic.stdGaussian, e, ← Measure.map_map measurable_cxs
    MeasurableEquiv.finTwoArrow.measurable, h]

/-- `((p₁, p₂), (p₁', p₂')) ↦ ((cxs p₁, cxs p₂), (cxs p₁', cxs p₂'))`. -/
def S4 (p : ((ℝ × ℝ) × (ℝ × ℝ)) × ((ℝ × ℝ) × (ℝ × ℝ))) : (ℂ × ℂ) × (ℂ × ℂ) :=
  ((cxs p.1.1, cxs p.1.2), (cxs p.2.1, cxs p.2.2))

lemma measurable_S4 : Measurable S4 := by
  unfold S4
  have := measurable_cxs
  fun_prop

lemma map_S4 : (g4.prod g4).map S4 = mu4 := by
  have h2 : g4.map (Prod.map cxs cxs) = mu2 := by
    rw [← Measure.map_prod_map _ _ measurable_cxs measurable_cxs, map_cxs]
  have e : S4 = Prod.map (Prod.map cxs cxs) (Prod.map cxs cxs) := rfl
  rw [e, ← Measure.map_prod_map _ _ (measurable_cxs.prodMap measurable_cxs)
    (measurable_cxs.prodMap measurable_cxs), h2]

/-! ### Two independent Gaussian channels -/

variable {κ κ' : Type} [Fintype κ] [Fintype κ']

/-- `√(1 − |ρ|²)` as a real number. -/
lemma sig_eq (ρ : ℂ) : sig ρ = ((√(1 - ‖ρ‖ ^ 2) : ℝ) : ℂ) := rfl

/-- **Two-channel reduction**: with unit `a ⊥ w` in `ℂ^κ`, `a' ⊥ w'` in `ℂ^{κ'}`, the pair of
roundings through `g, g'` has the law of `(X, Y)` on `mu4`. -/
theorem integral_two_channel (G : ℂ × ℂ → ℂ) (hG : Measurable G) {a w : EuclideanSpace ℂ κ}
    {a' w' : EuclideanSpace ℂ κ'} (ha : ‖a‖ = 1) (hw : ‖w‖ = 1) (haw : ⟪a, w⟫_ℂ = 0)
    (ha' : ‖a'‖ = 1) (hw' : ‖w'‖ = 1) (haw' : ⟪a', w'⟫_ℂ = 0) (ρ₁ ρ₂ : ℂ) :
    ∫ q, conj (G (⟪q.1, a⟫_ℂ / ((√2 : ℝ) : ℂ), ⟪q.2, a'⟫_ℂ / ((√2 : ℝ) : ℂ)))
        * G (⟪q.1, ρ₁ • a + sig ρ₁ • w⟫_ℂ / ((√2 : ℝ) : ℂ),
            ⟪q.2, ρ₂ • a' + sig ρ₂ • w'⟫_ℂ / ((√2 : ℝ) : ℂ))
        ∂((ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ)).prod
          (ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ')))
      = ∫ ω, conj (G (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  set Ψ : (ℂ × ℂ) × (ℂ × ℂ) → ℂ := fun ω => conj (G (Xof ω)) * G (Yof ρ₁ ρ₂ ω) with hΨ
  have hΨm : Measurable Ψ := by
    have h1 : Measurable Xof := by unfold Xof; fun_prop
    have h2 : Measurable (Yof ρ₁ ρ₂) := (measurable_mY ρ₁).prodMap (measurable_mY ρ₂)
    exact (Complex.continuous_conj.measurable.comp (hG.comp h1)).mul (hG.comp h2)
  set T := Prod.map (coords4 (frame a w)) (coords4 (frame a' w')) with hT
  have hTm : Measurable T :=
    (coords4 (frame a w)).continuous.measurable.prodMap (coords4 (frame a' w')).continuous.measurable
  have hmapT : ((ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ)).prod
      (ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ'))).map T = g4.prod g4 := by
    rw [hT, ← Measure.map_prod_map _ _ (coords4 (frame a w)).continuous.measurable
      (coords4 (frame a' w')).continuous.measurable, map_coords4 _ (orthonormal_frame ha hw haw),
      map_coords4 _ (orthonormal_frame ha' hw' haw')]
  have e : ∀ q : EuclideanSpace ℂ κ × EuclideanSpace ℂ κ',
      conj (G (⟪q.1, a⟫_ℂ / ((√2 : ℝ) : ℂ), ⟪q.2, a'⟫_ℂ / ((√2 : ℝ) : ℂ)))
        * G (⟪q.1, ρ₁ • a + sig ρ₁ • w⟫_ℂ / ((√2 : ℝ) : ℂ),
            ⟪q.2, ρ₂ • a' + sig ρ₂ • w'⟫_ℂ / ((√2 : ℝ) : ℂ))
      = Ψ (S4 (T q)) := fun q => by
    obtain ⟨h1, h2⟩ := inner_g_eq_cx a w q.1
    obtain ⟨h1', h2'⟩ := inner_g_eq_cx a' w' q.2
    have hd : ∀ u v r t : ℂ, (r * u + t * v) / ((√2 : ℝ) : ℂ)
        = r * (u / ((√2 : ℝ) : ℂ)) + t * (v / ((√2 : ℝ) : ℂ)) := fun u v r t => by ring
    simp only [hΨ, S4, hT, Prod.map, Xof, Yof, mY, cxs, inner_add_right, inner_smul_right, h1, h2,
      h1', h2', hd]
  simp_rw [e]
  have i1 := integral_map (μ := (ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ)).prod
    (ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ'))) hTm.aemeasurable
    (hΨm.comp measurable_S4).aestronglyMeasurable
  rw [hmapT] at i1
  have i2 := integral_map (μ := g4.prod g4) measurable_S4.aemeasurable hΨm.aestronglyMeasurable
  rw [map_S4] at i2
  exact i1.symm.trans i2.symm

/-! ### The rounding kernel -/

lemma norm_inner_le_one {κ : Type} [Fintype κ] {u v : EuclideanSpace ℂ κ} (hu : ‖u‖ = 1)
    (hv : ‖v‖ = 1) : ‖⟪u, v⟫_ℂ‖ ≤ 1 := by
  simpa [hu, hv] using norm_inner_le_norm (𝕜 := ℂ) u v

variable {G : ℂ × ℂ → ℂ}

lemma Bm_toLp (hGL : MemLp G 2 mu2) {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) :
    Bm h₁ h₂ (hGL.toLp G) (hGL.toLp G) = ∫ ω, conj (G (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  rw [Bm_eq_integral]
  refine integral_congr_ae ?_
  filter_upwards [mp_X.quasiMeasurePreserving.ae_eq_comp hGL.coeFn_toLp,
    (mp_Y h₁ h₂).quasiMeasurePreserving.ae_eq_comp hGL.coeFn_toLp] with ω hx hy
  simp only [Function.comp] at hx hy
  rw [hx, hy]

lemma chargeOne_toLp (hGL : MemLp G 2 mu2) (hch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) :
    ChargeOne (hGL.toLp G) := by
  intro i hi
  rw [inner_hvec2_left]
  have hint : ∫ u, conj (H2 i u) * (hGL.toLp G) u ∂mu2 = ∫ u, conj (H2 i u) * G u ∂mu2 := by
    refine integral_congr_ae ?_
    filter_upwards [hGL.coeFn_toLp] with u hu
    rw [hu]
  rw [hint, integral_H2_charge_one hGL hch hi, mul_zero]

open Polynomial in
/-- **The two-channel Gaussian rounding with a disk-valued charge-one `G` realises the radial
kernel of its chaos energies** (with preprocessors `P, Q`). -/
theorem rounding_diskKernel (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2) {P Q : ℝ[X]}
    (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) :
    DiskKernel (radialKernel (Grothe.Upper.bivarKernel P Q (energy (hGL.toLp G)))) := by
  intro m n ι _ x y hx hy
  set s2 : ℂ := ((√2 : ℝ) : ℂ)
  refine ⟨EuclideanSpace ℂ (Option (Grothe.RIdx ι (P.natDegree + 1)))
      × EuclideanSpace ℂ (Option (Grothe.RIdx ι (Q.natDegree + 1))), inferInstance,
    (ProbabilityTheory.stdGaussian _).prod (ProbabilityTheory.stdGaussian _), inferInstance,
    fun q i => G (⟪q.1, emb (Grothe.realL P (x i))⟫_ℂ / s2, ⟪q.2, emb (Grothe.realL Q (x i))⟫_ℂ / s2),
    fun q j => G (⟪q.1, emb (Grothe.realR P (y j))⟫_ℂ / s2, ⟪q.2, emb (Grothe.realR Q (y j))⟫_ℂ / s2),
    fun i => (hGm.comp (by fun_prop)).aestronglyMeasurable,
    fun j => (hGm.comp (by fun_prop)).aestronglyMeasurable,
    fun q i => hG1 _, fun q j => hG1 _, fun i j => ?_⟩
  set a := emb (Grothe.realL P (x i))
  set b := emb (Grothe.realR P (y j))
  set a' := emb (Grothe.realL Q (x i))
  set b' := emb (Grothe.realR Q (y j))
  have ha : ‖a‖ = 1 := norm_emb (Grothe.norm_realL P hP _ (hx i))
  have hb : ‖b‖ = 1 := norm_emb (Grothe.norm_realR P hP _ (hy j))
  have ha' : ‖a'‖ = 1 := norm_emb (Grothe.norm_realL Q hQ _ (hx i))
  have hb' : ‖b'‖ = 1 := norm_emb (Grothe.norm_realR Q hQ _ (hy j))
  obtain ⟨w, hw, haw, hbw⟩ := exists_decomp ha hb (norm_eNone _) (inner_emb_eNone _)
  obtain ⟨w', hw', haw', hbw'⟩ := exists_decomp ha' hb' (norm_eNone _) (inner_emb_eNone _)
  rw [← sig_eq] at hbw hbw'
  have hρ₁ : ⟪a, b⟫_ℂ = Grothe.polyKernel P ⟪x i, y j⟫_ℂ := by
    rw [inner_emb, Grothe.inner_realL_realR]
  have hρ₂ : ⟪a', b'⟫_ℂ = Grothe.polyKernel Q ⟪x i, y j⟫_ℂ := by
    rw [inner_emb, Grothe.inner_realL_realR]
  have h₁ : ‖Grothe.polyKernel P ⟪x i, y j⟫_ℂ‖ ≤ 1 := hρ₁ ▸ norm_inner_le_one ha hb
  have h₂ : ‖Grothe.polyKernel Q ⟪x i, y j⟫_ℂ‖ ≤ 1 := hρ₂ ▸ norm_inner_le_one ha' hb'
  have hz : ‖⟪x i, y j⟫_ℂ‖ ≤ 1 := norm_inner_le_one (hx i) (hy j)
  show ∫ q, conj (G (⟪q.1, a⟫_ℂ / s2, ⟪q.2, a'⟫_ℂ / s2)) * G (⟪q.1, b⟫_ℂ / s2, ⟪q.2, b'⟫_ℂ / s2)
      ∂((ProbabilityTheory.stdGaussian _).prod (ProbabilityTheory.stdGaussian _)) = _
  rw [hbw, hbw', integral_two_channel G hGm ha hw haw ha' hw' haw', hρ₁, hρ₂,
    ← Bm_toLp hGL h₁ h₂, Bm_polyKernel (chargeOne_toLp hGL hch) hP hQ hz h₁ h₂]

end

end Grothe.UpperChaos
