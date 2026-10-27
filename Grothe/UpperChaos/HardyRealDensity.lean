import Grothe.UpperChaos.HardyRealSubst
import Grothe.UpperChaos.HardyHolo

/-!
# The density of `(U, RU + SW)` is `kHol R` (Hardy step 1(b))

For a real symmetric `R = [[a, b], [b, c]]` with `K = I − R² ≻ 0`, its lower-triangular Cholesky factor `S`, and
independent standard complex pairs `U, W` (`mu2`), every bounded measurable `f` satisfies

    E f(U, RU + SW) = ∫_{ℝ⁸} f(toC2 x ξ, toC2 y η) · kHol R x ξ y η             (`integral_pair_eq_kHol`)

`R` and `S` act on `ℂ²` by real matrices. In the coordinates of `HholPair`, `kHol R` is the product of the
standard densities of `(x, ξ)` and of `S⁻¹((y, η) − R(x, ξ))`, divided by `det S² = det K` (`kHol_real`); the
substitution `(y, η) = R(x, ξ) + S(ω, ζ)` (`integral_subst4`) and Fubini give the identity.
-/

open MeasureTheory Complex

namespace Grothe.UpperChaos.HardyReal

noncomputable section

/-- Pairs of real 2-vectors: the coordinates `(x, ξ)` of one point of `ℂ²`. -/
abbrev Pt4 := (ℝ × ℝ) × (ℝ × ℝ)

/-- The standard density on `ℝ⁴`. -/
def psi (q : Pt4) : ℝ := phi2 q.1 * phi2 q.2

lemma psi_nonneg (q : Pt4) : 0 ≤ psi q := mul_nonneg (phi2_nonneg _) (phi2_nonneg _)

@[fun_prop] lemma measurable_psi : Measurable psi := by unfold psi; fun_prop

instance : (volume : Measure Pt4).IsAddHaarMeasure := by
  rw [Measure.volume_eq_prod]; infer_instance

variable {a b c : ℝ}

/-- `S` and `R` on both real copies, and `S⁻¹`. -/
def mulS4 (a b c : ℝ) (r : Pt4) : Pt4 := (mulS a b c r.1, mulS a b c r.2)
def mulR4 (a b c : ℝ) (p : Pt4) : Pt4 := (mulR a b c p.1, mulR a b c p.2)
def solve4 (a b c : ℝ) (s : Pt4) : Pt4 := (solveS a b c s.1, solveS a b c s.2)

@[fun_prop] lemma measurable_solve4 : Measurable (solve4 a b c) := by
  unfold solve4; exact (measurable_solveS.comp measurable_fst).prodMk (measurable_solveS.comp measurable_snd)

@[fun_prop] lemma measurable_mulR4 : Measurable (mulR4 a b c) := by
  unfold mulR4; exact (measurable_mulR.comp measurable_fst).prodMk (measurable_mulR.comp measurable_snd)

/-- `S ⊕ S` as a linear map of `ℝ⁴`. -/
def linS4 (a b c : ℝ) : Pt4 →ₗ[ℝ] Pt4 := (linS a b c).prodMap (linS a b c)

lemma det_linS4 : LinearMap.det (linS4 a b c) = (s11 a b * s22 a b c) ^ 2 := by
  rw [linS4, LinearMap.det_prodMap, det_linS, sq]

/-- **The substitution on both copies**: `(y, η) = R(x, ξ) + S(ω, ζ)`. -/
theorem integral_subst4 (h : 0 < k11 a b) (hd : 0 < kdet a b c) (p : Pt4) {g : Pt4 → ℂ} (hg : Measurable g) :
    ∫ r : Pt4, (psi r : ℂ) * g (mulR4 a b c p + mulS4 a b c r) =
      (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) * ∫ s : Pt4, (psi (solve4 a b c (s - mulR4 a b c p)) : ℂ) * g s := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  have hdet : LinearMap.det (linS4 a b c) ≠ 0 := by rw [det_linS4]; exact hpos.ne'
  set G : Pt4 → ℂ := fun v => (psi (solve4 a b c v) : ℂ) * g (mulR4 a b c p + v) with hG
  have e1 : (fun r => (psi r : ℂ) * g (mulR4 a b c p + mulS4 a b c r)) = fun r => G (linS4 a b c r) := by
    ext r
    simp only [hG, linS4, LinearMap.prodMap_apply, linS, LinearMap.coe_mk, AddHom.coe_mk, solve4,
      solveS_mulS h hd, mulS4]
  have hmap := Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Pt4) hdet
  have e2 : ∫ r, G (linS4 a b c r) = (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) * ∫ v, G v := by
    have hm : Measurable (linS4 a b c) := (linS4 a b c).continuous_of_finiteDimensional.measurable
    have hGm : AEStronglyMeasurable G (Measure.map (linS4 a b c) volume) :=
      ((measurable_psi.comp measurable_solve4).complex_ofReal.mul
        (hg.comp (measurable_const_add _))).aestronglyMeasurable
    rw [← integral_map hm.aemeasurable hGm, hmap, integral_smul_measure, det_linS4,
      ENNReal.toReal_ofReal (abs_nonneg _), abs_of_pos (inv_pos.2 hpos), Complex.real_smul]
  rw [e1, e2]
  congr 1
  rw [← integral_add_right_eq_self (μ := volume)
    (fun s => (psi (solve4 a b c (s - mulR4 a b c p)) : ℂ) * g s) (mulR4 a b c p)]
  congr 1; ext v; rw [add_sub_cancel_right, add_comm v (mulR4 a b c p)]

