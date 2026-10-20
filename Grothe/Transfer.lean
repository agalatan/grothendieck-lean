import Mathlib

/-!
# The complex Grothendieck constant and the transfer inequality (1)

We define, for a complex `m × n` matrix `A` (represented as a function `Fin m → Fin n → ℂ`),

* the scalar (phase) optimum `C(A) = sup |∑ aᵢⱼ conj(εᵢ) δⱼ|` over unimodular `ε, δ`;
* the vector optimum `V(A) = sup |∑ aᵢⱼ ⟪xᵢ, yⱼ⟫|` over unit vectors in a finite-dimensional
  complex Hilbert space `EuclideanSpace ℂ ι` (any finite family of vectors in an arbitrary
  Hilbert space spans such a subspace, so this is the usual constant);
* `IsGrothendieckBound K : ∀ A, V(A) ≤ K · C(A)`, i.e. `K_G^ℂ ≤ K`.

Conventions follow Mathlib: the inner product is conjugate-linear in the first slot, so the
one-dimensional case of `⟪xᵢ, yⱼ⟫` is `conj(εᵢ) δⱼ`.  Replacing `ε` by `conj ε` does not change
the supremum, so this agrees with the usual definition.

A *rounding kernel* `Q : ℂ → ℂ` is **dominated** if `|∑ aᵢⱼ Q(⟪xᵢ, yⱼ⟫)| ≤ C(A)` for all unit
families.  A kernel realised by jointly distributed unimodular random variables with
`E[conj(εᵢ) δⱼ] = Q(⟪xᵢ, yⱼ⟫)` (a *valid* kernel) is dominated (`ValidKernel.dominated`).

The main result is the transfer inequality (`transfer`): if the radial kernel
`z ↦ ∑ₙ hₙ z|z|^{2n}` (`radialKernel h`, `∑ |hₙ| < ∞`) is dominated and its residual against `c·z`
satisfies `|h₀ − c| + ∑_{n≥1} |hₙ| ≤ δ < c`, then `K_G^ℂ ≤ 1/(c − δ)`.  The proof realises each
monomial `z|z|^{2n}` as an inner product of unit tensor vectors (`tpow`).
-/

namespace Grothe

open scoped ComplexConjugate
open Finset MeasureTheory

noncomputable section

section Definitions

variable {m n : ℕ}

/-- Attainable scalar values `‖∑ aᵢⱼ conj(εᵢ) δⱼ‖`, `|εᵢ| = |δⱼ| = 1`. -/
def scalarSet (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ε : Fin m → ℂ) (δ : Fin n → ℂ), (∀ i, ‖ε i‖ = 1) ∧ (∀ j, ‖δ j‖ = 1) ∧
    r = ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖}

/-- The scalar optimum `C(A)`. -/
def scalarOpt (A : Fin m → Fin n → ℂ) : ℝ := sSup (scalarSet A)

/-- Attainable vector values `‖∑ aᵢⱼ ⟪xᵢ, yⱼ⟫‖` over unit families in `EuclideanSpace ℂ ι`. -/
def vectorSet (A : Fin m → Fin n → ℂ) : Set ℝ :=
  {r | ∃ (ι : Type) (_ : Fintype ι) (x : Fin m → EuclideanSpace ℂ ι)
      (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) ∧ (∀ j, ‖y j‖ = 1) ∧ r = ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖}

/-- The vector optimum `V(A)`. -/
def vectorOpt (A : Fin m → Fin n → ℂ) : ℝ := sSup (vectorSet A)

/-- `K` is an upper bound for the complex Grothendieck constant: `V(A) ≤ K · C(A)` for all `A`. -/
def IsGrothendieckBound (K : ℝ) : Prop :=
  ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ), vectorOpt A ≤ K * scalarOpt A

lemma scalarSet_bddAbove (A : Fin m → Fin n → ℂ) : BddAbove (scalarSet A) := by
  refine ⟨∑ i, ∑ j, ‖A i j‖, ?_⟩
  rintro r ⟨ε, δ, hε, hδ, rfl⟩
  calc ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖
      ≤ ∑ i, ∑ j, ‖A i j * (conj (ε i) * δ j)‖ :=
        (norm_sum_le _ _).trans (sum_le_sum fun i _ => norm_sum_le _ _)
    _ = ∑ i, ∑ j, ‖A i j‖ := by simp [hε, hδ]

lemma scalarSet_nonempty (A : Fin m → Fin n → ℂ) : (scalarSet A).Nonempty :=
  ⟨_, fun _ => 1, fun _ => 1, fun _ => by simp, fun _ => by simp, rfl⟩

