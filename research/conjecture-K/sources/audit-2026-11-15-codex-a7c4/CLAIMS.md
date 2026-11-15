<!-- New audit note, authored at this repository path on 2026-11-15. Agent-ID: codex-a7c4. -->
# Claim audit, missing independence, and bounded kernel replay

Agent-ID: codex-a7c4. Refs #395. This note audits the monograph and the P/C
ledger apart from the remote packages and the new sector experiment, which
have separate reports in this folder. It builds on the 13 November audit.
The two explicit witnesses below are **P, by their author, not reviewed**;
their finite scalar inequalities pass the standard-library exact checker
[`claims_exact.py`](../../code/audit-2026-11-15-codex-a7c4/claims_exact.py).
They refute broadened L² formulations, **not Conjecture K**: neither indicator
witness is a Wick cubic. Existing P/C labels are not blanket recertified here.

Line numbers below refer to the input tree `93098815d`; entry/section names
remain the primary identifiers after the central files are edited.

## 1. Findings and precise corrections

| Location | Finding and evidence | Severity | Correction |
|---|---|---|---|
| STATUS 4.1, line 121 | `U` independent of `(Z,H)` does not imply that H is remote. The entry says “any square-integrable H” but omits `H` independent of `Z`. The finite-amplitude witness in §2 violates the literally broadened statement, including its norm cap. The original source explicitly requires H independent of `(Z,U)` at lines 168–169. | Medium: essential hypothesis lost in consolidation | Add that H is independent of Z; retain independence of U from `(Z,H)`. The intended disjoint remote theorem and its prior P label are unaffected. |
| STATUS 5.2, line 130; MONOGRAPH §3.2, lines 291–296 | The conditioning sigma-field must be independent of Z. Otherwise coefficients measurable with respect to it can select arbitrarily favorable visible radii. The explicit witness in §3 fails same-norm domination despite its nonnegative conditional variance. The original Gaussian-domination note states independence at line 147; ADD §3 preserves it. | Medium: essential hypothesis omitted | Require `F` independent of Z, integrable nonnegative F-measurable coefficients, and the stated conditional centered proper Gaussian law. If the ambient cubic hypothesis is understood implicitly, the witness still shows that the claimed generic conditional-law relaxation needs this extra premise; it is not a cubic refutation. |
| STATUS 5.1a, line 129; §13.1 item 12; compare MONOGRAPH §3.1, lines 283–284 | A positive tangent correction proves that a particular tangent argument cannot drop H=0. It does not itself prove that `F(q+G0)<=B(total energy)` is false for a genuine remote cubic q. ADD §2 derives the correction but supplies no cubic counterexample. | Medium: proof failure described too broadly as theorem refutation | Say “the q=0 tangent proof does not extend unchanged”; retain the valid quantitative extension. Mark the failed proof step, not an unprovided cubic counterexample. |
| STATUS 7.1.4 and §13.3 item 44 | Endpoint and endpoint-centered bounds previously carried R. The new standalone Arb replay confirms the flank/upper endpoint counterexamples; see §5. It does **not** establish or refute the common-center bound `\|g_B−0.5053g\|<=0.007` for every v. | Low: verification improvement | Upgrade only the explicitly replayed finite scalar counterexamples to C; leave the global common-center target open. |

The first two omissions are in summary formulations. Their source proofs
contain the hypotheses, so the correction is local. The third issue is a
logical distinction, not evidence against the intended comparison theorem.

## 2. Explicit redistribution witness when H is allowed to depend on Z

Use the exact peak profile

    a=699/1250, b=179/1250, ell=1057/1250,
    L=Z(a+bT), T=|Z|², E={T>=10},
    H=−L 1_E, U=sW, s=1/1000000,

where W is an independent standard complex Gaussian. U is independent of
`(Z,H)` as the uncorrected entry demands. The two compared expressions are
`F(H+s(T−1)W)` and `F(H+sW)`; an independent copy of W on the right has the
same expectation.

Write `c=E|W|=sqrt(pi)/2`. Jensen's inequality in W gives, for the left side,

    F(H+s(T−1)W) >= F(H) + s c E[(T−1)1_E].

Indeed, on E one of the two unperturbed norm arguments is zero and the other
is `2L`; off E both are nonzero. Each nonzero argument's expected norm is
at least its unperturbed norm. For the right side, the elementary tangent
majorant `E|x+sW|<=|x|+s²/(2|x|)` for x nonzero gives

    F(H+sW) <= F(H) + s c P(E) + s² E[1/|L|].

