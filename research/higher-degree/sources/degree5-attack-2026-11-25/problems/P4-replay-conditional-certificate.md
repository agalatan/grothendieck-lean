# P4. An independent replay of the conditional degree-5 certificate

**Summary.** A computer-assisted statement "if a sector inequality K₅ holds on each of 29 rows, then
Re⟨f, Tg⟩ ≤ 500/701 for all unimodular pairs" has one author and has only been replayed with the author's own code.
You are asked to check it independently: re-derive its paper steps, recompute its 29 row constants with your own
programs, and report every discrepancy.

Source record (not needed to do the work): ledger rows 4.17, 4.18 and §5 item 1 of
`research/higher-degree/STATUS.md`; reports `research/higher-degree/sources/degree5-progress-2026-11-16/CERT_STAGE1.md`,
`research/higher-degree/sources/degree5-capped-2026-11-16/CERT_STAGE2.md`, `CERT_STAGE2B.md`, `SMALL_T.md` (repository
`agalatan/grothendieck-lean`, master). The certificate data (41 MB) are outside the repository, in
the author's working folder `handoff/research-degree5/claude-research-2026-11-15/degree5-cert/cert2b/` (outside the repository; see `research/higher-degree/INVENTORY.md`); a
replay at level A or B below does not need them. The exact row constants are in
`research/higher-degree/code/degree5-attack/rows2b.json` (9,461 bytes, SHA-256
`71f81a9cdb9c51672f0e36dc2c53e6b3aedf66c25374706eee0b57cd7112bbd9`) and are reproduced in §3.

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point; "author only"
when nobody but the author has checked it.

---

## 1. Setting and notation

**Gaussian space.** z = (z₁, …, z_n) are independent standard complex Gaussians: each z_j has density π⁻¹e^{−|z|²} on
ℂ, so E|z_j|² = 1 and E z_j² = 0. n is arbitrary. ⟨f, g⟩ = E[conj(f)·g].

**Chaos.** H_{a,b} is the closed span in L² of the Wick (complex Hermite) polynomials of holomorphic degree a and
antiholomorphic degree b; P_{a,b} is the orthogonal projection onto it. For one variable the normalised Wick
polynomials are, with T = |z|²:

    e₁₀ = z,   e₁₁ = T − 1,   e₂₀ = z²/√2,   e₂₁ = z(T − 2)/√2,   e₃₂ = z(T² − 6T + 6)/√12.

**The game.** T = P₁,₀ − ε₁·P₂,₁ + η·P₃,₂ with ε₁ = 39/50 and η = 779/10000. For measurable f, g with |f| = |g| = 1,
V = Re⟨f, Tg⟩. Put h = (f + g)/2, k = (f − g)/2, t = ‖P₁,₀h‖₂; then 0 ≤ t ≤ √π/2 < 886227/10⁶. After a unitary
change of coordinates P₁,₀h = t·z₁; z = z₁ is the *visible* coordinate and w = (z₂, …, z_n) the *remote* ones.

**Row data.** A row is r = (ℓ, β, b_A, b_B), four rationals. With them:

    L(z) = z(ℓ + β(|z|² − 2)),      D(z) = 1 − b_A·e₁₁(z) − b_B·e₂₀(z),      κ_r = 1/ε₁ − (b_A² + b_B²)/η,
    Ψ₅(s; ν) = E_z|L + ν·e₃₂ + s·D| + E_z|L + ν·e₃₂ − s·D|            (s ≥ 0, ν real; z a standard complex Gaussian).

**The remote cubic.** G₃ = ε₁·P₂,₁k ∈ H₂,₁(ℂⁿ) and G₅ = η·P₃,₂h ∈ H₃,₂(ℂⁿ). q = E[G₃ | w] is the part of G₃ that does
not depend on z₁; q ∈ H₂,₁ of the remote coordinates ("remote cubic"). σ = ‖q‖₂, U = |q|²/σ².

**The law class 𝓛** (what is assumed about the law of U for a remote cubic; all are theorems of the project or of
its record, taken here as inputs):

