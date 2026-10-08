# Independent audit of the supplied lower-bound package

The supplied certificate claims `K_G^C > 1.40044592029`. Its finite rational
verification passed against our pinned local source, and its separately written
JavaScript BigInt checker also passed. This is weaker than our existing
`K_G^C > 1.400813971`, but the package contains useful additional physical
polynomials and a conditional moment estimate that can be combined with our
stronger method. No Lean verification, external review, or record claim is made.

## What was inspected and executed

Input directory:
`received/grothendieck-lower-refinement/lower-bound/`, relative to this audit.
I reviewed the research note and the core moment, profile, physical-polynomial,
rectangle-coverage, continuous-envelope, KKT, JavaScript, and finite-dimension
verification logic before execution. Search/proposal status was not used as
proof. The received scripts and certificate files were not edited.

A sibling `grothendieck_cx` symlink points to our existing local
`work/source_complex`; nothing was cloned from the network. The import uses the
pinned `check_complex_lower.py`, SHA256
`8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1`.
Its import was inspected: integration subprocesses are under explicit functions
and the guarded main, and are not run merely by importing the data.

Successful checks:

- `verify_lower_refinement.py`, default mode: all9 source profile gates,
  180 selected physical polynomials, 5569 moment rectangles, the moment
  refinements, 92 final intervals, 54 pair/single models, and exact KKT checks.
  Log: `received-exact-verification.log`.
- `check_exact.mjs`: independent rational moment identities, saved moment
  covers, final envelope and KKT arithmetic. Log:
  `received-js-verification.log`.
- A separate read-only reproduction of all5 stored finite-order lower bounds.
  Script/log: `audit_finite_dimension.py`, `finite-dimension-replay.log`.
- All file hashes listed in `verification-record.json` matched; the record's
  `README.md` resides one level above `lower-bound/` in the extracted package.

The default Python verifier explicitly retains Gaussian integrations and the
analytic source reductions as prerequisites. I did not run the attachment's
`--full` option: our earlier local replay already found small excesses over
some unlifted stored source point caps, and the existing delivered certificate
handles those with an explicit uniform lift of exactly1e-8. The supplied Linux
full-run log does not explain or formally resolve that portability issue.
Thus the reproduced incoming endpoint is **conditional on its unlifted source
support caps**, not a new unconditional local replay result.

Its new polynomials can be transferred safely to our established replay:
add exactly1e-8 to each physical polynomial's constant coefficient. The
source node chords and terminal affine tails are lifted by the same amount,
so every polynomial-minus-support certificate is unchanged. A profile cap
and each corresponding stored moment upper bound then shift by1e-8. Recompute
or explicitly shift the scalar-envelope certificate. Do not silently combine
unlifted polynomial constants with our lifted support proof.

## Moment and conditional-contact audit

The incoming global constants are `C6=49.423` and `rho=0.97746`. They are
slightly weaker than our already proved `C6=49.42289` and `rho=0.977459`.
The sixth-moment comparison is the same rational Bernstein proof of a scalar
consequence of the inherited Wick cumulant/contraction identities. The two
scripts check the same polynomial with the correct conversion factor27/50.
The support of the actual moment parameter is
`0 <= x=sqrt(E|q|^4-2) <= sqrt(60) < 31/4`.

For positive rational contacts `a,b`, write `s=a+b`, `p=a*b`. The incoming
polynomial has coefficients

```text
p0 = p^2*(s^2+p)/(2*p*s^3)
p2 = (s^4-p*s^2+3*p^2)/(2*p*s^3)
p4 = (3*p-2*s^2)/(2*p*s^3)
p6 = 1/(2*p*s^3)
```

Exact multiplication verifies

```text
p0+p2*y^2+p4*y^4+p6*y^6-y
 = (y-a)^2*(y-b)^2*(y^2+2*s*y+s^2+p)/(2*p*s^3) >= 0, y>=0.
```

This is the same two-contact polynomial identity underlying our sharp
three-moment scalar lemma. The useful additional use is to retain the
conditional bound

```text
R_ab(x) = p0+p2+2*p4+6*p6
          +(p4+9*p6)*x^2+C6*p6*x^3
```

for the first absolute moment, instead of replacing it everywhere by a
constant `rho`. It is valid for every nonnegative x in the cubic moment range,
not just near the contact points used by a floating-point proposal routine.
The degree-six coefficient p6 is positive, so substitution of the sixth-moment
upper bound preserves the inequality. The fourth moment is known exactly;
its coefficient may be negative without invalidating the substitution.

For a physical polynomial `a0+a1*s+a2*s^2+a4*s^4+a6*s^6`, source verification
checks `a1,a6 >= 0`. Replacing its `rho*a1*sigma` term by
`R_ab(x)*a1*sigma` leaves its x dependence as

```text
constant + A*x^2 + B*x^3,   B=C6*(p6*a1*sigma+a6*sigma^6) >= 0.
```

