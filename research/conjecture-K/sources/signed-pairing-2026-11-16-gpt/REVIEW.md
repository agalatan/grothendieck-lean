<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-signed-pairing-2026-11-16/REVIEW.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Review: the signed-pairing package for the content-law inequality

Reviewer: a review worker of claude-b9ee (Claude), 16 November 2026, 16:50–17:50 Europe/Bucharest.
Package: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-signed-pairing-2026-11-16/package/`
(author: a GPT session of the user; its proofs were "author only"). Pinned repository commit `b00862999`; its five
source blob hashes match the repository at that commit.
Labels as in `/Users/alingalatan/workspaces/grothe/research/README.md`: **P**, **C**, **N**.
Everything of mine is under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-signed-pairing-2026-11-16/review/`
(`scripts/`, `logs/`, `data/`, and `package-copy/`, the copy in which the package's verifiers were run).
No tracked file was edited; nothing was committed, pushed or posted.

The inequality: for q ∈ H₂,₁, u = E|q|², V = |q|², δ = E|q|⁴ − 2u², a real radial profile h, k(v) = E h(v + uτ),
Ω̂[h] = (3/2)E[V k′(V)²] − (3/4)(E[V k′(V)])²/u:   ‖c[h]‖² ≤ θ·δ·Ω̂[h],   c[h] = Π₁[q h(V)].

---------------------------------------------------------------------------------------------------------------------

## 0. Verdict

1. **Every numbered statement of `PROOFS.md` is correct.** I re-derived each identity and constant by hand and found
   no gap in a proof. The constants 5/3, 13/10, 3/5, 7/20, the tensor bound (11) and its simplification (12),
   χ = 4 + 12κ and ‖c‖² = 16u³/m at h(v) = v are right. The class restriction (X independent of the Hermitian
   quadratic) is what removes the control q = y(|y|² − 2).
2. **Every certificate replays.** The two Node verifiers reproduce the delivered results byte for byte; the Arb script
   reproduces `results/gamma_intervals.json` byte for byte on `big` (python-flint 0.8.0). My own exact checker,
   written from the formulas and not from the package's code, accepts all 121 cells with the same ceilings. Each
   checker certifies the inequality its theorem needs (§5).
3. **The proved constants are upper bounds in every case I computed** (§6): on the six rows, both tilted profiles,
   energies from 0.0025 to 20 σ*², the ratio ‖c‖²/(δΩ̂) never exceeds the proved constant, nor the sharp constant
   of item 4.
4. **The method is close to its own limit, and that limit is far from the application.** For a fixed cubic the
   supremum of the ratio over all admissible profiles and all energies is an explicit number θ*(q) (§3.2; mine).
   The package's constants are within 7–26 % of it on the equal family and within 6–11 % in the limit model. θ*
   is 1.547 at X(|Y|² − 1) and 5.000 at the one-coordinate junta. So no argument that is uniform in the profile and
   in the energy can give the room thresholds 0.37, 0.64, 1.33 on X(|Y|² − 1), or any of the six thresholds on the
   junta-like end of the spike family. The row profiles themselves stay far below the thresholds on the energy band
   of the certificate (at most 0.53 on everything computed, §6).
5. **The diffuse-bulk result is a statement about a limit model only** (§4). For the genuine cubics of `PROOFS.md` (26)
   it holds as N → ∞ at fixed ρ and fixed profile, with no rate. It does not hold at small N: with h(v) = v the
   constant 7/20 fails for N ≤ 11 at ρ = 11/100 (exact). The package claims no finite-N statement; the ledger row
   must say that none holds without an N-dependent term.
6. **Ledger:** the four proposed rows are correct in substance. Two wordings overstate (§8): "an infinite-dimensional
   family" (it is one cubic per m), and the heading of the bulk row (it must say "limit model"). Statuses can now
   read **P** (re-derived) and **C** (replayed, implication inspected).

---------------------------------------------------------------------------------------------------------------------

## 1. What I did

| task | what | where |
|---|---|---|
| 1 | hand re-derivation of `PROOFS.md` §§1–9, line by line | §2, §3 |
| 1 | exact symbolic check of (5), (6), (8), (10), Lemma 2 (h = v, v², v³) and E[N̄qVʲ] = 0 for **symbolic** eigenvalues λ₁, λ₂, λ₃ | `scripts/moments_sympy.py`, `logs/moments_sympy.log` |
| 1 | Lemma 3 as a function: E[N \| q] ≡ 0 on 16 laws (relative size 10⁻³²); Lemma 5: the kernels of Z and Z̃ agree to 10⁻¹⁴ | `scripts/herm_sharp.py`, `scripts/lemma5_check.py` |
| 1 | Theorem 9 by direct quadrature: (19), (20) to 10⁻¹⁰, contraction of Ω̂ | `scripts/thm9_check.py` |
| 1 | sharp profile-free constants θ* (equal family m ≤ 30, five two-eigenvalue spectra, a nine-eigenvalue spectrum by Monte Carlo, the limit model on 38 values of ρ, the junta) | `scripts/herm_sharp.py`, `equal_sharp_scan.py`, `mc_unequal.py`, `limit_sharp.py`, `kernel_pointwise.py`, `robust_sharp.py` |
| 2 | exact finite-bulk test of the limit constants | `scripts/finite_bulk_linear.py` |
| 3 | replay of the three checkers; my own exact checker of the 1.2 MB certificate; exact null identities at high degree; interval re-check with a second library | `logs/verify_*.log`, `logs/flint_replay_big.log`, `scripts/cert_check.py`, `null_highdeg.py`, `gamma_check.py` |
| 4 | the ratio on six rows × two profiles × nine to fourteen energies × the listed cubics | `scripts/rows_ratio.py`, `small_energy.py`, `limit_ends.py`, `mc_unequal.py` |
| 5 | comparison with the codex-a786 package (its README and ledger patch only) | §7 |
| 6 | the proposed ledger rows | §8 |

Tools: Python 3.12.3 with numpy 2.3.5, scipy 1.17.1, sympy 1.14.0, mpmath 1.3.0 and Node v24.14.0 on the laptop (one
process at a time, single-threaded, `python3 -I`); python-flint 0.8.0 on `big`.

---------------------------------------------------------------------------------------------------------------------

## 2. Verdict per statement

| statement (`PROOFS.md`) | verdict | how checked |
|---|---|---|
| §1 (1): the two forms of Ω̂, Ω̂ ≥ 0, concavity on the slice EV = u | correct | by hand |
| Lemma 1 (dual law norm) and the replacement rule (3) | correct; an equality for the best F | by hand: Ω̂ = (3/2)⟨F, (I − P/2)F⟩, (I − P/2)⁻¹ = I + P |
| (4)–(6): q ∈ H₂,₁, the moments of B and C, δ = 4u² + 12s₄, χ = 4 + 12κ | correct | by hand; symbolic λ₁, λ₂, λ₃ |
| Lemma 2: c_X[h] = ⟨Z, F⟩, Z = X(2SC − u); content only in the X direction | correct | by hand from 6.3.23 (a = X²C, c₂ = SC); symbolic for h = v, v², v³; N with the row profiles (10⁻⁵) |
| (8): ‖Z‖² = 17u² + 24s₄, ⟨Z, q⟩ = 4s₃ | correct | by hand; symbolic |
| Lemma 3: N = X(2B² + 4C − 4SC) has E[N̄ f(q)] = 0; (10) | correct | by hand (vector field, its Gaussian divergence 2B² + 2C − 4SC, the factor X̄); symbolic on q·Vʲ, j ≤ 3; E[N\|q] ≡ 0 numerically on 16 laws |
| Theorem 4: Θ(κ, ζ) of (11); ζ ≤ κ; (12); 5/3 for every A; 13/10 for κ ≤ 1/6 | correct | by hand; sympy: 5/3 − G = (22 − 2κ − 18κ²)/(3(1+3κ)(11+10κ)), 13/10 − G = (99 − 493κ − 510κ²)/(30(…)); G(1) = 209/126 |
| Lemma 5: Z̃ of (16), ‖Z̃‖² = 17J_m + 24/m, ⟨Z̃, q⟩ = 4σ/√m, bound (15) | correct | by hand; kernels of Z and Z̃ agree to 10⁻¹⁴ (m = 1, 2, 4, 12, 22) |
| Lemma 6: J_m ≤ 2(1 − 𝒜_m), the formula for 𝒜_m, H(m) of (17) | correct | by hand (beta integral, both parities); 𝒜_m by direct quadrature; J_m ≤ 2(1 − 𝒜_m) for m ≤ 200 (N) |
| Lemma 7: J_m ≤ 2/(m − 2), I(m) of (18), m > 2 | correct | by hand (relative Fisher information m/(m−2) − 1; Poincaré on the odd part; weak derivative needs m > 2) |
| Theorem 8: 5/3 (m ≥ 1), 13/10 (m ≥ 4), 3/5 (m ≥ 12), 7/20 (m ≥ 22) | correct, **P + C** | tails m ≥ 8, 19, 34 in exact fractions (and 7, 18, 33 fail, so the finite lists are the right ones); 23 interval checks replayed and repeated with mpmath.iv |
| Theorem 9: (19), (20), Ω̂_a[h_s; p] ≤ Ω̂_u[h; Q] | correct | by hand; quadrature on two profiles and three (α, s) |
| Lemma 10: c_X = α²⟨C₀, F⟩, C₀ = X(3T² − 2T − 2), ‖C₀‖² = 764, ⟨C₀, Q⟩ = 32α | correct | by hand (also directly from 6.3.20 with the bulk written as βW̄′); exact on h = v, v²; N with the row profiles |
| (23), (24): the null vectors 𝒩_A, 𝒩_B | correct | by hand (chain rule ∂_X f(Q) = ρ[2H₁₁∂_W f + H₀₂∂_W̄ f] and adjoints); 13,600 exact pairings, all 400 controls |
| (25) and Theorem 11 (the six ρ-ranges) | correct for the limit model, **P + C** | by hand; replay; my own exact checker |
| §8: the diffuse limit | correct as stated (a limit, one specific bulk, no rate) | by hand; see §4 for what does not follow |
| §9: the two profiles are real, continuous on [0, ∞), bounded (946/25, 748/25; 16/5, 13/5) | correct | by hand (P(T), the phase inequality, the moments of T^{±1/2}, T^{3/2}); the exact row inequalities by the replayed Node script |
| README: χ = 4 + 12κ; 4 < χ ≤ 50/11 for m ≥ 22; ‖c‖² = 16u³/m at h = v; the control 256/63 | correct | sympy |

No statement is wrong and no proof has a gap. The limits of scope are in §3 and §4.

---------------------------------------------------------------------------------------------------------------------

## 3. Notes on the proofs

### 3.1 Hypotheses

- **Profiles.** Real, continuous on [0, ∞) including v = 0, of polynomial growth. That is what 6.3.23 needs (k is
  then C¹ and k′ has polynomial growth, so F = q k′(V) ∈ L²); nothing else about h enters. Realness is used only to
  say that c_X is real. §9 shows that the two tilted row profiles are in the class.
- **Every energy.** Correct: u enters only through k = 𝒦_u h, and every bound is homogeneous. See §3.5 for what this
  generality costs.
- **Independence of X and Y** is used three times: q ∈ H₂,₁; the factorised moments; and, in Lemma 5, that
  X′ = sign(B)·X is a standard Gaussian independent of B. A driver that also appears in the quadratic factor
  (q = y(|y|² − 2)) is outside the class, and that is the control: its ratio at h = v is 256/63.
- **Hermitian A** makes B and C real. Rotating Y by a common phase fixes q, so the content has the X direction only;
  the diagonalisation is not needed for that.
- **Theorem 9** does not use that the core is circular or cubic; W must be independent of the core.

### 3.2 The sharp profile-free constant (my remark; the identity **P**, reviewer only; the values **N**)

Let Z be any representative with c[h] = ⟨Z, q k′(V)⟩ for all h (Lemma 2, Lemma 10; in general
Z_e = y_e(ā·q/q̄ + x) from 6.3.23). For every bounded continuous g, k′ = g is the transform of the admissible profile
h = ∫₀ᵛg − u g, so F = q k′(V) ranges over a dense subset of ℛ = {q φ(V)} ⊂ L². The form Ω̂ = (3/2)⟨F, (I − P/2)F⟩
preserves ℛ (q ∈ ℛ). Hence, with Π the projection on ℛ, i.e. ΠZ = E[Z | q]:

    θ*(q) := sup over profiles and energies of ‖c[h]‖²/(δ Ω̂[h]) = (2/3)·(‖E[Z | q]‖² + |⟨q, Z⟩|²/u)/δ.

It depends on the law of q only up to scale, and it is the exact limit of any proof that is uniform in the profile.
Every bound of the package is ‖Z′‖² ≥ ‖E[Z | q]‖² for some representative Z′. I computed ‖E[Z | q]‖² from
one-dimensional kernels on |q| (`scripts/siglib.py`), validated by exact moments to 10⁻⁹, by adaptive mpmath
quadrature to 10⁻¹⁵, by other grids to six digits, and by Monte Carlo (a lower bound, biased down by the heavy tails).

| cubic | ratio at h = v | **θ*** (N) | proved constant | proved / θ* |
|---|---|---|---|---|
| X(\|Y\|² − 1) (m = 1) | 4/3 | **1.5473** | 1.6587 (Theorem 4; claimed 5/3) | 1.07 |
| equal family, m = 2 | 1.0667 | **1.3008** | 1.5292 (Theorem 4) | 1.18 |
| m = 3 | 0.8889 | **1.1190** | 1.4053 (H(3)); 1.4419 (Theorem 4) | 1.26 |
| m = 4 | 0.7619 | **0.9813** | 1.2093 (H(4); claimed 13/10) | 1.23 |
| m = 12 | 0.3556 | **0.4974** | 0.5685 (H(12); claimed 3/5) | 1.14 |
| m = 22 | 0.2133 | **0.3099** | 0.3416 (H(22); claimed 7/20) | 1.10 |
| A = diag(4, 3)/5 | 1.0798 | **1.3163** | 1.5354 (Θ(κ, ζ)) | 1.17 |
| A = diag(4, −3)/5 | 0.1785 | **0.2393** | 1.0847 (Θ) | 4.5 |
| A = diag(1, −1)/√2 | 0 | **0** (the content vanishes for every profile) | 0.9958 (Θ) | — |
| nine eigenvalues 1, 1, 0.9, 0.9, −0.8, 0.8, 0.7, −0.7, 0.6 (κ = 0.122) | 0.2170 | **0.297** (Monte Carlo) | 1.1079 (Θ; claimed 13/10) | 3.7 |
| limit model, ρ = 0.11 / 0.13 / 0.2 / 0.25 / 1/3 / 0.6 | 0.096 / 0.133 / 0.301 / 0.452 / 0.739 / 1.701 | **0.2943 / 0.4747 / 1.1695 / 1.6051 / 2.1794 / 3.2819** | 0.3243 / 0.5255 / 1.2808 / 1.7520 / 2.3648 / 3.4646 (certified); claimed 7/20 … 18/5 | 1.06–1.10 |
| junta y(\|y\|² − 2) | 256/63 = 4.0635 | **4.99978** | none (outside the classes) | — |

Consequences.
- The package's best constants are within 7–26 % (equal family, m ≤ 30) and 6–11 % (limit model) of what any
  profile-free argument can give.
- The control can be sharpened: on the junta the best profile-free constant is 5.000, not 4.06.
- Over two-eigenvalue spectra A = diag(1, t), −1 < t < 1, θ* is largest at rank one (1.5473 at t = 0; 1.5458 at
  t = ±0.03; 1.376 at t = 0.5; 0.858 at t = −0.5; 0 at t = −1; `scripts/own_profile_check.py`). I did not compute the
  supremum over all Hermitian A; it is at most 209/126 = 1.6587 by Theorem 4.

### 3.3 Theorem 4 cannot reach the two lowest rows

Θ(κ, 0) = (33 + 129κ + 88κ²)/(3(1 + 3κ)(11 + 10κ)) lies in [0.992, 1) on (0, 1], and Θ(κ, ζ) ≥ Θ(κ, 0). So the
tangent-divergence bound is never below 0.992: it serves t = 0.845–0.855 for every A, gives 13/10 (t = 0.84) for κ ≤ 0.1706
(the root of 99 − 493κ − 510κ²; the package states κ ≤ 1/6), and never serves t = 0.80 or 0.82. For diffuse or
sign-balanced spectra it is far from sharp (factor 3.7–4.5 above). The rows 0.80 and 0.82 are covered on the equal
family only.

### 3.4 The equal family: where the thresholds really are

`scripts/gamma_check.py`, `scripts/equal_sharp_scan.py`. The package's table uses the rationals 7/20, 3/5, 13/10; the
application needs 0.37, 0.64, 1.33.

| threshold | package's statement | Lemma 6 gives (interval-checked by me) | sharp θ* allows (N) |
|---|---|---|---|
| 0.37 (t = 0.80) | m ≥ 22 (for 7/20) | m ≥ 21: H(21) = 0.35584; H(20) = 0.37127 fails | m ≥ 18 |
| 0.64 (t = 0.82) | m ≥ 12 (for 3/5) | m ≥ 11: H(11) = 0.60894; H(10) = 0.65554 fails | m ≥ 9 |
| 1.33 (t = 0.84) | m ≥ 4 (for 13/10) | m ≥ 4: H(3) = 1.40530 fails | m ≥ 2 (θ*(2) = 1.3008, θ*(1) = 1.5473) |
| 1.88 and above | every m (5/3) | every m | every m |

- The exact reflection asymmetry J_m is 19–31 % below the Hellinger bound 2(1 − 𝒜_m) at m = 4–22 (J₂₂ = 0.02429 against
  0.03007), so (15) with a certified J_m would gain one unit of m at each threshold (m ≥ 20, 10, 3).
- m(1 − 𝒜_m) increases to 1/3 and is below 1/3 for every m ≤ 400 (interval). Hence H(m) < 77/(9(m + 3)) there: the
  package's H(m) lies just below the closed form of the codex-a786 package, and the two agree asymptotically (§7).
- A slightly sharper elementary step than Lemma 6 is J_m ≤ 1 − 𝒜_m² (Cauchy–Schwarz on ∫4pq/(p + q)); at m = 22 it
  gives 0.02984 against 0.03007. It changes no threshold.
- The Fisher tail I(m) ≈ 37/(3m) is 44 % above 77/(9m); it only serves to finish the three rational targets.

### 3.5 "Every energy" is both the strength and the limit

θ* does not depend on the energy, so the package cannot use the energy band of the certificate. The row profiles do
depend on it (`logs/rows_ratio_by_energy.log`, `logs/small_energy.log`): the ratio grows as u decreases.

| cubic, row | u = σ*² | 0.5 σ*² | 0.25 σ*² | 0.1 σ*² | largest found (at) | threshold |
|---|---|---|---|---|---|---|
| X(\|Y\|² − 1), t = 0.80 | 0.094 | 0.189 | 0.342 | **0.623** | 1.02 (0.025 σ*²) | 0.37 |
| X(\|Y\|² − 1), t = 0.82 | 0.131 | 0.249 | 0.428 | **0.722** | — | 0.64 |
| X(\|Y\|² − 1), t = 0.84 | 0.193 | 0.346 | 0.553 | 0.848 | 1.04 (0.025 σ*²) | 1.33 |
| equal m = 4, t = 0.80 | 0.069 | 0.144 | 0.255 | **0.431** | 0.63 (0.025 σ*²) | 0.37 |

So the content law with the row threshold is **false at low energy** on genuine cubics of this class (t = 0.80 and
0.82, u ≤ 0.1σ*²; N). The thresholds of ledger 4.19 come from cells with u ≥ 0.5σ*², and can only be asked for on
such a band. Any proof valid at every energy has θ ≥ 0.62 on a class containing X(|Y|² − 1) at t = 0.80, and about
1.0 if the tables are trusted at 0.025σ*². (Below about 0.02σ*² the tabulated profiles are not resolved, s < 0.02;
the theorem still applies to the tabulated function, and no value exceeds θ*.)

These low-energy values do not depend on the tables of the content5 study: with profiles computed directly from the
row constants by my own z-quadrature (`scripts/own_profile_check.py`), X(|Y|² − 1) gives 0.623, 0.723, 0.849 at
u = 0.1σ*² and 0.849, 0.936, 1.037 at 0.05σ*² for t = 0.80, 0.82, 0.84 (tables: 0.623, 0.722, 0.848 and 0.847,
0.931, 1.019); the equal family with m = 4 gives 0.431 at t = 0.80, u = 0.1σ*².

---------------------------------------------------------------------------------------------------------------------

## 4. The diffuse-bulk limit (task 2)

**What is proved.** For the random variable Q = αX(|X|² − 2) + βW, with W a standard complex Gaussian independent of
X, every admissible profile, every α, β > 0 with ρ = α/β in the row's range:

    |E[X̄ Q h(|Q|²)]|² ≤ θ·168α⁴·Ω̂[h; law of |Q|],     u = 2α² + β².

W is **not a coordinate**: only the X coefficient is called content, and 168α⁴ is the fourth excess of Q. This is a
rigorous statement about a Gaussian-perturbed one-coordinate cubic. It is not a statement about an element of H₂,₁.

**What follows for genuine cubics.** Only §8: for q_N = αX(|X|² − 2) + (β/√N)Σ_{j≤N}H(Y_j), at fixed (α, β) and for
one fixed profile, limsup_N ‖c[h; q_N]‖²/(δ(q_N)Ω̂[h; q_N]) ≤ θ. There is no rate, and no uniformity in the profile,
in the energy or in ρ → 0. One specific bulk is treated (equal Wick monomials on fresh coordinates).

**With what error: none is available, and one is needed.** Exact computation (`scripts/finite_bulk_linear.py`; the
formulas verified by polynomial expectations for N = 1, 2): for q_N and h(v) = v,

    ‖c‖² = 1024α⁶ + 128β⁶/N²,   δ = 168α⁴ + 42β⁴/N,   Ω̂ = 3u/4,
    R_N(ρ) = (1024ρ⁶ + 128/N²) / ((126ρ⁴ + 63/(2N))(1 + 2ρ²)).

| row | end of range ρ | limit constant | R_N exceeds it for | δ(q_N) is dominated by the bulk for N < 1/(4ρ⁴) |
|---|---|---|---|---|
| 0.80 | 11/100 | 7/20 | N ≤ 11 (R₁₁ = 0.359; above 0.37 for N ≤ 10) | 1708 |
| 0.82 | 13/100 | 3/5 | N ≤ 6 (R₆ = 0.652) | 875 |
| 0.84 | 1/5 | 13/10 | N ≤ 2 (R₂ = 1.861) | 156 |
| 0.845 | 1/4 | 9/5 | N = 1 (3.563) | 64 |
| 0.85 | 1/3 | 12/5 | N = 1 (3.203) | 20 |
| 0.855 | 3/5 | 18/5 | none (R₁ = 2.137) | 2 |

So the limit constants are **false** for these genuine cubics at small N (as bounds for all profiles): the bulk has
its own content, 128β⁶/N² at h = v, against its own fourth excess 42β⁴/N. A finite-bulk theorem needs at least
N ≥ 256/(63θ), and the regime "δ = 168α⁴" of the limit model needs N ≫ 1/(4ρ⁴), of the order of a thousand
coordinates at the ranges certified for t = 0.80–0.82. `PROOFS.md` §8 says that no finite N is certified; it should
also say that the transfer fails without an N-dependent term.

**Is the content direction X only, and is it the right content?** In the limit, yes: the squared content in the bulk
directions tends to 0 (it is 128β⁶/N² at h = v). It is also the convention of `CONTENT_LEMMA_D5.md` §11.1 (bulk Gaussian of chaos grade (2,1), content at
the core directions). My numbers reproduce the table of its §11.3 to the four digits printed (t = 0.84, u = 0.85σ*²,
A + B: Σ‖c‖²/δ and ΣΩ̂ are 0.0147/0.0955, 0.0174/0.0952, 0.0181/0.0940, 0.0180/0.0901 at c = 0.35, 0.5, 0.7, 0.85, and
0.0157/0.0717 for X(|Y|² − 1)).

**Against the spike family of §11** (c = 0.35, 0.5, 0.7, 0.85 ↔ ρ = c/√(2(1 − c²)) = 0.264, 0.408, 0.693, 1.141;
`scripts/limit_sharp.py`):

| row | needed θ | certified: ρ ≤ (c ≤, χ ≤) | sharp limit of any profile-free bound: ρ ≤ (c ≤, χ ≤) | spike points covered by the certificate |
|---|---|---|---|---|
| 0.80 | 0.37 | 0.11 (0.154, 0.023) | 0.119 (0.166, 0.032) | none |
| 0.82 | 0.64 | 0.13 (0.181, 0.045) | 0.147 (0.203, 0.072) | none |
| 0.84 | 1.33 | 0.20 (0.272, 0.23) | 0.217 (0.294, 0.31) | none |
| 0.845 | 1.88 | 0.25 (0.333, 0.52) | 0.287 (0.376, 0.84) | none (c = 0.35 is just outside; θ*(0.264) = 1.716 < 1.88) |
| 0.85 | 2.5 | 1/3 (0.426, 1.39) | 0.393 (0.486, 2.33) | c = 0.35 |
| 0.855 | 3.7 | 0.60 (0.647, 7.36) | 0.773 (0.738, 12.5) | c = 0.35, 0.5 |

- The certified ranges lie below the band χ ≈ 2–16 of ledger 4.19, except at t = 0.855.
- They cannot be extended much by better controls: the degree-14 certificate is within 6–11 % of θ*(ρ), and
  θ* = 1.72, 2.57, 3.53, 4.22 at c = 0.35, 0.5, 0.7, 0.85 and 5.00 at the junta.
- At c = 0.35, where the measured Ω_{e*}/Ω̂ of §11.5 was largest (0.78–1.04), the true ratio with the row profiles is
  0.093, 0.118, 0.156, 0.169, 0.183, 0.200 at u = 0.85σ*² (profile A). Over the whole family c ≤ 0.85, both
  profiles, u ∈ [0.5, 1.25]σ*², it is at most 0.17, 0.23, 0.35, 0.40, 0.45, 0.53 on the six rows. The inequality the
  application needs holds there with a factor 2–7 to spare (N); what is missing is a proof that uses the profile
  and the energy band.

---------------------------------------------------------------------------------------------------------------------

## 5. Replay (C)

| checker | run | what it certifies | is it what the proof needs? |
|---|---|---|---|
| `scripts/verify_gamma_exact.mjs` | laptop, Node v24.14.0; output identical to `results/gamma_exact.json` | (i) E[S(mZ)²] = 17m² + 24m, E[S(mZ)N] = −22m² − 16m, E[SN²] = 44m² + 40m as polynomials in m, **for equal eigenvalues**; (ii) the numerator and denominator of (12), the factorisation for 5/3, the value 96/36 at κ = 1/6; (iii) 3a(m−2)(m+3) − b(37m−40) has nonnegative coefficients in m − M for (M, a/b) = (34, 7/20), (19, 3/5), (8, 13/10); (iv) the row inequalities of §9 in exact decimals | (iii) and (iv) are exactly what Theorem 8 and §9 use. (i) covers (8), (10) on the equal family only; for general spectra the formulas are **P** (I checked them for symbolic λ₁, λ₂, λ₃) |
| `scripts/certify_gamma.py` | `big`, python-flint 0.8.0 (tested by the author with 0.9.0), one process, 0.27 s; `results/gamma_intervals.json` byte-identical (sha256 `20ef1ccb…d209`); my folder there deleted | 0 < 𝒜_m < 1 and H(m) < cap in Arb at 160 bits for m = 22…33, 12…18, 4…7, with the closed forms of 𝒜_m | yes: it is (17), the only interval input of Theorem 8. Repeated with mpmath.iv at 200 bits (`scripts/gamma_check.py`); the closed forms agree with the Γ-formula and with direct quadrature of ∫√(f_m(x)f_m(−x))dx |
| `scripts/verify_exact.mjs` | laptop; output identical to `results/exact_verification.json` | for each of 121 adjoining cells of [0, 3/5] and its 400 dyadic coefficients: max over the two endpoints of ‖Z̄(ρ)‖² + 1024·hi²/(1 + 2hi²) ≤ 252·θ_row, for every row whose range contains the cell; the caps are cell boundaries; BigInt rationals only | yes: it is (25), with the convexity of ρ ↦ ‖Z₀ + ρZ₁‖² and the monotonicity of the second term. The thresholds are hard-coded in the verifier, so the certificate cannot weaken them |

**My own exact checker** (`scripts/cert_check.py`, `logs/cert_check.log`). It builds 𝒩_A, 𝒩_B from the one-variable rules
z·H_ab = H_{a+1,b} + b·H_{a,b−1}, ∂_z H_ab = a·H_{a−1,b} (not from the product formula of the package), tests them
in ordinary monomials with E[z^a z̄^b] = a!δ_ab, and recomputes all 242 endpoint norms: 400 controls (204 + 196),
outputs of degree ≤ 17 and charge −1, largest bound per row 0.324343538, 0.525503557, 1.280764343, 1.752029848,
2.364814484, 3.464601528 — the package's ceilings.

**Trust boundary** (`CERTIFICATES.md` §4): confirmed. No floating-point number enters a **C** conclusion; the proposal
scripts (`build_certificate.py`, `variational_probe.py`) only choose the integers. Soundness does not depend on the
order of the 400 columns: any coefficients give a valid representative. Two remarks.
- The package's "2400 exact null checks" use test functions of degree ≤ 15; only 218 of them are nontrivial (the
  ρ-free and the ρ parts separately nonzero), and controls of high degree are never exercised. I added
  `scripts/null_highdeg.py`: f = Q^a Q̄^{a−1}, a ≤ 17, ρ = 1/4 and 3/5: 13,600 exact pairings vanish, 10,518 of them
  nontrivial, every one of the 400 controls tested.
