# Exact remote K at the flank and upper rows

Agent-ID: codex-a7c4. Let $Z,W$ be independent standard complex Gaussians, $L=Z(a+b|Z|^2)$, $p=1/\varepsilon$ and $B(v)=2\mathbb E|L+\sqrt v W|$. For each of the following two rows, every $q\in H_{2,1}(\mathbb C^n)$ independent of $Z$, including $q=0$, satisfies
$$
 2\mathbb E|L+q|-p\mathbb E|q|^2 < S(p),
 \qquad S(p)=\sup_{v\ge0}\big(B(v)-pv\big).
$$
The supremum over all $q$ and all finite $n$ is exactly $S(p)$. In each row the [independent-dimension Gaussian limit](../fourth-audit-2026-11-15-codex-a7c4/REFORMULATIONS.md) gives the reverse bound by taking normalized independent cubic block sums at energy $v$ and then taking the supremum over $v$.

| Row | $a$ | $b$ | $\varepsilon$ | Reference $v$ | Central energy interval $I$ |
|---|---|---|---|---|---|
| Flank | $14/25$ | $1467/10000$ | $149/200$ | $29798/10^6$ | $[23/1000,13/400]$ |
| Upper | $573/1000$ | $19/125$ | $1891/2500$ | $26153/10^6$ | $[11/500,3/100]$ |

## Gaussian lower witness and the central excess interval

For each profile the [KRAW Rice calculation](../raw-content-2026-11-17-gemini-5331/PROOF.md), §5.2, supplies a degree-eight lower polynomial $B_{\rm lo}(v)$. Its radial derivative recurrence is evaluated at the actual $a,b$. Its degree-zero coefficient, $B(0)=\sqrt\pi(a+3b/2)$, uses the corresponding row. All lower comparisons on the outside rectangles use the exact rational witness $s=B_{\rm lo}(v)-pv$ at the indicated reference energy and therefore $s\le S(p)$.

Set $u=\mathbb E|q|^2$ and, for $u>0$, $\chi=\mathbb E|q|^4/u^2-2$. The [sixth-moment and fourth-moment estimates](../../STATUS.md) in row 3.4 give $0\le\chi\le42$ and $\mathbb E|q|^6\le(6+9\chi+C_6\chi^{3/2})u^3$, with $C_6=4045313/100000$. A nonzero finite cubic has $\chi>0$, since the real projection's third-chaos product formula contains the nonzero contraction $f\otimes_2 f$ with positive trace. On $u\in I$, $\chi\le1/100$, the [row-specific smoothed OU calculation](OU.md) gives $B(u)-2\mathbb E|L+q|>(1/25)\chi u^2$. Thus pricing against $B(u)-pu\le S(p)$ suffices throughout this rectangle.

## Global Hermite upper bounds and the infinite ray

Write $H(z)=2\mathbb E_Z|L+\sqrt z|$. Circular symmetry gives $2\mathbb E|L+q|=\mathbb E H(|q|^2)$. For $a,b>0$ the [radial-profile argument](../audit-2026-11-15-codex-a7c4/REMOTE.md) shows that $H'$ is completely monotone. Indeed, the squared radial density is $e^{-t}/((a+bt)(a+3bt))$ at $z=t(a+bt)^2$. Applying $-d/dz$ preserves nonnegative sums of products $e^{-t}(a+bt)^{-j}(a+3bt)^{-k}$, yielding a complex Gaussian scale mixture. Its Rice profile has completely monotone derivative.

Since $H^{(4)}\le0$, the cubic matching $H,H'$ at any two distinct positive nodes $x,y$ dominates $H$ on $[0,\infty)$. The Hermite remainder has sign given by $H^{(4)}(\xi)(z-x)^2(z-y)^2$; outside the nodes the argument takes place on the interval containing $x,y,z$, and at zero it follows by continuity. We use [the flank nodes](../../code/named-remote-k-codex-a7c4/flank.json) and [the upper nodes](../../code/named-remote-k-codex-a7c4/upper.json). For every node the verifier calls the archived [Arb radial quadrature](../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/profile.py) at the row's actual parameters, including the root and infinite-tail enclosure. It forms the interpolation coefficients with interval arithmetic, rounding each upper endpoint upward to a multiple of $2^{-48}$. This preserves global domination because $z\ge0$.

For every resulting polynomial $P(z)=\sum_{j=0}^3 c_jz^j$ the verifier checks $c_3>0$. Its priced expectation is bounded by
$$
 M_P(u,\chi)=c_0+(c_1-p)u+c_2(2+\chi)u^2+c_3(6+9\chi+C_6\chi^{3/2})u^3.
$$
For fixed $u$ this is convex in $\chi$, so it suffices to check both endpoints of a shape interval. At each endpoint the verifier rounds $\sqrt\chi$ upwards, subtracts the resulting price from $s$, and checks the four rational Bernstein coefficients over the entire energy interval. Pairwise disjoint interiors, exact domain containment and exact area equality show that the closed rectangles, including the central OU rectangle, cover $[0,3/20]\times[0,42]$. At $u=0$ the terms depending on $\chi$ vanish, allowing any shape coordinate.

For $u\ge3/20$, concavity gives $\mathbb EH(|q|^2)\le H(u)$. The verifier encloses $H(3/20)$ and $H'(3/20)$ by fresh Arb quadrature, checks $H'(3/20)<p$, and checks $s+p(3/20)-H(3/20)>0$. The tangent covers the entire remaining half-line.

| Row | Global cubics | Exterior rectangles | Certified $s-(2\mathbb E|L+q|-pu)$ outside the central rectangle |
|---|---:|---:|---:|
| Flank | 14 | 35 | $>95560/10^{12}$ |
| Upper | 13 | 31 | $>672531/10^{12}$ |

## Reproduction

From the repository run both commands. The OU portion uses the Python standard library. The radial quadrature requires python-flint.

```sh
python3 -IB research/conjecture-K/code/named-remote-k-codex-a7c4/ou.py
python3 -IB research/conjecture-K/code/named-remote-k-codex-a7c4/named_rows.py
```

The [exterior verifier](../../code/named-remote-k-codex-a7c4/named_rows.py) reconstructs each global polynomial from two nodes. Its corruption controls remove an energy-shape cell, duplicate a cell, and raise one polynomial's constant coefficient above the price allowance. The [OU verifier](../../code/named-remote-k-codex-a7c4/ou.py) checks the central rectangle independently. These are paper proofs with computational certificates for the isolated remote sector at the two indicated prices.

The strict estimates persist on an open neighbourhood of each row. At fixed visible profiles the verifier also covers explicit closed price intervals. [Local stability and prices](STABILITY.md)
