import Grothe.LowerAnalytic.Influence
import Grothe.LowerAnalytic.Gaussian

/-!
# The fourth-moment cap for a pair of cubic chaoses

For real polynomials `a`, `b` in the third chaos (`Chaos3`) with `E a² = E b² = 1/2` and
`E ab = 0`, the second moment of `U = a² + b²` (`radU`) satisfies `E U² ≤ 62`
(`gE_radU_sq_le`), and in particular the cap `E U² ≤ 2 + (31/4)²` of the lower certificate
(`gaussian_radU_cap`).  Only the Gaussian integration by parts (`IsGaussianExpectation`) and
nonnegativity on squares are used.

* **First chaos** (`gE_sumsq_sq_le`): for a finite family `Yₘ` with `L Yₘ = −Yₘ` and constant
  derivatives, `Q = Σ Yₘ²` has `E Q² = (E Q)² + 2 Σₘₙ (E YₘYₙ)²`, hence `E Q² ≤ 3 (E Q)²`
  (Cauchy–Schwarz on the coefficient vectors).
* **Second chaos** (`gE_K2_sq_le`): for `G` with `L G = −2G` and first-chaos derivatives, with
  `s = E G²`, the fourth-chaos component `K = G² − Γ(G,G) + s` of `G²` has
  `E K² = ½ Var Γ(G,G) + 2s² ≤ 6s²`.
* **Third chaos** (`chaos3_fourth_le`): `2 E F⁴ = 6S² + Var(Σⱼ Γ(∂ⱼF,∂ⱼF)) + 2 E J₄²` with
  `S = E F²`; the first-chaos bound gives `Var(Σⱼ Γ(∂ⱼF,∂ⱼF)) ≤ 72 S²`, and
  `J₄ = Σⱼ K(∂ⱼF)` with the second-chaos bound and Cauchy–Schwarz gives `E J₄² ≤ 54 S²`, so
  `E F⁴ ≤ 93 (E F²)²` (equality for `F = x³ − 3x`).
* **The pair** (`gE_radU_sq_le`): `a⁴ + b⁴ + ¼(a+b)⁴ + ¼(b−a)⁴ = (3/2) U²` (four equally spaced
  rotations of `(a, b)`), and each of the four has `E F⁴ ≤ 93 (E F²)²`, so
  `E U² ≤ (2/3)(93/4 + 93/4 + 93/4 + 93/4) = 62`.
-/

open MeasureTheory MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

/-- Leibniz rule for the carré du champ in its first slot. -/
lemma gam_mul_left (P R Z : MvPolynomial ι ℝ) : gam (P * R) Z = P * gam R Z + R * gam P Z := by
  simp only [gam, pderiv_mul, Finset.mul_sum, ← Finset.sum_add_distrib]
  exact Finset.sum_congr rfl fun i _ => by ring

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

/-- `E[P Y] = E Γ(P, Y)` for an eigenfunction `L Y = −Y`. -/
lemma gE_mul_chaos1 {Y : MvPolynomial ι ℝ} (hY : ouL Y = -Y) (P : MvPolynomial ι ℝ) :
    E (P * Y) = E (gam P Y) := by
  have h := gE_mul_ouL hE P Y
  rw [hY, mul_neg, map_neg] at h
  linarith

