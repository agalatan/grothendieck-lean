# Original positive-moment seed certificate

Agent-ID: codex-aa04. Refs #21.

This packet supplies a finite certificate for the actual original moment

\[
J_0(x)=\frac{4}{\pi}\int_0^{\pi/2}
  \cos^2(t)\exp(-x\sin^2(t))\,dt
\]

at the exact rational midpoint squared recorded in the recovered row-227
replay. It is not used by `Grothe.Statement.main_bounds`, and its Lean modules
(the generated `OriginalMomentSeedData` and `OriginalMomentSeedCheck`, and
`OriginalMomentSeedCheckpoints`, `OriginalMomentSeedInteger` and
`OriginalMomentSeedEnclosure`) are not in the library; the generator below
rewrites the two generated ones.
The current unconditional upper endpoint is `1.404599398251`, proved in
[`Grothe/UpperTightFinal.lean`](../../Grothe/UpperTightFinal.lean). That proof uses
the generic production seed enclosures in `UpperQuad/SeedAnalytic.lean` and
`UpperQuad/WatsonSeed.lean`, rather than this fixed-midpoint packet.

The three preserved inputs are `row227-charge-replay.json`,
`row227-seed-checkpoints.json`, and `row227-seed-checkpoints.jsonl.gz`. The
generator verifies their hashes, cross-checks the original midpoint and scale,
and validates all checkpoint indices, integer inequalities and totals. The
mathematical input from the charge replay is its exact midpoint and scale.

For `N = 512`, the certificate retains terms 0 through 512 and bounds term
513. LeanCert's Taylor remainder theorem applies on `[-x, 0]`, where every
derivative of the exponential is at most one. Integrating the remainder
gives the next original moment divided by the factorial. This establishes
the seed accuracy analytically.

The rounded recurrence uses 514 integer interval pairs and 513 updates.
The negative multiplier reverses the previous interval endpoints. A proved
scaling lemma transfers the integer guards to rational bounds on the exact
Taylor terms. The concrete arithmetic uses groups of at most 32 transitions
and retained terms, checked by `decide +kernel`. Separate checks cover all
stored lookups and the retained integer sums.

`OriginalMomentSeedEnclosure.moment_midpoint_mem` (not in the library) is the concrete result: an
enclosure of actual `J₀` at the rational midpoint squared, with no numerical
accuracy hypothesis. Its interval width is `73351 / scale`; the common scale
is `2^1024`. The data and certificate introduce no native facts or resource
limit overrides.

Regenerate the Lean data and arithmetic checks with:

```sh
python3 tools/gen_original_moment_seed.py
python3 tools/gen_original_moment_seed.py --check
```

The generated manifest records the input and output hashes. Generation uses
integer arithmetic and is deterministic. Lean compilation, strict axiom
guards and the repository proof gates establish acceptance. Python replay
and source review provide separate evidence.

This packet alone does not establish the physical row parameter, transport to
this rational midpoint, the `sqrt(π)/2 · A` prefactor, or coefficient-table and
energy estimates. The existing `F0ConditionalSeed` identities provide the
analytic connection between original moments and Gaussian coefficients.
The production proof discharges its corresponding obligations through the
generic quadrature chain described in [LEAN_DETAILS.md](../../docs/LEAN_DETAILS.md).
