import Grothe.LowerAnalytic.SixthMoment
import Grothe.LowerAnalytic.Gaussian

/-!
# Circular cubic chaos and the sixth-moment inequality

The sixth-moment inequality `E U³ ≤ 9m − 12 + C₆ (m − 2)^{3/2}` (`U = a² + b²`, `m = E U²`) is
**false** for a general pair of real cubic chaoses with `E a² = E b² = 1/2`, `E ab = 0`
(`a = He₃(x₀)/√12`, `b = He₃(x₁)/√12` has `m = 47`, `E U³ = 13506 > 12622.55`).  It holds on the
class the certificate was designed for: genuine circular cubics `q = a + ib ∈ H_{2,1}`, i.e.
`q(e^{iθ}z) = e^{iθ} q(z)`.  This file sets up that class and reduces the inequality on it to
the scalar certificate `cumulant_bound` of `SixthMoment.lean`.

* `rotD J P = Σᵢⱼ Jⱼᵢ xⱼ ∂ᵢP` is the rotation generator of a real matrix `J`; for antisymmetric
  `J` it is a derivation with `E (rotD J P) = 0` for every Gaussian expectation (`gE_rotD`).
* `Circular J a b` says that `J` is a complex structure (`Jᵀ = −J`, `J² = −1`) and
  `D_J a = −b`, `D_J b = a`, that is `D_J q = i q` for `q = a + ib`.  On the third chaos `D_J`
  has eigenvalues `±3i, ±i`, and `D_J q = iq` characterises bidegree `(2, 1)`.
* Consequences (`Circular.gE_mul`, `gE_sq_eq`, `gE_pow_four`, `gE_pow_six`): `E ab = 0`,
  `E a² = E b²`, `E a⁴ = (3/8) E U²`, `E a⁶ = (5/16) E U³`, from `E (D_J P) = 0` applied to
  `P = a² , ab, a³b, ab³, a⁵b, a³b³, ab⁵`.
* The kernel `f = ∂³a / 6` (`cubicKernel`) of a cubic chaos `a` and the tensor contractions of
  the sixth-moment certificate (`tenS`, `tenH`, `tenV`, `tenT3`, `tenT4`, `tenQ`, `tenU2`,
  `tenDU`, `tenGa`, `tenTT`): full ordered-index sums, `G = FᵀF`, `C = FFᵀ`, `S = Sym₄ C`,
  `U = SF`, `D = FG`, `G_anti = (G + JGJ)/2`, and `S₋₋` the charge-`±2` block of `S`
  (`tt = ‖S₋₋‖²/2`).  `E a² = 6 ‖f‖²` is proved (`Chaos3.gE_sq_eq_kernel`).
* `TensorFacts E J a` collects the tensor facts of the paper proof that are **not yet
  formalised**: the two Wick identities for `κ₄`, `κ₆` and the eleven charge-sector inequalities
  (sums of squares, block traces, the coupled `G` test, the charge split).  Everything else
  `cumulant_bound` needs (positivity, `s > 0`, the two Cauchy–Schwarz bounds `‖U‖² ≤ √s √T₄`,
  `⟨D, U⟩ ≤ √V √‖U‖²`) is proved here.
* `sixth_moment_circular`: for a circular pair with `E a² = 1/2` and `TensorFacts E J a`,
  `E U³ ≤ 9m − 12 + C₆ (m − 2)^{3/2}`.
* Under the standard Gaussian measure (`Circular.gaussian_mul`, `Circular.gaussian_sq_eq`,
  `Circular.gaussian_sixth`): the normalisation `E b² = 1/2`, `E ab = 0` and the sixth-moment
  inequality in the integral form used by `Bridge.lean`.
-/

open MeasureTheory

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-! ### The rotation generator -/

