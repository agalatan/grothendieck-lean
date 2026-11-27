import Grothe.LowerAnalytic.GramBudget
import Grothe.LowerAnalytic.CircularFourth

/-!
# The antiholomorphic Stein calculus for circular cubic Gaussian chaos

For a circular cubic `q = a + i b` (`Circular J a b`, `Chaos3 a`, `E a² = 1/2`) in real coordinates
with complex structure `J` (`Jᵀ = −J`, `J² = −1`), this file formalizes the Wirtinger gradient
energies `c₁ = Σ_j |∂_j q|²` (`radC1`) and `c₂ = Σ_j |∂̄_j q|²` (`radC2`), their signed difference
`D = c₁ − c₂` (`radD`), and the antiholomorphic Stein identities and variance formulas of
ledger 6.3.20 / row 3.7:

* **Algebraic split and pointwise cone:** `c₁ ≥ 0`, `c₂ ≥ 0`, `c₁ + c₂ = S` (`radC1_add_radC2`),
  `c₁ − c₂ = D` (`radC1_sub_radC2`), and `ρ² ≤ |a|² = (A² + B²)/4 ≤ c₁ c₂`
  (`radAB_sq_le_radC1_mul_radC2`, `radRho_sq_le_radC1_mul_radC2`, where `ρ = (3/2) r`).
* **Rotation Stein identity and separate radial identities `(I)`, `(II)`:** for every `RadialTest`
  `H`, `E[U H(U)] = E[D (H(U) + U H'(U))]` (`radial_parts_rot`). Combined with `radial_cut`,
  `fluctuation_mean` and `energy_identity`, every piecewise-linear-plus-slope test `φ` with
  primitive `G` and `Y = φ − G/v` satisfies
    `(I)  E[G(U)] = E[c₂ φ(U) + ρ Y(U)]`             (`antiStein_I`)
    `(II) E[G(U)] = (1/2) E[c₁ φ(U) + ρ Y(U)]`       (`antiStein_II`).
* **Exact contraction variances:** the antiholomorphic gradient components `F_k = ∂̄_k q` lie in the
  second chaos with constant second derivative `∂_m ∂_n F_k = 2 t_{mnk}` (`t = gramT J a b`),
  giving the chaos-2 and chaos-4 decomposition of `c₂ − 1` and
    `E[(c₂ − 1)²] = 16n + 4h`                        (`Circular.gE_radC2_sub_one_sq`)
    `E[(c₁ − c₂ − 1)²] = 16n + 20h + 16b`            (`Circular.gE_radD_sub_one_sq`)
    `E[(c₁ − 2)²] = 32n + 16h + 16b + 48y + 16z`     (`Circular.gE_radC1_sub_two_sq`)
  together with the complex fourth-moment identity
    `E U² − 2 = v₂ + v₄ + 2 E[(c₂ − 1)²]`            (`Circular.fourth_moment_antistein`).
-/

open MeasureTheory MvPolynomial Grothe.Lower ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

section pointwise

variable {ι : Type*} [Fintype ι]

/-- `J`-rotated gradient `(J ∇P)_i = Σ_j J_{i,j} ∂_j P`. -/
def jGrad (J : ι → ι → ℝ) (P : MvPolynomial ι ℝ) (i : ι) : MvPolynomial ι ℝ :=
  ∑ j, C (J i j) * pderiv j P

/-- Real part of the holomorphic Wirtinger derivative `∂_i q`. -/
def holRe (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) (i : ι) : MvPolynomial ι ℝ :=
  C (1 / 2 : ℝ) * (pderiv i a + jGrad J b i)

/-- Imaginary part of the holomorphic Wirtinger derivative `∂_i q`. -/
def holIm (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) (i : ι) : MvPolynomial ι ℝ :=
  C (1 / 2 : ℝ) * (pderiv i b - jGrad J a i)

/-- Real part of the antiholomorphic Wirtinger derivative `∂̄_i q`. -/
def antiRe (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) (i : ι) : MvPolynomial ι ℝ :=
  C (1 / 2 : ℝ) * (pderiv i a - jGrad J b i)

/-- Imaginary part of the antiholomorphic Wirtinger derivative `∂̄_i q`. -/
def antiIm (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) (i : ι) : MvPolynomial ι ℝ :=
  C (1 / 2 : ℝ) * (pderiv i b + jGrad J a i)

/-- Holomorphic gradient energy `c₁ = Σ_i |∂_i q|²`. -/
def radC1 (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  ∑ i, (holRe J a b i * holRe J a b i + holIm J a b i * holIm J a b i)

/-- Antiholomorphic gradient energy `c₂ = Σ_i |∂̄_i q|²`. -/
def radC2 (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  ∑ i, (antiRe J a b i * antiRe J a b i + antiIm J a b i * antiIm J a b i)

/-- Signed difference `D = c₁ − c₂ = 2 Σ_{i,j} J_{i,j} (∂_i a)(∂_j b)`. -/
def radD (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  2 * ∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b)

lemma eval_radC1_nonneg (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) (x : ι → ℝ) :
    0 ≤ eval x (radC1 J a b) := by
  simp only [radC1, map_sum, map_add, map_mul]
  exact Finset.sum_nonneg fun i _ ↦
    add_nonneg (mul_self_nonneg _) (mul_self_nonneg _)

lemma eval_radC2_nonneg (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) (x : ι → ℝ) :
    0 ≤ eval x (radC2 J a b) := by
  simp only [radC2, map_sum, map_add, map_mul]
  exact Finset.sum_nonneg fun i _ ↦
    add_nonneg (mul_self_nonneg _) (mul_self_nonneg _)

/-- Orthogonality of a complex structure `J` on polynomial vectors: `Σ_i (J v)_i² = Σ_i v_i²`. -/
lemma sum_jGrad_sq {J : ι → ι → ℝ} (hJ : IsCplx J) (P : MvPolynomial ι ℝ) :
    ∑ i, jGrad J P i * jGrad J P i = ∑ j, pderiv j P * pderiv j P := by
  classical
  have h1 : ∑ i, jGrad J P i * jGrad J P i
      = ∑ j, ∑ k, C (∑ i, J i j * J i k) * (pderiv j P * pderiv k P) := by
    simp only [jGrad, Finset.sum_mul, Finset.mul_sum, map_sum, map_mul]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun k _ ↦ ?_
    refine Finset.sum_congr rfl fun i _ ↦ by ring
  rw [h1]
  refine Finset.sum_congr rfl fun j _ ↦ ?_
  have hrow : ∀ k, ∑ i, J i j * J i k = if k = j then 1 else 0 := fun k ↦ by
    have hneg : ∑ i, J i j * J i k = -(∑ i, J j i * J i k) := by
      rw [← Finset.sum_neg_distrib]
      refine Finset.sum_congr rfl fun i _ ↦ ?_
      rw [hJ.anti i j]; ring
    rw [hneg]
    split_ifs with hkj
    · subst hkj; rw [hJ.sq_diag]; ring
    · rw [hJ.sq_off j k (Ne.symm hkj)]; ring
  simp only [hrow]
  rw [Finset.sum_eq_single j]
  · simp
  · intro k _ hkj; simp [hkj]
  · intro hj; exact absurd (Finset.mem_univ j) hj

/-- Orthogonality of `J` as an inner product: `Σ_i (J∇a)_i (J∇b)_i = Σ_i (∂_i a)(∂_i b)`. -/
lemma sum_jGrad_mul {J : ι → ι → ℝ} (hJ : IsCplx J) (a b : MvPolynomial ι ℝ) :
    ∑ i, jGrad J a i * jGrad J b i = ∑ j, pderiv j a * pderiv j b := by
  classical
  have h1 : ∑ i, jGrad J a i * jGrad J b i
      = ∑ j, ∑ k, C (∑ i, J i j * J i k) * (pderiv j a * pderiv k b) := by
    calc ∑ i, jGrad J a i * jGrad J b i
        = ∑ i, ∑ j, ∑ k, C (J i j * J i k) * (pderiv j a * pderiv k b) := by
          refine Finset.sum_congr rfl fun i _ ↦ ?_
          simp only [jGrad, Finset.sum_mul, Finset.mul_sum, map_mul]
          rw [Finset.sum_comm]
          refine Finset.sum_congr rfl fun j _ ↦ Finset.sum_congr rfl fun k _ ↦ by ring
      _ = ∑ j, ∑ k, ∑ i, C (J i j * J i k) * (pderiv j a * pderiv k b) := by
          rw [Finset.sum_comm]
          exact Finset.sum_congr rfl fun j _ ↦ Finset.sum_comm
      _ = ∑ j, ∑ k, C (∑ i, J i j * J i k) * (pderiv j a * pderiv k b) := by
          refine Finset.sum_congr rfl fun j _ ↦ Finset.sum_congr rfl fun k _ ↦ ?_
          rw [map_sum, Finset.sum_mul]
  rw [h1]
  refine Finset.sum_congr rfl fun j _ ↦ ?_
  have hrow : ∀ k, ∑ i, J i j * J i k = if k = j then 1 else 0 := fun k ↦ by
    have hneg : ∑ i, J i j * J i k = -(∑ i, J j i * J i k) := by
      rw [← Finset.sum_neg_distrib]
      refine Finset.sum_congr rfl fun i _ ↦ ?_
      rw [hJ.anti i j]; ring
    rw [hneg]
    split_ifs with hkj
    · subst hkj; rw [hJ.sq_diag]; ring
    · rw [hJ.sq_off j k (Ne.symm hkj)]; ring
  simp only [hrow]
  rw [Finset.sum_eq_single j]
  · simp
  · intro k _ hkj; simp [hkj]
  · intro hj; exact absurd (Finset.mem_univ j) hj

/-- `c₁ + c₂ = S = Σ_i ((∂_i a)² + (∂_i b)²)`. -/
theorem radC1_add_radC2 {J : ι → ι → ℝ} (hJ : IsCplx J) (a b : MvPolynomial ι ℝ) :
    radC1 J a b + radC2 J a b = radS a b := by
  have hsum : radC1 J a b + radC2 J a b
      = C (1 / 2 : ℝ) * (∑ i, pderiv i a * pderiv i a + ∑ i, pderiv i b * pderiv i b
          + ∑ i, jGrad J a i * jGrad J a i + ∑ i, jGrad J b i * jGrad J b i) := by
    have hc : (C (1 / 2 : ℝ) : MvPolynomial ι ℝ) * C (1 / 2 : ℝ) = C (1 / 4 : ℝ) := by
      rw [← map_mul]; norm_num
    have hc2 : (2 : MvPolynomial ι ℝ) * C (1 / 4 : ℝ) = C (1 / 2 : ℝ) := by
      rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← map_mul]; norm_num
    simp only [radC1, radC2, holRe, holIm, antiRe, antiIm, ← Finset.sum_add_distrib,
      Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    linear_combination
      (pderiv i a * pderiv i a + pderiv i b * pderiv i b
        + jGrad J a i * jGrad J a i + jGrad J b i * jGrad J b i) * (2 * hc + hc2)
  rw [hsum, sum_jGrad_sq hJ a, sum_jGrad_sq hJ b]
  have h2 : (C (1 / 2 : ℝ) : MvPolynomial ι ℝ) * (2 : MvPolynomial ι ℝ) = 1 := by
    rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← map_mul]; norm_num
  simp only [radS, gam]
  linear_combination (∑ i, pderiv i a * pderiv i a + ∑ i, pderiv i b * pderiv i b) * h2

/-- `c₁ − c₂ = D = 2 Σ_{i,j} J_{i,j} (∂_i a)(∂_j b)`. -/
theorem radC1_sub_radC2 {J : ι → ι → ℝ} (hJ : IsCplx J) (a b : MvPolynomial ι ℝ) :
    radC1 J a b - radC2 J a b = radD J a b := by
  have hdiff : radC1 J a b - radC2 J a b
      = ∑ i, (pderiv i a * jGrad J b i - pderiv i b * jGrad J a i) := by
    have hc : (4 : MvPolynomial ι ℝ) * (C (1 / 2 : ℝ) * C (1 / 2 : ℝ)) = 1 := by
      rw [show (4 : MvPolynomial ι ℝ) = C 4 from (map_ofNat C 4).symm, ← map_mul, ← map_mul]
      norm_num
    simp only [radC1, radC2, holRe, holIm, antiRe, antiIm, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    linear_combination (pderiv i a * jGrad J b i - pderiv i b * jGrad J a i) * hc
  rw [hdiff, Finset.sum_sub_distrib]
  have h1 : ∑ i, pderiv i a * jGrad J b i = ∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b) := by
    simp only [jGrad, Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
  have h2 : ∑ i, pderiv i b * jGrad J a i
      = -(∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b)) := by
    simp only [jGrad, Finset.mul_sum]
    rw [Finset.sum_comm, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [hJ.anti j i, map_neg]; ring
  rw [h1, h2, radD]; ring

/-- `radA / 2 = Σ_i (u_i u'_i − v_i v'_i)` for `u + i v = ∂ q`, `u' + i v' = ∂̄ q`. -/
lemma radA_eq_wirtinger {J : ι → ι → ℝ} (hJ : IsCplx J) (a b : MvPolynomial ι ℝ) :
    C (1 / 2 : ℝ) * radA a b
      = ∑ i, (holRe J a b i * antiRe J a b i - holIm J a b i * antiIm J a b i) := by
  have hrhs : ∑ i, (holRe J a b i * antiRe J a b i - holIm J a b i * antiIm J a b i)
      = C (1 / 4 : ℝ) * (∑ i, pderiv i a * pderiv i a - ∑ i, pderiv i b * pderiv i b
          + ∑ i, jGrad J a i * jGrad J a i - ∑ i, jGrad J b i * jGrad J b i) := by
    have hc : (C (1 / 2 : ℝ) : MvPolynomial ι ℝ) * C (1 / 2 : ℝ) = C (1 / 4 : ℝ) := by
      rw [← map_mul]; norm_num
    rw [mul_sub, mul_add, mul_sub, Finset.mul_sum, Finset.mul_sum, Finset.mul_sum, Finset.mul_sum,
      ← Finset.sum_sub_distrib, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    simp only [holRe, holIm, antiRe, antiIm]
    linear_combination
      (pderiv i a * pderiv i a - jGrad J b i * jGrad J b i
        - pderiv i b * pderiv i b + jGrad J a i * jGrad J a i) * hc
  rw [hrhs, sum_jGrad_sq hJ a, sum_jGrad_sq hJ b]
  have h2 : (C (1 / 4 : ℝ) : MvPolynomial ι ℝ) * (2 : MvPolynomial ι ℝ) = C (1 / 2 : ℝ) := by
    rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← map_mul]; norm_num
  simp only [radA, gam]
  linear_combination -(∑ i, pderiv i a * pderiv i a - ∑ i, pderiv i b * pderiv i b) * h2

/-- `radB / 2 = Σ_i (u_i v'_i + v_i u'_i)`. -/
lemma radB_eq_wirtinger {J : ι → ι → ℝ} (hJ : IsCplx J) (a b : MvPolynomial ι ℝ) :
    C (1 / 2 : ℝ) * radB a b
      = ∑ i, (holRe J a b i * antiIm J a b i + holIm J a b i * antiRe J a b i) := by
  have hrhs : ∑ i, (holRe J a b i * antiIm J a b i + holIm J a b i * antiRe J a b i)
      = C (1 / 2 : ℝ) * (∑ i, pderiv i a * pderiv i b + ∑ i, jGrad J a i * jGrad J b i) := by
    have hc : (C (1 / 2 : ℝ) : MvPolynomial ι ℝ) * C (1 / 2 : ℝ) = C (1 / 4 : ℝ) := by
      rw [← map_mul]; norm_num
    have hc2 : (2 : MvPolynomial ι ℝ) * C (1 / 4 : ℝ) = C (1 / 2 : ℝ) := by
      rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← map_mul]; norm_num
    simp only [holRe, holIm, antiRe, antiIm, Finset.mul_sum, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    linear_combination
      (pderiv i a * pderiv i b + jGrad J a i * jGrad J b i) * (2 * hc + hc2)
  rw [hrhs, sum_jGrad_mul hJ a b]
  simp only [radB, gam]
  ring

/-- **Pointwise Cauchy–Schwarz cone:** `|a|² = (A² + B²)/4 ≤ c₁ c₂`. -/
theorem radAB_sq_le_radC1_mul_radC2 {J : ι → ι → ℝ} (hJ : IsCplx J)
    (a b : MvPolynomial ι ℝ) (x : ι → ℝ) :
    (eval x (radA a b) ^ 2 + eval x (radB a b) ^ 2) / 4
      ≤ eval x (radC1 J a b) * eval x (radC2 J a b) := by
  let u : ι → ℂ := fun i ↦ ⟨eval x (holRe J a b i), eval x (holIm J a b i)⟩
  let v : ι → ℂ := fun i ↦ ⟨eval x (antiRe J a b i), eval x (antiIm J a b i)⟩
  have hRe : (∑ i, u i * v i).re = eval x (radA a b) / 2 := by
    have hA := congrArg (eval x) (radA_eq_wirtinger hJ a b)
    simp only [map_mul, eval_C, map_sum, map_sub] at hA
    rw [Complex.re_sum]
    simp only [u, v, Complex.mul_re]
    linarith
  have hIm : (∑ i, u i * v i).im = eval x (radB a b) / 2 := by
    have hB := congrArg (eval x) (radB_eq_wirtinger hJ a b)
    simp only [map_mul, eval_C, map_sum, map_add] at hB
    rw [Complex.im_sum]
    simp only [u, v, Complex.mul_im]
    linarith
  have hNorm : ‖∑ i, u i * v i‖ ^ 2 = (eval x (radA a b) ^ 2 + eval x (radB a b) ^ 2) / 4 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, hRe, hIm]; ring
  have hC1 : ∑ i, ‖u i‖ ^ 2 = eval x (radC1 J a b) := by
    simp only [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, u, radC1, map_sum, map_add,
      map_mul]
  have hC2 : ∑ i, ‖v i‖ ^ 2 = eval x (radC2 J a b) := by
    simp only [← Complex.normSq_eq_norm_sq, Complex.normSq_apply, v, radC2, map_sum, map_add,
      map_mul]
  have htri : ‖∑ i, u i * v i‖ ≤ ∑ i, ‖u i‖ * ‖v i‖ :=
    (norm_sum_le _ _).trans (Finset.sum_le_sum fun i _ ↦ by rw [norm_mul])
  have hcs := Finset.sum_mul_sq_le_sq_mul_sq Finset.univ (fun i ↦ ‖u i‖) (fun i ↦ ‖v i‖)
  rw [← hNorm, ← hC1, ← hC2]
  exact (pow_le_pow_left₀ (norm_nonneg _) htri 2).trans hcs

/-- The Wirtinger radial pairing `ρ = Re(q̄² a) / V = (3/2) radR`. -/
def radRho {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) : ℝ :=
  (3 / 2 : ℝ) * radR a b x

lemma measurable_radRho {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) : Measurable (radRho a b) :=
  (measurable_radR a b).const_mul _

lemma memLp_radRho {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) :
    MemLp (radRho a b) 2 (stdGaussian d) :=
  (memLp_radR a b).const_mul _

lemma radRho_sq_le_radC1_mul_radC2 {d : ℕ} {J : Fin d → Fin d → ℝ} (hJ : IsCplx J)
    (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    radRho a b x ^ 2 ≤ eval x (radC1 J a b) * eval x (radC2 J a b) := by
  have h1 := radR_sq_le a b x
  have h2 := radAB_sq_le_radC1_mul_radC2 hJ a b x
  unfold radRho
  nlinarith

lemma radRho_mul_radU {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    radRho a b x * eval x (radU a b) = eval x (radN a b) / 2 := by
  unfold radRho
  have h := radR_mul a b x
  linarith

end pointwise

/-! ### Algebraic rotation expectations -/

section alg_rot

variable {ι : Type*} [Fintype ι]

/-- `Σ_{i,j} J_{j,i} P ∂_j ∂_i Q = 0` for antisymmetric `J`. -/
lemma sum_anti_pderiv2_zero {J : ι → ι → ℝ} (hJ : ∀ i j, J i j = -J j i)
    (P Q : MvPolynomial ι ℝ) :
    ∑ i, ∑ j, C (J j i) * (P * pderiv j (pderiv i Q)) = 0 := by
  have h : ∑ i, ∑ j, C (J j i) * (P * pderiv j (pderiv i Q))
      = -(∑ i, ∑ j, C (J j i) * (P * pderiv j (pderiv i Q))) := by
    conv_lhs => rw [Finset.sum_comm]
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [hJ i j, map_neg, pderiv_pderiv_comm]; ring
  have h2 : (2 : MvPolynomial ι ℝ) * (∑ i, ∑ j, C (J j i) * (P * pderiv j (pderiv i Q))) = 0 := by
    linear_combination h
  have h2' : C (1 / 2 : ℝ) * ((2 : MvPolynomial ι ℝ)
      * (∑ i, ∑ j, C (J j i) * (P * pderiv j (pderiv i Q)))) = 0 := by
    rw [h2, mul_zero]
  have hc : (C (1 / 2 : ℝ) : MvPolynomial ι ℝ) * (2 : MvPolynomial ι ℝ) = 1 := by
    rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← map_mul]; norm_num
  rw [← mul_assoc, hc, one_mul] at h2'
  exact h2'

/-- `Σ_{i,j} J_{j,i} (∂_i P)(∂_j P) = 0` for antisymmetric `J`. -/
lemma sum_anti_grad_self_zero {J : ι → ι → ℝ} (hJ : ∀ i j, J i j = -J j i)
    (P : MvPolynomial ι ℝ) :
    ∑ i, ∑ j, C (J j i) * (pderiv i P * pderiv j P) = 0 := by
  have h : ∑ i, ∑ j, C (J j i) * (pderiv i P * pderiv j P)
      = -(∑ i, ∑ j, C (J j i) * (pderiv i P * pderiv j P)) := by
    conv_lhs => rw [Finset.sum_comm]
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [hJ i j, map_neg]; ring
  have hc : (C (1 / 2 : ℝ) : MvPolynomial ι ℝ) * (2 : MvPolynomial ι ℝ) = 1 := by
    rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← map_mul]; norm_num
  have h2 : (2 : MvPolynomial ι ℝ) * (∑ i, ∑ j, C (J j i) * (pderiv i P * pderiv j P)) = 0 := by
    linear_combination h
  have h3 : C (1 / 2 : ℝ) * ((2 : MvPolynomial ι ℝ)
      * (∑ i, ∑ j, C (J j i) * (pderiv i P * pderiv j P))) = 0 := by rw [h2, mul_zero]
  rwa [← mul_assoc, hc, one_mul] at h3

