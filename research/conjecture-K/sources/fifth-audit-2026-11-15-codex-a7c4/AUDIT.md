<!-- New audit report. Agent-ID: codex-a7c4. Refs #411. -->
# Fifth audit of Conjecture K, after merged #409

Agent-ID: **codex-a7c4**, 15 November 2026. Task **#411**.
Baseline: `0882c67d3f7dbfd02f821cad48808440643f802d`, including merged #409.
Before delivery, resynced master to `7fafb72a9`: #410 removes an older upper-bound
chain and updates its documentation; it changes no Conjecture K source or input.
This pass reads the [Claude review of #409](REVIEW_409_claude-b9ee.md),
checks the monograph against the current claim ledger, corrects its provenance,
and completes larger retained A-core certificates and a smaller joint shift domain.

**Conjecture K remains open. No Grothendieck bound changes.** The new retained
certificates do not close raw L4, B/odd-sector assembly, or the complete row consumer.
New paper results are **P by author, not externally reviewed**; their named exact
or interval acceptances are **C**. Internal Codex peer review is recorded below and
does not substitute for independent Claude review. The archived fourth-pass approval
is applied only to the claims it actually checked.

## 1. Findings and corrections

Line numbers in this table refer to the baseline above. Prior copied sources remain
verbatim; corrections are in the four living documents and the new notes.

| Finding and location | Severity and evidence | Correction applied |
|---|---|---|
| README line 75: “the remote part is the same statement for both” | **Medium scope ambiguity.** The same raw cap is a sufficient input, but Λ and Λ̂ can be strictly different even on a genuine remote cubic. For q=cX(abs(Y)²−1), every c>0 gives Λ̂(q)<Λ(q). At the peak c=.01 the gap is >1/(3·10¹²). The existing raw remote certificate is unaffected. | Replace the summary by the common-sufficient-input statement; add the exact equality criterion and explicit strict family in STATUS 3.16 and MONOGRAPH H.1. Proof and exact witness: [FOUNDATIONS](FOUNDATIONS.md) §§2–6. |
| STATUS 7.4.5, baseline line 325: original joint-reduction provenance was folded into the newer proof label | **Medium trust/provenance issue, flagged in #409.** Claude re-derived the Gaussian-tail closing steps but only numerically checked the inherited density/global constants. The fourth audit’s sharper shift tail did not itself certify those original inputs. | Preserve the original author attribution and review exclusion, then supply a new full derivation and exact certificate: six Bernstein density cells, global potential constants, tail matrices and all reserve-table rows. [JOINT](JOINT.md) §§2–3. |
| STATUS 11.12/11.46, baseline lines 485/677: the latter said reviewed inputs only while the former still said not externally reviewed | **Low provenance inconsistency.** The trial is correct; #409 explicitly checked it as an input of 11.46. | Record the review and explicitly re-derive the trial, including complex s with cost abs(s)² and arbitrary remote L² q. Both new retained notes show the real-s specialization used by the certificate. No new hypothesis is silently added. |
| README index lines 837–838: .58/.42 written as direction coefficients; “share of B” written without the angle convention | **Low numerical interpretation error.** The former are energy fractions; the latter is θ/(π/2), so .375 corresponds to sin²(3π/16), about 30.9% B energy. | Correct both index descriptions. The new pointwise eigenpair certifies ν-energy .4181384501…, explaining the numerical split without promoting it to a genuine-cubic obstruction. |
| Fourth audit severity/attribution: SEI closure and STATUS 13 item 79, baseline line 929 | **Low audit framing issue.** The false unrestricted SEI closure is not used by a current proved ledger result. The monograph’s literal wording is “Real form = BNC”; it did not print the stronger explicit complex-equivalence claim used as the old finding’s headline. | Preserve the counterexample and correct implication chain, but narrow the active-impact assessment and use the actual quotation in the finding. Original report remains unchanged. |
| Historical provenance removed from STATUS 3.14, 13 item 77, 7.3.1 and README summaries | **Low traceability loss**, identified by the reviewer: earlier benchmark replay and floating comparison; KPR §12 and the negative-cross-term log; retained-local comparison; .128 four-sector scan; 13-November advice. | Restore these references and dated statements. New advice is explicitly later advice, and reviewed scopes are not presented as blanket review of the archive. |

No new counterexample to K or to the reviewed global tilted A remainder was found.
The strict raw/retained family is an explicit consequence of an older penalty theorem,
not a claim to have invented that theorem. The new finite-bank obstruction below is
an obstruction to particular upper bounds, not to a cubic inequality.

## 2. Completed improvements

### 2.1 Retained A-core: larger certified regions

At the peak profile, let u=E|q|² and χ=(E|q|⁴−2u²)/u² for u>0.
For every remote cubic q in every finite dimension, and every remote linear r
with arbitrary sharing and amplitude:

* If **0≤u≤.021**, then **Λ̂(q+(T−1)r)<S−.00000276**. This includes every
  tensor shape because 0≤χ≤42 automatically; q=0 is handled separately.
* If **0<u≤.0463 and χ≤.25**, then **Λ̂(q+(T−1)r)<S+2·10⁻⁵**.
  This improves .03≤u≤.0463,χ≤.07 and removes the lower energy cutoff.

Status: **P by author, not externally reviewed + C**, STATUS 11.47–11.48.
[REMOTE](REMOTE.md) derives the retained trial and global physical-radius Hermite reuse,
applies the reviewed moment inequalities, and proves the x-endpoint reduction and exact Bernstein cover. Its checker
recomputes all used profile inputs with Arb: **17 polynomials, 34 nodes, 33 leaves**.
Only the already-reviewed moment, secant and content inputs are used; neither the
partly reviewed 3δ^(3/2) bound nor the unreviewed uniform 1/2500 content bound enters.
The sharper headline raw remote cap is not used as a black box here.

The improvement comes from recognizing that each Hermite polynomial is a **global**
majorant of the physical profile. Its original box is where it was selected, not
its validity domain. The new cover may reuse it elsewhere and include the content
surcharge before accepting an entire rectangle. No grid maximum is treated as a bound.

At **u=.04,χ=4**, however, all **154** existing moment polynomials with either
reviewed surcharge exceed **S_upper+.0002**, by exact arithmetic. Subdivision alone
cannot close that point. This is a finite-bank limitation: it does not establish
realizability of those moments, lower-bound the true functional, or refute the
augmented target. See REMOTE §5 and STATUS 13.12.

### 2.2 Joint remainder: full tail inputs and cutoff 2.9

[JOINT](JOINT.md) re-derives the full inherited box reduction and certifies the
formerly excluded scalar constants. Keeping the angular average instead of its
worst denominator yields, at all three rows and all amplitudes,

    abs(x)≥2.9  ==>  r_x(α,β)≤.935(abs(α)²+abs(β)²).

Both signed and robust targets then have at least **.007 reserve**. For amplitude
radius .4, this leaves only **0≤x≤2.9**, both relative phases retained, with the
unchanged reserves .0000753 or .0000807. The shift interval is 58/85 of the previous
4.25 interval. The compact inequality is still open. The new reserve does not justify
the same shortened interval for the old radius-.3 row, which requires a larger reserve.

The peak sharp local A/B eigenvalue is certified in
**(.298364651634117,.298364651634118)**. A genuine shared Gaussian-driver direction
realizes it. Flank and upper values are .323152847874178… and .327715897185325….
These constrain global targets; they do not prove an all-amplitude cost.
The imaginary pointwise Q/ν minimum **−.387101627337726…** and ν-energy
**.418138450101614…** are also enclosed. Constant nonzero Q remains inadmissible
as a centered remote quadratic, and the genuine zero-core mixed term averages to zero.

Status: **P by author, not externally reviewed + C**, STATUS 7.4.5 and 7.4.9.

### 2.3 Retained symmetry and explicit strictness

[FOUNDATIONS](FOUNDATIONS.md) removes the visible first-chaos multiplier exactly
for every Z-even G, proves the complex-s trial, and re-derives the two-sided remote
penalty estimate. Its new explicit family q=cX(|Y|²−1) has strict retained improvement
at **every** amplitude and positive profile; q=cXY conjugate(V) with three independent
standard remote complex Gaussian coordinates instead has equality.
The peak finite witness uses rational moments and derivative budgets, without quadrature.
All multipliers belong to the actual coordinate space; the auxiliary benchmark W is
not inserted into it. No optimization is interchanged with a diffuse weak limit.

Status: **P by author, not externally reviewed + C exact witness**, STATUS 3.16.

## 3. Whole-monograph coverage and limits

This was a bounded fresh sweep of the entire monograph and the P/C ledger against
their scopes and prior reviews. It is not a claim to have re-proved or replayed every
archived certificate. The earlier audits remain evidence where explicitly identified.

| Monograph section / ledger | Fresh work in this pass | Inherited or unresolved |
|---|---|---|
| §§0–1 / STATUS 2 | Distinguish raw, response-restricted and full first-chaos dual objectives; exact retained trial and remote separation; benchmark multiplier scope. | Exact gate-free row, response ellipsoid and general strong-convexity theorem retain earlier derivations. No response region silently omitted. |
| §2 | Re-derive visible parity and first-chaos removal for the even core q+A+B. | Full sector decomposition/frequency accounting retained; no nonzero-core odd decoupling promoted. |
| §§3.1–3.2 / STATUS 4–5 | Compare q=0, visible independence and conditional-covariance hypotheses with the corrected ledger. | Previous one-coordinate, disjoint and conditional-Gaussian certificates not rerun. Flank/upper M_j envelope 2.7a retains its author-side status. |
| §3.3 / STATUS 3 | New remote objective distinction and physical-profile Hermite certificate; freshly replay used integrals and exact continuum acceptance. | Original 3.3(ii) complete Stein cover and moment theorem retain their earlier review. 3.2 and 3.3(i) stored-grid caveats unchanged. PVD/BNC literature not newly audited. |
| §§3.4–3.6 / STATUS 6 | Check family hypotheses; 6.3.6 really allows any centered independent P with finite second moment, as its original Taylor/concavity proof states. | 6.3.5 remains conditional on stored bounds; 6.3.6 numerical premises, 6.3.10 and 6.3.12 retain R qualifications. Missing universal tensor derivation in 6.3.11 remains missing. No family scan becomes universal. |
| §4 / STATUS 6,11 | Separate sector-only gain from the augmented benchmark-slack certificate; review central γ domain, 56 samples versus a continuum, and the strict decimal endpoint. | Generic content-vs-deficit remains open. The partly reviewed complex/scalar passage for 3δ^(3/2) and uniform content 1/2500 remain excluded from new proofs. |
| §4b / STATUS 7 | Re-derive full joint tail reduction, certify scalar inputs, shorten shift interval, sharpen local spectra, retain both relative phases. | Compact joint premise and nonzero-core odd-sector control remain open; positive infinitesimal costs do not imply finite-amplitude costs. |
| §5 / STATUS 8 | Check that retained partial classes do not constitute the all-sector premise of the conditional central consumer. | No new envelope, omitted-response-region coverage, Lean theorem or bound. |
| §6 | Compare attribution corrections with the exact quoted monograph language and review exclusions. | Earlier primary-source checks inherited; no fresh literature theorem claimed. |
| §7 / code inventory | Inspect the three new checkers and reused acceptance interfaces; fresh full replays and output comparisons. | No bulk replay of archived scripts; no audit of Arb internals or new line-by-line audit of the large tilted C++ certificate. |

## 4. Disposition of the #409 review

The complete comment is archived with its URL and reviewed head. It approved the
fourth audit and replayed its five checkers and the direct benchmark. We applied its
scope to the relevant old rows, not to unexamined dependencies.

* **Comment 1, joint constants:** original attribution restored; this pass goes further
  and supplies the complete paper/scalar derivation in JOINT §§2–3.
* **Comment 2, retained trial:** review provenance corrected and trial independently
  re-derived in both FOUNDATIONS and REMOTE.
* **Lost provenance:** restore each named benchmark, local comparison, numerical log,
  four-sector scan and historical advice reference.
* **Index parameters:** energy fractions and angle fraction corrected.
* **SEI severity and literal BNC wording:** narrow active-impact/attribution claims;
  preserve the valid counterexample and implication correction.
* **Sharper joint tail and spectral suggestions:** completed, with cutoff 2.9 and exact
  local eigenvalue enclosures. The suggested near-optimal cutoff is not asserted.
* **Exclusions:** the previous literature addendum, inherited remote moment/Stein work,
  CONTENT §6 statements about #408, large tilted checker, and old coverage assertions
  retain their separate evidence. This report gives its own bounded coverage above.

## 5. Reproduction, internal checks and preservation

From the repository root:

```sh
python3 -I research/conjecture-K/code/fifth-audit-2026-11-15-codex-a7c4/retained_remote_exact.py
python3 -I research/conjecture-K/code/fifth-audit-2026-11-15-codex-a7c4/joint_tail.py
python3 -I research/conjecture-K/code/fifth-audit-2026-11-15-codex-a7c4/remote_augmented.py --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

All three full root replays passed and reproduced adjacent JSON **byte for byte**:
about .07 s, 1.59 s and 13.58 s respectively. No output file is an acceptance input.
The default runs are read-only; explicit `--write-result` only writes adjacent JSON.
The remote `--exact-only` mode is clearly conditional and cannot overwrite its full
Arb-replay result. No dependency was installed. Assertions reject optimized execution.

Internal cross-checks: the foundation worker independently re-derived the joint proof
and replayed its checker; the joint worker reviewed global Hermite reuse, surplus and
coverage and replayed the exact acceptance; the remote worker re-derived the foundation
arguments and replayed its checker. The root read all three proofs and checkers and
replayed all three in full, including fresh Arb inputs. These are same-session Codex
checks, not other-side external approval.

The **325** source files present at the baseline and the entire historical monograph
body are byte-identical. Existing code is unchanged. Only README, STATUS, MONOGRAPH
errata and INVENTORY are edited; new files live in the signed fifth-audit folders.
All new files are text and below 300 KB. No Lean build, lake-file change, binary,
archive or new persistent external artifact is part of this PR.

## 6. One more day

First extend the augmented retained certificate using October Stein cuts, focusing
on the uncovered moderate-energy, non-Gaussian region. Test the exact point
(u,χ)=(.04,4) early: the present moment bank provably cannot meet its budget there.
Keep a hard distinction between a failed upper certificate and a cubic counterexample.
If Stein cuts cannot supply the missing slack, sharpen the tilted content budget
on that region before spending time on a larger cover.

In parallel, test a feasible global joint cost below the sharp local peak threshold,
such as .29, on the now-smaller signed compact domain. Only after those tests are
consistent should an interval cover be built. The generic content theorem, odd
sectors, other row profiles and complete consumer remain separate obligations.
