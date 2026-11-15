<!-- New third-audit report. Agent-ID: codex-a7c4. Refs #400. -->
# Third audit: global kernel alignment and stronger partial bounds

Agent-ID: codex-a7c4. 15 November 2026. Refs #400; follows #398 and merged
reviewer-updated PR #399. Baseline:
`39ae5c2393372213b52db6dcbfd647605e6d7e8b`.

**The peak global kernel comparison in STATUS 7.1.4 is now certified.** The
two analytic inputs explicitly left outside the review of #399 are derived
in full, and several partial constants improve. One inherited neighbourhood
summary still omitted its cubic-chaos hypothesis; this is restored. The
source proofs and reviewer additions check out. Conjecture K remains
open; no new Grothendieck bound or Lean theorem is claimed.

This is a renewed whole-monograph/dependency sweep with deeper work on the
remaining inputs, not another execution of every historical certificate.
Section 4 makes the boundary between fresh and inherited evidence explicit.
Every source file present at this baseline and the historical monograph body
are preserved byte for byte. The reviewer's existing dated edits are part of
this baseline and are retained.

## 1. Reviewer changes and findings

The reviewer approved the previous audit at `fc85514af`, replayed all five
checkers on another installation, independently re-derived the listed
arguments, and then added commit `0b5f85be`. The user merged both commits.
The reviewer's own additions were not covered by their approval. This pass
checked those additions against their underlying proofs.

| Baseline location | Finding or gap | Severity and disposition |
|---|---|---|
| STATUS 3.12–3.14, reviewer commit | The dense-test, convex-cell and direct-benchmark entries match the preceding proofs. Their conditional/formalization boundaries remain explicit. | No defect found. Retained unchanged. |
| A15R REVIEW §4; REMOTE §2 | Three special-function estimates underlying the disjoint cost were replayed but not analytically re-derived by the reviewer. | Analytic review gap, now closed in [POTENTIAL](POTENTIAL.md). No old inequality was false. Two estimates are strengthened and the cost improves. |
| STATUS 6.3.9–6.3.9a (baseline lines 195–196) | The neighbourhood summaries omit p,h∈H₂,₁. Character conditions alone do not control the weighted moment used in the proof: the normalized non-cubic h_R in CONTENT_KERNELS §6 has that moment >R. | Medium, missing scope. Restore cubic membership in all neighbourhood entries. The source proof already has it; no counterexample to its correct theorem is claimed. |
| A15R REVIEW §4; CONTENT §3; STATUS 2.7, 6.3.9a | Complete monotonicity and derivative interchanges were inherited. | Analytic review gap, now closed by the positive all-order recurrence, Gaussian identities and integrability proofs in [CONTENT_KERNELS](CONTENT_KERNELS.md). The old neighbourhood theorem is sound. |
| STATUS 7.1.4; MON errata A item 6; open-problem list | The desired common-center .007 comparison was genuinely open; finite checks did not prove it. | Open dependency now completed: [ALIGNMENT](ALIGNMENT.md), 79 certified cells plus the infinite tail. The earlier ratio counterexamples still stand. |
| STATUS 7.4.2 | The favourable signed budget was numerical and conditioned on the open alignment target. | Improved and exactly checked: excess <.000051525 under the signed joint/content hypotheses. Those hypotheses still need proofs. |
| STATUS §0 and selected proof-status cells | Some living entries still said “not externally reviewed” after Claude's explicit review, and preservation language did not point to the dated source amendments. | Low, provenance only. Link the review and its exclusions; new third-pass arguments still await external review. No historical source is rewritten. |

The previous scope counterexamples are not repackaged as new findings. One
is strengthened: the same corner Q-axis cubic also increases the retained
dual, with an exact lower bound. This rules out a possible retained repair
of full-box odd nonincrease; it is not a counterexample to K or K′.

## 2. Completed results

New paper arguments are **P by author, not externally reviewed**, with
within-session peer checks described below. **C** means the explicit scalar
acceptance and its inspected paper implication, not a Lean theorem.

| Result | Status and exact scope | Improvement |
|---|---|---|
| `\|g_B(v)−.5053g(v)\|<.007` for all v≥0 | **P + C**, peak a,b; arbitrary remote L² q gives `\|\|c_B−.5053c_A\|\|≤.007\|\|q\|\|` in every dimension | Closes STATUS 7.1.4. No other profile, joint finite-amplitude theorem or general content theorem is inferred. |
| Complete monotonicity of −g and −g_B, with all-order derivative envelopes | **P** for every a>0,b≥0; **C** for j≤4 endpoint values at three rows | Makes the analytic continuum bounds explicit. The new signed comparison `−g−sqrt(2)(−g_B)` is also completely monotone. |
| Disjoint cost `1/ε−197/(200ℓ)` | **P + C**, mutually independent Z,q,U; q∈L²; U centered proper Gaussian; ℓ>0, ε>0, β/ℓ∈[2/15,4/19]; all amplitudes | Improves 199 to 197, and the uniform application-box cost from 1/152 to 3/152. Does not cover shared q/U. |
| Content neighbourhood `\|\|h\|\|²≤D(p)/90` | **P + C scalars**, p,h∈H₂,₁, same peak character/core assumptions and total energy≤.0463 | A further 10/9 enlargement from /100. Uses the sharp weighted off-character bound `E\|ell\|\|h\|²≤15sqrt(π)\|\|h\|\|²/16`. |
| Pure P-axis raw cost ≥.41 and `Λhat=Λ` | **P + C scalars**, G=conj(Z)P, arbitrary remote L² P, all amplitudes, whole application box | Distinguishes the P axis from the Q-axis obstruction. The .41 coefficient is not inserted into an unproved simultaneous Q/P inequality. |
| Sharp retained d-axis uniform cost .392424545003417… | **P + C scalars**, G=dZ(T−2), zero even core; whole application box | Safe rational .39242 replaces the raw .15167 on this retained axis. A related joint zero-core odd-block bound is proved in [SECTORS](SECTORS.md). |
| Retained Q-axis corner gain >7e−6 | **P + C scalars**, the explicit genuine cubic `(i/100)Z(\|Y\|²−1)` at (.76,.76,.16) | Retaining the first-chaos correction changes this ray only at order six; full-box odd nonincrease remains false for Λhat. No conclusion that Λ′ increases is inferred from its upper bound Λhat. |
| Favourable signed budget <.000051525 | **Conditional P + C**, peak u≤.0463, joint cost matrix (.24,.26,.118), content `C_A²≤.24D` | Improves the old numerical .00005471. Alignment is now a theorem; joint cost and arbitrary-cubic content remain assumptions. |

