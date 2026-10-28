# Common Stein kernels and the limit of the frozen row tables

23 October 2026. Baseline: master `98f61ec`. No numerical Grothendieck endpoint
is changed by this work. Six new general Lean results are in
`Grothe/Lower/SteinFusion.lean`; concrete certificate data remain external exact
or directed-arithmetic checks.

## The reassessment

The binding audit established barriers for a **fixed finite cut bank**, not for
the complete radial Stein relaxation. Those claims must remain distinct. The
four old atomic laws can all be excluded by admissible tests absent from that
bank. In fact, merging just two inherited tests before squaring excludes every
one of them. Their old exact feasibility is unchanged; the new cut bank is
strictly stronger.

Excluding an atomic optimizer is insufficient evidence of a useful bound gain.
After three adaptive cuts, other atomic laws recover nearly the same table
score. A joint law/kernel conic discovery calculation improves one score by
about `0.0000025`, still far from the design target. This led to a stronger
test of the obstruction: use an explicit **genuine finite-dimensional cubic**,
and allow **every convex mixture of all nineteen frozen rows**.

The directed table-floor result below explains why completing the radial
constraints cannot finish this particular table architecture. It is not a
lower bound on the original witness norm, and is not a new Grothendieck bound.

## 1. The common-kernel state

For a unit genuine `(2,1)` cubic, use the existing definitions

\[
 U=|q|^2,\quad X=\Gamma(q,\bar q)/3-1,\quad
 r=\Re(\Gamma(q,q)\bar q^2)/(3U),
\]

with `r=0` at zero, and let
\(P=E[UX]\), \(Q_c=E[Ur]\), \(\chi=EU^2-2\).
The inherited, already formalized inputs give

\[
 EX=0,\quad EX^2\le2P/3,\quad Er^2\le2Q_c/3,\quad
 2P+Q_c=\chi,\quad Q_c\le\chi/3.
\]

Every test uses **the same** `X,r`. For a continuous piecewise-affine test
\(\phi\), eventually zero, put
\(\Phi(u)=\int_0^u\phi(s)\,ds\),
\(d(u)=\phi(u)-\Phi(u)/u\), with `d(0)=0`. Then

\[
 E[\Phi(U)-\phi(U)]=E[X\phi(U)+r d(U)].
\]

The source for this statement is `Grothe/LowerAnalytic/RadialCut.lean`;
`Grothe/Lower/Stein.lean` proves each completed spectral cut from these inputs.
No new Gaussian assumption is being introduced.

### Exact finite-feature compression (paper proof)

Fix tests `j=1,...,s`. Set

\[
 v_X=(1,U,\phi_1(U),\ldots,\phi_s(U)),\quad
 v_r=(U,d_1(U),\ldots,d_s(U)),\quad
 A_j=E[\Phi_j(U)-\phi_j(U)].
\]

Write \(G_X=E[v_Xv_X^T]\), \(G_r=E[v_rv_r^T]\). For this fixed law,
existence of a common kernel satisfying the finite Stein equations and the
separate budgets is equivalent to existence of `P,Q_c,xi,s_X,s_r` with

\[
 \begin{pmatrix}G_X&(0,P,\xi)^T\\(0,P,\xi)&s_X\end{pmatrix}\succeq0,
 \qquad
 \begin{pmatrix}G_r&(Q_c,A-\xi)^T\\(Q_c,A-\xi)&s_r\end{pmatrix}\succeq0,
\]

\[
 s_X\le2P/3,\quad s_r\le2Q_c/3,\quad
 2P+Q_c=\chi,\quad Q_c\le\chi/3.
\]

**Proof.** Given a kernel, these are Grams of the feature tuple and the kernel,
with the final diagonal enlarged to its variance budget. Conversely, positivity
of a block `[[G,y],[y^T,s]]` implies
\((c^Ty)^2\le s\,c^TGc\). Thus the map
\(\sum c_i v_i\mapsto c^Ty\) is well-defined and bounded on the feature span.
Riesz representation supplies a single vector in that span with these pairings
and squared norm at most `s`. Apply this separately to the two blocks. The shared
`xi` imposes every Stein equation simultaneously. This argument includes singular
Grams: positivity enforces the necessary nullspace compatibility.

All Gram entries are affine in the law. The unknowns are **two small matrices**,
not one pair of unrelated kernel values for every test. Nonnegative-price
coupled spectral and joint-sixth budgets can also be imposed on the same
`s_X,s_r,P,Q_c` and sixth moment; projection lowers both variance costs.

**Scope.** This equivalence concerns the finite Stein equations and variance
budgets. The additional pointwise constraints `X>=-1`, `|r|<=1+X` require further
conditions; the two matrices do not encode them. Nor do these conditions
characterize cubic laws or actual bounded response pairs. The representer and
Schur equivalence is a paper proof; the underlying simultaneous orthogonal
projection lemma is formalized in `common_kernel_projection`.