/-- `∫ ψ = 1`. -/
lemma integral_psi : ∫ q : Pt4, (psi q : ℂ) = 1 := by
  have h := integral_mu2_eq (g := fun _ => (1 : ℂ)) aestronglyMeasurable_const
  simp only [integral_const, probReal_univ, one_smul, mul_one] at h
  simpa [psi] using h.symm

/-- `R` and `S` act on `ℂ²` by their real matrices. -/
def mulRc (a b c : ℝ) (u : ℂ × ℂ) : ℂ × ℂ := ((a : ℂ) * u.1 + b * u.2, (b : ℂ) * u.1 + c * u.2)
def mulSc (a b c : ℝ) (w : ℂ × ℂ) : ℂ × ℂ :=
  ((s11 a b : ℂ) * w.1, (s21 a b c : ℂ) * w.1 + (s22 a b c : ℂ) * w.2)

lemma toC2_affine (p r : Pt4) :
    mulRc a b c (toC2 p.1 p.2) + mulSc a b c (toC2 r.1 r.2) =
      toC2 (mulR4 a b c p + mulS4 a b c r).1 (mulR4 a b c p + mulS4 a b c r).2 := by
  simp only [toC2, mulRc, mulSc, mulR4, mulS4, mulR, mulS, Prod.mk_add_mk]
  ext <;> push_cast <;> ring

lemma phi2_eq (u : ℝ × ℝ) : phi2 u = (2 * Real.pi)⁻¹ * Real.exp (-(u.1 ^ 2 + u.2 ^ 2) / 2) :=
  Grothe.LowerAnalytic.gaussianPDFReal_mul u.1 u.2

/-- **`kHol` at a real cross covariance is the Gaussian density of `(x, ξ, y, η)`.** -/
theorem kHol_real (h : 0 < k11 a b) (hd : 0 < kdet a b c) (p s : Pt4) :
    kHol (Rre a b c) p.1 p.2 s.1 s.2 =
      ((psi p * psi (solve4 a b c (s - mulR4 a b c p)) / (s11 a b * s22 a b c) ^ 2 : ℝ) : ℂ) := by
  have key : ((2 * Real.pi) ^ 4)⁻¹ * (kdet a b c)⁻¹ *
      Real.exp (-(p.1.1 ^ 2 + p.1.2 ^ 2 + (solveS a b c (s.1 - mulR a b c p.1)).1 ^ 2
          + (solveS a b c (s.1 - mulR a b c p.1)).2 ^ 2) / 2
        + -(p.2.1 ^ 2 + p.2.2 ^ 2 + (solveS a b c (s.2 - mulR a b c p.2)).1 ^ 2
          + (solveS a b c (s.2 - mulR a b c p.2)).2 ^ 2) / 2) =
      psi p * psi (solve4 a b c (s - mulR4 a b c p)) / (s11 a b * s22 a b c) ^ 2 := by
    rw [detS_sq h hd]
    simp only [psi, phi2_eq, solve4, mulR4, Prod.fst_sub, Prod.snd_sub]
    rw [div_eq_mul_inv]
    have e : ∀ u v w z : ℝ, Real.exp u * Real.exp v * (Real.exp w * Real.exp z) = Real.exp (u + v + (w + z)) := by
      intro u v w z; rw [Real.exp_add, Real.exp_add, Real.exp_add]
    calc _ = ((2 * Real.pi) ^ 4)⁻¹ * (kdet a b c)⁻¹ * Real.exp (-(p.1.1 ^ 2 + p.1.2 ^ 2) / 2
            + -(p.2.1 ^ 2 + p.2.2 ^ 2) / 2 + (-((solveS a b c (s.1 - mulR a b c p.1)).1 ^ 2
            + (solveS a b c (s.1 - mulR a b c p.1)).2 ^ 2) / 2 + -((solveS a b c (s.2 - mulR a b c p.2)).1 ^ 2
            + (solveS a b c (s.2 - mulR a b c p.2)).2 ^ 2) / 2)) := by congr 2; ring
      _ = _ := by rw [← e]; ring
  rw [kHol, detIm_real, kExp_real h hd, kExp_real h hd, ← key]
  push_cast
  ring

