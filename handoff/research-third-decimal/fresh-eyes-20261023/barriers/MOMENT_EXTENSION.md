# An extension barrier for the scalar AMMP moment matrices

23 October 2026. **Written proof, with an exact finite construction.** No
Gaussian-cubic realizability, objective preservation, or Grothendieck endpoint
is asserted.

The proposed extension argument is correct after one base-case repair:
`M3>=0` alone does **not** imply `M2>=0`. Both must be included. In the
normalized research regime `m1=1, m2=2+x^2`, the missing `M2` condition is
automatic.

The resulting statement is stronger than a finite-order observation: without
upper moment-growth constraints, the entire infinite family of these scalar
matrices has no additional projection onto the first three radial moments.
This concerns the matrices on powers of **one real part**. It does not concern
every multivariate/charge-resolved spectral constraint involving Gamma fields.

## Definitions and precise theorem

Let `m0=1` and let `m_r` denote proposed moments `E U^r` of a nonnegative
random variable. Define formal real moments

```
s_(2r) = C_r m_r,       C_r = binom(2r,r)/2^r,
s_(2r+1) = 0.
```

These are the moments of `X=sqrt(2U) cos(Theta)` when `Theta` is uniform
on the circle and independent of `U`. For `k>=1`, put

```
M_k[i,j] = (k - i*j/(i+j-1)) s_(i+j),       0<=i,j<=k.
```

At `i+j=1`, the quotient term is defined to be zero, so that entry is
`k s1=0`. At `i=j=0`, the ordinary quotient is `0/(-1)=0`, and
`M_k[0,0]=k`. In particular `M1=diag(1,0)`.

**Theorem.** Suppose `m1>0` and

```
m2 >= 2 m1^2,
m3 >= 3 m2^2/(2 m1).
```

Then there is an infinite sequence `(m_r)_(r>=0)`, retaining these four
prescribed entries, with the following properties:

1. It is the moment sequence of a probability measure on `[0,infinity)`;
   every moment is finite.
2. Every unshifted and once-shifted Stieltjes Hankel matrix is positive
   definite.
3. Every `M_k` is positive semidefinite, and `M_k` is positive definite
   for all `k>=4`.

If the prescribed moments are rational, the extension can be chosen rational
at every finite order.

Conversely, any circular radial moment sequence with `m1>0` satisfying all
`M_k>=0` satisfies the two displayed inequalities. Thus they describe exactly
the projection of this **unrestricted** infinite scalar hierarchy onto
`(m1,m2,m3)`.

## The base case, including the missing hypothesis

Write

```
A_r = (m_(i+j))_(i,j=0..r),
B_r = (m_(i+j+1))_(i,j=0..r).
```

The even and odd blocks of `M2` are

```
[[2, 2m1], [2m1, m2]],       [m1].
```

The blocks of `M3` are

```
[[3, 3m1], [3m1, (5/2)m2]],
[[2m1, 3m2], [3m2, 3m3]].
```

For `m1>0`, the theorem's inequalities are precisely `M2>=0` together
with the nonredundant part of `M3>=0`. They also imply

```
m2-m1^2 > 0,
m1*m3-m2^2 > 0,
```

so `A1` and `B1` are positive definite. This supplies the strict truncated
Stieltjes conditions; no separate assumption is needed in the theorem.

To see why `M2` cannot be omitted, take

```
(m0,m1,m2,m3) = (1,1,3/2,4).
```

Both `A1` and `B1` are positive definite, and both blocks of `M3` are
positive definite. But the even block of `M2` has determinant `-1`.

## The real Hankel matrix stays positive definite

Assume the moments through `m_(k-1)` are fixed and all available `A_r,B_r`
are positive definite. Let

```
H_(k-1)^X = (s_(i+j))_(i,j=0..k-1).
```

After splitting even and odd indices, its two blocks have entries

```
C_(a+b) m_(a+b),
C_(a+b+1) m_(a+b+1),
```

respectively. Each is an entrywise product of an available positive-definite
radial Hankel matrix with an angular Hankel matrix.

Indeed `C_r` is the moment sequence of `Y=2 cos^2(Theta)`. The ordinary
and shifted Hankel matrices for `Y` are positive definite because its law
has a positive density throughout `(0,2)`. The Schur product theorem now
gives `H_(k-1)^X>0`. One can also see strictness directly: if `A>=lambda I>0`
and `D>=0` has positive diagonal, then

```
A o D >= lambda (I o D) = lambda diag(D) > 0.
```

