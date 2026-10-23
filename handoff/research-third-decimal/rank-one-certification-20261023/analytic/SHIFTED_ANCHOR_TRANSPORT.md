# Exact transport of anchored caps to the rank-one test

23 October 2026. This closes a concrete source-cap obligation from Step 22.
It does not assert a complete law cover or a new Grothendieck lower endpoint.

## The result

For the current pure row 14 (`t=0.85`) and its already exactly accepted Step-22
rank-one vector, an explicit rational scalar test at physical residual magnitude
`r=3/20` satisfies

\[
 \Psi(A r-vf)+d f^2+2crf
 \le {347758154319\over250000000000}=1.391032617276.
\]

Here `Psi(b)` denotes the full twelve-real-coordinate potential with external
real-even shift `b`; in the earlier notation it is
`Psi(delta*r; -v*f)`. The improvement over the *current certified source chord*
(including its inherited `1e-11` allowance) is greater than `0.00001387549`.
This is an actual upper certificate for a selected test, rather than a value
from floating point minimization.

The winning archived anchor is `cert-0745e/bundles/newA_proof_0.85_0.json`,
result and recipe index 15, anchor `s=31/400`. The separate source replay in
`../replay/row085-anchor031400.json` regenerates its full Gaussian moment table,
price recipe, augmented majorant, all four Schur blocks, and every stored result
field exactly. This anchor's integral majorant is consequently rechecked in this
session. The scalar inequality and polar-integration proofs underlying that
replay remain paper mathematics, not a Lean theorem.

`transport-m14-r015.json` supplies all exact rational coefficients. Their long
denominators are consequences of exact matrix inversion, not numerical error.
For use in a table, `source-nodes-m14.json` rounds the selected test to a rational
with denominator `1e9`, re-evaluates its exact quadratic price, and rounds the cap
upward at `1e-12`.

## What is already present in an anchored certificate

Use the coefficient variable `m=M*y`, so the exact potential is

\[
 \Psi(b)=\sup_{m\in\mathbb R^{12}}
 \bigl[J(m+b)-m^T M^{-1}m\bigr],
\]

with the three-vector `b` embedded in the first, real-even block. The inherited
anchored-pair inequality and its exact Loewner enclosure give, **for every**
coefficient vector `z`,

\[
 J(z)\le C+2h^Tz+z^THz.
\]

The certificate records `C_upper`, `h_exact`, and four symmetric blocks
`H_upper`. The linear vector is supported on the real-even block. It checks

\[
 D_j=M_j^{-1}-H_j\succ0
\]

for all four blocks by exact LDL. This quantifier is the crucial extra
information absent from a scalar table `Psi(s)<=cap(s)`: the same inequality
works after **any external shift**, without recomputing a Gaussian integral.
The old scalar quadratic alone cannot justify substituting `s*a-v*f`.

For the real-even block write `D=E^{-1}-H`, and define exact rational data

\[
 q=C+h^TD^{-1}h,\quad
 \ell=h+HD^{-1}h,\quad
 K=H+HD^{-1}H.
\]

Completing the square in `m` proves

\[
 \Psi(b)\le q+2\ell^Tb+b^TKb. \tag{1}
\]

The other three blocks have zero forcing and contribute zero to the supremum.
`rankone_analytic_transport.py` checks their positive definiteness as well;
checking only the forced real-even block would be insufficient.

## Exact scalar minimization

Freeze a valid rank-one vector `w`, and use the current row geometry

\[
 A=\delta(e_1+b_{\rm cert}),\quad v=Ew,\quad d=w^TEw>0,
 \quad c=v_1-h_{\rm gate}^TC_{\rm gate}^{-1}v_R.
\]

`h_gate` is the completion vector `E_R1+A_R`, **not** the linear coefficient
`h` of the anchored majorant. Substituting `b=A*r-v*f` in (1), and including
the two rank-one scalar terms, gives

\[
 F(r,f)\le Q_0(r)-2(B_0+B_1r)f+\alpha f^2,
\]

where

\[
\begin{split}
 Q_0(r)&=q+2\ell^TA\,r+(A^TKA)r^2,\\
 B_0&=\ell^Tv,\qquad B_1=A^TKv-c,\\
 \alpha&=d+v^TKv.
\end{split}
\]

Every bank record checks `alpha>0` exactly. Thus the **explicit** affine test

\[
 f_*(r)={B_0+B_1r\over\alpha}
\]

has the globally valid quadratic upper bound

\[
 F(r,f_*(r))\le Q(r):=Q_0(r)-{(B_0+B_1r)^2\over\alpha}. \tag{2}
\]

This does not identify the actual minimizer of the nonlinear potential `F`.
It minimizes a proved quadratic upper majorant and supplies a valid test.
For every other explicit rational test `f`, the same bound is

\[
 F(r,f)\le Q(r)+\alpha(f-f_*(r))^2. \tag{3}
\]

