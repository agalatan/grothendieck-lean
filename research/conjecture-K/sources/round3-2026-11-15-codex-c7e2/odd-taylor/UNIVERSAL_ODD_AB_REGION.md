<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/odd-taylor/UNIVERSAL_ODD_AB_REGION.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- Intended path: handoff/codex-c7e2-round3/odd-taylor/UNIVERSAL_ODD_AB_REGION.md -->
# Explicit odd-over-A/B region with arbitrary sharing

Agent-ID: codex-c7e2. Baseline master e9b0a458d06e67e9a1eee1168e98f34ef577b3a0.
This is a quantitative region for the requested odd inequality, not a
proof of that inequality everywhere or of Conjecture K.

Section 6 adds a stronger corollary using the separately certified 11/10
even-potential bound. Sections 1-5 preserve the independent 7/4 proof.

Set a=699/1250, b=179/1250, p=2500/1891, rho=5053/10000, and

    Z standard proper complex Gaussian, T=|Z|^2, L=Z(a+bT),
    X=L+q+(T-2/5)r_A+(3rho/5)r_B+Z^2 conjugate(r_B)/sqrt(2),
    O=ZQ+conjugate(Z)P+nu Z(T-2)/sqrt(2),
    D(x,o)=|x+o|+|x-o|-2|x|.

All remote variables are jointly independent of Z. They may otherwise
have arbitrary dependence; Q has mean zero and nu is one deterministic
complex constant. Define

    E_A=E|r_A|^2, E_B=E|r_B|^2, V=E_A+E_B,
    W=E|Q|^2+E|P|^2+|nu|^2,
    U=E|r_B-rho r_A|^2,
    k=32/25, m=p-k=1988/47275,
    e=2sqrt[(14/25)V((34/25)E_A+E_B)] <=(7/4)V.              (1)

The estimates below require only these second moments and EQ=0. They
therefore cover the requested genuine cubic/quadratic/linear fields in
every dimension, with no extra assumption on sharing or the law of q.

## 1. Main numerical inequalities

For every V,W>=0,

    E D(X,O) <= (sqrt(kW)+sqrt(e))^2.                       (2)

In particular,

    E D(X,O)-pW
      <= e+2sqrt(kWe)-mW
      <=(p/m)e
      <=(15625/284)V.                                      (3)

Hence the requested c=0 inequality

    E D(X,O) <= pW+(1/100)U+s(q)+1/20000                    (4)

holds whenever

    (p/m)e <= (1/100)U+s(q)+1/20000.                        (5)

Using only the supplied global signed-slack bound s(q)>=-9/25000000,
the following particularly simple explicit region is sufficient:

    V <=9/10000000 =9e-7.                                  (6)

The exact largest cutoff obtained from the scalar version of (3) and
this global slack is 88111/97656250000=0.00000090225664.
At the simpler cutoff (6), the remaining numerical reserve is exactly
1763/14200000000>1.24e-7. This proof does not spend the favorable U credit.

### Keeping the W<1/50 cap

The function e+2sqrt(kWe)-mW is concave in W, with maximizer

    W_*=k e/m^2.

Its exact maximum on 0<=W<=w_max=1/50 is

    F_max(e)=
      (p/m)e,                                      e<=m^2 w_max/k;
      e+2sqrt(k e w_max)-m w_max,                  e>=m^2 w_max/k. (7)

Thus F_max(e)<=(1/100)U+s(q)+1/20000 is a stronger explicit sufficient
condition. If |nu|^2=n is retained, the admissible interval is actually
n<=W<=w_max: replace W_* by its projection onto that interval in (7).

Using the supplied signed-slack lower bounds, the following rational
regions follow from (7). All permit every W<1/50 and arbitrary sharing.

| Remote-energy range | Supplied lower bound for s(q) | Sufficient upper bound on V |
| --- | ---: | ---: |
| 0<=u<=1/100 | 11/10000 | 213/10000000 = 0.0000213 |
| 0<=u<=1/50 | 49/100000 | 981/100000000 = 0.00000981 |
| 0<=u<=3/100 | 1/10000 | 2726/1000000000 = 0.000002726 |
| 0<=u<=463/10000 | -9/25000000 | 9/10000000 = 0.0000009 |

The first row uses the W cap; the remaining rows follow already from
the unrestricted maximum in (3). These are deliberately stated as
prefix regions, so the strongest applicable row can be used. The U
credit in (5), or the anisotropic e in (1), enlarges them further.

## 2. Explicit deterministic retained-c improvement

If the permitted left side is

    inf_c {|c|^2+E D(X,O-cZ)-pW},                            (8)

the following stronger bound holds:

    (8) <= e+2sqrt(kWe)-mW-(3/76)|nu|^2.                    (9)

The A/B core X and its fixed remote trial remain unchanged. The only
new choice is the explicitly allowed deterministic constant c, with
its full price |c|^2 included.

