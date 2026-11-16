<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/REVIEW.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Review of codex-91d4's "Nourdin–Peccati joint refinement"

*Reviewer: a review worker of **claude-b9ee** (independent session), 16 November 2026. Refs #436.
Nothing was posted on GitHub, committed, or written into the package.*

**Package reviewed** (read-only):
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/`

| file | SHA-256 (as reviewed) |
|---|---|
| `PROOF_NOTES.md` | `6b56d0ce9bc86dce09dcebf808f089d6e3ef13066b4b89e062f1f2e5b0eae308` |
| `REPORT.md` | `fddf99d21ab9394e47e4a58400b20de608bc71e8fe9888031c35611bc42ac73a` |
| `algebra.py` | `c65da4093fb31c73b5a29a14c69ebb3b63fd861cdb3507ae4d33bfeff84867ff` |
| `verify_parity.py` | `0ea3628f54efb88f1ea7d139ff14b4740ddace187d5142a349c322ef9b5dcb3c` |
| `verify_reference.py` | `5382c1506fd26a4c9ef96bea44dbbd8cc75456159f0b4563d7108336b4e03b9b` |
| `verify_budget.py` | `ef1a9d1f0895c19003b04159f823cbbc4bc63236249831389a26c99e43dd9390` |
| `phase0.py` | `1d944604472762f4da4b90577d1417acb89f811806654edfba9f2d013265d3aa` |
| `replay.py` | `19f6f5f5a210b113cbb374201ccc06fc3ddf31769a5525667d3cb57ce51e1643` |

All 23 hashes of `MANIFEST.json` match (checked with my own code, not with `replay.py`).

Labels are those of `/Users/alingalatan/workspaces/grothe/research/conjecture-K/STATUS.md` §0.

---

## 0. Verdict

**Sound as stated. I found no mathematical error and no gap.**

- **P.** I re-derived every statement of `PROOF_NOTES.md` on paper, including the inherited inputs. All are correct,
  with the stated hypotheses and domains (section 2 below).
- **C.** The four checkers pass on python-flint 0.8.0 and their outputs are byte-identical to the delivered ones. All
  fourteen rejection controls fail with their expected text. Each checker certifies the inequality that the proof
  uses (section 3).
- **Independent checks** agree: the eight prices by a Bessel-free quadrature of their definitions, by mpmath and by my
  own Arb code; a second rigorous certificate of (Prices) on the whole interval; a rigorous bound for the maximum over W that does not use concavity;
  exact algebra with my own code; a numerical test of the exact interpolation derivative (to 10⁻¹²) and of the
  comparison on shared non-Gaussian cubics (section 4).
- **Scope.** The result table and the limitations paragraph are supported as worded. One record and one description
  of the controls need correcting; neither touches a theorem (sections 5 and 6).

Proposed status: **P + C** (codex-91d4; re-derived and replayed by a review worker of claude-b9ee).

---

## 1. Replay (C)

**Where and how.** Droplet `big`, `/root/venv/bin/python` (Python 3.12.3, python-flint 0.8.0), in a new folder
`/root/claude-b9ee-np-review`, 16 November 2026, 14:49–14:50 (Bucharest). Only the five runtime scripts and `replay.py`
were copied; their hashes on the droplet equal the table above. I read all six before running anything.
`replay.py` cannot run from those six files alone (it checks `MANIFEST.json` over every packet file), so I used my own
driver, one process at a time, with `-I -B`, the scripts read-only and the working directory elsewhere:
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/replay_big/driver.sh`.
Logs: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/replay_big/logs/`.
The folder on the droplet was deleted afterwards (and again after a second short session, section 4.2).

**Checkers.**

| run | exit | time | against the delivered `replay_runs/codex-91d4-clean-replay/` |
|---|---|---|---|
| `algebra.py` | 0 | 1.4 s | log and `algebra_result.json` byte-identical |
| `verify_parity.py` | 0 | 0.7 s | byte-identical |
| `verify_reference.py` | 0 | 15.0 s | byte-identical (also equal to `reference_initial.log`) |
| `verify_budget.py` | 0 | 0.4 s | byte-identical (also equal to `budget_initial.log`) |
| `phase0.py` (N) | 0 | 0.2 s | equal except three floats in the 16th digit (other libm); not acceptance data |

The delivered replay folder agrees with its own `RECEIPT.json` (29 output hashes), and my eight deterministic outputs
(four logs, four result files) have the hashes recorded there.

**Rejection controls.** All fourteen exit 1 with the same final exception line as in the delivered logs.

| control | what fails | is that the stated reason? |
|---|---|---|
| `-O` × 4 | `RuntimeError: Assertions must be enabled` at the import guard of each script | yes |
| `algebra.py --reject-omit-mixed` | interpolation identity at degree 3 | yes. Degree 2 cannot see Γ (constant second derivative, EΓ = 0); degree 3 is the first that can |
| `algebra.py --reject-omit-nu-channel` | interpolation identity at degree 4 | yes. At degree 3 the shift multiplies E[operator] = 0; degree 4 is the first that sees it |
| `algebra.py --reject-wrong-kurtosis` | `real_k4 == used_factor*delta` | yes, but the block is a **constant guard**: `real_fourth` is *defined* as (3/8)·176, so the assertion tests (3/8)X − 3(u/2)² = (3/8)(X − 2u²), not E(Re q₀)⁴ computed from the polynomial |
| `verify_parity.py --reject-wrong-parity` | `invert(G2)==G2` | yes (Γ₂ is odd) |
| `verify_parity.py --reject-sum-for-difference` | pairing with the sum of the kernels | yes (the sum pairs to 0 by parity, the true value is not 0) |
| `verify_parity.py --reject-range-factor` | `assert Q(1,2)<=factor` with factor 1/3 | yes, but a **constant guard**: nothing about a centred variable is computed |
| `verify_reference.py --reject-price` | cap J_O < 1 at cell 0: enclosure `[1.01 +/- 2.35e-3]` | yes, and it is J_O that fails, in the first cell |
| `verify_budget.py --reject-large-chi` | bracket test at χ = 10⁻⁷ | yes (the stationary point leaves the bracket; it does not test the budget itself) |
| `verify_budget.py --reject-double-odd-credit` | `assert go>=go+go/2` | yes, but a **constant guard** (0.135 ≥ 0.2025) |
| `verify_budget.py --reject-false-core-cost` | determinant with core cost 0.22 | yes: a₀, b₀ > 0.22 still hold, the determinant is negative |

So: 4 guards against `-O`, 7 computed controls, 3 constant guards. None fails for an unrelated reason.

---

## 2. Re-derivation of `PROOF_NOTES.md` (P)

Notation as in the notes. Line numbers refer to `PROOF_NOTES.md`.

### 2.1 Per statement

| # | statement (lines) | verdict | remarks |
|---|---|---|---|
| 1 | Reduction of the two norms to (π/2)·E[\|A+B₁+B₂+c_ν+ℓ\| + \|A+B₁+B₂+c_ν−ℓ\|]; v = u/2; κ₄(A) = 3δ/8 (79–94) | **correct** | Visible parity uses that K is even and O odd in z₁. Remote inversion and the global phase use only the charges (q, r_A, r_B: 1; Q: 0; P: 2). For T_trial(q_G) the same steps need q_G symmetric, circular and independent, which it is. Circularity of q gives E A² = u/2 and κ₄ = (3/8)E\|q\|⁴ − 3u²/4 at every θ. Monte-Carlo control of the unreduced trial: 4.6 |
| 2 | Exact interpolation (I) (96–122) | **correct** (inherited, KPQ (2)–(4)) | F′(t) = ½E[(τ − v + Γ/√t)ψ″]: Gaussian integration by parts in N_v, and E[A g] = E⟨DA, Dg⟩/3 for a pure third chaos. The smoothing limit is dominated by (\|τ − v\| + \|Γ\|/√t)·K_max. Numerically confirmed to 10⁻¹² (4.4) |
| 3 | κ = 1296‖f⊗₂f‖² + 1944‖sym(f⊗₁f)‖²; Var τ = 288… + 216… ≤ 2κ/9; Γ₁ = I₂(f⊗₁g); Γ₂ = 2I₃(sym(f⊗₁h)) + 4I₁(f⊗₂h) (124–134) | **correct** | Equal to the book's (5.2.3), (5.2.5) at q = 3 and to the chaos expansion of ⟨DF, DG⟩ in the proof of Lemma 6.2.1 at (p, q) = (1, 3), (2, 3). Exact check with my own code (4.3) |
| 4 | (C): EΓ₁² ≤ √κ·w₁/18, EΓ₂² ≤ √κ·5w₂/9 (136–148) | **correct** | EΓ₁² = 2‖f⊗₁g‖² ≤ 2‖g‖²‖f⊗₂f‖; EΓ₂² = 24‖sym(f⊗₁h)‖² + 16‖f⊗₂h‖² ≤ 40‖h‖²‖f⊗₂f‖; ‖f⊗₂f‖ ≤ √κ/36. See 2.2 on the book |
| 5 | E[AB²] = 2E[ΓB], E[AB³] = 3E[ΓB²] (150–154) | **correct** | the same Stein identity with g = B², B³ |
| 6 | (H): \|E Y K_t\| ≤ (K_max/2)E\|Y\| for Y = τ − v, Γ₁ (158–167) | **correct** | needs only 0 ≤ K_t ≤ K_max and E Y = 0; Eτ = v, EΓ₁ = E[AB₁] = 0 |
| 7 | (P): E Γ₂K_t(U+V₂) = ½E Γ₂[K_t(U+V₂) − K_t(U−V₂)] (169–176) | **correct** | at fixed (T, θ, t): the remote measure is invariant under x → −x; A, B₁, Γ₂ odd; B₂, c_ν even; K_t even because the two terms ±ℓ are paired |
| 8 | (P2) (178–191) | **correct** | half the difference is at most K_max/2 and at most \|V₂\|·‖K_t′‖_∞ = 4\|V₂\|/(√(2πe)λ); Cauchy–Schwarz, and ‖min(a, b\|V₂\|)‖₂ ≤ min(a, b‖V₂‖₂); E V₂² = w₂ + c_ν² needs only E B₂ = 0 |
| 9 | ∫₀¹ t^{−1/2}min((1−t)^{−1/2}, r/(1−t))dt = F(r); (D) (195–209) | **correct** | the derivative branch on t < 1 − r² gives 2r·artanh√(1−r²), the range branch 2arcsin r; F′ = 2artanh√(1−r²), F″ = −2/(r√(1−r²)). The notes say "increasing": F is nondecreasing (constant π for r ≥ 1) |
| 10 | x ↦ F(k√x)² concave; (J) (211–226) | **correct** | the sign expression equals −2arcsin(r)F′ − 2F/√(1−r²) ≤ 0; C¹ at r = 1 (both slopes 0), continuous at 0. Cauchy–Schwarz, then Jensen in (T, θ) |
| 11 | E w₁ = H₁, E w₂ = o/2, E c_ν² = n/2 (228–232) | **correct** | E(T − 2/5)² = 34/25, E(T − 2/5) = 3/5, E T² = 2, E T(T−2)² = 2; E[r_A r_B] = E[r_B²] = E[Q·conj P] = 0 by charge. Exact check: 4.3 |
| 12 | (Rnew) assembled from 2, 4, 6–11: its three coefficients (36–41, 234–247) | **correct** | √(πuχ/12); ½(π⁶/864)^{1/4} = 0.5135307; C = √(5π)/(2^{9/4}3^{3/4}) = 0.3655119; argument 2√(W/(eu)). Symbolic check: 4.5 |
| 13 | Two-sign inequality and its average (¾)M·E\|D\|² − (¼)J·Re E D² (251–261) | **correct** (inherited, KPQ `ANISOTROPIC_REFERENCE.md` §2) | with α + β = 1: x²/2 + y² − 2(λ−1) = α(λ−2)²/2 + β(λ−1)². The average uses the conjugation symmetry of X = l + q_G and its independence of D |
| 14 | Sector prices: P pays 3M/4, Q and ν at most (3M + J)/4 (263–272) | **correct** | E P² = E QP = 0, \|E Q²\| ≤ x; cross terms with D₁ vanish by chaos order. E Q² ≠ 0 does occur (4.3), so the J term is needed for Q |
| 15 | (Bessel): M = √(π/u)e^{−z}I₀(z), J = √(π/u)e^{−z}I₁(z), 0 ≤ J ≤ M < 9 (274–286) | **correct** | I derived both directly (polar integral, ∫₀^∞e^{−αr²}I_ν(βr)dr) and from the Laplace formula; M < 9 needs u > π/81, true on the interval. 30-digit agreement with the definitions: 4.1 |
| 16 | \|∂_u M\|, \|∂_u J\| ≤ √π/(2u^{3/2}) < 111 (288–291) | **correct** | ∂_u[√(π/u)g_k(z)] = −√π·u^{−3/2}·E_θ[e^{−x}(½ − x)cos kθ], and \|(½ − x)e^{−x}\| ≤ ½. The cap is attained at T = 0; 110.78 at u = 0.04 |
| 17 | (Prices) (293–311) | **C replayed**; correct | see 3 and 4.1, 4.2 |
| 18 | A/B form −a₀E_A − b₀E_B + C_AB·Re ζ; \|C_AB\| < 0.082; cost ≥ 0.215V; odd costs 0.135, 0.135, 0.345; (Gnew) (318–332) | **correct** | from the caps: a₀ ≥ 0.222552, b₀ ≥ 0.571407, C_AB ∈ (0.076084, 0.081768), smallest eigenvalue 0.2178; Q cost 0.135052 (margin 5·10⁻⁵), P cost 0.388, ν cost 0.346552. Base: B(u) − pu ≤ S by the definition of S (ledger 3.14) |
| 19 | (E) and its constants 0.104, 0.515 (57–62) | **correct** | 0.104 needs u ≤ 0.041; the reference needs u ∈ [0.040, 0.041] |
| 20 | H₁ ≤ 0.73V; (Y); c₀ < 0.353 (336–345) | **correct** | largest eigenvalue of the H₁ form: 0.72596; c₀ = 1098937/3120000 = 0.3522234 |
| 21 | W ↦ √W·F(c√W) concave; bracket; < 97·10⁻⁶ (347–365) | **correct**, C replayed | sign expression −2r/√(1−r²) − 2arcsin r < 0; slopes match at r = 1 (πc/2). The checker certifies g′(w_l) > 0 > g′(w_h). Confirmed without concavity: 4.2 |
| 22 | Hard tuple, χ ≤ 10⁻⁶: < S + 40·10⁻⁶ (369–372) | **correct**, C replayed | \|ζ\| ≤ √(E_AE_B) = 0.004 exactly; value 39.0727·10⁻⁶ |
| 23 | Region III, χ ≤ 10⁻⁵: < S (374–379) | **correct**, C replayed | value −585.546·10⁻⁶; the box and the hard tuple satisfy the response ellipsoid of ledger 2.12b and the total cap 0.080051 |
| 24 | Scope statements (43–46, 73–75, 381–386) | **correct** | see section 5 |

### 2.2 The book's Lemma 6.2.1

Statement in the book (pp. 120–121, checked in the text layer): for F = I_p(f), G = I_q(g) with symmetric kernels,
p, q ≥ 1, and a real α, bounds (6.2.1) (p = q) and (6.2.2) (p < q) for E[(α − ⟨DF, DG⟩/q)²]. There is no hypothesis
of independence or disjoint support. The proof gives the chaos expansion
⟨DF, DG⟩ = pq·Σ_{r=1}^{p∧q}(r−1)!·C(p−1, r−1)C(q−1, r−1)·I_{p+q−2r}(f ⊗̃_r g), the exact second moment (6.2.3) that follows from
it, and the inequalities (6.2.4), (6.2.5).

How the package uses it, and whether that is legitimate:

- **Parity.** By the expansion, ⟨DF, DG⟩ lives in the chaoses p + q − 2r, all of parity p + q. With q = 3: p = 1 gives the
  second chaos (even), p = 2 gives the third and first (odd). That is the parity the proof needs. **Legitimate.**
- **Constants.** The package does **not** use the displayed bound (6.2.2). For (p, q) = (2, 3) that bound is
  16‖h‖²‖f⊗₁f‖ + 12(‖h⊗₁h‖² + ‖f⊗₂f‖²); its last step (2ab ≤ a² + b²) is not homogeneous and gives no bound of the
  form √κ·w₂. The package uses (6.2.3) with the Cauchy–Schwarz lines of (6.2.4), (6.2.5), then ‖h⊗₁h‖ ≤ ‖h‖². For
  (p, q) = (1, 3) its bound coincides with (6.2.2). **Legitimate**; `PROOF_NOTES.md` line 146 ("Lemma 6.2.1
  specialized") should say "the identity (6.2.3) and the first two inequalities of (6.2.4), (6.2.5) in its proof".
- **‖f⊗₂f‖ ≤ √κ/36** is twice as strong as the book's general bound ‖f⊗_r f‖² ≤ (r!²(q−r)!²/q!⁴)κ₄ (which gives √κ/18).
  It is correct: by (5.2.6) with ‖f⊗₁f‖ = ‖f⊗₂f‖ and f⊗₂f symmetric, κ₄ ≥ 324(1 + 1 + 2)‖f⊗₂f‖². I checked it exactly.

### 2.3 Hypotheses

- **Sharing.** No step uses independence among q, r_A, r_B, Q, P. Only q_G and the interpolation variable N_v are
  independent of the rest, by construction.
- **Non-diffuse Q, P.** They enter through w₂ = E B₂² and the bound ‖h⊗₁h‖ ≤ ‖h‖² only. No fourth moment, no
  contraction smallness, no density of Q or P is used.
- **Circularity** is used in four places: v = u/2 and κ₄(A) = 3δ/8 at every angle; the removal of the visible phase;
  the angular averages of w₁, w₂, c_ν²; and the vanishing of E P², E QP, E[r_A r_B] in the reference.
- **Integrability.** t^{−1/2} at 0; at 1 the range bound (1−t)^{−1/2}. The derivative bound alone would give (1−t)^{−1};
  the minimum removes it. Every exchange of E_{T,θ}, ∫dt and the remote expectation is of an absolutely integrable
  function.
- **Domains.** (Rnew): all u > 0, χ ≥ 0, all amplitudes, ≤ (not strict). (Gnew), (E) and the three consequences:
  u ∈ [0.040, 0.041], all V, o, n ≥ 0. The three consequences are strict because the certified enclosures are
  strictly below the stated numbers.

---

## 3. What each checker certifies

**`algebra.py`** — exact rational arithmetic, one sample in two real coordinates (unchanged copy of the reviewed
`partial-q-replacement/verify_interpolation.py`; `cmp` confirms). It asserts the κ₄ and Var τ formulas, the chaos
decompositions and second moments of Γ₁, Γ₂, E Γ² ≤ √κ(w₁ + 10w₂)/18, two nonzero mixed moments, the interpolation
derivative for the paired powers (s + shift ± ℓ)^n, n = 2…8, at √t = 3/5, and a constant identity for the circular
kurtosis. The proof uses these identities in every dimension; the script is a sample check, as it says. It checks
the two bounds of (C) only through their sum; my own exact check covers them separately (4.3).

**`verify_parity.py`** — exact rational arithmetic, one sample. It asserts Γ₁ even, Γ₂ odd, means zero, and (P) for the
even polynomial kernels s², s⁴, s⁶ with V = B₂ + c_ν containing both ν components, with a nonzero value. The proof's
(P) is for the Gaussian kernel, by the same parity argument (P). The remaining assertions compare constants.

**`verify_reference.py`** — outward (Arb balls, 128 bits). For each of 50 cell centres u_c = 0.04001, …, 0.04099 and
k = 0…3 it encloses ∫₀⁶⁴T^k e^{−T}e^{−z}I_ν(z)dT (ν = 0, 1; z = T(a + bT)²/(2u_c)) by rigorous quadrature of an entire
integrand, multiplies by √(π/u_c), and adds the tail ball [0, 9e^{−64}k!Σ_{j≤k}64^j/j!] before forming signed
combinations. It then adds ±(111·10⁻⁵)·(absolute weight) for the cell and asserts the eight upper and three lower caps
with certain comparisons. With statements 15 and 16 this is exactly (Prices) for every u ∈ [0.040, 0.041].
I confirmed the convention `bessel_i(n, scaled=True)` = e^{−z}I_n(z) at seven real and complex points, against the
unscaled function and against the angular integral (`rev_arb_prices.py`, 4.1).
The printed per-cell values have two digits only (a ball is printed with its radius), so the log does not let a
reader compare values; the assertions are on the full balls.

**`verify_budget.py`** — exact rationals for: a₀, b₀ > 0.215 and 4(a₀ − 0.215)(b₀ − 0.215) > 0.082² (the cost 0.215V
for every covariance, given the caps); the three odd costs; H₁ ≤ 0.73V (same 2×2 test); the allocation
0.215 = 0.195 + 0.02 and 0.345 − 0.135 > 0.2; c₀ < 0.353; the caps. Arb balls for: √(π·0.041/12) < 0.104,
½(π⁶/864)^{1/4} < 0.515; the signs of the derivative of C·χ^{1/4}√W·F(c√W) − 0.135W at W = 17273·10⁻⁷ and
17275·10⁻⁷ for χ = 2·10⁻⁸, c = 2/√(0.04e); the bound (value at the right end minus the linear term at the left);
the hard tuple; region III. These are the inequalities of sections 6 and 7 of the notes. Concavity itself is not
checked by the script (the report says so); it is statement 21, and 4.2 gives a bound that does not need it.

---

## 4. Independent checks

Scripts: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/scripts/`;
logs: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/logs/` (laptop,
`/usr/local/bin/python3 -I`, numpy 2.3.5, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0) and
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/arb_big/` (droplet, python-flint 0.8.0).

