<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/review/GENUINE_CORE_REVIEW.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- Intended path: codex-c7e2-round3/review/GENUINE_CORE_REVIEW.md -->
# Independent review of the shared genuine-core region

15 November 2026. Reviewed `gaussian-core/WEIGHTED_POLYNOMIAL_LEMMA.md`
and `gaussian-core/GENUINE_SHARED_ODD_REGION.md`.

The analytic argument passes independent review. In particular:

1. Every core monomial is an exact Wick-trace-free `(2,1)` cubic. The
   X, Y, and U factors belong to different independent Gaussian blocks.
2. Given the lower blocks, X0 and the conjugated Xij are still independent
   proper complex Gaussians. The complex Lagrange identity gives precisely
   `R=u||Y||^2||U||^2/m^2`. There is no pseudovariance term.
3. The core uses `m(m+3)/2+1` complex coordinates and has normalized
   fourth excess `4/m+2/m^2`, in particular `33/128` at m=16.
4. The degree-at-most-three weighted polynomial lemma has the stated
   spherical-harmonic blocks. The k=0 Gram matrix follows from the mean
   and variance of Gamma(m-3/2); the k=1 prefactor and k=2,3 scalar
   factors are correct. Its largest eigenvalue is bounded by lambda_m.
   Successive conditioning over Y and U preserves the polynomial degree
   needed for the second application. No independence of P and R is used.
5. The product HO has total real degree at most three in the lower
   coordinates. Thus the weighted lemma applies after fixing Z.
6. The Rice baseline uses its R-uniform `51/50` envelope first. Only
   after R has disappeared from its right side are angular orthogonality
   and `EQ=0` used. This order correctly handles arbitrary R--Q sharing;
   using conditional centering instead would not be justified.
7. Simultaneous sign reversal of all lower-block coordinates preserves R,
   negates H, and fixes O. The parity step therefore remains valid after
   conditioning away the X-block.
8. The inverse-radius bound proves integrability at small R; there is no
   discarded low-variance event. The m=16 sufficient condition
   `u>=1/25,V<=1/126000` does give the required gauge strictly below1/400.

Independently replayed both exact Node checkers: PASS. The genuine-core
checker verifies all three displayed Lagrange identities, coordinate
counts, fourth excesses, gamma bounds, and shared/independent energy
cutoffs. The Rice envelope checker was independently replayed earlier
in this review round and passed all2000 cells and the analytic tail.

The restriction excluding the X-block from every lower-chaos driver is
essential. Additional Gaussian coordinates must also be independent
of the displayed coordinate blocks, as usual for added standard Gaussian
coordinates. The general theorem uses u>0. This proves an explicit
restricted genuine-cubic odd secant theorem; it does not prove the
arbitrary-remote-cubic premise.

The final added mixture/Jensen corollary also passes review. By the
inherited visible Gaussian-mixture theorem, write L in law as
`sqrt(V0)W0`, independently of the remote core. Its paired remote norm
is `sqrt(pi)E sqrt(V0+R)`, which is at most
`sqrt(pi)E sqrt(V0+u)=B(u)` by Jensen conditionally on V0. Therefore
the remote deficit D is nonnegative and the signed allowance
`sigma-D_minus` equals the nonnegative Gaussian slack sigma. Sharing
of R with lower drivers does not affect this remote-only comparison.

The final Section8 joint-degree refinement also passes independent
review. Total degree at most three permits the three-dimensional radial
basis only when the sum of angular degrees is zero or one. Its mixed
entry is indeed9/(4sqrt(de)); the antisymmetric eigenvalue and the
remaining2x2 symmetric block are as stated. After sign conjugation,
the shifted angular blocks are entrywise dominated by the m,m block,
including their prefactors. The remaining harmonic blocks are scalar.
Thus C_m Lambda_m replaces C_m lambda_m^2 legitimately.

Replayed the updated exact genuine-core checker: PASS, including
Lambda16<49/30, weighted constant784/375, and the improved sufficient
cutoff `u>=1/25,V<=1/105000`. No additional sharing restriction or
unproved approximation is introduced by this refinement.
