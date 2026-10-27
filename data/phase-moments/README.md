# Exact phase moments

For independent standard complex Gaussians `z,w` with density
`π⁻¹ exp(-|z|²)`, write `U=|z|²`, `V=|w|²`, `W=Re(conj(z)*w)` and
`D=Im(conj(z)*w)`. The production phase is

\[
\varphi=D\exp(-\varepsilon(U+V))S(U,V,W),\qquad \varepsilon=21/20.
\]

`S` is the 1,140-term rational polynomial read by `phaseTerms` from
`Grothe/Upper/Data.lean`. Its full common denominator is
`L = 302002543697172916153771578242367488000`, including its odd factors.
The checker constructs the integer polynomial `A=L*S` and computes `A^(2j)`.

For `λ=1+2jε`, the finite integration rule used by the evaluator is

\[
\begin{aligned}
&\mathbb E[D^{2j}U^aV^bW^m e^{-(\lambda-1)(U+V)}]\\
&\quad=\sum_{s=0}^{2j}\sum_{t=0}^{m}
\mathbf 1_{\{2j-s+m-t=s+t\}}
\frac{(-1)^{j+s}\binom{2j}{s}\binom mt
       (a+s+t)!(b+s+t)!}
     {4^j2^m\lambda^{a+b+2s+2t+2}}.
\end{aligned}
\]

The balance condition makes odd `m` vanish. Apply this rule to every coefficient
of `A^(2j)` and divide the sum by `L^(2j)` to obtain `E[φ^(2j)]` exactly.

`PhaseMomentCheck` proves denominator clearing and exact integer polynomial
convolution. `PhaseMomentEval` integrates the resulting polynomial using the
finite invariant-monomial formula. `ConcretePhaseMoments` identifies this
calculation with every even moment of the actual `phiT`, without using the
numerical phase-cover certificate.

`targets.json` preserves the rational second, fourth and sixth moments recovered
by `tools/needle_phase_moments.py`. These fractions and the semantic source hash
record provenance; they are not assumptions about Gaussian integrals. Each
numerical Lean leaf must recompute its value directly from production
`phaseTerms` and `phaseEpsQ` and prove equality with the stored target.

Check the phase binding and generated target file from the repository root:

```sh
python3 tools/gen_phase_moment_data.py --check
```

This lightweight command checks the semantic phase, damping, full common
denominator, and byte-for-byte generation of `PhaseMomentData.lean`. It does
not expand the polynomial powers or verify the Gaussian moments.

Three independent numerical leaves (`PhaseMoment2`, `PhaseMoment4`, and
`PhaseMoment6`) each use one single-threaded native check to recompute a moment
from the actual phase and compare it with its exact target. The generic identity
uses only standard axioms; each integral consequence additionally uses its own
`phase_momentN_check._native.native_decide.ax_1_1` fact. `PhaseMomentNorms`
identifies the results with the squared norms of the three positive Taylor sources.

The [second-moment delivery](https://github.com/agalatan/grothendieck-lean/actions/runs/40468150361)
passed its full build and axiom audit. `PhaseMoment2` built in 4.8 seconds
(whole-module time, not isolated native evaluation). The
[fourth/sixth delivery](https://github.com/agalatan/grothendieck-lean/actions/runs/40471192509)
also passed: 9,305 build jobs, 676 audited declarations and all 91 native facts.
`PhaseMoment4`, `PhaseMoment6`, and `PhaseMomentNorms` built in 31 s, 175 s,
and 3.7 s respectively. The three integral statements each use only their
own moment native fact beyond the standard axioms. The norm statements also
use the existing phase-cover facts for their `L²` representatives.

This ingredient alone does not discharge the component-error or stored-energy
comparison hypotheses of the conditional Grothendieck bound.

Agent-ID: codex-2ca4
