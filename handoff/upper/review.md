# Review of the other instance's work and a combined improvement

8 October 2026. This is a mathematical audit and a further local certificate,
not external peer review or a claim of publication priority.

The supplied package is useful. Its stated upper bound is reproducible:

\[
K_G^{\mathbb C}<1.404898359351155.
\]

Combining its first-order energy and scalar-tail improvements with our joint
endpoint cancellation and previously certified rational preprocessor gives

\[
\boxed{K_G^{\mathbb C}<1.404898359045958.}
\]

The internal endpoint is
\(1.404898359045957010149930741541382\ldots\).
Together with the separately verified lower certificate from our previous
work, the current interval is

\[
\boxed{1.400813971<K_G^{\mathbb C}<1.404898359045958.}
\]

The numerical gain over the supplied upper endpoint is only
\(3.05197\times10^{-10}\). The valuable input is the change in the energy
used to control the tail, and the exact information about which searches
have already reached their optimum.

## What was checked

The uploaded archive's 22 listed file hashes agree with its manifest. That
checks file identity, not mathematical correctness. The substantive checks
were as follows:

- Read the analytic argument and the computational implementations.
- Reproduce the finite coefficient and tail assembly with the supplied table.
- Reproduce the same assembly with our independently generated coefficient
  table, so the headline bound does not depend on trusting the supplied
  table's differing endpoints.
- Run the supplied JavaScript BigInt primal/dual checker and a separate
  Python Fraction implementation.
- Independently recalculate the two first-order Dirichlet energies and a
  new joint first-order energy with directed Arb integration.
- Reassemble the combined coefficient certificate, including the complete
  degree-57,240 rational-preprocessor composition.

The two extended coefficient tables contain 480 real-component enclosures.
All overlap, and 457 have identical endpoints. Overlap alone does not prove
either table correct. Our second assembly instead uses the table whose
quadrature generation was already checked in this workspace. It gives

\[
1.40489835935115478717705880717862431\ldots,
\]

versus the supplied table's
\(1.40489835935115478717705536653209293\ldots\).
Both imply the same advertised strict upper bound.

The fixed-model exact optimum and all signed-mixture dual inequalities pass.
The five active zero coefficient indices are \(1,3,4,5,7\).

## The main useful idea: a different energy

Let \(f\) be one radial phase amplitude and put
\(R_f(z)=\operatorname{phase}(z)[f(|z|^2)-f(0)]\).
The Gaussian number operator has eigenvalues \(\lambda_n=2n+1\) on the
charge-one radial basis. If \(r_n\) are the coefficients of \(R_f\), then

\[
\sum_n\lambda_n|r_n|^2
=\int_0^\infty e^{-s}
 \left(2s|f'(s)|^2+\frac{|f(s)-f(0)|^2}{2s}\right)\,ds.
\]

The identity follows from the Gaussian Dirichlet form; its constants also
follow directly from polar coordinates. The subtraction at zero makes the
singular-looking term integrable. The finite integration interval and both
omitted ends have explicit bounds.

The earlier argument used \(\sum_n\lambda_n^2|r_n|^2\). A stronger spectral
weight does not automatically give a sharper tail estimate: after subtracting
the known coefficients, the remaining energy and the dual weight both matter.
For these data, the first-order choice is better.

The supplied first-order calculation gives a sixth-kernel tail less than
\(0.000063783907834237878\), compared with our previous joint second-order
bound of about \(0.000073549010646924\).

## How the two approaches combine

Let \(U,V\) be the two radial phase functions, \(\alpha=U(0)\), and
\(\beta=V(0)=-i\alpha\). With

\[
q_n=(-1)^n\sqrt{h_n},\qquad
r_n=a_n-\alpha q_n,\qquad s_n=b_n-\beta q_n,
\]

the real kernel coefficient has the exact decomposition

\[
k_n=q_n c_n+\operatorname{Re}(r_n\overline{s_n}),\qquad
c_n=\operatorname{Re}(\overline\beta a_n+\overline\alpha b_n).
\]

The endpoint terms cancel because
\(\operatorname{Re}(\alpha\overline\beta)=0\).
The \(c_n\) are coefficients of the real radial function

\[
C(s)=\operatorname{Re}(\overline\beta U(s)+\overline\alpha V(s)),
\qquad C(0)=0.
\]

We apply the supplied Dirichlet identity to this joint function. Directed
integration proves its total first-order energy is below

\[
3.504133054650557143086961.
\]

After subtracting the first 240 modes, with the omitted integration input
accounted for, the three remaining energies satisfy

\[
\begin{aligned}
E_L&<0.000884260662142687,\\
E_R&<0.000885126188452271,\\
E_C&<0.003521036759326558.
\end{aligned}
\]

For \(W_N=\sum_{n\ge N}h_n/(2n+1)\), Cauchy–Schwarz now yields

\[
\sum_{n\ge N}|k_n|
\le\sqrt{E_CW_N}+\frac{\sqrt{E_LE_R}}{2N+1}.
\]

At \(N=240\), the full directed calculation gives

\[
\sum_{n\ge240}|k_n|
<0.000063628476111533542.
\]

This preserves the cancellation between the two linear endpoint terms,
whereas the supplied first-order bound treats those terms separately.

We also retain its useful fifth-branch change: compose all outer terms below
320 before taking the coefficient absolute sum. This preserves cancellation
between outer terms. An exact polynomial-power estimate bounds the remaining
infinite sum.

Using the six original decimal weights, the resulting direct upper endpoint
is \(1.40489835922008737020\ldots\). Applying our previous exact rational
common preprocessor lowers it to \(1.40489835904595701014\ldots\).
The whole finite composition is evaluated; the uncomputed remainder is
controlled by the preprocessor's coefficient absolute sum, exactly one.

## What the optimality claims mean

There are two different conclusions in the supplied work.

**The conservative finite model is solved exactly.** Its rational primal and
dual objectives agree. For its specified coefficients and error reserves,
changing the six real mixing weights cannot improve the optimal value. The
supplied decimal weights are already extremely close to the exact optimum.
Changing tail estimates or preprocessing changes that model.

**The relaxed model limits the direct coefficient-norm method.** Dropping the
unknown tail and allowing all coefficient uncertainty favorably gives an
upper bound on the best attainable coefficient-norm score. Taking reciprocals
produces the stated lower limit

\[
1.404898309212694<B_{\mathrm{fixed,norm}}.
\]

Here \(B_{\mathrm{fixed,norm}}\) is the best upper-bound certificate from the
direct full coefficient-norm criterion for real signed mixtures of these
six fixed kernels. It is **not** \(K_G^{\mathbb C}\), and this inequality
does **not** improve our Grothendieck lower bound. The limitation survives
better tail analysis within that direct criterion. It does not cover other
kernels, complex mixing weights, or additional nonlinear preprocessing.

The supplied claim that the Wallis shift \(1/16\) is optimal in the specific
family \(1/[48(N+r)^3]\) is also correct: its asymptotic expansion forces
\(r\le1/16\). This rules out one proposed way of refining that comparison;
it does not establish optimality of all possible tail estimates.

## Practical consequence

The useful directions are to retain the first-order energy, preserve joint
cancellation, and use the exact dual certificate to avoid repeating an
already solved weight search. More significant progress would require a
change in kernels, preprocessing, or the transfer criterion. The present
combined gain is small and does not determine another decimal of the
Grothendieck constant.

The original analytic kernel construction remains that of
[Heilman, Jones and Malavolta](https://arxiv.org/html/2609.25462v1).
All results here are locally verified computational mathematics with those
analytic dependencies; none is represented as external mathematical review
or a proof-assistant formalization.
