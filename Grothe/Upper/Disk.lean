import Grothe.Transfer

/-!
# Disk-valued roundings are dominated

A smoothed rounding `G(x) = 𝔼 F(Mx + √(I − M²) Z)` takes values in the closed unit disk, not on the
circle.  Such roundings still give dominated kernels: a pairing `∑ aᵢⱼ conj(εᵢ) δⱼ` with
`|εᵢ|, |δⱼ| ≤ 1` is at most the scalar optimum `C(A)` (`norm_pairing_le_scalarOpt`), because
the pairing is (conjugate-)linear in each side and its modulus is maximised by the phases of the
coefficients.

* `DiskKernel Q`: for every pair of finite unit families there are jointly distributed random
  variables with values in the closed unit disk and `𝔼[conj(εᵢ) δⱼ] = Q(⟪xᵢ, yⱼ⟫)`;
* `DiskKernel.dominated`, `ValidKernel.diskKernel`.
-/

namespace Grothe

open scoped ComplexConjugate
open Finset MeasureTheory

noncomputable section

/-- The phase of a complex number (`1` at `0`). -/
def phaseOf (b : ℂ) : ℂ := if b = 0 then 1 else b / ((‖b‖ : ℝ) : ℂ)

lemma norm_phaseOf (b : ℂ) : ‖phaseOf b‖ = 1 := by
  unfold phaseOf
  split_ifs with h
  · simp
  · rw [norm_div, Complex.norm_real, Real.norm_of_nonneg (norm_nonneg _),
      div_self (norm_ne_zero_iff.2 h)]

