import Grothe.UpperQuad.IntervalSound
import Grothe.UpperChaos.HermiteFallingFactorial
import Grothe.UpperChaos.HermiteBasis

set_option warningAsError true

-- Section: Moments

set_option warningAsError true

-- Section: MomentTaylor

/-!
# Elementary rational Taylor integration

Agent-ID: codex-a7c4.

These reusable list-polynomial, dyadic-rounding and centered-integral proofs are adapted
verbatim from `LowerAnalytic.CapTables` and its data module. Keeping the small analytic
core here avoids importing the lower-bound certificate graph into the upper replacement.
The precision and degree restrictions of the old table wrapper are not part of this core.
-/

open Real MeasureTheory Set Finset

namespace Grothe.UpperReplacement.MomentTaylor

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

/-- `∫_α^β t^d p(t) dt`. -/
def pint : List ℚ → ℕ → ℚ → ℚ → ℚ
  | [], _, _, _ => 0
  | a :: p, d, α, β => a * (β ^ (d + 1) - α ^ (d + 1)) / (d + 1) + pint p (d + 1) α β

/-- `(Σ_{m<n} u^m/m!, u^n/n!)` as polynomials. -/
def expPoly (u : List ℚ) : ℕ → List ℚ × List ℚ
  | 0 => ([], [1])
  | n + 1 => let r := expPoly u n; (padd r.1 r.2, psmul (1 / (n + 1 : ℚ)) (pmul r.2 u))

/-- Round down to the grid `2^{-P}`. -/
def rdDown (q : ℚ) (P : ℕ) : ℚ := (⌊q * 2 ^ P⌋ : ℚ) / 2 ^ P

/-- Round up to the grid `2^{-P}`. -/
def rdUp (q : ℚ) (P : ℕ) : ℚ := (⌈q * 2 ^ P⌉ : ℚ) / 2 ^ P

/-- `(Σ_{m<n} x^m/m!, x^n/n!)`. -/
def expTay (x : ℚ) : ℕ → ℚ × ℚ
  | 0 => (0, 1)
  | n + 1 => let r := expTay x n; (r.1 + r.2, r.2 * x / (n + 1))

/-- The remainder `|x|^n (n+1)/(n! n)` of `Real.exp_bound`. -/
def expRem (y : ℚ) (n : ℕ) : ℚ := y ^ n * ((n + 1 : ℚ) / (n.factorial * n))

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

/-! ### `e^{−x}` -/

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

lemma lsum_range (n : ℕ) (f : ℕ → ℚ) : ((List.range n).map f).sum = ∑ p ∈ range n, f p := by
  induction n with
  | zero => simp
  | succ n ih => rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ, ih]; simp

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
      have h4 : 2 * c * |t| ≤ 2 * c * h := mul_le_mul_of_nonneg_left h1 (by positivity)
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
      exact_mod_cast integral_pev (-h) h S p
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

end Grothe.UpperReplacement.MomentTaylor

-- Section: CellMoments

/-!
# Gaussian cell moments at arbitrary degree and precision

Agent-ID: codex-a7c4.

The previous cap-table evaluator covers radial degrees at most 16. The response-pair certificate
needs moments through degree 501. We reuse its analytic Taylor and integration theorems, while
making the arithmetic precision and Taylor length explicit and removing the degree restriction.
All exported interval endpoints are computed using rational arithmetic.
-/

namespace Grothe.UpperReplacement.CellMoments

open Real MeasureTheory Finset
open Grothe.UpperReplacement.MomentTaylor

/-- Repeated squaring with outward rounding to `2⁻ᴾ`. -/
def squareEnclosure (P : ℕ) : ℕ → ℚ × ℚ → ℚ × ℚ
  | 0, e => e
  | k + 1, e =>
    let f := squareEnclosure P k e
    (rdDown (f.1 ^ 2) P, rdUp (f.2 ^ 2) P)