On any nonnegative x interval its maximum is attained at an endpoint: any
positive interior stationary point is a minimum. Thus the received verifier's
endpoint reduction followed by Bernstein bounds in sigma is sound. Each
rectangle may choose its own fixed positive rational contact pair because
each such majorant is global. The verifier checks the contact identity again
for every selected row; it does not trust the floating-point contact search.
Only5 of5569 final leaves actually use contacts:2 in H0.84 and3 in H0.865.

This adapts directly to our coupled-residual method. If its linear moment
term is `rho*A1*u`, substitute `R_ab(x)*A1*u` with our **stronger** C6.
Because `A1,A6 >= 0` for nonnegative argument allocations, the same x-endpoint
argument survives. Keep the single common residual penalty used by our
coupled proof; do not reintroduce separate source penalties.

## Physical-polynomial and finite-cover audit

The incoming polynomial verifier reuses the pinned exact source routine.
It covers each bounded physical interval with rational Bernstein domination
of a source support chord. For the final infinite interval, translated
coefficients of polynomial minus the terminal affine support are nonnegative.
The latter check covers the whole infinite tail, not a finite sample.

The moment rectangle checker sorts all sigma boundaries and checks an exact
partition of `[0,31/4]` on every resulting strip. Bounds on coordinates and
positive widths are explicit. No gaps or overlaps were found. All stored
upper values are recomputed as rational numbers and compared with their caps.

An exact coefficient comparison with upstream and our48 added polynomials
found44 genuinely additional polynomials in the compact selected certificate:

| Source profile | New selected polynomials |
|---|---:|
| H0.84 |19|
| H0.865 |25|

Every other selected polynomial was already in those input families. The
compact180-polynomial certificate is only part of the supplied search output:
the parent audit additionally identified418 distinct new physical polynomials
across the complete adaptive files. My reproduced180-polynomial run covers the
compact selection; it should not be described as a replay of all418 additional
polynomials. The larger imported family can improve our virtual/coupled profile
construction after the explicit constant lift described above. Its combined
physical, moment and envelope checks are recorded separately by the parent.

## Mixing and finite-model optimality

The supplied retained-coefficient inequality yields the profile mixture cap

```text
C_mix = sum(lambda_i*C_i)
        -(2/epsilon)*(sum(lambda_i*beta_i^2)-(sum(lambda_i*beta_i))^2).
```

This is mathematically the same variance gain as our retained Hilbert-space
square identity. It is not a new improvement over our delivered method. The
common coordinate and cubic coefficient must be the same across all profiles;
the research note retains this condition. Averaging only the already completed
quadratics would not justify the variance subtraction.

For each pair the alpha minimizer and its clipped validity interval are
correct. The interval maximum includes a concave quadratic's interior vertex,
when present. The exact rational interval cover proves a global upper bound.
At the selected bottleneck, equality of the two active gradients and dominance
of the inactive gradients are sufficient KKT conditions: the simplex objective
is affine plus a positive multiple of `(sum lambda_i*beta_i)^2`, hence convex.
They prove optimality for those particular10 support inequalities and caps.
They do not prove the exact Gaussian operator norm or optimality after adding
our virtual profiles, stronger moments, or other physical polynomials.

## Finite-order formula

The supplied vector-test formula is correct:

```text
K_G^C(n) >= [pi*n*binom(2n,n)^2/16^n]
            *[1-epsilon/(4*(n+1))]/N,
```

provided the Gaussian operator norm in dimension n is at most N. Here n is
the Hilbert-space dimension of vector assignments, not a matrix dimension.
The claimed cubic projection can be verified against every Wick monomial;
a detailed independent proof, including the finite-matrix approximation, is
in `finite-dimension/theorem.md`. It avoids relying solely on an asserted
uniqueness of an equivariant cubic map.

A portable, standard-library rational checker is
`finite-dimension/certify_finite_dimension.py`. It accepts an arbitrary exact
`--norm-cap` and clearly marks that input as an analytic assumption. It uses
an exact Machin alternating-series enclosure of pi, with no floating-point
gamma evaluation, source import, or numerical library. Its result is labeled
`PASS_CONDITIONAL`; Python `-O` and `-OO` are rejected.

Using our already certified norm cap `3569353321/5000000000` gives:

| n | Strict lower consequence |
|---:|---:|
|10|1.343264234842|
|100|1.394756883874|
|1000|1.400204984457|
|2000|1.400509385991|
|10000|1.400753039411|

These are consequences of the stated construction, not claimed finite-order
records or explicitly constructed finite witness matrices. Any subsequently
certified smaller norm cap can be passed to the same checker.

## Overall assessment

The core exact arithmetic reviewed here is sound and reproduced. The useful
new inputs for our stronger certificate are the418-polynomial adaptive family
(with44 new members in the compact selected certificate),
retaining the conditional contact bound in moment rectangles, and the explicit
finite-order consequence. Its global moment constants and variance mixing
are weaker or equivalent to work already in our certificate. The unlifted
source-integral prerequisites remain a separate issue; the known uniform lift
provides a clear way to combine the new polynomial data with our successful
source replay. No proof-assistant validation is asserted.
