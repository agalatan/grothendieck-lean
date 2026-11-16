<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/influence-calculus-2026-11-16/REVIEW.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Review of "Conjecture K: an influence calculus for the content, and a reading of the literature"

Reviewer: independent review agent of claude-b9ee (a session other than the package's author). 16 November 2026,
16:40–18:15 Europe/Bucharest. Reviewed, in this order:

- **version 1**: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/influence-calculus-2026-11-16/package/`
  (`README.md`, `NOTE2.md`, `LITERATURE.md`, `scripts/`, `numerics/`, `results/`, `run_all.sh`; identical to the zip
  beside it apart from `scripts/__pycache__`, which an earlier replay left: its bytecode equals a fresh compile of
  the delivered `wick_exact.py`, and I removed it from my copy; SHA-256 list in `review/delivered_sha256.txt`).
  Sections 1–7 are the review of this version, and they were written before the second one arrived;
- **version 2**: `…/influence-calculus-2026-11-16/package-v2/` (identical to `conjecture-K-influence-calculus-v2.zip`;
  list in `review/delivered_v2_sha256.txt`): a new `ADDENDUM.md`, marked corrections in `NOTE2.md` and `README.md`,
  six new scripts and seven new logs; `LITERATURE.md`, the old scripts and the old logs are unchanged. Its review is
  **section 8**, and section 9 (the ledger rows) covers both versions.

Nothing tracked was edited, committed, pushed or posted. Each package was copied to a new folder, every script was
read before it ran, Python ran with `-I` (`/usr/local/bin/python3`: 3.12.3, numpy 2.3.5, scipy 1.17.1, sympy 1.14.0,
mpmath 1.3.0), at most two processes at a time, single-threaded.

Labels as in `research/conjecture-K/STATUS.md` §0. "Re-derived": I followed the written proof line by line and
recomputed every constant. "Replayed": I ran the delivered code. "Independent": my own code, with a different
method, in `review/`.

## 1. Verdict

**Status after version 2 (section 8).** The second version concedes the first finding below (its erratum E1 is
F0) and contains the third (its Theorem 13 and Corollary 13.1 are F1; its Proposition 14 is the family of §5 (v)),
with further correct statements (Corollaries 13.2, 13.3, the equality case, Consequence 14.1) and correct numbers.
I confirm all of them, exactly and with my own code. It does not address findings F3, F4, F5, F6 and F7, which
stand; F4 applies to its new table too. Its conclusion for the degree-5 band ("sharper influence bounds close no
row") is right.

**Version 1. Every numbered statement of `NOTE2.md` is correct, and no proof has a gap.** The numerics replay (six of the nine
logs identical; the other three differ in the 15th digit, in a printed diagnostic or in trailing `time` lines), and
my own code reproduces the headline numbers: 0.11615 for min(T9, γδ)/D at u = 0.0463 (delivered 0.11614), and on the
Wick monomial T9/C² = 2.17 and 2.66 at u = 0.02 and 0.0463. **But the two central statements are already in the
repository, and the comparison that carries the summary leaves out the bounds that matter.** In order of weight:

1. **Theorem 6 and bound (a) of Theorem 9 are not new (F0).** They are the identity and the bound (F) of
   `research/higher-degree/sources/degree5-capped-2026-11-16/CONTENT_LEMMA_D5.md` §3.4, with the same proof, in
   master since 15:02 of 16 November and so in the commit the package is written against. The degree-5 study
   already uses (F) in its law layer and already records that it does not close the band. For χ ≥ 20/3, which
   contains the range χ = 12–16 where the README places the gain, Theorem 9 *is* (F). What the package adds to (F) is
   the constraint through δ (Theorem 7), which acts for χ < 20/3 only, and Corollary 6.1 with exact shadows.
2. **The comparison "against 11.49" leaves out the other content bounds of the tilt (F4).** 11.30 has
   ‖c_{3/5}‖² ≤ (19321/10⁶)u and ‖c_{3/5}‖ ≤ 1/50, and the step before the first of them, the plain Bessel bound
   ‖c‖² ≤ 𝔅 = min_m E[V(h(V) − m)²], is itself a law functional. On the package's own 400 random cubics per energy
   the worst value of (bound)/D is: γδ 0.189 and 0.239; the ledger's H = min{γδ, (19321/10⁶)u, 1/2500} 0.149 and
   0.063; 𝔅 0.071 and 0.051; Theorem 9 0.100 and 0.123; all together 0.070 and 0.051 (u = 0.02 and 0.0463). So
   Theorem 9 does not lower the worst case at either energy. Its gain is on the junta side: χ above about 16 at
   u = 0.02 (up to 2 times below every other bound), and only near χ = 40 at u = 0.0463 (at most 10 %).
3. **Theorem 7(b) is not sharp, and the sharp form is two lines away (F1).** ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS
   exactly, so λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS = ½(δ − ‖P₂,₀q²‖² − ‖P₃,₁q²‖²) ≤ **δ/2**, with equality on X²Ȳ. (For
   λ₂ alone the degree-5 note already had this constant.) It replaces (3/4)δ in Theorems 7–9: the caps of Theorem 9
   are the only constraint from χ = 10 on, bound (b) gains the factor (2/3)^{1/2}, the constant of Theorem 8 becomes
   3√10/4. This is the part of the package that is new for the law layer, and F1 makes it stronger.
4. **Three sentences overstate** (F3, F5): Corollary 6.1 is not exact on equal independent Wick blocks; the
   "crossover" values χ = 1.6, 5.4, 7.9, 9.8 belong to a law that no cubic has (and 5.4 is 5.2); "100 %" and
   "0.189, 0.239" are sample statements.
5. **The literature paragraph on Heilman–Jones–Malavolta reverses the attribution** (F6), and one quotation of
   Guo–Fang–Lu is not in their text (F7). The identification with Chen–Chen–Liu (4.13) is right, and I matched it
   term by term (§7), so the caveat "coefficients not matched" can go.
6. **The consumer form** that a law layer needs is stated and proved in §5: (F) with the cap set through δ, in
   closed form; its concavity in the law (which does not follow from "one factor concave, one linear" alone); and
   linear majorants. A law layer that knows only moments sees it as ‖c‖² ≤ W₀(u)·u², W₀ = 0.79, 0.75, 0.71, 0.65 at
   the four energies (N): the gain on real cubics needs the constraints that exclude two-point laws.

| # | proof (P) | exact check (C) | numerics (N) |
|---|---|---|---|
| T6 | **correct**; it is the identity in the proof of (F), `CONTENT_LEMMA_D5.md` §3.4 (F0); the first line holds for every polynomial q; h ∈ C¹ can be weakened (§2) | replayed; independent (h = vᵐ, m ≤ 3; scalar and operator form) | replayed; independent (monomial to 10⁻¹³, two-variable cubics to 10⁻⁸ or better) |
| C6.1 | **correct** | independent (floating comparison on exact data) | replayed; "exact on equal blocks" is wrong as worded (F3) |
| T7 | **correct**; (b) is not sharp: the sharp constant is 1/2 (F1) | replayed; independent, with both identities of 6.3.21 and the sharpening | — |
| T8 | **correct** (identity, both constants; equality on the monomial: 32 = 24 + 8) | independent (identity exact; the chain on instances) | "2.734" recomputed: 2.7341 |
| T9 | **correct**, (a) and (b) included; (a) is the bound (F) of `CONTENT_LEMMA_D5.md` §3.4 (F0); new: the constraint through δ, which with F1 is λ₁² + λ₂² ≤ δ/2 | independent on polynomial profiles | replayed; independent (§4) |
| P10 | **correct** (identity and norm bound) | replayed; independent (m = vᵏ, k ≤ 2) | replayed (`prop10.log` identical) |
| P11 | **correct** (also for complex ψ) | replayed; independent (ψ = vᵐ, m ≤ 3) | — |
| P12 | **correct**; it is Proposition 3.1 of Azmoodeh–Malicet–Mijoule–Poly applied to Re q (statement read in their source) | replayed; independent, every step of the proof (moments of Re q, Dirichlet form, Stein identity) | — |
| N5 | — | — | replayed: `identity.log` identical |
| N6 | — | — | replayed: identical apart from the printed h′(0) (F8); independent: every s_A, s_B and T9/δ reproduced; the crossover at u = 0.02 is 5.2, not 5.4 (F5) |
| N7 | — | — | replayed: scans identical, search log identical, JSON to 10⁻¹²; independent: the six families and the search records reproduced to 10⁻⁵, and every statistic of the 400 + 400 random cubics reproduced with my code (§4); **the benchmark is incomplete (F4)**: with all bounds Theorem 9 does not lower the worst case |
| N8 | — | — | replayed: identical |
| literature | Chen–Chen–Liu (4.13): **confirmed, term by term**; HJM numbers and Guo–Fang–Lu value: **confirmed**; two wordings wrong (F6, F7) | (4.13) and (4.14) in bidegree (2, 1), exact, on 29 cubics | — |

## 2. The proofs

**Conventions (NOTE2 §0), checked first.** With the density π⁻ⁿe^{−|y|²}: E[∂_jF] = E[ȳ_jF], E[∂̄_jF] = E[y_jF].
∂_e = Σē_j∂_j is antilinear in e and ∂̄_e = Σe_j∂̄_j linear, so E[ȳ_eF] = E[∂_eF] and ∂_eF̄ = conj(∂̄_eF).
⟨e, J₁e⟩ = Σ ē_aJ₁[a, b]e_b = E|∂_eq|² and ⟨e, I₂e⟩ = E|∂̄_eq|², so both matrices are Hermitian and positive
semidefinite in the same index convention (this is needed for M = I₂ + J₁ ⪰ 0 and for tr(J₁I₂) ≥ 0).
tr J₁ = Σ_a‖∂_aq‖² = ⟨q, N₁q⟩ = 2u and tr I₂ = ⟨q, N₂q⟩ = u. **"Largest influence"** means
λ₁ = λ_max(J₁) = sup_{|e|=1}‖∂_eq‖² and λ₂ = λ_max(I₂) = sup_{|e|=1}‖∂̄_eq‖²: suprema over all unit directions of ℂⁿ,
not over coordinates, so they do not depend on the basis. Wick monomial: λ₁ = 2u, λ₂ = u; N equal independent blocks:
2u/N, u/N. Correct.

**Theorem 6.** Correct. Φ = q·h(V) is C¹ on ℝ²ⁿ: where V > 0 by the chain rule, and where V = 0 because V ≥ 0 has a
minimum there, so V(y + t) = O(|t|²) and h(V(y + t)) − h(0) = O(|t|²); the gradient h′(V)∇V is continuous. One
integration by parts gives E[ȳ_eΦ] = E[∂_eΦ], and ∂_eV = q̄·∂_eq + q·conj(∂̄_eq) gives the first line. The second
line uses conj(∂_eq) ∈ H₁,₁ and ∂̄_eq ∈ H₂,₀. Three remarks on the hypotheses.
- *The first line uses nothing about q*: it holds for every polynomial q, for instance a cubic plus a quintic. The
  chaos structure enters only in the second line (which projections see the two radial factors) and in the caps
  (tr J₁ = 2u, tr I₂ = u, and Theorem 7). For q with a part in H₃,₂ of energy u₅ the caps become 2u₃ + 3u₅ and
  u₃ + 2u₅, and the Bessel step for the first term still needs Π₁q = 0 (so that conj(∂_eq) ⊥ 1).
- *h ∈ C¹ is what the proof uses, and less suffices.* If h ∈ C[0, ∞) ∩ C¹(0, ∞) with v·h′(v) → 0 as v → 0 and with
  (vh)′, vh′ of polynomial growth, then Φ is still C¹, because |q·h′(V)·∇V| ≤ 2V|h′(V)|·|∇q|. This covers a profile
  that is a C¹ function of |q| (h(v) = H(√v)), for which h′ is unbounded at 0. The peak profiles are smooth in v, so
  the stated hypothesis covers them. Unlike 6.3.23, which needs only a continuous h, Theorem 6 needs a derivative:
  Theorems 6, 8, 9 and Corollary 6.1 are statements for differentiable profiles.
- Complex h: every step is ℂ-linear in h. Correct.

**The operators 𝒟₁, 𝒟₂.** 𝒟₁e = conj(∂_eq) = Σe_j·conj(∂_jq) and 𝒟₂e = ∂̄_eq = Σe_j∂̄_jq are linear in e (the
conjugation in 𝒟₁ is what makes it linear). With c[h] identified with its coefficient vector c_j = E[ȳ_jqh(V)],
⟨y_e, c[h]⟩ = ⟨e, c⟩_{ℂⁿ} = ⟨𝒟₁e, A_h⟩ + ⟨𝒟₂e, B_h⟩, so c = 𝒟₁*A_h + 𝒟₂*B_h, and ‖𝒟₁‖² = sup_{|e|=1}⟨e, J₁e⟩ = λ₁,
‖𝒟₂‖² = λ₂. **Corollary 6.1** follows. Correct.

**Theorem 7.** (a) E[conj(:y_aȳ_b:)F] = E[∂̄_b∂_aF] by two integrations by parts; for F = qq̄ the two terms with a
second derivative of q or q̄ vanish because ∂_a∂̄_bq ∈ H₁,₀ ⊥ q; the other two are I₂[a, b] and J₁[a, b]. So
P₁,₁|q|² = Σ M[a, b]:y_aȳ_b: with M = I₂ + J₁. (b) tr(J₁I₂) ≥ 0, a Hilbert–Schmidt norm dominates the largest
eigenvalue, and (4/3)‖P₁,₁|q|²‖² ≤ δ is the second identity of 6.3.21 (which I checked exactly again, §3). Correct.
On the monomial: M = 6, ‖M‖² = 36 = (3/14)·168. **The bound of (b) is not sharp: see F1 in §6.**

**Theorem 8.** h(v) = v in Theorem 6: (vh)′ = 2v, h′ = 1. Cauchy–Schwarz with the weights (3, 3/2) against (4/3, 2/3):
(2√λ₁α + √λ₂β)² ≤ (3λ₁ + (3/2)λ₂)((4/3)α² + (2/3)β²). The bracket is at most δ (6.3.21, second identity).
3λ₁ + (3/2)λ₂ ≤ 15u/2, and ≤ (9 + 9/4)^{1/2}(λ₁² + λ₂²)^{1/2} ≤ (3√5/2)(3δ/4)^{1/2} = (3√15/4)δ^{1/2} = 2.9047δ^{1/2}.
Correct. With F1 the last constant is (3√5/2)(1/2)^{1/2} = 3√10/4 = 2.372, still weaker than the 3√6/4 = 1.837 that
6.3.12 holds as R. "2.734 if the two constraints are optimised jointly": with λ₁² + λ₂² ≤ ‖P₁,₁|q|²‖² = α² in place
of 3δ/4, the maximum of α((2α)^{4/3} + β^{4/3})^{3/2} under (4/3)α² + (2/3)β² = 1 is 2.7341, at α = (√3/2)cos t,
β = (√6/2)sin t with t = 0.253 (`review/small_checks.log`). Correct.

**Theorem 9.** Corollary 6.1; ‖A_h‖ ≤ ‖(vh)′(V) − m‖₂ for every constant m because A_h ∈ H₁,₁ ⊥ 1 (for complex h the
minimum over complex m is the standard deviation); ‖B_h‖ ≤ ‖q²h′(V)‖₂ = (E[V²|h′(V)|²])^{1/2}. (a): λ₁ ≤ 2u, λ₂ ≤ u.
(b): Hölder with exponents 4 and 4/3 on (√λ₁, √λ₂)·(s_A, s_B). The threshold: (2u)² + u² ≤ (3/4)χu² iff χ ≥ 20/3.
Correct as stated. With F1: (b) reads ‖c[h]‖² ≤ (δ/2)^{1/2}(s_A^{4/3} + s_B^{4/3})^{3/2} and the threshold is χ ≥ 10.

**Proposition 10.** Lemma 1 (6.3.20) with G = w̄·q·m(V): m = 𝒦_uη is C¹ with m − um′ = η when η is continuous, so G
is admissible; ∂_jw̄ = 0; Σ_j∂_jG·∂̄_jq = w̄·a·(vm)′(V) + w̄·q²·m′(V)·c₂; subtract u·E[w̄q²m′(V)]. Norm bound: for a unit
w, |E[w̄·a·(vk′)′(V)]| ≤ ‖(vk′)′‖_∞‖a‖ and |E[w̄·q²·k″(V)·x]| ≤ ‖vk″‖_∞·E[|w||x|] ≤ ‖vk″‖_∞‖x‖; then Cauchy–Schwarz
against ‖a‖² + 2‖x‖² ≤ δ. k″ = (k′ − h′)/u exists because h ∈ C¹. Correct (the bound is empty when the two suprema
are infinite, as for polynomial profiles).

**Proposition 11.** K = 𝒦_uψ − Eψ(uτ) is C² with K(0) = 0, so ρ(v) = ∫₀¹K′(sv)ds is C¹ on [0, ∞): this is where
ψ ∈ C¹ is used. Lemma 1 with G = w̄·q̄·ρ(V): the three terms are as written ((vρ)′ = K′), E[Gq] = E[w̄K(V)], and
K − uK′ = ψ − Eψ(uτ). Correct; "real" is not needed. With ψ(v) = v it reads E[w̄V] = ⟨W, I₂⟩ + E[w̄x], that is
**P₁,₁c₂ = J₁** as a coefficient matrix; this is one half of F1.

**Proposition 12.** Re q is in the real third chaos; E[Γ·P′(X)²] = ⟨P(X), −LP(X)⟩ ≤ 9·E[P(X)²] because P(X) has
chaos components of order at most 9; the Stein identity gives E[Γ·P′(X)²] = 3((9/5)m₆ − 2c·m₄ + c²m₂); the difference
is (18/5)m₆ − 12c·m₄ + 6c²m₂ ≥ 0 for every c, whose discriminant gives m₄² ≤ (3/5)m₂m₆; circularity
(q(e^{iθ}y) = e^{iθ}q(y)) gives m₂ = u/2, m₄ = (3/8)E|q|⁴, m₆ = (5/16)E|q|⁶; (9/64)(E|q|⁴)² ≤ (3/32)u·E|q|⁶.
κ₆ᶜ ≥ ((3/2)(χ + 2)² − 6 − 9χ)u³ = (3/2)χ(χ − 2)u³. Correct. The factor 3 of the chaos order cancels, so the real
inequality holds in every chaos: it is Proposition 3.1 of AMMP, equation (3.7), which I read in the TeX source of
arXiv:1305.6579v4 ("If X is an eigenfunction of L, then E[X⁴]² ≤ (3/5)E[X⁶]E[X²]"); their Theorem 3.1 is the
moment matrix ((k − ij/(i + j − 1))E[X^{i+j}]) as `LITERATURE.md` says. So Proposition 12 is a translation of a
published inequality to H₂,₁, which is how the package presents it.

**By hand on q = y(|y|² − 2)** (r = |y|², E rᵏ = k!):

| quantity | value |
|---|---|
| u = E[r(r − 2)²] | 6 − 8 + 4 = 2 |
| E\|q\|⁴ = E[r²(r − 2)⁴] | 720 − 960 + 576 − 192 + 32 = 176, so δ = 168, χ = 42 |
| ∂q, ∂̄q | 2(r − 1), y²; J₁ = 4E(r − 1)² = 4 = 2u, I₂ = E r² = 2 = u |
| P₁,₁\|q\|² | E[(r³ − 4r² + 4r)(r − 1)] = 24 − 30 + 16 − 4 = 6, so P₁,₁\|q\|² = 6(r − 1) = (I₂ + J₁)(r − 1); 36 ≤ 126 = (3/4)δ |
| content with h = v | E[ȳq\|q\|²] = E[r²(r − 2)³] = 120 − 144 + 72 − 16 = **32** |
| Theorem 6 | E[∂q·2V] = 4·6 = 24, E[q²·conj(∂̄q)] = E[r²(r − 2)²] = 8; 24 + 8 = 32 |
| Theorem 8 | P₂,₀q² = 4y², ‖P₂,₀q²‖² = 32; 2√4·6 + √2·√32 = 24 + 8 = 32 (equality); squared 1024 = 128u³; Cauchy–Schwarz 15·(48 + 64/3) = 1040 = 130u³ |
| 6.3.21 | 168 = (2/3)·32 + (1/3)·96 + (4/3)·36 + (2/3)·100 = 32 + 96 + 2·20 |
| F1 | ‖c₂ − u‖² = E(r² − 2)² = 20 = 4² + 2² |
| Proposition 12 | E\|q\|⁶ = 90816 = 11352u³ ≥ (3/2)·176²/2 = 23232 = 2904u³ |

All agree with the package and with my exact checker.

## 3. Independent exact check (C)

`review/exact_wickbasis.py` (log: `review/exact_wickbasis.log`; 18 s). Method, chosen to share nothing with
`wick_exact.py` (monomial basis, E[y^αȳ^β] = δα!, projections by E[∂^α∂̄^βF]/(α!β!)) and little with the earlier
reviewer's sympy script (real coordinates, Lagrange filters):

- every polynomial is stored in the **Wick basis** :y^αȳ^β:; products use the contraction formula
  H_{a,b}H_{c,d} = Σ_{i,j} C(a,i)C(d,i)i!·C(b,j)C(c,j)j!·H_{a+c−i−j,b+d−i−j} per variable; the expectation is the
  constant coefficient; a chaos projection is the selection of a bidegree; ∂_j:y^αȳ^β: = α_j:y^{α−e_j}ȳ^β:;
- the cubic is written directly as Σ f_{abc}:y_ay_bȳ_c:; coefficients are Gaussian integers (every identity is
  homogeneous);
- a self-test validates the calculus against monomial multiplication with the explicit Hermite polynomials, the
  moments δα!, the Leibniz rule and Gaussian integration by parts (one variable up to degree (4, 4); random
  polynomials in two and three variables).

Checked, exactly unless marked:

| statement | what is asserted |
|---|---|
| T6 | E[ȳ_eqVᵐ] = (m + 1)E[∂_eqVᵐ] + m·E[q²·conj(∂̄_eq)V^{m−1}], m = 0…3, Gaussian-integer direction e; and the operator form c_j = ⟨conj(∂_jq), A_h⟩ + ⟨∂̄_jq, B_h⟩ with the shadows computed as projections (m = 1, 2; m = 3 in one and two variables) |
| C6.1, T9 | ‖c‖ ≤ √λ₁‖A_h‖ + √λ₂‖B_h‖ ≤ √λ₁s_A + √λ₂s_B ≤ (a), (b) for h = vᵐ (exact data, eigenvalues in floating point); Bessel ‖A_h‖² ≤ s_A², ‖B_h‖² ≤ s_B² exactly |
| T7 | M read off the Wick expansion of \|q\|² equals I₂ + J₁ (Gram matrices of the derivatives); traces 2u, u; ‖P₁,₁\|q\|²‖² = ‖M‖²_HS = ‖J₁‖² + ‖I₂‖² + 2tr(J₁I₂), tr(J₁I₂) ≥ 0; (4/3)‖M‖² ≤ δ |
| 6.3.21 | both identities, and ‖a‖² + 2‖x‖² = δ − (3/4)‖P₃,₁q²‖² |
| F1 | P₁,₁c₂ = J₁, ‖P₂,₂c₂‖² = ‖I₂‖²_HS, ‖c₂ − u‖² = ‖J₁‖² + ‖I₂‖², δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2(‖J₁‖² + ‖I₂‖²) |
| T8 | the identity (T6, m = 1, operator form); the chain of inequalities on each instance |
| P10 | w = y_ay_b, m = vᵏ, k ≤ 2 |
| P11 | w = :y_aȳ_b:, ψ = vᵐ, m ≤ 3 |
| P12 | the inequality; m₂ = u/2, m₄ = (3/8)E\|q\|⁴, m₆ = (5/16)E\|q\|⁶ for Re q; Γ = 2Σ\|∂_jX\|², EΓ = 3m₂; E[ΓP′(X)²] = Σ_k k‖J_kP(X)‖² ≤ 9E[P(X)²] and = 3((9/5)m₆ − 2cm₄ + c²m₂) for five values of c |
| Chen–Chen–Liu | (4.13) and (4.14) in bidegree (2, 1), with the paper's contractions computed as tensors (§7) |

Instances: the Wick monomial (with the hand values above asserted); a two-variable cubic with all six
basis elements, hence with repeated-index terms; X²Ȳ; X(|Y|² − 1); H(X) + H(Y); a three-variable cubic with 14 of
the 18 basis elements (repeated-index and all-distinct terms); y₀y₁ȳ₂ + i·y₀y₂ȳ₁ − 2y₁y₂ȳ₀; seven members of the
family :X²·conj(aX + bY): (Theorems 6–8 only); and 24 random Gaussian-integer cubics in one, two, three and four
variables (2, 12, 8, 2; in four variables Theorem 6 to m = 2 and without Propositions 10, 11). **All pass.** The
largest value of (‖J₁‖² + ‖I₂‖²)/δ is 1/2, at X²Ȳ; on the random batch it is 0.299.

## 4. Replay and independent numerics (N)

**Replay** of the unmodified package scripts in a private copy (`review/replay_stage1.sh`, `replay_stage2.sh`; the
replayed logs are in `review/replay-logs/`):

| log | result |
|---|---|
| `check_influence_exact.log` | identical (134 s) |
| `check_sixth_moment.log` | identical output; the delivered file has four extra lines of `time` output at its end |
| `core.log` | g₀ differs in the 15th digit (…876 against …877); S, u*, j₀, B₀ identical |
| `identity.log` | identical |
| `gausslaw.log` | every s_A, s_B and T9/δ identical; the two printed values h′(0) differ (1.1737 against 1.1639 for the tilt, 2.1660 against 2.1581 raw): F8 |
| `prop10.log` | identical |
| `scan_tilt.log`, `scan_raw.log` | identical (175 s and 143 s) |
| `search.log`, `t9_search.json` | `search.log` identical (1426 s); the four values of the JSON agree to 10⁻¹² and the coefficients to 10⁻¹³ |

**Independent evaluation** (`review/own_numerics.py`, log `review/own_numerics.log`): my own profiles (angular
averages by ₂F₁ instead of elliptic integrals, tanh-sinh quadrature in T, a table in v near 0 and quintic splines),
my own quadrature for two-variable cubics (the three invariant coordinates |X|², |Y|², relative phase, with composite
Gauss–Legendre rules), the cap in closed form.

- *Profiles.* B₀ = 1.371879280600872 and S = 1.3739535256615 at u* = 0.0403448 (ledger: 387√π/500 =
  1.371879280600869…, 1.3739535256614 < S < 1.3739535256616, v₀ = 0.0403448). j₀ and g₀ agree with the ledger to
  3·10⁻¹¹ (my tanh-sinh rule is cut at the T^{−1/2} endpoint), and φ, j, g agree with the package's replayed table on
  its 2481 nodes to 2·10⁻¹³, 3·10⁻¹¹, 3·10⁻¹¹. Spline derivatives agree with difference quotients of direct
  quadrature to 10⁻⁸ for v > 0; h′(0.05) = 0.8580 and h′(0.2) = 0.4182 for the tilt, as the package prints.
- *Theorem 6 in floating point.* Monomial: relative error at most 6·10⁻¹⁴ at the eight (profile, energy) pairs.
  Two-variable cubics with non-zero content, and the search records: at most 2.4·10⁻⁸ of ‖c‖.
- *Wick monomial, Theorem 9 against the truth (headline).* χ = 42, so T9 = u(√2s_A + s_B)² with either constant.

  | tilt, u | C²/D | T9/D | T9/δ | T9/C² | γδ/D | γδ/T9 | H/T9 (F4) |
  |---|---|---|---|---|---|---|---|
  | 0.009 | 0.0101 | 0.0218 | 0.0075 | 2.17 | 0.1461 | 6.69 | 6.69 |
  | 0.02 | 0.0117 | 0.0254 | 0.0058 | 2.17 | 0.1924 | 7.58 | 3.96 |
  | 0.03 | 0.0119 | 0.0274 | 0.0049 | 2.31 | 0.2090 | 7.64 | 2.16 |
  | 0.0463 | 0.0114 | 0.0302 | 0.0040 | 2.66 | 0.2426 | 8.03 | 1.10 |

  Raw profile: T9/D = 0.1107, 0.1427, 0.1614, 0.1858 and C²/D = 0.0499, 0.0691, 0.0786, 0.0876. The package has the
  same numbers except at u = 0.0463, where `scan_tilt.log` and `scan_raw.log` give T9/D = 0.0300 and 0.1851: the
  28-node Gauss–Laguerre rule under-resolves a one-variable cubic by 0.4–0.7 % (my one-dimensional rule with 528
  nodes and my three-dimensional rule at two resolutions give 0.0302 and 0.1858). So "2.2–2.6 times the true C²" is
  2.2–2.7.
- *Gaussian-law shadows.* Every s_A, s_B and T9/δ of `gausslaw.log` reproduced to the printed digits. T9 = γδ at
  χ = 1.59, 5.19, 7.90, 9.82 with the constant 3/4 (the package says 1.6, 5.4, 7.9, 9.8: F5), and at 1.06, 3.56,
  6.60, 9.70 with 1/2.
- *Two-variable families* (both energies, both profiles; six cubics): C²/D, T9/D, T9/δ, γδ/D of the scan logs
  reproduced to one unit of the last printed digit, apart from the monomial line above and the near-junta
  "best tensor" at u = 0.0463 (T9/D = 0.0314 and 0.1918 against 0.0312 and 0.1913, for the same reason).
- *The search records (headline 0.116).* (value, χ) by my quadrature: (0.10524, 9.2143), (0.10021, 9.8692),
  (0.12903, 9.2063), (0.11615, 10.6459); delivered: 0.10524, 0.10021, 0.12902, 0.11614 at the same χ. My two
  resolutions agree to 10⁻⁵. With the constant 1/2 the four values are 0.1012, 0.0996, 0.1240, 0.1161.
- *The random scan, re-evaluated* (`review/own_scan.py`, log `own_scan.log`): I regenerated the 400 + 400
  coefficient vectors from the seed and evaluated each cubic with my code. Every statistic of `scan_tilt.log` is
  reproduced within 2·10⁻⁴: χ ∈ [9.8, 39.6] and [9.7, 40.0]; T9/D min, median, max 0.0270, 0.0610, 0.1006 and
  0.0318, 0.0732, 0.1244; γδ/D max 0.1890 and 0.2385; min(T9, γδ)/D max 0.0997 and 0.1152; T9 < γδ on 100 % and
  96 %; the three bands with the same counts (139, 184, 77 and 127, 178, 95). T9 ≥ C² and H ≥ C² on all 800.
- *The cap.* The closed form of §5 against a brute-force grid on 300 random inputs: relative difference at most
  1.3·10⁻⁶ (the grid is below).

## 5. The consumer form of Theorem 9

The degree-5 certificate needs a bound whose right side is a functional of the law of V = |q|², concave in the law,
plus u and δ. Here is the sharpest such corollary of Theorem 9, with F1 built in. For χ ≥ 10 it is the bound (F)
that the degree-5 study already has (F0); the new content is the cap set for χ < 10, the concavity, and the linear
form.

**Setting.** h ∈ C¹[0, ∞) with h, h′ of polynomial growth (or the weaker hypothesis of §2); ψ = (vh)′. For a
probability law μ on [0, ∞) with all moments,

    a(μ) = Var_μ ψ = min_m E_μ|ψ − m|²,        b(μ) = E_μ[v²·|h′(v)|²],

and for u, δ > 0

    Λ(u, δ) = {(λ₁, λ₂): 0 ≤ λ₁ ≤ 2u, 0 ≤ λ₂ ≤ u, λ₁² + λ₂² ≤ δ/2},
    𝒯(u, δ; μ) = max over λ ∈ Λ(u, δ) of (√(λ₁·a(μ)) + √(λ₂·b(μ)))².

**Corollary R.**

(i) For every n and every q ∈ H₂,₁(ℂⁿ), with μ_q the law of |q|², u = E|q|² and δ = E|q|⁴ − 2u²:

    ‖c[h](q)‖² ≤ 𝒯(u, δ; μ_q).

(ii) *Closed form.* With A = a(μ)^{1/2} = s_A, B = b(μ)^{1/2} = s_B and L = (δ/2)^{1/2}:
- if δ ≥ 10u²: 𝒯 = u·(√2·A + B)² (this is (F));
- if δ < 10u²: let (λ₁*, λ₂*) = L·(A^{2/3}, B^{2/3})/(A^{4/3} + B^{4/3})^{1/2}. Then
  𝒯 = L·(A^{4/3} + B^{4/3})^{3/2} if λ₁* ≤ 2u and λ₂* ≤ u;
  𝒯 = (√(2u)·A + (L² − 4u²)^{1/4}·B)² if λ₁* > 2u;
  𝒯 = ((L² − u²)^{1/4}·A + √u·B)² if λ₂* > u.

(iii) 𝒯 is nondecreasing in u and in δ, and **μ ↦ 𝒯(u, δ; μ) is concave** on the convex set of laws. So on a cell
u ≤ ū, δ ≤ δ̄ of a law layer, 𝒯(ū, δ̄; μ) is a concave functional of the law that bounds ‖c[h]‖².

(iv) *Linear majorants.* For every λ ∈ Λ(u, δ), s ∈ (0, 1) and constant m:

    (√(λ₁a) + √(λ₂b))² ≤ E_μ[(λ₁/s)·|ψ − m|² + (λ₂/(1 − s))·v²|h′|²],

with equality for m = E_μψ and s = √(λ₁a)/(√(λ₁a) + √(λ₂b)). In particular, for every cubic, every s ∈ (0, 1) and
every m,

    (L)    ‖c[h](q)‖² ≤ u·E[(2/s)·|ψ(V) − m|² + (1/(1 − s))·V²|h′(V)|²],

a **linear** functional of the law, times u. It holds for every χ; for δ ≥ 10u² its infimum over (s, m) is 𝒯.

(v) *Nothing is lost against Theorem 9, and the cap set is sharp where it matters.* 𝒯 is the supremum of the right
side of Theorem 9 over all pairs (λ₁, λ₂) that the three constraints allow. For every χ between 10 and 42 the corner
(2u, u) is attained by a cubic: q = :X²·conj(aX + bY): has (λ₁, λ₂) = (2u, u) for all (a, b)
(χ = 10 + 24t + 8t² with t = |a|²/(|a|² + |b|²); exact, `exact_wickbasis.log`), so no constraint in (u, δ) alone
improves Λ there.

*Proof.* (i) Theorem 9 with F1. (ii) The objective √λ₁·A + √λ₂·B is concave and increasing in λ and Λ is convex, so
the maximum is on the upper-right boundary of Λ. Along a face λ₁ = 2u or λ₂ = u the objective increases, so the
maximum is on the arc λ₁² + λ₂² = L² inside the box, or at the corner (2u, u) if L² ≥ 5u². On the arc the Lagrange
condition is λ₁^{3/2}/A = λ₂^{3/2}/B, that is the point λ* (the equality case of Hölder with exponents 4 and 4/3);
if λ* violates one side of the box, the maximum is the end of the arc on that side (for L² < 5u² the two violations
exclude each other). (iii) Λ grows with u and δ. For the concavity, two steps. First, s(λ, x) = √(λ₁x₁) + √(λ₂x₂)
is jointly concave in (λ, x) ∈ ℝ²₊ × ℝ²₊ (a sum of geometric means), so φ(x) = max_{λ∈Λ} s(λ, x) is concave in
x = (a, b), being a partial maximum of a jointly concave function over a convex set; and φ(tx) = √t·φ(x). Second,
the square of a nonnegative concave function that is homogeneous of degree ½ is concave: for θ, α ∈ (0, 1) write
θx + (1 − θ)y = α·(θx/α) + (1 − α)·((1 − θ)y/(1 − α)); concavity and homogeneity give
φ(θx + (1 − θ)y) ≥ √(αθ)·φ(x) + √((1 − α)(1 − θ))·φ(y), and α = θφ(x)²/(θφ(x)² + (1 − θ)φ(y)²) turns the right
side into (θφ(x)² + (1 − θ)φ(y)²)^{1/2}. So 𝒯 = φ² is concave and nondecreasing in (a, b). Finally a(μ) is concave
in μ (a minimum of linear functionals), b(μ) is linear, and a nondecreasing concave function of a concave and a
linear functional is concave. (iv) (x + y)² ≤ x²/s + y²/(1 − s), with a ≤ E_μ|ψ − m|². ∎

Two remarks for the user of the corollary.
- NOTE2 says "s_A² is a concave functional of the law and s_B² a linear one", which is true, but the concavity of
  the bound needs the argument of (iii): a maximum over λ of concave functions is not concave in general, and
  (√(λ₁a) + √(λ₂b))² is not jointly concave in (λ; a, b). (Midpoint concavity and superadditivity of the closed form
  were also tested on 4000 random pairs: no violation.)
- *Several sectors.* For the A and B contents of a degree-5 row, 𝒯_A + 𝒯_B is a valid concave bound. In the linear
  form (L) the same corner serves both sectors, so a sum of two bounds (L) is again linear in the law. A joint
  maximum over λ of the sum is sharper, but I do not have its concavity.

**For which laws it beats ‖c‖² ≤ γδ (11.49).** The certificate takes min(𝒯, γδ). 𝒯 < γδ if and only if

    χ ≥ 10:                 χ > (√2·s_A + s_B)² / (γu);
    χ < 10, Hölder branch:   χ > (s_A^{4/3} + s_B^{4/3})³ / (2γ²u²)

(and the corresponding inequality on the two edge branches). It is a condition on the pair (s_A, s_B) of the law
against the law's own χ: the laws for which it holds are the concentrated ones, because both functionals stay
bounded (s_A ≤ ½·osc ψ, s_B ≤ sup|vh′|) while γδ grows with χ. For the tilt 3/5 at the peak row (all N, my code):

- *No law-free statement in the range of cubics.* ψ = (vh)′ rises from 0 to 0.2861 at v = 0.61 and falls to
  −(g₀ + (3/5)j₀) = −0.0240 at infinity, so osc ψ = 0.3101; sup|vh′| = 0.0852 at v = 0.25. Hence 𝒯 ≤ 0.0927·u for
  every law, which is below γδ only for χ ≥ 205, 105, 82, 62 at u = 0.009, 0.02, 0.03, 0.0463: beyond χ = 42.
- *The worst case over laws* (`review/own_lawlevel.py`: linear programmes, with the minimax form of (iv)). Over all
  laws with E V = u and E V² ≤ (2 + χ)u², the supremum of 𝒯 is W₀(u)·u² with W₀ = 0.794, 0.749, 0.710, 0.652 at
  u = 0.009, 0.02, 0.03, 0.0463, as soon as χ ≥ 14.9, 6.2, 3.9, 2.2 (below that it is smaller). The extremal law has
  two atoms, at 0 and at v₁ = 0.152, 0.163, 0.177, 0.194, with mass u/v₁ at v₁; the second moment is then inactive
  (a vanishing mass far away restores it), and the radius bound 3.7 is inactive too. Consequences: (1) **for every
  law, 𝒯 < γδ as soon as χ > W₀/γ = 15.8, 17.0, 18.9, 20.1**; for smaller χ some law has 𝒯 > γδ. (2) A law layer
  that constrains only u and δ gets from Theorem 9 exactly ‖c‖² ≤ W₀(u)·u², which is better than the δ-free bounds
  of 11.30 at u = 0.009 and 0.02 (2.15u², 0.97u²) and worse at u = 0.03 and 0.0463 (0.44u², 0.19u²). (3) The laws
  of cubics are far from the extremal one (monomial: 𝒯 = 0.315u², 0.244u², 0.206u², 0.170u²), so the gain on real
  cubics is available to a certificate only through the constraints that exclude two-point laws (the Stein family
  of the law layer), as for the radius in `higher-degree/STATUS.md` 4.18.
- *Cubics.* On two-variable cubics with their own laws, 𝒯 < γδ for χ above about 9.9 (u = 0.02) and 10.6
  (u = 0.0463): the delivered search, reproduced in §4. X²Ȳ (χ = 10, zero content) has 𝒯 > γδ at both energies.
- *γδ is not the bound to beat,* and the plain Bessel functional 𝔅 is a law functional too: F4.

## 6. Findings

**F0. Theorem 6 and bound (a) of Theorem 9 are already in the repository.**
`research/higher-degree/sources/degree5-capped-2026-11-16/CONTENT_LEMMA_D5.md` §3.4, "A new law-functional bound
(F)" (a research worker of claude-b9ee; in master since 3b402e85c, 16 November 15:02, hence in `ddbf7f58`, the commit
the package names), states, for every remote cubic q ∈ H₂,₁ and Φ(x) = x·h(|x|²) ∈ C¹ of polynomial growth,

    (F)   ‖Π₁Φ(q)‖ ≤ √(2u·Var a(V)) + √(u·E[V²h′(V)²]),      a(V) = h + Vh′,

and proves it by "E[ℓ̄Φ(q)] = E[a(V)∂_āq] + E[q²h′(V)∂_āq̄]", the centring of the first term, Cauchy–Schwarz, and
E|∂_āq|² ≤ λ_max(G₁) ≤ tr G₁ = 2u, E|∂_āq̄|² ≤ tr G₂ = u. The display is Theorem 6. (F) is Theorem 9 with the caps
λ₁ ≤ 2u, λ₂ ≤ u, that is bound (a). The proofs coincide step by step. The same note
- uses (F) in its law layer (§3.5; §4.3 and §8.4: "what closes now, with (S), (F), the Stein law layer, …"), and
  records that the band t ≤ 0.855 stays open, the obstacle being "the Gaussian floor of (F)" (§0 items 4 and 7);
- considers the replacement of tr G₁ by λ_max(G₁) (§9.2 item 4, "Gram dominance in (F)"), proves there
  λ_max(G₂) ≤ u·(χ/2)^{1/2}, and says that "the holomorphic analogue has no χ-control", with the example X·P(Y)
  (χ = 2, λ_max(G₁) = u = ½·tr G₁).

The package cites this note (its §§11.3 and 11.4) but not its §3.4, and presents Theorem 6 as "a second exact
representation of the content" and Theorem 9 as "a new proved content bound" and "a second law-layer input beside
(S)". Remark (iv) of NOTE2 §1 names the real form in 11.29 and KMA as predecessors, not (F).

What is new against that note:
- **Theorem 7**: the holomorphic influence is controlled by δ too, jointly with the antiholomorphic one. With F1
  this is λ₁² + λ₂² ≤ δ/2; the note's λ_max(G₂) ≤ u(χ/2)^{1/2} is one half of it, and the note's example X·P(Y) is an
  equality case (λ₁ = u, λ₂ → 0, δ = 2u²). So there is a χ-control of the holomorphic influence; what the example
  shows is that it cannot be better than λ₁ ≤ u(χ/2)^{1/2}. (Theorem 7(b) as delivered, with 3/4, is weaker for λ₂
  than what the note had.)
- hence the cap set of Theorem 9 and bound (b). For χ ≥ 20/3 (χ ≥ 10 with F1) Theorem 9 is exactly (F). Below, it
  is smaller than (F): with the shadows of the Gaussian law at u = 0.0463 by the factors 2.5, 1.8, 1.25 at
  χ = 1, 2, 4 as delivered, and 3.1, 2.2, 1.5, 1.1 at χ = 1, 2, 4, 8 with F1 (in ‖c‖²; my numerics);
- Corollary 6.1 with exact shadows (equality at the junta), Theorem 8, Propositions 10–12, and the degree-3
  numerics, which are the first evaluation of (F) on the peak row of the cubic game.

Consequence for route (B): the degree-5 study has this law-layer input already. Where the README places the gain
(χ = 12–16) the two bounds coincide. The new part is the cap set for χ < 10: in the law layer, (F) can be replaced
by 𝒯 of §5. (Version 2 says the same in its erratum E1: §8, point 1.)

**F1. Theorem 7(b) with the sharp constant 1/2.** For every q ∈ H₂,₁(ℂⁿ):

    (1)  P₁,₁c₂ = Σ J₁[a, b]·:y_aȳ_b:   and   ‖P₂,₂c₂‖² = ‖I₂‖²_HS,   hence   ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS;
    (2)  δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖²_HS + 2‖I₂‖²_HS;
    (3)  λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS ≤ δ/2.

Equality holds in both steps of (3) for q = X²Ȳ (λ₁ = 2u, λ₂ = u, δ = 10u²), and in the limit for X·P(Y) with a
diffuse P ∈ H₁,₁ (λ₁ = u, λ₂ → 0, δ → 2u²: the example of `CONTENT_LEMMA_D5.md` §9.2), so 1/2 is the sharp
constant: no direction has influence above u·(χ/2)^{1/2}. The antiholomorphic half, λ₂ ≤ u(χ/2)^{1/2}, is in that
note (P, author only); the identity (1), the holomorphic half and the joint form are new. (Version 2 has (1)–(3)
as its Theorem 13 and Corollary 13.1, with the same proof and with the equality case settled: §8, points 2–3.)

*Proof.* c₂ = Σ_j|w_j|² with w_j = ∂̄_jq ∈ H₂,₀, and c₂ ∈ H₀,₀ ⊕ H₁,₁ ⊕ H₂,₂ (6.3.20). As in Theorem 7(a),
⟨:y_aȳ_b:, |w|²⟩ = E[∂_a∂̄_b(ww̄)] = E[∂_aw·conj(∂_bw)] for a holomorphic w; summing over j,
Σ_jE[∂̄_j∂_aq·conj(∂̄_j∂_bq)] = ⟨∂_bq, N₂∂_aq⟩ = ⟨∂_bq, ∂_aq⟩ = J₁[a, b], because ∂_aq ∈ H₁,₁. For the top component,
P₂,₂(w·conj(w′)) = :w·conj(w′): for holomorphic quadratic forms, and ⟨:w₁w̄₁′:, :w₂w̄₂′:⟩ = ⟨w₁, w₂⟩·⟨w₂′, w₁′⟩ by
Wick's theorem, so ‖P₂,₂c₂‖² = Σ_{j,k}|⟨w_j, w_k⟩|² = ‖I₂‖²_HS. (2) is then the first identity of 6.3.21, and (3)
follows as in the note. ∎ Exact on every cubic of §3. (Proposition 11 with ψ(v) = v and Theorem 7(a) already give
P₁,₁c₂ = J₁.)

Consequences: Theorem 7(b) should read λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS = ‖c₂ − u‖² ≤ δ/2 (the chain through
‖P₁,₁|q|²‖² ≤ (3/4)δ is true and can stay as a statement about M); Theorem 8: 3√10/4 in place of 3√15/4;
Theorem 9: the constraint λ₁² + λ₂² ≤ δ/2, bound (b) with (δ/2)^{1/2}, the caps alone from χ = 10 on. On the
delivered numbers the effect is small, because the worst cases sit at χ ≈ 9–11 (§4).

**F2. The concavity in the law needs a proof,** and the bound has a linear form: §5 (iii), (iv).

**F3. "Exact on equal independent Wick blocks" is not true as worded** (README §1 item 1; NOTE2 §1 remark (ii),
"Same for equal independent Wick blocks"). On q = H(X) + H(Y) Corollary 6.1 is an equality for h = v and h = v², and
strict from h = v³ on: the shadow A_h then has a component along :XȲ:, since
E[X̄Y·V³] = 9·E[X̄q₁|q₁|²]·conj(E[Ȳq₂|q₂|²]) ≠ 0, which the range of 𝒟₁, spanned by |X|² − 1 and |Y|² − 1, does not
see. Exact: for q = :X²X̄: + :Y²Ȳ: and h = v³ the shadow A_h has the coefficient 36864 = 4·9·32² along :XȲ:
(3922560 along :XX̄:), and (bound)²/‖c‖² = 1 + 1.009·10⁻⁴ (`review/small_checks.log`). The delivered `identity.log`
has ×1.01 and ×1.02 on this cubic. Say "equality on the Wick monomial; within 2 % on H(X) + H(Y) at the peak
profiles (N)". (README item 1 also says 1.18–1.27 for the mixed cubic; the log and row N5 have 1.12–1.27.)

**F4. The benchmark is incomplete: γδ is not the bound to beat.** README §1 item 4, NOTE2 §§6–7 and the proposed
note under 11.49 compare Theorem 9 with γδ alone. For the same content c_{3/5} the record has more:
- ledger 11.30 (P + C): ‖c_{3/5}(q)‖² ≤ (19321/10⁶)·u at every energy, and ‖c_{3/5}(q)‖ ≤ 1/50 for u ≤ 0.0463. Like
  bound (a) they do not grow with δ, and 11.44 already takes the minimum H = min{γδ, (19321/10⁶)u, 1/2500};
- the step before the first of them is a law functional of the same kind as Theorem 9, with a one-line proof:
  since Π₁q = 0, c[h] = Π₁[q·(h(V) − m)] for every m, so by Bessel

      ‖c[h]‖² ≤ 𝔅(law of V) := min_m E[V·(h(V) − m)²] = E[V·h(V)²] − (E[V·h(V)])²/u,

  linear in the law for fixed m and concave after the minimum. ((19321/10⁶)u is its supremum over laws.) Near the
  Gaussian its floor is 9 times below that of Theorem 9: for h ≈ h′(0)·v and the Gaussian law, 𝔅 = 2h′(0)²u³
  against 18h′(0)²u³ (numerically 0.11 at all four energies).

In units of u², γδ, the two bounds of 11.30, and 𝔅 and T9 on the Wick monomial:

| u | γχ | (19321/10⁶)/u | 1/(2500u²) | γδ is the smallest of the three for | monomial: 𝔅 | monomial: T9 |
|---|---|---|---|---|---|---|
| 0.009 | 0.0502χ | 2.147 | 4.938 | χ < 42.8 | 0.981 | 0.315 |
| 0.02 | 0.0441χ | 0.966 | 1.000 | χ < 21.9 | 0.486 | 0.244 |
| 0.03 | 0.0375χ | 0.644 | 0.444 | χ < 11.9 | 0.317 | 0.206 |
| 0.0463 | 0.0325χ | 0.417 | 0.187 | χ < 5.7 | 0.191 | 0.170 |

On the package's 400 random two-variable cubics per energy (my re-evaluation, `review/own_scan.log`; T9 with the
constant 1/2), the largest value of (bound)/D, with the χ where it occurs:

| u | γδ | H | 𝔅 | T9 | min(T9, γδ) | min(T9, H) | min(H, 𝔅) | min(T9, H, 𝔅) |
|---|---|---|---|---|---|---|---|---|
| 0.02 | 0.1890 (39.6) | 0.1488 (21.1) | 0.0711 (15.0) | 0.0995 (9.8) | 0.0995 | 0.0995 | 0.0711 | 0.0700 |
| 0.0463 | 0.2385 (39.9) | 0.0628 (10.1) | 0.0506 (16.2) | 0.1228 (9.7) | 0.1152 | 0.0628 | 0.0506 | 0.0506 |

T9 is below H on 100 % (u = 0.02) and 3 % (u = 0.0463) of the cubics, below 𝔅 on 58 % and 3 %, and below both on
58 % and 3 %; the ratio 𝔅/T9 runs from 0.65 to 1.93 (median 1.05) at u = 0.02 and from 0.37 to 1.11 (median 0.58)
at u = 0.0463. On the families (𝔅/D, H/D, T9/D): at u = 0.02 monomial 0.0505, 0.1004, 0.0254; mixed 0.0566, 0.1173,
0.0320; H(X) + H(Y) 0.0647, 0.1415, 0.0478; X(|Y|² − 1) 0.0639, 0.1229, 0.0657; at u = 0.0463 monomial 0.0339,
0.0332, 0.0302; mixed 0.0381, 0.0382, 0.0400; H(X) + H(Y) 0.0443, 0.0459, 0.0593; X(|Y|² − 1) 0.0418, 0.0504,
0.0853. At the four search records 𝔅/D is 0.067, 0.066, 0.047, 0.049, where min(T9, γδ)/D is 0.097, 0.100, 0.103,
0.116.

So the sentences "the worst value of min(T9, γδ)/D is 0.100 and 0.116, against 0.189 and 0.239 for γδ/D alone",
"6.7 to 8.1 times below γ" and "it beats 11.49 on the high-kurtosis side, which is where §11.4 reports the largest
excesses (χ = 12–16)" are arithmetically right and answer the wrong question. What stands at degree 3 (N,
two-variable cubics, two energies): **Theorem 9 does not lower the worst case of the content bounds against the
deficit at either energy (0.071 → 0.070 and 0.051 → 0.051). It is the smallest bound on the junta side: for χ
above about 16 at u = 0.02, by up to 2 times (monomial: 0.0254 against 0.0505), and only near χ = 40 at
u = 0.0463, by at most 10 % (monomial: 0.0302 against 0.0332). At χ = 10–16 it is 1.0–1.6 times above 𝔅 at
u = 0.02 and 2–2.8 times above it at u = 0.0463 (the families X²Ȳ and X(|Y|² − 1)).** For degree 5
the same comparison has to be made with the degree-5 forms of these bounds; `CONTENT_LEMMA_D5.md` §2 replaced the
range-centred branch by (F) because (F) is better at the junta, and does not keep 𝔅 as a law functional, which at
degree 3 is the better of the two on 42 % and 97 % of the sampled cubics.

**F5. Four numerical statements.** (a) The "crossover" values χ = 1.6, 5.4, 7.9, 9.8 combine s_A, s_B of the
Gaussian law (which has χ = 0) with a free χ; no law has both. They illustrate the mechanism and are not statements
about cubics, as README item 4 ("it is the smaller one for χ above …") and "route (B)" ("χ ≳ 8–10 at
u = 0.03–0.0463") read. With each cubic's own law the delivered search has T9 > γδ at χ = 9.2 at both energies, and
the crossover on two-variable cubics is near χ = 9.9 (u = 0.02) and 10.6 (u = 0.0463); no own-law data exist at
u = 0.03. (b) The value at u = 0.02 is 5.2, not 5.4: between the tabulated χ = 4 and 8 the cap is not a power of χ
(the cap λ₂ ≤ u binds from χ = 3.4 on), and 5.4 is what linear interpolation of the table gives. (c) "Below γδ on
100 % (u = 0.02)" is a statement about the 400 random cubics; the search of the same package has a cubic with
T9 > γδ at u = 0.02 (0.1052 against 0.0967). "0.189 and 0.239 for γδ/D alone" are maxima over the random sample; on
the Wick monomial γδ/D is 0.1924 and 0.2426. (d) The monomial lines of the scans at u = 0.0463: 0.0302 and 0.1858,
not 0.0300 and 0.1851 (§4). None of (b)–(d) changes a conclusion.

**F6. Heilman–Jones–Malavolta: the attribution is reversed.** README item 6 and LITERATURE §3 say that the published
lower bound "uses this repository's witness P₁,₀ − εP₂,₁ and its (h, k, t) row". arXiv:2609.25462 (21 September
2026) is prior published work, which the repository lists among the published bounds and cites (`README.md`,
"Related work"). Say: "HJM's lower bound uses the same witness family P₁,₀ − εP₂,₁ (ε = 37/50) and the same
reduction to parabolas t² − 2ℓt + C as this repository's rows". The numbers are right (§7).

**F7. A quotation of Guo–Fang–Lu that is not in their text.** LITERATURE §3: going further "would require" joint
information. Their text (arXiv:2609.07000v1): "An improvement beyond 1.35584697425050 within the multiplier family
[…] requires a sharper estimate of ‖T_n‖_{∞→1}. Joint information about u, w may lead to a sharper estimate."
Drop the quotation marks, and "may", not "would".

**F8. Small points on the files.** (a) `gausslaw.log` prints h′(0) from the spline derivative divided by 2s at
s = 10⁻⁶; the value is noise at the 1 % level and differs between machines (my replay: 1.1737; delivered: 1.1639;
my own table: 1.1556 for the tilt and 2.1592 raw). Nothing else uses h′ that close to 0 unweighted, and every
other number of the log reproduces. (b) `results/check_sixth_moment.log` ends with four lines of `time` output that `run_all.sh` does not
produce. (c) `scripts/__pycache__` in the handoff copy is a by-product of an earlier replay, not part of the zip.

**F9. Degree 5.** Theorem 9 applies to the contents c_{A,s}, c_{B,t} of `CONTENT_LEMMA_D5.md` §1 as it stands,
because there the remote variable is a cubic q ∈ H₂,₁ and the contents have the form Π₁[q·h(|q|²)]; the package
does not show that the profiles h_{A,s}, h_{B,t} are C¹ in v (the weaker hypothesis of §2 would do), and it computes
no degree-5 number. Both are said in the README; the ledger row should keep both.

## 7. Literature claims

**Chen–Chen–Liu, arXiv:2304.08088 (one version, 17 April 2023; TeX source read).** Equation (4.13) is the display in
the proof of Proposition 4.4: for F = I_{p,q}(f), h the reverse complex conjugate of f, l = p + q, l′ = 2(p ∧ q),

    E|F|⁴ − 2(E|F|²)² − |E F²|² = Σ_{0<i+j<l} C(p,i)²C(q,j)²(p!q!)²·‖f ⊗_{i,j} h‖²
        + Σ_{r=1}^{l′−1} (2p − r)!(2q − r)!·‖φ_r‖²
        + 1_{p≠q}·(2p − l′)!(2q − l′)!·C(p, p∧q)⁴C(q, p∧q)⁴((p∧q)!)⁴·‖f ⊗_{p∧q,p∧q} f‖²,
    φ_r = Σ_{i+j=r} C(p,i)C(q,i)C(q,j)C(p,j)·i!j!·f ⊗̃_{i,j} f.

Their normalisation is ours (E[Z(g)·conj(Z(h))] = ⟨g, h⟩, I_{p,q} of a symmetric tensor is the Wick polynomial), so
q = I₂,₁(f) with f the coefficient tensor, and E q² = 0. In bidegree (2, 1), coefficient by coefficient:

| term of (4.13) at (p, q) = (2, 1) | equals |
|---|---|
| first sum: 16‖f ⊗₁,₀ h‖² + 4‖f ⊗₀,₁ h‖² + 4‖f ⊗₂,₀ h‖² + 16‖f ⊗₁,₁ h‖² | 2‖J₁‖²_HS + 2‖I₂‖²_HS = **2‖c₂ − u‖²**, because ‖f ⊗₀,₁ h‖ = ‖f ⊗₂,₀ h‖ = ½‖I₂‖_HS and ‖f ⊗₁,₀ h‖ = ‖f ⊗₁,₁ h‖ = ¼‖J₁‖_HS (their (4.3)) and by F1 |
| second sum (r = 1): 3!·1!·‖φ₁‖², φ₁ = 2f ⊗̃₁,₀ f + 2f ⊗̃₀,₁ f | **‖P₃,₁q²‖²**, because P₃,₁q² = I₃,₁(φ₁) by the product formula |
| third term: 2!·0!·2⁴·‖f ⊗₁,₁ f‖² = 32‖f ⊗₁,₁ f‖² | **‖P₂,₀q²‖²**, because P₂,₀q² = I₂,₀(4f ⊗₁,₁ f) |

So (4.13) at (2, 1) is δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖c₂ − u‖²: **the first identity of 6.3.21, term by term.** The
package's claim is right; its caveat "coefficients not matched term by term" can be removed. What the ledger adds to
the published identity is the operator reading of the first sum (c₂, and now J₁, I₂). The companion (4.14) of the
same paper reads, at (2, 1), δ = 8‖f ⊗₁,₀ f‖² + 8‖f ⊗₀,₁ f‖² + ‖P₂,₂|q|²‖² + ‖P₁,₁|q|²‖² + ½‖P₂,₀q²‖²; the second
identity of 6.3.21 is not this display but a combination within the same family. Both (4.13) and (4.14) are
verified exactly, with the contractions computed as tensors, on 29 cubics (5 named, 24 random; one to four
variables; `exact_wickbasis.py`, function `ccl413`). Sources: `https://arxiv.org/e-print/2304.08088`, and likewise
for the three papers below.
"6.3.20, 6.3.23, 6.3.24 not found in what was read" is a statement about a partial reading and is worded so.

**Heilman–Jones–Malavolta, arXiv:2609.25462 (one version, 21 September 2026; abstract and TeX source read).**
1.4 < K_G^ℂ < 1.404898554746: abstract and main theorem. T_n = P₁,₀ − (37/50)P₂,₁; "ε = 37/50, ρ = 49/50";
sup_n‖T‖_{∞→1} < 2857/4000 < 5/7; E|q| ≤ (49/50)‖q‖₂ for q ∈ H₂,₁; "the nine certified pairs (ℓ_i, C_i)" with
parabolas t² − 2ℓ_it + C_i; a six-sided die in the upper bound; Haagerup's conjectured value 1.404575934663742….
All as the package says. 1.404599395362 − 1.404575934664 = 2.35·10⁻⁵, and 49/50 against 0.95133: right.
Wording: F6.

**Guo–Fang–Lu, arXiv:2609.07000 (one version, 7 September 2026; abstract, and the TeX source for the ceiling).**
K_G^ℂ > 1.35584631827168: abstract. The ceiling of the criterion: 1.35584631827168 < K* < 1.35584697425050, so
"below 1.355847" is right. The multiplier is T_n = Q₀ − ρΠ₁ − Σ_{ℓ∈Λ}β_ℓQ_ℓ; I did not count the "ten" projections.
Wording: F7.

**Azmoodeh–Malicet–Mijoule–Poly, arXiv:1305.6579v4 (TeX source).** Theorem 3.1 (the moment matrix) and Proposition 3.1
(E[X⁴]² ≤ (3/5)E[X⁶]E[X²], equation (3.7)) are as cited; W_k is defined as LITERATURE §2.2 writes it. The Mehler-type
formula of §2.2 is correct: it is ∂²_y of Mehler's kernel at y = x (five lines, re-derived). Its use ("no sign for
C_F(a)") is a remark about a method, not a theorem.

The other entries of `LITERATURE.md` (Nourdin–Peccati, Biermé–Bonami–Nourdin–Peccati, Ebina–Nourdin–Peccati,
Nourdin–Peccati–Swan, Chen–Poly, Campese, the second Chen–Chen–Liu paper, the real-constant papers) were not opened.

## 8. Version 2

`package-v2` adds `ADDENDUM.md` (an erratum, Theorem 13, Corollaries 13.1–13.3, Proposition 14, Consequence 14.1,
numbers, a reading of the degree-5 band) and marks the corrected places of `NOTE2.md` and `README.md` with **[v2]**.
Sections 1–7 above were written before it arrived. Three of its points coincide with findings made there
independently: its erratum E1 is F0; its Theorem 13 and Corollary 13.1 are F1 (same statement, the same two-step
proof); its Proposition 14 is the family :X²·conj(aX + bY): of §5 (v), with χ = 8p² + 24p + 10 where I had
10 + 24t + 8t². I derived them without the addendum; whether its author had seen this review I cannot say, but the
addendum's proofs are complete in themselves, and I have checked them line by line.

| claim of version 2 | verdict | exact check (C) | numerics (N) |
|---|---|---|---|
| E1: Theorem 9 with the caps alone is (F) of `CONTENT_LEMMA_D5.md` §3.4, same proof; only the constraint on λ₁² + λ₂² is new | **correct** (= F0); one clause to adjust, below | — | — |
| E2: the constant 3/4 is superseded; the route through ‖P₁,₁\|q\|²‖² cannot give 1/2 | **correct** | independent: three exact Gaussian-rational cubics with ‖P₁,₁\|q\|²‖²/δ = 0.507330, 0.558797, 0.591726 (n = 2, 3, 4) | searches replayed: the 22 maxima reproduce within 2·10⁻⁶ (0.507, 0.559, 0.592 for ‖P₁,₁\|q\|²‖²/δ) |
| T13: P₁,₁c₂ has matrix J₁; ‖P₂,₂c₂‖ = ‖I₂‖_HS; ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS | **correct** (= F1); facts (N) and (W) re-derived | K1–K3 replayed (log identical, 17 instances); independent: 70 cubics, and (N), (W) on random elements | — |
| C13.1: δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖² + 2‖I₂‖²; λ₁² + λ₂² ≤ δ/2; equality iff q = cX²Ȳ; λ₁, λ₂ ≤ u(χ/2)^{1/2} | **correct**, the equality case included | K4 replayed; independent | λ₁² + λ₂² reaches 0.500000 (n = 2, 3), 0.499999 (n = 4): replayed |
| C13.2: χ ≥ 10/n in n variables | **correct** | independent (asserted on 17 random cubics, n ≤ 4) | — |
| C13.3: ‖P₂,₂\|q\|²‖² = ½‖P₂,₀q²‖² + ‖P₃,₁q²‖² + ‖J₁‖² + ‖I₂‖² − 4tr(J₁I₂) | **correct** | K5 replayed; independent | — |
| P14: q = a:X²X̄: + bX²Ȳ has u = 2(s + t), λ = (2u, u), ‖P₂,₀q²‖² = 32s², ‖P₃,₁q²‖² = 96s² + 96st, χ = 8p² + 24p + 10 | **correct** | the package's checker prints the two norms as ratios and does not assert them; **independent: asserted exactly on 12 members, 5 with complex (a, b)** | — |
| Consequence 14.1: for 10 ≤ χ ≤ 42 no constraint on (λ₁, λ₂) in terms of (u, χ) improves (F) | **correct** (= §5 (v)) | — | — |
| §4, first table (`half.log`): (F), 3/4, 1/2 with Gaussian shadows; crossovers 1.59 → 1.06, 5.19 → 3.56, 7.90 → 6.60, 9.82 → 9.70 | — | — | replayed (identical); independent: 144 numbers within 5·10⁻⁵, crossovers identical |
| §4, corner family (`corner.log`): at χ = 16, u = 0.0463: truth 0.0056, Corollary 6.1 with exact shadows 0.039, (F) 0.090, 11.49 0.145 of D | numbers **correct**; the comparator is incomplete (F4), below | — | replayed (identical in every meaningful digit); independent: all six rows, the row at u = 0.02 and the raw row reproduced to the last printed digit |
| §5: every failing row of `CONTENT_LEMMA_D5.md` §8.4 has its largest excess at χ = 16 or 30; sharper influence bounds close no row | **correct** | — | — |

**1. The erratum.** Both copies of the note (`handoff/research-degree5/claude-research-2026-11-15/degree5-cert/` and
`research/higher-degree/sources/degree5-capped-2026-11-16/`) are identical apart from the comment line of the
second. §3.4 is as quoted in F0. E1 is right, and so are its consequences: the comparisons of NOTE2 §6 at χ ≥ 20/3
compare (F) with 11.49, and README "(B)" is withdrawn. One clause should change. E1 lists Theorem 6 as unaffected,
"the exact shadow representation, which (F) is not". The first line of Theorem 6 is the display in the proof of (F),
E[ℓ̄Φ(q)] = E[a(V)∂_āq] + E[q²h′(V)∂_āq̄], and the intermediate bound with λ_max(G₁) is in that proof as well. What
is the package's own is the second line (the projections P₁,₁, P₂,₀ of the two radial factors) and Corollary 6.1.

**2. Theorem 13.** (N): on a basis element, Σ_j‖∂̄_j:y^αȳ^β:‖² = Σ_jβ_j²·α!(β − e_j)! = |β|·α!β!, and distinct basis
elements have distinct or vanishing images under each ∂̄_j. (W): the H₂,₂ part of R·conj(S) for R, S ∈ H₂,₀ is the
uncontracted term, and ⟨:R conj S:, :R′ conj S′:⟩ = Σ conj(r_α)r′_α·α!·Σ s_β conj(s′_β)·β! = ⟨R, R′⟩·conj⟨S, S′⟩.
(a) ∂̄_b∂_a(R̄_jR_j) = conj(∂_bR_j)·∂_aR_j because R_j and ∂_aR_j are holomorphic; summing over j and using (N) on
H₁,₁ gives J₁[a, b]. (b) (W) with R = S = R_j. (c) the three components. Correct, line by line; this is the proof
of F1. By hand: the monomial, 20 = 16 + 4; X²Ȳ/√2, where c₂ − u = ½:|X|⁴: + 2:|X|²:, 1 + 4 = 5 = 4 + 1.

**3. Corollaries 13.1–13.3 and `CONTENT_LEMMA_D5.md` §9.2 item 4.**
- 13.1: equality in λ₁² + λ₂² ≤ δ/2 needs P₂,₀q² = P₃,₁q² = 0 and rank J₁ = rank I₂ = 1. Rank J₁ = 1 means ∂_eq = 0
  for every e orthogonal to one direction X, so q = :X²·conj(ℓ): = a:X²X̄: + bX²Ȳ; then ‖P₂,₀q²‖² = 32|a|⁴ forces
  a = 0. Correct. The constant 1/2 is attained at χ = 10 only, and it is approached at χ → 2 as well (X·P(Y) for
  λ₁; R(X)Ȳ with R = X₁² + … + X_N² for λ₂, which I checked exactly for N = 1, 2, 3: χ = 2 + 8/N, λ₂ = u).
- 13.2: Σλ_i² ≥ (Σλ_i)²/n for both matrices. Correct. 13.3: the second identity of 6.3.21 minus 13.1, with
  ‖P₁,₁|q|²‖² = ‖J₁‖² + ‖I₂‖² + 2tr(J₁I₂). Correct (monomial: 16 + 96 + 20 − 32 = 100).
- §9.2 item 4 of the degree-5 note has three statements. (i) λ_max(G₂)/u ≤ (χ/2)^{1/2}: true; it is the I₂ half of
  13.1. (ii) "The holomorphic analogue has no χ-control: X·P(Y) … has χ = 2 and λ_max(G₁)/tr G₁ = 1/2": **the first
  clause is false.** λ_max(G₁) ≤ u(χ/2)^{1/2}, that is λ_max(G₁)/tr G₁ ≤ ½(χ/2)^{1/2}; the example is the equality
  case in the limit, so it shows that the control cannot be better, not that there is none. As a bound on the
  dominance λ_max/tr the holomorphic one is even the stronger of the two (it says something for χ < 8, the other
  for χ < 2). (iii) "Fails on shared drivers": **stands**, and for a sharper reason: for χ ≥ 10 the corner (2u, u)
  is attained (Proposition 14), and the cells that bind the band are at χ = 16 and 30.
- *What the ledger must change.* No row of `higher-degree/STATUS.md` repeats the false clause (4.19 does not quote
  item 4), and the note under `sources/` is a verbatim copy that stays as it is. So the correction is one new row
  there (4.25 in §9 below) that states the two Gram bounds and Consequence 14.1 and names §9.2 item 4 as corrected,
  and one false-statement item in the K ledger (item 96).

**4. Proposition 14 and Consequence 14.1.** ∂_Yq = 0 gives J₁ = diag(2u, 0); ∂̄_Xq = aX², ∂̄_Yq = bX² are parallel,
so I₂ has rank one and trace u. The rotations X → e^{iθ}X, Y → e^{iψ}Y send (a, b) to (e^{iθ}a, e^{i(2θ−ψ)}b), two
independent phases, and the norms are invariant, so each is a quadratic form in (s, t), fixed by three evaluations.
δ = 32s² + 96s² + 96st + 2(4u² + u²) by 13.1, so χ = 10 + (128s² + 96st)/(4(s + t)²) = 8p² + 24p + 10, increasing
from 10 to 42. Correct. My Wick-basis code asserts u = 2(s + t), J₁ = diag(2u, 0), det I₂ = 0, tr I₂ = u,
‖P₂,₀q²‖² = 32s², ‖P₃,₁q²‖² = 96s² + 96st, δ = 128s² + 96st + 10u² and χ = 8p² + 24p + 10 exactly, for
(a, b) = (1, 0), (0, 1), (1, 1), (1, 2), (2, 1), (1, 3), (3, 1), (1 + 2i, 3 − i), (2 − i, 1 + i), (i, 2), (3, 2i),
(2 + 3i, −1 + 4i) (`review/own_v2.log`, A4). The package's `check_stein_energy_exact.py` asserts K1–K5 on seven
members (the monomial, X²Ȳ and five mixed ones) and 10 ≤ χ ≤ 42, and it prints the two norms as ratios to δ; they
agree with the formulas to the four digits printed. So the label "C" of the two norms rests on my check. Consequence 14.1 follows; its scope is the one it
states (constraints in (u, χ) only; for χ < 10 the attained region is not determined).

**5. The numbers and the band.**
- `half.log`: replayed, identical. My own profiles and closed-form cap give the same 144 numbers within 5·10⁻⁵ and
  the same crossovers and gains (2.16, 1.53, 1.25, 1.10 at χ = 2, 4, 6, 8).
- `corner.log`: replayed; it differs from the delivered log only in three ratios that divide by the zero content
  of X²Ȳ. With my own profiles and quadrature, including exact shadows computed as projections
  (`review/own_v2.log`, B2; tilt, u = 0.0463):

  | χ | C²/D | Cor. 6.1, exact shadows | (F) | γδ (11.49) | H (11.30, 11.49) | plain Bessel 𝔅 |
  |---|---|---|---|---|---|---|
  | 10 | 0.0000 | 0.0541 | 0.1220 | 0.1055 | 0.0605 | 0.0435 |
  | 12 | 0.0022 | 0.0481 | 0.1098 | 0.1198 | 0.0573 | 0.0430 |
  | 16 | 0.0056 | 0.0386 | 0.0896 | 0.1448 | 0.0520 | 0.0419 |
  | 20 | 0.0078 | 0.0312 | 0.0738 | 0.1659 | 0.0476 | 0.0409 |
  | 30 | 0.0108 | 0.0190 | 0.0465 | 0.2072 | 0.0397 | 0.0383 |
  | 42 | 0.0114 | 0.0114 | 0.0302 | 0.2426 | 0.0332 | 0.0339 |

  The first four columns are the addendum's, digit for digit; so are its values at u = 0.02 (0.0061, 0.0298, 0.0692,
  0.1267) and for the raw profile (0.0393, 0.2153, 0.4748), and the split at χ = 16: ×6.9 from the truth to
  Corollary 6.1, then ×1.38 for the Bessel step on A_h and ×1.69 for B_h. The last two columns are mine, and they
  are **F4 again**: the addendum compares with 11.49 alone ("11.49 gives 0.145·D"), while the record's 1/2500 gives
  0.052·D and the one-line Bessel functional 𝔅 gives 0.042·D at that cell, less than half of (F) and about the value
  of Corollary 6.1 with exact shadows. So "a ×16 gap between (F) and the truth" is a ×7.5 gap for the best
  law-level bound, and at u = 0.0463 Corollary 6.1 with exact shadows improves on 𝔅 only from χ ≈ 14 on. (At u = 0.02,
  χ = 16: 𝔅 0.0630, (F) 0.0692, H 0.1267.) The reading "the missing step is a cancellation inside ⟨𝒟₁e, A_h⟩" is
  right; its size at degree 3 is overstated by the comparator.
