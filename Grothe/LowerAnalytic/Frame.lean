import Grothe.LowerAnalytic.RowGaussian

/-!
# Unitary frames (L4, S1.2)

A complex unitary `W` of `ℂ^m` acts on `ℝ^{m+m}` by `Φ_W` (`z(Φ_W x) = W z(x)`), preserving the
Gaussian measure; the composition operator `C_W u = u ∘ Φ_W` is a unitary of `L²(γ_m)` preserving
`H₁,₀`, the charge-one cubics and hence `H₂,₁`, so it commutes with the witness.  This moves any
unit `ζ ∈ H₁,₀` to the visible coordinate `ζ₀ = z₀/√2`.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {m : ℕ}

/-! ### Realification -/

/-- `x ↦ (x_{castAdd l} + i x_{natAdd l})_l`. -/
def realToC (x : EuclideanSpace ℝ (Fin (m + m))) : EuclideanSpace ℂ (Fin m) :=
  WithLp.toLp 2 fun l => ⟨x (Fin.castAdd m l), x (Fin.natAdd m l)⟩

/-- The inverse. -/
def cToReal (w : EuclideanSpace ℂ (Fin m)) : EuclideanSpace ℝ (Fin (m + m)) :=
  WithLp.toLp 2 (Fin.addCases (motive := fun _ => ℝ) (fun l => (w l).re) (fun l => (w l).im))

lemma realToC_apply (x : EuclideanSpace ℝ (Fin (m + m))) (l : Fin m) :
    realToC x l = ⟨x (Fin.castAdd m l), x (Fin.natAdd m l)⟩ := rfl

lemma cToReal_castAdd (w : EuclideanSpace ℂ (Fin m)) (l : Fin m) :
    cToReal w (Fin.castAdd m l) = (w l).re := by
  show Fin.addCases (motive := fun _ => ℝ) (fun l => (w l).re) (fun l => (w l).im) (Fin.castAdd m l) = _
  rw [Fin.addCases_left]

lemma cToReal_natAdd (w : EuclideanSpace ℂ (Fin m)) (l : Fin m) :
    cToReal w (Fin.natAdd m l) = (w l).im := by
  show Fin.addCases (motive := fun _ => ℝ) (fun l => (w l).re) (fun l => (w l).im) (Fin.natAdd m l) = _
  rw [Fin.addCases_right]

lemma realToC_cToReal (w : EuclideanSpace ℂ (Fin m)) : realToC (cToReal w) = w := by
  ext l; apply Complex.ext <;> simp [realToC_apply, cToReal_castAdd, cToReal_natAdd]

lemma cToReal_realToC (x : EuclideanSpace ℝ (Fin (m + m))) : cToReal (realToC x) = x := by
  ext i
  induction i using Fin.addCases with
  | left l => rw [cToReal_castAdd, realToC_apply]
  | right l => rw [cToReal_natAdd, realToC_apply]

lemma norm_realToC (x : EuclideanSpace ℝ (Fin (m + m))) : ‖realToC x‖ = ‖x‖ := by
  rw [EuclideanSpace.norm_eq, EuclideanSpace.norm_eq, Fin.sum_univ_add, ← Finset.sum_add_distrib]
  congr 1
  refine Finset.sum_congr rfl fun l _ => ?_
  rw [realToC_apply, Complex.sq_norm, Complex.normSq_mk, Real.norm_eq_abs, Real.norm_eq_abs,
    sq_abs, sq_abs]
  ring

/-- **The realification isometry** `ℝ^{m+m} ≃ ℂ^m`. -/
def realIso : EuclideanSpace ℝ (Fin (m + m)) ≃ₗᵢ[ℝ] EuclideanSpace ℂ (Fin m) where
  toFun := realToC
  invFun := cToReal
  map_add' x y := by ext l; apply Complex.ext <;> simp [realToC_apply]
  map_smul' c x := by ext l; apply Complex.ext <;> simp [realToC_apply]
  left_inv := cToReal_realToC
  right_inv := realToC_cToReal
  norm_map' := norm_realToC

/-! ### The real action of a unitary -/

variable (W : EuclideanSpace ℂ (Fin m) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin m))

