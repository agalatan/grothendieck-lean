import QuinticResearch.GaussianBlockEmbedding
import QuinticResearch.QuinticDiffuseCarrier
import QuinticResearch.QuinticRemoteSupport

/-!
# The physical remote cubic lift

Three disjoint coordinate blocks realize the normalized triple product in finite
charge-one cubic chaos. A fourth block carries the prescribed remote cubic without
changing its law. This proves the remote support lift for every original phase pair.

Agent-ID: codex-a7c4
-/

namespace Grothe.LowerAnalytic

open MeasureTheory ProbabilityTheory Grothe.Lower
open scoped ComplexConjugate

noncomputable section

def gaussianBathCoordinates (N : ℕ) (y : Fin ((N+N)+(N+N)) → ℝ) (i : Fin N) : ℂ × ℂ :=
  (properCoords (N+N) y (Fin.castAdd N i), properCoords (N+N) y (Fin.natAdd N i))

theorem measurePreserving_gaussianBathCoordinates (N : ℕ) :
    MeasurePreserving (gaussianBathCoordinates N) (stdGaussian ((N+N)+(N+N))) (diffuseBath N) :=
  (measurePreserving_arrowProdEquivProdArrow ℂ ℂ (Fin N) (fun _ => gaussC) (fun _ => gaussC)).symm.comp
    ((measurePreserving_splitFinBlock N N gaussC).comp (measurePreserving_properCoords (N+N)))

abbrev carrierDim (N : ℕ) := (N+N)+N

def gaussianTripleCoordinates (N : ℕ) (x : Fin (carrierDim N + carrierDim N) → ℝ) :
    (Fin N → ℂ × ℂ) × (Fin (N+N) → ℝ) :=
  (gaussianBathCoordinates N (gaussianBlockSplit (N+N) N x).1, (gaussianBlockSplit (N+N) N x).2)

theorem measurePreserving_gaussianTripleCoordinates (N : ℕ) :
    MeasurePreserving (gaussianTripleCoordinates N) (stdGaussian (carrierDim N + carrierDim N))
      ((diffuseBath N).prod (stdGaussian (N+N))) :=
  ((measurePreserving_gaussianBathCoordinates N).prod (MeasurePreserving.id _)).comp
    (measurePreserving_gaussianBlockSplit (N+N) N)

private def ix {N : ℕ} (i : Fin N) : Fin (carrierDim N) := Fin.natAdd (N+N) i
private def iy {N : ℕ} (i : Fin N) : Fin (carrierDim N) := Fin.castAdd N (Fin.castAdd N i)
private def iw {N : ℕ} (i : Fin N) : Fin (carrierDim N) := Fin.castAdd N (Fin.natAdd N i)

private def tripleFactor (N : ℕ) : ℂ := (((√(2*(N:ℝ)))⁻¹ : ℝ) : ℂ) * (((√2:ℝ):ℂ)⁻¹)^2

/-- A genuine finite Wick cubic in the repository's Hilbert space. Its three indices
come from disjoint coordinate blocks in each summand. -/
def finiteDiffuseCubic (N : ℕ) : L2G (carrierDim N) :=
  ∑ i : Fin N, tripleFactor N • wickL (carrierDim N) (ix i) (iy i) (iw i)

theorem finiteDiffuseCubic_mem (N : ℕ) : finiteDiffuseCubic N ∈ H21 (carrierDim N) :=
  (H21 _).sum_mem fun i _ => (H21 _).smul_mem _ (wickL_mem_H21 _ (ix i) (iy i) (iw i))

