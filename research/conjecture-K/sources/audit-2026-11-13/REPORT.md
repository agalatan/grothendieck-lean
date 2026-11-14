<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/REPORT.md (file dated 2026-11-13). Only this line was added. -->
# Independent audit of Conjecture K

Agent ID: codex-a713. 13 November 2026. This audit checks the supplied research record; it does not claim a proof of K. All new files are confined to `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/`. No existing research file or Lean source was changed, and no Git mutation or Lean build was run.

**Status labels used below:** **P** = independently re-derived here; **C** = exact/interval checker replayed here with its theorem implication inspected; **N** = numerical check here, with its stated accuracy; **R** = read from the supplied record without full independent verification. A numerical search supplies candidate values and lower bounds on a supremum, never an upper bound over all tensors or dimensions.

## One-page verdict

The record contains substantial valid mathematics, but its description of the remaining gap is too optimistic. The A-only content inequality is neither the sole missing lemma nor an established reduction of the full conjecture. In particular, **even a proof of the 0.10 content bound would not, using the supplied separate A/B cost theorems alone, close the A+B core.** A finite-amplitude joint cost estimate is still missing. The later proposal to avoid any statement about the mixed term repeats a composition error that the record itself previously identified.

The numerical evidence must be interpreted against that logical gap. The accurate peak-row calibration is 0.087565304234 for the normalized Wick monomial at u=0.0463; the imaginary quadratic perturbation with tau=0.1 gives 0.087576329175. Thus exact monomial extremality is false, independently confirmed here. The old 0.088–0.089 figure is a useful approximate benchmark, not an established supremum. The old scan used only twelve shells, empirical normalization and no independent error bars.

**The completed experiment supports 0.10 as a plausible peak-row target in the tested dimensions, with more numerical room at 0.15 and 0.24.** It covers all 6,18,40,75,126 complex coefficients for n=2,...,6, with 50 starts at each of three energies, all 750 paths refined to intrinsic stationarity, 1,500 endpoints independently evaluated, and fresh 2²⁴-point holdouts for 15 selected tensors. An independently integrated two-variable candidate reaches .08760259435 and embeds in every tested dimension. No strict increase of the population supremum with dimension is resolved; larger training maxima were sampling artifacts. These computations provide candidate lower bounds and integration errors, not confidence bounds on the all-dimensional supremum.

If a joint adverse cost with cross coefficient at most 0.118 and the global common-center B-kernel comparison were proved, content constant 0.10 would give an excess at most 7.181e-5 at the peak. With a joint diagonal cost, 0.15 would suffice. With the much stronger favorable signed joint matrix, 0.24 would suffice. These are conditional sufficient constants, not necessary constants for K. The working conditional margin for the first route is about 0.10/0.088≈1.14, rather than 2.7.

The remaining distance to a proof at tolerance 1e-4 includes a dimension-uniform finite-amplitude content theorem, finite-amplitude A+B assembly, uniform odd-sector control, correct coverage of the response-feasible regions, and a rigorous row-envelope consumer with its exact numerical budget. Infinitesimal estimates at remote bases cannot be integrated along paths whose bases cease to be remote. L5 has meaningful partial results and is open; L6 is not built in the supplied record. Calling these routine assembly or engineering understates the remaining mathematics.

I would continue only as a bounded research programme with an explicit decision point, rather than as a near-complete route to an additional 0.0005. The single next statement I would attack is the **finite-amplitude joint A/B remainder bound** stated in §4 below. It is the missing premise behind the proposed robust 0.10 strategy. Improving more isolated family certificates to 0.10 would not itself establish that premise. The stated 1e-4 budget supports approximately 1.402; it must not be conflated with a delivered 1.4022 bound.

## 1. Scope and audit ledger