### 4.1 The eight prices at three energies (`rev_prices.py`, `rev_arb_prices.py`)

Three methods: (a) the closed forms integrated with mpmath at 30 digits; (b) a three-dimensional quadrature of the
**definitions** M = E\|l + q_G\|⁻¹ and J = E[cos(2·arg X)/\|X\|] in polar coordinates, with no Bessel function;
(c) my own Arb code (192 bits, other segmentation, limit 80). (a) and (c) agree to 22 digits, (b) to 3·10⁻¹⁵.
Pointwise, the closed forms agree with the definitions (polar integral and Laplace integral) to 10⁻³⁰ at twelve (T, u).

| price | u = 0.040 | u = 0.0405 | u = 0.041 | cap(s) |
|---|---|---|---|---|
| I_A | 0.983614475837 | 0.983293625402 | 0.982976882752 | < 0.986 |
| I_B | 1.020438582439 | 1.020398599676 | 1.020359121602 | < 1.022 |
| I_O | 1.242749954636 | 1.243118587599 | 1.243483089811 | < 1.245 |
| I_N | 1.048556205669 | 1.048792663693 | 1.049022216685 | < 1.051 |
| I_C | 0.184482953681 | 0.185758130579 | 0.187025716543 | (0.182, 0.189) |
| J_O | 1.011273314812 | 1.009460151860 | 1.007655497566 | (1.006, 1.013) |
| J_N | 0.746946736832 | 0.744829597983 | 0.742728070051 | < 0.749 |
| K | 0.738637590936 | 0.738446496768 | 0.738253346123 | (0.736, 0.741) |