/-- `Φ_W` on `EuclideanSpace ℝ`. -/
def Wreal : EuclideanSpace ℂ (Fin m) ≃ₗᵢ[ℝ] EuclideanSpace ℂ (Fin m) :=
  { W.toLinearEquiv.restrictScalars ℝ with norm_map' := W.norm_map }

def PhiE : EuclideanSpace ℝ (Fin (m + m)) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin (m + m)) :=
  (realIso.trans (Wreal W)).trans realIso.symm

/-- `Φ_W` on `Fin (m + m) → ℝ`. -/
def Phi (x : Fin (m + m) → ℝ) : Fin (m + m) → ℝ := WithLp.ofLp (PhiE W (WithLp.toLp 2 x))

lemma measurable_Phi : Measurable (Phi W) := by
  unfold Phi
  exact (PiLp.continuous_ofLp 2 _).measurable.comp
    ((PhiE W).continuous.measurable.comp (PiLp.continuous_toLp 2 _).measurable)

lemma measurePreserving_Phi :
    MeasurePreserving (Phi W) (stdGaussian (m + m)) (stdGaussian (m + m)) := by
  refine ⟨measurable_Phi W, ?_⟩
  have h1 := map_pi_eq_stdGaussian (ι := Fin (m + m))
  have h2 := stdGaussian_map (PhiE W)
  have e : stdGaussian (m + m)
      = (ProbabilityTheory.stdGaussian (EuclideanSpace ℝ (Fin (m + m)))).map (WithLp.ofLp (p := 2)) := by
    rw [← h1, Measure.map_map (PiLp.continuous_ofLp 2 _).measurable (PiLp.continuous_toLp 2 _).measurable]
    rw [show (WithLp.ofLp ∘ WithLp.toLp 2 : (Fin (m + m) → ℝ) → (Fin (m + m) → ℝ)) = id from rfl,
      Measure.map_id]
    rfl
  rw [e, Measure.map_map (measurable_Phi W) (PiLp.continuous_ofLp 2 _).measurable]
  have : Phi W ∘ WithLp.ofLp (p := 2) = WithLp.ofLp (p := 2) ∘ PhiE W := by
    funext x; simp [Phi]
  rw [this, ← Measure.map_map (PiLp.continuous_ofLp 2 _).measurable (PhiE W).continuous.measurable, h2]

/-- The coordinates after `Φ_W`: `z(Φ_W x) = W z(x)`. -/
lemma zc_Phi (l : Fin m) (x : Fin (m + m) → ℝ) :
    zc m l (Phi W x) = W (realToC (WithLp.toLp 2 x)) l := by
  have : realToC (WithLp.toLp 2 (Phi W x)) = W (realToC (WithLp.toLp 2 x)) := by
    simp only [Phi, WithLp.toLp_ofLp, PhiE, LinearIsometryEquiv.trans_apply]
    exact realToC_cToReal _
  rw [← this]; rfl

lemma realToC_zc (x : Fin (m + m) → ℝ) (l : Fin m) : realToC (WithLp.toLp 2 x) l = zc m l x := rfl

/-- `z_l(Φ_W x) = Σ_k W_{lk} z_k(x)`. -/
lemma apply_eq_sum (v : EuclideanSpace ℂ (Fin m)) (l : Fin m) :
    W v l = ∑ k, W (EuclideanSpace.single k 1) l * v k := by
  have hv : v = ∑ k, v k • EuclideanSpace.single k (1 : ℂ) := by
    ext j; simp [Pi.single_apply, mul_ite, Finset.sum_ite_eq']
  conv_lhs => rw [hv]
  rw [map_sum]
  simp only [map_smul]
  rw [show (∑ k, v k • W (EuclideanSpace.single k (1 : ℂ))) l
      = ∑ k, (v k • W (EuclideanSpace.single k (1 : ℂ))) l from by
    simp [Finset.sum_apply]]
  refine Finset.sum_congr rfl fun k _ => ?_
  simp [mul_comm]

/-- `z_l(Φ_W x) = Σ_k W_{lk} z_k(x)`. -/
lemma zc_Phi_sum (l : Fin m) (x : Fin (m + m) → ℝ) :
    zc m l (Phi W x) = ∑ k, W (EuclideanSpace.single k 1) l * zc m k x := by
  rw [zc_Phi, apply_eq_sum]
  rfl

/-! ### The composition operator -/

variable (m) in
/-- `w_{lk} = (W e_k)_l`. -/
def wco (W : EuclideanSpace ℂ (Fin m) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin m)) (l k : Fin m) : ℂ :=
  W (EuclideanSpace.single k 1) l