## 2. A compiler for inherited cuts

For an old cut with `mu=lambda/2`, `t=-lambda/6`, `nu=0`, divide every parameter
and test value by `lambda`. The resulting cut has

\[
 G_i=f_i^2+2g_i^2+\Phi_i-\phi_i+(U^2-2)/3,
 \qquad f_i=-(\phi_i+\beta_i)/2,\quad g_i=-d_i/2.
\]

Merge two tests and their centering parameters with weight `0<w<1`. Then

\[
 G_w=wG_1+(1-w)G_2
 -w(1-w)\{(f_1-f_2)^2+2(g_1-g_2)^2\}.
\]

The new cut is valid by the **same existing** `spec_of_inputs` theorem. It is
pointwise no larger than the old weighted sum, and its expectation must still
be nonnegative. A law passing both old cuts can fail this merged one.
Different meshes are merged on their exact union; the tests are affine in `U`,
not in `sqrt(U)`.

The general perspective saving is

\[
 \frac{x^2}{a}+\frac{y^2}{b}-\frac{(x+y)^2}{a+b}
 =\frac{(bx-ay)^2}{ab(a+b)},\qquad a,b>0.
\]

This is a useful convex compiler, not a claim of a new universal chaos inequality.
The exact cell identity, the perspective identity and inequalities, the unit-price
fusion identity, and the simultaneous projection lemma are proved in Lean.

### Exact countermodel checks

All four old laws pass the 671 inherited cuts. A merge of two of those very cuts
has expectation respectively less than `-0.0661`, `-0.2629`, `-0.0989` and
`-0.0122` at indices `7234,5661,1247,8701`. Both constituent expectations remain
nonnegative in each case. Full rational values, the two named inherited inputs,
the rational mixing weight, union mesh and variance-saving identity are stored
in the certificates. Four independently proposed 16-knot tests also reject the
laws. All eight replays and all eight corruption controls pass.

## 3. What reoptimization actually did (floating discovery)

Three adaptive tests change the four finite-grid table scores by approximately
`0`, `2.36e-8`, `1.17e-9`, and `7.51e-9`. The new distributions have more atoms.
Rejecting the old atomic optimizers therefore greatly overstates the payoff gain.

Solving for the law and its common kernel simultaneously, with fifteen hat tests
and the pointwise gradient cone, gives approximately `0.713412131532` at rule
5661, against the inherited-grid `0.713414640743`. This calculation uses 3,735
radial points. Equality and moment residuals are reported; it is **not** a
continuous-law certificate. The alternative compressed SDP encountered numerical
conditioning failures, including after whitening and explicit discovery padding.
No bound is inferred from those failed solves.

## 4. A genuine cubic blocks the frozen nineteen-row architecture

Let `X_1,...,X_m` and `Y_ij`, `1<=i<=j<=m`, be independent standard proper complex
Gaussians. Define

\[
 q_m=\frac{\sum_iX_i^2\bar Y_{ii}
          +\sqrt2\sum_{i<j}X_iX_j\bar Y_{ij}}{\sqrt{m(m+1)}}.
\]

The holomorphic and antiholomorphic coordinates are disjoint, so this is a
genuine Wick cubic. Conditionally on `X`, its variance is
\(R_m^2/[m(m+1)]\), where \(R_m=\sum|X_i|^2\). Thus

\[
 q_m\stackrel{law}=\frac{R_mG}{\sqrt{m(m+1)}},\qquad
 E|q_m|^{2k}=\frac{k!(m)_{2k}}{[m(m+1)]^k}.
\]

In particular its variance is one and its kurtosis excess is
\((8m+12)/(m(m+1))\). We use `m=128`, a finite cubic on **8,384 remote
coordinates**. Its mean-modulus and sixth-moment gates are checked exactly from
these formulas. Every valid radial inequality for genuine cubics automatically
holds for this law; it is not an atomic pseudo-law.

Let `f_i` denote the nineteen frozen piecewise-affine **upper tables**, and
retain their exact source parameters. For any nonnegative row weights summing
to one, set

\[
 \mathcal B(w)=t^2-2t\ell_w+2\beta_w^2/\epsilon
 +\sum_iw_iE f_i(\delta_i\tau|q_{128}|)
 -(k_w-h_w^TC_w^{-1}h_w)\tau^2.
\]

At the admissible values
\(\epsilon=149/200\), \(t=341/400\), \(\tau=239818283/10^9\), the directed
verifier proves

\[
 \boxed{\mathcal B(w)>0.71335>500/701\quad\text{for every such }w.}
\]

The common positive padding can only increase this value. This is a barrier for
**these stored tables and their convex row mixtures**, even if every radial
constraint of genuine cubic laws is imposed.

### How the all-mixture floor is certified

For each table construct a convex minorant as a maximum of global affine
supports. For a candidate slope `d` between zero and the stored tail slope,
the intercept `min_j(y_j-d*x_j)` certifies the support on every table cell and
its entire infinite ray. This is an exact rational check.