- The column order of the certificate is defined only by the loops of `verify_exact.mjs`.

---------------------------------------------------------------------------------------------------------------------

## 6. Independent numerical check (N)

Own code (`scripts/siglib.py`, `rows_ratio.py`, `small_energy.py`, `limit_ends.py`, `mc_unequal.py`). Profiles: the
tables `prof_k.npz` of
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/out/`
(read-only; they agree with my own z-quadrature of the definitions to 4·10⁻⁵ at four radii per row, and the row
constants with the package's `rows.json` to 5·10⁻¹¹). h_A = (Γ_A + 0.4Γ₀)(√v)/√v, h_B = (Γ_B + 0.3Γ₀)(√v)/√v;
σ*² = sig² of the row. The content is computed directly and, separately, through ⟨Z, F⟩ (Lemma 2, Lemma 10): they
agree to 2·10⁻⁴ or better in every case.

Ratio ‖c‖²/(δΩ̂) at u = 0.5 / 0.85 / 1.0 σ*², the larger of the two profiles:

| cubic | t = 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 | θ* | proved |
|---|---|---|---|---|---|---|---|---|
| X(\|Y\|² − 1) | 0.189 / 0.112 / 0.094 | 0.249 / 0.153 / 0.131 | 0.346 / 0.224 / 0.193 | 0.380 / 0.250 / 0.217 | 0.420 / 0.281 / 0.245 | 0.468 / 0.319 / 0.280 | 1.547 | 1.659 (5/3) |
| equal m = 4 | 0.144 / 0.083 / 0.069 | 0.189 / 0.116 / 0.098 | 0.257 / 0.170 / 0.147 | 0.280 / 0.189 / 0.164 | 0.307 / 0.211 / 0.185 | 0.337 / 0.238 / 0.211 | 0.981 | 1.209 (13/10) |
| equal m = 12 | 0.072 / 0.041 / 0.034 | 0.095 / 0.058 / 0.049 | 0.129 / 0.085 / 0.074 | 0.140 / 0.095 / 0.083 | 0.153 / 0.106 / 0.093 | 0.168 / 0.120 / 0.106 | 0.497 | 0.569 (3/5) |
| equal m = 22 | 0.044 / 0.025 / 0.021 | 0.058 / 0.035 / 0.030 | 0.079 / 0.052 / 0.045 | 0.086 / 0.058 / 0.050 | 0.093 / 0.065 / 0.057 | 0.102 / 0.073 / 0.065 | 0.310 | 0.342 (7/20) |
| A = diag(4, 3)/5 | 0.178 / 0.105 / 0.087 | 0.234 / 0.144 / 0.122 | 0.322 / 0.210 / 0.182 | 0.352 / 0.235 / 0.204 | 0.388 / 0.263 / 0.230 | 0.429 / 0.298 / 0.263 | 1.316 | 1.535 |
| A = diag(4, −3)/5 | 0.026 / 0.015 / 0.013 | 0.034 / 0.021 / 0.018 | 0.046 / 0.030 / 0.026 | 0.051 / 0.034 / 0.029 | 0.056 / 0.038 / 0.033 | 0.062 / 0.043 / 0.038 | 0.239 | 1.085 |
| nine eigenvalues, κ = 0.122 (Monte Carlo) | 0.045 / 0.026 / 0.022 | 0.058 / 0.036 / 0.030 | 0.079 / 0.053 / 0.046 | 0.086 / 0.058 / 0.051 | 0.094 / 0.065 / 0.057 | 0.104 / 0.074 / 0.065 | 0.297 | 1.108 (13/10) |
| limit model at the end of the row's range (ρ = 0.11, 0.13, 0.2, 0.25, 1/3, 0.6) | 0.060 / 0.049 / 0.045 | 0.084 / 0.068 / 0.063 | 0.162 / 0.127 / 0.117 | 0.214 / 0.162 / 0.147 | 0.291 / 0.210 / 0.188 | 0.439 / 0.287 / 0.249 | 0.294, 0.475, 1.170, 1.605, 2.179, 3.282 | certified 0.324, 0.526, 1.281, 1.752, 2.365, 3.465 |
| needed | 0.37 | 0.64 | 1.33 | 1.88 | 2.5 | 3.7 | | |

Largest ratio over all energies tested (0.1–20 σ*², and 0.0025–0.05 σ*² where run), with the energy in units of σ*²:

| cubic | t = 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
|---|---|---|---|---|---|---|
| X(\|Y\|² − 1) | 1.019 (0.025) | 0.722 (0.1) | 1.041 (0.025) | 0.884 (0.1) | 0.923 (0.1) | 1.057 (0.05) |
| equal m = 4 | 0.631 (0.025) | 0.486 (0.1) | 0.630 (0.05) | 0.569 (0.1) | 0.587 (0.1) | 0.641 (0.05) |
| equal m = 12 | 0.212 (0.1) | 0.237 (0.1) | 0.266 (0.1) | 0.274 (0.1) | 0.282 (0.1) | 0.289 (0.1) |
| equal m = 22 | 0.181 (0.025) | 0.144 (0.1) | 0.181 (0.05) | 0.165 (0.1) | 0.170 (0.1) | 0.183 (0.05) |
| A = diag(4, 3)/5 | 0.863 (0.025) | 0.639 (0.1) | 0.867 (0.025) | 0.764 (0.1) | 0.792 (0.1) | 0.885 (0.05) |
| limit model, end of range (14 energies) | 0.091 (0.025) | 0.123 (0.05) | 0.267 (0.05) | 0.387 (0.05) | 0.598 (0.05) | 1.199 (0.05) |

(Rows 0.82, 0.845, 0.85 were not run below 0.1σ*² for the Hermitian laws.)

Reading: every value is below its proved constant and below θ*. On the band u ≥ 0.5σ*² the values are below the
needed θ by a factor of at least 1.9 (t = 0.80, X(|Y|² − 1), 0.5σ*²) and usually 3–10. At low energy the row
profiles reach two thirds of θ* (1.06 against 1.547 on X(|Y|² − 1)), so the proved constants cannot be improved
much as statements for every energy.

---------------------------------------------------------------------------------------------------------------------

## 7. Comparison with the codex-a786 package (not reviewed)

`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/package/README.md`:
class q = √u·X·P_m with θ = 77/(9(m + 3)), from conditioning on the sign of P_m and the bound "squared sign bias
≤ 2/(3m)" by the Gamma/reflected-Gamma Hellinger affinity.

- **Same mechanism, consistent results.** Its constant is this package's bound (15) with J_m ≤ 2/(3m), a uniform
  estimate in place of 23 evaluations: (17m·2/(3m) + 40)/(6(m + 3)) = 77/(9(m + 3)). I checked
  m(1 − 𝒜_m) < 1/3 for m ≤ 400 (interval), so H(m) < 77/(9(m + 3)) there, and they agree asymptotically.

  | m | this package: certified H(m) (claimed) | codex-a786: 77/(9(m+3)) | sharp θ* (N) |
  |---|---|---|---|
  | 4 | 1.20934 (13/10) | 11/9 = 1.22222 | 0.9813 |
  | 12 | 0.56852 (3/5) | 77/135 = 0.57037 | 0.4974 |
  | 22 | 0.34163 (7/20) | 77/225 = 0.34222 | 0.3099 |

  Both give the same thresholds: m ≥ 21, 11, 4 for 0.37, 0.64, 1.33.
- **Where this package is stronger:** m = 1, 2 (1.659, 1.529 by the tangent divergence, against 2.139, 1.711), so it
  covers X(|Y|² − 1) at t = 0.845; an explicit constant < 5/3 for **every** Hermitian A (codex-a786 has a criterion
  there); and the only result with a self-interacting driver (the Wick coordinate), though in a limit model.
- **Where codex-a786 is stronger:** a closed form for every m, which decays like 8.56/m (this package's tail is
  I(m) ≈ 12.3/m, and its table stops at 7/20); it states m ≥ 21 and m ≥ 11; and its P2 covers a **finite** genuine
  bulk (decoupled, of zero-content type) at every mixing ratio, which this package does not.
- Both propose a K-ledger row **6.3.26**: the numbers collide.

---------------------------------------------------------------------------------------------------------------------

## 8. The proposed ledger rows (`LEDGER_ADDITIONS.md`)

| proposed row | assessment |
|---|---|
| 4.20 (Hermitian factors) | correct. Add that the bound is never below 0.992 (so not for t = 0.80–0.82), and the sharp constant 1.547 at X(\|Y\|² − 1) |
| 4.21 (equal family) | correct in substance. **Overstated title:** "an infinite-dimensional family of genuine cubics" is the sequence q_m, one cubic per m up to scale. "Covers the A and conjugated-B profiles on all six supplied rows" should read "the proved constants are below the six room thresholds of 4.19". State m ≥ 21 and m ≥ 11 for 0.37 and 0.64 |
| 4.22 (heavy coordinate + bulk) | correct for the limit model. **The heading and scope must say "limit model"**, that W is not a coordinate, that the statement is false for small finite bulks without an N-dependent term, and where the ranges sit (χ ≤ 0.023 … 7.4) |
| 4.23 (smoothing) | correct as written |
| §5 sentence | acceptable with "limit model" for 4.22 |
| K 6.3.26 (signed representatives) | correct; renumber (collision with codex-a786) |
| annotation to item 91 | correct |
| statuses | "replayed by the author" can now read: **P**, re-derived by a review worker of claude-b9ee; **C**, replayed by the same reviewer (Arb on `big`, python-flint 0.8.0, and an independent exact checker) |

### Proposed wording

Row numbers provisional (4.20–4.23 and 6.3.26 are free at the current master; codex-a786 also proposes 6.3.26–6.3.28).
Source tag SPAIR = this package; REV = this review.

| ID | Statement | Scope | Status | Source |
|---|---|---|---|---|
| 4.20 | **The content law on Hermitian quadratic factors.** For independent standard complex Gaussians X and Y ∈ ℂᵐ and a Hermitian A ≠ 0, q = X·(Y*AY − tr A) ∈ H₂,₁ has u = tr A², χ = 4 + 12κ, κ = tr A⁴/u² ∈ (0, 1], and content in the X direction only. For every real continuous profile of polynomial growth and every energy, ‖c[h]‖² ≤ Θ·δ·Ω̂[h] with Θ = (17 + 24κ − (22 + 16κ)²/(44 + 40κ) + 16ζ)/(6 + 18κ), ζ = (tr A³)²/u³ ≤ κ. So Θ ≤ (33 + 217κ + 168κ²)/(3(1 + 3κ)(11 + 10κ)) ≤ 209/126 < 5/3, and Θ ≤ 13/10 for κ ≤ 1/6. Proof: 6.3.23 reads c_X = ⟨Z, q·k′(V)⟩ with Z = X(2\|X\|²C − u), C = Σλ_j²\|Y_j\|²; the polynomial N = X(2B² + 4C − 4\|X\|²C), the Gaussian divergence of a vector field tangent to q, has E[N̄ \| q] = 0; Cauchy–Schwarz in the form Ω̂ after subtracting the best multiple of N | genuine cubics, every dimension. Θ ≥ 0.992 for every spectrum: the bound is below the room thresholds of 4.19 at t = 0.845–0.855 (and 0.84 for κ ≤ 1/6), never at 0.80–0.82. The supremum of the ratio over all profiles and energies is 1.547 at X(\|Y\|² − 1), 1.316 at A = diag(4, 3)/5, 0.239 at diag(4, −3)/5 and 0 at diag(1, −1) (**N**) | **P** (a GPT session of the user; re-derived line by line by a review worker of claude-b9ee, the moment identities for symbolic eigenvalues); the suprema **N** (the reviewer) | SPAIR `PROOFS.md` §§1–3; REV §§2–3 |
| 4.21 | **The content law on the equal-spectrum sequence.** q_m = √u·X·(Σ_{j≤m}\|Y_j\|² − m)/√m (χ = 4 + 12/m; ‖c‖² = 16u³/m at h(v) = v): ‖c[h]‖² ≤ H(m)·δ·Ω̂[h] for every admissible profile and energy, H(m) = (34m(1 − 𝒜_m) + 40)/(6(m + 3)), 𝒜_m = e^{−m}mᵐ√π·Γ((m+1)/2)/(Γ(m)Γ((m+2)/2)) the Hellinger affinity of the standardised Gamma(m) law and its reflection. Hence θ = 13/10 for m ≥ 4, 3/5 for m ≥ 12, 7/20 for m ≥ 22; and θ < 0.64 for m ≥ 11, θ < 0.37 for m ≥ 21. Proof: Z is averaged over the sign of the quadratic factor at fixed modulus; the cross term vanishes because the factor is centred. H(m) < 77/(9(m + 3)) for m ≤ 400 (interval-checked), the closed form of [the codex-a786 row] | one cubic per m. The supremum of the ratio over all profiles and energies is 0.981, 0.497, 0.310 at m = 4, 12, 22, so no profile-free bound gives 0.37 for m ≤ 17, 0.64 for m ≤ 8 or 1.33 for m = 1 (**N**) | **P + C** (same author and reviewer; 23 Arb checks replayed with python-flint 0.8.0 and repeated with a second interval library; the tails in exact fractions; m = 21 and 11 by the reviewer's interval check); the suprema **N** | SPAIR `PROOFS.md` §§4–5, `certify_gamma.py`, `verify_gamma_exact.mjs`; REV §3.4 |
| 4.22 | **A heavy Wick coordinate in a Gaussian bath (limit model).** For Q = αX(\|X\|² − 2) + βW, W a standard complex Gaussian independent of X and not counted as a coordinate: \|E[X̄·Q·h(\|Q\|²)]\|² ≤ θ·168α⁴·Ω̂[h; law of \|Q\|] for every admissible profile and energy, with θ = 7/20, 3/5, 13/10, 9/5, 12/5, 18/5 for ρ = α/β ≤ 11/100, 13/100, 1/5, 1/4, 1/3, 3/5 (χ ≤ 0.023, 0.045, 0.23, 0.52, 1.39, 7.4). Proof: 6.3.23 gives the representative α²X(3\|X\|⁴ − 2\|X\|² − 2); polynomial null vectors from the chain rule in (X, W); 121 rational cells with 400 Wick controls of degree ≤ 14. It is the limit N → ∞, at fixed ρ and for a fixed profile, of the cubics q_N = αX(\|X\|² − 2) + (β/√N)Σ_{j≤N}H(Y_j) | a limit statement. At finite N it fails without an N-dependent term: at h(v) = v the ratio of q_N is (1024ρ⁶ + 128/N²)/((126ρ⁴ + 63/(2N))(1 + 2ρ²)), above 7/20 for N ≤ 11 at ρ = 11/100 (exact). The ranges are close to the limit of any profile-free bound, ρ ≤ 0.119, 0.147, 0.217, 0.287, 0.393, 0.773 (**N**); of the spike family of 4.19 they contain c = 0.35 at t = 0.85–0.855 and c = 0.5 at 0.855. On the junta the supremum of the ratio over profiles is 5.000 (**N**) | **P + C** for the limit model (same author and reviewer; the certificate replayed and re-checked by an independent exact checker); the limit N → ∞ **P**; no finite-N statement | SPAIR `PROOFS.md` §§7–8, `results/certificate.json`, `verify_exact.mjs`; REV §§4–5 |
| 4.23 | **Gaussian smoothing intertwines the radial transforms.** If Q = p + √s·W with W a standard complex Gaussian independent of p, a = E\|p\|², u = a + s and k = 𝒦_u h, then K_s(v) = E k(\|√v + √s·W\|²) satisfies E[Q h(\|Q\|²) \| p] = p·h_s(\|p\|²) and E[Q k′(\|Q\|²) \| p] = p·K_s′(\|p\|²) with h_s = K_s − aK_s′, K_s = 𝒦_a h_s; and Ω̂_a[h_s; p] ≤ Ω̂_u[h; Q] | every core p and admissible profile; an exact conditioning identity. It gives no comparison in the other direction (in the reviewer's six examples Ω̂ of the core is 1.5–160 times smaller) | **P** (same author and reviewer; **N** on two profiles) | SPAIR `PROOFS.md` §6; REV §2 |

Suggested addition to the content-band item of the higher-degree ledger, section 5:

> The content law is proved on structured classes (4.20–4.21) and in a limit model (4.22), with constants uniform in
> the profile and the energy. Such constants cannot serve the band in general: the supremum of the ratio over
> profiles and energies is 1.55 at X(|Y|² − 1) and 5.00 at the junta, and at t = 0.80–0.82 the row profiles exceed
> the room thresholds on X(|Y|² − 1) for u ≤ 0.1σ*² (**N**). On u ≥ 0.5σ*² the measured ratio is at most 0.53 on
> these classes and on the spike family. The open step is a bound that uses the row profile and the energy band.

Suggested K-ledger row (after the codex-a786 rows, if those are taken):

| ID | Statement | Scope | Status | Source |
|---|---|---|---|---|
| 6.3.2x | **Signed representatives, and the exact profile-free constant.** If c[h] = ⟨Z, q·k′(V)⟩ for every profile (6.3.23 gives Z_e = y_e(ā·q/q̄ + c₂ − u)), then Z may be replaced by any Z + N with E[N̄ \| q] = 0, and \|c[h]\|² ≤ (2/3)(‖Z‖² + \|⟨q, Z⟩\|²/u)·Ω̂[h]. The best representative is E[Z \| q], and sup over continuous profiles of polynomial growth and over energies of \|c[h]\|²/(δΩ̂[h]) equals θ*(q) = (2/3)(‖E[Z \| q]‖² + \|⟨q, Z⟩\|²/u)/δ (complex profiles in general; real ones suffice in the classes below). In the Hermitian-factor class Z = X(2\|X\|²C − u) and N = X(2B² + 4C − 4\|X\|²C) (higher-degree 4.20) | every cubic for the formula; θ* = 5.000 at y(\|y\|² − 2) (256/63 at h = v), 1.547 at X(\|Y\|² − 1) (**N**). So no bound of the form ‖c[h]‖² ≤ θδΩ̂[h], uniform in the profile and the energy, has θ < 4.99 on all cubics | the replacement rule and the class statement **P** (a GPT session of the user; re-derived by a review worker of claude-b9ee); the formula for θ* **P**, author only (the reviewer); values **N** | SPAIR `PROOFS.md` §§1–3; REV §3.2 |

---------------------------------------------------------------------------------------------------------------------

## 9. Required corrections

1. **Ledger 4.21:** replace "an infinite-dimensional family of genuine cubics" by the sequence q_m (one cubic per m).
2. **Ledger 4.22, and the README section "one heavy coordinate and diffuse bulk":** call it a limit model in the
   heading; state that W is not a coordinate and that the constants do not hold for a finite bulk without an
   N-dependent term (exact failure for N ≤ 11, 6, 2, 1, 1 at the ends of the first five ranges, h(v) = v).
3. **Statuses:** name the author and the reviewer; "replayed by the author" is superseded.
4. **Row numbers:** 6.3.26 is proposed by both packages.
5. **`CERTIFICATES.md` §3:** say that 218 of the 2400 instance checks are nontrivial, or replace them by tests of
   higher degree (`scripts/null_highdeg.py` here).

No correction to a proof or to a constant is required.

## 10. Suggestions (none blocks)

1. State Theorem 8 at the thresholds the application uses: m ≥ 21 for 0.37 and m ≥ 11 for 0.64 (two more interval
   checks; done here with mpmath.iv).
2. Replace the 23 finite checks and the Fisher tail by one inequality valid for all m (m(1 − 𝒜_m) ≤ 1/3, or the
   codex-a786 form J_m ≤ 2/(3m)), which gives 77/(9(m + 3)). Lemma 7 is then not needed.
3. Record the sharp constant θ*(q) of §3.2. It tells in advance what a profile-free proof can reach: m ≥ 18, 9, 2
   on the equal family; ρ ≤ 0.119 … 0.773 in the limit model; nothing at the junta.
4. For the application, drop the uniformity. The representation c[h] = ⟨E[Z | q], q k′(V)⟩ is exact, and for a
   class given by a one-dimensional law (the Hermitian class, the limit model) E[Z | q] is a one-dimensional
   kernel. With the row's own k′ on u ∈ [0.5, 1.25]σ*², ⟨E[Z|q], F⟩²/Ω̂ is an Arb-certifiable number per class
   member and energy cell, and the measured values have a margin of 2–7.
5. A finite-bulk statement should carry the bulk's fourth excess explicitly (δ = 168α⁴ + δ_bulk) and its content;
   the necessary condition from h = v is N ≥ 256/(63θ) for N equal Wick spikes.
6. For unequal spectra, the sign average of Lemma 5 extends (with E[C·sign B | |B|] in place of C): Theorem 4 is a
   factor 3.7–4.5 above θ* on diffuse or sign-balanced spectra.
7. Theorem 9: "circular cubic core" can be "any core independent of W".
8. Document the column order of `results/certificate.json` in `CERTIFICATES.md`.

## 11. Not checked

- No Lean. The row thresholds 0.37 … 3.7 and the room numbers of 4.17/4.19 are taken as given (**N**, another author).
- 6.3.23 itself was not re-derived (it has its own review); it was only re-tested inside the classes.
- The supremum of θ* over all Hermitian A; spectra other than the equal family (m ≤ 30), nineteen two-eigenvalue
  spectra and one nine-eigenvalue spectrum (Monte Carlo, 6·10⁶ samples).
- Bulks other than (26); any rate in N.
- python-flint 0.9.0 (the author's version): the replay used 0.8.0, with byte-identical output.
- `build_certificate.py` and `variational_probe.py` were read, not run (the proof does not use them).
- The profile tables below s ≈ 0.02 (energies below about 0.02σ*²) are not resolved, and the profiles are held
  constant beyond s = 6; the theorems apply to the tabulated functions, the true profiles there are not tested.
- The Monte Carlo estimates of θ* are lower bounds biased down by heavy tails (1–13 %); the values quoted are from
  deterministic quadrature.
- The codex-a786 package was not reviewed.
- Clean-up: `review/data/rows_ratio_quick.json`, `review/logs/rows_ratio_quick.log` (a first run with two energies,
  superseded) and `review/scripts/__pycache__/` are still there; the removal command was refused by the permission
  system and I did not retry.

## 12. Files

All under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-signed-pairing-2026-11-16/review/`.

