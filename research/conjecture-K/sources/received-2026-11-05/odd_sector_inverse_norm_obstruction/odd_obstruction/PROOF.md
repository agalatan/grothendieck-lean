<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/odd_sector_inverse_norm_obstruction/odd_obstruction/PROOF.md (file dated 2026-11-05). Only this line was added. -->
# A certified obstruction to the inverse-norm sufficient condition (6)

This is a counterexample to condition (6), not to Conjecture K or pure cost (3).
The certificate must finish with its success assertion before this claim is used.

At the peak row put a=699/1250, b=179/1250, p=2500/1891, and let z,w be
independent standard complex Gaussians. Set R=|w|^2, T=|z|^2, and

    H = (19/125) w(R-2) + (53/500)(T-1)w
                         + (53/500) z^2 conj(w)/sqrt(2),
    O = z(R-1) + conj(z) w^2/sqrt(2).

These are admissible chaos sectors. Their exact energies are

    ||q||^2 = 0.046208 < 0.0463,
    ||A||^2 = ||B||^2 = 0.011236 < 0.0113,
    ||H||^2 = 0.06868 < 0.072,
    ||O||^2 = 2.

The certificate proves E[|O|^2/|L+H|] > 2p. Thus (6) fails even for kappa_E=0.
If the total energy of H+O is restricted, replace O by O/100. The total
energy then equals 0.06888, and the same strict violation holds by homogeneity.

## Reduction to a positive three-dimensional integral

Use simultaneous rotation to write w=x>=0 and z=s exp(i theta). Both L+H
and O have global charge one, so their absolute values are unaffected.
The radial measure is 2s exp(-s^2) ds times 2x exp(-x^2) dx. The integrand
is even in theta, so theta can be restricted to [0,pi] with measure dtheta/pi.
Put t=s^2,r=x^2,c=19/125,alpha=53/500. Then

    Re(L+H)=s(a+bt)cos(theta)+x[c(r-2)+alpha(t-1)]
                                +(alpha/sqrt(2))tx cos(2theta),
    Im(L+H)=s(a+bt)sin(theta)+(alpha/sqrt(2))tx sin(2theta),
    |O|^2=t[(r-1)^2+r^2/2+sqrt(2)r(r-1)cos(2theta)].

## Rigorous lower sum

The checker partitions s,x in [0,4] and theta in [0,pi] into N intervals
per variable. It drops the nonnegative radial tails, which is valid for a
lower bound. On each box C it computes an Arb upper bound D_C on |L+H|,
and an exact integral enclosure M_C for the numerator |O|^2. Thus

    integral_C |O|^2/|L+H| >= lower(M_C)/upper(D_C).

Only positive lower(M_C) terms are retained. There is no quadrature-error
assumption: the denominator bound encloses the entire box, including boxes
containing zeros. The numerator is integrated analytically. For a radial
interval corresponding to t in [l,h], its first three unnormalized moments
are differences of the primitives

    exp(-t), (t+1)exp(-t), (t^2+2t+2)exp(-t).

The angular average of cos(2theta) is the difference of endpoint sines
divided by twice the angular interval width. All arithmetic and elementary
functions are enclosed with Arb at 80-bit precision.

Replay with python-flint installed:

    python certify.py 384

The final assertion compares the lower sum with the exact rational threshold
2p, not with an exploratory floating-point estimate. Smaller partitions may
fail this assertion because their lower bound is too weak.

## Consequence for the proof strategy

The scalar inverse-norm majorant loses the directional term in the Hessian
of the norm. Its failure does not imply positive curvature of Lambda. Any
successful proof of pure cost for this family must retain more information
than a uniform bound (6), or use a different majorant. Cross terms between
the Q and P sectors cannot be discarded.