/-- **First chaos**: for a family of first-chaos polynomials, `E (Σ Yₘ²)² ≤ 3 (E Σ Yₘ²)²`. -/
theorem gE_sumsq_sq_le {κ : Type*} [Fintype κ] (Y : κ → MvPolynomial ι ℝ)
    (hY : ∀ m, ouL (Y m) = -Y m) (hc : ∀ m i, ∃ t : ℝ, pderiv i (Y m) = C t) :
    E ((∑ m, Y m * Y m) * ∑ m, Y m * Y m) ≤ 3 * E (∑ m, Y m * Y m) ^ 2 := by
  classical
  choose u hu using hc
  set c : κ → κ → ℝ := fun m n => ∑ i, u m i * u n i with hcdef
  have hgam : ∀ m n, gam (Y m) (Y n) = C (c m n) := fun m n => by
    simp only [gam, hu, hcdef, map_sum, map_mul]
  have hmean : ∀ m n, E (Y m * Y n) = c m n := fun m n => by
    rw [gE_mul_chaos1 hE (hY n), hgam, gE_C hE]
  set Q := ∑ m, Y m * Y m with hQ
  have hEQ : E Q = ∑ m, c m m := by
    rw [hQ, map_sum]; exact Finset.sum_congr rfl fun m _ => hmean m m
  have hgQ : ∀ m, gam Q (Y m) = ∑ n, C (2 * c n m) * Y n := fun m => by
    simp only [hQ, gam, map_sum, pderiv_mul, hu, Finset.sum_mul, hcdef, map_mul, map_ofNat]
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun n _ => ?_
    rw [Finset.mul_sum, Finset.sum_mul]
    exact Finset.sum_congr rfl fun i _ => by ring
  have hterm : ∀ m, E (Y m * Q * Y m) = c m m * E Q + 2 * ∑ n, c m n ^ 2 := fun m => by
    have hn : ∀ n, E (Y m * (C (2 * c n m) * Y n)) = 2 * c m n ^ 2 := fun n => by
      rw [show Y m * (C (2 * c n m) * Y n) = C (2 * c n m) * (Y m * Y n) by ring, C_mul_apply,
        hmean, show c n m = c m n by simp only [hcdef, mul_comm]]
      ring
    rw [gE_mul_chaos1 hE (hY m), gam_mul_left, hgam, hgQ, map_add, mul_comm Q, C_mul_apply,
      Finset.mul_sum, map_sum, Finset.mul_sum]
    simp only [hn]
    ring
  have hQQ : E (Q * Q) = E Q * E Q + 2 * ∑ m, ∑ n, c m n ^ 2 := by
    have e : Q * Q = ∑ m, Y m * Q * Y m := by
      conv_lhs => rw [hQ, Finset.sum_mul]
      exact Finset.sum_congr rfl fun m _ => by ring
    rw [e, map_sum, Finset.sum_congr rfl fun m _ => hterm m, Finset.sum_add_distrib,
      ← Finset.sum_mul, ← hEQ, ← Finset.mul_sum]
  have hcs : ∀ m n, c m n ^ 2 ≤ c m m * c n n := fun m n => by
    have h := Finset.sum_mul_sq_le_sq_mul_sq Finset.univ (u m) (u n)
    simp only [hcdef, ← sq]
    exact h
  have hsum : ∑ m, ∑ n, c m n ^ 2 ≤ (∑ m, c m m) ^ 2 := by
    rw [sq, Finset.sum_mul_sum]
    exact Finset.sum_le_sum fun m _ => Finset.sum_le_sum fun n _ => hcs m n
  rw [hQQ, hEQ]
  nlinarith

omit hE in
/-- `Σⱼ Γ(∂ⱼG, ∂ⱼG)` is constant when the second derivatives of `G` are. -/
lemma gam2_const {G : MvPolynomial ι ℝ} (hc : ∀ i j, ∃ t : ℝ, pderiv j (pderiv i G) = C t) :
    ∃ τ : ℝ, gam2 G = C τ := by
  choose t ht using hc
  exact ⟨∑ i, ∑ j, t i j * t i j, by simp only [gam2, gam, ht, map_sum, map_mul]⟩

