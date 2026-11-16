<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/REVIEW_claude-b9ee.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Review of codex-91d4's A/B-sector package (task #426)

Reviewer: a review worker of claude-b9ee. 16 November 2026, 23:00 to 23:40, Bucharest time.

Reviewed: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/` (Phase 0 and
`route2/`, delivered by codex-91d4 on 15 November 2026; both manifests match the files on disk).
Ledger compared: `research/conjecture-K/STATUS.md` at the head of pull request #488 (5448b8a26; identical to the
worktree copy at 73eefb6d2). "Ledger" below means that file; "degree-5 ledger" means
`research/higher-degree/STATUS.md`.

Notation as in the ledger (section 0): peak row, a = 699/1250, b = 179/1250, p = 2500/1891, L = z₁(a + bT),
u = ‖q‖², δ = E|q|⁴ − 2u², χ = δ/u², D = B(u) − 2E|L + q|, D₊ = max(D, 0), c_{3/5}(q) the content at the tilt 3/5,
c_B(q) = Π₁,₀[F_B(q)] with F_B(w) = E_{z₁}[(z₁²/√2)·conj(ph(L + w))].

## 1. Verdicts

| | statement of the package | verdict |
|---|---|---|
| (A) | ‖c_{3/5}(q)‖² ≤ (7/25)·D₊(q) + 6·10⁻⁶ for every dimension and every remote cubic with u ≤ 463/10000 | **Confirmed.** No correction. It rests on the same inherited inputs as the ledger's 11.50 |
| (A′) | five content coefficients ‖c_{3/5}(q)‖² ≤ γδ, valid from the energies 1/125, 1/50, 1/40, 3/80, 21/500 up to 463/10000, with γ = 49/1000, 83/2000, 393/10000, 173/5000, 331/10000 | **Confirmed.** No correction |
| (B) | ‖c_B(q)‖² ≤ γ_B·δ with γ_B = 0.061, 0.056, 0.052, 0.049, 0.046 on the energy slabs [0.0005, 0.01], [0.01, 0.02], [0.02, 0.03], [0.03, 0.04], [0.04, 0.0463]; and ‖c_B(q)‖² ≤ (436959/3125000)·δ at every energy (Phase 0) | **Confirmed.** No correction. A bound by δ only: nothing about the deficit follows, as the author says |
| (J) | Rem ≤ (p − 0.59)\|α\|² + (p − 0.23)\|β\|² at the tilt (3/5, 0), on the four regions \|w\| ≥ 7/2; R ≥ 5; R ≤ 1/32000; \|β\| ≤ \|α\|/21 or \|α\| ≤ \|β\|/56 (R² = \|α\|² + \|β\|²) | **Confirmed on the four regions**, as stated. The inequality on the rest, and every use of it, are open (the author says so) |
| | zero-core cost matrix at the tilt (3/5, 0), least eigenvalue in (0.247721, 0.247722); zero-amplitude cost at least 47/200 for \|w\| ≤ 7/2; third-derivative bound 480 for R ≤ 1/100 | **Confirmed** |
| | corollary κ = 52948/59009 in the tilted A-sector lemma, same η | **Confirmed** (exact arithmetic) |
| | the three target premises (A-content 0.15, B-content 0.06·D₊ + 4·10⁻⁶, (J) everywhere) and the bound S + 25207/575000000 | **Not established**, and not claimed; the conditional arithmetic is correct |

The package states nothing that I found wrong. Three numbers of the *ledger* change or need a note because of it
(sections 8 and 9): the κ of 11.51, the sampled value 0.252 of 11.45, and the note "largest Rem/S_r found is 0.774"
of 7.4.10.

In five lines:

1. (A), with its five new coefficients: confirmed; I replayed the verifier and re-evaluated all 196 rectangles with my own exact code.
2. (B), and the Phase-0 bound 0.14δ: confirmed; representation, tails and comparison re-derived, scalar profiles recomputed with my own code.
3. (J): the four regions confirmed (proofs re-derived, checkers replayed, the decisive scalars recomputed); the open region and the use of (J) remain open.
4. The package changes one constant the ledger states (κ of 11.51: 56730/59009 becomes 52948/59009) and no conclusion; two N values of the ledger need correcting (11.45, 7.4.10).
5. Route 2 does not close with these results: 7/25 > 23/100; it needs content coefficients with sum below 23/100 and (J) everywhere, all open.

## 2. What was done

**Read.** Both reports, `BUDGET_AUDIT.md`, `CONTENT_STRUCTURE.md`, `GEOMETRY.md`, the two numerics notes,
`route2/DIAGNOSTICS.md`, the four proof notes of `route2/`, the four internal reviews, and every script on the
acceptance path: `verify.py` (both), `content_structure_exact.py`, `verify_a.py`, `certify_barrier.py`,
`angular_route2.cpp`, `moment_cover.py`, `deficit_cover.py`, `b_barrier_verify.py`, `base_hessian.cpp`,
`derivative_exact.py`, `exterior_exact.py`, and the inherited helpers they import. The 17 bundled helpers are the
reviewed files of `research/conjecture-K/code/tilted-sector-2026-11-15/` and
`code/audit-2026-11-15-codex-a7c4/`: 14 are byte-identical, three differ in one path line (I diffed them);
`inputs/odd_cost_check.py` and `route2/secant/inputs/theta_verify.cpp` are byte-identical to the repository's. `angular_route2.cpp` differs from the reviewed
`deficit_angular_verify.cpp` in seven places (the permitted cap 3/4 in place of 13/20, the include path, the tail
ceilings compared with the goal directly, three guards and a comment); I read the whole file. The five inherited proof notes that the
A proof cites have the hashes recorded in `INPUTS_PROVENANCE.json`.

**Re-derived by hand** (details in sections 4 to 6): the barrier operator in the Bernstein basis and the source
majorant; the half-line comparison; the one-switch angular reduction and its tail R ≥ 2; the cover logic of (A) (chord
of B, cap moments, convexity in χ, the energy interpolation loss 3α(2 + χ)(Δu)²/8, exempt boxes, D₊ against D); the
constants κ and η; for (B) the pushforward density, the scalar representation (1), the source (2), its second
derivative (4), the derivative recursion (3), the tail bounds (10)–(11), the comparison with the constant lower barrier
−3/5, the atom bound N/λ ≤ 4/3 and the identities M₀ = J₁/(2√2), M₁ = 3I₃/(8√2); for (J) all of `EXTERIOR_PROOF.md`,
and in `SMALL_AMPLITUDE_PROOF.md` the two Hessian blocks with their factor 4/π, the root derivatives (5), the tail
(6), the bounds (7)–(10), the tail polynomial (12) and the factor 1/3 of section 3.

**Replayed.** The author's full verifier, `route2/verify.py`, on the droplet yo (Ubuntu, Python 3.12.3,
python-flint 0.9.0), in a copy of the package: PASS in 228 s (Phase 0 scalars 0.2 s, A 173 s, B 45 s, zero-amplitude
Hessian 1.5 s, third derivative 4.6 s, exterior 0.9 s). yo has no clang++; the two C++ checkers were compiled with
g++ 13.3.0 and the delivery's flags (`-O2 -std=c++17 -frounding-math -ffp-contract=off -fno-fast-math`), through a
shim named clang++ in my folder, so that the wrapper ran unchanged. Every
regenerated result is identical to the delivered one up to the timing fields: the two cover results (196 rectangles
with their margins), the B certificate, the five accepted barrier tables (byte-identical), the five angular bounds
(to the 17 printed digits), the Hessian cover (52 slabs, 103 visits, depth 8), the third-derivative expression
478.485358503421513898, the exterior expression 0.979416176924082886. So the certificates do not depend on the
author's platform (arm64 macOS, clang++) or on mine (x86-64 Linux, g++).

**Own code** (floating point unless marked exact; in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15-review/`):

- `own_scalar.py` (N): my own formulas and quadrature for the A source m″ and the B source m_B″, checked against the
  definitions by a two-dimensional quadrature in z₁; the resolvent profiles k_u from the integral formula; the barrier
  inequalities at five points per cell; the angular suprema, both the true one and the one over all functions below
  the barrier.
- `own_cover.py` (**exact rational arithmetic** for every budget; the benchmark B(u) in double precision by my own
  formula, with 10⁻¹¹ subtracted): all 196 rectangles of (A), the exempt boxes, the content coefficients used, and
  the union by a different algorithm.
