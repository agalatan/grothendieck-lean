import Grothe.Upper.Realise

/-!
# Composition of radial kernels

For a coefficient sequence `c` with `Σ |c_k| < ∞` and a real polynomial `P` with `‖P‖_𝒜 ≤ 1`
(preprocessor `p(t) = t·P(t²)`), the real composition `Σ_k c_k p(t)^{2k+1}` has radial
coefficients

  `compCoeff c P n = Σ'_k c_k [Xⁿ] (X^k P^{2k+1})`        (`p(t)^{2k+1} = t·(X^k P^{2k+1})(t²)`).

* `summable_abs_compCoeff`, `tsum_abs_compCoeff_le`: `Σ_n |compCoeff c P n| ≤ Σ_k |c_k|`;
* `radialKernel_polyKernel`: on the closed unit disk the physical kernels compose,
  `radialKernel c (polyKernel P z) = radialKernel (compCoeff c P) z`;
* `DominatedKernel.comp_radial`: if `radialKernel c` is dominated, so is
  `radialKernel (compCoeff c P)` (tensor realisation of `p`, `Realise.lean`).

With `transfer` this turns a single rounding identity (`radialKernel c` dominated, e.g. Haagerup's
phase rounding) and a finite computation of `compCoeff c P` into a Grothendieck bound.
-/

namespace Grothe

open scoped ComplexConjugate
open Finset Polynomial

noncomputable section

/-- `X^k P^{2k+1}`: the polynomial with `p(t)^{2k+1} = t · (X^k P^{2k+1})(t²)`. -/
def compTerm (P : ℝ[X]) (k : ℕ) : ℝ[X] := X ^ k * P ^ (2 * k + 1)

lemma l1_compTerm_le {P : ℝ[X]} (hP : l1 P ≤ 1) (k : ℕ) : l1 (compTerm P k) ≤ 1 := by
  have h : ∀ (R : ℝ[X]) (j : ℕ), l1 R ≤ 1 → l1 (R ^ j) ≤ 1 := fun R j hR =>
    (l1_pow_le R j).trans (pow_le_one₀ (l1_nonneg R) hR)
  exact (l1_mul_le _ _).trans ((mul_le_mul (h _ _ l1_X.le) (h _ _ hP) (l1_nonneg _)
    zero_le_one).trans (one_mul 1).le)

/-- The radial coefficients of the composition `Σ_k c_k p(t)^{2k+1}`. -/
def compCoeff (c : ℕ → ℝ) (P : ℝ[X]) (n : ℕ) : ℝ := ∑' k, c k * (compTerm P k).coeff n

lemma summable_compCoeff_term {c : ℕ → ℝ} (hc : Summable fun k => |c k|) {P : ℝ[X]}
    (hP : l1 P ≤ 1) (n : ℕ) : Summable fun k => c k * (compTerm P k).coeff n :=
  Summable.of_norm_bounded hc fun k => by
    rw [Real.norm_eq_abs, abs_mul]
    exact mul_le_of_le_one_right (abs_nonneg _)
      ((abs_coeff_le_l1 _ n).trans (l1_compTerm_le hP k))

lemma sum_abs_compCoeff_le {c : ℕ → ℝ} (hc : Summable fun k => |c k|) {P : ℝ[X]}
    (hP : l1 P ≤ 1) (J : ℕ) : ∑ n ∈ range J, |compCoeff c P n| ≤ ∑' k, |c k| := by
  exact sum_abs_tsum_le (range J) (fun k n => c k * (compTerm P k).coeff n)
    (fun n _ => (summable_compCoeff_term hc hP n).norm) hc fun k => by
      simp only [abs_mul, ← mul_sum]
      exact mul_le_of_le_one_right (abs_nonneg _) ((sum_abs_coeff_le_l1 _ _).trans
        (l1_compTerm_le hP k))

theorem summable_abs_compCoeff {c : ℕ → ℝ} (hc : Summable fun k => |c k|) {P : ℝ[X]}
    (hP : l1 P ≤ 1) : Summable fun n => |compCoeff c P n| :=
  summable_of_sum_range_le (fun _ => abs_nonneg _) (sum_abs_compCoeff_le hc hP)

