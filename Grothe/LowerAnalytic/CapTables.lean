import Grothe.LowerAnalytic.CapGrid

/-!
# Rational enclosures of the shared moment tables of the cap certificates (PLAN_CAPS L-e)

Computable rational enclosures, with soundness proofs, of the one-dimensional integrals of the polar
grid of `CapGrid` (`radI`, `tailI`, `angC`, `angS`):

* `GrotheKernel.radEnc a b m` encloses `radI a b m = ∫_a^b 2 r^{m+1} e^{−r²} dr` (`radEnc_sound`,
  `0 ≤ a ≤ b ≤ 8`, `m ≤ 16`; `CapTab.radEncList a b` is the shared list over `m = 0, …, 16`).
  Method: `c = (a+b)/2`, `r = c + t`, `e^{−r²} = e^{−c²} e^{u}`, `u = −2ct − t²`, the Taylor
  polynomial of `e^u` with the remainder of `Real.exp_bound`, exact integration of the polynomial,
  `e^{−c²}` enclosed by Taylor at `−c²/2¹⁰` and ten squarings (`expNegEnc`).
* `GrotheKernel.tailEnc R m` encloses `tailI R m = ∫_R^∞ 2 r^{m+1} e^{−r²} dr` (`tailEnc_sound`,
  `1 ≤ R ≤ 16`, `m ≤ 16`), by `J(k) = R^{k−1}e^{−R²} + ((k−1)/2) J(k−2)`, `J(1) = e^{−R²}`,
  `0 ≤ J(0) ≤ e^{−R²}/R` (`J(k) = ∫_R^∞ 2 r^k e^{−r²}`).
* `GrotheKernel.angEnc N j n` encloses `(angC, angS)` on `[thN N j, thN N (j+1)]` (`angEnc_sound`,
  `4 ≤ N ≤ 4096`, `j < N`, `|n| ≤ 12`), from complex ball arithmetic for `e^{2πim/N}` (Taylor of
  `exp` at `iy/8` by `Complex.exp_bound`, three squarings) and the 30-digit bounds `pi_gt_d30`,
  `pi_lt_d30` (proved with Mathlib's `pi_lower_bound`/`pi_upper_bound` from witnesses printed by
  `tools/gen_cap_tables.py --pi`); `n < 0` by parity, `n = 0` exact.
All outputs are rounded outward to the dyadic grids `2^{-260}` (radial) and `2^{-128}` (angular).
Widths on the grid `h = 1/200`, `Nr = 1600`, `N = 1024`: radial `≤ 8e-34`, tail at `R = 8`
`≤ 1.6e-25`, angular `≤ 2.6e-30`.

**The batch checker** `CapTab.tablesOK : List TEntry → Bool` (`tablesOK_sound`): every entry
`⟨kind, lo, hi⟩` (`kind` one of `rad a b m`, `tail R m`, `cos N j n`, `sin N j n`, value
`TKind.value`) is checked by recomputing its enclosure (the radial list of the current ring and the
ball table of the current `N` are cached, so the entries of a ring should be consecutive) and
testing `lo ≤ enc.1`, `enc.2 ≤ hi`.  `CapTab.parseEntries` reads the line format of
`tools/gen_cap_tables.py` (an exact Python mirror of the enclosures, rounded outward).
Runtime under `native_decide` (interpreted, this module is not precompiled): the full table of the
grid above (27,200 radial, 17 tail, 51,200 angular entries, 11 MB string) parses and checks in 14.5 s.
-/

open Real MeasureTheory Set Finset

namespace Grothe.LowerAnalytic

namespace CapTab

/-! ### List polynomials -/

/-- Sum of coefficient lists. -/
def padd : List ℚ → List ℚ → List ℚ
  | [], q => q
  | a :: p, [] => a :: p
  | a :: p, b :: q => (a + b) :: padd p q

/-- Scalar multiple. -/
def psmul (c : ℚ) (p : List ℚ) : List ℚ := p.map (c * ·)

/-- Product. -/
def pmul : List ℚ → List ℚ → List ℚ
  | [], _ => []
  | a :: p, q => padd (psmul a q) (0 :: pmul p q)

/-- Horner evaluation at a real point. -/
noncomputable def pev : List ℚ → ℝ → ℝ
  | [], _ => 0
  | a :: p, t => a + t * pev p t

lemma pev_padd : ∀ (p q : List ℚ) (t : ℝ), pev (padd p q) t = pev p t + pev q t
  | [], q, t => by simp [padd, pev]
  | a :: p, [], t => by simp [padd, pev]
  | a :: p, b :: q, t => by simp only [padd, pev, pev_padd p q t]; push_cast; ring

lemma pev_psmul (c : ℚ) : ∀ (p : List ℚ) (t : ℝ), pev (psmul c p) t = c * pev p t
  | [], t => by simp [psmul, pev]
  | a :: p, t => by
    have := pev_psmul c p t
    simp only [psmul, List.map_cons, pev] at this ⊢
    rw [this]; push_cast; ring

lemma pev_pmul : ∀ (p q : List ℚ) (t : ℝ), pev (pmul p q) t = pev p t * pev q t
  | [], q, t => by simp [pmul, pev]
  | a :: p, q, t => by
    simp only [pmul, pev_padd, pev_psmul, pev, pev_pmul p q t]; push_cast; ring

lemma continuous_pev : ∀ p : List ℚ, Continuous (pev p)
  | [] => by simp only [pev]; exact continuous_const
  | a :: p => by
    have := continuous_pev p
    show Continuous fun t => (a : ℝ) + t * pev p t
    fun_prop

/-- `∫_α^β t^d p(t) dt`. -/
def pint : List ℚ → ℕ → ℚ → ℚ → ℚ
  | [], _, _, _ => 0
  | a :: p, d, α, β => a * (β ^ (d + 1) - α ^ (d + 1)) / (d + 1) + pint p (d + 1) α β

lemma integral_pev (α β : ℚ) : ∀ (p : List ℚ) (d : ℕ),
    ∫ t in (α : ℝ)..β, t ^ d * pev p t = pint p d α β
  | [], d => by simp [pev, pint]
  | a :: p, d => by
    have ih := integral_pev α β p (d + 1)
    have e : (fun t : ℝ => t ^ d * pev (a :: p) t)
        = fun t => (a : ℝ) * t ^ d + t ^ (d + 1) * pev p t := by
      funext t; simp only [pev]; ring
    rw [e, intervalIntegral.integral_add, intervalIntegral.integral_const_mul, integral_pow, ih]
    · simp only [pint]; push_cast; ring
    · exact (continuous_const.mul (continuous_pow d)).intervalIntegrable _ _
    · exact ((continuous_pow (d + 1)).mul (continuous_pev p)).intervalIntegrable _ _

/-- `(Σ_{m<n} u^m/m!, u^n/n!)` as polynomials. -/
def expPoly (u : List ℚ) : ℕ → List ℚ × List ℚ
  | 0 => ([], [1])
  | n + 1 => let r := expPoly u n; (padd r.1 r.2, psmul (1 / (n + 1 : ℚ)) (pmul r.2 u))

lemma pev_expPoly (u : List ℚ) (t : ℝ) : ∀ n : ℕ,
    pev (expPoly u n).1 t = ∑ m ∈ range n, pev u t ^ m / m.factorial ∧
      pev (expPoly u n).2 t = pev u t ^ n / n.factorial
  | 0 => by simp [expPoly, pev]
  | n + 1 => by
    obtain ⟨h1, h2⟩ := pev_expPoly u t n
    refine ⟨?_, ?_⟩
    · simp only [expPoly, pev_padd, h1, h2, Finset.sum_range_succ]
    · simp only [expPoly, pev_psmul, pev_pmul, h2, Nat.factorial_succ]
      push_cast
      field_simp
      ring

/-! ### Dyadic rounding -/

/-- Round down to the grid `2^{-P}`. -/
def rdDown (q : ℚ) (P : ℕ) : ℚ := (⌊q * 2 ^ P⌋ : ℚ) / 2 ^ P
/-- Round up to the grid `2^{-P}`. -/
def rdUp (q : ℚ) (P : ℕ) : ℚ := (⌈q * 2 ^ P⌉ : ℚ) / 2 ^ P

lemma rdDown_le (q : ℚ) (P : ℕ) : rdDown q P ≤ q := by
  unfold rdDown
  rw [div_le_iff₀ (by positivity)]
  exact Int.floor_le _

lemma le_rdUp (q : ℚ) (P : ℕ) : q ≤ rdUp q P := by
  unfold rdUp
  rw [le_div_iff₀ (by positivity)]
  exact Int.le_ceil _

lemma rdDown_le_real {q : ℚ} {x : ℝ} (P : ℕ) (h : (q : ℝ) ≤ x) : (rdDown q P : ℝ) ≤ x :=
  (Rat.cast_le.2 (rdDown_le q P)).trans h

lemma le_rdUp_real {q : ℚ} {x : ℝ} (P : ℕ) (h : x ≤ q) : x ≤ rdUp q P :=
  h.trans (Rat.cast_le.2 (le_rdUp q P))

/-- The working precision. -/
def prec : ℕ := 260

/-! ### `e^{−x}` -/

/-- `(Σ_{m<n} x^m/m!, x^n/n!)`. -/
def expTay (x : ℚ) : ℕ → ℚ × ℚ
  | 0 => (0, 1)
  | n + 1 => let r := expTay x n; (r.1 + r.2, r.2 * x / (n + 1))

lemma expTay_eq (x : ℚ) : ∀ n : ℕ,
    ((expTay x n).1 : ℝ) = ∑ m ∈ range n, (x : ℝ) ^ m / m.factorial ∧
      ((expTay x n).2 : ℝ) = (x : ℝ) ^ n / n.factorial
  | 0 => by simp [expTay]
  | n + 1 => by
    obtain ⟨h1, h2⟩ := expTay_eq x n
    refine ⟨?_, ?_⟩
    · simp only [expTay, Rat.cast_add, h1, h2, Finset.sum_range_succ]
    · simp only [expTay, Rat.cast_div, Rat.cast_mul, h2, Nat.factorial_succ]
      push_cast
      field_simp
      ring

/-- The remainder `|x|^n (n+1)/(n! n)` of `Real.exp_bound`. -/
def expRem (y : ℚ) (n : ℕ) : ℚ := y ^ n * ((n + 1 : ℚ) / (n.factorial * n))

/-- Squaring of a nonnegative enclosure, `k` times. -/
def sqIter : ℕ → ℚ × ℚ → ℚ × ℚ
  | 0, e => e
  | k + 1, e => let f := sqIter k e; (rdDown (f.1 ^ 2) prec, rdUp (f.2 ^ 2) prec)

/-- An enclosure of `e^{−x}` for `0 ≤ x ≤ 1024`. -/
def expNegEnc (x : ℚ) : ℚ × ℚ :=
  let y := x / 2 ^ 10
  let T := (expTay (-y) 30).1
  let E := expRem y 30
  sqIter 10 (max 0 (rdDown (T - E) prec), rdUp (T + E) prec)

lemma sqIter_sound (y : ℝ) : ∀ (k : ℕ) (e : ℚ × ℚ), 0 ≤ e.1 → (e.1 : ℝ) ≤ exp (-y) →
    exp (-y) ≤ e.2 → 0 ≤ (sqIter k e).1 ∧ ((sqIter k e).1 : ℝ) ≤ exp (-(y * 2 ^ k)) ∧
      exp (-(y * 2 ^ k)) ≤ (sqIter k e).2
  | 0, e, h0, h1, h2 => by simpa [sqIter] using ⟨h0, h1, h2⟩
  | k + 1, e, h0, h1, h2 => by
    obtain ⟨g0, g1, g2⟩ := sqIter_sound y k e h0 h1 h2
    have he : exp (-(y * 2 ^ (k + 1))) = exp (-(y * 2 ^ k)) ^ 2 := by
      rw [← Real.exp_nat_mul]; congr 1; push_cast; ring
    simp only [sqIter]
    refine ⟨?_, ?_, ?_⟩
    · unfold rdDown; positivity
    · rw [he]
      refine rdDown_le_real prec ?_
      push_cast
      exact pow_le_pow_left₀ (by exact_mod_cast g0) g1 2
    · rw [he]
      refine le_rdUp_real prec ?_
      push_cast
      exact pow_le_pow_left₀ (exp_pos _).le g2 2

