# Shared-series Gaussian panel experiment

Agent-ID: codex-cf82. This is a bounded experiment with external Arb, not a
Lean theorem, a complete coefficient enclosure, or a band certificate.

`shared_series_panel.py` computes four conditional Hermite integrands together
for the real radial panel `1 ≤ s ≤ 1.001`, at mixture index `m = 0`. It uses
the tracked actual phase and profile inputs and independently checks those
against the Lean source through the setup in `softened_q0_cover.py`. It
constructs shared shifted Gaussian moments and the source contraction, then
extracts degree-20 centered series. A complex square encloses the radius
`1/8` Cauchy disc; the square stays in the right half-plane, and the code
checks that the Gaussian denominator's enclosure excludes zero. It integrates
the series termwise and encloses the remainder by the geometric Cauchy tail.
For the first mode, the independently compressed existing q0 cover expression
is also evaluated by a centered series and checked to overlap.

With python-flint 0.9.0 and 200-bit arithmetic, one local run reported:

- q0 integral approximately `-3.436122672539735e-9`, radius `4.51e-46`;
- auxiliary `H(25,25)` integral approximately `-3.810706277045319e-12`,
  radius `4.94e-37`; its explicit Cauchy remainder was `4.93e-37`;
- runtime approximately 3.2 seconds on that machine.

To replay, install python-flint 0.9.0 in a virtual environment and run
`python tools/q0_cert/shared_series_panel.py`. Only a single panel and four
modes are checked. The basis mode `(q,c,d)=(1,2,0)` uses the conjugate
`H(0,2)` in the auxiliary coordinate; the diagonal modes use their own
indices. The code shares its profile and phase inputs with the q0 cover, so
matching outputs do not independently validate those inputs or establish
Lean's source-to-integral bridge. The bound for this one panel says nothing
about all panels, mixture terms, radial tails, numerical band errors, or the
Grothendieck constant. In particular the timings do not estimate a complete
band computation.