They equal codex-a7c4's floating values. The derivative cap holds on a grid of 88 000 points (ratio ≤ 1, attained at
T = 0). All 50 cells recomputed in floating point pass with margins ≥ 3.5·10⁻⁴ (I_B), 3.7·10⁻⁴ (K, lower), 4.1·10⁻⁴ (I_O).

### 4.2 Two rigorous checks of my own (Arb, on the droplet)

**(Prices) on the whole interval by a second route** (`rev_arb_taylor.py`, 9 s). Ten cells of radius r = 5·10⁻⁵;
P(u) ∈ P(u_c) + [−r, r]·P′(u_c) + [−1, 1]·(r²/2)·C₂·(absolute weight). P′(u_c) is computed by rigorous quadrature of
the entire derivative integrand. C₂ = (¾)√π/0.04^{5/2} is a second-derivative cap that I derived
(∂²_u[√π·s^{1/2}e^{−x}] = √π·s^{5/2}e^{−x}(x² − 3x + ¾) with s = 1/u, and \|e^{−x}(x² − 3x + ¾)\| ≤ ¾; checked numerically
in `rev_d2cap.py`). The first-derivative cap 111 is not used for the cells. Result, for every u ∈ [0.040, 0.041]:

| | certified range | | certified range |
|---|---|---|---|
| I_A | [0.98296980, 0.98362152] | I_C | [0.18447572, 0.18703303] |
| I_B | [1.0203534, 1.0204443] | J_O | [1.0076502, 1.0112785] |
| I_O | [1.2427447, 1.2434884] | J_N | [0.74272280, 0.74695186] |
| I_N | [1.0485510, 1.0490275] | K | [0.73824454, 0.73864642] |

