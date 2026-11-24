# The degree-5 game for K_G^ℂ ≥ 1.402: what is still needed

25 November 2026. Prepared by a research worker (sub-agent) of a Claude session, from the record at master
`c5d6c8f2b`: `research/higher-degree/STATUS.md` (§4, §5), its `sources/` and
`code/`, the working folders named in `research/higher-degree/INVENTORY.md`, and
`research/conjecture-K/STATUS.md`. 

Labels as in `research/README.md`: **P**, **C**, **N**, **R**, open. "Ledger
4.x" is a row of the higher-degree ledger; "K 7.4.16" a row of the Conjecture K ledger. Numbers marked **N (this
note)** were computed for this note by the scripts in
`research/higher-degree/code/degree5-attack/checks/` (floating point, one author, not
reviewed).

**Two findings of this note that the ledger does not state** (details in §3.2 and §6):

1. The allowances θ_room of ledger 4.29–4.32 use the *pointwise* (zero-amplitude) A/B margin μ. A secant inequality
   with a constant margin, which is what the factorisation "gain ≤ content²/(4μ)" needs as written, holds only with
   a margin of about 0.60–0.66 of that value on the rows 0.79–0.82 (**N, this note**: 0.210 against 0.351 on the row
   0.79; 0.229 against 0.367 on 0.80; 0.265 against 0.400 on 0.82). CONT5 §4.1 has the same effect at two rows
   (0.31 against 0.431 at t = 0.84) and calls the pointwise value "not yet a secant"; the ledger rows 4.19, 4.29 and
   4.31 say "with the pointwise A/B margin", but the factors of 4.32 (1.30 at t = 0.70) are measured against the
   pointwise allowances. If the allowances scale with the margin, a constant-margin secant puts the allowance of the
   piece t = 0.70 at about 0.13, below the largest ratio found there (0.165). A refined inequality
   m ≥ (μ₀ − b|ρ|)|ρ|² with b ≈ 0.4–0.5 fits the numerics (§3.2) and would cost only an estimated 5–20 % of the
   margin for drivers of the size that occurs; it has no proof. So the form of the secant inequality is on the
   critical path, not a routine certificate.
