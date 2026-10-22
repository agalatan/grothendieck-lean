import Grothe.LowerAnalytic.MixedChaos

/-!
# Visible coordinate ⊗ remote Gaussian space (L4, INFRA-D)

The remote coordinates of `ℂ^{n+1}` are reindexed to `Fin (n + n)` (`remIdx`), so that the remote
Gaussian space is `L2G n` itself: `split2 : ℝ^{(n+1)+(n+1)} ≃ᵐ ℝ^{n+n} × ℂ` is measure preserving onto
`stdGaussian (n + n) ⊗ gaussC`, with inverse `joinR z y` (`joinR_zc0 : z₀(joinR z y) = √2 z`,
`joinR_zc_succ : z_{l+1}(joinR z y) = z_l(y)`).  Fubini in this form: `integral_split2`.
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate ENNReal

namespace Grothe.LowerAnalytic

noncomputable section

variable {n : ℕ}

/-! ### Reindexing the remote coordinates -/

lemma isVis_castAdd_iff (j : Fin (n + 1)) : isVis n (Fin.castAdd (n + 1) j) ↔ j = 0 := by
  constructor
  · rintro (h | h)
    · exact Fin.ext (by simpa [i0] using congrArg Fin.val h)
    · have := congrArg Fin.val h; simp [i1] at this; omega
  · rintro rfl; exact Or.inl rfl

lemma isVis_natAdd_iff (j : Fin (n + 1)) : isVis n (Fin.natAdd (n + 1) j) ↔ j = 0 := by
  constructor
  · rintro (h | h)
    · have := congrArg Fin.val h; simp [i0] at this
    · exact Fin.ext (by simpa [i1] using congrArg Fin.val h)
  · rintro rfl; exact Or.inr rfl

/-- `Fin (n + n) → RemT n`: `castAdd l ↦ castAdd (l+1)`, `natAdd l ↦ natAdd (l+1)`. -/
def remTo (i : Fin (n + n)) : RemT n :=
  Fin.addCases (motive := fun _ => RemT n)
    (fun l => ⟨Fin.castAdd (n + 1) l.succ, (isVis_castAdd_iff _).not.2 (Fin.succ_ne_zero l)⟩)
    (fun l => ⟨Fin.natAdd (n + 1) l.succ, (isVis_natAdd_iff _).not.2 (Fin.succ_ne_zero l)⟩) i

/-- The inverse of `remTo`. -/
def remFrom (i : RemT n) : Fin (n + n) :=
  Fin.addCases (motive := fun j => ¬ isVis n j → Fin (n + n))
    (fun j h => Fin.castAdd n (j.pred ((isVis_castAdd_iff j).not.1 h)))
    (fun j h => Fin.natAdd n (j.pred ((isVis_natAdd_iff j).not.1 h))) i.1 i.2

lemma remTo_castAdd (l : Fin n) :
    remTo (Fin.castAdd n l) = ⟨Fin.castAdd (n + 1) l.succ,
      (isVis_castAdd_iff _).not.2 (Fin.succ_ne_zero l)⟩ := by
  unfold remTo; rw [Fin.addCases_left]

lemma remTo_natAdd (l : Fin n) :
    remTo (Fin.natAdd n l) = ⟨Fin.natAdd (n + 1) l.succ,
      (isVis_natAdd_iff _).not.2 (Fin.succ_ne_zero l)⟩ := by
  unfold remTo; rw [Fin.addCases_right]

lemma remFrom_castAdd (j : Fin (n + 1)) (h : ¬ isVis n (Fin.castAdd (n + 1) j)) :
    remFrom ⟨Fin.castAdd (n + 1) j, h⟩ = Fin.castAdd n (j.pred ((isVis_castAdd_iff j).not.1 h)) := by
  unfold remFrom; dsimp only; rw [Fin.addCases_left]

lemma remFrom_natAdd (j : Fin (n + 1)) (h : ¬ isVis n (Fin.natAdd (n + 1) j)) :
    remFrom ⟨Fin.natAdd (n + 1) j, h⟩ = Fin.natAdd n (j.pred ((isVis_natAdd_iff j).not.1 h)) := by
  unfold remFrom; dsimp only; rw [Fin.addCases_right]

lemma remFrom_remTo (i : Fin (n + n)) : remFrom (remTo i) = i := by
  induction i using Fin.addCases with
  | left l => rw [remTo_castAdd, remFrom_castAdd, Fin.pred_succ]
  | right l => rw [remTo_natAdd, remFrom_natAdd, Fin.pred_succ]

