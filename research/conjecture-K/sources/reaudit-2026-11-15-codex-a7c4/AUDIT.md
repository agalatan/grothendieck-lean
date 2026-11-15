<!-- New audit report, authored here on 15 November 2026. Agent-ID: codex-a7c4. -->
# Second audit of the Conjecture K monograph

Agent-ID: codex-a7c4. Refs #398, following #395 and merged PR #397.
Audited baseline: `b0ec41d69c2a0f4942d44e81dc39ce28d0fc033c`, including Claude's
review changes; merged master `8ab5b606ebea07e888b45861ebd74b7593fbc449` has
the same tree. Locations below refer to that baseline, before new errata
shift the monograph's line numbers.

**Conjecture K remains open. No new Grothendieck bound is claimed.** The
second pass finds additional domain and regularity omissions, proves actual
cubic counterexamples to two overly broad odd-cost statements, and completes
several useful proof/certification steps. It confirms the stronger peak remote
certificate and the previous n=1 theorem within their stated scopes.

The historical monograph body and every source file already present at the
baseline remain unchanged. Corrections go into the living ledger and errata;
new evidence is in this directory and its matching code directory.

## 1. Findings, evidence, and corrections

| Finding and baseline location | Severity | Evidence and correction |
|---|---|---|
| Response energy `.072` loses its t threshold: README 65–67; MON §1, 292–296 | Medium | At peak ε it requires `t≥.8456`; at `t≥.84` the total cap is `.081884`. A genuine response at t=0 has energy `>.0939738`. Restore thresholds and ε; the ellipsoid and Rice tangent are freshly re-derived/certified in [FOUNDATIONS](FOUNDATIONS.md) §2. |
| MON §3.1 defaults to the full box but prints positive zero-core odd costs: 318–330 | Medium | At `ε=ℓ=.76, β=.16`, the genuine cubic `(i/100)Z(|Y|²−1)` raises Λ above Λ(0) by `>7e−6`. Restrict the printed positive costs to their rows. [SECTORS](SECTORS.md) §§2–3; exact finite-amplitude checker. This is not a counterexample to K. |
| Historical flank d-cost `.36`: MON §4b, 726 | Medium | The earlier audit only said its tangent certificate could not justify rounding upward. Sharpness plus the explicit cubic `(i/100)Z(T−2)` now disproves the actual `.36` inequality by `>5e−7`. Keep the correct `.356` ledger value. SECTORS §4. |
| Parity is used as differentiability: STATUS 2.9/7.2.1; MON 714–716. STATUS 2.8 also attaches a first-variation claim to “every G” | Medium | An even L² base has a positive cusp along a genuine odd cubic. At an arbitrary, non-even cubic base the odd derivative need not vanish. Parity always holds; first-variation and Hessian consequences need the stated base and existence assumptions. Genuine even cubic bases do have the first derivative. SECTORS §6. |
| The `.0223` shared-A strip is presented as following from the displayed linear bound: STATUS 6.1.1, 153 | Medium | At `(u,w)=(.0463,.0223)` the linear increment is `.015269848`, too large. The archive uses a separate concave-envelope estimate for that strip. Restore the separate dependency; its old numerical premise remains R. [REMOTE](REMOTE.md) §1. |
| Schur optimization drops positive definiteness: STATUS 7.4.1, 259 | Low | With diagonals 1 and mixed coefficient 2, the printed formula is zero at zero contents but the unrestricted gain is unbounded. Restore the hypotheses already present in the source. SECTORS §7. |
| New positive-part assembly note divides by κ at κ=0: STATUS 11.23 | Low | Require κ>0 for `D≥−η_A/κ`; require η_R≥0 for the simplified positive-part error budget. The intended lemma is otherwise correct. SECTORS §7. |
| Literature synopsis omits an input hypothesis: MON §6, 770–773 | Low | The cited homogeneous-sum fourth-moment theorem assumes centered variance-one inputs with zero third moment as well as the fourth-moment condition. It is asymptotic background, not a content theorem. Primary-source check in FOUNDATIONS §5. |

None of these findings invalidates the exact row identity, peak remote
`3.6e−7` allowance, correctly scoped three-row costs, or the full-box n=1
optimum. They do rule out silently widening the scope of those results.

## 2. Completed improvements and status

New arguments are **P, by their author, not externally reviewed**. Their
within-session peer reviews are listed in section 4, and do not substitute
for independent Claude-side PR approval. **C** below identifies exact or Arb
scalar acceptance and its paper implication. **N** retains its usual meaning;
no finite search has become an upper-bound theorem.

