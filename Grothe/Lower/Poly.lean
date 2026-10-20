import Grothe.Lower.Basic

/-!
# List polynomials: arithmetic, adaptive Bernstein positivity, Taylor tails

Rational coefficient lists (little-endian) with the operations used by the certificate checkers:
negation, addition, scaling, the shift `p(t + ·)`, multiplication by a power of the variable;
`posOn` certifies `p ≥ 0` on an interval `[lo, hi]` by the signs of the Taylor coefficients of
`z ↦ zⁿ p(lo + 1/z)` at `1/(hi − lo)` (the Bernstein criterion, evaluated in integer arithmetic),
with bisection (`posOn_sound`),
`taylorNonneg` certifies `p ≥ 0` on a half-line by the signs of the Taylor coefficients at its
origin, and `tailOn` combines both along a doubling sequence (`tailOn_sound`).
-/

namespace Grothe.Lower

/-- Parse `n` or `n/d`. -/
def parseQ (s : String) : ℚ :=
  match s.splitOn "/" with
  | [n] => (n.toInt! : ℚ)
  | [n, d] => (n.toInt! : ℚ) / (d.toNat! : ℚ)
  | _ => 0

/-- Parse a comma-separated list of rationals. -/
def parseQs (s : String) : List ℚ := if s = "" then [] else (s.splitOn ",").map parseQ

def negL : List ℚ → List ℚ
  | [] => []
  | a :: r => (-a) :: negL r

lemma evalL_negL : ∀ (p : List ℚ) (s : ℝ),
    evalL ((negL p).map ((↑) : ℚ → ℝ)) s = - evalL (p.map ((↑) : ℚ → ℝ)) s
  | [], s => by simp [negL, evalL]
  | a :: r, s => by
    simp only [negL, List.map_cons, evalL, Rat.cast_neg, evalL_negL r s]; ring

def addLq : List ℚ → List ℚ → List ℚ
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => (a + b) :: addLq l m

lemma evalL_addLq : ∀ (l m : List ℚ) (s : ℝ),
    evalL ((addLq l m).map ((↑) : ℚ → ℝ)) s
      = evalL (l.map ((↑) : ℚ → ℝ)) s + evalL (m.map ((↑) : ℚ → ℝ)) s
  | [], m, s => by simp [addLq, evalL]
  | a :: l, [], s => by simp [addLq, evalL]
  | a :: l, b :: m, s => by
    simp only [addLq, List.map_cons, evalL, Rat.cast_add, evalL_addLq l m s]; ring

def scaleL (t : ℚ) : List ℚ → List ℚ
  | [] => []
  | a :: r => (t * a) :: scaleL t r

lemma evalL_scaleL (t : ℚ) : ∀ (p : List ℚ) (s : ℝ),
    evalL ((scaleL t p).map ((↑) : ℚ → ℝ)) s = t * evalL (p.map ((↑) : ℚ → ℝ)) s
  | [], s => by simp [scaleL, evalL]
  | a :: r, s => by
    simp only [scaleL, List.map_cons, evalL, Rat.cast_mul, evalL_scaleL t r s]; ring

/-- Coefficients of `(t + Y)·r(Y)`. -/
def mulXt (t : ℚ) (r : List ℚ) : List ℚ := addLq (scaleL t r) (0 :: r)

lemma evalL_mulXt (t : ℚ) (r : List ℚ) (y : ℝ) :
    evalL ((mulXt t r).map ((↑) : ℚ → ℝ)) y = (t + y) * evalL (r.map ((↑) : ℚ → ℝ)) y := by
  simp only [mulXt, evalL_addLq, evalL_scaleL, List.map_cons, evalL, Rat.cast_zero]; ring

/-- Coefficients of `y ↦ p(t + y)` (Horner substitution). -/
def shiftL : List ℚ → ℚ → List ℚ
  | [], _ => []
  | a :: q, t => addLq [a] (mulXt t (shiftL q t))

lemma evalL_shiftL : ∀ (q : List ℚ) (t : ℚ) (y : ℝ),
    evalL ((shiftL q t).map ((↑) : ℚ → ℝ)) y = evalL (q.map ((↑) : ℚ → ℝ)) (t + y)
  | [], t, y => by simp [shiftL, evalL]
  | a :: q, t, y => by
    simp only [shiftL, evalL_addLq, evalL_mulXt, evalL_shiftL q t y, List.map_cons, List.map_nil,
      evalL]
    ring

