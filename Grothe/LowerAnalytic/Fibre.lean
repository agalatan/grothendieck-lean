import Grothe.LowerAnalytic.FibreSup

/-!
# The fibre split of the Gaussian measure (L4, INFRA-B)

On `ℂ^{n+1} = ℝ^{(n+1)+(n+1)}` with `stdGaussian`, the visible complex coordinate is
`ζ = z₀/√2 = (x_{i₀} + i x_{i₁})/√2` (`i₀ = castAdd 0`, `i₁ = natAdd 0`), a standard complex Gaussian
(`gaussC`, `E|ζ|² = 1`, the normalisation of the certified potential), and the remote coordinates
`w` are the other `2n` real coordinates with the product Gaussian `γW`.

* `splitE`: the measurable equivalence `x ↦ (w, u)` (remote coordinates, the two visible ones),
  measure preserving onto `γW ⊗ γP` (`measurePreserving_splitE`).
* `visE`: the measurable equivalence `u ↦ (u_{i₀} + i u_{i₁})/√2` between the two visible real
  coordinates and `ℂ`, with `γP.map visE = gaussC` (`map_visE`).
* `join z w`: the point with visible coordinate `z` and remote coordinates `w`.
* `integral_split` (Fubini in the fibre form): `∫ G dγ = ∫ w, ∫ z, G(join z w) dgaussC dγW` for
  integrable `G`; `ae_split`: an a.e. property holds on a.e. fibre; `integrable_split`: the fibre
  sections of an integrable function are integrable for a.e. `w`.
* `zc_join`: the visible coordinate of `join z w` is `√2 z` (so `ζ = z`).
-/

open MeasureTheory ProbabilityTheory Real Set Grothe.Lower
open scoped ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable (n : ℕ)

/-- The two real coordinates of the visible complex coordinate. -/
def i0 : Fin ((n + 1) + (n + 1)) := Fin.castAdd (n + 1) 0
def i1 : Fin ((n + 1) + (n + 1)) := Fin.natAdd (n + 1) 0

lemma i0_ne_i1 : i0 n ≠ i1 n := by
  intro h
  have := congrArg Fin.val h
  simp [i0, i1] at this

/-- Membership in the visible pair. -/
def isVis (i : Fin ((n + 1) + (n + 1))) : Prop := i = i0 n ∨ i = i1 n

instance : DecidablePred (isVis n) := fun _ => instDecidableOr

