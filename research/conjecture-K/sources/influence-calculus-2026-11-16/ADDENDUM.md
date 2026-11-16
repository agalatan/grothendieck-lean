<!-- Verbatim from the delivery conjecture-K-influence-calculus-v2.zip (ADDENDUM.md), 16 November 2026; a Claude session of the user, relayed by the user. Only this line was added. -->
# Addendum: an erratum, the Stein-energy identity, and what influence bounds can give the band

Claude (this session), 16 November 2026, third turn. Repository read at `b3cca504` (master, 16:30), which adds the
identity-tail records and the sharper Edgeworth remainder (3.19) but no degree-5 profile code. Labels as in the
ledger: **P** complete written proof (author only), **C** exact rational computation with a replay script, **N**
floating point only. Notation of `NOTE2.md` §0: q ∈ H₂,₁(ℂⁿ), u = E|q|², δ = E|q|⁴ − 2u², χ = δ/u², R_j = ∂̄_jq,
c₂ = Σ_j|R_j|², J₁[a, b] = E[∂_aq·conj(∂_bq)], I₂[a, b] = E[conj(∂̄_aq)·∂̄_bq], λ₁ = λ_max(J₁), λ₂ = λ_max(I₂).

## 0. Summary

1. **Erratum (§1).** In its capped form Theorem 9 of `NOTE2.md` is bound (F) of `CONTENT_LEMMA_D5.md` §3.4, with the
   same proof. The degree-5 law layer already uses (F), combined with (S). I had not read that section. What
   Theorem 9 added was only the constraint λ₁² + λ₂² ≤ (3/4)δ, and that constraint is active only for χ < 20/3.
2. **The Stein-energy identity (Theorem 13, P + C).** The fluctuation of the antiholomorphic Stein energy is
   exactly the size of the two influence matrices:

       ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS,   with P₁,₁c₂ = Σ_{a,b} J₁[a, b]·:y_aȳ_b:  and  ‖P₂,₂c₂‖ = ‖I₂‖_HS.

3. **Sharp influence bound (Corollary 13.1, P + C).** With 6.3.21,

       δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖²_HS + 2‖I₂‖²_HS,   hence   λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS ≤ δ/2.

   Equality holds iff q = c·X²Ȳ in orthonormal coordinates (χ = 10). This replaces the constant 3/4 of Theorem 7(b).
   It contains the record's λ₂ ≤ u√(χ/2) (`CONTENT_LEMMA_D5.md` §9.2, item 4) and gives the holomorphic
   λ₁ ≤ u√(χ/2), which that item says does not exist. A by-product: χ ≥ 10/n for every cubic in n variables.
4. **The influence corner is attained (Proposition 14, P + C).** For q = X²(aX̄ + bȲ): λ₁ = 2u, λ₂ = u and
   χ = 8p² + 24p + 10 with p = |a|²/(|a|² + |b|²), which covers [10, 42]. Hence **for χ ≥ 10 no constraint on
   (λ₁, λ₂) in terms of (u, χ) can improve (F)**, and Theorem 9 equals (F) there.
5. **For the degree-5 band.** Every failing row of `CONTENT_LEMMA_D5.md` §8.4 has its largest excess at χ = 16 or
   30. So no failing row closes through sharper influence bounds; Corollary 13.1 only lowers cells with χ < 10. On
   the corner family itself (degree 3, tilt 3/5, u = 0.0463, χ = 16) the true content is 0.0056·D.
   - Corollary 6.1 with exact shadows gives 0.039·D: ×6.9, the misalignment of the A-shadow with the influence
     operator.
   - (F) gives 0.090·D: a further ×2.3. Of this, ×1.4 is the Bessel step on the A-shadow and ×1.7 is the B-shadow,
     whose exact value is about 0 but whose Bessel value is not.
   - 11.49 gives 0.145·D.

   At χ = 10 the family reaches X²Ȳ, whose content is zero (11.31), while every factor of Corollary 6.1 is of order
   one. The missing step is therefore a phase cancellation inside ⟨𝒟₁e, A_h⟩, not a bound on influences.

## 1. Erratum to `NOTE2.md` and the first README

