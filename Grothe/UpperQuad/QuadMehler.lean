import Grothe.UpperChaos.ComplexMoments
import Grothe.UpperChaos.DampedCoherentKernel
import Grothe.UpperChaos.HermiteFallingFactorial

/-!
# The complex Mehler bound for the formal complex Hermite polynomials (part (Q) of `hQuad`)

`Hf p q a b = Σ_k (−1)^k C(p,k) q^{\underline k} a^{p−k} b^{q−k}` is master's complex Hermite
polynomial `H p q` with the two arguments `z, z̄` made independent (`ev_H_eq_Hf`).  For
`0 < τ < 1` and all complex `ζ₁, ζ₂`,
```
Σ_{p,q} τ^{p+q} |Hf p q ζ₁ ζ₂|² / (p! q!) ≤ (1 − τ²)⁻¹ exp(Re E(ζ₁, ζ₂)),
E = τ ζ₁ ζ̄₁ + τ ζ₂ ζ̄₂ − τ² ζ₁ ζ₂ − τ² (ζ̄₁ − τ ζ₂)(ζ̄₂ − τ ζ₁)/(1 − τ²)
```
over every finite set of indices (`sum_mehler_le`); on the diagonal `ζ₁ = ζ₂ = x + iη` the exponent
is `2τx²/(1+τ) + 2τη²/(1−τ)`.  Proof: `Hf p q a b = E[(a + iξ)^p (b + iξ̄)^q]` for a standard
complex
Gaussian `ξ` (`Hf_eq_integral`), so the full weighted sum is `E_{ξ,ξ'} exp(u + v)` with
`u = τ(ζ₁+iξ)conj(ζ₁+iξ')`, `v = τ(ζ₂+iξ̄)conj(ζ₂+iξ̄')`, two complex Gaussian integrals
(`integral_gaussC_cexp_linear`).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.Mehler

open MeasureTheory Complex Grothe.LowerAnalytic Grothe.UpperChaos Grothe.UpperChaos.WeightedHSMass
open scoped ComplexConjugate

noncomputable section

/-- The formal complex Hermite polynomial in two independent arguments. -/
def Hf (p q : ℕ) (a b : ℂ) : ℂ :=
  ∑ k ∈ Finset.range (p + 1), ((-1 : ℂ) ^ k * (p.choose k : ℂ) * (q.descFactorial k : ℂ)) *
    a ^ (p - k) * b ^ (q - k)

lemma ev_H_eq_Hf (z : ℂ) (p q : ℕ) : ev z (H p q) = Hf p q z (conj z) := by
  rw [HermiteFallingFactorial.ev_H_eq_fallingFactorial]; rfl

/-- **The Gaussian representation** `Hf p q a b = E[(a + iξ)^p (b + iξ̄)^q]`. -/
theorem Hf_eq_integral (p q : ℕ) (a b : ℂ) :
    Hf p q a b = ∫ ξ, (a + I * ξ) ^ p * (b + I * conj ξ) ^ q ∂gaussC := by
  have hexp : ∀ ξ : ℂ, (a + I * ξ) ^ p * (b + I * conj ξ) ^ q =
      ∑ i ∈ Finset.range (p + 1), ∑ j ∈ Finset.range (q + 1),
        ((p.choose i : ℂ) * (q.choose j : ℂ) * a ^ (p - i) * b ^ (q - j) * I ^ (i + j)) *
          (ξ ^ i * conj ξ ^ j) := by
    intro ξ
    rw [add_comm a, add_comm b, add_pow, add_pow, Finset.sum_mul_sum]
    apply Finset.sum_congr rfl; intro i _
    apply Finset.sum_congr rfl; intro j _
    rw [mul_pow, mul_pow, pow_add]
    ring
  simp_rw [hexp]
  rw [integral_finsetSum _ (fun i _ => integrable_finsetSum _ (fun j _ =>
    (integrable_monomial i j).const_mul _))]
  simp_rw [integral_finsetSum _ (fun j _ => (integrable_monomial _ j).const_mul _),
    integral_const_mul, integral_moment]
  unfold Hf
  apply Finset.sum_congr rfl
  intro i hi
  rw [Finset.sum_eq_single i]
  · simp only [ite_true]
    by_cases hiq : i ≤ q
    · rw [Nat.descFactorial_eq_factorial_mul_choose, ← two_mul, pow_mul, I_sq]
      push_cast
      ring
    · push Not at hiq
      rw [Nat.choose_eq_zero_of_lt hiq, Nat.descFactorial_eq_zero_iff_lt.mpr hiq]
      simp
  · intro j _ hji
    simp [Ne.symm hji]
  · intro hi'
    have : q < i := by simpa using hi'
    rw [Nat.choose_eq_zero_of_lt this]
    simp

