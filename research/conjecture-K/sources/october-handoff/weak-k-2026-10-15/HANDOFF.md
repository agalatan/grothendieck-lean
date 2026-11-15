<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/weak-k-20261015/package/HANDOFF.md (file dated 2026-10-15). Only this line was added. -->
# A weaker target for the lower bound: rotation stationarity and the exact profiles

15 October 2026. **No new numerical lower bound is claimed in this round.** Conjecture K and a sufficient uniform K_eta remain open. The new results below are proved; the numerical cap for the new target is not.

This work adds two ingredients that are absent from a relaxation of the remote radial law alone: a constraint on the actual maximizing responses, and uniform certified evaluation of the actual nonlinear profiles. The proposed route does not require proving Gaussian domination for every cubic perturbation.

## 1. The main theorem: the A/B amplitudes cost something at a norm maximizer

Write P=P_10, Q=P_21, h=(f+g)/2, k=(f-g)/2, Ph=tZ, G=epsilon Qk, B=beta Z(|Z|^2-2), L=ell Z+B, and

    Hres = Qh+B/epsilon,
    F = ||Pk||^2+epsilon||Hres||^2.

The exact row identity retains the negative term -F. For the coordinate decomposition

    G=q+r_A(|Z|^2-1)+r_B Z^2/sqrt(2)+YZ+W conjugate(Z)+nu H(Z),

put d=2 beta r_A+sqrt(2) beta conjugate(r_B). At an unconstrained global norm maximizer, rotating g independently in the visible/remote coordinate plane gives

    <p,d>_R = -epsilon t <p,Pk>_R -epsilon <Hres,D_p G>_R.

Here D_p is the skew-adjoint Gaussian rotation generator. The identity holds with every sector present, arbitrary shared drivers, and arbitrary amplitudes. It is not an assertion about an arbitrary cubic or a fixed-t constrained maximizer.

Let J_G:p -> D_pG on the realified remote first chaos. Least squares proves

    F >= d^T (epsilon^2 t^2 I+epsilon J_G^*J_G)^(-1) d.

The inverse is interpreted on the range if necessary. Two dimension-independent upper bounds on J_G^*J_G are

    omega = 9v,
    omega = min(9v,3 sqrt(3 kappa_G/2)),
    v=E|G|^2, kappa_G=E|G|^4-2v^2.

The second uses the existing influence contraction identity; its cumulant is that of the **full cubic G**, never that of a conditional slice. Consequently

    norm row <= t^2-2 ell t+2 beta^2/epsilon
                +Lambda(G)-||d||^2/(epsilon^2t^2+epsilon omega).

The zero-denominator case has d=0 and contributes zero. This proves that it is sufficient to bound this penalized expression, which is pointwise no larger than the target in K.

The sufficient supremum may retain 0<=t<=1 and v<=epsilon^2(1-t^2), from ||h||^2+||k||^2=1 and orthogonal projection. The smaller illustrative variance windows below are additional restrictions, not consequences of stationarity.

At the peak epsilon=1891/2500, beta=179/1250, define r_parallel=(2r_A+sqrt(2)conjugate(r_B))/sqrt(6). For t<=0.851 the universally valid penalty is at least

- ||r_parallel||^2/7 if v<=1/16;
- ||r_parallel||^2/6 if v<=1/25.

With remote variance v_q<=1/25, remote cumulant kappa_q<=v_q^2, and total visible-sector variance <=1/400, the refined remote influence estimate gives 6||r_parallel||^2/25. These are exact rational comparisons, not measured coefficients. Their variance restrictions must remain explicit.

Finite-dimensional maximizers exist by weak-* compactness and finite rank; successive phase replacements make them unimodular. Therefore the stationarity reduction is sufficient for the dimension-free norm bound without assuming that an infinite-dimensional maximizer exists. An explicit delta-near-maximizer error is also supplied.

Full proof, including the complex conjugations, sharper influence estimate, and exact checks: `penalty/ROTATION_WARD.md` and `penalty/check_rotation_ward.py`.

## 2. Response readjustment and stationarity can be kept together

The earlier first-chaos penalty alone discarded a second square, epsilon||Qh+B/epsilon||^2. Retaining both gives, for a in P and b,C in Q,

    D_G(a,b,C)=E|L+G-a-b-C|+E|L-G+a+b-C|
       +||a||^2+||C||^2/epsilon-2 Re<C,B>/epsilon
       +2 Re<b,G>/epsilon-||G||^2/epsilon.

This is a valid upper bound on the response problem and allows the maximizing functions to readjust. Subtracting their old squares after optimizing the unpenalized phases would be invalid.

The stationarity identity strengthens this further. Set A_G=epsilon^2t^2 I+epsilon J_G^*J_G and P_rem the remote first-chaos projection. At a norm maximizer the row, after its scalar constant, is bounded by

    D_G(a,b,C)
      -(d+epsilon t P_rem a+J_G^*C)^T A_G^(-1)
                                  (d+epsilon t P_rem a+J_G^*C).

