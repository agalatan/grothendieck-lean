<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/integrate_first.md (file dated 2026-11-05). Only this line was added. -->
# A stronger exact reduction; its proposed scalar envelope is not certified

All notation is as in proof.md. A global phase makes c real and positive.
Write p=u-2c², and, for z in C, define

\[
 H_c(z)=\mathbb E_R\phi(R|c(R-2)+z|^2),
\]
\[
 I_c(z)=\mathbb E_R R[c(R-2)+z]g(R|c(R-2)+z|^2),
\]
\[
 d_{c,u}(z)=B(u)-B(0)-H_c(z)
       +B'(u)(|z|^2-p)-2cuA(u)\Re z,
\]
\[
 N_{c,u}(z)=I_c(z)-\tfrac12 J(u)z,
 \qquad J(u)=2\mathbb E_R Rg(uR).
\]

The same-norm deficit has the exact identities

\[
 \mathbb E_Pd_{c,u}(P)=\Delta(q),\quad
 \mathbb E_PN_{c,u}(P)=\mathbb E[\overline Xf(q)].
\]

Moreover, pointwise in z,

\[
 d_{c,u}(z)=\widehat{\mathbb E}_R
 \left[\frac{\phi(Ru)-\phi(RV)}R+\phi'(Ru)(V-u)\right]
       +c^2\mathcal K(u)>0,
\]

where V=|c(R-2)+z|² and K(u)=2uA(u)+u²A'(u)>0. This follows from Gamma(2,1)
integration by parts, retaining the exact R dependence. In particular
Ehat[(R-2)phi'(Ru)]=uB''(u)=-uA(u).

Weighted Cauchy--Schwarz AFTER integrating R now yields the exact bound

\[
 \boxed{C(q)^2\le\Delta(q)\,
 \mathbb E_P\frac{|N_{c,u}(P)|^2}{d_{c,u}(P)}.}
\]

It keeps radial cancellations that are lost if Cauchy--Schwarz is applied
before the R integral. No moments beyond E|P|² are used so far.

## Uncertified candidate

For 0.00551<=u<=0.0463 and 1/10<=2c²/u<=1, exploratory floating quadrature at
the PEAK ROW supports the pointwise inequality

\[
 \frac{|N_{c,u}(z)|^2}{d_{c,u}(z)}
 \stackrel{?}{\le}
 \frac1{25}+\frac4{25}\frac{2c^2+|z|^2}{u}
                  -\frac1{10}\frac{c\Re z}{u}.       \tag{*}
\]

If (*) were certified, averaging it would give C²<=(1/5)Delta for arbitrary
centered complex P throughout p<=9u/10. This is only a sufficient candidate;
it is NOT included in the proved theorem.

The scan sampled six energies, 31 Wick fractions, 322 radii (including radii
with |z|²/u up to 500), and 41 angles. Its smallest sampled slack was about
0.010365. The kernel table and radial integrations use floating quadrature
without a rigorous error enclosure, and the unbounded tail and parameter
continuum are not verified. Thus this evidence is not a certificate, even on
the sampled points. No statement at the two other rows is claimed here.

explore_wick.py and explore_kernel.npz reproduce the exploratory kernels and
the basic linear-programming experiment. scan_envelope.py reproduces the
specific candidate scan. Their output is kept separate from the proof logs.