lemma evalL_nonneg_of_nonneg : ∀ (q : List ℚ), (∀ c ∈ q, 0 ≤ c) → ∀ y : ℝ, 0 ≤ y →
    0 ≤ evalL (q.map ((↑) : ℚ → ℝ)) y
  | [], _, y, _ => by simp [evalL]
  | a :: q, hq, y, hy => by
    simp only [List.map_cons, evalL]
    have ha : (0 : ℝ) ≤ a := by exact_mod_cast hq a (List.mem_cons_self ..)
    have := evalL_nonneg_of_nonneg q (fun c hc => hq c (List.mem_cons_of_mem _ hc)) y hy
    positivity

/-- Coefficients of `Y^k · p(Y)`. -/
def shiftUp : ℕ → List ℚ → List ℚ
  | 0, p => p
  | k + 1, p => 0 :: shiftUp k p

lemma evalL_shiftUp : ∀ (k : ℕ) (p : List ℚ) (v : ℝ),
    evalL ((shiftUp k p).map ((↑) : ℚ → ℝ)) v = v ^ k * evalL (p.map ((↑) : ℚ → ℝ)) v
  | 0, p, v => by simp [shiftUp]
  | k + 1, p, v => by
    simp only [shiftUp, List.map_cons, evalL, Rat.cast_zero, evalL_shiftUp k p v]; ring

/-! ### Positivity on an interval -/

lemma evalL_append_single : ∀ (l : List ℝ) (a z : ℝ),
    evalL (l ++ [a]) z = evalL l z + a * z ^ l.length
  | [], a, z => by simp [evalL]
  | b :: l, a, z => by
    simp only [List.cons_append, evalL, evalL_append_single l a z, List.length_cons]; ring

/-- Reversing the coefficients: `s^{len} · b^{rev}(1/s) = s · b(s)`. -/
lemma evalL_reverse : ∀ (b : List ℝ) (s : ℝ), s ≠ 0 →
    s ^ b.length * evalL b.reverse (1 / s) = s * evalL b s
  | [], s, _ => by simp [evalL]
  | a :: l, s, hs => by
    have ih := evalL_reverse l s hs
    have hpow : s ^ l.length * (1 / s) ^ l.length = 1 := by
      rw [← mul_pow, mul_one_div_cancel hs, one_pow]
    simp only [List.reverse_cons, evalL_append_single, List.length_reverse, List.length_cons,
      evalL]
    linear_combination s * ih + a * s * hpow

/-! Integer coefficient lists (the certificate is evaluated in integer arithmetic). -/

def addZ : List ℤ → List ℤ → List ℤ
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => (a + b) :: addZ l m

def scaleZ (t : ℤ) : List ℤ → List ℤ
  | [] => []
  | a :: r => (t * a) :: scaleZ t r

/-- Evaluation of an integer coefficient list at a real point. -/
noncomputable def evalZ (p : List ℤ) (x : ℝ) : ℝ := evalL (p.map ((↑) : ℤ → ℝ)) x

lemma evalZ_cons (a : ℤ) (r : List ℤ) (x : ℝ) : evalZ (a :: r) x = a + x * evalZ r x := rfl

lemma evalZ_addZ : ∀ (l m : List ℤ) (x : ℝ), evalZ (addZ l m) x = evalZ l x + evalZ m x
  | [], m, x => by simp [addZ, evalZ, evalL]
  | a :: l, [], x => by simp [addZ, evalZ, evalL]
  | a :: l, b :: m, x => by
    simp only [addZ, evalZ_cons, evalZ_addZ l m x, Int.cast_add]; ring

lemma evalZ_scaleZ (t : ℤ) : ∀ (p : List ℤ) (x : ℝ), evalZ (scaleZ t p) x = t * evalZ p x
  | [], x => by simp [scaleZ, evalZ, evalL]
  | a :: r, x => by simp only [scaleZ, evalZ_cons, evalZ_scaleZ t r x, Int.cast_mul]; ring

