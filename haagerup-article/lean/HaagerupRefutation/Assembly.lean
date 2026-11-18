import HaagerupRefutation.CertData
import HaagerupRefutation.ConvexTransfer
import HaagerupRefutation.HaagerupConstant
import HaagerupRefutation.HeadData

/-!
# The hypotheses `ChannelFacts`, the budget, and the two bounds

The hypothesis of the theorems is `c : ChannelFacts`. Its field `h` is a free family of six real sequences, meant
to be the true kernel coefficients of the six channels of the article; Lean does not construct them. The other
fields are the facts about them that the article establishes (Sections 2–6, with the computation of Section 7):
* `dominated`: each `h i` is a `DominatedRadialSeries` (the channel is realised by a disk-valued rounding scheme);
* `head`: `∑_{k ≤ 250} |h i k - cᵢ(k)| ≤ rᵢ`, with the centres `cᵢ(k)` and radii `rᵢ` of `HeadData`;
* `tail`: `∑_{k > 250} |h i k| ≤ τᵢ`, with the tails `τᵢ` of `HeadData`.

Lean checks the deduction from these facts:
1. The budget `D = ∑ᵢ wᵢ cᵢ(0) - ∑_{k=1}^{250} |∑ᵢ wᵢ cᵢ(k)| - ∑ᵢ wᵢ rᵢ - ∑ᵢ wᵢ τᵢ`, with the weights `wᵢ` of
   `CertData`, is evaluated exactly by the kernel as the integer `budgetNum = 10^12 · S · D` (`budgetNum_eq`),
   which gives `7119595 / 10^7 < D` and `1 / D < 140456109 / 10^8` (`budget_bounds`).
2. The head/tail margin (`cert_margin_of_head_and_tails`) gives `D ≤ H 0 - ∑_{k ≥ 1} |H k|` for the mixture
   `H = ∑ᵢ wᵢ hᵢ` (`ChannelFacts.budget_le_margin`), and `H` is dominated (`ChannelFacts.dominated_mix`).
3. The transfer theorem then gives `complexGrothendieckConstant ≤ 1 / D`, hence
   `complexGrothendieckConstant_le_of_channelFacts` and, with `haagerupDagger < 7119595 / 10^7`,
   `complexGrothendieckConstant_lt_inv_haagerupDagger_of_channelFacts`.
-/

namespace HaagerupRefutation

/-! ### The weights -/

/-- The weights of the six channels: `CertData.w1, …, CertData.w6`. -/
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

/-- The weights times `10^12`, as integers. -/
def weightNum : Fin 6 → ℤ :=
  ![971858734217, 8906483332, 201845612, 18797147285, 50102530, 185687024]

theorem chWeight_eq (i : Fin 6) : chWeight i = (weightNum i : ℝ) / 10 ^ 12 := by
  fin_cases i
  · norm_num [chWeight, weightNum, CertData.w1]
  · norm_num [chWeight, weightNum, CertData.w2]
  · norm_num [chWeight, weightNum, CertData.w3]
  · norm_num [chWeight, weightNum, CertData.w4]
  · norm_num [chWeight, weightNum, CertData.w5]
  · norm_num [chWeight, weightNum, CertData.w6]

/-! ### The budget, exactly, at scale `10^12 · S` -/

/-- `10^12 · S · ∑ᵢ wᵢ cᵢ(k)`, where `cᵢ(k) = (HeadData.centre i)[k] / S`. -/
def mixNum (k : ℕ) : ℤ := ∑ i : Fin 6, weightNum i * (HeadData.centre i).getD k 0

/-- `10^12 · S · D` for the budget `D = ∑ᵢ wᵢ cᵢ(0) - ∑_{k=1}^{250} |∑ᵢ wᵢ cᵢ(k)| - ∑ᵢ wᵢ rᵢ - ∑ᵢ wᵢ τᵢ`,
with `rᵢ = HeadData.radius i / S` and `τᵢ = HeadData.tail i / S`. -/
def budgetNum : ℤ :=
  mixNum 0 - ∑ k ∈ Finset.range 250, |mixNum (k + 1)| -
    ∑ i : Fin 6, weightNum i * HeadData.radius i - ∑ i : Fin 6, weightNum i * HeadData.tail i