All inside the caps of (Prices). (A first attempt, with u entered as a ball in the integrand, was stopped: Arb's
scaled Bessel function is slow and loose on wide balls near z ≈ 6. It produced no result and is not used.)

**The maximum over W without concavity** (`rev_arb_budget.py`, 7 s). √W·F(c√W) is nondecreasing, so on a cell
[w₀, w₁] the function is at most C·χ^{1/4}√w₁·F(c√w₁) − 0.135w₀. With 272 000 cells of width 10⁻⁷ on [0, 0.0272], and
the explicit decreasing branch beyond (F = π), the maximum at χ = 2·10⁻⁸ is at most 4.60513·10⁻⁵, in the cell
[0.0017273, 0.0017274]. With c₀√χ the excess is at most **95.8632·10⁻⁶** < 97·10⁻⁶. The author's bracket gives
95.8766·10⁻⁶; the stationary value is 95.8496·10⁻⁶ at W* = 0.00172739 (mpmath). My Arb code also reproduces the hard
tuple (39.0727366446·10⁻⁶) and region III (−585.546154029·10⁻⁶) digit for digit.

### 4.3 Exact algebra with my own code (`rev_contractions.py`)

sympy, expectations from Gaussian moments (no product formula), kernels with all coordinates shared.

- Real sample in dimension 3: every formula of statement 3; the three intermediate contraction inequalities;
  (C) for Γ₁ and Γ₂ separately; parities; the Stein identity E[A·S^k] = k·E[(√t·τ + Γ)S^{k−1}], k ≤ 4, with the shift;
  (P) for the kernels s², s⁴.
