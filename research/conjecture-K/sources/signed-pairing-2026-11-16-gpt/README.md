<!-- Verbatim from the delivery content_law_signed_pairing_20261116.zip (README.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Content-law inequality: proved classes and exact certificates

16 November 2026. Read-only research against `agalatan/grothendieck-lean`, commit
`b008629992e5dc6ff5672eb16c3ea72d59dcbccb`. No repository files, issues, or branches were changed.

## Result and scope

**The unrestricted, all-dimensional content-law inequality remains open.** This packet proves it, with constants inside the requested row thresholds, for a substantial class of genuine finite-dimensional cubics. It also gives exact certificates for part of the one-heavy-coordinate plus diffuse-Gaussian family.

Let `X` be a standard complex Gaussian independent of a standard complex Gaussian vector `Y`, and let `A` be any nonzero Hermitian matrix. Set

\[
B=Y^*AY-\operatorname{tr}A,\qquad q=XB,\qquad
u=\operatorname{tr}(A^2),\quad
\kappa=\frac{\operatorname{tr}(A^4)}{u^2}.
\]

Then `q` is a genuine member of `H_{2,1}` and `chi=4+12 kappa`. The conclusions below hold at **every energy** and for **every real continuous profile of polynomial growth**, hence for both profiles on all six supplied rows.

| Statement | Constant in `||c[h]||² <= theta delta Omega_hat[h]` | Status |
|---|---:|---|
| Every Hermitian `A`, every dimension | `theta = 5/3` | **P** |
| Every Hermitian `A` with `tr(A⁴) <= tr(A²)²/6` | `theta = 13/10` | **P** |
| `q=sqrt(u) X (sum_{j=1}^m |Y_j|²-m)/sqrt(m)`, every integer `m>=4` | `theta = 13/10` | **P+C** |
| The same equal-coefficient family, every integer `m>=12` | `theta = 3/5` | **P+C** |
| The same equal-coefficient family, every integer `m>=22` | `theta = 7/20` | **P+C** |

Thus `5/3` is below the thresholds for `t=0.845, 0.85, 0.855`; `13/10` is below the thresholds for the last four rows; `3/5` for the last five; and `7/20` for **all six**. These statements cover the content inequality on the specified classes. **They do not close any unrestricted row of the degree-5 certificate.** The row thresholds themselves retain their numerical status in higher-degree ledger 4.19.

The `m>=22` family has `4 < chi <= 50/11`. Its content does not vanish identically by symmetry: for `h(v)=v` its squared content is `16u³/m`. The proof uses cancellation between the two signs of the centered quadratic factor.

The sharper, tensor-dependent bound for the whole Hermitian-factor class is also explicit. With
`zeta=(tr A³)²/u³`,

\[
\theta\le
\frac{17+24\kappa-(22+16\kappa)^2/(44+40\kappa)+16\zeta}{6+18\kappa}
\le
\frac{33+217\kappa+168\kappa^2}{3(1+3\kappa)(11+10\kappa)}.
\]

**P.** This is obtained by replacing the signed Stein pairing by an equivalent polynomial pairing before applying Cauchy–Schwarz. A Gaussian divergence tangent to `q` supplies the exact zero that is subtracted. The right-hand side remains the original concave law functional `Omega_hat`; there is no supremum over directions.

## Additional result: one heavy coordinate and diffuse bulk

For the limit model

\[
Q=\alpha X(|X|^2-2)+\beta W,\qquad \alpha,\beta\ge0,
\]

`W` is an independent Gaussian surrogate for a diffuse **cubic** bulk. Its coordinate is not included in the first-chaos content; the content is `E[conj(X) Q h(|Q|²)]`. Here `u=2alpha²+beta²`, `delta=168alpha⁴`, and `chi=42[2rho²/(1+2rho²)]²`, where `rho=alpha/beta`.

| Row | Certified `rho` range | Certified `chi` range | Rational `theta` | Status |
|---|---|---|---|---|
| 0.80 | `[0,11/100]` | `[0,204974/8741547]` | `7/20` | **P+C** |
| 0.82 | `[0,13/100]` | `[0,399854/8906187]` | `3/5` | **P+C** |
| 0.84 | `[0,1/5]` | `[0,56/243]` | `13/10` | **P+C** |
| 0.845 | `[0,1/4]` | `[0,14/27]` | `9/5` | **P+C** |
| 0.85 | `[0,1/3]` | `[0,168/121]` | `12/5` | **P+C** |
| 0.855 | `[0,3/5]` | `[0,13608/1849]` | `18/5` | **P+C** |

These are uniform intervals, not sampled parameter values. The proof is valid for every real continuous profile of polynomial growth. The certificates use 121 rational intervals and 400 polynomial controls. No finite-bulk error bound is claimed; PROOFS.md explains precisely how the genuine-cubic diffuse limit is taken.

Also proved (**P**): Gaussian smoothing intertwines the radial Stein transforms after changing the variance, and contracts `Omega_hat`. This provides an exact way to retain the signed pairing when adding Gaussian bulk.

## Replay

The two Node scripts use only built-in modules (Node 20 or later). The interval script needs `python-flint` (tested with 0.9.0).

```sh
# Run from the extracted packet directory.
node scripts/verify_gamma_exact.mjs
python scripts/certify_gamma.py
node scripts/verify_exact.mjs
```

The run verifies the symbolic moment algebra, infinite ranges of integer `m`, all 23 Arb checks, the profile regularity conditions for the six exact-decimal rows, and the entire diffuse-bulk parameter cover. It completes in seconds on the delivery environment. Logs are in `results/`.

The floating-point proposal stage is optional:

```sh
# Optional, requires NumPy and SciPy. Re-run verify_exact.mjs afterwards.
OPENBLAS_NUM_THREADS=1 python scripts/build_certificate.py
```

`variational_probe.py` and `build_certificate.py` are **N**: they propose coefficients. Their output acquires **C** status only after the independent BigInt verifier accepts it. No floating-point optimizer result is used as a proof.

## Contents and dependencies

- `PROOFS.md`: complete written proofs, including the profile convention and regularity check.
- `CERTIFICATES.md`: what each checker proves and the trust boundary.
- `LEDGER_ADDITIONS.md`: proposed additions and the precise limitations to retain.
- `SOURCE_MAP.json`: pinned repository revision, source paths, and blob hashes.
- `rows.json`: all supplied decimals represented as exact decimal strings.
- `scripts/`, `results/`: replay scripts, rational certificate, and actual replay results.

The sole substantive imported content identity is Conjecture-K ledger **6.3.23**. Ledger **6.3.20** supplies its Gaussian-derivative conventions. The source review confirms these. The new proofs do not use the projected norm majorant **6.3.25**. Higher-degree **4.15–4.19**, section 5, and `CONTENT_LEMMA_D5.md` sections 1 and 11 provide the application and open target; their numerical row budgets are not upgraded here. Ledger **11.31a** provides the familiar symmetry principle used only to identify the content direction. None of **11.56–11.60** is needed as a numerical input.

**Open:** general cubic tensors, the full heavy-coordinate amplitude interval, the profile-specific constants needed outside the proved classes, and a reduction of arbitrary cubics to these classes. No new bound on the Grothendieck constant is claimed.
