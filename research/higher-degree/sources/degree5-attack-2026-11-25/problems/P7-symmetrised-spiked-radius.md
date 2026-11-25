# P7. The symmetrised spiked radius of the cubic chaos

**Summary.** Let z₁ be one coordinate of a standard complex Gaussian vector and G any element of the cubic Wick
chaos H₂,₁ (it may depend on z₁). Prove a bound

    ½·(E|ℓ·z₁ + G| + E|ℓ·z₁ − G|) ≤ r₁·√(ℓ² + ‖G‖₂²)        for all ℓ ≥ 0, all G ∈ H₂,₁(ℂⁿ), all n,

with an explicit constant r₁ < 0.94. Equivalently: for every pair of unimodular functions f, g, with h = (f + g)/2
and k = (f − g)/2, ‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ r₁². The conjectured best constant is √π/2 = 0.8862. For G independent of
z₁ the bound holds with the radius of the cubic chaos (0.9148 is proved), and for general G it is proved with the
spike discounted by √(2/π). Each value of r₁ below 0.9329 extends the range of the degree-5 certificate that needs
no sector hypothesis: r₁ = 0.9148 gives t ≤ 0.4661, and r₁ = √π/2 gives t ≤ 0.6176 (both rounded downward).

Source record (not needed to do the work): `research/higher-degree/sources/degree5-midt-2026-11-25/NOTE.md` §§2–4
and ledger rows 4.46–4.49 of `research/higher-degree/STATUS.md`; problem P3 of this folder (the range of t it
serves); the radius theorem in `research/conjecture-K/sources/complex-radius-2026-11-17-gemini-2762/PROOF.md`
(repository `agalatan/grothendieck-lean`).

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point; "author only"
when nobody but the author has checked it.

---

## 1. Setting and notation

**Gaussian space.** z = (z₁, …, z_n): independent standard complex Gaussians, each with density π⁻¹e^{−|z|²} on ℂ
(E|z_j|² = 1, E z_j² = 0); n is arbitrary. ⟨f, g⟩ = E[conj(f)·g], ‖f‖₂² = E|f|².

**Chaos.** H_{a,b} is the closed span of the Wick polynomials :z^α z̄^β: with |α| = a, |β| = b; P_{a,b} is the
orthogonal projection onto it. H₁,₀ is the span of the coordinates. H₂,₁ is the cubic chaos: the span of
z_a z_b z̄_c − δ_{ac} z_b − δ_{bc} z_a. In one variable, with T = |z|²: e₁₁ = T − 1 ∈ H₁,₁, e₂₀ = z²/√2 ∈ H₂,₀,
e₂₁ = z(T − 2)/√2 ∈ H₂,₁, all of norm 1.

**The radius of the cubic chaos.** ρ\* = sup E|q|/‖q‖₂ over q ∈ H₂,₁(ℂⁿ), all n. Known: √π/2 ≤ ρ\* ≤ 2287/2500 =
0.9148 (**P + C**, independently reviewed); ρ\* ≤ 4571/5000 (**P**, author only + **C**). The lower bound is the
diffuse limit: N^{−1/2}·Σ_{j≤N} e₂₁(y_j) converges in law to a standard complex Gaussian W, and E|W| = √π/2.
You may use these.

**The functional.** For ℓ ≥ 0 and G ∈ H₂,₁(ℂⁿ):

    φ(ℓ, G) = ½·(E|ℓz₁ + G| + E|ℓz₁ − G|) = sup { ℓ·Re⟨z₁, h⟩ + Re⟨G, k⟩ : f, g unimodular, h = (f + g)/2, k = (f − g)/2 },

the supremum attained at f = ph(ℓz₁ + G), g = ph(ℓz₁ − G) (ph(a) = a/|a|). Define

    ρ_s = sup { φ(ℓ, G)/√(ℓ² + ‖G‖₂²) : ℓ ≥ 0, G ∈ H₂,₁(ℂⁿ), n ≥ 1, (ℓ, G) ≠ 0 }.

---

## 2. The statement to prove

> **Target.** ρ_s ≤ r₁ for an explicit rational r₁ < 0.9329; the smaller the better. The natural goals are
> r₁ = 2287/2500 (the constant already proved for ℓ = 0) and, as a conjecture, ρ_s = √π/2.