lemma le_scalarOpt (A : Fin m → Fin n → ℂ) {ε : Fin m → ℂ} {δ : Fin n → ℂ}
    (hε : ∀ i, ‖ε i‖ = 1) (hδ : ∀ j, ‖δ j‖ = 1) :
    ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ ≤ scalarOpt A :=
  le_csSup (scalarSet_bddAbove A) ⟨ε, δ, hε, hδ, rfl⟩

lemma scalarOpt_nonneg (A : Fin m → Fin n → ℂ) : 0 ≤ scalarOpt A :=
  Real.sSup_nonneg fun r hr => by
    obtain ⟨ε, δ, _, _, rfl⟩ := hr
    exact norm_nonneg _

lemma vectorSet_bddAbove (A : Fin m → Fin n → ℂ) : BddAbove (vectorSet A) := by
  refine ⟨∑ i, ∑ j, ‖A i j‖, ?_⟩
  rintro r ⟨ι, _, x, y, hx, hy, rfl⟩
  calc ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖
      ≤ ∑ i, ∑ j, ‖A i j * inner ℂ (x i) (y j)‖ :=
        (norm_sum_le _ _).trans (sum_le_sum fun i _ => norm_sum_le _ _)
    _ ≤ ∑ i, ∑ j, ‖A i j‖ := by
        gcongr with i _ j _
        rw [norm_mul]
        calc ‖A i j‖ * ‖inner ℂ (x i) (y j)‖ ≤ ‖A i j‖ * (‖x i‖ * ‖y j‖) :=
              mul_le_mul_of_nonneg_left (norm_inner_le_norm _ _) (norm_nonneg _)
          _ = ‖A i j‖ := by rw [hx, hy]; ring

lemma vectorSet_nonempty (A : Fin m → Fin n → ℂ) : (vectorSet A).Nonempty :=
  ⟨_, Unit, inferInstance, fun _ => EuclideanSpace.single () 1, fun _ => EuclideanSpace.single () 1,
    fun _ => by simp, fun _ => by simp, rfl⟩

lemma le_vectorOpt (A : Fin m → Fin n → ℂ) {ι : Type} [Fintype ι]
    {x : Fin m → EuclideanSpace ℂ ι} {y : Fin n → EuclideanSpace ℂ ι}
    (hx : ∀ i, ‖x i‖ = 1) (hy : ∀ j, ‖y j‖ = 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ vectorOpt A :=
  le_csSup (vectorSet_bddAbove A) ⟨ι, inferInstance, x, y, hx, hy, rfl⟩

lemma vectorOpt_nonneg (A : Fin m → Fin n → ℂ) : 0 ≤ vectorOpt A :=
  Real.sSup_nonneg fun r hr => by
    obtain ⟨_, _, _, _, _, _, rfl⟩ := hr
    exact norm_nonneg _

lemma IsGrothendieckBound.mono {K K' : ℝ} (h : IsGrothendieckBound K) (hK : K ≤ K') :
    IsGrothendieckBound K' := fun m n A =>
  (h m n A).trans (mul_le_mul_of_nonneg_right hK (scalarOpt_nonneg A))

end Definitions

/-! ### Kernels -/

/-- A kernel `Q` is dominated if `‖∑ aᵢⱼ Q(⟪xᵢ, yⱼ⟫)‖ ≤ C(A)` for every matrix and every pair
of unit families. -/
def DominatedKernel (Q : ℂ → ℂ) : Prop :=
  ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ) (ι : Type) [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) → (∀ j, ‖y j‖ = 1) →
    ‖∑ i, ∑ j, A i j * Q (inner ℂ (x i) (y j))‖ ≤ scalarOpt A

/-- A *valid rounding kernel*: for every finite pair of unit families
there are jointly distributed unimodular random variables `ε, δ` on a probability space with
`E[conj(εᵢ) δⱼ] = Q(⟪xᵢ, yⱼ⟫)`. -/
def ValidKernel (Q : ℂ → ℂ) : Prop :=
  ∀ (m n : ℕ) (ι : Type) [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) → (∀ j, ‖y j‖ = 1) →
    ∃ (Ω : Type) (_ : MeasurableSpace Ω) (μ : Measure Ω) (_ : IsProbabilityMeasure μ)
      (ε : Ω → Fin m → ℂ) (δ : Ω → Fin n → ℂ),
      (∀ i, AEStronglyMeasurable (fun ω => ε ω i) μ) ∧
      (∀ j, AEStronglyMeasurable (fun ω => δ ω j) μ) ∧
      (∀ ω i, ‖ε ω i‖ = 1) ∧ (∀ ω j, ‖δ ω j‖ = 1) ∧
      ∀ i j, ∫ ω, conj (ε ω i) * δ ω j ∂μ = Q (inner ℂ (x i) (y j))