All matrices in this argument use only moments already specified through
`m_(k-1)`.

## Two Schur complements choose the next moment

For `k>=4`, the top-left `k`-by-`k` block of `M_k` is exactly

```
T_k = M_(k-1) + H_(k-1)^X.
```

It is positive definite. The last column above the diagonal depends only
on old moments: its highest real moment is `s_(2k-1)=0`; the highest
nonzero one is `s_(2k-2)`. Call this column `b_k`.

The only appearance of the new radial moment `m_k` is the last diagonal,
whose coefficient is

```
d_k = (k-k^2/(2k-1)) C_k
    = k(k-1) C_k/(2k-1) > 0.
```

Consequently

```
m_k > b_k^T T_k^(-1) b_k / d_k
```

makes `M_k` positive definite.

At the same step only one new Stieltjes block becomes available:

- If `k=2r`, it is `A_r`. Its leading block is `A_(r-1)>0`, and its
  new last diagonal is `m_k`.
- If `k=2r+1`, it is `B_r`. Its leading block is `B_(r-1)>0`, and its
  new last diagonal is again `m_k`.

All entries in the new last column except that diagonal are old moments.
A second finite Schur-complement threshold therefore makes this block
positive definite. Choose `m_k` strictly above the maximum of the two
thresholds. All earlier constraints retain their values. This proves the
inductive step, and a rational choice is available if the old data are rational.

## Infinite realization and the exact projection claim

The induction defines one consistent infinite sequence, with every finite
`A_r` and `B_r` positive definite. The one-dimensional Stieltjes moment
theorem therefore supplies a measure on `[0,infinity)` realizing the whole
sequence. Its mass is `m0=1`; its moments are finite by construction.

The criterion used here is the one-dimensional positivity criterion recalled
in §2, equation (4), of Schmüdgen,
[The Stieltjes condition and multidimensional K-moment problems](https://doi.org/10.1007/s00013-021-01599-9).
It requires positivity of the unshifted and shifted Hankels. The additional
growth condition in that paper's multidimensional theorem is not needed for
this one-dimensional existence step. No uniqueness of the measure is asserted.

Taking `q=sqrt(U) exp(i Theta)` produces an actual circular random variable
with exactly the constructed radial moments and all the `M_k>=0`. It need
not be a Gaussian polynomial. Conversely the `M2,M3` blocks prove the two
necessary inequalities directly, establishing the projection statement.

The same proof works from any finite prefix of order `L>=3` for which
all available Stieltjes Hankels are positive definite and every `M_j>=0`
for `2<=j<=L`: no later matrix of this family imposes a new restriction
on that fixed prefix when higher moments have no upper bounds.

## A small exact construction and the limits of the lemma

Starting with the Gaussian radial moments `(1,1,2,6)`, the two thresholds
at `k=4` are `24` (spectral) and `20` (Stieltjes). Thus `m4=25` is allowed,
although an exponential radial law would have `m4=24`. Choosing the smallest
integer strictly above both thresholds at later steps gives

```
(m0,...,m10) = (1,1,2,6,25,136,908,7084,62517,611791,6558924).
```

`tools/fresh_barrier_moment_extension.py` checks this prefix with exact
fractions, verifies both Schur conditions and every new positive-definite
matrix, and checks the counterexample to omitting `M2`. Its ledger is
`moment-extension-example.json`. The infinite assertion rests on the written
induction and the Stieltjes theorem, rather than on a finite numerical run.

The Gaussian first three radial moments with `m4!=24` also show that all these
scalar matrices alone do not enforce the fourth-moment rigidity of genuine
Gaussian chaos. That rigidity uses additional Gaussian integration-by-parts
and contraction information.

This lemma imposes **no** finite-chaos upper moment-growth bounds. Higher
moments can be chosen arbitrarily far above the two lower thresholds, so no
such bounds could follow from the construction. It does not retain the old
671 Stein cuts, conditional contraction budgets, prescribed projection fields,
or the table objective. In particular it does **not** prove that a chosen
law's `E Psi` is unchanged by extension, nor that an infinite hierarchy plus
the existing Stein/cumulant constraints has the same optimum. The separately
verified radius-16 to radius-128 repairs supply only the stated finite-order
objective evidence.

This is therefore a structural reason to pair this scalar hierarchy with
conditional tail or joint-image information, not a proof that every possible
spectral or moment refinement is ineffective. No Lean theorem or endpoint
has changed.
