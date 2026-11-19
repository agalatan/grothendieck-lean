<!-- Verbatim from the delivery conjecture-K-antiholomorphic-stein.zip (README.md), 16 November 2026; a Claude session of the user, relayed by the user. Only this line was added. -->
# Conjecture K: an antiholomorphic Stein calculus for the content lemma

Work on the open core shared by routes (A) and (B): a bound on the first-chaos content Π₁[q·h(|q|²)] of a remote cubic
q ∈ H₂,₁ that sees the phase of q and compares with the deficit of the same law. Written against the repository at
`agalatan/grothendieck-lean` (clone of 16 November 2026), without modifying it. The mathematics, with all proofs, is in
[`NOTE.md`](NOTE.md). Labels: **P** complete written proof (author only: nobody has re-derived these yet), **C** exact
computation with a replay script, **N** floating point only.

## 1. Summary

**What I chose.** The common lemma behind (A) and (B). Both stall on the same object: the A/B content c[h] = Π₁[q h(V)],
V = |q|², for some radial profile h (raw g, tilted h_{3/5}, B-kernel g_B, or the degree-5 profiles). The existing
structural bounds (ledger 11.29, 11.41 and the degree-5 bound (S)) lose through a projection, a supremum over the radius
and the Stein budget.

**What is new (rigorous).**
1. *Antiholomorphic Stein identity* (Lemma 1): for q of antiholomorphic degree one, E[Gq] = Σ_j E[∂_jG·∂̄_jq]. A
   holomorphic left factor is invisible to it. **P**
2. *Chaos structure of the antiholomorphic Stein pair* (a, c₂ − u), with a = Σ_j ∂_jq ∂̄_jq and c₂ = Σ_j|∂̄_jq|²
   (Theorem 2). a = P₂,₀(q²) + ½P₃,₁(q²), c₁ + c₂ = (3 − N₂)|q|², and ⟨|q|² − c₂, c₂ − u⟩ = ¼‖P₃,₁(q²)‖². **P + C**
