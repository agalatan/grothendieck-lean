<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/record_audit.md (file dated 2026-11-13). Only this line was added. -->
# Record, certificate, and assembly audit

Agent: codex-a713, independent audit, 13 November 2026.

This supplement covers the record and certificate implications. **P** means rederived here (including exact checker arithmetic actually replayed); **N** means ordinary numerical arithmetic checked here; **R** means a statement or numerical enclosure retained from the record without independent regeneration. A checked implication conditional on stored kernel enclosures is explicitly distinguished from an end-to-end proof. No existing source, Lean file, or certificate output was changed. No Lean build was run.

## 1. The main finding: the proposed robust A+B closure is still conditional

The assertion in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md`, §4b, lines 467–470, is too strong:

> “which closes the A+B core with the certified diagonal costs and no statement about the mixed term.”

Likewise `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/prompt-A-content-sharpening.txt`, lines 1–5, says closure uses “only the certified diagonal costs”. **P: this inference does not follow.** Separate estimates for Λ(q+A) and Λ(q+B), both based at a remote q, say nothing sufficient about Λ(q+A+B). Applying the B estimate at q+A changes the visible-variable-dependent base. The original B theorem explicitly requires independence from z; see `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/PROOF.md`, lines 109–110. The J3 audit itself explicitly says that no finite-amplitude diagonal loss is certified: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/REPORT.md`, line 3 and §§3,5.

What would suffice is an additional *joint finite-amplitude* estimate

    Λ(q+A+B) ≤ Λ(q)+2 Re<a,cA>+2 Re<b,cB>−Q(a,b),
    Q(a,b) ≥ kA||a||²+kB||b||²+2m Re<a,b>,

with its full range stated, kA=.24, kB=.26, and a positive definite matrix. Its exact unconstrained optimized gain is

    ||cA||²/kA + ||cB−(m/kA)cA||²/(kB−m²/kA).

This completion of squares is **P**. The finite-amplitude joint hypothesis is **R/open**, even though the separate diagonal costs and infinitesimal statements have certificates. The sign-pessimistic version needs a bound such as

    Q(a,b) ≥ .24||a||²+.26||b||²−.236||a||||b||.

That is a quantitative mixed-term bound |m|≤.118; it is not “no statement about m”. Separate diagonal estimates do not imply it. A positive *coefficient* m also does not make 2m Re<a,b> nonnegative for arbitrary a,b. Dropping the mixed term requires an actual joint diagonal bound or a sign restriction on the actual pairing.

### Corrected budget arithmetic

Assume, additionally, the global common-center kernel bound

    |gB(v)−ρg(v)|≤.007 for every v≥0,  ρ=.5053,

which is **R/open** in the cited record, and the content bound ||cA||²≤κΔ, Δ=B(u)−F(q)≥0. Projection contraction then gives ||cB−ρcA||≤e=.007√u. Put s=kB−m²/kA, h=|ρ−m/kA| and z=√Δ. An upper bound for the excess over S is

    A z²+B z+C,
    A=κ/kA−1+κh²/s, B=2h√κ e/s, C=e²/s.

The benchmark slack S−[B(u)−u/ε] has only been discarded here, never counted twice. Since Δ≤1.6u, maximize this quadratic on 0≤z≤√(1.6u). **P: when A<0 one cannot substitute the upper bound for Δ into its negative term.** This is the error behind the negative “room” numbers in assessment §44.

**N, double arithmetic, stable to the shown last few digits:** at u=.0463, κ=.24, the §44 figures are correct: m=.118 gives 5.4704749e−5; .115 gives 1.2156483e−4; .11 gives 2.8796466e−4; .10 gives 8.1316729e−4. They are conditional on the missing joint estimate and kernel comparison.

For κ=.15, m=0, the actual uniform upper bound is **+1.4370797e−5**, attained by this bounding quadratic near Δ=2.4792023e−5; it is not a uniform negative margin of .016. With m in [.05,.118], the positive maxima are at most about 1.124e−5. For κ=.10 and adverse m=−.118, the correct maximum is **+7.1809792e−5**, near Δ=.0006639234; the reported −.005468 value is merely the value at Δ=.07408. Thus the conditional 1e−4 conclusion survives these corrected numbers, but the advertised negative margins do not.