Equation (3) is also the exact error ledger for rounding an endpoint test.
No square root or numerical optimization enters acceptance.

The direct arithmetic checker separately reconstructs each original archived
scalar quadratic from `(q,ell,K)` and verifies equality with all three stored
coefficients and the stored anchor value. It checks the current gate matrices,
the four-by-four L10 matrix by all principal minors, and exact completed-square
fixtures including negative `r` and negative `f`.

## What the banks and node tables certify

`anchor-bank-m14.json` and `anchor-bank-m15.json` each contain 149 archived
global majorants transported by (2). Each record includes its original bundle
hash and result index, full rational quadratic coefficients, and full rational
affine scalar profile. The finite Schur and transport algebra of **every**
record is checked. Apart from individually replayed records, their Gaussian
majorants retain the same inherited status as the existing source certificate.

At any positive `r`, choosing a bank record, or choosing the inherited source
cap with test `f=0`, supplies a deterministic valid test. Consequently one may
choose the least of these bounds on rational cells. This is an upper bound for
`inf_f F(r,f)` and an explicit measurable selection of a test. One may not take
the minimum of shifted *potential values* while forgetting which scalar test
attains the displayed upper certificate.

The endpoint-table builder independently reconstructs the bank from the pinned
original records, includes all old physical source nodes `r=s/delta`, and adds
the regular physical mesh `1/500` through `r=6/5`. It chooses a candidate with
ordinary float comparisons as a proposal only; any selected candidate is valid.
It then evaluates and compares the bound in exact rational arithmetic. No claim
of optimal candidate selection is needed.

Tests at zero and the last source node are set to zero. This handles the usual
convention `phase(0)=0` without any assumption about an atom at zero, and joins
the inherited `f=0` tail. Outside the finite source interval, retain the old
Lipschitz tail in `s=delta*r`; do not extrapolate a finite lifted hull.

For a pair of endpoint tests, the earlier semiconvex lemma still gives a valid
interpolated test and cap

\[
 F(r,f_{\rm lin}(r))\le
 \operatorname{chord}(G_u,G_v)(r)
 +{c^2\over d}(r-u)(v-r),\quad u\le r\le v.
\]

Taking the lower hull of the lifted rational points
`(r,G+(c*c/d)*r*r)` is therefore valid. This source interpolation price is
distinct from a later interpolation in `tau`. Both must be kept if both are
used; direct cell checking can avoid paying two worst-case allowances.

The baseline `original_effective_cap` in each endpoint record already contains
the inherited source `PAD=1e-11` exactly once. There is no justification for
subtracting this pad from a shifted anchor cap, or for adding it a second time
when integrating the already effective cap.

## Localized S-lemma extension

The same transport is available for every localized source piece, provided its
full exact augmented majorant and multipliers are replayed. For a piece whose
added S-lemma polynomial is `-m^T T m+2w0^T m+cst`, use

\[
 D=M^{-1}-H+T,\quad h_0=h+w_0,
\]

\[
 q=C+\mathrm{cst}+h_0^TD^{-1}h_0,\quad
 \ell=h+HD^{-1}h_0,\quad K=H+HD^{-1}H.
\]

These can be full twelve-coordinate matrices. Formula (1) then holds on that
piece; the regions are unchanged because they constrain `m`, not the external
shift. The existing conjugation/odd-sign symmetries preserve all real-even
external shifts, so the original coverage argument still applies.

**The scalar test must be common to every piece at a fixed `r`.** For any fixed
`f`, the source cap is `max_piece Q_piece(r,f)`. Independently minimizing each
piece and then taking their maximum would exchange `min_f` and `max_piece` in
the wrong direction and is not a certificate. Practical choices are to freeze
a rational `f` proposed by the central piece, then exactly evaluate every
piece, or to solve the one-dimensional minimax problem and check a rational
candidate afterward. The original 149-anchor global banks do not include
localized S-lemma inputs. The following additional batch executes this extension.

### Localized extension now executed

Two localized source recipes have now been regenerated:

* Row 14, original source recipe `s=53/200`: all nine S-lemma pieces regenerated
  by `rankone_analytic_localized.py`. At physical `r=1/2`, one shared rational
  test `f=-761311/50000000` gives the exact upper cap `1.506387497104`, improving
  the effective current source chord by more than `0.00013120270`.
* Row 15, original source recipe `s=27/100`: all nine pieces independently
  regenerated by the source-replay task. Its raw augmented interval matrices
  were independently converted by `rankone_analytic_localized_convert.py`.
  At physical `r=(27/100)/delta`, one common test gives improvement
  `0.000104916105` over the current effective source cap. A further independent
  check compares the two transport implementations on 27 exact fixtures; all
  pass (`../replay/localized-row0855-cross-transport.json`).

