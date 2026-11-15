<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/proof.md (file dated 2026-11-05). Only this line was added. -->
# Conjecture K: a Gaussian-factor theorem and a counterexample to Conjecture E

5 November 2026.

**Status.** This does not prove full Conjecture K or the claimed unconditional Grothendieck lower bound. It proves the content inequality on the entire Gaussian-factor class, removing the covariance restriction in the supplied monograph. It also disproves the proposed Wick-monomial extremality principle E. Both results have analytic proofs and rigorous computational certificates below; neither is a Lean theorem.

All complex Gaussians are standard, with second moment one. All random variables called remote are independent of the visible Gaussian (Z). Set

\[
T=|Z|^2,\quad L=Z(a+bT),\quad
F(q)=2\mathbb E|L+q|,\quad B(u)=2\mathbb E|L+\sqrt u W|,
\]

\[
F_A(z)=\mathbb E_Z[(T-1)\operatorname{ph}(L+z)]=z g(|z|^2),
\qquad C(q)=\|\Pi_{1,0}F_A(q)\|_2.
\]

Here (g) is real. The definition of (F) agrees with the sum of the plus and minus expectations because (L) is circular. Distinguish the two deficits

\[
\Delta(q)=B(u)-F(q),\qquad
D(q)=S-F(q)+pu=\Delta(q)+S-B(u)+pu,
\quad u=\mathbb E|q|^2,\quad p=1/\epsilon.
\]

This distinction matters: the supplied notes use the letter (D) for both. The counterexample below works with either denominator.

## 1. The entire Gaussian-factor class

**Theorem 1.** Let (X=(X_1,\ldots,X_m)) and (Y=(Y_1,\ldots,Y_n)) be independent standard complex Gaussian vectors. Let (A_1,\ldots,A_m) be arbitrary complex matrices, with no normality, commutativity, rank, or independence assumption. Put

\[
P_j(Y)=Y^*A_jY-\operatorname{tr}A_j,
\qquad q=\sum_{j=1}^m X_jP_j(Y),
\qquad u=\sum_j\operatorname{tr}(A_jA_j^*).
\]

For (551/100000\le u\le463/10000), at each of the three rows below,

\[
\boxed{C(q)^2\le\frac{239}{1000}\,[B(u)-F(q)].}
\tag{1}
\]

| Row | epsilon | a | b |
|---|---:|---:|---:|
| Peak | 1891/2500 | 699/1250 | 179/1250 |
| Flank | 149/200 | 14/25 | 1467/10000 |
| Upper | 1891/2500 | 573/1000 | 19/125 |

The projection in (1) includes **all** remote coordinates, not just (X). The theorem is uniform in both dimensions. In particular, the earlier restriction (\|\mathbb E[PP^*]\|_{\mathrm{op}}\le3/140) is unnecessary for this class.

**Consequence using the supplied shell-cost theorem.** If (U) is any remote holomorphic linear form with (\|U\|_2^2\le113/10000), the input estimate from the monograph is

\[
\Lambda(q+(T-1)U)\le\Lambda(q)+2\Re\langle U,F_A(q)\rangle
-\frac6{25}\|U\|_2^2.
\tag{2}
\]

Completing the square and applying (1) give

\[
\boxed{\Lambda(q+(T-1)U)
\le B(u)-pu-\frac1{240}[B(u)-F(q)]\le S.}
\tag{3}
\]

Arbitrary sharing of (U) with (X,Y) is permitted. Equation (2) is an inherited analytic/certificate input; this package proves (1), rather than re-proving the shell-cost estimate. This is a theorem about the shared A core, not an assertion that all simultaneous visible shells have been eliminated.

### 1.1 A moment inequality for vectors of Hermitian quadratic forms

Let (P_{\mathbb R}=(\Re P_1,\Im P_1,\ldots,\Re P_m,\Im P_m)), and define