/-- Algebraic identity behind the rotation Stein rule:
`Σ_{i,j} J_{j,i} (a ∂_i b − b ∂_i a) ∂_j U = U · D`. -/
lemma sum_rot_mul_pderiv_radU {J : ι → ι → ℝ} (hJ : ∀ i j, J i j = -J j i)
    (a b : MvPolynomial ι ℝ) :
    ∑ i, ∑ j, C (J j i) * ((a * pderiv i b - b * pderiv i a) * pderiv j (radU a b))
      = radU a b * radD J a b := by
  have hU : ∀ j, pderiv j (radU a b) = 2 * (a * pderiv j a + b * pderiv j b) := fun j ↦ by
    simp only [radU, map_add, Derivation.leibniz, smul_eq_mul]; ring
  have hsplit : ∑ i, ∑ j, C (J j i) * ((a * pderiv i b - b * pderiv i a) * pderiv j (radU a b))
      = 2 * (a * a) * (∑ i, ∑ j, C (J j i) * (pderiv i b * pderiv j a))
        - 2 * (b * b) * (∑ i, ∑ j, C (J j i) * (pderiv i a * pderiv j b))
        + 2 * (a * b) * (∑ i, ∑ j, C (J j i) * (pderiv i b * pderiv j b))
        - 2 * (a * b) * (∑ i, ∑ j, C (J j i) * (pderiv i a * pderiv j a)) := by
    simp only [hU, Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
  rw [hsplit, sum_anti_grad_self_zero hJ b, sum_anti_grad_self_zero hJ a]
  have hba : ∑ i, ∑ j, C (J j i) * (pderiv i b * pderiv j a)
      = ∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b) := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
  have hab : ∑ i, ∑ j, C (J j i) * (pderiv i a * pderiv j b)
      = -(∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b)) := by
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [hJ j i, map_neg]; ring
  rw [hba, hab, radU, radD]; ring

/-- `Σ_{i,j} J_{j,i} (∂_j(a ∂_i b) − ∂_j(b ∂_i a)) = D`. -/
lemma sum_rot_pderiv_eq_radD {J : ι → ι → ℝ} (hJ : ∀ i j, J i j = -J j i)
    (a b : MvPolynomial ι ℝ) :
    ∑ i, ∑ j, C (J j i) * (pderiv j (a * pderiv i b) - pderiv j (b * pderiv i a))
      = radD J a b := by
  have hleib : ∑ i, ∑ j, C (J j i) * (pderiv j (a * pderiv i b) - pderiv j (b * pderiv i a))
      = (∑ i, ∑ j, C (J j i) * (pderiv i b * pderiv j a))
        - (∑ i, ∑ j, C (J j i) * (pderiv i a * pderiv j b))
        + (∑ i, ∑ j, C (J j i) * (a * pderiv j (pderiv i b)))
        - (∑ i, ∑ j, C (J j i) * (b * pderiv j (pderiv i a))) := by
    simp only [pderiv_mul, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
  rw [hleib, sum_anti_pderiv2_zero hJ a b, sum_anti_pderiv2_zero hJ b a]
  have hba : ∑ i, ∑ j, C (J j i) * (pderiv i b * pderiv j a)
      = ∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b) := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
  have hab : ∑ i, ∑ j, C (J j i) * (pderiv i a * pderiv j b)
      = -(∑ i, ∑ j, C (J i j) * (pderiv i a * pderiv j b)) := by
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [hJ j i, map_neg]; ring
  rw [hba, hab, radD]; ring

