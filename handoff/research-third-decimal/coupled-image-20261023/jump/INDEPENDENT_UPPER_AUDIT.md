# Independent audit: exactification and neutral factor removal

23 October 2026. Audited the strengthened Section 1 of
`../preprocess/PREPROCESSING_INVERSE_OBSTRUCTION.md` independently of its author.
This closes a restricted architecture; it does not improve a global endpoint.

## Formal Wiener argument

The argument is sound for finite products

`C=phi(p) product_j [1+A_j(1-R_j)]^(-1)`,

where all coefficients are real, p is odd with Wiener norm at most one,
R_j is even, `R_j(0)=0`, `||R_j||<=1`, and `A_j>=0`.

If `D(C)>=c>0`, its linear coefficient is positive. The coefficient-majorant
iteration for `r=C^(-1)(ct)` has a nonnegative coefficient majorant of total
mass at most one. Every fixed coefficient stabilizes after finitely many
formal iterations, so passage to the limit yields `||r||<=1` even at the
boundary value c=D(C). Absolute Wiener composition is therefore legitimate;
no derivative contraction or analytic inverse-radius assumption is needed.

Compose every channel with r. Products, parity and zero constant terms are
preserved; the complete kernel becomes exactly ct. Removing one resolvent
leaves

`B=ct(1+A)-cAt(R composed with r)`.

Its slope is `c(1+A)` and its tail norm is at most cA, so D(B)>=c. B still
belongs to the same class with one fewer factor. Repeat exactification at
the same c and removal. This gives a phase-only kernel with score at least
c. Conversely the class contains phase-only kernels, so the two suprema are
equal. This statement does not require the supremum to be attained.

The signs of R's coefficients do not affect this proof. Each resolvent
belongs to the Wiener algebra by its normalized geometric series, since
`A/(1+A)<1`. Its norm is at most one even when `||R||=1`.

For neutral Gaussian factors, the Banach-algebra limit

`[1+(s/N)(1-R)]^(-N) -> exp[-s(1-R)]`

holds in Wiener norm; for example apply the convergent logarithm series for
large N using `||s(1-R)||<=2s`. The residual score is 1-Lipschitz in that norm,
so the ceiling passes to the limit. Finite products of these factors are
covered. Any further countable-product claim needs its own convergence
condition; the audited statement avoids that gap.

## Full complex realization

A real odd scalar contraction p lifts to the charge-one radial correlation

`p_phys(rho)=sum_k p_k rho |rho|^(2k)`.

A real even neutral correlation R lifts radially as

`R_phys(rho)=sum_k R_k |rho|^(2k)`.

Precomposition with a real odd r agrees on the real axis with ordinary
composition p(r(t)) and R(r(t)), including when r(t)<0. The odd/even powers
supply the required signs. The resulting radial complex kernel is determined
by its ordinary odd real series, so exactification to ct on the real axis
means the physical kernel is c rho.

For an independent proper complex quadratic auxiliary with scalar
preprocessor q, the determinant factor depends on `|q_phys(rho)|^2`; on the
real axis this is q(t)^2. Thus the actual Hermitian quadratic family is in
the audited class. A Hermitian block can be diagonalized only within a set
of coordinates sharing the same covariance preprocessor. The exclusion of
off-diagonal Hermitian interactions across differently preprocessed blocks
is necessary and is stated correctly in the author's note.

The argument does not remove a factor from a convex mixture of separately
preprocessed kernels. Such mixtures, arbitrary coupled responses, and the
existing coupled charged grade-one/grade-three master response remain
outside the theorem.

## Numerical certificate replay

Independently replayed at 192 bits:

```
uv run --with python-flint==0.9.0 python tools/coupled_preprocess_inverse.py \
  --bits 192 \
  --output handoff/research-third-decimal/coupled-image-20261023/jump/independent-upper-inverse-192.json
```

Exact rational inverse-composition and polynomial-decomposition checks pass.
The degree-seven prefix brackets its score threshold between
0.711900642945 and 0.711900642946. At the rational incumbent lower comparison
0.711947, the certified absolute inverse prefix is greater than
1.0000774337545. Thus the whole audited class has a strict score ceiling
below 0.711900642946, including separate nonlinear scalar channel
preprocessors and the stated neutral Gaussian limits.

## Stronger finite-price theorem, including mixtures

Subsequently audited and replayed the stronger exact certificate
`tools/coupled_preprocess_mixture_certificate.py`:

```
python3 -I tools/coupled_preprocess_mixture_certificate.py \
  --output handoff/research-third-decimal/coupled-image-20261023/jump/independent-mixture-replay.json
```

It certifies the full score ceiling 0.711916311229983 using 67 exact rational
Bernstein leaves, maximum subdivision depth nine. This ceiling is weaker
numerically than the resolvent-factor-removal ceiling but covers a much
larger separable class, including convex mixtures and general two-map neutral
multipliers.

The precise abstract class is `C=phi(p)K`, where p is a **real** odd Wiener
contraction and K is any **complex** even Wiener contraction. The finite
price has lambda1=1 and

`(lambda3,lambda5,lambda7)=(-606121006,-272015495,-762296131)/10^9`.