lemma evalZ_nonneg : ∀ (p : List ℤ), (∀ c ∈ p, 0 ≤ c) → ∀ y : ℝ, 0 ≤ y → 0 ≤ evalZ p y
  | [], _, y, _ => by simp [evalZ, evalL]
  | a :: q, hq, y, hy => by
    rw [evalZ_cons]
    have ha : (0 : ℝ) ≤ a := by exact_mod_cast hq a (List.mem_cons_self ..)
    have := evalZ_nonneg q (fun c hc => hq c (List.mem_cons_of_mem _ hc)) y hy
    positivity

lemma evalZ_zero (p : List ℤ) : evalZ p 0 = (p.headD 0 : ℤ) := by
  cases p <;> simp [evalZ, evalL]

/-- Coefficients of `y ↦ b^{n} p((a + y)/b)`, `n + 1` the length of `p`. -/
def shiftS (a b : ℤ) : List ℤ → List ℤ
  | [] => []
  | c :: q =>
    let r := shiftS a b q
    addZ [c * b ^ q.length] (addZ (scaleZ a r) (0 :: r))

lemma shiftS_eval (a b : ℤ) : ∀ (p : List ℤ) (y : ℝ), (b : ℝ) ≠ 0 →
    (b : ℝ) * evalZ (shiftS a b p) y = (b : ℝ) ^ p.length * evalZ p ((a + y) / b)
  | [], y, _ => by simp [shiftS, evalZ, evalL]
  | c :: q, y, hb => by
    have ih := shiftS_eval a b q y hb
    have hx : (b : ℝ) * ((a + y) / b) = a + y := by field_simp
    simp only [shiftS, evalZ_addZ, evalZ_scaleZ, evalZ_cons, List.length_cons, Int.cast_mul,
      Int.cast_pow, Int.cast_zero]
    have h0 : evalZ [] y = 0 := by simp [evalZ, evalL]
    rw [h0]
    linear_combination ((a : ℝ) + y) * ih - ((b : ℝ) ^ q.length * evalZ q ((a + y) / b)) * hx

/-- A common denominator of the coefficients. -/
def commonDen (p : List ℚ) : ℕ := p.foldr (fun q acc => Nat.lcm q.den acc) 1

/-- The numerators over the denominator `D`. -/
def toInts (D : ℕ) (p : List ℚ) : List ℤ := p.map fun q => (q * (D : ℚ)).num

lemma toInts_eval (D : ℕ) (p : List ℚ)
    (h : (toInts D p).map ((↑) : ℤ → ℚ) = scaleL D p) (x : ℝ) :
    evalZ (toInts D p) x = D * evalL (p.map ((↑) : ℚ → ℝ)) x := by
  have h1 := evalL_scaleL (D : ℚ) p x
  rw [← h, List.map_map] at h1
  have e : (((↑) : ℚ → ℝ) ∘ ((↑) : ℤ → ℚ)) = ((↑) : ℤ → ℝ) := by funext c; simp
  rw [e] at h1
  unfold evalZ
  rw [h1]
  simp

/-- Positivity certificate of `p` on `[lo, hi]`, in integer arithmetic.  With `P = D·p` integral,
`lo = a/b` and `A(y) = bⁿ P((a + y)/b)`: `A(0) ≥ 0`, and the polynomial `z ↦ zⁿ A(1/z)` has
nonnegative Taylor coefficients at `1/(b(hi − lo))` (equivalently, the Bernstein coefficients of
`p` on `[lo, hi]` are nonnegative). -/
def posCert (p : List ℚ) (lo hi : ℚ) : Bool :=
  decide (0 < commonDen p) &&
  ((toInts (commonDen p) p).map ((↑) : ℤ → ℚ) == scaleL (commonDen p) p) &&
  decide (0 ≤ (shiftS lo.num lo.den (toInts (commonDen p) p)).headD 0) &&
  (shiftS (1 / ((lo.den : ℚ) * (hi - lo))).num (1 / ((lo.den : ℚ) * (hi - lo))).den
    (shiftS lo.num lo.den (toInts (commonDen p) p)).reverse).all fun c => decide (0 ≤ c)