The principal record was read in the requested order: [monograph §§0–5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md), [assessment](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md), [manuscript digest](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/MANUSCRIPT_DIGEST_K.md), [old majorant scan](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/e11_scan_majorant.py), [old optimizer](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/e11_scan_opt.py), [old optimization log](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/e11_scan_opt_peak.log), followed by the relevant proofs, prompts and checkers under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/`.

This is a selective, dependency-aware audit of a large record. A claim absent from the confirmation ledger is **not implicitly verified**. In particular, existing Lean/native lower-bound claims and all scalar integrals in the legacy manuscript were not rebuilt.

Separately authored files appeared concurrently in the shared output directory. Their presence is not evidence that I authored or verified them. In particular, a candidate polynomial in [optimizer_audit.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimizer_audit.md) was treated as an external suggestion, then independently re-optimized and evaluated by [structured_baseline.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/structured_baseline.py). No other numerical or code-audit claims from that separate document are adopted here.

Detailed derivations and certificate scopes are preserved in:

- [Certificate-to-theorem audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/CERTIFICATE_AUDIT.md).
- [Sector assembly and constant audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/ASSEMBLY_AUDIT.md).
- [Kernel, basis and gradient derivation](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/KERNEL_DERIVATION.md).
- [Additional analytic and provenance audit](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/ADDITIONAL_ANALYTIC_AUDIT.md).

| Claim | Audit status and exact scope |
|---|---|
| Exact gate-free row | **P**: both projection-square completions and the discarded losses re-derived. |
| Theorem A, visible-origin-vanishing cubics | **P**: a complete analytic reconstruction for a/β≥11/4; a remote part creates a positive tangent correction. |
| Theorem B, prescribed nonnegative conditional Gaussian profile | **P**: analytic kernel bounds and variance redistribution checked, including degenerate variances. Arbitrary conditional cross-covariance excluded. |
| Disjoint-driver redistribution | **P**, reducing to the remote bound with the same allowance; the separate stronger heat-kernel numerical certificate was inspected but not replayed. |
| Complex quadratic-form fourth/sixth-moment inequalities, including nonnormal matrices | **P+C**: re-derived; exact R23 contraction enumeration replayed. |
| Full projection reduction for the Gaussian-factor family | **P**: all coefficient-variable components vanish by common driver phase; the argument controls the whole vector, without a dimension factor. |
| Reweighted one-driver bound C²≤0.22D | **P+C**: all 441 kernel nodes recomputed with Arb at 160 bits and contained in the original rational bounds; original domain/tail verifier replayed at all three rows. |
| Original R23 0.239 one-driver bound | **P+C**: 1,168,779 rectangles replayed at all three rows, using independently recomputed kernel nodes. |
| Gaussian-factor 0.239 bound | **P+C**: 2,143,397 rectangles replayed at all three rows, using independently recomputed kernel nodes. |
| Hermitian self-interaction 0.23 with reserve 1/40000 | Analytic implication **P**; 81,642,330 integer dual comparisons **C conditional on saved scalar bounds**. The full scalar enclosure chain was not regenerated. |
| Wick-endpoint p≤u/5 result | Short analytic perturbation/moment implications **P**; numerical certificate premises **R**. |
| Monomial is a saddle | Second-variation implication **P**; exact algebra replayed; finite imaginary perturbation independently confirmed by deterministic quadrature **N**. |
| Universal nonlinear content at u≤0.00038 | **R** as a full theorem: the supplied JavaScript checks scalar constants, not the accompanying general tensor identities, whose full derivation was not located. |
| Global B cost 0.26/0.29/0.30 | **P+C**: density/potential argument re-derived and exact half-line checker replayed. Base must be remote. |
| Parity and vanishing odd/even mixed Hessian | **P**; does not imply finite-amplitude monotonicity. |
| All-shift infinitesimal signed A/B estimate | Analytic reduction and exact tail **P+C**; compact integral bounds **R**, with stored coverage and positivity checked. Infinitesimal scope only. |
| Universal sector assembly and lower_of_K consumer | Open/not supplied; no claim of verification. |
| Remote K-a at tolerance 1e-5 | Moment-law reduction **P**; identified Arb cap **R**, peak profile only. Current Lean moment inputs were located, but no current Lean theorem for the complete quoted remote cap was identified. |
| Near-Gaussian region δ/u²≤.05 already covered | Not justified by the cited source: its majorant/constant premises remain floating, and .22²=.0484. |

## 2. Verdicts on concerns (a)–(d)

**(a) Confirmed, with a further correction.** The 2.7 margin is an A-only comparison. For A+B, 0.10 or 0.15 is useful only under additional joint hypotheses. Separate finite-amplitude diagonal estimates do not control the cross term; positivity of its coefficient also does not imply nonnegativity of its value for arbitrary phases. The assessment §§44–45 and [sharpening prompt](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/prompt-A-content-sharpening.txt) therefore overstate the robust route. See §4 and the exact countermodel in the assembly audit.

**(b) Confirmed.** The old search was six restarts of 25 random perturbation steps in a twelve-shell subspace of C⁴, on 1,200,000 common samples. It did not optimize full H₂,₁ or quantify selection error. The claim of a dimension-uniform supremum near 0.088 was unsupported. The monomial saddle is independently confirmed here. Leading-order tensor constants and nonlinear finite-amplitude ratios are different optimization problems; growth of the former does not prove growth of the latter. The quoted leading-order n=2/n=6 numerical constants remain record-only unless explicitly recomputed in this audit.

**(c) Substantially confirmed, but the literal wording is too broad.** Certified structural families do not exhaust general tensors, and their inequalities do not compose. The record also claims a constant-1 universal bound up to u=.001, near-Gaussian regions, and buffered/response-restricted subregions. Therefore “nothing covers general tensors for u>.00038” should be replaced by “no checked sufficiently strong uniform theorem covers arbitrary tensors throughout the required interval [.00551,.0463].”

**(d) L5 open, not unstarted; L6 unbuilt in the supplied record.** B cost, class-specific B content, infinitesimal joint estimates, parity and one-core odd-ray certificates are substantive L5 progress. The missing uniform finite-amplitude statements remain independent mathematical obligations. Three isolated rows do not by themselves certify the row envelope or the zero-optimum corner.

## 3. Incorrect, stale or unsupported statements

1. [Monograph §0](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md): “the single statement still missing (the content lemma...)” is superseded by its own §4b. L5 and L6 remain.
2. [Monograph §3.5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md): “the worst case on the rectangle is the known template at the top energy” overstates a search and conflicts with the later certified saddle correction.
3. [Monograph §4, ‘Why this is the right statement’](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md): “the zero-tensor and non-normal examples have no content at all” is false for q₀. Exact moments give leading content zero but fifth content moment −243. A vanishing leading term is not a vanishing nonlinear function.
4. [Monograph §4, ‘Endgame’](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md): bounds 0.22–0.239 do not “give E′ (ratio ≤0.11)”. Quantitative strengthening remains necessary.
5. [Assessment §31](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md): “every non-A sector is pure cost” is false for small B amplitudes; its own correction is valid. A test at fixed energy .0113 cannot detect all linear-in-amplitude gains.
6. [Assessment §33](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md): projection norm “≤ E[|q|h(|q|²)]” is not an L² contraction argument. The repair is ||Π(qh)||₂≤||qh||₂≤.007√u under the required global pointwise kernel bound.
7. [Assessment §§44–45](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md): “no statement about m at all” omits the adverse mixed-size hypothesis. The reported −.0055 reserve at Δ=.07408 is not uniform in Δ; the corrected uniform bound is +7.181e-5 under the specified joint hypotheses.
8. [Monograph §5](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md): “B≤.713267⇒1.402” is false at the printed precision: 1/.713267=1.4019995317. The strict target is B<500/701=.7132667617689. This is a repairable rounding issue, but the consumer must preserve exact thresholds.
9. The problem statement's dimension n²(n+1)/2−n is the homogeneous trace-free/harmonic count, not the Gaussian Wick-chaos count. It would omit the Wick calibration monomial. The experiment uses the full correct space, as proved in §5.
10. [Monograph §3.2](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md): “That term cannot occur in H₂,₁ (q cubic and r_A linear are uncorrelated)” is false for a *conditional* variance. The genuine cubic X[(T−1)+(|Y|²−1)] has conditional variance [(T−1)+(|Y|²−1)]², including a sign-indefinite cross term. Only its unconditional expectation cancels. This does not refute Theorem B; it explains why that theorem's restricted hypothesis matters.
11. [Monograph §3.4](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md) treats δ/u²≤.05 as closed by x≤.22. The cited [legacy chapter 7](/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/ch7-conjectureK.tex:145) says “proved (up to the float constants and the majorant)”; the majorant had been sampled and a uniform diagonal treatment was not done. Moreover .22²=.0484. That citation does not justify deleting the stated near-Gaussian region from the open domain.
12. [Monograph §4b L1](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md) labels remote K-a “done (Lean/native)”. The identified [legacy chapter 24](/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/ch24-remote-diagonal.tex:6) explicitly restricts its separate Arb remote cap to the peak profile. Current Lean source does supply the sixth-moment tensor bridge; this must be distinguished from a kernel-checked theorem for the complete numerical remote cap and from other-row coverage. The latter claims were not established by the located sources.

## 4. What constant is actually sufficient for A+B?

Let c,d be the A and B content vectors and Δ=B(u)−F(q). Assume an additional joint finite-amplitude estimate with cost matrix

    M = [[k_A,m],[m,k_B]],  k_A=.24, k_B=.26,

and assume ||d−ρc||≤e, ρ=.5053, e=.007√u. Completing squares proves the optimized gain is

    ||c||²/k_A + ||d−(m/k_A)c||²/(k_B−m²/k_A).

With ||c||²≤γΔ and e=0, a sufficient threshold is

    γ ≤ (k_A k_B−m²)/(k_B+k_Aρ²−2mρ).

| Additional joint hypothesis | Threshold if e=0 | Uniform excess with comparison error, u≤.0463 |
|---|---:|---:|
| Favorable signed m=.118 | .2399470 | γ=.24: ≤5.471e-5, using Δ≤1.6u |
| Joint diagonal lower cost, m=0 | .1942239 | γ=.15: ≤1.438e-5 |
| Adverse norm cross coefficient bounded by .118 | .1100403 | γ=.10: ≤7.181e-5 |

These numerical entries are **N**, computed from the explicitly proved formulas, not new interval certificates. For the adverse norm case the tolerance-1e-4 threshold from this sufficient bound is about .102984. Nothing here makes .10 necessary.

The missing robust joint statement can be written concretely. Set h=(T−1)r_A+z₁² conjugate(r_B)/√2, V=L+q, p=1/ε and

    R(V,h)=2(|V+h|−|V|−Re(h conjugate(ph(V)))).

The next target should first be quantified at the peak row: every remote dimension n, every q∈H₂,₁(Cⁿ) with .00551≤||q||²≤.0463, and arbitrary remote linear forms r_A,r_B in the same Gaussian variables, each with squared norm at most .0113. On that box, the proposed finite-amplitude estimate is

    E R(V,h) ≤ (p−.24)||r_A||²+(p−.26)||r_B||²+.236||r_A||||r_B||

This statement is **open**, not a consequence of its restrictions to either axis. If the full box is too strong, any response restrictions used to narrow it must be stated and justified explicitly. Extension to the other rows and coverage of the omitted energies remain separate obligations. An abstract quadratic countermodel in the assembly audit satisfies both axis costs, the .10 content bound, exact content alignment and both amplitude caps, yet exceeds the budget by .00033415. That countermodel refutes the logical implication; it is not a counterexample to K.

## 5. Independent full-tensor experiment

### Correct space and exact energy

For 1≤i≤j≤n and 1≤k≤n, use the orthonormal complex Wick basis

    H_ijk(z) = (z_i z_j conjugate(z_k)−δ_ik z_j−δ_jk z_i)/sqrt(1+δ_ij).

Wick orthogonality gives ||Σc_ijk H_ijk||²=Σ|c_ijk|². There are n binom(n+1,2) complex coefficients: 6,18,40,75,126. Subtracting first-chaos contractions changes the polynomial, not the number of free top-degree coefficients. All complex coefficients are optimized, and the coefficient sphere imposes the true Gaussian energy exactly.

### Kernels, calibration and gradients

The derivation in [KERNEL_DERIVATION.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/KERNEL_DERIVATION.md) uses the angular mean A(r,y)=(2/π)(r+y)E(4ry/(r+y)²) and its stable Landen-transformed derivative H=A_y/y. Then φ(v)=2∫e^−t A(r(t),√v)dt, φ′(v)=∫e^−t H(r(t),√v)dt, and g(v)=∫e^−t(t−1)H(r(t),√v)dt. The exact singular radius is used as a quadrature breakpoint. A smooth cubic table on log(1+v/.05) supplies analytic derivatives; values outside its domain are rejected rather than clamped.

The following are **N, deterministic floating quadrature**, not interval certificates. Independent radial/Rice benchmark agreement is below 6e-15. Table refinement and direct checks find value discrepancies below 3e-12 for φ and 1.2e-10 for g, and derivative discrepancies below 4.6e-9 over the stated test grids. These are measured convergence checks, not global error bounds. The deterministic two-variable template quadrature changes by at most 3.2e-11 between its reported resolutions.

    φ(0)=1.3718792806008693;  g(0)=−.8351359326141297.

| u | Wick ratio | X(|Y|²−1) ratio |
|---:|---:|---:|
| .02 | .069143080550 | .033020399655 |
| .03 | .078579898506 | .037489833866 |
| .0463 | .087565304234 | .040995118916 |

At .0463 the Wick deficit is .0120634220393 and C²=.00105633722097. The tau=.1 imaginary quadratic perturbation gives .087576329175. Calibration therefore reproduces the approximate old .088 benchmark while resolving a small but definite saddle improvement.

The objective uses exact zero-mean controls E|q|²=u and E[conjugate(z_j)q]=0. Every content direction is included. Analytic coefficient gradients differentiate both C and D, then project through the sphere parametrization. Independent C++/NumPy checks agree to 6e-16 in values and 7e-15 in gradients; finite differences check the gradients on the full n=2 and n=6 bases.

### Search and independent validation protocol

The scripts [optimise.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimise.py) and [batch_optimise.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/batch_optimise.py) use fixed scrambled Sobol points, 2²⁰ per objective, common across starts within a dimension. Each (n,u) has 50 starts: templates, full-space perturbations of them, and 35 draws spread over the full complex coefficient sphere. The vectorized optimizer retains an independent L-BFGS history and line search for every start; batching shares only matrix products. Runs checkpoint tensor coefficients and append records, with bounded individual run times. Numerical libraries are restricted to one thread per worker and no more than four processes run concurrently.

An audit of our initial numerical implementation found that its unconstrained normalized coordinates could grow in norm, making the coordinate-gradient stopping rule too lenient. Those preliminary convergence flags must not be interpreted as intrinsic stationarity. All 750 saved paths were therefore continued with a true unit-sphere solver and an intrinsic gradient criterion; original endpoints and logs are retained as diagnostics rather than overwritten. All 750 final continuations satisfy intrinsic gradient norm ≤1e-5 for the sampled objective. This establishes neither a local maximum of the population objective nor global optimality.

Every saved original/refined endpoint is evaluated on eight independent scrambled Sobol sets of 2¹⁹ points each: 2²² validation points per endpoint, independent of training and larger than the training set. Points within one scramble are not independent. A fixed rotation derived from that candidate's training content places its dominant direction first, and polar Gaussian sampling reduces variance while preserving the exact distribution. Content vectors are transformed back to the original coordinates. The reported ratio uses the pooled content vector and pooled deficit. Its SE comes from the between-scramble delta-method influence, not an iid sample-SE formula applied to QMC points. Selected winners receive a further fresh holdout evaluation on 2²⁴ points. The t-based 95% intervals are approximate randomized-QMC intervals from eight scrambles, not certified error bounds. Standard errors describe integration error, not missed local maxima or the all-dimensional supremum. All candidate coefficients and validation replicates are retained; selected winners additionally have fourth moments from exact Wick contraction formulas evaluated in float64, and structural decompositions.

The final holdout also subtracts a phase-aligned Wick reference evaluated on the same points and adds its independently integrated mean: D_cv=D_hat(q)−D_hat(W)+D(W), c_cv=c_hat(q)−c_hat(W)+c(W). This is an expectation-preserving control with the reference integrals treated to their numerical accuracy, not as a new rigorous certificate. Adaptive quadrature error estimates and analytic truncation bounds are saved with the holdout records; table interpolation error remains a separate measured convergence issue. The reference cancellation was checked for arbitrary phase to 4e-17 on a small sample. No holdout data are used to optimize its selected tensor.

### Completed numerical results

All 15 cells are complete: **50 initial starts and 50 converged sphere continuations per cell**, using 2²⁰ objective points. All 1,500 original/refined endpoints received 2²² independent validation points each; all 15 frozen selections received 2²⁴ further fresh points each. The largest coefficient-energy discrepancy across those 1,500 tensors is 2.78e-17, and all validation coefficient hashes were checked. The original/refined pool is intentional: a selected endpoint can be an original iterate when its independent validation is better than that of its continuation. The convergence count applies to the continuations.

The following are **selected full-space candidate estimates**, not estimates with certified error bars for R_n itself. Bars quantify only integration uncertainty for the fixed selected tensor. Fourth excess uses the exact Wick formula in float64.

| n | u | Candidate C²/D | SE | Approx. 95% half-width | Fourth excess |
|---:|---:|---:|---:|---:|---:|
| 2 | 0.02 | 0.069142762 | 1.7e-07 | 4.1e-07 | 41.99860 |
| 2 | 0.03 | 0.078579544 | 1.6e-07 | 3.7e-07 | 41.99875 |
| 2 | 0.0463 | 0.087602476 | 8.6e-07 | 2e-06 | 39.96785 |
| 3 | 0.02 | 0.069139400 | 8e-07 | 1.9e-06 | 41.99044 |
| 3 | 0.03 | 0.078576056 | 6.3e-07 | 1.5e-06 | 41.99214 |
| 3 | 0.0463 | 0.087600621 | 7.4e-07 | 1.8e-06 | 40.30166 |
| 4 | 0.02 | 0.069122576 | 1.8e-06 | 4.4e-06 | 41.94380 |
| 4 | 0.03 | 0.078561651 | 8.6e-07 | 2e-06 | 41.95481 |
| 4 | 0.0463 | 0.087583916 | 2.6e-06 | 6.1e-06 | 40.01539 |
| 5 | 0.02 | 0.069099074 | 2.3e-06 | 5.5e-06 | 41.87518 |
| 5 | 0.03 | 0.078540085 | 1e-06 | 2.5e-06 | 41.90257 |
| 5 | 0.0463 | 0.087532331 | 4.3e-06 | 1e-05 | 38.79575 |
| 6 | 0.02 | 0.069062888 | 1.2e-06 | 3e-06 | 41.79002 |
| 6 | 0.03 | 0.078499091 | 1.7e-06 | 4e-06 | 41.65905 |
| 6 | 0.0463 | 0.087491760 | 4.4e-06 | 1e-05 | 39.20917 |

The best reproducible structured baselines are .06914308055, .07857989851 and .08760259435 at the three energies, respectively, and are feasible in **every n≥2**. In particular, the lower entries in the n=4,5,6 rows above are search limitations, not upper bounds and not a decreasing dimension trend. No native candidate is convincingly better than the corresponding embedded baseline. The largest training result was .093006713 at n=6,u=.0463; that same tensor evaluated independently at .087481434 with SE .00005991. This demonstrates adaptation to the fixed training sample. Fifty restarts do not eliminate this source of search error.

The fresh-holdout delete-one-scramble bias estimates have absolute magnitude at most .000212 times the reported SE. This is a small diagnostic for nonlinear ratio bias; it does not validate the t approximation or certify integration error. No evaluated endpoint violated .10, .15 or .24. The lower-dimensional baseline gives conditional empirical margins of about 1.142, 1.712 and 2.740, respectively.

All selected coefficients, their zero-based (i,j,k) basis indices, complex content vectors, direction shares, fourth excesses and tensor hashes are in [SELECTED_TENSORS.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/SELECTED_TENSORS.json). Per-cell completion counts are in [EXPERIMENT_STATUS.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/EXPERIMENT_STATUS.json). Replicate bias and coefficient checks are in [STATISTICAL_DIAGNOSTICS.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/STATISTICAL_DIAGNOSTICS.json).

### Structure and content directions

After a numerical unitary-frame search for the dominant Wick driver X, every selected top-energy tensor is close to X[c(|X|²−2)+P(Y)]. The table gives coefficient-energy percentages; “other” collects the four remaining shell types. The last column is the fraction of squared content along X, not the tensor-energy share.

| n | Wick energy | XP energy | Other shells | Content along X |
|---:|---:|---:|---:|---:|
| 2 | 97.3684% | 2.6294% | 0.0022% | 99.99997% |
| 3 | 97.8337% | 2.1515% | 0.0148% | 99.99994% |
| 4 | 97.4495% | 2.4848% | 0.0657% | 99.99966% |
| 5 | 95.7681% | 4.0762% | 0.1557% | 99.99933% |
| 6 | 96.3323% | 3.4432% | 0.2244% | 99.99937% |

At u=.02 and .03 the selected tensors are even closer to a pure Wick driver: their Wick energy shares range from 99.54% to 99.998%. At top energy, after making the Wick coefficient positive, 91–98% of the XP coefficient energy is in its imaginary Hermitian component. Thus the observed perturbation agrees with the known imaginary quadratic saddle direction. It is not a new, distant tensor mechanism. The small components in other shells are real features of the saved numerical tensors and cannot be deleted in a proof merely because they are small.

For completeness, the top-energy squared-content percentages in the **original** coordinate system are:

| n | Original-coordinate content shares (%) |
|---:|---|
| 2 | 52.748, 47.252 |
| 3 | 54.277, 33.304, 12.419 |
| 4 | 28.232, 12.113, 51.397, 8.259 |
| 5 | 3.730, 6.881, 21.317, 25.471, 42.602 |
| 6 | 38.058, 11.612, 2.308, 20.444, 10.929, 16.649 |

The apparent spreading over original coordinates is largely a rotation of one driver. The full complex vectors and the chosen unitary directions are retained so this assertion can be checked. The best-driver frame is found numerically, not certified globally optimal.

The Wick-endpoint perturbation technique applies to the exact structured baseline below and to the idealized Wick+XP truncation with its small XP share. The pure-XP and independent Gaussian-factor theorems do not automatically apply to a self-interacting Wick+XP tensor. The Hermitian theorem additionally requires its phase/structural hypotheses; a general complex mixture of real and imaginary quadratic parts cannot be assumed covered. None of these family theorems absorbs the remaining shells of the full numerical tensors without a quantitative stability or assembly argument.

### A reproducible structured baseline and dimension growth

The independently checked two-variable family is

    q_z = sqrt(u/(2+|z|²)) X[(|X|²−2)+z(|Y|²−1)].

At u=.0463, a local optimization within this family gives z=.05283531218+.22122669064i and

    C²/D = .08760259435,  D=.0116698322779,  C²=.00102230758317,
    E|q|⁴/u²−2 = 40.04880361.

Its orthonormal-basis coefficients are approximately .2124443037 on H₀₀₀ and .0079369633+.0332328522i on H₀₁₁; all other coefficients vanish. All content lies along X. At u=.02 and .03 the same small family search returns the pure Wick endpoint, with ratios .06914308055 and .07857989851. These are feasible **N** values, not global optimality claims. Radial quadrature orders 128,256,512 agree within 3.1e-11 on the reported ratios; the independently checked kernel interpolation error is separate. Full coefficients and convergence data are in [STRUCTURED_BASELINE.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/STRUCTURED_BASELINE.json).

The peak candidate improves the Wick ratio by about 3.729e-5, or .0426%, and is still far below .10. Its XP energy share is about 2.52%, so it lies inside the known Wick-endpoint family with p≤u/5; the record's certificate for that family gives .225, not .10, and its scalar premises retain the audit limitation in §1. It also shows why “largest fourth excess is worst” is not an established extremal principle.

**P:** the true supremum R_n(u) is nondecreasing in n, by padding a tensor with zeros; new-direction content vanishes by independence. Thus each structured value above is available in every n≥2. Whether R_n increases *strictly* across the requested dimensions is a numerical/global-search question. Smaller native search results in a larger dimension cannot overturn the embedding fact. A selected full-space endpoint that underperforms this explicit baseline must not be reported as the best feasible value or as R_n itself.

## 6. Reproducibility and remaining verification limits

Use `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I`; this interpreter already supplied NumPy and SciPy. The default shell's different Python did not supply both packages. Python-flint was installed only under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies/` for certificate replay; nothing was installed system-wide. The optional fused evaluator's source is [fast_eval.cpp](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fast_eval.cpp); it uses ordinary double arithmetic without fast-math.

The supplied optimizer was not reproducible as written: it executes relative `scan_majorant.py`, absent from `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/`, instead of the supplied [e11_scan_majorant.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/e11_scan_majorant.py). It normalizes by the sample norm, reports coefficient squares despite unequal shell norms, and its interpolation silently clamps beyond v=60. Its log records no source hash, independent re-evaluation, SE or interpolation error. These do not prove its numerical conclusion false; they limit the evidential weight it can carry.

Reproduction commands, library versions, seeds, stopping settings, interruptions and the distinction between historical and reproduction commands are in [RUNS.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/RUNS.md). The final source manifest is a post-hoc snapshot, not a run-start attestation. Optional full-space optimization at the flank and upper rows was not performed; the confirmed family certificates were replayed at all three rows.

The audit does not turn any floating experiment into a certificate, does not certify K for all dimensions, and does not independently rebuild the entire legacy manuscript. The exact dependency boundaries are part of the deliverable, not omitted assumptions.