/-- **Second chaos**: the fourth-chaos component `K = G² − Γ(G,G) + E G²` of `G²` has
`E K² ≤ 6 (E G²)²`. -/
theorem gE_K2_sq_le [DecidableEq ι] {G : MvPolynomial ι ℝ} (hG : ouL G = -(2 * G))
    (hY : ∀ i, ouL (pderiv i G) = -pderiv i G)
    (hc : ∀ i j, ∃ t : ℝ, pderiv j (pderiv i G) = C t) :
    E ((G * G - gam G G + C (E (G * G))) * (G * G - gam G G + C (E (G * G))))
      ≤ 6 * E (G * G) ^ 2 := by
  set s := E (G * G) with hs
  set Γ := gam G G with hΓ
  have hLG2 : ouL (G * G) = 2 * Γ - 4 * (G * G) := by rw [ouL_mul, hG]; ring
  have hEΓ : E Γ = 2 * s := by
    have h := gE_ouL hE (G * G)
    rw [hLG2, map_sub, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  obtain ⟨τ, hτ⟩ := gam2_const hc
  have hLΓ : ouL Γ = 2 * C τ - 2 * Γ := by
    rw [← hτ, hΓ]
    unfold gam2
    rw [show gam G G = ∑ i, pderiv i G * pderiv i G from rfl, map_sum, Finset.mul_sum,
      Finset.mul_sum, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [ouL_mul, hY]
    ring
  have hτs : τ = 2 * s := by
    have h := gE_ouL hE Γ
    rw [hLΓ, map_sub, ofNat_mul_apply, ofNat_mul_apply, gE_C hE] at h
    linarith
  set X := E (G * G * Γ) with hX
  have h4 : E (G * G * (G * G)) = 3 / 2 * X := by
    have h := gE_ouL hE (G * G * (G * G))
    rw [ouL_mul, hLG2, gam_mul_self,
      show G * G * (2 * Γ - 4 * (G * G)) + G * G * (2 * Γ - 4 * (G * G))
          + 2 * (4 * (G * G) * Γ) = 12 * (G * G * Γ) - 8 * (G * G * (G * G)) by ring,
      map_sub, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  have hΓΓ : E (Γ * Γ) = X + 2 * s ^ 2 := by
    have h := gE_mul_ouL_comm hE Γ (G * G)
    rw [hLG2, hLΓ,
      show Γ * (2 * Γ - 4 * (G * G)) = 2 * (Γ * Γ) - 4 * (G * G * Γ) by ring,
      show G * G * (2 * C τ - 2 * Γ) = 2 * (C τ * (G * G)) - 2 * (G * G * Γ) by ring,
      map_sub, map_sub, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply,
      C_mul_apply, hτs] at h
    rw [← hs] at h
    nlinarith
  have hA := gE_sumsq_sq_le hE (fun i => pderiv i G) hY fun m i => hc m i
  have eΓ : (∑ i, pderiv i G * pderiv i G) = Γ := rfl
  rw [eΓ, hΓΓ, hEΓ] at hA
  have e : (G * G - Γ + C s) * (G * G - Γ + C s)
      = G * G * (G * G) - 2 * (G * G * Γ) + Γ * Γ + C (2 * s) * (G * G) - C (2 * s) * Γ
        + C (s * s) := by
    simp only [map_mul, map_ofNat]; ring
  rw [e]
  simp only [map_add, map_sub, C_mul_apply, gE_C hE]
  rw [ofNat_mul_apply, h4, hΓΓ, hEΓ, ← hX]
  nlinarith

variable [DecidableEq ι] (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P))
include hpos

/-- **The fourth moment of the third chaos**: `E F⁴ ≤ 93 (E F²)²`. -/
theorem chaos3_fourth_le {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    E (F * F * (F * F)) ≤ 93 * E (F * F) ^ 2 := by
  set S := E (F * F) with hS
  have R := chaos3_remainder hE hF
  have hJ := hF.ouL_J4 hE
  have hJ0 : E (J4 E F) = 0 := gE_eigen_mean hE 4 (by norm_num) hJ
  have hL2 : ouL (gam2 F) = C (12 * S) - 2 * gam2 F := by
    rw [hF.ouL_gam2, hF.gam3_eq hE, ← hS]
    simp only [map_mul, map_ofNat]
    ring
  have hc2 : E (J4 E F * gam2 F) = 0 := by
    have h := gE_mul_ouL_comm hE (J4 E F) (gam2 F)
    rw [hL2, hJ, show J4 E F * (C (12 * S) - 2 * gam2 F)
        = C (12 * S) * J4 E F - 2 * (J4 E F * gam2 F) by ring,
      show gam2 F * -(4 * J4 E F) = -(4 * (J4 E F * gam2 F)) by ring,
      map_sub, map_neg, C_mul_apply, hJ0, ofNat_mul_apply, ofNat_mul_apply] at h
    linarith
  -- `Γ − 3S = J₄ + (Γ₂ − 6S)` with orthogonal summands
  have hsplit : E ((gam F F - C (3 * S)) * (gam F F - C (3 * S)))
      = E (J4 E F * J4 E F) + (E (gam2 F * gam2 F) - 36 * S ^ 2) := by
    have e : gam F F - C (3 * S) = J4 E F + (gam2 F - C (6 * S)) := by
      unfold J4
      rw [← hS, show (6 * S : ℝ) = 3 * S + 3 * S by ring, C_add]
      ring
    rw [e, show (J4 E F + (gam2 F - C (6 * S))) * (J4 E F + (gam2 F - C (6 * S)))
        = J4 E F * J4 E F + 2 * (J4 E F * gam2 F) - C (12 * S) * J4 E F
          + (gam2 F - C (6 * S)) * (gam2 F - C (6 * S)) by
        simp only [map_mul, map_ofNat]; ring,
      map_add, map_sub, map_add, C_mul_apply, ofNat_mul_apply, hc2, hJ0, gE_sub_C_sq hE,
      hF.gE_gam2 hE, ← hS]
    ring
  -- the first-chaos bound on `Γ₂ = Σⱼᵢ (∂ᵢ∂ⱼF)²`
  have hΓ2 : E (gam2 F * gam2 F) ≤ 108 * S ^ 2 := by
    have h := gE_sumsq_sq_le hE (fun p : ι × ι => pderiv p.2 (pderiv p.1 F))
      (fun p => hF.ouL_pderiv2 p.2 p.1) (fun p i => hF.cubic i p.2 p.1)
    have e : (∑ p : ι × ι, pderiv p.2 (pderiv p.1 F) * pderiv p.2 (pderiv p.1 F)) = gam2 F := by
      rw [Fintype.sum_prod_type]; rfl
    rw [e, hF.gE_gam2 hE, ← hS] at h
    linarith
  -- the second-chaos bound on `J₄ = Σⱼ K(∂ⱼF)`
  set K : ι → MvPolynomial ι ℝ := fun j => pderiv j F * pderiv j F
    - gam (pderiv j F) (pderiv j F) + C (E (pderiv j F * pderiv j F)) with hK
  set s : ι → ℝ := fun j => E (pderiv j F * pderiv j F) with hsd
  have hJK : J4 E F = ∑ j, K j := by
    have hsum : (∑ j, s j) = 3 * S := by
      rw [hsd, ← map_sum, hS, ← hF.gE_gam hE]; rfl
    unfold J4
    rw [← hS, ← hsum, map_sum C]
    simp only [hK, hsd, Finset.sum_add_distrib, Finset.sum_sub_distrib]
    rfl
  have hKK : ∀ j, E (K j * K j) ≤ 6 * s j ^ 2 := fun j =>
    gE_K2_sq_le hE (hF.ouL_pderiv j) (fun i => hF.ouL_pderiv2 i j)
      (fun i k => hF.cubic k i j)
  have hKl : ∀ j l, E (K j * K l) ≤ 6 * (s j * s l) := fun j l => by
    have h := gE_cauchy_schwarz E hpos (K j) (K l)
    have h1 := hKK j
    have h2 := hKK l
    have p1 := hpos (K j)
    have p2 := hpos (K l)
    have q1 : 0 ≤ s j := hpos _
    have q2 : 0 ≤ s l := hpos _
    have hprod : E (K j * K j) * E (K l * K l) ≤ (6 * (s j * s l)) ^ 2 := by
      calc E (K j * K j) * E (K l * K l) ≤ (6 * s j ^ 2) * (6 * s l ^ 2) :=
            mul_le_mul h1 h2 p2 (by positivity)
        _ = (6 * (s j * s l)) ^ 2 := by ring
    have h6 : 0 ≤ 6 * (s j * s l) := by positivity
    nlinarith
  have hJJ : E (J4 E F * J4 E F) ≤ 54 * S ^ 2 := by
    have hsum : (∑ j, s j) = 3 * S := by
      rw [hsd, ← map_sum, hS, ← hF.gE_gam hE]; rfl
    rw [hJK, Finset.sum_mul_sum, map_sum]
    calc ∑ j, E (∑ l, K j * K l) = ∑ j, ∑ l, E (K j * K l) := by simp only [map_sum]
      _ ≤ ∑ j, ∑ l, 6 * (s j * s l) :=
          Finset.sum_le_sum fun j _ => Finset.sum_le_sum fun l _ => hKl j l
      _ = 6 * (∑ j, s j) ^ 2 := by
          rw [sq, Finset.sum_mul_sum, Finset.mul_sum]
          exact Finset.sum_congr rfl fun j _ => by rw [Finset.mul_sum]
      _ = 54 * S ^ 2 := by rw [hsum]; ring
  rw [gE_sub_C_sq hE, hF.gE_gam hE, ← hS] at R
  have hsplit' := hsplit
  rw [gE_sub_C_sq hE, hF.gE_gam hE, ← hS] at hsplit'
  nlinarith

/-- **The fourth-moment cap** for a normalized pair in the third chaos: `E U² ≤ 62`. -/
theorem gE_radU_sq_le {a b : MvPolynomial ι ℝ} (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2) (hab : E (a * b) = 0) :
    E (radU a b * radU a b) ≤ 62 := by
  obtain ⟨sp, sm⟩ := gE_add_sub_sq (v := 1) (by rw [haa]) (by rw [hbb]) hab
  have h1 := chaos3_fourth_le hE hpos ha
  have h2 := chaos3_fourth_le hE hpos hb
  have h3 := chaos3_fourth_le hE hpos (ha.add hb)
  have h4 := chaos3_fourth_le hE hpos (ha.sub hb)
  rw [haa] at h1
  rw [hbb] at h2
  rw [sp] at h3
  rw [sm] at h4
  have e : (6 : MvPolynomial ι ℝ) * (radU a b * radU a b)
      = 4 * (a * a * (a * a)) + 4 * (b * b * (b * b))
        + (a + b) * (a + b) * ((a + b) * (a + b)) + (b - a) * (b - a) * ((b - a) * (b - a)) := by
    unfold radU; ring
  have h := congrArg E e
  rw [ofNat_mul_apply, map_add, map_add, map_add, ofNat_mul_apply, ofNat_mul_apply] at h
  nlinarith

end expectation

/-- **The cap on `E|q|⁴` for the Gaussian law**: for a normalized pair in the third chaos,
`E U² ≤ 62 ≤ 2 + (31/4)²` under the standard Gaussian measure. -/
theorem gaussian_radU_cap {d : ℕ} (a b : MvPolynomial (Fin d) ℝ) (ha : Chaos3 a) (hb : Chaos3 b)
    (haa : ∫ x, eval x a ^ 2 ∂(stdGaussian d) = 1 / 2)
    (hbb : ∫ x, eval x b ^ 2 ∂(stdGaussian d) = 1 / 2)
    (hab : ∫ x, eval x a * eval x b ∂(stdGaussian d) = 0) :
    ∫ x, eval x (radU a b) ^ 2 ∂(stdGaussian d) ≤ 62 := by
  have toE : ∀ P Q : MvPolynomial (Fin d) ℝ,
      ∫ x, eval x P * eval x Q ∂(stdGaussian d) = gaussE d (P * Q) := fun P Q => by
    rw [gaussE_apply]; simp only [map_mul]
  have sqE : ∀ P : MvPolynomial (Fin d) ℝ,
      ∫ x, eval x P ^ 2 ∂(stdGaussian d) = gaussE d (P * P) := fun P => by
    rw [← toE]; simp only [sq]
  rw [sqE] at haa hbb ⊢
  rw [toE] at hab
  exact gE_radU_sq_le (gaussE_isGaussianExpectation d) gaussE_mul_self_nonneg ha hb haa hbb hab

end

end Grothe.LowerAnalytic