The actual quadratic coefficient is smaller on E, so the last bound is
conservative. Since `E[1/|L|]<=sqrt(pi)/a` and
`E[(T−2)1_E]=9 exp(−10)`, subtraction gives

    F(H+s(T−1)W) − F(H+sW)
       >= s sqrt(pi) [9 exp(−10)/2 − s/a] > 0.                (1)

For the strict sign it is enough to use `e<3` and check
`9/(2*3^10)>s/a`, an exact rational comparison. The energy condition is also
satisfied: repeated integration by parts gives

    ||H||² = (79672141/1562500) exp(−10) < ell²/2,
    ||H||²+s² < ell².

The checker proves the first upper bound with a positive rational Taylor
polynomial below `exp(10)`, and verifies every rational comparison in (1).
Thus the omitted independence matters even at a completely explicit,
admissible norm and amplitude. H is not a cubic and is not remote.

## 3. Explicit conditional-Gaussian witness when F may depend on Z

Keep the peak profile and let

    E={T<=1/100}, F=sigma(Z), G=(a/2) W 1_E,
    v=||G||²=(a²/4)P(E).

Conditioned on `(Z,F)`, G is centered proper Gaussian with the required
polynomial variance form: take its constant coefficient to be
`s(Z)=(a²/4)1_E`, and the other three coefficients zero. All are nonnegative,
integrable and F-measurable. The only absent condition is `F` independent of Z.

On E, symmetry and Jensen give `E_W|L+(a/2)W|>=E|(a/2)W|`.
Writing `r(t)=sqrt(t)(a+bt)` and `B0=2E|L|`, this implies

    F(G) >= B0 + P(E)[sqrt(pi)a/2 − 2r(1/100)].

For the independent same-energy benchmark, the norm tangent inequality gives

    B(v) <= B0 + v E[1/|L|]
          <= B0 + P(E) sqrt(pi)a/4.

Consequently

    F(G) − B(v)
       >= P(E)[sqrt(pi)a/4 − (a+b/100)/5]
        > P(E)[a/4 − (a+b/100)/5] > 0.                      (2)

The final bracket is `8648/312500 = 0.0276736`, checked exactly. The strict
positive probability needs no numerical integration. Again this is an L²
counterexample to the enlarged generic conditional-law statement, not a cubic
counterexample to K. It explains exactly why the source requires F independent
of the visible coordinate before conditioning on its random coefficients.

## 4. Additional algebra checked and what it buys

The gate-free row (2.1) follows from the same two projection square
completions printed in ADD §1; both real pairings and `||B||²=2 beta²` have
the stated normalization. The discarded first-chaos penalty is nonnegative.
The parity identity (2.9, 7.2.1) follows by `Z -> −Z` and exchanging the two
norms; its Hessian consequence is conditional on differentiability and does
not imply finite-amplitude monotonicity.

The shell bookkeeping (2.8) can be made explicit without an unspecified
coefficient E. For the decomposition in README, Gaussian chaos orthogonality
and phase averaging give exactly

    E[|G|² | T]
      = ||q||² + (T−1)²||r_A||² + (T²/2)||r_B||²
        + T(||Q||²+||P||²) + |d|² T(T−2)².                 (3)

The q/A cross term vanishes by cubic/linear orthogonality in the remote
coordinates even though they have the same visible frequency. The Q/d cross
term vanishes because EQ=0. Every other cross term has a nonzero visible
frequency. After factoring the visible phase the frequencies are exactly
those in 2.8. Among the nonremote increments at a remote base q, parity kills
the first variations of `ZQ`, `conjugate(Z)P`, and `dZ(T−2)`. It does not kill
A or B. This elementary reduction is **P, by its author, not reviewed** here;
it is already in the manuscript, not a new theorem.

The constrained A-only optimization in 6.2.3 and the joint Schur completion
in 7.4.1 have the correct complex-Hilbert-space normalization. Maximizing
`2 Re<r,c>−k||r||²` over `||r||<=R` gives exactly the piecewise function
printed in 6.2.3. There is no dimension factor in
`||Pi_1 F||=sup_{||X||=1}|E[conjugate(X)F]|` (6.2.4).

The new exact checker independently reproduces the conditional budget
arithmetic of 7.4.2–3. With `rho=5053/10000`, `e²=(7/1000)²(463/10000)`,
the maximum over deficits of the quadratic bound is

    e²(k_A−gamma)/(k_A k_B−m²
        −gamma(k_B+k_A rho²−2m rho)).                       (4)

At `(m,gamma)=(0,3/20)` this is `22687/1578687640`; at
`(−59/500,1/10)` it is `158809/2211522920`. Both are less than `1/10000`.
The exact adverse threshold is `4889900/47482107`, as in STATUS. The old
axis-cost countermodel's excess is independently checked as
`53464061/160000000000`. These computations preserve the extra joint-cost
and kernel hypotheses; they do not supply them. **C for finite algebra.**

