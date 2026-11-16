<!-- Verbatim from the delivery conjecture-K-influence-calculus-v2.zip (README.md), 16 November 2026; a Claude session of the user, relayed by the user. Only this line was added. -->
# Conjecture K: an influence calculus for the content, and a reading of the literature (v2)

Second package of this Claude session, 16 November 2026, written against `agalatan/grothendieck-lean` at `ddbf7f58`
(master of 15:07, which contains the first package as `sources/antiholomorphic-stein-2026-11-16/`, ledger 6.3.20–6.3.25,
alias KAS). Nothing in the repository was modified.

**v2 (third turn, master `b3cca504`): erratum and addendum.**
- In its capped form Theorem 9 is bound (F) of `CONTENT_LEMMA_D5.md` §3.4, which the degree-5 law layer already
  uses. Its only new part was the constraint on λ₁² + λ₂².
- That constraint is now sharp: λ₁² + λ₂² ≤ δ/2 (was 3/4), through an exact identity ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS.
- The influence corner (2u, u) is attained at every χ ∈ [10, 42]. So no sharper influence bound can lower the
  band's binding cells (χ = 16, 30).

The new results, the corrections and their ledger rows are in [`ADDENDUM.md`](ADDENDUM.md). Below, the places changed
by the erratum are marked **[v2]**. Four documents:

- [`ADDENDUM.md`](ADDENDUM.md): the erratum, Theorem 13, Corollaries 13.1–13.3, Proposition 14;
- [`NOTE2.md`](NOTE2.md): statements and complete proofs;
- [`LITERATURE.md`](LITERATURE.md): what was read (book, Malliavin–Stein papers, complex chaos, Grothendieck
  constants), how far each item was read, and what it gives;
- this file: summary, statement table, ledger rows, replay.

Labels: **P** complete written proof (author only: nobody has re-derived these), **C** exact rational computation on
random instances with a replay script, **N** floating point only.

## 1. Summary

**Nothing here proves K, K_η, a row of the degree-5 band or a new bound on K_G^ℂ.** What is new:

1. **A second exact representation of the content, through the influence functions of q** (Theorem 6):

       E[ȳ_e·q·h(|q|²)] = E[∂_eq·(vh)′(V)] + E[q²·conj(∂̄_eq)·h′(V)],

   that is, c[h] = 𝒟₁*A_h + 𝒟₂*B_h with the "shadows" A_h = P₁,₁[(vh)′(V)], B_h = P₂,₀[q²h′(V)] and the influence
   operators 𝒟₁e = conj(∂_eq), 𝒟₂e = ∂̄_eq. Hence ‖c[h]‖ ≤ √λ₁‖A_h‖ + √λ₂‖B_h‖ with λ₁, λ₂ the largest holomorphic
   and antiholomorphic influences. Unlike the projected bound 6.3.25 it has no Gaussian floor, and it is exact on
   the Wick monomial and on equal independent Wick blocks (N: ratio 1.00–1.02; 1.18–1.27 on a mixed cubic; 2.8–4.1
   on X(|Y|² − 1)). **P + C + N**
2. **The largest influence is bounded by the fourth excess** (Theorem 7): P₁,₁|q|² is the influence matrix, and
   λ₁² + λ₂² ≤ ‖P₁,₁|q|²‖² ≤ (3/4)δ. **P + C** **[v2]** Superseded by the sharp λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS ≤ δ/2
   (ADDENDUM, Corollary 13.1), with equality only at X²Ȳ.
3. **A content bound in law functionals that falls with concentration** (Theorem 9): for every cubic, every dimension
   and every C¹ profile (raw, tilted, B, degree 5),

       ‖c[h]‖ ≤ √λ₁·sd[(vh)′(V)] + √λ₂·‖V·h′(V)‖₂,   λ₁ ≤ 2u,  λ₂ ≤ u,  λ₁² + λ₂² ≤ (3/4)δ.

   The two factors on the right depend on the law of |q|² only (one concave, one linear in the law), so a law layer
   can carry the bound as it carries 11.49. It uses no Stein pair and no supremum over the radius. **P**
   **[v2]** With the caps alone this is bound (F) of `CONTENT_LEMMA_D5.md` §3.4 (same proof). Only the last constraint
   was new; with its sharp form δ/2 it is active only for χ < 10, and Theorem 9 equals (F) for χ ≥ 10.
