<!-- The text below the marker line "MONOGRAPH, VERBATIM" is an unedited copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md (file dated 2026-11-05). The section above the marker was added on 15 November 2026. -->

# Errata and updates (15 November 2026)

The monograph below was written by claude-b9ee on 5 and 6 November 2026 and is reproduced unchanged. It was audited
independently on 13 November (agent codex-a713; `sources/audit-2026-11-13/REPORT.md`), and further results arrived
on 13, 14 and 15 November. **Read the body through this section.** Where the body and the audit disagree, the
audit stands. The consolidated state of knowledge, with the scope of every statement, is in `STATUS.md`; this section
only lists what changes in the monograph.

Labels: **P** re-derived by the audit, **C** exact or interval checker replayed by the audit, **N** numerical only,
**R** read from the record without full independent verification (definitions: `sources/audit-2026-11-13/REPORT.md`,
top). The monograph's own labels [L], [P], [C], [F] are those of its author and are weaker: its sentence "everything
here is verified by me unless marked [?]" does not make a statement P or C in the sense above.

## A. The twelve incorrect or stale statements of the audit (`REPORT.md` section 3)

Numbering as in `REPORT.md` section 3. "Where" is the monograph section the item concerns; three items are about the
log (`sources/log/ASSESSMENT_2026-11-04.md`) and one is about the audit's own task statement, and for those the
monograph passage that repeats or uses the statement is given.

| # | where | statement in the record | audit finding |
|---|---|---|---|
| 1 | §0 (last paragraph) | "§4 is the single statement still missing (the content lemma on a small rectangle of adversaries)" | Superseded by the monograph's own §4b: layers L5 (sector assembly) and L6 (row envelope and consumption) remain as well. The A-only content inequality is neither the sole missing lemma nor an established reduction of the full conjecture. |
| 2 | §3.5 (third bullet) | "the worst case on the rectangle is the known template at the top energy" | Overstates a search (six restarts of 25 random steps in a twelve-shell subspace of ℂ⁴, no error bars) and conflicts with the certified saddle recorded later in §4: the monomial is not the maximiser. |
| 3 | §4, "Why this is the right statement" | "the zero-tensor and non-normal examples have no content at all" | False for q₀ = X[−½(\|X\|²−2) + Σ_{j≤4}(\|Y_j\|²−1)]: exact moments give leading content E[X̄q₀\|q₀\|²] = 0 but E[X̄q₀\|q₀\|⁴] = −243, so the fifth-order content is nonzero. A vanishing leading term is not a vanishing nonlinear function. (`CERTIFICATE_AUDIT.md` §8.) |
| 4 | §4, "Plan of proof of E′", step 4 (Endgame) | "Steps 1–3, once proved, give E′ (ratio ≤ 0.11 < 0.24 on R)" | The certified constants 0.22 to 0.239 do not give 0.11. Quantitative strengthening remains necessary even before sector assembly. |
| 5 | log §31; used in §4b (table row L5 and the paragraph after the table) | "every non-A sector is pure cost" | False for small B amplitudes: the B sector has first-order content (the log's own correction is valid, and the L5 row of §4b carries it). A test at the fixed shell energy 0.0113 cannot detect every gain that is linear in the amplitude. |
| 6 | log §33; used in §4b ("the vector comparison ‖c_B − 0.5053·c_A‖ ≤ 0.007√u") | projection norm "≤ E[\|q\|h(\|q\|²)]" | Not an L² contraction argument (orthogonal projection contracts L², not L¹). Repair: ‖Π(qh)‖₂ ≤ ‖qh‖₂ ≤ 0.007√u, valid once the global pointwise kernel bound \|g_B(v) − 0.5053 g(v)\| ≤ 0.007 is proved. That scalar bound is itself open (`record_audit.md` §1). |
| 7 | log §§44–45; repeated in §4b, "State of layer L5", bullet "Joint A + B (UPDATE 6 Nov)" | "the robust path is to sharpen the A-content constants to ≤ 0.10–0.15 …, which closes the A+B core with the certified diagonal costs and no statement about the mixed term" | Not established. Separate cost bounds for Λ(q+A) and Λ(q+B) at a remote base say nothing sufficient about Λ(q+A+B); the B-cost theorem needs a base independent of z₁ and q+A is not. The "−0.0055 reserve" is the value at Δ = 0.07408, not a uniform margin; the corrected uniform bound is an excess of at most +7.181·10⁻⁵, and only under an additional joint hypothesis (adverse mixed coefficient at most 0.118) and the kernel comparison of item 6. See part C(ii). |
| 8 | §5 (also §0, first paragraph, and §1) | "B ≤ 0.713267 ⇒ 1.402" | False at the printed precision: 1/0.713267 = 1.4019995317. The strict target is B < 500/701 = 0.7132667617689. A repairable rounding issue; the consumer must keep the exact threshold. For 1.4022 the threshold is B < 5000/7011 = 0.713165026…, and the 10⁻⁴ budget supports about 1.402, not 1.4022 (`record_audit.md` §6). |
| 9 | not in the monograph (the task statement given to the auditor) | dimension n²(n+1)/2 − n for H₂,₁(ℂⁿ) | That is the count of homogeneous trace-free (harmonic) polynomials, not of the Gaussian Wick chaos; it would omit the Wick monomial. The correct complex dimension is n·C(n+1, 2) = n²(n+1)/2: 6, 18, 40, 75, 126 for n = 2…6. The audit's experiment and the scan of 13 November use the full space. |
| 10 | §3.2 (last bullet) | "That term cannot occur in H₂,₁ (q cubic and r_A linear are uncorrelated)" | False for a conditional variance. The genuine cubic X[(T−1) + (\|Y\|²−1)] is conditionally Gaussian given (z₁, Y) with variance [(T−1) + (\|Y\|²−1)]², which contains the sign-indefinite cross term; only its unconditional expectation cancels. Theorem B is not refuted: its variance-profile hypothesis excludes this cubic, which is why that hypothesis matters. (`ADDITIONAL_ANALYTIC_AUDIT.md` §3.) |
| 11 | §3.4 ("Buffered coverage" bullet), repeated in §4 ("Current open set") | "the near-Gaussian regime δ/u² ≤ 0.05 is covered instead by the manuscript's K_η proof (x ≤ 0.22)" | Not justified by the cited source. `ch7-conjectureK.tex` says "proved (up to the float constants and the majorant)": the majorant was sampled (16,430 random points) and the uniform treatment of the diagonal parameter was not done. Moreover 0.22² = 0.0484, not 0.05. The near-Gaussian region stays in the open domain. (`ADDITIONAL_ANALYTIC_AUDIT.md` §6.) |
| 12 | §4b (table row L1), also §3.3 ("Certified in the project") and the table of §3.6 | remote K-a "certified in the project (Lean/native) … done" | The identified source (`ch24-remote-diagonal.tex`) restricts its Arb remote cap (Λ(q) < 2747927/2000000 = 1.3739635 < S + 10⁻⁵) to the peak profile. The Lean source does contain the sixth-moment tensor bridge (`Circular.tensorFacts`, `Circular.gaussian_sixth`, `gaussian_moments`); that is a moment input, not a kernel-checked theorem for the complete remote cap, and no such Lean theorem was found. Other rows are not covered by the located sources. (`ADDITIONAL_ANALYTIC_AUDIT.md` §5.) |

## B. Further corrections from the audit's detailed reports

These are in `ASSEMBLY_AUDIT.md`, `CERTIFICATE_AUDIT.md`, `ADDITIONAL_ANALYTIC_AUDIT.md` (main audit) and in
`record_audit.md`, `diffuse_asymptotic.md` (supplements of the second audit that was run separately in the same
folder), all under `sources/audit-2026-11-13/`. They are not in the list of twelve.

1. **§3.1, "n = 1 is settled (sup Λ = 1.3649 < S = 1.3739535)".** Impossible at the peak row: G = 0 already gives
   Λ(0) = √π(a + 3β/2) = 1.371879280600870 (`record_audit.md` §6.1). The October sources attach the figure to another
   experiment: "n = 2 without W (six-dimensional H₂,₁(ℂ²)): sup Λ = 1.3649281 < S = 1.3669130"
   (`sources/manuscript/legacy/ch7-conjectureK.tex`, table of the section "Attacks on K";
   `sources/october-handoff/conjecture_K_handoff.md` §5; `sources/october-handoff/pipeline-gate/KSIDE.md`, which adds
   Λ(0) = 1.3647895), a floating-point search whose log gives the row (ε, ℓ, β) = (0.7564, 0.84, 0.14), not the peak
   row. For n = 1 the October notes record the exact statement sup Λ = 387√π/500 = 2E|L|, attained only at G = 0
   (a package of 22 October, status **R**; see `STATUS.md`, entry 2.6).
2. **§3.4, "Nonlinear content and deficit at every amplitude" and the row "arbitrary cubic, u ≤ 0.00038" of §3.6.**
   The replayed checker (`chatgpt-fresh-verify_nonlinear_content.mjs`) certifies scalar constants only; the
   derivation of the tensor identities it relies on was not found in the record. Status **R** as a theorem, not
   [P, C] (`CERTIFICATE_AUDIT.md` §7). Its deficit coefficient 267/320 − (61875/128)u is negative at u = 0.0463, so
   it gives no finite-amplitude lower bound on the deficit there (`diffuse_asymptotic.md` §4).
3. **§4, plan step 3, "self-interaction in several drivers then follows the R26 pattern driver by driver (the
   content along X_j only sees c_j and P_j after conditioning)".** No proof, and not a valid conditioning step in
   general: the other drivers remain inside g(|q|²) (`record_audit.md` §4).
4. **§4, "Every mechanism that spreads q over other coordinates … lowers the content faster than the deficit".** An
   intuition supported for some families, not a proved monotonicity statement (`diffuse_asymptotic.md` §4).
5. **§4b, "State of layer L5", "the B kernel is half the A kernel (g_B/g ∈ [0.505, 0.56], monotone)".** The ratio
   interval has false endpoints at the flank and upper rows (log §45; J3 audit report §1). The common-centre bound
   |g_B − 0.5053 g| ≤ 0.007 is a separate scalar target and is unproved (`record_audit.md` §6.3).
6. **§4b, table row L4, "self-interaction, Wick share < 1/16 (directional envelope): numerically feasible, tight
   (0.2393); certificate pending".** Stale: §4 (b) of the same monograph records the eight-atom witness that forces
   the cap of the directional envelope above 0.2405 (`record_audit.md` §6.4). That witness was reported from a
   thread that crashed and no archive of it exists (log §29), so the obstruction itself is **R**.
7. **§3.4, the cutoffs 0.01122, 0.011223 and 0.01125 for w.** Used interchangeably; a final exact cover of the
   domain has to fix one (`record_audit.md` §2).
8. **§3.6 and §7, "replayed green by the user".** A replay by the user is not a replay by the audit. Which
   certificates the audit replayed itself (C), which it replayed only conditionally on stored scalar data, and which
   it did not replay (R) is recorded entry by entry in `STATUS.md`, sections 3 to 7.
9. **§1, the restricted form K′ and the region u ≤ 0.0463, ‖G‖² ≤ 0.072.** These bounds come from response
   feasibility. A proof on that region serves the lower bound only if every omitted response region is covered, and
   it does not prove raw K for all G (`ASSEMBLY_AUDIT.md` §4.4; the digest's scope rule,
   `sources/manuscript/MANUSCRIPT_DIGEST_K.md` §1, last paragraph).
10. **§5, "The realistic cap under K: 0.713160 at ε = 0.7564 (1.40221)".** A floating-point figure (**R**). If it
    were usable, the room to 1.4022 would be about 5.03·10⁻⁶, not 10⁻⁴ (`record_audit.md` §6.5).

What the audit **confirmed** in §3 of the monograph (Theorems A and B, the disjoint-driver reduction, the one-driver
and Gaussian-factor content theorems, the B-shell cost, the saddle) is listed with its exact scope in `STATUS.md`.

## C. Results after the monograph

(i) **Global search of the ratio C²/D, 13 November** (claude-b9ee; `sources/numerics-kscan-2026-11-13/README.md`,
scripts and results in `code/kscan-2026-11-13/`). All of H₂,₁(ℂⁿ), n = 2…10, peak row, Monte Carlo with a
re-evaluation of every end point. Best re-evaluated ratios at u = 0.0463: 0.0892 (n = 2), 0.0888 (n = 3), 0.0886
(n = 4), 0.0885 (n = 5); a second pass with 2²² samples gives 0.0854–0.0879 (n = 6), 0.0850–0.0869 (n = 8) and
0.0828, 0.0852 (n = 10). At u = 0.03 about 0.080 and at u = 0.02 about 0.070 (n ≤ 5). Errors ±0.0003 to ±0.0011;
no growth with n is resolved; all maximisers are near the Wick monomial. **N.** Replaces the "0.0891 … attained by
the single Wick monomial" of §3.5. Where the two overlap, the audit's more accurate numbers supersede these
(`REPORT.md` section 5): Wick monomial 0.087565304234 at u = 0.0463; structured two-variable baseline 0.08760259435
(feasible in every n ≥ 2); selected full-space candidates from 0.08749 (n = 6) to 0.08760 (n = 2); no evaluated end
point above 0.10. The empirical margins are 1.142, 1.712 and 2.740 against the constants 0.10, 0.15 and 0.24: the "margin 2.7"
of §3.5 and §4 is an A-only comparison.

