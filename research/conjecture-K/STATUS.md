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
Its new proofs are **P, by their author, not externally reviewed**; within-session peer checks are identified
separately. Previously verified large certificates are inherited unless a fresh check is explicitly named.

**Entries of 15 November (section 11, and 2.10a).** The audit predates them, so their labels name the checker.
In 11 (a) **P** means: proof read and re-derived by claude-b9ee, who did not write it (record: REV). A verifier
replayed only by its recipient stays **R**, as everywhere in this file (REV prints C for it). In 11 (c) the
statements are claude-b9ee's own: **P** there means that a short proof is written out in the source and was
re-derived line by line when this file was assembled, by the sub-agent of the same session that assembled it;
nobody outside that session has reviewed it. **N** has its usual meaning.

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

Rows: **peak** (ε, ℓ, β) = (1891/2500, 1057/1250, 179/1250), **flank** (149/200, 4267/5000, 1467/10000), **upper**
(1891/2500, 0.877, 19/125). "Three rows" means these. Before 5 November "flank" named other rows (section 14).

## 1. Bottom line

1. The exact gate-free row is proved (**P**). K itself is open, and no violation of K on the parameter box has been
   found by any search (**N**).
2. Of the six layers of a proof (README, part (c)), none covers the full required row envelope. The follow-up audit
   replayed L1 at the **peak profile** with tolerance 3.6·10⁻⁷ (**C**, existing sixth-moment input retained),
   and L2 inherits that tolerance there. Other rows remain open; an explicit narrow profile tube is covered (3.11).
   L3 is **R**.
   L4 has real theorems for structured families (**P + C**) and is open for general cubics. L5 is open. L6 has an exact conditional central component (section 8), but no complete consumer.
3. The numerical supremum of the content-to-deficit ratio C²/D at the peak row and top energy is about 0.0876
   (**N**; n ≤ 6 by the audit, n ≤ 10 by our scan), against proved family constants 0.22 to 0.239 and against the
   targets 0.10, 0.15 and 0.24. Which target is the right one depends on a joint A/B estimate that is missing.
4. The audit's central finding: **a proof of the content bound with constant 0.10 would not close the A+B core**
   with the separate A-cost and B-cost theorems. A finite-amplitude joint A/B remainder bound is missing (section 7.4).
5. Since the audit: an identity tail lifts the model ceiling to 1.40248 (**N**, section 10); retaining the first-chaos
   penalty (the functional Λ_P of October, 2.10a) gives a weaker sufficient statement with larger local costs
   (section 11 (a)); an external claim about the remote part is unchecked (**R**, section 11 (b)).
6. 15 November, numerical (**N**, peak row; section 11 (c)): when the retained first-chaos element is optimised
   together with the sector, the largest sector gain found is about 0.025·D(q), against 0.166·D(q) for K. The
   sector inequality gain ≤ D + η then has a margin of about 6 for K and about 40 with the penalty retained, on what
   was tested: the A and B sectors over remote cubics in one and two variables, and the A-sector in three. The
   retained ratio rises slowly with the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463) and its limit
   is not known. No theorem; the remote part is untouched.

## 2. The statement and its reductions

