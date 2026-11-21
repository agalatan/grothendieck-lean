import Grothe.UpperChaos.Realise2
import Grothe.UpperChaos.HardyHolo
import Grothe.UpperReplacement.Mixture

set_option warningAsError true

-- Section: PairEnergy

/-!
# Real cross energies for symmetric pairs of responses

Agent-ID: codex-a7c4.

The average of the two orientations `(F,G)` and `(G,F)` has real Hermite cross coefficients.
Polarization expresses those coefficients through ordinary energies, so the existing bivariate
kernel identity applies without any positivity assumption on the cross coefficients.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Real cross energy, expressed by polarization. It can be negative. -/
def pairEnergy (F G : Lp ℂ 2 mu2) (nm : ℕ × ℕ) : ℝ :=
  (energy (F + G) nm - energy (F - G) nm) / 4

/-- Identification with the real Hermite overlaps computed by the cell certificate. -/
theorem pairEnergy_eq_overlap (F G : Lp ℂ 2 mu2) (nm : ℕ × ℕ) :
    pairEnergy F G nm = ∑' i : bideg ⁻¹' {nm},
      (conj ⟪hvec2 i.1, F⟫_ℂ * ⟪hvec2 i.1, G⟫_ℂ).re := by
  unfold pairEnergy energy
  have hp : Summable (fun i : bideg ⁻¹' {nm} ↦ ‖⟪hvec2 i.1, F + G⟫_ℂ‖ ^ 2) :=
    (hasSum_energy2 (F + G)).summable.subtype _
  have hm : Summable (fun i : bideg ⁻¹' {nm} ↦ ‖⟪hvec2 i.1, F - G⟫_ℂ‖ ^ 2) :=
    (hasSum_energy2 (F - G)).summable.subtype _
  rw [← hp.tsum_sub hm, ← tsum_div_const]
  apply tsum_congr
  intro i
  rw [inner_add_right, inner_sub_right, norm_add_sq (𝕜 := ℂ), norm_sub_sq (𝕜 := ℂ)]
  simp only [RCLike.inner_apply, RCLike.re_to_complex]
  rw [mul_comm (conj _)]
  ring

theorem summable_abs_pairEnergy (F G : Lp ℂ 2 mu2) :
    Summable fun nm ↦ |pairEnergy F G nm| := by
  refine Summable.of_nonneg_of_le (fun _ ↦ abs_nonneg _) (fun nm ↦ ?_)
    (((hasSum_energy_bideg (F + G)).summable.add
      (hasSum_energy_bideg (F - G)).summable).div_const 4)
  dsimp [pairEnergy]
  rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 4)]
  apply div_le_div_of_nonneg_right _ (by norm_num)
  simpa only [abs_of_nonneg (energy_nonneg _ _)] using
    abs_sub (energy (F + G) nm) (energy (F - G) nm)

theorem ChargeOne.add {F G : Lp ℂ 2 mu2} (hF : ChargeOne F) (hG : ChargeOne G) :
    ChargeOne (F + G) := by
  intro i hi
  simp only [inner_add_right, hF i hi, hG i hi, add_zero]

theorem ChargeOne.sub {F G : Lp ℂ 2 mu2} (hF : ChargeOne F) (hG : ChargeOne G) :
    ChargeOne (F - G) := by
  intro i hi
  simp only [inner_sub_right, hF i hi, hG i hi, sub_self]

/-- Polarization of the actual Gaussian pairing, with no condition on the correlations beyond
the marginal variance bounds. -/
theorem Bm_pair_polarization {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1)
    (F G : Lp ℂ 2 mu2) :
    (Bm h₁ h₂ F G + Bm h₁ h₂ G F) / 2 =
      (Bm h₁ h₂ (F + G) (F + G) - Bm h₁ h₂ (F - G) (F - G)) / 4 := by
  simp only [Bm, map_add, map_sub, inner_add_left, inner_add_right,
    inner_sub_left, inner_sub_right]
  ring