The largest advance toward the stated programme is the first row: a named
open scalar obligation is removed. The other improvements sharpen or secure
partial results and should not be mistaken for all-sector closure.

## 3. Reproduction and trust chain

From the repository root:

```sh
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/content_kernels_exact.py
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/potential_bounds.py
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/potential_full_box.py
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/sector_axis_costs.py
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/kernel_alignment.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/alignment_budget.py
```

All six checks passed. The first four and last use the standard library;
the global alignment checker uses python-flint/Arb. Its dependency argument
is unnecessary on an installation that already exposes python-flint. No new
dependency was installed. Every script rejects `-O` and is read-only by
default. The saved JSON files are results, not trusted numerical inputs.

The positive content derivative formulas use the older exact interval and
special-function series library; the sector scalar checker reuses it too.
The improved potential cover reuses the old disk-height/fixed-point helpers.
The global alignment quadrature adapts the earlier finite-node implementation.
These reuses are explicit: the new result is the proved continuum bridge and
fresh acceptance, not a claim of independent implementations of every library.
Bernstein's Laplace-representation theorem is a cited standard analytic input;
the density, Gaussian and derivative transformations are derived in the notes.

Within-session checks: the root agent independently re-derived the content
kernel/occupancy proof and sector arguments and ran their checkers; the sector
worker reviewed POTENTIAL and ran its compact checker; the root replayed its
full-box acceptance; the remote worker checked the global alignment code,
quadrature omissions, curvature constants and continuum implication; the
content worker independently checked ALIGNMENT and its moment factors; the
sector worker reviewed the conditional signed budget. These checks do not
replace independent Claude-side review of this PR.

No Lean build was run. Research-only CI does not execute these checkers or
validate their paper proofs. All new files are small text, Python or JSON.

## 4. Whole-monograph sweep and inherited evidence

| Monograph / ledger group | Work in this pass | Boundary |
|---|---|---|
| §§0–1; STATUS 2,8 | Compared row/response/retained scopes with the just-completed independent review; freshly derived visible scale mixture and kernel derivative inputs | No repeat of old response arithmetic; no new complete consumer |
| §2; STATUS 2.8–2.9,5 | Checked sector normalization and corrected regularity qualifications; new angular P and retained Q/d results | Zero-core results do not extend to arbitrary nonzero even cores |
| §§3.1–3.2 | Rechecked zero-core/conditional-Gaussian hypotheses and exclusion of covariance/sigma-field extensions | Prior Theorems A/B proofs inherited; no additional family declared covered |
| §3.3; STATUS 3 | Checked reviewer entries 3.12–3.14 and source amendments against their proofs | Strong remote certificate and its benchmark replay inherited unchanged; no new remote profile cap |
| §3.4; STATUS 4,6.1 | Full kernel derivation, improved exact disjoint cover and cost | Shared-driver concave-envelope/fourth-moment strips remain inherited R |
| §§3.4–3.6,4; STATUS 6.2–6.3 | Fresh content-kernel and neighbourhood proof; detailed scope ledger in CONTENT_KERNELS §7 | Large Wick/moment/family certificates inherited; unreplayed stored scalar premises remain R/conditional C |
| §§3.5,4; STATUS 6.4–6.5,9 | Rechecked that saddle, diffuse limits and numerical ratio evidence remain distinct from uniform content theorems | No new tensor search or global content maximum |
| §4b; STATUS 7.1–7.4 | Closed scalar alignment; strengthened conditional signed budget; checked local versus finite-amplitude and raw versus retained distinctions | Joint finite-amplitude A/B and odd-at-nonzero-core controls remain open |
| §5; STATUS 8 | Retained fixed-epsilon and complementary-region obligations from the prior audit | Central conditional component is inherited, not a complete lower-bound proof |
| §6 | Checked the primary Bernstein representation reference for the new proofs | Earlier literature correction inherited; other background books not re-audited theorem by theorem |
| §7; README/INVENTORY | Updated new index, review provenance and preservation baseline | Existing source copies, including reviewer amendments, unchanged |
| STATUS 10–12 | Rechecked evidence labels and normalization boundaries against the previous audit/review | No new tail-game result; numerical tilted-A remainder belongs to #396 and remains separate |
| STATUS 13–15 | Compared novelty against failed routes; removed the now-closed scalar target from the open work list | No failed ratio bound is revived, no all-sector completion implied |

## 5. Next work with one more day

Use the certified .007 alignment in an actual finite-amplitude joint A/B
argument, keeping shared-driver dependence and the signs of the mixed term.
Coordinate with the worker on #396: its prospective global tilted-A
remainder estimate may remove a separate localization/tail obligation, but
the numerical statement in the review is not a theorem to consume yet.
Keep the remaining all-sector and fixed-witness response-cover obligations
explicit. Repeating the now-closed scalar comparison is no longer a priority.