- §8.4 of the degree-5 note: the scan is over χ ∈ {1, 2, 4, 8, 16, 30}; the six failing rows have their largest
  excess at (u/σ*², χ) = (1.00, 30) for t = 0.80, (1.00, 16) for t = 0.82, 0.84, 0.85, 0.855, and (0.90, 16) for
  t = 0.845, as the addendum says. All are at χ ≥ 10, where no cap set in (u, χ) changes (F). **So the
  conclusion is right: no failing row closes through the influences**, and Corollary 13.1 changes only cells that
  are not the row's maximum.

**6. Replay of the new checks.** `check_stein_energy_exact.log`: identical (1 s; 17 instances). `check_fourth.log`:
identical apart from the last one or two of 17 digits in two numbers (the pairing formula with 44 classes and 176
pairings against the polynomial calculus, nine random tensors, n ≤ 3). `half.log`: identical. `corner.log`: as
above. The searches: `sup_influence.log` (697 s): the 12 maxima are identical to the six digits printed (the file
differs in the fifth digit of a residual of size 10⁻¹⁴); `sup_fast_a.log` and `sup_fast_b.log` (66 s and 108 s): the
ten maxima agree within 2·10⁻⁶ (L at n = 4: 0.499997 against 0.499999; l1 at n = 4: 0.409569 against 0.409570), and
the maximisers differ in the third or fourth digit where the maximum is flat. (The first line of `sup_influence.log`
prints 38.9 and 2·10⁻¹⁴: the first number is the comparison with the transposed matrix, not an error.) Three of the
maxima are now exact: the replayed maximisers of ‖P₁,₁|q|²‖²/δ, rounded to Gaussian rationals with denominator 1000,
have the ratios 33286984867465/65612131852248 = 0.507330 (n = 2, χ = 9.38), 99415591108926/177910160648298 = 0.558797
(n = 3, χ = 5.79) and 98774336282879/166925671642596 = 0.591726 (n = 4, χ = 4.04) in my exact calculus
(`review/own_v2.log`, A6, with the coefficients). So "the route through ‖P₁,₁|q|²‖² cannot give 1/2" (E2) is
certified, not only observed.

