<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/all_shift_signed_ab/all_shift_certificate/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# All-shift signed infinitesimal A/B theorem — three rows

## Certified result

Let (eps,l,b) be any of

- peak: (1891/2500,1057/1250,179/1250);
- flank: (149/200,4267/5000,1467/10000);
- upper: (1891/2500,877/1000,19/125).

Set a=l-2b, p=1/eps, L=z(a+b|z|^2). Let q be any complex remote L^2
random variable independent of z. Let r_A,r_B be any remote L^2 complex
random variables, with arbitrary dependence on q and each other, and set

    h=(T-1)r_A + z^2 conj(r_B)/sqrt(2).

No chaos restriction or remote energy bound is needed for this result.
Here F_A(q)=E_z[(T-1)ph(L+q)] and
F_B(q)=E_z[(z^2/sqrt(2))conj(ph(L+q))], with ph(X)=X/|X|.
Define Q_q by the second-order expansion

    Lambda(q+s h) = Lambda(q)
      + 2s Re E[conj(r_A)F_A(q)+conj(r_B)F_B(q)]
      - s^2 Q_q(r_A,r_B) + o(s^2).

Then, at all three rows,

    Q_q(r_A,r_B) >= .241 ||r_A||_2^2 + .261 ||r_B||_2^2
                              + .236 Re E[r_A conj(r_B)].          (THEOREM)

Equivalently the signed matrix [[.24,.118],[.118,.26]] is valid with
an additional .001 I of uniform infinitesimal slack.

This is an infinitesimal theorem at arbitrary remote bases q. It is NOT a
finite-amplitude signed cost theorem: bases q+s h depend on z and are not
remote. No uniform nonzero amplitude radius is claimed. The theorem does
not settle subproblem J or Conjecture K.

## Exact Hessian representation

For X!=0,

    D^2 |X|[h,h] = (Im(h conj(X)))^2/|X|^3.

Both norm terms in Lambda(q+s h) have equal expectations, since q,h are
even in z and L is odd. Also the energy cross terms vanish after integrating
z. Therefore

    Q_q = p(||r_A||_2^2+||r_B||_2^2)
                     - E[(Im(h conj(L+q)))^2/|L+q|^3].             (1)

The usual norm majorant bounds the linear-subtracted norm remainder by
s^2|h|^2/(2|L+q|). Its expectation is finite: pointwise
|h|^2 <= [(T-1)^2+T^2/2](|r_A|^2+|r_B|^2), and the pushforward of the
bracketed weight under z -> L has finite mass and bounded planar density.
The elementary mass/density potential bound makes its inverse-distance
potential uniformly bounded in q. This justifies dominated convergence for
the expansion, including arbitrary sharing and unbounded remote variables.

## Shift rotation and regular integral

Condition on remote coordinates. Simultaneously rotating z and both shell
coefficients reduces q to the nonnegative real shift x=|q| and preserves
Re[r_A conj(r_B)]. Push forward the visible Gaussian measure by y=L(z):

    rho_L(y) = exp(-t)/[pi(a+bt)(a+3bt)],
    |y|=sqrt(t)(a+bt).

Use polar coordinates around y+x=0, namely y=R exp(i psi)-x. The 1/R factor
in the norm Hessian cancels the R in the area element. Consequently the
quadratic gain is the integral of

    rho_L(R exp(i psi)-x) (Im[h exp(-i psi)])^2 dR dpsi.             (2)

The shell fields in y-coordinates are A=t-1 and
B=y^2/[sqrt(2)(a+bt)^2], since z=y/(a+bt). The radial inverse is

    sqrt(t)=2sqrt(a/(3b)) sinh((1/3)asinh(3sqrt(3b)|y|/(2a^(3/2)))).

Write B=B_re+i B_im. Reflection psi -> -psi splits the four real coefficient
directions A,iA,B,-iB into two real 2x2 blocks. Their feature vectors are

    v_re=(-A sin(psi), B_im cos(psi)-B_re sin(psi)),
    v_im=( A cos(psi),-B_re cos(psi)-B_im sin(psi)).

Let K_re(x),K_im(x) be their outer products integrated against rho_L dR dpsi.
We certify, uniformly for all x>=0,

    p I - K_re(x), p I - K_im(x)
                       >= [[.24,.118],[.118,.26]] + .001 I.       (3)

