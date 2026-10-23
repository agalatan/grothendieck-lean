import Grothe.UpperChaos.LawY

/-!
# The complex Mehler formula on `ℂ²` for `L²` functions (U3 of PLAN_UPPER)

On `Ω = (ℂ × ℂ) × (ℂ × ℂ)` with `mu4 = mu2 ⊗ mu2` (coordinates `((x₁,w₁),(x₂,w₂))`) put
`X = (x₁, x₂)` and `Y = (ρ₁x₁ + σ₁w₁, ρ₂x₂ + σ₂w₂)`, `|ρ_k| ≤ 1`.  Both are standard on `ℂ²`
(`mp_X`, `mp_Y`), and for all `F, G ∈ L²(gaussC ⊗ gaussC)`

    E[conj F(X) · G(Y)] = Σ_i conj ⟪h_i, F⟫ · λ_i · ⟪h_i, G⟫,   λ_i = ρ₁^{p₁} ρ̄₁^{q₁} ρ₂^{p₂} ρ̄₂^{q₂}
                                                                       (`mehler_L2`, `Bm_eq_integral`)

The pairing is `⟪F ∘ X, G ∘ Y⟫` in `L²(mu4)`, so it is continuous in each variable; it is computed
on the Hermite basis by Fubini and the one-coordinate polynomial Mehler formula
(`integral_H2_XY`), and extended along `hermiteBasis2.hasSum_repr`.
-/

open MeasureTheory ProbabilityTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos

noncomputable section

/-- Two independent copies of `gaussC ⊗ gaussC`: `((x₁, w₁), (x₂, w₂))`. -/
abbrev mu4 : Measure ((ℂ × ℂ) × (ℂ × ℂ)) := mu2.prod mu2

/-- `X = (x₁, x₂)`. -/
def Xof (ω : (ℂ × ℂ) × (ℂ × ℂ)) : ℂ × ℂ := (ω.1.1, ω.2.1)

/-- `y = ρx + σw` in one coordinate. -/
def mY (ρ : ℂ) (u : ℂ × ℂ) : ℂ := ρ * u.1 + sig ρ * u.2

/-- `Y = (ρ₁x₁ + σ₁w₁, ρ₂x₂ + σ₂w₂)`. -/
def Yof (ρ₁ ρ₂ : ℂ) (ω : (ℂ × ℂ) × (ℂ × ℂ)) : ℂ × ℂ := (mY ρ₁ ω.1, mY ρ₂ ω.2)

lemma measurable_mY (ρ : ℂ) : Measurable (mY ρ) := by unfold mY; fun_prop

lemma mp_X : MeasurePreserving Xof mu4 mu2 := by
  refine ⟨by unfold Xof; fun_prop, ?_⟩
  have : Xof = Prod.map (Prod.fst : ℂ × ℂ → ℂ) Prod.fst := rfl
  rw [this, ← Measure.map_prod_map _ _ measurable_fst measurable_fst, Measure.map_fst_prod,
    measure_univ, one_smul]

lemma mp_Y {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1) : MeasurePreserving (Yof ρ₁ ρ₂) mu4 mu2 := by
  refine ⟨(measurable_mY ρ₁).prodMap (measurable_mY ρ₂), ?_⟩
  have : Yof ρ₁ ρ₂ = Prod.map (mY ρ₁) (mY ρ₂) := rfl
  rw [this, ← Measure.map_prod_map _ _ (measurable_mY ρ₁) (measurable_mY ρ₂)]
  have e₁ : mu2.map (mY ρ₁) = gaussC := map_mehlerY h₁
  have e₂ : mu2.map (mY ρ₂) = gaussC := map_mehlerY h₂
  rw [e₁, e₂]

/-- The Mehler eigenvalue `λ_i = ρ₁^{p₁} ρ̄₁^{q₁} ρ₂^{p₂} ρ̄₂^{q₂}`. -/
def lam (ρ₁ ρ₂ : ℂ) (i : Idx2) : ℂ :=
  ρ₁ ^ i.1.1 * conj ρ₁ ^ i.1.2 * (ρ₂ ^ i.2.1 * conj ρ₂ ^ i.2.2)

variable {ρ₁ ρ₂ : ℂ} (h₁ : ‖ρ₁‖ ≤ 1) (h₂ : ‖ρ₂‖ ≤ 1)
include h₁ h₂

