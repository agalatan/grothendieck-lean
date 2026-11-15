<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/CERTIFICATE_AUDIT.md (file dated 2026-11-13). Only this line was added. -->
# Certificate-to-theorem audit

Agent ID: codex-a713. Independent audit, 13 November 2026. This file is a component of the requested audit, not a continuation of the proof programme.

## Status convention and limits

**Proved here** means that I re-derived the displayed finite algebra or analytic implication. **Checked exactly here, conditional on inputs** means that an exact checker was replayed, but its stored kernel/scalar enclosure data remain inputs that I did not regenerate. **Record only** means a claimed result whose complete proof dependency chain was not independently checked. Floating output formatting is not an error estimate or a proof step.

I found substantive valid family reductions. I did not find a defect in their content-to-deficit implications. The reweighted 0.22 endpoint is now independently replayed from freshly recomputed Arb kernel integrals through its exact rational continuum certificate at all three rows. The R23 and Gaussian-factor kernel inputs are identical subsets of those verified nodes. These results do not establish a general cubic theorem, and their constants are much larger than 0.10. An inherited A-shell cost theorem remains a separate dependency of the K corollaries.

## 1. Non-Hermitian quadratic moment theorem: proved here and exact algebra replayed

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/proof.md`, R23, especially (23.1)–(23.7).

For a real Hermitian quadratic form with eigenvalues lambda_i, set v=sum lambda_i² and s_k=sum lambda_i^k. The independent exponential cumulants yield

    E H⁴ = 3v² + 6s₄,
    E H⁶ = 15v³ + 90v s₄ + 40s₃² + 120s₆.

Both s₃² <= v s₄ and s₆ <= v s₄ follow from Cauchy–Schwarz and max lambda_i² <= v. Therefore

    E H⁶ <= (125/3) v E H⁴ - 110v³.

This calculation, including sharpness at one nonzero eigenvalue, is valid. For arbitrary complex A, applying it to Re(exp(-i theta) P), P=Y*AY-tr A, and integrating theta produces (23.4). The subsequent bounds |tr(A³A*)|<=sqrt(rQ), Q<=r<=p², and |tr A²|<=p have the stated Hilbert–Schmidt justifications. The scalar inequality (23.5) is valid: set q=rz²; the nontrivial endpoint r=1 reduces to a quadratic in tau whose minimizer is tau=min(1,25z/14). The two cases stated in the source are correct. Consequently

    E|P|⁶ <= 37p E|P|⁴ - 68p³,
    E|P|⁴ >= 2p²

hold without normality of A. This is a genuine theorem, rather than a test on sample matrices.

I read and replayed `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/verify_moments.mjs`. It enumerates derangements of six labeled positions, groups their cycles up to cyclic rotation, and matches the noncommutative trace polynomial; 265 contractions and the fourth-moment polynomial pass. Replay log: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r23_moments_replay.log`. This checker verifies the moment identity; the inequalities above require the separate analytic argument just given.

The associated original R23 0.239 content certificate has now also been replayed through its full rational domain check, with the kernel-node trust closed by the identical-subset recheck described in §3. Peak, flank and upper pass 983,671, 157,507 and 27,601 rectangles. Their maximal expectation cap is below 0.238775. Together with the moment proof above and the directional weighted Cauchy–Schwarz argument in R23, this confirms the 0.239 content theorem for arbitrary complex quadratic P. It is quantitatively superseded by the independently confirmed 0.22 theorem in §3. Results: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r23_replay/peak_result.json`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r23_replay/flank_result.json`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r23_replay/upper_result.json`.

## 2. Gaussian-factor theorem: its full-projection implication is valid

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/proof.md`, §§1–3; checker `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/verify.py`.

For q=sum X_j P_j(Y), with independent Gaussian driver vector X and coefficient vector Y, V=sum|P_j|², conditioning gives F(q)=E B(V) and

    c_j = E[conj(X_j) F_A(q)] = (1/2) E[P_j J(V)].

