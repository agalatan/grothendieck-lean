# Hypothesis-free upper bound from a canonical resolvent completion

The canonical candidate targets **K_G^ℂ ≤ 1.404909140** for every finite complex
matrix, with no Gaussian, integration, or numerical-tail hypotheses.
**Finite-check verification and the final axiom audit are pending.**
The sharper conditional upper bound and lower endpoint are separate.

The Gaussian phase identity, tensor realization, complete finite residual,
infinite remainder estimate, checker soundness and matrix transfer are all
in Lean. The finite-check implementation assembles literal arithmetic steps through
the defining recurrences and exact input-binding lemmas; those arithmetic proofs
must be accepted by the kernel before the endpoint is verified. External replay
results do not replace that acceptance or become hypotheses of the theorem.

## Complete monotonicity and the resolvent expansion

Write Δa_k = a_k − a_(k+1). A sequence is completely monotone when
Δ^j a_k ≥ 0 for every j and k. In particular, every difference sequence is
nonnegative and decreasing. If a_k tends to zero, so do all its differences,
since 0 ≤ Δ^j a_k ≤ a_k.

The normalized Haagerup coefficients satisfy

r_0 = 1, r_(k+1) = r_k (2k+1)² / (4(k+1)(k+2)).

Lean proves their complete monotonicity structurally. For the rising-factorial
quotient u(α,β)_k = (α)_k/(β)_k, with 0 ≤ α ≤ β and β > 0,

Δu(α,β) = ((β−α)/β) u(α,β+1).

Repeated differences therefore remain nonnegative. The discrete product rule
Δ(uv)_k = (Δu_k)v_k + u_(k+1)Δv_k preserves complete monotonicity, and
r_k = u(1/2,1)_k u(1/2,2)_k. Summability gives r_k → 0.

Put A = X P², T = X^K P^(2K+1), and E = 1 − R(1 − A). Suppose

- ‖P‖₁ ≤ 1;
- ‖E‖₁ ≤ η < 1;
- ‖RT‖₁ ≤ B;
- ‖RA‖₁ ≤ C.

The geometric-prefix identity (1−A) Σ_(i<n) T A^i = T−T A^n gives
‖Σ_(i<n) T A^i‖₁ ≤ 2B/(1−η). Finite Abel summation then bounds a sum
with decreasing nonnegative weights by its initial weight times this constant.

Let a be completely monotone, with a_k → 0. For
W_n(a) = Σ_(i<n) a_(K+i) T A^i, one summation by parts gives the exact
recurrence

W_n(a) = a_K RT − RA W_n(Δa) + E W_n(a) − a_(K+n) RT A^n.

Iterating this recurrence defines the canonical completion

Q_m = Σ_(j<m) (Δ^j a)_K (−RA)^j RT.

The remaining terms are (−RA)^m W_n(Δ^m a), an inverse-defect contribution
E Σ_(j<m) (−RA)^j W_n(Δ^j a), and the boundary
−Σ_(j<m) (Δ^j a)_(K+n) (−RA)^j RT A^n.

Every fixed coefficient prefix of the composed series sees only finitely
many terms because the kth term contains X^k. Hold that prefix fixed and
let n grow: all boundary weights vanish. Abel summation at each difference
order yields the complete coefficient-norm estimate

‖Σ_(k≥K) a_k X^k P^(2k+1) − Q_m‖₁
≤ 2B/(1−η) · [C^m (Δ^m a)_K + η Σ_(j<m) C^j (Δ^j a)_K].

This holds at every order m. It uses finite polynomial identities and
coefficient locality; it does not require an infinite polynomial inverse.
The finite head and Q_m are added before taking absolute values, preserving
the cancellation between them.

## Complete certificate

The preprocessor p(t) = t P(t²) has degree 29; P has degree 14, coefficient
norm exactly one, and constant coefficient
1020379367568975/1125899906842624. The resolvent R has degree 64 and is
stored as its 65 coefficients, without trailing zero padding.

The exact parameters and finite-check targets are:

- K = 64 series terms and m = 6 correction terms;
- checked coefficient prefix n < 170, with cap 9136/10¹² = 9.136·10⁻⁹;
- weighted finite-polynomial tail from n = 170, with cap 4/10¹²;
- η = 10⁻¹² for the inverse defect;
- ‖R P^17‖₁ ≤ 249/500, giving B = 1/2 using ‖P‖₁ ≤ 1;
- ‖R−1‖₁ + η ≤ 2, giving C = 2;
- r_64 ≤ 1/10⁴ and Δ^6 r_64 ≤ 37/10¹³;
- completed finite residual ≤ 914/10¹¹ = 9.14·10⁻⁹;
- infinite remainder ≤ 24/10¹¹ = 0.24·10⁻⁹.

Complete monotonicity bounds every Δ^j r_64 by r_64. Since
Σ_(j<6) 2^j = 63, the general remainder estimate is bounded by

[64·(37/10¹³) + 10⁻¹²·(63/10⁴)] / (1−10⁻¹²) < 24/10¹¹.

