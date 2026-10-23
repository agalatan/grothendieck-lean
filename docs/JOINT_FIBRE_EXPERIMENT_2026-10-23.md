# Joint fibre and projected-field experiment

23 October 2026. Integration branch `work/shared-response-oct23`.
Repository history only; no other chats were inspected. The original checkout
was read without modification. **Neither Grothendieck endpoint changes.**

This experiment pursues the next test identified by the preceding
`RESPONSE_LIFT_EXPERIMENT_2026-10-23.md`: price the common response's fibre
deficit together with the retained projection costs, starting with saved
abstract radial law 7234 and its exact contact

\[
 t=1699/2000=.8495,\qquad
 \tau=1005741358181/4096000000000,
 \qquad\varepsilon=149/200.
\]

The main diagnosis is more precise than “keep more conditional moments.” The
gate acts on **cubic projections** of conditional fields. Leaving that
projection free has an exact ceiling, now proved in Lean. In the remaining
valid joint model, selected-moment prices reoptimize the existing source
row's forcing and coupling. Full fibre sections also have profitable branches
outside the three real coordinates used by the initial numerical search.
They must be retained individually or as latent mixtures.

The global fixed-law replay also certifies a joint deficit greater than
`.000093136` against the common fibre potential (section 6).

The completed constructive result is an actual bounded randomized response
under law 7234, with the exact contact repaired analytically, whose relaxed
score is rigorously enclosed near **`.7131527063190012`**. This is a feasible
value, hence a **lower bound on the fixed-law relaxed supremum**. It is not an
upper bound, a Gaussian-cubic realization, or a new Grothendieck witness.

## 1. Correcting the projected-field interface

Let `Z` be a standard proper complex Gaussian, `R=|Z|²`, and `Y` the remote
variable. For `h=(f+g)/2`, `k=(f−g)/2`, write

\[
 c_0(Y)=\mathbb E_Z k,\quad
 c_1(Y)=\mathbb E_Z[(R-1)k],\quad
 e_3(Y)=\overline{\mathbb E_Z[\bar Z^2k/\sqrt2]}.
\]

In the actual Gaussian reduction, with `Π=Π_{H_{2,1}}`, the shared residual
and gate fields are

\[
 p=\Pi c_0=\tau q,\qquad X_2=\Pi c_1,\qquad X_3=\Pi e_3.
\tag{1}
\]

These are the definitions `pres`, `X2e`, `X3e` in
`Grothe/LowerAnalytic/RowGaussian.lean`. They are not the raw fields `c1,e3`,
nor are they generally their conditional expectations given `q`.

For a positive definite gate `C` and its minimizing ratios `α`, the source
Schur remainder is

\[
 \mathbb E\|(\Pi c_1-\alpha_1p,\Pi e_3-\alpha_2p)\|_C^2.
\tag{2}
\]

Replacing the projected fields in (2) by raw conditional fields increases a
norm in an uncontrolled way. It is an invalid strengthening, even for actual
bounded Gaussian responses.

### An actual Gaussian counterexample at positive remote scale

For an independent proper Gaussian `W`, put `S=|W|²` and

\[
 q=W(S-2)/\sqrt2,\quad
 g_0=W(1-2S)e^{-S}/3,\quad a=(R-1)e^{-R},
 \qquad k=(We^{-S}+a g_0)/2.
\]

Take `f=k`, `g=−k`, so `h=0`. The elementary bounds
`sqrt(S)e^(−S)<=1/2`, `S^(3/2)e^(−S)<=1` and `|a|<=1` give
`|g0|<=5/6` and the safe response bound **`|f|,|g|<=2/3`**.
The exact exponential-moment formula gives

\[
 \|q\|_2^2=1,\quad\langle q,g_0\rangle=0,\quad
 \|g_0\|_2^2=1/81,\quad
 p=-q/(8\sqrt2),\quad\|p\|_2^2=1/128,
 \quad c_1=g_0/8,\quad e_3=0.
\]

