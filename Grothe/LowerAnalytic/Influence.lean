import Grothe.LowerAnalytic.Fluctuation

/-!
# The quartic identity and the influence inequality for circular cubic chaos

Standalone groundwork for Conjecture K, in the framework of `Fluctuation.lean`; nothing here is
used by the certified bounds.

Let `a`, `b` be real polynomials in the third chaos (`Chaos3`) with `E a² = E b² = v/2` and
`E ab = 0`, so that `q = a + ib` is a circular complex cubic chaos element with `E|q|² = v`.  With
`U = a² + b² = |q|²` (`radU`), `P = a² − b²` and `Q = 2ab` (`radP`, `radQ`; `q² = P + iQ`), the
polynomials `U − v`, `P`, `Q` lie in the span of the chaoses 2, 4, 6, on which the generator `L`
acts with eigenvalues `−2, −4, −6`.  The spectral projections are

  `Π₂ = (L+4)(L+6)/8`,  `Π₄ = −(L+2)(L+6)/4`,  `Π₆ = (L+2)(L+4)/8`

(`proj2`, `proj4`, `proj6`), and `proj_eq` identifies them on any `G = G₂ + G₄ + G₆` with
eigenvectors `Gᵢ`.  The explicit components come from the polarised quantities
`gam2c a b = Σⱼ Γ(∂ⱼa, ∂ⱼb)` and `gam3c a b` (constant): for `a`, `b` in the third chaos

  `ab = comp6 + comp4 + comp2 + E(ab)`,
  `comp2 = ½ gam2c a b − 3E(ab)`,  `comp4 = Γ(a,b) − gam2c a b + 3E(ab)`,
  `comp6 = ab − Γ(a,b) + ½ gam2c a b − E(ab)`,

with `L compₖ = −k compₖ` (`comp2_eig`, `comp4_eig`, `comp6_eig`); `comp4 E F F = J4 E F`.

**The quartic identity** (`quartic_identity`): with `κ = E U² − 2v²` the fourth cumulant and

  `A = E (Π₂(U−v))²`,  `B = E (Π₂P)² + E (Π₂Q)²`,  `C = E (Π₄(U−v))²`,  `D = E (Π₄P)² + E (Π₄Q)²`,

  `3κ = 4A + 2B + 2C + D`.

In complex notation this is `3κ = 4‖Π₁₁|q|²‖² + 2‖Π₂₀q²‖² + 2‖Π₂₂|q|²‖² + ‖Π₃₁q²‖²`; the real pair
`(P, Q)` carries the complex norms without extra factors (checked on `q = X(|X|²−2)/√2`:
`κ = 42, A = 9, B = 8, C = 25, D = 24`, and on `q = X₁(|X₂|²−1)`: `κ = 16, A = 5, B = 2,
C = D = 8`).  The identity is the fluctuation identity of `Fluctuation.lean` (here in the scaled
form `fluctuation_identity_scaled`) read through the chaos decomposition: `S − 3v = Π₄ + 2Π₂` of
`U − v`, `A_rad = Π₄P + 2Π₂P`, `B_rad = Π₄Q + 2Π₂Q`, `J₄(a ± b) = Π₄(U−v) ± Π₄Q`, and chaos
components of different order are `E`-orthogonal (`gE_eigen_orth`).  The fluctuation bound
`E(S−3v)² + ½E(A_rad² + B_rad²) ≤ 3κ` is `4A + C + 2B + ½D ≤ 3κ`, weaker than the identity.

**The influence inequality** (`influence_bound`): `4A + 2B ≤ 3κ`, dropping the chaos-4 terms,
for an expectation nonnegative on squares.

**Directional pairing bounds** (`influence_pairing_U`, `influence_pairing_PQ`): for a directional
derivative `∂_α = Σᵢ αᵢ∂ᵢ`, the chaos-2 polynomials `∂_α a`, `∂_α b` pair with `U − v`, `P`, `Q`
only through `Π₂`, so with `I_α = E(∂_α a)² + E(∂_α b)²`

  `E[(U−v)∂_α a]² + E[(U−v)∂_α b]² ≤ A · I_α`,
  `(E[P∂_α a] + E[Q∂_α b])² + (E[Q∂_α a] − E[P∂_α b])² ≤ B · I_α`.

