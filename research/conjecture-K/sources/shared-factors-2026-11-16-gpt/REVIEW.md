<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-shared-factors-2026-11-16/REVIEW.md (16 November 2026): review by a review worker of claude-b9ee. Only this line was added. -->
# Review: the shared-factors package (content law, second round)

Reviewer: a review worker of claude-b9ee (Claude), 16 November 2026, 18:05–18:45 Europe/Bucharest.
Package: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-shared-factors-2026-11-16/package/`
(a GPT session of the user; manifest 7/7). Labels as in `/Users/alingalatan/workspaces/grothe/research/README.md`.
My work: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-shared-factors-2026-11-16/review/`
(`scripts/`, `logs/`, `data/`, `package-copy/`). No tracked file edited, nothing committed, pushed or posted.
No URL of the package's `SOURCES.md` is reproduced here.

The inequality: ‖c[h]‖² ≤ θ·δ·Ω̂[h], with c[h] = Π₁[q h(V)], V = |q|², u = E V, δ = E V² − 2u², χ = δ/u²,
k(v) = E h(v + uτ), Ω̂[h] = (3/2)E[V k′(V)²] − (3/4)(E[V k′(V)])²/u.

---------------------------------------------------------------------------------------------------------------------

## 0. Verdict

1. **Every statement of `PROOFS.md` is correct**; I re-derived each one and found no gap. The verifier replays and
   reproduces `results/replay.json`.
2. **Claim (1), the class result, is right and covers the largest class so far**: θ = 5/3 on all of
   H₁,₀(X) ⊗ H₁,₁(Y) (any number of drivers, arbitrary complex coefficient matrices on one shared block), plus the
   decoupled bulk. The two families with θ < 0.37 are right. As in the first package the constants are uniform in
   the profile and the energy, and far above the true values (§3).
3. **Claim (2), the bound for every cubic, is right, constants included, and gives nothing on the band.** In the form
   ‖c‖² ≤ C·√χ·δ·Ω̂ its constant is C = 500–1240 on the six rows. The largest χ it covers is

   | row t | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
   |---|---|---|---|---|---|---|
   | χ ≤ | 9·10⁻⁸ | 4·10⁻⁷ | 3·10⁻⁶ | 7·10⁻⁶ | 1.3·10⁻⁵ | 3·10⁻⁵ |

   The hard families sit at χ = 0.6–42. On the spike family the true ratio is 0.46–0.62·√χ as χ → 0, so the
   constant is 800–2700 times too large; the cutoffs are 6–7 orders of magnitude below what the form δ^{3/2}
   could give. Bounds of this order for every cubic are already in K ledger 6.3.11; what is new is the radial
   complex form with E D_h²(V) and an explicit constant.
4. **Corollary 3** is a correct written proof of the constant 3√6/4 of K ledger 6.3.12 (status **R** there).
5. **Claim (3)** is correct arithmetic about the t = 0 constraint only: λ₁ ≤ 0.81431, room 0.00378 at 81/100.

---------------------------------------------------------------------------------------------------------------------

## 1. What I did

| what | where |
|---|---|
| hand re-derivation of `PROOFS.md` §§1–5 | §2–§5 below |
| replay of `scripts/verify.mjs` in a scratch copy (read first) | `logs/verify.log`; output equal to `results/replay.json` |
| Theorem 1: (5), Var A = 2 tr J and (2) for h = v, v² by exact quadrature on random non-commuting families; the inequalities behind 5/3 on 960 random families; the Hermitian-basis identities for d = 2…5 | `scripts/thm1_check.py`, `logs/thm1_check.log` |
| sharp profile-free constants and row-profile ratios: the basis family (d = 2…20), n equal rank-one factors (n = 1…16), two generic non-commuting shared examples | `scripts/thm1_check.py`, `scripts/shared_example.py` |
| Theorem 2 and Corollary 3: (7), (8), (9), the formula for D_h, the constant chain, on nine cubics | `scripts/thm2_check.py`, `logs/thm2_check.log` |
| the row profiles and their first three derivatives from the definitions, without differentiating a table | `scripts/prof_jets.py`, `scripts/test_prof_jets.py`, `scripts/build_profiles.py`, `data/prof_jets_<t>.npz` |
| the χ cutoffs of Theorem 2, of the linear split and of the test (10); laws of actual cubics | `scripts/chi_cutoffs.py`, `logs/chi_cutoffs.log`, `scripts/crosscheck_omega.py` |
| all rational claims in exact fractions | `scripts/arith_check.py`, `logs/arith_check.log` |

Laptop only, one process, one thread, `python3 -I`; nothing on `big`.

---------------------------------------------------------------------------------------------------------------------

## 2. Verdict per statement

