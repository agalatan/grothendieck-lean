import Grothe.LowerAnalytic.RadialCut
import Grothe.LowerAnalytic.GramSpectral

/-!
# The contraction-Gram budget of circular cubic chaos

The spectral nodes of the certificate may cite the universal law budgets of `Gram.lean`: every
contraction-Gram certificate accepted by `gramCert` gives `λ E X² + μ E r² ≤ A P + B Q`, and the
coupled family `E X² ≤ a_s P − b_s Q`.  For a genuine circular cubic `q = a + ib`
(`Circular J a b`, so `q = Σ t_{abc} :Z_a Z_b Z̄_c:` in complex coordinates) both rest on finite
contraction identities for the coefficient tensor `t`.  This file sets them up for the Gaussian
law of `U = |q|²` and derives `GramInputs` (`gaussian_gramInputs`).

* **The complex coefficient tensor** `t = gramT J a b = 3 P₊P₊P₋ (f + ig)` of the real kernels
  `f = ∂³a/6`, `g = ∂³b/6`, its contractions `N, H, B, W, Y` and the scalars `n, h, b, y, z`,
  the spectral norms `u₂ = ‖U₂‖², u₄ = ‖U₄‖²` of the chaos components of `U − 1` and
  `v₂ = ‖(q²)₂‖², v₄ = ‖(q²)₄‖²` of `q² = P + iQ` (`specU2`, `specU4`, `specV2`, `specV4`) are
  defined in `GramTensor.lean`, which also proves `z² ≤ nh` (`G₀ ⪰ 0`, `gramZ_sq_le`),
  Schatten–Hölder `b ≤ n` (`gramT_schatten`), `y ≤ z` (`gramT_symm`) and
  `G₁ = Gram(D, C₊₊) = [[h, T], [T, (n + b + 2T)/4]] ⪰ 0`, `T = (3y − z)/2` (`gramT_gram1a`,
  `gramT_gram1b`).
* **The spectral layer.**  **Proved**, for `a`, `b` in the third chaos with `E a² = E b² = 1/2`,
  `E ab = 0` and a Gaussian expectation: `E(S − 3)² = 4u₂ + u₄`, `E[(S − 3)(U − 1)] = 2u₂ + u₄`,
  `E(A² + B²) = 4v₂ + v₄`, `E N = 2v₂ + v₄` (`S = 3w`, `A + iB = 3c`, `N = 3 Re(c q̄²)`), i.e.
  `E X² = (4u₂ + u₄)/9`, `P = (2u₂ + u₄)/3`, `E|c|² = (4v₂ + v₄)/9`, `Q = (2v₂ + v₄)/3`, by the
  orthogonality of the chaos components.
* **The spectral identities** `u₂ = 16n + 4h + 16z` and `v₂ = 32b` are proved in
  `GramSpectral.lean` (`Circular.specU2_eq`, `Circular.specV2_eq`, by the complex charge calculus
  and the second-chaos Ornstein–Uhlenbeck ladder).  **The tensor facts** `GramFacts E J a b`,
  **not yet formalised** (`tools/check_gram_facts.py` checks every field numerically on explicit
  and random circular cubics): the fourth-chaos identities `u₄ = 16n + 4h + 16b + 96y − 32z` and
  `v₄ = 96y` (`(q²)₄ = 4 I₃,₁(Y)`).
* `gaussian_gramInputs`: for a circular cubic, under `GramFacts`, the law of `U` under the
  standard Gaussian measure
  has all inputs of the Stein cuts (`GramInputs`): the inputs of `gaussian_steinInputs`, every
  accepted Gram certificate (`gram_budget_of_scalars` on the scalars above, with `r² ≤ |c|²`),
  and the coupled family (`coupled_of_gram`).
-/

open MeasureTheory MvPolynomial Grothe.Lower ComplexConjugate

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

