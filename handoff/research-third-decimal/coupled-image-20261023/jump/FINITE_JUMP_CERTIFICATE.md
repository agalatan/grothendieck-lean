# A zero-safe two-sided finite-jump certificate

23 October 2026. Work is confined to the isolated worktree on
`codex/research-audit-20261023`. No endpoint improvement and no new Lean theorem
are asserted here.

The existing paired-support formula, one-sided phase representation and
best-response identities remain valid. They do not by themselves impose
**global two-sided consistency**. This note turns finite simultaneous response
changes into a specific interval-cover test. An exact algebraic fixture shows
that this test can reject a mutual best response whose full phase Hessian is
positive away from its phase symmetry. The fixture is not Gaussian.

## 1. Exact jump identities, with the hypothesis kept explicit

Let `T=P-epsilon Q` be self-adjoint on complex L2, where P and Q are orthogonal
projections, `0<epsilon<=1`, and use the real part of the complex inner product
for payoffs:

`J(f,g)=Re <f,Tg>`, `M=sup_{|f|,|g|<=1} J(f,g)`.

Write `p=Tg`, `q=Tf`. For arbitrary new disk responses F,G, set
`df=F-f`, `dg=G-g`. Bilinearity gives the exact formula

`J(F,G)-J(f,g) = Re <df,p> + Re <q,dg> + Re <df,T dg>`.

At an **exact mutual best response** with unimodular f,g, let
`f=phase(p)`, `g=phase(q)`, `a=|p|`, `b=|q|`. For unimodular F,G this becomes

`J(F,G)-J(f,g) = Re <df,T dg>`
`                   - (1/2) E[a |df|^2] - (1/2) E[b |dg|^2]`.

Consequently a **global maximizer** must satisfy

`Re <df,T dg> <= (1/2) E[a |df|^2] + (1/2) E[b |dg|^2]`

for every finite simultaneous change. A mutual best response alone need not
satisfy it: each unilateral cost is nonnegative, but a simultaneous change can
recover more through the cross term. The full phase Hessian is only the
infinitesimal version obtained from `df=i f A dt`, `dg=i g B dt`.

For an arbitrary pair with `J=M-delta`, every test pair obeys the robust form

`J(F,G)-J(f,g) <= delta`.

This last inequality requires no stationarity, no unimodularity, and no
pointwise division by p or q. It is the form used for the certificate below.
The exact jump expansion and best-response deficit identity are elementary
known facts; their use here is a computable coupled-image exclusion test, not
a claim that those identities themselves are new.

## 2. Work entirely in the actual coupled image coordinates

In a fixed finite Gaussian dimension choose an orthonormal complex basis
`psi=(psi_1,...,psi_d)` of the first and charge-one cubic image sectors.
Let `Lambda` be diagonal with entries 1 and `-epsilon`. Write

`x=c(f)`, `y=c(g)`, `c(u)_j=<psi_j,u>`.

Then `||x||,||y||<=1`, and the actual images and payoff are exactly

`p=psi . Lambda y`, `q=psi . Lambda x`,
`J(x,y)=Re x* Lambda y`.

The remaining L2 components of f and g are irrelevant to this payoff. Crucially,
there is one common orthonormal basis and one actual pair of image tensors;
this step does not substitute two independent marginal cubic laws, and does
not grant either projection a free Gram completion.

For fixed image shifts h,k (functions in the same image span are a natural
choice), choose disk responses

`F_eta = B_eta(p+h)`, `G_eta = B_eta(q+k)`,

where the clipped phase is

`B_eta(z)=z/max(|z|,eta)`, `eta>0`.

The cross-payoff is computable from the actual response moments:

`J_eta,h,k(x,y)=Re c(F_eta)* Lambda c(G_eta)`.

Define the finite-jump gain

`G_eta,h,k(x,y)=J_eta,h,k(x,y)-Re x* Lambda y`.

For every actual near maximizer, `G_eta,h,k(x,y)<=delta`. It is therefore
legitimate to reject a proposed coupled image state whenever a certified
positive finite-jump gain exceeds its allowed gap. This is stronger than
requiring phase form alone. Every cubic phase can already be a one-sided best
response to a suitable bounded function; the old notes explicitly record this.

## 3. A uniform interval-box rule with no inverse image weights

The function `B_eta` is the metric projection of `z/eta` onto the complex unit
disk. Hence

`|B_eta(z)-B_eta(w)| <= |z-w|/eta`.

It is bounded even at image zeros. Its pointwise best-response loss obeys

`0 <= |z|-Re(conj(B_eta(z))*z) <= eta/4`.

