# A strict fifth-degree sign on an occupied central slice

For every finite Gaussian dimension and all disk-valued responses in the [physical fifth-energy setup](FULL_FIFTH_PLANES.md), put \(h=(f+g)/2\), \(k=(f-g)/2\), \(F=P_{3,2}\). Align a visible coordinate \(Z\) with the first projection of \(h\). Let \(t\) be the aligned amplitude and \(\tau\) the norm of the purely remote cubic projection of \(k\). Then
\[
 t\ge .83835,\quad \tau\ge .287345
 \quad\Longrightarrow\quad
 \|Fh\|_2^2-\|Fk\|_2^2\le -10289/12500000=-.00082312 .
\]
All sectors of both responses are allowed. A positive fifth coefficient in the witness receives a strict saving on this slice. The full witness also requires bounds outside this slice.

**Finite-dimensional realizability.** Take \(q_N=N^{-1/2}\sum A_iB_i\bar C_i\) on independent standard complex Gaussian coordinates, independent of \(Z\), and the response phases of \(Z\pm a q_N\). Set \(a=.287345/.83835\). The limit of their visible and tested remote pairings is \((\mu,a\mu)/\sqrt{1+a^2}\), where \(\mu=\sqrt\pi/2\). This follows by the complex central limit theorem and Gaussian regression, with uniform integrability from bounded second moments. Each coordinate in each remote triple admits a nontrivial phase rotation fixing the product and the responses, which kills its linear pairing. The true remote cubic norm dominates the tested one. Since \(.83835^2+.287345^2<\mu^2\), the limits strictly exceed both thresholds, and so do finite examples for all sufficiently large \(N\).

The same proof covers part of the binding row of the 126-piece joint 06/07 and 09/12 certificate. The bounds hold on the respective support half-planes $$t+\lambda\tau\ge t_0+\lambda\tau_0$$ whenever the remote cubic direction is defined.

| \(t_0\) | \(\tau_0\) | \(\lambda\) | upper bound for the full fifth difference |
|---:|---:|---:|---:|
| .83835 | .287345 | .3425 | −.00082312 |
| 27441/32768 = .837432861328125 | .290007 | .3463 | −.00136788 |

For the second row choose the phase parameter \(a=\tau_0/t_0\) in the finite construction above. Its strict circle test \(t_0^2+\tau_0^2<\pi/4\) is checked again. The scalar proof uses the same five residuals, the same two Young parameters, and polynomial coefficients \((-30.144389,31.0046040,-.45320789,.00747215)\). The ten-interval fourth-excess exclusion gives \(s<.002\) here as well. A physical pair at this amplitude can have a smaller \(\tau\) than the slice covers.

## Fourth excess controls the low-degree part of the squared cubic

Let \(q\) be the normalized remote cubic direction, \(W=|q|^2\), \(s=\mathbb EW^2-2\), and \(R\) the orthogonal projection onto remote real Gaussian chaoses of total degree 2 and 4, complexified when necessary. Then
\[
 \|R W\|_2^2+\tfrac12\|R q^2\|_2^2\le \tfrac32s.                 \tag{1}
\]
Indeed \(A=\sqrt2\operatorname{Re}q\) is a real third chaos with variance one. The degree-six projection of \(A^2\) has squared norm at least 2. To see this write \(A=I_3(f)\), \(6\|f\|^2=1\). The squared norm of the degree-six term is \(6!\|\operatorname{Sym}(f\otimes f)\|^2\). In its permutation expansion the permutations preserving or interchanging the triples contribute \(2(3!)^2\|f\|^4=2\). Each remaining term is a squared contraction norm. The constant term of \(A^2\) is 1, and the only remaining degrees are 2 and 4. Circularity gives \(\mathbb E A^4=\tfrac32\mathbb E W^2\). Hence \(\|R A^2\|^2\le3s/2\). Finally \(A^2=W+\operatorname{Re}q^2\), \(R\) commutes with circle rotation, and the charges \(0,2,-2\) are mutually orthogonal. This proves (1). In particular the bound applies to each complementary remote bidegree of total degree 2 or 4.

## A price for all fifth components

Fix \(\lambda=.3425\), let \(y=|q|\), and write \(c_{ij}=c_{ij}(\lambda y)\) for the real radial Hermite coefficients of the phase of the shifted visible Gaussian. Their angular charges are \(1+j-i\). Take the exposed pair of phases of \(Z\pm\lambda q\), with half-sum \(h_*\) and half-difference \(k_*\). Here are the coefficients to subtract before projecting the half-sum to its remote complementary chaos.

