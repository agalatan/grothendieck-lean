import Grothe.Haagerup.PhaseCoefficients
import Grothe.Haagerup.PhaseKernel
import Grothe.Haagerup.Law

/-!
# Haagerup's identity and the hypothesis-free bound

* `Phi2_radial`: for `|z| ≤ 1`, `E[conj(phase U) · phase(zU + √(1−|z|²) W)] = Σ_k c_k z|z|^{2k}`
  (`PhaseCoefficients`, `PhaseKernel`);
* `integral_phase_pair`: for unit `x ⊥ w` in `ℂ^κ` and `g ~ stdGaussian`,
  `E[conj(phase⟪g, x⟫) · phase⟪g, zx + sw⟫] = Φ₂(z, s)` (the real frame `x, −ix, w, −iw`,
  `integral_coords4`);
* `haagerup_disk`: Haagerup's phase rounding `ε = phase⟪g, x⟫` (on `ℂ^{ι ⊕ 1}`, so that an
  orthogonal unit vector always exists) realises `radialKernel haagCoeff`;
* `Grothe.haagerup_dominated`: the Gaussian phase kernel is dominated, without hypotheses.
  The unconditional endpoint is assembled in `Grothe.Haagerup.Power`.
-/

namespace Grothe.Haag

open MeasureTheory ProbabilityTheory Real Complex
open scoped ComplexConjugate

noncomputable section

/-! ### The radial identity -/

/-- **Haagerup's radial identity.** -/
theorem Phi2_radial {z : ℂ} (hz : ‖z‖ ≤ 1) :
    Phi2 z √(1 - ‖z‖ ^ 2) = radialKernel haagCoeff z := by
  exact Phi2_radial_of_phase_energy phase_energy hz

/-! ### The reduction to two complex Gaussians -/

variable {κ : Type} [Fintype κ]

lemma re_inner_eq (a b : EuclideanSpace ℂ κ) : inner ℝ a b = (inner ℂ a b).re := by
  simp only [PiLp.inner_apply, Complex.re_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Complex.inner, RCLike.inner_apply]

/-- The real frame `x, −ix, w, −iw`. -/
def frame (x w : EuclideanSpace ℂ κ) : Fin 4 → EuclideanSpace ℂ κ :=
  ![x, (-Complex.I) • x, w, (-Complex.I) • w]

lemma inner_self_one {x : EuclideanSpace ℂ κ} (hx : ‖x‖ = 1) : inner ℂ x x = 1 := by
  rw [inner_self_eq_norm_sq_to_K, hx]; simp

lemma orthonormal_frame {x w : EuclideanSpace ℂ κ} (hx : ‖x‖ = 1) (hw : ‖w‖ = 1)
    (hxw : inner ℂ x w = 0) : Orthonormal ℝ (frame x w) := by
  have hwx : inner ℂ w x = 0 := by rw [← inner_conj_symm, hxw, map_zero]
  have hxx := inner_self_one hx
  have hww := inner_self_one hw
  rw [orthonormal_iff_ite]
  intro i j
  fin_cases i <;> fin_cases j <;>
    simp [frame, re_inner_eq, hxw, hwx, hx, hw, norm_smul]

lemma inner_g_cx (a g : EuclideanSpace ℂ κ) :
    inner ℂ g a = cx (inner ℝ a g, inner ℝ ((-Complex.I) • a) g) := by
  have h := inner_conj_symm (𝕜 := ℂ) a g
  rw [re_inner_eq, re_inner_eq, inner_smul_left]
  apply Complex.ext
  · simp [cx]; rw [← h, Complex.conj_re]
  · simp [cx]; rw [← h, Complex.conj_im, neg_neg]

lemma inner_g_eq_cx (x w g : EuclideanSpace ℂ κ) :
    inner ℂ g x = cx ((coords4 (frame x w) g).1) ∧
      inner ℂ g w = cx ((coords4 (frame x w) g).2) := by
  rw [coords4_apply, inner_g_cx x g, inner_g_cx w g]
  exact ⟨rfl, rfl⟩

