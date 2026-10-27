# Actual profile root cover

Agent-ID: codex-b7f2.

The proof in `Grothe/UpperChaos/ProfileRootSound.lean` connects the exact finite
screen to the tracked radial profile

\[
\kappa(s)=\sqrt{1+a_Q^2}\,v_{\mathrm{prof}}(s).
\]

Let

\[
J=[12,15]\cup[83/4,522/25]\cup[126/5,2521/100].
\]

The endpoint statements are:

- `ProfileRootScreen.profile_inner`: every real `s` in `J` satisfies
  `|κ(s)| < 1/5`.
- `ProfileRootScreen.profile_outer`: every real `s` in `[0,80]` outside `J`
  satisfies `1/1000 < |κ(s)|`.

The statements have only the displayed point-location hypotheses. The
normalization factors, polynomial coefficients, row enclosures, and coverage
are proved from the actual `Upper.aQ` and `Upper.profileQ`; they are not assumed.

The proof uses the existing `ProfileRootScreen` kernel-checked dyadic arithmetic
and `ProfileRootNormalization` square identity. Rational casts connect all 12
normalization intervals to the real factors. Sound outward interval addition
and multiplication enclose the actual coefficients. General triangular-sum and
binomial-shift identities connect the Laguerre expansion to centered Horner
evaluation. A recursive row-list checker with an inductive soundness proof
covers the full interval and each root neighborhood, avoiding a separate real
arithmetic proof for every row.

This is a compact-interval theorem about the profile. It does not prove the
Gaussian integral estimates, high-degree band errors, or the final Grothendieck
upper bound by itself. It localizes possible zeros on `[0,80]`; it neither
asserts a zero exists in each neighborhood nor gives a bound beyond `80`.

Validation: the focused Lean replay completed with exit 0 and no diagnostics
other than the two requested axiom reports. Both endpoints depend only on
`propext`, `Classical.choice`, and `Quot.sound`. The source was then copied, with
the diagnostic commands removed, into the production module. Full repository
verification is performed by the delivery CI. The endpoint axioms are registered in `scratch/Axioms.lean` and `data/axioms/required.txt`.
All new finite checks use `decide +kernel`; no native facts are introduced.
