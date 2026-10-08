import Mathlib

/-!
# Bernstein coefficient bounds for univariate polynomials

For a coefficient list `p` (little-endian) and an interval `[l, h]`, the Bernstein coefficients
`b_m` of `p` on `[l, h]` are
`a_k = (h-l)^k ∑_{j ≥ k} p_j C(j,k) l^{j-k}`, `b_m = ∑_{k ≤ m} a_k C(m,k)/C(n,k)` (`n = deg`).
Since the Bernstein basis is nonnegative and sums to one, `p(u) ≤ max_m b_m` on `[l, h]`
(`evalL_le_of_bern`).  The coefficients are computable over `ℚ`; `bernList_cast` transports
them to `ℝ`.

Also: the endpoint lemma for `a x² + b x³`, `b ≥ 0`, on `[p, q] ⊆ [0, ∞)` (`cubic_endpoint_le`),
and the exact maximum of a quadratic on an interval (`quadVal_le_quadMax`).
-/

namespace Grothe.Lower

open Finset

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

/-- Power-basis coefficients of `p(l + (h-l)s)` in `s`. -/
def bernA {R : Type*} [Field R] (p : List R) (l h : R) (k : ℕ) : R :=
  (h - l) ^ k * ∑ j ∈ range p.length,
    if k ≤ j then coeffL p j * (j.choose k : R) * l ^ (j - k) else 0

/-- Bernstein coefficients of `p` on `[l, h]` (degree `p.length - 1`). -/
def bernB {R : Type*} [Field R] (p : List R) (l h : R) (m : ℕ) : R :=
  ∑ k ∈ range (m + 1),
    bernA p l h k * ((m.choose k : R) / ((p.length - 1).choose k : R))

/-- The list of all Bernstein coefficients (the power-basis coefficients are computed once). -/
def bernList {R : Type*} [Field R] (p : List R) (l h : R) : List R :=
  let a := (List.range p.length).map (bernA p l h)
  (List.range p.length).map fun m =>
    ∑ k ∈ range (m + 1), a.getD k 0 * ((m.choose k : R) / ((p.length - 1).choose k : R))

lemma bernList_eq_map {R : Type*} [Field R] (p : List R) (l h : R) :
    bernList p l h = (List.range p.length).map (bernB p l h) := by
  simp only [bernList]
  refine List.map_congr_left fun m hm => ?_
  rw [List.mem_range] at hm
  unfold bernB
  refine Finset.sum_congr rfl fun k hk => ?_
  rw [Finset.mem_range] at hk
  congr 1
  rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range (by omega)]
  rfl

lemma bernA_cast (p : List ℚ) (l h : ℚ) (k : ℕ) :
    bernA (p.map ((↑) : ℚ → ℝ)) (l : ℝ) (h : ℝ) k = ((bernA p l h k : ℚ) : ℝ) := by
  simp only [bernA, List.length_map]
  push_cast
  congr 1
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [coeffL_map _ Rat.cast_zero]
  split_ifs <;> push_cast <;> ring

lemma bernB_cast (p : List ℚ) (l h : ℚ) (m : ℕ) :
    bernB (p.map ((↑) : ℚ → ℝ)) (l : ℝ) (h : ℝ) m = ((bernB p l h m : ℚ) : ℝ) := by
  simp only [bernB, List.length_map]
  push_cast
  exact Finset.sum_congr rfl fun k _ => by rw [bernA_cast]

lemma bernList_cast (p : List ℚ) (l h : ℚ) :
    bernList (p.map ((↑) : ℚ → ℝ)) (l : ℝ) (h : ℝ) = (bernList p l h).map ((↑) : ℚ → ℝ) := by
  simp only [bernList_eq_map, List.length_map, List.map_map]
  exact List.map_congr_left fun m _ => by rw [Function.comp_apply]; exact bernB_cast p l h m

lemma filter_le_range {n j : ℕ} (hj : j ≤ n) :
    (range (n + 1)).filter (fun k => k ≤ j) = range (j + 1) := by
  ext k; simp only [Finset.mem_filter, Finset.mem_range]; omega

