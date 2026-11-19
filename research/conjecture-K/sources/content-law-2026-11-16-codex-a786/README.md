<!-- Verbatim from the delivery conjecture_k_content_law_codex_a786.zip (README.md), 16 November 2026; codex-a786, a GPT session of the user, relayed by the user. Only this line was added. -->
# Content-law inequality: a proved structured class

**codex-a786 · 16 November 2026**

**Result: P, partial.** The requested inequality is proved for a nonzero-content
class of genuine cubics in arbitrarily large dimension, including arbitrary
finite decoupled bulk. It is not proved for all H_{2,1}.

Let X,Y,U,Z be independent standard complex Gaussian blocks, and put
\[
 P_m(Y)=m^{-1/2}\sum_{j=1}^m(|Y_j|^2-1).
\]
For every admissible real radial profile, in particular **both requested profiles
on all six rows, at every energy u>0**, the following hold.

| Cubic | Proven constant θ in ‖c[h]‖²≤θ δ Ω̂[h] | Status |
|---|---|---|
| q=√u X P_m | 77/[9(m+3)] | **P1** |
| q=√u(√ρ X P_m+√(1−ρ)W), 0≤ρ≤1; W=Σ conjugate(Z_j)F_j(U), F_j holomorphic quadratics, E‖W‖²=1 | 253/[18(m+3)]+2/(9m); explicit improvements at m=1 and m=8 | **P2** |
| q=√u XP, P any normalized Hermitian quadratic form | Explicit conditional-phase criterion (PROOFS §1, (7)) | **P3** |

The bulk can have any finite dimension and any coefficient tensors of the
displayed form. In particular W_N=(2N)^{-1/2}ΣU_j²conjugate(Z_j) has χ=10/N,
so P2 includes finite diffuse-bulk approximations. It is not a Gaussian
variable incorrectly counted as first chaos.

For P1, χ=4+12/m: the theorem covers moderate kurtosis, not only a
small-cumulant neighborhood. For P2,
χ=ρ²(4+12/m)+2(1−ρ)²Var(Σ|F_j(U)|²).

**Concrete constants (P; rational comparisons C):**

- P1: m≥4 gives θ≤11/9<1.3; m≥21 gives θ≤77/216<0.37.
- P2: m≥8 gives θ≤11009947/8553600<1.3; m≥36 gives θ≤386/1053<0.37.
- The per-row rank thresholds are in PROOFS §7. These compare with the user's
  quoted room targets; they do not certify those externally numerical targets.

The new ingredient is conditioning on the **sign of P_m at fixed |P_m| before
Cauchy–Schwarz**. Its squared conditional sign bias is at most 2/(3m), proved
from an exactly evaluated Gamma/reflected-Gamma Hellinger affinity. This retains
a cancellation lost by ledger 6.3.25. The subtraction in Ω̂ is retained using
the exact inverse of I−Π_const/2.

The right side uses **the original Ω̂ of the same law**. It needs no replacement
functional or extra variables in the convex law program. Constants are
independent of the profile only because the cubic class is restricted;
they are not universal constants for arbitrary cubics.

## Files and replay

- **PROOFS.md:** all statements, proofs, admissibility of the actual six profiles,
  exact row comparisons, and limitations.
- **verify.mjs:** dependency-free Node.js >=20 exact rational checker.
- **results_exact.json:** checked output, including 246 polynomial instances.
- **rows.json:** the user's row decimals as exact strings.
- **LEDGER_PATCH.md:** three proposed K-ledger additions and a degree-5 annotation.
- **SCALAR_REDUCTION.md:** the residual scalar tests for low-rank pure factors;
  their certification is explicitly open.
- **AUDIT.md:** normalization and scope checks.
- **SOURCES.md:** pinned repository inputs and external identity references.
- **SHA256SUMS:** deliverable file hashes.

From this folder run:

    node verify.mjs

Expected output: PASS; 246 polynomial instances; six exact row comparisons.
Runtime here: under one second. No packages, network, repository checkout,
Lean installation, floating-point tolerances, or interval libraries are needed.

**C** verifies normalization, moment identities, conditional-regression identities,
rational constants, and polynomial instances. The all-profile/all-rank assertions
are the **written proofs P**, not consequences of finitely many tests.
The requested control ratio 1024/252 is reproduced exactly.

## What remains open

Arbitrary coupled cubic tensors and driver self-interaction remain outside the
proof. No full row, Conjecture K, or stronger Grothendieck bound is claimed.
The six numerical “room” constants are inputs from the question, not newly
certified outputs. Nothing in the repository was changed.

A useful next target is the unequal-spectrum Hermitian criterion P3, or a
replacement for its conditional phase estimate at a general content direction.
Even within P1, scalar verification for 34 low-rank row pairs remains open if
one wants the quoted row targets for every rank; see SCALAR_REDUCTION.md.

