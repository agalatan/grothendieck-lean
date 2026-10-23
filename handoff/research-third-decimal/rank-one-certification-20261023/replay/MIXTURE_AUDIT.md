# Generalized mixture rank-one lemma: independent algebra audit

The proposed one-active-row mixture is sound at the paper-algebra level.
It does **not** require an identity `d=w^T E w` for one common w. The
sufficient hypotheses are

```
E > 0, C = E_RR > 0,
d >= v^T E^-1 v,
[ S  -v ] >= 0,     S = E - diag(-1,epsilon,epsilon).
[ -v^T d ]
```

Here v is any real three-vector and d is any positive scalar. For the
one-active-row construction, all these follow from the inherited per-row
gates and the active row's exact rank-one checks. The common pinned
completion, and therefore the existing common D, remain unchanged.

This note audits the finite-dimensional/Hilbert-space algebra underlying
Step 22 of `attack-20261022/NOTES.md`, items 1 and 5, and the formulas in
`attack_analysis.tex`. It does not independently prove the existing
pre-square Gaussian response identity or its extraction from unimodular
responses. Those existing analytic premises remain necessary.

## 1. Why an enlarged d is permitted in the Young step

Let Pi be the orthogonal projection onto the complement of the remote
H10 and H21 sectors. For a scalar test phi in L2, define

`F = E^-1*v * phi`,  `d_eff = v^T E^-1 v`.

Orthogonal projections act on the scalar functions and commute with the
constant real matrices. Young's inequality gives

`-||Pi xi||_E^2 <= -2 Re <xi,v phi>
 + 2 Re <P10 xi,v P10 phi> + 2 Re <P21 xi,v P21 phi>
 + d_eff ||Pi phi||^2`.

If `d>=d_eff`, replacing the last term by `d ||Pi phi||^2` increases
the right side. Now use orthogonality to write it as

`d ||phi||^2 - d ||P10 phi||^2 - d ||P21 phi||^2`.

Thus d is the coefficient of the total pointwise price **and** of both
subtracted low-sector prices. This step explains why it is legitimate
to use the weighted d even when no single w satisfies simultaneously
`v=Ew` and `d=w^TEw`. Replacing only some of these three coefficients
without this argument would be unjustified.

## 2. L10 with general v,d

Write X=P10 xi and Phi=P10 phi. The H10 remainder is

`-<X,SX> + 2 Re <X,v Phi> - d ||Phi||^2`.

It is nonpositive for every leakage X,Phi precisely when the displayed
4 by 4 L10 block is PSD. This formulation needs no inverse of S and
therefore remains valid for singular pure-row gates. A real PSD block
acts positively on complex Hilbert-valued vectors as well, by applying
its quadratic form to real and imaginary scalar components (or using a
PSD factorization).

## 3. L21 and the retained common completion

Partition

```
E = [ e n^T ],     h = n + A_R,
    [ n  C  ]
```

where A is the true-scale coupling of the actual common mixture. Let
`q` have norm one, `p=tau*q`, and decompose

`P21 phi = kappa*q + G`,  `<G,q>=0`.

The pinned first H21 coordinate is p; write the remaining two coordinates
as Y. Starting with the **same** retained square as in the original row,

`-||Y+C^-1*h*p||_C^2`,

add the H21 correction

`2 Re <p,v0 P21 phi> + 2 Re <Y,v_R P21 phi>
 - d ||P21 phi||^2`.

Completing the Y-square is an exact identity. With `H=P21 phi`, its sum
is

```
-||Y+C^-1*h*p-C^-1*v_R*H||_C^2
+ 2*tau*Re(kappa)*(v0-h^T*C^-1*v_R)
+ (v_R^T*C^-1*v_R-d)*(|kappa|^2+||G||^2).
```

Consequently the general L21 remainder is

`2*tau*Re(kappa)*c + rho*(|kappa|^2+||G||^2)`,

where

`c=v0-h^T*C^-1*v_R`,  `rho=v_R^T*C^-1*v_R-d`.

The original pure-row identity
`rho=-s_E*w0^2` is a useful special case, not a required hypothesis.
Indeed, with `s_E=e-n^T*C^-1*n>0`, the block inverse identity gives

`v^T*E^-1*v = v_R^T*C^-1*v_R
 + (v0-n^T*C^-1*v_R)^2/s_E`.

Thus `d>=v^T E^-1 v` implies `rho<=0`. The rho term may safely be
dropped. Equivalently, the principal submatrix `[C,v_R;v_R^T,d]` of
the PSD block `[E,v;v^T,d]` gives the same conclusion without using
the explicit inverse identity.

In the notation of the original Step 22 identity, define
`w_eff=E^-1*v`. Then precisely

`rho=-s_E*w_eff,0^2-(d-d_eff)`.

The larger weighted d contributes an additional nonpositive remainder;
it does not introduce a term of unknown sign.

