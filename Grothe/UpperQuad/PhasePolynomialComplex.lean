import Grothe.UpperChaos.PhiBound
import Grothe.UpperQuad.PolynomialGaussianGrowth
import Mathlib.Analysis.Analytic.Polynomial

/-!
# Complex polynomial–Gaussian bounds for the actual production phase

Fix the real imaginary coordinate `y` of the auxiliary variable. The actual phase is a degree-35
polynomial in the two real coordinates `(r, x)`, multiplied by `exp(-ε(r²+x²))`. The fixed factor
`exp(-ε y²)` remains in the polynomial coefficient. Its complex growth follows from the existing
real phase bound and the finite Hermite Mehler estimate, without a new numerical certificate.

Agent-ID: codex-1a87. Refs #339, #334.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.PhasePolynomialComplex

open Complex MvPolynomial Grothe.UpperChaos
open scoped ComplexConjugate

noncomputable section

local notation "ε" => (Grothe.Upper.phaseEpsQ : ℝ)

/-- The first real coordinate, in the variables `(z, conjugate z)`. -/
def rCoord : CPoly := C (1 / 2 : ℂ) * (X 0 + X 1)

/-- The second real coordinate, in the variables `(z, conjugate z)`. -/
def xCoord : CPoly := C (-I / 2) * (X 0 - X 1)

lemma eval_rCoord (r x : ℂ) : eval ![r + I * x, r - I * x] rCoord = r := by
  simp [rCoord]
  ring

