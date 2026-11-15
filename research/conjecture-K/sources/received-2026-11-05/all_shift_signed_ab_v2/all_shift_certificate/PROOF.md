<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/all_shift_signed_ab_v2/all_shift_certificate/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# Signed A/B Hessian at every remote shift

This extends the supplied smooth-kernel certificate. The change of variables is inherited from that certificate; the new parts are certified midpoint error bounds, a compact interval cover at all three rows, and an analytic all-shift tail argument.

## Statement and scope

Let Z be a standard complex Gaussian, T=|Z|², L=Z(a+bT), and p=1/epsilon. At each of the three rows

| row | a | b | epsilon |
|---|---|---|---|
| peak | 699/1250 | 179/1250 | 1891/2500 |
| flank | 14/25 | 1467/10000 | 149/200 |
| upper | 573/1000 | 19/125 | 1891/2500 |

the target is the common matrix

M = [[0.24,0.118],[0.118,0.26]].

For every constant shift x in C and every alpha,beta in C, put

Y=(T-1)alpha+Z² conjugate(beta)/sqrt(2).

The certificate proves the quadratic-form inequality

E_Z [(Im(Y conjugate(ph(L+x))))² / |L+x|]
 <= (p-0.24)|alpha|²+(p-0.26)|beta|²
                         -0.236 Re(alpha conjugate(beta)).

The zero set in the denominator has measure zero; the integral has its usual locally integrable interpretation. This is the quadratic gain coefficient in 2E|L+x+sY| at s=0. Equivalently, the negative quadratic coefficient of Lambda is bounded below by M.

Conditioning on the remote variables gives this same inequality for every remote q and every sharing of r_A,r_B for which the form is defined; the bound itself ensures integrability for L² r_A,r_B. There is no cubic hypothesis, dimension bound, or energy cap in this quadratic-form statement.

This is an infinitesimal result at remote bases. It does not imply finite-amplitude J: along q+sY the base acquires z-dependence. It does not prove Conjecture K or repair J2 as originally stated.

## Regular coordinates and the two blocks

The pushforward of Gaussian measure under y=L(z) has density

rho_L(y)=exp(-t)/[pi(a+bt)(a+3bt)],  |y|=sqrt(t)(a+bt).

Write y=R exp(i psi)-x, first taking x>=0 real. In the norm Hessian the factor 1/|y+x|=1/R cancels the polar area Jacobian R. Therefore its gain is

integral_0^infinity integral_0^{2pi} rho_L(y)
                  [Im(Y(y)exp(-i psi))]² dpsi dR.

Let A=t-1 and B=y²/[sqrt(2)(a+bt)²]=Br+i Bi. Reflection in the real axis splits the real coefficient coordinates (Re alpha,Re beta) and imaginary coordinates (Im alpha,Im beta). The features are

v=(-A sin psi, Bi cos psi-Br sin psi),
w=( A cos psi,-Br cos psi-Bi sin psi).

The two blocks K_re,K_im are the integrals of rho_L vv^T and rho_L ww^T. Both are checked against pI-M. General complex x follows by simultaneous rotation; the target Re(alpha conjugate(beta)) is invariant under the resulting common phase change of alpha,beta.

## Rigorous integration on 0<=x<=6

Each x band is represented by an Arb interval, so every calculation encloses the entire band, not samples. Integrate R in [0,24] and psi in [0,pi], multiplying by two. The R grid is quadratic on both sides of the band midpoint; the angular grid psi_j=pi(j/N)² concentrates cells near zero.

For each scalar matrix entry f on a cell with side lengths h_R,h_psi, use the product midpoint rule with error

|integral_cell f - h_R h_psi f(midpoint)|
 <= h_R h_psi [h_R² sup|f_RR| + h_psi² sup|f_psipsi|]/24.

This follows by applying the one-dimensional midpoint error bound successively. It requires no mixed derivative. The bounds on both second derivatives are evaluated on the FULL cell and full shift interval by forward interval differentiation. All operations use 80-bit Arb.

The inverse t of s=|y|² is evaluated by the explicit radial inverse from the inherited proof. Its derivatives are computed implicitly, avoiding differentiation through a square root at s=0:

F(t)=t(a+bt)²,
F'(t)=(a+bt)(a+3bt),  F''(t)=4ab+6b²t,
(dt/ds)=1/F'(t),  (d²t/ds²)=-F''(t)/F'(t)³.

