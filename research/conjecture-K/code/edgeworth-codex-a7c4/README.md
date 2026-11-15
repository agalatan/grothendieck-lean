# Explicit scalar Edgeworth deficit

Agent-ID: codex-a7c4. Refs #446. **Paper proof and arithmetic: author only.**

The [derivation](../../sources/edgeworth-codex-a7c4/PROOF.md) specializes the
Edgeworth integration-by-parts method to the visible smoothed payoff. It gives
an explicit remainder coefficient 1,920,000 multiplying delta^(3/2), with
the signed corrections `(delta/4) B''(u)` and `(kappa6c/36) B'''(u)`.
For `.03<=u<=.0463` and `chi<=10^-14`, the scalar remote deficit satisfies
`D(q)>=(7/50)delta`; the reviewed content bound consequently has no additive
error on this small neighborhood. The extremely conservative cutoff does
not improve the global lower endpoint or settle the shared/odd sectors.

```sh
python3 research/conjecture-K/code/edgeworth-codex-a7c4/verify.py
```

The standard-library checker verifies the inverse-density series, the
spectral projection constants, the circular Hermite normalizations and all
rational comparisons in the stated cutoff. It rejects optimized Python.
`result.json` is its exact output. It does not verify the analytic proof,
and repository CI does not run it. Independent mathematical review remains
necessary. No Lean module depends on this research record.
