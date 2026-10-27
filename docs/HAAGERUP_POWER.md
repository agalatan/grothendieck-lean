# Hypothesis-free upper bound from a canonical resolvent completion

`Grothe.haagerup_bound` proves **K_G^ℂ ≤ 1.404909132792** for
every finite complex matrix, with no Gaussian, integration, or numerical-tail
hypotheses. The order-10 alternating completion passed
[delivery CI](https://github.com/agalatan/grothendieck-lean/actions/runs/40432615845) for #133.
The focused policy requires 96 results with zero native evaluation axioms.
The sharper conditional upper bound and lower endpoint are separate.

The Gaussian phase identity, tensor realization, complete finite residual,
infinite remainder estimate, checker soundness and matrix transfer are expressed in Lean.
Large convolutions are proved in continuation blocks of at most five left
coefficients. The generic `convI_append` identity preserves the original
outward arithmetic order; recurrence and exact input-binding lemmas recover
the four checker statements without a new numerical premise.
External replay results are not hypotheses of the theorem.

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

The preprocessor p(t) = t P(t²) has degree 41; P has degree 20, coefficient
norm at most one, and constant coefficient
1044868466934074687/1152921504606846976. The resolvent R has degree 64 and is
stored as its 65 coefficients, without trailing zero padding.

`tools/gen_haagerup_certificate.py` computes the inverse series of t H(t²),
where H(X) = Σ r_k X^k, over exact rational numbers. It directly checks the
truncated composition identity. On the 60-bit dyadic grid it chooses the largest
a with Σ |c_j| a^(2j+1) ≤ 1, then rounds the coefficients c_j a^(2j+1) toward
zero. This produces P with ‖P‖₁ ≤ 1. The coefficients of 1/(1−XP²) through
degree 64 are computed by an exact recurrence and rounded to the nearest
60-bit dyadic, with ties to even. The tracked `recipe.json` fixes every choice;
the generator is not trusted by the Lean proof.

The exact parameters and kernel-checked finite caps are:

- K = 64 series terms and m = 10 correction terms;
- checked coefficient prefix n < 165, with cap 368411/(5·10¹⁵);
- weighted finite-polynomial tail from n = 165, with cap 10⁻¹⁶;
- η = 10⁻¹² for the inverse defect;
- ‖R P^17‖₁ ≤ 249/500, giving B = 1/2 using ‖P‖₁ ≤ 1;
- ‖R−1‖₁ + η ≤ 2, giving C = 2;
- completed finite residual ≤ 736823/10¹⁶;
- infinite remainder ≤ 10169/10¹⁶.

The remainder budget retains the actual finite differences:

[2^10 Δ^10 r_64 + 10⁻¹² Σ_(j<10) 2^j Δ^j r_64] / (1−10⁻¹²)
≤ 10169/10¹⁶.

This rational inequality is checked in Lean's kernel. It avoids replacing every
difference by the much larger zeroth difference. Complete monotonicity supplies
the nonnegativity and vanishing tails needed by the analytic remainder theorem.

The completed finite residual polynomial is

F = P Σ_(k<64) r_k (XP²)^k + Q_10 − P(0).

The finite check requires an outward interval enclosure of its first 165 coefficients.
To control every remaining coefficient, use the weighted norm of F(ρX). For
any real polynomial F and ρ ≥ 1, scaling multiplies coefficient n by ρⁿ, so

‖F‖₁ ≤ Σ_(n<N) |F_n| + ‖F(ρX)‖₁/ρ^N.

At ρ = 3/2, the exact rational data give ‖P(ρX)‖₁ ≤ 21/20 and
‖R(ρX)‖₁ ≤ 9. Hence ‖ρX P(ρX)²‖₁ ≤ 5/3 and the scaled correction ratio
has norm at most 15. Retaining each nonnegative coefficient in the Horner norm
estimate gives

‖F((3/2)X)‖₁
≤ (21/20)·Σ_(k<64) r_k (5/3)^k
  + 9·(21/20)·(5/3)^64·Σ_(j<10) (Δ^j r_64) 15^j + 1
≤ 10¹³.

The omitted finite-polynomial coefficients therefore contribute at most
10¹³/(3/2)^165 < 10⁻¹⁶. Adding the checked prefix cap gives

‖F‖₁ ≤ 368411/(5·10¹⁵) + 10⁻¹⁶ = 736823/10¹⁶.

This is a finite polynomial coefficient argument; no analytic continuation
or infinite-series norm outside the unit disk is assumed. Both the weighted
finite-tail budget and the combined infinite-remainder budget are exact
rational conjuncts of `coefficient_check`.

The total normalized residual cap is 746992/10¹⁶. Residual transfer and the
proved lower enclosure for π give

K_G^ℂ ≤ 4/[π(P(0) − 746992/10¹⁶)] < 1.404909132792.

The exact recipe lives in `data/haagerup-resolvent/recipe.json`;
`tools/gen_haagerup_certificate.py` reproduces `certificate.json` from it.
`tools/gen_haagerup_power.py` reproduces `Grothe/Haagerup/PowerData.lean` byte for byte.
The canonical completion parameters and differences are defined in
`Grothe/Haagerup/CanonicalData.lean`. Recipe generation uses no floating-point
arithmetic; generation and independent replay remain separate from Lean acceptance.
`PowerData.lean` contains only the six definitions `pl`, `rl`, `seedPower`,
`seedCap`, `defectCap`, and `slope`. The data module has no numerical theorem;
all four acceptance proofs come from the canonical trace.

## Sources and replay

- `Grothe/Upper/FiniteDifference.lean`: all-order finite differences and complete monotonicity.
- `Grothe/Haagerup/CompleteMonotone.lean`: the rising-factorial quotient proof for the Haagerup coefficients.
- `Grothe/Upper/ResolventTail.lean`: the finite inverse certificate, Abel estimate and coefficient locality.
- `Grothe/Upper/ResolventCompletion.lean`: the all-order completion identity and infinite remainder estimate.
- `Grothe/Upper/ResolventCertificate.lean`: soundness of the checked finite coefficient prefix.
- `Grothe/Upper/WeightedTail.lean`: the coefficient-tail bound from a scaled polynomial norm.
- `Grothe/Haagerup/CanonicalArithmetic.lean`: outward integer computation of the finite head and correction, retaining the `GrotheKernel` namespace.
- `Grothe/Haagerup/CanonicalTrace/`: kernel-proved literal arithmetic, five-coefficient continuation blocks, the generic append identity, and exact recurrence and input bindings.
- `Grothe/Haagerup/CanonicalCheck.lean`: the four public check statements, assembled from the kernel proofs.
- `Grothe/Haagerup/CanonicalProof.lean`: complete composition and matrix transfer from those checks.
- `Grothe/Haagerup/Power.lean`: the public matrix theorem.
- `docs/research/haagerup-power.tex`: full written proof.
- `tools/gen_haagerup_certificate.py`: exact inverse-series and dyadic certificate generation.
- `tools/gen_haagerup_canonical_check.py`: exact generation and byte-for-byte checking of the trace modules.
- `tools/verify_haagerup_canonical.py`: independent rational and directed-ball replay, with hashes of the trace sources and generator.

From the repository root, check the generated trace without changing files:

```sh
python3 -I tools/gen_haagerup_certificate.py --check
python3 -I tools/gen_haagerup_power.py --check
python3 -I tools/gen_haagerup_canonical_check.py --check
```

The generator uses exact integers and fractions from the tracked certificate and
`CanonicalData.lean`. Each emitted equality still requires a Lean proof; a
successful generation check is not proof acceptance. The recurrence and binding
lemmas connect the literal results to the original checker definitions.

The generated trace separates shared literal data from 16 independent numerical
proof modules. Each imports only `Shared`; `Assembly` then combines their
equalities, followed by `Bindings` and `Checks`. This lets Lake schedule the
finite kernel checks concurrently without changing their statements or arithmetic.

Run the independent replay with Python and `python-flint`:

```sh
python3 -I tools/verify_haagerup_canonical.py --out handoff/haagerup-canonical-replay.json
```

The independent replay evaluates the complete finite polynomial as well as
the checked prefix, weighted finite-tail budget, seed, inverse defect, exact
coefficient differences, infinite remainder budget, and final endpoint.

The focused axiom audit permits only `propext`, `Classical.choice`, and
`Quot.sound` for all 96 selected results in the canonical route:

```sh
lake env lean scratch/AxiomsPower.lean | python3 scripts/check_axioms.py --haagerup-power
```

Run this from the worktree root. The policy requires all 96 results with zero
native axioms. The regenerated alternating completion passed
[delivery CI](https://github.com/agalatan/grothendieck-lean/actions/runs/40432615845) under #133.
The [acceptance receipt](verification/haagerup-alternating-20261027/acceptance/README.md)
records the successful full delivery check. The
[candidate and repair receipts](verification/haagerup-alternating-20261027/README.md)
preserve the checks recorded before acceptance. Earlier verification receipts
remain immutable evidence for their own pinned source snapshots. Normal
`ready/*` delivery CI builds and audits the combined tree before merging it.
The canonical upper-bound construction does not change the lower cap computations.