| # | statement | scope | status | where |
|---|---|---|---|---|
| 2.1 | Exact gate-free row: Re⟨f, T_εg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G) | every real ℓ, β and ε > 0; the dropped terms are ‖P₁,₀k‖², ε‖P₂,₁h + B/ε‖² and the pointwise phase slack; no hidden premise | **P** | REP §1; ADD §1; `ch7` (prop:row) |
| 2.2 | Conjecture K: Λ(G) ≤ S for every n and G ∈ H₂,₁(ℂⁿ) | the box ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16] | **open** | README (a) |
| 2.3 | No violation found | October: all of H₂,₁(ℂ²) + W (excess +1.4·10⁻¹²), H₂,₁(ℂ³) + W (+4 to 5·10⁻⁹, grid artefact), scale mixtures, a 10-parameter limit family. 4 November: full tensors in d = 3, 4, 5 at three rows (every candidate below S on 2·10⁷ fresh samples). 6 November: H₂,₁(ℂ²) with all six sectors, 18 shells (every value of Λ − S negative) | **N** | DIG §3; `ch7` ("Attacks on K"); LOG §6, §31; `code/experiments-2026-11-04/e4_kattack.py`, `e11_ksector.py` |
| 2.4 | K for every profile and every ε ("K_all") is false | K for every ε is equivalent to same-norm domination on every variance sphere; that fails for profiles with ℓ − 2β of order 10⁻¹⁰ to 10⁻³⁰ at tiny norms. No violation is known on the box | **refuted** (**R**: explicit examples in the notes received; not in the audit ledger) | MON §1; LOG §8a, §10; `RCV/chatgpt-thread2-gaussian_domination_note.tex` |
| 2.5 | The corner (ε, ℓ, β) = (0.74, 0.90, 0.12) has σ* = 0 | Theorem B (5.2) covers it; several other proofs need σ* ≥ 0.1 or a/β in [11/4, 11/2] | **R**; open as part of L6 | MON §1; DIG §2; ADD §3 |
| 2.6 | n = 1: sup Λ = 2E\|L\|, attained only at G = 0. At the peak this is 387√π/500 ∈ (1.371879280600869, 1.371879280600870) < S | **entire application box**: Λ(dZ(T−2)) ≤ 2E\|L\| − k_*‖dZ(T−2)‖². The sharp uniform cost k_* is k₃ at (ε,ℓ,β)=(.76,.76,.16), in (0.151676198434561,0.151676198434562); 0.15167 is a safe rational cost, improving 3/20. Embedding this axis in larger dimensions does not cover arbitrary G | **P**, new sharpness argument by author, not externally reviewed; scalar **C** with `odd_cost_check.py` and A15R `sectors_exact.py`. The optimum at the peak is an old result | A15 `ODD_COST.md`; A15R `SECTORS.md` §§2,5; original package in `INVENTORY.md`; REC §6.1 |
| 2.7 | L has the law of √V·W (a circular Gaussian scale mixture); φ(v) = 2E\|L + √v\| has a completely monotone derivative | every a, b > 0 | **P** | ADD §5; IMP-CE; `ch32` |
| 2.8 | Frequency rule: after factoring the phase of z₁ the sectors carry frequencies q,A: −1, B: +1, z₁Q and d·z₁(T−2): 0, z̄₁P: −2; no cross terms in E[\|G\|² \| T] between different frequencies | every G for this algebraic statement. At a fixed even cubic base only A and B **among visible-sector perturbations** can have nonzero first variation; an arbitrary cubic base need not be even | **P**, independently re-derived in A15R; the derivative qualification is 2.9 | MON §2; DIG §4; `ch11`; A15R `SECTORS.md` §6 |
| 2.9 | Parity: for H even and O odd under z₁ → −z₁, Λ(H + O) = Λ(H − O). The odd first derivative vanishes **when it exists**, and mixed even/odd Hessian entries vanish **when that Hessian exists** | parity for every even L² base; first differentiability holds at genuine even cubic bases because L±H are nonzero polynomials. General even L² bases can have a cusp. No finite-amplitude monotonicity follows | **P**; qualification and explicit cusp **P by author, not externally reviewed** | REP §1; ASM §3.2; LOG §34; A15R `SECTORS.md` §6 |
| 2.10 | K′ (retained penalty): Λ′(G) ≤ Λ(G), the row holds with Λ′, and K′: Λ′ ≤ S would suffice | Λ′ keeps −‖P₁,₀k‖² and the constraint εP₂,₁k = G | row with Λ′: **P**, independently re-derived in A15R; K′ itself: **open** | DIG §2; `ch7` ("Side experiments"); A15R `FOUNDATIONS.md` §3 |
| 2.10a | First-chaos dual: Λ_P(G) := inf_{a ∈ H₁,₀}{‖a‖² + E\|L + G − a\| + E\|L − G + a\|} − ‖G‖²/ε satisfies Λ′ ≤ Λ_P ≤ Λ, so sup Λ_P ≤ S + η is sufficient for K′ and weaker than K. For remote q: Λ_P(q) ≤ Λ(q) − ‖P₁,₀F₀(q)‖²/(1 + H₀/2), F₀(u) = E_{z₁}ph(L + u), H₀ = E\|L\|⁻¹, H₀/2 ≈ 1.4319737913 at the peak (multiplier ≈ 0.4112) | every G; the remote bound for every square-integrable remote q. This is the Λ̂ of the report of 15 November (section 11) | Λ_P ≤ Λ, the row with Λ_P and the remote bound: **P** (re-proved in the report of 15 November; proofs re-derived by claude-b9ee, 11.1 to 11.3). Λ′ ≤ Λ_P: **P**, independently re-derived by A15R `FOUNDATIONS.md` §3 from weak duality. The manuscript of 15 October prints [P], and [F] for the constant | `ch20` (section "A valid first-chaos dual for K′"); `ch17`; REV |
| 2.11 | K_rot: the row with an extra negative term −‖2βr_A + √2βr̄_B‖²/(ε²t² + 9ε‖G‖²) | only at a global norm maximiser; pays 13 to 57 % of the measured mixed gain; no cap proved for it | **R** | DIG §2; `ch25-parts/10-exact-duals-rotation-profiles.tex` |
| 2.12 | Response-side cuts (25 proved constraints on actual responses: remote energy e < 0.046266 for t ≥ 0.84, sector ellipsoid, closed-form ellipse e + (191/500)t² ≤ 9/40 ⇒ cap 0.71315, anisotropic and weighted caps covering e ≤ 0.0148, …) | actual responses only; not valid inside a raw-K supremum; penalties using the same square must not be added twice | **R** ([P] or [P,C] in the manuscript) | DIG §1 |
| 2.12a | Regional response energies at ε=1891/2500: for t≥.84, remote energy <.046266 and total energy <.081884; total energy <.071981 needs t≥.8456; at t≥.851 the total cap is .062431 | actual responses only. The unrestricted .072 total-energy reading is false; an explicit response at t=0 has energy >.0939738 | **P + C**, existing response ellipsoid/Rice tangent independently re-derived and freshly checked; no upgrade of all constraints in 2.12 | A15R `FOUNDATIONS.md` §2; `foundations_exact.py`; `ch25-parts/30-response-feasibility.tex` |
| 2.13 | The retained-dual minimum has a unique minimizer a*, with ‖a*‖≤√π/2. At a trial a, let k_a be the half-difference of support phases and r=a−P₁,₀k_a; then J_G(a)−‖r‖²≤min J_G≤J_G(a), and ‖a−a*‖≤‖r‖ | every finite dimension; full first-chaos projection, not a selected direction. Certifies the inner minimization only, not the outer tensor/sector maximum | **P by author, not externally reviewed** (standard strong-convexity corollaries); existence/uniqueness already in the projection package | A15R `FOUNDATIONS.md` §3 |

