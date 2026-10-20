import Mathlib

/-!
# List polynomials and two extremal lemmas

Horner evaluation `evalL` of a little-endian coefficient list and its expansion as a sum; the
endpoint lemma for `a x² + b x³`, `b ≥ 0`, on `[p, q] ⊆ [0, ∞)` (`cubic_endpoint_le`); the
exact maximum of a quadratic on an interval (`quadVal_le_quadMax`), and of a chord minus a
square (`chordMax`, `chord_le_chordMax`).  `allPar` is `List.all` evaluated in parallel
(`allPar_eq`), and `chainTo` checks that consecutive intervals cover an interval
(`chainTo_sound`); the certificate checks use both.
-/

namespace Grothe.Lower

open Finset

/-- `l.all f`, evaluated in parallel with one task per element. -/
def allPar {α : Type*} (f : α → Bool) (l : List α) : Bool :=
  (l.map fun a => Task.spawn fun _ => f a).all Task.get

@[simp] lemma allPar_eq {α : Type*} (f : α → Bool) (l : List α) : allPar f l = l.all f := by
  induction l with
  | nil => rfl
  | cons a l ih =>
    simp only [allPar, List.map_cons, List.all_cons] at ih ⊢
    rw [← ih]
    rfl

/-- The intervals `[lo a, hi a]` of the list are consecutive from `prev` (each starts where the
previous one ends) and the last one reaches `stop`. -/
def chainTo {α : Type*} (lo hi : α → ℚ) : ℚ → ℚ → List α → Bool
  | _, _, [] => false
  | prev, stop, [a] => (lo a == prev) && decide (stop ≤ hi a)
  | prev, stop, a :: b :: rest => (lo a == prev) && chainTo lo hi (hi a) stop (b :: rest)