- (L1) E U = 1;  (L2) m = E U² ∈ [2, 44];  (L3) E U³ ≤ 9m − 12 + C₆(m − 2)^{3/2}, C₆ = 4045313/100000;
- (L4) E√U ≤ ρ = 95133/100000;
- (L5) *scalar Stein family*, used on the five rows 0.125–0.3 only: for every even, continuous, piecewise-linear
  w: ℝ → ℝ that is constant beyond its last knot and every μ > 0, with W(x) = ∫₀ˣ w and
  h_{w,μ}(x) = x·W(x) − w(x)/2 − w(x)²/(2μ): E h_{w,μ}(Re q̃) ≤ μ(m − 2)/24 for q̃ = q/σ. Since q̃ is circularly
  symmetric this is E Ψ_{w,μ}(√U) ≤ μ(m − 2)/24 with Ψ_{w,μ}(r) = (1/2π)∫₀^{2π} h_{w,μ}(r cos θ) dθ.

**The sector hypothesis K₅(η₅) of a row.** For all n, all G₃ ∈ H₂,₁(ℂⁿ) and G₅ ∈ H₃,₂(ℂⁿ), with q the remote part of
G₃ and C = b_A·q·e₁₁(z₁) + b_B·q̄·e₂₀(z₁):

    Λ₅(G₃, G₅) := E|L + G₅ + G₃ − C| + E|L + G₅ − G₃ + C| − ‖G₃‖²/ε₁ − ‖G₅‖²/η
               ≤ sup_{ν ∈ ℝ} [E Ψ₅(|q|; ν) − ν²/η] − ‖q‖²/ε₁ + η₅.

You are **not** asked to prove K₅. You are asked to check what follows from it.

---

## 2. The statement to check

**Claim 1 (row inequality; P, author only).** For every unimodular pair and every row r,

    V ≤ t² − 2ℓt + 2β²/ε₁ + (b_A² + b_B²)‖q‖²/η + Λ₅(G₃, G₅).

Its five steps, as recorded: (i) −ε₁‖P₂,₁h‖² ≤ 2Re⟨β√2·e₂₁(z₁), h⟩ + 2β²/ε₁ (completing a square with
B = β√2·e₂₁ ∈ H₂,₁, ‖B‖² = 2β²; note L = ℓz₁ + B); (ii) −‖P₁,₀k‖² ≤ 0; (iii) ε₁‖P₂,₁k‖² = 2Re⟨G₃, k⟩ − ‖G₃‖²/ε₁ and η‖P₃,₂h‖² = 2Re⟨G₅, h⟩ − ‖G₅‖²/η;
(iv) −η‖P₃,₂k‖² ≤ −2Re⟨C, k⟩ + ‖C‖²/η for every C ∈ H₃,₂ (C may depend on the pair), with ‖C‖² = (b_A² + b_B²)‖q‖²;
(v) Re⟨X, f⟩ ≤ E|X| for |f| = 1, applied to f and g after writing h and k in terms of f and g; and
t² = t² − 2ℓt + 2ℓ·Re⟨z₁, h⟩ since ⟨z₁, h⟩ = t. The two norms then arise from
2Re⟨L + G₅, h⟩ + 2Re⟨G₃ − C, k⟩ = Re⟨L + G₅ + G₃ − C, f⟩ + Re⟨L + G₅ − G₃ + C, g⟩. Starting point: V = t² − ε₁‖P₂,₁h‖² + η‖P₃,₂h‖² − ‖P₁,₀k‖² + ε₁‖P₂,₁k‖² − η‖P₃,₂k‖²
(T is self-adjoint and real).

**Claim 2 (law layer; C, author only).** For each of the 29 rows of §3,

    G⁺_r := sup { E Ψ₅(σ√U; ν) − κ_r·σ² − ν²/η  :  σ ≥ 0, ν ∈ ℝ, law of U ∈ 𝓛 }   ≤   C_r − 2β_r²/ε₁,

with 𝓛 = (L1)–(L4) for the rows 0.4–0.886 and (L1)–(L5) for the rows 0.125–0.3. Consequently, under K₅(η₅(r)) on
the row r, V ≤ t² − 2ℓ_r·t + C_r + η₅(r) for every pair.

**Claim 3 (small t; P + C, author only).** For every pair, V ≤ (2/5)t² + 7058083/10⁷, with no sector hypothesis.

