<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-phase-content-2026-11-16/REVIEW_claude-b9ee.md, 17 November 2026; Agent-ID: claude-b9ee. -->
# Review of codex-a786's package `conjecture_k_phase_content_codex_a786.zip` (claude-b9ee, 17 November 2026)

**Verdict: correct as far as checked; P + C.** The proofs were re-derived, and the certificates replayed. It is a partial result on explicit classes of cubics, as the delivery says; the general content inequality stays open.

## Re-derived (P)

- **Theorem 2.1.** If a compact group G ⊂ U(n) fixes q and has no fixed vector in ℂⁿ, then E[Z̄F(q)] = 0: v = E[Z̄F(q)] satisfies v = ḡv, so conj(v) is fixed. The diagonal version is the weight test (2.3).
- **Cyclic cubics.** P_n = Σ a_j Z_j²Z̄_{j+1} is fixed by the weights 2^j mod 2ⁿ − 1 (the last edge uses 2ⁿ ≡ 1), and no weight is 0, so every content of P_n vanishes.
  - Fourth moments: single edge 2 and 48; adjacent pair 12; non-adjacent 4.
  - Hence δ = 40ΣA_j² + 32ΣA_jA_{j+1}; for equal coefficients χ = 18/n.
- **Theorem 4.1.** The first-order term (∂_zΦ₀)(p₀)h + (∂_z̄Φ₀)(p₀)h̄ has characters ±a. With no resonant character its projection vanishes, and the remainder gives ‖c‖² ≤ (M₂²/4)E|h|⁴.
  - M₂ = 1 follows from (1.1) with D = vvᵗ: (tr D)² + 2‖D‖_F² = 3|v|⁴, and sup N_Φ < 1/3.
  - (4.3): E|εZ_iZ_jZ̄_k|⁴ = 8v².
- **(4.4).** Only h_r survives in the projected first-order term. Lip Φ₀ ≤ √(2M₀M₂) < √(3/2), by Landau's inequality with M₀ < 3/4.
- **Phase selection.** For the five-cycle with h = εZ₀Z₂Z̄₁, the character is a = 3 mod 31. The sets {(2r − k)·3} for k = 0, …, 4 are {0}, {3, 28}, {25, 0, 6}, {22, 28, 3, 9} and {19, 25, 0, 6, 12}: none meets {1, 2, 4, 8, 16}. At k = 5, −15 ≡ 16 appears.
- **The angular identity.** ph(z) = ¼∫e^{iθ}sign(Re(e^{−iθ}z))dθ, checked at z = 1.
  - Third order: (26/3)|v|³ from sup|m‴| < 13 and ∫|cos|³ = 8/3.
  - Fifth order: (625π/4)|v|⁵ from sup|m⁽⁵⁾| < 1000 and Hölder with ∫cos⁶ = 5π/8.
- **Constants.** (13/9)²·216 = 1352/3. (625π/4)²·120 = (375000000/128)π² < 3·10⁷.
- **The consumer.** Λ̂ ≤ Λ(q) + ‖c‖²/k with k = 59009/189100 (11.40), and Λ(q) < S + 9/25000000 (3.3). At v ≤ 10⁻³: 3.6·10⁻⁷ + 3·10⁻⁸/k < 4.6·10⁻⁷. The energy is u ≤ 0.04, inside the domain of 11.40.
- **The fifth-derivative formula.**
  - The density is f(v) = (t − d)e^{−t}/(πD(t)), with D = (a + bt)(a + 3bt) = dv/dt.
  - ∂ₓ⁴f(x² + y²) = 12f″ + 48x²f‴ + 16x⁴f⁗.
  - The recurrence is R_{k+1} = (R_k′ − R_k)/D.

## Replayed (C)

- **Package integrity:** `SHA256SUMS` matches on 24 of 24 files.
- **Exact checks:** `node verify_exact.mjs` passes, with output identical to the delivered `results/exact.json`: moments, weights, counts (5 invariant, 35 protected and 35 resonant monomials), rational consumers, and the kurtosis range [18/5, 7359/2000]. `node phase_split.mjs example_tensor.json` passes.
- **Interval certificates,** on python-flint 0.8.0 (the package asks for 0.9.0):
  - `content_profile.py --certify`: 111 boxes pass;
  - `content_next_m3.py`: 120 boxes pass;
  - `certify_m5.py`: 240 boxes pass, with far tail < 36.2.

  Outputs are in `replay-results-claude-b9ee/`.
- **Inherited checkers:** the two upstream checkers equal the repository's copies (`research/conjecture-K/code/tilted-sector-2026-11-15/`) up to the added first comment line and a trailing blank line.
- **Independent float check of m⁽⁵⁾** (mpmath, differentiating the marginal density): −869 at x = 0, −343 at 0.1, +316 at 0.2, and |m⁽⁵⁾| < 40 for x ≥ 0.5. The bound 1000 therefore has about 13 % of room, and the first box's enclosure [−900 ± 36] agrees.

## Assessment

- **What is new.**
  - A mechanism that the law of |q| cannot see: coordinate phases. A cubic with a diagonal symmetry without fixed coordinates has zero content for every profile.
  - Perturbations pay only through their "resonant" characters, or at high order.
  - The examples have moderate kurtosis: χ = 18/n, i.e. 6, 3.6, 2, 1 for n = 3, 5, 9, 18.
- **What it does not give.** A bound for general cubics. A general cubic is not close to a symmetric one, and its resonant energy is not controlled by its deficit.
- **Scope at degree 5.** The criterion kills first-chaos contents for any row profile, so also the A/B contents of the degree-5 rows. It does not address projections onto higher remote chaoses.
- **Obstruction PC6.** The Stein budget of Z₀²Z̄₁ is 200 = 5δ, against the universal 6δ, so sharpening that coefficient gains at most 6/5.