- `own_misc.py` (N): two necessary conditions on each of the 119 duals; the zero-core cost matrices (mpmath, 30
  digits); the matched-tilt witness; the Wick monomial end to end.
- `own_secant.py` (N): the zero-amplitude Hessian blocks on 0 ≤ w ≤ 7/2; the scalars of the exterior proof; 1,200
  random points of the region that (J) leaves open.
- `own_small.py`: exact constants (κ, the threshold, the variants of 7.1.7, the fixed-bank diagnostic), M₀ and M₁, and
  one local search.

Nothing was run on the laptop except file comparisons and the two hash checks of the package (`verify.py` of Phase 0,
which also runs its 0.03-second scalar check, and `route2/verify.py --hash-only`), both after the review file was
added: the manifests still pass.

## 3. Triage against the ledger

N = new; = means the ledger already has it; S = superseded inside the package.

| # | statement of the package | relation to the ledger |
|---|---|---|
| 1 | (A): 7/25 in the content-against-deficit bound | **N.** Stronger than 11.50 (3/10): same domain, same allowance, same quantifiers. On the 187 rectangles of 11.55 (1/5, 68.9 % of the area, "C, author only") 11.55 is the stronger one; neither contains the other |
| 2 | (A′): five coefficients | **N.** They interleave with the ten of 11.41/11.49: smaller on [0.008, 0.012), [0.02, 0.03), [0.0375, 0.04) and [0.042, 0.044), and they start at 0.008 instead of 0.009. Each is above the ledger's N value of the true coefficient, as it must be |
| 3 | κ = 52948/59009 | arithmetic from (A) and 11.40; replaces the κ of 11.51, changes no conclusion (section 9) |
| 4 | Phase 0: ‖c_B‖² ≤ (436959/3125000)δ at every energy | **N.** The ledger has no bound of the raw B-content by δ: 7.1.4 and 7.1.6 are alignment bounds whose error is of order √u and does not vanish with δ; 7.1.5 (open) concerns the deficit; 11.29 and 6.3.25 are general profile bounds without a certified constant for the B profile. S by statement 5 on [0.0005, 0.0463]; it remains the only bound below 0.0005 and above 0.0463 |
| 5 | (B): five slab coefficients | **N** |
| 6 | (J): four regions of the joint secant at the tilt (3/5, 0) | **N**, and not comparable with 7.4.10–7.4.14 (below) |
| 7 | zero-core cost matrix at the tilt (3/5, 0) | K_AA is k(3/5) of 11.13 and K_BB is k_B of 7.3.1 (=); the cross entry (J₂ − (2/5)J₁)/(2√2) = 0.371205677 and the least eigenvalue 0.247721504 are **N**. It corrects 11.45, whose sampled value at this tilt is 0.252 |
| 8 | B-axis bound Rem_B ≤ (53/50)\|β\|² | = 7.1.1 (κ_B = 13/50 at the peak, by the same density and potential argument; 53/50 corresponds to the cost p − 53/50 = 0.26205) |
| 9 | fixed-bank diagnostic: at (u, χ) = (0.0463, 3) and (0.0275, 12.29) the 119 saved duals with the content envelope need a coefficient above 0.2402 and 0.2747 | **N**, of the kind of item 83 (a limit of a bank of upper bounds). With the coefficient 393/10000 of (A′) the second number becomes 0.2505 (my arithmetic); the first is unchanged |
| 10 | conditional budget of route 2 | the algebra is 7.4.1 with the D₊ variant of 11.23 (=); the target triple (cost 23/100, contents 3/20 and 3/50) and its value S + 25207/575000000 are **N** as a conditional statement, with three open premises against the one of 7.4.10 |
| 11 | "B can be tilted": ξ = −s·r_A − t·r_B, contents c_A + s·c₀ and c_B + t·c₀, penalty pI − vvᵀ | = 11.12, 7.1.7, 7.4.10 (KPROG `JOINT_CONTENT.md` §4) |
| 12 | N: at the matched tilt (0.6, 0.30318) the pointwise cost is 0.0958 at a finite-amplitude point | **N** for the ledger: there Rem/S_r = 0.7783, above the "0.774, at the zero core" of 7.4.10's N note. Consistent with (P) (section 7) |
| 13 | N: 33 finite cubics, largest ‖c_B‖²/D = 0.0216 and ‖c_{3/5}‖²/D = 0.0127, largest ‖c_B‖²/δ about 0.0049 | **N** evidence for 7.1.5 |
| 14 | `GEOMETRY.md` §3: for \|α\|² + \|β\|² < 2ab the projected cubic is strictly increasing, with a nonsingular Hessian formula | a tool, used in (J); the ledger's analogue for the A-sector alone is in TILT `theta_proof.md` |
| 15 | `route2/DIAGNOSTICS.md`: sampled true coefficients 0.0379 (u = 0.0275) and 0.0314 (0.0463) for A, 0.0382 for B at 0.0463; richer duals; coupled linear programmes | N only. The two coefficients at 0.0463 agree with mine (0.03142, 0.03821), and mine interpolate to 0.0379 at 0.0275; the rest not replayed |

**(J) against (P) of 7.4.10.** Put F(w, α, β) = E_{z₁}|L + w + (T − 1)α + z₁²·conj(β)/√2|, a convex function of three
complex variables. Both remainders are second-order Taylor remainders of F at the points (w, 0, 0):

    Rem_J(w; α, β)  along the direction ((3/5)α, α, β),                          trial ξ = −(3/5)r_A,
    Rem_P(w; A, B)  along the direction ((3/5)(A + 0.5053·B), A, B),            trial ξ₀ = −(3/5)(r_A + 0.5053·r_B),

and the raw r_x(α, β) of 7.4 is the remainder along (0, α, β). So they are the same kind of object but not the same
function: the two planes of directions meet only in the A-axis β = B = 0, where both equal Rem(w, ρ) of 11.39. The
right sides differ too:

    (J):  Rem_J ≤ (p − 9/25 − 23/100)|α|² + (p − 23/100)|β|²                        a pure quadratic;
    (P):  Rem_P ≤ (p − 463/5000)S_r − (67/100)|R|² − (2/25)|U|² + (|w|²/2 + S_r)S_r   quadratic plus a quartic allowance.

Against their penalties (diag(p − 9/25, p) for (J), pS_r − (9/25)|R|² for (P)) the cost forms are 0.23·(|α|² + |β|²)
and 0.0926·S_r + 0.31|R|² + 0.08|U|² − (|w|²/2 + S_r)S_r.

- No region of (J) implies or is implied by a region of 7.4.11–7.4.14 off the A-axis.
- On the A-axis, (J) reads Rem(w, ρ) ≤ 0.7321|ρ|² and follows from 11.39 (13/20); (P) reads
  Rem(w, A) ≤ 0.5390|A|² + (|w|²/2 + |A|²)|A|², which 11.39 does not give.
- A transfer by convexity exists: for 0 < λ < 1,
  Rem_P(w; A, B) ≤ λ·Rem_J(w; A/λ, B/λ) + j₀·(0.30318)²|B|²/(1 − λ), by 11.2. It loses the factor 1/λ on a right side
  that is already twice the quadratic part of (P) along U = 0 (0.805 against 0.388 per unit S_r), so it gives nothing
  in the open interior of (P).
- Why the two targets differ in kind: at the tilt (3/5, 0) the smallest pointwise cost found is the zero-core value
  0.2477 (N; section 6), so a pure quadratic bound is plausible; at the matched tilt the pointwise cost falls to
  0.0958 at finite amplitude (statement 12), far below the zero-core eigenvalue 0.3899, so a pure quadratic bound with
  a useful constant is false there and (P) needs its quartic term, paid for by energy caps. In exchange the matched
  tilt aligns the two contents, and 7.4.10 closes with the proved coefficient 3/10; (J) uses the raw B-content and
  needs content coefficients with sum below 23/100.

## 4. (A): the content-against-deficit bound with 7/25

**Statement and prose agree.** The proof note's c_{(A,3/5)} = Π₁,₀E_{z₁}[(T − 2/5)ph(L + q)] is the ledger's
c_{3/5}(q): the two profiles differ by a constant multiple of q, which has no first-chaos part. D is the ledger's D
(F(q) = 2E|L + q| for a remote q). The bound is in D₊: on the 193 non-exempt rectangles the certificate proves the
form with the signed D, on the 3 exempt ones (all at u ≤ 2/125) it proves ‖c‖² ≤ 6·10⁻⁶, and no sign of D is assumed.
Every dimension; χ ≤ 42 is used (the cover ends at √χ = 13/2). Peak row only, tilt 3/5 only.

