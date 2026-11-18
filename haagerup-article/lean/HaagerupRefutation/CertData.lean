import Mathlib.Data.Rat.Defs
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Tactic.NormNum

/-!
# Exact rational data of the certificate

The weights and parameters of the six channels of the mixture:
* 3 `GT` channels (`Ch1`, `Ch2`, `Ch3`)
* 1 symmetric `tiger` channel (`Ch4`)
* 2 `phase` channels (`Ch5`, `Ch6`)

Every polynomial has degree `≤ 3` with exact rational coefficients in `10⁻¹² ℤ`.

The file also records the rational bounds of the budget (computed outside Lean) and checks its arithmetic
exactly: `haagerupUpperQ < certDLowerQ` and `1 / certDLowerQ < 14045611 / 10000000`. The theorems in
`Main` use the weights and these bounds; the polynomials, radii and `j` parameters are not used there.
-/

namespace HaagerupRefutation.CertData

/-- Common denominator `10^12` for certificate weights and polynomial coefficients. -/
def certDenom : ℚ := 1000000000000

/-- Exact convex weights `w_1, ..., w_6` of the 6-channel mixture. -/
def w1 : ℚ := 971858734217 / 1000000000000
def w2 : ℚ := 2226620833   / 250000000000
def w3 : ℚ := 50461403     / 250000000000
def w4 : ℚ := 3759429457   / 200000000000
def w5 : ℚ := 5010253      / 100000000000
def w6 : ℚ := 11605439     / 62500000000

/-- List of all 6 channel weights. -/
def weights : List ℚ := [w1, w2, w3, w4, w5, w6]

theorem w1_nonneg : (0 : ℚ) ≤ w1 := by norm_num [w1]
theorem w2_nonneg : (0 : ℚ) ≤ w2 := by norm_num [w2]
theorem w3_nonneg : (0 : ℚ) ≤ w3 := by norm_num [w3]
theorem w4_nonneg : (0 : ℚ) ≤ w4 := by norm_num [w4]
theorem w5_nonneg : (0 : ℚ) ≤ w5 := by norm_num [w5]
theorem w6_nonneg : (0 : ℚ) ≤ w6 := by norm_num [w6]

theorem weights_sum_eq_one : weights.sum = 1 := by
  norm_num [weights, w1, w2, w3, w4, w5, w6]

/-- Combined weight on the three `GT` channels. -/
def wGT : ℚ := w1 + w2 + w3

theorem wGT_eq : wGT = 980967063161 / 1000000000000 := by
  norm_num [wGT, w1, w2, w3]

/-- Coefficient `ℓ¹`-norm `∑ |c_k|` of a polynomial represented as `List ℚ` (low-to-high degree). -/
def l1Norm (cs : List ℚ) : ℚ :=
  (cs.map (fun x => |x|)).sum

-- =========================================================================
-- Channel 1 (`GT`): r = 2073/2000, j = 9/20
-- =========================================================================
def P1 : List ℚ := [991833356533 / certDenom, -8166643466 / certDenom]
def Q1 : List ℚ := [0, -1]
def r1 : ℚ := 2073 / 2000
def j1 : ℚ := 9 / 20

-- =========================================================================
-- Channel 2 (`GT`): r = 2087/2000, j = 1/4
-- =========================================================================
def P2 : List ℚ := [989554427299 / certDenom, 0, 0, -10445572700 / certDenom]
def Q2 : List ℚ := [0, -833435315100 / certDenom, 0, -166564684899 / certDenom]
def r2 : ℚ := 2087 / 2000
def j2 : ℚ := 1 / 4

-- =========================================================================
-- Channel 3 (`GT`): r = 1043/1000, j = 1/4
-- =========================================================================
def P3 : List ℚ := [91371963319 / certDenom, -825194568310 / certDenom, 0, -83433468370 / certDenom]
def Q3 : List ℚ := [0, -999999999999 / certDenom]
def r3 : ℚ := 1043 / 1000
def j3 : ℚ := 1 / 4

-- =========================================================================
-- Channel 4 (`tiger`): r = 28/25, j = 7/20
-- =========================================================================
def R4 : List ℚ := [920082833249 / certDenom, -79917166750 / certDenom]
def r4 : ℚ := 28 / 25
def j4 : ℚ := 7 / 20

-- =========================================================================
-- Channel 5 (`phase`): r = 517/500, j = 1/4
-- =========================================================================
def R5 : List ℚ := [211831968397 / certDenom, -67863691543 / certDenom, 720304340059 / certDenom]
def r5 : ℚ := 517 / 500
def j5 : ℚ := 1 / 4

