<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/ASSEMBLY_AUDIT.md (file dated 2026-11-13). Only this line was added. -->
# Independent audit: sector assembly, constants, and the consumer

Agent ID: codex-a713. 13 November 2026. This is a component of the requested independent audit. Only this new audit directory was written. No Lean build or Git mutation was performed.

**Status convention.** “Independently proved” means that I re-derived the mathematical implication, not that it was formalized in Lean. “Exact replay checked” means that I inspected the checker and its mathematical interpretation and executed its rational-arithmetic assertions. “Numerically computed here” identifies ordinary floating arithmetic. “Record only” means that I read the claim or stored output but did not independently regenerate its decisive numerical enclosures.

## Main finding

Concern (a) is substantially right, but its proposed correction is itself too optimistic: **neither 0.10 nor 0.15, together with the two separate shell-cost theorems presently supplied, closes the A+B core.** A finite-amplitude **joint** cost estimate is still needed. The numbers 0.10 and 0.15 are useful conditional targets, not established sufficient hypotheses by themselves. The later record notices that the B theorem cannot be applied at the base q+A, then nevertheless presents sharpening A-content as though it eliminated this composition gap.

Concern (d) needs qualification. L5 is open, but it is not unstarted: a correct all-amplitude B cost, an infinitesimal signed joint theorem, parity identities, and a certificate on one nonzero core/odd ray exist. None supplies uniform sector assembly. L6 is described as unbuilt in the supplied monograph; its row-envelope and numerical-budget obligations are substantive, not discharged by three isolated row calculations.

## 1. Precisely what A-content constants would suffice

Write Δ=B(u)−F(q), c=c_A(q), d=c_B(q), and p=1/ε. The benchmark slack is nonnegative, so Λ(q)≤S−Δ. This last inequality is an identity plus the definition of S, independently of whether Δ≥0. To use a content bound \(\|c\|^2\le\gamma\Delta\) with γ>0, Δ≥0 follows unless the bound is vacuous.

Assume, as an **additional joint finite-amplitude hypothesis**, that

\[
\Lambda(q+A+B)\le\Lambda(q)+2\Re\langle r_A,c\rangle+2\Re\langle r_B,d\rangle
-k_A\|r_A\|^2-k_B\|r_B\|^2-2m\Re\langle r_A,r_B\rangle.
\tag{J}
\]

For \(k_A>0\) and \(s=k_B-m^2/k_A>0\), completing squares in the remote Hilbert space proves

\[
\sup_{r_A,r_B}\{\hbox{linear terms minus cost}\}
=\frac{\|c\|^2}{k_A}+\frac{\|d-(m/k_A)c\|^2}{s}.
\tag{1}
\]

This is **independently proved**. Dropping shell amplitude caps only enlarges the right side, so the conclusion is a sufficient bound within those caps too.

Assume additionally the unproved global common-center comparison

\[
\|d-\rho c\|\le e,\qquad \rho=0.5053,\quad e=0.007\sqrt u,
\tag{2}
\]

and \(\|c\|^2\le\gamma\Delta\). Then

\[
\Lambda(q+A+B)-S\le
\left(\frac\gamma{k_A}-1\right)\Delta+
\frac{\bigl(|\rho-m/k_A|\sqrt{\gamma\Delta}+e\bigr)^2}{s}.
\tag{3}
\]

In particular, with e=0 the exact sufficient threshold from this bound is

\[
\gamma\le\frac{k_Ak_B-m^2}{k_B+k_A\rho^2-2m\rho}.
\tag{4}
\]

The following numbers were **computed here in ordinary double precision from these explicit formulas**; their last digits are not interval certificates. The algebraic formulas, rather than the rounded table entries, determine the implications.

| Extra joint hypothesis | e=0 threshold from (4) | Example γ and uniform excess with u≤0.0463 |
|---|---:|---:|
| (J), k_A=.24, k_B=.26, m=.118 with its signed pairing | .2399470074 | γ=.24: ≤.00005470475, using Δ≤1.6u |
| Joint diagonal cost, i.e. (J) with m=0 | .1942238683 | γ=.15: ≤.00001437080 |
| Joint adverse norm cost \(.24\|r_A\|^2+.26\|r_B\|^2-.236\|r_A\|\|r_B\|\) | .1100402934 | γ=.10: ≤.00007180980 |

The adverse-norm line is obtained by maximizing the scalar norm bound, equivalently putting m=−.118 in (3). It does **not** follow from knowledge of the two diagonal costs alone: its adverse mixed coefficient must be proved to be at most .118.

For γ strictly below the e=0 threshold and γ<k_A, maximizing (3) over all Δ≥0 gives the closed form

\[
\sup_{\Delta\ge0}(3)
=\frac{e^2(k_A-\gamma)}{k_Ak_B-m^2-\gamma(k_B+k_A\rho^2-2m\rho)}.
\tag{5}
\]

