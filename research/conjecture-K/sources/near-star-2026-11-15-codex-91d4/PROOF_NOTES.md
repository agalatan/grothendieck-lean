<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/near-star-continuation/PROOF_NOTES.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Centered joint remainder: reduction and exterior

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P:** written analytic arguments below. **C:** fresh exact scalar,
radial-integral and assembly checks. **N:** separate numerical probes.
All new results await claude-b9ee's independent review. The compact
joint premise, and therefore the general gap near u-star, remain OPEN.

## 1. Domain, the proposed premise, and both coupling channels

Use the task's genuine H21/H11/H20 fields, arbitrary sharing in every
finite dimension, u<=.0463, total energy<=.080051 and the unchanged
response ellipsoid. This continuation concerns global W<1/50; the
global W>=1/50 problem remains with codex-8d2f. In particular the
constant nu satisfies |nu|²<1/50. No conditional restriction on the
sampled values of q,r_A,r_B,Q,P follows from these global energies.

For fixed remote values w,A,B,Q,P and constant nu, write

```
Y=L+w, L=Z(a+bT), T=|Z|²,
K=(T-2/5)A+(3/5)rho B+Z²conjugate(B)/sqrt(2),
O=ZQ+conjugate(Z)P+nu Z(T-2)/sqrt(2),
S_r=|A|²+|B|², omega=|Q|²+|P|²+|nu|²,
R=A+rho B, U=B-rho A.
```

Here a=699/1250,b=179/1250,p=2500/1891,rho=5053/10000. The
remote trial is unchanged, xi0=-(3/5)(r_A+rho r_B), and c=0 globally.
Define the old pointwise right side exactly as in(P):

```
B_P=(p-463/5000)S_r-(67/100)|R|²-(2/25)|U|²
                               +( |w|²/2+S_r )S_r.             (1)
```

The joint remainder, including the actual finite odd secant, is

```
Rjoint=E_Z[|Y+K+O|+|Y+K-O|-2|Y|
                               -2Re(K conjugate(ph(Y)))].      (2)
```

Let I_k be the peak radial integrals from the prior direct certificate
and put h=(I2-2I1)/sqrt(2). Fresh exact integration gives |h|<61/100
and h<0. Define the real quadratic centering term

```
C(Q,nu)=2h[(11/20)Re(Q)Re(nu)+Im(Q)Im(nu)],
F_joint=Rjoint-B_P-p omega-C(Q,nu).                            (3)
```

The two coefficients are inherited from the finite 9/20 directional
majorant at L. Their particular choice motivates the tests, but their
zero expectation uses only that h is a fixed real constant, nu is a
single constant and EQ=0. Thus EC=0 under arbitrary sharing. Neither
E[Q|q]=0 nor E[Q|A,B]=0 is assumed. In real coordinates the two
Q/nu blocks have off-diagonal entries (11/20)h and h; both remain
present throughout the conditional calculation.

The stronger pointwise candidate is

```
F_joint<=0 for all remote coefficients with |nu|²<=1/50.        (J)
```

At O=0, C=0 and(2) is exactly the A/B remainder in(P), so(J) reduces
to(P). At a nonzero A/B core it allows the entire unused margin in(P)
to pay odd gain. It is therefore not the false conditional inequality
`odd increment<=quadratic odd price` at every A/B zero. The remainder
is finite at those zeros. At Y=0 the phase is defined as 0; this occurs
at one visible point because z->z(a+b|z|²) is a diffeomorphism, and
does not change the expectation.

We do NOT prove(J) in its compact interior. A weaker averaged target,
E F_joint<=50e-6, is already sufficient for the requested cap.

## 2. Exact averaged reduction and signed deficit

Visible parity converts the task's two norm terms into those in(2).
With raw Lambda(q)=2E|L+q|-pu, the matched content pairings are
unchanged. The genuine shared moments

```
E[|q|² S_r]<=4uV, E[S_r²]<=2V²
```

therefore give, WITHOUT assuming(P) or(J),

```
T_(xi0,0)(G) <= Lambda(q)+J_AB+E F_joint,
J_AB=2Re<c_A,R>+2Re<e,r_B>-.31||R||²-.08||U||²
                                          +2V(u+V-.0463).      (4)
```

Indeed pE omega=pW cancels the odd penalty exactly and EC=0. The
retained trial norm changes-.67||R||² into-.31||R||². The two shared
moments bound precisely the quartic part of(1), not any signed
centering term. The E F_joint term is the entire remaining defect;
no separate even or odd error is silently omitted.

All terms are integrable. The norm support inequality gives
0<=Rjoint<=4E_Z|K|+2E_Z|O|, and the remaining terms in F_joint have
finite Gaussian polynomial moments. The sharp shared moment bounds
also directly control the quartic term in(1). Thus the subsequent
event split and expectation of the positive part are well-defined.