The Rayleigh expectation of this minorant is explicit. For its initial value
`b`, initial slope `d`, nonnegative slope jumps `Delta_j` at `a_j`,

\[
 H(\sigma)=b+\frac{\sqrt\pi\sigma}{2}
       \left[d+\sum_j\Delta_j\operatorname{erfc}(a_j/\sigma)\right].
\]

It is convex as a function of the gamma radius. Partition that radius into
`[0,64]`, intervals of width two through 192, and `[192,infinity)`. Conditional
Jensen gives the lower sum `sum p_j H(E[R|cell_j])`, including **both full
tails**. All cell probabilities and first moments follow from
`Pr(R_m>a)=exp(-a)*sum_(j=0)^(m-1) a^j/j!` and its `m+1` counterpart.
The verifier recomputes them and the error functions with 256-bit Arb balls.

Finally, fixed rational `beta0,z` give, for every mixture,

\[
 2\beta_w^2/\epsilon\ge
 4\beta_0\beta_w/\epsilon-2\beta_0^2/\epsilon,\qquad
 h_w^TC_w^{-1}h_w\ge2z^Th_w-z^TC_wz.
\]

All nineteen `C_i` are checked positive definite over the rationals. These
tangent inequalities make the lower bound affine in the row weights. It is
therefore enough to check nineteen directed lower bounds, which the verifier
does. Discovery weights and quadrature are not used as a proof of optimality.

### What this does and does not establish

This does **not** show that a response pair produces this radial law at these
`t,tau`, or that the exact fibre potentials have the same floor. It does not
bound new row profiles, rank-one shifts, common potentials optimized before the
supremum, or a different epsilon. In particular it is not a counterexample to
the original-response conjecture.

It does show why more radial moments or a fully optimized common Stein kernel
cannot alone finish **the frozen-table certificate**. A stronger certificate
must change those tables/profiles, or retain compatibility of the radial cubic
with the same bounded responses and negative projection costs.

## 5. Revised next target

Do not expand the clipped Gram feature search or the finite radial cut bank as
the main campaign. Use common-kernel compression when reoptimizing a law bound,
but require any proposed global lift to price this explicit genuine family and
the shared image fields before claiming it addresses the obstruction.

The next structural target is the coupled projection field
`p = Q_w E_Z k` together with the actual two polynomial images `Tf,Tg`.
The scalar law of `p` is admissible here; treating that law independently of
the response fields is the information loss this test cannot repair.

A concrete calibration target is the full response map on this same `q_m` family, rather than another independently assigned law. Under `X -> U X`, `Y -> Sym^2(U)Y`, the cubic is invariant. The candidate first/cubic invariant basis is `Z; H(Z), Z A_X, Z A_Y, q_m`, where `A_X=(R_m-m)/sqrt(m)` and `A_Y=(norm(Y)^2-d)/sqrt(d)`, `d=m(m+1)/2`. Prove this invariant-space closure before using it. Its joint scalar coordinates must retain `q_m=R_m G/sqrt(m(m+1))` and `norm(Y)^2=abs(G)^2+V`, with `V~Gamma(d-1,1)` independent of `G,R_m`. In particular `A_Y` and `q_m` share `G`. If established, this gives a small actual best-response engine and legitimate columns for the upper pool. It is a restricted-family calibration, not an exhaustive global oracle.

## Reproduction and trust boundary

All files are under
`/Users/alingalatan/workspaces/grothe/outputs/common-stein-20261023/` and the
corresponding portable archive. Exact atomic-law replay uses only the standard
library. The genuine all-row floor additionally requires `python-flint`.
Discovery scripts need numpy, scipy and cvxpy and ran on the droplet.

The source-table JSON is hash-pinned; it is an exact copy of the nineteen rows
in the previous audited `diagnostic-input.json`. Its connection to the committed
source data is the binding audit's exact reconstruction. The present floor
does not assume that an upper table is a lower bound for its fibre potential.
The finite-feature representer theorem and the Gaussian/Jensen application are
paper proofs. The six general fusion/projection results are Lean proofs.

## Validation completed

The live manuscript compiled successfully with the desktop compiler. The whole
Lean library built successfully (9,055 jobs); the axiom audit passed for 221
theorems and used only the three existing pinned numerical facts. All six new
results use only standard axioms. The standard-library exact replay passed from
an unrelated directory; the full archive replay also passed under `python -I`
on the droplet. The directed all-row floor includes the full two gamma tails.
Source-table tampering and an invalid tangent price were both rejected.
The compressed SDP solver failures remain discovery failures, not certificates.

The complete archive is
`/Users/alingalatan/workspaces/grothe/outputs/grothendieck-common-stein-reassessment-20261023.zip`.
The live TeX insert is
`/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/global-response/common-stein-kernel-20261023.tex`.
