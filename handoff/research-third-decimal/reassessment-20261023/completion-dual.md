# A rational dual for the shared completion problem

23 October 2026. Paper proof and exact finite checks. No Gaussian integration
enclosure, new global norm cap, or improved Grothendieck endpoint is asserted.
This packages the existing shared Gram pricing inequality into an independently
checkable certificate for the completion SDP. It is a practical continuation of
`ResponseGram.lean`, not a claim of a new semidefinite duality theorem.

Let the measured first-chaos Gram be `X` and the unmeasured joint feature
Gram be `V`. For the same pair of response feature tuples, the actual residual
projection Gram satisfies

\[
 0\preceq K\preceq V.
\]

Use a branch split of sizes r and s and write

\[
 H(K)=H_0+\varepsilon
 \begin{pmatrix}0&K_{fg}\\K_{fg}^{\mathsf T}&0\end{pmatrix},
 \qquad
 H_0=\begin{pmatrix}D_f&\varepsilon X_{fg}\\
                    \varepsilon X_{gf}&D_g\end{pmatrix}.
\]

The matrices may be obtained from signed Hessian weights or positive absolute
weights. The extraction and error accounting must use the same choice.

## Certificate theorem

Choose real symmetric rational matrices Y and R such that

\[
 Y\succeq0,\quad\operatorname{tr}Y=1,\quad R\succeq0,
 \quad R-Z\succeq0,
 \qquad
 Z=\varepsilon\begin{pmatrix}0&Y_{fg}\\
                                  Y_{gf}&0\end{pmatrix}.
\]

If

\[
 \operatorname{tr}(YH_0)+\operatorname{tr}(RV)=-\eta<0,
\]

then every completion obeys

\[
 \lambda_{\min}(H(K))\le-\eta.
\]

Indeed, the existing two-price inequality gives

\[
 \operatorname{tr}(YH(K))
 =\operatorname{tr}(YH_0)+\operatorname{tr}(ZK)
 \le\operatorname{tr}(YH_0)+\operatorname{tr}(RV).
\]

For PSD trace-one Y, the left side is at least the smallest eigenvalue of
H(K). This proves the claim without strong duality, invertibility of V,
strict feasibility, or numerical eigenvalue tests.

In the opposite direction the *optimal* price for fixed Y has the familiar
closed form

\[
 \sup_{0\preceq K\preceq V}\operatorname{tr}(ZK)
 =\operatorname{tr}\bigl((V^{1/2}ZV^{1/2})_+\bigr).
\]

To see this on the support of V, write K=V^(1/2) A V^(1/2), 0<=A<=I,
and select the positive spectral space. Singular V is handled by restricting
to its range. This formula is useful for discovery; the exact checker uses
the rational two-price certificate, so it need not trust square roots or
eigendecompositions. The complex version uses Hermitian matrices and real
traces; alternatively use their standard realification.

## Integration errors and near-maximizer accounting

If the supplied H0 and V are approximations with certified operator errors
at most h and v respectively, the same price gives the rigorous upper value

\[
 \operatorname{tr}(YH_0)+\operatorname{tr}(RV)+h+v\operatorname{tr}R.
\]

Only a one-sided Loewner upper bound for the true V is needed. This formula
also covers padding of a certified enclosure. An empirical discrepancy across
QMC grids is not a certified value of h or v.

For pointwise feature budgets at most L^2 on each branch, the manuscript's
globally delta-near-maximizer theorem gives

\[
 H(K)\succeq-10L^2\sqrt\delta\,I.
\]

Thus a verified separation margin eta forces
delta >= eta^2/(100 L^4). Using the sharper already-proved constant
4 sqrt(13/4+3 epsilon) L^2 gives
delta >= eta^2/[16(13/4+3 epsilon)L^4]. These statements concern the
particular moment data under test. A global norm cap still requires a uniform
certificate over every possible response state. Excluding selected responses
far below the incumbent cap is insufficient.

## Exact fixture: selected scalar screens lose a coupled direction

Take r=s=2, epsilon=149/200, V=I4, Df=Dg=(2/5)I2 and
Xfg=(4/5)J2, where J2 is the all-ones matrix. One may complete X itself
to a PSD measured Gram by setting Xff=Xgg=2I2. The tuple is an abstract Gram
fixture; no bounded Gaussian response realizing all its weighted moments is
asserted.

For every one of the four coordinate-pair screens,

\[
 2(4/5)\le 1+2(2/5)/(149/200),
\]

and the scalar completion k=-3/10 passes stability. The four tests therefore
accept. They do not share a matrix completion.

Set x=(1,1,-1,-1)/2, Y=xx^T and R=(epsilon/2)Y. Then R>=0 and
R-Z>=0 are rank-one PSD matrices and the exact dual value is

\[
 \frac25-\frac85\varepsilon+\frac12\varepsilon
 =-\frac{839}{2000}.
\]

The optimal value really is -839/2000: K with diagonal blocks I2/2 and
off-diagonal blocks -J2/4 has 0<=K<=I4 and attains this smallest stability
eigenvalue. The verifier checks H(K)+(839/2000)I4>=0 and its Rayleigh value
against Y exactly. A scalar test along the combined all-ones directions
would already detect this example; the claim is about the insufficiency of
the selected coordinate tests, not about every conceivable rank-one test.

## Replay

`python3 -I tools/reassessment_completion_dual.py` verifies this fixture and
rejects deliberate mutations breaking price positivity, trace normalization,
the complementary price, and strict separation. The standard-library checker
uses rational symmetric Schur complements, including the zero-pivot case.
It accepts an external certificate JSON with V, H0, Y, R, epsilon, split and
optional nonnegative operator-error allowances.

The saved fixture is `completion-fixture.json` beside this note. No existing
headline theorem, finite certificate, or axiom assumption is changed.