With e=0, the adverse-mixed threshold is κ≤.1100402934, while the joint diagonal threshold is κ≤.1942238683. The nonzero comparison error consumes the rest of the budget. There is no unique “really needed κ” independent of the joint cost, comparison error, allowed amplitudes, and benchmark slack. .10 is a defensible sufficient target for the *additional adverse joint estimate just stated*; .15 is sufficient with a suitable signed/joint diagonal estimate; .24 works only with strong quantitative alignment of the actual joint cost.

For precisely the assumed adverse matrix above, u≤.0463, ρ=.5053 and e=.007√u, the **P, exact rational** κ threshold of this scalar bounding argument for allowance η=1e−4 is

    κ ≤ 4889900/47482107 = .10298405671003606… .

Indeed let L=1/kA+h²/s and C=e²/s. The interior maximum equals C(1−κ/kA)/(1−κL), so solving for η gives κ=(η−C)/(ηL−C/kA). Its maximizing Δ=.00138431356 lies inside [0,.07408], and the maximizing scalar shell norms are below √.0113. This is a threshold for the *assumed quadratic upper bound*, not a necessary threshold for K or a verified finite-amplitude theorem.

The certified Gaussian-factor estimate ||cB||²≤.1195Δ is **not interchangeable** with the alignment estimate in this reasoning. Combining .10 and .1195 with the adverse .118 matrix gives an upper gain/Δ of 1.6601738821, so it does not close. Under an actual joint diagonal bound the gain/Δ is .8762820513 (closes for .10), but 1.0846153846 for .15 (does not close).

Reproduction: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/budget_audit.py` and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/budget_audit.log`. These are arithmetic checks, not interval proofs of any analytic kernel claim.

## 2. Content lemma plus shell cost: exact scope and quantifiers

**P.** For the A-only core, assume its certified cost in the applicable amplitude range:

    Λ(q+(T−1)U) ≤ Λ(q)+2 Re<U,cA>−kA||U||².

Then C²≤kA[B(u)−F(q)] gives Λ(q+A)≤B(u)−u/ε≤S by completing the square. No separate K-a input is required on the class where this same-energy content inequality is proved: it itself implies a nonnegative same-energy deficit. The weaker sufficient statement is C²≤kA[S−Λ(q)+η], or, when ||U||≤r, the exact capped gain

    Ψr(C)=C²/kA if C≤kA r;
           2rC−kA r² otherwise.

The identity

    S−Λ(q) = [B(u)−F(q)] + [S−B(u)+u/ε]

is exact and the second bracket is nonnegative. Replacing the same-energy deficit by the penalized deficit is a weakening. Conversely K-a up to 1e−5 does **not** establish B(u)−F(q)≥0 for every cubic, nor does it automatically establish the content inequality. If only approximate K-a is available, its error must be carried wherever it is used.

**P, all directions.** Let cj=E[conj(wj)FA(q)]. Then C²=Σj|cj|² and

    C² = sup_{||X||₂=1, X any remote holomorphic linear form} |E[conj(X)FA(q)]|².

Thus an inequality valid for *every unit linear form X*, uniformly over the same q and dimension, is exactly a full-projection inequality; no dimension multiplier is needed. A bound only on each chosen coordinate separately is insufficient and would allow a factor n. A bound only on the displayed driver of a restricted family also cannot be promoted to general cubics without a separate vanishing-coefficient argument.

For the certified XP and self-interaction families, phase rotation of X proves every Y-direction coefficient vanishes. For the vector Gaussian-factor family, all Y coefficients vanish and the proof chooses the unit combination of X directions aligned with the full content vector. These are genuine full-projection proofs; they do not omit a hidden sum.

The rectangle R is an A-core region and comes with remote-energy/response-feasibility restrictions and prior exclusions. It is not all of H₂,₁. Completing this core theorem does not prove raw K in every dimension/all amplitudes, and it does not automatically prove K′ unless all quoted exclusions are shown to apply to the same admissible-response class. The inconsistent cutoffs .01122, .011223 and .01125 should be reconciled in a final exact domain cover rather than rounded interchangeably.

