# Conjecture K: state of knowledge on 15 November 2026

Conjecture K is **open**. This file lists every statement about it that is proved, certified, only computed, open or
refuted, with its exact scope and the place that establishes it. Notation and the statement are in
[`README.md`](README.md), part (a).

## 0. How to read this file

**Labels.** Those of the independent audit of 13 November (agent codex-a713):

| label | meaning |
|---|---|
| **P** | independently re-derived by the audit |
| **C** | exact or interval checker replayed by the audit, with the implication from the check to the theorem inspected |
| **N** | numerical only (floating point), with its stated accuracy. A search gives candidate values and lower bounds on a supremum, never an upper bound over all tensors or dimensions |
| **R** | read from the record without full independent verification. This includes proofs written by us or by an external assistant, and certificates that were "replayed green by the user" but not by the audit |
| **open** | not proved; no claim |
| **refuted** | false as stated (the entry says how that is known) |

A status is never higher than its source supports. "A claim absent from the confirmation ledger is not implicitly
verified" (`REPORT.md` section 1): such claims are **R** here even when the monograph prints [P] or [C].

**Follow-up audit, 15 November (codex-a7c4).** `sources/audit-2026-11-15-codex-a7c4/AUDIT.md`
records a bounded section-by-section audit and separates fresh checks from inherited evidence. New paper
arguments are labelled **P, by their author, not externally reviewed**; same-session sub-agent checking is
identified in the notes and is not independent Claude-side PR approval. **C** names the exact checker and its
mathematical inputs. Historical source files and the monograph body are unchanged.

**Second pass after PR #397 (codex-a7c4).** `sources/reaudit-2026-11-15-codex-a7c4/AUDIT.md`
records the renewed section-by-section review, explicit response/cost/parity scope tests, and new exact checks.
The independent review of that pass is A15R `REVIEW_claude-b9ee.md`: all five checkers replayed, and the listed arguments re-derived. Its exclusions remain explicit. Previously verified large certificates are inherited unless a fresh check is named. The reviewer added dated corrections to A15 `REMOTE.md`; preservation is measured against each audit's own baseline.

**Third pass after PR #399 (codex-a7c4).** A15T closes the global peak kernel comparison, derives the remaining potential/monotonicity inputs, and strengthens several partial bounds. Claude-b9ee re-derived the listed arguments and replayed all six checkers in the review of #403, archived as A15F `REVIEW_403_claude-b9ee.md`. Only the scopes covered there acquire that review; its exclusions are not blanket approvals.

**Fourth pass after PR #403, resynced through #408 (codex-a7c4).** A15F records the section-by-section audit, the reviewer-comment disposition, and the newly merged tilted results. Its listed proofs and all five checkers were subsequently re-derived/replayed by claude-b9ee on #409; the review, including exclusions and two provenance corrections, is archived as A15V `REVIEW_409_claude-b9ee.md`. It corrects the remote/BNC and attainment summaries, refutes an unrestricted SEI closure and the literal .300 joint-cost target, and strengthens remote, shared-A and joint-tail regions. All sources present at `9a93fb472` and the historical monograph body are preserved.

**Fifth pass after merged #409 (codex-a7c4).** A15V begins at `0882c67d3`. It addresses every comment on #409, retaining historical sources and the prior reviewers’ explicit scope. New mathematical work is **P by author, not externally reviewed**, with named exact/interval **C** acceptance and same-session peer checks. This is separate from the now-reviewed fourth-pass results.

**Entries of 15 November (section 11, and 2.10a).** The audit predates them, so their labels name the checker.
In 11 (a) **P** means: proof read and re-derived by claude-b9ee, who did not write it (record: REV). A verifier
replayed only by its recipient stays **R**, as elsewhere in this file (REV prints C for it); for 11 (e) see
below. In 11 (c) the
statements are claude-b9ee's own: **P** there means that a short proof is written out in the source and was
re-derived line by line when this file was assembled, by the sub-agent of the same session that assembled it;
nobody outside that session has reviewed it. **N** has its usual meaning.

In 11 (e) the statements are those of the report of codex-6e2b on the tilted sector, which came in six versions
on 15 November. **P** and **C** there are the labels of four reviews by claude-b9ee, who did not write the report:
TILT-REV for the first version, TILT-REV2 for the second, TILT-REV3 for the fifth and TILT-REV4 for the sixth (in
TILT-REV4 a reviewer agent of the same session made most of the re-derivations; that review says which). P means that
the reviewer read and re-derived the proof. C means that the reviewer replayed the checker concerned in an isolated
copy: for the first version an exact rational verifier (standard library only), which the reviewer also read; for
the second, the fifth and the sixth the whole verifier, with another python-flint and another compilation of its C++
part, whose interval code the reviewer did not audit line by line (11.33, 11.39 and 11.50 say so; the sixth was
replayed in two runs, 11.50). The reviewer is the recipient of the report, so a
reader who applies the rule of 11 (a) strictly will read each C of 11 (e) as R; what separates the cases is in the
reviews themselves (REV: "verifier replayed only" for the counterexample 11.6; TILT-REV: "read, then replayed in an
isolated copy", with the statements that use the verifier re-derived). The passages that TILT-REV covers are
unchanged in the later versions. **What only the third and fourth versions have is R**: no review of those two
versions exists, and TILT-REV3 re-derived only two sections of one of their notes (11.30). The report's own labels
are P, C, N and O (unproved); its O is **open** here. Where a row of 11 (e) says
"when this record was updated", the check was made by the worker of the same session who wrote the row, and nobody
else has reviewed it.

**Two audits share the audit folder and the agent ID.** The *main audit* is `REPORT.md` with
`CERTIFICATE_AUDIT.md`, `ASSEMBLY_AUDIT.md`, `ADDITIONAL_ANALYTIC_AUDIT.md`, `KERNEL_DERIVATION.md`, `RUNS.md`. A
*second audit* ("independent pushforward audit", `independent-pushforward-audit/REPORT.md`) was run separately and
has the supplements `record_audit.md`, `diffuse_asymptotic.md` and `optimizer_audit.md`; it uses P / N / R only.
Each says it does not adopt the other's files. They agree on every verdict quoted below. Where the main audit went
further (it recomputed kernel tables that the second audit only read), the main audit's status is used and the
difference is noted.

**Which finding stands.** Where the monograph or the log disagrees with an audit, the audit stands. The
disagreements are collected in section 14.

**Sources.** All paths are relative to this folder.

| tag | file |
|---|---|
| REP | `sources/audit-2026-11-13/REPORT.md` (main audit) |
| CERT, ASM, ADD, KER | `CERTIFICATE_AUDIT.md`, `ASSEMBLY_AUDIT.md`, `ADDITIONAL_ANALYTIC_AUDIT.md`, `KERNEL_DERIVATION.md` in the same folder (main audit) |
| PF, REC, DIF, OPT | `independent-pushforward-audit/REPORT.md`, `record_audit.md`, `diffuse_asymptotic.md`, `optimizer_audit.md` in the same folder (second audit) |
| IMP, IMP-JT, IMP-CE | `IMPROVEMENT.md`, `improvement_joint_tail.md`, `improvement_content_extension.md` in the same folder (codex-a713, after the audit) |
| MON | `MONOGRAPH.md`, the verbatim body (5 and 6 November) |
| LOG | `sources/log/ASSESSMENT_2026-11-04.md` (4 to 7 November) |
| DIG | `sources/manuscript/MANUSCRIPT_DIGEST_K.md`; `chNN` means `sources/manuscript/legacy/chNN-….tex` |
| KSCAN, TAIL | `sources/numerics-kscan-2026-11-13/README.md`, `sources/numerics-tailgames-2026-11-14/README.md` |
| EXT-P, EXT-R | `sources/external-2026-11-15/projection-attack-report.md` with its package, `remote-closure-report.md` |
| REV | `sources/external-2026-11-15/REVIEW.md` (claude-b9ee, 15 November: the verification record of EXT-P and EXT-R); its scripts and logs are in `sources/external-2026-11-15/review/` |
| KPR | `sources/numerics-kprime-2026-11-15/README.md` (claude-b9ee, 15 November: the retained element optimised together with the sectors); scripts, logs and search records in `code/kprime-2026-11-15/` |
| RCV/x | `sources/received-2026-11-05/x` (proof documents of the certificate packages) |
| OCT/x | `sources/october-handoff/x` |
| A15 | `sources/audit-2026-11-15-codex-a7c4/AUDIT.md`; detailed `CLAIMS.md`, `REMOTE.md`, `SECTORS.md`, `ODD_COST.md` beside it; checkers under `code/audit-2026-11-15-codex-a7c4/` |
| A15R | `sources/reaudit-2026-11-15-codex-a7c4/AUDIT.md`; detailed `FOUNDATIONS.md`, `REMOTE.md`, `CONTENT.md`, `SECTORS.md` beside it; checkers under `code/reaudit-2026-11-15-codex-a7c4/` |
| A15T | `sources/third-audit-2026-11-15-codex-a7c4/AUDIT.md`; detailed `ALIGNMENT.md`, `CONTENT_KERNELS.md`, `POTENTIAL.md`, `SECTORS.md`; checkers under `code/third-audit-2026-11-15-codex-a7c4/` |
| A15F | `sources/fourth-audit-2026-11-15-codex-a7c4/AUDIT.md`; `REFORMULATIONS.md`, `REMOTE.md`, `CONTENT.md`, `JOINT.md`, `REVIEW_403_claude-b9ee.md`; checkers under `code/fourth-audit-2026-11-15-codex-a7c4/` |
| A15V | `sources/fifth-audit-2026-11-15-codex-a7c4/AUDIT.md`, detailed notes and `REVIEW_409_claude-b9ee.md`; checkers under `code/fifth-audit-2026-11-15-codex-a7c4/` |
| TILT | `sources/received-2026-11-15-tilted-sector/REPORT.md` (codex-6e2b, 15 November: the report on the tilted sector in its latest version, the sixth, dated 06:06, "Tilted sector lemma: complete range u ≤ 0.0463") with its notes `deficit_dual_proof.md`, `deficit_moment_verify_proof.md`, `deficit_moment_prefix_proof.md`, `deficit_structure_refine_proof.md`, `deficit_structure_medium25_proof.md`, `deficit_structure_content_proof.md`, `deficit_structure_absolute_low_proof.md`, `deficit_angular_proof.md`, the author's audit `deficit_audit_results.md` and `deficit_audit_notes.md`, the notes of the earlier versions that it still uses (`secant_proof.md`, `secant_content_proof.md`, `secant_assembly.md`, `theta_proof.md`, `content_profile_proof.md`, `content_next_proof.md`, `content_tensor_next.md`, `content_next_m3_proof.md`) and its result files beside it (`results.txt` indexes its runs; `deficit_integrated_results.txt` is the log of the run of its new chain); the verifier, its inputs and the scripts are in `code/tilted-sector-2026-11-15/` |
| TILT-5 | `sources/received-2026-11-15-tilted-sector/REPORT_secant_history.md` (the fifth version of the same report, dated 05:17, which its author kept under this name beside the sixth), with the notes `secant_proof.md`, `secant_content_proof.md`, `secant_assembly.md` (revised at 06:02 in their closing remarks only: `INVENTORY.md` has the hashes of their 05:17 states), `secant_audit_math.md` and `secant_audit_results.md`; the output of its verifier is `results_secant_history.txt` beside it, and that verifier is `code/tilted-sector-2026-11-15/verify_secant_history.py` |
| TILT-4 | `sources/received-2026-11-15-tilted-sector/REPORT_localization_history.md` (the fourth version of the same report, dated 04:40, which its author kept under this name beside the fifth), with the notes `localization_notes.md` and `localization_alternative_proof.md` beside it; the output of its verifier is `results_localization_history.txt` beside it, and that verifier (checks C1 to C10) is `code/tilted-sector-2026-11-15/fourth-version/verify.py` |
| TILT-1 | `sources/received-2026-11-15-tilted-sector/first-version/REPORT.md` (the first version of the same report, the one that was reviewed); its verifier is `code/tilted-sector-2026-11-15/first-version/verify.py` and the output of that verifier is `preliminary_results.txt` beside TILT |
| TILT-REV | `sources/received-2026-11-15-tilted-sector/REVIEW.md` (claude-b9ee, 15 November: the verification record of TILT-1, with an erratum added the same day); its check script and log are in `code/tilted-sector-2026-11-15/` |
| TILT-REV2 | `sources/received-2026-11-15-tilted-sector/REVIEW_2.md` (claude-b9ee, 15 November: the verification record of the second version of the report, in its state of 04:05, with an addendum of the same evening, its section 7); its scripts and logs are in `code/tilted-sector-2026-11-15/`, and so is the verifier it replayed (`second-version/verify.py`) |
| TILT-REV3 | `sources/received-2026-11-15-tilted-sector/REVIEW_3.md` (claude-b9ee, 15 November: the verification record of the fifth version, in its state of about 05:10, with a replay of its verifier as left at 05:17); its scripts and logs, among them the log of the replay `replay_version5.log`, are in `code/tilted-sector-2026-11-15/` |
| TILT-REV4 | `sources/received-2026-11-15-tilted-sector/REVIEW_4.md` (claude-b9ee with a reviewer agent of the same session, 15 November 06:38: the verification record of the sixth version, in its state of 06:07); the scripts and two logs of its reviewer are in `code/tilted-sector-2026-11-15/review4/` |

Rows: **peak** (ε, ℓ, β) = (1891/2500, 1057/1250, 179/1250), **flank** (149/200, 4267/5000, 1467/10000), **upper**
(1891/2500, 0.877, 19/125). "Three rows" means these. Before 5 November "flank" named other rows (section 14).

## 1. Bottom line

1. The exact gate-free row is proved (**P**). K itself is open, and no violation of K on the parameter box has been
   found by any search (**N**).
2. Of the six layers of a proof (README, part (c)), none covers the full required row envelope. The follow-up audit
   replayed L1 at the **peak profile** with tolerance 3.6·10⁻⁷ (**C**, existing sixth-moment input retained),
   and L2 inherits that tolerance there. Other named rows remain open; the tube (3.11) and a larger one-sided profile rectangle (3.15) are covered.
   L3 now has certified orthogonality-only regions (6.1.1–6.1.1a); its sharper fourth-moment cutoff stays **R**.
   L4 has real theorems for structured families (**P + C**) and is open for general cubics. L5 is open. New retained A-core certificates cover all tensors at u≤.021 and χ≤.25 up to u=.0463 (11.47–11.48); they do not close raw L4 or the full assembly. L6 has an exact conditional central component (section 8), but no complete consumer.
3. The numerical supremum of the content-to-deficit ratio C²/D at the peak row and top energy is about 0.0876
   (**N**; n ≤ 6 by the audit, n ≤ 10 by our scan), against proved family constants 0.22 to 0.239 and against the
   targets 0.10, 0.15 and 0.24. Which target is the right one depends on a joint A/B estimate that is missing.
4. The audit's central finding: **a proof of the content bound with constant 0.10 would not close the A+B core**
   with the separate A-cost and B-cost theorems. A finite-amplitude joint A/B remainder bound is missing (section 7.4).
5. Since the audit: an identity tail lifts the model ceiling to 1.40248 (**N**, section 10); retaining the first-chaos
   penalty (the functional Λ_P of October, 2.10a) gives a weaker sufficient statement with larger local costs
   (section 11 (a)); an external claim about the remote part is unchecked (**R**, section 11 (b)).
6. 15 November, numerical (**N**, peak row; section 11 (c)): when the retained first-chaos element is optimised
   together with the sector, the largest sector gain found is about 0.025·D(q) (0.0247, in three remote variables at
   u = 0.03), against 0.166·D(q) for K. The
   sector inequality gain ≤ D + η then has a margin of about 6 for K and about 40 with the penalty retained, on what
   was tested: the A and B sectors over remote cubics in one and two variables, and the A-sector in three. The
   retained ratio rises slowly with the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463) and its limit
   is not known. No theorem; the remote part is untouched.
7. 15 November, a proof of that sector inequality for the A-sector, at the fixed tilt 3/5 (report of codex-6e2b in six
   versions; the first, the second, the fifth and the sixth reviewed by claude-b9ee; section 11 (e)). **The tilted
   A-sector lemma of the retained functional is proved (P + C) for every remote cubic with u ≤ 0.0463, in every
   dimension and for every remote linear form; no bound of the repository changes** (Lean has none of it, and the B
   and odd sectors are not covered). Its pieces, each reviewed (interval code replayed, not audited line by line): a
   global quadratic bound on the remainder of the tilted A-sector, (13/20)·|ρ|² at every base value and every
   amplitude (11.39), so that the gain is at most ‖c‖²/k with k = 0.312, without localisation and without a tail
   allowance (11.40); energy-dependent bounds on the tilted content c that vanish for a Gaussian law, from 0.0502·δ at
   u ≥ 0.009 down to 0.0325·δ at u ≥ 0.044 (11.49); and the comparison ‖c‖² ≤ (3/10)·D₊ + 6·10⁻⁶, certified by
   moment caps and Stein duals on 178 rectangles in (u, χ) (11.50). Together: the lemma with κ = 56730/59009 and
   η = 5673/295045000 (11.51), and with the remote cap 3.3, Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ at the peak for every
   remote cubic with u ≤ 0.0463 and every remote linear r. The review found the result sound and its margins thin
   (11.52). Numerically (**N**, 11.45) the same global remainder bound holds for the A and B shells together, and
   with the z-odd sectors z₁Q and z̄₁P added, but not pointwise with d·z₁(T − 2).

## 2. The statement and its reductions

| # | statement | scope | status | where |
|---|---|---|---|---|
| 2.1 | Exact gate-free row: Re⟨f, T_εg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G) | every real ℓ, β and ε > 0; the dropped terms are ‖P₁,₀k‖², ε‖P₂,₁h + B/ε‖² and the pointwise phase slack; no hidden premise | **P** | REP §1; ADD §1; `ch7` (prop:row) |
| 2.2 | Conjecture K: Λ(G) ≤ S for every n and G ∈ H₂,₁(ℂⁿ) | the box ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16] | **open** | README (a) |
| 2.3 | No violation found | October: all of H₂,₁(ℂ²) + W (excess +1.4·10⁻¹²), H₂,₁(ℂ³) + W (+4 to 5·10⁻⁹, grid artefact), scale mixtures, a 10-parameter limit family. 4 November: full tensors in d = 3, 4, 5 at three rows (every candidate below S on 2·10⁷ fresh samples). 6 November: H₂,₁(ℂ²) with all six sectors, 18 shells (every value of Λ − S negative) | **N** | DIG §3; `ch7` ("Attacks on K"); LOG §6, §31; `code/experiments-2026-11-04/e4_kattack.py`, `e11_ksector.py` |
| 2.4 | K for every profile and every ε ("K_all") is false | K for every ε is equivalent to same-norm domination on every variance sphere; that fails for profiles with ℓ − 2β of order 10⁻¹⁰ to 10⁻³⁰ at tiny norms. No violation is known on the box | **refuted** (**R**: explicit examples in the notes received; not in the audit ledger) | MON §1; LOG §8a, §10; `RCV/chatgpt-thread2-gaussian_domination_note.tex` |
| 2.5 | The corner (ε, ℓ, β) = (0.74, 0.90, 0.12) has σ* = 0 | Theorem B (5.2) covers it; several other proofs need σ* ≥ 0.1 or a/β in [11/4, 11/2] | **R**; open as part of L6 | MON §1; DIG §2; ADD §3 |
| 2.6 | n = 1: sup Λ = 2E\|L\|, attained only at G = 0. At the peak this is 387√π/500 ∈ (1.371879280600869, 1.371879280600870) < S | **entire application box**: Λ(dZ(T−2)) ≤ 2E\|L\| − k_*‖dZ(T−2)‖². The sharp uniform cost k_* is k₃ at (ε,ℓ,β)=(.76,.76,.16), in (0.151676198434561,0.151676198434562); 0.15167 is a safe rational cost, improving 3/20. Embedding this axis in larger dimensions does not cover arbitrary G | **P**, new sharpness argument by author, not externally reviewed; scalar **C** with `odd_cost_check.py` and A15R `sectors_exact.py`. The optimum at the peak is an old result | A15 `ODD_COST.md`; A15R `SECTORS.md` §§2,5; original package in `INVENTORY.md`; REC §6.1 |
| 2.6a | Retained n=1: the optimum of Λ̂ is Λ(0), uniquely at d=0; the sharp all-amplitude uniform cost for dZ(T−2) is in (0.392424545003417,0.392424545003418), so .39242 is safe | entire application box, including this axis in any ambient dimension; no arbitrary-G conclusion | **P + C scalars**, re-derived and replayed by claude-b9ee on #403 (A15F review archive) | A15T `SECTORS.md` §§3–4; `sector_axis_costs.py` |
| 2.7 | L has the law of √V·W (a circular Gaussian scale mixture); φ(v) = 2E\|L + √v\| has a completely monotone derivative | every a, b > 0 | **P** | ADD §5; IMP-CE; `ch32` |
| 2.7a | The visible survival/density and −g, −g_B are completely monotone; explicit positive derivative recurrences and Laplace measures give global bounds on every alternating derivative. Also −g−sqrt(2)(−g_B) is completely monotone | every a>0,b≥0; j≤4 scalar envelopes certified at the three named rows | **P**, re-derived by claude-b9ee on #403; endpoint scalar checker **C**, replayed there. Flank/upper Mⱼ comparisons were excluded from that review; they retain author-side certification | A15T `CONTENT_KERNELS.md`; `content_kernels_exact.py` |
| 2.8 | Frequency rule: after factoring the phase of z₁ the sectors carry frequencies q,A: −1, B: +1, z₁Q and d·z₁(T−2): 0, z̄₁P: −2; no cross terms in E[\|G\|² \| T] between different frequencies | every G for this algebraic statement. At a fixed even cubic base only A and B **among visible-sector perturbations** can have nonzero first variation; an arbitrary cubic base need not be even | **P**, independently re-derived in A15R; the derivative qualification is 2.9 | MON §2; DIG §4; `ch11`; A15R `SECTORS.md` §6 |
| 2.9 | Parity: for H even and O odd under z₁ → −z₁, Λ(H + O) = Λ(H − O). The odd first derivative vanishes **when it exists**, and mixed even/odd Hessian entries vanish **when that Hessian exists** | parity for every even L² base; first differentiability holds at genuine even cubic bases because L±H are nonzero polynomials. General even L² bases can have a cusp. No finite-amplitude monotonicity follows | **P**; qualification and explicit cusp **P**, re-derived by claude-b9ee (A15R review) | REP §1; ASM §3.2; LOG §34; A15R `SECTORS.md` §6 |
| 2.10 | K′ (retained penalty): Λ′(G) ≤ Λ(G), the row holds with Λ′, and K′: Λ′ ≤ S would suffice | Λ′ keeps −‖P₁,₀k‖² and the constraint εP₂,₁k = G | row with Λ′: **P**, independently re-derived in A15R; K′ itself: **open** | DIG §2; `ch7` ("Side experiments"); A15R `FOUNDATIONS.md` §3 |
| 2.10a | First-chaos dual: Λ_P(G) := inf_{a ∈ H₁,₀}{‖a‖² + E\|L + G − a\| + E\|L − G + a\|} − ‖G‖²/ε satisfies Λ′ ≤ Λ_P ≤ Λ, so sup Λ_P ≤ S + η is sufficient for K′ and weaker than K. For remote q: Λ_P(q) ≤ Λ(q) − ‖P₁,₀F₀(q)‖²/(1 + H₀/2), F₀(u) = E_{z₁}ph(L + u), H₀ = E\|L\|⁻¹, H₀/2 ≈ 1.4319737913 at the peak (multiplier ≈ 0.4112) | every G; the remote bound for every square-integrable remote q. This is the Λ̂ of the report of 15 November (section 11) | Λ_P ≤ Λ, the row with Λ_P and the remote bound: **P** (re-proved in the report of 15 November; proofs re-derived by claude-b9ee, 11.1 to 11.3). Λ′ ≤ Λ_P: **P**, independently re-derived by A15R `FOUNDATIONS.md` §3 from weak duality. The manuscript of 15 October prints [P], and [F] for the constant | `ch20` (section "A valid first-chaos dual for K′"); `ch17`; REV |
| 2.11 | K_rot: the row with an extra negative term −‖2βr_A + √2βr̄_B‖²/(ε²t² + 9ε‖G‖²) | only at a global norm maximiser; pays 13 to 57 % of the measured mixed gain; no cap proved for it | **R** | DIG §2; `ch25-parts/10-exact-duals-rotation-profiles.tex` |
| 2.12 | Response-side cuts (25 proved constraints on actual responses: remote energy e < 0.046266 for t ≥ 0.84, sector ellipsoid, closed-form ellipse e + (191/500)t² ≤ 9/40 ⇒ cap 0.71315, anisotropic and weighted caps covering e ≤ 0.0148, …) | actual responses only; not valid inside a raw-K supremum; penalties using the same square must not be added twice | **R** ([P] or [P,C] in the manuscript) | DIG §1 |
| 2.12a | Regional response energies at ε=1891/2500: for t≥.84, remote energy <.046266 and total energy <.081884; total energy <.071981 needs t≥.8456; at t≥.851 the total cap is .062431 | actual responses only. The unrestricted .072 total-energy reading is false; an explicit response at t=0 has energy >.0939738 | **P + C**, existing response ellipsoid/Rice tangent independently re-derived and freshly checked; no upgrade of all constraints in 2.12 | A15R `FOUNDATIONS.md` §2; `foundations_exact.py`; `ch25-parts/30-response-feasibility.tex` |
| 2.13 | The retained-dual minimum has a unique minimizer a*, with ‖a*‖≤√π/2. At a trial a, let k_a be the half-difference of support phases and r=a−P₁,₀k_a; then J_G(a)−‖r‖²≤min J_G≤J_G(a), and ‖a−a*‖≤‖r‖ | every finite dimension; full first-chaos projection, not a selected direction. Certifies the inner minimization only, not the outer tensor/sector maximum | **P**, re-derived by claude-b9ee in A15R review (standard strong-convexity corollaries); existence/uniqueness already in the projection package | A15R `FOUNDATIONS.md` §3 |