## 3. Layer L1: the remote part (G = q independent of z₁)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 3.1 | Reduction of remote K-a to a moment problem for U = \|q\|²/v (two-point extremal laws, cubic Hermite majorants of φ, secant envelope in the variance) | every profile | **P** | REP §1; ADD §5 |
| 3.2 | Remote cap: Λ(q) < 2747927/2000000 = 1.3739635 < S + 10⁻⁵ for every remote cubic | **peak profile only**; uses EU = 1, EU² = 2 + x², EU³ ≤ 6 + 9x² + 40.45313x³, 0 ≤ x ≤ 31/4; 51 interval bands (Arb). The row box and the envelope are not covered | **R** (Arb package of 15 October, not replayed by the audit) | REP §1, §3 item 12; ADD §5; `ch24`; `ch22` |
| 3.3 | October packages: (i) Λ(q) < S + 0.0000105; (ii) **Λ(q) < 1.373953883 < S + 0.00000036**, every finite dimension and every variance | **peak row only**. (i) is weaker than 3.2's 10⁻⁵ allowance and uses C₆ = 1977/40; (ii) uses the existing C₆ = 40.45313 theorem. Neither proves same-variance domination D(q) ≥ 0 | (i) exact algebra replayed **C conditional on stored kernel grids**. (ii) **P + C**, proof implication inspected and acceptance replayed with all profile integrals freshly recomputed: 68 profile caps, 45 Stein nodes, 154 outer boxes, zero/high-variance rays, and Gaussian benchmark. Replay repeated by claude-b9ee on a second installation (PASS), with the Stein identity and the dual identity re-derived (A15 `REVIEW_claude-b9ee.md`). Not Lean; its inputs about cubic chaos (sixth moment, the two spectral budgets, the covariance order, the Stein identity) are Lean theorems of the lower bound (`Moments`, `SteinInputs`, `SteinCut.spec`), up to the mesh of the test functions (A15 `REMOTE.md` §3a). Not a new theorem for the moment input | A15 `REMOTE.md`; `remote_replay.py`, `remote_rational_audit.py`, `remote_legacy_replay.py`; `INVENTORY.md` |
| 3.4 | The sixth-moment input E\|q\|⁶ ≤ 6u³ + 9uδ + C₆δ^{3/2}: tensor bridge in Lean (`Circular.tensorFacts`, `Circular.gaussian_sixth`, `gaussian_moments`) | a moment input; **not** a Lean theorem for the remote cap, and none was found | source-level observation by the audit (no build) | ADD §5 |
| 3.5 | Exact K-a (η = 0) for every profile ⇔ PVD: E\|N + q\| ≤ (√π/2)√(V + E\|q\|²) ⇔ (buffer closure) E\|q\| ≤ (√π/2)‖q‖₂ on H₂,₁; real form "BNC" | equivalences | **R** | MON §3.3; DIG §2; `ch32`, `ch34` |
| 3.6 | E\|q\| ≤ (√π/2)‖q‖₂ on H₂,₁ | all cubics | **open**. Proved cases of the real form BNC (**R**): order 2; one-variable H₃ at every scale; the family aH₃(g₁) + bH₂(g₁)g₂ (130 exact boxes); Gaussian scale mixtures. Exact K-a (**R**): the one-coordinate star, all of H₂,₁(ℂ²), Gaussian scale mixtures | MON §3.3 |
| 3.7 | Weaker radius: E\|q\| < 0.9695084‖q‖₂ for every Wick cubic; later 0.95133 | all cubics | **R** ([P,C] in the manuscript) | DIG §1 item 19; `ch60`, `ch62`, `lower-bound/real-stein-radius.tex` |
| 3.8 | D₁ in degree 2 (real): E\|X\| ≤ √(2/π)‖X‖₂ for X = Σλ_i(g_i² − 1), strict for X ≠ 0; also for weighted sums of independent centred Gammas plus a Gaussian | real second chaos only; uses Yamazato's unimodality theorem | **R** (written proof by a worker of claude-b9ee, 4 November; not audited). The degree-3 and the complex charge-one cases are open | `sources/d1/` |
| 3.9 | Remote "closure" claims of 15 November | see section 11 | **R**, unchecked | EXT-R |
| 3.10 | With the first-chaos penalty retained: Λ̂(q) ≤ Λ(q) − ‖P_rem m(q)‖²/(1 + j₀) for every remote q | see section 11 | see section 11 | EXT-P |
| 3.11 | Profile transfer: write λ = ε/(1891/2500). The peak remote cap implies Λ(q) < S + 8.1·10⁻⁵ whenever ε ∈ [0.74,0.76] and \|a−λ·699/1250\| + (3/2)\|b−λ·179/1250\| ≤ λ/50000 | every finite dimension and every remote cubic; a narrow continuum tube with a,b > 0, **not** the full row box or the flank/upper rows. General error transfer: λη₀ + 2√π times that shape distance, η₀=3.6·10⁻⁷ | **P, by author, not externally reviewed**; rational error arithmetic **C** in `remote_rational_audit.py`, using 3.3(ii) | A15 `REMOTE.md` |
| 3.12 | Dense-test extension: every spectral cut E G(U) ≥ 0 whose test function is continuous, piecewise affine with rational knots and constant on its final ray follows from the cuts of the Lean family (knots at squares of rationals, zero on the final ray) by uniform approximation, with E\|G_n − G\| ≤ δ[(M+\|β\|)/(2λ) + \|A_f\|/λ + 2(M+\|A_g\|)/μ + 2] + δ²[1/(4λ) + 1/μ] | any law with EU = 1 and EU² < ∞ that satisfies the square-mesh cuts; the same rational λ, μ, t, β, ν. So the 45 duals of 3.3(ii) need not be chosen again for a formal port; the approximation and the limit still have to be formalised | **P, by author (codex-a7c4)**; re-derived by claude-b9ee in review. Not Lean | A15R `REMOTE.md` §4; A15R `REVIEW_claude-b9ee.md` |
| 3.13 | Convex-cell transfer: at fixed ε, if one family of remote q satisfies Λ_θᵢ(q) ≤ Uᵢ at the vertices θᵢ = (aᵢ, bᵢ) of a convex cell, and H is a concave lower bound of S on the cell with Uᵢ − H(θᵢ) ≤ η at every vertex, then Λ_θ(q) ≤ S(θ) + η throughout the cell | every dimension. H can be the supporting plane of θ ↦ 2E\|Z(a+bT) + √v₀W\| − v₀/ε at the peak (3.14). It replaces the first-order loss of 3.11 by a vertex-to-support gap; the count of about seven million anchors (A15 `REMOTE.md` §4) is for the method of 3.11 only. **No cell is certified: remote caps exist at the peak only** | **P, by author (codex-a7c4)**; re-derived by claude-b9ee in review | A15R `REMOTE.md` §5 |
| 3.14 | Gaussian benchmark at the peak by the direct Rice formula (I₀ and I₁ kept): 1.3739535256614828 < B(v₀) − v₀/ε < 1.3739535256614829 at v₀ = 403448/10⁷, hence 1.3739535256614 < S < 1.3739535256616 again; gradient of the fixed-v₀ competitor ∂_aB ∈ (1.689944147450845, 1.689944147450846), ∂_bB ∈ (2.622896929056071, 2.622896929056073) | peak row; independent of the October benchmark code, which removed I₁ by integration by parts. No remote cap follows from it | **C** (160-bit Arb; replayed by claude-b9ee, and reproduced in floating point by plain quadrature) | A15R `REMOTE.md` §3; `remote_benchmark_crosscheck.py`; `review_claude-b9ee_spot_checks.py` |

## 4. Layer L2: the core with disjoint drivers (q independent of U)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 4.1 | Redistribution: F(H + (T−1)U) ≤ F(H + √b·W) for **mutually independent z₁, H, U**, U proper Gaussian, H square-integrable, and W fresh independent standard Gaussian, when b + h ≤ ℓ² (b = E\|U\|², h = E\|H\|²) | all amplitudes in that range; reduces the disjoint core to the remote bound **with the same η**. H independent of z₁ is essential; omitting it is false for general L² H | **P** with the corrected hypothesis. Counterexample to the broadened formulation: **P by author**, A15 `CLAIMS.md` | REP §1; ADD §4.1 (also omits the independence in its summary); `RCV/chatgpt-thread1-remote-cubic-comparison.tex`; A15 |
| 4.2 | Cost form: Λ(q + (T−1)U) ≤ Λ(q) − (1/ε − 199/(200ℓ))‖U‖² for mutually independent Z,q,U, q∈L², U centred proper Gaussian | every amplitude, every ε>0, ℓ>0 and β/ℓ∈[2/15,4/19]; hence the entire application box, with cost at least 1/152 there. No energy cutoff; no cubic assumption on q | **P + C**: the analytic potential bound re-derived and the previously unchecked full-box premise independently ported/replayed (12 profile intervals, 278 scale intervals, infinite ray) | A15R `REMOTE.md`; `remote_disjoint_cost.py`; ADD §4.2; `RCV/chatgpt-thread2-remote_cubic_and_linear_shell.tex` |