The one-remote-coordinate cubic space is spanned by `q`. Thus `Πc1=0`, and
the raw-field substitution adds exactly **`C11/5184`** to (2). Cross terms
with `p` vanish. This example has positive `τ`; the discrepancy is not an
artifact of the degenerate zero-residual case. The rational controls check
all displayed moment identities. The disk bound is an elementary analytic
argument; this explicit counterexample is not a new Lean theorem.

## 2. A proved ceiling for a free common projector

In a complex Hilbert space, let `q` be unit, `τ=⟨q,c0⟩`, and let `Π` range
over orthogonal projections satisfying `Πq=q`, `Πc0=τq`. For arbitrary
conditional fields `c1,e3`,

\[
\begin{split}
\min_\Pi\|(\Pi c_1-\alpha_1\tau q,
                  \Pi e_3-\alpha_2\tau q)\|_C^2
={}&\|(\langle q,c_1\rangle-\alpha_1\tau,
       \langle q,e_3\rangle-\alpha_2\tau)\|_C^2.
\end{split}
\tag{3}
\]

To prove the lower bound, write the positive gate in Cholesky form and use
`⟨q,Πv⟩=⟨q,v⟩`, followed by Cauchy–Schwarz in each square. One **common**
minimizer attains equality for every retained field:

\[
 \Pi v=\langle q,v\rangle q.
\]

It also has the required action on `c0`. Additional nonnegative projected
`h`-field costs reduce to their scalar `q` moments by the same minimizer.
Thus knowing the entire conditional-field Gram cannot improve this
gate-only model while the projector remains otherwise free.

Prescribing rank alone does not remove the ceiling in a sufficiently large
ambient space: append directions perpendicular to every retained field.
This is an analytic observation, not a claim that the appended projection is
a Gaussian cubic projection. The actual cubic projector is tied to a fixed
Gaussian grading, tensor structure, and other projections; those restrictions
are absent from (3).

`Grothe/LowerAnalytic/ProjectionGateCeiling.lean` proves the generic Hilbert
space lower bound and common rank-one attainment, including self-adjointness,
contraction, idempotence and the prescribed `c0` image. The eleven audited
theorems compile with only `propext`, `Classical.choice`, and `Quot.sound`.
They use no added axiom, `sorry`, or native computational fact. This is a
completed generic Lean result; Gaussian extraction and a stronger endpoint
are not its conclusions.

## 3. The valid joint cost and its exact cancellation

Average the source rows **before** taking a fibre supremum. With their exact
weights `wi`, define

\[
 \bar M=\sum_iw_iM_i,\quad
 \ell=\sum_iw_i\ell_i,\quad\beta=\sum_iw_i\beta_i,
 \quad A=\sum_iw_i\delta_i(1+b_{i1},b_{i2},b_{i3}).
\]

It is `M` that is averaged, not `M^{-1}`. Let `K` be the packed six-complex
coefficient vector of `k`, with even fields `ξ=(c0,c1,e3)` and odd fields
`ζ,d`. The common pre-supremum expression is

\[
 F=\mathbb E[K^*\bar M K]
  +2\Re\mathbb E[\overline{Z(\ell+\beta(R-2))}h]
  +2\tau\Re\langle q,A\cdot\xi\rangle.
\]

The mixed-row base is

\[
 B_0=t^2-2\ell t+2\beta^2/\varepsilon-D_{\rm price}\tau^2.
\]

Write `m1=E[h barZ(R−2)]`, `bh=E[h barq]`, and `gj=⟨q,ξj⟩`. Keep
`E[h barZ]=t`, `g0=τ`. The valid selected remainder is

\[
 D_{\rm sel}={\varepsilon\over2}|m_1+2\beta/\varepsilon|^2
       +\varepsilon|b_h|^2
       +\|(g_1-\alpha_1\tau,g_2-\alpha_2\tau)\|_C^2.
\tag{4}
\]

The third gate coordinate is `g2=conj(n0)` for
`n0=E[k q barZ²/sqrt2]`. They have the same real part, but opposite imaginary
parts. This conjugation is necessary in complex extensions.

Let `ξ_perp=ξ−qg`, using `E|q|²=1`. Exact completion of the source squares
then gives

