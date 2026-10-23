# A genuine obstruction to the unchanged cubic witness

23 October 2026. Branch `work/shared-response-oct23`. Repository history only;
no other chats were inspected. The original checkout was read without edits.
**Neither global Grothendieck endpoint changes.**

The next uniformity test exposed a decisive parameter obstruction. For
`T=P10−(149/200)P21`, an explicit finite-dimensional Gaussian unimodular pair
has pairing strictly greater than **`.71329>500/701`**. Consequently no correct
norm certificate for this unchanged witness can prove a reciprocal bound
at or above **`1.401955`**, including the proposed `1.402` target.

Against the previously audited conditional interval
`1.401696986171 < K_G^C < 1.404598570779`, even the finite obstruction limits
this unchanged witness's possible lower-end gain to less than `.000260`,
under nine percent of that interval. This is a restriction on the chosen
witness, rather than evidence that the true constant is near that ceiling.

This is a ceiling for this witness's reciprocal-norm method. It is **not an
upper bound on the complex Grothendieck constant**. It leaves changing epsilon,
the witness and the rounding family open.

The result confirms, and strengthens to a checkable obstruction, the manuscript's
numerical warning. The Chapter 4 entry `.713288` at epsilon `.745` was a
numerical model value. Our explicit rational profile has externally certified
limit value greater than `.71329117`; the old entry cannot be used as an upper
enclosure or exact norm. No global optimality of the new profile is claimed.

## 1. The genuine finite construction

Let `X` be a standard proper complex Gaussian in `C^m` and `Y` an independent
standard proper Gaussian in `Sym²(C^m)`, of dimension `d=m(m+1)/2`. With
`RX=||X||²`, define the unit genuine Wick cubic

\[
 q_m=\frac{\sum_iX_i^2\bar Y_{ii}
       +\sqrt2\sum_{i<j}X_iX_j\bar Y_{ij}}{\sqrt{m(m+1)}}.
\]

Under the simultaneous action `X→UX`, `Y→Sym²(U)Y` of the **full U(m)**,
this cubic is invariant. Its exact coupled scalar law is

\[
 RX\sim\Gamma(m,1),\quad G\sim CN(0,1),\quad
 V\sim\Gamma(d-1,1),\quad
 q_m=\frac{RX\,G}{\sqrt{m(m+1)}},\quad RY=|G|^2+V,
\]

where `RX,G,V` are independent. Interpret `V=0` when `m=1`.
The same `G` occurs in `q_m` and `RY`; replacing one by independent noise
would change the projection coefficients.

For an independent visible Gaussian `Z`, put

\[
 H=Z(|Z|^2-2)/\sqrt2,\quad
 AX=(RX-m)/\sqrt m,\quad AY=(RY-d)/\sqrt d.
\]

The invariant first chaos is exactly `span{Z}`, and the invariant cubic
chaos is exactly `span{H,Z AX,Z AY,q_m}`. These five features are orthonormal.
This is an actual Gaussian grading result, not a free-projector completion.
The companion proof derives it from the irreducible decomposition
`C^m⊕Sym²(C^m)` and the central U(1) weights. It holds also at `m=1`.

Choose the rational parameters

\[
 c=243529/10^6,\qquad b=98197/500000,
\]

and the actual finite Gaussian responses

\[
 f_m=\operatorname{phase}\{RX(Z+cH)+b\sqrt{m(m+1)}q_m\},\quad
 g_m=\operatorname{phase}\{RX(Z+cH)-b\sqrt{m(m+1)}q_m\}.
\]

They are phases of explicit degree-five polynomials. The witness remains
cubic. Since `RX>0` almost surely, they equal `phase(Z+cH±bG)` under the
coupled scalar law. The normalization is a legitimate response depending
on the shared quadratic `RX`; it does not relabel a Gaussian as a cubic.

## 2. One-dimensional certified integrals and an exact finite correction

Set `A=Z+cH`. For `s>=0`, direct Gaussian integration gives

\[
 \psi(s)=\frac{\sqrt\pi}{2}s e^{-s^2/2}
              [I_0(s^2/2)+I_1(s^2/2)],\quad
 \zeta(s)=\frac{\sqrt\pi}{2}e^{-s^2/2}I_0(s^2/2).
\]