| statement (`PROOFS.md`) | verdict | how checked |
|---|---|---|
| §1 set-up: q ∈ H₂,₁; content only in the X block; conditional on (Y, U), q is proper Gaussian with variance A = ‖P‖² + D; V = Aτ; δ = 2 Var A | correct | by hand |
| (2): c_ℝ[h] = E[τ k′(Aτ){P(A − u) + 2BP}] | correct | by hand (regression, the exponential integration by parts, ½⟨∇P_i, ∇P_j⟩ = Y*S_ijY); exact quadrature for h = v, v² |
| (3): the Cauchy–Schwarz in the form Ω̂ under dμ = (Aτ/u)dP | correct | by hand |
| (4), (5): u·E_μZ_e² ≤ L + 4eᵀKe, u·E_μZ_e = 4eᵀv; E B² = M² + T, E[(A−u)B] = 2R, E[(A−u)P] = 2v, E[BP] = v, L = 2 tr J + Var D | correct | by hand (joint cumulants of Gaussian quadratic forms); exact quadrature, d = 2, 3, two to four non-commuting factors |
| Theorem 1: formula (1) and θ ≤ 5/3 | correct | by hand; the three inequalities eᵀKe ≤ tr J, 4eᵀTe ≤ tr J, (e·v)² ≤ tr M·eᵀTe on 960 random families (largest ratios 1.0000) |
| §2, Hermitian-basis family: M = I, R = dI, T = (dI + ttᵀ)/2, v = dt, tr J = d²(1 + 2d) + d, λ_max = 1 + 7d, θ(8) = 605/1644, θ < 37/100 for d ≥ 8 | correct | by hand; numerically for d = 2…5 in a rotated basis; exact fractions (θ(7) = 0.3783 fails) |
| §2, independent gamma factors: the bound with α², J_w, V_m; at m = 1: 194/525 (n ≥ 7), 137/400 (n ≥ 8) | correct | by hand (the cross term 8s²/m, Var r = 2 + 6/m, J_w ≤ 12, α² ≤ 1 − 4/e² < 23/50); exact fractions |
| Theorem 2: ‖c[h]‖² ≤ (13/2)δ^{3/2}E D_h²(V) | correct | by hand, every constant; (7), (8), (9) on nine cubics by exact quadrature |
| (7): Λ ≤ √(3δ/8)/36; κ₄(Q_i) = 2‖P₂(Q_i²)‖² + ‖P₄(Q_i²)‖² = 3δ/8 | correct | by hand; ratios 0.64–0.82 on the nine cubics |
| (8): the three-derivative identity | correct | by hand (three integrations by parts); defect 10⁻¹⁶ for φ = Q₁ᵖQ₂ᵐ, p + m ≤ 4 |
| (9): ‖⟨∇Q_a, A∇Q_b⟩‖₂ ≤ 9√60·Λ‖A‖ | correct | by hand (the three kernels); largest ratio found 0.64 |
| D_h² = max(‖T₁‖², ‖T₂‖²) ≥ ‖D³Re(z h)‖² | correct; in fact ‖D³φ‖² = cos²θ‖T₁‖² + sin²θ‖T₂‖² | sympy, three profiles, 20,000 points |
| Corollary 3: ‖c[v]‖² ≤ (3√6/4)δ^{3/2} | correct | by hand; E[G_eQ₁³] = 324⟨A₁, K₁⟩ and the factor 3/4 on nine cubics |
| the linear split after Corollary 3 | correct | triangle inequality |
| §4, (10): u√χ(26M₀ + 3θL₀) ≤ 3θb suffices | correct | by hand from 6.3.24, 6.3.21 and Ω̂ ≥ (3/4)E[V k′²] |
| §4, regularity of the six profiles | correct | the ellipse algebra by hand; the row inequalities by the replay; numerically Γ is odd at 0 to 10⁻¹⁵ and its Taylor series converges. I did not write out the derivative bounds at infinity |
| §5: (500/701)/0.9359² = 50,000,000,000/61,401,207,581; room 26502185939/7010000000000 at 81/100 | correct | exact fractions |

---------------------------------------------------------------------------------------------------------------------

## 3. Claim (1): the conditional-Gaussian class

**Hypotheses, exactly.** X = (X₁, …, X_r), Y, U, Z are independent standard complex Gaussian blocks. So the X_j are
independent of each other and of Y. The A_j are arbitrary complex matrices on the one block Y: writing
A_j = H_{2j−1} + iH_{2j} with Hermitian H, the real factors P_i = Y*H_iY − tr H_i are what enters, and nothing replaces
"Hermitian". The structure used is: **given (Y, U), q is a proper complex Gaussian with variance
A = Σ_j|Y*A_jY − tr A_j|² + Σ_j|F_j(U)|²**. Intrinsically the class is

    H₁,₀(X) ⊗ H₁,₁(Y)  ⊕  H₀,₁(Z) ⊗ H₂,₀(U)          (four independent blocks).

