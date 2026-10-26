# Rank-one attack: first complete box certificate

23 October 2026 · branch `codex/research-audit-20261023`

The rank-one attack now improves an entire existing box with exact rational
verification. **The global Grothendieck lower endpoint is unchanged.** This is
a completed local certificate, under the documented analytic source and
response-reduction premises, rather than the earlier floating prediction of a
whole-cover gain.

## The concrete result

For box 8150 of the current 8,756-box certificate:

- Original box cap: **0.7134201892533115**.
- Original law bounds with the new scale partition: **0.7134197811841173**.
- New rank-one/law cap: **0.7134178105498480**.

The total local reduction is **2.378703463496214 × 10⁻⁶**. Its attribution was
checked separately: partition refinement contributes **4.080691941466346 ×
10⁻⁷**, and the new rank-one/law certificates contribute another
**1.970634269349579 × 10⁻⁶**, after paying the semiconvex interpolation cost.
The new test also has a positive uniform saving throughout the box, separately
from comparing the maxima; the exact verified floor exceeds **2.12022 × 10⁻⁷**.
These displayed decimals summarize exact rational quantities in the ledger.

The box domain is

\[
\begin{split}
0.854&\le t\le0.8545,\\
\frac{26287528239}{128000000000}
 &\le\tau\le\frac{10709733727}{51200000000},\\
0&\le x\le\frac{31}{256}.
\end{split}
\]

The fixed mixture weights are row 12 (`t=0.84`) with weight `0.133952501` and
row 15 (`t=0.855`) with weight `0.866047499`. Row 12's law bounds and the
common pinned gate price are retained. Row 15 receives the new test and three
new law polynomials. Every dimension and every admissible law covered by the
inherited reduction remains included; there is no Gaussian-law-only restriction.

## What changed in the attack

The previous continuation had supplied the semiconvex interpolation theorem but
still lacked rigorously regenerated shifted source caps. The missing bridge is
now implemented through all four layers:

1. **Gaussian source majorants.** The full augmented quadratic data `C,h,H`,
   rather than only old scalar potential caps, are transported to external
   shifts. Completing the square makes the dependence on residual magnitude
   `r` and scalar test `f` explicit. Both unlocalized anchor banks contain
   149 exactly reconstructed records.
2. **Localized source integration.** Nine-piece S-lemma certificates were
   regenerated for each of rows 14 and 15. All pieces use one common rational
   `f` before their maximum is taken. Both shared Gaussian moment tables were
   regenerated and matched exactly. A separate implementation checked the
   row-15 bivariate transport on 27 exact fixtures.
3. **Law certificates.** Explicit source tests feed a lifted rational hull,
   then whole-half-line polynomial inequalities with the old Stein cuts.
   The three mixture-corrected nodes each cover 987 rational intervals, with
   maximal degree 10. Floating optimization only proposes moment coefficients;
   saved certificates replay with standard-library Python and exact fractions.
4. **A whole box.** The original stored box cap is first reconstructed exactly.
   The new bound splits at the middle row-15 scale node, uses the changed
   semiconvex coefficient, and maximizes the resulting quadratics exactly.
   An independent review checked the assembly and the refinement attribution.

At the source level, the gains are considerably larger than the final law gain:

- Row 14 at physical `r=0.5`: cap **1.506387497104**, below the inherited
  effective source chord by approximately **1.3120270734 × 10⁻⁴**.
- Row 15 at physical `r≈0.4992235513`: cap **1.528380990808**, improving the
  freshly replayed original localized cap by approximately **1.0491607960 ×
  10⁻⁴**.

Both combined source tables have 996 explicit rational nodes. Their caps retain
the scalar tests, the zero test at the origin and final node, the inherited
affine tail, and their exact interpolation coefficient. Finite hulls are never
extrapolated to infinity.

One failed proposal is retained for diagnosis: using the numerical profile
`f=-0.03105` directly with the frozen row-15 Gaussian prices made that upper
certificate worse. Optimizing **one common test for the actual frozen
majorants** instead gave `f=-14947036109/10^12≈-0.014947036109` and the positive
result. A numerical optimizer of the original potential cannot be substituted
into a frozen upper certificate without reevaluating its price.

## The mixture correction matters

A pure row's gain cannot simply be multiplied by its weight in the old cover.
The common completion changes the law-linear coefficient. For box 8150,

\[
c_{15}\approx0.1800602084526944,
\qquad c'_{15}\approx0.1803218853127957.
\]

Thus the active source needs the exact correction

\[
F'_{15}(r,f)=F_{15}(r,f)+2(c'_{15}-c_{15})rf.
\]

