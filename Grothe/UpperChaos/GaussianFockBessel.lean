import Grothe.UpperChaos.HermiteBasis
import Grothe.UpperChaos.ProductComplete

/-!
# Eight-source Gaussian Fock coefficient summability and Bessel bound

Agent-ID: codex-2ca4.

The normalized holomorphic monomials are constructed under the eight-source
Gaussian measure, grouped by physical pair. Their orthonormality is proved
from the existing Hermite orthogonality and product integration. Consequently
all their coefficient energies are summable for every square-integrable
transform, and their total is bounded by its squared Gaussian norm.

This is sufficient on the norm side of an upper-bound argument: completeness
of the holomorphic Fock subspace is not needed for the Bessel inequality.
No coefficient summability, Parseval identity, or operator-entry identification
is assumed. `ScaledActualCoherentL2` supplies the actual transform's weighted
L2 proof. Identification with actual multiplier entries remains separate.
-/

open MeasureTheory MvPolynomial Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.UpperChaos.GaussianFockBessel

noncomputable section

private theorem inner_toLp_integral {α : Type*} [MeasurableSpace α]
    {μ : Measure α} {f g : α → ℂ} (hf : MemLp f 2 μ) (hg : MemLp g 2 μ) :
    ⟪hf.toLp f, hg.toLp g⟫_ℂ = ∫ x, conj (f x) * g x ∂μ := by
  rw [L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hf.coeFn_toLp, hg.coeFn_toLp] with x hx hy
  rw [hx, hy, RCLike.inner_apply, mul_comm]

private theorem norm_toLp_sq {α : Type*} [MeasurableSpace α]
    {μ : Measure α} {f : α → ℂ} (hf : MemLp f 2 μ) :
    ‖hf.toLp f‖ ^ 2 = ∫ x, ‖f x‖ ^ 2 ∂μ := by
  calc
    ‖hf.toLp f‖ ^ 2 = RCLike.re ⟪hf.toLp f, hf.toLp f⟫_ℂ :=
      norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ x, RCLike.re ⟪hf.toLp f x, hf.toLp f x⟫_ℂ ∂μ := by
      rw [L2.inner_def]
      exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hf.coeFn_toLp] with x hx
      rw [hx, ← norm_sq_eq_re_inner]

/-- The holomorphic Hermite row is the ordinary monomial row. -/
theorem hermite_zero_right (p : ℕ) : H p 0 = X 0 ^ p := by
  induction p with
  | zero => simp [H_zero_zero]
  | succ p ih =>
    rw [H_succ_left, A0, pderiv1_H_zero, sub_zero, ih, pow_succ]
    ring

/-- One normalized holomorphic source monomial. -/
def monomial1 (p : ℕ) (z : ℂ) : ℂ := hfun (p, 0) z

/-- The factorial normalization is explicit, rather than a new coefficient convention. -/
theorem monomial1_eq (p : ℕ) (z : ℂ) :
    monomial1 p z = ((Real.sqrt (p.factorial : ℝ))⁻¹ : ℝ) * z ^ p := by
  simp [monomial1, hfun, nrm, hermite_zero_right, ev, zv]

theorem memLp_monomial1 (p : ℕ) : MemLp (monomial1 p) 2 gaussC :=
  memLp_hfun (p, 0)

theorem integral_monomial1 (p q : ℕ) :
    (∫ z, conj (monomial1 p z) * monomial1 q z ∂gaussC) =
      if p = q then (1 : ℂ) else 0 := by
  calc
    _ = ⟪hvec (p, 0), hvec (q, 0)⟫_ℂ :=
      (inner_toLp (memLp_hfun (p, 0)) (memLp_hfun (q, 0))).symm
    _ = _ := by rw [inner_hvec]; simp

/-- Product of two indexed pointwise families, retaining the source grouping. -/
def tensorFamily {α β ι κ : Type*} (b : ι → α → ℂ) (c : κ → β → ℂ)
    (i : ι × κ) (z : α × β) : ℂ := b i.1 z.1 * c i.2 z.2