**The chain, and where each link comes from.**

1. ‖c_{3/5}‖² ≤ (2/3)δ·sup_R N_{Ψ_u}, and the reduction of the Hessian of Ψ_u to the scalar k_u with
   (5/3 − (u/2)∂² + x∂)k_u = m″: inherited (11.30, 11.49).
2. Five new absolute barriers |k_u(x)| ≤ W(|x|): new. `certify_barrier.py` is the reviewed `check_witness` for absolute barriers,
   with the endpoint values set exactly (W(0) = 0, W(1) = 9/25, W′(1) ≥ 0) before the checks and each tag bound to its
   energy interval. I re-derived the operator in the local power basis
   ((5/3 + j)c_j + (j + 1)(x_i/h)c_{j+1} − (u/2)(j + 2)(j + 1)c_{j+2}/h²), the majorant "linear interpolation of the
   source plus 1000h²/8" for both signs, the affine dependence on u, and the extension by 9/25 with
   (5/3)(9/25) = 3/5 ≥ |m″| on x ≥ 1.
3. From W to a coefficient: sup of the convex function N over the convex set of pairs (A, B) generated by |k| ≤ W is
   attained at exposed points, whose k is ±W with at most one sign change in θ, because λcos²θ + μsin²θ is monotone in
   θ. The checker runs over every switch cell and both branches of N; for R ≥ 2 it uses W ≤ 9/25 where cos θ ≥ 1/2. I
   checked the two tail integrals (2/3 − s + s³/3 and (1 − s³)/3, s = √3/2).
4. The cover. Low energies: on a slab [l, h], α·(chord of B through lower bounds of B(l), B(h)) + η − α·E cap(uU) − H_j
   is a polynomial in (u, √χ), where cap is a global Hermite cap of h(v) = 2E|L + √v| with positive cubic coefficient
   and the moments are EU = 1, EU² = 2 + χ, EU³ ≤ 6 + 9χ + C₆χ^{3/2}; nonnegative Bernstein coefficients on the box
   give ‖c‖² ≤ H_j ≤ αD + η there. Central energies: at each of the two energies of a slab one dual gives
   E h(uU) ≤ F_P(u, χ), affine in χ plus a nonnegative multiple of χ^{3/2}; every content branch is convex in χ, so the
   margin is concave in χ and its minimum on [χ_lo, χ_hi] is at an endpoint; in the energy, for a fixed normalised law
   U, Q(u) = α(B(u) − E h(uU)) + η − H(u, χ) has Q″ ≤ 3α(2 + χ) (B concave, h″ > −3, H convex in u), so
   Q ≥ min(Q(u_lo), Q(u_hi)) − 3α(2 + χ_hi)(Δu)²/8. With α = 7/25 the loss is (21/200)(2 + χ_hi)(Δu)². The dual bounds
   at the slab's two energies apply to the rescaled cubic, which has the same χ. All of this is the argument of 11.50
   with α changed; `moment_cover.py` and `deficit_cover.py` are new files that call the reviewed functions
   (`margin`, `bernstein2`, `fresh_cap`, `check_node_long`, `gaussian_B`), and I read both in full. The content
   coefficient of a slab is taken at its lower energy, where each coefficient used is valid.
5. κ = (7/25)/k = (7/25)(189100/59009) = 52948/59009 and η = (6·10⁻⁶)/k = 5673/295045000: exact.

**Own checks.**

Barriers and coefficients (N, `own_scalar.py`). My formulas for m′ and m″ reproduce E[(T − 2/5)ph(L + x)] computed
directly in z₁ (0.01300372 at x = 0.2, 0.23888606 at x = 0.9; agreement 10⁻⁸, the accuracy of the direct quadrature).
Source: min m″ = −0.465 on x ≥ 0 and max|m″| = 0.460 on x ≥ 1 (the proof uses > −1 and < 3/5); |m⁗| ≤ 77 on [0, 1] by
finite differences (certified enclosure 92.108, used constant 1000).

| barrier | valid on | sup\|k_u\| at the lower energy (own) | max W | min of L_uW − \|m″\| on [0, 1] (own) | true (2/3)sup N at the lower energy (own) | sup over all \|k\| ≤ W (own) | certified angular value (replay) | γ claimed |
|---|---|---|---|---|---|---|---|---|
| absolute8 | [1/125, 463/10000] | 0.70555 | 0.70588 | 5.15·10⁻⁴ | 0.047368 | 0.047416 | 0.047759056 | 49/1000 |
| absolute20 | [1/50, 463/10000] | 0.65743 | 0.65771 | 5.14·10⁻⁴ | 0.041121 | 0.041156 | 0.041449733 | 83/2000 |
| absolute25 | [1/40, 463/10000] | 0.63962 | 0.63991 | 5.13·10⁻⁴ | 0.038922 | 0.038955 | 0.039234493 | 393/10000 |
| absolute375 | [3/80, 463/10000] | 0.59974 | 0.60001 | 5.10·10⁻⁴ | 0.034207 | 0.034243 | 0.034486457 | 173/5000 |
| absolute42 | [21/500, 463/10000] | 0.58674 | 0.58702 | 5.10·10⁻⁴ | 0.032735 | 0.032775 | 0.033007074 | 331/10000 |

On the grid x = 0(0.005)6, at the lower, middle and upper energy of each barrier, W(x) − |k_u(x)| is nonnegative, with
its minimum at x = 0, where both vanish. In each row sup|k_u| ≤ max W, and true coefficient ≤ supremum under the
barrier ≤ certified value ≤ γ, as the proof requires; the claimed coefficients are 0.9 to 3.4 % above the true ones. The differential inequalities hold pointwise with 5.1·10⁻⁴ to spare; the
certificate spends 5·10⁻⁴ of it on the interpolation of the source and keeps 1.9·10⁻⁵. My values at u = 0.02 and
0.025 are the ledger's N values of 11.49 (0.0411, 0.0389); at u = 0.0463 the true coefficient is 0.031423 (the
author's sampled value: 0.0314331).

The cover (`own_cover.py`). For each of the 67 non-exempt low boxes I rebuilt the bicubic budget from the cap
coefficients of the result file and my own benchmark values and computed its 16 Bernstein coefficients exactly: all
nonnegative, smallest 4.17·10⁻⁸. For each of the 126 central boxes I recomputed the four corner values with the
listed duals and subtracted the interpolation loss: all positive, smallest 2.73·10⁻⁹ (the box
[9/500, 1/50] × [21, 105/4], branch (19321/10⁶)u). In both parts my margins differ from the stored ones by at most
2.8·10⁻¹², which is exactly 7/25 of the 10⁻¹¹ I subtract from B: so my benchmark (the Rice mean
√(πu)·E[e^{−x/2}((1 + x)I₀(x/2) + xI₁(x/2))], x = T(a + bT)²/u) agrees with the certificate's Arb integral to about
10⁻¹³ at all 46 energies. The 3 exempt boxes satisfy their inequality exactly. Every content coefficient used is one
of the fifteen certified ones and is valid at its slab's lower energy. Union: 196 rectangles, 45 energy strips, 1,530
elementary cells of the grid of all cuts, none outside a rectangle.

Inputs that I did not re-prove, tested numerically (`own_cover.py`, `own_misc.py`): the 53 Hermite caps are above my
own h (elliptic-integral formula) at 400 points of [0, 0.6] (smallest difference 1.6·10⁻¹², at the double zeros);
h″ ∈ [−1.67, −0.50] on [0.0005, 0.5]; B is concave on the grid of energies; each of the 119 duals satisfies the two
necessary conditions I tried, F_P(u, 0) ≥ B(u) (smallest excess 2.7·10⁻⁶; a Gaussian limit has deficit 0) and
F_P(u, 42) ≥ 2E|L + q| for the Wick monomial (smallest excess 1.0·10⁻³).

The statement on a cubic (N, `own_misc.py`): for the Wick monomial at u = 0.0463 I get D = 0.012063422,
‖c_{3/5}‖²/D = 0.01135741 and ‖c_B‖²/D = 0.02162714, the author's three values to all their digits, so the conventions
of D and of both contents are the stated ones; (7/25)D + 6·10⁻⁶ − ‖c_{3/5}‖² = 3.2·10⁻³ there. At u = 0.01 and 0.02 the
ratios are 0.01035 and 0.01171 for A, 0.01258 and 0.01681 for B; ‖c_B‖²/δ is 0.0041, 0.0039, 0.0029 at the three
energies. The profile slopes at 0 are g₀ + (3/5)j₀ = 0.0240483421607 and g_B(0) = −0.4220280971396.

