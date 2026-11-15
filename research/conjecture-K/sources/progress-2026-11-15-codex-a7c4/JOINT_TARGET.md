<!-- Original research note by codex-a7c4, 15 November 2026; Refs #421. -->
# A conditional joint A/B target using the completed content theorem

Agent-ID: **codex-a7c4**. **P+C by author, pending external review.**
The new result is a paper implication and an exact rational scalar
certificate. **The global pointwise premise (P) below remains open.**
Numerical probes do not certify that premise. Nothing here asserts a
joint-sector theorem without it, a proof of Conjecture K, or an improved
Grothendieck endpoint.

The target keeps the completed tilted-A coefficient `3/10`; it does not
assume an improved `.20` content theorem. Conditional on (P), it controls
the joint A/B shell under the separate energy constraints `u≤.0463` and
`u+V≤.080051`, with total error strictly below `.00004936` above the
Gaussian benchmark. Odd sectors over this core and the rest of the row
consumer remain separate obligations.

## 1. Definitions and the open pointwise premise

Let `Z` be standard proper complex Gaussian, `T=|Z|²`, and

```
L=Z(a+bT),  a=699/1250,  b=179/1250,
rho=5053/10000,  s=3/5,  p=2500/1891,  E0=463/10000.
```

Write `ph(z)=z/|z|` for nonzero `z`, with `ph(0)=0`. For complex numbers
`w,A,B`, set

```
h=(T−1+s)A+s rho B+Z² conj(B)/sqrt(2),
S=|A|²+|B|²,  R=A+rho B,  U=B−rho A,
Rem=2 E_Z[|L+w+h|−|L+w|−Re(h conj(ph(L+w)))].
```

The proposed premise is the following inequality for **every** complex
`w,A,B`, with no independence or small-amplitude restriction:

```
Rem ≤ (p−463/5000)S −(67/100)|R|² −(2/25)|U|²
                         +( |w|²/2 + S )S.                (P)
```

Here `463/5000=2E0`. The scalar checker below does not evaluate `Rem` and
does not establish (P) on any part of its domain.

For a cubic `G` define the original and retained functionals

```
Lambda(G)=E|L+G|+E|L−G|−p||G||²,
Lambda_hat(G)=inf_{v in H_(1,0)}
  {||v||²+E|L+G−v|+E|L−G+v|}−p||G||².
```

The scalar benchmark is denoted `S_G` to distinguish it from the
pointwise driver energy `S`:

```
B(u)=2E|L+sqrt(u)W|,   S_G=sup_{u≥0}{B(u)−pu},
```

where `W` is a standard complex Gaussian independent of `Z`.

## 2. Sharp mixed moments with arbitrary shared drivers

Let `q` belong to genuine complex Gaussian chaos `H_(2,1)` on finitely
many remote coordinates. Let `r_j` be holomorphic complex Gaussian linear
forms on the same coordinates. Put `u=E|q|²`, `S_r=Σ_j|r_j|²`, and
`V=E S_r`. Sharing between all these variables is unrestricted. Then

```
E[|q|² S_r] ≤4uV,                 E S_r² ≤2V².           (3)
```

For the first estimate, unitary invariance takes any nonzero `r_j` to
`||r_j|| Z_1`. In the normalized complex Hermite basis, with
`|alpha|=2`, `|beta|=1`, multiplication obeys

```
Z_1 H_(alpha,beta)
 =sqrt(alpha_1+1) H_(alpha+e_1,beta)
  +sqrt(beta_1) H_(alpha,beta−e_1).
```

The two sums lie in the orthogonal chaoses `H_(3,1)` and `H_(2,0)`.
Within each sum the multi-index map is injective. Thus, for
`q=Σ c_(alpha,beta) H_(alpha,beta)`, Parseval gives

```
E|Z_1 q|²=Σ (alpha_1+beta_1+1)|c_(alpha,beta)|²
         ≤4Σ|c_(alpha,beta)|²=4u.
```

Multiplying by `||r_j||²` and summing proves the first assertion.
For the second, let `K` be the covariance matrix of the proper complex
Gaussian vector `(r_j)`. Wick's identity and positivity give

```
E S_r²=(tr K)²+tr(K²)≤2(tr K)²=2V².
```

Both constants are simultaneously sharp: take all `r_j` proportional
to `Z_1` and `q=Z_1(|Z_1|²−2)/sqrt(2)`. This proof uses the genuine
chaos degrees. It is not an assertion for arbitrary cubic polynomials
or for quadratic coefficient fields in `S_r`.

## 3. Conditional implication for a genuine joint shell

Take two such linear forms `r_A,r_B`, with arbitrary sharing with `q`,
all independent of the visible coordinate `Z`. Define