With `s=|A|/b`, define

\[
 m_0=E[|Z|\psi(s)],\quad
 m_1=E[|Z|(|Z|^2-2)\psi(s)]/\sqrt2,\quad m_q=E\zeta(s).
\]

The rank-three comparison value is
`Jinf=m0²−epsilon*m1²+epsilon*mq²`. The Arb replay, with fixed rational
parameters and both full Gaussian tails included, gives

\[
 J_\infty\in .7132911728714971906\ \mathbin\pm\ 6.82\cdot10^{-20},
 \qquad .71329117<J_\infty<.71329118,\qquad m_q^2<.051.
\]

The finite bridge is an **exact identity**, without a CLT or a phase-tail
assumption. Put `n=E[barZ (|G|²−1) f_m]`. The five-feature projections give

\[
 \boxed{J_m=J_\infty-\epsilon\frac{m_q^2}{m+1}
                         -\epsilon\frac{|n|^2}{d}},\qquad |n|\le1.
\]

The second negative term is the genuine shared-G `Z AY` energy. It is
retained and bounded; the `Z AX` coefficient vanishes because these
normalized responses are independent of `RX` in the scalar realization.

At `m=4096`, this already proves `Jm>.713281807351835>500/701` on
8,394,753 complex coordinates. The saved stronger arithmetic certificate
uses `m=65536`, on 2,147,581,953 complex coordinates, and proves

\[
 J_m>.713290589904243>.71329>500/701,\qquad
 1/.71329=1.401954324328113\ldots<1.401955.
\]

The obstruction lies near the diffuse corner, rather than at the old 7234
contact: `t≈.85657028`, `tau≈.22580583*sqrt(m/(m+1))`, and the genuine
kurtosis excess is `(8m+12)/(m(m+1))`. The normalized conditional Gaussian
retains almost all of the remote cubic coefficient, makes the negative
`Z AX` cost exactly zero, and suppresses the remaining shared-G negative
cost by `1/d`. The actual remote cubic projector is rank one by U(m)
symmetry. In this family, rank-one attainment is genuine geometry rather
than an artifact of a freely chosen projector. More compatibility
constraints cannot eliminate this particular pair.

The dimensions are conservative finite choices. No enumeration of their
coordinates, numerical high-dimensional integration, optimization result,
or asymptotic extrapolation is trusted by this obstruction.

### This adversary does not automatically supply a competitive rounding

For this actual pair the linear mixed coefficient is `c0=m0²`, while

\[
 c_1=m_1^2+|n|^2/d-\frac m{m+1}m_q^2
       \ge m_1^2-m_q^2>.0274.
\]

The same directed integral therefore proves that its complete individual
Wiener score is at most

\[
 c_0-\sum_{j\ge1}|c_j|
 \le m_0^2-m_1^2+m_q^2<.70631.
\]

This is already below the incumbent `.711947179793908982`, before paying
any higher tail. The example can defeat an underweighted cubic witness
while leaving too much positive cubic coefficient for a good individual
rounding. A mixture might cancel that signed coefficient; this calculation
neither supplies that cancellation nor rules it out. It makes the distinction
between a realizable witness adversary and a useful upper construction
quantitative for the same genuine response.

## 3. What the uniformity experiment found

The newer repository common-Stein work had already rejected the old atomic
law 7234. Its finite-bank feasibility and our fixed-law joint certificate
remain correct. The earlier ceiling `1/.7131526≈1.40222443` only applies
to an admissible class still containing that law. It cannot constrain a
stronger common-kernel/cut class which excludes it. The genuine obstruction
above has a different scope: every valid cubic constraint holds for it.

We added all twenty saved newer common cuts to the original 671 and built
an exact eleven-atom replacement law passing **all 691 cuts** and the required
radial moments. Its old frozen-table score remains above `.713410145509`.
This is a table-relaxation value, not an actual response payoff.

On that replacement law a sparse thirteen-branch actual bounded response
has an independent Arb-certified feasible score
`.7131759553192112162`, with exact repaired contact moments and disk norm
below `.999990000123`. This is a **lower value** at the old exact contact,
not a global upper bound. It does not contradict the genuine obstruction,
which occurs at a different contact.