- Complex sample in ℂ² (q ∈ H₂,₁ with six terms, χ = 14.1; r_A, r_B, Q, P over both coordinates):
  A = Re(e^{−iθ}q) is orthogonal to every polynomial of degree ≤ 2, E A² = u/2 and κ₄(A) = 3δ/8 at three angles;
  E P² = E QP = E[Q·conj P] = E[r_A r_B] = 0; E Q² ≠ 0 with \|E Q²\| ≤ x; E\|D₁\|², E D₁² as in the notes; E w₁ = H₁.
- Floating search for the largest ratios in dimensions 1 to 4 (**N**): Var τ/κ ≤ 0.1911 (bound 2/9);
  EΓ₁²/(√κ·w₁) ≤ 0.0404 (bound 1/18); EΓ₂²/(√κ·w₂) ≤ 0.351364 = √10/9 (bound 5/9), attained in one dimension.

### 4.4 The exact interpolation derivative on a shared non-Gaussian cubic (`rev_identity.py`)

One complex coordinate Y: q = cY(\|Y\|² − 2) (χ = 42), r_A = αY, r_B = βY, Q = γ(\|Y\|² − 1), P = δY²/√2, ν, generic
phases, hard-tuple energies. At four (T, θ) and t = 0.2, 0.5, 0.8, 0.95, by a 3001² quadrature with N_v integrated in
closed form:

- d/dt E ψ(√t·A + √(1−t)·N_v + B) = ½E[(τ − v + (Γ₁ + Γ₂)/√t)K_t(U_t + V₂)] to at most 2·10⁻¹² (relative 2·10⁻¹⁰);
- (P) holds within 10⁻⁹;
- (H) and (P2) hold with factors 6 to 500 to spare; (C) holds, its three ratios to the bounds lying between 0.09 and 0.71.

This also confirms the normalisation of D in complex coordinates.

### 4.5 Rows of the table and the constants (`rev_rows.py`, `rev_reach.py`)

- F against quadrature of the minimum at nine r (40 digits); F′, F″, F − rF′; both concavity sign expressions
  negative on a grid; second differences nonpositive up to r = 2; the three coefficients of (Rnew) symbolically;
  the two-sign inequality on 200 000 random pairs.
- (J) with the actual profiles w₂(T, θ), c_ν(T, θ) on 4000 random parameter sets (u, x, y, E Q², ν), including
  \|E Q²\| = x: the largest ratio of the two sides is 0.964 (`rev_jensen.py`; **N**).
- From the caps, with exact rationals: a₀, b₀, C_AB, the eigenvalue 0.2178, the odd costs, c₀ (statements 18, 20).
- With the certified caps, as in the proof: row 1: 95.8496·10⁻⁶ (stationary value); row 2: 39.0727·10⁻⁶;
  row 3: −585.546·10⁻⁶. All three as delivered.
- With **my own prices** in place of the caps (the same steps and the same allocation 0.02V, 0.20n; **N**):
  row 1 at χ = 2·10⁻⁸: 90.94, 89.64, 88.39 (·10⁻⁶) at u = 0.040, 0.0405, 0.041; row 2 at χ = 10⁻⁶: −34.5·10⁻⁶;
  row 3 at χ = 10⁻⁵, worst corner: −670·10⁻⁶ and −680·10⁻⁶ at u = 0.040, 0.0405. Each is below the certified value,
  as it must be. The true costs are: core 0.2200–0.2203, Q 0.1372–0.1375, P 0.3894–0.3900, ν 0.3489–0.3496.
- **N**, with the certified constants: the uniform excess reaches 10⁻⁴ at χ = 2.09·10⁻⁸. So 2·10⁻⁸ is the end of this
  method for "every allocation".

### 4.6 The comparison end to end (`rev_comparison.py`, `rev_comparison_extra.py`, `rev_smallchi.py`; N)

T(q) − T(q_G) by deterministic quadrature (resolution error below 3·10⁻⁶), the Gaussian side in closed form.
My S is 1.3739535256615 (ledger 3.14). A Monte-Carlo run of the **unreduced** trial E\|L + G − ξ₀\| + E\|L − G + ξ₀\|
with complex z₁ agrees with the reduced form within 0.9 standard errors (1.42753 ± 0.00054 against 1.42705).

| configuration | χ | T(q) − T(q_G) | (Rnew) | bound/true | T(q_G) − S | (Gnew) |
|---|---|---|---|---|---|---|
| A0: no lower sectors (−D(q)) | 42 | −1.008·10⁻² | 0.666 | 66 | 0 | 0 |
| A1: A/B shells only | 42 | −8.22·10⁻³ | 0.770 | 94 | −0.00531 | −0.00215 |
| A2: odd sectors only | 42 | −1.003·10⁻² | 0.793 | 79 | −0.00396 | −0.00089 |
| A3–A8: all sectors, six phase choices | 42 | −7.1·10⁻³ … −1.24·10⁻² | 0.895–0.905 | 73–127 | −0.0085 … −0.0113 | −0.00304 |
| E1: region III corner | 42 | −7.68·10⁻³ | 0.879 | 114 | −0.01498 | −0.00661 |
| E2: o = 0.1, n = 0.2 (F = π) | 42 | −9.19·10⁻³ | 1.683 | 183 | −0.1919 | −0.0840 |
| E3–E5: Q and ν aligned, opposed, orthogonal | 42 | −1.03·10⁻² … −1.18·10⁻² | 0.842 | 72–82 | −0.017 … −0.021 | −0.00537 |
| C1: q = cY₁²·conj(Y₂), all sectors over both coordinates | 10 | −5.61·10⁻³ | 0.488 | 87 | −0.00959 | −0.00304 |