2. The record has no written proof that the group statements (content lemmas, pure-cost statements, allowances)
   assemble to K₅. The design note gives the scheme (S1)–(S5) and CONT5 §1 the assembly for the A/B part; the
   cross-group couplings and the treatment of the e₃₂ component ν of G₅ (the content profiles are computed at the
   row's own ν₅ only) are measured, not proved.

---

## 1. The target

**The game.** On ℂⁿ with the standard complex Gaussian measure (E|z_j|² = 1), let P_{m,n} be the orthogonal
projection of L² onto the Wick chaos of bidegree (m, n). The game is

    T = P₁,₀ − (39/50)·P₂,₁ + (779/10000)·P₃,₂,          λ = (1, −39/50, 779/10000)   (ε₁ = 39/50, η = 779/10000).

**The inequality.** For measurable f, g : ℂⁿ → {|w| = 1} put V(f, g) = Re⟨f, T g⟩ = Re E[conj(f)·(Tg)]. The target
is

    V(f, g) ≤ 500/701 = 0.713266762…        for every n and every unimodular pair (f, g).

**Why it gives 1.402.** K_G^ℂ ≥ 1/N(λ) with N(λ) = sup_{n, f, g} V(f, g): the vector-valued value of the game tends
to 1 (g = z/‖z‖ has ‖Tg − g‖ ≤ 2/√n, since T fixes the first chaos and ‖T‖₂→₂ = 1), so the game is a lower-bound
witness in the sense of the Lean theorem `transfer_lower` (design note R0; the one-line value half for T₅ is not in
Lean). Hence N(λ) ≤ 500/701 gives K_G^ℂ ≥ 701/500 = 1.402. The Lean bound today is 1.40191 < K_G^ℂ.

**The margin.** Model value N ≈ 0.7128653 (1/N = 1.402785; ledger 1.10), attained by a "driver pair" at t ≈ 0.85.
500/701 − N ≈ 4.0·10⁻⁴. This game cannot give 1.403: 1/0.7128653 < 1.403 (ledger 4.16).

**The parameter t.** h = (f + g)/2, k = (f − g)/2, and t = ‖P₁,₀h‖₂ ∈ [0, √π/2]. After a rotation, P₁,₀h = t·z₁
(z₁ the "visible" coordinate). The certificate is a cover of [0, 0.886227] ⊃ [0, √π/2] by pieces.

---

## 2. The conditional certificate of ledger 4.17

**The row inequality (P, author only; design note R1–R2, CERT1 §1).** For real ℓ, β, b_A, b_B, with G₃ = ε₁P₂,₁k,
G₅ = ηP₃,₂h, q = the part of G₃ that does not depend on z₁ (q ∈ H₂,₁ of the remote coordinates), and
C = b_A·q·e₁₁(z₁) + b_B·q̄·e₂₀(z₁):

    V ≤ t² − 2ℓt + 2β²/ε₁ + (b_A² + b_B²)‖q‖²/η + Λ₅(G₃, G₅),
    Λ₅ = E|L + G₅ + G₃ − C| + E|L + G₅ − G₃ + C| − ‖G₃‖²/ε₁ − ‖G₅‖²/η,       L = z₁(ℓ + β(|z₁|² − 2)).

**The hypothesis K₅(η₅) of a row.** For all n, all G₃ ∈ H₂,₁(ℂⁿ), G₅ ∈ H₃,₂(ℂⁿ) with remote residual q:

    Λ₅(G₃, G₅) ≤ sup_{ν ∈ ℝ} [E Ψ₅(|q|; ν) − ν²/η] − ‖q‖²/ε₁ + η₅,
    Ψ₅(s; ν) = E_z|L + ν·e₃₂ + s·D| + E_z|L + ν·e₃₂ − s·D|,      D = 1 − b_A·e₁₁ − b_B·e₂₀.

It says that the "q-only points" G₃ = q, G₅ = ν·e₃₂ dominate up to η₅. (The retained variant Λ̂₅ ≤ Λ₅ of CONT5 §3.1,
which keeps −‖P₁,₀k‖² through an extra minimisation, may replace Λ₅.)

**The law layer (C, author only).** With κ = 1/ε₁ − (b_A² + b_B²)/η, σ = ‖q‖, U = |q|²/σ²:
V ≤ t² − 2ℓt + C_r + η₅(r), C_r = 2β²/ε₁ + G⁺_r, where G⁺_r bounds sup over σ ≥ 0, ν ∈ ℝ and every law of U in the
class: E U = 1, m = E U² ∈ [2, 44], E U³ ≤ 9m − 12 + (4045313/100000)(m − 2)^{3/2} (Lean), E√U ≤ 95133/100000
(K 3.7), and on five rows the scalar Stein family of the radius proof (P, manuscript status).

**The pieces** (recomputed for this note from the exact row constants of `cert2b/out/rows2b.json`: the envelope is
0.7128940126 at t = 0.847596 and every room below agrees with `assemble2b.log`; **N, this note**, exact rationals
evaluated in floating point):

| piece of t | covered by | hypothesis | room (500/701 − max on the piece) |
|---|---|---|---|
| [0, 0.0637] | direct bound V ≤ (2/5)t² + 7058083/10⁷ (ledger 4.18 (b)) | none | 5.83·10⁻³ |
| [0.0637, 0.1148] | law row 0.125 (Stein cover) | K₅ | 5.83·10⁻³ |
| [0.1148, 0.1464] | law row 0.15 (Stein) | K₅ | 9.92·10⁻³ |
| [0.1464, 0.2335] | law row 0.2 (Stein) | K₅ | 1.22·10⁻² |
| [0.2335, 0.2920] | law row 0.25 (Stein) | K₅ | 1.82·10⁻² |
| [0.2920, 0.4098] | law row 0.3 (Stein) | K₅ | 2.08·10⁻² |
| [0.4098, 0.4585] | law row 0.4 | K₅ | 2.01·10⁻² |
| [0.4585, 0.5272] | law row 0.5 | K₅ | 2.01·10⁻² |
| [0.5272, 0.5686] | law row 0.55 | K₅ | 1.88·10⁻² |
| [0.5686, 0.6470] | law row 0.6 | K₅ | 1.13·10⁻² |
| [0.6470, 0.6715] | tuned row 0.70 | K₅ | 9.60·10⁻³ |
| [0.6715, 0.6989] | tuned row 0.72 | K₅ | 7.72·10⁻³ |
| [0.6989, 0.7256] | tuned row 0.74 | K₅ | 5.90·10⁻³ |
| [0.7256, 0.7520] | tuned row 0.76 | K₅ | 4.20·10⁻³ |
| [0.7520, 0.7721] | tuned row 0.78 | K₅ | 3.17·10⁻³ |
| [0.7721, 0.7851] | tuned row 0.79 | K₅ | 2.47·10⁻³ |
| [0.7851, 0.7988] | tuned row 0.80 | K₅ | 1.79·10⁻³ |
| [0.7988, 0.8119] | tuned row 0.81 | K₅ | 1.22·10⁻³ |
| [0.8119, 0.8248] | tuned row 0.82 | K₅ | 7.38·10⁻⁴ |
| [0.8248, 0.8348] | tuned row 0.83 | K₅ | 4.74·10⁻⁴ |
| [0.8348, 0.8423] | tuned row 0.84 | K₅ | 4.00·10⁻⁴ |
| [0.8423, 0.8476] | tuned row 0.845 | K₅ | **3.73·10⁻⁴** |
| [0.8476, 0.8523] | tuned row 0.85 | K₅ | **3.73·10⁻⁴** |
| [0.8523, 0.8574] | tuned row 0.855 | K₅ | 3.84·10⁻⁴ |
| [0.8574, 0.8630] | tuned row 0.86 | K₅ | 4.38·10⁻⁴ |
| [0.8630, 0.8667] | tuned row 0.865 | K₅ | 5.39·10⁻⁴ |
| [0.8667, 0.8724] | tuned row 0.87 | K₅ | 6.37·10⁻⁴ |
| [0.8724, 0.8786] | tuned row 0.875 | K₅ | 8.44·10⁻⁴ |
| [0.8786, 0.8841] | tuned row 0.88 | K₅ | 1.11·10⁻³ |
| [0.8841, 0.8862] | tuned row 0.886 | K₅ | 1.39·10⁻³ |

- **Kinds of rows.** A *law row* (t ≤ 0.6) has its parameters optimised against the law-layer value; a *tuned row*
  (t ≥ 0.70) is the Gaussian-optimal row of one t. Every tuned row of 4.17 is active just below its own t, so it is
  already a mild *cover*. A *covering row* in the sense of ledger 4.31 is a tuned row used 0.02–0.10 below its
  tuning point; no certificate with such covers has been computed (the rooms of 4.31 are float).
- **Since 4.17 was computed**, the direct bound of ledger 4.18 (a) reaches t ≤ 0.2508 with no hypothesis (**P + C**):
  V ≤ (9221/10000)t² + 0.655227 from E|q| ≤ (2287/2500)‖q‖₂. So K₅ is needed on (0.2508, 0.8862] only.
- **External inputs other than K₅:** the radius 95133/100000 (K 3.7, P + C), the scalar Stein family (P, manuscript
  `real-stein-radius.tex`, the same status), and the assumption that libm's arcsin is accurate to 4 ulp (Stein
  covers and 4.18 (b)). The row inequality and the law-layer lemmas are P, author only.