/-- Tensor orthogonality is an exact Gaussian-product calculation. -/
theorem integral_tensorFamily {α β ι κ : Type*}
    [MeasurableSpace α] [MeasurableSpace β] [DecidableEq ι] [DecidableEq κ]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (b : ι → α → ℂ) (c : κ → β → ℂ)
    (hb : ∀ i j, (∫ x, conj (b i x) * b j x ∂μ) =
      if i = j then (1 : ℂ) else 0)
    (hc : ∀ i j, (∫ y, conj (c i y) * c j y ∂ν) =
      if i = j then (1 : ℂ) else 0) (i j : ι × κ) :
    (∫ z, conj (tensorFamily b c i z) * tensorFamily b c j z ∂μ.prod ν) =
      if i = j then (1 : ℂ) else 0 := by
  have hpoint (z : α × β) :
      conj (tensorFamily b c i z) * tensorFamily b c j z =
        (conj (b i.1 z.1) * b j.1 z.1) *
          (conj (c i.2 z.2) * c j.2 z.2) := by
    simp only [tensorFamily, map_mul]
    ring
  simp_rw [hpoint]
  rw [integral_prod_mul, hb, hc]
  split_ifs <;> simp_all [Prod.ext_iff]

abbrev Sources2 := ℂ × ℂ
abbrev Sources4 := Sources2 × Sources2
abbrev Sources8 := Sources4 × Sources4
abbrev Powers2 := ℕ × ℕ
abbrev Powers4 := Powers2 × Powers2
abbrev Powers8 := Powers4 × Powers4

abbrev sourceMeasure2 : Measure Sources2 := gaussC.prod gaussC
abbrev sourceMeasure4 : Measure Sources4 := sourceMeasure2.prod sourceMeasure2
abbrev sourceMeasure8 : Measure Sources8 := sourceMeasure4.prod sourceMeasure4

def monomial2 : Powers2 → Sources2 → ℂ := tensorFamily monomial1 monomial1
def monomial4 : Powers4 → Sources4 → ℂ := tensorFamily monomial2 monomial2
def monomial8 : Powers8 → Sources8 → ℂ := tensorFamily monomial4 monomial4

theorem memLp_monomial2 (i : Powers2) :
    MemLp (monomial2 i) 2 sourceMeasure2 :=
  ProductComplete.memLp_prod_mul (memLp_monomial1 i.1) (memLp_monomial1 i.2)

theorem memLp_monomial4 (i : Powers4) :
    MemLp (monomial4 i) 2 sourceMeasure4 :=
  ProductComplete.memLp_prod_mul (memLp_monomial2 i.1) (memLp_monomial2 i.2)

theorem memLp_monomial8 (i : Powers8) :
    MemLp (monomial8 i) 2 sourceMeasure8 :=
  ProductComplete.memLp_prod_mul (memLp_monomial4 i.1) (memLp_monomial4 i.2)

theorem integral_monomial2 (i j : Powers2) :
    (∫ z, conj (monomial2 i z) * monomial2 j z ∂sourceMeasure2) =
      if i = j then (1 : ℂ) else 0 :=
  integral_tensorFamily monomial1 monomial1 integral_monomial1 integral_monomial1 i j

theorem integral_monomial4 (i j : Powers4) :
    (∫ z, conj (monomial4 i z) * monomial4 j z ∂sourceMeasure4) =
      if i = j then (1 : ℂ) else 0 :=
  integral_tensorFamily monomial2 monomial2 integral_monomial2 integral_monomial2 i j

theorem integral_monomial8 (i j : Powers8) :
    (∫ z, conj (monomial8 i z) * monomial8 j z ∂sourceMeasure8) =
      if i = j then (1 : ℂ) else 0 :=
  integral_tensorFamily monomial4 monomial4 integral_monomial4 integral_monomial4 i j

/-- Normalized holomorphic monomials as actual Gaussian L2 vectors. -/
def monomialVector8 (i : Powers8) : Lp ℂ 2 sourceMeasure8 :=
  (memLp_monomial8 i).toLp (monomial8 i)

theorem orthonormal_monomialVector8 : Orthonormal ℂ monomialVector8 := by
  apply orthonormal_iff_ite.mpr
  intro i j
  exact (inner_toLp_integral (memLp_monomial8 i) (memLp_monomial8 j)).trans
    (integral_monomial8 i j)

