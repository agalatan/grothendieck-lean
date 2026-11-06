import Mathlib.Analysis.Complex.TaylorSeries
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.SpecificLimits.Normed

/-!
# Off-axis growth of an entire family with a raising derivative (part (Q) of `hQuad`)

Generic statement, used for the entire extension of the canonical conditional coefficients
`U_{c,d}`: let `U c d : ℂ → ℂ` be entire with
`U_{c,d}' = √(c+1) U_{c+1,d} + √(d+1) U_{c,d+1}` and let `α` be a point where the whole family
has `ℓ²` mass at most `1` on every triangle `c + d ≤ M`.  Then for every shift `z`
```
Σ_{c+d ≤ D} |U_{c,d}(α + z)|² ≤ (Σ_r |z|^r √(Π_{i<r} 2(D+1+i)) / r!)²        (sqSum_shift_le)
```
Proof: the Taylor series at `α` (`Complex.hasSum_taylorSeries_of_entire`) of the vector
`(U_{c,d})_{c+d ≤ D}`, whose `r`-th derivative is the `r`-th power of the raising operator `R`
(`iteratedDeriv_eq_Rop`), and `‖R V‖²_{≤M} ≤ 2(M+1) ‖V‖²_{≤M+1}` (`sqSum_Rop_le`).

Agent-ID: claude-b9ee. Refs #303.
-/

namespace Grothe.UpperQuad.TaylorShift

open Complex
open scoped Nat

noncomputable section

/-- The triangle `c + d ≤ M`. -/
def tri (M : ℕ) : Finset (ℕ × ℕ) :=
  (Finset.range (M + 1) ×ˢ Finset.range (M + 1)).filter (fun p => p.1 + p.2 ≤ M)

lemma mem_tri {M : ℕ} {p : ℕ × ℕ} : p ∈ tri M ↔ p.1 + p.2 ≤ M := by
  unfold tri
  rw [Finset.mem_filter, Finset.mem_product, Finset.mem_range, Finset.mem_range]
  constructor
  · exact fun h => h.2
  · intro h; exact ⟨⟨by omega, by omega⟩, h⟩

/-- The raising operator. -/
def Rop (V : ℕ → ℕ → ℂ) : ℕ → ℕ → ℂ := fun c d =>
  ((Real.sqrt (c + 1) : ℝ) : ℂ) * V (c + 1) d + ((Real.sqrt (d + 1) : ℝ) : ℂ) * V c (d + 1)

/-- The squared mass on a triangle. -/
def sqSum (M : ℕ) (V : ℕ → ℕ → ℂ) : ℝ := ∑ p ∈ tri M, ‖V p.1 p.2‖ ^ 2

lemma sqSum_nonneg (M : ℕ) (V : ℕ → ℕ → ℂ) : 0 ≤ sqSum M V :=
  Finset.sum_nonneg fun _ _ => sq_nonneg _

lemma sum_shift_le (M : ℕ) (g : ℕ × ℕ → ℝ) (hg : ∀ p, 0 ≤ g p) (e : ℕ × ℕ → ℕ × ℕ)
    (he : Function.Injective e) (hmem : ∀ p ∈ tri M, e p ∈ tri (M + 1)) :
    ∑ p ∈ tri M, g (e p) ≤ ∑ p ∈ tri (M + 1), g p := by
  rw [← Finset.sum_image (fun x _ y _ h => he h)]
  apply Finset.sum_le_sum_of_subset_of_nonneg
  · intro x hx
    obtain ⟨p, hp, rfl⟩ := Finset.mem_image.mp hx
    exact hmem p hp
  · exact fun _ _ _ => hg _