\[
\boxed{\ B_0+F-D_{\rm sel}
 =t^2-{\varepsilon\over2}|m_1|^2-\varepsilon|b_h|^2
    +\varepsilon\tau^2
    +\mathbb E[\xi_\perp^*\bar E\xi_\perp]
    +\mathbb E[\zeta^*\bar R\zeta]+\varepsilon\mathbb E|d|^2.\ }
\tag{5}
\]

This holds in the full complex space. The proof splits `ξ=qg+ξ_perp`;
the gate cancels the entire `g_rest` quadratic and cross terms. The beta
completion cancels as well. The replay has **121 exact rational controls**,
including full complex examples and the Gaussian counterexample above.

Equation (5) explains what this relaxation can still exploit: branchwise
conditional residual covariance and odd-sector energy. Keeping only mean
coefficient vectors would erase some of those positive terms.

### The dual is a reoptimization of forcing and coupling prices

Let `e=(E12,E13)` and `C` be the trailing block of `Ebar`. The exact pinned
identities are

\[
 h=e+A_{\rm rest},\quad\alpha=-C^{-1}h,\qquad
 D_{\rm price}=\bar E_{11}-\varepsilon+2A_0-h^TC^{-1}h.
\]

Lagrange multipliers for the two fixed moments, and conjugate prices for
the three selected squares, shift the visible forcing to `ell',beta'` and
the three coupling coefficients to `c'`. Every such choice gives the upper
bound