theorem squareEnclosure_sound (P : ℕ) (y : ℝ) :
    ∀ (k : ℕ) (e : ℚ × ℚ), 0 ≤ e.1 → (e.1 : ℝ) ≤ exp (-y) →
      exp (-y) ≤ e.2 →
      0 ≤ (squareEnclosure P k e).1 ∧
      ((squareEnclosure P k e).1 : ℝ) ≤ exp (-(y * 2 ^ k)) ∧
      exp (-(y * 2 ^ k)) ≤ (squareEnclosure P k e).2
  | 0, e, h0, h1, h2 => by simpa [squareEnclosure] using ⟨h0, h1, h2⟩
  | k + 1, e, h0, h1, h2 => by
    obtain ⟨g0, g1, g2⟩ := squareEnclosure_sound P y k e h0 h1 h2
    have he : exp (-(y * 2 ^ (k + 1))) = exp (-(y * 2 ^ k)) ^ 2 := by
      rw [← Real.exp_nat_mul]
      congr 1
      push_cast
      ring
    simp only [squareEnclosure]
    refine ⟨?_, ?_, ?_⟩
    · unfold rdDown
      positivity
    · rw [he]
      refine rdDown_le_real P ?_
      push_cast
      exact pow_le_pow_left₀ (by exact_mod_cast g0) g1 2
    · rw [he]
      refine le_rdUp_real P ?_
      push_cast
      exact pow_le_pow_left₀ (exp_pos _).le g2 2

/-- `exp(-x)` on `[0,1024]`, using `n` Taylor terms and ten squarings. -/
def expNegEnclosure (P n : ℕ) (x : ℚ) : ℚ × ℚ :=
  let y := x / 2 ^ 10
  let T := (expTay (-y) n).1
  let E := expRem y n
  squareEnclosure P 10 (max 0 (rdDown (T - E) P), rdUp (T + E) P)

