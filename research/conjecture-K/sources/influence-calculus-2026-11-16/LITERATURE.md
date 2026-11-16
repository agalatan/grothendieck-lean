<!-- Verbatim from the delivery conjecture-K-influence-calculus-v2.zip (LITERATURE.md), 16 November 2026; a Claude session of the user, relayed by the user. Only this line was added. -->
# Reading record and what it gives the programme

Claude (this session), 16 November 2026. Repository at `ddbf7f58` (master, 15:07). What was read, how far, and what
each item contributes to Conjecture K. Nothing here is a load-bearing input of `NOTE2.md` except where §3 says so.

**How it was read.** The book from the supplied PDF (text extraction). Web pages through a fetch tool that returns a
digest of the first 100,000 characters of a page. For arXiv HTML and ar5iv renderings this often covers the
introduction and the main statements only; the column "read" says how far each one went. No PDF was used for arXiv
papers. The record's own notes were read first, so as not to repeat them: KLI `REPORT.md` and `BOOK_NOTES.md`, KPH
`LITERATURE.md`, KMA `BOOK_NOTES.md`.

## 1. Malliavin–Stein

| source | read | what it says | use here |
|---|---|---|---|
| Nourdin–Peccati, *Normal Approximations with Malliavin Calculus* (2012), supplied PDF | contents; §5.1 in full; statements of §§8.4, 9.2, 10.1; the rest skimmed | E[Ff(F)] = E[f′(F)⟨DF, −DL⁻¹F⟩]; d_TV ≤ 2E\|1 − ⟨DF, −DL⁻¹F⟩\|; the smart path E h(N) − E h(F) (5.1.7); κ_m = (m − 1)!·EΓ_m; one-term Edgeworth (9.2.2); the density formula ρ(x) = E\|F\|/(2g_F(x))·exp(−∫₀ˣ y/g_F) | the same integration by parts, in its one-sided complex form, is 6.3.20; Theorem 6 is its first-order, one-direction form. The record already has two sets of book notes (KLI, KMA) |
| Azmoodeh–Malicet–Mijoule–Poly, *Generalization of the Nualart–Peccati criterion*, [arXiv:1305.6579](https://arxiv.org/html/1305.6579v4) | HTML, statements of §§2–5 | for an eigenfunction X of a diffusion generator with chaos-like spectrum: E X^{2k} ≥ E N^{2k}; a moment matrix ((k − ij/(i + j − 1))·E X^{i+j}) that is positive semidefinite; E[W_k(X)] ≥ 0 for explicit polynomials W_k; (E X⁴)² ≤ (3/5)E X⁶·E X² | **Proposition 12** of `NOTE2.md` is its case k = 3, re-derived with a full proof and translated to H₂,₁: a lower cut on E\|q\|⁶. The higher matrices give further moment cuts for a law layer. The positivity is for growing test functions; it does not sign E[(Γ − 1)e^{−aF²}] (ledger 3.22), whose expansion in the same family alternates (§2.2) |
| Nourdin–Peccati, *The optimal fourth moment theorem*, [arXiv:1305.1527](https://ar5iv.labs.arxiv.org/html/1305.1527) | introduction, Theorems 1.1–1.2 | d_TV(F_n, N) ≍ max(\|E F_n³\|, E F_n⁴ − 3) along a convergent sequence in a fixed chaos; constants depend on the sequence | two-sided and asymptotic: no constant for χ of order 10 |
| Biermé–Bonami–Nourdin–Peccati, [arXiv:1109.1546](https://ar5iv.labs.arxiv.org/html/1109.1546) | introduction | same rate for smooth distances; Var(‖DF‖²/q) ≤ ((q − 1)/(3q))κ₄ ≤ (q − 1)·Var(‖DF‖²/q) | the two-sided comparison of Var Γ and κ₄; its exact complex form for cubics is 6.3.21–6.3.22 |
| Ebina–Nourdin–Peccati, *Optimal local CLTs on Wiener chaos*, [arXiv:2511.21496](https://arxiv.org/html/2511.21496) | statements | ‖ρ_{F_n}^{(j)} − ρ_N^{(j)}‖_∞ ≍ max(\|κ₃\|, κ₄); constants not explicit | the density at 0 is what the radius problem 3.6 needs (E\|F\| = 2g_F(0)ρ_F(0)); again asymptotic only |
| Nourdin–Peccati–Swan, *Entropy and the fourth moment phenomenon*, [arXiv:1304.1255](https://ar5iv.labs.arxiv.org/html/1304.1255) | introduction, Theorem 1.1 | relative entropy O(Δ_n\|log Δ_n\|), through Stein matrices, de Bruijn's identity and Carbery–Wright | near-Gaussian; no explicit constant |
| Chen–Poly, [arXiv:1404.4784](https://ar5iv.labs.arxiv.org/html/1404.4784); Azmoodeh–Peccati–Yang, [survey (2021)](https://vmsta.org/journal/VMSTA/article/214/text) | introduction; §§3–6 | Γ-calculus proof: Var Γ[X] ≤ (q²/3)(E X⁴ − 3); HSI: H ≤ ½S² log(1 + I/S²) | background. The spectral argument is the one used in Proposition 12 |
| Nourdin–Peccati [0712.2940](https://ar5iv.labs.arxiv.org/html/0712.2940), [0906.4419](https://ar5iv.labs.arxiv.org/html/0906.4419); Nourdin [1107.3252](https://ar5iv.labs.arxiv.org/html/1107.3252); Nourdin–Peccati–Réveillac [0804.1889](https://ar5iv.labs.arxiv.org/html/0804.1889) | introductions only (the renderings are cut before the theorems) | the bounds of the book's chapters 5 and 6 | covered by the book |
| [Malliavin–Stein page](https://sites.google.com/site/malliavinstein) | entries of 2014–2026 | bibliography | source of the 2023–2026 complex-chaos papers below |

Not opened: Döbler–Peccati (Poisson space), Ledoux (2012), Azmoodeh–Campese–Poly (2014); their content reached this
reading through the survey and through AMMP.

## 2. Complex Wiener chaos, and what is new in 6.3.20–6.3.25

| source | read | what it says |
|---|---|---|
| Chen–Chen–Liu, *An improved complex fourth moment theorem*, [arXiv:2304.08088](https://arxiv.org/html/2304.08088) | statements of §§3–4 | for F = I_{p,q}(f): convergence to a complex Gaussian iff ‖f ⊗_{i,j} h‖ → 0 for 0 < i + j < p + q (h the reversed conjugate kernel), iff E\|F\|⁴ − 2(E\|F\|²)² − \|E F²\|² → 0. Equation (4.13): that quantity is an **exact** combination, with nonnegative coefficients, of ‖f ⊗_{i,j} h‖² and of the squared norms of the contraction sums that make up F². Lemma 4.2: 2‖f ⊗_{i,j} f‖² ≤ ‖f ⊗_{p−i,q−j} h‖² + ‖f ⊗_{p−j,q−i} h‖². No Malliavin operators are used |
| Chen–Chen–Liu, *Optimal Gaussian approximation for complex Wiener–Itô integrals*, [arXiv:2610.04532](https://arxiv.org/html/2610.04532) | Theorem 1.1, Lemma 3.8 | density and distance rates ≍ max(\|E F³\|, \|E F²F̄\|, Δ₄) along convergent sequences; equivalence with contraction norms up to constants |
| Campese, *Fourth moment theorems for complex Gaussian approximation*, [arXiv:1511.00547](https://ar5iv.labs.arxiv.org/html/1511.00547) | introduction and §2 only (complex Stein lemma and Stein equation); the main sections were read by KPH | a Γ-calculus with Wirtinger derivatives; a bound by the second and fourth absolute moments |
| Chen–Liu [1408.1817](https://arxiv.org/abs/1408.1817), [1902.09111](https://arxiv.org/abs/1902.09111) | titles only | the first complex fourth moment theorem; complex chaos decomposition |

### 2.1 Priority

- **6.3.21, first identity** (δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖c₂ − u‖²). An exact expansion of the complex fourth
  cumulant in squared contraction norms exists for every bidegree: Chen–Chen–Liu (2023), (4.13). In their terms
  P₂,₀q², P₃,₁q² are the contraction sums of F², and c₂ − u is built from contractions of f with h. So 6.3.21 should
  be described as the bidegree-(2, 1) case in operator form, with a one-sided grouping, and not as a new kind of
  identity. I did not match coefficients term by term (the summary does not give all of them).
- **6.3.22** is the Lean theorem `fluctuation_identity` (already recorded by the review).
- **6.3.20, 6.3.23, 6.3.24** (the one-sided identity E[Gq] = Σ_jE[∂_jG·∂̄_jq] and the representations of content and
  deficit): nothing of this form was found in what was read. Chen–Chen–Liu work with kernels only; Campese's
  Γ-calculus treats the two covariance channels Γ(F, F̄), Γ(F, F) symmetrically (KPH's reading). This is "not found",
  on a partial reading; it is not a proof of novelty. The identity itself is two lines of standard calculus.
- **Theorem 6 of `NOTE2.md`** is Gaussian integration by parts in one direction; the real form is step (8) of 11.29.

### 2.2 Why the spectral positivity does not sign the smoothing transform

AMMP's cone is generated by W_k(x) = (2k − 1)(x∫₀ˣH_kH_{k−2} − H_kH_{k−2}), and E[W_k(F)] = (2k − 1)·E[(Γ − 1)H_k(F)H_{k−2}(F)]
for a normalised chaos element (Γ normalised to mean 1). By Mehler's formula

    Σ_{k≥2} t^k/(k − 2)!·H_k(x)H_{k−2}(x) = (1 − t²)^{−1/2}·e^{x²t/(1+t)}·[x²t²/(1 + t)² − t²/(1 − t²)].

Decaying Gaussian weights e^{−ax²} arise only for t = −a/(1 + a) < 0, where the coefficients t^k alternate. So the
positivity of the cone gives no sign for C_F(a) (ledger 3.22, 3.21(d)); what it signs is the growing family t > 0.
(The formula is an elementary computation of mine from Mehler's kernel, checked numerically only; it is not in the
paper and has not been checked by anyone else.)

## 3. Grothendieck constants (arXiv search, November 2026)

| source | read | claim |
|---|---|---|
| Heilman–Jones–Malavolta, *Sharper bounds for the complex Grothendieck constant*, [arXiv:2609.25462](https://arxiv.org/html/2609.25462) | HTML digest | 1.4 < K_G^ℂ < 1.404898554746. Lower bound: the witness T = P₁,₀ − εP₂,₁ with ε = 37/50, sup_n‖T_n‖_{∞→1} < 2857/4000; the same h, k, t reduction as this repository's row, a radius ρ = 49/50 for the cubic projection of a bounded function, and nine certified pairs (ℓ_i, C_i). Upper bound: a mixture of six Haagerup-type rounding kernels with a repaired nonlinear tail. It recalls Haagerup's conjectured value 1.404575934663742… |
| Guo–Fang–Lu, [arXiv:2609.07000](https://arxiv.org/html/2609.07000v1) | HTML digest | K_G^ℂ > 1.35584631827168 with a charge-one multiplier with an identity part and ten higher projections; the criterion's own ceiling is below 1.355847; going further "would require" joint information on the two functions |
| Heilman–Jones–Malavolta, *primal/dual*, [arXiv:2610.10477](https://arxiv.org/html/2610.10477v1) | HTML digest | real constant: 1.773 ≤ K_G ≤ 1.7799; Hermite projection games; Example 3.1 asserts asymptotic optimality of sign(n^{−1/2}ΣHe_d(X_i)) for Π_d without proof (ledger 3.6) |
| Jones–Malavolta [2603.30039](https://arxiv.org/abs/2603.30039); Saha et al. [2608.11158](https://arxiv.org/abs/2608.11158); Li et al. [2606.03991](https://arxiv.org/abs/2606.03991) | abstracts | real constant: a cubic perturbation of the Davie–Reeds operator; 6π/11 ≤ K_G ≤ π/(2 log(1 + √2)) − 10⁻⁴; an explicit 10⁻⁵ below Krivine's bound |
| Friedland–Lim–Zhang [1711.10595](https://arxiv.org/abs/1711.10595); Pisier [1101.4195](https://arxiv.org/abs/1101.4195) | abstracts | unified proof giving Krivine's and Haagerup's bounds; the survey |

Remarks for the record.
- The published lower bound (HJM, 1.4) uses the repository's witness family and its (h, k, t) row. The repository's
  1.401700322371 and the K programme sit on top of the same construction with a sharper treatment of sup Λ. HJM's
  radius 49/50 is weaker than ledger 3.7 (0.95133).
- The repository's upper bound 1.404599395362 is 2.35·10⁻⁵ above the value Haagerup conjectured for K_G^ℂ, as quoted
  by HJM.
- Guo–Fang–Lu name the same obstacle as ledger item 14: a criterion that sees each function separately has a
  ceiling.

## 4. What the reading changes

1. The standard Malliavin–Stein theorems (fourth moment, optimal rates, local limit, entropy) are absolute,
   two-sided and asymptotic. None gives a signed content/deficit inequality at χ of order 10. This agrees with the
   record (KLI §4, KPH, KMA).
2. Two things do transfer. The spectral method gives exact moment cuts for cubics (Proposition 12, and its higher
   analogues). And the influence language of the universality chapter (book §11.2) is the right one for the content:
   Theorem 6 writes the content through influence functions, Theorem 7 bounds the largest influence by √δ, and
   Theorem 9 turns this into a law-level bound.
3. The description of 6.3.21 in the ledger should cite Chen–Chen–Liu (2023).
