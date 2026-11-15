<!-- New audit note, authored at this repository path on 2026-11-15. Agent-ID: codex-a7c4. -->
# Zero-core odd sectors and the one-coordinate case

Agent-ID: codex-a7c4. Refs #395. **P, by its author, not reviewed** for the
proofs below; exact scalar enclosures are produced by
[`odd_cost_check.py`](../../code/audit-2026-11-15-codex-a7c4/odd_cost_check.py).
This independently re-derives STATUS 5.4 and 2.6, formerly R. The whole-profile
one-coordinate cost in §2 is a further conclusion; the one-coordinate optimum
and three-row odd costs themselves are already in the October/November record.
Nothing here controls odd sectors over a nonzero core or changes a Grothendieck bound.

## 1. An explicit all-amplitude bound, in every dimension

Let Z be standard complex Gaussian, T=|Z|², and
L=Z(a+bT), with a=ell−2b>0, b>0 and p=1/epsilon. Let

    O = Z Q + conjugate(Z) P + d Z(T−2),

where Q and P depend only on variables independent of Z, are square integrable,
and E Q=0. Cubic sectors Q in H_{1,1} and P in H_{2,0} satisfy these hypotheses.
No independence between Q and P and no dimension bound is required. Put
v=E|Q|²+E|P|² and h=2|d|². Angular averaging in Z and E Q=0 give

    E[|O|² | T] = T v + |d|² T(T−2)²,   ||O||² = v+h.

For complex x,y with x nonzero,

    |x+y|+|x−y| <= 2 sqrt(|x|²+|y|²) <= 2|x|+|y|²/|x|.

The zero of L has probability zero. The displayed expectation of the final
term is finite because its factors are polynomial times sqrt(T)/(a+bT).
Consequently, for every amplitude,

    Lambda(O) <= Lambda(0) − k1 v − k3 h,
    k1 = p − J1,
    k3 = p − (J3−4J2+4J1)/2,
    Jn = integral_0^infinity t^(n−1/2) exp(−t)/(a+bt) dt.

The following are enclosing intervals, with outward decimal endpoints, from
exact rational arithmetic; they independently certify all six rounded constants
of STATUS 5.4.

| row | k1 lies in | k3 lies in | accepted lower costs |
|---|---|---|---|
| peak | (0.128376107076914, 0.128376107076915) | (0.330212634031258, 0.330212634031259) | 0.128, 0.330 |
| flank | (0.156307319722004, 0.156307319722005) | (0.356624248973760, 0.356624248973761) | 0.156, 0.356 |
| upper | (0.166241805298530, 0.166241805298531) | (0.361336271945875, 0.361336271945876) | 0.166, 0.361 |

**Correction:** MONOGRAPH §4b's historical text rounds the flank d-cost to
0.36. That rounding is too large for this certificate; use 0.356 (as STATUS 5.4
already does). This does not prove 0.36 false for the actual functional; it shows
that the cited majorant does not certify it.

## 2. The entire application box: a uniform one-coordinate theorem

For every epsilon in [0.74,0.76], ell in [0.76,0.90], b in [0.12,0.16],
and every complex d,

    Lambda(d Z(T−2)) <= 2E|L| − (3/20)||d Z(T−2)||².       (1)

This holds also when the polynomial is embedded in any larger dimension.
For total dimension n=1 it exhausts H_{2,1}, so

    sup_{G in H_{2,1}(C)} Lambda(G) = 2E|L|,

and G=0 is the unique maximizer. This closes the n=1 subproblem throughout the
whole application box, including its sigma*=0 corner; it is not a claim in
arbitrary dimension with unrestricted G.

Proof of the uniform constant. The integral

    I(ell,b) = integral sqrt(t)(t−2)² exp(−t)/(ell+b(t−2)) dt

decreases as ell increases and is convex in b wherever its denominator is
positive. Here the denominator is at least 0.44. Thus its maximum on the box
is attained at ell=0.76 and one of b=0.12,0.16. Also p>=1/0.76. At these two
endpoints the checker encloses p−I/2 respectively in

    (0.225985672933425, 0.225985672933426),
    (0.151676198434561, 0.151676198434562).

Both exceed 3/20. Apply §1 with Q=P=0 to obtain (1).
This endpoint reduction is analytic, not a grid in profile parameters.
The same crude method does not give positive Q/P cost throughout the box:
k1 is negative at epsilon=ell=0.76,b=0.16. No general odd-sector box theorem
is claimed.

At the peak, 2E|L|=sqrt(pi)(a+3b/2)=387 sqrt(pi)/500, enclosed in
(1.371879280600869,1.371879280600870). This corrects the historical 1.3649
misquotation with an independently verified optimum. Since S includes sigma=0,
the n=1 inequality Lambda<=S follows without needing to enclose S.

## 3. Exact checker and trust boundary

Run from any working directory:

```sh
python3 -I research/conjecture-K/code/audit-2026-11-15-codex-a7c4/odd_cost_check.py
```

The path is relative to the repository root (or substitute its absolute path).
Only Python's standard library is used. The saved result is
[`odd_cost_result.json`](../../code/audit-2026-11-15-codex-a7c4/odd_cost_result.json).
Acceptance uses Fraction endpoints rounded outward to 220 binary fractional
bits after each operation, with integer square-root bounds. The checker uses

    J0 = pi exp(a/b) erfc(sqrt(a/b))/sqrt(ab),
    J(n+1) = (Gamma(n+1/2)−a Jn)/b.

The first identity follows by representing 1/(a+bt) as its Laplace integral;
the second follows by polynomial division. Pi is enclosed with Machin's formula
and alternating arctangent series. Exp uses a positive Taylor sum with a geometric
tail bound. Erf uses its alternating entire series with a decreasing omitted
tail (180 terms, a/b<7). Every acceptance comparison is rational; decimal strings
are outward-rounded presentation only. These are scalar certificates supporting
the paper proof, not Lean proofs or a checker of arbitrary cubic coefficients.