For the adverse-norm line at γ=.10, the worst Δ is approximately .00066392336, not the upper endpoint .07408. At that upper endpoint, (3) equals approximately −.00546820, which reproduces the record's “excess −5.5·10⁻³.” That is **not a uniform negative margin**. Likewise, the claimed “room ≥1.6·10⁻²” with γ=.15 and m=0 is the value at Δ=.07408, not a uniform lower reserve over Δ. The uniform excesses in the table remain below 10⁻⁴, so this correction does not destroy those *conditional* sufficient bounds.

For adverse norm cost, the threshold that spends at most 10⁻⁴ in (5), with e²=.007²·.0463, is approximately γ≤.1029840567. Thus .10 is a sensible conservative target **once the joint cost and kernel comparison are proved**. The ratio .10/.088≈1.136 is the relevant conditional empirical margin, not .24/.088≈2.727. No value in this table is necessary for K; benchmark slack, shell caps, or a direct joint argument can improve it.

Source claims audited: [assessment §§30–33,44–45](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1157), [the sharpening prompt](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/prompt-A-content-sharpening.txt:1), and [monograph §4b](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:428).

## 2. The unresolved composition gap is real

The assessment §44 says:

> “with c_A ≤ 0.10 it holds in the sign-pessimistic norm form (no statement about m at all: excess −5.5·10⁻³).”

The sharpening prompt begins:

> “the A+B core closes ROBUSTLY (no statement about the A/B mixed term) once C_A(q)^2 <= 0.10 [B(u) - F(q)] ... using only the certified diagonal costs”.

These implications are **not established**. A bound on adverse mixed size is still a statement about the mixed term. Separate inequalities along the two coordinate axes do not imply a joint matrix inequality. Moreover, the [B-cost theorem](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/PROOF.md:94) assumes its base is remote; q+(T−1)r_A is not remote. This limitation is explicitly acknowledged in [assessment §43](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1407) and in the [J3 audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/REPORT.md:115), yet it is not removed by lowering γ.

Here is an **independently proved exact counterexample to the inference from separate costs**, not a cubic counterexample to K. Consider the abstract scalar quadratic gain

\[
f(a,b)=2c_Aa+2c_Bb-.24a^2-.26b^2+.40ab,
\]

with c_A=1/200, c_B=(5053/10000)c_A, and Δ=1/4000. Its restrictions to b=0 and a=0 obey exactly the stated separate costs; the content satisfies c_A²=.10Δ and the alignment error is zero. The cost matrix has adverse off-diagonal −.20 and remains positive definite. Its maximizing amplitudes are

\[
a=2579/32000=.08059375,\qquad b=5737/80000=.0717125.
\]

Both a²,b²<.0113. Nevertheless

\[
f(a,b)-\Delta=53464061/160000000000=.00033415038125>10^{-4}.
\]

These identities were checked with Python `fractions.Fraction` arithmetic. This explicitly demonstrates the missing hypothesis even inside the amplitude caps. It does not assert that this abstract matrix/content pair is realized by any cubic.

The conditional γ=.15 route also needs care: knowing a mixed coefficient m is positive does not make the mixed quadratic expression \(2m\Re\langle r_A,r_B\rangle\) nonnegative for arbitrary phases. One must either prove a joint diagonal lower bound directly, restrict to pairs for which the expression is nonnegative, or keep the signed matrix and optimize it as in (1).

## 3. Statements independently confirmed

### 3.1 B-shell all-amplitude cost: confirmed, including the certificate-to-theorem implication

I read [the proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/PROOF.md), inspected [the exact checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_shell_global_cost/b_shell_result/verify_b_cost.mjs), and executed it. All three rows passed 2000 exact rational boxes and the stated Wick-moment checks. There is no floating-point arithmetic in its acceptance comparisons.

The proof is sound. The norm majorant

\[
|X+h|\le |X|+\Re(h\overline{\mathrm{ph}(X)})+|h|^2/(2|X|)
\]

reduces the B remainder to \(E_w|r_B|^2J(q)\), where \(J(x)=E_z[T^2/(2|L+x|)]\). The measure pushed forward by L with weight T²/2 has mass one and density

\[
\frac{t^2e^{-t}}{2\pi(a+bt)(a+3bt)}.
\]

For a measure of mass one and density ≤M/π, the elementary bound
\(\int |y+x|^{-1}d\mu(y)\le 1/R+MR\), minimized at R=1/√M, gives J≤2√M uniformly in x. The checker really certifies the required half-line density bound: t²e⁻ᵗ increases on [0,2], decreases thereafter, the denominator increases, and a positive Taylor partial sum bounds eᵗ from below. It also checks 4M≤(p−κ_B)². Consequently κ_B=.26/.29/.30 at the three rows follows for arbitrary remote q,r_B∈L², all amplitudes, arbitrary sharing. This is **independently proved plus exact replay checked**.