/-! ### The weighted sum as one Gaussian integral -/

/-- The first coupling `u = τ (a + iξ) conj(a + iξ')`. -/
def uC (τ : ℝ) (a : ℂ) (ω : ℂ × ℂ) : ℂ := (τ : ℂ) * ((a + I * ω.1) * conj (a + I * ω.2))

/-- The second coupling `v = τ (b + iξ̄) conj(b + iξ̄')`. -/
def vC (τ : ℝ) (b : ℂ) (ω : ℂ × ℂ) : ℂ :=
  (τ : ℂ) * ((b + I * conj ω.1) * conj (b + I * conj ω.2))

lemma continuous_uC (τ : ℝ) (a : ℂ) : Continuous (uC τ a) := by unfold uC; fun_prop
lemma continuous_vC (τ : ℝ) (b : ℂ) : Continuous (vC τ b) := by unfold vC; fun_prop

/-- `|Hf|²` as an integral over two independent Gaussians. -/
lemma normSq_Hf_eq_integral (p q : ℕ) (a b : ℂ) :
    ((‖Hf p q a b‖ ^ 2 : ℝ) : ℂ) = ∫ ω, ((a + I * ω.1) ^ p * (b + I * conj ω.1) ^ q) *
      conj ((a + I * ω.2) ^ p * (b + I * conj ω.2) ^ q) ∂(gaussC.prod gaussC) := by
  rw [integral_prod_mul (f := fun ξ => (a + I * ξ) ^ p * (b + I * conj ξ) ^ q)
    (g := fun ξ => conj ((a + I * ξ) ^ p * (b + I * conj ξ) ^ q)), integral_conj,
    ← Hf_eq_integral, Complex.mul_conj, Complex.normSq_eq_norm_sq]

lemma term_eq (τ : ℝ) (a b : ℂ) (p q : ℕ) (ω : ℂ × ℂ) :
    uC τ a ω ^ p / (p.factorial : ℂ) * (vC τ b ω ^ q / (q.factorial : ℂ)) =
      ((τ ^ (p + q) / ((p.factorial : ℝ) * q.factorial) : ℝ) : ℂ) *
        (((a + I * ω.1) ^ p * (b + I * conj ω.1) ^ q) *
          conj ((a + I * ω.2) ^ p * (b + I * conj ω.2) ^ q)) := by
  unfold uC vC
  rw [map_mul, map_pow, map_pow]
  simp only [mul_pow]
  push_cast
  ring