- **E1. Theorem 9 is (F) plus one constraint.** `CONTENT_LEMMA_D5.md` §3.4 proves
  ‖Π₁Φ(q)‖ ≤ √(2u·Var a(V)) + √(u·E[V²h′(V)²]) with a = h + Vh′. The proof is one Gaussian integration by parts,
  Cauchy–Schwarz and λ_max(G₁) ≤ tr G₁ = 2u, λ_max(G₂) ≤ tr G₂ = u. This is Theorem 9 with only the caps.
  Consequences:
  - the comparisons of `NOTE2.md` §6 at χ ≥ 20/3 (the Wick monomial, the 400 random two-variable cubics, the
    search) compare (F) with 11.49. They are a degree-3 rerun of `CONTENT_LEMMA_D5.md` §4.3, not a new bound;
  - README §1, "What it does for the two routes", item (B) is wrong: the degree-5 law layer already takes min(F, S)
    (§§3.5, 4.3, 8.4 there);
  - what was new in Theorem 9 is the constraint λ₁² + λ₂² ≤ (3/4)δ, now δ/2, active only for χ < 10 (§4).
- **E2. Theorem 7(b).** The constant 3/4 is superseded by 1/2 (Corollary 13.1), which is sharp. The route through
  ‖P₁,₁|q|²‖² cannot give 1/2: that ratio reaches 0.507, 0.559 and 0.592 in two, three and four variables (N,
  `results/sup_fast_b.log`). It is bounded by 3/4 (Theorem 7), and the gap is the cross term 2 tr(J₁I₂).
- **Unaffected:** Theorem 6 and Corollary 6.1 (the exact shadow representation, which (F) is not), Theorem 7(a),
  Theorem 8, Propositions 10–12, and the literature record.

## 2. The Stein-energy identity

**Theorem 13.** For every q ∈ H₂,₁(ℂⁿ):

(a) P₁,₁c₂ = Σ_{a,b} J₁[a, b]·:y_aȳ_b:, so ‖P₁,₁c₂‖² = ‖J₁‖²_HS;

(b) P₂,₂c₂ = Σ_j :R_jR̄_j:, and ‖P₂,₂c₂‖² = Σ_{j,k} |⟨R_j, R_k⟩|² = ‖I₂‖²_HS;

(c) c₂ − u = P₁,₁c₂ + P₂,₂c₂, hence **‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS**.

*Proof.* Two standard facts on Wick monomials are used. Distinct Wick monomials :y^αȳ^β: are orthogonal with
squared norm α!β!. And ∂̄_j:y^αȳ^β: = β_j:y^αȳ^{β−e_j}: (similarly ∂_j). Two consequences:
- (N) For F, G ∈ H_{p,r}, Σ_j⟨∂̄_jF, ∂̄_jG⟩ = r⟨F, G⟩. On basis elements the left side is
  Σ_j β_j²·α!(β − e_j)!·δ = |β|·α!β!·δ, and distinct basis elements stay orthogonal under each ∂̄_j.
- (W) For R, R′ ∈ H₂,₀ the H₂,₂ part of R·conj(R′) is the Wick product :R·conj(R′): (no contraction).
  ⟨:R conj(S):, :R′ conj(S′):⟩ = ⟨R, R′⟩·conj⟨S, S′⟩, because the squared norm α!β! of a Wick monomial factorises
  over its holomorphic and antiholomorphic parts.

(c) Each R_j ∈ H₂,₀, so R_jR̄_j ∈ H₂,₂ ⊕ H₁,₁ ⊕ H₀,₀. Also E c₂ = Σ_j‖∂̄_jq‖² = ⟨q, N₂q⟩ = u, by (N) with r = 1.

