import Grothe.UpperSix.HaagerupKernel.TaylorHardy
import Grothe.UpperSix.Haagerup.SchurHardy
import Mathlib.Analysis.Complex.AbsMax
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts

set_option warningAsError true

/-!
# Soundness of `HaagerupKernel.TaylorHardy`: TM-2 arithmetic, Maximum Principle, and Q1 Simpson quadrature

Connects the Mathlib-free 64-bit degree-2 Taylor-model checkers in `HaagerupKernel.TaylorHardy`
to the master Hardy tail budgets required by the six-channel bound (`Grothe/UpperSix/Certificate/Bound.lean`):
1. Soundness of 64-bit degree-2 Taylor-model arithmetic (`memTM2`, `tmMul`, residual-certified
   `tmInvPos`, complex `TMC`, Horner evaluation, and half-angle circle chart `circleTM`);
2. Harmonic Maximum Principle for complex symmetric `KerPos`: if `I ± Re(R(t)) ≻ 0` on the
   first-quadrant boundary circle `|t| = r` (`s ∈ [0, 1]`), then `KerPos (R t)` holds on the
   entire open disk `|t| < r`;
3. Quarter-circle symmetry of `gaussDenominator`, singularity-free 1D diagonal reductions
   (`diag(r, 0)` and `diag(-r, r)`), and TM-2 Simpson integral bounds;
4. Master Hardy channel theorems `hardy_smoothed_channel_tm`, `hardy_phase_channel_tm`, and
   `hardy_anti_channel_tm`.

Agent-ID: gemini-1aa9
-/

namespace Haagerup

open MeasureTheory ProbabilityTheory Complex Real Metric Filter Topology
open Finset
open HaagerupKernel HaagerupKernel.TaylorHardy
open Sym2R SchurKernel SchurMain GaussianAmplitude
open scoped ComplexConjugate Polynomial

noncomputable section

/-! ### 1. Basic integer / fixed-point helpers (`D64 = 2^64`) -/

private lemma nat_add_eq (a b : ℕ) : Nat.add a b = a + b := rfl
private lemma nat_mul_eq (a b : ℕ) : Nat.mul a b = a * b := rfl
private lemma nat_div_eq (a b : ℕ) : Nat.div a b = a / b := rfl
private lemma nat_pow_eq (a b : ℕ) : Nat.pow a b = a ^ b := rfl
private lemma int_add_eq (a b : ℤ) : Int.add a b = a + b := rfl
private lemma int_sub_eq (a b : ℤ) : Int.sub a b = a - b := rfl
private lemma int_mul_eq (a b : ℤ) : Int.mul a b = a * b := rfl
private lemma int_neg_eq (a : ℤ) : Int.neg a = -a := rfl

private lemma D64_pos_int : (0 : ℤ) < D64 := by unfold D64; positivity
private lemma D64_pos : (0 : ℝ) < (D64 : ℝ) := by exact_mod_cast D64_pos_int
private lemma D64N_eq : (D64N : ℤ) = D64 := rfl
private lemma D64N_eq_R : (D64N : ℝ) = (D64 : ℝ) := by norm_num [D64N, D64]

private lemma iAbs_eq (a : ℤ) : iAbs a = a.natAbs := by cases a <;> rfl
private lemma iAbs_cast (a : ℤ) : ((iAbs a : ℕ) : ℝ) = |(a : ℝ)| := by
  rw [iAbs_eq, ← Int.cast_natCast, ← Int.abs_eq_natAbs, Int.cast_abs]

private lemma iPos_iff (a : ℤ) : iPos a = true ↔ (0 : ℤ) < a := by
  cases a with
  | ofNat n =>
    cases n with
    | zero => simp [iPos]
    | succ m => simp [iPos]
  | negSucc n => simp [iPos]

private lemma iLe_iff (a b : ℤ) : iLe a b = true ↔ a ≤ b := by
  unfold iLe
  cases h : Int.sub b a with
  | ofNat n =>
    simp only [true_iff]
    have h' : b - a = (n : ℤ) := by simpa [int_sub_eq] using h
    omega
  | negSucc n =>
    simp only [Bool.false_eq_true, false_iff]
    have h' : b - a = -(n + 1 : ℤ) := by simpa [int_sub_eq, Int.negSucc_eq] using h
    omega

private lemma fDown_eq_ediv (x : ℤ) : fDown x = x / D64 := by
  cases x <;> rfl

private lemma iHalfDown_eq_ediv (x : ℤ) : iHalfDown x = x / 2 := by
  cases x <;> rfl

private lemma fDown_bounds (x : ℤ) :
    (fDown x : ℝ) ≤ (x : ℝ) / (D64 : ℝ) ∧ (x : ℝ) / (D64 : ℝ) < (fDown x : ℝ) + 1 := by
  rw [fDown_eq_ediv]
  have hD := D64_pos
  have h1 : ((x / D64 : ℤ) : ℝ) * (D64 : ℝ) ≤ (x : ℝ) := by
    exact_mod_cast Int.ediv_mul_le x D64_pos_int.ne'
  have h2 : (x : ℝ) < ((x / D64 + 1 : ℤ) : ℝ) * (D64 : ℝ) := by
    have := Int.lt_ediv_add_one_mul_self x D64_pos_int
    exact_mod_cast this
  constructor
  · exact (le_div_iff₀ hD).2 h1
  · rw [div_lt_iff₀ hD]; push_cast at h2; exact h2

private lemma fDown_abs_err (x : ℤ) : |(x : ℝ) / (D64 : ℝ) - (fDown x : ℝ)| ≤ 1 := by
  obtain ⟨h1, h2⟩ := fDown_bounds x
  exact abs_le.2 ⟨by linarith, by linarith⟩

private lemma iHalfDown_abs_err (x : ℤ) : |(x : ℝ) / 2 - (iHalfDown x : ℝ)| ≤ 1 / 2 := by
  rw [iHalfDown_eq_ediv]
  have h1Z : (x / 2) * 2 ≤ x := by omega
  have h2Z : x ≤ (x / 2) * 2 + 1 := by omega
  have h1 : ((x / 2 : ℤ) : ℝ) * 2 ≤ (x : ℝ) := by exact_mod_cast h1Z
  have h2 : (x : ℝ) ≤ ((x / 2 : ℤ) : ℝ) * 2 + 1 := by exact_mod_cast h2Z
  exact abs_le.2 ⟨by linarith, by linarith⟩

private lemma divUpNat_ge (n d : ℕ) (hd : 0 < d) : (n : ℝ) / (d : ℝ) ≤ (divUpNat n d : ℝ) := by
  have hdR : (0 : ℝ) < (d : ℝ) := by exact_mod_cast hd
  rw [div_le_iff₀ hdR]
  cases n with
  | zero => simp [divUpNat]
  | succ m =>
    simp only [divUpNat]
    have h1 : m + 1 ≤ (m / d + 1) * d := by
      have hdm := Nat.div_add_mod m d
      have hlt := Nat.mod_lt m hd
      nlinarith
    exact_mod_cast h1

private lemma fUpNat_ge (n : ℕ) : (n : ℝ) / (D64 : ℝ) ≤ (fUpNat n : ℝ) := by
  have h : fUpNat n = divUpNat n D64N := by cases n <;> rfl
  rw [h, ← D64N_eq_R]
  exact divUpNat_ge n D64N (by unfold D64N; positivity)

private lemma ofRatDown64_le (q : ℚ) : (ofRatDown64 q : ℝ) ≤ (q : ℝ) * (D64 : ℝ) := by
  have h : ((ofRatDown64 q : ℤ) : ℚ) ≤ q * (D64 : ℚ) := Rat.le_floor_iff.1 le_rfl
  exact_mod_cast h

private lemma lt_ofRatDown64_add_one (q : ℚ) : (q : ℝ) * (D64 : ℝ) < (ofRatDown64 q : ℝ) + 1 := by
  have h : q * (D64 : ℚ) < ((ofRatDown64 q : ℤ) : ℚ) + 1 := by
    unfold ofRatDown64
    simpa [Int.cast_add, Int.cast_one] using Rat.lt_floor_add_one (q * (D64 : ℚ))
  exact_mod_cast h

/-! ### 2. Degree-2 Taylor-model semantics and soundness (`memTM2`, `memTMC`) -/

/-- `memTM2 f a` means `|f u - (a.c + a.d u + a.q u²) / D64| ≤ a.r / D64` for all `|u| ≤ 1`. -/
def memTM2 (f : ℝ → ℝ) (a : TM2) : Prop :=
  ∀ u : ℝ, |u| ≤ 1 →
    |f u - ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)| ≤
      (a.r : ℝ) / (D64 : ℝ)

private lemma memTM2_exact (x : ℤ) : memTM2 (fun _ => (x : ℝ) / (D64 : ℝ)) (tmExact x) := by
  intro u _; simp [tmExact]

private lemma memTM2_zero : memTM2 (fun _ => (0 : ℝ)) tmZero := by
  intro u _; simp [tmZero]

private lemma memTM2_one : memTM2 (fun _ => (1 : ℝ)) tmOne := by
  intro u _
  simp only [tmOne, Int.cast_zero, zero_mul, add_zero, Nat.cast_zero, zero_div,
    div_self D64_pos.ne', sub_self, abs_zero, le_refl]

private lemma memTM2_ofRatTM (q : ℚ) : memTM2 (fun _ => (q : ℝ)) (ofRatTM q) := by
  intro u _
  have h1 := ofRatDown64_le q
  have h2 := lt_ofRatDown64_add_one q
  have hD := D64_pos
  simp only [ofRatTM, Int.cast_zero, zero_mul, add_zero, Nat.cast_one]
  have h1' : (ofRatDown64 q : ℝ) / (D64 : ℝ) ≤ (q : ℝ) := (div_le_iff₀ hD).2 h1
  have h2' : (q : ℝ) < ((ofRatDown64 q : ℝ) + 1) / (D64 : ℝ) := (lt_div_iff₀ hD).2 h2
  have hdiv : ((ofRatDown64 q : ℝ) + 1) / (D64 : ℝ) = (ofRatDown64 q : ℝ) / (D64 : ℝ) + 1 / (D64 : ℝ) :=
    add_div _ _ _
  have hpos : (0 : ℝ) < 1 / (D64 : ℝ) := by positivity
  exact abs_le.2 ⟨by linarith, by linarith⟩

private lemma memTM2_add {f g : ℝ → ℝ} {a b : TM2} (hf : memTM2 f a) (hg : memTM2 g b) :
    memTM2 (fun u => f u + g u) (tmAdd a b) := by
  intro u hu
  have h1 := hf u hu; have h2 := hg u hu
  simp only [tmAdd, iAdd, int_add_eq, nat_add_eq]
  have heq : f u + g u -
      (((a.c + b.c : ℤ) : ℝ) + ((a.d + b.d : ℤ) : ℝ) * u + ((a.q + b.q : ℤ) : ℝ) * u ^ 2) /
        (D64 : ℝ) =
      (f u - ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)) +
      (g u - ((b.c : ℝ) + (b.d : ℝ) * u + (b.q : ℝ) * u ^ 2) / (D64 : ℝ)) := by
    push_cast; ring
  rw [heq]
  calc _ ≤ _ + _ := abs_add_le _ _
    _ ≤ (a.r : ℝ) / (D64 : ℝ) + (b.r : ℝ) / (D64 : ℝ) := add_le_add h1 h2
    _ = ((a.r + b.r : ℕ) : ℝ) / (D64 : ℝ) := by push_cast; ring

private lemma memTM2_neg {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a) :
    memTM2 (fun u => -f u) (tmNeg a) := by
  intro u hu
  have h1 := hf u hu
  simp only [tmNeg, iNeg, int_neg_eq]
  have heq : -f u - (((-a.c : ℤ) : ℝ) + ((-a.d : ℤ) : ℝ) * u + ((-a.q : ℤ) : ℝ) * u ^ 2) / (D64 : ℝ) =
      -(f u - ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)) := by
    push_cast; ring
  rw [heq, abs_neg]; exact h1

private lemma memTM2_sub {f g : ℝ → ℝ} {a b : TM2} (hf : memTM2 f a) (hg : memTM2 g b) :
    memTM2 (fun u => f u - g u) (tmSub a b) := by
  have h := memTM2_add hf (memTM2_neg hg)
  intro u hu
  have h' := h u hu
  simp only [tmSub, iSub, tmAdd, tmNeg, iAdd, iNeg, int_add_eq, int_sub_eq, int_neg_eq, nat_add_eq,
    ← sub_eq_add_neg] at h' ⊢
  exact h'

private lemma memTM2_double {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a) :
    memTM2 (fun u => 2 * f u) (tmDouble a) := by
  simpa only [two_mul, tmDouble, tmAdd] using memTM2_add hf hf

private lemma memTM2_half {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a) :
    memTM2 (fun u => f u / 2) (tmHalf a) := by
  intro u hu
  have h1 := hf u hu
  have hD := D64_pos
  have hu2 : |u ^ 2| ≤ 1 := by rw [abs_pow]; exact pow_le_one₀ (abs_nonneg u) hu
  have hc := iHalfDown_abs_err a.c
  have hd := iHalfDown_abs_err a.d
  have hq := iHalfDown_abs_err a.q
  have hpoly :
      |((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / 2 -
        ((iHalfDown a.c : ℝ) + (iHalfDown a.d : ℝ) * u + (iHalfDown a.q : ℝ) * u ^ 2)| ≤ 2 := by
    have heq : ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / 2 -
        ((iHalfDown a.c : ℝ) + (iHalfDown a.d : ℝ) * u + (iHalfDown a.q : ℝ) * u ^ 2) =
        ((a.c : ℝ) / 2 - (iHalfDown a.c : ℝ)) +
        (((a.d : ℝ) / 2 - (iHalfDown a.d : ℝ)) * u +
         ((a.q : ℝ) / 2 - (iHalfDown a.q : ℝ)) * u ^ 2) := by ring
    rw [heq]
    have hd' : |((a.d : ℝ) / 2 - (iHalfDown a.d : ℝ)) * u| ≤ 1 / 2 := by
      rw [abs_mul]; exact (mul_le_mul hd hu (abs_nonneg _) (by positivity)).trans_eq (mul_one _)
    have hq' : |((a.q : ℝ) / 2 - (iHalfDown a.q : ℝ)) * u ^ 2| ≤ 1 / 2 := by
      rw [abs_mul]; exact (mul_le_mul hq hu2 (abs_nonneg _) (by positivity)).trans_eq (mul_one _)
    linarith [abs_add_le ((a.c : ℝ) / 2 - (iHalfDown a.c : ℝ))
      (((a.d : ℝ) / 2 - (iHalfDown a.d : ℝ)) * u + ((a.q : ℝ) / 2 - (iHalfDown a.q : ℝ)) * u ^ 2),
      abs_add_le (((a.d : ℝ) / 2 - (iHalfDown a.d : ℝ)) * u)
        (((a.q : ℝ) / 2 - (iHalfDown a.q : ℝ)) * u ^ 2)]
  have hsplit : f u / 2 - ((iHalfDown a.c : ℝ) + (iHalfDown a.d : ℝ) * u + (iHalfDown a.q : ℝ) * u ^ 2) / (D64 : ℝ) =
      (f u - ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)) / 2 +
      (((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / 2 -
        ((iHalfDown a.c : ℝ) + (iHalfDown a.d : ℝ) * u + (iHalfDown a.q : ℝ) * u ^ 2)) / (D64 : ℝ) := by
    ring
  have hr2 : (a.r : ℝ) / 2 ≤ ((Nat.div (Nat.add a.r 1) 2 : ℕ) : ℝ) := by
    have : a.r ≤ 2 * ((a.r + 1) / 2) := by omega
    have hR : (a.r : ℝ) ≤ 2 * (((a.r + 1) / 2 : ℕ) : ℝ) := by exact_mod_cast this
    simpa only [nat_add_eq, nat_div_eq] using (show (a.r : ℝ) / 2 ≤ (((a.r + 1) / 2 : ℕ) : ℝ) by linarith)
  simp only [tmHalf]
  rw [hsplit]
  have hterm1 : |(f u - ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)) / 2| ≤
      (a.r : ℝ) / 2 / (D64 : ℝ) := by
    rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 2)]
    have hdiv := div_le_div_of_nonneg_right h1 (by norm_num : (0 : ℝ) ≤ 2)
    rwa [div_right_comm] at hdiv
  have hterm2 : |(((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / 2 -
      ((iHalfDown a.c : ℝ) + (iHalfDown a.d : ℝ) * u + (iHalfDown a.q : ℝ) * u ^ 2)) / (D64 : ℝ)| ≤
      2 / (D64 : ℝ) := by
    rw [abs_div, abs_of_pos hD]; exact div_le_div_of_nonneg_right hpoly hD.le
  calc _ ≤ _ + _ := abs_add_le _ _
    _ ≤ (a.r : ℝ) / 2 / (D64 : ℝ) + 2 / (D64 : ℝ) := add_le_add hterm1 hterm2
    _ ≤ ((Nat.div (Nat.add a.r 1) 2 : ℕ) : ℝ) / (D64 : ℝ) + 2 / (D64 : ℝ) := by gcongr
    _ = ((Nat.add (Nat.div (Nat.add a.r 1) 2) 2 : ℕ) : ℝ) / (D64 : ℝ) := by
        simp only [nat_add_eq]; push_cast; ring

private lemma memTM2_mul {f g : ℝ → ℝ} {a b : TM2} (hf : memTM2 f a) (hg : memTM2 g b) :
    memTM2 (fun u => f u * g u) (tmMul a b) := by
  intro u hu
  have hD := D64_pos
  have hu2 : |u ^ 2| ≤ 1 := by rw [abs_pow]; exact pow_le_one₀ (abs_nonneg u) hu
  have hu3 : |u ^ 3| ≤ 1 := by rw [abs_pow]; exact pow_le_one₀ (abs_nonneg u) hu
  have hu4 : |u ^ 4| ≤ 1 := by rw [abs_pow]; exact pow_le_one₀ (abs_nonneg u) hu
  set p1 : ℝ := ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)
  set p2 : ℝ := ((b.c : ℝ) + (b.d : ℝ) * u + (b.q : ℝ) * u ^ 2) / (D64 : ℝ)
  set e1 : ℝ := f u - p1
  set e2 : ℝ := g u - p2
  have he1 : |e1| ≤ (a.r : ℝ) / (D64 : ℝ) := hf u hu
  have he2 : |e2| ≤ (b.r : ℝ) / (D64 : ℝ) := hg u hu
  have hp1 : |p1| ≤ (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) / (D64 : ℝ) := by
    dsimp only [p1]; rw [abs_div, abs_of_pos hD]
    apply div_le_div_of_nonneg_right _ hD.le
    have hdu : |(a.d : ℝ) * u| ≤ |(a.d : ℝ)| := by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu
    have hqu : |(a.q : ℝ) * u ^ 2| ≤ |(a.q : ℝ)| := by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu2
    linarith [abs_add_le ((a.c : ℝ) + (a.d : ℝ) * u) ((a.q : ℝ) * u ^ 2),
      abs_add_le (a.c : ℝ) ((a.d : ℝ) * u)]
  have hp2 : |p2| ≤ (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|) / (D64 : ℝ) := by
    dsimp only [p2]; rw [abs_div, abs_of_pos hD]
    apply div_le_div_of_nonneg_right _ hD.le
    have hdu : |(b.d : ℝ) * u| ≤ |(b.d : ℝ)| := by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu
    have hqu : |(b.q : ℝ) * u ^ 2| ≤ |(b.q : ℝ)| := by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu2
    linarith [abs_add_le ((b.c : ℝ) + (b.d : ℝ) * u) ((b.q : ℝ) * u ^ 2),
      abs_add_le (b.c : ℝ) ((b.d : ℝ) * u)]
  set cZ : ℤ := iMul a.c b.c
  set dZ : ℤ := iAdd (iMul a.c b.d) (iMul a.d b.c)
  set qZ : ℤ := iAdd (iAdd (iMul a.c b.q) (iMul a.d b.d)) (iMul a.q b.c)
  have hfg : f u * g u - ((fDown cZ : ℝ) + (fDown dZ : ℝ) * u + (fDown qZ : ℝ) * u ^ 2) / (D64 : ℝ) =
      (((cZ : ℝ) / (D64 : ℝ) - (fDown cZ : ℝ)) +
       ((dZ : ℝ) / (D64 : ℝ) - (fDown dZ : ℝ)) * u +
       ((qZ : ℝ) / (D64 : ℝ) - (fDown qZ : ℝ)) * u ^ 2) / (D64 : ℝ) +
      ((((a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)) * u ^ 3 +
        ((a.q : ℝ) * (b.q : ℝ)) * u ^ 4) / (D64 : ℝ) ^ 2 +
       (e1 * p2 + e2 * p1 + e1 * e2)) := by
    have hfu : f u = p1 + e1 := by dsimp only [e1]; ring
    have hgu : g u = p2 + e2 := by dsimp only [e2]; ring
    rw [hfu, hgu]
    simp only [cZ, dZ, qZ, iAdd, iMul, int_add_eq, int_mul_eq, p1, p2]
    push_cast; field_simp; ring
  have hround :
      |(((cZ : ℝ) / (D64 : ℝ) - (fDown cZ : ℝ)) +
        ((dZ : ℝ) / (D64 : ℝ) - (fDown dZ : ℝ)) * u +
        ((qZ : ℝ) / (D64 : ℝ) - (fDown qZ : ℝ)) * u ^ 2) / (D64 : ℝ)| ≤ 3 / (D64 : ℝ) := by
    rw [abs_div, abs_of_pos hD]
    apply div_le_div_of_nonneg_right _ hD.le
    have h1 := fDown_abs_err cZ
    have h2 : |((dZ : ℝ) / (D64 : ℝ) - (fDown dZ : ℝ)) * u| ≤ 1 := by
      rw [abs_mul]; exact (mul_le_mul (fDown_abs_err dZ) hu (abs_nonneg _) zero_le_one).trans_eq (mul_one _)
    have h3 : |((qZ : ℝ) / (D64 : ℝ) - (fDown qZ : ℝ)) * u ^ 2| ≤ 1 := by
      rw [abs_mul]; exact (mul_le_mul (fDown_abs_err qZ) hu2 (abs_nonneg _) zero_le_one).trans_eq (mul_one _)
    linarith [abs_add_le (((cZ : ℝ) / (D64 : ℝ) - (fDown cZ : ℝ)) + ((dZ : ℝ) / (D64 : ℝ) - (fDown dZ : ℝ)) * u)
      (((qZ : ℝ) / (D64 : ℝ) - (fDown qZ : ℝ)) * u ^ 2),
      abs_add_le ((cZ : ℝ) / (D64 : ℝ) - (fDown cZ : ℝ)) (((dZ : ℝ) / (D64 : ℝ) - (fDown dZ : ℝ)) * u)]
  set b1N := Nat.add (Nat.add (iAbs a.c) (iAbs a.d)) (iAbs a.q)
  set b2N := Nat.add (Nat.add (iAbs b.c) (iAbs b.d)) (iAbs b.q)
  set t3N := iAbs (iAdd (iMul a.d b.q) (iMul a.q b.d))
  set t4N := Nat.mul (iAbs a.q) (iAbs b.q)
  set trN := Nat.add (Nat.add t3N t4N)
    (Nat.add (Nat.add (Nat.mul a.r b2N) (Nat.mul b.r b1N)) (Nat.mul a.r b.r))
  have htrR : (trN : ℝ) =
      |(a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)| + |(a.q : ℝ)| * |(b.q : ℝ)| +
      ((a.r : ℝ) * (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|) +
       (b.r : ℝ) * (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) + (a.r : ℝ) * (b.r : ℝ)) := by
    simp only [trN, t3N, t4N, b1N, b2N, nat_add_eq, nat_mul_eq]
    push_cast
    rw [iAbs_cast, iAbs_cast, iAbs_cast, iAbs_cast, iAbs_cast, iAbs_cast, iAbs_cast]
    simp only [iAdd, iMul, int_add_eq, int_mul_eq]; push_cast; ring
  have htail :
      |(((a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)) * u ^ 3 +
        ((a.q : ℝ) * (b.q : ℝ)) * u ^ 4) / (D64 : ℝ) ^ 2 +
       (e1 * p2 + e2 * p1 + e1 * e2)| ≤ (trN : ℝ) / (D64 : ℝ) ^ 2 := by
    have hA : |((a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)) * u ^ 3| ≤
        |(a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)| := by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu3
    have hB : |((a.q : ℝ) * (b.q : ℝ)) * u ^ 4| ≤ |(a.q : ℝ)| * |(b.q : ℝ)| := by
      rw [abs_mul, abs_mul]; exact mul_le_of_le_one_right (by positivity) hu4
    have hAB : |(((a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)) * u ^ 3 +
        ((a.q : ℝ) * (b.q : ℝ)) * u ^ 4) / (D64 : ℝ) ^ 2| ≤
        (|(a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)| + |(a.q : ℝ)| * |(b.q : ℝ)|) / (D64 : ℝ) ^ 2 := by
      rw [abs_div, abs_of_pos (pow_pos hD 2)]
      exact div_le_div_of_nonneg_right ((abs_add_le _ _).trans (add_le_add hA hB)) (pow_pos hD 2).le
    have hC1 : |e1 * p2| ≤ ((a.r : ℝ) * (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|)) / (D64 : ℝ) ^ 2 := by
      rw [abs_mul]
      calc |e1| * |p2| ≤ ((a.r : ℝ) / (D64 : ℝ)) * ((|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|) / (D64 : ℝ)) :=
            mul_le_mul he1 hp2 (abs_nonneg _) (by positivity)
        _ = _ := by ring
    have hC2 : |e2 * p1| ≤ ((b.r : ℝ) * (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|)) / (D64 : ℝ) ^ 2 := by
      rw [abs_mul]
      calc |e2| * |p1| ≤ ((b.r : ℝ) / (D64 : ℝ)) * ((|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) / (D64 : ℝ)) :=
            mul_le_mul he2 hp1 (abs_nonneg _) (by positivity)
        _ = _ := by ring
    have hC3 : |e1 * e2| ≤ ((a.r : ℝ) * (b.r : ℝ)) / (D64 : ℝ) ^ 2 := by
      rw [abs_mul]
      calc |e1| * |e2| ≤ ((a.r : ℝ) / (D64 : ℝ)) * ((b.r : ℝ) / (D64 : ℝ)) :=
            mul_le_mul he1 he2 (abs_nonneg _) (by positivity)
        _ = _ := by ring
    have hC : |e1 * p2 + e2 * p1 + e1 * e2| ≤
        ((a.r : ℝ) * (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|) +
         (b.r : ℝ) * (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) + (a.r : ℝ) * (b.r : ℝ)) / (D64 : ℝ) ^ 2 := by
      have hd1 := add_div ((a.r : ℝ) * (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|))
        ((b.r : ℝ) * (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|)) ((D64 : ℝ) ^ 2)
      have hd2 := add_div ((a.r : ℝ) * (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|) +
        (b.r : ℝ) * (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|)) ((a.r : ℝ) * (b.r : ℝ)) ((D64 : ℝ) ^ 2)
      calc |e1 * p2 + e2 * p1 + e1 * e2| ≤ |e1 * p2 + e2 * p1| + |e1 * e2| := abs_add_le _ _
        _ ≤ |e1 * p2| + |e2 * p1| + |e1 * e2| := by linarith [abs_add_le (e1 * p2) (e2 * p1)]
        _ ≤ _ := by linarith
    rw [htrR]
    have hd3 := add_div (|(a.d : ℝ) * (b.q : ℝ) + (a.q : ℝ) * (b.d : ℝ)| + |(a.q : ℝ)| * |(b.q : ℝ)|)
      ((a.r : ℝ) * (|(b.c : ℝ)| + |(b.d : ℝ)| + |(b.q : ℝ)|) +
       (b.r : ℝ) * (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) + (a.r : ℝ) * (b.r : ℝ)) ((D64 : ℝ) ^ 2)
    exact (abs_add_le _ _).trans (by linarith)
  have hup : (trN : ℝ) / (D64 : ℝ) ^ 2 ≤ (fUpNat trN : ℝ) / (D64 : ℝ) := by
    have h1 := fUpNat_ge trN
    have h2 := div_le_div_of_nonneg_right h1 hD.le
    simpa [div_div, sq] using h2
  change |f u * g u - ((fDown cZ : ℝ) + (fDown dZ : ℝ) * u + (fDown qZ : ℝ) * u ^ 2) / (D64 : ℝ)| ≤
    ((Nat.add (fUpNat trN) 3 : ℕ) : ℝ) / (D64 : ℝ)
  rw [hfg]
  calc _ ≤ _ + _ := abs_add_le _ _
    _ ≤ 3 / (D64 : ℝ) + (trN : ℝ) / (D64 : ℝ) ^ 2 := add_le_add hround htail
    _ ≤ 3 / (D64 : ℝ) + (fUpNat trN : ℝ) / (D64 : ℝ) := add_le_add le_rfl hup
    _ = ((Nat.add (fUpNat trN) 3 : ℕ) : ℝ) / (D64 : ℝ) := by simp only [nat_add_eq]; push_cast; ring

private lemma memTM2_lo {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a) {u : ℝ} (hu : |u| ≤ 1) :
    (tmLo a : ℝ) / (D64 : ℝ) ≤ f u := by
  have h1 := (abs_le.1 (hf u hu)).1
  have hu2 : |u ^ 2| ≤ 1 := by rw [abs_pow]; exact pow_le_one₀ (abs_nonneg u) hu
  have hdu : -|(a.d : ℝ)| ≤ (a.d : ℝ) * u := by
    have := (abs_le.1 (show |(a.d : ℝ) * u| ≤ |(a.d : ℝ)| by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu)).1
    exact this
  have hqu : -|(a.q : ℝ)| ≤ (a.q : ℝ) * u ^ 2 := by
    have := (abs_le.1 (show |(a.q : ℝ) * u ^ 2| ≤ |(a.q : ℝ)| by
      rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu2)).1
    exact this
  have hlo : (tmLo a : ℝ) = (a.c : ℝ) - (|(a.d : ℝ)| + |(a.q : ℝ)| + (a.r : ℝ)) := by
    simp only [tmLo, iSub, int_sub_eq, Int.ofNat_eq_natCast, nat_add_eq]
    push_cast; rw [iAbs_cast, iAbs_cast]
  rw [hlo]
  have hD := D64_pos
  have hnum : (a.c : ℝ) - (|(a.d : ℝ)| + |(a.q : ℝ)| + (a.r : ℝ)) ≤
      (a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2 - (a.r : ℝ) := by linarith
  have hdiv := div_le_div_of_nonneg_right hnum hD.le
  linarith [sub_div ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) (a.r : ℝ) (D64 : ℝ)]

private lemma pos_of_tmLo_pos {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a)
    (hp : iPos (tmLo a) = true) {u : ℝ} (hu : |u| ≤ 1) : 0 < f u := by
  have hpos : (0 : ℤ) < tmLo a := (iPos_iff _).1 hp
  have hposR : (0 : ℝ) < (tmLo a : ℝ) := by exact_mod_cast hpos
  exact lt_of_lt_of_le (div_pos hposR D64_pos) (memTM2_lo hf hu)

private lemma memTM2_absHi {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a) {u : ℝ} (hu : |u| ≤ 1) :
    |f u| ≤ (tmAbsHi a : ℝ) / (D64 : ℝ) := by
  have h1 := hf u hu
  have hu2 : |u ^ 2| ≤ 1 := by rw [abs_pow]; exact pow_le_one₀ (abs_nonneg u) hu
  have hdu : |(a.d : ℝ) * u| ≤ |(a.d : ℝ)| := by
    rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu
  have hqu : |(a.q : ℝ) * u ^ 2| ≤ |(a.q : ℝ)| := by
    rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) hu2
  have hD := D64_pos
  have hp : |((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)| ≤
      (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) / (D64 : ℝ) := by
    rw [abs_div, abs_of_pos hD]
    apply div_le_div_of_nonneg_right _ hD.le
    linarith [abs_add_le ((a.c : ℝ) + (a.d : ℝ) * u) ((a.q : ℝ) * u ^ 2),
      abs_add_le (a.c : ℝ) ((a.d : ℝ) * u)]
  have heq : (tmAbsHi a : ℝ) = |(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)| + (a.r : ℝ) := by
    simp only [tmAbsHi, nat_add_eq]; push_cast; rw [iAbs_cast, iAbs_cast, iAbs_cast]
  have hf_split : f u = (f u - ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ)) +
      ((a.c : ℝ) + (a.d : ℝ) * u + (a.q : ℝ) * u ^ 2) / (D64 : ℝ) := by ring
  rw [hf_split, heq]
  calc _ ≤ _ + _ := abs_add_le _ _
    _ ≤ (a.r : ℝ) / (D64 : ℝ) + (|(a.c : ℝ)| + |(a.d : ℝ)| + |(a.q : ℝ)|) / (D64 : ℝ) :=
        add_le_add h1 hp
    _ = _ := by ring