**Claim 4 (envelope; exact arithmetic).** With t₁ = 7967/125000 = 0.063736:

    max over t ∈ [0, t₁] of (2/5)t² + 7058083/10⁷, and max over t ∈ [t₁, 886227/10⁶] of min_r [t² − 2ℓ_r·t + C_r],

are both at most B₅ = 0.7128940126…, attained at t = 0.847596 where the rows 0.845 and 0.85 cross. Hence, under
K₅(η₅(r)) with η₅(r) ≤ room(r) on every row, V ≤ 500/701 for every pair, and K_G^ℂ ≥ 701/500.

**What counts as the certificate being confirmed.** Claims 1 and 3 re-derived; every C_r of §3 confirmed as an upper
bound of G⁺_r + 2β_r²/ε₁ by a computation that shares no code with the author's; Claim 4 reproduced digit for
digit.

**Room.** 500/701 − B₅ = 3.72749·10⁻⁴; per row in §3. A replay that finds some C_r too small by less than the row's
room does not break the conclusion "K₅ with a smaller allowance ⇒ 1.402", but it is a discrepancy and must be
reported with the row, the value and how it was found.

---

## 3. The data

29 rows. Columns: label; ℓ; β; b_A; b_B (exact rationals); C_r (the exact rational is in `research/higher-degree/code/degree5-attack/rows2b.json`, key
`C_stein` where present and `C_plain` otherwise; ten decimals here); the piece of t on which the row is the smallest
one; the room 500/701 − (maximum of the row on its piece). Rows 0.125–0.3 use the Stein family (L5).