(a) As in the proof of Theorem 7(a), ⟨:y_aȳ_b:, F⟩ = E[∂̄_b∂_aF]. For F = R̄_jR_j: ∂_aR̄_j = conj(∂̄_aR_j) = 0
because R_j is holomorphic. So ∂_aF = R̄_j·∂_aR_j and ∂̄_b∂_aF = conj(∂_bR_j)·∂_aR_j, since ∂_aR_j is holomorphic
too. Hence ⟨:y_aȳ_b:, c₂⟩ = Σ_j⟨∂_bR_j, ∂_aR_j⟩ = Σ_j⟨∂̄_j∂_bq, ∂̄_j∂_aq⟩, because ∂_bR_j = ∂_b∂̄_jq = ∂̄_j∂_bq.
Since ∂_aq, ∂_bq ∈ H₁,₁, (N) with r = 1 gives ⟨∂_bq, ∂_aq⟩ = E[∂_aq·conj(∂_bq)] = J₁[a, b]. The :y_aȳ_b: form an
orthonormal basis of H₁,₁.

(b) By (W), P₂,₂c₂ = Σ_j:R_jR̄_j: and ⟨:R_jR̄_j:, :R_kR̄_k:⟩ = ⟨R_j, R_k⟩·conj⟨R_j, R_k⟩ = |I₂[j, k]|². ∎
**[P; C: checks K1–K3 in `scripts/check_stein_energy_exact.py`, 17 instances]**

**Corollary 13.1 (sharp influence bound).** For every q ∈ H₂,₁(ℂⁿ):

    δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖²_HS + 2‖I₂‖²_HS,
    λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS = (δ − ‖P₂,₀q²‖² − ‖P₃,₁q²‖²)/2 ≤ δ/2.

In particular λ₁ ≤ u√(χ/2) and λ₂ ≤ u√(χ/2). Equality λ₁² + λ₂² = δ/2 holds iff q = c·X²Ȳ for orthonormal X, Y; then
χ = 10 and (λ₁, λ₂) = (2u, u).

*Proof.* The identity is 6.3.21, δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖c₂ − u‖², with Theorem 13(c). The largest eigenvalue
of a positive semidefinite matrix is at most its Hilbert–Schmidt norm.

Equality needs P₂,₀q² = P₃,₁q² = 0 and rank J₁, rank I₂ ≤ 1. With tr J₁ = 2u, rank J₁ = 1 means ∂_aq = 0 for every a
orthogonal to one unit vector X. So q is holomorphic in X only: q = X²·ℓ̄ with ℓ̄ antiholomorphic linear, that is
q = a·:X²X̄: + b·X²Ȳ with Y ⊥ X. For this family ‖P₂,₀q²‖² = 32|a|⁴ (Proposition 14), so a = 0. Conversely X²Ȳ has
P₂,₀q² = P₃,₁q² = 0, χ = 10 and λ = (2u, u). ∎ **[P; C: K4 on 17 instances; equality checked exactly on X²Ȳ]**

The bound λ₂ ≤ u√(χ/2) is the one of `CONTENT_LEMMA_D5.md` §9.2, item 4. That item says "the holomorphic analogue
has no χ-control". It has the same one, λ₁ ≤ u√(χ/2). The example given there (X·P(Y), P charge-zero and
Gaussian-like: χ = 2 and λ₁ = u) is its equality case in the limit. The conclusion of that item stands: the bound is
attained on a zero-content family, so it cannot let (F) see the phase.

**Corollary 13.2.** A cubic in n complex variables has χ ≥ 10/n, because ‖J₁‖²_HS ≥ (2u)²/n and ‖I₂‖²_HS ≥ u²/n.
**[P]** (Not sharp at n = 1, where χ = 42.)

**Corollary 13.3.** ‖P₂,₂|q|²‖² = ½‖P₂,₀q²‖² + ‖P₃,₁q²‖² + ‖J₁‖²_HS + ‖I₂‖²_HS − 4 tr(J₁I₂). This is the second
identity of 6.3.21 with ‖P₁,₁|q|²‖² = ‖J₁ + I₂‖²_HS (Theorem 7(a)) and Corollary 13.1. **[P; C: K5]**

