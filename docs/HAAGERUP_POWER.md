# Hypothesis-free upper bound from a signed resolvent

`Grothe.haagerup_bound` proves **K_G^ℂ ≤ 1.404909409** for every finite complex
matrix, with no Gaussian, integration, or numerical-tail hypotheses.
The sharper conditional upper bound and lower endpoint are separate.

The Gaussian phase identity, tensor realization, complete finite residual,
infinite signed-tail estimate, checker soundness and matrix transfer are
all in Lean. One pinned `native_decide` fact accepts five finite checks by
outward integer arithmetic. External replay results are not hypotheses of
the theorem.

## Why the tail is smaller

Assume ‖P‖₁ ≤ 1, and put A = X P² and T = X^K P^(2K+1).
Find a rational polynomial R satisfying

- ‖1 − R(1 − A)‖₁ ≤ η < 1;
- ‖R T‖₁ ≤ B.

The finite identity S = (1 − R(1 − A))S + R(1 − A)S implies
(1 − η)‖S‖₁ ≤ ‖R(1 − A)S‖₁. Applying it to the geometric prefix gives

‖Σ_(i<n) T A^i‖₁ ≤ 2B/(1 − η).

Finite Abel summation bounds decreasing nonnegative weights by their initial
weight times this uniform prefix estimate. The Haagerup coefficients have
more structure: their differences Δr_k = r_k − r_(k+1) are also nonnegative
and decreasing, and r_k tends to zero. Writing S_n(a) = Σ_(i<n) a_(K+i) T A^i,
the exact second summation-by-parts identity is

(1 − A) S_n(r) = r_K T − A S_n(Δr) − r_(K+n) T A^n.

If ‖R A‖₁ ≤ C, applying the first Abel estimate to the differences gives

‖S_n(r)‖₁ ≤ B/(1 − η) · [r_K + r_(K+n) + 2C Δr_K/(1 − η)].

Every fixed coefficient prefix sees only finitely many terms because the
kth term contains X^k. Hold that prefix fixed and let n grow: the boundary
term r_(K+n) vanishes. Thus the complete signed suffix costs at most

r_K B/(1 − η) · [1 + 2C (Δr_K/r_K)/(1 − η)].

Lean proves coefficient convexity directly from the rational recurrence:
Δr_k/r_k = (2k + 7/4)/((k+1)(k+2)). Both factors in Δr_k decrease.
No infinite polynomial inverse or exchange of two infinite sums is needed.

The combined product R P^17 is certified before taking absolute values.
Together with ‖P⁴‖₁ ≤ q, it gives the choice

B = b q^floor((2K+1−17)/4), where b bounds ‖R P^17‖₁.

This preserves cancellation both between consecutive powers and inside the
short combined product. The theorem applies to any real polynomials with
the stated finite norm certificates.

## Complete certificate

The preprocessor p(t) = t P(t²) has degree 29; P has degree 14, coefficient
norm exactly one, and constant coefficient
1020379367568975/1125899906842624. The resolvent R has degree 64 and is
stored as its 65 coefficients, without trailing zero padding.

The exact budgets are:

- K = 1,024 series terms; radial cutoff 29,696 includes every coefficient;
- q = 998903/10⁶ for the fourth power;
- η = 10⁻¹² for the inverse defect;
- b = 249/500 for ‖R P^17‖₁;
- γ = 637/1000 for r_K(K+1)(2K+1);
- finite normalized residual ≤ 95/10⁹;
- native Abel budget ≤ 174/10⁹;
- refined infinite normalized residual ≤ 877/10¹⁰ = 87.7/10⁹.

The native budget bounds 2 b γ q^508 / ((1025)(2049)(1 − η)).
The exact resolvent list gives ‖R−1‖₁ + η ≤ 2, hence ‖RA‖₁ ≤ 2.
At K = 1024 the difference ratio is 8199/4206600, so the refined allowance is
at most the native budget times

1/2 + 2·(8199/4206600)/(1 − η).

This is below 87.7/10⁹. Residual transfer with the total cap 182.7/10⁹ and
the proved lower enclosure for π gives the public endpoint.

Canonical inputs live in
`data/haagerup-resolvent/certificate.json`.
The generator
`tools/gen_haagerup_power.py`
reproduces
`Grothe/Haagerup/PowerCheck.lean`
byte for byte. Floating searches propose data and play no role in acceptance.

## Sources and replay

- `Grothe/Upper/ResolventTail.lean`: finite inverse certificate, Abel summation, coefficient locality, short seed and checker soundness.
- `GrotheKernel/ResolventTail.lean`: finite outward computations at the existing 128-bit scale.
- `Grothe/Haagerup/Convex.lean`: decreasing coefficient differences and their vanishing boundary.
- `Grothe/Haagerup/Power.lean`: complete composition and public matrix theorem.
- `docs/research/haagerup-power.tex`: full written proof.
- `tools/verify_haagerup_power.py`: independent rational and directed-ball replay.

From the repository root, with Python and `python-flint`:

```sh
python3 -I tools/verify_haagerup_power.py data/haagerup-resolvent/certificate.json --out handoff/haagerup-resolvent-replay.json
```

The replay checks byte-identical generated data, complete finite head and
seed polynomials, exact rational inverse defect and fourth power, directed
infinite-tail arithmetic, and the final endpoint. It checks all coefficients,
not a sample.

The focused axiom audit covers 55 selected results in this route and permits
only `propext`, `Classical.choice`, `Quot.sound` and the certificate's one
native fact `Grothe.HaagerupPower.check._native.native_decide.ax_1_1`:

```sh
lake env lean scratch/AxiomsPower.lean | python3 scripts/check_axioms.py --haagerup-power
```

Run this from the worktree root. The normal CI audit includes the same
results. The second-Abel replay and source manifest are in
`docs/verification/haagerup-convex-20261026/`. The underlying certificate and
its native fact are unchanged.
The lower node-cap import closure is unchanged.
