# Individual Parseval tails for the 26 new response pairs

23 October 2026. **DISCOVERY ONLY**: the tail inequality is exact, but its
self-energy heads and the inherited pool data have not been interval-certified.
No new response optimization or endpoint claim is made.

For each actual pair F,G retain its grades (1,3), (1,5), or (1,7). Evaluate
the self kernels with positive channel scales (1,1):

    Fself = Candidate(u,u,H,H),  Gself = Candidate(v,v,K,K).

These have nonnegative chaos-energy coefficients, whose full sum is one
because |F|=|G|=1 a.e. Let r_F and r_G be the omitted self energies after
weighted degree 257. Orthogonality and Cauchy–Schwarz give the analytic bound

    ∑_{weighted degree>257}|cross coefficient| ≤ sqrt(r_F r_G).

Grouping several chaos sectors at a common weighted degree only improves this
inequality. Orientation and half-and-half conjugate-reflection mixtures do not
change the available self-energy bounds.

`fresh_parseval_pool.py` estimates each self head twice: radius .96 with 8,192
FFT points and radius .98 with 16,384 points. Across all 52 self kernels, maximum
coefficient drift is 2.18×10⁻¹², and summed coefficient drift is at most
1.80×10⁻¹¹. Every retained self-energy coefficient is positive. All remainders
are much larger than these diagnostics. The resulting estimated individual
tail charges range from .00193610297373 to .00502950485185.

After charging all 26 new pairs and retaining the incumbent's separate
conditional inherited tax, the 584-column signed LP gives

    incumbent+old: .7119471537111869,
    charged pool:  .7119471537122625.

The remaining improvement is only 1.08×10⁻¹². The only nonzero new weight is
the newly priced grade-seven pair, at 1.10980204717×10⁻⁹, with estimated tail
.00502950485185. The incumbent has weight .999995971002709. Full weights,
charges, self-energy heads, cross-radius checks, and duals are saved in
`parseval-pool.json` and `parseval-pool.npz`.

An L=10⁸ bounded-multiplier LP and a row-normalized L=10⁶ replay agree exactly
in their directly evaluated score; the primary floating primal/max-column-price
dual bracket is 2.23×10⁻¹⁶. This checks finite LP conditioning, not analytic
tail rigor or the inherited coefficient enclosures.

Individual Parseval charges can be much more expensive than a signed tail of
the whole mixture. This negative practical screen therefore motivates a
cancellation-aware mixture contour estimate; it does not prove that the new
actual-response family cannot help.

Portable replay from the repository root:

    uv run --with numpy --with scipy python tools/fresh_parseval_pool.py

The default repository and output prefix are inferred from the script's own
location. All inputs are the bundled fresh-eyes files; no original workspace
or external archive is read.
