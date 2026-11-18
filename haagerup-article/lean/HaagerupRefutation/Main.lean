import HaagerupRefutation.CertData
import HaagerupRefutation.HaagerupConstant
import HaagerupRefutation.ConvexTransfer

/-!
# Conditional bounds on the complex Grothendieck constant

The two theorems of this file take a hypothesis `cert : VerifiedSixChannelData`. Its sequences
`h_true i`, `h_app i` and bounds `tail_err i` are arbitrary fields. Its `dominated` field asserts that
the kernel series of each channel is realised by a disk-valued rounding scheme (it is a
`DominatedRadialSeries`), and its remaining fields record numerical enclosures of the head and the tails.
These facts are established outside Lean and enter only through `cert`.

Lean checks the deduction from them:
* `complexGrothendieckConstant_le_of_certificate`: `complexGrothendieckConstant ≤ 14045611 / 10000000`;
* `complexGrothendieckConstant_lt_inv_haagerupDagger_of_certificate`:
  `complexGrothendieckConstant < 1 / haagerupDagger`.

The ingredients are the weights and the exact budget arithmetic of `CertData`, the bounds
`0 < haagerupDagger < haagerupUpperQ` of `HaagerupConstant`, and the transfer theorem, the closure of
dominated series under convex combinations and the head/tail margin lemma of `ConvexTransfer`.
-/

namespace HaagerupRefutation

/-- Channel weight function `Fin 6 → ℝ` mapped directly from `CertData`. -/
noncomputable def chWeight : Fin 6 → ℝ
  | 0 => (CertData.w1 : ℝ)
  | 1 => (CertData.w2 : ℝ)
  | 2 => (CertData.w3 : ℝ)
  | 3 => (CertData.w4 : ℝ)
  | 4 => (CertData.w5 : ℝ)
  | 5 => (CertData.w6 : ℝ)

theorem chWeight_nonneg (i : Fin 6) : 0 ≤ chWeight i := by
  fin_cases i
  · exact Rat.cast_nonneg.2 CertData.w1_nonneg
  · exact Rat.cast_nonneg.2 CertData.w2_nonneg
  · exact Rat.cast_nonneg.2 CertData.w3_nonneg
  · exact Rat.cast_nonneg.2 CertData.w4_nonneg
  · exact Rat.cast_nonneg.2 CertData.w5_nonneg
  · exact Rat.cast_nonneg.2 CertData.w6_nonneg

theorem chWeight_sum_eq_one : (∑ i : Fin 6, chWeight i) = 1 := by
  rw [Fin.sum_univ_six]
  simp only [chWeight]
  norm_num [CertData.w1, CertData.w2, CertData.w3, CertData.w4, CertData.w5, CertData.w6]

/-- Per-channel comparison error allowance on `0 .. 250`:
`univGTErrUpperQ` on `GT` channels `0, 1, 2`, and `0` on the `tiger`/`phase` channels `3, 4, 5`, for which
`head_comparison` therefore forces `h_app i k = h_true i k` for `k ≤ 250`. -/
noncomputable def chHeadErr : Fin 6 → ℝ
  | 0 => (CertData.univGTErrUpperQ : ℝ)
  | 1 => (CertData.univGTErrUpperQ : ℝ)
  | 2 => (CertData.univGTErrUpperQ : ℝ)
  | 3 => 0
  | 4 => 0
  | 5 => 0

theorem weighted_chHeadErr_eq :
    (∑ i : Fin 6, chWeight i * chHeadErr i) = (CertData.wGT * CertData.univGTErrUpperQ : ℝ) := by
  rw [Fin.sum_univ_six]
  simp only [chWeight, chHeadErr, CertData.wGT]
  push_cast
  ring

/-- The facts about the six channels that are established outside Lean (interval arithmetic and the
analysis of the paper), as hypotheses:
* `h_true i`: the kernel series of channel `i` (`GT`, `tiger` or `phase`);
* `h_app i`: a table / rational-midpoint approximation of it on `0 .. 250`;
* `tail_err i`: a bound on its tail beyond `k = 250`.
The fields are arbitrary; nothing in Lean ties `h_true` to the channels of the paper. -/
structure VerifiedSixChannelData where
  h_true : Fin 6 → ℕ → ℝ
  h_app  : Fin 6 → ℕ → ℝ
  tail_err : Fin 6 → ℝ
  dominated : ∀ i : Fin 6, DominatedRadialSeries (h_true i)
  head_comparison : ∀ i : Fin 6,
    ∑ k ∈ Finset.range 251, |h_true i k - h_app i k| ≤ chHeadErr i
  hardy_tails : ∀ i : Fin 6,
    ∑' k : ℕ, |h_true i (251 + k)| ≤ tail_err i
  h0_enclosure :
    (CertData.h0LowerQ : ℝ) ≤ ∑ i : Fin 6, chWeight i * h_app i 0
  head_l1_enclosure :
    (∑ k ∈ Finset.range 250, |∑ i : Fin 6, chWeight i * h_app i (k + 1)|) ≤
      (CertData.headL1UpperQ : ℝ)
  total_tail_enclosure :
    (∑ i : Fin 6, chWeight i * tail_err i) ≤ (CertData.hardyTailUpperQ : ℝ)