variable (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (a b : MvPolynomial ι ℝ)

/-- **The remaining tensor facts of the contraction-Gram budget** for a circular cubic
`q = a + ib` (`t = gramT J a b`, `n, h, b, y, z` its contraction scalars): the two fourth-chaos
spectral identities of the manuscript proof (`TENSOR_BUDGET_PROOF.md`, `COUPLED_BUDGET_PROOF.md`
of the certificate), **not yet formalised**; `tools/check_gram_facts.py` checks every field
numerically with these exact definitions.  (The order and Gram constraints `b ≤ n`, `y ≤ z`,
`G₁ ⪰ 0` are proved in `GramTensor.lean`, the second-chaos identities `u₂`, `v₂` in
`GramSpectral.lean`.) -/
structure GramFacts (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ)
    [DecidableEq ι] : Prop where
  u4_eq : specU4 E a b = 16 * gramN (gramT J a b) + 4 * gramH (gramT J a b)
    + 16 * gramB (gramT J a b) + 96 * gramY (gramT J a b) - 32 * gramZ (gramT J a b)
  v4_eq : specV4 E a b = 96 * gramY (gramT J a b)

/-! ### The spectral layer: `E X²`, `P`, `E|c|²`, `Q` through the spectral norms -/

omit [Fintype ι] in
lemma C_three_one : (C (3 * (1 : ℝ)) : MvPolynomial ι ℝ) = 3 := by
  rw [mul_one]; exact map_ofNat C 3

section expectation

variable {E} {a b} [DecidableEq ι] (hE : IsGaussianExpectation E) (ha : Chaos3 a) (hb : Chaos3 b)
  (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2)
include hE

omit [DecidableEq ι] in
/-- `E[(2X₂ + X₄)(X₂ + X₄ + X₆)] = 2‖X₂‖² + ‖X₄‖²` for chaos components. -/
lemma gE_two_four_pair {X2 X4 X6 : MvPolynomial ι ℝ} (h2 : ouL X2 = -(2 * X2))
    (h4 : ouL X4 = -(4 * X4)) (h6 : ouL X6 = -(6 * X6)) :
    E ((2 * X2 + X4) * (X2 + X4 + X6)) = 2 * E (X2 * X2) + E (X4 * X4) := by
  have o24 := gE_eigen_orth hE 2 4 (by norm_num) h2 h4
  have o26 := gE_eigen_orth hE 2 6 (by norm_num) h2 h6
  have o46 := gE_eigen_orth hE 4 6 (by norm_num) h4 h6
  rw [show (2 * X2 + X4) * (X2 + X4 + X6) = 2 * (X2 * X2) + X4 * X4 + 3 * (X2 * X4)
      + 2 * (X2 * X6) + X4 * X6 by ring]
  simp only [map_add, ofNat_mul_apply E 2, ofNat_mul_apply E 3, o24, o26, o46]
  ring

include ha hb haa hbb

/-- `E(S − 3)² = 4u₂ + u₄`. -/
lemma varS_eq : E ((radS a b - 3) * (radS a b - 3)) = 4 * specU2 E a b + specU4 E a b := by
  have h := var_radS hE ha hb (v := 1) haa hbb
  rwa [C_three_one] at h

/-- `E[(S − 3)(U − 1)] = 2u₂ + u₄`. -/
lemma SU_eq : E ((radS a b - 3) * (radU a b - C 1)) = 2 * specU2 E a b + specU4 E a b := by
  obtain ⟨p2, p4, p6⟩ := proj_radU hE ha hb (v := 1) haa hbb
  have hS := radS_eq_proj hE ha hb (v := 1) haa hbb
  rw [C_three_one] at hS
  have hU : radU a b - C 1 = proj2 (radU a b - C 1) + proj4 (radU a b - C 1)
      + proj6 (radU a b - C 1) := by
    rw [p2, p4, p6]; exact radU_sub_eq_comps E haa hbb
  have e2 : ouL (proj2 (radU a b - C 1)) = -(2 * proj2 (radU a b - C 1)) := by
    rw [p2]; exact eigen_add 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)
  have e4 : ouL (proj4 (radU a b - C 1)) = -(4 * proj4 (radU a b - C 1)) := by
    rw [p4]; exact eigen_add 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)
  have e6 : ouL (proj6 (radU a b - C 1)) = -(6 * proj6 (radU a b - C 1)) := by
    rw [p6]; exact eigen_add 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)
  unfold specU2 specU4
  generalize proj2 (radU a b - C 1) = U2 at hS hU e2 e4 e6 ⊢
  generalize proj4 (radU a b - C 1) = U4 at hS hU e2 e4 e6 ⊢
  generalize proj6 (radU a b - C 1) = U6 at hS hU e2 e4 e6 ⊢
  rw [hS, hU]
  exact gE_two_four_pair hE e2 e4 e6