| Result | Status and exact scope | What it changes |
|---|---|---|
| All-amplitude disjoint-driver cost `Λ(q+(T−1)U)≤Λ(q)−[1/ε−199/(200ℓ)]‖U‖²` | **P + C**, recovered existing theorem: mutually independent Z,q,U; arbitrary L² q; U centred proper Gaussian; ℓ>0, β/ℓ∈[2/15,4/19], ε>0 | Closes the previously R numerical premise of STATUS 4.2 with an independent integer port, including the infinite scale ray. Cost is at least 1/152 on the application box. It does not cover shared drivers. |
| Larger content-controlled neighbourhood | **P by author + C scalars**: the character/core assumptions of STATUS 6.3.9, peak row, total energy≤.0463, `C(p)²≤.225D(p)` and `‖h‖²≤.01D(p)` imply `C(p+h)²≤.24D(p+h)` | Permitted remainder energy grows by 5/3 from `.006D(p)`. [CONTENT](CONTENT.md) encloses M₁ rather than using its earlier coarse bound. It is still a conditional neighbourhood theorem. |
| Sharp full-box one-coordinate cost | **P by author + C scalars**: exact best k_* lies in `(0.151676198434561,0.151676198434562)` | The safe rational coefficient `.15167` improves `.15`; sharpness comes from imaginary d→0 at the worst corner. Only the one-coordinate axis is covered. |
| Regional response caps and retained weak duality | Existing arguments **P**, independently re-derived; response scalar premises **C** | Restores the missing response domains. Establishes the previously R implication `Λ′≤Λhat` without a minimax interchange. Other response constraints grouped in STATUS 2.12 are not automatically upgraded. |
| Inner retained-dual optimization certificate | **P by author**: unique minimizer has norm≤√π/2; a full-projection residual r gives `J(a)−‖r‖²≤min J≤J(a)` | Turns a numerical inner optimum into a checkable error budget if J and the residual are enclosed. It does not certify the outer tensor or sector maximum. |
| Central single-row consumer component | **Conditional P + C**: given all-sector raw/retained peak K_η, η≤1e−4 covers t∈[.84,.851], indeed [.83995,.85125] | Exact maximum allowance is `.0001006120988404375…`; remaining cap margin exceeds `6.12e−7`. Uses the existing S enclosure. A remote-only theorem cannot discharge the all-sector premise; complementary response regions remain. |
| Direct Gaussian benchmark and supporting gradients | **C**, fresh 160-bit Arb calculation using direct I₀/I₁ Rice integrals | Independently confirms the old benchmark without its integration-by-parts rewrite; supplies an explicit Gaussian supporting plane. |
| Rational-knot spectral cuts from square-mesh cuts | **P by author**, with an explicit expectation-error bound under EU=1 and EU²<∞ | A future Lean port can retain the 45 numerical duals and extend tests by density. Re-optimization is an option, not a necessity. No formal port is supplied. |
| Convex-cell transfer criterion | **Conditional P by author**, with certified Gaussian support values/gradients | Vertex remote caps and a concave Gaussian lower support suffice throughout a cell. No new cell is claimed without its vertex caps. The old seven-million-anchor estimate applies only to the first-order Lipschitz method. |

The central-row calculation changes the immediate order of work: there is no
need to cover the whole profile box just to consume a peak all-sector theorem
on the stated central interval. This is a conditional simplification, not a
claim that the all-sector theorem or the outside-central response cover exists.

## 3. Full-monograph coverage and inherited evidence

This is a section-by-section mathematical and dependency audit, not a fresh
execution of every historical package. All living P/C claim groups were
compared with their stated domains and the prior confirmation ledger. A
certificate is newly upgraded only where a fresh check is identified above.