/-- `C_W u = u ∘ Φ_W`. -/
def Cop : L2G m →ₗᵢ[ℂ] L2G m :=
  Lp.compMeasurePreservingₗᵢ ℂ (Phi W) (measurePreserving_Phi W)

lemma Cop_ae (u : L2G m) : ⇑(Cop W u) =ᵐ[stdGaussian (m + m)] fun x => u (Phi W x) :=
  Lp.coeFn_compMeasurePreserving u (measurePreserving_Phi W)

lemma comp_ae {F G : (Fin (m + m) → ℝ) → ℂ} (h : F =ᵐ[stdGaussian (m + m)] G) :
    (fun x => F (Phi W x)) =ᵐ[stdGaussian (m + m)] fun x => G (Phi W x) :=
  (measurePreserving_Phi W).quasiMeasurePreserving.ae_eq_comp h

lemma sum_smul_ae {ι : Type*} [Fintype ι] (c : ι → ℂ) (u : ι → L2G m)
    (U : ι → (Fin (m + m) → ℝ) → ℂ) (hu : ∀ i, ⇑(u i) =ᵐ[stdGaussian (m + m)] U i) :
    ⇑(∑ i, c i • u i) =ᵐ[stdGaussian (m + m)] fun x => ∑ i, c i * U i x := by
  have h1 := coeFn_finset_sum m Finset.univ (fun i => c i • u i)
  have h2 : ∀ᵐ x ∂(stdGaussian (m + m)), ∀ i, (c i • u i) x = c i * U i x :=
    ae_all_iff.2 fun i => by
      filter_upwards [Lp.coeFn_smul (c i) (u i), hu i] with x hx hU
      rw [hx, Pi.smul_apply, smul_eq_mul, hU]
  filter_upwards [h1, h2] with x hx hx2
  rw [hx]; simp only [hx2]

lemma Cop_zL (l : Fin m) : Cop W (zL m l) = ∑ k, wco m W l k • zL m k := by
  refine Lp.ext ((Cop_ae W _).trans ((comp_ae W (zL_ae m l)).trans ?_))
  refine Filter.EventuallyEq.trans ?_
    (sum_smul_ae (wco m W l) (zL m) (zc m) (fun k => zL_ae m k)).symm
  exact Filter.Eventually.of_forall fun x => by simp only [zc_Phi_sum, wco]

lemma Cop_wL (a b c : Fin m) :
    Cop W (wL m a b c) = ∑ p : Fin m × Fin m × Fin m,
      (wco m W a p.1 * wco m W b p.2.1 * conj (wco m W c p.2.2)) • wL m p.1 p.2.1 p.2.2 := by
  have hw : ∀ p : Fin m × Fin m × Fin m, ⇑(wL m p.1 p.2.1 p.2.2) =ᵐ[stdGaussian (m + m)]
      wc m p.1 p.2.1 p.2.2 := fun p => MemLp.coeFn_toLp _
  refine Lp.ext ((Cop_ae W _).trans ((comp_ae W (MemLp.coeFn_toLp (memLp_wc m a b c))).trans ?_))
  refine Filter.EventuallyEq.trans ?_ (sum_smul_ae _ _ _ hw).symm
  refine Filter.Eventually.of_forall fun x => ?_
  simp only [wc, zc_Phi_sum, map_sum, map_mul, Fintype.sum_prod_type, wco]
  rw [Finset.sum_mul_sum, Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Finset.sum_mul]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun k _ => ?_
  ring

/-! ### Preserved subspaces, inverse, commutation with the projections -/