/-- `E[SU] = 2u₂ + u₄ + 3`, i.e. `P = E[(w − 1)U] = (2u₂ + u₄)/3`. -/
lemma gE_SU : E (radS a b * radU a b) = 2 * specU2 E a b + specU4 E a b + 3 := by
  have h := SU_eq hE ha hb haa hbb
  have hS := fluctuation_mean hE ha hb haa hbb
  have hU : E (radU a b) = 1 := by rw [radU, map_add, haa, hbb]; norm_num
  rw [show (radS a b - 3) * (radU a b - C 1)
      = radS a b * radU a b - radS a b * C 1 - 3 * radU a b + 3 * C 1 by ring, map_add, map_sub,
    map_sub, ofNat_mul_apply, ofNat_mul_apply, mul_comm (radS a b) (C 1), C_mul_apply, hS, hU,
    gE_C hE] at h
  linarith

/-- `E(A² + B²) = 4v₂ + v₄`. -/
lemma AB_eq (hab : E (a * b) = 0) :
    E (radA a b * radA a b) + E (radB a b * radB a b) = 4 * specV2 E a b + specV4 E a b :=
  gE_radA_radB hE ha hb (v := 1) haa hbb hab

/-- `E N = 2v₂ + v₄` for `N = A P + B Q = 3 Re(c q̄²)`, i.e. `Q = E[rU] = (2v₂ + v₄)/3`. -/
lemma N_eq (hab : E (a * b) = 0) :
    E (radA a b * radP a b + radB a b * radQ a b) = 2 * specV2 E a b + specV4 E a b := by
  obtain ⟨p2, p4, p6⟩ := proj_radP hE ha hb (v := 1) haa hbb
  obtain ⟨q2, q4, q6⟩ := proj_radQ hE ha hb hab
  have hA := radA_eq_proj hE ha hb (v := 1) haa hbb
  have hB := radB_eq_proj hE ha hb hab
  have hP : radP a b = proj2 (radP a b) + proj4 (radP a b) + proj6 (radP a b) := by
    rw [p2, p4, p6]; exact radP_eq_comps E haa hbb
  have hQ : radQ a b = proj2 (radQ a b) + proj4 (radQ a b) + proj6 (radQ a b) := by
    rw [q2, q4, q6]; exact radQ_eq_comps E hab
  have eP2 : ouL (proj2 (radP a b)) = -(2 * proj2 (radP a b)) := by
    rw [p2]; exact eigen_sub 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)
  have eP4 : ouL (proj4 (radP a b)) = -(4 * proj4 (radP a b)) := by
    rw [p4]; exact eigen_sub 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)
  have eP6 : ouL (proj6 (radP a b)) = -(6 * proj6 (radP a b)) := by
    rw [p6]; exact eigen_sub 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)
  have eQ2 : ouL (proj2 (radQ a b)) = -(2 * proj2 (radQ a b)) := by
    rw [q2]; exact eigen_two_mul 2 (comp2_eig hE ha hb)
  have eQ4 : ouL (proj4 (radQ a b)) = -(4 * proj4 (radQ a b)) := by
    rw [q4]; exact eigen_two_mul 4 (comp4_eig hE ha hb)
  have eQ6 : ouL (proj6 (radQ a b)) = -(6 * proj6 (radQ a b)) := by
    rw [q6]; exact eigen_two_mul 6 (comp6_eig hE ha hb)
  unfold specV2 specV4
  rw [map_add, hA, hB]
  generalize proj2 (radP a b) = P2 at hP eP2 eP4 eP6 ⊢
  generalize proj4 (radP a b) = P4 at hP eP2 eP4 eP6 ⊢
  generalize proj6 (radP a b) = P6 at hP eP2 eP4 eP6 ⊢
  generalize proj2 (radQ a b) = Q2 at hQ eQ2 eQ4 eQ6 ⊢
  generalize proj4 (radQ a b) = Q4 at hQ eQ2 eQ4 eQ6 ⊢
  generalize proj6 (radQ a b) = Q6 at hQ eQ2 eQ4 eQ6 ⊢
  rw [hP, hQ, gE_two_four_pair hE eP2 eP4 eP6, gE_two_four_pair hE eQ2 eQ4 eQ6]
  ring

end expectation

/-! ### The Gaussian instance -/

