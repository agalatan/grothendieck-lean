import Grothe.UpperQuad.TwistPhase
import Grothe.UpperQuad.TwistDilate
import Grothe.UpperChaos.F0ConditionalReality
import Grothe.UpperChaos.F0ConditionalEvaluator
import Grothe.UpperChaos.ConditionalCoefficientReflection
import Grothe.UpperChaos.DampedMoments
import Grothe.UpperChaos.PhiBound

/-!
# The node functional and the twisted conditional coefficients

At a radial node `s ≥ 0` and for the power `j`, with `α = jε`, `λ = 1 + α`,

    K_s(p) = ∫ conj(p(w)) e^{−α|w|²} F₀(√s, w) dγ(w)                       (`Kfun j s`)
    J^{(j)}_{c,d}(s) = ∫ conj(h_{c,d}(w)) hpow j (√s, w) dγ(w)              (`twistCoef j s (c, d)`)

(`docs/UPPER_CLOSURE.md` §8.1).  This file proves

* (8.1) `twistCoef_eq_K`: `J^{(j)}_{c,d}(s) = (−1)^j e^{−αs} nrm_{c,d} K_s(Q_r^j H_{c,d})`, from the
  phase identity `hpow_node` and `conj Q = −Q`;
* (8.2) `Kfun_H`: `K_s(H_{e,f}) = λ⁻¹ nrm_{e,f}⁻¹ Σ_{g,h} T[e,f; g,h] σ^{g+h} U_{g,h}(A√λ)` (at a node
  with `vprof s ≠ 0`, `σ = profileSign s`, `A = profileShift s`, `U = canonicalCoefficient`), from the
  Gaussian tilt `integral_gaussC_tilt`, the dilation identity `hfun_dilate`, the rotation by `σ`
  and the scale invariance of the phase; `re_Kfun_H` is its real part in the kernel's index `m`;
* the reality of `J^{(j)}_{c,d}(s)` (`twistCoef_im`), from the conjugation symmetry of `gaussC`.

Agent-ID: claude-b9ee. Refs #41, #313.
-/

namespace Grothe.UpperQuad

open MeasureTheory GrotheQuad Grothe.UpperChaos Grothe.Upper Grothe.LowerAnalytic MvPolynomial Complex
open Grothe.UpperChaos.F0ConditionalEvaluator
open scoped ComplexConjugate

noncomputable section

/-! ### The functional -/

/-- The Gaussian exponent `λ_j = 1 + jε`. -/
def lamR (j : ℕ) : ℝ := 1 + j * (phaseEpsQ : ℝ)

lemma lamR_pos (j : ℕ) : 0 < lamR j := by
  unfold lamR; norm_num [phaseEpsQ]; positivity

lemma lamR_eq (j : ℕ) : lamR j = ((20 + 21 * j : ℕ) : ℤ) / ((20 : ℕ) : ℝ) := by
  unfold lamR; norm_num [phaseEpsQ]; ring_nf

/-- `e^{−jε|w|²} F₀(√s, w)`. -/
def nodeWeight (j : ℕ) (s : ℝ) (w : ℂ) : ℂ :=
  ((Real.exp (-(j * phaseEpsQ : ℝ) * ‖w‖ ^ 2) : ℝ) : ℂ) * F0 ((Real.sqrt s : ℂ), w)

lemma measurable_nodeWeight (j : ℕ) (s : ℝ) : Measurable (nodeWeight j s) := by
  unfold nodeWeight
  have hF : Measurable fun w : ℂ => F0 ((Real.sqrt s : ℂ), w) :=
    measurable_F0.comp (measurable_const.prodMk measurable_id)
  exact (Complex.measurable_ofReal.comp (Real.measurable_exp.comp
    (measurable_const.mul (measurable_norm.pow_const 2)))).mul hF

