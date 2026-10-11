import Mathlib

/-!
# The fluctuation bound for cubic Gaussian chaos

For real polynomials in finitely many variables let `ouL` be the Ornstein–Uhlenbeck generator
`Σᵢ (∂ᵢ² − xᵢ∂ᵢ)` and `gam P Q = Σᵢ ∂ᵢP ∂ᵢQ` its carré du champ.  A linear functional `E` on
polynomials is a *Gaussian expectation* (`IsGaussianExpectation`) when `E 1 = 1` and it satisfies
the Gaussian integration by parts `E[xᵢ P] = E[∂ᵢ P]`; then `E[P · L Q] = −E[Γ(P, Q)]`
(`gE_mul_ouL`).  Nothing else about the Gaussian measure is used.

A polynomial `F` is in the third chaos (`Chaos3`) when `L F = −3F` and its third derivatives are
constants.  For such `F`, with `S = E F²`, the polynomial

  `J₄ = Γ(F,F) − Σⱼ Γ(∂ⱼF, ∂ⱼF) + 3S`

is the fourth-chaos component of `F²`, and (`chaos3_remainder`)

  `2 (E F⁴ − 3S²) − E[(Γ(F,F) − 3S)²] = E[J₄²]`.

Applied to `a`, `a + b`, `b`, `b − a` for a pair with `E a² = E b² = 1/2`, `E ab = 0` this gives
the fluctuation identity (`fluctuation_identity`): with `U = a² + b²`,
`w = (Γ(a,a) + Γ(b,b))/3`, `c_R = (Γ(a,a) − Γ(b,b))/3`, `c_I = 2Γ(a,b)/3`,

  `E w = 1`,
  `(E U² − 2)/3 − E(w − 1)² − ½ E(c_R² + c_I²)
     = (4 E J₄(a)² + E J₄(a+b)² + 4 E J₄(b)² + E J₄(b−a)²)/36`,

hence the fluctuation bound when `E` is nonnegative on squares (`fluctuation_bound`).
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

section derivations

variable {ι : Type*}

lemma pderiv_ofNat_mul (i : ι) (n : ℕ) [n.AtLeastTwo] (P : MvPolynomial ι ℝ) :
    pderiv i ((OfNat.ofNat n : MvPolynomial ι ℝ) * P)
      = (OfNat.ofNat n : MvPolynomial ι ℝ) * pderiv i P := by
  change pderiv i ((n : MvPolynomial ι ℝ) * P) = (n : MvPolynomial ι ℝ) * pderiv i P
  rw [← nsmul_eq_mul, map_nsmul, nsmul_eq_mul]

/-- Partial derivatives commute. -/
lemma pderiv_pderiv_comm (i j : ι) (P : MvPolynomial ι ℝ) :
    pderiv i (pderiv j P) = pderiv j (pderiv i P) := by
  classical
  induction P using MvPolynomial.induction_on' with
  | monomial s a =>
    rw [pderiv_monomial, pderiv_monomial, pderiv_monomial, pderiv_monomial]
    by_cases h : i = j
    · subst h; rfl
    · rw [tsub_right_comm]
      congr 1
      simp only [Finsupp.coe_tsub, Pi.sub_apply, Finsupp.single_apply, h, Ne.symm h, ↓reduceIte,
        tsub_zero]
      ring
  | add p q hp hq => simp only [map_add, hp, hq]