/-- `|u| + |v| ≤ κ (A + |ξ|)² + κ (A + |ξ'|)²`-type domination, in product form. -/
lemma exp_norm_uv_le (τ : ℝ) (hτ0 : 0 ≤ τ) (a b : ℂ) (ω : ℂ × ℂ) :
    Real.exp ‖uC τ a ω‖ * Real.exp ‖vC τ b ω‖ ≤
      Real.exp (τ * (‖a‖ + ‖b‖ + ‖ω.1‖) ^ 2) * Real.exp (τ * (‖a‖ + ‖b‖ + ‖ω.2‖) ^ 2) := by
  rw [← Real.exp_add, ← Real.exp_add]
  apply Real.exp_le_exp.mpr
  have hu : ‖uC τ a ω‖ ≤ τ * ((‖a‖ + ‖ω.1‖) * (‖a‖ + ‖ω.2‖)) := by
    unfold uC
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hτ0, norm_mul,
      Complex.norm_conj]
    apply mul_le_mul_of_nonneg_left _ hτ0
    apply mul_le_mul _ _ (norm_nonneg _) (by positivity) <;>
      exact (norm_add_le _ _).trans (by rw [norm_mul, Complex.norm_I, one_mul])
  have hv : ‖vC τ b ω‖ ≤ τ * ((‖b‖ + ‖ω.1‖) * (‖b‖ + ‖ω.2‖)) := by
    unfold vC
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hτ0, norm_mul,
      Complex.norm_conj]
    apply mul_le_mul_of_nonneg_left _ hτ0
    apply mul_le_mul _ _ (norm_nonneg _) (by positivity) <;>
      exact (norm_add_le _ _).trans (by rw [norm_mul, Complex.norm_I, one_mul, Complex.norm_conj])
  have ha := norm_nonneg a; have hb := norm_nonneg b
  have h1 := norm_nonneg ω.1; have h2 := norm_nonneg ω.2
  nlinarith [mul_nonneg hτ0 (sq_nonneg (‖ω.1‖ - ‖ω.2‖)), mul_nonneg hτ0 (mul_nonneg ha hb),
    mul_nonneg hτ0 (mul_nonneg ha h1), mul_nonneg hτ0 (mul_nonneg hb h2),
    mul_nonneg hτ0 (mul_nonneg ha h2), mul_nonneg hτ0 (mul_nonneg hb h1),
    mul_nonneg hτ0 (sq_nonneg (‖a‖ - ‖b‖))]

/-- `exp(τ (A + |ξ|)²)` is Gaussian-integrable for `τ < 1`. -/
lemma integrable_exp_sq (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1) (A : ℝ) :
    Integrable (fun ξ : ℂ => Real.exp (τ * (A + ‖ξ‖) ^ 2)) gaussC := by
  set lam : ℝ := (1 + τ) / 2 with hlam
  have hrate : 0 < 1 - lam := by rw [hlam]; linarith
  have hI := integrable_gaussC_cexp_linear hrate 0 0
  have hI' : Integrable (fun ξ : ℂ => Real.exp (lam * normSq ξ)) gaussC := by
    refine hI.norm.congr (Filter.Eventually.of_forall fun ξ => ?_)
    simp only [zero_mul, add_zero, Complex.norm_exp]
    congr 1
    simp
  -- `τ (A + r)² ≤ lam r² + C`
  set δ : ℝ := (1 - τ) / (2 * τ + 1) with hδ
  set C : ℝ := τ * A ^ 2 * (1 + 1 / δ) with hC
  have hδ0 : 0 < δ := by rw [hδ]; apply div_pos <;> linarith
  refine (hI'.const_mul (Real.exp C)).mono' (by fun_prop) (Filter.Eventually.of_forall fun ξ => ?_)
  rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _), ← Real.exp_add]
  apply Real.exp_le_exp.mpr
  rw [Complex.normSq_eq_norm_sq]
  have hr := norm_nonneg ξ
  have key : (A + ‖ξ‖) ^ 2 ≤ (1 + δ) * ‖ξ‖ ^ 2 + (1 + 1 / δ) * A ^ 2 := by
    have : 2 * A * ‖ξ‖ ≤ δ * ‖ξ‖ ^ 2 + A ^ 2 / δ := by
      have h := sq_nonneg (δ * ‖ξ‖ - A)
      have : 0 ≤ (δ * ‖ξ‖ - A) ^ 2 / δ := div_nonneg h hδ0.le
      have e : (δ * ‖ξ‖ - A) ^ 2 / δ = δ * ‖ξ‖ ^ 2 - 2 * A * ‖ξ‖ + A ^ 2 / δ := by
        field_simp; ring
      linarith
    have e1 : (1 + 1 / δ) * A ^ 2 = A ^ 2 + A ^ 2 / δ := by field_simp
    have e2 : (A + ‖ξ‖) ^ 2 = A ^ 2 + 2 * A * ‖ξ‖ + ‖ξ‖ ^ 2 := by ring
    rw [e1, e2]
    nlinarith
  have hτδ : τ * (1 + δ) ≤ lam := by
    rw [hlam, hδ]
    have h2 : 0 < 2 * τ + 1 := by linarith
    rw [show τ * (1 + (1 - τ) / (2 * τ + 1)) = τ * (τ + 2) / (2 * τ + 1) by field_simp; ring,
      div_le_div_iff₀ h2 (by norm_num : (0:ℝ) < 2)]
    nlinarith
  calc τ * (A + ‖ξ‖) ^ 2 ≤ τ * ((1 + δ) * ‖ξ‖ ^ 2 + (1 + 1 / δ) * A ^ 2) :=
        mul_le_mul_of_nonneg_left key hτ0
    _ = τ * (1 + δ) * ‖ξ‖ ^ 2 + C := by rw [hC]; ring
    _ ≤ lam * ‖ξ‖ ^ 2 + C := by nlinarith [sq_nonneg ‖ξ‖]
    _ = C + lam * ‖ξ‖ ^ 2 := by ring