## 5. Shells without a remote cubic, and conditionally Gaussian adversaries

| # | statement | scope | status | where |
|---|---|---|---|---|
| 5.1 | Theorem A: if the Wick polynomial of G vanishes at z₁ = 0 (all sectors except A and q), then F(G) ≤ B(‖G‖²) (same-norm domination) | every amplitude; needs a/β ≥ 11/4; **requires q = 0** | **P** (complete analytic reconstruction; the originally named note was not found) | REP §1; ADD §2 |
| 5.1a | Theorem A’s q = 0 tangent argument does not extend unchanged to q ≠ 0 | a remote variance h adds a positive tangent correction (h/2)·I_H, I_H > 0; a quantitative extension holds for (19/11)h ≤ D/10 + E/2 | **P** | ADD §2; LOG §11e |
| 5.2 | Theorem B: if **𝓕 is independent of z₁**, G is centred proper Gaussian given (z₁, 𝓕), with conditional variance s + u(T−1)² + bT + cT², coefficients nonnegative, integrable and 𝓕-measurable, then F(G) ≤ B(‖G‖²) | needs 0 < a/β ≤ 11/2 (tight for this proof); covers the σ* = 0 corner; **excludes arbitrary conditional cross-covariance**. Dropping 𝓕 independent of z₁ makes the general conditional-Gaussian statement false | **P** (no numerical premise), corrected scope; counterexample to broadened formulation **P by author**, A15 `CLAIMS.md` | REP §1; ADD §3; `RCV/chatgpt-thread2-gaussian_domination_note.tex`; A15 |
| 5.3 | A genuine cubic can have a sign-indefinite conditional cross term: X[(T−1) + (\|Y\|²−1)] has conditional variance [(T−1) + (\|Y\|²−1)]² | so shared-driver cubics are not covered by 5.2 | **P** | REP §3 item 10; ADD §3 |
| 5.4 | Odd-in-z₁ sectors over the **zero** core: Λ(O) ≤ Λ(0) − k₁v − k₃h for O = z₁Q + z̄₁P + d·z₁(T−2), v = E\|Q\|² + E\|P\|², h = 2\|d\|², (k₁, k₃) = (0.128, 0.330), (0.156, 0.356), (0.166, 0.361) at the three rows | every amplitude, every dimension; zero core only. More generally Q,P may be arbitrary remote L² variables with E Q=0 | **P + C**, independent derivation and fresh standard-library rational scalar certificate by codex-a7c4, same-session review; no external review | A15 `ODD_COST.md`, `odd_cost_check.py`; MON §4b; LOG §35; `RCV/odd_sector_certificate/` |
| 5.4a | The zero-core coefficients k₁=p−J₁ and k₃=p−(J₃−4J₂+4J₁)/2 are sharp on the Q and d axes. At (ε,ℓ,β)=(.76,.76,.16), O=(i/100)Z(\|Y\|²−1) gives Λ(O)−Λ(0)>7·10⁻⁶. At the flank, O=(i/100)Z(T−2) violates the claimed cost .36 by >5·10⁻⁷ | genuine cubics; refutes full-box odd nonincrease and the historical rounding, **not K** or the valid three-row costs of 5.4. This also yields the sharp n=1 constant in 2.6 | **P by author, not externally reviewed**, exact finite-amplitude scalar **C** | A15R `SECTORS.md` §§2–5; `sectors_exact.py` |
| 5.5 | Manuscript theorems on buffered and small-amplitude classes (polarised class S − α²/10 − β²/4; Gaussian-factor drivers S + 5·10⁻⁵; complete coherent one-driver A/B with buffer; several small drivers; arbitrary coupled tensors with buffer g ≥ 9/40 or e ≤ 1/200; global exclusions) | as stated in the digest; most need a Gaussian buffer or very small energy | **R** ([P,C] in the manuscript) | DIG §4 items 4 to 10 |

## 6. Layers L3 and L4: the core q + (T−1)U with shared drivers

Write u = ‖q‖², w = ‖U‖². The rectangle is R = {w < 0.01125, 0.00551 + 0.319w < u ≤ 0.0463}.

### 6.1 Outside the rectangle (L3)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.1.1 | Orthogonality-only bound: Λ(q + (T−1)r) ≤ B₀ + 0.38968u − 0.12432w | any jointly distributed square-integrable q, r independent of z₁ with E[q̄r] = 0 (no chaos structure used). The linear estimate gives Λ < S + 10⁻⁴ for u ≤ 0.00551 + 0.319w. The strip w≥.0223 (u≤.0463) uses a **separate concave-envelope estimate**, not this linear bound | **R** ([P,C] in the manuscript; not in the audit ledger) | DIG §4 item 1; `lower-bound/sharp-circular.tex`; `ch61`; A15R `REMOTE.md` §1 |
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
| 6.3.9 | Content extension: if p has charge one under rotation of a coordinate block, h has only the other characters, D(p) > 0 and C(p)² ≤ (9/40)D(p), then ‖p + h‖² ≤ 0.0463 and ‖h‖² ≤ (3/500)D(p) imply C(p+h)² ≤ (6/25)D(p+h) | peak row, every dimension; the core inequality is an input (6.3.3 or 6.3.6); a neighbourhood only | **P** (derived by codex-a713 after the audit; independently re-derived and sharpened in A15R, 6.3.9a) | IMP-CE |
| 6.3.9a | Larger mixed-shell neighbourhood: under the same character/core hypotheses as 6.3.9, e=‖h‖²≤D(p)/100 suffices for C(p+h)²≤(6/25)D(p+h) | peak row, every finite dimension, total energy≤.0463; a 5/3 increase in the permitted remainder energy, not a general content theorem | **P by author, not externally reviewed**; exact scalar **C** for M₀<.836, M₁<2.16 and the final coefficient 91789/62500<3/2 | A15R `CONTENT.md`; `content_constants.py` |
| 6.3.10 | Older or superseded family results: Hermitian one-driver family 0.236364; Wick neighbourhoods p ≤ u/16 (49/211, u ≥ 0.03) and p ≤ u/12 (563/2420); second proof of p ≤ u/5 (47/200, u ≥ 0.03); the two templates X(\|X\|²−2), X(\|Y\|²−1) on R by two certificates; covariance-sensitive Gaussian-factor theorem (ρ ≤ 3/140) | as stated | **R** (not examined by the audits). As content inequalities with a constant below 0.24 they are contained in 6.3.3, 6.3.4 and 6.3.6; they carry sharper constants in special cases (ratio at most 0.103 for the Wick monomial and 0.055 for X(\|Y\|²−1) at the rows; (56/5)ρ for the Gaussian-factor class) | MON §3.4, §3.6; `RCV/hermitian_content/`, `RCV/wick_endpoint_extension/`, `RCV/wick_endpoint_one_twelfth/`, `RCV/r26_twenty_percent_extension/`, `RCV/chatgpt-shared_driver_rectangle.tex` |
| 6.3.11 | "Universal nonlinear content": \|C_X(q)\|² ≤ 50κ^{3/2} for every cubic; hence the content inequality with 0.19 for u ≤ 0.00038 (constant 1 for u ≤ 0.001) | every cubic, every dimension | **R** as a theorem: the replayed checker verifies scalar constants only and the derivation of the tensor identities was not found. It gives no deficit bound at the energies that matter (its coefficient is negative for u > 0.0017) | REP §1; CERT §7; DIF §4 |
| 6.3.12 | Tensor inequality ‖Π₁,₀(q\|q\|²)‖² ≤ (3√6/4)δ^{3/2} for every cubic; ≤ 0.481δ^{3/2} on the Hermitian one-driver class; lower example above 0.4808 | — | general constant **R**; the 0.481 bound for its class and the example: exact checker replayed (second audit) | MON §3.4; REC §3 |

