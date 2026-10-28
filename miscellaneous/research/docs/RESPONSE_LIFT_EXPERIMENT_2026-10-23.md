# Shared-response lift: a completed falsification experiment

23 October 2026. Implementation branch `work/shared-response-oct23`.
Repository history only; no other chats were inspected. The original checkout
was not edited. **Neither Grothendieck endpoint changes.**

The proposed multiplication-compression attack has now been tested with free
omitted companions. The experiment has three checkable outcomes:

1. At all twelve audited certificate contacts, both tested finite lifts have
   **exact minimum zero** for the selected projection penalties. Twenty-four
   rational feasible completions establish this, independently of SDP accuracy.
2. The finite lifts really omit joint bounded-response information: for saved
   abstract law **5661**, a rigorous support-function separator forces those
   penalties to exceed **`1.39e-8`** at its fixed contact.
3. That information does not supply a uniform correction over the saved radial
   relaxation. For saved abstract law **7234**, an **explicit actual bounded
   response pair** matches all five selected target moments exactly. Its norm
   is certified below **`1999/2000`**. Thus even a complete bounded-response
   description of these selected moments admits this law's zero-cost target.

The last statement concerns a response on an abstract probability space with
the saved radial law. It does **not** realize that law by a Gaussian cubic,
make the full discarded projection squares zero, attain a fibre supremum,
or construct an upper-bound rounding kernel.

## 1. What the finite optimization actually tests

Let `Z` be a standard proper complex Gaussian, `R=|Z|²`, and `q` an independent
circular remote variable with `E|q|²=1`. For an actual cubic application, `q`
is the normalized remote cubic. Put

\[
 V_j^a(R)=(-1)^j L_j^a(R),\qquad C_j=\binom{j+2}{2}.
\]

For a response `v`, retain the real slice of its coordinates

\[
 m_j=\mathbb E[v\bar Z V_j^1],\quad
 b_j=\mathbb E[v\bar q V_j^0],\quad
 n_j=\mathbb E[vq\bar Z^2 V_j^2/\sqrt2].
\tag{1}
\]

The last coordinate is conjugate to the manuscript's corresponding gate
coordinate. This distinction matters for complex extensions; it disappears
for the real targets and profiles certified here. The three feature families
in (1) are mutually orthogonal. Consequently

\[
 \sum_j\frac{|m_j|^2}{j+1}+\sum_j|b_j|^2
       +\sum_j\frac{|n_j|^2}{C_j}\le1.
\tag{2}
\]

Write `h=(f+g)/2`, `k=(f−g)/2`. For each exact ledger, fix
`m0(h)=t` and `b0(k)=tau`. Let `alpha=(alpha1,alpha2)` be the pinned gate's
minimizing ratios and `C=[[a,b],[b,c]]` its positive definite trailing matrix.
The nonnegative **selected projection** of the original dropped cost is

\[
 D_{\rm proj}=
 \frac\varepsilon2|m_1(h)+2\beta/\varepsilon|^2
 +\varepsilon|b_0(h)|^2
 +\|(b_1(k)-\alpha_1\tau,\ n_0(k)-\alpha_2\tau)\|_C^2.
\tag{3}
\]

Here `epsilon=149/200`. The original full square cost is at least (3).
Equation (3) keeps projections of fields, not their full conditional values.
In particular, zero in (3) does not make the full gate square vanish.

For every bounded response, multiplication is a contraction. The finite model
compresses it in three charge sectors, with `0<=i,j<=r`:

- Output `V_i^0`; inputs `barZ V_j^1`, `barq V_j^0`,
  `q barZ² V_j²/sqrt2`.
- Output `Z V_i^1`; inputs `V_j^0`, `sqrt2 q barZ V_j^1`,
  `barq Z V_j^1`.
- Output `Z² V_i²`; inputs `Z`, `sqrt2 q V_j^0`, `Z² barq V_j²`.

If their Gram diagonals are `Gout,Gin` and their cross matrix is `X`, impose

