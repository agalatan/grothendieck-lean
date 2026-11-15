<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/analytic/AUDIT.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- handoff/codex-4d8a-compensated-joint/analytic/AUDIT.md; Agent-ID: codex-4d8a. -->
# Independent worker audit of the local theorem and joint cone

This is an independent derivation by the odd-proof worker within the same
codex-4d8a session. It is not external review or Lean verification.

## Uniform local Conjecture K

I read `remote-dependence/UNIFORM_LOCAL_K.md` in full and re-derived its new
arguments. No mathematical gap was found.

- The real third-chaos cumulant identity has the stated coefficients
  `1296||f⊗₂f||²+1944||Sym(f⊗₁f)||²`.
- Twice iterated chaos integration by parts gives exactly the displayed
  `P_h`, including its scalar term. The important identity
  `<f,(Sym(f⊗₁f))_h>=<f⊗₂f,f_h>` holds: the three symmetrization terms
  agree by symmetry of f. The one-/two-slot flattenings have operator norm
  at most `sqrt(||f⊗₂f||HS)`. This proves the uniform norm bound
  `||P_h||₂<=270||f⊗₂f||HS^(3/2)||h||`, hence the constant 5/4.
- The actual A/B first variation is reduced to a scalar real projection by
  global charge-one circularity. Reflection of Im Z removes the missing
  imaginary Z² term. This is valid with arbitrary sharing and uses no
  independent Gaussian bath. Its order is δ^(3/4)sqrt(e), as required.
- The weighted smartpath formula includes the cross carré-du-champ terms
  with the first-/second-chaos fields. Its 1/sqrt(t) factor is integrable;
  constants have zero cross term. The stated 1/(3sqrt(2)), 5/9 and
  sqrt(δ/12) contraction estimates check. All shared covariance, including
  A/B and Q/ν, remains in the finite 10-real-coefficient Hessian.
- Smoothness of the weighted visible pushforward densities justifies moving
  derivatives off the locally integrable norm Hessian. Polynomial times
  stretched-exponential decay gives the necessary bounded derivatives and
  integrability, including bounded one-dimensional marginals.
- The unbuffered fractional Taylor estimate uses the integrable
  |L±q|^(-3/2) singularity. Its uniform conditional bound and fourth-moment
  control give O(e^(5/4)) without a small-ball assumption about q.
- Young absorption leaves O(δ^(3/2)), which the linear-in-δ remote deficit
  absorbs uniformly for δ sufficiently small. The chosen thresholds depend
  on the fixed profile, not dimension.

### Inherited premises and their scope

I also read the inherited `NEAR_GAUSSIAN_REMOTE.md` and
`GAUSSIAN_LOCAL_STABILITY.md`, including their proofs and limitations.

The actual primary statement of Mansanarez–Poly–Swan, Theorem 1.2 in
https://arxiv.org/html/2510.14002v2, was checked. It supplies a dimension-free
total-variation Hermite expansion through degree 4m-1 with error bounded by
a constant times Var(Γ)^((m+1)/2) for every normalized variable in the fixed
chaos. There is no extra independence or tensor-shape condition. The use
with chaos order 3 and m=2 is correctly scoped. I rechecked the inherited
truncated-absolute-value argument, sixth-cumulant conversion, diffuse-cubic
Gaussian-buffer limit, and conditioning on the visible Gaussian mixture.

The new use of the Gaussian Hessian at a fixed price p is valid. At variance
u its coefficient is `(B'(u)-p)e-C_u(h)`. At v*, p=B'(v*) and the finite
visible-sector matrices have a positive minimum c*. Continuity permits one
fixed interval on which `|B'(u)-p|<=c*/4` and `C_u>=3c*/4`, giving a bound
`-c*e/2` uniformly in dimension. This explains explicitly the fixed-price
step; no replacement p=B'(u) is made in the final theorem.

The visible-mixture representation, the complex sixth-cumulant theorem and
the all-profile Hessian formulas remain inherited inputs, rather than new
results of this audit. The external Edgeworth theorem's threshold is not
computed. Accordingly this proves a dimension-uniform existential local
region, not an effective coverage certificate or a numerical endpoint.

### Checks replayed

- `node remote-dependence/verify_content.mjs`: PASS, exact BigInt arithmetic
  on nine integer tensors in dimensions 1–3, with the cumulant, P_h and
  integration-by-parts identities. These finite checks supplement the
  analytic proof and do not establish the dimension-uniform statement by
  themselves.
- No correction to the new derivation was needed. The fixed-price continuity
  argument above is useful explicit clarification.

## Sharp tradeoff and certified cone

I independently derived the scalar dual inequality in
`matrix/SHARP_TRADEOFF.md`. With beta=1-c and
alpha=beta/(2beta-1), optimizing the quadratic dual over k,o and then putting
`s=t exp(iθ), d=±i sqrt(1-t²)exp(iθ)` leaves exactly
`-[(1-beta)/beta](t-cosθ)²`. The two unit-circle boundary reductions are
justified by convexity. `node matrix/verify_tradeoff.mjs` passed its exact
polynomial check.

I read `matrix/CERTIFIED_CONE.md` in full. Given its newly computed matrix
enclosure, all analytic implications check:

- c=9/20 gives even radial price 11/2 and odd radial price 11/20;
- the compensation has the correct sign, normalization and proxy error;
- phase rotation of q changes P but leaves Q and ν unchanged, so the
  compensation is preserved;
- the old unbounded-shift and spatial-tail arguments apply because the new
  odd quadratic form remains bounded by |O|²/|Y|;
- subtracting the full even margin gives the stated conditional bound with
  `g=2387/200-m` and `κ=p-1.313505`;
- proper Gaussian covariance gives E S_r²>=3V²/2, and only full-law
  centering is used when integrating.

The cone requires V<=W/1400 only for global energies; it does not impose a
samplewise coefficient cone. No nu or W cap enters its independent theorem.
The exact reserve is κ-g/1400≈0.0002992401488, so either 1/10000 or the
stronger 1/4000 is safe. The old cession's caps still apply to the subsequent
S+49.36e-6 consumer statement.

I did not duplicate the full 320-interval computation or audit every C++
operation in this new pass; those numerical checks are handled separately.
The analytic cone and the existential local theorem cover different regions.
Neither proves full Conjecture K or changes a Grothendieck endpoint.
