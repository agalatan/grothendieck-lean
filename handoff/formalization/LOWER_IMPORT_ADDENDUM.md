# Current lower-bound target and exact checker map (version 2)

The current lower target is `14008970709/10000000000 < K_G^C`.
Its operator-norm cap is `B = 7138283181/10000000000`; prove
`K_G^C >= 1/B` and the exact inequality `14008970709/10000000000 * B < 1`.
The earlier lower maps still specify the analytic construction, but their
numerical endpoints and counts are superseded by this addendum.

Read `../packages/grothendieck-lower-import/research-note.md` alongside the
existing `LOWER_FORMALIZATION.md`. No new operator or Gaussian integration
scheme is assumed. The improvement comes from more physical polynomial
majorants, new rational averaged profiles/argument allocations, and a slightly
sharper sixth-moment scalar inequality.

## Authoritative finite data

All paths in this list are relative to `packages/grothendieck-lower-import/`:

- `combined-polynomials.json`:145 additional global physical polynomials,
  including all48 old extras and97 selected imported extras. Source DATA
  contains220 more. Coefficients are exact strings, stored **before** the
  common1e-8 constant-term lift. Source records precede extra records within
  each profile's index space.
- `coupled-profiles.json`:18 selected profiles,10,218 moment leaves.
- `envelope.json`:31 scalar-cover leaves, exact norm cap and supporting rows.
- `sharper_c6.json`:15 rational intervals proving C6=49.42288923.
- `base/`:unchanged source-price replay, original moment-domain covers,
  rho=0.977459 proof, and earlier source support caps.
- `selection-map.json`:how selected profile/polynomial indices were remapped
  from the complete exploration pool. This provenance map is not an extra
  mathematical assumption.

Finite reference checkers:

1. `verify_moment_refinements.py` verifies the degree-six positive polynomial
   for C6 using explicit rational expansions and Horner-to-Bernstein bounds.
2. `verify_imported_profiles.py` verifies the source hash, the C6 certificate,
   every selected global polynomial above lifted chords and the infinite
   affine tail, profile matrix gates, parameter averages, scales, moment
   leaves, and complete dyadic covers. No optimizer or conditional first
   moment is used. Its Bernstein implementation differs from the generator.
3. `verify_augmented_envelope.py` independently reconstructs supporting rows,
   the variance-corrected pair envelopes, exact maxima, and complete t cover.
4. `verify_all.py` runs the full integration prerequisite replay before these
   checks and then the optional finite-order consequences.

The old21 coupled certificates could all be rechecked using the smaller C6,
because every changed contribution is nonnegative times C6. The final
selection retains only profiles needed by its scalar cover. No old metadata
string is accepted in place of actually checking the new inequalities.

## Analytic obligations unchanged

Formalize the same Gaussian operator-to-Grothendieck transfer, cubic-chaos
moment identities, physical-potential majorization, common residual moments,
strong convexity/retained-square identity, and matrix gate as in the original
lower map. The averaged residual uses the actual penalty `-d_old^2/d_new`.
For each leaf prove the exact identity
`w*lambda_i + (1-w)*lambda_j = d_old` before applying joint convexity.
Global polynomial validity is essential when these arguments leave the
original source moment rectangles.

The source point caps and every physical polynomial constant are lifted by
exactly1e-8. Do not omit or duplicate this correction. A successful unmodified
Linux replay reported by the other instance does not discharge the local
corrected quadrature proof obligation.

The source sixth-moment cumulant reduction remains analytic input. Only its
remaining scalar coefficient has changed. Prove the new rational positivity
certificate, then reuse rho=0.977459 from the previous, weaker C6 proof.

## Useful but inactive contact-moment helper

The new package proves the exact rational contact-polynomial identity and
provides a checker helper for conditional first moments. This is mathematically
valid, but the current bound uses constant rho throughout. Do not invent a
further gain from the helper. A future implementation choosing contact pairs
must keep a fixed pair on each rectangle to justify x-endpoint maximization.

## Finite-order consequence

`finite-dimension/theorem.md` derives the exact vector-test numerator via
Gaussian Wick monomials and sphere-valued finite approximations:

`K_G^C(n) >= (pi*n*choose(2*n,n)^2/16^n/B)*(1-37/(200*(n+1)))`.

Its arithmetic program proves a rational pi enclosure using Machin's formula.
The projection identity and limiting finite-matrix argument still need Lean
proofs. The dimension n is the vector dimension; no explicit witness matrix
or witness matrix size is included.

## Status to report

The complete computational replay is recorded in the package's logs. It does
not establish a Lean kernel theorem. As before, report actual compiled
statements and their hypotheses/axioms, distinguishing finite arithmetic from
Gaussian integration and the functional-analytic transfer.