lemma norm_nodeWeight_le (j : ℕ) (s : ℝ) (w : ℂ) : ‖nodeWeight j s w‖ ≤ 1 := by
  unfold nodeWeight
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
  have h1 : Real.exp (-(j * phaseEpsQ : ℝ) * ‖w‖ ^ 2) ≤ 1 := by
    rw [Real.exp_le_one_iff]
    have : (0 : ℝ) ≤ (j * phaseEpsQ : ℝ) * ‖w‖ ^ 2 := by
      have : (0 : ℝ) ≤ (phaseEpsQ : ℝ) := by norm_num [phaseEpsQ]
      positivity
    linarith
  have h2 : ‖F0 ((Real.sqrt s : ℂ), w)‖ ≤ 1 := by unfold F0; exact Grothe.Haag.norm_ph_le _
  calc _ ≤ 1 * 1 := mul_le_mul h1 h2 (norm_nonneg _) zero_le_one
    _ = 1 := one_mul 1

lemma memLp_nodeWeight (j : ℕ) (s : ℝ) : MemLp (nodeWeight j s) 2 gaussC :=
  MemLp.of_bound (measurable_nodeWeight j s).aestronglyMeasurable 1
    (Filter.Eventually.of_forall (norm_nodeWeight_le j s))

/-- **The node functional** `K_s(p) = ∫ conj(p(w)) e^{−α|w|²} F₀(√s, w) dγ`. -/
def Kfun (j : ℕ) (s : ℝ) : CPoly →+ ℂ where
  toFun p := ∫ w, conj (ev w p) * nodeWeight j s w ∂gaussC
  map_zero' := by simp [ev]
  map_add' p q := by
    simp only [ev_add', map_add, add_mul]
    exact integral_add (integrable_conj_ev_mul (memLp_nodeWeight j s) p)
      (integrable_conj_ev_mul (memLp_nodeWeight j s) q)

lemma Kfun_apply (j : ℕ) (s : ℝ) (p : CPoly) :
    Kfun j s p = ∫ w, conj (ev w p) * nodeWeight j s w ∂gaussC := rfl

/-- Real scalars pass through `K_s`. -/
theorem realHom_Kfun (j : ℕ) (s : ℝ) : RealHom (Kfun j s) := by
  intro x p
  simp only [Kfun_apply, ev_mul', ev_C', map_mul, Complex.conj_ofReal, mul_assoc]
  exact integral_const_mul (x : ℂ) _

/-! ### (8.1): the twisted coefficient as a value of `K_s` -/

/-- The twisted conditional coefficient `J^{(j)}_{c,d}(s) = ∫ conj(h_{c,d}) hpow j (√s, ·) dγ`. -/
def twistCoef (j : ℕ) (s : ℝ) (i : ℕ × ℕ) : ℂ :=
  ∫ w, conj (hfun i w) * hpow j ((Real.sqrt s : ℂ), w) ∂gaussC

/-- The node polynomial of the power `j` at the node `s`. -/
def nodeQ (terms : Array PhaseTerm) (s : ℝ) : CPoly := qPoly (Real.sqrt s / 2) (nodeA terms s)

/-- **(8.1)** `J^{(j)}_{c,d}(s) = (−1)^j e^{−jεs} nrm_{c,d} K_s(Q^j H_{c,d})`. -/
theorem twistCoef_eq_K {terms : Array PhaseTerm} (hT : TermsOK terms) (j : ℕ) {s : ℝ}
    (hs : 0 ≤ s) (c d : ℕ) :
    twistCoef j s (c, d) =
      (((-1) ^ j * Real.exp (-(j * phaseEpsQ : ℝ) * s) * nrm c d : ℝ) : ℂ) *
        Kfun j s (nodeQ terms s ^ j * H c d) := by
  rw [twistCoef, Kfun_apply, ← integral_const_mul]
  congr 1
  ext w
  rw [hpow_node hT j hs w]
  simp only [hfun, nodeWeight, nodeQ, ev_mul', ev_pow', map_mul, map_pow, conj_ev_qPoly,
    Complex.conj_ofReal]
  generalize Real.exp (-(j * phaseEpsQ : ℝ) * s) = A
  generalize Real.exp (-(j * phaseEpsQ : ℝ) * ‖w‖ ^ 2) = B
  generalize ev w (qPoly (√s / 2) (nodeA terms s)) = q
  rw [neg_pow]
  have h1 : ((-1 : ℂ) ^ j) * ((-1) ^ j) = 1 := by rw [← mul_pow]; norm_num
  push_cast
  linear_combination (-((nrm c d : ℂ) * conj (ev w (H c d)) * (A : ℂ) * (B : ℂ) * q ^ j *
    F0 ((Real.sqrt s : ℂ), w))) * h1

/-! ### Reality of the twisted coefficient -/

lemma phiT_conj_snd (a : ℝ) (w : ℂ) : phiT ((a : ℂ), conj w) = -phiT ((a : ℂ), w) := by
  unfold phiT
  simp only [Complex.conj_ofReal, Complex.norm_conj, Complex.mul_im, Complex.mul_re,
    Complex.conj_re, Complex.conj_im, Complex.ofReal_re, Complex.ofReal_im]
  ring_nf

lemma F0_conj_snd (a : ℝ) (w : ℂ) : F0 ((a : ℂ), conj w) = conj (F0 ((a : ℂ), w)) := by
  unfold F0
  have he : (a : ℂ) + ((√(1 + (Upper.aQ : ℝ) ^ 2) * vprof (‖(a : ℂ)‖ ^ 2) : ℝ) : ℂ) * conj w =
      conj ((a : ℂ) + ((√(1 + (Upper.aQ : ℝ) ^ 2) * vprof (‖(a : ℂ)‖ ^ 2) : ℝ) : ℂ) * w) := by
    simp
  simp only at he ⊢
  rw [he]
  simp only [Grothe.Haag.ph, map_div₀, Complex.norm_conj, Complex.conj_ofReal]

lemma hpow_conj_snd (j : ℕ) (a : ℝ) (w : ℂ) :
    hpow j ((a : ℂ), conj w) = conj (hpow j ((a : ℂ), w)) := by
  unfold hpow
  rw [phiT_conj_snd, F0_conj_snd, map_mul, map_pow, map_mul, Complex.conj_I, Complex.conj_ofReal]
  push_cast
  ring

lemma integral_conj_symm {f : ℂ → ℂ} (hf : Integrable f gaussC)
    (hconj : ∀ w, f (conj w) = conj (f w)) :
    conj (∫ w, f w ∂gaussC) = ∫ w, f w ∂gaussC := by
  have hfm : AEStronglyMeasurable f (gaussC.map (fun z : ℂ => conj z)) := by
    rw [gaussC_map_conj]
    exact hf.aestronglyMeasurable
  have hmap := integral_map (μ := gaussC)
    Complex.continuous_conj.measurable.aemeasurable hfm
  rw [gaussC_map_conj] at hmap
  rw [← integral_conj]
  calc
    (∫ w, conj (f w) ∂gaussC) = ∫ w, f (conj w) ∂gaussC := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun w => (hconj w).symm
    _ = ∫ w, f w ∂gaussC := hmap.symm

lemma memLp_hpow_slice (j : ℕ) (s : ℝ) :
    MemLp (fun w : ℂ => hpow j ((Real.sqrt s : ℂ), w)) 2 gaussC := by
  have hm : Measurable fun w : ℂ => hpow j ((Real.sqrt s : ℂ), w) := by
    unfold hpow
    have hF : Measurable fun w : ℂ => F0 ((Real.sqrt s : ℂ), w) :=
      measurable_F0.comp (measurable_const.prodMk measurable_id)
    have hφ : Measurable fun w : ℂ => phiT ((Real.sqrt s : ℂ), w) :=
      continuous_phiT.measurable.comp (measurable_const.prodMk measurable_id)
    exact ((measurable_const.mul (Complex.measurable_ofReal.comp hφ)).pow_const j).mul hF
  refine MemLp.of_bound hm.aestronglyMeasurable 1 (Filter.Eventually.of_forall fun w => ?_)
  unfold hpow
  rw [norm_mul, norm_pow, norm_mul, Complex.norm_I, one_mul, Complex.norm_real, Real.norm_eq_abs]
  have hφ : |phiT ((Real.sqrt s : ℂ), w)| ≤ 1 := by
    have := phiBound ((Real.sqrt s : ℂ), w)
    exact abs_le.mpr ⟨by nlinarith, by nlinarith⟩
  have h1 : |phiT ((Real.sqrt s : ℂ), w)| ^ j ≤ 1 := pow_le_one₀ (abs_nonneg _) hφ
  have h2 : ‖F0 ((Real.sqrt s : ℂ), w)‖ ≤ 1 := by unfold F0; exact Grothe.Haag.norm_ph_le _
  calc _ ≤ 1 * 1 := mul_le_mul h1 h2 (norm_nonneg _) zero_le_one
    _ = 1 := one_mul 1

/-- The twisted conditional coefficients are real. -/
theorem twistCoef_im (j : ℕ) (s : ℝ) (i : ℕ × ℕ) : (twistCoef j s i).im = 0 := by
  have hf : Integrable (fun w => conj (hfun i w) * hpow j ((Real.sqrt s : ℂ), w)) gaussC := by
    simpa only [hfun, map_mul, Complex.conj_ofReal, mul_assoc] using
      (integrable_conj_ev_mul (memLp_hpow_slice j s) (H i.1 i.2)).const_mul (nrm i.1 i.2 : ℂ)
  have h := integral_conj_symm hf (fun w => by
    rw [hfun_conj_argument, hpow_conj_snd, map_mul, Complex.conj_conj])
  have h2 := congrArg Complex.im h
  rw [twistCoef] at *
  simp only [Complex.conj_im] at h2
  linarith

theorem twistCoef_eq_re (j : ℕ) (s : ℝ) (i : ℕ × ℕ) :
    twistCoef j s i = ((twistCoef j s i).re : ℂ) :=
  Complex.ext (by simp) (by simp [twistCoef_im])

/-! ### (8.2): the functional on the Hermite polynomials -/

lemma phase_pos_mul' (r : ℝ) (hr : 0 < r) (z : ℂ) : Grothe.Haag.ph ((r : ℂ) * z) = Grothe.Haag.ph z := by
  simp only [Grothe.Haag.ph, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos hr, Complex.ofReal_mul]
  exact mul_div_mul_left z (↑‖z‖) (by exact_mod_cast hr.ne')

lemma profileSign_sq (s : ℝ) : profileSign s = 1 ∨ profileSign s = -1 := by
  unfold profileSign; split_ifs <;> simp

lemma norm_profileSign (s : ℝ) : ‖(profileSign s : ℂ)‖ = 1 := by
  rcases profileSign_sq s with h | h <;> simp [h]

lemma hfun_profileSign (s : ℝ) (i : ℕ × ℕ) (w : ℂ) :
    hfun i ((profileSign s : ℂ) * w) = (profileSign s : ℂ) ^ (i.1 + i.2) * hfun i w := by
  rcases profileSign_sq s with h | h
  · simp [h]
  · rw [h]; push_cast; rw [neg_one_mul]; exact hfun_neg i w

/-- The rescaled shift `A' = A √λ`. -/
def twistShift (j : ℕ) (s : ℝ) : ℝ := profileShift s * Real.sqrt (lamR j)

/-- The dilation factor `μ = λ^{−1/2}`. -/
def twistMu (j : ℕ) : ℝ := (Real.sqrt (lamR j))⁻¹

lemma twistMu_pos (j : ℕ) : 0 < twistMu j := inv_pos.mpr (Real.sqrt_pos.mpr (lamR_pos j))

/-- At a node, `F₀(√s, μ σ w) = ph(A' + w)`. -/
lemma F0_twist {s : ℝ} (hs : 0 ≤ s) (hv : vprof s ≠ 0) (j : ℕ) (w : ℂ) :
    F0 ((Real.sqrt s : ℂ), (twistMu j : ℂ) * ((profileSign s : ℂ) * w)) =
      Grothe.Haag.ph ((twistShift j s : ℂ) + w) := by
  have h1 : F0 ((Real.sqrt s : ℂ), (twistMu j : ℂ) * ((profileSign s : ℂ) * w)) =
      F0ConditionalNode.phaseSlice s ((profileSign s : ℂ) * ((twistMu j : ℂ) * w)) := by
    unfold F0ConditionalNode.phaseSlice; ring_nf
  rw [h1, phaseSlice_signed s hs hv]
  have hμ := twistMu_pos j
  have he : (profileShift s : ℂ) + (twistMu j : ℂ) * w =
      (twistMu j : ℂ) * ((twistShift j s : ℂ) + w) := by
    unfold twistShift twistMu
    have hl : (Real.sqrt (lamR j) : ℂ) ≠ 0 := by
      exact_mod_cast (Real.sqrt_pos.mpr (lamR_pos j)).ne'
    push_cast
    field_simp
  rw [he, phase_pos_mul' _ hμ]

lemma integrable_canonical (A : ℝ) (g h : ℕ) :
    Integrable (fun w => conj (hfun (g, h) w) * Grothe.Haag.ph ((A : ℂ) + w)) gaussC := by
  simpa only [canonicalPhase, hfun, map_mul, Complex.conj_ofReal, mul_assoc] using
    (integrable_conj_ev_mul (canonicalPhase_memLp A) (H g h)).const_mul (nrm g h : ℂ)

/-- **(8.2)** `K_s(H_{e,f}) = λ⁻¹ nrm_{e,f}⁻¹ Σ_{g,h} T[e,f; g,h] σ^{g+h} U_{g,h}(A√λ)` (box sum). -/
theorem Kfun_H (j : ℕ) {s : ℝ} (hs : 0 ≤ s) (hv : vprof s ≠ 0) (e f : ℕ) :
    Kfun j s (H e f) = (((lamR j)⁻¹ * (nrm e f)⁻¹ : ℝ) : ℂ) *
      ∑ g ∈ Finset.range (e + f + 2), ∑ h ∈ Finset.range (e + f + 2),
        ((dilT (twistMu j) e f g h * profileSign s ^ (g + h) : ℝ) : ℂ) *
          canonicalCoefficient (twistShift j s) (g, h) := by
  set N := e + f + 2 with hN
  have hlam := lamR_pos j
  -- the tilt
  have hF : Measurable fun w : ℂ => conj (ev w (H e f)) * F0 ((Real.sqrt s : ℂ), w) :=
    (Complex.continuous_conj.comp (continuous_ev _)).measurable.mul
      (measurable_F0.comp (measurable_const.prodMk measurable_id))
  have htilt := integral_gaussC_tilt _ hF hlam
  have hK : Kfun j s (H e f) =
      ∫ z, Real.exp (-(lamR j - 1) * Complex.normSq z) •
        (conj (ev z (H e f)) * F0 ((Real.sqrt s : ℂ), z)) ∂gaussC := by
    rw [Kfun_apply]
    congr 1
    ext z
    rw [Complex.real_smul, nodeWeight, Complex.normSq_eq_norm_sq]
    have : lamR j - 1 = j * (phaseEpsQ : ℝ) := by unfold lamR; ring
    rw [this]
    push_cast
    ring
  rw [hK, htilt]
  -- the rotation by `σ`
  have hrot := integral_rot_gaussC (profileSign s : ℂ) (norm_profileSign s)
    (fun z : ℂ => conj (ev ((Real.sqrt (lamR j))⁻¹ • z) (H e f)) *
      F0 ((Real.sqrt s : ℂ), (Real.sqrt (lamR j))⁻¹ • z))
  rw [← hrot]
  -- the integrand after the rotation
  have hpt : ∀ w : ℂ, conj (ev ((Real.sqrt (lamR j))⁻¹ • ((profileSign s : ℂ) * w)) (H e f)) *
      F0 ((Real.sqrt s : ℂ), (Real.sqrt (lamR j))⁻¹ • ((profileSign s : ℂ) * w)) =
      ((nrm e f)⁻¹ : ℂ) * ∑ g ∈ Finset.range N, ∑ h ∈ Finset.range N,
        ((dilT (twistMu j) e f g h * profileSign s ^ (g + h) : ℝ) : ℂ) *
          (conj (hfun (g, h) w) * Grothe.Haag.ph ((twistShift j s : ℂ) + w)) := by
    intro w
    have hsm : (Real.sqrt (lamR j))⁻¹ • ((profileSign s : ℂ) * w) =
        (twistMu j : ℂ) * ((profileSign s : ℂ) * w) := by
      rw [Complex.real_smul]; rfl
    rw [hsm, F0_twist hs hv j w]
    have hev : ev ((twistMu j : ℂ) * ((profileSign s : ℂ) * w)) (H e f) =
        ((nrm e f)⁻¹ : ℂ) * hfun (e, f) ((twistMu j : ℂ) * ((profileSign s : ℂ) * w)) := by
      have hn : (nrm e f : ℂ) ≠ 0 := by exact_mod_cast (nrm_pos e f).ne'
      simp only [hfun]
      field_simp
    rw [hev, hfun_dilate (twistMu j) e f N le_rfl, boxSum]
    simp only [hfun_profileSign, map_mul, map_sum, Complex.conj_ofReal, map_pow, Finset.mul_sum,
      Finset.sum_mul, map_inv₀]
    apply Finset.sum_congr rfl
    intro g _
    apply Finset.sum_congr rfl
    intro h _
    push_cast
    ring
  simp_rw [hpt]
  have hint : ∫ w, ∑ g ∈ Finset.range N, ∑ h ∈ Finset.range N,
      ((dilT (twistMu j) e f g h * profileSign s ^ (g + h) : ℝ) : ℂ) *
        (conj (hfun (g, h) w) * Grothe.Haag.ph ((twistShift j s : ℂ) + w)) ∂gaussC =
      ∑ g ∈ Finset.range N, ∑ h ∈ Finset.range N,
        ((dilT (twistMu j) e f g h * profileSign s ^ (g + h) : ℝ) : ℂ) *
          canonicalCoefficient (twistShift j s) (g, h) := by
    rw [integral_finsetSum _ (fun g _ => integrable_finsetSum _ fun h _ =>
      (integrable_canonical _ g h).const_mul _)]
    apply Finset.sum_congr rfl
    intro g _
    rw [integral_finsetSum _ (fun h _ => (integrable_canonical _ g h).const_mul _)]
    apply Finset.sum_congr rfl
    intro h _
    rw [integral_const_mul]
    rfl
  rw [integral_const_mul, hint, Complex.real_smul]
  push_cast
  ring

/-- The real part of (8.2) in the kernel's index `m = min(g, h)`. -/
theorem re_Kfun_H (j : ℕ) {s : ℝ} (hs : 0 ≤ s) (hv : vprof s ≠ 0) (e f : ℕ) :
    (Kfun j s (H e f)).re = (nrm e f)⁻¹ * ∑ m ∈ Finset.range (min e f + 1),
      ((lamR j)⁻¹ * dilT (twistMu j) e f (pairOfMin e f m).1 (pairOfMin e f m).2) *
        (profileSign s ^ ((pairOfMin e f m).1 + (pairOfMin e f m).2) *
          (canonicalCoefficient (twistShift j s) (pairOfMin e f m)).re) := by
  rw [Kfun_H j hs hv e f]
  have hre : ∀ g h, (((dilT (twistMu j) e f g h * profileSign s ^ (g + h) : ℝ) : ℂ) *
      canonicalCoefficient (twistShift j s) (g, h)).re =
      dilT (twistMu j) e f g h * profileSign s ^ (g + h) *
        (canonicalCoefficient (twistShift j s) (g, h)).re := by
    intro g h; rw [Complex.re_ofReal_mul]
  rw [Complex.re_ofReal_mul, Complex.re_sum]
  simp only [Complex.re_sum, hre]
  rw [sum_box_eq_sum_min e f (e + f + 2) le_rfl
    (fun g h => dilT (twistMu j) e f g h * profileSign s ^ (g + h) *
      (canonicalCoefficient (twistShift j s) (g, h)).re)
    (fun g h hgh => by simp [dilT_eq_zero _ e f g h hgh])]
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro m _
  ring

end

end Grothe.UpperQuad