**The content** is a vector in the span of the X_j: c_j = E[(P_{2j−1} + iP_{2j})·τ·h(Aτ)], i.e. the real vector
c_ℝ = E[P τ h(Aτ)] ∈ ℝ^{2r}. Its direction is not fixed by symmetry in general; (1) is a bound for every direction
(λ_max).

**Constants.** Right. Three remarks.
- (1) has the form θ = (1/3)(1 + 4λ_max(K + 4vvᵀ/u)/L) ≥ 1/3: it can never go below 1/3. The floor comes from
  the step (eᵀNP)²/A ≤ ‖Ne‖² in (4).
- At one rank-one factor, q = X(|Y|² − 1), (1) is exactly 5/3; the first package has 1.6587 there and the sharp
  profile-free constant is 1.5473. In general, for one Hermitian factor, (1) is 1 + 8ζ/(3 + 9κ).
- The bound is far from sharp on diffuse members (N; `logs/thm1_check.log`, `logs/shared_example.log`):

| cubic | χ | sharp profile-free θ* | proved | row profiles, largest ratio over u/u* ∈ {0.5, 0.75, 1, 1.3} (t = 0.80 … 0.855) |
|---|---|---|---|---|
| Hermitian basis, d = 2 | 5.50 | 0.520 | 0.788 | 0.19 … 0.31 |
| d = 4 | 2.31 | 0.151 | 0.464 | 0.09 … 0.12 |
| d = 7 | 1.24 | 0.052 | 0.378 | 0.037 … 0.045 |
| d = 8 | 1.07 | 0.040 | 0.3680 = 605/1644 | 0.030 … 0.036 |
| d = 20 | 0.41 | 0.007 | 0.339 | 0.006 |
| n = 1 rank-one factor | 16 | 1.5473 | 5/3 | 0.19 … 0.47 |
| n = 2 | 8 | 0.747 | 0.910 | 0.18 … 0.35 |
| n = 4 | 4 | 0.361 | 0.532 | 0.14 … 0.23 |
| n = 7 | 2.29 | 0.202 | 0.3695 = 194/525 | 0.11 … 0.15 |
| n = 8 | 2 | 0.176 | 0.3425 = 137/400 | 0.10 … 0.14 |
| n = 16 | 1 | 0.086 | 0.248 | 0.06 … 0.07 |
| two complex 2×2 matrices on one block (four real factors, non-commuting) | 7.06 | — | 0.976 by (1) | 0.14 … 0.25 (u/u* ∈ {0.5, 1, 1.3}) |
| three Hermitian 2×2 factors, non-commuting | 7.08 | — | 1.038 by (1) | 0.20 … 0.37 (u/u* ∈ {0.5, 1, 1.3}) |

  (θ* as in my first review: the supremum of the ratio over all profiles and energies. The lattice computation for
  n = 1 reproduces the 1.5473 found there by another method.) The basis family is q = Y*NY − tr N with N a d × d
  matrix of independent complex Gaussians; its law depends on |Y|² only, A = (|Y|² − 1)² + d − 1. A sharp argument
  would give 0.37 from n = 4 (θ* = 0.361; 0.488 at n = 3) and from d = 3 (0.255; 0.520 at d = 2;
  `logs/basis_sharp_scan.log`); the package needs n = 7 and d = 8.
- With the exact scalars α² = 0.3630 and J_w = 10.879 in place of 23/50 and 12 the rank-one bound is 0.3708 at n = 6:
  the threshold n ≥ 7 does not move.

**Against the codex-a786 block package** (its README only; another reviewer has it). Its class, independent blocks
X_iP_i with separate Y_i, real spectra, arbitrary weights and the same bulk, is the commuting, block-diagonal case
of this class.
- Rank-one blocks: codex 39/16 for any number and weights; here 5/3 for any number and weights, and 194/525 from
  seven equal ones. Sharp at one block: 1.547. Consistent; this package is stronger.
- Blocks of higher rank: codex has 8153/6300 (rank ≥ 4) and 16226/43875 (rank ≥ 23) for any number and weights of
  blocks. Here n equal blocks of rank m give (1/3)(1 + 2(m + 7)/(n(m + 3))) by (1): at least 1 for one block, so
  codex is stronger for few or unequal blocks; this package is stronger for many comparable blocks (0.857 at
  n = 2, m = 4; below 0.37 from n = 21 at m = 23).
- Factors sharing a block and not commuting: this package only.
- No contradiction anywhere: all are upper bounds, and the sharp values computed lie below both.