(ii) **The audit's central verdict, 13 November** (`REPORT.md`, one-page verdict and sections 2 and 4;
`ASSEMBLY_AUDIT.md` §§1–2). A proof of the content bound with constant 0.10 would **not** close the A+B core with
the separate A and B cost theorems. What is missing is a finite-amplitude joint A/B remainder bound: with
h = (T−1)r_A + z₁²·conj(r_B)/√2, V = L + q, p = 1/ε and R(V, h) = 2(|V+h| − |V| − Re(h·conj(ph V))), for every
dimension, every remote cubic q with 0.00551 ≤ ‖q‖² ≤ 0.0463 and arbitrary remote linear forms r_A, r_B with
squared norms at most 0.0113 (peak row first),

    E R(V, h) ≤ (p − 0.24)‖r_A‖² + (p − 0.26)‖r_B‖² + 0.236‖r_A‖‖r_B‖.

It is open and is not a consequence of its restrictions to either axis (an abstract quadratic countermodel
satisfies both axis costs, the 0.10 content bound, exact content alignment and both amplitude caps and still
exceeds the budget by 0.00033415; it refutes the implication, not K). Layer **L5 is open** (with real partial
results) and **L6 is not built**. This replaces the bullet "Joint A + B (UPDATE 6 Nov, §44–§45)" of "State of layer
L5" in §4b and the task S1 that rests on it. A reduction of this bound to a compact box, written by the auditor
after the audit, is in `sources/audit-2026-11-13/improvement_joint_tail.md` (the box inequality itself is open).

(iii) **Identity-tail games, 14 November** (claude-b9ee; `sources/numerics-tailgames-2026-11-14/README.md`, scripts
in `code/tailgames-2026-11-14/`). A witness with a constant tail, λ = (1, −ε, ν, ν, …), is exactly treatable
because the identity part is pointwise: Re⟨f, g⟩ = 1 − 2‖k‖². For the cubic head the row keeps the cubic form with
the pointwise potential |A| + |B| replaced by Ψ_ν(A, B) = max_{|u|=|v|=1}[Re(ūA) + Re(v̄B) + ν Re(u v̄)], which has
an exact dual formula as a 3×3 semidefinite minimum. In the two-variable graded model the optimum is ε ≈ 0.7681,
ν ≈ +0.0235 with model norm 0.713021, i.e. a ceiling 1.402483 instead of 1.402257. **N** (floating point, model
only; untested at certificate level). This updates the sentence "what we do not expect from K: anything beyond
1.40226" of §0: with a tail the model ceiling of a cubic-type certificate is about 1.40248. Using it needs the row
pipeline rerun with Ψ_ν, new caps and a change of the Lean witness; none of this has been tried. The ideas refuted
the same day are in section 5 of that README and in the "tried and failed" list of `STATUS.md`.

(iv) **External report "retaining the first-chaos penalty", received 15 November**
(`sources/external-2026-11-15/projection-attack-report.md` and `projection-attack-package/`). It replaces Λ by

    Λ̂(G) = min_{u ∈ H₁,₀} { ‖u‖² + E|L + G − u| + E|L − G + u| } − ‖G‖²/ε  ≤  Λ(G),

for which the row bound stays valid (the term −‖P₁k‖² dropped in §1 is retained through its dual form). This
belongs to the manuscript's Conjecture K′ (§1 below; `sources/manuscript/MANUSCRIPT_DIGEST_K.md` §2;
`ch7-conjectureK.tex`, "Side experiments"): Λ̂ is the functional of K′ without the constraint εQk = G, and it is
exactly the "first-chaos dual" Λ_P of the October manuscript (`sources/manuscript/legacy/ch20-pinned-gate.tex`,
section "A valid first-chaos dual for K′", 15 October), where Λ′ ≤ Λ_P ≤ Λ and the remote bound below, with the
multiplier ≈ 0.4112, are already stated. Results stated: a global bound Λ̂(q) ≤ Λ(q) − ‖P_rem m(q)‖²/(1 + j₀) for every remote q at every
amplitude, m(q) = E_Z ph(L + q), j₀ = ½E|L|⁻¹, with 1/(1 + j₀) = 0.411188… at the peak row; the local A/B cost
matrix of Λ̂ at G = 0, [[0.60684, 0.26291], [0.26291, 1.01344]] (smallest eigenvalue above 0.477; before retaining
the penalty the entries are 0.32005, 0.11799, 0.94020); and a certified counterexample to a weighted-contraction
positivity claim, which is not a counterexample to K. Of these, only the counterexample was not found in the
record before 15 November. The local matrix is in the October manuscript for the *tied multiplier* k = α/3 + β/6
(`sources/manuscript/legacy/ch25-parts/20-stability-and-smoothing.tex`, subsection "Why the local pinned matrix is
not a global majorant": M ≈ [[0.7154593, −0.2627445], [−0.2627445, 0.3087284]], that is, the cost
p·I − M = [[0.60659, 0.26274], [0.26274, 1.01332]]); the report has the optimal multiplier in place of the rational
one. The matrix is local at G = 0: it is not a finite-amplitude cost and must not be inserted in a certificate. The
report says so itself, and the same subsection of the manuscript proves that the tied matrix is not a global
majorant; it is the gap of part C(ii) again.
Status (verification record: REVIEW.md in `sources/external-2026-11-15/`, by claude-b9ee, 15 November). The proofs
of the row with Λ̂, of the Lipschitz lemma behind the global bound and of the global bound were read and re-derived
(**P**, by claude-b9ee, not by the audit). The local matrix was re-derived for one shared driver with real
coefficients and confirmed there by finite differences of the exact functional (**P** in that case, **N**). The
package's verifier was replayed with python-flint 0.9.0 and its output is identical to the package's `results.txt`;
an independent floating-point quadrature agrees with the constants. The global bound was tested on the Wick
monomial at six amplitudes (**N**). The necessary maximiser condition of the report was read only, and for the
counterexample only the package's verifier was replayed, by its recipient (**R**). Details: `STATUS.md`, section 11 (a).

(v) **External report "remote closure", received 15 November**
(`sources/external-2026-11-15/remote-closure-report.md`). In its own normalisation (λ = 0.75637, η = 0.31631,
L = Z + ληH(Z), A = 1 − λη², Φ(q) = (E|L + q|)²/(A + λ⁻¹E|q|²)) it claims for remote cubics q, in every dimension:
(1) E|q|² ≤ 1 ⟹ Φ(q) ≤ 2853/4000; (2) θ ≤ 1/2 ⟹ Φ(q) ≤ 2853/4000 at every amplitude, where
B = ⅓E[∇X∇Xᵀ] for X = √2 Re q and θ = ‖B‖_op/‖B‖_HS; (3) Φ((Q₁+Q₂+Q₃+Q₄)/2) ≤ 2853/4000 for four independent
copies of any remote cubic; and the sixth-moment bound E|q|⁶ ≤ 6u³ + 9uδ + 96·√(6/23)·θ·δ^{3/2}. The package it
names was **not received and nothing was checked: R.** It concerns the remote part only (layer L1); cubics sharing
z₁ are outside it, as the report says.

(vi) **Follow-up of 15 November: the retained element optimised together with the sectors** (claude-b9ee;
`sources/numerics-kprime-2026-11-15/README.md`; scripts and logs in `code/kprime-2026-11-15/`). The October figures
for what the retained penalty buys (7 to 14 % of the mixed-gain allowance; 13 to 57 % of the measured mixed gain
for K_rot) are subtractions at fixed sectors. Here the first-chaos element u of Λ̂ is optimised together with the A
and B shells, and the resulting sector gain (the supremum over the shells of the minimum over u, minus Λ(q)) is set
against the deficit D(q) of the remote cubic q; a proof needs gain ≤ D + η. At the peak row, by deterministic
quadrature, the largest gain found is 0.166·D for K and about 0.025·D with the penalty retained (the Wick monomial,
all tensors in two remote variables, and a search over the tensors in three remote variables): a margin of about 6
for K and about 40 with the penalty retained, on what was tested. The retained ratio rises slowly
with the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463 for one, two, three) and its limit is not
known. The mechanism: tying
u = −s·r to the A-shell form r turns the direction T − 1 into T − 1 + s at the price of s² in the penalty, which
raises the local cost and partly cancels the content; a subtraction at fixed sectors sees neither. That inequality
and the two formulas that go with it are **P** by their author (re-derived when this record was assembled; not
reviewed by anyone else). Everything else is **N**, and a search gives lower bounds on a supremum, not upper bounds.
It is not a theorem, and the remote part (layer L1), the z-odd sectors and the other rows are untouched. Statuses,
limits, and what the October record already had (the tied multiplier with its profiles; one test at fixed sectors):
`STATUS.md`, section 11 (c).

(vii) **Cover improvement of the proved lower bound, 13 November** (codex-a713;
`sources/audit-2026-11-13/IMPROVEMENT.md`). K_G^ℂ > 1.401697318640, from a refined finite cover with the existing
witness, rows and law nodes; checked in exact rational arithmetic by two implementations outside Lean; **not in
Lean**; independent of K. See `STATUS.md`, "Related results", and `INVENTORY.md` for the certificate.

---

<!-- =========================== MONOGRAPH, VERBATIM (unchanged from here to the end) =========================== -->

# Conjecture K: statement, purpose, state of knowledge, and what is left

claude-b9ee, 5 November 2026 (≈09:00 Bucharest; updated ≈10:10, ≈11:30, ≈12:00 and ≈13:40, ≈14:10 (THE WAY), ≈15:00 (R23–R25 certificate, replayed green), ≈15:50 (scan bug fixed), ≈16:55 (exact E refuted: the monomial is a saddle; THE WAY restated as the envelope E′), ≈17:10 (consistency pass), ≈17:40 (refined residual target, §4), ≈18:10 (whole Gaussian-factor class certified, no covariance restriction), ≈18:30 (rigorous certificate of the saddle; progress archive), ≈19:20 (R26 partial: Wick neighbourhood p ≤ u/16 certified), ≈20:00 (exact certificate target for the whole mixed family, nearly lossless), ≈20:30 (directional matrix form; corrections), ≈21:00 (envelope (★): 0.22 on the middle region, tail proved, compact part confirmed), ≈21:40 (kernel correction, obstruction to radial envelopes, directional fix), ≈22:00 (consistency pass: open set rewritten), ≈22:30 (Wick end extended to p ≤ u/5, full energy interval), ≈23:30 (§4b: the full six-layer chain and the plan; sector-assembly scan started), ≈23:50 (R26 proved for real c + Hermitian A, all shares, u ≥ 0.03), 6 Nov ≈00:30 (replays of §24 and §26 green; superseded p ≤ u/12 note; rebuild), ≈10:30 (B-sector subproblem with two corrections; R23 improved to 0.22; strip candidate (†)), ≈10:50 (0.22 replayed; all paths made relative), ≈11:10 (B-shell global cost certified: first result on layer L5), ≈11:30 (directional envelope obstructed by a certified witness; (★) tail from |z| ≥ 2; consolidated one-driver closure prompt), ≈12:30 (B kernel = half the A kernel; sector scan complete and positive for the even sectors), ≈12:50 (correction: B has first-order content, no monotonicity; conditional B-only theorem), ≈13:10 (B-content certified for the Gaussian-factor class; B-only core closed there), ≈13:30 (signed joint form: alignment of the contents makes the A+B core close with existing constants, conditional on the sign of the mixed term), ≈14:10 (parity identity: the z-odd sectors have no content and no coupling to the (q, A, B) block; E is a pure-cost problem), ≈14:30 (odd-sector pure cost certified over the zero core), ≈15:00 (inverse-norm route for the odd sectors ruled out by a certified example), ≈15:40 (directional majorant certifies the odd-sector cost at that core), ≈16:10 (signed A/B Hessian at q = 0 certified, positive mixed term), ≈16:50 (exact kernel reduction of the A/B Hessian at general q; J2 route (c)), ≈17:10 (singularity-free coordinates; first shift-interval certificate), ≈17:50 (my kernel evaluations: all-shift margins; pointwise finite-amplitude form ruled out), ≈18:10 (signed infinitesimal A/B bound certified for every base), ≈18:40 (second independent all-shift certificate; finite-amplitude regularity region): nonlinear content and deficit bounds, Gaussian-factor and Hermitian one-driver theorems, limits of the fourth-moment routes, goal statement). Research record; everything here is verified by me unless marked
[?]. Labels: [L] Lean, [P] pen-and-paper, [C] exact certificate replayed, [F] float only. Companion files:
`MANUSCRIPT_DIGEST_K.md` (the October manuscript), `ASSESSMENT_2026-11-04.md` §10–§12 (tonight's verifications),
`ai-notes/` (the AI documents, verifiers and replies). Peak row throughout unless stated: ε = 1891/2500,
ℓ = 1057/1250, β = 179/1250, a = ℓ − 2β = 699/1250, p = 1/ε = 2500/1891.

## 0. The goal, in one paragraph

**What we want to prove with Conjecture K: a lower bound K_G^ℂ > 1.402 (precisely ≥ 1/0.713267 ≈ 1.40200; the ceiling
of the method is 1.402258), unconditionally, with the cubic witness T = P₁,₀ − εP₂,₁ at ε = 1891/2500, by replacing
the supremum of the exact gate-free row over all adversaries G ∈ H₂,₁ by its value at the diffuse Gaussian adversary.**
The current proved lower bound is 1.401697 (master), 1.4017 class after rows 12–15; every further decimal through the
present scalar relaxations costs weeks of droplet time for ≈ 10⁻⁵, whereas K removes the gate loss, the residual-law
loss and the price layer at once and reaches the witness's own ceiling. Concretely:

- the **statement to prove** is K_η with η ≤ 10⁻⁴ on the three rows (ε, ℓ, β, σ*) = (0.7564, 0.8456, 0.1432, 0.2009),
  (0.745, 0.8534, 0.1467, 0.1726), (0.7564, 0.877, 0.152, 0.1617) — or the response-restricted K′ there, which is enough;
- the **consumer** is the existing certificate pipeline (§5): rows (ℓ, β) only, the one-dimensional fibre potential
  Φ₀ by interval integration, the envelope over t, then the Lean theorem `lower_of_K`, so that 1.402 lands in `master`
  with K as the only non-Lean input (or, if K is proved on paper, with its scalar integrals as native facts);
- what we do **not** expect from K: anything beyond 1.40226 (that needs the degree-5 witness, whose analogue K₅ is
  false, or a different witness), or help on the upper side.

Everything below serves this goal: §3 is what is already proved towards K, §4 is the single statement still missing
(the content lemma on a small rectangle of adversaries), §5 says how K is consumed once proved. State on 5 Nov 22:00: the one-driver
shell XP(Y) and the whole Gaussian-factor class ΣX_jP_j(Y) are certified and replayed (the mixed shells X̄B, (|X|²−1)V,
X²W̄, R₀ are not); of the one-driver family with self-interaction the Wick end is
certified, the middle region has a numerically true fixed envelope awaiting an interval certificate, and the small-Wick
strip has a feasible directional envelope; the mixed shells are the last untouched piece (§4).

## 1. What the conjecture is for

The lower bound on the complex Grothendieck constant is proved through the witness T = P₁,₀ − εP₂,₁ on the
complex Gaussian space (P the chaos projections), via the norm ‖T‖ over unimodular pairs (f, g): K_G^ℂ ≥ 1/‖T‖.
Writing h = (f+g)/2, k = (f−g)/2, Ph = tz₁ (after rotation), and G = εQk ∈ H₂,₁ (the charge-one cubic chaos), the
**exact gate-free row** [P] is

    Re⟨f, Tg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G),   Λ(G) = E|L+G| + E|L−G| − ‖G‖²/ε,   L = z₁(ℓ + β(|z₁|²−2)),

