# Task for the AI implementing Lean verification

The user is handing you this archive to implement Lean checks of the
mathematics. Use the existing IDE project's Lean/mathlib version if one is
already pinned, and record the versions you actually build with. This archive
does not choose a toolchain or supply uncompiled Lean placeholders.

The main mathematical targets are

\[
\frac{1400813971}{10^9}<K_G^{\mathbb C}
<\frac{1404898359045958}{10^{15}}.
\]

The left side is obtained from the stronger reciprocal certificate

\[
B=\frac{3569353321}{5000000000},\qquad
K_G^{\mathbb C}\ge B^{-1},\qquad
\frac{1400813971}{10^9}B<1.
\]

Do not confuse the six-kernel method limitation
`1.404898309212694` with a lower bound on the Grothendieck constant. Do not
confuse exact finite-model LP optimality with an optimal Grothendieck bound.

## Definition and normalization

Begin with an explicit standard finite-dimensional formulation of the
**complex** Grothendieck constant: compare the optimum of a complex matrix
over scalar phases with its optimum over complex Hilbert-space unit vectors,
uniformly over all finite matrix sizes and vector dimensions. State the
complex-inner-product and conjugation conventions and prove the equivalence
to the convention used by the supplied source reductions. The numerical
claims here concern this ordinary bipartite complex constant, not the real,
positive-semidefinite, symmetric or finite-order constants.

It is acceptable to organize the development first around the property that
a number is an admissible Grothendieck bound, then define the best constant
and prove the needed infimum/supremum facts. Avoid silently assuming
attainment of the best constant.

## Suggested stages

1. **Exact inputs and finite checks.** Parse integers, fractions and dyadic
   interval endpoints exactly. Formalize small sound checkers for polynomial
   Bernstein bounds, matrix gates, complete dyadic covers, scalar quadratic
   maxima, finite polynomial arithmetic, and LP primal/dual certificates.
   Use the current data files rather than rerunning the optimizers.
2. **Analytic lemmas connecting the finite checks.** Formalize the retained
   square/variance identity, convex interpolation with flexible arguments,
   moment bounds, matrix-parameter tightening, weighted tail inequalities,
   and the coefficient-norm transfer with common preprocessing.
3. **Underlying functional analysis and certified integration.** Discharge
   the Gaussian-chaos/operator-to-Grothendieck reduction, kernel validity,
   coefficient identities, and the integral enclosures. The dependency maps
   identify these precisely. These are substantial obligations, not facts
   proved by importing a JSON file.
4. **Assemble the numerical theorems.** Prove the rational endpoint comparisons
   and connect them to the analytic reductions. Report exactly which final
   statements are unconditional and which remain conditional on named lemmas.

This order permits useful progress on the finite proof infrastructure before
the full analytic formalization is finished. Keep a list of open obligations
instead of obscuring them inside an asserted final theorem.

## Trust boundary

- SHA-256 checks identify files. They do not prove inequalities.
- The exact rational exports of NPZ files preserve their stored numbers.
  They do not prove that those numbers enclose the intended integrals.
- The supplied Python Fraction and JavaScript BigInt programs are reference
  checkers. Their successful execution is not a Lean proof.
- Arb intervals are reliable computational evidence under that library's
  arithmetic and integration implementation. A Lean theorem needs a formal
  containment argument or an explicitly stated trusted external boundary.
- Numerical optimizers only proposed profiles, covers, allocations and
  preprocessors. They must not be dependencies of proof soundness.
- Explain any reliance on native evaluation, external solvers, oracle
  mechanisms or added axioms. Report the actual theorem dependencies. A
  theorem with unresolved placeholders or an assumed final inequality is not
  a completed verification of the requested bound.

Conditional theorems can be worthwhile milestones, provided their hypotheses
are visible. For example, a theorem taking the energy/coefficient enclosures
as hypotheses verifies the tail algebra, but does not yet establish those
enclosures or an unconditional Grothendieck inequality.

## Current authoritative paths

Lower proof and certificates:

- `packages/grothendieck-further-squeeze/lower/research-note.md`
- `packages/grothendieck-further-squeeze/lower/coupled-profiles.json`
- `packages/grothendieck-further-squeeze/lower/envelope.json`
- `packages/grothendieck-further-squeeze/lower/base/`
- `upstream/grothendieck_cx/check_complex_lower.py`

Upper proof and certificates:

- `packages/grothendieck-cross-instance-review/combined/proof.md`
- `packages/grothendieck-cross-instance-review/combined/verify_combined.py`
- `packages/grothendieck-cross-instance-review/combined/verify_dirichlet_energy.py`
- `packages/grothendieck-cross-instance-review/combined/manifest.json`
- `packages/grothendieck-cross-instance-review/combined/inverse_eta.json`
- `packages/grothendieck-cross-instance-review/combined/added_origin_120_240.npz`
- `upstream/grothendieck_cx/` and `data/npz-exact-rationals/`

Independent finite-model optimality audit:

- `packages/grothendieck-cross-instance-review/audit/verify_lp_independent.py`
- `packages/grothendieck-cross-instance-review/audit/replayed-our-table.json`

## Details that are easy to get wrong

- The source's original lower point caps needed a conservative lift of
  exactly `1/100000000`. The corresponding physical polynomial constants
  carry that same lift. Do not silently remove it or represent the original
  unmodified lower replay as passing.
- Existing source-profile caps may retain their original `rho=0.98` domain.
  The new coupled profiles and crude scalar branch use `rho=0.977459`.
  The stronger sixth-moment coefficient is `49.42289`.
- Modified lower profiles retain the completed square at their averaged beta.
  After argument allocation the quadratic penalty is the single actual
  `-d_old^2/d_new`, not a sum of unchanged source penalties.
- Some lower argument allocations are stored on individual rectangle leaves.
  Check each leaf's exact weighted-argument identity and domain coverage.
- The upper construction reverses the third scalar row's sign.
- Its six decimal weights sum to `1.000000000000000012`, not exactly one.
- Original and added coefficient integrals are truncated at finite radial
  cutoffs. The omitted input and infinite coefficient tail are accounted for
  separately; neither may be dropped.
- The joint coefficient sequence has twice the individual omitted-input norm
  allowance when estimating visible energy.
- The common preprocessor's coefficient absolute sum is exactly one, and
  the complete finite composition reaches radial degree 57,240.
- Historical files include exploratory or unsuccessful ideas and older
  numerical endpoints. The `research/` directory is not a list of established
  theorems. Prefer the current paths and explicit proof-status maps.

## Completion report requested from the IDE implementation

Report the exact Lean/mathlib revisions, how to build/check the project,
which theorems compiled, their hypotheses/axiom dependencies, which numerical
certificates were actually checked, and any remaining analytic or integration
obligations. If a claim fails, preserve a minimal counterexample or failing
certificate location rather than weakening a check just to obtain a pass.