---------------------------------------------------------------------------------------------------------------------

## 4. Claim (2): the three-derivative bound for every cubic

### 4.1 Re-derivation (all constants)

With Q₁ + iQ₂ = q, Q_i = I₃(f_i), K_i = f_i ⊗₂ f_i, Λ = max‖K_i‖_HS:
1. κ₄(Q_i) = 2‖P₂(Q_i²)‖² + ‖P₄(Q_i²)‖² (from E Q⁴ = E[Q²‖∇Q‖²] and ‖∇Q‖² = 3Q² + ½L(Q²)); P₂(Q_i²) = 18·I₂(K_i);
   circularity gives κ₄(Q_i) = 3δ/8. Hence 1296‖K_i‖² ≤ 3δ/8, which is (7).
2. E[G_e φ(q)] = 3Σ_i E[I₂(A_i)∂_iφ], A_i = f_i(e,·,·); duality for I₂ and D²Q_a = 6·I₁(f_a(·,·,*)) give (8).
3. ⟨∇Q_a, A∇Q_b⟩ = 9[I₄(k₄) + 4I₂(k₂) + 2k₀] with each kernel of norm ≤ Λ‖A‖; 4! + 16·2! + 4 = 60 gives (9).
   ‖D_vQ_b‖₂ ≤ 3√2·√Λ‖v‖ and ‖v_ia‖ ≤ √Λ‖A_i‖, ‖A_i‖ ≤ √Λ. So each of the eight coefficients of (8) has
   L² norm ≤ 27(√60 + 2√2)Λ^{3/2}.
4. Cauchy–Schwarz over the eight index triples: |E[G_eφ]| ≤ √8·27(√60 + 2√2)Λ^{3/2}(E‖D³φ‖²)^{1/2}; the real
   first-chaos projection of Re Φ(q) has squared norm ‖c‖²/2; so
   ‖c‖² ≤ 2·8·27²(√60 + 2√2)²·36⁻³·(3/8)^{3/2}·δ^{3/2}·E‖D³φ‖² = 6.4195·δ^{3/2}·E‖D³φ‖² < (13/2)(…).
5. At z = √v·e^{iθ}: ‖D³φ‖² = cos²θ‖T₁‖² + sin²θ‖T₂‖², ‖T₁‖² = (6h′ + 24vh″ + 8v²h‴)² + 3(2h′ + 4vh″)²,
   ‖T₂‖² = (6h′)² + 3(2h′ + 4vh″)². Their maximum is D_h².

In terms of Γ(r) = r·h(r²) and ψ = Γ/r: 6h′ + 24vh″ + 8v²h‴ = Γ‴(r), 2h′ + 4vh″ = ψ″(r), 6h′ = 3ψ′(r)/r.

### 4.2 Scaling

Both sides scale alike under q → λq. Against the needed δ·Ω̂ the theorem reads

    ‖c[h]‖² ≤ C·√χ·δ·Ω̂[h],     C := (13/2)·u·E D_h²(V)/Ω̂[h],

a dimensionless constant of the profile and the law. It helps only where C·√χ ≤ θ_row: at small χ.
For h(v) = v: D_h² = 48, Ω̂ = 3u/4, C = 416, i.e. 312·δ^{3/2}, against 1.837·δ^{3/2} from Corollary 3 and 0.4703·δ^{3/2}
on the junta. So the generic chain loses a factor 170 against its own corollary and 660 against the truth.

### 4.3 The cutoffs on the six rows (N)

**How the derivatives were computed.** Not from the tables. Γ_X(r) = 2 Re E[w_X·ph(L′ + rD)] has one vortex, at the
real zero z₀(r) of L′ + rD. In polar coordinates centred at z₀(r) the integrand is smooth in the coordinates and in
r, so Γ, Γ′, Γ″, Γ‴ are obtained by Taylor-mode differentiation of the integrand (`scripts/prof_jets.py`).
- Two quadrature rules agree to 10⁻¹⁴ at every order; the Taylor-mode derivatives agree with differences of my
  own values; my Γ agrees with the tables to 8·10⁻⁵ (their stated accuracy).
- At r = 0 the even Taylor coefficients vanish to 10⁻¹⁵ and the odd ones are, at t = 0.84, tilted A:
  Γ = −0.46174r + 2.39803r³ − 4.94880r⁵ + 9.79993r⁷; so h is smooth in v at 0 with h′(0) = 2.398 (A), 1.078 (B).
  The tables do not resolve this: a fit of the table on s ≤ 0.02 gives the wrong sign for the cubic term.
- Ω̂ from these profiles agrees with Ω̂ from the tables to 2·10⁻⁴ (`logs/crosscheck_omega.log`).
The cutoffs below are therefore reliable as numbers to three digits. They are **N**, and they scale as θ², so the
numerical thresholds of 4.19 enter squared.

