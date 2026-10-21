import Grothe.LowerAnalytic.Fluctuation

/-!
# The separate spectral budgets of cubic Gaussian chaos

In the framework of `Fluctuation.lean` (a Gaussian expectation `E` on polynomials, the
Ornstein–Uhlenbeck generator `L = ouL` and its carré du champ `Γ = gam`), a *ladder*
`(Y, G, H; m)` is a triple of polynomials with

  `L Y = 2G − 6Y`,  `L G = 2H − 4G`,  `L H = 12m − 2H`

(`Ladder`).  For `F` in the third chaos, `(F², Γ(F,F), Σⱼ Γ(∂ⱼF, ∂ⱼF); E F²)` is a ladder
(`Chaos3.ladder`), and ladders form a vector space (`Ladder.lin`).  On a ladder `Y` has chaos
components of orders `0, 2, 4, 6` only, `G = 3m + 2Y₂ + Y₄`, and the symmetry of `L` alone gives
the exact energy identity (`Ladder.energy`)

  `2 E[G Y] + 3m² − E[G²] = E[(G − H + 3m)²]`,

whose right side is `‖Y₄‖²`.  For `q = a + ib` with `a`, `b` in the third chaos and
`E a² = E b² = 1/2`, `E ab = 0`, write `U = |q|²` (`radU`), `S = 3w` (`radS`) and
`A + iB = 3c` (`radA`, `radB`), `c = Γ(q,q)/3`.  The ladders of `U` (with `m = 1`) and of the real
and imaginary parts `a² − b²`, `2ab` of `q²` (with `m = 0`) give the two separate budgets

  `E S² ≤ 2 E[S U] + 3`                         (`budget_w`),
  `E A² + E B² ≤ 2 E[A (a² − b²) + B · 2ab]`     (`budget_c`),

i.e. `E X² ≤ (2/3) E[XU]` for `X = w − 1` and `E|c|² ≤ (2/3) Re E[c q̄²]`, with the remainders
`‖U₄‖²/9` and `‖(q²)₄‖²/9`.  Adding the first to half the second recovers the fluctuation bound.
-/

open MvPolynomial

namespace Grothe.LowerAnalytic

noncomputable section

variable {ι : Type*} [Fintype ι]

omit [Fintype ι] in
/-- `n • P = n * P` for a numeral `n`. -/
lemma ofNat_smul_poly (n : ℕ) [n.AtLeastTwo] (P : MvPolynomial ι ℝ) :
    (OfNat.ofNat n : ℝ) • P = (OfNat.ofNat n : MvPolynomial ι ℝ) * P := by
  rw [smul_eq_C_mul, map_ofNat]

/-- An **Ornstein–Uhlenbeck ladder** `L Y = 2G − 6Y`, `L G = 2H − 4G`, `L H = 12m − 2H`. -/
structure Ladder (Y G H : MvPolynomial ι ℝ) (m : ℝ) : Prop where
  hY : ouL Y = (2 : ℝ) • G - (6 : ℝ) • Y
  hG : ouL G = (2 : ℝ) • H - (4 : ℝ) • G
  hH : ouL H = (12 * m) • (1 : MvPolynomial ι ℝ) - (2 : ℝ) • H