theorem expNegEnc_sound {x : ℚ} (h0 : 0 ≤ x) (h1 : x ≤ 1024) :
    ((expNegEnc x).1 : ℝ) ≤ exp (-(x : ℝ)) ∧ exp (-(x : ℝ)) ≤ (expNegEnc x).2 ∧
      0 ≤ (expNegEnc x).1 := by
  obtain ⟨y, hy⟩ : ∃ y : ℚ, y = x / 2 ^ 10 := ⟨_, rfl⟩
  have hdef : expNegEnc x = sqIter 10 (max 0 (rdDown ((expTay (-y) 30).1 - expRem y 30) prec),
      rdUp ((expTay (-y) 30).1 + expRem y 30) prec) := by simp only [expNegEnc, hy]
  rw [hdef]
  have hy0 : (0 : ℝ) ≤ y := by rw [hy]; push_cast; positivity
  have hy1 : |(-(y : ℝ))| ≤ 1 := by
    rw [abs_neg, abs_of_nonneg hy0, hy]; push_cast
    have : (x : ℝ) ≤ 1024 := by exact_mod_cast h1
    linarith
  have hb := Real.exp_bound hy1 (n := 30) (by norm_num)
  obtain ⟨hT, -⟩ := expTay_eq (-y) 30
  have hb' : |exp (-(y : ℝ)) - ((expTay (-y) 30).1 : ℝ)| ≤ (expRem y 30 : ℝ) := by
    rw [hT]; push_cast
    refine hb.trans_eq ?_
    rw [abs_neg, abs_of_nonneg hy0]; simp [expRem]; norm_num
  have hlo : (((expTay (-y) 30).1 - expRem y 30 : ℚ) : ℝ) ≤ exp (-(y : ℝ)) := by
    push_cast; linarith [(abs_le.1 hb').1]
  have hhi : exp (-(y : ℝ)) ≤ (((expTay (-y) 30).1 + expRem y 30 : ℚ) : ℝ) := by
    push_cast; linarith [(abs_le.1 hb').2]
  have hs := sqIter_sound (y : ℝ) 10
    (max 0 (rdDown ((expTay (-y) 30).1 - expRem y 30) prec),
      rdUp ((expTay (-y) 30).1 + expRem y 30) prec) (le_max_left _ _)
    (by
      simp only
      rcases le_total (0 : ℚ) (rdDown ((expTay (-y) 30).1 - expRem y 30) prec) with h | h
      · rw [max_eq_right h]; exact rdDown_le_real prec hlo
      · rw [max_eq_left h]; push_cast; exact (exp_pos _).le)
    (le_rdUp_real prec hhi)
  have hx : ((y : ℝ) * 2 ^ 10) = x := by rw [hy]; push_cast; ring
  rw [hx] at hs
  exact ⟨hs.2.1, hs.2.2, hs.1⟩

/-! ### Radial cell moments -/

lemma lsum_range (n : ℕ) (f : ℕ → ℚ) : ((List.range n).map f).sum = ∑ p ∈ range n, f p := by
  induction n with
  | zero => simp
  | succ n ih => rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ, ih]; simp

/-- The number of Taylor terms for `|u| ≤ U`. -/
def radTerms (U : ℚ) : ℕ := if U ≤ 1 / 16 then 16 else if U ≤ 1 / 2 then 30 else 40

lemma radTerms_pos (U : ℚ) : 0 < radTerms U := by unfold radTerms; split_ifs <;> norm_num

/-- The radial enclosure of one `k` from the shared data. -/
def radOne (a b c E : ℚ) (X : ℚ × ℚ) (Ms : List ℚ) (k : ℕ) : ℚ × ℚ :=
  let base := 2 * ((List.range (k + 2)).map fun p =>
    ((k + 1).choose p : ℚ) * c ^ (k + 1 - p) * Ms.getD p 0).sum
  let rem := E * (2 * (b ^ (k + 2) - a ^ (k + 2)) / (k + 2))
  let jl := base - rem
  let jh := base + rem
  (rdDown (if 0 ≤ jl then X.1 * jl else X.2 * jl) prec,
    rdUp (if 0 ≤ jh then X.2 * jh else X.1 * jh) prec)

/-- **Enclosures of `∫_a^b 2 r^{k+1} e^{−r²} dr` for `k = 0, …, 16`.** -/
def radEncList (a b : ℚ) : List (ℚ × ℚ) :=
  let c := (a + b) / 2
  let h := (b - a) / 2
  let U := 2 * c * h + h ^ 2
  if U ≤ 1 then
    let n := radTerms U
    let S := (expPoly [0, -2 * c, -1] n).1
    let E := expRem U n
    let X := expNegEnc (c ^ 2)
    let Ms := (List.range 18).map fun p => pint S p (-h) h
    (List.range 17).map (radOne a b c E X Ms)
  else (List.range 17).map fun k => (0, 2 * (b - a) * b ^ (k + 1))

/-- **The enclosure of `∫_a^b 2 r^{k+1} e^{−r²} dr`.** -/
def radEnc (a b : ℚ) (k : ℕ) : ℚ × ℚ := (radEncList a b).getD k (0, 0)

/-- The integrand. -/
noncomputable def radF (k : ℕ) (r : ℝ) : ℝ := 2 * r ^ (k + 1) * exp (-r ^ 2)

lemma continuous_radF (k : ℕ) : Continuous (radF k) := by unfold radF; fun_prop

lemma pev_u (c : ℚ) (t : ℝ) : pev [0, -2 * c, -1] t = -2 * c * t - t ^ 2 := by
  simp [pev]; ring

/-- The analytic core: `I` between `e^{−c²}` times the integrals of the Taylor bounds. -/
lemma rad_core {a b c h U E : ℝ} (k n : ℕ) (hn : 0 < n) (ha : 0 ≤ a) (hab : a ≤ b)
    (hc : c = (a + b) / 2) (hh : h = (b - a) / 2) (hU : 2 * c * h + h ^ 2 ≤ U) (hU1 : U ≤ 1)
    (hE : U ^ n * (n.succ / (n.factorial * n)) ≤ E) (S : ℝ → ℝ) (hSc : Continuous S)
    (hS : ∀ t, S t = ∑ m ∈ range n, (-2 * c * t - t ^ 2) ^ m / m.factorial) :
    exp (-c ^ 2) * ∫ t in -h..h, 2 * (c + t) ^ (k + 1) * (S t - E) ≤ ∫ r in a..b, radF k r ∧
      ∫ r in a..b, radF k r ≤ exp (-c ^ 2) * ∫ t in -h..h, 2 * (c + t) ^ (k + 1) * (S t + E) := by
  have hab' : c + -h = a := by rw [hc, hh]; ring
  have hba' : c + h = b := by rw [hc, hh]; ring
  have hI : ∫ r in a..b, radF k r = exp (-c ^ 2) * ∫ t in -h..h, 2 * (c + t) ^ (k + 1)
      * exp (-2 * c * t - t ^ 2) := by
    rw [← intervalIntegral.integral_const_mul, ← hab', ← hba',
      ← intervalIntegral.integral_comp_add_left]
    congr 1; funext t
    unfold radF
    rw [show -(c + t) ^ 2 = -c ^ 2 + (-2 * c * t - t ^ 2) by ring, Real.exp_add]
    ring
  have hh0 : 0 ≤ h := by rw [hh]; linarith
  have hc0 : 0 ≤ c := by rw [hc]; linarith
  have hpt : ∀ t ∈ Icc (-h) h, |exp (-2 * c * t - t ^ 2) - S t| ≤ E ∧ 0 ≤ 2 * (c + t) ^ (k + 1) := by
    intro t ht
    have hu : |(-2 * c * t - t ^ 2)| ≤ U := by
      have h1 : |t| ≤ h := abs_le.2 ⟨by linarith [ht.1], ht.2⟩
      have h2 : t ^ 2 ≤ h ^ 2 := by rw [← sq_abs]; exact pow_le_pow_left₀ (abs_nonneg _) h1 2
      have h3 : |(-2 * c * t - t ^ 2)| ≤ 2 * c * |t| + t ^ 2 := by
        refine (abs_sub _ _).trans ?_
        rw [abs_mul, abs_mul, abs_neg, abs_of_nonneg (sq_nonneg t), abs_two, abs_of_nonneg hc0]
      have h4 : 2 * c * |t| ≤ 2 * c * h := by
        exact mul_le_mul_of_nonneg_left h1 (by positivity)
      linarith
    refine ⟨?_, ?_⟩
    · have hb := Real.exp_bound (hu.trans hU1) hn
      rw [hS t]
      refine hb.trans ((mul_le_mul_of_nonneg_right
        (pow_le_pow_left₀ (abs_nonneg _) hu n) (by positivity)).trans hE)
    · have : 0 ≤ c + t := by linarith [ht.1]
      positivity
  have hm : -h ≤ h := by linarith
  have cS : Continuous fun t => exp (-2 * c * t - t ^ 2) := by fun_prop
  rw [hI]
  have he := exp_pos (-c ^ 2)
  constructor
  · refine mul_le_mul_of_nonneg_left (intervalIntegral.integral_mono_on hm ?_ ?_ fun t ht => ?_) he.le
    · exact (by fun_prop : Continuous fun t => 2 * (c + t) ^ (k + 1) * (S t - E)).intervalIntegrable _ _
    · exact (by fun_prop : Continuous fun t => 2 * (c + t) ^ (k + 1) * exp (-2 * c * t - t ^ 2)).intervalIntegrable _ _
    · obtain ⟨h1, h2⟩ := hpt t ht
      exact mul_le_mul_of_nonneg_left (by linarith [(abs_le.1 h1).1]) h2
  · refine mul_le_mul_of_nonneg_left (intervalIntegral.integral_mono_on hm ?_ ?_ fun t ht => ?_) he.le
    · exact (by fun_prop : Continuous fun t => 2 * (c + t) ^ (k + 1) * exp (-2 * c * t - t ^ 2)).intervalIntegrable _ _
    · exact (by fun_prop : Continuous fun t => 2 * (c + t) ^ (k + 1) * (S t + E)).intervalIntegrable _ _
    · obtain ⟨h1, h2⟩ := hpt t ht
      exact mul_le_mul_of_nonneg_left (by linarith [(abs_le.1 h1).2]) h2

/-- The integral of the Taylor bound, exactly. -/
lemma rad_integral (a b c h E : ℚ) (hab' : c - h = a) (hba' : c + h = b) (S : List ℚ) (k : ℕ)
    (σ : ℝ) :
    ∫ t in (-(h : ℝ))..h, 2 * ((c : ℝ) + t) ^ (k + 1) * (pev S t + σ * E)
      = 2 * ∑ p ∈ range (k + 2), ((k + 1).choose p : ℝ) * (c : ℝ) ^ (k + 1 - p)
          * (pint S p (-h) h : ℝ)
        + σ * E * (2 * ((b : ℝ) ^ (k + 2) - (a : ℝ) ^ (k + 2)) / (k + 2)) := by
  have e1 : (fun t : ℝ => 2 * ((c : ℝ) + t) ^ (k + 1) * (pev S t + σ * E))
      = fun t => 2 * ∑ p ∈ range (k + 2), ((k + 1).choose p : ℝ) * (c : ℝ) ^ (k + 1 - p)
          * (t ^ p * pev S t) + σ * E * (2 * ((c : ℝ) + t) ^ (k + 1)) := by
    funext t
    rw [add_comm (c : ℝ) t, add_pow, mul_add, Finset.mul_sum, Finset.mul_sum, Finset.sum_mul]
    congr 1
    · refine Finset.sum_congr rfl fun p _ => by ring
    · ring
  rw [e1, intervalIntegral.integral_add, intervalIntegral.integral_const_mul,
    intervalIntegral.integral_finsetSum, intervalIntegral.integral_const_mul,
    intervalIntegral.integral_const_mul]
  · congr 1
    · congr 1
      refine Finset.sum_congr rfl fun p _ => ?_
      rw [intervalIntegral.integral_const_mul]
      congr 1
      have := integral_pev (-h) h S p
      push_cast at this
      exact this
    · congr 1
      have hc := intervalIntegral.integral_comp_add_left (fun r : ℝ => r ^ (k + 1)) (c : ℝ)
        (a := -(h : ℝ)) (b := h)
      rw [hc, integral_pow]
      have e2 : (c : ℝ) + -h = a := by rw [← hab']; push_cast; ring
      have e3 : (c : ℝ) + h = b := by rw [← hba']; push_cast; rfl
      rw [e2, e3]; push_cast; ring
  · intro p _
    exact (continuous_const.mul ((continuous_pow p).mul (continuous_pev S))).intervalIntegrable _ _
  · exact (continuous_const.mul (continuous_finsetSum _ fun p _ =>
      continuous_const.mul ((continuous_pow p).mul (continuous_pev S)))).intervalIntegrable _ _
  · exact (by fun_prop : Continuous fun t : ℝ => (σ : ℝ) * E * (2 * ((c : ℝ) + t) ^ (k + 1))).intervalIntegrable _ _

/-- Scaling an enclosed integral by an enclosed positive constant. -/
lemma scale_lo {X1 X2 j : ℚ} {e J : ℝ} (h1 : (X1 : ℝ) ≤ e) (h2 : e ≤ X2) (h0 : 0 ≤ X1)
    (hj : (j : ℝ) ≤ J) :
    ((if 0 ≤ j then X1 * j else X2 * j : ℚ) : ℝ) ≤ e * J := by
  have he : 0 ≤ e := (Rat.cast_nonneg.2 h0).trans h1
  split_ifs with hs
  · push_cast
    have : (0 : ℝ) ≤ j := by exact_mod_cast hs
    calc (X1 : ℝ) * j ≤ e * j := mul_le_mul_of_nonneg_right h1 this
      _ ≤ e * J := mul_le_mul_of_nonneg_left hj he
  · push_cast
    have : (j : ℝ) < 0 := by exact_mod_cast (not_le.1 hs)
    calc (X2 : ℝ) * j ≤ e * j := mul_le_mul_of_nonpos_right h2 this.le
      _ ≤ e * J := mul_le_mul_of_nonneg_left hj he

lemma scale_hi {X1 X2 j : ℚ} {e J : ℝ} (h1 : (X1 : ℝ) ≤ e) (h2 : e ≤ X2) (h0 : 0 ≤ X1)
    (hj : J ≤ (j : ℝ)) :
    e * J ≤ ((if 0 ≤ j then X2 * j else X1 * j : ℚ) : ℝ) := by
  have he : 0 ≤ e := (Rat.cast_nonneg.2 h0).trans h1
  split_ifs with hs
  · push_cast
    have : (0 : ℝ) ≤ j := by exact_mod_cast hs
    calc e * J ≤ e * j := mul_le_mul_of_nonneg_left hj he
      _ ≤ X2 * j := mul_le_mul_of_nonneg_right h2 this
  · push_cast
    have : (j : ℝ) < 0 := by exact_mod_cast (not_le.1 hs)
    calc e * J ≤ e * j := mul_le_mul_of_nonneg_left hj he
      _ ≤ X1 * j := mul_le_mul_of_nonpos_right h1 this.le

/-- **Soundness of the radial list.** -/
theorem radEncList_sound {a b : ℚ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 8) {k : ℕ} (hk : k ≤ 16) :
    (((radEncList a b).getD k (0, 0)).1 : ℝ) ≤ ∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * exp (-r ^ 2) ∧
      (∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * exp (-r ^ 2)) ≤ ((radEncList a b).getD k (0, 0)).2 := by
  have hk' : k < 17 := by omega
  have hR : ∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * exp (-r ^ 2) = ∫ r in (a : ℝ)..b, radF k r := rfl
  rw [hR]
  unfold radEncList
  dsimp only
  split_ifs with hU
  · rw [List.getD_eq_getElem _ _ (by simp; omega), List.getElem_map, List.getElem_range]
    -- shared data
    obtain ⟨c, hc⟩ : ∃ c : ℚ, c = (a + b) / 2 := ⟨_, rfl⟩
    obtain ⟨h, hh⟩ : ∃ h : ℚ, h = (b - a) / 2 := ⟨_, rfl⟩
    rw [← hc, ← hh] at hU ⊢
    set n := radTerms (2 * c * h + h ^ 2) with hn
    have hn0 : 0 < n := radTerms_pos _
    set S := (expPoly [0, -2 * c, -1] n).1 with hS
    set U := 2 * c * h + h ^ 2 with hUdef
    have hX := expNegEnc_sound (x := c ^ 2) (sq_nonneg c) (by
      have : c ≤ 8 := by rw [hc]; linarith
      have : 0 ≤ c := by rw [hc]; linarith
      nlinarith)
    have hcore := rad_core (a := (a : ℝ)) (b := b) (c := c) (h := h) (U := U)
      (E := expRem U n) k n hn0 (by exact_mod_cast ha) (by exact_mod_cast hab)
      (by rw [hc]; push_cast; ring) (by rw [hh]; push_cast; ring) (by rw [hUdef]; push_cast; rfl)
      (by exact_mod_cast hU) (by simp [expRem]) (pev S) (continuous_pev S) (fun t => by
        rw [hS, (pev_expPoly _ t n).1, pev_u])
    have hlo' := rad_integral a b c h (expRem U n) (by rw [hc, hh]; ring) (by rw [hc, hh]; ring) S k (-1)
    have hhi' := rad_integral a b c h (expRem U n) (by rw [hc, hh]; ring) (by rw [hc, hh]; ring) S k 1
    have ea : ∀ t : ℝ, pev S t + (-1) * (expRem U n : ℝ) = pev S t - expRem U n := fun t => by ring
    have eb : ∀ t : ℝ, pev S t + 1 * (expRem U n : ℝ) = pev S t + expRem U n := fun t => by ring
    simp only [ea, eb] at hlo' hhi'
    rw [hlo'] at hcore
    rw [hhi'] at hcore
    have hX2 : exp (-(c : ℝ) ^ 2) = exp (-((c ^ 2 : ℚ) : ℝ)) := by push_cast; rfl
    rw [hX2] at hcore
    have hMs : ∀ p < 18, ((List.range 18).map fun p => pint S p (-h) h).getD p 0 = pint S p (-h) h :=
      fun p hp => by rw [List.getD_eq_getElem _ _ (by simp; omega)]; simp
    have hsumQ : ((List.range (k + 2)).map fun p => ((k + 1).choose p : ℚ) * c ^ (k + 1 - p)
        * ((List.range 18).map fun p => pint S p (-h) h).getD p 0).sum
        = ∑ p ∈ range (k + 2), ((k + 1).choose p : ℚ) * c ^ (k + 1 - p) * pint S p (-h) h := by
      rw [lsum_range]
      refine Finset.sum_congr rfl fun p hp => ?_
      rw [hMs p (by simp at hp; omega)]
    simp only [radOne]
    rw [hsumQ]
    constructor
    · refine rdDown_le_real prec (scale_lo hX.1 hX.2.1 hX.2.2 (le_of_eq ?_) |>.trans hcore.1)
      push_cast; ring
    · refine le_rdUp_real prec (hcore.2.trans (scale_hi hX.1 hX.2.1 hX.2.2 (le_of_eq ?_)))
      push_cast; ring
  · rw [List.getD_eq_getElem _ _ (by simp; omega), List.getElem_map, List.getElem_range]
    have ha' : (0 : ℝ) ≤ a := by exact_mod_cast ha
    have hab' : (a : ℝ) ≤ b := by exact_mod_cast hab
    constructor
    · push_cast
      refine intervalIntegral.integral_nonneg hab' fun r hr => ?_
      unfold radF
      have : 0 ≤ r := ha'.trans hr.1
      positivity
    · have hle : ∫ r in (a : ℝ)..b, radF k r ≤ ∫ r in (a : ℝ)..b, 2 * (b : ℝ) ^ (k + 1) := by
        refine intervalIntegral.integral_mono_on hab' ((continuous_radF k).intervalIntegrable _ _)
          (continuous_const.intervalIntegrable _ _) (fun r hr => ?_)
        unfold radF
        have h0 : 0 ≤ r := ha'.trans hr.1
        have h1 : r ^ (k + 1) ≤ (b : ℝ) ^ (k + 1) := pow_le_pow_left₀ h0 hr.2 _
        have h2 : exp (-r ^ 2) ≤ 1 := by rw [exp_le_one_iff]; nlinarith
        have h3 : 0 ≤ r ^ (k + 1) := by positivity
        nlinarith [exp_pos (-r ^ 2)]
      refine hle.trans (le_of_eq ?_)
      simp; ring

/-- **Soundness of the radial enclosure.** -/
theorem radEnc_sound {a b : ℚ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 8) (k : ℕ) (hk : k ≤ 16) :
    ((radEnc a b k).1 : ℝ) ≤ ∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * Real.exp (-r ^ 2) ∧
      (∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * Real.exp (-r ^ 2)) ≤ (radEnc a b k).2 :=
  radEncList_sound ha hab hb hk

/-! ### Gaussian tails -/

/-- Enclosures of `(J(m), J(m+1))`, `J(m) = ∫_R^∞ 2 r^m e^{−r²}`, from an enclosure `X` of `e^{−R²}`. -/
def tailPair (R : ℚ) (X : ℚ × ℚ) : ℕ → (ℚ × ℚ) × (ℚ × ℚ)
  | 0 => ((0, X.2 / R), X)
  | m + 1 =>
    let p := tailPair R X m
    (p.2, (R ^ (m + 1) * X.1 + ((m : ℚ) + 1) / 2 * p.1.1,
      R ^ (m + 1) * X.2 + ((m : ℚ) + 1) / 2 * p.1.2))

/-- **The enclosure of `∫_R^∞ 2 r^{k+1} e^{−r²} dr`.** -/
def tailEnc (R : ℚ) (k : ℕ) : ℚ × ℚ :=
  let p := (tailPair R (expNegEnc (R ^ 2)) (k + 1)).1
  (rdDown p.1 prec, rdUp p.2 prec)

/-- `J(m)`. -/
noncomputable def tailJ (R : ℝ) (m : ℕ) : ℝ := ∫ r in Ioi R, 2 * r ^ m * exp (-r ^ 2)

lemma integrableOn_tail {R : ℝ} (hR : 0 < R) (m : ℕ) :
    IntegrableOn (fun r : ℝ => 2 * r ^ m * exp (-r ^ 2)) (Ioi R) := by
  have h := (integrableOn_rpow_mul_exp_neg_mul_sq (b := 1) one_pos
    (s := (m : ℝ)) (by linarith [(Nat.cast_nonneg m : (0 : ℝ) ≤ m)])).mono_set
    (Ioi_subset_Ioi hR.le)
  refine IntegrableOn.congr_fun (Integrable.const_mul h 2) (fun r _ => ?_) measurableSet_Ioi
  simp only [Real.rpow_natCast, neg_mul, one_mul]
  ring

lemma tendsto_pow_mul_exp_neg_sq (m : ℕ) :
    Filter.Tendsto (fun r : ℝ => r ^ m * exp (-r ^ 2)) Filter.atTop (nhds 0) := by
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds
    (Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero m) ?_ ?_
  · filter_upwards [Filter.eventually_ge_atTop (0 : ℝ)] with r hr
    positivity
  · filter_upwards [Filter.eventually_ge_atTop (1 : ℝ)] with r hr
    have : exp (-r ^ 2) ≤ exp (-r) := exp_le_exp.2 (by nlinarith)
    exact mul_le_mul_of_nonneg_left this (by positivity)

lemma tailJ_one {R : ℝ} (hR : 0 < R) : tailJ R 1 = exp (-R ^ 2) := by
  unfold tailJ
  have h := integral_Ioi_of_hasDerivAt_of_tendsto' (a := R) (m := 0)
    (f := fun r => -exp (-r ^ 2)) (f' := fun r => 2 * r ^ 1 * exp (-r ^ 2))
    (fun r _ => by
      have h1 : HasDerivAt (fun r : ℝ => -r ^ 2) (-(2 * r)) r := by
        have := (hasDerivAt_pow 2 r).const_mul (-1 : ℝ)
        convert this using 1
        · funext x; ring
        · push_cast; ring
      convert h1.exp.neg using 1; ring)
    (integrableOn_tail hR 1) (by simpa using (tendsto_pow_mul_exp_neg_sq 0).neg)
  rw [h]; ring

lemma tailJ_rec {R : ℝ} (hR : 0 < R) (m : ℕ) :
    tailJ R (m + 2) = R ^ (m + 1) * exp (-R ^ 2) + (m + 1) / 2 * tailJ R m := by
  unfold tailJ
  have h := integral_Ioi_of_hasDerivAt_of_tendsto' (a := R) (m := 0)
    (f := fun r => -(r ^ (m + 1) * exp (-r ^ 2)))
    (f' := fun r => 2 * r ^ (m + 2) * exp (-r ^ 2) - (m + 1) / 2 * (2 * r ^ m * exp (-r ^ 2)))
    (fun r _ => by
      have h1 : HasDerivAt (fun r : ℝ => -r ^ 2) (-(2 * r)) r := by
        have := (hasDerivAt_pow 2 r).const_mul (-1 : ℝ)
        convert this using 1
        · funext x; ring
        · push_cast; ring
      convert ((hasDerivAt_pow (m + 1) r).mul h1.exp).neg using 1
      simp only [Nat.add_sub_cancel]; push_cast; ring)
    ((integrableOn_tail hR (m + 2)).sub ((integrableOn_tail hR m).const_mul _))
    (by simpa using (tendsto_pow_mul_exp_neg_sq (m + 1)).neg)
  rw [integral_sub (integrableOn_tail hR (m + 2)) ((integrableOn_tail hR m).const_mul _),
    integral_const_mul] at h
  linarith

lemma tailJ_zero {R : ℝ} (hR : 0 < R) : 0 ≤ tailJ R 0 ∧ tailJ R 0 ≤ exp (-R ^ 2) / R := by
  constructor
  · exact setIntegral_nonneg measurableSet_Ioi fun r _ => by positivity
  · rw [← tailJ_one hR, div_eq_inv_mul, tailJ, tailJ, ← integral_const_mul]
    refine setIntegral_mono_on (integrableOn_tail hR 0) ((integrableOn_tail hR 1).const_mul _)
      measurableSet_Ioi fun r hr => ?_
    have hr' : R < r := hr
    have : 1 ≤ R⁻¹ * r := by rw [inv_mul_eq_div, le_div_iff₀ hR]; linarith
    have he := exp_pos (-r ^ 2)
    calc 2 * r ^ 0 * exp (-r ^ 2) = 1 * (2 * exp (-r ^ 2)) := by ring
      _ ≤ R⁻¹ * r * (2 * exp (-r ^ 2)) := mul_le_mul_of_nonneg_right this (by positivity)
      _ = R⁻¹ * (2 * r ^ 1 * exp (-r ^ 2)) := by ring

lemma tailPair_sound {R : ℚ} (hR : 0 < R) {X : ℚ × ℚ} (h1 : (X.1 : ℝ) ≤ exp (-(R : ℝ) ^ 2))
    (h2 : exp (-(R : ℝ) ^ 2) ≤ X.2) : ∀ m : ℕ,
    ((tailPair R X m).1.1 : ℝ) ≤ tailJ R m ∧ tailJ R m ≤ (tailPair R X m).1.2 ∧
      ((tailPair R X m).2.1 : ℝ) ≤ tailJ R (m + 1) ∧ tailJ R (m + 1) ≤ (tailPair R X m).2.2
  | 0 => by
    have hR' : (0 : ℝ) < R := by exact_mod_cast hR
    obtain ⟨j0, j1⟩ := tailJ_zero hR'
    simp only [tailPair, Rat.cast_zero, Rat.cast_div, zero_add, tailJ_one hR']
    refine ⟨j0, j1.trans (div_le_div_of_nonneg_right h2 hR'.le), h1, h2⟩
  | m + 1 => by
    have hR' : (0 : ℝ) < R := by exact_mod_cast hR
    obtain ⟨a1, a2, a3, a4⟩ := tailPair_sound hR h1 h2 m
    simp only [tailPair]
    refine ⟨a3, a4, ?_, ?_⟩
    · rw [show m + 1 + 1 = m + 2 by ring, tailJ_rec hR' m]
      push_cast
      have hm : (0 : ℝ) ≤ (m + 1) / 2 := by positivity
      have := mul_le_mul_of_nonneg_left h1 (pow_nonneg hR'.le (m + 1))
      nlinarith [mul_le_mul_of_nonneg_left a1 hm]
    · rw [show m + 1 + 1 = m + 2 by ring, tailJ_rec hR' m]
      push_cast
      have hm : (0 : ℝ) ≤ (m + 1) / 2 := by positivity
      have := mul_le_mul_of_nonneg_left h2 (pow_nonneg hR'.le (m + 1))
      nlinarith [mul_le_mul_of_nonneg_left a2 hm]

/-- **Soundness of the tail enclosure.** -/
theorem tailEnc_sound {R : ℚ} (hR : 1 ≤ R) (hR8 : R ≤ 16) (k : ℕ) (_hk : k ≤ 16) :
    ((tailEnc R k).1 : ℝ) ≤ ∫ r in Set.Ioi (R : ℝ), 2 * r ^ (k + 1) * Real.exp (-r ^ 2) ∧
      (∫ r in Set.Ioi (R : ℝ), 2 * r ^ (k + 1) * Real.exp (-r ^ 2)) ≤ (tailEnc R k).2 := by
  have hX := expNegEnc_sound (x := R ^ 2) (sq_nonneg R) (by nlinarith)
  have e : exp (-((R ^ 2 : ℚ) : ℝ)) = exp (-(R : ℝ) ^ 2) := by push_cast; rfl
  rw [e] at hX
  obtain ⟨-, -, h3, h4⟩ := tailPair_sound (by linarith) hX.1 hX.2.1 k
  exact ⟨rdDown_le_real prec h3, le_rdUp_real prec h4⟩

/-! ### Angular moments -/

/-- A complex ball: center `re + i·im`, radius `rad`. -/
structure CBall where
  re : ℚ
  im : ℚ
  rad : ℚ

/-- The center. -/
noncomputable def CBall.c (B : CBall) : ℂ := ⟨B.re, B.im⟩

/-- Membership. -/
def CBall.mem (z : ℂ) (B : CBall) : Prop := ‖z - B.c‖ ≤ B.rad

/-- `|re| + |im|`. -/
def nrm1 (B : CBall) : ℚ := |B.re| + |B.im|

lemma norm_c_le (B : CBall) : ‖B.c‖ ≤ nrm1 B := by
  refine (Complex.norm_le_abs_re_add_abs_im _).trans (le_of_eq ?_)
  simp [CBall.c, nrm1]

/-- The angular precision. -/
def angP : ℕ := 128

/-- Product of balls. -/
def cmul (A B : CBall) : CBall :=
  ⟨A.re * B.re - A.im * B.im, A.re * B.im + A.im * B.re, A.rad * (nrm1 B + B.rad) + B.rad * nrm1 A⟩

lemma mem_cmul {z w : ℂ} {A B : CBall} (hz : CBall.mem z A) (hw : CBall.mem w B) :
    CBall.mem (z * w) (cmul A B) := by
  unfold CBall.mem at *
  have hc : (cmul A B).c = A.c * B.c := by
    apply Complex.ext <;> simp [cmul, CBall.c]
  have hrad : ((cmul A B).rad : ℝ) = A.rad * (nrm1 B + B.rad) + B.rad * nrm1 A := by
    simp [cmul]
  rw [hc, hrad]
  have e : z * w - A.c * B.c = (z - A.c) * w + A.c * (w - B.c) := by ring
  have hw' : ‖w‖ ≤ nrm1 B + B.rad := by
    have := norm_le_norm_add_norm_sub' w B.c
    linarith [norm_c_le B, norm_sub_rev w B.c]
  have hA := norm_c_le A
  have hr0 : (0 : ℝ) ≤ A.rad := (norm_nonneg _).trans hz
  rw [e]
  refine (norm_add_le _ _).trans ?_
  rw [norm_mul, norm_mul]
  have h1 := mul_le_mul hz hw' (norm_nonneg _) hr0
  have h2 := mul_le_mul hA hw (norm_nonneg _) ((norm_nonneg _).trans hA)
  linarith

/-- Round the center down to the grid `2^{-angP}`, enlarging the radius. -/
def cround (B : CBall) : CBall :=
  ⟨rdDown B.re angP, rdDown B.im angP,
    rdUp (B.rad + (B.re - rdDown B.re angP) + (B.im - rdDown B.im angP)) angP⟩

lemma mem_cround {z : ℂ} {B : CBall} (h : CBall.mem z B) : CBall.mem z (cround B) := by
  unfold CBall.mem at *
  have h1 : ‖B.c - (cround B).c‖ ≤ (B.re - rdDown B.re angP : ℚ) + (B.im - rdDown B.im angP : ℚ) := by
    refine (Complex.norm_le_abs_re_add_abs_im _).trans (le_of_eq ?_)
    simp only [CBall.c, cround, Complex.sub_re, Complex.sub_im]
    rw [abs_of_nonneg, abs_of_nonneg]
    · push_cast; ring
    · have := rdDown_le B.im angP; exact_mod_cast sub_nonneg.2 this
    · have := rdDown_le B.re angP; exact_mod_cast sub_nonneg.2 this
  have e : z - (cround B).c = (z - B.c) + (B.c - (cround B).c) := by ring
  have hr : (B.rad : ℝ) + ((B.re - rdDown B.re angP : ℚ) + (B.im - rdDown B.im angP : ℚ))
      ≤ (cround B).rad := by
    simp only [cround]; exact le_rdUp_real angP (by push_cast; linarith)
  rw [e]
  exact (norm_add_le _ _).trans ((add_le_add h h1).trans hr)

/-- `(Σ_{m<n} (iy)^m/m!, (iy)^n/n!)` as pairs `(re, im)`. -/
def expITay (y : ℚ) : ℕ → (ℚ × ℚ) × (ℚ × ℚ)
  | 0 => ((0, 0), (1, 0))
  | n + 1 =>
    let r := expITay y n
    ((r.1.1 + r.2.1, r.1.2 + r.2.2), (-r.2.2 * y / (n + 1), r.2.1 * y / (n + 1)))

lemma expITay_eq (y : ℚ) : ∀ n : ℕ,
    (⟨(expITay y n).1.1, (expITay y n).1.2⟩ : ℂ)
        = ∑ m ∈ range n, (((y : ℝ) : ℂ) * Complex.I) ^ m / m.factorial ∧
      (⟨(expITay y n).2.1, (expITay y n).2.2⟩ : ℂ) = (((y : ℝ) : ℂ) * Complex.I) ^ n / n.factorial
  | 0 => by
    refine ⟨?_, ?_⟩ <;> apply Complex.ext <;> simp [expITay]
  | n + 1 => by
    obtain ⟨h1, h2⟩ := expITay_eq y n
    refine ⟨?_, ?_⟩
    · rw [Finset.sum_range_succ, ← h1, ← h2]
      apply Complex.ext <;> simp [expITay]
    · have e : (((y : ℝ) : ℂ) * Complex.I) ^ (n + 1) / ((n + 1).factorial : ℂ)
          = (((y : ℝ) : ℂ) * Complex.I) ^ n / (n.factorial : ℂ)
            * (((y : ℝ) : ℂ) * Complex.I * (((1 / (n + 1) : ℝ)) : ℂ)) := by
        rw [Nat.factorial_succ]; push_cast; field_simp; ring
      rw [e, ← h2]
      apply Complex.ext
      · simp only [expITay, Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
          Complex.I_re, Complex.I_im]
        push_cast; ring
      · simp only [expITay, Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
          Complex.I_re, Complex.I_im]
        push_cast; ring

/-- The Taylor ball of `e^{iy}`. -/
def expIBall (y : ℚ) : CBall :=
  let r := expITay y 30
  ⟨r.1.1, r.1.2, expRem |y| 30⟩

lemma mem_expIBall {y : ℚ} (hy : |y| ≤ 1) : CBall.mem (Complex.exp ((y : ℝ) * Complex.I)) (expIBall y) := by
  unfold CBall.mem expIBall CBall.c
  have hx : ‖((y : ℝ) : ℂ) * Complex.I‖ ≤ 1 := by
    rw [norm_mul, Complex.norm_I, mul_one, Complex.norm_real, Real.norm_eq_abs]; exact_mod_cast hy
  have hb := Complex.exp_bound hx (n := 30) (by norm_num)
  have hc := (expITay_eq y 30).1
  simp only
  rw [hc]
  refine hb.trans (le_of_eq ?_)
  rw [norm_mul, Complex.norm_I, mul_one, Complex.norm_real, Real.norm_eq_abs]
  simp [expRem]; norm_num

lemma norm_exp_sub_le (a b : ℝ) :
    ‖Complex.exp (a * Complex.I) - Complex.exp (b * Complex.I)‖ ≤ |a - b| := by
  have e : Complex.exp (a * Complex.I) - Complex.exp (b * Complex.I)
      = Complex.exp (b * Complex.I) * (Complex.exp (Complex.I * ((a - b : ℝ) : ℂ)) - 1) := by
    rw [mul_sub, mul_one, ← Complex.exp_add]; congr 2; push_cast; ring
  rw [e, norm_mul, Complex.norm_exp_ofReal_mul_I, one_mul]
  exact Real.norm_exp_I_mul_ofReal_sub_one_le.trans (le_of_eq (Real.norm_eq_abs _))

/-- `3.141592653589793238462643383279 < π` (witness from `tools/gen_cap_tables.py --pi`). -/
theorem pi_gt_d30 : (3141592653589793238462643383279 / 10 ^ 30 : ℝ) < π := by
  pi_lower_bound [
    28284271247461900976033774484193961571393437507538961463533594759814649569242140777007750686552831454700276924618245940498496721117014744253/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    184775906502257351225636637879357657364483325172728497223019546256107001500220471742967986970068919219592605156449576606173835515980840285507/10^140,
    19615705608064608982523644722684780739478674617866721900058321770906130270992101278301299717066015265197897325597551569362621921696763402183/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199036945334439377248967390621895984315094973745971412366722593156978033378917307594505816853929678057544898623659639669228357301997552143783/10^140,
    39951818248206895708590864190364027777728144588184471773712682947424396238086296153247569770655766841646571012051682075797521012193872575447/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199939763739240844023153129933234439370012216251545924928824757585276333750942955008380321105532614652737105114838279191067192440394093045419/10^140,
    99992470183914454092164649119638322435060646880221783024408367300148372138688413347935017415893683760476258567121918203568258492768741095097/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    24999529382065028566424760943214192904347931273608377298503942377020526736914751638612655650675064304212059220800549674127700425106447174001/12500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999058761915234302316025140023979910597526724437530822147397348764660222628670478201924765626081502359608100898958250499998293115075252481/10^140,
    3124996323286568468528205344286018809525837259030515747574570404547224401807718114470126106457468286562163966304642005973954763932373339199/1562500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    49999985293144110958011410886938283855813194967465080069589799594882857473153131217316375422480094358622150839289222002321512699585697295983/25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    799999941172574280915785184565910285558560924551138215251785716457075329534111337685517757529418048123422625229428672583764545625848795713/400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999998161642929380834691540290971450507605124278035337531378905459882972113643867267692531267377067457812810818822917932373565381301351879/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999540410731289097193313960614895889430318945282403075282667857597039153127547683914154738958539536412514571829781407871597660943964543/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    49999999942551341378133665389727705420026870809714106170891456916742309202137360661476185644136108598412403435117090716017348672332301741571/25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999971275670684941397221864177608908945791828525271070970796456493836407915521547951226720186869979105947373482050651816493583399573783/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999992818917670977509588385049026048033310951580195304139122512600237764755035532798542273660176740632017126679077123152226526944332803/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999996409458835456524829556821475927837499255160170955918564875156047509041010190136221262595662861006726997802674603529744734878626311/10^140,
    199999999999102364708862116834599464888302920293062818236198672701566936187717133711822673533054497742581404189426125450856790576161195178473/10^140,
    99999999999887795588607701655175253650384922191052261502746971139092373568521728912645669422783648394836664011847792834727661199106550467331/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999943897794303842958943916890403601900006042775945506812795757022824538530495283413505662297879052729230775706128442458070631595947/10^140,
    99999999999992987224287980123972873675821054314673386485235118221904472364905579499314128096325820658616392759617248329058182125910235981803/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999998246806071995015624773672987531894851520961312173043402400764615125457260584755476281673086091335358576558563610326048445918133/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999561701517998752945665621623895533495576838003351378292028017688612044737084724818208127230387186930762199295942581539882018431/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999780850758999376352766836234074205158789500005299098229476058269843655174349282002096664009570634193997986229590762559644399271/10^140,
    199999999999999945212689749844080687585647401451634731255162397000208102889751506887739032648184377411553489888678224921284155618991778572247/10^140,
    199999999999999986303172437461019702888698655544148127842435015411746270949713737737787768985186065529387441065917323903482058282388824157147/10^140,
    19999999999999999657579310936525489640919258920986399540632300406845423545535189520747089239981045867408052026245699801686172965805651475617/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    19999999999999999914394827734131372227023676763520517622524139125254289659784575805482515940303129441983550408196617813848258152885627872307/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    49999999999999999946496767333832107613263838919899373129909407502263137348137405381677529996620318446203957836795816032566255870100069699963/25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999946496767333832107606107349155574135531952885954839227856470457345328857847469412611908478497972393263314442002622368201743/10^140,
    99999999999999999993312095916729013450539778339311603266543012596898932005212589684749057488454183858577997073818572410553408574904335837043/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    24999999999999999999582005994795563340655241766439238271737768953560390827620251472642352173554591538902715662041662000798190018410995271959/12500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999164011989591126681308736342994608077264945937098911335340258530962832291139491513425553417780868929427512284188639320799/10^140,
    99999999999999999999895501498698890835163537443190455120089037186018329109197622516390249262345516338861943189554855966179042645030267697603/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999999999973875374674722708790880948317371849424191729605644924313426467191523205740721900747155113682515470193804193746922857837/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999986937687337361354395440047598655683387337418912595990611481938376025040140950917901875646226398084655746273675276277911/10^140,
    99999999999999999999998367210917170169299429992619831015382018475929787270790475015102781028858208301171821461071622142853085976628953105509/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999999999999999836721091717016929942998928733077912166880057120186060647422397806267009503585349954797096125540297274227740207427791/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    19999999999999999999999979590136464627116242874855677571500707267271644433223275448191268723791377601310266389914445505518709887054231391793/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    49999999999999999999999987243835290391947651796783171284806955543179856584406550967792589024515981199222880259471834794747350263976051249141/25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999999999999993621917645195973825898391382242730854459231813143895552961851108630267114898022115173003837952437521593825901493657/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999999996810958822597986912949195665696406349315571142178408905759462739934853161362035665436309915687151725126985894709789/10^140,
    199999999999999999999999999202739705649496728237298914835041644959264987770006040685302272113929647825318573682641086022787056772917491775529/10^140,
    99999999999999999999999999900342463206187091029662364304722082420857254790794624231344614963849403729567042291763361109992016599483644775797/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999999999999999975085615801546772757415591073076887905273634405170147878668017200340815425916929339941825598868717688038263430267/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999999999987542807900773386378707795536150489865144232291019010416913827439624839278838564827738318549207812078077758714101/10^140,
    199999999999999999999999999996885701975193346594676948884013375335817771515781873634076817973419488722330107686512096183772143091070014905117/10^140,
    9999999999999999999999999999961071274689916832433461861050091419415008748456733173644236058175634618826184804001734887114277839289745464807/5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    12499999999999999999999999999987834773340599010135456831578147648857603249870030659984001561911521092844405472575795837462118056051061050977/6250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    24999999999999999999999999999993917386670299505067728415789073084465103251932178022894523004992178433521131436744186742389341506685357366543/12500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999999999999999999993917386670299505067728415789072899474178658681468696120153560990030622657818353126423455366624286360834636091/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999999999999999999999999391738667029950506772841578907285322644751036879136442656119998879040227711225355124291530236446721826932931/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999999999999999999999619836666893719066733025986817052604032170205663876968947694358652274559555054022845409243250826870488634289/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999999999999999999999999961983666689371906673302598681705242337697040756748114201959919849032146765669300317827368842390799642376271/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000]

/-- `π < 3.141592653589793238462643383280`. -/
theorem pi_lt_d30 : π < (3141592653589793238462643383280 / 10 ^ 30 : ℝ) := by
  pi_upper_bound [
    8838834764831844055010554526310612991060449221105925457354248362442077990388168992814922089547759829593836538943201856405780225349067107579/6250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    92387953251128675612818318939678828682241662586364248611509773128053500750110235871483993485034459609796302578224788303086917757990420142753/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    196157056080646089825236447226847807394786746178667219000583217709061302709921012783012997170660152651978973255975515693626219216967634021829/10^140,
    199036945334439377248967390621895984315094973745971412366722593156978033378917307594505816853929678057544898623659639669228357301997552143781/10^140,
    99879545620517239271477160475910069444320361470461179434281707368560990595215740383118924426639417104116427530129205189493802530484681438617/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99969881869620422011576564966617219685006108125772962464412378792638166875471477504190160552766307326368552557419139595533596220197046522709/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199984940367828908184329298239276644870121293760443566048816734600296744277376826695870034831787367520952517134243836407136516985537482190193/10^140,
    199996235056520228531398087545713543234783450188867018388031539016164213895318013108901245205400514433696473766404397393021603400851577392007/10^140,
    199999058761915234302316025140023979910597526724437530822147397348764660222628670478201924765626081502359608100898958250499998293115075252479/10^140,
    39999952938068076397161028406861040761930716915590601568954501178204472343138791865217614162655594067995698768699417676466620978334378741747/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    19999994117257644383204564354775313542325277986986032027835919837953142989261252486926550168992037743448860335715688800928605079834278918393/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    24999998161642946278618287017684696423705028892223069226618303639283604047940979302672429922794314003856957038419646018242642050807774866031/12500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999996323285858761669383080581942901015210248556070675062757810919765944227287734535385062534754134915625621637645835864747130762602703757/10^140,
    49999999770205365644548596656980307447944715159472641201537641333928798519576563773841957077369479269768206257285914890703935798830471982271/25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999770205365512534661558910821680107483238856424683565827666969236808549442645904742576544434393649613740468362864069394689329206966283/10^140,
    39999999988510268273976558888745671043563578316731410108428388318582597534563166208619180490688074747991642378949392820260726597433359829513/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999997127567068391003835354019610419213324380632078121655649005040095105902014213119416909464070696252806850671630849260890610777733121/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    19999999999640945883545652482955682147592783749925516017095591856487515604750904101019013622126259566286100672699780267460352974473487862631/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999102364708862116834599464888302920293062818236198672701566936187717133711822673533054497742581404189426125450856790576161195178471/10^140,
    199999999999775591177215403310350507300769844382104523005493942278184747137043457825291338845567296789673328023695585669455322398213100934661/10^140,
    99999999999971948897151921479471958445201800950003021387972753406397878511412269265247641706752831148939526364615387853064221229035315797973/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999997194889715192049589149470328421725869354594094047288761788945962231799725651238530328263446557103846899331623272850364094392721/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999999298722428798006249909469195012757940608384524869217360960305846050182904233902190512669234436534143430623425444130419378367253/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999123403035997505891331243247791066991153676006702756584056035377224089474169449636416254460774373861524398591885163079764036861/10^140,
    19999999999999978085075899937635276683623407420515878950000529909822947605826984365517434928200209666400957063419399798622959076255964439927/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999972606344874922040343792823700725817365627581198500104051444875753443869516324092188705776744944339112460642077809495889286123/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999993151586218730509851444349327772074063921217507705873135474856868868893884492593032764693720532958661951741029141194412078573/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999996575793109365254896409192589209863995406323004068454235455351895207470892399810458674080520262456998016861729658056514756169/10^140,
    199999999999999999143948277341313722270236767635205176225241391252542896597845758054825159403031294419835504081966178138482581528856278723069/10^140,
    199999999999999999785987069335328430453055355679597492519637630009052549392549621526710119986481273784815831347183264130265023480400278799851/10^140,
    99999999999999999973248383666916053803053674577787067765976442977419613928235228672664428923734706305954239248986196631657221001311184100871/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999999999997324838366691605380215911335724641306617205038759572802085035873899622995381673543431198829527428964221363429961734334817/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999996656047958364506725241934131513906173902151628483126620962011781138817388436732311221725296333296006385520147287962175671/10^140,
    99999999999999999999582005994795563340654368171497304038632472968549455667670129265481416145569745756712776708890434464713756142094319660399/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    39999999999999999999958200599479556334065414977276182048035614874407331643679049006556099704938206535544777275821942386471617058012107079041/20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999947750749349445417581761896634743698848383459211289848626852934383046411481443801494310227365030940387608387493845715673/10^140,
    19999999999999999999998693768733736135439544004759865568338733741891259599061148193837602504014095091790187564622639808465574627367527627791/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999996734421834340338598859985239662030764036951859574541580950030205562057716416602343642922143244285706171953257906211017/10^140,
    99999999999999999999999591802729292542324857497321832694780417200142800465151618555994515667523758963374886992740313850743185569350518569477/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999999795901364646271162428748556775715007072672716444332232754481912687237913776013102663899144455055187098870542313917929/10^140,
    99999999999999999999999974487670580783895303593566342569613911086359713168813101935585178049031962398445760518943669589494700527952102498281/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    12499999999999999999999999202739705649496728237298922780341356807403976642986944120231388578783389362252764396625479744054690199228237686707/6250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999999996810958822597986912949195665696406349315571142178408905759462739934853161362035665436309915687151725126985894709787/10^140,
    24999999999999999999999999900342463206187091029662364354380205619908123471250755085662784014241205978164821710330135752848382096614686471941/12500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999999999800684926412374182059324728609444164841714509581589248462689229927698807459134084583526722219984033198967289551593/10^140,
    199999999999999999999999999950171231603093545514831182146153775810547268810340295757336034400681630851833858679883651197737435376076526860533/10^140,
    199999999999999999999999999987542807900773386378707795536150489865144232291019010416913827439624839278838564827738318549207812078077758714099/10^140,
    49999999999999999999999999999221425493798336648669237221003343833954442878945468408519204493354872180582526921628024045943035772767503726279/25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    199999999999999999999999999999221425493798336648669237221001828388300174969134663472884721163512692376523696080034697742285556785794909296139/10^140,
    199999999999999999999999999999805356373449584162167309305250362381721651997920490559744024990584337485510487561212733399393888896816976815631/10^140,
    199999999999999999999999999999951339093362396040541827326312584675720826015457424183156184039937427468169051493953493939114732053482858932343/10^140,
    199999999999999999999999999999987834773340599010135456831578145798948357317362937392240307121980061245315636706252846910733248572721669272181/10^140,
    99999999999999999999999999999998479346667574876266932103947268213306611877592197841106640299997197600569278063387810728825591116804567332327/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    6249999999999999999999999999999976239791680857441670814124176065787752010637853992310559230897415767159972190876427838077703176679405539643/3125000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,
    99999999999999999999999999999999904959166723429766683256496704263105844242601891870285504899799622580366914173250794568422105976999105940677/50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000]

/-- `piLo < π`, 30 digits. -/
def piLo : ℚ := 3141592653589793238462643383279 / 10 ^ 30
/-- `π < piHi`, 30 digits. -/
def piHi : ℚ := 3141592653589793238462643383280 / 10 ^ 30

lemma piLo_lt : (piLo : ℝ) < π := by
  have := pi_gt_d30; unfold piLo; push_cast; exact this
lemma lt_piHi : π < (piHi : ℝ) := by
  have := pi_lt_d30; unfold piHi; push_cast; exact this

/-- A ball containing `e^{2πim/N}` (`m ≤ N`). -/
def unitBall (N m : ℕ) : CBall :=
  let yr : ℚ := 2 * piLo * m / (8 * N)
  let y0 := rdDown yr angP
  let δ := (yr - y0) + 2 * (piHi - piLo) * m / (8 * N)
  let B0 := expIBall y0
  let B := (⟨B0.re, B0.im, rdUp (B0.rad + δ) angP⟩ : CBall)
  let B2 := cround (cmul B B)
  let B4 := cround (cmul B2 B2)
  cround (cmul B4 B4)

lemma mem_unitBall {N m : ℕ} (hN : 0 < N) (hm : m ≤ N) :
    CBall.mem (Complex.exp (((2 * π * m / N : ℝ)) * Complex.I)) (unitBall N m) := by
  have hN' : (0 : ℝ) < N := by exact_mod_cast hN
  have hm' : (m : ℝ) ≤ N := by exact_mod_cast hm
  set yr : ℚ := 2 * piLo * m / (8 * N) with hyr
  set y0 := rdDown yr angP with hy0
  set y : ℝ := 2 * π * m / (8 * N) with hy
  have hlo := piLo_lt; have hhi := lt_piHi
  have hpl : (0 : ℝ) < piLo := by unfold piLo; norm_num
  have hyr0 : (0 : ℝ) ≤ yr := by rw [hyr]; push_cast; positivity
  have hyrle : (yr : ℝ) ≤ 1 := by
    rw [hyr]; push_cast
    rw [div_le_one (by positivity)]
    have : (piLo : ℝ) ≤ 4 := by unfold piLo; norm_num
    nlinarith
  have hy0le : (y0 : ℝ) ≤ yr := by exact_mod_cast rdDown_le yr angP
  have hy00 : (0 : ℚ) ≤ y0 := by
    rw [hy0]; unfold rdDown
    apply div_nonneg _ (by positivity)
    have : (0 : ℚ) ≤ yr * 2 ^ angP := by
      have : (0 : ℚ) ≤ yr := by exact_mod_cast hyr0
      positivity
    exact_mod_cast Int.floor_nonneg.2 this
  have habs : |y0| ≤ 1 := by
    rw [abs_of_nonneg hy00]; exact_mod_cast hy0le.trans hyrle
  have hB0 := mem_expIBall habs
  -- the widened ball contains e^{iy}
  have hdist : |y - y0| ≤ ((yr - y0) + 2 * (piHi - piLo) * m / (8 * N) : ℚ) := by
    push_cast
    have h1 : (yr : ℝ) ≤ y := by
      rw [hyr, hy]; push_cast
      exact div_le_div_of_nonneg_right (by nlinarith [(Nat.cast_nonneg m : (0 : ℝ) ≤ m)]) (by positivity)
    have h2 : y - yr ≤ 2 * (piHi - piLo) * m / (8 * N) := by
      rw [hyr, hy]; push_cast
      rw [← sub_div]
      exact div_le_div_of_nonneg_right (by nlinarith [(Nat.cast_nonneg m : (0 : ℝ) ≤ m)]) (by positivity)
    rw [abs_of_nonneg (by linarith)]
    linarith
  have hB : CBall.mem (Complex.exp (y * Complex.I))
      (⟨(expIBall y0).re, (expIBall y0).im, (expIBall y0).rad + ((yr - y0) + 2 * (piHi - piLo) * m / (8 * N))⟩ : CBall) := by
    unfold CBall.mem at hB0 ⊢
    simp only [CBall.c] at hB0 ⊢
    have e : Complex.exp (y * Complex.I) - ⟨(expIBall y0).re, (expIBall y0).im⟩
        = (Complex.exp (y * Complex.I) - Complex.exp ((y0 : ℝ) * Complex.I))
          + (Complex.exp ((y0 : ℝ) * Complex.I) - ⟨(expIBall y0).re, (expIBall y0).im⟩) := by ring
    rw [e]
    refine (norm_add_le _ _).trans ?_
    have := norm_exp_sub_le y y0
    calc _ ≤ |y - (y0 : ℝ)| + (expIBall y0).rad := add_le_add this hB0
      _ ≤ _ := by push_cast at hdist ⊢; linarith
  have hsq : ∀ (x : ℝ) (B : CBall), CBall.mem (Complex.exp (x * Complex.I)) B →
      CBall.mem (Complex.exp (((2 * x : ℝ)) * Complex.I)) (cround (cmul B B)) := by
    intro x B hx
    have := mem_cround (mem_cmul hx hx)
    rw [← Complex.exp_add] at this
    convert this using 2; push_cast; ring
  have hB' : CBall.mem (Complex.exp (y * Complex.I))
      (⟨(expIBall y0).re, (expIBall y0).im,
        rdUp ((expIBall y0).rad + ((yr - y0) + 2 * (piHi - piLo) * m / (8 * N))) angP⟩ : CBall) :=
    le_trans hB (le_rdUp _ _ |> Rat.cast_le.2)
  have h8 := hsq _ _ (hsq _ _ (hsq _ _ hB'))
  have e8 : (2 * (2 * (2 * y)) : ℝ) = 2 * π * m / N := by rw [hy]; field_simp; ring
  rw [e8] at h8
  exact h8

lemma re_mem {z : ℂ} {B : CBall} (h : CBall.mem z B) : (B.re : ℝ) - B.rad ≤ z.re ∧ z.re ≤ B.re + B.rad := by
  have := (Complex.abs_re_le_norm (z - B.c)).trans h
  simp only [CBall.c, Complex.sub_re] at this
  rw [abs_le] at this; constructor <;> linarith [this.1, this.2]

lemma im_mem {z : ℂ} {B : CBall} (h : CBall.mem z B) : (B.im : ℝ) - B.rad ≤ z.im ∧ z.im ≤ B.im + B.rad := by
  have := (Complex.abs_im_le_norm (z - B.c)).trans h
  simp only [CBall.c, Complex.sub_im] at this
  rw [abs_le] at this; constructor <;> linarith [this.1, this.2]

/-- Interval product. -/
def mulQ (x y : ℚ × ℚ) : ℚ × ℚ :=
  (min (min (x.1 * y.1) (x.1 * y.2)) (min (x.2 * y.1) (x.2 * y.2)),
    max (max (x.1 * y.1) (x.1 * y.2)) (max (x.2 * y.1) (x.2 * y.2)))

lemma mul_bounds {x y a b c d : ℝ} (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y ∧
      x * y ≤ max (max (a * c) (a * d)) (max (b * c) (b * d)) := by
  have h1 : min (a * y) (b * y) ≤ x * y ∧ x * y ≤ max (a * y) (b * y) := by
    rcases le_total 0 y with hy0 | hy0
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_right hx.1 hy0),
        (mul_le_mul_of_nonneg_right hx.2 hy0).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_right hx.2 hy0),
        (mul_le_mul_of_nonpos_right hx.1 hy0).trans (le_max_left _ _)⟩
  have h2 : ∀ e : ℝ, min (e * c) (e * d) ≤ e * y ∧ e * y ≤ max (e * c) (e * d) := by
    intro e
    rcases le_total 0 e with he | he
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hy.1 he),
        (mul_le_mul_of_nonneg_left hy.2 he).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hy.2 he),
        (mul_le_mul_of_nonpos_left hy.1 he).trans (le_max_left _ _)⟩
  exact ⟨(min_le_min (h2 a).1 (h2 b).1).trans h1.1, h1.2.trans (max_le_max (h2 a).2 (h2 b).2)⟩

lemma mulQ_sound {x y : ℝ} {X Y : ℚ × ℚ} (hx : (X.1 : ℝ) ≤ x ∧ x ≤ X.2) (hy : (Y.1 : ℝ) ≤ y ∧ y ≤ Y.2) :
    ((mulQ X Y).1 : ℝ) ≤ x * y ∧ x * y ≤ (mulQ X Y).2 := by
  have := mul_bounds hx hy
  simp only [mulQ]; push_cast; exact this

/-- The angular enclosures from balls `Ba`, `Bb` containing the (shifted) cell ends `e^{2πi(nj mod N)/N}` (see `angEnc`). -/
def angFrom (n : ℕ) (Ba Bb : CBall) : (ℚ × ℚ) × (ℚ × ℚ) :=
  let sg : ℚ := (-1) ^ n
  let dsin : ℚ × ℚ := (Bb.im - Bb.rad - (Ba.im + Ba.rad), Bb.im + Bb.rad - (Ba.im - Ba.rad))
  let dcos : ℚ × ℚ := (Ba.re - Ba.rad - (Bb.re + Bb.rad), Ba.re + Ba.rad - (Bb.re - Bb.rad))
  let f : ℚ × ℚ := (1 / (2 * piHi * n), 1 / (2 * piLo * n))
  let c := mulQ (mulQ (sg, sg) dsin) f
  let s := mulQ (mulQ (sg, sg) dcos) f
  ((rdDown c.1 angP, rdUp c.2 angP), (rdDown s.1 angP, rdUp s.2 angP))

/-- **The angular enclosures** `((1/2π)∫cos(nθ), (1/2π)∫sin(nθ))` over `[θⱼ, θⱼ₊₁]`, `n ≥ 0`. -/
def angEnc (N n j : ℕ) : (ℚ × ℚ) × (ℚ × ℚ) :=
  if n = 0 then ((1 / N, 1 / N), (0, 0)) else
  angFrom n (unitBall N (n * j % N)) (unitBall N (n * (j + 1) % N))

lemma trig_mod {N : ℕ} (hN : 0 < N) (p : ℕ) :
    Real.sin (2 * π * p / N) = Real.sin (2 * π * (p % N : ℕ) / N) ∧
      Real.cos (2 * π * p / N) = Real.cos (2 * π * (p % N : ℕ) / N) := by
  have hN' : (N : ℝ) ≠ 0 := by exact_mod_cast hN.ne'
  have e : 2 * π * (p : ℝ) / N = 2 * π * (p % N : ℕ) / N + (p / N : ℕ) * (2 * π) := by
    have h := Nat.mod_add_div p N
    have h' : (p : ℝ) = (p % N : ℕ) + N * (p / N : ℕ) := by exact_mod_cast h.symm
    rw [h']; field_simp
  rw [e, Real.sin_add_nat_mul_two_pi, Real.cos_add_nat_mul_two_pi]
  exact ⟨rfl, rfl⟩

lemma trig_shift (N : ℕ) (n j : ℕ) :
    Real.sin (n * (-π + 2 * π * j / N)) = (-1) ^ n * Real.sin (2 * π * (n * j : ℕ) / N) ∧
      Real.cos (n * (-π + 2 * π * j / N)) = (-1) ^ n * Real.cos (2 * π * (n * j : ℕ) / N) := by
  have e : (n : ℝ) * (-π + 2 * π * j / N) = 2 * π * (n * j : ℕ) / N - n * π := by push_cast; ring
  rw [e, Real.sin_sub_nat_mul_pi, Real.cos_sub_nat_mul_pi]
  exact ⟨rfl, rfl⟩

/-- **Soundness of the angular enclosures.** -/
theorem angEnc_sound {N : ℕ} (hN : 4 ≤ N) (_hN' : N ≤ 4096) {j : ℕ} (_hj : j < N) {n : ℕ}
    (_hn : n ≤ 12) :
    ((angEnc N n j).1.1 : ℝ) ≤ (1 / (2 * π)) * ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N),
        Real.cos (n * θ) ∧
      (1 / (2 * π)) * ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N), Real.cos (n * θ)
        ≤ (angEnc N n j).1.2 ∧
      ((angEnc N n j).2.1 : ℝ) ≤ (1 / (2 * π)) * ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N),
        Real.sin (n * θ) ∧
      (1 / (2 * π)) * ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N), Real.sin (n * θ)
        ≤ (angEnc N n j).2.2 := by
  have hN0 : 0 < N := by omega
  have hNr : (0 : ℝ) < N := by exact_mod_cast hN0
  have hpi := Real.pi_pos
  unfold angEnc angFrom
  dsimp only
  split_ifs with hn0
  · subst hn0
    simp only [CharP.cast_eq_zero, zero_mul, Real.cos_zero, Real.sin_zero, intervalIntegral.integral_const,
      smul_eq_mul, mul_one, intervalIntegral.integral_zero, mul_zero, Rat.cast_div, Rat.cast_one,
      Rat.cast_natCast, Rat.cast_zero, le_refl, and_true]
    have e : 1 / (2 * π) * (-π + 2 * π * ((j : ℝ) + 1) / N - (-π + 2 * π * j / N)) = 1 / N := by
      field_simp; ring
    rw [e]; exact ⟨le_rfl, le_rfl⟩
  · have hnr : (n : ℝ) ≠ 0 := by exact_mod_cast hn0
    have hnpos : (0 : ℝ) < n := by positivity
    -- the integrals
    have hcos : ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N), Real.cos (n * θ)
        = (Real.sin (n * (-π + 2 * π * (j + 1 : ℕ) / N)) - Real.sin (n * (-π + 2 * π * j / N))) / n := by
      rw [intervalIntegral.integral_comp_mul_left (fun θ => Real.cos θ) hnr, integral_cos]
      push_cast; rw [smul_eq_mul]; field_simp
    have hsin : ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N), Real.sin (n * θ)
        = (Real.cos (n * (-π + 2 * π * j / N)) - Real.cos (n * (-π + 2 * π * (j + 1 : ℕ) / N))) / n := by
      rw [intervalIntegral.integral_comp_mul_left (fun θ => Real.sin θ) hnr, integral_sin]
      push_cast; rw [smul_eq_mul]; field_simp
    obtain ⟨sa, ca⟩ := trig_shift N n j
    obtain ⟨sb, cb⟩ := trig_shift N n (j + 1)
    obtain ⟨sa', ca'⟩ := trig_mod hN0 (n * j)
    obtain ⟨sb', cb'⟩ := trig_mod hN0 (n * (j + 1))
    have hBa := mem_unitBall hN0 (Nat.mod_lt (n * j) hN0).le
    have hBb := mem_unitBall hN0 (Nat.mod_lt (n * (j + 1)) hN0).le
    set Ba := unitBall N (n * j % N)
    set Bb := unitBall N (n * (j + 1) % N)
    have rea := re_mem hBa; have ima := im_mem hBa
    have reb := re_mem hBb; have imb := im_mem hBb
    rw [Complex.exp_ofReal_mul_I_re] at rea reb
    rw [Complex.exp_ofReal_mul_I_im] at ima imb
    have hsg : ((-1 : ℝ) ^ n) * ((-1) ^ n) = 1 := by rw [← mul_pow]; norm_num
    have kA : ∀ x y : ℝ, x = (-1) ^ n * y → (-1) ^ n * x = y := fun x y h => by
      rw [h, ← mul_assoc, hsg, one_mul]
    rw [← sa', ← kA _ _ sa] at ima
    rw [← ca', ← kA _ _ ca] at rea
    rw [← sb', ← kA _ _ sb] at imb
    rw [← cb', ← kA _ _ cb] at reb
    have hf : ((1 / (2 * piHi * n) : ℚ) : ℝ) ≤ 1 / (2 * π * n) ∧ 1 / (2 * π * n) ≤ ((1 / (2 * piLo * n) : ℚ) : ℝ) := by
      have h1 := piLo_lt; have h2 := lt_piHi
      have hpl : (0 : ℝ) < piLo := by unfold piLo; norm_num
      push_cast
      constructor
      · exact one_div_le_one_div_of_le (by positivity) (by nlinarith)
      · exact one_div_le_one_div_of_le (by positivity) (by nlinarith)
    have hsgI : (((-1 : ℚ) ^ n : ℚ) : ℝ) ≤ (-1 : ℝ) ^ n ∧ (-1 : ℝ) ^ n ≤ (((-1 : ℚ) ^ n : ℚ) : ℝ) := by
      push_cast; exact ⟨le_rfl, le_rfl⟩
    -- cos moment
    have hC : (1 / (2 * π)) * ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N), Real.cos (n * θ)
        = ((-1) ^ n * ((-1) ^ n * Real.sin (n * (-π + 2 * π * (j + 1 : ℕ) / N))
            - (-1) ^ n * Real.sin (n * (-π + 2 * π * j / N)))) * (1 / (2 * π * n)) := by
      rw [hcos]
      have : (-1 : ℝ) ^ n * ((-1) ^ n * Real.sin (n * (-π + 2 * π * (j + 1 : ℕ) / N))
            - (-1) ^ n * Real.sin (n * (-π + 2 * π * j / N)))
          = Real.sin (n * (-π + 2 * π * (j + 1 : ℕ) / N)) - Real.sin (n * (-π + 2 * π * j / N)) := by
        rw [← mul_sub, ← mul_assoc, hsg, one_mul]
      rw [this]; field_simp
    have hS : (1 / (2 * π)) * ∫ θ in (-π + 2 * π * j / N)..(-π + 2 * π * (j + 1) / N), Real.sin (n * θ)
        = ((-1) ^ n * ((-1) ^ n * Real.cos (n * (-π + 2 * π * j / N))
            - (-1) ^ n * Real.cos (n * (-π + 2 * π * (j + 1 : ℕ) / N)))) * (1 / (2 * π * n)) := by
      rw [hsin]
      have : (-1 : ℝ) ^ n * ((-1) ^ n * Real.cos (n * (-π + 2 * π * j / N))
            - (-1) ^ n * Real.cos (n * (-π + 2 * π * (j + 1 : ℕ) / N)))
          = Real.cos (n * (-π + 2 * π * j / N)) - Real.cos (n * (-π + 2 * π * (j + 1 : ℕ) / N)) := by
        rw [← mul_sub, ← mul_assoc, hsg, one_mul]
      rw [this]; field_simp
    rw [hC, hS]
    have dS : ((Bb.im - Bb.rad - (Ba.im + Ba.rad) : ℚ) : ℝ) ≤ (-1) ^ n * Real.sin (n * (-π + 2 * π * (j + 1 : ℕ) / N))
            - (-1) ^ n * Real.sin (n * (-π + 2 * π * j / N)) ∧
          (-1) ^ n * Real.sin (n * (-π + 2 * π * (j + 1 : ℕ) / N)) - (-1) ^ n * Real.sin (n * (-π + 2 * π * j / N))
            ≤ ((Bb.im + Bb.rad - (Ba.im - Ba.rad) : ℚ) : ℝ) := by
      simp only [Rat.cast_sub, Rat.cast_add]; constructor <;> linarith [ima.1, ima.2, imb.1, imb.2]
    have dC : ((Ba.re - Ba.rad - (Bb.re + Bb.rad) : ℚ) : ℝ) ≤ (-1) ^ n * Real.cos (n * (-π + 2 * π * j / N))
            - (-1) ^ n * Real.cos (n * (-π + 2 * π * (j + 1 : ℕ) / N)) ∧
          (-1) ^ n * Real.cos (n * (-π + 2 * π * j / N)) - (-1) ^ n * Real.cos (n * (-π + 2 * π * (j + 1 : ℕ) / N))
            ≤ ((Ba.re + Ba.rad - (Bb.re - Bb.rad) : ℚ) : ℝ) := by
      simp only [Rat.cast_sub, Rat.cast_add]; constructor <;> linarith [rea.1, rea.2, reb.1, reb.2]
    have kC := mulQ_sound (Y := (1 / (2 * piHi * n), 1 / (2 * piLo * n)))
      (mulQ_sound (X := ((-1) ^ n, (-1) ^ n))
        (Y := (Bb.im - Bb.rad - (Ba.im + Ba.rad), Bb.im + Bb.rad - (Ba.im - Ba.rad))) hsgI dS) hf
    have kS := mulQ_sound (Y := (1 / (2 * piHi * n), 1 / (2 * piLo * n)))
      (mulQ_sound (X := ((-1) ^ n, (-1) ^ n))
        (Y := (Ba.re - Ba.rad - (Bb.re + Bb.rad), Ba.re + Ba.rad - (Bb.re - Bb.rad))) hsgI dC) hf
    exact ⟨rdDown_le_real angP kC.1, le_rdUp_real angP kC.2, rdDown_le_real angP kS.1,
      le_rdUp_real angP kS.2⟩
/-! ### The shared ball table -/

/-- The balls of `e^{2πim/N}`, `m < N` (shared by all `n`, `j`). -/
def unitTable (N : ℕ) : Array CBall := ((List.range N).map (unitBall N)).toArray

/-- `angEnc` from a precomputed ball table. -/
def angEncWith (T : Array CBall) (N n j : ℕ) : (ℚ × ℚ) × (ℚ × ℚ) :=
  if n = 0 then ((1 / N, 1 / N), (0, 0)) else
  angFrom n (T.getD (n * j % N) ⟨0, 0, 0⟩) (T.getD (n * (j + 1) % N) ⟨0, 0, 0⟩)

lemma unitTable_getD {N k : ℕ} (hk : k < N) : (unitTable N).getD k ⟨0, 0, 0⟩ = unitBall N k := by
  simp [unitTable, Array.getD, hk]

lemma angEncWith_unitTable {N : ℕ} (hN : 0 < N) (n j : ℕ) :
    angEncWith (unitTable N) N n j = angEnc N n j := by
  unfold angEncWith angEnc
  rw [unitTable_getD (Nat.mod_lt _ hN), unitTable_getD (Nat.mod_lt _ hN)]

end CapTab

/-! ### The interface on the grid of `CapGrid` -/

end Grothe.LowerAnalytic

namespace GrotheKernel

open Grothe.LowerAnalytic

/-- **The enclosure of `radI a b m = ∫_a^b 2 r^{m+1} e^{−r²} dr`** (`radEnc_sound`). -/
def radEnc (a b : ℚ) (m : ℕ) : ℚ × ℚ := CapTab.radEnc a b m

/-- **The enclosure of `tailI R m = ∫_R^∞ 2 r^{m+1} e^{−r²} dr`** (`tailEnc_sound`). -/
def tailEnc (R : ℚ) (m : ℕ) : ℚ × ℚ := CapTab.tailEnc R m

/-- The sign change of the sine part for `n < 0`. -/
def angSign (n : ℤ) (e : (ℚ × ℚ) × (ℚ × ℚ)) : (ℚ × ℚ) × (ℚ × ℚ) :=
  if 0 ≤ n then e else (e.1, (-e.2.2, -e.2.1))

/-- **The enclosures of `(angC, angS)` on the `j`-th angular cell `[thN N j, thN N (j+1)]`**
(`angEnc_sound`). -/
def angEnc (N j : ℕ) (n : ℤ) : (ℚ × ℚ) × (ℚ × ℚ) := angSign n (CapTab.angEnc N n.natAbs j)

/-- `angEnc` from the shared ball table `CapTab.unitTable N` (`angEncWith_unitTable`). -/
def angEncWith (T : Array CapTab.CBall) (N j : ℕ) (n : ℤ) : (ℚ × ℚ) × (ℚ × ℚ) :=
  angSign n (CapTab.angEncWith T N n.natAbs j)

lemma angEncWith_unitTable {N : ℕ} (hN : 0 < N) (j : ℕ) (n : ℤ) :
    angEncWith (CapTab.unitTable N) N j n = angEnc N j n := by
  unfold angEncWith angEnc; rw [CapTab.angEncWith_unitTable hN]

end GrotheKernel

namespace Grothe.LowerAnalytic

open GrotheKernel (radEnc tailEnc angEnc angSign)

/-- **Soundness of the radial enclosures.** -/
theorem radEnc_sound {a b : ℚ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 8) {m : ℕ} (hm : m ≤ 16) :
    ((radEnc a b m).1 : ℝ) ≤ radI a b m ∧ radI a b m ≤ (radEnc a b m).2 :=
  CapTab.radEnc_sound ha hab hb m hm

/-- **Soundness of the tail enclosures.** -/
theorem tailEnc_sound {R : ℚ} (hR : 1 ≤ R) (hR8 : R ≤ 16) {m : ℕ} (hm : m ≤ 16) :
    ((tailEnc R m).1 : ℝ) ≤ tailI R m ∧ tailI R m ≤ (tailEnc R m).2 :=
  CapTab.tailEnc_sound hR hR8 m hm

/-- **Soundness of the angular enclosures.** -/
theorem angEnc_sound {N j : ℕ} (hN : 4 ≤ N) (hN' : N ≤ 4096) (hj : j < N) {n : ℤ} (hn : |n| ≤ 12) :
    ((angEnc N j n).1.1 : ℝ) ≤ angC (thN N j) (thN N (j + 1)) n ∧
      angC (thN N j) (thN N (j + 1)) n ≤ (angEnc N j n).1.2 ∧
      ((angEnc N j n).2.1 : ℝ) ≤ angS (thN N j) (thN N (j + 1)) n ∧
      angS (thN N j) (thN N (j + 1)) n ≤ (angEnc N j n).2.2 := by
  have hk : n.natAbs ≤ 12 := by
    have : ((n.natAbs : ℕ) : ℤ) ≤ 12 := by rw [Int.natCast_natAbs]; exact hn
    omega
  have base := CapTab.angEnc_sound hN hN' hj hk
  have e1 : thN N (j + 1) = -π + 2 * π * ((j : ℝ) + 1) / N := by simp only [thN]; push_cast; ring
  have e0 : thN N j = -π + 2 * π * j / N := rfl
  simp only [angC, angS, e0, e1, angEnc, angSign]
  split_ifs with h0
  · have hc : ((n : ℤ) : ℝ) = ((n.natAbs : ℕ) : ℝ) := by
      rw [← Int.cast_natCast, Int.natCast_natAbs, abs_of_nonneg h0]
    simp only [hc]; exact base
  · have hc : ((n : ℤ) : ℝ) = -((n.natAbs : ℕ) : ℝ) := by
      rw [← Int.cast_natCast, Int.natCast_natAbs, abs_of_neg (not_le.1 h0)]; push_cast; ring
    simp only [hc, neg_mul, Real.cos_neg, Real.sin_neg, intervalIntegral.integral_neg, mul_neg]
    obtain ⟨b1, b2, b3, b4⟩ := base
    refine ⟨b1, b2, ?_, ?_⟩ <;> push_cast <;> linarith

/-! ### The batch checker -/

namespace CapTab

/-- A table entry: which integral. -/
inductive TKind
  /-- `radI a b m`. -/
  | rad (a b : ℚ) (m : ℕ)
  /-- `tailI R m`. -/
  | tail (R : ℚ) (m : ℕ)
  /-- `angC (thN N j) (thN N (j+1)) n`. -/
  | cos (N j : ℕ) (n : ℤ)
  /-- `angS (thN N j) (thN N (j+1)) n`. -/
  | sin (N j : ℕ) (n : ℤ)
  deriving Inhabited

/-- A table entry: the integral and its claimed enclosure `[lo, hi]`. -/
structure TEntry where
  kind : TKind
  lo : ℚ
  hi : ℚ
  deriving Inhabited

/-- The value of an entry. -/
noncomputable def TKind.value : TKind → ℝ
  | .rad a b m => radI a b m
  | .tail R m => tailI R m
  | .cos N j n => angC (thN N j) (thN N (j + 1)) n
  | .sin N j n => angS (thN N j) (thN N (j + 1)) n

/-- The checker state: the radial list of the last ring and the ball table of the last `N`. -/
structure TCache where
  ra : ℚ
  rb : ℚ
  rl : List (ℚ × ℚ)
  aN : ℕ
  tab : Array CBall

/-- The cache invariant. -/
def TCache.Good (c : TCache) : Prop := c.rl = radEncList c.ra c.rb ∧ c.tab = unitTable c.aN

/-- The initial cache. -/
def TCache.init : TCache := ⟨0, 0, radEncList 0 0, 0, unitTable 0⟩

lemma TCache.good_init : TCache.init.Good := ⟨rfl, rfl⟩

/-- Switch to the ring `[a, b]`. -/
def TCache.forRad (c : TCache) (a b : ℚ) : TCache :=
  if c.ra = a ∧ c.rb = b then c else { c with ra := a, rb := b, rl := radEncList a b }

/-- Switch to `N` angular cells. -/
def TCache.forAng (c : TCache) (N : ℕ) : TCache :=
  if c.aN = N then c else { c with aN := N, tab := unitTable N }

lemma TCache.forRad_good {c : TCache} (hc : c.Good) (a b : ℚ) :
    (c.forRad a b).Good ∧ (c.forRad a b).rl = radEncList a b := by
  unfold forRad; split_ifs with h
  · obtain ⟨h1, h2⟩ := h; subst h1 h2; exact ⟨hc, hc.1⟩
  · exact ⟨⟨rfl, hc.2⟩, rfl⟩

lemma TCache.forAng_good {c : TCache} (hc : c.Good) (N : ℕ) :
    (c.forAng N).Good ∧ (c.forAng N).tab = unitTable N := by
  unfold forAng; split_ifs with h
  · subst h; exact ⟨hc, hc.2⟩
  · exact ⟨⟨hc.1, rfl⟩, rfl⟩

/-- `lo ≤ p.1 ∧ p.2 ≤ hi`. -/
def inside (p : ℚ × ℚ) (lo hi : ℚ) : Bool := decide (lo ≤ p.1) && decide (p.2 ≤ hi)

/-- The admissible angular parameters. -/
def angOK (N j : ℕ) (n : ℤ) : Bool :=
  decide (4 ≤ N) && decide (N ≤ 4096) && decide (j < N) && decide (n.natAbs ≤ 12)

/-- One entry: the new cache and the verdict. -/
def step (c : TCache) (e : TEntry) : TCache × Bool :=
  match e.kind with
  | .rad a b m =>
    let c' := c.forRad a b
    (c', decide (0 ≤ a) && decide (a ≤ b) && decide (b ≤ 8) && decide (m ≤ 16) &&
      inside (c'.rl.getD m (0, 0)) e.lo e.hi)
  | .tail R m =>
    (c, decide (1 ≤ R) && decide (R ≤ 16) && decide (m ≤ 16) && inside (tailEnc R m) e.lo e.hi)
  | .cos N j n =>
    let c' := c.forAng N
    (c', angOK N j n && inside (GrotheKernel.angEncWith c'.tab N j n).1 e.lo e.hi)
  | .sin N j n =>
    let c' := c.forAng N
    (c', angOK N j n && inside (GrotheKernel.angEncWith c'.tab N j n).2 e.lo e.hi)

/-- The checker loop. -/
def tablesGo : TCache → List TEntry → Bool
  | _, [] => true
  | c, e :: l => let r := step c e; r.2 && tablesGo r.1 l

/-- **The batch checker.** -/
def tablesOK (l : List TEntry) : Bool := tablesGo TCache.init l

lemma inside_sound {p : ℚ × ℚ} {lo hi : ℚ} {x : ℝ} (h : inside p lo hi = true)
    (hp : (p.1 : ℝ) ≤ x ∧ x ≤ p.2) : (lo : ℝ) ≤ x ∧ x ≤ hi := by
  simp only [inside, Bool.and_eq_true, decide_eq_true_eq] at h
  exact ⟨(Rat.cast_le.2 h.1).trans hp.1, hp.2.trans (Rat.cast_le.2 h.2)⟩

lemma step_sound {c : TCache} (hc : c.Good) (e : TEntry) :
    (step c e).1.Good ∧ ((step c e).2 = true → (e.lo : ℝ) ≤ e.kind.value ∧ e.kind.value ≤ e.hi) := by
  obtain ⟨k, lo, hi⟩ := e
  cases k with
  | rad a b m =>
    obtain ⟨g, hl⟩ := c.forRad_good hc a b
    refine ⟨g, fun h => ?_⟩
    simp only [step, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨ha, hab⟩, hb⟩, hm⟩, hin⟩ := h
    rw [hl] at hin
    exact inside_sound hin (Grothe.LowerAnalytic.radEnc_sound ha hab hb hm)
  | tail R m =>
    refine ⟨hc, fun h => ?_⟩
    simp only [step, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨h1, h2⟩, hm⟩, hin⟩ := h
    exact inside_sound hin (Grothe.LowerAnalytic.tailEnc_sound h1 h2 hm)
  | cos N j n =>
    obtain ⟨g, ht⟩ := c.forAng_good hc N
    refine ⟨g, fun h => ?_⟩
    simp only [step, angOK, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, hin⟩ := h
    rw [ht, GrotheKernel.angEncWith_unitTable (by omega)] at hin
    have hn : |n| ≤ 12 := by rw [← Int.natCast_natAbs]; exact_mod_cast h4
    have := Grothe.LowerAnalytic.angEnc_sound h1 h2 h3 hn
    exact inside_sound hin ⟨this.1, this.2.1⟩
  | sin N j n =>
    obtain ⟨g, ht⟩ := c.forAng_good hc N
    refine ⟨g, fun h => ?_⟩
    simp only [step, angOK, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, hin⟩ := h
    rw [ht, GrotheKernel.angEncWith_unitTable (by omega)] at hin
    have hn : |n| ≤ 12 := by rw [← Int.natCast_natAbs]; exact_mod_cast h4
    have := Grothe.LowerAnalytic.angEnc_sound h1 h2 h3 hn
    exact inside_sound hin ⟨this.2.2.1, this.2.2.2⟩

lemma tablesGo_sound : ∀ (l : List TEntry) {c : TCache}, c.Good → tablesGo c l = true →
    ∀ e ∈ l, (e.lo : ℝ) ≤ e.kind.value ∧ e.kind.value ≤ e.hi
  | [], _, _, _ => by simp
  | e :: l, c, hc, h => by
    simp only [tablesGo, Bool.and_eq_true] at h
    obtain ⟨g, s⟩ := step_sound hc e
    intro x hx
    rcases List.mem_cons.1 hx with rfl | hx
    · exact s h.1
    · exact tablesGo_sound l g h.2 x hx

/-- **Soundness of the batch checker.** -/
theorem tablesOK_sound {l : List TEntry} (h : tablesOK l = true) :
    ∀ e ∈ l, (e.lo : ℝ) ≤ e.kind.value ∧ e.kind.value ≤ e.hi :=
  tablesGo_sound l TCache.good_init h

/-! ### Reading entries from a string (the format of `tools/gen_cap_tables.py`) -/

/-- A rational `p` or `p/q`. -/
def parseQ (s : String) : Option ℚ :=
  match s.splitOn "/" with
  | [p] => p.toInt?.map fun x => (x : ℚ)
  | [p, q] => do
    let a ← p.toInt?
    let b ← q.toNat?
    if b = 0 then none else some ((a : ℚ) / b)
  | _ => none

/-- One line `r a b m lo hi`, `t R m lo hi`, `c N j n lo hi` or `s N j n lo hi`. -/
def parseLine (l : String) : Option TEntry :=
  match (l.splitOn " ").filter (· ≠ "") with
  | ["r", a, b, m, lo, hi] => do
    pure ⟨.rad (← parseQ a) (← parseQ b) (← m.toNat?), ← parseQ lo, ← parseQ hi⟩
  | ["t", R, m, lo, hi] => do pure ⟨.tail (← parseQ R) (← m.toNat?), ← parseQ lo, ← parseQ hi⟩
  | ["c", N, j, n, lo, hi] => do
    pure ⟨.cos (← N.toNat?) (← j.toNat?) (← n.toInt?), ← parseQ lo, ← parseQ hi⟩
  | ["s", N, j, n, lo, hi] => do
    pure ⟨.sin (← N.toNat?) (← j.toNat?) (← n.toInt?), ← parseQ lo, ← parseQ hi⟩
  | _ => none

/-- The entries of a table string (lines that do not parse are skipped; soundness of
`tablesOK_sound` is about whatever list results). -/
def parseEntries (s : String) : List TEntry := (s.splitOn "\n").filterMap parseLine

/-! ### Unit tests (entries from `python3 tools/gen_cap_tables.py --h 1/8 --Nr 8 --N 8 --nmax 3 --bits 64`) -/

/-- A few entries of the `h = 1/8`, `N = 8` grid. -/
def testTable : String := "
r 0 1/8 0 71497564697966299/4611686018427387904 285990258791865197/18446744073709551616
r 0 1/8 16 7/1152921504606846976 113/18446744073709551616
r 7/8 1 3 1478446387025765671/18446744073709551616 184805798378220709/2305843009213693952
t 1 0 3393088950634442637/9223372036854775808 6786177901268885275/18446744073709551616
t 1 16 371885942078485547497839/9223372036854775808 743771884156971094995679/18446744073709551616
c 8 3 -3 691996027897296309/18446744073709551616 345998013948648155/9223372036854775808
c 8 3 0 1/8 1/8
s 8 5 -1 -64874627615371529/576460752303423488 -2075988083691888927/18446744073709551616
s 8 5 2 1467945251641000613/18446744073709551616 733972625820500307/9223372036854775808
"

example : (parseEntries testTable).length = 9 := by native_decide

example : tablesOK (parseEntries testTable) = true := by native_decide

/-- A wrong claim is rejected. -/
example : tablesOK [⟨.rad 0 (1 / 8) 0, 1 / 64, 1 / 32⟩] = false := by native_decide

/-- An entry as a real inequality. -/
example : ((71497564697966299 / 4611686018427387904 : ℚ) : ℝ) ≤ radI 0 (1 / 8) 0 ∧
    radI 0 (1 / 8) 0 ≤ ((285990258791865197 / 18446744073709551616 : ℚ) : ℝ) := by
  have h : tablesOK [⟨.rad 0 (1 / 8) 0, 71497564697966299 / 4611686018427387904,
      285990258791865197 / 18446744073709551616⟩] = true := by native_decide
  have := tablesOK_sound h _ List.mem_cons_self
  simpa [TKind.value] using this

/-- The `n = 0` angular entries are exact and checked by the kernel. -/
example : tablesOK [⟨.cos 8 3 0, 1 / 8, 1 / 8⟩, ⟨.sin 8 3 0, 0, 0⟩] = true := by decide +kernel

end CapTab

end Grothe.LowerAnalytic