**Exponential law of V** (the Gaussian limit χ → 0), both tilted profiles, u/u* ∈ {0.5, 0.75, 1, 1.3}:

| row | θ needed | C (range over profiles and energies) | χ_cut at u/u* = 0.5 | 0.75 | 1 | 1.3 | **row cutoff** | with the linear split | the test (10) | true constant on the spike family, χ → 0 |
|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.37 | 669–1235 | 2.9·10⁻⁷ | 2.0·10⁻⁷ | 1.4·10⁻⁷ | 9.0·10⁻⁸ | **9.0·10⁻⁸** | 1.5·10⁻⁷ | 1.3·10⁻⁸ | 0.46–0.58 |
| 0.82 | 0.64 | 602–979 | 1.1·10⁻⁶ | 8.0·10⁻⁷ | 5.9·10⁻⁷ | 4.3·10⁻⁷ | **4.3·10⁻⁷** | 1.0·10⁻⁶ | 9.0·10⁻⁸ | 0.51–0.60 |
| 0.84 | 1.33 | 540–772 | 5.9·10⁻⁶ | 4.7·10⁻⁶ | 3.8·10⁻⁶ | 3.0·10⁻⁶ | **3.0·10⁻⁶** | 1.3·10⁻⁵ | 9.2·10⁻⁷ | 0.55–0.61 |
| 0.845 | 1.88 | 525–726 | 1.3·10⁻⁵ | 1.0·10⁻⁵ | 8.4·10⁻⁶ | 6.7·10⁻⁶ | **6.7·10⁻⁶** | 3.6·10⁻⁵ | 2.3·10⁻⁶ | 0.57–0.61 |
| 0.85 | 2.50 | 511–683 | 2.4·10⁻⁵ | 2.0·10⁻⁵ | 1.6·10⁻⁵ | 1.3·10⁻⁵ | **1.3·10⁻⁵** | 9.2·10⁻⁵ | 5.1·10⁻⁶ | 0.58–0.62 |
| 0.855 | 3.70 | 497–642 | 5.5·10⁻⁵ | 4.6·10⁻⁵ | 4.0·10⁻⁵ | 3.3·10⁻⁵ | **3.3·10⁻⁵** | 3.1·10⁻⁴ | 1.4·10⁻⁵ | 0.59–0.62 |

- χ_cut = (θ/C)², the smaller of the two profiles; the row cutoff is the smallest over the four energies.
- "Linear split": the remark after Corollary 3, optimised over the slope λ.
- "The test (10)": the package's sufficient test with M₀ = sup D_h² (276 and 56 at t = 0.84) and L₀ = (9/4)sup|g′|.
  The package leaves these evaluations open; they are a factor 2–7 below the row cutoffs.
- Last column: on the spike family the ratio ‖c‖²/(δΩ̂) equals 0.4703·u·(E[τ k′(uτ)])²/Ω̂ · √χ as χ → 0 (exact
  first-order formula; confirmed by the kernels at χ = 10⁻⁶: 0.5795 against 0.5815 at t = 0.84, A, u = u*).

**Laws of actual cubics.** C barely depends on the law at small χ (t = 0.84, A, u = u*; exponential: 668.79):

| law | χ = 10⁻⁶ | 10⁻⁴ | 10⁻² | 0.1 | 1 |
|---|---|---|---|---|---|
| spike family, C | 668.79 | 668.80 | 669.39 | 672.02 | 681.59 |
| spike family, true ratio | 5.8·10⁻⁴ | 5.6·10⁻³ | 0.044 | 0.095 | 0.149 |
| spike family, bound C√χ | 0.67 | 6.7 | 67 | 213 | 682 |
| sum of N = 42/χ independent Wick monomials, C | — | 668.80 | 669.81 | 678.43 | 737.19 |

So the cutoffs from the exponential law are the cutoffs for genuine cubics (at χ ≈ 10⁻⁶ the law is exponential to
six digits). The same holds at t = 0.855 and for profile B (`logs/chi_cutoffs.log`).

### 4.4 The gap, and where the hard families sit

| | χ |
|---|---|
| Theorem 2 covers, per row | ≤ 9·10⁻⁸, 4·10⁻⁷, 3·10⁻⁶, 7·10⁻⁶, 1.3·10⁻⁵, 3·10⁻⁵ |
| spikes c = 0.35, 0.5, 0.7, 0.85 | 0.63, 2.6, 10.1, 21.9 |
| Hermitian basis d = 8; seven and eight rank-one factors | 1.07; 2.29, 2 |
| X(\|Y\|² − 1); H(X) + H(Y); junta | 16; 21; 42 |
| the band of ledger 4.19 | about 2–16 |