/-- **One raising step**: `‖R V‖²_{≤M} ≤ 2(M+1) ‖V‖²_{≤M+1}`. -/
theorem sqSum_Rop_le (M : ℕ) (V : ℕ → ℕ → ℂ) :
    sqSum M (Rop V) ≤ 2 * (M + 1) * sqSum (M + 1) V := by
  set f : ℕ × ℕ → ℝ := fun p => ‖V p.1 p.2‖ ^ 2 with hf
  have hpt : ∀ p ∈ tri M, ‖Rop V p.1 p.2‖ ^ 2 ≤
      2 * ((p.1 + 1 : ℝ) * f (p.1 + 1, p.2)) + 2 * ((p.2 + 1 : ℝ) * f (p.1, p.2 + 1)) := by
    intro p _
    unfold Rop
    have h1 := norm_add_le (((Real.sqrt (p.1 + 1) : ℝ) : ℂ) * V (p.1 + 1) p.2)
      (((Real.sqrt (p.2 + 1) : ℝ) : ℂ) * V p.1 (p.2 + 1))
    rw [norm_mul, norm_mul, Complex.norm_real, Complex.norm_real, Real.norm_eq_abs,
      Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), abs_of_nonneg (Real.sqrt_nonneg _)] at h1
    have hs1 : Real.sqrt (p.1 + 1) ^ 2 = p.1 + 1 := Real.sq_sqrt (by positivity)
    have hs2 : Real.sqrt (p.2 + 1) ^ 2 = p.2 + 1 := Real.sq_sqrt (by positivity)
    simp only [hf]
    set x := Real.sqrt (p.1 + 1) * ‖V (p.1 + 1) p.2‖
    set y := Real.sqrt (p.2 + 1) * ‖V p.1 (p.2 + 1)‖
    have hx : x ^ 2 = (p.1 + 1) * ‖V (p.1 + 1) p.2‖ ^ 2 := by rw [mul_pow, hs1]
    have hy : y ^ 2 = (p.2 + 1) * ‖V p.1 (p.2 + 1)‖ ^ 2 := by rw [mul_pow, hs2]
    have h0 := norm_nonneg (Rop V p.1 p.2)
    calc _ ≤ (x + y) ^ 2 := pow_le_pow_left₀ (norm_nonneg _) h1 2
      _ ≤ 2 * x ^ 2 + 2 * y ^ 2 := by nlinarith [sq_nonneg (x - y)]
      _ = _ := by rw [hx, hy]
  have hA : ∑ p ∈ tri M, (p.1 + 1 : ℝ) * f (p.1 + 1, p.2) ≤
      ∑ p ∈ tri (M + 1), (p.1 : ℝ) * f p := by
    have := sum_shift_le M (fun p => (p.1 : ℝ) * f p)
      (fun p => mul_nonneg (Nat.cast_nonneg _) (sq_nonneg _)) (fun p => (p.1 + 1, p.2))
      (by intro p q h; simp only [Prod.mk.injEq, add_left_inj] at h; exact Prod.ext h.1 h.2)
      (by intro p hp; rw [mem_tri] at hp ⊢; simp only; omega)
    simpa only [Nat.cast_add, Nat.cast_one] using this
  have hB : ∑ p ∈ tri M, (p.2 + 1 : ℝ) * f (p.1, p.2 + 1) ≤
      ∑ p ∈ tri (M + 1), (p.2 : ℝ) * f p := by
    have := sum_shift_le M (fun p => (p.2 : ℝ) * f p)
      (fun p => mul_nonneg (Nat.cast_nonneg _) (sq_nonneg _)) (fun p => (p.1, p.2 + 1))
      (by intro p q h; simp only [Prod.mk.injEq, add_left_inj] at h; exact Prod.ext h.1 h.2)
      (by intro p hp; rw [mem_tri] at hp ⊢; simp only; omega)
    simpa only [Nat.cast_add, Nat.cast_one] using this
  have hC : ∑ p ∈ tri (M + 1), ((p.1 : ℝ) * f p + (p.2 : ℝ) * f p) ≤
      ∑ p ∈ tri (M + 1), ((M + 1 : ℝ) * f p) := by
    apply Finset.sum_le_sum
    intro p hp
    rw [mem_tri] at hp
    rw [← add_mul]
    apply mul_le_mul_of_nonneg_right _ (sq_nonneg _)
    exact_mod_cast hp
  unfold sqSum
  calc ∑ p ∈ tri M, ‖Rop V p.1 p.2‖ ^ 2
      ≤ ∑ p ∈ tri M, (2 * ((p.1 + 1 : ℝ) * f (p.1 + 1, p.2)) +
          2 * ((p.2 + 1 : ℝ) * f (p.1, p.2 + 1))) := Finset.sum_le_sum hpt
    _ = 2 * (∑ p ∈ tri M, (p.1 + 1 : ℝ) * f (p.1 + 1, p.2) +
          ∑ p ∈ tri M, (p.2 + 1 : ℝ) * f (p.1, p.2 + 1)) := by
        rw [Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.mul_sum]; ring
    _ ≤ 2 * (∑ p ∈ tri (M + 1), ((p.1 : ℝ) * f p + (p.2 : ℝ) * f p)) := by
        rw [Finset.sum_add_distrib]; linarith
    _ ≤ 2 * ∑ p ∈ tri (M + 1), ((M + 1 : ℝ) * f p) := by linarith
    _ = 2 * (M + 1) * ∑ p ∈ tri (M + 1), ‖V p.1 p.2‖ ^ 2 := by
        rw [← Finset.mul_sum]; ring