- **Status:** C, author only. The replay re-runs the author's own `psi5` code; the independent checks of that code
  are a closed form at s = 0 and mpmath at four nodes (CERT1 §2).

---

## 3. What K₅ still needs, piece by piece

The split of K₅ into provable statements is a design (design note §1, CAPG §6), measured on one-spike families in
an "exact coupled model" (ledger 4.16). Its items, with CAPG §6 numbering in brackets. Classes: **(i)** plausible,
needs a proof or a certified computation; **(ii)** the record shows violations or a growth that makes the statement
doubtful as posed; **(iii)** pure computation.

### 3.1 Tuned rows, t ∈ [t_s, 0.886] (t_s = 0.647 in 4.17)

| item | statement | ledger | proved | numerics | class |
|---|---|---|---|---|---|
| A [2] | **Order-1 (A/B) content lemma.** G_AB(q) ≤ κ_AB·(D(q) + V_sl(u)) + η_AB, κ_AB + κ_h ≤ 1. Sufficient form: the content law ‖Π₁[q·h(\|q\|²)]‖² ≤ θ_room(u)·δ·Ω̂[h] for both tilted profiles of the row, every remote cubic that is a possible response, u in the band of the row | 4.19, 4.28–4.32 | on classes without self-interaction, for all profiles and energies (4.20–4.22, 4.27; P, P + C); a one-heavy-coordinate limit model (4.23) | §3.2 below | **(ii)** on the pieces below 0.80 as posed; **(i)** on t ≥ 0.84 |
| B [6] | **Global A/B secant margin** (the degree-5 analogue of the premise (P) of K 7.4.10/7.4.16), tilted | 4.19, §5 "t ≥ 0.86" and "other pieces" | the reduction "secant ⇒ gain ≤ content²/(4μ)" (CONT5 §3.2, P, author only) | pointwise μ = 0.351–0.446; with a constant margin the secant holds only up to 0.210–0.318 (N, this note; §3.2) | **(i)**, and the form matters (finding 1) |
| C [3] | **Quintic shells (orders 2 and 4).** Their gain ≤ κ_h·(D + V_sl); with the χ-dependent split of 4.34, κ_h(χ) falling from 0.11 to 0.015 | 4.10, 4.16, 4.34 | the reductions (P, author only); "two contraction inequalities" open (SHARE §3) | exact one-spike model: ≤ 0.11 per group, ≤ 0.16 together; decoupled chain ≤ 0.18. Not measured on two-variable or cluster families | **(i)** (constant κ_h ≤ 0.18); the χ-dependent form is unmeasured off the one-spike path |
| D [4] | **Odd sector z·Q, z̄·P: zero-core scalar** ε₁E_z[\|z\|/\|g(\|z\|²)\|] < 1, pointwise ratio(s) ≤ ratio(0), finite amplitude | 4.16 | P at s = 0 (closed form) | 0.994 (0.81), 0.977 (0.82), 0.926 (0.85), 0.869 (0.886); reproduced (N, this note) | **(iii)** on rows tuned at t′ ≥ 0.81 |
| E [5] | **Gaussian-core odd allowance** on rows tuned at t′ ≤ 0.80 (scalar 1.012–1.206 there; 1.030 at 0.79) | 4.16 | — | ≤ 3.1·10⁻³ at 0.70 (a third of the room there), 1.1·10⁻⁴ at 0.78, 2.8·10⁻⁶ at 0.80 | **(iii)**; with covers tuned at t′ ≥ 0.81 it is not needed; for the covers 0.79 and 0.80 it lies between those values at the row's own energy and was not computed at the energies of a cover |
| F [7] | **Quintic first-order sectors are pure cost** by the elementary majorant | 4.16 | the majorant \|a + g\| ≤ \|a\| + Re(ḡ·ph a) + \|g\|²/(2\|a\|) (P) | λ_max/p₂ ≤ 0.241 on every row; reproduced (N, this note) | **(iii)** |
| G [8] | **Second-order-only sectors and cross-group couplings** | 4.4, 4.16 | — | ratios ≤ 0.11 after rescaling; couplings change the gain by ≤ 2 % (GATE §2) | **(iii)** + a short P; part of the missing assembly (finding 2) |
| H [9] | Spike layer | 4.13, 4.16 | — | absorbed: θ ≤ 0 on every row 0.70–0.886 in the exact coupled one-spike model | nothing to do if A and C hold |
| I [1] | (S1)–(S2): pointwise expansion and averaging over the remote variables; **the assembly of A–H into K₅**, including the e₃₂ component ν (real and imaginary) of G₅ | 4.1 (R for degree 5) | CONT5 §1 for the A/B part given κ_h; CERT1 §1: imaginary ν "left to the sector layer" (M ≤ 1.025 against 1/η = 3.549 at the uncapped game, N) | — | **(i)**: a written proof is missing |