open Polynomial in
theorem bivarKernel_pairEnergy (F G : Lp ℂ 2 mu2) {P Q : ℝ[X]}
    (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) (j : ℕ) :
    Grothe.Upper.bivarKernel P Q (pairEnergy F G) j =
      (Grothe.Upper.bivarKernel P Q (energy (F + G)) j -
        Grothe.Upper.bivarKernel P Q (energy (F - G)) j) / 4 := by
  unfold Grothe.Upper.bivarKernel
  have e : ∀ nm, pairEnergy F G nm * (Grothe.Upper.termOf P Q nm).coeff j =
      (energy (F + G) nm * (Grothe.Upper.termOf P Q nm).coeff j -
        energy (F - G) nm * (Grothe.Upper.termOf P Q nm).coeff j) / 4 := by
    intro nm
    unfold pairEnergy
    ring
  simp_rw [e]
  rw [tsum_div_const,
    Summable.tsum_sub
      (Grothe.Upper.summable_kernel_term hP hQ (summable_abs_energy (F + G)) j)
      (Grothe.Upper.summable_kernel_term hP hQ (summable_abs_energy (F - G)) j)]

open Polynomial in
/-- The radial kernel of the symmetrized response pair has the signed cross energies as its
coefficients. This is an identity for the actual Gaussian correlation. -/
theorem Bm_pair_polyKernel {F G : Lp ℂ 2 mu2}
    (hF : ChargeOne F) (hG : ChargeOne G) {P Q : ℝ[X]}
    (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1)
    {z : ℂ} (hz : ‖z‖ ≤ 1) (h₁ : ‖Grothe.polyKernel P z‖ ≤ 1)
    (h₂ : ‖Grothe.polyKernel Q z‖ ≤ 1) :
    (Bm h₁ h₂ F G + Bm h₁ h₂ G F) / 2 =
      radialKernel (Grothe.Upper.bivarKernel P Q (pairEnergy F G)) z := by
  rw [Bm_pair_polarization,
    Bm_polyKernel (hF.add hG) hP hQ hz h₁ h₂,
    Bm_polyKernel (hF.sub hG) hP hQ hz h₁ h₂]
  have hp := Grothe.Upper.summable_abs_bivarKernel P Q hP hQ
    (energy (F + G)) (summable_abs_energy (F + G))
  have hm := Grothe.Upper.summable_abs_bivarKernel P Q hP hQ
    (energy (F - G)) (summable_abs_energy (F - G))
  unfold radialKernel
  simp_rw [bivarKernel_pairEnergy F G hP hQ, Complex.ofReal_div,
    Complex.ofReal_sub, Complex.ofReal_ofNat]
  rw [← Summable.tsum_sub (summable_radial_term hp hz) (summable_radial_term hm hz),
    ← tsum_div_const]
  apply tsum_congr
  intro j
  ring

end

end Grothe.UpperChaos

-- Section: PairRealise

/-!
# Independent left and right responses in Gaussian rounding

Agent-ID: codex-a7c4.

Both sides use the same underlying pair of Gaussian vectors, so all matrix entries are realized
jointly. No symmetry between the two responses is assumed.
-/

open MeasureTheory ProbabilityTheory Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

variable {κ κ' : Type} [Fintype κ] [Fintype κ']

