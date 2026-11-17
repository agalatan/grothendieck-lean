# A dimension-free staircase for the raw content inequality

Agent-ID: codex-6d92. Refs #509. Analytic proof and exact interval certificate,
author only pending independent review. This concerns the peak radial profile
specified in #509. The result applies in every finite complex dimension.

Let \(u=\mathbb E|q|^2\), \(\delta=\mathbb E|q|^4-2u^2\), and
\(x=\sqrt{\chi}=\sqrt{\delta}/u\) for \(u>0\). The conclusion on each
certified rectangle is
\[
    \Lambda(q)+\frac{25}{6}C(q)^2 < S+10^{-4}.
\]
The staircase applies on each closed energy interval ending at the
listed upper endpoint, starting at the preceding endpoint or zero.
The numerical entries here are exact decimals.

| Upper \(u\) | Ceiling on \(\chi=x^2\) |
|---:|---:|
| 0.00815 | 42 |
| 0.009 | 22.8484 |
| 0.01 | 15.21 |
| 0.012 | 9.9225 |
| 0.015 | 5.6169 |
| 0.02 | 2.5281 |
| 0.025 | 1.2544 |
| 0.03 | 0.6241 |
| 0.035 | 0.368449 |
| 0.039 | 0.328329 |
| 0.0463 | 0.2809 |

There are 81 accepted rectangles. In particular the band of #509 is
covered for \(\chi\le0.2809\), and every shape is covered for
\(u\le0.00815\). Also, **every \(u\le0.0463\) with
\(\tau_{\max}\le27/500\)** satisfies the conclusion, using 31 further
rectangles. Here \(\tau_{\max}\) is the greater of the largest
holomorphic influence divided by \(2u\) and the largest
antiholomorphic influence divided by \(u\). This slice goes beyond
\(\chi\le0.2809\). For example, 19 equal independent Wick blocks have \(\tau_{\max}=1/19\) and \(\chi=42/19\).
The general case outside these covered regions remains open.

## 1. Directional bound

Let \(F=\Re q\), \(H=\sqrt2\Re\xi\) for a unit holomorphic Gaussian
linear form \(\xi\), and \(\sigma^2=u/2\). Let
\(\kappa_F=\mathbb EF^4-3\sigma^4=3\delta/8\) by circularity.
For \(Y=D_HF/3\) in the second chaos, the real OU generator gives
\[
    \Gamma=\|DF\|^2=3\sigma^2+2J_2+J_4,\qquad
    \kappa_F=2\|J_2\|_2^2+\|J_4\|_2^2,\qquad
    \operatorname{Var}\Gamma=2\kappa_F-\|J_4\|_2^2.
\]
Here \(J_i\) denotes the projection of \(F^2\) to real chaos \(i\).
The first identity follows by applying \((L+6)/2\) to \(F^2\).
Integration by parts with \(F^4\) gives \(\mathbb EF^4=\mathbb EF^2\Gamma\),
which proves the second and third identities.

The scalar real sign response from #518 is
\[
 m(s)=-\pi^{-1/2}\int \lambda^{-1/2}s e^{-\lambda s^2}\,d\mu_A(\lambda).
\]
Here \(\mu_A\) is the positive Laplace measure of
\(f_A(r)=e^{-t(r)}/(a+bt(r))^2\), with \(r=t(r)(a+bt(r))^2\).
The angular identity for the complex phase and the simultaneous
rotation invariance of \((q,\xi)\) give
\[
    C(q)=\frac{\pi}{2\sqrt2}\sup_\xi
      |\mathbb E[H m(F)]|.
\]
The supremum over phases makes the complex projection coefficient real.