for every real (ℓ, β). The whole difficulty of the lower side is the supremum of Λ over G. The proved certificates
replace it by scalar relaxations (fibre potentials, moment and Stein cuts, node caps) and reach 1.401697 (master) with
the rows 12–15 landing next. Conjecture K says the supremum is attained by the diffuse Gaussian adversary:

    **K.**  Λ(G) ≤ S(ε, ℓ, β) := sup_{σ≥0} Λ(σW)   for every n and every G ∈ H₂,₁(ℂⁿ),

W a standard complex Gaussian independent of z (the limit of N^{−1/2}ΣH(w_j)). With K the row becomes the explicit
one-dimensional function D″(t) = t² + min_{ℓ,β}[S + 2β²/ε − 2ℓt], and the certificate loses the gate loss, the
residual-law loss and the price layer at once. Gaussian ideal (`kmodel.py`): 1/max D″ = 1.402259 at ε = 0.7564,
1.402166 at 0.75, 1.401957 at 0.745. **So K delivers 1.4022 and nothing beyond**: the cubic witness has the rigorous
dimension-uniform ceiling 1.4022581 (23 Oct), and at ε = 149/200 it cannot reach 1.402 at all. Even the weak form
K_η with η ≤ 1.0·10⁻⁴ (B ≤ 0.713267 at the peak) suffices for 1.402.

Needed range: ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16]; actual rows (ε, ℓ, β, σ*) = (0.7564, 0.8456,
0.1432, 0.2009), (0.745, 0.8534, 0.1467, 0.1726), (0.7564, 0.877, 0.152, 0.1617). The box corner (0.74, 0.90, 0.12) has
σ* = 0 and the proofs below assume σ* ≥ 0.1 or a/β ≤ 11/2 (a/β ≥ 11/4 is also used); exclude it.

Two restricted forms matter:
- **K′ (admissible responses)**: the row dropped −‖Pk‖²; Λ′(G) = sup{… − ‖Pk‖² : |f| = |g| = 1, εQk = G} ≤ Λ(G), and
  K′: Λ′ ≤ S is weaker than K and still sufficient. For the diffuse Gaussian adversary the penalty vanishes; for junta
  residuals it is positive. Response feasibility also bounds what G can occur: remote energy ‖q‖² ≤ 0.0463 on the central
  rows, total ‖G‖² ≤ 0.072, and everything with ‖q‖² ≤ 0.0148 is covered without K (ellipse and two-disk caps).
- **K_all (every ε)**: equivalent to same-norm domination sup{Λ₀(G): ‖G‖² = v} = 2E|L + √vW| for every v (Legendre
  transform of the concave benchmark). This is the "isoperimetric" form; it is FALSE for unrestricted profiles
  (ℓ − 2β ≲ 10⁻¹⁰, tiny norms) and false fibrewise at a fixed shift, but no violation is known on the box.

## 2. Structure of the adversary

Decompose G by its dependence on z₁ (T = |z₁|², w the remote coordinates):

    G = q(w) + (T−1)r_A(w) + Z²r̄_B(w)/√2 + Z·Q(w) + Z̄·P(w) + d·Z(T−2),

