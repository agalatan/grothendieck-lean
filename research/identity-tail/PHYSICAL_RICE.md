# The physical residual scale of the two sparse Stein rows

For the identity-tail witness, the hat cap is at most $35317721199/50000000000$. The transfer gives
$K_G^{\mathbb C}\ge 100000000000000/71325509501647>1.4020229325$. This is a paper proof with
an exact rational replay. The current Lean theorem uses the cap in [row 5.13](CURVED_SCHUR.md).

## Which residual the rows use

Work in the coordinate frame of the identity-tail proof, with $h=(f+g)/2$, $k=(f-g)/2$,
$|f|=|g|=1$, and $P_{1,0}h=tZ$ for a standard proper complex Gaussian visible coordinate $Z$.
Let $R$ be the orthogonal projection of $\mathbb E[k\mid Y]$ onto the remote $(2,1)$ chaos
in the independent coordinates $Y$, and put $\tau=\|R\|_2$. The zeroth visible fibre function
is the constant one. Thus $R$ is precisely `pres`, and `circularSharedReduction_frame` instantiates
the common scale of rows 08 and 09 with $\tau$. Their Stein argument uses $\sigma=\delta\tau$,
where the same $\delta=7263870357719407/9007199254740992$ occurs in both headers.
The common variables and their normalization can be read directly in the
[frame construction](../../Grothe/LowerAnalytic/RowGaussian.lean) and the
[consumer](../../Grothe/LowerAnalytic/SparseSteinRows.lean).

Suppose $\tau>0$ and write $q=R/\tau$. Projection gives
$\operatorname{Re}\mathbb E[\bar Z h]=t$ and $\operatorname{Re}\mathbb E[\bar q k]=\tau$.
For each real $\lambda\ge0$, splitting $h,k$ into $f,g$ and taking absolute values gives
$$t+\lambda\tau\le\tfrac12\mathbb E[|Z+\lambda q|+|Z-\lambda q|].$$
Both expectations agree by the symmetry of $Z$ conditional on $Y$.

## A scalar Rice estimate

Set $\mu=\mathbb E|Z|=\sqrt\pi/2$. For fixed $w\in\mathbb C$,
$$\mathbb E|Z+w|\le\mu(1+|w|^2/2).$$
Indeed $X=\operatorname{Re}Z$ has even density $e^{-x^2}/\sqrt\pi$ and
$\mathbb E|X|=1/\sqrt\pi$. For any real $b$, symmetry and the identity
$(|x+b|+|x-b|)/2=\max(|x|,|b|)$ give
$$\mathbb E|X+b|-\mathbb E|X|
 =2\int_0^{|b|}(|b|-x)e^{-x^2}\,dx/\sqrt\pi
 \le b^2/\sqrt\pi.$$
Average this inequality with $b=\operatorname{Re}(we^{i\theta})$ over uniform $\theta$,
using circularity of $Z$. The angular means of $|\operatorname{Re}(ve^{i\theta})|$
and $\operatorname{Re}(ve^{i\theta})^2$ are $2|v|/\pi$ and $|v|^2/2$. The integrands
are integrable by the triangle inequality. This proves the estimate.

Conditioning on $q$ in the support inequality and using $\mathbb E|q|^2=1$ yields
$t+\lambda\tau\le\mu(1+\lambda^2/2)$. Set $\lambda=\tau/\mu$ to conclude
$$\boxed{\tau^2\le 2\mu(\mu-t).}$$
When $\tau=0$, use the visible support $t\le\mathbb E|Z|$. This argument works in
every finite dimension; the one-coordinate case has zero remote energy. A sharper
nonzero-shift tangent was derived in [the Conjecture K response argument](../conjecture-K/sources/reaudit-2026-11-15-codex-a7c4/FOUNDATIONS.md).
The zero-shift estimate alone suffices here.

## Exact finite envelope

For an amplitude segment with lower endpoint $l$ and proposed cut $c$, the replay checks
$$2(886227/10^6)(886227/10^6-l)\delta^2\le c^2,$$
using $\mu<886227/10^6$ and $t\le\mu$. The admissible scales are therefore in $[0,c]$.
The following indices are the zero-based cells of the existing 38-cell schedule.

| Amplitude cells | Upper bound for $\sigma$ |
|---|---|
| 21–24 | $121/500$ |
| 25 | $1179/5000$ |
| 26 | $471/2000$ |

Intersect each of the 945 existing common affine chords with $[0,c]$ and
maximize the original quadratic exactly on the surviving closed segment. Minimizing the
deduction over all those pieces gives a valid endpoint price. Both the ordinary and the
$\sigma\le21/100$ prices are rounded down to the $10^{-13}$ grid. All three cuts exceed
$21/100$, so the old small-scale envelopes apply to the same points. The
[Schur curvature argument](CURVED_SCHUR.md) then gives the same two-scale interpolation on
every segment with these improved endpoint prices. The other 32 amplitude cells retain
their original estimates. The final maximization is over $[0,9/10]$, which contains
every physical amplitude. Outer cell 14 determines the rounded cap.
The correction to the old lower bound comes from excluding unattainable residual energies.

Run `python3 -IB -O research/identity-tail/code/physical_rice_scale.py` from the repository
root. Removing all six cuts reproduces the old cap and the old binding cell 23. Replacing
the cell-26 cutoff by $0.234$ is rejected by the physical feasibility test.
[Exact replay](code/physical_rice_scale.py)