/-- Valid kernels are dominated: `|E[∑ aᵢⱼ conj(εᵢ) δⱼ]| ≤ E|∑ aᵢⱼ conj(εᵢ) δⱼ| ≤ C(A)`. -/
theorem ValidKernel.dominated {Q : ℂ → ℂ} (hQ : ValidKernel Q) : DominatedKernel Q := by
  intro m n A ι _ x y hx hy
  obtain ⟨Ω, _, μ, _, ε, δ, hεm, hδm, hε1, hδ1, hint⟩ := hQ m n ι x y hx hy
  have hmeas : ∀ i j, AEStronglyMeasurable (fun ω => conj (ε ω i) * δ ω j) μ := fun i j =>
    (Complex.continuous_conj.comp_aestronglyMeasurable (hεm i)).mul (hδm j)
  have hint' : ∀ i j, Integrable (fun ω => conj (ε ω i) * δ ω j) μ := fun i j =>
    Integrable.mono' (integrable_const (1 : ℝ)) (hmeas i j)
      (Filter.Eventually.of_forall fun ω => by simp [hε1, hδ1])
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
          le_scalarOpt A (fun i => hε1 ω i) (fun j => hδ1 ω j)
    _ = scalarOpt A := by simp

/-! ### Tensor powers realising `z ↦ z |z|^{2n}` -/

/-- Index type of `x^{⊗(n+1)} ⊗ x̄^{⊗n}`. -/
abbrev TIdx (ι : Type) (n : ℕ) : Type := (Fin (n + 1) → ι) × (Fin n → ι)