\[
 \begin{pmatrix}G_{\rm out}&X\\X^*&G_{\rm in}\end{pmatrix}\succeq0.
\tag{4}
\]

All products are expanded exactly in the associated Laguerre bases. Apply (2)
and (4) separately to the **same** `f=h+k` and `g=h−k`. No missing coefficient
is set to zero by the model. Order two retains `m0,...,m4`, `b0,...,b6`,
and `n0,...,n4`, including response degrees through fifteen.

We also imposed the stronger remote-only compressions obtained from the
conditional two-channel profile `(E[v barq|Z], E[v q|Z])`, whose Euclidean norm
is at most `E|q|`. This follows from circular-phase Parseval and Minkowski.
Their radius is the existing cap `rho=0.973612157`; the visible-only input
bank is removed and `Gout` in (4) becomes `rho² Gout`.

## 2. Exact finite-lift outcome and controls

For orders one and two, all twelve contacts
`1247,3102,3661,4297,4850,5387,5661,6361,7234,7415,7894,8701`
admit rational zero-cost completions. The checker verifies every fixed target,
coefficient length, energy budget, and positive semidefinite Schur complement.
There are **288 exact PSD checks**, counting both responses, three charge
banks, and their stronger conditional versions.

The largest displayed energy is about `.946694` at order one and `.980463`
at order two. The smallest Schur pivot is respectively above `.0334009` and
`.0141694`. These are diagnostics; exact rational comparisons establish the
result. Because (3) is nonnegative, a feasible point of cost zero proves the
finite minimum exactly, without trusting the solver's optimality declaration.
One discovery solve reported `optimal_inaccurate`; its rational certificate
passes the same exact checker as the other twenty-three.

The implementation was checked against actual bounded Gaussian responses,
including the conjugate sector, using `q(W)=W(|W|²−2)/sqrt2`. A separate sparse
Gaussian-monomial implementation checks **377 Gram entries and 354 response
entries**, without using the model's Laguerre product extraction. A further
123 exact polynomial and response controls pass.

The constraints are active. For example, remote coefficients `(b0,b1)=(.8,.3)`
have an order-one completion of total energy `1457/1600<1`, but order two,
optimizing every remaining `b2,b3,b4`, forces the exact minimum

\[
 \min\sum_{j=0}^4 b_j^2=6763201/3686400>1.
\]

A rational feasible point and matching positive semidefinite dual certify
that minimum. Sixteen visible-head control problems also have rational primal
and dual enclosures; e.g. at `m0=.85`, the order-two minimum of cubic plus
quintic visible energy lies between `.07345461255275` and `.07345503367635`.
These are control problems, not additional recoveries for the binding witness.

## 3. The exact fixed-law support problem

Give the saved radial law an actual probability-space realization:
`q=s exp(iTheta)`, where `s` has the saved rational atomic distribution,
`Theta` is uniform, and `q` is independent of `Z`. This is always possible;
being a Gaussian cubic is a separate restriction. Define

\[
 \phi=(Z,\ Z(R-2),\ q,\ q(R-1),\ Z^2\bar q/\sqrt2),\qquad
 c=(t,-2\beta/\varepsilon,\tau,\alpha_1\tau,\alpha_2\tau).
\]

For real `y`, the support of the projected two-response moment body is exactly

\[
 S_\nu(y)=\mathbb E\left|\sum_{j=0}^4y_j\phi_j\right|.
\tag{5}
\]

Indeed split `P=A+B` into the terms even and odd in `q`. For arbitrary disk
responses, the relevant payoff is bounded by
`(E|A+B|+E|A−B|)/2=E|A+B|`. Equality is attained by
`f=phase(A+B)`, `g=phase(A−B)`. Conjugation symmetry makes real separating
functionals sufficient for the real target `c`. The body is compact and
convex, so `c` belongs to it exactly when `y.c<=Snu(y)` for every real `y`.

