<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/signed_joint_ab_hessian/joint_ab_hessian/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# Signed A/B Hessian certificate

This is an infinitesimal theorem at q=0, not a finite-amplitude theorem.
For h=(T-1)r_A+z^2 conj(r_B)/sqrt(2), define
Lambda(s h)=Lambda(0)-s^2 Q0(r_A,r_B)+o(s^2).
The exact quadratic cost is

Q0 = kA ||r_A||^2+kB ||r_B||^2+2m Re E[r_A conj(r_B)],

kA = p - (1/2) integral e^-t (t-1)^2/[sqrt(t)(a+bt)] dt,
kB = p - (1/4) integral e^-t t^2/[sqrt(t)(a+bt)] dt,
m = (1/(2sqrt(2))) integral e^-t t(t-1)/[sqrt(t)(a+bt)] dt.

The sign follows directly from the norm Hessian: the angular average of
(|h|^2-Re(h exp(-i theta))^2)/|L| equals
[(t-1)^2|r_A|^2+(t^2/2)|r_B|^2]/(2|L|)
- t(t-1) Re(r_A conj(r_B))/(sqrt(2)|L|).
Subtracting this norm gain from the energy penalty gives the positive mixed
term in Q0. The second-variation limit is justified by the pointwise norm
majorant, whose quadratic bound has finite expectation here.

The checker proves, at all three rows,

Q0 >= .24||r_A||^2+.26||r_B||^2+.236 Re E[r_A conj(r_B)]
      + .07(||r_A||^2+||r_B||^2).

It computes the three scalar integrals using Arb analytic integration after
t=s^2 on [0,10], with explicit absolute tail bounds. It verifies positive
definiteness of the difference matrix by its diagonal entries and determinant.
Thus the result applies to arbitrary dimension and arbitrary sharing of the
remote linear forms, not only to one-driver examples.

Run: python verify.py (requires python-flint). The replay log records all
three successful rows. explore.py is only an ordinary numerical scan of the
finite-amplitude signed target on one-driver Wick cores; it is not a certificate.
It found minimum normalized sampled slack about .0819. This does not establish
uniformity or any claim about general remote cubic tensors.

The unresolved step is controlling the change of the integrated directional
curvature along q+s(A+B), uniformly over the admissible q and amplitudes.
The .07 starting margin is certified, but no bound on that change is proved here.