lemma remTo_remFrom (i : RemT n) : remTo (remFrom i) = i := by
  obtain ⟨i, h⟩ := i
  induction i using Fin.addCases with
  | left j => rw [remFrom_castAdd, remTo_castAdd]; simp only [Fin.succ_pred]
  | right j => rw [remFrom_natAdd, remTo_natAdd]; simp only [Fin.succ_pred]

/-- The reindexing equivalence. -/
def remIdx : Fin (n + n) ≃ RemT n := ⟨remTo, remFrom, remFrom_remTo, remTo_remFrom⟩

/-- Remote functions on `Fin (n + n)`. -/
def remW : (Fin (n + n) → ℝ) ≃ᵐ (RemT n → ℝ) := MeasurableEquiv.piCongrLeft (fun _ => ℝ) remIdx

lemma measurePreserving_remW : MeasurePreserving (remW (n := n)) (stdGaussian (n + n)) (γW n) := by
  have := measurePreserving_piCongrLeft (fun _ : RemT n => gaussianReal 0 1) (remIdx (n := n))
  exact this

lemma remW_apply (y : Fin (n + n) → ℝ) (i : Fin (n + n)) : remW y (remIdx i) = y i := by
  simp only [remW, MeasurableEquiv.coe_piCongrLeft]
  exact Equiv.piCongrLeft_apply_apply (P := fun _ => ℝ) remIdx y i

/-! ### The split `x ↦ (y, z)` -/

/-- `x ↦ (remote y, visible z)`. -/
def split2 : (Fin ((n + 1) + (n + 1)) → ℝ) ≃ᵐ (Fin (n + n) → ℝ) × ℂ :=
  (splitE n).trans (MeasurableEquiv.prodCongr remW.symm (visE n))

/-- The product measure `γ_{remote} ⊗ γ_ℂ`. -/
abbrev μS (n : ℕ) : Measure ((Fin (n + n) → ℝ) × ℂ) := (stdGaussian (n + n)).prod gaussC

lemma measurePreserving_split2 :
    MeasurePreserving (split2 (n := n)) (stdGaussian ((n + 1) + (n + 1))) (μS n) := by
  refine (MeasurePreserving.prod measurePreserving_remW.symm ?_).comp (measurePreserving_splitE n)
  exact ⟨(visE n).measurable, map_visE n⟩

/-- The point with visible coordinate `z` and remote coordinates `y`. -/
def joinR (z : ℂ) (y : Fin (n + n) → ℝ) : Fin ((n + 1) + (n + 1)) → ℝ := split2.symm (y, z)

lemma joinR_eq (z : ℂ) (y : Fin (n + n) → ℝ) : joinR z y = join n z (remW y) := rfl

lemma split2_joinR (z : ℂ) (y : Fin (n + n) → ℝ) : split2 (joinR z y) = (y, z) := by
  simp [joinR]

lemma joinR_zc0 (z : ℂ) (y : Fin (n + n) → ℝ) : zc (n + 1) 0 (joinR z y) = (√2 : ℝ) * z :=
  zc_join n z _

lemma joinR_zc_succ (l : Fin n) (z : ℂ) (y : Fin (n + n) → ℝ) :
    zc (n + 1) l.succ (joinR z y) = zc n l y := by
  rw [joinR_eq, zc_join_remote l.succ (Fin.succ_ne_zero l)]
  simp only [rz, zc]
  have h1 : (⟨Fin.castAdd (n + 1) l.succ, castAdd_not_vis l.succ (Fin.succ_ne_zero l)⟩ : RemT n)
      = remIdx (Fin.castAdd n l) := (remTo_castAdd l).symm
  have h2 : (⟨Fin.natAdd (n + 1) l.succ, natAdd_not_vis l.succ (Fin.succ_ne_zero l)⟩ : RemT n)
      = remIdx (Fin.natAdd n l) := (remTo_natAdd l).symm
  rw [h1, h2, remW_apply, remW_apply]

