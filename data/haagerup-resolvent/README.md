# Exact inputs for the signed-resolvent upper certificate

`certificate.json` is the canonical generator input. All coefficients and
budgets are rational strings; no floating-point conversion is used in acceptance.

`P` contains the coefficients of the radial polynomial P, and `R` those of
an approximate inverse to 1 − X P². `K` is the series split, `M` the complete
finite-head coefficient cutoff, and `seed_power` the exponent s in R P^s.
The remaining fields set the fourth-power norm budget (`q`), inverse-defect
budget (`defect_cap`), combined-product budget (`seed_cap`), normalized
Haagerup coefficient majorant (`gamma`), normalized finite and infinite
residual budgets (`head`, `tail`), and public rational endpoint (`upper`).

From the repository root:

```sh
python3 tools/gen_haagerup_power.py
python3 tools/gen_haagerup_power.py --check
```

The first command reproduces `Grothe/Haagerup/PowerCheck.lean` byte for byte;
the second rejects any mismatch. The independent directed replay is
`tools/verify_haagerup_power.py`. The endpoint is also bound to the public
Lean theorem by that verifier. The complete proof and verification ledger
are in `docs/HAAGERUP_POWER.md` and
`docs/verification/haagerup-resolvent-20261025/`.
