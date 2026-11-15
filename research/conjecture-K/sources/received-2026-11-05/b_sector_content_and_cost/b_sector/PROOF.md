<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/b_sector_content_and_cost/b_sector/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# B-shell content for Gaussian-factor cubics, and a stronger local cost

5 November 2026. Analytic proofs with replayed exact/interval certificates.
This note proves a restricted sector-assembly theorem. It does not prove
Conjecture K for an arbitrary remote cubic or for simultaneous A and B shells.

## Results

Write T=|Z|², L=Z(a+bT), p=1/epsilon,

\[
 F(G)=\mathbb E|L+G|+\mathbb E|L-G|,\quad
 \Lambda(G)=F(G)-p\mathbb E|G|^2,\quad
 B(v)=2\mathbb E|L+\sqrt v W|,\quad S=\sup_{v\ge0}(B(v)-pv).
\]

Z and W are standard complex Gaussians; W is independent of Z. Remote
variables are independent of Z. Set

\[
 F_B(y)=\mathbb E_Z\left[\frac{Z^2}{\sqrt2}
                \overline{\operatorname{ph}(L+y)}\right],\qquad
 C_B(q)=\|\Pi_{1,0}F_B(q)\|_2.
\]

The three rows are:

| row | epsilon | a | b |
|---|---:|---:|---:|
| peak | 1891/2500 | 699/1250 | 179/1250 |
| flank | 149/200 | 14/25 | 1467/10000 |
| upper | 1891/2500 | 573/1000 | 19/125 |

**Theorem 1 (new local cost).** At every row, for any remote q in L² and any
remote proper complex Gaussian r, with arbitrary dependence between them,
if w=E|r|² <=113/10000, then

\[
 \boxed{\Lambda(q+Z^2\bar r/\sqrt2)
 \le\Lambda(q)+2\operatorname{Re}\mathbb E[\bar rF_B(q)]
                       -\frac7{20}w.}\tag{1}
\]

No cubic assumption or energy restriction on q is needed. In particular,
this holds for every holomorphic linear form r in the requested problem.
The exact checker bounds the nonlinear norm remainder by
272775984428757/281474976710656 < 0.969095 times w.

**Theorem 2 (new B-content theorem).** Let X=(X_1,...,X_m), Y, and Z be
independent standard complex Gaussian vectors/variables, and let

\[
 P_j(Y)=Y^*A_jY-\operatorname{tr}A_j,\qquad
 q=\sum_{j=1}^mX_jP_j(Y),\qquad u=\mathbb E|q|^2.
\]

The matrices A_j are arbitrary complex matrices. They need not be Hermitian,
normal, commuting, independent, or orthogonal. There is no dimension bound.
At the three rows, for 551/100000 <= u <=463/10000,

\[
 \boxed{C_B(q)^2\le\frac{239}{2000}\,[B(u)-F(q)].}\tag{2}
\]

This includes the one-driver XP(Y) class with arbitrary complex coefficients,
its Hermitian subclass, and the full several-driver Gaussian-factor class.
It does not include the self-interacting Wick driver X(|X|²-2) or the general
mixed shells merely by changing their representation.

**Corollary (all B amplitudes).** For q in Theorem 2 and every remote
holomorphic linear r, of arbitrary norm and with arbitrary sharing,

\[
 \boxed{\Lambda(q+Z^2\bar r/\sqrt2)
 \le B(u)-pu-\frac{281}{520}[B(u)-F(q)]\le S.}\tag{3}
\]

This uses the separately supplied global B-cost certificate, which was
read and replayed in this run and is included under upstream_global_cost/.
It gives cost constants 13/50, 29/100, and 3/10 at the peak, flank, and upper
rows respectively, for arbitrary remote q,r in L² and without amplitude
restrictions. The common constant 13/50 gives (3). The row-specific deficit
fractions are 281/520, 341/580, and 361/600. This global cost is an input
from the other thread, not a new result claimed by this note.

When w<=113/10000, Theorem 1 improves the common deficit fraction to 461/700.

## 1. The first-order pairing and exact angular reduction

The first-order term in the question needs a conjugate on r:

\[
 \left.\frac d{ds}\Lambda(q+sZ^2\bar r/\sqrt2)\right|_{s=0}
       =2\operatorname{Re}\mathbb E[\bar rF_B(q)].\tag{4}
\]

