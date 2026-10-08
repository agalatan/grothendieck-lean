# Grothendieck refinement: reproduction

The research draft derives

\[
K_G^{\mathbb C}<1.404898426735,
\]

by sharpening and slightly reweighting the upper-bound construction in Heilman–Jones–Malavolta, [arXiv:2609.25462v1](https://arxiv.org/abs/2609.25462v1). Read [research-note.md](research-note.md) for the proof and explicit dependencies. This is an internally checked research draft, not an externally reviewed publication or an established priority claim.

The exact verifier uses only Python's standard library:

```bash
python3 verify_exact.py
```

This establishes the new polynomial-power comparisons, the algebra and rational radical bounds for the improved Wallis tail, and final arithmetic **given the stated source coefficient and energy bounds**. It does not verify those inputs by itself.

For the interval layer, obtain the authors' source at the specific audited commit. The following commands assume a shell opened in the same directory as these files:

```bash
git clone https://github.com/sheilman77/grothendieck_cx.git upstream
git -C upstream checkout 7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f
python3 -m venv .venv
.venv/bin/python -m pip install numpy==2.4.4 python-flint==0.9.0
.venv/bin/python verify_intervals.py --source upstream --full
```

The tested environment was macOS arm64 with Python 3.14.4, NumPy 2.4.4, and python-flint 0.9.0. Other compatible Python versions may work; the pinned versions above record what was actually tested. SciPy is not required for verification.

The `--full` run automatically executes the adjacent exact verifier, then checks nonvanishing and endpoint identities, energy bounds, the first four Cauchy bounds, the finite fifth tail, table hashes, reweighted low coefficients, all remaining tail contributions, and normalization. Without `--full`, the script checks the exact layer and interval assembly but retains the listed analytic prerequisites as source inputs. It refuses Python's `-O`/`-OO` modes because upstream checks use assertions.

To reproduce the authors' original upper certificate as an additional comparison:

```bash
.venv/bin/python upstream/audit_best7_full.py
```

The original source tables can also be regenerated; this takes longer than the verification. Use the original certified generators:

```bash
.venv/bin/python upstream/support_compression_certificate/complex_upper_origin_layer_coefficients.py --count 120 --jobs 2 --output regenerated_origin_0_25.npz
.venv/bin/python upstream/generate_origin_tail_25_36.py --count 120 --jobs 2 --output regenerated_origin_25_36.npz
.venv/bin/python verify_intervals.py --source upstream --origin-table regenerated_origin_0_25.npz --extension-table regenerated_origin_25_36.npz --full
```

Both regenerated tables in our run were byte-for-byte identical to the original pinned files. A supplied replacement is explicitly identified and hashed; a hash alone does not prove that arbitrary replacement numbers enclose the required integrals. Only supply tables obtained from certified quadrature, and examine the generator's success status. The script does not regenerate quadrature itself.

The files in `logs/` record the original upper audit, exact checks, new full check, and table regeneration runs. `verification-results.txt` records the provenance and limitations, including a separate lower-bound verification attempt which failed and is not used by this upper-bound proof.

The numerical search that suggested the new weights is unnecessary to reproduce the result. The proof uses the explicit rational weights in the note and verifies them directly; no optimizer or optimality claim is part of the certificate.