| row | ℓ | β | b_A | b_B | C_r | active on | room |
|---|---|---|---|---|---|---|---|
| 0.125 | 25849/200000 | 5137/1000000 | −217/250000 | −553/1000000 | 0.7198461172 | [0.0637, 0.1148] | 5.83·10⁻³ |
| 0.15 | 167091/1000000 | 4917/1000000 | −1451/1000000 | −461/500000 | 0.7285392979 | [0.1148, 0.1464] | 9.92·10⁻³ |
| 0.2 | 224319/1000000 | 763/200000 | −2/625 | −1051/500000 | 0.7452906265 | [0.1464, 0.2335] | 1.22·10⁻² |
| 0.25 | 289017/1000000 | 1939/1000000 | −5409/1000000 | −229/62500 | 0.7754995951 | [0.2335, 0.2920] | 1.82·10⁻² |
| 0.3 | 43607/125000 | −107/1000000 | −8197/1000000 | −2819/500000 | 0.8104403381 | [0.2920, 0.4098] | 2.08·10⁻² |
| 0.4 | 213513/500000 | −509/1000000 | −15541/1000000 | −10859/1000000 | 0.8745008819 | [0.4098, 0.4585] | 2.01·10⁻² |
| 0.5 | 499507/1000000 | 527/50000 | −5859/250000 | −3971/250000 | 0.9409623028 | [0.4585, 0.5272] | 2.01·10⁻² |
| 0.55 | 520573/1000000 | 1321/62500 | −14191/500000 | −9343/500000 | 0.9631741123 | [0.5272, 0.5686] | 1.88·10⁻² |
| 0.6 | 280067/500000 | 7059/200000 | −8129/250000 | −5123/250000 | 1.0081647603 | [0.5686, 0.6470] | 1.13·10⁻² |
| 0.70 | 15613/25000 | 19763/250000 | −4399/125000 | −4033/200000 | 1.0914821679 | [0.6470, 0.6715] | 9.60·10⁻³ |
| 0.72 | 650773/1000000 | 3479/40000 | −37259/1000000 | −21163/1000000 | 1.1267388059 | [0.6715, 0.6989] | 7.72·10⁻³ |
| 0.74 | 339059/500000 | 23849/250000 | −39377/1000000 | −22177/1000000 | 1.1649592272 | [0.6989, 0.7256] | 5.90·10⁻³ |
| 0.76 | 8833/12500 | 104313/1000000 | −41549/1000000 | −4639/200000 | 1.2063498374 | [0.7256, 0.7520] | 4.20·10⁻³ |
| 0.78 | 736351/1000000 | 5687/50000 | −43781/1000000 | −24231/1000000 | 1.2510358768 | [0.7520, 0.7721] | 3.17·10⁻³ |
| 0.79 | 150341/200000 | 118641/1000000 | −44931/1000000 | −24757/1000000 | 1.2747449871 | [0.7721, 0.7851] | 2.47·10⁻³ |
| 0.80 | 767389/1000000 | 773/6250 | −9217/200000 | −25293/1000000 | 1.2993703835 | [0.7851, 0.7988] | 1.79·10⁻³ |
| 0.81 | 391689/500000 | 128843/1000000 | −47249/1000000 | −2583/100000 | 1.3249154874 | [0.7988, 0.8119] | 1.22·10⁻³ |
| 0.82 | 199939/250000 | 26827/200000 | −48447/1000000 | −1319/50000 | 1.3515094893 | [0.8119, 0.8248] | 7.38·10⁻⁴ |
| 0.83 | 408269/500000 | 69789/500000 | −24837/500000 | −6731/250000 | 1.3791944507 | [0.8248, 0.8348] | 4.74·10⁻⁴ |
| 0.84 | 416837/500000 | 145151/1000000 | −5091/100000 | −3437/125000 | 1.4078042318 | [0.8348, 0.8423] | 4.00·10⁻⁴ |
| 0.845 | 842397/1000000 | 147989/1000000 | −25777/500000 | −27777/1000000 | 1.4224996910 | [0.8423, 0.8476] | 3.73·10⁻⁴ |
| 0.85 | 851203/1000000 | 150857/1000000 | −1631/31250 | −28061/1000000 | 1.4374275477 | [0.8476, 0.8523] | 3.73·10⁻⁴ |
| 0.855 | 860143/1000000 | 153779/1000000 | −52831/1000000 | −14181/500000 | 1.4526671860 | [0.8523, 0.8574] | 3.84·10⁻⁴ |
| 0.86 | 869173/1000000 | 31343/200000 | −13373/250000 | −14321/500000 | 1.4681517089 | [0.8574, 0.8630] | 4.38·10⁻⁴ |
| 0.865 | 878331/1000000 | 79853/500000 | −54163/1000000 | −7239/250000 | 1.4839589869 | [0.8630, 0.8667] | 5.39·10⁻⁴ |
| 0.87 | 887591/1000000 | 162733/1000000 | −27411/500000 | −117/4000 | 1.5000094483 | [0.8667, 0.8724] | 6.37·10⁻⁴ |
| 0.875 | 448487/500000 | 33159/200000 | −27757/500000 | −29567/1000000 | 1.5163805139 | [0.8724, 0.8786] | 8.44·10⁻⁴ |
| 0.88 | 453239/500000 | 84447/500000 | −56209/1000000 | −5973/200000 | 1.5330803916 | [0.8786, 0.8841] | 1.11·10⁻³ |
| 0.886 | 458587/500000 | 172683/1000000 | −28847/500000 | −31607/1000000 | 1.5519938248 | [0.8841, 0.8862] | 1.39·10⁻³ |