/-- The tensor Hermite functions under `X` and `Y` (Fubini + one-coordinate Mehler). -/
theorem integral_H2_XY (i j : Idx2) :
    ∫ ω, conj (H2 i (Xof ω)) * H2 j (Yof ρ₁ ρ₂ ω) ∂mu4
      = if i = j then (fac2 i : ℂ) * lam ρ₁ ρ₂ i else 0 := by
  have e : ∀ ω : (ℂ × ℂ) × (ℂ × ℂ), conj (H2 i (Xof ω)) * H2 j (Yof ρ₁ ρ₂ ω)
      = (conj (ev ω.1.1 (H i.1.1 i.1.2)) * ev (ρ₁ * ω.1.1 + sig ρ₁ * ω.1.2) (H j.1.1 j.1.2))
        * (conj (ev ω.2.1 (H i.2.1 i.2.2)) * ev (ρ₂ * ω.2.1 + sig ρ₂ * ω.2.2) (H j.2.1 j.2.2)) :=
    fun ω => by simp only [H2, Xof, Yof, mY, map_mul]; ring
  simp_rw [e]
  rw [show mu4 = mu2.prod mu2 from rfl,
    integral_prod_mul
      (f := fun u : ℂ × ℂ => conj (ev u.1 (H i.1.1 i.1.2)) * ev (ρ₁ * u.1 + sig ρ₁ * u.2) (H j.1.1 j.1.2))
      (g := fun u : ℂ × ℂ => conj (ev u.1 (H i.2.1 i.2.2)) * ev (ρ₂ * u.1 + sig ρ₂ * u.2) (H j.2.1 j.2.2)),
    integral_mehler h₁, integral_mehler h₂]
  obtain ⟨⟨p, q⟩, ⟨r, s⟩⟩ := i
  obtain ⟨⟨p', q'⟩, ⟨r', s'⟩⟩ := j
  by_cases ha : p = p' ∧ q = q'
  · by_cases hb : r = r' ∧ s = s'
    · obtain ⟨rfl, rfl⟩ := ha; obtain ⟨rfl, rfl⟩ := hb
      simp [fac2, lam]; ring
    · have : ¬((p, q), (r, s)) = ((p', q'), (r', s')) := fun h => hb (by simp_all)
      simp [hb, this]
  · have : ¬((p, q), (r, s)) = ((p', q'), (r', s')) := fun h => ha (by simp_all)
    simp [ha, this]

/-- `F ↦ F ∘ X` on `L²`. -/
def PX : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 mu4 := Lp.compMeasurePreservingₗᵢ ℂ Xof mp_X

/-- `G ↦ G ∘ Y` on `L²`. -/
def PY : Lp ℂ 2 mu2 →ₗᵢ[ℂ] Lp ℂ 2 mu4 := Lp.compMeasurePreservingₗᵢ ℂ (Yof ρ₁ ρ₂) (mp_Y h₁ h₂)

/-- **The Mehler pairing** `E[conj F(X) · G(Y)]` on `L²`. -/
def Bm (F G : Lp ℂ 2 mu2) : ℂ := ⟪PX F, PY h₁ h₂ G⟫_ℂ

