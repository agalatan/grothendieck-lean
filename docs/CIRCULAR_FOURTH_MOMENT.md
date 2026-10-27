# Sharp fourth moment for complex cubic chaos

Agent-ID: codex-8785

For every element `q` of the complex Gaussian chaos `H_{2,1}`,

\[
  \boxed{\mathbb E|q|^4\le 44\bigl(\mathbb E|q|^2\bigr)^2.}
\]

The constant is sharp, independently of the number of Gaussian coordinates.
This sharpens the bound 62 obtained by treating the real and imaginary parts
as an arbitrary orthogonal pair in the real third chaos. It uses circularity;
the two statements apply to different classes. The proof below is analytic,
with no numerical certificate. The upper bound and its fluctuation-range
consequence are proved in `Grothe/LowerAnalytic/CircularFourth.lean`. The
extremizer, rigidity and all-even-moment results below are analytic rather
than Lean theorems.

## Proof via the complex Fock product

Write `q = I_{2,1}(f)`, where `f` is separately symmetric in its two
holomorphic slots, and normalize the complex multiple integrals by
`E |I_{p,q}(f)|² = p! q! ||f||²`. Thus `E|q|² = 2 ||f||²`.

The product formula for complex multiple Wiener integrals, applied to
`q²`, has contraction counts `(r,s) ∈ {0,1}²`. If `S` denotes separate
symmetrization of the remaining holomorphic and antiholomorphic slots, its
three orthogonal bidegree components have kernels

\[
\begin{aligned}
K_{4,2}&=S(f\otimes f),\\
K_{3,1}&=2S(f\otimes_{1,0}f)+2S(f\otimes_{0,1}f),\\
K_{2,0}&=4S(f\otimes_{1,1}f).
\end{aligned}
\]

Each contraction has Hilbert–Schmidt norm at most `||f||²`: group the
contracted indices into one Hilbert space and apply Cauchy–Schwarz. Separate
symmetrization is an orthogonal projection and therefore does not increase
the norm. Consequently `||K_{4,2}|| ≤ ||f||²`,
`||K_{3,1}|| ≤ 4||f||²`, and `||K_{2,0}|| ≤ 4||f||²`. Orthogonality of
different bidegrees and the isometry give

\[
\begin{aligned}
\mathbb E|q|^4
 &=4!2!\,\|K_{4,2}\|^2+3!1!\,\|K_{3,1}\|^2+2!0!\,\|K_{2,0}\|^2\\
 &\le (48+16\cdot6+16\cdot2)\|f\|^4
 =176\|f\|^4=44(\mathbb E|q|^2)^2.
\end{aligned}
\]

