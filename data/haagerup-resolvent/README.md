# Exact inputs for the canonical Haagerup bound

`recipe.json` fixes the degree-20 polynomial, degree-64 resolvent and all dyadic
precisions. `tools/gen_haagerup_certificate.py` reproduces `certificate.json`
using exact rational arithmetic, with no floating-point coefficient choices.
This recipe and the new endpoint 1.404909133 await delivery CI (#129).

For H(X) = Σ r_k X^k, the generator computes the inverse of t H(t²), then directly
checks its truncated composition identity. It chooses the largest 60-bit dyadic
a satisfying Σ |c_j| a^(2j+1) ≤ 1. Rounding the coefficients c_j a^(2j+1) toward
zero gives P with ‖P‖₁ ≤ 1. The reciprocal of 1 − X P² is computed through degree
64 by an exact recurrence and rounded to the nearest 60-bit dyadic, with ties
to even, to give R. The radial preprocessor t P(t²) has degree 41.

`certificate.json` contains only five fields: `P`, `R`, `seed_power`, `seed_cap`,
and `defect_cap`. The polynomial lists contain 21 and 65 rational coefficients
in ascending degree order. `tools/gen_haagerup_power.py` generates six Lean
definitions: `pl`, `rl`, `seedPower`, `seedCap`, `defectCap`, and `slope`, where
`slope` is P(0). These are data, not acceptance facts. No unused legacy metadata
sets the public endpoint or its budgets.

`Grothe/Haagerup/CanonicalData.lean` specifies 64 series terms, eight correction
terms, and a coefficient prefix below 172 with cap 74/10¹². A weighted norm
‖F((3/2)X)‖₁ ≤ 10²⁰ bounds the omitted finite coefficients by 52/10¹², so the
full finite-residual cap is 126/10¹². The infinite-remainder cap is 14/10¹².
The four public finite checks require kernel proofs; the generators and
independent replay are not trusted premises of the theorem.

From the repository root:

```sh
python3 tools/gen_haagerup_certificate.py
python3 tools/gen_haagerup_certificate.py --check
python3 tools/gen_haagerup_power.py
python3 tools/gen_haagerup_power.py --check
python3 tools/gen_haagerup_canonical_check.py
python3 tools/gen_haagerup_canonical_check.py --check
```

Each generator reproduces its output byte for byte; `--check` rejects a mismatch.
The independent directed replay, `tools/verify_haagerup_canonical.py`, checks the
recipe/data binding, complete polynomial, checked prefix, weighted finite tail,
infinite remainder and endpoint read from the public Lean source. The written
argument is in `docs/HAAGERUP_POWER.md`. Earlier records in
`docs/verification/haagerup-canonical-20261026/` remain immutable evidence for
their pinned inputs; they do not certify this new degree-20 data. Normal
`ready/*` delivery CI checks the new combined tree before merging it.
