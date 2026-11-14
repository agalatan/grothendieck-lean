import Grothe.UpperQuad.Bridge
import Grothe.UpperQuad.RootIdent
import Grothe.UpperQuad.TailBound
import Grothe.UpperQuad.Facts.Budget

/-!
# The exact Gauss sums of the partition in master's terms

The bridge's `gaussRaw partitionSpecs rootOf` (the exact Gauss–Legendre partial sums over the nodes of
the committed partition at the chosen roots) is the sum over master's source addresses
`a : Address` of the node terms at `sourceNode a` with the weights `sourceWeight a`
(`Q0GaussProductionMass`) and the committed cutoffs (`gaussRaw_eq_sum_address`): this is the form in
which the quadrature hypothesis `hQuad` is an analytic statement about master's production nodes
(`docs/QUAD_CHECKER.md` §12).

Agent-ID: claude-b9ee. Refs #303, #21.
-/

namespace Grothe.UpperQuad

open GrotheQuad Grothe.UpperChaos Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.FixedChaosSmoothing
  Grothe.UpperChaos.Q0GaussOrdinalEquiv Grothe.UpperChaos.Q0GaussProductionMass

/-- **The exact Gauss sums of the partition are sums over master's source addresses.** -/
theorem gaussRaw_eq_sum_address (k j cIdx : ℕ) :
    gaussRaw partitionSpecs rootOf k j cIdx =
      ∑ a : Address, nodeTerm (sourceNode a) (sourceWeight a) (addressCutoff a) 0 251 k j cIdx := by
  unfold gaussRaw
  rw [sum_partitionSpecs]
  refine Finset.sum_congr rfl fun a _ => ?_
  unfold specTerm
  rw [specNode_rootOf, specWeight_rootOf]
  rfl

/-- The graded Gauss coefficients in the same terms (reflected for `c > d + 1`). -/
theorem gaussCoeff_eq_gradeValue (q c d : ℕ) :
    gaussCoeff partitionSpecs rootOf q c d =
      gradeValue (fun k j cIdx => ∑ a : Address,
        nodeTerm (sourceNode a) (sourceWeight a) (addressCutoff a) 0 251 k j cIdx)
        (fun _ _ _ => 0) q c d := by
  have h : gaussRaw partitionSpecs rootOf = fun k j cIdx => ∑ a : Address,
      nodeTerm (sourceNode a) (sourceWeight a) (addressCutoff a) 0 251 k j cIdx := by
    funext k j cIdx
    exact gaussRaw_eq_sum_address k j cIdx
  unfold gaussCoeff
  rw [h]

/-! ### The decomposition of `hQuad` -/

/-- The graded vector of a complex coefficient family on the head modes. -/
noncomputable def cvecOf (v : ℕ → ℕ → ℕ → ℂ) : EuclideanSpace ℂ (GradedIdx 251) :=
  WithLp.toLp 2 fun i => v i.1 i.2.1 i.2.2

lemma norm_cvecOf_sq (v : ℕ → ℕ → ℕ → ℂ) :
    ‖cvecOf v‖ ^ 2 = ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖v q c d‖ ^ 2 := by
  rw [EuclideanSpace.norm_eq, Real.sq_sqrt (Finset.sum_nonneg fun _ _ => sq_nonneg _)]
  simp only [cvecOf, PiLp.toLp_apply]
  rw [Fintype.sum_sigma, ← sum_bounded_graded_eq_range 251 (fun q c d => ‖v q c d‖ ^ 2)]
  refine Finset.sum_congr rfl fun q _ => ?_
  rw [Fintype.sum_prod_type]

lemma cvecOf_add (v w : ℕ → ℕ → ℕ → ℂ) :
    cvecOf (fun q c d => v q c d + w q c d) = cvecOf v + cvecOf w := by
  ext i; simp [cvecOf]

lemma norm_cvecOf_le_of_sq_le {v : ℕ → ℕ → ℕ → ℂ} {b : ℝ} (hb : 0 ≤ b)
    (h : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      ‖v q c d‖ ^ 2 ≤ b ^ 2) : ‖cvecOf v‖ ≤ b := by
  exact le_of_sq_le_sq ((norm_cvecOf_sq v).trans_le h) hb

/-- **The Gauss–Legendre remainder hypothesis (part (Q), open)**: on the covered set (the panels), the
F0 coefficients and the exact Gauss sums of the partition without the cutoffs differ by at most
`ρ_Q = 1.5·10⁻¹²` in `ℓ²`. -/
def QuadRemainderHyp : Prop :=
  ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
    ‖Tail.partCoefficient Tail.tailSetᶜ q c d -
      ((gaussCoeffFull partitionSpecs rootOf q c d : ℝ) : ℂ)‖ ^ 2 ≤ ((15 : ℝ) / 10 ^ 13) ^ 2

