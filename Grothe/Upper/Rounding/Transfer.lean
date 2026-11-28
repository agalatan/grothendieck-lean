import Grothe.Upper.Optima
import Grothe.Upper.Kernel.Table
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Order.Field.GeomSum
import Mathlib.Topology.Algebra.InfiniteSum.Real

set_option warningAsError true

/-!
# Transfer inequality, Hardy tail, bivariate composition, and interval-head soundness

Self-contained development connecting unimodular rounding kernels to upper bounds on the complex
Grothendieck constant `Grothe.Upper.Optima.complexGrothendieckConstant`:

1. **Domination and tensor powers**: valid unimodular kernels are dominated (`ValidKernel.dominated`),
   monomials `z |z|^{2n}` are realised by unit tensor powers (`inner_tpow`, `norm_tpow`), and
   `transfer` bounds `IsBound (1 / (c - δ))` from the `ℓ¹` residual of `radialKernel h` against `c z`.
2. **Residual split and Hardy tail**: `residual_split`, `hardy_budget_after_linear`, and `hardy_tail`
   bound the tail `∑_{n > K} |hₙ|` by Cauchy–Schwarz from a circle mean-square budget at radius `r > 1`.
3. **Wiener `ℓ¹` algebra and bivariate kernels**: `l1`, `termOf`, `bivarKernel`, `bivarKernel_eq_head`,
   and `onedTable` (`bivarKernel_oned_eq_head`).
4. **128-bit interval soundness and multi-channel transfer**: `mem`, `memB`, `memB_bivarT_real`, and
   `convex_transfer_ival` (which certifies a convex combination of channels directly from interval
   head enclosures + Hardy tail bounds).

Agent-ID: gemini-21d5
-/

namespace Grothe.Upper

open scoped ComplexConjugate
open Finset MeasureTheory Polynomial Grothe.Upper.Optima Grothe.Upper.Kernel

noncomputable section

/-! ### 1. Basic optimum lemmas and dominated kernels -/

section Optima

variable {m n : ℕ}

lemma scalarValues_bddAbove (A : Fin m → Fin n → ℂ) : BddAbove (scalarValues A) := by
  refine ⟨∑ i, ∑ j, ‖A i j‖, ?_⟩
  rintro r ⟨ε, δ, hε, hδ, rfl⟩
  calc ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖
      ≤ ∑ i, ∑ j, ‖A i j * (conj (ε i) * δ j)‖ :=
        (norm_sum_le _ _).trans (sum_le_sum fun i _ => norm_sum_le _ _)
    _ = ∑ i, ∑ j, ‖A i j‖ := by simp [hε, hδ]

lemma le_scalarOpt (A : Fin m → Fin n → ℂ) {ε : Fin m → ℂ} {δ : Fin n → ℂ}
    (hε : ∀ i, ‖ε i‖ = 1) (hδ : ∀ j, ‖δ j‖ = 1) :
    ‖∑ i, ∑ j, A i j * (conj (ε i) * δ j)‖ ≤ scalarOpt A :=
  le_csSup (scalarValues_bddAbove A) ⟨ε, δ, hε, hδ, rfl⟩

lemma vectorValues_bddAbove (A : Fin m → Fin n → ℂ) : BddAbove (vectorValues A) := by
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

lemma vectorValues_nonempty (A : Fin m → Fin n → ℂ) : (vectorValues A).Nonempty :=
  ⟨_, Unit, inferInstance, fun _ => EuclideanSpace.single () 1, fun _ => EuclideanSpace.single () 1,
    fun _ => by simp, fun _ => by simp, rfl⟩

lemma le_vectorOpt (A : Fin m → Fin n → ℂ) {ι : Type} [Fintype ι]
    {x : Fin m → EuclideanSpace ℂ ι} {y : Fin n → EuclideanSpace ℂ ι}
    (hx : ∀ i, ‖x i‖ = 1) (hy : ∀ j, ‖y j‖ = 1) :
    ‖∑ i, ∑ j, A i j * inner ℂ (x i) (y j)‖ ≤ vectorOpt A :=
  le_csSup (vectorValues_bddAbove A) ⟨ι, inferInstance, x, y, hx, hy, rfl⟩

lemma vectorOpt_nonneg (A : Fin m → Fin n → ℂ) : 0 ≤ vectorOpt A :=
  Real.sSup_nonneg fun _ ⟨_, _, _, _, _, _, hr⟩ => hr ▸ norm_nonneg _

end Optima

/-- A kernel `Q : ℂ → ℂ` is dominated if `‖∑ᵢⱼ aᵢⱼ Q(⟪xᵢ, yⱼ⟫)‖ ≤ scalarOpt A` on unit vectors. -/
def DominatedKernel (Q : ℂ → ℂ) : Prop :=
  ∀ (m n : ℕ) (A : Fin m → Fin n → ℂ) (ι : Type) [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι),
    (∀ i, ‖x i‖ = 1) → (∀ j, ‖y j‖ = 1) →
    ‖∑ i, ∑ j, A i j * Q (inner ℂ (x i) (y j))‖ ≤ scalarOpt A

/-- A kernel realised by jointly distributed unimodular random variables `E[conj(εᵢ) δⱼ] = Q(⟪xᵢ, yⱼ⟫)`. -/
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
        apply integral_mono_of_nonneg (Filter.Eventually.of_forall fun _ => norm_nonneg _)
          (integrable_const _)
        exact Filter.Eventually.of_forall fun ω =>
          le_scalarOpt A (fun i => hε1 ω i) (fun j => hδ1 ω j)
    _ = scalarOpt A := by simp