theorem expNegEnclosure_sound (P : ℕ) {n : ℕ} (hn : 0 < n)
    {x : ℚ} (hx0 : 0 ≤ x) (hx1 : x ≤ 1024) :
    ((expNegEnclosure P n x).1 : ℝ) ≤ exp (-(x : ℝ)) ∧
      exp (-(x : ℝ)) ≤ (expNegEnclosure P n x).2 ∧
      0 ≤ (expNegEnclosure P n x).1 := by
  let y : ℚ := x / 2 ^ 10
  have hy0 : (0 : ℝ) ≤ y := by dsimp [y]; positivity
  have hy1 : |(-(y : ℝ))| ≤ 1 := by
    rw [abs_neg, abs_of_nonneg hy0]
    dsimp [y]
    push_cast
    have : (x : ℝ) ≤ 1024 := by exact_mod_cast hx1
    linarith
  have hb := Real.exp_bound hy1 hn
  obtain ⟨hT, _⟩ := expTay_eq (-y) n
  have hb' : |exp (-(y : ℝ)) - ((expTay (-y) n).1 : ℝ)| ≤ (expRem y n : ℝ) := by
    rw [hT]
    push_cast
    simpa [expRem, abs_neg, abs_of_nonneg hy0] using hb
  have hlo : (((expTay (-y) n).1 - expRem y n : ℚ) : ℝ) ≤ exp (-(y : ℝ)) := by
    push_cast
    linarith [(abs_le.mp hb').1]
  have hhi : exp (-(y : ℝ)) ≤ (((expTay (-y) n).1 + expRem y n : ℚ) : ℝ) := by
    push_cast
    linarith [(abs_le.mp hb').2]
  have hs := squareEnclosure_sound P (y : ℝ) 10
    (max 0 (rdDown ((expTay (-y) n).1 - expRem y n) P),
      rdUp ((expTay (-y) n).1 + expRem y n) P) (le_max_left _ _)
    (by
      simp only
      rcases le_total (0 : ℚ) (rdDown ((expTay (-y) n).1 - expRem y n) P) with h | h
      · rw [max_eq_right h]
        exact rdDown_le_real P hlo
      · rw [max_eq_left h]
        push_cast
        exact (exp_pos _).le)
    (le_rdUp_real P hhi)
  have hx : (y : ℝ) * 2 ^ 10 = x := by dsimp [y]; push_cast; ring
  rw [hx] at hs
  exact ⟨hs.2.1, hs.2.2, hs.1⟩

/-- Integral of the centered Taylor polynomial times `2r^(k+1)`. -/
def radialBase (a b : ℚ) (n k : ℕ) : ℚ :=
  let c := (a + b) / 2
  let h := (b - a) / 2
  let S := (expPoly [0, -2 * c, -1] n).1
  2 * ((List.range (k + 2)).map fun p ↦
    ((k + 1).choose p : ℚ) * c ^ (k + 1 - p) * pint S p (-h) h).sum

def radialError (a b : ℚ) (n k : ℕ) : ℚ :=
  let c := (a + b) / 2
  let h := (b - a) / 2
  expRem (2 * c * h + h ^ 2) n *
    (2 * (b ^ (k + 2) - a ^ (k + 2)) / (k + 2))

/-- Rational enclosure of `∫ₐᵇ 2r^(k+1) exp(-r²) dr`, with no degree limit. -/
def radialEnclosure (P n : ℕ) (a b : ℚ) (k : ℕ) : ℚ × ℚ :=
  let X := expNegEnclosure P n (((a + b) / 2) ^ 2)
  let lo := radialBase a b n k - radialError a b n k
  let hi := radialBase a b n k + radialError a b n k
  (rdDown (if 0 ≤ lo then X.1 * lo else X.2 * lo) P,
    rdUp (if 0 ≤ hi then X.2 * hi else X.1 * hi) P)

/-- Soundness at every natural degree. The cell-width condition is exact rational arithmetic;
there is no assumed numerical quadrature accuracy. -/
theorem radialEnclosure_sound (P : ℕ) {n : ℕ} (hn : 0 < n)
    {a b : ℚ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 8)
    (hwidth : 2 * ((a + b) / 2) * ((b - a) / 2) + ((b - a) / 2) ^ 2 ≤ 1)
    (k : ℕ) :
    ((radialEnclosure P n a b k).1 : ℝ) ≤
      ∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * exp (-r ^ 2) ∧
    (∫ r in (a : ℝ)..b, 2 * r ^ (k + 1) * exp (-r ^ 2)) ≤
      (radialEnclosure P n a b k).2 := by
  let c : ℚ := (a + b) / 2
  let h : ℚ := (b - a) / 2
  let U : ℚ := 2 * c * h + h ^ 2
  let S := (expPoly [0, -2 * c, -1] n).1
  have hX := expNegEnclosure_sound P hn (x := c ^ 2) (sq_nonneg c) (by
    have hc0 : 0 ≤ c := by dsimp [c]; linarith
    have hc8 : c ≤ 8 := by dsimp [c]; linarith
    nlinarith)
  push_cast at hX
  have hcore := rad_core (a := (a : ℝ)) (b := b) (c := c) (h := h) (U := U)
    (E := expRem U n) k n hn (by exact_mod_cast ha) (by exact_mod_cast hab)
    (by dsimp [c]; push_cast; ring) (by dsimp [h]; push_cast; ring)
    (by dsimp [U]; push_cast; rfl) (by exact_mod_cast hwidth)
    (by simp [expRem]) (pev S) (continuous_pev S) (fun t ↦ by
      rw [(pev_expPoly _ t n).1, pev_u])
  have hm := rad_integral a b c h (expRem U n)
    (by dsimp [c, h]; ring) (by dsimp [c, h]; ring) S k (-1)
  have hp := rad_integral a b c h (expRem U n)
    (by dsimp [c, h]; ring) (by dsimp [c, h]; ring) S k 1
  have hl : (∫ t in (-(h : ℝ))..h,
      2 * ((c : ℝ) + t) ^ (k + 1) * (pev S t - (expRem U n : ℝ))) =
      ((radialBase a b n k - radialError a b n k : ℚ) : ℝ) := by
    simp only [neg_one_mul, ← sub_eq_add_neg] at hm
    rw [hm]
    dsimp [radialBase, radialError, S, U, c, h]
    rw [lsum_range]
    push_cast
    ring
  have hh : (∫ t in (-(h : ℝ))..h,
      2 * ((c : ℝ) + t) ^ (k + 1) * (pev S t + (expRem U n : ℝ))) =
      ((radialBase a b n k + radialError a b n k : ℚ) : ℝ) := by
    simp only [one_mul] at hp
    rw [hp]
    dsimp [radialBase, radialError, S, U, c, h]
    rw [lsum_range]
    push_cast
    ring
  change _ ≤ ∫ r in (a : ℝ)..b, radF k r ∧ (∫ r in (a : ℝ)..b, radF k r) ≤ _
  constructor
  · exact (rdDown_le_real P (scale_lo hX.1 hX.2.1 hX.2.2 hl.symm.le)).trans hcore.1
  · exact hcore.2.trans (le_rdUp_real P (scale_hi hX.1 hX.2.1 hX.2.2 hh.le))

end Grothe.UpperReplacement.CellMoments

-- Section: MomentRecurrence

/-!
# A linear-time recurrence for all radial monomial moments

Agent-ID: codex-a7c4.

Only the two initial moments require quadrature. Integration by parts supplies each subsequent
moment from the one two degrees earlier and the two endpoint exponentials. The interval evaluator
must round this identity outwards; it is not a floating-point stability assumption.
-/

namespace Grothe.UpperReplacement.CellMoments

open Real MeasureTheory MomentTaylor

noncomputable section

def moment (k : ℕ) (a b : ℝ) : ℝ := ∫ r in a..b, radF k r

theorem moment_zero (a b : ℝ) : moment 0 a b = exp (-a ^ 2) - exp (-b ^ 2) := by
  have hd : ∀ r : ℝ, HasDerivAt (fun x : ℝ ↦ -exp (-x ^ 2)) (radF 0 r) r := by
    intro r
    convert ((((hasDerivAt_id r).pow 2).neg.exp).neg) using 1 <;>
      simp [radF] <;> first | rfl | ring
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun r _ ↦ hd r)
    ((continuous_radF 0).intervalIntegrable a b)
  change (∫ r in a..b, radF 0 r) = _
  linarith

theorem moment_succ_two (k : ℕ) (a b : ℝ) :
    moment (k + 2) a b = ((k : ℝ) + 2) / 2 * moment k a b +
      a ^ (k + 2) * exp (-a ^ 2) - b ^ (k + 2) * exp (-b ^ 2) := by
  have hd : ∀ r : ℝ, HasDerivAt (fun x : ℝ ↦ x ^ (k + 2) * exp (-x ^ 2))
      ((((k : ℝ) + 2) / 2) * radF k r - radF (k + 2) r) r := by
    intro r
    convert ((hasDerivAt_id r).pow (k + 2)).mul
      (((hasDerivAt_id r).pow 2).neg.exp) using 1
    · rfl
    simp only [radF, show k + 2 - 1 = k + 1 by omega, Nat.cast_add, Nat.cast_ofNat, mul_one,
      Nat.reduceSub, pow_one, Pi.neg_apply, Pi.pow_apply, id_eq]
    ring
  have hI : IntervalIntegrable
      (fun r ↦ (((k : ℝ) + 2) / 2) * radF k r - radF (k + 2) r) volume a b :=
    (((continuous_radF k).const_mul _).sub (continuous_radF (k + 2))).intervalIntegrable a b
  have h := intervalIntegral.integral_eq_sub_of_hasDerivAt (fun r _ ↦ hd r) hI
  rw [intervalIntegral.integral_sub
    (((continuous_radF k).const_mul _).intervalIntegrable a b)
    ((continuous_radF (k + 2)).intervalIntegrable a b),
    intervalIntegral.integral_const_mul] at h
  change (∫ r in a..b, radF (k + 2) r) = _
  dsimp only [moment]
  linarith

end

/-- Outward-rounded recurrence with shared endpoint exponentials and initial moments. -/
def momentRec (P : ℕ) (a b : ℚ) (ea eb v₀ v₁ : ℚ × ℚ) : ℕ → ℚ × ℚ
  | 0 => v₀
  | 1 => v₁
  | k + 2 =>
    let v := momentRec P a b ea eb v₀ v₁ k
    let c : ℚ := (k + 2) / 2
    (rdDown (c * v.1 + a ^ (k + 2) * ea.1 - b ^ (k + 2) * eb.2) P,
      rdUp (c * v.2 + a ^ (k + 2) * ea.2 - b ^ (k + 2) * eb.1) P)

theorem momentRec_sound (P : ℕ) {a b : ℚ} (ha : 0 ≤ a) (hb : 0 ≤ b)
    {ea eb v₀ v₁ : ℚ × ℚ}
    (hea : (ea.1 : ℝ) ≤ exp (-(a : ℝ) ^ 2) ∧ exp (-(a : ℝ) ^ 2) ≤ ea.2)
    (heb : (eb.1 : ℝ) ≤ exp (-(b : ℝ) ^ 2) ∧ exp (-(b : ℝ) ^ 2) ≤ eb.2)
    (h₀ : (v₀.1 : ℝ) ≤ moment 0 a b ∧ moment 0 a b ≤ v₀.2)
    (h₁ : (v₁.1 : ℝ) ≤ moment 1 a b ∧ moment 1 a b ≤ v₁.2) :
    ∀ k, ((momentRec P a b ea eb v₀ v₁ k).1 : ℝ) ≤ moment k a b ∧
      moment k a b ≤ (momentRec P a b ea eb v₀ v₁ k).2
  | 0 => h₀
  | 1 => h₁
  | k + 2 => by
    have ih := momentRec_sound P ha hb hea heb h₀ h₁ k
    have hc : (0 : ℝ) ≤ ((k : ℝ) + 2) / 2 := by positivity
    have hap : (0 : ℝ) ≤ (a : ℝ) ^ (k + 2) := pow_nonneg (by exact_mod_cast ha) _
    have hbp : (0 : ℝ) ≤ (b : ℝ) ^ (k + 2) := pow_nonneg (by exact_mod_cast hb) _
    rw [momentRec, moment_succ_two]
    constructor
    · apply rdDown_le_real
      push_cast
      exact sub_le_sub
        (add_le_add (mul_le_mul_of_nonneg_left ih.1 hc)
          (mul_le_mul_of_nonneg_left hea.1 hap))
        (mul_le_mul_of_nonneg_left heb.2 hbp)
    · apply le_rdUp_real
      push_cast
      exact sub_le_sub
        (add_le_add (mul_le_mul_of_nonneg_left ih.2 hc)
          (mul_le_mul_of_nonneg_left hea.2 hap))
        (mul_le_mul_of_nonneg_left heb.1 hbp)

/-- The fully specified evaluator: two Taylor moments and a shared pair of exponentials. -/
def fastMoment (P n : ℕ) (a b : ℚ) (k : ℕ) : ℚ × ℚ :=
  momentRec P a b (expNegEnclosure P n (a ^ 2)) (expNegEnclosure P n (b ^ 2))
    (radialEnclosure P n a b 0) (radialEnclosure P n a b 1) k

theorem fastMoment_sound (P : ℕ) {n : ℕ} (hn : 0 < n)
    {a b : ℚ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 8)
    (hw : 2 * ((a + b) / 2) * ((b - a) / 2) + ((b - a) / 2) ^ 2 ≤ 1) (k : ℕ) :
    ((fastMoment P n a b k).1 : ℝ) ≤ moment k a b ∧
      moment k a b ≤ (fastMoment P n a b k).2 := by
  have hb0 := ha.trans hab
  have hea := expNegEnclosure_sound P hn (sq_nonneg a) (by nlinarith)
  have heb := expNegEnclosure_sound P hn (sq_nonneg b) (by nlinarith)
  push_cast at hea heb
  exact momentRec_sound P ha hb0 ⟨hea.1, hea.2.1⟩ ⟨heb.1, heb.2.1⟩
    (radialEnclosure_sound P hn ha hab hb hw 0)
    (radialEnclosure_sound P hn ha hab hb hw 1) k

end Grothe.UpperReplacement.CellMoments

-- Section: Normalization

/-!
# Certified normalization of the production Hermite basis

Agent-ID: codex-a7c4.

The enclosure uses the existing proved floating dyadic square-root kernel. Taking the square
root of the reciprocal factorial product avoids an unchecked positive-denominator gate.
-/

namespace Grothe.UpperReplacement

def normalizationInterval (P p q : ℕ) : GrotheQuad.Ival :=
  GrotheQuad.sqrtI P (GrotheQuad.ratI P 1 (p.factorial * q.factorial))

theorem normalizationInterval_sound (P : ℕ) (hP : 1 ≤ P) (p q : ℕ) :
    UpperQuad.mem (UpperChaos.nrm p q) (normalizationInterval P p q) := by
  have hf : 0 < p.factorial * q.factorial := mul_pos (Nat.factorial_pos p) (Nat.factorial_pos q)
  have h := UpperQuad.mem_sqrtI P (by positivity :
      (0 : ℝ) ≤ ((1 : ℤ) : ℝ) / ((p.factorial * q.factorial : ℕ) : ℝ))
    (UpperQuad.mem_ratI P hP 1 hf)
  simpa only [normalizationInterval, UpperChaos.nrm, Int.cast_one, one_div,
    Real.sqrt_inv] using h

end Grothe.UpperReplacement

-- Section: CellRadial

/-!
# Exact radial Hermite integrals from certified monomial moments

Agent-ID: codex-a7c4.

This uses the production Hermite expansion directly. It works for both signs of the angular
frequency and keeps all factorials and signs inside the proved identity.
-/

open MeasureTheory Finset
open scoped ComplexConjugate

namespace Grothe.UpperReplacement

open UpperChaos

/-- The exact rational coefficient in the finite production Hermite expansion. -/
def radialHermiteCoeff (p q k : ℕ) : ℚ :=
  (-1 : ℚ) ^ k * (p.choose k : ℚ) * (q.descFactorial k : ℚ)

/-- The unnormalized Hermite polynomial on the real radius. -/
noncomputable def radialHermite (p q : ℕ) (r : ℝ) : ℝ :=
  ∑ k ∈ range (p + 1), (radialHermiteCoeff p q k : ℝ) * r ^ (p - k + (q - k))

theorem ev_H_eq_radialHermite (p q : ℕ) (r : ℝ) :
    ev (r : ℂ) (H p q) = (radialHermite p q r : ℂ) := by
  rw [HermiteFallingFactorial.ev_H_eq_fallingFactorial]
  simp only [radialHermite, radialHermiteCoeff, Complex.ofReal_sum, Complex.ofReal_mul,
    Complex.ofReal_pow, Rat.cast_mul, Rat.cast_pow, Rat.cast_neg, Rat.cast_one,
    Rat.cast_natCast, Complex.ofReal_neg, Complex.ofReal_one, Complex.ofReal_natCast,
    Complex.conj_ofReal, pow_add, mul_assoc]

theorem hfun_eq_radialHermite (p q : ℕ) (r : ℝ) :
    hfun (p, q) (r : ℂ) = ((nrm p q * radialHermite p q r : ℝ) : ℂ) := by
  rw [hfun, ev_H_eq_radialHermite, Complex.ofReal_mul]

/-- The unnormalized cell moment, before multiplication by the positive Hermite normalization. -/
noncomputable def radialHermiteMoment (p q : ℕ) (a b : ℝ) : ℝ :=
  ∫ r in a..b, 2 * r * Real.exp (-r ^ 2) * radialHermite p q r

/-- Every radial Hermite cell integral is the finite combination evaluated by the moment checker. -/
theorem radialHermiteMoment_eq (p q : ℕ) (a b : ℝ) :
    radialHermiteMoment p q a b =
      ∑ k ∈ range (p + 1), (radialHermiteCoeff p q k : ℝ) *
        ∫ r in a..b, 2 * r ^ (p - k + (q - k) + 1) * Real.exp (-r ^ 2) := by
  unfold radialHermiteMoment radialHermite
  simp_rw [Finset.mul_sum]
  have he : ∀ r : ℝ, ∀ k : ℕ,
      2 * r * Real.exp (-r ^ 2) * ((radialHermiteCoeff p q k : ℝ) *
        r ^ (p - k + (q - k))) =
      (radialHermiteCoeff p q k : ℝ) *
        (2 * r ^ (p - k + (q - k) + 1) * Real.exp (-r ^ 2)) := by
    intro r k
    rw [pow_succ]
    ring
  simp_rw [he]
  rw [intervalIntegral.integral_finsetSum]
  · exact Finset.sum_congr rfl fun k _ ↦ intervalIntegral.integral_const_mul _ _
  · intro k _
    apply Continuous.intervalIntegrable
    fun_prop

/-- Sign-aware finite enclosure; negative Hermite coefficients use the opposite moment endpoint. -/
def radialHermiteEnclosure (P n p q : ℕ) (a b : ℚ) : ℚ × ℚ :=
  let term := fun k ↦ CellMoments.fastMoment P n a b (p - k + (q - k))
  (((List.range (p + 1)).map (fun k ↦
      let c := radialHermiteCoeff p q k
      c * if 0 ≤ c then (term k).1 else (term k).2)).sum,
    ((List.range (p + 1)).map (fun k ↦
      let c := radialHermiteCoeff p q k
      c * if 0 ≤ c then (term k).2 else (term k).1)).sum)

theorem radialHermiteEnclosure_sound (P : ℕ) {n : ℕ} (hn : 0 < n)
    {a b : ℚ} (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 8)
    (hw : 2 * ((a + b) / 2) * ((b - a) / 2) + ((b - a) / 2) ^ 2 ≤ 1)
    (p q : ℕ) :
    ((radialHermiteEnclosure P n p q a b).1 : ℝ) ≤ radialHermiteMoment p q a b ∧
      radialHermiteMoment p q a b ≤ (radialHermiteEnclosure P n p q a b).2 := by
  rw [radialHermiteMoment_eq]
  simp only [radialHermiteEnclosure, MomentTaylor.lsum_range, Rat.cast_sum,
    Rat.cast_mul, apply_ite (fun x : ℚ ↦ (x : ℝ))]
  constructor
  · apply Finset.sum_le_sum
    intro k _
    have hm := CellMoments.fastMoment_sound P hn ha hab hb hw (p - k + (q - k))
    split_ifs with hc
    · exact mul_le_mul_of_nonneg_left hm.1 (by exact_mod_cast hc)
    · exact mul_le_mul_of_nonpos_left hm.2 (by exact_mod_cast (le_of_not_ge hc))
  · apply Finset.sum_le_sum
    intro k _
    have hm := CellMoments.fastMoment_sound P hn ha hab hb hw (p - k + (q - k))
    split_ifs with hc
    · exact mul_le_mul_of_nonneg_left hm.2 (by exact_mod_cast hc)
    · exact mul_le_mul_of_nonpos_left hm.1 (by exact_mod_cast (le_of_not_ge hc))

end Grothe.UpperReplacement

-- Section: MomentCache

/-!
# Shared radial moments for the finite certificate

Agent-ID: codex-a7c4.

The recurrence is evaluated once per radial cell. Its array lookup is proved equal to the
sound scalar recurrence, so caching changes the cost without changing the enclosed quantity.
-/

namespace Grothe.UpperReplacement.CellMoments

open MomentTaylor

def momentStep (P : ℕ) (a b : ℚ) (ea eb v : ℚ × ℚ) (k : ℕ) : ℚ × ℚ :=
  let c : ℚ := (k + 2) / 2
  (rdDown (c * v.1 + a ^ (k + 2) * ea.1 - b ^ (k + 2) * eb.2) P,
    rdUp (c * v.2 + a ^ (k + 2) * ea.2 - b ^ (k + 2) * eb.1) P)

def momentCache (P : ℕ) (a b : ℚ) (ea eb v₀ v₁ : ℚ × ℚ) : ℕ → Array (ℚ × ℚ)
  | 0 => #[]
  | n + 1 =>
    let previous := momentCache P a b ea eb v₀ v₁ n
    previous.push (match n with
      | 0 => v₀
      | 1 => v₁
      | k + 2 => momentStep P a b ea eb (previous[k]?.getD (0, 0)) k)

theorem momentCache_size (P : ℕ) (a b : ℚ) (ea eb v₀ v₁ : ℚ × ℚ) (n : ℕ) :
    (momentCache P a b ea eb v₀ v₁ n).size = n := by
  induction n with
  | zero => rfl
  | succ n ih => simpa only [momentCache, Array.size_push] using congrArg Nat.succ ih

theorem momentCache_get (P : ℕ) (a b : ℚ) (ea eb v₀ v₁ : ℚ × ℚ) {n k : ℕ}
    (hk : k < n) :
    (momentCache P a b ea eb v₀ v₁ n)[k]?.getD (0, 0) =
      momentRec P a b ea eb v₀ v₁ k := by
  induction n generalizing k with
  | zero => omega
  | succ n ih =>
    rw [momentCache.eq_def, Array.getElem?_push, momentCache_size]
    by_cases he : k = n
    · subst k
      rw [ite_eq_left rfl, Option.getD_some]
      match n with
      | 0 => rfl
      | 1 => rfl
      | k + 2 =>
        change momentStep P a b ea eb
          ((momentCache P a b ea eb v₀ v₁ (k + 2))[k]?.getD (0, 0)) k = _
        rw [ih (by omega)]
        rfl
    · rw [ite_eq_right he]
      exact ih (by omega)

def fastMomentCache (P n : ℕ) (a b : ℚ) (size : ℕ) : Array (ℚ × ℚ) :=
  momentCache P a b (expNegEnclosure P n (a ^ 2)) (expNegEnclosure P n (b ^ 2))
    (radialEnclosure P n a b 0) (radialEnclosure P n a b 1) size

theorem fastMomentCache_get (P n : ℕ) (a b : ℚ) {size k : ℕ} (hk : k < size) :
    (fastMomentCache P n a b size)[k]?.getD (0, 0) = fastMoment P n a b k :=
  momentCache_get P a b _ _ _ _ hk

end Grothe.UpperReplacement.CellMoments
