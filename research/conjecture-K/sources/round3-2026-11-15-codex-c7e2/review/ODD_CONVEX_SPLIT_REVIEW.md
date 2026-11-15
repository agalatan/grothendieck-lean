<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/review/ODD_CONVEX_SPLIT_REVIEW.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- Intended path: codex-c7e2-round3/review/ODD_CONVEX_SPLIT_REVIEW.md -->
# Independent review of the fixed-trial odd estimate

15 November 2026. Baseline repository commit
`e9b0a458d06e67e9a1eee1168e98f34ef577b3a0`.

This reviews the quantitative fixed-trial odd problem. It does not claim
the full odd-over-A/B premise or Conjecture K.

## 1. Convex interpolation: valid with arbitrary sharing

Write `D(x,o)=|x+o|+|x-o|-2|x|` and, for `x!=0`,
`R_x(h)=|x+h|-|x|-Re(conj(x)h)/|x|`. For every deterministic `0<theta<1`,
convexity gives exactly

    D(x+h,o) <= (1-theta) D(x,o/(1-theta))
                  +2 theta R_x(h/theta)-2R_x(h).

Indeed, apply convexity separately to
`x+h +/- o = (1-theta)(x +/- o/(1-theta))+theta(x+h/theta)`.
The linear terms in the two Bregman remainders cancel. Since
`0<=2R_x(v)<=|v|^2/|x|`, dropping the final negative term is legitimate.

At the peak profile set `alpha=32/25`, `beta=217/100` and use the fixed
A/B perturbation

    H=(T-2/5)r_A+(3rho/5)r_B+Z^2 conjugate(r_B)/sqrt(2),
    rho=5053/10000.

The current-master odd certificate applies at `x=L+q` with arbitrary
remote `q`. Its compensating Q/nu term vanishes because `EQ=0`. This
continues to hold after the deterministic rescaling by `1/(1-theta)`.
No conditional centering or independence of the coefficient fields is
needed. Choosing theta separately for each remote sample would not have
this justification; the argument here chooses one scalar from the global
energies V and W.

The inherited potential estimate has exactly the required scope:

    E_Z |H|^2/|L+w| <= beta (|r_A|^2+|r_B|^2)

for every fixed remote coefficient triple. The proof in current-master
`sources/near-star-2026-11-15-codex-91d4/PROOF_NOTES.md`, Section 3,
has pushed density at most `.81/pi` and mass at most
`1+.36(1+rho^2)`; layer cake gives `2sqrt(.81 mass)<2.17`.
Its bound covers every complex shift and the full visible tail.

Consequently

    E D(L+q+H,O) <= alpha W/(1-theta)+beta V/theta.

Optimizing theta proves

    E D(L+q+H,O)-pW
      <= (sqrt(alpha W)+sqrt(beta V))^2-pW.

Maximizing this over all `W>=0`, with `p>alpha`, gives exactly

    beta p V/(p-alpha).

The cases V=0 or W=0 follow by limits or directly. All quantities are
integrable. Zeros of the perturbed A/B core require no inverse-moment
assumption: the only denominator is the unperturbed remote core `L+q`.

## 2. Additional explicit retained-trial credit

The conditional odd certificate also allows a quantitative nonzero
constant trial. Apply it to `O-cZ`, whose Q coefficient is `Q-c`.
The compensator now averages to

    (3/5) Re(c)Re(nu)+(6/5) Im(c)Im(nu),

and `E|O-cZ|^2=W+|c|^2`. After interpolation and adding the required
trial price `|c|^2`, minimize the quadratic in c. Its exact minimizer is

    Re(c)=-(3/10) Re(nu)/(1-theta+alpha),
    Im(c)=-(3/5) Im(nu)/(1-theta+alpha).

The improvement over the c=0 bound is

    [ (9/100)Re(nu)^2+(9/25)Im(nu)^2 ]
        /[(1-theta)(1-theta+alpha)]
      >= (3/76)|nu|^2.

Thus the allowed infimum over c obeys the stronger bound

    inf_c {|c|^2+E D(L+q+H,O-cZ)-pW}
      <= (sqrt(alpha W)+sqrt(beta V))^2-pW-(3/76)|nu|^2.

This is a deterministic global c and remains valid with arbitrary sharing.
The additional credit is specific to the normalized visible cubic sector;
it does not enlarge the Q/P-only region.

## 3. Independent Gaussian-reference result