(A: one shared coordinate, hard-tuple energies unless stated, u = 0.0403448; E: u = 0.0405.) In every test the
comparison and the reference bound hold, and **T(q) − T(q_G) is negative**: the two-sided bound cannot use that sign.
The mixed part alone (lower sectors on, minus off) is 60 to 120 times below the linear plus quadratic terms.

**Small χ, with a mixed term of the extremal order χ^{1/4}** (`rev_smallchi.py`; N). This is the regime in which the
package applies the comparison. Take q = α·cY₁(\|Y₁\|² − 2) + β·g, α² + β² = 1, g an independent proper Gaussian. It is
the limit m → ∞ of the genuine cubics q_m = α·c·q₀(Y₁) + β·c·m^{−1/2}Σ_{j=2}^{m+1}q₀(Y_j) (one heavy block, m light ones),
with χ = 42α⁴, and all lower sectors share Y₁. The Gaussian part is integrated in closed form, so the difference is a
smooth integral (three resolutions agree to seven digits, `logs/rev_smallchi_convergence.log`). Four configurations (hard tuple with three choices of phases and signs; region III corner),
χ = 30, 1, 10⁻², 10⁻⁴, 10⁻⁵, 10⁻⁶, 2·10⁻⁸:

| χ | T(q) − T(q_G), four configurations | (Rnew), hard tuple | bound/true |
|---|---|---|---|
| 30 | −6.1·10⁻³, −9.2·10⁻³, −5.2·10⁻³, −5.7·10⁻³ | 0.78 | 84–150 |
| 10⁻² | +6.7·10⁻⁵, −4.3·10⁻⁵, +2.3·10⁻⁴, +5.9·10⁻⁵ | 3.9·10⁻² | 175–899 |
| 10⁻⁴ | +1.5·10⁻⁵, −1.1·10⁻⁵, +6.2·10⁻⁵, +1.1·10⁻⁵ | 1.0·10⁻² | 167–924 |
| 10⁻⁶ | +4.2·10⁻⁶, −3.8·10⁻⁶, +1.8·10⁻⁵, +2.7·10⁻⁶ | 3.0·10⁻³ | 169–1002 |
| 2·10⁻⁸ | +1.5·10⁻⁶, −1.5·10⁻⁶, +6.7·10⁻⁶, +9.5·10⁻⁷ | 1.1·10⁻³ | 169–1058 |

For small χ the difference is κ₁·χ^{1/4} with κ₁ = +1.3·10⁻⁴, −1.2·10⁻⁴, +5.6·10⁻⁴, +0.8·10⁻⁴: the power χ^{1/4} is
**attained**, with either sign (it follows the sign of the shells), so here T(q) can exceed T(q_G). The bound holds
with a factor of at least 167 for χ ≤ 10⁻², and T(q) − S stays between −0.009 and −0.021 in all rows. So the power
χ^{1/4} of the comparison is right; its constant is what is far from the truth.

---

## 5. Scope: is each statement supported as worded?

**Result table of `REPORT.md` (lines 46–50).**

| statement | supported? |
|---|---|
| Row 1: χ ≤ 2·10⁻⁸ ⇒ T_trial < S + 97·10⁻⁶ − 0.02V − 0.20n, "every lower allocation and covariance" | **yes**, for u ∈ [0.040, 0.041], the fixed ξ₀, c = 0, genuine sectors; all E_A, E_B, ζ, x, y, ν, all sharing. Strict (enclosure 95.877·10⁻⁶) |
| Row 2: old hard energies, χ ≤ 10⁻⁶ ⇒ < S + 40·10⁻⁶, "covariance arbitrary" | **yes**; strict (39.073·10⁻⁶) |
| Row 3: region III, χ ≤ 10⁻⁵ ⇒ < S | **yes**; the proof gives < S − 585.5·10⁻⁶ |
| "Previous cutoff" 2.5·10⁻¹¹, 2.5·10⁻⁹, 10⁻⁷ and the factors 800, 400, 100 | the cutoffs are right; they belong to **different certified levels** (before: S + 94·10⁻⁶, S + 90·10⁻⁶, S − 200·10⁻⁶). The new statements are stronger in each case; see 6, S1 |

**Other sentences.**

- "Every displayed upper bound is strict": yes.
- "The first result actually has no lower-amplitude restriction": yes. Neither (Rnew) nor (Gnew) uses a cap on
  V, o or n; the Young step holds for all V ≥ 0 and the maximum is over all W ≥ 0.
- "Q/P need not be diffuse, and every sector may share coordinates": yes (2.3).
- "(Rnew) holds at all positive u and all amplitudes, though the certified reference prices are restricted to
  [.040, .041]": yes.
- "No formal cumulant truncation or scalar covariance-sign assumption. Both nu channels remain in the kernel
  difference": yes; c_ν is part of V₂.
- "It is a small-chi result near u-star, not a general large-W or compact(P) cover"; "The original response caps do
  not force small chi": yes. For scale: χ ≤ 2·10⁻⁸ means, for replicated blocks Y(\|Y\|² − 2), at least 2.1·10⁹ blocks;
  the caps allow χ = 42.
- "codex-a7c4 separately re-derived proof sections 2–6 …": the receipt names another `PROOF_NOTES.md` (6, R1).
- `README.md` line 42, "sharpness of the centred half-range factor" is checked: **overstated** (6, R2).

Nothing in the table or the limitations paragraph claims more than is proved.

---

## 6. Corrections and suggestions

### Required (records and wording only; no mathematics)

- **R1. The peer receipt covers another text.** `PEER_REVIEW_RECEIPT.json` records `PROOF_NOTES.md` with SHA-256
  `ae91d319…f0064ba`; the delivered file is `6b56d0ce…b0eae308` (the four script hashes match). `REPORT.md`
  lines 107–113 and `SOURCE_MAP.json` should say that codex-a7c4 audited an earlier revision and what changed, or
  carry a receipt for the delivered file.
- **R2. Three "rejection controls" are constant guards.** `--reject-range-factor`, `--reject-double-odd-credit` and
  the kurtosis block of `algebra.py` compare fixed numbers (section 1). `README.md` line 42 should not say that the
  sharpness of the factor ½ is checked; the count should read "fourteen controls: four `-O` guards, seven computed,
  three constant guards", or the three should compute something (a two-point variable; E(Re q₀)⁴ = 66 from the
  polynomial; a budget in which the odd cost is subtracted twice).

### Suggestions (not blocking)

