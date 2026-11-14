# Exact lower-witness refinement — Lean reflection pending

This is the acceptance input for task #378. Its complete exact-arithmetic
replay gives the scalar cap

\[
B=\frac{3567097}{5000000}=0.7134194,
\qquad
K_G^{\mathbb C}\geq\frac{5000000}{3567097}>1.4017000378,
\]

using the repository's existing analytic reduction and Gaussian transfer.
There is no Conjecture K premise. **The new certificates and cover have not
been reflected in Lean.** They are not imported by `Grothe`, and this input
does not update `MainResult` or the repository's formal lower endpoint.

## Replay

From the repository root:

```sh
python3 -B -S tools/verify_lower_refinement.py
python3 -B -S tools/check_lower_refinement_controls.py
```

Both commands use only the Python standard library and existing
`tools/rankone_law.py`. They neither access the network nor invoke a numerical
optimizer. Do not use `-O`: the inherited rational checker uses assertions,
and the entry points refuse optimized Python. Paths are resolved relative to
the scripts, so the current working directory does not affect acceptance.

Successful replay reports 10,909 original boxes, 21 new law majorants,
1,003 replaced parents, and 14,060 final leaves. The exact maximum is displayed
as a rational number; its approximate value is `0.7134193997590335` at parent
5588. Only rational comparisons decide acceptance. The eight negative
controls reject damaged majorants, spectral parameters, subdivision trees,
stored bounds, convex weights, node indices, and restricted-node usage.

## Inputs and provenance

- `sources.json` pins the 22 original Lean data files and the reused arithmetic
  checker by exact Git blob hash. A source change fails closed; investigate
  and reverify it before updating a hash. The recorded successful Lean run
  covers the inherited analytic proof, not this extension.
- `nodes.json` is the ordered registry of the 21 files under `nodes/`. Original
  batch indices are 0 through 22; each new node contributes one singleton batch,
  starting at 23. Registry order is part of the certificate.
- Each node records its original source batch, scale, five polynomial
  coefficients, spectral/Gram/joint-moment witness, and exact positivity proof
  statistics. The `cut` field is discovery provenance and is not a premise.
- `cover.json` records the cap, the strict decimal consequence, the same node
  registry, and the complete replacement forest. Each parent record occupies
  one JSON line. Parents index the serialized boxes in
  `Grothe/Research/RefinedCoverData.lean` from zero.

The original Lean data and `rankone_law.py` are reused in place. Numerical
search scripts and abandoned candidates are not needed for acceptance.

## Mathematical checks

For the fixed witness epsilon = 149/200, the inherited reduction supplies
the domain

\[
0\leq t\leq9/10,\quad 0\leq\tau\leq\rho,
\quad0\leq x\leq31/4,\qquad \rho=973612157/10^9,
\]

and a common cubic law with

\[
\mathbb EU=1,\quad \mathbb E\sqrt U\leq\rho,\quad
\mathbb EU^2=2+x^2,\quad
\mathbb EU^3\leq6+9x^2+(4045313/100000)x^3.
\]

For each new law node, the reused checker proves
`S(tau * s) + G(s*s) <= p(s)` on the entire half-line `s >= 0`.
Here `S` is the existing source envelope with its certified affine tail,
and the existing Stein identities and checked budgets give `E G(U) >= 0`.
After clearing the removable denominators, positivity is checked by rational
Bernstein subdivision on bounded intervals and nonnegative translated
coefficients on the final ray. Gram budgets are checked exactly; joint
fourth/sixth-moment budgets retain their explicit maximum value of `x`.
No new source-node integration or shifted-source premise is used.

For `p(s) = c0 + c1*s + c2*s^2 + c4*s^4 + c6*s^6`, with `c1,c6 >= 0`,
the resulting law bound is

\[
J(p,x)=c_0+\rho c_1+c_2+c_4(2+x^2)
       +c_6(6+9x^2+(4045313/100000)x^3).
\]

Finite convex mixtures preserve the retained-square row inequality by
iteration of the existing two-row mixing identity. Gate matrices and
coupling vectors are mixed before completing the square. If the mixed row
is `(ell,beta,k,h1,h2,c11,c12,c22)`, its price is

\[
D=k-h^{\mathsf T}C^{-1}h,\qquad
C=\begin{pmatrix}c_{11}&c_{12}\\c_{12}&c_{22}\end{pmatrix}>0.
\]

Scale interpolation between two law-node chords gives a quadratic expression
in the scale after subtracting `D*tau^2`. Its maximum includes an interior
vertex when applicable. The `x` dependence is `a+b*x^2+c*x^3`, with `c >= 0`.
On a nonnegative interval its derivative cannot change from positive to
negative, so its maximum is at an endpoint even if `b` is negative. The
`t` dependence is likewise maximized exactly. The original padding is restored
once, after mixing.

The verifier reconstructs the entire original binary partition. Every
replacement splits its parent into two children meeting at an interior
rational coordinate. A `cap` leaf uses the inherited box serialization
(its internal box type can be `c`, `b`, or `m`); a `multi` leaf supplies
nonnegative weights summing to one and compatible source-node components.
The first entry of each component tuple is a discovery label, not a premise;
the serialized component determines its source. Every node range, stored
leaf bound, parent maximum, and unchanged original box is rechecked. No
replacement may worsen its parent. The final maximum is compared with `B`
and the reciprocal comparison is checked exactly.

## Formal integration still required

The existing `BoxKind` reflection handles at most two row components. This
input also uses longer finite mixtures. Before promoting the endpoint:

1. Reflect the new node bank and its accepted budget/range data.
2. Extend the finite-mixture checker and prove its soundness, or translate
   these mixtures to an equivalent supported representation.
3. Generate the complete new cover and partition certificates, check them in
   Lean, then update the endpoint and bound documentation in the same change.

The Python result is a computer-assisted arithmetic extension of the existing
analytic proof. A green CI status saying “no proof change” does not discharge
these remaining Lean obligations.

Agent-ID: codex-df7b
