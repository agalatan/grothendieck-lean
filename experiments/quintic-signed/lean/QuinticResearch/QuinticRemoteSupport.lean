import QuinticResearch.QuinticEllipse
import Grothe.LowerAnalytic.Frame
import Mathlib.Probability.IdentDistribIndep
import Mathlib.Probability.HasLaw

/-!
# Physical support of a unimodular pair

The midpoint and half-difference admit a joint support estimate against arbitrary L² tests.
For an independent remote cubic subprojection, reflection of the visible linear Gaussian
identifies the two signed integrals. This derives the physical pairing step of the
remote cubic lift directly from the original phase pair.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

private theorem re_inner_le_integral_norm_of_phase {n : ℕ} {f : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (w : L2G n) :
    (inner ℂ f w).re ≤ ∫ x, ‖w x‖ ∂(stdGaussian (n + n)) := by
  calc (inner ℂ f w).re ≤ ‖inner ℂ f w‖ := Complex.re_le_norm _
    _ ≤ ∫ x, ‖conj (f x) * w x‖ ∂(stdGaussian (n + n)) := by
      rw [inner_L2]; exact norm_integral_le_integral_norm _
    _ = _ := integral_congr_ae (by
      filter_upwards [show ∀ᵐ x ∂(stdGaussian (n + n)), ‖f x‖ = 1 from hf] with x hx
      rw [norm_mul, Complex.norm_conj, hx, one_mul])

/-- The two signed support functions hold for every phase pair and arbitrary actual tests. -/
theorem phase_pair_support {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n + n))) (hg : g ∈ Unimod (stdGaussian (n + n)))
    (u v : L2G n) :
    (inner ℂ (hOf n f g) u).re + (inner ℂ (kOf n f g) v).re ≤
      ((∫ x, ‖u x + v x‖ ∂(stdGaussian (n + n))) +
        (∫ x, ‖u x - v x‖ ∂(stdGaussian (n + n)))) / 2 := by
  have hsum := re_inner_le_integral_norm_of_phase hf (u + v)
  have hdiff := re_inner_le_integral_norm_of_phase hg (u - v)
  have ha : (∫ x, ‖(u + v : L2G n) x‖ ∂(stdGaussian (n + n))) =
      ∫ x, ‖u x + v x‖ ∂(stdGaussian (n + n)) :=
    integral_congr_ae (by filter_upwards [Lp.coeFn_add u v] with x hx; rw [hx]; rfl)
  have hs : (∫ x, ‖(u - v : L2G n) x‖ ∂(stdGaussian (n + n))) =
      ∫ x, ‖u x - v x‖ ∂(stdGaussian (n + n)) :=
    integral_congr_ae (by filter_upwards [Lp.coeFn_sub u v] with x hx; rw [hx]; rfl)
  rw [ha, ← hOf_add_kOf n f g] at hsum
  rw [hs, ← hOf_sub_kOf n f g] at hdiff
  simp only [inner_add_left, inner_sub_left, inner_add_right, inner_sub_right,
    Complex.add_re, Complex.sub_re] at hsum hdiff
  linarith only [hsum, hdiff]

/-- The direction of the visible projection. At zero amplitude it is the zero function. -/
def visibleDirection (n : ℕ) (f g : L2G n) : L2G n :=
  (((tOf n f g)⁻¹ : ℝ) : ℂ) • (H10 n).starProjection (hOf n f g)

theorem visibleDirection_mem (n : ℕ) (f g : L2G n) : visibleDirection n f g ∈ H10 n :=
  (H10 n).smul_mem _ ((H10 n).starProjection_apply_mem _)

theorem norm_visibleDirection_of_pos {n : ℕ} {f g : L2G n} (ht : 0 < tOf n f g) :
    ‖visibleDirection n f g‖ = 1 := by
  rw [visibleDirection, norm_smul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (inv_pos.mpr ht)]
  change (tOf n f g)⁻¹ * tOf n f g = 1
  exact inv_mul_cancel₀ ht.ne'

