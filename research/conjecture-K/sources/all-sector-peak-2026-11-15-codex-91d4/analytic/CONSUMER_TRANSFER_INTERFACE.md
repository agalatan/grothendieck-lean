<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/CONSUMER_TRANSFER_INTERFACE.md, 2026-11-15 13:29; Agent-ID: codex-91d4. -->
# Regional trial interface for rows-and-regions

Agent-ID: **codex-91d4**. 15 November 2026. Refs #436.
Sent to codex-8d2f for the user-assigned rows-and-regions Phase 0.
**P, author-only** for the explicit-trial consequences below. Weighted
retained scaling itself is the reviewed STATUS 3.17 / #419 input.
No full-domain peak or transferred all-sector theorem is supplied.

Review update: the underlying regional theorem is now independently
re-derived and replayed by claude-b9ee (P+C), as recorded in
`../reviews/REVIEW_STATUS.md`. The transfer calculations in this note
were not part of that review and retain their author-only label.

The available regional theorem uses `c=0` and exactly
`xi0=-(3/5)(r_A+rho r_B)`, `rho=5053/10000`. Its energy region is

```
1.542u+.172V-.128(W_Q+W_P)-.330W_nu <= .002174.
```

It holds in every dimension with arbitrary genuine sharing. Its proof
needs only that inequality and sector orthogonality; the response
consumer can intersect it with the necessary response caps. The full
response-cap averaged Psi premise remains open.

The exact trial norm and two upper bounds are

```
||xi0||²=(9/25)||r_A+rho r_B||²
 <= (1129795281/2500000000)V = .4519181124 V,
 <= (6089385843/10^10)[epsilon0²(pi/4-t²)-u/2
                         -W_Q-W_P-(8/7)W_nu].
```

The second uses weighted Cauchy-Schwarz with A/B energy weights
2/3 and 4/3. The total cap alone gives
`||xi0||²<=90441242039331/2500000000000000`.

Let `F0(G;xi0)` denote this explicit trial value, and let lambda>0.
At the exactly scaled profile `(lambda epsilon0,lambda a0,lambda b0)`,
take `G'=lambda G` and `xi'=lambda xi0`. Direct substitution gives

```
F_scaled(G';xi')
 =lambda [F0(G;xi0)+(lambda-1)||xi0||²].
```

Thus an upper transfer loss is
`lambda(lambda-1)_+*.4519181124 V`. The same statement at the base
profile with trial-norm price lambda increases the regional V
coefficient from `.172` to `.172+(lambda-1)_+*.4519181124`.
Source energies are the destination energies divided by lambda²;
the regional hypothesis must be checked on those source energies.
This is an explicit-trial upper bound, not raw homogeneity of the
retained infimum. For lambda<=1 the changed trial penalty only helps.

An additional profile perturbation `(deltaa,deltab)` changes the
positive sum of norms by at most

```
2E|Z(deltaa+deltab T)|
 <=sqrt(pi)(|deltaa|+(3/2)|deltab|).
```

This bounds the trial alone. A bound on its excess over a different
benchmark requires a separate lower bound for that benchmark; the
profile error must not be silently omitted from that comparison.

The existing regional checker and its benchmark lower input are
unchanged by this coordination note. No new weighted profile region
or consumer cap is certified here.

## Separate row proposed by codex-8d2f

Coordination report received on 15 November 2026; the following are
**peer-reported results, not independently checked in this handoff**.
The proposed row has

```
epsilon=149/200, ell=3391/4000, beta=90686/625000,
t in [21/25,1711/2000].
```

8d2f reports that eta=1/10000 on this row, combined with inherited
19-row scalar caps outside the interval, conditionally gives K>1.40171.
His exact allowance is
`270324292079477/2610684875000000000`, approximately .000103545355;
his 1773-cell conditional consumer bookkeeping passes. Reported Arb
enclosures are S in [1.3754118215,1.3754118218] and variance in
[.03228257,.03228277]. Normalized source energy limits
.0462653151 and .0800500255 fit the peak energy domain.

This domain inclusion does not supply the needed profile comparison.
8d2f reports a one-sided triangle/support profile loss of .000704773316
and a transferred allowance about .000803266177 even if the full peak
eta=1e-4 premise were available. That estimate is too large for this
row. His next decision is therefore a new profile transfer or certificate.
It does not require changing this handoff's peak coefficients, odd
allowance, energy cap or ownership split. Neither the new row's
all-sector premise nor the full-domain peak premise is proved here.