## 3. Layer L1: the remote part (G = q independent of z₁)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 3.1 | Reduction of remote K-a to a moment problem for U = \|q\|²/v (two-point extremal laws, cubic Hermite majorants of φ, secant envelope in the variance) | every profile | **P** | REP §1; ADD §5 |
| 3.2 | Remote cap: Λ(q) < 2747927/2000000 = 1.3739635 < S + 10⁻⁵ for every remote cubic | **peak profile only**; uses EU = 1, EU² = 2 + x², EU³ ≤ 6 + 9x² + 40.45313x³, 0 ≤ x ≤ 31/4; 51 interval bands (Arb). The row box and the envelope are not covered | **R** (Arb package of 15 October, not replayed by the audit) | REP §1, §3 item 12; ADD §5; `ch24`; `ch22` |
| 3.3 | October packages: (i) Λ(q) < S + 0.0000105; (ii) **Λ(q) < 1.373953883 < S + 0.00000036**, every finite dimension and every variance | **peak row only**. (i) is weaker than 3.2's 10⁻⁵ allowance and uses C₆ = 1977/40; (ii) uses the existing C₆ = 40.45313 theorem. Neither proves same-variance domination D(q) ≥ 0 | (i) exact algebra replayed **C conditional on stored kernel grids**. (ii) **P + C**, proof implication inspected and acceptance replayed with all profile integrals freshly recomputed: 68 profile caps, 45 Stein nodes, 154 outer boxes, zero/high-variance rays, and Gaussian benchmark. Replay repeated by claude-b9ee on a second installation (PASS), with the Stein identity and the dual identity re-derived (A15 `REVIEW_claude-b9ee.md`). Not Lean; its inputs about cubic chaos (sixth moment, the two spectral budgets, the covariance order, the Stein identity) are Lean theorems of the lower bound (`Moments`, `SteinInputs`, `SteinCut.spec`), up to the mesh of the test functions (A15 `REMOTE.md` §3a). Not a new theorem for the moment input | A15 `REMOTE.md`; `remote_replay.py`, `remote_rational_audit.py`, `remote_legacy_replay.py`; `INVENTORY.md` |
| 3.4 | The sixth-moment input E\|q\|⁶ ≤ 6u³ + 9uδ + C₆δ^{3/2}: tensor bridge in Lean (`Circular.tensorFacts`, `Circular.gaussian_sixth`, `gaussian_moments`) | a moment input; **not** a Lean theorem for the remote cap, and none was found | source-level observation by the audit (no build) | ADD §5 |
| 3.5 | For any one fixed positive profile a>0,b≥0: universal complex sharp radius bound ⇔ Gaussian-buffer PVD ⇔ same-variance remote domination ⇔ exact remote K-a at **every** price p=1/ε>0 | Every finite dimension and energy. Real BNC is a **sufficient** route to real PVD (equivalent to the universal real sharp radius bound), which implies complex PVD; no converse to BNC or complex-to-real implication is established. A single-price remote cap does not imply same-variance domination | Equivalence arguments **P**, re-derived by claude-b9ee on #409 (A15V review archive); the conjectures remain **open**. Gaussian buffer closure and scale-mixture concavity were already in October | A15F `REFORMULATIONS.md` §§1–3; MON §3.3; `ch32`, `ch34` |
| 3.5a | SEI is not preserved by adding an arbitrary independent symmetric unimodal variable: X₁=Z₁Z₂Z₃/3 satisfies SEI, but Y=X₁+U with independent U uniform on [−1,1] has SEI interval gap ≥91/18000 at radius 1/10 | X₁ is genuine real third chaos; U and Y are not. Correct closures: independent centered Gaussian addition, or two SEI summands each with symmetric unimodal density. No refutation of K, PVD or third-chaos BNC | Printed closure **refuted**; proof and repaired closures **P**, scalar **C**, re-derived/replayed by claude-b9ee on #409 | A15F `REFORMULATIONS.md` §§4–5; `reformulations_exact.py`; `ch32`, “Interval form (SEI) and sums” |
| 3.6 | E\|q\| ≤ (√π/2)‖q‖₂ on H₂,₁ | all cubics | **open**. Proved cases of the real form BNC (**R**): order 2; one-variable H₃ at every scale; the family aH₃(g₁) + bH₂(g₁)g₂ (130 exact boxes); Gaussian scale mixtures. Exact K-a (**R**): the one-coordinate star, all of H₂,₁(ℂ²), Gaussian scale mixtures | MON §3.3 |
| 3.7 | Weaker radius: E\|q\| < 0.9695084‖q‖₂ for every Wick cubic; later 0.95133 | all cubics | **R** ([P,C] in the manuscript) | DIG §1 item 19; `ch60`, `ch62`, `lower-bound/real-stein-radius.tex` |
| 3.8 | D₁ in degree 2 (real): E\|X\| ≤ √(2/π)‖X‖₂ for X = Σλ_i(g_i² − 1), strict for X ≠ 0; also for weighted sums of independent centred Gammas plus a Gaussian | real second chaos only; uses Yamazato's unimodality theorem | **R** (written proof by a worker of claude-b9ee, 4 November; not audited). The degree-3 and the complex charge-one cases are open | `sources/d1/` |
| 3.9 | Remote "closure" claims of 15 November | see section 11 | **R**, unchecked | EXT-R |
| 3.10 | With the first-chaos penalty retained: Λ̂(q) ≤ Λ(q) − ‖P_rem m(q)‖²/(1 + j₀) for every remote q | see section 11 | see section 11 | EXT-P |
| 3.11 | Profile transfer: write λ = ε/(1891/2500). The peak remote cap implies Λ(q) < S + 8.1·10⁻⁵ whenever ε ∈ [0.74,0.76] and \|a−λ·699/1250\| + (3/2)\|b−λ·179/1250\| ≤ λ/50000 | every finite dimension and every remote cubic; a narrow continuum tube with a,b > 0, **not** the full row box or the flank/upper rows. General error transfer: λη₀ + 2√π times that shape distance, η₀=3.6·10⁻⁷ | **P, by author, not externally reviewed**; rational error arithmetic **C** in `remote_rational_audit.py`, using 3.3(ii) | A15 `REMOTE.md` |
| 3.12 | Dense-test extension: every spectral cut E G(U) ≥ 0 whose test function is continuous, piecewise affine with rational knots and constant on its final ray follows from the cuts of the Lean family (knots at squares of rationals, zero on the final ray) by uniform approximation, with E\|G_n − G\| ≤ δ[(M+\|β\|)/(2λ) + \|A_f\|/λ + 2(M+\|A_g\|)/μ + 2] + δ²[1/(4λ) + 1/μ] | any law with U≥0, EU = 1 and EU² < ∞ that satisfies the square-mesh cuts; the same admissible rational parameters with λ,μ>0 and ν≥0. So the 45 duals of 3.3(ii) need not be chosen again for a formal port; the approximation and the limit still have to be formalised | **P, by author (codex-a7c4)**; re-derived by claude-b9ee in review. Not Lean | A15R `REMOTE.md` §4; A15R `REVIEW_claude-b9ee.md` |
| 3.13 | Convex-cell transfer: at fixed ε, if one family of remote q satisfies Λ_θᵢ(q) ≤ Uᵢ at the vertices θᵢ = (aᵢ, bᵢ) of a convex cell, and H is a concave lower bound of S on the cell with Uᵢ − H(θᵢ) ≤ η at every vertex, then Λ_θ(q) ≤ S(θ) + η throughout the cell | every dimension. H can be the supporting plane of θ ↦ 2E\|Z(a+bT) + √v₀W\| − v₀/ε at the peak (3.14). It replaces the first-order loss of 3.11 by a vertex-to-support gap; the count of about seven million anchors (A15 `REMOTE.md` §4) is for the method of 3.11 only. **No cell is certified: remote caps exist at the peak only** | **P, by author (codex-a7c4)**; re-derived by claude-b9ee in review | A15R `REMOTE.md` §5 |
| 3.14 | Gaussian benchmark at the peak by the direct Rice formula (I₀ and I₁ kept): 1.3739535256614828 < B(v₀) − v₀/ε < 1.3739535256614829 at v₀ = 403448/10⁷, hence 1.3739535256614 < S < 1.3739535256616 again; gradient of the fixed-v₀ competitor ∂_aB ∈ (1.689944147450845, 1.689944147450846), ∂_bB ∈ (2.622896929056071, 2.622896929056073) | peak row; independent of the October benchmark code, which removed I₁ by integration by parts. No remote cap follows from it | **C** (160-bit Arb); A15F inspected the Rice formulas, analytic callbacks and tail bounds and replayed `remote_benchmark_crosscheck.py` byte-identically. The A15R review had already replayed it and reproduced the values by plain floating-point quadrature, while excluding inspection of the Arb code. #409 then independently replayed it again. Library internals remain outside scope | A15R `REMOTE.md` §3; `remote_benchmark_crosscheck.py`; `review_claude-b9ee_spot_checks.py` |
| 3.15 | One-sided profile transfer: with λ=ε/(1891/2500), ε∈[.74,.76], 0≤a/λ−.5592≤1/2000 and 0≤b/λ−.1432≤1/625, every remote cubic has Λ(q)<S+2348075715791501/23637500000000000000<S+10⁻⁴ | Every finite dimension and energy; does not cover flank/upper or the full application box. Uses the fixed-variance Gaussian supporting plane to avoid the second triangle loss; retains 3.11 in the other directions. No transfer of the tilted-sector theorem | **P + C rational acceptance**, re-derived/replayed by claude-b9ee on #409; inputs 3.3 and 3.14 | A15F `REMOTE.md` §§1–2; `remote_profile_transfer.py` |
| 3.16 | For remote q, with μ=Π₁,rem E_Z ph(L+q), ‖μ‖²/(1+j₀)≤Λ(q)−Λ̂(q)≤‖μ‖², so equality holds exactly when μ=0. For q=cX(abs(Y)²−1), c>0, the inequality Λ̂(q)<Λ(q) is strict at every amplitude | Any positive profile a>0,b≥0; every finite dimension containing two independent remote coordinates. The sandwich re-derives 2.10a/2.13; the explicit all-amplitude cubic strictness is new. At the peak c=1/100 the gap exceeds 33860761/75000000000000000000>1/(3·10¹²). For q=cXY conjugate(V), with three independent standard remote complex Gaussians X,Y,V, the two values instead agree | **P by author, not externally reviewed + C exact scalar witness**. This distinguishes the objectives, not a new global remote cap | A15V `FOUNDATIONS.md` §§2–6; `retained_remote_exact.py` |

## 4. Layer L2: the core with disjoint drivers (q independent of U)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 4.1 | Redistribution: F(H + (T−1)U) ≤ F(H + √b·W) for **mutually independent z₁, H, U**, U proper Gaussian, H square-integrable, and W fresh independent standard Gaussian, when b + h ≤ ℓ² (b = E\|U\|², h = E\|H\|²) | all amplitudes in that range; reduces the disjoint core to the remote bound **with the same η**. H independent of z₁ is essential; omitting it is false for general L² H | **P** with the corrected hypothesis. Counterexample to the broadened formulation: **P by author**, A15 `CLAIMS.md` | REP §1; ADD §4.1 (also omits the independence in its summary); `RCV/chatgpt-thread1-remote-cubic-comparison.tex`; A15 |
| 4.2 | Cost form: Λ(q + (T−1)U) ≤ Λ(q) − (1/ε − 197/(200ℓ))‖U‖² for mutually independent Z,q,U, q∈L², U centred proper Gaussian | every amplitude, every ε>0, ℓ>0 and β/ℓ∈[2/15,4/19]; hence the entire application box, with cost at least 3/152 there. No energy cutoff; no cubic assumption on q | **P + C**, re-derived and replayed by claude-b9ee on #403 (A15F review archive): strengthened kernel and full-box replay (15 profile intervals, 575 scale intervals, infinite ray). Earlier 199/(200ℓ), 1/152 result remains valid | A15T `POTENTIAL.md`, `potential_bounds.py`, `potential_full_box.py`; A15R `REMOTE.md` |

## 5. Shells without a remote cubic, and conditionally Gaussian adversaries

| # | statement | scope | status | where |
|---|---|---|---|---|
| 5.1 | Theorem A: if the Wick polynomial of G vanishes at z₁ = 0 (all sectors except A and q), then F(G) ≤ B(‖G‖²) (same-norm domination) | every amplitude; needs a/β ≥ 11/4; **requires q = 0** | **P** (complete analytic reconstruction; the originally named note was not found) | REP §1; ADD §2 |
| 5.1a | Theorem A’s q = 0 tangent argument does not extend unchanged to q ≠ 0 | a remote variance h adds a positive tangent correction (h/2)·I_H, I_H > 0; a quantitative extension holds for (19/11)h ≤ D/10 + E/2 | **P** | ADD §2; LOG §11e |
| 5.2 | Theorem B: if **𝓕 is independent of z₁**, G is centred proper Gaussian given (z₁, 𝓕), with conditional variance s + u(T−1)² + bT + cT², coefficients nonnegative, integrable and 𝓕-measurable, then F(G) ≤ B(‖G‖²) | needs 0 < a/β ≤ 11/2 (tight for this proof); covers the σ* = 0 corner; **excludes arbitrary conditional cross-covariance**. Dropping 𝓕 independent of z₁ makes the general conditional-Gaussian statement false | **P** (no numerical premise), corrected scope; counterexample to broadened formulation **P by author**, A15 `CLAIMS.md` | REP §1; ADD §3; `RCV/chatgpt-thread2-gaussian_domination_note.tex`; A15 |
| 5.3 | A genuine cubic can have a sign-indefinite conditional cross term: X[(T−1) + (\|Y\|²−1)] has conditional variance [(T−1) + (\|Y\|²−1)]² | so shared-driver cubics are not covered by 5.2 | **P** | REP §3 item 10; ADD §3 |
| 5.4 | Odd-in-z₁ sectors over the **zero** core: Λ(O) ≤ Λ(0) − k₁v − k₃h for O = z₁Q + z̄₁P + d·z₁(T−2), v = E\|Q\|² + E\|P\|², h = 2\|d\|², (k₁, k₃) = (0.128, 0.330), (0.156, 0.356), (0.166, 0.361) at the three rows | every amplitude, every dimension; zero core only. More generally Q,P may be arbitrary remote L² variables with E Q=0 | **P + C**, independent derivation and fresh standard-library rational scalar certificate by codex-a7c4, same-session review; no external review | A15 `ODD_COST.md`, `odd_cost_check.py`; MON §4b; LOG §35; `RCV/odd_sector_certificate/` |
| 5.4a | The zero-core coefficients k₁=p−J₁ and k₃=p−(J₃−4J₂+4J₁)/2 are sharp on the Q and d axes. At (ε,ℓ,β)=(.76,.76,.16), O=(i/100)Z(\|Y\|²−1) gives Λ(O)−Λ(0)>7·10⁻⁶. At the flank, O=(i/100)Z(T−2) violates the claimed cost .36 by >5·10⁻⁷ | genuine cubics; refutes full-box odd nonincrease and the historical rounding, **not K** or the valid three-row costs of 5.4. This also yields the sharp n=1 constant in 2.6 | **P**, re-derived by claude-b9ee in A15R review, exact finite-amplitude scalar **C** | A15R `SECTORS.md` §§2–5; `sectors_exact.py` |
| 5.4b | Pure P axis: Λ(conj(Z)P) ≤ Λ(0) − (p−13J₁/20)E\|P\|² ≤ Λ(0)−.41E\|P\|²; Λ̂(conj(Z)P)=Λ(conj(Z)P) exactly | entire application box; any remote L² P, all amplitudes, zero even core. Improved P coefficient is not asserted in a simultaneous Q/P bound | **P + C scalars**, re-derived and replayed by claude-b9ee on #403 (A15F review archive) | A15T `SECTORS.md` §2; `sector_axis_costs.py` |
| 5.4c | Joint retained zero-core odd majorant replaces k₃ by k̂₃=p−[I−K²/(1+J₁)]/2, I=J₃−4J₂+4J₁, K=J₂−2J₁, retaining k₁ on Q/P; the corner cubic of 5.4a also gives Λ̂(O)−Λ̂(0)>7·10⁻⁶ | any remote L² Q,P with EQ=0; no independence between Q,P; zero even core. Refutes full-box odd nonincrease for Λ̂, not K or K′ | **P + C scalars**, re-derived and replayed by claude-b9ee on #403 (A15F review archive) | A15T `SECTORS.md` §§3–5; `sector_axis_costs.py` |
| 5.5 | Manuscript theorems on buffered and small-amplitude classes (polarised class S − α²/10 − β²/4; Gaussian-factor drivers S + 5·10⁻⁵; complete coherent one-driver A/B with buffer; several small drivers; arbitrary coupled tensors with buffer g ≥ 9/40 or e ≤ 1/200; global exclusions) | as stated in the digest; most need a Gaussian buffer or very small energy | **R** ([P,C] in the manuscript) | DIG §4 items 4 to 10 |

## 6. Layers L3 and L4: the core q + (T−1)U with shared drivers

Write u = ‖q‖², w = ‖U‖². The rectangle is R = {w < 0.01125, 0.00551 + 0.319w < u ≤ 0.0463}.

### 6.1 Outside the rectangle (L3)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.1.1 | Orthogonality-only bound: Λ(q+(T−1)r)≤B₀+.389644u−.124324w; hence Λ<S+10⁻⁴ when u≤.00558+.31907w | Peak profile; any joint L² q,r independent of Z with E[conj(q)r]=0, without chaos or centering assumptions. Uses the sharper checked gap S−B₀>.002074245. This improves the old .00551+.319w cone | **P + C**, re-derived/replayed by claude-b9ee on #409. The separate strips are 6.1.1a | A15F `CONTENT.md` §§1–2; `shared_a_second_moment.py`; original DIG §4, `lower-bound/sharp-circular.tex`, `ch61` |
| 6.1.1a | At u≤.0463, w≥.0206 implies Λ<S+10⁻⁴; w≥.0208 implies Λ<S; w≥.02105 implies Λ<S−10⁻⁴ | Same orthogonality-only class as 6.1.1, all w above each threshold. A concave angular envelope, monotonicity in w and a positive derivative in u reduce to three finite integrals; these are not consequences of the affine bound alone. Improve .0223/.0225/.0228; do not upgrade the stronger fourth-moment .01125 claim | **P + C**, re-derived/replayed by claude-b9ee on #409; exact degree-27 Bernstein checks and 16,384 outward-rounded cells per integral, analytic tails | A15F `CONTENT.md` §§2–6; `shared_a_second_moment.py` |
| 6.1.2 | Fourth-moment bound: Λ ≤ B₀ + 0.11u − 0.32w + 5.25w², refined to the cutoff w ≥ 0.01125 ⇒ K_η with η = 10⁻⁴ for u ≤ 0.0463 | arbitrary sharing | **R** (external note; checked numerically by claude-b9ee) | MON §3.4; LOG §11h, §12d; `sources/prompts/reply-gpt3-fourthmoment.txt`, `reply-gpt3-refinement.txt` |
| 6.1.3 | The fourth-moment routes are saturated: universal cutoff w ≥ 0.011223 and no further | — | **R** | MON §3.4; LOG §12j |
| 6.1.4 | Three cutoffs are in use for w (0.01122, 0.011223, 0.01125) | a final exact cover has to fix one | noted by the second audit | REC §2 |
| 6.1.5 | "The near-Gaussian regime δ/u² ≤ 0.05 is covered by the manuscript's K_η proof (x ≤ 0.22)" | — | **not justified** by the cited source (float constants, sampled majorant, and 0.22² = 0.0484); the region stays open | REP §3 item 11; ADD §6 |

### 6.2 Cost and the reduction to a content inequality (L4)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.2.1 | A-shell cost at zero buffer: Λ(q + (T−1)U) ≤ Λ(q) + 2Re⟨U, F_A(q)⟩ − κ‖U‖² with κ = 0.24 for w ≤ 0.0113 | any remote q, any sharing; three rows (the peak is the worst) | **P** with the exact checker replayed, by the second audit; the main audit treats it as an inherited input and did not certify it | PF §1; REC §3; CERT (introduction, §4); `RCV/chatgpt-shared_driver_rectangle.tex`; `code/ai-thread-verifiers-2026-11-05/chatgpt-thread2-verify_content_extension.mjs` |
| 6.2.2 | Earlier costs: κ = 0.19 for ‖U‖ ≤ 1/16 (and smaller κ up to ‖U‖ ≤ 3/20) | any dependence | **R** ([C] in the manuscript) | DIG §4 item 3; `ch46` |
| 6.2.3 | Cost plus content closes the A-only core: if C(q)² ≤ κ[B(u) − F(q)] then Λ(q + (T−1)U) ≤ B(u) − u/ε ≤ S | on the class where both hold; no separate K-a input needed; the weaker sufficient form is S − Λ(q) + η ≥ Ψ_r(C), Ψ_r(C) = C²/κ for C ≤ κr and 2rC − κr² beyond | **P** | REC §2; PF §1; LOG §16 |
| 6.2.4 | C(q)² is a supremum over unit linear forms, so a bound for every unit direction is a bound on the full projection, with no dimension factor | every q | **P** | REC §2; CERT §7 |
| 6.2.5 | Completing the core on R does not prove raw K for all G, nor K′ automatically | R comes with response-feasibility restrictions and prior exclusions | **P** (logic) | REC §2; ASM §4.4 |

### 6.3 The content inequality C(q)² ≤ κ·D(q): families

All on 0.00551 ≤ u ≤ 0.0463 at the three rows unless stated. X is a driver, Y the other coordinates, P centred.

| # | family | constant | status | where |
|---|---|---|---|---|
| 6.3.1 | Moment theorem: E\|P\|⁶ ≤ 37p·E\|P\|⁴ − 68p³ and E\|P\|⁴ ≥ 2p² for P = Y*AY − tr A, **any complex A** (no normality) | — | **P + C** (265 Wick contractions enumerated exactly) | REP §1; CERT §1 |
| 6.3.2 | q = X·P(Y), any complex quadratic P ("R23") | 0.239 | **P + C**: 1,168,779 rectangles replayed at the three rows with independently recomputed kernel nodes | REP §1; CERT §1; `RCV/r23_r25_certificate/` |
| 6.3.3 | q = X·P with P any centred variable independent of the driver X that satisfies the two moment bounds of 6.3.1; this includes every complex quadratic P(Y) (reweighted Cauchy–Schwarz) | **0.22** | **P + C**, end to end: all 441 kernel nodes recomputed with Arb at 160 bits and contained in the stored rational bounds; domain and tail verifier replayed at the three rows | REP §1; CERT §3; `RCV/r26_reweighted/` |
| 6.3.4 | Gaussian-factor class q = Σ_j X_jP_j(Y): any number of independent Gaussian drivers, any complex coefficient matrices, no covariance restriction | 0.239 | **P + C**: 2,143,397 rectangles replayed; the argument controls the whole content vector. Needs the split into drivers and coefficients; no self-interaction | REP §1; CERT §2; `RCV/gaussian_factor_content/` |
| 6.3.5 | Hermitian self-interaction q = e^{iα}X[c(\|X\|²−2) + Y*AY − tr A], **real c, Hermitian A**, every share, **u ∈ [0.03, 0.0463]**: C² ≤ 0.23(Δ − 1/40000), Δ ≥ 1/40000 | 0.23 | implication **P**; 81,642,330 integer dual comparisons **C conditional on saved scalar bounds** (the scalar enclosure chain was not regenerated). A complex relative phase between c and A is not covered | REP §1; CERT §4; `RCV/r26_self_interaction/` |
| 6.3.6 | Wick neighbourhood q = X[c(\|X\|²−2) + P(Y)], any centred P with p = E\|P\|² ≤ u/5 | 9/40 = 0.225 | the analytic perturbation and moment implications **P**; the numerical premises **R** (verifiers not replayed by the audit) | REP §1; CERT §5; `RCV/wick_r26_twenty_percent/` |
| 6.3.7 | Remote domination for the self-interaction family: B(u) − F(q) = Ê d_{u,R}(\|b\|²) + \|c\|²𝓚(u), 𝓚 > 0 ("R24") | — | **P** (second audit); it is a deficit identity, not a content bound. 𝓚(0.0463) ∈ (0.166781, 0.166783) at the peak: **R** | REC §4; `RCV/r23_r25_certificate/`; `RCV/r26_envelope_audit/` |
| 6.3.8 | Shell bookkeeping ("R25"): the frequency-one coefficient of q²q̄ keeps cross terms between shells; q = X̄Y² + (\|X\|²−1)Y has energy 3 and E[X̄q\|q\|²] = 6 | so phase averaging does not remove the other shells and the family theorems do not add up | **P + C** | CERT §8; REC §4 |
| 6.3.9 | Content extension: for p,h∈H₂,₁, if p has charge one under rotation of a coordinate block, h has only the other characters, D(p) > 0 and C(p)² ≤ (9/40)D(p), then ‖p + h‖² ≤ 0.0463 and ‖h‖² ≤ (3/500)D(p) imply C(p+h)² ≤ (6/25)D(p+h) | peak row, every dimension; the core inequality is an input (6.3.3 or 6.3.6); a neighbourhood only | **P** (derived by codex-a713 after the audit; independently re-derived and sharpened in A15R, 6.3.9a) | IMP-CE |
| 6.3.9a | Larger mixed-shell neighbourhood: for p,h∈H₂,₁ under the same character/core hypotheses as 6.3.9, e=‖h‖²≤D(p)/100 suffices for C(p+h)²≤(6/25)D(p+h) | peak row, every finite dimension, total energy≤.0463; a 5/3 increase in the permitted remainder energy, not a general content theorem | **P** perturbation argument re-derived by claude-b9ee; kernel input derived in A15T and re-derived by claude-b9ee on #403; exact scalar **C** for M₀<.836, M₁<2.16 and the final coefficient 91789/62500<3/2 | A15R `CONTENT.md`; `content_constants.py` |
| 6.3.9b | For p,h∈H₂,₁ under the same character/core hypotheses as 6.3.9, ‖h‖²≤D(p)/90 suffices for C(p+h)²≤(6/25)D(p+h) | peak row, every finite dimension, total energy≤.0463; improves /100 by 10/9 using the sharp off-character weight 15sqrt(π)/16, still conditional on the core inequality | **P + C scalars**, re-derived and replayed by claude-b9ee on #403 (A15F review archive); exact coefficient 8429832706429/6250000000000<1.35 | A15T `CONTENT_KERNELS.md`; `content_kernels_exact.py` |
| 6.3.10 | Older or superseded family results: Hermitian one-driver family 0.236364; Wick neighbourhoods p ≤ u/16 (49/211, u ≥ 0.03) and p ≤ u/12 (563/2420); second proof of p ≤ u/5 (47/200, u ≥ 0.03); the two templates X(\|X\|²−2), X(\|Y\|²−1) on R by two certificates; covariance-sensitive Gaussian-factor theorem (ρ ≤ 3/140) | as stated | **R** (not examined by the audits). As content inequalities with a constant below 0.24 they are contained in 6.3.3, 6.3.4 and 6.3.6; they carry sharper constants in special cases (ratio at most 0.103 for the Wick monomial and 0.055 for X(\|Y\|²−1) at the rows; (56/5)ρ for the Gaussian-factor class) | MON §3.4, §3.6; `RCV/hermitian_content/`, `RCV/wick_endpoint_extension/`, `RCV/wick_endpoint_one_twelfth/`, `RCV/r26_twenty_percent_extension/`, `RCV/chatgpt-shared_driver_rectangle.tex` |
| 6.3.11 | "Universal nonlinear content": \|C_X(q)\|² ≤ 50κ^{3/2} for every cubic; hence the content inequality with 0.19 for u ≤ 0.00038 (constant 1 for u ≤ 0.001) | every cubic, every dimension | **R** as a theorem: the replayed checker verifies scalar constants only and the derivation of the tensor identities was not found. It gives no deficit bound at the energies that matter (its coefficient is negative for u > 0.0017) | REP §1; CERT §7; DIF §4 |
| 6.3.12 | Tensor inequality ‖Π₁,₀(q\|q\|²)‖² ≤ (3√6/4)δ^{3/2} for every cubic; ≤ 0.481δ^{3/2} on the Hermitian one-driver class; lower example above 0.4808 | — | general constant **R**; the 0.481 bound for its class and the example: exact checker replayed (second audit) | MON §3.4; REC §3 |

**Open in L4** (nothing certified):

| # | piece | what exists | status |
|---|---|---|---|
| 6.3.13 | One driver with self-interaction, non-Hermitian P, Wick share between 1/16 and 4/5, u ≥ 0.03: envelope (★) giving 0.22 | tail proved (**R**); compact part true on grids with smallest margin 0.38 % of H (**N**); six local boxes certified by a thread, not a cover | **open** (MON §4; LOG §22, §23, §29; `RCV/integrated_wick_envelope/`) |
| 6.3.14 | Small-Wick strip (share < 1/16, c ≠ 0): candidate (†) with an affine weight, numerically 0.2306 | exact tail checker replayed by the audit (**C**) and a neighbourhood of share 0 of unknown width; the compact domain is not certified and 0.2306 is not an upper bound | **open** (CERT §3; LOG §27) |
| 6.3.15 | Same family for u < 0.03 with p > u/5 | nothing | **open** (LOG §26) |
| 6.3.16 | Mixed one-driver shells X̄B(Y), (\|X\|²−1)V(Y), X²W̄(Y), R₀(Y) with their cross terms | exact bookkeeping (6.3.8) and the neighbourhood lemmas 6.3.9–6.3.9b | **open** |
| 6.3.17 | Several self-interacting drivers | the claim that it "follows driver by driver" has no proof and is not a valid conditioning step in general | **open** (REC §4) |
| 6.3.18 | **Arbitrary cubic on R** | no checked sufficiently strong uniform theorem covers arbitrary tensors on [0.00551, 0.0463] | **open** (REP §2 (c)) |

### 6.4 The Wick monomial is a saddle, not the maximiser

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.4.1 | Exact extremality of the Wick monomial for C²/D ("Conjecture E") is false: along q_τ = √(u/(2+τ²))·X[(\|X\|²−2) + iτ(\|Y\|²−1)] the derivative of the ratio in τ² at 0 is positive (> 1/1000 at u = 463/10000) | peak row; a local statement; not a counterexample to K or to a 0.10 bound | **refuted**: second-variation implication **P**, exact algebra replayed (**C**), the sign of the derivative rests on kernel inputs that are **R**, the finite perturbation is confirmed independently by deterministic quadrature (**N**) | REP §1; CERT §6; `RCV/progress_2026-11-05/` |
| 6.4.2 | Values at u = 0.0463: Wick monomial 0.087565304234; τ = 0.1: 0.087576329175; maximum of the imaginary family 0.0875781815 near τ = 0.1276; best two-variable candidate X[(\|X\|²−2) + z(\|Y\|²−1)], z = 0.05283531218 + 0.22122669064i: **0.08760259435** | deterministic quadrature, two independent implementations agree to about 10⁻¹² | **N** | REP §5; OPT §4; PF §3; `code/audit-2026-11-13/results/STRUCTURED_BASELINE.json` |

### 6.5 What any proof of the content inequality must use

| # | statement | status | where |
|---|---|---|---|
| 6.5.1 | Gaussian-marginal obstruction: there is a non-chaos H with exactly Gaussian law, orthogonal to the driver, with Λ(H + t(T−1)U) > S for small t. So the law of the residual, orthogonality and all radial tests are not enough; the Wick structure (E‖Dq‖² = 3u, the resolvent identity) must enter | **R** ([P] in the manuscript, sharpened on 5 November to a violator of the whole 1.402 allowance with 44 % of its energy outside H₂,₁) | DIG §3; `ch35`; MON §3.4; LOG §11e, §11h |
| 6.5.2 | The lemma is a finite-amplitude statement: leading-order and Taylor routes reach at most u ≈ 0.011 (optimal tensor constant), certified radii 0.006 to 0.008 in amplitude, against amplitudes up to 0.26 | **R** | MON §3.4; LOG §12b, §12c |
| 6.5.3 | A centred conditionally Gaussian coefficient without the chaos moment inequality can exceed 0.24 (two-point laws reach 0.2469 and 0.2646) | **R** | LOG §15 |

## 7. Layer L5: sector assembly

### 7.1 The B shell

| # | statement | scope | status | where |
|---|---|---|---|---|
| 7.1.1 | B-shell cost: Λ(q + z₁²·conj(r)/√2) ≤ Λ(q) + 2Re E[conj(r)·F_B(q)] − κ_B‖r‖², κ_B = 13/50, 29/100, 3/10 at the peak, flank, upper rows | every remote q, r ∈ L², every amplitude, arbitrary sharing. **The base must be remote** (independent of z₁): the theorem does not apply at the base q + (T−1)r_A | **P + C** | REP §1; ASM §3.1; REC §3; `RCV/b_shell_global_cost/` |
| 7.1.2 | The B shell has first-order content: for H = X(\|X\|²−2), E[X̄H] = 0 and E[X̄H\|H\|²] = 32, so a small B shell of the right phase raises Λ | — | **P**. Hence "every non-A sector is pure cost" is false | ASM §3.1; REP §3 item 5; LOG §31 (correction) |
| 7.1.3 | B-content for the Gaussian-factor class: C_B² ≤ (239/2000)·Δ; local B-cost 7/20 for shell energy ≤ 0.0113 | three rows | **R** (replayed by the user; not by the audits). Not interchangeable with an alignment estimate (REC §1) | MON §4b; LOG §32; `RCV/b_sector_content_and_cost/` |
| 7.1.4 | Global kernel comparison: \|g_B(v) − 0.5053·g(v)\| < 0.007 for every v≥0; hence ‖c_B − 0.5053c_A‖≤0.007√u by L² contraction | peak profile; every remote L² q in every dimension, no energy cutoff or cubic assumption. Other profiles are not covered | **P + C**, re-derived and replayed by claude-b9ee on #403 (A15F review archive): 100-bit Arb endpoints and derivative moments, exact 79-cell cover of [0,16], complete-monotonicity infinite tail. Earlier ratio/endpoint-center counterexamples remain valid | A15T `ALIGNMENT.md`, `CONTENT_KERNELS.md`; `kernel_alignment.py`; historical target REC §1 and `RCV/J3_audit/` |
| 7.1.5 | B-content for general q (beyond the Gaussian-factor class) | — | **open** | LOG §32 |

