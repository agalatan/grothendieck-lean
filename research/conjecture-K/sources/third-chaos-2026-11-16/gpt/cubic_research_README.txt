Real Gaussian chaos: quantitative local and large-cumulant results
Date: 2026-11-16

STATUS: The unrestricted claim E|h| <= sqrt(2/pi)||h||_2 for every
h in the third Wiener chaos has NOT been proved or refuted in this work.
No independently verified literature proof of that global claim was found.
The previous real-to-complex phase-averaging argument is conditional on it.

LATEST RIGOROUS RESULTS (standardized cumulant):

For F=h/||h||_2, write delta=E F^4-3 and c=sqrt(2/pi).

1. Explicit near-Gaussian theorem, in EVERY dimension:
     |E|F| - c(1-delta/24)| <= 10^65 delta^(3/2).
   Therefore delta0=10^(-140) works, with the quantitative strict gap
     E|F| <= c(1-delta/48) < c for 0<delta<=delta0.
   Main proof: edge3_improved_certificate.md; cumulant ingredient:
   cum3_proof.md. Run: node edge3_check_constants.js
   All constants are derived explicitly from weighted semigroup estimates
   and exact Edgeworth identities; no unspecified constant is used.

2. Large-cumulant theorem, in EVERY dimension:
     delta>=74 implies E|F| < (3124/3125)c < c.
   For delta>=305/4, the stronger bound is
     E|F| < c[799/500-(3/4)sqrt(delta/45-1)] <= (973/1000)c.
   Proof: mom3_large_cumulant.tex.
   Run: python3 mom3_interval_certificate.py
   This uses tensor concentration, conditional Jensen, and exact integer
   interval bounds for four one-dimensional Gaussian integrals.

3. Explicit spectral coordinate reduction:
   For epsilon,eta>0, at most 90/(epsilon*eta) coordinates suffice so
   that the pure-tail cubic R either has Var(R)<eta or standardized
   fourth cumulant <=epsilon. Here eta is a VARIANCE threshold.
   Mixed head-tail terms remain. This does not prove a sharp estimate
   for their sum with R. See large3_spectral_reduction.tex, whose main
   displayed convention instead uses eta as an L2-norm threshold.

THE REMAINING GENERAL GAP IS: 10^(-140)<delta<74 in dimension above seven.
No general theorem or counterexample for that entire interval is claimed.

Additional files:
  direct3_explicit_local.tex is an independent proof of the weaker explicit
  threshold 10^(-248), via localized integration by parts. It is not needed
  for the main threshold above.
  large3_large_cumulant.tex and large3_certificate.js give an elementary
  fallback proof for delta>=88 without interval quadrature.
  cum3_check.js checks contraction identities on exact integer examples;
  those examples are not a verification of the general analytic proof.

NEW RIGOROUS RESULTS:

seven_dimensional_proof.tex and seven_dimensional_certificate.py
  Every nonzero cubic chaos depending on at most SEVEN Gaussian coordinates
  satisfies E|h| < [28 sqrt(5)/(25 pi)] ||h||_2 < sqrt(2/pi)||h||_2.
  The certificate uses exact rational Taylor bounds and a rational Machin
  enclosure of pi. Run: python3 seven_dimensional_certificate.py
  The unrestricted-dimensional claim remains unresolved.

six_dimensional_proof.tex and six_dimensional_certificate.py
  Every nonzero cubic chaos depending on at most SIX Gaussian coordinates
  satisfies E|h| < [83 sqrt(5)/(75 pi)] ||h||_2 < sqrt(2/pi)||h||_2.
  The proof uses an angular inequality and a uniform radial bound certified
  by exact rational arithmetic. Run: python3 six_dimensional_certificate.py
  This is a proof for the full mixed cubic in these dimensions, with no
  reflection assumption. It does NOT settle arbitrary dimension.

binary_cubic_proof.tex
  Supplies the angular lemma used above, with a complete analytic proof.
  A random-great-circle argument extends that angular lemma to every sphere.
  Its original binary-cubic bound remains sharper in dimension two. The
  six- and seven-dimensional theorems extend the range of dimensions, and
  its angular proof remains an essential ingredient in those theorems.

optimal_direction.tex
  Choosing a direction maximizing the tensor's diagonal contraction kills
  the (X^2-1)L(Y) term. Gives exact spectral and binary-plane constraints,
  plus an explicit small-residual region valid in arbitrary dimension.

sym2_large_buffer.txt
  For normalized F, delta=kappa_4(F)>0 and Gamma=||DF||^2/3,
  E[(Gamma-1)exp(-F^2/(2s))] <= -delta/(6s)+E F^6/(40s^2).
  Consequently the smoothing sign holds for s >= 3 E F^6/(20 delta).
  This does NOT prove the smoothing sign at every positive s.

The exact arithmetic verifiers ran successfully. They check arithmetic
inequalities following the analytic reductions, not a formalization of
the full proofs in a proof assistant. No PDF compilation is claimed.

Contents:

reflection_proof.tex
  Complete elementary proof of the desired bound in EVERY chaos degree,
  assuming oddness under reflection in one Gaussian coordinate (after an
  orthogonal change of variables if needed). Includes a short cubic proof:
  h=a He_3(X)+X Q(Y) implies E|h| <= sqrt(2/pi)*sqrt(5a^2+E Q^2)
  <= sqrt(2/pi)||h||_2. The reflection hypothesis is essential to this proof.
  TeX source only; no compiled PDF is included.

doubling_derivation.txt and doubling_certificate.py
  Rigorous counterexample to the proposed independent-doubling monotonicity,
  already X=He_3(G)/sqrt(6). The decrease is proved using elementary rational
  estimates, not floating-point quadrature. Run with Python 3:
      python3 doubling_certificate.py
  The verifier has no third-party dependencies. It verifies the arithmetic
  inequalities used after the analytic reduction; it is not a formal proof
  assistant verification of the analytic reduction.

stein_reduction.txt
  Exact Stein covariance and Gaussian-smoothing identities, with missing
  sign inequalities explicitly identified as unproved. Also an elementary
  proof for the conditionally Gaussian cubic class and exact deficit formula.

local_asymptotic.txt
  Historical qualitative argument, superseded for d=3 by the explicit
  near-Gaussian theorem above; retained for its general odd-degree statement.
  Rigorous deduction from published Edgeworth and cumulant estimates:
  for fixed odd d, normalized F in H_d, delta=kappa_4(F) -> 0,
  E|F|=sqrt(2/pi)(1-delta/24)+O_d(delta^(5/4)).
  No explicit numerical fourth-cumulant threshold is claimed.

Numerical searches (heuristic only, not a certificate):
  Optimized cubic Hermite coefficients in dimensions up to 12 and several
  graded Gaussian families. No robust violation of the main inequality was
  found. These searches cannot establish a global upper bound. Numerical
  search files are not needed for, and are not included in, the proofs here.
