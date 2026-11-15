<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/README.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- codex-c7e2-round3/README.md; Agent-ID: codex-c7e2. -->
# Quantitative odd sectors over the fixed A/B trial

15 November 2026. Repository baseline:
[`e9b0a458d06e67e9a1eee1168e98f34ef577b3a0`](https://github.com/agalatan/grothendieck-lean/commit/e9b0a458d06e67e9a1eee1168e98f34ef577b3a0),
which includes merged PR #447. Relevant active interfaces were read in
issues [#431](https://github.com/agalatan/grothendieck-lean/issues/431),
[#436](https://github.com/agalatan/grothendieck-lean/issues/436), and
[#446](https://github.com/agalatan/grothendieck-lean/issues/446).

**The unrestricted odd premise remains open.** This round proves explicit
regions for both requested alternatives, and a larger region for a
specified genuine shared-cubic family. Every constant used in these
theorems is numerical. No existence threshold, new Grothendieck endpoint,
or Lean formalization is claimed.

The fixed A/B trial X is exactly the one in the task. Algebraically
recentring a proof base does not change X. The only optional trial change
is the expressly permitted single constant c in O−cZ, whose price |c|²
is always included.

## A: arbitrary cubic and arbitrary sharing

Write k=32/25, κ=p−k=1988/47275 and U=E|r_B−ρr_A|². The new bound is

\[
\boxed{\inf_{c\in\mathbb C}\{|c|^2+E D(X,O-cZ)-pW\}
\le \frac{11}{10}V+2\sqrt{\frac{176}{125}VW}
-\frac{1988}{47275}W-\frac3{76}|\nu|^2.}\tag{1}
\]

Thus A holds whenever the right side of (1) is at most
`U/100+s(q)+1/20000`. This energy inequality is the most flexible
sufficient region supplied by the universal method. It retains actual
W, the residual-driver credit, and the visible-cubic credit. The proof
also gives the explicit deterministic c and its stronger phase-dependent
credit. Taking c=0 simply removes the last term in (1).

Using the task's supplied signed-slack bounds and maximizing over
`0≤W≤1/50` gives these sufficient prefix regions. They do not spend U
or the ν credit, and c=0 suffices.

| Remote energy | A/B energy V |
|---|---:|
| u≤0.01 | V≤0.000033888 |
| u≤0.02 | V≤0.000015614 |
| u≤0.03 | V≤0.000004337 |
| u≤0.0463, including u near u* | V≤0.000001435 |

All decimals in this table denote exact rational numbers. The last row
uses the supplied lower bound s(q)≥−0.00000036. The first three use the
supplied reviewed lower-energy slack bounds; those inputs are not
re-proved by this package. The estimates otherwise need only second
moments, EQ=0, and a constant ν, so they permit arbitrary dimension,
sharing, and complex phases.

Read [the proof and exact assembly](odd-taylor/UNIVERSAL_ODD_AB_REGION.md),
especially §6 for the sharp constant.

## Why the singular zero locus does not invalidate this region

The proof uses a finite-amplitude convexity inequality. For
`R_x(h)=|x+h|−|x|−Re(conj(ph(x))h)` and one deterministic 0<θ<1,

\[
D(x+h,o)\le(1-\theta)D(x,o/(1-\theta))
+2\theta R_x(h/\theta)-2R_x(h).
\]

Set

\[
q'=q+\frac7{50}r_A+\frac{15159}{50000}r_B,
\qquad h=(T-27/50)r_A+Z^2\overline{r_B}/\sqrt2.
\]

Then X=L+q′+h exactly. The reviewed odd theorem applies to the arbitrary
remote q′. The new certified potential theorem is

\[
E_Z\frac{|(T-27/50)A+Z^2\bar B/\sqrt2|^2}{|L+w|}
\le\frac{11}{10}(|A|^2+|B|^2)
\]

for every complex w,A,B. Every denominator remains at the unperturbed
remote base; no Hessian of X is asserted to be finite. Optimization in
the single global θ proves (1). Sample-dependent θ would not preserve
the compensator cancellation and is not used.

Read [the potential theorem](odd-perturb/RECENTERED_EVEN_POTENTIAL.md).
An entirely rational, weaker 7/4 potential proof is retained as an
independent fallback in the universal A note.

## A genuine shared-cubic family near u*

The package also proves a stronger signed cost for an explicit family.
For independent standard complex Gaussian blocks Y,U and X, define

\[
q_m=\frac{\sqrt u}{m}\left[
X_0\sum_iY_i\overline{U_i}
+\sum_{i<j}\overline{X_{ij}}(Y_iU_j-Y_jU_i)\right].
\]

This is exactly H₂,₁, without a Gaussian-limit approximation. Its
conditional Gaussian variance is `u||Y||²||U||²/m²`.
The lower-chaos fields may share both Y and U and additional independent
Gaussian coordinates arbitrarily; they must not use the X-block.

For m=16, the core has 153 complex coordinates and normalized fourth
excess 33/128. The explicit region

\[
\boxed{u\ge1/25,\quad V\le1/105000
\quad\Longrightarrow\quad E D(X,O)-pW\le-W/100}
\]

holds at every odd amplitude. In particular it covers u∈[0.040,0.041]
and V≤9.5238095238…×10⁻⁶, intersected with the task's caps.
Here the remote deficit is nonnegative by Gaussian-mixture Jensen, so A
holds with c=0 without spending its 5×10⁻⁵ allowance.

Read [the genuine-family theorem, §8](gaussian-core/GENUINE_SHARED_ODD_REGION.md)
and [the weighted polynomial lemma](gaussian-core/WEIGHTED_POLYNOMIAL_LEMMA.md).
The auxiliary [Gaussian-reference proof](gaussian-core/FIXED_TRIAL_GAUSSIAN_ODD_REGION.md)
is included as a dependency; its Gaussian core is not substituted for a
general shared cubic.

## B: a universal positive-part region

Without assuming (P), the centred joint form obeys

\[
E(F_{\rm joint})_+
\le\frac{2571412396301873}{18910000000000}\,V.
\]

Therefore B holds for

\[
V\le\frac{945500000}{2571412396301873}
\approx3.67696757377\times10^{-7}.
\]

This bounds the positive part on the whole remote space and hence on the
task's compact event. If ν=0, the cutoff improves to approximately
1.37498197872×10⁻⁶, with the exact fraction in the proof. Read
[the positive-part estimate](joint/POSITIVE_PART_REGION.md).

## Proof status and replay

Labels below distinguish analytic arguments from finite computation.
The review notes are independent internal mathematical reviews, not an
external peer review or kernel formalization.

| Step | Status | Verification |
|---|---|---|
| Reviewed 32/25 remote-core theorem | P+C, inherited | Pinned PR447 theorem; bundled provenance and matrix receipts |
| Fixed-X identities and finite convex interpolation | P | Independently re-derived |
| Uniform 11/10 potential | P+C | Fresh directed-rounding C++ replay: 600 shift intervals, 1,885,070 source cells, analytic tails |
| Universal A cutoffs and retained-c credit | P+C | Exact BigInt rational checks |
| Global Rice envelope | P+C | 2,000 Arb cells and analytic Riccati tail |
| Genuine core, weighted harmonic blocks, shared-field parity | P | Independently re-derived |
| Genuine-family identities and constants | C | Exact symbolic/rational checks |
| B positive-part consumer | P+C | Exact assembly from pinned reviewed matrix intervals; inherited source quadrature is not rerun here |
| Counterexample searches | N only | No result from those searches is used in any theorem |

The independent potential replay took 99.45 seconds with GCC 14.2.0.
Install Node.js 20+, Python with `python-flint`, and g++ with C++17 support.
From this extracted directory run:

```sh
# codex-c7e2-round3: fresh complete replay
node replay.mjs
```

This compiles the C++ source afresh, regenerates the complete potential
cover and tail checks, replays all new scalar and Rice certificates, and
checks rejection of unsafe compiler flags, Python assertion removal,
a missing inherited matrix cell, and an excessive matrix bound. Receipts
and logs are written to `replay-results/`. No network is needed.

The small `upstream/` directory contains verbatim pinned dependencies and
their SHA-256 provenance. To use a clean checkout instead:

```sh
# codex-c7e2-round3: use the pinned checkout's inherited inputs
node replay.mjs --repo /absolute/path/to/grothendieck-lean
```

The runner checks those inputs against the pinned hashes. `--quick`
skips the fresh compact potential computation and explicitly reports
that limitation. It is not a substitute for the full replay.

Independent audits are in [the odd-estimate review](review/ODD_CONVEX_SPLIT_REVIEW.md)
and [the genuine-family review](review/GENUINE_CORE_REVIEW.md).

## What is not covered

The unrestricted hard regime near u* with V of order 0.01 remains open.
The universal method loses information when it drops −2R_x(h) and replaces
the even potential by an energy bound; its optimized worst-W cost is
`(34375/994)V`. The theorem does not turn that loss into a global closure.
The genuine-family result has an explicit restriction on which coordinates
the lower fields may use. Neither result proves (P), the full odd premise,
full K, or a new lower endpoint.

[Search notes](odd-search/REPORT.md) record unsuccessful attempts to falsify
the odd premise, including shared quadratic zero loci and rejected coarse
grid positives. Their integration is numerical, not certified, and is
separate from the proved regions.