theorem tsum_abs_compCoeff_le {c : ℕ → ℝ} (hc : Summable fun k => |c k|) {P : ℝ[X]}
    (hP : l1 P ≤ 1) : ∑' n, |compCoeff c P n| ≤ ∑' k, |c k| :=
  Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _) (sum_abs_compCoeff_le hc hP)

/-! ### Evaluation -/

/-- A polynomial as a power series: `Σ'_n [Xⁿ]T · xⁿ = T(x)`. -/
lemma tsum_coeff_mul_pow (T : ℝ[X]) (x : ℝ) : ∑' n, T.coeff n * x ^ n = T.eval x := by
  rw [tsum_eq_sum (s := range (T.natDegree + 1)) fun n hn => by
    rw [coeff_eq_zero_of_natDegree_lt (by simpa using hn), zero_mul], eval_eq_sum_range]

lemma summable_coeff_mul_pow (T : ℝ[X]) (x : ℝ) : Summable fun n => |T.coeff n * x ^ n| :=
  summable_of_ne_finset_zero (s := range (T.natDegree + 1)) fun n hn => by
    rw [coeff_eq_zero_of_natDegree_lt (by simpa using hn), zero_mul, abs_zero]

lemma tsum_abs_coeff_mul_pow_le (T : ℝ[X]) {x : ℝ} (hx0 : 0 ≤ x) (hx : x ≤ 1) :
    ∑' n, |T.coeff n * x ^ n| ≤ l1 T := by
  apply Real.tsum_le_of_sum_range_le (fun _ => abs_nonneg _)
  intro N
  refine (sum_le_sum fun n _ => ?_).trans (sum_abs_coeff_le_l1 T N)
  rw [abs_mul, abs_of_nonneg (pow_nonneg hx0 n)]
  exact mul_le_of_le_one_right (abs_nonneg _) (pow_le_one₀ hx0 hx)

/-- **The real composition identity**: for `0 ≤ x ≤ 1`,
`Σ'_n compCoeff c P n · xⁿ = Σ'_k c_k x^k P(x)^{2k+1}`. -/
theorem tsum_compCoeff_mul_pow {c : ℕ → ℝ} (hc : Summable fun k => |c k|) {P : ℝ[X]}
    (hP : l1 P ≤ 1) {x : ℝ} (hx0 : 0 ≤ x) (hx : x ≤ 1) :
    ∑' n, compCoeff c P n * x ^ n = ∑' k, c k * (x ^ k * P.eval x ^ (2 * k + 1)) := by
  set f : ℕ → ℕ → ℝ := fun k n => c k * (compTerm P k).coeff n * x ^ n with hf
  have hsum : Summable (Function.uncurry f) := by
    refine Summable.of_norm ?_
    have hnn : 0 ≤ fun q : ℕ × ℕ => ‖Function.uncurry f q‖ := fun q => norm_nonneg _
    refine (summable_prod_of_nonneg hnn).2 ⟨fun k => ?_, ?_⟩
    · simp only [Function.uncurry_apply_pair, hf, Real.norm_eq_abs, mul_assoc, abs_mul]
      exact ((summable_coeff_mul_pow (compTerm P k) x).mul_left |c k|).congr fun n => by
        rw [abs_mul]
    · refine Summable.of_nonneg_of_le (fun k => tsum_nonneg fun n => norm_nonneg _)
        (fun k => ?_) hc
      simp only [Function.uncurry_apply_pair, hf, Real.norm_eq_abs, mul_assoc, abs_mul]
      rw [tsum_mul_left]
      refine mul_le_of_le_one_right (abs_nonneg _) ?_
      have := tsum_abs_coeff_mul_pow_le (compTerm P k) hx0 hx
      simp only [abs_mul] at this
      exact this.trans (l1_compTerm_le hP k)
  have e1 : ∀ n, compCoeff c P n * x ^ n = ∑' k, f k n := fun n => by
    rw [compCoeff, ← tsum_mul_right]
  have e2 : ∀ k, ∑' n, f k n = c k * (x ^ k * P.eval x ^ (2 * k + 1)) := fun k => by
    simp only [hf, mul_assoc]
    rw [tsum_mul_left, tsum_coeff_mul_pow, compTerm, eval_mul, eval_pow, eval_X, eval_pow]
  simp only [e1, ← e2]
  exact hsum.tsum_comm