/-- **The two-variable reduction.** -/
theorem integral_phase_pair {x w : EuclideanSpace ℂ κ} (hx : ‖x‖ = 1) (hw : ‖w‖ = 1)
    (hxw : inner ℂ x w = 0) (z : ℂ) (s : ℝ) :
    ∫ g, conj (ph (inner ℂ g x)) * ph (inner ℂ g (z • x + (s : ℂ) • w))
      ∂stdGaussian (EuclideanSpace ℂ κ) = Phi2 z s := by
  have e : ∀ g : EuclideanSpace ℂ κ, conj (ph (inner ℂ g x)) * ph (inner ℂ g (z • x + (s : ℂ) • w))
      = (fun p : (ℝ × ℝ) × (ℝ × ℝ) => conj (ph (cx p.1)) * ph (z * cx p.1 + (s : ℂ) * cx p.2))
        (coords4 (frame x w) g) := fun g => by
    obtain ⟨h1, h2⟩ := inner_g_eq_cx x w g
    simp only [inner_add_right, inner_smul_right, h1, h2]
  have hF : Measurable fun p : (ℝ × ℝ) × (ℝ × ℝ) =>
      conj (ph (cx p.1)) * ph (z * cx p.1 + (s : ℂ) * cx p.2) := by
    have := measurable_ph
    fun_prop
  calc ∫ g, conj (ph (inner ℂ g x)) * ph (inner ℂ g (z • x + (s : ℂ) • w))
        ∂stdGaussian (EuclideanSpace ℂ κ)
      = ∫ g, (fun p : (ℝ × ℝ) × (ℝ × ℝ) => conj (ph (cx p.1)) * ph (z * cx p.1 + (s : ℂ) * cx p.2))
          (coords4 (frame x w) g) ∂stdGaussian (EuclideanSpace ℂ κ) :=
        integral_congr_ae (Filter.Eventually.of_forall e)
    _ = Phi2 z s := integral_coords4 _ (orthonormal_frame hx hw hxw) hF

/-! ### The decomposition `y = ⟪x,y⟫ x + √(1−|⟪x,y⟫|²) w` -/