Under Z -> -Z the two norm terms are equal. Also E_Z Z²=0, so the energy
cross term vanishes. Differentiating the norm proves (4).

In fact F_B(e^{i theta}y)=e^{i theta}F_B(y). For a charge-one cubic q and
a holomorphic linear r, E[rF_B(q)]=0 by the common phase rotation of all
remote coordinates. That uncorrected pairing cannot control the gain.

For example H(X)=X(|X|²-2), q=cH, c>0 small, satisfies

\[
 F_B(y)=-\gamma y+d y|y|^2+O(|y|^4),\qquad
 d=\frac3{16\sqrt2}\int_0^\infty
           \frac{e^{-t}t^{-1/2}}{(a+bt)^3}\,dt>0.
\]

The angular coefficients are -y/(2R) and 3y|y|²/(16R³), where
R=sqrt(t)(a+bt). Splitting the t integral at R=2|y| bounds the remainder
by O(|y|⁴), both inside and outside that region. Boundedness of F_B extends
this to a global constant times |y|⁴, so it can be integrated against |X|.
The exact moments E[bar X H]=0 and E[bar X H|H|²]=32 give
E[bar X F_B(cH)]=32dc³+O(c⁴)>0. Thus the cost statement with E[rF_B(q)]
is false, even at arbitrarily small admissible energies and shell amplitudes.

For completeness the exact conditional reduction is

\[
 \mathcal H(R,x,y)=\frac1{2\pi}\int_0^{2\pi}
                   |Re^{i\theta}+x+ye^{2i\theta}|\,d\theta,
\]
\[
 \Lambda(q+Z^2\bar r/\sqrt2)=
 2\mathbb E\int_0^\infty e^{-t}
       \mathcal H(\sqrt t(a+bt),q,t\bar r/\sqrt2)\,dt
       -p(\mathbb E|q|^2+\mathbb E|r|^2).\tag{5}
\]

Its conditional second moment is u+w t²/2. The angular mean in (5) still
depends on the joint law of (q,r); the variance profile alone does not
determine the payoff.

## 2. Proof of the local B cost

Use |z|=(pi/2) E_theta |Re(e^{-i theta}z)| and rotate Z in each real
projection. Write Z=x+iy, with joint density exp(-x²-y²)/pi. Put

\[
 D(x,y)=x(a+b(x^2+y^2)),\qquad
 h_\phi(x,y)=\frac{(x^2-y^2)\cos\phi+2xy\sin\phi}{\sqrt2}.
\]

After the projection rotation, write r=R e^{i phi} and eta=Re(q).
The real argument along the shell path is D+eta+sR h_phi. Define

\[
 \overline P(k)=\frac1\pi\int_0^{2\pi}\int_0^\infty
 \sup_{x\in\mathbb R}
 \frac{h_\phi(x,y)^2e^{-x^2-y^2}}
 {a+by^2+3bx^2+\sqrt2 k(x\cos\phi+y\sin\phi)}\,dy\,d\phi.
 \tag{6}
\]

The denominator is positive for 0<=k<=7/20. Indeed its global minimum is
at least a-k²/(2b)>0. This follows by minimizing the quadratic in x,y;
the exact loss is k²(cos²(phi)/6+sin²(phi)/2)/b.

On R<=k0=7/20, x -> D+eta+sR h_phi is strictly increasing. Its unique root
is simple. Differentiation of the real absolute value, or first smoothing
it and passing to the limit, therefore bounds its second derivative using
the reciprocal derivative at that root. Taking the supremum over x removes
eta and hence all dependence of q on r. Since r is proper Gaussian,
phi is uniform and independent of R. Symmetry in y after phi integration
gives

\[
 F(q+Z^2\bar r/\sqrt2)-F(q)
       -2\operatorname{Re}\mathbb E[\bar rF_B(q)]
 \le 2\mathbb E\!\left[R^2\int_0^1(1-s)\overline P(sR)\,ds;
                          R\le k_0\right]+E_{\rm tail}.\tag{7}
\]

For R>k0 the first-order remainder of each norm is at most twice the norm
of the perturbation. Since E T=1, this yields