\[
V=|P_{\mathbb R}|^2=\sum_j|P_j|^2,\quad
\Sigma=\mathbb E[P_{\mathbb R}P_{\mathbb R}^{\mathsf T}],\quad
\rho=\|\Sigma\|_{\mathrm{op}},\quad r=\rho/u.
\]

Thus (\Sigma\succeq0), (\operatorname{tr}\Sigma=u), and (0<r\le1). Every real linear combination of (P_{\mathbb R}) is a centered Hermitian quadratic form in (Y).

For a scalar centered Hermitian form (H), with variance (v), diagonalization gives

\[
\mathbb EH^4=3v^2+6s_4,\qquad
\mathbb EH^6=15v^3+90vs_4+40s_3^2+120s_6.
\]

Here (s_k=\sum_i\lambda_i^k). Since (s_3^2\le v s_4) and (s_6\le v s_4),

\[
\mathbb EH^6\le\frac{125}{3}v\mathbb EH^4-110v^3.
\tag{4}
\]

Now introduce an independent standard **real** Gaussian vector \(\gamma\) of dimension (2m), and apply (4) to (H_\gamma=\gamma\cdot P_{\mathbb R}), for each fixed \(\gamma\). Its variance is (v_\gamma=\gamma^{\mathsf T}\Sigma\gamma). Gaussian integration in \(\gamma\) gives the exact identities

\[
\mathbb E_\gamma H_\gamma^6=15V^3,
\]

\[
\mathbb E_\gamma[v_\gamma H_\gamma^4]
=3uV^2+12V P_{\mathbb R}^{\mathsf T}\Sigma P_{\mathbb R},
\]

\[
\mathbb E_\gamma v_\gamma^3
=u^3+6u\operatorname{tr}\Sigma^2+8\operatorname{tr}\Sigma^3.
\]

Therefore

\[
\begin{aligned}
\mathbb EV^3\le{}&\frac{25}{3}u\mathbb EV^2
+\frac{100}{3}\mathbb E[V P_{\mathbb R}^{\mathsf T}\Sigma P_{\mathbb R}]\\
&-\frac{22}{3}u^3-44u\operatorname{tr}\Sigma^2
-\frac{176}{3}\operatorname{tr}\Sigma^3.
\end{aligned}
\tag{5}
\]

Using (P_{\mathbb R}^{\mathsf T}\Sigma P_{\mathbb R}\le\rho V), (\operatorname{tr}\Sigma^2\ge\rho^2), and (\operatorname{tr}\Sigma^3\ge\rho^3), we obtain the useful dimension-free bound

\[
\boxed{\mathbb E(V/u)^3\le\alpha(r)\mathbb E(V/u)^2-\beta(r),}
\tag{6}
\]

\[
\alpha(r)=\frac{25}{3}(1+4r),\qquad
\beta(r)=\frac{22}{3}+44r^2+\frac{176}{3}r^3.
\]

This is the additional constraint that closes the multi-driver case. It uses the covariance of the **realification** of the coefficient vector, not the complex covariance from the earlier sufficient cutoff.

### 1.2 Content, deficit, and the direction carrying the content

Define

\[
J(v)=\mathbb E_T[(T-1)K_v(\sqrt T(a+bT))],\qquad
K_v(z)=\mathbb E|z+\sqrt v W|^{-1}.
\]

Conditionally on (Y), (q) is proper complex Gaussian of variance (V). Gaussian integration by parts gives

\[
F(q)=\mathbb EB(V),\qquad
\mathbb E[\overline X_jF_A(q)]=\frac12\mathbb E[P_jJ(V)].
\tag{7}
\]

All (Y)-direction first-chaos coefficients vanish by the common phase symmetry of (X). Choose a unit complex vector so that its inner product with the content vector is (C(q)\ge0). Let (H_0) be the corresponding real linear combination of (P_{\mathbb R}). Then

\[
C(q)=\frac12\mathbb E[H_0J(V)],\quad
\mathbb EH_0=0,\quad \mathbb EH_0^2\le\rho,\quad H_0^2\le V.
\tag{8}
\]