/-- The kernel evaluates the budget: `D = budgetNum / 10^42 = 0.71196618737037930921…`. -/
theorem budgetNum_eq : budgetNum = 711966187370379309212814761305187782062687 := by
  decide +kernel

/-- `7119595 / 10^7 < D`. -/
theorem budget_gt_haagerupUpper : 7119595 * 10 ^ 12 * (HeadData.scale : ℤ) < 10 ^ 7 * budgetNum := by
  rw [budgetNum_eq]
  norm_num [HeadData.scale]

/-- `1 / D < 140456109 / 10^8`. -/
theorem budget_inv_lt : 10 ^ 8 * 10 ^ 12 * (HeadData.scale : ℤ) < 140456109 * budgetNum := by
  rw [budgetNum_eq]
  norm_num [HeadData.scale]

/-! ### The budget in the reals -/

theorem scale_pos : (0 : ℝ) < HeadData.scale := by
  norm_num [HeadData.scale]

/-- `∑ᵢ wᵢ cᵢ(k) = mixNum k / (10^12 · S)`. -/
theorem sum_chWeight_centre (k : ℕ) :
    ∑ i, chWeight i * (((HeadData.centre i).getD k 0 : ℝ) / HeadData.scale) =
      (mixNum k : ℝ) / (10 ^ 12 * HeadData.scale) := by
  rw [mixNum, Int.cast_sum, Finset.sum_div]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [chWeight_eq, Int.cast_mul]
  ring

/-- `∑ᵢ wᵢ xᵢ / S = (∑ᵢ 10^12 wᵢ xᵢ) / (10^12 · S)`, for the radii and the tails. -/
theorem sum_chWeight_nat (x : Fin 6 → ℕ) :
    ∑ i, chWeight i * ((x i : ℝ) / HeadData.scale) =
      (∑ i, (weightNum i : ℝ) * x i) / (10 ^ 12 * HeadData.scale) := by
  rw [Finset.sum_div]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [chWeight_eq]
  ring

/-- The budget `D` in the reals equals `budgetNum / (10^12 · S)`. -/
theorem budget_real :
    (∑ i, chWeight i * (((HeadData.centre i).getD 0 0 : ℝ) / HeadData.scale)) -
        ∑ k ∈ Finset.range 250,
          |∑ i, chWeight i * (((HeadData.centre i).getD (k + 1) 0 : ℝ) / HeadData.scale)| -
        ∑ i, chWeight i * ((HeadData.radius i : ℝ) / HeadData.scale) -
        ∑ i, chWeight i * ((HeadData.tail i : ℝ) / HeadData.scale) =
      (budgetNum : ℝ) / (10 ^ 12 * HeadData.scale) := by
  have hM : (0 : ℝ) < 10 ^ 12 * HeadData.scale := by
    have := scale_pos
    positivity
  simp only [sum_chWeight_centre, sum_chWeight_nat, abs_div, abs_of_pos hM, ← Finset.sum_div]
  rw [budgetNum]
  push_cast
  ring

/-- `7119595 / 10^7 < D` and `1 / D < 140456109 / 10^8` for `D = budgetNum / (10^12 · S)`. -/
theorem budget_bounds :
    (7119595 / 10 ^ 7 : ℝ) < (budgetNum : ℝ) / (10 ^ 12 * HeadData.scale) ∧
      1 / ((budgetNum : ℝ) / (10 ^ 12 * HeadData.scale)) < 140456109 / 10 ^ 8 := by
  have hS := scale_pos
  have hM : (0 : ℝ) < 10 ^ 12 * HeadData.scale := by positivity
  have h1 : (7119595 * 10 ^ 12 * HeadData.scale : ℝ) < 10 ^ 7 * budgetNum := by
    exact_mod_cast budget_gt_haagerupUpper
  have h2 : (10 ^ 8 * 10 ^ 12 * HeadData.scale : ℝ) < 140456109 * budgetNum := by
    exact_mod_cast budget_inv_lt
  refine ⟨?_, ?_⟩
  · rw [lt_div_iff₀ hM]
    linarith
  · rw [one_div_div, div_lt_div_iff₀ (by linarith) (by norm_num)]
    linarith

/-! ### The hypotheses and the two bounds -/