theorem re_inner_visibleDirection (n : ℕ) (f g : L2G n) :
    (inner ℂ (hOf n f g) (visibleDirection n f g)).re = tOf n f g := by
  rw [visibleDirection, inner_smul_right, Complex.re_ofReal_mul, re_inner_starProjection]
  change (tOf n f g)⁻¹ * tOf n f g ^ 2 = tOf n f g
  by_cases h : tOf n f g = 0
  · simp [h]
  · field_simp

/-- For a subspace of the actual cubic chaos, projecting the cubic of the half-difference
gives a test with physical pairing equal to its own energy. -/
theorem re_inner_cubic_subprojection {n : ℕ} (W : Submodule ℂ (L2G n))
    [W.HasOrthogonalProjection] (hW : W ≤ H21 n) (f g : L2G n) :
    (inner ℂ (kOf n f g) (W.starProjection (QkOf n f g))).re =
      ‖W.starProjection (QkOf n f g)‖ ^ 2 := by
  have h : W.starProjection (QkOf n f g) = W.starProjection (kOf n f g) := by
    change W.starProjection ((H21 n).starProjection _) = _
    rw [← ContinuousLinearMap.comp_apply, Submodule.starProjection_comp_starProjection_of_le hW]
  rw [h, re_inner_starProjection]

private theorem linC_neg (n : ℕ) (c : Fin n → ℂ) (x : Fin (n+n) → ℝ) :
    linC n c (-x) = -linC n c x := by
  have h (i : Fin n) : zc n i (-x) = -zc n i x := by rfl
  simp only [linC, h, mul_neg, Finset.sum_neg_distrib]

/-- Each visible test is centrally symmetric in law in every dimension, including the zero test. -/
theorem identDistrib_neg_of_mem_H10 {n : ℕ} {u : L2G n} (hu : u ∈ H10 n) :
    IdentDistrib (fun x => u x) (fun x => -u x) (stdGaussian (n + n)) (stdGaussian (n + n)) := by
  obtain ⟨c, rfl⟩ := (Submodule.mem_span_range_iff_exists_fun ℂ).mp hu
  let μ := stdGaussian (n+n)
  have hneg : MeasurePreserving (fun x : Fin (n+n) → ℝ => -x) μ μ := by
    let N (_ : Fin (n+n)) : ℝ → ℝ := fun y => -y
    have hx (i : Fin (n+n)) : MeasurePreserving (N i) (gaussianReal 0 1) (gaussianReal 0 1) := by
      refine ⟨measurable_neg, ?_⟩
      change (gaussianReal 0 1).map (fun y : ℝ => -y) = _
      simpa only [neg_zero] using (gaussianReal_map_neg (μ := 0) (v := 1))
    exact measurePreserving_pi _ _ hx
  have hid : IdentDistrib (fun x : Fin (n+n) → ℝ => x) (fun x => -x) μ μ :=
    ⟨measurable_id.aemeasurable, hneg.aemeasurable, (Measure.map_id (μ := μ)).trans hneg.map_eq.symm⟩
  have hm : Measurable (linC n c) := by
    unfold linC
    exact Finset.measurable_sum _ fun i _ => measurable_const.mul (continuous_zc n i).measurable
  have hlin : IdentDistrib (linC n c) (fun x => -linC n c x) μ μ := by
    simpa only [Function.comp_def, linC_neg] using hid.comp hm
  have hL := IdentDistrib.of_ae_eq (Lp.aestronglyMeasurable _).aemeasurable (linL_ae n c)
  exact hL.trans (hlin.trans (hL.comp measurable_neg).symm)

/-- For independent tests, central symmetry of the visible Gaussian identifies the
two signed scalar support functions. -/
theorem independent_test_sign_integral {n : ℕ} {u v : L2G n} (hu : u ∈ H10 n)
    (hind : IndepFun (fun x => u x) (fun x => v x) (stdGaussian (n + n))) (ℓ : ℝ) :
    (∫ x, ‖(ℓ : ℂ) * u x - v x‖ ∂(stdGaussian (n+n))) =
      ∫ x, ‖(ℓ : ℂ) * u x + v x‖ ∂(stdGaussian (n+n)) := by
  have law := (identDistrib_neg_of_mem_H10 hu).prodMk
    (IdentDistrib.refl (Lp.aestronglyMeasurable v).aemeasurable) hind hind.neg_left
  have hm : Measurable (fun p : ℂ × ℂ => ‖(ℓ : ℂ) * p.1 - p.2‖) := by fun_prop
  have h := (law.comp hm).integral_eq
  change (∫ x, ‖(ℓ : ℂ) * u x - v x‖ ∂(stdGaussian (n+n))) =
    ∫ x, ‖(ℓ : ℂ) * (-u x) - v x‖ ∂(stdGaussian (n+n)) at h
  have halg (a b : ℂ) : -a - b = -(a + b) := by ring
  simpa only [mul_neg, halg, norm_neg] using h

