<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/localization_notes.md (file dated 2026-11-15 03:38). Only this line was added. -->
# Improved elementary localization

Agent-ID: **codex-6e2b**. 15 November 2026.

**P+C.** Use the notation of REPORT.md. For every remote cubic of energy
\(0\le u\le463/10000\) and every remote linear form \(r\),

\[
\mathcal J(q,r)\le\frac{1273}{1250}u-\frac{859}{2500}\|r\|^2.
\]

In particular every nonnegative-gain \(r\), and hence every global maximizer,
satisfies \(\|r\|<371/1000\). This improves the earlier elementary radius
but does **not** establish the required \(17/200\) localization.

The C part is independently reproducible with
`python3 -I localization_verify.py`, using only the standard library.

## Proof

**P.** For the circular mean \(C(t)=\mathbb E_\theta|1+te^{i\theta}|\),

\[
C(t)\ge\sqrt{4+t^2}-1\qquad(t\ge0).
\]

For \(t\le1\), the nonnegative binomial-square series gives
\(C(t)\ge1+t^2/4\), while \(\sqrt{4+t^2}\le2+t^2/4\).
For \(t\ge1\), reciprocity gives \(C(t)\ge t+1/(4t)\).
The square of \(t+1+1/(4t)\) minus \(4+t^2\), multiplied by \(16t^2\),
equals, with \(x=t-1\ge0\),

\[
32x^3+56x^2+24x+1>0.
\]

This proves the bound in the second range too.

Consequently, for \(V=|q|^2\) and \(\ell(t)=\sqrt t(a+bt)\),

\[
F(q)-F(0)\ge
\mathbb E\frac{2V}{\sqrt{4\ell(T)^2+V}+2\ell(T)}.
\]

For each fixed \(\ell>0\),
\(g_\ell(v)=2/(\sqrt{4\ell^2+v}+2\ell)\) is decreasing and convex on
\([0,\infty)\): writing \(R=\sqrt{4\ell^2+v}\),

\[
g_\ell'(v)=-\frac1{R(R+2\ell)^2},\quad
g_\ell''(v)=\frac1{2R^3(R+2\ell)^2}
 +\frac1{R^2(R+2\ell)^3}>0.
\]

For \(u>0\), apply Jensen under the size-biased law with weight \(V/u\).
The cubic fourth-moment bound \(\mathbb EV^2\le44u^2\) then gives

\[
F(q)-F(0)\ge u\,c(u),\qquad
c(u)=\int_0^\infty
 \frac{2e^{-t}}{\sqrt{4t(a+bt)^2+44u}+2\sqrt t(a+bt)}\,dt.
\]

The bound also holds at \(u=0\), interpreted directly as zero. The function
\(c(u)\) is decreasing for \(u>0\). The fourth-moment premise is the existing
dimension-free circular-cubic bound described in REPORT.md; no new Lean
verification is claimed here.

**C.** The verifier proves \(c(463/10000)>7/10\). Its integrand is positive
and decreasing in \(t\), since its numerator decreases and its denominator
increases. Thus the right-endpoint sum on 8192 intervals of width \(1/512\)
covering \([0,16]\) is a rigorous lower integral bound. The omitted tail is
positive. Each exponential is enclosed downward by propagating a downward
integer approximation to the odd-degree-nine alternating series for
\(e^{-1/512}\). Each square root in the denominator is rounded upward by
integer square roots. The quotient and final sum are rounded downward.
The verifier uses a scale of \(10^{24}\); all acceptance comparisons are
integers or exact rational numbers.

Subtract this lower bound from REPORT.md's independently established upper
bound

\[
2\mathbb E|L+q+Ar|-P\|r\|^2
\le F(0)+\frac{1074}{625}u-\frac{859}{2500}\|r\|^2.
\]

Since \(1074/625-7/10=1273/1250\), the claimed gain bound follows. Finally

\[
\|r\|^2\le
\frac{1273/1250}{859/2500}\frac{463}{10000}
<\left(\frac{371}{1000}\right)^2
\]

whenever the gain is nonnegative; this last comparison is exact in the
verifier. It assumes neither positivity of the deficit nor a content bound.
