<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/joint/SHARP_PAIRED_NORM.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-research/joint/SHARP_PAIRED_NORM.md -->
# A sharp quartic majorant for the paired norm

Agent-ID: codex-c7e2. Baseline: grothendieck-lean
`6bb44599190397f806d2db89b25df4e6785b758e`.
This is an elementary analytic lemma, not a proof of (P), Conjecture K,
or an improved Grothendieck bound. It was not found in the current
Conjecture-K source record by a search for its constant/formula. No
claim of literature novelty is made.

## Theorem

In a real Hilbert space, let x be nonzero, r=||x||, and let
h_perp=h-<h,x>x/r². Then, at every amplitude,

    ||x+h||+||x-h||-2r
      <= ||h_perp||²/r + (27/128)||h||⁴/r³.              (1)

The constant 27/128 is optimal, even on a real line. Equality occurs
for h=(4/3)x, and also for h=0. The result applies to complex scalars
by viewing C as a real Hilbert space; in that case
||h_perp||²=|h|²-(Re(h conjugate(x)))²/r².

## Proof

By scaling, take r=1. Put

    u=(||x+h||+||x-h||)/2,
    q=||h||²,
    v=||h_perp||².

The triangle inequality and the arithmetic/quadratic mean comparison
give u>=1 and u²-1<=q<=u². Directly squaring the two norm terms gives

    v=(u²-1)(u²-q).                                    (2)

This identity also holds at u=1; no division by u²-1 is required.
Consequently the left side of (1), less its quadratic term, equals

    2(u-1)-v
      =(u²-1)q-(u-1)²(u²+2u+2).                        (3)

Write C=27/128 and A=u²-1. It remains to prove

    P(u,q)=Cq²-Aq+(u-1)²(u²+2u+2)>=0.                 (4)

If 1<=u<=33/25, completion of the square gives

    P=C(q-A/(2C))²+(u-1)²[1-(5/27)(u+1)²].

The square-bracket is at least

    1-(5/27)(58/25)²=11/3375>0.

If u>=33/25, then for every q<=u²,

    dP/dq=2Cq-A<=1-(37/64)u²
       <=1-(37/64)(33/25)²=-293/40000<0.

Thus P(u,q)>=P(u,u²), and the latter factors exactly:

    P(u,u²)=(27u⁴-256u+256)/128
           =(3u-4)²(3u²+8u+16)/128>=0.

This proves (1). At h=(4/3)x the quadratic term vanishes, and
the paired increment is 2r/3. Therefore every admissible C must satisfy
2/3<=C(4/3)⁴, i.e. C>=27/128. ∎

## A sharp one-sided cubic remainder

The corresponding bound for the one-sided remainder used in (P) is

    2(||x+h||-r-<h,x>/r)
      <= ||h_perp||²/r+(16/27)||h||³/r².                (5)

It holds at every amplitude; 16/27 is sharp, with equality at
h=-(3/2)x. Here <.,.> is the real inner product.

Again take r=1, and write t=||h||>0, u=||x+h||,
k=(u-1)/t, and c=<h,x>. The triangle inequalities give -1<=k<=1
and t(1-k)<=2. Also c=kt-(t²/2)(1-k²). Direct expansion gives

    [2(u-1-c)-||h_perp||²]/t³
      =(1-k²)[t(1-k²)/4-k]
      <=(1-k)²(1+k)/2
      <=16/27.

The middle step uses t(1-k)<=2. The final step is the factorization

    16/27-(1-k)²(1+k)/2
       =(3k+1)²(5-3k)/54>=0.

The case t=0 is immediate, and rescaling proves (5).

For the matrix method of `directional-matrix-codex-a7c4/PROOF.md`,
write the pointwise displacement as h=s h_E, ||E||=1, and use
|h_E|<=M(T). Then (5) gives the all-amplitude matrix majorant

    2(||x+s h_E||-r-s Re(h_E conjugate(ph(x))))/s²
      <= [|Im(h_E conjugate(ph(x)))|²
                      +(16/27)(s M(T)/r)|h_E|²]/r.     (6)

