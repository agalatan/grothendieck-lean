# Gaussian Hilbert Spaces: usable tools and quantifier warnings

23 October 2026. Source: the user's ZIP of Svante Janson, *Gaussian Hilbert Spaces* (1997), 352 scanned page images. All scans were OCRed; the following are targeted theorem readings, not a claim that the entire book was deeply read. OCR is unreliable for inequalities and conjugations; the complex hypercontractivity criterion on printed page 68 was visually verified.

## Standard complex Gaussian normalization

Pages 12–14 distinguish a general centered complex Gaussian from a circular (“symmetric”) one. The standard circular normalization used in the project is \(\mathbb E|Z|^2=1\), hence \(\operatorname{Var}\Re Z=\operatorname{Var}\Im Z=1/2\), and \(\mathbb EZ^2=0\). A covariance alone determines a jointly proper family only together with its vanishing relation matrix. Real covariance and complex covariance factors must not be mixed.

## Conditional expectation is second quantization of an actual Gaussian projection

Theorems 4.9 and 9.3 identify \(\mathbb E[X\mid\mathcal F(K)]\) with \(\Gamma(P_K)X\), where \(K\) is a closed Gaussian linear subspace. Corollary 9.4 retains precisely Wick monomials whose Gaussian inputs lie in that subspace. The result is exact and dimension-free.

For \(q\in\mathcal H_{2,1}\), conditioning on a complex Gaussian input subspace projects all three tensor legs to that subspace. It does not replace the discarded mixed terms by fresh independent Gaussians. Orthogonal *linear Gaussian subspaces* are independent; orthogonal cubic random variables need not be independent. For example \(X\) and \((|X|^2-2)X\) are orthogonal in \(L^2\) but are functions of the same complex Gaussian and are not independent.

Theorems 4.10–4.12 realize real Gaussian contractions as conditional expectations after embedding in a larger Gaussian space. This is a legitimate construction of a coupling, not a zero-cost replacement theorem for a fixed non-Gaussian cubic response.

## Two distinct meanings of complex rotation

Physical input rotation \(z\mapsto e^{i\theta}z\) acts on \(\mathcal H_{p,q}\) with eigenvalue \(e^{i(p-q)\theta}\). On all charge-one components its eigenvalue is therefore the same \(e^{i\theta}\).

Analytic Mehler continuation \(\Gamma(iI)\), where the underlying real Gaussian Hilbert space has been complexified, acts on total Hermite order \(p+q\) with eigenvalue \(i^{p+q}\). On \((p,q)=(k+1,k)\), this is \(i(-1)^k\). Thus

\[
 \sum_{k\ge0}(-1)^kP_{k+1,k}=-i\,\Gamma(iI)\Pi_{\rm charge\,1}.
\]

This is not the physical rotation \(f(z)\mapsto f(iz)\). The latter is a positive-measure change of variables; the former is a Fourier–Wiener operator. Treating them as the same map would falsely make the alternating multiplier a harmless phase rotation.

## Complex hypercontractivity has a precise quadratic condition

Janson, Remark 5.26, printed page 68, states the sharp criterion for \(1\le p\le q<\infty\):

\[
 \|A\zeta\|^2+(q-2)\|\Re(A\zeta)\|^2
 \le \|\zeta\|^2+(p-2)\|\Re\zeta\|^2
 \quad\hbox{for every }\zeta
\]

implies \(\|\Gamma(A)\|_{L^p\to L^q}=1\), while failure implies unboundedness. For scalar \(A=zI\), it suffices to test every scalar \(w\in\mathbb C\) in the same quadratic inequality. The norm bound \(\|A\|\le1\) by itself is insufficient for general complexified operators on \(L^p\); the book warns about this already in Remark 4.14.

For \(A=iI\) and \(p=q\), the inequality compares \((\Re w)^2+(p-1)(\Im w)^2\) with \((p-1)(\Re w)^2+(\Im w)^2\), so it holds for all \(w\) only when \(p=2\). Complex hypercontractivity therefore does not give the desired sharp \(L^\infty\to L^1\) alternating-operator cap. The elementary \(L^2\) bound gives one, consistent with the repository's explicit norm-one construction.

## Vector-valued operator extension: direction of exponents matters

Chapter 12, especially Theorems 12.1–12.2 and 12.8, distinguishes \(p\le q\) from \(p>q\). In the former direction a Hilbert-valued extension retains the scalar norm. In the latter, the extension costs a Grothendieck factor in general; in particular \(p=\infty,q=1\) is exactly the difficult regime. This prevents proving a Grothendieck improvement by silently applying the norm-one vector extension from the opposite exponent direction.

The chapter's displayed value \(\pi/(2\log(1+\sqrt2))\) is the historical real Krivine bound, not a current exact constant. Its complex application is an existence bound; the text itself points to Haagerup for the stronger complex result.

## What was not obtained

The book supplies Wick products, Fock representations, finite-chaos integrability, conditional expectations and hypercontractivity. None of the inspected results proves the needed sharp complex cubic \(L^1/L^2\) upper bound, a dimension-free core/Gaussian-factor alternative, or a replacement-error estimate within the present central response budget. These remain research obligations.
