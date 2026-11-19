<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/antiholomorphic-stein-2026-11-17/REVIEW.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Review of "Conjecture K: an antiholomorphic Stein calculus for the content lemma"

Reviewer: independent review agent of claude-b9ee (a session other than the package's author). 16 November 2026,
13:25–14:25 Europe/Bucharest. Reviewed:
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/antiholomorphic-stein-2026-11-17/package/`
(`README.md`, `NOTE.md`, `scripts/`, `numerics/`, `results/`, `run_all.sh`; identical to the zip beside it apart from
`scripts/__pycache__`, which a later run left; SHA-256 list in `review/delivered_sha256.txt`). Nothing tracked was edited, committed, pushed or posted. The package was copied to
a new folder, every script was read before it ran, and Python ran with `-I` (`/usr/local/bin/python3`: 3.12.3,
numpy 2.3.5, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0).

Labels as in `research/conjecture-K/STATUS.md` §0. "Re-derived" means that I followed the written proof line by line
and recomputed every constant; "replayed" means that I ran the delivered code; "independent" means my own code, with a
different method, in `review/`.

## 1. Verdict

| # | proof (P) | exact check (C) | numerics (N) |
|---|---|---|---|
| L1 | **confirmed** (both forms) | independent: random polynomial G, 5 cubics | — |
| T2a | **confirmed** | replayed; independent (as a vector identity) | — |
| T2b | **confirmed** | replayed; independent (vector identity) | — |
| T2c | **confirmed** (all four expressions) | replayed; independent | — |
| T2d | **confirmed** | replayed; independent | replayed (10⁻¹³) |
| T2e | **confirmed**; it is the complex form of the known real identity (2) of `content_profile_proof.md` | replayed; independent | — |
| T2f | **confirmed** as identities. Identification: the first is exact, and it is the Lean theorem `fluctuation_identity` in complex components (not new); the second is the intermediate step of 11.29, not the budget 11.29 uses (F1, F2) | replayed; independent, in real coordinates | — |
| T3 | **confirmed** for continuous h of polynomial growth (complex allowed) | replayed (h = vᵐ, m ≤ 3); independent (incl. a complex polynomial profile) | replayed; independent at non-polynomial and non-smooth profiles (§3.2) |
| T4 | **confirmed** (definition of Ω_e, weights (1, 1, 2, 2), both corollaries) | — | — |
| T5 | **confirmed** | replayed (φ = vᵐ); independent | replayed (peak φ); independent at the peak φ and at φ = e^{−λv} |
| N1 | — | — | replayed: log identical |
| N2 | — | — | replayed: identical up to 10⁻¹³ noise; independently reproduced |
| N3 | — | — | survey replayed (raw and tilt, in full: the six maxima agree with the delivered JSON to 10⁻¹², their coefficients to 10⁻¹³); all six maximisers confirmed by independent quadrature |
| N4 | — | — | replayed; independently reproduced |
| O1 | — | — | **the number is confirmed** (0.22925634 by my quadrature); the wording needs three qualifications (§5) |

None of the numbered statements is wrong, and no proof has a gap. The findings of §7 concern attribution (F1, F2),
the wording of the obstruction (F3), two overstated consequences (F4, F5) and two inaccurate sentences of the
README's summary (F6, F7). F1–F5 should change the proposed ledger text.

**What stands.** Lemma 1, the chaos structure T2a–d, the representations T3 and T5 and the bound T4 are correct;
T3 and T5 are confirmed independently at the peak profiles to 10⁻⁷ or better. **What they give today:** exact
representations of content and deficit with a one-dimensional transform, and an exact budget. They give no new
certified inequality: the only corollary that can be certified now, the law-free coefficient, is weaker than 11.49,
and the projected quantity Ω_e has no majorant. O1 is a sound negative result for the raw route with the constants
0.10 and 0.15.

## 2. The proofs

Conventions checked first (NOTE §0): E[∂_jF] = E[ȳ_jF] and E[∂̄_jF] = E[y_jF] for the density π⁻ⁿe^{−|y|²};
∂_j* = y_j − ∂̄_j, ∂̄_j* = ȳ_j − ∂_j; N₁, N₂ count the holomorphic and antiholomorphic Wick degrees; the product rule
N_i(FH) = F·N_iH + H·N_iF − Γ(F, H) with Γ(F, H) = Σ_j(∂_jF·∂̄_jH + ∂̄_jF·∂_jH), and Γ(F, H) = ∇F·∇H in the real
coordinates y_j = (G_{2j−1} + iG_{2j})/√2 (bilinear, no conjugate). 𝒦_u: k(v) = u⁻¹e^{v/u}∫_v^∞e^{−s/u}h(s)ds, so
k′ = (k − h)/u is continuous when h is; k is the only solution of k − uk′ = h of polynomial growth (the homogeneous
solution is e^{v/u}).

**L1.** E[G·(ȳ_j − ∂_j)∂̄_jq] = E[∂_jG·∂̄_jq] by one integration by parts on F = G·∂̄_jq, which is C¹ with polynomial
growth. Summing over j and using N₂q = q gives the first form; N₁q = 2q gives the second with the factor ½. Correct.
Hypotheses: q a polynomial, G ∈ C¹ with G and ∇G of polynomial growth (locally Lipschitz would do). The second form
needs only N₁q = 2q; the README's "moreover" is not needed.

**T2a.** N₂(q²) = 2q² − Γ(q, q) = 2q² − 2a. The monomials of q² have |α| − |β| = 2 and |β| ≤ 2, and each expands in
Wick monomials of the same charge and lower degree, so q² ∈ H₂,₀ ⊕ H₃,₁ ⊕ H₄,₂; (1 − ½N₂) acts by 1, ½, 0. Correct,
with both norm formulas.

**T2b.** N₂q̄ = 2q̄ (q̄ ∈ H₁,₂), so N₂V = 3V − Γ(q, q̄) and Γ(q, q̄) = c₁ + c₂. F_k = ∂̄_kq is a homogeneous holomorphic
quadratic, so |F_k|² ∈ H₀,₀ ⊕ H₁,₁ ⊕ H₂,₂. E c₂ = ⟨q, N₂q⟩ = u, E c₁ = ⟨q, N₁q⟩ = 2u. Correct.

**T2c.** Lemma 1 with G = q̄x gives ⟨V, x⟩ = E[c₂x] + T, T = E[q̄Σ_j∂_jc₂·F_j]; E[c₂x] = ‖x‖² because Ex = 0.
∂_jc₂ = Σ_k∂_jF_k·F̄_k uses that F_k is holomorphic. So T = Σ_k⟨qF_k, W_k⟩, W_k = Σ_jF_j∂_jF_k ∈ H₃,₀. Lemma 1 with
G = w̄F_k (w ∈ H₃,₀, so ∂_jw̄ = 0) gives P₃,₀(qF_k) = W_k, hence T = Σ_k‖W_k‖². ∂̄_k maps H_{p,q} into H_{p,q−1}
([N₂, ∂̄_k] = −∂̄_k, [N₁, ∂̄_k] = 0), and ∂̄_ka = Σ_j∂_jF_k·F_j + Σ_j∂_jq·∂̄_k∂̄_jq = W_k because q has polynomial degree
one in ȳ. So ‖P₃,₁a‖² = Σ_k‖∂̄_kP₃,₁a‖² = Σ_k‖W_k‖². Correct. This is where "antiholomorphic degree one" is used
three times: N₂q = q, F_k holomorphic, ∂̄∂̄q = 0.

**T2d.** Lemma 1 with G = q̄V: Σ_j∂_jG·∂̄_jq = 2Vc₂ + q̄²a. Then E|q|⁴ = 2u² + 2‖x‖² + ½‖P₃,₁Q‖² + ‖P₂,₀Q‖² + ½‖P₃,₁Q‖².
Correct. Equality in ‖a‖² + 2‖x‖² ≤ δ holds for q = y₀²ȳ₁ (P₃,₁q² = 0; checked exactly), so "sharp" is right.

**T2e.** The second form of Lemma 1 with G = q̄V gives E|q|⁴ = E[Vc₁] + ½⟨Q, a⟩. The combination ⅔·(this) + ⅓·(T2d's
form) is δ = ⅔⟨Q, a⟩ + ⅔⟨V − u, c₁ + c₂ − 3u⟩, and (3 − N₂) acts by 2, 1, 0 on H₁,₁, H₂,₂, H₃,₃. Correct. In real
notation this is identity (2) of `content_profile_proof.md` with Cov(H, K) = 2‖H₂‖² + ‖H₄‖² inserted: Σ_{ab}Q_aQ_bΓ_ab
= ¼|∇V|² = ½V(c₁ + c₂) + Re(q̄²a).

**T2f.** Both identities follow from T2a, T2b, T2e by arithmetic; recomputed. The pointwise change of variables
(tr 𝒟)² + 2‖𝒟‖²_F = 2(Γ(q, q̄) − 3u)² + |Γ(q, q)|² and 2‖𝒟‖²_F = (Γ(q, q̄) − 3u)² + |Γ(q, q)|² is correct, and
E Γ_ab = (3u/2)δ_ab. I also re-derived both defects from the real proofs (the terms ‖H₄‖² dropped in
`content_profile_proof.md` §1, and in `REPORT_localization_history.md` §3.2 the a₄ terms plus the parallelogram term
Var(tr Γ)/4 dropped twice for Γ₁₂): they come out as ‖P₃,₁Q‖² + 2‖P₂,₂V‖² and ½‖P₃,₁Q‖² + 2‖P₁,₁V‖² + (3/2)‖P₂,₂V‖²,
as stated. Monomial values 178u², 58.5u² and the factors 252/178, 126/58.5: confirmed.

**T3.** Lemma 1 with G = ȳ_ek(V): ∂_jȳ_e = 0 and ∂_jV = q̄∂_jq + q∂_jq̄ give E[ȳ_eqk(V)] = E[ȳ_ek′(V)(q̄a + qc₂)];
subtracting u·E[ȳ_eqk′(V)] and k − uk′ = h give the claim. Correct. Points asked about:
- *Where k comes from.* k is forced by k − uk′ = h and polynomial growth; u enters only through E c₂ = u, which
  centres the second factor. (Any λ > 0 gives a valid identity with k = 𝒦_λh and c₂ − λ.)
- *Regularity.* The proof needs G ∈ C¹, that is k ∈ C¹, that is h continuous: no derivative of h is used. At points
  with V = 0 the chain rule holds because ∂_jV = 0 there and k has a one-sided derivative. The peak profiles g, j and
  h_{3/5} are in fact C^∞ and bounded on [0, ∞): L has the smooth planar density e^{−t}/(π(a + bt)(a + 3bt)),
  |z|² = t(a + bt)², so y ↦ E ph(L + y) is smooth and equivariant. The "kink" in `numerics/prof.py` is in the
  T-integrand, not in the profile. So the hypothesis holds with room. The identity also holds for kinked and even
  discontinuous h (k is then Lipschitz): on the monomial, to 28 digits (§3.2).
- Only N₂q = q is used, as remark (i) says. Per `CONTENT_LEMMA_D5.md` §1 the degree-5 A/B contents are of the form
  Π₁[q·h(|q|²)] with the same cubic q, so the transfer claim is right as a statement about T3. I could not check any
  degree-5 number.

**T4.** ⟨G_e, a⟩ = ⟨P₂,₀G_e, P₂,₀Q⟩ + ½⟨P₃,₁G_e, P₃,₁Q⟩ and ⟨G′_e, x⟩ = ⟨P₁,₁G′_e, P₁,₁x⟩ + ⟨P₂,₂G′_e, P₂,₂x⟩.
With A = (‖P₂,₀G‖, ½‖P₃,₁G‖, ‖P₁,₁G′‖, ‖P₂,₂G′‖), B = (‖P₂,₀Q‖, ‖P₃,₁Q‖, ‖P₁,₁x‖, ‖P₂,₂x‖) and weights
w = (1, 1, 2, 2): ΣA_iB_i ≤ (ΣA_i²/w_i)^{1/2}(Σw_iB_i²)^{1/2} = (Ω_e·δ)^{1/2}, the second factor by T2d and
‖x‖² = ‖P₁,₁x‖² + ‖P₂,₂x‖². Correct, and it is the best bound that uses only the four norms and the one budget
constraint. ‖c[h]‖² ≤ δ·Ω_{e*} at e* = c/‖c‖ already, so sup_e is not needed for a given q (the package's numerics
use e*). The unprojected bound and (3/2)sup v|k′|² are correct. G_e ∈ L² because k′ has polynomial growth.

**T5.** K ∈ C² because K′ = (K − φ)/u and φ ∈ C¹; γ(v) = −∫₀¹K′(sv)ds is C¹ on [0, ∞). Lemma 1 with G = q̄γ(V):
Σ_j∂_jG·∂̄_jq = c₂(γ + Vγ′)(V) + q̄²aγ′(V), and (vγ)′ = −K′. Subtracting u·E[(vγ)′(V)] gives B_φ − Eφ(V). Correct.
For the peak, φ′ = j is bounded and B(u) = Eφ(uτ), Eφ(V) = 2E|L + q|, so the left side is D(q) of ledger §0.

## 3. Independent checks

All scripts and logs are in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/antiholomorphic-stein-2026-11-17/review/`.

### 3.1 Exact (`exact_check.py`, sympy; `exact_check.log`)

Method, different from `wick_exact.py` at every step: the cubic is built with creation operators
(∂_a*∂_b*∂̄_c*1); E[y^aȳ^b] is derived from real moments E g^{2k} = (2k − 1)!! through y = (g₁ + ig₂)/√2; projections
are Lagrange filters in N₁, N₂; the real matrices Γ_ab are formed in real coordinates.
Cubics: z(|z|² − 2); two random two-variable cubics with all six shells; y₀²ȳ₁; a sparse random three-variable cubic.
All pass:
- L1, both forms, with random polynomial G;
- T2a and T2b as identities of polynomials (the package checks norms); T2c with all four expressions and
  P₃,₀(qF_k) = W_k = ∂̄_ka; T2d; T2e; T2f, where budget (3) and ΣVar Γ_ab are computed in real coordinates;
- T3 for h = 1, v, v², (1 + 2i)v + iv² (and v³, 1 − v + v³/3 on the monomial), with k from the Neumann series of
  (1 − uD)⁻¹ and cross-checked against E h(v + uτ); T5 for the real profiles.
- the Lean identity `fluctuation_identity` in real coordinates (J₄ by a filter in the real OU generator), the
  equality of half its remainder with ‖P₃,₁Q‖² + 2‖P₂,₂V‖², and the value of the gradient budget (7) of 11.29 (F1, F2);
- Monomial (u = 2): δ = 168, ‖P₂,₀Q‖² = 32, ‖P₃,₁Q‖² = 96, ‖x‖² = 20, ‖a‖² = 56, ‖P₁,₁V‖² = 36, ‖P₂,₂V‖² = 100: the
  NOTE's values, and 168 = 96 + 72.

### 3.2 T3 and T5 at non-polynomial profiles (`t3_mono_mp.py`, `t3_nonpoly.py`)

- Monomial, mpmath at 30 digits, integration split at every kink (u = 0.0463, v₀ = 0.02), closed-form k′: both sides
  of T3 agree to 10⁻²⁸ or better for h = √v, |v − v₀|, min(v, v₀), e^{−20v}, and for the step 1[v ≥ v₀], which is
  outside the stated hypothesis.
- A two-variable cubic with all six shells (χ = 31.9), e = (0.6, 0.8i) (not the content direction):
  - deterministic quadrature: T3 to 7·10⁻⁷ (h = e^{−20v}) and 2.5·10⁻⁵ (√v); T5 with φ = e^{−20v} to 6·10⁻⁸;
  - Monte Carlo, 4·10⁷ samples, paired difference lhs − rhs in standard errors: 0.28 (e^{−20v}), 0.71 (complex
    e^{−(20+30i)v}), 0.70 (√v), 0.13 (|v − v₀|), 1.46 (step); relative standard errors 0.07 % to 0.35 %.
- Peak profiles: my own quadrature gives T3 to 10⁻⁸ … 10⁻¹⁴ at the six survey maximisers (§3.4).

### 3.3 An independent model of the peak profiles (`indep.py`, `test_prof.py`)

Circular means by the Landen-transformed formulas with an own AGM for K and E; the T-integral by graded
Gauss–Legendre panels; Chebyshev interpolants; a three-dimensional grid (Gauss–Laguerre in |X|², |Y|², trapezoid in
the relative phase); Wick polynomials from the explicit sum. Validation:
- B₀ = 1.371879280600870, j₀ = 1.431973791291431, g₀ = −0.835135932614130, S = 1.3739535256615 at 0.0403448: inside
  the ledger's intervals (§0, 3.14). The package's g₀ ends in …876: it agrees to 12 digits, as the README says.
- Agreement with a direct mpmath double integral (no elliptic functions) at four radii: 10⁻¹⁶.
- The package's table `tab_peak.npz` agrees with my values to 7.5·10⁻¹³.
- Ledger 6.4.2 and §9 (C²/D): monomial 0.087565304357 (ledger 0.087565304234); τ = 0.1: 0.087576329288
  (0.087576329175); best two-variable tensor 0.087602594372 (0.08760259435); u = 0.02: 0.06914308055
  (0.06914308055); u = 0.03: 0.07857989847 (0.07857989851). At u = 0.02 and 0.03 the structured baseline is the
  monomial itself (the maximum over z is at z = 0). So "the reproduced ledger numbers match the ledger" holds, and to
  10⁻¹⁰, not only to the three digits the package prints.

### 3.4 The survey maximisers (`eval_o1.py`, `eval_o1.log`)

Delivered coefficients, my model, grids 40²×48, 64³, 96³ (values stable to the digits shown):

| profile | u | δΩ_e/D (package) | C²/D | χ | D/δ | cosines H₂,₀, H₃,₁, H₁,₁, H₂,₂ |
|---|---|---|---|---|---|---|
| raw | 0.0055 | 0.05747499 (0.05747) | 0.0264774 | 19.3197 | 0.50643 | 0.563, 0.979, 0.785, 0.712 |
| raw | 0.02 | 0.13243813 (0.13244) | 0.0178938 | 14.5708 | 0.37771 | 0.766, 0.306, 0.551, 0.240 |
| raw | 0.0463 | **0.22925634** (0.22926) | 0.0333577 | 16.9816 | 0.22939 | 0.684, 0.304, 0.588, 0.174 |
| tilt | 0.0055 | 0.01408280 (0.01408) | 0.0055044 | 16.3757 | 0.53096 | 0.521, 0.980, 0.694, 0.651 |
| tilt | 0.02 | 0.03055694 (0.03056) | 0.0038477 | 15.1048 | 0.37228 | 0.734, 0.266, 0.529, 0.251 |
| tilt | 0.0463 | 0.04743907 (0.04744) | 0.0058137 | 18.0692 | 0.22229 | 0.586, 0.260, 0.564, 0.151 |

At u = 0.0463 raw: D = 8.35038870·10⁻³, C² = 2.7855·10⁻⁴, and T2d holds to 10⁻¹⁵, T3 to 8·10⁻⁹ on the 96³ grid.

### 3.5 N2, N4, T5 at the peak, and two searches (`n2_and_dist.py`, `n4_and_cw.py`, `t5_peak.py`, `opt_probe.py`, `search_raw.py`)

- N2, my model, 64³ grid: the ten rows of the NOTE's table are reproduced to the digits printed. Raw C²/D and δΩ_e/D:
  0.08757/0.11192, 0.08760/0.12359, 0.08400/0.15045, 0.06531/0.15267, 0.04100/0.16495; tilt: 0.01136/0.01639,
  0.01145/0.01930, 0.01126/0.02562, 0.00988/0.02943, 0.00612/0.03492; the cosines agree too.
- T5 at the peak profile, my model (`t5_peak.py`): D computed directly against the right side of Theorem 5, relative
  difference 7·10⁻⁹ (monomial), 1.1·10⁻⁷ (raw maximiser), 5.5·10⁻¹⁰ (mixed).
- N4, my model: (3/2)sup v·k′² for the tilt = 0.05996, 0.05443, 0.05015, 0.04433 at u = 0.009, 0.02, 0.03, 0.0463
  (package 0.0600, 0.0544, 0.0501, 0.0443); raw 0.26826, 0.24958, 0.23479, 0.21415.
- The second tilt search (0.0480, χ = 17.7) has no log in the package. BFGS from the delivered tilt maximiser, with my
  model, reaches **0.04799957** at χ = 17.664 (C²/D = 0.005639, loss ×8.51): confirmed.
- A wider search of my own, raw profile, u = 0.0463: 400 random cubics, then BFGS from the best seven. Five runs end
  at 0.229256 (χ = 16.98–17.00), two at a second local maximum 0.206562 (χ = 21.89). Nothing above 0.2293: in two
  variables the delivered value looks like the supremum (a search, so still a lower bound).

## 4. Replay of the package

| step | result |
|---|---|
| `scripts/check_identities_exact.py` | PASS, log identical to the delivered one (2.1 s) |
| `tab.py`, `prof.py`, `core.py` | `core.log` identical except the 15th digit of g₀ |
| `mono.py` | log identical (42 s) |
| `twovar.py 44 40` | identical except the "delta identity" residuals (10⁻¹³) (19 s) |
| `fine_eval.py` on the delivered JSON | identical except the same residuals |
| `survey.py raw` | the three maxima agree with the delivered JSON to 12 digits (21 min on a loaded machine) |
| `survey.py tilt`, then `fine_eval.py` on the new JSON | the three maxima agree to 12 digits (22 min); both `fine_eval` logs identical except the same residuals |

Notes on the replay.
- `run_all.sh` cannot be used as delivered under `-I`: the numerics import each other from the script directory,
  and `tab.py` starts a `multiprocessing.Pool` from `__main__`. I used two drivers (`review/run_pkg.py`,
  `review/run_tab.py`) that append the directory at the end of `sys.path`.
- The delivered logs were not produced by `run_all.sh` as written (they contain stderr warnings and `time` lines). The
  numpy warnings in `survey_*.log` (division by zero in `laggauss`) do not occur here; all weights are finite.
- `survey_*.json` stores the argmax of δΩ_e/D only. The tensors behind the column "largest C²/D" are not saved, so
  those entries exist only as coarse-grid values (28×24). In the replay they agree with the delivered ones to 8·10⁻⁶
  (that Nelder–Mead path depends on the platform in its last digits).
- `check_identities_exact.py`: lines 26–27 are dead code; I2 checks norms and ⟨Q, a⟩ rather than the identity of
  polynomials; the four n = 1 trials are one cubic up to scale. None of this affects a verdict.
- `prof.py::dMcirc` returns 0.5 at r = Y; the limit is 2/π. A single point, with no effect.
- NOTE §6.1 cites a Monte Carlo check "to 10⁻⁷" that has no script. The exact real-coordinate check of §3.1 covers it.

## 5. The obstruction O1

**The number.** At the delivered cubic (coefficients in `results/survey_raw.json`, u = 0.0463), with my profiles and
quadrature: δ·Ω_{e*} = 0.22925634·D, C² = 0.0333577·D, D = 8.350389·10⁻³, χ = 16.9816. The package's 0.22926,
0.03336, 16.982 are right, and "stable to 5 digits" is conservative. BFGS from that point and from three perturbed
copies returns to it, and my search from random cubics (§3.5) ends there five times out of seven.

**Wording.** "Theorem 4 cannot give κ < 0.229 at u = 0.0463 (N, one explicit cubic)" is supported. Three
qualifications:
1. *What is excluded.* 7.4.2 lists three sufficient constants: 0.10 (adverse), 0.15 (m = 0), 0.24 (favourable signed),
   and 0.24 is also the A-only constant of 6.2.1/6.2.3. The number 0.229 excludes 0.10 and 0.15. It does **not**
   exclude 0.24. Whether sup δΩ_e/D stays below 0.24 in every dimension is unknown; in two variables the margin is
   4.5 %.
2. *How robust.* The claim is about Theorem 4, which allocates the budget in the worst way over the four components.
   The same cubic with the **true** component norms gives (Σ_i‖P_iG‖·‖P_if‖)² = 0.1734·D. So no reweighting of the
   Cauchy–Schwarz over these four components gives κ < 0.173 there. The four pairings are +9.875, +2.703, +5.151,
   −1.039 (·10⁻³): 62 % of the loss is in H₃,₁ and H₂,₂, the rest in the two low components, so "the loss sits in the
   two top components" should read "mostly".
3. *Scope.* It concerns the pair (a, c₂ − u) only. The second form of Lemma 1 gives another representation, with c₁
   and an extra term ½E[k(V)∂_eq]; mixtures of the two are not covered.

**It is not an exceptional cubic.** Over 300 random two-variable cubics (complex Gaussian coefficients) at u = 0.0463,
δΩ_{e*}/D lies between 0.135 and 0.202 for the raw profile (median 0.167; 93 % above 0.15), while C²/D has median
0.052 and maximum 0.086. For the tilt it lies between 0.024 and 0.044 (median 0.032). So Theorem 4 misses 0.10 on
every cubic sampled, not only at the maximiser.

## 6. The proposed ledger rows

| proposed row | verdict |
|---|---|
| 6.3.20 (L1, T2a–c) | status **P** (author; re-derived in this review) **+ C on instances** (replayed, and an independent exact check). Accept. |
| 6.3.21 (T2d, T2e) | **P + C on instances**. Accept, saying that T2e is identity (2) of `content_profile_proof.md` in complex form and that T2d is the new one. |
| 6.3.22 (T2f) | **P + C on instances**, with the changes of F1 and F2. |
| 6.3.23 (T3) | **P + C on instances + N**. Accept. The annotation of 6.3.12 / item 21 is right (h = v, k′ ≡ 1, checked exactly). The row should carry the hypothesis (h continuous, of polynomial growth), not "every radial profile". |
| 6.3.24 (T5) | **P + C on instances + N**. Accept. |
| 6.3.25 (T4) | **P**. Accept. |
| §9 rows (N1–N4, survey) | **N**, replayed. Accept, with "(lower bounds; two variables only)". |
| §14 new route | Accept as **N**, reworded as in §5: name Theorem 4, say that 0.10 and 0.15 are excluded and 0.24 is not, add 0.173. |
| §15 "common missing lemma" | **Overstated** (F4). |
| `higher-degree/STATUS.md` 4.10 / 5.2 | "P for the transfer" is right for T3 and T4 as statements. "Removes two of the three loss factors" is **overstated** (F5). |

"C" in these rows means exact arithmetic on random instances. It is evidence for a universally quantified identity,
not a certificate of it; the proofs carry the statements.

## 7. Findings

**F1 (attribution, T2f first identity).** It is not new as an exact identity. `Grothe/LowerAnalytic/Fluctuation.lean`
proves `fluctuation_identity`: 12δ − 4E(S − 3u)² − 2E(A² + B²) = 4EJ₄(a)² + EJ₄(a + b)² + 4EJ₄(b)² + EJ₄(b − a)², with
S = Γ(q, q̄), A + iB = Γ(q, q) and J₄ the fourth-chaos part of a square. Half of its right side equals
‖P₃,₁Q‖² + 2‖P₂,₂V‖² (derived, and checked exactly on five cubics). `CONTENT_LEMMA_D5.md` §9 has the same defect in
real form, and ledger §14 item 90 has its value 5δ on Z₀²·conj(Z₁) (reproduced: 200 = 6·40 − 0 − 2·20). The package
adds the complex-chaos form. Row 6.3.22 should cite the Lean theorem and item 90 and not say "new".

**F2 (attribution, T2f second identity).** ΣVar Γ_ab ≤ 3δ is an intermediate line of the proof of 11.29. The budget
11.29 uses is (7), E Σ_{ab}|∇Γ_ab|² ≤ 12δ, which loses once more (E|∇F|² ≤ 4Var F). Its exact value is
4‖P₁,₁V‖² + 4‖P₂,₀Q‖² + 2‖P₂,₂V‖² + 2‖P₃,₁Q‖² (checked exactly on five cubics): 166u² against 504u² on the monomial, a
factor 3.04, not 2.15. A by-product: by T2e this is 6δ − 4‖P₁,₁V‖² − 2‖P₂,₂V‖² ≤ 6δ, so the constant 3/4 of 11.29 can
be 3/8 (reviewer's remark; P by these identities, not reviewed by anyone else).

**F3 (O1 / §14 wording).** See §5: say "Theorem 4"; 0.10 and 0.15 excluded, 0.24 not; one cubic, two variables.

**F4 (§15, "the common missing lemma").** A computable majorant of sup_eΩ_e cannot be the missing lemma of route (A)
for the constants 0.10 and 0.15: by O1 every such majorant is at least 0.229·D/δ at u = 0.0463. It is a candidate only
for the constant 0.24, for the retained route (where 11.50 is already proved at degree 3) and for degree 5.

**F5 (higher-degree row).** T4 is another chain, not the chain of #453 with two factors removed. What can be
certified from it today is the law-free coefficient (3/2)sup v|k′|², which at degree 3 is **worse** than 11.49
(0.0443 against 0.0325). The projected quantity Ω_e has no majorant, and on the moderate-kurtosis band it loses
×8.2–8.5 by itself. A fair statement: at the degree-3 tilt maximiser T4 gives 0.0474·D, against 0.146·D for the
certified 11.49 ((13/400)δ/D) and 0.0058·D for the truth, so it is about 3 times sharper than 11.49 there if Ω_e can
be bounded (as suprema over two-variable cubics: 0.048 against 0.2425, the value of (13/400)δ/D at the monomial). The
degree-5 values are not computed.

**F6 (README §1, "law-free and law-aware corollaries do not beat 11.49").** Only the law-free number is compared.
The law-aware form (3/2)E[|y_e|²V k′²] is below 11.49 on the cubics that were evaluated: 0.0171δ against 0.0325δ on
the monomial, 0.098·D against 0.146·D at the tilt maximiser. Its supremum over cubics is not computed.

**F7 (README §1, "0.0321 at u = 0.0463").** The ledger's 0.0321 is the true coefficient at the row energy
u = 11/250 = 0.044 (11.49). The factor 21 is then approximate.

**F8 (wording of L1's remark).** In E[Gq] = Σ_jE[∂_jG·∂̄_jq] it is an *antiholomorphic* factor of G, such as ȳ_e,
that ∂_j does not see (equivalently the holomorphic factor y_e of Ḡ in ⟨Ḡ, q⟩). README §1 item 1 reads the other way.

**F9 (README §1 item 6).** Ω_e is defined with conj(k′(V)) (NOTE, Theorem 4); the README drops the conjugate, which
matters for complex profiles only.

## 8. Not checked

- Any degree-5 number (the profiles are outside the package).
- Novelty of L1, T2a–d, T3–T5 beyond this repository's record (ledger, `sources/`, the Lean module named in F1).
- The flank and upper rows, more than two variables in the survey, and energies other than 0.0055, 0.02, 0.0463.

## 9. Files

`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/antiholomorphic-stein-2026-11-17/review/`:
`exact_check.py`, `indep.py`, `test_prof.py`, `eval_o1.py`, `t3_nonpoly.py`, `t3_mono_mp.py`, `n4_and_cw.py`,
`n2_and_dist.py`, `t5_peak.py`, `opt_probe.py`, `search_raw.py`, `baseline_u002.py` with their `.log` files (and the
end points `opt_probe_*.json`, `search_raw.json`); the drivers
`run_pkg.py`, `run_tab.py`, `run_survey.sh`; `replay/` (the logs, the JSON and the profile table `tab_peak.npz` of my
replay); `delivered_sha256.txt`.
Replay of the reviewer's checks, from that folder: `python3 -I exact_check.py` (80 s),
`python3 -I test_prof.py . replay/tab_peak.npz`, `python3 -I eval_o1.py . ../package/results` (4 min). They need numpy,
scipy, sympy and mpmath.