/-- The product `Π_{i<r} 2(D+1+i)`. -/
def raiseProd (D r : ℕ) : ℝ := ∏ i ∈ Finset.range r, (2 * ((D : ℝ) + 1 + i))

lemma raiseProd_nonneg (D r : ℕ) : 0 ≤ raiseProd D r :=
  Finset.prod_nonneg fun _ _ => by positivity

/-- **Iterated raising**. -/
theorem sqSum_iterate_Rop_le (r : ℕ) : ∀ (D : ℕ) (V : ℕ → ℕ → ℂ),
    sqSum D (Rop^[r] V) ≤ raiseProd D r * sqSum (D + r) V := by
  induction r with
  | zero => intro D V; simp [raiseProd]
  | succ r ih =>
    intro D V
    rw [Function.iterate_succ_apply]
    have h1 := ih D (Rop V)
    have h2 := sqSum_Rop_le (D + r) V
    have hP : raiseProd D (r + 1) = raiseProd D r * (2 * ((D : ℝ) + 1 + r)) := by
      unfold raiseProd; rw [Finset.prod_range_succ]
    rw [hP, show D + (r + 1) = D + r + 1 by ring]
    calc _ ≤ raiseProd D r * sqSum (D + r) (Rop V) := h1
      _ ≤ raiseProd D r * (2 * ((D + r : ℕ) + 1) * sqSum (D + r + 1) V) :=
          mul_le_mul_of_nonneg_left h2 (raiseProd_nonneg D r)
      _ = _ := by push_cast; ring

/-- **The derivatives of a raising family are the powers of the raising operator.** -/
theorem iteratedDeriv_eq_Rop (U : ℕ → ℕ → ℂ → ℂ) (hU : ∀ c d, Differentiable ℂ (U c d))
    (hD : ∀ c d A, deriv (U c d) A = ((Real.sqrt (c + 1) : ℝ) : ℂ) * U (c + 1) d A +
      ((Real.sqrt (d + 1) : ℝ) : ℂ) * U c (d + 1) A) (r : ℕ) :
    ∀ c d A, iteratedDeriv r (U c d) A = (Rop^[r] (fun c d => U c d A)) c d := by
  induction r with
  | zero => intro c d A; simp
  | succ r ih =>
    intro c d A
    rw [iteratedDeriv_succ', Function.iterate_succ_apply']
    have hfun : deriv (U c d) = fun A => ((Real.sqrt (c + 1) : ℝ) : ℂ) * U (c + 1) d A +
        ((Real.sqrt (d + 1) : ℝ) : ℂ) * U c (d + 1) A := funext (hD c d)
    rw [hfun]
    have h1 : ContDiffAt ℂ r (fun A => ((Real.sqrt (c + 1) : ℝ) : ℂ) * U (c + 1) d A) A :=
      (contDiffAt_const.mul ((hU (c + 1) d).contDiff.contDiffAt)).of_le le_top
    have h2 : ContDiffAt ℂ r (fun A => ((Real.sqrt (d + 1) : ℝ) : ℂ) * U c (d + 1) A) A :=
      (contDiffAt_const.mul ((hU c (d + 1)).contDiff.contDiffAt)).of_le le_top
    rw [iteratedDeriv_fun_add h1 h2,
      iteratedDeriv_const_mul _ (((hU (c + 1) d).contDiff.contDiffAt).of_le le_top),
      iteratedDeriv_const_mul _ (((hU c (d + 1)).contDiff.contDiffAt).of_le le_top),
      ih, ih]
    rfl

