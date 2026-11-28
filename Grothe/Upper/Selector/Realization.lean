import Grothe.Upper.Selector.Projection

/-!
# Domination for angular selectors

Condition on all selector coordinates before applying scalar phase rounding. In each
sample, two copies of the preprocessed unit vector, weighted by cosine and sine, have
the prescribed pairwise correlations. Integrating the matrix inequality is enough
to establish domination.
-/

open MeasureTheory Complex Finset
open scoped InnerProductSpace ComplexConjugate Polynomial

set_option warningAsError true

namespace Grothe.Upper.Selector

noncomputable section

private def angled {ι : Type} [Fintype ι] (u : EuclideanSpace ℂ ι) (a : ℝ) :
    EuclideanSpace ℂ (ι ⊕ ι) := WithLp.toLp 2
      (Sum.elim (fun k => (Real.cos a : ℂ) * u k) (fun k => (Real.sin a : ℂ) * u k))

private lemma inner_angled {ι : Type} [Fintype ι] (u v : EuclideanSpace ℂ ι) (a b : ℝ) :
    inner ℂ (angled u a) (angled v b) = (Real.cos (a - b) : ℂ) * inner ℂ u v := by
  rw [PiLp.inner_apply, Fintype.sum_sum_type, Real.cos_sub]
  simp only [angled, WithLp.ofLp_toLp, Sum.elim_inl, Sum.elim_inr, RCLike.inner_apply,
    map_mul, Complex.conj_ofReal, Complex.ofReal_add, Complex.ofReal_mul, PiLp.inner_apply]
  rw [add_mul, mul_sum, mul_sum]
  exact congrArg₂ (· + ·) (sum_congr rfl fun _ _ => by ring) (sum_congr rfl fun _ _ => by ring)

private lemma norm_angled {ι : Type} [Fintype ι] (u : EuclideanSpace ℂ ι) (a : ℝ) :
    ‖angled u a‖ = ‖u‖ := by
  have h := congrArg Complex.re (inner_angled u u a a)
  simp [inner_self_eq_norm_sq_to_K] at h
  simp only [← Complex.ofReal_pow, Complex.ofReal_re] at h
  nlinarith [norm_nonneg u, norm_nonneg (angled u a)]

/-- Apply a scalar disk kernel after the angular selector and signed polynomial preprocessing. -/
def selectorKernel (Q : ℂ → ℂ) (R : ℝ[X]) (t : ℝ) (z : ℂ) : ℂ :=
  ∫ u : ℂ × ℂ, Q (polyKernel R z * Real.cos
    (t * (normSq u.1 + normSq (mY z u) - 2))) ∂mu2

/-- Every measurable, bounded-on-the-disk dominated kernel admits the angular selector. -/
theorem selectorKernel_dominated {Q : ℂ → ℂ} (hQ : DominatedKernel Q) (hQm : Measurable Q)
    {M : ℝ} (hQM : ∀ z : ℂ, ‖z‖ ≤ 1 → ‖Q z‖ ≤ M)
    (R : ℝ[X]) (hR : l1 R ≤ 1) (t : ℝ) : DominatedKernel (selectorKernel Q R t) := by
  intro m n A ι _ x y hx hy
  let μ := Measure.pi (fun _ : ι => gaussC)
  let E (v : EuclideanSpace ℂ ι) (g : ι → ℂ) := ∑ k, v k * g k
  let θ (z : ℂ) := t * (normSq z - 1)
  let Φ (z : ℂ) (p : ℂ × ℂ) := Q (polyKernel R z * Real.cos (θ p.1 + θ p.2))
  have hΦ (z : ℂ) : Measurable (Φ z) := by dsimp [Φ, θ]; fun_prop
  have hE (v : EuclideanSpace ℂ ι) : Measurable (E v) := by dsimp [E]; fun_prop
  let V (i : Fin m) (g : ι → ℂ) := angled (realL R (x i)) (θ (E (x i) g))
  let W (j : Fin n) (g : ι → ℂ) := angled (realR R (y j)) (-θ (E (y j) g))
  have hV (i g) : ‖V i g‖ = 1 := (norm_angled _ _).trans (norm_realL R hR _ (hx i))
  have hW (j g) : ‖W j g‖ = 1 := (norm_angled _ _).trans (norm_realR R hR _ (hy j))
  let val (i : Fin m) (j : Fin n) (g : ι → ℂ) :=
    Φ (inner ℂ (x i) (y j)) (E (x i) g, E (y j) g)
  have hv (i j g) : val i j g = Q (inner ℂ (V i g) (W j g)) := by
    simp [val, Φ, V, W, inner_angled, inner_realL_realR, mul_comm]
  have hi (i j) : Integrable (fun g => A i j * val i j g) μ := by
    apply Integrable.const_mul
    apply (integrable_const M).mono'
      (((hΦ _).comp ((hE _).prodMk (hE _))).aestronglyMeasurable)
    filter_upwards [] with g
    change ‖val i j g‖ ≤ M
    rw [hv]
    exact hQM _ (by simpa [hV, hW] using norm_inner_le_norm (𝕜 := ℂ) (V i g) (W j g))
  have hex (i j) : (∫ g, val i j g ∂μ) = selectorKernel Q R t (inner ℂ (x i) (y j)) := by
    let z := inner ℂ (x i) (y j)
    let p (g : ι → ℂ) := (E (x i) g, E (y j) g)
    let q (u : ℂ × ℂ) := (u.1, mY z u)
    have hp : Measurable p := (hE _).prodMk (hE _)
    have hq : Measurable q := measurable_fst.prodMk (measurable_mY _)
    have hlaw : μ.map p = mu2.map q := projection_pair_law _ _ (hx i) (hy j)
    change (∫ g, Φ z (p g) ∂μ) = _
    rw [← integral_map hp.aemeasurable (hΦ z).aestronglyMeasurable, hlaw,
      integral_map hq.aemeasurable (hΦ z).aestronglyMeasurable]
    apply integral_congr_ae
    filter_upwards [] with u
    dsimp [Φ, θ, q, selectorKernel, z]
    congr 4; ring
  have hav : (∫ g, ∑ i, ∑ j, A i j * val i j g ∂μ) =
      ∑ i, ∑ j, A i j * selectorKernel Q R t (inner ℂ (x i) (y j)) := by
    rw [integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => hi i j]
    refine sum_congr rfl fun i _ => ?_
    rw [integral_finsetSum _ fun j _ => hi i j]
    exact sum_congr rfl fun j _ => by rw [integral_const_mul, hex]
  rw [← hav]
  refine (norm_integral_le_integral_norm _).trans ?_
  calc
    _ ≤ ∫ _g, Grothe.Upper.Optima.scalarOpt A ∂μ := by
      apply integral_mono_of_nonneg (ae_of_all _ fun _ => norm_nonneg _) (integrable_const _)
      filter_upwards [] with g
      simp_rw [hv]
      exact hQ _ _ A _ (fun i => V i g) (fun j => W j g) (fun i => hV i g) (fun j => hW j g)
    _ = _ := by simp [μ]

end

end Grothe.Upper.Selector