3. *A complex fourth-moment identity* (Theorem 2(d)):

       δ = E|q|⁴ − 2u² = ‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖² + 2‖c₂ − u‖²,

   hence ‖a‖² + 2‖c₂ − u‖² = δ − ¾‖P₃,₁(q²)‖² ≤ δ (sharp). Two more forms give the *exact defects* of the real Stein
   budgets in the repository. E[(tr 𝒟)² + 2‖𝒟‖²_F] ≤ 6δ (used for 11.30, 11.41/11.49) has defect
   ‖P₃,₁(q²)‖² + 2‖P₂,₂|q|²‖², a factor 252/178 = 1.416 on the Wick monomial (the "budget factor ×1.4" of issue #453).
   Σ Var Γ_ab ≤ 3δ (used for 11.29) has defect ½‖P₃,₁q²‖² + 2‖P₁,₁|q|²‖² + (3/2)‖P₂,₂|q|²‖², a factor 2.15. **P + C**
4. *Content representation* (Theorem 3): for every continuous complex profile h of polynomial growth,

       E[ȳ_e q h(V)] = E[ȳ_e k′(V)(q̄·a + q·(c₂ − u))],   k(v) = E h(v + uτ),  τ ~ Exp(1).

   The radial transform is one-dimensional for any profile, so the 2-D resolvent that blocked the transfer of 11.49 to
   degree 5 does not arise. **P + C** (exact for polynomial profiles) **+ N** (peak profiles)
5. *Deficit representation* (Theorem 5): the same-variance deficit is a linear functional of the same pair,
   D(q) = −E[(c₂ − u)K′(V)] + E[q̄² a γ′(V)], K = E φ(· + uτ), γ = (B(u) − K)/v. **P + C + N**
6. *Projected content bound* (Theorem 4): ‖c[h]‖² ≤ δ·sup_e Ω_e, where Ω_e is the weighted norm of the projections of
   the explicit test functions y_e q k′(V), y_e q̄ k′(V) onto H₂,₀, H₃,₁, H₁,₁, H₂,₂. There is no supremum over the
   radius and no budget loss. **P**

**What the numbers say (N, peak row).**
- On the Wick monomial and on the ledger's best two-variable tensor the projected bound is within 1.28–1.69× of the
  true content (raw and tilt 3/5). The unprojected bounds lose 6–11×. For comparison, the true real-resolvent
  coefficient behind 11.49 (0.0321 at u = 0.0463) is 21× the monomial's C²/δ.
- Over all of H₂,₁(ℂ²) (survey, lower bounds on suprema), the bound's worst ratio to D at u = 0.0463 is 0.229 (raw)
  and 0.047–0.048 (tilt). Both are reached in the moderate-kurtosis band, χ ≈ 17, where the bound loses ×7–8.5. The loss sits
  in the two top components P₃,₁ and P₂,₂ (alignment cosines about 0.30 and 0.17).
- On their own, the law-free and law-aware corollaries do **not** beat ledger 11.49 (0.0443 against 0.0325 at
  u = 0.0463). All of the gain comes from the projection.

**Consequences.**
- **(A) An obstruction to one route.** The raw content inequality with κ ≈ 0.10 cannot be obtained by Cauchy–Schwarz on
  the antiholomorphic Stein pair, even with exact low-chaos projections and an exact budget. Theorem 4 gives
  δΩ_e ≥ 0.229·D on an explicit two-variable cubic at u = 0.0463 (**N**, stable to 5 digits under grid refinement).
  A proof of (A) has to use the alignment inside the top chaos components (third-order contraction structure) at finite
  amplitude.
- **(B) A ready-made frame.** Theorems 3 and 4 apply verbatim to the degree-5 A/B contents. With the tilt at degree 3
  the largest value of δΩ_e/D found on H₂,₁(ℂ²) is 0.048, about 6× below the coefficient 0.3 of 11.50. This comes from a
  search, not a bound, and covers two variables only. The degree-5 profiles and band
  rows (`degree5-cert/CONTENT_LEMMA_D5.md`) are not in the repository, so I could not evaluate the degree-5 band.
- **The common missing lemma** is now precise: a computable majorant of sup_e Ω_e. Ω_e is a dual norm of the smoothed
  radial function k′(V) against explicit polynomials, one chaos level below the content itself.

Nothing here proves K, K_η, or a new value of K_G^ℂ.

## 2. Statements

| # | statement | status | where |
|---|---|---|---|
| L1 | E[Gq] = Σ_j E[∂_jG ∂̄_jq] when N₂q = q; E[Gq] = ½Σ_j E[∂̄_jG ∂_jq] when moreover N₁q = 2q | P | NOTE §1 |
| T2a | a = P₂,₀(q²) + ½P₃,₁(q²); ‖a‖² = ‖P₂,₀q²‖² + ¼‖P₃,₁q²‖² | P + C | NOTE §2 |
| T2b | c₁ + c₂ = (3 − N₂)\|q\|²; c₂ ∈ H₀,₀ ⊕ H₁,₁ ⊕ H₂,₂; E c₂ = u, E c₁ = 2u | P + C | NOTE §2 |
| T2c | ⟨\|q\|² − c₂, c₂ − u⟩ = Σ_k‖Σ_j ∂̄_jq·∂_j∂̄_kq‖² = ¼‖P₃,₁q²‖² | P + C | NOTE §2 |
| T2d | δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖c₂ − u‖²; ‖a‖² + 2‖c₂ − u‖² = δ − ¾‖P₃,₁q²‖² ≤ δ | P + C | NOTE §2 |
| T2e | δ = ⅔‖P₂,₀q²‖² + ⅓‖P₃,₁q²‖² + (4/3)‖P₁,₁\|q\|²‖² + ⅔‖P₂,₂\|q\|²‖² | P + C | NOTE §2 |
| T2f | 2‖Γ(q,q̄) − 3u‖² + ‖Γ(q,q)‖² = 6δ − ‖P₃,₁q²‖² − 2‖P₂,₂\|q\|²‖² and ½‖Γ(q,q̄) − 3u‖² + ½‖Γ(q,q)‖² = 3δ − ½‖P₃,₁q²‖² − 2‖P₁,₁\|q\|²‖² − (3/2)‖P₂,₂\|q\|²‖² (exact real Stein budgets of 11.30/11.41 and of 11.29) | P + C | NOTE §2, §6 |
| T3 | E[ȳ_e q h(V)] = E[ȳ_e k′(V)(q̄a + q(c₂ − u))], k = E h(· + uτ), for all continuous complex h of polynomial growth; h(v) = v gives the leading tensor exactly | P; C (h = vᵐ, m ≤ 3); N (g, h_{3/5}) | NOTE §3 |
| T4 | \|E[ȳ_e q h(V)]\|² ≤ δ·Ω_e; Ω_e ≤ (3/2)E[\|y_e\|²V\|k′(V)\|²] ≤ (3/2)sup_v v\|k′(v)\|² | P | NOTE §3 |
| T5 | B_φ(u) − Eφ(V) = −E[(c₂ − u)K′(V)] + E[q̄²aγ′(V)] for φ ∈ C¹ of polynomial growth; D(q) for the peak φ | P; C (φ = vᵐ); N (peak φ) | NOTE §4 |
| N1 | Monomial, u = 0.009 … 0.0463: projected bound / truth = 1.23–1.44; unprojected 3.0–11.2 | N | `results/mono.log` |
| N2 | Five two-variable cubics at u = 0.0463 (table in NOTE §5): loss ×1.28–4.0 (raw), ×1.44–5.7 (tilt) | N | `results/twovar.log` |
| N3 | Survey of H₂,₁(ℂ²), table below | N (lower bounds on suprema) | `results/survey_*.json`, `fine_eval_*.log` |
| N4 | Law-free coefficient (3/2)sup v k′² for the tilt: 0.0600 … 0.0443 for u = 0.009 … 0.0463, above the certified γ of 11.49 (0.0502 … 0.0325) | N | `results/mono.log` |
| O1 | Obstruction: δΩ_e/D ≥ 0.229 for the raw profile at u = 0.0463, so Theorem 4 cannot give κ < 0.229 | N | `results/fine_eval_raw.log` |

**Survey of H₂,₁(ℂ²)** (random starts and Nelder–Mead, grid 28×24, maximisers re-evaluated at 44×40):

| u | raw: largest δΩ_e/D (χ, C²/D there, loss) | raw: largest C²/D | tilt 3/5: largest δΩ_e/D (χ, C²/D there, loss) | tilt: largest C²/D |
|---|---|---|---|---|
| 0.0055 | 0.0575 (19.3, 0.0265, ×2.2) | 0.0389 | 0.0141 (16.4, 0.0055, ×2.6) | 0.0085 |
| 0.02 | 0.1324 (14.6, 0.0179, ×7.4) | 0.0691 | 0.0306 (15.1, 0.0038, ×7.9) | 0.0119 |
| 0.0463 | **0.2293** (17.0, 0.0334, ×6.9) | 0.0876 | **0.0474** (18.1, 0.0058, ×8.2) | 0.0121 |

A second search from other starts found 0.0480 for the tilt at u = 0.0463 (χ = 17.7). The maximisers' coefficients are
in `results/survey_*.json`. At every maximiser all identities re-check by quadrature (Theorem 3 to ≤ 4·10⁻⁶,
Theorem 2(d) to 10⁻¹³, Theorem 5 to ≤ 2·10⁻⁶). The largest C²/D values reproduce the ledger's 0.0691 and 0.0876
(6.4.2, §9).

## 3. Repository statements used

The identities (L1, T2–T5) use only the Gaussian calculus and nothing from the ledger. The numerics use:
- the peak row and its constants (ledger 1.4): j₀, g₀ and B₀ are recomputed independently and agree to 12 digits; S
  (3.14) to 13 digits;
- the definitions of the content, the deficit and the profiles (1.8), and the tilt identity (11.12) for the meaning of
  h_{3/5};
- for comparison only: 11.29, 11.41/11.49 (certified γ), 11.50 (the coefficient 0.3), 6.3.12 and item 21 (leading
  tensor), 6.4.2 and §9 (the best tensor 0.08760259 and its normalisation, reproduced here as 0.0876), and the real
  Stein budget (3) of `sources/received-2026-11-15-tilted-sector/content_profile_proof.md`.

## 4. How the results would enter the ledgers

Proposed rows (`research/conjecture-K/STATUS.md`; IDs are suggestions):
- **6.3.20 (new)** Antiholomorphic Stein identity and chaos structure of (a, c₂ − u): L1, T2a–c. P (author only) + C.
- **6.3.21 (new)** Complex fourth-moment identity T2d, T2e. P + C. Supplies an exact budget for any argument that
  pairs (a, c₂ − u) with test functions.
- **6.3.22 (new)** Exact defects of the two real Stein budgets (T2f); they explain the ×1.4 budget factor. Annotate
  11.30 and 11.41/11.49 (budget "≤ 6δ") and 11.29 (budget "Σ Var Γ_ab ≤ 3δ"). P + C.
- **6.3.23 (new)** Content representation T3, for every radial profile, raw, tilted, B or degree-5. P + C + N. Annotate
  6.3.12 / item 21: the leading tensor equals ⟨y_e q, a⟩ + ⟨y_e q̄, c₂ − u⟩ exactly.
- **6.3.24 (new)** Deficit representation T5. P + C + N.
- **6.3.25 (new)** Projected content bound T4. P.
- **§9 (new rows, N)** N1–N4 and the survey table.
- **§14 (new route)** "Cauchy–Schwarz on the antiholomorphic Stein pair": even with exact degree-≤4 projections and the
  exact budget, the bound exceeds 0.229·D on H₂,₁(ℂ²) at u = 0.0463 (raw). It cannot give the raw content inequality
  with κ ≈ 0.10 (6.3.18, 7.4.2). N.
- **§15** Under items 2 (raw L4 content) and 7 (retained functional), add the common missing lemma: a computable
  majorant of sup_e Ω_e. For item 2 the obstruction O1 requires using the top-component alignment.

`research/higher-degree/STATUS.md`:
- **4.10 / 5.2** T3–T4 apply to the degree-5 A/B contents with any complex radial profile, with a one-dimensional
  transform, no supremum over the radius and an exact budget. That removes two of the three loss factors named in
  #453 (radius ×1.6–2.4, budget ×1.4) and replaces the projection factor by the degree-≤4 projection of T4. The effect
  on the band t ∈ [0.80, 0.855] is not computed (the degree-5 sources are outside the repository). P for the transfer;
  quantitative effect open.

## 5. Files and replay

```
NOTE.md                          statements and complete proofs
run_all.sh                       replays everything below (about one hour; the survey dominates)
scripts/wick_exact.py            exact Wick calculus over Gaussian rationals (standard library only)
scripts/check_identities_exact.py    C: identities I0–I9 (and I7b) on random rational cubics, n = 1, 2, 3
numerics/prof.py, tab.py, core.py    N: peak profiles by elliptic integrals; B(u), S
numerics/mono.py                 N: Wick monomial (1-D quadrature): truth, Theorem 3, Theorem 4, law-free coefficient
numerics/twovar.py               N: two-variable quadrature; all identities re-checked; five families
numerics/survey.py, fine_eval.py N: survey of H₂,₁(ℂ²) and re-evaluation of the maximisers
results/                         logs and JSON of the runs reported here
```

Replay: `python3 -I scripts/check_identities_exact.py` (about 3 s; prints PASS for each cubic) and
`cd numerics && python3 tab.py && python3 mono.py && python3 twovar.py 44 40`; the survey with
`python3 survey.py raw` and `python3 survey.py tilt` (about 30 minutes each), then `python3 fine_eval.py raw|tilt`.
The numerics need numpy and scipy; they were run with Python 3.13, numpy 2.5 and scipy 1.18.