| \(i,j\) | \(a_{ij}\) | \(b_{ij}\) | polynomial carrying the charge |
|---|---:|---:|---|
| 1,0 | −.04401 | .88243 | \(W\) |
| 2,1 | .04178 | −.30708 | \(W\) |
| 0,1 | −.02201 | 0 | \(q^2\) |
| 1,2 | .02089 | 0 | \(q^2\) |
| 3,0 | .01206 | 0 | \(\bar q^2\) |

The orthogonal complement in each row has total degree 2 or 4 and kills \(b_{ij}\). After removing the common phase, the residual has modulus \(|c_{ij}-a_{ij}y^2-b_{ij}|\). Apply \((u+v)^2\le5u^2/4+5v^2\) to its projection and the projection of the subtracted polynomial. By (1), the latter contributes at most \(3s a_{ij}^2/2\) for charge zero and \(3s a_{ij}^2\) for the other charges before the factor 5. The terminal visible mode \(c_{32}\) has a degree-zero remote complement, bounded by its second moment. The six visible modes exhaust the possible odd visible degrees of the half-sum in \(F\). Thus
\[
 \|Fh_*\|^2 \le \mathbb E U(y) + Bs,\qquad
 U=|c_{32}|^2+\tfrac54\sum_{ij}|c_{ij}-a_{ij}y^2-b_{ij}|^2,\quad
 B=5\sum_{ij}\beta_{ij}a_{ij}^2 ,
\]
where \(\beta_{ij}\) is \(3/2\) or 3 as above. The two visible quadratic tests on the half-difference from the [full fifth planes](FULL_FIFTH_PLANES.md) give \(\|Fk_*\|^2\ge\mathbb EV(y)\) already on their span, with
\[
 V(y)=\tfrac32\big(2m_K[-y c_{11}]-m_K^2\big),\qquad m_K=.1285 .
\]
The [shifted stability estimate](SHIFTED_FIFTH_STABILITY.md), followed by Young's inequality with \(\eta=.012\), bounds the actual difference by
\[
 \mathbb E\big[(1+\eta)U-(1-\eta)V+585(m(\lambda y)-T)\big]+(1+\eta)Bs,
 \qquad m(a)=\mathbb E|Z+a|,\quad T=.83835+\lambda\, .287345 .
\]
Indeed \(585\ge4\sqrt3(1+1/\eta)\) and the support deficit \(\mathbb E m(\lambda y)-t-\lambda\tau\) is nonnegative.

## Rational replay

The physical constraints force \(s<.002\). For \(s\in[.002,42]\), the [cubic Hermite-interpolation Rice majorant](GAUSS_QUADRATURE_RICE.md) gives \(\mathbb E m(\lambda y)<T\) on ten closed fourth-excess intervals, contradicting the physical support. The checker then bounds the scalar integrand in square brackets by \(P(y^2)\) on the entire positive ray, with increasing-power coefficients
\[
 (-29.50291,\quad 30.327419,\quad -.4337458,\quad .00702658).
\]
On a mesh of width \(1/512\) through \(y=8\), the beta-integral Taylor bounds give rational interval enclosures. On each interval the checker bounds the second derivative of the difference from above using \(|c_{ij}|\le1\), \(|\partial_y c_{ij}|\le4\lambda\), \(|\partial_y^2 c_{ij}|\le16\lambda^2\) for the listed degrees. The subtracted Rice term is convex before subtraction. With second derivative bounded above by \(M\), the difference is at least its chord minus \(M/(8\cdot512^2)\) throughout the interval. Above 8, Bessel and the triangle inequality give \(U\le1+(5/4)(2+.07y^2)^2\), \(-V\le(3/2)(2m_Ky+m_K^2)\), and \(m(\lambda y)\le\mu+\lambda y\). All coefficients of the difference between \(P(y^2)\) and the resulting upper bound in powers of \(y-8\) are nonnegative.

The third radial moment satisfies \(\mathbb EW^3\le6+9s+40.45313s^{3/2}\). The cubic coefficient of \(P\) is positive and \(P_2+(9+.045\cdot40.45313)P_3+(1+\eta)B<0\). Taking expectations therefore prices the whole expression at most \(P_0+P_1+2P_2+6P_3=-.00082312\).

Run `python3 -IB -O experiments/quintic-signed/code/occupied_fifth_sign.py` from the repository root. The estimate and its scalar replay belong to the research proof.

Agent-ID: codex-a7c4

The [reverse fifth prices](OCCUPIED_FIFTH_INTERVAL.md) bound the same full physical quantity from below on both occupied slices, including the binding cell-23 rectangle.
