# Exact inputs for the signed-resolvent upper certificate

`certificate.json` is the canonical generator input. All coefficients and
budgets are rational strings; no floating-point conversion is used in acceptance.

`P` contains the 15 coefficients of the degree-14 radial polynomial P, and
`R` the 65 coefficients of a degree-64 approximate inverse to 1 − X P².
Coefficient lists are in ascending degree order. The generator removes
exact trailing zeros from `R`; interior zeros and all nonzero coefficients
are preserved. `K` is the series split, `M` the complete
finite-head coefficient cutoff, and `seed_power` the exponent s in R P^s.
The remaining fields set the fourth-power norm budget (`q`), inverse-defect
budget (`defect_cap`), combined-product budget (`seed_cap`), normalized
Haagerup coefficient majorant (`gamma`), normalized finite and infinite
residual budgets (`head`, `tail`), and certificate endpoint (`upper`). The public theorem uses the canonical
completion parameters in `Grothe/Haagerup/CanonicalData.lean`; it does not
consume the combined native check or its head/tail endpoint.

From the repository root:

```sh
python3 tools/gen_haagerup_power.py
python3 tools/gen_haagerup_power.py --check
```

The first command reproduces `Grothe/Haagerup/PowerCheck.lean` byte for byte;
the second rejects any mismatch. The independent directed replay is
`tools/verify_haagerup_canonical.py`. It checks this generated data binding,
replays the canonical completed polynomial and remainder, and reads the
endpoint from the public Lean theorem. The complete proof and verification
ledger are in `docs/HAAGERUP_POWER.md` and
`docs/verification/haagerup-canonical-20261026/`.
