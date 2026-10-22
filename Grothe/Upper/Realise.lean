import Grothe.Upper.Disk
import Grothe.ListPoly

/-!
# Tensor realisation of polynomial preprocessors

Let `P` be a real polynomial with `‖P‖_𝒜 = Σ |Pⱼ| ≤ 1` and `p(t) = t·P(t²)`.  Its physical disk
extension `z ↦ Σⱼ Pⱼ z|z|^{2j} = z · P(|z|²)` (`polyKernel P`) is realised by unit vectors: for unit
`x, y` the vectors

  `L x = (⊕ⱼ √|Pⱼ| · x^{⊗(j+1)} ⊗ x̄^{⊗j}) ⊕ √(1 − ‖P‖_𝒜) e₀`,
  `R y = (⊕ⱼ sgn(Pⱼ) √|Pⱼ| · y^{⊗(j+1)} ⊗ ȳ^{⊗j}) ⊕ √(1 − ‖P‖_𝒜) e₁`

are unit vectors with `⟪L x, R y⟫ = z · P(|z|²)`, `z = ⟪x, y⟫` (`inner_realL_realR`).  Hence
composing a dominated (resp. disk, valid) kernel with `polyKernel P` keeps it dominated (resp.
disk, valid): `DominatedKernel.comp_poly`, `DiskKernel.comp_poly`, `ValidKernel.comp_poly`.

This is the "signed direct sums with weights `√|pₖ|` and orthogonal padding" step of the upper
construction (common-head/PROOF_COMPLETE.md §5), for a single channel.
-/

namespace Grothe

open scoped ComplexConjugate
open Finset Polynomial MeasureTheory

noncomputable section

/-- The physical disk extension of `p(t) = t·P(t²)`: `z ↦ z · P(|z|²) = Σⱼ Pⱼ z|z|^{2j}`. -/
def polyKernel (P : ℝ[X]) (z : ℂ) : ℂ := z * ((P.eval (‖z‖ ^ 2) : ℝ) : ℂ)

lemma polyKernel_eq_sum (P : ℝ[X]) (z : ℂ) :
    polyKernel P z = ∑ j ∈ range (P.natDegree + 1),
      (P.coeff j : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * j)) := by
  rw [polyKernel, eval_eq_sum_range, Complex.ofReal_sum, mul_sum]
  refine sum_congr rfl fun j _ => ?_
  push_cast
  rw [pow_mul]
  ring

/-- Index type of the realisation: the tensor blocks `j < N` and two padding coordinates. -/
abbrev RIdx (ι : Type) (N : ℕ) : Type := (Σ j : Fin N, TIdx ι j) ⊕ Bool

