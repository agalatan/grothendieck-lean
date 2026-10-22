import Grothe.LowerAnalytic.SpectralBudget

/-!
# The covariance order of cubic Gaussian chaos

For `q = a + ib` with `a`, `b` in the third chaos, `E a² = E b² = 1/2`, `E ab = 0`, and the
notation of `SpectralBudget.lean` (`U = |q|²`, `S = 3w`, `A + iB = 3c`), put
`N = A (a² − b²) + B · 2ab = 3 Re(c q̄²)`.  Then (`covariance_order`)

  `E[S U] − E[N] ≥ 3`,

i.e. `P ≥ Q` for `P = E[(w − 1)U]`, `Q = E[rU] = E N / 3`; with `2P + Q = E U² − 2` this is the
covariance order `Q ≤ (E U² − 2)/3`.

The proof uses only the Gaussian integration by parts, in three layers.

* Cubic layer: `SU − N = 2(a²Γ(b,b) + b²Γ(a,a) − 2ab Γ(a,b))` pointwise, and for two
  ladders `E[Y G'] = E[G G'] − ½ E[H H'] + 12 m m'` (`Ladder.cross`), applied to the ladders of
  `a²`, `b²` and `ab`.
* Quadratic layer: the first derivatives `aᵢ = ∂ᵢa`, `bₖ` are in the second chaos with constant
  second derivatives (`Quad`), and four of them satisfy the pairing formula (`quad_four`)

    `E[PRST] = ½ Σ_{pairings} (E[Γ(P,R) Γ(S,T)] − ½ E Γ(P,R) · E Γ(S,T))`.

* With `Aᵢₖ = Γ(aᵢ, aₖ)`, `Bᵢₖ = Γ(bᵢ, bₖ)`, `Cᵢₖ = Γ(aᵢ, bₖ)` and the pointwise trace identity
  `Σ Cᵢₖ² = Σ Aᵢₖ Bᵢₖ` (`sum_C_sq`), everything combines into

    `E[SU] − E[N] − 3 = Σᵢₖ Var(Cᵢₖ − Cₖᵢ) + Σᵢₖ (E Aᵢₖ · E Bᵢₖ − E Cᵢₖ · E Cₖᵢ)`,

  and the last sum is `½ ‖T − Tᵀ‖² ≥ 0` for the matrix `T = Σᵢ ∂ᵢ∂a ⊗ ∂ᵢ∂b` of constant third
  derivatives (`sum_gram_sub_nonneg`).  In tensor language `P − Q = 648 ‖K − Kᵀ‖²`.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

omit [Fintype ι] in
lemma swap4 {κ β : Type*} [Fintype ι] [Fintype κ] [AddCommMonoid β] (F : κ → κ → ι → ι → β) :
    ∑ p, ∑ q, ∑ i, ∑ k, F p q i k = ∑ i, ∑ k, ∑ p, ∑ q, F p q i k := by
  calc ∑ p, ∑ q, ∑ i, ∑ k, F p q i k = ∑ p, ∑ i, ∑ q, ∑ k, F p q i k :=
        Finset.sum_congr rfl fun p _ => Finset.sum_comm
    _ = ∑ i, ∑ p, ∑ q, ∑ k, F p q i k := Finset.sum_comm
    _ = ∑ i, ∑ p, ∑ k, ∑ q, F p q i k :=
        Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun p _ => Finset.sum_comm
    _ = ∑ i, ∑ k, ∑ p, ∑ q, F p q i k := Finset.sum_congr rfl fun i _ => Finset.sum_comm

