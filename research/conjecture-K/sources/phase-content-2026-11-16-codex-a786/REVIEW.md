<!-- Verbatim from the delivery conjecture_k_phase_content_codex_a786.zip (phase_content/REVIEW.md), 16 November 2026; codex-a786, relayed by the user. -->
# Same-session checks and limitations

This is a self-audit, not independent review.

- Phase action: Wick contraction terms have the same charge as the leading
  monomial. The first-chaos coefficient uses the conjugate coordinate, so
  Taylor characters must be compared with positive coordinate weights.
  For the linear Taylor term both signs of the perturbation character matter.
- Projection normalization: standard complex coordinates have squared norm
  one. No extra factor of two is introduced by the real directional bounds.
- Cyclic wrap: the last weight relation is \(2^n=1\pmod{2^n-1}\).
  The two-coordinate fourth-moment formula has a separate case.
- Kurtosis: the explicit perturbed five-cycle moment formula was checked by
  independent ordinary Gaussian polynomial expansion, including imaginary
  perturbation coefficients. The endpoint interval is proved by the sign of
  an exact rational derivative.
- Fifth derivative: the weighted density uses the Jacobian
  \((a+bt)(a+3bt)\). The fifth scalar derivative is twice the fourth
  derivative of its one-dimensional marginal. The factors 12, 48, 16 and
  the half-line factor 4 are written out in FIFTH_DERIVATIVE.md.
- Angular normalization: the phase identity has factor \(1/4\).
  Hölder's integral for derivative order five is
  \(\int_0^{2\pi}\cos^6\theta\,d\theta=5\pi/8\).
  The Taylor denominator is \(5!\), and the tenth moment of the three-factor
  monomial is \((5!)^3\).
- Unbounded perturbations: all Taylor estimates are pointwise global
  remainder bounds, followed by Gaussian moment estimates. No convergent
  power series or bounded Gaussian support is assumed.
- Same cubic: the remote cap is applied to \(q=p_0+h\), not to \(p_0\).
  The resulting cap does not infer a nonnegative signed deficit.
- Costs: the raw A and B cost inputs are applied separately to a remote
  base. They are not stacked at a base containing the other shell.
- Exact negative control: the checker rejects a false invariance
  certificate for the Wick star \(Z(|Z|^2-2)\).
- Scalar certificate arithmetic: all acceptance decisions use Arb or exact
  integers/rationals. Floating heap priorities only select refinements.
- Code scope: no proof was formalized in Lean. The remote-cap and global
  secant dependencies were read and identified, not rebuilt or rerun.

The generic invariant-subspace argument is standard mathematics. The claimed
research contribution is its explicit content application, the phase-selected
perturbation estimates, the new fifth-derivative certificate and their
quantitative sector consequences. No priority claim over the entire
mathematical literature is made.