Indeed this loss is zero for `|z|>=eta`; otherwise it is
`r-r^2/eta <= eta/4`. Two successive clipped best-response updates therefore
lose at most `eta/2` relative to an original pair. This is a uniform arithmetic
allowance, with no small-ball assumption or reciprocal-moment hypothesis.

Consider a coefficient box, or any set, contained in balls

`||x-x0||<=r_x`, `||y-y0||<=r_y`,

with both the center and tested states satisfying `||x||,||y||<=1`. Hold h,k
fixed throughout that box. Bessel's inequality, `||Lambda||<=1`, and the disk
bounds give

`||c(F_eta(x,y))-c(F_eta(x0,y0))|| <= r_y/eta`,
`||c(G_eta(x,y))-c(G_eta(x0,y0))|| <= r_x/eta`.

Thus

`|J_eta,h,k(x,y)-J_eta,h,k(x0,y0)| <= (r_x+r_y)/eta`,
`|J(x,y)-J(x0,y0)| <= r_x+r_y`,

and finally

`G_eta,h,k(x,y) >= G_eta,h,k(x0,y0)`
`                         - (1+1/eta)(r_x+r_y)`.

If interval integration supplies a center gain lower bound L, then the entire
box has a certified improvement

`kappa = L-(1+1/eta)(r_x+r_y)`.

A positive kappa excludes the box from every maximizing sequence with
`delta<kappa`. This is a concrete certificate interface: the checker needs
center response moments, their integration errors, coefficient radii, eta and
one rational comparison. Hessian matrices and reciprocal singular integrals
are absent from this final comparison.

If finitely many such boxes cover all feasible image states with `J>B`, and
each has strictly positive kappa (possibly using a different shift pair), then
`M<=B`. Otherwise a maximizing sequence eventually lies in that region while
its gap falls below the minimum of the finitely many kappas. This contradicts
the necessary improvement bound.

For a union of Gaussian dimensions, the improvement margin must remain
uniformly positive across dimensions. Separate finite-dimensional positive
margins that tend to zero do not exclude a global maximizing sequence.

The current issue is constructing that cover for arbitrary Gaussian dimension
and actual coupled tensors. This note does **not** solve that issue. The rule
is directly usable for a fixed junta, or after a separate rigorous structural
reduction. Its coefficient-space dimension grows like n cubed, just as the
full image state does. Treating the dimension as fixed would be an unjustified
global Grothendieck step.

## 4. Exact fixture: full Hessian passes, finite jump rejects

Use uniform probability on four points and the orthonormal functions

`psi=(1,i,-1,-i)`, `one=(1,1,1,1)`.

Let P project onto psi, Q onto one, and `epsilon=149/200`. Then P,Q are complex
orthogonal projections, PQ=0, and `T=P-epsilon Q` has eigenvalues 1,-epsilon,0,0.
Take

`f=-one`, `g=one`.

Their images are `p=-epsilon one`, `q=epsilon one`, so the pair is an exact
mutual best response, with `J=epsilon`.

Its full real phase Hessian is

`H(A,B)=epsilon E(A^2+B^2)+2 E[A Re(T) B]`.

The real matrix `Re(P)` has eigenvalues 1/2,1/2,0,0, while Q is orthogonal to
its range. Hence `Re(T)` has eigenvalues `1/2,1/2,-epsilon,0`. The full block
Hessian is PSD, with a single null direction from the common phase symmetry.
Relative to the probability-space L2 norm, its smallest nonzero spectral factor
is `epsilon-1/2=49/200`. The exact checker also produces a rational LDL
certificate with seven positive pivots and one zero pivot.

Now jump to `F=G=psi`. The new payoff is exactly 1, so the gain is

`1-epsilon=51/200`.

The two weighted finite-change costs are each epsilon; the cross term is
`1+epsilon=349/200`, exceeding their sum `2epsilon=149/100` by `51/200`.
Thus the finite condition catches an obstruction invisible to the full local
Hessian. This does **not** show that such a local trap occurs in Gaussian
chaos: the fixture only proves the logical distinction for the same spectral
pattern and admissible complex disk responses.

For the interval-box rule, choose

`eta=1/4`, `h=psi-p`, `k=psi-q`, `r_x=r_y=1/100`.

Both shifted center images have modulus 1, so clipping leaves F=G=psi exactly.
The rational Lipschitz allowance is `1/10`. The whole intersection of these
coefficient balls with the unit coefficient balls therefore has finite-jump
gain at least

`51/200-1/10=31/200>0`.