/-- The Taylor majorant term `|z|^r √(Π_{i<r} 2(D+1+i)) / r!`. -/
def shiftTerm (D : ℕ) (t : ℝ) (r : ℕ) : ℝ := t ^ r * Real.sqrt (raiseProd D r) / (r ! : ℝ)

lemma shiftTerm_nonneg (D : ℕ) {t : ℝ} (ht : 0 ≤ t) (r : ℕ) : 0 ≤ shiftTerm D t r := by
  unfold shiftTerm; positivity

lemma shiftTerm_succ (D : ℕ) {t : ℝ} (_ht : 0 ≤ t) (r : ℕ) :
    shiftTerm D t (r + 1) = shiftTerm D t r * (t * Real.sqrt (2 * ((D : ℝ) + 1 + r)) / (r + 1)) := by
  unfold shiftTerm raiseProd
  rw [Finset.prod_range_succ, Real.sqrt_mul (Finset.prod_nonneg fun _ _ => by positivity),
    Nat.factorial_succ, pow_succ]
  push_cast
  field_simp

lemma summable_shiftTerm (D : ℕ) {t : ℝ} (ht : 0 ≤ t) : Summable (shiftTerm D t) := by
  apply summable_of_ratio_norm_eventually_le (r := 1 / 2) (by norm_num)
  -- the ratio `t √(2(D+1+r))/(r+1)` tends to `0`
  have hlim : Filter.Tendsto (fun r : ℕ => t * Real.sqrt (2 * ((D : ℝ) + 1 + r)) / (r + 1))
      Filter.atTop (nhds 0) := by
    set C : ℝ := t * Real.sqrt (2 * ((D : ℝ) + 1)) with hC
    have hsq : Filter.Tendsto (fun r : ℕ => Real.sqrt ((r : ℝ) + 1)) Filter.atTop Filter.atTop :=
      Real.tendsto_sqrt_atTop.comp (Filter.tendsto_atTop_add_const_right _ 1
        tendsto_natCast_atTop_atTop)
    have hup : Filter.Tendsto (fun r : ℕ => C * (Real.sqrt ((r : ℝ) + 1))⁻¹) Filter.atTop
        (nhds 0) := by
      simpa using hsq.inv_tendsto_atTop.const_mul C
    apply tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hup
    · intro r; positivity
    · intro r
      have hr1 : (0 : ℝ) < (r : ℝ) + 1 := by positivity
      have hs1 : 0 < Real.sqrt ((r : ℝ) + 1) := Real.sqrt_pos.mpr hr1
      have hss : Real.sqrt ((r : ℝ) + 1) * Real.sqrt ((r : ℝ) + 1) = (r : ℝ) + 1 :=
        Real.mul_self_sqrt hr1.le
      have hle : Real.sqrt (2 * ((D : ℝ) + 1 + r)) ≤
          Real.sqrt (2 * ((D : ℝ) + 1)) * Real.sqrt ((r : ℝ) + 1) := by
        rw [← Real.sqrt_mul (by positivity)]
        apply Real.sqrt_le_sqrt
        nlinarith [(Nat.cast_nonneg D : (0:ℝ) ≤ D), (Nat.cast_nonneg r : (0:ℝ) ≤ r)]
      simp only
      rw [hC, div_le_iff₀ hr1]
      calc t * Real.sqrt (2 * ((D : ℝ) + 1 + r)) ≤
            t * (Real.sqrt (2 * ((D : ℝ) + 1)) * Real.sqrt ((r : ℝ) + 1)) :=
            mul_le_mul_of_nonneg_left hle ht
        _ = t * Real.sqrt (2 * ((D : ℝ) + 1)) * (Real.sqrt ((r : ℝ) + 1))⁻¹ * ((r : ℝ) + 1) := by
            field_simp
            rw [sq, hss]
  have hev := (hlim.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1 / 2)))
  filter_upwards [hev] with r hr
  rw [Real.norm_eq_abs, Real.norm_eq_abs, abs_of_nonneg (shiftTerm_nonneg D ht _),
    abs_of_nonneg (shiftTerm_nonneg D ht _), shiftTerm_succ D ht r]
  have h0 := shiftTerm_nonneg D ht r
  have h1 : 0 ≤ t * Real.sqrt (2 * ((D : ℝ) + 1 + r)) / (r + 1) := by positivity
  nlinarith