By Gaussian integration by parts `E[r q |q|²] = 2E[(U−v)∂_α q] + E[q² ∂_α q̄]` for the linear form
`r = Σ αᵢxᵢ`, so these two bounds give `|E[r q|q|²]|² ≤ (2√A + √B)² I_α` (`influence_pairing`,
in the form `E[r a U]² + E[r b U]² ≤ (2√A + √B)² I_α`).
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

lemma ouL_ofNat_mul (n : ℕ) [n.AtLeastTwo] (P : MvPolynomial ι ℝ) :
    ouL ((OfNat.ofNat n : MvPolynomial ι ℝ) * P)
      = (OfNat.ofNat n : MvPolynomial ι ℝ) * ouL P := by
  change ouL ((n : MvPolynomial ι ℝ) * P) = (n : MvPolynomial ι ℝ) * ouL P
  rw [← nsmul_eq_mul, map_nsmul, nsmul_eq_mul]

lemma ouL_C_mul (c : ℝ) (P : MvPolynomial ι ℝ) : ouL (C c * P) = C c * ouL P := by
  rw [C_mul', C_mul', map_smul]

omit [Fintype ι] in
lemma two_mul_C_half : (2 : MvPolynomial ι ℝ) * C (1 / 2) = 1 := by
  rw [show (2 : MvPolynomial ι ℝ) = C 2 from (map_ofNat C 2).symm, ← C_mul]
  norm_num

omit [Fintype ι] in
lemma C_two_mul (c : ℝ) : (C (2 * c) : MvPolynomial ι ℝ) = 2 * C c := by
  rw [C_mul, map_ofNat]

omit [Fintype ι] in
lemma C_six_mul (c : ℝ) : (C (6 * c) : MvPolynomial ι ℝ) = 6 * C c := by
  rw [C_mul, map_ofNat]

/-! ### Polarised second and third carré du champ -/

