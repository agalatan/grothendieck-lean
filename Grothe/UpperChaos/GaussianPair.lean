-- Grothe/UpperChaos/GaussianPair.lean
import Grothe.UpperChaos.Gauss2
import Grothe.UpperChaos.Sym2R

/-!
# Gaussian amplitudes retained in the Schur estimate

The input to the Gaussian operator has a prescribed Gaussian amplitude. Integrating
the positive modulus kernel against that amplitude preserves information lost by
the unrestricted operator norm. The calculation below uses only two-dimensional
Gaussian integrals and the positive Schur complement.

Agent-ID: codex-9b17. Refs #380.
-/

namespace Grothe.UpperChaos.GaussianAmplitude

open MeasureTheory Sym2R
open scoped Real ENNReal

noncomputable section

/-- Add a scalar multiple of the identity matrix. -/
def shifted (A : Sym2R) (j : ℝ) : Sym2R := ⟨A.a + j, A.b, A.c + j⟩

lemma shifted_q (A : Sym2R) (j : ℝ) (y : ℝ × ℝ) :
    (shifted A j).q y = A.q y + j * (y.1 ^ 2 + y.2 ^ 2) := by
  simp only [shifted, q, bil]
  ring

lemma shifted_PD {A : Sym2R} (hA : A.PD) {j : ℝ} (hj : 0 ≤ j) :
    (shifted A j).PD :=
  PD_of_q_pos fun y hy => by
    rw [shifted_q]
    have := q_pos_of_PD hA hy
    have : 0 ≤ j * (y.1 ^ 2 + y.2 ^ 2) := by positivity
    linarith

lemma add_PD_PSD {A E : Sym2R} (hA : A.PD) (hE : E.PSD) : (add A E).PD :=
  PD_of_q_pos fun y hy => by
    rw [q_add]
    exact add_pos_of_pos_of_nonneg (q_pos_of_PD hA hy) (hE y)

/-- Congruence of two real symmetric matrices. -/
def congruence (S N : Sym2R) : Sym2R :=
  ⟨N.a * S.a ^ 2 + 2 * N.b * S.a * S.b + N.c * S.b ^ 2,
   N.a * S.a * S.b + N.b * (S.a * S.c + S.b ^ 2) + N.c * S.b * S.c,
   N.a * S.b ^ 2 + 2 * N.b * S.b * S.c + N.c * S.c ^ 2⟩

lemma q_congruence (S N : Sym2R) (y : ℝ × ℝ) :
    (congruence S N).q y = N.q (S.app y) := by
  simp only [congruence, q, bil, app]
  ring

/-- The Schur complement after integrating one of the two Gaussian variables. -/
def complement (A E : Sym2R) : Sym2R :=
  add A (smul (-A.det⁻¹) (congruence E A.adj))

lemma complement_q (A E : Sym2R) (y : ℝ × ℝ) :
    (complement A E).q y = A.q y - A.det⁻¹ * A.adj.q (E.app y) := by
  rw [complement, q_add, q_smul, q_congruence]
  ring

lemma complement_PD {V E : Sym2R} (hV : V.PD) (hE : E.PSD) :
    (complement (add V E) E).PD := by
  let A := add V E
  have hA : A.PD := add_PD_PSD hV hE
  have hhalf : (smul (1 / 2) V).PSD := fun y => by
    rw [q_smul]
    exact mul_nonneg (by norm_num) (PSD_of_PD hV y)
  have heq : add (smul 2 (smul (1 / 2) V)) E = A := by
    dsimp [A, add, smul]
    congr 1 <;> ring
  apply PD_of_q_pos
  intro y hy
  have hw := weight_ineq hhalf hE (by rw [heq]; exact hA.2) y
  change (E.app y).1 * ((add (smul 2 (smul (1 / 2) V)) E).adj.app (E.app y)).1 +
      (E.app y).2 * ((add (smul 2 (smul (1 / 2) V)) E).adj.app (E.app y)).2 ≤
        (add (smul 2 (smul (1 / 2) V)) E).det * E.q y at hw
  rw [heq, dot_app] at hw
  have hb : A.det⁻¹ * A.adj.q (E.app y) ≤ E.q y := by
    rw [inv_mul_eq_div, div_le_iff₀ hA.2]
    simpa only [q, mul_comm] using hw
  have hp := q_pos_of_PD hV hy
  change 0 < (complement A E).q y
  rw [complement_q]
  have ha : A.q y = V.q y + E.q y := q_add V E y
  linarith

/-- The block determinant splits in the sum and difference variables. -/
lemma determinant_complement (A E : Sym2R) (hA : A.det ≠ 0) :
    A.det * (complement A E).det =
      (add A (smul (-1) E)).det * (add A E).det := by
  simp only [complement, add, smul, congruence, adj, det] at *
  field_simp
  ring

lemma determinant_complement_add (V E : Sym2R) (hA : (add V E).det ≠ 0) :
    (add V E).det * (complement (add V E) E).det =
      V.det * (add V (smul 2 E)).det := by
  rw [determinant_complement _ _ hA]
  congr 1 <;> simp only [add, smul, det] <;> ring

