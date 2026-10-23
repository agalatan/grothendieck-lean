# Independent asymmetric quadratic-phase kernel engine

23 October 2026. **Floating discovery and validation only; no endpoint claim.**

## Actual admissible responses

For independently chosen nonzero complex rows u,v and Hermitian 2×2 matrices
H,K, use

    F(X)=phase(uX) exp(i X*HX),
    G(Y)=phase(vY) exp(i Y*KY).

These responses are disk-valued (indeed unit-modulus a.e.) and charge one:
F(e^{iθ}X)=e^{iθ}F(X), likewise for G. H,K are independently parameterized;
there is no same-map, shared-chirp, or simultaneous-diagonalization assumption.

Let X,Y be standard proper C² Gaussians with cross-covariance
R(t)=diag(s₁t^{w₁},s₂t^{w₂}). Grades are positive odd integers, and real scales
obey |s_j|≤1. For real |t|≤1 the joint covariance

    Σ(t)=[[I,R(t)],[R(t)*,I]]

is positive semidefinite because its eigenvalues are 1±|s_jt^{w_j}|. Thus all
reported kernels correspond to actual Gaussian roundings; odd-grade channels
can be realized by the usual tensor powers in an eventual transfer argument.
All discovery candidates currently use grades (1,3), scales (1,1).

## Exact analytic identity implemented

Put Q=diag(iH,−iK), D=det(I−ΣQ), C=(I−ΣQ)^{-1}Σ, and project the tilted
covariance onto uX,vY:

    a=u C_XX u*,   b=u C_XY v*,
    c=v C_YX u*,   d=v C_YY v*.

Then, with branches continued from zero chirps,

    E[F(X)conj(G(Y))]
      = D^{-1} (π/4) b/(sqrt(a)sqrt(d))
          · ₂F₁(1/2,1/2;2;bc/(ad)).

This follows by complex Gaussian quadratic tilting, followed by the scalar
proper-Gaussian phase identity and analytic continuation. The tool explicitly
guards Re(a),Re(d)>0, a determinant separated from zero, and |bc/(ad)|<1;
it raises an error when a larger chirp requires further branch continuation.
These guards are diagnostic checks, not an interval proof of analyticity.

For complex t on a coefficient-extraction circle, both cross-blocks contain
the **same analytic R(t)**. Replacing one with conjugate(R(t)) would destroy
holomorphy. The complex-circle Σ is an analytic continuation and is not
asserted to be a physical covariance.

Because all grades are odd and G(−Y)=−G(Y), the kernel is odd in t.

## Validation already replayed

`diagnostics.json` records all twelve actual candidates, including independent
complex u,v and independent H,K, and these checks:

* At H=K=0 the answer matches the scalar phase kernel at the projected
  correlation, for both grades (1,3) and the same-grade (1,1) baseline:
  maximum errors 1.23×10⁻¹⁵ and 1.12×10⁻¹⁵.
* The same one-coordinate radial chirp H=K=diag(h,0), u=v=(1,0), matches the
  independent closed form h_phase(t/sqrt(1+h²(1−t²)²))/(1+h²(1−t²)):
  maximum error 2.23×10⁻¹⁶.
* Odd parity is exact numerically; swapping F,G conjugates the real-axis
  kernel to within 3.34×10⁻¹⁶. Conjugate reflection also matches.
* Three direct checks sample the actual unit-modulus response functions,
  300,000 Gaussian pairs each at t=.68. Analytic-vs-Monte-Carlo errors are
  .62,1.02,.17 times the complex RMS standard error. These stochastic checks
  are validation, not certificates.
* Cauchy/FFT coefficient extraction through degree 51 uses 2,048 points at
  radius .82 and 4,096 at radius .90. Maximum coefficient drift across all
  twelve candidates is 1.59×10⁻¹².

The engine includes runtime branch/admissibility guards even under Python -O.
The numerical calibration assertions are tests, not formal proof obligations.

## Real kernels usable for probability mixtures

After rotating the first response so c₁ is positive, average with the
conjugate-reflected pair

    F̃(X)=conj(F(conj X)), G̃(Y)=conj(G(conj Y)).

In parameter form ũ=conj u, H̃=−conj H, with the analogous transformation
for v,K. This is an actual half-and-half mixture and replaces every oriented
coefficient by its real part. `real-mixture-coefficients.npz` contains these
real coefficient heads under candidate-name keys, indexed by ordinary degree
(even entries are numerical zero). The JSON also records complex unsymmetrized
head scores and orientation phases.

## Bounded diagnostic result and selected asymmetric direction

The first screen contains exactly twelve candidates. Its best head score is
the plain opposed-driver phase pair with loading a=.32:
D_head=.71118901842554. All initially tested finite chirps lower that score.

Freezing a obscures the useful asymmetric direction. The selected seven-point
continuation is

    J=[[0,−i],[i,0]], H=hJ, K=−hJ/3,
    u=(1,a)/sqrt(1+a²), v=(1,−a)/sqrt(1+a²),

with a retuned to make the cubic coefficient zero. `asymmetric-direction.json`
records the parameters and coefficients. At h=0 the baseline is
a=.3206005539613036, D_head=.71141788300624. At h=−.01 it is
a=.3268647039437935, D_head=.71152614538248, a gain .00010826237624.
At h=−.02 the score is .71094698451991; positive h worsens it. This identifies
a concrete direction for additional preprocessing or mixture work, but the
current score remains below the existing project score.

Every D_head omits all coefficients above degree 51. It is an optimistic
diagnostic for that candidate, not an upper bound on the Grothendieck constant.
No interval coefficients, infinite-tail enclosure, global response optimization,
or certified transfer are supplied. The pure-phase example makes the omitted
tail visible: its degree-51 head score .580365 exceeds its full identity-
preprocessing score π/2−1≈.570796.

## Reuse and replay

Import `Candidate`, `kernel`, and `cauchy_coefficients` from
`tools/fresh_upper_quadratic_kernel.py`. Construct independent u,v,H,K and
choose grades/scales explicitly. `Candidate.to_json()` records actual complex
parameters as real/imaginary arrays. `swapped()` and `reflected()` implement
the two exact parameter symmetries used above.

    uv run --with numpy --with scipy python tools/fresh_upper_quadratic_kernel.py \
      --output handoff/research-third-decimal/fresh-eyes-20261023/upper/quadratic

    uv run --with numpy --with scipy python tools/fresh_upper_quadratic_direction.py \
      --output handoff/research-third-decimal/fresh-eyes-20261023/upper/quadratic/asymmetric-direction.json

The determinant/hypergeometric form is substantially cheaper than coefficient
estimation from sampled responses and retains the full analytic kernel. A
future certificate can therefore attempt signed whole-mixture contour tails
rather than spending separate per-response Parseval tails.
