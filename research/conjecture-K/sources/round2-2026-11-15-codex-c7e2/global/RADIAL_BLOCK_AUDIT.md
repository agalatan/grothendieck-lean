<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/global/RADIAL_BLOCK_AUDIT.md, 15 November 2026; Agent-ID: codex-c7e2. -->
# Independent audit of the trace-aligned radial blocks

Agent ID: codex-c7e2, all-sector worker. 2026-11-15.

This note independently derives the conditional Gram blocks used by the remote worker's radial-weight certificate. It verifies their mathematical scope and normalizations; numerical acceptance is a separate checker replay recorded below.

## 1. Trace alignment loses no cubic

Let `G∈H_{2,1}(C^n)` and write its Wick polynomial as a homogeneous bidegree-(2,1) polynomial minus its linear trace. A unitary change of Gaussian coordinates can place that trace vector on the first coordinate. If the trace is zero, any first coordinate works. This changes neither `E|G|` nor `||G||₂`.

Write the first coordinate as `Z`, the other `m=n−1` coordinates as `Y`, and put `T=|Z|²`, `S=||Y||²`. Then `T∼Exp(1)` and `S∼Gamma(m,1)` independently. Here `m≥1`.

The visible-coordinate decomposition is

    G=q(Y)+(T−1)r_A(Y)+Z² overline(r_B(Y))/√2
      +Z Q(Y)+overline(Z)P(Y)+ν Z(T−2)/√2.

Decompose the remote cubic into its homogeneous harmonic part and its trace part:

\[
q(Y)=q_{\rm harm}(Y)
+\frac{\eta\cdot Y}{\sqrt{m+1}}(S-m-1).
\]

The trace part has squared norm `||η||²`, since
`E[|Y₁|²(S−m−1)²]=m+1`. Its linear trace vector is `−√(m+1)η`. The A-shell contributes linear trace `−r_A`; hence trace alignment in the remote coordinates says exactly

\[
r_A=-\sqrt{m+1}\,\eta\cdot Y.
\]

The combined trace/A block is consequently

\[
\frac{\eta\cdot Y}{\sqrt{m+1}}[S-(m+1)T],
\]

with squared norm `(m+2)||η||²`. No constraint is imposed on the remaining visible trace component.

## 2. Conditional squared-norm blocks

Decompose `Q=ρ(S−m)/√m+Q₀`, with `Q₀` traceless. The ν and scalar-Q coefficients both have unit energy normalization. Their conditional Gram matrix given `(T,S)` is

\[
\begin{pmatrix}
T(T-2)^2/2&T(T-2)(S-m)/\sqrt{2m}\\
T(T-2)(S-m)/\sqrt{2m}&T(S-m)^2/m
\end{pmatrix}.
\]

The other normalized blocks are scalars:

| block | conditional squared norm per unit energy |
|---|---|
| B | `T²S/(2m)` |
| traceless Q₀ | `TS²/[m(m+1)]` |
| holomorphic P | `TS²/[m(m+1)]` |
| combined remote trace/A | `S[S−(m+1)T]²/[m(m+1)(m+2)]` |
| remote harmonic cubic | `S³/[m(m+1)(m+2)]` |

These formulas can be checked without representation-theoretic conventions. Conditional on `S`,

\[
E|\eta\cdot Y|^2=\frac S m\|\eta\|^2,
\]

\[
E|Y^*AY|^2=\frac{S^2}{m(m+1)}
(\|A\|_{\rm HS}^2+|\operatorname{tr}A|^2),
\]

and for a symmetric holomorphic quadratic matrix `B`,

\[
E|Y^{\mathsf T}BY|^2=
\frac{2S^2}{m(m+1)}\|B\|_{\rm HS}^2.
\]

The corresponding unconditional quadratic norms are respectively `||A||HS²` for traceless `A` and `2||B||HS²`. A homogeneous cubic's conditional norm scales by `S³/ES³`, giving the last row.

All omitted cross terms vanish. Distinct powers of the visible phase are orthogonal. Within visible phase one, the traceless quadratic has zero conditional sphere mean, leaving only the displayed ν/scalar-Q interaction. Within visible phase zero, a homogeneous harmonic cubic is angularly orthogonal to a linear function; multiplying the latter by a function of `S,T` preserves that orthogonality. The same fact follows directly by balancing Gaussian monomial exponents and using the vanishing trace contraction. No unverified cross-sector estimate is used.

For `m=1`, some traceless/harmonic spaces are zero. Retaining their displayed scalar bounds in a maximum only weakens a certificate and is harmless.

## 3. The radial-weight inequality

For every positive measurable radial weight `R(T,S)` with the displayed integrals finite,

\[
(E|G|)^2\le ER\,E(|G|^2/R).
\]

The second factor is exactly the orthogonal sum of the integrated blocks above. Thus it is enough to bound the largest eigenvalue of the integrated two-by-two matrix and the four scalar entries, after multiplication by `ER`.

If `R` is a positive rational constant on each rectangular `(T,S)` cell, every entry reduces to finite sums of exact exponential/integer-Gamma moments. Infinite tail cells are included exactly. The weight need not have any variational or optimality property: its numerical origin affects efficiency, not correctness.

For shape `m`, a cell moment of degree `j` is

\[
\int_l^h s^j\frac{s^{m-1}e^{-s}}{(m-1)!}\,ds
=\frac{(m+j-1)!}{(m-1)!}
\left[e^{-l}\sum_{k=0}^{m+j-1}\frac{l^k}{k!}
-e^{-h}\sum_{k=0}^{m+j-1}\frac{h^k}{k!}\right].
\]

The second term is zero at infinity. The diagonal block integrals without a weight equal one, and the unweighted off-diagonal equals zero; the checker verifies these normalizations.

## 4. Dimension scope

A valid certificate for `n=7` already proves the same bound in every dimension `n≤7`, by embedding a cubic into seven independent coordinates and leaving the extra ones unused, then applying trace alignment there. No separate lower-dimensional certificate is needed.

This audit found no gap or normalization error in the five-block reduction. A certificate below `π/4` therefore proves the sharp Gaussian radius inequality, with a strict uniform gap, for every cubic in `H_{2,1}(C^n)` when `n≤7`. It does not by itself prove the Gaussian-buffer extension, the remote problem in arbitrary dimension, or full Conjecture K.

## 5. Independent replay

The all-sector worker copied the checker and its proposed-weight input into `radial_audit/` and ran `python -O certify_free_radial.py --n 7 --den 16`. The local replay output and certificate are retained there. This copy is isolated from the author's result files. The acceptance checks remain active under `python -O`.

The replay passed all 69,845 cells at 160 bits. I then strengthened the target in the isolated checker to `1569/2000=0.7845` and replayed again against its frozen rational cell weights. It passed: the largest ν/Q eigenvalue is enclosed by `0.784480920275687013868137551794861148479553` with radius below `2.2·10⁻⁴³`, all four scalar blocks are below `0.784186`, and the two-by-two determinant margin is greater than `5.6027·10⁻⁸`.

Thus this independent replay verifies

\[
(E|G|)^2\le\frac{1569}{2000}\|G\|_2^2
<\frac\pi4\|G\|_2^2
\quad\text{for every }G\in H_{2,1}(C^n),\ n\le7.
\]

The final strict inequality is for nonzero `G`. This is an unbuffered radius result; adjoining an independent Gaussian bath cannot be justified by the dimension-seven certificate alone.