lemma exists_decomp {x y e : EuclideanSpace ℂ κ} (hx : ‖x‖ = 1) (hy : ‖y‖ = 1) (he : ‖e‖ = 1)
    (hxe : inner ℂ x e = 0) :
    ∃ w : EuclideanSpace ℂ κ, ‖w‖ = 1 ∧ inner ℂ x w = 0 ∧
      y = inner ℂ x y • x + ((√(1 - ‖inner ℂ x y‖ ^ 2) : ℝ) : ℂ) • w := by
  set z := inner ℂ x y
  set r := y - z • x with hr
  have hxr : inner ℂ x r = 0 := by
    rw [hr, inner_sub_right, inner_smul_right, inner_self_one hx]; simp [z]
  have hpy : ‖r‖ ^ 2 = 1 - ‖z‖ ^ 2 := by
    have h := norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (z • x) r (by
      rw [inner_smul_left, hxr, mul_zero])
    rw [show z • x + r = y by rw [hr]; abel, hy, norm_smul, hx] at h
    linarith
  have hsr : √(1 - ‖z‖ ^ 2) = ‖r‖ := by
    rw [← hpy, Real.sqrt_sq (norm_nonneg _)]
  rcases eq_or_ne r 0 with h0 | h0
  · refine ⟨e, he, hxe, ?_⟩
    rw [hsr, h0, norm_zero, Complex.ofReal_zero, zero_smul, add_zero]
    rw [← sub_eq_zero]; exact h0
  · have hn : (‖r‖ : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 h0
    refine ⟨((‖r‖ : ℂ))⁻¹ • r, ?_, ?_, ?_⟩
    · rw [norm_smul, norm_inv, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
        inv_mul_cancel₀ (norm_ne_zero_iff.2 h0)]
    · rw [inner_smul_right, hxr, mul_zero]
    · rw [hsr, smul_smul, mul_inv_cancel₀ hn, one_smul, hr]; abel

/-! ### The embedding into `ℂ^{ι ⊕ 1}` -/

/-- `x ↦ (x, 0)`. -/
def emb {ι : Type} [Fintype ι] (x : EuclideanSpace ℂ ι) : EuclideanSpace ℂ (Option ι) :=
  WithLp.toLp 2 fun o => match o with
    | none => 0
    | some i => x i

lemma inner_emb {ι : Type} [Fintype ι] (x y : EuclideanSpace ℂ ι) :
    inner ℂ (emb x) (emb y) = inner ℂ x y := by
  simp [emb, PiLp.inner_apply, Fintype.sum_option]

lemma norm_emb {ι : Type} [Fintype ι] {x : EuclideanSpace ℂ ι} (hx : ‖x‖ = 1) : ‖emb x‖ = 1 := by
  have h1 : inner ℂ (emb x) (emb x) = (1 : ℂ) := by rw [inner_emb, inner_self_one hx]
  rw [inner_self_eq_norm_sq_to_K] at h1
  have h2 : (‖emb x‖ : ℝ) ^ 2 = 1 := by
    have h3 : (((‖emb x‖ : ℝ) ^ 2 : ℝ) : ℂ) = 1 := by rw [← h1]; push_cast; rfl
    exact_mod_cast h3
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h2

/-- The extra unit vector. -/
def eNone (ι : Type) [Fintype ι] : EuclideanSpace ℂ (Option ι) :=
  WithLp.toLp 2 fun o => match o with
    | none => 1
    | some _ => 0

lemma norm_eNone (ι : Type) [Fintype ι] : ‖eNone ι‖ = 1 := by
  have h1 : inner ℂ (eNone ι) (eNone ι) = (1 : ℂ) := by
    simp only [eNone, PiLp.inner_apply, Fintype.sum_option, RCLike.inner_apply]
    simp
  rw [inner_self_eq_norm_sq_to_K] at h1
  have h2 : (‖eNone ι‖ : ℝ) ^ 2 = 1 := by
    have h3 : (((‖eNone ι‖ : ℝ) ^ 2 : ℝ) : ℂ) = 1 := by rw [← h1]; push_cast; rfl
    exact_mod_cast h3
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h2

lemma inner_emb_eNone {ι : Type} [Fintype ι] (x : EuclideanSpace ℂ ι) :
    inner ℂ (emb x) (eNone ι) = 0 := by
  simp [eNone, emb, PiLp.inner_apply, Fintype.sum_option]

/-! ### Haagerup's rounding -/

/-- **Haagerup's phase rounding realises `radialKernel haagCoeff`.** -/
theorem haagerup_disk : DiskKernel (radialKernel haagCoeff) := by
  intro m n ι _ x y hx hy
  refine ⟨EuclideanSpace ℂ (Option ι), inferInstance, stdGaussian _, inferInstance,
    fun g i => ph (inner ℂ g (emb (x i))), fun g j => ph (inner ℂ g (emb (y j))),
    fun i => ?_, fun j => ?_, fun g i => norm_ph_le _, fun g j => norm_ph_le _, fun i j => ?_⟩
  · exact (measurable_ph.comp (by fun_prop)).aestronglyMeasurable
  · exact (measurable_ph.comp (by fun_prop)).aestronglyMeasurable
  obtain ⟨w, hw, hxw, hyw⟩ := exists_decomp (norm_emb (hx i)) (norm_emb (hy j))
    (norm_eNone ι) (inner_emb_eNone (x i))
  have hz : ‖inner ℂ (x i) (y j)‖ ≤ 1 := by
    simpa [hx, hy] using norm_inner_le_norm (𝕜 := ℂ) (x i) (y j)
  dsimp only
  rw [hyw, integral_phase_pair (norm_emb (hx i)) hw hxw, inner_emb, Phi2_radial hz]

end

end Grothe.Haag

namespace Grothe

/-- Haagerup's kernel is dominated. -/
theorem haagerup_dominated : DominatedKernel (radialKernel haagCoeff) :=
  Haag.haagerup_disk.dominated

end Grothe