The intermediate claim in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md`, §33, that a Gaussian first-chaos projection has norm ≤E|q h(|q|²)| is not generally valid: Gaussian unit linear forms are unbounded. The final .007√u conclusion is nevertheless recovered by the correct L² contraction ||Π(qh)||₂≤||qh||₂≤.007√u when the uniform scalar bound is available.

## 3. Certificate-to-theorem checks

### A-shell cost and exact moments: checked and replayed

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-shared_driver_rectangle.tex`, the projected-cost section, lines 249–339; strengthened exact checker `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread2-verify_content_extension.mjs`.

The analytic chain is real projection of the norm, an inverse-map density upper bound, Gaussian averaging in Re U, and an explicit Gaussian tail. Its checker bounds the scalar supremum-integral by A+Bz+Cz², then checks the resulting average is below 1/ε−.24 for w≤.0113. The peak has the smallest a,b and no larger penalty than the other rows, so the other two rows inherit the estimate. The spatial tails have a valid elementary bound: for y≥4 the denominator exceeds one, the maximum numerator is ≤y⁴e^(−y²), and its integral is <1e−5. For x≥4 the numerator decreases and denominator increases. This is **P**, conditional only on the displayed analytic real-projection identity, rederived in the check.

The exact checker replay passed, including the .481 tensor inequality **for its Hermitian one-driver class**, the lower example >.4808, and the zero-cubic-tensor/fifth-moment −243 example. Log: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/a_cost_tensor_replay.log`. This does not certify .481 for a general cubic.

### Global B-shell cost: checked and replayed

Sources: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/PROOF.md`, §§1–3, and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/verify_b_cost.mjs`.

**P.** The correct derivative pairs conj(rB) with FB(q). The measure with weight T²/2 pushed through z↦L(z) has total mass one and density t²e^(−t)/[2π(a+bt)(a+3bt)]. If this density is ≤M/π, splitting 1/r at radius R gives potential ≤1/R+MR, hence ≤2√M. The exact checker bounds the density on [0,2] by rational intervals and a positive Taylor lower bound for exp; monotonicity controls the whole tail. It verifies 4M≤(1/ε−κB)² for κB=.26/.29/.30. The global norm majorant then proves the all-amplitude theorem for arbitrary sharing **at remote bases**. All three rows replayed PASS in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/b_cost_replay.log`.

The theorem does not cover q+A as base. The J3 arbitrary-even-base cusp counterexample and factor-of-two bookkeeping are valid analytically. Its exact quadratic obstruction replayed PASS in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/j3_algebra_replay.log`; the source is `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/verify_algebra.mjs`. The witness obstructs an inference, not K itself.

### XP with arbitrary complex quadratic coefficient: semantic check complete; scalar kernels not regenerated

Sources: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/proof.md`, R23, especially lines 195–312; `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/verify.py`; `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/kernel_proof.md`.

**P.** Conditional Gaussian integration gives F(XP)=E B(|P|²), C=|E[PJ(|P|²)]|/2. Subtract J(u)P and apply weighted Cauchy–Schwarz against the Bregman deficit. After rotating the real content direction, 0≤Z≤Y, EY=1 and EZ≤(1+τ)/2. The checker's simultaneous Q≥0 and R≤Q+γY, together with the coupled sixth-moment inequality and the exact expectation cap, really imply C²≤.239Δ. The Q≥0 check is essential to multiplying by Z/Y; it is present. Continuum control is through monotone averaged kernels, rational Bernstein bounds, and an explicit unbounded tail, not a grid-only test.

The fourth/sixth trace moment identities were checked by exact Wick contraction replay (265 centered contractions) in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r23_moments_replay.log`. The short Hermitian-moment proof and its angular averaging to the non-Hermitian bound were rederived. **R:** the inherited Arb node values and the million-box scalar envelope were not regenerated/replayed in this audit. Their formulas and the rational-verifier implication were inspected; this is not represented as a new full interval certification.

The improved .22 proof in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/proof.md`, §§1–3, also has a valid implication: Ew(Y)=1 and EQ(Y)≤0, and its pointwise inequality yields C²≤.22Δ by weighted Cauchy–Schwarz. Its scalar envelope remains **R** here.

### Vector Gaussian-factor class: all directions checked; scalar kernels not regenerated

