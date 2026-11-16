<!-- Verbatim from /private/tmp/claude-501/-Users-alingalatan-workspaces-grothe/5cd9b705-6072-44d0-a4e1-13a1e3d002d0/scratchpad/gpt-cubic-chaos4/x/cum3_proof.md, 16 November 2026; GPT (a ChatGPT session of the user), relayed by the user. -->
# Explicit cubic cumulant bounds

All assertions below are rigorous. Write `F=I_3(f)` with real symmetric kernel `f`, using the convention `E F^2=6||f||^2`. Set

\[
C=\|f\otimes_2 f\|^2=\|f\otimes_1 f\|^2,
\qquad S=\|\widetilde{f\otimes_1 f}\|^2.
\]

The equality defining C follows by viewing f as an operator from H to H tensor H: the two contractions are A*A and AA*, with the same squared Hilbert--Schmidt norm.

The product formula and symmetrization identity give

\[
F^2=I_6(\widetilde{f\otimes f})
 +9I_4(\widetilde{f\otimes_1 f})
 +18I_2(f\otimes_2 f)+6\|f\|^2,
\]
\[
720\|\widetilde{f\otimes f}\|^2
=72\|f\|^4+324\|f\otimes_1 f\|^2+324\|f\otimes_2 f\|^2.
\]

Consequently, with delta denoting the unstandardized fourth cumulant,

\[
\boxed{\delta=\kappa_4(F)=1296C+1944S},\qquad
1296C\le\delta\le3240C.
\]

## Explicit sixth cumulant

The connected diagram formula for kappa_6 uses six vertices, each having three labelled slots; slots are paired across vertices, and the resulting loopless cubic multigraph must be connected. Every such graph has a perfect matching. This follows directly from Schulte--Thaele Lemma 14, since

\[
L(3,6)=\left\lceil\frac{5\cdot6-2}{12}\right\rceil=3.
\]

Pairing the kernels along those three matched vertex pairs produces three factors `f tensor_r f`, with `r` equal to 1 or 2. Generalized Cauchy--Schwarz bounds the absolute diagram contribution by `C^(3/2)`. This is precisely Lemmas 15 and 17 of the same source, applied with zero unpaired kernel factors.

The number of diagrams is `kappa_6(He_3(Z))`, because each diagram contributes one for a rank-one unit kernel. Exact Gaussian moments give

\[
E He_3(Z)^2=6,\quad E He_3(Z)^4=3348,\quad E He_3(Z)^6=11608920,
\]
\[
\#\text{diagrams}=11608920-15(3348)(6)+30(6)^3=11314080.
\]

It follows that

\[
\boxed{|\kappa_6(F)|\le11314080 C^{3/2}
 \le\frac{485}{2}\,\kappa_4(F)^{3/2}}.
\]

The last coefficient follows from `11314080 / 36^3 = 485/2`. Without counting connected diagrams, bounding their number by `17!!=34459425` gives the weaker but still explicit constant `738.585069... < 739`.

Source: M. Schulte and C. Thaele, Cumulants on Wiener chaos: moderate deviations and the fourth moment theorem, arXiv:1410.7964, Lemmas 13--17.
https://arxiv.org/html/1410.7964v1

## Directional concentration and regular remainder

Now normalize `E F^2=1`, and let `M=f tensor_2 f` as an operator on H. Then M is positive semidefinite, `tr M=1/6`, and

\[
1296\operatorname{tr}M^2\le\delta\le3240\operatorname{tr}M^2.
\]

Since `tr M^2 <= ||M||op tr M`,

\[
\boxed{\|M\|_{\rm op}\ge\delta/540},\qquad
\boxed{\sup_{\|e\|=1}E[(\partial_e F)^2]\ge\delta/30}.
\]

The second formula uses `E[(partial_e F)^2]=18 <Me,e>`.

Given `tau>0`, let P be the spectral projection of M for eigenvalues greater than tau, let Q=1-P, and let `R=I_3(Q^{tensor3}f)`. Then

\[
\dim PH\le\frac1{6\tau},\qquad
\kappa_4(R)\le540\tau\operatorname{Var}R.
\]

Indeed, the contraction matrix `M_R` satisfies `0<=M_R<=QMQ`, because projecting the other two tensor arguments can only decrease each directional norm. Thus `||M_R||op<=tau`, `tr M_R=Var(R)/6`, and `kappa_4(R)<=3240 tr M_R^2<=540 tau Var(R)`.

For any `eta>0`, this gives the following dichotomy: either `Var R<eta`, in which case `||R||_2<sqrt(eta)`, or

\[
\kappa_4(R/\sqrt{\operatorname{Var}R})\le540\tau/\eta.
\]

In particular, choosing `tau=epsilon eta/540` gives active rank at most `90/(epsilon eta)`, and the residual either has variance less than eta or normalized fourth cumulant at most epsilon. If the top eigendirection is active, the orthogonal structured component `B=F-R` satisfies `Var B>=6||M||op>=delta/90`.

This is a rigorous finite-dimensional active-subspace plus contraction-regular residual decomposition. It is not a reduction to an independent sum: cubic terms involving both P and Q remain. Conditioning on P produces degree-two and degree-one terms in Q, as well as R. Any argument that discards these mixed terms would be incomplete.

## Checks

The script `cum3_check.js` checks the fourth-cumulant identity with exact integer arithmetic for rank-one, product, and nontrivial symmetric tensors in dimensions two and three. It also checks the displayed sixth-cumulant bound on these examples. These are checks of examples only: the general identities and diagram bound are proved analytically above, and are not established by the finite sample checks.

For `F=He_3(Z)/sqrt6`: `delta=90` and `kappa6=52380`.
For `F=Z1 Z2 Z3`: `delta=24` and `kappa6=3000`.