/-- The two visible real coordinates. -/
abbrev VisT := Subtype (isVis n)
/-- The remote real coordinates. -/
abbrev RemT := {i // ¬ isVis n i}

def a0 : VisT n := ⟨i0 n, Or.inl rfl⟩
def a1 : VisT n := ⟨i1 n, Or.inr rfl⟩

lemma a0_ne_a1 : a0 n ≠ a1 n := fun h => i0_ne_i1 n (congrArg Subtype.val h)

/-- The Gaussian of the visible pair. -/
def γP : Measure (VisT n → ℝ) := Measure.pi fun _ => gaussianReal 0 1
/-- The Gaussian of the remote coordinates. -/
def γW : Measure (RemT n → ℝ) := Measure.pi fun _ => gaussianReal 0 1

instance : IsProbabilityMeasure (γP n) := by unfold γP; infer_instance
instance : IsProbabilityMeasure (γW n) := by unfold γW; infer_instance

/-- `x ↦ (w, u)`. -/
def splitE : (Fin ((n + 1) + (n + 1)) → ℝ) ≃ᵐ (RemT n → ℝ) × (VisT n → ℝ) :=
  (MeasurableEquiv.piEquivPiSubtypeProd (fun _ => ℝ) (isVis n)).trans MeasurableEquiv.prodComm

lemma measurePreserving_splitE :
    MeasurePreserving (splitE n) (stdGaussian ((n + 1) + (n + 1))) ((γW n).prod (γP n)) := by
  unfold splitE stdGaussian γW γP
  exact (Measure.measurePreserving_swap).comp
    (measurePreserving_piEquivPiSubtypeProd (fun _ => gaussianReal 0 1) (isVis n))

/-! ### The visible coordinate as a complex number -/

/-- `u ↦ (u₀ + i u₁)/√2`. -/
def visC (u : VisT n → ℝ) : ℂ := ((u (a0 n) : ℂ) + (u (a1 n) : ℂ) * Complex.I) / (√2 : ℝ)

/-- The inverse: `z ↦ (√2 Re z, √2 Im z)`. -/
def visU (z : ℂ) : VisT n → ℝ := fun i => if i = a0 n then √2 * z.re else √2 * z.im

lemma sqrt_two_ne : (√2 : ℝ) ≠ 0 := by positivity

lemma visC_re (u : VisT n → ℝ) : (visC n u).re = u (a0 n) / √2 := by
  simp [visC, Complex.div_ofReal_re]

lemma visC_im (u : VisT n → ℝ) : (visC n u).im = u (a1 n) / √2 := by
  simp [visC, Complex.div_ofReal_im]

lemma VisT_cases (i : VisT n) : i = a0 n ∨ i = a1 n := by
  rcases i with ⟨i, h | h⟩
  · left; subst h; rfl
  · right; subst h; rfl

lemma visU_visC (u : VisT n → ℝ) : visU n (visC n u) = u := by
  funext i
  rcases VisT_cases n i with rfl | rfl
  · rw [visU, ite_eq_left rfl, visC_re]; field_simp
  · rw [visU, ite_eq_right (a0_ne_a1 n).symm, visC_im]; field_simp

lemma visC_visU (z : ℂ) : visC n (visU n z) = z := by
  apply Complex.ext
  · rw [visC_re, visU, ite_eq_left rfl]; field_simp
  · rw [visC_im, visU, ite_eq_right (a0_ne_a1 n).symm]; field_simp

lemma continuous_visC : Continuous (visC n) := by unfold visC; fun_prop

lemma continuous_visU : Continuous (visU n) := by
  refine continuous_pi fun i => ?_
  unfold visU
  split_ifs <;> fun_prop

/-- The visible coordinate as a measurable equivalence with `ℂ`. -/
def visE : (VisT n → ℝ) ≃ᵐ ℂ where
  toFun := visC n
  invFun := visU n
  left_inv := visU_visC n
  right_inv := visC_visU n
  measurable_toFun := (continuous_visC n).measurable
  measurable_invFun := (continuous_visU n).measurable

lemma map_visE : (γP n).map (visE n) = gaussC := by
  have h := pi_map_two (ι := VisT n) (a0 n) (a1 n) (a0_ne_a1 n)
  rw [gaussC_eq_map, ← h, Measure.map_map measurable_F2 (by fun_prop)]
  rfl

/-! ### The join and Fubini in fibre form -/

/-- The point with visible coordinate `z` and remote coordinates `w`. -/
def join (z : ℂ) (w : RemT n → ℝ) : Fin ((n + 1) + (n + 1)) → ℝ := (splitE n).symm (w, visU n z)

lemma splitE_symm_eq (w : RemT n → ℝ) (u : VisT n → ℝ) :
    (splitE n).symm (w, u) = join n (visC n u) w := by
  rw [join, visU_visC]

lemma splitE_symm_apply (w : RemT n → ℝ) (u : VisT n → ℝ) (i : Fin ((n + 1) + (n + 1))) :
    (splitE n).symm (w, u) i = if h : isVis n i then u ⟨i, h⟩ else w ⟨i, h⟩ := rfl

lemma join_i0 (z : ℂ) (w : RemT n → ℝ) : join n z w (i0 n) = √2 * z.re := by
  rw [join, splitE_symm_apply, dite_eq_left (show isVis n (i0 n) from Or.inl rfl), visU]
  exact ite_eq_left rfl

lemma join_i1 (z : ℂ) (w : RemT n → ℝ) : join n z w (i1 n) = √2 * z.im := by
  rw [join, splitE_symm_apply, dite_eq_left (show isVis n (i1 n) from Or.inr rfl), visU, ite_eq_right]
  intro e
  exact i0_ne_i1 n (congrArg Subtype.val e).symm

/-- The visible coordinate of `join z w` is `√2 z`, i.e. `ζ = z₀/√2 = z`. -/
lemma zc_join (z : ℂ) (w : RemT n → ℝ) : zc (n + 1) 0 (join n z w) = (√2 : ℝ) * z := by
  apply Complex.ext
  · simp only [zc, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
    exact join_i0 n z w
  · simp only [zc, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero]
    exact join_i1 n z w

variable {n}

/-- **Fubini in fibre form.** -/
theorem integral_split {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (G : (Fin ((n + 1) + (n + 1)) → ℝ) → E) (hG : Integrable G (stdGaussian ((n + 1) + (n + 1)))) :
    ∫ x, G x ∂(stdGaussian ((n + 1) + (n + 1)))
      = ∫ w, ∫ z, G (join n z w) ∂gaussC ∂(γW n) := by
  have hm := measurePreserving_splitE n
  have h1 : ∫ x, G x ∂(stdGaussian ((n + 1) + (n + 1)))
      = ∫ p, G ((splitE n).symm p) ∂((γW n).prod (γP n)) := by
    rw [← hm.integral_comp' (fun p => G ((splitE n).symm p))]
    simp
  have hi : Integrable (fun p => G ((splitE n).symm p)) ((γW n).prod (γP n)) := by
    have := hm.symm (splitE n)
    exact (this.integrable_comp_emb (splitE n).symm.measurableEmbedding).2 hG
  rw [h1, integral_prod _ hi]
  congr 1
  funext w
  rw [← map_visE n, integral_map_equiv]
  simp only [splitE_symm_eq]
  rfl

/-- **An a.e. property holds on a.e. fibre.** -/
theorem ae_split {P : (Fin ((n + 1) + (n + 1)) → ℝ) → Prop}
    (h : ∀ᵐ x ∂(stdGaussian ((n + 1) + (n + 1))), P x) :
    ∀ᵐ w ∂(γW n), ∀ᵐ z ∂gaussC, P (join n z w) := by
  have hm := measurePreserving_splitE n
  have h2 : ∀ᵐ p ∂((γW n).prod (γP n)), P ((splitE n).symm p) := by
    rw [← hm.map_eq, (splitE n).measurableEmbedding.ae_map_iff]
    simpa using h
  filter_upwards [Measure.ae_ae_of_ae_prod h2] with w hw
  rw [← map_visE n, (visE n).measurableEmbedding.ae_map_iff]
  filter_upwards [hw] with u hu
  rw [splitE_symm_eq] at hu
  exact hu

/-- The fibre sections of an integrable function are integrable for a.e. `w`. -/
theorem integrable_split {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {G : (Fin ((n + 1) + (n + 1)) → ℝ) → E} (hG : Integrable G (stdGaussian ((n + 1) + (n + 1)))) :
    ∀ᵐ w ∂(γW n), Integrable (fun z => G (join n z w)) gaussC := by
  have hm := measurePreserving_splitE n
  have hi : Integrable (fun p => G ((splitE n).symm p)) ((γW n).prod (γP n)) :=
    ((hm.symm (splitE n)).integrable_comp_emb (splitE n).symm.measurableEmbedding).2 hG
  filter_upwards [hi.prod_right_ae] with w hw
  rw [← map_visE n, (visE n).measurableEmbedding.integrable_map_iff]
  refine hw.congr (Filter.Eventually.of_forall fun u => ?_)
  simp only [Function.comp, splitE_symm_eq]
  rfl

end

end Grothe.LowerAnalytic