**What version 2 leaves open, from sections 1–7.** F3 (README item 1 still says "exact on … equal independent Wick
blocks"). F4 (the benchmark; it now also concerns ADDENDUM §0 item 5 and §4). F5 (README item 4 still has 5.4,
where the addendum's own table has 5.19; "100 %"; "0.189, 0.239"). F6, F7 (`LITERATURE.md` and README item 6 are
unchanged). And three small ones: Theorem 8 is listed as unaffected, but its second constant becomes 3√10/4 with
Corollary 13.1; the first line of Theorem 6 is in the proof of (F) (point 1); the "C" of the two norms of
Proposition 14 is not asserted by the package's checker (point 4).

## 9. Proposed ledger rows (both versions)

Numbering as the coordinator gave it: K ledger from 6.3.31, items of §§13–14 from 96, higher-degree ledger from
4.25. Statuses after this review: a proof is **P** when its author is a Claude session of the user (16 November
2026) and a review worker of claude-b9ee re-derived it line by line; **C** means exact on instances, replayed and
repeated by the reviewer's independent checker; **N** floating point, replayed, the headline numbers re-evaluated
independently.

`research/conjecture-K/STATUS.md`:

- **6.3.31 (new). Directional identity and the shadows of a profile.** For h ∈ C¹[0, ∞) with h, h′ of polynomial
  growth, q ∈ H₂,₁(ℂⁿ), e ∈ ℂⁿ: E[ȳ_e·q·h(V)] = E[∂_eq·(vh)′(V)] + E[q²·conj(∂̄_eq)·h′(V)]. So
  c[h] = 𝒟₁*A_h + 𝒟₂*B_h with A_h = P₁,₁[(vh)′(V)], B_h = P₂,₀[q²h′(V)], and ‖c[h]‖ ≤ √λ₁‖A_h‖ + √λ₂‖B_h‖,
  λ₁ = λ_max(J₁) ≤ 2u, λ₂ = λ_max(I₂) ≤ u. *Scope:* the identity is the display in the proof of (F)
  (`higher-degree` CONT5 §3.4), where it first appears, and it holds for every polynomial q; the operator form is
  the delivery's. No Gaussian floor. Equality on the Wick monomial at the peak profiles; ×1.00–1.02 on H(X) + H(Y)
  (not an identity: item 97), ×1.12–1.27 on a mixed cubic, ×2.8–4.1 on X(|Y|² − 1), ×6.9 on the corner family at
  χ = 16 (N). *Status:* **P** + **C** (h = vᵐ, m ≤ 3) + **N**. *Source:* NOTE2 §1.