**Open in L4** (nothing certified):

| # | piece | what exists | status |
|---|---|---|---|
| 6.3.13 | One driver with self-interaction, non-Hermitian P, Wick share between 1/16 and 4/5, u ≥ 0.03: envelope (★) giving 0.22 | tail proved (**R**); compact part true on grids with smallest margin 0.38 % of H (**N**); six local boxes certified by a thread, not a cover | **open** (MON §4; LOG §22, §23, §29; `RCV/integrated_wick_envelope/`) |
| 6.3.14 | Small-Wick strip (share < 1/16, c ≠ 0): candidate (†) with an affine weight, numerically 0.2306 | exact tail checker replayed by the audit (**C**) and a neighbourhood of share 0 of unknown width; the compact domain is not certified and 0.2306 is not an upper bound | **open** (CERT §3; LOG §27) |
| 6.3.15 | Same family for u < 0.03 with p > u/5 | nothing | **open** (LOG §26) |
| 6.3.16 | Mixed one-driver shells X̄B(Y), (\|X\|²−1)V(Y), X²W̄(Y), R₀(Y) with their cross terms | exact bookkeeping (6.3.8) and the neighbourhood lemma 6.3.9 | **open** |
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
| 7.1.4 | Kernel comparison: \|g_B(v) − 0.5053·g(v)\| ≤ 0.007 for all v ≥ 0, which would give ‖c_B − 0.5053c_A‖ ≤ 0.007√u by L² contraction | peak row | **open** (scalar target, not certified). The earlier interval g_B/g ∈ [0.505, 0.56] is false at the flank and upper rows (**C**: endpoints independently enclosed by A15 `claims_kernels.py`). ρ(0) = 0.50534, 0.50263, 0.50113 at the three rows (**C** enclosures in A15); finite v=.5 residual checks do not certify the common-center inequality for all v | REC §1, §6.3; ASM §4.1; LOG §30, §45; `RCV/J3_audit/` |
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
| 7.3.1 | At G = 0: Λ(sH) = 2E\|L\| − s²·Q₀(r_A, r_B) + o(s²) for H = (T−1)r_A + z₁²r̄_B/√2 with Q₀ ≥ 0.24‖r_A‖² + 0.26‖r_B‖² + 0.236Re⟨r_A, r_B⟩ + 0.07(‖r_A‖² + ‖r_B‖²) | three rows; infinitesimal, at q = 0. Exact peak entries: 0.3200545, 0.9402022, mixed 0.1179888 | **R** (certificate replayed by the user; the exact entries are reproduced by the package of 15 November, section 11) | LOG §38; `RCV/signed_joint_ab_hessian/` |
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
| 7.4.2 | Sufficient content constants γ (with k_A = 0.24, k_B = 0.26, ‖d − 0.5053c‖ ≤ 0.007√u, u ≤ 0.0463): favourable signed m = 0.118: γ = 0.24 gives excess ≤ 5.471·10⁻⁵; joint diagonal cost (m = 0): γ = 0.15 gives ≤ 1.438·10⁻⁵; adverse cross coefficient at most 0.118: γ = 0.10 gives ≤ 7.181·10⁻⁵ (exact threshold for 10⁻⁴: γ ≤ 4889900/47482107 = 0.10298…) | formulas **P**; diagonal/adverse excesses and adverse threshold independently checked exactly (**C**, A15 `claims_exact.py`); favourable signed excess retains **N**. **Conditional** on the joint hypothesis of each line and on 7.1.4, none of which is proved. None of these constants is necessary for K | REP §4; ASM §1; REC §1 |
| 7.4.3 | Separate axis costs do not imply a joint cost: the quadratic gain 2c_Aa + 2c_Bb − 0.24a² − 0.26b² + 0.40ab with c_A = 1/200, c_B = 0.5053c_A, Δ = 1/4000 satisfies both axis costs, c_A² = 0.10Δ, exact alignment and both amplitude caps, and exceeds Δ by 0.00033415 > 10⁻⁴ | **P** (exact rational arithmetic). Refutes the implication; not a cubic counterexample to K | ASM §2 |
| 7.4.4 | A positive mixed coefficient m does not make 2m·Re⟨r_A, r_B⟩ nonnegative for arbitrary phases | **P** | ASM §2, §4.2 |
| 7.4.5 | Reduction of the missing statement to a compact box: if r_x(α, β) ≤ Q(α, β) − η(\|α\|² + \|β\|²) for all complex x and \|α\|, \|β\| ≤ 0.4 with η = 7.53·10⁻⁵ (signed target: 8.07·10⁻⁵), then the joint bound holds for all remote q and all shells of variance ≤ 0.0113, with any dependence; the region \|x\| ≥ 6 is closed analytically, so only 0 ≤ x ≤ 6 remains | reduction **P** with exact rational checks (codex-a713, after the audit; not reviewed by anyone else). **The box inequality is open**; exploratory searches of it are diagnostic only | IMP-JT; IMP |
| 7.4.6 | Empirical margins of the content ratio against the three constants: 0.10/0.0876 = 1.142, 0.15/0.0876 = 1.712, 0.24/0.0876 = 2.740 | **N**. The margin 2.7 of the monograph is an A-only comparison | REP §5 |
| 7.4.7 | Direct values of the joint sector gain (15 November; not the remainder bound above): the supremum over the A and B amplitudes of Λ(q + sectors) − Λ(q) is at most 0.166·D(q) on what was tested, and about 0.024·D(q) when the first-chaos penalty is retained and its multiplier optimised together with the sectors | **N**; peak row; searches. The Wick monomial and tensors in two remote variables with the A and B sectors; tensors in three remote variables with the A-sector only. The retained ratio rises slowly with the number of variables (11.20). Method and limits: 11.15, 11.16, 11.20 | KPR; section 11 (c) |