### 7.2 The z-odd sectors z₁Q, z̄₁P, d·z₁(T−2) over a nonzero core

| # | statement | scope | status | where |
|---|---|---|---|---|
| 7.2.1 | No odd first variation at genuine even cubic cores; no mixed even/odd Hessian entries when the Hessian exists (2.9) | parity itself holds for every even L² core; differentiability is a separate hypothesis outside the cubic class | **P** with the regularity qualification | ASM §3.2; A15R `SECTORS.md` §6 |
| 7.2.2 | Directional majorant: (\|X+Y\| + \|X−Y\|)² ≤ 4M − 4c²/M, M = \|X\|² + \|Y\|², c = Re(XȲ) | pointwise | **P** | ASM §3.2 |
| 7.2.3 | One nonzero core: Λ(H + τO) ≤ Λ(H) − 0.063‖τO‖² for 0.03 ≤ \|τ\| ≤ 0.04 (0.174 at 0.04) at one explicit core H and one odd direction O | peak row, that core only | analytic reduction **P**; the interval integration **R** (not rerun by the audit) | ASM §3.2; LOG §37; `RCV/directional_odd_cost/` |
| 7.2.4 | Uniform pure cost Λ(H + O) ≤ Λ(H) − κ_E‖O‖² over genuine even cubic cores ("E2"), first at the peak profile | a specified peak/three-row target; the unrestricted extension to every profile in the application box, including H=0, is **refuted** by 5.4a | **open** at the peak. Numerically the true cost is 0.79 to 1.32 per unit energy on nine cores (**N**; LOG §36; `e11_oddform.py`) | `sources/prompts/subproblem-E2-uniform-odd-cost.txt`; A15R `SECTORS.md` |

### 7.3 The joint A/B form: what is certified

| # | statement | scope | status | where |
|---|---|---|---|---|
| 7.3.1 | At q=0, Λ(sH)=2E abs(L)−s²Q₀+o(s²), H=(T−1)r_A+Z²conj(r_B)/√2, and Q₀≥.24‖r_A‖²+.26‖r_B‖²+.236Re E[r_A conj(r_B)]+.08(‖r_A‖²+‖r_B‖²) | Three named rows; arbitrary jointly distributed remote L² r_A,r_B independent of Z. Infinitesimal at zero core only. Exact entries k_A=p−(J₂−2J₁+J₀)/2, k_B=p−J₂/4, m=(J₂−J₁)/(2√2); improves the old .07 reserve | **P + C**, dominated remainder and scalars re-derived/replayed by claude-b9ee on #409 | A15F `JOINT.md` §§1–2; `joint_reduction.py`; LOG §38; `RCV/signed_joint_ab_hessian/`; the entries were also reproduced by the 15 November package in section 11 |
| 7.3.2 | At every remote base q: −½·(second derivative of Λ along the A/B direction) ≥ 0.241‖r_A‖² + 0.261‖r_B‖² + 0.236Re E[r_A r̄_B] | three rows; any dimension and sharing; no energy cap on q; **infinitesimal only** | analytic reduction and the exact tail (x ≥ 6) **P + C**; the compact integral bounds **R**, with the stored coverage of [0, 6] by 474 boxes and the positivity of the stored bounds checked | REP §1; ASM §3.3; LOG §42, §43; `RCV/all_shift_signed_ab/`, `RCV/all_shift_signed_ab_v2/` |
| 7.3.3 | 7.3.2 cannot be integrated along q + s(A + B): the intermediate bases depend on z₁ and are not remote | — | **P** (logic; the proofs say so themselves) | ASM §3.3; REP verdict |
| 7.3.4 | The pointwise finite-amplitude Hessian form fails at intermediate bases: smallest eigenvalue −0.03 at \|β\| = 0.1, −0.84 at \|β\| = 0.3 | peak row, grid | **N** | LOG §41; `code/experiments-2026-11-04/e11_ab_kernel_finite.py` |
| 7.3.5 | The B-cost at "every even L² base" is false (cusp counterexample H = L·sign(Re z₁)); a loss of 0.07 on both diagonals breaks the 5.5·10⁻⁵ budget (exact witness, excess 0.000424157) | refutes two inferences, not the restricted target and not K | exact algebra **P** (replayed); the package's Arb kernel counterexamples **R** | ASM §3.4; LOG §45; `RCV/J3_audit/` |

### 7.4 The joint A/B form: what is missing, and what would suffice

**The missing statement** (REP §4; ASM §5). Set h = (T−1)r_A + z₁²·conj(r_B)/√2, V = L + q, p = 1/ε and
R(V, h) = 2(|V + h| − |V| − Re(h·conj(ph V))). First at the peak row: for every dimension, every q ∈ H₂,₁ with
0.00551 ≤ ‖q‖² ≤ 0.0463 and arbitrary remote linear forms r_A, r_B in the same Gaussian variables with squared
norms at most 0.0113,

    E R(V, h) ≤ (p − 0.24)‖r_A‖² + (p − 0.26)‖r_B‖² + 0.236‖r_A‖‖r_B‖.

**Open.** It is not a consequence of its restrictions to either axis. The other rows, the omitted energies and any
response restriction used to narrow the box are separate obligations.

| # | statement | status | where |
|---|---|---|---|
| 7.4.1 | For a positive-definite real cost matrix [[k_A,m],[m,k_B]], k_A>0 and k_B−m²/k_A>0, the unrestricted optimized gain is ‖c‖²/k_A + ‖d−(m/k_A)c‖²/(k_B−m²/k_A) (c,d the A/B contents); amplitude caps can only reduce it | **P**; hypotheses restored from the cited proof | REP §4; ASM §1; A15R `SECTORS.md` §7 |
| 7.4.2 | Sufficient content constants γ (k_A=.24,k_B=.26,u≤.0463, peak alignment now certified by 7.1.4): favourable signed m=.118, γ=.24 gives excess <.000051525; joint diagonal cost m=0, γ=.15 gives ≤1.438·10⁻⁵; adverse cross coefficient at most .118, γ=.10 gives ≤7.181·10⁻⁵ (exact threshold for 10⁻⁴: γ≤4889900/47482107) | formulas **P**; scalar budgets **C**. **Conditional** on the corresponding joint finite-amplitude bound and content premise, which remain open for general cubics. The favourable budget improves the previous numerical .00005471. These constants are sufficient, not necessary for K | A15T `ALIGNMENT.md` §5, `alignment_budget.py`; A15 `claims_exact.py`; REP §4, ASM §1, REC §1 |
| 7.4.3 | Separate axis costs do not imply a joint cost: the quadratic gain 2c_Aa + 2c_Bb − 0.24a² − 0.26b² + 0.40ab with c_A = 1/200, c_B = 0.5053c_A, Δ = 1/4000 satisfies both axis costs, c_A² = 0.10Δ, exact alignment and both amplitude caps, and exceeds Δ by 0.00033415 > 10⁻⁴ | **P** (exact rational arithmetic). Refutes the implication; not a cubic counterexample to K | ASM §2 |
| 7.4.4 | A positive mixed coefficient m does not make 2m·Re⟨r_A, r_B⟩ nonnegative for arbitrary phases | **P** | ASM §2, §4.2 |
| 7.4.5 | Reduction of the missing statement to a compact box: if r_x(α,β)≤Q(α,β)−η(abs(α)²+abs(β)²) for 0≤x≤29/10 and all complex α,β with abs(α),abs(β)≤.4 and η=7.53·10⁻⁵ (signed target: 8.07·10⁻⁵), the joint bound holds for every remote q and shells of variance≤.0113, with any dependence. A15V closes abs(x)≥2.9, all amplitudes, with surplus ≥.007(abs(α)²+abs(β)²) at all three rows | Original reduction **P by its author codex-a713 after the audit** (IMP-JT); #409 re-derived Gaussian-tail/closing steps but checked global constants only numerically. A15F’s cutoff 4.25 was **P + C**, reviewed on #409. **Dated fifth-audit completion:** A15V re-derives the entire reduction, certifies the missing density/global constants and all reserve-table rows, and improves the cutoff to 2.9: **P by author, not externally reviewed + C**. The new .007 reserve supports radius .4, not the old radius-.3 table row. **The compact box inequality remains open.** | IMP-JT; IMP; A15F `JOINT.md` §3; A15V `JOINT.md` §§1–4; `joint_tail.py` |
| 7.4.6 | Empirical margins of the content ratio against the three constants: 0.10/0.0876 = 1.142, 0.15/0.0876 = 1.712, 0.24/0.0876 = 2.740 | **N**. The margin 2.7 of the monograph is an A-only comparison | REP §5 |
| 7.4.7 | Direct values of the joint sector gain (15 November; not the remainder bound above): the supremum over the A and B amplitudes of Λ(q + sectors) − Λ(q) is at most 0.166·D(q) on what was tested, and about 0.025·D(q) when the first-chaos penalty is retained and its multiplier optimised together with the sectors | **N**; peak row; searches. The Wick monomial and tensors in two remote variables with the A and B sectors; tensors in three remote variables with the A-sector only. The retained ratio rises slowly with the number of variables (11.20). Method and limits: 11.15, 11.16, 11.20. A proof attempt for the retained A-sector: 11 (e); completed at the tilt 3/5 in its sixth version (11.51) | KPR; section 11 (c) |
| 7.4.8 | A global raw A/B cost .300 is impossible: at q=0 and normalized direction (r_A,r_B)∝(1,−1/5), the limiting cost is in (.298526023077303,.298526023077304) | Peak profile; even a genuine shared Gaussian linear driver realizes this zero-core direction. A global target must be below this displayed upper endpoint and cannot exceed the smallest local eigenvalue; e.g. .29 is an unproved test target. Does not refute the signed (.24,.26,.118) target, K, or the reviewed tilted A-only result; literal .300 target **refuted**, **P + C scalars**, re-derived/replayed by claude-b9ee on #409 | A15F `JOINT.md` §2.1; `joint_reduction.py`; correction to 11.45 and section 15 |
| 7.4.9 | Sharp zero-core local A/B least eigenvalues: peak (.298364651634117,.298364651634118), flank (.323152847874178,.323152847874179), upper (.327715897185325,.327715897185326). Peak B-energy share (.032688705743602,.032688705743603) | Genuine cubic Gaussian-driver directions realize these local minima. No global common A/B cost can exceed the corresponding local value; .29 remains an unproved peak candidate. The imaginary pointwise Q/ν block has least eigenvalue (−.387101627337727,−.387101627337726) and ν-energy (.418138450101614,.418138450101615), but constant Q is not a centered quadratic: no integrated cubic obstruction follows; **P by author, not externally reviewed + C** | A15V `JOINT.md` §5; `joint_tail.py` |

### 7.5 All sectors together

Open. No theorem covers G = q + A + B + odd sectors with q ≠ 0: Theorem A needs q = 0, Theorem B needs Gaussian
drivers with a nonnegative profile. Numerically (**N**) every value of Λ − S is negative for G ∈ H₂,₁(ℂ²) with 18
shells at the amplitudes tested (LOG §31; `e11_ksector.py`). The audit's list of what L5 still needs: (i) the
finite-amplitude joint A/B control of 7.4, keeping the joint law of q and its drivers; (ii) B-content control: the alignment comparison 7.1.4 is now certified at the peak and reduces it to A-content; (iii) uniform control of the odd sectors over a nonzero even core (REC §5).
15 November (**N**, 11.45): the pointwise remainder bound that 11.39 proves for the tilted A-sector has a numerical
analogue for A, B, z₁Q and z̄₁P together (margin 0.128 = k₁ for K, at the origin), but not with d·z₁(T − 2), whose
cross term with z₁Q vanishes only after integration.

## 8. Layer L6: row envelope and consumption

The full consumer is not built (**open**; REP §2 (d); ASM §4.7; REC §5). A15R now checks a conditional central component exactly: at the single peak row, an all-sector raw or retained K_η bound with η≤10⁻⁴ covers t∈[.84,.851], with strict cap margin >6.12·10⁻⁷ below 500/701. The exact admissible allowance is 166713115892493/1656988750000000000≈.0001006120988404375; that row also covers [.83995,.85125]. **P by author + C**, conditional on the existing S upper enclosure and the still-open all-sector premise (`FOUNDATIONS.md` §4, `foundations_exact.py`). A remote-only cap cannot replace that premise.

- A read-only search of `Grothe/`, `GrotheKernel/`, `docs/LEAN_DETAILS.md`, `docs/overview.tex` found no
  `lower_of_K`, `KHyp`, `ConjectureK` or `K_eta`.
- Obligations: an exact cover of the response parameter t and of the profile rows; the σ* = 0 corner or a proof that
  it is not used; interval upper bounds for each S; a justified treatment of the energies outside R and of every
  response region omitted; an explicit error ledger with exact thresholds (500/701 for 1.402, 5000/7011 for 1.4022).
- If rows with different ε are used, the consumer must say how they relate to a single witness operator: pointwise
  bounds for different operators cannot be minimised silently (REC §5). The flank row has ε = 149/200, at which the
  witness cannot reach 1.402 at all: a genuine response gives norm above 0.71329 (`docs/overview.tex`, "Limits of
  the witness method"; model value 0.713288, i.e. 1.401957).
- The 10⁻⁴ budget supports about 1.402. If the cap 0.713160 (**R**, floating point) were usable under exact K, the
  room to 1.4022 would be about 5.03·10⁻⁶ (REC §6.5).

## 9. Numerical evidence on the content ratio (all N)

Peak row. R_n(u) = sup of C(q)²/D(q) over q ∈ H₂,₁(ℂⁿ) with ‖q‖² = u. R_n is nondecreasing in n (**P**: pad with
zeros), so a value found in dimension n is available in every larger dimension.

| source | what | values |
|---|---|---|
| Audit experiment (REP §5): all 6, 18, 40, 75, 126 complex coefficients for n = 2…6; 50 starts at each of three energies; 750 paths refined to intrinsic stationarity; 1,500 end points validated on 2²² independent points; 15 selections on fresh 2²⁴-point holdouts | selected candidates at u = 0.0463 | 0.087602476 (n = 2), 0.087600621 (3), 0.087583916 (4), 0.087532331 (5), 0.087491760 (6); integration errors 10⁻⁶ to 10⁻⁵. At u = 0.03: 0.0785; at u = 0.02: 0.0691 |
| | structured baselines, feasible in every n ≥ 2 | 0.06914308055 (u = 0.02), 0.07857989851 (0.03), **0.08760259435** (0.0463) |
| | reading | no strict increase with n is resolved; lower values at n = 4, 5, 6 are search limitations, not a trend; the largest training value 0.0930 (n = 6) evaluated independently at 0.0875 (adaptation to the training sample); no end point above 0.10; the selected tensors are 96 to 98 % Wick monomial plus an imaginary Hermitian X·P(Y) part, the known saddle direction |
| Our scan of 13 November (KSCAN): n = 2…10, Monte Carlo, 840 runs and a second pass with 2²² samples | best re-evaluated ratio at u = 0.0463 | 0.0892 (n = 2), 0.0888 (3), 0.0886 (4), 0.0885 (5); second pass 0.0854–0.0879 (n = 6), 0.0850–0.0869 (n = 8), 0.0828 and 0.0852 (n = 10); errors ±0.0003 to ±0.0011 |
| | at u = 0.03 and 0.02 (n ≤ 5) | about 0.080 and 0.070 |
| | reading | superseded by the audit's numbers where they overlap: the values above 0.0876 are within 2 to 3 standard errors and carry a selection bias (best of 50). The scan's formulas were audited (OPT §1) and seven implementation limitations listed (OPT §2). Not tested by anyone: n > 10, adversaries with a large diffuse part, the flank and upper rows |
| Second audit (PF §3; OPT §4), deterministic quadrature on ℂ² | all six coefficients | 0.0876025944 (the same candidate); local maximum modulo symmetry; not a global certificate |
| Diffuse boundary (DIF) | q = √e·Q + √(u−e)·W with an independent Gaussian buffer | **P**: C²/D → 0 linearly in e; for N independent Wick blocks the ratio is 0.403153856/N + o(1/N). **N**: 0.0226, 0.0585, 0.0763 at structured shares 0.1, 0.5, 0.8. Does not control shared-driver limits such as X·N^{−1/2}Σ(\|Y_j\|²−1); the supremum over all dimensions may exceed the scanned values |
| Old scan of 5 November (MON §3.5) | 12 shells of ℂ⁴ | 0.0891 at the monomial: an approximate benchmark with no error bars, superseded |

A numerical ratio cannot measure the distance to a proof: even a verified all-dimensional content theorem with
constant 0.10 would leave the joint estimate, the odd sectors, the response regions and the consumer (ASM §5).

## 10. Identity-tail games (14 November; all N)

TAIL; scripts in `code/tailgames-2026-11-14/`. Floating point, two-variable graded model; nothing is a certificate.

- A game λ = (1, λ₁, …, λ_D, ν, ν, …) with a constant tail is a valid witness and adds no order parameter, because
  the identity part is pointwise: Re⟨f, g⟩ = 1 − 2‖k‖². Model norms of such games have no truncation error.
- Cubic head with tail: N(1, −ε, ν, ν, …) = (1 − ν)·sup[V_ε̂(f, g) − 2ν̂‖k‖²] + ν, ε̂ = (ε + ν)/(1 − ν),
  ν̂ = ν/(1 − ν). The row is the cubic one with the pointwise potential |A| + |B| replaced by
  Ψ_ν(A, B) = max_{|u|=|v|=1}[Re(ūA) + Re(v̄B) + ν·Re(u v̄)] = min{(d₁+d₂+d₃)/2 : diag(d) ⪰ M} (dual formula checked
  to 5·10⁻¹⁵ on 40 random cases).
- Optimum ε = 0.7681, ν = +0.0235: model norm **0.713021**, i.e. 1.402483, against 0.713136 (1.402257) without a
  tail. Two optimisers agree to 10⁻⁶. At degree 5 a tail gains only about 4·10⁻⁵ (with ν < 0).
- Untested at certificate level: it needs the row pipeline rerun with Ψ_ν at (ε, ν) ≈ (0.768, 0.0235), new caps, and
  a Lean change in the witness and in the pointwise step. The note does not formulate an analogue of K for Ψ_ν.

## 11. The reports of 15 November, their reviews, and the follow-up of the same day

**(a) "Retaining the first-chaos penalty"** (EXT-P; `sources/external-2026-11-15/projection-attack-package/`).
**Verification record: REVIEW.md in `sources/external-2026-11-15/`** (REV; claude-b9ee, 15 November; scripts and
logs in `review/`). What was done:

- the written proofs of 11.1 to 11.3 were read and re-derived;
- 11.4 was re-derived for one shared driver with real coefficients, and finite differences of the exact functional
  (steps s = 0.02, 0.01, 0.005 in four directions, in the same one-driver case) converge to the two quadratic forms,
  without and with the penalty (`review/review_check.log`);
- constants: the package's verifier was replayed with python-flint 0.9.0 and its output is identical to the
  package's `results.txt` (`review/verify_replay.log`; the 21 result lines were compared again when this file was
  assembled). An independent floating-point quadrature agrees with the enclosures in every digit it prints: 12
  decimals for j₀ and 1/(1 + j₀), 10 for the matrix entries (REV: "agrees to 12 digits");
- the global inequality 11.3 was tested on the Wick monomial q = c·y(|y|² − 2)/√2 at six amplitudes, c = 0.05 to 1.5
  (‖q‖² = 0.0025 to 2.25): it holds with margins 1.5·10⁻⁸ to 2.7·10⁻²;
- 11.5 was read only; for 11.6 only the package's verifier was replayed.

| # | statement | scope | status |
|---|---|---|---|
| 11.1 | Λ̂(G) := min_{u ∈ H₁,₀}{‖u‖² + E\|L + G − u\| + E\|L − G + u\|} − ‖G‖²/ε satisfies Λ̂ ≤ Λ, and the row 2.1 holds with Λ̂ in place of Λ (exact penalised support duality) | every G; a uniform cap on Λ̂ would suffice in the same row envelope. **Λ̂ is the functional Λ_P of the October manuscript (2.10a)**, i.e. the functional of K′ (2.10) without the constraint εP₂,₁k = G, and Λ′ ≤ Λ̂ ≤ Λ | **P** (re-derived by claude-b9ee, REV). Also in `ch20` |
| 11.2 | The gradient of M(w) = E\|L + w\| is globally j₀-Lipschitz, j₀ = ½E\|L\|⁻¹ = 1.43197 at the peak | uses 2.7. Already in `ch20` (j₀ = H₀/2) | **P** (claude-b9ee, REV: "read; eigenvalue bounds checked") |
| 11.3 | Global bound: Λ̂(q) ≤ Λ(q) − ‖P_rem m(q)‖²/(1 + j₀), m(q) = E_{z₁} ph(L + q), 1/(1 + j₀) = 0.411188641… at the peak | every remote q ∈ L², every amplitude, every dimension. The correction is nonlinear in q; it does not handle the A and B sectors. Already in `ch20` (the theorem "quantitative penalty for the q-only part", multiplier ≈ 0.4112) | **P** (claude-b9ee, REV); **N**: the test on the Wick monomial at six amplitudes. The constant: Arb enclosure in the package (verifier replayed by the recipient only, **R**), agreed by independent quadrature (**N**) |
| 11.4 | Local A/B cost matrix of Λ̂ at G = 0: Λ̂(sH) = 2E\|L\| − s²·𝒬(r_A, r_B) + o(s²), H = (\|z₁\|² − 1)r_A + z₁²·conj(r_B)/√2, with matrix [[0.60684, 0.26291], [0.26291, 1.01344]], smallest eigenvalue above 0.477; before retaining the penalty the entries are 0.32005, 0.11799, 0.94020 | **local at G = 0 only**: not a finite-amplitude bound, not a Hessian bound at a general q; it must not be inserted as a cost in a certificate (the report says so). For the tied multiplier of October the matrix is already in `ch25-parts/20-stability-and-smoothing.tex` (see below) | **P** for one shared driver with real coefficients (formulas re-derived by claude-b9ee, REV); **N**: the finite differences (same case) and the entries (independent quadrature; recomputed again for this file). The original review read only the several-driver complex form (**R**); A15 independently verifies it with scalar enclosures (11.22) |
| 11.5 | A necessary condition at a local maximiser stable under fresh coordinates (inequality for P₂ ∈ H₁,₁) | assumes a maximiser exists and the second derivative is integrable | **R** (read only) |
| 11.6 | A weighted cubic contraction can be negative: for q = X[5(\|X\|²−2) + 6i(\|Y\|²−1)]/√86, Re E[e^{−\|q\|²}·q̄²·Σ_j(∂_jq)(∂_{j̄}q)] < −1/50 (interval certificate in the package) | rules out one positivity shortcut; **not a counterexample to K** | **R**: the package's interval verifier was replayed by the recipient only (REV prints C for this); the statement was not re-derived |

**Relation to the record.**

- 11.1 to 11.3 are in the October manuscript (2.10a): `ch20`, the proposition on the first-chaos dual and the
  theorem "quantitative penalty for the q-only part", with the same constant (H₀/2 = j₀ = 1.4319737913, multiplier
  0.4112).
- 11.4 is partly in the record. `ch25-parts/20-stability-and-smoothing.tex`, subsection "Why the local pinned
  matrix is not a global majorant", takes the **tied multiplier** k = α/3 + β/6 (the first-chaos element tied to the
  sector amplitudes α, β with rational coefficients) and gives, "including its cost |k|²", the local matrix
  M = E[v(T)v(T)\*/(2|L|)] + dd\*, v(T) = (T − 2/3, 1/6 − T/√2), d = (1/3, 1/6),
  M ≈ [[0.7154593, −0.2627445], [−0.2627445, 0.3087284]]. M is a curvature; the cost in the sense of 11.4 is
  p·I − M = [[0.60659, 0.26274], [0.26274, 1.01332]]. The chapter does not print this subtraction (REV and KPR
  make it). The report of 15 November minimises over the first-chaos element instead of tying it. At second order
  at G = 0 that amounts to the coefficients −g₀/(1 + j₀) = 0.34340 and −d₀/(1 + j₀) = 0.17353 in place of 1/3 and
  1/6 (d₀ = −0.42203 is the B analogue of g₀), and gives the slightly larger [[0.60684, 0.26291], [0.26291, 1.01344]].
  Checked when this file was assembled, with the closed-form integrals of the peak row in floating point
  (`code/record-checks-2026-11-15/tied_matrix_check.py`): M_AA = E[(T − 2/3)²/(2|L|)] + 1/9 = 0.7154593426, the other
  two entries of M as printed in the chapter, and the same formula with the two optimal coefficients gives
  p·I − M = [[0.6068388548, 0.2629125966], [0.2629125966, 1.0134380703]], the entries of 11.4.
- The same subsection proves that the tied local matrix is not a global majorant, even with I/10 added (13.1,
  item 19). That is the caveat in the scope of 11.4.
- The chapter uses the tied multiplier for the cost matrix. The package behind it also names the first-order
  profiles that go with it; see the relation to the record in 11 (c).
- Only the counterexample 11.6 was not found in the record.

What the report changes: no bound (it says so). At G = 0 with the penalty retained the local A-cost is 0.60684
(0.60659 with the tied multiplier of October) instead of 0.32005. What it does not change: the uniform
finite-amplitude control at general remote bases is missing exactly as in 7.4.

**(b) "Remote closure"** (EXT-R). The package it names was **not received and nothing was checked: R.** In its own
normalisation (λ = 0.75637, η = 0.31631, L = Z + ληH(Z), A = 1 − λη², Φ(q) = (E|L + q|)²/(A + λ⁻¹E|q|²)) it claims,
for remote cubics q in every dimension:

| # | claim |
|---|---|
| 11.7 | (1) E\|q\|² ≤ 1 ⟹ Φ(q) ≤ 2853/4000 = 0.71325 (124 interval rectangles) |
| 11.8 | (2) θ ≤ 1/2 ⟹ Φ(q) ≤ 2853/4000 at every amplitude, where B = ⅓E[∇X∇Xᵀ] for X = √2·Re q and θ = ‖B‖_op/‖B‖_HS |
| 11.9 | (3) Φ((Q₁ + Q₂ + Q₃ + Q₄)/2) ≤ 2853/4000 for four independent copies of any remote cubic Q |
| 11.10 | Sixth-moment bound E\|q\|⁶ ≤ 6u³ + 9uδ + 96·√(6/23)·θ·δ^{3/2} (u = E\|q\|², δ = E\|q\|⁴ − 2u²), from a completely positive map in the sixth cumulant |
| 11.11 | A remote counterexample would need E\|q\|² > 1 and ‖B‖²_HS/‖B‖²_op < 4 |

It concerns the remote part (L1) only; cubics sharing z₁ are outside it, as the report says. Its second message
claims an upper bound K_G^ℂ < 1.404896400821, which is weaker than the repository's proved 1.404599412097 (1.4046
until PR #394, 15 November) and unrelated to K.

Review (REV §3): nothing could be checked, so every claim stays **R**. Two remarks. (i) The normalisation is
consistent with ours (**N**, `review/ratio_form.log`): with λ = 0.75637 and η = 0.31631 the visible profile is
L = Z(0.66165 + 0.16917|Z|²), ratio 0.2557 against 0.2561 at the peak row, and the supremum of Φ over Gaussian remote
q is 0.7131355 at E|q|² = 0.0572, the known model norm. So claim 11.7 would close the remote part with a loss of
1.15·10⁻⁴, just below the threshold 500/701 = 0.7132668 for 1.402. (ii) The device of the second message, writing
the tail as H(1) minus the head, is the identity behind the identity-tail games of section 10.

**(c) Follow-up of 15 November: the retained element optimised together with the sectors** (KPR; claude-b9ee;
scripts, logs and search records in `code/kprime-2026-11-15/`). Prompted by (a). **Peak row only. Floating-point
quadrature and searches, no interval arithmetic; the only proved statements are 11.12 and the formulas of 11.13.**

Setting, as in KPR §1. Λ̂ = Λ_P is the functional of 11.1. q is a remote cubic of energy u = ‖q‖² and
D(q) = Λ_Gauss(u) − Λ(q) its deficit (the D(q) of README, part (a); Λ_Gauss(u) is the value at a Gaussian remote
element of the same energy). The A-sector is (|z₁|² − 1)·r and the B-sector z₁²·conj(r_B)/√2, with r and r_B linear
forms in the remote variables. **gain(q)** is the supremum over the sector amplitudes of the functional at
q + sectors, minus Λ(q). For K the functional is Λ. "With the penalty retained" it is Λ̂: the minimum over the
retained element u is taken inside the supremum, with u a linear form in the remote variables. The inequality the
sectors must satisfy is gain(q) ≤ D(q) + η, and its *margin* is D/gain. Profiles: E_{z₁}ph(L + w) = w·j(|w|²) and
E_{z₁}[(T − 1)·ph(L + w)] = w·g(|w|²) (the g of README, part (a)); j₀ = j(0) = 1.431973791, g₀ = g(0) = −0.835135933,
k_A = p − E[(T − 1)²/(2|L|)] = 0.320054504.