/-- **Fubini in the remote/visible form.** -/
theorem integral_split2 {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (G : (Fin ((n + 1) + (n + 1)) → ℝ) → E) (hG : Integrable G (stdGaussian ((n + 1) + (n + 1)))) :
    ∫ x, G x ∂(stdGaussian ((n + 1) + (n + 1)))
      = ∫ y, ∫ z, G (joinR z y) ∂gaussC ∂(stdGaussian (n + n)) := by
  have hm := measurePreserving_split2 (n := n)
  have hi : Integrable (fun p => G (split2.symm p)) (μS n) :=
    ((hm.symm split2).integrable_comp_emb split2.symm.measurableEmbedding).2 hG
  rw [← (hm.symm split2).integral_comp' G, integral_prod _ hi]
  rfl

theorem integrable_split2_section {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {G : (Fin ((n + 1) + (n + 1)) → ℝ) → E} (hG : Integrable G (stdGaussian ((n + 1) + (n + 1)))) :
    ∀ᵐ y ∂(stdGaussian (n + n)), Integrable (fun z => G (joinR z y)) gaussC := by
  have hm := measurePreserving_split2 (n := n)
  have hi : Integrable (fun p => G (split2.symm p)) (μS n) :=
    ((hm.symm split2).integrable_comp_emb split2.symm.measurableEmbedding).2 hG
  exact hi.prod_right_ae

theorem ae_split2 {P : (Fin ((n + 1) + (n + 1)) → ℝ) → Prop}
    (h : ∀ᵐ x ∂(stdGaussian ((n + 1) + (n + 1))), P x) :
    ∀ᵐ y ∂(stdGaussian (n + n)), ∀ᵐ z ∂gaussC, P (joinR z y) := by
  have hm := measurePreserving_split2 (n := n)
  have h2 : ∀ᵐ p ∂(μS n), P (split2.symm p) := by
    rw [← hm.map_eq, split2.measurableEmbedding.ae_map_iff]
    simpa using h
  exact Measure.ae_ae_of_ae_prod h2

lemma split2_symm_split2 (x : Fin ((n + 1) + (n + 1)) → ℝ) :
    joinR (split2 x).2 (split2 x).1 = x := by
  simp [joinR]

/-- Two functions agreeing on all `joinR z y` are equal. -/
lemma funext_joinR {α : Type*} {f g : (Fin ((n + 1) + (n + 1)) → ℝ) → α}
    (h : ∀ z y, f (joinR z y) = g (joinR z y)) : f = g := by
  funext x; rw [← split2_symm_split2 x]; exact h _ _

/-! ### Tensor elements -/

variable (n) in
/-- `x ↦ G(y) F(z)` for `x = joinR z y`. -/
def tensorFn (F : ℂ → ℂ) (G : (Fin (n + n) → ℝ) → ℂ) (x : Fin ((n + 1) + (n + 1)) → ℝ) : ℂ :=
  G (split2 x).1 * F (split2 x).2

lemma tensorFn_joinR (F : ℂ → ℂ) (G : (Fin (n + n) → ℝ) → ℂ) (z : ℂ) (y : Fin (n + n) → ℝ) :
    tensorFn n F G (joinR z y) = G y * F z := by
  simp [tensorFn, split2_joinR]

lemma memLp_prodFn {F : ℂ → ℂ} {G : (Fin (n + n) → ℝ) → ℂ} (hF : MemLp F 2 gaussC)
    (hG : MemLp G 2 (stdGaussian (n + n))) :
    MemLp (fun p : (Fin (n + n) → ℝ) × ℂ => G p.1 * F p.2) 2 (μS n) := by
  have hm : AEStronglyMeasurable (fun p : (Fin (n + n) → ℝ) × ℂ => G p.1 * F p.2) (μS n) :=
    (hG.comp_fst gaussC).aestronglyMeasurable.mul (hF.comp_snd (stdGaussian (n + n))).aestronglyMeasurable
  rw [memLp_two_iff_integrable_sq_norm hm]
  have h1 := (memLp_two_iff_integrable_sq_norm hG.aestronglyMeasurable).1 hG
  have h2 := (memLp_two_iff_integrable_sq_norm hF.aestronglyMeasurable).1 hF
  refine (h1.mul_prod h2).congr (Filter.Eventually.of_forall fun p => ?_)
  simp only [norm_mul, mul_pow]

lemma memLp_tensorFn {F : ℂ → ℂ} {G : (Fin (n + n) → ℝ) → ℂ} (hF : MemLp F 2 gaussC)
    (hG : MemLp G 2 (stdGaussian (n + n))) :
    MemLp (tensorFn n F G) 2 (stdGaussian ((n + 1) + (n + 1))) := by
  have h := memLp_prodFn hF hG
  rw [← (measurePreserving_split2 (n := n)).map_eq, split2.memLp_map_measure_iff] at h
  exact h

variable (n) in
/-- **The tensor element** `F(z) ⊗ G(y)` of `L²(γ_{n+1})`. -/
def tensorL (F : ℂ → ℂ) (G : (Fin (n + n) → ℝ) → ℂ) (hF : MemLp F 2 gaussC)
    (hG : MemLp G 2 (stdGaussian (n + n))) : L2G (n + 1) :=
  (memLp_tensorFn hF hG).toLp _

lemma tensorL_ae (F : ℂ → ℂ) (G : (Fin (n + n) → ℝ) → ℂ) (hF : MemLp F 2 gaussC)
    (hG : MemLp G 2 (stdGaussian (n + n))) :
    tensorL n F G hF hG =ᵐ[stdGaussian ((n + 1) + (n + 1))] tensorFn n F G :=
  MemLp.coeFn_toLp _

/-- The tensor function of a.e.-equal factors is a.e. equal. -/
lemma tensorFn_congr_ae {F F' : ℂ → ℂ} {G G' : (Fin (n + n) → ℝ) → ℂ}
    (hF : F =ᵐ[gaussC] F') (hG : G =ᵐ[stdGaussian (n + n)] G') :
    tensorFn n F G =ᵐ[stdGaussian ((n + 1) + (n + 1))] tensorFn n F' G' := by
  have hm := measurePreserving_split2 (n := n)
  have h2 : ∀ᵐ p ∂(μS n), G p.1 * F p.2 = G' p.1 * F' p.2 := by
    have a1 : ∀ᵐ p ∂(μS n), G p.1 = G' p.1 :=
      (Measure.quasiMeasurePreserving_fst).ae_eq_comp hG
    have a2 : ∀ᵐ p ∂(μS n), F p.2 = F' p.2 :=
      (Measure.quasiMeasurePreserving_snd).ae_eq_comp hF
    filter_upwards [a1, a2] with p h1 h2
    rw [h1, h2]
  rw [← hm.map_eq, split2.measurableEmbedding.ae_map_iff] at h2
  exact h2

/-- `⟪F ⊗ G, F' ⊗ G'⟫ = ⟪G, G'⟫ ⟪F, F'⟫`. -/
theorem inner_tensorL (F F' : ℂ → ℂ) (G G' : (Fin (n + n) → ℝ) → ℂ) (hF : MemLp F 2 gaussC)
    (hF' : MemLp F' 2 gaussC) (hG : MemLp G 2 (stdGaussian (n + n)))
    (hG' : MemLp G' 2 (stdGaussian (n + n))) :
    inner ℂ (tensorL n F G hF hG) (tensorL n F' G' hF' hG')
      = (∫ y, conj (G y) * G' y ∂(stdGaussian (n + n))) * ∫ z, conj (F z) * F' z ∂gaussC := by
  rw [inner_L2]
  have e : ∫ x, conj (tensorL n F G hF hG x) * tensorL n F' G' hF' hG' x
        ∂(stdGaussian ((n + 1) + (n + 1)))
      = ∫ x, conj (tensorFn n F G x) * tensorFn n F' G' x ∂(stdGaussian ((n + 1) + (n + 1))) := by
    refine integral_congr_ae ?_
    filter_upwards [tensorL_ae F G hF hG, tensorL_ae F' G' hF' hG'] with x h1 h2
    rw [h1, h2]
  rw [e]
  have h := (measurePreserving_split2 (n := n)).integral_comp'
    (fun p => conj (G p.1 * F p.2) * (G' p.1 * F' p.2))
  refine h.trans ?_
  rw [← integral_prod_mul (μ := stdGaussian (n + n)) (ν := gaussC)
    (fun y => conj (G y) * G' y) (fun z => conj (F z) * F' z)]
  refine integral_congr_ae (Filter.Eventually.of_forall fun p => ?_)
  simp only [map_mul]; ring

/-- `⟪F ⊗ G, u⟫ = ∫_y conj(G y) ∫_z conj(F z) u(joinR z y)`. -/
theorem inner_tensorL_left (F : ℂ → ℂ) (G : (Fin (n + n) → ℝ) → ℂ) (hF : MemLp F 2 gaussC)
    (hG : MemLp G 2 (stdGaussian (n + n))) (u : L2G (n + 1)) :
    inner ℂ (tensorL n F G hF hG) u
      = ∫ y, conj (G y) * ∫ z, conj (F z) * u (joinR z y) ∂gaussC ∂(stdGaussian (n + n)) := by
  have hi := L2.integrable_inner (𝕜 := ℂ) (tensorL n F G hF hG) u
  have hi' : Integrable (fun x => conj (tensorFn n F G x) * u x)
      (stdGaussian ((n + 1) + (n + 1))) := by
    refine hi.congr ?_
    filter_upwards [tensorL_ae F G hF hG] with x h
    rw [RCLike.inner_apply', h]
  rw [inner_L2]
  have e : ∫ x, conj (tensorL n F G hF hG x) * u x ∂(stdGaussian ((n + 1) + (n + 1)))
      = ∫ x, conj (tensorFn n F G x) * u x ∂(stdGaussian ((n + 1) + (n + 1))) := by
    refine integral_congr_ae ?_
    filter_upwards [tensorL_ae F G hF hG] with x h
    rw [h]
  rw [e, integral_split2 _ hi']
  congr 1; funext y
  simp_rw [tensorFn_joinR, map_mul, mul_assoc]
  rw [integral_const_mul]

end

end Grothe.LowerAnalytic
