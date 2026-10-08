# Independent imported-profile audit

`verify_imported_profiles.py` is a standard-library exact verifier adapted independently from the earlier delivered verifier. It uses a separate Horner polynomial substitution, checks every original and added physical polynomial against the lifted source chords and the full affine tail, validates the source hash and all source profile gates, and verifies every coupled profile and its complete rectangle cover.

Its finite prerequisites and boundaries are explicit:

* The adjacent `verify_moment_refinements.py` checks the sharper `C6=49.42288923` certificate before any profile calculation.
* The original source SHA-256 is fixed. The script invokes that pinned source's exact matrix-profile gate; it does not duplicate the matrix PSD implementation.
* All physical polynomials receive the constant lift `1e-8` exactly once and are checked against source point caps with the same lift.
* Gaussian price integrals establishing those lifted point caps, the global first-moment theorem `rho=.977459`, and the analytic operator reduction remain prerequisites. This verifier does not claim to replace them.
* The proof uses constant rho only. No conditional-moment numerical proposal is imported.
* Each per-leaf allocation is nonnegative and satisfies its exact weighted-scale identity. The actual penalty is recomputed as `d²/delta`, rather than accepting a saved polynomial coefficient.
* Matrix block averages, final delta gates, beta gain, coefficient signs, leaf reconstruction, prefix freedom, Kraft equality, and endpoint Bernstein bounds are all checked.

The initial three-row certificate passed:

| Weight | Exact cap | Leaves |
|---|---:|---:|
| 5/8 | 14406179023/10000000000 | 383 |
| 11/16 | 1435171019/1000000000 | 794 |
| 3/4 | 14297370389/10000000000 | 925 |

This run checked all 686 global physical polynomials and 2102 coupled moment leaves. The transcript is `independent-initial.log`.

Additional small rejection checks confirmed that incomplete covers, prefix-overlapping covers, duplicate leaves, an incorrect weighted-scale identity, and a negative linear moment coefficient are rejected. A valid nonuniform dyadic cover was accepted and an alternating-coordinate box was reconstructed correctly.

The helper defaults first to a file adjacent to the verifier, then to the scratch layout's `moments/` subdirectory. Its C6 JSON defaults to `sharper_c6.json` beside the selected helper. No `--base` path is required because this verifier contains its own physical-polynomial checks. All paths may be overridden where appropriate:

```sh
python3 verify_imported_profiles.py \
  --source /path/to/check_complex_lower.py \
  --pool /path/to/combined_polynomials.json \
  --certificate /path/to/coupled-profiles.json \
  --moment-helper /path/to/verify_moment_refinements.py \
  --c6-certificate /path/to/sharper_c6.json
```

No proof gate is optional. Run without Python optimization flags. The final merged certificate still needs a run of this verifier; the initial result alone does not establish it.
