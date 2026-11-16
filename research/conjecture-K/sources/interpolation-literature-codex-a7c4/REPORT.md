<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-interpolation-literature/handoff/interpolation-literature-codex-a7c4/REPORT.md (file dated 2026-11-16). Only this line was added. -->
# Algorithms, spin glasses and Gaussian interpolation for Conjecture K

Author: codex-a7c4. Checked against repository master `7fe22ca8b` and primary literature on 16 November 2026. Task [#464](https://github.com/agalatan/grothendieck-lean/issues/464).

## 1. What this investigation changes

The strongest direct connection is **Malliavin interpolation with a payoff-dependent weight**, not the Parisi formula for a random spin glass. The repository already has the scalar Stein identity and the Gaussian-smoothing sign conjecture. The accompanying `DEFICIT_IDENTITY.md` derives their exact connection to the actual remote deficit, including a quantitative allowance for a sign error:

    C_F(a) = E[(Γ_F − 1) exp(−aF²)],
    D(q) = −√π E_V [√(V+u) ∫₀^{u/(2V)} C_F(a)/(1+2a)^(3/2) da].

Here F=√(2/u)Re q, Γ_F=‖DF‖²/3, and L has the independent Gaussian scale-mixture representation √V W. In particular, a uniform bound C_F(a)≤e gives

    D(q) ≥ −e [B(u)−B(0)].

This is an author-only paper deduction with numerical identity controls, **not a proof of the missing sign**. It suggests certifying the integral for the consumer's profiles and energies instead of first proving sharp Gaussian domination at every scale.

The user's Nourdin–Peccati book supplies a quantitative input: its fourth-cumulant variance bound implies `|C_F(a)|≤√(χ/12)`. Consequently **|D(q)|≤√(χ/12)[B(u)−B(0)]**. At the peak this proves **|D(q)|<10⁻⁴ for 0<u≤0.0463 and χ≤1/45000**, with an exact rational check of the numerical premise. This is a same-variance error estimate, not D≥0 or all-sector closure. `BOOK_NOTES.md` records the derivation and the useful chapters on mixed cumulants, density and universality.

There are two substantive literature corrections. Raghavendra–Steurer's advertised algorithm is for the **real** constant; complex completeness here comes from a separate argument already in the repository. Also, 2026 nonconvex spin-glass formulas mean that an objection based solely on the nonconvexity of bipartite covariance is outdated. A deterministic-to-random transfer, with the correct optimization direction, is still missing.

No Lean theorem, global lower endpoint, or claim that Conjecture K is proved changes. At this snapshot the certified lower endpoint is 1.401700322371; the general sharp radius and full retained/all-sector assembly remain open.

## 2. Raghavendra–Steurer and the complex constant

### The published algorithm and its cost

[Raghavendra–Steurer, SODA 2009](https://www.dsteurer.org/paper/grothendieck.pdf), Theorem 1.3, states additive-η computation of real K_G in `exp(exp(O(η⁻³)))` time. It is approximation to arbitrary accuracy, not exact symbolic evaluation. The construction transfers SDP gaps to smoothed dictatorship tests and back to Gaussian Hermite multipliers; common-influence control and bootstrapping keep errors relative to the SDP. A finite response net makes the multiplier search a linear program. The value computation is unconditional; UGC is used for the hardness conclusion.

Two cautions from checking the displayed proof: §3.3 proves a returned value at least `(1/K_G−O(η)) SDP`, so the introduction's `K_G−η` approximation-factor wording should not be read as beating K_G. Also, its coarse `k=2^(200/η³)` followed by a net of the entire `2^k`-dimensional function ball would give a third exponential. The advertised double-exponential bound should be cited as the theorem, not claimed to follow from that literal enumeration. This survey does not reconstruct its sharper implementation.

The theorem's objects are real matrices, signs and real Gaussian Hermite spaces. It does not establish a complex runtime bound.

[Steurer's later course with Barak](https://www.sumofsquares.org/public/lec02-3_grothendieck) still describes the general computation as double exponential. The searches here found practical bound improvements, not a verified replacement worst-case complexity theorem. This is a search result, not a claim that no such theorem can exist.

### What later work improves

[Naor–Regev, *Krivine schemes are optimal*](https://arxiv.org/abs/1205.6415) proves real Gaussian rounding schemes in dimension k with quality `(1+O(1/k))K_G`. This is useful structural control of the dimension of a rounding scheme. Existence of its distribution over Boolean functions is not an efficient procedure for finding that distribution or evaluating its optimum.

[Heilman–Jones–Malavolta, *Primal/Dual Method*](https://arxiv.org/html/2610.10477v1) reports real bounds 1.773–1.7799 and an implementable primal/dual search. Its graded Gaussian space compactifies limits of Boolean strategies; it supplies a variational framework, not a scalar Parisi PDE or a general runtime improvement over Raghavendra–Steurer. The numerical search and the certifiable witnesses are distinguished in the paper. Example 3.1's single-chaos little-Grothendieck extremality is asserted without its proof; task [#458](https://github.com/agalatan/grothendieck-lean/issues/458) is auditing precisely that claim. It cannot be imported as a proof of ledger 3.6.

[HJM, *Sharper Bounds for the Complex Grothendieck Constant*](https://arxiv.org/abs/2609.25462) provides complex Hermite witnesses and rounding analysis. The reported bounds are weaker than this repository's current certificates. The occurrence of complex Hermite projections is not by itself a completeness or complexity theorem.

### Complex completeness: already in the repository

The analytic proof in `sources/manuscript/legacy/ch17-crossbound.tex`, subsection `sec:complex-duality-proof`, uses charge-one projections P_k=P_{k+1,k}. For real multipliers with λ₀=1 and |λ_k|≤1, define

    N(λ)=sup_n ‖Σ_k λ_k P_k‖∞→1.

For finite mixtures c of actual phase/disk response correlations, its minimax statement is

    1/K_G^C = min_λ N(λ) = sup_c [c₀−Σ_{k≥1}|c_k|].

This is a paper argument in the record, not a new Lean theorem. Circle averaging isolates charge one; conjugate reflection realizes real coefficient sequences. Finite-partition transfer and normalized vector maps Z/‖Z‖ give N(λ)≥1/K_G^C. Residual tensor rounding gives the other side, and Sion minimax identifies them. The proof does not assume compactness of the response set in ℓ¹.

Its finite-degree statement, for B_d the minimum with λ_k=0 for k>d, is

    1/K_G^C ≤ B_d ≤ 1/(K_G^C √r)+r^(d+1),  0<r<1.

For example, choosing r=exp(−log(d+1)/(d+1)) yields an O(log d/d) truncation error (an elementary consequence of the displayed bound). **Degree truncation is not dimension truncation or a computable best-response oracle.** N still takes a supremum over all dimensions and all bounded responses. This is exactly where a finite pool or a numerical optimizer can miss an adversary.

The constructive lesson is to keep two certificates: an upper bound on N(λ) for a lower Grothendieck bound, and a realizable response mixture with its entire tail for an upper Grothendieck bound. A small numerical primal/dual gap without those certificates is evidence only.

## 3. Parisi formulas: what exists and what does not transfer

### Random mean-field models have the requested variational and control formulas

[Auffinger–Chen's ground-state theorem](https://arxiv.org/abs/1606.05335) identifies the limiting energy of a mixed p-spin Gaussian Hamiltonian with covariance `E H_N(σ)H_N(τ)=N ξ(R(σ,τ))` by a zero-temperature variational principle. In the usual normalization,

    P(γ)=Φ_γ(0,h)−½∫₀¹ t ξ″(t)γ(t)dt,
    ∂_t Φ_γ=−½ξ″(t)[∂_xx Φ_γ+γ(t)(∂_x Φ_γ)²],
    Φ_γ(1,x)=|x|,

and one minimizes over nonnegative nondecreasing admissible γ. Normalizations of ξ and H must be fixed before comparing numerical constants.

[Auffinger–Chen's control representation](https://sites.math.northwestern.edu/~auffing/papers/AuffingerChen.pdf) represents the PDE through a controlled diffusion with drift ξ″γv, diffusion √ξ″ and running cost `½ξ″γv²`. This explains how the order parameter determines an algorithmic stochastic process. [Mourrat's *Un-inverting the Parisi formula*](https://arxiv.org/abs/2308.10715) gives a supremum over Wiener-space martingales using stochastic control and convex duality. These are substantial formulas for the specified spin-glass limit, not generic evaluations of every functional of Gaussian variables.

### Montanari's optimization and its limits

[Montanari's SK algorithm](https://arxiv.org/abs/1812.10897) uses incremental approximate message passing: matrix multiplication, scalar nonlinearities from the Parisi solution, and an Onsager correction that removes leading feedback. Under its full-support assumption it finds asymptotically near-optimal Ising configurations in C(ε)N² time, with high probability over the random matrix. This does not give a deterministic upper certificate for a worst-case instance.

[El Alaoui–Montanari–Sellke](https://arxiv.org/html/2001.00904v1), §§2–4, extend the method to mixed p-spin models. Work depends on gradient evaluation, not merely N² for a dense higher-order tensor. Their extended variational problem relaxes the monotonicity constraint on the order parameter. Its value is the algorithmic energy; agreement with the ground-state optimum requires their no-overlap-gap condition. They explicitly distinguish mixtures satisfying that condition from pure higher-p models where it is not expected. AMP is therefore a plausible candidate generator, not a universal certified optimizer.

A very recent preprint, [Herman–Chakrabarti–Kim–Ozgul, 3 November 2026](https://arxiv.org/html/2611.05446v1), claims `O(N²/ε)` work and O(N²) storage for grouped exact-Gaussian-query IAMP, above dimension `K ε⁻² log²(e/ε) log(K/α)`, with success probability 1−α. **Both qualifications matter:** the full-support identity is assumed, and the operation model supplies the Parisi order parameter and PDE derivatives as unit-cost exact oracles. Their construction cost is excluded from that headline theorem. This is a conditional, recent result for random SK, not an unconditional finite-precision Grothendieck algorithm. Grouping diffusion steps reduces costly matrix queries; that engineering idea might help a future random-model oracle.

### The Montanari–Sen constant is about 1.310, not 2.620

[Montanari–Sen](https://arxiv.org/html/1504.05910v3), §1.2, use P₀≈0.763: the centered sparse-graph SDP value is asymptotically `2n√d`, while the balanced Ising value is `2nP₀√d`. Their ratio is `1/P₀≈1.310`. If P*=2P₀≈1.526 is used for the double-sum convention, the same ratio is `2/P*`. Their proof combines a higher-rank Grothendieck inequality, smooth free-energy interpolation, and Gaussian random-matrix analysis.

The normalization P₀ is also explicit in [Dembo–Montanari–Sen, *Extremal cuts of sparse random graphs*](https://arxiv.org/abs/1503.03923). This is a random symmetric quadratic/bisection relaxation. It is neither the universal complex bipartite constant nor the PSD little-Grothendieck problem. Adding a diagonal shift to make a matrix PSD changes both objective values and their ratio; it does not preserve an integrality-gap claim.

### New nonconvex formulas must be included

[Chen–Issa–Mourrat, June 2026](https://arxiv.org/html/2606.16636v1), Theorem 1.1, identifies the limiting free energy of centered multi-species Ising models with nonconvex covariance. Its Hamilton–Jacobi functional J has a **sup_p inf_q′** representation; the old convex-case **sup_q′ inf_p** formula does not generally survive. Their result covers random bipartite Ising models within the stated covariance class. Balanced models admit further reduction.

[Chen–Mourrat, September 2026](https://arxiv.org/abs/2609.32710) treats nonconvex multi-species spherical models, including fields. [Chen, October 2026](https://arxiv.org/html/2611.00710v1) gives a matrix-overlap formulation for spherical vector spins. Its configurations have global row-sphere constraints; they are not automatically independent unit phases at each site. These recent preprints have been read for scope, not independently proved in this investigation.

Thus “nonconvex” is not a general impossibility argument. The remaining transfer questions are concrete: identify the disorder law and admissible spins; derive the exact scalar/matrix overlap covariance; prove that this random-model limit bounds the desired **supremum over deterministic Hermite responses** in the needed direction; and control finite-size and truncation errors. None of the sources checked supplies that transfer for this repository's game.

Sampling Gaussian nodes of a Hermite kernel does not by itself produce SK disorder. Its matrix entries are polynomials in shared node vectors, so they are dependent and generally not jointly Gaussian. A universality argument must address those dependencies and preserve the classical phase optimum; replacing them by independent Gaussian entries changes the problem.

### Hermite games, little Grothendieck, and asymptotic Boolean functions

The repository's minimax formula and HJM's graded Gaussian formulation are genuine variational principles. The searches found no established scalar Parisi/control formula evaluating the classical value of an arbitrary deterministic Hermite game. This absence is the result of this survey, not a nonexistence theorem.

For a projection P, duality gives `OPT(P)=(sup_{q∈range P} E|q|/‖q‖₂)²`. Ledger 3.6 asks whether P₂,₁ attains the complex little-Grothendieck worst-case ratio: dimension-supremum SDP=1 and OPT=π/4. Finite-dimensional SDP need not equal one. [Bandeira–Kennedy–Singer](https://arxiv.org/abs/1308.5207) proves SDP rounding guarantees and matching worst-case gaps for the real/complex little problem; for scalar phases the guarantee is π/4. It gives **OPT≥(π/4)SDP**, whereas the missing projection assertion is **OPT(P₂,₁)≤π/4**. Reversing this inequality would assume the desired extremality.

[Mossel–O'Donnell–Oleszkiewicz's invariance/noise-stability argument](https://www.stat.berkeley.edu/~mossel/publications/moo-focs-final.pdf) makes low-influence Boolean limits comparable to Gaussian functions. It does not say that every nearly extremal cubic has vanishing contractions. HJM's graded limits explicitly retain structured non-Gaussian components. Hypercontractivity and compactness alone therefore cannot replace the extremality argument sought in #458.

[Boué–Dupuis](https://doi.org/10.1214/aop/1022855876) gives a general stochastic-control representation for Brownian Laplace functionals. It retains a high-dimensional adapted control, so it is not the desired low-dimensional evaluator. Furthermore, `E exp(β|q|)=∞` for a nonzero polynomial with a genuine cubic leading part and β>0: on a cone its cubic growth beats the Gaussian quadratic tail. Applying a bounded-functional formula directly to this exponential would be invalid. Truncation or a different functional is required.

## 4. Gaussian interpolation and the precise obstruction

### What makes Guerra's sign work

[Guerra](https://arxiv.org/abs/cond-mat/0205123) interpolates jointly Gaussian indexed Hamiltonians against a hierarchical trial field. Gaussian integration by parts reduces the error to overlap terms with the sign of the convexity remainder `ξ(R)−ξ(q)−ξ′(q)(R−q)`. With pressure `N⁻¹ E log Z`, this gives the Parisi upper bound; physical free energy uses the opposite sign convention.

[Talagrand's Parisi proof](https://annals.math.princeton.edu/2006/163-1/p04) supplies the matching result for SK/even mixed models. [Panchenko](https://arxiv.org/abs/1112.4409) extends it to general mixed p-spin models using the ultrametricity/Ghirlanda–Guerra structure. Neither theorem says that a Gaussian maximizes E|X| among fixed-variance nonlinear functions of Gaussians.

Our cubic q is a **nonlinear function of Gaussian inputs**, not a centered Gaussian Hamiltonian indexed by spins. Its integration-by-parts covariance is random and correlated with the payoff curvature. Substituting the number EΓ=1 loses precisely that correlation. There is no known overlap-convexity remainder that signs it.

A useful normalization check follows from the Parisi PDE above: its trial γ=0 gives `GSE≤E|h+√ξ′(1)G|` when ξ′(0)=0. For ξ(t)=t³, that scale is √3, not √ξ(1)=1. Even this Gaussian trial bounds a random-model ground state; it is not the unit-variance cubic L¹ comparison sought here.

### Comparison tools and their scope

| Tool | Available comparison | Missing hypothesis here |
|---|---|---|
| [Slepian](https://doi.org/10.1002/j.1538-7305.1962.tb02419.x), Sudakov–Fernique | Gaussian vectors/processes with suitable covariance/increment order | q is not Gaussian; variance alone does not determine its law |
| [Gaussian min-max comparison](https://arxiv.org/abs/2402.07356), building on Gordon | Structured Gaussian min-max processes and covariance inequalities | No matching Gaussian min-max representation of the cubic response objective |
| [Borell, with Mossel–Neeman's semigroup/robust proof](https://arxiv.org/abs/1210.4126) | Halfspaces extremize scalar Gaussian noise stability at fixed measures | A signed Hermite multiplier is not the positive noise operator T_ρ; single-degree energy is not the full noise-stability objective |
| [Heilman's vector-valued noise stability](https://arxiv.org/abs/2306.03912) | Sphere S² targets for the stated small-correlation range | Not a theorem for all complex phase games or arbitrary signed multipliers |
| [Nourdin–Peccati](https://arxiv.org/abs/0712.2940) | Quantitative normal approximation from Malliavin variance/contractions | An absolute error estimate does not give the one-sided sharp sign |
| [Nourdin–Peccati–Viens](https://arxiv.org/html/1306.2430v1), Theorem 2.1 | Non-Gaussian comparison with an almost-sure order of Malliavin increment metrics | For {−F,F} versus {−G,G}, it would require Γ_F≤1 almost surely |

The last obstruction can be checked directly: Δ_F(−,+)=4Γ_F and Δ_G(−,+)=4. But EΓ_F=1, so Γ_F≤1 would force Γ_F=1. For a nonzero genuine cubic, Γ_F is an unbounded quartic polynomial. Thus the theorem is relevant, but this direct application cannot close the problem. Its interpolation identity motivates a weaker **weighted** condition; that is what `DEFICIT_IDENTITY.md` records.

The existing `sources/third-chaos-2026-11-16/gpt/stein_reduction.txt` already proves

    E|F|−√(2/π)=√(2/π) E[(Γ_F−1)w(|F|)],

with a positive decreasing Mills kernel w. It also derives the Gaussian-smoothing sign target C_F(a)≤0. The latter is sufficient and stronger than the one endpoint radius bound; this report does not claim equivalence for an individual F. Pointwise monotonicity of the conditional Stein kernel already fails for He₃, as that source shows.

[Nourdin–Peccati's Edgeworth work](https://arxiv.org/abs/0803.0458) explains why signed corrections can be retained near a Gaussian. The repository has already implemented that route in ledger 3.19 with an explicit remainder and a small-χ positive deficit. Enlarging that region requires sharper signed remainders or weighted cuts; a central limit theorem alone provides neither.

A stochastic-control analogy also needs constraints. Brownian motion stopped on first hitting ±1 has Eτ=1 and E|B_τ|=1>√(2/π). Thus fixing only expected quadratic variation does not make a Gaussian maximize absolute value. This is not a cubic counterexample; it isolates why an arbitrary martingale relaxation is too loose. The constraint must retain the third-chaos structure.

## 5. Spin-glass and Bell connections

[Schmidt's frustrated-spin formulation](https://arxiv.org/abs/cond-mat/0604591) identifies Bell-inequality examples with the difference between Ising and vector-spin ground-state energies. [Acín–Gisin–Toner](https://arxiv.org/abs/quant-ph/0606138) relates projective-measurement locality of two-qubit Werner states to the real order-three Grothendieck constant. These are concrete links, but complex Hilbert spaces in quantum mechanics do not turn the binary-output correlation problem into K_G^C: its observable correlations are real.

For a complex matrix A, the phase objective `max Re Σ A_ij conjugate(z_i)w_j` is a bipartite XY-type optimization; the vector relaxation is different again. This is a useful modeling analogy for candidate generation. A random-coupling ground-state calculation describes a particular ensemble, while the Grothendieck constant is a worst-case ratio. Any proposed improvement must provide both the vector payoff and an upper bound on the correct classical phase optimum for the same instance.

## 6. Research actions ranked by usefulness here

1. **Weighted Stein cuts for the actual rows.** Use the exact identity to target its positive-weight integral, allowing a quantified error. A single certified shape-transform envelope can be reused with different energy/profile weights. Start with the existing near-Gaussian theorem and Gaussian mixtures; investigate the remaining (u,χ) region. A successful paper proof must control all dimensions. Numerical sign tests supply candidates, not that control.
2. **Preserve sharing when moving to the all-sector problem.** For q together with A/B and odd drivers, interpolation produces mixed Malliavin entries. They cannot be dropped because the marginal law of q is nearly Gaussian. The odd-sector partial-q/anisotropic results in ledger 7.2 already address this. The present scalar identity must not be advertised as their missing assembly lemma or as proof of compact premise (P).
3. **Use a certified response oracle in primal/dual search.** Borrow the separation-loop architecture, keeping global norm upper certificates and complete response tails. This is the productive computational descendant of Raghavendra–Steurer; brute force at η≈10⁻⁴ is not a plausible implementation.
4. **Test a random-model representation before implementing Parisi/AMP.** Write down the covariance and spin constraints and prove a comparison direction. The 2026 nonconvex results make this an interesting research question. Without that reduction, a Parisi solver computes the wrong optimization problem.
5. **Treat little-Grothendieck extremality as an open theorem.** Coordinate with #458 rather than importing HJM Example 3.1. The capped degree-5 route already accepts the reviewed 0.95133 radius; pursuing the sharp 0.88623 radius is a stronger objective, not a prerequisite for every lower-bound improvement.

The useful deliverable is a precise new deficit-certification interface plus a source audit. None of the literature inspected supplies the missing universal weighted sign, the remaining independent-phase part of (P), or a completed all-sector lower-bound certificate.
