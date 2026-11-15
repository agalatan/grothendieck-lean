<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/REGIONAL_DIRECT_BOUND.md, 2026-11-15 13:17; Agent-ID: codex-91d4. -->
# A direct all-sector bound on a global energy region

Agent-ID: **codex-91d4**. 15 November 2026. Refs #436.
**P+C, independently re-derived and replayed by claude-b9ee:** see
[review](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6893452582).
The analytic derivation was also checked by the joint-geometry subagent;
`verify_region.py` supplies exact rational integral and scalar checks.
This is not a Lean theorem. The reviewer reproduced the strict reserve
`2450605305948712183678939499/10^34 > 2.45e-7`.

The result covers the stated **energy half-space**, in every finite dimension
and with arbitrary sharing of the genuine remote fields. It uses no premise
(P), no compact conditioned-core cover and no averaged Psi assumption. It does
not cover the whole task cap or prove the universal averaged Psi inequality.

## Statement and definitions

Let Z be proper standard complex Gaussian, independent of the remote Gaussian
space. Put T=|Z|² and

```
a=699/1250, b=179/1250, p=2500/1891,
s=3/5, rho=5053/10000, L=Z(a+bT).
```

Let q in H_(2,1), r_A,r_B in H_(1,0), Q in H_(1,1), P in H_(2,0),
and nu a complex constant. The remote fields may share all their variables.
Set

```
G=q+(T−1)r_A+Z²conj(r_B)/sqrt(2)
    +ZQ+conj(Z)P+nu Z(T−2)/sqrt(2),
u=||q||², E_A=||r_A||², E_B=||r_B||², V=E_A+E_B,
W_Q=||Q||², W_P=||P||², W_nu=|nu|².
```

For the fixed full trial `xi0=−s(r_A+rho r_B)`, with visible coefficient c=0,
define

```
F_xi0(G)=||xi0||²+E|L+G−xi0|+E|L−G+xi0|−p||G||².
```

The exact checker certifies

```
F_xi0(G) ≤ B0+(771/500)u+(43/250)V
                   −(16/125)(W_Q+W_P)−(33/100)W_nu,
B0=(387/500)sqrt(pi).
```

Consequently, on the region

```
(771/500)u+(43/250)V−(16/125)(W_Q+W_P)−(33/100)W_nu
 ≤ 1087/500000 = .002174,                            (R)
```

one has `F_xi0(G)<S+10^(−4)`. The retained infimum is at most this explicit
trial, so the same regional upper bound holds for LambdaHat(G).

The analytic estimate itself does not require the task's total/ellipsoid cap;
in the task it is applied to the intersection with that cap. Region (R) is
not the whole cap. For instance, the pure remote energy u=.0403448 with all
other energies zero lies outside (R).

## Parallelogram at the unperturbed radial core

For complex l,h with l nonzero,

```
|l+h|+|l−h| ≤ 2sqrt(|l|²+|h|²)
             ≤ 2|l|+|h|²/|l|.                      (1)
```

The first step is Cauchy-Schwarz and the parallelogram identity; the second
is the tangent inequality for sqrt. Apply (1) to `H=G−xi0` at L. Since a>0,
L is nonzero almost surely. The possible inverse factor at Z=0 causes no
integrability problem: the moments used below are finite, including I_0.

Thus

```
F_xi0(G) ≤ B0+||xi0||²+E[|H|²/|L|]−p||G||².        (2)
```

The baseline is exactly
`B0=2E[sqrt(T)(a+bT)]=sqrt(pi)(a+3b/2)`.

## Why arbitrary sharing creates no missing cross terms

Write k=(T−2)/sqrt(2). The visible harmonics of H are

```
frequency  0: q+(T−2/5)r_A+s rho r_B,
frequency  2: T exp(2i theta)conj(r_B)/sqrt(2),
frequency  1: sqrt(T)exp(i theta)(Q+k nu),
frequency −1: sqrt(T)exp(−i theta)P.
```

The weight `1/|L|=1/[sqrt(T)(a+bT)]` is radial and has no remote dependence.
Different visible harmonics are therefore orthogonal even with this weight.
In the frequency-zero block, `E[q conj(r_A)]=E[q conj(r_B)]=0` by remote
Hermite bidegree orthogonality. The only surviving off-diagonal term is the
correlation between r_A and r_B. In frequency one, `E Q=0` removes Q/nu.
None of these statements requires independence among remote fields.

Define

```
I_k=∫_0^∞ t^(k−1/2) exp(−t)/(a+bt) dt,  k=0,1,2,3,
zeta=E[r_A conj(r_B)].
```

Direct integration now gives exactly

```
E[|H|²/|L|]
 = I0 u+(I2−(4/5)I1+(4/25)I0)E_A
   +(s²rho² I0+I2/2)E_B
   +2s rho(I1−(2/5)I0)Re(zeta)
   +I1(W_Q+W_P)+(I3−4I2+4I1)W_nu/2.                (3)
```