4. **How it compares (N, peak row, tilt 3/5).** **[v2]** For χ ≥ 20/3 (10 with the sharp constant) these compare
   (F) with 11.49, which `CONTENT_LEMMA_D5.md` §4.3 already does at degree 5. Against the coefficient γ of 11.49:
   - with Gaussian-law shadows it is the smaller one for χ above 1.6, 5.4, 7.9, 9.8 at u = 0.009, 0.02, 0.03, 0.0463,
     by 1.6–5 times at χ = 16;
   - on the Wick monomial it is 6.7–8.1 times smaller than γδ (four energies), and 2.2–2.6 times the true C²
     (u = 0.02, 0.0463);
   - on 400 random two-variable cubics per energy it is below γδ on 100 % (u = 0.02) and 96 % (u = 0.0463), and
     the worst value of min(T9, γδ)/D is 0.100 and 0.115 (0.100 and 0.116 after an adversarial search), against
     0.189 and 0.239 for γδ/D alone. Cubics in more than two variables, which reach χ < 9, are not sampled;
   - near the Gaussian (small χ) it is weaker than 11.49: the Bessel step keeps a Gaussian floor in the two law
     functionals.
5. **By-products.** The leading tensor is 2⟨conj(∂_eq), P₁,₁|q|²⟩ + ⟨∂̄_eq, P₂,₀q²⟩, so it sees only the two low
   components of the fourth-moment decomposition, and ‖Π₁(q|q|²)‖² ≤ min{(15/2)uδ, (3√15/4)δ^{3/2}} with a five-line
   proof (Theorem 8; the constant is weaker than the 3√6/4 that 6.3.12 holds as R). Exact Stein-pair representations
   of the two shadows (Propositions 10, 11). A sixth-moment lower cut E|q|⁶ ≥ (3/2)(E|q|⁴)²/E|q|², i.e.
   κ₆ᶜ ≥ (3/2)χ(χ − 2)u³, by the spectral method of Azmoodeh–Malicet–Mijoule–Poly (Proposition 12). **P + C**
6. **From the reading** (`LITERATURE.md`):
   - the first identity of 6.3.21 is the bidegree-(2, 1) case, in operator form, of an exact contraction expansion
     that Chen–Chen–Liu published in 2023 (arXiv:2304.08088, (4.13)); the ledger should cite it. The one-sided
     identity 6.3.20 and the representations 6.3.23–6.3.24 were not found in what was read (a partial reading);
   - the published complex lower bound (Heilman–Jones–Malavolta, arXiv:2609.25462: 1.4 < K_G^ℂ < 1.404898554746)
     uses this repository's witness P₁,₀ − εP₂,₁ and its (h, k, t) row, with ε = 37/50 and the radius 49/50;
   - the standard Malliavin–Stein theorems are absolute and asymptotic and give no signed content/deficit
     inequality at moderate kurtosis, as the record already says; what transfers is the spectral method (moment
     cuts) and the influence language.

**What it does for the two routes.**
- **(B), degree 5. [v2, corrected]** The first version said Theorem 9 is a new law-layer input that beats (S) where
  the band fails. That is wrong: at χ ≥ 10 it is (F), which the law layer already combines with (S). By
  ADDENDUM §§3–5, every failing row has its largest excess at χ = 16 or 30. There the influence corner is attained, so
  no bound on the influences closes a row. What remains is the alignment of the shadows (Corollary 6.1), and the corner
  family X²(aX̄ + bȲ) is a concrete test for it.
- **(A), raw content.** No closure. Theorem 9 gives 0.185·D at the junta law (u = 0.0463) and up to 0.65·D at
  χ ≈ 10. Corollary 6.1 is exact at the junta end, where 6.3.25 is not, and loses up to ×4 where the shadow is not
  aligned with the influence operator.
- **The missing step, sharper.** Keep the contraction 𝒟₁*A_h instead of ‖𝒟₁‖·‖A_h‖: in the leading order it is the
  contraction of the coefficient tensor with the influence matrix (Theorems 7, 8).

## 2. Statements