Write \(T_\sigma=\sigma^2\partial^2-s\partial\). The centered even
function \(m'-\mathbb E m'(N_\sigma)\) has Hermite rank at least two for
\(N_\sigma\sim N(0,\sigma^2)\). Its shifted resolvent \(\psi\) solves
\((3T_\sigma+2)\psi=-(m'-\mathbb E m'(N_\sigma))\).
Integrate by parts and use \(LY=-2Y\) to obtain
\[
    \mathbb E[Hm(F)]=3\mathbb E[Y (\Gamma-3\sigma^2) \psi''(F)].
\]
The integral resolvent expression
\(\psi=\int_0^\infty e^{2t}P_{3t}^{(\sigma^2)}
(m'-\mathbb E m'(N_\sigma))\,dt\) shows
\[
 \psi''(s)=\frac13\int_0^1 z^{1/3}\mathbb E\!
   \left[m'''(zs+\sigma\sqrt{1-z^2}G)\right] dz .
\]
For any \(h(s)=s e^{-\lambda s^2}\), Gaussian smoothing in the integrand
sends \(h\) to a positive multiple of another atom of the same form.
The inequality \(|(3-12v+4v^2)e^{-v}|\le3\) for \(v\ge0\) follows by
bounding \(e^v\) below by its quadratic and cubic Maclaurin polynomials on
the two sides. Therefore \(|\psi''(s)|\le\psi''(0)\), and
\[
    \|\psi''\|_\infty=\frac8\pi I(u),\qquad
    I(u)=\int d\widetilde\mu(\lambda)\int_0^1
        (1+u\lambda(1-w^{3/2}))^{-5/2} dw,
    \qquad
    d\widetilde\mu=\frac{3\sqrt\pi}{16}\lambda^{1/2}d\mu_A .
\]
Set \(K_A(u)=\frac{3\sqrt6}{4} I(u)^2\), which decreases with \(u\).

The product formula gives \(J_2=18 I_2(f\otimes_2 f)\) for the real
symmetric tensor \(f\) of \(F\). Consequently
\(\kappa_F\ge1296\|f\otimes_2f\|_{HS}^2\). Thus
\(\|D_HF\|^2\le18\|f\otimes_2 f\|_{HS}\le\sqrt{\kappa_F}/2\).
Combined with Cauchy–Schwarz in the resolvent identity and
\(\operatorname{Var}\Gamma\le2\kappa_F\), this recovers
\(C^2\le K_A(u)u^3x^3\) from #518.

There are stronger bounds at large \(x\). The two terms in
\(D_HF=2^{-1/2}\Re(\partial_\xi q+\bar\partial_\xi q)\)
have distinct phase charges and are orthogonal in the real Gaussian space.
The second has real variance half of its complex variance. It follows from
the total holomorphic and antiholomorphic energies \(2u,u\) that
\(\mathbb E|D_HF|^2\le(2u+u/2)/2=5u/4\).
Also
\[
    \|J_2\|_2^2=\tfrac18\|P_{2,0}q^2\|_2^2
                      +\tfrac14\|P_{1,1}|q|^2\|_2^2\le\tfrac{13}4u^2.
\]
Indeed \(\|P_{2,0}q^2\|_2^2=32\|M\|_{HS}^2\le8u^2\), with
\(M=T_{(1)}P T_{(1)}^{\mathsf T}\) for the swap of the last two
indices \(P\) and \(\|T\|_{HS}^2=u/2\). The other projection is
the centered quadratic from the positive semidefinite total influence
matrix, of trace \(3u\), so its norm is at most \(3u\).
These identities use variance-one proper complex Gaussians.

The sharper pair of bounds gives
\[
  \begin{aligned}
     C^2 &\le K_A(u)u^3\sqrt{50/3}\,x^2 &&\text{for all }x,\\
     C^2 &\le K_A(u)u^3\sqrt{50/3}\,(x^2/2+26/3)
          &&\text{when }x^2\ge52/3 .
  \end{aligned}
\]
The first replaces \(\|D_HF\|^2\) by \(5u/4\).
The second also uses \(\operatorname{Var}\Gamma=\kappa_F+2\|J_2\|_2^2
\le\kappa_F+13u^2/2\). The displayed coefficients are the ratios to
the preceding \(K_A(u)\) normalization.
The replay uses \(49/12>\sqrt{50/3}\) and uses the second inequality
starting at \(x=25/6\), where \(x^2>52/3\).

The preceding cubic-in-\(x\) coefficient can also be reduced by a
directional contraction bound from the Stein research audit. Rotate
coordinates so \(\xi=z_0\). Let \(A_1,A_2\) be the one-slot Gram matrices
of \(T\), and let \(M\) be the double \(q,q\) contraction above. Write
\[
  a_1=\|A_1\|_{HS},\quad a_2=\|A_2\|_{HS},\quad m_0=\|M\|_{HS},
  \quad p=(A_1)_{00},\quad z=(A_2)_{00}/2,\quad r=|M_{00}|.
\]
Here \(p,z,r\ge0\), and the phase decomposition used above gives the
exact directional derivative energy \(p+z+\Re M_{00}\).
Put \(U=\sqrt{a_1^2-p^2}\), \(V=\sqrt{a_2^2-4z^2}/2\).
The singly contracted tensor
\[
    W_{iab,c}=\sum_\ell T_{i\ell,c}T_{ab,\ell}
\]
satisfies \(\|P_{3,1}q^2\|_2^2=96\|\operatorname{Sym}W\|_{HS}^2\),
where only the first three slots are symmetrized. The term \(\ell=0\)
is a vector times a symmetric matrix at each fixed \(c\).
Symmetrizing such a product gives squared norm
\((\|v\|^2\|F\|^2+2\|F\bar v\|^2)/3\), so its norm, summed over
\(c\), is at least \(\sqrt{2pz/3}\).
The complement has squared norm at most \(2UV\) by Cauchy–Schwarz
of the two restricted Gram matrices. The exact identity
\[
    \frac{\delta}{32}
      =a_1^2+\frac14a_2^2+m_0^2+3\|\operatorname{Sym}W\|_{HS}^2
\]
therefore bounds \(\delta/32\) below by
\[
 p^2+z^2+r^2+U^2+V^2+6\big(\sqrt{pz/3}-\sqrt{UV}\big)_+^2
 \ \ge\ p^2+z^2+r^2+\frac{pz}{2}.
\]
Indeed \(U^2+V^2\ge2UV\) and
\(\min_{t\ge0}(2t^2+6(s-t)_+^2)=3s^2/2\). The resulting lower
bound is at least \(5(p+z)^2/8+r^2\), whence
\((p+z+r)^2\le(13/5)\delta/32\). The resolvent inequality now uses
\(\|D_H F\|_2^2\le\sqrt{13\delta/160}\) in place of
\(\sqrt{3\delta/32}\). This improves the cubic-in-\(x\) coefficient by the
factor \(\sqrt{13/15}<931/1000\). No change is made to the two
large-\(x\) formulas.

### Influence dependence

Let \(\tau=\tau_{\max}\) as defined above. Replacing the two total
derivative energies by the largest directional energies gives
\(\|D_HF\|_2^2\le5u\tau/4\). The first Gram matrix has trace \(u/2\)
and operator norm at most \(u\tau/2\). The same is true for the third
slot Gram matrix. Thus \(a_1^2,a_2^2\le u^2\tau/4\). As in the
fourth-moment calculation, \(m_0\le a_1\) and
\(\|\operatorname{Sym}W\|^2\le\|W\|^2\le a_1a_2\). This yields
\(\chi\le42\tau\).

The first bound on \(\|J_2\|^2\) now uses
\(\|P_{2,0}q^2\|_2^2\le8u^2\tau\) and
\(\|P_{1,1}|q|^2\|_2^2\le9u^2\tau\). The latter follows by multiplying
the trace \(3u\) of the positive total influence matrix by its operator
norm, which is at most \(3u\tau\). This strengthens the previous
second-chaos bound to \(\|J_2\|_2^2\le13u^2\tau/4\).
Using both improvements in the resolvent Cauchy–Schwarz step gives
\[
    C^2\le K_A(u)u^3\sqrt{50/3}\,\tau(x^2/2+26\tau/3)
\]
for all \(u,\chi\). With \(\tau\le\tau_0\) the right side is
increasing in \(\tau\), and \(x^2\le42\tau_0\). For \(\tau_0=21/1000\),
the archived global cap \(\Lambda(q)<1.373953883\) from STATUS 3.3
suffices directly. For \(\tau_0=27/500\), the replay uses the staircase on \(\chi\le0.2809\), then covers
\(0.2809\le\chi\le42\tau_0\) with the moment and Stein banks. The constant-plus-quadratic
shape dependence preserves the endpoint and energy-interpolation arguments of the
staircase. The supplemental bank contains 51 accepted Stein witnesses generated using
the #518 spectral template at four trial fourth excesses. The floating-point generator
is optional and takes a checkout with the #518 generator at b18e47309. The proof
replay checks every witness over the entire radial half-line and uses rational
continuum acceptance over 31 hybrid rectangles.

## 2. Exact Radau bound for \(K_A\)

Let \(m_j=\int \lambda^j d\widetilde\mu\). The moment integral is
\[
   m_j=\frac38\int_0^\infty
    [(-\partial_r)^{j+1}f_A](s^2(a+bs^2)^2)(a+3bs^2)\,ds .
\]
This follows by first integrating \((-\partial_r)^{j+1}f_A(r)\)
against \(dr/(2\sqrt r)\) and then substituting
\(r=s^2(a+bs^2)^2\). The replay evaluates the first seven moments in
Arb with a positive Gaussian tail estimate. The termwise recurrence for
the derivatives follows from \(dr/dt=(a+bt)(a+3bt)\).

Take the monic cubic orthogonal to degrees zero through two for the
measure \(\lambda d\widetilde\mu(\lambda)\).
The interval solve and sign changes give its three distinct positive
roots, together with strictly positive weights of the interpolatory
quadrature that includes zero as a fourth node. Exactness for degree
six follows by division by \(\lambda\) times that monic cubic.
For each \(u,w\), the seventh derivative in \(\lambda\) of
\((1+u\lambda(1-w^{3/2}))^{-5/2}\) is nonpositive. Hermite interpolation
at zero and the three double nodes gives a global upper bound because
the remainder node factor is \(\lambda\) times three squares.
Use the lower root endpoints and upper weights in this Radau bound.
To bound the integral in \(w\), partition it at \(w_j=(j/N)^2\)
and take the increasing integrand at the right endpoint.
Both \(w_j^{3/2}\) and the interval weights are rational.
The coefficient bound \(K_A(u)\) is rounded outward.
Monotonicity permits use of the left energy endpoint on each box.

## 3. Exact rectangle cover

The fourth- and sixth-moment theorems for the circular third chaos give
\(0\le\chi\le42\) and \(\mathbb E|q|^6\le
u^3(6+9x^2+40.45313x^3)\). The replay inherits
the October bank of audited global Hermite moment caps for the profile
\(V(r)=2\mathbb E|L+\sqrt r|\) and the previously enclosed
Gaussian benchmark \(S>1.3739535256614\) in STATUS 3.14.
It verifies the SHA-256 hashes of both cap files before using any entries.
It replays each half-line inequality for the imported #518 witnesses
against the archived profile caps.

On a rectangle using a physical-radius Hermite polynomial
\(a_0+a_1r+a_2r^2+a_3r^3\) with \(a_3\ge0\), the displayed content
bounds, the fourth moment identity, and the sixth-moment cap bound the
augmented objective by a polynomial of the form
\(A(u)+B(u)x^2+D(u)x^3\) with \(D(u)\ge0\). Its maximum over the
shape interval lies at an endpoint: any positive stationary point that
changes the sign of the derivative is a minimum. At each shape endpoint
we bound the entire energy interval by exact Bernstein coefficients.

For an energy slab with verified Stein polynomials at both ends, fix
the normalized law of \(Q=q/\sqrt{u}\). The function
\(F(u)=\mathbb E V(u|Q|^2)\) satisfies
\(F''(u)\ge-3\mathbb E|Q|^4=-3(2+x^2)\), by the completely
monotone profile bound in #518. The augmented function
\(F(u)-pu+K(u_-),u^3x^3/\kappa\) has the same lower second
derivative bound. Here \(K(u_-)\) can be the rounded coefficient
of the replay throughout the slab. Its excess above its endpoint
chord is at most \(3(2+x^2)(u_+-u_-)^2/8\), so the two endpoints
use their own cubic energy surcharges. The shape-endpoint argument
applies to each Stein polynomial. The proof uses the same archived
spectral-quadratic identities and interpolation argument as #518.

From the repository root, replay with Python and python-flint 0.9:
```sh
python3 -I research/conjecture-K/code/content-509-codex-6d92/verify_staircase.py .
```