The direction-sensitive norm majorant in 7.2.2 follows by squaring and using
`sqrt(1−x)<=1−x/2`; at M=0 both sides are zero and the quotient is interpreted
by continuity. The whole-projection arguments for the Gaussian-factor
certificates (6.3.2–4) correctly eliminate the coefficient-coordinate
components by the common phase of the independent driver block. Their
finite-moment envelope implications remain valid; they do not cover
self-interaction or arbitrary mixed shells.

## 5. Kernel comparison: finite certificates, bounded scope

The angular coefficients were re-derived by the binomial expansion and
compared with the historical J3 formulas. With x=sqrt(v), R=sqrt(t)(a+bt),

    f(R,x)=E_theta Re ph(x+R exp(i theta)),
    h(R,x)=E_theta Re[exp(2i theta) conjugate(ph(x+R exp(i theta)))],
    g(v)=integral exp(−t)(t−1) f(R,x)/x dt,
    g_B(v)=integral exp(−t)t h(R,x)/(sqrt(2)x) dt.

For R<=x, f is `2F1(−1/2,1/2;1;R²/x²)` and h is
`−(R²/x²)2F1(1/2,3/2;3;R²/x²)/8`. For R>=x, they are respectively
`(x/(2R))2F1(1/2,1/2;2;x²/R²)` and
`−(x/(2R))2F1(−1/2,3/2;2;x²/R²)`. The negative B sign and sqrt(2)
normalization agree with the actual normalized B shell.

[`claims_kernels.py`](../../code/audit-2026-11-15-codex-a7c4/claims_kernels.py)
recomputes finite scalar enclosures with python-flint 0.9.0, 120 bits, no
stored kernel table. It uses `t=r²`, exact rational root bracketing, a
separately bounded omitted interval around R=x, and the explicit Gaussian
tail beyond r=10. Arb's returned integration balls, not the requested
tolerance, enter the acceptance comparisons. Analytic continuation rejects
balls crossing the hypergeometric cut; imaginary output must contain zero.
The endpoint uses an erfc closed form, independently of the J3 endpoint
quadrature. Results are in
[`claims_kernels_result.json`](../../code/audit-2026-11-15-codex-a7c4/claims_kernels_result.json).

| row | enclosing rho(0)=g_B(0)/g(0) | enclosing rho(0)g(1/2)−g_B(1/2) |
|---|---|---|
| peak | (0.5053406046349274, 0.5053406046349276) | (0.006971675775, 0.006971675777) |
| flank | (0.5026320063547816, 0.5026320063547819) | (0.007132643360, 0.007132643362) |
| upper | (0.5011303238157372, 0.5011303238157374) | (0.007059817861, 0.007059817863) |

**C:** the flank and upper values refute both the proposed common ratio lower
endpoint 0.505 and the endpoint-centered 0.007 residual. These are existing
J3 counterexamples now independently replayed, not novel counterexamples.
The common-center residual at v=1/2 is instead respectively enclosed in
`(0.006986219619,0.006986219621)`, `(0.006173947150,0.006173947152)`, and
`(0.005552644853,0.005552644855)`, all below 0.007. At the peak, v=49/100
and 51/100 also pass. **No continuum assertion follows from these points.**
In particular, the global common-center target 7.1.4 remains open; the margin
near v=1/2 is only about 1.38e−5. This bounded audit stopped before attempting
a costly all-shift continuum certificate.

Replay, from the repository root:

```sh
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/claims_exact.py
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/claims_kernels.py
```

On this machine flint was installed only in the earlier auditor's dependency
directory, outside isolated Python's normal path. The second command was
therefore run with
`--dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies`.
This argument changes dependency lookup only; it supplies no numerical data.
No existing source or earlier output was edited.

## 6. Coverage of the requested bounded audit

Every monograph section was read, including its errata and appendices. The
following table distinguishes new checking from inherited work. “Retained”
means the prior status remains its prior auditor's claim, not a new replay.