lemma integrable_phi2 : Integrable phi2 := by
  have h := (integrable_gaussianPDFReal 0 1).mul_prod (integrable_gaussianPDFReal 0 1)
  rw [← Measure.volume_eq_prod] at h
  exact h

lemma integrable_psi : Integrable psi := by
  have h := integrable_phi2.mul_prod integrable_phi2
  rw [← Measure.volume_eq_prod] at h
  exact h

lemma solve4_linS4 (h : 0 < k11 a b) (hd : 0 < kdet a b c) (r : Pt4) : solve4 a b c (linS4 a b c r) = r := by
  simp only [linS4, LinearMap.prodMap_apply, linS, LinearMap.coe_mk, AddHom.coe_mk, solve4, solveS_mulS h hd]

/-- `v ↦ ψ(S⁻¹ v)` is integrable (a linear image of the standard density). -/
lemma integrable_psi_solve4 (h : 0 < k11 a b) (hd : 0 < kdet a b c) :
    Integrable fun v => psi (solve4 a b c v) := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  have hdet : LinearMap.det (linS4 a b c) ≠ 0 := by rw [det_linS4]; exact hpos.ne'
  have hm : Measurable (linS4 a b c) := (linS4 a b c).continuous_of_finiteDimensional.measurable
  have h1 : Integrable (fun r => psi (solve4 a b c (linS4 a b c r))) := by
    simpa only [solve4_linS4 h hd] using integrable_psi
  have h2 : Integrable (fun v => psi (solve4 a b c v)) (Measure.map (linS4 a b c) volume) :=
    (integrable_map_measure (measurable_psi.comp measurable_solve4).aestronglyMeasurable
      hm.aemeasurable).2 h1
  rw [Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Pt4) hdet] at h2
  have hκ : ENNReal.ofReal |(LinearMap.det (linS4 a b c))⁻¹| ≠ 0 := by
    rw [ne_eq, ENNReal.ofReal_eq_zero, not_le]; exact abs_pos.2 (inv_ne_zero hdet)
  have := h2.smul_measure (c := (ENNReal.ofReal |(LinearMap.det (linS4 a b c))⁻¹|)⁻¹) (ENNReal.inv_ne_top.2 hκ)
  rwa [smul_smul, ENNReal.inv_mul_cancel hκ ENNReal.ofReal_ne_top, one_smul] at this

/-- `∫ ψ(S⁻¹(s − R p)) ds = det S² = det K`. -/
lemma integral_psi_solve4 (h : 0 < k11 a b) (hd : 0 < kdet a b c) (p : Pt4) :
    ∫ s : Pt4, psi (solve4 a b c (s - mulR4 a b c p)) = (s11 a b * s22 a b c) ^ 2 := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  have e := integral_subst4 h hd p (g := fun _ => (1 : ℂ)) measurable_const
  simp only [mul_one, integral_psi] at e
  have e' : ((∫ s : Pt4, psi (solve4 a b c (s - mulR4 a b c p)) : ℝ) : ℂ) = (((s11 a b * s22 a b c) ^ 2 : ℝ) : ℂ) := by
    rw [← integral_complex_ofReal]
    have hk : (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) ≠ 0 := inv_ne_zero hpos.ne'
    have hk' : ((((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hk
    field_simp at e
    push_cast at e ⊢
    linear_combination -e
  exact_mod_cast e'

/-- The density `D(p, s) = ψ(p) ψ(S⁻¹(s − Rp)) / det S²` on `ℝ⁸`. -/
def dens (a b c : ℝ) (q : Pt4 × Pt4) : ℝ :=
  psi q.1 * psi (solve4 a b c (q.2 - mulR4 a b c q.1)) / (s11 a b * s22 a b c) ^ 2

lemma dens_nonneg (q : Pt4 × Pt4) : 0 ≤ dens a b c q :=
  div_nonneg (mul_nonneg (psi_nonneg _) (psi_nonneg _)) (sq_nonneg _)

@[fun_prop] lemma measurable_dens : Measurable (dens a b c) := by
  unfold dens
  exact ((measurable_psi.comp measurable_fst).mul (measurable_psi.comp (measurable_solve4.comp
    (measurable_snd.sub (measurable_mulR4.comp measurable_fst))))).div_const _

