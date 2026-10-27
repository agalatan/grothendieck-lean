import Grothe.Haagerup.Identity
import Grothe.HJM.Mixture
import Grothe.LowerAnalytic.CapSymmetry

/-!
# Scalar Gaussian response pairs for the asymmetric HJM branch

Agent-ID: codex-aa04.

The kernel of two measurable disk-valued scalar responses is realized for
every finite family of unit vectors by one shared Gaussian vector. Reflection
of both responses conjugates the kernel and its argument; averaging the two
realizable kernels preserves domination.

The convention is `E[conj(F(X)) * G(Y)]`, matching Lean's inner product, which
is conjugate-linear in its first argument. Its cross coefficients are therefore
`conj(a_k) * b_k`. The paper's opposite convention has conjugate coefficients;
reflection symmetrization retains their common real parts.
-/

open MeasureTheory ProbabilityTheory Grothe.Haag Grothe.LowerAnalytic Grothe.UpperChaos
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM

noncomputable section

/-- The correlation kernel of two scalar responses on standard complex Gaussians.
The definition is total; its rounding interpretation is on the closed unit disk. -/
def scalarPairKernel (F G : ℂ → ℂ) (ρ : ℂ) : ℂ :=
  ∫ u, conj (F u.1) * G (ρ * u.1 + sig ρ * u.2) ∂mu2

lemma measurable_pairIntegrand {F G : ℂ → ℂ} (hF : Measurable F) (hG : Measurable G)
    (ρ : ℂ) : Measurable fun u : ℂ × ℂ =>
      conj (F u.1) * G (ρ * u.1 + sig ρ * u.2) := by
  exact (Complex.continuous_conj.measurable.comp (hF.comp measurable_fst)).mul
    (hG.comp (by fun_prop))

lemma integrable_pairIntegrand {F G : ℂ → ℂ} (hF : Measurable F) (hG : Measurable G)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (hG1 : ∀ z, ‖G z‖ ≤ 1) (ρ : ℂ) :
    Integrable (fun u : ℂ × ℂ => conj (F u.1) * G (ρ * u.1 + sig ρ * u.2)) mu2 := by
  refine Integrable.mono' (integrable_const (1 : ℝ))
    (measurable_pairIntegrand hF hG ρ).aestronglyMeasurable
    (Filter.Eventually.of_forall fun u => ?_)
  rw [norm_mul, Complex.norm_conj]
  exact (mul_le_mul (hF1 _) (hG1 _) (norm_nonneg _) zero_le_one).trans (one_mul 1).le

/-- The two scalar projections of one Gaussian vector have the prescribed
correlated complex Gaussian law. The responses may be different. -/
theorem integral_scalar_pair {κ : Type} [Fintype κ] (F G : ℂ → ℂ)
    (hF : Measurable F) (hG : Measurable G) {x w : EuclideanSpace ℂ κ}
    (hx : ‖x‖ = 1) (hw : ‖w‖ = 1) (hxw : ⟪x, w⟫_ℂ = 0) (ρ : ℂ) :
    ∫ g, conj (F (⟪g, x⟫_ℂ / ((√2 : ℝ) : ℂ))) *
        G (⟪g, ρ • x + sig ρ • w⟫_ℂ / ((√2 : ℝ) : ℂ))
      ∂ProbabilityTheory.stdGaussian (EuclideanSpace ℂ κ) = scalarPairKernel F G ρ := by
  let Ψ : ℂ × ℂ → ℂ := fun u => conj (F u.1) * G (ρ * u.1 + sig ρ * u.2)
  have hΨ : Measurable Ψ := measurable_pairIntegrand hF hG ρ
  have hmap : g4.map (Prod.map cxs cxs) = mu2 := by
    rw [← Measure.map_prod_map _ _ measurable_cxs measurable_cxs, map_cxs]
  have hd : ∀ u v r t : ℂ, (r*u+t*v) / ((√2 : ℝ) : ℂ) =
      r*(u / ((√2 : ℝ) : ℂ)) + t*(v / ((√2 : ℝ) : ℂ)) := by
    intros
    ring
  have he : ∀ g : EuclideanSpace ℂ κ,
      conj (F (⟪g, x⟫_ℂ / ((√2 : ℝ) : ℂ))) *
          G (⟪g, ρ • x + sig ρ • w⟫_ℂ / ((√2 : ℝ) : ℂ)) =
        Ψ (Prod.map cxs cxs (coords4 (frame x w) g)) := by
    intro g
    obtain ⟨h1, h2⟩ := inner_g_eq_cx x w g
    simp only [Ψ, Prod.map, cxs, inner_add_right, inner_smul_right, h1, h2, hd]
  simp_rw [he]
  have hi := integral_coords4 (frame x w) (orthonormal_frame hx hw hxw)
    (hΨ.comp (measurable_cxs.prodMap measurable_cxs))
  have hj := integral_map (μ := g4) (measurable_cxs.prodMap measurable_cxs).aemeasurable
    hΨ.aestronglyMeasurable
  rw [hmap] at hj
  exact hi.trans hj.symm

