<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/directional_odd_cost/directional_cost/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# Finite-amplitude directional cost at the inverse-norm obstruction

This proves pure cost on a specified nonzero A/B core and an odd perturbation
ray. It is not a uniform theorem over all cores or all odd-sector directions.

Use the peak row and the exact fields

    H=.152 w(|w|^2-2)+.106(T-1)w+.106 z^2 conj(w)/sqrt(2),
    O=z(|w|^2-1)+conj(z)w^2/sqrt(2).

Here ||H||^2=.06868 and ||O||^2=2. The certificate proves a strictly positive
cost in Lambda(H+tau O)-Lambda(H) at tau=.04 (certify_single.py), and uniformly
on tau in [.03,.04] (certify.py), including negative tau by parity.
The total energy is at most .07188<.072. Read the successful replay logs for
the certified constants. Both scripts must finish with their final assertion.

## A global directional majorant without a Taylor remainder

For X,Y in C set a=|X|, b=|Y|, c=Re(X conj(Y)), M=a^2+b^2.
Let C(X,Y)=|X+Y|+|X-Y|-2|X|. Then

    0 <= C(X,Y) <= U(X,Y)
       := 2[sqrt(M-c^2/M)-a] <= 2b,                 (1)

with U(0,0)=0. Indeed,

    (|X+Y|+|X-Y|)^2=2M+2sqrt(M^2-4c^2)
                              <=4M-4c^2/M.

The last inequality is sqrt(1-s)<=1-s/2 on [0,1]. Also c^2<=a^2 b^2,
so the radicand in (1) is at least a^2; sqrt(M)<=a+b proves U<=2b.

For Y=tau O, write A=|X|^2, B=|O|^2 and D=Im(O conj(X))^2. A stable form is

    U(X,tau O)/tau^2 = 2 n_tau/[sqrt(A+tau^2 n_tau)+sqrt(A)],
    n_tau=(D+tau^2 B^2)/(A+tau^2 B).                (2)

This expression has no subtraction of close square roots. At X=0 it is
2|O|/|tau|. Its small-amplitude limit at X!=0 is exactly the directional
quadratic coefficient D/|X|^3. Thus it retains the Hessian's longitudinal
cancellation instead of paying the full inverse-norm coefficient.

For the amplitude-interval certificate, n_tau increases with tau^2 because

    d n_tau/d(tau^2) = B(AB-D)/(A+tau^2 B)^2 >= 0.

Hence, for 0<tau_lo<=tau<=tau_hi, a valid upper bound for (2) uses n_tau_hi
in the numerator and sqrt(A+tau_lo^2 n_tau_lo)+sqrt(A) in the denominator.
The independent bound 2|O|/tau_lo is used whenever it is better or the box
contains a zero of the denominator.

## From the pointwise bound to Lambda

Since H is even in z and O,L are odd, changing z to -z in the second norm
term gives the exact identity

    Lambda(H+tau O)-Lambda(H)
      = E C(L+H,tau O) - p tau^2 ||O||^2, p=2500/1891.

Thus an upper bound J<2p for E[U(L+H,tau O)/tau^2] proves

    Lambda(H+tau O) <= Lambda(H)-[(2p-J)/2] ||tau O||^2.

## Rigorous integration and tails

Simultaneous rotation gives w=x>=0, z=s exp(i theta), with s,x in [0,infinity)
and theta in [0,pi]. The radial measures are 2s exp(-s^2)ds and
2x exp(-x^2)dx; the angular measure is dtheta/pi.

Both scripts partition [0,4]^2 times [0,pi] into N^3 boxes, default N=128.
They evaluate a pointwise interval upper bound for (2) on each box and
multiply by the exact Gaussian box mass. Truncating a theoretically
nonnegative interval quantity to its nonnegative part is valid. Boxes
containing a possible zero use the global upper bound 2|O|/tau_lo.

The omitted tails are bounded using

    |O| <= sqrt(t)[K r+1], K=1+1/sqrt(2),
    t=s^2, r=x^2.

On t>16, sqrt(t)<=t/4; E sqrt(t)=sqrt(pi)/2. A union bound gives

    E[|O|; t>16 or r>16]
      <= exp(-16)[(17/4)(K+1)+(sqrt(pi)/2)(17K+1)].

Multiply by 2/tau_lo to bound the omitted contribution to (2).
All arithmetic uses Arb at 80 bits, including exponential and trigonometric
enclosures. There is no unverified quadrature-error estimate.

Replay (requires python-flint):

    python certify_single.py 128
    python certify.py 128

The finite-amplitude theorem is restricted to the fields H,O above.
Its role is to establish rigorously that directional majorization succeeds
where condition (6) was certified to fail, and to provide a reusable scalar
majorant for a future uniform certificate. No claim about subproblem J is made.