/-- The positive Gaussian kernel in two copies of `ℝ²`. -/
def pairGaussian (A E : Sym2R) (y y' : ℝ × ℝ) : ℝ :=
  Real.exp (-A.q y / 2 - A.q y' / 2 + E.bil y y')

lemma pairGaussian_eq (A E : Sym2R) (y y' : ℝ × ℝ) :
    pairGaussian A E y y' = Real.exp (-A.q y / 2) *
      Gauss2.gR A.a A.b A.c (E.app y).1 (E.app y).2 y' := by
  rw [pairGaussian, Gauss2.gR, ← Real.exp_add]
  congr 1
  simp only [q, bil, app]
  ring

lemma integrable_pairGaussian_inner {A : Sym2R} (hA : A.PD)
    (E : Sym2R) (y : ℝ × ℝ) : Integrable (pairGaussian A E y) := by
  change Integrable (fun y' => pairGaussian A E y y')
  simp_rw [pairGaussian_eq]
  exact (Gauss2.integrable_gR hA.1 hA.2 _ _).const_mul _

lemma integral_pairGaussian_inner {A : Sym2R} (hA : A.PD)
    (E : Sym2R) (y : ℝ × ℝ) :
    ∫ y', pairGaussian A E y y' =
      (2 * Real.pi / √A.det) * Real.exp (-(complement A E).q y / 2) := by
  simp_rw [pairGaussian_eq]
  rw [integral_const_mul, Gauss2.integral_gR hA.1 hA.2]
  rw [mul_left_comm, ← Real.exp_add]
  congr 2
  rw [complement_q]
  simp only [adj, app, q, bil, det]
  field_simp
  ring

lemma integrable_pairGaussian {A : Sym2R} (hA : A.PD) (E : Sym2R)
    (hS : (complement A E).PD) :
    Integrable (fun p : (ℝ × ℝ) × (ℝ × ℝ) => pairGaussian A E p.1 p.2) := by
  rw [Measure.volume_eq_prod]
  have hm : AEStronglyMeasurable
      (fun p : (ℝ × ℝ) × (ℝ × ℝ) => pairGaussian A E p.1 p.2)
      (volume.prod volume) := by
    apply Continuous.aestronglyMeasurable
    unfold pairGaussian q bil
    fun_prop
  apply (integrable_prod_iff hm).2
  refine ⟨Filter.Eventually.of_forall (integrable_pairGaussian_inner hA E), ?_⟩
  have hn : ∀ y y', ‖pairGaussian A E y y'‖ = pairGaussian A E y y' := by
    intro y y'
    exact Real.norm_of_nonneg (Real.exp_pos _).le
  simp_rw [hn, integral_pairGaussian_inner hA]
  have hg := (Gauss2.integrable_gR hS.1 hS.2 (0 : ℝ) 0).const_mul
    (2 * Real.pi / √A.det)
  refine hg.congr (Filter.Eventually.of_forall fun y => ?_)
  simp only [Gauss2.gR, q, bil]
  congr 2
  ring

/-- The iterated four-dimensional Gaussian integral. -/
theorem integral_pairGaussian {A : Sym2R} (hA : A.PD) (E : Sym2R)
    (hS : (complement A E).PD) :
    ∫ y, ∫ y', pairGaussian A E y y' =
      4 * Real.pi ^ 2 / √(A.det * (complement A E).det) := by
  simp_rw [integral_pairGaussian_inner hA]
  rw [integral_const_mul]
  have he : (fun y : ℝ × ℝ => Real.exp (-(complement A E).q y / 2)) =
      Gauss2.gR (complement A E).a (complement A E).b (complement A E).c 0 0 := by
    funext y
    simp only [Gauss2.gR, q, bil, zero_mul, add_zero]
    congr 1
    ring
  rw [he, Gauss2.integral_gR hS.1 hS.2]
  norm_num
  rw [Real.sqrt_mul hA.2.le]
  dsimp [det]
  ring

/-- A product of two identical positive kernels factors under the double integral. -/
theorem lintegral_product_kernel
    (k : (ℝ × ℝ) → (ℝ × ℝ) → ℝ≥0∞)
    (hkm : Measurable (Function.uncurry k)) :
    (∫⁻ Y : (ℝ × ℝ) × (ℝ × ℝ), ∫⁻ Y' : (ℝ × ℝ) × (ℝ × ℝ),
      k Y.1 Y'.1 * k Y.2 Y'.2) = (∫⁻ y, ∫⁻ y', k y y') ^ 2 := by
  have hkr (y : ℝ × ℝ) : Measurable (k y) :=
    hkm.comp (measurable_const.prodMk measurable_id)
  have hki : Measurable (fun y => ∫⁻ y', k y y') := hkm.lintegral_prod_right
  have hin (Y : (ℝ × ℝ) × (ℝ × ℝ)) :
      (∫⁻ Y' : (ℝ × ℝ) × (ℝ × ℝ), k Y.1 Y'.1 * k Y.2 Y'.2) =
        (∫⁻ y', k Y.1 y') * ∫⁻ y', k Y.2 y' := by
    rw [Measure.volume_eq_prod, lintegral_prod_mul (hkr Y.1).aemeasurable
      (hkr Y.2).aemeasurable]
  simp_rw [hin]
  rw [Measure.volume_eq_prod, lintegral_prod_mul hki.aemeasurable hki.aemeasurable]
  exact (sq _).symm

end

end Grothe.UpperChaos.GaussianAmplitude