/-- The positivity certificate with at most `d` levels of bisection. -/
def posOn (p : List ℚ) : ℕ → ℚ → ℚ → Bool
  | 0, lo, hi => posCert p lo hi
  | d + 1, lo, hi =>
    posCert p lo hi || (posOn p d lo ((lo + hi) / 2) && posOn p d ((lo + hi) / 2) hi)

lemma posCert_sound (p : List ℚ) (lo hi : ℚ) (h : posCert p lo hi = true)
    (u : ℝ) (h1 : (lo : ℝ) ≤ u) (h2 : u ≤ hi) : 0 ≤ evalL (p.map ((↑) : ℚ → ℝ)) u := by
  simp only [posCert, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨hD, hP⟩, h0⟩, hd⟩ := h
  have hDR : (0 : ℝ) < (commonDen p : ℝ) := by exact_mod_cast hD
  suffices hs : 0 ≤ evalZ (toInts (commonDen p) p) u by
    rw [toInts_eval _ _ hP] at hs
    exact nonneg_of_mul_nonneg_right hs hDR
  have hb : (0 : ℝ) < ((lo.den : ℤ) : ℝ) := by exact_mod_cast lo.den_pos
  have hlo : (lo : ℝ) = (lo.num : ℝ) / ((lo.den : ℤ) : ℝ) := by
    rw [Int.cast_natCast]; exact Rat.cast_def lo
  obtain ⟨y, hy⟩ : ∃ y : ℝ, y = ((lo.den : ℤ) : ℝ) * u - lo.num := ⟨_, rfl⟩
  have hy0 : 0 ≤ y := by
    rw [hy]; rw [hlo, div_le_iff₀ hb] at h1; linarith
  have hx : ((lo.num : ℝ) + y) / ((lo.den : ℤ) : ℝ) = u := by rw [hy]; field_simp; ring
  have hS := shiftS_eval lo.num lo.den (toInts (commonDen p) p) y hb.ne'
  rw [hx] at hS
  suffices hA : 0 ≤ evalZ (shiftS lo.num lo.den (toInts (commonDen p) p)) y by
    have h3 : 0 ≤ ((lo.den : ℤ) : ℝ) ^ (toInts (commonDen p) p).length
        * evalZ (toInts (commonDen p) p) u := by rw [← hS]; exact mul_nonneg hb.le hA
    exact nonneg_of_mul_nonneg_right h3 (pow_pos hb _)
  rcases hy0.eq_or_lt with hyz | hypos
  · rw [← hyz, evalZ_zero]; exact_mod_cast h0
  · obtain ⟨r, hr⟩ : ∃ r : ℚ, r = 1 / ((lo.den : ℚ) * (hi - lo)) := ⟨_, rfl⟩
    rw [← hr] at hd
    have hw : y ≤ ((lo.den : ℤ) : ℝ) * (hi - lo) := by
      rw [hy, hlo, mul_sub, mul_div_cancel₀ _ hb.ne']
      nlinarith [mul_le_mul_of_nonneg_left h2 hb.le]
    have hrR : (r : ℝ) = 1 / (((lo.den : ℤ) : ℝ) * (hi - lo)) := by rw [hr]; push_cast; ring
    have hrle : (r : ℝ) ≤ 1 / y := by rw [hrR]; exact one_div_le_one_div_of_le hypos hw
    have hdp : (0 : ℝ) < ((r.den : ℤ) : ℝ) := by exact_mod_cast r.den_pos
    have hrd : (r : ℝ) = (r.num : ℝ) / ((r.den : ℤ) : ℝ) := by
      rw [Int.cast_natCast]; exact Rat.cast_def r
    obtain ⟨t, ht⟩ : ∃ t : ℝ, t = ((r.den : ℤ) : ℝ) * (1 / y) - r.num := ⟨_, rfl⟩
    have ht0 : 0 ≤ t := by
      rw [ht]; rw [hrd, div_le_iff₀ hdp] at hrle; linarith
    have hx2 : ((r.num : ℝ) + t) / ((r.den : ℤ) : ℝ) = 1 / y := by rw [ht]; field_simp; ring
    have hS2 := shiftS_eval r.num r.den
      (shiftS lo.num lo.den (toInts (commonDen p) p)).reverse t hdp.ne'
    rw [hx2] at hS2
    have hB := evalZ_nonneg _ hd t ht0
    have hrev : 0 ≤ evalZ (shiftS lo.num lo.den (toInts (commonDen p) p)).reverse (1 / y) :=
      nonneg_of_mul_nonneg_right (by rw [← hS2]; exact mul_nonneg hdp.le hB) (pow_pos hdp _)
    have key := evalL_reverse ((shiftS lo.num lo.den (toInts (commonDen p) p)).map
      ((↑) : ℤ → ℝ)) y hypos.ne'
    rw [← List.map_reverse] at key
    have h4 : 0 ≤ y * evalZ (shiftS lo.num lo.den (toInts (commonDen p) p)) y := by
      unfold evalZ at hrev ⊢
      rw [← key]; exact mul_nonneg (pow_nonneg hypos.le _) hrev
    exact nonneg_of_mul_nonneg_right h4 hypos

lemma posOn_sound (p : List ℚ) : ∀ (d : ℕ) (lo hi : ℚ), lo < hi → posOn p d lo hi = true →
    ∀ u : ℝ, (lo : ℝ) ≤ u → u ≤ hi → 0 ≤ evalL (p.map ((↑) : ℚ → ℝ)) u
  | 0, lo, hi, _, h, u, h1, h2 => posCert_sound p lo hi h u h1 h2
  | d + 1, lo, hi, hlh, h, u, h1, h2 => by
    simp only [posOn, Bool.or_eq_true, Bool.and_eq_true] at h
    rcases h with h | ⟨ha, hb⟩
    · exact posCert_sound p lo hi h u h1 h2
    · have hm1 : lo < (lo + hi) / 2 := by linarith
      have hm2 : (lo + hi) / 2 < hi := by linarith
      by_cases hu : u ≤ (((lo + hi) / 2 : ℚ) : ℝ)
      · exact posOn_sound p d lo _ hm1 ha u h1 hu
      · exact posOn_sound p d _ hi hm2 hb u (le_of_lt (not_le.1 hu)) h2

/-! ### Positivity on a half-line -/

/-- All Taylor coefficients of `p` at `t` are nonnegative. -/
def taylorNonneg (p : List ℚ) (t : ℚ) : Bool := (shiftL p t).all fun c => decide (0 ≤ c)

lemma taylor_sound (p : List ℚ) (t : ℚ) (h : taylorNonneg p t = true) (u : ℝ)
    (hu : (t : ℝ) ≤ u) : 0 ≤ evalL (p.map ((↑) : ℚ → ℝ)) u := by
  simp only [taylorNonneg, List.all_eq_true, decide_eq_true_eq] at h
  have := evalL_nonneg_of_nonneg (shiftL p t) h (u - t) (by linarith)
  rwa [evalL_shiftL, add_sub_cancel] at this

/-- Positivity on `[u, ∞)`: Taylor coefficients at `u`, or positivity on `[u, 2u]` and the same
test from `2u`, at most `n` times. -/
def tailOn (p : List ℚ) : ℕ → ℚ → Bool
  | 0, u => taylorNonneg p u
  | n + 1, u => taylorNonneg p u || (decide (0 < u) && posOn p 7 u (2 * u) && tailOn p n (2 * u))

lemma tailOn_sound (p : List ℚ) : ∀ (n : ℕ) (u : ℚ), tailOn p n u = true →
    ∀ w : ℝ, (u : ℝ) ≤ w → 0 ≤ evalL (p.map ((↑) : ℚ → ℝ)) w
  | 0, u, h, w, hw => taylor_sound p u h w hw
  | n + 1, u, h, w, hw => by
    simp only [tailOn, Bool.or_eq_true, Bool.and_eq_true, decide_eq_true_eq] at h
    rcases h with h | ⟨⟨h0, hp⟩, hr⟩
    · exact taylor_sound p u h w hw
    · by_cases hw2 : w ≤ ((2 * u : ℚ) : ℝ)
      · exact posOn_sound p 7 u (2 * u) (by linarith) hp w hw hw2
      · exact tailOn_sound p n (2 * u) hr w (le_of_lt (not_le.1 hw2))

end Grothe.Lower