/-- The vector `(⊕ⱼ αⱼ tpow j x) ⊕ (a on true, b on false)`. -/
def realVec {ι : Type} [Fintype ι] (N : ℕ) (α : ℕ → ℂ) (a b : ℂ) (x : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (RIdx ι N) :=
  WithLp.toLp 2 fun
    | Sum.inl q => α q.1 * tpow q.1 x q.2
    | Sum.inr true => a
    | Sum.inr false => b

lemma inner_realVec {ι : Type} [Fintype ι] (N : ℕ) (α β : ℕ → ℂ) (a b a' b' : ℂ)
    (x y : EuclideanSpace ℂ ι) :
    inner ℂ (realVec N α a b x) (realVec N β a' b' y)
      = ∑ j ∈ range N, conj (α j) * β j * inner ℂ (tpow j x) (tpow j y)
        + (conj a * a' + conj b * b') := by
  rw [inner_eq_sum, Fintype.sum_sum_type, Fintype.sum_sigma, Fintype.sum_bool]
  simp only [realVec, PiLp.toLp_apply]
  congr 1
  rw [← Fin.sum_univ_eq_sum_range]
  refine sum_congr rfl fun j _ => ?_
  rw [inner_eq_sum, mul_sum]
  refine sum_congr rfl fun q _ => ?_
  rw [map_mul]
  ring

/-- The sign of a real number (`1` at `0`). -/
def sgn (r : ℝ) : ℝ := if r < 0 then -1 else 1

lemma sgn_mul_abs (r : ℝ) : sgn r * |r| = r := by
  unfold sgn
  split_ifs with h
  · rw [abs_of_neg h]; ring
  · rw [abs_of_nonneg (not_lt.1 h)]; ring

/-- The left realisation vector. -/
def realL {ι : Type} [Fintype ι] (P : ℝ[X]) (x : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (RIdx ι (P.natDegree + 1)) :=
  realVec (P.natDegree + 1) (fun j => ((√|P.coeff j| : ℝ) : ℂ)) 0 ((√(1 - l1 P) : ℝ) : ℂ) x

/-- The right realisation vector. -/
def realR {ι : Type} [Fintype ι] (P : ℝ[X]) (y : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (RIdx ι (P.natDegree + 1)) :=
  realVec (P.natDegree + 1) (fun j => ((sgn (P.coeff j) * √|P.coeff j| : ℝ) : ℂ))
    ((√(1 - l1 P) : ℝ) : ℂ) 0 y

lemma inner_realL_realR {ι : Type} [Fintype ι] (P : ℝ[X]) (x y : EuclideanSpace ℂ ι) :
    inner ℂ (realL P x) (realR P y) = polyKernel P (inner ℂ x y) := by
  rw [realL, realR, inner_realVec, polyKernel_eq_sum]
  simp only [Complex.conj_ofReal, map_zero, zero_mul, mul_zero, add_zero, inner_tpow]
  refine Finset.sum_congr rfl fun j _ => ?_
  have e : Real.sqrt |P.coeff j| * (sgn (P.coeff j) * Real.sqrt |P.coeff j|)
      = (P.coeff j : ℝ) := by
    rw [mul_left_comm, Real.mul_self_sqrt (abs_nonneg _), sgn_mul_abs]
  have e' : ((Real.sqrt |P.coeff j| : ℝ) : ℂ) * ((sgn (P.coeff j) * Real.sqrt |P.coeff j| : ℝ) : ℂ)
      = (P.coeff j : ℂ) := by rw [← Complex.ofReal_mul, e]
  rw [e']

lemma inner_self_realVec_of_unit {ι : Type} [Fintype ι] (P : ℝ[X])
    (w : ℕ → ℝ) (hw : ∀ j, w j ^ 2 = |P.coeff j|) {a b : ℝ} (hab : a ^ 2 + b ^ 2 = 1 - l1 P)
    (x : EuclideanSpace ℂ ι) (hx : ‖x‖ = 1) :
    ‖realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x‖ = 1 := by
  have hxx : inner ℂ x x = (1 : ℂ) := by
    rw [inner_self_eq_norm_sq_to_K, hx]; simp
  have h1 : inner ℂ (realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x)
      (realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x) = 1 := by
    rw [inner_realVec]
    simp only [inner_tpow, hxx, norm_one, Complex.ofReal_one, one_pow, mul_one,
      Complex.conj_ofReal]
    have hs : ∑ j ∈ range (P.natDegree + 1), ((w j : ℝ) : ℂ) * (w j : ℂ)
        = ((l1 P : ℝ) : ℂ) := by
      rw [l1_eq_sum_range P (Nat.lt_succ_self _), Complex.ofReal_sum]
      refine sum_congr rfl fun j _ => ?_
      rw [← hw j]; push_cast; ring
    rw [hs]
    have : ((a : ℂ) * a + (b : ℂ) * b) = ((1 - l1 P : ℝ) : ℂ) := by
      rw [← hab]; push_cast; ring
    rw [this]; push_cast; ring
  have h2 := inner_self_eq_norm_sq_to_K (𝕜 := ℂ)
    (realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x)
  rw [h1] at h2
  have h3 : (‖realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x‖ : ℝ) ^ 2
      = 1 := by
    have h4 : (((‖realVec (P.natDegree + 1) (fun j => ((w j : ℝ) : ℂ)) (a : ℂ) (b : ℂ) x‖ : ℝ)
      ^ 2 : ℝ) : ℂ) = 1 := by rw [h2]; push_cast; rfl
    exact_mod_cast h4
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h3

lemma norm_realL {ι : Type} [Fintype ι] (P : ℝ[X]) (hP : l1 P ≤ 1) (x : EuclideanSpace ℂ ι)
    (hx : ‖x‖ = 1) : ‖realL P x‖ = 1 := by
  have := inner_self_realVec_of_unit P (fun j => √|P.coeff j|)
    (fun j => Real.sq_sqrt (abs_nonneg _)) (a := 0) (b := √(1 - l1 P))
    (by rw [Real.sq_sqrt (by linarith)]; ring) x hx
  simpa [realL] using this

lemma norm_realR {ι : Type} [Fintype ι] (P : ℝ[X]) (hP : l1 P ≤ 1) (y : EuclideanSpace ℂ ι)
    (hy : ‖y‖ = 1) : ‖realR P y‖ = 1 := by
  have := inner_self_realVec_of_unit P (fun j => sgn (P.coeff j) * √|P.coeff j|)
    (fun j => by
      rw [mul_pow, Real.sq_sqrt (abs_nonneg _)]
      unfold sgn; split_ifs <;> ring)
    (a := √(1 - l1 P)) (b := 0) (by rw [Real.sq_sqrt (by linarith)]; ring) y hy
  simpa [realR] using this

/-- **Composition with a preprocessor** keeps a kernel dominated. -/
theorem DominatedKernel.comp_poly {Q : ℂ → ℂ} (hQ : DominatedKernel Q) (P : ℝ[X])
    (hP : l1 P ≤ 1) : DominatedKernel fun z => Q (polyKernel P z) := by
  intro m n A ι _ x y hx hy
  have := hQ m n A (RIdx ι (P.natDegree + 1)) (fun i => realL P (x i)) (fun j => realR P (y j))
    (fun i => norm_realL P hP _ (hx i)) (fun j => norm_realR P hP _ (hy j))
  simpa only [inner_realL_realR] using this

/-- Composition with a preprocessor keeps a disk rounding kernel a disk rounding kernel. -/
theorem DiskKernel.comp_poly {Q : ℂ → ℂ} (hQ : DiskKernel Q) (P : ℝ[X]) (hP : l1 P ≤ 1) :
    DiskKernel fun z => Q (polyKernel P z) := by
  intro m n ι _ x y hx hy
  obtain ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, h5⟩ := hQ m n (RIdx ι (P.natDegree + 1))
    (fun i => realL P (x i)) (fun j => realR P (y j))
    (fun i => norm_realL P hP _ (hx i)) (fun j => norm_realR P hP _ (hy j))
  exact ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, fun i j => by rw [h5, inner_realL_realR]⟩

/-- Composition with a preprocessor keeps a valid rounding kernel valid. -/
theorem ValidKernel.comp_poly {Q : ℂ → ℂ} (hQ : ValidKernel Q) (P : ℝ[X]) (hP : l1 P ≤ 1) :
    ValidKernel fun z => Q (polyKernel P z) := by
  intro m n ι _ x y hx hy
  obtain ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, h5⟩ := hQ m n (RIdx ι (P.natDegree + 1))
    (fun i => realL P (x i)) (fun j => realR P (y j))
    (fun i => norm_realL P hP _ (hx i)) (fun j => norm_realR P hP _ (hy j))
  exact ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, fun i j => by rw [h5, inner_realL_realR]⟩

end

end Grothe