theorem integral_two_channel_pair (F G : ℂ × ℂ → ℂ)
    (hF : Measurable F) (hG : Measurable G) {a w : EuclideanSpace ℂ κ}
    {a' w' : EuclideanSpace ℂ κ'} (ha : ‖a‖ = 1) (hw : ‖w‖ = 1) (haw : ⟪a, w⟫_ℂ = 0)
    (ha' : ‖a'‖ = 1) (hw' : ‖w'‖ = 1) (haw' : ⟪a', w'⟫_ℂ = 0) (ρ₁ ρ₂ : ℂ) :
    ∫ q, conj (F (⟪q.1, a⟫_ℂ / ((√2 : ℝ) : ℂ), ⟪q.2, a'⟫_ℂ / ((√2 : ℝ) : ℂ)))
        * G (⟪q.1, ρ₁ • a + sig ρ₁ • w⟫_ℂ / ((√2 : ℝ) : ℂ),
            ⟪q.2, ρ₂ • a' + sig ρ₂ • w'⟫_ℂ / ((√2 : ℝ) : ℂ))
        ∂((ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ)).prod
          (ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ')))
      = ∫ ω, conj (F (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  set Ψ : (ℂ × ℂ) × (ℂ × ℂ) → ℂ := fun ω => conj (F (Xof ω)) * G (Yof ρ₁ ρ₂ ω) with hΨ
  have hΨm : Measurable Ψ := by
    have h1 : Measurable Xof := by unfold Xof; fun_prop
    have h2 : Measurable (Yof ρ₁ ρ₂) := (measurable_mY ρ₁).prodMap (measurable_mY ρ₂)
    exact (Complex.continuous_conj.measurable.comp (hF.comp h1)).mul (hG.comp h2)
  set T := Prod.map (coords4 (frame a w)) (coords4 (frame a' w')) with hT
  have hTm : Measurable T :=
    (coords4 (frame a w)).continuous.measurable.prodMap (coords4 (frame a' w')).continuous.measurable
  have hmapT : ((ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ)).prod
      (ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ'))).map T = g4.prod g4 := by
    rw [hT, ← Measure.map_prod_map _ _ (coords4 (frame a w)).continuous.measurable
      (coords4 (frame a' w')).continuous.measurable, map_coords4 _ (orthonormal_frame ha hw haw),
      map_coords4 _ (orthonormal_frame ha' hw' haw')]
  have e : ∀ q : EuclideanSpace ℂ κ × EuclideanSpace ℂ κ',
      conj (F (⟪q.1, a⟫_ℂ / ((√2 : ℝ) : ℂ), ⟪q.2, a'⟫_ℂ / ((√2 : ℝ) : ℂ)))
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

/-- Correlation of distinct responses after two polynomial preprocessors. -/
def pairKernel (F G : ℂ × ℂ → ℂ) (P Q : Polynomial ℝ) (z : ℂ) : ℂ :=
  ∫ ω, conj (F (Xof ω)) *
    G (Yof (Grothe.polyKernel P z) (Grothe.polyKernel Q z) ω) ∂mu4

open Polynomial in
/-- Any measurable disk-valued response pair gives a dominated rounding kernel. -/
theorem pair_rounding_diskKernel {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF1 : ∀ u, ‖F u‖ ≤ 1) (hG1 : ∀ u, ‖G u‖ ≤ 1) {P Q : ℝ[X]}
    (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) :
    DiskKernel (pairKernel F G P Q) := by
  intro m n ι _ x y hx hy
  set s2 : ℂ := ((√2 : ℝ) : ℂ)
  refine ⟨EuclideanSpace ℂ (Option (Grothe.RIdx ι (P.natDegree + 1)))
      × EuclideanSpace ℂ (Option (Grothe.RIdx ι (Q.natDegree + 1))), inferInstance,
    (ProbabilityTheory.stdGaussian _).prod (ProbabilityTheory.stdGaussian _), inferInstance,
    fun q i => F (⟪q.1, emb (Grothe.realL P (x i))⟫_ℂ / s2, ⟪q.2, emb (Grothe.realL Q (x i))⟫_ℂ / s2),
    fun q j => G (⟪q.1, emb (Grothe.realR P (y j))⟫_ℂ / s2, ⟪q.2, emb (Grothe.realR Q (y j))⟫_ℂ / s2),
    fun i => (hFm.comp (by fun_prop)).aestronglyMeasurable,
    fun j => (hGm.comp (by fun_prop)).aestronglyMeasurable,
    fun q i => hF1 _, fun q j => hG1 _, fun i j => ?_⟩
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
  show ∫ q, conj (F (⟪q.1, a⟫_ℂ / s2, ⟪q.2, a'⟫_ℂ / s2)) * G (⟪q.1, b⟫_ℂ / s2, ⟪q.2, b'⟫_ℂ / s2)
      ∂((ProbabilityTheory.stdGaussian _).prod (ProbabilityTheory.stdGaussian _)) = _
  rw [hbw, hbw', integral_two_channel_pair F G hFm hGm ha hw haw ha' hw' haw', hρ₁, hρ₂]
  rfl

/-- The pairing on `L²` is the integral of the two original representatives. -/
theorem Bm_pair_toLp {F G : ℂ × ℂ → ℂ}
    (hFL : MemLp F 2 mu2) (hGL : MemLp G 2 mu2)
    {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) :
    Bm h₁ h₂ (hFL.toLp F) (hGL.toLp G) =
      ∫ ω, conj (F (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  rw [Bm_eq_integral]
  refine integral_congr_ae ?_
  filter_upwards [mp_X.quasiMeasurePreserving.ae_eq_comp hFL.coeFn_toLp,
    (mp_Y h₁ h₂).quasiMeasurePreserving.ae_eq_comp hGL.coeFn_toLp] with ω hx hy
  simp only [Function.comp] at hx hy
  rw [hx, hy]

theorem norm_polyKernel_le {P : Polynomial ℝ} (hP : Grothe.l1 P ≤ 1)
    {z : ℂ} (hz : ‖z‖ ≤ 1) : ‖Grothe.polyKernel P z‖ ≤ 1 := by
  rw [Grothe.polyKernel, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  have h := (Grothe.abs_eval_le_l1 P (sq_nonneg ‖z‖)
    (pow_le_one₀ (norm_nonneg _) hz)).trans hP
  exact (mul_le_mul hz h (abs_nonneg _) zero_le_one).trans_eq (one_mul 1)

open Polynomial in
/-- The symmetrized pair gives a dominated radial kernel with its signed cross energies.
All hypotheses concern the actual responses, not a surrogate coefficient table. -/
theorem pair_radial_dominated {F G : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hGm : Measurable G)
    (hF1 : ∀ u, ‖F u‖ ≤ 1) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hFL : MemLp F 2 mu2) (hGL : MemLp G 2 mu2)
    (hFc : ∀ c u, ‖c‖ = 1 → F (rot2 c u) = c * F u)
    (hGc : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u)
    {P Q : ℝ[X]} (hP : Grothe.l1 P ≤ 1) (hQ : Grothe.l1 Q ≤ 1) :
    DominatedKernel (radialKernel
      (Grothe.Upper.bivarKernel P Q (pairEnergy (hFL.toLp F) (hGL.toLp G)))) := by
  let K : Bool → ℂ → ℂ := fun b ↦ if b then pairKernel F G P Q else pairKernel G F P Q
  have hK : ∀ b ∈ (Finset.univ : Finset Bool), DominatedKernel (K b) := by
    intro b _
    cases b
    · exact (pair_rounding_diskKernel hGm hFm hG1 hF1 hP hQ).dominated
    · exact (pair_rounding_diskKernel hFm hGm hF1 hG1 hP hQ).dominated
  have hm := DominatedKernel.mixture Finset.univ (fun _ : Bool ↦ (1 / 2 : ℝ)) K hK
    (by norm_num)
  refine hm.congr fun z hz ↦ ?_
  have hp := norm_polyKernel_le hP hz
  have hq := norm_polyKernel_le hQ hz
  have he := Bm_pair_polyKernel (chargeOne_toLp hFL hFc) (chargeOne_toLp hGL hGc)
    hP hQ hz hp hq
  rw [Bm_pair_toLp hFL hGL, Bm_pair_toLp hGL hFL] at he
  change (∑ b : Bool, ((1 / 2 : ℝ) : ℂ) * K b z) = _
  simp only [Fintype.sum_bool]
  change ((1 / 2 : ℝ) : ℂ) * pairKernel F G P Q z +
    ((1 / 2 : ℝ) : ℂ) * pairKernel G F P Q z = _
  unfold pairKernel
  convert he using 1
  push_cast
  ring

end

end Grothe.UpperChaos

-- Section: PairHolomorphy

/-!
# Holomorphic response pairs with arbitrary analytic covariance curves

Agent-ID: codex-a7c4.

The private mixture uses different polynomial preprocessors and contour radii in each channel.
The incumbent `Rt` curve is therefore not sufficient. This theorem retains the actual Gaussian
integral and proves holomorphy for any analytic symmetric covariance curve with local decay.
-/

open MeasureTheory
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- Average of the two actual response orientations, matching `pairEnergy`. -/
def HholSymPair (F G : ℂ × ℂ → ℂ) (R : Sym2C) : ℂ :=
  (HholPair F G R + HholPair G F R) / 2

/-- Holomorphy of a measurable disk-valued response pair along an arbitrary analytic curve.
The positivity premise concerns the actual continued covariance, at every point of the open set.
-/
theorem differentiableOn_HholPair_curve {F G : ℂ × ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hFb : ∀ u, ‖F u‖ ≤ 1) (hGb : ∀ u, ‖G u‖ ≤ 1)
    {R : ℂ → Sym2C} {U : Set ℂ} (hU : IsOpen U)
    (ha : DifferentiableOn ℂ (fun t ↦ (R t).a) U)
    (hb : DifferentiableOn ℂ (fun t ↦ (R t).b) U)
    (hc : DifferentiableOn ℂ (fun t ↦ (R t).c) U)
    (hpos : ∀ t ∈ U, ∃ l > 0, KerPos (R t) l) :
    DifferentiableOn ℂ (fun t ↦ HholPair F G (R t)) U := by
  have hdet : ∀ t ∈ U, (R t).detIm ≠ 0 := fun t ht ↦ by
    obtain ⟨l, hl, h⟩ := hpos t ht
    exact detIm_ne_zero_of_kerPos hl h
  have hda : ∀ t ∈ U, DifferentiableAt ℂ (fun s ↦ (R s).a) t :=
    fun t ht ↦ ha.differentiableAt (hU.mem_nhds ht)
  have hdb : ∀ t ∈ U, DifferentiableAt ℂ (fun s ↦ (R s).b) t :=
    fun t ht ↦ hb.differentiableAt (hU.mem_nhds ht)
  have hdc : ∀ t ∈ U, DifferentiableAt ℂ (fun s ↦ (R s).c) t :=
    fun t ht ↦ hc.differentiableAt (hU.mem_nhds ht)
  have hcoef : ∀ k, DifferentiableOn ℂ (fun t ↦ coefK (R t) k) U := fun k t ht ↦
    (differentiableAt_coefK (hda t ht) (hdb t ht) (hdc t ht)
      (hdet t ht) k).differentiableWithinAt
  have hfun : (fun t ↦ HholPair F G (R t)) = fun t ↦ ∫ q : Pt8,
      (conj (F (toC2 q.1.1 q.1.2)) * G (toC2 q.2.1 q.2.2)) *
        (((((2 * Real.pi) ^ 4 : ℝ) : ℂ)⁻¹ * (R t).detIm⁻¹) *
          Complex.exp (∑ k, coefK (R t) k * (mK k q : ℂ))) := by
    funext t
    exact HholPair_eq F G _
  rw [hfun]
  refine differentiableOn_integral_exp (n := 6) hU hcoef
    ?_ (fun k ↦ ?_) ?_ (fun q ↦ ?_) N8_nonneg abs_mK_le (fun t ht ↦ ?_)
    (fun l hl ↦ integrable_exp_neg_N8 hl) (fun l hl ↦ integrable_N8_mul_exp hl)
  · intro t ht
    exact ((differentiableAt_const _).mul
      ((differentiableAt_detIm (hda t ht) (hdb t ht) (hdc t ht)).inv
        (hdet t ht))).differentiableWithinAt
  · exact (continuous_mK k).measurable
  · exact ((Complex.continuous_conj.measurable.comp
      (hF.comp (measurable_toC2.comp measurable_fst))).mul
      (hG.comp (measurable_toC2.comp measurable_snd))).aestronglyMeasurable
  · rw [norm_mul, Complex.norm_conj]
    exact (mul_le_mul (hFb _) (hGb _) (norm_nonneg _) zero_le_one).trans_eq (one_mul 1)
  · obtain ⟨l, hl, h⟩ := hpos t ht
    exact ⟨l / 2, half_pos hl, fun q ↦ re_sum_le h q⟩

/-- Orientation averaging preserves holomorphy of the actual Gaussian integral. -/
theorem differentiableOn_HholSymPair_curve {F G : ℂ × ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hFb : ∀ u, ‖F u‖ ≤ 1) (hGb : ∀ u, ‖G u‖ ≤ 1)
    {R : ℂ → Sym2C} {U : Set ℂ} (hU : IsOpen U)
    (ha : DifferentiableOn ℂ (fun t ↦ (R t).a) U)
    (hb : DifferentiableOn ℂ (fun t ↦ (R t).b) U)
    (hc : DifferentiableOn ℂ (fun t ↦ (R t).c) U)
    (hpos : ∀ t ∈ U, ∃ l > 0, KerPos (R t) l) :
    DifferentiableOn ℂ (fun t ↦ HholSymPair F G (R t)) U :=
  ((differentiableOn_HholPair_curve hF hG hFb hGb hU ha hb hc hpos).add
    (differentiableOn_HholPair_curve hG hF hGb hFb hU ha hb hc hpos)).div_const 2

/-- A common Schur bound for the two orientations also bounds their average. -/
theorem norm_HholSymPair_sq_le {F G : ℂ × ℂ → ℂ} {R : Sym2C} {B : ℝ}
    (hFG : ‖HholPair F G R‖ ^ 2 ≤ B) (hGF : ‖HholPair G F R‖ ^ 2 ≤ B) :
    ‖HholSymPair F G R‖ ^ 2 ≤ B := by
  have ht : ‖HholSymPair F G R‖ ≤ (‖HholPair F G R‖ + ‖HholPair G F R‖) / 2 := by
    rw [HholSymPair, norm_div, show ‖(2 : ℂ)‖ = (2 : ℝ) by norm_num]
    exact div_le_div_of_nonneg_right (norm_add_le _ _) (by norm_num)
  calc
    ‖HholSymPair F G R‖ ^ 2
        ≤ ((‖HholPair F G R‖ + ‖HholPair G F R‖) / 2) ^ 2 :=
      pow_le_pow_left₀ (norm_nonneg _) ht 2
    _ ≤ B := by nlinarith [sq_nonneg (‖HholPair F G R‖ - ‖HholPair G F R‖)]

/-- The Hardy estimate with independent covariance curve, contour radius, and budget. -/
theorem hardy_of_pair_curve {F G : ℂ × ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hFb : ∀ u, ‖F u‖ ≤ 1) (hGb : ∀ u, ‖G u‖ ≤ 1)
    {R : ℂ → Sym2C} {ρ r : ℝ} (hρ : 0 < ρ) (hρr : ρ < r) (hr : 1 < r)
    (ha : DifferentiableOn ℂ (fun t ↦ (R t).a) (Metric.ball 0 r))
    (hb : DifferentiableOn ℂ (fun t ↦ (R t).b) (Metric.ball 0 r))
    (hc : DifferentiableOn ℂ (fun t ↦ (R t).c) (Metric.ball 0 r))
    (hpos : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (R t) l)
    {h : ℕ → ℝ} (hs : Summable fun j ↦ |h j|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun j ↦ (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (HholPair F G (R t)))
    {B : ℝ} (hmean : (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholPair F G (R ((ρ : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ B)
    (J : ℕ) :
    ∑ n ∈ Finset.range J, h n ^ 2 * ρ ^ (2 * (2 * n + 1)) ≤ B := by
  have hdiff := differentiableOn_HholPair_curve hF hG hFb hGb
    Metric.isOpen_ball ha hb hc hpos
  have hball := hasSum_odd_of_eqOn_real hr hdiff hs hreal
  refine sum_sq_le_of_mean_le (f := fun t ↦ HholPair F G (R t))
    (fun θ ↦ hball _ ?_) (summable_abs_of_hasSum_ball hρ.le hρr hball) hmean J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real,
    Real.norm_eq_abs, Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos hρ]
  exact hρr

/-- Hardy estimate for the symmetrized kernel whose coefficients are real signed overlaps. -/
theorem hardy_of_symmetric_pair_curve {F G : ℂ × ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hFb : ∀ u, ‖F u‖ ≤ 1) (hGb : ∀ u, ‖G u‖ ≤ 1)
    {R : ℂ → Sym2C} {ρ r : ℝ} (hρ : 0 < ρ) (hρr : ρ < r) (hr : 1 < r)
    (ha : DifferentiableOn ℂ (fun t ↦ (R t).a) (Metric.ball 0 r))
    (hb : DifferentiableOn ℂ (fun t ↦ (R t).b) (Metric.ball 0 r))
    (hc : DifferentiableOn ℂ (fun t ↦ (R t).c) (Metric.ball 0 r))
    (hpos : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (R t) l)
    {h : ℕ → ℝ} (hs : Summable fun j ↦ |h j|)
    (hreal : ∀ t : ℝ, 0 < t → t < 1 →
      HasSum (fun j ↦ (h j : ℂ) * (t : ℂ) ^ (2 * j + 1)) (HholSymPair F G (R t)))
    {B : ℝ} (hmean : (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholSymPair F G (R ((ρ : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤ B)
    (J : ℕ) :
    ∑ n ∈ Finset.range J, h n ^ 2 * ρ ^ (2 * (2 * n + 1)) ≤ B := by
  have hdiff := differentiableOn_HholSymPair_curve hF hG hFb hGb
    Metric.isOpen_ball ha hb hc hpos
  have hball := hasSum_odd_of_eqOn_real hr hdiff hs hreal
  refine sum_sq_le_of_mean_le (f := fun t ↦ HholSymPair F G (R t))
    (fun θ ↦ hball _ ?_) (summable_abs_of_hasSum_ball hρ.le hρr hball) hmean J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real,
    Real.norm_eq_abs, Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos hρ]
  exact hρr

end

end Grothe.UpperChaos
