<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_extension/gaussian_factor_certificate/README.md (file dated 2026-11-05). Only this line was added. -->
# Full Gaussian-factor content certificate

Read `proof.md` for the theorem, analytic proof, and exact scope. The result is

C(q)² ≤ 0.239 [B(u) − F(q)]

for q = Σⱼ Xⱼ(Y* AⱼY − tr Aⱼ), arbitrary complex matrices Aⱼ and arbitrary
numbers of Gaussian drivers, on 0.00551 ≤ u ≤ 0.0463 at all three specified
rows. No covariance-operator restriction remains.

This is a restricted theorem toward Conjecture K, not a proof of general K or
an unconditional Grothendieck lower-bound improvement.

## Replay

Use Node.js 20 or later for the exact pairing check. The envelope checker and
Arb kernel recheck use Python with `python-flint` (the recorded run used 0.9.0).

```sh
# gaussian_factor_certificate/ replay commands
node verify_vector_moments.mjs
python3 check_kernels.py
python3 verify.py peak
python3 verify.py flank
python3 verify.py upper
```

Run these commands from this directory. `check_kernels.py` recomputes all 381
kernel nodes at 128-bit precision and proves containment in the stored
enclosures. `verify.py` uses exact rational arithmetic to cover the full
parameter domain, including the unbounded tail.

The recorded checks all passed. There are 3,171,979 rational envelope boxes
and 471 auxiliary polynomial-positivity boxes across the three rows.

## Files and provenance

* `proof.md`: the new vector moment theorem, Gaussian-factor content theorem,
  and its A-shell consequence.
* `verify_vector_moments.mjs`: exact Wick-pairing verification of the Gaussian
  projection identities, valid in arbitrary dimension.
* `envelopes.json`: the new rational coefficients for nine real-covariance
  intervals; their maximum rational expectation bound is < 0.238649.
* `verify.py`: the exact scalar checker, adapted from the supplied R23–R25
  checker by replacing the scalar pseudocovariance moment constraints with
  the new vector constraints.
* `*_kernels.json`, `kernels.py`, `generate.py`, and `kernel_proof.md`: inherited
  scalar-kernel inputs and their analytic justification from R23–R25. The old
  theorem in `kernel_proof.md` supplies kernel facts; it is not the statement
  of this extension.
* `check_kernels.py`, `kernel_recheck.json`, `kernel_recheck.log`: new
  higher-precision recomputation and containment verification for every
  inherited node.
* `*_result.json` and `*_replay.log`: the new exact replay results.
* `upstream/`: the supplied analytic A-shell note and associated verifiers.
  The content theorem is independent of these files; its A-shell consequence
  uses their 0.24 cost as an inherited input.
* `SHA256SUMS.json`: hashes of the delivered files, excluding this manifest.

The exploratory LP that selected the rational envelopes is not needed for
replay. All decisions establishing the new scalar inequalities are made by
the exact checker. There is no Lean formalization in this package.