q remote cubic (H₂,₁(w)), r_A, r_B remote linear (the **A and B shells**, Gaussian given w's law... r_A ∈ H₁,₀),
Q ∈ H₁,₁(w), P ∈ H₂,₀(w) (the **Z-shells**), d ∈ ℂ. After factoring e^{iθ} the θ-frequencies are q: −1, A: −1,
B: +1, Z-shells: 0 and −2; so cross terms in E[|G|²|T] vanish between different frequencies, and **first-order content
lives only in A and B; A has the same frequency as q, so they add coherently.** The conditional second moment is
E[|G|²|T] = v_q + w_A(T−1)² + w_B T²/2 + T(C + D(T−2)² + ET) (no cross terms). The A profile (t−1)² is the one admissible
profile that moves variance to T ≈ 0 where |L| vanishes, violates "H(t)/t increasing", and is **not scale-local**:
every single-scale strengthening of K (heat kernel, Laplace, characteristic function) is false, fixed-shift domination
E|r + q| ≤ E|r + ‖q‖W| fails for r ≥ 2.5 even for cubics, and the full phase Hessian at the diffuse contact has an exact
flat sector for independent cubic changes. **K is an averaged, multi-scale statement; the visible variable must be
integrated first.**

## 3. What is proved (status on the box unless stated)

### 3.1 The visible shells (everything but A)
- **Theorem A** [P, verified by quadrature] (ChatGPT thread 1, `ai-notes/`… "gaussian-domination-cases"): every G whose
  Wick polynomial vanishes at z₁ = 0 (all shells except A and the remote q) satisfies same-norm domination
  F(G) ≤ B(‖G‖²), F = E|L+G| + E|L−G|, B(v) = 2E|L + √vW|. Proof: (|L+G| + |L−G|)/2 ≤ √(|L|²+|G|²), conditional Jensen
  given T, tangent inequality, the scalar integrals ∫√t e^{−t}(t²−4t+2)(a²+v)^{−1/2}dt ≤ 0 (two integrations by parts,
  needs a/β ≥ 11/4) and the radial comparison E[|Z|√(a(T)²+v)] ≤ E|Za(T) + √vW| (monotone coupling). Requires q = 0:
  a remote part enters the tangent step with weight (1−t) of positive integral (my "H = 0 unnecessary" was wrong).
- **Aligned shell** [P] (thread 2): for E[|G|²|T] = vT (G = ZQ + Z̄P with arbitrary remote Q, P, shared coordinates
  allowed), F(G) < B(v) by the Laplace-transform comparison E e^{−uT(f²+v)} ≥ E e^{−u|L+√vW|²} (substitution y = (1+uv)t).
- Odd-in-z₁ cubics (Z-shells and dZ(T−2)) have the explicit margin Λ(G) ≤ 2E|L| − 0.128(‖A‖²+‖B‖²) − 0.66|d|² [P]
  (pointwise majorant); n = 1 is settled (sup Λ = 1.3649 < S = 1.3739535).

### 3.2 Conditionally Gaussian adversaries (A and B shells with Gaussian drivers)
- **Theorem B** [P, C] (thread 2, `chatgpt-thread2-gaussian_domination_note.tex`; the manuscript's polar:main covers the
  same class with explicit deficits S − α²/10 − β²/4): if G is proper Gaussian given (z₁, 𝓕) with variance
  h(T) = s + u(T−1)² + bT + cT², coefficients ≥ 0 (random, 𝓕-measurable), and a/β ≤ 11/2, then F(G) ≤ B(‖G‖²).
  Proof: ∂_wM_w = K_w/4, K_w(r) = √(π/w)e^{−x}I₀(x), m(x) = 2x(1 − I₁/I₀) < 13/10, rK < 6/5 (both verified: 1.2178,
  1.1752), unimodality of K in w, the weight t(t−2) of zero mean against a kernel ≥ its value at t = 2 on (0,2) and ≤ on
  (2,∞), then the affine path with the Chebyshev step. The constant a/β ≤ 11/2 is exactly tight for this proof.
  Includes z₂{α(T−1) + iλ(|z₃|²−1)} (shared coordinate, conditionally Gaussian) and OU-path monotonicity for α(T−1)z₂.
- Not covered, by design: a sign-indefinite cross term 2αγ(T−1) in the variance (same driver in the remote and A parts).
  That term cannot occur in H₂,₁ (q cubic and r_A linear are uncorrelated), but it is exactly the mechanism by which
  the **degree-5 analogue K₅ fails** at the flank rows (+8e-5…1e-4): with a Gaussian driver (T−1)R_N ∈ H₃,₂ the excess
  over S is ≥ εα²I²/4 > 1.5·10⁻⁴ [P] (thread 2, R2).

### 3.3 The remote part (q alone): K-a
- Reduction [P] (manuscript ch32): L is a circular Gaussian scale mixture (L =_d √V W, Bernstein), so K-a for every
  profile and ε follows from **PVD**: E|N + q| ≤ (√π/2)√(V + E|q|²) for N Gaussian independent of q; PVD at V = 0 is
  equivalent to PVD at every V (buffer closure). Real form = **BNC**: E[(Γ − σ²)e^{−sX²}] ≤ 0 ∀s (Γ = ‖DX‖²/k the Stein
  kernel), the Gaussian-weight Key Lemma; the interval form SEI (E[(Γ−σ²); |X| < a] ≤ 0) implies it by layer cake.
- Proved: order 2 (unimodality) [P]; one-variable H₃ at every scale (sublevel argument, F(x) = x(x²+1)e^{−x²/2},
  r₃ = r₁ + r₂, 7e⁻² < 1) [P]; the two-parameter family aH₃(g₁) + bH₂(g₁)g₂ with Gaussian weight at every scale [P, C]
  (thread 2, R3; 130 exact boxes); Gaussian scale mixtures (Cov(V,(1+V)^{−1/2}) ≤ 0) [P]; conditionally Gaussian X = √V Z
  (Chebyshev) [P]; near-Gaussian with margin ≈ κ₄/(6λ) [P]. Open: BNC for general order-3 chaos.
- Certified in the project: K-a with η ≤ 10⁻⁵ for every remote cubic (moment and Stein inputs, kernel-checked) [L/C];
  exact for the one-coordinate star, all of H₂,₁(ℂ²), Gaussian scale mixtures.
- Negative: L4 (monotonicity along the CLT) is false; fixed-shift domination is false (see §2); the scalar Stein-sign
  form of OU monotonicity is not equivalent to monotonicity and fails for G = Mz₁(T−2); the exact OU derivative is
  F′(c) = c·E[(A − (σ²/2)I):(J₊+J₋)] + E[B:(J₊−J₋)].

### 3.4 The core: q + (T−1)U, U a remote linear form
Write u = ‖q‖², w = ‖U‖².
- **Disjoint drivers (q independent of U): closed up to K-a** [P, C], by two independent proofs.
  (i) Thread 1: F(H + (T−1)U) ≤ F(H + √wW) for ANY H independent of (Z, U) with u + w ≤ ℓ² (interpolating
  w_d(t) = w(1 + d·t(t−2)); negative part ≥ N/(ℓ√(m₋ + v/ℓ²)) > 37N/(50ℓ), positive part ≤ (6N/5ℓ)(½ + 7h/(60ℓ²)) via
  rK ≤ 6/5, a radius reduction and the shifted outer integral P(p) ≤ ½ + 7p²/60). (ii) Thread 2:
  Λ(q + (T−1)U) ≤ Λ(q) − (1/ε − 199/(200ℓ))w at every amplitude (variance integration, potential bound
  I_s(y) < 1.99/ℓ certified by `verify_core.mjs`, replayed: 1.98999). Both reduce the disjoint core to K-a, hence
  K_{10⁻⁵} on the disjoint core.
- **Arbitrary sharing, orthogonality only** [P, C]: Λ(q + (T−1)U) ≤ B₀ + 0.38968u − 0.12432w (manuscript
  thm:shared-a-audit, B₀ = 2E|L|) and, tonight, Λ ≤ B₀ + 0.11u − 0.32w + 5.25w² (third GPT; shape inequality
  cx + bx³ ≥ cM(x) + B(c)N(x)x², remainder through E|U|⁴ only), refined with a free θ to the universal cutoff
  **w ≥ 0.01125 ⇒ K_{10⁻⁴}** (u ≤ 0.0463). The uncovered set for K_{10⁻⁴} is therefore
  **R = {w < 0.01125, 0.00551 + 0.319w < u ≤ 0.0463}** (curved boundary u ≤ (0.0020476 + η + 0.32w − 5.25w²)/0.11).
- **Buffered coverage** [P, C] (manuscript ch55): if the remote part is q + gW with a genuine cubic q of energy ≤ 0.0064
  and a diffuse buffer g ≥ 0.185 (the optimum has g = σ* ≈ 0.2), every shared A and B shell is covered at all amplitudes.
  This is a statement about the family q + gW (an exact Gaussian buffer), not a bound on the fourth excess of a general
  cubic (normalised sums of cubics keep u and have δ → 0); the near-Gaussian regime δ/u² ≤ 0.05 is covered instead by
  the manuscript's K_η proof (x ≤ 0.22). So the open set in the fourth-excess coordinate is 0.05 < δ/u² ≤ 42.
- **Zero-buffer A cost** [C]: Λ(q + (T−1)U) ≤ Λ(q) + 2Re⟨U, F_A(q)⟩ − κw with F_A(q) = E_{z₁}[(T−1)ph(L+q)],
  κ = 0.19 for ‖U‖ ≤ 1/16 (manuscript ch46), extended tonight to ‖U‖ ≤ 0.15 at the three rows (thread 2, `verify_shared`)
  and to **κ = 0.24 for w ≤ 0.0113** (`verify_content_extension`), full box: cost ≤ K(p)ρ²ℓ, K ≤ 1.045, ρ = √w/ℓ ≤ 0.197.
  Hence on R the conjecture follows from the **content inequality**
      C(q)² := ‖Π₁,₀F_A(q)‖² ≤ 0.24·D(q),   D(q) = S − Λ(q) (or the same-norm deficit B(u) − F(q) ≤ D(q)),
  and more precisely from the joint majorant D(q) ≥ Ψ(C(q)), Ψ(C) = C²/0.24 for C ≤ 0.24r₀, 2r₀C − 0.24r₀² beyond,
  r₀ = √0.0113.
- **Proved on R for the two templates** q = cX(|X|²−2), q = cX(|Y|²−1), any phase, any U (two independent certificates:
  thread 1 `verify-content.mjs`, ratios 0.138/0.135 on the box, 0.103/0.055 at the rows; thread 2 `verify_shared.mjs`,
  constant 0.19 − 3e-6 and the direct F(q + (T−1)U) ≤ B(u+w) − 10⁻⁶ℓ): **K with η = 0 for these families on R**.
  Also closed: c = 0, P =_d −P, R independent (content 0 by symmetry) ⇒ exact K for 1/24000 ≤ w ≤ 0.0113.
- **Tensor inequalities** for the leading term T(q) = Π₁,₀(q|q|²): ‖T(q)‖² ≤ (3√6/4)δ^{3/2}, δ = E|q|⁴ − 2u² [P]
  (improves 3.674); ≤ 0.481δ^{3/2} on the one-driver Hermitian family [C]; lower bound 0.4808 (explicit tensor; our
  earlier 0.4775 was at n = 2; the constant grows with n, ≥ 0.509 at n = 6). Content expansion: Π₁,₀F_A(sq) =
  (s³D₁/16)T(q) + O(s⁵), D₁ = 34.55; full quartic coefficient of F(sG) − M(s²v) known (thread 1, R4).
- **Nonlinear content and deficit at every amplitude** (fresh thread, 5 Nov; verifier `chatgpt-fresh-verify_nonlinear_
  content.mjs`, replayed): (a) |C_X(q)|² ≤ 50κ^{3/2} for every cubic, every dimension and amplitude, with no Taylor
  remainder. Proof: real projection (C_X = (π/2)E[X̄m(η)], m(t) = E[(T−1)sgn(Re L + t)], η = Re q), the exact
  integration-by-parts identity E[ξm(η)] = E[m‴(η)P_h] with P_h = 27ΣB_{ij}I₂(f_i)I₂(f_j) + 54I₂(f_d) (E|P_h| ≤
  54(1+√2)r^{3/2}, δ ≥ 1296r²), and |m‴| ≤ m‴(0) = 2D₁/π because the (T−1)-weighted projection density has a
  nonpositive Fourier transform (the projection densities are completely monotone in t², the manuscript's CM A-profile).
  It covers the fifth-order example q₀ since the weight m‴(η) is not constant. (b) The remote deficit has the exact
  representation D(q) = −3Σ_{j=2,4}E[V_jVK_j(η)], V = ‖Dη‖²/3 − v = V₂ + V₄ (its second- and fourth-chaos parts,
  δ = (9/2)α² + 9β²), K_j double OU-resolvents of Φ⁽⁴⁾; with the global sixth derivative Φ⁽⁶⁾(0) = 2740.8 it gives
  D(q) ≥ (267/320 − (61875/128)u)κ, positive only for u < 0.0017. Certified consequence: **the content inequality with
  0.19 holds for every cubic with u ≤ 19/50000 = 0.00038** (with constant 1 for u ≤ 0.001). On the templates the true
  ratio D/κ is 0.78–0.81 at u = 2·10⁻⁴ and still 0.134/0.232 at u = 0.0463 (exact quadrature), so the whole loss is the
  global-derivative step; since Φ⁽⁴⁾ and m‴ are Gaussian mixtures in x², both (a) and (b) can be made scale-dependent
  (positive mixtures over λ of E[−V_jVe^{−λη²}] and E[P_he^{−λη²}]), which is the requested next step.
- **Gaussian-factor class, covariance-sensitive theorem** (fresh thread, 5 Nov ≈10:40, constants verified): for
  q = ΣX_jP_j(Y) (P_j centred, any dependence), with Σ = E[PP*], ρ = ‖Σ‖_op: cc* ⪯ (2𝓐′(0)²/Q(0))D(q)Σ, so
  C(q)² ≤ (56/5)ρD(q); hence the content inequality with 0.19 for ρ ≤ 0.01696 and, with the 0.24 cost, **K on R for this
  class whenever ρ ≤ 3/140 = 0.0214** (e.g. Σ = (u/3)I₃ at every u ≤ 0.0463). Tools: −g completely monotone for
  F_A(y) = yg(|y|²), the derivative-ratio lemma 𝓐′(v) ≤ (𝓐′(0)/Q(0))Q(v) (single crossing), and exact Bernstein
  representations D(q) = ∫[E e^{−t|q|²} − 1/(1+ut)]ω(dt), C_X(q) = −∫E[X̄qe^{−t|q|²}]ν(dt) valid for every cubic.
  Gap inside the class: ρ ∈ (0.0214, u] with m ≥ 2 drivers (two equal drivers at u = 0.0463 have ρ = 0.0232); the
  templates (ρ = u) are certified separately. Not covered: self-interaction cX(|X|²−2), added R(Y), general tensors.
- **Hermitian one-driver family closed on R at the three rows** (5 Nov ≈11:20): q = e^{iθ}X(Y*AY − tr A) for ANY
  Hermitian A, 0.00551 ≤ u ≤ 0.0463: ‖Π₁,₀F_A(q)‖² ≤ 0.236364(B(u) − F(q)), hence with the 0.24 cost
  Λ(q+(T−1)U) ≤ B(u) − pu − (303/20000)Δ ≤ S for w ≤ 0.0113. Method: F(q) = EB(P²), content = ½|E[PJ(P²)]|,
  weighted Cauchy–Schwarz against the Bregman deficit d_u, the coupled moment inequality EP⁶ ≤ (125/3)uEP⁴ − 110u³
  for centred Hermitian quadratic forms, and a certified polynomial envelope of R_u(y) (43k/18k/4k rational boxes).
  No Schur-convexity needed. Verified by quadrature (tight at u = 0.0463, y ≈ 1). Remaining one-driver pieces:
  non-Hermitian A, the self-interaction cX(|X|²−2) + XP(Y), the shells X̄B, (|X|²−1)V, X²W̄, and an added R(Y).
- **Exact remainder-free representations** (fresh thread): with −g completely monotone, C_X(q) = ∫E[X̄q(1 − e^{−t|q|²})]ν(dt)
  (using E[X̄q] = 0) and D(q) = ∫[E e^{−t|q|²} − 1/(1+ut)]ω(dt); the content can be negative (λ = (1,1,−2): f_P(x) − f_P(−x)
  changes sign once, so E[Pg(tP²)] < 0), and the X̄Y² shell contributes 8α|β|² to the leading tensor.
- **Limits of the fourth-moment routes** (third GPT): universal cutoff w ≥ 0.011223 and no further (closed envelope in
  (u,w) with the fourth moment eliminated misses (0.0463, 0.01125) by 10⁻⁵; the conditional-energy envelope cannot
  improve the full-height strip); new exact inequality 4m₂₂ + 2n₂₂ ≥ 4uw + 10c₁₃²/w².
- **Why no leading-order proof exists**: (a) the leading content/slack ratio 8D₁²v/(21|D₀|) for the Wick monomial allows
  only v ≤ 0.0112 at the peak even with an optimal tensor constant; (b) q₀ = X[−½(|X|²−2) + Σ₄(|Y_j|²−1)] has T(q₀) = 0
  but E[X̄q₀|q₀|⁴] = −243 with g₂ < 0, so its content is positive at order λ⁵ [C]; (c) Taylor remainders reach only
  λ ≈ 0.006–0.008 (needed: amplitudes up to 0.26); (d) the content inequality for ALL cubics is proved only for
  u ≤ 3·10⁻⁵ (box) / 2.9·10⁻⁴ (rows) via cumulant-sensitive remainders. **The lemma is a finite-amplitude statement.**
- **What any proof must use**: the Gaussian-marginal obstruction (manuscript ch35; sharpened tonight: H = (1/5)X sgn(R−d*),
  U = X/50, E[HŪ] = 0, Gaussian law, Λ = 1.37417 > the whole 1.402 allowance 1.374054, 44 % of its energy outside H₂,₁)
  shows that law-only information, orthogonality and all proportional Rice cuts admit a violator; a proof must use the
  joint Wick structure (E‖Dq‖² = 3u, the resolvent identity E[Ȳ((3N−p)Ψ)(q)] = 3E[ȲR_Ψ], the first-chaos coefficient
  E[z̄_jF_A(q)] = E[(g + sg′)∂_jq + q²g′∂_jq̄]). On the response side the constraint that rejects the obstruction is
  the joint budget eq:jrb-main together with the exact cubic projection consistency Q_X k̄ = pq.
- Exact bookkeeping for one driver [P]: q = cX(|X|²−2) + XP(Y) + X̄B(Y) + (|X|²−1)V(Y) + X²W̄(Y) + R(Y), with exact
  reductions F, C and F(q + (T−1)dX) through 𝓜(r, a₀, b) = E_{θ,φ}|re^{iφ} + a₀ + be^{iθ}| for the subfamily
  cX(|X|²−2) + XP + R; matrix formulas T(q) = (32a³ + 4ap + 2at + 4ζ)X, δ = 168a⁴ + … for P = Y*AY − tr A.

### 3.5 Numerical state of the content lemma (my scan, 5 Nov 12:30–15:50; two bugs found and fixed: a kernel sign error, and g(0) = 0 instead of −0.835 in the table, the latter spotted by the Hermitian thread)
`e11_scan_majorant.py` / `e11_scan_opt.py` (peak row; φ(v) = 2E|L+√v| and the A-profile g, F_A(y) = yg(|y|²),
g(0) = ½E[(T−1)/r(T)] = −0.835, −g completely monotone, tabulated by quadrature through the angular means; F(q),
D(q) = B(u) − F(q) and C(q)² = Σ_{all remote directions}|E[d̄F_A(q)]|² by Monte Carlo with 3·10⁶ common samples; check:
H₁ at u = 0.0463 gives C² = 1.06·10⁻³, ratio 0.0884, matching thread 1's quadrature 0.0876):
- **D(q) > 0 for every cubic tested** (PVD never failed): D/δ ∈ [0.13, 0.36] at u = 0.0463, [0.23, 0.50] at 0.02,
  [0.42, 0.68] at 0.0055.
- **Worst C(q)²/D(q) = 0.0891 at u = 0.0463, 0.0708 at 0.02, 0.0406 at 0.0055**, attained by the single Wick monomial
  X(|X|²−2) along its own driver (the remote monomial Y(|Y|²−2) gives the same along Y; the thread's smooth kernel gives
  0.0389 at 0.00551); twelve random ten-shell mixtures and a 12-shell hill-climb (0.0308 / 0.0507 / 0.0504 / 0.0839 at
  u = 0.0055 / 0.01 / 0.02 / 0.0463) stay below it at every energy; the zero-tensor q₀, the non-normal Ȳ₀Y₁ form and the
  shells X̄Y², X²Ȳ have negligible content (ratios ≤ 10⁻⁴); the aligned shell (|X|²−1)Y behaves like the template H₂.
- Hence the content inequality with 0.24 holds everywhere tested with margin ≥ 2.7, the ratio increases with the
  energy, and **the worst case on the rectangle is the known template at the top energy** (certified ≤ 0.103 there).
  The leading-order ratio 8D₁²u/(21|D₀|) = 0.78 at u = 0.0463 overestimates the truth by 9×: the content saturates
  (|F_A| ≤ 1) while the deficit keeps growing.
- Implications for the proof: (i) the extremal direction for "content per deficit" is the self-interaction
  X(|X|²−2), i.e. maximal fourth excess; a proof that the ratio is monotone in the kurtosis in a suitable sense (or a
  finite-amplitude envelope with the Wick monomial as the extreme case) would settle the lemma with a 2.7× margin;
  (ii) general mixtures are far from tight (≤ 0.081, mostly ≤ 0.04), so coarse rigorous enclosures of the exact
  one-driver reductions have room; (iii) the fourth-excess coordinate is the right one: the worst mixtures have the
  largest δ/u².

### 3.6 Summary table

| class of G | status | source |
|---|---|---|
| vanishes at z₁ = 0 (Z-shells, dZ(T−2), no q) | same-norm, all amplitudes [P] | Theorem A |
| conditionally Gaussian given z₁, profile s + u(T−1)² + bT + cT² | same-norm [P,C] | Theorem B, polar:main |
| remote q alone (K-a) | η ≤ 10⁻⁵ certified; exact for mixtures, ℂ², star | manuscript |
| q + (T−1)U, disjoint drivers | reduced to K-a, all amplitudes [P,C] | threads 1 and 2 |
| q + (T−1)U, any sharing, w ≥ 0.01125 or u ≤ 0.00551 + 0.319w | K_{10⁻⁴} [P,C] | audit + third GPT |
| q + gW + shells, genuine energy ≤ 0.0064, g ≥ 0.185 | all amplitudes [P,C] | ch55 |
| the two templates on R, any phase, any U | exact K [C] ×2 | verifiers |
| arbitrary cubic, u ≤ 0.00038 (0.19) / u ≤ 0.001 (constant 1) | content inequality [P,C] | fresh thread |
| Gaussian-factor q = ΣX_jP_j(Y), ‖E[PP*]‖_op ≤ 3/140, w ≤ 0.0113 | exact K [P,C] | fresh thread |
| Hermitian one-driver family q = X(Y*AY − tr A), any Hermitian A, 0.00551 ≤ u ≤ 0.0463, w ≤ 0.0113 | exact K at the three rows [P,C] (content ≤ 0.2364·deficit; moment inequality EP⁶ ≤ (125/3)uEP⁴ − 110u³) | ChatGPT 5 Nov |
| one-driver shell XP(Y), **any complex** coefficient matrix A, 0.00551 ≤ u ≤ 0.0463, three rows | **certified** (Arb + rationals, 0.239; replayed green by the user 5 Nov) | R23, `ai-notes/r23_r25_certificate/` |
| one-driver shell XP(Y), any complex A, same range: constant improved to **11/50 = 0.22** by a reweighted Cauchy–Schwarz (affine weight, no pseudovariance) | **certified** (12,346 rectangles, 441 nodes at 160 bits; replayed green by the user 6 Nov) | `ai-notes/r26_reweighted/` |
| **Gaussian-factor class q = ΣX_jP_j(Y), any number of drivers, any complex coefficient matrices, no covariance restriction**, 0.00551 ≤ u ≤ 0.0463, three rows | **certified** (vector quadratic-form moment inequality + R23 kernels, 0.239; analytic part verified, replayed green by the user 5 Nov) | Hermitian thread, `ai-notes/gaussian_factor_content/` |
| self-interaction family cX(\|X\|²−2) + XP(Y): remote domination F(q) ≤ B(u) − \|c\|²𝓚(u), all amplitudes | **proved** (size-biased Bregman identity) | R24 |
| self-interaction family X[c(\|X\|²−2) + P(Y)], ANY centred P, **p = E\|P\|² ≤ u/16**, 0.03 ≤ u ≤ 0.0463, three rows | **certified** (49/211 < 0.24; perturbation from the monomial; replayed green by the user 5 Nov) | Hermitian thread, `ai-notes/wick_endpoint_extension/` |
| self-interaction family X[c(\|X\|²−2) + P(Y)], ANY centred P, **p ≤ u/5**, 0.00551 ≤ u ≤ 0.0463, three rows | **certified** (9/40 = 0.225; sharper perturbation bounds; replayed green by the user 5 Nov) | Hermitian thread, `ai-notes/wick_r26_twenty_percent/` |
| **self-interaction family with real c and Hermitian A, EVERY share, 0.03 ≤ u ≤ 0.0463, three rows** | **certified** (0.23 with reserve 1/40000; joint polynomial majorants of F + 2ℓ𝒞, 55,539 witnesses; quick replay green by the user 6 Nov) | Hermitian thread, `ai-notes/r26_self_interaction/` |
| self-interaction family, middle region 1/16 ≤ 2\|c\|²/u ≤ 15/16, ANY centred P: C² ≤ 0.22·Δ via envelope (★) | tail proved; compact region numerically true (thread + my check, margin ≈ 0.4 % of H); interval certificate pending | `ai-notes/integrated_wick_envelope/` |
| self-interaction family, small-Wick strip 2\|c\|²/u < 1/16 (c ≠ 0): shared-A content inequality | OPEN (bridge from the certified c = 0 end) | R24 |
| **Envelope E′ (ratio ≤ 0.11 on R; exact extremality of the monomial false with certificate, excess ~10⁻⁴)** ⇒ K on R | numerically true with margin 2.7; to prove (THE WAY, §4) | my scan, Hermitian thread |
| **arbitrary shared cubic on R** | **open: content lemma for 0.0064 ≲ u ≤ 0.0463** | — |
| degree-5 analogue K₅ | false by ≈ 10⁻⁴ at flank rows | K5 + thread 2 R2 |

## 4. What is left

**Current open set (5 Nov, 22:00).** K on the rectangle R = {w < 0.01122, 0.00551 + 0.319w < u ≤ 0.0463} for an
arbitrary remote cubic q sharing drivers with the A-shell driver U, EXCEPT the classes now certified and replayed on
this machine: the one-driver shell q = XP(Y) with any complex coefficient matrix (R23, 0.239); the whole Gaussian-factor
class ΣX_jP_j(Y), any number of drivers, any complex coefficient matrices (three independent packagings, 0.239); the
self-interaction family X[c(|X|²−2) + P(Y)] for ANY centred P when the Wick part carries ≥ 4/5 of the energy, on the
full interval u ∈ [0.00551, 0.0463] (9/40; 22:30), and ≥ 15/16 on u ∈ [0.03, 0.0463] (49/211); the near-Gaussian part δ/u² ≤ 0.05 (manuscript K_η); all cubics with u ≤ 0.00038.
What remains open, in order of maturity:
(a) **the one-driver family with self-interaction**: real c + Hermitian A closed on u ∈ [0.03, 0.0463] (23:50, replayed);
    any P with Wick share ≥ 4/5 closed on the full interval (9/40, replayed); what remains is NON-Hermitian P with
    Wick share < 4/5 on [0.03, 0.0463] (middle region by (★), share between 1/16 and 4/5): the fixed
    envelope (★) gives 0.22 for any centred P; its tail is proved and its compact part is numerically true with margin
    0.38 % of H at the hard corner (u = 0.0463, share 15/16, z = 0), confirmed independently; needs an interval
    certificate on (u, f, Re z, Im z);
(b) **the small-Wick strip** (share < 1/16, c ≠ 0): the pointwise-deficit radial envelope is excluded by a certified barrier
    (0.2468 at the pure-P end), but the reweighted candidate (†) (affine Cauchy–Schwarz weight, 10:30) is numerically
    0.2306 ≤ 0.235 on the strip, four real parameters, tail proved, a neighbourhood of f = 0 proved; its compact
    certificate is pending. The directional envelope (0.2393) is NOT a fallback any more: a certified eight-atom witness
    (u = 0.0463, c = 10⁻⁵, τ = 0.825) forces its cap above 0.2405 (11:30), so (†) or a direct perturbation from f = 0 are
    the only routes;
(d) **the mixed shells** X̄B, (|X|²−1)V, X²W̄, R₀ through their cross terms (exact bookkeeping R25; nothing certified);
(e) several drivers with self-interaction (expected to follow the one-driver pattern driver by driver).
Numerically the worst ratio on R is ≈ 0.0876 at the top energy, near the Wick monomial (a saddle, exceeded by
1.3·10⁻⁴ by an imaginary quadratic perturbation; certified), against the needed 0.24; the refined residual target with
benchmark slack removes the small-energy edge, so the hard range is u ∈ [0.03, 0.0463].

**Original statement of the open set (5 Nov, 12:00), kept for the record.** K on the rectangle R = {w < 0.01122, 0.00551 + 0.319w < u ≤ 0.0463} for an
arbitrary remote cubic q sharing drivers with the A-shell driver U, with fourth excess δ/u² ∈ (0.05, 42] (the near-
Gaussian part δ/u² ≤ 0.05 is covered by the manuscript's K_η proof, the templates, the Hermitian one-driver family and
the spread Gaussian-factor class are covered by certificates, the disjoint case reduces to K-a). The universal
fourth-moment routes (shape inequality with the free parameter θ, the conditional-energy version) are provably
exhausted at w ≈ 0.0112: they miss the corner (0.0463, 0.01125) by 10⁻⁵ with the sixth-moment remainder consuming
the gain. The remaining tool is the content lemma below, attacked family by family through exact one-driver
reductions, or in general through the scale representations.

The single open statement, in its sharpest form (peak row, then the two other rows):

    For every remote cubic q with 0.00551 < ‖q‖² ≤ 0.0463, fourth excess δ/u² > 0.05 and every unit remote linear form X,
        C_X(q)² = |E[X̄(T−1)ph(L+q)]|² ≤ 0.24·(B(u) − F(q)),
    (sufficient, not necessary). The sharp consequence of the quadratic shell-cost bound, maximised over ‖U‖ ≤ r, is the
    WEAKER refined target (a thread, 5 Nov, verified §16 of the assessment):
        S − Λ(q) + 10⁻⁴ ≥ Ψ_{r(u)}(C(q)),  Ψ_r(C) = C²/κ (C ≤ κr), 2rC − κr² (C > κr),  r(u)² = min{0.01125, (u−0.00551)/0.319},
    where S − Λ(q) = [B(u) − F(q)] + [S − (B(u) − pu)] includes the nonnegative benchmark slack. Along the monomial the
    required ratio Ψ/(D + slack) is 0.043 at u = 0.0056 (slack ≫ D, r(u) → 0), 0.26 at 0.02, 0.35 at 0.0403–0.0463: the
    small-energy edge is removed from the problem and the hard end is u ∈ [0.03, 0.0463] with margin ≈ 2.9.

Known exact tools for it (all [P], 5 Nov): C_X(q) = (π/2)E[X̄m(η)] = (π/(2√2))E[m‴(η)P_h]; D(q) = EΦ(√vN) − EΦ(η) =
−3Σ_{j=2,4}E[V_jVK_j(η)]; the first-chaos coefficient E[z̄_jF_A(q)] = E[(g+sg′)∂_jq + q²g′∂_jq̄]; the zero-buffer A cost
with κ = 0.24 for w ≤ 0.0113; the full real-projection remainder formula (24) of the shared-driver note; the
complete-monotone (Gaussian-mixture) structure of all visible kernels. The two certified finite-amplitude methods
(outward enclosures of the one-driver reductions) are the only ones that have reached u = 0.0463 so far.

**What the scan changes (5 Nov 13:40).** The lemma is tightest at the top energy and for the pure Wick monomial
(ratio 0.088 vs 0.24); every mixture tested is below it. So the natural theorem is an envelope statement: among cubics of
energy u the content per deficit is at most a constant times the monomial's (the monomial itself is a saddle, exceeded
by 1.3·10⁻⁴ relative; see THE WAY). The certified ingredients for a direct proof
exist for the one-driver family (exact reductions, weighted Cauchy–Schwarz against the Bregman deficit, the coupled
moment inequality); for general tensors the missing piece is a deficit lower bound at finite amplitude (true value
D/δ ≥ 0.13 at u = 0.0463) together with the remainder-free content representation C_X(q) = ∫E[X̄q(1−e^{−t|q|²})]ν(dt).

### THE WAY: the Wick-monomial extremal principle

**Conjecture E (extremality of the self-interaction monomial).** At each row and each energy u ∈ [0.00551, 0.0463],
among all remote cubics q with ‖q‖² = u and every unit remote direction X,

    C_X(q)² / D(q)  ≤  C_X(q_W)² / D(q_W),     q_W = √(u/2)·X(|X|²−2)   (the pure Wick monomial along X),

and the right side is increasing in u (0.039–0.041 at 0.0055, 0.071 at 0.02, 0.089 at 0.0463 at the peak row; certified
upper bound 0.103 at 0.0463). Since 0.103 < 0.24, Conjecture E plus the certified shell cost closes K on the whole
rectangle at once, with a factor 2.3 of room.

**Update 16:55/18:30: the exact form of E is FALSE, now with a rigorous certificate from the Hermitian thread, replayed green by the user (second variation in (0.00140, 0.00198) > 1/1000 by Arb enclosures, explicit cubic with τ = 1/10000; `ai-notes/progress_2026-11-05/`), confirmed by my deterministic quadrature: q_τ = √(u/(2+τ²))·X[(|X|²−2) + iτ(|Y|²−1)] has second variation +1.65·10⁻³·τ² at u = 0.0463, maximum near τ ≈ 0.1 with relative excess 1.3·10⁻⁴; `e11_second_variation.py`). The Hermitian thread found that a small imaginary Hermitian
perturbation X[(|X|²−2) + iλP(Y)] raises the ratio slightly (it is preparing a rigorous certificate); my common-random-
number check sees the ratio flat to 10⁻⁵ under such perturbations and decreasing under real ones, so the monomial is a
saddle point, exceeded by a relative margin of order 10⁻⁴. The statement to prove is therefore the
envelope **E′: sup_{‖q‖²=u} C_X(q)²/D(q) ≤ 0.11 on R** (monomial 0.089 plus room), not exact extremality; the plan below
is unchanged, with "monomial = maximiser" read as "monomial = near-maximiser".

**Status of E: a conjecture supported by scans (22 structured cubics per energy, a 12-shell hill-climb), not a theorem;
the scan code had two bugs on 5 Nov, so the evidence is only as good as its latest replay.** E is also stronger than
needed: the goal is only an upper envelope C_X(q)² ≤ 0.24·D(q) on R; exact extremality of the monomial is the natural
mechanism, not a requirement, so any proof that bounds the ratio by a constant < 0.24 (e.g. by the monomial's certified
0.103 plus a loss factor ≤ 2.3 for the cross terms) serves the same purpose.

Why this is the right statement: the content C_X(q) = E[X̄q g(|q|²)] = E[X̄q(g(|q|²) − g(u))] is driven by the
dependence between the direction X and the modulus |q|; it is largest when all the energy of q sits in the one
self-interacting shell, where |q|² = (u/2)|X|²(|X|²−2)² is a deterministic function of |X|, the fourth excess is
maximal (δ/u² = 42) and the content is a pure function of the driver. Every mechanism that spreads q over other
coordinates (the Gaussian-factor class, the Hermitian forms, the remote part R, the shells X̄B, X²W̄) lowers the content
faster than the deficit: in the Gaussian-factor class the content is bounded by ‖E[PP*]‖_op·D (covariance-sensitive
theorem), in the Hermitian family by 0.236·D with the equality direction being the single eigenvalue (the moment
inequality EP⁶ ≤ (125/3)uEP⁴ − 110u³ is sharp exactly there), the zero-tensor and non-normal examples have no content
at all, and the numerical maximiser over twelve shells carries 54–90 % monomial weight.

**Plan of proof of E′ (what to do, in order).**
1. **Reduce to one driver.** The exact bookkeeping is done (R25): with q = cX(R−2) + XP + X̄B + (R−1)V + X²W̄ + R₀ and
   R = |X|², the cubic content coefficient E_θ[X̄q²q̄] = √r{a_r(|a_r|²+2|b_r|²+2|d_r|²+2|e_r|²) + e_r²b̄_r + 2b_rd_rē_r +
   2e_rd_rā_r} lists every cross term, and the counterexample X̄Y² + (|X|²−1)Y with E[X̄q²q̄] = 6 shows that phase
   averaging alone cannot remove the other shells. What must be proved: the cross terms of X̄B, (R−1)V, X²W̄, R₀ raise
   the content-per-deficit ratio by at most the room available (0.24/0.0876 = 2.7). Tool: the remainder-free content
   representation C_X(q) = ∫E[X̄q(1−e^{−t|q|²})]ν(dt) with the Gaussian weight expanded around the one-driver part, and
   the deficit identity through V₂, V₄.
2. **Certify the one-driver family X[c(R−2) + P(Y)], any complex P** (contains the monomial, the saddle direction and
   both templates). DONE for c = 0: R23 certifies C² ≤ 0.239·D for XP(Y) with any complex coefficient matrix on R at the
   three rows (replayed green). For c ≠ 0 (R26, requested): R24 gives the size-biased decomposition B(u) − F(q) =
   Ê d_{u,R}(|b_R|²) + |c|²𝓚(u) (remote domination proved) and the exact content 𝓒 = cuJ′(u)/2 + Ê{b_R[g(R|b_R|²) −
   g(Ru)]}; under the size bias b_R is the quadratic form diag(c,c,A), so R23's moment constraints (E|P|⁶ ≤ 6u³ + 9u|ζ|²
   + (25u + (50/3)|ζ|)κ, verified) transfer; the Gamma weight must be kept (worst-case radius loses too much). Expected
   constant ≈ 0.09–0.11 at u = 0.0463. PARTIAL (19:20): the neighbourhood p ≤ u/16 of the monomial is certified with
   49/211 for ANY centred P on u ∈ [0.03, 0.0463] by perturbation (C ≤ C₀ + 4p, Δ ≥ Δ₀ − 7up/2, C₀² ≤ 0.11Δ₀, Δ₀ ≥ 4u₀²);
   the Hessian step loses ≈ 20× on the content, so the remaining region p > u/16 needs the size-biased argument.
   EXTENDED (22:30): p ≤ u/5 certified with 9/40 on the full interval 0.00551 ≤ u ≤ 0.0463 (C ≤ C₀ + p/(2a²),
   Δ ≥ Δ₀ − vp; my check: 4–7× slack in the content step, deficit bound trivially true).
   REDUCTION ESTABLISHED (20:00, verified): with H_{c,u}(z) = B(u) − B₀ − I_c(z) + B′(u)(|z|²−p) + 2uB″(u)Re(c̄z) ≥ |c|²𝓚(u)
   > 0 pointwise and E H(P) = Δ, and T_c(z) the radius-integrated content, C(q)² ≤ Δ·E[|N(P)|²/H(P)] for N = T_c − λz −
   μz̄ − ν(|z|²−p); numerically this weighted Cauchy–Schwarz is lossless to 0.02 on the family (bounds 0.076–0.087 vs true
   0.045–0.087). What is left is a polynomial envelope |N(z)|² ≤ H(z)·Q(|z|²) uniform in the phase of z, fed by the R23
   moment inequality, with Q's expectation ≤ 0.24: the same machinery that produced 0.239 for the pure-P family.
   Sharper proved form (20:30): the directional matrix bound C(q)² ≤ max_{‖h‖=1}(|hᵀa₀| + √(𝓔 hᵀMh))² (= inf_{s>0}
   λ_max((1+s)a₀a₀ᵀ + (1+1/s)𝓔M), exact duality 23:00, so a scalar s and 2×2 principal minors certify it without a grid in h) with a₀ the Wick
   content αc, 𝓔 the size-biased Bregman part of the deficit and M the controlled covariance of the P-content; the
   certificate target is this ≤ 0.24(𝓔 + |c|²𝓚(u)). Caveats recorded: the content is not analytic in p at the pure-P end
   (𝒞 = J′(0)p^{3/2} + …), and the two endpoints are not interchangeable.
   CANDIDATE (21:00): the fixed affine envelope (★) |T_c(z) − λ(u)z|² ≤ H_{c,u}(z)(9/100 + (13/100)|z|²/p) gives
   C² ≤ 0.22·Δ for EVERY centred P with finite variance on 1/16 ≤ 2|c|²/u ≤ 15/16; its tail |z| ≥ 4 is proved, its
   compact part is confirmed numerically by the thread and independently by me with corrected kernels (worst margin
   0.38 % of H at u = 0.0463, f = 15/16, z = 0; 0.75 % at f = 1/16); tail now proved for |z| ≥ 2 (11:30). To do: interval certificate of (★) on (u, f, Re z, Im z) with |z| ≤ 4; the small-Wick strip
   f < 1/16 (bridge to R23); f > 15/16 below u = 0.03.
   OBSTRUCTION (21:40, certified): on the small-Wick strip a purely radial envelope with only the two R23 radial moment
   constraints cannot reach 0.24 (a three-point law gives 0.2468 at the pure-P end); the directional constraint of R23
   (E[Re(e^{−iθ}P)²] ≤ (1+τ)p/2) must be kept, and the directional envelope N_θ²/H ≤ Q + γRe(e^{−iθ}z)²/p then gives
   0.2393 numerically at p/u = 0.999: feasible but tight. Kernel constant corrected: 𝓚(0.0463) = 0.16678 (peak row).