theorem Bm_eq_integral (F G : Lp ℂ 2 mu2) :
    Bm h₁ h₂ F G = ∫ ω, conj (F (Xof ω)) * G (Yof ρ₁ ρ₂ ω) ∂mu4 := by
  rw [Bm, L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [Lp.coeFn_compMeasurePreserving F mp_X,
    Lp.coeFn_compMeasurePreserving G (mp_Y h₁ h₂)] with ω h1 h2
  change ⟪(Lp.compMeasurePreserving Xof mp_X F : _ → ℂ) ω,
    (Lp.compMeasurePreserving (Yof ρ₁ ρ₂) (mp_Y h₁ h₂) G : _ → ℂ) ω⟫_ℂ = _
  rw [h1, h2, RCLike.inner_apply, mul_comm]; rfl

lemma Bm_hvec2 (i j : Idx2) : Bm h₁ h₂ (hvec2 i) (hvec2 j) = if i = j then lam ρ₁ ρ₂ i else 0 := by
  rw [Bm_eq_integral]
  have hx := mp_X.quasiMeasurePreserving.ae_eq_comp (memLp_hfun2 i).coeFn_toLp
  have hy := (mp_Y h₁ h₂).quasiMeasurePreserving.ae_eq_comp (memLp_hfun2 j).coeFn_toLp
  rw [integral_congr_ae (g := fun ω => ((nrm2 i : ℂ) * nrm2 j)
      * (conj (H2 i (Xof ω)) * H2 j (Yof ρ₁ ρ₂ ω))) ?_]
  · rw [integral_const_mul, integral_H2_XY h₁ h₂]
    by_cases h : i = j
    · subst h
      simp only [↓reduceIte]
      have h1 : nrm2 i * nrm2 i * (fac2 i : ℝ) = 1 := by
        rw [nrm2, ← mul_inv, Real.mul_self_sqrt (fac2_pos i).le, inv_mul_cancel₀ (fac2_pos i).ne']
      have h1' : ((nrm2 i : ℂ) * nrm2 i) * (fac2 i : ℂ) = 1 := by exact_mod_cast h1
      linear_combination (lam ρ₁ ρ₂ i) * h1'
    · simp [h]
  · filter_upwards [hx, hy] with ω h1 h2
    simp only [Function.comp, hvec2] at h1 h2 ⊢
    rw [h1, h2]; simp [hfun2, Complex.conj_ofReal]; ring

/-- **The complex Mehler formula on `ℂ²` for `L²` functions.** -/
theorem mehler_L2 (F G : Lp ℂ 2 mu2) :
    HasSum (fun i => conj ⟪hvec2 i, F⟫_ℂ * lam ρ₁ ρ₂ i * ⟪hvec2 i, G⟫_ℂ) (Bm h₁ h₂ F G) := by
  -- step 1: `Bm h_i G = λ_i ⟪h_i, G⟫`
  have step1 : ∀ i, Bm h₁ h₂ (hvec2 i) G = lam ρ₁ ρ₂ i * ⟪hvec2 i, G⟫_ℂ := fun i => by
    set T : Lp ℂ 2 mu2 →L[ℂ] ℂ :=
      (innerSL ℂ (PX (hvec2 i))).comp (PY h₁ h₂).toContinuousLinearMap
    have hT : ∀ G', T G' = Bm h₁ h₂ (hvec2 i) G' := fun G' => rfl
    have hs := (hermiteBasis2.hasSum_repr G).mapL T
    simp only [map_smul, smul_eq_mul, hermiteBasis2_apply] at hs
    simp only [hT, Bm_hvec2 h₁ h₂, mul_ite, mul_zero] at hs
    have hs' : HasSum (fun j => if j = i then hermiteBasis2.repr G i * lam ρ₁ ρ₂ i else 0)
        (hermiteBasis2.repr G i * lam ρ₁ ρ₂ i) := hasSum_ite_eq i _
    have : (fun j => if i = j then hermiteBasis2.repr G j * lam ρ₁ ρ₂ i else 0)
        = fun j => if j = i then hermiteBasis2.repr G i * lam ρ₁ ρ₂ i else 0 := by
      funext j; by_cases h : j = i
      · subst h; simp
      · simp [h, Ne.symm h]
    rw [hs.unique (this ▸ hs'), HilbertBasis.repr_apply_apply, hermiteBasis2_apply, mul_comm]
  -- step 2: expand `F`
  set S : Lp ℂ 2 mu2 →L[ℂ] ℂ := (innerSL ℂ (PY h₁ h₂ G)).comp (PX).toContinuousLinearMap
  have hS : ∀ F', S F' = conj (Bm h₁ h₂ F' G) := fun F' => by
    simp [S, Bm, inner_conj_symm]
  have hs := (hermiteBasis2.hasSum_repr F).mapL S
  simp only [map_smul, smul_eq_mul, hermiteBasis2_apply] at hs
  simp only [hS, step1] at hs
  have hc := hs.mapL Complex.conjCLE.toContinuousLinearMap
  simp only [ContinuousLinearEquiv.coe_coe, Complex.conjCLE_apply, map_mul, Complex.conj_conj,
    HilbertBasis.repr_apply_apply, hermiteBasis2_apply] at hc
  convert hc using 1
  funext i; ring

end

end Grothe.UpperChaos