The derivative pairing is \(2\Re E[\overline{r_B}F_B(q)]\); \(E[r_BF_B(q)]\) would have charge two and vanish. The correction in this proof is valid. Its Wick-moment calculation gives \(E[\bar XH]=0\), \(E[\bar XH|H|^2]=32\) for H=X(|X|²−2), hence the actual B first-order content is nonzero at small positive Wick amplitude. Thus the earlier “every non-A sector is pure cost” conclusion in [assessment §31](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1181) is false; its later correction is mathematically necessary. Testing only shell energy .0113 cannot detect a gain whose leading term is linear in shell amplitude.

### 3.2 Parity, odd-sector decoupling, and the directional majorant: confirmed

If H is even in z and L,O are odd, changing z→−z and interchanging the two norm terms proves
\(\Lambda(H+O)=\Lambda(H-O)\). Orthogonality E[H\bar O]=0 makes the penalty agree. Therefore the odd first variation vanishes, and, wherever the Hessian exists, its cross block with an even increment vanishes. This confirms [assessment §34](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1256).

It **does not** prove finite-amplitude nonincrease. An even function can increase away from zero.

For M=|X|²+|Y|² and c=Re(X\bar Y),

\[
(|X+Y|+|X-Y|)^2=2M+2\sqrt{M^2-4c^2}\le4M-4c^2/M.
\]

This proves the directional majorant in [the single-core proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/directional_odd_cost/directional_cost/PROOF.md:19). Its stated scope is one explicit H, one O, and .03≤|τ|≤.04. I checked the analytic reduction, stable formula, monotonicity used to cover an amplitude interval, and Gaussian-tail estimate. I did **not** rerun the three-dimensional Arb interval integration, so the numerical cost .063/.174 is **record only** in this sub-audit. It cannot establish the universal E2 statement in [the E2 prompt](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/subproblem-E2-uniform-odd-cost.txt).

### 3.3 The all-shift infinitesimal theorem: analytic scope confirmed; partial certificate audit only

The [all-shift proof](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/all_shift_signed_ab/all_shift_certificate/PROOF.md) explicitly states that its base is remote and its conclusion infinitesimal. This is the correct scope. I independently re-derived

\[
Q_q=p(\|r_A\|^2+\|r_B\|^2)
-E\frac{\operatorname{Im}(h\overline{L+q})^2}{|L+q|^3},
\]

the shift rotation, planar push-forward Jacobian, cancellation of the polar R factor, and the two real 2×2 blocks. A uniform mass/density potential bound indeed justifies dominated convergence for arbitrary remote L² shell coefficients.

I inspected [the interval integrator](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/all_shift_signed_ab/all_shift_certificate/kernel.py). It encloses whole shift intervals and whole integration rectangles, rather than merely evaluating nodes. Its factor-two tail allowance is conservative. I independently checked the exact mesh coverage and the stored enclosing lower bounds in [the results file](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/all_shift_signed_ab/all_shift_certificate/results.json), using rational parsing of the decimal interval strings: all 474 boxes cover [0,6], their recorded diagonal and determinant lower bounds are positive, and min(stored determinant lower bound)/2.2=.001155184988017777. **This checks stored summaries, not recomputation of their integrals.**

I also independently re-derived and executed [the rational tail checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/all_shift_signed_ab/all_shift_certificate/verify_tail.mjs): PASS for x≥6 at all rows. Its tail argument uses mass ≤.300 and density ≤.056/π on t≥5, giving gain ≤2/3+2√(.300·.056)<.927; p−.927 exceeds the target matrix's largest eigenvalue bound .378 by >.001. This part is **independently proved plus exact replay checked**.

I did not regenerate the compact Arb cover, so the complete uniform infinitesimal numerical certificate remains **partially audited, not independently replayed in full** here. Most importantly, even a completely valid infinitesimal result at every remote q cannot be integrated along q+s(A+B): those intermediate bases depend on z. Its own proof states this limitation accurately.

### 3.4 Earlier J3 audit: exact algebra confirmed

I inspected and executed [the J3 rational checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/verify_algebra.mjs): all assertions pass. Its weakened-diagonal witness has excess
30446529993/71781250000000≈.000424157144, with both maximizing squared amplitudes below .0113. It really refutes the claimed implication that a .07 loss on both diagonals preserves the 5.5·10⁻⁵ budget; it is not a realized cubic counterexample.

I also re-derived its factor-of-two correction in route (b), its same-driver mixed moment 4uw versus uw for independent drivers, its exact finite-amplitude norm-remainder identity, and the plus sign required before the ordinary Taylor Hessian integral. The [J3 report](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/REPORT.md) distinguishes these implications carefully. Its scalar Arb kernel counterexamples were **not rerun** in this sub-audit; their reported intervals are therefore record only here.