theorem dominatedKernel_congr_ball {Q Q' : ℂ → ℂ} (hQ : DominatedKernel Q)
    (heq : ∀ z : ℂ, ‖z‖ ≤ 1 → Q z = Q' z) : DominatedKernel Q' := by
  intro m n A ι _ x y hx hy
  have hpt : ∀ i j, Q' (inner ℂ (x i) (y j)) = Q (inner ℂ (x i) (y j)) := fun i j =>
    (heq _ ((norm_inner_le_norm (x i) (y j)).trans_eq (by rw [hx i, hy j, mul_one]))).symm
  simp_rw [hpt]
  exact hQ m n A ι x y hx hy

theorem dominatedKernel_convex_comb {k : ℕ} {Q : Fin k → ℂ → ℂ} {w : Fin k → ℝ}
    (hw0 : ∀ p, 0 ≤ w p) (hw1 : ∑ p, w p = 1) (hQ : ∀ p, DominatedKernel (Q p)) :
    DominatedKernel (fun z => ∑ p, (w p : ℂ) * Q p z) := by
  intro m n A ι _ x y hx hy
  have hswap : ∑ i, ∑ j, A i j * (∑ p, (w p : ℂ) * Q p (inner ℂ (x i) (y j)))
      = ∑ p, (w p : ℂ) * ∑ i, ∑ j, A i j * Q p (inner ℂ (x i) (y j)) := by
    calc ∑ i, ∑ j, A i j * ∑ p, (w p : ℂ) * Q p (inner ℂ (x i) (y j))
        = ∑ i, ∑ p, (w p : ℂ) * ∑ j, A i j * Q p (inner ℂ (x i) (y j)) := by
          refine sum_congr rfl fun i _ => ?_
          calc ∑ j, A i j * ∑ p, (w p : ℂ) * Q p (inner ℂ (x i) (y j))
              = ∑ j, ∑ p, A i j * ((w p : ℂ) * Q p (inner ℂ (x i) (y j))) :=
                sum_congr rfl fun _ _ => mul_sum _ _ _
            _ = ∑ p, ∑ j, A i j * ((w p : ℂ) * Q p (inner ℂ (x i) (y j))) := sum_comm
            _ = ∑ p, (w p : ℂ) * ∑ j, A i j * Q p (inner ℂ (x i) (y j)) :=
                sum_congr rfl fun _ _ => by rw [mul_sum]; exact sum_congr rfl fun _ _ => by ring
      _ = ∑ p, ∑ i, (w p : ℂ) * ∑ j, A i j * Q p (inner ℂ (x i) (y j)) := sum_comm
      _ = ∑ p, (w p : ℂ) * ∑ i, ∑ j, A i j * Q p (inner ℂ (x i) (y j)) :=
          sum_congr rfl fun _ _ => (mul_sum _ _ _).symm
  rw [hswap]
  calc ‖∑ p, (w p : ℂ) * ∑ i, ∑ j, A i j * Q p (inner ℂ (x i) (y j))‖
      ≤ ∑ p, ‖(w p : ℂ) * ∑ i, ∑ j, A i j * Q p (inner ℂ (x i) (y j))‖ := norm_sum_le _ _
    _ = ∑ p, w p * ‖∑ i, ∑ j, A i j * Q p (inner ℂ (x i) (y j))‖ :=
        sum_congr rfl fun p _ => by rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg (hw0 p)]
    _ ≤ ∑ p, w p * scalarOpt A :=
        sum_le_sum fun p _ => mul_le_mul_of_nonneg_left (hQ p m n A ι x y hx hy) (hw0 p)
    _ = (∑ p, w p) * scalarOpt A := (sum_mul _ _ _).symm
    _ = scalarOpt A := by rw [hw1, one_mul]

/-! ### 2. Tensor powers and the single-channel transfer inequality -/

abbrev TIdx (ι : Type) (n : ℕ) : Type := (Fin (n + 1) → ι) × (Fin n → ι)

def tpow {ι : Type} [Fintype ι] (n : ℕ) (x : EuclideanSpace ℂ ι) :
    EuclideanSpace ℂ (TIdx ι n) :=
  WithLp.toLp 2 fun p => (∏ k, x (p.1 k)) * ∏ k, conj (x (p.2 k))

private lemma sum_pi_prod {ι : Type} [Fintype ι] (k : ℕ) (φ : ι → ℂ) :
    ∑ f : Fin k → ι, ∏ i, φ (f i) = (∑ a, φ a) ^ k := by
  classical
  rw [← Fintype.piFinset_univ, ← Finset.prod_univ_sum]
  simp

private lemma inner_eq_sum {ι : Type} [Fintype ι] (x y : EuclideanSpace ℂ ι) :
    inner ℂ x y = ∑ a, conj (x a) * y a := by
  simp only [PiLp.inner_apply, RCLike.inner_apply']

theorem inner_tpow {ι : Type} [Fintype ι] (n : ℕ) (x y : EuclideanSpace ℂ ι) :
    inner ℂ (tpow n x) (tpow n y) = inner ℂ x y * ((‖inner ℂ x y‖ : ℝ) : ℂ) ^ (2 * n) := by
  rw [inner_eq_sum]
  change ∑ p : TIdx ι n, conj ((∏ k, x (p.1 k)) * ∏ k, conj (x (p.2 k))) *
      ((∏ k, y (p.1 k)) * ∏ k, conj (y (p.2 k))) = _
  rw [Fintype.sum_prod_type]
  have hterm : ∀ (f : Fin (n + 1) → ι) (g : Fin n → ι),
      conj ((∏ k, x (f k)) * ∏ k, conj (x (g k))) * ((∏ k, y (f k)) * ∏ k, conj (y (g k)))
        = (∏ k, conj (x (f k)) * y (f k)) * ∏ k, x (g k) * conj (y (g k)) := fun _ _ => by
    simp only [map_mul, map_prod, Complex.conj_conj, Finset.prod_mul_distrib]; ring
  simp_rw [hterm]
  have hs1 := sum_pi_prod (n + 1) (fun a => conj (x a) * y a)
  have hs2 := sum_pi_prod n (fun a => x a * conj (y a))
  simp only at hs1 hs2
  rw [← Finset.sum_mul_sum, hs1, hs2]
  have hz : ∑ a, x a * conj (y a) = conj (inner ℂ x y) := by
    rw [inner_eq_sum, map_sum]
    exact sum_congr rfl fun _ _ => by simp only [map_mul, Complex.conj_conj]
  rw [hz, ← inner_eq_sum]
  calc inner ℂ x y ^ (n + 1) * conj (inner ℂ x y) ^ n
      = inner ℂ x y * (inner ℂ x y * conj (inner ℂ x y)) ^ n := by ring
    _ = inner ℂ x y * ((‖inner ℂ x y‖ : ℝ) : ℂ) ^ (2 * n) := by
        rw [Complex.mul_conj', ← pow_mul]

theorem norm_tpow {ι : Type} [Fintype ι] (n : ℕ) (x : EuclideanSpace ℂ ι) (hx : ‖x‖ = 1) :
    ‖tpow n x‖ = 1 := by
  have h1 : inner ℂ (tpow n x) (tpow n x) = ((‖tpow n x‖ : ℝ) : ℂ) ^ 2 :=
    inner_self_eq_norm_sq_to_K (tpow n x)
  have h2 : inner ℂ x x = ((‖x‖ : ℝ) : ℂ) ^ 2 := inner_self_eq_norm_sq_to_K x
  rw [inner_tpow, h2, hx] at h1
  simp only [Complex.ofReal_one, one_pow, norm_one, mul_one] at h1
  have h3 : (‖tpow n x‖ : ℝ) ^ 2 = 1 := by exact_mod_cast h1.symm
  exact (pow_eq_one_iff_of_nonneg (norm_nonneg _) two_ne_zero).1 h3

theorem norm_tensor_value_le {m n : ℕ} (A : Fin m → Fin n → ℂ) {ι : Type} [Fintype ι]
    (x : Fin m → EuclideanSpace ℂ ι) (y : Fin n → EuclideanSpace ℂ ι)
    (hx : ∀ i, ‖x i‖ = 1) (hy : ∀ j, ‖y j‖ = 1) (k : ℕ) :
    ‖∑ i, ∑ j, A i j * (inner ℂ (x i) (y j) * ((‖inner ℂ (x i) (y j)‖ : ℝ) : ℂ) ^ (2 * k))‖
      ≤ vectorOpt A := by
  simpa only [inner_tpow] using le_vectorOpt A
    (x := fun i => tpow k (x i)) (y := fun j => tpow k (y j))
    (fun i => norm_tpow k (x i) (hx i)) (fun j => norm_tpow k (y j) (hy j))

/-- Radial kernel `z ↦ ∑' n, hₙ z |z|^{2n}`. -/
def radialKernel (h : ℕ → ℝ) (z : ℂ) : ℂ :=
  ∑' n, (h n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))

theorem transfer (h : ℕ → ℝ) (hs : Summable fun n => |h n|)
    (hdom : DominatedKernel (radialKernel h)) {c δ : ℝ} (hδ : δ < c)
    (hres : |h 0 - c| + ∑' n, |h (n + 1)| ≤ δ) : IsBound (1 / (c - δ)) := by
  intro m n A
  have hs1 : Summable fun n => |h (n + 1)| := (summable_nat_add_iff 1).mpr hs
  have hδ0 : 0 ≤ δ := le_trans (add_nonneg (abs_nonneg _) (tsum_nonneg fun _ => abs_nonneg _)) hres
  have hc0 : 0 < c := hδ0.trans_lt hδ
  have hV0 := vectorOpt_nonneg A
  have key : ∀ r ∈ vectorValues A, c * r ≤ scalarOpt A + δ * vectorOpt A := by
    rintro r ⟨ι, _, x, y, hx, hy, rfl⟩
    let B : ℕ → ℂ := fun k =>
      ∑ i, ∑ j, A i j * (inner ℂ (x i) (y j) * ((‖inner ℂ (x i) (y j)‖ : ℝ) : ℂ) ^ (2 * k))
    have hBle : ∀ k, ‖B k‖ ≤ vectorOpt A := fun k => norm_tensor_value_le A x y hx hy k
    have hB0 : B 0 = ∑ i, ∑ j, A i j * inner ℂ (x i) (y j) := by simp [B]
    have hsum : HasSum (fun k => (h k : ℂ) * B k)
        (∑ i, ∑ j, A i j * radialKernel h (inner ℂ (x i) (y j))) := by
      have hterm : ∀ i j, HasSum (fun k => A i j * ((h k : ℂ) *
          (inner ℂ (x i) (y j) * ((‖inner ℂ (x i) (y j)‖ : ℝ) : ℂ) ^ (2 * k))))
          (A i j * radialKernel h (inner ℂ (x i) (y j))) := fun i j => by
        refine (Summable.hasSum (Summable.of_norm_bounded hs fun k => ?_)).mul_left (A i j)
        have hz : ‖inner ℂ (x i) (y j)‖ ≤ 1 := by
          simpa [hx, hy] using norm_inner_le_norm (𝕜 := ℂ) (x i) (y j)
        rw [norm_mul, norm_mul, norm_pow, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
          Real.norm_eq_abs, abs_norm, ← pow_succ']
        exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ (norm_nonneg _) hz)
      convert hasSum_sum fun i _ => hasSum_sum fun j _ => hterm i j using 1
      funext k; simp only [B, Finset.mul_sum]
      exact sum_congr rfl fun _ _ => sum_congr rfl fun _ _ => by ring
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
      csSup_le (vectorValues_nonempty A) fun r hr => by rw [le_div_iff₀ hc0]; linarith [key r hr]
    rwa [le_div_iff₀ hc0, mul_comm] at this
  rw [one_div_mul_eq_div, le_div_iff₀ (sub_pos.2 hδ)]
  nlinarith

/-! ### 3. Residual split and Hardy tail -/

theorem residual_split (h : ℕ → ℝ) (hs : Summable fun n => |h n|) (c : ℝ) (K : ℕ) :
    |h 0 - c| + ∑' n, |h (n + 1)|
      = ∑ n ∈ range (K + 1), |h n - if n = 0 then c else 0| + ∑' n, |h (n + (K + 1))| := by
  have hs1 : Summable fun n => |h (n + 1)| := (summable_nat_add_iff 1).mpr hs
  rw [← hs1.sum_add_tsum_nat_add K, sum_range_succ']
  have e1 : ∑ n ∈ range K, |h (n + 1) - if n + 1 = 0 then c else 0| = ∑ n ∈ range K, |h (n + 1)| :=
    sum_congr rfl fun _ _ => by simp
  have e2 : ∑' n, |h (n + K + 1)| = ∑' n, |h (n + (K + 1))| := tsum_congr fun _ => by rw [add_assoc]
  rw [e1, e2]; simp only [ite_true]; ring

theorem hardy_budget_after_linear (h : ℕ → ℝ) (r B L : ℝ) (hr : 0 < r)
    (hL : 0 ≤ L) (h0 : L ≤ h 0)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B) :
    ∀ J, ∑ n ∈ range J, h (n + 1) ^ 2 * r ^ (2 * (2 * n + 1))
      ≤ (B - L ^ 2 * r ^ 2) / r ^ 4 := by
  intro J
  have hsq : L ^ 2 ≤ h 0 ^ 2 := by nlinarith
  have he : ∀ n : ℕ, r ^ (2 * (2 * (n + 1) + 1)) = r ^ 4 * r ^ (2 * (2 * n + 1)) := fun n => by
    rw [← pow_add]; congr 1; omega
  have hb := hB (J + 1)
  rw [sum_range_succ'] at hb
  simp only [Nat.mul_zero, zero_add, Nat.mul_one] at hb
  simp_rw [he] at hb
  have he' : (∑ n ∈ range J, h (n + 1) ^ 2 * (r ^ 4 * r ^ (2 * (2 * n + 1)))) =
      r ^ 4 * ∑ n ∈ range J, h (n + 1) ^ 2 * r ^ (2 * (2 * n + 1)) := by
    rw [mul_sum]; exact sum_congr rfl fun _ _ => by ring
  rw [he'] at hb
  apply (le_div_iff₀ (pow_pos hr 4)).2
  have hsq' := mul_le_mul_of_nonneg_right hsq (sq_nonneg r)
  nlinarith only [hb, hsq']

theorem hardy_tail (h : ℕ → ℝ) (r : ℝ) (hr : 1 < r) (B : ℝ)
    (hB : ∀ J, ∑ n ∈ range J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B) (K : ℕ) (T : ℝ) (hT : 0 ≤ T)
    (hcmp : B * r⁻¹ ^ (2 * (2 * K + 1)) ≤ T ^ 2 * (1 - r⁻¹ ^ 4)) :
    ∑' n, |h (n + K)| ≤ T := by
  have hr0 : 0 < r := zero_lt_one.trans hr
  have hs0 : 0 < r⁻¹ := inv_pos.2 hr0
  have hs1 : r⁻¹ < 1 := inv_lt_one_of_one_lt₀ hr
  have hq0 : 0 ≤ r⁻¹ ^ 4 := (pow_pos hs0 4).le
  have hq1 : r⁻¹ ^ 4 < 1 := pow_lt_one₀ hs0.le hs1 (by norm_num)
  have hrs : ∀ k : ℕ, r ^ k * r⁻¹ ^ k = 1 := fun k => by
    rw [← mul_pow, mul_inv_cancel₀ hr0.ne', one_pow]
  have key : ∀ J, ∑ n ∈ Ico K J, |h n| ≤ T := by
    intro J
    have hcs := sum_mul_sq_le_sq_mul_sq (Ico K J) (fun n => |h n| * r ^ (2 * n + 1))
      (fun n => r⁻¹ ^ (2 * n + 1))
    have e1 : ∑ n ∈ Ico K J, |h n| * r ^ (2 * n + 1) * r⁻¹ ^ (2 * n + 1) = ∑ n ∈ Ico K J, |h n| :=
      sum_congr rfl fun _ _ => by rw [mul_assoc, hrs, mul_one]
    have e2 : ∑ n ∈ Ico K J, (|h n| * r ^ (2 * n + 1)) ^ 2
        = ∑ n ∈ Ico K J, h n ^ 2 * r ^ (2 * (2 * n + 1)) :=
      sum_congr rfl fun n _ => by rw [mul_pow, sq_abs, ← pow_mul, mul_comm (2 * n + 1) 2]
    have h2 : ∑ n ∈ Ico K J, h n ^ 2 * r ^ (2 * (2 * n + 1)) ≤ B :=
      (sum_le_sum_of_subset_of_nonneg (fun _ hn => mem_range.2 (mem_Ico.1 hn).2)
        fun _ _ _ => by positivity).trans (hB J)
    have e3 : ∑ n ∈ Ico K J, (r⁻¹ ^ (2 * n + 1)) ^ 2 = r⁻¹ ^ 2 * ∑ n ∈ Ico K J, (r⁻¹ ^ 4) ^ n := by
      rw [mul_sum]; exact sum_congr rfl fun _ _ => by rw [← pow_mul, ← pow_mul, ← pow_add]; congr 1; ring
    have h3 : ∑ n ∈ Ico K J, (r⁻¹ ^ 4) ^ n ≤ (r⁻¹ ^ 4) ^ K / (1 - r⁻¹ ^ 4) :=
      geom_sum_Ico_le_of_lt_one hq0 hq1
    have hpos : 0 < 1 - r⁻¹ ^ 4 := by linarith
    have hB0 : 0 ≤ B := le_trans (by simp) (hB 0)
    rw [e1, e2, e3] at hcs
    have h4 : (∑ n ∈ Ico K J, |h n|) ^ 2 ≤ T ^ 2 := by
      calc (∑ n ∈ Ico K J, |h n|) ^ 2
          ≤ (∑ n ∈ Ico K J, h n ^ 2 * r ^ (2 * (2 * n + 1))) *
              (r⁻¹ ^ 2 * ∑ n ∈ Ico K J, (r⁻¹ ^ 4) ^ n) := hcs
        _ ≤ B * (r⁻¹ ^ 2 * ((r⁻¹ ^ 4) ^ K / (1 - r⁻¹ ^ 4))) :=
            mul_le_mul h2 (mul_le_mul_of_nonneg_left h3 (by positivity))
              (mul_nonneg (by positivity) (sum_nonneg fun _ _ => by positivity)) hB0
        _ = B * r⁻¹ ^ (2 * (2 * K + 1)) / (1 - r⁻¹ ^ 4) := by
            rw [← pow_mul]
            have : r⁻¹ ^ (2 * (2 * K + 1)) = r⁻¹ ^ 2 * r⁻¹ ^ (4 * K) := by
              rw [← pow_add]; congr 1; ring
            rw [this]; ring
        _ ≤ T ^ 2 := by rw [div_le_iff₀ hpos]; exact hcmp
    exact (pow_le_pow_iff_left₀ (sum_nonneg fun _ _ => abs_nonneg _) hT (by norm_num)).1 h4
  refine Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _) fun J => ?_
  have := key (K + J)
  rwa [sum_Ico_eq_sum_range, Nat.add_sub_cancel_left,
    show (fun k => |h (K + k)|) = fun k => |h (k + K)| from funext fun _ => by rw [add_comm]] at this

/-! ### 4. Polynomial Wiener `ℓ¹` norm and bivariate kernels -/

def l1 (p : ℝ[X]) : ℝ := p.sum fun _ a => |a|

lemma l1_def (p : ℝ[X]) : l1 p = ∑ n ∈ p.support, |p.coeff n| := rfl
lemma l1_nonneg (p : ℝ[X]) : 0 ≤ l1 p := sum_nonneg fun _ _ => abs_nonneg _
@[simp] lemma l1_zero : l1 0 = 0 := by simp [l1]

lemma l1_eq_sum_range (p : ℝ[X]) {N : ℕ} (hN : p.natDegree < N) :
    l1 p = ∑ n ∈ range N, |p.coeff n| := by
  rw [l1_def]
  apply sum_subset
  · intro n hn; exact mem_range.2 (lt_of_le_of_lt (le_natDegree_of_mem_supp n hn) hN)
  · intro n _ hn; simp [Polynomial.notMem_support_iff.1 hn]

lemma abs_coeff_le_l1 (p : ℝ[X]) (j : ℕ) : |p.coeff j| ≤ l1 p := by
  by_cases hj : j ∈ p.support
  · exact single_le_sum (f := fun n => |p.coeff n|) (fun _ _ => abs_nonneg _) hj
  · rw [Polynomial.notMem_support_iff.1 hj, abs_zero]; exact l1_nonneg p

lemma sum_abs_coeff_le_l1 (p : ℝ[X]) (K : ℕ) : ∑ k ∈ range K, |p.coeff k| ≤ l1 p := by
  rw [l1_eq_sum_range p (N := max K (p.natDegree + 1)) (by omega)]
  exact sum_le_sum_of_subset_of_nonneg (range_subset_range.2 (le_max_left _ _))
    fun _ _ _ => abs_nonneg _

lemma l1_add_le (p q : ℝ[X]) : l1 (p + q) ≤ l1 p + l1 q := by
  have h := fun r : ℝ[X] => l1_eq_sum_range r (N := (p + q).natDegree + p.natDegree + q.natDegree + 1)
  rw [h (p + q) (by omega), h p (by omega), h q (by omega), ← sum_add_distrib]
  exact sum_le_sum fun n _ => by rw [coeff_add]; exact abs_add_le _ _

lemma l1_sum_le {ι : Type*} (s : Finset ι) (f : ι → ℝ[X]) :
    l1 (∑ i ∈ s, f i) ≤ ∑ i ∈ s, l1 (f i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih =>
    rw [sum_insert ha, sum_insert ha]
    exact (l1_add_le _ _).trans (add_le_add le_rfl ih)

@[simp] lemma l1_monomial (n : ℕ) (c : ℝ) : l1 (monomial n c) = |c| := by
  simp [l1, sum_monomial_index]
@[simp] lemma l1_C (c : ℝ) : l1 (C c) = |c| := by rw [← monomial_zero_left]; exact l1_monomial 0 c
@[simp] lemma l1_X : l1 (X : ℝ[X]) = 1 := by rw [← monomial_one_one_eq_X]; simp
@[simp] lemma l1_one : l1 (1 : ℝ[X]) = 1 := by rw [← C_1, l1_C, abs_one]

lemma l1_mul_le (p q : ℝ[X]) : l1 (p * q) ≤ l1 p * l1 q := by
  calc l1 (p * q)
      = l1 (∑ i ∈ p.support, ∑ j ∈ q.support, monomial (i + j) (p.coeff i * q.coeff j)) := by
        rw [mul_eq_sum_sum]; rfl
    _ ≤ ∑ i ∈ p.support, ∑ j ∈ q.support, |p.coeff i * q.coeff j| :=
        (l1_sum_le _ _).trans (sum_le_sum fun _ _ =>
          (l1_sum_le _ _).trans (sum_le_sum fun _ _ => by rw [l1_monomial]))
    _ = l1 p * l1 q := by rw [l1_def, l1_def, sum_mul_sum]; simp [abs_mul]

lemma l1_pow_le (p : ℝ[X]) (n : ℕ) : l1 (p ^ n) ≤ l1 p ^ n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [pow_succ, pow_succ]
    exact (l1_mul_le _ _).trans (mul_le_mul_of_nonneg_right ih (l1_nonneg _))

def shiftOf (p : ℕ × ℕ) : ℕ := p.1 / 2 + p.2 / 2

def termOf (P Q : ℝ[X]) (p : ℕ × ℕ) : ℝ[X] := X ^ shiftOf p * (P ^ p.1 * Q ^ p.2)

lemma l1_termOf_le_one {P Q : ℝ[X]} (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (p : ℕ × ℕ) :
    l1 (termOf P Q p) ≤ 1 := by
  have h : ∀ (R : ℝ[X]) (k : ℕ), l1 R ≤ 1 → l1 (R ^ k) ≤ 1 := fun R k hR =>
    (l1_pow_le R k).trans (pow_le_one₀ (l1_nonneg R) hR)
  refine (l1_mul_le _ _).trans ((mul_le_mul (h _ _ l1_X.le) ((l1_mul_le _ _).trans ?_)
    (l1_nonneg _) zero_le_one).trans (one_mul 1).le)
  exact (mul_le_mul (h _ _ hP) (h _ _ hQ) (l1_nonneg _) zero_le_one).trans (one_mul 1).le

lemma coeff_termOf_eq_zero (P Q : ℝ[X]) (hQ : Q.coeff 0 = 0) (p : ℕ × ℕ) {j : ℕ}
    (hj : j < shiftOf p + p.2) : (termOf P Q p).coeff j = 0 := by
  obtain ⟨R, rfl⟩ := X_dvd_iff.2 hQ
  have e : termOf P (X * R) p = X ^ (shiftOf p + p.2) * (P ^ p.1 * R ^ p.2) := by
    unfold termOf; rw [mul_pow, pow_add]; ring
  rw [e, coeff_X_pow_mul']
  exact ite_eq_right (by omega)

def bivarKernel (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (j : ℕ) : ℝ := ∑' p, μ p * (termOf P Q p).coeff j

theorem summable_abs_bivarKernel (P Q : ℝ[X]) (hP : l1 P ≤ 1) (hQ : l1 Q ≤ 1) (μ : ℕ × ℕ → ℝ)
    (hμ : Summable fun p => |μ p|) : Summable fun j => |bivarKernel P Q μ j| := by
  have hterm : ∀ j, Summable fun p => |μ p * (termOf P Q p).coeff j| := fun j =>
    Summable.of_nonneg_of_le (fun _ => abs_nonneg _) (fun p => by
      rw [abs_mul]
      exact mul_le_of_le_one_right (abs_nonneg _)
        ((abs_coeff_le_l1 _ j).trans (l1_termOf_le_one hP hQ p))) hμ
  refine summable_of_sum_range_le (c := ∑' p, |μ p|) (fun _ => abs_nonneg _) fun J => ?_
  calc ∑ j ∈ range J, |bivarKernel P Q μ j|
      ≤ ∑ j ∈ range J, ∑' p, |μ p * (termOf P Q p).coeff j| :=
        sum_le_sum fun j _ =>
          norm_tsum_le_tsum_norm (f := fun p => μ p * (termOf P Q p).coeff j) (hterm j)
    _ = ∑' p, ∑ j ∈ range J, |μ p * (termOf P Q p).coeff j| :=
        (Summable.tsum_finsetSum fun j _ => hterm j).symm
    _ ≤ ∑' p, |μ p| := by
        have hb : ∀ p, ∑ j ∈ range J, |μ p * (termOf P Q p).coeff j| ≤ |μ p| := fun p => by
          simp only [abs_mul, ← mul_sum]
          exact mul_le_of_le_one_right (abs_nonneg _)
            ((sum_abs_coeff_le_l1 _ _).trans (l1_termOf_le_one hP hQ p))
        exact (Summable.of_nonneg_of_le (fun _ => sum_nonneg fun _ _ => abs_nonneg _) hb hμ).tsum_le_tsum
          hb hμ

def headIdx (N : ℕ) : Finset (ℕ × ℕ) :=
  (range (N + 1) ×ˢ range (N + 1)).filter fun p => p.1 + 3 * p.2 ≤ N

lemma mem_headIdx {N : ℕ} {p : ℕ × ℕ} : p ∈ headIdx N ↔ p.1 + 3 * p.2 ≤ N := by
  unfold headIdx
  rw [mem_filter, mem_product, mem_range, mem_range]
  exact ⟨fun h => h.2, fun h => ⟨⟨by omega, by omega⟩, h⟩⟩

theorem bivarKernel_eq_head (P Q : ℝ[X]) (hQ : Q.coeff 0 = 0) (μ : ℕ × ℕ → ℝ)
    (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0) {N j : ℕ} (hj : 2 * j + 1 ≤ N) :
    bivarKernel P Q μ j = ∑ p ∈ headIdx N, μ p * (termOf P Q p).coeff j := by
  unfold bivarKernel
  refine tsum_eq_sum fun p hp => ?_
  by_cases hp2 : (p.1 + p.2) % 2 = 0
  · rw [hpar p hp2, zero_mul]
  · rw [mem_headIdx] at hp
    rw [coeff_termOf_eq_zero P Q hQ p (by unfold shiftOf; omega), mul_zero]

/-- Embed a 1D radial moment sequence `ν k` at `(2k + 1, 0)`. -/
def onedTable (ν : ℕ → ℝ) : ℕ × ℕ → ℝ
  | (n, 0) => if n % 2 = 1 then ν (n / 2) else 0
  | (_, _ + 1) => 0

theorem summable_onedTable {ν : ℕ → ℝ} (hν : Summable fun k => |ν k|) :
    Summable fun p : ℕ × ℕ => |onedTable ν p| := by
  have heq : (fun k : ℕ => |onedTable ν (2 * k + 1, 0)|) = fun k => |ν k| := by
    funext k; simp [onedTable, Nat.mul_add_div]
  have hinj : Function.Injective (fun k : ℕ => ((2 * k + 1, 0) : ℕ × ℕ)) := fun a b h => by
    injection h with h1 _; omega
  refine (Function.Injective.summable_iff hinj ?_).1 (by rwa [Function.comp_def, heq])
  rintro ⟨n, m⟩ hnm
  cases m with
  | succ m => simp [onedTable]
  | zero =>
    by_cases hn : n % 2 = 1
    · exfalso; exact hnm ⟨n / 2, by ext <;> simp; omega⟩
    · simp [onedTable, hn]

theorem bivarKernel_oned_eq_head (P Q : ℝ[X]) (ν : ℕ → ℝ) {K j : ℕ} (hj : j < K) :
    bivarKernel P Q (onedTable ν) j =
      ∑ k ∈ range K, ν k * (X ^ k * P ^ (2 * k + 1)).coeff j := by
  unfold bivarKernel
  have hsupp : ∀ p : ℕ × ℕ, p ∉ (range K).image (fun k => (2 * k + 1, 0)) →
      onedTable ν p * (termOf P Q p).coeff j = 0 := by
    rintro ⟨n, m⟩ hp
    cases m with
    | succ m => simp [onedTable]
    | zero =>
      by_cases hn : n % 2 = 1
      · have hk : K ≤ n / 2 := by
          by_contra hlt; push Not at hlt
          exact hp (mem_image.2 ⟨n / 2, mem_range.2 hlt, by ext <;> simp; omega⟩)
        have ht : (termOf P Q (n, 0)).coeff j = 0 := by
          unfold termOf shiftOf
          simp only [Nat.zero_div, add_zero, pow_zero, mul_one, coeff_X_pow_mul']
          exact ite_eq_right (by omega)
        rw [ht, mul_zero]
      · simp [onedTable, hn]
  rw [tsum_eq_sum hsupp, sum_image (fun a _ b _ h => by injection h with h1 _; omega)]
  refine sum_congr rfl fun k _ => ?_
  have h1 : (2 * k + 1) % 2 = 1 := by omega
  have h2 : (2 * k + 1) / 2 = k := by omega
  simp [onedTable, termOf, shiftOf, h1, h2]

/-! ### 5. Soundness of 128-bit interval arithmetic and `bivarT` -/

lemma D_pos : (0 : ℝ) < (D : ℝ) := by unfold D K; positivity
lemma D_pos_int : (0 : ℤ) < D := by unfold D K; positivity

def mem (x : ℝ) (I : Ival) : Prop := (I.lo : ℝ) ≤ x * D ∧ x * D ≤ I.hi

lemma mem_zeroI_iff (x : ℝ) : mem x zeroI ↔ x = 0 := by
  simp only [mem, zeroI, Int.cast_zero, ← le_antisymm_iff, eq_comm (a := (0 : ℝ)), mul_eq_zero,
    D_pos.ne', or_false]

lemma mem_zero : mem 0 zeroI := (mem_zeroI_iff 0).2 rfl

lemma mem_add {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x + y) (addI a b) := by
  unfold mem addI at *; push_cast; constructor <;> linarith [hx.1, hx.2, hy.1, hy.2]

lemma mem_neg {x : ℝ} {a : Ival} (hx : mem x a) : mem (-x) (negI a) := by
  unfold mem negI at *; push_cast; constructor <;> linarith [hx.1, hx.2]

lemma shDown_le {m : ℤ} {r : ℝ} (h : (m : ℝ) ≤ r * D) : (shDown m : ℝ) ≤ r := by
  have : ((m / D : ℤ) : ℝ) * D ≤ m := by exact_mod_cast Int.ediv_mul_le m D_pos_int.ne'
  exact le_of_mul_le_mul_right (this.trans h) D_pos

lemma le_shUp {m : ℤ} {r : ℝ} (h : r * D ≤ m) : r ≤ (shUp m : ℝ) := by
  have : (((-m) / D : ℤ) : ℝ) * D ≤ -(m : ℝ) := by
    exact_mod_cast Int.ediv_mul_le (-m) D_pos_int.ne'
  unfold shUp; push_cast
  exact le_of_mul_le_mul_right (by linarith) D_pos

lemma mul_bounds {x y a b c d : ℝ} (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y ∧
      x * y ≤ max (max (a * c) (a * d)) (max (b * c) (b * d)) := by
  have h1 : min (a * y) (b * y) ≤ x * y ∧ x * y ≤ max (a * y) (b * y) := by
    rcases le_total 0 y with hy0 | hy0
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_right hx.1 hy0),
        (mul_le_mul_of_nonneg_right hx.2 hy0).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_right hx.2 hy0),
        (mul_le_mul_of_nonpos_right hx.1 hy0).trans (le_max_left _ _)⟩
  have h2 : ∀ e : ℝ, min (e * c) (e * d) ≤ e * y ∧ e * y ≤ max (e * c) (e * d) := fun e => by
    rcases le_total 0 e with he | he
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hy.1 he),
        (mul_le_mul_of_nonneg_left hy.2 he).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hy.2 he),
        (mul_le_mul_of_nonpos_left hy.1 he).trans (le_max_left _ _)⟩
  exact ⟨(min_le_min (h2 a).1 (h2 b).1).trans h1.1, h1.2.trans (max_le_max (h2 a).2 (h2 b).2)⟩

lemma mem_mul {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x * y) (mulI a b) := by
  have hb := mul_bounds hx hy
  rw [show x * D * (y * D) = x * y * D * D by ring] at hb
  exact ⟨shDown_le (by push_cast; exact hb.1), le_shUp (by push_cast; exact hb.2)⟩

lemma abs_le_absUpper {x : ℝ} {a : Ival} (hx : mem x a) : |x| * D ≤ absUpper a := by
  have h : |x * D| ≤ max (-(a.lo : ℝ)) a.hi := abs_le.2
    ⟨by linarith [hx.1, le_max_left (-(a.lo : ℝ)) a.hi], hx.2.trans (le_max_right _ _)⟩
  rw [abs_mul, abs_of_pos D_pos] at h
  unfold absUpper; push_cast
  exact h.trans (le_max_left _ _)

lemma ofRatLo_le (q : ℚ) : (ofRatLo q : ℝ) ≤ (q : ℝ) * D := by
  have h : ((ofRatLo q : ℤ) : ℚ) ≤ q * (D : ℚ) := Rat.le_floor_iff.1 le_rfl
  exact_mod_cast h

lemma le_ofRatHi (q : ℚ) : (q : ℝ) * D ≤ (ofRatHi q : ℝ) := by
  have h : ((Rat.floor (-(q * (D : ℚ))) : ℤ) : ℚ) ≤ -(q * (D : ℚ)) := Rat.le_floor_iff.1 le_rfl
  have h' : ((Rat.floor (-(q * (D : ℚ))) : ℤ) : ℝ) ≤ -((q : ℝ) * D) := by exact_mod_cast h
  unfold ofRatHi; push_cast; linarith

lemma mem_ofRatI (q : ℚ) : mem (q : ℝ) (ofRatI q) := ⟨ofRatLo_le q, le_ofRatHi q⟩
lemma ofRatI_zero : ofRatI 0 = zeroI := by simp [ofRatI, ofRatLo, ofRatHi, zeroI, Rat.floor]

def memB (N : ℕ) (p : ℝ[X]) (L : List Ival) : Prop :=
  ∀ n, n < N → mem (p.coeff n) (L.getD n zeroI)

lemma memB_mono {N M : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) (hM : M ≤ N) :
    memB M p L := fun n hn => h n (lt_of_lt_of_le hn hM)

lemma memB_zero (N : ℕ) : memB N 0 [] := fun _ _ => by simpa using mem_zero

lemma getD_addL (l m : List Ival) (n : ℕ) :
    (addL l m).getD n zeroI = addI (l.getD n zeroI) (m.getD n zeroI) := by
  have z1 : ∀ a, addI zeroI a = a := fun ⟨_, _⟩ => by simp [addI, zeroI]
  have z2 : ∀ a, addI a zeroI = a := fun ⟨_, _⟩ => by simp [addI, zeroI]
  induction l generalizing m n with
  | nil => simp [addL, z1]
  | cons a l ih =>
    cases m with
    | nil => simp [addL, z2]
    | cons b m =>
      cases n with
      | zero => rfl
      | succ n => simp only [addL, List.getD_cons_succ]; exact ih m n

lemma memB_add {N : ℕ} {p q : ℝ[X]} {L M : List Ival} (hp : memB N p L) (hq : memB N q M) :
    memB N (p + q) (addL L M) := fun n hn => by
  rw [getD_addL, coeff_add]; exact mem_add (hp n hn) (hq n hn)

private lemma list_getD_map {α β : Type*} (f : α → β) (l : List α) (d : α) (n : ℕ) :
    (l.map f).getD n (f d) = f (l.getD n d) := by
  induction l generalizing n with
  | nil => simp
  | cons _ _ ih =>
    cases n with
    | zero => rfl
    | succ n => exact ih n

lemma memB_C_mul {N : ℕ} {a : ℝ} {I : Ival} {q : ℝ[X]} {M : List Ival}
    (ha : mem a I) (hq : memB N q M) : memB N (C a * q) (M.map (mulI I)) := fun n hn => by
  have hz : mulI I zeroI = zeroI := by simp [mulI, zeroI, shDown, shUp]
  rw [← hz, list_getD_map, coeff_C_mul]; exact mem_mul ha (hq n hn)

lemma memB_X_mul {N : ℕ} {r : ℝ[X]} {R : List Ival} (hr : memB N r R) :
    memB (N + 1) (X * r) (zeroI :: R) := fun n hn => by
  cases n with
  | zero => simpa using mem_zero
  | succ n => rw [coeff_X_mul, List.getD_cons_succ]; exact hr n (by omega)

lemma memB_take {N : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) : memB N p (L.take N) :=
  fun n hn => by
    rw [List.getD_eq_getElem?_getD, List.getElem?_take_of_lt hn, ← List.getD_eq_getElem?_getD]
    exact h n hn

lemma memB_conv {L : List Ival} : ∀ {N : ℕ} {p q : ℝ[X]} {M : List Ival},
    memB N p L → memB N q M → memB N (p * q) (convI L M) := by
  induction L with
  | nil =>
    intro N p q _ hp _ n hn
    simp only [convI, List.getD_nil, mem_zeroI_iff, coeff_mul]
    refine sum_eq_zero fun ij hij => ?_
    have hzero : p.coeff ij.1 = 0 :=
      (mem_zeroI_iff _).1 (by simpa using hp ij.1 (by simp at hij; omega))
    rw [hzero, zero_mul]
  | cons a L ih =>
    intro N p q M hp hq
    cases N with
    | zero => intro _ hn; omega
    | succ N =>
      have h0 : mem (p.coeff 0) a := by simpa using hp 0 (Nat.succ_pos N)
      have hXm := memB_X_mul (ih (p := divX p) (fun n hn => by
        simpa [coeff_divX] using hp (n + 1) (by omega)) (memB_mono hq (Nat.le_succ N)))
      have hpq : p * q = C (p.coeff 0) * q + X * (divX p * q) := by
        conv_lhs => rw [← X_mul_divX_add p]
        ring
      rw [hpq]; simp only [convI]; split_ifs with hz
      · obtain ⟨lo, hi⟩ := a
        simp only [Bool.and_eq_true, beq_iff_eq] at hz
        obtain ⟨rfl, rfl⟩ := hz
        rw [show (⟨0, 0⟩ : Ival) = zeroI from rfl, mem_zeroI_iff] at h0
        rw [h0, map_zero, zero_mul, zero_add]; exact hXm
      · exact memB_add (memB_C_mul h0 hq) hXm

lemma memB_single {N : ℕ} {a : ℝ} {I : Ival} (ha : mem a I) : memB N (C a) [I] := fun n _ => by
  cases n with
  | zero => simpa using ha
  | succ n => simpa [coeff_C_succ] using mem_zero

lemma memB_sumL {α : Type*} {N : ℕ} (f : α → ℝ[X]) (g : α → List Ival) :
    ∀ (l : List α), (∀ a ∈ l, memB N (f a) (g a)) →
      memB N (l.map f).sum (sumL (l.map g))
  | [], _ => by simpa [sumL] using memB_zero N
  | a :: l, hl => by
    simp only [List.map_cons, List.sum_cons, sumL]
    exact memB_add (hl a List.mem_cons_self)
      (memB_sumL f g l fun b hb => hl b (List.mem_cons_of_mem _ hb))

lemma absSum_le {N : ℕ} {p : ℝ[X]} {L : List Ival} (h : memB N p L) :
    (∑ n ∈ range N, |p.coeff n|) * D ≤ (absSum L : ℝ) := by
  have h1 : (∑ n ∈ range N, |p.coeff n|) * D
      ≤ ∑ n ∈ range N, (absUpper (L.getD n zeroI) : ℝ) := by
    rw [sum_mul]; exact sum_le_sum fun n hn => abs_le_absUpper (h n (mem_range.1 hn))
  refine h1.trans ?_
  have hz : absUpper zeroI = 0 := by simp [absUpper, zeroI]
  have key : ∀ (L : List Ival) (N : ℕ),
      ∑ n ∈ range N, absUpper (L.getD n zeroI) ≤ (L.map absUpper).sum := by
    intro L; induction L with
    | nil => intro N; simp [hz]
    | cons a l ih =>
      intro N; cases N with
      | zero =>
        simp only [range_zero, sum_empty, List.map_cons, List.sum_cons]
        exact add_nonneg (le_max_right _ _) (List.sum_nonneg fun x hx => by
          obtain ⟨_, _, rfl⟩ := List.mem_map.1 hx; exact le_max_right _ _)
      | succ N =>
        rw [sum_range_succ']
        simp only [List.getD_cons_succ, List.getD_cons_zero, List.map_cons, List.sum_cons]
        linarith [ih N]
  exact_mod_cast key L N

/-- Polynomial with rational coefficients `c₀ + X (c₁ + …)`. -/
def ofListQ : List ℚ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofListQ l

lemma coeff_ofListQ (l : List ℚ) (n : ℕ) : (ofListQ l).coeff n = ((l.getD n 0 : ℚ) : ℝ) := by
  induction l generalizing n with
  | nil => simp [ofListQ]
  | cons a l ih =>
    cases n with
    | zero => simp [ofListQ]
    | succ n =>
      simp only [ofListQ, coeff_add, coeff_C_succ, coeff_X_mul, zero_add, ih, List.getD_cons_succ]

lemma l1_ofListQ_le (l : List ℚ) : l1 (ofListQ l) ≤ (((l.map fun q => |q|).sum : ℚ) : ℝ) := by
  induction l with
  | nil => simp [ofListQ]
  | cons a l ih =>
    simp only [ofListQ, List.map_cons, List.sum_cons]
    calc l1 (C (a : ℝ) + X * ofListQ l)
        ≤ l1 (C (a : ℝ)) + l1 (X * ofListQ l) := l1_add_le _ _
      _ ≤ |(a : ℝ)| + l1 X * l1 (ofListQ l) :=
          add_le_add (l1_C _).le (l1_mul_le _ _)
      _ ≤ |(a : ℝ)| + (((l.map fun q => |q|).sum : ℚ) : ℝ) := by
          rw [l1_X, one_mul]; gcongr
      _ = _ := by push_cast; rfl

lemma memB_ofListQ (l : List ℚ) (N : ℕ) : memB N (ofListQ l) (l.map ofRatI) := fun n _ => by
  rw [coeff_ofListQ, ← ofRatI_zero, list_getD_map]; exact mem_ofRatI _

private lemma getD_iterL (f : List Ival → List Ival) :
    ∀ (n : ℕ) (L : List Ival) (k : ℕ), k < n → (iterL f n L).getD k [] = f^[k] L
  | 0, _, _, hk => absurd hk (Nat.not_lt_zero _)
  | _ + 1, _, 0, _ => rfl
  | n + 1, L, k + 1, hk => by
    rw [iterL, List.getD_cons_succ, getD_iterL f n (f L) k (by omega), Function.iterate_succ_apply]

lemma memB_pow {P : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI) (N n : ℕ) (hn : n ≤ N) :
    memB K (P ^ n) ((powsT K PI N).getD n []) := by
  rw [powsT, getD_iterL _ _ _ _ (by omega)]
  induction n with
  | zero => simpa using memB_single (N := K) (mem_ofRatI 1)
  | succ n ih =>
    rw [Function.iterate_succ_apply', pow_succ']
    exact memB_take (memB_conv hP (ih (by omega)))

private lemma getD_shiftX (k : ℕ) (R : List Ival) (n : ℕ) :
    (shiftX k R).getD n zeroI = if k ≤ n then R.getD (n - k) zeroI else zeroI := by
  unfold shiftX
  induction k generalizing n with
  | zero => simp
  | succ k ih =>
    cases n with
    | zero => simp [List.replicate_succ]
    | succ n =>
      rw [List.replicate_succ, List.cons_append, List.getD_cons_succ, ih]
      simp only [Nat.add_le_add_iff_right, Nat.add_sub_add_right]

lemma memB_shiftX {K k : ℕ} {r : ℝ[X]} {R : List Ival} (h : memB (K - k) r R) :
    memB K (X ^ k * r) (shiftX k R) := fun n _ => by
  rw [coeff_X_pow_mul', getD_shiftX]
  split_ifs with hk
  · exact h _ (by omega)
  · exact mem_zero

/-- Exact real polynomial corresponding to the index positions of an interval table `rows`. -/
def rowPolyReal (P : ℝ[X]) (μ : ℕ × ℕ → ℝ) (m : ℕ) (es : List (ℕ × Ival)) : ℝ[X] :=
  (es.map fun e => C (μ (e.1, m)) * (X ^ (e.1 / 2) * P ^ e.1)).sum

def tabPolyReal (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) (rows : List RowI) : ℝ[X] :=
  (rows.map fun r => X ^ (r.1 / 2) * (Q ^ r.1 * rowPolyReal P μ r.1 r.2)).sum

lemma memB_rowSumT_real {P : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI) (NZ m : ℕ)
    (μ : ℕ × ℕ → ℝ) :
    ∀ {es : List (ℕ × Ival)}, (∀ e ∈ es, e.1 ≤ NZ ∧ mem (μ (e.1, m)) e.2) →
      memB K (rowPolyReal P μ m es) (rowSumT K (powsT K PI NZ) es)
  | [], _ => by simpa [rowPolyReal, rowSumT] using memB_zero K
  | (n, I) :: rest, hb => by
    obtain ⟨hn, hI⟩ := hb (n, I) List.mem_cons_self
    have h1 : memB K (C (μ (n, m)) * (X ^ (n / 2) * P ^ n))
        (shiftX (n / 2) ((((powsT K PI NZ).getD n []).take (K - n / 2)).map (mulI I))) := by
      rw [mul_left_comm]
      exact memB_shiftX (memB_C_mul hI (memB_take
        (memB_mono (memB_pow hP NZ n hn) (Nat.sub_le _ _))))
    exact memB_add h1 (memB_rowSumT_real hP NZ m μ fun e he => hb e (List.mem_cons_of_mem _ he))

/-- **Direct interval-table soundness for `bivarT`.** -/
theorem memB_bivarT_real {P Q : ℝ[X]} {PI QI : List Ival} {K : ℕ} (hP : memB K P PI)
    (hQ : memB K Q QI) (μ : ℕ × ℕ → ℝ) {rows : List RowI} {NZ MW : ℕ}
    (hb : ∀ r ∈ rows, r.1 ≤ MW ∧ ∀ e ∈ r.2, e.1 ≤ NZ ∧ mem (μ (e.1, r.1)) e.2) :
    memB K (tabPolyReal P Q μ rows) (bivarT K rows PI QI NZ MW) := by
  change memB K _ (sumL (rows.map (rowTermT K (powsT K PI NZ) (powsT K QI MW))))
  unfold tabPolyReal
  refine memB_sumL _ _ rows fun r hr => ?_
  obtain ⟨hm, hes⟩ := hb r hr
  exact memB_take (memB_shiftX (memB_mono (memB_conv (memB_pow hQ MW r.1 hm)
    (memB_rowSumT_real hP NZ r.1 μ hes)) (Nat.sub_le _ _)))

/-- Flattened list of index pairs `(n, m)` appearing in `rows`. -/
def flatIdx (rows : List RowI) : List (ℕ × ℕ) :=
  rows.flatMap fun r => r.2.map fun e => (e.1, r.1)

lemma tabPolyReal_eq_flatIdx (P Q : ℝ[X]) (μ : ℕ × ℕ → ℝ) :
    ∀ rows : List RowI,
      tabPolyReal P Q μ rows = ((flatIdx rows).map fun p => C (μ p) * termOf P Q p).sum
  | [] => rfl
  | r :: rest => by
    have ih := tabPolyReal_eq_flatIdx P Q μ rest
    simp only [tabPolyReal, flatIdx, List.map_cons, List.sum_cons, List.flatMap_cons,
      List.map_append, List.sum_append] at ih ⊢
    rw [ih, rowPolyReal, ← List.sum_map_mul_left, ← List.sum_map_mul_left, List.map_map]
    congr 2
    refine List.map_congr_left fun _ _ => ?_
    simp only [Function.comp, termOf, shiftOf, pow_add]; ring

/-- When `rows` lists distinct pairs covering `headIdx N` (outside which `μ = 0` on `headIdx N`),
`bivarT` encloses the exact `bivarKernel P Q μ` up to index `K` (`2 K ≤ N + 1`, `Q(0) = 0`). -/
theorem mem_bivarT_of_table {P Q : ℝ[X]} {PI QI : List Ival} {N K NZ MW : ℕ}
    (hK : 2 * K ≤ N + 1) (hQ0 : Q.coeff 0 = 0)
    (hP : memB K P PI) (hQ : memB K Q QI)
    (μ : ℕ × ℕ → ℝ) (hpar : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → μ p = 0)
    {rows : List RowI} (hnodup : (flatIdx rows).Nodup)
    (hsub : ∀ p ∈ flatIdx rows, p ∈ headIdx N)
    (hcover : ∀ p ∈ headIdx N, p ∉ flatIdx rows → μ p = 0)
    (hb : ∀ r ∈ rows, r.1 ≤ MW ∧ ∀ e ∈ r.2, e.1 ≤ NZ ∧ mem (μ (e.1, r.1)) e.2) :
    ∀ j < K, mem (bivarKernel P Q μ j) ((bivarT K rows PI QI NZ MW).getD j zeroI) := by
  have hB := memB_bivarT_real hP hQ μ hb
  intro j hj
  suffices heq : bivarKernel P Q μ j = (tabPolyReal P Q μ rows).coeff j by
    rw [heq]; exact hB j hj
  rw [bivarKernel_eq_head P Q hQ0 μ hpar (N := N) (by omega),
    tabPolyReal_eq_flatIdx, ← List.sum_toFinset _ hnodup, finsetSum_coeff]
  symm
  refine (sum_subset (fun p hp => hsub p (List.mem_toFinset.1 hp)) fun p hp hnp => ?_).trans ?_
  · rw [hcover p hp (fun hm => hnp (List.mem_toFinset.2 hm)), map_zero, zero_mul, coeff_zero]
  · exact sum_congr rfl fun _ _ => coeff_C_mul _

/-- 1D interval table `[(0, [(2k + 1, nuI[k])_{k < K}])]`. -/
def onedRowsI (K : Nat) (nuI : List Ival) : List RowI :=
  [(0, (List.range K).map fun k => (2 * k + 1, nuI.getD k zeroI))]

/-- `bivarT` on `onedRowsI` encloses `bivarKernel P Q (onedTable ν)` for `j < K`. -/
theorem mem_bivarT_oned {P Q : ℝ[X]} {PI : List Ival} {K : ℕ} (hP : memB K P PI)
    (ν : ℕ → ℝ) {nuI : List Ival} (hν : ∀ k < K, mem (ν k) (nuI.getD k zeroI)) :
    ∀ j < K, mem (bivarKernel P Q (onedTable ν) j)
      ((bivarT K (onedRowsI K nuI) PI [] (2 * K + 1) 0).getD j zeroI) := by
  have hB : memB K (tabPolyReal P 0 (onedTable ν) (onedRowsI K nuI))
      (bivarT K (onedRowsI K nuI) PI [] (2 * K + 1) 0) := by
    refine memB_bivarT_real hP (memB_zero K) (onedTable ν) (rows := onedRowsI K nuI) ?_
    rintro r hr
    simp only [onedRowsI, List.mem_singleton] at hr
    subst hr
    refine ⟨le_rfl, ?_⟩
    rintro e he
    obtain ⟨k, hk, rfl⟩ := List.mem_map.1 he
    have hk' : k < K := List.mem_range.1 hk
    refine ⟨by omega, ?_⟩
    have h1 : (2 * k + 1) % 2 = 1 := by omega
    have h2 : (2 * k + 1) / 2 = k := by omega
    simpa [onedTable, h1, h2] using hν k hk'
  intro j hj
  suffices heq : bivarKernel P Q (onedTable ν) j =
      (tabPolyReal P 0 (onedTable ν) (onedRowsI K nuI)).coeff j by
    rw [heq]; exact hB j hj
  rw [bivarKernel_oned_eq_head P Q ν hj]
  have hpoly : tabPolyReal P 0 (onedTable ν) (onedRowsI K nuI) =
      ∑ k ∈ range K, C (ν k) * (X ^ k * P ^ (2 * k + 1)) := by
    simp only [onedRowsI, tabPolyReal, rowPolyReal, List.map_singleton, List.sum_singleton,
      Nat.zero_div, pow_zero, one_mul, List.map_map]
    have hfn : ((fun e : ℕ × Ival => C (onedTable ν (e.1, 0)) * (X ^ (e.1 / 2) * P ^ e.1)) ∘
        fun k : ℕ => (2 * k + 1, nuI.getD k zeroI)) =
        fun k => C (ν k) * (X ^ k * P ^ (2 * k + 1)) := by
      funext k
      have h1 : (2 * k + 1) % 2 = 1 := by omega
      have h2 : (2 * k + 1) / 2 = k := by omega
      simp [Function.comp, onedTable, h1, h2]
    rw [hfn]
    clear hfn hB hP hν hj
    induction K with
    | zero => simp
    | succ k ih => rw [List.range_succ, List.map_append, List.sum_append, sum_range_succ, ih]; simp
  rw [hpoly, finsetSum_coeff]
  exact sum_congr rfl fun _ _ => (coeff_C_mul _).symm

/-! ### 6. Multi-channel interval-head convex transfer -/

theorem summable_convex_comb {k : ℕ} {h : Fin k → ℕ → ℝ} (w : Fin k → ℝ)
    (hs : ∀ p, Summable fun n => |h p n|) :
    Summable fun n => |∑ p, w p * h p n| := by
  refine Summable.of_nonneg_of_le (fun _ => abs_nonneg _)
    (fun n => (abs_sum_le_sum_abs _ _).trans ?_)
    (summable_sum fun p (_ : p ∈ univ) => (hs p).mul_left |w p|)
  exact le_of_eq (sum_congr rfl fun p _ => abs_mul (w p) (h p n))

theorem radialKernel_convex_comb {k : ℕ} {h : Fin k → ℕ → ℝ} (w : Fin k → ℝ)
    (hs : ∀ p, Summable fun n => |h p n|) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    radialKernel (fun n => ∑ p, w p * h p n) z = ∑ p, (w p : ℂ) * radialKernel (h p) z := by
  unfold radialKernel
  have hterm : ∀ p : Fin k, Summable fun n : ℕ =>
      (w p : ℂ) * ((h p n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))) := fun p => by
    refine (Summable.of_norm_bounded (hs p) fun n => ?_).mul_left (w p : ℂ)
    rw [norm_mul, norm_mul, norm_pow, Complex.norm_real, Complex.norm_real,
      Real.norm_eq_abs, Real.norm_eq_abs, abs_norm, ← pow_succ']
    exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ (norm_nonneg _) hz)
  have heq : (fun n : ℕ => ((∑ p, w p * h p n : ℝ) : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n)))
      = fun n : ℕ => ∑ p, (w p : ℂ) * ((h p n : ℂ) * (z * ((‖z‖ : ℝ) : ℂ) ^ (2 * n))) := by
    funext n; rw [Complex.ofReal_sum, sum_mul]
    exact sum_congr rfl fun _ _ => by push_cast; ring
  rw [heq, Summable.tsum_finsetSum (fun p _ => hterm p)]
  exact sum_congr rfl fun _ _ => tsum_mul_left

/-- **Multi-channel convex transfer directly from `Ival` head lists + Hardy tail bounds.** -/
theorem convex_transfer_ival {k : ℕ} {wQ : Fin k → ℚ} {h : Fin k → ℕ → ℝ}
    {headI : Fin k → List Ival} {tl : Fin k → ℝ} {K : ℕ} {cQ headCapQ : ℚ} {δ : ℝ}
    (hw0 : ∀ p, 0 ≤ (wQ p : ℝ)) (hw1 : ∑ p, (wQ p : ℝ) = 1)
    (hs : ∀ p, Summable fun n => |h p n|)
    (hdom : ∀ p, DominatedKernel (radialKernel (h p)))
    (hmem : ∀ p n, n < K + 1 → mem (h p n) ((headI p).getD n zeroI))
    (htail : ∀ p, ∑' n, |h p (n + (K + 1))| ≤ tl p)
    (hhead : absSum (addL (sumL ((List.finRange k).map fun p =>
        (headI p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI cQ)]) ≤ ofRatLo headCapQ)
    (hδ : (headCapQ : ℝ) + ∑ p, (wQ p : ℝ) * tl p ≤ δ)
    (hδc : δ < (cQ : ℝ)) :
    IsBound (1 / ((cQ : ℝ) - δ)) := by
  let w : Fin k → ℝ := fun p => (wQ p : ℝ)
  let H : ℕ → ℝ := fun n => ∑ p, w p * h p n
  have hsH : Summable fun n => |H n| := summable_convex_comb w hs
  have hdomH : DominatedKernel (radialKernel H) :=
    dominatedKernel_congr_ball (dominatedKernel_convex_comb hw0 hw1 hdom) fun _ hz =>
      (radialKernel_convex_comb w hs hz).symm
  refine transfer H hsH hdomH hδc ?_
  rw [residual_split H hsH (cQ : ℝ) K]
  -- 1. Interval head bound
  let chPoly : Fin k → ℝ[X] := fun p => ∑ n ∈ range (K + 1), monomial n (h p n)
  have hch_coeff : ∀ p n, n < K + 1 → (chPoly p).coeff n = h p n := fun p n hn => by
    simp only [chPoly, finsetSum_coeff, coeff_monomial]
    rw [sum_eq_single n (fun b _ hbn => by simp [hbn]) (fun hnp => absurd (mem_range.2 hn) hnp)]
    simp
  have hmem_ch : ∀ p ∈ List.finRange k,
      memB (K + 1) (C (w p) * chPoly p) ((headI p).map (mulI (ofRatI (wQ p)))) :=
    fun p _ => memB_C_mul (mem_ofRatI (wQ p)) fun n hn => by
      rw [hch_coeff p n hn]; exact hmem p n hn
  have hsumB := memB_add (memB_sumL _ _ (List.finRange k) hmem_ch)
    (memB_single (N := K + 1) (mem_neg (mem_ofRatI cQ)))
  have h1 := absSum_le hsumB
  have h2 : (absSum (addL (sumL ((List.finRange k).map fun p =>
      (headI p).map (mulI (ofRatI (wQ p))))) [negI (ofRatI cQ)]) : ℝ) ≤ (headCapQ : ℝ) * D :=
    (Int.cast_le.2 hhead).trans (ofRatLo_le headCapQ)
  have hH_head : ∑ n ∈ range (K + 1), |H n - if n = 0 then (cQ : ℝ) else 0| ≤ (headCapQ : ℝ) := by
    refine le_of_mul_le_mul_right ((le_of_eq ?_).trans (h1.trans h2)) D_pos
    congr 1
    refine sum_congr rfl fun n hn => ?_
    rw [coeff_add, coeff_C, ← Fin.sum_univ_def, finsetSum_coeff]
    have hsum_eq : ∑ x : Fin k, (C (w x) * chPoly x).coeff n = H n :=
      sum_congr rfl fun p _ => by rw [coeff_C_mul, hch_coeff p n (mem_range.1 hn)]
    rw [hsum_eq]; congr 1; split_ifs <;> ring
  -- 2. Tail bound
  have hH_tail : ∑' n, |H (n + (K + 1))| ≤ ∑ p, w p * tl p := by
    refine Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _) fun J => ?_
    calc ∑ n ∈ range J, |H (n + (K + 1))|
        ≤ ∑ n ∈ range J, ∑ p, w p * |h p (n + (K + 1))| :=
          sum_le_sum fun n _ => (abs_sum_le_sum_abs _ _).trans
            (le_of_eq (sum_congr rfl fun p _ => by rw [abs_mul, abs_of_nonneg (hw0 p)]))
      _ = ∑ p, w p * ∑ n ∈ range J, |h p (n + (K + 1))| := by
          rw [sum_comm]; exact sum_congr rfl fun _ _ => (mul_sum _ _ _).symm
      _ ≤ ∑ p, w p * tl p :=
          sum_le_sum fun p _ => mul_le_mul_of_nonneg_left
            ((((summable_nat_add_iff (K + 1)).2 (hs p)).sum_le_tsum (range J)
              fun _ _ => abs_nonneg _).trans (htail p)) (hw0 p)
  linarith

end

end Grothe.Upper