### 7.5 All sectors together

Open. No theorem covers G = q + A + B + odd sectors with q ≠ 0: Theorem A needs q = 0, Theorem B needs Gaussian
drivers with a nonnegative profile. Numerically (**N**) every value of Λ − S is negative for G ∈ H₂,₁(ℂ²) with 18
shells at the amplitudes tested (LOG §31; `e11_ksector.py`). The audit's list of what L5 still needs: (i) the
finite-amplitude joint A/B control of 7.4, keeping the joint law of q and its drivers; (ii) a general B-content
bound or the certified comparison 7.1.4; (iii) uniform control of the odd sectors over a nonzero even core (REC §5).

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

## 11. The two reports of 15 November, their review, and the follow-up of the same day

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
claims an upper bound K_G^ℂ < 1.404896400821, which is weaker than the repository's proved 1.4046 and unrelated to K.

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
| 11.12 | **Tilted sector.** For every remote q, every remote linear form r and every real s: Λ̂(q + (\|z₁\|² − 1)·r) ≤ 2E\|L + q + (\|z₁\|² − 1 + s)·r\| − p‖q‖² − (p − s²)‖r‖². The A-direction T − 1 may be replaced by T − 1 + s if the penalty p on r is replaced by p − s² | the A-sector over a remote base; no B-sector, no z-odd sectors. Proof: take u = −s·r in the minimum; G − u is even in z₁ and L is odd, so the two expectations are equal; ‖u‖² = s²‖r‖². The argument does not use the values of the row | **P**: short proof in KPR §3, written by claude-b9ee and re-derived for this file (section 0); not reviewed by anyone else | KPR §3 |
| 11.13 | **Local cost and content of the tilted sector.** Expanding the right-hand side of 11.12: the second-order cost at G = 0 is k(s) = k_A − 2g₀s − (1 + j₀)s² = 0.320 + 1.670s − 2.432s² (0.320 at s = 0; largest, 0.607, at s = −g₀/(1 + j₀) = 0.3434; 0.6066 at the October value s = 1/3; positive up to s = 0.843). The first-order term in r is 2Re⟨r, Π₁[q·h_s(\|q\|²)]⟩ with h_s(v) = (g(v) − g₀) − s·(j₀ − j(v)): the content c = Π₁[q·g(\|q\|²)] becomes c + s·μ, μ = Π₁[q·j(\|q\|²)]. With u free, the saddle of the second-order model is ‖c − g₀μ/(1 + j₀)‖²/(k_A + g₀²/(1 + j₀)) − ‖μ‖²/(1 + j₀) | formal expansions. The cost is local at G = 0 and the saddle value is that of a quadratic model: neither is a finite-amplitude bound (see 11.17) | **P** for the formulas, with the caveat of 11.12 (re-derived for this file; the constants recomputed in `code/record-checks-2026-11-15/tied_matrix_check.py`) | KPR §3 |
| 11.14 | **The cancellation.** g − g₀ ≥ 0 and j₀ − j ≥ 0 on the computed range, and the ratio (g(v) − g₀)/(j₀ − j(v)) decreases from 1.291 as v → 0 to −g₀/j₀ = 0.583 as v → ∞. So for s between 0.58 and 1.29 the profile h_s changes sign (positive at small \|q\|, negative at large \|q\|) and its projection on the first chaos is small. On the Wick monomial at u = 0.0463: c = 0.03250 and μ = −0.03467, so the content c + sμ is 0.63·c at s = 0.343, 0.36·c at s = 0.6, and vanishes near s = 0.94. The cost-optimal tilt (0.34) and the content-optimal tilt (0.94) differ; the best compromise on the monomial is s ≈ 0.75 | peak row. Small v by adaptive quadrature (`ratio_small_v.log`): 1.2909, 1.2909, 1.2908, 1.2907, 1.2902, 1.2887, 1.2837, 1.2700 at v = 10⁻⁶, 10⁻⁵, 10⁻⁴, 3·10⁻⁴, 10⁻³, 3·10⁻³, 10⁻², 3·10⁻²: non-increasing to four decimals (in the fifth decimal the first two entries are in the other order, 1.290886 and 1.290908). Larger v on the fixed grid of `tilt_profiles.py` (12 values of v up to 10⁴). That grid is inaccurate at small v: its first entry, 1.271 at v = 10⁻⁴, is a quadrature error, and its second, 1.2913 at v = 10⁻³, is 0.001 above the adaptive value. c and μ on the monomial only | **N** | KPR §3; `ratio_small_v.log`, `tilt_profiles.log` |
| 11.15 | **Numerically optimized sector gain on the Wick monomial**, as gain/D. K, A-sector: 0.1246, 0.1482, 0.1568, 0.1604 at u = 0.01, 0.02, 0.03, 0.0463; K, A and B: 0.1261, 0.1510, 0.1605, 0.1653. With the penalty retained, A: 0.0214, 0.0225, 0.0210, 0.0170; A and B: 0.0216, 0.0230, 0.0218, 0.0183. The retained element removes 83 to 89 % of the K gain. The saddle formula of 11.13 gives 0.000205 at u = 0.0463; the numerical value is 0.0002049 | q = c·y(\|y\|² − 2)/√2, one driver, real amplitudes; two- and three-dimensional quadrature | **N** | KPR §4; REV §2; `retained_content.log`, `retained_joint.log` |
| 11.16 | **Largest values found over all tensors in two remote variables.** K (A-sector): gain/D up to 0.1477 at u = 0.02, 0.1609 at u = 0.0463, 0.1554 at u = 0.09. With the penalty retained (A-sector): 0.0179, 0.0215, 0.0237, 0.0232, 0.0208, 0.0173, 0.0127, 0.0046 at u = 0.005, 0.01, 0.02, 0.03, 0.0463, 0.065, 0.09, 0.15. With the B-sector added at the tensors found: K up to 0.1657, retained up to 0.0241. **In two variables the margin of gain ≤ D is about 6 for K and at least 41 with the penalty retained, at every energy tried.** The K maximiser is close to the monomial; the retained maximiser has more weight on X(\|Y\|² − 1) | q ∈ H₂,₁(ℂ²) of fixed energy (6 complex coefficients); A-sector r = ⟨α, y⟩ and retained element ⟨γ, y⟩, all complex. Deterministic quadrature (51,200 remote × 48 visible nodes), L-BFGS over the tensor with the saddle in (α, γ) solved inside, three restarts per run. On a finer grid (196,608 × 72 nodes) the ratios move by at most one unit in the fourth decimal (0.0237 becomes 0.0236, 0.1609 becomes 0.1608). **A search: lower bounds on a supremum, not upper bounds. Two remote variables only. Peak row only. The B-sector only at the tensors found for the A-sector (not re-optimised)** | **N** | KPR §5; `code/kprime-2026-11-15/search/` |
| 11.17 | **Finite amplitude: the second derivative along the sector.** Θ(R) is the supremum, over base points (w, ρ) with \|ρ\| ≤ R and over directions, of the second derivative of ρ ↦ E_{z₁}\|L + w + (T − 1 + s)ρ\|; the sector is concave along the segment while Θ(R) < p − s². Found for \|ρ\| ≤ 0.3: Θ = 1.046 against the budget 1.322 at s = 0 (cost at least 0.276; local 0.320) and 0.642 against 1.204 at s = 0.3434 (cost at least 0.562; local 0.607). Without a restriction on ρ, Θ exceeds the budget at every tilt tried (1.576 > 1.322 at s = 0; 1.324 > 1.204 at s = 0.3434), in agreement with 13.1, item 19. Both variants need an a priori bound on the sector amplitude | s = 0, 0.2, 0.3434, 0.5 and R ≤ 0.5. The optimal amplitudes of 11.16 are \|α\| ≈ 0.03 to 0.06. **A grid search, not a certified supremum**; a coefficient bound on r does not bound its pointwise values, and a tail allowance is needed (11.24) | **N** | KPR §9; `tilt_restricted.log`, `tilt_profiles.log` |
| 11.18 | **Cauchy–Schwarz on the content.** Since Π₁q = 0, ‖Π₁[q·h_s(\|q\|²)]‖² ≤ min_κ E[\|q\|²(h_s(\|q\|²) − κ)²], a functional of the law of \|q\|² alone. On the monomial at u = 0.0463 this bound divided by k(s)·D is 1.18 for K (useless), 0.21 at s = 0.3434, 0.076 at s = 0.6, 0.073 at s = 0.75. For the exponential law of \|q\|² (the diffuse-cubic benchmark: D = 0 and content is 0 when the auxiliary Gaussian is excluded from the projection) at u = 0.0463 the bound divided by the cost is 9.9·10⁻⁴ for K and 1.6·10⁻⁴ at the best tilt (s = 0.65), against the slack 1.31·10⁻⁴ of the target 1.402 over the model value. **Cauchy–Schwarz alone does not reach 1.402, with or without the tilt.** A structural content lemma (content² ≤ κ·D) is still needed, but its constant may be many times the true one | the inequality is Cauchy–Schwarz; the numbers are quadrature with the local cost k(s) (the finite-amplitude loss is not included) | **N** | KPR §10; `cs_check.log`, `cs_gauss.log` |
| 11.19 | **A fixed tilt, and a structured family with a bath.** (i) With the retained element tied to the sector, u = −s·r with s fixed (the right-hand side of 11.12), the largest gain/D found over all two-variable tensors is 0.0510 at s = 0.3434, 0.0331 at s = 0.5, 0.0257 at s = 0.6 and 0.0237 at s = 0.7 (the larger of u = 0.02 and 0.0463): the single tilt s = 0.7 does as well as the free multiplier of 11.16 on the tensors found. KPR states the resulting target without a saddle: 2E\|L + q + (\|z₁\|² − 3/10)·r\| − (p − 49/100)‖r‖² ≤ 2E\|L + q\| + κ·D(q) + η, where any κ < 1 suffices and the largest value found is 0.024. (ii) In the family q = X[c₁(\|X\|² − 2)/√2 + c₂·S_m/√m], S_m = Σ_{k≤m}(\|Y_k\|² − 1), with real c₁, c₂ and m bath variables (also the Gaussian limit of the bath), sector and retained element along X: for K the largest gain/D over the mixing angle is 0.1603 at u = 0.0463 for every m, attained at the monomial; with the penalty retained it is 0.0231, 0.0185, 0.0082 at u = 0.02, 0.0463, 0.09 for m = 1 and decreases as bath variables are added (0.0225, 0.0169, 0.0052 from m = 10 on). Within this family more remote variables do not raise the ratio; the family does not contain the two-variable maximisers of 11.16, which have complex coefficients | peak row; (i) three restarts per run, two remote variables; (ii) exact quadrature in (\|X\|², S_m, T), u = 0.02, 0.0463, 0.09, m = 1, 2, 3, 5, 10, 30, 100 and the Gaussian limit. (i) is a search: lower bounds on a supremum | **N** | KPR §§6, 7; `search/tilt_*.log`, `family.log` |
| 11.20 | **Three remote variables.** All tensors of H₂,₁(ℂ³) of fixed energy (18 complex coefficients), A-sector. With the penalty retained the largest gain/D found is 0.0230 at u = 0.0463 (four restarts from three seeds agree) and 0.0245 at u = 0.02 (the two restarts of one seed give 0.0241 and 0.0245, at different tensors), against 0.0208 and 0.0237 in two variables and 0.0170 and 0.0225 on the monomial. For K at u = 0.0463: 0.1611 (one restart), against 0.1609 in two variables and 0.1604 on the monomial. Two structured tensors at u = 0.0463: X[(\|X\|² − 2) + 1.2(\|Y\|² − 1)] with K 0.1443 and retained 0.0185; the same with a second bath variable of the same weight, K 0.1296 and retained 0.0178. **The retained ratio rises slowly with the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463), and the maximisers become less far from Gaussian (E\|q\|⁴/u² − 2 = 42, 19, 13). Nothing is known beyond three variables: the limit of this sequence is open, and with it the size of the margin in general.** A deterministic grid is too large for four variables; a sampling method with variance reduction is needed | `kprime3.py` on a coarser grid (839,808 × 40 nodes): it reproduces the monomial ratios 0.1604 and 0.0170 as 0.1601 to 0.1606 and 0.0170 to 0.0172, so the third decimal of a ratio is reliable and the fourth is not. Two restarts per run from random starts (the first restart of seed 0 starts near a structured tensor instead; the K value is from that one), at most 60 L-BFGS iterations per restart. **A search: lower bounds on a supremum.** Some restarts were still running when the folder was copied: the logs of three runs are empty, among them the only run at u = 0.03. If they change a number, its author edits the write-up | **N** | KPR §8, §0; `code/kprime-2026-11-15/search3/` |