/-- A visible linear test independent of the cubic projection combines the two
directional support functions on the same physical pair. -/
theorem independent_cubic_subprojection_support {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection] (hW : W ≤ H21 n)
    (z : L2G n) (hz : z ∈ H10 n)
    (hind : IndepFun (fun x => z x) (fun x => W.starProjection (QkOf n f g) x) (stdGaussian (n+n)))
    (ℓ : ℝ) :
    ℓ * (inner ℂ (hOf n f g) z).re + ‖W.starProjection (QkOf n f g)‖ ^ 2 ≤
      ∫ x, ‖(ℓ : ℂ) * z x + W.starProjection (QkOf n f g) x‖ ∂(stdGaussian (n+n)) := by
  let R := W.starProjection (QkOf n f g)
  have hp := phase_pair_support hf hg ((ℓ : ℂ) • z) R
  have ha : (∫ x, ‖((ℓ : ℂ) • z : L2G n) x + R x‖ ∂(stdGaussian (n+n))) =
      ∫ x, ‖(ℓ : ℂ) * z x + R x‖ ∂(stdGaussian (n+n)) := by
    apply integral_congr_ae
    filter_upwards [Lp.coeFn_smul (ℓ : ℂ) z] with x hx
    rw [hx]; rfl
  have hs : (∫ x, ‖((ℓ : ℂ) • z : L2G n) x - R x‖ ∂(stdGaussian (n+n))) =
      ∫ x, ‖(ℓ : ℂ) * z x - R x‖ ∂(stdGaussian (n+n)) := by
    apply integral_congr_ae
    filter_upwards [Lp.coeFn_smul (ℓ : ℂ) z] with x hx
    rw [hx]; rfl
  rw [ha, hs, independent_test_sign_integral hz hind ℓ,
    inner_smul_right, Complex.re_ofReal_mul, re_inner_cubic_subprojection W hW] at hp
  linarith only [hp]

/-- For the actual visible direction and an independent projection onto a cubic subspace,
the single remote directional test follows from unimodularity. -/
theorem independent_remote_phase_support {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection] (hW : W ≤ H21 n)
    (hind : IndepFun (fun x => visibleDirection n f g x)
      (fun x => W.starProjection (QkOf n f g) x) (stdGaussian (n+n))) (ℓ : ℝ) :
    ℓ * tOf n f g + ‖W.starProjection (QkOf n f g)‖ ^ 2 ≤
      ∫ x, ‖(ℓ : ℂ) * visibleDirection n f g x + W.starProjection (QkOf n f g) x‖
        ∂(stdGaussian (n+n)) := by
  simpa only [re_inner_visibleDirection] using independent_cubic_subprojection_support hf hg
    W hW (visibleDirection n f g) (visibleDirection_mem n f g) hind ℓ

