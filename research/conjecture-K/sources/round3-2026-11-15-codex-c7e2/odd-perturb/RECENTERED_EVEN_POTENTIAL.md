<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/odd-perturb/RECENTERED_EVEN_POTENTIAL.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- Intended filepath: codex-c7e2-round3/odd-perturb/RECENTERED_EVEN_POTENTIAL.md -->
# A recentered uniform even-shell potential

Agent: codex-c7e2. 15 November 2026.

Let `Z` be standard proper complex Gaussian, `T=|Z|^2`, and

\[
L=Z(a+bT),\qquad a=699/1250,\quad b=179/1250.
\]

**Theorem.** For every complex `w,A,B`,

\[
\boxed{\quad
\mathbb E_Z\frac{|(T-27/50)A+Z^2\bar B/\sqrt2|^2}{|L+w|}
 \le\frac{11}{10}(|A|^2+|B|^2).
\quad}\tag{1}
\]

The proof is an analytic reduction, an outward-rounded compact
certificate on `0<=|w|<=6`, and an analytic bound for `|w|>=6`.
The potential is finite, including shifts at which the denominator
vanishes at one visible sample.

## 1. The fixed trial is unchanged

For the prescribed fixed trial

\[
X=L+q+(T-2/5)r_A+\frac{15159}{50000}r_B
       +\frac{Z^2\bar r_B}{\sqrt2},
\]

define the arbitrary remote variable and even perturbation

\[
q'=q+\frac7{50}r_A+\frac{15159}{50000}r_B,
\qquad
h=(T-27/50)r_A+\frac{Z^2\bar r_B}{\sqrt2}.
\tag{2}
\]

Then `X=L+q'+h` exactly. The known `32/25` odd-majorant theorem is
valid over every remote base, with arbitrary sharing, so it applies
to `q'`. No claim that `q'` is a pure cubic is needed.

Conditioning on all remote variables in (1) gives

