# Conjecture K: the ledger

*Every statement about Conjecture K in its current form, with its scope, its status and where it is proved and
checked. The book [`MONOGRAPH.md`](MONOGRAPH.md) tells the same state as a text; this ledger as it stood with its
dated passages is [`sources/status-2026-11-15/STATUS_with_history.md`](sources/status-2026-11-15/STATUS_with_history.md).*

Conjecture K is **open**. Its statement and notation are in [`MONOGRAPH.md`](MONOGRAPH.md), chapter 1, and in
[`README.md`](README.md), part (a). This file is edited in place: a row always states the strongest form that is
known, with the evidence for that form.

## 0. How to read this file

**Labels.**

| label | meaning |
|---|---|
| **P** | proved on paper, and the proof was re-derived by someone other than its author; the status names both. **P, author only**: re-derived only within the author's own session |
| **C** | certified by an exact or interval checker that someone other than its author replayed, with the implication from the check to the statement inspected. **C, author only**: replayed only within the author's session. A replay runs the delivered code; "interval code not audited" means that nobody read that code line by line |
| **Lean** | a theorem of the Lean development of this repository (the row names it) |
| **N** | numerical only (floating point), with its stated accuracy. A search gives candidate values and lower bounds on a supremum, never an upper bound |
| **R** | read from the record without full independent verification. This includes certificates replayed only by their recipient or by the user |
| **open** | not proved; no claim |
| **false** | shown false; section 13 gives the counterexample and its status |

A status is never higher than its source supports. Where sources disagree, the later independent check stands, and
the row states only what stands.

