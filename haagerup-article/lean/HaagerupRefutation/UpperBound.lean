import HaagerupRefutation.Assembly

/-!
# The upper bound

Start here. `HaagerupRefutation.upper_bound` is the article's upper bound as Lean checks it:

```lean
theorem upper_bound (facts : ChannelFacts) :
    complexGrothendieckConstant ≤ 140456109 / 100000000 ∧
    complexGrothendieckConstant < 1 / haagerupDagger
```

It is conditional: `facts : ChannelFacts` holds the three facts per channel that the article establishes outside
Lean. The definitions in the statement:

* `complexGrothendieckConstant` (`ConvexTransfer.lean`), the least `K ≥ 0` with
  `quantumNorm A ≤ K * classicalNorm A` for every complex matrix `A`:
  ```lean
  noncomputable def complexGrothendieckConstant : ℝ :=
    sInf { K : ℝ | 0 ≤ K ∧ ∀ (m n : ℕ) (A : Matrix (Fin m) (Fin n) ℂ),
      quantumNorm A ≤ K * classicalNorm A }
  ```
  Here `classicalNorm A` is the supremum of `‖∑ A_pq conj(z_p) w_q‖` over complex numbers `‖z_p‖, ‖w_q‖ ≤ 1`, and
  `quantumNorm A` that of `‖∑ A_pq ⟪u_p, v_q⟫‖` over vectors `‖u_p‖, ‖v_q‖ ≤ 1` of `ℂ^N`, for every `N`.
* `haagerupDagger` (`HaagerupConstant.lean`), Haagerup's constant `γ†`:
  ```lean
  noncomputable def haagerupDagger : ℝ :=
    ∫ t in (0 : ℝ)..(π / 2), (cos t) ^ 2 / Real.sqrt (1 + (sin t) ^ 2)
  ```
* `ChannelFacts` (`Assembly.lean`):
  ```lean
  structure ChannelFacts where
    h : Fin 6 → ℕ → ℝ
    dominated : ∀ i, DominatedRadialSeries (h i)
    head : ∀ i, ∑ k ∈ Finset.range 251,
        |h i k - ((HeadData.centre i).getD k 0 : ℝ) / HeadData.scale| ≤
          (HeadData.radius i : ℝ) / HeadData.scale
    tail : ∀ i, ∑' k, |h i (251 + k)| ≤ (HeadData.tail i : ℝ) / HeadData.scale
  ```
  `h i` is the kernel coefficient sequence of channel `i`; Lean does not construct it. `dominated` says that the
  channel is realised by a disk-valued rounding scheme (`DominatedRadialSeries`, `ConvexTransfer.lean`; article,
  Section 2). `head` and `tail` bound `h i` against the exact data of `HeadData.lean`: centres, radii and tails at
  the scale `10^30` (article, Sections 5–7).

## From the statement to the proofs

1. `Assembly.lean`: `complexGrothendieckConstant_le_of_channelFacts` and
   `complexGrothendieckConstant_lt_inv_haagerupDagger_of_channelFacts`. The kernel evaluates the budget `D` from
   `HeadData` exactly (`budgetNum_eq`); the head/tail margin and the transfer theorem give
   `complexGrothendieckConstant ≤ 1 / D < 1.40456109`, and `haagerupDagger < 0.7119595 < D`.
2. `ConvexTransfer.lean`: the transfer theorem `complexGrothendieckConstant_le_inv_of_dominated`, the tensor-power
   lemma `power_form_le_quantumNorm`, closure under convex combinations, and the head/tail margin lemma.
3. `HaagerupConstant.lean`: `0 < haagerupDagger < 0.7119595`.
4. `CertData.lean` and `HeadData.lean`: the exact data (the weights; the head centres, radii and tails).
-/

namespace HaagerupRefutation

/-- **The article's main theorem.** Given the three certified facts per channel (`ChannelFacts`), the complex
Grothendieck constant is at most 1.40456109, hence strictly below `1/γ†`: Haagerup's proposed value is not it. -/
theorem upper_bound (facts : ChannelFacts) :
    complexGrothendieckConstant ≤ 140456109 / 100000000 ∧
    complexGrothendieckConstant < 1 / haagerupDagger :=
  ⟨complexGrothendieckConstant_le_of_channelFacts facts,
    complexGrothendieckConstant_lt_inv_haagerupDagger_of_channelFacts facts⟩

end HaagerupRefutation