/-- `E[D] = E[U]` (hence `E[D] = 1` for normalized circular cubics). -/
theorem Circular.gE_radD {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (hc : Circular J a b) :
    E (radD J a b) = E (radU a b) := by
  have hU : radU a b = a * rotD J b - b * rotD J a := by
    rw [hc.db, hc.da, radU]; ring
  have h1 : E (a * rotD J b) = ∑ i, ∑ j, J j i * E (pderiv j (a * pderiv i b)) := by
    simp only [rotD, Finset.mul_sum, map_sum,
      show ∀ i j, a * (C (J j i) * (X j * pderiv i b))
        = C (J j i) * (X j * (a * pderiv i b)) from fun _ _ ↦ by ring,
      C_mul_apply, hE.ibp]
  have h2 : E (b * rotD J a) = ∑ i, ∑ j, J j i * E (pderiv j (b * pderiv i a)) := by
    simp only [rotD, Finset.mul_sum, map_sum,
      show ∀ i j, b * (C (J j i) * (X j * pderiv i a))
        = C (J j i) * (X j * (b * pderiv i a)) from fun _ _ ↦ by ring,
      C_mul_apply, hE.ibp]
  have hdiff : E (a * rotD J b - b * rotD J a)
      = E (∑ i, ∑ j, C (J j i) * (pderiv j (a * pderiv i b) - pderiv j (b * pderiv i a))) := by
    rw [map_sub, h1, h2]
    simp only [map_sum, C_mul_apply, map_sub, mul_sub, Finset.sum_sub_distrib]
  rw [hU, hdiff, sum_rot_pderiv_eq_radD hc.anti a b]

/-- `2 E[D U] = E[U²]` (the linear rotation Stein identity, for `G(v) = v²/2`). -/
theorem Circular.gE_radD_mul_radU {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (hc : Circular J a b) :
    2 * E (radD J a b * radU a b) = E (radU a b * radU a b) := by
  have hU2 : radU a b * radU a b = a * radU a b * rotD J b - b * radU a b * rotD J a := by
    rw [hc.db, hc.da, radU]; ring
  have h1 : E (a * radU a b * rotD J b)
      = ∑ i, ∑ j, J j i * E (pderiv j (a * radU a b * pderiv i b)) := by
    simp only [rotD, Finset.mul_sum, map_sum,
      show ∀ i j, a * radU a b * (C (J j i) * (X j * pderiv i b))
        = C (J j i) * (X j * (a * radU a b * pderiv i b)) from fun _ _ ↦ by ring,
      C_mul_apply, hE.ibp]
  have h2 : E (b * radU a b * rotD J a)
      = ∑ i, ∑ j, J j i * E (pderiv j (b * radU a b * pderiv i a)) := by
    simp only [rotD, Finset.mul_sum, map_sum,
      show ∀ i j, b * radU a b * (C (J j i) * (X j * pderiv i a))
        = C (J j i) * (X j * (b * radU a b * pderiv i a)) from fun _ _ ↦ by ring,
      C_mul_apply, hE.ibp]
  have hdiff : E (a * radU a b * rotD J b - b * radU a b * rotD J a)
      = E (∑ i, ∑ j, C (J j i) * (pderiv j (a * radU a b * pderiv i b)
          - pderiv j (b * radU a b * pderiv i a))) := by
    rw [map_sub, h1, h2]
    simp only [map_sum, C_mul_apply, map_sub, mul_sub, Finset.sum_sub_distrib]
  have halg : ∑ i, ∑ j, C (J j i) * (pderiv j (a * radU a b * pderiv i b)
        - pderiv j (b * radU a b * pderiv i a))
      = 2 * (radD J a b * radU a b) := by
    have hleib : ∑ i, ∑ j, C (J j i) * (pderiv j (a * radU a b * pderiv i b)
          - pderiv j (b * radU a b * pderiv i a))
        = radU a b * (∑ i, ∑ j, C (J j i) * (pderiv j (a * pderiv i b) - pderiv j (b * pderiv i a)))
          + (∑ i, ∑ j, C (J j i) * ((a * pderiv i b - b * pderiv i a) * pderiv j (radU a b))) := by
      simp only [pderiv_mul, Finset.mul_sum, ← Finset.sum_add_distrib]
      refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
    rw [hleib, sum_rot_pderiv_eq_radD hc.anti a b, sum_rot_mul_pderiv_radU hc.anti a b]; ring
  rw [hU2, hdiff, halg, ofNat_mul_apply]

end alg_rot

/-! ### The smooth rotation Stein identity and separate radial identities `(I)`, `(II)` -/

section radial_rot

variable {d : ℕ}

private lemma abs_mul_pderiv_radU_le (a b p q : MvPolynomial (Fin d) ℝ) (j : Fin d)
    (hq0 : ∀ x, 0 ≤ eval x q)
    (hp : ∀ x, |eval x p| ≤ √(eval x (radU a b)) * eval x q) (x : Fin d → ℝ) :
    |eval x (p * pderiv j (radU a b))|
      ≤ eval x (radU a b) * eval x (2 * q * (1 + pderiv j a * pderiv j a
          + pderiv j b * pderiv j b)) := by
  have hU0 := eval_radU_nonneg a b x
  have hV : |eval x (pderiv j (radU a b))|
      ≤ 2 * √(eval x (radU a b))
        * (1 + eval x (pderiv j a) * eval x (pderiv j a)
          + eval x (pderiv j b) * eval x (pderiv j b)) := by
    rw [pderiv_radU, map_mul, map_ofNat, abs_mul, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2)]
    set α := eval x a
    set β := eval x b
    set da := eval x (pderiv j a)
    set db := eval x (pderiv j b)
    have hcs : (α * da + β * db) ^ 2 ≤ (α * α + β * β) * (da * da + db * db) := by
      nlinarith [sq_nonneg (α * db - β * da)]
    have hsq : |α * da + β * db| ≤ √(eval x (radU a b)) * √(da * da + db * db) := by
      rw [← Real.sqrt_mul hU0, ← Real.sqrt_sq_eq_abs]
      refine Real.sqrt_le_sqrt ?_
      rw [eval_radU]; exact hcs
    have hle1 : √(da * da + db * db) ≤ 1 + da * da + db * db := by
      rw [Real.sqrt_le_left (by nlinarith [mul_self_nonneg da, mul_self_nonneg db])]
      nlinarith [mul_self_nonneg da, mul_self_nonneg db]
    have hVeq : eval x (radV a b j) = α * da + β * db := by
      simp only [radV, map_add, map_mul, α, β, da, db]
    rw [hVeq]
    have hmul := mul_le_mul_of_nonneg_left hle1 (Real.sqrt_nonneg (eval x (radU a b)))
    linarith
  rw [map_mul, abs_mul]
  calc |eval x p| * |eval x (pderiv j (radU a b))|
      ≤ (√(eval x (radU a b)) * eval x q)
          * (2 * √(eval x (radU a b))
            * (1 + eval x (pderiv j a) * eval x (pderiv j a)
              + eval x (pderiv j b) * eval x (pderiv j b))) :=
        mul_le_mul (hp x) hV (abs_nonneg _)
          (mul_nonneg (Real.sqrt_nonneg _) (hq0 x))
    _ = eval x (radU a b) * eval x (2 * q * (1 + pderiv j a * pderiv j a
          + pderiv j b * pderiv j b)) := by
        simp only [map_mul, map_add, map_one, map_ofNat]
        have hsq := Real.mul_self_sqrt hU0
        linear_combination (2 * eval x q * (1 + eval x (pderiv j a) * eval x (pderiv j a)
          + eval x (pderiv j b) * eval x (pderiv j b))) * hsq

private lemma abs_a_mul_le (a b r : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    |eval x (a * r)| ≤ √(eval x (radU a b)) * eval x (1 + r * r) := by
  have ha : |eval x a| ≤ √(eval x (radU a b)) := by
    rw [← Real.sqrt_sq_eq_abs]
    refine Real.sqrt_le_sqrt ?_
    rw [eval_radU]; nlinarith [mul_self_nonneg (eval x b)]
  have hr : |eval x r| ≤ 1 + eval x r * eval x r := by
    rw [abs_le]; constructor <;> nlinarith [mul_self_nonneg (eval x r - 1),
      mul_self_nonneg (eval x r + 1)]
  rw [map_mul, abs_mul]
  simpa only [map_add, map_one, map_mul] using
    mul_le_mul ha hr (abs_nonneg _) (Real.sqrt_nonneg _)

private lemma abs_b_mul_le (a b r : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    |eval x (b * r)| ≤ √(eval x (radU a b)) * eval x (1 + r * r) := by
  have hb : |eval x b| ≤ √(eval x (radU a b)) := by
    rw [← Real.sqrt_sq_eq_abs]
    refine Real.sqrt_le_sqrt ?_
    rw [eval_radU]; nlinarith [mul_self_nonneg (eval x a)]
  have hr : |eval x r| ≤ 1 + eval x r * eval x r := by
    rw [abs_le]; constructor <;> nlinarith [mul_self_nonneg (eval x r - 1),
      mul_self_nonneg (eval x r + 1)]
  rw [map_mul, abs_mul]
  simpa only [map_add, map_one, map_mul] using
    mul_le_mul hb hr (abs_nonneg _) (Real.sqrt_nonneg _)

private lemma eval_one_add_sq_nonneg (r : MvPolynomial (Fin d) ℝ) (x : Fin d → ℝ) :
    0 ≤ eval x (1 + r * r) := by
  simp only [map_add, map_one, map_mul]; nlinarith [mul_self_nonneg (eval x r)]

/-- **The smooth rotation Stein identity:** for every `RadialTest` `H` and circular pair
`Circular J a b`, `E[U H(U)] = E[D (H(U) + U H'(U))]`, i.e. `E[G(U)] = E[(c₁ − c₂) G'(U)]`
for `G(u) = u H(u)`. -/
theorem radial_parts_rot {H H' : ℝ → ℝ} {M : ℝ} (hT : RadialTest H H' M)
    {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ} (hc : Circular J a b) :
    ∫ x, eval x (radU a b) * H (eval x (radU a b)) ∂(stdGaussian d)
      = ∫ x, eval x (radD J a b) * H (eval x (radU a b)) ∂(stdGaussian d)
        + ∫ x, eval x (radU a b * radD J a b) * H' (eval x (radU a b)) ∂(stdGaussian d) := by
  have h1 : ∀ i j : Fin d,
      ∫ x, eval x (X j * (a * pderiv i b)) * H (eval x (radU a b)) ∂(stdGaussian d)
        = ∫ x, eval x (pderiv j (a * pderiv i b)) * H (eval x (radU a b)) ∂(stdGaussian d)
          + ∫ x, eval x (a * pderiv i b * pderiv j (radU a b))
            * H' (eval x (radU a b)) ∂(stdGaussian d) := fun i j ↦
    hT.stein a b (a * pderiv i b) _ j (abs_mul_pderiv_radU_le a b (a * pderiv i b)
      (1 + pderiv i b * pderiv i b) j (eval_one_add_sq_nonneg _) (abs_a_mul_le a b _))
  have h2 : ∀ i j : Fin d,
      ∫ x, eval x (X j * (b * pderiv i a)) * H (eval x (radU a b)) ∂(stdGaussian d)
        = ∫ x, eval x (pderiv j (b * pderiv i a)) * H (eval x (radU a b)) ∂(stdGaussian d)
          + ∫ x, eval x (b * pderiv i a * pderiv j (radU a b))
            * H' (eval x (radU a b)) ∂(stdGaussian d) := fun i j ↦
    hT.stein a b (b * pderiv i a) _ j (abs_mul_pderiv_radU_le a b (b * pderiv i a)
      (1 + pderiv i a * pderiv i a) j (eval_one_add_sq_nonneg _) (abs_b_mul_le a b _))
  have hL : ∫ x, eval x (radU a b) * H (eval x (radU a b)) ∂(stdGaussian d)
      = ∑ i, ∑ j, J j i * (∫ x, eval x (X j * (a * pderiv i b))
          * H (eval x (radU a b)) ∂(stdGaussian d)
        - ∫ x, eval x (X j * (b * pderiv i a)) * H (eval x (radU a b)) ∂(stdGaussian d)) := by
    have hU : radU a b = ∑ i, ∑ j, C (J j i)
        * (X j * (a * pderiv i b) - X j * (b * pderiv i a)) := by
      have hr : radU a b = a * rotD J b - b * rotD J a := by rw [hc.db, hc.da, radU]; ring
      rw [hr]
      simp only [rotD, Finset.mul_sum, ← Finset.sum_sub_distrib]
      refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
    have hEq : ∫ x, eval x (radU a b) * H (eval x (radU a b)) ∂(stdGaussian d)
        = ∫ x, ∑ i, ∑ j, eval x (C (J j i) * (X j * (a * pderiv i b) - X j * (b * pderiv i a)))
            * H (eval x (radU a b)) ∂(stdGaussian d) :=
      integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
        dsimp only
        rw [show eval x (radU a b) * H (eval x (radU a b))
            = eval x (∑ i, ∑ j, C (J j i) * (X j * (a * pderiv i b) - X j * (b * pderiv i a)))
              * H (eval x (radU a b)) by rw [← hU]]
        simp only [map_sum, Finset.sum_mul])
    rw [hEq, integral_finsetSum _ fun i _ ↦ integrable_finsetSum _ fun j _ ↦ hT.integrable a b _]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [integral_finsetSum _ fun j _ ↦ hT.integrable a b _]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [← integral_sub (hT.integrable a b _) (hT.integrable a b _), ← integral_const_mul]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    simp only [map_mul, map_sub, eval_C]; ring
  have hR1 : ∑ i, ∑ j, J j i * (∫ x, eval x (pderiv j (a * pderiv i b))
        * H (eval x (radU a b)) ∂(stdGaussian d)
      - ∫ x, eval x (pderiv j (b * pderiv i a)) * H (eval x (radU a b)) ∂(stdGaussian d))
      = ∫ x, eval x (radD J a b) * H (eval x (radU a b)) ∂(stdGaussian d) := by
    have hEq : ∫ x, eval x (radD J a b) * H (eval x (radU a b)) ∂(stdGaussian d)
        = ∫ x, ∑ i, ∑ j, eval x (C (J j i) * (pderiv j (a * pderiv i b)
            - pderiv j (b * pderiv i a))) * H (eval x (radU a b)) ∂(stdGaussian d) :=
      integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
        rw [← sum_rot_pderiv_eq_radD hc.anti a b]
        simp only [map_sum, Finset.sum_mul])
    rw [hEq, integral_finsetSum _ fun i _ ↦ integrable_finsetSum _ fun j _ ↦ hT.integrable a b _]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [integral_finsetSum _ fun j _ ↦ hT.integrable a b _]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [← integral_sub (hT.integrable a b _) (hT.integrable a b _), ← integral_const_mul]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    simp only [map_mul, map_sub, eval_C]; ring
  have hIntA : ∀ i j, Integrable (fun x ↦ eval x (a * pderiv i b * pderiv j (radU a b))
      * H' (eval x (radU a b))) (stdGaussian d) := fun i j ↦
    hT.integrable' a b _ _ (abs_mul_pderiv_radU_le a b (a * pderiv i b)
      (1 + pderiv i b * pderiv i b) j (eval_one_add_sq_nonneg _) (abs_a_mul_le a b _))
  have hIntB : ∀ i j, Integrable (fun x ↦ eval x (b * pderiv i a * pderiv j (radU a b))
      * H' (eval x (radU a b))) (stdGaussian d) := fun i j ↦
    hT.integrable' a b _ _ (abs_mul_pderiv_radU_le a b (b * pderiv i a)
      (1 + pderiv i a * pderiv i a) j (eval_one_add_sq_nonneg _) (abs_b_mul_le a b _))
  have hIntC : ∀ i j, Integrable (fun x ↦
      eval x (C (J j i) * ((a * pderiv i b - b * pderiv i a) * pderiv j (radU a b)))
        * H' (eval x (radU a b))) (stdGaussian d) := fun i j ↦ by
    refine (((hIntA i j).sub (hIntB i j)).const_mul (J j i)).congr
      (Filter.Eventually.of_forall fun x ↦ ?_)
    simp only [Pi.sub_apply, map_mul, map_sub, eval_C]; ring
  have hR2 : ∑ i, ∑ j, J j i * (∫ x, eval x (a * pderiv i b * pderiv j (radU a b))
        * H' (eval x (radU a b)) ∂(stdGaussian d)
      - ∫ x, eval x (b * pderiv i a * pderiv j (radU a b))
        * H' (eval x (radU a b)) ∂(stdGaussian d))
      = ∫ x, eval x (radU a b * radD J a b) * H' (eval x (radU a b)) ∂(stdGaussian d) := by
    have hEq : ∫ x, eval x (radU a b * radD J a b) * H' (eval x (radU a b)) ∂(stdGaussian d)
        = ∫ x, ∑ i, ∑ j, eval x (C (J j i) * ((a * pderiv i b - b * pderiv i a)
            * pderiv j (radU a b))) * H' (eval x (radU a b)) ∂(stdGaussian d) :=
      integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
        rw [← sum_rot_mul_pderiv_radU hc.anti a b]
        simp only [map_sum, Finset.sum_mul])
    rw [hEq, integral_finsetSum _ fun i _ ↦ integrable_finsetSum _ fun j _ ↦ hIntC i j]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [integral_finsetSum _ fun j _ ↦ hIntC i j]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    rw [← integral_sub (hIntA i j) (hIntB i j), ← integral_const_mul]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    simp only [map_mul, map_sub, eval_C]; ring
  rw [hL]
  simp only [h1, h2]
  have hsplit : ∑ i, ∑ j, J j i * ((∫ x, eval x (pderiv j (a * pderiv i b))
          * H (eval x (radU a b)) ∂(stdGaussian d)
        + ∫ x, eval x (a * pderiv i b * pderiv j (radU a b))
          * H' (eval x (radU a b)) ∂(stdGaussian d))
      - (∫ x, eval x (pderiv j (b * pderiv i a)) * H (eval x (radU a b)) ∂(stdGaussian d)
        + ∫ x, eval x (b * pderiv i a * pderiv j (radU a b))
          * H' (eval x (radU a b)) ∂(stdGaussian d)))
      = (∑ i, ∑ j, J j i * (∫ x, eval x (pderiv j (a * pderiv i b))
            * H (eval x (radU a b)) ∂(stdGaussian d)
          - ∫ x, eval x (pderiv j (b * pderiv i a)) * H (eval x (radU a b)) ∂(stdGaussian d)))
        + (∑ i, ∑ j, J j i * (∫ x, eval x (a * pderiv i b * pderiv j (radU a b))
            * H' (eval x (radU a b)) ∂(stdGaussian d)
          - ∫ x, eval x (b * pderiv i a * pderiv j (radU a b))
            * H' (eval x (radU a b)) ∂(stdGaussian d))) := by
    simp only [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ by ring
  rw [hsplit, hR1, hR2]

/-- **Rotation Stein identity for a mesh test `cutCells vs z`**:
`E[Φ(U)] = E[D φ(U)]`. -/
theorem radial_cut_rot {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
    (hc : Circular J a b) (vs z : List ℚ) (hvs : meshOK 0 vs = true) :
    ∫ x, cutPrim vs z (eval x (radU a b)) ∂(stdGaussian d)
      = ∫ x, eval x (radD J a b) * cutTest vs z (eval x (radU a b)) ∂(stdGaussian d) := by
  obtain ⟨M, hT⟩ := cutH_radialTest vs z hvs
  have key := radial_parts_rot hT hc
  have iL : ∫ x, cutPrim vs z (eval x (radU a b)) ∂(stdGaussian d)
      = ∫ x, eval x (radU a b) * cutH vs z (eval x (radU a b)) ∂(stdGaussian d) :=
    integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
      have hU := eval_radU_nonneg a b x
      obtain ⟨h1, h2, _⟩ := cut_at vs z hU
      obtain ⟨_, _, h3⟩ := cutH_at vs z hvs hU
      linarith)
  have iD1 := hT.integrable a b (radD J a b)
  have iD2 : Integrable (fun x ↦ eval x (radU a b * radD J a b)
      * cutH' vs z (eval x (radU a b))) (stdGaussian d) :=
    hT.integrable' a b (radU a b * radD J a b) (1 + radD J a b * radD J a b) fun x ↦ by
      have hU := eval_radU_nonneg a b x
      have hD : |eval x (radD J a b)| ≤ 1 + eval x (radD J a b) * eval x (radD J a b) := by
        rw [abs_le]; constructor <;> nlinarith [mul_self_nonneg (eval x (radD J a b) - 1),
          mul_self_nonneg (eval x (radD J a b) + 1)]
      rw [map_mul, abs_mul, abs_of_nonneg hU]
      simpa only [map_add, map_one, map_mul] using mul_le_mul_of_nonneg_left hD hU
  have iR : ∫ x, eval x (radD J a b) * cutTest vs z (eval x (radU a b)) ∂(stdGaussian d)
      = ∫ x, eval x (radD J a b) * cutH vs z (eval x (radU a b)) ∂(stdGaussian d)
        + ∫ x, eval x (radU a b * radD J a b) * cutH' vs z (eval x (radU a b)) ∂(stdGaussian d) := by
    rw [← integral_add iD1 iD2]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    have hU := eval_radU_nonneg a b x
    obtain ⟨h1, _, _⟩ := cut_at vs z hU
    obtain ⟨hH1, hH2, _⟩ := cutH_at vs z hvs hU
    have hT' : cutTest vs z (eval x (radU a b))
        = cutH vs z (eval x (radU a b))
          + eval x (radU a b) * cutH' vs z (eval x (radU a b)) := by linarith
    simp only [map_mul, hT']; ring
  rw [iL, iR, key]

/-! ### Piecewise-linear-plus-slope tests and identities `(I)`, `(II)` -/

/-- The constant tail value `vals[K]` of a knot array `vals` over a positive mesh `vs` of length `K`. -/
def tailConst (vs vals : List ℚ) : ℚ := vals.getD vs.length 0

/-- The shifted knot array `vals − vals[K]` vanishing at `e_K`. -/
def shiftVals (vs vals : List ℚ) : List ℚ := vals.map (· - tailConst vs vals)

/-- A continuous piecewise-linear-in-`v` test with knot values `vals`, constant `vals[K]`
beyond `e_K²`, plus linear term `slope * v`. -/
def plPhi (vs vals : List ℚ) (slope : ℚ) (u : ℝ) : ℝ :=
  cutTest vs (shiftVals vs vals) u + (tailConst vs vals : ℝ) + (slope : ℝ) * u

/-- The primitive `G(u) = ∫₀ᵘ plPhi`. -/
def plPrim (vs vals : List ℚ) (slope : ℚ) (u : ℝ) : ℝ :=
  cutPrim vs (shiftVals vs vals) u + (tailConst vs vals : ℝ) * u + (slope : ℝ) / 2 * u ^ 2

/-- The remainder `Y(u) = plPhi(u) − plPrim(u)/u` (zero at `u = 0`). -/
def plY (vs vals : List ℚ) (slope : ℚ) (u : ℝ) : ℝ :=
  cutY vs (shiftVals vs vals) (√u) + (slope : ℝ) / 2 * u

lemma plY_mul (vs vals : List ℚ) (slope : ℚ) (hvs : meshOK 0 vs = true) {u : ℝ} (hu : 0 ≤ u) :
    u * plY vs vals slope u = u * plPhi vs vals slope u - plPrim vs vals slope u := by
  unfold plY plPhi plPrim
  obtain ⟨_, _, h3⟩ := cut_at vs (shiftVals vs vals) hu
  rw [h3]
  by_cases h0 : u = 0
  · subst h0
    obtain ⟨s, hs, hpick⟩ := pickIdx_zero vs hvs
    rw [cutPrim_first vs (shiftVals vs vals) (hpick 0 hs)]
    ring
  · simp only [h0, ↓reduceIte]; field_simp; ring

lemma integrable_cutTest_mul (p : MvPolynomial (Fin d) ℝ) (vs z : List ℚ) :
    Integrable (fun x ↦ eval x p * cutTest vs z (eval x (radU a b))) (stdGaussian d) := by
  have hm : Measurable (fun x ↦ eval x p * cutTest vs z (eval x (radU a b))) := by
    have hEq : (fun x ↦ eval x p * cutTest vs z (eval x (radU a b)))
        = fun x ↦ eval x p * cutPhi vs z (√(eval x (radU a b))) := by
      funext x; rw [(cut_at vs z (eval_radU_nonneg a b x)).1]
    rw [hEq]
    exact (continuous_eval p).measurable.mul
      ((measurable_cutPhi vs z).comp ((continuous_eval _).measurable.sqrt))
  refine integrable_of_abs_le_eval hm.aestronglyMeasurable
    (C (cellBound vs z) * (1 + radU a b) * (1 + p * p)) fun x ↦ ?_
  have hU := eval_radU_nonneg a b x
  rw [← (cut_at vs z hU).1]
  have h1 := cutPhi_le vs z (√(eval x (radU a b)))
  rw [Real.sq_sqrt hU] at h1
  have hp : |eval x p| ≤ 1 + eval x p * eval x p := by
    rw [abs_le]; constructor <;> nlinarith [mul_self_nonneg (eval x p - 1),
      mul_self_nonneg (eval x p + 1)]
  have hB : 0 ≤ cellBound vs z := by
    unfold cellBound
    exact List.sum_nonneg fun c hc ↦ by
      simp only [List.mem_map] at hc
      obtain ⟨_, _, rfl⟩ := hc
      positivity
  rw [abs_mul]
  have hmul := mul_le_mul hp h1 (abs_nonneg _) (by nlinarith [mul_self_nonneg (eval x p)])
  simp only [map_mul, map_add, map_one, eval_C]
  linarith

lemma integrable_cutPrim (a b : MvPolynomial (Fin d) ℝ) (vs z : List ℚ) (hvs : meshOK 0 vs = true) :
    Integrable (fun x ↦ cutPrim vs z (eval x (radU a b))) (stdGaussian d) := by
  obtain ⟨M, hT⟩ := cutH_radialTest vs z hvs
  refine (hT.integrable a b (radU a b)).congr (Filter.Eventually.of_forall fun x ↦ ?_)
  have hU := eval_radU_nonneg a b x
  obtain ⟨h1, h2, _⟩ := cut_at vs z hU
  obtain ⟨_, _, h3⟩ := cutH_at vs z hvs hU
  linarith

lemma integrable_radRho_mul_cutY (a b : MvPolynomial (Fin d) ℝ) (vs z : List ℚ)
    (hvs : meshOK 0 vs = true) :
    Integrable (fun x ↦ radRho a b x * cutY vs z (√(eval x (radU a b)))) (stdGaussian d) := by
  obtain ⟨B, hB⟩ := cutY_le vs z hvs
  have hm : Measurable (fun x ↦ radRho a b x * cutY vs z (√(eval x (radU a b)))) :=
    (measurable_radRho a b).mul ((measurable_cutY vs z).comp (continuous_eval _).measurable.sqrt)
  refine integrable_of_abs_le_eval hm.aestronglyMeasurable
    (C (|B| + 1) * (1 + radU a b) * (1 + radA a b * radA a b + radB a b * radB a b)) fun x ↦ ?_
  have hU := eval_radU_nonneg a b x
  have hy := hB (√(eval x (radU a b)))
  rw [Real.sq_sqrt hU] at hy
  have hy' : |cutY vs z (√(eval x (radU a b)))| ≤ (|B| + 1) * (1 + eval x (radU a b)) := by
    have : B ≤ |B| + 1 := by linarith [le_abs_self B]
    nlinarith [hy, hU]
  have hr2 : radRho a b x ^ 2 ≤ (eval x (radA a b) * eval x (radA a b)
      + eval x (radB a b) * eval x (radB a b)) / 4 := by
    unfold radRho; nlinarith [radR_sq_le a b x]
  have hr : |radRho a b x| ≤ 1 + eval x (radA a b) * eval x (radA a b)
      + eval x (radB a b) * eval x (radB a b) := by
    have hsq : |radRho a b x| ^ 2 = radRho a b x ^ 2 := sq_abs _
    nlinarith [abs_nonneg (radRho a b x), hr2, sq_nonneg (|radRho a b x| - 1),
      mul_self_nonneg (eval x (radA a b)), mul_self_nonneg (eval x (radB a b))]
  rw [abs_mul]
  have hmul := mul_le_mul hr hy' (abs_nonneg _)
    (by nlinarith [mul_self_nonneg (eval x (radA a b)), mul_self_nonneg (eval x (radB a b))])
  simp only [map_mul, map_add, map_one, eval_C]
  linarith

lemma integrable_plPrim (a b : MvPolynomial (Fin d) ℝ) (vs vals : List ℚ) (slope : ℚ)
    (hvs : meshOK 0 vs = true) :
    Integrable (fun x ↦ plPrim vs vals slope (eval x (radU a b))) (stdGaussian d) := by
  unfold plPrim
  refine ((integrable_cutPrim a b vs _ hvs).add ((integrable_eval (radU a b)).const_mul _)).add ?_
  exact ((integrable_eval (radU a b ^ 2)).congr (Filter.Eventually.of_forall fun x ↦ by
    simp)).const_mul _

lemma integrable_mul_plPhi (p a b : MvPolynomial (Fin d) ℝ) (vs vals : List ℚ) (slope : ℚ) :
    Integrable (fun x ↦ eval x p * plPhi vs vals slope (eval x (radU a b))) (stdGaussian d) := by
  have h1 := integrable_cutTest_mul (a := a) (b := b) p vs (shiftVals vs vals)
  have h2 : Integrable (fun x ↦ eval x p * (tailConst vs vals : ℝ)) (stdGaussian d) :=
    (integrable_eval p).mul_const _
  have h3 : Integrable (fun x ↦ eval x p * ((slope : ℝ) * eval x (radU a b))) (stdGaussian d) := by
    refine ((integrable_eval (p * radU a b)).const_mul (slope : ℝ)).congr
      (Filter.Eventually.of_forall fun x ↦ ?_)
    simp only [map_mul]; ring
  refine ((h1.add h2).add h3).congr (Filter.Eventually.of_forall fun x ↦ ?_)
  simp only [Pi.add_apply, plPhi]; ring

lemma integrable_radRho_mul_plY (a b : MvPolynomial (Fin d) ℝ) (vs vals : List ℚ) (slope : ℚ)
    (hvs : meshOK 0 vs = true) :
    Integrable (fun x ↦ radRho a b x * plY vs vals slope (eval x (radU a b))) (stdGaussian d) := by
  have h1 := integrable_radRho_mul_cutY a b vs (shiftVals vs vals) hvs
  have h2 : Integrable (fun x ↦ radRho a b x * ((slope : ℝ) / 2 * eval x (radU a b)))
      (stdGaussian d) := by
    refine ((integrable_eval (radN a b)).const_mul ((slope : ℝ) / 4)).congr
      (Filter.Eventually.of_forall fun x ↦ ?_)
    dsimp only
    linear_combination -((slope : ℝ) / 2) * radRho_mul_radU a b x
  refine (h1.add h2).congr (Filter.Eventually.of_forall fun x ↦ ?_)
  simp only [Pi.add_apply, plY]; ring

/-- **Mixed radial Stein identity** for piecewise-linear-plus-slope tests:
`3 E[G(U)] = E[S φ(U) + 2 ρ Y(U)]`. -/
theorem antiStein_sum (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (vs vals : List ℚ) (slope : ℚ) (hvs : meshOK 0 vs = true) :
    ∫ x, (3 * plPrim vs vals slope (eval x (radU a b))
        - eval x (radS a b) * plPhi vs vals slope (eval x (radU a b))
        - 2 * radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d) = 0 := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hE := gaussE_isGaussianExpectation d
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by simp only [map_mul]; ring)
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa']
  have hmean := fluctuation_mean hE ha hb haa' hbb'
  have hU1 : gaussE d (radU a b) = 1 := by rw [radU, map_add, haa', hbb']; norm_num
  have hen := energy_identity hE ha hb
  -- Part 1: shifted cut test
  have hcut := radial_cut a b ha.eig hb.eig vs (shiftVals vs vals) hvs
  have hcut' : ∫ x, (3 * cutPrim vs (shiftVals vs vals) (eval x (radU a b))
        - eval x (radS a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))
        - 2 * radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b))))
        ∂(stdGaussian d) = 0 := by
    have iP := integrable_cutPrim a b vs (shiftVals vs vals) hvs
    have iS := integrable_cutTest_mul (a := a) (b := b) (radS a b) vs (shiftVals vs vals)
    have iT := integrable_cutTest_mul (a := a) (b := b) 1 vs (shiftVals vs vals)
    have iR := integrable_radRho_mul_cutY a b vs (shiftVals vs vals) hvs
    have eL : ∫ x, cutGap vs (shiftVals vs vals) (√(eval x (radU a b))) ∂(stdGaussian d)
        = ∫ x, cutPrim vs (shiftVals vs vals) (eval x (radU a b)) ∂(stdGaussian d)
          - ∫ x, eval x 1 * cutTest vs (shiftVals vs vals) (eval x (radU a b))
            ∂(stdGaussian d) := by
      rw [← integral_sub iP iT]
      refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
      have hU := eval_radU_nonneg a b x
      obtain ⟨_, h2, _⟩ := cut_at vs (shiftVals vs vals) hU
      simp [h2]
    have eR : ∫ x, ((eval x (radS a b) / 3 - 1)
          * cutPhi vs (shiftVals vs vals) (√(eval x (radU a b)))
          + radR a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b)))) ∂(stdGaussian d)
        = (1 / 3) * ∫ x, eval x (radS a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))
            ∂(stdGaussian d)
          - ∫ x, eval x 1 * cutTest vs (shiftVals vs vals) (eval x (radU a b)) ∂(stdGaussian d)
          + (2 / 3) * ∫ x, radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b)))
            ∂(stdGaussian d) := by
      have h12 : Integrable (fun x ↦ 1 / 3 * (eval x (radS a b)
          * cutTest vs (shiftVals vs vals) (eval x (radU a b)))
          - eval x 1 * cutTest vs (shiftVals vs vals) (eval x (radU a b))) (stdGaussian d) :=
        (iS.const_mul (1 / 3)).sub iT
      rw [← integral_const_mul, ← integral_const_mul, ← integral_sub (iS.const_mul _) iT,
        ← integral_add h12 (iR.const_mul _)]
      refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
      have hU := eval_radU_nonneg a b x
      obtain ⟨h1, _, _⟩ := cut_at vs (shiftVals vs vals) hU
      simp only [h1, radRho, map_one, one_mul]; ring
    rw [eL, eR] at hcut
    have hPS : Integrable (fun x ↦ 3 * cutPrim vs (shiftVals vs vals) (eval x (radU a b))
        - eval x (radS a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))) (stdGaussian d) :=
      (iP.const_mul 3).sub iS
    have hR2 : Integrable (fun x ↦ 2 * radRho a b x
        * cutY vs (shiftVals vs vals) (√(eval x (radU a b)))) (stdGaussian d) :=
      (iR.const_mul 2).congr (Filter.Eventually.of_forall fun x ↦ by ring)
    rw [integral_sub hPS hR2, integral_sub (iP.const_mul 3) iS, integral_const_mul]
    have hR2' : ∫ x, 2 * radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b)))
        ∂(stdGaussian d)
        = 2 * ∫ x, radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b)))
          ∂(stdGaussian d) := by
      rw [← integral_const_mul]
      exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by ring)
    rw [hR2']
    linarith
  -- Part 2: constant term `c * (3 U - S)`
  have hconst : ∫ x, (tailConst vs vals : ℝ) * (3 * eval x (radU a b) - eval x (radS a b))
      ∂(stdGaussian d) = 0 := by
    rw [integral_const_mul, integral_sub ((integrable_eval _).const_mul 3) (integrable_eval _),
      integral_const_mul, ← gaussE_apply, ← gaussE_apply, hU1, hmean]
    ring
  -- Part 3: linear slope term `(slope / 2) * (3 U² - 2 S U - N)`
  have hlin : ∫ x, (slope : ℝ) / 2
      * (3 * eval x (radU a b) ^ 2 - 2 * (eval x (radS a b) * eval x (radU a b))
        - 2 * (radRho a b x * eval x (radU a b))) ∂(stdGaussian d) = 0 := by
    have e : (fun x ↦ 3 * eval x (radU a b) ^ 2 - 2 * (eval x (radS a b) * eval x (radU a b))
          - 2 * (radRho a b x * eval x (radU a b)))
        = fun x ↦ eval x (3 * (radU a b * radU a b) - 2 * (radS a b * radU a b) - radN a b) := by
      funext x
      have hr := radRho_mul_radU a b x
      simp only [map_sub, map_mul, map_ofNat]
      linarith
    rw [integral_const_mul, e, ← gaussE_apply, map_sub, map_sub, ofNat_mul_apply, ofNat_mul_apply]
    linear_combination -((slope : ℝ) / 2) * hen
  -- Combine all three parts
  have i1 : Integrable (fun x ↦ 3 * cutPrim vs (shiftVals vs vals) (eval x (radU a b))
      - eval x (radS a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))
      - 2 * radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b)))) (stdGaussian d) :=
    (((integrable_cutPrim a b vs (shiftVals vs vals) hvs).const_mul 3).sub
      (integrable_cutTest_mul (a := a) (b := b) (radS a b) vs (shiftVals vs vals))).sub
      ((integrable_radRho_mul_cutY a b vs (shiftVals vs vals) hvs).const_mul 2) |>.congr
      (Filter.Eventually.of_forall fun x ↦ by simp only [Pi.sub_apply]; ring)
  have i2 : Integrable (fun x ↦ (tailConst vs vals : ℝ)
      * (3 * eval x (radU a b) - eval x (radS a b))) (stdGaussian d) :=
    (((integrable_eval _).const_mul 3).sub (integrable_eval _)).const_mul _
  have i3 : Integrable (fun x ↦ (slope : ℝ) / 2
      * (3 * eval x (radU a b) ^ 2 - 2 * (eval x (radS a b) * eval x (radU a b))
        - 2 * (radRho a b x * eval x (radU a b)))) (stdGaussian d) := by
    refine ((integrable_eval (3 * (radU a b * radU a b) - 2 * (radS a b * radU a b)
        - radN a b)).const_mul ((slope : ℝ) / 2)).congr (Filter.Eventually.of_forall fun x ↦ ?_)
    dsimp only
    simp only [map_sub, map_mul, map_ofNat]
    linear_combination ((slope : ℝ) / 2) * (2 * radRho_mul_radU a b x)
  have i12 : Integrable (fun x ↦ (3 * cutPrim vs (shiftVals vs vals) (eval x (radU a b))
      - eval x (radS a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))
      - 2 * radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b))))
      + (tailConst vs vals : ℝ) * (3 * eval x (radU a b) - eval x (radS a b))) (stdGaussian d) :=
    i1.add i2
  have hsum : ∫ x, (3 * plPrim vs vals slope (eval x (radU a b))
        - eval x (radS a b) * plPhi vs vals slope (eval x (radU a b))
        - 2 * radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d)
      = (∫ x, (3 * cutPrim vs (shiftVals vs vals) (eval x (radU a b))
          - eval x (radS a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))
          - 2 * radRho a b x * cutY vs (shiftVals vs vals) (√(eval x (radU a b))))
          ∂(stdGaussian d))
        + (∫ x, (tailConst vs vals : ℝ) * (3 * eval x (radU a b) - eval x (radS a b))
          ∂(stdGaussian d))
        + (∫ x, (slope : ℝ) / 2
          * (3 * eval x (radU a b) ^ 2 - 2 * (eval x (radS a b) * eval x (radU a b))
            - 2 * (radRho a b x * eval x (radU a b))) ∂(stdGaussian d)) := by
    rw [← integral_add i1 i2, ← integral_add i12 i3]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    unfold plPrim plPhi plY; ring
  rw [hsum, hcut', hconst, hlin]; ring

/-- **Rotation Stein identity** for piecewise-linear-plus-slope tests:
`E[G(U) − (c₁ − c₂) φ(U)] = 0`. -/
theorem antiStein_rot (a b : MvPolynomial (Fin d) ℝ) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (vs vals : List ℚ) (slope : ℚ) (hvs : meshOK 0 vs = true) :
    ∫ x, (plPrim vs vals slope (eval x (radU a b))
        - eval x (radD J a b) * plPhi vs vals slope (eval x (radU a b))) ∂(stdGaussian d) = 0 := by
  have hE := gaussE_isGaussianExpectation d
  have hD1 := hc.gE_radD hE
  have hDU := hc.gE_radD_mul_radU hE
  have hcut := radial_cut_rot hc vs (shiftVals vs vals) hvs
  have iP := integrable_cutPrim a b vs (shiftVals vs vals) hvs
  have iD := integrable_cutTest_mul (a := a) (b := b) (radD J a b) vs (shiftVals vs vals)
  have h1 : ∫ x, (cutPrim vs (shiftVals vs vals) (eval x (radU a b))
      - eval x (radD J a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b)))
      ∂(stdGaussian d) = 0 := by
    rw [integral_sub iP iD, hcut, sub_self]
  have h2 : ∫ x, (tailConst vs vals : ℝ) * (eval x (radU a b) - eval x (radD J a b))
      ∂(stdGaussian d) = 0 := by
    rw [integral_const_mul, integral_sub (integrable_eval _) (integrable_eval _),
      ← gaussE_apply, ← gaussE_apply, hD1, sub_self, mul_zero]
  have h3 : ∫ x, (slope : ℝ) / 2
      * (eval x (radU a b) ^ 2 - 2 * (eval x (radD J a b) * eval x (radU a b)))
      ∂(stdGaussian d) = 0 := by
    have e : (fun x ↦ eval x (radU a b) ^ 2 - 2 * (eval x (radD J a b) * eval x (radU a b)))
        = fun x ↦ eval x (radU a b * radU a b - 2 * (radD J a b * radU a b)) := by
      funext x; simp only [map_sub, map_mul, map_ofNat]; ring
    rw [integral_const_mul, e, ← gaussE_apply, map_sub, ofNat_mul_apply, hDU, sub_self, mul_zero]
  have j1 : Integrable (fun x ↦ cutPrim vs (shiftVals vs vals) (eval x (radU a b))
      - eval x (radD J a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b))) (stdGaussian d) :=
    iP.sub iD
  have j2 : Integrable (fun x ↦ (tailConst vs vals : ℝ)
      * (eval x (radU a b) - eval x (radD J a b))) (stdGaussian d) :=
    ((integrable_eval _).sub (integrable_eval _)).const_mul _
  have j3 : Integrable (fun x ↦ (slope : ℝ) / 2
      * (eval x (radU a b) ^ 2 - 2 * (eval x (radD J a b) * eval x (radU a b))))
      (stdGaussian d) := by
    refine ((integrable_eval (radU a b * radU a b - 2 * (radD J a b * radU a b))).const_mul
      ((slope : ℝ) / 2)).congr (Filter.Eventually.of_forall fun x ↦ ?_)
    dsimp only; simp only [map_sub, map_mul, map_ofNat]; ring
  have j12 : Integrable (fun x ↦ (cutPrim vs (shiftVals vs vals) (eval x (radU a b))
      - eval x (radD J a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b)))
      + (tailConst vs vals : ℝ) * (eval x (radU a b) - eval x (radD J a b))) (stdGaussian d) :=
    j1.add j2
  have hsum : ∫ x, (plPrim vs vals slope (eval x (radU a b))
        - eval x (radD J a b) * plPhi vs vals slope (eval x (radU a b))) ∂(stdGaussian d)
      = (∫ x, (cutPrim vs (shiftVals vs vals) (eval x (radU a b))
          - eval x (radD J a b) * cutTest vs (shiftVals vs vals) (eval x (radU a b)))
          ∂(stdGaussian d))
        + (∫ x, (tailConst vs vals : ℝ) * (eval x (radU a b) - eval x (radD J a b))
          ∂(stdGaussian d))
        + (∫ x, (slope : ℝ) / 2
          * (eval x (radU a b) ^ 2 - 2 * (eval x (radD J a b) * eval x (radU a b)))
          ∂(stdGaussian d)) := by
    rw [← integral_add j1 j2, ← integral_add j12 j3]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    unfold plPrim plPhi; ring
  rw [hsum, h1, h2, h3]; ring