This uses the same two squares only once. It includes both the ordinary dual and the rotation penalty as special choices. An explicit rational trial in place of the inverse is enough for verification.

For t>0 the inverse is ordinary. For t=0 use the Moore--Penrose inverse on the range, or the trial-multiplier formula; stationarity puts the relevant vector in the range.

A clipped, finite Gram version is also proved. It retains the clipping error, the symmetric/antisymmetric cross block, cubic consistency, and stationarity. All entries are finite. This is the recommended certificate interface for the weaker target.

The new exact remote-profile identity explains the mechanism:

    ell Pi_10 F0(q)+2 beta Pi_10 FA(q)+sqrt(2) beta Pi_10 FB(q)
       = T_q^* h_even,

where h_even is the projection onto Z H_11(remote) plus conjugate(Z) H_20(remote), and T_q has directional squared norm equal to the influence of q. Thus the nonlinear content and the retained common-response projection are linked, rather than estimated separately. One transverse A/B combination remains; the identity does not eliminate it.

## 3. The true profile functions are now uniformly certifiable

At a=699/1250, b=179/1250, L=Z(a+b|Z|^2), the actual functions F0, FA, FB and Phi0 each have explicit 60-term Gaussian/Bessel approximations with **absolute error less than 10^-11 for every complex shift**. This includes arbitrarily large shifts and both tails of the density approximation. No interpolation or derivative-supremum estimate is used.

The proof pushes the visible Gaussian measure through Z -> L(Z), then approximates its three weighted densities by fixed rational Gaussian sums. The phase kernel is bounded by one, so a weighted-density L1 certificate gives a uniform profile error. Exact mass normalization plus a radius-weighted error gives the potential bound. The isolated Arb replay checks 2,000 Taylor cells and analytic unbounded tails in about twelve seconds.

Use `strategy/gaussian_profile_oracle.py` after replaying `strategy/check_profile_gaussian_L1.py`. Its interval outputs include the certified approximation error. It covers the fixed peak profile, not an unverified neighborhood of row parameters. Do not divide its uniform F-error by |q| near zero; use the actual unshifted profile features in the Gram dual.

Full proof: `strategy/UNIFORM_GAUSSIAN_PROFILE_CERTIFICATE.md`.

## 4. Additional proved tools, and failed shortcuts

For a jointly proper Gaussian coefficient vector A=(r_A,conjugate(r_B)), with w=E||A||^2, and any event E of probability p, even with arbitrary dependence on q,

    E[||A||^2 1_E] <= w p(1-log p).

The matrix version controls the cost of leaving a region on which a sharper fibre majorant holds. It requires actual certified global and local majorants; it does not turn numerical searches into a proof.

Two tempting majorants are now rigorously excluded: isotropic tied curvature 0.8, and the tied local matrix plus 0.1 I. A rational finite-amplitude input violates the latter by more than 0.097. None is a counterexample to K. Exploratory SDP figures using those false premises are not bounds and should be discarded.

The Gram audit also corrects the A-profile asymptotic and identifies the exact degree-six recession direction, implemented as an atom at infinity. A whole-tail polynomial certificate format is provided. The exploratory SDPs still have solver residuals and are not certificates.

Independent graded-noise stability gives another exact supremum-dual theorem, kept separate in `strategy/NOISE_STABLE_WEAK_K.md`. Its constraints apply to maximizers of the raw Lambda supremum; they cannot simply be imposed on maximizers of the different retained-response problem.

## 5. Manuscript correction and porting

Chapter 22 contains the false equality

    2 E|sqrt(R)G+sqrt(u)| = sqrt(pi) E sqrt(R+u).

The right side corresponds to adding Gaussian variance, not a fixed shift. The correct Laplace integral already present in the proof yields all the required alternating derivative signs. Therefore the two-node majorant and the prior remote-cubic certificates survive this correction.

`content/ch22-rice-correction.patch` and the corrected chapter copy preserve the source outside this correction; `content/SOURCE_SHA256.json` records the source version. The live repository was not edited. Apply the patch rather than overwriting a chapter that another worker may have changed.

`tex/ch24-weaker-k.tex` is a proposed new chapter; `tex/research_update.tex` is a standalone, flattened version. The chapter is not inserted into the live main.tex. Add its input after Chapter 23 if its label/number remains free. All statements distinguish proved reductions from the still-open numerical cap.

## 6. What still has to be proved to improve the endpoint

The new task is a global bound on the stationarity-augmented response dual, with all shared sectors present. The raw Conjecture K is no longer the necessary target. The actual profiles can now be enclosed uniformly, but a feasible rational dual, parameter cover, and compatible epsilon=0.7564 flank envelope are still needed. Existing epsilon=0.745 flanks cannot simply be reused.

The exact checks below verify the new algebra and integral certificates. They do not establish that the new supremum is below 500/701 and do not formalize the new reduction in Lean. The previous checked endpoint is unchanged this round.
