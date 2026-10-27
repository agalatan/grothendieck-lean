# Scalar-tail refinement of the published complex upper construction

The published scalar construction of Heilman, Jones and Malavolta admits
the ordinary mathematical corollary

\[
K_G^{\mathbb C}<1.4048984303
\]

after tightening one infinite-tail estimate. The kernels, response
functions, preprocessors, weights, and integral tables are unchanged.
The new ingredients are the exact norm of a sixteenth polynomial power and a finite weighted sum that retains the contraction at each outer index.

The companion [Lean module](../../Grothe/Haagerup/ScalarTailRefinement.lean)
proves the polynomial/tail refinement and the implication from the stated
numerical ledger. Its fixed phase-tail estimate is also proved, rather than
assumed, using only the standard axioms. It does **not** establish a new unconditional Lean
`IsGrothendieckBound` theorem: the published scalar Gaussian identity and
integral/continuation certificates have not all been connected to this
module in Lean. This distinction is separate from the older, stronger
conditional upper route using ComparisonInputs, energy_close, and Hardy
inputs; none of those older hypotheses is used in the written corollary.

## Published inputs and their meaning

The primary source is [*Sharper Bounds for the Complex Grothendieck
Constant*, Sections 4–6](https://arxiv.org/html/2609.25462v1), together with
the authors' [canonical numerical
certificate](https://github.com/sheilman77/grothendieck_cx/tree/7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f)
at commit `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`.

Its fifth scalar preprocessor is `rho5(t)=t*P5(t^2)`, with the 38 exact
rational coefficients recorded in [certificate.json](certificate.json).
The following facts refer to that **same** published candidate:

- Equations (5.4), (5.6), (5.8): P5 has degree 37,
  `||P5||_1=999999999993/10^12`, and raw weight
  `w5=0.0000169358532612748746`.
- Equation (6.2): raw slope
  `qhat0>0.71179640805640433452`; nonlinear radial prefix through index
  119 has norm `<1.074829404498064e-6`.
- Equation (6.19): the weighted nonlinear output tail, indices 120..5000,
  of the complete first 67 outer phase blocks is
  `<2.699176355797438e-12`.
- Equation (6.30): the other weighted full tails, branches 1–4 and 6,
  together are `<1.040224125770398e-7`.
- Equation (6.28): the exact total selector mass is
  `M=1250000000000000121997/1250000000000000000000`.

The degree calculation in (6.18) ensures those first 67 blocks are
complete before radial degree 5000. The old bound in (6.20) charges
every remaining outer block by `||P5^(2j+1)||_1<=1`. Only that last
estimate is replaced. Its Wallis input, equation (6.14), is
`sum(j>=N,h_j)<=1/(4N)` for the **physical** Gaussian-phase coefficients
h_j, whose first coefficient is pi/4. No extra pi factor belongs in the
new tail reserve.

The canonical code serializes both scalar row 3 and its raw weight with
opposite signs to the paper. Oddness of the phase kernel makes their
product identical. Normalization uses the total absolute raw mass M;
negative weights are absorbed into valid output orientations rather than
treated as probabilities.

## New exact finite fact

Let `||.||_1` be the sum of absolute polynomial coefficients. Independent
integer convolution, with common input denominator 10^12, gives

\[
\|P5^{16}\|_1
=0.580798333180773826040643482921687272286904494948897883\ldots
<581/1000=:q<1.
\]

The power has degree 592 and 593 coefficients. The exact rational result
and its independent arithmetic replay are preserved in
[POWER16_ARITHMETIC_AUDIT.json](verification/POWER16_ARITHMETIC_AUDIT.json).
The production generator uses the exact coefficient list, not the
displayed decimal approximation. The finite Lean check uses the rational
cap 581/1000.

## Complete infinite-tail deduction

For every integer j, quotient and remainder give

\[
\|P5^{2j+1}\|_1\le q^{\lfloor(2j+1)/16\rfloor}.
\]

The outer term `rho5(t)^(2j+1)` differs from this polynomial power by a
monomial factor and the substitution `x=t^2`, which preserve its
coefficient norm. Keep the decreasing weight
`w(j)=q^floor((2j+1)/16)` at each index. Let
`r_j=4*h_j/pi` and `g_j=r_j*(j+1)*(2*j+1)`. The existing Haagerup
majorant gives, for every positive J,

\[
\sum_{j\ge J}h_j\le \frac{\pi}{4}\frac{g_J}{2J}.
\]

Split the omitted series at J=160. Since `w(j)<=w(160)=q^20` for
j>=160, its full norm is bounded by the exact rational quantity

\[
B=\frac{355}{452}\left(
\sum_{j=67}^{159}r_j q^{\lfloor(2j+1)/16\rfloor}
+q^{20}\frac{g_{160}}{320}\right).
\]

Here pi<=355/113 is paid once, including the physical coefficients' pi/4
normalization. Thus

\[
\begin{aligned}
\tau_{5,\mathrm{outer}}
&\le w5\sum_{j\ge67}h_j\|P5^{2j+1}\|_1\\
&\le w5 B
=1.42727865917729184869023704621\ldots\times10^{-10}.
\end{aligned}
\]

This controls the entire omitted-outer series, hence also its nonlinear
output tail. Some omitted blocks contribute to the already computed
prefix; bounding their whole norm again is conservative and does not
invalidate that independently computed prefix. All retained-block,
other-branch, table-error and normalization costs stay paid.

The unchanged scalar asymmetric atom is justified in the paper by
one-dimensional Gaussian/Laguerre coefficient integrals, exact endpoint
phase cancellation, and endpoint-subtracted weighted energy bounds.
This refinement introduces no new Gaussian response or integral identity.

## Exact final arithmetic

Assemble the rational upper bound

\[
\begin{aligned}
R={}&1.074829404498064\cdot10^{-6}
+2.699176355797438\cdot10^{-12}\\
&+1.040224125770398\cdot10^{-7}
+w5 B.
\end{aligned}
\]

The canonical prefix estimate already includes its integral-table
truncation/product errors; those errors must not be added a second time.
The exact sum is

\[
R=0.000001178997244117377326622869023704621607332\ldots.
\]

With the exact raw selector mass, define

\[
\Gamma
=\frac{0.71179640805640433452-R}{M}
=0.711795229059160147673167329506687866831\ldots.
\]

Exact rational arithmetic proves

\[
\Gamma\cdot\frac{14048984303}{10000000000}>1,
\qquad
\Gamma^{-1}
=1.404898430299658557275425656370645734273\ldots
<1.4048984303.
\]

The conservative reciprocal claim has margin about 3.41442724e-13.
The exact selector normalization, including its small excess over one,
has not been dropped. The paper's valid-kernel mixture and residual
transfer argument therefore give the stated mathematical corollary.

## What was independently replayed

The archived [receipt](verification/UPSTREAM_REPLAY.json) records four
successful remote stages under Python 3.12.3, python-flint 0.9.0 and NumPy
2.5.4:

1. exact nonvanishing and root-disk checks for the radial polynomial;
2. directed total/visible energy integration and scalar-origin tail;
3. directed scalar prefix, scalar tails, table pins and normalization;
4. independent Fraction-only final arithmetic for the original published
   certificate.

All return codes are zero. Their source hashes and complete output logs
are preserved in [verification/](verification/README.md). The power16
norm and current weighted final arithmetic were independently recomputed with
integer/Fraction operations; they do not rely on a floating optimization. The archived `POWER16_ARITHMETIC_AUDIT.json` retains its original ledger. `verify_receipts.py` checks that archive, then independently recomputes the current weighted ledger and binds it to `certificate.json`.

The two coefficient tables were **not regenerated**. Their pinned hashes
were checked and their outward intervals were consumed by the successful
replay. Thus this is a fresh replay of the published non-regeneration
certificate, together with a new exact power-tail estimate. It is not an
independent rerun of every table-producing integral. The table enclosure
justification and scalar Gaussian interpretation remain the identified
published proof inputs, rather than new unproved conjectures.

## Formalization and source scope

The formal contribution in this delivery is the sixteenth-power norm
certificate, the complete Wiener tail deduction, and exact ledger
arithmetic/implication in
[ScalarTailRefinement.lean](../../Grothe/Haagerup/ScalarTailRefinement.lean).
The finite power check uses `decide +kernel` on the same outward
interval computation. The original power certificate uses only standard axioms. The weighted estimate adds no native fact or analytic premise. The strengthened generic split, weighted suffix and score theorem pass a local Lean check against the unchanged compiled power certificate; the final theorem reports only `propext`, `Classical.choice` and `Quot.sound`. Full compilation of the generated production module is pending. The archived build receipt records the earlier source hashes and does not certify this revision.
The fixed Wallis estimate is derived from the existing formal Haagerup
majorant, using an exact split at 120. If `r_j=4*h_j/pi` and
`g_j=r_j*(j+1)*(2*j+1)`, then

\[
\sum_{j\ge67}h_j
\le\frac{\pi}{4}\left(\sum_{j=67}^{119}r_j+\frac{g_{120}}{240}\right)
\le\frac{355}{452}\left(\sum_{j=67}^{119}r_j+\frac{g_{120}}{240}\right)
\le\frac1{268}.
\]

The final rational expression is approximately
`0.003730857677462347`, below `1/268`. Its finite comparison uses
proof-producing `decide +kernel`; no native fact is added. The weighted estimate instead splits at 160 and applies the same majorant with its endpoint weight. The generic `weighted_composition_cut` theorem proves the finite-prefix/suffix step for any nonnegative antitone weights bounded by one. The direct
`refined_score_of_published_budgets` corollary has no Wallis
hypothesis. It retains the published numerical budget inequalities,
whose Gaussian interpretation remains outside this formal score theorem.

It does not assert that the published numerical integral facts have
already been proved in Lean, and it does not change the existing
hypothesis-free Lean upper endpoint by this module alone. Build/axiom
status for the final integrated tree is recorded by delivery CI; the
Python receipts are not a Lean build receipt.

Only source URLs, commit/hash metadata, the replay driver's own code,
numeric inputs, arithmetic receipts and our run logs are packaged here.
No upstream source code or coefficient NPZ is vendored. No explicit code
license was found in the pinned public repository; public hosting does
not itself grant a redistribution license. The full source/data pins
remain in [UPSTREAM_MANIFEST.json](verification/UPSTREAM_MANIFEST.json) so
the original certificate can be obtained and checked at its exact source.
