<!-- New sixth-audit note. Agent-ID: codex-a7c4. Refs #415. -->
# Sixth Conjecture K audit after merged #413

Agent-ID: **codex-a7c4**. Task [#415](https://github.com/agalatan/grothendieck-lean/issues/415).
Initial baseline: `adb96a5a28bce3ac6ea5896486153d2ffbc556a5`, merged #413.
Resynced base: `40f8c5ee6`, including #416 (completed tilted package) and #381 (lower bound).
This is a bounded audit of the whole monograph and the scope/provenance of its P/C ledger,
with fresh proofs and four small checkers where useful. It does not replay every inherited
certificate or claim a new Grothendieck bound. The historical monograph body and all
sources on the resynced baseline remain unchanged. The current monograph form is retained as requested.

**Labels.** New arguments are **P by author, not externally reviewed**; their scalar
acceptances are **C**. Within-session peer checks are recorded below and do not replace
Claude-side review. The newly completed tilted-sector theorem has its own named
external **P + C** review. That large certificate was not rerun by this pass.

## 1. Findings, most serious first

Locations in this table refer to the baseline, before the living ledger is updated.

| Finding | Location and evidence | Severity | Correction |
|---|---|---|---|
| The nonzero-core Q/ν mixed term is not a single Hermitian radial pairing. | KPR §12, lines 322–325; STATUS 11.45, line 681. [JOINT](JOINT.md) derives two real kernels and gives a genuine cubic witness whose two coefficients have opposite signs. | Medium: wrong interaction formula in the numerical summary; no proved zero-core cost is invalidated. | Correct 11.45, add 7.2.5 and errata I. Both real channels, or equivalently Hermitian and bilinear terms, must be kept. |
| General tilted-A comparison is still called open after the new completion. | README L5; STATUS 11(e) introduction, 11.43–11.44 and priorities. [New report](../received-2026-11-15-tilted-sector/REPORT.md) and [Claude review](../received-2026-11-15-tilted-sector/REVIEW_4.md). | Medium: stale state of knowledge changes the next proof target. | Use the externally reviewed input imported in #416, which also states the peak corollary; independently check its exact budget and prove profile transfer in [REMOTE](REMOTE.md). Remove residual stale summaries. |
| The abbreviated diffuse argument does not justify a vanishing nonlinear first-chaos projection as the dimension grows. | Manuscript `ch7-conjectureK.tex`, “Side experiments of 15 October”; digest §2, lines 199–201. Orthogonality of q is insufficient for nonlinear F(q), as the strict cubic example of #413 also shows. | Medium: missing justification of retained benchmark sharpness, not a refutation of the limit. | [FOUNDATIONS](FOUNDATIONS.md) bounds the full original finite-dimensional projection, then passes to the CLT. No exchange of infimum and weak limit. |
| The useful Gaussian-marginal obstruction still relies on an R-only construction. | STATUS 6.5.1, line 276; manuscript `ch35`, final subsection; MONOGRAPH §3.4. | Low: verification gap. | [OBSTRUCTION](OBSTRUCTION.md) re-derives the known mechanism and certifies a finite excess over S of more than 7·10⁻⁷. The historical 10⁻⁴/44% assertion remains R. |
| Copying raw profile homogeneity into the retained functional would change its multiplier penalty. | STATUS 3.15 versus retained definition 2.10; new application in REMOTE §§3–5. | Application guard, not an error in the old correctly scoped raw theorem. | Prove weighted scaling and a strictly nonhomogeneous genuine-cubic example; transfer with the changed trial cost. |
| The positive-part deficit does not permit attenuation of the raw remote error. | Already correctly recorded in STATUS 11.23 and A15R SECTORS §7. | Existing guard applied, not a new finding. | Use η_R+η for D₊; do not use (1−κ)η_R+η from the signed-D case. |

The Q/ν finding concerns a **mixed Hessian**, not a finite-amplitude cost theorem.
Its negative cross coefficient is not by itself an indefinite full quadratic form.
The Gaussian-marginal obstruction is outside cubic chaos and does not refute K.

## 2. Completed mathematical improvements

### 2.1 Exact peak budget and a new continuum of retained profiles

The new external theorem at the peak is

    C_{3/5}(q)² ≤ (3/10)D₊(q)+3/500000,  0≤‖q‖²≤.0463,

for every dimension and every complex remote cubic. REVIEW_4 reports an independent
re-derivation and replays of the secant and deficit chains separately, not the combined default invocation. In particular its 12 uses of the partly reviewed
third-order content branch can be replaced by the reviewed (2/25)δ branch, with
exact acceptance. We preserve that review's exclusions about the large Arb/C++ code.

The peak <2·10⁻⁵ corollary was imported in #416 while this audit was in progress.
Our independent derivation gives its exact budget, for every remote linear r with arbitrary sharing and amplitude,

    Λ̂(q+(T−1)r) < S+5778430967237/295045000000000000 < S+2·10⁻⁵.

This removes the fifth audit's χ≤.25 condition for the positive 2·10⁻⁵ allowance.
Its stricter negative margin at u≤.021 is still stronger on that smaller region.
No B or odd sector is added, and the original raw content inequality remains open.

For λ=ε/(1891/2500), the retained scaling identity includes weight λ on the normalized
multiplier penalty. The trial v=−λ(3/5)r therefore has normalized cost
k_λ=59009/189100−(λ−1)9/25. With ε∈[.74,.76] and

    0≤a/λ−.5592≤.0004,  0≤b/λ−.1432≤.00125,
    ‖q‖²≤λ² .0463,

the new error is below

    869040549842757089931/8877866800000000000000000
      <9.8·10⁻⁵<10⁻⁴.

The common physical-energy cutoff .0443 is safe throughout the rectangle.
The flank and upper rows are not included. The proof uses a fixed Gaussian supporting
plane for S and paired triangle bounds; no unproved convexity or grid interpolation.
The profile transfer is new; the peak result is an independent exact-budget re-derivation.
Both have author proofs and exact rational acceptance, conditional on the
explicitly reviewed external input, not a fresh independent proof of that input.

### 2.2 A finite-N retained diffusion estimate

Let H(X)=X(|X|²−2)/sqrt(2), and q=Σc_jH(X_j) on independent remote coordinates.
For every a>0,b≥0 and v_j=|c_j|²,

    0≤Λ(q)−Λ̂(q)≤192 a⁻⁶(1+4b/a) Σv_j³.

The coefficient is <12711 at the peak. The proof supplies a global C³ bound on
F(w)=E_Z ph(L+w), cancels the first three blockwise Taylor terms, and sums the
entire original first-chaos projection. For arbitrary independent cubic blocks the
same result holds with coefficient 15200, using the inherited sixth-moment theorem.

For q_N=sqrt(u/N)ΣH(X_j), the penalty difference is O(u³/N²). The CLT and uniform
integrability then give Λ̂(q_N)→B(u)−pu. Thus the supremum over all finite-dimensional
cubics is at least S. No rate is claimed for the full CLT payoff error, no fixed-dimension
attainment is established, and the response constraint in Λ′ is not removed.

The independent-block mechanism was already in the October diffuse record and the
13-November A-content asymptotic. The addition here is the explicit finite-dimensional
retained-penalty bound and the completed limiting argument.

### 2.3 Both Q/ν channels and a certified genuine witness

For the normalized ν-sector νZ(T−2)/sqrt(2), the coefficient K in the mixed
quadratic term 2λμK is

    K=Reν E[ReQ A(|q|)]+Imν E[ImQ B(|q|)],

with explicit radial integral kernels A and B in JOINT (1). The mixed second
derivative is 2K. At zero core A(0)=0 and EQ=0 kills the B term, preserving the old
zero-core result. More generally E[Q | |q|]=0 is sufficient for both terms to vanish.

At the peak take q=.001 X(|Y|²−1), f=|Y|²−1, with independent remote X,Y.
The genuine pairs (Q,ν)=(f,1) and (if,i) give respectively

    K(q;f,1)<−8·10⁻⁶,    K(q;if,i)>4·10⁻⁶.

A single Hermitian pairing would give identical values after the simultaneous
rotation. The checker uses exact radial intervals and an analytic O(c³) remainder;
there is no quadrature or tensor-search acceptance. This refutes the one-kernel
formula on actual cubic directions, not just on the inadmissible constant-Q model.

### 2.4 A finite Gaussian-law-only obstruction

The October smooth phase construction is

    Q=sqrt(u₀)X exp(2πi[1−(|X|²+1)e^{−|X|²}]),
    u₀=.0403448,  G=Q−(i/1250)(T−1)X.

Q is exactly circular Gaussian and orthogonal to the whole remote first chaos.
Nevertheless the supporting-plane lower bound, fresh kernel constants and direct
Rice benchmark replay prove Λ(G)>S+7·10⁻⁷. Its Gaussian Dirichlet energy is
u₀(1+64π²/81)>3u₀, so it is not a Wick cubic. This gives fresh evidence for the
existing qualitative obstruction. It does not certify the separate historical
violation of the whole 10⁻⁴ allowance or its reported 44% noncubic energy.

## 3. Whole-monograph coverage and inherited labels

This is a statement/scope/proof-dependency audit, not a blanket recertification.

| Monograph section | What this pass checks | What remains inherited or unresolved |
|---|---|---|
| §§0–1 | Raw, constrained and retained functionals; role of the actual first chaos; Gaussian benchmark sharpness; profile scaling. | Prior row/response reductions retain their own reviews. No complete consumer or new bound. |
| §2 | Visible parity and six-sector normalization, including ν=sqrt(2)d; charge cancellation in the full block projection. | Parity removes odd linear content, not finite-amplitude odd cost. |
| §3.1 | Zero-core odd costs remain consistent with the corrected two-kernel formula. | Their historical interval certificates are not rerun here. |
| §3.2 | Independence of the visible coordinate and Gaussian-driver hypotheses; conditional covariance must be included. | The disjoint/conditionally Gaussian theorems keep their prior scope. |
| §3.3 | Raw cap versus retained value, all-dimensional diffuse approximation, direct benchmark replay for the new witness. | The full October remote cover is not rerun in this pass; its named earlier independent replay remains. |
| §3.4 | General versus family content claims; genuine-cubic versus Gaussian-marginal residual; completed tilted theorem and its energy domain. | Raw mixed-driver content and the separately R fourth-moment cutoff are not promoted. |
| §3.5 and “THE WAY” | Saddle correction, envelope rather than exact extremality, numerical labels. | No fresh tensor optimization; old numerical figures remain N. |
| §3.6 | Summary implications through all six layers. | Retained A-core closure is not raw L4 or full L5 closure. |
| §4 and §4b | Existing local joint spectrum, both relative phases, nonzero-core odd interaction, D₊ assembly, current priorities. | The finite-amplitude compact joint A/B inequality and full odd control remain open. |
| §5 | Exact thresholds and central consumer are conditional on all-sector bounds and remaining response coverage. | A narrow profile rectangle does not complete the row cover. |
| §6 | Existing literature-equivalence corrections and their claim scope. | No new literature verification; original sources retain R where applicable. |
| §7 | Paths, copied versions, current versus external verifier provenance; new scripts documented read-only. | No old source, binary or historical checker is replaced. |

STATUS P/C families were swept for hypotheses and dependencies; fresh checks concentrate on
the four notes above. A source-labelled P is not silently changed to a fresh P/C replay.
The fourth- and fifth-audit reviews retain their exact exclusions; sixth-audit arguments await external review.

## 4. Feedback and coordination

[PR413_FEEDBACK](PR413_FEEDBACK.md) archives the initial coordination comment about
#414. The user's current instruction keeps the present monograph form, so this pass
adds errata I without restructuring the historical body. During final integration,
Claude's [post-merge mathematical review](REVIEW_413_claude-b9ee.md) appeared: **approve**
at head b5d93043e4de610bcb581a6984d9bf36997957da, identical in tree to merged #413.

| Review item | Disposition in this pass |
|---|---|
| F1: pointwise raw/retained strictness does not separate the diffuse supremum; the old README statement was right in context | Accept. The earlier wording concern is a low-severity scope clarification, not a refutation of the shared remote benchmark. STATUS item82 is qualified accordingly. FOUNDATIONS supplies an explicit finite-N bound, credits earlier diffusion, and makes no Λ′ sharpness claim. |
| F2: the original tail checker already used exact Fractions | Accept. Only #409's review check was numerical; the historical original checker was exact. Restore that provenance in STATUS7.4.5 and errata I without editing the archived fifth note. |
| F3: fixed-bank limitation only | Keep its finite-bank scope; #416's new Stein certificate goes beyond it. |
| R1–R4 and replay evidence | Record the independent re-derivations, all three byte-identical replays, exact critical-point acceptance of 33 leaves, and numerical eigenvalue cross-checks within their stated scope. 11.47 stays stronger than 11.51 on u≤.021; 11.48 is a special case. |
| Stale README/STATUS/errata H next-step wording | Replace current summaries and priorities with the completed A-only theorem and the unresolved joint/odd interfaces. Part I supersedes part H's proposed next step. |
| Retained trial 11.12 attribution | Name A15V FOUNDATIONS §1 as the independent re-derivation; the #409 reviewer authored the earlier ledger entry. |
| Polynomial/leaf counts | 17 polynomials and 33 leaves are the combined fifth-audit totals. Its R2 alone uses 10 polynomials and 19 leaves; no larger scope is inferred. |
| Review exclusions | Arb/python-flint internals, October profile.py, inherited inputs beyond their use and the fifth AUDIT coverage table remain outside that review. It does not review this sixth pass. |

Task #412 imported the completed tilted package in #416 during this audit. The rebase
retains that import, its version history and detailed review scope. Provisional duplicate
report/review snapshots were removed; our notes cite the canonical copies. The peak
A-core corollary is also already in #416 and is credited accordingly. The new work is
the profile transfer, finite-dimensional diffusion, odd interaction correction and
finite obstruction witness, with an independent exact-budget check of the peak corollary.
The independent reviewer reports P+C with explicit exclusions; those do not become
a claim that this audit freshly replayed the large certificate.

The same resync includes #381, which changed the current proved lower bound to
1.401700037873. Only living current-bound references are updated from that source;
this audit proves no new Grothendieck bound. Historical numerical comparisons stay dated.

## 5. Reproduction and validation

Run from the repository root:

```sh
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/retained_profile_transfer.py
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/diffuse_retained_exact.py
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/odd_coupling.py
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/gaussian_obstruction.py --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

All four complete fresh runs pass and reproduce their adjacent JSON byte for byte.
The first three need only the standard library; the fourth uses the existing
python-flint installation through the direct Rice checker. On an interpreter where
flint is already importable, the dependency option may be omitted. All default runs
are read-only. Saved JSON is output, not acceptance input. Integral/chaos identities
remain paper premises of the scalar scripts.

Independent within-session peer checks covered the diffusion proof/score constant,
weighted transfer and energy cutoff, both odd kernels and all analytic remainder
constants, and the obstruction's sign/factor-four, quantile estimate and Dirichlet
normalization. They found no defect. These are internal checks, not external review.

Every source present at the resynced baseline and the historical monograph body are
preserved byte for byte. The source replacements/history imported by #416 are inherited
unchanged; before that resync all 330 original #413 source files were checked unchanged. Changes to existing files are confined to the four living documents.
New files are text, Python and small JSON, below 300 KB. No Lean build, library
installation, binary, large certificate or persistent external log is part of the PR.

## 6. One more day

Prioritize the retained joint A/B remainder with the tilted A direction: the new A-only
theorem makes that interface more useful than another isolated A-content bound.
Certify a feasible compact joint cost, using the existing local spectrum and the
already-reduced tail, and then budget both contents with the full cost matrix.
In parallel derive a two-channel Q/ν estimate that uses joint chaos identities rather
than centering alone. Only after those interfaces are quantified should the profile
rectangle be expanded for a complete response cover.
