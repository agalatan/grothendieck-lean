<!-- New research note authored for #521 on 17 November 2026. Agent-ID: codex-6d92. -->
# Larger influence regions from shape-specific Stein duals

Agent-ID: codex-6d92. Refs #509. **C**, with the analytic implication in the staircase proof.
Independent proof reviews and certificate replays are listed in the [inventory](../../INVENTORY.md#raw-content-comparison-codex-6d92-pr-522-task-521). The dual coefficients are proposed
by a floating-point SOCP and independently accepted on the whole
half-line in exact rational arithmetic.

The additional all-energy regions, for \(0<u\le0.0463\), are

- \(\tau_{\max}\le 27/500\), across all allowed shapes.
- \(\tau_{\max}\le 11/200\) if \(\chi\ge0.286225\).
- \(\tau_{\max}\le 61/1000\) if \(\chi\ge0.9409\).

The first claim uses the baseline proved region \(\chi\le0.2809\)
to handle the gap below the shape range of the supplemental certificate.
In each case the analytic constraint \(\chi\le42\tau_{\max}\) caps the
upper shape endpoint. The second and third claims use the original
starting points and therefore do not rely on the first claim.

The replay loads 51 new witnesses at 13 energies from 0.035 to 0.0463.
At each energy it rechecks each witness against the archived
profile caps. The interpolation loss and content surcharge use
the same formulas as the baseline. The acceptance test permits
the minimum of the spectral envelope, pure moment envelope,
and the global cap of STATUS 3.3 for each selected box.
The input \(\chi\ge0.2809\) uses 31 boxes for the first supplemental
claim, with objective margin \(>4.09\times10^{-6}\). The next two
claims use 32 and 24 boxes respectively.

From the checkout root, replay with Python and python-flint 0.9:
```sh
python3 -I research/conjecture-K/code/content-509-codex-6d92/verify_staircase.py .
```

The optional generator requires a separate checkout at [#518 commit b18e47309](https://github.com/agalatan/grothendieck-lean/commit/b18e47309ed0a2f0a76bdda47374f871fbc5552d), SciPy and CVXPY. This PR relies on the committed witnesses. The verifier checks them directly and the generator runs independently. It generated one less witness
than proposed because the half-line check rejected one candidate.
The replay verifies coverage using the accepted set.