| # | statement | status | where |
|---|---|---|---|
| T6 | E[ȳ_e q h(V)] = E[∂_eq·(vh)′(V)] + E[q²·conj(∂̄_eq)·h′(V)] for h ∈ C¹ with h, h′ of polynomial growth (complex allowed) | P; C (h = vᵐ, m ≤ 3); N (peak profiles, rel. error ≤ 3.5·10⁻⁵) | NOTE2 §1; check J1; `identity.log` |
| C6.1 | ‖c[h]‖ ≤ √λ₁‖P₁,₁[(vh)′(V)]‖ + √λ₂‖P₂,₀[q²h′(V)]‖, λ₁ = λ_max(J₁) ≤ 2u, λ₂ = λ_max(I₂) ≤ u | P | NOTE2 §1 |
| T7 | P₁,₁\|q\|² has coefficient matrix M = I₂ + J₁ (trace 3u); λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS ≤ ‖M‖²_HS = ‖P₁,₁\|q\|²‖² ≤ (3/4)δ. **[v2]** The last two steps are superseded by T13 | P; C (J2–J4) | NOTE2 §2 |
| T13 | **[v2]** ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS (P₁,₁c₂ has matrix J₁, ‖P₂,₂c₂‖ = ‖I₂‖_HS); δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖²_HS + 2‖I₂‖²_HS; λ₁² + λ₂² ≤ δ/2, equality iff q = cX²Ȳ; χ ≥ 10/n in n variables | P; C (K1–K5, 17 instances); N (searches, n ≤ 4) | ADDENDUM §2 |
| P14 | **[v2]** X²(aX̄ + bȲ): λ₁ = 2u, λ₂ = u, χ = 8p² + 24p + 10 ∈ [10, 42]; so the influence caps cannot be improved by (u, χ) for χ ≥ 10 | P + C | ADDENDUM §3 |
| T8 | E[ȳ_e q\|q\|²] = 2⟨conj(∂_eq), P₁,₁\|q\|²⟩ + ⟨∂̄_eq, P₂,₀q²⟩; ‖Π₁(q\|q\|²)‖² ≤ (3λ₁ + (3/2)λ₂)[(4/3)‖P₁,₁\|q\|²‖² + (2/3)‖P₂,₀q²‖²] ≤ min{(15/2)uδ, (3√15/4)δ^{3/2}}; the unsquared bound 2√λ₁‖P₁,₁\|q\|²‖ + √λ₂‖P₂,₀q²‖ is attained on the Wick monomial | P; C (J1, m = 1) | NOTE2 §2 |
| T9 | ‖c[h]‖ ≤ √λ₁·s_A + √λ₂·s_B with s_A = sd[(vh)′(V)], s_B = ‖Vh′(V)‖₂, λ₁ ≤ 2u, λ₂ ≤ u, λ₁² + λ₂² ≤ (3/4)δ; hence ‖c[h]‖² ≤ u(√2s_A + s_B)² and ‖c[h]‖² ≤ (3δ/4)^{1/2}(s_A^{4/3} + s_B^{4/3})^{3/2}. **[v2]** The capped form is (F) of `CONTENT_LEMMA_D5.md` §3.4; 3/4 may be replaced by 1/2 (T13) | P | NOTE2 §3 |
| P10 | E[w̄q²η(V)] = E[w̄·a·(vm)′(V)] + E[w̄q²m′(V)x] for w ∈ H₂,₀, m = E η(· + uτ); ‖B_h‖² ≤ (‖(vk′)′‖²_∞ + ½‖vk″‖²_∞)δ | P; C (m = vᵏ, k ≤ 2: J5) | NOTE2 §4 |
| P11 | E[w̄ψ(V)] = E[q̄ρ(V)Σ_j conj(∂̄_jw)∂̄_jq] + E[w̄xK′(V)] + E[w̄q̄²aρ′(V)] for w ∈ H₁,₁, K = E ψ(· + uτ) − E ψ(uτ), ρ = K/v | P; C (ψ = vᵐ, m ≤ 3: J6) | NOTE2 §4 |
| P12 | E\|q\|⁶ ≥ (3/2)(E\|q\|⁴)²/E\|q\|²; κ₆ᶜ ≥ (3/2)χ(χ − 2)u³ | P; C on instances | NOTE2 §5; `check_sixth_moment.py` |
| N5 | Corollary 6.1 with exact shadows against the truth: ×1.00 (monomial), ×1.01 (best tensor of 6.4.2), ×1.00–1.02 (H(X) + H(Y)), ×1.12–1.27 (mixed), ×2.8–4.1 (X(\|Y\|² − 1)); raw and tilt, u = 0.02, 0.0463 | N | `results/identity.log` |
| N6 | Theorem 9 with Gaussian and monomial shadows against γ of 11.49 (table in NOTE2 §6) | N | `results/gausslaw.log` |
| N7 | Theorem 9 with each cubic's own law: five families and 400 random two-variable cubics per energy and profile (table in NOTE2 §6); adversarial search for the tilt | N (lower bounds on suprema; two variables) | `results/scan_*.log`, `search.log`, `t9_search.json` |
| N8 | Proposition 10 is below the Bessel value of s_B² only for χ < 0.9–1.4 at the peak | N | `results/prop10.log` |

## 3. Repository statements used

- Proofs: 6.3.20 (Lemma 1 of KAS) in Propositions 10 and 11; 6.3.21 (both identities) in Theorems 7–9 and
  Proposition 10. Theorems 6 and 12 use only Gaussian integration by parts and the spectrum of the
  Ornstein–Uhlenbeck operator.