lemma ofNat_mul_apply (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (n : ℕ) [n.AtLeastTwo]
    (P : MvPolynomial ι ℝ) :
    E ((OfNat.ofNat n : MvPolynomial ι ℝ) * P) = (OfNat.ofNat n : ℝ) * E P := by
  change E ((n : MvPolynomial ι ℝ) * P) = (n : ℝ) * E P
  rw [← nsmul_eq_mul, map_nsmul, nsmul_eq_mul]

lemma C_mul_apply (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (c : ℝ) (P : MvPolynomial ι ℝ) :
    E (C c * P) = c * E P := by
  rw [C_mul', map_smul, smul_eq_mul]

end derivations

variable {ι : Type*} [Fintype ι]

/-- The **Ornstein–Uhlenbeck generator** `Σᵢ (∂ᵢ² − xᵢ ∂ᵢ)`. -/
def ouL : MvPolynomial ι ℝ →ₗ[ℝ] MvPolynomial ι ℝ where
  toFun P := ∑ i, (pderiv i (pderiv i P) - X i * pderiv i P)
  map_add' P Q := by
    simp only [map_add, mul_add, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun i _ => by ring
  map_smul' c P := by
    simp only [Derivation.map_smul, RingHom.id_apply, Finset.smul_sum, smul_sub, mul_smul_comm]

lemma ouL_apply (P : MvPolynomial ι ℝ) :
    ouL P = ∑ i, (pderiv i (pderiv i P) - X i * pderiv i P) := rfl

/-- The **carré du champ** `Σᵢ ∂ᵢP ∂ᵢQ`. -/
def gam (P Q : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := ∑ i, pderiv i P * pderiv i Q

lemma gam_comm (P Q : MvPolynomial ι ℝ) : gam P Q = gam Q P :=
  Finset.sum_congr rfl fun _ _ => mul_comm _ _

lemma ouL_C (c : ℝ) : ouL (C c : MvPolynomial ι ℝ) = 0 := by
  simp [ouL_apply]

/-- Leibniz rule for the generator. -/
lemma ouL_mul (P Q : MvPolynomial ι ℝ) :
    ouL (P * Q) = P * ouL Q + Q * ouL P + 2 * gam P Q := by
  simp only [ouL_apply, gam, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  simp only [pderiv_mul, map_add]
  ring

/-- The commutation `L ∂ⱼ = ∂ⱼ L + ∂ⱼ`. -/
lemma ouL_pderiv [DecidableEq ι] (j : ι) (P : MvPolynomial ι ℝ) :
    ouL (pderiv j P) = pderiv j (ouL P) + pderiv j P := by
  have hs : ∑ i, Pi.single (M := fun _ => MvPolynomial ι ℝ) j 1 i * pderiv i P
      = pderiv j P := by
    rw [Finset.sum_eq_single j (fun i _ hi => by simp [Pi.single_eq_of_ne hi])
      (fun h => absurd (Finset.mem_univ j) h)]
    simp
  rw [ouL_apply, ouL_apply, map_sum]
  conv_rhs => rw [← hs]
  rw [← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_sub, pderiv_mul, pderiv_X, pderiv_pderiv_comm i j P,
    pderiv_pderiv_comm i j (pderiv i P)]
  ring

lemma gam_mul_self (F : MvPolynomial ι ℝ) : gam (F * F) (F * F) = 4 * (F * F) * gam F F := by
  unfold gam
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [pderiv_mul]
  ring

lemma gam_add_self (a b : MvPolynomial ι ℝ) :
    gam (a + b) (a + b) = gam a a + 2 * gam a b + gam b b := by
  unfold gam
  rw [Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_add]
  ring

lemma gam_sub_self (a b : MvPolynomial ι ℝ) :
    gam (b - a) (b - a) = gam a a - 2 * gam a b + gam b b := by
  unfold gam
  rw [Finset.mul_sum, ← Finset.sum_sub_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_sub]
  ring

/-- **Third Gaussian chaos**: eigenfunctions of the generator with eigenvalue `−3` of degree at
most three. -/
structure Chaos3 (F : MvPolynomial ι ℝ) : Prop where
  eig : ouL F = -(3 * F)
  cubic : ∀ i j k, ∃ t : ℝ, pderiv i (pderiv j (pderiv k F)) = C t

lemma Chaos3.add {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b) : Chaos3 (a + b) where
  eig := by rw [map_add, ha.eig, hb.eig]; ring
  cubic i j k := by
    obtain ⟨t, ht⟩ := ha.cubic i j k
    obtain ⟨t', ht'⟩ := hb.cubic i j k
    exact ⟨t + t', by simp only [map_add, ht, ht']⟩

lemma Chaos3.sub {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b) : Chaos3 (b - a) where
  eig := by rw [map_sub, ha.eig, hb.eig]; ring
  cubic i j k := by
    obtain ⟨t, ht⟩ := ha.cubic i j k
    obtain ⟨t', ht'⟩ := hb.cubic i j k
    exact ⟨t' - t, by simp only [map_sub, ht, ht']⟩

/-- `Σⱼ Γ(∂ⱼF, ∂ⱼF)`. -/
def gam2 (F : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := ∑ j, gam (pderiv j F) (pderiv j F)

/-- `Σⱼ Σᵢ Γ(∂ᵢ∂ⱼF, ∂ᵢ∂ⱼF)`. -/
def gam3 (F : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  ∑ j, ∑ i, gam (pderiv i (pderiv j F)) (pderiv i (pderiv j F))

lemma Chaos3.ouL_sq {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    ouL (F * F) = 2 * gam F F - 6 * (F * F) := by
  rw [ouL_mul, hF.eig]
  ring

lemma Chaos3.gam3_const {F : MvPolynomial ι ℝ} (hF : Chaos3 F) : ∃ τ : ℝ, gam3 F = C τ := by
  choose t ht using hF.cubic
  exact ⟨∑ j, ∑ i, ∑ k, t k i j * t k i j, by simp only [gam3, gam, ht, map_sum, map_mul]⟩

section eigen

variable [DecidableEq ι] {F : MvPolynomial ι ℝ}

lemma Chaos3.ouL_pderiv (hF : Chaos3 F) (j : ι) : ouL (pderiv j F) = -(2 * pderiv j F) := by
  rw [Grothe.LowerAnalytic.ouL_pderiv, hF.eig, map_neg, pderiv_ofNat_mul]
  ring

lemma Chaos3.ouL_pderiv2 (hF : Chaos3 F) (i j : ι) :
    ouL (pderiv i (pderiv j F)) = -pderiv i (pderiv j F) := by
  rw [Grothe.LowerAnalytic.ouL_pderiv, hF.ouL_pderiv, map_neg, pderiv_ofNat_mul]
  ring

lemma Chaos3.ouL_gam (hF : Chaos3 F) : ouL (gam F F) = 2 * gam2 F - 4 * gam F F := by
  unfold gam2
  rw [show gam F F = ∑ i, pderiv i F * pderiv i F from rfl, map_sum, Finset.mul_sum,
    Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [ouL_mul, hF.ouL_pderiv]
  ring

lemma Chaos3.ouL_gam2 (hF : Chaos3 F) : ouL (gam2 F) = 2 * gam3 F - 2 * gam2 F := by
  unfold gam2 gam3
  rw [map_sum, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [show gam (pderiv j F) (pderiv j F) = ∑ i, pderiv i (pderiv j F) * pderiv i (pderiv j F)
    from rfl, map_sum, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [ouL_mul, hF.ouL_pderiv2]
  ring

end eigen

/-- A **Gaussian expectation** on polynomials: a normalized linear functional satisfying the
Gaussian integration by parts `E[xᵢ P] = E[∂ᵢ P]`. -/
structure IsGaussianExpectation (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) : Prop where
  one : E 1 = 1
  ibp : ∀ (i : ι) (P : MvPolynomial ι ℝ), E (X i * P) = E (pderiv i P)

/-- The fourth-chaos component of `F²` for `F` in the third chaos. -/
def J4 (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  gam F F - gam2 F + C (3 * E (F * F))

/-- `w = (Γ(a,a) + Γ(b,b))/3` for a pair `(a, b)` (real and imaginary part of `q`). -/
def flucW (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := C (1 / 3) * (gam a a + gam b b)

/-- `c_R = (Γ(a,a) − Γ(b,b))/3`. -/
def flucCR (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := C (1 / 3) * (gam a a - gam b b)

/-- `c_I = 2Γ(a,b)/3`. -/
def flucCI (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := C (1 / 3) * (2 * gam a b)

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

omit [Fintype ι] in
lemma gE_C (c : ℝ) : E (C c) = c := by
  rw [← mul_one (C c), C_mul_apply, hE.one, mul_one]

omit [Fintype ι] in
lemma gE_sub_C_sq (P : MvPolynomial ι ℝ) (c : ℝ) :
    E ((P - C c) * (P - C c)) = E (P * P) - 2 * c * E P + c * c := by
  have e : (P - C c) * (P - C c) = P * P - C (2 * c) * P + C (c * c) := by
    simp only [map_mul, map_ofNat]; ring
  rw [e, map_add, map_sub, C_mul_apply, gE_C hE]

/-- **Integration by parts**: `E[P · L Q] = −E[Γ(P, Q)]`. -/
theorem gE_mul_ouL (P Q : MvPolynomial ι ℝ) : E (P * ouL Q) = -E (gam P Q) := by
  rw [ouL_apply, gam, Finset.mul_sum, map_sum, map_sum, ← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [mul_sub, map_sub, show P * (X i * pderiv i Q) = X i * (P * pderiv i Q) by ring, hE.ibp,
    pderiv_mul, map_add]
  ring

lemma gE_ouL (Q : MvPolynomial ι ℝ) : E (ouL Q) = 0 := by
  have h := gE_mul_ouL hE 1 Q
  rw [one_mul] at h
  rw [h]
  simp [gam]

/-- The generator is symmetric. -/
lemma gE_mul_ouL_comm (P Q : MvPolynomial ι ℝ) : E (P * ouL Q) = E (Q * ouL P) := by
  rw [gE_mul_ouL hE, gE_mul_ouL hE, gam_comm]

variable {F : MvPolynomial ι ℝ}

lemma Chaos3.gE_gam (hF : Chaos3 F) : E (gam F F) = 3 * E (F * F) := by
  have h := gE_ouL hE (F * F)
  rw [hF.ouL_sq, map_sub, ofNat_mul_apply, ofNat_mul_apply] at h
  linarith

lemma Chaos3.gE_gam_cross {a b : MvPolynomial ι ℝ} (hb : Chaos3 b) :
    E (gam a b) = 3 * E (a * b) := by
  have h := gE_mul_ouL hE a b
  rw [hb.eig, mul_neg, map_neg, show a * (3 * b) = 3 * (a * b) by ring, ofNat_mul_apply] at h
  linarith

variable [DecidableEq ι]

lemma Chaos3.gE_gam2 (hF : Chaos3 F) : E (gam2 F) = 6 * E (F * F) := by
  have h := gE_ouL hE (gam F F)
  rw [hF.ouL_gam, map_sub, ofNat_mul_apply, ofNat_mul_apply] at h
  linarith [hF.gE_gam hE]

lemma Chaos3.gam3_eq (hF : Chaos3 F) : gam3 F = C (6 * E (F * F)) := by
  obtain ⟨τ, hτ⟩ := hF.gam3_const
  have h := gE_ouL hE (gam2 F)
  rw [hF.ouL_gam2, hτ, map_sub, ofNat_mul_apply, ofNat_mul_apply, gE_C hE] at h
  have e : τ = 6 * E (F * F) := by linarith [hF.gE_gam2 hE]
  rw [hτ, e]

/-- `J₄` is an eigenfunction with eigenvalue `−4`. -/
lemma Chaos3.ouL_J4 (hF : Chaos3 F) : ouL (J4 E F) = -(4 * J4 E F) := by
  have hc : (C (6 * E (F * F)) : MvPolynomial ι ℝ) = 2 * C (3 * E (F * F)) := by
    rw [show (6 * E (F * F) : ℝ) = 2 * (3 * E (F * F)) by ring, C_mul, map_ofNat]
  unfold J4
  rw [map_add, map_sub, hF.ouL_gam, hF.ouL_gam2, hF.gam3_eq hE, ouL_C, hc]
  ring

/-- **The scalar remainder identity** for the third chaos. -/
theorem chaos3_remainder (hF : Chaos3 F) :
    2 * E (F * F * (F * F)) - 6 * E (F * F) ^ 2
      - E ((gam F F - C (3 * E (F * F))) * (gam F F - C (3 * E (F * F))))
      = E (J4 E F * J4 E F) := by
  have ha : E (F * F * (F * F)) = E (F * F * gam F F) := by
    have h := gE_ouL hE (F * F * (F * F))
    rw [ouL_mul, hF.ouL_sq, gam_mul_self,
      show F * F * (2 * gam F F - 6 * (F * F)) + F * F * (2 * gam F F - 6 * (F * F))
          + 2 * (4 * (F * F) * gam F F) = 12 * (F * F * gam F F) - 12 * (F * F * (F * F)) by ring,
      map_sub, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  have hb : E (gam F F * gam F F) = E (F * F * gam F F) + E (F * F * gam2 F) := by
    have h := gE_mul_ouL_comm hE (gam F F) (F * F)
    rw [hF.ouL_sq, hF.ouL_gam,
      show gam F F * (2 * gam F F - 6 * (F * F))
          = 2 * (gam F F * gam F F) - 6 * (F * F * gam F F) by ring,
      show F * F * (2 * gam2 F - 4 * gam F F)
          = 2 * (F * F * gam2 F) - 4 * (F * F * gam F F) by ring,
      map_sub, map_sub, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  have hJ := hF.ouL_J4 hE
  have hJ0 : E (J4 E F) = 0 := by
    have h := gE_ouL hE (J4 E F)
    rw [hJ, map_neg, ofNat_mul_apply] at h
    linarith
  have hc1 : E (J4 E F * gam F F) = E (J4 E F * (F * F)) := by
    have h := gE_mul_ouL_comm hE (J4 E F) (F * F)
    rw [hF.ouL_sq, hJ,
      show J4 E F * (2 * gam F F - 6 * (F * F))
          = 2 * (J4 E F * gam F F) - 6 * (J4 E F * (F * F)) by ring,
      show F * F * -(4 * J4 E F) = -(4 * (J4 E F * (F * F))) by ring,
      map_sub, map_neg, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  have hc2 : E (J4 E F * gam2 F) = 0 := by
    have h := gE_mul_ouL_comm hE (J4 E F) (gam F F)
    rw [hF.ouL_gam, hJ,
      show J4 E F * (2 * gam2 F - 4 * gam F F)
          = 2 * (J4 E F * gam2 F) - 4 * (J4 E F * gam F F) by ring,
      show gam F F * -(4 * J4 E F) = -(4 * (J4 E F * gam F F)) by ring,
      map_sub, map_neg, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  have hJJ : E (J4 E F * J4 E F) = E (J4 E F * (F * F)) := by
    have e : J4 E F * J4 E F
        = J4 E F * gam F F - J4 E F * gam2 F + C (3 * E (F * F)) * J4 E F := by
      have hd : J4 E F = gam F F - gam2 F + C (3 * E (F * F)) := rfl
      nth_rewrite 2 [hd]
      ring
    rw [e, map_add, map_sub, C_mul_apply, hc1, hc2, hJ0]
    ring
  have hJF : E (J4 E F * (F * F))
      = E (F * F * gam F F) - E (F * F * gam2 F) + 3 * E (F * F) * E (F * F) := by
    have e : J4 E F * (F * F)
        = F * F * gam F F - F * F * gam2 F + C (3 * E (F * F)) * (F * F) := by
      unfold J4; ring
    rw [e, map_add, map_sub, C_mul_apply]
  rw [gE_sub_C_sq hE, hJJ, hJF, ha, hb, hF.gE_gam hE]
  ring

variable {a b : MvPolynomial ι ℝ}

/-- The four projections `a`, `a + b`, `b`, `b − a`, before normalization. -/
lemma fluctuation_aux (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = 1 / 2)
    (hbb : E (b * b) = 1 / 2) (hab : E (a * b) = 0) :
    12 * E ((a * a + b * b) * (a * a + b * b)) - 24
      - 4 * E ((gam a a + gam b b - 3) * (gam a a + gam b b - 3))
      - 2 * E ((gam a a - gam b b) * (gam a a - gam b b))
      - 2 * E (2 * gam a b * (2 * gam a b))
      = 4 * E (J4 E a * J4 E a) + E (J4 E (a + b) * J4 E (a + b))
        + 4 * E (J4 E b * J4 E b) + E (J4 E (b - a) * J4 E (b - a)) := by
  have Ra := chaos3_remainder hE ha
  have Rb := chaos3_remainder hE hb
  have Rp := chaos3_remainder hE (ha.add hb)
  have Rm := chaos3_remainder hE (ha.sub hb)
  have sp : E ((a + b) * (a + b)) = 1 := by
    rw [show (a + b) * (a + b) = a * a + 2 * (a * b) + b * b by ring, map_add, map_add,
      ofNat_mul_apply, haa, hbb, hab]
    norm_num
  have sm : E ((b - a) * (b - a)) = 1 := by
    rw [show (b - a) * (b - a) = a * a - 2 * (a * b) + b * b by ring, map_add, map_sub,
      ofNat_mul_apply, haa, hbb, hab]
    norm_num
  have hp := ha.gE_gam hE
  rw [haa] at hp
  have hq := hb.gE_gam hE
  rw [hbb] at hq
  have hr : E (gam a b) = 0 := by rw [hb.gE_gam_cross hE, hab, mul_zero]
  rw [gE_sub_C_sq hE, haa, hp] at Ra
  rw [gE_sub_C_sq hE, hbb, hq] at Rb
  rw [gE_sub_C_sq hE, sp, gam_add_self,
    show (gam a a + 2 * gam a b + gam b b) * (gam a a + 2 * gam a b + gam b b)
        = gam a a * gam a a + 4 * (gam a b * gam a b) + gam b b * gam b b
          + 4 * (gam a a * gam a b) + 2 * (gam a a * gam b b) + 4 * (gam b b * gam a b) by ring,
    show (a + b) * (a + b) * ((a + b) * (a + b))
        = a * a * (a * a) + 4 * (a * a * (a * b)) + 6 * (a * a * (b * b))
          + 4 * (a * b * (b * b)) + b * b * (b * b) by ring] at Rp
  rw [gE_sub_C_sq hE, sm, gam_sub_self,
    show (gam a a - 2 * gam a b + gam b b) * (gam a a - 2 * gam a b + gam b b)
        = gam a a * gam a a + 4 * (gam a b * gam a b) + gam b b * gam b b
          - 4 * (gam a a * gam a b) + 2 * (gam a a * gam b b) - 4 * (gam b b * gam a b) by ring,
    show (b - a) * (b - a) * ((b - a) * (b - a))
        = a * a * (a * a) - 4 * (a * a * (a * b)) + 6 * (a * a * (b * b))
          - 4 * (a * b * (b * b)) + b * b * (b * b) by ring] at Rm
  simp only [map_add, map_sub, ofNat_mul_apply E 2, ofNat_mul_apply E 4, ofNat_mul_apply E 6,
    hp, hq, hr] at Rp Rm
  rw [show (a * a + b * b) * (a * a + b * b)
        = a * a * (a * a) + 2 * (a * a * (b * b)) + b * b * (b * b) by ring,
    show (gam a a + gam b b - 3) * (gam a a + gam b b - 3)
        = gam a a * gam a a + 2 * (gam a a * gam b b) + gam b b * gam b b
          - 6 * gam a a - 6 * gam b b + 9 * 1 by ring,
    show (gam a a - gam b b) * (gam a a - gam b b)
        = gam a a * gam a a - 2 * (gam a a * gam b b) + gam b b * gam b b by ring,
    show 2 * gam a b * (2 * gam a b) = 4 * (gam a b * gam a b) by ring]
  simp only [map_add, map_sub, ofNat_mul_apply E 2, ofNat_mul_apply E 4, ofNat_mul_apply E 6,
    ofNat_mul_apply E 9, hE.one, hp, hq]
  linarith

omit [DecidableEq ι] in
/-- `E w = 1`. -/
theorem fluctuation_mean (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = 1 / 2)
    (hbb : E (b * b) = 1 / 2) : E (flucW a b) = 1 := by
  unfold flucW
  rw [C_mul_apply, map_add, ha.gE_gam hE, hb.gE_gam hE, haa, hbb]
  norm_num

/-- **The fluctuation identity** for a pair in the third chaos with `E a² = E b² = 1/2`,
`E ab = 0`: the gap in the fluctuation bound is an explicit sum of squares. -/
theorem fluctuation_identity (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = 1 / 2)
    (hbb : E (b * b) = 1 / 2) (hab : E (a * b) = 0) :
    (E ((a * a + b * b) * (a * a + b * b)) - 2) / 3
      - E ((flucW a b - 1) * (flucW a b - 1))
      - 1 / 2 * (E (flucCR a b * flucCR a b) + E (flucCI a b * flucCI a b))
      = (4 * E (J4 E a * J4 E a) + E (J4 E (a + b) * J4 E (a + b))
        + 4 * E (J4 E b * J4 E b) + E (J4 E (b - a) * J4 E (b - a))) / 36 := by
  have h := fluctuation_aux hE ha hb haa hbb hab
  have h3 : (C (1 / 3) : MvPolynomial ι ℝ) * 3 = 1 := by
    rw [show (3 : MvPolynomial ι ℝ) = C 3 from (map_ofNat C 3).symm, ← C_mul]
    norm_num
  have h9 : (C (1 / 9) : MvPolynomial ι ℝ) = C (1 / 3) * C (1 / 3) := by
    rw [← C_mul]
    norm_num
  have e1 : (flucW a b - 1) * (flucW a b - 1)
      = C (1 / 9) * ((gam a a + gam b b - 3) * (gam a a + gam b b - 3)) := by
    unfold flucW
    rw [h9]
    linear_combination (2 * C (1 / 3) * (gam a a + gam b b) - 1 - 3 * C (1 / 3)) * h3
  have e2 : flucCR a b * flucCR a b
      = C (1 / 9) * ((gam a a - gam b b) * (gam a a - gam b b)) := by
    unfold flucCR
    rw [h9]
    ring
  have e3 : flucCI a b * flucCI a b = C (1 / 9) * (2 * gam a b * (2 * gam a b)) := by
    unfold flucCI
    rw [h9]
    ring
  rw [e1, e2, e3, C_mul_apply, C_mul_apply, C_mul_apply]
  linarith

/-- **The fluctuation bound** `E(w − 1)² + ½ E(c_R² + c_I²) ≤ (E U² − 2)/3`, for a Gaussian
expectation that is nonnegative on squares. -/
theorem fluctuation_bound (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2) (hab : E (a * b) = 0) :
    E ((flucW a b - 1) * (flucW a b - 1))
      + 1 / 2 * (E (flucCR a b * flucCR a b) + E (flucCI a b * flucCI a b))
      ≤ (E ((a * a + b * b) * (a * a + b * b)) - 2) / 3 := by
  have h := fluctuation_identity hE ha hb haa hbb hab
  have h1 := hpos (J4 E a)
  have h2 := hpos (J4 E (a + b))
  have h3 := hpos (J4 E b)
  have h4 := hpos (J4 E (b - a))
  linarith

end expectation

end

end Grothe.LowerAnalytic
