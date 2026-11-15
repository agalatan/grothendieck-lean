<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_envelope_audit/mixed_envelope/REPORT.md (file dated 2026-11-05). Only this line was added. -->
# R26 envelope audit and an exact obstruction to the scalar phase envelope

## Status

Two conclusions are certified below: the corrected peak-row K value, and an
obstruction to proving 0.24 with a scalar radial envelope using only the
37/68 sixth-moment relation plus the fourth-moment cap. The mixed-family
polynomial searches are floating-point explorations, NOT certificates.
No full R26 theorem is claimed.

## 1. Correct kernel value

At the peak row, u=463/10000, A=-B'', and K=2uA+u^2A',

\[
 0.166781<\mathcal K(u)<0.166783.
\]

verify_k.py regenerates rigorous Arb enclosures for A(u-h), A(u), A(u+h), with
h=10^-6. Convexity of A places A'(u) between the adjacent secants. The endpoint
enclosures are approximately 0.166781587969 and 0.166782111269. Thus 0.1913 is
not the value of this kernel for the stated row and definition.

Some supplied exploratory Cauchy--Schwarz bounds were below the ratios they
were intended to bound. That can arise from numerical error, but it cannot
serve as a verification of the inequality. In particular the numerical checks
must be replayed consistently with the corrected kernel.

## 2. Integrated formulas and free controls

Let c>=0, p=u-2c^2, q=X[c(R-2)+P], E P=0, E|P|^2=p. Define

\[
 F_c(z)=\mathbb E_R\phi(R|c(R-2)+z|^2),\qquad
 T_c(z)=\mathbb E_R R[c(R-2)+z]g(R|c(R-2)+z|^2),
\]

where R has the original Exp(1) law and phi(s)=2E|L+sqrt(s)|. Then

\[
 H_{c,u}(z)=B(u)-F_c(z)+B'(u)(|z|^2-p)
             +2uB''(u)\Re(\bar c z).
\]

Expanding the supplied R24 size-biased identity shows exactly

\[
 H_{c,u}(z)=\widehat{\mathbb E}_R
 d_{u,R}(|c(R-2)+z|^2)+|c|^2\mathcal K(u)\ge |c|^2\mathcal K(u).
\]

Consequently E H(P)=B(u)-F(q), while E T_c(P) is the full first-chaos content
coefficient. For arbitrary complex controls lambda,mu,nu,

\[
 N(z)=T_c(z)-\lambda z-\mu\bar z-\nu(|z|^2-p)
\]

has E N(P)=E T_c(P). Thus |N(z)|^2<=H(z)Q(|z|^2/p) and E Q<=kappa imply the
content inequality with constant kappa.

## 3. Certified obstruction at the pure-P endpoint

At c=0 and u=p, H(z)=d_p(|z|^2), T_0(z)=zJ(|z|^2)/2, and H vanishes on
|z|^2=p. A finite polynomial Q therefore forces lambda=J(p)/2 and mu=0.
The remaining nu control vanishes on that circle. At any other radius, taking
the maximum over the phase of z gives

\[
 \max_{|z|^2=py}\frac{|N(z)|^2}{H(z)}\ge
 R_p(y):=\frac{py[J(py)-J(p)]^2}{4d_p(py)}.
\]

Indeed N=z[J(py)-J(p)]/2-nu p(y-1), and maximization over the phase cannot
decrease the magnitude of the first summand. This holds for every nu.

The proposed moment constraints, in normalized notation Y=|P|^2/p, are

\[
 E Y=1,\quad E Y^2\le9,\quad E[Y^3-37Y^2]\le-68.
\]

Here is an exact probability measure satisfying all three constraints:

| y | probability |
|---|---|
| 22/25 | 69209/731250 |
| 89/100 | 2625664/2923125 |
| 412/25 | 8112959/1140018750 |

Its second moment is 3184646/1171875, approximately 2.71756, and its last
constraint is an equality. At p=463/10000, verify_barrier.py proves

\[
 \boxed{E R_p(Y)>123/500=0.246>0.24.}
\]

It uses only exact rational arithmetic and the supplied outward A=-B'' and
H=J' kernel enclosures. Convex chords give upper bounds for A; adjacent
secants give lower bounds for H. They enter the cancellation-free identity

\[
 R_p(y)=\frac{py}{4}
 \frac{[\int_0^1 H(p(1+(y-1)t))dt]^2}
 {\int_0^1(1-t)A(p(1+(y-1)t))dt}.
\]

