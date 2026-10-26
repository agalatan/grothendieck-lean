# Rank-one directions and the actual common completion

23 October 2026. These are algebraic constructions for the ongoing lower-bound
certificate. They do not assert a new global Grothendieck endpoint. The original
shared-response reduction, Gaussian potential majorants and law identities keep
their stated analytic status.

## A canonical admissible direction

Use the real-even gate block `E>0`, let `e0=(1,0,0)`, and put

\[
 D'=\operatorname{diag}(-1,\epsilon,\epsilon),\qquad S=E-D'\succeq0.
\]

An admissible rank-one direction is available without a numerical cone search:

\[
 w=e_0+E^{-1}e_0,\qquad v=Ew=S e_0,\qquad d=w^TEw.
\]

Indeed `d-S00=1+(E^{-1})00>0`, so, for every real `x` and `t`,

\[
 x^TSx-2t\,x^Tv+d t^2
 =(x-t e_0)^TS(x-t e_0)
  +\bigl(1+(E^{-1})_{00}\bigr)t^2\ge0.                 \tag{1}
\]

Thus the required four-by-four L10 block is PSD. This construction proves
admissibility, not optimality. It also works after taking any convex average of
the old admissible gate matrices. `tools/rankone_mixture.py` checks (1) as a full
coefficient identity and checks the averaged E/S/N gates exactly.

For the actual weights of box 8150, this canonical common direction and a
selected pair of archived global source majorants give, at physical `r=3/20`,

\[
 F_{\rm common}(r,f(r))\le1.405740651870.
\]

The saving against the weighted inherited effective source caps is greater than
`1.9727201e-6`. This is a source-node result, not a law or box result. The selected
Gaussian majorants remain inherited here; their hashes and exact Schur data are
recorded in `common-mixture-8150-r015.json`.

## A more useful option: activate only one row

For a common completion it is unnecessary to force every row to use the same
rank-one direction or to turn on every test. Suppose row `i` has an admissible
block `[S_i,-v_i;-v_i^T,d_i]`. Rows with the zero test have `v_i=d_i=0`.
For weights `lambda_i` define

\[
 \bar E=\sum_i\lambda_iE_i,\quad
 \bar S=\sum_i\lambda_iS_i,\quad
 \bar v=\sum_i\lambda_i v_i,\quad
 \bar d=\sum_i\lambda_i d_i.
\]

The averaged L10 block is PSD. In addition, averaging the PSD blocks
`[E_i,v_i;v_i^T,d_i]` gives

\[
 \bar d\ge\bar v^T\bar E^{-1}\bar v.                 \tag{2}
\]

The generalized Young test with these data is valid: first use
`w_eff=Ebar^{-1}vbar`, then enlarge its nonnegative projected square price from
`vbar^T Ebar^{-1}vbar` to `dbar`. In the L21 remainder,

\[
 \bar v_R^T\bar C^{-1}\bar v_R-\bar d
 =-s_{\bar E}(w_{{\rm eff},0})^2
   -(\bar d-\bar v^T\bar E^{-1}\bar v)\le0.           \tag{3}
\]

Consequently the extra Young price helps the discarded remainder. The linear
coefficient must nevertheless use the **common** completion:

\[
 \bar h=\bar n+\bar A_R,\qquad
 \bar c=\bar v_0-\bar h^T\bar C^{-1}\bar v_R.
\]

Here `A_i=delta_i*(e0+b_i)` is averaged at its true scale. Averaging `b_i` and
`delta_i` separately and multiplying afterward gives a different coupling.
The original common pin price `Dbar` stays unchanged.

An independent derivation of the Young, leakage and common-response steps is in
`replay/MIXTURE_AUDIT.md`. The exact matrix conditions (1)--(3) are algebraic
checks. Their application to the response problem still uses the original
pre-square analytic response identity.

## Exact repricing for box 8150

The current cover uses

\[
 \lambda_{12}=133952501/10^9,\qquad
 \lambda_{15}=866047499/10^9.
\]

Keep row 12's zero test and activate only the archived row 15 test. Then
`vbar=lambda15*v15`, `dbar=lambda15*d15`. Divide the common linear coefficient
by `lambda15` to obtain the active-row coefficient

\[
 c'_{15}=v_{15,0}-\bar h^T\bar C^{-1}v_{15,R}
       \approx0.1803218853127957,
\]

whereas the pure row has `c15≈0.1800602084526944`. Thus

\[
 F'_{15}(r,f)=F_{15}(r,f)+2(c'_{15}-c_{15})rf.         \tag{4}
\]

For an explicit affine test `f(r)=f0+f1*r`, (4) simply adds
`[0,2*delta_c*f0,2*delta_c*f1]` to its quadratic cap coefficients. For a saved
rational endpoint test, add `2*delta_c*r*f` to its effective cap and round
upward. Decline the test whenever the inherited zero-test cap is better.

The semiconvex coefficient becomes `(c'15)^2/d15≈0.1860998814777420`; the
weighted source uses `lambda15*(c'15)^2/d15`. The old pure-row coefficient must
not be retained after changing `c`. Both the source hull and the subsequent
tau bridge must use the changed coefficient.

`tools/rankone_reprice_mixture.py` exports the repriced global bank and explicit
localized node table, checking all matrix conditions and coefficient identities
with rational arithmetic. The explicit profiles are retained; no claim that
they optimize the new majorants is needed.

This construction makes it possible to reuse the old law cuts and row 12 bounds
while improving row 15 under the *actual* mixture pin price. Multiplying an
uncorrected pure-row saving by `lambda15` would omit (4) and is not valid.