/-- Gaussian coefficient functional for the normalized holomorphic monomial. -/
def coefficient8 (F : Sources8 → ℂ) (i : Powers8) : ℂ :=
  ∫ z, conj (monomial8 i z) * F z ∂sourceMeasure8

theorem integrable_coefficient8 {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) (i : Powers8) :
    Integrable (fun z => conj (monomial8 i z) * F z) sourceMeasure8 := by
  exact ((memLp_monomial8 i).star.integrable_mul hF).congr
    (Filter.Eventually.of_forall fun z => rfl)

theorem inner_monomialVector8 {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) (i : Powers8) :
    ⟪monomialVector8 i, hF.toLp F⟫_ℂ = coefficient8 F i :=
  inner_toLp_integral (memLp_monomial8 i) hF

/-- Fock coefficient energies are summable; no summability premise is needed. -/
theorem summable_coefficient8_sq {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    Summable (fun i => ‖coefficient8 F i‖ ^ 2) := by
  simpa only [inner_monomialVector8 hF] using
    orthonormal_monomialVector8.inner_products_summable (hF.toLp F)

/-- Every finite coefficient block is bounded by the actual Gaussian squared norm. -/
theorem finite_coefficient8_sq_le {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) (s : Finset Powers8) :
    (∑ i ∈ s, ‖coefficient8 F i‖ ^ 2) ≤ ∫ z, ‖F z‖ ^ 2 ∂sourceMeasure8 := by
  simpa only [inner_monomialVector8 hF, norm_toLp_sq hF] using
    orthonormal_monomialVector8.sum_inner_products_le (s := s) (hF.toLp F)

/-- The full coefficient norm is bounded by the actual source integral. This
upper-bound direction needs neither a power-series convergence assumption nor
completeness of the holomorphic subspace. -/
theorem tsum_coefficient8_sq_le {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    (∑' i, ‖coefficient8 F i‖ ^ 2) ≤ ∫ z, ‖F z‖ ^ 2 ∂sourceMeasure8 := by
  simpa only [inner_monomialVector8 hF, norm_toLp_sq hF] using
    orthonormal_monomialVector8.tsum_inner_products_le (hF.toLp F)

/-- Reorder outgoing/incoming four-mode indices into physical source pairs:
`((m0,m1),(n0,n1))` becomes `((m0,n0),(m1,n1))`. -/
def matrixIndexEquiv : (Powers4 × Powers4) ≃ Powers8 where
  toFun mn := ((mn.1.1, mn.2.1), (mn.1.2, mn.2.2))
  invFun ij := ((ij.1.1, ij.2.1), (ij.1.2, ij.2.2))
  left_inv := by rintro ⟨⟨a, b⟩, ⟨c, d⟩⟩; rfl
  right_inv := by rintro ⟨⟨a, b⟩, ⟨c, d⟩⟩; rfl

/-- The same bound in the outgoing/incoming matrix-index order. -/
theorem tsum_matrix_coefficient_sq_le {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    (∑' mn : Powers4 × Powers4, ‖coefficient8 F (matrixIndexEquiv mn)‖ ^ 2) ≤
      ∫ z, ‖F z‖ ^ 2 ∂sourceMeasure8 := by
  have ho := orthonormal_monomialVector8.comp matrixIndexEquiv matrixIndexEquiv.injective
  simpa only [Function.comp_apply, inner_monomialVector8 hF, norm_toLp_sq hF] using
    ho.tsum_inner_products_le (hF.toLp F)

/-- Matrix-index coefficient energies are summable as well. -/
theorem summable_matrix_coefficient_sq {F : Sources8 → ℂ}
    (hF : MemLp F 2 sourceMeasure8) :
    Summable (fun mn : Powers4 × Powers4 =>
      ‖coefficient8 F (matrixIndexEquiv mn)‖ ^ 2) := by
  have ho := orthonormal_monomialVector8.comp matrixIndexEquiv matrixIndexEquiv.injective
  simpa only [Function.comp_apply, inner_monomialVector8 hF] using
    ho.inner_products_summable (hF.toLp F)

end
end Grothe.UpperChaos.GaussianFockBessel