**Link to the T4 frame.** The budget vector of KAS Theorem 4 is (‖P₂,₀Q‖, ‖P₃,₁Q‖, ‖P₁,₁x‖, ‖P₂,₂x‖), with
x = c₂ − u. By Theorem 13 it is (‖P₂,₀Q‖, ‖P₃,₁Q‖, ‖J₁‖_HS, ‖I₂‖_HS). In particular ⟨P₁,₁G′_e, P₁,₁x⟩ is the pairing
of P₁,₁G′_e with the influence matrix J₁. A majorant of Ω_{e*} (`CONTENT_LEMMA_D5.md` §11.6) can therefore keep this
pairing instead of the norm ‖P₁,₁G′_e‖·‖J₁‖_HS.

**Numerics (N).** Maximising each ratio over H₂,₁(ℂⁿ) (L-BFGS, 5–8 random starts; `results/sup_*.log`):

| ratio to δ | n = 2 | n = 3 | n = 4 |
|---|---|---|---|
| λ₁² + λ₂² | 0.500000 (χ = 10) | 0.500000 | 0.499999 |
| ‖J₁‖²_HS + ‖I₂‖²_HS | — | 0.500000 | 0.499998 (also at χ = 5.74, where P₂,₀q², P₃,₁q² ≈ 0) |
| ‖P₁,₁\|q\|²‖² | 0.507 | 0.559 | 0.592 |
| λ₁² | 0.400 | 0.404 | 0.410 |
| λ₂² | 0.107 | 0.168 | 0.214 (= 3/14: R(X)Ȳ with R ∝ X₁² + X₂² + X₃²) |

These are consistent with Corollary 13.1. In the last row, R(X)Ȳ with R ∝ X₁² + … + X_N² has λ₂ = u and
χ = 2 + 8/N, so λ₂²/δ = N/(2N + 8) → 1/2 (N = 1 is X²Ȳ, N = 3 the value 3/14 found).

## 3. The influence corner is attained

**Proposition 14.** Let X ⊥ Y be unit coordinates and q = a·:X²X̄: + b·X²Ȳ, with (a, b) ≠ 0, s = |a|², t = |b|²,
p = s/(s + t). Then:
- u = 2(s + t);
- J₁ = diag(2u, 0), so λ₁ = 2u;
- I₂ has rank one, so λ₂ = u;
- ‖P₂,₀q²‖² = 32s² and ‖P₃,₁q²‖² = 96s² + 96st;
- χ = 8p² + 24p + 10, which increases from 10 (p = 0, X²Ȳ) to 42 (p = 1, the Wick monomial).

So for every χ ∈ [10, 42] and every u > 0 some cubic in two variables has fourth excess χ and (λ₁, λ₂) = (2u, u).

*Proof.* ∂_Yq = 0, so J₁ vanishes off (X, X) and its trace is 2u. ∂̄_Xq = aX² and ∂̄_Yq = bX² are parallel, so I₂
has rank one and trace u.

Unitary changes of coordinates and global phases preserve ‖P₂,₀q²‖², ‖P₃,₁q²‖², u and δ. X → e^{iθ}X and
Y → e^{iψ}Y send (a, b) to (e^{iθ}a, e^{i(2θ − ψ)}b), so these norms depend on (s, t) only. Each is a homogeneous
polynomial of degree two in (a, b) and two in their conjugates, hence a quadratic form in (s, t). Its three
coefficients are fixed by the exact values at (s, t) = (1, 0), (0, 1), (1, 1):
- ‖P₂,₀q²‖²: 32, 0, 32;
- ‖P₃,₁q²‖²: 96, 0, 192.

Four further exact evaluations agree. Corollary 13.1 then gives δ = 32s² + 96s² + 96st + 2(4u² + u²), so
χ = 10 + (128s² + 96st)/(4(s + t)²) = 8p² + 24p + 10. ∎ **[P + C: `check_stein_energy_exact.py`, seven members]**

**Consequence 14.1 (what influence bounds can give).** Let 𝓡(u, χ) be any set that contains (λ₁, λ₂) for every
cubic with energy u and excess χ. If 10 ≤ χ ≤ 42, then (2u, u) ∈ 𝓡(u, χ). So for all s_A, s_B ≥ 0,

    max over 𝓡(u, χ) of (√λ₁·s_A + √λ₂·s_B) = √(2u)·s_A + √u·s_B,