This correction is included before source interpolation and law verification.
The semiconvex coefficient changes to
`(c'15)^2/d15≈0.1860998814777420`; its weighted value is used in the box.
The source hull and the scale interpolation both pay their applicable costs.

The required mixture lemma also has a useful generalization. A rank-one Young
test may use a price `d≥vᵀE⁻¹v`, provided its L10 block is PSD. Equality is
unnecessary. The remaining L21 coefficient is

\[
v_R^TC^{-1}v_R-d
=-s_E(E^{-1}v)_0^2-(d-v^TE^{-1}v)\le0.
\]

Weighted PSD blocks therefore permit activating row 15 and leaving row 12's
test zero, while retaining the old common pin price. This lemma was derived
and independently audited. A separate canonical construction
`w=e0+E^{-1}e0` supplies an admissible direction for every old admissible gate,
without a cone search; it is not claimed to be optimal.

## Exactness and remaining premises

The following were recomputed here: both localized Gaussian integration
batches; their original caps and coverage; the shared moment tables; one
complete unlocalized winning-anchor source recipe; all finite Schur/transport
algebra in the two global banks; explicit source tables; the selected law
polynomials and closed scale bridges; and the complete box-8150 arithmetic.
The root worker independently replayed both corrected scale bridges and the
final box result.

The other global anchor Gaussian integrations remain inherited, with their
exact records and hashes pinned. The scalar Gaussian majorant inequality,
polar integral identities, symmetry reduction, response extraction, rank-one
Young reduction, semiconvex theorem and law identities retain their documented
paper/analytic status. **This continuation adds no new Lean endpoint theorem**
and does not remove the existing `NodeCaps` assumption.

The inherited source allowance `PAD=10^-11` is included exactly once. Effective
node caps are converted to bounds for `H=F-PAD`, interpolated and integrated,
and that same PAD is restored once in the row/box evaluator. Exact negative
rational witnesses show that each improved moment polynomial fails with the
old source and the same cuts, so its acceptance is not merely unused slack in
the old polynomial certificate.

## Why this does not yet improve the constant

The current scalar target remains `B=0.7134218`, giving the existing conditional
lower endpoint **1.401695322458**. Other boxes still control the global maximum.
Box 7234 alone has cap approximately `0.7134217985255055`; changing box 8150
cannot lower that value.

Box 8168 is another distinct obligation: it uses a whole-row-15 cap over
`0≤tau≤rho`, `0≤x≤31/4`. The new low-x scale interval does not replace that
entire row envelope. A full row certificate or a replacement partition is
necessary. The earlier `1.40171` forecast remains a numerical whole-cover
prediction, not a newly proved endpoint.

The next substantial step is to repeat this source-to-box pipeline on the
near-binding rows and to replace the broad row-cap boxes. The practical order
is:

1. Reuse the regenerated shifted majorants, and regenerate prices at additional
   shifted source contacts where frozen majorants remain loose.
2. Share law certificates across safely bounded common-completion coefficients,
   applying the correction `2*delta_c*r*f` and the larger semiconvex coefficient
   explicitly. This avoids treating thousands of mixture weights as unrelated
   Gaussian integrations.
3. Rebuild the entire 8,756-box cover, including the whole-row-cap obligations,
   before computing a new global reciprocal endpoint.
4. Port the new finite checker and analytic rank-one assembly to Lean; keep
   inherited analytic premises distinct from theorems actually formalized.

The attack is now operational at the first full-box level. Its remaining
burden is uniform coverage and tighter source prices, not an untested
interpolation shortcut.

## Files and replay

The accompanying ZIP preserves the new tools, proof notes, exact ledgers and
pinned local dependencies in repository-relative layout. Unpack it into a
separate directory and run the commands below from that directory. Existing
certificate files in the working repository were not replaced.

```sh
python3 -I tools/rankone_law.py --tau-bridge handoff/research-third-decimal/rank-one-certification-20261023/law/m15-box8150-tau-bridge-a.json
python3 -I tools/rankone_law.py --tau-bridge handoff/research-third-decimal/rank-one-certification-20261023/law/m15-box8150-tau-bridge-b.json
python3 -I tools/rankone_box8150.py --out handoff/research-third-decimal/rank-one-certification-20261023/box8150/result.json --check
```

The box command checks assembly conditional on the recorded law-node proofs;
the two bridge commands replay all three law-node proofs. Source regeneration
commands and their remaining premises are in `analytic/SHIFTED_ANCHOR_TRANSPORT.md`,
`replay/SOURCE_REPLAY.md`, `replay/LOCALIZED_REPLAY.md`, and
`replay/MIXTURE_AUDIT.md` under the same research directory. The law interface
and all padding details are documented in its `law/README.md`.
