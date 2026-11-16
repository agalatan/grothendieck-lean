<!-- Verbatim from the delivery conjecture_k_phase_content_codex_a786.zip (phase_content/README.md), 16 November 2026; codex-a786, relayed by the user. -->
# Conjecture K: phase cancellation beyond small kurtosis

**Partial progress, not a proof of \(K_G^{\mathbb C}>1.402\).**

Author: codex-a786 · 16 November 2026.
Repository snapshot: 7fe22ca8ba33789f6e87676f920d46146a569e15.
The repository was only read. No commits, branches, comments or pull requests
were created.

The contribution is a phase-sensitive content estimate for explicit classes
of remote cubics. It keeps information in the Wick coefficients that is lost
when the cubic is replaced by the law of its modulus. The main quantitative
example has moderate kurtosis, not a limiting small-cumulant hypothesis.

## Main result

Let \(Z_0,\ldots,Z_4\) be independent standard complex Gaussians, with cyclic
indices, and put

\[
q=\frac{\sqrt{39}}{100}\sum_{j=0}^4Z_j^2\overline Z_{j+1}
  +\varepsilon Z_0Z_2\overline Z_1,\qquad
v=|\varepsilon|^2\le1/1000.
\]

At the repository's peak profile and tilt \(3/5\):

\[
\boxed{\|c_{3/5}(q)\|^2\le
\min\left\{2v^2,\frac{1352}{3}v^3,30000000v^5\right\}.}
\]

Consequently, for **every remote linear form \(r\), at every amplitude and
with arbitrary sharing**,

\[
\boxed{\widehat\Lambda(q+(T-1)r)<S+4.6\cdot10^{-7}.}
\]

Here \(E|q|^2=0.039+v\le0.04\), while
\[
3.6\le\frac{E|q|^4-2(E|q|^2)^2}{(E|q|^2)^2}\le3.6795.
\]

**Status: P+C, author only.** The proof uses ledger 3.3, 11.12, 11.39 and
11.40 as existing inputs. The new fifth-derivative certificate and the exact
moment/constant calculations have been replayed. This is an A-sector result;
it does not include simultaneous A/B or odd-over-A/B.

The mechanism is finite phase symmetry. Rotate the five coordinates with
weights \(1,2,4,8,16\) modulo 31. The cycle is invariant, while the perturbation
has character 3. None of its first four Taylor terms has a coordinate
character. Thus all four projected terms vanish exactly. A certified fifth
derivative controls the remainder.

## Other proved statements

| Claim | Result | Evidence |
|---|---|---|
| PC1 | If a unitary symmetry fixes \(q\) but has no fixed coordinate vector, then \(\Pi_1F(q)=0\) for every \(F(q)\in L^2\). An integer charge-lattice criterion and modular certificates make this checkable. | P, standard invariant-subspace argument applied here |
| PC2 | Every cyclic cubic \(\sum a_jZ_j^2\bar Z_{j+1}\), \(n\ge2\), has zero nonlinear first-chaos content. For equal coefficients and \(n\ge3\), its normalized fourth excess is \(18/n\). | P; exact finite controls C |
| PC3 | Around an invariant cubic, perturbations avoiding the positive and negative coordinate characters satisfy \(\|c_{3/5}(p_0+h)\|^2\le E\vert h\vert ^4/4\le11(E\vert h\vert ^2)^2\). There are 35 such noninvariant Wick directions for the five-cycle. | P+C, uses ledger 3.4 and the replayed Hessian part of 11.30 |
| PC4 | Allowing resonant directions gives \(\|c_{3/5}(p_0+h)\|\le\sqrt{3v_{\mathrm r}/2}+\sqrt{11}\,v\), where \(v=E\vert h\vert ^2\) and \(v_{\mathrm r}\) is its resonant energy. | P+C; computable from rational Wick coefficients |
| PC5 | The scalar tilted profile satisfies \(\sup\vert m^{(5)}\vert <1000\), with both infinite tails included. | New P+C certificate, 240 interval boxes |
| PC6 | The scalar Stein budget cannot be improved from \(6\delta\) to \(c\delta\) with \(c<5\). Improving only this coefficient cannot deliver a factor 1.5–3. | P+C, explicit monomial with budget \(200=5\delta\) |

The positive numerical statements in this package are exact or interval
certified. No floating-point search result is used as evidence for a theorem.
P is a complete written proof by this author, not independent review or Lean
verification. All remaining general assertions are explicitly marked open.

## Read and replay

1. Read PROOFS.md for all mathematical statements, proofs and dependencies.
2. Read FIFTH_DERIVATIVE.md for the new scalar interval certificate.
3. Read LEDGER_PATCH.md for the proposed additions and unchanged open rows.
4. Read LITERATURE.md for the papers and reference chains investigated,
   including the distinction between full-text reading and unavailable HTML.
5. Run the replay below. No repository checkout or network access is needed
   after installing the single Python package.

From this directory, with Node.js 20 or newer and Python 3:

    python3 -m pip install -r requirements.txt
    node replay.mjs

If using a virtual environment, set PHASE_CONTENT_PYTHON to that environment's
Python executable before running the Node command.

The complete replay takes roughly half a minute on the author's environment.
Timing is not part of the certificate. It runs:

- verify_exact.mjs: BigInt Gaussian polynomial moments, phase arithmetic,
  rejection controls and exact rational consumer inequalities;
- phase_split.mjs: a rational Wick-tensor example including a resonant term;
- upstream/content_profile.py: the inherited \(\sup N_\Phi<1/3\) certificate;
- upstream/content_next_m3.py: the inherited \(\sup|m'''|<13\) certificate;
- certify_m5.py: the new \(\sup|m^{(5)}|<1000\) certificate.

The existing large remote cap and global secant certificates are accepted
repository inputs, not silently claimed to have been rerun. No Lean build
was performed.

For just the new exact arithmetic:

    node verify_exact.mjs

For the coefficient-level phase split:

    node phase_split.mjs example_tensor.json

Each term is a coefficient of the unnormalized Wick monomial
\(:Z_iZ_j\bar Z_k:\), not the ordinary product when indices repeat.
Its squared norm is 2 for \(i=j\) and 1 otherwise. Real and imaginary
coefficients are exact rational strings. Duplicate monomials are merged.
The tool reports certified rational upper bounds, using outward rational
square roots. It does not search for optimal coordinate rotations or phase
weights.

## Files and provenance

- PROOFS.md, FIFTH_DERIVATIVE.md: new proofs.
- verify_exact.mjs, phase_split.mjs, replay.mjs, certify_m5.py: executable work.
- example_tensor.json: rational tensor input with both kinds of perturbations.
- results/: saved outputs from successful replays.
- upstream/: two inherited scalar checkers and their written proofs, attributed
  to codex-6e2b at the pinned commit. The code has only an added first-line
  filepath comment; mathematical operations are unchanged.
- SOURCES.json: source paths, URLs and hashes.
- SHA256SUMS: package-file integrity hashes, excluding itself.

## What remains open

General raw content 6.3.18 with a useful signed same-law deficit constant,
joint A/B (P) 7.4, odd-over-A/B 7.5.5, and the general degree-5 band
\(t\in[0.80,0.855]\) remain open. Zero content alone does not prove
\(D(q)\ge0\). The phase theorem applies to degree-5 first-chaos profiles,
but this package supplies no certified degree-5 derivative constants or
coverage theorem for arbitrary adversaries.

The useful next target is a decomposition controlling resonant coefficient
energy for general cubics at a cost compatible with their own deficit.
Neither such a decomposition nor a new global Grothendieck endpoint is claimed.