Conditioning and integrating proves (THEOREM).

## Compact shifts: rigorous interval cover

For each row, 158 rational intervals cover [0,6] without gaps:
30 intervals of width .01 on [0,.3], 28 of width .025 on [.3,1], and
100 of width .05 on [1,6]. There are 474 row/interval checks in total.

kernel.py encloses the ENTIRE shift interval in one Arb ball. It partitions
R in [0,20] with endpoints 20 j^2/N^2, and psi in [0,pi] uniformly, multiplying
by two for reflection. It encloses the integrand throughout each box and
multiplies by its exact integration lengths. The inverse, exponential, and
trigonometric functions are evaluated with Arb at 80 bits. No numerical
quadrature-error estimate is assumed. Final accepted resolutions were N=256
or N=512; the runner also permits N=1024 if needed.

For R>20 and x<=6, |y|>14. The code uses the weaker |y|>12 and checks at
each row that sqrt(15)(a+15b)<12. Thus t>15. A conservative operator-norm
bound for each matrix tail is

    tail = (2/20) E[(T-1)^2+T^2/2;T>15]
         = .1 exp(-15)[1.5(15^2+2*15+2)-2(15+1)+1].

The code subtracts tail I from p I-K_truncated-M, where
M=[[.24,.118],[.118,.26]]. For each block it certifies positive diagonal
entries and determinant. The stored lower bounds on these three quantities
are in results.json.

Every determinant lower bound exceeds .0022. Since the trace of the true
truncated difference matrix is at most 2p-.5<2.2 (K_truncated is positive
semidefinite), its smallest eigenvalue is at least determinant/trace >.001.
The minimum certified determinant/2.2 bound over all boxes exceeds
.00115518498801777. The tail allowance already included makes this a
bound for the full gain matrices.

verify_cover.py audits the exact rational mesh coverage and all stored
inequalities at 256-bit precision. It is an audit of certificate summaries;
run_cover.py must be run to independently regenerate the integration bounds.

## All remaining shifts x>=6: analytic tail, exact rational checker

For any pair of constant shell coefficients, Cauchy-Schwarz bounds its
Hessian gain by the inverse-distance potential of the measure with weight

    W(t)=(t-1)^2+t^2/2=1.5t^2-2t+1.

This measure has total mass 2 and planar density

    W(t) exp(-t)/[pi(a+bt)(a+3bt)].

Split at |y|=3. For x>=6 the near part contributes at most 2/(x-3)<=2/3.
At all rows sqrt(5)(a+5b)<3, so the far part is contained in t>5. Its mass
is at most 44.5 exp(-5)<.300. Its density is at most .056/pi: on t>=5,
W(t)exp(-t) decreases, both denominator factors increase, and the smallest
a,b occur at the peak row. Thus the maximum is bounded using t=5 and the
peak a,b, giving 28.5 exp(-5)/[(a+5b)(a+15b)]<.056.

For a planar measure of mass m and density <=M/pi, its inverse-distance
potential is at most 2sqrt(mM), uniformly in its center. Proof: for any r>0,
use 1/|y| <= 1/r+(1/|y|-1/r)_+, obtaining m/r+Mr; minimize in r.
Therefore the full gain is at most

    2/3+2sqrt(.300*.056)<.927

per unit coefficient energy. Since M_target<=.378 I by row sums and
p>=2500/1891>.927+.378+.001, (3) follows for all x>=6.

verify_tail.mjs verifies all numerical inequalities above with BigInt
rational arithmetic only, bounding exp(5) below by its degree-30 Taylor
polynomial. The monotonicity assertions are elementary derivative signs,
proved above rather than checked by a mesh.

## Replay

Run from the directory containing the all_shift_certificate folder:

    python all_shift_certificate/run_cover.py
    python all_shift_certificate/verify_cover.py
    node all_shift_certificate/verify_tail.mjs

Python dependency: python-flint (tested with 0.9.0). JavaScript: Node, no
packages. The full interval cover uses four worker processes and took about
three minutes in the original environment. No sub-agents or external inputs
are involved. The two summary/tail checks finish in under a second.