lemma eval_xCoord (r x : ℂ) : eval ![r + I * x, r - I * x] xCoord = x := by
  simp only [xCoord, map_mul, eval_C, map_sub, eval_X,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  calc
    -I / 2 * (r + I * x - (r - I * x)) = -(I ^ 2) * x := by ring
    _ = x := by rw [I_sq]; ring

lemma ev_rCoord (z : ℂ) : ev z rCoord = (z.re : ℂ) := by
  simp only [ev, rCoord, map_mul, eval_C, map_add, eval_X, zv,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  rw [Complex.add_conj]
  push_cast
  ring

lemma ev_xCoord (z : ℂ) : ev z xCoord = (z.im : ℂ) := by
  simp only [ev, xCoord, map_mul, eval_C, map_sub, eval_X, zv,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  rw [Complex.sub_conj]
  push_cast
  calc
    -I / 2 * (2 * (z.im : ℂ) * I) = -(I ^ 2) * (z.im : ℂ) := by ring
    _ = (z.im : ℂ) := by rw [I_sq]; ring

private lemma degree_mul_le {P Q : CPoly} {m n : ℕ}
    (hP : P.totalDegree ≤ m) (hQ : Q.totalDegree ≤ n) :
    (P * Q).totalDegree ≤ m + n :=
  (totalDegree_mul P Q).trans (Nat.add_le_add hP hQ)

private lemma degree_pow_le {P : CPoly} {m : ℕ} (hP : P.totalDegree ≤ m) (n : ℕ) :
    (P ^ n).totalDegree ≤ n * m :=
  (totalDegree_pow P n).trans (Nat.mul_le_mul_left n hP)

lemma degree_rCoord_le : rCoord.totalDegree ≤ 1 := by
  have hsum : ((X 0 : CPoly) + X 1).totalDegree ≤ 1 :=
    (totalDegree_add _ _).trans (by simp)
  simpa only [rCoord, totalDegree_C, Nat.zero_add] using
    degree_mul_le (m := 0) (by simp : (C (1 / 2 : ℂ) : CPoly).totalDegree ≤ 0) hsum

lemma degree_xCoord_le : xCoord.totalDegree ≤ 1 := by
  have hsub : ((X 0 : CPoly) - X 1).totalDegree ≤ 1 :=
    (totalDegree_sub _ _).trans (by simp)
  simpa only [xCoord, totalDegree_C, Nat.zero_add] using
    degree_mul_le (m := 0) (by simp : (C (-I / 2) : CPoly).totalDegree ≤ 0) hsub

/-- One source monomial after fixing the real auxiliary imaginary coordinate. -/
def phaseTerm (y : ℝ) (t : (ℕ × ℕ × ℕ) × ℚ) : CPoly :=
  C (t.2 : ℂ) * rCoord ^ (2 * t.1.1) *
    (xCoord ^ 2 + C ((y : ℂ) ^ 2)) ^ t.1.2.1 * (rCoord * xCoord) ^ t.1.2.2

/-- The original source list is retained verbatim. -/
def phaseSum (y : ℝ) : CPoly := (phaseTerms.map (phaseTerm y)).sum

/-- The fixed-y phase polynomial, including its constant Gaussian factor. -/
def phasePolynomial (y : ℝ) : CPoly :=
  C ((Real.exp (-ε * y ^ 2) : ℂ) * (y : ℂ)) * rCoord * phaseSum y

/-- The already checked phase data have invariant degree at most seventeen. -/
lemma phaseTerms_degree (t : (ℕ × ℕ × ℕ) × ℚ) (ht : t ∈ phaseTerms) :
    t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17 := by
  have hts : GrotheKernel.termsOK phaseTerms = true := phi_cubes_ok.1
  have h := List.all_eq_true.mp hts t ht
  have hd : t.1.1 + t.1.2.1 + t.1.2.2 ≤ GrotheKernel.DEG ∧
      (t.2 * (GrotheKernel.commonDen phaseTerms : ℚ)).den = 1 := by
    simpa only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] using h
  exact hd.1

lemma degree_phaseTerm_le (y : ℝ) (t : (ℕ × ℕ × ℕ) × ℚ)
    (ht : t.1.1 + t.1.2.1 + t.1.2.2 ≤ 17) : (phaseTerm y t).totalDegree ≤ 34 := by
  have hR : (rCoord ^ (2 * t.1.1)).totalDegree ≤ 2 * t.1.1 := by
    simpa only [Nat.mul_one] using degree_pow_le degree_rCoord_le (2 * t.1.1)
  have hV : (xCoord ^ 2 + C ((y : ℂ) ^ 2)).totalDegree ≤ 2 := by
    refine (totalDegree_add _ _).trans (max_le ?_ ?_)
    · simpa only [Nat.mul_one] using degree_pow_le degree_xCoord_le 2
    · exact (totalDegree_C ((y : ℂ) ^ 2)).le.trans (by omega)
  have hW : (rCoord * xCoord).totalDegree ≤ 2 :=
    degree_mul_le degree_rCoord_le degree_xCoord_le
  have h1 : (C (t.2 : ℂ) * rCoord ^ (2 * t.1.1)).totalDegree ≤ 2 * t.1.1 := by
    simpa only [Nat.zero_add] using
      degree_mul_le (by simp : (C (t.2 : ℂ) : CPoly).totalDegree ≤ 0) hR
  exact (degree_mul_le (degree_mul_le h1 (degree_pow_le hV t.1.2.1))
    (degree_pow_le hW t.1.2.2)).trans (by omega)

private lemma degree_list_sum_le (l : List CPoly) (N : ℕ)
    (hl : ∀ P ∈ l, P.totalDegree ≤ N) : l.sum.totalDegree ≤ N := by
  induction l with
  | nil => simp
  | cons P l ih =>
    simpa only [List.sum_cons] using (totalDegree_add P l.sum).trans
      (max_le (hl P List.mem_cons_self)
        (ih fun Q hQ ↦ hl Q (List.mem_cons_of_mem _ hQ)))

lemma degree_phaseSum_le (y : ℝ) : (phaseSum y).totalDegree ≤ 34 := by
  refine degree_list_sum_le _ _ fun P hP => ?_
  obtain ⟨t, ht, rfl⟩ := List.mem_map.mp hP
  exact degree_phaseTerm_le y t (phaseTerms_degree t ht)

/-- Fixing y reduces the actual phase polynomial's total degree from 36 to 35. -/
theorem degree_phasePolynomial_le (y : ℝ) : (phasePolynomial y).totalDegree ≤ 35 := by
  have hfirst :
      (C ((Real.exp (-ε * y ^ 2) : ℂ) * (y : ℂ)) * rCoord).totalDegree ≤ 1 := by
    simpa only [Nat.zero_add] using
      degree_mul_le (totalDegree_C ((Real.exp (-ε * y ^ 2) : ℂ) * (y : ℂ))).le
        degree_rCoord_le
  exact degree_mul_le hfirst (degree_phaseSum_le y)

lemma ev_phaseTerm (y : ℝ) (t : (ℕ × ℕ × ℕ) × ℚ) (z : ℂ) :
    ev z (phaseTerm y t) =
      (((t.2 : ℝ) * (z.re ^ 2) ^ t.1.1 * (z.im ^ 2 + y ^ 2) ^ t.1.2.1 *
        (z.re * z.im) ^ t.1.2.2 : ℝ) : ℂ) := by
  simp only [phaseTerm, ev, map_mul, map_pow, map_add, eval_C]
  change (t.2 : ℂ) * ev z rCoord ^ (2 * t.1.1) *
      (ev z xCoord ^ 2 + (y : ℂ) ^ 2) ^ t.1.2.1 *
      (ev z rCoord * ev z xCoord) ^ t.1.2.2 = _
  rw [ev_rCoord, ev_xCoord]
  push_cast
  rw [pow_mul]

lemma ev_phaseSum (y : ℝ) (z : ℂ) :
    ev z (phaseSum y) = (Sphase (z.re ^ 2) (z.im ^ 2 + y ^ 2) (z.re * z.im) : ℂ) := by
  have hcast (l : List ℝ) : ((l.sum : ℝ) : ℂ) = (l.map (fun a : ℝ ↦ (a : ℂ))).sum := by
    induction l with
    | nil => simp
    | cons a l ih => simp only [List.sum_cons, List.map_cons, Complex.ofReal_add, ih]
  unfold phaseSum Sphase
  simp only [ev, map_list_sum, List.map_map, Function.comp_def]
  rw [hcast]
  simp only [List.map_map, Function.comp_def]
  exact congrArg List.sum (List.map_congr_left fun t _ => ev_phaseTerm y t z)

lemma ev_phasePolynomial (y : ℝ) (z : ℂ) :
    ev z (phasePolynomial y) =
      ((Real.exp (-ε * y ^ 2) * y * z.re *
        Sphase (z.re ^ 2) (z.im ^ 2 + y ^ 2) (z.re * z.im) : ℝ) : ℂ) := by
  simp only [phasePolynomial, ev, map_mul, eval_C]
  change _ * ev z rCoord * ev z (phaseSum y) = _
  rw [ev_rCoord, ev_phaseSum]
  push_cast
  rfl

private lemma normSq_real_pair (r x : ℝ) :
    normSq ((r : ℂ) + I * (x : ℂ)) = r ^ 2 + x ^ 2 := by
  simp only [Complex.normSq_apply, Complex.add_re, Complex.mul_re, Complex.add_im,
    Complex.mul_im, Complex.I_re, Complex.I_im, Complex.ofReal_re, Complex.ofReal_im,
    zero_mul, one_mul, mul_zero, add_zero, zero_add, sub_zero, pow_two]

lemma phiT_real_slice (r x y : ℝ) :
    phiT ((r : ℂ), (x : ℂ) + I * (y : ℂ)) =
      r * y * Real.exp (-ε * (r ^ 2 + x ^ 2 + y ^ 2)) *
        Sphase (r ^ 2) (x ^ 2 + y ^ 2) (r * x) := by
  simp only [phiT, ← Complex.normSq_eq_norm_sq, Complex.normSq_ofReal, normSq_real_pair]
  simp [pow_two, add_assoc]

/-- The polynomial with its remaining Gaussian is exactly the actual production phase. -/
theorem ev_phasePolynomial_damped (y : ℝ) (z : ℂ) :
    ev z (phasePolynomial y) * (Real.exp (-ε * normSq z) : ℂ) =
      (phiT ((z.re : ℂ), (z.im : ℂ) + I * (y : ℂ)) : ℂ) := by
  have hn : normSq z = z.re ^ 2 + z.im ^ 2 := by
    simpa only [pow_two] using Complex.normSq_apply z
  rw [ev_phasePolynomial, phiT_real_slice, hn]
  have he : Real.exp (-ε * y ^ 2) * Real.exp (-ε * (z.re ^ 2 + z.im ^ 2)) =
      Real.exp (-ε * (z.re ^ 2 + z.im ^ 2 + y ^ 2)) := by
    rw [← Real.exp_add]
    congr 1
    ring
  push_cast
  have hc := congrArg (fun t : ℝ ↦ (t : ℂ)) he
  push_cast at hc
  linear_combination (y : ℂ) * (z.re : ℂ) *
    (Sphase (z.re ^ 2) (z.im ^ 2 + y ^ 2) (z.re * z.im) : ℂ) * hc

/-- The existing global real phase bound supplies the polynomial's Gaussian growth estimate. -/
theorem norm_ev_phasePolynomial_le (y : ℝ) (z : ℂ) :
    ‖ev z (phasePolynomial y)‖ ≤ Real.exp (ε * normSq z) := by
  have hφ := (phi_abs_lt_one ((z.re : ℂ), (z.im : ℂ) + I * (y : ℂ))).le
  have heq := congrArg norm (ev_phasePolynomial_damped y z)
  simp only [norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (Real.exp_pos _)] at heq
  have hprod : ‖ev z (phasePolynomial y)‖ * Real.exp (-ε * normSq z) ≤ 1 :=
    heq.trans_le hφ
  calc
    ‖ev z (phasePolynomial y)‖ =
        (‖ev z (phasePolynomial y)‖ * Real.exp (-ε * normSq z)) *
          Real.exp (ε * normSq z) := by
      rw [mul_assoc, ← Real.exp_add]
      simp
    _ ≤ 1 * Real.exp (ε * normSq z) :=
      mul_le_mul_of_nonneg_right hprod (Real.exp_pos _).le
    _ = Real.exp (ε * normSq z) := one_mul _

/-- The entire continuation of the fixed-y production phase in the coordinates `(r,x)`. -/
def phaseComplex (y : ℝ) (r x : ℂ) : ℂ :=
  eval ![r + I * x, r - I * x] (phasePolynomial y) *
    Complex.exp (-((ε : ℂ) * (r ^ 2 + x ^ 2)))

/-- At an arbitrary pair, the polynomial uses the actual source coefficients and invariants. -/
theorem eval_phasePolynomial_pair (y : ℝ) (r x : ℂ) :
    eval ![r + I * x, r - I * x] (phasePolynomial y) =
      (Real.exp (-ε * y ^ 2) : ℂ) * (y : ℂ) * r *
        (phaseTerms.map fun t ↦ (t.2 : ℂ) * r ^ (2 * t.1.1) *
          (x ^ 2 + (y : ℂ) ^ 2) ^ t.1.2.1 * (r * x) ^ t.1.2.2).sum := by
  simp only [phasePolynomial, phaseSum, phaseTerm, map_mul, map_pow, map_add, eval_C,
    map_list_sum, List.map_map, Function.comp_def, eval_rCoord, eval_xCoord]

/-- The continuation agrees with the actual production phase at all real coordinates. -/
theorem phaseComplex_real (y r x : ℝ) :
    phaseComplex y (r : ℂ) (x : ℂ) =
      (phiT ((r : ℂ), (x : ℂ) + I * (y : ℂ)) : ℂ) := by
  have h := ev_phasePolynomial_damped y ((r : ℂ) + I * (x : ℂ))
  have hr : ((r : ℂ) + I * (x : ℂ)).re = r := by simp
  have hx : ((r : ℂ) + I * (x : ℂ)).im = x := by simp
  rw [hr, hx, normSq_real_pair] at h
  have hv : ![(r : ℂ) + I * (x : ℂ), (r : ℂ) - I * (x : ℂ)] =
      zv ((r : ℂ) + I * (x : ℂ)) := by
    funext i
    fin_cases i <;> simp [zv, sub_eq_add_neg]
  have he : Complex.exp (-((ε : ℂ) * ((r : ℂ) ^ 2 + (x : ℂ) ^ 2))) =
      (Real.exp (-ε * (r ^ 2 + x ^ 2)) : ℂ) := by
    rw [Complex.ofReal_exp]
    congr 1
    push_cast
    ring
  unfold phaseComplex
  rw [he, hv]
  exact h

/-- The continuation is jointly complex analytic at every pair of coordinates. -/
theorem analyticAt_phaseComplex (y : ℝ) (z : ℂ × ℂ) :
    AnalyticAt ℂ (fun w : ℂ × ℂ ↦ phaseComplex y w.1 w.2) z := by
  have hf : AnalyticAt ℂ (fun w : ℂ × ℂ ↦ w.1) z := analyticAt_fst
  have hs : AnalyticAt ℂ (fun w : ℂ × ℂ ↦ w.2) z := analyticAt_snd
  have hv (i : Fin 2) : AnalyticAt ℂ
      (fun w : ℂ × ℂ ↦ ![w.1 + I * w.2, w.1 - I * w.2] i) z := by
    fin_cases i
    · change AnalyticAt ℂ (fun w : ℂ × ℂ ↦ w.1 + I * w.2) z
      fun_prop
    · change AnalyticAt ℂ (fun w : ℂ × ℂ ↦ w.1 - I * w.2) z
      fun_prop
  have hp := AnalyticAt.aeval_mvPolynomial hv (phasePolynomial y)
  exact hp.mul (by fun_prop)

/-- The jointly analytic continuation is complex differentiable everywhere. -/
theorem differentiable_phaseComplex (y : ℝ) :
    Differentiable ℂ (fun w : ℂ × ℂ ↦ phaseComplex y w.1 w.2) :=
  fun z ↦ (analyticAt_phaseComplex y z).differentiableAt

/-- The production phase satisfies the two-variable polynomial–Gaussian bound. -/
theorem norm_phaseComplex_sq_le (y : ℝ) {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1)
    (r x : ℂ) :
    ‖phaseComplex y r x‖ ^ 2 ≤ (τ ^ 35)⁻¹ * ((1 - τ) ^ 2)⁻¹ *
      Real.exp (4 * ε / (1 - τ) * (r.im ^ 2 + x.im ^ 2)) :=
  PolynomialGaussianGrowth.norm_damped_eval_sq_le (phasePolynomial y)
    (degree_phasePolynomial_le y) (by norm_num [Grothe.Upper.phaseEpsQ])
    hτ0 hτ1 (norm_ev_phasePolynomial_le y) r x

/-- A positive integer power uses degree `35*j` and damping `j*ε` directly. -/
theorem norm_phaseComplex_pow_sq_le (j : ℕ) (hj : 0 < j) (y : ℝ)
    {τ : ℝ} (hτ0 : 0 < τ) (hτ1 : τ < 1) (r x : ℂ) :
    ‖phaseComplex y r x ^ j‖ ^ 2 ≤ (τ ^ (35 * j))⁻¹ * ((1 - τ) ^ 2)⁻¹ *
      Real.exp (4 * ((j : ℝ) * ε) / (1 - τ) * (r.im ^ 2 + x.im ^ 2)) := by
  have hdeg : ((phasePolynomial y) ^ j).totalDegree ≤ 35 * j := by
    simpa only [Nat.mul_comm] using degree_pow_le (degree_phasePolynomial_le y) j
  have hε : 0 < (j : ℝ) * ε := mul_pos (Nat.cast_pos.mpr hj)
    (by norm_num [Grothe.Upper.phaseEpsQ])
  have hgrowth (z : ℂ) : ‖ev z ((phasePolynomial y) ^ j)‖ ≤
      Real.exp (((j : ℝ) * ε) * normSq z) := by
    calc
      ‖ev z ((phasePolynomial y) ^ j)‖ = ‖ev z (phasePolynomial y)‖ ^ j := by simp [ev]
      _ ≤ (Real.exp (ε * normSq z)) ^ j :=
        pow_le_pow_left₀ (norm_nonneg _) (norm_ev_phasePolynomial_le y z) j
      _ = Real.exp (((j : ℝ) * ε) * normSq z) := by
        rw [← Real.exp_nat_mul]
        congr 1
        ring
  have he : Complex.exp (-((ε : ℂ) * (r ^ 2 + x ^ 2))) ^ j =
      Complex.exp (-((((j : ℝ) * ε : ℝ) : ℂ) * (r ^ 2 + x ^ 2))) := by
    rw [← Complex.exp_nat_mul]
    congr 1
    push_cast
    ring
  have h := PolynomialGaussianGrowth.norm_damped_eval_sq_le ((phasePolynomial y) ^ j)
    hdeg hε hτ0 hτ1 hgrowth r x
  simpa only [phaseComplex, mul_pow, map_pow, he] using h

end

end Grothe.UpperQuad.PhasePolynomialComplex
