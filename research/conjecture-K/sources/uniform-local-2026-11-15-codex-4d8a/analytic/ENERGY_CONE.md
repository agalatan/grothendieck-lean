<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/analytic/ENERGY_CONE.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- handoff/codex-4d8a-compensated-joint/analytic/ENERGY_CONE.md; Agent-ID: codex-4d8a. -->
# A joint energy cone from the compensated remote theorem

Agent-ID: codex-4d8a. Analytic result, 15 November 2026.
This is a new sufficient region, not a proof of the full compact joint premise.
It uses the two reviewed computer-assisted premises stated below; it needs no
new quadrature and no bound on the deterministic visible coefficient nu.

## 1. Definitions and the exact statement

Use the definitions of near-star `PROOF_NOTES.md`:

    p = 2500/1891, rho = 5053/10000,
    Y = L+q,
    K = (T-2/5)r_A + (3/5)rho r_B + Z^2 conjugate(r_B)/sqrt(2),
    O = ZQ + conjugate(Z)P + nu Z(T-2)/sqrt(2),
    S_r = |r_A|^2+|r_B|^2, V = E S_r,
    omega = |Q|^2+|P|^2+|nu|^2, W = E omega,
    R = r_A+rho r_B, U = r_B-rho r_A.

Here q,Q,P are remote, Q is centered, nu is deterministic, and all the remote
variables may share their randomness. The two r fields are complex-linear
forms in standard complex Gaussians; in particular they are jointly proper
complex Gaussian. All expectations below are integrable for genuine Wick
fields. Define

    R_joint = E_Z[|Y+K+O|+|Y+K-O|-2|Y|
                         -2 Re(K conjugate(ph(Y)))],
    B_P = (p-463/5000) S_r -(67/100)|R|^2 -(2/25)|U|^2
                           +( |q|^2/2+S_r ) S_r,
    C_new = 2h[(11/20)Re(Q)Re(nu)+Im(Q)Im(nu)],
    h = (I_2-2I_1)/sqrt(2),
    F_joint = R_joint-B_P-p omega-C_new.

The phase at zero may be defined as zero. For fixed remote values Y has at
most one visible zero, so this choice does not change the integrals.

Put

    alpha = 217/100, c = 32/25, kappa = p-c,
    m = p-463/5000-(67/100)(1+rho^2)
      = 7344303698127/18910000000000,
    g = alpha-m = 33690396301873/18910000000000.

**Theorem.** At every amplitude, with arbitrary sharing and no nu cap,

    E F_joint <= g V + 2 sqrt(alpha c V W) - kappa W
                    -(3/2)V^2 -(1/2)E[|q|^2 S_r].           (1)

In particular,

    V <= W/6400  implies
    E F_joint <= -W/10000 -(3/2)V^2 -(1/2)E[|q|^2 S_r].     (2)

The sharper covariance-dependent form replaces `(3/2)V^2` by

    V^2 + (E|r_A|^2)^2 + (E|r_B|^2)^2
          +2|E[r_A conjugate(r_B)]|^2,

and replaces mV by the exact expectation of the quadratic part of B_P.

## 2. The two inherited premises

1. The global even inverse-potential bound, near-star proof section 3:

       E_Z[|K|^2/|L+w|] <= alpha S_r

   for every w,A,B. Its proof is a polynomial upper bound for the weighted
   pushforward density, followed by the planar mass/density potential bound.
   The strict source bound is weakened to a non-strict one here.

2. The compensated remote odd theorem, odd-cubic-core `PROOF.md`:

       E_Z[|Y+O|+|Y-O|-2|Y|] <= c omega + C_old,
       C_old = -(3/5)Re(Q)Re(nu)-(6/5)Im(Q)Im(nu),

   uniformly in all fixed remote coefficients and all amplitudes. This uses
   the two certified 3-by-3 matrix families on 0<=|w|<=8 and the analytic
   exterior. Both E C_old and E C_new vanish because EQ=0 and nu is constant.

No claim that either compensation vanishes conditionally is used.

## 3. Convex splitting of the joint remainder

For each fixed x and coefficients k,o, and each constant 0<t<1, convexity gives

    |x+k+o| <= t|x+k/t|+(1-t)|x+o/(1-t)|,
    |x+k-o| <= t|x+k/t|+(1-t)|x-o/(1-t)|.

Subtracting `2|x|+2 Re(k conjugate(ph(x)))` yields

    R_joint(x;k,o)
      <= t Rem_even(x;k/t)+(1-t)D(x,o/(1-t)),

where `Rem_even(x;k)=2(|x+k|-|x|-Re(k conjugate(ph(x))))`.
The norm support inequality gives `Rem_even(x;k)<=|k|^2/|x|`.
After visible integration the first inherited premise therefore contributes
`alpha S_r/t`. The second contributes `(c omega+C_old)/(1-t)`.

Now average all remote variables. Crucially, t is ONE constant independent
of those variables, so its presence does not spoil centering:

    E R_joint <= alpha V/t+c W/(1-t).                        (3)

For V,W>0 choose

    t = sqrt(alpha V)/(sqrt(alpha V)+sqrt(c W)).

This is a function of the two deterministic global energies, not a random
samplewise choice. Equation (3) becomes

    E R_joint <= (sqrt(alpha V)+sqrt(c W))^2.                (4)

The boundary cases V=0 or W=0 follow directly from the inherited premises,
or by a limit in (3). No minimizer or differentiability is required.

