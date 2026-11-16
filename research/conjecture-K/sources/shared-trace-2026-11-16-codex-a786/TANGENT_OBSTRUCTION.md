<!-- Verbatim from the delivery content_law_shared_trace_and_phase_obstruction_20261116.zip (TANGENT_OBSTRUCTION.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# A quantitative obstruction to tangent controls

**P.** The obstruction concerns one precise proof architecture, not the requested inequality. It shows why arbitrarily high-degree tangent-divergence controls cannot replace cancellation between different sign branches. It does not rule out profile-dependent estimates that use additional properties of \(k'\).

## 1. The architecture

Let
\[
P=P_m=\frac{\sum_{\ell=1}^m|Y_\ell|^2-m}{\sqrt m},\quad
q=XP,\quad S=|X|^2,\quad C=1+P/\sqrt m.
\]
Here \(X,Y\) are independent standard complex Gaussians, \(m\ge1\) is any integer, \(u=1\), and
\[
\delta=4+12/m.
\tag{1}
\]
The signed-pairing packet, PROOFS §§2–3 (specializing ledger **6.3.23**), gives
\[
c[h]=\langle Z,qk'(|q|^2)\rangle,\qquad
Z=X(2SC-1),\qquad \langle Z,q\rangle=4/\sqrt m.
\tag{2}
\]
Our inner product is \(\langle A,B\rangle=\mathbb E[\overline A B]\). These formulas are also checked directly by conditioning on \(P,S\).

For clarity, in the notation of 6.3.23 the two derivative fields here are \(a=X^2C\) and \(c_2=SC\). Substitution gives
\(\overline X(\overline q\,a+q(c_2-1))=\overline Zq\),
which proves the pairing in (2) with exactly that ledger normalization. Also \(\mathbb EP^3=2/\sqrt m\), \(\mathbb EP^4=3+6/m\), giving (1) and \(\langle Z,q\rangle=4/\sqrt m\).

Let \(\mathcal T\) be the complex \(L^2\) closure of Gaussian divergences \(\delta_\gamma v\), where \(v\) is a smooth polynomial-growth real or complexified vector field tangent to both real coordinates of \(q\):
\[
D_vq=D_v\overline q=0.
\tag{3}
\]
Multiplying such a vector field by a smooth polynomial-growth scalar is allowed. The divergence convention is the adjoint of the gradient for the real Gaussian measure; changing its sign does not change \(\mathcal T\). Polynomial tangent fields, of every degree, are included. Integration by parts shows \(N\in\mathcal T\) is orthogonal to every square-integrable function of \(q\) for which the pairing is defined.

Consequently \(Z\) may be replaced by \(R=Z+N\) in (2). The standard law-norm Cauchy–Schwarz certificate then produces
\[
\theta(R)=\frac{2}{3\delta}
 \bigl(\|R\|_2^2+|\langle R,q\rangle|^2\bigr),
\tag{4}
\]
because
\(\widehat\Omega=(3/2)(\|qk'\|_2^2-\frac12|\langle q,qk'\rangle|^2)\).

## 2. Lower bound independent of the number or degree of controls

**Theorem 2 (P).** Every \(N\in\mathcal T\) satisfies
\[
\boxed{\quad
\theta(Z+N)\ge
\frac{32/m+9\mu_m^2/(1-\beta_m^2)}{6+18/m}
\ge\frac6{e^2}>\frac45,
\quad}
\tag{5}
\]
where \(\mu_m=\mathbb E|P_m|\) and \(\beta_m=\mathbb E[P_m|P_m|]\).
In particular this architecture cannot reach either \(0.37\) or \(0.64\) on any of these cubics.

**Proof.** The key extra invariant is
\[
F=X|P|=q\,\operatorname{sign}P.
\tag{6}
\]
It is not a function of \(q\), but it is constant along the vector fields (3). In the weak derivative sense, and almost everywhere,
\[
D_vF=|P|D_vX+X\operatorname{sign}(P)D_vP
 =\operatorname{sign}(P)D_vq=0.
\]
The absolute value is locally Lipschitz, so there is no delta mass in this first derivative. All factors and derivatives have finite moments. Gaussian integration by parts therefore gives \(\langle N,F\rangle=0\), first for the generating divergences and then for their \(L^2\) closure. Similarly \(\langle N,q\rangle=0\).

We have \(\|q\|_2=\|F\|_2=1\) and \(\langle q,F\rangle=\beta_m\). Both signs of \(P_m\) have positive probability, so \(|\beta_m|<1\). Set \(F_0=F-\beta_m q\). It is orthogonal to \(q\), with squared norm \(1-\beta_m^2\).

Using \(\mathbb ES=1,\ \mathbb ES^2=2\),
\[
\langle Z,F\rangle
 =4\mathbb E[C|P|]-\mathbb E|P|
 =3\mu_m+\frac4{\sqrt m}\beta_m.
\]
It follows from (2) that
\(\langle Z+N,F_0\rangle=3\mu_m\) and
\(\langle Z+N,q\rangle=4/\sqrt m\).
Bessel in the two orthogonal directions \(q,F_0\) gives
\[
\|Z+N\|_2^2+|\langle Z+N,q\rangle|^2
 \ge \frac{32}{m}+\frac{9\mu_m^2}{1-\beta_m^2}.
\tag{7}
\]
Equation (4) now proves the first inequality in (5).

Integrating the centered gamma density on the positive side gives the exact formula
\[
\mu_m=\frac{2m^{m-1/2}e^{-m}}{(m-1)!}.
\tag{8}
\]
Indeed the two absolute-deviation contributions are equal, and
\(\int_m^\infty(s-m)s^{m-1}e^{-s}ds=m^me^{-m}\).
Moreover
\[
\frac{\mu_{m+1}}{\mu_m}
 =e^{-1}(1+1/m)^{m+1/2}>1.
\tag{9}
\]
For \(x>0\), \(\log(1+x)>2x/(2+x)\): the derivative of their difference is \(x^2/((1+x)(2+x)^2)>0\), and the difference is zero at 0. Use \(x=1/m\) in (9). Thus \(\mu_m\ge\mu_1=2/e\).

Discarding the denominator improvement in (7) gives
\[
\theta(Z+N)\ge\frac{32/m+36/e^2}{6+18/m}\ge\frac6{e^2};
\]
the second comparison follows from \(32-108/e^2>0\), since \(e>2\). Finally \(e<68/25\), by the exponential series through order 5 and its geometric tail, implies \(e^2<15/2\) and hence \(6/e^2>4/5\). All numerical comparisons are exact rational checks. ∎

The signs in (6) label distinct components of nonzero fibers of \(q=XP\). In fact if \(q=w\ne0\), then \(X=w/P\), and \(P\) cannot change sign continuously along the fiber. This explains the extra invariant without using a general theorem about fiber topology.

## 3. What repairs the obstruction

**P (interpretation of the prior reflection construction).** In the reduced coordinates \((X,P)\), the involution
\[
\mathcal I(X,p)=(-X,-p)
\tag{10}
\]
preserves \(q=Xp\) and interchanges its two sign branches where both are in the support. It is not generated by tangent flows on a nonzero fiber.

Extend the gamma density \(p_m\) by zero outside its support \((-\sqrt m,\infty)\). The weighted averaging operator
\[
(\mathcal R G)(x,p)=
\frac{p_m(p)G(x,p)+p_m(-p)G(-x,-p)}
 {p_m(p)+p_m(-p)}
\tag{11}
\]
is the conditional expectation onto the sigma-field of the unordered pair
\(\{(x,p),(-x,-p)\}\). The Gaussian \(X\) density is unchanged by \(x\mapsto-x\); pairing the two points proves (11) and its \(L^2\) contraction. Since \(q\) is measurable in that sigma-field, \(\langle G-\mathcal RG,\psi(q)\rangle=0\).

For the pairing field in (2),
\[
\mathcal RZ=X\left[(2S-1)g_m(P)+\frac{2SP}{\sqrt m}\right],
\qquad
g_m(p)=\frac{p_m(p)-p_m(-p)}{p_m(p)+p_m(-p)}.
\tag{12}
\]
This is exactly the type of phase-conditioned quantity bounded by the earlier reflected-Gamma results. It is included to explain how they escape (5), not claimed as a new reflection theorem.

For example, the input signed-pairing packet proves \(\theta=7/20\) for every \(m\ge22\), for every continuous polynomial-growth profile. Our earlier independent-block packet proves a slightly weaker all-block constant below \(37/100\) for \(m\ge23\). Those facts are compatible with (5): their cancellation uses (11), which is outside the tangent-divergence closure.

## 4. Scope of the obstruction

- It rules out increasing the polynomial degree or the number of tangent controls and then applying the same unrestricted law-norm Cauchy–Schwarz step.
- It does not rule out an exact conditional expectation over all fibers, nonlocal sign changes, a different starting representative already incorporating those changes, or a profile-specific estimate on \(k'\).
- The bound \(4/5\) is a lower bound on the coefficient produced by (4), not a lower bound on \(\|c[h]\|^2/(\delta\widehat\Omega[h])\).
- The connected-fiber classification for general complex cubic tensors, and a quantitative replacement for (11) there, remain **open**.
