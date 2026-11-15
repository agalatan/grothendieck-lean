<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/variational/JOINT_ODD.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended path: handoff/codex-c7e2/variational/JOINT_ODD.md -->
# An improved simultaneous Q/P/d bound over the zero even core

Agent-ID: codex-c7e2. Current source examined: master 6bb44599190397f806d2db89b25df4e6785b758e.

This proves a strict improvement to the simultaneous zero-core odd-sector
majorant of STATUS 5.4/5.4c. It does not prove Conjecture K or control odd
increments over nonzero even cores. All the statements below allow arbitrary
sharing between remote Q and P.

## 1. Universal angular inequality

Put c=81/125=0.648. For every complex q and r>=0,

    average_theta (|1+q+r exp(i theta)|+|1-q-r exp(i theta)|)
       <= 2+|q|^2+c r^2.                                      (1)

This is a certified sufficient coefficient, not a claimed optimal one.

Proof. For arbitrary complex h, the exact paired-norm identity and
sqrt(1-t)<=1-t/2 for 0<=t<=1 give

    (|1+h|+|1-h|)^2
       <= 4(1+|h|^2)-4(Re h)^2/(1+|h|^2).

We first prove the exact angular lower bound

    average_theta (Re(q+r exp(i theta)))^2/(1+|q+r exp(i theta)|^2)
       >= r^2/[2(1+|q|^2+r^2)].                               (2)

Write s=|q|, D=1+s^2+r^2, Delta=sqrt(D^2-4s^2r^2)>0. After rotating
q to s, the covariance matrix of (Re h,Im h) weighted by 1/(1+|h|^2)
is diagonal: the off-diagonal entry vanishes by reflection. Let its diagonal
entries be A,B in that order. Direct integration gives

    B=r^2/(D+Delta),
    A-B=(s+r rho)^2/Delta >=0,
    rho=-2sr/(D+Delta).

For example these identities follow from
average exp(i k theta)/(D+2sr cos(theta))=rho^k/Delta for k=0,1,2,
which follows by the geometric series for the Poisson kernel. When sr=0,
the same formulas hold directly or by continuity. Thus every directional
quadratic form is at least B>=r^2/(2D), proving (2).

Jensen and (2) bound the left side of (1) by

    2 sqrt(1+|q|^2+r^2-r^2/[2(1+|q|^2+r^2)]).                 (3)

Put x=|q|^2 and y=r^2. Squaring the comparison of (3) with 2+x+cy
and multiplying by 1+x+y reduces it to P(x,y)>=0, where

    P=(x+cy)^2(1+x+y)-4(1-c)y(1+x+y)+2y
      =x^3+[1+(1+2c)y]x^2
        +[(6c-4)y+(2c+c^2)y^2]x
        +y[c^2 y^2+(c^2+4c-4)y+4c-2].

Discard the manifestly nonnegative x^3, (1+2c)yx^2 and
(2c+c^2)y^2x terms, and complete the square:

    P >= [x-(2-3c)y]^2
          +y[c^2 y^2-8(1-c)^2 y+4c-2].

For c=81/125 the last bracket is

    (6561 y^2-15488 y+9250)/15625.

Its discriminant is 15488^2-4*6561*9250=-2878856<0 and its leading
coefficient is positive. Therefore P>=0 for all x,y>=0. This proves (1)
by elementary exact algebra and an elementary circle integral.

## 2. Application to simultaneous odd sectors

Let Z be a standard proper complex Gaussian, T=|Z|^2, and

    L=Z(a+bT),  a>0, b>0, p>0,
    J_n=integral_0^infinity t^(n-1/2) exp(-t)/(a+bt) dt,
    O=ZQ+conjugate(Z)P+d Z(T-2).

Here Q,P are remote L2 random variables, independent of Z, with E Q=0;
they can depend arbitrarily on each other. d is any complex scalar. Set
vQ=E|Q|^2, vP=E|P|^2, h=2|d|^2. Orthogonality gives
E|O|^2=vQ+vP+h. Then

    Lambda(O) <= Lambda(0)
      -(p-J1)vQ -(p-c J1)vP
      -[p-(J3-4J2+4J1)/2]h.                                  (4)

Indeed, condition on T,Q,P and factor out sqrt(T) exp(i theta). The
brackets become (a+bT) +/- [Q+d(T-2)+P exp(-2i theta)]. Apply (1) after
scaling by a+bT. The Q,d cross term vanishes after remote expectation
because E Q=0. This proves (4).

For the retained functional, trial first-chaos corrections alpha Z yield
the same Q and P coefficients, and improve the d coefficient to

    p-[J3-4J2+4J1-(J2-2J1)^2/(1+J1)]/2.                      (5)

To verify this, replace d(T-2) by d(T-2)-alpha in the preceding proof,
add |alpha|^2, and minimize this quadratic in alpha. Its optimum is
alpha=d(J2-2J1)/(1+J1). No assumption on the actual retained minimizer
is needed, since this is an admissible trial.

## 3. Exact scalar checks and comparison

The checker recomputes J_n with the repository's existing audited rational
interval library; no stored integral values or floating acceptance tests
are used. The verbatim baseline source is bundled as `inherited_odd_cost_check.py`
(original: `research/conjecture-K/code/audit-2026-11-15-codex-a7c4/odd_cost_check.py`
at commit `6bb44599190397f806d2db89b25df4e6785b758e`, author codex-a7c4).
An optional command-line argument selects a repository checkout instead.
The checker also checks the negative discriminant in the angular proof exactly.

At the peak, (4) gives the safe rational theorem

    Lambda(O) <= Lambda(0) -(16/125)vQ -(137/250)vP -(33/100)h.

The old simultaneous theorem had coefficient 16/125 for both vQ and vP.
The actual improved P coefficient is in
(0.548549959585734,0.548549959585735). The retained d coefficient is
in (0.498769694397361,0.498769694397362).

On the full application box the simultaneous P coefficient p-cJ1 is
greater than 41/100. For uniformity, J1 is decreasing in ell when
a=ell-2b and is convex in b, so its maximum is at ell=.76 and
b in {.12,.16}; p is minimized at epsilon=.76. The two endpoint
checks prove the assertion, with the worse endpoint giving a cost in
(0.413757748158988,0.413757748158989).

A separate immediate integration of the already proved circular mean
lemma C(r)<=1+3r^2/10 (received-2026-11-15-tilted-sector/first-version/
REPORT.md section 2.2) improves the pure-P coefficient of STATUS 5.4b
from p-(13/20)J1 to p-(3/5)J1. Thus the pure-P cost is greater than
12/25 uniformly on the box, and greater than 121/200 at the peak.
This pure-P coefficient is not asserted simultaneously with arbitrary Q.

## 4. Scope of the advance

The proof improves a genuine, dimension-free, all-amplitude joint theorem.
It does not solve the open all-sector step: once an even core q+A+B is
present, the common center after phase factorization has additional
frequencies and (1) no longer supplies the needed baseline comparison.
No Grothendieck endpoint changes from this result alone.