All first-chaos coefficients in Y vanish by the common phase rotation of X. Thus this is the FULL remote projection norm. Selecting the complex unit direction of c converts it into a real linear functional h of the realified vector (Re P_j, Im P_j), with h²<=V and E h²<=rho. There is no missing factor of the number of drivers.

The real Gaussian auxiliary-direction argument in §1 is valid. If M is the covariance of that realified vector, u=tr M and rho=||M||op, integration of the scalar Hermitian inequality gives exactly

    E V³ <= ((25u+100rho)/3) E V²
            -(22/3)u³ -44u tr(M²) -(176/3)tr(M³).

It uses real covariance, not E PP*. No commutativity of the quadratic matrices is required. Replacing tr(M^k) by rho^k has the correct inequality direction.

The envelope-to-theorem implication is also valid. With Y0=V/u and Z0=h²/u, 0<=Z0<=Y0, E Y0=1 and E Z0<=tau. A nonnegative polynomial Q with R_u(y)<=Q(y)+gamma y and gamma>=0 gives

    E[(Z0/Y0)R_u(Y0)] <= E Q(Y0)+gamma E Z0.

The moment constraint then gives the advertised cap. The checker verifies coverage of tau from 0 to 1, signs of multipliers, both polynomial inequalities, parameter rectangles and the unbounded y tail. At Delta=0 strict concavity forces V=u a.s., whence the content vanishes; no division-by-zero gap remains.

**End-to-end replay completed.** All original 127 nodes per row are identical subsets of the 147 nodes per row freshly re-integrated for R26; equality of the profile, denominators and every node object is checked in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/inherited_node_subsets.json`. I then ran unmodified copied verifiers sequentially with local python-flint. Peak, flank and upper pass 1,600,321, 448,143 and 94,933 rational rectangles respectively, plus their polynomial positivity and unbounded-tail checks. The maximal rational expectation cap is below 0.238086, hence strictly below 0.239. The 0.239 theorem is **confirmed here by analytic audit and rigorous computational replay**, including its kernel premises. Results are in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/gaussian_factor_replay/peak_result.json`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/gaussian_factor_replay/flank_result.json`, and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/gaussian_factor_replay/upper_result.json`. The source checker alone still would not validate its kernel inputs; our separate recomputation supplies that step.

This theorem has no covariance restriction but still requires a partition into independent drivers and coefficients. It does not cover self-interacting drivers or an arbitrary cubic tensor.

## 3. Reweighted R23 endpoint 0.22: exact rational decisions independently replayed

Sources: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/proof.md`, §§1–4; `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/verify_pure.py`; `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/kernel_enclosures.py`.

For q=XP with EP=0, E|P|²=u, the weight w(y)=3/10+7y/10 satisfies E w=1. The displayed polynomial Q has E Q<=0 using precisely E|P|⁴>=2u² and E|P|⁶<=37u E|P|⁴-68u³. Thus the pointwise inequality (5) implies

    |E[P(J(|P|²)-J(u))/2]|²
      <= E[|P|²(J(|P|²)-J(u))²/(4w)]
      <= (11/50) Delta.

This proof is correct. In the Gaussian setting only the X projection remains, so the full projection is controlled. The old obstruction to a different deficit weight does not contradict it.

I translated the exact rational portion from flint.fmpq to Python's fractions.Fraction, without changing its subdivisions or inequalities; no Arb claim was replaced by floating arithmetic. The independent replay explicitly retains the stored kernel intervals and |J(0)|<1.7 as assumptions. Script: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/replay_r26_fraction.py`.

All three continuum checks pass:

| row | rectangles | accepted leaves | maximum depth |
|---|---:|---:|---:|
| peak | 5306 | 2654 | 24 |
| flank | 5376 | 2689 | 23 |
| upper | 1664 | 833 | 18 |