/-- **Antiholomorphic Stein identity `(I)`**: `E[G(U) − c₂ φ(U) − ρ Y(U)] = 0`. -/
theorem antiStein_I (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (vs vals : List ℚ) (slope : ℚ) (hvs : meshOK 0 vs = true) :
    ∫ x, (plPrim vs vals slope (eval x (radU a b))
        - eval x (radC2 J a b) * plPhi vs vals slope (eval x (radU a b))
        - radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d) = 0 := by
  have hs := antiStein_sum a b ha haa hc vs vals slope hvs
  have hr := antiStein_rot a b hc vs vals slope hvs
  have hI1 : Integrable (fun x ↦ 3 * plPrim vs vals slope (eval x (radU a b))
      - eval x (radS a b) * plPhi vs vals slope (eval x (radU a b))
      - 2 * radRho a b x * plY vs vals slope (eval x (radU a b))) (stdGaussian d) :=
    (((integrable_plPrim a b vs vals slope hvs).const_mul 3).sub
      (integrable_mul_plPhi (radS a b) a b vs vals slope)).sub
      ((integrable_radRho_mul_plY a b vs vals slope hvs).const_mul 2) |>.congr
      (Filter.Eventually.of_forall fun x ↦ by simp only [Pi.sub_apply]; ring)
  have hI2 : Integrable (fun x ↦ plPrim vs vals slope (eval x (radU a b))
      - eval x (radD J a b) * plPhi vs vals slope (eval x (radU a b))) (stdGaussian d) :=
    (integrable_plPrim a b vs vals slope hvs).sub
      (integrable_mul_plPhi (radD J a b) a b vs vals slope)
  have hcomb : ∫ x, (plPrim vs vals slope (eval x (radU a b))
        - eval x (radC2 J a b) * plPhi vs vals slope (eval x (radU a b))
        - radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d)
      = (1 / 2 : ℝ) * (∫ x, (3 * plPrim vs vals slope (eval x (radU a b))
          - eval x (radS a b) * plPhi vs vals slope (eval x (radU a b))
          - 2 * radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d)
        - ∫ x, (plPrim vs vals slope (eval x (radU a b))
          - eval x (radD J a b) * plPhi vs vals slope (eval x (radU a b))) ∂(stdGaussian d)) := by
    rw [← integral_sub hI1 hI2, ← integral_const_mul]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    have hadd := congrArg (eval x) (radC1_add_radC2 hc.isCplx a b)
    have hsub := congrArg (eval x) (radC1_sub_radC2 hc.isCplx a b)
    simp only [map_add, map_sub] at hadd hsub
    linear_combination -(plPhi vs vals slope (eval x (radU a b)) / 2) * (hadd - hsub)
  rw [hcomb, hs, hr]; ring

/-- **Holomorphic Stein identity `(II)`**: `E[G(U) − (1/2) c₁ φ(U) − (1/2) ρ Y(U)] = 0`. -/
theorem antiStein_II (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (vs vals : List ℚ) (slope : ℚ) (hvs : meshOK 0 vs = true) :
    ∫ x, (plPrim vs vals slope (eval x (radU a b))
        - (1 / 2 : ℝ) * eval x (radC1 J a b) * plPhi vs vals slope (eval x (radU a b))
        - (1 / 2 : ℝ) * radRho a b x * plY vs vals slope (eval x (radU a b)))
      ∂(stdGaussian d) = 0 := by
  have hs := antiStein_sum a b ha haa hc vs vals slope hvs
  have hr := antiStein_rot a b hc vs vals slope hvs
  have hI1 : Integrable (fun x ↦ 3 * plPrim vs vals slope (eval x (radU a b))
      - eval x (radS a b) * plPhi vs vals slope (eval x (radU a b))
      - 2 * radRho a b x * plY vs vals slope (eval x (radU a b))) (stdGaussian d) :=
    (((integrable_plPrim a b vs vals slope hvs).const_mul 3).sub
      (integrable_mul_plPhi (radS a b) a b vs vals slope)).sub
      ((integrable_radRho_mul_plY a b vs vals slope hvs).const_mul 2) |>.congr
      (Filter.Eventually.of_forall fun x ↦ by simp only [Pi.sub_apply]; ring)
  have hI2 : Integrable (fun x ↦ plPrim vs vals slope (eval x (radU a b))
      - eval x (radD J a b) * plPhi vs vals slope (eval x (radU a b))) (stdGaussian d) :=
    (integrable_plPrim a b vs vals slope hvs).sub
      (integrable_mul_plPhi (radD J a b) a b vs vals slope)
  have hcomb : ∫ x, (plPrim vs vals slope (eval x (radU a b))
        - (1 / 2 : ℝ) * eval x (radC1 J a b) * plPhi vs vals slope (eval x (radU a b))
        - (1 / 2 : ℝ) * radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d)
      = (1 / 4 : ℝ) * (∫ x, (3 * plPrim vs vals slope (eval x (radU a b))
          - eval x (radS a b) * plPhi vs vals slope (eval x (radU a b))
          - 2 * radRho a b x * plY vs vals slope (eval x (radU a b))) ∂(stdGaussian d)
        + ∫ x, (plPrim vs vals slope (eval x (radU a b))
          - eval x (radD J a b) * plPhi vs vals slope (eval x (radU a b))) ∂(stdGaussian d)) := by
    rw [← integral_add hI1 hI2, ← integral_const_mul]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
    have hadd := congrArg (eval x) (radC1_add_radC2 hc.isCplx a b)
    have hsub := congrArg (eval x) (radC1_sub_radC2 hc.isCplx a b)
    simp only [map_add, map_sub] at hadd hsub
    linear_combination -(plPhi vs vals slope (eval x (radU a b)) / 4) * (hadd + hsub)
  rw [hcomb, hs, hr]; ring

end radial_rot

/-! ### Second-chaos squared decomposition and exact contraction variances -/

section variances

variable {ι : Type*} [Fintype ι]

lemma Quad.add {P Q : MvPolynomial ι ℝ} (hP : Quad P) (hQ : Quad Q) : Quad (P + Q) where
  eig := by rw [map_add, hP.eig, hQ.eig]; ring
  eig1 m := by rw [map_add, map_add, hP.eig1, hQ.eig1]; ring
  cst m n := by
    obtain ⟨a, ha⟩ := hP.cst m n
    obtain ⟨b, hb⟩ := hQ.cst m n
    exact ⟨a + b, by rw [map_add, map_add, ha, hb, map_add]⟩

lemma Quad.sub {P Q : MvPolynomial ι ℝ} (hP : Quad P) (hQ : Quad Q) : Quad (P - Q) where
  eig := by rw [map_sub, hP.eig, hQ.eig]; ring
  eig1 m := by rw [map_sub, map_sub, hP.eig1, hQ.eig1]; ring
  cst m n := by
    obtain ⟨a, ha⟩ := hP.cst m n
    obtain ⟨b, hb⟩ := hQ.cst m n
    exact ⟨a - b, by rw [map_sub, map_sub, ha, hb, map_sub]⟩

lemma Quad.C_mul {P : MvPolynomial ι ℝ} (c : ℝ) (hP : Quad P) : Quad (C c * P) where
  eig := by rw [ouL_C_mul, hP.eig]; ring
  eig1 m := by rw [pderiv_C_mul, ouL_C_mul, hP.eig1]; ring
  cst m n := by
    obtain ⟨a, ha⟩ := hP.cst m n
    exact ⟨c * a, by rw [pderiv_C_mul, pderiv_C_mul, ha, ← map_mul]⟩

lemma Quad.sum {κ : Type*} (s : Finset κ) {P : κ → MvPolynomial ι ℝ}
    (hP : ∀ k ∈ s, Quad (P k)) : Quad (∑ k ∈ s, P k) where
  eig := by
    rw [map_sum]
    calc ∑ k ∈ s, ouL (P k) = ∑ k ∈ s, -(2 * P k) := Finset.sum_congr rfl fun k hk ↦ (hP k hk).eig
      _ = -(2 * ∑ k ∈ s, P k) := by rw [Finset.sum_neg_distrib, Finset.mul_sum]
  eig1 m := by
    rw [map_sum, map_sum]
    calc ∑ k ∈ s, ouL (pderiv m (P k)) = ∑ k ∈ s, -pderiv m (P k) :=
          Finset.sum_congr rfl fun k hk ↦ (hP k hk).eig1 m
      _ = -∑ k ∈ s, pderiv m (P k) := by rw [Finset.sum_neg_distrib]
  cst m n := by
    classical
    choose t ht using fun k : {k // k ∈ s} ↦ (hP k.1 k.2).cst m n
    refine ⟨∑ k ∈ s.attach, t k, ?_⟩
    rw [map_sum, map_sum, map_sum, ← Finset.sum_attach s]
    exact Finset.sum_congr rfl fun k _ ↦ ht k

/-- Polarization of `gE_sq_quad`: `E[X Y] = (1/2) Σ_{mn} (∂_n ∂_m X)(∂_n ∂_m Y)`. -/
lemma gE_mul_quad [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {X Y : MvPolynomial ι ℝ} (hY : ouL Y = -(2 * Y))
    (cX cY : ι → ι → ℝ)
    (hcX : ∀ m n, pderiv n (pderiv m X) = C (cX m n))
    (hcY : ∀ m n, pderiv n (pderiv m Y) = C (cY m n)) :
    E (X * Y) = 1 / 2 * ∑ m, ∑ n, cX m n * cY m n := by
  have hQ : Quad Y := quad_of_eig hY fun m n ↦ ⟨cY m n, hcY m n⟩
  rw [hQ.gE_mul hE, hQ.gE_gam hE cX cY hcX hcY]

/-- Chaos-2 and chaos-4 decomposition of `P²` for a second-chaos polynomial `P`. -/
lemma Quad.sq_eig2 {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {P : MvPolynomial ι ℝ} (hP : Quad P) :
    ouL (gam P P - 2 * C (E (P * P))) = -(2 * (gam P P - 2 * C (E (P * P)))) := by
  obtain ⟨κ, hκ⟩ := hP.gam_ouL hP
  have e0 := gE_ouL hE (gam P P)
  rw [hκ, map_sub, ofNat_mul_apply, ofNat_mul_apply, gE_C hE] at e0
  have hEP := hP.gE_mul hE (P := P)
  have hκE : κ = 2 * E (P * P) := by linarith
  have h0 : ouL ((2 : MvPolynomial ι ℝ) * C (E (P * P))) = 0 := by
    rw [show (2 : MvPolynomial ι ℝ) * C (E (P * P)) = (C (2 * E (P * P)) : MvPolynomial ι ℝ) by
      rw [map_mul C, map_ofNat C], ouL_C]
  rw [map_sub, hκ, hκE, h0, sub_zero, map_mul, map_ofNat]
  ring

lemma Quad.sq_eig4 {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
    {P : MvPolynomial ι ℝ} (hP : Quad P) :
    ouL (P * P - gam P P + C (E (P * P))) = -(4 * (P * P - gam P P + C (E (P * P)))) := by
  obtain ⟨κ, hκ⟩ := hP.gam_ouL hP
  have e0 := gE_ouL hE (gam P P)
  rw [hκ, map_sub, ofNat_mul_apply, ofNat_mul_apply, gE_C hE] at e0
  have hEP := hP.gE_mul hE (P := P)
  have hκE : κ = 2 * E (P * P) := by linarith
  rw [map_add, map_sub, ouL_mul, hP.eig, hκ, hκE, ouL_C, map_mul, map_ofNat]
  ring

/-- Second derivative of `Γ(P, P)` for `P` with constant second derivative `M`. -/
lemma pderiv2_gam_quad {P : MvPolynomial ι ℝ} (M : ι → ι → ℝ)
    (hM : ∀ m n, pderiv n (pderiv m P) = C (M m n)) (m n : ι) :
    pderiv n (pderiv m (gam P P)) = C (2 * ∑ r, M r m * M r n) := by
  simp only [gam, map_sum, pderiv_mul, map_add, hM, pderiv_C, mul_zero, zero_mul,
    add_zero, zero_add]
  simp only [← map_mul, ← map_add, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
  congr 1
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun r _ ↦ by ring

omit [Fintype ι] in
/-- Fourth derivative of `P * P` when `P` has constant second derivatives `M`. -/
lemma pderiv4_sq_quad {P : MvPolynomial ι ℝ} (M : ι → ι → ℝ)
    (hM : ∀ m n, pderiv n (pderiv m P) = C (M m n)) (i j k l : ι) :
    pderiv l (pderiv k (pderiv j (pderiv i (P * P))))
      = C (2 * (M i j * M k l + M i k * M j l + M i l * M j k)) := by
  simp only [pderiv_mul, map_add, hM, pderiv_C, mul_zero, zero_mul, add_zero, zero_add]
  simp only [← map_mul, ← map_add]
  congr 1
  ring

variable [DecidableEq ι]

lemma Quad.antiRe {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (k : ι) : Quad (antiRe J a b k) :=
  Quad.C_mul _ ((ha.quad k).sub (Quad.sum Finset.univ fun j _ ↦ Quad.C_mul _ (hb.quad j)))

lemma Quad.antiIm {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (k : ι) : Quad (antiIm J a b k) :=
  Quad.C_mul _ ((hb.quad k).add (Quad.sum Finset.univ fun j _ ↦ Quad.C_mul _ (ha.quad j)))

/-- Constant second derivative of `antiRe + i antiIm = ∂̄_k q` is `2 * gramT J a b m n k`. -/
lemma pderiv2_antiRe_im {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a)
    (hc : Circular J a b) (m n k : ι) :
    pderiv n (pderiv m (antiRe J a b k)) = C (2 * (gramT J a b m n k).re) ∧
    pderiv n (pderiv m (antiIm J a b k)) = C (2 * (gramT J a b m n k).im) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hJ := hc.isCplx
  have hsym := hc.tauC_eq
  set t := cplxT J (cubicKernel a) (cubicKernel b) with ht_def
  -- Compute `cPr (cl₃ J) (-1) (tauC f g) m n k = t m n k / 3`
  have hproj : cPr (cl₃ J) (-1) (tauC (cubicKernel a) (cubicKernel b)) m n k = t m n k / 3 := by
    rw [cPr_apply_pt, cl₃_apply]
    have h1 : ∀ p, tauC (cubicKernel a) (cubicKernel b) m n p
        = (t m n p + t m p n + t p n m) / 3 := fun p ↦ hsym m n p
    simp only [h1]
    have c1 : ∑ p, (J k p : ℂ) * t m n p = -Complex.I * t m n k := chg_t3 hJ _ _ m n k
    have c2 : ∑ p, (J k p : ℂ) * t m p n = Complex.I * t m k n := chg_t2 hJ _ _ m n k
    have c3 : ∑ p, (J k p : ℂ) * t p n m = Complex.I * t k n m := chg_t1 hJ _ _ n m k
    have hsum : ∑ p, (J k p : ℂ) * ((t m n p + t m p n + t p n m) / 3)
        = (∑ p, (J k p : ℂ) * t m n p + ∑ p, (J k p : ℂ) * t m p n
          + ∑ p, (J k p : ℂ) * t p n m) / 3 := by
      rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib, Finset.sum_div]
      refine Finset.sum_congr rfl fun p _ ↦ by ring
    rw [hsum, c1, c2, c3]
    linear_combination ((-t m n k + t m k n + t k n m) / 6) * Complex.I_sq
  -- Express `∂_n ∂_m antiRe` and `∂_n ∂_m antiIm` as real and imaginary parts of `6 * cPr (cl₃) (-1) τ`
  have hfk : ∀ p, pderiv n (pderiv m (pderiv p a)) = C (6 * cubicKernel a m n p) := fun p ↦ by
    rw [pderiv_pderiv_comm m p, pderiv_pderiv_comm n p, ha.pderiv3_eq, kern_eq_six]
    congr 1; unfold cubicKernel; rw [kern_rev]
  have hgk : ∀ p, pderiv n (pderiv m (pderiv p b)) = C (6 * cubicKernel b m n p) := fun p ↦ by
    rw [pderiv_pderiv_comm m p, pderiv_pderiv_comm n p, hb.pderiv3_eq, kern_eq_six]
    congr 1; unfold cubicKernel; rw [kern_rev]
  have hsum_re : (∑ p, (J k p : ℂ) * tauC (cubicKernel a) (cubicKernel b) m n p).re
      = ∑ p, J k p * cubicKernel a m n p := by
    rw [Complex.re_sum]
    refine Finset.sum_congr rfl fun p _ ↦ ?_
    simp [tauC]
  have hsum_im : (∑ p, (J k p : ℂ) * tauC (cubicKernel a) (cubicKernel b) m n p).im
      = ∑ p, J k p * cubicKernel b m n p := by
    rw [Complex.im_sum]
    refine Finset.sum_congr rfl fun p _ ↦ ?_
    simp [tauC]
  have hre_proj : (cPr (cl₃ J) (-1) (tauC (cubicKernel a) (cubicKernel b)) m n k).re
      = (1 / 2 : ℝ) * (cubicKernel a m n k - ∑ p, J k p * cubicKernel b m n p) := by
    rw [cPr_apply_pt, cl₃_apply]
    have hhalf : (1 / 2 : ℂ) = ((1 / 2 : ℝ) : ℂ) := by norm_num
    rw [hhalf, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero,
      Complex.sub_re, Complex.mul_re, Complex.mul_re, Complex.mul_im, Complex.neg_re,
      Complex.neg_im, Complex.one_re, Complex.one_im, Complex.I_re, Complex.I_im, hsum_im]
    simp only [tauC, Complex.add_re, Complex.mul_re, Complex.I_re, Complex.I_im,
      Complex.ofReal_re, Complex.ofReal_im]
    ring
  have him_proj : (cPr (cl₃ J) (-1) (tauC (cubicKernel a) (cubicKernel b)) m n k).im
      = (1 / 2 : ℝ) * (cubicKernel b m n k + ∑ p, J k p * cubicKernel a m n p) := by
    rw [cPr_apply_pt, cl₃_apply]
    have hhalf : (1 / 2 : ℂ) = ((1 / 2 : ℝ) : ℂ) := by norm_num
    rw [hhalf, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero,
      Complex.sub_im, Complex.mul_im, Complex.mul_re, Complex.mul_im, Complex.neg_re,
      Complex.neg_im, Complex.one_re, Complex.one_im, Complex.I_re, Complex.I_im, hsum_re]
    simp only [tauC, Complex.add_im, Complex.mul_im, Complex.I_re, Complex.I_im,
      Complex.ofReal_re, Complex.ofReal_im]
    ring
  have htr : (t m n k).re = 3 * ((1 / 2 : ℝ) * (cubicKernel a m n k
      - ∑ p, J k p * cubicKernel b m n p)) := by
    have := congrArg Complex.re hproj
    rw [hre_proj, Complex.div_ofNat_re] at this; linarith
  have hti : (t m n k).im = 3 * ((1 / 2 : ℝ) * (cubicKernel b m n k
      + ∑ p, J k p * cubicKernel a m n p)) := by
    have := congrArg Complex.im hproj
    rw [him_proj, Complex.div_ofNat_im] at this; linarith
  constructor
  · simp only [antiRe, jGrad, pderiv_C_mul, map_sub, map_sum, hfk, hgk]
    simp only [← map_mul, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ), ← map_sub]
    congr 1
    change (1 / 2 : ℝ) * (6 * cubicKernel a m n k - ∑ p, J k p * (6 * cubicKernel b m n p))
      = 2 * (t m n k).re
    have e : ∑ p, J k p * (6 * cubicKernel b m n p) = 6 * ∑ p, J k p * cubicKernel b m n p := by
      rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun p _ ↦ by ring
    rw [htr, e]; ring
  · simp only [antiIm, jGrad, pderiv_C_mul, map_add, map_sum, hfk, hgk]
    simp only [← map_mul, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ), ← map_add]
    congr 1
    change (1 / 2 : ℝ) * (6 * cubicKernel b m n k + ∑ p, J k p * (6 * cubicKernel a m n p))
      = 2 * (t m n k).im
    have e : ∑ p, J k p * (6 * cubicKernel a m n p) = 6 * ∑ p, J k p * cubicKernel a m n p := by
      rw [Finset.mul_sum]; exact Finset.sum_congr rfl fun p _ ↦ by ring
    rw [hti, e]; ring

/-- `Σ_{m,n} (Re N_{mn})² = n / 2` (by charge conservation `Σ N² = 0`). -/
lemma sum_re_sq_N {J : ι → ι → ℝ} (hJ : IsCplx J) (f g : ι → ι → ι → ℝ) :
    ∑ m, ∑ n, ((ctN (cplxT J f g) m n).re) ^ 2 = gramN (cplxT J f g) / 2 := by
  set t := cplxT J f g
  have e : ∀ w : ℂ, (w.re) ^ 2 = (Complex.normSq w + (w * w).re) / 2 := fun w ↦ by
    simp only [Complex.normSq_apply, Complex.mul_re]; ring
  have vNN : ∀ m, ∑ n, ctN t m n * ctN t m n = 0 := fun m ↦
    Chg.sum_mul_eq_zero hJ.anti (chg_N2 hJ f g m) (chg_N2 hJ f g m) neg_two_I_ne_zero
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib, ← Complex.re_sum, vNN, Complex.zero_re,
    add_zero, gramN]

/-- `Σ_{m,n} (Re H_{mn})(Re N_{mn}) = z / 2` (since `Σ H N̄ = 0` by charge conservation). -/
lemma sum_re_H_re_N {J : ι → ι → ℝ} (hJ : IsCplx J) (f g : ι → ι → ι → ℝ) :
    ∑ m, ∑ n, (ctH (cplxT J f g) m n).re * (ctN (cplxT J f g) m n).re
      = gramZ (cplxT J f g) / 2 := by
  set t := cplxT J f g
  have vHcN : ∑ m, ∑ n, ctH t m n * conj (ctN t m n) = 0 := by
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun n _ ↦ ?_
    have hcN1 : Chg J (-Complex.I) (fun m ↦ conj (ctN t m n)) := by
      simpa only [Complex.conj_I] using (chg_N1 hJ f g n).conj
    exact Chg.sum_mul_eq_zero hJ.anti (chg_H1 hJ f g n) hcN1 neg_two_I_ne_zero
  have e : ∀ m n, (ctH t m n).re * (ctN t m n).re
      = ((ctN t m n * ctH t m n).re + (ctH t m n * conj (ctN t m n)).re) / 2 := fun m n ↦ by
    simp only [Complex.mul_re, Complex.conj_re, Complex.conj_im]; ring
  simp only [e, ← Finset.sum_div, Finset.sum_add_distrib, ← Complex.re_sum, vHcN, Complex.zero_re,
    add_zero, gramZ]

/-- `Σ_{a,b,c,d} (Re(D_{ab;cd} + D_{ac;bd} + D_{ad;bc}))² = (3/2) h`: the six permutations of
`(+,+,−,−)` in `D + D̄` are pairwise orthogonal by charge conservation. -/
lemma sum_re_D3_sq {J : ι → ι → ℝ} (hJ : IsCplx J) (f g : ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, ((ctD (cplxT J f g) a b c d + ctD (cplxT J f g) a c b d
        + ctD (cplxT J f g) a d b c).re) ^ 2
      = 3 / 2 * gramH (cplxT J f g) := by
  set t := cplxT J f g
  have hconj : ∀ a b c d, conj (ctD t a b c d) = ctD t c d a b := fun a b c d ↦ by
    simp only [ctD, map_sum, map_mul, Complex.conj_conj, mul_comm]
  have hre : ∀ a b c d,
      2 * ((ctD t a b c d + ctD t a c b d + ctD t a d b c).re : ℂ)
        = ctD t a b c d + ctD t c d a b + ctD t a c b d + ctD t b d a c
          + ctD t a d b c + ctD t b c a d := fun a b c d ↦ by
    have hz : ∀ w : ℂ, (2 * (w.re : ℂ)) = w + conj w := fun w ↦ by
      apply Complex.ext <;> simp
      ring
    rw [hz, map_add, map_add, hconj, hconj, hconj]; ring
  let X1 : ι → ι → ι → ι → ℂ := ctD t
  let X2 : ι → ι → ι → ι → ℂ := fun a b c d ↦ ctD t c d a b
  let X3 : ι → ι → ι → ι → ℂ := fun a b c d ↦ ctD t a c b d
  let X4 : ι → ι → ι → ι → ℂ := fun a b c d ↦ ctD t b d a c
  let X5 : ι → ι → ι → ι → ℂ := fun a b c d ↦ ctD t a d b c
  let X6 : ι → ι → ι → ι → ℂ := fun a b c d ↦ ctD t b c a d
  let S : ι → ι → ι → ι → ℂ := fun a b c d ↦
    X1 a b c d + X2 a b c d + X3 a b c d + X4 a b c d + X5 a b c d + X6 a b c d
  have hhipS : (hip S S).re = 4 * ∑ a, ∑ b, ∑ c, ∑ d,
      ((ctD t a b c d + ctD t a c b d + ctD t a d b c).re) ^ 2 := by
    simp only [hip, S, X1, X2, X3, X4, X5, X6]
    have hpt : ∀ a b c d,
        (ctD t a b c d + ctD t c d a b + ctD t a c b d + ctD t b d a c
          + ctD t a d b c + ctD t b c a d)
        * conj (ctD t a b c d + ctD t c d a b + ctD t a c b d + ctD t b d a c
          + ctD t a d b c + ctD t b c a d)
        = ((4 * ((ctD t a b c d + ctD t a c b d + ctD t a d b c).re) ^ 2 : ℝ) : ℂ) := by
      intro a b c d
      rw [← hre a b c d, map_mul, Complex.conj_ofReal, map_ofNat]
      push_cast; ring
    simp only [hpt, Complex.re_sum, Complex.ofReal_re, Finset.mul_sum]
  -- Pairwise orthogonality of X1..X6 via slot charges of `ctD t` (`+, +, -, -`)
  have hD1 : ∀ b c d, Chg J Complex.I (fun a ↦ ctD t a b c d) := fun b c d ↦
    Chg.sum fun x ↦ (chg_t1 hJ f g b x).mul_const _
  have hD2 : ∀ a c d, Chg J Complex.I (fun b ↦ ctD t a b c d) := fun a c d ↦
    Chg.sum fun x ↦ (chg_t2 hJ f g a x).mul_const _
  have hD3 : ∀ a b d, Chg J (-Complex.I) (fun c ↦ ctD t a b c d) := fun a b d ↦
    Chg.sum fun x ↦ (chg_ct1 hJ f g d x).const_mul _
  have hD4 : ∀ a b c, Chg J (-Complex.I) (fun d ↦ ctD t a b c d) := fun a b c ↦
    Chg.sum fun x ↦ (chg_ct2 hJ f g c x).const_mul _
  have hcD1 : ∀ b c d, Chg J (-Complex.I) (fun a ↦ conj (ctD t a b c d)) := fun b c d ↦ by
    simpa only [Complex.conj_I] using (hD1 b c d).conj
  have hcD2 : ∀ a c d, Chg J (-Complex.I) (fun b ↦ conj (ctD t a b c d)) := fun a c d ↦ by
    simpa only [Complex.conj_I] using (hD2 a c d).conj
  have hcD3 : ∀ a b d, Chg J Complex.I (fun c ↦ conj (ctD t a b c d)) := fun a b d ↦ by
    simpa only [map_neg, Complex.conj_I, neg_neg] using (hD3 a b d).conj
  have hcD4 : ∀ a b c, Chg J Complex.I (fun d ↦ conj (ctD t a b c d)) := fun a b c ↦ by
    simpa only [map_neg, Complex.conj_I, neg_neg] using (hD4 a b c).conj
  -- Helper: `hip U V = 0` whenever slot `a` (or `b`, `c`, `d`) has opposite conjugate charges
  have orth1 : ∀ (U V : ι → ι → ι → ι → ℂ) (s1 s2 : ℂ), s1 + s2 ≠ 0 →
      (∀ b c d, Chg J s1 (fun a ↦ U a b c d)) →
      (∀ b c d, Chg J s2 (fun a ↦ conj (V a b c d))) → hip U V = 0 := by
    intro U V s1 s2 hne hU hV
    rw [hip, Finset.sum_comm]
    refine Finset.sum_eq_zero fun b _ ↦ ?_
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun c _ ↦ ?_
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun d _ ↦ Chg.sum_mul_eq_zero hJ.anti (hU b c d) (hV b c d) hne
  have orth2 : ∀ (U V : ι → ι → ι → ι → ℂ) (s1 s2 : ℂ), s1 + s2 ≠ 0 →
      (∀ a c d, Chg J s1 (fun b ↦ U a b c d)) →
      (∀ a c d, Chg J s2 (fun b ↦ conj (V a b c d))) → hip U V = 0 := by
    intro U V s1 s2 hne hU hV
    refine Finset.sum_eq_zero fun a _ ↦ ?_
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun c _ ↦ ?_
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun d _ ↦ Chg.sum_mul_eq_zero hJ.anti (hU a c d) (hV a c d) hne
  have orth3 : ∀ (U V : ι → ι → ι → ι → ℂ) (s1 s2 : ℂ), s1 + s2 ≠ 0 →
      (∀ a b d, Chg J s1 (fun c ↦ U a b c d)) →
      (∀ a b d, Chg J s2 (fun c ↦ conj (V a b c d))) → hip U V = 0 := by
    intro U V s1 s2 hne hU hV
    refine Finset.sum_eq_zero fun a _ ↦ Finset.sum_eq_zero fun b _ ↦ ?_
    rw [Finset.sum_comm]
    refine Finset.sum_eq_zero fun d _ ↦ Chg.sum_mul_eq_zero hJ.anti (hU a b d) (hV a b d) hne
  -- Compute `hip X_i X_j = if i = j then gramH t else 0`
  have hnorm : ∀ (U : ι → ι → ι → ι → ℂ),
      (∀ a b c d, U a b c d = ctD t a b c d) ∨
      (∀ a b c d, U a b c d = ctD t c d a b) ∨
      (∀ a b c d, U a b c d = ctD t a c b d) ∨
      (∀ a b c d, U a b c d = ctD t b d a c) ∨
      (∀ a b c d, U a b c d = ctD t a d b c) ∨
      (∀ a b c d, U a b c d = ctD t b c a d) →
      (hip U U).re = gramH t := by
    intro U hU
    have hDnorm : (hip (ctD t) (ctD t)).re = gramH t := by
      have h : hip (ctD t) (ctD t) = (gramH t : ℂ) := hipD_D (t := t)
      rw [h, Complex.ofReal_re]
    rcases hU with h | h | h | h | h | h
    · simpa only [hip, h] using hDnorm
    · rw [← hDnorm]; congr 1; simp only [hip, h]
      rw [csum4_rot1, csum4_rot1]
    · rw [← hDnorm]; congr 1; simp only [hip, h]
      refine Finset.sum_congr rfl fun a _ ↦ ?_
      rw [Finset.sum_comm]
    · rw [← hDnorm]; congr 1; simp only [hip, h]
      rw [csum4_rot1]
      refine Finset.sum_congr rfl fun b _ ↦ ?_
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl fun d _ ↦ ?_
      rw [Finset.sum_comm]
    · rw [← hDnorm]; congr 1; simp only [hip, h]
      refine Finset.sum_congr rfl fun a _ ↦ ?_
      calc ∑ b, ∑ c, ∑ d, ctD t a d b c * conj (ctD t a d b c)
          = ∑ b, ∑ d, ∑ c, ctD t a d b c * conj (ctD t a d b c) :=
            Finset.sum_congr rfl fun b _ ↦ Finset.sum_comm
        _ = ∑ d, ∑ b, ∑ c, ctD t a d b c * conj (ctD t a d b c) := Finset.sum_comm
    · rw [← hDnorm]; congr 1; simp only [hip, h]
      rw [csum4_rot1]
      refine Finset.sum_congr rfl fun b _ ↦ ?_
      refine Finset.sum_congr rfl fun c _ ↦ ?_
      rw [Finset.sum_comm]
  have h12 : hip X1 X2 = 0 := orth1 X1 X2 Complex.I Complex.I two_I_ne_zero hD1 (fun b c d ↦ hcD3 c d b)
  have h13 : hip X1 X3 = 0 := orth2 X1 X3 Complex.I Complex.I two_I_ne_zero hD2 (fun a c d ↦ hcD3 a c d)
  have h14 : hip X1 X4 = 0 := orth1 X1 X4 Complex.I Complex.I two_I_ne_zero hD1 (fun b c d ↦ hcD3 b d c)
  have h15 : hip X1 X5 = 0 := orth2 X1 X5 Complex.I Complex.I two_I_ne_zero hD2 (fun a c d ↦ hcD3 a d c)
  have h16 : hip X1 X6 = 0 := orth1 X1 X6 Complex.I Complex.I two_I_ne_zero hD1 (fun b c d ↦ hcD3 b c d)
  have h23 : hip X2 X3 = 0 := orth1 X2 X3 (-Complex.I) (-Complex.I) neg_two_I_ne_zero (fun b c d ↦ hD3 c d b) (fun b c d ↦ hcD1 c b d)
  have h24 : hip X2 X4 = 0 := orth2 X2 X4 (-Complex.I) (-Complex.I) neg_two_I_ne_zero (fun a c d ↦ hD4 c d a) (fun a c d ↦ hcD1 d a c)
  have h25 : hip X2 X5 = 0 := orth1 X2 X5 (-Complex.I) (-Complex.I) neg_two_I_ne_zero (fun b c d ↦ hD3 c d b) (fun b c d ↦ hcD1 d b c)
  have h26 : hip X2 X6 = 0 := orth2 X2 X6 (-Complex.I) (-Complex.I) neg_two_I_ne_zero (fun a c d ↦ hD4 c d a) (fun a c d ↦ hcD1 c a d)
  have h34 : hip X3 X4 = 0 := orth1 X3 X4 Complex.I Complex.I two_I_ne_zero (fun b c d ↦ hD1 c b d) (fun b c d ↦ hcD3 b d c)
  have h35 : hip X3 X5 = 0 := orth3 X3 X5 Complex.I Complex.I two_I_ne_zero (fun a b d ↦ hD2 a b d) (fun a b d ↦ hcD4 a d b)
  have h36 : hip X3 X6 = 0 := orth1 X3 X6 Complex.I Complex.I two_I_ne_zero (fun b c d ↦ hD1 c b d) (fun b c d ↦ hcD3 b c d)
  have h45 : hip X4 X5 = 0 := orth1 X4 X5 (-Complex.I) (-Complex.I) neg_two_I_ne_zero (fun b c d ↦ hD3 b d c) (fun b c d ↦ hcD1 d b c)
  have h46 : hip X4 X6 = 0 := orth3 X4 X6 (-Complex.I) (-Complex.I) neg_two_I_ne_zero (fun a b d ↦ hD4 b d a) (fun a b d ↦ hcD2 b a d)
  have h56 : hip X5 X6 = 0 := orth1 X5 X6 Complex.I Complex.I two_I_ne_zero (fun b c d ↦ hD1 d b c) (fun b c d ↦ hcD3 b c d)
  have hsym_orth : ∀ (U V : ι → ι → ι → ι → ℂ), hip U V = 0 → hip V U = 0 := fun U V h ↦ by
    have hconj' : hip V U = conj (hip U V) := by
      simp only [hip, map_sum, map_mul, Complex.conj_conj, mul_comm]
    rw [hconj', h, map_zero]
  have hip_add_l : ∀ (U V W : ι → ι → ι → ι → ℂ),
      hip (fun a b c d ↦ U a b c d + V a b c d) W = hip U W + hip V W := fun U V W ↦ by
    simp only [hip, add_mul, Finset.sum_add_distrib]
  have hip_add_r : ∀ (U V W : ι → ι → ι → ι → ℂ),
      hip U (fun a b c d ↦ V a b c d + W a b c d) = hip U V + hip U W := fun U V W ↦ by
    simp only [hip, map_add, mul_add, Finset.sum_add_distrib]
  have hexp : hip S S = hip X1 X1 + hip X2 X2 + hip X3 X3 + hip X4 X4 + hip X5 X5 + hip X6 X6 := by
    have h1 : ∀ W : ι → ι → ι → ι → ℂ,
        hip S W = hip X1 W + hip X2 W + hip X3 W + hip X4 W + hip X5 W + hip X6 W := fun W ↦ by
      simp only [S, hip_add_l]
    have h2 : ∀ U : ι → ι → ι → ι → ℂ,
        hip U S = hip U X1 + hip U X2 + hip U X3 + hip U X4 + hip U X5 + hip U X6 := fun U ↦ by
      simp only [S, hip_add_r]
    rw [h1 S, h2 X1, h2 X2, h2 X3, h2 X4, h2 X5, h2 X6,
      h12, h13, h14, h15, h16, h23, h24, h25, h26, h34, h35, h36, h45, h46, h56,
      hsym_orth _ _ h12, hsym_orth _ _ h13, hsym_orth _ _ h14, hsym_orth _ _ h15,
      hsym_orth _ _ h16, hsym_orth _ _ h23, hsym_orth _ _ h24, hsym_orth _ _ h25,
      hsym_orth _ _ h26, hsym_orth _ _ h34, hsym_orth _ _ h35, hsym_orth _ _ h36,
      hsym_orth _ _ h45, hsym_orth _ _ h46, hsym_orth _ _ h56]
    ring
  have hSre : (hip S S).re = 6 * gramH t := by
    rw [hexp]
    simp only [Complex.add_re]
    rw [hnorm X1 (Or.inl fun _ _ _ _ ↦ rfl),
      hnorm X2 (Or.inr (Or.inl fun _ _ _ _ ↦ rfl)),
      hnorm X3 (Or.inr (Or.inr (Or.inl fun _ _ _ _ ↦ rfl))),
      hnorm X4 (Or.inr (Or.inr (Or.inr (Or.inl fun _ _ _ _ ↦ rfl)))),
      hnorm X5 (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl fun _ _ _ _ ↦ rfl))))),
      hnorm X6 (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr fun _ _ _ _ ↦ rfl)))))]
    ring
  linarith