\[
\begin{split}
 t^2-2\ell't+2\beta'^2/\varepsilon
 + (\varepsilon-\bar E_{11})\tau^2-2\tau c'_0
 + (c'_{\rm rest}+\tau e)^TC^{-1}(c'_{\rm rest}+\tau e)\\
 +\mathbb E_\nu\Psi_{\bar M,\ell',\beta',c'}(|q|).
\end{split}
\tag{6}
\]

The old `delta,b,alpha,price` disappear from this parametrization. Thus
selected-moment dualization searches new forcing/coupling prices with the
common quadratic matrix fixed. It does not itself add a new identity about
the original cubic tensor. Weak duality makes (6) valid without a minimax
assumption, **provided each inner potential has a global upper bound**.
Local fibre maxima give lower estimates and cannot fill that role.

The beta-variance saving from mixing rows is already incorporated through
the mixed `beta`; it is unavailable again. The pinned gate price is already
subtracted in `B0`; (4) charges only its remainder. A new source cap can also
remove table overestimate or row-consensus loss. Those contributions must
not all be called a new projection-square recovery.

## 4. The numerical symmetry assumption failed

An initial three-coordinate family and a local majorization–minimization
ascent produced values near `.7130`. Convergence of that ascent certifies
neither the global fibre supremum nor exclusion of the law. Full
twelve-coordinate searches at the same prices found additional odd,
imaginary branches. At one saved MM128 price tuple, the full-coordinate
priced value is approximately **`.7372254367`**, versus approximately
`.713014` in the restricted search. The restricted upper-bound interpretation
is rejected.

The independent tangent-quadratic shortcut also failed as a global
certificate at nine of the ten atoms for that price tuple. Its majorizing
quadratic has positive directions even at the smallest radii. The
reoptimized full-coordinate branches can have negative local Hessians;
those are different branches from the old symmetric anchors. Local
stability of a newly found branch does not certify absence of other maxima.

### Valid symmetry uses a latent mixture

At `q=s>=0`, define

\[
 C(f,g)(z)=(\overline{f(\bar z)},\overline{g(\bar z)}),\qquad
 T(f,g)(z)=(-g(-z),-f(-z)).
\]

Conjugation conjugates every packed complex coefficient. `T` preserves the
even fields and flips the odd fields; it preserves the visible moments and
flips `bh`. Both preserve the raw payoff `F`, commute, and preserve disk
bounds. An independent uniform coin choosing `I,C,T,CT` preserves expected
`F`, makes all five selected moments real, and gives `bh=0`. Real-target
penalties cannot increase.

The response functions must not be averaged before squaring their
conditional coefficients. For a concrete example, take

\[
 h=a\operatorname{phase}(z),\qquad
 k=c+\eta ze^{-|z|^2},\qquad a=c=\eta=1/4.
\]

The disk norms are at most `5/8`, and visible and remote target moments are
positive. Averaging the pair with its `T` image removes the odd part of `k`.
The mixture preserves the selected moments but has strictly more payoff,
by

\[
 \eta^2\left(R_{11}/16-R_{12}/(8\sqrt2)+R_{22}/32\right)>0.
\]

An auxiliary coin is a precise formulation of the relaxed model. Since all
7234 radii are positive and `arg(q)` is uniform, a finite coin can also be
encoded by phase partitions:
`f(z,se^(iθ))=e^(iθ) f_j(e^(−iθ)z)` on a phase interval of the desired
relative length. This preserves the integrated invariant moments and
payoff. Hence the failed assumption is one rotation-equivariant section
per radius, rather than unrestricted dependence on the complex `q`.
Neither construction supplies a Gaussian cubic realizing the saved law.

## 5. A certified actual response in the abstract model

The replacement search keeps full-coordinate actual phase pairs at every
radial atom. A convex quadratic program selects their per-atom simplex
weights, with the two exact global contact moments imposed. Its objective
is the average branch payoff minus the quadratic cost of the global
selected moments. New local full-coordinate phase oracles add columns.
Optimality within a finite bank does not certify that missing branches
are harmless.

After fine-grid reevaluation and sparsification, the saved construction
uses **15 branches**, with a fourfold orbit for each branch. Branch
probabilities and polynomial coefficients are rational. On each of
`256 × 512` visible radial/phase cells the response is a constant phase
computed from the exact cell integrals of its polynomial numerator. It is
divided by `100001/100000` and set to zero beyond `R=36`.

`verify_joint_fibre_response.py` integrates those explicitly defined
responses with 128-bit outward Arb arithmetic. Small bounded analytic
corrections repair the visible and remote equalities **exactly**. Their
coefficients are about `−1.63e−13` and `1.27e−13`. The final disk norm is
certified below `.999990000101`, hence below `199999/200000`.

The replay gives

\[
\begin{split}
 m_1&\simeq-.3861622997288545,\\
 (g_0,g_1,g_2)&\simeq
 (.2455423237746582,-.1330067452378360,-.0613907819398991),\\
 D_{\rm sel}&\simeq6.78428086409\,10^{-6},\\
 B_0+F-D_{\rm sel}
 &=.713152706319001235523984014071356
       \quad\text{with Arb radius below }7.4\,10^{-34}.
\end{split}
\]

The exact checked coarse enclosure is
`3565763/5000000 < score < 891441/1250000`. It is a feasible-value
certificate under the abstract law, independent of the optimizers used
to discover the branches. It does not enclose the relaxed optimum.

The cancelled source pieces in (5) are approximately

- visible contribution `t²−epsilon m1²/2`: **`.666102557655`**;
- pinned contribution `epsilon tau²`: **`.044916819410`**;
- even conditional residual covariance: **`.001003046611`**;
- odd conditional energy: **`.001130282644`**.

Their sum is the displayed score. The source-form and independently
cancelled-form computations agree. In particular the odd energy is large
enough to matter and survives latent symmetrization.

On the **same fine branch bank**, the numerical weight optimization with
the selected cost disabled gives `.713164608458`, compared with
`.713152706065` with it enabled: an observed difference of only
**`1.1902393e−5`**. This matched-bank comparison is numerical evidence,
not a rigorous bound on the full optimum's penalty effect. It also differs
from the selected cost at the final enabled optimum, because the maximizing
weights change. It supplies no evidence for a large standalone recovery
from these selected squares.

## 6. Global fixed-law upper certificate

The independent generic replay **passes** for all ten radial atoms and
**79 full-dimensional quadratic regions**. It reconstructs the mixed source
matrix, gate minimizer, Schur price, epsilon and five moment prices exactly.
It independently validates all **23,117** cached Gaussian moment enclosures
with 512-bit Arb arithmetic, then reintegrates every majorizer with outward
midpoint-radius arithmetic and checks every quadratic by exact rational LDL.
The scalar slabs and half-lines cover the entire real slicing coordinate,
including both tails. No optimizer's convergence or claimed maximum enters
this replay.

The exact assembly from the rounded rational piece caps gives
`0.7132613639669872...`, and verifies the advertised rational bound

\[
 \boxed{\quad \sup_{\text{bounded sections at fixed contact}}
       (B_0+F-D_{\rm sel})\le {178315341\over250000000}=.713261364.\quad}
\]

An independent actual-response baseline, without imposing the global contact
moments or subtracting the selected cost, proves

\[
 B_0+\mathbb E\Psi_{\rm common}>.7133545.
\]

Consequently the **joint deficit against that common potential is strictly
greater than `.000093136`**. This compares the new cap with a certified feasible
baseline for the common potential, rather than conflating recovery with slack
in an old tabulated cap. It includes losses from requiring the prescribed
moments and pricing their remainders; it does not isolate the penalty alone.

Equivalently, every actual bounded pair satisfying these two contact moments
under this law obeys the quantitative tradeoff

\[
 \boxed{\quad \bigl(\mathbb E_\nu\Psi_{\rm common}-F(f,g)\bigr)
                  +D_{\rm sel}(f,g)>.000093136.\quad}
\]

The preceding zero-cost response therefore cannot simultaneously come close
enough to the common fibre supremum. This is the joint statement that a
standalone positive lower bound on `D_sel` could not supply.

Combining this upper bound with section 5 gives the rigorous fixed-law bracket

\[
 .7131526<\sup(B_0+F-D_{\rm sel})\le.713261364.
\]

The cap is below `500/701=0.7132667617689016...` by more than
`0.0000053977689`. Thus this certificate **excludes this saved law and exact
contact as an obstruction to the 1.402 target**. The earlier 62-region replay
only gave `.7132944`, above the target; splitting the main `.795` atom more
finely and covering the rare `3.7` atom lowered the accepted cap. A numerical
priced value below the threshold was insufficient; the global cover is the
checkable conclusion. This fixed-law exclusion is not a uniform-law theorem
or an improvement of the Grothendieck endpoint. These are external
computational certificates, not completed Lean theorems. The cached moments
are independently checked, while the outward integration code and elementary
analytic majorizer remain part of the external proof implementation.

### Why the global cell majorizer does not trust a local maximum

At a visible point write

\[
 x=|L+p|,\quad y=|L-p|,\quad u=\Re(\bar Lp),\quad R_L=|L|.
\]

Choose **any** positive cell prices `A,B`, put `S=A+B`, and define

\[
 \Delta={(x-A)^2\over2A}+{(y-B)^2\over2B},\qquad d=x-y.
\]

Then `|d|<=2 R_L`, and the exact identity

\[
 4u-A^2+B^2=(S+d)(x-A)+(d-S)(y-B)
\]

and weighted Cauchy–Schwarz imply

\[
 (4u-A^2+B^2)^2
 \le2S\{S^2+4R_L^2+4R_L|A-B|\}\Delta.
\tag{7}
\]

Consequently the ordinary quadratic norm majorizer can be improved by
subtracting this controlled square:

\[
 x+y\le{x^2\over2A}+{y^2\over2B}+{S\over2}
 -{(4u-A^2+B^2)^2\over
  2S\{S^2+4R_L^2+4R_L|A-B|\}}.
\tag{8}
\]

A cell upper bound on `R_L` can enlarge the denominator conservatively.
The resulting expression is quadratic in all twelve fibre variables.
Thus anchors and variance directions propose positive prices, but their
stationarity or optimality is irrelevant to validity. The global checker
reintegrates the coefficients outward, checks the resulting quadratic
matrices by exact rational LDL, and checks complete scalar-region coverage.
Every accepted region bounds the full twelve-dimensional variables on its
stated half-space or slab; the cover is not a restriction to one coordinate
or to a numerically observed branch.

The required scope is global over **all bounded sections and latent
mixtures at this one saved law and contact**. It is not global over all
admissible radial laws, parameter contacts, or Gaussian cubics. Even a
successful fixed-law exclusion does not change the Grothendieck endpoint.

## 7. What the result establishes and what remains

The generic free-projector ceiling is completed Lean mathematics. Its
parameter controls and cancellation checks use exact rational arithmetic.
The fifteen-branch feasible value is an external computational certificate
using outward Arb balls and explicit analytic moment repair. The branch
exchange, cost-on/off comparison and Hessian diagnostics are numerical
evidence. The saved atomic radial law is still not a Gaussian cubic law.
No new Gaussian norm theorem or Grothendieck endpoint is asserted.

The next substantial step needs uniformity. One must control a neighborhood
of the contact and every radial law allowed there, or introduce valid
information tying the conditional fields and projectors to one cubic
tensor. Excluding the single stored atomic law does not prove that another
law in the finite relaxation cannot replace it. A different witness must
also be assessed on its own terms; this experiment fixes `epsilon=.745`.

There is also a quantitative ceiling for **this fixed mixed matrix and
selected-cost surrogate**. Its explicit feasible response prevents any valid
uniform cap from falling below `.7131526`, even with perfect integration and
optimal scalar moment prices. Under the usual reciprocal conversion this
limits a certificate using this unchanged surrogate to less than
`1/.7131526 = 1.402224432752...`. It cannot approach the current upper endpoint
`1.404598635371` through scalar repricing alone. This is not a ceiling for all
cubic witnesses, other mixed matrices, or a model retaining the actual cubic
projection. Those changes alter the optimization problem.

Rank constraints on a free projector do not provide that missing link.
The more promising strengthening retains the actual K-side spectral
allocation or its valid slack together with the field Gram. A model that
couples `Pi_H10`, `Pi_H21`, and the mixed visible/remote chaos spaces can
distinguish positive residual covariance permitted by (5) from energy that
the original cubic projector can actually collect. Its first falsification
test should use the present full-coordinate branch bank, including the
symmetry-breaking branches, rather than restart in the three-coordinate
family.

Care is needed with h-side signs: the existing Lean six-piece result is
an upper bound on `||Qh||²`; it cannot be subtracted to infer a lower bound
on the h cost. A proposed stronger allocation formula must prove the
required reverse Bessel inclusion or exact decomposition before using it
with a negative sign.

### Three directions ranked by potential to close the whole gap

The ranking concerns structural reach; the third direction is the nearest
certification task. None follows merely from difficulty on both endpoints.

1. **Change the witness across chaos levels and test a jointly realizable
   response family.** Start with
   `T=P10−epsilon P21+gamma P32`, allowing either sign of `gamma`.
   The decisive construction is a multi-grade fibre certificate for its
   scalar norm, with one bounded pair serving both remote grades, together
   with the correct transfer numerator `N(T)`. Require a certified ratio
   `N(T)/B(T)` beyond the unchanged surrogate's approximate `1.4022244` ceiling before
   investing in a global cover. Separate marginal laws of the cubic and
   quintic residuals are insufficient: their joint law and common response
   must enter the same supremum. First falsification: extend the existing
   full twelve-coordinate phase bank and the influential `X G2` controls
   to the proposed fifth-grade term; an actual bounded pair exceeding the
   proposed norm cap rejects that parameter choice immediately. A response
   defeating this witness becomes an upper-rounding candidate only after
   its actual correlation kernel, signed coefficients, and tail satisfy
   the required inverse-kernel/Wiener-norm condition. Witness separation
   alone provides no such conversion. The earlier cubic numerical ceiling
   remains evidence to test, rather than a theorem fixing the answer.

2. **Constrain the common Gaussian grading, including its signed allocation
   of energy.** First prove the exact six-piece cubic decomposition, with
   both Bessel directions, so h costs can legitimately be subtracted.
   For remote residual fields `rj=(I−|q><q|)xi_j`, define
   `S=epsilon(|r1><r1|+|r2><r2|)−|r0><r0|`. A free orthogonal allocation
   has ceiling `tr(S_+)`. A decisive new lemma would force a positive
   deficit `tr(Pi_H10 S)<=tr(S_+)−eta` on the *high-payoff, near-contact*
   configurations, using the same cubic tensor that defines `q` and
   `Pi_H21`. The h fields and their fixed frame must be included in the
   signed operator or constrained simultaneously. Rank, separate moment
   bounds, and an arbitrary common projector cannot supply `eta`.
   First falsification: evaluate the proposed inequality on the full
   branch bank, genuine `X G2` limits, and coupled Wick controls. A
   purported tensor identity must hold on the genuine controls and exclude
   a surviving marginal completion; another
   scalar consequence already satisfied by those models does neither.
   This can surpass the present surrogate ceiling, although it cannot
   establish that a cubic witness alone closes the entire gap.

3. **Turn the fixed-law repricing into a uniform local certificate.**
   The decisive object is a whole-half-line majorant for the newly priced
   common potential, valid against every radial law in a contact
   neighborhood, using explicitly nonnegative prices for valid cuts.
   Combine it with certified continuity in `t,tau` and the exact box cover;
   checking only the ten saved atoms cannot establish uniformity. First
   falsification: rerun the radial separation LP with the new potential
   and all existing cut banks, then replay every violating law with the
   full-coordinate section oracle. A replacement feasible law above the
   proposed cap rejects that repricing before another cover is generated.
   This is a useful short-term bound project, but the certified feasible
   score in section 5 limits this unchanged mixed-matrix/selected-cost
   framework to a reciprocal bound below `1/.7131526≈1.40222443`. Better integration,
   denser scalar prices, and more exact contact boxes cannot remove that
   mathematical ceiling or reach the current upper endpoint.

## 8. Reproduction and source binding

The scripts bind the exact audit, radial law, source-row weights and
profiles by SHA-256. The numerical response optimizers are not trusted by
the replay. The source-potential node hypotheses for the original
Grothendieck bound are unchanged.

From a package containing `tools/` and the archived `inputs/`:

```sh
python3 -I tools/verify_projection_gate_ceiling.py --audit inputs/binding-audit.json --out projector-controls.json
python3 -I tools/verify_joint_fibre_algebra.py --inputs inputs --output algebra-controls.json
python3 -I tools/verify_joint_fibre_response.py tools/joint_fibre_response_7234.json --audit inputs/binding-audit.json --law inputs/radial-complete-7234-exact.json --profiles inputs/row-profiles.json
```

The final command requires `python-flint==0.9.0`; the first two use the
standard library. The generic Lean file compiles with the repository's
existing Lean environment. Its axiom audit is separate from the numerical
and Arb certificates. The global replay also requires NumPy; it uses no optimizer:

```sh
OPENBLAS_NUM_THREADS=1 python3 -I tools/verify_joint_fibre_upper.py tools/joint_fibre_upper_7234.json --audit inputs/binding-audit.json --law inputs/radial-complete-7234-exact.json --profiles inputs/row-profiles.json
python3 -I tools/verify_joint_fibre_baseline.py tools/joint_fibre_baseline_7234.json --audit inputs/binding-audit.json --law inputs/radial-complete-7234-exact.json --profiles inputs/row-profiles.json
python3 -I tools/check_joint_certificate_controls.py --certificate tools/joint_fibre_response_7234.json --audit inputs/binding-audit.json --law inputs/radial-complete-7234-exact.json --profiles inputs/row-profiles.json
```

The package's `run_all.py` runs all saved computational certificates in a
fixed sequence. The 11-theorem Lean audit log is included separately; compile
the module in the repository environment to repeat that kernel check.


## Continuation: genuine unchanged-witness obstruction

See `GENUINE_CUBIC_DIAGNOSIS_2026-10-23.md`. Newer common-Stein cuts already
exclude the old law 7234; a ceiling based on its feasibility applies only to
law classes still containing it. A separate genuine finite Gaussian pair now
proves `||P10-(149/200)P21||_infinity_to_1 > .71329 > 500/701`. Thus the
unchanged witness cannot reach the 1.402 target even with complete geometry.
This is a witness ceiling, not an upper bound on the Grothendieck constant.
The proof combines the actual U(m)-invariant projection closure, directed
Bessel integrals, and an exact finite coefficient correction. New row-pricing
identities and radius-uniform polynomial certificates remain reusable.