Reviewed `gaussian-core/FIXED_TRIAL_GAUSSIAN_ODD_REGION.md` and replayed
`python -O certify_rice_envelope.py`: PASS, all 2000 Arb cells, analytic-tail
initial inequality, zero-core scalar costs, and exact assembly margins.
The fourth-derivative Fourier normalization, both triangular-kernel
factors, parity cancellation, multiplication constant `3+sqrt(6)`,
covariance estimate for S(T), and factorial moments are consistent.

The theorem's scope is essential: the core must be a Gaussian independent
of all lower-degree drivers. It allows arbitrary sharing among those
drivers. It cannot presently replace a genuine shared remote cubic in the
requested global premise.

## 4. Sharper 7/4 potential and positive-part consumer

The new `odd-taylor/UNIVERSAL_ODD_AB_REGION.md` passes review. Absorbing
`(3rho/5)r_B` into the arbitrary remote anchor leaves X exactly unchanged.
For the remaining perturbation the density cap `14/25` and mass
`(34/25)|A|^2+|B|^2` give the stated anisotropic potential. Cauchy--Schwarz
after conditioning is valid with arbitrary remote sharing. The scalar
constant is strictly below `7/4`, and the resulting universal threshold
`V<=9e-7` includes the adverse signed slack `-3.6e-7`.

I independently replayed the complete updated exact Node checker:
all 128 Bernstein cells, the entire polynomial tail, capped-W bounds,
four supplied-slack implications, and retained-nu coefficients pass.
The supplied signed-slack inequalities themselves remain inherited inputs.

The separate `joint/POSITIVE_PART_REGION.md` also passes independent
analytic review and fresh consumer replay. In particular:

* Conditional theta optimization is legitimate there because the new
  centering form remains inside the positive quadratic reserve D.
* The five real/imaginary eigenvalue pairs have the stated factors.
* Each local kappa bound covers a complete source parameter interval;
  the increasing tau envelope is tested at its lower endpoint.
* The source's analytic unbounded tail gives kappa=11/10 as used.
* The upper bound for the positive part is nonnegative before averaging.
* The shared moment `E|q|^2 S_r<=4uV` and the final full-expectation
  cancellation `E G_k=kW` are used at the correct stages.

The source quadrature was not rerun by this review. Its 17-digit output
is read as exact round-tripping binary doubles; the source upper bounds
already include quadrature, parameter interpolation, and omitted-tail
errors. The fresh consumer checks and source hashes reproduced exactly.

## 5. The sharper 11/10 potential: full independent replay

The final `odd-perturb/RECENTERED_EVEN_POTENTIAL.md` passes independent
analytic and code review. Its new anchor is
`q'=q+(7/50)r_A+(15159/50000)r_B`, leaving
`h=(T-27/50)r_A+Z^2 conjugate(r_B)/sqrt(2)`. This exact recentering
preserves the specified X and permits the arbitrary-remote odd anchor.

I checked the image-polar normalization `2exp(-t)/D(t)`, both reflected
real/imaginary matrix blocks, inverse-root bracket acceptance, second
derivative jets, tensor midpoint errors, shift interpolation factor1/8,
and directed adaptive interval accumulation. The omitted-image operator
tail bound implies the stated per-entry enlargement. The entire w>=6
tail follows from the displayed mass/density bounds and the monotonicity
of `exp(-t)R(t)/D(t)` for t>=4.

A separate review copy freshly compiled and replayed the complete verifier
in 99.44755 seconds with GCC14.2.0. It accepted all600 intervals covering
[0,6], using1,885,070 source cells. NDEBUG and fast-math compilation were
both rejected. The scalar exterior/tail checker passed under Python-O.
The complete independent log and receipt are in `review/recenter-replay/`.

The updated sharp-A scalar assembly was independently replayed after this
input completed. The resulting global-slack cutoff
`V<=287/200000000=1.435e-6` and the three stronger supplied-slack rows
pass exact rational checks. The full requested energy domain remains
outside these regional conclusions.

The recentered B-consumer algebra is also correct: retain the original
even remainder bound alpha=217/100 and add the recentered odd estimate.
The constant-ratio envelope tau=121 then gives
`E(F_joint)_+ <= [alpha+122 beta-m]V`, with beta=11/10. No moment
bound for the new anchor q' is used. For nu=0, one may instead use
`tau=k/(p-k)`, giving `[alpha+beta p/(p-k)-m]V`.
