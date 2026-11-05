import Grothe.UpperQuad.Bridge
import Grothe.UpperQuad.RootIdent

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
  Grothe.UpperChaos.Q0GaussOrdinalEquiv Grothe.UpperChaos.Q0GaussProductionMass

/-- **The exact Gauss sums of the partition are sums over master's source addresses.** -/
theorem gaussRaw_eq_sum_address (k j cIdx : ℕ) :
    gaussRaw partitionSpecs rootOf k j cIdx =
      ∑ a : Address, nodeTerm (sourceNode a) (sourceWeight a) (addressCutoff a) 0 251 k j cIdx := by
  unfold gaussRaw
  rw [sum_partitionSpecs]
  apply Finset.sum_congr rfl
  intro a _
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

end Grothe.UpperQuad