/-- Ladders form a vector space. -/
lemma Ladder.lin {Y G H Y' G' H' : MvPolynomial ι ℝ} {m m' : ℝ} (h : Ladder Y G H m)
    (h' : Ladder Y' G' H' m') (c c' : ℝ) :
    Ladder (c • Y + c' • Y') (c • G + c' • G') (c • H + c' • H') (c * m + c' * m') where
  hY := by rw [map_add, map_smul, map_smul, h.hY, h'.hY]; module
  hG := by rw [map_add, map_smul, map_smul, h.hG, h'.hG]; module
  hH := by rw [map_add, map_smul, map_smul, h.hH, h'.hH]; module

lemma Ladder.congr {Y G H Y' G' H' : MvPolynomial ι ℝ} {m m' : ℝ} (h : Ladder Y G H m)
    (hY : Y = Y') (hG : G = G') (hH : H = H') (hm : m = m') : Ladder Y' G' H' m' := by
  subst hY hG hH hm; exact h

section expectation

variable {E : MvPolynomial ι ℝ →ₗ[ℝ] ℝ} (hE : IsGaussianExpectation E)
include hE

/-- **The energy identity of a ladder**: `2 E[GY] + 3m² − E[G²] = E[(G − H + 3m)²]`. -/
theorem Ladder.energy {Y G H : MvPolynomial ι ℝ} {m : ℝ} (hL : Ladder Y G H m) :
    2 * E (G * Y) + 3 * m ^ 2 - E (G * G)
      = E ((G - H + (3 * m) • (1 : MvPolynomial ι ℝ)) * (G - H + (3 * m) • 1)) := by
  have e1 := gE_ouL hE H
  have e2 := gE_ouL hE G
  have e3 := gE_ouL hE Y
  rw [hL.hH] at e1
  rw [hL.hG] at e2
  rw [hL.hY] at e3
  have r1 := gE_mul_ouL_comm hE Y G
  have r2 := gE_mul_ouL_comm hE Y H
  have r3 := gE_mul_ouL_comm hE G H
  rw [hL.hG, hL.hY] at r1
  rw [hL.hH, hL.hY] at r2
  rw [hL.hH, hL.hG] at r3
  simp only [map_sub, map_smul, smul_eq_mul, hE.one] at e1 e2 e3
  simp only [map_sub, map_smul, smul_eq_mul, mul_sub, mul_smul_comm, mul_one] at r1 r2 r3
  simp only [sub_mul, add_mul, mul_sub, mul_add, smul_mul_assoc, mul_smul_comm, one_mul, mul_one,
    map_add, map_sub, map_smul, smul_eq_mul, hE.one]
  have c1 : E (H * Y) = E (Y * H) := by rw [mul_comm]
  have c2 : E (Y * G) = E (G * Y) := by rw [mul_comm]
  have c3 : E (H * G) = E (G * H) := by rw [mul_comm]
  have hEH : E H = 6 * m := by linarith
  have hEG : E G = 3 * m := by linarith
  have hEY : E Y = m := by linarith
  rw [hEY] at r2
  rw [hEG] at r3 ⊢
  rw [hEH]
  linarith

variable [DecidableEq ι]

/-- The ladder of the square of a third-chaos polynomial. -/
lemma Chaos3.ladder {F : MvPolynomial ι ℝ} (hF : Chaos3 F) :
    Ladder (F * F) (gam F F) (gam2 F) (E (F * F)) where
  hY := by rw [hF.ouL_sq, ofNat_smul_poly, ofNat_smul_poly]
  hG := by rw [hF.ouL_gam, ofNat_smul_poly, ofNat_smul_poly]
  hH := by
    rw [hF.ouL_gam2, hF.gam3_eq hE, ofNat_smul_poly, smul_eq_C_mul, mul_one]
    simp only [map_mul, map_ofNat]
    ring

variable {a b : MvPolynomial ι ℝ}

/-- **The budget of `w`**: `E S² ≤ 2 E[S U] + 3`, i.e. `E(w − 1)² ≤ (2/3) E[(w − 1) U]`. -/
theorem budget_w (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2) :
    E (radS a b * radS a b) ≤ 2 * E (radS a b * radU a b) + 3 := by
  have hL := ((ha.ladder hE).lin (hb.ladder hE) 1 1).congr (Y' := radU a b) (G' := radS a b)
    (m' := 1) (by rw [one_smul, one_smul]; rfl) (by rw [one_smul, one_smul]; rfl) rfl
    (by rw [haa, hbb]; norm_num)
  have h := hL.energy hE
  have := hpos (radS a b - ((1 : ℝ) • gam2 a + (1 : ℝ) • gam2 b) + (3 * 1 : ℝ) • 1)
  linarith

/-- **The budget of `c`**: `E A² + E B² ≤ 2 E[A (a² − b²) + B · 2ab]`, i.e.
`E|c|² ≤ (2/3) Re E[c q̄²]`. -/
theorem budget_c (hpos : ∀ P : MvPolynomial ι ℝ, 0 ≤ E (P * P)) (ha : Chaos3 a)
    (hb : Chaos3 b) (haa : E (a * a) = 1 / 2) (hbb : E (b * b) = 1 / 2) (hab : E (a * b) = 0) :
    E (radA a b * radA a b) + E (radB a b * radB a b)
      ≤ 2 * E (radA a b * (a * a - b * b) + radB a b * (2 * (a * b))) := by
  obtain ⟨sp, sm⟩ := gE_add_sub_sq (E := E) (v := 1) (by rw [haa]) (by rw [hbb]) hab
  have hRe := ((ha.ladder hE).lin (hb.ladder hE) 1 (-1)).congr
    (Y' := a * a - b * b) (G' := radA a b) (m' := 0) (by module) (by unfold radA; module) rfl
    (by rw [haa, hbb]; norm_num)
  have hIm := (((ha.add hb).ladder hE).lin ((ha.sub hb).ladder hE) (1 / 2) (-(1 / 2))).congr
    (Y' := 2 * (a * b)) (G' := radB a b) (m' := 0)
    (by
      rw [show (2 : MvPolynomial ι ℝ) * (a * b) = (1 / 2 : ℝ) • ((a + b) * (a + b))
          + (-(1 / 2) : ℝ) • ((b - a) * (b - a)) by
        rw [neg_smul, ← sub_eq_add_neg, ← smul_sub,
          show (a + b) * (a + b) - (b - a) * (b - a) = (4 : ℝ) • (a * b) by
            rw [ofNat_smul_poly]; ring, smul_smul, ← ofNat_smul_poly]; norm_num])
    (by
      rw [gam_add_self, gam_sub_self, radB, neg_smul, ← sub_eq_add_neg, ← smul_sub,
        show gam a a + 2 * gam a b + gam b b - (gam a a - 2 * gam a b + gam b b)
          = (4 : ℝ) • gam a b by rw [ofNat_smul_poly]; ring, smul_smul, ← ofNat_smul_poly]
      norm_num)
    rfl (by rw [sp, sm]; norm_num)
  have h1 := hRe.energy hE
  have h2 := hIm.energy hE
  have p1 := hpos (radA a b - ((1 : ℝ) • gam2 a + (-1 : ℝ) • gam2 b) + (3 * 0 : ℝ) • 1)
  have p2 := hpos (radB a b - ((1 / 2 : ℝ) • gam2 (a + b) + (-(1 / 2) : ℝ) • gam2 (b - a))
    + (3 * 0 : ℝ) • 1)
  rw [map_add]
  nlinarith

end expectation

end

end Grothe.LowerAnalytic