The phase-only price is bounded in absolute value by `(pi/4)*0.90644`.
The rational polynomial in the four relevant coefficients of p has the
correct degree-seven expansion. For fixed coefficients a,b, it is affine in
c,d; the maximum over their remaining l1 budget lies at a signed c or d
vertex. The 16 signed patches cover all those possibilities. Their exact
power-to-Bernstein transform and midpoint de Casteljau subdivisions are
correct. Global p->-p symmetry supplies the absolute price bound.

Write `K=k0+E`, where E has minimum degree two. A tail price can then see only
the first three phase powers:

`||head5 phi(p)||_W <= (pi/4)(1+1/8+3/64)=75pi/256`.

Therefore

`|L_lambda(phi(p)E)| <= (75pi/256) max(|lambda3|,|lambda5|,|lambda7|) ||E||_W`.

The normalized tail constant is strictly less than 0.90644. Since
`|k0|+||E||<=1`, the same phase-only ceiling bounds every C, and then every
finite or countable convex mixture. Countable mixtures converge absolutely
in Wiener norm because every component has norm at most one. The full
residual score is bounded by the absolute finite price; no coefficient-tail
assumption is being made.

For the physical corollary, independent auxiliary Gaussian coordinates give
Hermite cross coefficients with sum of absolute values at most one by
Cauchy-Schwarz. Each neutral nonconstant cross monomial is even, has minimum
degree at least two, and remains a Wiener contraction under separate real
scalar preprocessors. This proves the required K property.

**Charge qualification:** global sign-evenness of an ordinary complex
auxiliary function alone does not make it neutral. For example,
`phase(V)^2` is even but has charge two. Rotation-invariant auxiliary
multipliers are neutral and valid directly; arbitrary functions of genuine
neutral grade-two real Gaussian drivers are also valid. Alternatively,
project ordinary auxiliary response factors individually onto charge zero,
which preserves the disk bound and exactly retains the full response's
charge-one kernel component. Off-charge coefficients cannot improve the
full residual score. This qualification prevents interpreting an abstract
real-axis even-kernel bound as an unsupported physical charge-one claim.

The cross-coordinate Gaussian covariance must also be diagonal in the
independent channel basis used for the Hermite monomials. The theorem does
not automatically cover arbitrary noncommuting matrix-valued channel
preprocessors or auxiliary factors depending jointly on the charged
coordinate modulus.

## Analytic audit of the complex charged-preprocessor extension

For complex p, the physical phase composition on the real axis is not the
holomorphic ordinary series phi(p). It is

`Psi(p)= (pi/4)[p+p²conj(p)/8+3p³conj(p)²/64+25p⁴conj(p)³/1024+...]`,

where conjugation acts on coefficients at real t. This distinction is
necessary. The same finite price nevertheless admits an analytic reduction
to the already certified real coefficient case.

Multiply p by a constant phase so its linear coefficient is `a>=0`; the
absolute price is unchanged. Write its cubic coefficient as `b=x+iy`,
`r=|b|`, and let s3,s5,m be the positive absolute price multipliers. The
normalized price before fifth/seventh preprocessor coefficients is

`L0=A-Bx-q(3x²+y²)-iy(C+2qx)`,

with

`q=ma/8`,
`A=a-s3*a³/8-3s5*a⁵/64-25m*a⁷/1024`,
`B=s3+3s5*a²/8+15m*a⁴/64`,
`C=s3+s5*a²/8+3m*a⁴/64`.

This expansion was independently re-derived from the physical phase powers.
The real-linear map on the fifth coefficient has norm
`s5+3ma²/8<m`; the seventh map has norm m. Their remaining budget therefore
costs at most `m(1-a-r)` in the absolute price.

Put `T=A+Br-3qr²`. Direct expansion using `y²=r²-x²` yields

`T²-|L0|²=(r+x)G`,

`G=2B(A-3qr²)+(r-x)[B²-C²-4Aq+4q(B-C)x+8q²r²]`.

Let

`cA=1-s3/8-3s5/64-25m/1024`, `d=s5/4+3m/16`.

On `a,r>=0`, `a+r<=1`, one has `cA*a<=A<=a`, `B>=s3`,
`0<=B-C<=d*a²`, and `ar<=1/4`. Dropping positive terms in G, the only
negative contributions are bounded by `ma²r+md*a³r²`. It follows that

`G>=a[2s3(cA-3m/8)-m/4-md/16]`.

Independent exact fraction evaluation gives

`cA-3m/8=621580649893/1024000000000>0`,

`2s3(cA-3m/8)-m/4-md/16`
` =34254220103996142329/64000000000000000000>0`.

Also `T>=a(cA-3m/8)+Br>=0`. Thus `|L0|<=T`, including the boundary cases
where a or r vanishes. Adding the remaining coefficient allowance is exactly
the real finite price at preprocessor coefficients

`(a,-r,0,-(1-a-r))`.

The real Bernstein certificate bounds that price. Consequently the analytic
reduction supports the same absolute price ceiling for arbitrary complex
charged Wiener preprocessors under the **physical** phase composition.
The tail-five bound still follows from absolute Wiener submultiplicativity,
so the even K and convex-mixture extensions persist. This section records
an independent analytic derivation; the implementing agent's exact rational
factorization replay should also pass before the extension is advertised
as a completed machine-checked certificate.

That replay subsequently passed, including the generic physical coefficient
expansion and the full real Bernstein certificate. The root also replayed
both it and the independent `coupled_jump_complex_price_check.py`; ledgers
are supplied alongside this note. This is an externally checked paper
certificate, not a Lean formalization.