The completed finite residual polynomial is

F = P Σ_(k<64) r_k (XP²)^k + Q_6 − P(0).

The finite check requires an outward interval enclosure of its first 170 coefficients. To
control every remaining coefficient, use the weighted norm of F(ρX). For
any real polynomial F and ρ ≥ 1, scaling multiplies coefficient n by ρⁿ, so

‖F‖₁ ≤ Σ_(n<N) |F_n| + ‖F(ρX)‖₁/ρ^N.

At ρ = 3/2, the exact rational data give ‖P(ρX)‖₁ ≤ 21/20 and
‖R(ρX)‖₁ ≤ 9. Hence ‖ρX P(ρX)²‖₁ ≤ 5/3 and the scaled correction ratio
has norm at most 15. Complete monotonicity gives r_k ≤ 1 and
Δ^j r_64 ≤ 1/10⁴. Submultiplicativity and the finite geometric sums yield

‖F((3/2)X)‖₁
≤ (21/20)·64·(5/3)^63
  + 9·(21/20)·(5/3)^64·(1/10⁴)·Σ_(j<6) 15^j + 1
≤ 10¹⁸.

The omitted finite-polynomial coefficients therefore contribute at most
10¹⁸/(3/2)^170 < 4/10¹². Adding the checked prefix cap gives

‖F‖₁ ≤ (9136+4)/10¹² = 914/10¹¹.

This is a finite polynomial coefficient argument; no analytic continuation
or infinite-series norm outside the unit disk is assumed.

Once the finite checks are accepted, the total normalized residual is at most
938/10¹¹ = 9.38·10⁻⁹. Residual transfer and the proved lower enclosure for π give

K_G^ℂ ≤ 4/[π(P(0) − 938/10¹¹)] < 1.404909140.

The rational polynomial inputs live in
`data/haagerup-resolvent/certificate.json`.
`tools/gen_haagerup_power.py` reproduces
`Grothe/Haagerup/PowerCheck.lean` byte for byte. The canonical completion
parameters and differences are defined in `Grothe/Haagerup/CanonicalData.lean`.
Floating searches propose data and play no role in acceptance. The existing
native fact in `PowerCheck.lean` is unchanged and is not a dependency of the
candidate proof.

## Sources and replay

- `Grothe/Upper/FiniteDifference.lean`: all-order finite differences and complete monotonicity.
- `Grothe/Haagerup/CompleteMonotone.lean`: the rising-factorial quotient proof for the Haagerup coefficients.
- `Grothe/Upper/ResolventTail.lean`: the finite inverse certificate, Abel estimate and coefficient locality.
- `Grothe/Upper/ResolventCompletion.lean`: the all-order completion identity and infinite remainder estimate.
- `Grothe/Upper/ResolventCertificate.lean`: soundness of the checked finite coefficient prefix.
- `Grothe/Upper/WeightedTail.lean`: the coefficient-tail bound from a scaled polynomial norm.
- `Grothe/Haagerup/CanonicalArithmetic.lean`: outward integer computation of the finite head and correction.
- `Grothe/Haagerup/CanonicalTrace/`: generated literal arithmetic steps and their recurrence and input bindings; kernel acceptance is pending.
- `Grothe/Haagerup/CanonicalCheck.lean`: the four public check statements whose kernel proofs must be completed.
- `Grothe/Haagerup/CanonicalProof.lean`: complete composition and matrix transfer from those checks.
- `Grothe/Haagerup/Power.lean`: the public matrix theorem.
- `docs/research/haagerup-power.tex`: full written proof.
- `tools/gen_haagerup_canonical_check.py`: exact generation and byte-for-byte checking of the trace modules.
- `tools/verify_haagerup_canonical.py`: independent rational and directed-ball replay, with hashes of the trace sources and generator.

From the repository root, check the generated trace without changing files:

```sh
python3 -I tools/gen_haagerup_canonical_check.py --check
```

The generator uses exact integers and fractions from the tracked certificate and
`CanonicalData.lean`. Each emitted equality still requires a Lean proof; a
successful generation check is not proof acceptance. The recurrence and binding
lemmas connect the literal results to the original checker definitions.

Run the independent replay with Python and `python-flint`:

```sh
python3 -I tools/verify_haagerup_canonical.py --out handoff/haagerup-canonical-replay.json
```

The independent replay evaluates the complete finite polynomial as well as
the checked prefix, weighted finite-tail budget, seed, inverse defect, exact
coefficient differences, infinite remainder budget, and final endpoint.

The focused axiom audit permits only `propext`, `Classical.choice`, and
`Quot.sound` for the canonical route:

```sh
lake env lean scratch/AxiomsPower.lean | python3 scripts/check_axioms.py --haagerup-power
```

Run this from the worktree root. The normal CI audit includes the same
results. Verification records are collected under
`docs/verification/haagerup-canonical-20261026/`; their presence alone does not
establish acceptance of the current finite checks. Validation is tracked in issue #113.
The canonical upper-bound construction does not change the lower cap computations.