The circular Gaussian-mixture representation of (L) implies that (B) is concave. Set

\[
d_u(v)=B(u)+B'(u)(v-u)-B(v)\ge0.
\]

Since \(\mathbb EV=u\), \(\Delta(q)=\mathbb Ed_u(V)\). Weighted Cauchy--Schwarz in (8), subtracting (J(u)\mathbb EH_0=0), yields

\[
C(q)^2\le\Delta(q)\,
\mathbb E\left[\frac{Z_0}{Y_0}R_u(Y_0)\right],
\tag{9}
\]

where

\[
Y_0=V/u,\quad Z_0=H_0^2/u,\quad
0\le Z_0\le Y_0,\quad \mathbb EY_0=1,\quad \mathbb EZ_0\le r,
\]

\[
R_u(y)=\frac{uy[J(uy)-J(u)]^2}{4d_u(uy)}.
\tag{10}
\]

The continuous extension at (y=1) is used. At (y=0), the integrand in (9) is taken to be zero.

### 1.3 The finite exact certificate

Partition (r\in[0,1]) into the 16 rational intervals in `factor_envelopes.json`. On an interval ([l,h]), use

\[
\alpha=\alpha(h),\qquad \beta=\beta(l).
\]

For that interval the file supplies rational (a_0,a_1,a_3,\gamma), with (a_3>0,\gamma\ge0), and the polynomial

\[
Q(y)=a_0+a_1y+a_3(y^3-\alpha y^2).
\]

`verify_factor.py` proves, over the full continuous domain (y\ge0), (551/100000\le u\le463/10000),

\[
Q(y)\ge0,\qquad R_u(y)\le Q(y)+\gamma y,
\]

and checks exactly

\[
a_0+a_1-\beta a_3+\gamma h<239/1000.
\tag{11}
\]

Indeed, (6), (9), and (Z_0/Y_0\le1) imply

\[
\mathbb E[(Z_0/Y_0)R_u(Y_0)]
\le\mathbb EQ(Y_0)+\gamma\mathbb EZ_0
\le a_0+a_1-\beta a_3+\gamma h.
\]

This proves Theorem 1.