lemma Cop_H10 : H10 m ≤ (H10 m).comap (Cop W).toLinearMap := by
  refine Submodule.span_le.2 ?_
  rintro _ ⟨l, rfl⟩
  show Cop W (zL m l) ∈ H10 m
  rw [Cop_zL]
  exact Submodule.sum_mem _ fun k _ => Submodule.smul_mem _ _ (zL_mem_H10 m k)

lemma Cop_chargeOne3 : chargeOne3 m ≤ (chargeOne3 m).comap (Cop W).toLinearMap := by
  refine Submodule.span_le.2 ?_
  rintro _ (⟨l, rfl⟩ | ⟨⟨a, b, c⟩, rfl⟩)
  · show Cop W (zL m l) ∈ chargeOne3 m
    rw [Cop_zL]
    exact Submodule.sum_mem _ fun k _ => Submodule.smul_mem _ _
      (Submodule.subset_span (Set.mem_union_left _ ⟨k, rfl⟩))
  · show Cop W (wL m a b c) ∈ chargeOne3 m
    rw [Cop_wL]
    exact Submodule.sum_mem _ fun p _ => Submodule.smul_mem _ _
      (Submodule.subset_span (Set.mem_union_right _ ⟨p, rfl⟩))

lemma Wreal_apply (v : EuclideanSpace ℂ (Fin m)) : Wreal W v = W v := rfl

lemma Phi_symm_Phi (x : Fin (m + m) → ℝ) : Phi W.symm (Phi W x) = x := by
  simp only [Phi, PhiE, LinearIsometryEquiv.trans_apply, Wreal_apply, WithLp.toLp_ofLp,
    LinearIsometryEquiv.apply_symm_apply, LinearIsometryEquiv.symm_apply_apply]

lemma Phi_Phi_symm (x : Fin (m + m) → ℝ) : Phi W (Phi W.symm x) = x := by
  have := Phi_symm_Phi W.symm x
  rwa [LinearIsometryEquiv.symm_symm] at this

lemma Cop_symm_Cop (u : L2G m) : Cop W.symm (Cop W u) = u := by
  refine Lp.ext ((Cop_ae W.symm _).trans ?_)
  have h := comp_ae W.symm (Cop_ae W u)
  refine h.trans (Filter.Eventually.of_forall fun x => ?_)
  simp only [Phi_Phi_symm]

lemma Cop_Cop_symm (u : L2G m) : Cop W (Cop W.symm u) = u := by
  have := Cop_symm_Cop W.symm u
  simpa using this

