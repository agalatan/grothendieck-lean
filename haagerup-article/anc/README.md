# Ancillary files: the six-channel certificate and its verifier

The Lean companion of the article (`lean/HaagerupRefutation/Main.lean`, Appendix A) proves `main_refutation`: every term
of the structure `VerifiedSixChannelData` gives `K_G^C ≤ 1.40456109 < 1/γ†`. Lean does not construct such a term. The
files here construct its data, and `verify_certificate.py` checks, in 256-bit ball arithmetic, that the data satisfy
every field of the structure, against the exact rational constants of the Lean file.

## Files

| file | content |
|---|---|
| `channels.json` | the six channels: kind (`GT`, `tiger`, `phase`), weight `w`, polynomials `P`, `Q` (GT) or `R`, Hardy-circle parameters `r`, `j`; exact rationals as strings |
| `tiger.json` | the tiger grid: `Npsi` angle cells, radial edges `e1`, `e2` (exact rationals, last edge `inf`), `q_shift`, the reflection rule `G[p] = F[(p + Npsi/2) mod Npsi]`, the convention |
| `tiger.npz` | `F_re`, `F_im`: int64, shape (64, 48, 48); the value of `F` on a cell is `(F_re + i F_im) / 2^20` |
| `gt_energy.npz` | the exact dyadic GT energy table `E[n, m] = a / 2^k` (arrays `m`, `n`, `a`, `k`, int64, 21,168 entries) and the rationals `bQ`, `etaQ`, `energyErrQ` (`[numerator, denominator]`) |
| `verify_certificate.py` | the verifier; it reads only this folder |
| `export_gt_energy.py` | how `gt_energy.npz` was made from the repository's `Grothe/Upper/Data.lean` (needs the repository, not needed to verify) |
| `requirements.txt` | the pinned versions of python-flint and numpy |
| `SHA256SUMS` | the SHA-256 hashes of the files above |

## Verify

```sh
sha256sum -c SHA256SUMS
python3 -m venv venv && venv/bin/pip install -r requirements.txt
venv/bin/python verify_certificate.py
```

The verifier prints one `PASS` or `FAIL` line per check, then the budget. Its last line is
`ALL FIELDS OF VerifiedSixChannelData CERTIFIED`, and its exit status is 0 only if every check passes. It ran in
about 5 minutes on one core, with Python 3.12.3, python-flint 0.9.0 (FLINT 3.6.0) and numpy 2.5.4. Its output is in the
article's pull request.

## What is checked

| field of `VerifiedSixChannelData` | check |
|---|---|
| (channel data) | the kinds, the weights `w1..w6` and the polynomials `P1, Q1, P2, Q2, P3, Q3, R4, R5, R6` equal the Lean constants exactly; the weights are positive and sum to 1 |
| `dominated` | the hypotheses of the realisation argument of Section 3: `ℓ¹(P), ℓ¹(Q), ℓ¹(R) ≤ 1`, `Q(0) = 0`, and `|F| ≤ 1` on every tiger cell, in exact integers. Domination itself is the mathematical statement of Section 3; it is not a numerical fact |
| `head_comparison` | GT channels: the universal comparison and table allowance, from the energy table, is below `univGTErrUpperQ = 1494117/10^12`. Tiger and phase channels: `chHeadErr = 0`; their head coefficients are the exact values, enclosed in the balls of the next two checks |
| `h0_enclosure` | `h_0` of the mixture is above `h0LowerQ = 711968933048/10^12` |
| `head_l1_encl` | `Σ_{k=1..250} |h_k|` is below `headL1UpperQ = 1248782/10^12` |
| `hardy_tails`, `tail_enclosure` | `Σ_i w_i tail_i` is below `hardyTailUpperQ = 32/10^9`; each `tail_i` bounds `Σ_{k>250} |h_{i,k}|` by a Hardy-circle cover of radius `r_i` |
| (budget) | the exact rational budget of `cert_rational_margins`, and `γ† < haagerupUpperQ = 7119595/10^7`, which Lean also proves |

## Provenance

- `channels.json`, `tiger.json`, `tiger.npz`: the certificate of the article, as in `haagerup-article/certificate/` of
  the companion pull request.
- `gt_energy.npz`: exported with `python3 export_gt_energy.py Grothe/Upper/Data.lean gt_energy.npz` from the
  grothendieck-lean repository at commit `a14d87418` (the file was last changed in `6db57a0e7`; its SHA-256 is
  `cec1bb15c67969c215a82264bee9c31e116554e33c6821b189ce527d9e442cc7`). The export is deterministic: it gives the same
  bytes every time.
- The seven error radii of the GT comparison are written in the verifier, with their source in the same repository:
  `Grothe/UpperTightBudget.lean` (`tightQuadRadiusQ`, `tightLowReserveQ`, `tightScaledRQ`, `tightThreeBandErrorQ`)
  and `Grothe/Upper/ComparisonGroups.lean` (`comparisonGroupRadiusQ 0`).