The computed rational lower bound is approximately 0.2468004257. The proof
asserts the simpler exact threshold 0.246.

In particular no polynomial of the proposed form

\[
 Q(y)=a_0+a_1y+a_4(y^2-9)+a_6(y^3-37y^2+68),\qquad a_4,a_6\ge0,
\]

can both dominate the phase-maximized quotient and satisfy a0+a1<=0.24.
The three-point measure would have E Q<=a0+a1, contradicting E Q>=E R>0.246.

This is an obstruction to the relaxed proof method, NOT a counterexample to
R26: the three-point measure need not be the modulus law of a quadratic chaos.
It explains why the R23 proof required more than these two radial moments.
Handling c=0 separately does not justify assuming the same coarse envelope
will work arbitrarily close to that endpoint.

## 4. Sampled searches for the mixed family

The supplied search.py optimizes controls and polynomial coefficients on a
polar grid, using both moment constraints above. It keeps the entire complex
modulus before maximizing over the phase. At the peak row u=0.0463 it found:

| p/u | sampled optimized cap |
|---:|---:|
| 1/16 | 0.088362 |
| 1/8 | 0.089881 |
| 1/4 | 0.093498 |
| 1/2 | 0.105388 |
| 3/4 | 0.136160 |
| 0.90 | 0.180383 |
| 0.97 | 0.218591 |
| 0.98 | 0.226875 |
| 0.99 | 0.237080 |
| 0.995 | 0.243882 |
| 0.999 | 0.252340 |

These numbers are not certified upper or lower bounds for the continuum
problem: the kernels, quadratures, grid and optimizer are floating point.
They motivate coefficient choices only. The exact endpoint obstruction above
does not rely on these numbers. The fourth-moment multiplier was zero in the
near-endpoint searches.

## 5. Necessary directional refinement

Let tau=|E P^2|/p. The supplied R23 theorem gives the stronger family

\[
 E|P|^6\le\alpha(\tau)p E|P|^4-\beta(\tau)p^3,
\]
\[
 \alpha(t)=25+\frac{25}{\sqrt2}t,\quad
 \beta(t)=44+16t^2+\frac{25}{\sqrt2}t(2+t^2).
\]

For any target content angle theta,

\[
 E[\Re(e^{-i\theta}P)^2]/p\le(1+\tau)/2.
\]

Instead of |N|^2, majorize the squared REAL projection of the centered
integrated content. With real controls lx,ly,n, put

\[
 N_\theta(z)=\Re(e^{-i\theta}T_c(z))
 -l_x\Re z-l_y\Im z-n(|z|^2-p).
\]

A sufficient pointwise envelope is

\[
 N_\theta(z)^2/H(z)\le
 a_0+a_1y+a_4(y^2-9)+a_6(y^3-\alpha y^2+\beta)
 +\gamma\frac{\Re(e^{-i\theta}z)^2}{p},\quad y=|z|^2/p,
\]

with a4,a6,gamma nonnegative. Its expected value is at most

\[
 a_0+a_1+\gamma(1+\tau)/2.
\]

For tau in [l,h], use alpha(h), beta(l), and h in the expectation bound.
This retains the direction of the content; maximizing the complex modulus
first loses that information. The directional search scripts explore this
refinement but do not certify the intervening phase or parameter intervals.

## Replay

`python verify_barrier.py` checks the exact obstruction against the inherited
peak_kernels.json. `python verify_k.py` independently regenerates the three
Arb values needed for K. Both require python-flint.

The exploratory scripts require numpy and scipy. exploratory_kernels.npz is
an approximate deterministic-shift kernel table; it is NOT used by either
rigorous checker. build_exploratory_kernels.py can regenerate it.

The remaining task is a uniform directional envelope certificate over u,
p/u, tau, the target content angle, and the phase and radius of z, with a
rigorous tail bound. This archive does not claim that task is complete.

## Refined directional numerical pilot

At u=0.0463 and p/u=0.999, splitting the entire tau range into intervals of width 1/40 and using the refined complex moment inequality gave the following sampled caps:

| Target content angle | Largest sampled cap over tau intervals |
|---|---:|
| 0.00000000 | 0.239324408 |
| 0.78539816 | 0.238221645 |
| 1.57079633 | 0.228087021 |

Only these three target angles and a discrete phase/radius grid were tested. No interval or tail certification is claimed.
