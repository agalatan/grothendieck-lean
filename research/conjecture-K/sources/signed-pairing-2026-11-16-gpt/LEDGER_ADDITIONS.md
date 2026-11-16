<!-- Verbatim from the delivery content_law_signed_pairing_20261116.zip (LEDGER_ADDITIONS.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Proposed ledger additions

These are proposed text, not repository edits. Row numbers are provisional relative to commit `b008629992e5dc6ff5672eb16c3ea72d59dcbccb`.

## Higher-degree ledger

| Proposed row | Statement | Scope | Status | Source |
|---|---|---|---|---|
| 4.20 | **Content-law inequality for Hermitian quadratic factors.** For independent standard complex Gaussians `X,Y`, `q=X(Y*AY-tr A)` with `A` Hermitian has `u=tr A²`, `chi=4+12 kappa`, `kappa=tr A⁴/u²`. For every real continuous polynomial-growth profile, `||c[h]||² <= Theta delta Omega_hat`, with `Theta <= (33+217 kappa+168 kappa²)/(3(1+3 kappa)(11+10 kappa)) < 5/3`. If `kappa<=1/6`, `Theta<=13/10`. The sharper expression retains `zeta=(tr A³)²/u³`. The proof combines the signed Stein terms and subtracts a Gaussian divergence tangent to `q` before taking the law-dual norm. | Genuine cubics, any dimension, every energy. The constants are below 4.19's numerical room thresholds for the last three rows, or last four when `kappa<=1/6`, on this class only. | **P**; exact algebra replay **C** | PROOFS §§1–3; `verify_gamma_exact.mjs` |
| 4.21 | **All six content-law inequalities on an infinite-dimensional family of genuine cubics.** For `q=sqrt(u) X(sum_{j<=m}|Y_j|²-m)/sqrt(m)`, `theta=7/20` for every integer `m>=22`, `theta=3/5` for `m>=12`, and `theta=13/10` for `m>=4`, for every energy and every real continuous polynomial-growth profile. For `m>=22`, `4<chi<=50/11`. The pairing is conditioned on the two signs of the centered quadratic factor; its cross term vanishes exactly because that factor is centered. A gamma/reflected-gamma Hellinger affinity gives the finite checks and a relative-Fisher/Poincare estimate gives the infinite tail. | Genuine finite-dimensional cubics with arbitrarily large dimension; content is generally nonzero. Covers the A and conjugated-B profiles on all six supplied rows in the stated shape ranges. | **P+C**; 23 Arb checks plus exact infinite-tail algebra, replayed by the author | PROOFS §§4–5; `certify_gamma.py`, `verify_gamma_exact.mjs` |
| 4.22 | **One heavy Wick coordinate with diffuse bulk.** For the specified cubic limit `Q=alpha X(|X|²-2)+beta W`, the content-law constants `7/20,3/5,13/10,9/5,12/5,18/5` hold respectively for `alpha/beta <= 11/100,13/100,1/5,1/4,1/3,3/5`, uniformly over every admissible profile and every energy. | Core content, with the Gaussian bulk interpreted as the genuine-cubic limit in PROOFS §8. No finite-bulk error bound. | **P+C**; 121 rational intervals, 400 polynomial controls, BigInt replay | PROOFS §§7–8; `certificate.json`, `verify_exact.mjs` |
| 4.23 | **Gaussian smoothing intertwines the content resolvent.** If `Q=p+sqrt(s)W`, `u=E|p|²+s`, and `k=K_u h`, then `K_s(v)=E k(|sqrt(v)+sqrt(s)W|²)` is the transform at the core energy of the smoothed vector profile. Its `Omega_hat` is no larger than the original law functional. | Every circular cubic core and admissible real profile; an exact conditioning identity, not a Gaussian replacement estimate for an arbitrary remainder. | **P** | PROOFS §6 |

Append to the content-band item of higher-degree section 5:

> Structured classes now have proved content-law constants (4.20–4.22), including `theta=7/20` on the equal-coefficient Hermitian-factor family with at least 22 quadratic coordinates. The general tensor inequality, a reduction to those classes, and finite-bulk comparison errors remain open. The global degree-5 row status is unchanged.

## Conjecture-K ledger

Suggested new row after 6.3.25:

| Proposed row | Statement | Scope | Status | Source |
|---|---|---|---|---|
| 6.3.26 | **Signed representatives modulo tangent divergences.** In the Hermitian-factor class, 6.3.23 becomes `c_X=<X(2|X|²C-u),q k'(|q|²)>`. The polynomial `N=X(2B²+4C-4|X|²C)` has `E[conj(N)|q]=0`. Subtracting its optimal multiple gives the constants of higher-degree 4.20. The dual norm is exactly `(2/3)(||Z||²+|<q,Z>|²/u)` for `Omega_hat`. | Every Hermitian quadratic factor, every dimension and energy; no supremum over content directions. | **P**, with exact algebra checks **C** | PROOFS §§1–3 |

Suggested annotation to item 91:

> The norm-only obstruction remains valid for 6.3.25. The signed-representative method of proposed 6.3.26 changes the representative before applying Cauchy–Schwarz; it proves a class result rather than an improved majorant for the same four norms. It does not resolve item 91 for general cubics.

No changes to the statements or proof status of 6.3.20–6.3.25, 11.31a, or 11.56–11.60 are proposed. Their authorship and existing reviews remain as recorded.

## Wording to retain

- The numbers in the original “theta needed” column are numerical room thresholds, not newly certified here.
- The unrestricted inequality remains **open** on all six rows.
- This work proves the content-law statement on specified classes, not the full sector inequality `K_5`.
- No Lean theorem and no improved numerical bound on `K_G^C` is claimed.