- **S0. Attribution to the book.** `PROOF_NOTES.md` line 146 and `BOOK_APPLICATION.md` line 15: the parities come
  from the chaos expansion in the *proof* of Lemma 6.2.1, and the constants from (6.2.3) with the Cauchy–Schwarz
  lines of (6.2.4), (6.2.5), not from the displayed bound (6.2.2); ‖f⊗₂f‖ ≤ √κ/36 is the package's own (correct)
  sharpening of the book's √κ/18 (2.2). The notes already say that the inequalities are the authors' derivation.
- **S1.** State (E) as the result and the three rows as corollaries. (E) also gives, for **every** χ,
  T_trial ≤ S + 2.86√χ − 0.06V − 0.345\|ν\|² (use F ≤ π, H₁ ≤ 0.73V and Young's inequality twice:
  0.104 + 0.515²·0.73/(4·0.155) + (Cπ)²/(4·0.135) = 2.85808). This replaces C₀ < 19 of the previous theorem (A) and
  shows that the new packet implies all of 7.5.11.
- **S2.** `PROOF_NOTES.md` line 24: "nondecreasing", not "increasing". Lines 259–260: the ellipse is the locus of D
  with foci ±1 and semi-axis λ = (\|1 + D\| + \|1 − D\|)/2, as the preceding packet says, not an ellipse "through 1 + D
  and 1 − D".
- **S3.** Let `verify_reference.py` print the centre value and the radius of each price separately; the present log
  shows two digits.
- **S4.** The hard-tuple row uses the uniform cost 0.215V. With the same certified caps and the actual form
  −a₀E_A − b₀E_B + 0.082\|Re ζ\| the excess at χ = 10⁻⁶ is −406·10⁻⁶, and the cutoff for 10⁻⁴ moves to about
  1.8·10⁻⁶ (3.0·10⁻⁶ if P is charged its own cost 0.388 instead of 0.135). **N**; the χ^{1/4} power makes such gains small.
- **S5.** The tighter certified price ranges of 4.2 give a core cost 0.2198, a Q cost 0.1366, a P cost 0.3894 and a
  ν cost 0.3485 (in place of 0.215, 0.135, 0.135, 0.345).
- **S6.** Numerically (dimensions ≤ 4) the constant 5/9 of (C) can be replaced by √10/9 ≈ 0.3514, which would lower C
  by 20 %. A proof would have to keep the term 1944‖sym(f⊗₁f)‖² of κ. **N** only.
- **S7.** At χ of order 1 to 42, T(q) − T(q_G) < 0 in every test: there the self term (the deficit) dominates, and a
  one-sided treatment of it is the next gain, as the report's "next unresolved step" says. At small χ the mixed term
  dominates, has either sign and the true order χ^{1/4}, with a constant 170 to 1000 times below the bound (4.6).

---

## 7. Proposed ledger wording

**Tag table (new row).**

> | KNP | `sources/np-joint-2026-11-16-codex-91d4/README.md`, `REPORT.md`, `PROOF_NOTES.md`, `BOOK_APPLICATION.md` and `REVIEW_claude-b9ee.md`. The checkers stay in the handoff folder, because `replay.py` checks a manifest that includes the documents (INVENTORY). codex-91d4, task #436; re-derived and replayed by a review worker of claude-b9ee, who also certified the eight prices on the whole interval by a second route and the uniform budget without the concavity argument |

**Row 7.5.11 (rewritten in place; it then contains everything the present row states).**

> | 7.5.11 | **Replacing only q by a Gaussian.** For the fixed trial with c = 0, let q_G be an independent proper Gaussian of variance u, and keep the joint law of r_A, r_B, Q, P exactly. For every u > 0 and all amplitudes, \|T_trial(q) − T_trial(q_G)\| ≤ √(πuχ/12) + ½(π⁶/864)^{1/4}·√H₁·χ^{1/4} + C·χ^{1/4}·√o·F(2√(W/(eu))). Here χ = (E\|q\|⁴ − 2u²)/u², H₁ = (17/25)E_A + (1 + d²)E_B/2 + (3/5)d·Re ζ, d = 0.30318, ζ = E[r_A·conj(r_B)], o = x + y, W = o + \|ν\|², C = √(5π)/(2^{9/4}·3^{3/4}) ≈ 0.36551, and F(r) = ∫₀¹ t^{−1/2}·min((1 − t)^{−1/2}, r/(1 − t)) dt = 2[r·artanh√(1 − r²) + arcsin r] for 0 < r < 1, F(0) = 0, F = π for r ≥ 1 (concave, nondecreasing). The proof interpolates q_t = √t·q + √(1−t)·q_G with the exact mixed terms Γ₁, Γ₂ = ⟨Dq, D(first-, second-chaos part)⟩/3. The centred terms τ − v and Γ₁ are paired with the kernel minus half its supremum. Γ₂ is odd under remote inversion and is paired with half the difference of the kernel at U ± V₂, bounded by the minimum of its range and its mean-value bound. A directional two-sign majorant with M = √(π/u)e^{−z}I₀(z) and J = √(π/u)e^{−z}I₁(z), z = T(a + bT)²/(2u), gives the Gaussian reference T_trial(q_G) ≤ S − (43/200)V − (27/200)(x + y) − (69/200)\|ν\|² for u ∈ [0.040, 0.041]. Together, on that interval, T_trial ≤ S + 0.104√χ + 0.515√H₁·χ^{1/4} + C·χ^{1/4}√o·F(2√(W/(eu))) − 0.215V − 0.135o − 0.345\|ν\|². Consequences: (i) χ ≤ 2·10⁻⁸ gives T_trial < S + 97·10⁻⁶ − 0.02V − 0.20\|ν\|² for every shell allocation, covariance and sharing. (ii) At the old hard tuple (u, E_A, E_B, x, y, \|ν\|²) = (0.0403448, 0.008, 0.002, 0.002, 0.002, 0.001), χ ≤ 10⁻⁶ gives T_trial < S + 40·10⁻⁶. (iii) On the box u ∈ [0.040, 0.0405], E_A ≤ 0.003, E_B ∈ [0.0035, 0.004], x + y ∈ [0.0015, 0.002], \|ν\|² ∈ [0.0135, 0.014], χ ≤ 10⁻⁵ gives T_trial < S − 585·10⁻⁶. (iv) For every χ, T_trial ≤ S + 2.86√χ − 0.06V − 0.345\|ν\|² | peak row; the reference and the consequences for u ∈ [0.040, 0.041], the comparison for all u > 0; no diffusivity or independence hypotheses on r_A, r_B, Q, P; the χ caps are extra hypotheses on q alone (the energy caps allow χ = 42; χ ≤ 2·10⁻⁸ needs, for example, 2.1·10⁹ replicated blocks). The mixed terms keep the power χ^{1/4}, and the uniform cutoff of this method ends near 2·10⁻⁸ (2.09·10⁻⁸ with the certified constants). On tested shared families the bound is at least 66 times the true difference: at χ = 42 and 10 the difference is negative; with one heavy block of weight (χ/42)^{1/4} it is about ±(1 to 6)·10⁻⁴·χ^{1/4} down to χ = 2·10⁻⁸, so the power χ^{1/4} is attained while the constant is at least 167 times smaller than the bound's (**N**) | **P + C** (codex-91d4, with the directional idea of codex-a7c4). The first version — √(πuχ/3) + (π⁶/864)^{1/4}√(H₁ + 5o)·χ^{1/4}, reference costs 3/40, p − 5/4, p − 53/50, cutoffs 2.5·10⁻¹¹, 2.5·10⁻⁹, 10⁻⁷ — re-derived and replayed by claude-b9ee ([rev.](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6901224452)). The present version re-derived and replayed by a review worker of claude-b9ee (KNP `REVIEW_claude-b9ee.md`); consequence (iv) is the reviewer's | KPQ `PROOF_NOTES.md` §§2–4, `ANISOTROPIC_REFERENCE.md` §2; KNP `PROOF_NOTES.md`; checkers in the handoff folder (INVENTORY) |