| Monograph section / STATUS entries | Work in this audit | Outcome and remaining trust limit |
|---|---|---|
| MON §0–1 / 2.1–2.6, 2.10–2.12 | Gate-free square completions and quantifier scopes checked; old exact threshold issue read; n=1 independently handled in ODD_COST.md | No general K conclusion. Response energy caps are not raw-K hypotheses. Remote/K_all certificates are handled separately, not upgraded here. |
| MON §2 / 2.8–2.9 | Conditional energy (3), visible frequencies and parity re-derived | Elementary reduction confirmed; clarify first-order claim refers to visible-shell increments at a remote base. |
| MON §3.1 / 5.1–5.1a, 5.4 | Read complete ADD reconstruction, derivative signs and radial comparison; independently reviewed and ran ODD_COST checker | No defect found in the q=0 theorem. Positive remote tangent term is a proof obstruction, not a cubic counterexample. See separate zero-core result. |
| MON §3.2 / 5.2–5.3 | Matched theorem assumptions to original proof and ADD; checked the conditional cross-term example | Lost sigma-field independence corrected. Prior Bessel-barrier proof retained; not counted as a new full independent proof. |
| MON §3.3 / 2.7, §3 | Read scale-mixture/complete-monotonicity reduction; moment-cap packages delegated | Scalar convolution structure retained. No all-profile remote result inferred. |
| MON §3.4 / 4.1–4.2 | Compared source hypotheses and redistribution norm restriction; explicit failure of broadened 4.1 | Restore remoteness. Uniform heat-cost checker remains inherited R, not replayed here. |
| MON §3.4 / 6.2.1–5 | A-cost source scope, scalar optimization and unit-direction projection reduction checked | Prior exact A-cost replay retained; no repeated certificate run. A-only conclusion does not assemble other sectors. |
| MON §3.4, §3.6 / 6.3.1–4 | Read CERT analytic moment/envelope arguments, full-vector projection and kernel-node trust chain | No new flaw found. Heavy 1.17m/2.14m-box replay and 441-node integration are inherited C, deliberately not rerun. |
| MON §3.4, §3.6 / 6.3.5–7 | Checked real/Hermitian and energy restrictions, Wick perturbation implication, size-biased interpretation | 0.23 retains its saved-kernel condition; 0.225 numerical premises remain R. No unqualified theorem upgrade. |
| MON §3.4, §4 / 6.3.8–12 | Read shell counterterms, symmetry extension and scalar dependency chain | Content extension is a neighborhood theorem conditional on its core input. Universal nonlinear theorem remains R; no missing tensor derivation supplied. Exact tensor computations retain prior status. |
| MON §3.5, §4 / 6.3.13–18, 6.4–6.5, §9 | Compared searches, saddle/finite perturbation, deficit versus optimized slack and fixed-block diffuse asymptotics | No all-dimensional maximum or global envelope inferred. Existing numerical and partial C labels retained; no repeated large search. |
| MON §4b / 7.1 | Re-derived pairing/sign; inspected all-amplitude density-potential proof; finite kernel replay §5 | B-cost retained; new C only for finite endpoint counterexamples. The global comparison remains open. |
| MON §4b / 7.2–7.3 | Re-derived parity, directional norm bound, source-remoteness restriction and arbitrary-even-base cusp | Infinitesimal result cannot be integrated through nonremote bases. Existing compact Arb integrals remain R. |
| MON §4b / 7.4–7.5 | Independently recomputed Schur algebra, exact conditional budget and axis countermodel; inspected IMP-JT conditional box reduction | No joint bound created by algebra; compact box and simultaneous odd-sector control remain open. |
| MON §5 / §8 | Checked reciprocal thresholds and varying-epsilon warning against existing audit | Row consumer still unbuilt; no new bound claimed. |
| MON §6 | Read literature/context assertions | No external literature theorem needed for the new results. Bibliographic assertions not independently verified; near-Gaussian coverage warning remains. |
| MON §7 / existing C entries | Compared inventory/replay descriptions with prior audit's actual ledger | “User replayed” is not silently raised to audited C. The broken historical helper paths remain historical; new checkers are standalone. |
| MON later errata / §10–§12 | Read model-versus-proof distinctions; new sector and remote reports delegated | Identity-tail numbers stay N; old lower-cover and external upper claims not rebuilt. |

The same-session review of ODD_COST.md checked the conditional moments,
tangent normalization, convexity reduction, J0 formula, recurrence, interval
arithmetic and all three series remainders. Running its standard-library
checker reproduced every saved interval. This is an internal mathematical
cross-check, not the independent Claude-side review required to land a PR.

## 7. Applied versus proposed improvements

Applied in the new material: explicit finite-amplitude witnesses for both
missing independence conditions; an unambiguous shell-energy identity; exact
versions of the conditional joint-budget numbers; a standalone finite Arb
kernel replay with its trust boundary. Central-file corrections are proposed
to the integrating agent and documented in the findings table.

With one more day, first pursue the global common-center kernel residual by
certifying an interval cover with analytic tails, retaining the original
center 0.5053. Changing to the endpoint ratio is already refuted on two rows.
This would remove one explicit scalar premise, while leaving the substantive
joint finite-amplitude and general content problems intact.