/-- The chaos-2 component `(c₂)₂` and chaos-4 component `(c₂)₄` of `c₂ − 1`. -/
def radC2_2 (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  ∑ k, (gam (antiRe J a b k) (antiRe J a b k) + gam (antiIm J a b k) (antiIm J a b k)) - C 2

def radC2_4 (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  radC2 J a b - radC2_2 J a b - C 1

omit [DecidableEq ι] in
lemma radC2_sub_one_eq (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) :
    radC2 J a b - C 1 = radC2_2 J a b + radC2_4 J a b := by
  unfold radC2_4; ring

lemma pderiv2_radC2_2 {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a)
    (hc : Circular J a b) (m n : ι) :
    pderiv n (pderiv m (radC2_2 J a b)) = C (8 * (ctN (gramT J a b) m n).re) := by
  set t := gramT J a b
  have hre : ∀ k m' n', pderiv n' (pderiv m' (antiRe J a b k)) = C (2 * (t m' n' k).re) :=
    fun k m' n' ↦ (pderiv2_antiRe_im ha hc m' n' k).1
  have him : ∀ k m' n', pderiv n' (pderiv m' (antiIm J a b k)) = C (2 * (t m' n' k).im) :=
    fun k m' n' ↦ (pderiv2_antiRe_im ha hc m' n' k).2
  unfold radC2_2
  simp only [map_sub, map_sum, map_add, pderiv_C, sub_zero,
    pderiv2_gam_quad (fun m' n' ↦ 2 * (t m' n' _).re) (hre _),
    pderiv2_gam_quad (fun m' n' ↦ 2 * (t m' n' _).im) (him _)]
  simp only [← map_add, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
  congr 1
  simp only [ctN, Complex.re_sum, Complex.mul_re, Complex.conj_re, Complex.conj_im,
    Finset.mul_sum]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun r _ ↦ ?_
  rw [← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun k _ ↦ ?_
  have hs1 : t k m r = t m k r := gramT_symm12 J a b k m r
  have hs2 : t k n r = t n k r := gramT_symm12 J a b k n r
  rw [hs1, hs2]; ring

lemma pderiv4_radC2_4 {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a)
    (hc : Circular J a b) (i j k l : ι) :
    pderiv l (pderiv k (pderiv j (pderiv i (radC2_4 J a b))))
      = C (8 * (ctD (gramT J a b) i j k l + ctD (gramT J a b) i k j l
          + ctD (gramT J a b) i l j k).re) := by
  set t := gramT J a b
  have hre : ∀ r m' n', pderiv n' (pderiv m' (antiRe J a b r)) = C (2 * (t m' n' r).re) :=
    fun r m' n' ↦ (pderiv2_antiRe_im ha hc m' n' r).1
  have him : ∀ r m' n', pderiv n' (pderiv m' (antiIm J a b r)) = C (2 * (t m' n' r).im) :=
    fun r m' n' ↦ (pderiv2_antiRe_im ha hc m' n' r).2
  have h0 : pderiv l (pderiv k (pderiv j (pderiv i (radC2_2 J a b)))) = 0 := by
    rw [pderiv2_radC2_2 ha hc, pderiv_C, map_zero]
  unfold radC2_4
  simp only [map_sub, pderiv_C, sub_zero, h0]
  unfold radC2
  simp only [map_sum, map_add,
    pderiv4_sq_quad (fun m' n' ↦ 2 * (t m' n' _).re) (hre _),
    pderiv4_sq_quad (fun m' n' ↦ 2 * (t m' n' _).im) (him _)]
  simp only [← map_add, ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
  congr 1
  simp only [ctD, Complex.add_re, Complex.re_sum, Complex.mul_re, Complex.conj_re,
    Complex.conj_im, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun r _ ↦ by ring

section circular_variances

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
  {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hc : Circular J a b)
  (haa : E (a * a) = 1 / 2)
include hE ha hc haa

/-- `E[c₂] = 1` and `E[c₁] = 2` for a normalized circular cubic. -/
lemma Circular.gE_radC2 : E (radC2 J a b) = 1 := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hU1 : E (radU a b) = 1 := by rw [radU, map_add, haa, hbb]; norm_num
  have hS := fluctuation_mean hE ha hb haa hbb
  have hD := hc.gE_radD hE
  have hadd := congrArg E (radC1_add_radC2 hc.isCplx a b)
  have hsub := congrArg E (radC1_sub_radC2 hc.isCplx a b)
  rw [map_add] at hadd
  rw [map_sub] at hsub
  linarith

lemma Circular.gE_radC1 : E (radC1 J a b) = 2 := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hS := fluctuation_mean hE ha hb haa hbb
  have hC2 := hc.gE_radC2 hE ha haa
  have hadd := congrArg E (radC1_add_radC2 hc.isCplx a b)
  rw [map_add] at hadd
  linarith

lemma Circular.ouL_radC2_2 : ouL (radC2_2 J a b) = -(2 * radC2_2 J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hC2 : E (radC2 J a b) = 1 := hc.gE_radC2 hE ha haa
  have hsumE : ∑ k, (E (antiRe J a b k * antiRe J a b k)
      + E (antiIm J a b k * antiIm J a b k)) = 1 := by
    simpa only [radC2, map_sum, map_add] using hC2
  have hdecomp : radC2_2 J a b
      = ∑ k, ((gam (antiRe J a b k) (antiRe J a b k)
          - 2 * C (E (antiRe J a b k * antiRe J a b k)))
        + (gam (antiIm J a b k) (antiIm J a b k)
          - 2 * C (E (antiIm J a b k * antiIm J a b k)))) := by
    unfold radC2_2
    simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum,
      ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
    have h2 : (2 : MvPolynomial ι ℝ) * C (∑ k, E (antiRe J a b k * antiRe J a b k))
        + 2 * C (∑ k, E (antiIm J a b k * antiIm J a b k)) = C 2 := by
      rw [← mul_add, ← map_add, ← Finset.sum_add_distrib, hsumE, map_one, mul_one, map_ofNat]
    linear_combination h2
  rw [hdecomp, map_sum]
  have hterm : ∀ k, ouL ((gam (antiRe J a b k) (antiRe J a b k)
          - 2 * C (E (antiRe J a b k * antiRe J a b k)))
        + (gam (antiIm J a b k) (antiIm J a b k)
          - 2 * C (E (antiIm J a b k * antiIm J a b k))))
      = -(2 * ((gam (antiRe J a b k) (antiRe J a b k)
          - 2 * C (E (antiRe J a b k * antiRe J a b k)))
        + (gam (antiIm J a b k) (antiIm J a b k)
          - 2 * C (E (antiIm J a b k * antiIm J a b k))))) := fun k ↦ by
    rw [map_add, (Quad.antiRe ha hb k).sq_eig2 hE, (Quad.antiIm ha hb k).sq_eig2 hE]; ring
  rw [Finset.sum_congr rfl fun k _ ↦ hterm k, Finset.sum_neg_distrib, Finset.mul_sum]

lemma Circular.ouL_radC2_4 : ouL (radC2_4 J a b) = -(4 * radC2_4 J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hC2 : E (radC2 J a b) = 1 := hc.gE_radC2 hE ha haa
  have hsumE : ∑ k, (E (antiRe J a b k * antiRe J a b k)
      + E (antiIm J a b k * antiIm J a b k)) = 1 := by
    simpa only [radC2, map_sum, map_add] using hC2
  have hdecomp : radC2_4 J a b
      = ∑ k, ((antiRe J a b k * antiRe J a b k - gam (antiRe J a b k) (antiRe J a b k)
          + C (E (antiRe J a b k * antiRe J a b k)))
        + (antiIm J a b k * antiIm J a b k - gam (antiIm J a b k) (antiIm J a b k)
          + C (E (antiIm J a b k * antiIm J a b k)))) := by
    unfold radC2_4 radC2_2 radC2
    simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib,
      ← map_sum (C : ℝ →+* MvPolynomial ι ℝ)]
    have h1 : (C (∑ k, E (antiRe J a b k * antiRe J a b k)) : MvPolynomial ι ℝ)
        + C (∑ k, E (antiIm J a b k * antiIm J a b k)) = C 1 := by
      rw [← map_add, ← Finset.sum_add_distrib, hsumE]
    have h2 : (C 2 : MvPolynomial ι ℝ) - C 1 = C 1 := by
      rw [← map_sub]; norm_num
    linear_combination -h1 + h2
  rw [hdecomp, map_sum]
  have hterm : ∀ k, ouL ((antiRe J a b k * antiRe J a b k - gam (antiRe J a b k) (antiRe J a b k)
          + C (E (antiRe J a b k * antiRe J a b k)))
        + (antiIm J a b k * antiIm J a b k - gam (antiIm J a b k) (antiIm J a b k)
          + C (E (antiIm J a b k * antiIm J a b k))))
      = -(4 * ((antiRe J a b k * antiRe J a b k - gam (antiRe J a b k) (antiRe J a b k)
          + C (E (antiRe J a b k * antiRe J a b k)))
        + (antiIm J a b k * antiIm J a b k - gam (antiIm J a b k) (antiIm J a b k)
          + C (E (antiIm J a b k * antiIm J a b k))))) := fun k ↦ by
    rw [map_add, (Quad.antiRe ha hb k).sq_eig4 hE, (Quad.antiIm ha hb k).sq_eig4 hE]; ring
  rw [Finset.sum_congr rfl fun k _ ↦ hterm k, Finset.sum_neg_distrib, Finset.mul_sum]

/-- `‖(c₂)₂‖² = 16 n`. -/
lemma Circular.gE_radC2_2_sq : E (radC2_2 J a b * radC2_2 J a b) = 16 * gramN (gramT J a b) := by
  rw [gE_sq_quad hE (hc.ouL_radC2_2 hE ha haa) _ (pderiv2_radC2_2 ha hc)]
  have e : ∀ m n, 8 * (ctN (gramT J a b) m n).re * (8 * (ctN (gramT J a b) m n).re)
      = 64 * ((ctN (gramT J a b) m n).re) ^ 2 := fun _ _ ↦ by ring
  simp only [e, ← Finset.mul_sum]
  unfold gramT
  rw [sum_re_sq_N hc.isCplx (cubicKernel a) (cubicKernel b)]
  ring

/-- `‖(c₂)₄‖² = 4 h`. -/
lemma Circular.gE_radC2_4_sq : E (radC2_4 J a b * radC2_4 J a b) = 4 * gramH (gramT J a b) := by
  rw [gE_sq_chaos4 hE (hc.ouL_radC2_4 hE ha haa) _ (pderiv4_radC2_4 ha hc)]
  have e : ∀ i j k l, (8 * (ctD (gramT J a b) i j k l + ctD (gramT J a b) i k j l
        + ctD (gramT J a b) i l j k).re) ^ 2
      = 64 * ((ctD (gramT J a b) i j k l + ctD (gramT J a b) i k j l
        + ctD (gramT J a b) i l j k).re) ^ 2 := fun _ _ _ _ ↦ by ring
  simp only [e, ← Finset.mul_sum]
  unfold gramT
  rw [sum_re_D3_sq hc.isCplx (cubicKernel a) (cubicKernel b)]
  ring

/-- `⟨U₂, (c₂)₂⟩ = 16 n + 8 z`. -/
lemma Circular.gE_U2_mul_radC2_2 :
    E (proj2 (radU a b - C 1) * radC2_2 J a b)
      = 16 * gramN (gramT J a b) + 8 * gramZ (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  obtain ⟨p2, -, -⟩ := proj_radU hE ha hb (v := 1) haa hbb
  rw [p2]
  have hcd : ∀ m n, pderiv n (pderiv m (comp2 E a a + comp2 E b b))
      = C (4 * (ctH (gramT J a b) m n + 2 * ctN (gramT J a b) m n).re) := fun m n ↦ by
    rw [map_add, map_add, pderiv2_comp2 ha ha, pderiv2_comp2 hb hb, ← map_add]
    congr 1
    have hre : kerGs (cubicKernel a) (cubicKernel a) m n
        + kerGs (cubicKernel b) (cubicKernel b) m n
        = (ctH (gramT J a b) m n + 2 * ctN (gramT J a b) m n).re / 9 := by
      unfold gramT
      rw [← Htau2_re, Htau2_eq hc.isCplx hc.tauC_eq m n, Complex.div_ofNat_re]
    have ha_sym : kerGs (cubicKernel a) (cubicKernel a) n m
        = kerGs (cubicKernel a) (cubicKernel a) m n := kerGs_comm (cubicKernel a) m n
    have hb_sym : kerGs (cubicKernel b) (cubicKernel b) n m
        = kerGs (cubicKernel b) (cubicKernel b) m n := kerGs_comm (cubicKernel b) m n
    rw [ha_sym, hb_sym]
    linear_combination 36 * hre
  rw [gE_mul_quad hE (hc.ouL_radC2_2 hE ha haa) _ _ hcd (pderiv2_radC2_2 ha hc)]
  have e : ∀ m n, 4 * (ctH (gramT J a b) m n + 2 * ctN (gramT J a b) m n).re
        * (8 * (ctN (gramT J a b) m n).re)
      = 32 * ((ctH (gramT J a b) m n).re * (ctN (gramT J a b) m n).re)
        + 64 * ((ctN (gramT J a b) m n).re) ^ 2 := fun m n ↦ by
    simp only [Complex.add_re, Complex.mul_re, Complex.re_ofNat, Complex.im_ofNat]; ring
  simp only [e, Finset.sum_add_distrib, ← Finset.mul_sum]
  unfold gramT
  rw [sum_re_H_re_N hc.isCplx (cubicKernel a) (cubicKernel b),
    sum_re_sq_N hc.isCplx (cubicKernel a) (cubicKernel b)]
  ring

/-- **Antiholomorphic variance identity:** `E[(c₂ − 1)²] = 16 n + 4 h`. -/
theorem Circular.gE_radC2_sub_one_sq :
    E ((radC2 J a b - 1) * (radC2 J a b - 1))
      = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b) := by
  have h1 : radC2 J a b - 1 = radC2_2 J a b + radC2_4 J a b := by
    simpa only [map_one] using radC2_sub_one_eq J a b
  rw [h1]
  have horth : E (radC2_2 J a b * radC2_4 J a b) = 0 :=
    gE_eigen_orth hE 2 4 (by norm_num) (hc.ouL_radC2_2 hE ha haa) (hc.ouL_radC2_4 hE ha haa)
  rw [show (radC2_2 J a b + radC2_4 J a b) * (radC2_2 J a b + radC2_4 J a b)
      = radC2_2 J a b * radC2_2 J a b + radC2_4 J a b * radC2_4 J a b
        + 2 * (radC2_2 J a b * radC2_4 J a b) by ring,
    map_add, map_add, ofNat_mul_apply, horth, hc.gE_radC2_2_sq hE ha haa,
    hc.gE_radC2_4_sq hE ha haa]
  ring

/-- `E[(S − 3)(c₂ − 1)] = 32 n + 4 h + 24 y + 8 z`. -/
theorem Circular.gE_radS_mul_radC2 :
    E ((radS a b - 3) * (radC2 J a b - 1))
      = 32 * gramN (gramT J a b) + 4 * gramH (gramT J a b)
        + 24 * gramY (gramT J a b) + 8 * gramZ (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hU1 : E (radU a b) = 1 := by rw [radU, map_add, haa, hbb]; norm_num
  have hD1 : E (radD J a b) = 1 := by rw [hc.gE_radD hE, hU1]
  have hSU := SU_eq hE ha hb haa hbb
  have hu2 := hc.specU2_eq hE ha haa
  have hu4 := hc.specU4_eq hE ha haa
  have hDU := hc.gE_radD_mul_radU hE
  have h4th := hc.fourth_moment_contractions hE ha
  rw [haa] at h4th
  have hDU1 : E ((radD J a b - 1) * (radU a b - C 1))
      = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b)
        + 16 * gramB (gramT J a b) + 48 * gramY (gramT J a b) := by
    have e : (radD J a b - 1) * (radU a b - C 1)
        = radD J a b * radU a b - radD J a b - radU a b + 1 := by simp only [map_one]; ring
    have eU2 : E (radU a b * radU a b) = E (radU a b ^ 2) := by congr 1; ring
    rw [e, map_add, map_sub, map_sub, hD1, hU1, hE.one]
    linarith [hDU, eU2, h4th]
  have hC2U : E ((radU a b - C 1) * (radC2 J a b - 1))
      = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b) + 24 * gramY (gramT J a b) := by
    have hrel : 2 * (radC2 J a b - 1) = (radS a b - 3) - (radD J a b - 1) := by
      have hadd := radC1_add_radC2 hc.isCplx a b
      have hsub := radC1_sub_radC2 hc.isCplx a b
      linear_combination hadd - hsub
    have e : 2 * ((radU a b - C 1) * (radC2 J a b - 1))
        = (radS a b - 3) * (radU a b - C 1) - (radD J a b - 1) * (radU a b - C 1) := by
      linear_combination (radU a b - C 1) * hrel
    have hE' := congrArg E e
    rw [ofNat_mul_apply, map_sub, hSU, hu2, hu4, hDU1] at hE'
    linarith
  -- Now compare `E[(S − 3)(c₂ − 1)] = 2⟨U₂, (c₂)₂⟩ + ⟨U₄, (c₂)₄⟩` with `E[(U − 1)(c₂ − 1)]`
  obtain ⟨p2, p4, p6⟩ := proj_radU hE ha hb (v := 1) haa hbb
  have hSproj := radS_eq_proj hE ha hb (v := 1) haa hbb
  rw [C_three_one] at hSproj
  have hUcomp : radU a b - C 1
      = proj2 (radU a b - C 1) + proj4 (radU a b - C 1) + proj6 (radU a b - C 1) := by
    rw [p2, p4, p6]; exact radU_sub_eq_comps E haa hbb
  have e2 : ouL (proj2 (radU a b - C 1)) = -(2 * proj2 (radU a b - C 1)) := by
    rw [p2]; exact eigen_add 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)
  have e4 : ouL (proj4 (radU a b - C 1)) = -(4 * proj4 (radU a b - C 1)) := by
    rw [p4]; exact eigen_add 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)
  have e6 : ouL (proj6 (radU a b - C 1)) = -(6 * proj6 (radU a b - C 1)) := by
    rw [p6]; exact eigen_add 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)
  have hC2decomp : radC2 J a b - 1 = radC2_2 J a b + radC2_4 J a b := by
    simpa only [map_one] using radC2_sub_one_eq J a b
  have ec2 := hc.ouL_radC2_2 hE ha haa
  have ec4 := hc.ouL_radC2_4 hE ha haa
  have o24 := gE_eigen_orth hE 2 4 (by norm_num) e2 ec4
  have o42 := gE_eigen_orth hE 4 2 (by norm_num) e4 ec2
  have o62 := gE_eigen_orth hE 6 2 (by norm_num) e6 ec2
  have o64 := gE_eigen_orth hE 6 4 (by norm_num) e6 ec4
  have hSsplit : E ((radS a b - 3) * (radC2 J a b - 1))
      = 2 * E (proj2 (radU a b - C 1) * radC2_2 J a b)
        + E (proj4 (radU a b - C 1) * radC2_4 J a b) := by
    conv_lhs => rw [hSproj, hC2decomp]
    rw [show (2 * proj2 (radU a b - C 1) + proj4 (radU a b - C 1))
          * (radC2_2 J a b + radC2_4 J a b)
        = 2 * (proj2 (radU a b - C 1) * radC2_2 J a b)
          + 2 * (proj2 (radU a b - C 1) * radC2_4 J a b)
          + proj4 (radU a b - C 1) * radC2_2 J a b
          + proj4 (radU a b - C 1) * radC2_4 J a b by ring]
    rw [map_add, map_add, map_add, ofNat_mul_apply, ofNat_mul_apply, o24, o42]
    ring
  have hUsplit : E ((radU a b - C 1) * (radC2 J a b - 1))
      = E (proj2 (radU a b - C 1) * radC2_2 J a b)
        + E (proj4 (radU a b - C 1) * radC2_4 J a b) := by
    conv_lhs => rw [hUcomp, hC2decomp]
    rw [show (proj2 (radU a b - C 1) + proj4 (radU a b - C 1) + proj6 (radU a b - C 1))
          * (radC2_2 J a b + radC2_4 J a b)
        = proj2 (radU a b - C 1) * radC2_2 J a b
          + proj2 (radU a b - C 1) * radC2_4 J a b
          + proj4 (radU a b - C 1) * radC2_2 J a b
          + proj4 (radU a b - C 1) * radC2_4 J a b
          + proj6 (radU a b - C 1) * radC2_2 J a b
          + proj6 (radU a b - C 1) * radC2_4 J a b by ring]
    rw [map_add, map_add, map_add, map_add, map_add, o24, o42, o62, o64]
    ring
  have hU2c2 := hc.gE_U2_mul_radC2_2 hE ha haa
  linarith