**What (c) does not establish.** No theorem beyond 11.12 and the formulas of 11.13: no bound on the sector gain is
proved, for K or with the penalty retained. Every number is floating-point quadrature at the peak row, and those of
11.16, 11.19 (i) and 11.20 are results of searches. Those sector numerics do not establish the remote part.
**Correction (A15):** L1 is Λ(q) ≤ S + η_R, equivalently
D(q) ≥ −[S − (B(u)−pu)] − η_R; it does **not** imply D(q) ≥ −η_R. The latter is a stronger
same-variance assertion. The follow-up remote replay is recorded separately in 3.3. Open: more than three remote variables (11.20; the family of 11.19 is a first
test); the other rows of the cover; the z-odd sectors z₁Q, z̄₁P, d·z₁(T − 2), where the retained element can have a
component along z₁; the B-sector optimised over the tensor; the finite-amplitude control (11.17); and a proof of
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
| 11.24 | For s∈[0,1], R>0, Gaussian linear r with w=E\|r\|²>0 and any remote q (the tail is zero if w=0), the tilted norm remainder on \|r\|>R is at most 4[−s+2exp(s−1)]exp(−R²/w)[R+w/(2R)] | **P, by author, not externally reviewed**, A15 `SECTORS.md` §6; exact scalar check **C** at s=.7,R=.3,w≤.0036 gives <1.4·10⁻¹¹. At w=.0113 this allowance is about 3.46·10⁻⁴ (**N**). A compact Hessian bound and an admissible amplitude bound are still needed |