The radius-cover experiment independently replays **120 quadratic regions**,
covering the full twelve-dimensional coefficient variables at thirteen radii.
Every region's exact polynomial is valid at every nonnegative radius, so
complete region covers produce whole-half-line upper envelopes. Convexity
also gives valid chords between certified nodes; an explicit Lipschitz
tail covers the infinite ray. All 23,117 cached Gaussian moment intervals
are independently checked.

The finite-grid LP of the resulting chord majorant gives about `.71426675`
through radius 24. Its difference from the actual fixed-price branch lower
estimate `.71324845` is certification/optimization slack. The LP is neither
a continuum upper certificate nor a realizable adversary. No further
endpoint-directed refinement at epsilon `.745` is justified by this test.

## 4. The useful part that survives: a fixed new row

Let the reference contact be `tau0` and its five moment prices be
`(lambda0,lambda1,lambda2,lambda3,lambda4)`. Set
`mu=(lambda2,lambda3,lambda4)/tau0` and use remote prices `tau*mu` at
arbitrary tau. Then

\[
 \ell'=\ell+\lambda_0/2,\quad\beta'=\beta+\lambda_1/2,
 \quad\widetilde A=A+\mu/2.
\]

The full dual becomes the ordinary row expression

\[
 t^2-2\ell't+2\beta'^2/\epsilon
  +E_\nu\Psi_{\bar M,\ell',\beta',\widetilde A}(\tau v)
  -\widetilde D\tau^2,
\]

where, with `e=(E12,E13)` and trailing gate block `C`,

\[
 \widetilde D=E_{11}-\epsilon+2\widetilde A_0
             -(e+\widetilde A_{rest})^TC^{-1}(e+\widetilde A_{rest}).
\]

This is exact algebra for all `t,tau`, including tau zero. It avoids freezing
the prices at a single contact. The existing row/node/box machinery can
therefore be reused after genuinely certifying the new potential. It does
not supply that uniform certificate automatically.

Five generic repricing identities now compile in Lean with only standard
axioms. Three further Lean results verify the finite arithmetic implication
and strict reciprocal comparisons **conditional on the external integral
and projection identities**. They do not formalize the Gaussian representation
argument or the Bessel integrals. The compiler also checks 33 source-bound
rational identities, including zero-scale cases.

## 5. Research decisions

1. **For the full gap, change the witness and retain actual joint geometry.**
   The normalized-G pair supplies an explicit family using a shared neutral
   quadratic. Include it, the influential `X G2` examples, and coupled Wick
   examples in higher-chaos witness/response exchange. The decisive test is
   a better complete norm ratio and an actually realizable signed response
   mixture with a proved tail. A good low-degree payoff alone fails this test.
2. **For the 1.402 milestone, change epsilon before rebuilding a cover.**
   The proposed epsilon near `.7564` escapes this particular obstruction;
   the manuscript's model value there is about `.71313547`. That is evidence
   for a target, not its upper certificate. New matrix profiles, both flanks,
   and the complete epsilon-dependent reduction must be checked. Relabeling
   the `.745` certificate or its bottom matrix blocks is invalid.
3. **Use the repricing compiler and radius cache as certification tools.**
   First test a changed row against the common-law/response separation oracle.
   Generate a whole-half-line majorant only if the genuine examples and the
   replacement-law test leave room. This prevents refining an unattainable
   target or confusing interpolation error with missing cubic geometry.

## Reproduction and trust boundary

The portable package replays the diffuse integral, exact finite correction,
new-row compiler, replacement-law constraints, replacement response, and
the extended radius covers. Discovery/QMC files are separately labeled.
The closure/Bessel/finite-bridge proof is in the companion genuine-cubic
note; the minimax and uniformity audit is in the row-extension note.

The new obstruction is a paper analytic proof plus an external directed
integral certificate and exact rational arithmetic. The eight new Lean
results are generic algebra/arithmetic implications. **No new headline
Grothendieck theorem or completed Lean Gaussian-norm theorem is claimed.**