- For general cubics the gap is the whole interval from the cutoff to 42 on every row. Theorem 2 and the class
  results do not meet: the classes are structural, not ranges of χ, and the smallest χ of a proved class with
  nonzero content is far above 10⁻⁴ unless d or n is of order 10⁵ (χ ≈ 8/d and 16/n).
- What the form could give with a better constant: C = 2.45 (Corollary 3 at a linear profile) would cover
  χ ≤ 0.023, 0.068, 0.29, 0.59, 1.04, 2.3; the spike family's own C ≈ 0.6 would give 0.38, 1.1, 4.9, 9.8, 17, 38.
  So the δ^{3/2} form is not hopeless at t = 0.84–0.855, but the constant has to improve by three orders of
  magnitude, and the true ratio stops growing like √χ well before χ = 1 (0.149 at χ = 1, not 0.58).
- **Relation to the ledger.** K ledger 6.3.11 already records δ^{3/2} bounds for every cubic with written proofs
  (‖Π₁φ(F)‖₂ ≤ (5/4)‖φ‴‖_∞κ₄(F)^{3/4} for real third-chaos F, and K_Aδ^{3/2}, K_Bδ^{3/2}). In the one-variable
  case the chain of Theorem 2 gives 1.75·κ₄^{3/2}·E[φ‴(F)²] against (25/16)·κ₄^{3/2}·‖φ‴‖²_∞ there. Theorem 2 is the
  complex radial version with the L² norm of the third derivative in the law of V.

---------------------------------------------------------------------------------------------------------------------

## 5. Claim (3): the radius transfer

Taking ρ* ≤ 9359/10000 as proved (as instructed; that packet was not reviewed here). Ledger 4.12: at t = 0 the row
bound is λ₁ρ*², to be ≤ 500/701. Exact: λ₁ ≤ 50,000,000,000/61,401,207,581 = 0.814316; 81/100 leaves
26502185939/7010000000000 = 0.0037806; 82/100 does not pass. With the old radius the cap was 0.78812. This is the
t = 0 constraint alone: whether a game with λ₁ near 0.81 has a larger value and passes the other rows is open, as
`PROOFS.md` §5 says.

## 6. Replay (C)

`node scripts/verify.mjs` in `review/package-copy/` (Node v24.14.0): exit 0, output equal to `results/replay.json`.
It certifies, in exact Gaussian-integer and rational arithmetic:
- two **instances** of (5), Var A = 2 tr J and (2) at h = v, v² (three non-commuting 2×2 factors; two commuting ones);
- the rational comparisons: the radius room; e < 68/25 and (68/25)² < 200/27; 194/525 < 37/100; 137/400 < 7/20;
  605/1644 and the shifted cubic 656, 3011, 539, 22; 30 < (11/2)², 3/8 < (49/80)², 28·(3/8)·(49/80) < 13/2;
  9/2 < (9/4)²; 64·(3/8)³ = 27/8;
- the six row inequalities used for the regularity of the profiles.
These are what the proofs use; the quantified identities are **P**. No floating-point number enters.

---------------------------------------------------------------------------------------------------------------------

## 7. Proposed ledger rows (placeholder numbers)