/-- The mixture `∑ᵢ wᵢ h_true i` of the six channels is a dominated radial series. -/
theorem VerifiedSixChannelData.dominated_mix (cert : VerifiedSixChannelData) :
    DominatedRadialSeries fun k => ∑ i : Fin 6, chWeight i * cert.h_true i k :=
  DominatedRadialSeries.convex_finset Finset.univ chWeight (fun i _ => chWeight_nonneg i)
    chWeight_sum_eq_one cert.h_true fun i _ => cert.dominated i

/-- The margin of the mixture `H = ∑ᵢ wᵢ h_true i`: `certDLowerQ ≤ H 0 - ∑_{k ≥ 1} |H k|`. -/
theorem VerifiedSixChannelData.certDLower_le_margin (cert : VerifiedSixChannelData) :
    (CertData.certDLowerQ : ℝ) ≤ (∑ i : Fin 6, chWeight i * cert.h_true i 0) -
      ∑' k : ℕ, |∑ i : Fin 6, chWeight i * cert.h_true i (k + 1)| := by
  have h_margin := cert_margin_of_head_and_tails Finset.univ 250 chWeight
    (fun i _ => chWeight_nonneg i) cert.h_true cert.h_app
    (fun i _ => (cert.dominated i).summable_abs)
    chHeadErr (fun i _ => cert.head_comparison i)
    cert.tail_err (fun i _ => cert.hardy_tails i)
  dsimp only at h_margin
  have h_def : (CertData.certDLowerQ : ℝ) = CertData.h0LowerQ - CertData.headL1UpperQ -
      CertData.wGT * CertData.univGTErrUpperQ - CertData.hardyTailUpperQ := by
    simp only [CertData.certDLowerQ, Rat.cast_sub, Rat.cast_mul]
  linarith [cert.h0_enclosure, cert.head_l1_enclosure, cert.total_tail_enclosure,
    weighted_chHeadErr_eq]

/-- Conditional upper bound: if the facts recorded in `cert` hold, then
`complexGrothendieckConstant ≤ 1 / certDLowerQ < 14045611 / 10000000`. -/
theorem complexGrothendieckConstant_le_of_certificate (cert : VerifiedSixChannelData) :
    complexGrothendieckConstant ≤ (14045611 / 10000000 : ℝ) := by
  have hup : (CertData.haagerupUpperQ : ℝ) < (CertData.certDLowerQ : ℝ) := by
    exact_mod_cast CertData.certDLower_gt_haagerupUpper
  have hD_pos : (0 : ℝ) < (CertData.certDLowerQ : ℝ) := by
    linarith [haagerupDagger_pos, haagerupDagger_lt_upper]
  have h_rec : 1 / (CertData.certDLowerQ : ℝ) < (14045611 / 10000000 : ℝ) := by
    have h : ((1 / CertData.certDLowerQ : ℚ) : ℝ) < ((14045611 / 10000000 : ℚ) : ℝ) :=
      Rat.cast_lt.2 CertData.inv_certDLower_lt_bound
    push_cast at h
    linarith
  exact (complexGrothendieckConstant_le_inv_of_dominated cert.dominated_mix hD_pos
    cert.certDLower_le_margin).trans h_rec.le

/-- Conditional strict inequality: if the facts recorded in `cert` hold, then
`complexGrothendieckConstant ≤ 1 / certDLowerQ < 1 / haagerupDagger`, since
`haagerupDagger < haagerupUpperQ < certDLowerQ`. -/
theorem complexGrothendieckConstant_lt_inv_haagerupDagger_of_certificate
    (cert : VerifiedSixChannelData) :
    complexGrothendieckConstant < 1 / haagerupDagger := by
  have hup : (CertData.haagerupUpperQ : ℝ) < (CertData.certDLowerQ : ℝ) := by
    exact_mod_cast CertData.certDLower_gt_haagerupUpper
  have hgd_lt_D : haagerupDagger < (CertData.certDLowerQ : ℝ) := haagerupDagger_lt_upper.trans hup
  exact (complexGrothendieckConstant_le_inv_of_dominated cert.dominated_mix
    (haagerupDagger_pos.trans hgd_lt_D) cert.certDLower_le_margin).trans_lt
    (one_div_lt_one_div_of_lt haagerupDagger_pos hgd_lt_D)

end HaagerupRefutation