| # | statement | scope and method | status | where |
|---|---|---|---|---|
| 11.12 | **Tilted sector.** For every remote q, every remote linear form r and every real s: Λ̂(q + (\|z₁\|² − 1)·r) ≤ 2E\|L + q + (\|z₁\|² − 1 + s)·r\| − p‖q‖² − (p − s²)‖r‖². The A-direction T − 1 may be replaced by T − 1 + s if the penalty p on r is replaced by p − s² | the A-sector over a remote base; no B-sector, no z-odd sectors. Proof: take u = −s·r in the minimum; G − u is even in z₁ and L is odd, so the two expectations are equal; ‖u‖² = s²‖r‖². The argument does not use the values of the row | **P**: short proof originally written by claude-b9ee in KPR §3; explicitly re-derived in A15V `FOUNDATIONS.md` and checked as an input of 11.46 in the review of #409. No scalar premise is needed | KPR §3 |
| 11.13 | **Local cost and content of the tilted sector.** Expanding the right-hand side of 11.12: the second-order cost at G = 0 is k(s) = k_A − 2g₀s − (1 + j₀)s² = 0.320 + 1.670s − 2.432s² (0.320 at s = 0; largest, 0.607, at s = −g₀/(1 + j₀) = 0.3434; 0.6066 at the October value s = 1/3; positive up to s = 0.843). The first-order term in r is 2Re⟨r, Π₁[q·h_s(\|q\|²)]⟩ with h_s(v) = (g(v) − g₀) − s·(j₀ − j(v)): the content c = Π₁[q·g(\|q\|²)] becomes c + s·μ, μ = Π₁[q·j(\|q\|²)]. With u free, the saddle of the second-order model is ‖c − g₀μ/(1 + j₀)‖²/(k_A + g₀²/(1 + j₀)) − ‖μ‖²/(1 + j₀) | formal expansions. The cost is local at G = 0 and the saddle value is that of a quadratic model: neither is a finite-amplitude bound (see 11.17) | **P** for the formulas, with the caveat of 11.12 (re-derived for this file; the constants recomputed in `code/record-checks-2026-11-15/tied_matrix_check.py`) | KPR §3 |
| 11.14 | **The cancellation.** g − g₀ ≥ 0 and j₀ − j ≥ 0 on the computed range, and the ratio (g(v) − g₀)/(j₀ − j(v)) decreases from 1.291 as v → 0 to −g₀/j₀ = 0.583 as v → ∞. So for s between 0.58 and 1.29 the profile h_s changes sign (positive at small \|q\|, negative at large \|q\|) and its projection on the first chaos is small. On the Wick monomial at u = 0.0463: c = 0.03250 and μ = −0.03467, so the content c + sμ is 0.63·c at s = 0.343, 0.36·c at s = 0.6, and vanishes near s = 0.94. The cost-optimal tilt (0.34) and the content-optimal tilt (0.94) differ; the best compromise on the monomial is s ≈ 0.75 | peak row. Small v by adaptive quadrature (`ratio_small_v.log`): 1.2909, 1.2909, 1.2908, 1.2907, 1.2902, 1.2887, 1.2837, 1.2700 at v = 10⁻⁶, 10⁻⁵, 10⁻⁴, 3·10⁻⁴, 10⁻³, 3·10⁻³, 10⁻², 3·10⁻²: non-increasing to four decimals (in the fifth decimal the first two entries are in the other order, 1.290886 and 1.290908). Larger v on the fixed grid of `tilt_profiles.py` (12 values of v up to 10⁴). That grid is inaccurate at small v: its first entry, 1.271 at v = 10⁻⁴, is a quadrature error, and its second, 1.2913 at v = 10⁻³, is 0.001 above the adaptive value. c and μ on the monomial only | **N** | KPR §3; `ratio_small_v.log`, `tilt_profiles.log` |
| 11.15 | **Numerically optimized sector gain on the Wick monomial**, as gain/D. K, A-sector: 0.1246, 0.1482, 0.1568, 0.1604 at u = 0.01, 0.02, 0.03, 0.0463; K, A and B: 0.1261, 0.1510, 0.1605, 0.1653. With the penalty retained, A: 0.0214, 0.0225, 0.0210, 0.0170; A and B: 0.0216, 0.0230, 0.0218, 0.0183. The retained element removes 83 to 89 % of the K gain. The saddle formula of 11.13 gives 0.000205 at u = 0.0463; the numerical value is 0.0002049 | q = c·y(\|y\|² − 2)/√2, one driver, real amplitudes; two- and three-dimensional quadrature | **N** | KPR §4; REV §2; `retained_content.log`, `retained_joint.log` |
| 11.16 | **Largest values found over all tensors in two remote variables.** K (A-sector): gain/D up to 0.1477 at u = 0.02, 0.1609 at u = 0.0463, 0.1554 at u = 0.09. With the penalty retained (A-sector): 0.0179, 0.0215, 0.0237, 0.0232, 0.0208, 0.0173, 0.0127, 0.0046 at u = 0.005, 0.01, 0.02, 0.03, 0.0463, 0.065, 0.09, 0.15. With the B-sector added at the tensors found: K up to 0.1657, retained up to 0.0241. **In two variables the margin of gain ≤ D is about 6 for K and at least 41 with the penalty retained, at every energy tried.** The K maximiser is close to the monomial; the retained maximiser has more weight on X(\|Y\|² − 1) | q ∈ H₂,₁(ℂ²) of fixed energy (6 complex coefficients); A-sector r = ⟨α, y⟩ and retained element ⟨γ, y⟩, all complex. Deterministic quadrature (51,200 remote × 48 visible nodes), L-BFGS over the tensor with the saddle in (α, γ) solved inside, three restarts per run. On a finer grid (196,608 × 72 nodes) the ratios move by at most one unit in the fourth decimal (0.0237 becomes 0.0236, 0.1609 becomes 0.1608). **A search: lower bounds on a supremum, not upper bounds. Two remote variables only. Peak row only. The B-sector only at the tensors found for the A-sector (not re-optimised)** | **N** | KPR §5; `code/kprime-2026-11-15/search/` |
| 11.17 | **Finite amplitude: the second derivative along the sector.** Θ(R) is the supremum, over base points (w, ρ) with \|ρ\| ≤ R and over directions, of the second derivative of ρ ↦ E_{z₁}\|L + w + (T − 1 + s)ρ\|; the sector is concave along the segment while Θ(R) < p − s². Found for \|ρ\| ≤ 0.3: Θ = 1.046 against the budget 1.322 at s = 0 (cost at least 0.276; local 0.320) and 0.642 against 1.204 at s = 0.3434 (cost at least 0.562; local 0.607). At the larger tilts: s = 0.6, budget 0.9621: Θ = 0.5729, 0.6276, 0.7086, 1.5020 at R = 0.1, 0.2, 0.3, 0.5 (cost at least 0.253 for \|ρ\| ≤ 0.3; local 0.447); s = 0.7, budget 0.8321: Θ = 0.6508, 0.7116, 0.8099, 1.7312 (cost at least 0.120 for \|ρ\| ≤ 0.2 and 0.022 for \|ρ\| ≤ 0.3; local 0.298). At R = 0.5 both are above their budgets. Without a restriction on ρ, Θ exceeds the budget at every tilt tried (1.576 > 1.322 at s = 0; 1.324 > 1.204 at s = 0.3434; 1.800 > 0.962 at s = 0.6; 1.811 > 0.832 at s = 0.7), in agreement with 13.1, item 19. Both variants need an a priori bound on the sector amplitude. The value 0.7086 is the numerical counterpart of the curvature inequality 11.33, and 11.32 is the theorem that turns such a restricted bound into a bound on the gain. The remainder itself, unlike the second derivative, has a numerical bound below the budget for every ρ (11.37), and at the tilt 3/5 a proved one (11.39) | s = 0, 0.2, 0.3434, 0.5 (`tilt_restricted.py`) and s = 0.6, 0.7 (`tilt_restricted_67.py`: the same script with the other two tilts; its file is dated after its log, and a run made when this record was updated reproduced the log exactly), R ≤ 0.5. The optimal amplitudes of 11.16 are \|α\| ≈ 0.03 to 0.06. **A grid search, not a certified supremum** (at s = 0.6, R = 0.3 a finer evaluation gives 0.7094: 11.33); a coefficient bound on r does not bound its pointwise values, and a tail allowance is needed (11.24, 11.32) | **N** | KPR §9; `tilt_restricted.log`, `tilt_restricted_67.log`, `tilt_profiles.log` |
| 11.18 | **Cauchy–Schwarz on the content.** Since Π₁q = 0, ‖Π₁[q·h_s(\|q\|²)]‖² ≤ min_κ E[\|q\|²(h_s(\|q\|²) − κ)²], a functional of the law of \|q\|² alone. On the monomial at u = 0.0463 this bound divided by k(s)·D is 1.18 for K (useless), 0.21 at s = 0.3434, 0.076 at s = 0.6, 0.073 at s = 0.75. For the exponential law of \|q\|² (the diffuse-cubic benchmark: D = 0 and content is 0 when the auxiliary Gaussian is excluded from the projection) at u = 0.0463 the bound divided by the cost is 9.9·10⁻⁴ for K and 1.6·10⁻⁴ at the best tilt (s = 0.65), against the slack 1.31·10⁻⁴ of the target 1.402 over the model value. **Cauchy–Schwarz alone does not reach 1.402, with or without the tilt.** A structural content lemma (content² ≤ κ·D) is still needed, but its constant may be many times the true one | the inequality is Cauchy–Schwarz; the numbers are quadrature with the local cost k(s) (the finite-amplitude loss is not included) | **N** | KPR §10; `cs_check.log`, `cs_gauss.log` |
| 11.19 | **A fixed tilt, and a structured family with a bath.** (i) With the retained element tied to the sector, u = −s·r with s fixed (the right-hand side of 11.12), the largest gain/D found over all two-variable tensors is 0.0510 at s = 0.3434, 0.0331 at s = 0.5, 0.0257 at s = 0.6 and 0.0237 at s = 0.7 (the larger of u = 0.02 and 0.0463): the single tilt s = 0.7 does as well as the free multiplier of 11.16 on the tensors found. KPR states the resulting target without a saddle: 2E\|L + q + (\|z₁\|² − 3/10)·r\| − (p − 49/100)‖r‖² ≤ 2E\|L + q\| + κ·D(q) + η, where any κ < 1 suffices and the largest value found is 0.024. At the tilt 3/5 this target is the lemma (\*) of part (e), where a proof was attempted; it is proved there in the sixth version of the report (11.51). (ii) In the family q = X[c₁(\|X\|² − 2)/√2 + c₂·S_m/√m], S_m = Σ_{k≤m}(\|Y_k\|² − 1), with real c₁, c₂ and m bath variables (also the Gaussian limit of the bath), sector and retained element along X: for K the largest gain/D over the mixing angle is 0.1603 at u = 0.0463 for every m, attained at the monomial; with the penalty retained it is 0.0231, 0.0185, 0.0082 at u = 0.02, 0.0463, 0.09 for m = 1 and decreases as bath variables are added (0.0225, 0.0169, 0.0052 from m = 10 on). Within this family more remote variables do not raise the ratio; the family does not contain the two-variable maximisers of 11.16, which have complex coefficients | peak row; (i) three restarts per run, two remote variables; (ii) exact quadrature in (\|X\|², S_m, T), u = 0.02, 0.0463, 0.09, m = 1, 2, 3, 5, 10, 30, 100 and the Gaussian limit. (i) is a search: lower bounds on a supremum | **N** | KPR §§6, 7; `search/tilt_*.log`, `family.log` |
| 11.20 | **Three remote variables.** All tensors of H₂,₁(ℂ³) of fixed energy (18 complex coefficients), A-sector. With the penalty retained the largest gain/D found is 0.0245 at u = 0.02 (four restarts from two seeds give 0.0245, 0.0245, 0.0241, 0.0245, the third at a different tensor), 0.0247 at u = 0.03 (both restarts of one seed) and 0.0230 at u = 0.0463 (eight restarts from four seeds agree), against 0.0237, 0.0232, 0.0208 in two variables and 0.0225, 0.0210, 0.0170 on the monomial. **0.0247 is the largest value found anywhere for the retained ratio with a free multiplier**; it differs from 0.0245 by less than the accuracy of this grid. For K at u = 0.0463: 0.1611 (both restarts of one seed), against 0.1609 in two variables and 0.1604 on the monomial; at the retained maximisers the K ratio is 0.139 to 0.148. Two structured tensors at u = 0.0463: X[(\|X\|² − 2) + 1.2(\|Y\|² − 1)] with K 0.1443 and retained 0.0185; the same with a second bath variable of the same weight, K 0.1296 and retained 0.0178. **The retained ratio rises slowly with the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463; 0.021, 0.023, 0.025 at u = 0.03), and the maximisers become less far from Gaussian (E\|q\|⁴/u² − 2 = 42, 19, 13 at u = 0.0463; in three variables 17.5, 14.8, 12.7 at u = 0.02, 0.03, 0.0463). Nothing is known beyond three variables: the limit of this sequence is open, and with it the size of the margin in general.** A deterministic grid is too large for four variables; a sampling method with variance reduction is needed | `kprime3.py` on a coarser grid (839,808 × 40 nodes): it reproduces the monomial ratios 0.1604 and 0.0170 as 0.1601 to 0.1606 and 0.0170 to 0.0172, so the third decimal of a ratio is reliable and the fourth is not. Two restarts per run, at most 60 L-BFGS iterations each; the first restart of a run with seed 0 starts near a structured tensor, every other restart from a random point. **A search: lower bounds on a supremum.** All runs are finished: the records were copied again in their final state (files dated 15 November 04:14), and every run has both restarts | **N** | KPR §8, §0; `code/kprime-2026-11-15/search3/` |

**What (c) does not establish.** No theorem beyond 11.12 and the formulas of 11.13: (c) proves no bound on the
sector gain, for K or with the penalty retained (part (e) has one for the retained A-sector, 11.26, which gives the
sector inequality only at very small energies, and one by the tilted content at every amplitude, 11.40; the sixth
version of that report completes the lemma for the retained A-sector, 11.51). Every
number is floating-point quadrature at the peak row, and those of 11.16, 11.19 (i) and 11.20 are results of
searches. Those sector numerics do not establish the remote part.
**Correction (A15):** L1 is Λ(q) ≤ S + η_R, equivalently
D(q) ≥ −[S − (B(u)−pu)] − η_R; it does **not** imply D(q) ≥ −η_R. The latter is a stronger
same-variance assertion. The follow-up remote replay is recorded separately in 3.3. Open: more than three remote variables (11.20; the family of 11.19 is a first
test); the other rows of the cover; the z-odd sectors z₁Q, z̄₁P, d·z₁(T − 2), where the retained element can have a
component along z₁; the B-sector optimised over the tensor; the finite-amplitude control (11.17; reduced in (e) to
the curvature inequality 11.33 with the localisation 11.35, or to the global bound 11.37, which the fifth version
of the report proves for the A-sector at the tilt 3/5, 11.39); and a proof of
any of it. The first thing to settle is the dependence on the number of remote
variables: the retained ratio rises from one to two to three variables (11.20) and its limit is not known, so the
margin "about 40" is a statement about one to three variables only. What it would change if it survives these
tests: the sector inequality gain ≤ D + η has a margin of about 6 for K, where the audit found the proof missing
(7.4; the content bound has an empirical margin of 1.14 against the constant 0.10), and a margin of about 40 with
the penalty retained.

**Relation to the record** (searched when this file was assembled, because the novelty of (c) depends on it).

- *The functional, the remote bound, the tied multiplier and its cost matrix are October results* (2.10a, 11 (a)).
  The tilt of 11.12 with s = 1/3 is the tied multiplier k = α/3 of `ch25-parts/20-stability-and-smoothing.tex` for
  the A-sector, as KPR §2 says.
- *The first-order side of the tied multiplier is also in the October record, in the package behind that chapter.*
  `OCT/weak-k-2026-10-15/LOCAL_CHANNELS.md` §4 states a conditional bound: if a fixed global cost matrix C were
  proved for the tied multiplier, with D = ε⁻¹I − C positive definite, then
  Λ_P ≤ EΦ₀(|q|) − ‖q‖²/ε + tr[D⁻¹(ΠF)\*ΠF] with F = (F_A + F₀/3, F_B + F₀/6). `GAUSSIAN_LOCALIZATION.md` §4 and
  `TIED_GRAM_AUDIT.md` call F_A + F₀/3 and F_B + F₀/6 the tied profiles. In the notation of 11.13,
  F_A + F₀/3 = q·(g + j/3), which is the content profile h_s at s = 1/3 up to a multiple of q. So the formula is
  there, for the rational tilt next to the cost-optimal one (KPR §2 and REV §1 credit it). What those notes did with
  it differs from (c). They tried to bound the tied content for every q by relaxations over the law of |q|²
  (moments, Bessel, Stein) and found them insufficient ("errors around 10⁻³" with moments and Bessel, even with a
  cost they knew to be false; an exploratory Gram programme whose figure 8.64·10⁻⁵ is "not a bound"), and they
  searched for global cost matrices, two of which they refuted (13.1, item 19).
- *The principle and the target are in the record.* That the retained squares must be optimised together with the
  response, and that subtracting them at the unpenalised response is not a bound (13.4, item 50): `ch17`, section
  "A convex dual retaining the first-chaos penalty and cubic consistency", and
  `OCT/weak-k-2026-10-15/RETAINED_H_SQUARE.md` §2. The comparison of the sector gain of Λ_P with the deficit, as a
  target: `ch22`, equation (rescub9), Λ_P(q + H) − Λ(q) ≤ C − 𝒬(v, x) + 78·10⁻⁶ with H the visible sectors and the
  certified moment deficit on the right. The evidence quoted there is the measurement for K ("mixed gain ≤ 0.17·d_q";
  `ch13`: "at most 16 % of the q-only deficit" on the junta family). That is the quantity of the K column of 11.15
  and 11.16, measured in October on another family; the K column is therefore not new.
