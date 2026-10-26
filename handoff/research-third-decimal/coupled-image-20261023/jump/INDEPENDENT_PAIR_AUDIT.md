# Independent audit of the coupled negative-image proposal

23 October 2026. All reads and replays used the isolated worktree
`work/grothe-rankone` on `codex/research-audit-20261023`. This is an audit of
`../pair/COUPLED_NEGATIVE_IMAGE_DUAL.md`, not a new endpoint certificate.

## Algebra and scope

The following parts independently check out:

- The `u=(f+g)/2`, `v=(f-g)/2` game has positive terms `||Pu||²` and
  `epsilon||Qv||²`, negative terms `epsilon||Qu||²` and `||Pv||²`.
- The exact inner dual has the correct two quadratic penalties and support
  moduli. The convex two-disc response set must remain present during the
  inner minimax; requiring an exposed phase pair there would be an error.
- The closure residual R gives `Phi-I<=R`, hence a bracket. It is an upper
  bound on a trial's error, not a correction that may simply be subtracted.
- The outer ascent inequality has the correct direction, including the
  approximate-inner allowance R.
- In the global Young majorizer, the image changes are `-epsilon d-e` and
  `-epsilon d+e`. These give precisely the stated linear term, shared
  curvature block and zero-safe allowance. The resulting finite update is
  valid for arbitrary amplitude whenever its moments are finite.
- The complete negative-image classification for a remote q is correct:
  visible oddness leaves only visible degrees one and three in Qu; charge
  forces the three displayed tensor sectors. Visible evenness leaves only
  the remote first chaos in Pv. Conditional rotational covariance gives the
  stated real radial profiles and charge-one/charge-two phase factors.

The unregularized inverse-modulus integral needs a separate proof. A general
complex cubic can have a common real factor, so image zeros can make that
curvature infinite. A positive lower regularization removes this issue;
its actual allowance still has to be charged.

The standard-library exact checker was independently replayed:

```
python3 -I tools/coupled_pair_dual_exact.py \
  --out handoff/research-third-decimal/coupled-image-20261023/jump/independent-pair-replay.json
```

It passed the rational trial update and 81 additional finite-amplitude
updates in both its unregularized and zero-safe fixtures, 1,875 complex
Young checks, and tensor-sector enumeration. These are algebraic fixtures,
not interval Gaussian integrations.

## What is already present in this repository

The relevant existing source is the own-worktree file

`handoff/research-third-decimal/attack-20261022/NOTES.md`.

It records, before the current work:

- Lines 58–90: the retained negative cubic square, full pointwise support
  defect and the exact support dual.
- Lines 91–104: an explicit contact-moment mismatch descent by a quadratic
  majorizer, with `r^T(K+tau I)^(-1)r`, and a zero-safe smoothing allowance.
- Lines 106–117: an optimized exact canonical dual already tight on the
  diffuse W-model responses, to the stated discovery accuracy.

The old live module 88 is referenced by those notes but is not included in
this isolated snapshot; this audit does not claim to have reread it.

Accordingly, the exact convex dual, retained Qh penalty and finite MM descent
must be presented as existing machinery recovered and reused. The concrete
new target is to expose the **complete finite-amplitude conditional negative
images from the same non-Gaussian remote cubic**, including both Pv and all
Qu fields, and to spend them jointly in an explicit trial update. This is a
larger coupled trial space, not a new universal comparison theorem.

## Audit of the proposed numerical experiment

A diffuse Gaussian W check is a calibration: the older optimized dual is
already tight there, so a large fresh correction would be a warning about
normalization, quadrature or mismatched trial spaces.

The informative comparison fixes a genuine non-Gaussian remote cubic q and
one positive image pair. It compares the previously used restricted trial
negative images against the complete conditional Qu/Pv direction, without
changing q's embedding or its variance during that comparison. Record:

1. The fixed outer image pair and the old dual trial value.
2. The actual exposed feasible response payoff and its closure bracket.
3. The individual missing Qu and Pv projection norms from that same response.
4. The shared curvature, linear mismatch and regularization allowance.
5. The finite trial update and actual dual decrement, checked on an
   independent quadrature or sample rule.

A positive descent certificate improves a **fixed-image** cap. To obtain a
new global cap, it still needs uniform control over the outer image pairs
and arbitrary Gaussian dimension. A sample of trial tensors does not supply
that step. The finite-jump cover in `FINITE_JUMP_CERTIFICATE.md` likewise uses
maximizing sequences and never assumes norm attainment. For a global union
of Gaussian dimensions, its improvement margin must be uniformly positive
across those dimensions; separate positive margins tending to zero do not
exclude a global maximizing sequence.

## Additional audit of the finite-amplitude bridges

The subsequently added linear-visible Beta profile formulas and constants
in Section 7 check out independently. Gaussian integration by parts gives
`A=h+xh'`, `B=lambda q²h'`, `C=sqrt(lambda)q h`; the positive integral for A
has beta second moment 3/8. This verifies the remainder constants
`3sqrt(pi)/32`, `sqrt(pi)/16`, and `sqrt(pi)/32`, and the L2 projection bounds
with lambda powers two and three. Their stated restriction to linear
visible L is necessary.

The smoothing allowance in Section 8 has exact area integral
`pi eta³/3`. The conditional proper-Gaussian density bound and the normalized
finite cubic buffer construction are correct. A complete negative-image
update need not preserve conditional proper Gaussianity, so the explicit
scope restriction must remain.

Section 9's analytic Rice diagonal majorizer also checks out. For an
independent proper Gaussian buffer, its reciprocal-modulus bound is
`sqrt(pi)/sigma`, uniformly in the mean. The two curvature signs cancel
cross terms, producing the stated diagonal coefficients. Only the
restricted Q0/P0 closure residuals may be used if full residuals depend on
the buffer. For the finite cubic buffer, independence of the **whole** X/Y
buffer is needed to factor the inverse conditional variance from squared
update norms. If directions depend on X, the retained weighted expectation
or the stated Cauchy majorizer is required. Its constants and the genuine
Gaussian cubic/linear L4 factors 27 and 3 are correct.
