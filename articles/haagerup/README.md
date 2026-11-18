# Six-channel certificate for the complex Grothendieck constant

The theorem for the six-channel certificate states $K_G^{\mathbb C} \le 140457588/100000000 = 1.40457588$. A separate integral estimate gives $1.40457588 < 1/\gamma^\dagger$. In the parent repository, `Grothe.UpperSix.bound` uses the scalar and vector optima from `Grothe.Statement`. [Upper entrypoint](../../Grothe/UpperResult.lean).

| Proof | Source |
|---|---|
| Unit scalar and vector optima, admissible bounds, the phase integral | [Statement](../../Grothe/UpperSix/Haagerup/Statement.lean) |
| Convex transfer from the signed head and six tail estimates | [Transfer](../../Grothe/UpperSix/Haagerup/Transfer.lean) |
| Cell maps, Hermite energies and finite interval enclosures | [CellHermite](../../Grothe/UpperSix/Haagerup/CellHermite.lean), [CellOverlap](../../Grothe/UpperSix/Haagerup/CellOverlap.lean) |
| Disk positivity, circle means and infinite tails | [SchurHardy](../../Grothe/UpperSix/Haagerup/SchurHardy.lean) |
| Six channels, weights, 251 head coefficients and numerical budgets | [CertCheck](../../Grothe/UpperSix/Haagerup/CertCheck.lean) |
| Strict comparison with Haagerup’s proposed value | [GammaDagger](../../Grothe/UpperSix/Haagerup/GammaDagger.lean), [headline theorems](../../Grothe/UpperSix/Haagerup.lean) |

From this directory, build the upper proof and inspect its transitive axioms with

```sh
lake build Haagerup
lake env lean Axioms.lean
```

From the repository root, `lake build Grothe.UpperResult` checks the theorem for the repository’s standard constant without building node caps. Both entrypoints compile the same Lean sources. The six rational tail comparisons use kernel reduction. The finite cell, overlap, head and contour checks use the native evaluator.

After building the upper entrypoint from the repository root, run `lake env lean scratch/UpperSixAxioms.lean | python3 scripts/check_axioms.py --upper-six` to verify the transitive report against the six-channel allowlist.