More exactly, for any one deterministic 0<theta<1 set

    Re c=-(3/10)Re nu/(1-theta+k),
    Im c=-(3/5)Im nu/(1-theta+k).

Then

    |c|^2+E D(X,O-cZ)-pW
      <= kW/(1-theta)+e/theta-pW
       -[(9/100)(Re nu)^2+(9/25)(Im nu)^2]
                       /[(1-theta)(1-theta+k)].             (10)

Taking theta=sqrt(e)/(sqrt(kW)+sqrt(e)) gives (9); endpoint cases follow
by limits. This theta depends only on global energies, never on a sampled
remote value. The credit is at least (3/76)|nu|^2 because
(1-theta)(1-theta+k)<=1+k=57/25.

Alternatively, choose the fixed theta=497/15625. Then the first three
terms on the right of (10) are at most (15625/284)V, and the exact
phase-dependent credit is verified by the companion checker. Its imaginary
coefficient is four times its real coefficient. Formula (10) is preferable
when nu is known; (9) gives a phase-free region. In particular the sufficient
condition (5) enlarges to

    (p/m)e <= (1/100)U+s(q)+1/20000+(3/76)|nu|^2,             (11)

or replace (p/m)e by the capped maximum (7). The sharper interval
|nu|^2<=W<=1/50 can also be used, as specified after (7).

## 3. New even inverse-potential certificate

Absorb a remote constant into the proof's base:

    q'=q+(3rho/5)r_B,
    Y=L+q',
    H=(T-2/5)r_A+Z^2 conjugate(r_B)/sqrt(2),
    X=Y+H.

This is an exact identity for the fixed X, not a change of trial. The
reviewed odd theorem accepts every remote q', so its possible linear
component has no effect on its applicability.

For fixed remote A=r_A, B=r_B, put S=|A|^2+|B|^2. Cauchy-Schwarz gives

    |H|^2<=S W_0(T),
    W_0(t)=(t-2/5)^2+t^2/2
          =3t^2/2-4t/5+4/25.                               (12)

The pushforward under z->L(z) has real Jacobian

    D_0(t)=(a+bt)(a+3bt).

The new scalar certificate proves, for every t>=0,

    e^(-t) W_0(t)/D_0(t) <14/25.                           (13)

This is a fully exact finite calculation. The checker constructs

    P(t)=(14/25)D_0(t)sum_(j=0)^12 t^j/j!-W_0(t).

All degree-14 Bernstein coefficients are positive on each of the 128
closed intervals [i/32,(i+1)/32], i=0,...,127. Every coefficient of
P(4+x) is positive, covering x>=0. Since exp(t) is at least its positive
Taylor sum on t>=0, these checks imply (13) on the complete half-line.
No floating-point transcendental function or quadrature is used.

The measure |H|^2 d gamma_Z, pushed forward under L, therefore has density
at most (14/(25pi))S. Its exact mass, by angular orthogonality, is

    M=(34/25)|A|^2+|B|^2.                                  (14)

A planar measure of mass M and density at most d has, at every shift,
inverse potential at most 2sqrt(pi d M). Indeed its mass in a ball of
radius r is at most min(M,pi d r^2), and integration in r proves the bound.
Consequently, uniformly in every complex remote shift w,

    E_Z |H|^2/|L+w| <=2sqrt[(14/25)S M].                    (15)

Average (15), using Cauchy-Schwarz only on the two nonnegative remote
energies S and M, to obtain

    E |H|^2/|Y| <=e.

Since 4(14/25)(34/25)<(7/4)^2, this also proves the scalar bound
E|H|^2/|Y|<(7/4)V when V>0. No independence among remote fields was used.

## 4. Finite-amplitude convex interpolation

For x!=0 let R_x(h)=|x+h|-|x|-Re(conjugate(x)h)/|x|.
The norm support inequality gives 0<=2R_x(h)<=|h|^2/|x|. Convexity
applied separately to

    x+h +/- o=(1-theta)(x +/- o/(1-theta))+theta(x+h/theta)

gives the exact inequality

    D(x+h,o)<=(1-theta)D(x,o/(1-theta))
                  +2theta R_x(h/theta)-2R_x(h).              (16)

Drop the last, nonpositive term. Apply the reviewed odd-core certificate
at Y=L+q', and (15) to the second term. This gives

    E D(X,O)<=kW/(1-theta)+e/theta.                         (17)