| file | content |
|---|---|
| `package-copy/` | the copy in which `verify_gamma_exact.mjs` and `verify_exact.mjs` were run (manifest 20/20, `logs/manifest_check.log`) |
| `logs/verify_gamma_exact.log`, `logs/verify_exact.log`, `logs/flint_replay_big.log`, `data/gamma_intervals_big_replay.json` | the three replays |
| `scripts/cert_check.py`, `logs/cert_check.log`, `data/cert_cells_review.json` | my exact checker of the certificate; per-cell endpoint norms |
| `scripts/null_highdeg.py`, `logs/null_highdeg.log` | exact null identities, all 400 controls, degree ≤ 99 |
| `scripts/gamma_check.py`, `logs/gamma_check.log` | interval re-check, tails, J_m, the thresholds 0.37 and 0.64, m(1 − 𝒜_m) < 1/3 |
| `scripts/moments_sympy.py`, `logs/moments_sympy.log` | symbolic identities for general eigenvalues |
| `scripts/siglib.py` | kernels on \|q\| for the Hermitian class and the limit model; profiles and the transform k |
| `scripts/herm_sharp.py`, `equal_sharp_scan.py`, `lemma5_check.py`, `thm9_check.py` and their logs | sharp constants, Lemma 3, Lemma 5, Theorem 9 |
| `scripts/rows_ratio.py`, `small_energy.py`, `limit_ends.py`, `mc_unequal.py`; `logs/rows_ratio.log`, `logs/rows_ratio_by_energy.log`, `logs/tables_for_review.md` | the ratios on the six rows |
| `scripts/limit_sharp.py`, `kernel_pointwise.py`, `robust_sharp.py` and their logs | θ*(ρ), the junta, robustness |
| `scripts/finite_bulk_linear.py`, `logs/finite_bulk_linear.log` | the exact finite-bulk test |
| `scripts/own_profile_check.py`, `logs/own_profile_check.log` | the low-energy ratios with my own profiles (no table); θ* over two-eigenvalue spectra |

Re-run (laptop, one at a time), with R = the `review/` folder above and C5 = the `content5` folder of §6:

    node $R/package-copy/scripts/verify_gamma_exact.mjs;  node $R/package-copy/scripts/verify_exact.mjs
    python3 -I $R/scripts/cert_check.py $R/package-copy/results/certificate.json $R/data/cert_cells_review.json
    python3 -I $R/scripts/null_highdeg.py;  python3 -I $R/scripts/gamma_check.py;  python3 -I $R/scripts/moments_sympy.py
    python3 -I $R/scripts/herm_sharp.py $R/scripts $R/data/herm_sharp.json
    python3 -I $R/scripts/rows_ratio.py $R/scripts $C5 $R/package-copy/rows.json $R/data/rows_ratio.json
    python3 -I $R/scripts/limit_sharp.py $R/scripts $R/data/cert_cells_review.json $R/data/limit_sharp.json
    python3 -I $R/scripts/finite_bulk_linear.py
