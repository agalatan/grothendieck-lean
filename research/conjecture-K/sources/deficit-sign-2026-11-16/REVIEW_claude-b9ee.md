<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/deficit-sign-2026-11-16/REVIEW_claude-b9ee.md (16 November 2026); Agent-ID: claude-b9ee. Only this line was added. -->
# Review of the deficit-sign report (claude-b9ee, 16 November 2026)

Subject: `REPORT.md` in this folder, written by a research worker of this session. The worker and I share a session,
so a reader who wants a review from outside it should read every **P** below as "P, author only". What I did is
listed exactly.

## 1. Re-derived by hand, line by line

All from the two forms of the antiholomorphic Stein identity (ledger 6.3.20), which I re-derived first:
p′·E[Gq] = Σ_j E[∂_jG·∂̄_jq] and p·E[Gq] = Σ_j E[∂̄_jG·∂_jq], from E[∂_jH] = E[ȳ_jH] and E[∂̄_jH] = E[y_jH].

| item of the report | result |
|---|---|
| Prop. 2.1 (rotation identity) | correct. With G = q̄γ(V) the two forms give E[Vγ] = E[c₂(vγ)′] + E[q̄²aγ′] and 2E[Vγ] = E[c₁(vγ)′] + E[q̄²aγ′]; their difference is the claim. On the Wick monomial J = (3r − 2)(r − 2) = dV/dr, and the identity is integration by parts in r |
| Cor. 2.2 | correct (layer-cake formula) |
| Cor. 2.3 and (2.3) | correct. K − uK′ = φ gives D = K(0) − E K(V) + u·E K′(V) = −E[(J − u)K′(V)] |
| Cor. 2.4 | correct. G = g(Re q) gives E[gq] = ½E[g′(a + c₂)] = ¼E[g′(a + c₁)]; the gauge average of e^{−(2α/u)(Re q)²} is e^{−t}I₀(t), t = αV/u; ∫₀ᵗe^{−s}I₀(s)ds = t·e^{−t}(I₀ + I₁)(t) gives the second form |
| Cor. 2.5 | correct, including the arcsine representation e^{−t}I₀(t) = π⁻¹∫₀²e^{−ts}(s(2 − s))^{−1/2}ds |
| Theorem 4.1 | correct, given 6.3.20–6.3.21 (a = P₂,₀q² + ½P₃,₁q², ¼‖P₃,₁q²‖² = Σ‖W_k‖²). The step (4) ⇒ (2) is complete: F(F(y)) = 0, Φ_t = id + tF is a polynomial automorphism, det(I + t·DF) ≡ 1, so div F ≡ 0. The conditional law follows from E[g(V)h(c₂)] = E[c₂g′(V)h(c₂)] for g(0) = 0 |
| (5.1)–(5.4), Lemma 5.1, Theorem H | correct. u = 2A + 2B + C; V̄ − ur = A·r(r² − 4r + 2) + B·r(r − 2); (5.3) from E[rᵏe^{−μr}] = k!/(1 + μ)^{k+1}; ∫₀^∞μ^{1/2}(2 − μ)(1 + μ)⁻⁴dμ = π/16. At σ = 0: a₀ = √π/(8√u), b₀ = √π/(4√u) for φ = 2√v. The Cauchy–Schwarz form E\|q\| ≤ (√π/2)√(u − A/4 − B/2) is correct: E[√r(r − 2)²] = (7/8)√π, E r^{3/2} = (3/4)√π |
| Remark 1 (trace-free cubics of ℂ²) | correct: f ↦ T(f, f, f̄) is a smooth section of a line bundle of degree one over ℂP¹ |
| §5.5 (real analogue) | correct: the weight of ψ_σ′ is constant on [0, 1/(2σ²)]; E[e^{−μX²}X²(X⁴ − 6X² + 3)] = 12μ(μ − 2)(1 + 2μ)^{−7/2}; ∫₀^∞ = 2^{−5/2}·(2/3) |
| Prop. 6.1 and the split 𝒥 + two terms | correct. E Re(q̄²a) = ‖P₂,₀q²‖² + ½‖P₃,₁q²‖²; E[q̄b] = ⟨V − c₂, c₂ − u⟩ = ¼‖P₃,₁q²‖² (Lemma 1 with G = q̄c₂, then 6.3.20) |
| Prop. 6.4 (local content representation) | correct: Σ_j∂_jV·F_j = q̄a + q·c₂ and k − c·∂_vk = h |

Not re-derived by me: Prop. 6.2 (path formula), Prop. 6.3 (low-chaos identity), §5.6 (what the method cannot give),
the vanishing first variation of T₂ at decoupled cubics. These stay **P, author only**; their exact instance checks
were replayed (§2).

## 2. Replays

`x01_exact_identities.py` (2 min 42 s) and `x02_exact_lowchaos.py` (23 s), run with `python3 -I` in a scratch copy:
13 and 15 PASS lines, no failure, both logs identical to the delivered ones.

## 3. An independent numerical check

`review-claude-b9ee/t2_witness_check.py` (my own formulas; radii by composite Gauss–Legendre, the relative phase by the
midpoint rule; three grids) on q_θ = cos θ·X²Ȳ/√2 + sin θ·X(|X|² + |Y|² − 3)/√3, φ = √v, u = 1:

| θ | D | T₂ | T₂/D | report |
|---|---|---|---|---|
| 0 | 0.25956986 | 0 | 0 | 0.25956, 0 |
| 0.1 | 0.2553913 | −6.5150·10⁻⁵ | −2.551·10⁻⁴ | −2.55·10⁻⁴ |
| 0.2 | 0.2455583 | −1.32869·10⁻⁴ | −5.411·10⁻⁴ | −1.32869, −1.32866, −1.32830·10⁻⁴; −5.41·10⁻⁴ |
| 0.25 | 0.2396145 | −7.690·10⁻⁵ | −3.210·10⁻⁴ | −3.21·10⁻⁴ |
| 0.3 | 0.2334016 | +9.6970·10⁻⁵ | +4.155·10⁻⁴ | +4.2·10⁻⁴ |

On the finest grid D − T₁ − T₂ and E K(V) − K(0) − E[J·K′(V)] vanish to 10⁻⁷ or better at every angle. So the
statement "T₂ ≥ 0 for √v" is false (F2), and the rotation identity holds numerically for a non-polynomial f.

## 4. Not checked

Every other table of the report (searches, Hessians, coverage counts, the signs of the three terms at the peak row,
the local content bounds) is **N** from one author; I did not rerun them. In particular "all three terms are ≥ 0 at
the peak row" rests on two-variable searches and two three-variable starts.

## 5. Remarks for the ledger

1. Theorem H gives the sharp radius, and the deficit at every Gaussian buffer, on a class that exists in every
   dimension; it does not touch a cubic whose restriction to every hyperplane is nonzero.
2. The one-coordinate criterion of §5.4 fails from three variables because it cannot see the component free of X.
3. Prop. 6.4 removes the field c₂ − u from the content; its budget ‖a‖² + Σ‖W_k‖² = ‖P₂,₀q²‖² + ½‖P₃,₁q²‖² is at most
   δ − 2‖c₂ − u‖². Its Cauchy–Schwarz bound is still above the raw constant 0.15 (F12), like that of 6.3.25 (item 91).