The compensation terms in the conditional odd theorem average to zero
because EQ=0 and nu is deterministic, also after rescaling by the one
fixed number 1/(1-theta). They do not require E[Q|q']=0. Optimizing the
scalar theta proves (2); maximizing the resulting concave expression
over W proves (3) and (7).

For (10), replace Q by Q-c in that same conditional certificate. Its
compensator averages to (3/5)Re(c)Re(nu)+(6/5)Im(c)Im(nu), while
E|O-cZ|^2=W+|c|^2. Add the required |c|^2 trial price and minimize the
resulting real quadratic separately in Re(c), Im(c). This gives exactly
(10), including the displayed minimizer.

The only inverse norm used is at the remote base Y. This base is a translate
of a diffeomorphic visible coordinate conditionally on the remote fields.
Zeros or critical points of X do not enter any denominator. Every bound is
finite-amplitude; no Taylor remainder, exceptional event, small-ball
assumption, or Gaussian-tail truncation occurs.

## 5. Inputs and verification

The inherited odd input is the reviewed theorem in current-master
`sources/odd-cubic-core-2026-11-15/PROOF.md`, especially its conditional
inequality (4), matrix certificate (7), and compensation averaging.
The four signed-slack values in the table are supplied inputs; the present
note verifies their quantitative implications and does not re-prove them.

Run `node check_odd_region.mjs`. It verifies (13), the exact potential
constant, theta, all scalar cutoffs, the W-capped first row, and the retained
nu coefficients using rational arithmetic. The polynomial proof is new;
it improves the old 217/100 potential constant by absorbing only a remote
constant into the analysis base. Neither that algebraic identity nor the
retained-c choice changes the fixed A/B trial X.

## 6. Stronger corollary from the recentered 11/10 potential

This section uses the separately supplied theorem in
`../odd-perturb/RECENTERED_EVEN_POTENTIAL.md`, whose numerical checker is
`../odd-perturb/verify_recentered.py`. It asserts, at the peak profile,
for every complex w,A,B,

    E_Z |(T-27/50)A+Z^2 conjugate(B)/sqrt(2)|^2/|L+w|
       <=(11/10)(|A|^2+|B|^2).                             (18)

The companion checker here verifies only the subsequent rational assembly;
it does not certify (18). The separate input has a completed 600-interval
certificate on [0,6] and an exact analytic tail beyond 6. The proof and
code were independently reviewed by proof_review, who freshly compiled
and replayed the full certificate: PASS on all 600 shift intervals and
1,885,070 source cells, including tail and unsafe-compilation checks.
The independent receipt is in `../review/recenter-replay/`. That reviewer
also separately replayed the sharp rational assembly here: PASS.

Use the alternative exact decomposition of the same fixed X:

    q''=q+(7/50)r_A+(15159/50000)r_B,
    H'=(T-27/50)r_A+Z^2 conjugate(r_B)/sqrt(2),
    X=L+q''+H'.                                           (19)

The coefficient 15159/50000 is exactly 3rho/5. The odd theorem permits
every remote q'', including this one with shared linear terms. Applying
the same convexity proof with (18) gives every bound (2)-(11), now with

    e_sharp=min{2sqrt[(14/25)V((34/25)E_A+E_B)],(11/10)V}.

These are two complete estimates with deterministic global parameters;
one may select the smaller energy bound before choosing theta. There is
no sample-dependent choice of anchor or theta. In fact, (11/10)V is the
smaller term for every V>0, so e_sharp=(11/10)V numerically.

In particular,

    E D(X,O)-pW <=(34375/994)V,

and the allowed retained-c infimum is at most

    (34375/994)V-(3/76)|nu|^2.                              (20)

The coefficient is approximately 34.582495. The sharp numerical-input
version of the four prefix regions is:

| Remote-energy range | Supplied lower bound for s(q) | Sufficient upper bound on V |
| --- | ---: | ---: |
| 0<=u<=1/100 | 11/10000 | 33888/1000000000 = 0.000033888 |
| 0<=u<=1/50 | 49/100000 | 15614/1000000000 = 0.000015614 |
| 0<=u<=3/100 | 1/10000 | 4337/1000000000 = 0.000004337 |
| 0<=u<=463/10000 | -9/25000000 | 1435/1000000000 = 0.000001435 |

The first row uses W<1/50 and the capped maximum (7); the remaining
three already follow from (20). The exact whole-range cutoff from (20)
is approximately 0.0000014354082909. Every displayed decimal in the table
is a downward-rounded rational value, checked exactly. The table does
not spend either the U credit or the retained nu credit.

For the largest region provided by this method, keep the actual values
of W,U,nu and use

    (11/10)V+2sqrt[(32/25)(11/10)VW]-(1988/47275)W
        -(3/76)|nu|^2 <=(1/100)U+s(q)+1/20000.               (21)

For a guarantee uniform in W, maximize its first line over
|nu|^2<=W<=1/50 by clipping W_*=(32/25)(11/10)V/m^2 to that interval.
The exact phase-sensitive credit in (10) is also available. Equations
(20)-(21) preserve all original sharing, dimension, and fixed-trial
requirements; only the explicitly permitted deterministic c is changed
when its credit is used.