/-- **A chain of intervals covers `[prev, stop]`.** -/
theorem chainTo_sound {α : Type*} (lo hi : α → ℚ) :
    ∀ (l : List α) (prev stop : ℚ), chainTo lo hi prev stop l = true →
      ∀ t : ℝ, (prev : ℝ) ≤ t → t ≤ stop → ∃ a ∈ l, (lo a : ℝ) ≤ t ∧ t ≤ hi a
  | [], _, _, h, _, _, _ => by simp [chainTo] at h
  | [a], prev, stop, h, t, h1, h2 => by
    simp only [chainTo, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    exact ⟨a, List.mem_singleton_self a, by rw [h.1]; exact h1,
      h2.trans (by exact_mod_cast h.2)⟩
  | a :: b :: rest, prev, stop, h, t, h1, h2 => by
    simp only [chainTo, Bool.and_eq_true, beq_iff_eq] at h
    by_cases ht : t ≤ (hi a : ℝ)
    · exact ⟨a, List.mem_cons_self .., by rw [h.1]; exact h1, ht⟩
    · obtain ⟨c, hc, hc1, hc2⟩ :=
        chainTo_sound lo hi (b :: rest) (hi a) stop h.2 t (le_of_lt (not_le.1 ht)) h2
      exact ⟨c, List.mem_cons_of_mem _ hc, hc1, hc2⟩

/-- Horner evaluation of a little-endian coefficient list. -/
def evalL {R : Type*} [Semiring R] : List R → R → R
  | [], _ => 0
  | a :: l, u => a + u * evalL l u

/-- The `k`-th coefficient (zero outside the list). -/
def coeffL {R : Type*} [Zero R] (p : List R) (k : ℕ) : R := p.getD k 0

@[simp] lemma coeffL_nil {R : Type*} [Zero R] (k : ℕ) : coeffL ([] : List R) k = 0 := by
  simp [coeffL]

@[simp] lemma coeffL_cons_zero {R : Type*} [Zero R] (a : R) (l : List R) :
    coeffL (a :: l) 0 = a := rfl

@[simp] lemma coeffL_cons_succ {R : Type*} [Zero R] (a : R) (l : List R) (k : ℕ) :
    coeffL (a :: l) (k + 1) = coeffL l k := rfl

lemma coeffL_map {R S : Type*} [Zero R] [Zero S] (f : R → S) (hf : f 0 = 0) (p : List R) (k : ℕ) :
    coeffL (p.map f) k = f (coeffL p k) := by
  induction p generalizing k with
  | nil => simp [hf]
  | cons a l ih => cases k <;> simp [ih]

lemma evalL_eq_sum {R : Type*} [CommSemiring R] (p : List R) (u : R) :
    evalL p u = ∑ k ∈ range p.length, coeffL p k * u ^ k := by
  induction p with
  | nil => simp [evalL]
  | cons a l ih =>
    simp only [evalL, List.length_cons, ih, Finset.sum_range_succ', coeffL_cons_succ,
      coeffL_cons_zero, pow_succ, pow_zero, mul_one]
    rw [Finset.mul_sum, add_comm]
    congr 1
    exact Finset.sum_congr rfl fun k _ => by ring

lemma evalL_map_cast (p : List ℚ) (u : ℝ) :
    evalL (p.map ((↑) : ℚ → ℝ)) u = ∑ k ∈ range p.length, ((coeffL p k : ℚ) : ℝ) * u ^ k := by
  rw [evalL_eq_sum, List.length_map]
  exact Finset.sum_congr rfl fun k _ => by rw [coeffL_map _ Rat.cast_zero]

/-- Endpoint lemma: for `b ≥ 0` the function `a x² + b x³` on `[p, q] ⊆ [0, ∞)` is maximized at an
endpoint (an interior critical point can only be a minimum). -/
theorem cubic_endpoint_le (a b x p q : ℝ) (hb : 0 ≤ b) (hp : 0 ≤ p) (hpx : p ≤ x) (hxq : x ≤ q) :
    a * x ^ 2 + b * x ^ 3 ≤ max (a * p ^ 2 + b * p ^ 3) (a * q ^ 2 + b * q ^ 3) := by
  have hx : 0 ≤ x := hp.trans hpx
  by_cases hc : 2 * a + 3 * b * x ≤ 0
  · -- left of the critical point: decreasing, so the value at `p` dominates
    refine le_max_of_le_left ?_
    have hE0 : a * x + b * x ^ 2 ≤ 0 := by nlinarith
    have hEx : 2 * a * x + 3 * b * x ^ 2 ≤ 0 := by nlinarith
    have hE : x * (a * (x + p) + b * (x ^ 2 + x * p + p ^ 2))
        ≤ (x - p) * (a * x + b * x ^ 2) + p * (2 * a * x + 3 * b * x ^ 2) := by
      nlinarith [mul_nonneg (mul_nonneg hb hp) (mul_nonneg hx (sub_nonneg.2 hpx))]
    have hE' : x * (a * (x + p) + b * (x ^ 2 + x * p + p ^ 2)) ≤ 0 := by
      nlinarith [mul_nonneg (sub_nonneg.2 hpx) (neg_nonneg.2 hE0), mul_nonneg hp (neg_nonneg.2 hEx)]
    rcases hx.lt_or_eq with hx' | hx'
    · have hE'' : a * (x + p) + b * (x ^ 2 + x * p + p ^ 2) ≤ 0 := by
        by_contra hcon
        push Not at hcon
        nlinarith [mul_pos hx' hcon]
      nlinarith [mul_nonneg (sub_nonneg.2 hpx) (neg_nonneg.2 hE'')]
    · have hp0 : p = 0 := by linarith
      exact le_of_eq (by rw [hp0, ← hx'])
  · -- right of the critical point: increasing, so the value at `q` dominates
    refine le_max_of_le_right ?_
    push Not at hc
    have hF : 0 ≤ a * (q + x) + b * (q ^ 2 + q * x + x ^ 2) := by
      nlinarith [mul_nonneg hb (sub_nonneg.2 hxq), mul_nonneg (mul_nonneg hb hx) (sub_nonneg.2 hxq)]
    nlinarith [mul_nonneg (sub_nonneg.2 hxq) hF]

/-- Value of a quadratic `c0 + c1 t + c2 t²`. -/
def quadVal (c0 c1 c2 t : ℚ) : ℚ := c0 + c1 * t + c2 * t ^ 2

/-- Exact maximum of a quadratic on `[α, β]`: endpoints, plus the vertex when the quadratic is
concave and its vertex lies inside. -/
def quadMax (c0 c1 c2 α β : ℚ) : ℚ :=
  let e := max (quadVal c0 c1 c2 α) (quadVal c0 c1 c2 β)
  if c2 < 0 then
    let v := -c1 / (2 * c2)
    if α ≤ v ∧ v ≤ β then max e (quadVal c0 c1 c2 v) else e
  else e

theorem quadVal_le_quadMax (c0 c1 c2 α β : ℚ) (t : ℝ) (hα : (α : ℝ) ≤ t) (hβ : t ≤ β) :
    (c0 : ℝ) + c1 * t + c2 * t ^ 2 ≤ ((quadMax c0 c1 c2 α β : ℚ) : ℝ) := by
  have hαβ : (α : ℝ) ≤ β := hα.trans hβ
  set qα : ℝ := ((quadVal c0 c1 c2 α : ℚ) : ℝ) with hqα
  set qβ : ℝ := ((quadVal c0 c1 c2 β : ℚ) : ℝ) with hqβ
  have eα : qα = c0 + c1 * α + c2 * α ^ 2 := by simp [hqα, quadVal]
  have eβ : qβ = c0 + c1 * β + c2 * β ^ 2 := by simp [hqβ, quadVal]
  have hend : max qα qβ ≤ ((quadMax c0 c1 c2 α β : ℚ) : ℝ) := by
    simp only [quadMax]
    split_ifs
    · push_cast; exact le_max_left _ _
    · push_cast; exact le_rfl
    · push_cast; exact le_rfl
  -- convex case
  by_cases hc2 : (0 : ℝ) ≤ c2
  · have key : ((β : ℝ) - α) * (max qα qβ - (c0 + c1 * t + c2 * t ^ 2))
        = (β - t) * (max qα qβ - qα) + (t - α) * (max qα qβ - qβ)
          + c2 * ((β - α) * ((t - α) * (β - t))) := by
      rw [eα, eβ]; ring
    have h1 : 0 ≤ ((β : ℝ) - α) * (max qα qβ - (c0 + c1 * t + c2 * t ^ 2)) := by
      rw [key]
      have := le_max_left qα qβ
      have := le_max_right qα qβ
      have := mul_nonneg (mul_nonneg (sub_nonneg.2 hαβ) (sub_nonneg.2 hα)) (sub_nonneg.2 hβ)
      have := mul_nonneg (sub_nonneg.2 hβ) (sub_nonneg.2 (le_max_left qα qβ))
      have := mul_nonneg (sub_nonneg.2 hα) (sub_nonneg.2 (le_max_right qα qβ))
      positivity
    rcases hαβ.lt_or_eq with hlt | heq
    · have h2 : 0 ≤ max qα qβ - ((c0 : ℝ) + c1 * t + c2 * t ^ 2) := by
        by_contra hcon
        push Not at hcon
        nlinarith [mul_pos (sub_pos.2 hlt) (neg_pos.2 hcon)]
      linarith
    · have ht : t = α := by linarith
      rw [ht, ← eα]
      exact (le_max_left _ _).trans hend
  · push Not at hc2
    have hc2' : (c2 : ℚ) < 0 := by exact_mod_cast hc2
    have hc2ne : (c2 : ℝ) ≠ 0 := hc2.ne
    obtain ⟨v, hv⟩ : ∃ v : ℚ, v = -c1 / (2 * c2) := ⟨_, rfl⟩
    have hvr : (v : ℝ) = -c1 / (2 * c2) := by rw [hv]; push_cast; ring
    have hsq : (c0 : ℝ) + c1 * t + c2 * t ^ 2 = c2 * (t - v) ^ 2 + (c0 - c1 ^ 2 / (4 * c2)) := by
      rw [hvr]; field_simp; ring
    by_cases hin : α ≤ v ∧ v ≤ β
    · -- vertex inside: the vertex value is a candidate
      have hvmax : (quadVal c0 c1 c2 v : ℚ) ≤ (quadMax c0 c1 c2 α β : ℚ) := by
        simp only [quadMax, hc2', ite_true]
        rw [← hv, ite_eq_left hin]
        exact le_max_right _ _
      have hvval : ((quadVal c0 c1 c2 v : ℚ) : ℝ) = c0 - c1 ^ 2 / (4 * c2) := by
        simp only [quadVal]; push_cast; rw [hvr]; field_simp; ring
      have : (c0 : ℝ) + c1 * t + c2 * t ^ 2 ≤ c0 - c1 ^ 2 / (4 * c2) := by
        rw [hsq]; nlinarith [sq_nonneg (t - (v : ℝ))]
      calc (c0 : ℝ) + c1 * t + c2 * t ^ 2 ≤ c0 - c1 ^ 2 / (4 * c2) := this
        _ = ((quadVal c0 c1 c2 v : ℚ) : ℝ) := hvval.symm
        _ ≤ _ := by exact_mod_cast hvmax
    · -- vertex outside: monotone on the interval
      have hvout : (v : ℝ) < α ∨ (β : ℝ) < v := by
        rcases not_and_or.1 hin with h | h
        · left; exact_mod_cast not_le.1 h
        · right; exact_mod_cast not_le.1 h
      have hc1 : (c1 : ℝ) = -2 * c2 * v := by rw [hvr]; field_simp
      rcases hvout with h | h
      · -- increasing region is to the left; the value at `α` dominates
        have : (c0 : ℝ) + c1 * t + c2 * t ^ 2 ≤ qα := by
          rw [eα, hc1]
          nlinarith [mul_nonneg (sub_nonneg.2 hα) (mul_nonneg (neg_nonneg.2 hc2.le)
            (by linarith : (0:ℝ) ≤ (α + t) - 2 * v))]
        exact this.trans ((le_max_left _ _).trans hend)
      · have : (c0 : ℝ) + c1 * t + c2 * t ^ 2 ≤ qβ := by
          rw [eβ, hc1]
          nlinarith [mul_nonneg (sub_nonneg.2 hβ) (mul_nonneg (neg_nonneg.2 hc2.le)
            (by linarith : (0:ℝ) ≤ 2 * v - (β + t)))]
        exact this.trans ((le_max_right _ _).trans hend)

/-- The exact maximum over `s ∈ [s₀, s₁]` of the chord through `(s₀, v₀)`, `(s₁, v₁)` minus
`D s²`. -/
def chordMax (v0 v1 D s0 s1 : ℚ) : ℚ :=
  let m := (v1 - v0) / (s1 - s0)
  quadMax (v0 - m * s0) m (-D) s0 s1

theorem chord_le_chordMax (v0 v1 D s0 s1 : ℚ) (h : s0 < s1) (s : ℝ) (h0 : (s0 : ℝ) ≤ s)
    (h1 : s ≤ s1) :
    ((s1 : ℝ) - s) / (s1 - s0) * v0 + (s - s0) / (s1 - s0) * v1 - D * s ^ 2
      ≤ (chordMax v0 v1 D s0 s1 : ℚ) := by
  have hd : (s1 : ℝ) - s0 ≠ 0 := sub_ne_zero.2 (by exact_mod_cast h.ne')
  have hq := quadVal_le_quadMax (v0 - (v1 - v0) / (s1 - s0) * s0) ((v1 - v0) / (s1 - s0)) (-D)
    s0 s1 s h0 h1
  have e : ((v0 - (v1 - v0) / (s1 - s0) * s0 : ℚ) : ℝ) + ((v1 - v0) / (s1 - s0) : ℚ) * s
      + ((-D : ℚ) : ℝ) * s ^ 2
      = ((s1 : ℝ) - s) / (s1 - s0) * v0 + (s - s0) / (s1 - s0) * v1 - D * s ^ 2 := by
    push_cast
    field_simp
    ring
  rw [e] at hq
  exact hq

end Grothe.Lower