/-- **Signed-difference variance:** `E[(c₁ − c₂ − 1)²] = 16 n + 20 h + 16 b`. -/
theorem Circular.gE_radD_sub_one_sq :
    E ((radD J a b - 1) * (radD J a b - 1))
      = 16 * gramN (gramT J a b) + 20 * gramH (gramT J a b) + 16 * gramB (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hS2 := varS_eq hE ha hb haa hbb
  have hu2 := hc.specU2_eq hE ha haa
  have hu4 := hc.specU4_eq hE ha haa
  have hC22 := hc.gE_radC2_sub_one_sq hE ha haa
  have hSC2 := hc.gE_radS_mul_radC2 hE ha haa
  have hrel : radD J a b - 1 = (radS a b - 3) - 2 * (radC2 J a b - 1) := by
    have hadd := radC1_add_radC2 hc.isCplx a b
    have hsub := radC1_sub_radC2 hc.isCplx a b
    linear_combination hadd - hsub
  rw [hrel, show ((radS a b - 3) - 2 * (radC2 J a b - 1))
      * ((radS a b - 3) - 2 * (radC2 J a b - 1))
      = (radS a b - 3) * (radS a b - 3) - 4 * ((radS a b - 3) * (radC2 J a b - 1))
        + 4 * ((radC2 J a b - 1) * (radC2 J a b - 1)) by ring,
    map_add, map_sub, ofNat_mul_apply, ofNat_mul_apply]
  linarith

/-- **Holomorphic variance:** `E[(c₁ − 2)²] = 32 n + 16 h + 16 b + 48 y + 16 z`. -/
theorem Circular.gE_radC1_sub_two_sq :
    E ((radC1 J a b - 2) * (radC1 J a b - 2))
      = 32 * gramN (gramT J a b) + 16 * gramH (gramT J a b) + 16 * gramB (gramT J a b)
        + 48 * gramY (gramT J a b) + 16 * gramZ (gramT J a b) := by
  have hb : Chaos3 b := hc.chaos3_right ha
  have hbb : E (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa]
  have hS2 := varS_eq hE ha hb haa hbb
  have hu2 := hc.specU2_eq hE ha haa
  have hu4 := hc.specU4_eq hE ha haa
  have hC22 := hc.gE_radC2_sub_one_sq hE ha haa
  have hSC2 := hc.gE_radS_mul_radC2 hE ha haa
  have hrel : radC1 J a b - 2 = (radS a b - 3) - (radC2 J a b - 1) := by
    have hadd := radC1_add_radC2 hc.isCplx a b
    linear_combination hadd
  rw [hrel, show ((radS a b - 3) - (radC2 J a b - 1))
      * ((radS a b - 3) - (radC2 J a b - 1))
      = (radS a b - 3) * (radS a b - 3) - 2 * ((radS a b - 3) * (radC2 J a b - 1))
        + (radC2 J a b - 1) * (radC2 J a b - 1) by ring,
    map_add, map_sub, ofNat_mul_apply]
  linarith

/-- **Complex fourth-moment identity** (Theorem 2(d) of ledger 6.3.20):
`E[U²] − 2 = v₂ + v₄ + 2 E[(c₂ − 1)²]`. -/
theorem Circular.fourth_moment_antistein :
    E (radU a b ^ 2) - 2
      = specV2 E a b + specV4 E a b + 2 * E ((radC2 J a b - 1) * (radC2 J a b - 1)) := by
  have h4th := hc.fourth_moment_contractions hE ha
  rw [haa] at h4th
  rw [hc.specV2_eq hE ha haa, hc.specV4_eq hE ha haa, hc.gE_radC2_sub_one_sq hE ha haa]
  linarith

end circular_variances

/-! ### Gaussian integral forms of the five variance budgets and `E[V ρ]` -/

section gaussian_budgets

variable {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ}
  (ha : Chaos3 a) (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2)
  (hc : Circular J a b)
include ha haa hc

omit ha hc in
private lemma haa_gaussE : gaussE d (a * a) = 1 / 2 := by
  rw [gaussE_apply, ← haa]
  exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by simp only [map_mul]; ring)