## 12. Related results

| # | result | status | where |
|---|---|---|---|
| 12.1 | Cover improvement: K_G^ℂ > 1.401697318640 (= 17521216483/12500000000; cap B = 713420784003651/10¹⁵; gain 201339/10¹² over 1.401697117301), from the existing witness, 19 rows and law nodes with a refined finite cover of 11,107 boxes | **Externally certified, not in Lean.** Every box bound and the partition were recomputed in exact rational arithmetic by two separate implementations and the checker was compared with the Lean definitions; no Lean build. Computed against commit 32cfb7d87; since then `Grothe/Research/LawNodeLower.lean` was golfed without statement changes. To land it, Lean must check the new cover data and instantiate the existing transfer theorem. **Independent of K** | IMP; `improvement_bound_review.md`, `improvement_cover_method.md`; checker `code/audit-2026-11-13/improvement_independent_check.py`; certificate in `INVENTORY.md` |
| 12.2 | Ceiling of the cubic witness family: below 1.4022581233 for every complex multiplier and every dimension | [P,C] with the generic arithmetic in Lean, according to `docs/overview.tex` ("Limits of the witness method"); not re-examined here | `docs/overview.tex`; MON §1 |
| 12.3 | The degree-5 analogue K₅ is false at its flank rows t ∈ [0.86, 0.88]: one spike +1.55·10⁻⁵ (deterministic quadrature), plateau about 8·10⁻⁵ ± 1·10⁻⁵ for 8 to 20 spikes; it holds at the peak row in every family tested | **N** (floating point and Monte Carlo; nothing certified). Mechanism (**R**): a Gaussian driver (T−1)R_N ∈ H₃,₂ gives an excess ≥ εα²I²/4 > 1.5·10⁻⁴; this lives in H₃,₂ and is not a counterexample to K | `sources/k5-2026-11-04/RESULTS.md`; MON §3.2; LOG §11a |
| 12.4 | D₁ in degree 2 (3.8) | **R** | `sources/d1/` |
| 12.5 | The upper bound claimed in EXT-R (1.404896400821) | **R**; weaker than the proved 1.4046 | EXT-R |

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
| 11 | MON §4b: g_B/g ∈ [0.505, 0.56]; LOG §45 and the J3 audit: false at the flank and upper rows | The later finding (REC §6.3). Only the common-centre bound 7.1.4 survives, uncertified |
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


## 15. Open problems, in the order the audit suggests

1. **The finite-amplitude joint A/B remainder bound** (7.4), first at the peak row; by IMP-JT it is enough to prove
   the box inequality on 0 ≤ x ≤ 6, |α|, |β| ≤ 0.4 with reserve 7.53·10⁻⁵. If it fails, a direct optimised joint
   content and remainder inequality that uses the benchmark slack.
2. **A dimension-uniform finite-amplitude content theorem** for general cubics on [0.00551, 0.0463] (6.3.18), with a
   constant fixed by item 1 (0.10 under the adverse joint hypothesis). Pieces: the mixed shells (6.3.16), several
   self-interacting drivers (6.3.17), the envelopes (★) and (†) (6.3.13, 6.3.14).
3. **The kernel comparison** |g_B − 0.5053g| ≤ 0.007 (7.1.4) or a general B-content bound (7.1.5).
4. **A uniform cost for the z-odd sectors** over genuine nonzero even cubic cores at the required rows (7.2.4); full-box odd nonincrease is false (5.4a).
5. **The remote part on all rows**: peak replay is complete at tolerance 3.6·10⁻⁷ (3.3), and the narrow profile tube
   3.11 is covered. Generate and replay certificates for the actual remaining row envelope; the flank/upper rows
   are outside that tube. The missing package of 11 (b) remains unchecked. Exact K-a (3.6) is not needed for 1.402.
6. **Coverage of the response-feasible regions outside R**, then **the consumer** (section 8). The central interval has an exact conditional single-peak-row component now; use the corrected t-dependent energy caps (2.12a). Cover the complementary t regions with a fixed witness ε. The σ* = 0 corner needs treatment only if a chosen row cover uses it.
7. In parallel: the same questions for **Λ̂ = Λ_P** (section 11), the row functional with the first-chaos penalty
   retained. Its local costs are larger (11 (a)). On what was tested on 15 November (**N**: peak row, A and B sectors,
   remote cubics in one to three variables) the sector inequality gain ≤ D + η has a margin of about 40 with the
   penalty retained, against about 6 for K (11 (c)). Next, after REV §4 and KPR §§8 and 11: more than three remote
   variables, where the retained ratio may still rise and a sampling method is needed (11.20), and the other rows; the z-odd sectors; an a priori bound on the sector
   amplitude (11.17); then the sector lemma
   with the penalty retained (gain ≤ κ·D; any κ < 1 suffices and about 0.03 is what the numerics show), for which a
   proof with crude constants would do. The remote part (item 5) is not changed by this and would then be the only
   piece that needs sharp constants.
8. Independent of the above: the **identity-tail witness** (section 10), which raises the model ceiling and is
   untested at certificate level.

The audit's advice: continue only as a bounded research programme with an explicit decision point, not as a
near-complete route to an additional 0.0005.