/-- A unitary preserving `K` together with its inverse commutes with `Π_K`. -/
lemma starProjection_Cop (K : Submodule ℂ (L2G m)) [K.HasOrthogonalProjection]
    (hK : K ≤ K.comap (Cop W).toLinearMap) (hK' : K ≤ K.comap (Cop W.symm).toLinearMap) (u : L2G m) :
    K.starProjection (Cop W u) = Cop W (K.starProjection u) := by
  refine Submodule.eq_starProjection_of_mem_orthogonal (hK (by
    rw [Submodule.starProjection_apply]; exact Submodule.coe_mem _)) ?_
  rw [Submodule.mem_orthogonal]
  intro a ha
  rw [← map_sub, ← Cop_Cop_symm W a, LinearIsometry.inner_map_map]
  exact (Submodule.mem_orthogonal _ _).1 (Submodule.sub_starProjection_mem_orthogonal u) _ (hK' ha)

lemma Cop_H21 : H21 m ≤ (H21 m).comap (Cop W).toLinearMap := by
  intro x hx
  obtain ⟨h1, h2⟩ := Submodule.mem_inf.1 hx
  refine Submodule.mem_inf.2 ⟨Cop_chargeOne3 W h1, ?_⟩
  rw [Submodule.mem_orthogonal]
  intro a ha
  show inner ℂ a (Cop W x) = 0
  rw [← Cop_Cop_symm W a, LinearIsometry.inner_map_map]
  exact (Submodule.mem_orthogonal _ _).1 h2 _ (Cop_H10 W.symm ha)

lemma P_Cop (u : L2G m) : (H10 m).starProjection (Cop W u) = Cop W ((H10 m).starProjection u) :=
  starProjection_Cop W _ (Cop_H10 W) (Cop_H10 W.symm) u

lemma Q_Cop (u : L2G m) : (H21 m).starProjection (Cop W u) = Cop W ((H21 m).starProjection u) :=
  starProjection_Cop W _ (Cop_H21 W) (Cop_H21 W.symm) u

lemma witness_Cop (u : L2G m) : witness m (Cop W u) = Cop W (witness m u) := by
  simp only [witness, witnessOf, sub_apply, smul_apply,
    P_Cop, Q_Cop, map_sub, map_smul]

lemma Cop_unimod {f : L2G m} (hf : f ∈ Unimod (stdGaussian (m + m))) :
    Cop W f ∈ Unimod (stdGaussian (m + m)) := by
  have hf' : ∀ᵐ x ∂(stdGaussian (m + m)), ‖f x‖ = 1 := hf
  show ∀ᵐ x ∂(stdGaussian (m + m)), ‖Cop W f x‖ = 1
  filter_upwards [Cop_ae W f, (measurePreserving_Phi W).quasiMeasurePreserving.ae hf'] with x h1 h2
  rw [h1]; exact h2

lemma VOf_Cop (f g : L2G m) : VOf m (Cop W f) (Cop W g) = VOf m f g := by
  rw [VOf, VOf, witness_Cop, LinearIsometry.inner_map_map]

lemma hOf_Cop (f g : L2G m) : hOf m (Cop W f) (Cop W g) = Cop W (hOf m f g) := by
  simp only [hOf, map_smul, map_add]

lemma tOf_Cop (f g : L2G m) : tOf m (Cop W f) (Cop W g) = tOf m f g := by
  rw [tOf, tOf, hOf_Cop, P_Cop, LinearIsometry.norm_map]

lemma QhOf_Cop (f g : L2G m) : QhOf m (Cop W f) (Cop W g) = Cop W (QhOf m f g) := by
  rw [QhOf, QhOf, hOf_Cop, Q_Cop]

/-! ### Moving a unit first-chaos vector to the visible coordinate -/

lemma norm_sq_sum_zL (α : Fin m → ℂ) : ‖∑ l, α l • zL m l‖ ^ 2 = 2 * ∑ l, ‖α l‖ ^ 2 := by
  rw [@norm_sq_eq_re_inner ℂ, sum_inner]
  simp_rw [inner_sum, inner_smul_left, inner_smul_right, inner_zL_zL, mul_ite, mul_one, mul_zero,
    Finset.sum_ite_eq, Finset.mem_univ, if_true]
  rw [RCLike.re_to_complex, Complex.re_sum, Finset.mul_sum]
  refine Finset.sum_congr rfl fun l _ => ?_
  rw [show conj (α l) * (α l * 2) = 2 * (conj (α l) * α l) by ring, Complex.conj_mul',
    ← Complex.ofReal_pow, ← Complex.ofReal_ofNat, ← Complex.ofReal_mul, Complex.ofReal_re]

/-- **The rotation to the visible coordinate**: for a unit `ζ ∈ H₁,₀` there is a unitary `W` with
`C_W ζ = z₀/√2`. -/
theorem exists_Cop_eq (hm : 0 < m) {ζ : L2G m} (hζ : ζ ∈ H10 m) (h1 : ‖ζ‖ = 1) :
    ∃ W : EuclideanSpace ℂ (Fin m) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin m),
      Cop W ζ = (((√2 : ℝ) : ℂ)⁻¹) • zL m ⟨0, hm⟩ := by
  classical
  obtain ⟨α, rfl⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).1 hζ
  set i0 : Fin m := ⟨0, hm⟩
  have hs : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast sqrt_two_ne
  set u : EuclideanSpace ℂ (Fin m) := WithLp.toLp 2 fun l => ((√2 : ℝ) : ℂ) * conj (α l) with hu
  have hu1 : ‖u‖ = 1 := by
    have h2 := norm_sq_sum_zL α
    rw [h1, one_pow] at h2
    have : ‖u‖ ^ 2 = 1 := by
      rw [EuclideanSpace.norm_sq_eq]
      simp only [hu, PiLp.toLp_apply, norm_mul, Complex.norm_conj, Complex.norm_real,
        Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), mul_pow, Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 2)]
      rw [← Finset.mul_sum]; linarith
    nlinarith [norm_nonneg u]
  -- an orthonormal basis with `b i0 = u`
  let v : Fin m → EuclideanSpace ℂ (Fin m) := fun i => if i = i0 then u else 0
  have hv : Orthonormal ℂ (({i0} : Set (Fin m)).restrict v) := by
    rw [orthonormal_iff_ite]
    rintro ⟨i, hi⟩ ⟨j, hj⟩
    simp only [Set.mem_singleton_iff] at hi hj
    subst hi hj
    rw [if_pos rfl]
    show inner ℂ (v i0) (v i0) = 1
    simp only [v, if_pos rfl]
    rw [inner_self_eq_norm_sq_to_K, hu1]; simp
  obtain ⟨b, hb⟩ := Orthonormal.exists_orthonormalBasis_extension_of_card_eq (𝕜 := ℂ)
    (E := EuclideanSpace ℂ (Fin m)) (ι := Fin m) (by simp) hv
  have hb0 : b i0 = u := by rw [hb i0 (by simp)]; simp [v]
  refine ⟨b.repr.symm, ?_⟩
  rw [map_sum]
  simp_rw [map_smul, Cop_zL, Finset.smul_sum, smul_smul]
  rw [Finset.sum_comm]
  have hco : ∀ k, ∑ l, α l * wco m b.repr.symm l k = if k = i0 then (((√2 : ℝ) : ℂ)⁻¹) else 0 := by
    intro k
    have hw : ∀ l, wco m b.repr.symm l k = b k l := fun l => by
      simp [wco, OrthonormalBasis.repr_symm_single]
    simp_rw [hw]
    have hinner : inner ℂ (b i0) (b k) = if i0 = k then (1 : ℂ) else 0 := by
      rw [orthonormal_iff_ite.1 b.orthonormal]
    rw [hb0, PiLp.inner_apply] at hinner
    simp only [hu, PiLp.toLp_apply, RCLike.inner_apply, map_mul, Complex.conj_conj,
      Complex.conj_ofReal] at hinner
    have e : ∑ l, α l * b k l = (((√2 : ℝ) : ℂ)⁻¹) * ∑ l, ((√2 : ℝ) : ℂ) * α l * b k l := by
      rw [Finset.mul_sum]; refine Finset.sum_congr rfl fun l _ => ?_; field_simp
    rw [e]
    have hinner' : ∑ l, ((√2 : ℝ) : ℂ) * α l * b k l = if i0 = k then (1 : ℂ) else 0 := by
      rw [← hinner]; refine Finset.sum_congr rfl fun l _ => ?_; ring
    rw [hinner']
    by_cases h : k = i0
    · subst h; simp
    · simp [h, Ne.symm h]
  simp_rw [← Finset.sum_smul, hco, ite_smul, zero_smul, Finset.sum_ite_eq', Finset.mem_univ, if_true]

/-- Transfer of the shared reduction along a pair with the same norms `‖Qh + c v‖`. -/
lemma sharedReduction_congr {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {rows : List Row} {V t : ℝ} {Qh₁ v₁ Qh₂ v₂ : E} (h : SharedReduction rows V t Qh₁ v₁)
    (hn : ∀ c : ℝ, ‖Qh₁ + c • v₁‖ = ‖Qh₂ + c • v₂‖) : SharedReduction rows V t Qh₂ v₂ := by
  obtain ⟨Ω, hΩ, μ, hμ, U, X1, X2, X3, τ, x, hM, hG, h0, h1, hX, hrows⟩ := h
  refine ⟨Ω, hΩ, μ, hμ, U, X1, X2, X3, τ, x, hM, hG, h0, h1, hX, fun r hr => ?_⟩
  obtain ⟨Ψ, hc, hi, hg, hV⟩ := hrows r hr
  exact ⟨Ψ, hc, hi, hg, by rw [← hn]; exact hV⟩

end

end Grothe.LowerAnalytic