```
A_shell=(T−1)r_A,   B_shell=Z² conj(r_B)/sqrt(2),
u=||q||²,          V=||r_A||²+||r_B||²,
R=r_A+rho r_B,     U=r_B−rho r_A,     d=1+rho².
```

Assume

```
u≤E0,             u+V≤80051/10^6.                       (4)
```

The second bound is available for the response regime specified in
`RESPONSE_ELLIPSOID.md`; here both inequalities (4) are explicit
hypotheses. The first is the domain of the completed tilted-content
theorem. The second does not imply the first.

The three shell components are orthogonal, so
`||q+A_shell+B_shell||²=u+V`. In the retained functional use the explicit
remote first-chaos trial `v=−sR`. The entire perturbation is even in `Z`,
so `Z→−Z` makes the two norm terms equal. Substitution gives exactly
the base `w=q` and the perturbation `h` in (P), together with the retained
penalty `s²||R||²`. It preserves the genuine cubic base `q`.

Let `Pi_1` project onto remote holomorphic first chaos. The matched
tilted contents are

```
c_A=Pi_1 E_Z[(T−1+s)ph(L+q)],
c_B=Pi_1 {E_Z[(Z²/sqrt(2))conj(ph(L+q))]
                         +s rho E_Z ph(L+q)},
e=c_B−rho c_A.
```

The linear term in the norm expansion is
`2 Re<c_A,R>+2 Re<e,r_B>`. Averaging (P), applying (3), subtracting
the cubic energy price `pV`, and adding the retained penalty gives

```
Lambda_hat(q+A_shell+B_shell)−Lambda(q)
 ≤2 Re<c_A,R>+2 Re<e,r_B>
       −(31/100)||R||²−(2/25)||U||²+2V(u+V−E0).          (5)
```

Indeed `67/100−s²=31/100`, and the last term is bounded by
`−2E0 V+(1/2)(4uV)+2V²`. No independence between the remote drivers
has entered this calculation.

## 4. Content inputs and exact scalar reduction

Put `D=B(u)−2E|L+q|` and `D_+=max(D,0)`. The inputs are

```
C=||c_A||≤1/50,
C²≤(3/10)D_+ +6/10^6,
||e||≤(7/2000)sqrt(u).                                  (6)
```

The first two are the completed tilted-A bounds in
`../received-2026-11-15-tilted-sector/REPORT.md` and its content-deficit
proofs. The third is the matched-tilt centered A/B comparison proved in
`JOINT_CONTENT.md`, sections 3–4; that new comparison is author-only
pending external review. These analytic and interval-certificate inputs
are not replayed by the scalar checker.

Set `E=7532/10^7`. The checker verifies exactly that
`E²≥(7/2000)²E0`, so `||e||≤E`. Put

```
a0=rho E/d,  b0=E/d,  alpha=31/100,  beta=2/25,
r=||R||,    z=||U||.
```

The identities `r_B=(rho R+U)/d` and `r²+z²=dV` and Cauchy–Schwarz
bound the right side of (5) by

```
2(C+a0)r+2b0 z−alpha r²−beta z²+2V(u+V−E0).              (7)
```

Partition `V∈[0,80051/10^6]` into 1000 equal closed intervals `[l,h]`.
On each interval (4) implies

```
2(u+V−E0)≤k=2 min(h,80051/10^6−E0).
```

With `A0=alpha−k/d`, `B0=beta−k/d`, `gamma=3/10`, and `eta=6/10^6`,
the gain (7) minus `D_+` is at most

```
2(C+a0)r+2b0 z−A0 r²−B0 z²−(C²−eta)/gamma.              (8)
```

This uses `D_+≥(C²−eta)/gamma`, even when that right side is negative.
For a saved rational multiplier `lambda`, let
`A=A0+lambda>0`, `B=B0+lambda>0`. Completing both squares and using
`r²+z²=dV` bounds (8) by

```
(C+a0)²/A+b0²/B−(C²−eta)/gamma+lambda d V_*,             (9)
```

where `V_*=h` if `lambda≥0` and `V_*=l` otherwise. This is a rational
quadratic in `C∈[0,1/50]`. Its maximum occurs at an endpoint or at its
interior vertex. The checker regenerates the entire partition, verifies
positivity of `A,B`, evaluates these maxima exactly, and proves every
one strictly below `49/10^6`.

Only rational multipliers are saved. No floating optimum, saved upper
value, numerical integration, or assertion about (P) is accepted as a
premise of this scalar computation. Optimization was used only to
discover the multipliers.

## 5. Conditional conclusion and replay