/-- The joint support variance and its signed difference each debit the projection
energy. The estimate applies in all sectors, including correlated tests. -/
theorem cubic_subprojection_alignment_deficit {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection] (hW : W ≤ H21 n) :
    let u := (H10 n).starProjection (hOf n f g)
    let v := W.starProjection (QkOf n f g)
    let D := ‖u‖ ^ 2 + ‖v‖ ^ 2
    D ^ 2 + (variance (fun x => ‖u x + v x‖ + ‖u x - v x‖) (stdGaussian (n+n)) +
      ∫ x, (‖u x + v x‖ - ‖u x - v x‖) ^ 2 ∂(stdGaussian (n+n))) / 4 ≤ D := by
  let u := (H10 n).starProjection (hOf n f g)
  let v := W.starProjection (QkOf n f g)
  let D := ‖u‖ ^ 2 + ‖v‖ ^ 2
  let μ := stdGaussian (n+n)
  let p (x : Fin (n+n) → ℝ) := ‖u x + v x‖
  let m (x : Fin (n+n) → ℝ) := ‖u x - v x‖
  change D ^ 2 + (variance (p+m) μ + ∫ x, (p x - m x) ^ 2 ∂μ) / 4 ≤ D
  have hp : MemLp p 2 μ := ((Lp.memLp u).add (Lp.memLp v)).norm
  have hm : MemLp m 2 μ := ((Lp.memLp u).sub (Lp.memLp v)).norm
  have hpairs : D ≤ ((∫ x, p x ∂μ) + ∫ x, m x ∂μ) / 2 := by
    have h := phase_pair_support hf hg u v
    change (inner ℂ (hOf n f g) ((H10 n).starProjection (hOf n f g))).re +
      (inner ℂ (kOf n f g) (W.starProjection (QkOf n f g))).re ≤ _ at h
    rw [re_inner_starProjection, re_inner_cubic_subprojection W hW] at h
    exact h
  have hsum : 2*D ≤ ∫ x, (p x + m x) ∂μ := by
    rw [integral_add (hp.integrable one_le_two) (hm.integrable one_le_two)]
    linarith only [hpairs]
  have hsq := pow_le_pow_left₀ (by dsimp [D]; positivity : 0 ≤ 2*D) hsum 2
  have hvar := variance_eq_sub (hp.add hm)
  change variance (p+m) μ = (∫ x, (p x + m x)^2 ∂μ) - (∫ x, p x + m x ∂μ)^2 at hvar
  have hpar : (∫ x, (p x + m x)^2 ∂μ) + (∫ x, (p x - m x)^2 ∂μ) = 4*D := by
    dsimp only [D]
    have i₁ : Integrable (fun x => (p x + m x)^2) μ := (hp.add hm).integrable_sq
    have i₂ : Integrable (fun x => (p x - m x)^2) μ := (hp.sub hm).integrable_sq
    have i₃ : Integrable (fun x => ‖u x‖ ^ 2) (stdGaussian (n+n)) := (Lp.memLp u).norm.integrable_sq
    have i₄ : Integrable (fun x => ‖v x‖ ^ 2) (stdGaussian (n+n)) := (Lp.memLp v).norm.integrable_sq
    rw [← integral_add i₁ i₂,
      norm_sq_eq_integral, norm_sq_eq_integral,
      ← integral_add i₃ i₄,
      ← integral_const_mul]
    apply integral_congr_ae
    filter_upwards with x
    dsimp only [p, m]
    nlinarith only [parallelogram_law_with_norm ℂ (u x) (v x)]
  nlinarith only [hsq, hvar, hpar]


/-- The remote cubic subspace in the visible-coordinate frame consists exactly of
cubics that depend only on the remaining coordinates, embedded as fibre piece zero. -/
def remoteCubic (n : ℕ) : Submodule ℂ (L2G (n+1)) := (H21 n).map (T n 0)

instance (n : ℕ) : (remoteCubic n).HasOrthogonalProjection := by
  have : FiniteDimensional ℂ (remoteCubic n) := by unfold remoteCubic; infer_instance
  have := Submodule.complete_of_finiteDimensional (remoteCubic n)
  infer_instance