3. **Several Gaussian drivers.** DONE (18:10): the Gaussian-factor class q = ΣX_jP_j(Y) is certified with 0.239 for any
   number of drivers and any complex coefficient matrices (vector quadratic-form moment inequality EV³ ≤ ((25u+100ρ)/3)EV²
   − (22/3)u³ − 44u tr M² − (176/3)tr M³, R23 kernels; replayed green). Every cubic of the Gaussian-factor form ΣX_jP_j(Y) (drivers entering linearly with coefficients
   independent of them) is closed; the other shells X̄B, (|X|²−1)V, X²W̄, R₀ are NOT covered (step 1); self-interaction in several drivers
   then follows the R26 pattern driver by driver (the content along X_j only sees c_j and P_j after conditioning).
4. **Endgame (conditional on steps 1–3, none of which is complete).** Steps 1–3, once proved, give E′ (ratio ≤ 0.11 < 0.24 on R); with the certified shell cost κ = 0.24 for w ≤ 0.0113,
   the universal cutoff w ≥ 0.011223 and the disjoint theorem, this proves K_η (η ≤ 10⁻⁴) on the three rows, hence
   1.402 through §5. (Monotonicity of the ratio toward the monomial, the former step 3, is FALSE: the saddle.)

Fallbacks if E′ resists in general: prove it on the one-driver family only (step 2 gives that) and treat the
multi-driver remainder by the covariance-sensitive theorem (ρ ≤ 0.0214) plus the response-side restriction K′, which
forces the surviving maximizers into w < 0.00708 where the universal bound has more room.