The frozen scalar certificate gives
`J_AB+.01||U||²-D_plus<49e-6`. It is re-executed here with its
unchanged rational multipliers. The matched-content premises and
uniform remote theorem remain explicit inherited analytic inputs.
Using Lambda(q)=S-sigma-D and D_plus-D=D_minus, (4) yields

```
T_(xi0,0)(G)-S
 <49e-6-.01||U||²-sigma+D_minus+E F_joint.                     (5)
```

The inherited signed bound sigma-D_minus>-.36e-6 now shows:

- (J) on the whole remote law would give T<S+49.36e-6;
- E F_joint<=50e-6 gives T<S+99.36e-6<S+1e-4.

These are conditional implications, not new full-domain theorems.
The latter has reserve .64e-6 below the requested cap, consistent with
the consumer allowance. More sharply, one may retain sigma-D_minus
and the favorable U credit in(5). No sign assumption about D, new
fraction of D_plus, altered A-content coefficient or extra retained
penalty is introduced. The previous .01 U cession is not spent by
the flat residual criterion.

## 3. A global even inverse-potential bound

For every w,A,B,

```
E_Z[|K|²/|L+w|] < (217/100)S_r       if S_r>0.                 (6)
```

This is the reviewed global primitive behind the exterior of(P);
we regenerate its scalar proof rather than import a saved PASS.
The exact pointwise envelope is

```
|K|² <= S_r W(T),
W(T)=(T-2/5)²+[(3/5)rho+(177/250)T]²,
D(T)=(a+bT)(a+3bT).
```

The verifier checks positivity on T>=0 of
`(81/100)D(T)sum_(j=0)^4 T^j/j!-W(T)`. Its constant coefficient is
686323/500000000>0. Write the rest as T q(T). All coefficients of q
of degree>=2 are nonnegative, so q is convex on T>=0. Its supporting
line at 5/4 has intercept 4102880111/64000000000 and slope
2094736121/64000000000, both positive. This proves positivity on the
ENTIRE half-line using exact polynomial identities.

Under y=L(z), the measure |K|²d gamma/S_r has density at most
81/(100 pi), and total mass at most
H²=1+(9/25)(1+rho²), since E_Z|K|²=S_r+(9/25)|R|².
The mass/supremum bound for the planar inverse potential is
`2sqrt(pi*density_cap*mass)`. Layer cake proves it by bounding each
disk's mass by the smaller of the total mass and its area times the
density cap. Consequently (6) follows from (9/5)H<217/100.
There is no unaccounted visible tail. For S_r=0, K=0 and(6) is
replaced by equality 0.

The same norm support inequality gives

```
Rem_even=2E_Z[|Y+K|-|Y|-Re(K conjugate(ph(Y)))]
                      <= E_Z[|K|²/|Y|] <= alpha S_r,
alpha=217/100.                                                  (7)
```

## 4. The joint large-shift exterior

For complex x!=0 and any v, square-root concavity gives
`|x+v|-|x|-Re(v conjugate(ph(x)))<=|v|²/(2|x|)`.
Apply it to v=K+O and v=K-O. Their odd linear terms and mixed
quadratic terms cancel, giving

```
Rjoint <= E_Z[(|K|²+|O|²)/|Y|].                                (8)
```

For the odd three-basis trace put

```
K_odd(T)=2T+T(T-2)²/2, E K_odd=3.
```

Cauchy-Schwarz in the THREE complex coefficients gives
|O|²<=omega K_odd(T), including every Q/P/nu cross term. To bound its
inverse potential uniformly in large |w|, split at T=9. On the inside,
|L|<=693/125, so the contribution is at most 3/(|w|-693/125).
For the outside density pushed forward by L, the mass and maximum are

```
354 exp(-9),
(477/2)exp(-9)/[pi(a+9b)(a+27b)].
```

The density decreases for T>=9: the logarithmic derivative of K_odd
is at most 1/9+2/7<1, before subtracting the positive denominator
derivative. Layer cake and a positive Taylor lower sum for exp(9)
bound the tail potential strictly by 13/500. Thus

```
E_Z[|O|²/|Y|]
 <= omega[3/(|w|-693/125)+13/500].                              (9)
```

The centering form obeys C>=-(61/100)omega. Also

```
B_P >= [m+|w|²/2+S_r]S_r,
m=p-463/5000-(67/100)(1+rho²)>0.                                (10)
```

At |w|=10 the bracket in(9) plus 61/100 is strictly below p-.01,
and m+50>alpha. Both comparisons only improve with |w|. Equations
(6),(8)-(10) prove(J) whenever |w|>=10, for ALL A/B and odd
amplitudes, even without the nu cap. A joint odd cost of at least .01
omega remains on this exterior. This is not a global energy-W
statement and does not use the separately owned large-W result.

## 5. Driver and conditioned-odd exteriors