- *One October test evaluates a retained-penalty dual at optimised sectors and compares it with the measured mixed
  gain.* `RETAINED_H_SQUARE.md` §5, summarised in `ch25-parts/10-exact-duals-rotation-profiles.tex` ("A weaker row
  target retaining both squares"): for nine Wick-junta-plus-Gaussian residuals the A/B coefficients were optimised
  (the note calls the result the raw mixed gain); then a single joint dual trial, with multipliers for the
  first-chaos square ‖P₁,₀k‖² and for the second dropped square ε‖P₂,₁h + B/ε‖², taken from a clipped Gram solve with
  τ = 0.01, was evaluated at that G. Its reduction exceeded the A/B gain at all nine points (example at σ = 0.20,
  junta weight 1: gain 0.0016455, joint reduction 0.0029193; the second square alone, 0.0009870, does not). Sobol
  sampling, floating point, "not a certificate"; the probe scripts are not in the working folders. It differs from
  (c) in three ways: the sectors were optimised first and the dual evaluated afterwards at that fixed G, so it is a
  value at the K-optimal sectors and not the supremum over the sectors of the penalised functional; the dual
  contains the second square as well; and the comparison is with the mixed gain, not with the deficit. The two do
  not conflict: in (c) the supremum of the retained functional over the sector is attained at about half the
  K-optimal amplitude (on the monomial at u = 0.0463: 0.0326 against 0.0591, `retained_content.log`), and the
  October test evaluates at the K-optimal one.
- *Also in the record, and different:* the Schur complement (J₁ − J₀)²/(1 + J₀) of the first-chaos penalty in the
  response-side coercivity constant K_A of `ch25-parts/50-weighted-complement.tex` ("Why the first-chaos penalty
  matters"); the regional row cap of `ch36`, obtained by "completing the first-chaos penalty and visible-energy cost
  against the same joint support budget"; and the fixed-sector measurements of 13.4 (items 50 and 51).
- *Not found in the record:* a value, on any tensor, of the supremum over the sector amplitudes of the retained
  functional (the saddle of 11.15 and 11.16); its ratio to the deficit D(q); the sign structure behind the
  cancellation (11.14); a tilt other than the cost-optimal one (11.14, 11.19). "Not found" means: not in the
  manuscript chapters copied here, the digest, the log, the October handoff material, the weak-K package, or the
  folder `kattack-2026-10-15` (`kprime.py`, `kprime.log`). The other review folders of October (`INVENTORY.md`,
  section 5) were searched by keyword only.

**(d) Independent follow-up audit (codex-a7c4).** A15 `SECTORS.md`:

| # | result | scope and status |
|---|---|---|
| 11.21 | Independent direct-norm quadrature reproduces all four energies of 11.15. At u=0.0463 the gain/D values are 0.16044543 (K,A), 0.16533698 (K,A+B), 0.01698219 (retained,A), 0.01829395 (retained,A+B) | **N**, real monomial amplitudes; stationary candidates, not certified suprema. Three quadrature resolutions, analytic gradients, no imports from the historical evaluator; `sector_numerics.py` and `sector_numerics.json` |
| 11.22 | The local retained A/B matrix 11.4 holds as a Hermitian form for arbitrary complex remote linear forms in any finite dimension. Its smallest eigenvalue is in (0.47779261268182,0.47779261268183) | **P, independently re-derived within this audit session**, not externally reviewed; exact scalar bounds **C**, `sector_constants.py`. Local at G=0 only. The optimal A tilt is in (0.34339840980385,0.34339840980386); k(s)>0 exactly between its two roots, approximately −0.15612661 and 0.84292343 |
| 11.23 | If Λ(q)≤S+η_R and gain(q)≤κD(q)+η_A with 0≤κ≤1, then Λ̂(q+sectors)≤S+(1−κ)η_R+η_A | **P, by author, not externally reviewed**, exact algebra in A15 `SECTORS.md`. Valid even if D(q)<0; retains the Gaussian optimization slack. The gain hypothesis is still open; this is a conditional assembly lemma, not a sector theorem. Variant (claude-b9ee, review): for the fixed-tilt gain of 11.19, which is nonnegative, for κ>0 the signed hypothesis forces D ≥ −η_A/κ; with gain ≤ κ·max(D, 0) + η_A instead, the form in which the target was sent to the prover, with η_R≥0 the conclusion is S + η_R + η_A (independently re-derived in A15R `SECTORS.md` §7) |
| 11.24 | For s∈[0,1], R>0, Gaussian linear r with w=E\|r\|²>0 and any remote q (the tail is zero if w=0), the tilted norm remainder on \|r\|>R is at most 4[−s+2exp(s−1)]exp(−R²/w)[R+w/(2R)] | **P, by author, not externally reviewed**, A15 `SECTORS.md` §6; exact scalar check **C** at s=.7,R=.3,w≤.0036 gives <1.4·10⁻¹¹. At w=.0113 this allowance is about 3.46·10⁻⁴ (**N**). A compact Hessian bound and an admissible amplitude bound are still needed. *15 November:* for the tilted A-sector at s = 3/5 neither is needed any more, nor this allowance (11.40) |

**(e) The report on the tilted sector (codex-6e2b, six versions in one night), and its four reviews.** TILT is the
latest version of the report, the sixth (`sources/received-2026-11-15-tilted-sector/REPORT.md`, dated 15 November
06:06, with its notes, the notes of the earlier versions that it still uses and its result files beside it). TILT-5 is
the fifth version (05:17), which its author kept beside the sixth as `REPORT_secant_history.md`; TILT-4 is the fourth
(04:40), kept as `REPORT_localization_history.md`; and TILT-1 the first (03:23; `first-version/REPORT.md` in the same
folder). TILT-REV is the review of the first version by claude-b9ee (03:31, with an erratum of 04:40; `REVIEW.md` in
the same folder), TILT-REV2 the review of the second version by the same reviewer (04:40, with an addendum of the same
evening; `REVIEW_2.md`), TILT-REV3 the review of the fifth (05:29; `REVIEW_3.md`) and TILT-REV4 the review of the
sixth (06:38; `REVIEW_4.md`). The verifiers, their inputs and the scripts and logs of the reviews are in
`code/tilted-sector-2026-11-15/` (those of TILT-REV4 in `review4/`). The report answers a request to prove the sector
inequality that 11.19 (i) states as a target. **The first five versions do not prove it on the range that matters, and
say so; the fifth reduces it to one inequality (11.43), and the sixth proves that inequality (11.50) and with it the
lemma (11.51).** The report claims no bound on the Grothendieck constant. Peak row; the tilt is fixed at s = 3/5;
every statement is dimension-free except those marked N.

Setting (TILT §1, TILT-5 §1, TILT-4 §1). A = T − 2/5 is the direction T − 1 + s at s = 3/5, and P = p − 9/25 =
0.962052. For a remote cubic q of energy u = ‖q‖² and a remote linear form r, with σ = ‖r‖,

    𝒥(q, r) = 2E|L + q + (T − 2/5)·r| − P‖r‖² − F(q),        D₊(q) = max{B(u) − F(q), 0},

with F and B as in README, part (a). By 11.12, Λ̂(q + (T − 1)r) − Λ(q) ≤ 𝒥(q, r): the supremum of 𝒥(q, r) over r is
the gain of 11.19 (i) at the tilt 0.6, and D₊ is the deficit D(q) of part (c) cut off at zero (the report does not
assume D ≥ 0). c_s(q) = Π₁[q·h_s(|q|²)] is the tilted content of 11.13, and δ = E|q|⁴ − 2u². **The lemma (\*):** there
are κ < 1 and a small η such that 𝒥(q, r) ≤ κ·D₊(q) + η for every dimension, every remote cubic q with u ≤ 0.0463 and
every remote linear form r. This is the hypothesis of the variant of 11.23: with a remote cap Λ(q) ≤ S + η_R it gives
Λ̂(q + A-sector) ≤ S + η_R + η. The prompt that asked for (\*) was not kept in a file; this is (\*) as the report uses
it, and the versions it reaches have η ≤ 2·10⁻⁵.

The versions, and what was checked. The first version (03:23) proved 11.25, 11.26, 11.29, 11.31 and 11.32, drew the
small-energy corollary 11.28 (i) from them, and left three statements open: the curvature inequality 11.33, the
localisation 11.35 and the content comparison 11.36. TILT-REV reviewed that version: the reviewer re-derived the
global bound and its corollaries, the general structural bound, the remainder inequality and the arithmetic of the
assembly; read the exact verifier and replayed it in an isolated copy (it passes, with the output that is now
`preliminary_results.txt`); and ran floating-point checks written for the review (`check_tilt_report.log`). When this
record was updated that verifier was read and replayed again, without and with its option `--numerical` (both outputs
identical to `preliminary_results.txt`), and the points that the review's table does not record as re-derived were
checked by the worker who wrote the rows; each row says which.

The report was then revised in place three times, at 04:04, 04:31 and 04:38 (with an addition at 04:40). The second
version claimed the curvature inequality, sharper content bounds, a localisation radius 0.371 and the lemma (\*) for u
≤ 0.001123. TILT-REV2 reviewed that version in its state of 04:05. The reviewer replayed its whole verifier in an
isolated copy, with another python-flint and another compilation of the C++ checker (pass, same hashes); re-derived
the sharpened global bound, the Stein budget, the radial Hessian norm, the shifted resolvent and the bound of the
content by sup N_Φ, the reduction formula of the curvature note and its exterior region, and the theorem for u ≤
0.001123; checked the logic of the matrix envelopes; and tested the two certified suprema by independent numerics. The
interval code of the C++ checker was compiled and replayed but not audited line by line. TILT-REV2 also corrects
TILT-REV (section 14, item 42) and has two numerical findings of its own (11.37, 11.38).

The third version (04:31) also claimed the localisation 11.35 and left one statement open, the content comparison
11.36 with the constant 1/5. The fourth (04:38) added a bound of order δ^{3/2} on the content and the lemma for u ≤
0.00173. **TILT-4 is the fourth version**, as its author left it at 04:40 (in the fifth version its file is named
`REPORT_localization_history.md`; the copy is byte-identical to the copy of `REPORT.md` taken at 04:40). The reports
and results files of the second and third versions are not in the repository, because each was overwritten by the
next; the verifier of the second version is here (`code/tilted-sector-2026-11-15/second-version/verify.py`), and the
notes and checkers that TILT-REV2 covers are here unchanged (same file dates and, for the checkers, same hashes as in
the reviewer's replay copy). The later versions keep the reviewed statements and their proofs: in TILT-4 the sections
on the circular mean, the structural bound and the remainder (2.2, 3.1, 3.2, 4.1) are word for word those of the
first version; the sections on the zero-content class and the existence of maximisers (3.4, 4.2) differ only in their
closing remarks; section 2.3 keeps the proof of 11.26 and calls the bound preliminary; and section 3.3.1 is the former
3.3 with its derivation unchanged (compared when this record was updated). **What only the third and fourth versions
have is R here**: no review of those two versions exists, and TILT-REV3 re-derived only sections 1 and 2 of one of
their notes (11.30).

The fifth version (05:17) answers TILT-REV2 §6, which had proposed the global remainder bound 11.37. It proves that
bound (11.39), and with it 𝒥(q, r) ≤ ‖c_{3/5}(q)‖²/k for every r (11.40); it halves the content coefficient on the
central energies (11.41); it lists the classes on which (\*) now holds (11.42); and it reduces the lemma to one
inequality, the content against the deficit with the constant 3/10 (11.43). Localisation (11.35) and the tail of 11.32
are not used any more: its author removed them from the active proof and from the default replay. TILT-REV3 reviewed
the version in its state of about 05:10 and replayed its verifier as left at 05:17; the copies here are of 05:17 and
have the hashes that close its `results.txt`. The reviewer re-derived the four regions of the remainder bound, its
interpolation error and every rational comparison, the content proof (the phase identity, the kernel of the resolvent,
the angular bound 11/72 and the comparison argument), sections 1 and 2 of `content_tensor_next.md` and the arithmetic
of the assembly; replayed the whole verifier in an isolated copy, started after the author's own replay had ended,
with the reviewer's own installation of python-flint 0.9.0 and own compilation of the C++ checkers (pass in 12
minutes; the 14 source hashes and the counts of every cover identical to the author's run); and tested the constants
of the content proof by independent numerics. The interval code was compiled and run, not audited line by line. Not
read by the reviewer, and **R** here: `content_next_proof.md` (the bound 1/50) and the scalar part of
`content_tensor_next.md`. The fifth version also comes with an audit from its author's side (`secant_audit_math.md`,
`secant_audit_results.md`), which read the C++ checker in full; it is not independent of the report. Rows 11.25 to
11.38 describe the first four versions, with a dated sentence where the fifth changes their role; 11.39 to 11.44 are
the fifth version and its review, and 11.45 is the numerics of claude-b9ee on the same remainder for the other
sectors. *Sixth version:* the report, results and verifier of the fifth version are now `REPORT_secant_history.md`,
`results_secant_history.txt` and `verify_secant_history.py` (byte-identical to the copies made at 05:17), and the
closing remarks of `secant_proof.md` and `secant_assembly.md` were revised at 06:02.

The sixth version (06:06) proves 11.43, the one statement that the fifth left open: ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) +
6·10⁻⁶ for every remote cubic with u ≤ 0.0463 (11.50), with ten energy-dependent content coefficients (11.49) and a
cover of 178 rectangles in (u, χ) by moment caps and Stein duals; with 11.40 this completes the lemma (\*) (11.51).
TILT-REV4 (claude-b9ee with a reviewer agent of the same session) reviewed the folder in its state of 06:07. It
replayed the whole verifier in an isolated copy with the reviewer's own python-flint and compilation: the secant part
passes again with the same counts; the deficit part reads the October Stein package through a fixed path into the
repository, fails in any other layout, and passes as `verify.py --deficit-only` in a copy with that layout, in 99 s.
It re-derived the moment and Stein arguments, the energy interpolation (also checked by claude-b9ee), the ten
coefficients and the uniform bound C ≤ 1/50 (so 1/50 is now **P + C**, 11.52), and tested the certificate on about
1,600 actual cubics (**N**). Its findings are 11.52. As before, the interval code was compiled and run, not audited
line by line, and the author's own audit (`deficit_audit_results.md`, `deficit_audit_notes.md`) is from its side.
Rows 11.49 to 11.52 are the sixth version and its review; 11.47 and 11.48, between 11.46 and them, belong to the fifth
audit (A15V).

| # | statement | scope and method | status | where |
|---|---|---|---|---|
| 11.25 | **Circular mean.** For t ≥ 0: C(t) := E_θ\|1 + t·e^{iθ}\| ≤ 1 + (3/10)·t², θ uniform on the circle | Proof: for t ≤ 1 the series C(t) = Σ_k binom(1/2, k)²·t^{2k} has nonnegative coefficients and C(1) = 4/π; for t ≥ 1 the identity C(t) = t·C(1/t) reduces the claim to Q(x) = (3/10)x⁵ + (1/2)x⁴ − (1/4)x² + 41/1570 > 0 for x = t − 1 ≥ 0, which is clear for x ≥ 1 and is certified on [0, 1] by positive Bernstein coefficients on 32 subintervals (the smallest is 0.0013667). **The record has a sharper form**, 1 + (59767/200000)·t², with 0.298834 < sup_t (C(t) − 1)/t² ≤ 0.298835 (`lower-bound/sharp-circular.tex`, theorem "Global circular-mean majorant"; it is behind 6.1.1 and **R** there) | **P + C** by codex-6e2b; the certificate was read and replayed by claude-b9ee (TILT-REV). **N** (TILT-REV): on a scan of t ∈ [0, 200] the supremum of (C(t) − 1)/t² is 0.298834, at t = 1.4525, so 3/10 is nearly the best constant. This is the October enclosure again, whose lower bound is taken at the same point 581/400. The reduction to Q was re-derived when this record was updated | TILT-4 §2.2 (the same in TILT-1); verifier check C1; TILT-REV; `check_tilt_report.log` |
| 11.26 | **Global bound for the tilted sector.** 𝒥(q, r) ≤ (1074/625)·u − (859/2500)·‖r‖² for every dimension, every remote cubic q, every remote linear form r and every energy u ≥ 0 | The proof uses only that q and r are square-integrable, independent of z₁ and orthogonal (E[q̄r] = 0): no fourth moment and no chaos structure. Average the phase of z₁ with 11.25: 2E\|L + q + Ar\| ≤ F(0) + (3/5)·E[\|q + Ar\|²/\|L\|] = F(0) + (3/5)I₀·u + (3/5)J_s·‖r‖², where the cross term vanishes by orthogonality; and F(q) ≥ F(0) by Jensen in the same phase. Here I_k = E[T^k/\|L\|], in closed form through erfc, and J_s = I₂ − (4/5)I₁ + (4/25)I₀. Enclosures in exact rational arithmetic: (3/5)I₀ ∈ [1.718368549549717, 1.718368549549718], below 1074/625, and P − (3/5)J_s ∈ [0.343638104570935, 0.343638104570936], above 859/2500. It is the tilted form of the orthogonality-only bound 6.1.1 (relation to the record, below). The later versions call it preliminary and sharpen it on u ≤ 0.0463 (11.27) | **P + C**: re-derived by claude-b9ee (TILT-REV), who also recomputed both constants by quadrature (1.718368550 and 0.343638105) and found no violation on the Wick monomial, on a grid of energies from 10⁻⁵ to 1 and real amplitudes up to 1.5 (**N**) | TILT-1 §§2.1, 2.3; TILT-4 §2.3; verifier checks C2, C3; TILT-REV; `check_tilt_report.log` |
| 11.27 | **Sharpened global bound and elementary localisation radius** (second version). For u ≤ 0.0463: 𝒥(q, r) ≤ (1273/1250)·u − (859/2500)·‖r‖². So every r with 𝒥(q, r) ≥ 0, in particular every maximiser, has ‖r‖² ≤ (2546/859)·u, and ‖r‖ < 0.371 at u = 0.0463. The first version had ‖r‖² ≤ (4296/859)·u, that is ‖r‖ ≤ 0.4812, from 11.26 | The proof of 11.26 drops F(q) − F(0) ≥ 0. Here it is kept: C(t) ≥ √(4 + t²) − 1 gives F(q) − F(0) ≥ E[V·g(V)] with V = \|q\|² and g(v) = 2/(√(4\|L\|² + v) + 2\|L\|), decreasing and convex in v; Jensen under the size-biased law of V and the cap E\|q\|⁴ ≤ 44u² give F(q) − F(0) ≥ u·c(u), with c decreasing and c(463/10000) > 0.702292508353541 > 7/10 by an exact integer checker (a lower Riemann sum on 8192 intervals). The cap is a Lean theorem of this repository for circular cubic chaos (`Circular.fourth_moment_le_variance` and `Circular.gaussian_fourth_moment_le_44` in `Grothe/LowerAnalytic/CircularFourth.lean`; source read, no build run). **Far from the radius 17/200 = 0.085 that the assembly needs**; the third and fourth versions reach that radius by another argument (11.35) | First version (radius 0.4812): **P + C**, arithmetic from 11.26, checked by claude-b9ee (TILT-REV). Sharpened bound and radius 0.371: **P + C** (TILT-REV2: re-derived, with the cap identified as the Lean theorem `Circular.fourth_moment_le_variance`; the checker of the constant replayed). Re-derived again when this record was updated, with c(0.0463) = 0.7036 in floating point (**N**; `code/record-checks-2026-11-15/localisation_check.py`). It answers a remark of TILT-REV (section 14, item 41) *Fifth version (15 November, 05:17):* the radius is not needed any more; 11.40 holds for every r. | TILT-4 §§2.1, 2.3, 2.4; `localization_notes.md`; `localization_verify.py`; TILT-REV2 §2; TILT-1 §2.4 |
| 11.28 | **The lemma (\*) at small energies.** (i) First version: (\*) holds with s = 3/5, κ = 0 and η = 1/50000 = 2·10⁻⁵ for 0 ≤ u ≤ 1/85920 ≈ 1.16·10⁻⁵, because (1074/625)/85920 = 1/50000. (ii) Later versions: the same κ and η for 0 ≤ u ≤ 1123/10⁶ = 0.001123 (second and third), and for 0 ≤ u ≤ 173/100000 = 0.00173 (fourth) | (i) **is the trivial regime**: with κ = 0 it says only that the gain is below η when the energy is tiny, and the range needed is u ≤ 0.0463, about 4000 times larger. (ii) is still 41 times (0.001123) and 27 times (0.00173) below that range. The proof for 0.001123: if 𝒥(q, r) ≥ 0 then ‖r‖² ≤ (2546/859)u < 1/300 by 11.27; δ ≤ 42u² and 11.30 give ‖c_{3/5}(q)‖² ≤ (84/25)u²; then the remainder 11.32 with R = 3/10 and Θ = 3/4, which needs the curvature inequality 11.33, gives 𝒥 ≤ (840/53)u² plus a tail below 2·10⁻¹². It uses neither 11.35 nor 11.36. The proof for 0.00173 uses ‖c‖² ≤ 3·δ^{3/2} from 11.30 and the localisation claimed in 11.35: 𝒥 ≤ (250/53)·3·(42u²)^{3/2} plus a tail below 2⁻³⁰ | (i) **P + C** (arithmetic from 11.26; re-derived by claude-b9ee, TILT-REV). (ii) For 0.001123: **P + C** (TILT-REV2: re-derived from 11.27, 11.30, 11.32 and 11.33; note the caveat of 11.33). For 0.00173: **R** (fourth version; it rests on the bound 3·δ^{3/2} of 11.30 and on the localisation claimed in 11.35, which are R) *Fifth version (15 November, 05:17):* the route of 11.40 reaches u ≤ 0.00196979 with the partly unreviewed bound 3·δ^{3/2}, and u ≤ 0.00136 from reviewed inputs alone (11.42). | TILT-1 §2.1; TILT-4 §§2.1, 2.5, 2.6; TILT-REV2 §2; verifier checks C3, C6, C7, C10 |
| 11.29 | **Structural bound on the content.** For every dimension and energy, every remote cubic q and every real profile h for which Φ(x) = x·h(\|x\|²) and its first two derivatives grow at most polynomially: ‖Π₁[q·h(\|q\|²)]‖² ≤ (3/4)·δ·E m_h(\|q\|²), where δ = E\|q\|⁴ − 2u² ≥ 0 and m_h(v) = 4v[(3h′(v) + 2v·h″(v))² + 3h′(v)²] is the squared Frobenius norm of the Hessian of Φ. **Explicit form for the tilted profile:** ‖c_{3/5}(q)‖² ≤ 848·δ. So 11.36 holds on the class δ ≤ 3/848000000 | Proof, with q = Q₁ + iQ₂ and Γ_ab = ∇Q_a·∇Q_b: (1) Var\|∇V\|² ≤ 2(EV⁴ − 3(EV²)²) for V in the real third chaos; (2) the law of q is circular, so every real projection of q has fourth cumulant 3δ/8, and Σ_ab Var Γ_ab ≤ 3δ; (3) E Σ_ab \|∇Γ_ab\|² ≤ 12δ; (4) two Gaussian integrations by parts give E[G_i·Φ_ℓ(Q)] = ¼·E Σ_ab Φ_{ℓ,ab}(Q)·∂_iΓ_ab, then Cauchy–Schwarz; (5) q·h(\|q\|²) has charge one, so its real first-chaos projection has the norm of its projection on H₁,₀. Explicit constant: the Hessian of Φ_{3/5} is the convolution of D ph with the gradient of the density f of L weighted by T − 2/5; ‖∇f‖_∞ ≤ 2K/(πa³) and ‖∇f‖₁ ≤ √π·H/a with K = 3747/2330 and H = 6775/1398, and a layer-cake bound, give sup m_h ≤ (4/3)·6√π·K·H/a⁴ < (4/3)·848 = 1130.7. The class δ ≤ 3/848000000 is tiny: for the Wick monomial, where δ = 42u², it means u ≤ 9·10⁻⁶. The constant is very loose: the supremum of m_h is 1.35 (**N**). The later versions call 848 preliminary and replace it (11.30). **Too weak at the energies that matter: see the table below** | General bound: **P**, re-derived step by step by claude-b9ee (TILT-REV: the variance of the carré du champ, the cumulant 3δ/8, the factor ¼, the Hessian norm, the passage from the real to the complex first chaos). Explicit constant: **P + C** by codex-6e2b; TILT-REV replayed the constant, and the derivation was re-derived when this record was updated. The numerical supremum of m_h that TILT-REV prints, 244, is an artefact (section 14, item 42) | TILT-4 §§3.1, 3.2, 3.3.1 (TILT-1 §§3.1 to 3.3); verifier check C5; TILT-REV; `code/record-checks-2026-11-15/tilted_content_check.py` |
| 11.30 | **Sharper content bounds** (later versions). For every dimension and energy: ‖c_{3/5}(q)‖² ≤ min{(2/25)·δ, (19321/10⁶)·u} (second version) and ‖c_{3/5}(q)‖² ≤ 3·δ^{3/2} (fourth); for u ≤ 0.0463 also ‖c_{3/5}(q)‖ ≤ 1/50 (third). So the content comparison in its later form (11.36, with D₊/5) holds on the classes δ ≤ 1/10000 and D₊(q) ≥ 397/200000 = 0.001985, and with D₊/10 on δ ≤ 1/10000 and D₊(q) ≥ 397/100000 | First term: a sharper form of the budget of 11.29 (a "trace-sensitive Stein budget") and a Gaussian resolvent with shift 1/3 give ‖c‖² ≤ (6/25)·δ·sup_R N_Φ(R), where N_Φ is a norm of the Hessian of Φ_{3/5} at radius R, and sup N_Φ < 1/3 is certified with Arb on 111 intervals covering [0, 4], with an analytic bound for R ≥ 4. Second term: −1/40 < h_{3/5}(v) < 253/1000 for all v ≥ 0 (Arb, 158 intervals on [1/25, 3], analytic outside), then Π₁q = 0 and the contraction of the projection, with the profile centred at 57/500. The second term uses the law of \|q\|² only and has the limitation of 11.18: it does not vanish for a Gaussian law. Third bound: for a unit first-chaos probe ℓ, subtract k·q with k = 49/500 (allowed because E[conj(ℓ)·q] = 0) and maximise pointwise against a quadratic penalty with λ = 13/50; this uses only that \|ℓ\|² is exponential, and an Arb checker gives 0.0198 < 1/50. It does not compare the content with the deficit either. Fourth bound: for F in the real third chaos with fourth cumulant κ₄, an odd response m and a unit linear probe H, \|E[H·m(F)]\|² ≤ (‖m‴‖²_∞/16)·κ₄^{3/2}; applied to Re q, with κ₄ = 3δ/8 and sup \|m‴\| < 13 certified with Arb for m(x) = E_{z₁}[(T − 2/5)·sign(Re L + x)]. This is the counterpart, for the tilted profile, of the bounds 6.3.11 and 6.3.12 of the record, and the report says that its leading tensor estimate is that of 6.3.12. Numerically sup N_Φ = 0.2957, at R = 0.23 (**N**), so the certified 1/3 is close | The two bounds of the second version, (2/25)·δ and (19321/10⁶)·u: **P + C** (TILT-REV2: the Stein budget, the radial Hessian norm, the shifted resolvent and the bound by sup N_Φ re-derived; the two Arb certificates replayed by the reviewer and tested by independent numerics, **N**: sup N_Φ = 0.2957 at R = 0.232, and h_{3/5} between −0.024 and 0.2519). The bounds 1/50 and 3·δ^{3/2} of the third and fourth versions: **R**. **N** when this record was updated: sup N_Φ again and the values on the Wick monomial in the table below (`tilted_content_check.py`) *Fifth version (15 November, 05:17):* TILT-REV3 re-derived sections 1 and 2 of `content_tensor_next.md` (E[Y·m′(F)] = E[Y(Γ − 3σ²)ψ″(F)], ‖ψ″‖ ≤ M₃/4, κ ≥ 1296r²): **P** for those. The passage to the complex cubic and the constant M₃ (sup\|m‴\| < 13) stay **R**, and so does the bound 1/50, whose note TILT-REV3 did not read; the fifth version recomputes that bound from the radial table of 11.39 (0.0198306 < 1/50), and both checkers passed in the replay of TILT-REV3. On the central energies the coefficient 2/25 is halved (11.41). *Sixth version (15 November, 06:06):* the bound 1/50 is **P + C** now: TILT-REV4 re-derived it (pointwise Fenchel–Young and Π₁q = 0) and its certificate runs inside the replayed verifier (11.52). The passage to the complex cubic and the constant M₃ of 3·δ^{3/2} stay **R**; 11.50 does not need that branch (11.52). The coefficients 2/25 and γ are improved energy by energy in 11.49. | TILT-4 §3.3; `content_profile_proof.md`, `content_next_proof.md`, `content_tensor_next.md`, `content_next_m3_proof.md`; `content_profile.py`, `profile_range.py`, `content_next_bound.py`, `content_next_m3.py` with their result files; TILT-REV2 §2; `check_tilt_report_2_part2.log` |
| 11.31 | **A class with zero content.** If the remote coordinates split into two independent blocks X and Y and q = Σ a_{ij,k}·X_i·X_j·conj(Y_k), with any complex coefficients and any block sizes, then Π₁[F(q)] = 0 for every function F of q. In particular c_s(q) = 0 at every energy and every tilt (at tilt 0 its norm is the A-content C(q) of README, part (a)) | Proof: the measure-preserving map (X, Y) ↦ (e^{it}X, e^{2it}Y) fixes q, and every linear coordinate has a nonzero character under it. First variation only: zero content does not exclude a gain of the sector at finite amplitude, as the report says. The record has the case q ∝ X²Ȳ, found by Monte Carlo in October (13.1, item 8) | **P** by codex-6e2b; the argument was checked by claude-b9ee (TILT-REV: "the torus argument is right") | TILT-4 §3.4 (TILT-1 §3.4: the same argument); TILT-REV |
| 11.32 | **Conditional remainder with a Gaussian tail.** Let f(w, ρ) = E_{z₁}\|L + w + (T − 2/5)ρ\| and M = E\|T − 2/5\| = 2e^{−2/5} − 3/5 = 0.74064. If for some R > 0 and 0 ≤ Θ < P the real Hessian in ρ satisfies D²_ρ f(w, ρ)[v, v] ≤ Θ for all w ∈ ℂ, all \|ρ\| ≤ R and all unit v, then for all remote q and r, with C = ‖c_{3/5}(q)‖ and σ = ‖r‖ > 0: 𝒥(q, r) ≤ 2Cσ − (P − Θ)σ² + 4M·(R + σ²/(2R))·e^{−R²/σ²}. Also: for a fixed q in finitely many variables the supremum of 𝒥(q, r) over r is attained, because 𝒥(q, r) ≤ √π·Mσ − Pσ² | Any sharing between q and r. Proof: Taylor's formula with the Hessian bound where \|r(y)\| ≤ R; elsewhere f is M-Lipschitz in ρ, which costs 4M\|r\|; and \|r\|²/σ² is exponential, so E[\|r\|·1{\|r\| > R}] ≤ (R + σ²/(2R))·e^{−R²/σ²}. The tail bound increases with σ. This is the finite-amplitude step that 11.17 asked for: the restricted second derivative Θ(R) of 11.17 is the hypothesis, and the tail term is the price of the base points with \|ρ\| > R. The tail is the allowance of 11.24 at s = 3/5, found independently by the audit A15 | **P**: the inequality was re-derived by claude-b9ee, "including the tail integral and M" (TILT-REV). The existence of a maximiser is **P** by codex-6e2b; it is not in the review's table and was checked when this record was updated (two lines) *Fifth version (15 November, 05:17):* an input of the routes of 11.34 only; 11.40 needs neither its Hessian hypothesis nor its tail. The theorem stands. | TILT-4 §§4.1, 4.2 (TILT-1 §§4.1, 4.2: the same arguments); TILT-REV |
| 11.33 | **The curvature inequality** (O-A1 of the first version, (15) in every version): D²_ρ E_{z₁}\|L + w + (T − 2/5)ρ\|[v, v] ≤ 3/4 for all w ∈ ℂ, \|ρ\| ≤ 3/10, \|v\| = 1. That is the hypothesis of 11.32 with R = 3/10 and Θ = 3/4 | First version: open. TILT-REV: after a rotation it has three real parameters, and interval arithmetic can certify it. Later versions: proved, by their own account. A monotone cubic change of variable removes the singularity of the Hessian; pairing the two signs of a projection and splitting at Re w = 137/200 gives two positive semidefinite matrix envelopes; a checker in C++ with directed interval arithmetic certifies 256 triples of scalar bounds on 6,168 rectangles and then the two matrix inequalities, and an analytic estimate covers \|w\| ≥ 23/4. The candidate bounds that the checker accepts were generated in floating point. Numerical evidence: the grid value of the supremum is 0.7086 (11.17; `tilt_restricted_67.log`), against 0.5153 at w = ρ = 0; the report's own floating-point diagnostic prints 0.7094 at ρ = 0.3, w = 0.6402, so the grid value is not the supremum. Both are below 3/4 | **open** in the first version. Proof of the second version: **P + C** (TILT-REV2), with a caveat. Re-derived: the reduction formula and the exterior region, with every constant. Read and checked for logic: the pairing of the two signs, the two matrix envelopes and the angular bins. The checker was compiled and replayed by the reviewer (pass; the certified matrices have largest eigenvalue about 0.745), but **its interval code was not audited line by line**. The values 0.7086 and 0.7094 are **N**; the second is from one run of `audit_curvature.py` made when this record was updated *Fifth version (15 November, 05:17):* as a statement, an input of the routes of 11.34 only. Its certificate is still used: one of the scalar targets it accepts (row 161 of `theta_candidates.txt`) gives 11.39 for ρ ≤ 33/200, and TILT-REV3 replayed it again (`replay_version5.log`). The statement stays **P + C**, with the same caveat. | TILT-4 §4.3; `theta_proof.md`; `theta_verify.cpp` with `theta_candidates.txt`, `theta_results.txt`; TILT-REV2 §2; TILT-1 §§5, 5.2, 6; TILT-REV |
| 11.34 | **Conditional assembly.** First version: if 11.33, 11.35 and 11.36 (with D₊/10) hold, then the lemma (\*) holds for all 0 ≤ u ≤ 0.0463 with s = 3/5, κ = 1/2 and η = 19·10⁻⁶. Third and fourth versions: if 11.36 with D₊/5 holds, then (\*) holds with κ = 50/53 and η = 18·10⁻⁶, given their proofs of 11.33 and 11.35. A third route needs neither 11.33 nor 11.35: the global bound 11.37 | 11.32 with R = 3/10 and Θ = 3/4, at the maximiser of 11.35: P − 3/4 = 0.21205 > 1/5 and the tail is below 4·10⁻⁶ for σ ≤ 17/200, so 𝒥 ≤ 5C² + 4·10⁻⁶; then 11.36. No positivity of D is used. The tail bound is steep in the radius: 3.6·10⁻⁶ at σ = 0.085, 1.4·10⁻⁵ at 0.09, 1.16·10⁻⁴ at 0.10, so the localisation has to be proved at this scale. The later form uses P − 3/4 > 53/250 and the tail 3.2·10⁻⁶ at the radius of 11.35: 𝒥 ≤ (250/53)C² + 3.2·10⁻⁶. The report does not claim that the hypotheses are necessary. **There is no valid chain "positive local cost and small measured content ratio, hence (\*)"** (TILT-1 §5.2): the local cost k(3/5) = 0.4467 is not a Hessian bound at finite amplitude; a Hessian bound controls only the event \|r(y)\| ≤ R; and a bound on the content is not the comparison 11.36 | First version: **P + C**, conditional; the arithmetic was checked by claude-b9ee (TILT-REV). Later form: **R** (arithmetic of the same kind, not reviewed). Of the hypotheses 11.36 is **open** in every version, 11.33 is **P + C** with the caveat stated there, and 11.35 is **R** *Fifth version (15 November, 05:17):* superseded by 11.40 with 11.43, which use neither 11.33 nor 11.35 nor a tail. The arithmetic of the first version stands. | TILT-1 §§5.1, 5.2; TILT-4 §§5.1, 5.2; verifier checks C4, C8, C9 |
| 11.35 | **Localisation of a maximiser** (O-A2, (16)): for every q of the class (finitely many variables, q ∈ H₂,₁, 0 ≤ ‖q‖² ≤ 463/10000) there is r_* ∈ argmax_r 𝒥(q, r) with ‖r_*‖ ≤ 17/200 | Open in the first and second versions, whose radii at u = 0.0463 are 0.4812 and 0.371 (11.27). TILT-REV2, on the second version: the radius 0.085 cannot be reached from its inequalities (at u = 0.0463 they leave the whole range 0.085 ≤ σ ≤ 0.370 open, because of the tail term of 11.32, and a larger R does not help), and it is not needed if 11.37 holds. **The third and fourth versions claim it for the whole class** by an argument that TILT-REV2 did not see: every maximiser has ‖r_*‖² ≤ u/(40(P − 4/5)) ≤ 875533/122576000 < (17/200)². Its argument: a scalar inequality β(w, ρ) ≤ (4/5)ρ + (63/400)·Re w + \|w\|²/(40ρ) for β(w, ρ) = Re E_{z₁}[A·ph(L + w + Aρ)], all w ∈ ℂ and ρ > 0, certified by a checker in C++ with directed interval arithmetic (70,373 boxes; largest accepted value 0.7999968 against 4/5); then half the derivative of 𝒥 along every ray r = σX is at most −(P − 4/5)σ + u/(40σ), so the gain decreases beyond that radius. It uses orthogonality and no fourth moment. Its margins are small: the radius is 0.0845 against 0.085, and the largest accepted value is within 3.2·10⁻⁶ of 4/5. Observed at the tilt 3/5 (**N**): 0.0145 and 0.0248 on the Wick monomial at u = 0.02 and 0.0463 (TILT-4 §6), 0.013 and 0.022 at the two-variable tensors found by the searches of 11.19 (i) (`search/tilt_0.6_0200.log`, `search/tilt_0.6_0463.log`). "Needs an argument, not a computation" (TILT-REV). On the Wick monomial at u = 0.0463 the dropped term F(q) − F(0) is 0.0512, which would give the radius 0.29 there (TILT-REV) | **open** in the first version; **R** for the proof of the third and fourth versions (P + C by its author, not reviewed) *Fifth version (15 November, 05:17):* not needed (11.40); its author removed it from the active proof and from the default replay, and its files stay in the folder as history (TILT-5 §5). Its proof remains **R**. | TILT-4 §5.1; `localization_alternative_proof.md`; `localization_majorant.cpp` with `localization_circle.hpp`, `localization_majorant_results.txt`; TILT-REV2 §4; TILT-1 §§5, 5.2, 6; TILT-REV |
| 11.36 | **Content against deficit** (O-B, (17)): ‖Π₁[q·h_{3/5}(\|q\|²)]‖² ≤ (1/10)·D₊(q) + 3/10⁶ for every q of the same class (first version). The third and fourth versions ask only for (1/5)·D₊(q), and accept κ = 50/53 in 11.34 in place of 1/2. **The one statement that every version leaves open** | Proved on the class δ ≤ 3/848000000 (11.29) and on the class of 11.31; in the later versions also on the classes of 11.30. Open for general tensors; for what the certified bounds give on a family of tensors see 11.38. On the Wick monomial content²/D is 0.0117 at u = 0.02 and 0.0114 at u = 0.0463 (**N**: TILT-4 §6; independently TILT-REV, `cs_check.log` of part (c) and `tilted_content_check.py`), so the constant 1/10 is eight to nine times the value there, and 1/5 seventeen times. The ratio was not searched over tensors. "The real problem" (TILT-REV). It is the analogue, for the tilted profile, of the content inequality of layer L4 (6.3.18), where the constants that would serve are 0.10 to 0.24 against a numerical supremum of 0.0876 | **open**. The monomial values are **N** *Fifth version (15 November, 05:17):* replaced by the weaker sufficient statement 11.43, with the constant 3/10. Still **open**. | TILT-4 §§3.3, 5.1, 6 (TILT-1 §§3.3, 5, 6); TILT-REV; `check_tilt_report.log` |
| 11.37 | **A global bound on the remainder, in place of curvature and localisation.** Let Rem(w, ρ) = 2[f(w, ρ) − f(w, 0) − ⟨∇_ρ f(w, 0), ρ⟩] with the f of 11.32. If Rem(w, ρ) ≤ Sec·\|ρ\|² for all complex w and ρ, with Sec < P, then for every remote q and every linear form r, in every dimension, with no hypothesis on ‖r‖, no tail allowance (11.24, 11.32) and no maximiser: 𝒥(q, r) ≤ 2‖c_s(q)‖σ − (P − Sec)σ² ≤ ‖c_s(q)‖²/(P − Sec). **Numerically the supremum of Rem/\|ρ\|² at the tilt 0.6 is 0.600** (at ρ = 0.6, w = 0.6), so P − Sec = 0.362 | The implication is two lines: 𝒥(q, r) = 2Re⟨c_s(q), r⟩ + E Rem(q, r) − P‖r‖². Rem/\|ρ\|² is an average of the Hessian along the segment from 0 to ρ, so the large values of the Hessian near \|ρ\| ≈ 0.49, which make the unrestricted Θ of 11.17 exceed the budget, are integrated. A bound for each value of T does not exist; the average over T has to be kept. Suprema at the other tilts, with P − sup: 1.002 (0.320) at s = 0, 0.607 (0.598) at 0.3434, 0.582 (0.490) at 0.5, 0.681 (0.151) at 0.7. At s = 0, that is for K itself, this would make the local cost 0.320 of the A-sector a global cost, where the record has 0.24 with a cap on the shell energy (6.2.1). Three real parameters after a rotation and a reflection; only 0 < ρ ≤ 5 and \|w\| ≤ 6 matter. The statement to certify, and the next target given to the author of the report: Rem(w, ρ) ≤ (13/20)·\|ρ\|² at s = 3/5 | The implication: **P** (TILT-REV2; elementary, and checked again when this record was updated). The inequality: **open**; the suprema are **N** (a grid of 141 × 71 values of w and 70 of ρ, a second scan to \|w\| = 40 and ρ = 12, five values checked against plain quadrature) *Fifth version (15 November, 05:17):* the inequality is proved with Sec = 13/20 (11.39, **P + C**) and gives 11.40. The suprema at the other tilts stay **N**. | TILT-REV2 §4; `secant_curvature.py`, `secant_curvature.log` |
| 11.38 | **What is left with 11.37: content against deficit, at the edge.** With 11.37 and the two bounds of the second version in 11.30: 𝒥 ≤ B(u, χ) := min{(2/25)χu², (19321/10⁶)u}/(P − Sec), χ = δ/u², so (\*) with κ ≤ 1 holds wherever B(u, χ) ≤ D(q) + η. On the family q = √(u(1 − λ))·G + √(uλ)·y(\|y\|² − 2)/√2, from the Gaussian limit to the Wick monomial, B/D is at most 0.99, reached at u = 0.0463, χ = 5.1, where the two content bounds cross; at the other 55 points computed it is between 0.21 and 0.91 | N: the family only (seven energies from 0.0005 to 0.0463, eight members at each; G is a complex Gaussian independent of y, the diffuse limit of cubics, and χ = 42λ²), with Sec = 0.5997 from the grid of 11.37; other tensors with the same (u, χ) may have a smaller deficit. At χ = 42, the Wick monomial, the values 0.30, 0.51, 0.28, 0.21 at u = 0.0005, 0.005, 0.02, 0.0463 and the deficits agree with the table below, which was computed independently (divide the smaller of its columns (2/25)·δ and (19321/10⁶)·u by 0.3624). The true gain/D is at most 0.026 on everything searched (part (c)), so the loss is in the content bound, a factor 10 to 40. The tilt 0.55 is slightly better for this chain than 0.6 (coefficients 0.194 and 0.0478 in place of 0.196 and 0.0525). TILT-REV2 proposes to prove the comparison inside the remote certificate, as Λ(q) + B(u, χ) ≤ S + η, a statement about (u, χ) and the law of \|q\|² of the kind that the certificate of 3.3 proves for B = 0. In the central rectangle of that certificate, 7/200 ≤ u ≤ 23/500 and χ ≤ 1/25, the added term is at most (2/25)·(1/25)·(23/500)²/(P − Sec) < 1.9·10⁻⁵ | **N** (TILT-REV2), conditional on 11.37, which is open. The arithmetic of the last estimate was checked when this record was updated *Fifth version (15 November, 05:17):* 11.37 is proved (11.39). With the certified constants, k = 59009/189100 = 0.312 in place of the numerical P − Sec = 0.362 and γ·δ on 0.03 ≤ u ≤ 0.0463 (11.41), B/D at u = 0.0463, χ = 5.1 falls from 0.99 to 0.57, and the largest value over the 56 points is 0.83, at u = 0.02, χ = 10.5, below the central energies, where only (2/25)·δ applies (**N**; recomputed from the deficits of `deficit_vs_bound.log` when this record was updated; with the unreviewed bounds 3·δ^{3/2} and 1/2500 added, the largest value is the same and the value at u = 0.0463, χ = 5.1 is 0.52). At these 56 sampled parameter pairs, the certified content bounds combined with numerical deficits give (\*) with κ = 0.83 and ‖c‖²/D ≤ 0.259 < 3/10 (**N**); neither statement is certified on the continuum family. The augmented certificate proposed here is 11.44. | TILT-REV2 §5; `deficit_vs_bound.py`, `deficit_vs_bound.log`; `tilt_choice.py`, `tilt_choice.log` |
| 11.39 | **The global remainder bound** (fifth version; (1) of TILT-5). With f(w, ρ) = E_{z₁}\|L + w + (T − 2/5)ρ\| and Rem(w, ρ) = 2[f(w, ρ) − f(w, 0) − ⟨∇_ρ f(w, 0), ρ⟩] as in 11.37: Rem(w, ρ) ≤ (13/20)·\|ρ\|² for all complex w and ρ. This is the inequality that 11.37 proposed, with the constant proposed there | Rotation and conjugation reduce to ρ ≥ 0 and Im w ≥ 0. Four regions. (a) ρ ≤ 33/200: one of the scalar targets that the certificate of 11.33 accepts (row 161 of `theta_candidates.txt`: the projection function is at most 0.649660 for k ≤ 0.165138 and \|z\| ≤ 23/4), extended analytically to \|z\| ≥ 23/4, bounds the Hessian in ρ by 0.649660; integrate along the segment from 0 to ρ. (b) ρ ≥ 5: Rem ≤ 4Mρ with M = E\|T − 2/5\| = 2e^{−2/5} − 3/5 < 3/4. (c) \|w\| ≥ 6, every ρ: Rem ≤ ρ²·E[A²/\|L + w\|] < (3603551/5604000)·ρ², by a split at T = 4 and a layer-cake bound for the tail. (d) The compact rest, 33/200 ≤ ρ ≤ 5, \|Re w\| ≤ 6, 0 ≤ Im w ≤ 6: f is jointly convex, so it lies below its multilinear interpolation on a box and the folds of the tilted map need no Hessian bound; the other terms give the error (j₀ + ρ_hi)/4·(Δx² + Δy²) + (13/80)·Δρ², from D²_w f(w, 0) ⪯ j₀·I (the density of L is radial and decreasing; j₀ < 179/125) and \|D²β₀\| ≤ 1 (from sup N_Φ < 1/3, 11.30). A checker in C++ with directed rounding accepts 102,104 boxes (204,207 visits, 7,788 of the boxes closed by (b) and (c), depth 27, 154,239 corner values). Its function values are enclosures of the source integral by Jensen and chord bounds of the circular mean on exponential cells, with the tails enclosed; the linear term uses 602 radial values of β₀ regenerated with Arb at each replay, with the interpolation error h²/8. Numerically the supremum is 0.5997 (11.37), and 0.599694963 near ρ = 0.5719, w = 0.6318 by an optimiser of the author (**N**): 13/20 leaves a margin of 0.05 | **P + C** (TILT-REV3): the four regions, the interpolation error and every rational comparison re-derived (`check_tilt_report_3_rationals.log`); the whole verifier replayed in an isolated copy with the reviewer's own installation of python-flint 0.9.0 and own compilation of the C++ checkers: pass, the 14 source hashes identical to the author's and the cover with the same counts (`replay_version5.log`). The interval code was compiled and run, **not audited line by line**, as for 11.33. The audit in the author's folder (`secant_audit_results.md`, `secant_audit_math.md`), which read the checker in full, comes from the author's side: **R** | TILT-5 §2; `secant_proof.md`; `secant_audit_math.md`, `secant_audit_results.md`; `secant_verify.cpp`, `secant_profile_table.py`, `secant_exact.py`, `verify.py`; `secant_core_results.txt`, `secant_profile_table.txt`, `results.txt`; TILT-REV3 §§2, 3 |
| 11.40 | **The gain of the tilted sector is bounded by its content, at every amplitude** ((3) of TILT-5). For every dimension, every remote cubic q and every remote linear form r, with C = ‖c_{3/5}(q)‖, σ = ‖r‖ and k = P − 13/20 = 59009/189100 = 0.31205: 𝒥(q, r) ≤ 2Cσ − kσ² ≤ C²/k | 11.39 at w = q(y), ρ = r(y), integrated over the remote variables; the linear term is 2Re⟨c_{3/5}(q), r⟩ because the first and the third chaos are orthogonal; then complete the square. It is the implication of 11.37 with Sec = 13/20. No bound on ‖r‖, no maximiser, no Gaussian tail and no localisation; any sharing between q and r | **P** (TILT-REV3; the implication was also re-derived in TILT-REV2), given 11.39 | TILT-5 §2; `secant_proof.md` §6; `secant_assembly.md`; TILT-REV3 §2 |
| 11.41 | **The content on the central energies** (fifth version). For 3/100 ≤ u ≤ 463/10000, every dimension and every χ = δ/u²: ‖c_{3/5}(q)‖² ≤ γ·δ with γ = (11/108)(313/500)² = 1077659/27000000 = 0.03991 < 1/25, half the coefficient 2/25 of 11.30 | The shifted Gaussian resolvent Ψ_u and the trace-sensitive Stein budget of 11.30 give ‖c‖² ≤ (2/3)·δ·sup_R N_{Ψ_u}(R). The phase identity ph(z) = ¼∫e^{iθ}·sign(Re(e^{−iθ}z))dθ writes the Hessian of Ψ_u through one odd scalar function, k_u(x) = ∫₀¹ z^{2/3}·E m″(zx + √((u/2)(1 − z²))·G) dz with m(x) = E[(T − 2/5)·sign(Re L + x)], and an angular inequality (reduced to one change of sign; Bernstein coefficients 15, 12, 19/3, 0, 3) gives sup N_{Ψ_u} ≤ (11/72)·‖k_u‖²_∞. k_u solves (5/3 − (u/2)∂² + x∂)k_u = m″. A rational piecewise cubic barrier on 500 cells of [0, 1], equal to 5/8 beyond 1, satisfies the differential inequality at both ends of the energy interval (its residual is affine in u; smallest margin 1.94·10⁻⁵), with the certified bounds \|m⁗\| ≤ 1000 on [0, 1] (the checker finds 92.11), m″ ≥ −25/24 on x ≥ 0 and m″ ≤ 25/24 on x ≥ 1; a maximum principle on the half-line, with the kink at x = 1 and the lower barrier −5/8, gives \|k_u\| ≤ 313/500. Checker `secant_content_verify.py` (Arb) with the rational witness `secant_content_witness.json`; the floating-point search behind the witness (`secant_content_probe.py`, `secant_content_candidate.json`) is not an input. **N** (TILT-REV3): sup\|k_u\| = 0.6229 at u = 0.03, 0.5915 at 0.0403 and 0.5749 at 0.0463, so 313/500 = 0.626 is nearly sharp at u = 0.03; the true coefficient (2/3)·sup N_{Ψ_u} is 0.0369 to 0.0314; m″ ≥ −0.465 on x ≥ 0 and m″ ≤ 0 on x ≥ 1 | **P + C** (TILT-REV3): the phase identity, the kernel z^{2/3} of the resolvent, the angular bound 11/72 (the one-switch identity checked symbolically) and the comparison argument with its kink and its lower barrier re-derived; the checker replayed with the whole verifier *Sixth version (15 November, 06:06):* improved on 0.03 ≤ u ≤ 0.0463 to 3/80, 71/2000, 17/500 and 13/400, and extended below u = 0.03 (11.49). | TILT-5 §3; `secant_content_proof.md`; `secant_content_verify.py`, `secant_content_witness.json`; `secant_content_results.txt`; TILT-REV3 §2; `check_tilt_report_3.log` |
| 11.42 | **The lemma (\*) on three classes, and wherever the content bound is below the deficit** (fifth version). Let H(u, δ) = min{(2/25)·δ, 3·δ^{3/2}, 1/2500, (19321/10⁶)·u} for u ≤ 0.0463, with γ·δ added to the minimum on 0.03 ≤ u ≤ 0.0463 (11.30, 11.41). By 11.40, (\*) holds wherever H/k ≤ κ·D₊ + η. With η = 2·10⁻⁵: κ = 0 for every cubic with u ≤ 196979/10⁸ = 0.00196979 (by 3·δ^{3/2} and δ ≤ 42u²: 𝒥 ≤ 126√42·u³/k); κ = 0 for every cubic with u ≤ 0.0463 and δ ≤ 2037/12500000 = 0.00016296; κ = 19/20 for every cubic with u ≤ 0.0463 and D ≥ 0.00133 (by 1/2500) | Exact rational endpoints (`secant_exact.py`). The three classes rest on the bounds 3·δ^{3/2} and 1/2500, which are partly or wholly unreviewed (11.30). From reviewed inputs alone (11.40, and (2/25)·δ ≤ (84/25)·u² from 11.30 and δ ≤ 42u²): (\*) with κ = 0 and η = 2·10⁻⁵ for every cubic with u ≤ 0.00136, where (84/25)·u²/k ≤ 2·10⁻⁵ (drawn when this record was updated), against 0.001123 by the route of 11.28 (ii). Still 34 times below 0.0463 | Arithmetic **P** (TILT-REV3 recomputed every endpoint: 126√42·u³/k < 2·10⁻⁵ at u = 0.00196979 (a safe decimal endpoint, not equality); 1.9999·10⁻⁵ at δ = 0.00016296; (1/2500)/k ≤ (19/20)·0.00133 + 2·10⁻⁵). The first two classes: **R** as far as they use 3·δ^{3/2} (its sections 1 and 2 **P**, the rest **R**); the third **R** (1/2500). u ≤ 0.00136: **P + C** *Sixth version (15 November, 06:06):* superseded: the lemma holds on the whole range (11.51). | TILT-5 §4; `secant_assembly.md` §§1, 2; `secant_exact.py`; TILT-REV3 §2; `check_tilt_report_3_rationals.log` |
| 11.43 | **The single remaining statement** ((5) of TILT-5): ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) + 3/500000 for every dimension and every remote cubic q with u ≤ 0.0463. With 11.40 it gives (\*) on the whole range with κ = (3/10)/k = 56730/59009 = 0.9614 and η = (3/500000)/k = 5673/295045000 = 1.92·10⁻⁵. It takes the place of 11.36 (D₊/10 + 3·10⁻⁶ in the first version, D₊/5 in the third and fourth), with a larger constant because the cost in 11.40 is k = 0.312 instead of P − 3/4 = 0.212 | Known on the class δ ≤ (2·10⁻⁶)^{2/3} (by 3·δ^{3/2}), on the class D ≥ 197/150000 (by 1/2500), on the central energies wherever D₊ ≥ (10γ/3)·δ − 2·10⁻⁵ (by 11.41), and on the class of 11.31 (zero content). The remote cap of 3.3 does not give it (13.10, item 76). **N:** on the Wick monomial content²/D is 0.0117 and 0.0114 at u = 0.02 and 0.0463 (11.36), about 26 times below 3/10; at the 56 sampled parameter pairs of 11.38, certified content bounds and numerical deficits give ‖c‖²/D ≤ 0.259; this is not a continuum-family certificate. Not searched over tensors | **open**. The implication: **P** (TILT-REV3) *Sixth version (15 November, 06:06):* **proved**, with the same constant (3/500000 = 6·10⁻⁶): **P + C** by codex-6e2b, re-derived, replayed and tested (**N**) by claude-b9ee in TILT-REV4 (11.49 to 11.52). | TILT-5 §4; `secant_assembly.md` §3; TILT-REV3 §§2, 4 |
| 11.44 | **A route that bypasses the deficit** (TILT-REV3 §4). Since 𝒥 ≤ C²/k ≤ H(u, δ)/k (11.40, 11.42), it is enough to prove Λ(q) + H(u, δ)/k ≤ S + η for every remote cubic q. Then Λ̂(q + tilted A-sector) ≤ S + η directly: the remote cap and the sector bound in one statement, and D does not appear | It is the remote Stein certificate of October (3.3) with one extra term. In that certificate a law with variance v and x = √χ is bounded by c₀ + c₂x² + c₃x³ with c₃ ≥ 0, and only the endpoints in x are checked; with δ = x²v² the terms γ·δ/k and (2/25)·δ/k raise only c₂ and 3·δ^{3/2}/k raises only c₃, so the endpoint argument survives, and each rectangle may use the best term of the minimum. In the central rectangle (x ≤ 1/5, 7/200 ≤ v ≤ 23/500) the extra term is below 1.1·10⁻⁵ (γ·δ/k ≤ 1.083·10⁻⁵, checked when this record was updated). Near it (x up to about 1, v near 0.04) the true slack S − Λ(q) is about 0.3·χu² (`deficit_vs_bound.log`) and the extra term about 0.128·χu² with γ, so the relaxation of the certificate must keep about half of the true deficit. The fifth version names the same route and does not construct it (TILT-5 §4) | The reduction: **P** (two lines). The endpoint-polynomial structure: **P by author**, checked against the October `check_stein.py` and `verify.py` in A15F `REMOTE.md` §6; no augmented dual was constructed there. A15V now completes augmented moment covers for 11.47–11.48, while the fixed-bank limitation is recorded in 13.12. The figures 0.3·χu² and 0.128·χu²: **N**. The full certificate remains **open** *Sixth version (15 November, 06:06):* not needed for the A-sector: 11.43 itself is proved, by moment and Stein certificates in (u, χ) that couple the content bounds with the remote moment constraints (11.50). The fifth audit carried this route out on two classes (11.47–11.48). | TILT-REV3 §4; TILT-5 §4; `secant_assembly.md` §4; `deficit_vs_bound.log` |
| 11.45 | **The same global remainder bound for the other sectors** (claude-b9ee, 15 November). The smallest sampled values of p − Rem/\|r\|² in the searches below, where Rem is the remainder at zero amplitude of the two norm terms of Λ averaged over z₁ (the r_x(α, β) of 7.4.5; with a tilt, p is replaced by the cost form of the retained functional): A and B shells together, K: grid value 0.300, at the origin and infinitesimal amplitude (the smallest eigenvalue of the local matrix is about 0.298; the exact .300 bound is false, 7.4.8); tilt (s_A, s_B) = (0.6, 0): 0.252, at w = 0.25i, infinitesimal, angle parameter .375, meaning about 30.9 % B energy; (0.5, 0): 0.365; (0.3434, 0): 0.467; the B shell alone, K: 0.706, at w = 0.5 and amplitude 1.1 (the record certifies 0.26, 7.1.1); A, B, z₁Q and z̄₁P together, K: 0.128 = k₁, the zero-core cost of Q, at the origin in the pure z₁Q direction. **The one-coordinate cubic d·z₁(T − 2) (ν in KPR) cannot be included pointwise**: with it the margin is −0.387 at w = 0 and infinitesimal amplitude, with about .58 of the perturbation energy in z₁Q and .42 in ν (these are energy fractions, not coefficients), because its cross term with z₁Q is E[√T(T − 2)/(a + bT)]/√2 = −0.608 pointwise; in Λ that cross term is ν̄ times E[Q·φ(\|q\|²)] for a scalar function φ (KPR §12), which vanishes at zero core because E Q = 0, and at a nonzero core it is a genuine interaction | Peak row; floating-point quadrature in (T, θ). A grid over w ∈ [0, 6] and amplitudes in [0.02, 4] for each sector alone; for A and B together a scan over nine shares of B, with amplitudes, phases and base values; for the four sectors 400 random starts with local minimisation (60 with ν), each minimum checked on a finer quadrature. **A search: it can find violations, not exclude them.** One sector has three real parameters, A and B together five. If certified: for K and for the tilted form the gain of the A and B shells is at most (‖c_A‖² + ‖c_B‖²)/m with a feasible m no larger than the local .298364651634118 upper endpoint (K, sharpened in 7.4.9), or a candidate 0.25 (tilt 0.6), at every amplitude and with any sharing, which is the finite-amplitude joint remainder bound of 7.4 (section 15, item 1) without a box, a tail or a reserve; and z₁Q, z̄₁P have pure cost at least 0.128 jointly with A and B over every remote core | **N** | KPR §12; `code/kprime-2026-11-15/secant_joint.py`, `secant_joint.log`, `secant_all_sectors.py`, `secant_all_sectors_no_nu.log`, `secant_all_sectors_with_nu.log`; TILT-REV2 §7; TILT-REV3 §4 |
| 11.46 | At the peak, 3/100≤u≤463/10000 and χ=(E abs(q)⁴−2u²)/u²≤7/100 imply Λ̂(q+(T−1)r)<S+3115324569897527/159324300000000000000<S+2·10⁻⁵ | Every finite dimension, every remote cubic q in that subclass and every remote linear r, arbitrary sharing and amplitude. Combine 3.3, the retained trial inequality 11.12, 11.40 and 11.41; no sign assumption on D, no B or odd sectors, no profile transfer | **P + C rational acceptance**, re-derived/replayed by claude-b9ee on #409; the previously missing review attribution for 11.12 is now explicit; uses reviewed inputs only, not the partly unreviewed bounds in 11.30 | A15F `REMOTE.md` §6; `remote_profile_transfer.py` |
| 11.47 | At the peak, every remote cubic with 0≤u≤21/1000 satisfies Λ̂(q+(T−1)r)<S−69/25000000<S for every remote linear r | Every finite dimension, arbitrary sharing and amplitude; all tensor shapes, using the automatic 0≤χ≤42 when u>0. At u=0 handle q=0 separately. Uses the benchmark slack, global Hermite majorants and reviewed tilted inputs; not a sector-only bound 𝒥≤η | **P by author, not externally reviewed + C fresh Arb inputs and exact continuum acceptance**; 14 leaves, part of the combined 33-leaf cover | A15V `REMOTE.md` §§1–4; `remote_augmented.py` |
| 11.48 | At the peak, 0<u≤463/10000 and χ≤1/4 imply Λ̂(q+(T−1)r)<S+1/50000 | Every finite dimension, arbitrary sharing and amplitude; q=0 covered by 11.47. Enlarges 11.46 and removes its lower energy cutoff. No deficit-sign assumption, B/odd sectors or profile transfer. Uses only reviewed moment/secant/content inputs | **P by author, not externally reviewed + C fresh Arb inputs and exact continuum acceptance**; 19 leaves, part of the combined 33-leaf cover using 17 global Hermite polynomials | A15V `REMOTE.md` §§1–4; `remote_augmented.py` |
| 11.49 | **Energy-dependent content coefficients** (sixth version; TILT §2). For every dimension, every remote cubic q and every χ: ‖c_{3/5}(q)‖² ≤ γ_i·δ for every u from the endpoint e_i through 463/10000, both ends included, with (e_i, γ_i) = (9/1000, 251/5000), (3/250, 121/2500), (3/200, 467/10000), (9/500, 451/10000), (1/50, 441/10000), (1/40, 1859/43200), (3/100, 3/80), (7/200, 71/2000), (1/25, 17/500), (11/250, 13/400): from 0.0502 at u ≥ 0.009 down to 0.0325 at u ≥ 0.044, against 2/25 = 0.08 for every u (11.30) and 0.0399 on u ≥ 0.03 (11.41) | The structural identity ‖c‖² ≤ (2/3)·δ·sup_R N_{Ψ_u}(R) and the scalar resolvent k_u of 11.41, (5/3 − (u/2)∂² + x∂)k_u = m″. First six rows: ‖c‖² ≤ (11/108)·‖k_u‖²_∞·δ, with rational cubic supersolutions on 500 intervals, extended constantly, checked by exact Bernstein coefficients; Arb encloses the 501 source values, the fourth derivative and the infinite tails; the residual is affine in the energy, so its two endpoints suffice; the half-line comparison includes the downward derivative jump at 1. Last four rows: the shape \|k_u(x)\| ≤ W(\|x\|) is kept, and the angular norm max{(3A_R² − 2A_RB_R + 3B_R²)/12, (2/3)B_R²} is bounded through a one-switch reduction (a supporting functional has the sign of α·cos²θ + β·sin²θ), with an interval check of every switch on 400 radial intervals of [0, 2] with 4,096 angular cells each and an analytic estimate on the ray; compact enclosures below 0.037211600, 0.035357021, 0.033650745 and 0.032383690. **N** (TILT-REV4, independent of the author's code): the true coefficients (2/3)·sup N_Ψ at the ten row energies are 0.0468, 0.0451, 0.0435, 0.0421, 0.0411, 0.0389, 0.0369, 0.0351, 0.0334, 0.0321, against the certified 0.0502, 0.0484, 0.0467, 0.0451, 0.0441, 0.0430, 0.0375, 0.0355, 0.0340, 0.0325 | **P + C** by codex-6e2b. TILT-REV4: re-derived by its reviewer agent (the ridge decomposition, the resolvent kernel z^{2/3}, the operator, the Hessian norm, the one-switch reduction, the tail for R ≥ 2, the residual affine in u, the comparison argument); replayed with the whole deficit chain; tested (**N**). The interval code was compiled and run, not audited line by line | TILT §2; `deficit_structure_refine_proof.md`, `deficit_structure_medium25_proof.md`, `deficit_structure_content_proof.md`, `deficit_structure_absolute_low_proof.md`, `deficit_angular_proof.md`; `deficit_barriers_replay.py`, `deficit_structure_*_verify.py`, `deficit_angular_prepare.py`, `deficit_angular_verify.cpp` with their witnesses; TILT-REV4 §§3, 4; `review4/kcheck.py`, `review4/kcheck2.py`, `review4/wcheck.py` |
| 11.50 | **Content against deficit, proved** ((1) of TILT; this is 11.43): for every dimension and every remote cubic q with 0 ≤ u ≤ 463/10000, ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) + 6·10⁻⁶ | An exact union of 178 closed rectangles in 45 energy strips covers (u, χ) ∈ [0, 463/10000] × [0, 42] with zero gaps (χ ≤ 42 from E\|q\|⁴ ≤ 44u²): on [0, 9/1000] 32 boxes with 20 global Hermite moment caps, 3 of them exempt; on [9/1000, 2/125] 40 boxes with 33 caps and the coefficients of 11.49; on [2/125, 463/10000] 106 boxes with 119 global spectral Stein duals. Inputs (TILT §1): EU = 1, EU² = 2 + χ, EU³ ≤ 6 + 9χ + (4045313/100000)χ^{3/2} and the Stein variables of the October package (3.3), with U = \|q\|²/u; h(v) = 2E\|L + √v\| with h⁗ ≤ 0, h‴ ≥ 0 and −3 < h″ ≤ 0. Moment covers: the cubic Hermite interpolant of h, h′ at two nodes is a global upper cap on the half-line (nonpositive fourth-derivative remainder), rounded upward; the benchmark B is integrated by a Rice–Bessel formula with a proved tail and bounded below by chords (concavity); the budget is a polynomial in (u, √χ), nonnegative by exact bivariate Bernstein coefficients. Stein cover: each dual is a cubic Q ≥ h(ux) + G(x) on all x ≥ 0, checked exactly, which gives F(q) ≤ Q₀ + Q₁ + (2 + χ)Q₂ + (6 + 9χ + (4045313/100000)χ^{3/2})Q₃; one dual and one content branch per energy cell cover both ends in χ (convexity); the 68 profile caps of the October package are rechecked, 10 Hermite caps on [2, 64] and a tangent on the ray are added, and the benchmarks at the 14 energy nodes are integrated afresh. Energy interpolation: for a fixed law the budget has second derivative at most (9/10)(2 + χ) (B″ ≤ 0, H″ ≥ 0, h″ > −3), so a cell of width Δu loses at most (9(2 + χ_hi)/80)·(Δu)² below its endpoint chord, and every non-exempt corner budget exceeds that. Exempt boxes prove ‖c‖² ≤ H ≤ 6·10⁻⁶; the others prove ‖c‖² ≤ 0.3·D + 6·10⁻⁶, which implies the claim since D ≤ D₊; no sign of D is assumed. Content branches in the Stein cover: γ·δ in 74 boxes, 1/2500 in 30, (19321/10⁶)·u in 2. **N** (TILT-REV4): 1,298 members of the family of 11.38 (45 energies, χ from 0.05 to 42) and 288 random two-variable cubics satisfy the claim (largest C²/(0.3D) on the family 0.040; smallest margin on the random tensors 3.9·10⁻⁴), and so do the certificate's intermediate claims (F ≤ F_P at the Stein nodes, 2,618 checks, smallest slack 3.4·10⁻⁶; the moment caps, 68,794 checks, 7·10⁻⁸; the budgets at 936 family points in Stein boxes and 1,012 in moment boxes; Q − h(u·) − G ≥ 4.9·10⁻⁸ for the 119 duals on a grid to 10⁴) | **P + C** by codex-6e2b. TILT-REV4: re-derived by its reviewer agent (the global Hermite caps, the Stein bound, convexity in χ and the endpoint reduction, the energy interpolation and its direction, also by claude-b9ee, one content branch per box, the lower chords, the exempt boxes and the absence of a sign assumption on D); replayed: the secant part of the verifier in a full isolated run, and the deficit chain as `verify.py --deficit-only` in a copy with the repository layout (PASS in 99 s: 119 duals, 106 + 72 boxes, 0 uncovered, exact union); the union also by the reviewer's own exact method. Interval code compiled and run, not audited line by line. The combined default command was not run as one invocation by either party (section 14, item 53) | TILT §§1, 3; `deficit_dual_proof.md`, `deficit_moment_verify_proof.md`, `deficit_moment_prefix_proof.md`, `deficit_audit_results.md`; `deficit_moment_verify.py`, `deficit_moment_prefix.py`, `deficit_dual_cover_verify.py`, `deficit_dual_exact.py`, `deficit_dual_profile_caps.py`, `deficit_gaussian.py`, `deficit_cover_union.py`, `deficit_exact.py`; `deficit_integrated_results.txt`, `results.txt`; TILT-REV4 §§2–4; `review4/check_cert.log`, `review4/two_var.log`, `review4/dualgrid.py`, `review4/union_area.py` |
| 11.51 | **The tilted A-sector lemma (\*), complete** (TILT §4). For every dimension, every remote cubic q with u ≤ 0.0463 and every remote linear form r, at s = 3/5: 2E\|L + q + (T − 1 + s)r\| − (p − s²)‖r‖² ≤ 2E\|L + q\| + κ·D₊(q) + η with κ = 56730/59009 = 0.9614 and η = 5673/295045000 = 1.92·10⁻⁵. No bound on ‖r‖, no localisation, no maximiser, no sign of D, any sharing between q and r. **With the peak remote cap 3.3 (ii): Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ for every remote cubic q with u ≤ 0.0463, every χ and every remote linear form r** | 11.40 with 11.50: 𝒥 ≤ C²/k ≤ (0.3·D₊ + 6·10⁻⁶)/k. The consequence: by 11.12, Λ̂(q + (T − 1)r) ≤ Λ(q) + κ·D₊(q) + η. If D ≥ 0, this is (1 − κ)Λ(q) + κ(B(u) − pu) + η ≤ S + (1 − κ)·3.6·10⁻⁷ + η, since B(u) − pu ≤ S; if D < 0, it is Λ(q) + η ≤ S + 3.6·10⁻⁷ + η; with η = 1.9228·10⁻⁵ both are below S + 2·10⁻⁵ (the variant of 11.23). This contains 11.46 (0.03 ≤ u, χ ≤ 0.07) and 11.48 (χ ≤ 1/4) as special cases; 11.47 (u ≤ 0.021, below S − 2.76·10⁻⁶) is stronger on its range and stays. Peak row only; the A-sector only: no B-sector and no z-odd sectors; u ≤ 0.0463 covers the response range of 2.12a | **P + C** by codex-6e2b; TILT-REV4 re-derived the assembly constants (κ < 1 and η < 2·10⁻⁵ also exactly in `deficit_exact.py`). The consequence with the remote cap: **P**, arithmetic of 11.23's variant, checked when this record was updated | TILT §4; `secant_assembly.md` §3; `deficit_exact.py`; TILT-REV4 §§1, 3; 3.3; 11.23 |
| 11.52 | **Findings of the fourth review** (TILT-REV4 §5, none blocking). (1) The branch 3·δ^{3/2}, whose scalar part is **R** (11.30), is used in 11 moment boxes and one exempt box; it is removable: all 12 boxes re-certify exactly with (2/25)·δ instead, so 11.50 does not depend on it. (2) χ ≤ 42 is now load-bearing (the inherited Stein proof of 3.3 used only χ ≤ 60); it is the project's standard bound (E\|q\|⁴ ≤ 44u², 11.27). (3) Margins are thin in places (4.3·10⁻⁷ in the first Stein box; scalar caps within 6·10⁻⁴ of the true supremum), so the result rests on the interval code, which was compiled and run, not audited line by line. (4) The uniform bound C ≤ 1/50 of 11.30 is re-derived (pointwise Fenchel–Young and Π₁q = 0) and its certificate runs inside the replayed verifier: it is **P + C** now. (5) Portability: the deficit verifier reads the October Stein package through a fixed relative path into the repository (`ROOT.parents[2]/research/conjecture-K/…`) and fails in any other layout | (1) `review4/tensor_free.py` (exact Fractions, own bivariate Bernstein test, boxes bisected if needed), with `review4/branches.py` as a floating-point scout; (4) the number recomputed with the reviewer's own profile in `review4/fifty.py` (**N**) | (1) **C** by the reviewer agent of TILT-REV4 (exact; not part of the author's verifier, not replayed by anyone else); (2) **P** (the Lean theorem behind 11.27); (3) **N**; (4) **P + C**; (5) a defect of the verifier, not of the mathematics | TILT-REV4 §§3, 5; `code/tilted-sector-2026-11-15/review4/` |

**How far the content bounds are from 11.36** (**N**; Wick monomial, tilt 3/5; computed when this record was updated,
`code/record-checks-2026-11-15/tilted_content_check.py`). The five columns after the third are bounds on content²,
each divided by the deficit D: first the bound of 11.29, with E m_h computed by quadrature instead of the certified
848·δ, then the four bounds of 11.30. TILT-REV as first written has larger figures for the first of them; its erratum
and TILT-REV2 §3 have those of this table (section 14, item 42).

| u | D(q) | content² / D | (3/4)·δ·E m_h | (2/25)·δ | 3·δ^{3/2} | (19321/10⁶)·u | 1/2500 | the smallest of the last four | D / δ |
|---|---|---|---|---|---|---|---|---|---|
| 0.0005 | 7.64·10⁻⁶ | 0.0019 | 0.026 | 0.110 | 0.013 | 1.27 | 52 | 0.013 | 0.73 |
| 0.0050 | 4.57·10⁻⁴ | 0.0082 | 0.26 | 0.184 | 0.223 | 0.211 | 0.88 | 0.184 | 0.44 |
| 0.00575 | 5.74·10⁻⁴ | 0.0086 | 0.31 | 0.194 | 0.270 | 0.194 | 0.70 | 0.194 | 0.41 |
| 0.0200 | 3.85·10⁻³ | 0.0117 | 1.4 | 0.349 | 1.70 | 0.100 | 0.104 | 0.100 | 0.23 |
| 0.0463 | 1.21·10⁻² | 0.0114 | 4.1 | 0.597 | 6.7 | 0.074 | 0.033 | 0.033 | 0.13 |

In the assembly 11.34 the sector closes when the bound on the content, divided by D, stays below the cost: 0.212 (= P
− 3/4) there, 0.362 if the global bound 11.37 holds, and never more than the local cost k(3/5) = 0.447. The statement
11.36 asks for 1/10, or 1/5 in its later form. The bound of 11.29 is enough on this tensor only up to about u = 0.004
to 0.008 and is short by a factor 3 to 10 on [0.02, 0.0463] against a cost of 0.4. The loss comes from δ: it is a
fourth moment and is dominated by the tails of q, while D saturates there (last column). The constant 2/25 of the
later versions reduces the loss but not its growth with u, and 3·δ^{3/2} helps only at small energies. The smallest of
the four bounds stays below 0.2: it is largest, 0.194, where (2/25)·δ and (19321/10⁶)·u cross (u = 0.00575), against a
true ratio of at most 0.012. That is just below the 1/5 of the later form of 11.36 and above the 1/10 of the first:
around u = 0.005 the four bounds do not give the first form on this tensor (8.4·10⁻⁵ against D/10 + 3·10⁻⁶ =
4.9·10⁻⁵). One tensor; floating point. *Fifth version:* the cost is now k = 0.312, proved (11.40), and the statement
left asks for 3/10 (11.43); on this tensor the central coefficient γ of 11.41 gives γ·δ/D = 0.30 at u = 0.0463, half
of (2/25)·δ, while the smallest of the bounds there is still 1/2500.

**What (e) changes, and what it does not.** No bound changes. The lemma (\*) is proved for u ≤ 1/85920 (first version)
and for u ≤ 0.001123 (second version; both reviewed, the second with the caveat of 11.33); the fourth version claims u
≤ 0.00173 (**R**). For general tensors it is open on the range that matters, 40 times larger. What was a numerical
target in 11.19 (i) is now an implication from explicit statements, along two routes: through the curvature inequality
11.33 and a localisation of the maximiser (11.34), which the third and fourth versions claim to complete up to the
content comparison 11.36 (**R**); or through the global bound 11.37 of the second review, which is numerical and would
leave the same comparison (11.38). Reviewed and proved for every dimension: the global bound 11.26, which is the bound
6.1.1 with the tilt and has almost three times its cost in ‖r‖², and its sharpened form 11.27; the structural bound
11.29, the first bound on the tilted content that vanishes for a Gaussian law, and its sharper forms in 11.30; the
remainder theorem 11.32. Not touched: the remote part (layer L1), the B-sector and the z-odd sectors, the other rows,
and every tilt other than 3/5. The numerical values of the report (TILT-4 §6) are those of part (c) on the Wick
monomial, recomputed independently: gain/D = 0.0253 and 0.0241 at u = 0.02 and 0.0463 (the same values are in
`search/tilt_0.6_0200.log` and `search/tilt_0.6_0463.log`), and content²/D = 0.0117 and 0.0114.

**What the fifth version changes.** Still no bound changes, and the lemma (\*) is still open for general tensors on
the range that matters. The finite-amplitude step is closed for the tilted A-sector, at every amplitude and in every
dimension, by the global remainder bound (11.39, 11.40; **P + C**): neither the curvature inequality as a statement,
nor localisation, nor a tail allowance is used, and the routes of 11.34 are superseded. The only open input is the
comparison of the tilted content with the deficit, now with the constant 3/10 (11.43), or in its place an augmented
remote certificate (11.44). From reviewed inputs alone the lemma holds for u ≤ 0.00136, 34 times below the range
needed (11.42). For K itself (s = 0) and for the A and B shells together the corresponding global bound is numerical
only (11.37, 11.45). Not touched: the B-sector and the z-odd sectors beyond those numerics, the other rows, the other
tilts, more than three remote variables.

**What the sixth version changes.** The lemma (\*) is proved for the retained A-sector at the tilt 3/5 and the peak row,
for every remote cubic with u ≤ 0.0463 and every remote linear form, in every dimension (11.51; **P + C**, reviewed in
TILT-REV4 with the interval code replayed, not audited line by line). With the remote cap 3.3 it gives
Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ on that whole class, which contains the subclasses of 11.46 and 11.48. Still no bound
of the repository changes: the result is not in Lean, it covers neither the B-sector nor the z-odd sectors, nor the
other rows, and for K itself (s = 0, without the retained penalty) the remainder and content steps are not proved.

**Relation to the record.** The report has its own check (TILT-4 §1, "Record check"). The reviewer found no
contradiction between the first version and the record, and none was found when these rows were written.

- *The tilt identity and its local cost* are 11.12 and 11.13, as the report says. Its verifier encloses the constants
  of part (c) in exact arithmetic: j₀ ∈ [1.431973791291431, 1.431973791291432],
  g₀ ∈ [−0.835135932614130, −0.835135932614129] and k(3/5) ∈ [0.446707057881032, 0.446707057881033], in agreement
  with 11.13, with the enclosures of the audit A15 (`sector_constants.json` has the same j₀ and g₀) and with
  `cs_check.log` (0.44671).
- *The circular-mean method is the October one.* The report says so and claims only the tilted adaptation. 6.1.1 is
  the same argument at tilt 0, with the sharper constant 59767/200000 of `lower-bound/sharp-circular.tex` in place
  of 3/10. In the normalisation of 6.1.1 the proof of 11.26 reads Λ̂(q + (T − 1)r) ≤ B₀ + 0.3964·u − 0.3436·‖r‖²,
  against Λ(q + (T − 1)r) ≤ B₀ + 0.38968·u − 0.12432·‖r‖² in 6.1.1. (B₀ = Λ(0) = F(0). This is 11.12 followed by
  the first display of the proof in TILT-4 §2.3, with 1074/625 − p = 0.39635; it does not use the step F(q) ≥ F(0)
  of the report.) The coefficients of u differ only through the constant of the circular mean. The cost in ‖r‖² is
  what the tilt and the retained penalty buy: 0.344 instead of 0.124. With the benchmark gap S − B₀ > 0.0020476 the
  line gives Λ̂(q + (T − 1)r) < S + 10⁻⁴ for u ≤ 0.00541 + 0.866·‖r‖², where 6.1.1 gives Λ(q + (T − 1)r) < S + 10⁻⁴
  for u ≤ 0.00551 + 0.319·‖r‖². (This consequence was drawn when this record was updated; it is not in the report
  or in the review.)
- *The structural bound 11.29 against the universal content bounds of the record.* 6.3.12 bounds the leading tensor
  Π₁,₀(q|q|²) by (3√6/4)·δ^{3/2}, and 6.3.11 bounds the K-content by 50·δ^{3/2} at every amplitude. Both are **R**
  (6.3.11 because the derivation of its tensor identities was not found). 11.29 is a different inequality: of first
  order in δ instead of order 3/2, for every smooth profile (so also for the tilted one, which those two do not
  cover), with a factor E m_h that depends on the profile and on the law of |q|². As an order in δ it is the weaker
  statement, and the report says so. It neither uses nor confirms 6.3.11 and 6.3.12. What it has and they lack is a
  complete derivation that a second party re-derived. Like them it charges the content to the fourth moment, and
  like them it does not reach the energies that matter (13.2, items 21 to 23; 13.10). The later versions relate their
  sharper budget to the Stein budget of the Lean files `Grothe/LowerAnalytic/Fluctuation.lean` and `Influence.lean`
  (TILT-4 §1). TILT-REV2 re-derived the budget itself; the correspondence with the Lean files was not checked.
- *The Cauchy–Schwarz bound of 11.18* uses the law of |q|² only and does not vanish at a Gaussian law. 11.29 removes
  that floor and loses in the tails instead (table above). The second term of 11.30 is again a bound through the law
  of |q|².
- *The remainder theorem 11.32* is the finite-amplitude step for which 11.17 has the numerical input Θ(R), and its
  tail is the allowance 11.24 of the audit A15. That the second derivative cannot be bounded without a restriction
  on ρ is 13.1, item 19.
- *The fourth-moment route.* The first version points out that 11.29 is not the split "content through the fourth
  moment, slack through the fourth moment" of 13.1, item 9: it proves a bound on the content and leaves the
  comparison with the deficit open (11.36).
- *The global remainder bound 11.39* is, for the tilted A-sector, the finite-amplitude remainder bound that 7.4 asks
  for (the remainder r_x(α, β) of IMP-JT in 7.4.5, there on a box and with a reserve for the Gaussian tail), and the
  counterpart of the A-cost 6.2.1 of K, which needs a cap on the shell energy; 11.39 needs neither. The content bound
  11.41 is again a bound through δ, like 11.29, 6.3.11 and 6.3.12, sharper by a factor of two on the central
  energies; it does not compare the content with the deficit.

**Left outside the repository.** The fifth version is here whole: every file of its author's folder as it stood when
the replay of that version ended (05:17), including the notes, scripts and probes of the earlier versions that the
folder still held (some of them named by no version: `localization_radial_proof.md` with its probe, and
`localization_dual.py`). The hashes that close its `results.txt` match the copies. The reports and results files of
the second and third versions are not here: their author wrote the next version over each. What remains of them are
hashes (`INVENTORY.md`) and, for the second, its verifier. The first version no longer exists in the working folder;
the copies here are those that were reviewed. From 05:22 on, the author added files named `deficit_…` to the folder,
by their names work on the comparison 11.43; they belong to no delivered version, were not read for this record and
are not described here (`INVENTORY.md`, section 4). *Sixth version (06:06):* those `deficit_…` files became the sixth
version. All its files are here except five JSON files above 300 KB, which stay in the working folder with their
hashes in `INVENTORY.md`; one of them, `deficit_dual_cover_candidates.json`, is an input of the verifier, so a replay
needs it from there.

## 12. Related results

| # | result | status | where |
|---|---|---|---|
| 12.1 | Cover improvement: K_G^ℂ > 1.401697318640 (= 17521216483/12500000000; cap B = 713420784003651/10¹⁵; gain 201339/10¹² over 1.401697117301), from the existing witness, 19 rows and law nodes with a refined finite cover of 11,107 boxes | **Externally certified, not in Lean.** Every box bound and the partition were recomputed in exact rational arithmetic by two separate implementations and the checker was compared with the Lean definitions; no Lean build. Computed against commit 32cfb7d87; since then `Grothe/Research/LawNodeLower.lean` was golfed without statement changes. To land it, Lean must check the new cover data and instantiate the existing transfer theorem. **Independent of K** | IMP; `improvement_bound_review.md`, `improvement_cover_method.md`; checker `code/audit-2026-11-13/improvement_independent_check.py`; certificate in `INVENTORY.md` |
| 12.2 | Ceiling of the cubic witness family: below 1.4022581233 for every complex multiplier and every dimension | [P,C] with the generic arithmetic in Lean, according to `docs/overview.tex` ("Limits of the witness method"); not re-examined here | `docs/overview.tex`; MON §1 |
| 12.3 | The degree-5 analogue K₅ is false at its flank rows t ∈ [0.86, 0.88]: one spike +1.55·10⁻⁵ (deterministic quadrature), plateau about 8·10⁻⁵ ± 1·10⁻⁵ for 8 to 20 spikes; it holds at the peak row in every family tested | **N** (floating point and Monte Carlo; nothing certified). Mechanism (**R**): a Gaussian driver (T−1)R_N ∈ H₃,₂ gives an excess ≥ εα²I²/4 > 1.5·10⁻⁴; this lives in H₃,₂ and is not a counterexample to K | `sources/k5-2026-11-04/RESULTS.md`; MON §3.2; LOG §11a |
| 12.4 | D₁ in degree 2 (3.8) | **R** | `sources/d1/` |
| 12.5 | The upper bound claimed in EXT-R (1.404896400821) | **R**; weaker than the proved 1.404599412097 (`main_bounds`; 1.4046 until PR #394, 15 November) | EXT-R |

## 13. Refuted statements, and what was tried and failed

Do not repeat these. One line each: what, why, where.

### 13.1 Strengthenings and variants of K that are false

1. **K for every ε and every profile.** False at tiny norms for ℓ − 2β ≲ 10⁻¹⁰; the box is needed. MON §1; LOG §8a, §10.
2. **Constant-free same-norm domination (K\*) for every affine profile.** False at the margins (gain ε²log(1/ε) against ε²). LOG §8, §8a.
3. **The one-term version E|L + G| ≤ E|L + σW|.** False: G can cancel the cubic part of L. LOG §8.
4. **Fibrewise domination at a fixed shift, E|r + q| ≤ E|r + ‖q‖W|.** False for r ≥ 2.5 even for cubics (+2.2·10⁻³ at r = 2.5). Only the T-averaged form can hold. MON §2; LOG §11b, §11g; `ch29`.
5. **Every single-scale strengthening (heat kernel, Laplace transform, characteristic function, convex order |q|² ≥_cx ‖q‖²·Exp(1)).** False; certified E e^{−30|H|²} < 1/31 for H = z[(|z|²−2) + i(|w|²−1)]/√3. MON §2; LOG §11b; DIG §3; `OCT/prompts/PROMPT_REPLY_K_REFORMULATION.md`.
6. **L4: monotonicity along the CLT, Λ(G) ≤ Λ(symmetrised G).** False: G = c·z₁(|z₂|²−1) gives +4.9·10⁻⁴ at c = 0.15. `OCT/pipeline-kclt/RESULTS.md`; DIG §2; LOG §7.
7. **OU-path monotonicity in its scalar Stein-sign form.** Not equivalent to monotonicity and false for G = M·z₁(T−2). LOG §7, §7a; MON §3.3.
8. **Lemma (T): the weighted-content inequality (𝒞_{F_A}(q) + 𝒞_{F_B}(q))·λ_max(M(q)) ≤ 0.292(S − Λ(q) + η).** False for q = (7/(20√2))X²Ȳ, whose actual contents vanish. The live form is (T₀), with the actual contents. `OCT/conjecture-K-report/WEIGHTED_CONTENT_FOR_GPT.md`; DIG §2; `ch15`.
9. **Splitting the proof into "content ≤ f(x)" and "slack ≥ g(x)" through the fourth moment.** Ratio 0.9 to 0.95 at the Wick monomial; proved chains close only for x ≤ 0.22. `OCT/pipeline-kproof/PROOF_NOTES.md`; `ch7`.
10. **Jensen on conditionally Gaussian G with conditional cross-covariance.** The functional is not concave in the covariance parameters (largest Hessian eigenvalue +1.3 to +2.9). DIG §2; `OCT/pipeline-kclt/RESULTS.md`.
11. **Equal-variance peeling of a shared driver; replacing (T−1)U by an independent Gaussian when coordinates are shared.** False (shared minus independent up to +1.96·10⁻² at aligned phase; reverses at first order). DIG §3; LOG §11e.
12. **Dropping the remote tangent correction in Theorem A.** Invalid proof step: a positive tangent term appears (5.1a). This alone is not a cubic counterexample to same-norm domination. LOG §10, §11e; ADD §2; A15 `CLAIMS.md`.
13. **The conditional second moment vT + u(T−1)² as a carrier of the A shell.** Cannot work: the profile (t−1)² moves variance to T ≈ 0 where |L| vanishes. LOG §11g; DIG §4.
14. **Proofs from the law of the residual alone, from orthogonality alone, or from radial and Gaussian-noise tests.** Gaussian-marginal obstruction (6.5.1). `ch35`; LOG §11e, §11h.
15. **Exact K-a from radial scalar inputs or from moments alone.** Artificial radial laws beat the Gaussian payoff (excess < 4.65·10⁻⁶); the cited moment-only relaxation has a floor about 10⁻⁵ above S. This depends on the moment input: the October 1.05·10⁻⁵ package obstruction uses C₆=49.425, not 40.45313, and does not constrain the stronger Stein relaxation (A15 `REMOTE.md`). DIG §3; `ch7`.
16. **Merging the Wick face and the Gaussian-factor face without chaos restrictions.** Fails for any normalised fourth moment in [2.06, 6]. `OCT/conjecture-K-report/conjecture_K_report.md`.
17. **Buffer insertion by Jensen, Λ(G) ≤ Λ(G + gU) + pg².** Costs p(9/40)² > 0.0669 against a budget of 9·10⁻⁵; buffered theorems do not transfer to zero buffer this way. DIG §3; `lower-bound/obstruction-1402.tex`.
18. **A pointwise tangent majorant for the A curvature at small buffer.** Its A-curvature is positive below g ≈ 0.164 (the tangent loses the radial part of the Hessian, about a factor 2). DIG §3; `ch55`.
19. **The local pinned matrix as a global majorant.** For the tied multiplier k = α/3 + β/6 the local matrix M plus I/10 is violated by more than 97/1000 at q = 3/4, α = 7/20, β = 1/2, k = 1/5 (interval check), and an isotropic 0.8·I is not a majorant even infinitesimally (normalised curvature above 0.843 in the direction (2, −1)). The same passage holds the October form of the local cost matrix 11.4 (section 11 (a), relation to the record); this is why 11.4 must not be used as a cost. Compare 11.17. DIG §3; `ch25-parts/20-stability-and-smoothing.tex`; `OCT/weak-k-2026-10-15/LOCAL_CHANNELS.md` §§2 and 5.

### 13.2 Content inequality: routes that do not reach the rectangle

20. **Exact extremality of the Wick monomial (Conjecture E), and "the ratio is monotone toward the monomial".** False: saddle (6.4). MON §4; LOG §15, §18; CERT §6.
21. **Leading-order (cubic tensor) control of the content.** Even the optimal tensor constant covers only u ≤ 0.0112; the leading ratio overestimates the truth 9 times at u = 0.0463; q₀ has zero leading tensor and fifth-order content −243. MON §3.4; LOG §12c, §12e.
22. **Taylor remainders.** Certified radius 0.006 to 0.008 in amplitude against the needed 0.26; cumulant-sensitive remainders reach u ≤ 3·10⁻⁵ on the box. LOG §12b, §12c.
23. **A global sixth-derivative bound for the deficit.** Negative beyond u = 0.0017. LOG §12f; DIF §4.
24. **The quadratic shell cost absorbing the content without the remote slack.** Needs w > 0.038 at u = 0.0463. LOG §11i.
25. **Fourth-moment envelopes in (u, w).** Saturated at w ≈ 0.0112; they miss the corner (0.0463, 0.01125) by 10⁻⁵. LOG §12j; MON §3.4.
26. **Schur-convexity of content or deficit in the spectrum of a Hermitian form.** False: (2, −1, −1) ≺ (2, 0, −2) but ‖T‖² = 576 against 0. LOG §12f.
27. **Dropping the shells X̄B, X²W̄ by averaging the phase of X.** False: cross terms survive (6.3.8). LOG §12f, §15; CERT §8.
28. **Centring and conditional Gaussianity without the chaos moment inequality.** Two-point laws reach 0.2469 and 0.2646 > 0.24 (6.5.3). LOG §15.
29. **A purely radial polynomial envelope with the two radial moment constraints at the pure-P end.** A three-point law gives more than 0.246 (certified obstruction, **R**). Bypassed by the affine weight of 6.3.3. LOG §23; `RCV/r26_envelope_audit/`.
30. **The directional envelope on the small-Wick strip (sampled 0.2393).** Obstructed: an eight-atom witness forces its cap above 0.2405 (**R**: reported from a thread that crashed; no archive). LOG §29.
31. **Hessian perturbation from the Wick endpoint beyond p ≤ u/5.** Loses a factor of about 20 on the content. LOG §19, §24.
32. **Family certificates added up to a general theorem; "several drivers follow driver by driver".** The functional is not additive and the families do not exhaust H₂,₁. REC §4; CERT (conclusion).
33. **"Every mechanism that spreads q lowers the content faster than the deficit".** An intuition, not a theorem. DIF §4.
34. **The universal bound for u ≤ 0.00038 as a proved theorem.** Only its scalar constants are checked (6.3.11). CERT §7.
35. **Counting an auxiliary diffuse Gaussian W as a first-chaos direction.** Spurious counterexample: √u·W is not in H₂,₁. DIF §3.

### 13.3 Assembly

36. **"Every non-A sector is pure cost."** False for B at small amplitude (7.1.2). LOG §31; ASM §3.1.
37. **"The odd sectors have O(u) content."** Wrong: no first-order term at all (2.9). LOG §34.
38. **The inverse-norm condition E[|O|²/|L + H|] ≤ (1/ε − κ_E)‖O‖² for the odd sectors over a nonzero core.** Fails even with κ_E = 0: E[|O|²/|L + H|] > 2.714 > 2.644 = ‖O‖²/ε at an explicit core (**R**). The certificate must keep the directional curvature. LOG §36; `RCV/odd_sector_inverse_norm_obstruction/`.
39. **Applying the B-cost at the base q + (T−1)r_A.** Not justified: the theorem needs a remote base; its "every even L² base" form is false (7.3.5). LOG §43, §45; ASM §2.
40. **Integrating the infinitesimal signed A/B bound along q + s(A + B).** Invalid: the intermediate bases are not remote (7.3.3). ASM §3.3.
41. **The pointwise finite-amplitude Hessian form (route (c) of J2).** Fails numerically (7.3.4). LOG §41.
42. **Closing A+B through the near-exact mixed coefficient m = 0.118.** Fragile: excess 5.5·10⁻⁵ at m = 0.118 but 1.2·10⁻⁴ at 0.115 and 8·10⁻⁴ at 0.10; abandoned. LOG §44, §45.
43. **Closing A+B by sharpening the A-content to 0.10 with "the certified diagonal costs and no statement about the mixed term" (task S1).** The implication is not established (7.4.3); it needs the joint bound of 7.4. REP §2 (a); ASM §2.
44. **The kernel-ratio interval g_B/g ∈ [0.505, 0.56].** False at the flank and upper rows (7.1.4). LOG §45.
45. **The L¹ projection bound ‖Π(q·h)‖ ≤ E[|q|h(|q|²)].** Not valid for unbounded Gaussian linear forms; use the L² contraction. REP §3 item 6.
46. **Pairing the B first variation with r_B instead of conj(r_B).** Wrong (charge two, vanishes). LOG §28; ASM §3.1.

### 13.4 The October even-sector programme, K′ and K_rot

47. **M1 decoupling of the even sectors.** False by up to +5.7·10⁻³. `OCT/PLAN_1402.md`.
48. **The statements (EC), (PH), (PG) of the 1.402 plan.** False as stated, or false inside the response-feasible region (largest eigenvalue 1.3395 > p). `OCT/PLAN_1402.md`.
49. **A uniform fibre bound for the even sectors.** None exists (largest eigenvalue 1.7095 > p). `OCT/PLAN_1402.md`.
50. **K′ with the penalty ‖P₁,₀k‖² evaluated at the unpenalised best response.** Does not bound the penalised supremum: the maximisers readjust. The valid form is the dual Λ_P (2.10a); its guaranteed relief on the remote part is 0.41 to 0.45 of the raw penalty, about 7 to 14 % of the mixed-gain allowance on the junta family, not the 16 to 31 % first measured. It does not transfer unchanged to the coupled A/B sectors. These percentages measure a subtraction at fixed sectors: the relief at the q-only point, set against an allowance for the mixed gain that was computed without the retained element. They are not the effect of the retained element optimised together with the sectors, which was first computed on 15 November (11 (c); section 14, item 26). `ch20`; `ch17`; `OCT/conjecture-K-report/conjecture_K_report.md`.
51. **K_rot alone.** Weaker than K but pays only 13 to 57 % of the mixed gain and no cap is proved for it. Again a subtraction at fixed sectors: the penalty evaluated on the junta data against the measured A/B gain. DIG §2; `ch23`.
52. **Scalar Rice cuts and moments on the response side.** Saturated: they improve the peak cap by less than 4.3·10⁻⁷; a law with nodes 2 ± √2 passes every scalar cut. DIG §1 item 4.
53. **Proportional remote tests v = λq in the response-body dual.** Leave a gap of 0.0007977 at e = 1/25. DIG §2.
54. **Concentration tests as a route to small influence.** They do not force it (the family Q_N). DIG §3.

### 13.5 Gates, tables, other witnesses, and ideas of 14 November

55. **A better certificate at ε = 149/200, or rearranged gates.** Even a perfect certificate at that ε gives 1/0.713288 = 1.401957 < 1.402; the rearranged gate scheme has a worse Gaussian ideal (0.713519). `OCT/pipeline-gate/KSIDE.md`; MON §1.
56. **The frozen table plus cut-bank relaxation.** Has a floor: four atomic laws pass all 671 cuts with values above 500/701; genuine-cubic floor 0.71335 at ε = 149/200. DIG §1 items 22, 23.
57. **Degree-5 witness with gates or independent Gaussian tests.** Gated rows lose at least 5.5·10⁻³; the analogue K₅ is false at the flank rows (12.3). LOG §2; `sources/k5-2026-11-04/RESULTS.md`.
58. **Second-order tests at the diffuse contact.** Exact flat sector: they cannot separate the diffuse contact. LOG §12a.
59. **Convexity of p ↦ log(E|X|^p/E|N|^p) for chaos X** (would give E|X| ≤ √(2/π)‖X‖₂). False on p ∈ (−0.8, 0.4) for He₂ … He₆. TAIL §5.
60. **Reduction to the sphere S³ ⊂ ℂ².** Valid but useless: every S³ instance has ratio ≤ K_G^ℂ(2) ≈ 1.2. TAIL §5.
61. **A shift by the vector-valued Borell inequality.** The Borell deficit of a driver pair is about 10⁻² against a budget of 10⁻⁴ (hand estimate). TAIL §5.
62. **A Bellman function or martingale relaxation in (t, f_t, g_t).** Cannot see the sign of the time multiplier (argument only, not computed). TAIL §5.
63. **Sum of squares of degree 2.** Gives only the trivial value 1 for sup ‖P₁,₀f‖² (truth π/4); degree 4 not tested. TAIL §5.
64. **Reading a finite-dimensional scan as a bound.** A search gives lower bounds on a supremum only; training maxima above 0.09 were sampling artefacts. REP §5.

### 13.6 External "proofs" that were rejected

65. A pasted "proof" of K\* (5 November) and two "proofs" from another assistant, including one of K and of an unconditional 1.4022, were checked and refuted point by point. LOG §9, §11c, §11f.

### 13.7 Scope errors identified by the follow-up audit (A15)

66. **Disjoint redistribution with a visible-dependent L² base.** Dropping H independent of Z from 4.1 is false:
    H=−L·1{T≥10}, U=sW has a positive linear difference for small s while satisfying the energy cutoff.
    **P, by author, not externally reviewed**; exact scalar support in A15 `CLAIMS.md`. This is not a cubic counterexample.
67. **Conditional-Gaussian domination with a visible-dependent conditioning field.** Dropping 𝓕 independent of Z
    from 5.2 is false: 𝓕=σ(Z), G=(a/2)W·1{T≤1/100} concentrates variance where L is small.
    **P, by author, not externally reviewed**; A15 `CLAIMS.md`. This refutes the general broadened formulation, not K.
68. **Identifying the optimized remote cap with same-variance domination.** Λ(q)≤S+η_R gives
    D(q)≥−[S−(B(u)−pu)]−η_R, not D(q)≥−η_R. **P** (algebra); use 11.23 when combining budgets.

### 13.8 Scope tests and cost obstructions from the second pass (A15R)

69. **Total response energy ≤.072 without a t threshold.** At peak ε the bound needs t≥.8456;
    on t≥.84 use .081884. A genuine response at t=0 has energy >.0939738. **P + scalar C**,
    A15R `FOUNDATIONS.md` §2. This is not a raw-K counterexample.
70. **Odd-sector nonincrease on the entire application box.** At (.76,.76,.16),
    O=(i/100)Z(|Y|²−1) gives Λ(O)−Λ(0)>7·10⁻⁶. The historical flank d-cost .36 also fails,
    by >5·10⁻⁷ at d=i/100. **P by author + scalar C**, A15R `SECTORS.md` §§3–4; neither refutes K.
71. **Parity implies differentiability for every even L² base.** The even base
    H=L sign(Re Z) has a positive |τ| cusp along the genuine odd cubic Z(T−2).
    Parity is valid; its derivative corollaries require existence. Genuine cubic bases have a first
    derivative by the polynomial zero-set argument. **P by author**, A15R `SECTORS.md` §6.
72. **An indefinite cost matrix has the Schur-complement supremum printed in 7.4.1.**
    With k_A=k_B=1,m=2,c=d=0 the printed expression is zero but the unrestricted gain is unbounded.
    Restore positive definiteness. **P**, A15R `SECTORS.md` §7; the original source had this assumption.

### 13.9 Further distinctions from the third audit (A15T)

73. **Retaining the first-chaos correction does not restore full-box odd nonincrease.** The same corner
    Q-axis cubic as item 70 gives Λ̂(O)−Λ̂(0)>7·10⁻⁶; the correction improves its value by less than
    3.2·10⁻¹⁰. **P by author + C scalars**, A15T `SECTORS.md` §5. This is not a counterexample to K,
    K′ or the required peak-row target. In contrast, the pure P axis has positive full-box cost .41 and
    Λ̂=Λ exactly (5.4b); the d axis gains the sharp retained cost of 2.6a.

74. **Character exclusions alone do not give the weighted chaos bound used in the neighbourhood proof.**
    For independent standard complex X,Y, h_R=Y·1{|X|>R}/sqrt(P(|X|>R)) has norm one and X-character zero,
    but E[|X||h_R|²]>R. This is a non-cubic L² example, not a counterexample to the correctly scoped
    content theorem. Restore p,h∈H₂,₁ in 6.3.9–6.3.9b; A15T `CONTENT_KERNELS.md` §6 (**P by author**).

### 13.10 The sector lemma with the penalty retained, and pointwise remainder bounds (15 November)

75. **Bounding the tilted content by Cauchy–Schwarz against a fourth-moment quantity.** Through the law of |q|² alone the bound does not vanish at a Gaussian law, and its floor is of the size of the whole slack of 1.402 (11.18). The structural bound 11.29 removes the floor, but its Cauchy–Schwarz step, taken with a constant weight, charges the content to δ = E|q|⁴ − 2u². That is a fourth moment, dominated by the tails of q, while the deficit D saturates there: on the Wick monomial D/δ falls from 0.73 at u = 0.0005 to 0.13 at u = 0.0463, and the bound divided by D is 0.026, 0.26, 1.4, 4.1 at u = 0.0005, 0.005, 0.02, 0.0463, against a cost of 0.2 to 0.45. Enough up to about u = 0.004 to 0.008, short by a factor 3 to 10 where it matters (**N**; one tensor; the first review first printed larger figures, section 14, item 42). The constant 2/25 of the second version (11.30) lowers the last two ratios to 0.35 and 0.60, and only together with a bound through the law of |q|² does it stay below 0.2 (table of 11 (e)). With the global bound 11.37 the two certified bounds together are numerically just enough at sampled points of a test family, with no uniform margin established (11.38). The method is not refuted: the same step with a weight that decays for large |q| has not been tried (section 15, item 7). 11.29, 11.30, 11.38; TILT-REV, TILT-REV2; `code/record-checks-2026-11-15/tilted_content_check.py`.
76. **Absorbing the tilted sector into the headline remote cap.** With the uniform content bound ‖c‖² ≤ 1/2500 and 11.40, the remote theorem Λ(q) < S + 9/25000000 (3.3) gives only Λ(q) + sup_r 𝒥(q, r) < S + 0.00128, about 64 times the allowance 2·10⁻⁵; and the cap is not a lower bound on D(q) (correction in 11 (c)). The sector term has to enter the certificate itself (11.44). **P** (arithmetic); TILT-5 §4; `secant_assembly.md` §4.
77. **A pointwise remainder bound for all five sectors of K at once.** The scan reports a negative cost near −.387 at zero base, with Q/ν energy shares about .58/.42 (**N**). A15F now proves an exact obstruction: constant coefficients (k_Q,k_P,ν)=(i,0,−i) have normalized local cost in (−.378784185484355,−.378784185484354)<−3/8. Thus even nonnegative pointwise cost fails. **Refuted, P by author + C scalars**; A15F `JOINT.md` §2.2. Constant Q is not a centered Wick quadratic, so this does not refute the integrated genuine-cubic zero-core theorem: its mixed Q/ν term vanishes because E Q=0. The nonzero-core interaction is still open. The four-sector .128 scan remains **N**. Original numerical provenance: 11.45, KPR §12, `code/kprime-2026-11-15/secant_all_sectors_with_nu.log`; its signed norm-expansion cross entry is about −.608 (the cost entry has the opposite sign).

### 13.11 Reformulations and exact targets corrected in the fourth audit (A15F)

78. **SEI survives addition of any independent symmetric unimodal variable.** The printed closure in `ch32` is false: X₁=Z₁Z₂Z₃/3 is SEI, but adding independent uniform [−1,1] gives interval gap at least 91/18000. **Refuted, P by author + C arithmetic**. Both-summand SEI plus symmetric unimodality, or independent Gaussian addition, are valid replacements; neither K nor third-chaos BNC is refuted (3.5a). Re-derived/replayed on #409; no current ledger theorem depends on the false closure, so its mathematical error has limited impact on the active programme.
79. **“Real form = BNC” in the PVD summary (MON §3.3).** This is the monograph’s actual wording, not an explicit assertion “real BNC is equivalent to complex PVD”. The summary blurs the distinction: the cited source proves only the sufficient BNC-to-real-PVD direction. BNC is monotonicity of the normalized Gaussian-smoothed absolute mean, while PVD is its upper bound. The complex conjectures have the separate equivalence 3.5, including EVERY price; no converse to BNC is established. This is an unsupported equivalence, not a mathematical refutation of that universal conjecture.
80. **The diffuse Gaussian attains the cubic supremum in each fixed dimension.** It is a limit over increasing dimensions. At n=1 the peak supremum is B₀<S (2.6); the K_all equality in `ch32` needs a supremum over all dimensions. **P by author**, using the reviewed axis theorem; A15F `REFORMULATIONS.md` §6.
81. **Global raw A/B cost exactly .300.** The direction r_A=sX,r_B=−sX/5 has limiting cost <.298526023077304 at zero core. **Refuted, P + C scalars**, re-derived/replayed on #409 (7.4.8); 7.4.9 now gives the sharp local eigenvalue. The scan's rounded .300 is not a feasible exact target. The signed anisotropic target and K are unaffected.


### 13.12 Fifth-audit distinctions and certificate limits (A15V)

82. **Remote raw and retained objectives are identical.** False as a literal interpretation of the old README summary. The common raw cap is a sufficient input to both routes, but the genuine cubic q=cX(abs(Y)²−1) gives Λ̂(q)<Λ(q) for every c>0 at every positive profile. The exact peak witness at c=.01 and the equality criterion are in 3.16. **P by author, not externally reviewed + C witness.** No active raw certificate is invalidated.
83. **Refinement of the existing moment-polynomial bank alone closes the augmented target.** At u=1/25,χ=4, every one of its 154 polynomials, with either reviewed γδ/k or (19321/10⁶)u/k surcharge, exceeds S_upper+.0002. **C exact finite-bank obstruction**, A15V `REMOTE.md` §5. This limits those particular upper bounds: it is not a lower bound on Λ̂, a realizable moment witness, or a refutation of K.

## 14. Where the sources disagree, and what stands

| # | disagreement | what stands |
|---|---|---|
| 1 | MON §0 calls the content lemma "the single statement still missing"; MON §4b and the audits list L5 and L6 as open | The audits (REP §3 item 1) |
| 2 | MON §4b and LOG §§44–45: sharpening the A-content to 0.10–0.15 "closes the A+B core with the certified diagonal costs and no statement about the mixed term" | Not established (REP §2 (a), §4; ASM §2; REC §1). A joint finite-amplitude bound is needed. The "negative margins" of LOG §44 are values at Δ = 0.07408, not uniform |
| 3 | MON §3.5: "the worst case … is the known template"; MON §4: the monomial is a certified saddle | The saddle (6.4); best known value 0.08760259435 |
| 4 | MON §4b: L1 "certified in the project (Lean/native), done" | The 13 November audit left this **R**, peak-only, with no Lean theorem for the cap. A15 now certifies the stronger October peak cap externally (3.3); the claim of Lean certification and all-row completion remains unsupported |
| 5 | MON §3.4 and §4: the near-Gaussian region δ/u² ≤ 0.05 is closed | Not justified (REP §3 item 11) |
| 6 | MON §§0, 1, 5: "B ≤ 0.713267 ⇒ 1.402" | The exact threshold is B < 500/701 (REP §3 item 8) |
| 7 | MON §3.1: "n = 1 is settled (sup Λ = 1.3649 < S = 1.3739535)" | Impossible at the peak (Λ(0) = 1.3718793; REC §6.1). The October sources give "n = 2 without W: sup Λ = 1.3649281 < S = 1.3669130", from a run at (ε, ℓ, β) = (0.7564, 0.84, 0.14) (`ch7`; `OCT/pipeline-gate/KSIDE.md`). For n = 1 see 2.6 |
| 8 | KSCAN: best ratio 0.0892 at n = 2; audits: 0.0876025944 by deterministic quadrature over all of H₂,₁(ℂ²) | The audits. The 0.0892 is 2 to 3 standard errors above with a selection bias and could not be replayed (OPT §4) |
| 9 | Main audit: the 0.22 and 0.239 theorems are **P + C** end to end; second audit: implication **P**, scalar enclosures **R** | Both are right about what each did: the main audit recomputed the kernel nodes (CERT §§1–3), the second did not. The main audit's status is used |
| 10 | A-shell cost 0.24: "inherited" in the main audit; "P, exact replay passed" in the second audit | Recorded as in 6.2.1 |
| 11 | MON §4b: g_B/g ∈ [0.505,0.56]; LOG §45 and J3: false at the flank and upper rows | The ratio counterexamples stand. The distinct common-centre comparison 7.1.4 is now certified globally at the peak (A15T); no all-profile comparison follows |
| 12 | MON §4b table: the directional envelope (0.2393) is "numerically feasible"; MON §4 and LOG §29: obstructed above 0.2405 | The obstruction, with the caveat that no archive of it exists (13.2, item 30) |
| 13 | MON and LOG label many certificates "replayed green by the user" and the tables print [C] | In this file a certificate is **C** only if an audit replayed it; otherwise **R** |
| 14 | MON §4: "the zero-tensor and non-normal examples have no content at all" | False for q₀ (fifth content moment −243; REP §3 item 3) |
| 15 | MON §3.2: a sign-indefinite conditional cross term "cannot occur in H₂,₁" | False (5.3) |
| 16 | The name "flank": (0.7564, 0.76, 0.1192) in October and in LOG §6; the row with t = 0.86, (0.7564, 0.87703, 0.15175), in LOG §7 (to rounding the row later called "upper"); (149/200, 4267/5000, 1467/10000) from LOG §12 on | The November certificates' names (section 0). The upper row (0.7564, 0.877, 0.152) does not occur in the October material |
| 17 | σ* at the flank row (0.745, 0.8534, 0.1467): 0.20 in `OCT/pipeline-gate/KSIDE.md`; 0.1726 in MON; LOG §11a: "0.20086, 0.17262, 0.16172, not 0.20, 0.20, 0.16" | 0.1726 (the log's correction) |
| 18 | 𝓚(0.0463): 0.1913 in LOG §20; 0.16669 in LOG §23 and in the script log; certified interval (0.166781, 0.166783) | The certified interval (**R**); the two earlier values are floating point |
| 19 | Weak-form allowance: 1.3·10⁻⁴ in the handoff of 12 October and in `PROMPT_GPT_K_MINIMAL.md`; 1.0·10⁻⁴ later (precisely 1.0061·10⁻⁴ above S in DIG §2) | The later value; L6 must recompute it exactly |
| 20 | K₅: open in the October material; "false by about 10⁻⁴ at flank rows" from 4 November | The November numerics (**N**, 12.3) |
| 21 | Ceiling of the cubic witness: 1.402258, 1.402259, 1.40226, 1.4022581 (ε* = 0.75637), 1.4022581233 | The same quantity at different precision; `docs/overview.tex` prints 1.4022581233 |
| 22 | The n = 6 holdout at u = 0.0463: 0.0875215483 without the Wick control variate, 0.0874917600 with it (same tensor, same seeds); the two approximate 95 % intervals miss each other by about 3·10⁻⁷ | Unresolved; no report discusses it. Both are far below 0.10 |
| 23 | Dates: every file of `ai-notes/` and the log itself have modification times on 5 November, while their text carries stamps up to "6 Nov ≈18:40" and LOG §45 "next day-clock" | The provenance lines of the copies give the file dates; the documents' own stamps are quoted as printed |
| 24 | K′: `ch7`, the digest (§2) and LOG §11b say the measurement of the first-chaos penalty "did not run"; `ch20` corrects this (the script and its log exist; raw penalty 16 to 31 % of the mixed-gain allowance on the junta family, usable part 7 to 14 %). The report of 15 November proves Λ̂ ≤ Λ and the remote bound without reference to the October statement | `ch20`: the measurement exists, and Λ̂ = Λ_P with its remote bound dates from 15 October (2.10a) |
| 25 | `optimizer_audit.md` names its author as a sub-agent of codex-a713; `NUMERICAL_REVIEW.md` calls it "of unknown external provenance"; `REPORT.md` adopts from it only the candidate polynomial, which it re-optimised itself | Its numbers are quoted here only where a second implementation reproduces them (6.4.2) |
| 26 | K′ relief: 7 to 14 % of the mixed-gain allowance on the junta family (`ch20`; 16 to 31 % for the raw penalty, `kprime.log`; K_rot 13 to 57 % of the measured mixed gain), against 83 to 89 % of the sector gain removed when the retained element is optimised together with the sector (15 November; 11.15, 11.16) | **Different quantities; both stand.** The October figures are subtractions at fixed sectors (13.4, items 50 and 51). The November figures are the supremum over the sector amplitudes of the minimum over the retained element (**N**; peak row, A and B sectors, two remote variables). The retained element also changes the cost and the first-order term (11.13, 11.14), which a subtraction at fixed sectors does not see |
| 27 | Labels of REV and KPR against this file. REV defines **C** as "checker replayed" and prints it for the package verifier that the reviewer replayed (Proposition 5 and the constants); KPR defines **P** as "proved (short argument given here, or cited)" | Here a verifier replayed only by its recipient is **R** (11.6; the enclosure of the constant in 11.3), and a **P** of section 11 names who re-derived it (section 0). No statement differs, only the labels |
| 28 | STATUS 4.1 and 5.2 omitted independence assumptions present in the original theorems | Restore H independent of Z and 𝓕 independent of Z. Explicit counterexamples to the broadened L² statements: 13.7 and A15 `CLAIMS.md` |
| 29 | STATUS 3.3 called both October packages sharper | 1.05·10⁻⁵ is larger than 10⁻⁵. Its replay is conditional on stored scalar grids; the 3.6·10⁻⁷ package is sharper and replayed end to end, peak only |
| 30 | MON §4b rounds the flank zero-core d-cost to 0.36 | The cited tangent method certifies 0.356; its exact coefficient is 0.35662424897376…. STATUS 5.4 already used the safe value. A15 `ODD_COST.md` independently certifies it |
| 31 | STATUS 11(c) equated remote L1 with D≥0 up to η | Restore the nonnegative Gaussian optimization slack; the valid conditional assembly is 11.23 |
| 32 | README/MON response summary: total energy .072 throughout the central region | The source requires t≥.8456 at peak ε; use .081884 at t≥.84 (2.12a). A15R re-derives the ellipsoid and recomputes its scalars |
| 33 | MON §3 defaults to the full box, but its zero-core odd costs are row-specific | Positive odd pure cost fails at an application-box corner (5.4a); sharp one-coordinate cost still holds throughout the box (2.6) |
| 34 | First audit called flank .36 too large for its tangent certificate without claiming a functional counterexample | A15R now proves an explicit genuine cubic counterexample; the valid .356 ledger value stands |
| 35 | STATUS parity/first-variation summaries omit regularity or base restrictions | Algebraic frequencies hold for all G; derivative conclusions require an even base and existence. Genuine even cubic bases have the first derivative (2.8–2.9) |
| 36 | STATUS 6.1.1 presents the .0223 strip as a consequence of the linear orthogonality bound | It comes from a separate concave-envelope estimate; substituting (.0463,.0223) in the linear bound gives an increment .015269848, far too large |
| 37 | MON §6 summarizes the homogeneous-sum fourth-moment criterion using only EX⁴≥3 | The cited primary paper also assumes centered, variance-one inputs with EX³=0; its asymptotic theorem is not a finite-amplitude content bound (A15R `FOUNDATIONS.md` §5) |
| 38 | A15/A15R leave the peak common-center .007 kernel comparison open; finite node checks pass | A15T closes the exact all-v target using complete monotonicity, a 79-cell continuum certificate and an infinite-tail bound (7.1.4). Earlier ratio counterexamples still stand |
| 39 | Earlier proof-status text predates Claude's review and dated source amendments on #399 | The review and its exclusions are recorded in A15R `REVIEW_claude-b9ee.md`; A15T preserves every existing source at the merged baseline and keeps its own new proofs pending external review |
| 40 | STATUS 6.3.9–6.3.9a list character/core conditions but omit the source's cubic-chaos membership | Require p,h∈H₂,₁. The weighted estimate fails for arbitrary off-character L² functions (13.9/74); the source proofs and new /90 result retain the hypothesis |
| 41 | TILT-REV, in its remarks on the localisation 11.35: the term F(q) − F(0) ≥ 0 that the proof of 11.26 drops has no dimension-free lower bound "from the fourth moment alone" | **It has one**, and the later versions of the report use it (11.27; re-derived in TILT-REV2). C(t) ≥ √(4 + t²) − 1 for the circular mean of 11.25 gives F(q) − F(0) ≥ E[V·g(V)] with V = \|q\|² and g(v) = 2/(√(4\|L\|² + v) + 2\|L\|), which is decreasing and convex in v. Jensen under the size-biased law of V and the cap E\|q\|⁴ ≤ 44u² then give F(q) − F(0) ≥ u·c(u), where c(u) = E[g(44u)] decreases in u and c(0.0463) = 0.7036 (**N**; `code/record-checks-2026-11-15/localisation_check.py`; the report certifies c(0.0463) > 7/10). The rest of the remark stands: on the Wick monomial the true term is 0.0512 and would give the radius 0.29, and the radius 0.085 is out of reach of both |
| 42 | TILT-REV as first written (03:31), on the explicit constant of 11.29 and in its table "what it is worth": the supremum of m_h is about 244, at v = 0.46; the structural bound with the true E m_h is 2.61·10⁻⁷, 1.79·10⁻⁴, 8.22·10⁻³, 2.30·10⁻¹ at u = 0.0005, 0.005, 0.02, 0.0463 on the Wick monomial, that is 0.03, 0.39, 2.1, 19 times the deficit, "a factor 5 to 50" short on [0.02, 0.0463] | **A numerical artefact**, corrected by the reviewer in an erratum at the head of TILT-REV and in TILT-REV2 §3: those figures used second derivatives of a cubic spline through a grid whose spacing jumps at v = 0.5 (`check_tilt_report.py`). sup m_h = 1.35, near v = 0.064, and the bound is 1.99·10⁻⁷, 1.20·10⁻⁴, 5.30·10⁻³, 4.89·10⁻², that is 0.026, 0.26, 1.4, 4.1 times the deficit (**N**; `check_tilt_report_2_part2.log`, and independently `code/record-checks-2026-11-15/tilted_content_check.py`, which has m_h(0.46) = 0.14). What stands of the conclusion: the bound is too weak at the energies that matter, by a factor 3 to 10 against a cost of 0.4, for the reason the review gives (D/δ falls from 0.73 to 0.13). The log `check_tilt_report.log` still has the old figures. The certified constant 848 of 11.29 is not affected: it is an upper bound, loose by a factor of about 800 |
| 43 | MON §3.3 / STATUS 3.5 call BNC the real form inside an equivalence | The proved arrow is BNC ⇒ real PVD ⇒ complex PVD. The complex equivalence is re-derived with its universal dimension/price quantifiers (3.5); no converse to BNC was supplied |
| 44 | `ch32` SEI closure omits a condition on the second summand | Explicit counterexample and two valid closures in 3.5a; historical source preserved, new correction in A15F `REFORMULATIONS.md` |
| 45 | README says the Gaussian adversary attains the cubic supremum; `ch32` displays fixed-n equality | Use a supremum over all finite dimensions, approached by a diffuse sequence; n=1 at the peak is a strict counterexample to fixed-n equality (13.11/80) |
| 46 | Third-audit ledger still says external review pending after approved #403 | Archive the review and apply only its stated scopes. A15F additionally checks the Arb benchmark implementation, six exact Bernstein transformations and the cited primary statements; no audit of Arb internals is claimed |
| 47 | New #408 recommendations use the rounded grid cost .300 as an exact joint target | Exact zero-core direction refutes .300 (7.4.8); test a smaller cost. In `secant_joint.py`, share=.375 is an angle parameter, about 30.9% B energy; the separate five-sector shares are energies |
| 48 | STATUS 11.38 / 11.43 infer a family conclusion from 56 numerical deficits | Qualify as the 56 sampled pairs, N; certified content bounds do not certify the sampled deficits or the intervening continuum. In 11.42 the decimal endpoint gives a strict inequality, not exact equality |
| 49 | A15T ALIGNMENT uses B for both −g_B and the Gaussian benchmark | Read B_ker in §§2–4 and B_Gauss in §5; the arguments are unaffected. Correction recorded here and in the new errata; original source unchanged |
| 50 | #409 review labels were omitted or broadened in the fourth-pass summaries | Archive the exact review and apply only its stated scope. Original joint global constants were excluded there; A15V now supplies a fresh complete derivation and exact certificate. Explicitly re-derive retained trial 11.12; older literature and large tilted-code exclusions remain |
| 51 | README called the remote part “the same statement for both” functionals | Use “the same raw cap is a sufficient input”. Their objective values can be strictly different (3.16); auxiliary benchmark W is not an admissible first-chaos multiplier |
| 52 | Historical provenance and numerical direction labels were lost in summaries | Restore the benchmark replay/floating comparison, original joint-reduction attribution, 13-November advice, .128 four-sector scan and KPR §12/log references. The .58/.42 split is energy; the secant search share is an angle parameter |
| 53 | TILT §5 (sixth version): "`python3 -I verify.py` replays the full active chain" | Its own `results.txt` says that this combined command was not rerun as one invocation after the extension: the evidence is the earlier full secant run (`results_secant_history.txt`) plus the run of the new chain (`verify.py --deficit-only`, `deficit_integrated_results.txt`), and the default command fails outside the repository layout (11.52 (5)). What stands: those two runs, each replayed by TILT-REV4 (the deficit chain in a copy with the repository layout); the combined command is untested as one invocation |


## 15. Open problems, in the order the audit suggests

1. **The finite-amplitude joint A/B remainder bound** (7.4), first at the peak row, now with certified alignment 7.1.4; by IMP-JT with A15V’s sharper shift tail it is enough to prove
   the box inequality on 0 ≤ x ≤ 29/10, |α|, |β| ≤ 0.4 with reserve 7.53·10⁻⁵. If it fails, a direct optimised joint
   content and remainder inequality that uses the benchmark slack. Numerically (**N**, 11.45) no box is needed: for K
   the grid suggests a positive all-amplitude cost, but **.300 is impossible** even locally (7.4.8).
   Test a safely smaller cost such as .29 before attempting a global certificate (five real parameters); that
   cost remains unproved. The signed fallback retains the certified .08 zero-core reserve and the shorter
   shift interval (7.3.1, 7.4.5). The tilted A-only analogue is already closed by 11.39.
2. **A dimension-uniform finite-amplitude content theorem** for general cubics on [0.00551, 0.0463] (6.3.18), with a
   constant fixed by item 1 (0.10 under the adverse joint hypothesis). Pieces: the mixed shells (6.3.16), several
   self-interacting drivers (6.3.17), the envelopes (★) and (†) (6.3.13, 6.3.14).
3. **Use the now-certified peak alignment** (7.1.4) in a genuinely joint A/B estimate; the global .007 scalar target is closed. A content bound for arbitrary cubics and the finite-amplitude joint hypothesis remain open.
4. **A uniform cost for the z-odd sectors** over genuine nonzero even cubic cores at the required rows (7.2.4); full-box odd nonincrease is false (5.4a).
5. **The remote part on all rows**: peak replay is complete at tolerance 3.6·10⁻⁷ (3.3), and the narrow profile tube
   3.11 and the larger one-sided rectangle 3.15 are covered. Generate and replay certificates for the actual remaining row envelope; the flank/upper rows
   are outside that tube. The missing package of 11 (b) remains unchecked. Exact K-a (3.6) is not needed for 1.402.
6. **Coverage of the response-feasible regions outside R**, then **the consumer** (section 8). The central interval has an exact conditional single-peak-row component now; use the corrected t-dependent energy caps (2.12a). Cover the complementary t regions with a fixed witness ε. The σ* = 0 corner needs treatment only if a chosen row cover uses it.
7. In parallel: the same questions for **Λ̂ = Λ_P** (section 11), the row functional with the first-chaos penalty
   retained. Its local costs are larger (11 (a)). On what was tested on 15 November (**N**: peak row, A and B sectors,
   remote cubics in one to three variables) the sector inequality gain ≤ D + η has a margin of about 40 with the
   penalty retained, against about 6 for K (11 (c)). Open, after REV §4 and KPR §§8 and 11: more than three remote
   variables, where the retained ratio may still rise and a sampling method is needed (11.20); the other rows; the
   z-odd sectors and the B-sector. **The tilted A-sector is no longer open** (15 November; the sixth version of the
   report, reviewed in TILT-REV4): the lemma (\*) holds at the tilt 3/5 and the peak row for every remote cubic with
   u ≤ 0.0463 and every remote linear form (11.51), and with the remote cap 3.3, Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ there.
   Its pieces are the global remainder bound 11.39, the content coefficients 11.49 and the content-to-deficit cover
   11.50. The earlier routes (curvature and localisation, 11.33 and 11.35; the augmented certificate, 11.44, carried
   out by the fifth audit on two classes, 11.47–11.48; content against deficit through a common quantity, 13.10,
   item 75) are not needed for it. What remains for K′ (TILT-REV4 §6):
   - **A and B jointly.** Numerically the global remainder bound holds for the A and B shells together (margin 0.252
     at the tilt (0.6, 0); 11.45), but the joint raw A/B local cost is 0.2985, not 0.300 (7.4.8): a joint bound needs
     a smaller constant, or the compact box of 7.4.5.
   - **A B-content bound.** The certified alignment 7.1.4 reduces it to A-content.
   - **The odd sectors.** z₁Q and z̄₁P numerically (0.128 = k₁ with A and B; 11.45); the one-coordinate cubic
     d·z₁(T − 2) separately, after integration (13.10, item 77).
   - **The consumer outside the central row** (section 8), with the other rows (3.11, 3.15).

   Also open: more than three remote variables for the numerics (11.20). The augmented certificates 11.47–11.48 of
   the fifth audit are special cases of 11.51, except that 11.47 stays below S, not S + 2·10⁻⁵, on u ≤ 0.021; the
   finite moment bank that they use cannot reach u = 0.04, χ = 4 (13.12, item 83), which 11.51 no longer needs. The
   raw remote cap itself remains 3.3.
8. Independent of the above: the **identity-tail witness** (section 10), which raises the model ceiling and is
   untested at certificate level.

The audit's advice: continue only as a bounded research programme with an explicit decision point, not as a
near-complete route to an additional 0.0005.
