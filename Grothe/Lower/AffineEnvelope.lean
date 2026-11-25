import Grothe.Lower.Envelope

set_option warningAsError true

/-!
# A scalar envelope with affine mixture weights

At each value of the scalar parameter, two valid rows can be mixed with
weight `offset + slope * t`. After dropping the retained square, their value
is quadratic in `t`. The exact interval maximum includes its interior vertex.

Agent-ID: codex-a7c4
-/

namespace Grothe.Lower

open LowerAnalytic

structure AffineEnvCell where
  lo : ℚ
  hi : ℚ
  i : ℕ
  j : ℕ
  offset : ℚ
  slope : ℚ

/-- Coefficients of the mixed scalar bound in increasing powers of the profile parameter. -/
private structure Quadratic where
  constant : ℚ
  linear : ℚ
  quadratic : ℚ

private def mixQuadratic (a b : EnvRow) (offset slope : ℚ) : Quadratic :=
  let d := b.ell - a.ell
  let k := 2 / ε * (b.beta - a.beta) ^ 2
  let s := b.C - a.C - k
  ⟨a.C + s * offset + k * offset ^ 2,
   -2 * (a.ell + offset * d) + s * slope + 2 * k * offset * slope,
   1 - 2 * d * slope + k * slope ^ 2⟩

def affineCellCap (a b : EnvRow) (c : AffineEnvCell) : ℚ :=
  let q := mixQuadratic a b c.offset c.slope
  quadMax q.constant q.linear q.quadratic c.lo c.hi

theorem mix_le_affineCellCap (a b : EnvRow) (c : AffineEnvCell) (t : ℝ)
    (hlo : (c.lo : ℝ) ≤ t) (hhi : t ≤ c.hi) :
    let θ := (c.offset : ℝ) + c.slope * t
    t ^ 2 - 2 * ((1 - θ) * a.ell + θ * b.ell) * t +
      ((1 - θ) * a.C + θ * b.C - (2 / (ε : ℝ)) * θ * (1 - θ) * (a.beta - b.beta : ℝ) ^ 2)
      ≤ (affineCellCap a b c : ℝ) := by
  let q := mixQuadratic a b c.offset c.slope
  apply le_trans (le_of_eq ?_) (quadVal_le_quadMax q.constant q.linear q.quadratic c.lo c.hi t hlo hhi)
  dsimp only [q, mixQuadratic]
  push_cast
  ring

/-- An increasing affine weight belongs to the unit interval throughout the cell when both endpoints do. -/
def affineCellOK (rows : List Row) (S B : ℚ) (c : AffineEnvCell) : Bool :=
  let m := (c.lo + c.hi) / 2
  match envRowAt rows S m c.i, envRowAt rows S m c.j with
  | some a, some b => decide (0 ≤ c.slope ∧ 0 ≤ c.offset + c.slope * c.lo ∧
      c.offset + c.slope * c.hi ≤ 1 ∧ affineCellCap a b c ≤ B)
  | _, _ => false

def checkAffineEnvelope (rows : List Row) (S B : ℚ) (cells : List AffineEnvCell) : Bool :=
  chainTo AffineEnvCell.lo AffineEnvCell.hi 0 (9 / 10) cells &&
    cells.all (affineCellOK rows S B)

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Either of the rows used in a checked cell may come from the mass tangent. -/
theorem affineCell_bound (rows : List Row) (S B : ℚ) (c : AffineEnvCell)
    (hok : affineCellOK rows S B c = true) {V t : ℝ} {Qh v : E}
    (hv : ‖v‖ ^ 2 = 2) (hlo : (c.lo : ℝ) ≤ t) (hhi : t ≤ c.hi)
    (hrows : ∀ k m a, envRowAt rows S m k = some a → RowOf a V t Qh v) : V ≤ B := by
  let m := (c.lo + c.hi) / 2
  unfold affineCellOK at hok
  cases ha : envRowAt rows S m c.i with
  | none => simp [m, ha] at hok
  | some a =>
    cases hb : envRowAt rows S m c.j with
    | none => simp [m, ha, hb] at hok
    | some b =>
      change (match envRowAt rows S m c.i, envRowAt rows S m c.j with
        | some x, some y => decide (0 ≤ c.slope ∧ 0 ≤ c.offset + c.slope * c.lo ∧
            c.offset + c.slope * c.hi ≤ 1 ∧ affineCellCap x y c ≤ B)
        | _, _ => false) = true at hok
      rw [ha, hb] at hok
      obtain ⟨hs, hstart, hstop, hcap⟩ := of_decide_eq_true hok
      have hs' : 0 ≤ (c.slope : ℝ) := by exact_mod_cast hs
      have left : 0 ≤ (c.offset : ℝ) + c.slope * c.lo := by exact_mod_cast hstart
      have right : (c.offset : ℝ) + c.slope * c.hi ≤ 1 := by exact_mod_cast hstop
      have hθ0 := left.trans (add_le_add_right (mul_le_mul_of_nonneg_left hlo hs') _)
      have hθ1 := (add_le_add_right (mul_le_mul_of_nonneg_left hhi hs') _).trans right
      have hε : (0 : ℝ) < ε := by norm_num [ε]
      have hmix := RowHolds.mix hε hv (hrows c.i m a ha) (hrows c.j m b hb)
        ((c.offset : ℝ) + c.slope * t) hθ0 hθ1
      exact (hmix.le hε.le).trans ((mix_le_affineCellCap a b c t hlo hhi).trans (by exact_mod_cast hcap))

/-- A checked chain of affine mixtures caps all scalar profiles on the closed interval. -/
theorem affineEnvelope_bound (rows : List Row) (S B : ℚ) (cells : List AffineEnvCell)
    (h : checkAffineEnvelope rows S B cells = true) {V t : ℝ} {Qh v : E}
    (hv : ‖v‖ ^ 2 = 2) (h0 : 0 ≤ t) (h9 : t ≤ 9 / 10)
    (hrows : ∀ k m a, envRowAt rows S m k = some a → RowOf a V t Qh v) : V ≤ B := by
  obtain ⟨hchain, hcells⟩ := Bool.and_eq_true_iff.mp h
  obtain ⟨c, hc, hlo, hhi⟩ := chainTo_sound AffineEnvCell.lo AffineEnvCell.hi cells
    0 (9 / 10) hchain t (by simpa using h0) (by push_cast; exact h9)
  exact affineCell_bound rows S B c (List.all_eq_true.mp hcells c hc) hv hlo hhi hrows

end Grothe.Lower