The common h and C above are crucial. Substituting a pure row's h,C
would change the law-linear q term. The original common D is retained:
this calculation starts from its existing Y-square and changes only
the test correction, not the original completion constant.

For `phi(q)=f(tau*|q|)*q/|q|` with real f and f(0)=0, the q term is
law-linear:

`2*tau*c*Re(kappa) = E[2*c*r*f(r)]`, `r=tau*sqrt(U)`.

## 4. Weighted gates and the one-active-row construction

Let weights lambda_i be nonnegative and sum to one. Set

`Ebar=sum lambda_i E_i`, `Sbar=sum lambda_i S_i`,
`Abar=sum lambda_i A_i`, `Cbar=Ebar_RR`,
`hbar=Ebar_R0+Abar_R`.

For an active row choose its already accepted `(v_i=E_i*w_i,
d_i=w_i^T*E_i*w_i)`; for an inactive row put `v_i=0,d_i=0`.
Then

`vbar=sum lambda_i v_i`, `dbar=sum lambda_i d_i`.

The common L10 block is exactly the weighted sum of the per-row blocks
`[S_i,-v_i;-v_i^T,d_i]`. Every active block is PSD by its rank-one
check, and every inactive block is `diag(S_i,0)>=0`. Hence the common
L10 condition holds.

Likewise every block `[E_i,v_i;v_i^T,d_i]` is PSD: for an active row its
Schur complement is zero, while for an inactive row it is block diagonal.
Their weighted sum is `[Ebar,vbar;vbar^T,dbar]>=0`. Since Ebar is positive
definite, its Schur complement gives

`dbar>=vbar^T*Ebar^-1*vbar>=vbar_R^T*Cbar^-1*vbar_R`.

This proves both the general Young hypothesis and the sign of the
discarded L21 coefficient. It is the matrix-fractional convexity
argument in an explicit PSD-block form.

For exactly row 15 active with weight lambda and row 12 inactive,

`vbar=lambda*v15`, `dbar=lambda*d15`,
`cbar=lambda*c_box15`,
`c_box15=v15_0-hbar^T*Cbar^-1*v15_R`.

There is no hidden common-w requirement.

## 5. Splitting the common shifted potential into source potentials

Use one shared fibre dual variable y. The affine arguments for the
common response are weighted averages of the source arguments:

`Mbar*y+Abar*r-vbar*f =
 sum lambda_i*(M_i*y+A_i*r-v_i*f)`.

Also Lbar is the corresponding weighted average of the source L_i,
and `y^T Mbar y=sum lambda_i y^T M_i y`. Convexity of each complex
modulus therefore bounds the common support integrand by the weighted
sum of the source support integrands, pointwise. Integrating, then using
`sup_y sum <= sum sup_y`, yields

`Psi_bar(Abar*r-vbar*f) <=
 sum lambda_i Psi_i(A_i*r-v_i*f)`.

No min/sup interchange occurs. The inactive row's shift is zero. After
adding the common price, the one-active-row upper integrand is

```
(1-lambda)*Psi12(A12*r)
+ lambda*[Psi15(A15*r-v15*f)+d15*f^2+2*c_box15*r*f].
```

This uses the same scalar f in the common test and the active source.
True-scale A_i must be averaged directly; computing `delta*(e1+b)`
from averaged theta would give the wrong common coupling.

## 6. Repricing an already generated pure-row bank

A pure row-15 bank was integrated and completed with coefficient c15.
Its exact bivariate piece cap has the form

`Q15(r,f)=q(r)-2*(b0+b1*r)*f+alpha*f^2`,

including `d15*f^2+2*c15*r*f`. For the actual mixture it becomes

`Q15_box(r,f)=Q15(r,f)+2*(c_box15-c15)*r*f`.

All Gaussian majorants, localization cells, matrices, and LDL pivots
are unchanged. The correction changes `b1` to
`b1-(c_box15-c15)`. It must be applied **before** selecting one common
f and taking the maximum over all localized pieces. Using a pure-row
already minimized cap without repricing its retained f is invalid.

The semiconvex coefficient changes too:

`A15_box=c_box15^2/d15`,
`Acommon=cbar^2/dbar=lambda*A15_box`.

The source lift/hull and any later tau allowance must use this new
coefficient (or a proved larger bound). The old pure coefficient
`c15^2/d15` cannot be silently retained when c_box15 has increased.
The exact numerical c correction and all mixture PSD conditions should
be verified by the root's rational repricing tool; this note supplies
the algebraic justification, not independent numerical acceptance of
those mixture weights.

## Audit outcome

The generalized lemma is valid under the stated PSD hypotheses and
the inherited pre-square response identity. The one-active-row
weighted construction supplies those hypotheses. No domination
conjecture, equality `dbar=w^T Ebar w`, or new Gaussian integral is
required. The implementation obligations are to use the actual common
hbar,Cbar, reprice the linear q term before minimax selection, and
recompute the semiconvex lift coefficient. A full law/box/endpoint
certificate remains a separate task.