The genuine sectors of G are also mutually orthogonal under the ordinary
Gaussian law and have the stated normalizations, so
`||G||²=u+V+W_Q+W_P+W_nu`. Also
`||xi0||²=s²(E_A+rho²E_B+2rho Re(zeta))`.

Combining with (2) produces the Hermitian A/B form with real coefficients

```
M_AA=s²+I2−(4/5)I1+(4/25)I0−p,
M_BB=s²rho²(1+I0)+I2/2−p,
M_AB=s²rho+s rho(I1−(2/5)I0),
```

and scalar coefficients `I0−p`, `I1−p`, and
`(I3−4I2+4I1)/2−p` for u, W_Q+W_P, W_nu respectively.
This is a quadratic estimate at L itself. It does not import an inverse-norm
bound at a singular conditioned A/B core.

## Global polynomial envelopes for each radial integral

Set c=a/b>0 and alpha=k+1/2. If T_alpha has normalized Gamma density
`t^(alpha−1)exp(−t)/Gamma(alpha)`, then

```
I_k=Gamma(alpha)/b * E[1/(T_alpha+c)].               (4)
```

For **any** real polynomial P with P(−c) nonzero, define

```
ell_P(t)=[1−P(t)²/P(−c)²]/(t+c).
```

Its numerator vanishes at −c, so ell_P is a polynomial. For t>=0,

```
1/(t+c)−ell_P(t)=P(t)²/[P(−c)²(t+c)] >=0.           (5)
```

Similarly, for any real polynomial Q with Q(−c) nonzero,

```
u_Q(t)=[1+t Q(t)²/(c Q(−c)²)]/(t+c)
```

is a polynomial and

```
u_Q(t)−1/(t+c)=t Q(t)²/[c Q(−c)²(t+c)] >=0.         (6)
```

These inequalities hold on the **entire** positive half-line; no truncation,
tail omission, numerical quadrature theorem or root enclosure is involved.
All polynomials are integrable under the Gamma law. Their expectations are
exact rational combinations of the rising-factorial moments
`E T_alpha^j=alpha(alpha+1)...(alpha+j−1)`.

The checker chooses a monic Laguerre polynomial P of degree 12 and a shifted
shape polynomial Q of degree 11. The recurrence merely provides effective
rational coefficients. Soundness uses only (5)-(6), nonzero denominators,
exact polynomial division and exact Gamma moments; it does not rely on the
Laguerre zeros, orthogonality or Gaussian-quadrature exactness theorem.

Finally `Gamma(k+1/2)=sqrt(pi) product_(j=1)^k(j−1/2)`. The checker obtains
an upper square root from `sqrt_up(pi_hi)` and a lower one from
`1/sqrt_up(1/pi_lo)`, where pi_lo/pi_hi are the previously checked rational
Machin bounds. Both directions are correct. The positive lower and upper
Gamma expectations may therefore be multiplied by these endpoints.

## Exact coefficient and regional checks

Let L_k<=I_k<=H_k be the resulting rational interval endpoints. The checker
uses H for positive coefficients and L for negative coefficients. In
particular its nu upper endpoint is `(H3−4L2+4H1)/2−p`.

For the matrix it forms diagonal upper bounds Aup,Bup and an absolute
off-diagonal upper bound Cabs from both endpoints. It verifies

```
lambda−Aup>0, lambda−Bup>0,
(lambda−Aup)(lambda−Bup)−Cabs²>0,  lambda=43/250.
```

These inequalities imply `M<lambda I` by the two-by-two positive-definite
criterion, and hence bound the integrated A/B form by lambda V for arbitrary
correlation of the two linear forms. The scalar checks certify

```
I0−p <771/500,
I1−p <−16/125,
(I3−4I2+4I1)/2−p <−33/100.
```

The inherited benchmark lower bound is
`S>13739535256614/10^13=1.3739535256614`, from bundled STATUS §3.14.
It is an external previously reviewed certificate, not reproved by this code.
Using the rational upper bound for B0, the exact new check proves

```
S_lower+1/10000−B0_upper−1087/500000
 =2450605305948712183678939499/10^34
 >245/10^9.
```

This supplies more than `2.45e−7` strict reserve in the final regional
comparison with `S+1e−4`. No numerical optimizer or sampled tensor enters
the acceptance path. Decimal integral endpoints in the JSON are explicitly
display-only; acceptance uses rational endpoints throughout.

## Independent audit and replay record

The joint-geometry subagent re-derived the harmonic expansion, all surviving
cross terms, the Gamma normalization, both global polynomial envelope signs,
and the matrix domination argument. Fresh execution of `verify_region.py`
passed and reproduced `region_result.json`. No defect was found.

Reviewed source hashes:

```
verify_region.py
3a42db17629eec10d99a1197e26879f617238d94d34f00f7c5b62e540119712b
verify_primitives.py
9a0bee97cef9faf2ae508893584af7855893463be3e7739f7c6f5417ada837d8
```

Replay from this directory using standard-library Python:

```sh
python3 -I verify_region.py
```

The regional theorem and its exact arithmetic certificate are complete at
this author/internal-review level. The complementary energy region, the
universal averaged Psi premise and the whole-cap theorem remain open.