/-- The unit tensor vector with coordinates `(f, g) ↦ ∏ₖ x(f k) · ∏ₖ conj(x(g k))`. -/
def tpow {ι : Type} [Fintype ι] (n : ℕ) (x : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (TIdx ι n) :=
  WithLp.toLp 2 fun p => (∏ k, x (p.1 k)) * ∏ k, conj (x (p.2 k))

lemma tpow_apply {ι : Type} [Fintype ι] (n : ℕ) (x : EuclideanSpace ℂ ι) (p : TIdx ι n) :
    tpow n x p = (∏ k, x (p.1 k)) * ∏ k, conj (x (p.2 k)) := rfl

/-- `∑_{f : Fin k → ι} ∏ᵢ φ(f i) = (∑ₐ φ a)^k`. -/
lemma sum_pi_prod {ι : Type} [Fintype ι] (k : ℕ) (φ : ι → ℂ) :
    ∑ f : Fin k → ι, ∏ i, φ (f i) = (∑ a, φ a) ^ k := by
  classical
  rw [← Fintype.piFinset_univ, ← Finset.prod_univ_sum]
  simp

lemma inner_eq_sum {ι : Type} [Fintype ι] (x y : EuclideanSpace ℂ ι) :
    inner ℂ x y = ∑ a, conj (x a) * y a := by
  simp only [PiLp.inner_apply, RCLike.inner_apply']

/-- The key identity `⟪tpow n x, tpow n y⟫ = ⟪x, y⟫ · ‖⟪x, y⟫‖^{2n}`. -/
theorem inner_tpow {ι : Type} [Fintype ι] (n : ℕ) (x y : EuclideanSpace ℂ ι) :
    inner ℂ (tpow n x) (tpow n y)
      = inner ℂ x y * ((‖inner ℂ x y‖ : ℝ) : ℂ) ^ (2 * n) := by
  rw [inner_eq_sum]
  simp only [tpow_apply]
  rw [Fintype.sum_prod_type]
  have hterm : ∀ (f : Fin (n + 1) → ι) (g : Fin n → ι),
      conj ((∏ k, x (f k)) * ∏ k, conj (x (g k))) * ((∏ k, y (f k)) * ∏ k, conj (y (g k)))
        = (∏ k, conj (x (f k)) * y (f k)) * ∏ k, x (g k) * conj (y (g k)) := by
    intro f g
    simp only [map_mul, map_prod, Complex.conj_conj, Finset.prod_mul_distrib]
    ring
  simp_rw [hterm]
  rw [← Finset.sum_mul_sum]
  have hs1 := sum_pi_prod (n + 1) (fun a => conj (x a) * y a)
  have hs2 := sum_pi_prod n (fun a => x a * conj (y a))
  simp only at hs1 hs2
  rw [hs1, hs2]
  have hz : ∑ a, x a * conj (y a) = conj (inner ℂ x y) := by
    rw [inner_eq_sum, map_sum]
    refine sum_congr rfl fun a _ => ?_
    simp only [map_mul, Complex.conj_conj]
  rw [hz, ← inner_eq_sum]
  have hmc : inner ℂ x y * conj (inner ℂ x y) = ((‖inner ℂ x y‖ : ℝ) : ℂ) ^ 2 :=
    Complex.mul_conj' _
  calc inner ℂ x y ^ (n + 1) * conj (inner ℂ x y) ^ n
      = inner ℂ x y * (inner ℂ x y * conj (inner ℂ x y)) ^ n := by ring
    _ = inner ℂ x y * ((‖inner ℂ x y‖ : ℝ) : ℂ) ^ (2 * n) := by rw [hmc, ← pow_mul]

/-- Tensor vectors of unit vectors are unit vectors. -/
theorem norm_tpow {ι : Type} [Fintype ι] (n : ℕ) (x : EuclideanSpace ℂ ι) (hx : ‖x‖ = 1) :
    ‖tpow n x‖ = 1 := by
  have h1 : inner ℂ (tpow n x) (tpow n x) = ((‖tpow n x‖ : ℝ) : ℂ) ^ 2 :=
    inner_self_eq_norm_sq_to_K (tpow n x)
  have h2 : inner ℂ x x = ((‖x‖ : ℝ) : ℂ) ^ 2 := inner_self_eq_norm_sq_to_K x
  rw [inner_tpow, h2, hx] at h1
  simp only [Complex.ofReal_one, one_pow, norm_one, mul_one] at h1
  have h3 : (‖tpow n x‖ : ℝ) ^ 2 = 1 := by exact_mod_cast h1.symm
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h3

/-- Each tensor-power value `∑ aᵢⱼ zᵢⱼ |zᵢⱼ|^{2n}` is bounded by `V(A)`. -/
theorem norm_tensor_value_le {m n : ℕ} (A : Fin m → Fin n → ℂ) {ι : Type} [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι)
    (hx : ∀ i, ‖x i‖ = 1) (hy : ∀ j, ‖y j‖ = 1) (k : ℕ) :
    ‖∑ i, ∑ j, A i j * (inner ℂ (x i) (y j) * ((‖inner ℂ (x i) (y j)‖ : ℝ) : ℂ) ^ (2 * k))‖
      ≤ vectorOpt A := by
  have := le_vectorOpt A (x := fun i => tpow k (x i)) (y := fun j => tpow k (y j))
    (fun i => norm_tpow k (x i) (hx i)) (fun j => norm_tpow k (y j) (hy j))
  simpa only [inner_tpow] using this

/-! ### The transfer inequality -/

/-- The radial kernel with coefficient sequence `h`: `z ↦ ∑ₙ hₙ z |z|^{2n}`. -/
def radialKernel (h : ℕ → ℝ) (z : ℂ) : ℂ :=
  ∑' n, (h n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))

/-- **Transfer inequality.**  If the radial kernel `z ↦ ∑ₙ hₙ z|z|^{2n}` (with `∑|hₙ| < ∞`) is
dominated and its residual against the linear kernel `c·z` has coefficient norm
`|h₀ − c| + ∑_{n ≥ 1} |hₙ| ≤ δ < c`, then `K_G^ℂ ≤ 1/(c − δ)`.

For unit families `x, y` let `Bₖ = ∑ aᵢⱼ zᵢⱼ|zᵢⱼ|^{2k}`, `zᵢⱼ = ⟪xᵢ, yⱼ⟫`; then `‖Bₖ‖ ≤ V(A)`
(tensor powers), `‖∑ₖ hₖ Bₖ‖ ≤ C(A)` (domination), and
`c B₀ = ∑ₖ hₖ Bₖ − (h₀ − c) B₀ − ∑_{k ≥ 1} hₖ Bₖ` gives `c‖B₀‖ ≤ C(A) + δ V(A)`. -/
theorem transfer (h : ℕ → ℝ) (hs : Summable fun n => |h n|)
    (hdom : DominatedKernel (radialKernel h)) {c δ : ℝ} (hδ : δ < c)
    (hres : |h 0 - c| + ∑' n, |h (n + 1)| ≤ δ) : IsGrothendieckBound (1 / (c - δ)) := by
  intro m n A
  have hs1 : Summable fun n => |h (n + 1)| := (summable_nat_add_iff 1).mpr hs
  have hδ0 : 0 ≤ δ := le_trans (add_nonneg (abs_nonneg _) (tsum_nonneg fun _ => abs_nonneg _)) hres
  have hc0 : 0 < c := hδ0.trans_lt hδ
  have hV0 := vectorOpt_nonneg A
  have key : ∀ r ∈ vectorSet A, c * r ≤ scalarOpt A + δ * vectorOpt A := by
    rintro r ⟨ι, _, x, y, hx, hy, rfl⟩
    obtain ⟨B, hB⟩ : ∃ B : ℕ → ℂ, ∀ k, B k =
        ∑ i, ∑ j, A i j * (inner ℂ (x i) (y j) * ((‖inner ℂ (x i) (y j)‖ : ℝ) : ℂ) ^ (2 * k)) :=
      ⟨_, fun _ => rfl⟩
    have hBle : ∀ k, ‖B k‖ ≤ vectorOpt A := fun k => by
      rw [hB]; exact norm_tensor_value_le A x y hx hy k
    have hB0 : B 0 = ∑ i, ∑ j, A i j * inner ℂ (x i) (y j) := by simp [hB]
    -- the kernel value is `∑ₖ hₖ Bₖ`
    have hsum : HasSum (fun k => (h k : ℂ) * B k)
        (∑ i, ∑ j, A i j * radialKernel h (inner ℂ (x i) (y j))) := by
      have hterm : ∀ i j, HasSum (fun k => A i j * ((h k : ℂ) *
          (inner ℂ (x i) (y j) * ((‖inner ℂ (x i) (y j)‖ : ℝ) : ℂ) ^ (2 * k))))
          (A i j * radialKernel h (inner ℂ (x i) (y j))) := fun i j => by
        refine (Summable.hasSum (Summable.of_norm_bounded hs fun k => ?_)).mul_left (A i j)
        have hz : ‖inner ℂ (x i) (y j)‖ ≤ 1 := by
          simpa [hx, hy] using norm_inner_le_norm (𝕜 := ℂ) (x i) (y j)
        rw [norm_mul, norm_mul, norm_pow, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
          Real.norm_eq_abs, abs_norm]
        rw [← pow_succ']
        exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ (norm_nonneg _) hz)
      convert hasSum_sum fun i _ => hasSum_sum fun j _ => hterm i j using 1
      funext k
      simp only [hB, Finset.mul_sum]
      exact sum_congr rfl fun i _ => sum_congr rfl fun j _ => by ring
    have hdk := hdom m n A ι x y hx hy
    rw [← hsum.tsum_eq, hsum.summable.tsum_eq_zero_add] at hdk
    have htail : ‖∑' k, (h (k + 1) : ℂ) * B (k + 1)‖ ≤ (∑' k, |h (k + 1)|) * vectorOpt A :=
      tsum_of_norm_bounded (hs1.hasSum.mul_right _) fun k => by
        rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
        exact mul_le_mul_of_nonneg_left (hBle _) (abs_nonneg _)
    have h0 : ‖((h 0 - c : ℝ) : ℂ) * B 0‖ ≤ |h 0 - c| * vectorOpt A := by
      rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
      exact mul_le_mul_of_nonneg_left (hBle 0) (abs_nonneg _)
    have e : (c : ℂ) * B 0 = ((h 0 : ℂ) * B 0 + ∑' k, (h (k + 1) : ℂ) * B (k + 1))
        - ((h 0 - c : ℝ) : ℂ) * B 0 - ∑' k, (h (k + 1) : ℂ) * B (k + 1) := by push_cast; ring
    have hcB : ‖(c : ℂ) * B 0‖ = c * ‖B 0‖ := by
      rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg hc0.le]
    rw [← hB0, ← hcB, e]
    refine (norm_sub_le _ _).trans ((add_le_add (norm_sub_le _ _) htail).trans ?_)
    nlinarith [add_le_add (add_le_add hdk h0) htail]
  have hV : c * vectorOpt A ≤ scalarOpt A + δ * vectorOpt A := by
    have : vectorOpt A ≤ (scalarOpt A + δ * vectorOpt A) / c :=
      csSup_le (vectorSet_nonempty A) fun r hr => by
        rw [le_div_iff₀ hc0]; linarith [key r hr]
    rwa [le_div_iff₀ hc0, mul_comm] at this
  rw [one_div_mul_eq_div, le_div_iff₀ (sub_pos.2 hδ)]
  nlinarith

end

end Grothe
