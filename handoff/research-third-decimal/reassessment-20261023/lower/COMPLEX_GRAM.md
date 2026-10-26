# Preserve the imaginary joint Gram moments

23 October 2026. Paper theorem, exact rational separating fixture, and floating
diagnostics. No new norm cap or Grothendieck endpoint.

The current `screen_response_gram.py` takes the real part of the feature Gram
before completing it. The actual first-chaos projection is complex-linear.
Consequently the full complex Hermitian Gram interval is valid and can be
strictly stronger.

## Extraction

For the single tuple v=(f A_i,g B_j), let P be full first-chaos projection and
P0 any measured complex subprojection. Use complex inner product conjugate
linear in the first argument. Put

    X_ij = <P0 v_i,P0 v_j>,
    V_ij = <v_i-P0 v_i,v_j-P0 v_j>,
    K_ij = <Pv_i-P0 v_i,Pv_j-P0 v_j>.

Then `0 <= K <= V` as COMPLEX Hermitian matrices, and the projected Gram is
X+K. The proof is the same Bessel argument, now applied to complex coefficient
vectors. In the implementation X denotes the measured coefficient matrix;
the measured Gram there is X.conj().T @ X.

The Hessian stability cross block still takes Re(X+K). Imaginary parts belong
in the budget; they need not appear directly in the real Hessian. In particular
the within-branch Gram of f A_i has real entries when A_i are real, so its
residual imaginary part exactly compensates the measured imaginary part.

Equivalently one may keep the doubled real tuple `(v_1,...,v_m,i v_1,...,i v_m)`
and enforce the fixed complex structure. An arbitrary real completion of the
undoubled tuple discards these relations.

## Sharp scalar consequence

Let the residual complex Gram be

    V = [ a, v; conjugate(v), b ],

and write k=K12. Then

    |2 Re(k) - Re(v)| <= sqrt(a b - (Im(v))^2).

The old real-only radius is sqrt(a b). The square root is real by PSD of V.

A direct Hilbert-space proof avoids matrix optimization. For residual vectors
x,y let R=2P-I. The operator R is a complex-linear self-adjoint isometry.
Viewed as a real Hilbert space, Rx is orthogonal to i x, because <Rx,x> is
real. Project y off the real line spanned by i x, then apply real Cauchy:

    (Re <Rx,y>)^2
      <= ||x||^2 ||y||^2 - (Im <x,y>)^2.

Here Re<Rx,y>=2 Re<Px,Py>-Re<x,y>. The case x=0 is immediate.
This proves the dimension-free scalar inequality. It uses complex-linearity;
it need not hold for an arbitrary real orthogonal projection.

The radius is sharp for every PSD two-by-two V. One can obtain its extrema
from the support of the Hermitian interval: for
Z=[0,1/2;1/2,0], the maximum Re K12 equals

    ( Re(v) + sqrt((Re(v))^2 + det V) ) / 2.

The minimum has a minus sign. The usual projection dilation realizes every
Hermitian contraction on the range of V. Such a dilation realizes abstract
Hilbert vectors, and does not assert realizability by bounded Gaussian responses.

If stability requires `|c+Re(k)| <= eta`, the sharper all-completions screen is

    |2 c+Re(v)| <= sqrt(a b-(Im(v))^2) + 2 eta.

## Exact rational separating fixture

Take

    V = [1,4i/5;-4i/5,1], c=9/20, eta=1/10.

The old budget uses Re V=I. It admits

    K_real = [1/2,-9/20;-9/20,1/2],

and the stability matrix with epsilon=1 is eta I. Both real budget matrices
are PSD. Its old scalar screen passes: 9/10 <= 6/5.

The complex radius is 3/5, so the refined screen fails strictly:

    9/10 > 3/5 + 2/10 = 4/5.

The complex interval endpoints are attained by

    K = [1/2, +/-3/10+2i/5; +/-3/10-2i/5,1/2].

Both K and V-K are rank-one PSD. Thus the refinement excludes a completion
accepted by the full old real SDP, not just by independent Cauchy tests.
This fixture is an abstract Gram example; it is not a binding Gaussian law.

Replay `python3 -I handoff/research-third-decimal/reassessment-20261023/lower/verify_complex_fixture.py`.

## Numerical diagnostic and stopping decision

`tools/reassessment_complex_lower.py` imports the unchanged named response
definitions, uses independent scrambled Sobol grids (2^16 for fitting and 2^17
for evaluation), and saves both real and imaginary moments. It compares the
old real completion with the new Hermitian completion, for positive and signed
Hessian weights. It records the input-source hash, PSD padding and solver
residuals. Proper charge-one W has original grade three; neutral real N has
original grade two. Responses using these variables represent graded limit
benchmarks, not a finite-dimensional cubic with W as a new linear coordinate.

On the first four base-feature tests (diffuse-grade3, shared-Wick,
shared-grade2 and cycle), real and Hermitian optimal minimum eigenvalues agree
to about 9e-11 or better. All surviving completion margins are positive, from
approximately 0.0033 to 0.0074. This refinement therefore supplies no useful
separation of these actual-response benchmarks at the base feature set.
It is a valid stronger extraction, but is not evidence of an endpoint gain.

The enriched diagnostic (18 features per branch) tested diffuse-grade3,
shared-grade2 and cycle. Its real and Hermitian completions also agree within
4.1e-11; all completion margins remain positive, the smallest about 4.8e-5.
This completes the two planned feature sizes. Stop this feature family unless
new joint observables are retained: additional numerical accuracy alone gives
no observed reason for a successful separation.

These tests do not complete the missing joint moments of the exact atomic radial countermodels.
The response fit and evaluation payoffs differ by 1e-5 to 2e-4 at this cheap
resolution. That difference is a warning against treating these integrations
as error-enclosed; neither source coefficients nor payoffs are certified.
The phase-Z calibration errors are approximately 2.23e-6 in first chaos,
7.03e-5 in its cubic coefficient, and 3.22e-4 in the largest off-target
coefficient. Recorded budget padding is 1e-10 and numerical PSD violations
stay below 7.2e-11. These are inexpensive diagnostics; the inherited report's
larger grids supply better calibration but also fail the separating gate.
