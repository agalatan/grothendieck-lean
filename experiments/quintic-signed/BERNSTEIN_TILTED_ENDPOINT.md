# Bernstein integration of the tilted fifth-chaos prices

The 57 physical pieces certify a signed witness with first-chaos weight
$w=0.0000706057$ and fifth debit $d=10^{-8}$. Its absolute scalar payoff is
at most $7132538089155/10^{13}$. The [finite-matrix transfer](lean/QuinticResearch/SignedVector.lean)
therefore gives a reciprocal greater than **1.40202546064**.
The same rows and radial estimates give **1.40202546477** after setting
$d=0$ and retuning to $w=0.0000705727$.
At the signed witness's own weight and $t=.885883261556534$, the sparse price
and tilted radial price at zero debit *both* exceed its certified cap.
These comparisons measure the costs of the certificates. The all-amplitude
calculation has an exact rational replay, and the tilted argument still requires
an end-to-end Lean proof.

The [joint cubic projection estimate](JOINT_CUBIC_RICE.md) keeps every visible cubic in the physical Rice budget and improves both controls on the same sparse pieces.

## Integrating the reciprocal denominator

Keep the [tilted proof](TILTED_SIGNED_ENDPOINT.md), its notation and $u=1$.
Let $T=|Z|^2$ have density $e^{-T}$ on $[0,\infty)$ and write $r=\sqrt T$.
Let $x$ be the effective debit $d/(1-w)$, with $0\le x\le 1/10000$.
For $m\in\{1,2\}$ a lower polynomial for the ordinary or angular denominator is
\[
 D_{m,x}(r)=2\nu+m\mu_Lr\left(\alpha-s-\frac\beta2-\frac{3x}8
           +\left(\frac\beta4+\frac{3x}8\right)r^2-\frac{x}{16}r^4\right),
 \qquad \mu_L=.886226925452757<\sqrt\pi/2 .
\]
The quadratic in $T$ is concave and positive at $T=0,140$ for both endpoints
of $x$. This gives positivity through $140$, including the integration window.
The original rational estimate for the tail where the visible radial
polynomial may become negative still applies.

For $N$ cells set $r_i=6(i/N)^2$. At each $r_i$ take the larger of
$1/D_{m,0}(r_i)$ and $1/D_{m,1/10000}(r_i)$. Join consecutive values by
an affine function $L_i(T)$ of **squared radius**. On each closed radius
interval the checker verifies that all Bernstein coefficients of the
degree-at-most-seven polynomial
\[
       L_i(r^2)D_{m,x}(r)-1
\]
are nonnegative for both endpoint debits. The Bernstein basis is nonnegative on
its interval. By affine dependence on $x$ this proves the upper bound for the
whole range of debits.

Each nonnegative Hermite numerator $H(T)$ is a fixed polynomial. We integrate
$H(T)L_i(T)e^{-T}$ on the entire cell. For $P(T)=H(T)L_i(T)$ set
$F=\sum_{j=0}^{\deg P}P^{(j)}$. Then $F-F'=P$, so the integral on $[a,b]$
equals $F(a)e^{-a}-F(b)e^{-b}$. Each endpoint uses a rational interval for the
exponential, including the sign of the boundary factor. For $n=2^{32}$ and
$0\le T\le36$ we use
\[
 (1-T/n)^n\le e^{-T}\le(1+T/n)^{-n}.
\]
These inequalities follow from $1+y\le e^y$ for both signs of $y$.
We round the two starting bases outwards on the grid $2^{-100}$ and repeat
directed squaring 32 times. The last part of each trace past $T=36$ costs
at most $\int_{36}^{\infty}T^5 e^{-T}\,dT/(2\nu)$ by the degree and
coefficients of the Hermite numerators. The estimate for bidegree $(1,0)$
uses the visible constant shift $-3/8$, including its first-mode price
$\beta(3/8)^2/\alpha$.

| Chords | Tilt $s$ | Paid cubic $\gamma$ | Residual $\beta-s-\gamma$ | Largest trace |
|---:|---:|---:|---:|---:|
| 32 | .10000 | .4825 | .20500 | .99927366 |
| 64 | .10600 | .4830 | .19850 | .99986230 |
| 128 | .10735 | .4832 | .19695 | .99995814 |

The last set of five outward-rounded trace prices is
$.81342285,.63117921,.94020111,.99994384,.99995814$. This replaces
the earlier residual $.2125$ by $.19695$ in the high-amplitude arm.
All 57 sparse prices and fifth floors are inherited. The replay uses the
improved high arm above $.885883261245475$ for the signed witness and above
$.885883261556534$ for the retuned zero-debit comparison. The earlier
57-piece [signed and pure controls](TILTED_SIGNED_ENDPOINT.md) remain
independently reproducible.

Run from the repository root:

```sh
python3 -IB -O experiments/quintic-signed/code/bernstein_tilted_schedule.py
```

The [trace calculator](code/bernstein_tilted_prices.py) and
[57-piece replay](code/bernstein_tilted_schedule.py) use exact rationals.
The 32- and 64-cell alternatives also pass all five trace tests at their stated
residuals.

Agent-ID: codex-a7c4