This support problem is convex; it makes no small-coordinate or marginal
description claim for a general cubic. It fixes one abstract law and keeps
actual bounded responses on that law.

### 5661: a rigorous separator, with a small quantitative recovery

The saved rationalized direction is approximately

\[
 y=(1.034757107,-.0942356414,.332829751,-.0343108951,.0519104686).
\]

Arb ball arithmetic proves

\[
 S_\nu(y)<.99998,\qquad y\cdot c=1+O(10^{-17}),
\]

where the second quantity is an exact rational in the checker, not a rounded
normalization. The actually computed upper enclosure is
`.99997923745688672888985943006722` with radius below `6e-33`.

This is a rigorous upper sum, not an unchecked quadrature estimate. Partition
`sqrt(R)` into 512 cells through six and the phase into 1024 cells. In every
cell use
`integral |P| <= sqrt(cell_mass * integral |P|²)`.
The squared polynomial has only phase harmonics zero, one and two; their cell
integrals are analytic, as are the integer and half-integer radial moments.
The entire omitted tail `R>=36` is bounded by Cauchy--Schwarz; it contributes
less than `3.23e-15`. The sum uses 128-bit outward ball arithmetic.

Let `d=y.c−.99998>0`. Weighted Cauchy--Schwarz gives, for every response pair
under this fixed law with the fixed `t,tau`,

\[
 D_{\rm proj}\ge
 \frac{d^2}{2y_1^2/\varepsilon+
        (y_3,y_4)C^{-1}(y_3,y_4)^{\mathsf T}}
 >1.39\,10^{-8}.
\tag{6}
\]

Thus the finite lift misses a real obstruction here. But (6) is tiny relative
to the roughly `1.55e-4` cap reduction associated with the proposed `1.402`
target, and it is valid only for one law and one contact of the current
`epsilon=.745` witness. It is not a uniform correction or a comparison theorem
for the proposed different witness. The actual best recovery might be larger;
(6) does not determine it.

### 7234: an explicit bounded response survives the full five-moment test

A stronger negative control is now certified. Partition `sqrt(R)` into 64
cells through six and phase into 128 cells. For every atom and cell, integrate
the five feature functions exactly, factoring out the global phase of `Z`.
Let the resulting cell vector be `Phi`. Select the cell response

\[
 F=\operatorname{phase}(y\cdot\Phi),\quad
 y\simeq(1.469288893,.706601846,.217281947,.193155174,.059377982).
\]

The certificate stores rational `y`. Set the response to zero beyond `R=36`.
The cell response has norm one and is explicitly measurable. With the exact
rational `lambda=1.0006737931717606`, divide it by `lambda`. Its five moment
errors are bounded in absolute value by `1.70e-9`.

They can be repaired **exactly**, not just within numerical tolerance. Put
`delta=c−moments(F/lambda)` and add `e^(−R) sum_j a_j phi_j`, where

\[
 a_0=12\delta_0+8\delta_1,\quad a_1=8\delta_0+8\delta_1,\quad
 a_2=4\delta_2+4\delta_3,\quad a_3=4\delta_2+8\delta_3,\quad
 a_4=8\delta_4.
\tag{7}
\]

To verify (7), the moment Gram `E[e^(−R) barphi_i phi_j]` is block diagonal,
with blocks `[[1/4,−1/4],[−1/4,3/8]]`,
`[[1/2,−1/4],[−1/4,1/4]]`, and `[1/8]`. Its inverse gives (7).
All cross blocks vanish by circular symmetry. Only `E|q|²=1` is needed.

The correction is bounded by

\[
 |a_0|+2|a_1|+s_{\max}(|a_2|+|a_3|+|a_4|)<1.71\,10^{-7}.
\]

For these elementary feature bounds, `sqrt(R)e^(−R)<1/2`,
`R^(3/2)e^(−R)<1`, `|R−1|e^(−R)<=1`, and `Re^(−R)<=1` suffice.
The final response norm is below `.999326832`, hence below `.9995`.
All quantities involving the cell integrals and correction are enclosed by
Arb; the exact correction is defined by the actual integrals enclosed there.

