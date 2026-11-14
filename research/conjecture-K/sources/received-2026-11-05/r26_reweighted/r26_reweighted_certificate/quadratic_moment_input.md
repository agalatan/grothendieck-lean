<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/quadratic_moment_input.md (file dated 2026-11-05). Only this line was added. -->
# Inherited R23 moment theorem

Extracted unchanged from the supplied R23–R25 proof. This is an input, not a new claim of this bundle.

## R23. Exact non-Hermitian sixth moment

Let

\[
P=Y^*AY-\operatorname{tr}A,
\quad p=\operatorname{tr}(AA^*),\quad t=\operatorname{tr}(A^2),
\]

\[
\zeta=\operatorname{tr}(A^2A^*),\quad
\eta=\operatorname{tr}(A^3A^*),\quad s=\operatorname{tr}(A^3),
\quad r=\operatorname{tr}((AA^*)^2),\quad Q=\|A^2\|_{HS}^2.
\]

There is no assumption that A is normal. Define

\[
R_3=\operatorname{tr}((AA^*)^3),\quad Q_3=\|A^3\|_{HS}^2,
\]

\[
U_3=\operatorname{tr}(A^{*2}A^2A^*A),\quad
V_3=\operatorname{tr}(A^2A^{*2}AA^*).
\]

The latter two traces are nonnegative real numbers: each is the trace of a
product of two positive semidefinite matrices. The exact moments are

\[
m_4:=\mathbb E|P|^4=2p^2+|t|^2+2r+4Q,
\tag{23.1}
\]

\[
\boxed{\begin{aligned}
m_6:=\mathbb E|P|^6={}&6p^3+9p|t|^2+4|s|^2+36|\zeta|^2
+36\Re(\overline t\eta)\\
&+18pr+36pQ+12R_3+36(Q_3+U_3+V_3).
\end{aligned}}\tag{23.2}
\]

Proof: formally,

\[
\log\mathbb E e^{zP+w\overline P}
=\sum_{k\ge2}\frac1k\operatorname{tr}(zA+wA^*)^k.
\]

Extract the coefficient of z³w³ and multiply by 3!3!. The degree partitions are
2+2+2, 3+3, 2+4, and 6. `verify_moments.mjs` independently enumerates all 265
centered Wick contractions and verifies the resulting noncommutative trace
polynomial exactly. No numerical matrix examples are used to prove this identity.

### A sharp Gaussian-anchored coupled inequality

For all complex A,

\[
\boxed{m_6\le37p\,m_4-68p^3.}\tag{23.3}
\]

Here is a short proof that also produces the refinement needed for the content
certificate. Put

\[
H_\theta=\Re(e^{-i\theta}P),\qquad
p_\theta=\mathbb E H_\theta^2
=\frac{p+\Re(e^{-2i\theta}t)}2.
\]

Apply the Hermitian inequality

\[
\mathbb E H_\theta^6\le\frac{125}{3}p_\theta\mathbb E H_\theta^4
-110p_\theta^3
\]

and integrate theta uniformly. Using

\[
\mathbb E P^3\overline P=3pt+6\eta
\]

and the circle averages of fourth and sixth powers gives

\[
\boxed{
m_6\le25pm_4-44p^3-16p|t|^2+100\Re(\overline t\eta).
}\tag{23.4}
\]

We have

\[
|\eta|\le\sqrt{rQ},\qquad 0\le Q\le r\le p^2,\qquad |t|\le p.
\]

The first bound is Hilbert–Schmidt Cauchy–Schwarz applied to
tr(A² AA*); the second follows from
Q = tr((A*A)(AA*)) <= r.

For 0 <= tau <= 1 and 0 <= q <= r <= 1, the scalar inequality

\[
25\tau\sqrt{rq}\le7\tau^2+6r+12q
\tag{23.5}
\]

holds. To verify it, write q = r z², 0 <= z <= 1. If
6+12z²-25tau z >= 0 the result is immediate. Otherwise take r = 1, which can
only decrease the difference. For z >= 14/25, the minimum over tau in [0,1]
is attained at tau = 1, where the difference is
(1-z)(13-12z). For z <= 14/25, completing the square gives the lower bound
6 - (289/28)z² > 0. Thus (23.5) holds.

It implies

\[
100\Re(\overline t\eta)\le28p|t|^2+24pr+48pQ.
\]

Substitute this in (23.4) and use (23.1) to obtain (23.3).

The pair (37,68) is sharp in the following precise sense. A rank-one Hermitian
matrix has (p,m4,m6) = (1,9,265), attaining equality. Diffuse normal matrices
with circularly distributed eigenvalue phases have (m4,m6) tending to (2,6),
with p = 1. Any Gaussian-anchored bound m6 <= alpha p m4 - beta p³ must have
beta <= 2alpha - 6. On this anchoring line, the rank-one example forces
alpha >= 37. Thus neither coefficient of (23.3) can be improved while holding
the other fixed. This does not assert a full classification of every possible
unanchored tradeoff between alpha and beta.