theorem finiteDiffuseCubic_ae (n : ℕ) :
    ⇑(finiteDiffuseCubic (n+1)) =ᵐ[stdGaussian (carrierDim (n+1) + carrierDim (n+1))]
      fun x => diffuseTriple (gaussianTripleCoordinates (n+1) x) := by
  let N := n+1
  have hterm (i : Fin N) : ⇑(tripleFactor N • wickL (carrierDim N) (ix i) (iy i) (iw i)) =ᵐ[_]
      fun x => tripleFactor N * wickFn (carrierDim N) (ix i) (iy i) (iw i) x :=
    (Lp.coeFn_smul (tripleFactor N) _).trans ((wickL_ae' _ _ _ _).const_smul (tripleFactor N))
  filter_upwards [coeFn_finset_sum (carrierDim N) Finset.univ
    (fun i : Fin N => tripleFactor N • wickL (carrierDim N) (ix i) (iy i) (iw i)),
    ae_all_iff.mpr hterm] with x hsum he
  change (∑ i : Fin N, tripleFactor N • wickL (carrierDim N) (ix i) (iy i) (iw i) : L2G _) x = _
  rw [hsum]
  unfold diffuseTriple linC
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [he i]
  have h₁ : ix i ≠ iw i := by intro h; have heq := congrArg Fin.val h; simp [ix, iw] at heq; omega
  have h₂ : iy i ≠ iw i := by intro h; have heq := congrArg Fin.val h; simp [iy, iw] at heq
  simp only [wickFn, wc, h₁, h₂, ↓reduceIte, zero_mul, sub_zero]
  simp only [gaussianTripleCoordinates,
    diffuseCoeff, gaussianBathCoordinates, properCoords_eq, zc_gaussianBlockSplit_snd, zc_gaussianBlockSplit_fst,
    div_eq_mul_inv, map_mul, map_inv₀, Complex.conj_ofReal, ix, iy, iw, tripleFactor, N]
  ring

theorem hasLaw_finiteDiffuseCopy (n : ℕ) :
    HasLaw (fun x => diffuseCopy (gaussianTripleCoordinates (n+1) x)) gaussC
      (stdGaussian (carrierDim (n+1) + carrierDim (n+1))) :=
  ((measurePreserving_snd.comp (measurePreserving_diffuseCopy n)).comp
    (measurePreserving_gaussianTripleCoordinates (n+1))).hasLaw

private theorem gaussC_memLp_two : MemLp (fun z : ℂ => z) 2 gaussC := by
  apply (memLp_two_iff_integrable_sq_norm measurable_id.aestronglyMeasurable).mpr
  simpa only [id_eq, Complex.sq_norm, pow_one] using integrable_normSq_pow 1 (by norm_num)

def finiteDiffuseCopy (n : ℕ) : L2G (carrierDim (n+1)) :=
  ((hasLaw_finiteDiffuseCopy n).memLp gaussC_memLp_two).toLp _

theorem finiteDiffuseCopy_ae (n : ℕ) :
    ⇑(finiteDiffuseCopy n) =ᵐ[stdGaussian (carrierDim (n+1)+carrierDim (n+1))] fun x => diffuseCopy (gaussianTripleCoordinates (n+1) x) :=
  MemLp.coeFn_toLp _

theorem norm_finiteDiffuseCubic (n : ℕ) : ‖finiteDiffuseCubic (n+1)‖ = 1 := by
  have hi := (measurePreserving_gaussianTripleCoordinates (n+1)).hasLaw.integral_comp
    ((measurable_diffuseTriple n).norm.pow_const 2).aestronglyMeasurable
  have hx : ‖finiteDiffuseCubic (n+1)‖^2 = 1 := by
    rw [norm_sq_eq_integral]
    refine (integral_congr_ae ?_).trans (hi.trans (diffuseTriple_second n))
    filter_upwards [finiteDiffuseCubic_ae n] with x hx
    rw [hx]; rfl
  nlinarith only [hx, norm_nonneg (finiteDiffuseCubic (n+1))]

theorem integral_finiteDiffuseCubic (n : ℕ) :
    (∫ x, finiteDiffuseCubic (n+1) x ∂(stdGaussian (carrierDim (n+1)+carrierDim (n+1)))) = 0 :=
  (integral_congr_ae (finiteDiffuseCubic_ae n)).trans
    (((measurePreserving_gaussianTripleCoordinates (n+1)).hasLaw.integral_comp
      (measurable_diffuseTriple n).aestronglyMeasurable).trans (diffuseTriple_mean n))

theorem norm_sub_finiteDiffuseCubic_sq (n : ℕ) :
    ‖finiteDiffuseCopy n - finiteDiffuseCubic (n+1)‖^2 ≤ (3:ℝ)/(n+1) := by
  have hi := (measurePreserving_gaussianTripleCoordinates (n+1)).hasLaw.integral_comp
    (((measurable_diffuseTriple n).sub (measurable_diffuseCopy n)).norm.pow_const 2).aestronglyMeasurable
  rw [norm_sq_eq_integral]
  refine le_of_eq_of_le (integral_congr_ae ?_) (hi.trans_le (diffuseTriple_gaussian_mse n))
  filter_upwards [Lp.coeFn_sub (finiteDiffuseCopy n) (finiteDiffuseCubic (n+1)),
    finiteDiffuseCopy_ae n, finiteDiffuseCubic_ae n] with x hx hz hv
  rw [hx]
  simp only [Pi.sub_apply, hz, hv]
  exact congrArg (· ^ 2) (norm_sub_rev _ _)

/-- Every unit standard complex Gaussian independent of an actual cubic has finite
orthogonal cubic couplings at arbitrarily small L² cost. Both cubics live in the
repository's single finite-dimensional Gaussian model. -/
theorem diffuseCouplings_of_independent_complexGaussian {m : ℕ} {z R : L2G m}
    (hz : HasLaw (fun x => z x) gaussC (stdGaussian (m+m))) (hR : R ∈ H21 m)
    (hind : IndepFun (fun x => z x) (fun x => R x) (stdGaussian (m+m))) :
    HasDiffuseCubicCouplings z R := by
  intro ε hε
  obtain ⟨n, hn⟩ := exists_nat_gt (3 / ε^2)
  have hpos : 0 < ε^2 := sq_pos_of_pos hε
  have hn₁ := (div_lt_iff₀ hpos).mp hn
  have hn₂ : (3:ℝ)/(n+1) ≤ ε^2 := (div_le_iff₀ (by positivity)).mpr (by nlinarith only [hn₁, hpos])
  let a := carrierDim (n+1)
  let C := finiteDiffuseCubic (n+1)
  let G := finiteDiffuseCopy n
  let U : L2G (a+m) := blockRight R
  let V : L2G (a+m) := blockLeft C
  let Z : L2G (a+m) := blockLeft G
  have hCG : ‖G-C‖ ≤ ε := by
    nlinarith only [(norm_sub_finiteDiffuseCubic_sq n).trans hn₂, hε, norm_nonneg (G-C)]
  refine ⟨a+m, U, V, Z, blockRight_mem_H21 hR, blockLeft_mem_H21 (finiteDiffuseCubic_mem _),
    (blockRight (a := a)).norm_map _, ((blockLeft (b := m)).norm_map _).trans (norm_finiteDiffuseCubic n), ?_, ?_, ?_⟩
  · change inner ℂ (blockLeft C) (blockRight R) = 0
    rw [inner_blockLeft_blockRight, integral_finiteDiffuseCubic, map_zero, zero_mul]
  · change ‖blockLeft (b := m) G - blockLeft (b := m) C‖ ≤ ε
    rw [← map_sub, LinearIsometry.norm_map]
    exact hCG
  · have mp := measurePreserving_gaussianBlockSplit a m
    have hG : HasLaw (fun x => G x) gaussC (stdGaussian (a+a)) :=
      (hasLaw_finiteDiffuseCopy n).congr (finiteDiffuseCopy_ae n)
    have hZ : HasLaw (fun x => Z x) gaussC (stdGaussian ((a+m)+(a+m))) :=
      (hG.comp (measurePreserving_fst.comp mp).hasLaw).congr (blockLeft_ae G)
    have hρ : HasLaw (fun x => R x) ((stdGaussian (m+m)).map fun x => R x) (stdGaussian (m+m)) :=
      ⟨(Lp.aestronglyMeasurable R).aemeasurable, rfl⟩
    have hU : HasLaw (fun x => U x) ((stdGaussian (m+m)).map fun x => R x) (stdGaussian ((a+m)+(a+m))) :=
      (hρ.comp (measurePreserving_snd.comp mp).hasLaw).congr (blockRight_ae R)
    exact (hz.identDistrib hZ).prodMk (hρ.identDistrib hU) hind (indep_blockLeft_blockRight G R)

/-- For a genuine frame-aligned phase pair the full remote cubic lift is unconditional,
including at zero amplitude. -/
theorem remote_frame_cubic_lift_unconditional {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hframe : (H10 (n+1)).starProjection (hOf (n+1) f g) = (tOf (n+1) f g : ℂ) • zeta0 n) :
    HasCubicSupportLift (tOf (n+1) f g) ‖(remoteCubic n).starProjection (QkOf (n+1) f g)‖ := by
  apply remote_frame_cubic_lift hf hg hframe
  exact diffuseCouplings_of_independent_complexGaussian (hasLaw_unit_H10 _ zeta0_mem norm_zeta0)
    (remoteCubic_le n ((remoteCubic n).starProjection_apply_mem _))
    (indep_visible_remoteCubic ((remoteCubic n).starProjection_apply_mem _))

/-- For every physical phase pair, some frame prices the nonremote cubic energy at
every dimension-free cubic radius. The finite remote lift is supplied internally. -/
theorem exists_nonremote_energy_of_cubic_radius {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    ∃ W : EuclideanSpace ℂ (Fin (n+1)) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin (n+1)),
      ∀ (r : ℝ), 0 ≤ r → CubicFirstMomentRadius r →
        max 0 (‖QkOf (n+1) f g‖^2 + tOf (n+1) f g ^ 2 - r^2) ≤
          ‖(remoteCubic n)ᗮ.starProjection (QkOf (n+1) (Cop W f) (Cop W g))‖ ^ 2 := by
  obtain ⟨ζ, hζ, hζ₁, hP⟩ := exists_frame_vector (n+1) (Nat.succ_pos n) (hOf (n+1) f g)
  obtain ⟨W, hW⟩ := exists_Cop_eq (Nat.succ_pos n) hζ hζ₁
  have hframe : (H10 (n+1)).starProjection (hOf (n+1) (Cop W f) (Cop W g)) =
      (tOf (n+1) (Cop W f) (Cop W g) : ℂ) • zeta0 n := by
    rw [hOf_Cop, P_Cop, hP, map_smul, hW, tOf_Cop]
    rfl
  have hlift := remote_frame_cubic_lift_unconditional (Cop_unimod W hf) (Cop_unimod W hg) hframe
  refine ⟨W, fun r hr₀ hr => ?_⟩
  have h := nonremote_energy_of_cubic_support (remoteCubic n) hlift hr₀ hr
  have hn : ‖QkOf (n+1) (Cop W f) (Cop W g)‖ = ‖QkOf (n+1) f g‖ := by
    rw [QkOf, kOf_Cop, Q_Cop, LinearIsometry.norm_map]; rfl
  simpa only [hn, tOf_Cop] using h

/-- The existing kernel-checked radius 0.93 gives an unconditional nonremote lower
energy estimate on every physical phase pair. -/
theorem exists_nonremote_energy_93 {n : ℕ} {f g : L2G (n+1)}
    (hf : f ∈ Unimod (stdGaussian ((n+1)+(n+1))))
    (hg : g ∈ Unimod (stdGaussian ((n+1)+(n+1)))) :
    ∃ W : EuclideanSpace ℂ (Fin (n+1)) ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin (n+1)),
      max 0 (‖QkOf (n+1) f g‖^2 + tOf (n+1) f g^2 - (93/100 : ℝ)^2) ≤
        ‖(remoteCubic n)ᗮ.starProjection (QkOf (n+1) (Cop W f) (Cop W g))‖ ^ 2 := by
  obtain ⟨W, hW⟩ := exists_nonremote_energy_of_cubic_radius hf hg
  exact ⟨W, hW _ (by norm_num) cubicFirstMomentRadius_93⟩

end

end Grothe.LowerAnalytic