| Monograph section / ledger group | Second-pass work and result | Remaining trust boundary |
|---|---|---|
| §§0–1; STATUS 2,8 | Raw row and both square completions, response restrictions, retained weak dual, fixed-ε endpoint consumer re-derived | No unconditional lower-bound consumer; all-sector premise remains open |
| §2; STATUS 2.8–2.9 | All six bidegrees, weighted orthogonality, frequency and parity checked; regularity correction added | No arbitrary-base Hessian existence inferred |
| §3.1; STATUS 5,2.6 | Odd costs re-derived, sharpness and two finite-amplitude witnesses; full-box n=1 proof challenged and sharpened | Theorem A keeps q=0 and its profile hypotheses; higher-dimensional zero-core odd nonincrease fails on the full box |
| §3.2; STATUS 5.2–5.3 | Checked conditioning independence, nonnegative variance coefficients, exclusion of cross-covariance | Prior analytic Theorem B proof inherited; no additional family silently included |
| §3.3; STATUS 3 | Inspected strong acceptance internals, infinite tails, analytic guards, Hermite bounds, exact coverage and Lean premise mapping; independently recomputed S | Existing sixth-moment input inherited; no new full remote replay needed after two prior independent ones; other remote/BNC assertions stay R/open as labelled |
| §3.4; STATUS 4,6.1 | Recovered disjoint cost end to end; corrected attribution of large-w strip | Shared-driver fourth-moment/concave-envelope certificate remains R |
| §3.4, family results; STATUS 6.2–6.3 | Compared class/energy/phase scopes against CERTIFICATE_AUDIT and source proofs; re-derived and strengthened the mixed-character extension | Large R23/Gaussian-factor/self-interaction runs inherited, not rerun; conditional scalar inputs remain conditional; new core theorem not assumed |
| §§3.5–3.6,4; STATUS 6.4–6.5,9 | Checked that saddle, fifth-order content, family nonadditivity and numerical-search limitations remain explicit | No new global ratio supremum; prior floating searches remain N |
| §4b; STATUS 7 | Rechecked local retained complex form, parity, separate-versus-joint costs, positive-definite optimization and error assembly | Finite-amplitude joint and odd-at-nonzero-cubic-core results still missing; compact Hessian inputs not regenerated |
| §5; STATUS 8 | Exact central budget, finite-row endpoint logic and response-region thresholds | Fixed peak row alone does not certify 1.4022 on the whole central interval; no Lean integration |
| §6 | Primary-source fourth-moment scope correction; literature distinguished from proof inputs | Other background books/papers are not newly audited theorem by theorem |
| §7; README/INVENTORY | Historical map preserved; new commands, dependencies and outputs indexed | Archived absent/large certificates not imported or relabelled |
| Post-monograph STATUS 10–12 and Claude update | Retained matrix, fixed-tilt signs, signed/positive-part budgets, tail scope and novelty checked | Earlier numerical searches and unrelated endpoint improvement certificates inherited with their labels |
| STATUS 13–15 | Checked proposed work against failed routes; added new scope tests and adjusted next steps | No silent closure of K, global kernel comparison, shared sectors or remaining response cover |

The appendix notes give more granular line locations and analytic checks.
In particular REMOTE §1 records what was inspected inside `profile.py` and
the Bernstein/half-line acceptance, areas Claude's first review had only read.
No new soundness defect was found there.

## 4. Reproduction, peer checks, and delivery

Run from the repository root (all commands are read-only by default):

```sh
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/foundations_exact.py
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/content_constants.py
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/sectors_exact.py
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/remote_disjoint_cost.py
python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/remote_benchmark_crosscheck.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

The last dependency argument is unnecessary when python-flint is installed
normally. The other four scripts use the standard library. CONTENT and SECTORS
reuse the earlier exact interval/series library by an explicit relative path,
recomputing all scalar inputs; they are not independent implementations of that
library. Every new script rejects `-O`. Saved JSON files are small records, not
trusted numerical inputs. The scripts are not run by repository CI.

Within this session, the foundations worker independently checked CONTENT and
its scalar checker; the sectors worker checked FOUNDATIONS and the disjoint
analytic proof/port; the remote worker checked the sector witnesses and reran
their exact script. The primary agent reviewed all notes, recomputed the exact
budgets and ran the new checks. These are useful cross-checks, **not independent
Claude-side approval**. External review of the new PR is requested.

No Lean build, lake/workflow change, binary, archive, or large output is needed.
This PR changes only `research/conjecture-K/`; research-only CI can report
success without checking any of these mathematical assertions. The checkers
and paper proofs above are the actual evidence.

## 5. What to do with one more day

1. Keep the immediate target at the peak profile. Use the exact central
   consumer and corrected response regions to write a finite obligation list;
   do not spend effort generating millions of profile anchors for that interval.
2. Certify the remaining global scalar comparison
   `|g_B−.5053g|≤.007`, or replace it with a direct B-content estimate. Preserve
   the separate joint finite-amplitude hypothesis; scalar alignment alone does
   not close A+B.
3. Coordinate with the worker pursuing the tilted-sector lemma. The remaining
   hard questions are shared-driver finite amplitudes, Gaussian amplitude
   tails, and odd sectors at genuine nonzero cubic cores at the selected rows.
   Full-box odd monotonicity is now explicitly an invalid target.
4. For a future formal remote port, use `spec_of_inputs` directly and the
   dense-test extension, then check the exact certificate format. This is an
   implementation plan, not a claim that a Lean theorem was added here.