The arbitrary-even-base cusp counterexample in that report is sound: H=L·sign(Re z) is even, and one of L±H vanishes at each z. With an independent B shell the zero branch contributes a positive |s| term, excluding a two-sided linear-plus-negative-quadratic upper bound at that base. H is not of the restricted cubic form q+A; this refutes the broad base claim without refuting the restricted target.

## 4. Additional errors and stale assertions

1. **Invalid L¹ projection step, repairable conclusion.** [Assessment §33](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:1228) says the projection residual “has norm ≤ E[|q|h(|q|²)].” Orthogonal projection is contractive in L², not in L¹, and the linear Gaussian test variables are unbounded. The displayed step does not follow. The desired final bound is nevertheless valid from a uniform kernel residual bound: \(\|\Pi[q(g_B-\rho g)]\|_2\le\|q(g_B-\rho g)\|_2\le .007\sqrt u\). This is the corrected argument in the J3 report.

2. **Confusing positive mixed coefficient with positive mixed term.** The sign of m alone does not allow dropping \(2m\Re\langle r_A,r_B\rangle\). Arbitrary phases remain in the quantified problem. The signed completion (1), or a proved nonnegative expression for the actual pair, is required.

3. **“Only content remains” is superseded.** [Monograph §0](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:37) describes §4 as “the single statement still missing,” but [§4b](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:428) correctly identifies independent sector-assembly and row-consumption layers. In the earlier endgame passage, constants .22–.239 do not imply the stronger envelope .11 merely because they are below .24. Nor can an A-only theorem assemble B and odd sectors without additional estimates.

4. **Requested K versus response-restricted caps.** The general K conjecture quantifies over every cubic with no norm cap. The small u≤.0463 and total-energy≤.072 region comes from feasible-response restrictions. A proof only on that region can serve the lower-bound consumer if all omitted response regions are covered; it does not by itself prove raw K for all G. [The digest's scope rule](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/MANUSCRIPT_DIGEST_K.md:183) explicitly warns against importing response constraints into raw K.

5. **Precision error in the claimed 1.402 implication.** [Monograph §5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:525) says “B ≤ 0.713267 ⇒ 1.402.” Literally, \(1/.713267=1.4019995317321563<1.402\). The exact target is B<500/701=.7132667617689016 for a strict >1.402 conclusion. This is a rounding error, not evidence against the program, but a certificate must retain the correct rational threshold. Also η≤10⁻⁴ is presented as sufficient for approximately 1.402, not automatically 1.4022; the consumer claim must preserve its exact available budget.

6. **L5 is open but has meaningful work.** Correct B cost, its class-specific content certificates, infinitesimal A/B work, parity, and a single nonzero-core odd certificate are genuine steps. The missing uniform finite-amplitude A+B and odd-sector statements are mathematical gaps, not routine assembly.

7. **L6 is not supplied.** The monograph §5 says “Nothing of this is built yet.” [Digest §2](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/MANUSCRIPT_DIGEST_K.md:190) lists profile uniformity, row envelope, and the v*=0 corner as additional obligations. A read-only textual search of the Lean files under /Users/alingalatan/workspaces/grothe/Grothe, /Users/alingalatan/workspaces/grothe/GrotheKernel, and /Users/alingalatan/workspaces/grothe/scratch found no `lower_of_K` or `KHyp` occurrence. This limited source search is not a proof that no differently named consumer exists elsewhere; no builds were run.

## 5. Recommended exact next target

After the independent full-tensor experiment determines whether γ=.10 is credible, the single statement I would demand next is a **finite-amplitude joint norm-remainder bound on the actual shared cubic law**, with every coefficient and amplitude restriction explicit. For h=(T−1)r_A+z²\bar r_B/√2 and V=L+q, define

\[
R(V,h)=2\bigl(|V+h|-|V|-\Re(h\overline{\mathrm{ph}(V)})\bigr).
\]

Then a robust sufficient joint statement is

\[
E R(V,h)\le(p-.24)\|r_A\|^2+(p-.26)\|r_B\|^2+.236\|r_A\|\|r_B\|
\]

on the required domain. This is precisely the missing hypothesis behind the γ=.10 budget, and does not require a nearly exact favorable signed cancellation. It is still a conjectural certificate target here. The Gaussian marginal law of the shells is insufficient to replace the actual joint law with q. If this estimate fails, a direct optimized joint content/remainder inequality using benchmark slack is the appropriate weaker target.

The numerical ratio by itself cannot measure distance to a proof: even a verified all-dimensional A-content theorem with γ=.10 would leave this joint estimate, uniform odd-sector control, coverage outside the reduced response region, and the rigorous row-envelope consumer to discharge.