### 3.2 The content lemma in detail (items A and B)

**What is posed** (PV3; ledger 4.29, 4.31). For each piece, a tuned row r (own or covering), its tilted profiles
h_A, h_B (tables in `code/degree5-content/`), a band of energies, and the allowance θ_room(u): the largest θ for
which the proved bound (F) of CONT5 §3.4 and the hypothesis "‖c_X[h]‖² ≤ θ·δ·Ω̂_X" keep the row inside its room in a
convex program over laws. θ_room is sufficient, not necessary.

**Numerics (ledger 4.28, 4.31, 4.32; N).**

| piece | row used | band minimum of θ_room | largest ratio found (possible responses) | factor |
|---|---|---|---|---|
| 0.84–0.855 | own | 1.44–4.1 | 0.42–0.52 (three clusters, n ≤ 25) | 3.8–12 |
| 0.82 | own | 0.66 (published) | 0.30 (n = 13) | 2.2 |
| 0.80 | own | 0.36 (published), 0.4025 (reviewed) | 0.250 at u\* (n = 25) | 1.44–1.6 |
| 0.80 | cover 0.82 | 0.721 | 0.236 (six-variable maximiser, re-evaluated) | 3.05 |
| 0.78 | cover 0.82 | 0.523 | 0.242 | 2.17 |
| 0.76 | cover 0.81 | 0.400 | 0.217 | 1.85 |
| 0.74 | cover 0.80 | 0.314 | 0.196 | 1.60 |
| 0.72 | cover 0.79 | 0.259 | 0.175 | 1.44 (smallest over energies) |
| 0.70 | cover 0.79 | 0.219 | 0.165 | 1.30 (smallest over energies, at 1.449u\*) |
| 0.68, 0.66 | covers 0.78, 0.76 | 0.186, 0.154 | not searched | — |
| 0.74, 0.72, 0.70 | own rows | 0.160, 0.114, 0.085 | 0.171, 0.148, 0.131 | 0.94, 0.77, 0.65: **violated** |
| [0.647, 0.6715] of 4.17 | row 0.70 as published | 0.080 | 0.0802 | 1.00: **no margin** |

Reproduced for this note (N): the junta values of PV3 §5 on the row 0.80 to four digits; the example of PV3 §6
(0.01540, 0.06732, 0.2287); on the cover of t = 0.70 at 1.612u\*, the stored three-cluster cubic with c = 4 gives
0.1594 by the formula and 0.1609 [0.1606, 0.1611] directly in 13 variables, a possible response, against the
allowance 0.2190 (the record: 0.1601 and 0.1609).

**What makes it doubtful as posed.**
- The largest ratio found grows with the number of variables up to n = 25 and the data end at n = 31 (4.28). No
  class theorem contains the maximisers (junta + driver with clustered cofactor + bulk on the cofactor's own
  variables).
- On the rows tuned at t itself the sufficient form is violated for t ≤ 0.74, and on the published pieces of 4.17
  it has no margin at the low end. So **the certificate of 4.17 as computed cannot be closed through θ_room**; the
  redesign with covers (4.31) is needed, and its rooms are float.