lemma filter_ge_range {n k : ℕ} :
    (range (n + 1)).filter (fun m => k ≤ m) = Finset.Ico k (n + 1) := by
  ext m; simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_Ico]; omega

/-- **Bernstein bound**: on `[l, h]` the polynomial is at most the largest Bernstein coefficient. -/
theorem evalL_le_of_bern (p : List ℝ) (hp : p ≠ []) (l h u M : ℝ) (hlu : l ≤ u) (huh : u ≤ h)
    (hlh : l < h) (hM : ∀ b ∈ bernList p l h, b ≤ M) : evalL p u ≤ M := by
  obtain ⟨n, hn⟩ : ∃ n, p.length = n + 1 := by
    cases p with
    | nil => exact absurd rfl hp
    | cons a l => exact ⟨l.length, rfl⟩
  have hhl : 0 < h - l := by linarith
  set s : ℝ := (u - l) / (h - l) with hs
  have hs0 : 0 ≤ s := div_nonneg (by linarith) hhl.le
  have hs1 : s ≤ 1 := by rw [hs, div_le_one hhl]; linarith
  have hu : u = l + (h - l) * s := by rw [hs]; field_simp; ring
  -- the Bernstein basis
  set B : ℕ → ℝ := fun m => (n.choose m : ℝ) * s ^ m * (1 - s) ^ (n - m) with hB
  have hBnn : ∀ m, 0 ≤ B m := fun m => by
    have : 0 ≤ 1 - s := by linarith
    positivity
  have hBsum : ∑ m ∈ range (n + 1), B m = 1 := by
    calc ∑ m ∈ range (n + 1), B m
        = ∑ m ∈ range (n + 1), s ^ m * (1 - s) ^ (n - m) * (n.choose m : ℝ) :=
          Finset.sum_congr rfl fun m _ => by simp only [hB]; ring
      _ = (s + (1 - s)) ^ n := (add_pow s (1 - s) n).symm
      _ = 1 := by simp
  -- Step B: monomials in the Bernstein basis
  have hmono : ∀ k ≤ n, s ^ k = ∑ m ∈ range (n + 1),
      (if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0) * B m := by
    intro k hk
    have hck : (0 : ℝ) < n.choose k := by exact_mod_cast Nat.choose_pos hk
    have e1 : ∀ m ∈ range (n + 1), (if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0) * B m
        = if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) * B m else 0 := by
      intro m _; split_ifs <;> simp
    rw [Finset.sum_congr rfl e1, ← Finset.sum_filter, filter_ge_range, Finset.sum_Ico_eq_sum_range,
      show n + 1 - k = n - k + 1 by omega]
    have key : ∀ i ∈ range (n - k + 1),
        ((k + i).choose k : ℝ) / (n.choose k : ℝ) * B (k + i)
          = s ^ k * (((n - k).choose i : ℝ) * s ^ i * (1 - s) ^ (n - k - i)) := by
      intro i hi
      have hi' : i ≤ n - k := by simpa [Nat.lt_succ_iff] using hi
      have hc := Nat.choose_mul (n := n) (k := k + i) (s := k) (by omega)
      rw [show k + i - k = i by omega] at hc
      have hcast : (n.choose (k + i) : ℝ) * ((k + i).choose k : ℝ)
          = (n.choose k : ℝ) * ((n - k).choose i : ℝ) := by exact_mod_cast hc
      simp only [hB]
      rw [show n - (k + i) = n - k - i by omega, pow_add]
      field_simp
      linear_combination (s ^ k * s ^ i * (1 - s) ^ (n - k - i)) * hcast
    rw [Finset.sum_congr rfl key, ← Finset.mul_sum]
    have h1 : ∑ i ∈ range (n - k + 1), ((n - k).choose i : ℝ) * s ^ i * (1 - s) ^ (n - k - i) = 1 := by
      calc ∑ i ∈ range (n - k + 1), ((n - k).choose i : ℝ) * s ^ i * (1 - s) ^ (n - k - i)
          = ∑ i ∈ range (n - k + 1), s ^ i * (1 - s) ^ (n - k - i) * ((n - k).choose i : ℝ) :=
            Finset.sum_congr rfl fun i _ => by ring
        _ = (s + (1 - s)) ^ (n - k) := (add_pow s (1 - s) (n - k)).symm
        _ = 1 := by simp
    rw [h1, mul_one]
  -- Step C: expand `p(u)` in powers of `s`
  have hval : evalL p u = ∑ k ∈ range (n + 1), bernA p l h k * s ^ k := by
    rw [evalL_eq_sum, hn, hu]
    have e2 : ∀ j ∈ range (n + 1), coeffL p j * (l + (h - l) * s) ^ j
        = ∑ k ∈ range (n + 1),
            if k ≤ j then coeffL p j * (j.choose k : ℝ) * l ^ (j - k) * ((h - l) ^ k * s ^ k)
            else 0 := by
      intro j hj
      have hj' : j ≤ n := by simpa [Nat.lt_succ_iff] using hj
      rw [add_comm l, add_pow, Finset.mul_sum, ← Finset.sum_filter, filter_le_range hj']
      exact Finset.sum_congr rfl fun k _ => by rw [mul_pow]; ring
    rw [Finset.sum_congr rfl e2, Finset.sum_comm]
    refine Finset.sum_congr rfl fun k _ => ?_
    simp only [bernA, hn]
    rw [Finset.mul_sum, Finset.sum_mul]
    refine Finset.sum_congr rfl fun j _ => ?_
    split_ifs <;> ring
  -- Step D: regroup into the Bernstein basis
  have hD : evalL p u = ∑ m ∈ range (n + 1), bernB p l h m * B m := by
    rw [hval]
    have e3 : ∀ k ∈ range (n + 1), bernA p l h k * s ^ k = ∑ m ∈ range (n + 1),
        bernA p l h k * ((if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0) * B m) := by
      intro k hk
      rw [hmono k (by simpa [Nat.lt_succ_iff] using hk), Finset.mul_sum]
    rw [Finset.sum_congr rfl e3, Finset.sum_comm]
    refine Finset.sum_congr rfl fun m hm => ?_
    have hm' : m ≤ n := by simpa [Nat.lt_succ_iff] using hm
    simp only [bernB, hn, Nat.add_sub_cancel]
    rw [Finset.sum_mul]
    have e4 : ∀ k ∈ range (n + 1),
        bernA p l h k * ((if k ≤ m then ((m.choose k : ℝ) / (n.choose k : ℝ)) else 0) * B m)
          = if k ≤ m then bernA p l h k * ((m.choose k : ℝ) / (n.choose k : ℝ)) * B m else 0 := by
      intro k _; split_ifs <;> ring
    rw [Finset.sum_congr rfl e4, ← Finset.sum_filter, filter_le_range hm']
  -- conclude
  have hb : ∀ m ∈ range (n + 1), bernB p l h m ≤ M := by
    intro m hm
    apply hM
    simp only [bernList_eq_map, hn, List.mem_map, List.mem_range]
    exact ⟨m, by simpa using hm, rfl⟩
  calc evalL p u = ∑ m ∈ range (n + 1), bernB p l h m * B m := hD
    _ ≤ ∑ m ∈ range (n + 1), M * B m :=
        Finset.sum_le_sum fun m hm => mul_le_mul_of_nonneg_right (hb m hm) (hBnn m)
    _ = M := by rw [← Finset.mul_sum, hBsum, mul_one]

/-- Rational-data version: `p` rational, `u` real, Bernstein list computed in `ℚ`. -/
theorem evalL_le_of_bern_rat (p : List ℚ) (hp : p ≠ []) (l h : ℚ) (u : ℝ) (M : ℚ)
    (hlu : (l : ℝ) ≤ u) (huh : u ≤ h) (hlh : l < h)
    (hM : ∀ b ∈ bernList p l h, b ≤ M) : evalL (p.map ((↑) : ℚ → ℝ)) u ≤ M := by
  apply evalL_le_of_bern _ (by simpa using hp) l h u M hlu huh (by exact_mod_cast hlh)
  intro b hb
  rw [bernList_cast] at hb
  obtain ⟨b', hb', rfl⟩ := List.mem_map.1 hb
  exact_mod_cast hM b' hb'

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

end Grothe.Lower
