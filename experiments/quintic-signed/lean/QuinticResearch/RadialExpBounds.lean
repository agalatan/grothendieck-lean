import Mathlib.Data.Rat.Floor
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic.FieldSimp

/-! Directed dyadic enclosures for the radial Hermite prices. Agent-ID: codex-a7c4 -/
namespace Grothe.LowerAnalytic.RadialExpBounds

def down (p x : ℚ) : ℚ := ((x*p).floor : ℚ) / p

def up (p x : ℚ) : ℚ := -down p (-x)

theorem down_le {p : ℚ} (hp : 0<p) (x : ℚ) : down p x ≤ x := by
  exact (div_le_iff₀ hp).mpr (Int.floor_le (x*p))

theorem down_nonneg {p x : ℚ} (hp : 0<p) (hx : 0≤x) : 0≤down p x := by
  apply div_nonneg _ hp.le
  have h : 0 ≤ ⌊x*p⌋ := Int.floor_nonneg.mpr (mul_nonneg hx hp.le)
  exact_mod_cast h

theorem le_up {p : ℚ} (hp : 0<p) (x : ℚ) : x ≤ up p x := by
  have h := neg_le_neg (down_le hp (-x))
  simpa only [up,neg_neg] using h

def iterate (p : ℚ) : ℕ → ℚ × ℚ → ℚ × ℚ
  | 0,b => b
  | k+1,b =>
    let c := iterate p k b
    (down p (c.1^2), up p (c.2^2))

/-- Directed rational squaring encloses both powers without evaluating a large exponent. -/
theorem iterate_encloses {p l u : ℚ} (hp : 0<p) (hl : 0 ≤ l) (hu : 0 ≤ u)
    (k : ℕ) :
    let b := iterate p k (down p l, up p u)
    0 ≤ b.1 ∧ b.1 ≤ l^(2^k) ∧ u^(2^k) ≤ b.2 := by
  induction k with
  | zero => simpa only [iterate, pow_zero, pow_one] using
      And.intro (down_nonneg hp hl) (And.intro (down_le hp l) (le_up hp u))
  | succ k ih =>
    dsimp only [iterate]
    have hu' : 0 ≤ u^(2^k) := pow_nonneg hu _
    simpa only [pow_succ, pow_mul] using
      And.intro (down_nonneg hp (sq_nonneg (iterate p k (down p l, up p u)).1))
        (And.intro ((down_le hp _).trans (pow_le_pow_left₀ ih.1 ih.2.1 2))
          ((pow_le_pow_left₀ hu' ih.2.2 2).trans (le_up hp _)))


/-- The rational bounds underlying the dyadic enclosure, at an arbitrary positive scale. -/
theorem exp_neg_pow_bracket (n : ℕ) (hn : 0<n) {t : ℝ} (ht : 0≤t) (hmax : t≤n) :
    (1-t/(n:ℝ))^n ≤ Real.exp (-t) ∧ Real.exp (-t) ≤ ((1+t/(n:ℝ))⁻¹)^n := by
  have hpos : 0<(n:ℝ) := by exact_mod_cast hn
  have hy : 0≤t/(n:ℝ) := div_nonneg ht hpos.le
  have htop : t/(n:ℝ)≤1 := (div_le_one hpos).mpr hmax
  have hlow : 1-t/(n:ℝ) ≤ Real.exp (-(t/(n:ℝ))) := by
    linarith only [Real.add_one_le_exp (-(t/(n:ℝ)))]
  have hu : 1+t/(n:ℝ)≤Real.exp (t/(n:ℝ)) := by linarith only [Real.add_one_le_exp (t/(n:ℝ))]
  have hhigh : Real.exp (-(t/(n:ℝ))) ≤ (1+t/(n:ℝ))⁻¹ := by
    rw [Real.exp_neg]
    exact (inv_le_inv₀ (Real.exp_pos _) (by linarith only [hy])).mpr hu
  have hid : Real.exp (-(t/(n:ℝ)))^n = Real.exp (-t) := by
    rw [← Real.exp_nat_mul]
    congr 1
    field_simp
  rw [← hid]
  exact ⟨pow_le_pow_left₀ (sub_nonneg.mpr htop) hlow n,
    pow_le_pow_left₀ (Real.exp_pos _).le hhigh n⟩


def expBounds (p : ℚ) (k : ℕ) (t : ℚ) : ℚ × ℚ :=
  let m : ℕ := 2^k
  iterate p k (down p (1-t/(m:ℚ)), up p ((1+t/(m:ℚ))⁻¹))

/-- Both endpoints are computed entirely in ℚ. The precision p and the
number of directed squarings k are independent. -/
theorem expBounds_enclose {p t : ℚ} (hp : 0 < p) (ht : 0 ≤ t) (k : ℕ)
    (hmax : t ≤ ((2^k:ℕ):ℚ)) :
    ((expBounds p k t).1:ℝ) ≤ Real.exp (-(t:ℝ)) ∧
      Real.exp (-(t:ℝ)) ≤ ((expBounds p k t).2:ℝ) := by
  let m : ℕ := 2^k
  have hm : 0 < m := Nat.pow_pos (by decide)
  have hmq : (0:ℚ) < m := by exact_mod_cast hm
  have hlo : (0:ℚ) ≤ 1-t/(m:ℚ) := sub_nonneg.mpr ((div_le_one hmq).mpr hmax)
  have hhi : (0:ℚ) ≤ (1+t/(m:ℚ))⁻¹ := by positivity
  have hpow := iterate_encloses hp hlo hhi k
  have hbr := exp_neg_pow_bracket m hm (by exact_mod_cast ht : (0:ℝ) ≤ (t:ℝ))
    (by exact_mod_cast hmax : (t:ℝ) ≤ m)
  constructor
  · apply le_trans _ hbr.1
    exact_mod_cast hpow.2.1
  · apply le_trans hbr.2
    exact_mod_cast hpow.2.2

end Grothe.LowerAnalytic.RadialExpBounds
