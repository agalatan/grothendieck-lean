# Hypothesis-free upper bound from a signed resolvent

`Grothe.haagerup_bound` proves **K_G^ℂ ≤ 1.404909543** for every finite complex
matrix, with no Gaussian, integration, or numerical-tail hypotheses.
The sharper conditional upper bound and lower endpoint are separate.

The Gaussian phase identity, tensor realization, complete finite residual,
infinite signed-tail estimate, checker soundness and matrix transfer are
all in Lean. One pinned `native_decide` fact accepts five finite checks by
outward integer arithmetic. External replay results are not hypotheses of
the theorem.

## Why the tail is smaller

Put A = X P² and T = X^K P^(2K+1). Find a rational polynomial R satisfying

- ‖1 − R(1 − A)‖₁ ≤ η < 1;
- ‖R T‖₁ ≤ B.

The finite identity S = (1 − R(1 − A))S + R(1 − A)S implies
(1 − η)‖S‖₁ ≤ ‖R(1 − A)S‖₁. Applying it to the geometric prefix gives

‖Σ_(i<n) T A^i‖₁ ≤ 2B/(1 − η).

Finite Abel summation prices a decreasing nonnegative coefficient sequence
by its initial coefficient times this uniform bound. The Haagerup sequence
r_k decreases, so the entire signed suffix costs at most 2 r_K B/(1 − η).
Every coefficient only sees finitely many terms because the kth term has a
factor X^k. Lean uses this locality to pass the finite estimate to the full
absolute coefficient sum. It does not assume convergence of an infinite
inverse or exchange two infinite sums.

The combined product R P^17 is certified before taking absolute values.
Together with ‖P⁴‖₁ ≤ q, it gives

B ≤ ‖R P^17‖₁ q^floor((2K+1−17)/4).

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
- infinite normalized residual ≤ 174/10⁹.

The complete signed-tail allowance is
2 b γ q^508 / ((1025)(2049)(1 − η)), which is below 174/10⁹.
Residual transfer and the proved lower enclosure for π give the endpoint.

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

The focused axiom audit covers every public result in this route and permits
only `propext`, `Classical.choice`, `Quot.sound` and the certificate's one
native fact `Grothe.HaagerupPower.check._native.native_decide.ax_1_1`:

```sh
lake env lean scratch/AxiomsPower.lean | python3 scripts/check_axioms.py --haagerup-power
```

Run this from the worktree root. The normal CI audit includes the same
results. Current replay, equivalence evidence and their source manifest are in
`docs/verification/haagerup-trim-20261026/`; full Lean build status is tracked
by delivery CI and issue #54.
The lower node-cap import closure is unchanged.