/-- Actual disk-valued rounding, with one shared Gaussian driver for the entire
matrix. No charge, smoothness, coefficient identity, or nonvanishing assumption
on the responses is needed. -/
theorem scalarPairKernel_disk {F G : ℂ → ℂ} (hF : Measurable F) (hG : Measurable G)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (hG1 : ∀ z, ‖G z‖ ≤ 1) :
    DiskKernel (scalarPairKernel F G) := by
  intro m n ι _ x y hx hy
  refine ⟨EuclideanSpace ℂ (Option ι), inferInstance,
    ProbabilityTheory.stdGaussian _, inferInstance,
    fun g i => F (⟪g, emb (x i)⟫_ℂ / ((√2 : ℝ) : ℂ)),
    fun g j => G (⟪g, emb (y j)⟫_ℂ / ((√2 : ℝ) : ℂ)),
    fun i => (hF.comp (by fun_prop)).aestronglyMeasurable,
    fun j => (hG.comp (by fun_prop)).aestronglyMeasurable,
    fun g i => hF1 _, fun g j => hG1 _, fun i j => ?_⟩
  obtain ⟨w, hw, hxw, hyw⟩ := exists_decomp (norm_emb (hx i)) (norm_emb (hy j))
    (norm_eNone ι) (inner_emb_eNone (x i))
  dsimp only
  rw [hyw, integral_scalar_pair F G hF hG (norm_emb (hx i)) hw hxw, inner_emb]

/-- Arbitrary measurable disk-valued scalar response pairs give dominated kernels. -/
theorem scalarPairKernel_dominated {F G : ℂ → ℂ} (hF : Measurable F) (hG : Measurable G)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (hG1 : ∀ z, ‖G z‖ ≤ 1) :
    DominatedKernel (scalarPairKernel F G) :=
  (scalarPairKernel_disk hF hG hF1 hG1).dominated

/-- Conjugate the input and output of a response. -/
def reflectResponse (F : ℂ → ℂ) (z : ℂ) : ℂ := conj (F (conj z))

lemma measurable_reflectResponse {F : ℂ → ℂ} (hF : Measurable F) :
    Measurable (reflectResponse F) :=
  Complex.continuous_conj.measurable.comp (hF.comp Complex.continuous_conj.measurable)

lemma norm_reflectResponse_le {F : ℂ → ℂ} (hF1 : ∀ z, ‖F z‖ ≤ 1) (z : ℂ) :
    ‖reflectResponse F z‖ ≤ 1 := by
  simpa only [reflectResponse, Complex.norm_conj] using hF1 (conj z)

lemma reflectResponse_involutive (F : ℂ → ℂ) :
    reflectResponse (reflectResponse F) = F := by
  funext z
  simp [reflectResponse]

private lemma map_pair_conj :
    mu2.map (Prod.map (fun z : ℂ => conj z) (fun z : ℂ => conj z)) = mu2 := by
  rw [show mu2 = gaussC.prod gaussC from rfl,
    ← Measure.map_prod_map _ _ Complex.continuous_conj.measurable Complex.continuous_conj.measurable,
    gaussC_map_conj]