lemma conj_phaseOf_mul (b : ℂ) : conj (phaseOf b) * b = ((‖b‖ : ℝ) : ℂ) := by
  unfold phaseOf
  split_ifs with h
  · simp [h]
  · have hn : ((‖b‖ : ℝ) : ℂ) ≠ 0 := by exact_mod_cast norm_ne_zero_iff.2 h
    rw [map_div₀, Complex.conj_ofReal]
    field_simp
    rw [mul_comm, Complex.mul_conj', sq]

/-- `|∑ conj(εᵢ) bᵢ| ≤ ∑ |bᵢ|` for disk-valued `ε`. -/
lemma norm_sum_conj_mul_le {ι : Type*} (s : Finset ι) (ε b : ι → ℂ) (hε : ∀ i, ‖ε i‖ ≤ 1) :
    ‖∑ i ∈ s, conj (ε i) * b i‖ ≤ ∑ i ∈ s, ‖b i‖ :=
  (norm_sum_le _ _).trans (sum_le_sum fun i _ => by
    rw [norm_mul, Complex.norm_conj]
    exact mul_le_of_le_one_left (norm_nonneg _) (hε i))

/-- `∑ |bᵢ| = |∑ conj(phase bᵢ) bᵢ|`. -/
lemma sum_norm_eq {ι : Type*} (s : Finset ι) (b : ι → ℂ) :
    ∑ i ∈ s, ‖b i‖ = ‖∑ i ∈ s, conj (phaseOf (b i)) * b i‖ := by
  simp only [conj_phaseOf_mul]
  rw [← Complex.ofReal_sum, Complex.norm_real, Real.norm_of_nonneg
    (sum_nonneg fun i _ => norm_nonneg _)]

variable {m n : ℕ}

/-- Disk-valued left side, unimodular right side. -/
lemma norm_pairing_le_scalarOpt_left (A : Fin m → Fin n → ℂ) {ε : Fin m → ℂ} {δ : Fin n → ℂ}
    (hε : ∀ i, ‖ε i‖ ≤ 1) (hδ : ∀ j, ‖δ j‖ = 1) :
    ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ ≤ scalarOpt A := by
  have e : ∀ e : Fin m → ℂ, ∑ i, ∑ j, A i j * (conj (e i) * δ j)
      = ∑ i, conj (e i) * ∑ j, A i j * δ j := fun e => by
    refine sum_congr rfl fun i _ => ?_
    rw [mul_sum]
    exact sum_congr rfl fun j _ => by ring
  rw [e]
  refine (norm_sum_conj_mul_le _ _ _ hε).trans ?_
  rw [sum_norm_eq, ← e]
  exact le_scalarOpt A (fun i => norm_phaseOf _) hδ

/-- **Disk-valued pairings are at most the scalar optimum**: `|∑ aᵢⱼ conj(εᵢ) δⱼ| ≤ C(A)` when
`|εᵢ|, |δⱼ| ≤ 1`. -/
theorem norm_pairing_le_scalarOpt (A : Fin m → Fin n → ℂ) {ε : Fin m → ℂ} {δ : Fin n → ℂ}
    (hε : ∀ i, ‖ε i‖ ≤ 1) (hδ : ∀ j, ‖δ j‖ ≤ 1) :
    ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ ≤ scalarOpt A := by
  -- the pairing is `∑ⱼ conj(conj δⱼ) cⱼ` with `cⱼ = ∑ᵢ aᵢⱼ conj εᵢ`
  have e : ∀ d : Fin n → ℂ, ∑ i, ∑ j, A i j * (conj (ε i) * d j)
      = ∑ j, conj (conj (d j)) * ∑ i, A i j * conj (ε i) := fun d => by
    rw [sum_comm]
    refine sum_congr rfl fun j _ => ?_
    rw [Complex.conj_conj, mul_sum]
    exact sum_congr rfl fun i _ => by ring
  rw [e]
  refine (norm_sum_conj_mul_le _ (fun j => conj (δ j)) _ fun j => by
    rw [Complex.norm_conj]; exact hδ j).trans ?_
  rw [sum_norm_eq]
  have e' := e fun j => conj (phaseOf (∑ i, A i j * conj (ε i)))
  simp only [Complex.conj_conj] at e'
  rw [← e']
  exact norm_pairing_le_scalarOpt_left A hε fun j => by
    rw [Complex.norm_conj]; exact norm_phaseOf _

/-- A *disk rounding kernel*: for every finite pair of unit families there are jointly distributed
random variables with values in the closed unit disk and `𝔼[conj(εᵢ) δⱼ] = Q(⟪xᵢ, yⱼ⟫)`. -/
def DiskKernel (Q : ℂ → ℂ) : Prop :=
  ∀ (m n : ℕ) (ι : Type) [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) → (∀ j, ‖y j‖ = 1) →
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
      (ε : Ω → Fin m → ℂ) (δ : Ω → Fin n → ℂ),
      (∀ i, AEStronglyMeasurable (fun ω => ε ω i) μ) ∧
      (∀ j, AEStronglyMeasurable (fun ω => δ ω j) μ) ∧
      (∀ ω i, ‖ε ω i‖ ≤ 1) ∧ (∀ ω j, ‖δ ω j‖ ≤ 1) ∧
      ∀ i j, ∫ ω, conj (ε ω i) * δ ω j ∂μ = Q (inner ℂ (x i) (y j))

theorem ValidKernel.diskKernel {Q : ℂ → ℂ} (hQ : ValidKernel Q) : DiskKernel Q := by
  intro m n ι _ x y hx hy
  obtain ⟨Ω, _, μ, hμ, ε, δ, h1, h2, h3, h4, h5⟩ := hQ m n ι x y hx hy
  exact ⟨Ω, _, μ, hμ, ε, δ, h1, h2, fun ω i => (h3 ω i).le, fun ω j => (h4 ω j).le, h5⟩

/-- Disk rounding kernels are dominated. -/
theorem DiskKernel.dominated {Q : ℂ → ℂ} (hQ : DiskKernel Q) : DominatedKernel Q := by
  intro m n A ι _ x y hx hy
  obtain ⟨Ω, _, μ, _, ε, δ, hεm, hδm, hε1, hδ1, hint⟩ := hQ m n ι x y hx hy
  have hmeas : ∀ i j, AEStronglyMeasurable (fun ω => conj (ε ω i) * δ ω j) μ := fun i j =>
    (Complex.continuous_conj.comp_aestronglyMeasurable (hεm i)).mul (hδm j)
  have hint' : ∀ i j, Integrable (fun ω => conj (ε ω i) * δ ω j) μ := fun i j =>
    Integrable.mono' (integrable_const (1 : ℝ)) (hmeas i j)
      (Filter.Eventually.of_forall fun ω => by
        rw [norm_mul, Complex.norm_conj]
        exact (mul_le_mul (hε1 ω i) (hδ1 ω j) (norm_nonneg _) zero_le_one).trans (one_mul 1).le)
  have e : ∫ ω, ∑ i, ∑ j, A i j * (conj (ε ω i) * δ ω j) ∂μ
      = ∑ i, ∑ j, A i j * Q (inner ℂ (x i) (y j)) := by
    rw [integral_finsetSum _ fun i _ => integrable_finsetSum _ fun j _ => (hint' i j).const_mul _]
    refine sum_congr rfl fun i _ => ?_
    rw [integral_finsetSum _ fun j _ => (hint' i j).const_mul _]
    refine sum_congr rfl fun j _ => ?_
    rw [integral_const_mul, hint]
  rw [← e]
  calc ‖∫ ω, ∑ i, ∑ j, A i j * (conj (ε ω i) * δ ω j) ∂μ‖
      ≤ ∫ ω, ‖∑ i, ∑ j, A i j * (conj (ε ω i) * δ ω j)‖ ∂μ := norm_integral_le_integral_norm _
    _ ≤ ∫ _ω, scalarOpt A ∂μ := by
        apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun ω => norm_nonneg _)
          (integrable_const _)
        exact Filter.Eventually.of_forall fun ω =>
          norm_pairing_le_scalarOpt A (fun i => hε1 ω i) (fun j => hδ1 ω j)
    _ = scalarOpt A := by simp

end

end Grothe
