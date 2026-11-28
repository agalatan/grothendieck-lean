# Pure degree-five witness in Lean

This optional package studies the operator $P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}$ on complex Gaussian space. The pure-witness transfer gives a strict lower bound of 1.4023 **if the remaining scalar cap holds**. The lemmas apply to all unimodular phase pairs in their stated dimensions and amplitude ranges.

| Question | Lean source |
|---|---|
| How does a scalar cap give a finite-matrix lower bound? | [Pure witness and transfer](QuinticResearch/QuinticPureWitness.lean) |
| Which remote cubic tests are realized in finite Gaussian dimension? | [Finite diffuse realization](QuinticResearch/QuinticDiffuseRealization.lean) |
| What is proved for small visible amplitude? | [Centered-radius ellipse and the cap through 0.25373041](QuinticResearch/QuinticAsymmetricEllipse.lean) |
| How does the endpoint use the original node caps? | [Cap from 0.885868 under the tail node-cap hypothesis](QuinticResearch/QuinticEndpoint.lean) |

The production mixed witness shares the definitions of the Gaussian subspace and fifth-chaos projection in [QuinticWitness.lean](../../../Grothe/LowerAnalytic/QuinticWitness.lean). Its lower bound has a separate [per-cell certificate and ablation](../../identity-tail/RETUNED_QUINTIC.md).

## Build and audit

From the repository root, with its pinned Lean toolchain and Lake packages available, run

```sh
cd research/higher-degree/lean
lake build QuinticResearch
python3 audit.py
```

Lake resolves the parent `grothe` package from the local checkout. The target builds the research files and the production modules they import. [QuinticResearch.lean](QuinticResearch.lean) lists every research module. [Axioms.lean](Axioms.lean) lists the declarations examined by the audit. Run `lake env lean Axioms.lean` to see the individual dependencies. The audit checks these against the same standard axioms and registered native dependencies as the production proof.

To use a single file, import its `QuinticResearch` module. For example, `import QuinticResearch.QuinticAsymmetricEllipse` exposes `Grothe.LowerAnalytic.quinticPayoff_le_centeredRadius_25373041`. The mathematical declarations keep their original namespaces.