The intervals and rooms of this table were recomputed for this file from the exact C_r (they agree with the
author's `assemble2b.log` to the digits shown). The decimals of C_r are truncations: use the file for exact work.

---

## 4. What is known

- **The author's replay (C, author only).** One checker recomputes all 295,626 interval node caps of Ψ₅, re-verifies
  29 plain and 5 Stein covers box by box, reproduces every C_r and the envelope. It re-runs the author's interval
  evaluator, so it guards against corrupted data, not against an error in that evaluator. The evaluator's own
  checks: a closed form at s = 0 and 25-digit quadrature at four nodes.
- **How the author bounds G⁺_r** (so that you can do it differently, or the same way with your own code):
  1. Node caps: interval enclosures of Ψ₅(s_i; ν_j) on a grid (s-step 0.002 on [0, 1.2], 0.005 to 2, 0.02 to 3, 0.1
     to 6; ν-step 0.004 on [−0.004, 0.036], coarse to ±0.08). Reductions: Ψ₅ = 2E|L + νe₃₂ + sD| (z → −z), and the
     integrand is the square root of a real polynomial in (Re z, Im z).
  2. Ψ₅ is jointly convex in (s, ν), even in s, with |∂_sΨ₅| ≤ 2√(1 + b_A² + b_B²) and |∂_νΨ₅| ≤ 2.
  3. On a box [σ_a, σ_b] × [x_a, x_b] × [ν_j, ν_{j+1}] (x = √(m − 2)): polynomial majorants
     p(s) = a₀ + a₁s + a₂s² + a₄s⁴ + a₆s⁶ ≥ Ψ₅(s; ν_j) on [0, ∞) with a₁, a₆ ≥ 0, checked against the chords of the
     caps; then E p(σ√U) ≤ J(σ, x) = a₀ + a₁ρσ + a₂σ² + a₄(2 + x²)σ⁴ + a₆(6 + 9x² + C₆x³)σ⁶ by (L1)–(L4); convexity
     in ν; the maximum over x at an endpoint; exact Bernstein bounds in (σ, λ).
  4. Outside the boxes: σ ≥ 2√(1 + b_A² + b_B²)·ρ/κ_r is dominated by σ = 0, and |ν| ≥ η by the boundary values.
  5. On the Stein rows a box may add a Stein term: p(s) + Ψ_{h}(s) − Ψ₅(s; ν) ≥ 0 for all s with a suitable (w, M),
     verified by interval cells on [0, 30] and an exact tail.
- **Numbers to compare with (N, from the record and re-checked for this file).** The value of a row at its own t
  with the Gaussian law of U (U ~ Exp(1)), i.e. t² − 2ℓt + 2β²/ε₁ + sup_{σ,ν}[E Ψ₅(σ√U; ν) − κσ² − ν²/η]:
  0.6999095 (0.70), 0.7112165 (0.80), 0.7128645 (0.85), 0.7117033 (0.886). A check written for this file from the
  definitions above, with the rational rows of §3, gives 0.6999095, 0.7112159, 0.7128653, 0.7117053 (maximisers
  σ = 0.4231, 0.2965, 0.1949, 0.036 and ν = 0.00370, 0.00836, 0.01183, 0.0148). The certified values
  t² − 2ℓt + C_r at the same t are 0.7071542, 0.7115480, 0.7128824, 0.7117575: the difference is the *law gap*,
  7.2·10⁻³, 3.3·10⁻⁴, 1.7·10⁻⁵, 5·10⁻⁵ on these four rows.
- **A known earlier error, already corrected:** an earlier stage used ρ = 9513293/10⁷, which the radius theorem
  does not cover (its largest certified row bound is 0.95132934139…); 95133/100000 is the proved constant.
- **One numerical assumption:** the Stein covers and Claim 3 assume that the C library's arcsin is accurate to
  4 ulp. An independent replay should avoid this assumption (use Arb or exact bounds).
- **Claim 3 is superseded for the final theorem** by a simpler bound that is P + C and independently reviewed:
  V ≤ (1 − η)t² + ε₁ρ₀² + η²/(πε₁) for any universal ρ₀ with E|q| ≤ ρ₀‖q‖₂ on H₂,₁; with ρ₀ = 2287/2500 it gives
  V < 500/701 for t ≤ 0.2508. Checking Claim 3 is still part of replaying *this* certificate.

---

## 5. Why a careless replay proves nothing

- Re-running the author's programs on the author's data reproduces the author's numbers and is not a replay.
- A floating-point evaluation of G⁺_r can only show a *violation* (a law in 𝓛, a σ and a ν with value above
  C_r − 2β²/ε₁); it cannot confirm the bound. The supremum over laws is a semi-infinite linear program; a
  discretised LP gives a lower bound of the supremum, a dual certificate an upper bound.
- For t ≤ 0.3 the worst laws are far from Gaussian (a nearly constant modulus with a small atom far out), and the
  Gaussian value is about 0.09 below the bound. Do not use the Gaussian value as a proxy there.

---

## 6. Suggested approach

- **Level A (hours).** Re-derive Claim 1 line by line, including the identity for V and the claim ‖C‖² =
  (b_A² + b_B²)‖q‖² (C = b_A q e₁₁(z₁) + b_B q̄ e₂₀(z₁) with q independent of z₁). Re-derive the step from K₅ to
  "V ≤ t² − 2ℓt + 2β²/ε₁ + sup[…] + η₅" (the term (b_A² + b_B²)‖q‖²/η joins −‖q‖²/ε₁ into −κσ²). Check the properties
  of Ψ₅ in item 2 of §4 and the two "outside" arguments of item 4. Reproduce Claim 4 in exact rational arithmetic.
- **Level B (a day; about an hour of CPU).** With your own quadrature for Ψ₅ (for example Gauss–Legendre in |z| on
  panels times the trapezoidal rule in arg z, 10⁵ nodes, accurate to 10⁻⁷ away from the zeros of the integrand;
  or mpmath), solve for each row the discretised LP over laws of U on a grid of σ and ν, and report
  G⁺_r(float) + 2β²/ε₁ against C_r. Expected: below C_r on every row, by 10⁻⁶ to 5·10⁻⁵ on the rows 0.82–0.886 (the
  author's float LP and certified values differ by that much) and by up to a few 10⁻³ on the Stein rows (the author
  left unused slack there). Any row with a float value *above* C_r is a discrepancy.
- **Level C (independent certificate; about 30 CPU-hours in the author's implementation).** Your own interval
  enclosure of Ψ₅ (Arb is the natural tool: the integrand is |polynomial|, analytic away from its zero set; at s = 0
  that set contains a circle whenever ℓ + β(T − 2) + ν(T² − 6T + 6)/√12 has a positive root, which happens for
  ν < 0 and on the rows with small ℓ), your own dual certificates for the law
  problem, exact assembly. Negative controls: a row constant lowered by its law gap must be rejected; ρ replaced by
  √π/2 must be rejected on the rows t ≤ 0.6; a cap lowered by 10⁻⁶ must be rejected.
- If you have the data folder: verify the author's covers with your own verifier (the majorant test, J, the
  Bernstein bounds) and your own node caps. That separates "the data certify the claim" from "the author's code
  says so".

---

## 7. Deliverable

- A note stating, for each of Claims 1–4, "confirmed", "confirmed with the correction …" or "not confirmed", with
  the derivation of Claim 1 written out so that each of its five steps can be checked.
- A table of the 29 rows with your value (and its kind: float lower bound of the supremum, or certified upper
  bound) next to C_r − 2β²/ε₁.
- Every number produced by a script delivered with the note; certified numbers in exact rational or interval
  arithmetic (python-flint/Arb, or C++ with outward rounding and an exact verifier); the negative controls and
  their outcomes.
- Labels: "P, author only" for paper steps you derived, "C, author only" for your certified computations; say
  plainly which level (A, B, C) was completed.

---

## 8. How to test a claimed result

- Envelope: any exact-rational script must print B₅ = 0.7128940126 at t = 0.847596 and the rooms of §3.
- Ψ₅: at s = 0, Ψ₅(0; ν) = 2E|z|·|ℓ + β(T − 2) + ν(T² − 6T + 6)/√12| with T ~ Exp(1), a one-dimensional integral
  (2E|L + νe₃₂| with |z| = √T). For the row 0.85 at ν = 0 this is 2·E[√T·|ℓ + β(T − 2)|].
- Gaussian values: the four numbers of §4.
- An explicit pair: f = ph(z₁ + c·W), g = ph(z₁ − c·W), W an independent standard complex Gaussian placed in
  bidegree (2, 1) (the limit of normalised sums of independent Wick cubics N^{−1/2}Σ e₂₁(y_j)). Then
  t = |E[z̄₁f]| and V = |⟨z₁, f⟩|² − ε₁(|⟨e₂₁(z₁), f⟩|² − |⟨W, f⟩|²) + η(|⟨e₃₂(z₁), f⟩|² − |⟨e₁₁(z₁)W, f⟩|² − |⟨e₂₀(z₁)W̄, f⟩|²).
  Values (N, computed for this file): c = 0.29: t = 0.8512, V = 0.712293; c = 0.6: t = 0.7599, V = 0.706551;
  c = 1.3: t = 0.5403, V = 0.670938; c = 3.2: t = 0.2643, V = 0.627764. Each must lie below t² − 2ℓ_r·t + C_r for
  every row r (it does: for example at t = 0.8512 the row 0.85 gives 0.712882).