/-- Reflection changes both the kernel value and its argument by conjugation.
This is the symmetry that turns cross coefficients into their real parts. -/
theorem scalarPairKernel_reflect {F G : ℂ → ℂ} (hF : Measurable F) (hG : Measurable G)
    (ρ : ℂ) :
    scalarPairKernel (reflectResponse F) (reflectResponse G) ρ =
      conj (scalarPairKernel F G (conj ρ)) := by
  let Ψ : ℂ × ℂ → ℂ := fun u => conj (F u.1) * G (conj ρ * u.1 + sig (conj ρ) * u.2)
  have hΨ : Measurable Ψ := measurable_pairIntegrand hF hG (conj ρ)
  have hm : Measurable (Prod.map (fun z : ℂ => conj z) (fun z : ℂ => conj z)) :=
    Complex.continuous_conj.measurable.prodMap Complex.continuous_conj.measurable
  have hi := integral_map (μ := mu2) hm.aemeasurable
    (Complex.continuous_conj.measurable.comp hΨ).aestronglyMeasurable
  rw [map_pair_conj] at hi
  calc
    scalarPairKernel (reflectResponse F) (reflectResponse G) ρ =
        ∫ u, conj (Ψ (Prod.map (fun z : ℂ => conj z) (fun z : ℂ => conj z) u)) ∂mu2 := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun u => by
        simp only [reflectResponse, Ψ, Prod.map, sig, map_add, map_mul,
          Complex.norm_conj, Complex.conj_conj, Complex.conj_ofReal]
    _ = ∫ u, conj (Ψ u) ∂mu2 := hi.symm
    _ = conj (scalarPairKernel F G (conj ρ)) := integral_conj

/-- Equal mixture of a response pair and its conjugate reflection. -/
def symmetrizedPairKernel (F G : ℂ → ℂ) (ρ : ℂ) : ℂ :=
  (scalarPairKernel F G ρ + scalarPairKernel (reflectResponse F) (reflectResponse G) ρ) / 2

lemma symmetrizedPairKernel_eq {F G : ℂ → ℂ} (hF : Measurable F) (hG : Measurable G)
    (ρ : ℂ) :
    symmetrizedPairKernel F G ρ =
      (scalarPairKernel F G ρ + conj (scalarPairKernel F G (conj ρ))) / 2 := by
  rw [symmetrizedPairKernel, scalarPairKernel_reflect hF hG]

/-- The symmetrized asymmetric kernel is dominated through an actual mixture
of two Gaussian response pairs. -/
theorem symmetrizedPairKernel_dominated {F G : ℂ → ℂ}
    (hF : Measurable F) (hG : Measurable G)
    (hF1 : ∀ z, ‖F z‖ ≤ 1) (hG1 : ∀ z, ‖G z‖ ≤ 1) :
    DominatedKernel (symmetrizedPairKernel F G) := by
  let K : Fin 2 → ℂ → ℂ :=
    ![scalarPairKernel F G, scalarPairKernel (reflectResponse F) (reflectResponse G)]
  have hK : ∀ r ∈ (Finset.univ : Finset (Fin 2)), DominatedKernel (K r) := by
    intro r _
    fin_cases r
    · exact scalarPairKernel_dominated hF hG hF1 hG1
    · exact scalarPairKernel_dominated (measurable_reflectResponse hF) (measurable_reflectResponse hG)
        (norm_reflectResponse_le hF1) (norm_reflectResponse_le hG1)
  have hmix := DominatedKernel.mixture Finset.univ (fun _ : Fin 2 => (1/2 : ℝ)) K hK
    (by norm_num [Fin.sum_univ_two])
  refine hmix.congr fun ρ _ => ?_
  simp only [Fin.sum_univ_two, K, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, symmetrizedPairKernel]
  push_cast
  ring

end

end Grothe.HJM