\[
\mathbb E\frac{|h|^2}{|L+q'|}
\le\frac{11}{10}
      (\|r_A\|_2^2+\|r_B\|_2^2).\tag{3}
\]

Thus this replaces the inherited `217/100` potential constant in a
convex-splitting argument by `11/10`, while keeping the actual trial
`X` unchanged. This is a potential estimate, not by itself the complete
odd-over-A/B premise.

## 2. Two real matrix blocks

Rotation reduces the shift to `w>=0`: substitute `Z=e^(i phi)Z'` and
replace `(A,B)` by `(e^(-i phi)A,e^(-i phi)B)`. These transformations
preserve their squared norms.

Set `kappa=27/50`, `z=T-kappa`, `zeta=Z^2/sqrt(2)`.
Reflection in the real axis eliminates mixed real/imaginary coefficient
terms. The two real symmetric potential matrices are

\[
H_\pm(w)=\mathbb E\frac1{|L+w|}
 \begin{pmatrix}
 (T-\kappa)^2 & \pm(T-\kappa)\Re\zeta\\
 \pm(T-\kappa)\Re\zeta & |\zeta|^2
 \end{pmatrix}.
\tag{4}
\]

They have identical eigenvalues. It suffices to prove
`H_+(w)<= (11/10) I_2` uniformly, and the checker verifies both signs.

## 3. Nonsingular compact integral and certificate

Write `x=L+w=r exp(i theta)` and
`ell=x-w=(xi,eta)`. Let `t>=0` be the unique root of

\[
|\ell|^2=t(a+bt)^2,
\qquad D(t)=(a+bt)(a+3bt).
\]

The planar pushforward density of `L` is `exp(-t)/(pi D(t))`.
The image-polar Jacobian cancels the inverse distance. With

\[
\zeta_r=\frac{\xi^2-\eta^2}{\sqrt2(a+bt)^2},
\qquad
\zeta_i=\frac{2\xi\eta}{\sqrt2(a+bt)^2},
\]

the two matrix integrands are

\[
\frac{2e^{-t}}{D(t)}
\begin{pmatrix}
(t-\kappa)^2&\pm(t-\kappa)\zeta_r\\
\pm(t-\kappa)\zeta_r&\zeta_r^2+\zeta_i^2
\end{pmatrix},\tag{5}
\]

integrated over `r>=0` and `u=theta/pi in [0,1]`. The expressions are
smooth, including `r=0` and `ell=0`.

`recenter_potential.cpp` adapts the repository's audited
`potential_integral.cpp`. It retains the directed-rounding interval
arithmetic, interval-accepted inverse root, and second-derivative jets.
The only matrix changes are `kappa=27/50`, removal of the constant
`B` term, and the target `(11/10) I_2`.

The compact shift range `[0,6]` starts with 600 adjacent intervals.
On each source rectangle, tensor midpoint quadrature is enclosed by

\[
\frac{\Delta r^2}{24}\sup|f_{rr}|
+\frac{\Delta u^2}{24}\sup|f_{uu}|.
\]

For the shift parameter, the midpoint source values are evaluated at
both shift endpoints. Their convex hull is enlarged by

\[
\frac{\Delta w^2}{8}\sup|f_{ww}|,\tag{6}
\]

the scalar linear-interpolation remainder. All derivative suprema use
the entire source rectangle and shift interval. Adaptive subdivision
controls the source error; an unresolved shift interval is subdivided.
Every accepted interval passes positive diagonal and determinant tests
for `(11/10)I-H_+` and `(11/10)I-H_-`. This is a continuum certificate,
not a sampled eigenvalue test.

The source integral is truncated at image radius 40. For `w<=6`, an
omitted point has `|L|>=34`, hence `T>35`, since
`sqrt(35)(a+35b)<34`. With

\[
R(t)=(t-\kappa)^2+t^2/2,
\]

Cauchy--Schwarz in `(A,B)` bounds the omitted operator norm by

\[
\frac1{40}\int_{35}^\infty R(t)e^{-t}\,dt
 <3.006\cdot10^{-14}<10^{-10}.\tag{7}
\]

The checker enlarges every matrix entry by `[-10^-10,10^-10]`.
The elementary constants in (7) are checked independently with Arb.

## 4. Every shift beyond six

Suppose `w>=6` and normalize `|A|^2+|B|^2=1`.
Unweighted visible averaging gives

\[
\mathbb E|h|^2\le\alpha:=2-2\kappa+\kappa^2=3029/2500.
\]

On `|L|<=w/2`, the potential contribution is at most
`2alpha/w<=alpha/3`. On the complementary set, `|L|>=3`, which
implies `T>4` because `2(a+4b)<3`.

The pushed-forward density of `|h|^2 1_(T>=4)` is bounded by
`M/pi`, and its mass by `N`, where

\[
M=\frac{e^{-4}R(4)}{D(4)},\qquad
N=e^{-4}\left[\frac32(4^2+8+2)-2\kappa(4+1)+\kappa^2\right].
\]

Indeed `e^(-t)R(t)/D(t)` decreases for `t>=4`: `D` increases and
`R(t)-R'(t)>0` on that range. The standard layer-cake bound for the
planar inverse-distance potential gives an upper bound `2 sqrt(MN)`.
Therefore

\[
\mathbb E\frac{|h|^2}{|L+w|}
\le\frac\alpha3+2\sqrt{MN}
<0.997397<1<\frac{11}{10}.\tag{8}
\]

`verify_recenter_constants.py` checks every scalar inequality and the
monotonicity polynomials with exact rational inputs and 128-bit Arb.

## 5. Replay

The compact verifier uses the copied audited interval engine
`interval_engine.hpp`. Compile with directed-rounding semantics:

```sh
g++ -O2 -std=c++17 -frounding-math -ffp-contract=off -fno-fast-math \
    recenter_potential.cpp -o recenter_potential
./recenter_potential --cover
python verify_recenter_constants.py
```

The verifier rejects `NDEBUG` and fast-math compilation. Its comparisons
remain exact outward interval tests; Newton iteration only proposes
root brackets that are subsequently accepted by interval signs. The
compact log and independent scalar output are the proof receipts.