The recipe's source coordinate fixes the positive cell prices and S-lemma
multipliers. It does **not** restrict where the resulting quadratic in external
shift is valid. Each regenerated piece therefore supplies a globally valid
bivariate source cap on its original coefficient region, for every physical
`r` and every real `f`. At a desired source node, choose one common rational `f`
and compute the maximum of all nine exact piece quadratics. No new Gaussian
integration is required for additional source nodes.

The merged tables `source-nodes-m14-localized.json` and
`source-nodes-m15-localized.json` apply this on the physical mesh `1/500` in
`[0.35,0.8]`, retaining the best previously certified endpoint elsewhere. Each
still has 996 explicit endpoint tests. The localized bank adds 26 improved
row-14 nodes and 23 improved row-15 nodes. The largest *additional* point gains
are approximately `2.20310e-4` and `1.64426e-4`. These are source-node
improvements, not whole-law or Grothendieck-bound improvements.

Both archived moment tables, with 1600 radial cells and respectively 256 and
1024 angular cells, were independently regenerated with the original
`check_moments.py` and found exactly equal. The scalar/polar/S-lemma/symmetry
proofs behind the executable certificates remain the paper mathematics
described above.

The merged builder independently reconstructs its 149-anchor base bank and
base table, authenticates all pinned localized input files, proposes one test
from the finite list of scalar-piece vertices and pairwise intersections, then
evaluates the maximum over all pieces in exact fractions. The float proposal
need not be optimal for validity.

```sh
python3 -I tools/rankone_analytic_localized_nodes.py \
  --base handoff/research-third-decimal/rank-one-certification-20261023/analytic/source-nodes-m14.json \
  --localized handoff/research-third-decimal/rank-one-certification-20261023/analytic/localized-m14-r050.json \
  --out handoff/research-third-decimal/rank-one-certification-20261023/analytic/source-nodes-m14-localized.json --check
```

## Common-row mixtures without new Gaussian integrals

For weights `lambda_i>=0`, summing to one, average the true-scale coupling
vectors and matrices: `Mbar=sum lambda_i*M_i`, `Abar=sum lambda_i*A_i`,
`Ebar=sum lambda_i*E_i`, `Lbar=sum lambda_i*L_i`. With **one shared response
coordinate vector** `y`, the two affine arguments of the support integral are
the corresponding averages of the row arguments. Convexity of complex modulus
therefore gives

\[
 \Psi_{\rm bar}(A_{\rm bar}r-E_{\rm bar}wf)
 \le \sum_i\lambda_i\Psi_i(A_i r-E_iwf). \tag{4}
\]

The quadratic penalty `y^T Mbar y` is the same average, and after the pointwise
inequality one uses `sup_y sum <= sum sup_y`. Averaging certificate theta first
and then computing `delta*(e1+b)` would give a different `A` and is invalid.

Choose one full-space pure-row majorant `(q_i,ell_i,K_i)` per row, all evaluated
using the **same** `w`. Put `v_i=E_iw`, compute `cbar` from the actual common
completion and `dbar=w^T Ebar w`. The weighted source upper polynomial has

\[
\begin{split}
 Q_0(r)&=\sum_i\lambda_i
  (q_i+2\ell_i^TA_i r+A_i^TK_iA_i r^2),\\
 B_0&=\sum_i\lambda_i\ell_i^Tv_i,\\
 B_1&=\sum_i\lambda_iA_i^TK_i v_i-c_{\rm bar},\\
 \alpha&=d_{\rm bar}+\sum_i\lambda_i v_i^TK_i v_i.
\end{split}
\]

If `alpha>0`, formula (2) applies unchanged. This is a useful certification
route for box-dependent common mixtures. The L10 condition is needed for the
common `Ebar,w`, rather than for each individual `E_i,w`. The already minimized
pure-row bank polynomials cannot be averaged if they use different profiles;
one must combine the full `(q_i,ell_i,K_i)` data before minimizing one shared
scalar test.

## Replay commands

From the repository root (all tools also accept absolute paths and work under
`python3 -I` from another directory):

```sh
python3 -I tools/rankone_analytic_transport.py --row 0.85 --r 3/20 \
  --bank-out handoff/research-third-decimal/rank-one-certification-20261023/analytic/anchor-bank-m14.json \
  --out handoff/research-third-decimal/rank-one-certification-20261023/analytic/transport-m14-r015.json

python3 -I tools/rankone_analytic_nodes.py \
  handoff/research-third-decimal/rank-one-certification-20261023/analytic/anchor-bank-m14.json \
  --out handoff/research-third-decimal/rank-one-certification-20261023/analytic/source-nodes-m14.json --check
```

Add `--replay` to the transport tool to regenerate its selected original anchor
using exact Gaussian moments. The separate source replay has already done this
for the winning row-14 point above. Repeat with row `0.855` and label `m15` for
the neighboring row. Both finite tools reject Python `-O`/`-OO`.