/-- `‖P(x)‖ ≤ ‖P‖_𝒜 ≤ 1` on `[0, 1]`. -/
lemma abs_eval_le_l1 (P : ℝ[X]) {x : ℝ} (hx0 : 0 ≤ x) (hx : x ≤ 1) : |P.eval x| ≤ l1 P := by
  simpa only [Real.norm_eq_abs, tsum_coeff_mul_pow] using
    (norm_tsum_le_tsum_norm (f := fun n => P.coeff n * x ^ n)
      (summable_coeff_mul_pow P x)).trans (tsum_abs_coeff_mul_pow_le P hx0 hx)

/-- `radialKernel h z = z · Σ'_n hₙ |z|^{2n}`. -/
lemma radialKernel_eq_mul (h : ℕ → ℝ) (z : ℂ) :
    radialKernel h z = z * ((∑' n, h n * (‖z‖ ^ 2) ^ n : ℝ) : ℂ) := by
  rw [radialKernel, Complex.ofReal_tsum, ← tsum_mul_left]
  exact tsum_congr fun n => by push_cast; rw [pow_mul]; ring

/-- **Composition of physical kernels** on the closed unit disk. -/
theorem radialKernel_polyKernel {c : ℕ → ℝ} (hc : Summable fun k => |c k|) {P : ℝ[X]}
    (hP : l1 P ≤ 1) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    radialKernel c (polyKernel P z) = radialKernel (compCoeff c P) z := by
  have hx0 : 0 ≤ ‖z‖ ^ 2 := sq_nonneg _
  have hx1 : ‖z‖ ^ 2 ≤ 1 := pow_le_one₀ (norm_nonneg _) hz
  rw [radialKernel_eq_mul (compCoeff c P), tsum_compCoeff_mul_pow hc hP hx0 hx1, radialKernel,
    Complex.ofReal_tsum, ← tsum_mul_left]
  refine tsum_congr fun k => ?_
  rw [polyKernel, norm_mul, Complex.norm_real, Real.norm_eq_abs]
  push_cast
  rw [mul_pow, pow_mul, pow_mul, ← Complex.ofReal_pow, ← Complex.ofReal_pow (|_|),
    sq_abs, Complex.ofReal_pow, Complex.ofReal_pow]
  ring

/-- Dominated kernels only matter on the closed unit disk. -/
theorem DominatedKernel.congr_disk {Q Q' : ℂ → ℂ} (hQ : DominatedKernel Q)
    (h : ∀ z : ℂ, ‖z‖ ≤ 1 → Q z = Q' z) : DominatedKernel Q' := by
  intro m n A ι _ x y hx hy
  have e : ∀ i j, Q' (inner ℂ (x i) (y j)) = Q (inner ℂ (x i) (y j)) := fun i j =>
    (h _ (by simpa [hx, hy] using norm_inner_le_norm (𝕜 := ℂ) (x i) (y j))).symm
  simp only [e]
  exact hQ m n A ι x y hx hy

/-- **Preprocessing a radial rounding kernel.** -/
theorem DominatedKernel.comp_radial {c : ℕ → ℝ} (hc : Summable fun k => |c k|)
    (hQ : DominatedKernel (radialKernel c)) {P : ℝ[X]} (hP : l1 P ≤ 1) :
    DominatedKernel (radialKernel (compCoeff c P)) :=
  (hQ.comp_poly P hP).congr_disk fun _ hz => radialKernel_polyKernel hc hP hz

/-- **Transfer through a preprocessor**: a dominated radial kernel `c`, a preprocessor `P` and a
bound on the residual of the composition against `s·t` give `K_G^ℂ ≤ 1/(s − δ)`. -/
theorem transfer_comp {c : ℕ → ℝ} (hc : Summable fun k => |c k|)
    (hQ : DominatedKernel (radialKernel c)) {P : ℝ[X]} (hP : l1 P ≤ 1) {s δ : ℝ} (hδ : δ < s)
    (hres : |compCoeff c P 0 - s| + ∑' n, |compCoeff c P (n + 1)| ≤ δ) :
    IsGrothendieckBound (1 / (s - δ)) :=
  transfer _ (summable_abs_compCoeff hc hP) (hQ.comp_radial hc hP) hδ hres

end

end Grothe
