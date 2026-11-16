<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-radius-9359-2026-11-16/REVIEW_claude-b9ee.md (16 November 2026); Agent-ID: claude-b9ee. Only this line was added. -->
# Review of the radius certificate ρ* ≤ 0.9359 (claude-b9ee, 16 November 2026)

Subject: `package/` in this folder, the contents of `cubic_l1_rho_0_9359.zip` (a GPT session of the user, 16 November
2026; SHA-256 of the zip `8d8358d33c3730df2af92562d6a63eced8bba38542824d13e69e3a33a9e4b66b`; its `SHA256SUMS` verifies).
Claim: for every dimension and every q ∈ H₂,₁,

    E|q| ≤ (9359/10000)·(E|q|²)^{1/2}.

**Verdict: correct.** I re-derived the analytic reduction (its §§2–5) line by line, wrote my own exact verifier from
the statement of the lemma and the data format, without reading the delivered verifiers, and it accepts all six
certificates. The delivered verifiers also replay.

## 1. The inputs

With E|q|² = 1, V = |q|², s = E V² − 2: 0 ≤ s ≤ 42 and E V³ ≤ 6 + 9s + (4045313/100000)·s^{3/2}. Both are Lean theorems
of this repository (K ledger 3.4: `Circular.gaussian_fourth_moment_le_44`, `sixth_moment_complex`). Nothing else is
assumed: the certificate of 3.7 (0.95133) is not used.

## 2. The analytic reduction, re-derived

Notation: C = c₂ = Σ|∂̄_jq|², c₁ = Σ|∂_jq|², D = (c₁ + c₂)/3, a = Σ∂_jq·∂̄_jq, b = Re(q̄²a)/V, c = C − 1, d = D − 1,
A = ‖P₂,₀q²‖², B = ‖P₃,₁q²‖², t = E c².

| step of the README | check |
|---|---|
| (4) E[V g(V)] = E[C(g + Vg′) + V b g′] | the first form of 6.3.20 with G = q̄g(V), real part |
| (5) E[V g(V)] = E[D(g + Vg′) + (2/3)V b g′] | the second form (eigenvalue 2) gives 2E[Vg] = E[c₁(g + Vg′) + Vbg′]; add (4) and divide by 3 |
| (6), (7) a = P₂,₀q² + ½P₃,₁q²; E\|a\|² = A + B/4; E[Vb] = A + B/2 | 6.3.20; E[Vb] = Re⟨q², a⟩ |
| (8) Cov(C, V) = t + B/4 | ⟨V − c₂, c₂ − 1⟩ = B/4 (6.3.20) |
| (9) s = A + B + 2t | 6.3.21 |
| (10) 3E d² + (2/3)E\|a\|² ≤ s | X = Re q has Γ = \|∇X\|²/3 = D/2 + Re(a)/3 (I differentiated in the real coordinates); Var Γ = (4/9)‖P₂X²‖² + (1/9)‖P₄X²‖² ≤ (2/9)κ₄(X), κ₄(X) = 3s/8; the cross term E[d·Re a] vanishes by charge and E(Re a)² = ½E\|a\|². On the Wick monomial: 20.33 + 9.33 ≤ 42 |
| (11) [[C, b], [b, 3D − C]] ⪰ 0 pointwise | 3D − C = c₁ and b² ≤ \|a\|² ≤ c₁c₂ |
| (12) Q₀ … Q₄ | Q₀ is (10) with b² ≤ \|a\|²; E[2c² + b²] ≤ s − 3B/4 (equality on the Wick monomial: 24 = 24); E[b² + 2c(V − 1)] ≤ s − B/4; E[c² − c(V − 1)] = −B/4; E[b² − Vb] ≤ −B/4 |
| the dual lemma (13) ⇒ (14) | (5) on g_D, (4) on g_C, with g_i(v) = f_i(√v): E R = E 𝓛. The weighted sum of (12) is E Q ≤ Λs. 𝓛 + tr(W𝓜) − Q = dH_D + cH_C + bH_b − αd² − βc² − ζb² + w₁₁ + 2w₂₂, and three completed squares. With tr(W𝓜) ≥ 0 and (13): E√V ≤ E p(V) + Λs ≤ 𝓑(s), using d₃ ≥ 0 and the sixth-moment bound |
| regularity | f_i(0) = f_i′(0) = 0 in the data, so g_i(v) = f_i(√v) is C¹ at 0; the tail of f_i is quadratic in r, so g_i is linear in v there |
| convexity in s | 𝓑 is affine in s plus d₃·C₆·s^{3/2} with d₃ ≥ 0, so the two ends of an s-interval control it |

## 3. My verifier

`review-claude-b9ee/own_verifier.py` (Python, `fractions.Fraction` only). Per certificate it checks the signs of the
multipliers, the vanishing of f_i and f_i′ at 0, positive semidefiniteness of W at every knot, Φ(r) ≥ 0 on every
segment and on the tail [R, ∞) by Bernstein coefficients with exact subdivision, and 𝓑 ≤ 9359/10000 at both ends of the
s-interval with a rational upper bound for √s; then that the six intervals cover [0, 42].

Result (`own_verifier.log`): all pass; 602 Bernstein leaves (80, 84, 138, 134, 82, 84, the same counts as the
delivery); endpoint bounds at most 0.934615300504, 0.935610941607, 0.935886270585, 0.935898597609, 0.935891198857,
0.935374595196; run time 0.2 s.

`negative_controls.py` (`negative_controls.log`): my verifier rejects a certificate with d₀ lowered by 10⁻⁵, a
non-positive W at one knot, a gap in the cover of s, a negative multiplier, and an s-interval enlarged beyond its
bound. The tightest certificate keeps passing with d₀ lowered by 10⁻⁶: its pointwise gap is between 10⁻⁶ and 10⁻⁵.

## 4. Replay of the delivery

`node verify.mjs`, `python3 verify.py certificates.json` and `python3 verify_examples.py`, in a scratch copy
(`replay_node.log`, `replay_py.log`, `replay_examples.log`): all pass, with the numbers of the delivered
`verification.txt`.

## 5. Scope and consequences

- The relaxation behind the certificate is nearly exhausted: the author's mesh searches give about 0.93584 at
  s ≈ 6.5 (N, the author's). A further gain needs new constraints, not finer splines.
- 0.9359 does not reach 0.916 (complex), which is what the uncapped degree-5 game needs at t = 0.
- With ρ* ≤ 9359/10000 the cap of higher-degree 4.12 on the cubic weight rises from 0.7881 to
  (500/701)/ρ*² = 0.81431: at λ₁ = 81/100 the t = 0 slack is 500/701 − (81/100)(9359/10000)² =
  26502185939/7010000000000 = 0.0037806 (checked).
- Not checked: `discover.py` (the numerical search that produced the certificates; not part of the proof) and the
  README's remarks on what does not work (§7), apart from the two exact examples that `verify_examples.py` covers.