- **The margin μ (finding 1; N, this note).** With the tilt (0.4, 0.3) and C_{s,t} the cost form of CONT5 §3.1, let
  m(w, ρ) = ρ\*C_{s,t}ρ − Rem(w, ρ). Its infimum of m/|ρ|² over all amplitudes, by row:

  | row tuned at | pointwise μ (s = 0; the value in the kit files) | inf over all (w, ρ) | ratio | attained near |
  |---|---|---|---|---|
  | 0.79 | 0.351 | ≤ 0.210 | 0.60 | \|w\| = 0.75, \|ρ\| ≈ 0.4, ρ_A ≈ 1.1ρ_B real positive |
  | 0.80 | 0.367 | ≤ 0.229 | 0.62 | \|w\| = 0.72 |
  | 0.81 | 0.384 | ≤ 0.247 | 0.64 | \|w\| = 0.75 |
  | 0.82 | 0.400 | ≤ 0.265 | 0.66 | \|w\| = 0.74 |
  | 0.84 | 0.431 | ≤ 0.301 | 0.70 | \|w\| = 0.77 |
  | 0.85 | 0.446 | ≤ 0.318 | 0.71 | \|w\| = 0.76 |

  (Searches give upper bounds of the infimum. Quadrature checked on two grids; the second-order form reproduces
  the kit's μ.) The loss sits at |w| ≥ 0.5 and grows linearly with the driver amplitude: on the row 0.79 the minimum
  of m/|ρ|² over directions at |w| = 1 is 0.350, 0.333, 0.311, 0.290, 0.278 at |ρ| = 0.03, 0.06, 0.10, 0.15, 0.20,
  and for |w| ≤ 0.5, |ρ| ≤ 0.3 there is no loss at all (table in problem P2). On the grids computed,
  m ≥ (μ₀ − b|ρ|)|ρ|² needs b ≥ 0.465 (row 0.79) and 0.387 (row 0.82). An optimal driver is a Gaussian linear form
  of variance V ≈ ‖c‖²/(4μ²) ≈ 10⁻³–10⁻², for which E|r|³ ≤ √2·V^{3/2}; with b = 1/2 the effective margin would be
  μ₀ − √2·b·√V, a loss of 0.02–0.07 out of 0.35–0.45 (an estimate of this note, not a computation of allowances).
  This is the same phenomenon as at degree 3, where (P) carries the quartic term (|w|²/2 + S_r)S_r (K 7.4.10).
  At degree 3 that term costs 2uV + 2V² through the shared moments E[|q|²S_r] ≤ 4uV, E[S_r²] ≤ 2V²; at the energies
  of the low pieces (u = 0.13–0.16) the same device would cost 0.26–0.32 per unit shell energy, most of the
  margin, so the degree-3 form does not transfer unchanged.

**What the record proposes.** (a) covering rows (4.31); (b) the χ-dependent split (4.34), which needs item C in a
χ-dependent form; (c) the game (1, −0.77, 0.05), +12 % on every allowance, margin 3.03·10⁻⁴ (4.33); (d) a bound that
uses the row profile and the energy band, in every dimension: none exists. On t = 0.84–0.855 a certified majorant
of the projected bounds (I)/(II) of PV3 §1 by the law functional Ω̂ would suffice (factors 1.7–6.0 on test cubics);
on t = 0.80 those bounds exceed the allowance on test cubics, so there the content itself must be bounded more
sharply (4.28 (a)).

**What would close it.** Either a proof of the content law with the allowances of the covers (problem P1, with its
special case P5), together with a secant inequality that delivers nearly the pointwise μ (P2); or a way around the
low pieces: an argument that needs no K₅ up to t ≈ 0.80 (problem P3 covers (0.25, 0.65]; nothing in the record
reaches further), so that the content lemma is needed only where its factor is 3 or more.

### 3.3 Rows tuned at t ≥ 0.86

With (S) (the transfer of K 11.49), (F), the Stein law layer, the caps and the pointwise μ, the lemma closes in its
allowance form: 39 % of the room at 0.86, 6 % at 0.865, nothing above (ledger 4.19 (iii); N; the excesses are upper
bounds, 4.29). With the conservative margin μ = 0.359 at 0.86 it is at 104 % of its room. Class **(iii)** given B:
certified constants for (S) (a 2-D resolvent enclosure per row; the regularity of Γ "not checked: open, routine",
CONT5 §3.3), for the law layer with the F terms (SOCP duals as in K 11.50), and the secant margin.

### 3.4 The law rows, t ∈ (0.2508, t_s)

- **Statement needed:** V ≤ 500/701 for unimodular pairs with t in this range. In 4.17 it is K₅ on the law rows
  0.25–0.6 (rooms 1.1–2.1·10⁻²; with spectral Stein cuts and the radius 0.93, margins 2.4–4.4·10⁻² at the rows' own
  t, N, `degree5-spec-2026-11-17/PROGRESS.md`).
- **Proved:** no K₅ up to t = 0.2508 (4.18 (a), P + C); 0.2527 with the radius 4571/5000 (P, author only + C).
- **Numerics:** the sector tools fail there: A/B ratio 1.05–2.5 at s = 0 on t = 0.2–0.6, odd zero core 1.28–3.1,
  odd allowance 77–162 % of the old rooms at t = 0.1–0.3 (CAPG §5 (c)). Law-only direct bounds stop at t = 0.198
  (scalar Stein family, radius 0.93) or 0.228 (spectral cuts and the mass coupling) (4.35, N): "beyond t ≈ 0.25 a
  direct argument needs phase or joint information between z₁ and the cubic".
- **Class (ii) as posed** (K₅ through pure-cost premises is false in form there); the underlying statement is very
  likely true with large room: explicit pairs f = ph(z + cW), g = ph(z − cW) give V = 0.628, 0.655, 0.671, 0.687 at
  t = 0.26, 0.45, 0.54, 0.63 (**N, this note**), and the law rows evaluated with a Gaussian cubic give
  0.637–0.688 (CERT2 §3), against 0.7133.
- **What would close it:** a new argument (CAPG §6 item 10 lists three candidate routes); problem P3. One
  reduction found for this note (**P** for the inequality, **N** for the numbers): dropping three negative terms
  gives V ≤ (1 − η)t² + η + (ε₁ − η)‖P₂,₁k‖², so the piece follows from a cap on the cubic energy of k as a function
  of t. The value π/4 − t² of that cap (exact for a Gaussian cubic independent of z₁, by the response inequality
  (R1) of CONT5 §8.2) would suffice up to t ≈ 0.61; the Jensen form of (R1), valid for every cubic independent of
  z₁, is too weak at every t of the range (0.883 against the needed 0.823 at t = 0.25). So the missing statement is
  a t-dependent radius bound between the two.

### 3.5 The certificate itself

- **Independent replay of 4.17** (ledger §5 item 1): class (iii); problem P4.
- **Recomputation for the final design** (ledger §5, "a certificate built around the covers"): covers used
  0.06–0.09 below their tuning point with Stein covers for their law gaps, the radius 2287/2500 or its s-dependent
  form in the law layer, the chosen game. About 65 CPU-hours for a full run (NEWCAP (e)); class (iii), but it
  depends on the decisions about items A, B, C (which covers, which split, which game).

---

## 4. Dependencies

```
                         V ≤ 500/701 for all pairs  ⇒  K_G^ℂ ≥ 1.402
                                        │
        ┌───────────────────────────────┼───────────────────────────────────┐
   t ∈ [0, 0.2508]              t ∈ (0.2508, t_s)                     t ∈ [t_s, 0.886]
   direct bound 4.18 (a)        NEW ARGUMENT (P3)                     conditional certificate (rows, law layer)
   P + C, done                  or K₅ on law rows (false in form)       │  replay (P4) + recomputation with covers
                                                                        │
                                                              K₅ on every tuned/covering row
                                                                        │
     ┌──────────────┬───────────────┬──────────────┬───────────────┬───┴───────────┬──────────────┐
     A content      B secant        C quintic      D/E odd sector  F quintic       G couplings    I assembly
     lemma (P1,P5)  margin (P2)     shells         (P6)            first order(P6) (P6)           (proof missing)
     └── needs B's margin and C's κ_h in its allowance ──┘
```

- **Blocks 1.402:** every box of the diagram. A and B are coupled: the allowance of A is proportional to the margin
  B delivers and to 1 − κ_h − (losses), which C delivers.
- **Alternatives to each other.**
  - For the low pieces t ∈ [t_s, 0.80): the content lemma on covering rows (A with factors 1.3–2.2) *or* a
    K₅-free argument reaching t ≈ 0.80 (an extension of P3 that nothing in the record supports yet). The switch
    point t_s is a design choice between them; tuned rows below t′ = 0.70 lose the untilted A/B premise (4.31).
  - For the A/B lemma at spiky laws: the same-law content lemma *or* the per-coordinate sign certificate (SC) of the
    spike layer for dominant coordinates plus the lemma for the low-influence remainder (CAPG §6 item 9; 30–60
    CPU-hours).
  - For the game: (1, −39/50, 779/10000) *or* (1, −0.77, 0.05) (+12 % allowance, margin 3.03·10⁻⁴; its direct
    bound reaches t = 0.261 in float). The cap-optimal game (1, −81/100, 33/200) halves the allowances (4.33).
  - On t = 0.84–0.855: a majorant of (I) or (II) by Ω̂ *or* the general content law.
- **Matters only for 1.403 (not for 1.402):** the uncapped game (1, −0.84896, 0.28180) and its items: the spike
  channel 7–9·10⁻⁵ and its telescoping certificate (4.13), the sharing lemma (4.10), the thin H₁,₁ margin (3–4.5 %,
  4.4), the clipped-payoff terms of its t = 0 row (4.12, 4.18 (a): the formula gives 0.7414 at t = 0 there), an η₅ of
  at most 3·10⁻⁴ (4.8: NO-GO at design time). The radii 0.9148/0.9142 clear only the necessary t = 0 test
  λ₁ρ\*² ≤ 500/701 for it.
- **Matters only for 1.404:** ledger 4.36–4.38 and §5 item 3 (degree 9).
- **Not needed if A and C hold:** the spike layer H.

### The critical path

1. **Fix the design:** game, covers, split; recompute the conditional certificate with covers and the radius
   2287/2500, and have it replayed by someone else (P4). Computation, about 65 CPU-hours plus the replay.
2. **The secant inequality in a form that keeps the pointwise margin** (P2). Certified cover; decides the allowances.
3. **The content law on every tuned/covering row with those allowances** (P1; P5 is its three-cluster case).
4. **The mid-t argument on (0.2508, t_s)** (P3).
5. **The remaining sector statements and the written assembly of K₅** (C, D–G, I; P6 covers D–G).

**The hardest item is 3**, on the pieces below 0.80. Reasons: the factor between allowance and the largest ratio
found is 1.3–2.2 before any loss in the margin; the ratio grows with the dimension through a mechanism (a bulk on
the cofactor's variables, positively correlated with the cofactor) that no proved class reaches; the two proved
representations of the content exceed the allowance on the row 0.80; the allowance is itself a float output of a
relaxation; and every candidate route found so far (relaxation over cofactor laws, splits, δ^{3/2} bounds,
compression) is refuted or useless (PV3 §4). Item 4 is a new research problem of unknown difficulty, but it has
room 2.5·10⁻² to 8·10⁻² (60 to 200 times the room of the binding rows) and can be attacked with crude tools. Item 2
is a large but well-understood computation of the kind K 7.4.16 already carried out.

---

## 5. What changed since the ledger rows were written

**(a) The radius: E|q| ≤ 0.9148‖q‖₂ (P + C), 0.9142 (P, author only + C), and the near-Gaussian form
E|q| ≤ (√π/2)(1 + (26449/5000000)·s)‖q‖₂, s = χ (K 3.7, KNG505).**
- Done in the ledger: the direct bound to t ≤ 0.2508 (4.18 (a)); the necessary t = 0 test for caps up to 0.8523.
- Not yet used: the law layer of 4.17 still has 95133/100000. With an s-dependent radius and spectral Stein cuts
  the law gaps of the tuned rows shrink to 6.8·10⁻⁴ (0.70), 6.6·10⁻⁵ (0.74) and vanish for t′ ≥ 0.76 (N, radius 0.93,
  `degree5-spec-2026-11-17/PROGRESS.md`); the rooms of the own rows at low t grow by 4.7·10⁻³ (0.70) to 6·10⁻⁴ (0.78),
  so their allowances rise; the best covers change by a few per cent. Item 1 of the critical path should use it.
  At the binding rows the certified law gap is already small (1.7·10⁻⁵ at the row 0.85: certified row minus its
  Gaussian value), so the peak room gains at most that.
- The linear-in-s radius is a new law input of content type near the Gaussian: for χ ≤ 1 it puts E|q| within
  0.53 % of the Gaussian value. The low-χ cells of the law-layer program for item A (where the binding laws of the
  relaxation are "phantom" laws with a nearly constant modulus) should be re-run with it.
- It does not move the mid-t obstruction: at t > 0.25 the law-only bound is limited by the dropped relation
  Re(h·k̄) = 0, not by the radius (SMALLT §0).

**(b) The global premise (P) at degree 3 by a certified cover (K 7.4.16, P + C, replayed).**
- Item B at degree 5 is the same object: Rem(w, ρ_A, ρ_B) with base L′ = z(ℓ + β(|z|² − 2)) + ν₅e₃₂ and direction
  (e₁₁ + s)ρ_A + e₂₀ρ̄_B + tρ_B, against h = (T − 2/5)A + c₁B + z₁²B̄/√2 at degree 3. The gauge reduction (w ≥ 0,
  Im ρ_A ≥ 0), the exteriors, the origin profile, the ray-convexity shells and the 4-D weighted Cauchy–Schwarz bulk
  cover transfer. Differences: the multiplier D(z) on w (w enters as w(1 − b_A e₁₁) − b_B w̄e₂₀, so the shifted polar
  coordinate L + w = re^{iθ} is no longer a pure shift); the quintic term ν₅e₃₂ in the radial map; one certificate
  per row (11 covering and band rows), each of the size of 7.4.16 (about 1.2·10⁶ boxes there).
- It also shows what form to certify: 7.4.10 needed a quartic term because the pointwise cost falls below the
  zero-core eigenvalue at finite amplitude. The same happens here (§3.2), with a larger relative loss.

**(c) The sharp joint secant inequality (K 7.5.12, Theorem 1; P + C, replayed).** For L ≥ 1, Y ≠ 0, K, O ∈ ℂ:
|Y + K + O| + |Y + K − O| − 2|Y| − 2Re(K·conj(ph Y)) ≤ (1/|Y|)(L·u_K² + v_K² + (L/(2L − 1))·u_O² + v_O²), with u, v
the components along and across Y. It is a statement about three complex numbers, so it applies verbatim at
degree 5 with Y the base, K the even (h-side) and O the odd (k-side) perturbation.
- Item D (the odd pair z·Q + z̄·P at finite amplitude). Since A₋(z) = −A₊(−z) and the odd directions are odd in z,
  the odd increment is E_z[|A₊ + O| + |A₊ − O| − 2|A₊|], and the theorem with K = 0, L → ∞ bounds it at every
  amplitude by the quadratic form E_z[(u_O²/2 + v_O²)/|A₊|]. **N, this note:** the largest eigenvalue of that form
  over the cost equals the zero-core scalar at s = 0 and has maximum over s 0.9916, 0.983, 0.974, 0.965, 0.956,
  0.947, 0.939 on the rows 0.855, …, 0.886, and 1.076, 1.057, 1.038, 1.019, 1.010, 1.001 on the rows 0.81, …, 0.85
  (near s = 0.5). So on the rows from 0.855 up the finite-amplitude odd statement reduces to a one-parameter family
  of 4×4 matrix bounds; on 0.81–0.85 a window of s around 0.5 still needs a cover. It does not remove the
  Gaussian-core allowance of item E.
- Items F and G: for even perturbations alone the theorem at L = 1 is the elementary majorant. **N, this note:**
  that majorant, taken over all twelve h-side visible factors e_{a,b} (a ≤ 3, b ≤ 2) at once, is at most 0.38–0.48
  of the cost 1/η on every row (0.241 for the five first-order factors, as in the record), at every amplitude. So
  the whole h-side is pure cost by one certified 12×12 matrix bound per row; what remains of item G is the
  coupling between the h-side and the k-side perturbations, for which the theorem (with Y the visible base and the
  residual q inside O) is the natural tool near the zero core.
- It does not replace item B: the A/B direction has a first-order term and needs the margin, not pure cost.

**(d) κ for trilinear forms (ledger 4.30; #508, #603).** κ ≥ 2c/(c + 1) (P), sharp iff c ∈ {2, 4}; odd-c gap and
exact constructions (P + C, author only).
- PV3 had κ ≥ 2c²/(c + 1)², which missed the thresholds κ\*(c) of the piece t = 0.70 by 0.001–0.019 for
  c = 4, …, 12. The new floors 8/5, 5/3, 12/7, 16/9, 20/11, 24/13 exceed the thresholds 1.290, 1.407, 1.488, 1.596,
  1.662, 1.708 (at 1.449u\*) by 0.14–0.31. So in the Gamma model the three-cluster family is now under the allowance
  on that piece for every c tested.
- What is left in that family is the shape of the scale law: G = B_c·H with an explicit Beta factor and H ≥ 0,
  E H = 1, H ≤ 3c², E H² = κ/κ₀. That is a finite-dimensional problem (P5). Two-point proxies cost 9–11 % against the
  Gamma shape, still inside the allowance if the allowance stands (finding 1).
- It says nothing outside the family (H1), (H2).

**(e) Near-Gaussian remainder bounds (K 3.19, 3.19a).** D ≥ δ/8 for χ ≤ 9/2000 at the cubic peak, with explicit
Edgeworth remainders. The degree-5 content study has no certified lower bound of the deficit D(q) at all (its law
layer is float); the same expansion with ψ(√v) in place of 2E|L + √v| is the template for the low-χ end of item A,
where δ^{3/2} bounds cover only χ ≤ 10⁻⁷–3·10⁻⁵ (4.27).

---

## 6. Things in the record that do not fit together, and what was not verified

- **Rooms quoted in two generations.** Ledger 4.19 and CONT5 use the stage-2 rooms (ρ = 9513293/10⁷), about 10⁻⁵
  above those of 4.17; PV3's t_lo values are stage-2 interval ends. Harmless for the float allowances, but a
  certificate must use one set.
- **The band of the kit README** (`code/degree5-content/README.md`: u/u\* ∈ [0.5, 1.3]) is superseded by PV3 §2.
- **u\* in two places.** The kit files have u\* = 0.087869 (row 0.80), PV3's table 0.087859; this note's own
  optimisation over (σ, ν) of the rational row of `rows2b.json` gives 0.087883 at ν = 0.008363, where the kit fixes
  ν₅ = 0.0083647. Differences of 10⁻⁴ relative; not an error, but the profiles are tied to the float rows of
  `rows5.lines`, not to the rational rows of the certificate.
- **Two versions of the tuned rows.** The rows of `rows5.lines` (the content study, the gate) and the rows inside
  the covering files `profiles_low/` differ in the fifth digit (ℓ = 0.7997557 against 0.7997735 for the row 0.82;
  0.7673894 against 0.7673769 for 0.80), and both differ from the rational rows of `rows2b.json` in the seventh.
  A certificate must fix one set.
- **A/B ratio at s = 0.2 on the row 0.70:** CAPG §4 has 0.923, this note 0.930 (grid-dependent third digit).
- **Finding 1** (the margin): §3.2.
- **Not verified here:** the row inequality R1–R2 and the K₅ ⇒ law-layer step were read, not re-derived line by
  line; no node cap or cover box of 4.17 was recomputed (only the envelope from the stored C_r, and four Gaussian
  row values: 0.6999095, 0.7112159, 0.7128653, 0.7117053 at t = 0.70, 0.80, 0.85, 0.886, against 0.6999095,
  0.7112165, 0.7128645–0.7128653, 0.7117033–0.7117039 in the record); θ_room was not recomputed; no search over
  cubics was run; the quintic-shell contents (item C) and the exact coupled model were not re-evaluated; the K
  ledger rows were read in the ledger, their proofs were not.

---

## 7. The problem files

`research/higher-degree/sources/degree5-attack-2026-11-25/problems/`, in the order of their value to
the critical path:

| file | removes |
|---|---|
| `P1-content-law-on-covering-rows.md` | item A (hypothesis: the content law with the allowances) |
| `P2-ab-secant-margin.md` | item B (hypothesis: the margin μ of the gain bound) |
| `P3-mid-t-direct-bound.md` | K₅ on the law rows, t ∈ (0.2508, 0.647] |
| `P4-replay-conditional-certificate.md` | "one author, no replay" of ledger 4.17 |
| `P5-three-cluster-scale-law.md` | the three-cluster case of item A (the κ question in its present form) |
| `P6-pure-cost-sector-constants.md` | items D, F, G and the size of E |

Item C (the quintic shells) and item I (the assembly) have no problem file: stating them completely needs the
18-sector model of the design note and the exact coupled code, and they are better done next to the certificate.