/-- Residual-based soundness of `tmInvPos` (zero ULP casework on heuristic `(ic, d2, q2)`). -/
private lemma memTM2_invPos {f : ℝ → ℝ} {a b : TM2} (hf : memTM2 f a)
    (hi : tmInvPos a = some b) :
    (∀ u : ℝ, |u| ≤ 1 → 0 < f u) ∧ memTM2 (fun u => (f u)⁻¹) b := by
  unfold tmInvPos at hi
  dsimp only at hi
  cases hc : a.c with
  | negSucc _ => rw [hc] at hi; simp at hi
  | ofNat cN =>
    rw [hc] at hi
    cases hlo : iSub (Int.ofNat cN) (Int.ofNat (Nat.add (Nat.add (iAbs a.d) (iAbs a.q)) a.r)) with
    | negSucc _ => rw [hlo] at hi; simp at hi
    | ofNat loVal =>
      rw [hlo] at hi
      cases loVal with
      | zero => simp at hi
      | succ loM =>
        dsimp only at hi
        injection hi with hb; subst hb
        set loN := Nat.succ loM
        have hlo_eq : tmLo a = Int.ofNat loN := by
          unfold tmLo; rw [hc]; exact hlo
        have hlo_pos : 0 < loN := Nat.succ_pos loM
        have hlo_posR : (0 : ℝ) < (loN : ℝ) := by exact_mod_cast hlo_pos
        have hf_ge : ∀ u : ℝ, |u| ≤ 1 → (loN : ℝ) / (D64 : ℝ) ≤ f u := fun u hu => by
          have := memTM2_lo hf hu
          rwa [hlo_eq, Int.ofNat_eq_natCast, Int.cast_natCast] at this
        have hf_pos : ∀ u : ℝ, |u| ≤ 1 → 0 < f u := fun u hu =>
          lt_of_lt_of_le (div_pos hlo_posR D64_pos) (hf_ge u hu)
        refine ⟨hf_pos, fun u hu => ?_⟩
        set icN := Nat.div D64SqN cN
        set ic := Int.ofNat icN
        set ic2 := fDown (iMul ic ic)
        set d2 := fDown (iMul (iNeg a.d) ic2)
        set d2c := fDown (iMul (fDown (iMul a.d a.d)) ic)
        set q2 := fDown (iMul (iSub d2c a.q) ic2)
        set p : TM2 := ⟨ic, d2, q2, 0⟩
        set pFun : ℝ → ℝ := fun t => ((ic : ℝ) + (d2 : ℝ) * t + (q2 : ℝ) * t ^ 2) / (D64 : ℝ)
        have hp : memTM2 pFun p := fun t _ => by simp [pFun, p]
        have hres : memTM2 (fun t => 1 - f t * pFun t) (tmSub tmOne (tmMul a p)) :=
          memTM2_sub memTM2_one (memTM2_mul hf hp)
        have hres_bd := memTM2_absHi hres hu
        set ah := tmAbsHi (tmSub tmOne (tmMul a p))
        have hfu_pos := hf_pos u hu
        have hident : (f u)⁻¹ - pFun u = (1 - f u * pFun u) / f u := by
          field_simp [hfu_pos.ne']
        rw [show ((ic : ℝ) + (d2 : ℝ) * u + (q2 : ℝ) * u ^ 2) / (D64 : ℝ) = pFun u from rfl,
          hident, abs_div, abs_of_pos hfu_pos]
        have hD := D64_pos
        calc |1 - f u * pFun u| / f u
            ≤ ((ah : ℝ) / (D64 : ℝ)) / ((loN : ℝ) / (D64 : ℝ)) :=
              div_le_div₀ (by positivity) hres_bd (div_pos hlo_posR hD) (hf_ge u hu)
          _ = (ah : ℝ) / (loN : ℝ) := by field_simp [hD.ne']
          _ = (((Nat.mul ah D64N : ℕ) : ℝ) / (loN : ℝ)) / (D64 : ℝ) := by
              simp only [nat_mul_eq]; push_cast; rw [D64N_eq_R]; field_simp [hD.ne']
          _ ≤ (divUpNat (Nat.mul ah D64N) loN : ℝ) / (D64 : ℝ) :=
              div_le_div_of_nonneg_right (divUpNat_ge (Nat.mul ah D64N) loN hlo_pos) hD.le

/-! ### 3. Complex & `2 × 2` Taylor-model soundness -/

def memTMC (f : ℝ → ℂ) (Z : TMC) : Prop :=
  memTM2 (fun u => (f u).re) Z.re ∧ memTM2 (fun u => (f u).im) Z.im

private lemma memTMC_ofR {f : ℝ → ℝ} {a : TM2} (hf : memTM2 f a) :
    memTMC (fun u => (f u : ℂ)) (tmcOfR a) :=
  ⟨by simpa [tmcOfR] using hf, by simpa [tmcOfR] using memTM2_zero⟩

private lemma memTMC_one : memTMC (fun _ => (1 : ℂ)) tmcOne :=
  ⟨by simpa [tmcOne] using memTM2_one, by simpa [tmcOne] using memTM2_zero⟩

private lemma memTMC_add {f g : ℝ → ℂ} {Z W : TMC} (hf : memTMC f Z) (hg : memTMC g W) :
    memTMC (fun u => f u + g u) (tmcAdd Z W) :=
  ⟨by simpa [tmcAdd] using memTM2_add hf.1 hg.1, by simpa [tmcAdd] using memTM2_add hf.2 hg.2⟩

private lemma memTMC_sub {f g : ℝ → ℂ} {Z W : TMC} (hf : memTMC f Z) (hg : memTMC g W) :
    memTMC (fun u => f u - g u) (tmcSub Z W) :=
  ⟨by simpa [tmcSub] using memTM2_sub hf.1 hg.1, by simpa [tmcSub] using memTM2_sub hf.2 hg.2⟩

private lemma memTMC_neg {f : ℝ → ℂ} {Z : TMC} (hf : memTMC f Z) :
    memTMC (fun u => -f u) (tmcNeg Z) :=
  ⟨by simpa [tmcNeg] using memTM2_neg hf.1, by simpa [tmcNeg] using memTM2_neg hf.2⟩

private lemma memTMC_mul {f g : ℝ → ℂ} {Z W : TMC} (hf : memTMC f Z) (hg : memTMC g W) :
    memTMC (fun u => f u * g u) (tmcMul Z W) :=
  ⟨by simpa [tmcMul, Complex.mul_re] using memTM2_sub (memTM2_mul hf.1 hg.1) (memTM2_mul hf.2 hg.2),
   by simpa [tmcMul, Complex.mul_im] using memTM2_add (memTM2_mul hf.1 hg.2) (memTM2_mul hf.2 hg.1)⟩

private lemma memTM2_normSq {f : ℝ → ℂ} {Z : TMC} (hf : memTMC f Z) :
    memTM2 (fun u => Complex.normSq (f u)) (tmcNormSq Z) := by
  simpa [tmcNormSq, Complex.normSq_apply] using
    memTM2_add (memTM2_mul hf.1 hf.1) (memTM2_mul hf.2 hf.2)

private lemma memTMC_horner {x : ℝ → ℂ} {X : TMC} (hx : memTMC x X) :
    ∀ (pl : List ℚ),
      memTMC (fun u => Polynomial.aeval (x u) (ofListQ pl)) (tmcHorner X (pl.map ofRatTM))
  | [] => by
    simp only [List.map_nil, tmcHorner, ofListQ, map_zero]
    exact ⟨memTM2_zero, memTM2_zero⟩
  | c :: cs => by
    simp only [List.map_cons, tmcHorner, ofListQ, map_add, map_mul, Polynomial.aeval_C,
      Polynomial.aeval_X, Complex.coe_algebraMap]
    exact memTMC_add (memTMC_ofR (memTM2_ofRatTM c)) (memTMC_mul hx (memTMC_horner hx cs))

private lemma memTMC_evalOddPoly {x : ℝ → ℂ} {X : TMC} (hx : memTMC x X) (pl : List ℚ) :
    memTMC (fun u => x u * Polynomial.aeval (x u ^ 2) (ofListQ pl))
      (evalOddPoly (pl.map ofRatTM) X) := by
  simpa only [evalOddPoly, sq] using memTMC_mul hx (memTMC_horner (memTMC_mul hx hx) pl)

def memSCT (R : ℝ → Sym2C) (RT : SCT) : Prop :=
  memTMC (fun u => (R u).a) RT.a ∧ memTMC (fun u => (R u).b) RT.b ∧ memTMC (fun u => (R u).c) RT.c

private lemma memSCT_evalRSmoothed {ctQ stQ seQ : ℚ} {pl ql : List ℚ} {t : ℝ → ℂ} {T : TMC}
    (ht : memTMC t T) :
    memSCT (fun u => RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (ofListQ pl) (ofListQ ql) (t u))
      (evalRSmoothed (mkSmoothedTMData ctQ stQ seQ pl ql) T) := by
  set m00Q : ℚ := ctQ * ctQ + seQ * stQ * stQ
  set m01Q : ℚ := ctQ * stQ * (1 - seQ)
  set m11Q : ℚ := stQ * stQ + seQ * ctQ * ctQ
  have hm00 : (m00Q : ℝ) = m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) := by
    simp [m00Q, m00Sym]; ring
  have hm01 : (m01Q : ℝ) = m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) := by
    simp [m01Q, m01Sym]
  have hm11 : (m11Q : ℝ) = m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) := by
    simp [m11Q, m11Sym]; ring
  have hp := memTMC_evalOddPoly ht pl
  have hq := memTMC_evalOddPoly ht ql
  have hlc : ∀ {c1 c2 : ℚ} {a b : TM2} {pF qF : ℝ → ℂ} {pT qT : TMC},
      memTM2 (fun _ => (c1 : ℝ)) a → memTM2 (fun _ => (c2 : ℝ)) b →
      memTMC pF pT → memTMC qF qT →
      memTMC (fun u => ((c1 : ℝ) : ℂ) * pF u + ((c2 : ℝ) : ℂ) * qF u)
        ⟨tmAdd (tmMul a pT.re) (tmMul b qT.re), tmAdd (tmMul a pT.im) (tmMul b qT.im)⟩ :=
    fun hc1 hc2 hp' hq' =>
      ⟨by simpa only [Complex.add_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
            zero_mul, sub_zero] using memTM2_add (memTM2_mul hc1 hp'.1) (memTM2_mul hc2 hq'.1),
       by simpa only [Complex.add_im, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
            zero_mul, add_zero] using memTM2_add (memTM2_mul hc1 hp'.2) (memTM2_mul hc2 hq'.2)⟩
  have h00 := hlc (memTM2_ofRatTM (m00Q * m00Q)) (memTM2_ofRatTM (m01Q * m01Q)) hp hq
  have h01 := hlc (memTM2_ofRatTM (m00Q * m01Q)) (memTM2_ofRatTM (m01Q * m11Q)) hp hq
  have h11 := hlc (memTM2_ofRatTM (m01Q * m01Q)) (memTM2_ofRatTM (m11Q * m11Q)) hp hq
  unfold memSCT evalRSmoothed mkSmoothedTMData; dsimp only
  refine ⟨?_, ?_, ?_⟩
  · have heq : (fun u => (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (ofListQ pl) (ofListQ ql) (t u)).a) =
        fun u => ((m00Q * m00Q : ℚ) : ℝ) * (t u * Polynomial.aeval (t u ^ 2) (ofListQ pl)) +
          ((m01Q * m01Q : ℚ) : ℝ) * (t u * Polynomial.aeval (t u ^ 2) (ofListQ ql)) := by
      funext u; simp only [RtGen, ← hm00, ← hm01]; push_cast; ring
    rw [heq]; exact h00
  · have heq : (fun u => (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (ofListQ pl) (ofListQ ql) (t u)).b) =
        fun u => ((m00Q * m01Q : ℚ) : ℝ) * (t u * Polynomial.aeval (t u ^ 2) (ofListQ pl)) +
          ((m01Q * m11Q : ℚ) : ℝ) * (t u * Polynomial.aeval (t u ^ 2) (ofListQ ql)) := by
      funext u; simp only [RtGen, ← hm00, ← hm01, ← hm11]; push_cast; ring
    rw [heq]; exact h01
  · have heq : (fun u => (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (ofListQ pl) (ofListQ ql) (t u)).c) =
        fun u => ((m01Q * m01Q : ℚ) : ℝ) * (t u * Polynomial.aeval (t u ^ 2) (ofListQ pl)) +
          ((m11Q * m11Q : ℚ) : ℝ) * (t u * Polynomial.aeval (t u ^ 2) (ofListQ ql)) := by
      funext u; simp only [RtGen, ← hm01, ← hm11]; push_cast; ring
    rw [heq]; exact h11

private lemma memTMC_circleTM {rhoQ : ℚ} {sm h : ℤ} {tT : TMC} {onePs2T : TM2}
    (hc : circleTM (ofRatTM rhoQ) sm h = some (tT, onePs2T)) :
    let sFun : ℝ → ℝ := fun u => ((sm : ℝ) + (h : ℝ) * u) / (D64 : ℝ)
    memTMC (fun u => chartPt (rhoQ : ℝ) false (sFun u)) tT ∧
      memTM2 (fun u => 1 + (sFun u) ^ 2) onePs2T := by
  intro sFun
  unfold circleTM at hc
  dsimp only at hc
  set sTM : TM2 := ⟨sm, h, 0, 0⟩
  have hs : memTM2 sFun sTM := fun u _ => by
    simp only [sFun, sTM, Int.cast_zero, zero_mul, add_zero, Nat.cast_zero, zero_div, sub_self,
      abs_zero, le_refl]
  have hs2 : memTM2 (fun u => (sFun u) ^ 2) (tmMul sTM sTM) := by
    simpa only [sq] using memTM2_mul hs hs
  have h1s2 : memTM2 (fun u => 1 + (sFun u) ^ 2) (tmAdd tmOne (tmMul sTM sTM)) :=
    memTM2_add memTM2_one hs2
  cases hdi : tmInvPos (tmAdd tmOne (tmMul sTM sTM)) with
  | none => rw [hdi] at hc; simp at hc
  | some di =>
    rw [hdi] at hc
    injection hc with hpair
    obtain ⟨rfl, rfl⟩ := Prod.mk.inj hpair
    have hinv := (memTM2_invPos h1s2 hdi).2
    have hrho := memTM2_ofRatTM rhoQ
    have hx := memTM2_mul (memTM2_mul hrho (memTM2_sub memTM2_one hs2)) hinv
    have hy := memTM2_mul (memTM2_mul hrho (memTM2_double hs)) hinv
    refine ⟨⟨?_, ?_⟩, h1s2⟩
    · convert hx using 1
      funext u
      simp only [chartPt, sigB, Bool.false_eq_true, ↓reduceIte, one_mul, Complex.add_re,
        Complex.ofReal_re, Complex.mul_re, Complex.I_re, Complex.I_im, Complex.ofReal_im,
        mul_zero, mul_one, sub_zero, add_zero, div_eq_mul_inv]
    · convert hy using 1
      funext u
      simp only [chartPt, sigB, Bool.false_eq_true, ↓reduceIte, one_mul, Complex.add_im,
        Complex.ofReal_re, Complex.mul_im, Complex.I_re, Complex.I_im, Complex.ofReal_im,
        mul_zero, mul_one, zero_add, add_zero, div_eq_mul_inv]

/-! ### 4. Harmonic Maximum Principle for `KerPos` on the open disk `|t| < r` -/

private def dpm' (R : Sym2C) (σ : ℂ) : ℂ := (1 - σ * R.a) * (1 - σ * R.c) - (σ * R.b) ^ 2
private def invImC' (R : Sym2C) (σ : ℂ) : Sym2C :=
  ⟨(1 - σ * R.c) / dpm' R σ, σ * R.b / dpm' R σ, (1 - σ * R.a) / dpm' R σ⟩

private lemma re_sym_quad_ident (ma mb mc w1 w2 : ℂ) :
    (conj w1 * (ma * w1 + mb * w2) + conj w2 * (mb * w1 + mc * w2)).re =
      (ma.re * w1.re ^ 2 + 2 * mb.re * w1.re * w2.re + mc.re * w2.re ^ 2) +
      (ma.re * w1.im ^ 2 + 2 * mb.re * w1.im * w2.im + mc.re * w2.im ^ 2) := by
  simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im]
  ring

