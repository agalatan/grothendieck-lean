# Finite-order consequences of a Gaussian operator-norm certificate

Let \(K_G^{\mathbb C}(n)\) use vector Hilbert space \(\mathbb C^n\), with
arbitrary finite matrix sizes. Let \(\gamma_n\) be the probability measure
\(\pi^{-n}e^{-\|z\|^2}\,dz\), and let \(P=P_{1,0}\), \(Q=P_{2,1}\) be its
complex Hermite orthogonal projections. Set
\(T_n=P-\varepsilon Q\), \(\varepsilon=37/50\).

**Conditional theorem.** If
\(\|T_n\|_{L^\infty(\gamma_n)\to L^1(\gamma_n)}\le N\), where \(N>0\), then
\[
\boxed{
K_G^{\mathbb C}(n)\ge\frac{\pi n\binom{2n}{n}^2}{16^nN}
\left(1-\frac{\varepsilon}{4(n+1)}\right).
}
\]
Only the norm bound in this same Gaussian dimension is needed. A uniform
certificate supplies it for every \(n\). The accompanying program accepts
\(N\) as an explicit analytic input; it does not prove that input.

## Projection computation without an equivariant-uniqueness assumption

For \(Z\sim\gamma_n\), write \(R=\|Z\|\), \(S=R^2\), and
\(F_j(Z)=Z_j/R\). Assign any unit vector to \(F(0)\); the point0 is null.
Then \(\sum_{j=1}^n|F_j(z)|^2=1\) almost everywhere. Put
\[
a_n=\frac{\mathbb ER}{n}=\frac{\Gamma(n+1/2)}{n\Gamma(n)}.
\]
The radius and direction \(\Theta=Z/R\) are independent, \(S\) has gamma
shape\(n\) and scale1, and spherical second/fourth moments are
\[
\mathbb E\Theta_j\bar\Theta_a=\delta_{ja}/n,\qquad
\mathbb E\Theta_j\Theta_c\bar\Theta_a\bar\Theta_b
 =\frac{\delta_{ja}\delta_{cb}+\delta_{jb}\delta_{ca}}{n(n+1)}.
\]
These identities also follow by dividing ordinary complex Gaussian moments
by \(\mathbb ER^2=n\) and \(\mathbb ER^4=n(n+1)\).
In particular, \(PF_j=a_n z_j\).

For an explicit check of the cubic projection, use the Wick monomials
\[
W_{ab,c}=z_az_b\bar z_c-\delta_{ac}z_b-\delta_{bc}z_a.
\]
They span \(\mathcal H_{2,1}\); repeated indices are allowed. Put
\(V_j=z_j(S-n-1)=\sum_kW_{jk,k}\), so \(V_j\in\mathcal H_{2,1}\).
Using \(\mathbb ER^3=(n+1/2)\mathbb ER\), the moment identities give
\[
\langle F_j,W_{ab,c}\rangle
 =-\frac{a_n}{2(n+1)}
  (\delta_{ja}\delta_{cb}+\delta_{jb}\delta_{ca}).
\]
Likewise, \(\mathbb ES^3=n(n+1)(n+2)\) gives
\[
\langle V_j,W_{ab,c}\rangle
 =\delta_{ja}\delta_{cb}+\delta_{jb}\delta_{ca}.
\]
Here \(\langle f,g\rangle=\mathbb E[f\bar g]\), linear in its first argument.
Equality of these pairings on a spanning family proves
\[
QF_j=-\frac{a_n}{2(n+1)}z_j(S-n-1).
\]
No claim that equivariance alone proves uniqueness is needed.
Finally,
\[
\|V_j\|_2^2=\frac1n\mathbb E[S(S-n-1)^2]=n+1,
\]
so orthogonality and selfadjointness yield
\[
\begin{aligned}
\sum_j\langle T_nF_j,F_j\rangle
&=na_n^2-\varepsilon\frac{na_n^2}{4(n+1)}\\
&=\frac{\Gamma(n+1/2)^2}{n\Gamma(n)^2}
 \left(1-\frac{\varepsilon}{4(n+1)}\right).
\end{aligned}
\]
For integer\(n\ge1\), the half-integer gamma identity gives
\[
\frac{\Gamma(n+1/2)^2}{n\Gamma(n)^2}
 =\frac{\pi n\binom{2n}{n}^2}{16^n}.
\]
This proves the numerator used by the program. These are mathematical
arguments, not claims of a Lean implementation of Gaussian projections.