## 4. Subtracting the preserved even margin

The identity `|R|^2+|U|^2=(1+rho^2)S_r` and 67/100>2/25 imply

    B_P >= m S_r+S_r^2+(1/2)|q|^2 S_r.

For the jointly proper Gaussian pair r_A,r_B, Wick's identity gives

    E S_r^2 = V^2+(E|r_A|^2)^2+(E|r_B|^2)^2
                    +2|E[r_A conjugate(r_B)]|^2 >= (3/2)V^2.

Subtract this lower bound and pW from (4). Because E C_new=0, the result
is exactly (1). This keeps all of B_P's nonnegative quartic margin.

For (2), put x=V/W when W>0. The function
`g x+2sqrt(alpha c x)-kappa` increases on x>=0. At x=1/6400,
its value is strictly below -1/10000. Here is an exact rational certificate.
Let

    r = kappa-g/6400-1/10000
      = 5043487203698127/121024000000000000 >0.

Then

    r^2-4 alpha c/6400
      = 9903485930752390624943308129
         /14646808576000000000000000000000000 >0.

Consequently `r>2sqrt(alpha c/6400)`, proving (2). If W=0 the hypothesis
forces V=0 and (2) is immediate.

The exact maximal ratio admitted by the linear part of (1) is

    V/W <= [kappa/(sqrt(alpha c+g kappa)+sqrt(alpha c))]^2,

approximately 0.000157051194. The rational 1/6400 leaves an explicit reserve.

## 5. Consequence for the inherited all-sector assembly

Under the genuine-chaos energy hypotheses used by the near-star cession
certificate, its unconditional identity/estimate is

    T_(xi0,0)(G)-S
      <49e-6-.01||U||^2-sigma+D_minus+E F_joint,

and its inherited remote theorem gives `sigma-D_minus>-.36e-6`.
Thus on V<=W/6400,

    Lambda_hat(G) < S+49.36e-6

with the further negative terms in (2) available. No pointwise (P), no
pointwise (J), and no conditional centering are premises of this regional
conclusion. The cone theorem itself has no u, total-energy, or nu cap; the
numerical 49.36e-6 consumer statement retains the cession's original caps.

This cone permits nonzero A/B shells and arbitrary shared odd fields. It is
narrow: W=.005 permits V<=7.8125e-7. It extends the remote-core theorem to a
genuine nonzero-shell region, but it does not close the residual interior near
V=.01,W=.005, nor prove Conjecture K or an improved Grothendieck endpoint.

## 6. Improvement using the new sharp anisotropic joint lemma

The sharp joint lemma independently derived by the matrix worker and checked
again here states, for complex k,o and 1/2<beta<=1,

    |1+k+o|+|1+k-o|-2-2Re k
      <= [beta/(2beta-1)](Re k)^2+(Im k)^2
                           +beta(Re o)^2+(Im o)^2.           (5)

For completeness, dualize the two moduli using |u|,|v|<=1. Write
`s=(u+v)/2,d=(u-v)/2` and optimize the resulting linear terms in k,o
against the quadratic right side. The required maximum is

    2(Re s-1)+(Re s-1)^2/a+(Im s)^2
                              +(Re d)^2/beta+(Im d)^2,
    a=beta/(2beta-1).

It is convex in each disk variable u,v, so its maximum is achieved with
both of modulus one. Then `s=t exp(i theta)` and
`d=+/-i sqrt(1-t^2)exp(i theta)`, for 0<=t<=1, and the expression becomes
exactly `-[(1-beta)/beta](t-cos theta)^2`. This proves (5).

Take beta=91/180, so a=91/2. Rotate and scale (5) at Y. Compared with
the old odd majorant, the additional odd term is
`(1/180)(Re(conjugate(ph(Y))O))^2/|Y|`, bounded by
`|O|^2/(180|Y|)`. The even term is bounded by
`(91/2)|K|^2/|Y|`.

The reviewed separate potentials in progress-a7c4 `ODD_CONTROL.md` satisfy

    E_Z[T/|L+w|] <= p-1/100,
    E_Z[T(T-2)^2/(2|L+w|)] <= p-11/50

uniformly in w. The L2 triangle inequality followed by ordinary
Cauchy-Schwarz therefore gives, with arbitrary sharing,

    E[|O|^2/|Y|]
      <= [sqrt(p-.01)(sqrt(E|Q|^2)+sqrt(E|P|^2))
                              +sqrt(p-.22)|nu|]^2
      <= d W,   d=3p-6/25=176154/47275.

The old compensated odd matrix inequality and EC_old=EC_new=0 now yield

    E F_joint <= A V-delta W-(3/2)V^2-(1/2)E[|q|^2 S_r],
    A=(91/2)alpha-m=1859734546301873/18910000000000,
    delta=kappa-d/180=30281/1418250.                          (6)

Both constants and the inequality are exact. In particular,

    V<=W/4700  implies
    E F_joint <= -W/2500-(3/2)V^2-(1/2)E[|q|^2 S_r].         (7)

Indeed

    delta-A/4700
      =113624361094381/266631000000000000 >1/2500.

This stronger cone likewise has no nu cap and no energy restriction beyond
the explicitly stated ratio; the consumer corollary retains the old cession
caps. It needs no new integration: its numerical premises are precisely the
reviewed old odd matrix certificate, the reviewed even inverse-potential
bound, and the reviewed separate odd potentials. Unlike (1), it also uses the
new analytic inequality (5), whose entire proof is given above.
