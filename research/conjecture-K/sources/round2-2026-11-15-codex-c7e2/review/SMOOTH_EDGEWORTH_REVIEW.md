<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/review/SMOOTH_EDGEWORTH_REVIEW.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round2/review/SMOOTH_EDGEWORTH_REVIEW.md -->
# Independent review of the explicit smooth remote expansion

Reviewed `../variational/EXPLICIT_SMOOTH_EDGEWORTH.md`, including its final six-tensor strengthening, and its exact-integer checker. No blocking issue found. The strongest reviewed estimate is

    |Em(X)−Em(N_v)−κ Em''''(N_v)/24|≤6||m⁽⁶⁾||∞κ^(3/2).

Its proof no longer imports an external Edgeworth or contraction estimate. It uses the standard Gaussian product formula and integration by parts, elementary tensor norm inequalities, and the stated six-vertex matching argument using Tutte's criterion. It removes the unevaluated2025 total-variation constant and the sixth-cumulant premise from the main full-cubic theorem, and permits a bounded-energy hypothesis on the **absolute** total fourth excess.

## External input checked

The primary PDF of Biermé–Bonami–Nourdin–Peccati, arXiv:1109.1546v1, was opened and checked directly: [paper](https://arxiv.org/pdf/1109.1546). Proposition4.3's proof, equation(4.50), supplies the homogeneous five-kernel inequality used by the first version. The final note supplies its own special-order-three graph proof and then a stronger six-kernel estimate; the external result is now only a comparison reference.

## Independent constant and sign checks

For Γ₀=X=I₃(f) and Γ_{j+1}=⟨DX,−DL⁻¹Γ_j⟩, an input term cI_m(g) yields coefficient

    3c(r−1)! binom(2,r−1) binom(m−1,r−1)

and degree m+3−2r. Constants are removed before the next step. An independent degree-aggregated recurrence gives 22 paths in Γ₄, with coefficients 81,2268,15714,19440 at degrees 7,5,3,1. Combining the kernel bound with κ₄(X)≥1296||f⊗₂f||² gives the claimed L¹ bound below12κ^(5/4). Its unrounded numerical coefficient is approximately11.3845687469. The supplied exact checker also replayed successfully, including the derivative recurrences.

The sign convention v f'−xf=m−Em(N_v) implies

    Em(X)−Em(N_v)
      =−E[(Γ₁−v)f'(X)]
      =−E[Γ₂f''(X)]
      =−(κ/6)Ef'''(X)−E[Γ₄f''''(X)].

Here EΓ₂=0 by symmetry of third chaos and EΓ₃=κ/6. The Gaussian OU semigroup solution has ||f^(j)||∞≤||m^(j+1)||∞/(j+1), including arbitrary v≥0, and Ef'''(N_v)=−Em''''(N_v)/4. Therefore the leading term is **plus** κ Em''''(N_v)/24.

The Γ₄ term is at most(12/5)||m⁽⁵⁾||∞κ^(5/4). The exact cubic identity gives VarΓ₁≤2κ/9. Applying the Gaussian Stein equation to f''' yields a replacement error at most√2||m⁽⁶⁾||∞√κ/36; multiplying byκ/6 produces exactly√2||m⁽⁶⁾||∞κ^(3/2)/216. There is no inverse-variance factor.

## Actual visible profile

For m(x)=πE|ReL+x| and X=Req, circularity gives Em(X)=2E|L+q|, κ=3δ(q)/8, and B''(u)=Em''''(N_{u/2})/16. Hence the leading correction is δ(q)B''(u)/4, with the sign needed for a deficit because B''<0.

The real-coordinate map x↦x(a+b(x²+y²)) has Jacobian J=a+by²+3bx²≥a. Differentiating its conditional density by J⁻¹∂_x produces exactly the three recurrence terms stated in the note. The displayed third/fourth derivative coefficient sums were checked, as was the bound e^(−x²)|x|^d≤1 for d≤4. The resulting explicit M₅,M₆ estimates are valid uniformly for a bounded away from zero and b bounded above. Lower derivatives are bounded too; m itself has only linear growth, as required by the Stein integrations.

## Final six-tensor strengthening

The six-vertex matching proof was independently checked. Add a clique on vertices of degree below three; a perfect matching in this enlarged graph is equivalent to a matching covering the degree-three vertices in the original graph. Tutte's obstruction can only delete one or two vertices. Deleting one would leave at least two odd components consisting entirely of degree-three vertices; neither can be a singleton, so six vertices would remain although only five are available. Deleting two would leave four singletons, at least three of degree three; their nine incident edges cannot fit the deleted vertices' total degree capacity six.

Doubling the contraction graph then permits a perfect matching. Pair contractions inside one copy cannot use three edges because that would disconnect the original graph; cross-copy pairs cannot use three because the original vertex would have degree zero. The resulting six tensors are proper self-contractions. Partial-contraction submultiplicativity of Hilbert norms bounds the closed network by their norm product, proving the six-factor bound. Symmetrizations are convex averages, so they preserve it.

An independent degree-aggregated recursion gives50 paths for Γ₅ and coefficients243,9720,108864,328536,94284 at output degrees8,6,4,2,0. The L² norm estimate has coefficient approximately30.046200945 before rounding up to31; the displayed rational overestimate is30.921875. The checker passed all stated integer identities and independently enumerated23590 connected six-vertex graphs. Those finite checks supplement the analytical proof.

Symmetry gives EΓ₄=κ₅/24=0, so one further integration by parts replaces EΓ₄f'''' by EΓ₅f'''''. The coefficient is then31||m⁽⁶⁾||∞κ^(3/2)/6. Adding the already checked replacement term√2||m⁽⁶⁾||∞κ^(3/2)/216 is strictly less than6||m⁽⁶⁾||∞κ^(3/2). Signs, derivative orders, and absence of an inverse variance factor all check.

## Consequence for the main assembly

The strongest actual-profile expansion has error at most E_*δ^(3/2), where E_*=6(3/8)^(3/2)sup||m⁽⁶⁾||∞. On a bounded profile/energy box let c≤−B''(u)/4. For δ≤[c/(2E_*)]², the remainder is at most cδ/2, and the remote deficit is at least cδ/2. This is an explicit **absolute** fourth-excess condition; no extra δ≤1 cutoff is needed.

Together with V≤(√3/2)√Δ(G), δ(q)≤(5/2)Δ(G), the absolute uniform-Hessian cutoff, and the same absorption argument, this proves the stronger bounded-energy theorem under Δ(G)≤Δ_*. No division by u is necessary, and q=0 causes no difficulty. The all-amplitude normalized cone follows by using χ(G)≤Δ_*/M² before the already checked ray reduction. This still leaves arbitrary large fourth excess unresolved.