| ID | Statement | Scope | Status | Source |
|---|---|---|---|---|
| 4.B1 | **The content law on conditionally Gaussian cubics.** For independent standard complex Gaussian blocks X, Y, U, Z, arbitrary complex matrices A_j and holomorphic quadratics F_j: q = Σ_j X_j(Y*A_jY − tr A_j) + Σ_j Z̄_jF_j(U), i.e. every element of H₁,₀(X) ⊗ H₁,₁(Y) ⊕ H₀,₁(Z) ⊗ H₂,₀(U). Given (Y, U), q is a proper Gaussian of variance A; V = Aτ and δ = 2 Var A. With the real factors P_i = Y*H_iY − tr H_i (A_j = H_{2j−1} + iH_{2j}), the content is c_ℝ = E[P·τ·h(Aτ)] = E[τ·k′(Aτ)·{P(A − u) + 2BP}], B_ij = Y*S_ijY, S_ij = (H_iH_j + H_jH_i)/2, and ‖c[h]‖² ≤ θ·δ·Ω̂[h] with θ = (1/3)(1 + 4λ_max(K + 4vvᵀ/u)/(2 tr J + Var D)) ≤ 5/3 (M, R, T, v, J, K the trace matrices of the source), for every real continuous profile of polynomial growth and every energy | genuine cubics, every dimension; the factors may share one block and need not commute. θ ≥ 1/3 always and θ = 5/3 at X(\|Y\|² − 1), where [the Hermitian-factor row of the first package] has 209/126 and the supremum over profiles is 1.547 (**N**). Below the room thresholds of 4.19 at t = 0.845–0.855 on the whole class | **P** (a GPT session of the user; re-derived line by line by a review worker of claude-b9ee; the moment identities by exact quadrature on random non-commuting families); instances **C** (replayed) | SFAC `PROOFS.md` §1; REVIEW §3 |
| 4.B2 | **Two families of 4.B1 below 0.37.** (i) q = Y*NY − tr N with N a d × d matrix of independent standard complex Gaussians (the X_j against an orthonormal Hermitian basis on a shared block): χ = 4(d²(1 + 2d) + d)/d⁴, θ = (1/3)(1 + 2(1 + 7d)/(d²(1 + 2d) + d)), which is 605/1644 at d = 8 and below 37/100 for d ≥ 8. (ii) n independent equal-energy factors X_j(\|Y_j\|² − 1) (χ = 16/n): θ ≤ (23/50 + (227/50)/n)/3, which is 194/525 at n = 7 and 137/400 at n = 8; the signs of the factors are averaged at fixed moduli. Both allow the decoupled bulk of 4.B1 | one cubic per d, resp. per n, up to scale and bulk; every profile and energy. The supremum of the ratio over profiles is 0.040 at d = 8 and 0.202, 0.176 at n = 7, 8; a sharp argument would give 0.37 from d = 3 and n = 4 (**N**). With the row profiles on u/u* ∈ [0.5, 1.3] the ratio is at most 0.036 (d = 8) and 0.15 (n = 7) | **P + C** (same author and reviewer; rational comparisons replayed); the suprema **N** (the reviewer) | SFAC `PROOFS.md` §2, `scripts/verify.mjs`; REVIEW §3 |
| 6.3.B1 | **A three-derivative content bound for every cubic.** For every q ∈ H₂,₁, every dimension, and h real with z·h(\|z\|²) of class C³ with derivatives of polynomial growth: ‖c[h]‖² ≤ (13/2)·δ^{3/2}·E D_h²(V), D_h²(v) = 3(2h′ + 4vh″)² + max{(6h′ + 24vh″ + 8v²h‴)², (6h′)²}. Proof: with Q_i = Re q, Im q = I₃(f_i) and K_i = f_i ⊗₂ f_i, ‖K_i‖_HS ≤ √(3δ/8)/36; three integrations by parts give E[G_eφ(q)] = Σ E[∂_iabφ·{3⟨∇Q_a, A_i∇Q_b⟩ + 18D_{v_ia}Q_b}], whose coefficients have L² norm ≤ 27(√60 + 2√2)‖K‖^{3/2}. Sufficient for the content law at (u, χ): u√χ(26M₀ + 3θL₀) ≤ 3θb, with M₀ = sup D_h², L₀ = (9/4)sup\|(v k′²)′\|, b = E[uτ·k′(uτ)²] | the same order as 6.3.11; new are the radial complex form, the L² norm in the law of V and the constant. As ‖c‖² ≤ C√χ·δΩ̂ it has C = 500–1240 on the six band rows of higher-degree 4.19 (both tilted profiles, u/u* ∈ [0.5, 1.3]) and proves the content law there only for χ ≤ 9·10⁻⁸, 4·10⁻⁷, 3·10⁻⁶, 7·10⁻⁶, 1.3·10⁻⁵, 3·10⁻⁵ (**N**); the sup-norm test gives 2–7 times less. On the spike family the true ratio is 0.46–0.62·√χ as χ → 0 | **P** (same author and reviewer; the identities checked by exact quadrature on nine cubics); the row numbers **N** (the reviewer; profile derivatives from the definitions by Taylor-mode differentiation) | SFAC `PROOFS.md` §§3–4; REVIEW §4 |
| 6.3.B2 (edit of 6.3.12) | the general constant: ‖Π₁,₀(q\|q\|²)‖² ≤ (3√6/4)δ^{3/2} for every cubic now has a written proof: E[G_e(Re q)³] = 324⟨f₁(e,·,·), K₁⟩, the circle average gives E[G_e·Re(q\|q\|²)] = (4/3)·E[G_e(Re q)³], and ‖K₁‖_HS ≤ √(3δ/8)/36 | every cubic. The junta has 0.4703 | general constant **P** (same author and reviewer) in place of **R** | SFAC `PROOFS.md` Corollary 3; REVIEW §2 |
| 4.B3 (edit of 4.12) | with ρ* ≤ 9359/10000 ([the radius row]) the t = 0 constraint λ₁ρ*² ≤ 500/701 allows λ₁ ≤ 50,000,000,000/61,401,207,581 = 0.81431; at λ₁ = 81/100 the t = 0 slack is 0.0037806 | the t = 0 row only; a game with λ₁ near 0.81, its value and its other rows are open | **C** (exact fractions, replayed and recomputed) given the radius row | SFAC `PROOFS.md` §5 |