## Passage to finite matrices preserves vector dimension

Both projections have finite rank, hence \(T_n\) has an integral kernel
\(H(z,w)\), a finite sum of products of Gaussian-integrable polynomials.
In particular \(H\in L^2(\gamma_n\otimes\gamma_n)\subset L^1\).

Approximate \(F\) in \(L^2(\gamma_n;\mathbb C^n)\) by finite measurable step
functions whose values are **unit vectors in the same space**\(\mathbb C^n\).
Such approximations follow by finite sphere quantization; no extra coordinate
is needed for norm padding. Boundedness of \(T_n\) on \(L^2\) shows that their
vector pairings converge to the displayed numerator.

For the finite partitions used on each side, define the matrix entries by
integrating \(H\) over each product of partition cells. Its scalar unit-phase
norm is at most\(N\): a choice of scalar phases on cells is a measurable
unimodular step function, to which the operator-norm hypothesis applies.
Its vector value in dimension\(n\) is at least the pairing of the selected
unit-vector step functions. Applying the definition of\(K_G^{\mathbb C}(n)\)
and taking the approximation limit proves the theorem. Equivalently, every
strict rational number below the theorem's ratio is witnessed by some finite
matrix. No explicit matrix, matrix size, or algorithm for locating a minimal
witness is asserted here.

## Exact arithmetic and pi enclosure

`certify_finite_dimension.py` uses only Python's standard library and exact
integer/Fraction arithmetic. Its default pi enclosure uses60 alternating
terms for each arctangent in
\[
\pi=16\arctan(1/5)-4\arctan(1/239).
\]
For \(k>1\), truncating
\(\sum_{j\ge0}(-1)^j/[(2j+1)k^{2j+1}]\) places the true value strictly between
the partial sum and the partial sum plus the first omitted term. The code uses
the signs correctly when subtracting the second arctangent.
For the identity itself,
\((5+i)^4(239-i)=114244(1+i)\); its argument lies between0 and\(\pi/2\),
since \(0<4\arctan(1/5)-\arctan(1/239)<4\arctan(1/5)<\pi/2\).
The last inequality follows from\(1/5<\tan(\pi/8)=\sqrt2-1\).
Thus this argument is\(\pi/4\), proving Machin's identity with its branch fixed.

The resulting rational\(\pi_{\rm lo}\) is strictly less than\(\pi\).
The script computes\(\pi_{\rm lo}\) times the positive rational factor, divided
by the supplied\(N\), then rounds downward to the requested decimal precision.
This produces a strict lower bound even if the rational downward rounding is
an equality. Floating-point gamma functions, NumPy, and heuristic rounding are
not used. Python is not a proof assistant: the series and projection arguments
above remain mathematical inputs, and there is no claim of Lean verification.

## Usage

From this directory, with the presently certified norm cap:

```sh
python certify_finite_dimension.py --norm-cap 7138283181/10000000000
```

For a newly certified cap, pass its exact rational numerator/denominator or
terminating decimal, optionally choosing dimensions and saving JSON:

```sh
python certify_finite_dimension.py --norm-cap NUMERATOR/DENOMINATOR \
  --dimensions 10 100 1000 2000 10000 --places 12 --output result.json
```

The program intentionally reports `PASS_CONDITIONAL`: its positive input norm
cap is accepted as an assumption and must be supported by the separate lower
certificate. It writes only the optional explicit output path. Python `-O`
and `-OO` are rejected because assertions are computational proof gates.