The two univariate second-order derivative components track R and psi separately. Constants and grid endpoints are rational or Arb-enclosed multiples of pi. An interval result that is nonfinite or cannot prove the matrix inequalities is rejected, never accepted.

For R>24 and x<=6, |y|>18. At all three rows sqrt(17)(a+17b)<18, so T>17. A conservative operator-norm allowance for each omitted matrix tail is

(2/24) exp(-17)[(3/2)(17²+2*17+2)-2(17+1)+1].

It bounds the trace using the fields' squared norms. The checker subtracts this allowance from both diagonals of pI-M-K, then checks both positive diagonals and positive determinant, retaining the interval off-diagonal entry.

The cover files list the accepted bands. The replay checks adjacency and endpoints exactly and recomputes every band. Stored numerical output is not trusted as a certificate by itself.

## Analytic tail: every x>=6

For either block, the trace is bounded by

integral_C f(y)/|y+x| dy,

where f(y)=rho_L(y)P(t), P(t)=(t-1)²+t²/2.

Split at t=5. On t<=5, |y|<=r5=sqrt(5)(a+5b), and the contribution is at most 2/(6-r5), because E P(T)=2.

On t>5 the density f is bounded by

H=exp(-5)P(5)/[pi(a+5b)(a+15b)],

since exp(-t)P(t) decreases for t>=5 and the denominator increases. Its mass is

J=exp(-5)[(3/2)(25+10+2)-2(5+1)+1].

For any nonnegative planar density with mass J and essential supremum H,

integral f(y)/|y+x| dy <= 2 sqrt(pi J H).

Indeed, layer cake bounds the superlevel integral by integral_0^infinity min(J,pi H/s²) ds. Thus uniformly for x>=6,

trace(K)<=2/(6-r5)+2sqrt(pi J H).

Arb encloses these bounds by 0.893502 (peak), 0.897545 (flank), and 0.908491 (upper). Each is strictly less than p-0.378. The maximum row sum of M is 0.378, so pI-M >= (p-0.378)I. This proves both matrix inequalities on the entire unbounded tail.

## Next finite-amplitude step

The same regularization extends to the map

F_s(z)=L(z)+s[(|z|²-1)alpha+z² conjugate(beta)/sqrt(2)]

whenever it is a diffeomorphism. A sufficient, explicit condition for every 0<=s<=1 is

2|alpha|+sqrt(2)|beta| < 2sqrt(ab).

To prove it, the symmetric part of DL has smallest eigenvalue a+b|z|², while the operator norm of the perturbation derivative is at most |z|(2|alpha|+sqrt(2)|beta|). The difference is bounded below by a-(2|alpha|+sqrt(2)|beta|)²/(4b)>0. Strong monotonicity and properness give global invertibility.

In that region the pushforward density becomes exp(-|z|²)/(pi det DF_s(z)), with z=F_s^{-1}(y). Centering polar coordinates at y+x=0 again cancels the inverse-distance singularity. The Jacobian can be computed from

(F_s)_z = a+2b|z|²+s[alpha conjugate(z)+sqrt(2)conjugate(beta)z],
(F_s)_conjugate(z) = bz²+s alpha z,
det DF_s=|(F_s)_z|²-|(F_s)_conjugate(z)|².

This gives a rigorous next target for validated inversion and parameter integration. It is not yet a finite-amplitude cost certificate. In particular, small L² energies do not bound pointwise Gaussian alpha,beta. Outside a chosen parameter region one must bound the payoff remainder, not merely its probability; Markov alone does not control a possibly large Hessian.

## Replay and numerical provenance

Install python-flint in the Python environment, then run `python replay.py 3` from this directory. The integer is the number of independent checker processes. Replay recomputes every accepted shift band with interval arithmetic, verifies that the bands cover [0,6] without gaps at each row, and then proves the unbounded tail. The original interval-box method is also included as `independent_box_verify.py`; its successful check on [0.495,0.505] at the peak row is recorded separately. It is a cross-check, not an input to the all-shift proof.

The included cover logs were generated by the same checker that replay invokes. Adaptive discovery split failed bands; a failure to prove positivity was treated solely as a request for a smaller parameter interval. Only accepted intervals appear in the cover files. Every acceptance is based on Arb comparisons, never rounded displayed values.

Completed run: {'peak': 77, 'flank': 76, 'upper': 76}, 229 accepted shift intervals in total. All three compact covers and all three analytic tail checks passed.