Results: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fraction_pure_peak_result.json`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fraction_pure_flank_result.json`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fraction_pure_upper_result.json`.

The lower A and upper H interpolants are justified by convexity: preceding/following secant extensions bound A from below; a convex chord bounds H above. The weakened A chord's error h dl dr/(dl+dr) is the height needed to stay below the maximum of those two secant lines. Monotonicity in u and y permits the endpoint rectangle estimates, and the sign-dependent choice of (y-1)² is correct. Splitting initially at y=1 avoids crossing the minimum of that square. The polynomial Bernstein lower bound and y>=400 tail have the correct directions.

**Kernel trust closed in a subsequent independent replay.** I installed python-flint 0.9.0 only under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies`. The single-process driver `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/run_serial.py` re-executes the original recompute function from `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/check_kernels.py` at 160 bits, with a 25-minute cutoff and per-node checkpoints. Every one of the 441 freshly computed A/H balls is contained in its ORIGINAL stored rational interval. This is an enclosure-containment check, not merely agreement of decimal approximations. Node data, bounds, hashes, balls, precision and timings are in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/nodes.jsonl`.

I then ran unmodified local copies of the original rational checker, including its Arb bound on J(0), using `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/run_original_verifier.py`. All three rows pass. The independent J(0) balls are centered at -1.6702718652282593, -1.6684386245110915 and -1.6308753700420605, with radii below 6e-45. Complete results: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/end_to_end_result.json`.

The positive integral formulas, complete-monotonicity argument, explicit tails, interpolation directions, moment inputs and final implication were checked above. Accordingly the 0.22 theorem is **confirmed here by analytic audit and end-to-end rigorous computation**, not merely conditional on unrechecked kernel data. The earlier Fraction replay files deliberately retain their historical conditional status; the later end-to-end result discharges those conditions.

The source also proves an unquantified uniform neighborhood of the pure-P endpoint if its bridge inequalities hold; it explicitly does NOT certify the entire share<=1/16 strip. Its later floating maximum 0.230627079 is not a global upper bound. I replayed the exact mixed-family tail checker; log: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_tail_replay.log`. A tail proof does not supply the missing compact-region proof.

## 4. Hermitian self-interaction 0.23: moment-dual implications checked

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/proof.md`, §§1–5.

The precise family is q=exp(i alpha) X[c(|X|²-2)+Y*AY-tr A], with real c and Hermitian A. An arbitrary complex relative phase between c and the eigenvalues is not covered. The energy interval proved is at least [0.03,0.0463]. The theorem is stronger than a bare 0.23 estimate:

    Delta >= 1/40000,
    C² <= (23/100)(Delta-1/40000).

The reduction to a real moment problem is valid: Q=P/sqrt(p) has EQ=0, EQ²=1, 3<=EQ⁴<=9, |EQ³|<=2 and EQ⁶-(125/3)EQ⁴<=-110. Only the X content survives by phase symmetry. The dual certificate uses these moments with the correct multiplier signs. Its finite ell interval suffices because C/(.23)<.4 follows from the independent bound |C|<=(209/500)sqrt(u). Maximizing F+2ell C-B-.23ell² therefore gives exactly the stated theorem.

I checked the passage from parameter nodes to the continuum. The second derivative lower bounds support the stated chord upper errors. Their total allowance is .000074875+.000909375|ell|, strictly below the grid reserve .0001+.001|ell| by more than 1/40000. The ell grid includes zero, so interpolation of |ell| creates no hidden loss across a sign change. The remote real-variable tails are handled on the whole line, not by a truncated numerical grid.

I rebuilt the unmodified C++ checker `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/verify_duals.cpp` into `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/verify_hermitian_duals`, then ran it read-only against the saved witnesses/bounds. Each row passes 18,513 moment duals and 27,214,110 integer polynomial comparisons. Logs: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/hermitian_duals_peak.log`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/hermitian_duals_flank.log`, `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/hermitian_duals_upper.log`.