Routes, in order of promise (older list, kept for reference):
1. **Numerical scan first** (cheap, decisive): C(q)²/D(q) over random one-driver cubics in ℂ²…ℂ⁵ at u ∈ [0.0064, 0.0463]
   (exact 2-D quadrature through the one-driver reductions). If the worst ratio is well below 0.24, the lemma is the
   right target; if some direction approaches 0.24, that direction is where K is tight (and K′'s −‖Pk‖² may be needed).
2. **Extremal reduction over the one-driver family** (caution, 5 Nov: the X̄B(Y) shell does contribute to the content
   along X, e.g. q = αX(|X|²−2) + βX̄Y² has leading coefficient 32α|α|² + 8α|β|², and Schur-convexity in the spectrum
   of P is false in general, so the reduction must keep all six shells): Schur-convexity/majorisation in the spectrum of P = Y*AY − tr A
   so that the certified templates plus the equal-eigenvalue families cover all Hermitian A; then the extra shells
   X̄B, X²W̄ (harmless after averaging the phase of X?) and (|X|²−1)V (the A-shell with respect to X).
3. **Scale-dependent nonlinear bounds** (the fresh thread's route without its Taylor step): write K_j(x) = ∫e^{−λx²}dμ_j(λ)
   and m‴ likewise, bound E[−V_jVe^{−λη²}] and E[P_he^{−λη²}] at each λ through the product formula and the Gaussian
   weight, and integrate; target functions c(u) ≥ 0.13 and c′(u) ≪ 50 on u ≤ 0.0463 such that 50-style arithmetic gives
   C² ≤ 0.19D. This is the first route that treats arbitrary tensors at finite amplitude.
4. **General tensors through the fixed-chaos structure**: both sides as functionals of q through the signed densities of
   Re L (weighted by T−1 for C, unweighted for D), a weighted Cauchy–Schwarz that is an equality in the Gaussian case,
   cross terms by the resolvent identity; the fifth-order example q₀ is the test case.
5. **Response side (K′)**: the exact cubic projection consistency with the joint budget rejects the obstruction; on
   admissible responses the surviving pure shared-A maximizers need η_AB/p < w < 0.00708 (third GPT with K_rot). A
   proof on admissible responses only is enough for 1.402.
6. **Alternative for the project**: the conditional Lean theorem "K_η ⇒ K_G^ℂ > 1.4022" (the user: "at the end"), with K
   as an explicit hypothesis on the three rows; it isolates exactly what the above lemma would discharge.

## 4b. The full chain from the certificates to 1.402, layer by layer (5 Nov 23:30, careful assessment)

K_η must hold for EVERY G ∈ H₂,₁, not only for the core q + (T−1)U. Reading §3 and the manuscript digest together, the
chain to 1.402 has six layers; the content lemma is only one of them.

| layer | statement | status | who / how |
|---|---|---|---|
| L1 remote part | K-a: Λ(q) ≤ S + 10⁻⁵ for every remote cubic | certified in the project (Lean/native) | done |
| L2 core, disjoint drivers | q + (T−1)U with U independent of q, reduced to K-a | proved twice [P,C] | done |
| L3 core, shared drivers, outside R | w ≥ 0.011223 or u ≤ 0.00551 + 0.319w | proved [P,C] (fourth-moment routes, saturated) | done |
| L4 core on R: content lemma C(q)² ≤ 0.24·D(q) | one-driver XP(Y) any A; Gaussian-factor class; self-interaction with Wick share ≥ 4/5 | certified, replayed | threads + me |
| | self-interaction with real c and Hermitian A, every share, u ≥ 0.03 | certified (0.23), replayed | Hermitian thread |
| | self-interaction with NON-Hermitian P, Wick share 1/16–4/5 (envelope (★), 0.22) | numerically true (margin ≥ 0.75 % of H after the 9/40 theorem); interval certificate pending | Hermitian thread (Arb) |
| | self-interaction, Wick share < 1/16 (directional envelope) | numerically feasible, tight (0.2393); certificate pending | Hermitian thread |
| | mixed one-driver shells X̄B, (R−1)V, X²W̄, R₀ with self-interaction; several self-interacting drivers | OPEN; exact cross-term bookkeeping (R25) only; numerically ratios ≤ 0.084 (hill-climb) | nobody yet |
| L5 sector assembly: general G = q + A + B + Z-shells + d | even block (q, A, B) + odd block (Q, P, d), exactly decoupled at first and second order | **OPEN**: Theorem A needs q = 0; Theorem B needs Gaussian drivers; B-sector COST now certified at every amplitude (κ_B = 0.26/0.29/0.30, 6 Nov 11:10; `ai-notes/b_shell_global_cost/`), B-content CERTIFIED for the whole Gaussian-factor class (0.1195, 13:10) and reduced to a kernel comparison in general (C_B ≈ C_A/2, §30); local B-cost 0.35 certified; the B-only core q + B is closed for that class at every amplitude; the joint A/B form: if the mixed term has the positive sign uniformly (as at q = 0) the aligned contents (c_B ≈ 0.5c_A) make the existing A constant 0.24 sufficient, Λ ≤ S + 5.5·10⁻⁵ (§33 of the assessment); otherwise sharper A constants are needed; my scan (§31, corrected): the EVEN sectors are pure cost at the amplitudes tested and the hill-climb never leaves the core, but the B sector has first-order content (Λ increases for a small B shell of the right phase), so B must be handled by cost + content like A; the B-only core q + B closes conditionally on the kernel comparison (Λ ≤ S + 1.15·10⁻⁵); even sectors have no first-order coupling to q but no theorem covers them with q ≠ 0 | scan done (`e11_ksector.py`, 12:30): supports it for the even sectors; NOT for B at small amplitude (first-order content), see §31 correction |
| L6 row uniformity and consumption | K_η on the row ENVELOPE (t ∈ [0.84, 0.851], profile uniformity, the v* = 0 corner), then the Lean theorem lower_of_K with the scalar integrals as native facts | not started (digest §2: "additional obligations"); Lean side planned "at the end" | project |

**Where the proof really stands.** L1–L3 are done. L4 is three certificates away for the one-driver family and then
needs the mixed shells, for which no analytic tool beyond R25 exists yet; the numerics say the ratios there are small
(≤ 0.084), so a coarse envelope should do, but someone has to write it. L5 is the layer the monograph had been
glossing over: even with L4 complete, K for a general adversary with B, Z-shells and d present together with q and A
is not a theorem. The manuscript's first-order margins (every sector costs at first order: 0.47–0.93 per unit mass for
B, Y/W, νH) and the frequency rule (no coherent first-order coupling between q and the non-A sectors) make L5
plausible, and the natural statements are: the even sectors are pure cost (adding ZQ, Z̄P or dZ(T−2) to q + A lowers Λ), and the B sector obeys a cost/content pair like A (its first-order content is ≈ C_A/2, so a small B shell can raise Λ: no monotonicity there). If
my scan confirms it numerically with margin, L5 reduces to (i) a B-sector zero-buffer cost κ_B (same method as the
certified κ = 0.24 for A, expected much larger since d_B ≈ 0.93) with a B-content lemma (B content is smaller than A
content, measured first-order margin 0.294), and (ii) a Jensen/tangent argument for the even sectors in the presence of
q (the step where Theorem A loses its q = 0 hypothesis: the tangent weight (1−t) against a remote part). L6 is
engineering (weeks), but it is what makes K useful: the Lean theorem consuming K_η as a hypothesis should be written
before K is finished, so that the day the last certificate lands the bound lands with it.

**State of layer L5 on 6 Nov 13:40 (what moved today).**
- B-shell cost: certified at every amplitude for arbitrary remote q and r (κ_B = 0.26 / 0.29 / 0.30 at the three rows;
  local 0.35 for E|r_B|² ≤ 0.0113).
- B-shell content: certified for the whole Gaussian-factor class (C_B² ≤ 0.1195·Δ; replayed green by the user); in general the B kernel is half the A
  kernel (g_B/g ∈ [0.505, 0.56], monotone), giving the vector comparison ‖c_B − 0.5053·c_A‖ ≤ 0.007√u once two scalar
  kernel bounds are certified. Hence the B-only core q + B is closed on every class with a certified A content.
- Joint A + B (UPDATE 6 Nov, §44–§45): the near-exact mixed-coefficient route is FRAGILE and abandoned (an audit certified
  that a 0.07 diagonal loss breaks the 5.5·10⁻⁵ conclusion and that the B-cost does not apply at z-dependent bases); the
  robust path is to sharpen the A-content constants to ≤ 0.10–0.15 (task S1, `ai-notes/prompt-A-content-sharpening.txt`),
  which closes the A+B core with the certified diagonal costs and no statement about the mixed term.
- (History) Joint A + B: the mixed cost term is nonzero and has the POSITIVE sign at q = 0 (certified 16:10, replayed green by the user: Q₀ ≥ 0.24‖r_A‖² +
  0.26‖r_B‖² + 0.236Re⟨r_A, r_B⟩ + 0.07(‖r_A‖² + ‖r_B‖²), m = 0.118 / 0.116 / 0.112 at the rows). The infinitesimal kernel bound at a general q has an exact pointwise 2×2 reduction (16:50), made singularity-free by
  the push-forward coordinates y = L(z) (17:10) and certified on a first shift interval 0.099 ≤ |q(w)| ≤ 0.101; my evaluation (§41) shows the margin is smallest at
  x = 0 and grows with the shift, and the ALL-SHIFT infinitesimal bound is now CERTIFIED for every remote base (18:10, replayed green:
  −½Λ″ ≥ 0.241‖r_A‖² + 0.261‖r_B‖² + 0.236Re E[r_A r̄_B], any dimension and sharing, no energy cap on q). Finite amplitude:
  the pointwise Hessian at intermediate bases fails the signed target for typical B amplitudes (|β| ≥ 0.1), so the
  finite-amplitude form must be segment-weighted and Gaussian-averaged, or taken through the B-content Lipschitz bound. If it keeps that sign
  uniformly in q, the alignment of the two contents makes the Schur complement tiny and the existing A constant 0.24
  gives Λ(q + A + B) ≤ S + 5.5·10⁻⁵ on the certified classes; if the sign is not controlled, the A constants must be
  sharpened to ≤ 0.19 (with the averaged κ_B ≈ 0.94) or ≤ 0.11 (with κ_B = 0.26). Target: certify the signed joint form.
- z-odd sectors (zQ, z̄P, dz(T−2)): by the parity identity Λ(H + O) = Λ(H − O) they have NO first-order term and NO mixed
  Hessian with the (q, A, B) block at any even base (14:10; my earlier "O(u) content" was wrong: it forgot the second norm
  term). What remains is the pure-cost bound Λ(H + O) ≤ Λ(H) − κ_E‖O‖², sufficient: E[|O|²/|L+H|] ≤ (1/ε − κ_E)‖O‖² as a
  restricted quadratic form uniform in H (same type as the certified B-cost); numerically κ_E ≥ 0.27 at amplitude 0.0113.
  The inverse-norm sufficient condition (6) is RULED OUT at nonzero cores by a certified example (15:00: E[|O|²/|L+H|] >
  2.714 > 2.644 = ‖O‖²/ε at u = 0.0462, w_A = w_B = 0.0112), while the true curvature there stays positive: my scan (§36) gives a true cost of 0.79–1.32 per unit
  energy on every core tested against a form eigenvalue up to 1.49, so the E certificate must keep the directional
  curvature. That route WORKS at finite amplitude (15:40): with the global majorant |X+Y| + |X−Y| − 2|X| ≤ 2(√(M − Re(XȲ)²/M)
  − |X|), M = |X|² + |Y|² (no Taylor remainder), the pure cost is certified at the very core that defeated (6): Λ(H + τO) ≤
  Λ(H) − 0.063‖τO‖² for 0.03 ≤ |τ| ≤ 0.04 (0.174 at |τ| = 0.04). Remaining: make it uniform over the core and the sectors (subproblem E2, `ai-notes/subproblem-E2-uniform-odd-cost.txt`:
  nonincrease suffices since there is no first-order term; sufficient pointwise-in-w inequality (E2′) in 12 real parameters).
  Over the ZERO core the pure cost is certified at every amplitude (14:30; replayed green by the user): k₁ = 0.128/0.156/0.166 for the Q and P sectors,
  k₃ = 0.33/0.36/0.36 for the d sector; the nonzero-core form is the open part.
  Caution kept: the B sector DOES have first-order content (it is z-even, like q and A), so it is not pure cost.

**Plan (in order; what I do myself vs the threads).**
1. (me, DONE 12:30, positive) Numerical test of L5: Λ for general G with all sectors, QMC in the remote variables, 10⁻⁵ accuracy;
   worst core adversary plus each sector; hill-climb over all 18 shell coefficients; random mixtures. Outcome decides
   whether L5 can be a monotonicity theorem.
2. (threads) The two R26 certificates: (★) on Wick share ∈ [1/16, 4/5] (Arb, compact domain), the directional envelope
   below 1/16 with s uniform per rectangle (duality lemma).
3. (threads, then me) Mixed one-driver shells: an envelope on R25's exact cross terms; the numerics say the content of
   the pure mixed shells is negligible and the cross terms lower the ratio, so a crude bound (Cauchy–Schwarz on each
   cross term against the deficit) may suffice.
4. (me) If step 1 is positive: formulate L5 as two lemmas (B-sector cost + content; even-sector Jensen with q ≠ 0),
   write the exact one-variable reductions (the digest's ch29 form R_T = q + (T−1)r_A + (T/√2)r_B + √T(Y+W)) and hand
   the scalar certificates to the Arb pipeline.
4b. (threads) NEXT SUBPROBLEMS: E2, the uniform odd-sector cost via the directional majorant
   (`ai-notes/subproblem-E2-uniform-odd-cost.txt`), and J2/J3, the finite-amplitude signed A/B cost (infinitesimal part certified 18:10; the finite-amplitude task
   with its two admissible routes is `ai-notes/prompt-J3-finite-amplitude.txt`, 18:20); the earlier
   statement `ai-notes/subproblem-even-sectors-and-joint.txt` is kept for the record.
5. (project) L6: the conditional Lean theorem K_η ⇒ 1.402 (statement of K_η on the three rows as a hypothesis, the fibre
   potential by interval integration, the envelope over t), started now in parallel so it is ready when 2–4 close.

## 5. How K is consumed (if proved)
The certificate becomes: rows (ℓ, β) only; Φ₀(s) = E_z[|L+s| + |L−s|] by one-dimensional interval integration
(a complete elliptic integral in s); the residual layer by the existing moment rectangles; the envelope over t.
With K_η, η ≤ 10⁻⁴: B ≤ 0.713267 ⇒ 1.402. The realistic cap under K (`ka.py`, moment LP): 0.713160 at ε = 0.7564
(1.40221). Lean plan: a theorem `lower_of_K : (∀ rows, KHyp ε ℓ β) → 1.4022 < K_G^ℂ` with `KHyp` the explicit
inequality Λ(G) ≤ S + η quantified over G ∈ H₂,₁ (as a Prop over the measure space), its data the three rows, and the
scalar integrations as native facts. Nothing of this is built yet.

## 6. Literature pointers

- Peccati, "Quantitative CLTs on a Gaussian space: a survey of recent developments", ESAIM Proc. Surveys 44 (2014)
  61–78 (user, 5 Nov; `ESAIM_survey.pdf`): Stein–Malliavin bounds (d_TV ≤ 2E|1 − ⟨DF,−DL⁻¹F⟩|,
  fourth-moment bound √((q−1)/(3q)(EF⁴−3)) in chaos q, optimal rate max{|EF³|, EF⁴−3}), second-order Poincaré,
  Carbery–Wright small-ball bounds, entropic CLTs, the Stein-factor density formula. Background only: these are two-sided,
  first-order distances (for a cubic chaos |D(q)| ≤ √(2δ/(9u)) ≈ 0.66 at u = 0.0463 vs the true D = 0.012), while the
  content lemma needs the one-signed second-order deficit from below. Possibly useful later: Carbery–Wright for a
  rigorous small-ball control of {|q|² < 0.002} in a finite-amplitude certificate; the Stein-factor density of the
  quadratic coefficient P (already explicit for us).
- Heilman–Jones–Malavolta (HJM), the cubic witness, gates and the row identity (`docs/`, manuscript ch2).
- Janson, Gaussian Hilbert Spaces (chaos, Wick products, hypercontractivity; Cor. 15.101 for the third-chaos identity).
- Nourdin–Peccati, Normal approximations with Malliavin calculus (Stein kernels, fourth-moment theorems, product formula,
  κ₄ as a sum of squared contractions).
- Nourdin–Peccati–Poly–Simone, arXiv:1407.6216, "Classical and free Fourth Moment Theorems: universality and
  thresholds": fourth-moment theorem for homogeneous sums under minimal assumptions (E X⁴ ≥ 3). Relevant to the
  near-Gaussian regime of K-a (our (ii): true when E|G|⁴/‖G‖⁴ − 2 ≤ 0.05) and to why the diffuse limit is the
  benchmark; it does not give finite-amplitude content control, which is what the open lemma needs.
- Schilling–Song–Vondraček, Bernstein functions (the scale-mixture representation of L).
- DLMF §10.25–10.32 (Bessel identities used for the kernel bounds).

## 7. Files and verifiers (all paths relative to the bundle root, i.e. the folder `research-degree5/`; nothing refers to a machine)

**Documents.** `CONJECTURE_K_MONOGRAPH.md` (this file), `ASSESSMENT_2026-11-04.md` (the chronological record, §10–§14:
every AI claim with its verification), `MANUSCRIPT_DIGEST_K.md` (digest of the October manuscript: PVD/BNC/SEI, the
shared-A audit rectangle, the content inequality L3).

**Certificates from the AI threads, all replayed green by the user (5 Nov) unless noted.**
| file | what it certifies |
|---|---|
| `ai-notes/chatgpt-thread2-gaussian_domination_note.tex` | Theorem B (conditionally Gaussian shells), the single-scale counterexample, H₃ |
| `ai-notes/chatgpt-thread1-remote-cubic-comparison.tex` | disjoint theorem (i): F(H+(T−1)U) ≤ F(H+√bW), P(p) ≤ ½+7p²/60 |
| `ai-notes/chatgpt-thread2-remote_cubic_and_linear_shell.tex` + `chatgpt-thread2-verify_core.mjs` | disjoint theorem (ii): Λ(q+(T−1)U) ≤ Λ(q) − (1/ε − 199/(200ℓ))u; quartic expansion |
| `ai-notes/chatgpt-shared_driver_rectangle.tex` + `chatgpt-verify_shared.mjs` | the two templates on R with the 0.19 cost; thm:shared-a-audit |
| `ai-notes/chatgpt-thread1-verify-content.mjs` | content constants 0.138/0.135 for the templates, three modes |
| `ai-notes/chatgpt-thread2-verify_content_extension.mjs` | A-cost κ = 0.24 for w ≤ 0.0113; tensor bound 0.481; the zero-tensor q₀ |
| `ai-notes/chatgpt-fresh-verify_nonlinear_content.mjs` | nonlinear content ≤ 50κ^{3/2}; deficit kernels; all cubics with u ≤ 0.00038 |
| `ai-notes/chatgpt-fresh-verify_gaussian_factor_content.mjs` | 2𝓐′(0)²/Q(0) < 56/5 (Gaussian-factor class, ρ ≤ 3/140) |
| `ai-notes/chatgpt-r23_r25_certificate.zip` → `ai-notes/r23_r25_certificate/` (proof.md, kernel_proof.md, verify_moments.mjs, check_shells.mjs, envelopes.json, generate.py, verify.py, kernels, results) | R23: XP(Y) with any complex A, constant 0.239 on R, three rows; R24 remote domination; R25 bookkeeping (replayed green by the user 5 Nov: `node verify_moments.mjs && node check_shells.mjs && python3 verify.py peak|flank|upper`) |
| `ai-notes/chatgpt-gaussian_factor_content_certificate.zip` → `ai-notes/gaussian_factor_content/vector_content/` (proof.md, kernel_proof.md, envelopes.json, verify.py, generate_*.py, kernels, results) | whole Gaussian-factor class, any drivers/coefficients, 0.239 on R, three rows (replay: `python3 verify.py peak|flank|upper`, python-flint) |
| `ai-notes/chatgpt-conjectureK_progress_2026-11-05.zip` → `ai-notes/progress_2026-11-05/conjectureK_audit/` (proof.md, verify.py, verify_factor.py, verify_algebra.mjs, kernels, envelopes, results) | rigorous refutation of exact E (saddle at the monomial) + second packaging of the Gaussian-factor theorem, both replayed green by the user 5 Nov (replay: `node verify_algebra.mjs && python3 verify.py && python3 verify_factor.py peak|flank|upper`) |
| `ai-notes/chatgpt-conjectureK_gaussian_factor_extension_20261105.zip` → `ai-notes/gaussian_factor_extension/gaussian_factor_certificate/` | third packaging of the Gaussian-factor theorem: 3,171,979 boxes, 381 kernel nodes rechecked at 128 bits (replay: `node verify_vector_moments.mjs && python3 check_kernels.py && python3 verify.py peak|flank|upper`) |
| `ai-notes/chatgpt-wick_endpoint_extension.zip` → `ai-notes/wick_endpoint_extension/wick_extension/` (proof.md, verify_wick.mjs, check_constants.py, kernels, logs) | self-interaction family with p ≤ u/16, constant 49/211 on u ∈ [0.03, 0.0463], three rows (replay: `node verify_wick.mjs && python3 check_constants.py`) |
| `ai-notes/chatgpt-r26_fresh_reductions.zip` → `ai-notes/r26_fresh_reductions/direct_wick_support/` (research_note.md, explore.py, exploration data) | R26 directional size-biased Cauchy–Schwarz (proved reduction), third-moment caveat, aligned-shell support inequality with its tail proved; no certificate |
| `ai-notes/chatgpt-integrated_wick_envelope_20261105.zip` → `ai-notes/integrated_wick_envelope/wick_work/` (README.md, exact_tail.mjs, validate.py, scalar tables, results) | envelope (★): 0.22 on the middle mixing region for any centred P; tail proved (`node wick_work/exact_tail.mjs`), compact region numerical (`WICK_ROW=peak python3 wick_work/validate.py`) |
| `ai-notes/chatgpt-r26_envelope_audit.zip` → `ai-notes/r26_envelope_audit/mixed_envelope/` (REPORT.md, verify_k.py, verify_barrier.py, searches) | certified 𝓚(0.0463) = 0.16678; certified obstruction to radial envelopes at the pure-P end (both replayed green by the user 5 Nov); directional envelope candidates (replay: `python3 verify_k.py && python3 verify_barrier.py`) |
| `ai-notes/chatgpt-wick_r26_twenty_percent_20261105.zip` → `ai-notes/wick_r26_twenty_percent/wick_research/` (proof.md, verify_template.mjs, verify_deficit.py, check_kernels.py, integrate_first.md) | self-interaction family with p ≤ u/5, constant 9/40 on the full energy interval, three rows (replay: `node verify_template.mjs && python3 verify_deficit.py && python3 check_kernels.py`) |
| `ai-notes/chatgpt-r26_self_interaction_certificate_2026-11-05.zip` → `ai-notes/r26_self_interaction/r26_certificate/` (proof.md, replay.py, certify.py, kernels, witnesses) | R26 for real c + Hermitian A, every share, u ∈ [0.03, 0.0463], constant 0.23 (replay: `python3 replay.py --quick`; full: `python3 replay.py`) |
| `ai-notes/chatgpt-wick_endpoint_one_twelfth_20261105.zip` → `ai-notes/wick_endpoint_one_twelfth/wick_cert/` | Wick neighbourhood p ≤ u/12 (superseded by 9/40); Abel-integral kernel enclosures and corner boxes for (★) (replay: `python3 wick_cert/check_constants.py`, `generate_table.py <row>`) |
| `ai-notes/chatgpt-r26_twenty_percent_extension_20261105.zip` → `ai-notes/r26_twenty_percent_extension/r26_extension/` | independent second proof of p ≤ u/5 (47/200, u ≥ 0.03), replayed green (`node verify_endpoint.mjs && python3 check_constants.py`) |
| `ai-notes/chatgpt-r26_reweighted_certificate_20261105.zip` → `ai-notes/r26_reweighted/r26_reweighted_certificate/` | R23 improved to 0.22 (reweighted Cauchy–Schwarz, any complex A); strip candidate (†) with tail and f = 0 neighbourhood proved (replay: `python3 check_kernels.py && python3 verify_pure.py <row> [--bridge] && node verify_tail.mjs`) |
| `ai-notes/chatgpt-b_shell_global_cost_certificate.zip` → `ai-notes/b_shell_global_cost/` | B-shell cost at every amplitude, arbitrary q and r: κ_B = 0.26 / 0.29 / 0.30 (Node checker) |
| `ai-notes/chatgpt-b_sector_content_and_cost_20261105.zip` → `ai-notes/b_sector_content_and_cost/b_sector/` | B-content 239/2000 for the Gaussian-factor class; local B-cost 7/20; mixed A/B Hessian at q = 0 certified nonzero (replayed green by the user 6 Nov: `bash replay.sh`) |
| `ai-notes/chatgpt-odd_sector_certificate.zip` → `ai-notes/odd_sector_certificate/` | odd sectors over the zero core: certified pure cost k₁, k₃ at every amplitude (replayed green by the user 6 Nov: `python3 verify.py`) |
| `ai-notes/chatgpt-odd_sector_inverse_norm_obstruction.zip` → `ai-notes/odd_sector_inverse_norm_obstruction/` | certified failure of the inverse-norm condition (6) at a nonzero core (python-flint `certify.py 384`) |
| `ai-notes/chatgpt-directional_odd_cost_certificate.zip` → `ai-notes/directional_odd_cost/` | directional odd-sector cost at a nonzero core (global directional majorant; replayed green by the user 6 Nov) |
| `ai-notes/chatgpt-signed_joint_ab_hessian_certificate.zip` → `ai-notes/signed_joint_ab_hessian/` | signed A/B Hessian at q = 0 with positive mixed term and 0.07 margin (replayed green by the user 6 Nov) |
| `ai-notes/chatgpt-joint_ab_uniform_reduction.zip` → `ai-notes/joint_ab_uniform_reduction/` | exact pointwise 2×2 kernel reduction of the infinitesimal A/B Hessian at a general q (derivation + exploratory scripts; no certificate) |
| `ai-notes/chatgpt-smooth_joint_kernel_certificate.zip` → `ai-notes/smooth_joint_kernel/` | singularity-free coordinates for the A/B Hessian kernel; signed bound certified on the shift interval [0.099, 0.101] (replayed green by the user 6 Nov) |
| `ai-notes/chatgpt-all_shift_signed_ab_certificate.zip` → `ai-notes/all_shift_signed_ab/` | signed infinitesimal A/B bound for every remote base, three rows (474 interval checks + exact tail; replayed green by the user 6 Nov) |
| `ai-notes/chatgpt-all_shift_signed_ab_certificate_v2.zip` → `ai-notes/all_shift_signed_ab_v2/` | independent second certificate of the all-shift signed A/B bound (229 intervals + tail); regularity region 2\|α\| + √2\|β\| < 2√(ab) for the finite-amplitude path |
| `ai-notes/chatgpt-hermitian_content_certificate.zip` → `ai-notes/hermitian_content/` (proof.md, generate.py, verify.py, kernels) | Hermitian one-driver family, constant 0.236 on R at the three rows (Arb; replay needs python-flint: `python3 verify.py peak|flank|upper`) |

**My own checks (Python, `-I`, numpy/scipy).** `e11_scan_majorant.py` → `e11_scan_majorant_peak.log` (the joint-majorant
scan, §3.5), `e11_scan_opt.py` → `e11_scan_opt_peak.log` (the 12-shell hill-climb), `e11_check_complex_moment.py` and `e11_check_r23_moments.py` (the
complex-matrix sixth-moment identities and bounds, §14–§15 of the assessment), `e11_imag_perturbation.py` (Monte Carlo)
and `e11_second_variation.py` (deterministic quadrature) for the saddle at the Wick monomial, `e11_refined_target.py` (the
refined target along the monomial), `e11_check_vector_moment.py` (the vector moment inequality), `e11_check_wick_endpoint.py` (the Wick-neighbourhood
perturbation bounds), `e11_check_sizebias_reduction.py` (the radius-integrated deficit identity and the Cauchy–Schwarz target), `e11_check_envelope_star.py` + `.log` (independent grid check of (★)). Earlier scripts of 4–5 Nov in this folder: e4 (K
attack), e5/e5b (OU path), e6–e10 (law inequality), k5/ (degree 5), d1/ (order-2 note).

**Prompts and replies** (what was sent to the AI threads, in order): `ai-notes/conjectureK-olympiad.txt` (context-free
statement that started the fresh thread), `ai-notes/lemma-content-prompt.txt`, `ai-notes/reply-thread2-r4r6.txt`,
`reply-thread1-r5.txt`, `reply-gpt3-fourthmoment.txt`, `reply-thread2-r7r9.txt`, `reply-thread1-r10r12.txt`,
`reply-gpt3-refinement.txt`, `reply-thread2-r10r12.txt`, `reply-fresh-lemma.txt`, `reply-fresh-gaussian-factor.txt`,
`reply-hermitian-family.txt`, `prompt-fresh-selfinteraction.txt`, `prompt-hermitian-r26.txt` (R26: the self-interaction family; R27: the
extremality test, now answered: saddle), `reply-hermitian-scanfix.txt`, `reply-hermitian-E-saddle.txt`.
