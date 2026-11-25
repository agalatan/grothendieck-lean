import Haagerup.Statement
import HaagerupKernel.Basic
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Order.Field.GeomSum
import Mathlib.Topology.Algebra.InfiniteSum.Real

set_option warningAsError true

/-!
# Transfer inequality, Hardy tail, bivariate composition, and convex combinations of channels

Self-contained development connecting unimodular rounding kernels to upper bounds on the complex
Grothendieck constant `Haagerup.Statement.complexGrothendieckConstant`:

1. **Domination and tensor powers**: dominated kernels (`DominatedKernel`),
   monomials `z |z|^{2n}` are realised by unit tensor powers (`inner_tpow`, `norm_tpow`), and
   `transfer` bounds `IsBound (1 / (c - δ))` from the `ℓ¹` residual of `radialKernel h` against `c z`.
2. **Residual split and Hardy tail**: `residual_split` and `hardy_tail`
   bound the tail `∑_{n > K} |hₙ|` by Cauchy–Schwarz from a circle mean-square budget at radius `r > 1`.
3. **Wiener `ℓ¹` algebra and bivariate kernels**: `l1`, `termOf`, `bivarKernel`, `bivarKernel_eq_head`,
   and `onedTable` (`bivarKernel_oned_eq_head`).
4. **Intervals and convex combinations**: membership `mem` in a 128-bit interval, rational polynomials `ofListQ`,
   and convex combinations of channels (`summable_convex_comb`, `radialKernel_convex_comb`).

-/

namespace Haagerup

open scoped ComplexConjugate
open Finset MeasureTheory Polynomial Haagerup.Statement HaagerupKernel

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

/-! ### 5. Membership in 128-bit intervals; rational polynomials -/

lemma D_pos : (0 : ℝ) < (D : ℝ) := by unfold D K; positivity

def mem (x : ℝ) (I : Ival) : Prop := (I.lo : ℝ) ≤ x * D ∧ x * D ≤ I.hi

lemma mem_zeroI_iff (x : ℝ) : mem x zeroI ↔ x = 0 := by
  simp only [mem, zeroI, Int.cast_zero, ← le_antisymm_iff, eq_comm (a := (0 : ℝ)), mul_eq_zero,
    D_pos.ne', or_false]

lemma mem_zero : mem 0 zeroI := (mem_zeroI_iff 0).2 rfl

lemma mem_add {x y : ℝ} {a b : Ival} (hx : mem x a) (hy : mem y b) : mem (x + y) (addI a b) := by
  unfold mem addI at *; push_cast; constructor <;> linarith [hx.1, hx.2, hy.1, hy.2]

/-- Polynomial with rational coefficients `c₀ + X (c₁ + …)`. -/
def ofListQ : List ℚ → ℝ[X]
  | [] => 0
  | a :: l => C (a : ℝ) + X * ofListQ l

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

/-- Flattened list of index pairs `(n, m)` appearing in `rows`. -/
def flatIdx (rows : List RowI) : List (ℕ × ℕ) :=
  rows.flatMap fun r => r.2.map fun e => (e.1, r.1)

/-! ### 6. Convex combinations of channels -/

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

end

end Haagerup