The product formula is Theorem 2.1 of [Yong Chen, *Product Formula and
Independence for Complex Multiple Wiener–Itô Integrals*](https://ccj.pku.edu.cn/Article/DownLoad?id=215179305&type=ArticleFile).
Janson's *Gaussian Hilbert Spaces*, Theorems 3.9 and 3.15, supplies the
corresponding Wick isometry and diagrammatic product rule. The estimate is
valid first for finite-dimensional kernels; density and hypercontractivity
extend it to the completed chaos.

For equality, let `Z` be standard proper complex Gaussian and take

\[
 q=\frac{Z(|Z|^2-2)}{\sqrt2}.
\]

With `T=|Z|² ~ Exp(1)`, `E|q|²=1` and

\[
\mathbb E|q|^4
 =\tfrac14\mathbb E[T^2(T-2)^4]
 =\tfrac14(6!-8\cdot5!+24\cdot4!-32\cdot3!+16\cdot2!)=44.
\]

## All even moments

The same extremizer controls every even moment, for every fixed complex
bidegree. If `F ∈ H_{p,q}` and `W_{p,q}(Z)=:Z^p conjugate(Z)^q:`, then
for every integer `m ≥ 1`,

\[
 \mathbb E|F|^{2m} \le
 \frac{\mathbb E|W_{p,q}(Z)|^{2m}}{(p!q!)^m}
 \bigl(\mathbb E|F|^2\bigr)^m.
\]

To see this, expand the product of `m` copies of `F` and `m` copies of
`conjugate(F)` by Janson's Wick diagram formula. There are no edges within a
vertex. For each diagram, let each edge carry its Gaussian-coordinate index.
The resulting tensor network is bounded in absolute value by the product of
the Hilbert–Schmidt norms of its `2m` vertex tensors. This is the graph case
of the [Finner inequality](https://doi.org/10.1214/aop/1176989534):

\[
 \sum_{(i_e)}\prod_v |A_v((i_e)_{e\ni v})|
 \le \prod_v\left(\sum_{(i_e)_{e\ni v}}
       |A_v((i_e)_{e\ni v})|^2\right)^{1/2}.
\]

Every edge index occurs in exactly two factors. One can prove the displayed
inequality directly by eliminating one edge at a time with Cauchy–Schwarz;
each elimination replaces the two incident functions by their `ℓ²` norms in
that edge. After all edges are eliminated, each remaining factor is exactly
the full Hilbert–Schmidt norm of its original tensor. Thus every diagram is at
most `||f||^(2m)`. When `f` is concentrated on one coordinate, every admissible
diagram equals one, so their number is the corresponding scalar Wick moment.
Finally use the isometry `E|F|² = p!q! ||f||²`. This also proves sharpness;
the argument does not classify all equality cases.

This diagram argument is standard: [Péter Major, *Multiple Wiener–Itô
Integrals*](https://static.renyi.hu/~major/articles/lect00.pdf), Theorem 5.3
and Corollary 5.6, gives the analogous sharp all-even-moments statement for
real chaos. The application above keeps the two complex charges separate.

In particular, for normalized `q ∈ H_{2,1}`,

\[
  \mathbb E|q|^6 \le 11352,
\]

again with equality for `Z(|Z|²−2)/sqrt(2)`. This is an absolute cap. It does
not replace the much more informative existing sixth-moment bound in terms
of `E|q|⁴`; their minimum is stronger only near the extreme end of that
range. The all-even-moments statement and this sixth-moment cap are analytic
results here, not yet Lean theorems.

For the equality calculation, `E|q|⁶ = E[T³(T−2)⁶]/8`, which is
`(9!−12·8!+60·7!−160·6!+240·5!−192·4!+64·3!)/8 = 11352`.

## Connection to the existing Lean development

The same proof has an economical expression in the existing complex
contraction coordinates. For `E a² = 1/2` and circular `q = a + ib`, let
`t = gramT J a b`, and let `n,h,b,y` be `gramN t`, `gramH t`, `gramB t`,
`gramY t`. The already established `JointSixth.gram_chi` is exactly

\[
\mathbb E|q|^4-2=32n+8h+32b+96y.
\]

The normalization is `||t||²=1/2`; ordinary Hilbert–Schmidt estimates give
`n,h ≤ 1/4`. The existing contraction inequalities give `b ≤ n` and
`y ≤ z ≤ sqrt(nh) ≤ 1/4`. Substitution gives `E|q|⁴ ≤ 44`. This route
reuses the already formalized fourth-cumulant and complex tensor identities;
it does not require adding the full complex product formula to Lean.

It also exposes a rigidity statement. Set `δ = 44 − E|q|⁴`. The same identity
gives

\[
 \delta=32(\tfrac14-n)+8(\tfrac14-h)
        +32(\tfrac14-b)+96(\tfrac14-y),
\]

and all four terms are nonnegative. In particular `n ≥ 1/4 − δ/32` and
`b ≥ 1/4 − δ/32`. The matrix `N` is positive semidefinite with trace `1/2`
and squared Hilbert–Schmidt norm `n`, so its largest eigenvalue is at least
`2n ≥ 1/2 − δ/16`. Consequently a single complex direction captures at least
`1 − δ/8` of the squared norm of `t` in its first slot. This is a paper
consequence of the contraction identities, not a claim that the quantitative
spectral extraction has been formalized in Lean.

At equality, `n = b = 1/4`. Equality in `n ≤ (tr N)²` makes the first-slot
flattening rank one; symmetry in the first two slots then forces
`t = c u ⊗ u ⊗ v` for unit vectors `u,v`. The equality `b = 1/4` forces
`|sum_i u_i v_i| = 1`, hence `v` is a phase multiple of `conjugate(u)`.
The Fock-kernel identification therefore shows that every nonzero extremizer
is a scalar multiple of `W(|W|²−2)` for one standard complex Gaussian `W`.
This classifies fourth-moment equality; it is not asserted for every
even-moment inequality above.

For the lower-bound law parameter `x²=E|q|⁴−2`, the sharp range is
`0 ≤ x ≤ sqrt(42) < 13/2`, instead of the current `31/4` cover. Narrowing
the production range and regenerating its certificates is a separate change;
the new moment inequality alone does not prove a new Grothendieck endpoint.

An exact scan of `data/lower-unshifted/cover.json`, comparing the squares of
rational endpoints with 42, finds 20 boxes whose `x`-lower endpoint is above
`sqrt(42)`, and another 388 that cross this cutoff. None of the former 20 is
among the 939 boxes whose stored upper bound
exceeds `0.71342`; four of the crossing boxes are among those 939. The maximum
stored upper bound is still attained in a retained box. These counts describe
the existing certificate, not a regenerated
or Lean-checked smaller cover. Numerically, the existing three-moment
first-moment relaxation attains its maximum near `x = 1.38037`, well inside
the improved range; simply reducing the cutoff therefore does not improve that
relaxation's current `ρ`.

Run `node tools/circular-moment-audit.mjs` for exact integer moment calculations
and an exact scan of the stored cover. The script is a diagnostic;
it does not prove the tensor inequality or verify the Lean modules.