theorem remoteCubic_le (n : ℕ) : remoteCubic n ≤ H21 (n+1) := by
  rintro _ ⟨r, hr, rfl⟩
  obtain ⟨c, rfl⟩ := exists_wick_repr n hr
  rw [map_sum]
  refine Submodule.sum_mem _ fun p _ => ?_
  rw [map_smul]
  apply Submodule.smul_mem
  have h : T n 0 (wickL n p.1 p.2.1 p.2.2) = wickL (n+1) p.1.succ p.2.1.succ p.2.2.succ := by
    refine lp_eq_of_joinR (T_ae _ _ (wickL_ae' n p.1 p.2.1 p.2.2))
      (wickL_ae' _ _ _ _) fun z y => ?_
    rw [wickFn_joinR, tensorFn_joinR]
    simp [joinR_zc_succ, fibreB, wickFn, wc]
  rw [h]
  exact wickL_mem_H21 _ _ _ _

/-- Every element of the actual remote cubic subspace is independent of the normalized
visible coordinate, including the orthogonal projection of an arbitrary half-difference. -/
theorem indep_visible_remoteCubic {n : ℕ} {R : L2G (n+1)} (hR : R ∈ remoteCubic n) :
    IndepFun (fun x => zeta0 n x)
      (fun x => R x) (stdGaussian ((n+1)+(n+1))) := by
  obtain ⟨r, _, rfl⟩ := hR
  have mp := measurePreserving_split2 (n := n)
  have h₁ := (measurePreserving_fst.comp mp).hasLaw
  have h₂ := (measurePreserving_snd.comp mp).hasLaw
  have hind := (indepFun_iff_hasLaw_prodMk_prod h₁ h₂).mpr mp.hasLaw
  have h := hind.symm.comp measurable_id (Lp.stronglyMeasurable r).measurable
  apply h.congr
  · have hvis : (fun x => (split2 (n := n) x).2) =
        (fun x => (((√2 : ℝ) : ℂ)⁻¹) * zc (n+1) 0 x) := by
      apply funext_joinR
      intro z y
      rw [split2_joinR, joinR_zc0]
      have hs : ((√2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast sqrt_two_ne
      field_simp
    change (fun x => (split2 (n := n) x).2) =ᵐ[_] _
    rw [hvis]
    filter_upwards [Lp.coeFn_smul (((√2 : ℝ) : ℂ)⁻¹) (zL (n+1) 0), zL_ae (n+1) 0] with x hx hz
    change _ = (((((√2 : ℝ) : ℂ)⁻¹) • zL (n+1) 0 : L2G (n+1)) x)
    rw [hx]
    simp only [Pi.smul_apply, hz, smul_eq_mul]
  · have hT := T_ae (n := n) 0 r (Filter.EventuallyEq.rfl (f := fun y => r y))
    filter_upwards [hT] with x hx
    change r (split2 x).1 = _
    simpa only [tensorFn, fibreB, Matrix.cons_val_zero, mul_one] using hx.symm

/-- In a frame aligned to the visible projection, the physical remote test has no
independence or sign-symmetry hypothesis. -/
theorem remote_frame_phase_support {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hframe : (H10 (n+1)).starProjection (hOf (n+1) f g) = (tOf (n+1) f g : ℂ) • zeta0 n) (ℓ : ℝ) :
    ℓ * tOf (n+1) f g + ‖(remoteCubic n).starProjection (QkOf (n+1) f g)‖^2 ≤
      ∫ x, ‖(ℓ : ℂ)*zeta0 n x + (remoteCubic n).starProjection (QkOf (n+1) f g) x‖
        ∂(stdGaussian ((n+1)+(n+1))) := by
  have hz := (H10 (n+1)).starProjection_inner_eq_zero (hOf (n+1) f g) (zeta0 n) zeta0_mem
  rw [inner_sub_left, hframe, inner_smul_left, Complex.conj_ofReal, inner_self_eq_one_of_norm_eq_one (𝕜 := ℂ) norm_zeta0,
    mul_one, sub_eq_zero] at hz
  simpa only [hz, Complex.ofReal_re] using independent_cubic_subprojection_support hf hg
    (remoteCubic n) (remoteCubic_le n) (zeta0 n) zeta0_mem
    (indep_visible_remoteCubic ((remoteCubic n).starProjection_apply_mem _)) ℓ

/-- Every physical pair admits a single unitary frame in which the remote test works
simultaneously for every real direction. This also includes zero visible amplitude. -/
theorem exists_remote_frame_phase_support {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    ∃ W : EuclideanSpace ℂ (Fin (n+1)) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin (n+1)),
      ∀ ℓ : ℝ, let R := (remoteCubic n).starProjection (QkOf (n+1) (Cop W f) (Cop W g))
      ℓ * tOf (n+1) f g + ‖R‖^2 ≤
        ∫ x, ‖(ℓ : ℂ)*zeta0 n x + R x‖ ∂(stdGaussian ((n+1)+(n+1))) := by
  obtain ⟨ζ, hζ, hζ₁, hP⟩ := exists_frame_vector (n+1) (Nat.succ_pos n) (hOf (n+1) f g)
  obtain ⟨W, hW⟩ := exists_Cop_eq (Nat.succ_pos n) hζ hζ₁
  have hframe : (H10 (n+1)).starProjection (hOf (n+1) (Cop W f) (Cop W g)) =
      (tOf (n+1) (Cop W f) (Cop W g) : ℂ) • zeta0 n := by
    rw [hOf_Cop, P_Cop, hP, map_smul, hW, tOf_Cop]
    rfl
  refine ⟨W, fun ℓ => ?_⟩
  simpa only [tOf_Cop] using
    (remote_frame_phase_support (Cop_unimod W hf) (Cop_unimod W hg) hframe ℓ)

/-- A finite diffuse coupling is a property only of the joint law of the visible and
remote tests. On the new Gaussian space, the copy of the visible test can depend on
the diffuse cubic. The two cubics are orthogonal and the remote component is preserved
in the joint law. -/
def HasDiffuseCubicCouplings {n : ℕ} (z R : L2G n) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ (d : ℕ) (U V Z : L2G d), U ∈ H21 d ∧ V ∈ H21 d ∧
    ‖U‖ = ‖R‖ ∧ ‖V‖ = 1 ∧ inner ℂ V U = 0 ∧ ‖Z - V‖ ≤ ε ∧
    IdentDistrib (fun x => (z x, R x)) (fun x => (Z x, U x))
      (stdGaussian (n+n)) (stdGaussian (d+d))

private theorem integral_norm_le_norm {n : ℕ} (w : L2G n) :
    ∫ x, ‖w x‖ ∂(stdGaussian (n+n)) ≤ ‖w‖ := by
  have h := variance_nonneg (fun x => ‖w x‖) (stdGaussian (n+n))
  rw [variance_eq_sub (Lp.memLp w).norm] at h
  change 0 ≤ (∫ x, ‖w x‖^2 ∂(stdGaussian (n+n))) - (∫ x, ‖w x‖ ∂(stdGaussian (n+n)))^2 at h
  rw [← norm_sq_eq_integral] at h
  have hi : 0 ≤ ∫ x, ‖w x‖ ∂(stdGaussian (n+n)) := integral_nonneg fun x => norm_nonneg _
  nlinarith only [h, norm_nonneg w, hi]

private theorem coupled_integral_le {d : ℕ} (U V Z : L2G d) (ℓ : ℝ) (hℓ : 0 ≤ ℓ) :
    (∫ x, ‖(ℓ : ℂ) * Z x + U x‖ ∂(stdGaussian (d+d))) ≤
      (∫ x, ‖(((ℓ:ℂ) • V + U : L2G d) x)‖ ∂(stdGaussian (d+d))) + ℓ * ‖Z - V‖ := by
  let Y : L2G d := (ℓ:ℂ) • V + U
  let B : L2G d := (ℓ:ℂ) • (Z - V)
  have hB : ‖B‖ = ℓ * ‖Z-V‖ := by
    simp only [B, norm_smul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hℓ]
  change _ ≤ (∫ x, ‖Y x‖ ∂(stdGaussian (d+d))) + ℓ * ‖Z - V‖
  rw [← hB]
  refine le_trans ?_ (add_le_add (le_refl _) (integral_norm_le_norm B))
  rw [← integral_add ((Lp.memLp Y).integrable one_le_two).norm ((Lp.memLp B).integrable one_le_two).norm]
  apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
    (((Lp.memLp Y).integrable one_le_two).norm.add ((Lp.memLp B).integrable one_le_two).norm)
  filter_upwards [Lp.coeFn_add ((ℓ:ℂ) • V) U, Lp.coeFn_smul (ℓ:ℂ) V,
    Lp.coeFn_smul (ℓ:ℂ) (Z-V), Lp.coeFn_sub Z V] with x hy hv hb hz
  change _ ≤ ‖((ℓ:ℂ) • V + U : L2G d) x‖ + ‖((ℓ:ℂ) • (Z-V) : L2G d) x‖
  rw [hy, hb]
  simp only [Pi.add_apply, Pi.smul_apply, hv, hz, Pi.sub_apply, smul_eq_mul]
  calc ‖(ℓ:ℂ) * Z x + U x‖ = ‖((ℓ:ℂ)*V x + U x) + (ℓ:ℂ)*(Z x - V x)‖ := by congr 1; ring
    _ ≤ _ := norm_add_le _ _

/-- A law-preserving diffuse coupling carries a directional first-moment test into
the finite cubic support interface. -/
theorem cubic_lift_of_diffuse_couplings {n : ℕ} {z R : L2G n} {t : ℝ}
    (hc : HasDiffuseCubicCouplings z R)
    (hs : ∀ ℓ : ℝ, 0 ≤ ℓ → ℓ*t + ‖R‖^2 ≤ ∫ x, ‖(ℓ : ℂ)*z x + R x‖ ∂(stdGaussian (n+n))) :
    HasCubicSupportLift t ‖R‖ := by
  intro ℓ hℓ δ hδ
  have hden : 0 < ℓ + 1 := by linarith only [hℓ]
  obtain ⟨d,U,V,Z,hU,hV,hUn,hVn,horth,herr,hlaw⟩ := hc (δ / (ℓ+1)) (div_pos hδ hden)
  refine ⟨d, U, V, hU, hV, hUn, hVn, horth, ?_⟩
  have hm : Measurable (fun p : ℂ × ℂ => ‖(ℓ : ℂ) * p.1 + p.2‖) := by fun_prop
  have law := (hlaw.comp hm).integral_eq
  have hpair := hs ℓ hℓ
  change (∫ x, ‖(ℓ : ℂ) * z x + R x‖
    ∂(stdGaussian (n+n))) = ∫ x, ‖(ℓ : ℂ) * Z x + U x‖ ∂(stdGaussian (d+d)) at law
  rw [law] at hpair
  have e₁ := (le_div_iff₀ hden).mp herr
  have e₂ := norm_nonneg (Z - V)
  nlinarith only [hpair, coupled_integral_le U V Z ℓ hℓ, e₁, e₂]

/-- A diffuse coupling upgrades the exact physical remote support to the finite cubic
lift. The phase-pair support and linear Gaussian symmetry have no remaining hypotheses
beyond unimodularity, the actual subprojection, and independence of the two tests. -/
theorem remote_cubic_lift_of_couplings {n : ℕ} {f g : L2G n}
    (hf : f ∈ Unimod (stdGaussian (n+n))) (hg : g ∈ Unimod (stdGaussian (n+n)))
    (W : Submodule ℂ (L2G n)) [W.HasOrthogonalProjection] (hW : W ≤ H21 n)
    (hind : IndepFun (fun x => visibleDirection n f g x)
      (fun x => W.starProjection (QkOf n f g) x) (stdGaussian (n+n)))
    (hc : HasDiffuseCubicCouplings (visibleDirection n f g) (W.starProjection (QkOf n f g))) :
    HasCubicSupportLift (tOf n f g) ‖W.starProjection (QkOf n f g)‖ := by
  exact cubic_lift_of_diffuse_couplings hc fun ℓ _ => independent_remote_phase_support hf hg W hW hind ℓ

/-- For the full remote cubic projection, only the construction of the finite diffuse
coupling remains in the aligned frame. No physical support or independence is assumed. -/
theorem remote_frame_cubic_lift {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hframe : (H10 (n+1)).starProjection (hOf (n+1) f g) = (tOf (n+1) f g : ℂ) • zeta0 n)
    (hc : HasDiffuseCubicCouplings (zeta0 n) ((remoteCubic n).starProjection (QkOf (n+1) f g))) :
    HasCubicSupportLift (tOf (n+1) f g) ‖(remoteCubic n).starProjection (QkOf (n+1) f g)‖ :=
  cubic_lift_of_diffuse_couplings hc fun ℓ _ => remote_frame_phase_support hf hg hframe ℓ

end

end Grothe.LowerAnalytic