lemma integrable_dens (h : 0 < k11 a b) (hd : 0 < kdet a b c) :
    Integrable (dens a b c) ((volume : Measure Pt4).prod (volume : Measure Pt4)) := by
  have hpos : 0 < (s11 a b * s22 a b c) ^ 2 := pow_pos (mul_pos (s11_pos h) (s22_pos h hd)) 2
  rw [integrable_prod_iff measurable_dens.aestronglyMeasurable]
  refine ⟨Filter.Eventually.of_forall fun p => ?_, ?_⟩
  · have := ((integrable_psi_solve4 h hd).comp_sub_right (mulR4 a b c p)).const_mul
      (psi p / (s11 a b * s22 a b c) ^ 2)
    refine this.congr (Filter.Eventually.of_forall fun s => ?_)
    simp only [dens]; ring
  · refine integrable_psi.congr (Filter.Eventually.of_forall fun p => ?_)
    simp only [Real.norm_eq_abs, abs_of_nonneg (dens_nonneg _), dens]
    rw [show (fun s : Pt4 => psi p * psi (solve4 a b c (s - mulR4 a b c p)) / (s11 a b * s22 a b c) ^ 2)
        = fun s => psi p / (s11 a b * s22 a b c) ^ 2 * psi (solve4 a b c (s - mulR4 a b c p)) by
          ext s; ring,
      integral_const_mul, integral_psi_solve4 h hd p]
    field_simp

/-- **The law of `(U, RU + SW)` has density `kHol R` in the coordinates of `HholPair`.** -/
theorem integral_pair_eq_kHol (h : 0 < k11 a b) (hd : 0 < kdet a b c)
    {f : (ℂ × ℂ) × (ℂ × ℂ) → ℂ} (hf : Measurable f) {C : ℝ} (hC : ∀ z, ‖f z‖ ≤ C) :
    ∫ u, (∫ w, f (u, mulRc a b c u + mulSc a b c w) ∂mu2) ∂mu2 =
      ∫ q : Pt8, f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) * kHol (Rre a b c) q.1.1 q.1.2 q.2.1 q.2.2 := by
  have hRc : Measurable (mulRc a b c) := by unfold mulRc; fun_prop
  have hSc : Measurable (mulSc a b c) := by unfold mulSc; fun_prop
  have hF2 : Measurable fun z : (ℂ × ℂ) × (ℂ × ℂ) => f (z.1, mulRc a b c z.1 + mulSc a b c z.2) :=
    hf.comp (measurable_fst.prodMk ((hRc.comp measurable_fst).add (hSc.comp measurable_snd)))
  -- the inner integral, for `u = toC2 p`
  have inner : ∀ p : Pt4, ∫ w, f (toC2 p.1 p.2, mulRc a b c (toC2 p.1 p.2) + mulSc a b c w) ∂mu2 =
      (((s11 a b * s22 a b c) ^ 2)⁻¹ : ℝ) *
        ∫ s : Pt4, (psi (solve4 a b c (s - mulR4 a b c p)) : ℂ) * f (toC2 p.1 p.2, toC2 s.1 s.2) := by
    intro p
    rw [integral_mu2_eq ((hF2.comp (measurable_const.prodMk measurable_id)).aestronglyMeasurable)]
    simp only [Function.comp_def, toC2_affine]
    exact integral_subst4 h hd p (g := fun s => f (toC2 p.1 p.2, toC2 s.1 s.2))
      (hf.comp (measurable_const.prodMk (by unfold toC2; fun_prop)))
  have houter : AEStronglyMeasurable (fun u => ∫ w, f (u, mulRc a b c u + mulSc a b c w) ∂mu2) mu2 :=
    (hF2.stronglyMeasurable.integral_prod_right' (μ := mu2) (ν := mu2)).aestronglyMeasurable
  rw [integral_mu2_eq houter]
  -- the right side as an iterated integral of `dens · f`
  have hmeasF : Measurable fun q : Pt4 × Pt4 => f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) :=
    hf.comp (by unfold toC2; fun_prop)
  have hint : Integrable (fun q : Pt4 × Pt4 => (dens a b c q : ℂ) * f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2))
      ((volume : Measure Pt4).prod volume) := by
    refine ((integrable_dens h hd).mul_const C).mono'
      ((measurable_dens.complex_ofReal.mul hmeasF).aestronglyMeasurable)
      (Filter.Eventually.of_forall fun q => ?_)
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg (dens_nonneg q)]
    exact mul_le_mul_of_nonneg_left (hC _) (dens_nonneg q)
  have hR : ∫ q : Pt8, f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) * kHol (Rre a b c) q.1.1 q.1.2 q.2.1 q.2.2 =
      ∫ q : Pt4 × Pt4, (dens a b c q : ℂ) * f (toC2 q.1.1 q.1.2, toC2 q.2.1 q.2.2) ∂(volume.prod volume) := by
    rw [← Measure.volume_eq_prod]
    congr 1; ext q
    rw [kHol_real h hd q.1 q.2, dens, mul_comm]
  rw [hR, integral_prod _ hint]
  congr 1; ext p
  rw [inner p, ← mul_assoc, ← integral_const_mul]
  congr 1; ext s
  simp only [dens]; push_cast; ring

end

end Grothe.UpperChaos.HardyReal