**Remarks, none of them a correction.**

- The certificate is as thin as 11.50's: one box has margin 2.7·10⁻⁹. It rests on the interval arithmetic of Arb and
  on the inherited Python helpers; I reproduced the margins with independent arithmetic, not the dual acceptance.
- The method is near its end. With the 119 duals and the certified content coefficients, the node (0.0463, 3) alone
  forces a coefficient above 0.2402 (triage 9); the cover reaches 0.28. The true ratio is far smaller on every cubic
  tried (largest ‖c_{3/5}‖²/D: 0.0127, author; 0.040·0.3 = 0.012 on the family of 11.50).
- `negative_controls.py` was not run (it needs clang++ and a temporary directory outside my folder).

## 5. (B): the raw B-content against the fourth cumulant

**Statement and prose agree.** c_B is the first-order coefficient of the B shell at a remote base: the derivative of
2E|L + q + ε·z₁²conj(r)/√2| at ε = 0 is 2Re E[conj(r)F_B(q)], the convention of 7.1.1. The slab bounds hold for u in
the closed slab (each barrier is certified on its slab only, unlike the A barriers); every dimension; no assumption on
D, on χ or on sharing. The Phase-0 bound holds at every energy.

**Re-derived.**

- Pushforward: with s = t(a + bt)², ds/dt = (a + bt)(a + 3bt), so
  F_B(w) = (1/(π√2))∫y²·conj(ph(y + w))·f_B(|y|²)d²y with f_B = e^{−t}/((a + bt)³(a + 3bt)).
- (1): the phase identity ph(z) = ¼∫e^{iθ}sign(Re(e^{−iθ}z))dθ and the rotation y = e^{iθ}v give
  F_B(w) = ¼∫₀^{2π}e^{iθ}m_B(Re(e^{−iθ}w))dθ with m_B(x) = (1/(π√2))∫(v₁² − v₂²)f_B(|v|²)sign(v₁ + x)dv; the part
  2iv₁v₂ of v² is odd in v₂. m_B is odd, so F_B has the same form as the A profile and the reduction to k_u and the
  angular lemma (11/72) apply unchanged.
- (2): m_B′(x) = (4/(π√2))∫₀^∞(x² − y²)f_B(x² + y²)dy and, with ∫₀^∞y²f_B′ = −½∫₀^∞f_B,
  m_B″(x) = (8/(π√2))·x·∫₀^∞[(3/2)f_B + x²f_B′](x² + y²)dy. (4) follows by differentiating twice with
  ∂_x∫f^{(n)}(x² + y²)dy = 2x∫f^{(n+1)}. The recursion (3) for (−∂_s)ⁿf_B is correct.
- Tails (10)–(11): |integrand| ≤ C·e^{−t}√t[(3/2) + tH_t]/(A²J) from x ≤ √t·A and x²/(AJ) ≤ t; √t ≤ t/2 for t ≥ 4;
  monotonicity in t; dy = ℓ′(t)dt with ℓ′ ≤ (a + 3bt)/(2√T). For x ≥ ℓ(4) every y has t ≥ 4, which gives the bound
  0.595 on the ray x ≥ 3 > ℓ(4).
- Comparison: the upper barrier K needs L_uK ≥ m_B″ only (one sign), K(0) = 0, and the constant c beyond 1 needs
  (5/3)c ≥ 1 ≥ m_B″, hence the assertion c ≥ 3/5; the lower barrier is the constant −3/5, with
  L_u(−3/5) = −1 ≤ m_B″ on x ≥ 0. So −3/5 ≤ k_u ≤ c + 10⁻⁸ on x ≥ 0 and |k_u| ≤ c + 10⁻⁸ everywhere by oddness; the
  coefficient is (11/108)(c + 10⁻⁸)².
- Phase 0: for the atom V_λ(x) = x·e^{−λ|x|²}, A = λR·e^{−z}(4z − 6), B = −2λR·e^{−z} (z = λR²), so
  N/λ = z·e^{−2z}·max{6z² − 16z + 12, 4}, at most 1.278 < 4/3 (maximum near z = 0.28). For the positive mixture
  F_B = −∫V_λ ν_B(dλ) the triangle inequality for √N and Cauchy–Schwarz give sup N ≤ (4/3)M₀M₁, and the resolvent
  factor (3/5)² gives (8/25)M₀M₁. From (2): M₀ = −(π/4)m_B′(0) = J₁/(2√2) and M₁ = (π/32)m_B‴(0) = 3I₃/(8√2), as
  claimed. The positivity of ν_B is the inherited input (the kernel representation behind 7.1.6).

**Replay**: section 2. The B verifier reads only `b_barriers.json`; its five residual margins are 1.999·10⁻⁴.

**Own checks** (N, `own_scalar.py`, `own_small.py`). My m_B′ reproduces E[(z₁²/√2)·conj(ph(L + x))] computed directly
(−0.07691671 at x = 0.2, −0.12266844 at x = 0.9). Source: min m_B″ = −0.0996 on x ≥ 0; m_B″ ≤ 0 on x ≥ 1 (the proof
uses ≥ −1 and ≤ 1); |m_B⁗| ≤ 59 on [0, 1] (certified 72.148, used 1000). M₀ = 0.42202809713957834 and
M₁ = 1.03220234263664922 (mpmath), inside the author's enclosures; (8/25)M₀M₁ = 0.139398.

| slab | cap c | sup\|k_u\| at the lower end (own) | min of L_uK − m_B″ on [0, 1] (own) | true (2/3)sup N at the two ends (own) | γ_B claimed |
|---|---|---|---|---|---|
| [0.0005, 0.01] | 0.77 | 0.7584 | 7.00·10⁻⁴ | 0.05500, 0.05040 | 0.061 |
| [0.01, 0.02] | 0.74 | 0.7261 | 6.98·10⁻⁴ | 0.05040, 0.04635 | 0.056 |
| [0.02, 0.03] | 0.71 | 0.6963 | 6.96·10⁻⁴ | 0.04635, 0.04289 | 0.052 |
| [0.03, 0.04] | 0.69 | 0.6698 | 6.94·10⁻⁴ | 0.04289, 0.03990 | 0.049 |
| [0.04, 0.0463] | 0.67 | 0.6460 | 6.93·10⁻⁴ | 0.03990, 0.03821 | 0.046 |

On the grid x = 0(0.005)6, at the two ends and the middle of each slab, −3/5 ≤ k_u ≤ K holds, with equality only at
x = 0. The residuals agree with the certificate's: 7.0·10⁻⁴ less the interpolation allowance 5·10⁻⁴ is its 2.0·10⁻⁴. At
u = 0.0463 my true coefficient 0.038208 (at R = 0.42) is the author's sampled 0.038208904 (at R ≈ 0.42193).

**What (B) is worth.** It is the first certified bound of the raw B-content that vanishes with χ. It is not close to
a deficit bound and cannot become one by better scalar work: the true coefficient of this route is 0.038 at the top
of the range, while on the cubics tried ‖c_B‖²/δ is at most 0.0049 (author) and ‖c_B‖²/D at most 0.0216. At
(u, χ) = (0.0463, 3) the certified envelope is 2.96·10⁻⁴ against the target allowance 5.5·10⁻⁵ (author's comparison of
two bounds; not a cubic).

## 6. (J): the joint secant at the tilt (3/5, 0)

**Statement and prose agree**: h = (T − 2/5)α + z₁²conj(β)/√2, Rem = 2E[|L + w + h| − |L + w| − Re(h·conj(ph(L + w)))],
Q = m_A|α|² + m_B|β|² with m_A = p − 59/100, m_B = p − 23/100; all complex w, α, β in each region.

**Re-derived.**

- Pointwise: 0 ≤ 2(|V + h| − |V| − Re(h·conj(ph V))) ≤ min(|h|²/|V|, 4|h|); |h|² ≤ Q·P(T) with
  P(t) = (t − 2/5)²/m_A + t²/(2m_B) (weighted Cauchy–Schwarz). So Rem ≤ Q·E[P(T)/|L + w|].
