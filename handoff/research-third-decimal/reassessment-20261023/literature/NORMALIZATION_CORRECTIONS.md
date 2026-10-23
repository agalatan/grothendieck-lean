# Two normalization corrections for the explanatory material

23 October 2026. These concern explanatory identities, not a finding that the present Lean endpoint is unsound.

## 1. Which tensor-norm identity has Grothendieck constant as its norm

The identity from the injective to the projective tensor norm on \(\ell_\infty\otimes\ell_\infty\) is not uniformly bounded by \(K_G\). The correct identity is from the Hilbert factorization norm \(\gamma_2\) to the projective norm \(\pi\):

\[
 K_G^{\mathbb C}=
 \sup_{m,n}\sup_{0\ne t\in\ell_\infty^m\otimes\ell_\infty^n}
 \frac{\|t\|_\pi}{\gamma_2(t)},
 \qquad
 \gamma_2(t)=\inf_{t_{ij}=\langle x_i,y_j\rangle}
       \max_i\|x_i\|\max_j\|y_j\|.
\]

Dually, on \(\ell_1^m\otimes\ell_1^n\),

\[
 K_G^{\mathbb C}=\sup_{m,n}\sup_{t\ne0}
 \frac{\gamma_2^*(t)}{\|t\|_\varepsilon},
\]

where the numerator is the Hilbert-vector bilinear optimum and the denominator the scalar-phase bilinear optimum. These are Pisier's equations (3.8)–(3.12); his notation for \(\gamma_2\) is the Hilbertian tensor norm \(H\).

An explicit obstruction to the incorrect \(\pi/\varepsilon\) assertion is a Sylvester Hadamard matrix \(H_n\), \(n=2^r\). As an \(\ell_\infty\otimes\ell_\infty\) tensor it has \(\varepsilon(H_n)=\max|H_{ij}|=1\). The bilinear form with coefficients \(H_n/n^{3/2}\) has norm at most one on \(\ell_\infty^n\times\ell_\infty^n\), since \(\|H_n\|_{2\to2}=\sqrt n\) and both phase vectors have Euclidean norm \(\sqrt n\). Projective duality gives

\[
 \pi(H_n)\ge \sum_{ij}H_{ij}^2/n^{3/2}=\sqrt n.
\]

Thus \(\pi/\varepsilon\) is unbounded, over real or complex scalars.

## 2. The maximum identity is real; its averaged complex version

The identity \(|a+b|+|a-b|=2\max(|a|,|b|)\) holds for real \(a,b\), and fails for complex scalars: \(a=1,b=i\) gives \(2\sqrt2\) on the left and 2 on the right.

For complex \(a,b\), the exact replacement is

\[
 |a+b|+|a-b|
 =\pi\,\mathbb E_\theta\max\bigl(
 |\Re(e^{i\theta}a)|,|\Re(e^{i\theta}b)|\bigr),
 \qquad\theta\sim\operatorname{Unif}[0,2\pi].
\]

Apply the real identity to the two real parts and use
\(\mathbb E_\theta|\Re(e^{i\theta}w)|=(2/\pi)|w|\).
For integrable jointly circular random variables \((A,B)\), simultaneous phase rotation preserves their joint law, so

\[
 \mathbb E(|A+B|+|A-B|)
 =\pi\,\mathbb E\max(|\Re A|,|\Re B|).
\]

The joint circularity hypothesis is needed to remove the phase average on the right. Individual circular marginals alone do not ensure it.