**Who checked what.** codex-a713 wrote the independent audit REP (with CERT, ASM, ADD, KER) and a separate second
audit PF (with REC, DIF, OPT); "audit" in a status means REP and its companions, "second audit" PF and its
supplements. codex-a7c4 wrote A15, A15R, A15T, A15F, A15V and A15S. claude-b9ee reviewed A15 and A15R (the files
`REVIEW_claude-b9ee.md` in their folders), A15T (rev. #403, archived in A15F), A15F (rev. #409, archived in A15V),
A15V (rev. #413, archived in A15S) and A15S (rev. #419, the review of that pull request),
the external report EXT-P (REV) and the report TILT of codex-6e2b (TILT-REV to TILT-REV4; in TILT-REV4 a reviewer
agent of the same session made most re-derivations, as that review says). claude-b9ee is the recipient of EXT-P and
TILT; a reader who counts a recipient's replay as **R** reads the **C** of those rows as **R**, and the reviews say
exactly what was read, re-derived and replayed.

**Row IDs** are stable labels, not a sequence: other documents cite them, and gaps are normal. A row that states
what several labels stated carries all of them. Items 1 to 88 of sections 13 and 14 are labels of the same kind.

**Labels without a row.** Their former text is in `sources/status-2026-11-15/STATUS_with_history.md`.

| label | where its content is now |
|---|---|
| 3.9 | the external remote claims 11.7 to 11.11 (section 3) |
| 11.24 | the Gaussian tail allowance of the tilted remainder for s ∈ [0, 1]; its case s = 3/5 is the tail term of 11.32. Retired: 11.51 needs no tail |
| 11.28 | the tilted lemma at small energies; contained in 11.51 |
| 11.34 | a conditional assembly through 11.33 and a localisation of the maximiser; retired, the assembly is 11.40 with 11.50 (11.51) |
| 11.35 | the localisation of a maximiser (**R**); retired, 11.40 needs none |
| 11.36 | the content comparison with D₊/10 or D₊/5; the proved comparison is 11.50, with 3/10 |
| 11.38 | the content comparison on a test family (**N**); retired by 11.50 |
| item 34 | 6.3.11: the bound for u ≤ 0.00038 is **R** as a theorem |
| item 82 | 3.10, 3.16, 11.3: raw and retained remote values differ pointwise, with a common benchmark (2.14) |

**Rows of the profile box.** "The three rows" means:

| row | ε | ℓ | β = b | a = ℓ − 2β | σ* (maximiser of Λ(σW)) |
|---|---|---|---|---|---|
| peak | 1891/2500 = 0.7564 | 1057/1250 = 0.8456 | 179/1250 = 0.1432 | 699/1250 = 0.5592 | 0.2009 |
| flank | 149/200 = 0.745 | 4267/5000 = 0.8534 | 1467/10000 = 0.1467 | 14/25 = 0.56 | 0.1726 |
| upper | 1891/2500 = 0.7564 | 0.877 | 19/125 = 0.152 | 573/1000 = 0.573 | 0.1617 |

Peak constants: p = 1/ε = 2500/1891; B₀ = Λ(0) = 2E\|L\| = 387√π/500 ∈ (1.371879280600869, 1.371879280600870);
1.3739535256614 < S < 1.3739535256616 (3.14), attained near v₀ = σ*² = 403448/10⁷; S − B₀ > 0.002074245;
j₀ = ½E\|L\|⁻¹ ∈ [1.431973791291431, 1.431973791291432]; g₀ = g(0) ∈ [−0.835135932614130, −0.835135932614129];
k_A = p − E[(T − 1)²/(2\|L\|)] = 0.320054504.

**Notation of the rows.** T = \|z₁\|², L = z₁(a + bT), F(G) = E\|L + G\| + E\|L − G\| for every G (so Λ(G) = F(G) −
‖G‖²/ε; F(G) = 2E\|L + G\| when G is even in z₁, in particular F(q) = 2E\|L + q\| for a remote q), B(u) = 2E\|L + √u·W\|, D(q) = B(u) − F(q)
(the deficit), D₊ = max(D, 0), u = ‖q‖², δ = E\|q\|⁴ − 2u², χ = δ/u², w = ‖r‖² for the A-shell form r. Profiles:
E_{z₁}ph(L + y) = y·j(\|y\|²), E_{z₁}[(T − 1)ph(L + y)] = y·g(\|y\|²); C(q) = ‖Π₁,₀[q·g(\|q\|²)]‖ (the A-content);
h_s = (g − g₀) − s(j₀ − j) and c_s(q) = Π₁[q·h_s(\|q\|²)] (the tilted content). In section 11, A = T − 2/5,
P = p − 9/25 = 0.962052, 𝒥(q, r) = 2E\|L + q + A·r\| − P‖r‖² − F(q) and k = P − 13/20 = 59009/189100.

**Sources.** Paths are relative to this folder.

| tag | file |
|---|---|
| REP | `sources/audit-2026-11-13/REPORT.md` (the audit of codex-a713) |
| CERT, ASM, ADD, KER | `CERTIFICATE_AUDIT.md`, `ASSEMBLY_AUDIT.md`, `ADDITIONAL_ANALYTIC_AUDIT.md`, `KERNEL_DERIVATION.md` in the same folder |
| PF, REC, DIF, OPT | `independent-pushforward-audit/REPORT.md`, `record_audit.md`, `diffuse_asymptotic.md`, `optimizer_audit.md` in the same folder (the second audit; labels P, N, R only) |
| IMP, IMP-JT, IMP-CE | `IMPROVEMENT.md`, `improvement_joint_tail.md`, `improvement_content_extension.md` in the same folder (codex-a713) |
| MON | `sources/monograph-2026-11-05/MONOGRAPH_with_errata.md`, the text below its marker line (its labels [L], [P], [C], [F] are its author's) |
| LOG | `sources/log/ASSESSMENT_2026-11-04.md` |
| DIG | `sources/manuscript/MANUSCRIPT_DIGEST_K.md`; `chNN` means `sources/manuscript/legacy/chNN-….tex` |
| KSCAN, TAIL | `sources/numerics-kscan-2026-11-13/README.md`, `sources/numerics-tailgames-2026-11-14/README.md` |
| EXT-P, EXT-R | `sources/external-2026-11-15/projection-attack-report.md` with its package; `remote-closure-report.md` |
| REV | `sources/external-2026-11-15/REVIEW.md` (claude-b9ee: verification record of EXT-P and EXT-R); scripts and logs in `review/` beside it |
| KPR | `sources/numerics-kprime-2026-11-15/README.md` (claude-b9ee: the retained element optimised together with the sectors); scripts, logs and search records in `code/kprime-2026-11-15/` |
| RCV/x | `sources/received-2026-11-05/x` |
| OCT/x | `sources/october-handoff/x` |
| A15 | `sources/audit-2026-11-15-codex-a7c4/AUDIT.md`; `CLAIMS.md`, `REMOTE.md`, `SECTORS.md`, `ODD_COST.md` beside it; checkers in `code/audit-2026-11-15-codex-a7c4/` |
| A15R | `sources/reaudit-2026-11-15-codex-a7c4/AUDIT.md`; `FOUNDATIONS.md`, `REMOTE.md`, `CONTENT.md`, `SECTORS.md`; checkers in `code/reaudit-2026-11-15-codex-a7c4/` |
| A15T | `sources/third-audit-2026-11-15-codex-a7c4/AUDIT.md`; `ALIGNMENT.md` (in its §§2–4 "B" is the kernel −g_B, in §5 the Gaussian benchmark), `CONTENT_KERNELS.md`, `POTENTIAL.md`, `SECTORS.md`; checkers in `code/third-audit-2026-11-15-codex-a7c4/` |
| A15F | `sources/fourth-audit-2026-11-15-codex-a7c4/AUDIT.md`; `REFORMULATIONS.md`, `REMOTE.md`, `CONTENT.md`, `JOINT.md`, `REVIEW_403_claude-b9ee.md` (rev. #403); checkers in `code/fourth-audit-2026-11-15-codex-a7c4/` |
| A15V | `sources/fifth-audit-2026-11-15-codex-a7c4/AUDIT.md`; `FOUNDATIONS.md`, `REMOTE.md`, `JOINT.md`, `REVIEW_409_claude-b9ee.md` (rev. #409); checkers in `code/fifth-audit-2026-11-15-codex-a7c4/` |
| A15S | `sources/sixth-audit-2026-11-15-codex-a7c4/AUDIT.md`; `FOUNDATIONS.md`, `REMOTE.md`, `JOINT.md`, `OBSTRUCTION.md`, `REVIEW_413_claude-b9ee.md` (rev. #413), `PR413_FEEDBACK.md`; checkers in `code/sixth-audit-2026-11-15-codex-a7c4/` |
| KPROG | `sources/progress-2026-11-15-codex-a7c4/RESULTS.md`, `ODD_CONTROL.md`, `JOINT_CONTENT.md`, `LOWER_ROUTE.md`; checkers in `code/progress-2026-11-15-codex-a7c4/`; new analytic results are author only, pending external review |
| TILT | `sources/received-2026-11-15-tilted-sector/REPORT.md` (codex-6e2b: "Tilted sector lemma: complete range u ≤ 0.0463") with its notes (`deficit_*_proof.md`, `secant_proof.md`, `secant_content_proof.md`, `secant_assembly.md`, `theta_proof.md`, `content_*.md`), its author's audit (`deficit_audit_results.md`, `deficit_audit_notes.md`) and its result files beside it; the verifier and scripts in `code/tilted-sector-2026-11-15/` |
| TILT-5, TILT-4, TILT-1 | `REPORT_secant_history.md`, `REPORT_localization_history.md` and `first-version/REPORT.md` in the same folder: earlier versions of the same report, whose notes the current one still uses; their verifiers are `verify_secant_history.py`, `fourth-version/verify.py` and `first-version/verify.py` in `code/tilted-sector-2026-11-15/` |
| TILT-REV, TILT-REV2, TILT-REV3, TILT-REV4 | `REVIEW.md`, `REVIEW_2.md`, `REVIEW_3.md`, `REVIEW_4.md` in the same folder: the reviews by claude-b9ee of TILT-1, of the second version, of TILT-5 and of TILT; scripts and logs in `code/tilted-sector-2026-11-15/` (TILT-REV4: `review4/`) |

## 1. Summary

1. The exact gate-free row (2.1) is proved. Conjecture K (2.2) is open, and no violation of it is known (2.3, **N**).
2. **Remote part (L1).** At the peak row every remote cubic satisfies Λ(q) < S + 3.6·10⁻⁷ (3.3, **P + C**). A
   one-sided profile rectangle (3.15) and a narrow tube (3.11) around the peak are covered as well; the flank and
   upper rows and the rest of the box are open. Exact remote K (3.6) is open and not needed.
3. **Disjoint drivers (L2).** Λ(q + (T − 1)U) ≤ Λ(q) − (1/ε − 197/(200ℓ))‖U‖² on the whole box at every amplitude
   when z₁, q, U are independent (4.2, **P + C**).
4. **Shared drivers, explicit regions (L3).** At the peak, orthogonality alone gives Λ < S + 10⁻⁴ for
   u ≤ 0.00558 + 0.31907w and for w ≥ 0.0206 (6.1.1, 6.1.1a, **P + C**); the fourth-moment cutoff w ≥ 0.01125 is
   **R** (6.1.2).
5. **The A-sector of K (L4).** The cost (6.2.1) and the content inequality for structured families (6.3) are
   proved. For a general cubic on 0.00551 ≤ u ≤ 0.0463 the raw content inequality is open (6.3.18); numerically
   sup C²/D ≈ 0.0876 at u = 0.0463 (section 9).
6. **The A-sector of the retained functional Λ̂.** Closed at the peak row: for every remote cubic q with u ≤ 0.0463
   and every remote linear form r, in every dimension and at every amplitude, Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ (11.51,
   from 11.39, 11.40, 11.49, 11.50 and 3.3); below S if u ≤ 0.021 (11.47); below S + 9.8·10⁻⁵ on a scaled profile
   rectangle around the peak (11.53). The benchmark S is common to Λ and Λ̂ (2.14).
7. **Sector assembly (L5).** The B-shell cost (7.1.1) and the peak alignment of the B- and A-contents (7.1.4) are
   proved. The finite-amplitude joint A/B bound is open (7.4), reduced to a compact box with shifts 0 ≤ x ≤ 2.9
   (7.4.5). Pure odd sectors over every remote core are bounded (7.2.6, author only); shared simultaneous odd sectors and
   cores with A/B remain open (7.2.4). Their coupling with the one-coordinate cubic has two channels (7.2.5). For K a content constant 0.10 would not close A + B without the joint bound (item 43).
8. **Consumer (L6).** At the peak row an all-sector bound Λ ≤ S + η with η ≤ 10⁻⁴ covers t ∈ [0.84, 0.851] for 1.402
   (8.1, **P + C**); the other response regions, the other rows and a Lean consumer are open.
9. **What K would give.** K_η with η ≤ 10⁻⁴ gives about 1.402; exact K about 1.4022; no certificate with the cubic
   witness exceeds 1.4022581233 (12.2). The proved lower bound, without K, is 1.401700322371 (Lean, 12.1).

## 2. The statement and its reductions

| # | statement | scope | status | where |
|---|---|---|---|---|
| 2.1 | Exact gate-free row: for unimodular f, g, h = (f+g)/2, k = (f−g)/2, P₁,₀h = t·z₁ and G = εP₂,₁k, Re⟨f, T_εg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G), Λ(G) = E\|L + G\| + E\|L − G\| − ‖G‖²/ε | every real ℓ, β and ε > 0; the dropped terms are ‖P₁,₀k‖², ε‖P₂,₁h + B/ε‖² (B = βz₁(T − 2)) and the pointwise phase slack; no hidden premise | **P** (audit) | REP §1; ADD §1; `ch7` (prop:row) |
| 2.2 | Conjecture K: Λ(G) ≤ S(ε, ℓ, β) := sup_{σ≥0} Λ(σW) for every n and every G ∈ H₂,₁(ℂⁿ) | the box ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16]. If true, the supremum over all finite dimensions is S, approached by diffuse sequences N^{−1/2}Σ_j H(w_j), H(w) = w(\|w\|² − 2)/√2. No fixed-dimension attainment is asserted: at the peak, n = 1 has supremum B₀ < S (2.6, item 80); at the corner (0.74, 0.90, 0.12), σ* = 0 and G = 0 attains S | **open** | README (a); `MONOGRAPH.md` ch. 1 |
| 2.3 | No violation of K is known | H₂,₁(ℂ²) + W (largest excess +1.4·10⁻¹², at the level of the quadrature error), H₂,₁(ℂ³) + W (+4 to 5·10⁻⁹, a grid artefact), scale mixtures, a 10-parameter limit family; full tensors in d = 3, 4, 5 at the three rows (every candidate below S on 2·10⁷ fresh samples); H₂,₁(ℂ²) with all six sectors, 18 shells (Λ − S < 0 at every point tested). At (ε, ℓ, β) = (0.7564, 0.84, 0.14), n = 2 without W: sup Λ = 1.3649281 < S = 1.3669130 | **N** | DIG §3; `ch7` ("Attacks on K"); LOG §6, §31; `OCT/pipeline-gate/KSIDE.md`; `code/experiments-2026-11-04/e4_kattack.py`, `e11_ksector.py` |
| 2.5 | The corner (ε, ℓ, β) = (0.74, 0.90, 0.12) of the box has σ* = 0 | Theorem B (5.2) covers it; several other proofs need σ* ≥ 0.1 or a/β ∈ [11/4, 11/2]. It matters only if a row cover uses it | **R**; open as part of L6 | MON §1; DIG §2; ADD §3 |
| 2.6 | n = 1. On the whole box, Λ(d·z₁(T − 2)) ≤ 2E\|L\| − k_*‖d·z₁(T − 2)‖² with the sharp uniform cost k_* ∈ (0.151676198434561, 0.151676198434562), attained at (0.76, 0.76, 0.16) (0.15167 is a safe rational value). So sup Λ = 2E\|L\| on H₂,₁(ℂ), attained only at G = 0; at the peak 387√π/500 < S | the one-coordinate cubic, in any ambient dimension; no conclusion for arbitrary G | **P, author only** (codex-a7c4) for sharpness and uniformity + **C** (`odd_cost_check.py`, `sectors_exact.py`, replayed by claude-b9ee in the A15R review); k_* recomputed by quadrature there (**N**) | A15 `ODD_COST.md`; A15R `SECTORS.md` §§2, 5; REC §6.1 |
| 2.6a | Retained n = 1: on the d-axis the optimum of Λ̂ is Λ(0), uniquely at d = 0; the sharp all-amplitude uniform cost of d·z₁(T − 2) is in (0.392424545003417, 0.392424545003418) (safe value 0.39242) | the whole box; this axis in any ambient dimension; no conclusion for arbitrary G | **P + C** (codex-a7c4, A15T; re-derived and replayed by claude-b9ee, rev. #403) | A15T `SECTORS.md` §§3–4; `sector_axis_costs.py` |
| 2.7 | L has the law of √V·W (a circular Gaussian scale mixture), and φ(v) = 2E\|L + √v\| has a completely monotone derivative | every a, b > 0 | **P** (audit) | ADD §5; IMP-CE; `ch32` |
| 2.7a | The visible survival function and density, −g and −g_B are completely monotone, with explicit positive derivative recurrences and Laplace measures; −g − √2(−g_B) is completely monotone; scalar envelopes M_j, j ≤ 4 | every a > 0, b ≥ 0; the envelopes at the three rows | **P** (codex-a7c4, A15T; re-derived by claude-b9ee, rev. #403); endpoint checker **C** (replayed there); the flank and upper M_j comparisons **C, author only** | A15T `CONTENT_KERNELS.md`; `content_kernels_exact.py` |
| 2.8 | Frequency rule: after factoring the phase of z₁, q and A carry frequency −1, B +1, z₁Q and d·z₁(T − 2) 0, z̄₁P −2; E[\|G\|² \| T] has no cross terms between different frequencies | every G (an algebraic statement); which sectors can have a first variation is 2.9 | **P** (re-derived in A15R) | MON §2; DIG §4; `ch11`; A15R `SECTORS.md` §6 |
| 2.9, 7.2.1 | Parity: for H even and O odd under z₁ → −z₁, Λ(H + O) = Λ(H − O). So the odd first derivative vanishes where it exists, and mixed even/odd Hessian entries vanish where the Hessian exists. At a genuine even cubic base the first derivative exists (L ± H are nonzero polynomials) | parity for every even L² base; an even L² base can have a cusp (item 71); no finite-amplitude monotonicity follows | **P** (audit; the qualification and the cusp re-derived by claude-b9ee, A15R review) | REP §1; ASM §3.2; LOG §34; A15R `SECTORS.md` §6 |
| 2.10 | K′: Λ′(G) := sup{Re E[conj(L + G)f + conj(L − G)g] − ‖G‖²/ε − ‖P₁,₀k‖² : \|f\| = \|g\| = 1, εP₂,₁k = G} ≤ Λ(G); the row 2.1 holds with Λ′, so K′: Λ′ ≤ S suffices | every G | the row with Λ′: **P** (re-derived in A15R); K′: **open** | DIG §2; `ch7` ("Side experiments"); A15R `FOUNDATIONS.md` §3 |
| 2.10a, 11.1 | The retained functional Λ̂(G) := min_{ξ ∈ H₁,₀}{‖ξ‖² + E\|L + G − ξ\| + E\|L − G + ξ\|} − ‖G‖²/ε (the first-chaos dual Λ_P of `ch20`) satisfies Λ′ ≤ Λ̂ ≤ Λ, and the row 2.1 holds with Λ̂. So sup Λ̂ ≤ S + η suffices for the lower bound, and is weaker than K | every G | **P** (Λ̂ ≤ Λ and the row: re-derived by claude-b9ee, REV; Λ′ ≤ Λ̂: re-derived in A15R from weak duality) | `ch20` ("A valid first-chaos dual for K′"); `ch17`; EXT-P; REV; A15R `FOUNDATIONS.md` §3 |
| 2.11 | K_rot: at a global norm maximiser, the row holds with the extra term −‖2βr_A + √2β·conj(r_B)‖²/(ε²t² + 9ε‖G‖²) | only at a global norm maximiser; no cap is proved for it (item 51) | **R** | DIG §2; `ch25-parts/10-exact-duals-rotation-profiles.tex`; `ch23` |
| 2.12 | Response-side constraints: 25 proved constraints on actual responses (sector ellipsoid; closed-form ellipse e + (191/500)t² ≤ 9/40 ⇒ cap 0.71315; anisotropic and weighted caps covering e ≤ 0.0148; …) | actual responses only: not valid inside a raw-K supremum; penalties that spend the same square must not be added twice | **R** ([P] or [P, C] in the manuscript) | DIG §1 |
| 2.12a | Response energies at ε = 1891/2500: for t ≥ 0.84 the remote energy is < 0.046266 and the total energy < 0.081884; total < 0.071981 for t ≥ 0.8456 and < 0.062431 for t ≥ 0.851 | actual responses only; without a threshold in t no such cap holds (item 69) | **P + C** (codex-a7c4, A15R; re-derived and replayed by claude-b9ee, A15R review) | A15R `FOUNDATIONS.md` §2; `foundations_exact.py`; `ch25-parts/30-response-feasibility.tex` |
| 2.12b | Stronger simultaneous response ellipsoid: E_q/2 + 2E_A/3 + 4E_B/3 + E_Q + E_P + 8E_ν/7 ≤ ε²(π/4 − t²). With the inherited Rice tangent, total energy ≤ ε²[(3/2)(π/4 − t²) + B(A − t)], giving strict caps 0.080051, 0.070564, 0.061366 at ε = 1891/2500 and t ≥ 0.84, 0.8456, 0.851 respectively | actual F = εP₂,₁k with P₁,₀h = tZ, t ≥ 0, bounded responses; all six sectors and arbitrary sharing, every dimension; E_ν is the normalised visible cubic energy. Improves the total caps of 2.12a, leaves its remote cap unchanged. No payoff or K theorem | **P + C, author only** (codex-a7c4; two analytic derivations, root re-derivation, exact rational replay). Rice tangent A = 886762780/10⁹, B = 432306903/10⁹ inherited from 2.12a | KPROG `RESPONSE_ELLIPSOID.md`; `response_ellipsoid_check.py` |
| 2.13 | The minimum defining Λ̂(G) has a unique minimiser ξ*, ‖ξ*‖ ≤ √π/2. For a trial ξ, with k_ξ the half-difference of the support phases and ρ = ξ − P₁,₀k_ξ: J_G(ξ) − ‖ρ‖² ≤ min J_G ≤ J_G(ξ), and ‖ξ − ξ*‖ ≤ ‖ρ‖ | every finite dimension; certifies the inner minimisation only | **P** (codex-a7c4, A15R; re-derived by claude-b9ee, A15R review) | A15R `FOUNDATIONS.md` §3 |
| 2.14 | The benchmark of Λ̂ is S. For independent remote X_j, H(X) = X(\|X\|² − 2)/√2, q = Σ_j c_jH(X_j) and v_j = \|c_j\|²: 0 ≤ Λ(q) − Λ̂(q) ≤ 192a⁻⁶(1 + 4b/a)Σ_j v_j³ (the coefficient is < 12711 at the peak; 15200 in place of 192 for arbitrary independent cubic blocks). For q_N = √(u/N)Σ_{j≤N}H(X_j), Λ̂(q_N) → B(u) − pu, so the supremum of Λ̂ over all finite-dimensional cubics is at least S | every a > 0, b ≥ 0, p > 0; the full first chaos of the actual coordinates (no auxiliary first-chaos direction W); no rate for the CLT itself, no fixed-dimension attainment, nothing about the constrained Λ′. DIF §3 has the A-content analogue | **P + C** (codex-a7c4, A15S; re-derived and replayed by claude-b9ee, rev. #419). Not re-checked there: the inherited positive density mixture of the visible law, and, for the 15200 variant only, the C₆ = 40.45313 sixth-moment theorem | A15S `FOUNDATIONS.md` §§2–6; `diffuse_retained_exact.py`; DIF §3 |

## 3. Layer L1: the remote part (G = q independent of z₁)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 3.1 | Reduction of remote K to a moment problem for U = \|q\|²/u: two-point extremal laws, cubic Hermite majorants of φ, secant envelope in the variance | every profile | **P** (audit) | REP §1; ADD §5 |
| 3.2, 3.3 | Peak remote cap: Λ(q) < 1.373953883 < S + 3.6·10⁻⁷ for every remote cubic q, every finite dimension and every variance | peak row only; does not give same-variance domination D(q) ≥ 0 (item 68). Method: 68 profile caps, 45 Stein nodes, 154 outer boxes, zero- and high-variance rays, the Gaussian benchmark; inputs 3.4. A weaker cap 2747927/2000000 = 1.3739635 has a separate Arb package (`ch24`; **R**) | **P + C** (October package; implication inspected and acceptance replayed with every profile integral recomputed by codex-a7c4, A15; replayed again by claude-b9ee on a second installation, with the Stein and dual identities re-derived, A15 review). An external certificate, not Lean | A15 `REMOTE.md`, `remote_strong_PROOF.md`; `remote_replay.py`, `remote_rational_audit.py`, `remote_legacy_replay.py`; `INVENTORY.md` |
| 3.4 | Moment and Stein inputs for every circular cubic of the third chaos: E\|q\|⁴ ≤ 44u² (so 0 ≤ χ ≤ 42); E\|q\|⁶ ≤ 6u³ + 9uδ + (4045313/100000)δ^{3/2}; Stein variables X, r with EX = 0, EX² ≤ 2P/3, Er² ≤ 2R/3, 2P + R = χ, R ≤ χ/3 and the test-function identity; E G(U) ≥ 0 for every cut of the Lean family | the inputs of 3.3, 11.27, 11.47 and 11.50. Lean's test functions have knots at squares of rationals and vanish beyond the last knot; the 45 duals of 3.3 use other knots, covered on paper by 3.12 | **Lean**: `Circular.fourth_moment_le_variance`, `Circular.gaussian_fourth_moment_le_44` (`Grothe/LowerAnalytic/CircularFourth.lean`); `gaussian_moments` (`Bridge.lean`) through `sixth_moment_complex` (`SixthMoment.lean`); `gaussian_steinInputs` (`RadialCut.lean`); `steinCut_of_inputs` (`Grothe/Lower/Stein.lean`) with `gaussian_gramInputs` (`GramBudget.lean`). Their identification with the inputs of 3.3: **P** (claude-b9ee, source read, no build) | A15 `REMOTE.md` §3a; ADD §5 |
| 3.5 | For one fixed profile a > 0, b ≥ 0, four statements are equivalent: the universal complex sharp radius bound; Gaussian-buffer PVD; same-variance remote domination; exact remote K at **every** price p = 1/ε > 0. Real BNC implies real PVD (equivalent to the universal real sharp radius bound), which implies complex PVD | every finite dimension and energy; no converse to BNC and no complex-to-real implication is known (item 79); a single-price remote cap does not imply same-variance domination | the equivalences **P** (codex-a7c4, A15F; re-derived by claude-b9ee, rev. #409); the four statements: **open** | A15F `REFORMULATIONS.md` §§1–3; MON §3.3; `ch32`, `ch34` |
| 3.6 | Sharp radius bound E\|q\| ≤ (√π/2)‖q‖₂ on H₂,₁ | all cubics | **open**. Proved cases (**R**): real BNC in order 2; one-variable H₃ at every scale; the family aH₃(g₁) + bH₂(g₁)g₂ (130 exact boxes); Gaussian scale mixtures. Exact remote K (**R**): the one-coordinate star, all of H₂,₁(ℂ²), Gaussian scale mixtures | MON §3.3 |
| 3.7 | E\|q\| < 0.95133‖q‖₂ for every Wick cubic (0.9695084 by a spherical kernel) | all cubics | **R** ([P, C] in the manuscript) | DIG §1 item 19; `ch60`, `ch62`, `lower-bound/real-stein-radius.tex` |
| 3.8, 12.4 | D₁ in degree 2: E\|X\| ≤ √(2/π)‖X‖₂ for X = Σλ_i(g_i² − 1), strict for X ≠ 0; also for weighted sums of independent centred Gamma variables plus a Gaussian | real second chaos (uses Yamazato's unimodality theorem); the real degree-3 and the complex charge-one cases are open | **R** (written proof by a worker of claude-b9ee; not audited) | `sources/d1/` |
| 3.11 | Profile tube: with λ = ε/(1891/2500), the peak cap gives Λ(q) < S + 8.1·10⁻⁵ whenever ε ∈ [0.74, 0.76] and \|a − λ·699/1250\| + (3/2)\|b − λ·179/1250\| ≤ λ/50000; in general the error is λη₀ + 2√π times that shape distance, η₀ = 3.6·10⁻⁷ | every finite dimension and every remote cubic; a narrow tube with a, b > 0, not the box and not the flank or upper rows | **P, author only** (codex-a7c4, A15) + **C** (rational arithmetic, `remote_rational_audit.py`), from 3.3 | A15 `REMOTE.md` |
| 3.12 | Dense-test extension: every spectral cut E G(U) ≥ 0 whose test function is continuous, piecewise affine with rational knots and constant on its final ray follows from the cuts of the Lean family by uniform approximation, with E\|G_n − G\| ≤ δ[(M + \|β\|)/(2λ) + \|A_f\|/λ + 2(M + \|A_g\|)/μ + 2] + δ²[1/(4λ) + 1/μ] | every law with U ≥ 0, EU = 1, EU² < ∞ satisfying the square-mesh cuts; the same admissible rational parameters λ, μ > 0, ν ≥ 0. So the 45 duals of 3.3 can be kept in a formal port; the approximation is not formalised | **P** (codex-a7c4, A15R; re-derived by claude-b9ee, A15R review); not Lean | A15R `REMOTE.md` §4 |
| 3.13 | Convex-cell transfer: at fixed ε, if a family of remote q satisfies Λ_{θᵢ}(q) ≤ Uᵢ at the vertices θᵢ = (aᵢ, bᵢ) of a convex cell and H is a concave lower bound of S on the cell with Uᵢ − H(θᵢ) ≤ η, then Λ_θ(q) ≤ S(θ) + η on the cell | every dimension; H can be the supporting plane of θ ↦ 2E\|Z(a + bT) + √v₀W\| − v₀/ε at the peak (3.14). It replaces the first-order loss of 3.11 by a vertex-to-support gap; the count of about seven million anchors (A15 `REMOTE.md` §4) is for the method of 3.11 only. No cell is certified: remote caps exist at the peak only, and 3.15 and 11.53 use the peak anchor directly | **P** (codex-a7c4, A15R; re-derived by claude-b9ee, A15R review) | A15R `REMOTE.md` §5 |
| 3.14 | Gaussian benchmark at the peak by the direct Rice formula: 1.3739535256614828 < B(v₀) − v₀/ε < 1.3739535256614829 at v₀ = 403448/10⁷, hence 1.3739535256614 < S < 1.3739535256616; gradient of the fixed-v₀ competitor ∂_aB ∈ (1.689944147450845, 1.689944147450846), ∂_bB ∈ (2.622896929056071, 2.622896929056073) | peak row; independent of the October benchmark code; no remote cap follows from it | **C** (160-bit Arb; codex-a7c4, A15R; replayed by claude-b9ee in the A15R review and in rev. #409, values reproduced by plain quadrature, **N**; Rice formulas, analytic callbacks and tail bounds inspected in A15F; Arb internals not audited) | A15R `REMOTE.md` §3; `remote_benchmark_crosscheck.py`; `review_claude-b9ee_spot_checks.py` |
| 3.15 | One-sided profile rectangle: with λ = ε/(1891/2500), ε ∈ [0.74, 0.76], 0 ≤ a/λ − 0.5592 ≤ 1/2000 and 0 ≤ b/λ − 0.1432 ≤ 1/625, every remote cubic has Λ(q) < S + 2348075715791501/23637500000000000000 < S + 10⁻⁴ | every finite dimension and energy; not the flank or upper rows, not the box; 3.11 covers other directions. The raw functional only: the retained analogue, with a weighted scaling, is 11.53 | **P + C** (codex-a7c4, A15F; re-derived and replayed by claude-b9ee, rev. #409), from 3.3 and 3.14 | A15F `REMOTE.md` §§1–2; `remote_profile_transfer.py` |
| 3.10, 3.16, 11.3 | Raw and retained remote values: for every remote q ∈ L², with μ = Π₁,rem E_{z₁}ph(L + q) (the projection on the remote first chaos), ‖μ‖²/(1 + j₀) ≤ Λ(q) − Λ̂(q) ≤ ‖μ‖²; at the peak 1/(1 + j₀) = 0.411188641…. So Λ̂(q) = Λ(q) exactly when μ = 0. The two values differ pointwise: for q = cX(\|Y\|² − 1), c > 0, Λ̂(q) < Λ(q) at every amplitude and every profile a > 0, b ≥ 0 (at the peak and c = 1/100 by more than 33860761/75000000000000000000 > 1/(3·10¹²)); for q = cXY·conj(V) (three independent remote coordinates) μ = 0. The pointwise difference does not separate the suprema: the benchmark S is common to both (2.14), and the raw cap 3.3 serves both functionals | every amplitude, every finite dimension | **P + C**: the left inequality from `ch20` and EXT-P (re-derived by claude-b9ee, REV; tested on the Wick monomial at six amplitudes, **N**); the right inequality, the two families and the exact witness by codex-a7c4 (A15V), re-derived and replayed by claude-b9ee (rev. #413); j₀ enclosed in the TILT verifier (TILT-REV3) | `ch20` (theorem "quantitative penalty for the q-only part"); EXT-P; REV; A15V `FOUNDATIONS.md` §§2–6; `retained_remote_exact.py` |
| 3.17 | Weighted retained scaling: with λ > 0, Λ̂ at the profile (λε₀, λa₀, λb₀) satisfies Λ̂(λG) = λ·Λ̂₀^{(λ)}(G), where Λ̂₀^{(τ)} is Λ̂ at (ε₀, a₀, b₀) with the multiplier cost τ‖ξ‖². Raw homogeneity fails strictly for Λ̂: for q = cX(\|Y\|² − 1), c > 0, the left side exceeds λΛ̂₀(q) when λ > 1 and is below it when λ < 1 | every λ > 0 and finite dimension; a transfer of the retained A-core must use the cost k_λ and the scaled energy range of 11.53 | **P + C** (codex-a7c4, A15S; re-derived and replayed by claude-b9ee, rev. #419) | A15S `REMOTE.md` §§3–5; `retained_profile_transfer.py` |

External claims about the remote part (EXT-R; the package it names is not in the record, so nothing is checked). In
its normalisation λ = 0.75637, η = 0.31631, L = Z + ληH(Z), A = 1 − λη², Φ(q) = (E\|L + q\|)²/(A + λ⁻¹E\|q\|²), for
remote cubics q in every dimension:

| # | claim | status |
|---|---|---|
| 11.7 | E\|q\|² ≤ 1 ⟹ Φ(q) ≤ 2853/4000 = 0.71325 (124 interval rectangles) | **R** |
| 11.8 | θ ≤ 1/2 ⟹ Φ(q) ≤ 2853/4000 at every amplitude, B = ⅓E[∇X∇Xᵀ] for X = √2·Re q, θ = ‖B‖_op/‖B‖_HS | **R** |
| 11.9 | Φ((Q₁ + Q₂ + Q₃ + Q₄)/2) ≤ 2853/4000 for four independent copies of any remote cubic | **R** |
| 11.10 | E\|q\|⁶ ≤ 6u³ + 9uδ + 96·√(6/23)·θ·δ^{3/2} | **R** |
| 11.11 | A remote counterexample would need E\|q\|² > 1 and ‖B‖²_HS/‖B‖²_op < 4 | **R** |

The normalisation agrees with ours (**N**, REV §3): the visible profile is L = Z(0.66165 + 0.16917\|Z\|²), ratio 0.2557
against 0.2561 at the peak, and the supremum of Φ over Gaussian remote q is 0.7131355 at E\|q\|² = 0.0572, the known
model norm. So 11.7 would close the remote part with a loss of 1.15·10⁻⁴, just below the threshold 500/701 for 1.402.
Cubics sharing z₁ are outside these claims.

## 4. Layer L2: the core with disjoint drivers

| # | statement | scope | status | where |
|---|---|---|---|---|
| 4.1 | Redistribution: F(H + (T − 1)U) ≤ F(H + √b·W) for mutually independent z₁, H, U, with U proper Gaussian, H ∈ L², W a fresh standard Gaussian, when b + h ≤ ℓ² (b = E\|U\|², h = E\|H\|²) | all amplitudes in that range; reduces the disjoint core to L1 with the same η. The independence of H from z₁ is necessary (item 66) | **P** (audit) | REP §1; ADD §4.1; `RCV/chatgpt-thread1-remote-cubic-comparison.tex`; A15 `CLAIMS.md` |
| 4.2 | Cost form: Λ(q + (T − 1)U) ≤ Λ(q) − (1/ε − 197/(200ℓ))‖U‖² for mutually independent z₁, q, U, with q ∈ L² and U centred proper Gaussian | every amplitude, every ε > 0, ℓ > 0 with β/ℓ ∈ [2/15, 4/19], hence the whole box, with cost at least 3/152 there; no energy cutoff, no cubic assumption on q | **P + C** (codex-a7c4, A15T; re-derived and replayed by claude-b9ee, rev. #403: 15 profile intervals, 575 scale intervals, infinite ray) | A15T `POTENTIAL.md`, `potential_bounds.py`, `potential_full_box.py`; A15R `REMOTE.md` |

## 5. Shells without a remote cubic, conditionally Gaussian adversaries, odd sectors over the zero core

| # | statement | scope | status | where |
|---|---|---|---|---|
| 5.1 | Theorem A: if the Wick polynomial of G vanishes at z₁ = 0 (every sector except A and q), then F(G) ≤ B(‖G‖²) (same-norm domination), with the paired F(G) = E\|L + G\| + E\|L − G\| (G need not be even in z₁) | every amplitude; needs a/β ≥ 11/4 and q = 0 | **P** (audit: a complete analytic reconstruction) | REP §1; ADD §2 |
| 5.1a | With q ≠ 0, a remote variance h adds a positive tangent correction (h/2)·I_H, I_H > 0, to the argument of Theorem A; a quantitative extension holds for (19/11)h ≤ D/10 + E/2 | — | **P** (audit) | ADD §2; LOG §11e |
| 5.2 | Theorem B: if 𝓕 is independent of z₁ and G is centred proper Gaussian given (z₁, 𝓕) with conditional variance s + u(T − 1)² + bT + cT², coefficients nonnegative, integrable and 𝓕-measurable, then F(G) ≤ B(‖G‖²) | needs 0 < a/β ≤ 11/2 (tight for this proof); covers the σ* = 0 corner; excludes arbitrary conditional cross-covariance; the independence of 𝓕 from z₁ is necessary (item 67) | **P** (audit; no numerical premise) | REP §1; ADD §3; `RCV/chatgpt-thread2-gaussian_domination_note.tex`; A15 `CLAIMS.md` |
| 5.3 | A genuine cubic can have a sign-indefinite conditional cross term: X[(T − 1) + (\|Y\|² − 1)] has conditional variance [(T − 1) + (\|Y\|² − 1)]² | so shared-driver cubics are outside 5.2 | **P** (audit) | REP §3 item 10; ADD §3 |
| 5.4 | Odd sectors over the zero core: Λ(O) ≤ Λ(0) − k₁v − k₃h for O = z₁Q + z̄₁P + d·z₁(T − 2), v = E\|Q\|² + E\|P\|², h = 2\|d\|², with (k₁, k₃) = (0.128, 0.330), (0.156, 0.356), (0.166, 0.361) at the peak, flank and upper rows: rounded safe lower bounds of k₁ = p − J₁ and k₃ = p − (J₃ − 4J₂ + 4J₁)/2 (at the flank k₃ = 0.35662424897376…); sharpness (5.4a) refers to the unrounded coefficients | every amplitude, every dimension, zero even core; Q, P arbitrary remote L² variables with EQ = 0; row-specific (item 70) | **P + C** (the package of an external assistant; derived independently with a rational scalar certificate by codex-a7c4, A15; the coefficients re-derived by claude-b9ee, A15R review) | A15 `ODD_COST.md`, `odd_cost_check.py`; MON §4b; LOG §35; `RCV/odd_sector_certificate/` |
| 5.4a | The zero-core coefficients k₁ = p − J₁ and k₃ = p − (J₃ − 4J₂ + 4J₁)/2 (J_k as in A15R `SECTORS.md`) are sharp on the Q- and d-axes; at (0.76, 0.76, 0.16) the genuine cubic (i/100)Z(\|Y\|² − 1) raises Λ above Λ(0) by more than 7·10⁻⁶, and at the flank (i/100)Z(T − 2) has cost below 0.36 by more than 5·10⁻⁷ | genuine cubics; consequences in item 70; not a counterexample to K | **P + C** (codex-a7c4, A15R; re-derived by claude-b9ee, A15R review; exact finite-amplitude scalars) | A15R `SECTORS.md` §§2–5; `sectors_exact.py` |
| 5.4b | Pure P axis: Λ(z̄₁P) ≤ Λ(0) − (p − 13J₁/20)E\|P\|² ≤ Λ(0) − 0.41E\|P\|², and Λ̂(z̄₁P) = Λ(z̄₁P) exactly | the whole box; any remote L² P; all amplitudes; zero even core; no simultaneous Q/P bound with this coefficient | **P + C** (codex-a7c4, A15T; re-derived and replayed by claude-b9ee, rev. #403) | A15T `SECTORS.md` §2; `sector_axis_costs.py` |
| 5.4c | Retained zero-core odd majorant: k₃ may be replaced by k̂₃ = p − [I − K²/(1 + J₁)]/2, I = J₃ − 4J₂ + 4J₁, K = J₂ − 2J₁, keeping k₁ on Q and P; the corner cubic of 5.4a also gives Λ̂(O) − Λ̂(0) > 7·10⁻⁶ | any remote L² Q, P with EQ = 0; zero even core | **P + C** (codex-a7c4, A15T; re-derived and replayed by claude-b9ee, rev. #403) | A15T `SECTORS.md` §§3–5; `sector_axis_costs.py` |
| 5.5 | Manuscript theorems on buffered and small-amplitude classes: the polarised class S − α²/10 − β²/4; Gaussian-factor drivers S + 5·10⁻⁵; coherent one-driver A/B with a buffer; several small drivers; arbitrary coupled tensors with buffer g ≥ 9/40 or e ≤ 1/200; global exclusions | as stated in the digest; most need a Gaussian buffer or very small energy | **R** ([P, C] in the manuscript) | DIG §4 items 4 to 10 |
| 5.6 | Buffered coverage: if the remote part is q + gW with a genuine cubic q of energy at most 0.0064 and an exact independent Gaussian buffer g ≥ 0.185, every shared A and B shell is covered at all amplitudes | the family q + gW only, not a bound through the fourth excess of a general cubic | **R** ([P, C] in the monograph of 5 and 6 November, from the manuscript) | MON §3.4 ("Buffered coverage"); `ch55` |

## 6. Layers L3 and L4: the core q + (T − 1)r with shared drivers

The residual rectangle is R = {w < 0.01125, 0.00551 + 0.319w < u ≤ 0.0463}: what the fourth-moment cutoff 6.1.2
(**R**) and the cone of 6.1.1 leave. With the proved regions alone (6.1.1, 6.1.1a) the uncovered set is
{w < 0.0206, 0.00558 + 0.31907w < u ≤ 0.0463}.

### 6.1 Explicit regions (L3)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.1.1 | Orthogonality-only bound: Λ(q + (T − 1)r) ≤ B₀ + 0.389644u − 0.124324w; hence Λ < S + 10⁻⁴ when u ≤ 0.00558 + 0.31907w | peak; any joint L² q, r independent of z₁ with E[conj(q)r] = 0, without chaos or centring assumptions; uses S − B₀ > 0.002074245 | **P + C** (codex-a7c4, A15F; re-derived and replayed by claude-b9ee, rev. #409, with independent quadrature) | A15F `CONTENT.md` §§1–2; `shared_a_second_moment.py`; DIG §4; `lower-bound/sharp-circular.tex`; `ch61` |
| 6.1.1a | For u ≤ 0.0463: w ≥ 0.0206 implies Λ < S + 10⁻⁴; w ≥ 0.0208 implies Λ < S; w ≥ 0.02105 implies Λ < S − 10⁻⁴ | the class of 6.1.1, every larger w; from a concave angular envelope, monotonicity in w and a positive derivative in u (not from the affine bound of 6.1.1) | **P + C** (codex-a7c4, A15F; re-derived and replayed by claude-b9ee, rev. #409; exact degree-27 Bernstein checks, 16,384 outward-rounded cells per integral, analytic tails) | A15F `CONTENT.md` §§2–6; `shared_a_second_moment.py` |
| 6.1.2, 6.1.4 | Fourth-moment bound Λ ≤ B₀ + 0.11u − 0.32w + 5.25w², refined to the cutoff w ≥ 0.01125 ⇒ Λ ≤ S + 10⁻⁴ for u ≤ 0.0463 | arbitrary sharing. The sources use the cutoffs 0.01122, 0.011223 and 0.01125; an exact cover must fix one | **R** (external note; numerical check by claude-b9ee) | MON §3.4; LOG §11h, §12d; `sources/prompts/reply-gpt3-fourthmoment.txt`, `reply-gpt3-refinement.txt`; REC §2 |
| 6.1.5 | The near-Gaussian part δ/u² ≤ 0.05 of R | the K_η argument of `ch7` cited for it uses floating-point constants and a sampled majorant, and its range x ≤ 0.22 gives only δ/u² ≤ 0.0484 | **open** | REP §3 item 11; ADD §6 |

### 6.2 Cost and the reduction to a content inequality (L4)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.2.1 | A-shell cost at zero buffer: Λ(q + (T − 1)U) ≤ Λ(q) + 2Re⟨U, F_A(q)⟩ − κ‖U‖², κ = 0.24, for ‖U‖² ≤ 0.0113 (F_A(y) = y·g(\|y\|²)) | any remote q, any sharing; the three rows (the peak is the worst) | **P** with the exact checker replayed (second audit); the audit uses it as an input without certifying it | PF §1; REC §3; CERT §4; `RCV/chatgpt-shared_driver_rectangle.tex`; `code/ai-thread-verifiers-2026-11-05/chatgpt-thread2-verify_content_extension.mjs` |
| 6.2.2 | Costs κ = 0.19 for ‖U‖ ≤ 1/16, and smaller κ up to ‖U‖ ≤ 3/20 | any dependence | **R** ([C] in the manuscript) | DIG §4 item 3; `ch46` |
| 6.2.3 | Cost plus content closes the A-only core: if C(q)² ≤ κ[B(u) − F(q)], then Λ(q + (T − 1)U) ≤ B(u) − u/ε ≤ S. Weaker sufficient form: S − Λ(q) + η ≥ Ψ_r(C), Ψ_r(C) = C²/κ for C ≤ κr and 2rC − κr² beyond | on the class where both hold; no separate remote input | **P** (second audit) | REC §2; PF §1; LOG §16 |
| 6.2.4 | C(q)² is a supremum over unit linear forms: a bound for every unit direction bounds the full projection, with no dimension factor | every q | **P** (second audit) | REC §2; CERT §7 |
| 6.2.5 | Completing the core on R proves neither raw K for all G nor K′: R carries response restrictions and prior exclusions | — | **P** (logic) | REC §2; ASM §4.4 |

### 6.3 The content inequality C(q)² ≤ κ·D(q): families

On 0.00551 ≤ u ≤ 0.0463 at the three rows unless stated. X is a driver, Y the other coordinates, P centred.

| # | family and statement | constant | status | where |
|---|---|---|---|---|
| 6.3.1 | Moment theorem: E\|P\|⁶ ≤ 37p·E\|P\|⁴ − 68p³ and E\|P\|⁴ ≥ 2p² for P = Y*AY − tr A, any complex A, p = E\|P\|² | — | **P + C** (audit; 265 Wick contractions enumerated exactly) | REP §1; CERT §1 |
| 6.3.2, 6.3.3 | q = X·P with P any centred variable independent of X satisfying the two moment bounds of 6.3.1; every complex quadratic P(Y) does | 0.22 | **P + C** (audit: all 441 kernel nodes recomputed with Arb at 160 bits and contained in the stored bounds; domain and tail verifier replayed at the three rows) | REP §1; CERT §§1, 3; `RCV/r26_reweighted/`; `RCV/r23_r25_certificate/` |
| 6.3.4 | Gaussian-factor class q = Σ_j X_jP_j(Y): any number of independent Gaussian drivers, any complex coefficient matrices, no covariance restriction; the argument controls the whole content vector | 0.239 | **P + C** (audit: 2,143,397 rectangles replayed). Needs the split into drivers and coefficients; no self-interaction | REP §1; CERT §2; `RCV/gaussian_factor_content/` |
| 6.3.5 | Hermitian self-interaction q = e^{iα}X[c(\|X\|² − 2) + Y*AY − tr A], real c, Hermitian A, every share, u ∈ [0.03, 0.0463]: C² ≤ 0.23(Δ − 1/40000), Δ ≥ 1/40000 | 0.23 | implication **P** (audit); 81,642,330 integer dual comparisons **C** conditional on saved scalar bounds (the scalar enclosure chain is not regenerated). A complex relative phase between c and A is not covered | REP §1; CERT §4; `RCV/r26_self_interaction/` |
| 6.3.6 | Wick neighbourhood q = X[c(\|X\|² − 2) + P], P centred, independent of X, with finite second moment and p = E\|P\|² ≤ u/5 | 9/40 | analytic perturbation and moment implications **P** (audit; the finite-second-moment scope checked in A15V); numerical premises **R** | REP §1; CERT §5; `RCV/wick_r26_twenty_percent/`; A15V `AUDIT.md` §3 |
| 6.3.7 | Deficit identity for the self-interaction family ("R24"): B(u) − F(q) = Ê d_{u,R}(\|b\|²) + \|c\|²𝓚(u), 𝓚 > 0; at the peak 𝓚(0.0463) ∈ (0.166781, 0.166783) | — | identity **P** (second audit); the value of 𝓚 **R** | REC §4; `RCV/r23_r25_certificate/`; `RCV/r26_envelope_audit/` |
| 6.3.8 | Shell bookkeeping ("R25"): the frequency-one coefficient of q²q̄ keeps cross terms between shells; q = X̄Y² + (\|X\|² − 1)Y has energy 3 and E[X̄q\|q\|²] = 6 | so the family theorems do not add up (item 32) | **P + C** (audit) | CERT §8; REC §4 |
| 6.3.9, 6.3.9a, 6.3.9b | Mixed-character neighbourhood: for p, h ∈ H₂,₁ with p of charge one under rotation of a coordinate block, h with only the other characters, D(p) > 0 and C(p)² ≤ (9/40)D(p): ‖p + h‖² ≤ 0.0463 and ‖h‖² ≤ D(p)/90 imply C(p + h)² ≤ (6/25)D(p + h) | peak row, every dimension; a neighbourhood only, conditional on the core inequality (6.3.3 or 6.3.6); p, h ∈ H₂,₁ is needed (item 74) | **P + C** (perturbation argument of codex-a713, IMP-CE, sharpened by codex-a7c4, A15R and A15T, with the off-character weight 15√π/16; re-derived by claude-b9ee, A15R review and rev. #403; exact coefficient 8429832706429/6250000000000 < 1.35) | IMP-CE; A15R `CONTENT.md`; A15T `CONTENT_KERNELS.md`; `content_constants.py`, `content_kernels_exact.py` |
| 6.3.10 | Sharper constants in special cases: ratio C²/D at most 0.103 for the Wick monomial and 0.055 for X(\|Y\|² − 1) at the three rows; C² ≤ (56/5)ρ·D for the Gaussian-factor class, ρ = ‖E[PP*]‖_op | — | **R** (not examined by the audits) | MON §3.4, §3.6; `RCV/hermitian_content/`, `RCV/wick_endpoint_extension/`, `RCV/wick_endpoint_one_twelfth/`, `RCV/r26_twenty_percent_extension/`, `RCV/chatgpt-shared_driver_rectangle.tex` |
| 6.3.11 | \|C_X(q)\|² ≤ 50κ₄^{3/2} for every cubic (κ₄ the fourth cumulant); hence the content inequality with 0.19 for u ≤ 0.00038 (constant 1 for u ≤ 0.001) | every cubic; its deficit coefficient is negative for u > 0.0017, so it says nothing at the energies that matter | **R** as a theorem, both constants: the replayed checker verifies scalar constants only, and the derivation of the tensor identities is not in the record | REP §1; CERT §7; DIF §4 |
| 6.3.12 | ‖Π₁,₀(q\|q\|²)‖² ≤ (3√6/4)δ^{3/2} for every cubic; ≤ 0.481δ^{3/2} on the Hermitian one-driver class, with an example above 0.4808 | — | general constant **R** (`content_tensor_next.md` of TILT also claims it, **R**); the class bound and the example **C** (second audit) | MON §3.4; REC §3 |
| 6.3.13 | One driver with self-interaction, non-Hermitian P, Wick share between 1/16 and 4/5, u ≥ 0.03: the envelope (★) giving 0.22 | tail proved (**R**); compact part true on grids, smallest margin 0.38 % of H (**N**); six local boxes certified, not a cover | **open** | MON §4; LOG §22, §23, §29; `RCV/integrated_wick_envelope/` |
| 6.3.14 | Small-Wick strip (share < 1/16, c ≠ 0): candidate (†) with an affine weight, numerically 0.2306 | exact tail checker **C** (audit); a neighbourhood of share 0 of unknown width; the compact domain is not certified, and 0.2306 is not an upper bound | **open** | CERT §3; LOG §27 |
| 6.3.15 | The same family for u < 0.03 with p > u/5 | nothing | **open** | LOG §26 |
| 6.3.16 | Mixed one-driver shells X̄B(Y), (\|X\|² − 1)V(Y), X²W̄(Y), R₀(Y) with their cross terms | exact bookkeeping 6.3.8 and the neighbourhood 6.3.9b | **open** | — |
| 6.3.17 | Several self-interacting drivers | no driver-by-driver argument exists (item 32) | **open** | REC §4 |
| 6.3.18 | **The raw content inequality for an arbitrary cubic on R** | no uniform theorem covers arbitrary tensors on [0.00551, 0.0463] | **open** | REP §2 (c) |
| 6.3.19 | One-driver family with c = 0, P equal in law to −P and the remote remainder R independent: the content vanishes by symmetry, so K holds exactly for 1/24000 ≤ w ≤ 0.0113 | content 0 | **R** ([P, C] in the monograph of 5 and 6 November) | MON §3.4 ("Proved on R for the two templates") |

### 6.4 Values at the Wick monomial and its saddle (the monomial is not the maximiser: item 20)

| # | statement | scope | status | where |
|---|---|---|---|---|
| 6.4.2 | At u = 0.0463: Wick monomial 0.087565304234; along X[(\|X\|² − 2) + iτ(\|Y\|² − 1)]: 0.087576329175 at τ = 0.1, maximum 0.0875781815 near τ = 0.1276; best two-variable candidate X[(\|X\|² − 2) + z(\|Y\|² − 1)], z = 0.05283531218 + 0.22122669064i: **0.08760259435** | peak row; deterministic quadrature, two independent implementations agree to about 10⁻¹² | **N** | REP §5; OPT §4; PF §3; `code/audit-2026-11-13/results/STRUCTURED_BASELINE.json` |

### 6.5 What any proof of the content inequality must use

| # | statement | status | where |
|---|---|---|---|
| 6.5.1 | Gaussian-marginal obstruction: at the peak, Q = √u₀·X·exp(2πi·F₂(\|X\|²)) with F₂(r) = 1 − (r + 1)e^{−r} and u₀ = 403448/10⁷ has exactly the law of √u₀·W, is orthogonal to the whole remote first chaos and has the matched conditional covariance profile; with t₀ = 1/1250, G = Q − i·t₀(T − 1)X satisfies Λ(G) > S + 7·10⁻⁷. G is not a cubic: E‖DQ‖² = u₀(1 + 64π²/81) > 3u₀. So the law of the residual, orthogonality and radial tests are not enough: the Wick structure (E‖Dq‖² = 3u, the resolvent identity) must enter. A stronger example of `ch35` (a violation of the whole 1.402 allowance with 44 % of its energy outside H₂,₁) is **R** | **P + C** (codex-a7c4, A15S: fresh kernel derivatives, the direct Rice benchmark, a rational budget; re-derived and replayed by claude-b9ee, rev. #419, who finds Λ(G) − S ≈ 1.12·10⁻⁵ by quadrature and by Monte Carlo, **N**) | A15S `OBSTRUCTION.md`; `gaussian_obstruction.py`; DIG §3; `ch35`; LOG §11e, §11h |

## 7. Layer L5: sector assembly

### 7.1 The B shell

| # | statement | scope | status | where |
|---|---|---|---|---|
| 7.1.1 | B-shell cost: Λ(q + z₁²·conj(r)/√2) ≤ Λ(q) + 2Re E[conj(r)·F_B(q)] − κ_B‖r‖², κ_B = 13/50, 29/100, 3/10 at the peak, flank and upper rows | every remote q, r ∈ L², every amplitude, any sharing; the base must be remote (item 39) | **P + C** (audit) | REP §1; ASM §3.1; REC §3; `RCV/b_shell_global_cost/` |
| 7.1.2 | The B shell has first-order content: for H = X(\|X\|² − 2), E[X̄H] = 0 and E[X̄H\|H\|²] = 32, so a small B shell of the right phase raises Λ | — | **P** (audit) | ASM §3.1; REP §3 item 5; LOG §31 |
| 7.1.3 | B-content for the Gaussian-factor class: C_B² ≤ (239/2000)·Δ; local B-cost 7/20 for shell energy ≤ 0.0113 | three rows | **R** (replayed by the user only) | MON §4b; LOG §32; `RCV/b_sector_content_and_cost/` |
| 7.1.4 | Peak alignment: \|g_B(v) − 0.5053·g(v)\| < 0.007 for every v ≥ 0; hence ‖c_B − 0.5053c_A‖ ≤ 0.007√u by L² contraction | peak profile; every remote L² q in every dimension; no energy cutoff or cubic assumption | **P + C** (codex-a7c4, A15T; re-derived and replayed by claude-b9ee, rev. #403: 100-bit Arb endpoints and derivative moments, an exact 79-cell cover of [0, 16], a complete-monotonicity tail) | A15T `ALIGNMENT.md`, `CONTENT_KERNELS.md`; `kernel_alignment.py`; REC §1; `RCV/J3_audit/` |
| 7.1.5 | B-content for a general cubic | by 7.1.4 it reduces to A-content | **open** | LOG §32 |
| 7.1.6 | For k_A = −g, k_B = −g_B: [k_B(0)/k_A(0)]k_A(v) ≤ k_B(v) ≤ k_A(v)/√2 for v ≥ 0, with sharp lower coefficient. At the peak it exceeds 0.5053; centering the one-sided difference gives ‖c_B − 0.5053c_A‖ ≤ 0.0035√u | kernel comparison for every a > 0, b ≥ 0; projection estimate at the peak for every remote L² q with Π₁q = 0, every dimension and energy. Orthogonality is essential for the halved error | **P + C, author only** (codex-a7c4; internal re-derivation and exact replay, external review pending). Inherits the reviewed positive kernel representations and 7.1.4 | KPROG `JOINT_CONTENT.md` §§1–3; `joint_content_exact.py` |
| 7.1.7 | Matched retained B tilt s_B = 15159/50000: ‖c_{B,s_B}(q)‖² ≤ D₊/10 + 443/10⁸ | peak row, every remote cubic with u ≤ 0.0463, every dimension; first-order content only, no finite-amplitude cost or joint bound | **P + C, author only** (codex-a7c4). Inherits the completed tilted-A theorem 11.50 and new 7.1.6 | KPROG `JOINT_CONTENT.md` §4; `joint_content_exact.py` |

### 7.2 The z-odd sectors z₁Q, z̄₁P, d·z₁(T − 2) over a nonzero core

| # | statement | scope | status | where |
|---|---|---|---|---|
| 7.2.2 | Directional majorant: (\|X + Y\| + \|X − Y\|)² ≤ 4M − 4c²/M, M = \|X\|² + \|Y\|², c = Re(XȲ) | pointwise | **P** (audit) | ASM §3.2 |
| 7.2.3 | One nonzero core: Λ(H + τO) ≤ Λ(H) − 0.063‖τO‖² for 0.03 ≤ \|τ\| ≤ 0.04 (0.174 at \|τ\| = 0.04) at one explicit core H and one odd direction O | peak row, that core only | analytic reduction **P** (audit); interval integration **R** | ASM §3.2; LOG §37; `RCV/directional_odd_cost/` |
| 7.2.4 | Uniform pure cost Λ(H + O) ≤ Λ(H) − κ_E‖O‖² over genuine even cubic cores H at the required rows | full-box nonincrease is false even at H = 0 (item 70); numerically the true cost is 0.79 to 1.32 per unit energy on nine cores (**N**) | **open** | `sources/prompts/subproblem-E2-uniform-odd-cost.txt`; A15R `SECTORS.md`; LOG §36; `e11_oddform.py` |
| 7.2.5 | Two coupling channels: at a remote base q, with the normalised one-coordinate sector ν·z₁(T − 2)/√2 (ν = √2·d), Λ(q + λz₁Q + μν·z₁(T − 2)/√2) = Λ(q) + λ²U + μ²V + 2λμK + o(λ² + μ²) with K = Re ν·E[Re Q·A(\|q\|)] + Im ν·E[Im Q·B(\|q\|)] for two distinct radial kernels A, B (equivalently a Hermitian and a complex-bilinear pairing). At q = 0, A(0) = 0 and EQ = 0 kill both terms; E[Q \| \|q\|] = 0 suffices at a nonzero core. At the peak, q = 0.001·X(\|Y\|² − 1) and f = \|Y\|² − 1 give K(q; f, 1) < −8·10⁻⁶ and K(q; if, i) > 4·10⁻⁶ | every positive profile; genuine cubics q ∈ H₂,₁, Q ∈ H₁,₁; the Hessian exists. No finite-amplitude conclusion, and no failure of a positive full cost matrix, follows | **P + C** (codex-a7c4, A15S: exact radial intervals with an analytic remainder; re-derived and replayed by claude-b9ee, rev. #419). **N** (rev. #419): with M = ∫₀^∞(t − 2)t^{−1/2}e^{−t}(a + bt)^{−3}dt = −13.1838749382942 at the peak, K_R(c) ≈ c²M/√2 and K_I(c) ≈ −c²M/(2√2) for q = cX(\|Y\|² − 1); at c = 10⁻³, K_R = −9.31989·10⁻⁶ and K_I = 4.66057·10⁻⁶, confirmed by mixed finite differences without the kernels A, B; the true remainders are about 2.5c³ and −0.6c³ | A15S `JOINT.md` §§2–5; `odd_coupling.py` |
| 7.2.6 | Over every remote q, each of z₁Q and z̄₁P separately has cost κ₁ = 0.01, 0.03, 0.04 at the peak, flank and upper rows; ν·z₁(T − 2)/√2 has cost κ_ν = 0.22, 0.24, 0.25: both Λ(q + O) ≤ Λ(q) − κ‖O‖² and Λ̂(q + O) ≤ Λ̂(q) − κ‖O‖² | q, Q, P arbitrary remote L², arbitrary sharing and amplitudes, every dimension; ν constant; base has no A/B shell | **P + C, author only** (codex-a7c4; internal re-derivation and independent replay of six whole-half-line potential certificates with analytic tails; external review pending) | KPROG `ODD_CONTROL.md` §§1–4; `odd_control.py` |
| 7.2.7 | Simultaneous O = z₁Q + z̄₁P + ν·z₁(T − 2)/√2: Λ(q + O) ≤ Λ(q) − κ₁(‖Q‖² + ‖P‖²) − κ_ν\|ν\|² under E[Q \| q] = E[P \| q] = E[Q·conj(P) \| q] = 0. The retained analogue holds for genuine Q ∈ H₁,₁, P ∈ H₂,₀ on a Gaussian block disjoint from q | the three rows, every amplitude and dimension; not arbitrary shared odd sectors, not a core with A/B | **P + C, author only** (codex-a7c4), with the same scalar certificates as 7.2.6 | KPROG `ODD_CONTROL.md` §§1, 3–4 |

### 7.3 The joint A/B form: what is certified

| # | statement | scope | status | where |
|---|---|---|---|---|
| 7.3.1 | At q = 0: Λ(sH) = 2E\|L\| − s²Q₀ + o(s²) for H = (T − 1)r_A + z₁²·conj(r_B)/√2, with Q₀ ≥ 0.24‖r_A‖² + 0.26‖r_B‖² + 0.236·Re E[r_A·conj(r_B)] + 0.08(‖r_A‖² + ‖r_B‖²); exact entries k_A = p − (J₂ − 2J₁ + J₀)/2, k_B = p − J₂/4, m = (J₂ − J₁)/(2√2) | the three rows; arbitrary jointly distributed remote L² forms r_A, r_B; infinitesimal, zero core only (the same matrix: 11.4) | **P + C** (codex-a7c4, A15F; dominated remainder and scalars re-derived and replayed by claude-b9ee, rev. #409) | A15F `JOINT.md` §§1–2; `joint_reduction.py`; LOG §38; `RCV/signed_joint_ab_hessian/` |
| 7.3.2 | At every remote base q: −½·(second derivative of Λ along the A/B direction) ≥ 0.241‖r_A‖² + 0.261‖r_B‖² + 0.236·Re E[r_A·conj(r_B)] | three rows; every dimension and sharing; no energy cap on q; infinitesimal only (item 40) | analytic reduction and exact tail (x ≥ 6) **P + C** (audit); compact integral bounds **R** (the coverage of [0, 6] by 474 boxes and the positivity of the stored bounds checked) | REP §1; ASM §3.3; LOG §42, §43; `RCV/all_shift_signed_ab/`, `RCV/all_shift_signed_ab_v2/` |

### 7.4 The joint A/B form: the missing statement

Set h = (T − 1)r_A + z₁²·conj(r_B)/√2, V = L + q and R(V, h) = 2(\|V + h\| − \|V\| − Re(h·conj(ph V))). **Missing**
(first at the peak row): for every dimension, every q ∈ H₂,₁ with 0.00551 ≤ ‖q‖² ≤ 0.0463 and arbitrary remote linear
forms r_A, r_B with squared norms at most 0.0113,

    E R(V, h) ≤ (p − 0.24)‖r_A‖² + (p − 0.26)‖r_B‖² + 0.236‖r_A‖‖r_B‖          (robust form),

or the signed form with −0.236·Re E[r_A·conj(r_B)] in place of the last term. **Open.** It does not follow from its
restrictions to either axis (item 43); the other rows, the omitted energies and any response restriction are separate
obligations. For complex numbers x, α, β write r_x(α, β) = E_{z₁}R(L + x, (T − 1)α + z₁²·conj(β)/√2),
Q_r(α, β) = (p − 0.24)\|α\|² + (p − 0.26)\|β\|² + 0.236\|αβ\| and Q_s the signed analogue.

| # | statement | status | where |
|---|---|---|---|
| 7.4.1 | For a positive-definite real cost matrix [[k_A, m], [m, k_B]] (k_A > 0, k_B − m²/k_A > 0), the unrestricted optimised gain is ‖c‖²/k_A + ‖d − (m/k_A)c‖²/(k_B − m²/k_A), with c, d the A and B contents; amplitude caps can only reduce it | **P** (audit; hypotheses as in the cited proof, A15R; without them false, item 72) | REP §4; ASM §1; A15R `SECTORS.md` §7 |
| 7.4.2 | Sufficient content constants γ (k_A = 0.24, k_B = 0.26, u ≤ 0.0463, peak alignment 7.1.4): favourable signed m = 0.118 and γ = 0.24 give an excess < 0.000051525; joint diagonal cost (m = 0) and γ = 0.15 give ≤ 1.438·10⁻⁵; an adverse cross coefficient at most 0.118 and γ = 0.10 give ≤ 7.181·10⁻⁵ (exact threshold for 10⁻⁴: γ ≤ 4889900/47482107). Conditional on the corresponding joint bound and content premise; sufficient, not necessary | formulas **P**; scalar budgets **C** (codex-a7c4, A15T and A15; re-derived and replayed by claude-b9ee, rev. #403) | A15T `ALIGNMENT.md` §5, `alignment_budget.py`; A15 `claims_exact.py`; REP §4; ASM §1; REC §1 |
| 7.4.5 | Reduction to a compact box: if r_x(α, β) ≤ Q(α, β) − η(\|α\|² + \|β\|²) for 0 ≤ x ≤ 29/10 and all complex α, β with \|α\|, \|β\| ≤ 0.4, with η = 7.53·10⁻⁵ for Q_r (8.07·10⁻⁵ for Q_s), then the missing statement holds for every remote q and shells of variance ≤ 0.0113, with any dependence. On \|x\| ≥ 29/10, at every amplitude and the three rows, r_x ≤ (187/200)(\|α\|² + \|β\|²), a reserve of at least 0.007(\|α\|² + \|β\|²) for both targets. **The compact box inequality is open** | **P + C**: the reduction with exact rational checks by codex-a713 (IMP-JT); every scalar input (densities and Jacobian, potential lemma, density caps, tail matrices, the six reserve rows) and the cutoff 29/10 certified exactly by codex-a7c4 (A15V); all of it re-derived and replayed by claude-b9ee (rev. #409 for the tail and closing steps, rev. #413 for the rest; the true potential at x = 2.9 is about 0.782 against the certified 0.930, **N**) | IMP-JT; A15F `JOINT.md` §3; A15V `JOINT.md` §§1–4; `joint_reduction.py`, `joint_tail.py` |
| 7.4.6 | Margins of the empirical content ratio 0.0876 against the constants 0.10, 0.15, 0.24: 1.142, 1.712, 2.740 | **N** | REP §5 |
| 7.4.8 | Along the zero-core direction (r_A, r_B) ∝ (1, −1/5), which a shared Gaussian linear driver realises, the limiting raw joint cost is in (0.298526023077303, 0.298526023077304) | **P + C** (codex-a7c4, A15F; re-derived and replayed by claude-b9ee, rev. #409, also by direct quadrature) | A15F `JOINT.md` §2.1; `joint_reduction.py` |
| 7.4.9 | Sharp zero-core least eigenvalues of the raw A/B form: peak (0.298364651634117, 0.298364651634118), flank (0.323152847874178, 0.323152847874179), upper (0.327715897185325, 0.327715897185326); peak B-energy share (0.032688705743602, 0.032688705743603); each realised by a genuine cubic Gaussian-driver direction. So no global common A/B cost exceeds these values. The pointwise imaginary Q/ν block has least eigenvalue (−0.387101627337727, −0.387101627337726) with ν-energy (0.418138450101614, 0.418138450101615); constant Q is not a centred quadratic, so no integrated cubic obstruction follows | **P, author only** (codex-a7c4, A15V) + **C** (replayed by claude-b9ee, rev. #413, who also computed the three values to 40 digits: 0.29836465163411746994, 0.32315284787417817, 0.32771589718532516, **N**) | A15V `JOINT.md` §5; `joint_tail.py` |
| 7.4.10 | Conditional retained joint bridge: if the global pointwise quartic remainder inequality (P) in KPROG `JOINT_TARGET.md` holds, then Λ̂(q + A + B) < S + 4936/10⁸ for every genuine remote cubic and holomorphic A/B drivers with u ≤ 0.0463 and u + V ≤ 0.080051. Uses sharp shared moments E[\|q\|²S_r] ≤ 4uV, E[S_r²] ≤ 2V² and the existing tilted-content coefficient 0.3; an exact 1,000-cell scalar check gives sector gain − D₊ < 49/10⁶, with remote error 36/10⁸ added without attenuation | **P + C, author only** (codex-a7c4; independent re-derivation and separate rational replay within the session). **The compact interior of the pointwise premise is open**. Its exterior holds when |w| ≥ 5/2 or sqrt(S_r) ≥ 33/20 by a uniform remainder bound Rem ≤ (17/5)S_r and a large-amplitude bound; the polynomial density and cutoff checks are exact. No unconditional joint, odd-sector or K theorem | KPROG `JOINT_TARGET.md`; `joint_target_check.py`, `joint_target_multipliers.json`, `joint_target_result.json`, `joint_target_tail.py` |

### 7.5 All sectors together

**Open.** No theorem covers G = q + A + B + odd sectors with q ≠ 0: Theorem A needs q = 0 and Theorem B Gaussian
drivers with a nonnegative profile. Numerically every value of Λ − S tested on H₂,₁(ℂ²) with 18 shells is negative
(2.3). Needed: the joint A/B bound (7.4), keeping the joint law of q and its drivers; A-content for general cubics,
which 7.1.4 turns into B-content; a uniform cost for the odd sectors over a nonzero even core (7.2.4). Numerically
(11.45) the pointwise remainder bound of the tilted A-sector (11.39) has analogues for A and B together and for A, B,
z₁Q and z̄₁P, but not with d·z₁(T − 2): its cross term with z₁Q vanishes after integration at the zero core (EQ = 0),
while at a nonzero core it has two coupling channels (7.2.5; item 77).

## 8. Layer L6: row envelope and consumption

| # | statement | scope | status | where |
|---|---|---|---|---|
| 8.1 | Central consumer component: at the single peak row, an all-sector bound (raw or retained) Λ ≤ S + η with η ≤ 10⁻⁴ covers t ∈ [0.84, 0.851] with cap margin > 6.12·10⁻⁷ below 500/701. Separately, the largest admissible allowance on that interval is η_max = 166713115892493/1656988750000000000 = 0.0001006120988404375…, with no reserve; the same row also covers [0.83995, 0.85125] | conditional on the upper enclosure of S (3.14) and on the open all-sector premise; a remote-only cap does not replace that premise | **P + C** (codex-a7c4, A15R; re-derived by claude-b9ee, A15R review) | A15R `FOUNDATIONS.md` §4; `foundations_exact.py` |
| 8.3 | The flank multiplier ε = 149/200 cannot give 1.402: a genuine response has norm above 0.71329 (model value 0.713288, that is 1.401957) | the witness at that ε | **R** (`docs/overview.tex` prints [P, C]; not re-examined for this ledger) | `docs/overview.tex` ("Limits of the witness method"); `OCT/pipeline-gate/KSIDE.md` |
| 8.4 | Under exact K the cap would be about 0.713160 at ε = 0.7564 (moment LP), that is 1.40221; the room to 1.4022 would then be about 5.03·10⁻⁶ | — | **R** (floating point) | MON §5; REC §6.5 |

Thresholds: 1.402 needs a row cap below 500/701 = 0.7132667617…, and 1.4022 below 5000/7011 = 0.7131650263…
(REC §6). The full consumer is not built (**open**): it needs an exact cover of the response parameter t and of the
rows; the σ* = 0 corner (2.5), or a proof that the cover avoids it; interval upper bounds for S at each row; coverage
of the energies outside R and of every omitted response region (with the t-dependent caps of 2.12a); an error ledger
with exact thresholds; and, if rows with different ε are used, their relation to a single witness operator (pointwise
bounds for different operators cannot be minimised silently; REC §5). No `lower_of_K`, `KHyp`, `ConjectureK` or
`K_eta` exists in `Grothe/`, `GrotheKernel/`, `docs/LEAN_DETAILS.md` or `docs/overview.tex`.

## 9. Numerical evidence on the content ratio (all N)

Peak row. R_n(u) is the supremum of C(q)²/D(q) over q ∈ H₂,₁(ℂⁿ) with ‖q‖² = u; R_n is nondecreasing in n (**P**: pad
with zeros). Numbers of OPT are quoted only where a second implementation reproduces them.

| source | what | values |
|---|---|---|
| REP §5: all 6, 18, 40, 75, 126 complex coefficients for n = 2…6; 50 starts at three energies; 750 paths refined to stationarity; 1,500 end points validated on 2²² points; 15 selections on 2²⁴-point holdouts | selected candidates at u = 0.0463 | 0.087602476 (n = 2), 0.087600621 (3), 0.087583916 (4), 0.087532331 (5), 0.087491760 (6); integration errors 10⁻⁶ to 10⁻⁵. At u = 0.03: 0.0785; at u = 0.02: 0.0691 |
| | structured baselines, feasible in every n ≥ 2 | 0.06914308055 (u = 0.02), 0.07857989851 (0.03), **0.08760259435** (0.0463) |
| | reading | no strict increase with n is resolved; the lower values at n = 4, 5, 6 are search limitations; no end point above 0.10; the selected tensors are 96 to 98 % Wick monomial plus an imaginary Hermitian X·P(Y) part (the saddle direction of item 20). At n = 6 the same tensor gives 0.0874917600 with the Wick control variate and 0.0875215483 without it, with approximate 95 % intervals that miss each other by about 3·10⁻⁷ (unresolved; both far below 0.10) |
| KSCAN: n = 2…10, Monte Carlo, 840 runs and a second pass with 2²² samples | best re-evaluated ratio at u = 0.0463 | 0.0892 (n = 2), 0.0888 (3), 0.0886 (4), 0.0885 (5); 0.0854–0.0879 (6), 0.0850–0.0869 (8), 0.0828 and 0.0852 (10); errors ±0.0003 to ±0.0011. Values above 0.0876 are within 2 to 3 standard errors and carry a selection bias (best of 50); where REP overlaps, REP's numbers are the reference. About 0.080 at u = 0.03 and 0.070 at u = 0.02 (n ≤ 5). Untested: n > 10, adversaries with a large diffuse part, the flank and upper rows |
| PF §3; OPT §4: deterministic quadrature on ℂ² | all six coefficients | 0.0876025944 at the same candidate; a local maximum modulo symmetry, not a global certificate |
| DIF: diffuse boundary q = √e·Q + √(u − e)·W with an independent Gaussian buffer | | **P**: C²/D → 0 linearly in e; for N independent Wick blocks the ratio is 0.403153856/N + o(1/N). **N**: 0.0226, 0.0585, 0.0763 at structured shares 0.1, 0.5, 0.8. Shared-driver limits such as X·N^{−1/2}Σ(\|Y_j\|² − 1) are not controlled; the supremum over all dimensions may exceed the scanned values |

A numerical ratio does not measure the distance to a proof: a verified all-dimensional content theorem with constant
0.10 would still leave the joint estimate, the odd sectors, the response regions and the consumer (ASM §5).

## 10. Identity-tail games (all N)

TAIL; scripts in `code/tailgames-2026-11-14/`. Floating point, two-variable graded model; nothing is a certificate.

- A game λ = (1, λ₁, …, λ_D, ν, ν, …) with a constant tail is a valid witness and adds no order parameter, because
  the identity part is pointwise: Re⟨f, g⟩ = 1 − 2‖k‖². Model norms of such games have no truncation error.
- Cubic head with tail: N(1, −ε, ν, ν, …) = (1 − ν)·sup[V_ε̂(f, g) − 2ν̂‖k‖²] + ν, ε̂ = (ε + ν)/(1 − ν),
  ν̂ = ν/(1 − ν). The row is the cubic one with the pointwise potential \|A\| + \|B\| replaced by
  Ψ_ν(A, B) = max_{\|u\|=\|v\|=1}[Re(ūA) + Re(v̄B) + ν·Re(uv̄)] = min{(d₁ + d₂ + d₃)/2 : diag(d) ⪰ M} (the dual formula
  checked to 5·10⁻¹⁵ on 40 random cases).
- Optimum ε = 0.7681, ν = +0.0235: model norm **0.713021**, that is 1.402483, against 0.713136 (1.402257) without a
  tail; two optimisers agree to 10⁻⁶. At degree 5 a tail gains only about 4·10⁻⁵ (with ν < 0).
- Untested at certificate level: the row pipeline with Ψ_ν at (ε, ν) ≈ (0.768, 0.0235), new caps, and a Lean change
  in the witness and the pointwise step. No analogue of K for Ψ_ν is formulated.

## 11. The retained functional Λ̂ (K′)

Λ̂ is defined in 2.10a; its remote comparison with Λ is 3.16. Peak row throughout; every statement is
dimension-free unless marked **N**.

### 11 (a) Foundations

| # | statement | scope | status | where |
|---|---|---|---|---|
| 11.2 | M(w) = E\|L + w\| has a globally j₀-Lipschitz gradient, j₀ = ½E\|L\|⁻¹ | uses 2.7 | **P** (`ch20`; re-derived by claude-b9ee, REV); j₀ enclosed exactly in the TILT verifier (**C**, TILT-REV3) | `ch20`; EXT-P; REV |
| 11.4, 11.22 | Local A/B cost of Λ̂ at G = 0: Λ̂(sH) = 2E\|L\| − s²𝒬(r_A, r_B) + o(s²), H = (T − 1)r_A + z₁²·conj(r_B)/√2, with 𝒬 the Hermitian form of the matrix [[0.60684, 0.26291], [0.26291, 1.01344]] for arbitrary complex remote linear forms; smallest eigenvalue in (0.47779261268182, 0.47779261268183). Without the retained element the entries are 0.32005, 0.11799, 0.94020 (7.3.1); with the tied multiplier ξ = α/3 + β/6 of `ch25` they are 0.60659, 0.26274, 1.01332 | local at G = 0 only: not a finite-amplitude cost, and the tied matrix plus I/10 is not a global majorant (item 19) | **P** (one shared driver with real coefficients: re-derived by claude-b9ee, REV, with finite differences of the exact functional, **N**; every finite dimension and complex forms: codex-a7c4, A15, author only) + **C** (scalar enclosures, A15 `sector_constants.py`) | EXT-P; REV; A15 `SECTORS.md`; `ch25-parts/20-stability-and-smoothing.tex`; `code/record-checks-2026-11-15/tied_matrix_check.py` |
| 11.5 | A necessary condition at a local maximiser stable under fresh coordinates (an inequality for P₂ ∈ H₁,₁) | assumes a maximiser exists and the second derivative is integrable | **R** | EXT-P; REV |
| 11.12 | **Tilt identity.** For every remote q ∈ L², every remote linear form r and every real s: Λ̂(q + (T − 1)r) ≤ 2E\|L + q + (T − 1 + s)r\| − p‖q‖² − (p − s²)‖r‖². Proof: take ξ = −s·r in the minimum; G − ξ is even in z₁ and L is odd, so the two expectations are equal, and ‖ξ‖² = s²‖r‖². Complex s works with \|s\|² | the A-sector over a remote base; no B or odd sectors; no row-specific number | **P** (claude-b9ee, KPR §3; re-derived independently by codex-a7c4, A15V `FOUNDATIONS.md` §1) | KPR §3; A15V `FOUNDATIONS.md` §1, `REMOTE.md` §2 |
| 11.13 | Expansion of the right side of 11.12 at G = 0: local cost k(s) = k_A − 2g₀s − (1 + j₀)s² = 0.320 + 1.670s − 2.432s²; maximal (0.607) at s = −g₀/(1 + j₀) ∈ (0.34339840980385, 0.34339840980386); positive exactly between ≈ −0.15612661 and ≈ 0.84292343; k(3/5) ∈ [0.446707057881032, 0.446707057881033]. First-order term 2Re⟨r, c_s(q)⟩. With the retained element free, the saddle of the second-order model is ‖c − g₀μ/(1 + j₀)‖²/(k_A + g₀²/(1 + j₀)) − ‖μ‖²/(1 + j₀), c = c₀(q), μ = Π₁[q·j(\|q\|²)] | formal expansions; local, not a finite-amplitude bound | **P** (claude-b9ee, KPR §3; re-derived by codex-a7c4, A15) + **C** (scalars: A15 `sector_constants.py`; TILT verifier, TILT-REV3) | KPR §3; A15 `SECTORS.md`; `sector_constants.py` |
| 11.23 | Assembly: if Λ(q) ≤ S + η_R and gain(q) ≤ κD(q) + η_A with 0 ≤ κ ≤ 1, then Λ̂(q + sectors) ≤ S + (1 − κ)η_R + η_A, also when D(q) < 0. Variant: gain(q) ≤ κ·D₊(q) + η_A with 0 ≤ κ ≤ 1 and η_R ≥ 0 gives S + η_R + η_A. (For κ > 0 and a nonnegative gain, the signed hypothesis forces D(q) ≥ −η_A/κ.) | conditional; not a sector theorem | signed form **P, author only** (codex-a7c4, A15); the variant **P** (claude-b9ee; re-derived by codex-a7c4, A15R `SECTORS.md` §7) | A15 `SECTORS.md`; A15R `SECTORS.md` §7 |

### 11 (b) The tilted A-sector

At s = 3/5, 𝒥(q, r) is the gain of the tilted A-sector over a remote base: by 11.12,
Λ̂(q + (T − 1)r) − Λ(q) ≤ 𝒥(q, r). Below, f(w, ρ) = E_{z₁}\|L + w + (T − 2/5)ρ\| for complex w, ρ, and
Rem(w, ρ) = 2[f(w, ρ) − f(w, 0) − ⟨∇_ρf(w, 0), ρ⟩].

| # | statement | scope | status | where |
|---|---|---|---|---|
| 11.25 | Circular mean: E_θ\|1 + t·e^{iθ}\| ≤ 1 + (3/10)t² for t ≥ 0; the best constant lies in (0.298834, 0.298835], near t = 581/400 | — | **P + C** (codex-6e2b; certificate read and replayed by claude-b9ee, TILT-REV); the sharper constant 59767/200000 of `lower-bound/sharp-circular.tex` **R**; the scan **N** | TILT-4 §2.2; verifier check C1; TILT-REV; `check_tilt_report.log` |
| 11.26 | 𝒥(q, r) ≤ (1074/625)u − (859/2500)‖r‖² for every dimension, every remote cubic q, every remote linear form r and every energy u ≥ 0. With the same q and r, in the normalisation of 6.1.1: Λ̂(q + (T − 1)r) ≤ B₀ + 0.3964u − 0.3436‖r‖², so Λ̂ < S + 10⁻⁴ for u ≤ 0.00541 + 0.866‖r‖² | the estimate of 𝒥 uses only that q and r are square-integrable, independent of z₁ and orthogonal (E[conj(q)r] = 0): no fourth moment and no chaos structure | **P + C** (codex-6e2b; re-derived by claude-b9ee, TILT-REV; constants (3/5)I₀ ∈ [1.718368549549717, 1.718368549549718] and P − (3/5)J_s ∈ [0.343638104570935, 0.343638104570936] enclosed exactly); the normalised consequence **P** (two lines, derived in the ledger, not in the report or its reviews) | TILT-1 §§2.1, 2.3; TILT-4 §2.3; checks C2, C3; TILT-REV |
| 11.27 | For u ≤ 0.0463: F(q) − F(0) ≥ u·c(u) with c decreasing and c(463/10000) > 0.702292508353541 > 7/10, hence 𝒥(q, r) ≤ (1273/1250)u − (859/2500)‖r‖² | uses E\|q\|⁴ ≤ 44u² (3.4) | **P + C** (codex-6e2b; re-derived and checker replayed by claude-b9ee, TILT-REV2); c(0.0463) = 0.7036 (**N**) | TILT-4 §§2.1, 2.3; `localization_notes.md`, `localization_verify.py`; TILT-REV2 §2; `code/record-checks-2026-11-15/localisation_check.py` |
| 11.29 | Structural content bound: for every remote cubic q and every real profile h for which Φ(x) = x·h(\|x\|²) and its first two derivatives grow at most polynomially, ‖Π₁[q·h(\|q\|²)]‖² ≤ (3/4)·δ·E m_h(\|q\|²), m_h(v) = 4v[(3h′ + 2vh″)² + 3h′²]; for the tilt 3/5, ‖c_{3/5}(q)‖² ≤ 848δ | every dimension and energy. On the Wick monomial, with the true E m_h, the bound is 0.026, 0.26, 1.4, 4.1 times D at u = 0.0005, 0.005, 0.02, 0.0463 (**N**; sup m_h = 1.35, so 848 is loose by about 800) | general bound **P** (codex-6e2b; re-derived step by step by claude-b9ee, TILT-REV); 848: **P + C** (replayed, TILT-REV) | TILT-4 §§3.1–3.3.1; check C5; TILT-REV; TILT-REV2 §3; `code/record-checks-2026-11-15/tilted_content_check.py` |
| 11.30 | Uniform content bounds at the tilt 3/5: ‖c_{3/5}(q)‖² ≤ min{(2/25)δ, (19321/10⁶)u} at every energy; ‖c_{3/5}(q)‖ ≤ 1/50 for u ≤ 0.0463; ‖c_{3/5}(q)‖² ≤ 3δ^{3/2} | every dimension. (2/25)δ: trace-sensitive Stein budget and a Gaussian resolvent with shift 1/3, sup N_Φ < 1/3 (Arb); (19321/10⁶)u: −1/40 < h_{3/5} < 253/1000 (Arb), Π₁q = 0, centring at 57/500 (it does not vanish for a Gaussian law); 1/50: pointwise Fenchel–Young with Π₁q = 0; 3δ^{3/2}: a real third-chaos tensor bound with sup\|m‴\| < 13 | (2/25)δ and (19321/10⁶)u: **P + C** (codex-6e2b; re-derived and replayed by claude-b9ee, TILT-REV2; **N**: sup N_Φ = 0.2957 near R = 0.23, h_{3/5} between −0.024 and 0.2519); 1/50: **P + C** (re-derived by the reviewer agent of TILT-REV4, certificate replayed in the full verifier); 3δ^{3/2}: its sections 1–2 **P** (TILT-REV3), the passage to the complex cubic and sup\|m‴\| < 13 **R** | TILT-4 §3.3; `content_profile_proof.md`, `content_next_proof.md`, `content_tensor_next.md`, `content_next_m3_proof.md`; `content_profile.py`, `profile_range.py`, `content_next_bound.py`, `content_next_m3.py`; TILT-REV2 §2; TILT-REV3; TILT-REV4 §3 |
| 11.31 | Zero-content class: if the remote coordinates split into independent blocks X and Y and q = Σ a_{ij,k}X_iX_j·conj(Y_k), then Π₁[F(q)] = 0 for every function F of q; so c_s(q) = 0 for every s | first variation only; any coefficients and block sizes | **P** (codex-6e2b; checked by claude-b9ee, TILT-REV) | TILT-4 §3.4; TILT-REV |
| 11.32 | Conditional remainder: if for some R > 0 and 0 ≤ Θ < P the real Hessian satisfies D²_ρ f(w, ρ)[v, v] ≤ Θ for all w ∈ ℂ, all \|ρ\| ≤ R and all unit v, then for remote q, r with C = ‖c_{3/5}(q)‖, σ = ‖r‖ > 0: 𝒥(q, r) ≤ 2Cσ − (P − Θ)σ² + 4M(R + σ²/(2R))e^{−R²/σ²}, M = E\|T − 2/5\| = 2e^{−2/5} − 3/5. For q in finitely many variables sup_r 𝒥(q, r) is attained | any sharing; a tool for sectors without a global remainder bound (the same tail, for s ∈ [0, 1], is in A15 `SECTORS.md` §6) | **P** (codex-6e2b; re-derived by claude-b9ee, TILT-REV, with the tail integral and M; the attainment, two lines, checked by the same reviewer) | TILT-4 §§4.1, 4.2; TILT-REV |
| 11.33 | Curvature inequality: D²_ρ E_{z₁}\|L + w + (T − 2/5)ρ\|[v, v] ≤ 3/4 for all w ∈ ℂ, \|ρ\| ≤ 3/10, \|v\| = 1 | one of its accepted scalar targets gives region (a) of 11.39. **N**: the supremum is at least 0.7094 (a diagnostic at ρ = 0.3, w = 0.6402; the grid of 11.17 shows 0.7086) | **P + C** (codex-6e2b; TILT-REV2: reduction formula and exterior re-derived, matrix envelopes and angular bins checked for logic, C++ checker compiled and replayed; replayed again in TILT-REV3; interval code not audited) | TILT-4 §4.3; `theta_proof.md`; `theta_verify.cpp`, `theta_candidates.txt`, `theta_results.txt`; TILT-REV2 §2 |
| 11.37 | Global-remainder implication, at any tilt s: if Rem_s(w, ρ) ≤ Sec·\|ρ\|² for all w, ρ with Sec < p − s², then 𝒥_s(q, r) ≤ 2‖c_s(q)‖σ − (p − s² − Sec)σ² ≤ ‖c_s(q)‖²/(p − s² − Sec) for every remote q and linear r, with no bound on ‖r‖ and no tail. Suprema of Rem_s/\|ρ\|² (margins p − s² − sup): 1.002 (0.320) at s = 0, 0.607 (0.598) at 0.3434, 0.582 (0.490) at 0.5, 0.5997 (0.362) at 0.6, 0.681 (0.151) at 0.7 | at s = 0 a proof would make the local A-cost 0.320 of K a global cost; the inequality has three real parameters after a rotation and a reflection | implication **P** (TILT-REV2); the inequality at s = 3/5 is 11.39; the suprema **N** (grid 141 × 71 × 70, a second scan to \|w\| = 40 and ρ = 12) | TILT-REV2 §4; `secant_curvature.py`, `secant_curvature.log` |
| 11.39 | **Global remainder bound**: Rem(w, ρ) ≤ (13/20)\|ρ\|² for all complex w and ρ | four regions: (a) ρ ≤ 33/200 through an accepted target of 11.33 (Hessian ≤ 0.649660); (b) ρ ≥ 5: Rem ≤ 4Mρ; (c) \|w\| ≥ 6: Rem ≤ ρ²E[A²/\|L + w\|] < (3603551/5604000)ρ²; (d) the compact rest by joint convexity of f and multilinear interpolation, with a C++ checker accepting 102,104 boxes and 602 radial values of the linear term regenerated with Arb. **N**: the supremum is 0.5997, near ρ = 0.5719, w = 0.6318 | **P + C** (codex-6e2b; TILT-REV3: the four regions, the interpolation error and every rational comparison re-derived, the whole verifier replayed in an isolated copy with own python-flint and compilation; replayed again in TILT-REV4; interval code not audited) | TILT-5 §2; `secant_proof.md`; `secant_verify.cpp`, `secant_profile_table.py`, `secant_exact.py`; `secant_core_results.txt`, `secant_profile_table.txt`, `results_secant_history.txt`; TILT-REV3 §§2–3; TILT-REV4 §2 |
| 11.40 | **Gain bounded by content at every amplitude**: 𝒥(q, r) ≤ 2Cσ − kσ² ≤ C²/k, C = ‖c_{3/5}(q)‖, σ = ‖r‖, k = 59009/189100 = 0.31205. Proof: 11.39 at w = q(y), ρ = r(y), integrated over the remote variables; the linear term is 2Re⟨c_{3/5}(q), r⟩ since the first and third chaos are orthogonal; complete the square | every remote cubic q and linear r; no bound on ‖r‖, no maximiser, no tail, no localisation; any sharing | **P** (TILT-REV3; also TILT-REV2), given 11.39 | TILT-5 §2; `secant_proof.md` §6; `secant_assembly.md` |
| 11.41, 11.49 | **Energy-dependent content coefficients**: ‖c_{3/5}(q)‖² ≤ γ_i·δ for every u ∈ [e_i, 463/10000] and every χ, with (e_i, γ_i) = (9/1000, 251/5000), (3/250, 121/2500), (3/200, 467/10000), (9/500, 451/10000), (1/50, 441/10000), (1/40, 1859/43200), (3/100, 3/80), (7/200, 71/2000), (1/25, 17/500), (11/250, 13/400): from 0.0502 at u ≥ 0.009 down to 0.0325 at u ≥ 0.044 | every dimension. ‖c‖² ≤ (2/3)δ·sup_R N_{Ψ_u}(R) with the shifted resolvent Ψ_u; the phase identity ph(z) = ¼∫e^{iθ}sign(Re(e^{−iθ}z))dθ reduces the Hessian to one odd function k_u(x) = ∫₀¹ z^{2/3}E m″(zx + √((u/2)(1 − z²))G)dz, m(x) = E[(T − 2/5)sign(Re L + x)], solving (5/3 − (u/2)∂² + x∂)k_u = m″; rational cubic barriers on 500 cells with exact Bernstein residuals (affine in u) and a half-line comparison with the kink at 1; for the last four rows the shape \|k_u(x)\| ≤ W(\|x\|) and a one-switch angular reduction on 400 radial intervals × 4,096 angular cells. **N**: true coefficients (2/3)sup N_Ψ 0.0468, 0.0451, 0.0435, 0.0421, 0.0411, 0.0389, 0.0369, 0.0351, 0.0334, 0.0321 at the ten row energies | **P + C** (codex-6e2b; the method and the coefficient 1077659/27000000 on [0.03, 0.0463] re-derived and replayed by claude-b9ee, TILT-REV3; the ten coefficients re-derived by the reviewer agent of TILT-REV4 and replayed with the deficit chain; interval code not audited) | TILT §2; `secant_content_proof.md`, `deficit_structure_refine_proof.md`, `deficit_structure_medium25_proof.md`, `deficit_structure_content_proof.md`, `deficit_structure_absolute_low_proof.md`, `deficit_angular_proof.md`; `secant_content_verify.py`, `deficit_barriers_replay.py`, `deficit_structure_*_verify.py`, `deficit_angular_prepare.py`, `deficit_angular_verify.cpp` with their witnesses; TILT-REV3 §2; TILT-REV4 §§3–4; `review4/kcheck.py`, `kcheck2.py`, `wcheck.py` |
| 11.43, 11.50 | **Content against deficit**: ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) + 6·10⁻⁶ for every dimension and every remote cubic q with 0 ≤ u ≤ 463/10000 | an exact union of 178 closed rectangles in 45 energy strips covers (u, χ) ∈ [0, 0.0463] × [0, 42] (χ ≤ 42 is load-bearing, 3.4): on [0, 9/1000] 32 boxes with 20 global Hermite moment caps (3 exempt), on [9/1000, 2/125] 40 boxes with 33 caps and the coefficients of 11.49, on [2/125, 0.0463] 106 boxes with 119 global spectral Stein duals. Hermite interpolants of h(v) = 2E\|L + √v\| at two nodes are global upper caps (h⁗ ≤ 0), −3 < h″ ≤ 0, the benchmark B is bounded below by chords, and each budget is a polynomial in (u, √χ) checked by exact bivariate Bernstein coefficients; energy cells lose at most (9(2 + χ_hi)/80)(Δu)² below their chords. Exempt boxes prove ‖c‖² ≤ 6·10⁻⁶; no sign of D is assumed. Margins are thin in places (4.3·10⁻⁷ in the first Stein box). **N** (TILT-REV4): 1,298 members of the Gaussian-to-monomial family and 288 random two-variable cubics satisfy it (largest C²/(0.3D) on the family 0.040; smallest margin on the random tensors 3.9·10⁻⁴); the certificate's intermediate claims hold on 2,618 + 68,794 + 1,948 actual-cubic checks and the 119 duals on a grid to 10⁴ | **P + C** (codex-6e2b; TILT-REV4: the Hermite caps, the Stein bound, convexity in χ, the energy interpolation (also by claude-b9ee), the branches, the chords and the exempt boxes re-derived by its reviewer agent; replayed as two runs, the full secant chain and the deficit chain `verify.py --deficit-only` in a copy with the repository layout, PASS in 99 s with 0 uncovered boxes; the union also by the reviewer's own exact method; interval code not audited). The combined default command has no recorded run as one invocation, and the deficit verifier reads the October Stein package through a fixed path into this repository | TILT §§1, 3; `deficit_dual_proof.md`, `deficit_moment_verify_proof.md`, `deficit_moment_prefix_proof.md`, `deficit_audit_results.md`; `deficit_moment_verify.py`, `deficit_moment_prefix.py`, `deficit_dual_cover_verify.py`, `deficit_dual_exact.py`, `deficit_dual_profile_caps.py`, `deficit_gaussian.py`, `deficit_cover_union.py`, `deficit_exact.py`; `deficit_integrated_results.txt`, `results.txt`; TILT-REV4 §§2–4; `review4/check_cert.log`, `review4/two_var.log` |
| 11.52 | 11.50 needs no partly unreviewed content bound: the 12 boxes (11 moment boxes and 1 exempt box) that use the branch 3δ^{3/2} of 11.30 re-certify exactly with (2/25)δ | — | **C** (exact; the reviewer agent of TILT-REV4, outside the author's verifier; not replayed by anyone else) | TILT-REV4 §5; `review4/tensor_free.py`, `review4/branches.py` |
| 11.42, 11.51, 11.54 | **The tilted A-sector lemma, and the retained A-core.** For every dimension, every remote cubic q with u ≤ 0.0463 and every remote linear form r: 2E\|L + q + (T − 2/5)r\| − (p − 9/25)‖r‖² ≤ 2E\|L + q\| + κ·D₊(q) + η, with κ = 56730/59009 ≈ 0.9614 and η = 5673/295045000 ≈ 1.9228·10⁻⁵. Consequently **Λ̂(q + (T − 1)r) < S + 5778430967237/295045000000000000 < S + 2·10⁻⁵** for every such q and r | proof: 11.40 with 11.50 gives 𝒥 ≤ C²/k ≤ (0.3·D₊ + 6·10⁻⁶)/k. By 11.12, Λ̂(q + (T − 1)r) ≤ Λ(q) + κD₊(q) + η; if D ≥ 0 this is B(u) − pu − (1 − κ)D + η ≤ S + η, and if D < 0 it is Λ(q) + η < S + 3.6·10⁻⁷ + η by 3.3; η + 3.6·10⁻⁷ < 1.96·10⁻⁵. No bound on ‖r‖, no localisation, no maximiser, no sign of D, any sharing; peak row; the A-sector only (no B or odd sectors); u ≤ 0.0463 covers the remote energies of responses with t ≥ 0.84 (2.12a) | the lemma: **P + C** (codex-6e2b; the assembly constants re-derived in TILT-REV4; κ < 1 and η < 2·10⁻⁵ exact in `deficit_exact.py`); the consequence: **P + C** (two lines from 3.3, 11.12 and the lemma, by claude-b9ee; derived independently with the exact budget by codex-a7c4, A15S, and re-derived and replayed by claude-b9ee, rev. #419) | TILT §4; `secant_assembly.md` §3; `deficit_exact.py`; TILT-REV4 §§1, 3; A15S `REMOTE.md` §§1–2, `retained_profile_transfer.py`; 3.3; 11.23 |
| 11.46 | Special case of 11.51 with its own certificate: for 0.03 ≤ u ≤ 0.0463 and χ ≤ 7/100, Λ̂(q + (T − 1)r) < S + 3115324569897527/159324300000000000000 | from 3.3, 11.12, 11.40 and the central coefficient of 11.41, without 11.50; an independent check of 11.51 on that class | **P + C** (codex-a7c4, A15F; re-derived and replayed by claude-b9ee, rev. #409) | A15F `REMOTE.md` §6; `remote_profile_transfer.py` |
| 11.47 | Sharper than 11.51 on u ≤ 0.021: every remote cubic with 0 ≤ u ≤ 21/1000 has Λ̂(q + (T − 1)r) < S − 69/25000000 < S for every remote linear r | every dimension, amplitude and sharing; uses the benchmark slack, reviewed inputs of 11.30, 11.39 to 11.41 and global Hermite majorants of the October bank (14 leaves of a cover with 33 leaves and 17 of the bank's 154 polynomials, shared with 11.48); not a sector-only bound | **P + C** (codex-a7c4, A15V, with fresh Arb inputs and exact continuum acceptance; re-derived by claude-b9ee, who replayed the checker and accepted all 33 leaves again by an exact critical-point check, rev. #413) | A15V `REMOTE.md` §§1–4; `remote_augmented.py` |
| 11.48 | Special case of 11.51 with its own certificate: for 0 < u ≤ 0.0463 and χ ≤ 1/4, Λ̂(q + (T − 1)r) < S + 1/50000 | 19 leaves and 10 polynomials of the cover of 11.47; reviewed inputs only | **P + C** as a special case of 11.51. Its own certificate: **P, author only** (codex-a7c4, A15V) + **C** (checker replayed and its leaves re-checked by claude-b9ee, rev. #413) | A15V `REMOTE.md` §§1–4; `remote_augmented.py` |
| 11.53 | **Retained A-core on a profile rectangle.** With ε ∈ [0.74, 0.76], λ = ε/(1891/2500), 0 ≤ a/λ − 0.5592 ≤ 1/2500 and 0 ≤ b/λ − 0.1432 ≤ 1/800: Λ̂(q + (T − 1)r) − S < 869040549842757089931/8877866800000000000000000 < 9.8·10⁻⁵ for every remote cubic q with u ≤ λ²·0.0463 (u ≤ 0.0443 suffices throughout) and every remote linear r | every dimension, amplitude and sharing; the weighted scaling 3.17 with the cost k_λ = 59009/189100 − (λ − 1)·9/25 ≥ 11737/37820, a Gaussian supporting plane for S and paired triangle bounds; the flank and upper rows and the box are not covered; no B or odd sectors | **P + C** (codex-a7c4, A15S: exact continuum budget; re-derived and replayed by claude-b9ee, rev. #419). The exact budget is 9.7888442057·10⁻⁵: profile loss 7.8·10⁻⁵, η = 1.93·10⁻⁵ and U₀ − J₋ = 3.6·10⁻⁷, with U₀ = 1.373953883 (3.3) and J₋ = 1.3739535256614828 ≤ S (3.14); at the peak it reproduces 11.51 within 3·10⁻⁹. It inherits the tilted certificate 11.50 with the evidence of TILT-REV4 | A15S `REMOTE.md` §§3–6; `retained_profile_transfer.py` |
| 11.44 | Augmented remote certificate: since 𝒥 ≤ C²/k ≤ H(u, δ)/k with H a minimum of the bounds of 11.30 and 11.49, a proof of Λ(q) + H(u, δ)/k ≤ S + η for every remote cubic q gives Λ̂(q + (T − 1)r) ≤ S + η. In the October certificate a law of variance v and x = √χ is bounded by c₀ + c₂x² + c₃x³ with c₃ ≥ 0 and only endpoints in x are checked; δ-terms raise only c₂, δ^{3/2}-terms only c₃ and u-terms only c₀, so the endpoint argument survives | the method of 11.47 and 11.48; at (u, χ) = (1/25, 4) the October bank alone cannot meet the budget (item 83) | reduction **P** (TILT-REV3); endpoint structure **P, author only** (codex-a7c4, A15F `REMOTE.md` §6, A15V) | TILT-REV3 §4; A15F `REMOTE.md` §6; A15V `REMOTE.md` |

### 11 (c) Numerical evidence for the retained functional (all N)

| # | statement | scope | where |
|---|---|---|---|
| 11.14 | The cancellation in the tilted content: g − g₀ ≥ 0 and j₀ − j ≥ 0, and (g(v) − g₀)/(j₀ − j(v)) decreases from 1.291 (v → 0) to −g₀/j₀ = 0.583 (v → ∞), so for s between 0.58 and 1.29 the profile h_s changes sign. On the Wick monomial at u = 0.0463: c₀ = 0.03250, μ = −0.03467; the content c₀ + sμ is 0.63c₀ at s = 0.343, 0.36c₀ at s = 0.6, and vanishes near s = 0.94 | adaptive quadrature at small v (the fixed grid of `tilt_profiles.py` is inaccurate below v = 10⁻³); c₀ and μ on the monomial only | KPR §3; `ratio_small_v.log`, `tilt_profiles.log` |
| 11.15, 11.21 | Optimised sector gain on the Wick monomial q = c·y(\|y\|² − 2)/√2, as gain/D at u = 0.01, 0.02, 0.03, 0.0463. K, A: 0.1246, 0.1482, 0.1568, 0.1604; K, A + B: 0.1261, 0.1510, 0.1605, 0.1653; retained, A: 0.0214, 0.0225, 0.0210, 0.0170; retained, A + B: 0.0216, 0.0230, 0.0218, 0.0183. At u = 0.0463 an independent direct-norm quadrature gives 0.16044543, 0.16533698, 0.01698219, 0.01829395. The retained element removes 83 to 89 % of the K gain; the saddle formula of 11.13 gives 0.000205 at u = 0.0463 against 0.0002049 numerically | one driver, real amplitudes; stationary values, not certified suprema | KPR §4; REV §2; `retained_content.log`, `retained_joint.log`; A15 `SECTORS.md`, `sector_numerics.py`, `sector_numerics.json` |
| 7.4.7, 11.16 | All tensors in two remote variables (H₂,₁(ℂ²), six complex coefficients), largest gain/D found: K (A): 0.1477 (u = 0.02), 0.1609 (0.0463), 0.1554 (0.09); retained (A): 0.0179, 0.0215, 0.0237, 0.0232, 0.0208, 0.0173, 0.0127, 0.0046 at u = 0.005, 0.01, 0.02, 0.03, 0.0463, 0.065, 0.09, 0.15; with the B-sector added at those tensors, K up to 0.1657 and retained up to 0.0241. The margin of gain ≤ D is about 6 for K and at least 41 with the penalty retained, at every energy tried. The K maximiser is close to the monomial; the retained one has more weight on X(\|Y\|² − 1) | quadrature 51,200 × 48 nodes (a finer grid moves the fourth decimal by at most one unit); L-BFGS with three restarts; the B-sector not re-optimised over the tensor; a search | KPR §5; `code/kprime-2026-11-15/search/` |
| 11.17 | Second derivative along the tilted sector at restricted amplitude, Θ(R) = sup over \|ρ\| ≤ R and directions: s = 0: 1.046 at R = 0.3 (budget p = 1.322); s = 0.3434: 0.642 (budget 1.204); s = 0.6: 0.5729, 0.6276, 0.7086, 1.5020 at R = 0.1, 0.2, 0.3, 0.5 (budget 0.9621; at R = 0.3 a finer evaluation gives 0.7094, 11.33); s = 0.7: 0.6508, 0.7116, 0.8099, 1.7312 (budget 0.8321). Without a restriction on ρ, Θ exceeds the budget at every tilt tried | a grid search, not a certified supremum; the remainder itself, unlike the second derivative, stays below the budget (11.37) | KPR §9; `tilt_restricted.log`, `tilt_restricted_67.log` |
| 11.19 | Fixed tilt over two-variable tensors, with ξ = −s·r: largest gain/D 0.0510 (s = 0.3434), 0.0331 (0.5), 0.0257 (0.6), 0.0237 (0.7), the larger of u = 0.02 and 0.0463. Family with a bath q = X[c₁(\|X\|² − 2)/√2 + c₂S_m/√m], S_m = Σ_{k≤m}(\|Y_k\|² − 1), with real c₁, c₂ and m bath variables (also the Gaussian limit of the bath), sector and retained element along X: for K the largest gain/D over the mixing angle is 0.1603 at u = 0.0463 for every m, attained at the monomial; retained 0.0231, 0.0185, 0.0082 at u = 0.02, 0.0463, 0.09 for m = 1, decreasing as bath variables are added (0.0225, 0.0169, 0.0052 from m = 10 on); the family does not contain the two-variable maximisers of 11.16, which have complex coefficients | peak row; the fixed tilt: a search, three restarts per run, two remote variables (lower bounds on a supremum); the family: exact quadrature in (\|X\|², S_m, T), u = 0.02, 0.0463, 0.09, m = 1, 2, 3, 5, 10, 30, 100 and the Gaussian limit | KPR §§6, 7; `search/tilt_*.log`, `family.log` |
| 11.20 | Three remote variables (H₂,₁(ℂ³), 18 complex coefficients), A-sector: retained gain/D up to 0.0245 (u = 0.02), **0.0247** (0.03), 0.0230 (0.0463); K 0.1611 at u = 0.0463. The retained ratio rises slowly with the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463; 0.021, 0.023, 0.025 at u = 0.03); its limit is unknown. The maximisers approach the Gaussian (χ = 42, 19, 13 at u = 0.0463) | coarser grid (839,808 × 40 nodes): the third decimal is reliable, the fourth is not; four variables need a sampling method | KPR §8; `code/kprime-2026-11-15/search3/` |
| 11.45 | Pointwise remainders of other sectors, smallest sampled p − Rem/\|r\|² (Rem the remainder at zero amplitude of the two norm terms of Λ averaged over z₁; with a tilt, p is replaced by the cost form of Λ̂): A and B together, K: at most 0.298364…, the sharp local value at the origin (7.4.9; the sampled grid shows 0.300 because it misses that eigen-direction, at angle fraction 0.116); tilt (s_A, s_B) = (0.6, 0): 0.252, at w = 0.25i, angle parameter 0.375 (about 30.9 % B energy); (0.5, 0): 0.365; (0.3434, 0): 0.467; B alone, K: 0.706; A, B, z₁Q and z̄₁P together, K: 0.128 = k₁, in the pure z₁Q direction at the origin. With d·z₁(T − 2) added the pointwise form fails (−0.387 at w = 0, energies 0.58 in z₁Q and 0.42 in ν; item 77); the integrated Q/ν coupling has two channels (7.2.5) | peak row; quadrature in (T, θ); grids per sector, nine B-shares for A and B, 400 random starts for four sectors (60 with ν); a search finds violations, it does not exclude them | KPR §12; `code/kprime-2026-11-15/secant_joint.py`, `secant_joint.log`, `secant_all_sectors.py`, `secant_all_sectors_no_nu.log`, `secant_all_sectors_with_nu.log`; TILT-REV2 §7 |

## 12. Related results

| # | result | status | where |
|---|---|---|---|
| 12.1 | The proved lower bound, independent of K: K_G^ℂ ≥ 1250000000/891774069 > 1.401700322371, from the same cubic witness and source/law bank with 15,096 leaves, cap B = 891774069/1250000000 = 0.7134192552. It does not reach 1.4018, whose cap threshold is 5000/7009 | **Lean**: `lower_bound_of_completed_refinement`, `lower_target`, `main_bounds`; targeted builds and full CI run 43690956235 at 5446f03d780fbb10e53be00e0e40516738366fd2 pass, including the axiom report. Exact complete-partition replay and eight rejection controls pass | KPROG `LOWER_ROUTE.md`; `data/lower-refinement/`; `docs/LEAN_DETAILS.md` |
| 12.2 | Ceiling of the cubic witness family: below 1.4022581233 for every complex multiplier and every dimension | **R** here (`docs/overview.tex` prints [P, C], with the generic arithmetic in Lean) | `docs/overview.tex` ("Limits of the witness method") |
| 12.5 | An upper bound K_G^ℂ < 1.404896400821 claimed in EXT-R | **R**; weaker than the proved 1.404599398052 (`main_bounds`) and unrelated to K | EXT-R |
| 12.6 | The fourth-moment theorem for homogeneous sums (arXiv:1407.6216) assumes centred, variance-one inputs with EX³ = 0 and is asymptotic: it gives no finite-amplitude content or deficit bound | **R** (codex-a7c4, A15R `FOUNDATIONS.md` §5, compared with the primary statement in A15F) | A15R `FOUNDATIONS.md` §5 |

## 13. False statements

Each is false as stated; none is a counterexample to K. Format: the statement, the counterexample, its status, the
source.

1, 2.4. **K for every ε and every profile** (equivalently, same-norm domination on every variance sphere). False for
profiles with ℓ − 2β of order 10⁻¹⁰ to 10⁻³⁰ at tiny norms; no violation is known on the box. **R** (explicit examples
in the notes received). MON §1; LOG §8a, §10; `RCV/chatgpt-thread2-gaussian_domination_note.tex`.

2. **Constant-free same-norm domination (K\*) for every affine profile.** False at the margins: a gain of order
ε²log(1/ε) against ε². **R**. LOG §8, §8a.

3. **E|L + G| ≤ E|L + σW| (one term alone).** False: G can cancel the cubic part of L. **R**. LOG §8.

4. **Fibrewise domination at a fixed shift, E|r + q| ≤ E|r + ‖q‖W|.** False for r ≥ 2.5 even for cubics (+2.2·10⁻³ at
r = 2.5); only the T-averaged form can hold. **R**. MON §2; LOG §11b, §11g; `ch29`.

5. **Single-scale strengthenings of K** (heat kernel, Laplace transform, characteristic function, convex order
|q|² ≥_cx ‖q‖²·Exp(1)). False: E e^{−30|H|²} < 1/31 for H = z[(|z|² − 2) + i(|w|² − 1)]/√3 (certified). **R**. MON §2;
LOG §11b; DIG §3; `OCT/prompts/PROMPT_REPLY_K_REFORMULATION.md`.

6. **Monotonicity along the CLT, Λ(G) ≤ Λ(symmetrised G).** False: G = c·z₁(|z₂|² − 1) gains +4.9·10⁻⁴ at c = 0.15.
**N**. `OCT/pipeline-kclt/RESULTS.md`; DIG §2; LOG §7.

7. **OU-path monotonicity in its scalar Stein-sign form.** It is not equivalent to monotonicity, and it fails for
G = M·z₁(T − 2). **R**. LOG §7, §7a; MON §3.3.

8. **Lemma (T): (𝒞_{F_A}(q) + 𝒞_{F_B}(q))·λ_max(M(q)) ≤ 0.292(S − Λ(q) + η).** False for q = (7/(20√2))X²Ȳ, whose
actual contents vanish; the usable form (T₀) uses the actual contents. **R**.
`OCT/conjecture-K-report/WEIGHTED_CONTENT_FOR_GPT.md`; DIG §2; `ch15`.

10. **Λ is concave in the conditional covariance parameters** (Jensen for conditionally Gaussian G with a conditional
cross-covariance). False: the largest Hessian eigenvalue is +1.3 to +2.9. **N**. DIG §2; `OCT/pipeline-kclt/RESULTS.md`.

11. **Replacing a shared (T − 1)U by an independent Gaussian of the same variance does not lower Λ** (equal-variance
peeling). False: shared minus independent reaches +1.96·10⁻² at aligned phase and reverses at first order. **R**.
DIG §3; LOG §11e.

19. **The tied local matrix of the retained functional, plus I/10, is a global majorant.** False by more than
97/1000 at q = 3/4, α = 7/20, β = 1/2, ξ = 1/5 (interval check); an isotropic 0.8·I is not a majorant even
infinitesimally (normalised curvature above 0.843 in the direction (2, −1)). So the local matrix 11.4 is not a cost.
**R**. DIG §3; `ch25-parts/20-stability-and-smoothing.tex`; `OCT/weak-k-2026-10-15/LOCAL_CHANNELS.md` §§2, 5.

20, 6.4.1. **The Wick monomial maximises C²/D (Conjecture E), or the ratio is monotone toward it.** False: along
q_τ = √(u/(2 + τ²))·X[(|X|² − 2) + iτ(|Y|² − 1)] the derivative of the ratio in τ² at 0 exceeds 1/1000 at
u = 463/10000 (peak); the monomial is a saddle (6.4.2). Second-variation implication **P**, exact algebra **C** (audit);
the sign rests on kernel inputs that are **R**; the finite perturbation **N**. REP §1; CERT §6;
`RCV/progress_2026-11-05/`.

26. **Content or deficit is Schur-convex in the spectrum of a Hermitian form.** False: (2, −1, −1) ≺ (2, 0, −2), yet
‖T‖² = 576 against 0. **R**. LOG §12f.

27. **Averaging the phase of X removes the shells X̄B and X²W̄.** False: cross terms survive (6.3.8). **P + C**.
LOG §12f, §15; CERT §8.

28, 6.5.3. **Centring and conditional Gaussianity give the content bound 0.24 without the chaos moment inequality.**
False: two-point laws reach 0.2469 and 0.2646. **R**. LOG §15.

36. **Every sector other than A is pure cost.** False for B at small amplitude (7.1.2). **P**. ASM §3.1; LOG §31.

37. **The odd sectors have content of order u.** False: they have no first-order term at all (2.9). **P**. LOG §34.

38. **Over a nonzero core the odd sectors satisfy E[|O|²/|L + H|] ≤ (1/ε − κ_E)‖O‖².** False even with κ_E = 0:
E[|O|²/|L + H|] > 2.714 > 2.644 = ‖O‖²/ε at an explicit core (u = 0.0462, w_A = w_B = 0.0112); a certificate must keep
the directional curvature (7.2.2). **R**. LOG §36; `RCV/odd_sector_inverse_norm_obstruction/`.

39, 7.3.5. **The B-cost 7.1.1 holds at every even L² base, so it applies at q + (T − 1)r_A.** False: the cusp
H = L·sign(Re z₁); and a loss of 0.07 on both diagonals breaks the 5.5·10⁻⁵ budget (exact witness, excess
0.000424157). Exact algebra **P** (audit, replayed); the kernel counterexamples of the package **R**. ASM §3.4;
LOG §43, §45; `RCV/J3_audit/`.

43, 7.4.3. **Separate A and B axis costs imply a joint cost** (so a content constant 0.10 with the diagonal costs
closes A + B). False: 2c_Aa + 2c_Bb − 0.24a² − 0.26b² + 0.40ab with c_A = 1/200, c_B = 0.5053c_A, Δ = 1/4000 satisfies
both axis costs, c_A² = 0.10Δ, exact alignment and both amplitude caps, and exceeds Δ by 0.00033415 > 10⁻⁴. **P**
(exact arithmetic, audit); not a cubic counterexample. ASM §2; REP §2 (a), §4.

7.4.4. **A positive mixed coefficient m makes 2m·Re⟨r_A, r_B⟩ nonnegative.** False for arbitrary relative phases. **P**.
ASM §2, §4.2.

44. **g_B/g ∈ [0.505, 0.56] at the three rows.** False at the flank and upper rows; at the peak the common-centre
comparison 7.1.4 holds. **R**. LOG §45; `RCV/J3_audit/`.

45. **‖Π(q·h)‖ ≤ E[|q|·h(|q|²)]** (an L¹ projection bound). Not valid for unbounded Gaussian linear forms; the valid
step is the L² contraction ‖Π(qh)‖₂ ≤ ‖qh‖₂. **P**. REP §3 item 6.

46. **The first variation of the B shell pairs with r_B.** False: it pairs with conj(r_B); the pairing with r_B has
charge two and vanishes. **P**. LOG §28; ASM §3.1.

47. **M1 decoupling of the even sectors.** False by up to +5.7·10⁻³. **N**. `OCT/PLAN_1402.md`.

48. **The statements (EC), (PH), (PG) of the October 1.402 plan.** False as stated, or inside the response-feasible
region (largest eigenvalue 1.3395 > p). **R**. `OCT/PLAN_1402.md`.

49. **A uniform fibre bound for the even sectors.** None exists: the largest eigenvalue is 1.7095 > p. **R**.
`OCT/PLAN_1402.md`.

50. **The first-chaos penalty evaluated at the unpenalised best response bounds the retained supremum.** False: the
maximisers readjust; the valid form is the dual Λ̂ (2.10a). At fixed sectors on the junta family the guaranteed relief
is 0.41 to 0.45 of the raw penalty, that is 7 to 14 % of the mixed-gain allowance (16 to 31 % for the raw penalty);
the retained element optimised together with the sectors removes 83 to 89 % of the K gain (11.15, 11.16). The two are
different quantities. **N**. `ch20`; `ch17`; `OCT/conjecture-K-report/conjecture_K_report.md`; KPR.

59. **p ↦ log(E|X|^p/E|N|^p) is convex for chaos X** (it would give E|X| ≤ √(2/π)‖X‖₂). False on p ∈ (−0.8, 0.4) for
He₂, …, He₆. **N**. TAIL §5.

66. **Disjoint redistribution 4.1 with a base H that depends on z₁.** False: H = −L·1{T ≥ 10}, U = sW gives a positive
linear difference for small s while satisfying the energy cutoff. **P, author only** (codex-a7c4) with exact scalar
support. A15 `CLAIMS.md`.

67. **Conditional-Gaussian domination 5.2 with a conditioning field that depends on z₁.** False: 𝓕 = σ(z₁),
G = (a/2)W·1{T ≤ 1/100} concentrates variance where L is small. **P, author only**. A15 `CLAIMS.md`.

68. **The remote cap Λ(q) ≤ S + η_R gives D(q) ≥ −η_R.** False as an inference: it gives
D(q) ≥ −[S − (B(u) − pu)] − η_R; budgets combine by 11.23. **P** (algebra). A15 `SECTORS.md`.

69. **The total response energy is below 0.072.** False without a threshold in t: at the peak ε the bound 0.071981
needs t ≥ 0.8456 (use 0.081884 for t ≥ 0.84), and a genuine response at t = 0 has energy above 0.0939738 (about 0.273).
**P + C** (A15R, reviewed). A15R `FOUNDATIONS.md` §2.

70. **Over the zero core the odd sectors never raise Λ on the whole box, and the flank d-cost is 0.36.** False: at
(0.76, 0.76, 0.16), O = (i/100)Z(|Y|² − 1) gives Λ(O) − Λ(0) > 7·10⁻⁶; at the flank, O = (i/100)Z(T − 2) violates the
cost 0.36 by more than 5·10⁻⁷ (the valid value is 0.356, 5.4). **P + C** (5.4a).

71. **Parity implies differentiability at every even L² base.** False: the even base H = L·sign(Re Z) has a positive
|τ| cusp along the genuine odd cubic Z(T − 2). **P** (A15R, reviewed). A15R `SECTORS.md` §6.

72. **The formula of 7.4.1 holds for an indefinite cost matrix.** False: k_A = k_B = 1, m = 2, c = d = 0 give the value
0 while the gain is unbounded. **P**. A15R `SECTORS.md` §7.

73. **Retaining the first-chaos correction restores full-box odd nonincrease.** False: the corner cubic of item 70
gives Λ̂(O) − Λ̂(0) > 7·10⁻⁶; the correction improves its value by less than 3.2·10⁻¹⁰. **P + C** (A15T, rev. #403).
The flank d-example of item 70 concerns Λ only: the retained flank d-cost exceeds 0.525048300689048 per unit cubic
energy (A15T `SECTORS.md` §3). A15T `SECTORS.md` §5.

74. **Character exclusions alone give the weighted chaos bound of 6.3.9.** False outside the cubic chaos: for
independent standard complex X, Y, h_R = Y·1{|X| > R}/√P(|X| > R) has norm one and X-character zero, but
E[|X||h_R|²] > R. **P, author only** (A15T). A15T `CONTENT_KERNELS.md` §6.

77. **The pointwise remainder of K over A, B, z₁Q, z̄₁P and d·z₁(T − 2) has a nonnegative cost.** False pointwise:
constant coefficients (k_Q, k_P, ν) = (i, 0, −i) have normalised local cost in
(−0.378784185484355, −0.378784185484354) < −3/8, and the pointwise Q/ν block has least eigenvalue −0.387101627…
(7.4.9). **P + C** (A15F, rev. #409; A15V). Constant Q is not a centred quadratic: for genuine cubics the mixed Q/ν
term vanishes at the zero core because EQ = 0, so 5.4 stands; at a nonzero core the interaction is open.

78, 3.5a. **SEI is preserved by adding any independent symmetric unimodal variable.** False: X₁ = Z₁Z₂Z₃/3 (genuine
real third chaos) is SEI, but X₁ + U with U uniform on [−1, 1] has SEI interval gap at least 91/18000 at radius 1/10.
Valid closures: independent centred Gaussian addition, or two SEI summands each with a symmetric unimodal density.
**P + C** (A15F; rev. #409, with a Monte Carlo gap 0.01131). No ledger result uses the false closure. A15F
`REFORMULATIONS.md` §§4–5; `reformulations_exact.py`; `ch32` ("Interval form (SEI) and sums").

80. **The diffuse Gaussian attains the cubic supremum in each fixed dimension.** It is a limit over increasing
dimensions. At n = 1 the peak supremum is B₀ < S (2.6); the K_all equality in `ch32` needs a supremum over all
dimensions. **P** (A15F, rev. #409). A15F `REFORMULATIONS.md` §6.

81. **The raw joint A/B form has a global cost 0.300.** False: the local cost at the peak is 0.298364… (7.4.9), and
along (1, −1/5) already 0.298526… (7.4.8). **P + C**. The signed target (0.24, 0.26, 0.118) and K are unaffected.

84. **A nonlinear function of a remote cubic is orthogonal to the first chaos because the cubic is.** False:
q = cX(|Y|² − 1) has Π₁ E_{z₁}ph(L + q) ≠ 0 (3.16). The diffuse benchmark of Λ̂ needs the explicit estimate 2.14.
**P + C** (3.16; A15S, rev. #419); A15S `FOUNDATIONS.md` §1.

85. **The retained functional has the scaling law of the raw one.** False: the multiplier cost carries the weight λ
(3.17), and for q = cX(|Y|² − 1) the unweighted law fails strictly. A transfer must use k_λ and the energy range of
11.53. **P + C** (A15S, rev. #419). A15S `REMOTE.md` §§3–5.

86. **The Q/ν mixed Hessian over a nonzero core has a single Hermitian radial kernel.** False: it has two channels,
and the genuine cubic directions (f, 1) and (if, i) at q = 0.001·X(|Y|² − 1) give coefficients below −8·10⁻⁶ and
above 4·10⁻⁶ (7.2.5). **P + C** (A15S, rev. #419). The zero-core cancellation and the costs 5.4 stand.
A15S `JOINT.md`.

87. **A gain bound in terms of D₊ attenuates the remote error by 1 − κ.** False: the allowance (1 − κ)η_R + η belongs
to a gain bound in terms of the signed D; with D₊ the conclusion is S + η_R + η (11.23), as used in 11.51. **P + C**
(an exact scalar non-implication; A15S, rev. #419). A15S `REMOTE.md` §§1–2.

88. **Shared-A domination holds for a residual with Gaussian law, orthogonal to the remote first chaos, with the
matched conditional covariance.** False: the witness of 6.5.1 gives Λ(G) > S + 7·10⁻⁷. It is not a cubic
(E‖DQ‖² > 3u₀), so it does not refute K; it shows that law-only arguments cannot prove K. **P + C** (A15S,
rev. #419). A15S `OBSTRUCTION.md`.

11.6. **The weighted cubic contraction Re E[e^{−|q|²}·q̄²·Σ_j(∂_jq)(∂_{j̄}q)] is nonnegative.** False:
q = X[5(|X|² − 2) + 6i(|Y|² − 1)]/√86 gives a value below −1/50 (interval certificate). **R** (replayed by its
recipient only). EXT-P; REV.

12.3. **The degree-5 analogue K₅ holds at its flank rows.** False numerically at t ∈ [0.86, 0.88]: one spike gives
+1.55·10⁻⁵ (deterministic quadrature), and 8 to 20 spikes a plateau of about 8·10⁻⁵ ± 1·10⁻⁵; K₅ holds at the peak row
in every family tested. **N**; the mechanism (a Gaussian driver (T − 1)R_N ∈ H₃,₂ with excess ≥ εα²I²/4 > 1.5·10⁻⁴)
**R**. It lives in H₃,₂, not in H₂,₁. `sources/k5-2026-11-04/RESULTS.md`; MON §3.2; LOG §11a.

## 14. Routes that do not work

What fails, and why. Each item is current knowledge; the sources have the details.

9. **"Content ≤ f(x)" and "slack ≥ g(x)" through the fourth moment.** The ratio is 0.9 to 0.95 at the Wick monomial;
such chains close only for x ≤ 0.22. `OCT/pipeline-kproof/PROOF_NOTES.md`; `ch7`.

12. **The tangent step of Theorem A with a remote part.** A remote variance adds a positive tangent correction
(5.1a), so the step fails; this alone is not a counterexample to same-norm domination. LOG §10, §11e; ADD §2;
A15 `CLAIMS.md`.

13. **The conditional second moment vT + u(T − 1)² as a carrier of the A shell.** The profile (t − 1)² moves variance
to T ≈ 0, where |L| vanishes. LOG §11g; DIG §4.

14. **Proofs from the law of the residual, from orthogonality, or from radial and Gaussian-noise tests alone.** The
Gaussian-marginal obstruction 6.5.1. `ch35`; LOG §11e, §11h.

15. **Exact remote K from radial scalar inputs or moments alone.** Artificial radial laws beat the Gaussian payoff
(excess < 4.65·10⁻⁶); a moment-only relaxation with C₆ = 49.425 has a floor about 1.05·10⁻⁵ above S. The Stein
relaxation of 3.3, with C₆ = 40.45313, is not limited by it. DIG §3; `ch7`; A15 `REMOTE.md`.

16. **Merging the Wick face and the Gaussian-factor face without chaos restrictions.** It fails for every normalised
fourth moment in [2.06, 6]. `OCT/conjecture-K-report/conjecture_K_report.md`.

17. **Inserting a buffer by Jensen, Λ(G) ≤ Λ(G + gU) + pg².** It costs p(9/40)² > 0.0669 against a budget of 9·10⁻⁵, so
buffered theorems do not transfer to zero buffer this way. DIG §3; `lower-bound/obstruction-1402.tex`.

18. **A pointwise tangent majorant for the A curvature at small buffer.** Its A-curvature is positive below
g ≈ 0.164: the tangent loses the radial part of the Hessian, about a factor 2. DIG §3; `ch55`.

21, 22, 6.5.2. **Leading-order (tensor) control and Taylor remainders for the content.** The optimal tensor constant
covers only u ≤ 0.0112, and the leading ratio overestimates the truth 9 times at u = 0.0463;
q₀ = X[−½(|X|² − 2) + Σ_{j≤4}(|Y_j|² − 1)] has zero leading tensor but E[X̄q₀|q₀|⁴] = −243; certified Taylor radii are
0.006 to 0.008 in amplitude against the needed 0.26, and cumulant-sensitive remainders reach u ≤ 3·10⁻⁵. The content
inequality is a finite-amplitude statement. MON §3.4; LOG §12b, §12c, §12e; CERT §8.

23. **A global sixth-derivative bound for the deficit.** Negative beyond u = 0.0017. LOG §12f; DIF §4.

24. **The quadratic shell cost absorbing the content without the remote slack.** It needs w > 0.038 at u = 0.0463.
LOG §11i.

25, 6.1.3. **Fourth-moment envelopes in (u, w).** Saturated: the universal cutoff is w ≥ 0.011223 and no further; they
miss the corner (0.0463, 0.01125) by 10⁻⁵. LOG §12j; MON §3.4.

29. **A purely radial polynomial envelope with the two radial moment constraints at the pure-P end.** A three-point law
gives more than 0.246 (certified obstruction, **R**); the affine weight of 6.3.3 avoids it. LOG §23;
`RCV/r26_envelope_audit/`.

30. **The directional envelope on the small-Wick strip (sampled 0.2393).** An eight-atom witness forces its cap above
0.2405 (**R**: reported by a thread whose archive does not exist). LOG §29.

31. **Hessian perturbation from the Wick endpoint beyond p ≤ u/5.** It loses a factor of about 20 on the content.
LOG §19, §24.

32. **Adding family certificates up to a general theorem; "several drivers follow driver by driver".** The functional
is not additive, the families do not exhaust H₂,₁, and conditioning on one driver leaves the others inside g(|q|²).
REC §4; CERT (conclusion).

33. **"Every mechanism that spreads q lowers the content faster than the deficit."** Supported on some families, not
a theorem. DIF §4.

35. **An auxiliary diffuse Gaussian W used as a direction.** √u·W is not in H₂,₁ and not an admissible first-chaos
multiplier; counterexamples built on it are spurious. DIF §3; A15V `FOUNDATIONS.md`.

40, 7.3.3. **Integrating the infinitesimal signed A/B bound 7.3.2 along q + s(A + B).** The intermediate bases depend
on z₁ and are not remote. ASM §3.3.

41, 7.3.4. **The pointwise finite-amplitude Hessian form at intermediate bases.** Its smallest eigenvalue is −0.03 at
|β| = 0.1 and −0.84 at |β| = 0.3 (**N**, peak, grid). LOG §41; `code/experiments-2026-11-04/e11_ab_kernel_finite.py`.

42. **Closing A + B through the near-exact mixed coefficient m = 0.118.** Fragile: the excess is 5.5·10⁻⁵ at m = 0.118,
1.2·10⁻⁴ at 0.115 and 8·10⁻⁴ at 0.10. LOG §44, §45.

51. **K_rot alone (2.11).** It pays only 13 to 57 % of the measured mixed gain (a subtraction at fixed sectors), and no
cap is proved for it. DIG §2; `ch23`.

52. **Scalar Rice cuts and moments on the response side.** Saturated: they improve the peak cap by less than
4.3·10⁻⁷, and a law with nodes 2 ± √2 passes every scalar cut. DIG §1 item 4.

53. **Proportional remote tests v = λq in the response-body dual.** They leave a gap of 0.0007977 at e = 1/25. DIG §2.

54. **Concentration tests as a route to small influence.** They do not force it (the family Q_N). DIG §3.

55. **A better certificate at ε = 149/200, or rearranged gates.** A perfect certificate at that ε gives
1/0.713288 = 1.401957 < 1.402; the rearranged gate scheme has a worse Gaussian ideal (0.713519).
`OCT/pipeline-gate/KSIDE.md`; MON §1.

56. **The frozen table plus a cut-bank relaxation.** Four atomic laws pass all 671 cuts with values above 500/701; the
genuine-cubic floor is 0.71335 at ε = 149/200. DIG §1 items 22, 23.

57. **A degree-5 witness with gates or independent Gaussian tests.** Gated rows lose at least 5.5·10⁻³, and K₅ fails at
the flank rows (12.3). LOG §2; `sources/k5-2026-11-04/RESULTS.md`.

58. **Second-order tests at the diffuse contact.** An exact flat sector: they cannot separate the diffuse contact.
LOG §12a.

60. **Reduction to the sphere S³ ⊂ ℂ².** Valid but useless: every S³ instance has ratio ≤ K_G^ℂ(2) ≈ 1.2. TAIL §5.

61. **A shift by the vector-valued Borell inequality.** The Borell deficit of a driver pair is about 10⁻² against a
budget of 10⁻⁴ (hand estimate). TAIL §5.

62. **A Bellman function or martingale relaxation in (t, f_t, g_t).** It cannot see the sign of the time multiplier
(an argument, not computed). TAIL §5.

63. **Sums of squares of degree 2.** They give only the trivial value 1 for sup ‖P₁,₀f‖² (the truth is π/4); degree 4
is untested. TAIL §5.

64. **Reading a finite-dimensional scan as a bound.** A search gives lower bounds on a supremum only; training maxima
above 0.09 are sampling artefacts. REP §5.

65. **The external "proofs" of K\*, of K and of an unconditional 1.4022** (LOG §9, §11c, §11f) are wrong; the
point-by-point refutations are there.

75, 11.18. **Bounding the tilted content without the structure of the deficit.** Cauchy–Schwarz through the law of
|q|² alone, ‖Π₁[q·h_s(|q|²)]‖² ≤ min_κ E[|q|²(h_s(|q|²) − κ)²], does not vanish at a Gaussian law: for the exponential
law of |q|² at u = 0.0463 the bound over the cost is 9.9·10⁻⁴ for K and 1.6·10⁻⁴ at the best tilt, against the slack
1.31·10⁻⁴ of 1.402. The structural bound 11.29 with its constant weight is 3 to 10 times too weak on [0.02, 0.0463] on
the Wick monomial, where D/δ falls from 0.73 to 0.13. What works is 11.49 with 11.50: energy-dependent coefficients
γ(u)·δ against a deficit certified in (u, χ). **N** (one tensor for the second part). KPR §10; TILT-REV, TILT-REV2;
`code/record-checks-2026-11-15/tilted_content_check.py`.

76. **The tilted sector added to the headline remote cap as a black box.** With ‖c‖² ≤ 1/2500 and 11.40, the cap 3.3
gives only Λ(q) + sup_r 𝒥(q, r) < S + 0.00128, 64 times the allowance 2·10⁻⁵: the sector term must enter the
certificate (11.44) or be compared with D (11.50). **P** (arithmetic). TILT-5 §4; `secant_assembly.md` §4.

79. **Real BNC as the real form of PVD.** Only BNC ⇒ real PVD ⇒ complex PVD is proved, with no converse (3.5). A15F
`REFORMULATIONS.md` §§1–3.

83. **The October moment-polynomial bank alone, for the augmented target 11.44 everywhere.** At (u, χ) = (1/25, 4)
every one of its 154 polynomials, with either reviewed content surcharge, exceeds S_upper + 0.0002 (exact); Stein cuts
or a sharper content budget are needed there, as in 11.50. **C** (exact finite-bank obstruction, A15V `REMOTE.md` §5;
accepted as valid in the review of #413 (F3) with the checker replayed). A limit of that bank of upper bounds only, not
a lower bound on Λ̂.

## 15. Open problems, in priority order

1. **The finite-amplitude joint A/B remainder bound** (7.4), first at the peak row. Enough: the compact box
   inequality on 0 ≤ x ≤ 29/10, |α|, |β| ≤ 0.4 with reserve 7.53·10⁻⁵ (robust) or 8.07·10⁻⁵ (signed) (7.4.5).
   Alternative: a global cost m for the pointwise remainder of A and B together, with which the A + B gain is at most
   a quadratic form of the contents at every amplitude, as 11.40 is for the tilted A-sector. Any such m lies below
   0.298364…, the local value at the origin along a genuine cubic direction (7.4.9), so a candidate such as 0.29 must
   be tested away from the origin before a certificate is built (five real parameters).
2. **The raw L4 content inequality**: a dimension-uniform finite-amplitude content theorem for K on
   0.00551 ≤ u ≤ 0.0463 (6.3.18), with the constant set by item 1 (0.10 under the adverse joint hypothesis, 7.4.2).
   Pieces: the mixed shells (6.3.16), several self-interacting drivers (6.3.17), the envelopes (★) and (†) (6.3.13,
   6.3.14). A candidate method is that of 11.50: energy-dependent δ-coefficients against moment caps and Stein duals
   in (u, χ).
3. **B-content for general cubics**: with the peak alignment 7.1.4 it reduces to A-content (7.1.5).
4. **A uniform cost for the z-odd sectors** over genuine nonzero even cubic cores at the required rows (7.2.4). For K
   and Λ̂, z₁Q and z̄₁P have pure cost about 0.128 jointly with A and B on the grid (11.45); d·z₁(T − 2) needs an
   argument after integration that keeps both Q/ν coupling channels (7.2.5): centring alone removes them only at the
   zero core.
5. **The remote part on the other rows**: certificates for the row envelope beyond 3.11 and 3.15; the flank and upper
   rows are outside both. The claims 11.7 to 11.11 are unchecked. Exact remote K (3.6) is not needed.
6. **The response regions outside R, then the consumer** (section 8): cover the complementary t regions with a fixed
   ε, using the t-dependent energy caps 2.12a; the σ* = 0 corner only if the cover uses it; a Lean statement of the
   consumer.
7. **The retained functional Λ̂ (K′).** The A-sector is closed at the peak (11.51) and on a scaled profile rectangle
   around it (11.53). Left: A and B jointly (on the grid the pointwise remainder bound has margin 0.252 at the tilt
   (0.6, 0), 11.45); the finite-amplitude cost for the matched B tilt (its content is now bounded in 7.1.7, author
   only); the odd sectors (item 4); the other rows, where a transfer uses the weighted scaling 3.17 and
   the unattenuated error of 11.23 (item 87); more than three remote variables in the numerics (11.20).
8. **The identity-tail witness** (section 10): it raises the model ceiling to 1.40248 and is untested at certificate
   level.

The audit's advice (REP): continue as a bounded research programme with an explicit decision point, not as a
near-complete route to an additional 0.0005.