/-- The facts about the six channels on which the theorems depend. `h` is a free field: Lean does not construct
the sequences, and the three facts about them are established outside Lean, in the article. -/
structure ChannelFacts where
  /-- The kernel coefficients `h i k` of the six channels (article, Sections 2–4). -/
  h : Fin 6 → ℕ → ℝ
  /-- Each channel is realised by a disk-valued rounding scheme, so its series is dominated (Section 2). -/
  dominated : ∀ i, DominatedRadialSeries (h i)
  /-- The head: `∑_{k ≤ 250} |h i k - cᵢ(k)| ≤ rᵢ` with the data of `HeadData` (Sections 6 and 7). -/
  head : ∀ i, ∑ k ∈ Finset.range 251,
      |h i k - ((HeadData.centre i).getD k 0 : ℝ) / HeadData.scale| ≤
        (HeadData.radius i : ℝ) / HeadData.scale
  /-- The tail: `∑_{k > 250} |h i k| ≤ τᵢ` with the data of `HeadData` (Section 5). -/
  tail : ∀ i, ∑' k, |h i (251 + k)| ≤ (HeadData.tail i : ℝ) / HeadData.scale

/-- The mixture `∑ᵢ wᵢ hᵢ` of the six channels is a dominated radial series. -/
theorem ChannelFacts.dominated_mix (c : ChannelFacts) :
    DominatedRadialSeries fun k => ∑ i : Fin 6, chWeight i * c.h i k :=
  DominatedRadialSeries.convex_finset Finset.univ chWeight (fun i _ => chWeight_nonneg i)
    chWeight_sum_eq_one c.h fun i _ => c.dominated i

/-- The margin of the mixture `H = ∑ᵢ wᵢ hᵢ`: `D ≤ H 0 - ∑_{k ≥ 1} |H k|`. -/
theorem ChannelFacts.budget_le_margin (c : ChannelFacts) :
    (budgetNum : ℝ) / (10 ^ 12 * HeadData.scale) ≤
      (∑ i : Fin 6, chWeight i * c.h i 0) - ∑' k : ℕ, |∑ i : Fin 6, chWeight i * c.h i (k + 1)| := by
  have h_margin := cert_margin_of_head_and_tails Finset.univ 250 chWeight
    (fun i _ => chWeight_nonneg i) c.h
    (fun i k => ((HeadData.centre i).getD k 0 : ℝ) / HeadData.scale)
    (fun i _ => (c.dominated i).summable_abs)
    (fun i => (HeadData.radius i : ℝ) / HeadData.scale) (fun i _ => c.head i)
    (fun i => (HeadData.tail i : ℝ) / HeadData.scale) (fun i _ => c.tail i)
  dsimp only at h_margin
  rw [← budget_real]
  exact h_margin

/-- If the facts `c` hold, then `complexGrothendieckConstant ≤ 1 / D < 1.40456109`. -/
theorem complexGrothendieckConstant_le_of_channelFacts (c : ChannelFacts) :
    complexGrothendieckConstant ≤ 140456109 / 100000000 := by
  obtain ⟨h1, h2⟩ := budget_bounds
  have hpos : (0 : ℝ) < (budgetNum : ℝ) / (10 ^ 12 * HeadData.scale) := by linarith
  have hK := complexGrothendieckConstant_le_inv_of_dominated c.dominated_mix hpos c.budget_le_margin
  linarith

/-- If the facts `c` hold, then `complexGrothendieckConstant ≤ 1 / D < 1 / haagerupDagger`, since
`haagerupDagger < 7119595 / 10^7 < D`. -/
theorem complexGrothendieckConstant_lt_inv_haagerupDagger_of_channelFacts (c : ChannelFacts) :
    complexGrothendieckConstant < 1 / haagerupDagger := by
  obtain ⟨h1, -⟩ := budget_bounds
  have hq : (CertData.haagerupUpperQ : ℝ) = 7119595 / 10 ^ 7 := by
    norm_num [CertData.haagerupUpperQ]
  have hlt : haagerupDagger < (budgetNum : ℝ) / (10 ^ 12 * HeadData.scale) := by
    linarith [haagerupDagger_lt_upper]
  exact (complexGrothendieckConstant_le_inv_of_dominated c.dominated_mix
    (haagerupDagger_pos.trans hlt) c.budget_le_margin).trans_lt
    (one_div_lt_one_div_of_lt haagerupDagger_pos hlt)

end HaagerupRefutation