Subject to (P) and the stated inputs, the exact scalar certificate proves

```
Lambda_hat(q+A_shell+B_shell)
 <Lambda(q)+D_+(q)+49/10^6.                              (10)
```

If `D≥0`, then `Lambda(q)+D=B(u)−pu≤S_G`. If `D<0`, then `D_+=0`
and the inherited peak remote certificate gives
`Lambda(q)<S_G+36/10^8` (the theorem recorded in
`../audit-2026-11-15-codex-a7c4/REMOTE.md`, sections 1–2, and the living
ledger). Thus both cases yield

```
Lambda_hat(q+A_shell+B_shell)<S_G+4936/10^8.              (11)
```

The allowance is about half of the central `10^−4` budget, but only
for this conditional joint shell with (4). The remaining pointwise
premise, odd sectors over this shell, other response regimes, and the
rest of the row consumer are not supplied by (11).

From the repository root, replay the standard-library exact check:

```sh
python3 -I research/conjecture-K/code/progress-2026-11-15-codex-a7c4/joint_target_check.py
```

The adjacent `joint_target_multipliers.json` is the sole saved numerical
input. `joint_target_result.json` records the output, including the
exact largest cell maximum and the strict rational cap. The checker
refuses `-O` or `-OO`, since acceptance uses assertions. It writes no
files. It is not a Lean proof and does not certify the global pointwise
premise or replay the inherited content and remote certificates.

The retained-trial reduction and all 1000 scalar cells were independently
re-derived or checked by other workers within this session. That is
within-session peer checking, not external review.


## 6. The exterior is proved: only a compact domain remains

The pointwise premise (P) holds whenever `|w|≥101/50` or
`sqrt(S)≥33/20`. Its remaining compact interior is open. The following
argument and exact polynomial checks are **P+C, author only**, pending
external review. This is an additional exterior certificate, distinct
from the scalar assembly checker in section 5.

For nonzero x, concavity of the square root gives

    2(|x+h|−|x|−Re(h conj(ph x)))≤|h|²/|x|.

Cauchy–Schwarz, and `1/sqrt(2)<177/250`, give

    |h|²≤S W(T),
    W(T)=(T−2/5)²+(s rho+(177/250)T)².

For S>0 use the actual directional measure `|h(Z)|²dγ(Z)/S`.
Under the invertible radial map `y=L`, it has a possibly nonradial density

    f(y)=exp(−T)|h(Z)|²/(S pi D(T))≤exp(−T)W(T)/(pi D(T)),
    D(T)=(a+bT)(a+3bT).

The checker proves `D(T) sum_{j=0}^4 T^j/j!−W(T)>0` on the whole
nonnegative half-line: all degree-six Bernstein coefficients are positive
on each of the 16 consecutive intervals `[j/4,(j+1)/4]`, and all
coefficients after translation `T=4+v` are positive for `v≥0`.
Since `exp(T)` exceeds its Taylor polynomial, `f≤1/pi`.
Its mass is at most `H²=1+s²(1+rho²)`, since Gaussian orthogonality gives
`E|h|²=S+s²|R|²`. This retains the mass of the actual direction, even
though the density cap uses the larger radial envelope W.

Layer cake, using the area of each disk, now gives for every w

    integral f(y)/|y+w| dy
      ≤integral_0^infinity min(H²,1/t²) dt
      =2H<241/100.

Consequently `Rem≤(241/100)S` at every shift and amplitude. Independently,
the triangle inequality gives `Rem≤4E|h|≤4H sqrt(S)`, where
`H²=1+s²(1+rho²)` by Gaussian orthogonality.

Because `|R|²+|U|²=(1+rho²)S` and `.67≥.08`, the right side of (P)
is at least

    m S+(1/2)|w|²S+S²,
    m=p−463/5000−(67/100)(1+rho²)>0.

Exact rational comparisons show

    m+(1/2)(101/50)²>241/100,
    [m(33/20)+(33/20)³]²>16H².

The latter expression before squaring is positive and increasing with
its positive amplitude argument. The two global remainder bounds prove
(P) on the stated exterior. `S=0` is equality. The singular point
`L+w=0` has Gaussian measure zero; layer cake provides the needed
integrability, so no singular neighborhood is omitted.

Replay the exterior certificate from the repository root:

```sh
python3 -I research/conjecture-K/code/progress-2026-11-15-codex-a7c4/joint_target_tail.py
```

This leaves only `|w|≤2.02`, `sqrt(|A|²+|B|²)≤1.65` to certify.
Simultaneous phase rotation permits w real and nonnegative, but A and B
remain complex: the compact problem still has five real parameters.
No numerical scan of this domain is a proof of (P).