Write g=alpha-m. Visible orthogonality gives E_Z|O|²=omega without
any conditional centering, since E[T(T-2)]=0 and angular averages kill
the P cross terms. The central secant is at most 2|O|. Hence

```
Rjoint<=alpha S_r+2sqrt(omega).                                (11)
```

When |nu|²<=1/50,

```
-C <= 2(61/100)|nu||Q| < (173/1000)sqrt(omega).
```

The last exact comparison squares two positive constants. Therefore
with k=2173/1000, (10)-(11) give the universal coercive bound

```
F_joint <= g S_r-S_r² +k sqrt(omega)-p omega
                                      -(1/2)|w|² S_r.          (12)
```

The checker verifies the following strict rational margins:

```
(11/5)²-g(11/5)-k²/(4p)>0,
4p-2k-g²/4>0.
```

For S_r>=11/5, S_r²-gS_r is increasing and the remaining odd
expression is at most k²/(4p). This proves(J) on that driver
exterior. For omega>=4, p omega-k sqrt(omega) is increasing and
gS_r-S_r²<=g²/4. This proves(J) on the conditioned-odd exterior.
The full curved sufficient region from(12) is also available; the
rectangular thresholds make the compact obligation easy to state.

## 6. The remaining compact averaged obligation

Within the assigned global W<.02 domain, define the remote event

```
K_comp={ |q|<10, S_r<11/5, omega<4 }.
```

The proved exteriors show F_joint<=0 outside this event, so it suffices
to prove the single averaged inequality

```
E[(F_joint)_+ 1_K_comp] <=50e-6.                               (13)
```

The phase gauge makes q nonnegative real when describing parameter
boxes; A,B rotate by the same phase, P by twice that phase, while Q
and nu remain unchanged. This does not change C or the energies.

Crucially, C is retained INSIDE F_joint on every event and every
box. Only its full expectation was removed in(4). For instance
Q=|Y1|²-1 is centered but E[Q||Y1|²>1]=1, not 0. Thus neither the
new exterior nor a future compact certificate licenses conditional
centering, or cancellation of a q-dependent coupling. The scalar
checker includes this rejection control.

Inequality(13) is OPEN. The near-u-star genuine probes are examples,
not a dimension-free proof of it. In particular the displayed
nonzero-driver u-star tuple has not acquired a rigorous cap from this
packet. No full L5 or new Grothendieck endpoint is asserted.

## 7. Shared matrix framework and its tested limitation

The amplitude-envelope inequality in a7c4's reviewed direction-cover
framework extends algebraically to the JOINT remainder. If
S_r<=s_E² and omega<=s_O², define

```
M_E(T)=sqrt((T-.4)²+(.6rho+T/sqrt(2))²),
M_O(T)=sqrt(K_odd(T)),
eta=min(1,(s_E M_E+s_O M_O)/|Y|),
alpha_eta=9eta/(2+eta)², beta_eta=4(1-eta)/(2+eta)².
```

For either sign, |K+/-O| is at most the numerator defining eta.
The pointwise one-sided norm remainder is bounded by
`[alpha_eta|K+/-O|²+beta_eta(Im((K+/-O)conjugate(ph(Y))))²]/(2|Y|)`.
When eta=1, the unconditioned inverse-potential inequality is used;
no false amplitude restriction is asserted. Adding the two signs
cancels the EVEN/ODD mixed blocks. It leaves one real4x4 even matrix
and one real6x6 odd matrix, with exactly the same source polar
coordinates Y=r exp(i theta) as a7c4's even certificate. The polar
Jacobian cancels 1/r, so the base zero is handled without deleting it.
The constant matrix C is subtracted from the odd block after integration.

If e and o bound the respective largest eigenvalues after subtracting
the quadratic part of B_P and pI+C, the resulting sufficient scalar
test is `e S_r+o omega-S_r²<=0` on an amplitude cell. At s_O=0 the
even source integrals reduce to the existing even matrix framework.
This is a proved reduction, not an accepted compact matrix bound.
Its shift/tail/error constants for the added odd entries would still
need certification; the even curvature constants do not transfer.

The bounded N feasibility test rejects the COARSE direction-free
envelope for the main interior: at w=.2,S_r=.01,omega=.005 its upper
bound is about +.00262145, and at the near-binding even core parameters
w=.6004,S_r=.1634,omega=.001 it is about+.08131886. In contrast the
actual finite joint tests at related points were negative. Negative
matrix upper values occur for tiny amplitudes and at w>=1.25 in the
sample, but they are not certificates. Thus no expensive cover of
this coarse envelope is launched. A direction-sensitive refinement,
sharing a7c4's existing driver cells, or a different compact averaged
allocation is needed. This is the next unresolved step.

The frozen source of the amplitude inequality is bundled as
`inputs/a7c4_PROOF.md`, Section 1. Its source and hash are recorded;
no current compact(P) source or curvature constant is modified or
re-certified here.