/-- **The off-axis bound.** -/
theorem sqSum_shift_le (U : ℕ → ℕ → ℂ → ℂ) (hU : ∀ c d, Differentiable ℂ (U c d))
    (hD : ∀ c d A, deriv (U c d) A = ((Real.sqrt (c + 1) : ℝ) : ℂ) * U (c + 1) d A +
      ((Real.sqrt (d + 1) : ℝ) : ℂ) * U c (d + 1) A)
    (α : ℂ) (hα : ∀ M, sqSum M (fun c d => U c d α) ≤ 1) (D : ℕ) (z : ℂ) :
    sqSum D (fun c d => U c d (α + z)) ≤ (∑' r, shiftTerm D ‖z‖ r) ^ 2 := by
  set S := tri D
  -- the vector of the family on the triangle
  let W : ℂ → EuclideanSpace ℂ S := fun A => WithLp.toLp 2 (fun p : S => U p.1.1 p.1.2 A)
  have hnormW : ∀ (f : S → ℂ), ‖(WithLp.toLp 2 f : EuclideanSpace ℂ S)‖ ^ 2 =
      ∑ p ∈ S, ‖(fun q : ℕ × ℕ => if h : q ∈ S then f ⟨q, h⟩ else 0) p‖ ^ 2 := by
    intro f
    rw [EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _)]
    rw [← Finset.sum_coe_sort S]
    apply Finset.sum_congr rfl
    intro p _
    simp [p.2]
  set v : ℕ → EuclideanSpace ℂ S := fun r => WithLp.toLp 2 (fun p : S =>
    ((r ! : ℂ)⁻¹ • z ^ r • iteratedDeriv r (U p.1.1 p.1.2) α)) with hv
  have hsum : HasSum v (W (α + z)) := by
    have hpi : HasSum (fun r => (fun p : S => ((r ! : ℂ)⁻¹ • z ^ r •
        iteratedDeriv r (U p.1.1 p.1.2) α))) (fun p : S => U p.1.1 p.1.2 (α + z)) := by
      rw [Pi.hasSum]
      intro p
      have h := Complex.hasSum_taylorSeries_of_entire (hU p.1.1 p.1.2) α (α + z)
      simpa only [add_sub_cancel_left] using h
    have := (EuclideanSpace.equiv S ℂ).symm.toContinuousLinearMap.hasSum hpi
    convert this using 1 <;> rfl
  have hbound : ∀ r, ‖v r‖ ≤ shiftTerm D ‖z‖ r := by
    intro r
    have hsq : ‖v r‖ ^ 2 ≤ (shiftTerm D ‖z‖ r) ^ 2 := by
      simp only [hv]
      rw [hnormW]
      have hpt : ∀ p ∈ S, ‖(fun q : ℕ × ℕ => if h : q ∈ S then
          ((r ! : ℂ)⁻¹ • z ^ r • iteratedDeriv r (U q.1 q.2) α) else 0) p‖ ^ 2 =
          (‖z‖ ^ r / (r ! : ℝ)) ^ 2 * ‖(Rop^[r] (fun c d => U c d α)) p.1 p.2‖ ^ 2 := by
        intro p hp
        simp only [hp, dite_true]
        rw [iteratedDeriv_eq_Rop U hU hD r, smul_eq_mul, smul_eq_mul, norm_mul, norm_mul,
          norm_inv, norm_pow, Complex.norm_natCast]
        ring
      rw [Finset.sum_congr rfl hpt, ← Finset.mul_sum]
      have h1 := sqSum_iterate_Rop_le r D (fun c d => U c d α)
      have h2 := hα (D + r)
      have hP := raiseProd_nonneg D r
      unfold shiftTerm
      rw [show (‖z‖ ^ r * Real.sqrt (raiseProd D r) / (r ! : ℝ)) ^ 2 =
        (‖z‖ ^ r) ^ 2 * raiseProd D r / (r ! : ℝ) ^ 2 by rw [div_pow, mul_pow, Real.sq_sqrt hP]]
      have hS : ∑ p ∈ S, ‖(Rop^[r] (fun c d => U c d α)) p.1 p.2‖ ^ 2 ≤ raiseProd D r := by
        calc _ = sqSum D (Rop^[r] (fun c d => U c d α)) := rfl
          _ ≤ raiseProd D r * sqSum (D + r) (fun c d => U c d α) := h1
          _ ≤ raiseProd D r * 1 := mul_le_mul_of_nonneg_left h2 hP
          _ = raiseProd D r := mul_one _
      calc (‖z‖ ^ r / (r ! : ℝ)) ^ 2 * ∑ p ∈ S, ‖(Rop^[r] (fun c d => U c d α)) p.1 p.2‖ ^ 2
          ≤ (‖z‖ ^ r / (r ! : ℝ)) ^ 2 * raiseProd D r :=
            mul_le_mul_of_nonneg_left hS (sq_nonneg _)
        _ = (‖z‖ ^ r) ^ 2 * raiseProd D r / (r ! : ℝ) ^ 2 := by ring
    exact (pow_le_pow_iff_left₀ (norm_nonneg _) (shiftTerm_nonneg D (norm_nonneg z) r)
      two_ne_zero).mp hsq
  have hle := hsum.norm_le_of_bounded (summable_shiftTerm D (norm_nonneg z)).hasSum hbound
  have hW : sqSum D (fun c d => U c d (α + z)) = ‖W (α + z)‖ ^ 2 := by
    rw [hnormW]
    unfold sqSum
    apply Finset.sum_congr rfl
    intro p hp
    have hp' : p ∈ S := hp
    simp only [hp', dite_true]
  rw [hW]
  exact pow_le_pow_left₀ (norm_nonneg _) hle 2

/-- A nonnegative series whose ratio is at most `q < 1` beyond `R` is bounded by its first `R`
terms and a geometric tail. -/
theorem tsum_le_of_ratio (b : ℕ → ℝ) (_hb : ∀ r, 0 ≤ b r) (hs : Summable b) (R : ℕ) {q : ℝ}
    (hq0 : 0 ≤ q) (hq : q < 1) (hratio : ∀ r, R ≤ r → b (r + 1) ≤ q * b r) :
    ∑' r, b r ≤ ∑ r ∈ Finset.range R, b r + b R / (1 - q) := by
  have hk : ∀ k, b (R + k) ≤ q ^ k * b R := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      calc b (R + (k + 1)) = b (R + k + 1) := by rw [add_assoc]
        _ ≤ q * b (R + k) := hratio _ (by omega)
        _ ≤ q * (q ^ k * b R) := mul_le_mul_of_nonneg_left ih hq0
        _ = q ^ (k + 1) * b R := by ring
  rw [← hs.sum_add_tsum_nat_add R]
  have hgeo : HasSum (fun k : ℕ => q ^ k * b R) ((1 - q)⁻¹ * b R) :=
    (hasSum_geometric_of_lt_one hq0 hq).mul_right _
  have htail : ∑' k, b (k + R) ≤ (1 - q)⁻¹ * b R := by
    rw [← hgeo.tsum_eq]
    exact Summable.tsum_le_tsum (fun k => by rw [add_comm]; exact hk k)
      ((summable_nat_add_iff R).mpr hs) hgeo.summable
  rw [div_eq_inv_mul]
  linarith

/-- **The truncated off-axis majorant**: the ratio of consecutive terms is decreasing, so a check
at `R` bounds the whole tail. -/
theorem tsum_shiftTerm_le (D : ℕ) {t : ℝ} (ht : 0 ≤ t) (R : ℕ) {q : ℝ} (hq0 : 0 ≤ q) (hq : q < 1)
    (hR : 2 * t ^ 2 * ((D : ℝ) + 1 + R) ≤ q ^ 2 * ((R : ℝ) + 1) ^ 2) :
    ∑' r, shiftTerm D t r ≤
      ∑ r ∈ Finset.range R, shiftTerm D t r + shiftTerm D t R / (1 - q) := by
  apply tsum_le_of_ratio _ (shiftTerm_nonneg D ht) (summable_shiftTerm D ht) R hq0 hq
  intro r hr
  rw [shiftTerm_succ D ht r, mul_comm]
  apply mul_le_mul_of_nonneg_right _ (shiftTerm_nonneg D ht r)
  -- `t √(2(D+1+r)) / (r+1) ≤ q`
  have hr1 : (0 : ℝ) < (r : ℝ) + 1 := by positivity
  rw [div_le_iff₀ hr1]
  have hrR : (R : ℝ) ≤ r := by exact_mod_cast hr
  have hkey : 2 * t ^ 2 * ((D : ℝ) + 1 + r) ≤ q ^ 2 * ((r : ℝ) + 1) ^ 2 := by
    -- `(D+1+r)(R+1)² ≤ (D+1+R)(r+1)²`
    have hD : (0 : ℝ) ≤ D := Nat.cast_nonneg D
    have hR0 : (0 : ℝ) ≤ R := Nat.cast_nonneg R
    have hmono : ((D : ℝ) + 1 + r) * ((R : ℝ) + 1) ^ 2 ≤ ((D : ℝ) + 1 + R) * ((r : ℝ) + 1) ^ 2 := by
      nlinarith [mul_nonneg (sub_nonneg.mpr hrR) hD, mul_nonneg (sub_nonneg.mpr hrR) hR0,
        mul_nonneg (mul_nonneg (sub_nonneg.mpr hrR) hR0) hR0,
        mul_nonneg (mul_nonneg (sub_nonneg.mpr hrR) hD) hR0,
        mul_nonneg (mul_nonneg (sub_nonneg.mpr hrR) (sub_nonneg.mpr hrR)) hD,
        mul_nonneg (mul_nonneg (sub_nonneg.mpr hrR) (sub_nonneg.mpr hrR)) hR0,
        mul_nonneg (sub_nonneg.mpr hrR) (sub_nonneg.mpr hrR)]
    have hR1 : (0 : ℝ) < ((R : ℝ) + 1) ^ 2 := by positivity
    have : 2 * t ^ 2 * ((D : ℝ) + 1 + r) * ((R : ℝ) + 1) ^ 2 ≤
        q ^ 2 * ((r : ℝ) + 1) ^ 2 * ((R : ℝ) + 1) ^ 2 := by
      calc 2 * t ^ 2 * ((D : ℝ) + 1 + r) * ((R : ℝ) + 1) ^ 2
          = 2 * t ^ 2 * (((D : ℝ) + 1 + r) * ((R : ℝ) + 1) ^ 2) := by ring
        _ ≤ 2 * t ^ 2 * (((D : ℝ) + 1 + R) * ((r : ℝ) + 1) ^ 2) :=
            mul_le_mul_of_nonneg_left hmono (by positivity)
        _ = 2 * t ^ 2 * ((D : ℝ) + 1 + R) * ((r : ℝ) + 1) ^ 2 := by ring
        _ ≤ q ^ 2 * ((R : ℝ) + 1) ^ 2 * ((r : ℝ) + 1) ^ 2 :=
            mul_le_mul_of_nonneg_right hR (by positivity)
        _ = _ := by ring
    exact le_of_mul_le_mul_right this hR1
  have hs : Real.sqrt (2 * ((D : ℝ) + 1 + r)) ^ 2 = 2 * ((D : ℝ) + 1 + r) :=
    Real.sq_sqrt (by positivity)
  have h0 : 0 ≤ t * Real.sqrt (2 * ((D : ℝ) + 1 + r)) := by positivity
  have h1 : 0 ≤ q * ((r : ℝ) + 1) := by positivity
  nlinarith [sq_nonneg (t * Real.sqrt (2 * ((D : ℝ) + 1 + r)) - q * ((r : ℝ) + 1))]

end

end Grothe.UpperQuad.TaylorShift