and no bound of the form "√λ₁·(law functional) + √λ₂·(law functional)" improves (F) when χ ≥ 10. For χ < 10,
Corollary 13.1 gives 𝓡 ⊂ {λ₁ ≤ 2u, λ₂ ≤ u, λ₁² + λ₂² ≤ χu²/2}. Whether all of that region is attained is not settled
here. **[P]**

This is an obstruction for constraints on the influences that depend on (u, χ) only. Constraints that couple the
influences to the law of |q| (the dominance split of `CONTENT_LEMMA_D5.md` §9.4) are not excluded. The corner cubics
have specific laws, and the law layer's extremal laws ("bulk plus a far atom", §5 there) are not among them.

## 4. Numbers (N, peak row)

**Theorem 9 with constant 1/2 against (F)** (Gaussian-law shadows; T/δ; `results/half.log`; tilt 3/5):

| u | χ = 2: (F) / 3/4 / 1/2 | χ = 4 | χ = 6 | χ = 8 | χ ≥ 10 | crossover with γδ of 11.49 (3/4 → 1/2) |
|---|---|---|---|---|---|---|
| 0.009 | 0.0790 / 0.0448 / 0.0365 | 0.0395 / 0.0316 / 0.0258 | 0.0263 / 0.0252 / 0.0210 | 0.0198 / 0.0198 / 0.0180 | all equal | χ = 1.59 → 1.06 |
| 0.02 | 0.1273 / 0.0721 / 0.0589 | 0.0636 / 0.0509 / 0.0416 | 0.0424 / 0.0406 / 0.0339 | 0.0318 / 0.0318 / 0.0289 | all equal | 5.19 → 3.56 |
| 0.03 | 0.1481 / 0.0840 / 0.0685 | 0.0741 / 0.0592 / 0.0485 | 0.0494 / 0.0472 / 0.0395 | 0.0370 / 0.0370 / 0.0337 | all equal | 7.90 → 6.60 |
| 0.0463 | 0.1596 / 0.0905 / 0.0739 | 0.0798 / 0.0638 / 0.0523 | 0.0532 / 0.0509 / 0.0426 | 0.0399 / 0.0399 / 0.0363 | all equal | 9.82 → 9.70 |

The gain over (F) is ×2.16, 1.53, 1.25 and 1.10 at χ = 2, 4, 6 and 8, and none from χ = 10 on.

**The corner family** (`results/corner.log`, grid 44×40; truth C² = ‖c[h]‖²; tilt 3/5, u = 0.0463):

| χ | C²/D | Cor. 6.1 (exact shadows)/D | (F)/D | γδ/D (11.49) | Bessel loss sA²/‖A_h‖², sB²/‖B_h‖² |
|---|---|---|---|---|---|
| 10 (X²Ȳ) | 0 (11.31) | 0.0541 | 0.1220 | 0.1055 | 1.31, ∞ (B_h = 0) |
| 12 | 0.0022 | 0.0481 | 0.1098 | 0.1198 | 1.33, 1.9·10³ |
| 16 | 0.0056 | 0.0386 | 0.0896 | 0.1448 | 1.39, 183 |
| 20 | 0.0078 | 0.0312 | 0.0738 | 0.1659 | 1.46, 57 |
| 30 | 0.0108 | 0.0190 | 0.0465 | 0.2072 | 1.76, 9.6 |
| 42 (monomial) | 0.0114 | 0.0114 | 0.0302 | 0.2426 | 2.87, 2.2 |

At u = 0.02 the pattern is the same (χ = 16: 0.0061, 0.0298, 0.0692, 0.1267). With the raw profile at u = 0.0463
and χ = 16: 0.0393, 0.2153 and 0.4748.

Reading:
- On this family the A-shadow loses little to Bessel (×1.3–1.5 for χ ≤ 20).
- Its pairing with the influence operator loses ×4–22 for χ ∈ [12, 20] (Corollary 6.1 against the truth); this is
  the alignment.
- The B-shadow is almost zero, but its Bessel value s_B is not. Together with the A-side Bessel step this costs (F) a
  further ×2.3 against Corollary 6.1 at χ = 16 (×1.4 from A, ×1.7 from B).

