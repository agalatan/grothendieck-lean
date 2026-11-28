# Continuous energy exclusions from the Rice gate

Agent-ID: codex-062a. Refs #623. **P + C, author only.** The proof uses the 19 existing single-test Farkas certificates in the [parent proof, §2.3](../degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md). It applies in every dimension.

Let $e=39/50$, $u=\mathbb E|q|^2>0$, $U=|q|^2/u$, and $\chi=\mathbb E U^2-2$. The Rice gate (R1) requires $\mathbb E\rho(a^2uU)\ge t+a u/e$ for **every** $a>0$.

## One positive Rice multiplier

Choose a source certificate with exact table energy $s>0$, lower threshold $t_s$ (the verifier's binary64 value), and certified excess interval containing $\chi$. Write $\lambda>0$ for its only active Rice test and $m>0$ for its multiplier. For every such cubic, (R1) is impossible whenever

$$
u\ \ge\ \frac{\big[ s+(e/\lambda)(t_s-t-1/(2m))\big]_+^2}{s},\qquad [y]_+=\max(0,y).
$$

To see this, scale $q$ by $\sqrt{s/u}$. Its normalized variables $U,v,r$ from §2.3 and its excess are unchanged. Let $P\ge\rho$ be the parent verifier's global upper polygon. In infeasibility mode its pointwise certificate has constant offset $1$. The sole Rice contribution is $m(P(\lambda^2 sU)-t_s-\lambda s/e)$. The remaining terms have nonnegative expectation by the normalized moment, Stein and Gram constraints, with equalities contributing zero. Both profile slice multipliers vanish, and the verifier omits the profile objective. Its compact-interval and tail bounds therefore give

$$
\mathbb E\rho(\lambda^2sU)\le\mathbb E P(\lambda^2sU)\le t_s+\lambda s/e-1/m .
$$

The source certificate covers $s$ by outward rounding and this expectation bound needs no gate assumption on the rescaled cubic. At the target, test (R1) at $a=\lambda\sqrt{s/u}$, so the argument of $\rho$ is exactly the same. The displayed cutoff gives $t+\lambda\sqrt{su}/e\ge t_s+\lambda s/e-1/(2m)$, exceeding the expectation bound by at least $1/(2m)$. This also proves exclusion at the cutoff itself when it is positive. Larger $u$ and larger $t$ preserve exclusion. No row profile enters this transfer.

## Consequences of the unit margin alone at the end of the design table

For $39\le\chi\le42$, the following sufficient energy cutoffs hold at the exact **left** threshold of each piece and hence throughout it. The last column gives the first eight-decimal threshold inside the piece where the unit-margin test reaches the largest listed energy node. At and above that threshold the exclusion includes every energy from that node upward.

| Piece | Sufficient $u$ at the left threshold (rounded up) | Largest listed $u$ | First eight-decimal $t$ reaching that node |
|---|---:|---:|---:|
| 18 | 0.01973004 | 0.019461697561785344 | 0.86696928 |
| 19 | 0.01512316 | 0.013921953999498488 | 0.87401059 |
| 20 | 0.01082853 | 0.007929634325071395 | 0.88348334 |
| 21 | 0.00757856 | 0.002155699369223745 | Outside the piece, even at its right endpoint |

For pieces 18 and 19 the left-threshold cutoffs lie strictly below the corresponding tabulated energy caps. For pieces 20 and 21 they lie above those caps. This gives exclusions for a portion of the omitted high-excess region. The remaining energies and the rest of the content-law task stay open.

The [verifier](../../code/rice-energy-exclusion-codex-062a/verify.py) runs the parent receipt audit, binds each witness to its exact source energy, and computes the minimum eligible cutoff as a rational number. It prints cutoffs for all 21 pieces and all five distinct lower excess endpoints. The threshold comparison at the last node is exact, including its predecessor on the eight-decimal grid. Run from the repository root:

```sh
python3 -IBO research/higher-degree/code/rice-energy-exclusion-codex-062a/verify.py
```

## Keeping the actual fourth and sixth moments

Write $x=\chi$, let $[L,H]$ be the source witness's excess interval, and denote its nonnegative multipliers `mu_u2_lo`, `mu_u2_hi`, `mu_u3` by $A,B,C$. The parent moment bound is $\mathbb E U^3\le M(x)$, where $M(x)=6+9x+(4045313/100000)x^{3/2}$. The source pointwise certificate was checked on every $U\ge0$ and every admissible pair of normalized Stein coordinates. The endpoints $L,H$ enter its moment constraints as constants. Its pointwise inequality can therefore still be averaged against a target law whose fourth excess lies below $L$.

For a law of excess $x\in[0,H]$, the signed moment contribution in the averaged certificate is
$$
A\big(\mathbb E U^2-(2+L)\big)+B\big((2+H)-\mathbb E U^2\big)
   +C\big(M(H)-\mathbb E U^3\big)
\ \ge\ S(x):=A(x-L)+B(H-x)+C\big(M(H)-M(x)\big).
$$
Here $\mathbb E U^2=2+x$. For $x<L$ the first term is negative and must be included with its sign. All other non-Rice terms retain their nonnegative expectations as in the single-test proof above. Since $M$ is convex and $C\ge0$, $S$ is concave. On an entire target interval $[a,b]\subseteq[0,H]$ its minimum is attained at an endpoint. For any rational $d\le\min(S(a),S(b))$, the same Rice test now excludes that entire interval whenever
$$
u\ge \frac{\left[s+\frac e\lambda\left(t_s-t-\frac{1/2+d}{m}\right)\right]_+^2}{s},
\qquad u>0.
$$
Indeed, the averaged witness bounds the Rice expectation above by $t_s+\lambda s/e-(1+d)/m$, while the gate at the rescaled argument requires at least $t_s+\lambda s/e-(1/2+d)/m$. Their separation is $1/(2m)>0$, including when $d$ is negative. Each whole interval uses one witness for both endpoints. The replay encloses both square roots with integer square roots on a $2^{-64}$ grid, rounding $H\sqrt H$ down and $x\sqrt x$ up.

At the exact left threshold of every design piece, the verifier compares all fifteen excess bins at every listed energy with the exclusions using the unit margin alone. The count rises from **13 to 40 whole bins**. The 27 additions all have an omitted allowance in the funded row. Pieces 1–4 contribute 1, 2, 1 and 1 additions, pieces 5–7 contribute 6, 4 and 2, and pieces 8–17 contribute one each. Pieces 18–21 contribute zero at these nodes and left thresholds. Each counted bin stays excluded at larger Rice thresholds and energies.

The following intervals also show how far the witness enters a partially covered bin. Each row uses its largest listed energy and the exact left threshold of its piece.

| Piece | Listed energy $u$ | Excess interval excluded |
|---|---:|---:|
| 5 | 0.15173024215799652 | [9.88, 42] |
| 6 | 0.13237229990180577 | [12.57, 42] |
| 7 | 0.11301435764561502 | [18.39, 42] |
| 16 | 0.02842691662135493 | [33.94, 42] |
| 17 | 0.022964984896238324 | [34.41, 42] |

On pieces 16 and 17 this narrows the previously open high-excess region at those nodes to $(24,33.94)$ and $(24,34.41)$ respectively, as far as these Rice exclusions go. The [same replay](../../code/rice-energy-exclusion-codex-062a/verify.py) checks each displayed lower endpoint and verifies that the preceding hundredth does not meet the sufficient test.
