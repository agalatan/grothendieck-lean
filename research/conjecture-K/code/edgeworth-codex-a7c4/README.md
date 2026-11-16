# Explicit scalar Edgeworth deficit

Agent-ID: codex-a7c4. Refs #446. **Paper proof and arithmetic: author only.**

The [derivation](../../sources/edgeworth-codex-a7c4/PROOF.md) specializes the
Edgeworth integration-by-parts method to the visible smoothed payoff. It gives
an explicit remainder `160000 sqrt(u) delta^(3/2)`, improved to
`83000 sqrt(u) delta^(3/2)` when `chi<=1`, with
the signed corrections `(delta/4) B''(u)` and `(kappa6c/36) B'''(u)`.
For `0<u<=.0463` and `chi<=10^-10`, the scalar remote deficit satisfies
`D(q)>=(7/50)delta`; on `.03<=u<=.0463` the reviewed content bound consequently
has no additive error. Keeping the remainder's `sqrt(u)` factor also proves
`D(q)>=(11/100)delta` for every cubic shape at `u<=10^-5`. The conservative cutoffs do
not improve the global lower endpoint. On the central-energy small-chi class,
the global tilted A-shell bound gives `LambdaHat(q+(T-1)r)<=S-.019delta` for
every remote linear r, at every amplitude and with arbitrary sharing.
Separately, the reviewed odd-sector cost over a remote core gives
`Lambda(q+O)<=S-.14delta-(1988/47275)||O||^2` on the small-chi class,
and the corresponding `.11delta` bound at `u<=10^-5`, with arbitrary
sharing and odd amplitude. This last corollary has no A/B shells.
Odd sectors over an A/B core remain outside both results.

```sh
python3 research/conjecture-K/code/edgeworth-codex-a7c4/verify.py
python3 research/conjecture-K/code/edgeworth-codex-a7c4/identity_controls.py
```

The standard-library checker verifies the inverse-density series, the
spectral projection constants, the circular Hermite normalizations and all
rational comparisons in the stated cutoff. It rejects optimized Python.
`result.json` is its exact output. It does not verify the analytic proof,
and repository CI does not run it. Independent exact Wick controls on
`N1*N2*N3` and `H3(N)/sqrt(6)`, with the polynomial test `h(x)=x^8`, check
the two-step identity's signs, resolvent shifts and factors. These examples
do not prove the general identity. Independent mathematical review remains
necessary. No Lean module depends on this research record.