/-- The `(p, q)` term of the double exponential series. -/
def mehTerm (τ : ℝ) (a b : ℂ) (pq : ℕ × ℕ) (ω : ℂ × ℂ) : ℂ :=
  uC τ a ω ^ pq.1 / (pq.1.factorial : ℂ) * (vC τ b ω ^ pq.2 / (pq.2.factorial : ℂ))

/-- Its norm majorant. -/
def mehBnd (τ : ℝ) (a b : ℂ) (pq : ℕ × ℕ) (ω : ℂ × ℂ) : ℝ :=
  ‖uC τ a ω‖ ^ pq.1 / (pq.1.factorial : ℝ) * (‖vC τ b ω‖ ^ pq.2 / (pq.2.factorial : ℝ))

/-- The domination of `exp(u) exp(v)`. -/
lemma integrable_exp_uv (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1) (a b : ℂ) :
    Integrable (fun ω => cexp (uC τ a ω) * cexp (vC τ b ω)) (gaussC.prod gaussC) := by
  have h1 := integrable_exp_sq τ hτ0 hτ1 (‖a‖ + ‖b‖)
  refine (h1.mul_prod h1).mono' ?_ (Filter.Eventually.of_forall fun ω => ?_)
  · exact ((continuous_uC τ a).cexp.mul (continuous_vC τ b).cexp).aestronglyMeasurable
  · rw [norm_mul, Complex.norm_exp, Complex.norm_exp]
    refine le_trans ?_ (exp_norm_uv_le τ hτ0 a b ω)
    exact mul_le_mul (Real.exp_le_exp.mpr (Complex.re_le_norm _))
      (Real.exp_le_exp.mpr (Complex.re_le_norm _)) (by positivity) (by positivity)

/-- The exponent of the complex Mehler kernel. -/
def mehlerExp (τ : ℝ) (a b : ℂ) : ℂ :=
  (τ : ℂ) * (a * conj a) + (τ : ℂ) * (b * conj b) - (τ : ℂ) ^ 2 * (a * b) -
    (τ : ℂ) ^ 2 * ((conj a - τ * b) * (conj b - τ * a)) / (1 - (τ : ℂ) ^ 2)