**Trust limit:** this checks the polynomial stage **conditional on saved scalar interval bounds**. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/replay.py --quick` also trusts the saved scalar enclosures; full replay recomputes those, and its additional --regenerate-kernels mode regenerates the Arb kernel integrals. I inspected the radial quadrature, analytic continuation, interpolation-error and integer-rounding claims but did not rebuild that complete chain. It would be inaccurate to describe my replay as independently certifying all of (1).

The final A-shell consequence follows algebraically from the inherited cost .24; it does not certify that cost or joint A+B assembly.

## 5. Wick endpoint p<=u/5: short analytic improvements checked, scalar premises not replayed

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/proof.md`, §§1–3.

The exact Laplace half-moment computation is correct: for V~Beta(3/2,1/2), E sqrt(V)=8/(3pi), giving integral sqrt(t) nu_f(dt)=2/(3sqrt(pi)a²). The real Hessian bound for z exp(-t|z|²), integrated against that measure, yields

    C(q) <= C(q0)+p/(2a²) <= C(q0)+(8/5)p.

The first-order perturbation term vanishes by independence and EP=0; the projection weight is E|X|³=3sqrt(pi)/4. These constants have no omitted factor.

The beta/gamma stochastic comparison in §2 is also correct: the density ratio starts above one, increases then decreases, and crosses once before the beta support ends. It gives -phi''(s)>=(1/2)A(2s/3). Conditional concavity of phi gives the needed bound on F(q) after averaging the random P. The scalar inequality checked by verify_deficit.py then implies Delta(q)>=Delta(q0)-vp.

The final cell inequality (C_h+(8/5)p_h)² <= (9/40)(D_l-v_h p_h) has the correct uniform endpoint directions, and p<=u/5 is equivalent to p<=v/4. The lower v cutoff 0.0044 covers (4/5)*0.00551=0.004408.

I did not replay `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/verify_template.mjs` or `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/verify_deficit.py`, or regenerate their kernels. Thus the numerical premises of the final 0.225 result remain **record only**; their implication and the preceding analytic improvements are **proved here**.

## 6. Monomial saddle: analytic implication checked, arithmetic replayed

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/proof.md`, §2; interval checker `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/verify.py`.

For q_tau=sqrt(u/(2+tau²)) X[(R-2)+i tau(S-1)], write t=tau². The displayed derivatives C_t and Delta_t include the normalization derivative -C0/4 and the correct change v_t=(u/2)R[1-(R-2)²/2]. Since the imaginary content starts at order tau³, the coefficient of t in |C|² is 2C0 C_t. Thus positivity of N=2C_t Delta0-C0 Delta_t proves failure of local monomial extremality.

The interval checker partitions at all critical points of the polynomial map and at all sign changes of its polynomial weights; it bounds the kernel integral rather than just sampling it. Its asserted N interval, if the kernel inputs are valid, implies derivative>0.001. The explicit tau=1/10000 example is then justified by Q'(0)>1/6250000 and |Q''|<2: at t=10^-8, Q(t)>t/6250000-t²=1.5e-15>0. Its energy is exactly 463/10000. This is a counterexample to exact extremality, not to K or a 0.10 content bound.

I replayed the exact Gaussian moments, rational envelope costs and quantitative Taylor arithmetic in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/verify_algebra.mjs`; log `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/saddle_algebra_replay.log`. I did not regenerate the Arb kernel nodes or replay the interval integrations. The sign-of-derivative numerical premise is therefore **record only**, with its theorem implication checked independently.