/-- `Σᵢₖ (⟨xᵢ,xₖ⟩⟨yᵢ,yₖ⟩ − ⟨xᵢ,yₖ⟩⟨xₖ,yᵢ⟩) = ½ Σ_{pq} (Σᵢ xᵢ(p) yᵢ(q) − xᵢ(q) yᵢ(p))² ≥ 0`. -/
lemma sum_gram_sub_nonneg {κ : Type*} [Fintype κ] (x y : ι → κ → ℝ) :
    0 ≤ ∑ i, ∑ k, ((∑ p, x i p * x k p) * (∑ q, y i q * y k q)
      - (∑ p, x i p * y k p) * (∑ q, x k q * y i q)) := by
  have key : 2 * ∑ i, ∑ k, ((∑ p, x i p * x k p) * (∑ q, y i q * y k q)
      - (∑ p, x i p * y k p) * (∑ q, x k q * y i q))
      = ∑ p, ∑ q, (∑ i, (x i p * y i q - x i q * y i p)) ^ 2 := by
    have e1 : ∀ p q, (∑ i, (x i p * y i q - x i q * y i p)) ^ 2
        = ∑ i, ∑ k, (x i p * x k p * (y i q * y k q) - x i p * y k p * (x k q * y i q)
          + (x i q * x k q * (y i p * y k p) - x i q * y k q * (x k p * y i p))) := by
      intro p q
      rw [sq, Finset.sum_mul_sum]
      exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun k _ => by ring
    simp only [e1, Finset.sum_add_distrib]
    have swap : ∑ p, ∑ q, ∑ i, ∑ k, (x i q * x k q * (y i p * y k p)
        - x i q * y k q * (x k p * y i p))
        = ∑ p, ∑ q, ∑ i, ∑ k, (x i p * x k p * (y i q * y k q)
          - x i p * y k p * (x k q * y i q)) :=
      Finset.sum_comm
    have e2 : ∑ p, ∑ q, ∑ i, ∑ k, (x i p * x k p * (y i q * y k q)
        - x i p * y k p * (x k q * y i q))
        = ∑ i, ∑ k, ((∑ p, x i p * x k p) * (∑ q, y i q * y k q)
          - (∑ p, x i p * y k p) * (∑ q, x k q * y i q)) := by
      rw [swap4]
      refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun k _ => ?_
      rw [Finset.sum_mul_sum, Finset.sum_mul_sum, ← Finset.sum_sub_distrib]
      refine Finset.sum_congr rfl fun p _ => ?_
      rw [← Finset.sum_sub_distrib]
    rw [swap, e2]
    ring
  have h : 0 ≤ ∑ p, ∑ q, (∑ i, (x i p * y i q - x i q * y i p)) ^ 2 :=
    Finset.sum_nonneg fun p _ => Finset.sum_nonneg fun q _ => sq_nonneg _
  linarith

/-- A polynomial of the **second chaos with constant second derivatives**, such as `∂ᵢa` for `a`
in the third chaos. -/
structure Quad (P : MvPolynomial ι ℝ) : Prop where
  eig : ouL P = -(2 * P)
  eig1 : ∀ m, ouL (pderiv m P) = -pderiv m P
  cst : ∀ m n, ∃ t : ℝ, pderiv n (pderiv m P) = C t