/-- **The Gaussian integral of `exp(u + v)`** is the complex Mehler kernel. -/
theorem integral_exp_uv (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1) (a b : ℂ) :
    ∫ ω, cexp (uC τ a ω) * cexp (vC τ b ω) ∂(gaussC.prod gaussC) =
      ((1 - τ ^ 2 : ℝ) : ℂ)⁻¹ * cexp (mehlerExp τ a b) := by
  have hint := integrable_exp_uv τ hτ0 hτ1 a b
  rw [integral_prod _ hint]
  -- the inner integral over `ξ'`
  have hinner : ∀ ξ : ℂ, ∫ ξ', cexp (uC τ a (ξ, ξ')) * cexp (vC τ b (ξ, ξ')) ∂gaussC =
      cexp ((τ * (a * conj a) + τ * (b * conj b) - τ ^ 2 * (a * b) : ℂ) +
        (I * τ * (conj a - τ * b)) * ξ + (I * τ * (conj b - τ * a)) * conj ξ +
        (τ : ℂ) ^ 2 * (normSq ξ : ℂ)) := by
    intro ξ
    have hpt : ∀ ξ' : ℂ, cexp (uC τ a (ξ, ξ')) * cexp (vC τ b (ξ, ξ')) =
        cexp ((τ : ℂ) * (a + I * ξ) * conj a + (τ : ℂ) * (b + I * conj ξ) * conj b) *
          cexp (-(((1 : ℝ) - 1 : ℝ) : ℂ) * (normSq ξ' : ℂ) + (-I * τ * (b + I * conj ξ)) * ξ' +
            (-I * τ * (a + I * ξ)) * conj ξ') := by
      intro ξ'
      rw [← Complex.exp_add, ← Complex.exp_add]
      congr 1
      simp only [uC, vC, map_add, map_mul, Complex.conj_I, Complex.conj_conj]
      push_cast
      ring
    simp_rw [hpt]
    rw [integral_const_mul, integral_gaussC_cexp_linear (rate := 1) one_pos]
    simp only [Complex.ofReal_one, inv_one, one_mul, div_one]
    rw [← Complex.exp_add]
    congr 1
    rw [Complex.normSq_eq_conj_mul_self]
    ring_nf
    simp only [I_sq, show I ^ 3 = -I by rw [pow_succ, I_sq]; ring,
      show I ^ 4 = 1 by rw [show (4 : ℕ) = 2 * 2 by rfl, pow_mul, I_sq]; ring]
    ring
  simp_rw [hinner]
  have hrate : (0 : ℝ) < 1 - τ ^ 2 := by nlinarith
  have hpt2 : ∀ ξ : ℂ, cexp ((τ * (a * conj a) + τ * (b * conj b) - τ ^ 2 * (a * b) : ℂ) +
        (I * τ * (conj a - τ * b)) * ξ + (I * τ * (conj b - τ * a)) * conj ξ +
        (τ : ℂ) ^ 2 * (normSq ξ : ℂ)) =
      cexp (τ * (a * conj a) + τ * (b * conj b) - τ ^ 2 * (a * b) : ℂ) *
        cexp (-(((1 - τ ^ 2) - 1 : ℝ) : ℂ) * (normSq ξ : ℂ) + (I * τ * (conj a - τ * b)) * ξ +
          (I * τ * (conj b - τ * a)) * conj ξ) := by
    intro ξ
    rw [← Complex.exp_add]
    congr 1
    push_cast
    ring
  simp_rw [hpt2]
  rw [integral_const_mul, integral_gaussC_cexp_linear hrate, ← mul_assoc, mul_comm (cexp _),
    mul_assoc, ← Complex.exp_add]
  congr 2
  unfold mehlerExp
  have hne : (1 - (τ : ℂ) ^ 2) ≠ 0 := by
    have : ((1 - τ ^ 2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hrate.ne'
    simpa using this
  push_cast
  field_simp
  have hI : I * I = -1 := I_mul_I
  linear_combination (τ ^ 2 * ((conj a - τ * b) * (conj b - τ * a)) * (1 : ℂ)) * hI

/-- **The complex Mehler bound** over any finite set of indices. -/
theorem sum_mehler_le (τ : ℝ) (hτ0 : 0 ≤ τ) (hτ1 : τ < 1) (a b : ℂ) (T : Finset (ℕ × ℕ)) :
    ∑ pq ∈ T, τ ^ (pq.1 + pq.2) * ‖Hf pq.1 pq.2 a b‖ ^ 2 / ((pq.1.factorial : ℝ) * pq.2.factorial) ≤
      (1 - τ ^ 2)⁻¹ * Real.exp (mehlerExp τ a b).re := by
  set μ := gaussC.prod gaussC
  have hexpR : ∀ x : ℝ, HasSum (fun n : ℕ => x ^ n / (n.factorial : ℝ)) (Real.exp x) := by
    intro x
    have := NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℝ) x
    rwa [← Real.exp_eq_exp_ℝ] at this
  have hexpC : ∀ x : ℂ, HasSum (fun n : ℕ => x ^ n / (n.factorial : ℂ)) (cexp x) := by
    intro x
    have := NormedSpace.expSeries_div_hasSum_exp (𝔸 := ℂ) x
    rwa [← Complex.exp_eq_exp_ℂ] at this
  have hnormC : ∀ x : ℂ, Summable (fun n : ℕ => ‖x ^ n / (n.factorial : ℂ)‖) := by
    intro x
    refine (hexpR ‖x‖).summable.congr (fun n => ?_)
    rw [norm_div, norm_pow, Complex.norm_natCast]
  have hbndsum : ∀ ω, HasSum (fun pq => mehBnd τ a b pq ω)
      (Real.exp ‖uC τ a ω‖ * Real.exp ‖vC τ b ω‖) := by
    intro ω
    apply (hexpR _).mul (hexpR _)
    apply summable_mul_of_summable_norm (f := fun n : ℕ => ‖uC τ a ω‖ ^ n / (n.factorial : ℝ))
      (g := fun n : ℕ => ‖vC τ b ω‖ ^ n / (n.factorial : ℝ))
    · refine (hexpR ‖uC τ a ω‖).summable.congr (fun n => ?_)
      rw [Real.norm_eq_abs, abs_of_nonneg (by positivity)]
    · refine (hexpR ‖vC τ b ω‖).summable.congr (fun n => ?_)
      rw [Real.norm_eq_abs, abs_of_nonneg (by positivity)]
  have hlim : ∀ ω, HasSum (fun pq => mehTerm τ a b pq ω) (cexp (uC τ a ω) * cexp (vC τ b ω)) := by
    intro ω
    have hs := summable_mul_of_summable_norm
      (f := fun n : ℕ => uC τ a ω ^ n / (n.factorial : ℂ))
      (g := fun n : ℕ => vC τ b ω ^ n / (n.factorial : ℂ)) (hnormC _) (hnormC _)
    have h := (hexpC (uC τ a ω)).mul (hexpC (vC τ b ω)) hs
    unfold mehTerm
    exact h
  have hmeas : ∀ pq, AEStronglyMeasurable (mehTerm τ a b pq) μ := by
    intro pq
    exact ((((continuous_uC τ a).pow pq.1).div_const _).mul
      (((continuous_vC τ b).pow pq.2).div_const _)).aestronglyMeasurable
  have hbound : ∀ pq, ∀ᵐ ω ∂μ, ‖mehTerm τ a b pq ω‖ ≤ mehBnd τ a b pq ω := by
    intro pq
    filter_upwards with ω
    simp only [mehTerm, mehBnd, norm_mul, norm_div, norm_pow, Complex.norm_natCast, le_refl]
  have hbint : Integrable (fun ω => ∑' pq, mehBnd τ a b pq ω) μ := by
    have h1 := integrable_exp_sq τ hτ0 hτ1 (‖a‖ + ‖b‖)
    refine (h1.mul_prod h1).mono' ?_ (Filter.Eventually.of_forall fun ω => ?_)
    · refine (Continuous.aestronglyMeasurable ?_)
      have : (fun ω => ∑' pq, mehBnd τ a b pq ω) =
          fun ω => Real.exp ‖uC τ a ω‖ * Real.exp ‖vC τ b ω‖ := by
        funext ω; exact (hbndsum ω).tsum_eq
      rw [this]
      exact (Real.continuous_exp.comp (continuous_uC τ a).norm).mul
        (Real.continuous_exp.comp (continuous_vC τ b).norm)
    · rw [(hbndsum ω).tsum_eq, Real.norm_eq_abs, abs_of_pos (by positivity)]
      exact exp_norm_uv_le τ hτ0 a b ω
  have hHS := hasSum_integral_of_dominated_convergence (mehBnd τ a b) hmeas hbound
    (Filter.Eventually.of_forall fun ω => (hbndsum ω).summable) hbint
    (Filter.Eventually.of_forall hlim)
  rw [integral_exp_uv τ hτ0 hτ1 a b] at hHS
  -- the integrals of the terms
  have hterm : ∀ pq : ℕ × ℕ, ∫ ω, mehTerm τ a b pq ω ∂μ =
      ((τ ^ (pq.1 + pq.2) * ‖Hf pq.1 pq.2 a b‖ ^ 2 /
        ((pq.1.factorial : ℝ) * pq.2.factorial) : ℝ) : ℂ) := by
    intro pq
    simp only [mehTerm]
    simp_rw [term_eq]
    rw [integral_const_mul, ← normSq_Hf_eq_integral]
    push_cast
    ring
  simp_rw [hterm] at hHS
  have hre := Complex.hasSum_re hHS
  simp only [Complex.ofReal_re] at hre
  have hle := sum_le_hasSum T (fun pq _ => by positivity) hre
  refine hle.trans ?_
  have : (((1 - τ ^ 2 : ℝ) : ℂ)⁻¹ * cexp (mehlerExp τ a b)).re ≤
      ‖((1 - τ ^ 2 : ℝ) : ℂ)⁻¹ * cexp (mehlerExp τ a b)‖ := Complex.re_le_norm _
  refine this.trans (le_of_eq ?_)
  rw [norm_mul, norm_inv, Complex.norm_real, Real.norm_eq_abs,
    abs_of_pos (by nlinarith), Complex.norm_exp]

/-- On the diagonal `a = b = x + iη` the Mehler exponent is `2τx²/(1+τ) + 2τη²/(1−τ)`. -/
theorem mehlerExp_diag_re (τ : ℝ) (hτ1 : τ < 1) (hτ0 : 0 ≤ τ) (ζ : ℂ) :
    (mehlerExp τ ζ ζ).re = 2 * τ * ζ.re ^ 2 / (1 + τ) + 2 * τ * ζ.im ^ 2 / (1 - τ) := by
  have h1 : (1 : ℝ) - τ ^ 2 ≠ 0 := by nlinarith
  have h2 : 1 + τ ≠ 0 := by linarith
  have h3 : 1 - τ ≠ 0 := by linarith
  have hd : (1 - (τ : ℂ) ^ 2) = ((1 - τ ^ 2 : ℝ) : ℂ) := by push_cast; ring
  unfold mehlerExp
  rw [hd]
  simp only [Complex.sub_re, Complex.add_re, Complex.mul_re, Complex.div_ofReal_re,
    Complex.ofReal_re, Complex.ofReal_im, Complex.conj_re, Complex.conj_im, Complex.mul_im,
    Complex.sub_im, pow_two]
  field_simp
  ring

end

end Grothe.UpperQuad.Mehler