## 7. Universal nonlinear u<=0.00038 claim: checker is only scalar arithmetic

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-fresh-verify_nonlinear_content.mjs`; companion acknowledgment `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/reply-fresh-lemma.txt`; summary `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md`, §3.4.

The checker explicitly says: “Certifies scalar constants used in the accompanying nonlinear-content proof” and ends “CERTIFIED SCALARS ... using the analytic proof.” It verifies enclosures of three one-dimensional integrals, product-formula arithmetic and the final inequality

    50 sqrt(42) u <= .19(267/320 - (61875/128)u)

at u=19/50000. If the general content and deficit inequalities in its comments hold, this indeed proves the advertised range. The code does not prove the Malliavin integration-by-parts identity, the universal fourth-moment bound, or the resolvent deficit representation. I found only summaries and the scalar checker in the provided ai-notes, not a complete accompanying derivation of those tensor identities. I therefore cannot confirm this universal theorem end-to-end from that checker.

A uniform bound for every unit direction X would imply the full projection bound by taking X in the content direction; it must not be summed over a coordinate basis, which would introduce an unnecessary dimension factor. The monograph's statement should be read with this quantifier.

The same scalar certificate also claims constant 1 for u<=0.001. Thus “nothing covers general tensors for u>0.00038” is too broad literally. The relevant limitation is absence of a sufficiently small content constant for arbitrary tensors over the required interval [0.00551,0.0463]; constant 1 at tiny energies does not close the target A cost.

## 8. Exact shell bookkeeping and an additional stale assertion

Source: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/proof.md`, R25. For fixed X phase, q=a e^(i theta)+b e^(-i theta)+d e^(2i theta)+e. Selecting the frequency-one coefficient of q²conj(q) gives (25.1), including e²conj(b), 2bdconj(e), and 2edconj(a). These cross terms survive, so the family inequalities do not compose by phase averaging.

I replayed `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/check_shells.mjs`: q=conj(X)Y²+(|X|²-1)Y has energy 3 and E[conj(X)q|q|²]=6. Log: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r25_shells_replay.log`.

An independently confirmed inconsistency appears in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md`, §4, “Why this is the right statement”: “the zero-tensor and non-normal examples have no content at all.” For the zero-tensor example already identified in §3.4,

    q0 = X[-(R-2)/2 + sum_{j=1}^4(S_j-1)],

exact exponential moments give

    E|q0|²=9/2,
    E[conj(X)q0|q0|²]=0,
    E[conj(X)q0|q0|⁴]=-243.

I checked these using rational polynomial expansion; output `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/zero_tensor_moments.json`. Since g''(0)<0, the fifth-order content is nonzero. Zero leading tensor does not mean zero nonlinear content. The quoted sentence is false for q0, not merely insufficiently tested.

The same monograph §4 “Endgame” says steps involving constants 0.22–0.239 “give E′ (ratio <=0.11).” These constants do not imply 0.11. Additional quantitative improvements would be needed even before sector assembly.

## Conclusion for the parent audit

The strongest confirmations from this pass are the arbitrary-complex one-driver content theorems (0.239 and improved 0.22) and the whole Gaussian-factor content theorem (0.239): their analytic implications were checked, their kernel nodes freshly recomputed and enclosed, and their continuum rational certificates replayed. The Hermitian self-interaction moment-dual stage was also replayed, with its scalar integral inputs still conditional. They should not be dismissed as random scans. Equally, none supplies a general tensor result on the required finite-amplitude range, none of the checked constants reaches 0.10 or 0.15, and none absorbs simultaneous A+B and odd sectors. The R23/reweighted/Gaussian-factor kernel inputs have now been freshly rechecked. The Hermitian self-interaction scalar-enclosure inputs and saddle kernel inputs remain visible in the trust ledger; the universal nonlinear theorem cannot be certified merely by running its scalar JS file.

## Reproduction and resource record

The original research files were read only. All copied scripts, installed dependencies, outputs and compiler files lie in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/`. Every new numerical replay was strictly sequential; no original process pool was run. Kernel recomputation took 19.4 seconds for peak and 39.5 seconds for flank plus upper. The six R23/Gaussian-factor row replays took 174.7 seconds in one process. The longer kernel and family replay drivers have 25-minute cutoffs. No Lean build or git mutation was performed.

Run the local interpreter `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I` on `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/run_serial.py`, then on `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/run_original_verifier.py`, and then on `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/replay_family_certificates.py`. The first driver resumes completed nodes using input-data hashes. The full numerical trust ledger is summarized in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/family_certificates_summary.json` and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/family_certificates_replay.log`.