- **Equivalent form (P; three lines).** ρ_s ≤ r₁ if and only if every unimodular pair in every dimension satisfies

      ‖P₁,₀h‖₂² + ‖P₂,₁k‖₂² ≤ r₁².                                                                       (1)

  (⇒: rotate so that P₁,₀h = t·z₁, t = ‖P₁,₀h‖; take ℓ = t and G = P₂,₁k in the supremum form of φ. ⇐: for a pair,
  ℓ·Re⟨z₁, h⟩ + Re⟨G, k⟩ ≤ ℓ·‖P₁,₀h‖ + ‖G‖·‖P₂,₁k‖ ≤ √(ℓ² + ‖G‖²)·r₁.)
- **What the application needs.** For the operator T = P₁,₀ − ε·P₂,₁ + η·P₃,₂ with ε = 39/50, η = 779/10000 and a
  unimodular pair with t = ‖P₁,₀h‖: V = Re⟨f, Tg⟩ ≤ (1 − η)t² + η + (ε − η)‖P₂,₁k‖² (**P**: drop three negative
  terms and use ‖P₃,₂h‖² ≤ 1 − ‖k‖² − t² and ‖k‖² ≥ ‖P₂,₁k‖²). With (1): V ≤ (1 − ε)t² + η + (ε − η)r₁², which
  increases in t and in r₁. It is below the target 500/701 on [0, t] if r₁ is at most (rounded downward; exact
  arithmetic, each entry fails with r₁ + 10⁻⁴; `research/higher-degree/code/degree5-midt/verify_lift_bound.py`):

  | t = | 0.3321 (already proved otherwise) | 0.4000 | 0.5000 | 0.5500 | 0.6000 |
  |---|---|---|---|---|---|
  | r₁ ≤ | 0.9329 | 0.9245 | 0.9091 | 0.9000 | 0.8900 |

  For r₁ = 2287/2500 it is below the target for t ≤ 0.4661 (to eight decimals 0.46616437; it fails at 0.4662), and
  for r₁ = √π/2 for t ≤ 0.6176 (it fails at 0.6177).

  A bound that depends on the angle, ρ_s(θ) = sup over ℓ = cos θ·s, ‖G‖ = sin θ·s, is equally useful: at visible
  mass t only the angles with tan θ = ‖P₂,₁k‖/t matter.