Sources: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/proof.md`, §§1–3, and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/verify.py`.

**P.** For a real vector H of Hermitian quadratic forms and an independent real Gaussian g, integrate the scalar sixth-moment inequality for g·H. The identities E_g(g·H)^6=15|H|^6 and E_g[(gᵀMg)(g·H)^4]=3 tr(M)|H|⁴+12|H|²HᵀMH produce exactly the displayed vector moment bound. M is the **real covariance** of (Re P,Im P), not E PP*. Conditional on Y, q is proper complex Gaussian with variance V=Σ|Pj|², and cj=E[PjJ(V)]/2. Choosing a=c/||c|| reduces the full norm to one real functional with variance ≤||M||op. This maps to the checker's EZ≤τ condition and .239 expectation cap correctly. No dimension factor is hidden. **R:** stored Arb kernels and complete rational envelope replay were not independently regenerated in this audit.

### Hermitian self-interaction: exact dual replay passed, conditional on stored scalar enclosures

Sources: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/proof.md`, §§1–4; `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/verify_duals.cpp`; `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/replay.py`.

The radius weight R in C=E[R b g(Rb²)] is present. The moment inequalities for Q=P/√p follow from the exact exponential cumulants. The checker verifies a global polynomial majorant of f(z)+2ℓh(z), including both infinite tails, and its moment cost. The restriction |ℓ|≤.4 does not lose the optimizer: orthogonality and |g−g(0)/2|≤.418 imply |C|≤.418√u, hence |C|/.23<.4 on the enlarged interval. Taking ℓ=C/.23 and using the stated interpolation reserve really yields Δ≥1/40000 and C²≤.23(Δ−1/40000). These implications and the reserve arithmetic are **P**.

The C++ checker was compiled into the audit folder and replayed on all three original read-only bound/witness files. Every row passed 18,513 duals and 27,214,110 exact polynomial comparisons. Logs: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_peak_duals_replay.log`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_flank_duals_replay.log`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_upper_duals_replay.log`.

**R:** stored scalar integral enclosures, Arb kernel regeneration, and the full interval-integration stage were not rerun. The source uses directed fixed-point arithmetic, carries Hermite-interpolation errors and radial quadrature/tails, and the proof-to-checker target was inspected. Passing the dual stage is not, by itself, regeneration of those scalar inputs. This theorem only covers real c and Hermitian A up to a common phase, u≥.03; it does not cover the imaginary saddle perturbation except insofar as another endpoint theorem applies.

## 4. Why the families cannot be assembled into a general-cubic theorem

**P.** Their union is not all H₂,₁ and the nonlinear functional q↦ΠFA(q) is not additive. Relative to any unit driver X, a general cubic has six shells

    cX(R−2)+XP(Y)+conj(X)B(Y)+(R−1)V(Y)+X²conj(W(Y))+R0(Y).

The exact frequency extraction in R25 retains mixed terms. For instance q=conj(X)Y²+(|X|²−1)Y has energy 3 and E[conj(X)q|q|²]=6 despite having no XP or self-interaction component. The checker replayed in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r25_shells_replay.log`; source `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/check_shells.mjs`. Thus removing the individually zero-content shells by phase averaging is invalid for mixtures.

The claim in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md`, §4, line 398, that several self-interacting drivers “then follows ... driver by driver (the content along X_j only sees c_j and P_j after conditioning)” has no proof and is generally not a valid conditioning simplification: other drivers remain inside g(|q|²). A general tensor argument, or an actually proved reduction controlling all cross terms, is required. The existing certificates do not combine automatically.