- Numerics: the peak row and its constants (1.4, 3.14), recomputed as in KAS; the deficit and the profiles (1.8);
  the tilt (11.12); for comparison 11.49 (the coefficients γ), 11.50, 6.3.12, 6.3.25, 6.4.2, and
  `higher-degree/STATUS.md` 4.19 with `CONTENT_LEMMA_D5.md` §11.

## 4. How the results would enter the ledgers

**[v2]** ADDENDUM §6 corrects 6.3.27, 6.3.28 and 4.19 below and adds the rows for T13 and P14.

`research/conjecture-K/STATUS.md` (IDs are suggestions):
- **6.3.26 (new)** Directional identity T6 and Corollary 6.1. P (author only) + C + N.
- **6.3.27 (new)** T7: the second-chaos part of |q|² is the influence matrix; λ₁² + λ₂² ≤ (3/4)δ. P + C. Cross-reference
  3.21(c), which is the converse direction.
- **6.3.28 (new)** T9, the law-level bound. P; the comparison with 11.49 N. Note under 11.49 and 11.55: on (u, χ)
  cells with χ above the crossover a certificate may use min(T9, γδ); its inputs are upper caps of
  E[((vh)′(V) − m)²] and E[V²h′(V)²] over the law layer.
- **6.3.12 (annotate)** T8: the leading tensor equals 2⟨conj(∂_eq), P₁,₁|q|²⟩ + ⟨∂̄_eq, P₂,₀q²⟩; a proved δ^{3/2} bound
  with the weaker constant 3√15/4.
- **6.3.21 (annotate)** cite Chen–Chen–Liu, arXiv:2304.08088, (4.13): the first identity is its bidegree-(2, 1) case
  in operator form (coefficients not matched term by term).
- **6.3.29 (new)** P10, P11: Stein-pair representations of the shadows; the first shadow keeps a mixed term of the
  size of the influence matrix. P + C.
- **3.4 (new input, optional)** P12: κ₆ᶜ ≥ (3/2)χ(χ − 2)u³ for every cubic. P + C. A lower cut; whether the Lean cut
  family already implies it was not checked.
- **§9 (new rows, N)** N5–N8.
- **§15, item 2** the missing step in the form "a bound for 𝒟₁*A_h + 𝒟₂*B_h that keeps the contraction".
- **3.22 (annotate, optional)** the spectral cone of AMMP gives no sign for C_F(a) (LITERATURE §2.2; an elementary
  computation, author only).

`research/higher-degree/STATUS.md`:
- **4.19 (annotate)** T9 as a second law-layer input for (S3-AB), with the profiles h_{A,s}, h_{B,t}: two law
  functionals per sector, and the caps λ₁ ≤ 2u, λ₂ ≤ u, λ₁² + λ₂² ≤ (3/4)δ. No degree-5 number is computed here.

## 5. Files and replay

```
NOTE2.md, LITERATURE.md, README.md
run_all.sh                         replays everything (about an hour on one core; the search takes most of it)
scripts/wick_exact.py              exact Wick calculus over Gaussian rationals (unchanged from the first package)
scripts/check_influence_exact.py   C: checks J1–J6 on random rational cubics, n = 1, 2, 3 (about 2 minutes)
scripts/check_sixth_moment.py      C: Proposition 12 and the real moment relations (2 seconds)
numerics/prof.py, tab.py, core.py  N: peak profiles, B(u), S (as in the first package; tab.py is single-process)
numerics/twovar.py                 N: two-variable quadrature (unchanged apart from its import path)
numerics/influence.py              N: identity | gausslaw | prop10 | scan raw|tilt | search
results/                           logs and JSON of the runs reported here
[v2] ADDENDUM.md
[v2] scripts/check_stein_energy_exact.py   C: Theorem 13, Corollaries 13.1, 13.3, Proposition 14 (17 instances, 1 s)
[v2] scripts/wickfloat.py, fourth.py, check_fourth.py   N: float Wick calculus, E|q|^4 by Wick pairings, cross-check
[v2] scripts/sup_influence.py, sup_fast.py              N: the searches of ADDENDUM §2 (about 25 minutes in all)
[v2] numerics/half.py, corner.py                        N: ADDENDUM §4 (about 2 minutes)
```

All scripts run under `python3 -I` from any directory (each one adds its own folder to the import path). The exact
checks need the standard library only; the numerics need numpy and scipy (run with Python 3.13, numpy 2.5,
scipy 1.18). Run `numerics/tab.py` once before the other numerics.