theorem Circular.gaussian_var_radC2 :
    ∫ x, (eval x (radC2 J a b) - 1) ^ 2 ∂(stdGaussian d)
      = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b) := by
  have h := hc.gE_radC2_sub_one_sq (gaussE_isGaussianExpectation d) ha (haa_gaussE haa)
  rw [← h, gaussE_apply]
  exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
    simp only [map_mul, map_sub, map_one]; ring)

theorem Circular.gaussian_var_radD :
    ∫ x, (eval x (radD J a b) - 1) ^ 2 ∂(stdGaussian d)
      = 16 * gramN (gramT J a b) + 20 * gramH (gramT J a b) + 16 * gramB (gramT J a b) := by
  have h := hc.gE_radD_sub_one_sq (gaussE_isGaussianExpectation d) ha (haa_gaussE haa)
  rw [← h, gaussE_apply]
  exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
    simp only [map_mul, map_sub, map_one]; ring)

theorem Circular.gaussian_var_radS :
    ∫ x, (eval x (radS a b) - 3) ^ 2 ∂(stdGaussian d)
      = 80 * gramN (gramT J a b) + 20 * gramH (gramT J a b) + 16 * gramB (gramT J a b)
        + 96 * gramY (gramT J a b) + 32 * gramZ (gramT J a b) := by
  have hE := gaussE_isGaussianExpectation d
  have haa' := haa_gaussE haa
  have hb := hc.chaos3_right ha
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa']
  have hS := varS_eq hE ha hb haa' hbb'
  have hu2 := hc.specU2_eq hE ha haa'
  have hu4 := hc.specU4_eq hE ha haa'
  have hval : gaussE d ((radS a b - 3) * (radS a b - 3))
      = 80 * gramN (gramT J a b) + 20 * gramH (gramT J a b) + 16 * gramB (gramT J a b)
        + 96 * gramY (gramT J a b) + 32 * gramZ (gramT J a b) := by linarith
  rw [← hval, gaussE_apply]
  exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
    simp only [map_mul, map_sub, map_ofNat]; ring)