## 5. What this means for the degree-5 band

- `CONTENT_LEMMA_D5.md` §8.4 lists the largest excess of each failing row at:
  - (u/σ*², χ) = (1.00, 30) at t = 0.80;
  - (1.00, 16) at t = 0.82, 0.84, 0.85 and 0.855;
  - (0.90, 16) at t = 0.845.
- All of these are at χ ≥ 10. By Consequence 14.1 none can be lowered by a sharper constraint on (λ₁, λ₂) in terms
  of (u, χ). This holds at degree 5 verbatim, because (F) there uses the same q ∈ H₂,₁ and the same caps.
- Corollary 13.1 lowers (F) only on cells with χ < 10, where it is not the row's maximum. **It closes no row.**
- The corner family is a concrete degree-3 test for any proposed fix. At χ = 16 it carries a ×16 gap between (F)
  and the truth, and it reaches the zero-content cubic X²Ȳ at χ = 10. A bound that closes the band at χ = 16 must
  see the cancellation that makes X²Ȳ contentless. This is the "phase" of the task statement, here in a two-parameter
  family.

## 6. Ledger rows this would add or change

`research/conjecture-K/STATUS.md`:
- **6.3.21 (annotate)** the third form δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖J₁‖²_HS + 2‖I₂‖²_HS, and
  ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS (Theorem 13). P + C.
- **6.3.27 (as proposed in the package, corrected)** λ₁² + λ₂² ≤ δ/2, sharp, equality iff q = cX²Ȳ (Corollary 13.1),
  in place of (3/4)δ. P + C.
- **6.3.28 (as proposed, corrected)** Theorem 9 is (F) of `CONTENT_LEMMA_D5.md` §3.4 with the constraint
  λ₁² + λ₂² ≤ δ/2. It equals (F) for χ ≥ 10 (P), and the N comparison with 11.49 is a rerun of §4.3 there.
- **New (P + C)** Proposition 14 and Consequence 14.1: the influence corner (2u, u) is attained at every χ ∈ [10, 42].
- **§14 (new item)** "Sharper influence bounds in (F)" do not help for χ ≥ 10 (Consequence 14.1). This includes
  the Gram-dominance refinement of `CONTENT_LEMMA_D5.md` §9.2, item 4, now in its sharp form.
- **§15, item 2 (refine)** the missing step is a bound on ⟨𝒟₁e, A_h⟩ + ⟨𝒟₂e, B_h⟩ that keeps the cancellation on
  X²(aX̄ + bȲ). Test family: the corner family at χ ∈ [10, 20].
- **Corollary 13.2** (χ ≥ 10/n in n variables) as a remark under 3.4.

`research/higher-degree/STATUS.md` / `CONTENT_LEMMA_D5.md`:
- **§9.2, item 4 (correct)** the holomorphic Gram bound holds, λ₁ ≤ u√(χ/2), with equality approached on X·P(Y);
  both Gram bounds follow from Corollary 13.1.
- **§10, item 1 (annotate)** by Consequence 14.1 the band's binding cells (χ = 16, 30) cannot be reached through the
  influences. The factor must come from the shadows, that is, from the alignment, or from a law-coupled constraint.

## 7. Files and replay

```
scripts/check_stein_energy_exact.py   C: Theorem 13, Corollaries 13.1 and 13.3, Proposition 14 (17 exact instances, 1 s)
scripts/wickfloat.py, fourth.py       N: float Wick calculus; E|q|^4 by the 44 classes of Wick pairings
scripts/check_fourth.py               N: the pairing formula against the polynomial calculus
scripts/sup_influence.py              N: first search (n = 2, 3; about 9 minutes)
scripts/sup_fast.py KEY n R seed      N: searches with the pairing formula (n = 3, 4: about 15 minutes for all keys)
numerics/half.py                      N: Theorem 9 with 1/2 against (F) and 3/4 (Gaussian-law shadows)
numerics/corner.py                    N: the corner family at the peak row (1 minute)
results/                              the logs quoted above
```

Run `python3 -I numerics/tab.py` once before the numerics. Everything runs under `python3 -I`; the exact check needs
the standard library only.
