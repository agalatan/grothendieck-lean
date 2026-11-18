# Ancillary files: the six-channel certificate and its verifier

These files certify the numerical facts of Section 4 of the article, which give `K_G^C <= 1/D < 1.40456109 < 1/γ†`.
They contain no Lean files. The Lean companion (Appendix B of the article) is kept in the repository
<https://github.com/agalatan/grothendieck-lean>, folder `haagerup-article/lean`.

## Files

| file | content |
|---|---|
| `channels.json` | the six channels: kind (`GT`, `tiger`, `phase`), weight `w`, polynomials `P`, `Q` (GT) or `R`, Hardy-circle parameters `r`, `j`; exact rationals as strings |
| `tiger.json` | the tiger grid: `Npsi` angle cells, radial edges `e1`, `e2` (exact rationals, last edge `inf`), `q_shift`, the reflection rule `G[p] = F[(p + Npsi/2) mod Npsi]`, the convention |
| `tiger.npz` | `F_re`, `F_im`: int64, shape (64, 48, 48); the value of `F` on a cell is `(F_re + i F_im) / 2^20` |
| `gt_energy.npz` | the exact dyadic GT energy table `E[n, m] = a / 2^k` (arrays `m`, `n`, `a`, `k`, int64, 21,168 entries) and the rationals `bQ`, `etaQ`, `energyErrQ` (`[numerator, denominator]`) |
| `verify_certificate.py` | the verifier; it reads only this folder |
| `export_gt_energy.py` | how `gt_energy.npz` was made from the repository's `Grothe/Upper/Data.lean` (needs the repository; not needed to verify) |
| `requirements.txt` | the pinned versions of python-flint and numpy |
| `SHA256SUMS` | the SHA-256 hashes of the files above and of this README |

## Verify

```sh
sha256sum -c SHA256SUMS
python3 -m venv venv && venv/bin/pip install -r requirements.txt
venv/bin/python verify_certificate.py
```

The verifier prints one `PASS` or `FAIL` line per check, then the budget. Its last line is
`ALL CHECKS PASSED: K_G^C <= 1/D < 1.40456109 < 1/gamma_dagger`, and its exit status is 0 only if every check passes.
It runs in about 5 minutes on one core (Python 3.12, python-flint 0.9.0, numpy 2.5.4).

## What is checked

| check | content |
|---|---|
| channel data | the kinds, the weights `w1..w6` and the polynomials `P1, Q1, P2, Q2, P3, Q3, R4, R5, R6` equal Table 1 of the article exactly; the weights are positive and sum to 1 |
| dominated | the hypotheses of the realisation argument of Section 3: `ℓ¹(P), ℓ¹(Q), ℓ¹(R) ≤ 1`, `Q(0) = 0`, and `|F| ≤ 1` on every tiger cell, in exact integers. Domination itself is the mathematical statement of Section 3; it is not a numerical fact |
| head comparison | GT channels: the universal comparison and table allowance, from the energy table, is below `1494117/10^12`. Tiger and phase channels: their head coefficients are the exact values, enclosed in the balls of the next two checks |
| `h_0` | `h_0` of the mixture is above `711968933048/10^12` |
| head `ℓ¹` | `Σ_{k=1..250} |h_k|` is below `1248782/10^12` |
| tails | `Σ_i w_i tail_i` is below `32/10^9`; each `tail_i` bounds `Σ_{k>250} |h_{i,k}|` by a Hardy-circle cover of radius `r_i` |
| budget | the exact rational budget `D_cert` of Section 4, and `γ† < 7119595/10^7` (Lemma 4.1, which the Lean companion also proves) |

## Provenance

- `channels.json`, `tiger.json`, `tiger.npz`: the certificate of the article.
- `gt_energy.npz`: exported with `python3 export_gt_energy.py Grothe/Upper/Data.lean gt_energy.npz` from the
  grothendieck-lean repository at commit `a14d87418` (the file was last changed in `6db57a0e7`; its SHA-256 is
  `cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7`). The export is deterministic: it gives the same
  bytes every time.
- The seven error radii of the GT comparison are written in the verifier, with their source in the same repository:
  `Grothe/UpperTightBudget.lean` (`tightQuadRadiusQ`, `tightLowReserveQ`, `tightScaledRQ`, `tightThreeBandErrorQ`)
  and `Grothe/Upper/ComparisonGroups.lean` (`comparisonGroupRadiusQ 0`).