- Potential lemma: a nonnegative planar measure of mass m and density at most D/π has potential at most 2√(mD) at
  every point (ball mass ≤ min(m, Dr²), integrated against r⁻²dr).
- (i) |w| ≥ 7/2: for T ≤ 6, |L| ≤ ℓ(6) = 3.474 < 7/2, and the angular mean of 1/|X + re^{iθ}| is
  (1/X)Σ(C(2k, k)/4^k)²(r/X)^{2k}, increasing in r and decreasing in X; exact cell masses from
  M(c) = e^{−c}[q₂(c² + 2c + 2) + q₁(c + 1) + q₀]; for T ≥ 6 the density e^{−t}P(t)/(π(a + bt)(a + 3bt)) decreases
  (P > P′ there) and the lemma applies. Certified sum 0.97942 < 49/50.
- (ii) R ≥ 5: Rem ≤ 4E|h| ≤ 4(2e^{−2/5} − 3/5)|α| + 2√2|β| ≤ 3|α| + 2√2|β|, and
  5(m_A·A² + m_B·B²) − 3A − 2√2·B ≥ 2 − 9/(4(5m_A − 2)) − 2/(5m_B − 2) = 0.0668 on A² + B² = 1.
- (iii) cones: the remainder at a fixed w is convex in the perturbation and vanishes at 0, so
  Rem(α, β) ≤ (√(13/20)|α| + √(53/50)|β|)², with 11.39 on the A-axis and Rem_B ≤ 2√(7/25)|β|² < (53/50)|β|² on the
  B-axis (density of the pushforward of T²/2 at most (7/25)/π, mass 1). Slacks m_A − 13/20 − (5/3)/21 = 0.00269 and
  m_B − 53/50 − (5/3)/56 = 0.00229.
- (iv) R ≤ 1/32000: the Hessian at zero amplitude is E[(Im(h_η·conj(ph(L + w))))²/|L + w|]; by the projection
  |v| = ½∫₀^π|Re(e^{−iθ}v)|dθ it is (1/π)∫₀^π∫ g_η²e^{−T}/D dy dθ at the root of bx³ + (a + by²)x + w·cos θ = 0,
  D = a + b(y² + 3x²). In the coordinates (Re α, Re β, Im α, Im β) the terms odd in y vanish and the cross-block terms
  are odd under θ → π − θ (which sends x to −x), which gives the two blocks of (3) with the factor 4/π. Tail y ≥ 5:
  the omitted part is positive semidefinite with trace at most (3/b)(5/2 + 1/20)e^{−25} < 10⁻⁹, subtracted from both
  diagonal slacks, which is the right use of it. Third derivative: D ≥ a + bT − √6‖ρ‖√T (from
  (κ + u)² + v² ≤ (3/2)‖ρ‖²) > 11/20 + (7/100)T for ‖ρ‖ ≤ 1/100; x_σ = −g_σ/D and ∂_σD = D_x·x_σ + ∂_xg_σ give the four
  terms of (9); |g_η| ≤ (5/4)(T + 1)‖η‖ and |∂_xg_η| ≤ (5/2)√T‖η‖ give F(T), and (12) for T ≥ 16. Then
  Rem = 2∫₀¹(1 − τ)D²f(τρ)[ρ, ρ]dτ ≤ ρᵀ(P − (47/200)I)ρ + 2·480R³∫₀¹τ(1 − τ)dτ, and 160R ≤ 1/200 for R ≤ 1/32000.

**Replay**: section 2 (zero-amplitude cover: 52 slabs of w ∈ [0, 7/2]; third derivative 478.4854 < 480; exterior
0.97942 < 49/50).

**Own checks** (N, `own_secant.py`, `own_misc.py`).

- Zero-core matrix at the tilt (3/5, 0), mpmath: K = [[0.446707057881032, 0.371205677404105], [·, 0.940202200988669]],
  least eigenvalue 0.247721504117978, eigen-direction (r_A, r_B) ∝ (1, −0.536) (B-energy share 0.223);
  0.3·(K⁻¹)_AA = 0.99950162. The same code gives 0.298364651634117 with no tilt (the value of 7.4.9) and
  0.389857470418827 at the matched tilt (0.6, 0.30318).
- Zero-amplitude cost on w = 0, 0.025, …, 3.5 with my own root finding and quadrature: the smallest value of both
  blocks is at w = 0 and equals 0.2477215; at w = 3.5 the blocks have 0.864 and 0.618. So the certified 47/200 has
  0.0127 of room at its worst point.
- Exterior scalars: E[P(T)/|L + w|] = 0.8856, 0.7588, 0.4809 at |w| = 3.5, 4, 6 (certified bound 0.97942 from 3.5
  on); the B-axis density peaks at 0.27663 (t = 1.263), cap 7/25; E|T − 2/5| = 0.74064.
- The open region: 1,200 random points with |w| < 7/2, 0.003 < R < 5 and |α|/21 < |β| < 56|α|, both phases free: the
  smallest pointwise cost is 0.2552 (near the zero core, R = 0.02), one point below 0.26, none below the zero-core
  value. Along the zero-core eigen-direction the cost is 0.27689, 0.25124, 0.24804, 0.24776 at R = 0.3, 0.1, 0.03,
  0.01. This agrees with the author's search (smallest value 0.247867): the infimum of the pointwise cost at this tilt
  appears to be the zero-core eigenvalue, 0.0177 above the target 23/100. A scan finds violations; it does not exclude
  them.

**What (J) is worth.** If (J) held for all (w, α, β), integrating it at (q, r_A, r_B) would give
Λ̂(q + (T − 1)r_A + z₁²conj(r_B)/√2) ≤ Λ(q) + (‖c_{3/5}(q)‖² + ‖c_B(q)‖²)/(23/100) for every remote q and all remote
linear drivers, with no cap on their energy and any sharing (the argument of 11.37 and 11.40). With the contents now
proved this is not below S: the A part alone has coefficient (7/25)/(23/100) = 28/23 > 1, and (B) is not a deficit
bound. It needs ‖c_{3/5}‖² ≤ γ_A·D₊ + … and ‖c_B‖² ≤ γ_B·D₊ + … with γ_A + γ_B < 23/100; with the partial 1/5 of 11.55
that leaves 3/100 for B, against a largest observed ‖c_B‖²/D of 0.0216. So (J) is a second, more demanding route to
the joint A/B bound for Λ̂; the route of 7.4.10 needs only the proved 3/10 and its one premise (P). I would not put
compute into the open region of (J) before a content coefficient well below 23/100 exists.

## 7. The rest of Phase 0

- Zero-core matrix and the statement "the A coefficient 3/10 alone uses 0.9995 of a separately budgeted A allowance":
  confirmed (section 6). It is a statement about a way of budgeting, as the author says.
- Fixed-bank diagnostic (`BUDGET_AUDIT.md` §3): the checker passes in the replay; I recomputed both numbers
  (0.24022126 and 0.27472071) from the bank with the stored benchmark values. They are properties of the 119 saved
  duals and the content envelope, not of any cubic.
- Conditional budget: (21/23)D₊ + 1/23000, then S + 1/23000 + 9/25000000 = S + 25207/575000000 in both cases D ≥ 0 and
  D < 0; correct, with the remote error not attenuated (item 87).
- The matched-tilt witness (`SECANT_NUMERICS.md`): at w = 0.666121689158, (A, B) = (0.44745, 0.28134) (phases
  −4.4·10⁻⁵ and 3.2·10⁻⁴) I get Rem = 0.2174288, Rem/S_r = 0.778292 and pointwise cost 0.095772 (two resolutions agree
  to 1.5·10⁻⁶; the author has 0.095772472). The right side of (P) exceeds Rem there by 0.0329, so (P) holds at this
  point with room, as 7.4.14 says it must on the real aligned plane. The zero-core supremum of Rem/S_r at the matched
  tilt is 0.772523 (largest eigenvalue of the local remainder matrix, mpmath), not 0.774. A local
  search from the witness (500 evaluations, `own_small.py`) raises Rem/S_r to 0.7820 at (w, A, B) =
  (0.6691, 0.4237, 0.3216), where (P) has room too; a second one, minimising the room of (P) per unit S_r, ends at
  (w, A, B) = (0.601, 0.350, 0.202), inside the critical box of 7.4.11, with room 0.0213·S_r > 0.
- Not replayed: the N searches of Phase 0 (`verify.py --numerics`) and of `route2/DIAGNOSTICS.md`.

## 8. Proposed ledger text