\[
 E_{\rm tail}\le2\sqrt2\,\mathbb E[R;R>k_0].
\]

The checker proves, at the smallest profile a=699/1250,b=179/1250,

\[
 \boxed{\overline P(k)\le\frac{239}{250}+3k^2\quad(0\le k\le7/20).}
 \tag{8}
\]

Both other rows have larger a,b. The denominators in (6) increase pointwise,
so (8) applies to them too. The exact upper bounds at the five knots are:

| k | certified upper bound, denominator 2^48 |
|---|---:|
| 0 | 267641669353725 |
| 1/10 | 273410930131550 |
| 1/5 | 289722915779828 |
| 3/10 | 323008298571188 |
| 7/20 | 352620170266092 |

Each integrand in (6) is convex in k on this interval. Suprema and
integration preserve convexity. The checker verifies by exact quadratic
minimization that (8) dominates every chord between consecutive knots.

Because ER²=w and ER⁴=2w², (7)-(8) give remainder/w at most

\[
 \frac{239}{250}+w+
 2\sqrt2\left(\frac{k_0}{w}+\frac1{2k_0}\right)e^{-k_0^2/w}.
 \tag{9}
\]

Here the Rayleigh tail identity and the elementary Gaussian-tail bound give
E[R;R>k0] <=(k0+w/(2k0))exp(-k0²/w). The last expression in (9) increases
with w on 0<w<=113/10000, because (x+1/2)e^{-x} decreases for x>1/2.
At that endpoint the checker obtains

\[
 \text{remainder}/w\le
 \frac{272775984428757}{281474976710656}<0.969095,
 \quad \text{remainder}/w+\frac7{20}<\frac{2500}{1891}.
\]

The norm-square penalty increments by pw exactly. This proves (1).

### How the cost enclosure is certified

The checker uses fixed-point intervals with denominator 2^48 and directed
BigInt division. On [-4,4] x [0,4] the mesh is 1/64. Each angular quadrant
uses z=tan(phi/2) in [0,1], with 64 cells; sin(phi)=2z/(1+z²) and
cos(phi)=(1-z²)/(1+z²) have rational monotone endpoint bounds. All four
quadrant sign choices are included. The angular cell mass is bounded above
by 2 dz/(1+z_left²). Each spatial cell uses an upper numerator and a lower
positive denominator. Suprema over x and upper sums over y then enclose (6).

For |x|>=4, h²<=t²/2 and denominator>=d0=a-k²/(2b), so the decreasing
function t²e^{-t} at t>=16 controls the entire x tail in every y cell.
For y>=4, the total omitted part of Pbar is bounded by
(1123/32)e^{-16}/d0, using integration by parts and the Gaussian-tail bound.
The exponential is enclosed by alternating Taylor sums after division of
the argument by 64, followed by six outward-rounded squarings.
The lower bound pi>3.141592653589793 is separately checked from Machin's
formula in verify_structure.mjs. Square-root bounds are checked by squaring.
No floating-point calculation decides any cost inequality.

## 3. Positive-kernel transfer of the A certificate to B

Let