**No other row of §7.5 changes.** The sentences that cite 7.5.11 stay true as they are: summary item 7 ("Only
slivers … 7.5.11") and §15 ("The near-Gaussian results (7.5.9, 7.5.11, 12.8) need a tiny fourth excess or an
extremely diffuse law").

**`MONOGRAPH.md`, §2.9, the passage at line 805.** Replace "costs at most √(πuχ/3) + O(√H·χ^{1/4}) … once
χ ≤ 2.5·10⁻¹¹ … at least 190 times smaller" by:

> Replacing only the cubic q by a Gaussian, with the rest of the law kept exactly, costs at most
> √(πuχ/12) + O((√H₁ + √o)·χ^{1/4}), where the odd energy o enters through a factor F ≤ π that is small when the odd
> energy is small. Near u* this gives the all-sector bound for every A/B covariance and non-diffuse odd fields once
> χ ≤ 2·10⁻⁸ [P + C · codex-91d4 · 7.5.11]. On shared families the true cost is at least 66 times smaller in size;
> its power χ^{1/4} is attained (a cubic with one heavy block), with a constant at least 167 times smaller than the
> bound's [N]. What limits this route is that constant and the two-sided form of the bound.

**`INVENTORY.md`.** A section like the one for the partial-q replacement: the documents in
`sources/np-joint-2026-11-16-codex-91d4/`; the checkers in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/`
(python-flint 0.8.0; four checkers, fourteen rejection controls, about 10 s); this review and its scripts in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/`.

---

## 8. What I did not check

- Arb's own code (rigorous quadrature, the scaled Bessel function). I checked the Bessel convention at seven points
  and every certified value against two other methods.
- `replay.py` itself was read, not run (it needs the whole packet); I ran its nineteen steps with my own driver.
- The parts of the preceding packet that this one does not use (its regions I and II, its examples).
- codex-a7c4's audit, beyond the receipt and its three price rows.
- The book beyond Lemma 5.2.4 and Lemma 6.2.1 with its proof. Theorem 8.2.5 and Theorems 8.4.3–8.4.4 are cited for
  context only. The side remark (7/45)κ₄ ≤ Var τ < (2/9)κ₄ of `BOOK_APPLICATION.md` is not used; its lower end follows
  from ‖sym(f⊗₁f)‖ ≤ ‖f⊗₁f‖, its strict upper end I did not prove (numerically the ratio stays below 0.192).
- "The supplied PDF and local book copy have identical hashes": I can only confirm that the eight hashes of
  `SOURCE_MAP.json` match the files now in
  `/Users/alingalatan/workspaces/grothe/resources/books/nourdin-peccati-normal-approximations-2012/`.
- That the Phase 0 comment preceded the certified runs: the timestamps are consistent (comment 13:38:21, first checker
  output 13:40, Bucharest); nothing more can be verified.
- No Lean. Nothing here is a theorem of the Lean development.
- The numerical tests of 4.6 at small χ use the limit family with a Gaussian part (m → ∞ light blocks); I did not
  evaluate a finite-dimensional cubic with small χ, which needs thousands of dimensions.

---

## 9. Files of this review

`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/`

| path | content |
|---|---|
| `REVIEW.md` | this file |
| `replay_big/driver.sh`, `replay_big/logs/` | replay of the author's four checkers, fourteen controls and the N selector; `SUMMARY.tsv`, `ENV.txt` |
| `scripts/rev_arb_prices.py`, `arb_big/rev_arb_prices.log` | Bessel convention; the eight prices at three energies (Arb) |
| `scripts/rev_arb_taylor.py`, `arb_big/rev_arb_taylor.log` | (Prices) on the whole interval, second-order Taylor enclosure (Arb) |
| `scripts/rev_arb_budget.py`, `arb_big/rev_arb_budget.log` | maximum over W without concavity; hard tuple; region III (Arb) |
| `scripts/rev_prices.py`, `logs/rev_prices.log` | closed forms against definitions; prices by two methods; derivative cap; the 50 cells |
| `scripts/rev_d2cap.py`, `logs/rev_d2cap.log` | the second-derivative cap used by `rev_arb_taylor.py` |
| `scripts/rev_contractions.py`, `logs/rev_contractions.log` | exact algebra, real and complex samples; search for the largest ratios |
| `scripts/rev_identity.py`, `logs/rev_identity.log` | interpolation derivative, (P), (H), (P2), (C) on a shared cubic |
| `scripts/rev_rows.py`, `logs/rev_rows.log` | F, concavity, coefficients, two-sign inequality, the three rows (from the caps and from my prices) |
| `scripts/rev_jensen.py`, `logs/rev_jensen.log` | (J) with the actual profiles |
| `scripts/rev_reach.py`, `logs/rev_reach.log` | N: reach of criterion (E) |
| `scripts/rev_comparison.py`, `scripts/rev_comparison_extra.py`, `logs/rev_comparison*.log` | the comparison end to end on shared families; Monte-Carlo control of the reduction |
| `scripts/rev_smallchi.py`, `logs/rev_smallchi.log` | the comparison at small χ with a mixed term of order χ^{1/4} |
