# Pure degree-five witness in Lean

This optional package studies the operator $P_{1,0}-(39/50)P_{2,1}+(779/10000)P_{3,2}$ on complex Gaussian space. The pure-witness transfer gives a strict lower bound of 1.4023 **if the remaining scalar cap holds**. The lemmas apply to all unimodular phase pairs in their stated dimensions and amplitude ranges.

| Question | Lean source |
|---|---|
| How does a scalar cap give a finite-matrix lower bound? | [Pure witness and transfer](QuinticResearch/QuinticPureWitness.lean) |
| Which remote cubic tests are realized in finite Gaussian dimension? | [Finite diffuse realization](QuinticResearch/QuinticDiffuseRealization.lean) |
| What is proved for small visible amplitude? | [Centered-radius ellipse and the cap through 0.25373041](QuinticResearch/QuinticAsymmetricEllipse.lean) |
| How does the endpoint use the original node caps? | [Cap from 0.885868 under the tail node-cap hypothesis](QuinticResearch/QuinticEndpoint.lean) |

The positive perturbation in this WIP shares the definitions of the Gaussian subspace and fifth-chaos projection in [QuinticWitness.lean](QuinticResearch/QuinticWitness.lean). Its lower bound has a separate [per-cell certificate and ablation](https://github.com/agalatan/grothendieck-lean/blob/32a5a098bfc181239a2555b15b3153a6c825d0e5/research/identity-tail/RETUNED_QUINTIC.md).

The [signed perturbation](../SIGNED_FIFTH.md) gives unconditional high-amplitude scalar credits and the vector transfer for reducing the original fifth eigenvalue. Its central counterexample identifies where a near-saturation hypothesis is necessary.

## Build and audit

From the repository root, with its pinned Lean toolchain and Lake packages available, run

```sh
cd experiments/quintic-signed/lean
lake build QuinticResearch
python3 audit.py
```

Lake resolves the parent `grothe` package from the local checkout. The target builds the research files and the production modules they import. [QuinticResearch.lean](QuinticResearch.lean) lists every research module. [Axioms.lean](Axioms.lean) lists the declarations examined by the audit. Run `lake env lean Axioms.lean` to see the individual dependencies. The audit checks these against the same standard axioms and registered native dependencies as the production proof.

To use a single file, import its `QuinticResearch` module. For example, `import QuinticResearch.QuinticAsymmetricEllipse` exposes `Grothe.LowerAnalytic.quinticPayoff_le_centeredRadius_25373041`. The mathematical declarations keep their original namespaces.

The physical signed operator also has an [original-row finite transfer](QuinticResearch/SignedRowTransfer.lean), an [amplitude-dependent clipping estimate](QuinticResearch/FifthClip.lean), and [measurable finite templates for the original row potential](QuinticResearch/PhaseIteration.lean). The [matched controls and source schedule](../SIGNED_PROFILE.md) give the scope of the numerical research results.

The signed-transfer checkpoint was checked on Linux with the pinned toolchain by running `lake build QuinticResearch` and `python3 audit.py` from this package. Every optional module, the package root and its axiom report were also elaborated from source, without earlier optional oleans or the retired production quintic module on the import path, against the production 55-piece artifacts at staging commit `1037c175376e4ffa9ccf2fb7a1a3e70ead5b60c6`. The signed transfer and new phase estimates use only `propext`, `Classical.choice` and `Quot.sound`. The optional package audit also reports native facts inherited by earlier modules from the established lower-bound rows.

The source of the Gaussian fifth projection was moved verbatim from [its last production implementation](https://github.com/agalatan/grothendieck-lean/blob/40022adc8/Grothe/LowerAnalytic/QuinticWitness.lean) into this package. The optional library provides its own source for every fifth-chaos module.

The [signed radial tangent](QuinticResearch/SignedRadial.lean) bounds the physical half-sum's fifth energy at every amplitude. The [two-shift estimate](QuinticResearch/SpectralPair.lean) relates bilinear and diagonal payoffs to the Gram matrix of the two inputs for any Hermitian operator with spectrum in $[-e,1]$. The [one-coordinate radial price](../ONE_COORDINATE.md) and [finite stress pair](../FINITE_GRADED_LIFT.md) are analytic research results with separate rational replays.

The [physical cubic budget](QuinticResearch/SignedCubicDebit.lean) preserves the actual half-difference spectral cost and proves the real 1.4023 payoff test when its cubic norm is at most .031, or its squared norm is at most .05370 across the five specified central cells. The [residual Gram estimate](QuinticResearch/ResidualPair.lean) uses the actual complex inner product after removing the first and cubic projections. The sharper [single remote block estimates](../REMOTE_CUBIC_MULTIPLIER.md) and [coupled positive fifth direction](../COUPLED_CUBIC_FIFTH.md) have separate analytic proofs and associated rational arithmetic.

The [diagonal proof](QuinticResearch/SignedDiagonal.lean) gives the absolute .712398 cap for every unimodular diagonal pair at debit .02. The [joint visible price](QuinticResearch/JointVisibleBudget.lean) keeps both visible negative Hermites in a single physical support estimate. The [conjugate angular price](QuinticResearch/RemoteAngularPrice.lean) proves the two-mode inverse diagonal used in the high-arm argument. The [positive fifth extremizers](../POSITIVE_REMOTE_MULTIPLIER.md) and [tilted central test](../TILTED_CENTER.md) have independent analytic and numerical proofs. The [57-piece certificate](../TILTED_SIGNED_ENDPOINT.md) verifies the all-amplitude cap and both zero-fifth controls in rational arithmetic.