Row numbers: 11.61 and 11.62 are the next free rows of section 11 (b), 7.1.8 of 7.1, 7.4.15 of 7.4, item 103 of
section 14 (none of them exists at the head of #488). The source tag KAB is my proposal; where the files go is the
coordinator's decision.

### 8.1 Sources table (section 0), one new row

```
| KAB | `sources/ab-sector-2026-11-15-codex-91d4/`: `REPORT.md` (Phase 0), `CONTENT_STRUCTURE.md`, `BUDGET_AUDIT.md`, `GEOMETRY.md`, `route2/REPORT.md`, `route2/a_content/A_CONTENT_PROOF.md`, `route2/b_content/B_CONTENT_PROOF.md`, `route2/secant/EXTERIOR_PROOF.md`, `route2/secant/SMALL_AMPLITUDE_PROOF.md` and `REVIEW_claude-b9ee.md`. The checkers stay in the handoff folder, because `verify.py` checks manifests that include the documents (INVENTORY); the review's scripts and logs are beside it. codex-91d4, task #426; re-derived and replayed by a review worker of claude-b9ee, who re-evaluated the 196 rectangles of 11.61 with its own exact code and recomputed the scalar profiles, the angular suprema and the zero-core matrices in floating point |
```

### 8.2 New rows

Section 11 (b), after the row 11.55:

```
| 11.61 | **Content against deficit with 7/25**: ‖c_{3/5}(q)‖² ≤ (7/25)·D₊(q) + 6·10⁻⁶ for every dimension and every remote cubic q with 0 ≤ u ≤ 463/10000. It sharpens 11.50 on the same domain, with the same allowance | the method of 11.50 with the coefficient 7/25 and the content coefficients of 11.49 and 11.62: an exact union of 196 closed rectangles in 45 energy strips covers (u, χ) ∈ [0, 0.0463] × [0, 42] (χ ≤ 42 is load-bearing, 3.4): on [0, 2/125] 70 boxes (3 exempt) with 16 global Hermite moment caps, on [2/125, 0.0463] 126 boxes with the 119 spectral Stein duals of 11.50, accepted again against freshly integrated caps. Energy cells lose at most (21(2 + χ_hi)/200)(Δu)² below their chords. Non-exempt boxes prove the form with the signed D, exempt boxes ‖c‖² ≤ 6·10⁻⁶; no sign of D is assumed. Margins are thin in places (2.7·10⁻⁹ on [9/500, 1/50] × [21, 105/4]; 4.2·10⁻⁸ at low energies). With these duals and content coefficients the method does not reach 3/20 (item 103) | **P + C** (codex-91d4; the reduction re-derived and the verifier replayed, with results identical to the delivered ones on another platform and compiler, by a review worker of claude-b9ee, who also re-evaluated the 196 budgets and the union with its own exact code and its own benchmark values: every margin agrees with the stored one to 3·10⁻¹²). Inherits the inputs of 11.50 with their evidence (the Stein bound, the spectral cuts, the Hermite caps, 3.4); interval code not audited | KAB `route2/a_content/A_CONTENT_PROOF.md`; `verify_a.py`, `certify_barrier.py`, `angular_route2.cpp`, `moment_cover.py`, `deficit_cover.py`; `REVIEW_claude-b9ee.md` §4 |
| 11.62 | **Five more energy-dependent content coefficients**: ‖c_{3/5}(q)‖² ≤ γ·δ for every u ∈ [e, 463/10000] and every χ, with (e, γ) = (1/125, 49/1000), (1/50, 83/2000), (1/40, 393/10000), (3/80, 173/5000), (21/500, 331/10000). With 11.49 the smallest certified coefficient is 0.049 from u = 0.008, then 0.0484, 0.0467 and 0.0451 (from 0.012, 0.015, 0.018), 0.0415 from 0.02, 0.0393 from 0.025, 0.0375 from 0.03, 0.0355 from 0.035, 0.0346 from 0.0375, 0.034 from 0.04, 0.0331 from 0.042 and 0.0325 from 0.044 | every dimension; the method of the last four rows of 11.49: \|k_u(x)\| ≤ W(\|x\|) for a rational cubic Hermite function W on 500 cells with W = 9/25 beyond 1 (both signs of the source, exact Bernstein residuals at both energy endpoints, scalar caps 18/25, 67/100, 13/20, 61/100, 3/5), then the one-switch angular reduction on 400 radial intervals × 4,096 angular cells, with certified values 0.047760, 0.041450, 0.039235, 0.034487, 0.033008. **N** (the review): the true coefficients (2/3)·sup N_Ψ at the five lower energies are 0.04737, 0.04112, 0.03892, 0.03421 and 0.03274, and 0.03142 at u = 0.0463; the five coefficients are 0.9 to 3.4 % above them | **P + C** (codex-91d4; replayed with identical results by a review worker of claude-b9ee, who recomputed the source m″, the profiles k_u and both angular suprema in floating point with its own code: the two differential inequalities hold with 5.1·10⁻⁴ to spare, of which the certificate spends 5·10⁻⁴ on interpolating the source). Inherits the reduction of 11.49; interval code not audited | KAB `route2/a_content/A_CONTENT_PROOF.md` §1; `certify_barrier.py`, `angular_route2.cpp`; `REVIEW_claude-b9ee.md` §4 |
```

Section 7.1, after the row 7.1.7:

```
| 7.1.8 | **Raw B-content against the fourth cumulant**: ‖c_B(q)‖² ≤ γ_B·δ with γ_B = 61/1000, 7/125, 13/250, 49/1000, 23/500 for u in [1/2000, 1/100], [1/100, 1/50], [1/50, 3/100], [3/100, 1/25], [1/25, 463/10000], and ‖c_B(q)‖² ≤ (436959/3125000)·δ < (7/50)·δ at every energy. Here c_B(q) = Π₁,₀[F_B(q)] and F_B(w) = E_{z₁}[(z₁²/√2)·conj(ph(L + w))] = −w·k_B(\|w\|²) | peak row; every remote cubic, every dimension and every χ; a bound by δ, not by the deficit. Method of 11.30 and 11.49 for the B profile: F_B(w) = ¼∫e^{iθ}m_B(Re(e^{−iθ}w))dθ with m_B″(x) = (8/(π√2))·x·∫₀^∞[(3/2)f_B + x²f_B′](x² + y²)dy, f_B = e^{−t}/((a + bt)³(a + 3bt)) at t(a + bt)² = s; ‖c_B‖² ≤ (2/3)δ·sup_R N_{Ψ_u} ≤ (11/108)‖k_u‖²_∞·δ with (5/3 − (u/2)∂² + x∂)k_u = m_B″; rational barriers on 500 cells give k_u ≤ c + 10⁻⁸ with c = 0.77, 0.74, 0.71, 0.69, 0.67 on the five slabs, and m_B″ ≥ −1 gives k_u ≥ −3/5. At every energy: N ≤ (4/3)λ for a Gaussian atom x·e^{−λ\|x\|²}, so sup N_{F_B} ≤ (4/3)M₀M₁ for the positive mixture of 7.1.6, with M₀ = k_B(0) = J₁/(2√2) < 423/1000 and M₁ = −k_B′(0) = 3I₃/(8√2) < 1033/1000 (I₃ = ∫₀^∞e^{−r²}(a + br²)⁻³dr). **N**: the true coefficients (2/3)·sup N_{Ψ_u} are 0.0550, 0.0504, 0.0464, 0.0429, 0.0399 and 0.0382 at u = 0.0005, 0.01, 0.02, 0.03, 0.04 and 0.0463, so this method cannot go below 0.038 at the top of the range; on 33 finite cubics the largest ‖c_B‖²/δ is 0.0049 (author) and the largest ‖c_B‖²/D is 0.0216, at the Wick monomial with u = 0.0463 (author; recomputed in the review) | **P + C** (codex-91d4; the representation, the tails and the comparison re-derived, the verifier replayed with identical results, and the source, the profiles k_u and the suprema recomputed in floating point with own code by a review worker of claude-b9ee). Inherits the Stein budget and the resolvent identity of 11.30, the angular lemma of 11.49 and the positive kernel representation of 7.1.6 | KAB `route2/b_content/B_CONTENT_PROOF.md`, `CONTENT_STRUCTURE.md`; `b_barrier_verify.py`, `content_structure_exact.py`; `REVIEW_claude-b9ee.md` §5 |
```

Section 7.4, after the row 7.4.14:

```
| 7.4.15 | **A common joint cost at the A-tilt alone: regions.** With the trial ξ = −(3/5)r_A (no B tilt), h = (T − 2/5)α + z₁²·conj(β)/√2 and Rem_J(w, α, β) = 2E_{z₁}[\|L + w + h\| − \|L + w\| − Re(h·conj(ph(L + w)))], the inequality (J): Rem_J ≤ (p − 59/100)\|α\|² + (p − 23/100)\|β\|², a common cost 23/100 against the penalty diag(p − 9/25, p), holds (i) for \|w\| ≥ 7/2 at every amplitude, with the factor 49/50; (ii) for \|α\|² + \|β\|² ≥ 25 at every w; (iii) for \|β\| ≤ \|α\|/21 or \|α\| ≤ \|β\|/56 at every w and amplitude; (iv) for (\|α\|² + \|β\|²)^{1/2} ≤ 1/32000 at every w. **Open** for \|w\| < 7/2, 1/32000 < (\|α\|² + \|β\|²)^{1/2} < 5, \|α\|/21 < \|β\| < 56\|α\|. The zero-core cost matrix at this tilt is [[0.446707, 0.371206], [0.371206, 0.940202]], with least eigenvalue in (0.247721, 0.247722) along (r_A, r_B) ∝ (1, −0.536), so no common cost above that value holds; the zero-amplitude cost is at least 47/200 at every w. (J) everywhere would give Λ̂(q + (T − 1)r_A + z₁²·conj(r_B)/√2) ≤ Λ(q) + (‖c_{3/5}(q)‖² + ‖c_B(q)‖²)/(23/100) for every remote q and all remote linear drivers, with no cap on their energies (the argument of 11.37). With the contents proved (11.61, 7.1.8) that is not below S, since 7/25 > 23/100: it needs deficit bounds for both contents with coefficients of sum below 23/100, which are open (with 3/20 and 3/50 and allowances 6·10⁻⁶ and 4·10⁻⁶ the bound would be S + 25207/575000000). (J) is not comparable with (P) of 7.4.10: both are second-order remainders of F(w, α, β) = E\|L + w + (T − 1)α + z₁²·conj(β)/√2\| at (w, 0, 0), (J) along ((3/5)α, α, β) and (P) along ((3/5)(A + 0.5053B), A, B); the two planes meet in the A-axis, where both are the remainder of 11.39 | the regions **P + C** (codex-91d4; re-derived and replayed by a review worker of claude-b9ee). (i) Rem ≤ \|h\|²/\|L + w\|, weighted Cauchy–Schwarz, the angular series of 1/\|X + re^{iθ}\| on 200 radial cells and a mass-and-density potential bound beyond T = 6; (ii) Rem ≤ 4E\|h\| ≤ 3\|α\| + 2√2\|β\|; (iii) convexity of the remainder with 11.39 and the B-axis bound (53/50)\|β\|² (the cost of 7.1.1); (iv) a cover of the two zero-amplitude Hessian blocks on 0 ≤ w ≤ 7/2 by 52 slabs and the bound \|D³f\| < 480 for amplitudes at most 1/100, with the factor 1/3 of the doubled secant. The matrix **C** (author; recomputed to 15 digits in the review). **N** (the review): on 1,200 random points of the open region the smallest pointwise cost is 0.2552, and along the zero-core eigen-direction it increases with the amplitude (0.2478 at 0.01, 0.2769 at 0.3); the author's search has 0.247867 as smallest value. No joint, odd-sector or K theorem | KAB `route2/secant/EXTERIOR_PROOF.md`, `route2/secant/SMALL_AMPLITUDE_PROOF.md`, `GEOMETRY.md`, `BUDGET_AUDIT.md` §§4–5; `exterior_exact.py`, `base_hessian.cpp`, `derivative_exact.py`, `content_structure_exact.py`; `REVIEW_claude-b9ee.md` §6 |
```

Section 14, a new item (optional; it records why the certificate of 11.61 stops at 7/25):

```
103\. **The coefficient 3/20 in 11.61 from the 119 duals of 11.50.** At (u, χ) = (463/10000, 3) the smallest certified
content envelope is 0.000209009775 (the coefficient 13/400) and the best of the nine duals at that energy gives a deficit
lower bound of 0.000845094962, so this pair needs a coefficient above 0.2402 at the allowance 6·10⁻⁶ (or an allowance
above 8.2·10⁻⁵ at 3/20); at (11/400, 1229/100), with eight duals, above 0.2505 with the coefficient 393/10000 of 11.62
(0.2747 with 1859/43200). A limit of this bank of upper bounds, as in item 83, not a lower bound on the true
coefficient: on 33 finite cubics the largest ‖c_{3/5}‖²/D is 0.0127 (**N**, author). The sampled richer duals of the
delivery raise the two deficit bounds by 3 % and 8 % only (**N**, author). **C** (exact arithmetic on the saved bank:
codex-91d4; replayed, and both numbers recomputed, in the review; the value 0.2505 is the review's). KAB
`BUDGET_AUDIT.md` §3, `route2/DIAGNOSTICS.md`; `content_structure_exact.py`.
```

### 8.3 Amendments to existing rows (exact strings; each OLD occurs once at the head of #488)

**a. Row "11.43, 11.50"**, statement cell: a pointer to the sharper row.

```
OLD
6·10⁻⁶ for every dimension and every remote cubic q with 0 ≤ u ≤ 463/10000 | an exact union of 178 closed rectangles
NEW
6·10⁻⁶ for every dimension and every remote cubic q with 0 ≤ u ≤ 463/10000; 11.61 has 7/25 | an exact union of 178 closed rectangles
```

**b. Row "11.42, 11.51, 11.54"**: the constant, its proof line, what the smaller κ gives, and the status of the new
constant. The headline bound is unchanged.

```
OLD
with κ = 56730/59009 ≈ 0.9614 and η = 5673/295045000 ≈ 1.9228·10⁻⁵.
NEW
with κ = 52948/59009 ≈ 0.8973 and η = 5673/295045000 ≈ 1.9228·10⁻⁵.

OLD
proof: 11.40 with 11.50 gives 𝒥 ≤ C²/k ≤ (0.3·D₊ + 6·10⁻⁶)/k.
NEW
proof: 11.40 with 11.61 gives 𝒥 ≤ C²/k ≤ ((7/25)·D₊ + 6·10⁻⁶)/k (with 11.50 in place of 11.61, κ = 56730/59009 ≈ 0.9614).

OLD
η + 3.6·10⁻⁷ < 1.96·10⁻⁵. No bound on ‖r‖
NEW
η + 3.6·10⁻⁷ < 1.96·10⁻⁵. The headline does not depend on κ (item 87); for D ≥ 0 the smaller κ gives Λ̂(q + (T − 1)r) ≤ B(u) − pu − (6061/59009)·D(q) + η, which is at most S once D(q) ≥ 5673/30305000 ≈ 1.872·10⁻⁴. No bound on ‖r‖

OLD
κ < 1 and η < 2·10⁻⁵ exact in `deficit_exact.py`)
NEW
κ < 1 and η < 2·10⁻⁵ exact in `deficit_exact.py`, with the coefficient of 11.50; κ = (7/25)/k = 52948/59009 with 11.61 and the threshold η/(1 − κ) = 5673/30305000: exact arithmetic, the review of KAB)
```

**c. Row 11.55**, first words and the last sentence of its status.

```
OLD
Partial sharpening of 11.50: ‖c_{3/5}(q)‖² ≤ (1/5)·D₊(q) + 3/500000
NEW
Partial sharpening of 11.50 and 11.61: ‖c_{3/5}(q)‖² ≤ (1/5)·D₊(q) + 3/500000

OLD
Not used by 11.51 or 7.4.10, which need 3/10; frozen
NEW
Not used by 11.51 or 7.4.10; on its 40 gap rectangles the best coefficient is the 7/25 of 11.61; frozen
```

**d. Row "11.41, 11.49"**, statement cell: a pointer.

```
OLD
from 0.0502 at u ≥ 0.009 down to 0.0325 at u ≥ 0.044 |
NEW
from 0.0502 at u ≥ 0.009 down to 0.0325 at u ≥ 0.044; five more, from u ≥ 0.008: 11.62 |
```

**e. Row 11.45**: the sampled value at the tilt (0.6, 0) is above the exact local value.

```
OLD
tilt (s_A, s_B) = (0.6, 0): 0.252, at w = 0.25i, angle parameter 0.375 (about 30.9 % B energy);
NEW
tilt (s_A, s_B) = (0.6, 0): at most 0.24772, the sharp local value at the origin, in the direction (r_A, r_B) ∝ (1, −0.536) with 22.3 % B energy (7.4.15); the sampled grid shows 0.252, at w = 0.25i, angle parameter 0.375 (about 30.9 % B energy);
```

**f. Row 7.4.10**, the N note at the end of its status cell.

```
OLD
**N** (rev. #428): the largest Rem/S_r found is 0.774, at the zero core.
NEW
**N**: the largest Rem/S_r found is 0.782, at w = 0.669, (A, B) = (0.424, 0.322), by a local search in the review of KAB from codex-91d4's point of smallest pointwise cost at this tilt (cost 0.0958 at w = 0.6661, (A, B) = (0.4475, 0.2813), where Rem/S_r = 0.7783); the supremum at the zero core is 0.7725. The pointwise cost at this tilt falls far below the zero-core eigenvalue 0.3899, which is why (P) carries a quartic term; (P) holds at both points with room.
```

**g. Row 7.1.5**, scope cell.

```
OLD
for the matched retained tilt the B-content is bounded at the peak row (7.1.7) |
NEW
for the matched retained tilt the B-content is bounded at the peak row (7.1.7); against δ it is bounded (7.1.8), and on the cubics tried ‖c_B‖²/D is at most 0.0216 (**N**, 7.1.8) |
```

**h. Table "Labels without a row"**, the line of 11.36.

```
OLD
| 11.36 | the content comparison with D₊/10 or D₊/5; the proved comparison is 11.50, with 3/10 |
NEW
| 11.36 | the content comparison with D₊/10 or D₊/5; the proved comparisons are 11.50, with 3/10, and 11.61, with 7/25 |
```

**i. Section 15, part A, item 1** (optional): one sentence after "(7.4.10).".

```
OLD
With it, Λ̂(q + A + B) < S + 4936/10⁸ (7.4.10).
NEW
With it, Λ̂(q + A + B) < S + 4936/10⁸ (7.4.10). A second route, with no cap on the driver energies, is (J) of 7.4.15; it needs deficit bounds for both contents with coefficients of sum below 23/100, and 11.61 has 7/25.
```

**j. Row 7.1.7** (optional; codex-a7c4's row, so its author should agree). With 7/25 in place of 3/10 the same
completion gives a smaller allowance or a smaller coefficient: η_B = γη_A/α + γe²/(γ − ρ²α) with ρ = 5053/10000,
e² = (7/2000)²(463/10000), η_A = 6·10⁻⁶ is 4.1324·10⁻⁶ for (γ, α) = (1/10, 7/25) and 4.3278·10⁻⁶ for (19/200, 7/25),
against 4.4237·10⁻⁶ for (1/10, 3/10). So ‖c_{B,s_B}(q)‖² ≤ D₊/10 + 414/10⁸, or ≤ (19/200)·D₊ + 433/10⁸ (exact
arithmetic, `own_small.py`).

### 8.4 Mirrors outside the ledger

`research/conjecture-K/MONOGRAPH.md` (line numbers at the head of #488): line 533 states the comparison with 3/10 and
lines 535–540 its certificate (178 rectangles, 4.3·10⁻⁷); line 546 has κ = 56730/59009 ≈ 0.9614; the table at line 1159
has 0.252 for "A and B together" at the tilt (0.6, 0). `research/conjecture-K/README.md` line 521 describes the
tilted-sector report itself and stays as it is.

## 9. What the package changes downstream, and what it does not

**The κ of 11.51 becomes 52948/59009 ≈ 0.8973** (from 56730/59009 ≈ 0.9614), with the same η = 5673/295045000.

- It does **not** change Λ̂(q + (T − 1)r) < S + 5778430967237/295045000000000000 < S + 2·10⁻⁵. That bound is
  η + 3.6·10⁻⁷, and with D₊ the allowance does not attenuate (item 87): for D < 0 the bound is Λ(q) + η whatever κ is.
- It does change the bound for cubics with a positive deficit: Λ̂(q + (T − 1)r) ≤ B(u) − pu − (1 − κ)D + η with
  1 − κ = 6061/59009 ≈ 0.1027 instead of 2279/59009 ≈ 0.0386. So the retained A-core is at most S, with no allowance,
  once D(q) ≥ 5673/30305000 ≈ 1.872·10⁻⁴, instead of 5673/11395000 ≈ 4.978·10⁻⁴.
- 11.53 (profile rectangle), 11.46, 11.47, 11.48: unchanged (they use η, or do not use 11.50).
- 7.4.10 and everything conditional on it (7.2.8, 7.5.3, 7.5.6): unchanged. Its 1,000-cell check uses the coefficient
  3/10, which 11.61 implies; rerunning `joint_target_check.py` with 7/25 could only lower 4936/10⁸. Not done here.
- 7.1.7: can be sharpened as in 8.3 j; nothing depends on it today except 7.4.10's inputs, which stay valid.
- The degree-5 ledger does not use κ or the coefficient 3/10 (its row 4.10 cites the chain 11.49–11.50 only to say
  that it does not transfer). No change.

**The other numbers**: 11.45 (0.252 is not a lower bound of anything; the exact local value 0.24772 is smaller) and
the N note of 7.4.10 (0.774) are corrected in 8.3 e and f. Neither is used by a proof.

**Nothing else moves.** (B) and (J) add rows; they feed no existing bound. The package gives no new bound on Λ̂ or K
and no new Grothendieck bound.

## 10. What I could not check, or did not

- The inherited analytic inputs, which have the status the ledger gives them: the Stein budget and the
  shifted-resolvent identity (11.30), the reduction to k_u and the angular lemma (11.49), the spectral-cut soundness
  of the duals and the global Hermite caps (11.50, 3.3), the moment theorem 3.4, the remainder bound 11.39, the
  positivity of the B kernel measure (7.1.6). I tested several of them numerically (section 4) and re-read
  `content_profile_proof.md`, `secant_content_proof.md` and `deficit_structure_content_proof.md` to see that sections
  1–3 of the first apply to the B profile; I did not re-derive them.
- The interval code as code. I read every new checker and re-derived what each one asserts; I did not audit Arb, the
  inherited Python helpers (`root_series`, `integrate`, `check_node_long`, `positive`, `tail_positive`) or the
  inherited C++ primitives line by line, and I wrote no independent interval implementation. For (A) the status
  "interval code not audited" of 11.50 carries over. The acceptance of the 119 duals was replayed, not recomputed by
  other means.
- `base_hessian.cpp`: read once, with the formulas for the jets and the root derivatives checked against my
  derivation; its result is supported by my floating-point Hessian (worst point w = 0, margin 0.0127), not by a
  second interval computation.
- `negative_controls.py`: not run.
- The N searches and diagnostics of both phases (`secant_probe.py`, `content_probe.py`, `raw_probe.py`,
  `deficit_probe.py`, the coupled and moment probes): not replayed. I recomputed with my own code only the numbers the
  ledger text above quotes (zero-core matrices, the matched-tilt witness, the Wick monomial, the true coefficients at
  u = 0.0463).
- `GEOMETRY.md` §§2–4 for a general pair of tilts: I re-derived the projected cubic and its monotonicity at t = 0
  only; the general (5a) I used numerically (it reproduces 7.4.9 and the author's 0.38985747).
- clang++: yo has none. The C++ checkers were compiled with g++ only; their outputs equal the author's clang++
  outputs digit for digit.
- The open region of (J): a random scan is not evidence of a bound.

## 11. Files

Review folder: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15-review/`

| file | content |
|---|---|
| `own_scalar.py`, `own_scalar.log` | sources, profiles k_u, barriers, angular suprema, for A and B (N) |
| `own_cover.py`, `own_cover.log` | the 196 rectangles and the union, exact; caps and h (N) |
| `own_misc.py`, `own_misc.log` | duals, zero-core matrices, the matched-tilt witness, the Wick monomial (N) |
| `own_secant.py`, `own_secant.log` | zero-amplitude Hessian, exterior scalars, the random scan (N) |
| `own_small.py`, `own_small.log` | exact constants, M₀ and M₁, the local search |
| `replay_full.log`, `replay/` | the author's verifier on yo: wrapper output and the regenerated logs and result files |

The copy of the package on yo (`~/claude-b9ee-review426`) is deleted.
