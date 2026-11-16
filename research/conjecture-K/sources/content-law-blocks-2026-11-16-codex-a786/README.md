<!-- Verbatim from the delivery conjecture_k_content_law_blocks_codex_a786.zip (README.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# Content-law progress after a further literature search

16 November 2026 — codex-a786. Standalone follow-up to the preceding
one-Hermitian-factor result. The repository was read at commit
`b3cca50483aaaf38ea83296428176a1553dd915f` and was not modified.

The universal content-law inequality remains **open**. This package proves
new cases with explicit constants, including any number of independent
Hermitian-factor blocks and unequal, signed Hermitian spectra. The constants
do not grow with the number of blocks. These are finite-dimensional cubics
with generally nonzero content, not an asymptotic or zero-content-only result.

## Statements

Let X_i, Y_i, U and Z be mutually independent standard complex Gaussian blocks.
Set

\[
 P_i=\sum_j\lambda_{ij}(|Y_{ij}|^2-1),\quad
 \sum_j\lambda_{ij}^2=1,\quad\lambda_{ij}\in\mathbb R,
\]

and allow the independent bulk W=sum_a conjugate(Z_a) F_a(U), where the F_a
are arbitrary holomorphic quadratics and E|W|²=1. For nonnegative weights
rho_0,...,rho_r summing to one, put

\[
 q=\sqrt u\left(\sum_{i=1}^r\sqrt{\rho_i}X_iP_i+
                                     \sqrt{\rho_0}W\right).
\]

All results below use the question's EXACT c[h], delta and Omega-hat, and
hold for both h_A and h_B, for all six rows and every u>0.

| Label | Assumption on the active P_i | Result |
|---|---|---|
| **P** | Arbitrary separate Hermitian factor blocks | Explicit phase-sensitive criterion, Theorem 1 in `PROOFS.md` |
| **P** | Every sum_j lambda_ij⁴ <= 1/64 | theta=1015/804 < 1.3 |
| **P** | Every sum_j lambda_ij⁴ <= 1/576 | theta=2465/6948 < 0.37 |
| **P** | Equal positive eigenvalues, every block rank >=5 | theta=451/360 < 1.3 |
| **P** | Equal positive eigenvalues, every block rank >=24 | theta=119/324 < 0.37 |
| **P** | Equal positive eigenvalues, every block rank >=1 | theta=39/16 < 2.5 |
| **P + C** | Equal positive eigenvalues, every block rank >=4 | theta=8153/6300 < 1.3 |
| **P + C** | Equal positive eigenvalues, every block rank >=23 | theta=16226/43875 < 0.37 |
| **P** | Any normalized Hermitian P with kappa=sum lambda_j⁴ | E[E(P given P²)²/P²] <= min(1,2 sqrt(kappa)) |
| **P** | q_m=X sum_{j<=m}(|Y_j|²-1)/sqrt(m) | Exact obstruction to capturing its L² energy using boundedly many original Gaussian coordinates; `COORDINATE_OBSTRUCTION.md` |
| **C** | Rational comparisons, scalar interval integrals and finite polynomial instances | Replay below; no libm or floating-point certification assumption |
| **open** | Arbitrary coupled H_{2,1} tensors and driver self-interaction | No universal row closure or new Grothendieck bound |

The inequalities hold more generally for every real profile continuous on
(0,infinity) with |h(v)| <= C(v^(-1/2)+1+v^d). The main proof includes the
admissibility of the supplied phase profiles. No numerical profile estimate
is needed on these classes.

The thresholds 1.3 and 0.37 are comparisons with the room targets in the
question. They certify those comparisons for this class; they do not certify
the external convex program or cover all its possible cubics.

## What changed from the preceding result

The earlier calculation treated one equal-spectrum factor, with a particular
independent cubic bulk. The new argument retains the common radius of the
whole sum and proves that arbitrarily many factor blocks cost no additional
factor in theta. Keeping a further cross term improves the old equal-factor
plus-bulk thresholds 8 and 36 to 5 and 24 by written proof alone, and to
4 and 23 using exact interval checks of twelve scalar phase integrals.
It also turns the formerly unevaluated general-Hermitian
phase criterion into explicit bounds under spectral hypotheses.

The important identity is (14) in `PROOFS.md`. A zero obtained from two
integrations by parts keeps the sign of each factor before estimating any
norm. The resulting two squared norms consume complementary portions of the
same variance budget, equations (21)-(23). Adding separate one-driver
inequalities would miss this step.

## Replay

Node.js >=20, no package installation and no network needed:

```sh
# Run from the unzipped content_law_blocks_a786 directory.
node verify.mjs
```

Expected: `status: PASS`. It regenerates `results_exact.json` and
`phase_intervals.json`; the recorded run took about 10 seconds. It checks:

- exact rational radical bounds and all six row comparisons;
- twelve scalar phase integrals, using 8192 panels each and directed
  256-bit fixed-point intervals implemented with BigInt; `INTERVAL_PROOF.md`
  proves the enclosure algorithm. No saved numerical inputs are trusted;
- 72 multi-block polynomial-profile instances, including unequal signed
  spectra, unequal amplitudes, up to seven active blocks and a genuine cubic
  bulk; the direct content and the new balanced identity are evaluated
  separately using exponential moments;
- a second, independent complex-Wick polynomial implementation on five
  models, checking absolute moments and every linear content coordinate for
  profiles of degrees zero through two;
- the exact one-coordinate projection maximum identity.

These are **C** checks of algebra, scalar intervals and constants. They do not constitute a
machine proof of the all-profile theorem. The all-profile claims are **P**
written proofs, not independently reviewed and not formalized in Lean.
There are no **N** claims used in this package.

## Files and dependencies

- `PROOFS.md`: complete content-law proofs and all constants.
- `INTERVAL_PROOF.md`, `certify_phase.mjs`, `phase_intervals.json`: additional
  scalar certificates lowering the sufficient rank thresholds. The default
  replay calls the scalar checker automatically; it can also be run alone.
- `COORDINATE_OBSTRUCTION.md`: exact reduction obstruction and its limits.
- `LITERATURE.md`: papers read, reference chains followed, and what transferred.
- `LEDGER_PATCH.md`: proposed additions; no repository edits.
- `AUDIT.md`: scope, failure points checked, and remaining gaps.
- `verify.mjs`, `results_exact.json`: exact replay and saved result.
- `rows.json`: the six input rows, copied verbatim from the preceding package.
- `source_manifest.json`: URLs and hashes of the literature downloads and
  repository ledgers consulted; papers themselves are not redistributed.
- `SHA256SUMS`: file hashes.

Repository anchors: Conjecture-K **6.3.21, 6.3.23, 6.3.25, 11.31a**, section
14 item **32**, and higher-degree **4.19**. Section 7 of `PROOFS.md` distinguishes
background from actual premises. The only external special-function inputs
are standard Gamma duplication and Binet identities in the equal-spectrum
corollary; the unequal-spectrum theorem does not require them.