/-- **`QuadHyp` from its three parts**: the tail and the gaps (`≤ 4·10⁻¹⁶`, proved), the omitted pairs
(`≤ 10⁶³/2²⁵⁶ ≈ 8.7·10⁻¹⁵`, the fact `omittedCheck`) and the remainders on the covered set
(`≤ 1.5·10⁻¹²`, open); `4·10⁻¹⁶ + 8.7·10⁻¹⁵ + 1.5·10⁻¹² ≤ ρ₀ = 1.55·10⁻¹²`. -/
theorem quadHyp_of_parts
    (hC : ∑ q ∈ Finset.range 251, ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
      (gaussCoeffFull partitionSpecs rootOf q c d - gaussCoeff partitionSpecs rootOf q c d) ^ 2 ≤
      ((Facts.omittedBoundNum : ℝ) / (2 : ℝ) ^ (2 * KFix)) ^ 2)
    (hQ : QuadRemainderHyp) : Facts.QuadHyp := by
  unfold Facts.QuadHyp
  -- the three vectors
  have hsplit : ∀ q c d, FixedChaosSmoothing.baseGradedCoefficient q c d -
      ((gaussCoeff partitionSpecs rootOf q c d : ℝ) : ℂ) =
      Tail.partCoefficient Tail.tailSet q c d +
        ((Tail.partCoefficient Tail.tailSetᶜ q c d -
          ((gaussCoeffFull partitionSpecs rootOf q c d : ℝ) : ℂ)) +
        (((gaussCoeffFull partitionSpecs rootOf q c d - gaussCoeff partitionSpecs rootOf q c d : ℝ)) : ℂ)) := by
    intro q c d
    rw [Tail.baseGradedCoefficient_eq_part_add Tail.measurableSet_tailSet q c d]
    push_cast
    ring
  have hT : ‖cvecOf (fun q c d => Tail.partCoefficient Tail.tailSet q c d)‖ ≤ 4 / 10 ^ 16 :=
    norm_cvecOf_le_of_sq_le (by norm_num) (Tail.norm_tail_sq_le.trans (by norm_num))
  have hQ' : ‖cvecOf (fun q c d => Tail.partCoefficient Tail.tailSetᶜ q c d -
      ((gaussCoeffFull partitionSpecs rootOf q c d : ℝ) : ℂ))‖ ≤ 15 / 10 ^ 13 :=
    norm_cvecOf_le_of_sq_le (by norm_num) hQ
  have hC' : ‖cvecOf (fun q c d =>
      (((gaussCoeffFull partitionSpecs rootOf q c d - gaussCoeff partitionSpecs rootOf q c d : ℝ)) : ℂ))‖ ≤
      (Facts.omittedBoundNum : ℝ) / (2 : ℝ) ^ (2 * KFix) := by
    apply norm_cvecOf_le_of_sq_le (by unfold Facts.omittedBoundNum; positivity)
    simpa only [Complex.norm_real, Real.norm_eq_abs, sq_abs] using hC
  have hnum : (4 / 10 ^ 16 : ℝ) + 15 / 10 ^ 13 + (Facts.omittedBoundNum : ℝ) / (2 : ℝ) ^ (2 * KFix) ≤
      (Facts.rhoQ : ℝ) := by
    norm_num [Facts.omittedBoundNum, Facts.rhoQ, KFix]
  have hv : cvecOf (fun q c d => FixedChaosSmoothing.baseGradedCoefficient q c d -
      ((gaussCoeff partitionSpecs rootOf q c d : ℝ) : ℂ)) =
      cvecOf (fun q c d => Tail.partCoefficient Tail.tailSet q c d) +
        (cvecOf (fun q c d => Tail.partCoefficient Tail.tailSetᶜ q c d -
          ((gaussCoeffFull partitionSpecs rootOf q c d : ℝ) : ℂ)) +
        cvecOf (fun q c d =>
          (((gaussCoeffFull partitionSpecs rootOf q c d - gaussCoeff partitionSpecs rootOf q c d : ℝ)) : ℂ))) := by
    rw [← cvecOf_add, ← cvecOf_add]
    congr 1
    funext q c d
    exact hsplit q c d
  rw [← norm_cvecOf_sq, hv]
  apply pow_le_pow_left₀ (norm_nonneg _) _ 2
  calc ‖_ + (_ + _)‖ ≤ ‖cvecOf (fun q c d => Tail.partCoefficient Tail.tailSet q c d)‖ +
        (‖cvecOf (fun q c d => Tail.partCoefficient Tail.tailSetᶜ q c d -
          ((gaussCoeffFull partitionSpecs rootOf q c d : ℝ) : ℂ))‖ +
        ‖cvecOf (fun q c d =>
          (((gaussCoeffFull partitionSpecs rootOf q c d - gaussCoeff partitionSpecs rootOf q c d : ℝ)) : ℂ))‖) :=
        (norm_add_le _ _).trans (add_le_add le_rfl (norm_add_le _ _))
    _ ≤ 4 / 10 ^ 16 + (15 / 10 ^ 13 + (Facts.omittedBoundNum : ℝ) / (2 : ℝ) ^ (2 * KFix)) :=
        add_le_add hT (add_le_add hQ' hC')
    _ ≤ (Facts.rhoQ : ℝ) := by linarith

end Grothe.UpperQuad