section gaussian

variable {d : ℕ}

/-- **The inputs of all Stein cuts for the Gaussian law** of `U = |q|²`, `q = a + ib` with `a`,
`b` in the third chaos, `E a² = E b² = 1/2`, `E ab = 0`, under the tensor facts `GramFacts` of the
circular cubic: the inputs of `gaussian_steinInputs`, every accepted contraction-Gram certificate
and the coupled family. -/
theorem gaussian_gramInputs (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) {J : Fin d → Fin d → ℝ}
    (hc : Circular J a b) (hG : GramFacts (gaussE d) J a b) :
    GramInputs (stdGaussian d) fun x => eval x (radU a b) := by
  have hE := gaussE_isGaussianExpectation d
  have hb : Chaos3 b := hc.chaos3_right ha
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by simp only [map_mul]; ring)
  have hbb' : gaussE d (b * b) = 1 / 2 := by rw [← hc.gE_sq_eq hE, haa']
  have hab' : gaussE d (a * b) = 0 := hc.gE_mul hE
  have u2 := hc.specU2_eq hE ha haa'
  have v2 := hc.specV2_eq hE ha haa'
  have hmean := fluctuation_mean hE ha hb haa' hbb'
  have hU1 : gaussE d (radU a b) = 1 := by
    rw [radU, map_add, haa', hbb']; norm_num
  have hbw := budget_w hE gaussE_mul_self_nonneg ha hb haa' hbb'
  have hbc := budget_c hE gaussE_mul_self_nonneg ha hb haa' hbb' hab'
  have hid := energy_identity hE ha hb
  have hcov := covariance_order hE gaussE_mul_self_nonneg ha hb haa' hbb' hab'
  have hv : MemLp (fun x => eval x (radS a b) / 3 - 1) 2 (stdGaussian d) := by
    refine (memLp_congr_ae (Filter.Eventually.of_forall fun x => ?_)).1
      (memLp_eval (C (1 / 3 : ℝ) * radS a b - 1))
    simp only [map_sub, map_mul, eval_C, map_one]; ring
  have hv0 : ∫ x, (eval x (radS a b) / 3 - 1) ∂(stdGaussian d) = 0 := by
    rw [show (fun x => eval x (radS a b) / 3 - 1) = fun x => eval x (C (1 / 3 : ℝ) * radS a b - 1)
      by funext x; simp only [map_sub, map_mul, eval_C, map_one]; ring, ← gaussE_apply, map_sub,
      C_mul_apply, hmean, hE.one]
    norm_num
  have ev2 : ∫ x, (eval x (radS a b) / 3 - 1) ^ 2 ∂(stdGaussian d)
      = 1 / 9 * gaussE d (radS a b * radS a b) - 2 / 3 * gaussE d (radS a b) + 1 := by
    rw [show (fun x => (eval x (radS a b) / 3 - 1) ^ 2) = fun x => eval x
        (C (1 / 9 : ℝ) * (radS a b * radS a b) - C (2 / 3 : ℝ) * radS a b + 1) by
      funext x; simp only [map_add, map_sub, map_mul, eval_C, map_one]; ring, ← gaussE_apply,
      map_add, map_sub, C_mul_apply, C_mul_apply, hE.one]
  have evU : ∫ x, (eval x (radS a b) / 3 - 1) * eval x (radU a b) ∂(stdGaussian d)
      = 1 / 3 * gaussE d (radS a b * radU a b) - gaussE d (radU a b) := by
    rw [show (fun x => (eval x (radS a b) / 3 - 1) * eval x (radU a b)) = fun x => eval x
        (C (1 / 3 : ℝ) * (radS a b * radU a b) - radU a b) by
      funext x; simp only [map_sub, map_mul, eval_C]; ring, ← gaussE_apply, map_sub, C_mul_apply]
  have erU : ∫ x, radR a b x * eval x (radU a b) ∂(stdGaussian d)
      = 1 / 3 * gaussE d (radN a b) := by
    rw [show (fun x => radR a b x * eval x (radU a b)) = fun x => eval x
        (C (1 / 3 : ℝ) * radN a b) by
      funext x; rw [radR_mul]; simp only [map_mul, eval_C]; ring, ← gaussE_apply, C_mul_apply]
  have e2 : ∫ x, radR a b x ^ 2 ∂(stdGaussian d)
      ≤ 1 / 9 * (gaussE d (radA a b * radA a b) + gaussE d (radB a b * radB a b)) := by
    rw [gaussE_apply, gaussE_apply, ← integral_add (integrable_eval _) (integrable_eval _),
      ← integral_const_mul]
    refine integral_mono (memLp_radR a b).integrable_sq
      (((integrable_eval _).add (integrable_eval _)).const_mul _) fun x => ?_
    have h := radR_sq_le a b x
    simp only [map_mul]
    linarith
  have e3 : ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) = gaussE d (radU a b * radU a b) := by
    rw [gaussE_apply]
    exact integral_congr_ae (Filter.Eventually.of_forall fun x => by simp only [map_mul]; ring)
  -- the spectral layer
  have sV := varS_eq hE ha hb haa' hbb'
  have sSU := gE_SU hE ha hb haa' hbb'
  have sAB := AB_eq hE ha hb haa' hbb' hab'
  have sN := N_eq hE ha hb haa' hbb' hab'
  have hN : radN a b = radA a b * radP a b + radB a b * radQ a b := rfl
  have sV' : gaussE d (radS a b * radS a b) - 6 * gaussE d (radS a b) + 9
      = 4 * specU2 (gaussE d) a b + specU4 (gaussE d) a b := by
    rw [← sV, show (3 : MvPolynomial (Fin d) ℝ) = C 3 from (map_ofNat C 3).symm, gE_sub_C_sq hE]
    ring
  -- the budget from an accepted Gram certificate, on the scalars of the tensor facts
  have u4 := hG.u4_eq
  have hG0 := gramZ_sq_le (gramT J a b)
  have hgram : ∀ (lam mu : ℚ) (g : GramData), gramCert lam mu g = true →
      lam * ∫ x, (eval x (radS a b) / 3 - 1) ^ 2 ∂(stdGaussian d)
          + mu * ∫ x, radR a b x ^ 2 ∂(stdGaussian d)
        ≤ g.A * ∫ x, (eval x (radS a b) / 3 - 1) * eval x (radU a b) ∂(stdGaussian d)
          + g.B * ∫ x, radR a b x * eval x (radU a b) ∂(stdGaussian d) := by
    intro lam mu g hg
    obtain ⟨-, hmu⟩ := gramCert_nonneg hg
    have hmuR : (0 : ℝ) ≤ mu := by exact_mod_cast hmu
    have key := gram_budget_of_scalars lam mu g hg (gramN (gramT J a b)) (gramH (gramT J a b))
      (gramB (gramT J a b)) (gramY (gramT J a b)) (gramZ (gramT J a b))
      (∫ x, (eval x (radS a b) / 3 - 1) * eval x (radU a b) ∂(stdGaussian d))
      (∫ x, radR a b x * eval x (radU a b) ∂(stdGaussian d))
      (∫ x, (eval x (radS a b) / 3 - 1) ^ 2 ∂(stdGaussian d))
      (1 / 9 * (gaussE d (radA a b * radA a b) + gaussE d (radB a b * radB a b)))
      (gramN_nonneg _) (gramH_nonneg _) (gramB_nonneg _) (gramY_nonneg _)
      ((gramY_nonneg _).trans (gramT_symm J a b)) (gramT_schatten J a b) (gramT_symm J a b) hG0
      (gramT_gram1a J a b) (gramT_gram1b J a b)
      (by rw [evU, sSU, hU1, u2, u4]; ring) (by rw [erU, hN, sN, v2, hG.v4_eq]; ring)
      (by rw [ev2]; linarith) (by rw [sAB, v2, hG.v4_eq]; ring)
    nlinarith [mul_le_mul_of_nonneg_left e2 hmuR]
  refine ⟨⟨_, radR a b, hv, memLp_radR a b, hv0, ?_, ?_, ?_, ?_, fun vs z h =>
    radial_cut a b ha.eig hb.eig vs z h, hgram, fun s hs => coupled_of_gram _ _ _ _ hgram s hs⟩⟩
  · rw [ev2, evU, hmean, hU1]; linarith
  · rw [erU]; unfold radN at hid ⊢; linarith
  · rw [evU, erU, e3, hU1]; linarith
  · rw [erU, e3]; simp only [radN] at hid ⊢; linarith

end gaussian

end

end Grothe.LowerAnalytic