It may be combined with the old potential bound |h_E|²/r.
In the source integrator, this means using H+(16/27)eta P as an
alternative to alpha(eta)P+beta(eta)H. It is not always smaller in
Loewner order, so each source cell must deliberately choose one valid
majorant; an entrywise minimum of matrix entries is invalid.

### Completed source-matrix experiment

The modified interval integrator in `origin-strip/radial_new.cpp`
freshly passed all 17 endpoints w=i/128, 0<=i<=16, at amplitude cap
1/256. Each cell chooses the new majorant only when its upper eta
endpoint is strictly below 1, and only if a midpoint trace heuristic
prefers it; both choices are independently valid PSD majorants.
The heuristic does not enter acceptance. All six interval matrix
entries then use the inherited outward jet quadrature and tail.

`origin-strip/verify_origin.py --audit-only --repo <repository>`
independently recomputes both 2x2 PSD tests at every endpoint using
exact Python fractions decoded from the hexadecimal endpoints, and
checks the exact step-1/128 coverage. The reserve 61585/2^24 exceeds
481/(8*128²)+10^-6. The inherited shift-curvature checker was freshly
compiled and run (cap 95.7982478674<100, mass 132.313427081<140,
constant 480), as were the rational source-tail checks. Disabling
assertions and enabling fast math both fail compilation as required.
The integrator was compiled with g++ using -frounding-math,
-ffp-contract=off, and -fno-fast-math. Its inherited unused main
function emits a return-type warning, unrelated to the executed path.

This certifies the new region

    0<=|w|<=1/8,  sqrt(S)<=1/256,  all complex A,B.

The existing certified larger-shift bands already have amplitude
caps at least 1/256, and the existing exterior handles larger
shifts. In conjunction with those inherited results, the uniform
small-amplitude strip therefore doubles from 1/512 to 1/256.
This is an author-session analytic/interval result, not Lean and
not external review. The new standalone runner is supplied for
fresh reproduction; the initial execution was performed as its
component commands rather than one combined invocation. Full (P)
and Conjecture K remain open.

## A zero-safe odd-sector bound

For r=|x|>0, define

    Q4(x,h)=min(2|h|, |h|²/r,
                |h_perp|²/r+(27/128)|h|⁴/r³).

At x=0 set Q4(0,h)=2|h|. Each of the three entries is an upper
bound on the paired increment; the first follows from the triangle
inequality, the second from concavity of the square root, and the
third is (1). Q4 is continuous, including at x=0, and
0<=Q4<=2|h|. Thus it is integrable whenever h is integrable, without
any inverse-norm assumption.

The existing odd-sector majorant in `P_ALL_REDUCTION.md` is

    Psi(x,h)=2sqrt(M)-2r-d²/M^(3/2),
    M=r²+|h|², d=Re(h conjugate(x)).

It can be replaced by min(Psi,Q4) in the sufficient averaged
odd-sector premise. This is a valid strengthening of that sufficient
premise, not a proof of it. The minimum may materially help on radial
perturbations: at h=x/2,

    Q4(x,x/2) <= (27/2048)r,
    Psi(x,x/2) = (23sqrt(5)/25-2)r > r/20,

where the strict comparison follows by squaring 205/92<sqrt(5).
The actual paired increment is zero there. In the small radial limit,
the quartic coefficient of Psi is 5/4, versus the sharp universal
coefficient 27/128 in (1).

One cannot simply integrate the quartic term over all x: inverse
third moments can diverge at norm zeros. The displayed minimum is
zero-safe. A cutoff version uses the quartic term only on |x|>=tau,
and uses min(Psi,2|h|) on its complement. Closing that averaged
estimate for the genuine shared cubic variables is still open.

## Numerical attack on (P)

`probe.py` performs 30 unconstrained five-real-parameter Nelder–Mead
starts for Rem(w,A,B)-target(P), normalized by |A|²+|B|². It uses
floating Gauss–Legendre radial quadrature and a uniform angular rule.
No positive candidate was found. The finite-amplitude candidates
returned w near .58–.62, A near .34–.36 and B near .20, with imaginary
parts close to zero. Their coarse normalized margins were about -.021.
Tiny-amplitude candidate maxima were quadrature-sensitive and were
not evidence for a uniform bound. `probe.json` records exploratory
outputs, not certificate data. No analytic phase reduction has been
proved, and full (P) remains open.