Take `g(Z,q)=f(Z,−q)`. Even and odd projections give precisely the five
targets, and `b0(h)=0`. Thus (3) is **exactly zero for an actual disk response
pair** on this abstract law. These responses satisfy every valid boundedness
compression, at every order, not merely the finite matrices in section 1.

This does not make the full discarded squares zero: the untested components
of the conditional gate and cubic fields remain. It also says nothing about
attaining the fibre potential or the stored table score.

## 4. What to pursue next

The two enrichments falsify a positive-recovery claim for this finite selected
penalty lift. The 7234 construction explains why simply taking that same
five-moment boundedness idea to completion is insufficient. The 5661 separator
shows that joint response information is real, while also quantifying how
small this particular recovered term can be.

Rank the next steps as follows:

1. **Price the joint fibre deficit and full conditional fields together.**
   The decisive lemma would lower-bound their *sum* uniformly near binding
   contacts, rather than each projected square separately. Retain at least
   the conditional functions `E[k(R−1)|q]`, `E[k barZ²/sqrt2|q]` and the common
   response across mixed rows. First falsification: optimize that joint cost
   for the same 7234 abstract law. A surviving near-fibre-maximizing pair would
   demonstrate that actual cubic geometry, not additional response moments,
   is necessary. The explicit response above is a feasible control, not an
   asserted near-fibre maximizer. No uniform lemma has been proved here.
2. **Use identities specific to a remote cubic tensor.** Such an identity must
   exclude or quantitatively penalize a surviving law/conditional response,
   with its coupling to the linear sector retained. First test the proposed
   identity on the 7234 artificial law and the existing influential
   `X G2` limits and coupled Wick controls. A scalar moment consequence already
   satisfied by these saved laws does not address the obstruction.

Higher chaos remains necessary for an advance beyond the numerical cubic
ceiling, but the present experiment supplies no evidence that a longer witness
alone removes these feasibility losses. It should be tested with the same
joint-response diagnostics before investing in another global row cover.

## 5. Proof status and reproduction

The finite-lift and control certificates use exact rational Python arithmetic.
The two abstract-law results combine the analytic identities above with
128-bit outward Arb ball computations, via `python-flint==0.9.0`.
They are **external computational certificates**, not completed Lean theorems.
The prior generic Lean multiplication-compression results are unchanged.
No numerical source potential, global cover, or Grothendieck endpoint is
recertified or strengthened.

All targets and radial supports are bound by SHA-256 to the full unchanged
binding audit and original radial artifacts. The deliverable bundle includes
those inputs, certificates, replay scripts and logs. From its root:

```sh
python3 -I tools/verify_response_lift.py response-lift-completions.json --audit inputs/binding-audit.json
python3 -I tools/verify_response_lift_banks.py
python3 -I tools/verify_response_completion_controls.py tools/response_completion_controls.json
python3 -I tools/verify_abstract_response_support.py tools/abstract_response_support_5661.json --audit inputs/binding-audit.json --law inputs/radial-complete-5661-exact.json
python3 -I tools/verify_abstract_response_realization.py tools/abstract_response_realization_7234.json --audit inputs/binding-audit.json --law inputs/radial-complete-7234-exact.json
```

Only the final two commands need python-flint. Discovery uses CVXPY or
NumPy/SciPy separately. Replaying the saved certificates needs no optimizer.


## Follow-up: joint fibre experiment, 23 October 2026

See `JOINT_FIBRE_EXPERIMENT_2026-10-23.md` for the completed next test. The
conditional gate acts on cubic **projections**, and a free-projector model
has an exact rank-one ceiling (now proved in Lean). At saved law 7234 the
full-coordinate joint response problem has an externally certified bracket
`.7131526 < optimum <= .713261364`, and its deficit against the common fibre
potential is greater than `.000093136`. The remaining uniform-law and actual
cubic-projection obligations prevent any Grothendieck endpoint update.
