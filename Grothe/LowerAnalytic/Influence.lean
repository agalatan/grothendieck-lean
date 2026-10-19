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
C = D = 8`).  The identity is the fluctuation identity of `Fluctuation.lean` read through the
chaos decomposition: `S − 3v = Π₄ + 2Π₂` of `U − v`, `A_rad = Π₄P + 2Π₂P`,
`B_rad = Π₄Q + 2Π₂Q`, `J₄(a ± b) = Π₄(U−v) ± Π₄Q`, and chaos components of different order are `E`-orthogonal (`gE_eigen_orth`).  The fluctuation bound
`E(S−3v)² + ½E(A_rad² + B_rad²) ≤ 3κ` is `4A + C + 2B + ½D ≤ 3κ`, weaker than the identity.

**The exact Stein slack** (`stein_slack`, `stein_energy_gap`): the chaos decompositions
`radS − 3v = 2Π₂(U−v) + Π₄(U−v)`, `radA = 2Π₂P + Π₄P`, `radB = 2Π₂Q + Π₄Q` (`radS_eq_proj`,
`radA_eq_proj`, `radB_eq_proj`; the sixth chaos drops out of `Γ(q,q̄)` and `Γ(q,q)`) give
`Var(radS) = 4A + C` (`var_radS`) and `E(radA² + radB²) = 4B + D` (`gE_radA_radB`), hence

  `E(S−3v)² + ½E(A_rad² + B_rad²) = 3κ − (2C + D)/2`,
  `κ/3 − (Var(S)/9 + E(A_rad² + B_rad²)/18) = (2C + D)/18`,

the exact form of the hypothesis H1 (`fluctuation_bound` is the case `2C + D ≥ 0`).  On the
Wick cubic the Stein energy is `89/9`.

**The influence inequality** (`influence_bound`): `4A + 2B ≤ 3κ`, dropping the chaos-4 terms,
for an expectation nonnegative on squares.

**Directional pairing bounds** (`influence_pairing_U`, `influence_pairing_PQ`): for a directional
derivative `∂_α = Σᵢ αᵢ∂ᵢ`, the chaos-2 polynomials `∂_α a`, `∂_α b` pair with `U − v`, `P`, `Q`
only through `Π₂`, so with `I_α = E(∂_α a)² + E(∂_α b)²`

  `E[(U−v)∂_α a]² + E[(U−v)∂_α b]² ≤ A · I_α`,
  `(E[P∂_α a] + E[Q∂_α b])² + (E[Q∂_α a] − E[P∂_α b])² ≤ B · I_α`.

By Gaussian integration by parts `E[r q |q|²] = 2E[(U−v)∂_α q] + E[q² ∂_α q̄]` for the linear form
`r = Σ αᵢxᵢ` (`gE_linForm_mul_radU`), so these two bounds give
`|E[r q|q|²]|² ≤ (2√A + √B)² I_α` (`influence_pairing`, in the form
`E[r a U]² + E[r b U]² ≤ (2√A + √B)² I_α`).  Summing over an orthonormal basis of directions,
`‖Π₁(q|q|²)‖² ≤ (2√A + √B)² · 3v`.  (The alternative representation
`Π₁(q|q|²) = Π₁(q Π₄(U−v)) + ½Π₁(q̄ Π₄(q²))` through the fourth chaos, and the creation-operator
bounds behind `‖Π₁(q|q|²)‖ ≤ √(2vC) + ½√(3vD)`, are not formalised here.)
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

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
    rw [hL, map_sub, map_sub, map_neg, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply, h2, h4, h6]
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
  rw [ofNat_mul_apply, hX]; ring

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

/-! ### Chaos decompositions of `U − v`, `P`, `Q` -/

section decomp

variable (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) {a b : MvPolynomial ι ℝ} {v : ℝ}

omit [Fintype ι] in
lemma C_half_add_C_half_sub (v : ℝ) : (C (v / 2) : MvPolynomial ι ℝ) + C (v / 2) - C v = 0 := by
  rw [← C_add, ← C_sub, show v / 2 + v / 2 - v = 0 by ring, C_0]

lemma radU_sub_eq_comps (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) :
    radU a b - C v = (comp2 E a a + comp2 E b b) + (comp4 E a a + comp4 E b b)
      + (comp6 E a a + comp6 E b b) := by
  have ca := mul_eq_comps E a a
  have cb := mul_eq_comps E b b
  rw [haa] at ca
  rw [hbb] at cb
  unfold radU
  linear_combination ca + cb + C_half_add_C_half_sub (ι := ι) v

lemma radP_eq_comps (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) :
    radP a b = (comp2 E a a - comp2 E b b) + (comp4 E a a - comp4 E b b)
      + (comp6 E a a - comp6 E b b) := by
  have ca := mul_eq_comps E a a
  have cb := mul_eq_comps E b b
  rw [haa] at ca
  rw [hbb] at cb
  unfold radP
  linear_combination ca - cb

lemma radQ_eq_comps (hab : E (a * b) = 0) :
    radQ a b = 2 * comp2 E a b + 2 * comp4 E a b + 2 * comp6 E a b := by
  have cc := mul_eq_comps E a b
  rw [hab, C_0, add_zero] at cc
  unfold radQ
  linear_combination 2 * cc

end decomp

omit [Fintype ι] in
/-- **Cauchy–Schwarz** for an expectation nonnegative on squares. -/
lemma gE_cauchy_schwarz (E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ) (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (X Y : MvPolynomial ι ℝ) :
    E (X * Y) ^ 2 ≤ E (X * X) * E (Y * Y) := by
  have key : ∀ t : ℝ, 0 ≤ E (Y * Y) * (t * t) + (-2 * E (X * Y)) * t + E (X * X) := by
    intro t
    have h := hpos (X - C t * Y)
    have e : (X - C t * Y) * (X - C t * Y)
        = X * X - C t * (2 * (X * Y)) + C (t * t) * (Y * Y) := by
      rw [C_mul]; ring
    rw [e, map_add, map_sub, C_mul_apply, C_mul_apply, ofNat_mul_apply] at h
    linarith
  have h := discrim_le_zero key
  unfold discrim at h
  linarith

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

variable [DecidableEq ι] {a b : MvPolynomial ι ℝ} {v : ℝ}

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

/-! ### The spectral projections of `U − v`, `P`, `Q` -/

/-- The chaos components of `U − v`. -/
lemma proj_radU (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    proj2 (radU a b - C v) = comp2 E a a + comp2 E b b
      ∧ proj4 (radU a b - C v) = comp4 E a a + comp4 E b b
      ∧ proj6 (radU a b - C v) = comp6 E a a + comp6 E b b :=
  proj_eq (radU_sub_eq_comps E haa hbb) (eigen_add 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb))
    (eigen_add 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb))
    (eigen_add 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb))

/-- The chaos components of `P = a² − b²`. -/
lemma proj_radP (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    proj2 (radP a b) = comp2 E a a - comp2 E b b
      ∧ proj4 (radP a b) = comp4 E a a - comp4 E b b
      ∧ proj6 (radP a b) = comp6 E a a - comp6 E b b :=
  proj_eq (radP_eq_comps E haa hbb) (eigen_sub 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb))
    (eigen_sub 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb))
    (eigen_sub 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb))

/-- The chaos components of `Q = 2ab`. -/
lemma proj_radQ (ha : Chaos3 a) (hb : Chaos3 b) (hab : E (a * b) = 0) :
    proj2 (radQ a b) = 2 * comp2 E a b ∧ proj4 (radQ a b) = 2 * comp4 E a b
      ∧ proj6 (radQ a b) = 2 * comp6 E a b :=
  proj_eq (radQ_eq_comps E hab) (eigen_two_mul 2 (comp2_eig hE ha hb))
    (eigen_two_mul 4 (comp4_eig hE ha hb)) (eigen_two_mul 6 (comp6_eig hE ha hb))

lemma ouL_proj2_radU (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    ouL (proj2 (radU a b - C v)) = -(2 * proj2 (radU a b - C v)) := by
  rw [(proj_radU hE ha hb haa hbb).1]
  exact eigen_add 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)

lemma ouL_proj4_radU (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    ouL (proj4 (radU a b - C v)) = -(4 * proj4 (radU a b - C v)) := by
  rw [(proj_radU hE ha hb haa hbb).2.1]
  exact eigen_add 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)

lemma ouL_proj6_radU (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    ouL (proj6 (radU a b - C v)) = -(6 * proj6 (radU a b - C v)) := by
  rw [(proj_radU hE ha hb haa hbb).2.2]
  exact eigen_add 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)

lemma ouL_proj2_radP (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) : ouL (proj2 (radP a b)) = -(2 * proj2 (radP a b)) := by
  rw [(proj_radP hE ha hb haa hbb).1]
  exact eigen_sub 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb)

lemma ouL_proj4_radP (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) : ouL (proj4 (radP a b)) = -(4 * proj4 (radP a b)) := by
  rw [(proj_radP hE ha hb haa hbb).2.1]
  exact eigen_sub 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb)

lemma ouL_proj6_radP (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) : ouL (proj6 (radP a b)) = -(6 * proj6 (radP a b)) := by
  rw [(proj_radP hE ha hb haa hbb).2.2]
  exact eigen_sub 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)

lemma ouL_proj2_radQ (ha : Chaos3 a) (hb : Chaos3 b) (hab : E (a * b) = 0) :
    ouL (proj2 (radQ a b)) = -(2 * proj2 (radQ a b)) := by
  rw [(proj_radQ hE ha hb hab).1]
  exact eigen_two_mul 2 (comp2_eig hE ha hb)

lemma ouL_proj4_radQ (ha : Chaos3 a) (hb : Chaos3 b) (hab : E (a * b) = 0) :
    ouL (proj4 (radQ a b)) = -(4 * proj4 (radQ a b)) := by
  rw [(proj_radQ hE ha hb hab).2.1]
  exact eigen_two_mul 4 (comp4_eig hE ha hb)

lemma ouL_proj6_radQ (ha : Chaos3 a) (hb : Chaos3 b) (hab : E (a * b) = 0) :
    ouL (proj6 (radQ a b)) = -(6 * proj6 (radQ a b)) := by
  rw [(proj_radQ hE ha hb hab).2.2]
  exact eigen_two_mul 6 (comp6_eig hE ha hb)

/-! ### The chaos decompositions of `Γ(q,q̄)` and `Γ(q,q)` -/

/-- `Γ(q,q̄) − 3v = 2Π₂(U−v) + Π₄(U−v)`: the sixth chaos drops out of `radS`. -/
theorem radS_eq_proj (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    radS a b - C (3 * v) = 2 * proj2 (radU a b - C v) + proj4 (radU a b - C v) := by
  obtain ⟨p2, p4, -⟩ := proj_radU hE ha hb haa hbb
  rw [p2, p4]
  unfold radS comp4 comp2
  rw [haa, hbb]
  have hh := two_mul_C_half (ι := ι)
  have h3 : (C (3 * v) : MvPolynomial ι ℝ) = 2 * C (3 * (v / 2)) := by
    rw [← C_two_mul]; congr 1; ring
  linear_combination (-1 : MvPolynomial ι ℝ) * h3 - (gam2c a a + gam2c b b) * hh

/-- `Re Γ(q,q) = 2Π₂P + Π₄P`. -/
theorem radA_eq_proj (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    radA a b = 2 * proj2 (radP a b) + proj4 (radP a b) := by
  obtain ⟨p2, p4, -⟩ := proj_radP hE ha hb haa hbb
  rw [p2, p4]
  unfold radA comp4 comp2
  rw [haa, hbb]
  have hh := two_mul_C_half (ι := ι)
  linear_combination (-(gam2c a a - gam2c b b)) * hh

/-- `Im Γ(q,q) = 2Π₂Q + Π₄Q`. -/
theorem radB_eq_proj (ha : Chaos3 a) (hb : Chaos3 b) (hab : E (a * b) = 0) :
    radB a b = 2 * proj2 (radQ a b) + proj4 (radQ a b) := by
  obtain ⟨p2, p4, -⟩ := proj_radQ hE ha hb hab
  rw [p2, p4]
  unfold radB comp4 comp2
  rw [hab]
  have hh := two_mul_C_half (ι := ι)
  have h30 : (C (3 * 0) : MvPolynomial ι ℝ) = 0 := by rw [mul_zero, C_0]
  linear_combination (-2 * gam2c a b) * hh + 2 * h30

omit [DecidableEq ι] in
lemma gE_two_proj_add_sq {X Y : MvPolynomial ι ℝ} (hX : ouL X = -(2 * X))
    (hY : ouL Y = -(4 * Y)) :
    E ((2 * X + Y) * (2 * X + Y)) = 4 * E (X * X) + E (Y * Y) := by
  rw [show (2 * X + Y) * (2 * X + Y) = 4 * (X * X) + Y * Y + 4 * (Y * X) by ring, map_add,
    map_add, ofNat_mul_apply, ofNat_mul_apply, gE_eigen_orth hE 4 2 (by norm_num) hY hX]
  ring

/-- `Var(radS) = 4A + C`. -/
theorem var_radS (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) :
    E ((radS a b - C (3 * v)) * (radS a b - C (3 * v)))
      = 4 * E (proj2 (radU a b - C v) * proj2 (radU a b - C v))
        + E (proj4 (radU a b - C v) * proj4 (radU a b - C v)) := by
  rw [radS_eq_proj hE ha hb haa hbb]
  exact gE_two_proj_add_sq hE (ouL_proj2_radU hE ha hb haa hbb) (ouL_proj4_radU hE ha hb haa hbb)

/-- `E(radA² + radB²) = 4B + D`. -/
theorem gE_radA_radB (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    E (radA a b * radA a b) + E (radB a b * radB a b)
      = 4 * (E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b)))
        + (E (proj4 (radP a b) * proj4 (radP a b)) + E (proj4 (radQ a b) * proj4 (radQ a b))) := by
  rw [radA_eq_proj hE ha hb haa hbb, radB_eq_proj hE ha hb hab,
    gE_two_proj_add_sq hE (ouL_proj2_radP hE ha hb haa hbb) (ouL_proj4_radP hE ha hb haa hbb),
    gE_two_proj_add_sq hE (ouL_proj2_radQ hE ha hb hab) (ouL_proj4_radQ hE ha hb hab)]
  ring

/-! ### The quartic identity -/

/-- `J₄(a + b) = Π₄(U−v) + Π₄Q` and `J₄(b − a) = Π₄(U−v) − Π₄Q`. -/
lemma J4_add_sub_eq_proj (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    J4 E (a + b) = proj4 (radU a b - C v) + proj4 (radQ a b)
      ∧ J4 E (b - a) = proj4 (radU a b - C v) - proj4 (radQ a b) := by
  rw [(proj_radU hE ha hb haa hbb).2.1, (proj_radQ hE ha hb hab).2.1]
  obtain ⟨sp, sm⟩ := gE_add_sub_sq haa hbb hab
  have h3 : (C (3 * v) : MvPolynomial ι ℝ) = 2 * C (3 * (v / 2)) := by
    rw [← C_two_mul]; congr 1; ring
  have h30 : (C (3 * 0) : MvPolynomial ι ℝ) = 0 := by rw [mul_zero, C_0]
  constructor
  · unfold J4 comp4
    rw [← gam2c_self, gam2c_add_self, gam_add_self, sp, haa, hbb, hab]
    linear_combination h3 - 2 * h30
  · unfold J4 comp4
    rw [← gam2c_self, gam2c_sub_self, gam_sub_self, sm, haa, hbb, hab]
    linear_combination h3 + 2 * h30

/-- **The quartic identity** `3κ = 4A + 2B + 2C + D` for a circular pair in the third chaos with
`E a² = E b² = v/2`, `E ab = 0`: `κ = E U² − 2v²`, `A = E(Π₂(U−v))²`, `B = E(Π₂P)² + E(Π₂Q)²`,
`C = E(Π₄(U−v))²`, `D = E(Π₄P)² + E(Π₄Q)²`. -/
theorem quartic_identity (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    3 * (E (radU a b * radU a b) - 2 * v ^ 2)
      = 4 * E (proj2 (radU a b - C v) * proj2 (radU a b - C v))
        + 2 * (E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b)))
        + 2 * E (proj4 (radU a b - C v) * proj4 (radU a b - C v))
        + (E (proj4 (radP a b) * proj4 (radP a b)) + E (proj4 (radQ a b) * proj4 (radQ a b))) := by
  have F := fluctuation_identity hE ha hb haa hbb hab
  have f1 := var_radS hE ha hb haa hbb
  have f2 := gE_radA_radB hE ha hb haa hbb hab
  obtain ⟨hJp, hJm⟩ := J4_add_sub_eq_proj hE ha hb haa hbb hab
  have f4 : 4 * E (J4 E a * J4 E a) + 4 * E (J4 E b * J4 E b)
      = 2 * E (proj4 (radU a b - C v) * proj4 (radU a b - C v))
        + 2 * E (proj4 (radP a b) * proj4 (radP a b)) := by
    rw [(proj_radU hE ha hb haa hbb).2.1, (proj_radP hE ha hb haa hbb).2.1, ← comp4_self,
      ← comp4_self, ← ofNat_mul_apply E 2, ← ofNat_mul_apply E 2, ← map_add,
      ← ofNat_mul_apply E 4, ← ofNat_mul_apply E 4, ← map_add]
    exact congrArg E (by ring)
  have f5 : E (J4 E (a + b) * J4 E (a + b)) + E (J4 E (b - a) * J4 E (b - a))
      = 2 * E (proj4 (radU a b - C v) * proj4 (radU a b - C v))
        + 2 * E (proj4 (radQ a b) * proj4 (radQ a b)) := by
    rw [hJp, hJm, ← ofNat_mul_apply E 2, ← ofNat_mul_apply E 2, ← map_add, ← map_add]
    exact congrArg E (by ring)
  linarith

/-- **The exact Stein slack** (the exact form of H1): in the normalisation of `fluctuation_bound`
(`v = 1`) this reads `E(S−3)² + ½E(A_rad² + B_rad²) = 3(EU² − 2) − (2C + D)/2`. -/
theorem stein_slack (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    E ((radS a b - C (3 * v)) * (radS a b - C (3 * v)))
      + 1 / 2 * (E (radA a b * radA a b) + E (radB a b * radB a b))
      = 3 * (E (radU a b * radU a b) - 2 * v ^ 2)
        - (2 * E (proj4 (radU a b - C v) * proj4 (radU a b - C v))
          + (E (proj4 (radP a b) * proj4 (radP a b)) + E (proj4 (radQ a b) * proj4 (radQ a b))))
          / 2 := by
  have h := quartic_identity hE ha hb haa hbb hab
  have f1 := var_radS hE ha hb haa hbb
  have f2 := gE_radA_radB hE ha hb haa hbb hab
  linarith

/-- The Stein energy form of the slack: `κ/3 − (Var(radS)/9 + E(radA² + radB²)/18) = (2C + D)/18`. -/
theorem stein_energy_gap (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    (E (radU a b * radU a b) - 2 * v ^ 2) / 3
      - (E ((radS a b - C (3 * v)) * (radS a b - C (3 * v))) / 9
        + (E (radA a b * radA a b) + E (radB a b * radB a b)) / 18)
      = (2 * E (proj4 (radU a b - C v) * proj4 (radU a b - C v))
          + (E (proj4 (radP a b) * proj4 (radP a b)) + E (proj4 (radQ a b) * proj4 (radQ a b))))
          / 18 := by
  have h := stein_slack hE ha hb haa hbb hab
  linarith

/-- **The influence inequality** `4A + 2B ≤ 3κ`: for a circular pair in the third chaos and an
expectation nonnegative on squares,
`4 E(Π₂(U−v))² + 2 (E(Π₂P)² + E(Π₂Q)²) ≤ 3 (E U² − 2v²)`. -/
theorem influence_bound (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0) :
    4 * E (proj2 (radU a b - C v) * proj2 (radU a b - C v))
      + 2 * (E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b)))
      ≤ 3 * (E (radU a b * radU a b) - 2 * v ^ 2) := by
  have h := quartic_identity hE ha hb haa hbb hab
  have h1 := hpos (proj4 (radU a b - C v))
  have h2 := hpos (proj4 (radP a b))
  have h3 := hpos (proj4 (radQ a b))
  linarith

/-! ### Directional pairings -/

omit [DecidableEq ι] in
/-- `E(G · Y) = E(Π₂G · Y)` for `Y` in the second chaos and `G = G₂ + G₄ + G₆`. -/
lemma gE_mul_chaos2_eq_proj2 {G G2 G4 G6 Y : MvPolynomial ι ℝ} (h : G = G2 + G4 + G6)
    (h2 : ouL G2 = -(2 * G2)) (h4 : ouL G4 = -(4 * G4)) (h6 : ouL G6 = -(6 * G6))
    (hY : ouL Y = -(2 * Y)) : E (G * Y) = E (proj2 G * Y) := by
  obtain ⟨p2, -, -⟩ := proj_eq h h2 h4 h6
  rw [p2, h, add_mul, add_mul, map_add, map_add, gE_eigen_orth hE 4 2 (by norm_num) h4 hY,
    gE_eigen_orth hE 6 2 (by norm_num) h6 hY]
  ring

lemma gE_radU_mul_chaos2 (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) {Y : MvPolynomial ι ℝ} (hY : ouL Y = -(2 * Y)) :
    E ((radU a b - C v) * Y) = E (proj2 (radU a b - C v) * Y) :=
  gE_mul_chaos2_eq_proj2 hE (radU_sub_eq_comps E haa hbb)
    (eigen_add 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb))
    (eigen_add 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb))
    (eigen_add 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)) hY

lemma gE_radP_mul_chaos2 (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = v / 2)
    (hbb : E (b * b) = v / 2) {Y : MvPolynomial ι ℝ} (hY : ouL Y = -(2 * Y)) :
    E (radP a b * Y) = E (proj2 (radP a b) * Y) :=
  gE_mul_chaos2_eq_proj2 hE (radP_eq_comps E haa hbb)
    (eigen_sub 2 (comp2_eig hE ha ha) (comp2_eig hE hb hb))
    (eigen_sub 4 (comp4_eig hE ha ha) (comp4_eig hE hb hb))
    (eigen_sub 6 (comp6_eig hE ha ha) (comp6_eig hE hb hb)) hY

lemma gE_radQ_mul_chaos2 (ha : Chaos3 a) (hb : Chaos3 b) (hab : E (a * b) = 0)
    {Y : MvPolynomial ι ℝ} (hY : ouL Y = -(2 * Y)) :
    E (radQ a b * Y) = E (proj2 (radQ a b) * Y) :=
  gE_mul_chaos2_eq_proj2 hE (radQ_eq_comps E hab) (eigen_two_mul 2 (comp2_eig hE ha hb))
    (eigen_two_mul 4 (comp4_eig hE ha hb)) (eigen_two_mul 6 (comp6_eig hE ha hb)) hY

omit [Fintype ι] [DecidableEq ι] hE in
/-- The complex Cauchy–Schwarz inequality `|E[(p + iq)(y − iz)]|² ≤ E|p + iq|² E|y + iz|²` in real
form, for an expectation nonnegative on squares. -/
lemma gE_cauchy_schwarz_pair (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P))
    (p q y z : MvPolynomial ι ℝ) :
    (E (p * y) + E (q * z)) ^ 2 + (E (q * y) - E (p * z)) ^ 2
      ≤ (E (p * p) + E (q * q)) * (E (y * y) + E (z * z)) := by
  obtain ⟨X, hX⟩ : ∃ X, X = E (p * y) + E (q * z) := ⟨_, rfl⟩
  obtain ⟨Y, hY⟩ : ∃ Y, Y = E (q * y) - E (p * z) := ⟨_, rfl⟩
  obtain ⟨I, hI⟩ : ∃ I, I = E (y * y) + E (z * z) := ⟨_, rfl⟩
  rw [← hX, ← hY, ← hI]
  have c1 := gE_cauchy_schwarz E hpos p y
  have c2 := gE_cauchy_schwarz E hpos q z
  have c3 := gE_cauchy_schwarz E hpos q y
  have c4 := gE_cauchy_schwarz E hpos p z
  have hI0 : 0 ≤ I := by rw [hI]; exact add_nonneg (hpos y) (hpos z)
  rcases hI0.lt_or_eq with hIpos | hIzero
  · -- the square completion `0 ≤ E|I·π − ⟨π,w⟩ w|² = I (I‖π‖² − |⟨π,w⟩|²)`
    have h0 := add_nonneg (hpos (C I * p - (C X * y - C Y * z)))
      (hpos (C I * q - (C X * z + C Y * y)))
    have e1 : (C I * p - (C X * y - C Y * z)) * (C I * p - (C X * y - C Y * z))
        = C (I * I) * (p * p) + C (X * X) * (y * y) + C (Y * Y) * (z * z)
          - C (2 * I * X) * (p * y) + C (2 * I * Y) * (p * z) - C (2 * X * Y) * (y * z) := by
      simp only [C_mul, map_ofNat]; ring
    have e2 : (C I * q - (C X * z + C Y * y)) * (C I * q - (C X * z + C Y * y))
        = C (I * I) * (q * q) + C (X * X) * (z * z) + C (Y * Y) * (y * y)
          - C (2 * I * X) * (q * z) - C (2 * I * Y) * (q * y) + C (2 * X * Y) * (y * z) := by
      simp only [C_mul, map_ofNat]; ring
    rw [e1, e2] at h0
    simp only [map_add, map_sub, C_mul_apply] at h0
    have h1 : 0 ≤ I * (I * (E (p * p) + E (q * q)) - (X ^ 2 + Y ^ 2)) := by
      rw [hX, hY, hI] at h0 ⊢
      linarith
    rw [← not_lt]
    intro hc
    have := mul_pos hIpos (sub_pos.mpr hc)
    linarith
  · have hy : E (y * y) = 0 := by linarith [hpos y, hpos z]
    have hz : E (z * z) = 0 := by linarith [hpos y, hpos z]
    rw [hy, mul_zero] at c1 c3
    rw [hz, mul_zero] at c2 c4
    rw [← hIzero, mul_zero, hX, hY]
    nlinarith [sq_nonneg (E (p * y) - E (q * z)), sq_nonneg (E (q * y) + E (p * z))]

/-- The directional derivative `∂_α = Σᵢ αᵢ ∂ᵢ`. -/
def dirD (α : ι → ℝ) (F : MvPolynomial ι ℝ) : MvPolynomial ι ℝ := ∑ i, C (α i) * pderiv i F

/-- The linear form `r = Σᵢ αᵢ xᵢ`. -/
def linForm (α : ι → ℝ) : MvPolynomial ι ℝ := ∑ i, C (α i) * X i

omit [DecidableEq ι] hE in
lemma dirD_add (α : ι → ℝ) (P Q : MvPolynomial ι ℝ) :
    dirD α (P + Q) = dirD α P + dirD α Q := by
  unfold dirD
  rw [← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [map_add]; ring

omit [DecidableEq ι] hE in
lemma dirD_mul (α : ι → ℝ) (P Q : MvPolynomial ι ℝ) :
    dirD α (P * Q) = P * dirD α Q + Q * dirD α P := by
  unfold dirD
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [pderiv_mul]; ring

omit hE in
lemma Chaos3.ouL_dirD (ha : Chaos3 a) (α : ι → ℝ) : ouL (dirD α a) = -(2 * dirD α a) := by
  unfold dirD
  rw [map_sum, Finset.mul_sum, ← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [ouL_C_mul, ha.ouL_pderiv]; ring

omit [DecidableEq ι] in
/-- **Gaussian integration by parts** along a direction: `E[r F] = E[∂_α F]`. -/
lemma gE_linForm_mul (α : ι → ℝ) (F : MvPolynomial ι ℝ) :
    E (linForm α * F) = E (dirD α F) := by
  unfold linForm dirD
  rw [Finset.sum_mul, map_sum, map_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [mul_assoc, C_mul_apply, hE.ibp, C_mul_apply]

/-- **Pairing with `U − v`**: `E[(U−v)∂_α a]² + E[(U−v)∂_α b]² ≤ A · (E(∂_α a)² + E(∂_α b)²)`. -/
theorem influence_pairing_U (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (α : ι → ℝ) :
    E ((radU a b - C v) * dirD α a) ^ 2 + E ((radU a b - C v) * dirD α b) ^ 2
      ≤ E (proj2 (radU a b - C v) * proj2 (radU a b - C v))
        * (E (dirD α a * dirD α a) + E (dirD α b * dirD α b)) := by
  rw [gE_radU_mul_chaos2 hE ha hb haa hbb (ha.ouL_dirD α),
    gE_radU_mul_chaos2 hE ha hb haa hbb (hb.ouL_dirD α)]
  have c1 := gE_cauchy_schwarz E hpos (proj2 (radU a b - C v)) (dirD α a)
  have c2 := gE_cauchy_schwarz E hpos (proj2 (radU a b - C v)) (dirD α b)
  linarith

/-- **Pairing with `q²`**: `|E[q² ∂_α q̄]|² ≤ B · E|∂_α q|²`, in real form
`(E[P∂_α a] + E[Q∂_α b])² + (E[Q∂_α a] − E[P∂_α b])² ≤ B (E(∂_α a)² + E(∂_α b)²)`. -/
theorem influence_pairing_PQ (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0)
    (α : ι → ℝ) :
    (E (radP a b * dirD α a) + E (radQ a b * dirD α b)) ^ 2
      + (E (radQ a b * dirD α a) - E (radP a b * dirD α b)) ^ 2
      ≤ (E (proj2 (radP a b) * proj2 (radP a b)) + E (proj2 (radQ a b) * proj2 (radQ a b)))
        * (E (dirD α a * dirD α a) + E (dirD α b * dirD α b)) := by
  rw [gE_radP_mul_chaos2 hE ha hb haa hbb (ha.ouL_dirD α),
    gE_radP_mul_chaos2 hE ha hb haa hbb (hb.ouL_dirD α),
    gE_radQ_mul_chaos2 hE ha hb hab (ha.ouL_dirD α),
    gE_radQ_mul_chaos2 hE ha hb hab (hb.ouL_dirD α)]
  exact gE_cauchy_schwarz_pair hpos _ _ _ _

/-- **The first-chaos component of `q|q|²`** through the second chaos: by integration by parts,
`E[r a U] = 2E[(U−v)∂_α a] + E[P∂_α a] + E[Q∂_α b]` and
`E[r b U] = 2E[(U−v)∂_α b] + E[Q∂_α a] − E[P∂_α b]` (that is `E[r q|q|²] = 2E[(U−v)∂_α q]
+ E[q² ∂_α q̄]`). -/
theorem gE_linForm_mul_radU (ha : Chaos3 a) (hb : Chaos3 b) (v : ℝ) (α : ι → ℝ) :
    E (linForm α * (a * radU a b))
        = 2 * E ((radU a b - C v) * dirD α a) + E (radP a b * dirD α a)
          + E (radQ a b * dirD α b)
      ∧ E (linForm α * (b * radU a b))
        = 2 * E ((radU a b - C v) * dirD α b) + E (radQ a b * dirD α a)
          - E (radP a b * dirD α b) := by
  have ma : E (dirD α a) = 0 := gE_eigen_mean hE 2 (by norm_num) (ha.ouL_dirD α)
  have mb : E (dirD α b) = 0 := gE_eigen_mean hE 2 (by norm_num) (hb.ouL_dirD α)
  have hU : dirD α (radU a b) = 2 * (a * dirD α a) + 2 * (b * dirD α b) := by
    unfold radU
    rw [dirD_add, dirD_mul, dirD_mul]; ring
  constructor
  · rw [gE_linForm_mul hE, dirD_mul, hU,
      show a * (2 * (a * dirD α a) + 2 * (b * dirD α b)) + radU a b * dirD α a
        = 2 * ((radU a b - C v) * dirD α a) + radP a b * dirD α a + radQ a b * dirD α b
          + C (2 * v) * dirD α a by unfold radU radP radQ; rw [C_mul, map_ofNat]; ring,
      map_add, map_add, map_add, ofNat_mul_apply, C_mul_apply, ma]
    ring
  · rw [gE_linForm_mul hE, dirD_mul, hU,
      show b * (2 * (a * dirD α a) + 2 * (b * dirD α b)) + radU a b * dirD α b
        = 2 * ((radU a b - C v) * dirD α b) + radQ a b * dirD α a - radP a b * dirD α b
          + C (2 * v) * dirD α b by unfold radU radP radQ; rw [C_mul, map_ofNat]; ring,
      map_add, map_sub, map_add, ofNat_mul_apply, C_mul_apply, mb]
    ring

omit [Fintype ι] [DecidableEq ι] hE in
/-- `|2u + w|² ≤ (2√A + √B)² I` from `|u|² ≤ A I`, `|w|² ≤ B I` in `ℝ²`. -/
lemma two_smul_add_sq_le {u1 u2 w1 w2 A B I : ℝ} (hA : 0 ≤ A) (hB : 0 ≤ B) (hI : 0 ≤ I)
    (hu : u1 ^ 2 + u2 ^ 2 ≤ A * I) (hw : w1 ^ 2 + w2 ^ 2 ≤ B * I) :
    (2 * u1 + w1) ^ 2 + (2 * u2 + w2) ^ 2 ≤ (2 * Real.sqrt A + Real.sqrt B) ^ 2 * I := by
  have sA := Real.sq_sqrt hA
  have sB := Real.sq_sqrt hB
  have nA := Real.sqrt_nonneg A
  have nB := Real.sqrt_nonneg B
  have hcs : (u1 * w1 + u2 * w2) ^ 2 ≤ (Real.sqrt A * Real.sqrt B * I) ^ 2 := by
    calc (u1 * w1 + u2 * w2) ^ 2 ≤ (u1 ^ 2 + u2 ^ 2) * (w1 ^ 2 + w2 ^ 2) := by
          nlinarith [sq_nonneg (u1 * w2 - u2 * w1)]
      _ ≤ (A * I) * (B * I) :=
          mul_le_mul hu hw (by positivity) (by nlinarith [sq_nonneg u1, sq_nonneg u2])
      _ = (Real.sqrt A * Real.sqrt B * I) ^ 2 := by
          rw [mul_pow, mul_pow, sA, sB]; ring
  have h := (abs_le_of_sq_le_sq' hcs (by positivity)).2
  nlinarith

/-- **The directional content inequality**: for the linear form `r = Σ αᵢxᵢ`,
`E[r a U]² + E[r b U]² ≤ (2√A + √B)² (E(∂_α a)² + E(∂_α b)²)`, i.e.
`|E[r q|q|²]|² ≤ (2√A + √B)² E|∂_α q|²`. -/
theorem influence_pairing (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = v / 2) (hbb : E (b * b) = v / 2) (hab : E (a * b) = 0)
    (α : ι → ℝ) :
    E (linForm α * (a * radU a b)) ^ 2 + E (linForm α * (b * radU a b)) ^ 2
      ≤ (2 * Real.sqrt (E (proj2 (radU a b - C v) * proj2 (radU a b - C v)))
          + Real.sqrt (E (proj2 (radP a b) * proj2 (radP a b))
            + E (proj2 (radQ a b) * proj2 (radQ a b)))) ^ 2
        * (E (dirD α a * dirD α a) + E (dirD α b * dirD α b)) := by
  obtain ⟨h1, h2⟩ := gE_linForm_mul_radU hE ha hb v α
  rw [h1, h2, add_assoc (2 * E ((radU a b - C v) * dirD α a)),
    add_sub_assoc (2 * E ((radU a b - C v) * dirD α b))]
  exact two_smul_add_sq_le (hpos _) (add_nonneg (hpos _) (hpos _)) (add_nonneg (hpos _) (hpos _))
    (influence_pairing_U hE hpos ha hb haa hbb α) (influence_pairing_PQ hE hpos ha hb haa hbb hab α)

end expectation

end

end Grothe.LowerAnalytic
