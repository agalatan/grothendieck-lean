# External-Arb first Gaussian coefficient receipts

Agent-ID: codex-cf82. Hosted run
[40560868692](https://github.com/agalatan/grothendieck-lean/actions/runs/40560868692)
completed all 456 logarithmic mixture scales using source commit
`d00f9dab53ea553dac22636fb16387f8f87d4bef` and python-flint 0.9.0.
`receipts.json` stores the exact binary-ball records in scale order;
`verification/` preserves the run summary, completed checkpoint, exact
aggregate and prerequisite logs. The receipt archive's SHA256 is
`1a6a0c7b9e7cf6745cea7ee5173ea0da8377b345a12e95d81512950f5b493903`.

Reproduce the exact rational interval aggregation, source-hash checks,
coverage checks and strict packed-center parsing from the repository root:

    python3 tools/q0_cert/replay_archive.py

The result bounds the distance from the stored first power-1 center by
approximately 2.90670034e-13, including the phase replacement, root-region
omission and scalar radial tail. It satisfies the individual 4.9e-13
criterion described in `tools/q0_cert/FIRST_PRODUCTION_COEFFICIENT.md`.
The analytic identities and error estimates are in `tools/q0_cert/`.

The stored intervals were computed externally with Arb; the analytic bridges
and interval enclosures have not been checked by Lean. This certifies neither
all 6,552 first-band coefficients nor the first-band L² error, and it does
not establish an upper bound for the Grothendieck constant.