SFAC = this package; REVIEW = this file.

---------------------------------------------------------------------------------------------------------------------

## 8. Required corrections

1. **The ledger row for the three-derivative bound must carry its numbers.** As proposed ("(10) is sufficient …
   numerical verification remains open") it reads as a usable small-χ criterion. It covers χ ≤ 10⁻⁷–3·10⁻⁵ on
   the rows (§4.3); it should say so and refer to 6.3.11.
2. **The README's "explicit scalar test for a χ-dependent coefficient"** should state the size of that coefficient
   (C ≈ 500–1240, against a true 0.5–0.6 on the spike family).
3. **Families:** each is one cubic per d or per n (up to scale and bulk), not a class; "six rows at every energy"
   means the proved constant is below the six numerical thresholds.
4. **Radius row:** "allows cubic penalty 81/100" must stay "the t = 0 constraint allows"; the game is not re-optimised.
5. **Statuses:** name the author and the reviewer; the proposed "P with exact algebra and comparisons C" is right
   after this review (the algebra replayed covers instances and constants, the identities are **P**).

No correction to a proof or to a constant.

## 9. Suggestions (none blocks)

1. Theorem 1 loses most on diffuse members through (eᵀNP)²/A ≤ ‖Ne‖². Projecting Z_e on functions of V (the sharp
   constant) or at least conditioning on |Y|² in the basis family would remove the floor 1/3.
2. State the class of Theorem 1 intrinsically, as H₁,₀(X) ⊗ H₁,₁(Y) ⊕ H₀,₁(Z) ⊗ H₂,₀(U).
3. Theorem 2: the factor √8 and the bound of all eight coefficients by the same norm lose two orders of magnitude
   at a linear profile (312 against 1.84). A version that separates the mean term (as Corollary 3 does) and
   bounds only the fluctuating part by (9) would be the natural next step; even then C ≈ 2.5 is needed for χ ~ 1
   at t = 0.85–0.855.
4. Record the smoothness of the profiles at 0 (Γ odd and real-analytic in r, h smooth in v): the tables do not
   show it, and it matters for any argument with derivatives. The Taylor coefficients are in
   `review/data/prof_jets_<t>.npz`.

## 10. Not checked

- No Lean. The thresholds θ_needed and u* are taken from the tables (**N**, another author).
- The radius theorem 0.9359 (taken as proved, as instructed).
- The codex-a786 block package (README only).
- The polynomial bounds on the inverse Jacobian at infinity in the regularity paragraph of §4 (the ellipse algebra,
  the row inequalities and the conclusion at 0 were checked).
- (8) was tested on polynomial φ only (degree ≤ 4 in Re q, Im q); for other φ it rests on the hand derivation.
- Sharp constants θ* were computed for the basis family, equal rank-one factors and (first review) single factors;
  not for unequal weights or general shared families.
- Energies outside u/u* ∈ [0.5, 1.3] for the cutoffs.
- The profile tables moved during the review: the worktree named in the request no longer exists, and the same
  files are now at `/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/profiles/`
  (row constants, u* and thresholds identical to those I used).

## 11. Files

All under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-shared-factors-2026-11-16/review/`.

| file | content |
|---|---|
| `package-copy/`, `logs/manifest_check.log`, `logs/verify.log` | the scratch copy and the replay |
| `scripts/prof_jets.py`, `test_prof_jets.py`, `build_profiles.py`; `data/prof_jets_<t>.npz`; `logs/test_prof_jets.log`, `logs/build_profiles.log` | the profiles and their derivatives from the definitions (310 radii per row, Taylor coefficients at 0) |
| `scripts/proflib.py`, `siglib.py` | helpers (profiles as functions; quadrature and the spike-family kernels of the first review) |
| `scripts/chi_cutoffs.py`, `logs/chi_cutoffs.log`, `data/chi_cutoffs.json`, `logs/tables_for_review.txt` | §4.3 |
| `scripts/crosscheck_omega.py`, `logs/crosscheck_omega.log` | Ω̂ against the tables; E D_h² by two rules |
| `scripts/thm2_check.py`, `logs/thm2_check.log` | Theorem 2 and Corollary 3 on nine cubics |
| `scripts/thm1_check.py`, `logs/thm1_check.log`, `data/thm1_check.json`; `scripts/shared_example.py`, `logs/shared_example.log`; `scripts/basis_sharp_scan.py`, `logs/basis_sharp_scan.log` | Theorem 1, its families, sharp constants |
| `scripts/arith_check.py`, `logs/arith_check.log` | the rational claims |
