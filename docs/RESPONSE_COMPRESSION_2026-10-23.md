# A shared-response multiplication hierarchy

23 October 2026. This is a new research interface, not a new Grothendieck bound.
The underlying contraction principle is standard operator theory; the proposed
application is to the repository's shared-driver, multi-grade obstruction.

## The extraction lemma

Let `(Ω,μ)` be a probability space and let `f:Ω→ℂ` be measurable, `|f|≤1`.
Multiplication `M_f x=fx` contracts `L²(μ)`. For any finite orthonormal feature
banks `(u_i)` and `(v_j)`, define

\[
C_{ij}=\langle u_i,M_fv_j\rangle.
\]

Then `||C||op≤1`, or equivalently

\[
\begin{pmatrix}I&C\\ C^*&I\end{pmatrix}\succeq0.                 (1)
\]

Indeed, for every vector `b`, Bessel gives
`Σ_i |Σ_j C_ij b_j|² ≤ ||f Σ_j b_j v_j||² ≤ Σ_j|b_j|²`.
The quadratic form of (1) is nonnegative by Cauchy–Schwarz and
`2ab≤a²+b²`. The same multiplication operator appears in every entry.

This matters when polynomial product identities make the same response
coefficient appear in several entries. It is not a PSD condition on a new
cross block that can be freely completed by zero.

## A dimension-free cubic/quintic/septic example

Use standard proper complex Gaussians with `E|Z|²=1`. Put `R=|Z|²~Exp(1)`
and `u_j(R)=(-1)^j L_j(R)`, the orthonormal ordinary Laguerre polynomials.
Let `q(W)∈H_(2,1)` be any normalized remote cubic, independent of `Z`.
There is no restriction on its dimension, tensor rank, influence or law.
For one bounded charge-one response `f(Z,W)`, put

\[
b_j=\mathbb E[f(Z,W)\overline{q(W)}u_j(R)].
\]

These are coefficients in the *same* remote driver at total degrees
`3,5,7,…`. The banks `u_i` and `conj(q)u_j` are orthonormal, by independence
and `E|q|²=1`. Compress `M_f` between them. The identity

\[
u_1^2=1+2u_1+2u_2
\]

therefore proves

\[
\left\|\begin{pmatrix}b_0&b_1\\b_1&b_0+2b_1+2b_2\end{pmatrix}
\right\|_{op}\le1.                                             (2)
\]

Conjugations in this formula follow the convention
`<u,v>=E[conj(u)v]`. The input feature is `conj(q)u_j`, not `q u_j`.
Its charge is minus one, so multiplication by charge-one `f` lands in
the neutral output sector. The coefficient definition has the desired charge.

For example `b=(4/5,3/10,0)` passes the separate coefficient-energy check
`Σ|b_j|²=73/100`. But its second compression column has squared norm

\[
(3/10)^2+(7/5)^2=41/20>1.
\]

Thus energy feasibility does not imply response feasibility. This example is
artificial coefficient data; it is not one of the saved radial countermodels.

Omitted companions must remain free. The repair `b_2=-1/2` makes (2) feasible,
with total displayed energy `49/50`. The repaired matrix is
`[[4/5,3/10],[3/10,2/5]]`; `I−C` has determinant `3/100` and `I+C` determinant
`243/100`. Its eigenvalues are `(6±sqrt(13))/10`. This is a feasible truncated
profile, not a realization theorem. A useful hierarchy must price the repair
against all remaining energy and the original projection penalties.

More generally, if

\[
u_i u_j=\sum_{k=0}^{i+j}\gamma_{ijk}u_k,
\qquad
\gamma_{ijk}=\mathbb E[u_i(R)u_j(R)u_k(R)],
\]

then every finite matrix `C_ij=Σ_k γ_ijk b_k` is contractive.
All these structure constants are rational integers/fractions and can be
checked using `E R^n=n!`. Different entries cannot choose different copies
of `q`. Extra banks may include the visible `Z² conj(q)` companion and both
responses, provided their actual Gram identities are retained.

## A linear/cubic/quintic cut

Define unnormalized one-coordinate coefficients

\[
m_k=\mathbb E[f\overline Z\,(-1)^k L_k^1(R)].
\]

The normalized charge-one chaos coefficient is `a_k=m_k/sqrt(k+1)`.
The Laguerre identity

\[
(-1)^jL_j^0=(-1)^jL_j^1+(-1)^{j-1}L_{j-1}^1
\]

and Bessel applied to `conj(Z)f` give, for every `d`,