The checker uses the positive decreasing convex kernels (A_0=-B'') and (H_0=J') and the cancellation-free identity

\[
R_u(y)=\frac{uy}{4}
\frac{[\int_0^1 H_0(u(1+(y-1)t))\,dt]^2}
{\int_0^1(1-t)A_0(u(1+(y-1)t))\,dt}.
\tag{12}
\]

Certified node values give chord upper bounds and secant-extension lower bounds. Their integrals and the rectangle comparisons are exact rational arithmetic. Cubic Bernstein coefficients bound (Q) on each interval. The unbounded tail (y\ge70) is handled analytically using (|J(0)|<1.7) and (-B''(0.1463)>1). No floating optimization is trusted by the checker. `design_factor_envelopes.py` is only a candidate finder.

The node generation and complete-monotonicity proofs are reproduced in `benchmark_kernel_proof.md`, `benchmark_kernels.py`, and `regenerate_benchmark.py`. The scalar kernel construction comes from the supplied R23/Hermitian certificate; the vector moment inequality, the 16 envelopes, and their use here are new to this analysis.

## 2. Conjecture E is false

**Theorem 2.** At the peak row and energy (u=463/10000), the pure Wick monomial is not a local maximizer of (C(q)^2/\Delta(q)), or of (C(q)^2/D(q)). An explicit counterexample to its proposed extremality is

\[
\boxed{
q_*=
\sqrt{\frac{4630000}{200000001}}\,
X\left[(|X|^2-2)+\frac{i}{10000}(|Y|^2-1)\right].
}
\tag{13}
\]

Here (X,Y) are independent remote complex Gaussians. In particular (q_*\in H_{2,1}), and (\mathbb E|q_*|^2=463/10000) exactly. Both content-to-deficit ratios are strictly larger than those of

\[
q_W=\sqrt{\frac{463}{20000}}X(|X|^2-2).
\]

This is **not** a counterexample to Conjecture K or to the (0.24) content inequality. The ratios are still close to (0.088), well below (0.24). It invalidates the claimed exact extremal reduction to the Wick monomial.

### 2.1 Exact second variation

Let (R=|X|^2), (P=|Y|^2-1), (h=R-2), and put

\[
q_\tau=c(t)X(h+i\tau P),\quad
t=\tau^2,\quad c(t)=\sqrt{u/(2+t)}.
\]

The orthogonal cubic components have variances (2) and (1), so the energy is exactly (u) for every real \(\tau\). Its only possible remote first-chaos coefficient is in the (X) direction. Set

\[
\phi(s)=2\mathbb E_Z|L+\sqrt s|,\qquad
v(t)=\frac{uR(h^2+tP^2)}{2+t}.
\]

Then

\[
\mathcal C(\tau)=\mathbb E[R c(t)(h+i\tau P)g(v(t))],
\quad F(q_\tau)=\mathbb E\phi(v(t)).
\]

Write (C_0=\mathcal C(0)>0), (D_0=\Delta(q_W)>0), and let (C_t) be the derivative at zero of the real part of \(\mathcal C\), regarded as a function of (t). Since (\mathbb EP=0), the imaginary part is (O(\tau^3)). For

\[
c=\sqrt{u/2},\quad v=c^2R(R-2)^2,
\]

we have

\[
C_0=c\mathbb E[R(R-2)g(v)],
\]

\[
C_t=-\frac{C_0}{4}
+c^3\mathbb E\left[R^2(R-2)\left(1-\frac{(R-2)^2}{2}\right)g'(v)\right],
\tag{14}
\]

\[
D_t=-c^2\mathbb E\left[R\left(1-\frac{(R-2)^2}{2}\right)\phi'(v)\right].
\tag{15}
\]

Integration by parts against the exponential law of (R) also gives the useful expression

\[
D_0=u\mathbb E\phi'(uR)
-c^2\mathbb E[(R-2)(3R-2)\phi'(v)].
\tag{16}
\]

Consequently, with (N=2C_tD_0-C_0D_t),

\[
\left.\frac{d}{dt}\frac{|\mathcal C(\sqrt t)|^2}{\Delta(q_{\sqrt t})}\right|_{t=0+}
=\frac{C_0N}{D_0^2}.
\tag{17}
\]

The rigorous intervals returned by `verify.py` imply

\[
0.0324909<C_0<0.0325454,\quad
0.0120569<D_0<0.0120835,
\]

\[
6.2748\times10^{-6}<N<8.8397\times10^{-6},
\]

\[
\boxed{\left.\frac{d}{dt}\frac{|\mathcal C(\sqrt t)|^2}{\Delta(q_{\sqrt t})}\right|_{0+}>\frac1{1000}.}
\tag{18}
\]

The floating estimate of this derivative is (0.001628138\ldots); that approximation is not used as proof.

For the penalized deficit, set (k=S-B(u)+pu\ge0). Concavity of (B), (B'(u)<p), and (A_0=-B'') decreasing give

\[
0\le k\le\frac{(p-B'(u))^2}{2A_0(u)}<0.0001.
\tag{19}
\]

To see this, (B(v)-pv) is decreasing for (v\ge u), while on ([0,u]) it is bounded by its quadratic tangent with curvature (-A_0(u)). The checker encloses the right side of (19) near (4.0\times10^{-5}). The numerator in (17) changes to

\[
N_{\rm pen}=N+2C_t k>5.3869\times10^{-6},
\]

and the penalized-ratio derivative is also strictly greater than (1/1000). Thus the ambiguity in the monograph's notation (D) does not affect the disproof.

### 2.2 Why the explicit rational perturbation works

The following crude bounds make the existence argument quantitative. They hold for all (t\ge0):

\[
|g|<1,\quad 0<g'<3,\quad |g''|<64,
\quad 0<\phi'<3/2,\quad |\phi''|<2.
\tag{20}
\]

The first, second, fourth, and fifth follow from complete monotonicity and the certified values at zero. A proof of the (g'') bound is given below. Since (u<1/20),

\[
c<4/25,\quad |c'|<1/25,\quad c''<3/100,
\quad |v'|,|v''|\le\frac1{80}R\{2P^2+(R+2)^2\}.
\]

Using (\mathbb EP^2=1), (\mathbb EP^4=9), and (\mathbb ER^j=j!), direct expansion gives

\[
\mathbb E[R|h||v'|]\le372/80,
\quad \mathbb E[R|h|(v')^2]\le139632/6400,
\]

\[
\mathbb E|v'|,\mathbb E|v''|\le1/4,
\quad\mathbb E(v')^2\le2776/6400.
\]

Writing (A(t)=\Re\mathcal C(\sqrt t)), these imply

\[
|A(t)|<6/25,\quad |A'(t)|<3,\quad |A''(t)|<230,
\]

\[
|D'(t)|<2/5,\quad |D''(t)|<5/4
\tag{21}
\]

for either deficit convention. For each convention let

\[
Q(t)=D(0)A(t)^2-C_0^2D(t).
\]

The certificate checks (D(0)<0.013), (C_0^2<0.0011), (C_0>0.032), and the corresponding (N>0.000005). Therefore

\[
Q'(0)>1/6250000,
\qquad
|Q''(t)|<2(0.013)(9+(6/25)230)+0.0011(5/4)<2.
\]

At (t=10^{-8}), Taylor's inequality yields

\[
Q(t)>\frac{t}{6250000}-t^2=1.5\times10^{-15}>0.
\tag{22}
\]

Both deficits remain positive, since (D(0)>0.01) and (21) holds. Finally, (|\mathcal C|^2\ge A^2), so (22) proves the strict ratio comparison for the explicit cubic (13).

### 2.3 Nonsingular positive kernels and rigorous integration

Let (\iota(s)\) be the nonnegative inverse of (s=t(a+bt)^2), and define

\[
f(s)=e^{-\iota(s)},\qquad h_0(s)=\frac{e^{-\iota(s)}}{(a+b\iota(s))^2}.
\]

Both are completely monotone. This follows from the Bernstein property of \(\iota\), using the positive Euler integral for

\[
\iota'(s)=a^{-2}{}_2F_1(2/3,4/3;3/2;-27bs/(4a^3)).
\]

The Gaussian-mixture identities, Euler's integral for the confluent hypergeometric function, and the fractional-integral identity for \(\lambda^{-1/2}\) give

\[
-g(s)=\frac2\pi\int_0^{\pi/2}\sin^2\theta
\int_0^\infty h_0(y^2+s\sin^2\theta)\,dy\,d\theta,
\tag{23}
\]

\[
\phi'(s)=\frac4\pi\int_0^{\pi/2}\cos^2\theta
\int_0^\infty[-f'(y^2+s\sin^2\theta)]\,dy\,d\theta.
\tag{24}
\]

Differentiating (23) and (24) supplies positive formulas for (g') and (-\phi''). Thus all four functions (-g,g',\phi',-\phi'') are positive, decreasing, and convex. These are precisely the functions denoted H, G, P, U in `kernels.json`.

For implementation, with (t=\iota(s)), (k=a+bt), (d=k(a+3bt)), and (d_t=4ab+6b^2t),

\[
-h_0'(s)=\frac{e^{-t}}{k^2}\frac{1+2b/k}{d},\qquad
-f'(s)=\frac{e^{-t}}d,\qquad
f''(s)=\frac{e^{-t}}{d^2}\left(1+\frac{d_t}d\right).
\]

`generate_kernels.py` evaluates these positive double integrals with Arb ball arithmetic. Its analytic callback uses

\[
\iota(s)=\frac{2a}{3b}
\left[{}_2F_1(-1/3,1/3;1/2;-27bs/(4a^3))-1\right],
\]

and rejects complex integration balls that cannot be kept away from the cut (s\le-4a^3/(27b)). This branch check is essential for rigorous integration. The (y\)-integrals are truncated at 80. Since \(\iota(80^2)>60\), monotonicity reduces the omitted tails to their values at (s=0). Substitution (y=\sqrt t(a+bt)), together with (a>1/2,b<0.16), bounds each tail by (10^{-24}); an allowance (10^{-20}) is added.

For completeness, write \(-h_0'=h_0 A\), where \(A=(1+2b/k)/d\). The same simple parameter bounds give (A<7) and (-A'<40). Hence (h_0''<100h_0). Using \(\int_0^{\pi/2}\sin^6\theta\,d\theta=5\pi/32\) in the second derivative of (23),

\[
|g''(s)|\le |g''(0)|
<\frac{125}{2}[-g(0)]<64,
\]

which proves the remaining bound in (20).

The final verifier does not numerically differentiate or rely on convergence of quadrature grids. It uses convexity to construct affine upper and lower bounds between certified kernel nodes. Their composition with (v(R)=(u/2)R(R-2)^2), multiplied by the polynomial weights in (14)--(16), can be integrated exactly up to Arb elementary arithmetic. All inverse images of kernel nodes and all sign changes are inserted into the partition. Cubic roots are isolated by rational bisection. The remaining integrals are finite sums of

\[
\int_l^r e^{-x}x^k\,dx
=e^{-l}\sum_{j=0}^k\frac{k!}{j!}l^j
-e^{-r}\sum_{j=0}^k\frac{k!}{j!}r^j.
\]

The radial interval is truncated at (R=32), with explicit exponential-moment tail bounds. `verify.py` then checks the positive margins and (22).

## 3. Corrections to the exploratory numerical evidence

The supplied `e11_scan_majorant.py` contains `if y<1e-9: return 0.0` inside `gfun`. The correct limit is

\[
g(0)=\frac12\mathbb E\frac{T-1}{\sqrt T(a+bT)}
=-0.8351359326\ldots
\]

at the peak row. Because the script linearly interpolates from that value at zero, this error affects a whole interval of small (|q|^2), not just a measure-zero input. The reported small-energy ratios cannot support an extremal claim. The separate exact certificates in the bundle do not use this erroneous table and are not invalidated by this observation.

Smooth quadrature using (23)--(24) gives the following **floating diagnostic values** for the pure Wick monomial and the same-norm deficit:

| u | C(q_W)^2 / Delta(q_W) |
|---:|---:|
| 0.00551 | 0.03890238 |
| 0.01000 | 0.05239047 |
| 0.02000 | 0.06914308 |
| 0.04630 | 0.08756530 |

The original R26 prompt also writes a content integral with an (x) weight. For (X=xe^{i\theta}), the coefficient \(\mathbb E[\overline X F_A(q)]\) has weight **(x^2)**. The later R24 size-biased formula in the bundle has the correct weight.

## 4. What is still missing

Theorem 1 closes the shared-A rectangle for (q=\sum X_jP_j(Y)), including concentrated covariance matrices, arbitrary complex coefficient matrices, and arbitrarily many drivers. It does not cover a general cubic tensor.

In particular, this work has not proved the required (0.24) inequality for the entire self-interaction family (X[c(|X|^2-2)+P(Y)]), or for arbitrary mixtures with the additional shells \(\overline X B\), \((|X|^2-1)V\), \(X^2\overline W\), and an added remote cubic. The pure templates remain covered by the earlier certificates. The stronger claim E cannot be used to remove these remaining mixtures: it is already false within the two-coordinate self-interaction family.

Accordingly, this package does **not** assert full K, full K with error (10^{-4}), or a new unconditional numerical bound for (K_G^{\mathbb C}). It supplies two proved changes to the research state: a larger certified class and a rigorous rejection of the proposed extremal shortcut.
