<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/root/TWO_COORDINATE_RADIUS.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- codex-c7e2-round2/root/TWO_COORDINATE_RADIUS.md; Agent-ID: codex-c7e2. -->
# A strict Gaussian radius bound for every two-coordinate circular cubic

For every q in H_(2,1)(C^2),

\[
\boxed{\qquad
(\mathbb E|q|)^2\le\frac{6\pi}{25}\,\mathbb E|q|^2
<\frac\pi4\,\mathbb E|q|^2\qquad(q\ne0).
\qquad}\tag{1}
\]

This is an elementary analytic theorem at every amplitude and for arbitrary
complex coefficients. It is not a numerical optimization claim and does
not assert that 6pi/25 is optimal. The sharp Gaussian benchmark pi/4 is
therefore valid, with a strict dimension-specific gap, throughout this
finite-dimensional chaos.

## 1. Rotate the trace vector

Write Z_1,Z_2 for independent standard proper complex Gaussians and
T_j=|Z_j|^2. The following six cubics are an orthonormal basis:

\[
H_j=Z_j(T_j-2)/\sqrt2,\quad
A_0=(T_1-1)Z_2,\quad B_0=Z_1^2\overline{Z_2}/\sqrt2,
\quad Q_0=Z_1(T_2-1),\quad P_0=\overline{Z_1}Z_2^2/\sqrt2.
\]

The complex Laplacian of a cubic in this space is a holomorphic linear
form. Unitary changes of the two Gaussian coordinates preserve the law,
the chaos, and this contraction. Rotate its coefficient vector to the
Z_1 direction (if it is zero, any rotation will do).

In the expansion

\[
q=\nu H_1+cH_2+A A_0+B B_0+Q Q_0+P P_0,
\]

the Z_2 coefficient of the complex Laplacian is sqrt(2)c+A. Thus the
chosen rotation gives A=-sqrt(2)c. In particular the tied block is

\[
cH_2+A A_0=\frac{c}{\sqrt2}Z_2(T_2-2T_1),
\]

and

\[
\mathbb E|q|^2=|\nu|^2+|Q|^2+3|c|^2+|B|^2+|P|^2.\tag{2}
\]

No restriction on q has been imposed beyond a unitary choice of coordinates.

## 2. An elliptic radial weight

Set R=sqrt(T_1+T_2/4). Weighted Cauchy--Schwarz gives

\[
(\mathbb E|q|)^2\le(\mathbb ER)\,
                    \mathbb E\frac{|q|^2}{R}.\tag{3}
\]

To compute the quadratic form on the right, use S=T_1+T_2 and x=T_1/S.
They are independent, with S distributed as Gamma(2,1) and x uniform
on [0,1]. Put g(x)=sqrt(1+3x)/2, so R=sqrt(S)g(x). Direct integration gives

\[
\frac{\mathbb ER}{\sqrt\pi}=\frac7{12},\qquad
J_k:=\int_0^1\frac{x^k}{g(x)}\,dx,
\quad (J_0,J_1,J_2,J_3)
=\left(\frac43,\frac{16}{27},\frac{152}{405},\frac{776}{2835}\right).
\]

These are rational integrals: substitute y=sqrt(1+3x), so
dx/g(x)=4dy/3 on 1<=y<=2. The required S moments are

\[
\mathbb ES^{1/2}=3\sqrt\pi/4,\quad
\mathbb ES^{3/2}=15\sqrt\pi/8,\quad
\mathbb ES^{5/2}=105\sqrt\pi/16.
\]

Angular orthogonality eliminates every cross term except the nu,Q block.
Substitution yields exactly

\[
\frac{(\mathbb ER)\mathbb E(|q|^2/R)}{\pi}
=
\begin{pmatrix}\bar\nu&\bar Q\end{pmatrix}
\begin{pmatrix}
287/1296&7\sqrt2/648\\
7\sqrt2/648&49/216
\end{pmatrix}
\begin{pmatrix}\nu\\Q\end{pmatrix}
+\frac{581}{2592}\,3|c|^2
+\frac7{36}|B|^2+\frac{287}{1296}|P|^2.\tag{4}
\]

## 3. Exact matrix comparison

Each diagonal scalar coefficient in (4) is smaller than 6/25. For the
two-by-two matrix, subtract it from (6/25)I. Its diagonal entries and
determinant are respectively

\[
\frac{601}{32400}>0,\qquad
\frac{71}{5400}>0,\qquad
\frac{5513}{524880000}>0.
\]

It is therefore positive definite over both real and complex coefficient
vectors. Equations (2)--(4) prove (1). The companion Node checker verifies
the rational integrals, every matrix coefficient, and all comparisons
using exact BigInt fractions; pi cancels from the comparison.

## Scope and independent review

The remote worker independently checked the unitary trace normalization,
the tied-block energy, all four J_k integrals, and every rational matrix
coefficient and determinant. This is internal mathematical review, not a
Lean formalization. No claim of literature priority is made.

The theorem controls the **unbuffered** radius for two-coordinate cubics.
It does not automatically imply the buffered-radius inequality for
q+sigma W: that random variable is not a cubic on these two coordinates,
and replacing W by a diffuse cubic increases dimension. Consequently no
all-amplitude remote K theorem is inferred from (1) alone.

The one-parameter weight sqrt(T_1+lambda sum_(j>1)T_j) does not by itself
extend this proof to n>=3. Exploratory eigenvalue computations in
`radial_weight_probe.py` show a best quadratic majorant above pi/4 already
at n=3; that observation is numerical, not an impossibility theorem for
other weights.