/-- `Σⱼ Γ(∂ⱼa, ∂ⱼb)`, the polarisation of `gam2`. -/
def gam2c (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := ∑ j, gam (pderiv j a) (pderiv j b)

/-- `Σⱼ Σᵢ Γ(∂ᵢ∂ⱼa, ∂ᵢ∂ⱼb)`, the polarisation of `gam3`. -/
def gam3c (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  ∑ j, ∑ i, gam (pderiv i (pderiv j a)) (pderiv i (pderiv j b))

lemma gam2c_self (F : MvPolynomial ι ℝ) : gam2c F F = gam2 F := rfl

lemma gam2c_comm (a b : MvPolynomial ι ℝ) : gam2c a b = gam2c b a :=
  Finset.sum_congr rfl fun _ _ => gam_comm _ _

lemma gam2c_add_self (a b : MvPolynomial ι ℝ) :
    gam2c (a + b) (a + b) = gam2c a a + 2 * gam2c a b + gam2c b b := by
  unfold gam2c
  rw [Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [map_add, gam_add_self]

lemma gam2c_sub_self (a b : MvPolynomial ι ℝ) :
    gam2c (b - a) (b - a) = gam2c a a - 2 * gam2c a b + gam2c b b := by
  unfold gam2c
  rw [Finset.mul_sum, ← Finset.sum_sub_distrib, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [map_sub, gam_sub_self]

lemma gam3c_const {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b) :
    ∃ τ : ℝ, gam3c a b = C τ := by
  choose t ht using ha.cubic
  choose t' ht' using hb.cubic
  exact ⟨∑ j, ∑ i, ∑ k, t k i j * t' k i j, by simp only [gam3c, gam, ht, ht', map_sum, map_mul]⟩

lemma Chaos3.ouL_mul_chaos3 {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b) :
    ouL (a * b) = 2 * gam a b - 6 * (a * b) := by
  rw [ouL_mul, ha.eig, hb.eig]
  ring

section eigen

variable [DecidableEq ι] {a b : MvPolynomial ι ℝ}

lemma Chaos3.ouL_gam_cross (ha : Chaos3 a) (hb : Chaos3 b) :
    ouL (gam a b) = 2 * gam2c a b - 4 * gam a b := by
  unfold gam2c
  rw [show gam a b = ∑ i, pderiv i a * pderiv i b from rfl, map_sum, Finset.mul_sum,
    Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [ouL_mul, ha.ouL_pderiv, hb.ouL_pderiv]
  ring

lemma Chaos3.ouL_gam2c (ha : Chaos3 a) (hb : Chaos3 b) :
    ouL (gam2c a b) = 2 * gam3c a b - 2 * gam2c a b := by
  unfold gam2c gam3c
  rw [map_sum, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [show gam (pderiv j a) (pderiv j b) = ∑ i, pderiv i (pderiv j a) * pderiv i (pderiv j b)
    from rfl, map_sum, Finset.mul_sum, Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [ouL_mul, ha.ouL_pderiv2, hb.ouL_pderiv2]
  ring

end eigen

/-! ### Spectral projections -/

/-- `Π₂ = (L+4)(L+6)/8`, the projection on the second chaos (on the span of chaos 2, 4, 6). -/
def proj2 (G : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  C (1 / 8) * (ouL (ouL G) + 10 * ouL G + 24 * G)

/-- `Π₄ = −(L+2)(L+6)/4`, the projection on the fourth chaos. -/
def proj4 (G : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  -(C (1 / 4) * (ouL (ouL G) + 8 * ouL G + 12 * G))

/-- `Π₆ = (L+2)(L+4)/8`, the projection on the sixth chaos. -/
def proj6 (G : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  C (1 / 8) * (ouL (ouL G) + 6 * ouL G + 8 * G)

/-- On `G = G₂ + G₄ + G₆` with `L Gₖ = −k Gₖ`, the spectral polynomials pick out the components. -/
lemma proj_eq {G G2 G4 G6 : MvPolynomial ι ℝ} (h : G = G2 + G4 + G6) (h2 : ouL G2 = -(2 * G2))
    (h4 : ouL G4 = -(4 * G4)) (h6 : ouL G6 = -(6 * G6)) :
    proj2 G = G2 ∧ proj4 G = G4 ∧ proj6 G = G6 := by
  have hL : ouL G = -(2 * G2) - 4 * G4 - 6 * G6 := by
    rw [h, map_add, map_add, h2, h4, h6]; ring
  have hLL : ouL (ouL G) = 4 * G2 + 16 * G4 + 36 * G6 := by
    rw [hL, map_sub, map_sub, map_neg, ouL_ofNat_mul, ouL_ofNat_mul, ouL_ofNat_mul, h2, h4, h6]
    ring
  have c8 : (C 8 : MvPolynomial ι ℝ) = 8 := map_ofNat C 8
  have c4 : (C 4 : MvPolynomial ι ℝ) = 4 := map_ofNat C 4
  refine ⟨?_, ?_, ?_⟩
  · unfold proj2
    rw [hLL, hL, h, show 4 * G2 + 16 * G4 + 36 * G6 + 10 * (-(2 * G2) - 4 * G4 - 6 * G6)
        + 24 * (G2 + G4 + G6) = C 8 * G2 by rw [c8]; ring, ← mul_assoc, ← C_mul]
    norm_num
  · unfold proj4
    rw [hLL, hL, h, show 4 * G2 + 16 * G4 + 36 * G6 + 8 * (-(2 * G2) - 4 * G4 - 6 * G6)
        + 12 * (G2 + G4 + G6) = C 4 * -G4 by rw [c4]; ring, ← mul_assoc, ← C_mul]
    norm_num
  · unfold proj6
    rw [hLL, hL, h, show 4 * G2 + 16 * G4 + 36 * G6 + 6 * (-(2 * G2) - 4 * G4 - 6 * G6)
        + 8 * (G2 + G4 + G6) = C 8 * G6 by rw [c8]; ring, ← mul_assoc, ← C_mul]
    norm_num

lemma eigen_add {X Y : MvPolynomial ι ℝ} (n : ℕ) [n.AtLeastTwo]
    (hX : ouL X = -((OfNat.ofNat n : MvPolynomial ι ℝ) * X))
    (hY : ouL Y = -((OfNat.ofNat n : MvPolynomial ι ℝ) * Y)) :
    ouL (X + Y) = -((OfNat.ofNat n : MvPolynomial ι ℝ) * (X + Y)) := by
  rw [map_add, hX, hY]; ring

lemma eigen_sub {X Y : MvPolynomial ι ℝ} (n : ℕ) [n.AtLeastTwo]
    (hX : ouL X = -((OfNat.ofNat n : MvPolynomial ι ℝ) * X))
    (hY : ouL Y = -((OfNat.ofNat n : MvPolynomial ι ℝ) * Y)) :
    ouL (X - Y) = -((OfNat.ofNat n : MvPolynomial ι ℝ) * (X - Y)) := by
  rw [map_sub, hX, hY]; ring

lemma eigen_two_mul {X : MvPolynomial ι ℝ} (n : ℕ) [n.AtLeastTwo]
    (hX : ouL X = -((OfNat.ofNat n : MvPolynomial ι ℝ) * X)) :
    ouL (2 * X) = -((OfNat.ofNat n : MvPolynomial ι ℝ) * (2 * X)) := by
  rw [ouL_ofNat_mul, hX]; ring

/-! ### Chaos components of a product -/

/-- `P = a² − b²`, the real part of `q²`. -/
def radP (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := a * a - b * b

/-- `Q = 2ab`, the imaginary part of `q²`. -/
def radQ (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := 2 * (a * b)

omit [Fintype ι] in
lemma radP_sq_add_radQ_sq (a b : MvPolynomial ι ℝ) :
    radP a b * radP a b + radQ a b * radQ a b = radU a b * radU a b := by
  unfold radP radQ radU; ring

/-- The second-chaos component of `ab`, for `a`, `b` in the third chaos. -/
def comp2 (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  C (1 / 2) * gam2c a b - C (3 * E (a * b))

/-- The fourth-chaos component of `ab`, for `a`, `b` in the third chaos. -/
def comp4 (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  gam a b - gam2c a b + C (3 * E (a * b))

/-- The sixth-chaos component of `ab`, for `a`, `b` in the third chaos. -/
def comp6 (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (a b : MvPolynomial ι ℝ) : MvPolynomial ι ℝ :=
  a * b - gam a b + C (1 / 2) * gam2c a b - C (E (a * b))

lemma comp4_self (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (F : MvPolynomial ι ℝ) :
    comp4 E F F = J4 E F := rfl

/-- `ab = comp6 + comp4 + comp2 + E(ab)`. -/
lemma mul_eq_comps (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (a b : MvPolynomial ι ℝ) :
    a * b = comp6 E a b + comp4 E a b + comp2 E a b + C (E (a * b)) := by
  have hh := two_mul_C_half (ι := ι)
  unfold comp6 comp4 comp2
  linear_combination (-(gam2c a b)) * hh

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

/-- Eigenvectors with distinct eigenvalues are `E`-orthogonal. -/
lemma gE_eigen_orth {X Y : MvPolynomial ι ℝ} (n m : ℕ) [n.AtLeastTwo] [m.AtLeastTwo]
    (hnm : (OfNat.ofNat n : ℝ) ≠ OfNat.ofNat m)
    (hX : ouL X = -((OfNat.ofNat n : MvPolynomial ι ℝ) * X))
    (hY : ouL Y = -((OfNat.ofNat m : MvPolynomial ι ℝ) * Y)) : E (X * Y) = 0 := by
  have h := gE_mul_ouL_comm hE X Y
  rw [hX, hY, show X * -((OfNat.ofNat m : MvPolynomial ι ℝ) * Y)
      = -((OfNat.ofNat m : MvPolynomial ι ℝ) * (X * Y)) by ring,
    show Y * -((OfNat.ofNat n : MvPolynomial ι ℝ) * X)
      = -((OfNat.ofNat n : MvPolynomial ι ℝ) * (X * Y)) by ring,
    map_neg, map_neg, ofNat_mul_apply, ofNat_mul_apply] at h
  have h' : ((OfNat.ofNat n : ℝ) - OfNat.ofNat m) * E (X * Y) = 0 := by linarith
  exact (mul_eq_zero.mp h').resolve_left (sub_ne_zero.mpr hnm)

/-- Eigenvectors with nonzero eigenvalue have mean zero. -/
lemma gE_eigen_mean {X : MvPolynomial ι ℝ} (n : ℕ) [n.AtLeastTwo]
    (hn : (OfNat.ofNat n : ℝ) ≠ 0)
    (hX : ouL X = -((OfNat.ofNat n : MvPolynomial ι ℝ) * X)) : E X = 0 := by
  have h := gE_ouL hE X
  rw [hX, map_neg, ofNat_mul_apply, neg_eq_zero] at h
  exact (mul_eq_zero.mp h).resolve_left hn

variable [DecidableEq ι] {a b : MvPolynomial ι ℝ}

lemma gE_gam2c (ha : Chaos3 a) (hb : Chaos3 b) : E (gam2c a b) = 6 * E (a * b) := by
  have h := gE_ouL hE (gam a b)
  rw [ha.ouL_gam_cross hb, map_sub, ofNat_mul_apply, ofNat_mul_apply] at h
  have h2 : E (gam a b) = 3 * E (a * b) := hb.gE_gam_cross hE
  linarith

lemma gam3c_eq (ha : Chaos3 a) (hb : Chaos3 b) : gam3c a b = C (6 * E (a * b)) := by
  obtain ⟨τ, hτ⟩ := gam3c_const ha hb
  have h := gE_ouL hE (gam2c a b)
  rw [ha.ouL_gam2c hb, hτ, map_sub, ofNat_mul_apply, ofNat_mul_apply, gE_C hE] at h
  have e : τ = 6 * E (a * b) := by linarith [gE_gam2c hE ha hb]
  rw [hτ, e]

lemma comp2_eig (ha : Chaos3 a) (hb : Chaos3 b) : ouL (comp2 E a b) = -(2 * comp2 E a b) := by
  have hh := two_mul_C_half (ι := ι)
  have h6 : (C (6 * E (a * b)) : MvPolynomial ι ℝ) = 2 * C (3 * E (a * b)) := by
    rw [← C_two_mul]; congr 1; ring
  unfold comp2
  rw [map_sub, ouL_C_mul, ha.ouL_gam2c hb, gam3c_eq hE ha hb, ouL_C]
  linear_combination C (6 * E (a * b)) * hh + h6

lemma comp4_eig (ha : Chaos3 a) (hb : Chaos3 b) : ouL (comp4 E a b) = -(4 * comp4 E a b) := by
  have h6 : (C (6 * E (a * b)) : MvPolynomial ι ℝ) = 2 * C (3 * E (a * b)) := by
    rw [← C_two_mul]; congr 1; ring
  unfold comp4
  rw [map_add, map_sub, ha.ouL_gam_cross hb, ha.ouL_gam2c hb, gam3c_eq hE ha hb, ouL_C]
  linear_combination (-2 : MvPolynomial ι ℝ) * h6

lemma comp6_eig (ha : Chaos3 a) (hb : Chaos3 b) : ouL (comp6 E a b) = -(6 * comp6 E a b) := by
  have hh := two_mul_C_half (ι := ι)
  have h6 := C_six_mul (ι := ι) (E (a * b))
  unfold comp6
  rw [map_sub, map_add, map_sub, ouL_C_mul, ha.ouL_mul_chaos3 hb, ha.ouL_gam_cross hb,
    ha.ouL_gam2c hb, gam3c_eq hE ha hb, ouL_C]
  linear_combination (2 * gam2c a b + C (6 * E (a * b))) * hh + h6

/-! ### The quartic identity -/

/-- **The fluctuation identity**, scaled: for a pair in the third chaos with `E a² = E b² = v/2`,
`E ab = 0` (the case `v = 1` is `fluctuation_identity`). -/
theorem fluctuation_identity_scaled {v : ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    12 * (E (radU a b * radU a b) - 2 * v ^ 2)
      - 4 * E ((radS a b - C (3 * v)) * (radS a b - C (3 * v)))
      - 2 * (E (radA a b * radA a b) + E (radB a b * radB a b))
      = 4 * E (J4 E a * J4 E a) + E (J4 E (a + b) * J4 E (a + b))
        + 4 * E (J4 E b * J4 E b) + E (J4 E (b - a) * J4 E (b - a)) := by
  have Ra := chaos3_remainder hE ha
  have Rb := chaos3_remainder hE hb
  have Rp := chaos3_remainder hE (ha.add hb)
  have Rm := chaos3_remainder hE (ha.sub hb)
  have sp : E ((a + b) * (a + b)) = v := by
    rw [show (a + b) * (a + b) = a * a + 2 * (a * b) + b * b by ring, map_add, map_add,
      ofNat_mul_apply, haa, hbb, hab]
    ring
  have sm : E ((b - a) * (b - a)) = v := by
    rw [show (b - a) * (b - a) = a * a - 2 * (a * b) + b * b by ring, map_add, map_sub,
      ofNat_mul_apply, haa, hbb, hab]
    ring
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
  rw [gE_sub_C_sq hE (radS a b) (3 * v)]
  unfold radU radS radA radB
  rw [show (a * a + b * b) * (a * a + b * b)
        = a * a * (a * a) + 2 * (a * a * (b * b)) + b * b * (b * b) by ring,
    show (gam a a + gam b b) * (gam a a + gam b b)
        = gam a a * gam a a + 2 * (gam a a * gam b b) + gam b b * gam b b by ring,
    show (gam a a - gam b b) * (gam a a - gam b b)
        = gam a a * gam a a - 2 * (gam a a * gam b b) + gam b b * gam b b by ring,
    show 2 * gam a b * (2 * gam a b) = 4 * (gam a b * gam a b) by ring]
  simp only [map_add, map_sub, ofNat_mul_apply E 2, ofNat_mul_apply E 4, hp, hq]
  linarith

/-- **The quartic identity** `3κ = 4A + 2B + 2C + D` for a circular pair in the third chaos with
`E a² = E b² = v/2`, `E ab = 0`: `κ = E U² − 2v²`, `A = E(Π₂(U−v))²`, `B = E(Π₂P)² + E(Π₂Q)²`,
`C = E(Π₄(U−v))²`, `D = E(Π₄P)² + E(Π₄Q)²`. -/
theorem quartic_identity {v : ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    3 * (E (radU a b * radU a b) - 2 * v ^ 2)
      = 4 * E (proj2 (radU a b - C v) * proj2 (radU a b - C v))
        + 2 * (E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b)))
        + 2 * E (proj4 (radU a b - C v) * proj4 (radU a b - C v))
        + (E (proj4 (radP a b) * proj4 (radP a b)) + E (proj4 (radQ a b) * proj4 (radQ a b))) := by
  -- the components and their eigen-equations
  have e2a := comp2_eig hE ha ha
  have e2b := comp2_eig hE hb hb
  have e2c := comp2_eig hE ha hb
  have e4a := comp4_eig hE ha ha
  have e4b := comp4_eig hE hb hb
  have e4c := comp4_eig hE ha hb
  have e6a := comp6_eig hE ha ha
  have e6b := comp6_eig hE hb hb
  have e6c := comp6_eig hE ha hb
  obtain ⟨S2, hS2⟩ : ∃ X, X = comp2 E a a + comp2 E b b := ⟨_, rfl⟩
  obtain ⟨S4, hS4⟩ : ∃ X, X = comp4 E a a + comp4 E b b := ⟨_, rfl⟩
  obtain ⟨S6, hS6⟩ : ∃ X, X = comp6 E a a + comp6 E b b := ⟨_, rfl⟩
  obtain ⟨D2, hD2⟩ : ∃ X, X = comp2 E a a - comp2 E b b := ⟨_, rfl⟩
  obtain ⟨D4, hD4⟩ : ∃ X, X = comp4 E a a - comp4 E b b := ⟨_, rfl⟩
  obtain ⟨D6, hD6⟩ : ∃ X, X = comp6 E a a - comp6 E b b := ⟨_, rfl⟩
  obtain ⟨Q2, hQ2⟩ : ∃ X, X = 2 * comp2 E a b := ⟨_, rfl⟩
  obtain ⟨Q4, hQ4⟩ : ∃ X, X = 2 * comp4 E a b := ⟨_, rfl⟩
  obtain ⟨Q6, hQ6⟩ : ∃ X, X = 2 * comp6 E a b := ⟨_, rfl⟩
  have eS2 : ouL S2 = -(2 * S2) := by rw [hS2]; exact eigen_add 2 e2a e2b
  have eS4 : ouL S4 = -(4 * S4) := by rw [hS4]; exact eigen_add 4 e4a e4b
  have eS6 : ouL S6 = -(6 * S6) := by rw [hS6]; exact eigen_add 6 e6a e6b
  have eD2 : ouL D2 = -(2 * D2) := by rw [hD2]; exact eigen_sub 2 e2a e2b
  have eD4 : ouL D4 = -(4 * D4) := by rw [hD4]; exact eigen_sub 4 e4a e4b
  have eD6 : ouL D6 = -(6 * D6) := by rw [hD6]; exact eigen_sub 6 e6a e6b
  have eQ2 : ouL Q2 = -(2 * Q2) := by rw [hQ2]; exact eigen_two_mul 2 e2c
  have eQ4 : ouL Q4 = -(4 * Q4) := by rw [hQ4]; exact eigen_two_mul 4 e4c
  have eQ6 : ouL Q6 = -(6 * Q6) := by rw [hQ6]; exact eigen_two_mul 6 e6c
  -- the decompositions of `U − v`, `P`, `Q`
  have ca := mul_eq_comps E a a
  have cb := mul_eq_comps E b b
  have cc := mul_eq_comps E a b
  rw [haa] at ca
  rw [hbb] at cb
  rw [hab, C_0, add_zero] at cc
  have hc : (C (v / 2) : MvPolynomial ι ℝ) + C (v / 2) - C v = 0 := by
    rw [← C_add, ← C_sub, show v / 2 + v / 2 - v = 0 by ring, C_0]
  have dU : radU a b - C v = S2 + S4 + S6 := by
    rw [hS6, hS4, hS2]; unfold radU; linear_combination ca + cb + hc
  have dP : radP a b = D2 + D4 + D6 := by
    rw [hD6, hD4, hD2]; unfold radP; linear_combination ca - cb
  have dQ : radQ a b = Q2 + Q4 + Q6 := by
    rw [hQ6, hQ4, hQ2]; unfold radQ; linear_combination 2 * cc
  obtain ⟨pU2, pU4, -⟩ := proj_eq dU eS2 eS4 eS6
  obtain ⟨pP2, pP4, -⟩ := proj_eq dP eD2 eD4 eD6
  obtain ⟨pQ2, pQ4, -⟩ := proj_eq dQ eQ2 eQ4 eQ6
  rw [pU2, pU4, pP2, pP4, pQ2, pQ4]
  -- the fluctuation quantities through the components
  have hh := two_mul_C_half (ι := ι)
  have h3 : (C (3 * v) : MvPolynomial ι ℝ) = 2 * C (3 * (v / 2)) := by
    rw [← C_two_mul]; congr 1; ring
  have h30 : (C (3 * 0) : MvPolynomial ι ℝ) = 0 := by rw [mul_zero, C_0]
  have sp : E ((a + b) * (a + b)) = v := by
    rw [show (a + b) * (a + b) = a * a + 2 * (a * b) + b * b by ring, map_add, map_add,
      ofNat_mul_apply, haa, hbb, hab]
    ring
  have sm : E ((b - a) * (b - a)) = v := by
    rw [show (b - a) * (b - a) = a * a - 2 * (a * b) + b * b by ring, map_add, map_sub,
      ofNat_mul_apply, haa, hbb, hab]
    ring
  have hS : radS a b - C (3 * v) = S4 + 2 * S2 := by
    rw [hS4, hS2]; unfold radS comp4 comp2; rw [haa, hbb]
    linear_combination (-1 : MvPolynomial ι ℝ) * h3 - (gam2c a a + gam2c b b) * hh
  have hA : radA a b = D4 + 2 * D2 := by
    rw [hD4, hD2]; unfold radA comp4 comp2; rw [haa, hbb]
    linear_combination (-(gam2c a a - gam2c b b)) * hh
  have hB : radB a b = Q4 + 2 * Q2 := by
    rw [hQ4, hQ2]; unfold radB comp4 comp2; rw [hab]
    linear_combination (-2 * gam2c a b) * hh + 2 * h30
  have hJp : J4 E (a + b) = S4 + Q4 := by
    rw [hS4, hQ4]; unfold J4 comp4
    rw [← gam2c_self, gam2c_add_self, gam_add_self, sp, haa, hbb, hab]
    linear_combination h3 - 2 * h30
  have hJm : J4 E (b - a) = S4 - Q4 := by
    rw [hS4, hQ4]; unfold J4 comp4
    rw [← gam2c_self, gam2c_sub_self, gam_sub_self, sm, haa, hbb, hab]
    linear_combination h3 + 2 * h30
  have f1 : E ((radS a b - C (3 * v)) * (radS a b - C (3 * v))) = E (S4 * S4) + 4 * E (S2 * S2) := by
    rw [hS, show (S4 + 2 * S2) * (S4 + 2 * S2) = S4 * S4 + 4 * (S2 * S2) + 4 * (S4 * S2) by ring,
      map_add, map_add, ofNat_mul_apply, ofNat_mul_apply,
      gE_eigen_orth hE 4 2 (by norm_num) eS4 eS2]
    ring
  have f2 : E (radA a b * radA a b) = E (D4 * D4) + 4 * E (D2 * D2) := by
    rw [hA, show (D4 + 2 * D2) * (D4 + 2 * D2) = D4 * D4 + 4 * (D2 * D2) + 4 * (D4 * D2) by ring,
      map_add, map_add, ofNat_mul_apply, ofNat_mul_apply,
      gE_eigen_orth hE 4 2 (by norm_num) eD4 eD2]
    ring
  have f3 : E (radB a b * radB a b) = E (Q4 * Q4) + 4 * E (Q2 * Q2) := by
    rw [hB, show (Q4 + 2 * Q2) * (Q4 + 2 * Q2) = Q4 * Q4 + 4 * (Q2 * Q2) + 4 * (Q4 * Q2) by ring,
      map_add, map_add, ofNat_mul_apply, ofNat_mul_apply,
      gE_eigen_orth hE 4 2 (by norm_num) eQ4 eQ2]
    ring
  have f4 : 4 * E (J4 E a * J4 E a) + 4 * E (J4 E b * J4 E b)
      = 2 * E (S4 * S4) + 2 * E (D4 * D4) := by
    rw [← comp4_self, ← comp4_self, ← ofNat_mul_apply E 2, ← ofNat_mul_apply E 2, ← map_add,
      hS4, hD4, ← ofNat_mul_apply E 4, ← ofNat_mul_apply E 4, ← map_add]
    exact congrArg E (by ring)
  have f5 : E (J4 E (a + b) * J4 E (a + b)) + E (J4 E (b - a) * J4 E (b - a))
      = 2 * E (S4 * S4) + 2 * E (Q4 * Q4) := by
    rw [hJp, hJm, ← ofNat_mul_apply E 2, ← ofNat_mul_apply E 2, ← map_add, ← map_add]
    exact congrArg E (by ring)
  have F := fluctuation_identity_scaled hE ha hb haa hbb hab
  linarith

/-- **The influence inequality** `4A + 2B ≤ 3κ`: for a circular pair in the third chaos and an
expectation nonnegative on squares,
`4 E(Π₂(U−v))² + 2 (E(Π₂P)² + E(Π₂Q)²) ≤ 3 (E U² − 2v²)`. -/
theorem influence_bound (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) {v : ℝ} (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    4 * E (proj2 (radU a b - C v) * proj2 (radU a b - C v))
      + 2 * (E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b)))
      ≤ 3 * (E (radU a b * radU a b) - 2 * v ^ 2) := by
  have h := quartic_identity hE ha hb haa hbb hab
  have h1 := hpos (proj4 (radU a b - C v))
  have h2 := hpos (proj4 (radP a b))
  have h3 := hpos (proj4 (radQ a b))
  linarith

end expectation

end

end Grothe.LowerAnalytic
