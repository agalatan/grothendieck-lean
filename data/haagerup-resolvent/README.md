# Exact inputs for the canonical Haagerup bound

`certificate.json` is the canonical generator input. All coefficients and
budgets are rational strings; no floating-point conversion is used in acceptance.

`P` contains the 15 coefficients of the degree-14 radial polynomial P, and
`R` a degree-64 approximate inverse to 1 − X P², canonicalized to 65 coefficients.
Coefficient lists are in ascending degree order. The generator removes
exact trailing zeros from `R`; interior zeros and all nonzero coefficients
are preserved. The generated module also reads `seed_power`, `seed_cap`,
and `defect_cap`; its slope is the constant coefficient of `P`. These six
definitions are exact inputs, not acceptance claims. The unused `K`, `M`,
`q`, `gamma`, `head`, `tail`, and `upper` fields are retained provenance
metadata; they do not set the public endpoint or its numerical budgets.
The public theorem uses the canonical completion parameters in
`Grothe/Haagerup/CanonicalData.lean` and kernel-proved finite checks. The completion uses
64 series terms and six correction terms. Its checker bounds the coefficient
prefix below 170 by 9136/10¹². A weighted norm of the finite residual after
X ↦ (3/2)X bounds the omitted coefficients by 4/10¹², giving the full finite
residual cap 914/10¹¹. The infinite remainder cap is 24/10¹¹.

From the repository root:

```sh
python3 tools/gen_haagerup_power.py
python3 tools/gen_haagerup_power.py --check
```

The first command reproduces `Grothe/Haagerup/PowerData.lean` byte for byte;
the second rejects any mismatch. The independent directed replay is
`tools/verify_haagerup_canonical.py`. It checks this generated data binding,
replays the canonical completed polynomial, prefix and weighted finite tail,
the infinite remainder, and reads the
endpoint from the public Lean theorem. The complete proof and verification
ledger are in `docs/HAAGERUP_POWER.md` and
`docs/verification/haagerup-canonical-20261026/`.