theorem Circular.gaussian_var_radC1 :
    ∫ x, (eval x (radC1 J a b) - 2) ^ 2 ∂(stdGaussian d)
      = 32 * gramN (gramT J a b) + 16 * gramH (gramT J a b) + 16 * gramB (gramT J a b)
        + 48 * gramY (gramT J a b) + 16 * gramZ (gramT J a b) := by
  have h := hc.gE_radC1_sub_two_sq (gaussE_isGaussianExpectation d) ha (haa_gaussE haa)
  rw [← h, gaussE_apply]
  exact integral_congr_ae (Filter.Eventually.of_forall fun x ↦ by
    simp only [map_mul, map_sub, map_ofNat]; ring)

theorem Circular.gaussian_sq_radRho_le :
    ∫ x, radRho a b x ^ 2 ∂(stdGaussian d)
      ≤ 32 * gramB (gramT J a b) + 24 * gramY (gramT J a b) := by
  have hE := gaussE_isGaussianExpectation d
  have haa' := haa_gaussE haa
  have hb := hc.chaos3_right ha
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa']
  have hab' : gaussE d (a * b) = 0 := hc.gE_mul hE
  have hAB := AB_eq hE ha hb haa' hbb' hab'
  have hv2 := hc.specV2_eq hE ha haa'
  have hv4 := hc.specV4_eq hE ha haa'
  have hval : 1 / 4 * (gaussE d (radA a b * radA a b) + gaussE d (radB a b * radB a b))
      = 32 * gramB (gramT J a b) + 24 * gramY (gramT J a b) := by linarith
  rw [← hval, gaussE_apply, gaussE_apply, ← integral_add (integrable_eval _) (integrable_eval _),
    ← integral_const_mul]
  refine integral_mono (memLp_radRho a b).integrable_sq
    (((integrable_eval _).add (integrable_eval _)).const_mul _) fun x ↦ ?_
  have h1 := radR_sq_le a b x
  simp only [radRho, map_mul]
  linarith

theorem Circular.gaussian_mul_radU_radRho :
    ∫ x, eval x (radU a b) * radRho a b x ∂(stdGaussian d)
      = 32 * gramB (gramT J a b) + 48 * gramY (gramT J a b) := by
  have hE := gaussE_isGaussianExpectation d
  have haa' := haa_gaussE haa
  have hb := hc.chaos3_right ha
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa']
  have hab' : gaussE d (a * b) = 0 := hc.gE_mul hE
  have hN := N_eq hE ha hb haa' hbb' hab'
  have hv2 := hc.specV2_eq hE ha haa'
  have hv4 := hc.specV4_eq hE ha haa'
  have hval : (1 / 2 : ℝ) * gaussE d (radN a b)
      = 32 * gramB (gramT J a b) + 48 * gramY (gramT J a b) := by
    have : radN a b = radA a b * radP a b + radB a b * radQ a b := rfl
    rw [this]; linarith
  rw [← hval, gaussE_apply, ← integral_const_mul]
  refine integral_congr_ae (Filter.Eventually.of_forall fun x ↦ ?_)
  have hr := radRho_mul_radU a b x
  linarith

end gaussian_budgets

end variances

end

end Grothe.LowerAnalytic