\[
\sum_{j=0}^d|m_j+m_{j-1}|^2\le
\mathbb E[R|f|^2]\le1,\qquad m_{-1}=0.                         (3)
\]

This holds in arbitrary Gaussian dimension; all other coordinates of `f`
are retained. For `d=2`, (3) reads

\[
|a_0|^2+|a_0+\sqrt2a_1|^2+|\sqrt2a_1+\sqrt3a_2|^2\le1.
\]

The artificial data `m=(21/25,−21/50,0)` pass weighted Parseval with cost
`3969/5000`, while (3) costs `1323/1250`, exceeding one by `73/1250`.
If the first two coefficients are fixed and `m_2` is real, it must satisfy

\[
m_2\ge21/50-\sqrt{59/500}>0.
\]

This is a concrete example of boundedness forcing a higher-grade companion.
It does not prove that a chosen response norm is small; the companion can
carry a cost, a benefit, or no coefficient in the selected witness.

## What is checked

`Grothe/LowerAnalytic/ResponseCompression.lean` constructs `M_f` on actual
`L²` for measurable `|f|≤1`, proves contraction, finite compression and block
quadratic positivity. It proves the two displayed finite coefficient-cut
interfaces, the exact rejection arithmetic and the forced-companion bound.
The Gaussian feature orthonormality and coefficient identifications are
explicit hypotheses in those finite interfaces; their extraction proofs above
are not claimed to be completed Lean formalization.

`tools/response_compression.py --self-test` checks ordinary Laguerre
orthonormality through index eight, all products through index five, the
associated-Laguerre recurrence, singular PSD controls, the two rejected
profiles and the repaired companion. It checks two actual disk-valued
responses analytically:

- `f(Z)=Z exp(−|Z|²)`, with
  `m_k=(-1)^k(k+1)/2^(k+2)` and the sharper right side `2/27` in (3);
- `f(Z,W)=W exp(−|W|²−|Z|²)`, with the *same* remote
  `q(W)=W(|W|²−2)/sqrt(2)`. Here
  `b_k=(-1)^(k+1)/(2^(k+3)sqrt(2))`, so a rational scaled Gram test
  checks compressions through order five.

There are 167 exact algebraic/control checks. They are not numerical
quadrature or a certificate of a global Grothendieck norm.

## First falsification experiment

Lift the current pre-supremum fibre expression, keeping the actual response
coefficients, selected remote `q`, visible companions and original negative
squares. Add order-one and order-two versions of (1). Optimize over **all**
admissible higher-grade completions and all original penalties. Use actual
W-model contacts, influential `X G_2` limits, coupled Wick monomials and
phase responses as positive controls. Compare to the identical lifted model
with the multiplication constraints disabled.

Stop this feature family after two enrichments if the binding objectives do
not move by more than the required error budget. In particular, do not feed
only a saved radial law into (1): its coefficient entries are unknown. A zero
or otherwise convenient completion proves nothing about that law. The saved
radial witnesses must be tested by a supremum over their possible lifts.

This differs from the rejected finite-site phase cuts: it uses products at
the same Gaussian input and exact polynomial product identities, rather than
an off-site covariance whose high chaos is exponentially suppressed. It also
differs from a small-coordinate reduction: `q` remains an arbitrary actual
remote tensor. Completeness for the whole response pair, a uniform norm cap,
and an endpoint remain open.

## Execution update: selected penalty lift

The proposed first test now has a precise negative outcome, recorded in
[the response-lift experiment](RESPONSE_LIFT_EXPERIMENT_2026-10-23.md).
Order-one and order-two three-sector compressions, all touched companions,
the same `f=h+k,g=h−k`, energy budgets, and stronger conditional-radius cuts
admit exact zero-cost completions at all twelve audited contacts. This tests
the selected projections of the original negative squares; it does not
optimize the full joint pre-supremum fibre objective.

The stronger fixed-law support test distinguishes two mechanisms. At law
5661, an Arb-certified separator forces a selected penalty above `1.39e-8`.
At law 7234, an explicit bounded response pair on the abstract radial space
matches all five selected zero-cost targets, with certified norm below `.9995`.
Thus full boundedness of these selected moments still leaves that artificial
law alive. Higher orders of the same moment-only test cannot reject it.
The missing variables include the full conditional projection fields, their
joint fibre deficit, and the remote variable's actual cubic tensor structure.
The full discarded squares and the fibre value of that explicit pair are not
certified by this experiment. No endpoint changes.