The R24 size-bias identity *is* a valid short remote-only result. With R∼Exp(1), b=c(R−2)+P and size-biased law R e^(−R)dR, Ehat b=0 and Ehat|b|²=u. The tangent/Bregman identity plus Gamma integration by parts yields

    B(u)−F(Xb)=Ehat d_{u,R}(|b|²)+|c|²[−2uB''(u)−u²B'''(u)].

For the Gaussian-scale mixture B, the bracket is a positive mixture proportional to u(4+λu)/(1+λu)^(5/2). This proves remote domination of that family, not its content bound. Source `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/proof.md`, R24.

## 5. L5 and L6 remain substantive obligations

**P, parity only.** If H=q+A+B is even and O=zQ+conj(z)P+d z(T−2) is odd under z↦−z, then Λ(H+O)=Λ(H−O). Hence the first odd derivative and mixed even/odd Hessian vanish wherever these derivatives exist. This does not imply Λ(H+O)≤Λ(H) at finite amplitude: an even function can rise quadratically or at higher order. Theorem A needs q=0, and the conditionally Gaussian theorem needs its actual Gaussian driver hypothesis. Neither gives uniform odd-sector nonincrease over arbitrary nonzero H.

L5 still needs (i) finite-amplitude joint A/B control preserving the joint law of q and its linear drivers, (ii) general B content or a globally certified vector comparison, and (iii) uniform control of all odd sectors over that nonzero even core. The all-shift infinitesimal A/B certificate is not a finite-amplitude certificate because the path base q+s(A+B) is no longer remote. The recorded inverse-norm obstruction and one-core directional certificate address different sufficient inequalities and do not supply global assembly. The latter interval certificates were **R/not replayed here**.

L6 needs an exact domain cover for the response parameter t and profile rows, the zero-variance comparator corner or an explicit proof that it is not used, interval upper bounds for each S, a justified treatment of energies outside the small rectangle, and an explicit error ledger. If different ε rows are used, the consumer must specify how they relate to a single witness operator; one cannot silently minimize pointwise bounds for different operators. A finite list of fixed rows can be sufficient without proving the whole profile box, but only once the envelope over t is actually certified.

The intended Lean consumer is absent under the stated name: a read-only search for lower_of_K, KHyp, ConjectureK and K_eta in `/Users/alingalatan/workspaces/grothe/Grothe`, `/Users/alingalatan/workspaces/grothe/GrotheKernel`, `/Users/alingalatan/workspaces/grothe/docs/LEAN_DETAILS.md`, and `/Users/alingalatan/workspaces/grothe/docs/overview.tex` found no matches. This corroborates, rather than independently builds, the “Nothing of this is built yet” statement in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md`, §5, lines 515–521. The broad “L1–L3 done” and old Lean/native remote-cubic claims were not re-audited end to end; they are **R**, not newly confirmed theorems in this audit.

## 6. Definite stale or incorrect statements

1. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md`, §3.1, says “sup Λ=1.3649” in dimension one. **P:** G=0 already gives Λ(0)=√π(a+3β/2)=1.371879280600870 at the peak. The stated supremum is impossible there.
2. The same file, §3.5, says the monomial is the worst and mixtures lower the ratio, while §4 records its certified saddle. The same file, §4, lines 349–354, says the “zero-tensor ... examples have no content at all”; its own exact fifth-order moment −243 disproves that reasoning. Zero leading tensor is not zero nonlinear content.
3. The same file, §4b, lines 464–466, still gives gB/g∈[.505,.56] while assessment §45 and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/REPORT.md`, §1, record false endpoints at flank/upper. The final common-center error bound is a separate unproved scalar target. Its truth is not established by the disproved ratio interval.
4. The same file, §4b table, line 442, retains the .2393 directional-envelope candidate although §4 already records a certified obstruction above .2405. The table is stale.
5. The same file, §§0,1,5, says “B≤0.713267 ⇒1.402”. **P/N:** 1/.713267=1.4019995317321565; a strict >1.402 claim needs B<500/701=.7132667617689016. This may be display rounding, but the written implication is false. A >1.4022 claim needs B<.713165026387106. The η=1e−4 budget for about 1.402 cannot simply be attached to the proposed >1.4022 Lean theorem. If the displayed exact-K cap .713160 were usable, the room to 1.4022 would be only about 5.03e−6, not 1e−4 (the cap itself remains R/numerical here).
6. Assessment §44's .10/.15 negative margins and the subsequent “only diagonal costs” conclusion have the two independent problems explained in §1 of this audit: wrong maximization over Δ and a missing joint theorem. The numerical observations supporting a margin .10/.088≈1.14, rather than .24/.088≈2.7, are not a proof of either missing hypothesis.

These corrections leave genuine certified family results. They remove the impression that a single sharpened content number would, by itself, finish K.