- **A weaker version that still helps:** (1) with a coefficient c² ∈ ((431/500)², 1] on the first term,
  c²·‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ ρ₀² (§3 item 3 has c² = 2/π proved and c² = (431/500)² = 0.743044 as the coefficient
  treated in PR #660).

---

## 3. What is known

1. **ρ_s ≥ √π/2**, with equality in (1) along a whole limiting family (**P**): for f = ph(z₁ + cW),
   g = ph(z₁ − cW), where W is the *diffuse limiting Gaussian* of the cubic chaos (a standard complex Gaussian
   independent of z₁, the limit in law of N^{−1/2}·Σ_{j≤N} e₂₁(y_j) of §1; not an element of H₂,₁ in finitely many
   variables), t = (√π/2)/√(1 + c²) and ‖P₂,₁k‖ = (√π/2)·c/√(1 + c²), so t² + ‖P₂,₁k‖² = π/4 for every c ≥ 0 in the
   limit N → ∞; for finite N the pairs ph(z₁ ± c·N^{−1/2}Σe₂₁(y_j)) approach it.
2. **Remote G (P).** If G does not depend on z₁, then φ(ℓ, G) ≤ ρ\*·√(ℓ² + ‖G‖²): replace z₁, which is independent of
   G, by the cubic N^{−1/2}Σe₂₁(y_j) in fresh variables and let N → ∞; the sum is then an element of H₂,₁.
3. **General G, with a discounted spike (P, author only; NOTE §2).** For every G ∈ H₂,₁ and ℓ ≥ 0,
   φ(√(2/π)·ℓ, G) ≤ ρ\*·√(ℓ² + ‖G‖²); equivalently (2/π)‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ ρ\*² for every pair. Proof: with m a
   real element of H₁,₁ in fresh variables, of norm 1 and symmetric law, and s = sgn(m), the function F = s·h + k
   is unimodular and U = ℓ·z₁·m + G lies in H₂,₁, with Re⟨U, F⟩ = ℓ·E|m|·Re⟨z₁, h⟩ + Re⟨G, k⟩ and
   ‖U‖² = ℓ² + ‖G‖²; E|m| tends to √(2/π) along a diffuse sequence. With an elliptic complex m and a non-linear
   choice of F the coefficient 2/π becomes c₀², c₀ = 0.862 (**N** in NOTE §3; a rational certificate of the
   coefficient 431/500 is the subject of codex-a7c4's PR #660, ledger row 4.18e there). No choice of this kind
   gives more than E|m| ≤ √π/2 in place of 1.
4. **The symmetrisation is essential (P).** Without it the two-chaos radius is at least √(9π/32) = 0.939985… > 0.93998:
   F = (P₁,₀ + P₂,₁)(z₁/|z₁|) = (√π/2)·z₁(1 − (|z₁|² − 2)/4) has E|F| ≥ ‖F‖₂² and ‖F‖₂² = π/4 + π/32; the ratio of
   this F is 0.9433 and that of z₁(1 − 0.345(|z₁|² − 2)) is 0.9460 (**N**). (The cubic part is a real multiple of
   z₁(|z₁|² − 2); in φ the two signs of G cancel this flattening to second order.) The bound that forgets the
   phase, φ(ℓ, G) ≤ E√(ℓ²|z₁|² + |G|²), has the same value Γ(5/2)/√2 = √(9π/32) at ℓ = ‖G‖ for a diffuse G. With
   r₁² = 9π/32 the bound of §2 fails at t = 0.2613 (exact), and the direct bound already covers t ≤ 0.25282, so
   neither can serve.
5. **Second order at G = 0 (P for the forms; numbers N).** φ(ℓ, G) = (√π/2)ℓ + (1/2ℓ)·E[(Im(G·e^{−iθ}))²/|z₁|] + …,
   θ = arg z₁, and the quadratic form is at most (√π/2)‖G‖² on every sector of H₂,₁ by visible Wick factor, with
   equality on the remote sector (G independent of z₁) and on G = i·z₁·Q with Q real in H₁,₁; on the span of
   e₁₁(z₁)·w and e₂₀(z₁)·w̄ its largest eigenvalue is 0.727, on z̄₁·H₂,₀ it is 0.443, on i·e₂₁(z₁) it is 0.775.
6. **Numerics (N; searches bound suprema from below).** In a model with all six sectors diffuse (ten real
   parameters) the largest ratio found equals √π/2 to 10⁻¹⁰, attained by a remote diffuse cubic alone, at every
   angle θ. On G = (any element of H₂,₁(ℂ²) in z₁ and one remote coordinate) + (a diffuse remote cubic) the largest
   ratio found is again √π/2, attained with the polynomial part → 0 (NOTE §4.3 has the table).

---

## 4. Why the obvious approaches fail

- **Triangle inequality:** φ(ℓ, G) ≤ (√π/2)ℓ + ρ\*‖G‖ is off by the factor (cos θ + sin θ).
- **Replacing z₁ by a cubic** (item 2) needs G independent of z₁. Substituting the cubic into G as well produces
  components in H₃,₂, H₄,₃ and H₅,₄.
- **Lifting z₁ to z₁·m** (item 3) is exact in G but loses the factor E|m| on the spike, and E|m| ≤ √(2/π) for real
  m (the level-2 inequality for real Gaussian quadratic forms, `research/conjecture-K/sources/d1/D1_NOTES.md`).
- **Moment methods on |ℓz₁ ± G|²** with a fair random sign: the mixture X has E X² ≥ 2(E X)² (**P**, author only:
  E X² − 2(E X)² = (E|G|⁴ − 2‖G‖⁴) + 4ℓ²(E|∂₁G|² + E|∂̄₁G|² + Re E[(∂₁G)²]) ≥ 0), but at ℓ = 0 the moment methods
  of the radius record stall near 0.93, and no sixth-moment bound for the mixture is proved.

---

## 5. Suggested approaches

- **Extend the Stein identities of the radius proof** to U = ℓz₁ + G: the antiholomorphic identity
  E[H·q] = Σ_j E[(∂_jH)·∂̄_jq] holds for q ∈ H₂,₁, and E[H·z₁] = E[∂̄₁H]; the symmetrised functional is the
  average over the sign of G, which removes the terms that are odd in G.
- **A conditional argument in the phase of z₁.** After removing the phase, ℓz₁ ± G = e^{iθ}(ℓ√T ± Σ_m e^{imθ}G_m)
  with m ∈ {−2, −1, 0, 1}; the m = 0 part (z₁·H₁,₁ and e₂₁(z₁)) is the only one that interferes with the spike.
- **A sharper lift.** Find a unimodular F on an enlarged space and U ∈ H₂,₁ with Re⟨U, F⟩ = c·ℓ·Re⟨z₁, h⟩ + Re⟨G, k⟩
  and ‖U‖² = ℓ² + ‖G‖², c > 0.862.
- **Sub-problem (b), a finite computation: addressed by PR #660** (codex-a7c4; under review when this was written;
  do not redo it, the main target of §2 is what remains). It was: certify the constant of the elliptic lift: with X ~ N(0, a²) and
  Y ~ N(0, 1 − a²) independent, R_λ = √(X² + (Y + λ)²), κ(λ) = E[(Y + λ)/R_λ], c(λ) = E[(X² + Y(Y + λ))/R_λ]:
  prove c(λ) ≥ (43/50)·√(1 − κ(λ)²) for all λ ≥ 0 at a = 179/200 (**N**: the infimum of the ratio is 0.86204 at
  λ = 0.56; it is 0.8641 at λ = 0 and tends to a as λ → ∞), and write out the passage from Gaussian m to elements of
  H₁,₁. This would give (43/50)²t² + ‖P₂,₁k‖² ≤ ρ₀² and the range t ≤ 0.3576 (0.3445 without the Lean mass fact) at
  ρ₀ = 2287/2500. PR #660 proves the stronger coefficient 431/500 at the same a, through the scalar support
  inequality E|M + iλ| ≥ √(c² + λ²) for every real λ (which implies the inequality above by convex duality), and
  reports the range t ≤ 0.35859076.

---

## 6. Deliverable

- A proof note with every step checkable, stating the constant r₁ (or the function ρ_s(θ)) and the inputs used.
- Every number from a script in exact rational or interval arithmetic, with negative controls: the same script
  must fail for r₁ = 0.88 (item 1) and, if it does not use the symmetrisation, must fail for every r₁ ≤ 0.93998
  (item 4).
- Labels "P, author only" and "C, author only". A counterexample (a pair with ‖P₁,₀h‖² + ‖P₂,₁k‖² > π/4) is
  wanted as much as a proof: it would show that the conjectured constant is wrong and how the range of t shrinks.

---

## 7. How to test a claimed bound

1. **The equality family** of §3 item 1: t² + ‖P₂,₁k‖² → π/4 for every c (a diffuse limit).
2. **One-variable cubics:** G = α·e₂₁(z₁), α complex. For real α, φ = E[√T·max(ℓ, |α||T − 2|/√2)]; for imaginary
   α, φ = E[√T·√(ℓ² + |α|²(T − 2)²/2)] (T ~ Exp(1)).
3. **Transverse cubics:** G = i·a·z₁·Q, Q a real element of H₁,₁ of norm 1 independent of z₁:
   φ = (√π/2)·E√(ℓ² + a²Q²) ≤ (√π/2)√(ℓ² + a²). (The pairs of ledger 4.40 have this G.)
4. **Juntas with a bath:** G = Σ c_i·b_i(z₁, y) + τ·W over the six Wick monomials b_i of H₂,₁(ℂ²); the script
   `research/higher-degree/code/degree5-midt/spiked_radius_junta.py` evaluates and maximises the ratio.
5. **The unsymmetrised control:** E|F|/‖F‖₂ = 0.9433 for F = z₁(1 − (|z₁|² − 2)/4); a proof that does not use
   both signs must fail on it.