\[
 m_v(r)=\mathbb E|r+\sqrt v W|,\quad
 J_A(v)=\int_0^\infty(t-1)e^{-t}K_v(R(t))\,dt,\quad
 K_v(r)=\mathbb E|r+\sqrt v W|^{-1},
\]
\[
 J_B(v)=\frac1{\sqrt2}\int_0^\infty te^{-t}
                 \left(m_v''(R(t))-\frac{m_v'(R(t))}{R(t)}\right)dt.
 \tag{10}
\]

Here primes on m_v denote radial derivatives, and R(t)=sqrt(t)(a+bt).
For V=sum_j|P_j|², conditioning on Y and complex Gaussian integration by
parts give

\[
 F(q)=\mathbb EB(V),\qquad
 c_{B,j}:=\mathbb E[\bar X_jF_B(q)]
                 =\frac12\mathbb E[P_jJ_B(V)].\tag{11}
\]

For the last formula, the Wirtinger derivative of the smoothed conjugate
phase is e^{-2i arg L}(m_v''-m_v'/r)/2. Its angular factor cancels Z².
All first-chaos coefficients in the Y coordinates vanish by rotating all
X_j together while keeping Y fixed. Thus C_B=|c_B|.

Write k=a+bt and s=tk². The radial Gaussian mean and its anisotropic Hessian
are

\[
 m_v(r)=\frac{\sqrt\pi}{2}\sqrt v\,
 {}_1F_1(-1/2;1;-r^2/v),
\]
\[
 m_v''(r)-m_v'(r)/r
    =-\frac{\sqrt\pi r^2}{4v^{3/2}}
                {}_1F_1(3/2;3;-r^2/v).
\]

The derivative identity
d[v^{-a}{}_1F_1(a;c;-s/v)]/dv
=-a v^{-a-1}{}_1F_1(a+1;c;-s/v)
therefore gives

\[
 J_B'(v)=\frac{3\sqrt\pi}{8\sqrt2\,v^{5/2}}
 \int_0^\infty e^{-t}t^2k^2
              {}_1F_1(5/2;3;-s/v)\,dt.\tag{12}
\]

The inherited A-kernel formula, obtained by integration by parts in t, is

\[
 J_A'(v)=\frac{3\sqrt\pi}{8v^{5/2}}
 \int_0^\infty e^{-t}t^2(k^2+2bk)
              {}_1F_1(5/2;3;-s/v)\,dt.\tag{13}
\]

Euler's integral for this hypergeometric function has positive integrand,
since 0<5/2<3 and s/v>=0. Equations (12)-(13) consequently prove

\[
 \boxed{0\le J_B'(v)\le\frac1{\sqrt2}J_A'(v).}\tag{14}
\]

The continuous v=0 limit is finite for both derivatives. Integration yields
|J_B(v)-J_B(u)| <= |J_A(v)-J_A(u)|/sqrt(2), for all u,v>=0.

### Why this transfers the whole directional certificate

The supplied A proof establishes that B is strictly concave. Put

\[
 d_u(v)=B(u)+B'(u)(v-u)-B(v),\quad
 R_A(u,y)=\frac{uy[J_A(uy)-J_A(u)]^2}{4d_u(uy)},
\]
\[
 R_B(u,y)=\frac{uy[J_B(uy)-J_B(u)]^2}{4d_u(uy)}.
\]

Then (14) gives R_B<=R_A/2, including the continuous diagonal limits.
Choose a unit complex direction z with Re(z*c_B)=C_B and put h=Re(z*P).
The vector H=(Re P_1,Im P_1,...) has covariance Sigma. Write
rho=||Sigma||_op, tau=rho/u, Y0=V/u, Z0=h²/u. We have

\[
 \mathbb Eh=0,\quad 0\le Z_0\le Y_0,\quad
 \mathbb EZ_0\le\tau,\quad \mathbb EY_0=1.
\]

Weighted Cauchy--Schwarz in (11), after subtracting J_B(u), gives

\[
 C_B^2\le\Delta\,
       \mathbb E\left[\frac{Z_0}{Y_0}R_B(u,Y_0)\right],
 \qquad \Delta=B(u)-F(q)=\mathbb E d_u(V).\tag{15}
\]

At V=0 the quotient Z0/Y0 is assigned zero. If Delta=0, strict concavity
forces V=u almost surely and (11) vanishes because EP=0; no division is needed.

The existing vector moment theorem proves

\[
 \mathbb E[Y_0^3-\alpha(\tau)Y_0^2]\le-\beta(\tau),\qquad
 \alpha(t)=(25+100t)/3,\quad
 \beta(t)=22/3+44t^2+(176/3)t^3.\tag{16}
\]

For each covariance band [l,h], the inherited exact certificate constructs
Q(y)>=0 and gamma>=0 with

\[
 R_A(u,y)\le Q(y)+\gamma y,\quad
 Q(y)=a_0+a_1y+a_3[y^3-\alpha(h)y^2],\quad a_3>0,
\]
\[
 a_0+a_1-\beta(l)a_3+\gamma h<239/1000.
\]

Use R_B<=R_A/2, Z0/Y0<=1, and (16) in (15). The resulting expectation is
less than 239/2000. This proves (2), in every direction and every dimension.

This is a comparison of the nonnegative scalar Cauchy--Schwarz envelopes.
It does **not** assert C_B(q)<=C_A(q)/sqrt(2): signed vector expectations
can have different cancellations. Nor does it require that false inference.

## 4. Completing the B square

With any valid cost constant kappa, the corrected linear pairing is at most
2sqrt(w) C_B. Thus

\[
 \Lambda(q+B\text{-shell})
 \le\Lambda(q)+2\sqrt w C_B-\kappa w
 \le\Lambda(q)+C_B^2/\kappa.
\]

Theorem 2 and Lambda(q)=B(u)-pu-Delta prove (3) using the global certificate.
For the local cost kappa=7/20 the same calculation gives
B(u)-pu-(461/700)Delta. Restricting w only makes the square maximization safer.

## 5. The A--B mixed Hessian survives frequency averaging

Let a_1,b_1 be real and let X be a remote standard complex Gaussian. At q=0,
put h=a_1(T-1)X+b_1Z² bar X/sqrt(2). The expansion is

\[
 \Lambda(sh)=\Lambda(0)-s^2\left[
 k_A^0 a_1^2+k_B^0 b_1^2+2m^0a_1b_1\right]+o(s^2),
\]
\[
 k_A^0=p-\frac12\int\frac{(t-1)^2e^{-t}}{R(t)}dt,\quad
 k_B^0=p-\frac14\int\frac{t^2e^{-t}}{R(t)}dt,\quad
 m^0=\frac1{2\sqrt2}\int\frac{t(t-1)e^{-t}}{R(t)}dt.
\tag{17}
\]

In the real Hessian of |L+h| the anisotropic term contains
Re(e^{-2i arg L}h²). The product of the A and B shells has precisely the
frequency that survives this factor. Their L² energy cross term vanishes,
but their Hessian cross term does not.

At the peak row verify_structure.mjs certifies the last integral I in

\[
 \frac{6139560053228589768}{18446744073709551616}
 \le I\le
 \frac{6172610778423732770}{18446744073709551616},\qquad I>3/10.
\]

Thus m^0>0 is certified, not just observed numerically. Choosing opposite
signs for a_1,b_1 reduces the combined cost. This does not disprove a suitably
slack diagonal cost bound, but it invalidates deriving one from frequency
separation alone.

## 6. Scope and remaining obligations

Closed here: B-cost universally on the small-amplitude rectangle, and
B-content for the full Gaussian-factor class on the same energy interval
as its A certificate. Combined with the other thread's global cost, K holds
for q plus an arbitrary shared B shell in that class, at every B amplitude.

Still open in this note:

* B-content for a general remote cubic, including self-interaction and the
  general mixed one-driver shells.
* B-content below u=0.00551: this note does not extend the inherited scalar
  certificate below its certified interval. The cost theorem itself has no
  such lower cutoff.
* A finite-amplitude joint cost for simultaneous A and B, and the matching
  joint content budget. Separate A and B content bounds do not imply it.
* Pure cost for the even sectors over a nonzero q+A core.
* The remaining row-envelope/Lean consumption obligations for general K.

## 7. Replay and provenance

Run from this directory:

```sh
# b_sector/replay.sh
node verify_structure.mjs
node verify_b_cost.mjs
node upstream_global_cost/verify_b_cost.mjs
node upstream/verify_vector_moments.mjs
python3 upstream/check_kernels.py
python3 upstream/verify.py peak
python3 upstream/verify.py flank
python3 upstream/verify.py upper
```

The new JS checkers have no dependencies and use BigInt. The inherited
kernel and scalar-envelope checks require python-flint. The content proof
does not introduce a new numerical kernel: inequality (14) transfers the
existing A envelopes analytically.

Completed in this run: both new JS checks; all three global-cost rows;
exact vector moment identities; all three content-envelope verifications;
and higher-precision recomputation of all 381 inherited kernel nodes with
128-bit Arb. Replay logs are included. This is an analytic proof with
certified scalar computations, not a Lean-checked theorem.

The source for the inherited Gaussian-factor certificate is the supplied
conjectureK-monograph-bundle-20261105(5).zip. The later
b_shell_global_cost_certificate.zip supplies the unrestricted-amplitude
cost and is preserved separately. The new results are the stronger local
cost and the B-content transfer and its all-amplitude Gaussian-factor
corollary. No claim is made that the whole requested sector assembly is done.