/-- The rotation generator `D_J P = Σᵢⱼ Jⱼᵢ xⱼ ∂ᵢ P` of a real matrix `J`. -/
def rotD (J : ι → ι → ℝ) (P : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  ∑ i, ∑ j, C (J j i) * (X j * pderiv i P)

lemma rotD_add (J : ι → ι → ℝ) (P Q : MvPolynomial ι ℝ) :
    rotD J (P + Q) = rotD J P + rotD J Q := by
  simp only [rotD, map_add, mul_add, Finset.sum_add_distrib]

lemma rotD_sub (J : ι → ι → ℝ) (P Q : MvPolynomial ι ℝ) :
    rotD J (P - Q) = rotD J P - rotD J Q := by
  simp only [rotD, map_sub, mul_sub, Finset.sum_sub_distrib]

lemma rotD_neg (J : ι → ι → ℝ) (P : MvPolynomial ι ℝ) : rotD J (-P) = -rotD J P := by
  simp only [rotD, map_neg, mul_neg, Finset.sum_neg_distrib]

lemma rotD_C (J : ι → ι → ℝ) (c : ℝ) : rotD J (C c : MvPolynomial ι ℝ) = 0 := by
  simp [rotD]

lemma rotD_C_mul (J : ι → ι → ℝ) (c : ℝ) (P : MvPolynomial ι ℝ) :
    rotD J (C c * P) = C c * rotD J P := by
  simp only [rotD, pderiv_C_mul, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- Leibniz rule. -/
lemma rotD_mul (J : ι → ι → ℝ) (P Q : MvPolynomial ι ℝ) :
    rotD J (P * Q) = P * rotD J Q + Q * rotD J P := by
  simp only [rotD, pderiv_mul, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- `E (D_J P) = 0` for an antisymmetric `J` and a Gaussian expectation. -/
theorem gE_rotD {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E) {J : ι → ι → ℝ}
    (hJ : ∀ i j, J i j = -J j i) (P : MvPolynomial ι ℝ) : E (rotD J P) = 0 := by
  classical
  have e : E (rotD J P) = ∑ i, ∑ j, J j i * E (pderiv j (pderiv i P)) := by
    simp only [rotD, map_sum, C_mul_apply, hE.ibp]
  rw [e]
  have hc : ∀ i j, E (pderiv j (pderiv i P)) = E (pderiv i (pderiv j P)) := fun i j => by
    rw [pderiv_pderiv_comm]
  have h : (∑ i, ∑ j, J j i * E (pderiv j (pderiv i P)))
      = -(∑ i, ∑ j, J j i * E (pderiv j (pderiv i P))) := by
    conv_lhs => rw [Finset.sum_comm]
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [hJ i j, hc i j]
    ring
  linarith

/-! ### Circular pairs -/

/-- `q = a + ib` is a **circular cubic** for the complex structure `J` (`Jᵀ = −J`, `J² = −1`):
`D_J a = −b` and `D_J b = a`, that is `D_J q = i q`. -/
structure Circular (J : ι → ι → ℝ) (a b : MvPolynomial ι ℝ) : Prop where
  anti : ∀ i j, J i j = -J j i
  sq_diag : ∀ i, ∑ j, J i j * J j i = -1
  sq_off : ∀ i k, i ≠ k → ∑ j, J i j * J j k = 0
  da : rotD J a = -b
  db : rotD J b = a

section circular

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E) {J : ι → ι → ℝ}
  {a b : MvPolynomial ι ℝ} (hc : Circular J a b)
include hE hc

lemma Circular.gE_mul : E (a * b) = 0 := by
  have h := gE_rotD hE hc.anti (a * a)
  rw [rotD_mul, hc.da, show a * -b + a * -b = -(2 * (a * b)) by ring, map_neg,
    ofNat_mul_apply] at h
  linarith

lemma Circular.gE_sq_eq : E (a * a) = E (b * b) := by
  have h := gE_rotD hE hc.anti (a * b)
  rw [rotD_mul, hc.da, hc.db, show a * a + b * -b = a * a - b * b by ring, map_sub] at h
  linarith

/-- `E (D_J P) = 0` in the form `rotD J P = Q → E Q = 0`. -/
lemma Circular.gE_eq_zero_of_rotD {P Q : MvPolynomial ι ℝ} (h : rotD J P = Q) : E Q = 0 :=
  h ▸ gE_rotD hE hc.anti P

/-- `E a⁴ = (3/8) E U²`. -/
lemma Circular.gE_pow_four : E (a ^ 4) = 3 / 8 * E (radU a b ^ 2) := by
  have h1 : E (a ^ 4 - 3 * (a ^ 2 * b ^ 2)) = 0 :=
    hc.gE_eq_zero_of_rotD hE (P := a * (a * (a * b))) (by
      simp only [rotD_mul, hc.da, hc.db]; ring)
  have h2 : E (3 * (a ^ 2 * b ^ 2) - b ^ 4) = 0 :=
    hc.gE_eq_zero_of_rotD hE (P := b * (b * (a * b))) (by
      simp only [rotD_mul, hc.da, hc.db]; ring)
  have hU : E (radU a b ^ 2) = E (a ^ 4 + 2 * (a ^ 2 * b ^ 2) + b ^ 4) := by
    congr 1; unfold radU; ring
  rw [map_sub, ofNat_mul_apply] at h1 h2
  rw [hU, map_add, map_add, ofNat_mul_apply]
  linarith

/-- `E a⁶ = (5/16) E U³`. -/
lemma Circular.gE_pow_six : E (a ^ 6) = 5 / 16 * E (radU a b ^ 3) := by
  have h1 : E (a ^ 6 - 5 * (a ^ 4 * b ^ 2)) = 0 :=
    hc.gE_eq_zero_of_rotD hE (P := a * (a * (a * (a * (a * b))))) (by
      simp only [rotD_mul, hc.da, hc.db]; ring)
  have h2 : E (3 * (a ^ 4 * b ^ 2) - 3 * (a ^ 2 * b ^ 4)) = 0 :=
    hc.gE_eq_zero_of_rotD hE (P := (a * b) * ((a * b) * (a * b))) (by
      simp only [rotD_mul, hc.da, hc.db]; ring)
  have h3 : E (5 * (a ^ 2 * b ^ 4) - b ^ 6) = 0 :=
    hc.gE_eq_zero_of_rotD hE (P := b * (b * (b * (b * (a * b))))) (by
      simp only [rotD_mul, hc.da, hc.db]; ring)
  have hU : E (radU a b ^ 3) = E (a ^ 6 + 3 * (a ^ 4 * b ^ 2) + 3 * (a ^ 2 * b ^ 4) + b ^ 6) := by
    congr 1; unfold radU; ring
  rw [map_sub, ofNat_mul_apply] at h1 h3
  rw [map_sub, ofNat_mul_apply, ofNat_mul_apply] at h2
  rw [hU, map_add, map_add, map_add, ofNat_mul_apply, ofNat_mul_apply]
  linarith

end circular

/-! ### The kernel of a cubic chaos and the tensor contractions -/

/-- The constant third derivative `∂ᵢ∂ⱼ∂ₖ F` of a cubic chaos, as a real number. -/
def kern (F : MvPolynomial ι ℝ) (i j k : ι) : ℝ :=
  constantCoeff (pderiv i (pderiv j (pderiv k F)))

/-- The kernel `f = ∂³F / 6`, so that `F = Σ fᵢⱼₖ :xᵢxⱼxₖ:` for a cubic chaos `F`. -/
def cubicKernel (F : MvPolynomial ι ℝ) (i j k : ι) : ℝ := kern F i j k / 6

lemma Chaos3.pderiv3_eq {F : MvPolynomial ι ℝ} (hF : Chaos3 F) (i j k : ι) :
    pderiv i (pderiv j (pderiv k F)) = C (kern F i j k) := by
  obtain ⟨t, ht⟩ := hF.cubic i j k
  rw [kern, ht, constantCoeff_C]

omit [Fintype ι] in
lemma kern_rev (F : MvPolynomial ι ℝ) (i j k : ι) : kern F k j i = kern F i j k := by
  unfold kern
  rw [pderiv_pderiv_comm k j, pderiv_pderiv_comm k i, pderiv_pderiv_comm j i]

omit [Fintype ι] in
lemma kern_symm12 (F : MvPolynomial ι ℝ) (i j k : ι) : kern F i j k = kern F j i k := by
  unfold kern; rw [pderiv_pderiv_comm i j]

omit [Fintype ι] in
lemma cubicKernel_symm12 (F : MvPolynomial ι ℝ) (i j k : ι) :
    cubicKernel F i j k = cubicKernel F j i k := by
  unfold cubicKernel; rw [kern_symm12]

section tensors

variable (f : ι → ι → ι → ℝ) (J : ι → ι → ℝ)

/-- `G = FᵀF`: `G_{cd} = Σ_{ab} f_{abc} f_{abd}`. -/
def kerG (c d : ι) : ℝ := ∑ a, ∑ b, f a b c * f a b d

/-- `C = FFᵀ`: `C_{ab,cd} = Σ_e f_{abe} f_{cde}`. -/
def kerC (a b c d : ι) : ℝ := ∑ e, f a b e * f c d e

/-- `S = Sym₄ C`. -/
def kerS (a b c d : ι) : ℝ := (kerC f a b c d + kerC f a c b d + kerC f a d b c) / 3

/-- `S²` as an operator on pairs. -/
def kerS2 (a b c d : ι) : ℝ := ∑ e, ∑ e', kerS f a b e e' * kerS f e e' c d

/-- `U = SF`. -/
def kerU (a b c : ι) : ℝ := ∑ d, ∑ e, kerS f a b d e * f d e c

/-- `D = FG`. -/
def kerD (a b c : ι) : ℝ := ∑ e, f a b e * kerG f e c

/-- The part of `G` anticommuting with `J`: `(G + JGJ)/2`. -/
def kerGa (c d : ι) : ℝ := (kerG f c d + ∑ e, ∑ e', J c e * kerG f e e' * J e' d) / 2

/-- The charge-`±2` projection of `S` in its first pair: `(S − (J⊗J)S)/2`. -/
def kerSm (a b c d : ι) : ℝ :=
  (kerS f a b c d - ∑ e, ∑ e', J a e * J b e' * kerS f e e' c d) / 2

/-- The charge-`±2` projection of `S` in both pairs. -/
def kerSmm (a b c d : ι) : ℝ :=
  (kerSm f J a b c d - ∑ e, ∑ e', J c e * J d e' * kerSm f J a b e e') / 2

/-- `s = ‖G‖²`. -/
def tenS : ℝ := ∑ c, ∑ d, kerG f c d ^ 2

/-- `h = ‖S‖²`. -/
def tenH : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerS f a b c d ^ 2

/-- `V = tr G³`. -/
def tenV : ℝ := ∑ a, ∑ b, ∑ c, kerG f a b * kerG f b c * kerG f c a

/-- `T₃ = tr S³`. -/
def tenT3 : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerS2 f a b c d * kerS f c d a b

/-- `T₄ = tr S⁴ = ‖S²‖²`. -/
def tenT4 : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerS2 f a b c d ^ 2

/-- `Q = ⟨vec G, S vec G⟩`. -/
def tenQ : ℝ := ∑ a, ∑ b, ∑ c, ∑ d, kerG f a b * kerS f a b c d * kerG f c d

/-- `‖U‖² = ‖SF‖²`. -/
def tenU2 : ℝ := ∑ a, ∑ b, ∑ c, kerU f a b c ^ 2

/-- `⟨D, U⟩ = ⟨FG, SF⟩`. -/
def tenDU : ℝ := ∑ a, ∑ b, ∑ c, kerD f a b c * kerU f a b c

/-- `Ga = ‖G_anti‖²`. -/
def tenGa : ℝ := ∑ c, ∑ d, kerGa f J c d ^ 2

/-- `tt = ‖S₊₂,₊₂‖² = ½ ‖S₋₋‖²` (the two conjugate charged diagonal blocks of `S`). -/
def tenTT : ℝ := (∑ a, ∑ b, ∑ c, ∑ d, kerSmm f J a b c d ^ 2) / 2

lemma tenS_nonneg : 0 ≤ tenS f := by unfold tenS; positivity
lemma tenH_nonneg : 0 ≤ tenH f := by unfold tenH; positivity
lemma tenT4_nonneg : 0 ≤ tenT4 f := by unfold tenT4; positivity
lemma tenU2_nonneg : 0 ≤ tenU2 f := by unfold tenU2; positivity
lemma tenGa_nonneg : 0 ≤ tenGa f J := by unfold tenGa; positivity
lemma tenTT_nonneg : 0 ≤ tenTT f J := by unfold tenTT; positivity

/-- `Σₓ Σ_y Σ_z P x z Q y z = Σ_z (Σₓ P x z)(Σ_y Q y z)`. -/
lemma sum_mul_sum_factor {α β γ : Type*} [Fintype α] [Fintype β] [Fintype γ] (P : α → γ → ℝ)
    (Q : β → γ → ℝ) :
    ∑ x, ∑ y, ∑ z, P x z * Q y z = ∑ z, (∑ x, P x z) * ∑ y, Q y z :=
  calc ∑ x, ∑ y, ∑ z, P x z * Q y z = ∑ x, ∑ z, ∑ y, P x z * Q y z :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_comm
    _ = ∑ x, ∑ z, P x z * ∑ y, Q y z :=
        Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => (Finset.mul_sum _ _ _).symm
    _ = ∑ z, ∑ x, P x z * ∑ y, Q y z := Finset.sum_comm
    _ = ∑ z, (∑ x, P x z) * ∑ y, Q y z :=
        Finset.sum_congr rfl fun _ _ => (Finset.sum_mul _ _ _).symm

lemma sum_factor_212 (P : ι → ι → ι → ι → ℝ) (Q : ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ e, ∑ e', P a b e e' * Q c e e'
      = ∑ e, ∑ e', (∑ a, ∑ b, P a b e e') * ∑ c, Q c e e' := by
  have := sum_mul_sum_factor (α := ι × ι) (β := ι) (γ := ι × ι)
    (fun x z => P x.1 x.2 z.1 z.2) (fun y z => Q y z.1 z.2)
  simpa only [Fintype.sum_prod_type] using this

lemma sum_factor_222 (P Q : ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, ∑ e, ∑ e', P a b e e' * Q c d e e'
      = ∑ e, ∑ e', (∑ a, ∑ b, P a b e e') * ∑ c, ∑ d, Q c d e e' := by
  have := sum_mul_sum_factor (α := ι × ι) (β := ι × ι) (γ := ι × ι)
    (fun x z => P x.1 x.2 z.1 z.2) (fun y z => Q y.1 y.2 z.1 z.2)
  simpa only [Fintype.sum_prod_type] using this

lemma sum_factor_214 (P : ι → ι → ι → ι → ι → ι → ℝ) (Q : ι → ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, ∑ e, ∑ d', ∑ e', P a b d e d' e' * Q c d e d' e'
      = ∑ d, ∑ e, ∑ d', ∑ e', (∑ a, ∑ b, P a b d e d' e') * ∑ c, Q c d e d' e' := by
  have := sum_mul_sum_factor (α := ι × ι) (β := ι) (γ := ι × ι × ι × ι)
    (fun x z => P x.1 x.2 z.1 z.2.1 z.2.2.1 z.2.2.2) (fun y z => Q y z.1 z.2.1 z.2.2.1 z.2.2.2)
  simpa only [Fintype.sum_prod_type] using this

lemma kerG_symm (c d : ι) : kerG f c d = kerG f d c :=
  Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ => mul_comm _ _

lemma kerC_swap (a b c d : ι) : kerC f a b c d = kerC f c d a b :=
  Finset.sum_congr rfl fun _ _ => mul_comm _ _

lemma kerS_swap (hf : ∀ a b c, f a b c = f b a c) (a b c d : ι) :
    kerS f a b c d = kerS f c d a b := by
  unfold kerS
  rw [kerC_swap f a b c d, kerC_swap f a c b d, kerC_swap f a d b c]
  have e1 : kerC f b d a c = kerC f c a d b := by
    unfold kerC; exact Finset.sum_congr rfl fun e _ => by rw [hf b d, hf a c, mul_comm]
  have e2 : kerC f b c a d = kerC f c b d a := by
    unfold kerC; exact Finset.sum_congr rfl fun e _ => by rw [hf b c, hf a d]
  rw [e1, e2]

/-- `tr G³ = ‖FG‖²`. -/
lemma tenV_eq_sum_sq : tenV f = ∑ a, ∑ b, ∑ c, kerD f a b c ^ 2 := by
  have e1 : ∀ a b c, kerD f a b c ^ 2
      = ∑ e, ∑ e', (f a b e * f a b e') * (kerG f e c * kerG f e' c) := fun a b c => by
    rw [kerD, sq, Finset.sum_mul_sum]
    exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => by ring
  simp only [e1]
  rw [sum_factor_212 (fun a b e e' => f a b e * f a b e') (fun c e e' => kerG f e c * kerG f e' c)]
  unfold tenV
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
  rw [show (∑ x, ∑ y, f x y a * f x y b) = kerG f a b from rfl, Finset.mul_sum]
  exact Finset.sum_congr rfl fun c _ => by rw [kerG_symm f c a]; ring

lemma tenV_nonneg : 0 ≤ tenV f := by rw [tenV_eq_sum_sq]; positivity

/-- `‖C‖² = ‖G‖²`. -/
lemma tenS_eq_sum_kerC_sq : tenS f = ∑ a, ∑ b, ∑ c, ∑ d, kerC f a b c d ^ 2 := by
  have e1 : ∀ a b c d, kerC f a b c d ^ 2
      = ∑ e, ∑ e', (f a b e * f a b e') * (f c d e * f c d e') := fun a b c d => by
    rw [kerC, sq, Finset.sum_mul_sum]
    exact Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => by ring
  simp only [e1]
  rw [sum_factor_222 (fun a b e e' => f a b e * f a b e') (fun c d e e' => f c d e * f c d e')]
  unfold tenS
  refine Finset.sum_congr rfl fun e _ => Finset.sum_congr rfl fun e' _ => ?_
  rw [show (∑ x, ∑ y, f x y e * f x y e') = kerG f e e' from rfl, sq]

/-- `‖SF‖² = ⟨C, S²⟩`. -/
lemma tenU2_eq (hf : ∀ a b c, f a b c = f b a c) :
    tenU2 f = ∑ a, ∑ b, ∑ c, ∑ d, kerC f a b c d * kerS2 f a b c d := by
  have e1 : ∀ a b c, kerU f a b c ^ 2
      = ∑ d, ∑ e, ∑ d', ∑ e', (kerS f a b d e * kerS f a b d' e') * (f d e c * f d' e' c) :=
    fun a b c => by
    rw [kerU, sq, Finset.sum_mul_sum]
    refine Finset.sum_congr rfl fun d _ => ?_
    simp only [Finset.sum_mul_sum]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun _ _ => Finset.sum_congr rfl fun _ _ =>
      Finset.sum_congr rfl fun _ _ => by ring
  simp only [tenU2, e1]
  rw [sum_factor_214 (fun a b d e d' e' => kerS f a b d e * kerS f a b d' e')
    (fun c d e d' e' => f d e c * f d' e' c)]
  refine Finset.sum_congr rfl fun d _ => Finset.sum_congr rfl fun e _ =>
    Finset.sum_congr rfl fun d' _ => Finset.sum_congr rfl fun e' _ => ?_
  rw [mul_comm, show (∑ c, f d e c * f d' e' c) = kerC f d e d' e' from rfl]
  congr 1
  unfold kerS2
  exact Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun y _ => by rw [kerS_swap f hf x y d e]

lemma sum3_eq (g : ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, g a b c = ∑ p : ι × ι × ι, g p.1 p.2.1 p.2.2 := by
  simp only [Fintype.sum_prod_type]

lemma sum4_eq (g : ι → ι → ι → ι → ℝ) :
    ∑ a, ∑ b, ∑ c, ∑ d, g a b c d = ∑ p : ι × ι × ι × ι, g p.1 p.2.1 p.2.2.1 p.2.2.2 := by
  simp only [Fintype.sum_prod_type]

lemma le_sqrt_mul_sqrt_of_sq_le {x A B : ℝ} (hA : 0 ≤ A) (h : x ^ 2 ≤ A * B) :
    x ≤ √A * √B := by
  rw [← Real.sqrt_mul hA]
  exact le_trans (le_abs_self _) (Real.abs_le_sqrt h)

/-- `⟨D, U⟩ ≤ ‖D‖ ‖U‖ = √V √‖U‖²`. -/
lemma tenDU_le : tenDU f ≤ √(tenV f) * √(tenU2 f) := by
  refine le_sqrt_mul_sqrt_of_sq_le (tenV_nonneg f) ?_
  rw [tenV_eq_sum_sq, tenDU, tenU2, sum3_eq, sum3_eq, sum3_eq]
  exact Finset.sum_mul_sq_le_sq_mul_sq _ _ _

/-- `‖U‖² = ⟨C, S²⟩ ≤ ‖C‖ ‖S²‖ = √s √T₄`. -/
lemma tenU2_le (hf : ∀ a b c, f a b c = f b a c) : tenU2 f ≤ √(tenS f) * √(tenT4 f) := by
  refine le_sqrt_mul_sqrt_of_sq_le (tenS_nonneg f) ?_
  rw [tenU2_eq f hf, tenS_eq_sum_kerC_sq, tenT4, sum4_eq, sum4_eq, sum4_eq]
  exact Finset.sum_mul_sq_le_sq_mul_sq _ _ _

/-- `s > 0` as soon as `f ≠ 0`. -/
lemma tenS_pos (h : 0 < ∑ i, ∑ j, ∑ k, f i j k ^ 2) : 0 < tenS f := by
  by_contra hs
  push Not at hs
  have h0 : tenS f = 0 := le_antisymm hs (tenS_nonneg f)
  have hG : ∀ c d, kerG f c d = 0 := fun c d => by
    have h1 := (Finset.sum_eq_zero_iff_of_nonneg
      (fun c _ => Finset.sum_nonneg fun d _ => sq_nonneg (kerG f c d))).1 h0 c (Finset.mem_univ _)
    have h2 := (Finset.sum_eq_zero_iff_of_nonneg (fun d _ => sq_nonneg (kerG f c d))).1 h1 d
      (Finset.mem_univ _)
    exact pow_eq_zero_iff two_ne_zero |>.1 h2
  have hf : ∀ a b c, f a b c = 0 := fun a b c => by
    have h1 := hG c c
    unfold kerG at h1
    have h2 := (Finset.sum_eq_zero_iff_of_nonneg
      (fun a _ => Finset.sum_nonneg fun b _ => mul_self_nonneg (f a b c))).1 h1 a (Finset.mem_univ _)
    have h3 := (Finset.sum_eq_zero_iff_of_nonneg (fun b _ => mul_self_nonneg (f a b c))).1 h2 b
      (Finset.mem_univ _)
    exact mul_self_eq_zero.1 h3
  simp [hf] at h

end tensors

/-! ### The second moment is `6 ‖f‖²` -/

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

/-- `E Γ(G, G) = c E G²` for an eigenfunction `L G = −c G`. -/
lemma gE_gam_of_eigen {G : MvPolynomial ι ℝ} {c : ℝ} (hG : ouL G = -(C c * G)) :
    E (gam G G) = c * E (G * G) := by
  have h := gE_ouL hE (G * G)
  rw [ouL_mul, hG] at h
  have e : G * -(C c * G) + G * -(C c * G) + 2 * gam G G = 2 * gam G G - C (2 * c) * (G * G) := by
    simp only [map_mul, map_ofNat]; ring
  rw [e, map_sub, ofNat_mul_apply, C_mul_apply] at h
  linarith

variable [DecidableEq ι]

/-- **The second moment of a cubic chaos**: `E F² = 6 ‖f‖²` for the kernel `f = ∂³F/6`. -/
theorem Chaos3.gE_sq_eq_kernel {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    E (F * F) = 6 * ∑ i, ∑ j, ∑ k, cubicKernel F i j k ^ 2 := by
  have h3 : E (gam F F) = 3 * E (F * F) := hF.gE_gam hE
  have h2 : ∀ i, E (gam (pderiv i F) (pderiv i F)) = 2 * E (pderiv i F * pderiv i F) := fun i =>
    gE_gam_of_eigen hE (by rw [hF.ouL_pderiv, map_ofNat])
  have h1 : ∀ i j, E (gam (pderiv j (pderiv i F)) (pderiv j (pderiv i F)))
      = 1 * E (pderiv j (pderiv i F) * pderiv j (pderiv i F)) := fun i j =>
    gE_gam_of_eigen hE (by rw [hF.ouL_pderiv2, map_one, one_mul])
  have h0 : ∀ i j, E (gam (pderiv j (pderiv i F)) (pderiv j (pderiv i F)))
      = ∑ k, kern F k j i ^ 2 := fun i j => by
    unfold gam
    rw [map_sum]
    refine Finset.sum_congr rfl fun k _ => ?_
    rw [hF.pderiv3_eq, ← map_mul, gE_C hE, sq]
  have e : E (F * F) = ∑ i, ∑ j, ∑ k, kern F k j i ^ 2 / 6 := by
    have := h3
    unfold gam at this
    rw [map_sum] at this
    rw [show E (F * F) = (∑ i, E (pderiv i F * pderiv i F)) / 3 by linarith]
    rw [Finset.sum_div]
    refine Finset.sum_congr rfl fun i _ => ?_
    have hi := h2 i
    unfold gam at hi
    rw [map_sum] at hi
    rw [show E (pderiv i F * pderiv i F) = (∑ j, E (pderiv j (pderiv i F) * pderiv j (pderiv i F))) / 2
      by linarith]
    rw [Finset.sum_div, Finset.sum_div]
    refine Finset.sum_congr rfl fun j _ => ?_
    have hj := h1 i j
    rw [h0] at hj
    rw [show E (pderiv j (pderiv i F) * pderiv j (pderiv i F)) = ∑ k, kern F k j i ^ 2 by linarith]
    rw [Finset.sum_div, Finset.sum_div]
    refine Finset.sum_congr rfl fun k _ => ?_
    ring
  rw [e, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl fun k _ => ?_
  rw [kern_rev, cubicKernel]
  ring

end expectation

/-! ### The tensor facts and the sixth-moment inequality -/

/-- **The tensor facts of the sixth-moment certificate** for the kernel `f = ∂³a/6` of the real
part `a` of a circular cubic `q = a + ib` (`J` the complex structure): the two Wick identities
for the fourth and sixth cumulants of `a`, and the charge-sector inequalities of the paper proof
(the two sums of squares, `‖G_anti‖² ≤ s/2`, the cubic trace of `G`, the block traces of `S`,
the coupled `G` test and the charge split with `θ = thetaC`).  These are exactly the inputs of
`cumulant_bound` that are not yet formalised; every other input is proved in this file. -/
structure TensorFacts (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (J : ι → ι → ℝ) (a : MvPolynomial ι ℝ) :
    Prop where
  wick4 : E (a ^ 4) - 3 * E (a ^ 2) ^ 2
    = 1296 * (tenS (cubicKernel a) + 3 * tenH (cubicKernel a) / 2)
  wick6 : (E (a ^ 6) - 15 * E (a ^ 4) * E (a ^ 2) + 30 * E (a ^ 2) ^ 3) / 46656
    = 135 / 2 * tenT3 (cubicKernel a) - 20 * tenV (cubicKernel a)
      + 135 / 2 * tenQ (cubicKernel a) + 165 / 2 * tenDU (cubicKernel a)
      + 45 * tenU2 (cubicKernel a)
  sos1 : tenH (cubicKernel a) ≤ 37 / 39 * tenS (cubicKernel a)
  sos2 : 27 * tenH (cubicKernel a) - 5 * tenS (cubicKernel a) + 8 * tenGa (cubicKernel a) J
    ≤ 216 * tenTT (cubicKernel a) J
  anti : tenGa (cubicKernel a) J ≤ tenS (cubicKernel a) / 2
  cubicTrace : tenV (cubicKernel a) ^ 2 ≤ tenS (cubicKernel a) ^ 3
    * ((1 + 2 * (tenGa (cubicKernel a) J / tenS (cubicKernel a))) ^ 2
      * (1 - tenGa (cubicKernel a) J / tenS (cubicKernel a)) / 2)
  block : tenTT (cubicKernel a) J ≤ tenH (cubicKernel a) / 6
  trace3 : tenT3 (cubicKernel a)
    ≤ √(tenTT (cubicKernel a) J) * (9 * tenH (cubicKernel a) / 2 - 17 * tenTT (cubicKernel a) J)
  trace4 : tenT4 (cubicKernel a) ≤ tenH (cubicKernel a) ^ 2 / 2
    + 8 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 48 * tenTT (cubicKernel a) J ^ 2
  coupled : tenQ (cubicKernel a)
    ≤ (2 * tenS (cubicKernel a) - tenGa (cubicKernel a) J) * √(tenTT (cubicKernel a) J)
      + √(2 * tenGa (cubicKernel a) J * (tenS (cubicKernel a) - tenGa (cubicKernel a) J)
          * (tenH (cubicKernel a) - 6 * tenTT (cubicKernel a) J))
  A0nn : 0 ≤ 2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
    + (18 + 6 * kC) * tenTT (cubicKernel a) J
  A2nn : 0 ≤ tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
    - (18 + 6 * kC) * tenTT (cubicKernel a) J
  chargeSplit : tenU2 (cubicKernel a) ≤ thetaC * tenT3 (cubicKernel a)
    + √((2 * tenS (cubicKernel a) / 3 - 2 * tenH (cubicKernel a)
          + (18 + 6 * kC) * tenTT (cubicKernel a) J)
        * (3 * tenH (cubicKernel a) ^ 2 / 8 + tenH (cubicKernel a) * tenTT (cubicKernel a) J / 2
          + 3 * tenTT (cubicKernel a) J ^ 2 / 2))
    + √((tenS (cubicKernel a) / 3 + (2 + kC) * tenH (cubicKernel a)
          - (18 + 6 * kC) * tenTT (cubicKernel a) J)
        * (9 * tenH (cubicKernel a) * tenTT (cubicKernel a) J - 54 * tenTT (cubicKernel a) J ^ 2))

lemma four_rpow_three_halves : (4 : ℝ) ^ ((3 : ℝ) / 2) = 8 := by
  rw [rpow_three_halves (by norm_num), show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]
  norm_num

/-- **The sixth-moment inequality for circular cubics.**  For `q = a + ib` circular with
`a` in the third chaos and `E a² = 1/2`, under the tensor facts,
`E U³ ≤ 9m − 12 + C₆ (m − 2)^{3/2}` with `U = a² + b²`, `m = E U²`. -/
theorem sixth_moment_circular [DecidableEq ι] {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ}
    (hE : IsGaussianExpectation E) {J : ι → ι → ℝ} {a b : MvPolynomial ι ℝ} (ha : Chaos3 a)
    (hc : Circular J a b) (haa : E (a * a) = 1 / 2) (hT : TensorFacts E J a) :
    E (radU a b ^ 3) ≤ 9 * E (radU a b ^ 2) - 12 + C6 * (E (radU a b ^ 2) - 2) ^ ((3 : ℝ) / 2) := by
  have ha2 : E (a ^ 2) = 1 / 2 := by rw [sq]; exact haa
  have ha4 := hc.gE_pow_four hE
  have ha6 := hc.gE_pow_six hE
  -- `s > 0`
  have hs : 0 < tenS (cubicKernel a) := by
    apply tenS_pos
    have := ha.gE_sq_eq_kernel hE
    rw [haa] at this
    linarith
  -- the cumulant bound for `a`
  have hb := cumulant_bound (tenS (cubicKernel a)) (tenH (cubicKernel a)) (tenV (cubicKernel a))
    (tenT3 (cubicKernel a)) (tenT4 (cubicKernel a)) (tenQ (cubicKernel a))
    (tenU2 (cubicKernel a)) (tenDU (cubicKernel a)) (tenGa (cubicKernel a) J)
    (tenTT (cubicKernel a) J) (E (a ^ 4) - 3 * E (a ^ 2) ^ 2)
    (E (a ^ 6) - 15 * E (a ^ 4) * E (a ^ 2) + 30 * E (a ^ 2) ^ 3) hs hT.wick4 hT.wick6
    (tenH_nonneg _) hT.sos1 (tenGa_nonneg _ _) hT.anti (tenV_nonneg _) hT.cubicTrace
    (tenTT_nonneg _ _) hT.block hT.sos2 hT.trace3 (tenT4_nonneg _) hT.trace4 hT.coupled
    (tenU2_nonneg _) (tenU2_le _ (cubicKernel_symm12 a)) hT.A0nn hT.A2nn hT.chargeSplit
    (tenDU_le _)
  -- the cumulants in terms of `m` and `M₆`
  have hκ4 : E (a ^ 4) - 3 * E (a ^ 2) ^ 2 = 3 * (E (radU a b ^ 2) - 2) / 8 := by
    rw [ha4, ha2]; ring
  have hκ6 : E (a ^ 6) - 15 * E (a ^ 4) * E (a ^ 2) + 30 * E (a ^ 2) ^ 3
      = 5 / 16 * (E (radU a b ^ 3) - 9 * E (radU a b ^ 2) + 12) := by
    rw [ha6, ha4, ha2]; ring
  have hm : 2 ≤ E (radU a b ^ 2) := by
    have h0 : 0 ≤ 1296 * (tenS (cubicKernel a) + 3 * tenH (cubicKernel a) / 2) := by
      have := tenH_nonneg (cubicKernel a); positivity
    rw [← hT.wick4, hκ4] at h0
    linarith
  rw [hκ4, hκ6] at hb
  refine sixth_moment_complex (E (radU a b ^ 2)) (E (radU a b ^ 3))
    (4 * (3 * (E (radU a b ^ 2) - 2) / 8))
    (8 * (5 / 16 * (E (radU a b ^ 3) - 9 * E (radU a b ^ 2) + 12))) hm (by ring) (by ring) ?_
  have hx : 0 ≤ 3 * (E (radU a b ^ 2) - 2) / 8 := by linarith
  rw [Real.mul_rpow (by norm_num) hx, four_rpow_three_halves]
  linarith

/-! ### The standard Gaussian measure -/

section gaussian

variable {d : ℕ} {J : Fin d → Fin d → ℝ} {a b : MvPolynomial (Fin d) ℝ} (hc : Circular J a b)
include hc

/-- `E ab = 0` for a circular pair. -/
lemma Circular.gaussian_mul : ∫ x, eval x a * eval x b ∂(stdGaussian d) = 0 := by
  have h := hc.gE_mul (gaussE_isGaussianExpectation d)
  simpa only [gaussE_apply, map_mul] using h

/-- `E b² = E a²` for a circular pair. -/
lemma Circular.gaussian_sq_eq (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) :
    ∫ x, eval x b ^ 2 ∂(stdGaussian d) = 1 / 2 := by
  have h := hc.gE_sq_eq (gaussE_isGaussianExpectation d)
  simp only [gaussE_apply, map_mul] at h
  simp only [sq] at haa ⊢
  rw [← h, haa]

/-- **The sixth-moment inequality for the Gaussian law** of `U = |q|²`, `q = a + ib` circular. -/
theorem Circular.gaussian_sixth (ha : Chaos3 a)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2) (hT : TensorFacts (gaussE d) J a) :
    ∫ x, eval x (radU a b) ^ 3 ∂(stdGaussian d)
      ≤ 9 * (∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d)) - 12
        + C6 * (∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) - 2) ^ ((3 : ℝ) / 2) := by
  have haa' : gaussE d (a * a) = 1 / 2 := by
    rw [gaussE_apply, ← haa]; simp only [map_mul, sq]
  have h := sixth_moment_circular (gaussE_isGaussianExpectation d) ha hc haa' hT
  simpa only [gaussE_apply, map_pow] using h

end gaussian

end

end Grothe.LowerAnalytic