-- =========================================================================
-- Channel 6 (`phase`): r = 2147/2000, j = 3/20
-- =========================================================================
def R6 : List ℚ := [364133034656 / certDenom, -635866965343 / certDenom]
def r6 : ℚ := 2147 / 2000
def j6 : ℚ := 3 / 20

-- =========================================================================
-- Certified `ℓ¹ ≤ 1`, `Q_i(0) = 0`, and Hardy Parameter Positivity Lemmas
-- =========================================================================

theorem P1_l1_le_one : l1Norm P1 ≤ 1 := by norm_num [l1Norm, P1, certDenom]
theorem Q1_l1_le_one : l1Norm Q1 ≤ 1 := by norm_num [l1Norm, Q1]
theorem P2_l1_le_one : l1Norm P2 ≤ 1 := by norm_num [l1Norm, P2, certDenom]
theorem Q2_l1_le_one : l1Norm Q2 ≤ 1 := by norm_num [l1Norm, Q2, certDenom]
theorem P3_l1_le_one : l1Norm P3 ≤ 1 := by norm_num [l1Norm, P3, certDenom]
theorem Q3_l1_le_one : l1Norm Q3 ≤ 1 := by norm_num [l1Norm, Q3, certDenom]
theorem R4_l1_le_one : l1Norm R4 ≤ 1 := by norm_num [l1Norm, R4, certDenom]
theorem R5_l1_le_one : l1Norm R5 ≤ 1 := by norm_num [l1Norm, R5, certDenom]
theorem R6_l1_le_one : l1Norm R6 ≤ 1 := by norm_num [l1Norm, R6, certDenom]

theorem Q_zero_const :
    Q1.headD 0 = 0 ∧ Q2.headD 0 = 0 ∧ Q3.headD 0 = 0 := by
  norm_num [Q1, Q2, Q3]

theorem hardy_radii_gt_one :
    1 < r1 ∧ 1 < r2 ∧ 1 < r3 ∧ 1 < r4 ∧ 1 < r5 ∧ 1 < r6 := by
  norm_num [r1, r2, r3, r4, r5, r6]

theorem schur_params_in_open_half :
    (0 < j1 ∧ j1 < 1 / 2) ∧ (0 < j2 ∧ j2 < 1 / 2) ∧ (0 < j3 ∧ j3 < 1 / 2) ∧
    (0 < j4 ∧ j4 < 1 / 2) ∧ (0 < j5 ∧ j5 < 1 / 2) ∧ (0 < j6 ∧ j6 < 1 / 2) := by
  norm_num [j1, j2, j3, j4, j5, j6]

-- =========================================================================
-- Certified Rational Enclosure Bounds from `cert_final` (256-Bit Arb)
-- =========================================================================

/-- Lower bound on linear slope `h_0` of the 6-channel mixture (`0.711968933048...`). -/
def h0LowerQ : ℚ := 711968933048 / 1000000000000

/-- Upper bound on finite head residual `∑_{k=1}^{250} |h_k|` (`1.248781... × 10⁻⁶`). -/
def headL1UpperQ : ℚ := 1248782 / 1000000000000

/-- Upper bound on universal (`w ≡ 1`) `GT` comparison + table error (`1.49411634... × 10⁻⁶`). -/
def univGTErrUpperQ : ℚ := 1494117 / 1000000000000

/-- Upper bound on combined infinite Hardy tail `∑_{k > 250} |h_k|` (`3.122 × 10⁻⁸`). -/
def hardyTailUpperQ : ℚ := 32 / 1000000000

/-- Total certified lower bound `D_cert` on `h_0 - ∑_{k ≥ 1} |h_k|`. -/
def certDLowerQ : ℚ :=
  h0LowerQ - headL1UpperQ - wGT * univGTErrUpperQ - hardyTailUpperQ

/-- Certified rational upper bound on Haagerup's `γ†` (`0.711958659778... < 0.7119595`). -/
def haagerupUpperQ : ℚ := 7119595 / 10000000

/-- `haagerupUpperQ < certDLowerQ` (indeed `certDLowerQ > 0.71196618`), in exact rational arithmetic. -/
theorem certDLower_gt_haagerupUpper : haagerupUpperQ < certDLowerQ := by
  norm_num [certDLowerQ, haagerupUpperQ, h0LowerQ, headL1UpperQ, wGT, w1, w2, w3,
            univGTErrUpperQ, hardyTailUpperQ]

/-- `1 / certDLowerQ < 1.4045611`, in exact rational arithmetic. -/
theorem inv_certDLower_lt_bound : 1 / certDLowerQ < 14045611 / 10000000 := by
  norm_num [certDLowerQ, h0LowerQ, headL1UpperQ, wGT, w1, w2, w3,
            univGTErrUpperQ, hardyTailUpperQ]

end HaagerupRefutation.CertData
