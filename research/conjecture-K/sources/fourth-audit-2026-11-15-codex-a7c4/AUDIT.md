<!-- New fourth-audit report. Agent-ID: codex-a7c4. Closes #406. -->
# Fourth audit of Conjecture K, after #403 and the #408 resync

Agent-ID: codex-a7c4. 15 November 2026. Task
[#406](https://github.com/agalatan/grothendieck-lean/issues/406).
Initial master: `2442792eab87cc48a71ba29dc74be7a250b4a03a` (merged #403).
Requested resync: `9a93fb47264f12c74840bc671a80154abc7eca28` (merged #408).
This report includes the new tilted-sector material at that second baseline.

**K remains open.** This pass finds two false auxiliary statements, corrects
logical and numerical scope, and finishes several smaller dimension-uniform
results. None is a new lower bound on the Grothendieck constant, a complete
all-sector theorem, or a Lean result.

New proofs are **P by author, not externally reviewed**. Three workers and
the root worker cross-checked the arguments within this session; that is
not Claude-side PR approval. **C** means the named exact/interval checker
was replayed with its mathematical implication inspected. **N** remains
numerical, **R** remains read only, and inherited reviewed results retain
their actual review boundaries. The five new checkers use `python3 -I` and
the standard library; the separately replayed older benchmark uses Arb.

## 1. Findings, most consequential first

Locations and line numbers in this table refer to baseline `9a93fb472`.
All corrections are applied in the living ledger/errata and new notes;
historical source files are preserved.

| Finding and location | Severity | Evidence | Correction and status |
|---|---|---|---|
| `ch32-stronger.tex`:118–119, “SEI and sums”: SEI plus any independent symmetric unimodal addend is said to remain SEI | High: a false closure lemma | X₁=Z₁Z₂Z₃/3 is SEI, but Y=X₁+U, U uniform on [−1,1], has positive SEI interval gap ≥91/18000 | **Refuted**, P by author + C scalar arithmetic. Give correct Gaussian-addition and two-SEI-summand closures; STATUS 3.5a, 13.11/78; `REFORMULATIONS.md` §§4–5 |
| STATUS §15 item 1:968ff and 7.4.5:319 propose exact global A/B cost .300, despite the local warning in 11.45:669 | High: an impossible next certificate target | The genuine cubic direction r_A=sX, r_B=−sX/5 has local normalized cost in (.298526023077303,.298526023077304) | **Refuted**, P by author + C scalars. Retain the signed target or test a smaller global cost, e.g. .29; do not present .29 as proved. STATUS 7.4.8, 13.11/81; `JOINT.md` §2.1 |
| MON §3.3:432 and STATUS 3.5:167 equate BNC with the real form of PVD inside an equivalence summary | Medium: the sufficient implication is stronger than the target and its converse is absent | BNC is monotonicity of the normalized Gaussian-smoothed absolute mean; real PVD is its upper bound. The source proves BNC ⇒ PVD only | Re-derive the correct implication diagram and complex equivalences, including EVERY price and all finite dimensions. P by author; conjectures remain open. `REFORMULATIONS.md` §§1–3 |
| README:50 says the Gaussian attains the cubic supremum; `ch32`:15 displays equality in fixed H₂,₁(ℂⁿ) | Medium: dimension/attainment ambiguity with a false fixed-n reading | At n=1 and the peak, the reviewed axis theorem gives supremum B₀<S; the Gaussian cubic approximation uses increasing dimensions | Use a dimension-uniform supremum approached by diffuse sequences, not fixed-n attainment. P by author using reviewed inputs; `REFORMULATIONS.md` §6 |
| STATUS 11.38:662 and 11.43:667 promote numerical deficits at 56 pairs to a statement “on this family” | Medium: continuum coverage is not established | Certified content bounds were combined with 56 floating deficit evaluations | Qualify the conclusion as N at those 56 sampled pairs. No continuum-family certificate; `CONTENT.md` §6 |
| STATUS 11.45:669 interprets `share=.375` as 37% B, and five-sector .58/.42 as coefficients | Low: wrong description of scan coordinates | The joint script uses angle/(π/2), so .375 gives sin²(3π/16)≈30.9% energy; the other script prints actual energy shares, which do not fix phases | Correct both interpretations; exact radical checks, `JOINT.md` §2.1–2.2. Historical “12% B” similarly means about 3.81% energy |
| STATUS 3.12:174 omits cut admissibility; 11.44:668 omits the central variance lower endpoint | Low: summarized domains hide essential assumptions | The cut uses U≥0, λ,μ>0, ν≥0. The October central rectangle is [7/200,23/500]×[0,1/5], inside the central content theorem's domain | Restore the domains and inspect the actual endpoint-polynomial argument. `REMOTE.md` §§1,6; no augmented certificate claimed |
| STATUS 11.42:666 and TILT-REV3 print equality at decimal endpoint .00196979 | Low: equality is inaccurate | The exact expression with √42 is strictly below 2·10⁻⁵ there | Change the living ledger to `<`; the safe endpoint and class conclusion are unaffected |
| Third-pass labels still say review pending after #403; A15T ALIGNMENT overloads B | Low: review provenance/notation | Archived reviewer comment identifies exactly what was re-derived/replayed and what was excluded | Apply those review scopes, distinguish B_ker=−g_B from B_Gauss in errata, fix “below 1.97”; preserve source text |

The SEI example uses a genuine third-chaos first summand but a non-chaos
second summand. It refutes the closure as printed, not K or third-chaos
BNC. The .300 example is a genuine cubic but refutes only that stronger
cost. These boundaries are part of the findings.

## 2. Completed mathematical progress

All rows below are **P by author + C**, pending external review. Claims are
dimension-uniform within their stated scopes. The first four strengthen
existing results; the final two are exact obstructions/consequences of
already known ingredients, not claims of a new general method.

| Result | Exact scope and gain | Proof/checker |
|---|---|---|
| Sharper shared-A affine bound | At the peak, for every joint remote L² q,r with E[conj(q)r]=0, Λ≤B₀+.389644u−.124324w. The cone u≤.00558+.31907w gives error <10⁻⁴ | `CONTENT.md`; `shared_a_second_moment.py` |
| Three stronger shared-A strips | For all u≤.0463, thresholds w≥.0206, .0208, .02105 give Λ<S+10⁻⁴, S, S−10⁻⁴. All larger w are covered analytically. These improve .0223/.0225/.0228; the better fourth-moment .01125 claim stays R | Same; concave circular envelope, derivative signs, three exact finite integrals with analytic tails |
| Larger remote profile rectangle | λ=ε/.7564, ε∈[.74,.76], 0≤a/λ−.5592≤1/2000, 0≤b/λ−.1432≤1/625 gives Λ<S+.000099337 for every remote cubic and energy. The old tube still covers other directions | `REMOTE.md` §2; `remote_profile_transfer.py` |
| Joint local reserve and shorter remaining shift interval | Common .08 reserve over the signed (.24,.26,.118) local matrix at all three rows, improving .07. For every amplitude, abs(x)≥17/4 has .027 reserve; remaining compact domain is x∈[0,4.25], abs(α),abs(β)≤.4, both relative phases retained | `JOINT.md` §§2–4; `joint_reduction.py` |
| Exact pointwise five-sector obstruction | Coefficients (k_Q,k_P,ν)=(i,0,−i) have local cost <−3/8. Replaces a numerical obstruction with an exact one; constant Q violates genuine cubic centering, so no integrated cubic theorem is refuted | `JOINT.md` §2.2; `joint_reduction.py`; strengthens existing §13 item 77 |
| Central near-Gaussian retained A-core | At the peak, .03≤u≤.0463 and χ≤.07 imply Λ̂(q+(T−1)r)<S+3115324569897527/159324300000000000000<S+2·10⁻⁵ for every remote linear r and every sharing/amplitude | `REMOTE.md` §6; `remote_profile_transfer.py`. Combines reviewed #408 inputs with the reviewed peak remote cap; no deficit sign assumption, B sector, odd sector or profile transfer |

The remote rectangle uses the Gaussian competitor's supporting plane, so
the transfer pays the norm perturbation once and retains its favorable
benchmark derivative. It does not require a new remote optimization at
each profile. The central retained subclass pays γχu²/k directly and does
not require building the proposed augmented remote certificate first.

`REFORMULATIONS.md` also completes the fixed-profile equivalence argument:
universal complex sharp radius ⇔ Gaussian-buffer PVD ⇔ same-variance
domination at one fixed a>0,b≥0 ⇔ exact remote K there at every price.
This follows from the old buffer/mixture ingredients plus a tangent-price
argument and a scaling limit. None of the equivalent conjectures is proved.

## 3. Whole-monograph audit coverage

This was a bounded full section sweep, followed by targeted re-derivations;
it is not a claim to have replayed every historical package again. The
preceding three audits and their independent reviews are inherited where
no new check is named. Every P/C ledger group was compared with its stated
scope and dependency boundary. The new #408 material was audited on top,
not ignored as a concurrent update.

| Monograph/ledger region | This pass | Remaining evidence boundary |
|---|---|---|
| Errata A–F, MON §§0–1; STATUS 1–2 | Reconcile the six layers, regional versus raw statements, fixed-dimension attainment, and #403 review status | No new witness bound or Lean claim; inherited counterexamples and response feasibility keep their established scopes |
| MON §2; STATUS 2.8–2.13 | Check decomposition, normalization and raw/retained distinctions against new proofs | Response and parity re-derivations from A15R inherited; no blanket upgrade of its other response cuts |
| MON §§3.1–3.2; STATUS 5,7 | Re-derive joint zero-base matrix and pointwise obstruction; compare with reviewed pure P/d and zero-core odd results | General nonzero-core odd-sector control remains open; conditional Gaussian statements retain independence/variance-shape restrictions |
| MON §3.3; STATUS 3 | Re-derive all remote equivalence arrows; inspect ch32 SEI/BNC; inspect/replay Rice benchmark; prove profile transfer; inspect actual October endpoint structure | Peak cap and moment/Stein premises inherited from the earlier full replay and review. No new all-row cap or same-variance domination |
| MON §3.4; STATUS 4,6.1 | Complete the orthogonality-only bound and stronger unbounded-w strips; reconcile disjoint cost review | The fourth-moment cutoff .01125 remains R. The strip is proved by a nonlinear envelope, not inferred from the affine cone |
| MON §3.4 content subsections, §§3.5–3.6; STATUS 6.2–6.4 | Check dependence on reviewed kernel/occupancy results, preserve family and conditional qualifications, reverse-check actual Bernstein polynomials | Old family certificates are inherited; no new certificate for all tensors or for the numerical extremizer |
| MON §4 and “THE WAY”; STATUS 13–14 | Check failed-route history before claiming novelty; add the SEI, attainment and .300 distinctions | Monomial saddle/known counterexamples remain; exact five-sector witness explicitly strengthens an existing N obstruction |
| MON §4b; STATUS 7 | Re-derive joint tail with exact three-row scalars; shrink x-domain; do not integrate the local matrix through nonzero bases | Finite compact joint A/B and generic content still open |
| MON §5; STATUS 8 | Compare new subclasses with the actual all-sector premise of the exact central consumer | A remote/A-only theorem cannot substitute for that premise; complementary response regions still needed |
| MON §6; STATUS 9,12 | Check primary Bernstein, DLMF and homogeneous-sum references cited in `REFORMULATIONS.md` §7 | Book/Arb internals not reconstructed; no asymptotic theorem promoted to finite-amplitude control |
| MON §7, README/INVENTORY; STATUS 10 | Check index/provenance and identity-tail/model versus certificate distinction | No new tail-witness experiment or certificate; historical external paths remain historical |
| STATUS 11(c)–(e), merged #408 | Read fifth report and third review, inspect secant/content assembly, check sample scopes, scan definitions and central-domain compatibility; derive χ≤.07 retained subclass | The large tilted C++ and Arb certificate replay is inherited from TILT-REV3, not rerun or audited line by line here. Partly unreviewed 3δ^(3/2) and 1/2500 inputs remain R |

The two historical analytical exclusions closed in #403 stay closed. The
older dyadic interval code used here was additionally inspected: outward
integer rounding, four-corner products, reciprocal and square-root bounds,
Machin π series, exponential/erf tails and the radial recurrence in their
used domains. This is source-level mathematical inspection, not a formal
proof of Python arithmetic or a claim about every historical checker.

## 4. Disposition of the #403 review

The exact comment and reviewed head are archived in
[`REVIEW_403_claude-b9ee.md`](REVIEW_403_claude-b9ee.md). It approved
`8bd28e91d9ce8298e65b52f343aac3a2a64177a3`; it does not review this PR.

| Reviewer item | Action |
|---|---|
| README/STATUS review-label disagreement for disjoint cost and alignment | Mark the precise re-derived/replayed results P+C with the reviewer named; also apply its listed sector and content checks |
| 6.3.9a kernel input | Name the now-completed external review |
| Number collisions with the then-pending tilted update | Use the merged #408 numbering; new failed routes start at 78, new discrepancy rows at 43, joint obstruction at 7.4.8 |
| B used twice in ALIGNMENT | Record B_ker/B_Gauss erratum, preserve historical source |
| “below1.97” | Fix spacing in the living index |
| Older Arb benchmark and literature exclusions | Inspect/replay benchmark implementation, inspect primary statements; record limits |
| Exact Bernstein arithmetic exclusion | Reverse-expand all six actual certified polynomials and match coefficients exactly |
| Flank/upper Mⱼ, library internals, unrelated cuts | Do not blanket-upgrade. Used dyadic operations inspected as stated above; no Arb-internals claim |

## 5. Reproduction and preservation

Run from a checkout of this PR, without `-O`:

```sh
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/reformulations_exact.py
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/shared_a_second_moment.py
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/remote_profile_transfer.py
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/joint_reduction.py
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/bernstein_crosscheck.py
```

All five pass and reproduce the adjacent JSON results. They are read-only
by default; optional `--write-result` on the four argparse scripts writes
only the adjacent result. The reformulation checker prints its result.
The exact shell arithmetic/interval operations are separated from the
paper implications. `REMOTE.md` gives the separate command for the older
Arb benchmark, which also passed byte-identically. No new dependency was
installed and no Lean build was run.

Relative to `9a93fb472`, all **319 existing source files** are byte-identical,
as is the historical monograph body after its explicit verbatim marker.
Changes are restricted to `research/conjecture-K/`: four living documents,
six new source notes, five checkers and five small JSON outputs. No binary,
large certificate or archive is added; every new file is below 300 KB.
No new external artifact is needed. README indexes the new files; INVENTORY
records baseline and replay provenance. These counts describe this audit's
preservation check, not the repository's evolving theorem/axiom totals.

## 6. One more day: bounded next work

1. **Prioritize the augmented remote certificate for the retained A-core.**
   Keep the peak profile and use only the reviewed γδ and (2/25)δ inputs.
   The χ≤.07 central region is already closed here. Test the neighboring
   rectangles and measure the dual slack after adding H(u,δ)/k; regenerate
   only the failing duals. The endpoint argument was inspected, but a
   successful cover still has to be produced. Stop with the exact blocking
   rectangles if the relaxation cannot retain enough deficit.
2. **In parallel, test a feasible raw A/B global cost before certification.**
   Exclude .300, use a conservative candidate such as .29, and retain the
   full phase variables. If it fails, use the signed fallback on the now
   smaller [0,4.25] shift interval with the original amplitude-tail budget.
   A local .08 reserve alone is not a finite-amplitude proof.
3. **Keep the consumer honest.** A successful A-core certificate still
   needs B/odd sectors and complementary response regions. Use only the
   profiles required by that eventual row cover; the new remote rectangle
   is useful coverage, not a substitute for an all-sector theorem.

The new PR requests Claude-side review and is not landed by this audit.