private lemma pd_pos_of_ne_zero {S : Sym2R} (hS : S.PD) {x y : ℝ} (hxy : x ≠ 0 ∨ y ≠ 0) :
    0 < S.a * x ^ 2 + 2 * S.b * x * y + S.c * y ^ 2 := by
  obtain ⟨ha, hd⟩ := hS
  simp only [det] at hd
  have hident : S.a * (S.a * x ^ 2 + 2 * S.b * x * y + S.c * y ^ 2) =
      (S.a * x + S.b * y) ^ 2 + (S.a * S.c - S.b ^ 2) * y ^ 2 := by ring
  have hpos : 0 < (S.a * x + S.b * y) ^ 2 + (S.a * S.c - S.b ^ 2) * y ^ 2 := by
    rcases hxy with hx | hy
    · by_cases hy0 : y = 0
      · subst hy0; simp only [mul_zero, add_zero, zero_pow two_ne_zero]
        exact sq_pos_of_ne_zero (mul_ne_zero ha.ne' hx)
      · positivity
    · positivity
  nlinarith

/-- If `I - σ Re(R) ≻ 0` (`σ = ±1`), then `det(I - σ R) ≠ 0` and `Re((I - σ R)⁻¹) ≻ 0`. -/
private lemma invImC_PD_of_re_PD {R : Sym2C} {σ : ℝ}
    (hA : (⟨1 - σ * R.a.re, -(σ * R.b.re), 1 - σ * R.c.re⟩ : Sym2R).PD) :
    dpm' R (σ : ℂ) ≠ 0 ∧ (SchurKernel.re (invImC' R (σ : ℂ))).PD := by
  set ma : ℂ := 1 - (σ : ℂ) * R.a
  set mb : ℂ := -((σ : ℂ) * R.b)
  set mc : ℂ := 1 - (σ : ℂ) * R.c
  have hmare : ma.re = 1 - σ * R.a.re := by simp [ma]
  have hmbre : mb.re = -(σ * R.b.re) := by simp [mb]
  have hmcre : mc.re = 1 - σ * R.c.re := by simp [mc]
  set A : Sym2R := ⟨1 - σ * R.a.re, -(σ * R.b.re), 1 - σ * R.c.re⟩
  have hquad : ∀ w1 w2 : ℂ, (w1 ≠ 0 ∨ w2 ≠ 0) →
      0 < (conj w1 * (ma * w1 + mb * w2) + conj w2 * (mb * w1 + mc * w2)).re := by
    intro w1 w2 hw
    rw [re_sym_quad_ident, hmare, hmbre, hmcre]
    have hnn1 : 0 ≤ A.a * w1.re ^ 2 + 2 * A.b * w1.re * w2.re + A.c * w2.re ^ 2 := by
      by_cases h0 : w1.re = 0 ∧ w2.re = 0
      · simp [h0.1, h0.2]
      · exact (pd_pos_of_ne_zero hA (not_and_or.1 h0)).le
    have hnn2 : 0 ≤ A.a * w1.im ^ 2 + 2 * A.b * w1.im * w2.im + A.c * w2.im ^ 2 := by
      by_cases h0 : w1.im = 0 ∧ w2.im = 0
      · simp [h0.1, h0.2]
      · exact (pd_pos_of_ne_zero hA (not_and_or.1 h0)).le
    by_cases hre : w1.re ≠ 0 ∨ w2.re ≠ 0
    · linarith [pd_pos_of_ne_zero hA hre]
    · push Not at hre
      have him : w1.im ≠ 0 ∨ w2.im ≠ 0 := by
        rcases hw with h1 | h2
        · left; intro hi; exact h1 (Complex.ext hre.1 hi)
        · right; intro hi; exact h2 (Complex.ext hre.2 hi)
      linarith [pd_pos_of_ne_zero hA him]
  have hdne : dpm' R (σ : ℂ) ≠ 0 := by
    intro hd0
    have hmc_det : ma * mc - mb ^ 2 = 0 := by
      simpa only [dpm', ma, mb, mc, neg_sq] using hd0
    by_cases hcb : mc ≠ 0 ∨ mb ≠ 0
    · have hw : mc ≠ 0 ∨ -mb ≠ 0 := by rwa [neg_ne_zero]
      have hpos := hquad mc (-mb) hw
      have hz1 : ma * mc + mb * (-mb) = 0 := by linear_combination hmc_det
      have hz2 : mb * mc + mc * (-mb) = 0 := by ring
      rw [hz1, hz2] at hpos; simp at hpos
    · push Not at hcb
      have hcr : A.c = 0 := by rw [show A.c = mc.re from hmcre.symm, hcb.1]; simp
      have hbr : A.b = 0 := by rw [show A.b = mb.re from hmbre.symm, hcb.2]; simp
      have := hA.2; simp only [det, hcr, hbr] at this; linarith
  refine ⟨hdne, ?_⟩
  set inv := invImC' R (σ : ℂ)
  have hinv_pos : ∀ v1 v2 : ℝ, (v1 ≠ 0 ∨ v2 ≠ 0) →
      0 < inv.a.re * v1 ^ 2 + 2 * inv.b.re * v1 * v2 + inv.c.re * v2 ^ 2 := by
    intro v1 v2 hv
    set w1 : ℂ := inv.a * (v1 : ℂ) + inv.b * (v2 : ℂ)
    set w2 : ℂ := inv.b * (v1 : ℂ) + inv.c * (v2 : ℂ)
    have hm1 : ma * w1 + mb * w2 = (v1 : ℂ) := by
      have hd' : dpm' R (σ : ℂ) ≠ 0 := hdne
      dsimp only [w1, w2, inv, invImC', ma, mb, mc]
      field_simp [hd']
      simp only [dpm']; ring
    have hm2 : mb * w1 + mc * w2 = (v2 : ℂ) := by
      have hd' : dpm' R (σ : ℂ) ≠ 0 := hdne
      dsimp only [w1, w2, inv, invImC', ma, mb, mc]
      field_simp [hd']
      simp only [dpm']; ring
    have hwne : w1 ≠ 0 ∨ w2 ≠ 0 := by
      by_contra h0; push Not at h0
      rw [h0.1, h0.2, mul_zero, mul_zero, add_zero] at hm1 hm2
      rcases hv with h1 | h2
      · exact h1 (by exact_mod_cast hm1.symm)
      · exact h2 (by exact_mod_cast hm2.symm)
    have hpos := hquad w1 w2 hwne
    rw [hm1, hm2] at hpos
    have heq : (conj w1 * (v1 : ℂ) + conj w2 * (v2 : ℂ)).re =
        inv.a.re * v1 ^ 2 + 2 * inv.b.re * v1 * v2 + inv.c.re * v2 ^ 2 := by
      simp only [w1, w2, Complex.add_re, Complex.mul_re, Complex.conj_re, Complex.conj_im,
        Complex.ofReal_re, Complex.ofReal_im]
      ring
    linarith
  have ha_pos : 0 < (SchurKernel.re inv).a := by
    simpa [SchurKernel.re] using hinv_pos 1 0 (Or.inl one_ne_zero)
  have hdet_pos : 0 < (SchurKernel.re inv).det := by
    have h := hinv_pos (-inv.b.re) inv.a.re (Or.inr ha_pos.ne')
    have hid : inv.a.re * (-inv.b.re) ^ 2 + 2 * inv.b.re * (-inv.b.re) * inv.a.re +
        inv.c.re * inv.a.re ^ 2 = inv.a.re * (SchurKernel.re inv).det := by
      simp only [SchurKernel.re, det]; ring
    rw [hid] at h
    exact (pos_iff_pos_of_mul_pos h).1 ha_pos
  exact ⟨ha_pos, hdet_pos⟩

/-- If `I - Re(R) ≻ 0` and `I + Re(R) ≻ 0`, then `∃ l > 0, KerPos R l`. -/
private lemma kerPos_of_re_contractive {R : Sym2C}
    (hM : (⟨1 - R.a.re, -R.b.re, 1 - R.c.re⟩ : Sym2R).PD)
    (hP : (⟨1 + R.a.re, R.b.re, 1 + R.c.re⟩ : Sym2R).PD) :
    ∃ l > 0, KerPos R l := by
  obtain ⟨hp, hIp⟩ := invImC_PD_of_re_PD (R := R) (σ := 1) (by simpa using hM)
  obtain ⟨hm, hIm⟩ := invImC_PD_of_re_PD (R := R) (σ := -1) (by simpa [sub_eq_add_neg] using hP)
  simp only [Complex.ofReal_one, Complex.ofReal_neg] at hp hm hIp hIm
  set Sp := SchurKernel.re (invImC' R 1)
  set Sm := SchurKernel.re (invImC' R (-1))
  have hq : ∀ {S : Sym2R}, S.PD → ∀ v : ℝ × ℝ, S.det / (S.a + S.c) * (v.1 ^ 2 + v.2 ^ 2) ≤ S.q v := by
    intro S hS v
    obtain ⟨ha, hd⟩ := hS
    have hc : 0 < S.c := by simp only [det] at hd; nlinarith [sq_nonneg S.b]
    have hid : (S.a + S.c) * S.q v - S.det * (v.1 ^ 2 + v.2 ^ 2) =
        (S.a * v.1 + S.b * v.2) ^ 2 + (S.b * v.1 + S.c * v.2) ^ 2 := by
      simp only [q, bil, det]; ring
    rw [div_mul_eq_mul_div, div_le_iff₀ (by linarith)]
    nlinarith [sq_nonneg (S.a * v.1 + S.b * v.2), sq_nonneg (S.b * v.1 + S.c * v.2)]
  have hμp : 0 < Sp.det / (Sp.a + Sp.c) := by
    have hc : 0 < Sp.c := by have := hIp.2; simp only [det] at this; nlinarith [sq_nonneg Sp.b, hIp.1]
    exact div_pos hIp.2 (by linarith [hIp.1])
  have hμm : 0 < Sm.det / (Sm.a + Sm.c) := by
    have hc : 0 < Sm.c := by have := hIm.2; simp only [det] at this; nlinarith [sq_nonneg Sm.b, hIm.1]
    exact div_pos hIm.2 (by linarith [hIm.1])
  refine ⟨min (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c)), lt_min hμp hμm, fun x y => ?_⟩
  have hdet_eq : R.detIm = dpm' R 1 * dpm' R (-1) := by
    simp only [Sym2C.detIm, Sym2C.sq, dpm']; ring
  have hAeq : R.Amat = ⟨((invImC' R 1).a + (invImC' R (-1)).a) / 2,
      ((invImC' R 1).b + (invImC' R (-1)).b) / 2,
      ((invImC' R 1).c + (invImC' R (-1)).c) / 2⟩ := by
    simp only [Sym2C.Amat, Sym2C.sq, invImC', hdet_eq]
    congr 1 <;> field_simp [hp, hm] <;> simp only [dpm'] <;> ring
  have hCeq : R.Cmat = ⟨((invImC' R 1).a - (invImC' R (-1)).a) / 2,
      ((invImC' R 1).b - (invImC' R (-1)).b) / 2,
      ((invImC' R 1).c - (invImC' R (-1)).c) / 2⟩ := by
    simp only [Sym2C.Cmat]; rw [hAeq]; simp only [invImC']
    congr 1 <;> field_simp [hp, hm] <;> simp only [dpm'] <;> ring
  have hid : R.Amat.form x x + R.Amat.form y y - 2 * R.Cmat.form x y =
      ((invImC' R 1).form (x.1 - y.1, x.2 - y.2) (x.1 - y.1, x.2 - y.2) +
        (invImC' R (-1)).form (x.1 + y.1, x.2 + y.2) (x.1 + y.1, x.2 + y.2)) / 2 := by
    rw [hAeq, hCeq]; simp only [Sym2C.form]; push_cast; ring
  have hre_form : ∀ (S : Sym2C) (v : ℝ × ℝ), (S.form v v).re = (SchurKernel.re S).q v := fun S v => by
    simp only [Sym2C.form, SchurKernel.re, q, bil, Complex.add_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, Complex.mul_im, Complex.add_im, mul_zero, zero_mul, add_zero, sub_zero]
  rw [hid, Complex.div_ofNat_re, Complex.add_re, hre_form, hre_form]
  have h1 := hq hIp (x.1 - y.1, x.2 - y.2)
  have h2 := hq hIm (x.1 + y.1, x.2 + y.2)
  have m1 := min_le_left (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c))
  have m2 := min_le_right (Sp.det / (Sp.a + Sp.c)) (Sm.det / (Sm.a + Sm.c))
  simp only at h1 h2
  nlinarith [sq_nonneg (x.1 - y.1), sq_nonneg (x.2 - y.2), sq_nonneg (x.1 + y.1), sq_nonneg (x.2 + y.2)]

/-- Symmetries of `RtGen`: `RtGen (-t) = -RtGen t` and `RtGen (conj t) = conj (RtGen t)`. -/
private lemma RtGen_neg (m00 m01 m11 : ℝ) (P Q : ℝ[X]) (t : ℂ) :
    let R := RtGen m00 m01 m11 P Q t
    RtGen m00 m01 m11 P Q (-t) = ⟨-R.a, -R.b, -R.c⟩ := by
  simp only [RtGen, neg_sq]; congr 1 <;> ring

private lemma aeval_conj_real (P : ℝ[X]) (z : ℂ) :
    Polynomial.aeval (conj z) P = conj (Polynomial.aeval z P) := by
  rw [Polynomial.aeval_def, Polynomial.aeval_def, Polynomial.eval₂_eq_sum, Polynomial.eval₂_eq_sum,
    Polynomial.sum_def, Polynomial.sum_def, map_sum]
  refine Finset.sum_congr rfl fun n _ => ?_
  simp only [map_mul, map_pow, Complex.coe_algebraMap, Complex.conj_ofReal]

private lemma RtGen_conj (m00 m01 m11 : ℝ) (P Q : ℝ[X]) (t : ℂ) :
    let R := RtGen m00 m01 m11 P Q t
    RtGen m00 m01 m11 P Q (conj t) = ⟨conj R.a, conj R.b, conj R.c⟩ := by
  have hP : Polynomial.aeval ((conj t) ^ 2) P = conj (Polynomial.aeval (t ^ 2) P) := by
    rw [← map_pow (starRingEnd ℂ) t 2, aeval_conj_real]
  have hQ : Polynomial.aeval ((conj t) ^ 2) Q = conj (Polynomial.aeval (t ^ 2) Q) := by
    rw [← map_pow (starRingEnd ℂ) t 2, aeval_conj_real]
  simp only [RtGen, map_add, map_mul, map_pow, hP, hQ, Complex.conj_ofReal]

private lemma differentiable_odd_poly (P : ℝ[X]) :
    Differentiable ℂ fun t : ℂ => t * Polynomial.aeval (t ^ 2) P := by
  have : (fun t : ℂ => Polynomial.aeval (t ^ 2) P) =
      fun t : ℂ => (P.map (algebraMap ℝ ℂ)).eval (t ^ 2) := by
    funext t; rw [Polynomial.aeval_def, Polynomial.eval₂_eq_eval_map]
  have h2 : Differentiable ℂ fun t : ℂ => Polynomial.aeval (t ^ 2) P := by
    rw [this]; simp_rw [Polynomial.eval_eq_sum_range]; fun_prop
  exact differentiable_id.mul h2

/-- **Harmonic Maximum Principle**: if `I ± Re(RtGen t) ≻ 0` on the Q1 boundary arc
`{chartPt r false s | s ∈ [0, 1]}`, then `KerPos (RtGen t)` holds on the entire open disk `|t| < r`. -/
theorem kerPos_on_ball_of_reContractive_Q1 {m00 m01 m11 r : ℝ} {P Q : ℝ[X]} (hr : 0 < r)
    (hQ1 : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      let R := RtGen m00 m01 m11 P Q (chartPt r false s)
      (⟨1 - R.a.re, -R.b.re, 1 - R.c.re⟩ : Sym2R).PD ∧
      (⟨1 + R.a.re, R.b.re, 1 + R.c.re⟩ : Sym2R).PD) :
    ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (RtGen m00 m01 m11 P Q t) l := by
  set Rfn := RtGen m00 m01 m11 P Q
  -- Step 1: extend from Q1 chart `s ∈ [0, 1]` to the entire sphere `‖t‖ = r` via `t ↦ ±t, ±conj t`
  have hsphere : ∀ t ∈ Metric.sphere (0 : ℂ) r,
      (⟨1 - (Rfn t).a.re, -(Rfn t).b.re, 1 - (Rfn t).c.re⟩ : Sym2R).PD ∧
      (⟨1 + (Rfn t).a.re, (Rfn t).b.re, 1 + (Rfn t).c.re⟩ : Sym2R).PD := by
    intro t ht
    rw [Metric.mem_sphere, dist_zero_right] at ht
    have hnorm : t.re ^ 2 + t.im ^ 2 = r ^ 2 := by
      have := Complex.normSq_eq_norm_sq t
      rw [Complex.normSq_apply, ht] at this
      linarith
    -- Reduce to first quadrant `t₀ = |t.re| + i |t.im|`
    set t0 : ℂ := ⟨|t.re|, |t.im|⟩
    have ht0_norm : t0.re ^ 2 + t0.im ^ 2 = r ^ 2 := by simp [t0, sq_abs, hnorm]
    have ht0_chart : ∃ s ∈ Set.Icc (0 : ℝ) 1, t0 = chartPt r false s := by
      set s : ℝ := t0.im / (r + t0.re)
      have hden : 0 < r + t0.re := by simp only [t0]; linarith [abs_nonneg t.re]
      have hs0 : 0 ≤ s := div_nonneg (abs_nonneg t.im) hden.le
      have hs1 : s ≤ 1 := by
        rw [div_le_one hden]
        have h1 : t0.im ≤ r := by nlinarith [sq_nonneg t0.re, abs_nonneg t.im]
        linarith [show (0 : ℝ) ≤ t0.re from abs_nonneg t.re]
      refine ⟨s, ⟨hs0, hs1⟩, ?_⟩
      have h1s2 : 1 + s ^ 2 = 2 * r / (r + t0.re) := by
        dsimp only [s]; field_simp [hden.ne']; nlinarith [ht0_norm]
      have h1ms2 : 1 - s ^ 2 = 2 * t0.re / (r + t0.re) := by
        dsimp only [s]; field_simp [hden.ne']; nlinarith [ht0_norm]
      apply Complex.ext
      · simp only [chartPt, sigB, Bool.false_eq_true, ↓reduceIte, one_mul, Complex.add_re,
          Complex.ofReal_re, Complex.mul_re, Complex.I_re, Complex.I_im, Complex.ofReal_im,
          mul_zero, mul_one, sub_zero, add_zero]
        rw [h1ms2, h1s2]; field_simp [hden.ne', hr.ne']
      · simp only [chartPt, sigB, Bool.false_eq_true, ↓reduceIte, one_mul, Complex.add_im,
          Complex.ofReal_re, Complex.mul_im, Complex.I_re, Complex.I_im, Complex.ofReal_im,
          mul_zero, mul_one, zero_add, add_zero]
        rw [h1s2]; dsimp only [s]; field_simp [hden.ne', hr.ne']
    obtain ⟨s, hs, ht0_eq⟩ := ht0_chart
    have h0 := hQ1 s hs
    rw [← ht0_eq] at h0
    -- Connect `t` to `t0` via sign of `t.re` and `t.im`
    have hconj_eq : ∀ z : ℂ,
        (Rfn (conj z)).a.re = (Rfn z).a.re ∧
        (Rfn (conj z)).b.re = (Rfn z).b.re ∧
        (Rfn (conj z)).c.re = (Rfn z).c.re := fun z => by
      have h := RtGen_conj m00 m01 m11 P Q z; dsimp only at h
      simp [Rfn, h]
    have hneg_eq : ∀ z : ℂ,
        (Rfn (-z)).a.re = -(Rfn z).a.re ∧
        (Rfn (-z)).b.re = -(Rfn z).b.re ∧
        (Rfn (-z)).c.re = -(Rfn z).c.re := fun z => by
      have h := RtGen_neg m00 m01 m11 P Q z; dsimp only at h
      simp [Rfn, h]
    rcases le_total 0 t.re with hre | hre <;> rcases le_total 0 t.im with him | him
    · have ht_eq : t = t0 := Complex.ext (by simp [t0, abs_of_nonneg hre]) (by simp [t0, abs_of_nonneg him])
      rwa [ht_eq]
    · have ht_eq : t = conj t0 :=
        Complex.ext (by simp [t0, abs_of_nonneg hre]) (by simp [t0, abs_of_nonpos him])
      rw [ht_eq, (hconj_eq t0).1, (hconj_eq t0).2.1, (hconj_eq t0).2.2]; exact h0
    · have ht_eq : t = -conj t0 :=
        Complex.ext (by simp [t0, abs_of_nonpos hre]) (by simp [t0, abs_of_nonneg him])
      rw [ht_eq, (hneg_eq _).1, (hneg_eq _).2.1, (hneg_eq _).2.2,
        (hconj_eq t0).1, (hconj_eq t0).2.1, (hconj_eq t0).2.2]
      simpa [sub_neg_eq_add, sub_eq_add_neg] using h0.symm
    · have ht_eq : t = -t0 :=
        Complex.ext (by simp [t0, abs_of_nonpos hre]) (by simp [t0, abs_of_nonpos him])
      rw [ht_eq, (hneg_eq _).1, (hneg_eq _).2.1, (hneg_eq _).2.2]
      simpa [sub_neg_eq_add, sub_eq_add_neg] using h0.symm
  -- Step 2: maximum modulus principle on `exp(± v^T Rfn(t) v)` for every nonzero real `v = (v1, v2)`
  have hdiffR : Differentiable ℂ (fun t => (Rfn t).a) ∧ Differentiable ℂ (fun t => (Rfn t).b) ∧
      Differentiable ℂ (fun t => (Rfn t).c) := by
    have hP := differentiable_odd_poly P; have hQ := differentiable_odd_poly Q
    refine ⟨?_, ?_, ?_⟩ <;> (dsimp only [Rfn, RtGen]; fun_prop)
  have hquad_ball : ∀ (t : ℂ), t ∈ Metric.ball (0 : ℂ) r → ∀ (σ : ℝ), (σ = 1 ∨ σ = -1) →
      ∀ v1 v2 : ℝ, (v1 ≠ 0 ∨ v2 ≠ 0) →
        σ * ((Rfn t).a.re * v1 ^ 2 + 2 * (Rfn t).b.re * v1 * v2 + (Rfn t).c.re * v2 ^ 2) <
          v1 ^ 2 + v2 ^ 2 := by
    intro t ht σ hσ v1 v2 hv
    set g : ℂ → ℂ := fun z =>
      (σ : ℂ) * ((Rfn z).a * (v1 : ℂ) ^ 2 + 2 * (Rfn z).b * (v1 : ℂ) * (v2 : ℂ) +
        (Rfn z).c * (v2 : ℂ) ^ 2)
    have hgre : ∀ z : ℂ, (g z).re =
        σ * ((Rfn z).a.re * v1 ^ 2 + 2 * (Rfn z).b.re * v1 * v2 + (Rfn z).c.re * v2 ^ 2) := fun z => by
      simp only [g, sq, Complex.mul_re, Complex.mul_im, Complex.add_re, Complex.add_im,
        Complex.ofReal_re, Complex.ofReal_im, Complex.re_ofNat, Complex.im_ofNat]
      ring
    have hdg : Differentiable ℂ g := by
      have ⟨ha, hb, hc⟩ := hdiffR; dsimp only [g]; fun_prop
    have hcont : Continuous (fun z => (g z).re) := Complex.continuous_re.comp hdg.continuous
    have hne_sph : (Metric.sphere (0 : ℂ) r).Nonempty := ⟨(r : ℂ), by
      rw [Metric.mem_sphere, dist_zero_right, Complex.norm_of_nonneg hr.le]⟩
    obtain ⟨z0, hz0, hz0max⟩ :=
      (isCompact_sphere (0 : ℂ) r).exists_isMaxOn hne_sph hcont.continuousOn
    have hlt_max : (g z0).re < v1 ^ 2 + v2 ^ 2 := by
      rw [hgre]
      have hs0 := hsphere z0 hz0
      rcases hσ with rfl | rfl
      · have hp := pd_pos_of_ne_zero hs0.1 hv; linarith
      · have hp := pd_pos_of_ne_zero hs0.2 hv; linarith
    set f : ℂ → ℂ := fun z => Complex.exp (g z)
    have hdf : Differentiable ℂ f := Complex.differentiable_exp.comp hdg
    have hfront : ∀ z ∈ frontier (Metric.ball (0 : ℂ) r), ‖f z‖ ≤ Real.exp ((g z0).re) := by
      intro z hz
      have hzs : z ∈ Metric.sphere (0 : ℂ) r := frontier_ball_subset_sphere hz
      rw [Complex.norm_exp]
      exact Real.exp_le_exp.2 (hz0max hzs)
    have hmax := Complex.norm_le_of_forall_mem_frontier_norm_le Metric.isBounded_ball
      hdf.diffContOnCl hfront (subset_closure ht)
    rw [Complex.norm_exp, Real.exp_le_exp] at hmax
    rw [← hgre]; exact lt_of_le_of_lt hmax hlt_max
  -- Step 3: deduce `I ± Re(Rfn t) ≻ 0` on `ball 0 r`, then `KerPos`
  intro t ht
  have hPD_of_quad : ∀ (S : Sym2R),
      (∀ v1 v2 : ℝ, (v1 ≠ 0 ∨ v2 ≠ 0) → 0 < S.a * v1 ^ 2 + 2 * S.b * v1 * v2 + S.c * v2 ^ 2) →
      S.PD := fun S hq => by
    have ha : 0 < S.a := by simpa using hq 1 0 (Or.inl one_ne_zero)
    have hd : 0 < S.det := by
      have h := hq (-S.b) S.a (Or.inr ha.ne')
      have hid : S.a * (-S.b) ^ 2 + 2 * S.b * (-S.b) * S.a + S.c * S.a ^ 2 = S.a * S.det := by
        simp only [det]; ring
      rw [hid] at h; exact (pos_iff_pos_of_mul_pos h).1 ha
    exact ⟨ha, hd⟩
  refine kerPos_of_re_contractive (hPD_of_quad _ fun v1 v2 hv => ?_) (hPD_of_quad _ fun v1 v2 hv => ?_)
  · have := hquad_ball t ht 1 (Or.inl rfl) v1 v2 hv; linarith
  · have := hquad_ball t ht (-1) (Or.inr rfl) v1 v2 hv; linarith

/-! ### 5. Soundness of `regQ1SmoothedOK` and `regQ1DiagOK` -/

private lemma checkPartBool_sound (unit : ℕ) (leafOK : ℤ → ℤ → Bool) (P : ℝ → Prop)
    (hleaf : ∀ (pos w : ℕ), leafOK (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) = true →
      ∀ s : ℝ, ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s →
        s ≤ (((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) → P s) :
    ∀ (steps : List ℕ) (pos : ℕ),
      steps ≠ [] →
      checkPartBool unit leafOK pos steps = true →
      ∀ s : ℝ, ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s →
        s ≤ (((pos + sumNatList steps : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) → P s
  | [], _, hne, _, _, _, _ => absurd rfl hne
  | [w], pos, _, hok, s, h1, h2 => by
    simp only [checkPartBool, Bool.and_true] at hok
    simp only [sumNatList, nat_add_eq, add_zero] at h2
    exact hleaf pos w hok s h1 h2
  | w :: w2 :: rest, pos, _, hok, s, h1, h2 => by
    unfold checkPartBool at hok; dsimp only at hok; rw [Bool.and_eq_true] at hok
    set mid : ℝ := (((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ)
    rcases le_total s mid with hsm | hms
    · exact hleaf pos w hok.1 s h1 hsm
    · have h2' : s ≤ ((((pos + w) + sumNatList (w2 :: rest) : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := by
        simpa only [sumNatList, nat_add_eq, Nat.add_assoc] using h2
      exact checkPartBool_sound unit leafOK P hleaf (w2 :: rest) (pos + w) (List.cons_ne_nil _ _) hok.2 s hms h2'

private lemma unit_mul_pow2 {k : ℕ} (hk : k ≤ 63) :
    2 * 2 ^ k * (Nat.div D64N (Nat.mul 2 (Nat.pow 2 k))) = D64N := by
  have hD : D64N = 2 ^ 64 := by norm_num [D64N]
  have hpow : Nat.mul 2 (Nat.pow 2 k) = 2 ^ (k + 1) := by
    simp only [nat_mul_eq, nat_pow_eq, pow_succ']
  rw [hpow, hD, nat_div_eq, Nat.pow_div (by omega) (by norm_num),
    show 2 * 2 ^ k = 2 ^ (k + 1) by rw [pow_succ'], ← pow_add]
  congr 1; omega

private lemma param_s_in_leaf {unit pos w : ℕ} {s : ℝ} (hw : 0 < w) (hu_pos : 0 < unit)
    (h1 : ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s)
    (h2 : s ≤ (((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ)) :
    ∃ u : ℝ, |u| ≤ 1 ∧
      s = (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) +
           ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) * u) / (D64 : ℝ) := by
  set sm : ℝ := (((2 * pos + w) * unit : ℕ) : ℝ)
  set h : ℝ := ((w * unit : ℕ) : ℝ)
  have hh : 0 < h := by dsimp only [h]; positivity
  set u : ℝ := (s * (D64 : ℝ) - sm) / h
  have hD := D64_pos
  have h1' : (pos : ℝ) * 2 * (unit : ℝ) ≤ s * (D64 : ℝ) := (div_le_iff₀ hD).1 h1
  have h2' : s * (D64 : ℝ) ≤ ((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ) := (le_div_iff₀ hD).1 h2
  have hsm_h : sm - h = (pos : ℝ) * 2 * (unit : ℝ) := by dsimp only [sm, h]; push_cast; ring
  have hsm_ph : sm + h = ((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ) := by dsimp only [sm, h]; push_cast; ring
  refine ⟨u, abs_le.2 ⟨?_, ?_⟩, ?_⟩
  · dsimp only [u]; rw [le_div_iff₀ hh]; linarith
  · dsimp only [u]; rw [div_le_iff₀ hh]; linarith
  · dsimp only [u, sm, h]
    simp only [Int.ofNat_eq_natCast, nat_add_eq, nat_mul_eq]
    push_cast; field_simp [hh.ne', hD.ne']; ring

private lemma param_s_zero_width {unit pos : ℕ} {s : ℝ}
    (h1 : ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s)
    (h2 : s ≤ (((pos + 0 : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ)) :
    s = (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) 0) unit) : ℤ) : ℝ) +
         ((Int.ofNat (Nat.mul 0 unit) : ℤ) : ℝ) * 0) / (D64 : ℝ) := by
  have hs : s = ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := le_antisymm (by simpa using h2) h1
  rw [hs]; simp only [Int.ofNat_eq_natCast, nat_add_eq, nat_mul_eq]; push_cast; ring

private lemma exists_u_of_leaf {unit pos w : ℕ} {s : ℝ} (hu_pos : 0 < unit)
    (h1 : ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s)
    (h2 : s ≤ (((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ)) :
    ∃ u : ℝ, |u| ≤ 1 ∧
      s = (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) +
           ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) * u) / (D64 : ℝ) := by
  rcases Nat.eq_zero_or_pos w with rfl | hw
  · exact ⟨0, by norm_num, param_s_zero_width h1 h2⟩
  · exact param_s_in_leaf hw hu_pos h1 h2

private lemma reContractive2x2_sound {R : ℝ → Sym2C} {RT : SCT} (hR : memSCT R RT)
    (hok : reContractive2x2 RT = true) {u : ℝ} (hu : |u| ≤ 1) :
    (⟨1 - (R u).a.re, -(R u).b.re, 1 - (R u).c.re⟩ : Sym2R).PD ∧
    (⟨1 + (R u).a.re, (R u).b.re, 1 + (R u).c.re⟩ : Sym2R).PD := by
  simp only [reContractive2x2, Bool.and_eq_true] at hok
  obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := hok
  have hma := memTM2_sub memTM2_one hR.1.1
  have hmc := memTM2_sub memTM2_one hR.2.2.1
  have hpa := memTM2_add memTM2_one hR.1.1
  have hpc := memTM2_add memTM2_one hR.2.2.1
  have hb2 := memTM2_mul hR.2.1.1 hR.2.1.1
  refine ⟨⟨pos_of_tmLo_pos hma h1 hu, ?_⟩, ⟨pos_of_tmLo_pos hpa h3 hu, ?_⟩⟩
  · have := pos_of_tmLo_pos (memTM2_sub (memTM2_mul hma hmc) hb2) h2 hu
    simpa only [det, sq, neg_mul_neg] using this
  · have := pos_of_tmLo_pos (memTM2_sub (memTM2_mul hpa hpc) hb2) h4 hu
    simpa only [det, sq] using this

private lemma ofListQ_map_neg' : ∀ l : List ℚ, ofListQ (l.map (- ·)) = -ofListQ l
  | [] => by simp [ofListQ]
  | a :: l => by
    simp only [List.map_cons, ofListQ, ofListQ_map_neg' l, Rat.cast_neg, map_neg, mul_neg]; ring

theorem kerPos_on_ball_of_regQ1SmoothedOK {ctQ stQ seQ : ℚ} {pl ql : List ℚ} {regRQ : ℚ}
    {k : ℕ} {steps : List ℕ} (hr : 0 < (regRQ : ℝ))
    (hok : regQ1SmoothedOK ctQ stQ seQ pl ql regRQ k steps = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (regRQ : ℝ),
      ∃ l > 0, KerPos (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (ofListQ pl) (ofListQ ql) t) l := by
  unfold regQ1SmoothedOK at hok
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hk, hsum⟩, hpart⟩ := hok
  set M := Nat.pow 2 k
  set unit := Nat.div D64N (Nat.mul 2 M)
  have hMpos : 0 < M := by dsimp only [M]; rw [nat_pow_eq]; positivity
  have hne : steps ≠ [] := by intro h; rw [h] at hsum; simp [sumNatList] at hsum; omega
  have hunit_mul : 2 * M * unit = D64N := by simpa [M, unit, nat_pow_eq] using unit_mul_pow2 hk
  have hunit_pos : 0 < unit := by
    by_contra h0; push Not at h0
    have hu0 : unit = 0 := by omega
    rw [hu0, mul_zero] at hunit_mul; norm_num [D64N] at hunit_mul
  refine kerPos_on_ball_of_reContractive_Q1 hr fun s hs => ?_
  have hs0 : ((0 : ℕ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s := by simpa using hs.1
  have hs1 : s ≤ (((0 + sumNatList steps : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := by
    rw [zero_add, hsum]
    have hmulR : (M : ℝ) * 2 * (unit : ℝ) = (D64 : ℝ) := by
      rw [← D64N_eq_R, ← hunit_mul]; push_cast; ring
    rw [hmulR, div_self D64_pos.ne']; exact hs.2
  refine checkPartBool_sound unit _
    (fun s =>
      let R := RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (ofListQ pl) (ofListQ ql) (chartPt (regRQ : ℝ) false s)
      (⟨1 - R.a.re, -R.b.re, 1 - R.c.re⟩ : Sym2R).PD ∧
      (⟨1 + R.a.re, R.b.re, 1 + R.c.re⟩ : Sym2R).PD)
    (fun pos w hleaf s' h1 h2 => ?_) steps 0 hne hpart s hs0 hs1
  obtain ⟨u, hu, hs'_eq⟩ := exists_u_of_leaf hunit_pos h1 h2
  cases hc : circleTM (ofRatTM regRQ) (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
      (Int.ofNat (Nat.mul w unit)) with
  | none => rw [hc] at hleaf; simp at hleaf
  | some p =>
    rw [hc] at hleaf
    have hct := (memTMC_circleTM hc).1
    have hRt := memSCT_evalRSmoothed (ctQ := ctQ) (stQ := stQ) (seQ := seQ) (pl := pl) (ql := ql) hct
    have hpd := reContractive2x2_sound hRt hleaf hu
    simpa only [← hs'_eq] using hpd

theorem kerPos_on_ball_of_regQ1PhaseOK {pl : List ℚ} {regRQ : ℚ} {k : ℕ} {steps : List ℕ}
    (hr : 0 < (regRQ : ℝ)) (hok : regQ1DiagOK pl regRQ k steps = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (regRQ : ℝ),
      ∃ l > 0, KerPos (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t) l := by
  unfold regQ1DiagOK at hok
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hk, hsum⟩, hpart⟩ := hok
  set M := Nat.pow 2 k
  set unit := Nat.div D64N (Nat.mul 2 M)
  have hMpos : 0 < M := by dsimp only [M]; rw [nat_pow_eq]; positivity
  have hne : steps ≠ [] := by intro h; rw [h] at hsum; simp [sumNatList] at hsum; omega
  have hunit_mul : 2 * M * unit = D64N := by simpa [M, unit, nat_pow_eq] using unit_mul_pow2 hk
  have hunit_pos : 0 < unit := by
    by_contra h0; push Not at h0
    have hu0 : unit = 0 := by omega
    rw [hu0, mul_zero] at hunit_mul; norm_num [D64N] at hunit_mul
  refine kerPos_on_ball_of_reContractive_Q1 hr fun s hs => ?_
  have hs0 : ((0 : ℕ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s := by simpa using hs.1
  have hs1 : s ≤ (((0 + sumNatList steps : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := by
    rw [zero_add, hsum]
    have hmulR : (M : ℝ) * 2 * (unit : ℝ) = (D64 : ℝ) := by
      rw [← D64N_eq_R, ← hunit_mul]; push_cast; ring
    rw [hmulR, div_self D64_pos.ne']; exact hs.2
  refine checkPartBool_sound unit _
    (fun s =>
      let R := RtGen 1 0 1 (ofListQ pl) (ofListQ []) (chartPt (regRQ : ℝ) false s)
      (⟨1 - R.a.re, -R.b.re, 1 - R.c.re⟩ : Sym2R).PD ∧
      (⟨1 + R.a.re, R.b.re, 1 + R.c.re⟩ : Sym2R).PD)
    (fun pos w hleaf s' h1 h2 => ?_) steps 0 hne hpart s hs0 hs1
  obtain ⟨u, hu, hs'_eq⟩ := exists_u_of_leaf hunit_pos h1 h2
  cases hc : circleTM (ofRatTM regRQ) (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
      (Int.ofNat (Nat.mul w unit)) with
  | none => rw [hc] at hleaf; simp at hleaf
  | some p =>
    rw [hc] at hleaf
    simp only [reContractive1D, Bool.and_eq_true] at hleaf
    have hrTM := memTMC_evalOddPoly (memTMC_circleTM hc).1 pl
    have h1m := pos_of_tmLo_pos (memTM2_sub memTM2_one hrTM.1) hleaf.1 hu
    have h1p := pos_of_tmLo_pos (memTM2_add memTM2_one hrTM.1) hleaf.2 hu
    dsimp only at h1m h1p
    rw [← hs'_eq] at h1m h1p
    have hRt : RtGen 1 0 1 (ofListQ pl) (ofListQ []) (chartPt (regRQ : ℝ) false s') =
        ⟨chartPt (regRQ : ℝ) false s' * Polynomial.aeval (chartPt (regRQ : ℝ) false s' ^ 2) (ofListQ pl),
         0, 0⟩ := by simp [RtGen, ofListQ]
    rw [hRt]
    simp only [Complex.mul_re] at h1m h1p
    exact ⟨⟨by simpa using h1m, by simp [det]; linarith⟩, ⟨by simpa using h1p, by simp [det]; linarith⟩⟩

theorem kerPos_on_ball_of_regQ1AntiOK {rl : List ℚ} {regRQ : ℚ} {k : ℕ} {steps : List ℕ}
    (hr : 0 < (regRQ : ℝ)) (hok : regQ1DiagOK rl regRQ k steps = true) :
    ∀ t ∈ Metric.ball (0 : ℂ) (regRQ : ℝ),
      ∃ l > 0, KerPos (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t) l := by
  unfold regQ1DiagOK at hok
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hk, hsum⟩, hpart⟩ := hok
  set M := Nat.pow 2 k
  set unit := Nat.div D64N (Nat.mul 2 M)
  have hMpos : 0 < M := by dsimp only [M]; rw [nat_pow_eq]; positivity
  have hne : steps ≠ [] := by intro h; rw [h] at hsum; simp [sumNatList] at hsum; omega
  have hunit_mul : 2 * M * unit = D64N := by simpa [M, unit, nat_pow_eq] using unit_mul_pow2 hk
  have hunit_pos : 0 < unit := by
    by_contra h0; push Not at h0
    have hu0 : unit = 0 := by omega
    rw [hu0, mul_zero] at hunit_mul; norm_num [D64N] at hunit_mul
  have hnegQ : ofListQ (rl.map (- ·)) = -ofListQ rl := ofListQ_map_neg' rl
  refine kerPos_on_ball_of_reContractive_Q1 hr fun s hs => ?_
  have hs0 : ((0 : ℕ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s := by simpa using hs.1
  have hs1 : s ≤ (((0 + sumNatList steps : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := by
    rw [zero_add, hsum]
    have hmulR : (M : ℝ) * 2 * (unit : ℝ) = (D64 : ℝ) := by
      rw [← D64N_eq_R, ← hunit_mul]; push_cast; ring
    rw [hmulR, div_self D64_pos.ne']; exact hs.2
  refine checkPartBool_sound unit _
    (fun s =>
      let R := RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) (chartPt (regRQ : ℝ) false s)
      (⟨1 - R.a.re, -R.b.re, 1 - R.c.re⟩ : Sym2R).PD ∧
      (⟨1 + R.a.re, R.b.re, 1 + R.c.re⟩ : Sym2R).PD)
    (fun pos w hleaf s' h1 h2 => ?_) steps 0 hne hpart s hs0 hs1
  obtain ⟨u, hu, hs'_eq⟩ := exists_u_of_leaf hunit_pos h1 h2
  cases hc : circleTM (ofRatTM regRQ) (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
      (Int.ofNat (Nat.mul w unit)) with
  | none => rw [hc] at hleaf; simp at hleaf
  | some p =>
    rw [hc] at hleaf
    simp only [reContractive1D, Bool.and_eq_true] at hleaf
    have hrTM := memTMC_evalOddPoly (memTMC_circleTM hc).1 rl
    have h1m := pos_of_tmLo_pos (memTM2_sub memTM2_one hrTM.1) hleaf.1 hu
    have h1p := pos_of_tmLo_pos (memTM2_add memTM2_one hrTM.1) hleaf.2 hu
    dsimp only at h1m h1p
    rw [← hs'_eq] at h1m h1p
    set rv : ℂ := chartPt (regRQ : ℝ) false s' * Polynomial.aeval (chartPt (regRQ : ℝ) false s' ^ 2) (ofListQ rl)
    have hRt : RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) (chartPt (regRQ : ℝ) false s') =
        ⟨-rv, 0, rv⟩ := by
      simp only [RtGen, hnegQ, map_neg, rv, Complex.ofReal_one, Complex.ofReal_zero]; congr 1 <;> ring
    rw [hRt]
    exact ⟨⟨by simp; linarith, by simp [det]; nlinarith⟩, ⟨by simp; linarith, by simp [det]; nlinarith⟩⟩

/-! ### 6. Quarter-circle symmetry, 1D singularity-free identities, and TM-2 Simpson quadrature -/

private lemma gauss_symm_neg (R : Sym2C) (j : ℝ) :
    let Rn : Sym2C := ⟨-R.a, -R.b, -R.c⟩
    ((Z (Bj Rn j)).PD ↔ (Z (Bj R j)).PD) ∧
    ((T (Bj Rn j) Rn.Cmat).PD ↔ (T (Bj R j) R.Cmat).PD) ∧
    gaussDenominator Rn j = gaussDenominator R j := by
  intro Rn
  have hsq : Rn.sq = R.sq := by
    simp only [Sym2C.sq, Rn, Prod.mk.injEq]; refine ⟨by ring, by ring, by ring, by ring⟩
  have hdet : Rn.detIm = R.detIm := by simp only [Sym2C.detIm, hsq]
  have hA : Rn.Amat = R.Amat := by simp only [Sym2C.Amat, hsq, hdet]
  have hB : Bj Rn j = Bj R j := by simp only [Bj, hA]
  have hC : Rn.Cmat = ⟨-R.Cmat.a, -R.Cmat.b, -R.Cmat.c⟩ := by
    simp only [Sym2C.Cmat, Rn, hA]; congr 1 <;> ring
  have hsand_neg : ∀ S N : Sym2R, sand (smul (-1) S) N = sand S N := fun S N => by
    simp only [sand, smul]; congr 1 <;> ring
  have hreC : SchurKernel.re Rn.Cmat = smul (-1) (SchurKernel.re R.Cmat) := by
    simp only [hC, SchurKernel.re, smul]; congr 1 <;> simp
  have himC : SchurKernel.im Rn.Cmat = smul (-1) (SchurKernel.im R.Cmat) := by
    simp only [hC, SchurKernel.im, smul]; congr 1 <;> simp
  have hKr : Kr (Bj Rn j) Rn.Cmat = Kr (Bj R j) R.Cmat := by
    simp only [Kr, hB, hreC, hsand_neg]
  have hKi : Ki (Bj Rn j) Rn.Cmat = Ki (Bj R j) R.Cmat := by
    simp only [Ki, hB, himC, hsand_neg]
  have hT : T (Bj Rn j) Rn.Cmat = T (Bj R j) R.Cmat := by
    unfold T; rw [hKr, hB]
  have hE : E (Bj Rn j) Rn.Cmat = E (Bj R j) R.Cmat := by
    unfold E; rw [hKr, hKi]
  refine ⟨by rw [hB], by rw [hT], ?_⟩
  unfold gaussDenominator; rw [hT, hE, hdet, hB]

private lemma gauss_symm_conj (R : Sym2C) (j : ℝ) :
    let Rc : Sym2C := ⟨conj R.a, conj R.b, conj R.c⟩
    ((Z (Bj Rc j)).PD ↔ (Z (Bj R j)).PD) ∧
    ((T (Bj Rc j) Rc.Cmat).PD ↔ (T (Bj R j) R.Cmat).PD) ∧
    gaussDenominator Rc j = gaussDenominator R j := by
  intro Rc
  have hsq : Rc.sq = (conj R.sq.1, conj R.sq.2.1, conj R.sq.2.2.1, conj R.sq.2.2.2) := by
    simp only [Sym2C.sq, Rc, map_add, map_mul]
  have hdet : Rc.detIm = conj R.detIm := by
    simp only [Sym2C.detIm, hsq, map_sub, map_mul, map_one]
  have hA : Rc.Amat = ⟨conj R.Amat.a, conj R.Amat.b, conj R.Amat.c⟩ := by
    simp only [Sym2C.Amat, hsq, hdet, map_div₀, map_sub, map_one]
  have hB : Bj Rc j = ⟨conj (Bj R j).a, conj (Bj R j).b, conj (Bj R j).c⟩ := by
    simp only [Bj, hA, map_sub, Complex.conj_ofReal]
  have hZ : Z (Bj Rc j) = Z (Bj R j) := by
    simp only [Z, SchurKernel.re, hB, Complex.conj_re]
  have hC : Rc.Cmat = ⟨conj R.Cmat.a, conj R.Cmat.b, conj R.Cmat.c⟩ := by
    simp only [Sym2C.Cmat, Rc, hA, map_add, map_mul]
  have hsand_neg : ∀ S N : Sym2R, sand (smul (-1) S) N = sand S N := fun S N => by
    simp only [sand, smul]; congr 1 <;> ring
  have hreC : SchurKernel.re Rc.Cmat = SchurKernel.re R.Cmat := by
    simp only [SchurKernel.re, hC, Complex.conj_re]
  have himC : SchurKernel.im Rc.Cmat = smul (-1) (SchurKernel.im R.Cmat) := by
    simp only [SchurKernel.im, hC, Complex.conj_im, smul]; congr 1 <;> ring
  have hKr : Kr (Bj Rc j) Rc.Cmat = Kr (Bj R j) R.Cmat := by
    simp only [Kr, hZ, hreC]
  have hKi : Ki (Bj Rc j) Rc.Cmat = Ki (Bj R j) R.Cmat := by
    simp only [Ki, hZ, himC, hsand_neg]
  have hT : T (Bj Rc j) Rc.Cmat = T (Bj R j) R.Cmat := by
    unfold T; rw [hZ, hKr]
  have hE : E (Bj Rc j) Rc.Cmat = E (Bj R j) R.Cmat := by
    unfold E; rw [hKr, hKi]
  refine ⟨by rw [hZ], by rw [hT], ?_⟩
  unfold gaussDenominator; rw [hdet, Complex.norm_conj, hZ, hT, hE]

/-- Singularity-free 1D scalar factor for `R = diag(r, 0)`. -/
private lemma gaussDen_diag_phase (r : ℂ) {j : ℝ} (hj0 : 0 < j) (hj1 : j < 1)
    (hu : 0 < 1 - r.re ^ 2 + r.im ^ 2)
    (hden : 0 < 1 - j * (1 - r.re ^ 2 + r.im ^ 2 + 4 * r.re ^ 2 * (r.im ^ 2 / (1 - r.re ^ 2 + r.im ^ 2))))
    (ht : 0 < (1 - 2 * j - r.im ^ 2 / (1 - r.re ^ 2 + r.im ^ 2)) +
      j ^ 2 * (1 - r.re ^ 2 + r.im ^ 2 + 4 * r.re ^ 2 * (r.im ^ 2 / (1 - r.re ^ 2 + r.im ^ 2)))) :
    let R : Sym2C := ⟨r, 0, 0⟩
    let u := 1 - r.re ^ 2 + r.im ^ 2
    let w := r.im ^ 2 / u
    let s := u + 4 * r.re ^ 2 * w
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧
    gaussDenominator R j = 16 * j ^ 2 * (1 - j) * ((1 - j - w) * (1 + r.im ^ 2 - j * u) / (1 - j * s)) := by
  intro R u w s
  set x := r.re; set y := r.im
  have hu' : 0 < u := hu
  set N : ℝ := u ^ 2 + 4 * x ^ 2 * y ^ 2
  have hN_eq : N = u * s := by dsimp only [N, s, w, x, y]; field_simp [hu'.ne']
  have hN_pos : 0 < N := by nlinarith [sq_nonneg (2 * x * y)]
  have hdet_eq : R.detIm = 1 - r ^ 2 := by simp [R, Sym2C.detIm, Sym2C.sq, sq]
  have hre1mr2 : (1 - r ^ 2).re = u := by
    simp only [Complex.sub_re, Complex.one_re, sq, Complex.mul_re, u]; ring
  have him1mr2 : (1 - r ^ 2).im = -2 * x * y := by
    simp only [Complex.sub_im, Complex.one_im, sq, Complex.mul_im, x, y]; ring
  have hnorm_det : Complex.normSq (1 - r ^ 2) = N := by
    rw [Complex.normSq_apply, hre1mr2, him1mr2]; dsimp only [N]; ring
  have hnorm_sq : ‖R.detIm‖ ^ 2 = N := by
    rw [hdet_eq, ← Complex.normSq_eq_norm_sq, hnorm_det]
  have hdet_ne : 1 - r ^ 2 ≠ 0 := fun h0 => by rw [h0, map_zero] at hnorm_det; linarith
  have hA : R.Amat = ⟨(1 - r ^ 2)⁻¹, 0, 1⟩ := by
    simp only [Sym2C.Amat, Sym2C.detIm, Sym2C.sq, R, mul_zero, add_zero, sub_zero,
      mul_one, zero_div, one_div]
    congr 1
    · simp only [zero_mul, sub_zero, sq]
    · rw [zero_mul, sub_zero, ← sq, div_self hdet_ne]
  have hC : R.Cmat = ⟨r * (1 - r ^ 2)⁻¹, 0, 0⟩ := by
    simp only [Sym2C.Cmat, R, hA]; congr 1 <;> ring
  have hinv_re : ((1 - r ^ 2)⁻¹).re = u / N := by
    rw [Complex.inv_re, hnorm_det, hre1mr2]
  have hC_re : (r * (1 - r ^ 2)⁻¹).re = x * (1 - x ^ 2 - y ^ 2) / N := by
    rw [Complex.mul_re, Complex.inv_re, Complex.inv_im, hnorm_det, hre1mr2, him1mr2]
    dsimp only [u, x, y]; ring
  have hC_im : (r * (1 - r ^ 2)⁻¹).im = y * (1 + x ^ 2 + y ^ 2) / N := by
    rw [Complex.mul_im, Complex.inv_re, Complex.inv_im, hnorm_det, hre1mr2, him1mr2]
    dsimp only [u, x, y]; ring
  set za : ℝ := u / N - j
  set cra : ℝ := x * (1 - x ^ 2 - y ^ 2) / N
  set cia : ℝ := y * (1 + x ^ 2 + y ^ 2) / N
  have hZ_eq : Z (Bj R j) = ⟨za, 0, 1 - j⟩ := by
    simp only [Z, Bj, SchurKernel.re, hA, za]
    congr 1
    simp only [Complex.sub_re, Complex.ofReal_re, hinv_re]
  have hreC_eq : SchurKernel.re R.Cmat = ⟨cra, 0, 0⟩ := by
    simp only [SchurKernel.re, hC, cra, hC_re, Complex.zero_re]
  have himC_eq : SchurKernel.im R.Cmat = ⟨cia, 0, 0⟩ := by
    simp only [SchurKernel.im, hC, cia, hC_im, Complex.zero_im]
  have hs_pos : 0 < s := by nlinarith [hN_eq]
  have hza_eq : za = (1 - j * s) / s := by
    dsimp only [za]; rw [hN_eq]; field_simp [hu'.ne', hs_pos.ne']
  have hza_pos : 0 < za := by rw [hza_eq]; exact div_pos hden hs_pos
  have hZ_PD : (Z (Bj R j)).PD := by
    rw [hZ_eq]; exact ⟨hza_pos, by simp only [det, zero_pow two_ne_zero, sub_zero]; exact mul_pos hza_pos (sub_pos.2 hj1)⟩
  have hZ_det : (Z (Bj R j)).det = za * (1 - j) := by rw [hZ_eq]; simp [det]
  have hKr_eq : Kr (Bj R j) R.Cmat = ⟨cra ^ 2 / za, 0, 0⟩ := by
    simp only [Kr, hZ_eq, hreC_eq, det, adj, sand, smul]
    congr 1 <;> (field_simp [hza_pos.ne', (sub_pos.2 hj1).ne']; ring)
  have hKi_eq : Ki (Bj R j) R.Cmat = ⟨cia ^ 2 / za, 0, 0⟩ := by
    simp only [Ki, hZ_eq, himC_eq, det, adj, sand, smul]
    congr 1 <;> (field_simp [hza_pos.ne', (sub_pos.2 hj1).ne']; ring)
  have hT_eq : T (Bj R j) R.Cmat = ⟨za - cra ^ 2 / za, 0, 1 - j⟩ := by
    simp only [T, hZ_eq, hKr_eq, add, smul]; congr 1 <;> ring
  have hE_eq : E (Bj R j) R.Cmat = ⟨(cra ^ 2 + cia ^ 2) / (2 * za), 0, 0⟩ := by
    simp only [E, hKr_eq, hKi_eq, add, smul]
    congr 1
    · field_simp [hza_pos.ne']
    · ring
    · ring
  have hkey1 : u ^ 2 - x ^ 2 * (1 - x ^ 2 - y ^ 2) ^ 2 = (1 - x ^ 2) * N := by
    dsimp only [N, u]; ring
  have hkey2 : u ^ 2 + y ^ 2 * (1 + x ^ 2 + y ^ 2) ^ 2 = (1 + y ^ 2) * N := by
    dsimp only [N, u]; ring
  have h1mx2 : 1 - x ^ 2 = (1 - w) * u := by
    have hu_ne : 1 - r.re ^ 2 + r.im ^ 2 ≠ 0 := hu'.ne'
    dsimp only [w, u, x, y]; field_simp [hu_ne]; ring
  have hza2_cra2 : N ^ 2 * (za ^ 2 - cra ^ 2) = ((1 - 2 * j - w) + j ^ 2 * s) * u * N := by
    have h1 : N ^ 2 * (za ^ 2 - cra ^ 2) =
        (u ^ 2 - x ^ 2 * (1 - x ^ 2 - y ^ 2) ^ 2) - 2 * j * u * N + j ^ 2 * N ^ 2 := by
      dsimp only [za, cra]; field_simp [hN_pos.ne']; ring
    rw [h1, hkey1, h1mx2, hN_eq]; ring
  have hta_id : (za - cra ^ 2 / za) * za = ((1 - 2 * j - w) + j ^ 2 * s) * u / N := by
    have h1 : (za - cra ^ 2 / za) * za = za ^ 2 - cra ^ 2 := by field_simp [hza_pos.ne']
    rw [h1]
    have hN2 : N ^ 2 ≠ 0 := pow_ne_zero 2 hN_pos.ne'
    have h2 : (za ^ 2 - cra ^ 2) * N ^ 2 = (((1 - 2 * j - w) + j ^ 2 * s) * u / N) * N ^ 2 := by
      rw [mul_comm, hza2_cra2]; field_simp [hN_pos.ne']
    exact mul_right_cancel₀ hN2 h2
  have hta_pos : 0 < za - cra ^ 2 / za := by
    have h1 : 0 < (za - cra ^ 2 / za) * za := by rw [hta_id]; exact div_pos (mul_pos ht hu') hN_pos
    exact (pos_iff_pos_of_mul_pos h1).2 hza_pos
  have hT_PD : (T (Bj R j) R.Cmat).PD := by
    rw [hT_eq]; exact ⟨hta_pos, by simp only [det, zero_pow two_ne_zero, sub_zero]; exact mul_pos hta_pos (sub_pos.2 hj1)⟩
  refine ⟨hZ_PD, hT_PD, ?_⟩
  have hTJ_det : (shifted (T (Bj R j) R.Cmat) j).det = za - cra ^ 2 / za + j := by
    rw [hT_eq]; simp [shifted, det]
  have hTEJ_det : (shifted (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det =
      za + cia ^ 2 / za + j := by
    rw [hT_eq, hE_eq]; simp only [shifted, add, smul, det]
    field_simp [hza_pos.ne']; ring
  have hfac1 : N * (za ^ 2 - cra ^ 2 + j * za) = (1 - j - w) * u := by
    have h1 : N ^ 2 * (za ^ 2 - cra ^ 2 + j * za) =
        (u ^ 2 - x ^ 2 * (1 - x ^ 2 - y ^ 2) ^ 2) - j * u * N := by
      dsimp only [za, cra]; field_simp [hN_pos.ne']; ring
    have h2 : N * (N * (za ^ 2 - cra ^ 2 + j * za)) = N * ((1 - j - w) * u) := by
      calc N * (N * (za ^ 2 - cra ^ 2 + j * za))
          = N ^ 2 * (za ^ 2 - cra ^ 2 + j * za) := by ring
        _ = (1 - x ^ 2) * N - j * u * N := by rw [h1, hkey1]
        _ = N * ((1 - j - w) * u) := by rw [h1mx2]; ring
    exact mul_left_cancel₀ hN_pos.ne' h2
  have hfac2 : N * (za ^ 2 + cia ^ 2 + j * za) = 1 + y ^ 2 - j * u := by
    have h1 : N ^ 2 * (za ^ 2 + cia ^ 2 + j * za) =
        (u ^ 2 + y ^ 2 * (1 + x ^ 2 + y ^ 2) ^ 2) - j * u * N := by
      dsimp only [za, cia]; field_simp [hN_pos.ne']; ring
    have h2 : N * (N * (za ^ 2 + cia ^ 2 + j * za)) = N * (1 + y ^ 2 - j * u) := by
      calc N * (N * (za ^ 2 + cia ^ 2 + j * za))
          = N ^ 2 * (za ^ 2 + cia ^ 2 + j * za) := by ring
        _ = (1 + y ^ 2) * N - j * u * N := by rw [h1, hkey2]
        _ = N * (1 + y ^ 2 - j * u) := by ring
    exact mul_left_cancel₀ hN_pos.ne' h2
  rw [gaussDenominator, hnorm_sq, hZ_det, hTJ_det, hTEJ_det]
  have halg : N * (za * (1 - j)) * (za - cra ^ 2 / za + j) * (za + cia ^ 2 / za + j) =
      (1 - j) * ((N * (za ^ 2 - cra ^ 2 + j * za)) * (N * (za ^ 2 + cia ^ 2 + j * za))) / (N * za) := by
    field_simp [hza_pos.ne', hN_pos.ne']
  have hNza : N * za = u * (1 - j * s) := by rw [hza_eq, hN_eq]; field_simp [hs_pos.ne']
  calc 16 * j ^ 2 * N * (za * (1 - j)) * (za - cra ^ 2 / za + j) * (za + cia ^ 2 / za + j)
      = 16 * j ^ 2 * (N * (za * (1 - j)) * (za - cra ^ 2 / za + j) * (za + cia ^ 2 / za + j)) := by ring
    _ = 16 * j ^ 2 * ((1 - j) * (((1 - j - w) * u) * (1 + y ^ 2 - j * u)) / (u * (1 - j * s))) := by
        rw [halg, hfac1, hfac2, hNza]
    _ = 16 * j ^ 2 * (1 - j) * ((1 - j - w) * (1 + y ^ 2 - j * u) / (1 - j * s)) := by
        have hfrac : (((1 - j - w) * u) * (1 + y ^ 2 - j * u)) / (u * (1 - j * s)) =
            (1 - j - w) * (1 + y ^ 2 - j * u) / (1 - j * s) := by
          rw [show ((1 - j - w) * u) * (1 + y ^ 2 - j * u) =
                u * ((1 - j - w) * (1 + y ^ 2 - j * u)) by ring,
              mul_div_mul_left _ _ hu'.ne']
        rw [mul_div_assoc, hfrac]; ring

/-- Singularity-free 1D diagonal factor for `R = diag(-r, r)`. -/
private lemma gaussDen_diag_antisym (r : ℂ) {j : ℝ}
    (hu : 0 < 1 - r.re ^ 2 + r.im ^ 2)
    (hden : 0 < 1 - j * (1 - r.re ^ 2 + r.im ^ 2 + 4 * r.re ^ 2 * (r.im ^ 2 / (1 - r.re ^ 2 + r.im ^ 2))))
    (ht : 0 < (1 - 2 * j - r.im ^ 2 / (1 - r.re ^ 2 + r.im ^ 2)) +
      j ^ 2 * (1 - r.re ^ 2 + r.im ^ 2 + 4 * r.re ^ 2 * (r.im ^ 2 / (1 - r.re ^ 2 + r.im ^ 2)))) :
    let R : Sym2C := ⟨-r, 0, r⟩
    let u := 1 - r.re ^ 2 + r.im ^ 2
    let w := r.im ^ 2 / u
    let s := u + 4 * r.re ^ 2 * w
    (Z (Bj R j)).PD ∧ (T (Bj R j) R.Cmat).PD ∧
    gaussDenominator R j = 16 * j ^ 2 * ((1 - j - w) * (1 + r.im ^ 2 - j * u) / (1 - j * s)) ^ 2 := by
  intro R u w s
  set x := r.re; set y := r.im
  have hu' : 0 < u := hu
  set N : ℝ := u ^ 2 + 4 * x ^ 2 * y ^ 2
  have hN_eq : N = u * s := by dsimp only [N, s, w, x, y]; field_simp [hu'.ne']
  have hN_pos : 0 < N := by nlinarith [sq_nonneg (2 * x * y)]
  have hdet_eq : R.detIm = (1 - r ^ 2) ^ 2 := by simp [R, Sym2C.detIm, Sym2C.sq, sq]
  have hre1mr2 : (1 - r ^ 2).re = u := by
    simp only [Complex.sub_re, Complex.one_re, sq, Complex.mul_re, u]; ring
  have him1mr2 : (1 - r ^ 2).im = -2 * x * y := by
    simp only [Complex.sub_im, Complex.one_im, sq, Complex.mul_im, x, y]; ring
  have hnorm_det : Complex.normSq (1 - r ^ 2) = N := by
    rw [Complex.normSq_apply, hre1mr2, him1mr2]; dsimp only [N]; ring
  have hnorm_sq : ‖R.detIm‖ ^ 2 = N ^ 2 := by
    rw [hdet_eq, norm_pow, ← pow_mul, mul_comm 2 2, pow_mul, ← Complex.normSq_eq_norm_sq, hnorm_det]
  have hdet_ne : 1 - r ^ 2 ≠ 0 := fun h0 => by rw [h0, map_zero] at hnorm_det; linarith
  have hA : R.Amat = ⟨(1 - r ^ 2)⁻¹, 0, (1 - r ^ 2)⁻¹⟩ := by
    simp only [Sym2C.Amat, Sym2C.detIm, Sym2C.sq, R]
    congr 1 <;> (field_simp [hdet_ne]; ring)
  have hC : R.Cmat = ⟨-(r * (1 - r ^ 2)⁻¹), 0, r * (1 - r ^ 2)⁻¹⟩ := by
    simp only [Sym2C.Cmat, R, hA]; congr 1 <;> ring
  have hinv_re : ((1 - r ^ 2)⁻¹).re = u / N := by
    rw [Complex.inv_re, hnorm_det, hre1mr2]
  have hC_re : (r * (1 - r ^ 2)⁻¹).re = x * (1 - x ^ 2 - y ^ 2) / N := by
    rw [Complex.mul_re, Complex.inv_re, Complex.inv_im, hnorm_det, hre1mr2, him1mr2]
    dsimp only [u, x, y]; ring
  have hC_im : (r * (1 - r ^ 2)⁻¹).im = y * (1 + x ^ 2 + y ^ 2) / N := by
    rw [Complex.mul_im, Complex.inv_re, Complex.inv_im, hnorm_det, hre1mr2, him1mr2]
    dsimp only [u, x, y]; ring
  set za : ℝ := u / N - j
  set cra : ℝ := x * (1 - x ^ 2 - y ^ 2) / N
  set cia : ℝ := y * (1 + x ^ 2 + y ^ 2) / N
  have hZ_eq : Z (Bj R j) = ⟨za, 0, za⟩ := by
    simp only [Z, Bj, SchurKernel.re, hA, za]
    congr 1 <;> simp only [Complex.sub_re, Complex.ofReal_re, hinv_re]
  have hreC_eq : SchurKernel.re R.Cmat = ⟨-cra, 0, cra⟩ := by
    simp only [SchurKernel.re, hC, cra, Complex.neg_re, hC_re, Complex.zero_re]
  have himC_eq : SchurKernel.im R.Cmat = ⟨-cia, 0, cia⟩ := by
    simp only [SchurKernel.im, hC, cia, Complex.neg_im, hC_im, Complex.zero_im]
  have hs_pos : 0 < s := by nlinarith [hN_eq]
  have hza_eq : za = (1 - j * s) / s := by
    dsimp only [za]; rw [hN_eq]; field_simp [hu'.ne', hs_pos.ne']
  have hza_pos : 0 < za := by rw [hza_eq]; exact div_pos hden hs_pos
  have hZ_PD : (Z (Bj R j)).PD := by
    rw [hZ_eq]; exact ⟨hza_pos, by simp only [det, zero_pow two_ne_zero, sub_zero]; exact mul_pos hza_pos hza_pos⟩
  have hZ_det : (Z (Bj R j)).det = za ^ 2 := by rw [hZ_eq]; simp [det, sq]
  have hKr_eq : Kr (Bj R j) R.Cmat = ⟨cra ^ 2 / za, 0, cra ^ 2 / za⟩ := by
    simp only [Kr, hZ_eq, hreC_eq, det, adj, sand, smul]
    congr 1 <;> (field_simp [hza_pos.ne']; ring)
  have hKi_eq : Ki (Bj R j) R.Cmat = ⟨cia ^ 2 / za, 0, cia ^ 2 / za⟩ := by
    simp only [Ki, hZ_eq, himC_eq, det, adj, sand, smul]
    congr 1 <;> (field_simp [hza_pos.ne']; ring)
  have hT_eq : T (Bj R j) R.Cmat = ⟨za - cra ^ 2 / za, 0, za - cra ^ 2 / za⟩ := by
    simp only [T, hZ_eq, hKr_eq, add, smul]; congr 1 <;> ring
  have hE_eq : E (Bj R j) R.Cmat = ⟨(cra ^ 2 + cia ^ 2) / (2 * za), 0, (cra ^ 2 + cia ^ 2) / (2 * za)⟩ := by
    simp only [E, hKr_eq, hKi_eq, add, smul]
    congr 1
    · field_simp [hza_pos.ne']
    · ring
    · field_simp [hza_pos.ne']
  have hkey1 : u ^ 2 - x ^ 2 * (1 - x ^ 2 - y ^ 2) ^ 2 = (1 - x ^ 2) * N := by
    dsimp only [N, u]; ring
  have hkey2 : u ^ 2 + y ^ 2 * (1 + x ^ 2 + y ^ 2) ^ 2 = (1 + y ^ 2) * N := by
    dsimp only [N, u]; ring
  have h1mx2 : 1 - x ^ 2 = (1 - w) * u := by
    have hu_ne : 1 - r.re ^ 2 + r.im ^ 2 ≠ 0 := hu'.ne'
    dsimp only [w, u, x, y]; field_simp [hu_ne]; ring
  have hza2_cra2 : N ^ 2 * (za ^ 2 - cra ^ 2) = ((1 - 2 * j - w) + j ^ 2 * s) * u * N := by
    have h1 : N ^ 2 * (za ^ 2 - cra ^ 2) =
        (u ^ 2 - x ^ 2 * (1 - x ^ 2 - y ^ 2) ^ 2) - 2 * j * u * N + j ^ 2 * N ^ 2 := by
      dsimp only [za, cra]; field_simp [hN_pos.ne']; ring
    rw [h1, hkey1, h1mx2, hN_eq]; ring
  have hta_id : (za - cra ^ 2 / za) * za = ((1 - 2 * j - w) + j ^ 2 * s) * u / N := by
    have h1 : (za - cra ^ 2 / za) * za = za ^ 2 - cra ^ 2 := by field_simp [hza_pos.ne']
    rw [h1]
    have hN2 : N ^ 2 ≠ 0 := pow_ne_zero 2 hN_pos.ne'
    have h2 : (za ^ 2 - cra ^ 2) * N ^ 2 = (((1 - 2 * j - w) + j ^ 2 * s) * u / N) * N ^ 2 := by
      rw [mul_comm, hza2_cra2]; field_simp [hN_pos.ne']
    exact mul_right_cancel₀ hN2 h2
  have hta_pos : 0 < za - cra ^ 2 / za := by
    have h1 : 0 < (za - cra ^ 2 / za) * za := by rw [hta_id]; exact div_pos (mul_pos ht hu') hN_pos
    exact (pos_iff_pos_of_mul_pos h1).2 hza_pos
  have hT_PD : (T (Bj R j) R.Cmat).PD := by
    rw [hT_eq]; exact ⟨hta_pos, by simp only [det, zero_pow two_ne_zero, sub_zero]; exact mul_pos hta_pos hta_pos⟩
  refine ⟨hZ_PD, hT_PD, ?_⟩
  have hTJ_det : (shifted (T (Bj R j) R.Cmat) j).det = (za - cra ^ 2 / za + j) ^ 2 := by
    rw [hT_eq]; simp [shifted, det, sq]
  have hTEJ_det : (shifted (add (T (Bj R j) R.Cmat) (smul 2 (E (Bj R j) R.Cmat))) j).det =
      (za + cia ^ 2 / za + j) ^ 2 := by
    have hent : za - cra ^ 2 / za + 2 * ((cra ^ 2 + cia ^ 2) / (2 * za)) + j = za + cia ^ 2 / za + j := by
      field_simp [hza_pos.ne']; ring
    rw [hT_eq, hE_eq]
    simp only [shifted, add, smul, det, mul_zero, add_zero, zero_pow two_ne_zero, sub_zero]
    rw [hent, ← sq]
  have hfac1 : N * (za ^ 2 - cra ^ 2 + j * za) = (1 - j - w) * u := by
    have h1 : N ^ 2 * (za ^ 2 - cra ^ 2 + j * za) =
        (u ^ 2 - x ^ 2 * (1 - x ^ 2 - y ^ 2) ^ 2) - j * u * N := by
      dsimp only [za, cra]; field_simp [hN_pos.ne']; ring
    have h2 : N * (N * (za ^ 2 - cra ^ 2 + j * za)) = N * ((1 - j - w) * u) := by
      calc N * (N * (za ^ 2 - cra ^ 2 + j * za))
          = N ^ 2 * (za ^ 2 - cra ^ 2 + j * za) := by ring
        _ = (1 - x ^ 2) * N - j * u * N := by rw [h1, hkey1]
        _ = N * ((1 - j - w) * u) := by rw [h1mx2]; ring
    exact mul_left_cancel₀ hN_pos.ne' h2
  have hfac2 : N * (za ^ 2 + cia ^ 2 + j * za) = 1 + y ^ 2 - j * u := by
    have h1 : N ^ 2 * (za ^ 2 + cia ^ 2 + j * za) =
        (u ^ 2 + y ^ 2 * (1 + x ^ 2 + y ^ 2) ^ 2) - j * u * N := by
      dsimp only [za, cia]; field_simp [hN_pos.ne']; ring
    have h2 : N * (N * (za ^ 2 + cia ^ 2 + j * za)) = N * (1 + y ^ 2 - j * u) := by
      calc N * (N * (za ^ 2 + cia ^ 2 + j * za))
          = N ^ 2 * (za ^ 2 + cia ^ 2 + j * za) := by ring
        _ = (1 + y ^ 2) * N - j * u * N := by rw [h1, hkey2]
        _ = N * (1 + y ^ 2 - j * u) := by ring
    exact mul_left_cancel₀ hN_pos.ne' h2
  have hNza : N * za = u * (1 - j * s) := by rw [hza_eq, hN_eq]; field_simp [hs_pos.ne']
  rw [gaussDenominator, hnorm_sq, hZ_det, hTJ_det, hTEJ_det]
  have halg1 : N * za * (za - cra ^ 2 / za + j) * (za + cia ^ 2 / za + j) =
      ((N * (za ^ 2 - cra ^ 2 + j * za)) * (N * (za ^ 2 + cia ^ 2 + j * za))) / (N * za) := by
    field_simp [hza_pos.ne', hN_pos.ne']
  have hfrac : (((1 - j - w) * u) * (1 + y ^ 2 - j * u)) / (u * (1 - j * s)) =
      (1 - j - w) * (1 + y ^ 2 - j * u) / (1 - j * s) := by
    rw [show ((1 - j - w) * u) * (1 + y ^ 2 - j * u) =
          u * ((1 - j - w) * (1 + y ^ 2 - j * u)) by ring,
        mul_div_mul_left _ _ hu'.ne']
  have hsq4 : ∀ a b c d : ℝ,
      16 * j ^ 2 * a ^ 2 * b ^ 2 * c ^ 2 * d ^ 2 = 16 * j ^ 2 * (a * b * c * d) ^ 2 :=
    fun _ _ _ _ => by ring
  calc 16 * j ^ 2 * N ^ 2 * za ^ 2 * (za - cra ^ 2 / za + j) ^ 2 * (za + cia ^ 2 / za + j) ^ 2
      = 16 * j ^ 2 * (N * za * (za - cra ^ 2 / za + j) * (za + cia ^ 2 / za + j)) ^ 2 :=
        hsq4 N za (za - cra ^ 2 / za + j) (za + cia ^ 2 / za + j)
    _ = 16 * j ^ 2 * ((1 - j - w) * (1 + y ^ 2 - j * u) / (1 - j * s)) ^ 2 := by
        rw [halg1, hfac1, hfac2, hNza, hfrac]

/-- Soundness of `gauss2x2DenTM`: certifies `Z.PD`, `T.PD`, and `memTM2 (gaussDenominator ∘ R) den`. -/
private lemma gauss2x2DenTM_sound {R : ℝ → Sym2C} {RT : SCT} {jQ : ℚ} {denT : TM2}
    (hR : memSCT R RT)
    (hok : gauss2x2DenTM RT (ofRatTM jQ) (ofRatTM (16 * jQ * jQ)) = some denT) :
    (∀ u : ℝ, |u| ≤ 1 → (Z (Bj (R u) (jQ : ℝ))).PD ∧ (T (Bj (R u) (jQ : ℝ)) (R u).Cmat).PD) ∧
    memTM2 (fun u => gaussDenominator (R u) (jQ : ℝ)) denT := by
  have hinv_sound : ∀ (neg : Bool) (ipT : SCT) (ndT : TM2),
      invImTM RT neg = some (ipT, ndT) →
      (∀ u : ℝ, |u| ≤ 1 → dpm' (R u) (sigB neg) ≠ 0) ∧
      memSCT (fun u => invImC' (R u) (sigB neg)) ipT ∧
      memTM2 (fun u => Complex.normSq (dpm' (R u) (sigB neg))) ndT := by
    intro neg ipT ndT hi
    unfold invImTM at hi; dsimp only at hi
    set rFn : ℝ → Sym2C := fun u => if neg then ⟨-(R u).a, -(R u).b, -(R u).c⟩ else R u
    set rTM : SCT := if neg then ⟨tmcNeg RT.a, tmcNeg RT.b, tmcNeg RT.c⟩ else RT
    have hrTM : memSCT rFn rTM := by
      cases neg
      · simpa [rFn, rTM] using hR
      · exact ⟨memTMC_neg hR.1, memTMC_neg hR.2.1, memTMC_neg hR.2.2⟩
    have hm00 := memTMC_sub memTMC_one hrTM.1
    have hm01 := memTMC_neg hrTM.2.1
    have hm11 := memTMC_sub memTMC_one hrTM.2.2
    set dT : TMC := tmcSub (tmcMul (tmcSub tmcOne rTM.a) (tmcSub tmcOne rTM.c))
      (tmcMul (tmcNeg rTM.b) (tmcNeg rTM.b))
    have hd_fn : (fun u => (1 - (rFn u).a) * (1 - (rFn u).c) - (-(rFn u).b) * (-(rFn u).b)) =
        fun u => dpm' (R u) (sigB neg) := by
      funext u; cases neg <;> simp [rFn, dpm', sigB] <;> ring
    have hdTM : memTMC (fun u => dpm' (R u) (sigB neg)) dT := by
      rw [← hd_fn]; exact memTMC_sub (memTMC_mul hm00 hm11) (memTMC_mul hm01 hm01)
    have hndTM := memTM2_normSq hdTM
    have hr_match : (if neg = true then (tmcNeg RT.a, tmcNeg RT.b, tmcNeg RT.c) else (RT.a, RT.b, RT.c)) =
        (rTM.a, rTM.b, rTM.c) := by cases neg <;> rfl
    rw [hr_match] at hi
    cases hndi : tmInvPos (tmcNormSq dT) with
    | none => rw [hndi] at hi; simp at hi
    | some ndi =>
      rw [hndi] at hi; injection hi with hp; obtain ⟨rfl, rfl⟩ := Prod.mk.inj hp
      obtain ⟨hnd_pos, hndi_tm⟩ := memTM2_invPos hndTM hndi
      have hd_ne : ∀ u : ℝ, |u| ≤ 1 → dpm' (R u) (sigB neg) ≠ 0 := fun u hu h0 => by
        have := hnd_pos u hu; simp [h0] at this
      have hdi_tm : memTMC (fun u => (dpm' (R u) (sigB neg))⁻¹)
          ⟨tmMul dT.re ndi, tmNeg (tmMul dT.im ndi)⟩ :=
        ⟨by simpa [Complex.inv_re, div_eq_mul_inv] using memTM2_mul hdTM.1 hndi_tm,
         by simpa [Complex.inv_im, div_eq_mul_inv, neg_mul] using memTM2_neg (memTM2_mul hdTM.2 hndi_tm)⟩
      refine ⟨hd_ne, ⟨?_, ?_, ?_⟩, hndTM⟩
      · convert memTMC_mul hm11 hdi_tm using 1
        funext u; cases neg <;> simp [invImC', rFn, sigB, div_eq_mul_inv]
      · convert memTMC_neg (memTMC_mul hm01 hdi_tm) using 1
        funext u; cases neg <;> simp [invImC', rFn, sigB, div_eq_mul_inv]
      · convert memTMC_mul hm00 hdi_tm using 1
        funext u; cases neg <;> simp [invImC', rFn, sigB, div_eq_mul_inv]
  unfold gauss2x2DenTM at hok; dsimp only at hok
  cases hp : invImTM RT false with
  | none => rw [hp] at hok; simp at hok
  | some p1 =>
  rw [hp] at hok
  cases hm : invImTM RT true with
  | none => rw [hm] at hok; simp at hok
  | some p2 =>
  rw [hm] at hok
  obtain ⟨ipT, npT⟩ := p1; obtain ⟨imT, nmT⟩ := p2
  obtain ⟨hdp_ne, hipTM, hnpTM⟩ := hinv_sound false ipT npT hp
  obtain ⟨hdm_ne, himTM, hnmTM⟩ := hinv_sound true imT nmT hm
  simp only [sigB, Bool.false_eq_true, ↓reduceIte] at hdp_ne hipTM hnpTM hdm_ne himTM hnmTM
  set jR : ℝ := (jQ : ℝ)
  have hjTM := memTM2_ofRatTM jQ
  have h16jTM := memTM2_ofRatTM (16 * jQ * jQ)
  -- Track real symmetric matrices `gp`, `gm`, `Z`, `T`, `E`
  have hAeq : ∀ u, |u| ≤ 1 → (R u).Amat = ⟨((invImC' (R u) 1).a + (invImC' (R u) (-1)).a) / 2,
      ((invImC' (R u) 1).b + (invImC' (R u) (-1)).b) / 2,
      ((invImC' (R u) 1).c + (invImC' (R u) (-1)).c) / 2⟩ := fun u hu => by
    have hp0 := hdp_ne u hu; have hm0 := hdm_ne u hu
    have hdet : (R u).detIm = dpm' (R u) 1 * dpm' (R u) (-1) := by
      simp only [Sym2C.detIm, Sym2C.sq, dpm']; ring
    simp only [Sym2C.Amat, Sym2C.sq, invImC', hdet]
    congr 1 <;> field_simp [hp0, hm0] <;> simp only [dpm'] <;> ring
  have hCeq : ∀ u, |u| ≤ 1 → (R u).Cmat = ⟨((invImC' (R u) 1).a - (invImC' (R u) (-1)).a) / 2,
      ((invImC' (R u) 1).b - (invImC' (R u) (-1)).b) / 2,
      ((invImC' (R u) 1).c - (invImC' (R u) (-1)).c) / 2⟩ := fun u hu => by
    have hp0 := hdp_ne u hu; have hm0 := hdm_ne u hu
    simp only [Sym2C.Cmat]; rw [hAeq u hu]; simp only [invImC']
    congr 1 <;> field_simp [hp0, hm0] <;> simp only [dpm'] <;> ring
  set gpaT := tmSub ipT.a.re (ofRatTM jQ)
  set gpbT := ipT.b.re
  set gpcT := tmSub ipT.c.re (ofRatTM jQ)
  set gmaT := tmSub imT.a.re (ofRatTM jQ)
  set gmbT := imT.b.re
  set gmcT := tmSub imT.c.re (ofRatTM jQ)
  set zaT := tmHalf (tmAdd gpaT gmaT)
  set zbT := tmHalf (tmAdd gpbT gmbT)
  set zcT := tmHalf (tmAdd gpcT gmcT)
  set zdetT := tmSub (tmMul zaT zcT) (tmMul zbT zbT)
  have hgp_a : memTM2 (fun u => (invImC' (R u) 1).a.re - jR) gpaT := memTM2_sub hipTM.1.1 hjTM
  have hgp_b : memTM2 (fun u => (invImC' (R u) 1).b.re) gpbT := hipTM.2.1.1
  have hgp_c : memTM2 (fun u => (invImC' (R u) 1).c.re - jR) gpcT := memTM2_sub hipTM.2.2.1 hjTM
  have hgm_a : memTM2 (fun u => (invImC' (R u) (-1)).a.re - jR) gmaT := memTM2_sub himTM.1.1 hjTM
  have hgm_b : memTM2 (fun u => (invImC' (R u) (-1)).b.re) gmbT := himTM.2.1.1
  have hgm_c : memTM2 (fun u => (invImC' (R u) (-1)).c.re - jR) gmcT := memTM2_sub himTM.2.2.1 hjTM
  have hza := memTM2_half (memTM2_add hgp_a hgm_a)
  have hzb := memTM2_half (memTM2_add hgp_b hgm_b)
  have hzc := memTM2_half (memTM2_add hgp_c hgm_c)
  have hz_eq : ∀ u, |u| ≤ 1 →
      (Z (Bj (R u) jR)).a = ((invImC' (R u) 1).a.re - jR + ((invImC' (R u) (-1)).a.re - jR)) / 2 ∧
      (Z (Bj (R u) jR)).b = ((invImC' (R u) 1).b.re + (invImC' (R u) (-1)).b.re) / 2 ∧
      (Z (Bj (R u) jR)).c = ((invImC' (R u) 1).c.re - jR + ((invImC' (R u) (-1)).c.re - jR)) / 2 := fun u hu => by
    simp only [Z, Bj, SchurKernel.re, hAeq u hu, Complex.sub_re, Complex.div_ofNat_re, Complex.add_re,
      Complex.ofReal_re]
    exact ⟨by ring, trivial, by ring⟩
  have hza' : memTM2 (fun u => (Z (Bj (R u) jR)).a) zaT := fun u hu => by
    dsimp only; rw [(hz_eq u hu).1]; exact hza u hu
  have hzb' : memTM2 (fun u => (Z (Bj (R u) jR)).b) zbT := fun u hu => by
    dsimp only; rw [(hz_eq u hu).2.1]; exact hzb u hu
  have hzc' : memTM2 (fun u => (Z (Bj (R u) jR)).c) zcT := fun u hu => by
    dsimp only; rw [(hz_eq u hu).2.2]; exact hzc u hu
  have hzdet' : memTM2 (fun u => (Z (Bj (R u) jR)).det) zdetT := by
    simpa only [det, sq] using memTM2_sub (memTM2_mul hza' hzc') (memTM2_mul hzb' hzb')
  dsimp only at hok
  split_ifs at hok with hzbad
  simp only [Bool.not_eq_true', Bool.and_eq_false_iff, not_or, Bool.not_eq_false] at hzbad
  have hZPD : ∀ u, |u| ≤ 1 → (Z (Bj (R u) jR)).PD := fun u hu =>
    ⟨pos_of_tmLo_pos hza' hzbad.1 hu, pos_of_tmLo_pos hzdet' hzbad.2 hu⟩
  cases hzdi : tmInvPos zdetT with
  | none => rw [hzdi] at hok; simp at hok
  | some zdi =>
  rw [hzdi] at hok
  have hzdi_tm := (memTM2_invPos hzdet' hzdi).2
  set ziaT := tmMul zcT zdi
  set zibT := tmNeg (tmMul zbT zdi)
  set zicT := tmMul zaT zdi
  set m00T := tmAdd (tmMul gmaT ziaT) (tmMul gmbT zibT)
  set m01T := tmAdd (tmMul gmaT zibT) (tmMul gmbT zicT)
  set m10T := tmAdd (tmMul gmbT ziaT) (tmMul gmcT zibT)
  set m11T := tmAdd (tmMul gmbT zibT) (tmMul gmcT zicT)
  set taT := tmAdd (tmMul m00T gpaT) (tmMul m01T gpbT)
  set tbT := tmAdd (tmMul m00T gpbT) (tmMul m01T gpcT)
  set tcT := tmAdd (tmMul m10T gpbT) (tmMul m11T gpcT)
  set tdetT := tmSub (tmMul taT tcT) (tmMul tbT tbT)
  have hzia : memTM2 (fun u => (Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) ziaT := memTM2_mul hzc' hzdi_tm
  have hzib : memTM2 (fun u => -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹)) zibT := memTM2_neg (memTM2_mul hzb' hzdi_tm)
  have hzic : memTM2 (fun u => (Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹) zicT := memTM2_mul hza' hzdi_tm
  have hm00 := memTM2_add (memTM2_mul hgm_a hzia) (memTM2_mul hgm_b hzib)
  have hm01 := memTM2_add (memTM2_mul hgm_a hzib) (memTM2_mul hgm_b hzic)
  have hm10 := memTM2_add (memTM2_mul hgm_b hzia) (memTM2_mul hgm_c hzib)
  have hm11 := memTM2_add (memTM2_mul hgm_b hzib) (memTM2_mul hgm_c hzic)
  have hta_raw := memTM2_add (memTM2_mul hm00 hgp_a) (memTM2_mul hm01 hgp_b)
  have htb_raw := memTM2_add (memTM2_mul hm00 hgp_b) (memTM2_mul hm01 hgp_c)
  have htc_raw := memTM2_add (memTM2_mul hm10 hgp_b) (memTM2_mul hm11 hgp_c)
  have hT_id : ∀ u, |u| ≤ 1 →
      (T (Bj (R u) jR) (R u).Cmat).a =
        ((((invImC' (R u) (-1)).a.re - jR) * ((Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) +
          (invImC' (R u) (-1)).b.re * -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹)) *
          ((invImC' (R u) 1).a.re - jR) +
         (((invImC' (R u) (-1)).a.re - jR) * -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹) +
          (invImC' (R u) (-1)).b.re * ((Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹)) *
          (invImC' (R u) 1).b.re) ∧
      (T (Bj (R u) jR) (R u).Cmat).b =
        ((((invImC' (R u) (-1)).a.re - jR) * ((Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) +
          (invImC' (R u) (-1)).b.re * -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹)) *
          (invImC' (R u) 1).b.re +
         (((invImC' (R u) (-1)).a.re - jR) * -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹) +
          (invImC' (R u) (-1)).b.re * ((Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹)) *
          ((invImC' (R u) 1).c.re - jR)) ∧
      (T (Bj (R u) jR) (R u).Cmat).c =
        (((invImC' (R u) (-1)).b.re * ((Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) +
          ((invImC' (R u) (-1)).c.re - jR) * -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹)) *
          (invImC' (R u) 1).b.re +
         ((invImC' (R u) (-1)).b.re * -((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹) +
          ((invImC' (R u) (-1)).c.re - jR) * ((Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹)) *
          ((invImC' (R u) 1).c.re - jR)) := fun u hu => by
    have hzd := (hZPD u hu).2.ne'
    have hcr : SchurKernel.re (R u).Cmat =
        ⟨((invImC' (R u) 1).a.re - (invImC' (R u) (-1)).a.re) / 2,
         ((invImC' (R u) 1).b.re - (invImC' (R u) (-1)).b.re) / 2,
         ((invImC' (R u) 1).c.re - (invImC' (R u) (-1)).c.re) / 2⟩ := by
      simp only [SchurKernel.re, hCeq u hu, Complex.div_ofNat_re, Complex.sub_re]
    have hzeq := hz_eq u hu
    have hdetZ : (Z (Bj (R u) jR)).det = (Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).c - (Z (Bj (R u) jR)).b ^ 2 := rfl
    simp only [T, Kr, add, smul, sand, adj, hcr]
    refine ⟨?_, ?_, ?_⟩ <;> (field_simp [hzd]; rw [hdetZ, hzeq.1, hzeq.2.1, hzeq.2.2]; ring)
  have hta : memTM2 (fun u => (T (Bj (R u) jR) (R u).Cmat).a) taT := fun u hu => by
    dsimp only; rw [(hT_id u hu).1]; exact hta_raw u hu
  have htb : memTM2 (fun u => (T (Bj (R u) jR) (R u).Cmat).b) tbT := fun u hu => by
    dsimp only; rw [(hT_id u hu).2.1]; exact htb_raw u hu
  have htc : memTM2 (fun u => (T (Bj (R u) jR) (R u).Cmat).c) tcT := fun u hu => by
    dsimp only; rw [(hT_id u hu).2.2]; exact htc_raw u hu
  have htdet : memTM2 (fun u => (T (Bj (R u) jR) (R u).Cmat).det) tdetT := by
    simpa only [det, sq] using memTM2_sub (memTM2_mul hta htc) (memTM2_mul htb htb)
  dsimp only at hok
  split_ifs at hok with htbad
  simp only [Bool.not_eq_true', Bool.and_eq_false_iff, not_or, Bool.not_eq_false] at htbad
  have hTPD : ∀ u, |u| ≤ 1 → (T (Bj (R u) jR) (R u).Cmat).PD := fun u hu =>
    ⟨pos_of_tmLo_pos hta htbad.1 hu, pos_of_tmLo_pos htdet htbad.2 hu⟩
  -- `T + 2 E = Z + C_i Z⁻¹ C_i`
  set ciaT := tmHalf (tmSub ipT.a.im imT.a.im)
  set cibT := tmHalf (tmSub ipT.b.im imT.b.im)
  set cicT := tmHalf (tmSub ipT.c.im imT.c.im)
  have hcia_raw := memTM2_half (memTM2_sub hipTM.1.2 himTM.1.2)
  have hcib_raw := memTM2_half (memTM2_sub hipTM.2.1.2 himTM.2.1.2)
  have hcic_raw := memTM2_half (memTM2_sub hipTM.2.2.2 himTM.2.2.2)
  have hci_eq : ∀ u, |u| ≤ 1 →
      (SchurKernel.im (R u).Cmat).a = ((invImC' (R u) 1).a.im - (invImC' (R u) (-1)).a.im) / 2 ∧
      (SchurKernel.im (R u).Cmat).b = ((invImC' (R u) 1).b.im - (invImC' (R u) (-1)).b.im) / 2 ∧
      (SchurKernel.im (R u).Cmat).c = ((invImC' (R u) 1).c.im - (invImC' (R u) (-1)).c.im) / 2 := fun u hu => by
    simp only [SchurKernel.im, hCeq u hu, Complex.div_ofNat_im, Complex.sub_im, and_self]
  have hcia : memTM2 (fun u => (SchurKernel.im (R u).Cmat).a) ciaT := fun u hu => by
    dsimp only; rw [(hci_eq u hu).1]; exact hcia_raw u hu
  have hcib : memTM2 (fun u => (SchurKernel.im (R u).Cmat).b) cibT := fun u hu => by
    dsimp only; rw [(hci_eq u hu).2.1]; exact hcib_raw u hu
  have hcic : memTM2 (fun u => (SchurKernel.im (R u).Cmat).c) cicT := fun u hu => by
    dsimp only; rw [(hci_eq u hu).2.2]; exact hcic_raw u hu
  have hcia2 := memTM2_mul hcia hcia
  have hcib2 := memTM2_mul hcib hcib
  have hcic2 := memTM2_mul hcic hcic
  have hciab := memTM2_mul hcia hcib
  have hcibc := memTM2_mul hcib hcic
  have hsa := memTM2_add (memTM2_add (memTM2_mul hzia hcia2) (memTM2_double (memTM2_mul hzib hciab))) (memTM2_mul hzic hcib2)
  have hsb := memTM2_add (memTM2_add (memTM2_mul hzia hciab) (memTM2_mul hzib (memTM2_add (memTM2_mul hcia hcic) hcib2))) (memTM2_mul hzic hcibc)
  have hsc := memTM2_add (memTM2_add (memTM2_mul hzia hcib2) (memTM2_double (memTM2_mul hzib hcibc))) (memTM2_mul hzic hcic2)
  set saT := tmAdd (tmAdd (tmMul ziaT (tmMul ciaT ciaT)) (tmDouble (tmMul zibT (tmMul ciaT cibT)))) (tmMul zicT (tmMul cibT cibT))
  set sbT := tmAdd (tmAdd (tmMul ziaT (tmMul ciaT cibT)) (tmMul zibT (tmAdd (tmMul ciaT cicT) (tmMul cibT cibT)))) (tmMul zicT (tmMul cibT cicT))
  set scT := tmAdd (tmAdd (tmMul ziaT (tmMul cibT cibT)) (tmDouble (tmMul zibT (tmMul cibT cicT)))) (tmMul zicT (tmMul cicT cicT))
  set teaT := tmAdd (tmAdd zaT saT) (ofRatTM jQ)
  set tebT := tmAdd zbT sbT
  set tecT := tmAdd (tmAdd zcT scT) (ofRatTM jQ)
  set dtjT := tmSub (tmMul (tmAdd taT (ofRatTM jQ)) (tmAdd tcT (ofRatTM jQ))) (tmMul tbT tbT)
  set dtejT := tmSub (tmMul teaT tecT) (tmMul tebT tebT)
  have hTEJ_eq : ∀ u, |u| ≤ 1 →
      (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).a =
        (Z (Bj (R u) jR)).a +
          (((Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).a * (SchurKernel.im (R u).Cmat).a) +
            2 * (-((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).a * (SchurKernel.im (R u).Cmat).b)) +
            ((Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).b * (SchurKernel.im (R u).Cmat).b)) + jR ∧
      (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).b =
        (Z (Bj (R u) jR)).b +
          (((Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).a * (SchurKernel.im (R u).Cmat).b) +
            (-((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹)) * ((SchurKernel.im (R u).Cmat).a * (SchurKernel.im (R u).Cmat).c +
              (SchurKernel.im (R u).Cmat).b * (SchurKernel.im (R u).Cmat).b) +
            ((Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).b * (SchurKernel.im (R u).Cmat).c)) ∧
      (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).c =
        (Z (Bj (R u) jR)).c +
          (((Z (Bj (R u) jR)).c * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).b * (SchurKernel.im (R u).Cmat).b) +
            2 * (-((Z (Bj (R u) jR)).b * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).b * (SchurKernel.im (R u).Cmat).c)) +
            ((Z (Bj (R u) jR)).a * (Z (Bj (R u) jR)).det⁻¹) * ((SchurKernel.im (R u).Cmat).c * (SchurKernel.im (R u).Cmat).c)) + jR := by
    intro u _; simp only [shifted, T, E, Ki, add, smul, sand, adj]; refine ⟨by ring, by ring, by ring⟩
  have htea : memTM2 (fun u => (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).a) teaT :=
    fun u hu => by dsimp only; rw [(hTEJ_eq u hu).1]; exact (memTM2_add (memTM2_add hza' hsa) hjTM) u hu
  have hteb : memTM2 (fun u => (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).b) tebT :=
    fun u hu => by dsimp only; rw [(hTEJ_eq u hu).2.1]; exact (memTM2_add hzb' hsb) u hu
  have htec : memTM2 (fun u => (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).c) tecT :=
    fun u hu => by dsimp only; rw [(hTEJ_eq u hu).2.2]; exact (memTM2_add (memTM2_add hzc' hsc) hjTM) u hu
  have hdtj : memTM2 (fun u => (shifted (T (Bj (R u) jR) (R u).Cmat) jR).det) dtjT := by
    simpa only [shifted, det, sq] using memTM2_sub (memTM2_mul (memTM2_add hta hjTM) (memTM2_add htc hjTM)) (memTM2_mul htb htb)
  have hdtej : memTM2 (fun u => (shifted (add (T (Bj (R u) jR) (R u).Cmat) (smul 2 (E (Bj (R u) jR) (R u).Cmat))) jR).det) dtejT := by
    simpa only [det, sq] using memTM2_sub (memTM2_mul htea htec) (memTM2_mul hteb hteb)
  injection hok with hden_eq; subst hden_eq
  refine ⟨fun u hu => ⟨hZPD u hu, hTPD u hu⟩, ?_⟩
  have hprod := memTM2_mul (memTM2_mul (memTM2_mul h16jTM (memTM2_mul hnpTM hnmTM)) hzdet')
    (memTM2_mul hdtj hdtej)
  convert hprod using 1
  funext u
  have hns : ‖(R u).detIm‖ ^ 2 = Complex.normSq (dpm' (R u) 1) * Complex.normSq (dpm' (R u) (-1)) := by
    have hdet : (R u).detIm = dpm' (R u) 1 * dpm' (R u) (-1) := by
      simp only [Sym2C.detIm, Sym2C.sq, dpm']; ring
    rw [hdet, ← Complex.normSq_mul, Complex.normSq_eq_norm_sq]
  rw [gaussDenominator, hns]
  push_cast; ring

/-- Soundness of `gauss1DFactorTM` on `r : ℝ → ℂ`. -/
private lemma gauss1DFactorTM_sound {r : ℝ → ℂ} {rT : TMC} {jQ : ℚ} {fT : TM2}
    (hr : memTMC r rT)
    (hok : gauss1DFactorTM rT (ofRatTM jQ) (ofRatTM (1 - jQ)) (ofRatTM (1 - 2 * jQ)) (ofRatTM (jQ * jQ)) = some fT) :
    let jR := (jQ : ℝ)
    (∀ u : ℝ, |u| ≤ 1 →
      let x := (r u).re; let y := (r u).im
      let uv := 1 - x ^ 2 + y ^ 2
      let w := y ^ 2 / uv
      let s := uv + 4 * x ^ 2 * w
      0 < uv ∧ 0 < 1 - jR * s ∧ 0 < (1 - 2 * jR - w) + jR ^ 2 * s) ∧
    memTM2 (fun u =>
      let x := (r u).re; let y := (r u).im
      let uv := 1 - x ^ 2 + y ^ 2
      let w := y ^ 2 / uv
      let s := uv + 4 * x ^ 2 * w
      (1 - jR - w) * (1 + y ^ 2 - jR * uv) / (1 - jR * s)) fT := by
  intro jR
  unfold gauss1DFactorTM at hok; dsimp only at hok
  have hx2 : memTM2 (fun u => (r u).re ^ 2) (tmMul rT.re rT.re) := by simpa [sq] using memTM2_mul hr.1 hr.1
  have hy2 : memTM2 (fun u => (r u).im ^ 2) (tmMul rT.im rT.im) := by simpa [sq] using memTM2_mul hr.2 hr.2
  set uT := tmAdd (tmSub tmOne (tmMul rT.re rT.re)) (tmMul rT.im rT.im)
  have huTM : memTM2 (fun u => 1 - (r u).re ^ 2 + (r u).im ^ 2) uT :=
    memTM2_add (memTM2_sub memTM2_one hx2) hy2
  cases hui : tmInvPos uT with
  | none => rw [hui] at hok; simp at hok
  | some ui =>
  rw [hui] at hok; dsimp only at hok
  obtain ⟨hu_pos, hui_tm⟩ := memTM2_invPos huTM hui
  set wT := tmMul (tmMul rT.im rT.im) ui
  set sT := tmAdd uT (tmDouble (tmDouble (tmMul (tmMul rT.re rT.re) wT)))
  have hwTM : memTM2 (fun u => (r u).im ^ 2 / (1 - (r u).re ^ 2 + (r u).im ^ 2)) wT := by
    simpa [div_eq_mul_inv] using memTM2_mul hy2 hui_tm
  have hsTM : memTM2 (fun u => (1 - (r u).re ^ 2 + (r u).im ^ 2) +
      4 * (r u).re ^ 2 * ((r u).im ^ 2 / (1 - (r u).re ^ 2 + (r u).im ^ 2))) sT := by
    have heq : (fun u => (1 - (r u).re ^ 2 + (r u).im ^ 2) +
        4 * (r u).re ^ 2 * ((r u).im ^ 2 / (1 - (r u).re ^ 2 + (r u).im ^ 2))) =
        fun u => (1 - (r u).re ^ 2 + (r u).im ^ 2) +
        2 * (2 * ((r u).re ^ 2 * ((r u).im ^ 2 / (1 - (r u).re ^ 2 + (r u).im ^ 2)))) := by
      funext u; ring
    rw [heq]; exact memTM2_add huTM (memTM2_double (memTM2_double (memTM2_mul hx2 hwTM)))
  have hdenTM := memTM2_sub memTM2_one (memTM2_mul (memTM2_ofRatTM jQ) hsTM)
  cases hdeni : tmInvPos (tmSub tmOne (tmMul (ofRatTM jQ) sT)) with
  | none => rw [hdeni] at hok; simp at hok
  | some deni =>
  rw [hdeni] at hok; dsimp only at hok
  obtain ⟨hden_pos, hdeni_tm⟩ := memTM2_invPos hdenTM hdeni
  have hj2TM : memTM2 (fun _ => jR ^ 2) (ofRatTM (jQ * jQ)) := by
    simpa [jR, sq] using memTM2_ofRatTM (jQ * jQ)
  have hom2jTM : memTM2 (fun _ => 1 - 2 * jR) (ofRatTM (1 - 2 * jQ)) := by
    simpa [jR] using memTM2_ofRatTM (1 - 2 * jQ)
  have homjTM : memTM2 (fun _ => 1 - jR) (ofRatTM (1 - jQ)) := by
    simpa [jR] using memTM2_ofRatTM (1 - jQ)
  have htGateTM := memTM2_add (memTM2_sub hom2jTM hwTM) (memTM2_mul hj2TM hsTM)
  have hnum1TM := memTM2_sub homjTM hwTM
  have hnum2TM := memTM2_sub (memTM2_add memTM2_one hy2) (memTM2_mul (memTM2_ofRatTM jQ) huTM)
  split_ifs at hok with hgates
  injection hok with hf_eq; subst hf_eq
  simp only [Bool.and_eq_true] at hgates
  refine ⟨fun u hu => ⟨hu_pos u hu, hden_pos u hu, pos_of_tmLo_pos htGateTM hgates.1.1 hu⟩, ?_⟩
  simpa only [div_eq_mul_inv] using memTM2_mul (memTM2_mul hnum1TM hnum2TM) hdeni_tm

/-- Simpson integral upper bound for a single `TM2` leaf on `[a, b]`. -/
private lemma integral_le_tm2_simpson {g : ℝ → ℝ} {inv : TM2} {a b : ℝ} (hab : a ≤ b)
    (hg_cont : Continuous g)
    (hle : ∀ u : ℝ, |u| ≤ 1 → g ((a + b) / 2 + (b - a) / 2 * u) ≤
      ((inv.c : ℝ) + (inv.d : ℝ) * u + (inv.q : ℝ) * u ^ 2 + (inv.r : ℝ)) / (D64 : ℝ)) :
    ∫ s in a..b, g s ≤ (b - a) * (3 * (inv.c : ℝ) + (inv.q : ℝ) + 3 * (inv.r : ℝ)) / (3 * (D64 : ℝ)) := by
  rcases eq_or_lt_of_le hab with rfl | hlt
  · simp
  set m := (a + b) / 2
  set h := (b - a) / 2
  have hh : 0 < h := by dsimp only [h]; linarith
  have hD := D64_pos
  have hsub : ∫ s in a..b, g s = h * ∫ u in (-1 : ℝ)..1, g (m + h * u) := by
    have h1 := intervalIntegral.integral_comp_mul_add (f := g) (a := -1) (b := 1) hh.ne' m
    have hlo : h * (-1) + m = a := by dsimp only [m, h]; ring
    have hhi : h * 1 + m = b := by dsimp only [m, h]; ring
    rw [hlo, hhi] at h1
    have hcomm : (fun u : ℝ => g (m + h * u)) = fun u => g (h * u + m) := by funext u; ring_nf
    rw [hcomm, smul_eq_mul] at *
    have := congrArg (h * ·) h1
    rw [← mul_assoc, mul_inv_cancel₀ hh.ne', one_mul] at this
    exact this.symm
  set poly : ℝ → ℝ := fun u =>
    ((inv.c : ℝ) + (inv.d : ℝ) * u + (inv.q : ℝ) * u ^ 2 + (inv.r : ℝ)) / (D64 : ℝ)
  have hpt : ∀ u ∈ Set.Icc (-1 : ℝ) 1, g (m + h * u) ≤ poly u := fun u hu => hle u (abs_le.2 hu)
  have hg_comp_int : IntervalIntegrable (fun u => g (m + h * u)) volume (-1) 1 :=
    (hg_cont.comp (by fun_prop)).intervalIntegrable _ _
  have hpoly_int : IntervalIntegrable poly volume (-1) 1 :=
    (by unfold poly; fun_prop : Continuous poly).intervalIntegrable _ _
  have hint_poly : ∫ u in (-1 : ℝ)..1, poly u =
      2 * (3 * (inv.c : ℝ) + (inv.q : ℝ) + 3 * (inv.r : ℝ)) / (3 * (D64 : ℝ)) := by
    have hsplit : poly = fun u =>
        (((inv.c : ℝ) + (inv.r : ℝ)) / (D64 : ℝ)) +
        ((inv.d : ℝ) / (D64 : ℝ)) * u +
        ((inv.q : ℝ) / (D64 : ℝ)) * u ^ 2 := by funext u; dsimp only [poly]; ring
    rw [hsplit]
    have i0 : IntervalIntegrable (fun _ : ℝ => ((inv.c : ℝ) + (inv.r : ℝ)) / (D64 : ℝ)) volume (-1) 1 :=
      intervalIntegrable_const
    have i1 : IntervalIntegrable (fun u : ℝ => ((inv.d : ℝ) / (D64 : ℝ)) * u) volume (-1) 1 :=
      (by fun_prop : Continuous _).intervalIntegrable _ _
    have i2 : IntervalIntegrable (fun u : ℝ => ((inv.q : ℝ) / (D64 : ℝ)) * u ^ 2) volume (-1) 1 :=
      (by fun_prop : Continuous _).intervalIntegrable _ _
    rw [intervalIntegral.integral_add (i0.add i1) i2, intervalIntegral.integral_add i0 i1,
      intervalIntegral.integral_const, intervalIntegral.integral_const_mul,
      intervalIntegral.integral_const_mul, integral_id, integral_pow]
    simp only [smul_eq_mul]
    ring
  rw [hsub]
  calc h * ∫ u in (-1 : ℝ)..1, g (m + h * u)
      ≤ h * ∫ u in (-1 : ℝ)..1, poly u :=
        mul_le_mul_of_nonneg_left (intervalIntegral.integral_mono_on (by norm_num) hg_comp_int hpoly_int hpt) hh.le
    _ = h * (2 * (3 * (inv.c : ℝ) + (inv.q : ℝ) + 3 * (inv.r : ℝ)) / (3 * (D64 : ℝ))) := by rw [hint_poly]
    _ = (b - a) * (3 * (inv.c : ℝ) + (inv.q : ℝ) + 3 * (inv.r : ℝ)) / (3 * (D64 : ℝ)) := by
        dsimp only [h]; ring

/-- Induction over `sumSimpsonPart` yielding an exact integral upper bound on `[pos/M, (pos + sum)/M]`. -/
private lemma sumSimpsonPart_sound {k : ℕ} (g : ℝ → ℝ)
    (hg_cont : Continuous g)
    (leafInv : ℤ → ℤ → Option TM2)
    (hleaf : ∀ (pos w : ℕ) (inv : TM2),
      pos + w ≤ Nat.pow 2 k →
      leafInv (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) (Nat.div D64N (Nat.mul 2 (Nat.pow 2 k)))))
        (Int.ofNat (Nat.mul w (Nat.div D64N (Nat.mul 2 (Nat.pow 2 k))))) = some inv →
      ∀ u : ℝ, |u| ≤ 1 →
        g (((pos : ℝ) / ((Nat.pow 2 k : ℕ) : ℝ) + ((pos + w : ℕ) : ℝ) / ((Nat.pow 2 k : ℕ) : ℝ)) / 2 +
          (((pos + w : ℕ) : ℝ) / ((Nat.pow 2 k : ℕ) : ℝ) - (pos : ℝ) / ((Nat.pow 2 k : ℕ) : ℝ)) / 2 * u) ≤
        ((inv.c : ℝ) + (inv.d : ℝ) * u + (inv.q : ℝ) * u ^ 2 + (inv.r : ℝ)) / (D64 : ℝ)) :
    ∀ (steps : List ℕ) (pos : ℕ) (acc0 out : ℤ),
      pos + sumNatList steps ≤ Nat.pow 2 k →
      sumSimpsonPart (Nat.div D64N (Nat.mul 2 (Nat.pow 2 k))) leafInv pos steps acc0 = some out →
      ∫ s in ((pos : ℝ) / ((Nat.pow 2 k : ℕ) : ℝ))..(((pos + sumNatList steps : ℕ) : ℝ) / ((Nat.pow 2 k : ℕ) : ℝ)), g s ≤
        ((out - acc0 : ℤ) : ℝ) / (3 * ((Nat.pow 2 k : ℕ) : ℝ) * (D64 : ℝ)) := by
  intro steps
  induction steps with
  | nil =>
    intro pos acc0 out _ h
    simp only [sumSimpsonPart, Option.some.injEq] at h
    subst h
    simp [sumNatList]
  | cons w rest ih =>
    intro pos acc0 out hleM h
    set M := Nat.pow 2 k
    set unit := Nat.div D64N (Nat.mul 2 M)
    have hMpos : (0 : ℝ) < (M : ℝ) := by dsimp only [M]; rw [nat_pow_eq]; positivity
    have hle_rest : (pos + w) + sumNatList rest ≤ M := by
      simpa only [sumNatList, nat_add_eq, Nat.add_assoc] using hleM
    have hle_w : pos + w ≤ M := le_trans (Nat.le_add_right _ _) hle_rest
    unfold sumSimpsonPart at h; dsimp only at h
    cases hli : leafInv (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) with
    | none => rw [hli] at h; simp at h
    | some inv =>
      rw [hli] at h
      set term : ℤ := iMul (Int.ofNat w)
        (iAdd (iAdd (iAdd (iAdd inv.c inv.c) inv.c) inv.q)
          (Int.ofNat (Nat.add (Nat.add inv.r inv.r) inv.r)))
      have hrest := ih (pos + w) (iAdd acc0 term) out hle_rest h
      have h1 := integral_le_tm2_simpson
        (a := (pos : ℝ) / (M : ℝ)) (b := ((pos + w : ℕ) : ℝ) / (M : ℝ))
        (div_le_div_of_nonneg_right (by exact_mod_cast Nat.le_add_right pos w) hMpos.le)
        hg_cont (hleaf pos w inv hle_w hli)
      have hterm_eq : (((pos + w : ℕ) : ℝ) / (M : ℝ) - (pos : ℝ) / (M : ℝ)) *
          (3 * (inv.c : ℝ) + (inv.q : ℝ) + 3 * (inv.r : ℝ)) / (3 * (D64 : ℝ)) =
          (term : ℝ) / (3 * (M : ℝ) * (D64 : ℝ)) := by
        dsimp only [term, iMul, iAdd, int_mul_eq, int_add_eq, Int.ofNat_eq_natCast, nat_add_eq]
        push_cast; field_simp [hMpos.ne', D64_pos.ne']; ring
      rw [hterm_eq] at h1
      have hsum_eq : (((pos + sumNatList (w :: rest) : ℕ) : ℝ) / (M : ℝ)) =
          (((pos + w + sumNatList rest : ℕ) : ℝ) / (M : ℝ)) := by
        simp only [sumNatList, nat_add_eq, Nat.add_assoc]
      rw [hsum_eq, ← intervalIntegral.integral_add_adjacent_intervals
        (hg_cont.intervalIntegrable _ _) (hg_cont.intervalIntegrable _ _)
        (b := ((pos + w : ℕ) : ℝ) / (M : ℝ))]
      calc _ ≤ (term : ℝ) / (3 * (M : ℝ) * (D64 : ℝ)) +
            ((out - iAdd acc0 term : ℤ) : ℝ) / (3 * (M : ℝ) * (D64 : ℝ)) := add_le_add h1 hrest
        _ = ((out - acc0 : ℤ) : ℝ) / (3 * (M : ℝ) * (D64 : ℝ)) := by
            simp only [iAdd, int_add_eq]; push_cast; ring

/-- Induction over `sumSimpsonPart` lifting a leafwise property `P` to `[pos*2*unit/D64, (pos+sum)*2*unit/D64]`. -/
private lemma sumSimpsonPart_forall (unit : ℕ) (leafInv : ℤ → ℤ → Option TM2) (P : ℝ → Prop)
    (hleaf : ∀ (pos w : ℕ) (inv : TM2),
      leafInv (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) = some inv →
      ∀ s : ℝ, ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s →
        s ≤ (((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) → P s) :
    ∀ (steps : List ℕ) (pos : ℕ) (acc0 out : ℤ),
      steps ≠ [] →
      sumSimpsonPart unit leafInv pos steps acc0 = some out →
      ∀ s : ℝ, ((pos : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s →
        s ≤ (((pos + sumNatList steps : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) → P s
  | [], _, _, _, hne, _, _, _, _ => absurd rfl hne
  | [w], pos, acc0, out, _, h, s, h1, h2 => by
    unfold sumSimpsonPart at h; dsimp only at h
    cases hli : leafInv (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) with
    | none => rw [hli] at h; simp at h
    | some inv =>
      simp only [sumNatList, nat_add_eq, add_zero] at h2
      exact hleaf pos w inv hli s h1 h2
  | w :: w2 :: rest, pos, acc0, out, _, h, s, h1, h2 => by
    unfold sumSimpsonPart at h; dsimp only at h
    cases hli : leafInv (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) with
    | none => rw [hli] at h; simp at h
    | some inv =>
      rw [hli] at h
      set mid : ℝ := (((pos + w : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ)
      rcases le_total s mid with hsm | hms
      · exact hleaf pos w inv hli s h1 hsm
      · have h2' : s ≤ ((((pos + w) + sumNatList (w2 :: rest) : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := by
          simpa only [sumNatList, nat_add_eq, Nat.add_assoc] using h2
        exact sumSimpsonPart_forall unit leafInv P hleaf (w2 :: rest) (pos + w) _ out
          (List.cons_ne_nil _ _) h s hms h2'

/-- Master Q1 symmetry + `θ = 2 arctan s` change-of-variables bridge to `(2π)⁻¹ ∫₀^{2π} ‖HholPair‖²`. -/
private theorem hmean_of_Q1_upper {F : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hF1 : ∀ u, ‖F u‖ ≤ 1)
    {m00 m01 m11 : ℝ} {P Q : ℝ[X]} {rhoQ jQ budgetQ : ℚ} {r : ℝ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0, KerPos (RtGen m00 m01 m11 P Q t) l)
    (hQ1_gates : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      let R := RtGen m00 m01 m11 P Q (chartPt (rhoQ : ℝ) false s)
      (Z (Bj R (jQ : ℝ))).PD ∧ (T (Bj R (jQ : ℝ)) R.Cmat).PD)
    (hH_int : ∀ (H : ℝ → ℝ), Continuous H →
      (∀ s ∈ Set.Icc (0 : ℝ) 1,
        H s ≤ ((1 + s ^ 2) * gaussDenominator (RtGen m00 m01 m11 P Q (chartPt (rhoQ : ℝ) false s)) (jQ : ℝ))⁻¹) →
      ∫ s in (0 : ℝ)..1, H s ≤ (piLo20Q : ℝ) * (budgetQ : ℝ) / 4) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholPair F F (RtGen m00 m01 m11 P Q (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤
        (budgetQ : ℝ) := by
  set Rfn := RtGen m00 m01 m11 P Q
  set rho := (rhoQ : ℝ); set j := (jQ : ℝ)
  set f : ℝ → ℝ := fun θ => ‖HholPair F F (Rfn ((rho : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2
  set g : ℝ → ℝ := fun θ => (gaussDenominator (Rfn ((rho : ℂ) * Complex.exp (θ * Complex.I))) j)⁻¹
  have hf_cont : Continuous f := by
    have hd := differentiableOn_HholPair_RtGen hFm hFm hF1 hF1 Metric.isOpen_ball hU
    have hmaps : ∀ θ : ℝ, ((rho : ℂ) * Complex.exp (θ * Complex.I)) ∈ Metric.ball (0 : ℂ) r := fun θ => by
      rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_exp_ofReal_mul_I, mul_one,
        Complex.norm_of_nonneg hρ0]; exact hr
    exact (continuous_norm.comp (hd.continuousOn.comp_continuous (by fun_prop) hmaps)).pow 2
  have hf_int : ∀ a b, IntervalIntegrable f volume a b := fun a b => hf_cont.intervalIntegrable a b
  have hchart_eq : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      chartPt rho false s = (rho : ℂ) * Complex.exp (((2 * Real.arctan s : ℝ) : ℂ) * Complex.I) := fun s _ => by
    have hpos : 0 < 1 + s ^ 2 := by positivity
    have hcos : Real.cos (2 * Real.arctan s) = (1 - s ^ 2) / (1 + s ^ 2) := by
      rw [Real.cos_two_mul, Real.cos_arctan, div_pow, one_pow, Real.sq_sqrt hpos.le]
      field_simp [hpos.ne']; ring
    have hsin : Real.sin (2 * Real.arctan s) = 2 * s / (1 + s ^ 2) := by
      rw [Real.sin_two_mul, Real.sin_arctan, Real.cos_arctan]
      field_simp [Real.sqrt_ne_zero'.2 hpos]
      rw [Real.sq_sqrt hpos.le]
    rw [Complex.exp_mul_I, ← Complex.ofReal_cos, ← Complex.ofReal_sin, hcos, hsin, chartPt]
    simp only [sigB, Bool.false_eq_true, ↓reduceIte, one_mul]; push_cast; ring
  have hpt_Q1_s : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      f (2 * Real.arctan s) ≤ (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := fun s hs => by
    obtain ⟨hZ, hT⟩ := hQ1_gates s hs
    have hbd := SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ hT hFm hFm hF1 hF1
    simpa only [f, one_div, gaussDenominator, ← hchart_eq s hs] using hbd
  have hpt_Q2_s : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      f (Real.pi - 2 * Real.arctan s) ≤ (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := fun s hs => by
    obtain ⟨hZ, hT⟩ := hQ1_gates s hs
    set θ := 2 * Real.arctan s
    have hpt : (rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) = chartPt rho false s := (hchart_eq s hs).symm
    rw [← hpt] at hZ hT
    have hexp : ((rho : ℂ) * Complex.exp (((Real.pi - θ : ℝ) : ℂ) * Complex.I)) =
        -conj ((rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) := by
      rw [Complex.ofReal_sub, sub_mul, Complex.exp_sub, Complex.exp_pi_mul_I, map_mul,
        Complex.conj_ofReal, ← Complex.exp_conj, map_mul, Complex.conj_ofReal, Complex.conj_I,
        show (θ : ℂ) * -Complex.I = -((θ : ℂ) * Complex.I) by ring, Complex.exp_neg]; ring
    set R0 := Rfn ((rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I))
    have hR1 : Rfn ((rho : ℂ) * Complex.exp (((Real.pi - θ : ℝ) : ℂ) * Complex.I)) =
        ⟨-conj R0.a, -conj R0.b, -conj R0.c⟩ := by
      dsimp only [Rfn, R0]; rw [hexp, RtGen_neg, RtGen_conj]
    obtain ⟨hZc, hTc, hDc⟩ := gauss_symm_conj R0 j
    obtain ⟨hZn, hTn, hDn⟩ := gauss_symm_neg ⟨conj R0.a, conj R0.b, conj R0.c⟩ j
    have hZ' : (Z (Bj (Rfn ((rho : ℂ) * Complex.exp (((Real.pi - θ : ℝ) : ℂ) * Complex.I))) j)).PD := by
      rw [hR1]; exact hZn.2 (hZc.2 hZ)
    have hT' : (T (Bj (Rfn ((rho : ℂ) * Complex.exp (((Real.pi - θ : ℝ) : ℂ) * Complex.I))) j)
        (Rfn ((rho : ℂ) * Complex.exp (((Real.pi - θ : ℝ) : ℂ) * Complex.I))).Cmat).PD := by
      rw [hR1]; exact hTn.2 (hTc.2 hT)
    have hD' : gaussDenominator (Rfn ((rho : ℂ) * Complex.exp (((Real.pi - θ : ℝ) : ℂ) * Complex.I))) j =
        gaussDenominator (Rfn (chartPt rho false s)) j := by rw [hR1, hDn, hDc, ← hpt]
    have hbd := SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ' hT' hFm hFm hF1 hF1
    rw [← gaussDenominator, hD'] at hbd
    simpa only [f, one_div] using hbd
  have hpt_Q3_s : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      f (2 * Real.arctan s + Real.pi) ≤ (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := fun s hs => by
    obtain ⟨hZ, hT⟩ := hQ1_gates s hs
    set θ := 2 * Real.arctan s
    have hpt : (rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) = chartPt rho false s := (hchart_eq s hs).symm
    rw [← hpt] at hZ hT
    have hexp : ((rho : ℂ) * Complex.exp (((θ + Real.pi : ℝ) : ℂ) * Complex.I)) =
        -((rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) := by
      rw [Complex.ofReal_add, add_mul, Complex.exp_add, Complex.exp_pi_mul_I]; ring
    set R0 := Rfn ((rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I))
    have hR1 : Rfn ((rho : ℂ) * Complex.exp (((θ + Real.pi : ℝ) : ℂ) * Complex.I)) =
        ⟨-R0.a, -R0.b, -R0.c⟩ := by dsimp only [Rfn, R0]; rw [hexp, RtGen_neg]
    obtain ⟨hZn, hTn, hDn⟩ := gauss_symm_neg R0 j
    have hZ' : (Z (Bj (Rfn ((rho : ℂ) * Complex.exp (((θ + Real.pi : ℝ) : ℂ) * Complex.I))) j)).PD := by
      rw [hR1]; exact hZn.2 hZ
    have hT' : (T (Bj (Rfn ((rho : ℂ) * Complex.exp (((θ + Real.pi : ℝ) : ℂ) * Complex.I))) j)
        (Rfn ((rho : ℂ) * Complex.exp (((θ + Real.pi : ℝ) : ℂ) * Complex.I))).Cmat).PD := by
      rw [hR1]; exact hTn.2 hT
    have hD' : gaussDenominator (Rfn ((rho : ℂ) * Complex.exp (((θ + Real.pi : ℝ) : ℂ) * Complex.I))) j =
        gaussDenominator (Rfn (chartPt rho false s)) j := by rw [hR1, hDn, ← hpt]
    have hbd := SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ' hT' hFm hFm hF1 hF1
    rw [← gaussDenominator, hD'] at hbd
    simpa only [f, one_div] using hbd
  have hpt_Q4_s : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      f (2 * Real.pi - 2 * Real.arctan s) ≤ (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := fun s hs => by
    obtain ⟨hZ, hT⟩ := hQ1_gates s hs
    set θ := 2 * Real.arctan s
    have hpt : (rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I) = chartPt rho false s := (hchart_eq s hs).symm
    rw [← hpt] at hZ hT
    have hexp : ((rho : ℂ) * Complex.exp (((2 * Real.pi - θ : ℝ) : ℂ) * Complex.I)) =
        conj ((rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I)) := by
      rw [Complex.ofReal_sub, Complex.ofReal_mul, Complex.ofReal_ofNat, sub_mul, Complex.exp_sub,
        Complex.exp_two_pi_mul_I, map_mul, Complex.conj_ofReal, ← Complex.exp_conj, map_mul,
        Complex.conj_ofReal, Complex.conj_I, show (θ : ℂ) * -Complex.I = -((θ : ℂ) * Complex.I) by ring,
        Complex.exp_neg]; ring
    set R0 := Rfn ((rho : ℂ) * Complex.exp ((θ : ℂ) * Complex.I))
    have hR1 : Rfn ((rho : ℂ) * Complex.exp (((2 * Real.pi - θ : ℝ) : ℂ) * Complex.I)) =
        ⟨conj R0.a, conj R0.b, conj R0.c⟩ := by dsimp only [Rfn, R0]; rw [hexp, RtGen_conj]
    obtain ⟨hZc, hTc, hDc⟩ := gauss_symm_conj R0 j
    have hZ' : (Z (Bj (Rfn ((rho : ℂ) * Complex.exp (((2 * Real.pi - θ : ℝ) : ℂ) * Complex.I))) j)).PD := by
      rw [hR1]; exact hZc.2 hZ
    have hT' : (T (Bj (Rfn ((rho : ℂ) * Complex.exp (((2 * Real.pi - θ : ℝ) : ℂ) * Complex.I))) j)
        (Rfn ((rho : ℂ) * Complex.exp (((2 * Real.pi - θ : ℝ) : ℂ) * Complex.I))).Cmat).PD := by
      rw [hR1]; exact hTc.2 hT
    have hD' : gaussDenominator (Rfn ((rho : ℂ) * Complex.exp (((2 * Real.pi - θ : ℝ) : ℂ) * Complex.I))) j =
        gaussDenominator (Rfn (chartPt rho false s)) j := by rw [hR1, hDc, ← hpt]
    have hbd := SchurMainGaussian.norm_HholPair_sq_le _ _ hj0 hZ' hT' hFm hFm hF1 hF1
    rw [← gaussDenominator, hD'] at hbd
    simpa only [f, one_div] using hbd
  -- Fold all 4 quadrants into a single continuous integrand `H` on `[0, 1]`
  set F4 : ℝ → ℝ := fun θ => f θ + f (Real.pi - θ) + f (θ + Real.pi) + f (2 * Real.pi - θ)
  have hF4_cont : Continuous F4 := by
    dsimp only [F4]
    exact ((hf_cont.add (hf_cont.comp (continuous_const.sub continuous_id))).add
      (hf_cont.comp (continuous_id.add continuous_const))).add
      (hf_cont.comp (continuous_const.sub continuous_id))
  have hsplit4 : ∫ θ in (0 : ℝ)..(2 * Real.pi), f θ = ∫ θ in (0 : ℝ)..(Real.pi / 2), F4 θ := by
    have h1 := (intervalIntegral.integral_add_adjacent_intervals (hf_int 0 (Real.pi / 2))
      (hf_int (Real.pi / 2) Real.pi)).symm
    have h2 := (intervalIntegral.integral_add_adjacent_intervals (hf_int Real.pi (3 * Real.pi / 2))
      (hf_int (3 * Real.pi / 2) (2 * Real.pi))).symm
    have h3 := (intervalIntegral.integral_add_adjacent_intervals (hf_int 0 Real.pi)
      (hf_int Real.pi (2 * Real.pi))).symm
    have hq2 : ∫ θ in (Real.pi / 2)..Real.pi, f θ = ∫ θ in (0 : ℝ)..(Real.pi / 2), f (Real.pi - θ) := by
      have := intervalIntegral.integral_comp_sub_left f Real.pi (a := 0) (b := Real.pi / 2)
      simpa only [sub_zero, show Real.pi - Real.pi / 2 = Real.pi / 2 by ring] using this.symm
    have hq3 : ∫ θ in Real.pi..(3 * Real.pi / 2), f θ = ∫ θ in (0 : ℝ)..(Real.pi / 2), f (θ + Real.pi) := by
      have := intervalIntegral.integral_comp_add_right f Real.pi (a := 0) (b := Real.pi / 2)
      simpa only [zero_add, show Real.pi / 2 + Real.pi = 3 * Real.pi / 2 by ring] using this.symm
    have hq4 : ∫ θ in (3 * Real.pi / 2)..(2 * Real.pi), f θ =
        ∫ θ in (0 : ℝ)..(Real.pi / 2), f (2 * Real.pi - θ) := by
      have := intervalIntegral.integral_comp_sub_left f (2 * Real.pi) (a := 0) (b := Real.pi / 2)
      simpa only [sub_zero, show 2 * Real.pi - Real.pi / 2 = 3 * Real.pi / 2 by ring] using this.symm
    have hi1 : IntervalIntegrable f volume 0 (Real.pi / 2) := hf_int _ _
    have hi2 : IntervalIntegrable (fun θ => f (Real.pi - θ)) volume 0 (Real.pi / 2) :=
      (hf_cont.comp (continuous_const.sub continuous_id)).intervalIntegrable _ _
    have hi3 : IntervalIntegrable (fun θ => f (θ + Real.pi)) volume 0 (Real.pi / 2) :=
      (hf_cont.comp (continuous_id.add continuous_const)).intervalIntegrable _ _
    have hi4 : IntervalIntegrable (fun θ => f (2 * Real.pi - θ)) volume 0 (Real.pi / 2) :=
      (hf_cont.comp (continuous_const.sub continuous_id)).intervalIntegrable _ _
    dsimp only [F4]
    rw [intervalIntegral.integral_add ((hi1.add hi2).add hi3) hi4,
      intervalIntegral.integral_add (hi1.add hi2) hi3,
      intervalIntegral.integral_add hi1 hi2]
    linarith
  have hchg : ∫ θ in (0 : ℝ)..(Real.pi / 2), F4 θ =
      ∫ s in (0 : ℝ)..1, F4 (2 * Real.arctan s) * (2 / (1 + s ^ 2)) := by
    have hd : ∀ s ∈ Set.uIcc (0 : ℝ) 1,
        HasDerivAt (fun x : ℝ => 2 * Real.arctan x) (2 / (1 + s ^ 2)) s := fun s _ => by
      simpa [div_eq_mul_inv] using (Real.hasDerivAt_arctan s).const_mul (2 : ℝ)
    have hcd : ContinuousOn (fun s : ℝ => 2 / (1 + s ^ 2)) (Set.uIcc 0 1) :=
      (Continuous.div continuous_const (by fun_prop) fun x => by positivity).continuousOn
    have h := intervalIntegral.integral_comp_mul_deriv hd hcd hF4_cont
    have ha : 2 * Real.arctan 0 = 0 := by simp
    have hb : 2 * Real.arctan 1 = Real.pi / 2 := by rw [Real.arctan_one]; ring
    rw [ha, hb] at h; exact h.symm
  set H : ℝ → ℝ := fun s => F4 (2 * Real.arctan s) / (4 * (1 + s ^ 2))
  have hH_cont : Continuous H :=
    (hF4_cont.comp (continuous_const.mul Real.continuous_arctan)).div (by fun_prop) fun s => by positivity
  have hH_eq : (fun s => F4 (2 * Real.arctan s) * (2 / (1 + s ^ 2))) = fun s => 8 * H s := by
    funext s; dsimp only [H]; field_simp [(show (1 + s ^ 2 : ℝ) ≠ 0 by positivity)]; ring
  have hH_le : ∀ s ∈ Set.Icc (0 : ℝ) 1,
      H s ≤ ((1 + s ^ 2) * gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := fun s hs => by
    have h1 := hpt_Q1_s s hs; have h2 := hpt_Q2_s s hs
    have h3 := hpt_Q3_s s hs; have h4 := hpt_Q4_s s hs
    have hpos : 0 < 1 + s ^ 2 := by positivity
    rw [mul_inv]
    dsimp only [H, F4]
    rw [div_le_iff₀ (by positivity)]
    have hsum : f (2 * Real.arctan s) + f (Real.pi - 2 * Real.arctan s) +
        f (2 * Real.arctan s + Real.pi) + f (2 * Real.pi - 2 * Real.arctan s) ≤
        4 * (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := by linarith
    have hmul : (1 + s ^ 2)⁻¹ * (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ * (4 * (1 + s ^ 2)) =
        4 * (gaussDenominator (Rfn (chartPt rho false s)) j)⁻¹ := by field_simp [hpos.ne']
    linarith
  have hint := hH_int H hH_cont hH_le
  have hpi_le : (piLo20Q : ℝ) ≤ Real.pi := by
    have hval : (piLo20Q : ℝ) = 3.14159265358979323846 := by norm_num [piLo20Q]
    rw [hval]; exact Real.pi_gt_d20.le
  rw [hsplit4, hchg, hH_eq, intervalIntegral.integral_const_mul]
  have hpi : 0 < Real.pi := Real.pi_pos
  calc (2 * Real.pi)⁻¹ * (8 * ∫ s in (0 : ℝ)..1, H s)
      = (4 / Real.pi) * ∫ s in (0 : ℝ)..1, H s := by field_simp [hpi.ne']; ring
    _ ≤ (4 / Real.pi) * ((piLo20Q : ℝ) * (budgetQ : ℝ) / 4) :=
        mul_le_mul_of_nonneg_left hint (by positivity)
    _ = ((piLo20Q : ℝ) / Real.pi) * (budgetQ : ℝ) := by field_simp [hpi.ne']
    _ ≤ 1 * (budgetQ : ℝ) := mul_le_mul_of_nonneg_right ((div_le_one hpi).2 hpi_le) hB0
    _ = (budgetQ : ℝ) := one_mul _

/-- Generic soundness wrapper turning `sumSimpsonPart` + cap inequality into both Q1 gates and
the Q1 integral bound for any continuous `H ≤ G`. -/
private lemma Q1_cert_of_sumSimpsonPart {k : ℕ} {steps : List ℕ} {budgetQ : ℚ}
    {P : ℝ → Prop} {G : ℝ → ℝ}
    (leafInv : ℤ → ℤ → Option TM2)
    (hk : k ≤ 63) (hsum : sumNatList steps = Nat.pow 2 k)
    {acc : ℤ}
    (hpart : sumSimpsonPart (Nat.div D64N (Nat.mul 2 (Nat.pow 2 k))) leafInv 0 steps 0 = some acc)
    (hcap : iLe (iMul 4 acc)
      (iMul (Int.ofNat (Nat.mul 3 (Nat.pow 2 k))) (ofRatDown64 (piLo20Q * budgetQ))) = true)
    (hleaf : ∀ (pos w : ℕ) (inv : TM2),
      let M := Nat.pow 2 k
      let unit := Nat.div D64N (Nat.mul 2 M)
      leafInv (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit))
        (Int.ofNat (Nat.mul w unit)) = some inv →
      (∀ u : ℝ, |u| ≤ 1 →
        P (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) / (D64 : ℝ) +
           ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) / (D64 : ℝ) * u)) ∧
      memTM2 (fun u =>
        G ((((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) +
            ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) * u) / (D64 : ℝ))) inv) :
    (∀ s ∈ Set.Icc (0 : ℝ) 1, P s) ∧
    (∀ (H : ℝ → ℝ), Continuous H → (∀ s ∈ Set.Icc (0 : ℝ) 1, H s ≤ G s) →
      ∫ s in (0 : ℝ)..1, H s ≤ (piLo20Q : ℝ) * (budgetQ : ℝ) / 4) := by
  set M := Nat.pow 2 k
  set unit := Nat.div D64N (Nat.mul 2 M)
  have hMposN : 0 < M := by dsimp only [M]; rw [nat_pow_eq]; positivity
  have hMpos : (0 : ℝ) < (M : ℝ) := by exact_mod_cast hMposN
  have hne : steps ≠ [] := by intro h; rw [h] at hsum; simp [sumNatList] at hsum; omega
  have hunit_mul : 2 * M * unit = D64N := by simpa [M, unit, nat_pow_eq] using unit_mul_pow2 hk
  have hunit_mulR : (M : ℝ) * 2 * (unit : ℝ) = (D64 : ℝ) := by
    rw [← D64N_eq_R, ← hunit_mul]; push_cast; ring
  have hunit_pos : 0 < unit := by
    by_contra h0; push Not at h0
    have hu0 : unit = 0 := by omega
    rw [hu0, mul_zero] at hunit_mul; norm_num [D64N] at hunit_mul
  have hs_param : ∀ (pos w : ℕ) (u : ℝ),
      ((pos : ℝ) / (M : ℝ) + ((pos + w : ℕ) : ℝ) / (M : ℝ)) / 2 +
        (((pos + w : ℕ) : ℝ) / (M : ℝ) - (pos : ℝ) / (M : ℝ)) / 2 * u =
      (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) +
       ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) * u) / (D64 : ℝ) := fun pos w u => by
    simp only [Int.ofNat_eq_natCast, nat_add_eq, nat_mul_eq]
    push_cast; rw [← hunit_mulR]; field_simp [hMpos.ne', (show (unit : ℝ) ≠ 0 by positivity)]; ring
  refine ⟨fun s hs => ?_, fun H hH_cont hH_le => ?_⟩
  · have hs0 : ((0 : ℕ) * 2 * (unit : ℝ)) / (D64 : ℝ) ≤ s := by simpa using hs.1
    have hs1 : s ≤ (((0 + sumNatList steps : ℕ) : ℝ) * 2 * (unit : ℝ)) / (D64 : ℝ) := by
      rw [zero_add, hsum, hunit_mulR, div_self D64_pos.ne']; exact hs.2
    refine sumSimpsonPart_forall unit leafInv P (fun pos w inv hli s' h1 h2 => ?_)
      steps 0 0 acc hne hpart s hs0 hs1
    obtain ⟨u, hu, hs'_eq⟩ := exists_u_of_leaf hunit_pos h1 h2
    have hP := (hleaf pos w inv hli).1 u hu
    rw [hs'_eq]; simpa only [add_div, mul_div_right_comm] using hP
  · have hint := sumSimpsonPart_sound (k := k) H hH_cont
      leafInv (fun pos w inv hleM hli u hu => ?_) steps 0 0 acc (by omega) hpart
    · change ∫ s in ((0 : ℕ) : ℝ) / (M : ℝ)..(((0 + sumNatList steps : ℕ) : ℝ) / (M : ℝ)), H s ≤
        ((acc - 0 : ℤ) : ℝ) / (3 * (M : ℝ) * (D64 : ℝ)) at hint
      simp only [Nat.cast_zero, zero_div, zero_add, hsum, div_self hMpos.ne', sub_zero] at hint
      have hcapZ : 4 * acc ≤ (3 * M : ℤ) * ofRatDown64 (piLo20Q * budgetQ) := by
        have h := (iLe_iff _ _).1 hcap
        simpa [iMul, int_mul_eq, Int.ofNat_eq_natCast, nat_mul_eq, M] using h
      have hcapR : 4 * (acc : ℝ) ≤ 3 * (M : ℝ) * (ofRatDown64 (piLo20Q * budgetQ) : ℝ) := by
        exact_mod_cast hcapZ
      have hof : (ofRatDown64 (piLo20Q * budgetQ) : ℝ) ≤ (piLo20Q : ℝ) * (budgetQ : ℝ) * (D64 : ℝ) := by
        simpa only [Rat.cast_mul] using ofRatDown64_le (piLo20Q * budgetQ)
      have hD := D64_pos
      have h3MD : 0 < 3 * (M : ℝ) * (D64 : ℝ) := by positivity
      have h4acc : 4 * (acc : ℝ) ≤ 3 * (M : ℝ) * ((piLo20Q : ℝ) * (budgetQ : ℝ) * (D64 : ℝ)) :=
        hcapR.trans (mul_le_mul_of_nonneg_left hof (by positivity))
      calc ∫ s in (0 : ℝ)..1, H s
          ≤ (acc : ℝ) / (3 * (M : ℝ) * (D64 : ℝ)) := hint
        _ ≤ (3 * (M : ℝ) * ((piLo20Q : ℝ) * (budgetQ : ℝ) * (D64 : ℝ))) /
            (4 * (3 * (M : ℝ) * (D64 : ℝ))) := by
              rw [div_le_div_iff₀ h3MD (by positivity)]
              have := mul_le_mul_of_nonneg_right h4acc h3MD.le
              linarith
        _ = (piLo20Q : ℝ) * (budgetQ : ℝ) / 4 := by field_simp [hMpos.ne', hD.ne']
    · set sVal := ((pos : ℝ) / (M : ℝ) + ((pos + w : ℕ) : ℝ) / (M : ℝ)) / 2 +
        (((pos + w : ℕ) : ℝ) / (M : ℝ) - (pos : ℝ) / (M : ℝ)) / 2 * u
      have hsIcc : sVal ∈ Set.Icc (0 : ℝ) 1 := by
        have hu1 := abs_le.1 hu
        have hle1 : ((pos + w : ℕ) : ℝ) / (M : ℝ) ≤ 1 := (div_le_one hMpos).2 (by exact_mod_cast hleM)
        have hnn : (0 : ℝ) ≤ (pos : ℝ) / (M : ℝ) := by positivity
        have hdiff : 0 ≤ ((pos + w : ℕ) : ℝ) / (M : ℝ) - (pos : ℝ) / (M : ℝ) := by
          have : (pos : ℝ) ≤ ((pos + w : ℕ) : ℝ) := by exact_mod_cast Nat.le_add_right pos w
          rw [sub_nonneg]; exact div_le_div_of_nonneg_right this hMpos.le
        exact ⟨by dsimp only [sVal]; nlinarith, by dsimp only [sVal]; nlinarith⟩
      have hmem := (hleaf pos w inv hli).2 u hu
      have hbd := (abs_le.1 hmem).2
      dsimp only at hbd
      rw [show Nat.div D64N (Nat.mul 2 (Nat.pow 2 k)) = unit from rfl, ← hs_param pos w u] at hbd
      have hG : H sVal ≤ G sVal := hH_le sVal hsIcc
      have hdiv := add_div ((inv.c : ℝ) + (inv.d : ℝ) * u + (inv.q : ℝ) * u ^ 2) (inv.r : ℝ) (D64 : ℝ)
      linarith

private lemma hmean_of_meanQ1SmoothedOK {F : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hF1 : ∀ u, ‖F u‖ ≤ 1)
    {ctQ stQ seQ : ℚ} {pl ql : List ℚ} {rhoQ jQ budgetQ : ℚ} {r : ℝ} {k : ℕ} {steps : List ℕ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0,
      KerPos (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (ofListQ pl) (ofListQ ql) t) l)
    (hok : meanQ1SmoothedOK ctQ stQ seQ pl ql rhoQ jQ budgetQ k steps = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholPair F F (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (ofListQ pl) (ofListQ ql) (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤
        (budgetQ : ℝ) := by
  unfold meanQ1SmoothedOK at hok; dsimp only at hok
  split_ifs at hok with hbad
  simp only [Bool.not_eq_true', Bool.and_eq_false_iff, not_or, Bool.not_eq_false,
    decide_eq_true_eq] at hbad
  cases hp : sumSimpsonPart _ _ 0 steps 0 with
  | none => rw [hp] at hok; simp at hok
  | some acc =>
    rw [hp] at hok
    have ⟨hQ1_gates, hH_int⟩ := Q1_cert_of_sumSimpsonPart
      (P := fun s =>
        let R := RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
          (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
          (ofListQ pl) (ofListQ ql) (chartPt (rhoQ : ℝ) false s)
        (Z (Bj R (jQ : ℝ))).PD ∧ (T (Bj R (jQ : ℝ)) R.Cmat).PD)
      (G := fun s =>
        ((1 + s ^ 2) * gaussDenominator (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
          (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
          (ofListQ pl) (ofListQ ql) (chartPt (rhoQ : ℝ) false s)) (jQ : ℝ))⁻¹)
      _ hbad.1 hbad.2 hp hok (fun pos w inv hli => by
        cases hc : circleTM (ofRatTM rhoQ) (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) _))
            (Int.ofNat (Nat.mul w _)) with
        | none => rw [hc] at hli; simp at hli
        | some p =>
          rw [hc] at hli; dsimp only at hli
          have ⟨hct, honePs2⟩ := memTMC_circleTM hc
          have hRt := memSCT_evalRSmoothed (ctQ := ctQ) (stQ := stQ) (seQ := seQ) (pl := pl) (ql := ql) hct
          cases hd : gauss2x2DenTM (evalRSmoothed (mkSmoothedTMData ctQ stQ seQ pl ql) p.1)
              (ofRatTM jQ) (ofRatTM (16 * jQ * jQ)) with
          | none => rw [hd] at hli; simp at hli
          | some den =>
            rw [hd] at hli; dsimp only at hli
            obtain ⟨hgates, hdenTM⟩ := gauss2x2DenTM_sound hRt hd
            obtain ⟨_, hinvTM⟩ := memTM2_invPos (memTM2_mul honePs2 hdenTM) hli
            refine ⟨fun u hu => ?_, hinvTM⟩
            simpa only [add_div, mul_div_right_comm] using hgates u hu)
    exact hmean_of_Q1_upper hFm hF1 hρ0 hj0 hB0 hr hU hQ1_gates hH_int

private lemma hmean_of_meanQ1PhaseOK {F : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hF1 : ∀ u, ‖F u‖ ≤ 1)
    {pl : List ℚ} {rhoQ jQ budgetQ : ℚ} {r : ℝ} {k : ℕ} {steps : List ℕ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0,
      KerPos (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t) l)
    (hok : meanQ1PhaseOK pl rhoQ jQ budgetQ k steps = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholPair F F (RtGen 1 0 1 (ofListQ pl) (ofListQ []) (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤
        (budgetQ : ℝ) := by
  unfold meanQ1PhaseOK at hok; dsimp only at hok
  split_ifs at hok with hbad
  simp only [Bool.not_eq_true', Bool.and_eq_false_iff, not_or, Bool.not_eq_false,
    decide_eq_true_eq] at hbad
  cases hp : sumSimpsonPart _ _ 0 steps 0 with
  | none => rw [hp] at hok; simp at hok
  | some acc =>
    rw [hp] at hok
    have ⟨hQ1_gates, hH_int⟩ := Q1_cert_of_sumSimpsonPart
      (P := fun s =>
        let R := RtGen 1 0 1 (ofListQ pl) (ofListQ []) (chartPt (rhoQ : ℝ) false s)
        (Z (Bj R (jQ : ℝ))).PD ∧ (T (Bj R (jQ : ℝ)) R.Cmat).PD)
      (G := fun s =>
        ((1 + s ^ 2) * gaussDenominator (RtGen 1 0 1 (ofListQ pl) (ofListQ []) (chartPt (rhoQ : ℝ) false s)) (jQ : ℝ))⁻¹)
      _ hbad.1 hbad.2 hp hok (fun pos w inv hli => by
        cases hc : circleTM (ofRatTM rhoQ) (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) _))
            (Int.ofNat (Nat.mul w _)) with
        | none => rw [hc] at hli; simp at hli
        | some p =>
          rw [hc] at hli; dsimp only at hli
          have ⟨hct, honePs2⟩ := memTMC_circleTM hc
          have hrTM := memTMC_evalOddPoly hct pl
          cases hf : gauss1DFactorTM (evalOddPoly (pl.map ofRatTM) p.1)
              (ofRatTM jQ) (ofRatTM (1 - jQ)) (ofRatTM (1 - 2 * jQ)) (ofRatTM (jQ * jQ)) with
          | none => rw [hf] at hli; simp at hli
          | some fT =>
            rw [hf] at hli; dsimp only at hli
            obtain ⟨h1d, hfTM⟩ := gauss1DFactorTM_sound hrTM hf
            let unit := Nat.div D64N (Nat.mul 2 (Nat.pow 2 k))
            let sFn : ℝ → ℝ := fun u =>
              (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) +
                ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) * u) / (D64 : ℝ)
            have hj1 : (jQ : ℝ) < 1 := by
              obtain ⟨hu0, hden0, ht0⟩ := h1d 0 (by norm_num)
              set rv0 : ℂ := chartPt (rhoQ : ℝ) false (sFn 0) *
                Polynomial.aeval (chartPt (rhoQ : ℝ) false (sFn 0) ^ 2) (ofListQ pl)
              have hw0 : 0 ≤ rv0.im ^ 2 / (1 - rv0.re ^ 2 + rv0.im ^ 2) :=
                div_nonneg (sq_nonneg _) hu0.le
              nlinarith
            have hconstTM : memTM2 (fun _ => 16 * (jQ : ℝ) ^ 2 * (1 - (jQ : ℝ)))
                (ofRatTM (16 * jQ * jQ * (1 - jQ))) := by
              convert memTM2_ofRatTM (16 * jQ * jQ * (1 - jQ)) using 1; funext _; push_cast; ring
            have hdenTM_raw := memTM2_mul hconstTM hfTM
            have hdiag : ∀ u : ℝ, |u| ≤ 1 →
                let t := chartPt (rhoQ : ℝ) false (sFn u)
                let rv := t * Polynomial.aeval (t ^ 2) (ofListQ pl)
                (Z (Bj (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t) (jQ : ℝ))).PD ∧
                (T (Bj (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t) (jQ : ℝ)) (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t).Cmat).PD ∧
                gaussDenominator (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t) (jQ : ℝ) =
                  16 * (jQ : ℝ) ^ 2 * (1 - (jQ : ℝ)) *
                    ((1 - (jQ : ℝ) - rv.im ^ 2 / (1 - rv.re ^ 2 + rv.im ^ 2)) *
                     (1 + rv.im ^ 2 - (jQ : ℝ) * (1 - rv.re ^ 2 + rv.im ^ 2)) /
                     (1 - (jQ : ℝ) * ((1 - rv.re ^ 2 + rv.im ^ 2) +
                       4 * rv.re ^ 2 * (rv.im ^ 2 / (1 - rv.re ^ 2 + rv.im ^ 2))))) := fun u hu => by
              obtain ⟨hu0, hden0, ht0⟩ := h1d u hu
              set t := chartPt (rhoQ : ℝ) false (sFn u)
              set rv := t * Polynomial.aeval (t ^ 2) (ofListQ pl)
              have hgd := gaussDen_diag_phase rv hj0 hj1 hu0 hden0 ht0
              have hRt : RtGen 1 0 1 (ofListQ pl) (ofListQ []) t = ⟨rv, 0, 0⟩ := by
                simp [RtGen, ofListQ, rv]
              simpa only [hRt] using hgd
            have hdenTM : memTM2 (fun u =>
                gaussDenominator (RtGen 1 0 1 (ofListQ pl) (ofListQ [])
                  (chartPt (rhoQ : ℝ) false (sFn u))) (jQ : ℝ))
                (tmMul (ofRatTM (16 * jQ * jQ * (1 - jQ))) fT) := fun u hu => by
              dsimp only; rw [(hdiag u hu).2.2]; exact hdenTM_raw u hu
            obtain ⟨_, hinvTM⟩ := memTM2_invPos (memTM2_mul honePs2 hdenTM) hli
            refine ⟨fun u hu => ?_, hinvTM⟩
            have hs_eq : (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) / (D64 : ℝ) +
                ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) / (D64 : ℝ) * u) = sFn u := by
              dsimp only [sFn]; ring
            rw [hs_eq]
            exact ⟨(hdiag u hu).1, (hdiag u hu).2.1⟩)
    exact hmean_of_Q1_upper hFm hF1 hρ0 hj0 hB0 hr hU hQ1_gates hH_int

private lemma hmean_of_meanQ1AntiOK {F : ℂ × ℂ → ℂ}
    (hFm : Measurable F) (hF1 : ∀ u, ‖F u‖ ≤ 1)
    {rl : List ℚ} {rhoQ jQ budgetQ : ℚ} {r : ℝ} {k : ℕ} {steps : List ℕ}
    (hρ0 : 0 ≤ (rhoQ : ℝ)) (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hr : (rhoQ : ℝ) < r)
    (hU : ∀ t ∈ Metric.ball (0 : ℂ) r, ∃ l > 0,
      KerPos (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t) l)
    (hok : meanQ1AntiOK rl rhoQ jQ budgetQ k steps = true) :
    (2 * Real.pi)⁻¹ * ∫ θ in (0 : ℝ)..2 * Real.pi,
      ‖HholPair F F (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) (((rhoQ : ℝ) : ℂ) * Complex.exp (θ * Complex.I)))‖ ^ 2 ≤
        (budgetQ : ℝ) := by
  have hnegQ : ofListQ (rl.map (- ·)) = -ofListQ rl := ofListQ_map_neg' rl
  unfold meanQ1AntiOK at hok; dsimp only at hok
  split_ifs at hok with hbad
  simp only [Bool.not_eq_true', Bool.and_eq_false_iff, not_or, Bool.not_eq_false,
    decide_eq_true_eq] at hbad
  cases hp : sumSimpsonPart _ _ 0 steps 0 with
  | none => rw [hp] at hok; simp at hok
  | some acc =>
    rw [hp] at hok
    have ⟨hQ1_gates, hH_int⟩ := Q1_cert_of_sumSimpsonPart
      (P := fun s =>
        let R := RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) (chartPt (rhoQ : ℝ) false s)
        (Z (Bj R (jQ : ℝ))).PD ∧ (T (Bj R (jQ : ℝ)) R.Cmat).PD)
      (G := fun s =>
        ((1 + s ^ 2) * gaussDenominator (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) (chartPt (rhoQ : ℝ) false s)) (jQ : ℝ))⁻¹)
      _ hbad.1 hbad.2 hp hok (fun pos w inv hli => by
        cases hc : circleTM (ofRatTM rhoQ) (Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) _))
            (Int.ofNat (Nat.mul w _)) with
        | none => rw [hc] at hli; simp at hli
        | some p =>
          rw [hc] at hli; dsimp only at hli
          have ⟨hct, honePs2⟩ := memTMC_circleTM hc
          have hrTM := memTMC_evalOddPoly hct rl
          cases hf : gauss1DFactorTM (evalOddPoly (rl.map ofRatTM) p.1)
              (ofRatTM jQ) (ofRatTM (1 - jQ)) (ofRatTM (1 - 2 * jQ)) (ofRatTM (jQ * jQ)) with
          | none => rw [hf] at hli; simp at hli
          | some fT =>
            rw [hf] at hli; dsimp only at hli
            obtain ⟨h1d, hfTM⟩ := gauss1DFactorTM_sound hrTM hf
            let unit := Nat.div D64N (Nat.mul 2 (Nat.pow 2 k))
            let sFn : ℝ → ℝ := fun u =>
              (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) +
                ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) * u) / (D64 : ℝ)
            have hconstTM : memTM2 (fun _ => 16 * (jQ : ℝ) ^ 2) (ofRatTM (16 * jQ * jQ)) := by
              convert memTM2_ofRatTM (16 * jQ * jQ) using 1; funext _; push_cast; ring
            have hdenTM_raw := memTM2_mul hconstTM (memTM2_mul hfTM hfTM)
            have hdiag : ∀ u : ℝ, |u| ≤ 1 →
                let t := chartPt (rhoQ : ℝ) false (sFn u)
                let rv := t * Polynomial.aeval (t ^ 2) (ofListQ rl)
                (Z (Bj (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t) (jQ : ℝ))).PD ∧
                (T (Bj (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t) (jQ : ℝ))
                  (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t).Cmat).PD ∧
                gaussDenominator (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t) (jQ : ℝ) =
                  16 * (jQ : ℝ) ^ 2 *
                    ((1 - (jQ : ℝ) - rv.im ^ 2 / (1 - rv.re ^ 2 + rv.im ^ 2)) *
                     (1 + rv.im ^ 2 - (jQ : ℝ) * (1 - rv.re ^ 2 + rv.im ^ 2)) /
                     (1 - (jQ : ℝ) * ((1 - rv.re ^ 2 + rv.im ^ 2) +
                       4 * rv.re ^ 2 * (rv.im ^ 2 / (1 - rv.re ^ 2 + rv.im ^ 2))))) ^ 2 := fun u hu => by
              obtain ⟨hu0, hden0, ht0⟩ := h1d u hu
              set t := chartPt (rhoQ : ℝ) false (sFn u)
              set rv := t * Polynomial.aeval (t ^ 2) (ofListQ rl)
              have hgd := gaussDen_diag_antisym rv hu0 hden0 ht0
              have hRt : RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t = ⟨-rv, 0, rv⟩ := by
                simp only [RtGen, hnegQ, map_neg, rv, Complex.ofReal_one, Complex.ofReal_zero]; congr 1 <;> ring
              simpa only [hRt] using hgd
            have hdenTM : memTM2 (fun u =>
                gaussDenominator (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl)
                  (chartPt (rhoQ : ℝ) false (sFn u))) (jQ : ℝ))
                (tmMul (ofRatTM (16 * jQ * jQ)) (tmMul fT fT)) := fun u hu => by
              dsimp only; rw [(hdiag u hu).2.2]
              convert hdenTM_raw u hu using 2
              dsimp only [sFn, unit]; ring
            obtain ⟨_, hinvTM⟩ := memTM2_invPos (memTM2_mul honePs2 hdenTM) hli
            refine ⟨fun u hu => ?_, hinvTM⟩
            have hs_eq : (((Int.ofNat (Nat.mul (Nat.add (Nat.add pos pos) w) unit) : ℤ) : ℝ) / (D64 : ℝ) +
                ((Int.ofNat (Nat.mul w unit) : ℤ) : ℝ) / (D64 : ℝ) * u) = sFn u := by
              dsimp only [sFn]; ring
            rw [hs_eq]
            exact ⟨(hdiag u hu).1, (hdiag u hu).2.1⟩)
    exact hmean_of_Q1_upper hFm hF1 hρ0 hj0 hB0 hr hU hQ1_gates hH_int

/-! ### 7. Master kernel-certified Hardy channel theorems -/

/-- Master Hardy budget theorem for any smoothed channel certified by `regQ1SmoothedOK` and
`meanQ1SmoothedOK`. -/
theorem hardy_smoothed_channel_tm {ctQ stQ seQ ceQ : ℚ}
    (hd : ctQ ^ 2 + stQ ^ 2 = 1) (he : seQ ^ 2 + ceQ ^ 2 = 1)
    {F : ℂ × ℂ → ℂ} (hFm : Measurable F) (hF1 : ∀ v, ‖F v‖ ≤ 1)
    (hFch : ∀ c v, ‖c‖ = 1 → F (rot2 c v) = c * F v)
    {pl ql : List ℚ} {rhoQ jQ regionRQ budgetQ : ℚ} {kr km : ℕ} {stepsR stepsM : List ℕ}
    (hP : l1 (ofListQ pl) ≤ 1) (hQ : l1 (ofListQ ql) ≤ 1)
    (hρ1 : 1 < (rhoQ : ℝ)) (hrr : (rhoQ : ℝ) < (regionRQ : ℝ))
    (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hreg : regQ1SmoothedOK ctQ stQ seQ pl ql regionRQ kr stepsR = true)
    (hmean_ok : meanQ1SmoothedOK ctQ stQ seQ pl ql rhoQ jQ budgetQ km stepsM = true)
    (J : ℕ) :
    ∑ n ∈ range J, bivarKernel (ofListQ pl) (ofListQ ql)
        (energy ((memLp_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) hFm hF1).toLp
          (smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) F))) n ^ 2 *
      (rhoQ : ℝ) ^ (2 * (2 * n + 1)) ≤ (budgetQ : ℝ) := by
  have hdR : (ctQ : ℝ) ^ 2 + (stQ : ℝ) ^ 2 = 1 := by exact_mod_cast hd
  have heR : (seQ : ℝ) ^ 2 + (ceQ : ℝ) ^ 2 = 1 := by exact_mod_cast he
  set Frot : ℂ × ℂ → ℂ := fun u => F (uRot (ctQ : ℝ) (stQ : ℝ) u)
  have hFrot_m : Measurable Frot := hFm.comp (by unfold uRot; fun_prop)
  have hFrot_1 : ∀ u, ‖Frot u‖ ≤ 1 := fun _ => hF1 _
  have hU := kerPos_on_ball_of_regQ1SmoothedOK (by linarith) hreg
  have hm := hmean_of_meanQ1SmoothedOK hFrot_m hFrot_1 (by linarith) hj0 hB0 hrr hU hmean_ok
  have hs := summable_abs_bivarKernel (ofListQ pl) (ofListQ ql) hP hQ _
    (summable_abs_energy ((memLp_smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) hFm hF1).toLp
      (smoothMap (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ) (ceQ : ℝ) F)))
  have hdiff := differentiableOn_HholPair_RtGen hFrot_m hFrot_m hFrot_1 hFrot_1 Metric.isOpen_ball hU
  have hball := hasSum_odd_of_eqOn_real (by linarith) hdiff hs
    (hreal_smoothed hdR heR hFm hF1 hFch hP hQ)
  refine sum_sq_le_of_mean_le
    (f := fun t => HholPair Frot Frot
      (RtGen (m00Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (m01Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ))
        (m11Sym (ctQ : ℝ) (stQ : ℝ) (seQ : ℝ)) (ofListQ pl) (ofListQ ql) t))
    (fun θ => hball _ ?_)
    (summable_abs_of_hasSum_ball (by linarith) hrr hball) hm J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos (by linarith)]
  exact hrr

/-- Master Hardy budget theorem for the 1D phase channel `R = diag(r, 0)` certified by
`regQ1DiagOK` and `meanQ1PhaseOK`. -/
theorem hardy_phase_channel_tm {G : ℂ × ℂ → ℂ}
    (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hGch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2)
    {pl : List ℚ} {rhoQ jQ regionRQ budgetQ : ℚ} {kr km : ℕ} {stepsR stepsM : List ℕ}
    (hP : l1 (ofListQ pl) ≤ 1)
    (hρ1 : 1 < (rhoQ : ℝ)) (hrr : (rhoQ : ℝ) < (regionRQ : ℝ))
    (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hreg : regQ1DiagOK pl regionRQ kr stepsR = true)
    (hmean_ok : meanQ1PhaseOK pl rhoQ jQ budgetQ km stepsM = true)
    (J : ℕ) :
    ∑ n ∈ range J, bivarKernel (ofListQ pl) (ofListQ []) (energy (hGL.toLp G)) n ^ 2 *
      (rhoQ : ℝ) ^ (2 * (2 * n + 1)) ≤ (budgetQ : ℝ) := by
  have hQ : l1 (ofListQ []) ≤ 1 := by simp [ofListQ, l1]
  have hU := kerPos_on_ball_of_regQ1PhaseOK (by linarith) hreg
  have hm := hmean_of_meanQ1PhaseOK hGm hG1 (by linarith) hj0 hB0 hrr hU hmean_ok
  have hs := summable_abs_bivarKernel (ofListQ pl) (ofListQ []) hP hQ _
    (summable_abs_energy (hGL.toLp G))
  have hdiff := differentiableOn_HholPair_RtGen hGm hGm hG1 hG1 Metric.isOpen_ball hU
  have hball := hasSum_odd_of_eqOn_real (by linarith) hdiff hs
    (hreal_unsmoothed hGm hG1 hGch hGL hP hQ)
  refine sum_sq_le_of_mean_le
    (f := fun t => HholPair G G (RtGen 1 0 1 (ofListQ pl) (ofListQ []) t))
    (fun θ => hball _ ?_)
    (summable_abs_of_hasSum_ball (by linarith) hrr hball) hm J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos (by linarith)]
  exact hrr

/-- Master Hardy budget theorem for an antisymmetric 1D channel `R = diag(-r, r)` certified by
`regQ1DiagOK` and `meanQ1AntiOK`. -/
theorem hardy_anti_channel_tm {G : ℂ × ℂ → ℂ}
    (hGm : Measurable G) (hG1 : ∀ u, ‖G u‖ ≤ 1)
    (hGch : ∀ c u, ‖c‖ = 1 → G (rot2 c u) = c * G u) (hGL : MemLp G 2 mu2)
    {rl : List ℚ} {rhoQ jQ regionRQ budgetQ : ℚ} {kr km : ℕ} {stepsR stepsM : List ℕ}
    (hR : l1 (ofListQ rl) ≤ 1)
    (hρ1 : 1 < (rhoQ : ℝ)) (hrr : (rhoQ : ℝ) < (regionRQ : ℝ))
    (hj0 : 0 < (jQ : ℝ)) (hB0 : 0 ≤ (budgetQ : ℝ))
    (hreg : regQ1DiagOK rl regionRQ kr stepsR = true)
    (hmean_ok : meanQ1AntiOK rl rhoQ jQ budgetQ km stepsM = true)
    (J : ℕ) :
    ∑ n ∈ range J, bivarKernel (ofListQ (rl.map (- ·))) (ofListQ rl) (energy (hGL.toLp G)) n ^ 2 *
      (rhoQ : ℝ) ^ (2 * (2 * n + 1)) ≤ (budgetQ : ℝ) := by
  have hnegQ : ofListQ (rl.map (- ·)) = -ofListQ rl := ofListQ_map_neg' rl
  have hP : l1 (ofListQ (rl.map (- ·))) ≤ 1 := by
    rw [hnegQ]
    have hl1_neg : l1 (-ofListQ rl) = l1 (ofListQ rl) := by
      simp only [l1, Polynomial.sum_def, Polynomial.support_neg, Polynomial.coeff_neg, abs_neg]
    rwa [hl1_neg]
  have hU := kerPos_on_ball_of_regQ1AntiOK (by linarith) hreg
  have hm := hmean_of_meanQ1AntiOK hGm hG1 (by linarith) hj0 hB0 hrr hU hmean_ok
  have hs := summable_abs_bivarKernel (ofListQ (rl.map (- ·))) (ofListQ rl) hP hR _
    (summable_abs_energy (hGL.toLp G))
  have hdiff := differentiableOn_HholPair_RtGen hGm hGm hG1 hG1 Metric.isOpen_ball hU
  have hball := hasSum_odd_of_eqOn_real (by linarith) hdiff hs
    (hreal_unsmoothed hGm hG1 hGch hGL hP hR)
  refine sum_sq_le_of_mean_le
    (f := fun t => HholPair G G (RtGen 1 0 1 (ofListQ (rl.map (- ·))) (ofListQ rl) t))
    (fun θ => hball _ ?_)
    (summable_abs_of_hasSum_ball (by linarith) hrr hball) hm J
  rw [Metric.mem_ball, dist_zero_right, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    Complex.norm_exp_ofReal_mul_I, mul_one, abs_of_pos (by linarith)]
  exact hrr

end

end Haagerup