- **6.3.32 (new). Influence matrices, the Stein-energy identity, the sharp influence bound.**
  (a) P₁,₁|q|² = Σ M[a, b]:y_aȳ_b: with M = I₂ + J₁ ⪰ 0, tr M = 3u, ‖P₁,₁|q|²‖² ≤ (3/4)δ.
  (b) P₁,₁c₂ has the coefficient matrix J₁ and ‖P₂,₂c₂‖ = ‖I₂‖_HS, so ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS and
  δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖²_HS + 2‖I₂‖²_HS.
  (c) λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS ≤ δ/2, with equality iff q = cX²Ȳ (χ = 10); λ₁, λ₂ ≤ u(χ/2)^{1/2}.
  (d) χ ≥ 10/n for a cubic in n variables; ‖P₂,₂|q|²‖² = ½‖P₂,₀q²‖² + ‖P₃,₁q²‖² + ‖J₁‖² + ‖I₂‖² − 4tr(J₁I₂).
  *Scope:* every cubic, every dimension. The constant of (c) is approached at χ → 2 as well (X·P(Y); R(X)Ȳ).
  ‖P₁,₁|q|²‖²/δ is 0.507, 0.559, 0.592 on three explicit Gaussian-rational cubics in two, three, four variables
  (**C**, REVIEW §8 point 6), so (a) cannot give (c). The
  antiholomorphic half of (c) is CONT5 §9.2 item 4. *Status:* **P** ((a): NOTE2 Theorem 7; (b)–(d): ADDENDUM
  Theorem 13, Corollaries 13.1–13.3, and independently REVIEW F1 for (b), (c)) + **C** on instances. *Supersedes*
  the constant 3/4 of the first delivery for λ₁² + λ₂².