/-- `Γ(P, R)` of two such polynomials is a ladder: `L Γ(P,R) = 2κ − 2Γ(P,R)`. -/
lemma Quad.gam_ouL {P R : MvPolynomial ι ℝ} (hP : Quad P) (hR : Quad R) :
    ∃ κ : ℝ, ouL (gam P R) = 2 * C κ - 2 * gam P R := by
  choose tP htP using hP.cst
  choose tR htR using hR.cst
  refine ⟨∑ m, ∑ n, tP m n * tR m n, ?_⟩
  simp only [gam, map_sum, ouL_mul, hP.eig1, hR.eig1, Finset.mul_sum, map_sum]
  rw [← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun m _ => ?_
  simp only [htP, htR, map_mul]
  ring

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

/-- `E[Y G'] = E[G G'] − ½ E[H H'] + 12 m m'` for two ladders. -/
theorem Ladder.cross {Y G H Y' G' H' : MvPolynomial ι ℝ} {m m' : ℝ} (hL : Ladder Y G H m)
    (hL' : Ladder Y' G' H' m') :
    E (Y * G') = E (G * G') - 1 / 2 * E (H * H') + 12 * m * m' := by
  have e1 := gE_ouL hE H
  have e2 := gE_ouL hE G
  have e3 := gE_ouL hE Y
  rw [hL.hH] at e1
  rw [hL.hG] at e2
  rw [hL.hY] at e3
  have r1 := gE_mul_ouL_comm hE Y G'
  have r2 := gE_mul_ouL_comm hE Y H'
  have r3 := gE_mul_ouL_comm hE G H'
  rw [hL'.hG, hL.hY] at r1
  rw [hL'.hH, hL.hY] at r2
  rw [hL'.hH, hL.hG] at r3
  simp only [map_sub, map_smul, smul_eq_mul, hE.one] at e1 e2 e3
  simp only [map_sub, map_smul, smul_eq_mul, mul_sub, mul_smul_comm, mul_one] at r1 r2 r3
  have c1 : E (G' * Y) = E (Y * G') := by rw [mul_comm]
  have c2 : E (H' * Y) = E (Y * H') := by rw [mul_comm]
  have c3 : E (H' * G) = E (G * H') := by rw [mul_comm]
  have c4 : E (G' * G) = E (G * G') := by rw [mul_comm]
  have c5 : E (H' * H) = E (H * H') := by rw [mul_comm]
  have hEG : E G = 3 * m := by linarith
  have hEY : E Y = m := by linarith
  rw [hEY] at r2
  rw [hEG] at r3
  linarith

lemma Ladder.gE_H {Y G H : MvPolynomial ι ℝ} {m : ℝ} (hL : Ladder Y G H m) : E H = 6 * m := by
  have e1 := gE_ouL hE H
  rw [hL.hH] at e1
  simp only [map_sub, map_smul, smul_eq_mul, hE.one] at e1
  linarith

/-- `E[P Q] = ½ E Γ(P, Q)` for `P` in the second chaos. -/
lemma Quad.gE_mul {P Q : MvPolynomial ι ℝ} (hQ : Quad Q) : E (P * Q) = 1 / 2 * E (gam P Q) := by
  have h := gE_mul_ouL hE P Q
  rw [hQ.eig, mul_neg, map_neg, mul_left_comm, ofNat_mul_apply] at h
  linarith

/-- `E[ST Γ(P,R)] = E[Γ(P,R) Γ(S,T)] − ½ E Γ(P,R) E Γ(S,T)`. -/
lemma quad_pair {P R S T : MvPolynomial ι ℝ} (hP : Quad P) (hR : Quad R) (hS : Quad S)
    (hT : Quad T) :
    E (S * T * gam P R) = E (gam P R * gam S T) - 1 / 2 * E (gam P R) * E (gam S T) := by
  obtain ⟨κ, hκ⟩ := hP.gam_ouL hR
  have hST : ouL (S * T) = 2 * gam S T - 4 * (S * T) := by
    rw [ouL_mul, hS.eig, hT.eig]; ring
  have r := gE_mul_ouL_comm hE (S * T) (gam P R)
  rw [hκ, hST, show S * T * (2 * C κ - 2 * gam P R) = C (2 * κ) * (S * T) - 2 * (S * T * gam P R)
      by rw [map_mul, map_ofNat]; ring,
    show gam P R * (2 * gam S T - 4 * (S * T))
      = 2 * (gam P R * gam S T) - 4 * (S * T * gam P R) by ring,
    map_sub, map_sub, C_mul_apply, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply] at r
  have e0 := gE_ouL hE (gam P R)
  rw [hκ, map_sub, ofNat_mul_apply, ofNat_mul_apply, gE_C hE] at e0
  have eST := hT.gE_mul hE (P := S)
  have hκE : κ = E (gam P R) := by linarith
  rw [hκE, eST] at r
  linarith

/-- **The pairing formula** for four polynomials of the second chaos. -/
theorem quad_four {P R S T : MvPolynomial ι ℝ} (hP : Quad P) (hR : Quad R) (hS : Quad S)
    (hT : Quad T) :
    E (P * R * S * T) = 1 / 2 * ((E (gam P R * gam S T) - 1 / 2 * E (gam P R) * E (gam S T))
      + (E (gam P S * gam R T) - 1 / 2 * E (gam P S) * E (gam R T))
      + (E (gam P T * gam R S) - 1 / 2 * E (gam P T) * E (gam R S))) := by
  have h := gE_mul_ouL hE (R * S * T) P
  rw [hP.eig, mul_neg, map_neg, mul_left_comm, ofNat_mul_apply, gam_mul_left, gam_mul_left,
    mul_add, map_add, map_add] at h
  have h1 := quad_pair hE hP hR hS hT
  have h2 := quad_pair hE hP hS hR hT
  have h3 := quad_pair hE hP hT hR hS
  have e1 : E (R * S * gam T P) = E (R * S * gam P T) := by rw [gam_comm]
  have e2 : E (T * (R * gam S P)) = E (R * T * gam P S) := by rw [gam_comm]; ring_nf
  have e3 : E (T * (S * gam R P)) = E (S * T * gam P R) := by rw [gam_comm]; ring_nf
  have e4 : E (R * S * T * P) = E (P * R * S * T) := by ring_nf
  linarith

variable [DecidableEq ι]

omit hE in
lemma Chaos3.quad {F : MvPolynomial ι ℝ} (hF : Chaos3 F) (i : ι) : Quad (pderiv i F) where
  eig := hF.ouL_pderiv i
  eig1 m := hF.ouL_pderiv2 m i
  cst m n := hF.cubic n m i

omit hE [DecidableEq ι] in
/-- `E Γ(P, R) = Σₘₙ ∂ₙ∂ₘP · ∂ₙ∂ₘR` for constant second derivatives. -/
lemma Quad.gE_gam {P R : MvPolynomial ι ℝ} (hR : Quad R) (hE : IsGaussianExpectation E)
    (tP tR : ι → ι → ℝ) (htP : ∀ m n, pderiv n (pderiv m P) = C (tP m n))
    (htR : ∀ m n, pderiv n (pderiv m R) = C (tR m n)) :
    E (gam P R) = ∑ m, ∑ n, tP m n * tR m n := by
  rw [gam, map_sum]
  refine Finset.sum_congr rfl fun m _ => ?_
  have h := gE_mul_ouL hE (pderiv m P) (pderiv m R)
  rw [hR.eig1, mul_neg, map_neg, neg_inj] at h
  rw [h, gam]
  simp only [htP, htR, ← map_mul, ← map_sum, gE_C hE]

omit hE [DecidableEq ι] in
/-- The pointwise trace identity `Σᵢₖ Γ(aᵢ, bₖ)² = Σᵢₖ Γ(aᵢ, aₖ) Γ(bᵢ, bₖ)` (both are
`tr(∇²a² ∇²b²)`). -/
lemma sum_C_sq (a b : MvPolynomial ι ℝ) :
    ∑ i, ∑ k, gam (pderiv i a) (pderiv k b) * gam (pderiv i a) (pderiv k b)
      = ∑ i, ∑ k, gam (pderiv i a) (pderiv k a) * gam (pderiv i b) (pderiv k b) := by
  simp only [gam, Finset.sum_mul_sum]
  refine Eq.trans ?_ (swap4 (κ := ι) fun X K I J => pderiv I (pderiv X a) * pderiv I (pderiv K a)
    * (pderiv J (pderiv X b) * pderiv J (pderiv K b))).symm
  refine Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun k _ =>
    Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  rw [pderiv_pderiv_comm i x a, pderiv_pderiv_comm j x a, pderiv_pderiv_comm i k b,
    pderiv_pderiv_comm j k b]
  ring

/-- **The covariance order** `E[SU] − E[N] ≥ 3`, i.e. `Q ≤ P`, for a pair in the third chaos
with `E a² = E b² = 1/2`, `E ab = 0`. -/
theorem covariance_order (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) {a b : MvPolynomial ι ℝ}
    (ha : Chaos3 a) (hb : Chaos3 b) (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2)
    (hab : E (a * b) = 0) :
    3 ≤ E (radS a b * radU a b) - E (radA a b * (a * a - b * b) + radB a b * (2 * (a * b))) := by
  -- the three ladders and the cubic layer
  obtain ⟨sp, sm⟩ := gE_add_sub_sq (E := E) (v := 1) (by rw [haa]) (by rw [hbb]) hab
  have hH : (1 / 4 : ℝ) • gam2 (a + b) + (-(1 / 4) : ℝ) • gam2 (b - a)
      = ∑ i, gam (pderiv i a) (pderiv i b) := by
    simp only [gam2, map_add, map_sub, gam_add_self, gam_sub_self, Finset.smul_sum,
      ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [neg_smul, ← sub_eq_add_neg, ← smul_sub,
      show gam (pderiv i a) (pderiv i a) + 2 * gam (pderiv i a) (pderiv i b)
          + gam (pderiv i b) (pderiv i b) - (gam (pderiv i a) (pderiv i a)
          - 2 * gam (pderiv i a) (pderiv i b) + gam (pderiv i b) (pderiv i b))
        = (4 : ℝ) • gam (pderiv i a) (pderiv i b) by rw [ofNat_smul_poly]; ring, smul_smul]
    norm_num
  have La := ha.ladder hE
  have Lb := hb.ladder hE
  have Lab := (((ha.add hb).ladder hE).lin ((ha.sub hb).ladder hE) (1 / 4) (-(1 / 4))).congr
    (Y' := a * b) (G' := gam a b) (m' := 0)
    (by
      rw [show a * b = (1 / 4 : ℝ) • ((a + b) * (a + b)) + (-(1 / 4) : ℝ) • ((b - a) * (b - a)) by
        rw [neg_smul, ← sub_eq_add_neg, ← smul_sub,
          show (a + b) * (a + b) - (b - a) * (b - a) = (4 : ℝ) • (a * b) by
            rw [ofNat_smul_poly]; ring, smul_smul]; norm_num])
    (by
      rw [gam_add_self, gam_sub_self, neg_smul, ← sub_eq_add_neg, ← smul_sub,
        show gam a a + 2 * gam a b + gam b b - (gam a a - 2 * gam a b + gam b b)
          = (4 : ℝ) • gam a b by rw [ofNat_smul_poly]; ring, smul_smul]
      norm_num)
    hH (by rw [sp, sm]; norm_num)
  have c1 := Ladder.cross hE La Lb
  have c2 := Ladder.cross hE Lb La
  have c3 := Ladder.cross hE Lab Lab
  have hHab := Lab.gE_H hE
  rw [haa, hbb] at c1 c2
  have hSUN : E (radS a b * radU a b) - E (radA a b * (a * a - b * b) + radB a b * (2 * (a * b)))
      = 2 * E (a * a * gam b b) + 2 * E (b * b * gam a a) - 4 * E (a * b * gam a b) := by
    rw [← map_sub, show radS a b * radU a b - (radA a b * (a * a - b * b)
        + radB a b * (2 * (a * b))) = 2 * (a * a * gam b b) + 2 * (b * b * gam a a)
          - 4 * (a * b * gam a b) by unfold radS radU radA radB; ring,
      map_sub, map_add, ofNat_mul_apply, ofNat_mul_apply, ofNat_mul_apply]
  -- the quadratic layer
  set ai : ι → MvPolynomial ι ℝ := fun i => pderiv i a with hai
  set bi : ι → MvPolynomial ι ℝ := fun i => pderiv i b with hbi
  have qa : ∀ i, Quad (ai i) := ha.quad
  have qb : ∀ i, Quad (bi i) := hb.quad
  have hXi : gam a a * gam b b - gam a b * gam a b
      = ∑ i, ∑ k, (ai i * ai i * bi k * bi k - ai i * bi i * ai k * bi k) := by
    simp only [gam, Finset.sum_mul_sum, ← Finset.sum_sub_distrib, hai, hbi]
    exact Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun k _ => by ring
  have hXi2 : gam2 a * gam2 b - (∑ i, gam (ai i) (bi i)) * (∑ i, gam (ai i) (bi i))
      = ∑ i, ∑ k, (gam (ai i) (ai i) * gam (bi k) (bi k)
        - gam (ai i) (bi i) * gam (ai k) (bi k)) := by
    simp only [gam2, Finset.sum_mul_sum, ← Finset.sum_sub_distrib, hai, hbi]
  have eXi : E (gam a a * gam b b) - E (gam a b * gam a b)
      = ∑ i, ∑ k, (E (ai i * ai i * bi k * bi k) - E (ai i * bi i * ai k * bi k)) := by
    rw [← map_sub, hXi]; simp only [map_sum, map_sub]
  have eXi2 : E (gam2 a * gam2 b) - E ((∑ i, gam (ai i) (bi i)) * (∑ i, gam (ai i) (bi i)))
      = ∑ i, ∑ k, (E (gam (ai i) (ai i) * gam (bi k) (bi k))
        - E (gam (ai i) (bi i) * gam (ai k) (bi k))) := by
    rw [← map_sub, hXi2]; simp only [map_sum, map_sub]
  have cm1 : E (gam b b * gam a a) = E (gam a a * gam b b) := by rw [mul_comm]
  have cm2 : E (gam2 b * gam2 a) = E (gam2 a * gam2 b) := by rw [mul_comm]
  have hX : E (radS a b * radU a b) - E (radA a b * (a * a - b * b) + radB a b * (2 * (a * b)))
      = 4 * ∑ i, ∑ k, (E (ai i * ai i * bi k * bi k) - E (ai i * bi i * ai k * bi k))
        - 2 * ∑ i, ∑ k, (E (gam (ai i) (ai i) * gam (bi k) (bi k))
          - E (gam (ai i) (bi i) * gam (ai k) (bi k))) + 12 := by
    rw [hSUN, c1, c2, c3, ← eXi, ← eXi2, cm1, cm2]; ring
  -- the constants
  have hal : ∑ i, E (gam (ai i) (ai i)) = 3 := by
    rw [← map_sum, show ∑ i, gam (ai i) (ai i) = gam2 a from rfl, ha.gE_gam2 hE, haa]; norm_num
  have hbe : ∑ i, E (gam (bi i) (bi i)) = 3 := by
    rw [← map_sum, show ∑ i, gam (bi i) (bi i) = gam2 b from rfl, hb.gE_gam2 hE, hbb]; norm_num
  have hN : ∑ i, E (gam (ai i) (bi i)) = 0 := by rw [← map_sum, hHab]; norm_num
  -- the pairing formula on every pair of indices
  have hper : ∀ i k, 4 * (E (ai i * ai i * bi k * bi k) - E (ai i * bi i * ai k * bi k))
      - 2 * (E (gam (ai i) (ai i) * gam (bi k) (bi k)) - E (gam (ai i) (bi i) * gam (ai k) (bi k)))
      = (E (gam (ai i) (bi k) * gam (ai i) (bi k)) + E (gam (ai k) (bi i) * gam (ai k) (bi i))
          - 2 * E (gam (ai i) (bi k) * gam (ai k) (bi i))
          - (E (gam (ai i) (bi k)) - E (gam (ai k) (bi i))) ^ 2)
        + (E (gam (ai i) (ai k)) * E (gam (bi i) (bi k))
          - E (gam (ai i) (bi k)) * E (gam (ai k) (bi i)))
        - E (gam (ai i) (ai i)) * E (gam (bi k) (bi k))
        + E (gam (ai i) (bi i)) * E (gam (ai k) (bi k))
        + 2 * (E (gam (ai i) (bi k) * gam (ai i) (bi k))
          - E (gam (ai i) (ai k) * gam (bi i) (bi k)))
        + (E (gam (ai i) (bi k) * gam (ai i) (bi k)) - E (gam (ai k) (bi i) * gam (ai k) (bi i)))
        + (E (gam (ai k) (bi i)) ^ 2 - E (gam (ai i) (bi k)) ^ 2) := by
    intro i k
    rw [quad_four hE (qa i) (qa i) (qb k) (qb k), quad_four hE (qa i) (qb i) (qa k) (qb k),
      gam_comm (bi i) (ai k)]
    ring
  -- every variance is nonnegative
  have hvar : ∀ i k, 0 ≤ E (gam (ai i) (bi k) * gam (ai i) (bi k))
      + E (gam (ai k) (bi i) * gam (ai k) (bi i)) - 2 * E (gam (ai i) (bi k) * gam (ai k) (bi i))
      - (E (gam (ai i) (bi k)) - E (gam (ai k) (bi i))) ^ 2 := by
    intro i k
    have h := hpos (gam (ai i) (bi k) - gam (ai k) (bi i)
      - C (E (gam (ai i) (bi k)) - E (gam (ai k) (bi i))))
    rw [gE_sub_C_sq hE, show (gam (ai i) (bi k) - gam (ai k) (bi i))
        * (gam (ai i) (bi k) - gam (ai k) (bi i)) = gam (ai i) (bi k) * gam (ai i) (bi k)
          + gam (ai k) (bi i) * gam (ai k) (bi i) - 2 * (gam (ai i) (bi k) * gam (ai k) (bi i))
        by ring, map_sub, map_add, ofNat_mul_apply] at h
    simp only [map_sub] at h
    nlinarith
  -- the Gram term
  choose ta hta using ha.cubic
  choose tb htb using hb.cubic
  have hG : ∀ (P R : ι → MvPolynomial ι ℝ) (tP tR : ι → ι → ι → ℝ), (∀ i, Quad (R i)) →
      (∀ i m n, pderiv n (pderiv m (P i)) = C (tP n m i)) →
      (∀ i m n, pderiv n (pderiv m (R i)) = C (tR n m i)) →
      ∀ i k, E (gam (P i) (R k)) = ∑ p : ι × ι, tP p.2 p.1 i * tR p.2 p.1 k := by
    intro P R tP tR hR hP' hR' i k
    rw [Fintype.sum_prod_type]
    exact (hR k).gE_gam hE (fun m n => tP n m i) (fun m n => tR n m k) (hP' i) (hR' k)
  have haa' : ∀ i m n, pderiv n (pderiv m (ai i)) = C (ta n m i) := fun i m n => hta n m i
  have hbb' : ∀ i m n, pderiv n (pderiv m (bi i)) = C (tb n m i) := fun i m n => htb n m i
  have hgram := sum_gram_sub_nonneg (κ := ι × ι) (fun i p => ta p.2 p.1 i) (fun i p => tb p.2 p.1 i)
  simp only [← hG ai ai ta ta qa haa' haa', ← hG bi bi tb tb qb hbb' hbb',
    ← hG ai bi ta tb qb haa' hbb'] at hgram
  -- summing up
  have hsum := Finset.sum_congr rfl fun i (_ : i ∈ Finset.univ) =>
    Finset.sum_congr rfl fun k (_ : k ∈ Finset.univ) => hper i k
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum,
    ← Finset.sum_mul, ← Finset.mul_sum] at hsum
  have z1 : ∑ i, ∑ k, E (gam (ai i) (bi k) * gam (ai i) (bi k))
      = ∑ i, ∑ k, E (gam (ai i) (ai k) * gam (bi i) (bi k)) := by
    have h := congrArg E (sum_C_sq a b)
    simp only [map_sum] at h
    exact h
  have z2 : ∑ i, ∑ k, E (gam (ai k) (bi i) * gam (ai k) (bi i))
      = ∑ i, ∑ k, E (gam (ai i) (bi k) * gam (ai i) (bi k)) := Finset.sum_comm
  have z3 : ∑ i, ∑ k, E (gam (ai k) (bi i)) ^ 2 = ∑ i, ∑ k, E (gam (ai i) (bi k)) ^ 2 :=
    Finset.sum_comm
  have hvs := Finset.sum_nonneg fun i (_ : i ∈ Finset.univ) =>
    Finset.sum_nonneg fun k (_ : k ∈ Finset.univ) => hvar i k
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum] at hvs
  simp only [Finset.sum_sub_distrib] at hgram
  rw [hX]
  simp only [Finset.sum_sub_distrib]
  rw [z2] at hsum hvs
  rw [z3, z1, hal, hbe, hN] at hsum
  nlinarith

end expectation

end

end Grothe.LowerAnalytic