This is a complete exact fixture for the proposed certificate interface,
including a nontrivial open neighborhood rather than just an isolated point.

## 5. A direction limitation, and a clipped consistency inequality

A positive finite-jump gain rejects a **suboptimal feasible stationary state**.
It cannot by itself reject a relaxed state whose proposed J already exceeds
all realizable test-response payoffs: then all computed `J(F,G)-J` are negative.
Thus the positive-gain box rule alone is not an efficient separator of the
high-valued, unrealizable image states that cause the current upper cap loss.
A quantitative near-maximal consistency condition supplies the complementary
direction.

For any disk f and any image p, write `r=|p|`, `s=min(r/eta,1)`, and define

`R_eta(p)=E(1-|p|/eta)_+^2`.

The following pointwise inequality avoids all inverse image weights:

`|f-B_eta(p)|^2 <= 2(|p|-Re(conj(f)*p))/eta + (1-|p|/eta)_+^2`.

Proof: away from r=0 write `u=phase(p)` and `B_eta(p)=s u`. Then

`|f-s u|^2 = (1-s)^2 + (|f|^2-1) + 2s(1-Re(conj(f)*u))`.

The second term is nonpositive and `s/r<=1/eta`. At r=0, the left side is
`|f|^2<=1`, which equals the stated residual bound.

For an actual pair with `J=M-delta`, each unilateral best-response defect
is at most delta. Bessel therefore gives the necessary coupled-image bounds

`||x-c(B_eta(p))||^2 <= 2delta/eta + R_eta(p)`,
`||y-c(B_eta(q))||^2 <= 2delta/eta + R_eta(q)`.

In particular,

`delta >= (eta/2) (||x-c(B_eta(p))||^2-R_eta(p))_+`,

and the analogous inequality for y. Both x and the clipped response moment
are evaluated in the same image basis. R is a bounded scalar potential with
no singularity. This condition can reject high proposed image states by a
nonzero image-closure mismatch even when no positive jump gain is available.

There is also a weaker payoff-only consequence. Put

`d=(J-J(B_eta(p),B_eta(q)))_+`.

Using the disk bounds and `||Lambda||<=1`,

`d <= sqrt(2delta/eta+R_eta(p))+sqrt(2delta/eta+R_eta(q))`.

Squaring and applying Cauchy-Schwarz yields

`delta >= (eta/8) (d^2-2(R_eta(p)+R_eta(q)))_+`.

These constants are conservative. Their benefit is a zero-safe necessary
condition in the correct direction, rather than a new endpoint. For nonzero
Gaussian polynomial images, `R_eta(p)` tends to zero as eta tends to zero;
using an explicit eta requires certified small-image integration. In contrast,
a positive image-mismatch norm cannot be inferred from a marginal law alone.

The exact checker additionally tests 504 instances of the pointwise bound.
On the same projection fixture, the nonstationary actual pair `f=g=one` has
`J=-149/200`, p and q equal `-epsilon one`. At eta=1/4, the clipped image
coefficient mismatch squared is 4 and R is zero, giving the exact necessary
gap floor 1/2. The actual global gap is 349/200. This calibrates the inequality
direction without claiming that this easy state models a binding Gaussian
configuration.

## 6. Where to spend computation next

Use the actual two-sided image tensors from a candidate that lies in the
binding range. Compute a small dictionary of **finite** shifts in their
retained visible and remote cubic directions, with clipped phases. Fit/evaluate
response moments on independent rules, as in the previous Hessian diagnostic.
Search for a gain well above both integration error and the clipping/box
allowance before designing an interval cover.

The diffuse independent-cubic contact has exact second-order flat sectors.
Those sectors must remain in the model. A positive jump there must be checked
against exact conditional integration and genuine finite amplitudes; a sampled
negative Hessian eigenvalue is insufficient evidence. This note supplies a
zero-safe test and an exact strict-strength fixture, not evidence that the
binding Gaussian states have already been excluded.

## Replay

```
python3 -I tools/coupled_jump_exact.py \
  --out handoff/research-third-decimal/coupled-image-20261023/jump/exact-replay.json
```

The script uses only Python's standard library and exact rational complex
arithmetic. It checks both projection identities, orthogonality, Hermitian
symmetry, T squared, the full Hessian LDL certificate, the finite-jump gain,
64 additional exact jump identities, 84 clipping-loss cases, 1,764 exact
nonexpansiveness cases and 504 clipped-consistency cases. It refuses optimized Python. The written projection
argument proves the clipping inequality for all complex points; finite cases
are diagnostic replay, not a substitute for that proof.