- **6.3.33 (new). The influence corner.** q = a:X²X̄: + bX²Ȳ, s = |a|², t = |b|², p = s/(s + t): u = 2(s + t),
  (λ₁, λ₂) = (2u, u), ‖P₂,₀q²‖² = 32s², ‖P₃,₁q²‖² = 96s² + 96st, χ = 8p² + 24p + 10 ∈ [10, 42]. Hence any set that
  contains (λ₁, λ₂) of every cubic of given (u, χ) contains (2u, u) when 10 ≤ χ ≤ 42. *Scope:* constraints in (u, χ)
  only; for χ < 10 the attained region is not determined. *Status:* **P** (ADDENDUM Proposition 14, Consequence
  14.1; independently REVIEW §5 (v)) + **C** (12 members, exact, by the reviewer's code).
- **6.3.34 (new). Law-level content bound.** ‖c[h]‖ ≤ √λ₁·sd[(vh)′(V)] + √λ₂·‖V·h′(V)‖₂ with λ₁ ≤ 2u, λ₂ ≤ u,
  λ₁² + λ₂² ≤ δ/2: ‖c[h]‖² ≤ 𝒯(u, δ; law of V), in closed form, concave in the law, with the linear majorants (L)
  (REVIEW §5, Corollary R). *Scope:* with the first two caps alone it is (F) of CONT5 §3.4, and it equals (F) for
  χ ≥ 10 (6.3.33); below, it is smaller by ×2.2, 1.5, 1.25, 1.1 at χ = 2, 4, 6, 8 (Gaussian shadows, N). It keeps a
  Gaussian floor. For the tilt 3/5 (N; two-variable cubics, u = 0.02 and 0.0463): with H = min{γδ, (19321/10⁶)u,
  1/2500} of 11.30, 11.49 and the Bessel functional 𝔅 = min_m E[V(h(V) − m)²] it does not lower the worst case of
  (bound)/D (0.070 and 0.051 with or without it); it is the smallest bound for χ above about 16 at u = 0.02 (up to
  2 times) and near χ = 40 at u = 0.0463 (at most 10 %). Over all laws with mean u its supremum is W₀(u)u²,
  W₀ = 0.79, 0.75, 0.71, 0.65 at u = 0.009, 0.02, 0.03, 0.0463. *Status:* (F) **P** (a worker of claude-b9ee, CONT5
  §3.4; re-derived by the package's author and by the review worker); the cap set **P**; Corollary R **P**, author only (the review worker); the comparisons **N**. Note it under 11.44,
  where the minimum of the content bounds is taken.
- **6.3.35 (new). Stein-pair representations of the two shadows** (NOTE2 Propositions 10, 11). **P** + **C**
  (polynomial profiles). The bound of Proposition 10 is below the Bessel value only for χ < 0.9–1.4 at the peak (N).
- **6.3.12 (annotate).** The leading tensor is 2⟨conj(∂_eq), P₁,₁|q|²⟩ + ⟨∂̄_eq, P₂,₀q²⟩ (equality in the resulting
  bound on the Wick monomial); ‖Π₁(q|q|²)‖² ≤ min{(15/2)uδ, (3√10/4)δ^{3/2}} (NOTE2 Theorem 8 with 6.3.32 (c);
  3√15/4 as delivered), weaker than the constant held as R. **P**.
- **6.3.21 (annotate).** The first identity is equation (4.13) of Chen–Chen–Liu, arXiv:2304.08088, in bidegree
  (2, 1), term by term (REVIEW §7); its third form is 6.3.32 (b).
- **3.4 (optional).** E|q|⁶ ≥ (3/2)(E|q|⁴)²/E|q|², i.e. κ₆ᶜ ≥ (3/2)χ(χ − 2)u³: Proposition 3.1 of
  Azmoodeh–Malicet–Mijoule–Poly (arXiv:1305.6579) applied to Re q. **P** + **C** on instances; whether the Lean cut
  family implies it is not checked. And χ ≥ 10/n (6.3.32 (d)) as a remark.
- **§9 (N rows).** Corollary 6.1 with exact shadows against the truth (`identity.log`); (F) and 𝒯 against γδ, H and
  𝔅 on the families, the 400 + 400 random cubics and the search records (REVIEW F4, `review/own_scan.log`); the
  corner family (ADDENDUM §4 with the two columns of REVIEW §8); the suprema of the ratios to δ for n ≤ 4.
- **§13, item 96 (false).** "The holomorphic Gram matrix of a remote cubic has no χ-control" (CONT5 §9.2 item 4).
  False: λ_max(J₁) ≤ u(χ/2)^{1/2} (6.3.32 (c)); the example given for it, X·P(Y) with χ = 2 and λ₁ = u, is the
  equality case in the limit. **P**. The conclusion of that item stands (item 98).
- **§13, item 97 (false).** "Corollary 6.1 (6.3.31) is an equality on equal independent Wick blocks" (both versions
  of the delivery: README §1 item 1, NOTE2 §1 remark (ii)). False from h = v³ on: for q = :X²X̄: + :Y²Ȳ: and h = v³
  the shadow A_h has the coefficient 36864 along :XȲ:, outside the range of 𝒟₁, and (bound)²/‖c‖² = 1 + 1.009·10⁻⁴;
  at the peak profiles ×1.01–1.02 (N). It is an equality for h = v and h = v². **C** (exact, the review worker).
- **§14, item 98 (route that does not work).** *Sharper influence bounds in (F), including Gram dominance.* For
  10 ≤ χ ≤ 42 the corner (2u, u) is attained (6.3.33), so no constraint on the influences in terms of (u, χ) lowers
  (F); for χ < 10 the gain is the cap set of 6.3.32 (c), at most ×2.2 at χ = 2. The binding cells of the degree-5
  band are at χ = 16 and 30 (`higher-degree` 4.25). What is not excluded: constraints that couple the influences to
  the law of |q|.
- **§15, item 2 (refine).** The missing step is a bound for ⟨𝒟₁e, A_h⟩ + ⟨𝒟₂e, B_h⟩ that keeps the cancellation on
  the corner family a:X²X̄: + bX²Ȳ, which reaches the contentless X²Ȳ at χ = 10. At χ = 16, u = 0.0463 the bounds to
  beat are 0.042·D (𝔅) and 0.052·D (1/2500), against a truth of 0.0056·D; (F) has 0.090·D.

`research/higher-degree/STATUS.md`:

- **4.25 (new). Influence caps in (F): what they give and what they cannot.** (F) of CONT5 §3.4 holds with the cap
  set λ₁ ≤ 2u, λ₂ ≤ u, λ₁² + λ₂² ≤ δ/2 (K ledger 6.3.32, 6.3.34; concave in the law). Both Gram matrices have the
  control λ_max ≤ u(χ/2)^{1/2}: this **corrects CONT5 §9.2 item 4**, which has it for G₂ and says that G₁ has none.
  For 10 ≤ χ ≤ 42 the corner (2u, u) is attained (6.3.33), so (F) is unchanged there. The six failing rows of
  CONT5 §8.4 have their largest excess at χ = 16 (t = 0.82 to 0.855) or 30 (t = 0.80): **no row closes through the
  influences.** *Status:* **P** as in the K ledger; the reading of §8.4 is from its table (**N** of that note); no
  degree-5 number is computed.
- **4.26 (new, optional). A further law functional for the content.** Since Π₁q = 0, ‖c[h]‖² ≤ min_m E[V(h(V) − m)²]
  (Bessel; linear in the law for fixed m). CONT5 §2 replaced the range-centred branch of 11.30, which bounds this
  functional uniformly over laws, by (F). At degree 3 (tilt 3/5; N) the functional is 9 times below (F) at
  the Gaussian law, below (F) on 42 % and 97 % of 400 random two-variable cubics at u = 0.02 and 0.0463, and above
  it only on the junta side. *Status:* the bound **P** (it is the first step of the proof of the range-centred bound
  of 11.30); **N** at degree 3 only; not evaluated at degree 5.

**Superseded statements of version 1.** Theorem 7(b) in the form λ₁² + λ₂² ≤ (3/4)δ (by 6.3.32 (c);
‖P₁,₁|q|²‖² ≤ (3/4)δ stays). Theorem 9: the constraint (3/4)δ, the threshold χ = 20/3 and the constant of (b) (now
δ/2, χ = 10, (δ/2)^{1/2}); its claim to be a new bound in the capped form (it is (F)). Theorem 8: the constant
3√15/4 (now 3√10/4). README "(B), degree 5" and NOTE2 §7 items 1–2 (withdrawn by version 2). The rows 6.3.26–6.3.29
and the 4.19 annotation proposed in the first README (replaced by the rows above). Not superseded, and not yet
corrected by the author: F3–F7.

Overstated in the delivery, to keep out of the ledger: the comparison with γδ alone, and with it "0.239 → 0.116",
"6.7–8.1 times", "a ×16 gap" and the claim for χ = 12–16 (F4); "exact on equal independent Wick blocks" (F3); the
crossover values as statements about cubics, "100 %" and "0.189, 0.239" without their sample (F5); "uses this
repository's witness" (F6).

## 10. Not checked

- The peak-row constants and profiles against the Lean development: I compared with the ledger's constants only
  (j₀, g₀, B₀, S, u*).
- The coefficients γ of 11.49 were taken from the ledger; 11.49 itself, 11.50, 11.55, 6.3.12 (R), 6.3.25 and the
  column "6.3.25 at e*" of NOTE2 §6 were not re-examined.
- The raw scan (`scan_raw.log`) was replayed only; I re-evaluated the tilt scan (all 800 cubics), the families at
  both profiles and the search records. Cubics in three or more variables were not sampled by anyone (numerics);
  the exact checks include three and four variables.
- The bounds of 11.30 used in F4 were taken from the ledger (their status there is P + C); I did not re-derive
  them. They, and 𝔅, hold on all 800 cubics of the scan.
- `CONTENT_LEMMA_D5.md` was read in §§0, 1, 3.3–3.5, 4.3 (head), 8.4 (head) and 9.2 item 4 only; its numbers were
  not replayed (its code is outside the repository).
- The search is a lower bound on suprema over two-variable cubics; I did not run a search of my own.
- The worst-case-over-laws table of §5 is floating-point linear programming on a grid of v ∈ [0, 25] with 1500
  points; it uses only E V = u and E V² ≤ (2 + χ)u² (and, in one column, the radius bound). It is not a certificate.
- Degree 5: no profile, no number.
- NOTE2 §1 remarks (i) and (iv) (the floor of 6.3.25, formula (8) of 11.29, (21) of KMA) and the references to
  ledger §14 items 21–22 and item 91.
- `LITERATURE.md` beyond the four papers of §7.
- Version 2: the searches of ADDENDUM §2 were replayed, not repeated with a search of my own (three of their maxima
  were re-evaluated exactly: §8, table). The references of the addendum to `CONTENT_LEMMA_D5.md` §5, §9.4 and §11.6,
  and the "link to the T4 frame" beyond Theorem 13 itself, were not examined. The degree-5 table of §8.4 was read,
  not recomputed (its code is outside the repository).

## 11. Files of this review

```
REVIEW.md                      this file
review/delivered_sha256.txt    SHA-256 of the zip and of every delivered file
review/delivered_v2_sha256.txt SHA-256 of the second zip and of every file of package-v2
review/replay_stage1.sh, replay_stage2.sh   drivers of the replay (unmodified package scripts, private copy)
review/replay_v2.sh            driver of the replay of the new parts of version 2
review/replay-logs/            the replayed logs and t9_search.json, with the stage logs; v2/ for version 2
review/own_v2.py, .log         independent checks of ADDENDUM.md: facts (N), (W), Theorem 13 and its corollaries,
                               Proposition 14, three exact cubics for E2 (exact); half.log and the corner family
                               (floating point). Run: python3 -I -B review/own_v2.py review <delivered half.log>
                               review/replay-logs/v2/argmax_M_n2_s2.npy …n3… …n4…
review/exact_wickbasis.py, .log   independent exact checker (Wick basis), with the Chen–Chen–Liu check
review/own_numerics.py, .log      independent profiles, law functionals, two-variable quadrature, closed-form cap
review/own_lawlevel.py, .log      worst case of the law-level bound over the laws of a (u, χ) cell (linear programmes)
review/own_scan.py, .log          the 400 + 400 random cubics of the tilt scan re-evaluated, with all proved bounds (F4)
review/small_checks.py, .log      Corollary 6.1 on H(X) + H(Y) for h = v, v², v³ (exact); the constant 2.734; the
                                  monomial against H; two-point laws; the plain Bessel bound on one-dimensional laws
review/tab_reviewer.npz           the reviewer's profile table (written by own_numerics.py)
review/run_review.sh, .log        runs the five scripts one after the other (about 8 minutes)
```
