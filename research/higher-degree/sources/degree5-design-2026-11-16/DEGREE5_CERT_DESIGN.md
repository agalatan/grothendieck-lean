<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/DEGREE5_CERT_DESIGN.md, 16 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Degree-5 lower-bound certificate: design, loss budget, prototype

Research worker for claude-b9ee (issue #453), 16 November 2026. Target per the coordinator's update: **K_G^ℂ ≥ 1.402 from the
degree-5 game first** (cap B₅ ≤ 500/701 = 0.71326676), **1.403 as the stretch goal** (cap ≤ 1/1.403 = 0.71275838).

Labels: **P** proof on paper (here: short derivations, author only); **C** exact or interval-certified (nothing here);
**N** floating point. "Repo" cites a repository statement. Code and logs: `code/` and `out/` beside this file
(all runs on the laptop with `/usr/local/bin/python3 -I`; an attempted flank re-optimisation on `big` did not finish
under the load there and was stopped, and its folder deleted).

Game: T₅ = P₁,₀ − ε₁P₂,₁ + ηP₃,₂ with (ε₁, η) = (0.84896, 0.28180); model norm N₅ = 0.7124294 (1/N₅ = 1.403648).
Costs: p₁ = 1/ε₁ = 1.17791 (cubic sectors), p₂ = 1/η = 3.54862 (quintic sectors).

---------------------------------------------------------------------------------------------------------------------

## 0. Answer

1. **Architecture.** The exact gate-free multi-grade row (KSIDE §6, P) → an 18-sector decomposition of the adversary
   (G₃: 6 cubic sectors, G₅: 12 quintic sectors), with our multiplier C = c₅e₃₂ + b_A q·A + b_B q̄·B coupled to the
   adversary's own remote cubic q (driver sharing, kept exactly) → a **lossy K₅**: sup Λ₅ ≤ S₅ + η₅ at every row →
   the q-only potential Ψ₅(s; ν₅), an explicit 2-D integral (no gates, no price layer) → the remote law of U = |q|²/u
   with the existing Lean inputs → node caps, chords, (t, σ, x, ν₅)-cover. Gated rows are not used (they lose
   3–4·10⁻³ on the k-side and up to 2·10⁻² on the h-side at degree 5, Repo `ch5-negatives` neg:deg5).
2. **Prototype (N).** The Gaussian-ideal row envelope is flat at **0.712430** on t ∈ [0.82, 0.886] (the row family is
   tight to ≤ 2·10⁻⁶ of N₅ wherever computed). Room: **8.36·10⁻⁴** to 500/701, **3.27·10⁻⁴** to 1/1.403. The law layer
   costs 1.5·10⁻⁵ (peak) and ≤ 4.5·10⁻⁶ (flank) with moments only. So for 1.402 the sector layer may lose
   **η₅ ≈ 7.8·10⁻⁴** at the binding rows (plan 6·10⁻⁴); for 1.403 about **3.0·10⁻⁴**.
3. **Sector structure (N, new).** A charge-parity rule leaves seven sectors with a first variation at the q-only point:
   k-side r_A, r_B and h-side p₁₀ (remote H₂,₂), p₀₁ (H₃,₁), p₂₁ (H₁,₁), p₁₂ (H₂,₀), p₃₀ (H₀,₂). Their projections
   onto their own remote chaoses (the contents) vanish for a Gaussian remote residual. Their **content gains minus the
   q-only deficit reproduce the spike channel**: the
   one-spike expansion gives +1.8·10⁻⁵ to +2.0·10⁻⁵ at t = 0.87 against K5's exact +1.55·10⁻⁵ to +1.61·10⁻⁵, with the
   same leading shells. That is agreement to about 25 % in the net, or 5 % in the gains.
   All eight driver groups are strictly stable infinitesimally, but the group H₁,₁ (k-side z·Q with h-side
   e₂₁⊗H₁,₁) has a margin of only **3–4.5 %** at every row.
4. **A signal to check (N, not established).** At the peak row the same expansion puts a small spike in the Gaussian
   background slightly above the Gaussian: +6·10⁻⁷ at relative amplitude 0.1 and +1.6·10⁻⁶ at 0.2. The
   content/deficit ratios there are 1.36 and 1.06. This is below K5's Monte-Carlo resolution, and of the order of the
   expansion's own error (about 5 % of the gains, i.e. ≈ 1.5·10⁻⁶ at amplitude 0.2).
   - If it is real, exact K₅ fails at the peak too, and by the additivity of spike gains many such spikes could add
     10⁻⁵–4·10⁻⁵.
   - It is irrelevant for 1.402, and matters for 1.403.
   - A direct quadrature at the peak with a Gaussian background decides it (§7).
5. **GO for 1.402**, as a lossy-K₅ programme, with two caveats:
   - the h-side needs content lemmas coupled to the deficit of the same q; GPT's leakage constant 123π/512 is about
     3–4× too weak if used against the law layer;
   - the thin H₁,₁ margin must survive at finite amplitude.

   **NO-GO for 1.403 now.** It needs η₅ ≤ 3·10⁻⁴ including the true spike channel (≈ 10⁻⁴), i.e. near-sharp
   content–deficit constants.
6. **First milestone** (§7). A conditional degree-5 certificate "K₅(η₅) ⇒ K_G^ℂ > 1/(B₅^q + η₅)". Its parts: the
   rows, Ψ₅ node caps, the law layer and the cover, computed exactly, with B₅^q ≈ 0.71245. Its research gate is a
   sector-layer emulation at the five binding rows.

---------------------------------------------------------------------------------------------------------------------

## 1. The reduction chain

Notation: z = z₁ is the visible coordinate after the frame rotation, w the remote ones, and e_ab(z) = :z^a z̄^b:/√(a!b!)
the orthonormal one-variable Wick basis: e₁₁ = A = |z|² − 1, e₂₀ = B = z²/√2, e₂₁ = H, e₃₂ = z(|z|⁴ − 6|z|² + 6)/√12.
P = P₁,₀, Q = P₂,₁, R = P₃,₂.

| step | statement | source / status |
|---|---|---|
| R0 transfer | K_G^ℂ ≥ 1/sup_n ‖T₅^{(n)}‖_{∞→1}. Vector value: g = z/‖z‖ has ‖g − z/√n‖² ≤ 1/n, T₅(z/√n) = z/√n and ‖T₅‖₂→₂ = max(1, ε₁, η) = 1, so ‖T₅g − g‖ ≤ 2/√n. | HJM (klb); Repo Lean `transfer_lower`, `transferInputs_of_witnessCap` (cubic witness; the value half needs the one-line T₅ version). P |
| R1 charge one and split | WLOG f, g charge one. With h = (f+g)/2, k = (f−g)/2 and t = ‖Ph‖ ≤ √π/2: Re⟨f, T₅g⟩ = t² − ε₁‖Qh‖² + η‖Rh‖² − ‖Pk‖² + ε₁‖Qk‖² − η‖Rk‖². | HJM (eq:split) for degree 3; Lean `VOf_eq` (degree 3); T₅ is self-adjoint. P |
| R2 exact row | For all real ℓ, β, c₅, b_A, b_B, with G₃ = ε₁Qk ∈ H₂,₁, G₅ = ηRh ∈ H₃,₂ and q := z-free part of G₃ = ε₁Π₂,₁^{(w)}E_z[k]: **V ≤ t² − 2ℓt + 2β²/ε₁ + (c₅² + (b_A² + b_B²)‖q‖²)/η + Λ₅(G₃, G₅)**, Λ₅ = E\|L + G₅ + G₃ − C\| + E\|L + G₅ − G₃ + C\| − ‖G₃‖²/ε₁ − ‖G₅‖²/η, L = z(ℓ + β(\|z\|² − 2)), C = c₅e₃₂ + b_A q e₁₁ + b_B q̄ e₂₀. Five steps:<br>(i) −ε₁‖Qh‖² ≤ 2Re⟨β√2e₂₁, h⟩ + 2β²/ε₁;<br>(ii) −‖Pk‖² ≤ 0;<br>(iii) ε₁‖Qk‖² = 2Re⟨G₃, k⟩ − ‖G₃‖²/ε₁ and η‖Rh‖² = 2Re⟨G₅, h⟩ − ‖G₅‖²/η (equalities);<br>(iv) −η‖Rk‖² ≤ −2Re⟨C, k⟩ + ‖C‖²/η, for every C ∈ H₃,₂, which may depend on (f, g) through q;<br>(v) Re⟨X, f⟩ ≤ E\|X\|. | Repo KSIDE §6, k5 RESULTS §1; ledger 2.1 (cubic). P. The dropped squares are ‖Pk‖², ε₁‖Qh + B₃/ε₁‖² and η‖Rk − C/η‖². |
| R3 sectors | H₂,₁(ℂⁿ) = ⊕_{a≤2,b≤1} e_ab ⊗ H_{2−a,1−b}(w) and H₃,₂(ℂⁿ) = ⊕_{a≤3,b≤2} e_ab ⊗ H_{3−a,2−b}(w), orthogonally. So G₃ = Σ e_ab g_ab and G₅ = Σ e_ab p_ab with additive costs. Pointwise in w, Λ₅ = E_w Φ(x(w)) − Σ‖g_ab‖²/ε₁ − Σ‖p_ab‖²/η, x(w) ∈ ℂ¹⁸. | HJM §8.1 (k-side, 6 pieces); Lean `norm_sq_starProjection_H21_le` (cubic); the 12 quintic pieces: P (Wick products of independent coordinates). |
| R4 sector layer (lossy K₅) | **sup Λ₅ ≤ sup_{ν₃, ν₅, q} [E_w Ψ₅(\|q\|; ν₃, ν₅) − ‖q‖²/ε₁ − \|ν₃\|²/ε₁ − \|ν₅\|²/η] + η₅(row)**, for every remote q ∈ H₂,₁(w) and all sectors. | **open**: the whole new mathematics (§2, §5) |
| R5 radiality and convexity | Ψ₅(s; ν) = E_z[\|L + ν₅e₃₂ + s·D\| + \|L + ν₅e₃₂ − s·D\|] (ν₃ = 0), D = 1 − b_A e₁₁ − b_B e₂₀, depends only on s = \|q\|. It is jointly convex in (s, ν₅), even in s, and Lipschitz with constant 2E\|D\|. | P (C is charge-covariant: under z → e^{iφ}z, q → e^{iφ}q every term gains e^{iφ}). The analogue of HJM's Ψ(ω) = Ψ(\|ω\|). |
| R6 law layer | U = \|q\|²/u: E U = 1, E U² = m ∈ [2, 44], E U³ ≤ 9m − 12 + 40.45313(m − 2)^{3/2}, E\|q\| ≤ ρ√u, and the Stein cuts E G(U) ≥ 0 of the Lean family. | **Lean**, unchanged (ledger 3.4): the remote residual is still a circular cubic |
| R7 finite certificate | Node caps Ψ₅(s_i; ν_j) ≤ c_ij, chords by convexity, law nodes or polynomial majorants on (σ, x, ν₅)-boxes, rows V ≤ t² − 2ℓ_it + C_i, and the envelope max_t min_i ≤ B₅. | Repo architecture (`FiniteMix`, `LawNodeLower`); new data |

**R4 split into the statements a proof needs.** Write x′(w) = (p_j(w))_{j ≠ q} for the 17 non-residual sectors.

- **(S1) Pointwise expansion (P).** For complex a ≠ 0 and u, |a + u| ≤ |a| + Re(ū·ph a) + |u|²/(2|a|). Hence
  Φ(q, x′) ≤ Φ(q, 0) + Re⟨Γ(q), x′⟩ + x′*M(|q|)x′, with M(s)_jk = Σ_± s_j^± s_k^± E_z[e_j ē_k/(2|A_±(s)|)].
  It suffices on the h-side. On the k-side its curvature exceeds the cost (§2.2), so there the refined cubic tools
  apply: phase averaging, Λ̂, the tilted A-sector, (P) and the odd premise.
- **(S2) Averaging over w.** Distinct remote chaoses are orthogonal, so E_w[x′*M̄x′] splits into the driver groups
  of §2.1. The fluctuation M(|q|) − M̄ enters only through the content of M_jk(|q|) in the product chaos.
- **(S3) Content–deficit inequality (open; the main new lemma).** For every remote cubic q at the row's energies,
  Σ_j ‖Π_{H_j}Γ_j(q)‖² / (4(c_j − χ_j)) ≤ κ·D₅(q) + η_CD, where D₅(q) ≥ 0 is the q-only deficit (the
  same-variance Gaussian value minus E_wΨ₅(|q|)) and χ_j are the certified curvatures. The sum runs over the seven
  first-order sectors of §2.1, with the group couplings of §2.2.
- **(S4) Pure cost at finite amplitude.** Every group's curvature stays below its cost at all amplitudes and with
  arbitrary sharing: the 7.2.10 analogue for all eight groups.
- **(S5) Spike allowance.** An η_spike on the rows where (S3) holds only with κ > 1 (flank, §2.4).

Then η₅ = η_CD + (S4 losses) + η_spike, plus the lossy closures of the cubic pieces (§5).

**Comparison with HJM §8.** HJM reduce Re⟨f, Tg⟩ ≤ t² − 2ℓt + E Ψ(|q|) − σ²/δ (their (eq:simple-moment-target)) through
the gate inequality ε‖Qk‖² − ‖Pk‖² ≤ E_wℰ(k) + δ‖Q_wc₁‖², which charges every remote chaos of each fibre coefficient.
At degree 5 that is fatal. R2–R4 replace the gates by the adversary's sector variables in their exact chaos, so that
the chaos constraints become **content statements about bounded functions of q** (R4).

**Saha et al.'s fibre inequality.** V(u) ≤ 3νβ − β², applied per slice with Jensen and one global budget, has the
same "per-slice potential + budget" shape. It bounds ‖P₃k‖² ≤ Σ_j‖K_j‖², i.e. it charges every transverse degree, a
gate. So it is useful at most for crude small-t rows.

---------------------------------------------------------------------------------------------------------------------

## 2. The sector layer: map, parity rule, stability (prototype, N)

### 2.1 Sectors and the parity rule

At the q-only point, after the rotation q = s ≥ 0, A_± = L + ν₅e₃₂ ± sD. The first variation in sector (a, b) is

    Γ_ab(q) = E_z[ē_ab (ph A₊ ± ph A₋)],

with + on the h-side (G₅) and − on the k-side (G₃). It has charge c = 1 − (a − b) in q. It is even in q on the h-side
and odd on the k-side, so **Γ_ab ≡ 0 unless c is even (h-side) or odd (k-side)** (P; the cubic case is ledger 2.8/2.9).
Numerically, every predicted zero is below 10⁻¹⁶.

| side | sector | visible | remote chaos | first variation | driver group |
|---|---|---|---|---|---|
| k | q | 1 | H₂,₁ | (the residual itself) | — |
| k | r_z, r_z̄ | z, z̄ | H₁,₁, H₂,₀ | 0 | H₁,₁; H₂,₀ |
| k | r_A, r_B | A, B | H₁,₀, H₀,₁ | **yes** | H₁,₀/H₀,₁ |
| k | ν₃ | H | constant | 0 | — |
| h | ν₅ | e₃₂ | constant | yes (a scalar, exact in Ψ₅) | — |
| h | p₁₀, p₀₁ | z, z̄ | H₂,₂, H₃,₁ | **yes** | H₂,₂; H₃,₁ |
| h | p₂₁, p₁₂, p₃₀ | H, e₁₂, e₃₀ | H₁,₁, H₂,₀, H₀,₂ | **yes** | H₁,₁; H₂,₀/H₀,₂ |
| h | p₁₁, p₂₀ | A, B | H₂,₁, H₁,₂ | 0 (the companions) | H₂,₁/H₁,₂ |
| h | p₂₂, p₃₁, p₀₂, p₀₀ | e₂₂, e₃₁, z̄², 1 | H₁,₀, H₀,₁, H₃,₀, H₃,₂ | 0 | H₁,₀/H₀,₁; H₃,₀; H₃,₂ |

A diffuse cubic W populates only the remote chaoses (2i+j, i+2j). So **all seven first-order contents vanish in the
Gaussian ideal** (Repo DERIVATION5 §4, grade counting). For non-Gaussian q they are the leakage/content terms.
Cubic and quintic sectors share a driver in four groups: H₁,₁, H₁,₀/H₀,₁, H₂,₀/H₀,₂ and H₂,₁/H₁,₂. These
**cross-degree groups** are new at degree 5.

### 2.2 Second order: infinitesimal stability by driver group

The table gives the largest generalized eigenvalue of (true phase-averaged second variation) against cost, for an
independent diffuse driver of each group (the worst real driver for the charge-0 groups). A value below 1 means a
strict local maximum. Rows are those of §4.1 (`code/sectors.py`; 24–32 Laguerre nodes in U).

| group | t = 0.70 | 0.74 | 0.78 | 0.82 | 0.84 | 0.86* | 0.87* |
|---|---|---|---|---|---|---|---|
| H₁,₀/H₀,₁ {r_A, r_B, p₂₂, p₃₁} | 0.754 | 0.741 | 0.741 | 0.748 | 0.765 | 0.773 | 0.775 |
| **H₁,₁ {r_z, p₂₁}** | **0.956** | **0.957** | **0.959** | **0.965** | **0.969** | **0.970** | **0.967** |
| H₂,₀/H₀,₂ {r_z̄, p₁₂, p₃₀} | 0.670 | 0.636 | 0.600 | 0.562 | 0.542 | 0.524 | 0.520 |
| H₂,₁/H₁,₂ independent {p₁₁, p₂₀} | 0.250 | 0.246 | 0.246 | 0.248 | 0.254 | 0.257 | 0.257 |
| H₂,₂ {p₁₀} | 0.317 | 0.318 | 0.318 | 0.320 | 0.322 | 0.322 | 0.321 |
| H₃,₁ {p₀₁} | 0.222 | 0.211 | 0.199 | 0.187 | 0.180 | 0.174 | 0.173 |
| H₃,₀ {p₀₂} | 0.153 | 0.140 | 0.129 | 0.118 | 0.113 | 0.109 | 0.108 |
| H₃,₂ {p₀₀} (remote quintic) | 0.350 | 0.354 | 0.361 | 0.367 | 0.373 | 0.375 | 0.376 |
| q-driven companions (a, b) | 0.160 | 0.168 | 0.180 | 0.197 | 0.212 | 0.225 | 0.226 |

\*The flank columns use the driver-branch parameters of §4.1, which are valid rows but not re-optimised.

- **The quintic sectors are easy pure cost** (ratios ≤ 0.38), and so are the q-driven companions.
- **The thin spot is H₁,₁** (margin 3–4.5 %, about 0.035–0.05 per unit energy, at every row). At degree 5 the k-side
  cost p₁ = 1.178 is lower than the cubic witness's 1.322. The cubic analogue is ledger 7.2.6/7.2.10: κ₁ = 0.01 and
  1988/47275 at the cubic peak.
- **The elementary global majorant** |a + g| ≤ |a| + Re(ḡ ph a) + |g|²/(2|a|) (pointwise, no phase averaging) fails:
  - for the k-side sectors, per sector the maximum over s of curvature/cost is r_z 1.21–1.43, r_A 1.60–1.86, r_B
    0.86–1.06 and ν₃ 0.94–1.13;
  - for the h-side as a pointwise block (1.36–1.53), although every h diagonal is ≤ 0.89.

  So the k-side needs the cubic K methods: phase averaging, retained Λ̂, the content/cost forms. The h-side needs
  chaos orthogonality, i.e. averaging over w, not a pointwise block bound.

### 2.3 First order: content magnitudes

Var Γ_j(σW) is the content allowance with the trivial bound θ = 1; divided by 4(cost − curvature) it gives the gain:

| t | r_A | r_B | p₁₀ | p₀₁ | p₂₁ | p₁₂ | p₃₀ | h-side gain at θ = 1 |
|---|---|---|---|---|---|---|---|---|
| 0.78 | 1.25e-1 | 4.6e-2 | 3.3e-2 | 2.0e-2 | 2.5e-2 | 1.4e-2 | 3.3e-3 | ≈ 1.1e-2 |
| 0.84 | 7.4e-2 | 2.7e-2 | 7.7e-3 | 4.8e-3 | 7.6e-3 | 4.2e-3 | 1.0e-3 | ≈ 2.5e-3 |
| 0.87* | 5.1e-2 | 1.8e-2 | 3.1e-3 | 1.9e-3 | 3.3e-3 | 1.9e-3 | 4.5e-4 | ≈ 1.0e-3 |

- r_A and r_B include the q-linear part, which lies in H₂,₁ and has no H₁,₀ content; only the nonlinear remainder
  counts (Repo: E|Δ_A(σW)|² ≈ 2.3·10⁻⁴ at σ = 0.2 for the cubic).
- **θ = 1 (the gate) is 3–14× over the whole 1.402 budget.** Content lemmas are mandatory on both sides.

### 2.4 Content against deficit: the one-spike expansion

Take q = σ(c·H₂,₁(y) + √(1 − c²)·W), with y one remote coordinate and W diffuse (`code/spike.py`). Each wrong-chaos
sector uses its one-variable spike polynomial e_{H_j}(y), which is all that survives the diffuse limit. The gain is
the exact maximum of the second-order model (first-order content plus exact second variation). The q-only deficit is
exact.

| row | c | σ | m − 2 | content gains Σ (7 sectors) | q-only deficit | ratio | net vs Gaussian |
|---|---|---|---|---|---|---|---|
| peak 0.84 | 0.10 | 0.240 | 0.004 | 2.34e-6 | 1.72e-6 | 1.36 | **+6.2e-7** |
| peak | 0.20 | 0.239 | 0.067 | 2.90e-5 | 2.74e-5 | 1.06 | **+1.6e-6** |
| peak | 0.30 | 0.231 | 0.34 | 1.01e-4 | 1.22e-4 | 0.83 | −2.1e-5 |
| peak | 0.60 | 0.166 | 5.4 | 3.49e-4 | 6.72e-4 | 0.52 | −3.2e-4 |
| peak | 1.00 | 0.093 | 42 | 3.30e-4 | 9.22e-4 | 0.36 | −5.9e-4 |
| flank 0.87 (K5 row) | 1.00 | 0.067 | 42 | 1.06e-4 | 8.81e-5 | 1.20 | **+1.80e-5** |
| flank | 0.90 | 0.071 | 27.6 | 9.11e-5 | 7.76e-5 | 1.17 | +1.35e-5 |

**Validation.** At t = 0.87 the expansion gives +1.80·10⁻⁵ (ν₅ = 0.0537) and +1.96·10⁻⁵ over the benchmark
(ν₅ = 0.0532). K5's exact one-spike quadrature gives +1.61·10⁻⁵ on 60×48 and +1.55·10⁻⁵ on 84×72 (MC +1.8·10⁻⁵).
So the net agrees to about 25 % and the gains to about 5 %. The leading shells agree:

| shell | expansion | K5 |
|---|---|---|
| p₁₀ | 5.0e-5 | 5.1e-5 (z₁:\|z₂\|⁴:) |
| p₂₁ | 2.1e-5 | 1.9e-5 (H₂,₁(z₁)(\|z₂\|² − 1)) |
| p₀₁ | 1.4e-5 | 1.4e-5 (z̄₁:z₂³z̄₂:) |
| clean junta | −8.8e-5 | −8.0e-5 |

So **the spike channel is "content of the seven wrong-chaos sectors minus the q-only deficit"**, and a second-order
sector expansion gets it to about 5 % of the gains.

At the peak, for c ≥ 0.6, the σ listed is a local optimum along the family; σ → 0 (the plain point, −1.5·10⁻⁴) is
higher. The family's supremum is negative either way, as in K5.

**Two consequences:**
- the lemma to prove is a **content–deficit inequality**: Σ_j gain_j(q) ≤ κ·D₅(q) + η_CD, the degree-5 analogue of
  ledger 6.2.3 (C² ≤ κD) summed over seven shells;
- at the peak the expansion puts small spikes at ratio 1.36 (c = 0.1) and 1.06 (c = 0.2), i.e. at +6·10⁻⁷ and
  +1.6·10⁻⁶. That is within the method's 5 % error at c = 0.2 and marginally outside it at c = 0.1. If real, the
  additivity of spike gains (`spike-layer/SPIKE_LAYER.md` §0) could make a collective peak channel of
  10⁻⁵–4·10⁻⁵. Not established. A direct (z, y, W) quadrature at the peak should decide it.

---------------------------------------------------------------------------------------------------------------------

## 3. Loss budget

### 3.1 Per component

| component | estimate | basis |
|---|---|---|
| row family (Lagrangian gap) | ≤ 2e-6 at every computed row (t ∈ [0.70, 0.886]) | rows vs N₅ (§4.1); the flank rows equalise the two branches |
| finite t-cover (rows every 0.005 on [0.80, 0.886], coarser below; about 25 rows) | ≤ 1e-5 | ½·(2 − D″)·δ² with D″ ≈ −0.14, δ = 0.0025 |
| law layer, moments only | 1.5e-5 (0.84), 3.3e-5 (0.82), 6.6e-5 / 7.5e-5 (0.74 / 0.78), 5e-6 (0.85–0.86), < 1e-6 (0.87); **3.0e-3 at t = 0.70** (m = 3, u = 0.28) | `out/lawlp_*.log` (N) |
| law layer with Stein cuts | 8.1e-7 at the peak after 300 generated cuts; mid-t rows recover 75–85 % (cubic experience) | DEGREE5_MILESTONES §2 |
| h-side content (5 shells) | θ = 1: 1.0e-3 (flank) – 2.5e-3 (peak) – 1.1e-2 (0.78); with GPT's constant used against the moment LP: about 1.15e-3·(m − 2) at the peak, i.e. ≥ 9e-4; content–deficit form: 0 to +1.6e-6 per small spike at the peak | §2.3–2.4 |
| k-side A/B content and costs | cubic L4/L5 structure with new constants; true margins 0.22–0.26 per unit (§2.2) | ledger 6.2, 7.1, 7.3, 7.4 |
| k-side odd sectors (z·Q, z̄·P, ν₃) and the H₁,₁ group | margin 3–4.5 %; finite-amplitude version open | §2.2; ledger 7.2.10 |
| quintic pure-cost sectors and companions | ratios ≤ 0.38: margins ≥ 2.2 per unit | §2.2 |
| spike channel (flank t ∈ [0.86, 0.886]) | true 8e-5–1.2e-4; at the peak a possible 1e-5–4e-5, not established (§2.4) | Repo k5 §4.4, DEGREE5_MILESTONES; §2.4 |
| node caps, chords, box cover | about 3e-5: no price layer, so caps hold to 1e-9 and chords to 1e-6 with about 300 nodes | the cubic loss map gives 5–6e-5 with the price layer |

### 3.2 Per row (room, law layer, sector allowance η₅)

η₅ = room − 1e-5 (rows) − law layer − 3e-5 (caps).

| t | Gaussian-ideal row | room to 500/701 | law (moments) | **η₅ for 1.402** | room to 1/1.403 | η₅ for 1.403 (Stein cuts) |
|---|---|---|---|---|---|---|
| 0.70 | 0.7100051 | 3.26e-3 | 3.0e-3 | 2.3e-4; about 2.5e-3 with Stein cuts | 2.75e-3 | ≈ 2e-3 |
| 0.74 | 0.7113335 | 1.93e-3 | 6.6e-5 | 1.82e-3 | 1.42e-3 | 1.37e-3 |
| 0.78 | 0.7121097 | 1.16e-3 | 7.5e-5 | 1.04e-3 | 6.5e-4 | 5.9e-4 |
| 0.82 | 0.7124069 | 8.60e-4 | 3.3e-5 | 7.9e-4 | 3.5e-4 | 3.1e-4 |
| 0.84 | 0.7124295 | 8.37e-4 | 1.5e-5 | **7.8e-4** | 3.29e-4 | **2.9e-4** |
| 0.86* | ≤ 0.7124229 | ≥ 8.44e-4 | 4.5e-6 | 8.0e-4 | 3.35e-4 | 3.0e-4 |
| 0.87* | ≤ 0.7124309 | ≥ 8.36e-4 | 4.5e-7 | **7.95e-4**, of which the spike channel is ≈ 1e-4 | 3.27e-4 | **2.9e-4**, of which the spike channel is ≈ 1e-4 |
| 0.875 | 0.7124182 | 8.49e-4 | ≈ 1e-6 | 8.1e-4, of which the spike channel is ≈ 1e-4 | 3.40e-4 | 3.0e-4, of which the spike channel is ≈ 1e-4 |
| 0.88 | 0.7124221 | 8.45e-4 | ≈ 1e-6 | 8.0e-4, of which the spike channel is ≈ 1e-4 | 3.36e-4 | 3.0e-4, of which the spike channel is ≈ 1e-4 |
| 0.886 | 0.7124262 | 8.41e-4 | ≈ 1e-6 | 8.0e-4 | 3.32e-4 | 3.0e-4 |

### 3.3 Planned split for 1.402 (η₅ = 6·10⁻⁴ per binding row, leaving about 1.8·10⁻⁴ unallotted)

| sector | allowance |
|---|---|
| k-side cubic sectors: A/B content and costs, joint (P), odd premise with shells | 2.5e-4 |
| h-side content–deficit (5 shells) | 1.5e-4 |
| spike layer (flank rows) | 1.5e-4 (true ≤ 1.2e-4) |
| cross-degree groups, companions, remote quintic, ν₃/ν₅ | 0.5e-4 |

**Rows the budget leaves uncovered.** Mid-t rows (0.74–0.78) carry 4–5× the peak content (σ* = 0.36–0.41, content
∝ σ⁴) but have 1.3–2.3× the room. Rows near t = 0.70 need Stein cuts in the law layer.

**For 1.403.** η₅ ≈ 2.9·10⁻⁴ minus the true spike channel (≈ 1.2·10⁻⁴) leaves about 1.7·10⁻⁴ for every other sector
loss. With the measured content–deficit ratios (≤ 0.83 at c ≥ 0.3 at the peak, 1.2 at the flank), only near-sharp
lemmas would fit.

---------------------------------------------------------------------------------------------------------------------

## 4. Prototype numbers (N)

### 4.1 Rows (Gaussian ideal of the gate-free row, (ℓ, β, b_A, b_B) optimised, c₅ = 0)

| t | ℓ | β | b_A | b_B | σ* | ν₅* | row | plain branch at these parameters |
|---|---|---|---|---|---|---|---|---|
| 0.70 | 0.6799 | 0.0903 | −0.1086 | −0.0644 | 0.461 | 0.016 | 0.7100051 | 0.6928074 |
| 0.74 | 0.7269 | 0.1073 | −0.1218 | −0.0725 | 0.414 | 0.021 | 0.7113335 | 0.7026094 |
| 0.78 | 0.7735 | 0.1263 | −0.1359 | −0.0814 | 0.357 | 0.028 | 0.7121097 | 0.7087618 |
| 0.82 | 0.8186 | 0.1476 | −0.1509 | −0.0913 | 0.285 | 0.036 | 0.7124069 | 0.7117252 |
| 0.83 | 0.8295 | 0.1533 | −0.1547 | −0.0939 | 0.263 | 0.038 | 0.7124254 | 0.7120623 |
| 0.84 | 0.8401 | 0.1591 | −0.1586 | −0.0965 | 0.240 | 0.041 | **0.7124295** | 0.7122757 |
| 0.85* | 0.8507 | 0.1652 | −0.1619 | −0.0982 | 0.202 | 0.044 | ≤ 0.7124257 | 0.7124050 |
| 0.86* | 0.8612 | 0.1722 | −0.1629 | −0.0987 | 0.196 | 0.045 | ≤ 0.7124229 | 0.7123985 |
| 0.87* | 0.8694 | 0.1777 | −0.1632 | −0.0969 | 0.189 | 0.045 | ≤ 0.7124309 | 0.7124004 |
| 0.875 | 0.8744 | 0.1806 | −0.1677 | −0.1007 | 0 / 0.175 | 0.054 | 0.7124182 | 0.7124182 (driver 0.7124181) |
| 0.88 | 0.8788 | 0.1835 | −0.1697 | −0.1010 | 0 / 0.174 | 0.054 | 0.7124221 | 0.7124221 (driver 0.7124220) |
| 0.886 | 0.8856 | 0.1879 | −0.1691 | −0.1066 | 0 / 0.177 | 0.054 | 0.7124262 | 0.7124262 (driver 0.7124260) |

- Engine check: at the K5 peak row the engine gives 0.71243010, against 0.7124302 in DEGREE5_ROW_GAP.
- \*At t = 0.85–0.87 the first optimisation saw only the plain branch, because of a bug in `Inner.sup`, since fixed.
  These parameters are therefore valid but not optimal. The values given are the true (driver-branch) row values,
  i.e. upper bounds on the optimised rows.
- The rows t = 0.875, 0.88 and 0.886 were optimised with the fixed two-branch supremum (`code/flankquick.py`, a short
  Nelder–Mead). **The optimiser equalises the two branches to 1.5·10⁻⁷** (plain σ = 0 and driver σ ≈ 0.175), which
  is the 87/13 % two-branch optimum of the primal–dual report seen from the row side. A row must bound both, and the
  inner supremum does.
- Those rows lie *below* N₅. The older K5 flank rows (0.712444–0.712451) came from a coarse grid and were not
  optimal, so the envelope is flat at **0.71243** and is set by t ≈ 0.84 (and t ≈ 0.87 before re-optimisation).

### 4.2 Supporting runs

- **Law layer.** Moment-only LP gap per row (§3.2); the extremal law at the binding rows sits at m = 2, the
  moment-ambiguity floor that the Stein cuts remove (Repo).
- **Sectors.** Group ratios and variances: §2.2, §2.3. Logs: `out/sect_a.log`, `out/sect_b.log`.
- **Spike expansion.** `out/spike_t084.log`, `out/spike_small.log`, `out/spike87.log`.

---------------------------------------------------------------------------------------------------------------------

## 5. The K ledger at degree 5

Three groups:
- **AS**: transfers as is (a statement about cubic chaos or a logical/pointwise fact);
- **NC**: transfers with new constants (row-specific: new L, ε₁, ν₅e₃₂ and C coupling, so the computation is redone);
- **NEW**: needs new work.

| layer | ledger rows | group | degree-5 remark |
|---|---|---|---|
| L0 | 2.1 exact row | AS (extended, R2) | P here; dropped squares now ‖Pk‖², ε₁‖Qh + B₃/ε₁‖², η‖Rk − C/η‖² |
| L0 | 2.8/2.9 frequency and parity, 2.10a/2.13/2.14 retained Λ̂ | AS | parity rule §2.1; Λ̂ (first-chaos dual) applies verbatim to Λ₅ |
| L0 | 2.12a–d response caps and penalties | NC | constants depend on ε₁, t; the h-quintic square is new |
| L1 | 3.4 moments and Stein inputs, 3.12 dense cuts | AS | **Lean**, unchanged |
| L1 | 3.2/3.3 remote cap, 3.14 benchmark, 3.11/3.13/3.15 profile transfers | NC | done in float at the peak (+1.5e-5 moments, +8e-7 with cuts); flank floor < 5e-6; for 1.402 no cut generation is needed at the binding rows |
| L1 | 3.5/3.6 radius and PVD equivalences, 3.18 Edgeworth | not usable | Ψ₅ is not of the form 2E\|z(a + bT) + √v\|; 3.18 has no constant |
| L2 | 4.1/4.2 disjoint drivers | NC, **weaker** | 4.2's cost 1/ε − 197/(200ℓ) is 0.005 at the degree-5 peak and negative at t = 0.70; the true margin (group H₁,₀ ratio 0.74–0.78) is fine, so a sharper redistribution bound is needed |
| L3 | 6.1.1/6.1.1a orthogonality regions | NC, **easier** | regions grow linearly with the allowance: at η₅ ≈ 5e-4 the uncovered rectangle shrinks several-fold |
| L4 | 6.2.3/6.2.4/7.4.1 cost + content logic | AS | applies sector by sector, now with seven content shells |
| L4 | 6.2.1 A-shell cost, 6.3.1–6.3.6 family content theorems | NC | profile g changes (b_A, b_B, ν₅); methods transfer |
| L4 | 6.3.18 general-cubic A-content | open → lossy | the cubic needs κ < 0.24 against sup ≈ 0.088 (N); a lossy additive form fits a 1e-4 sub-budget |
| L4 | h-side contents in H₂,₂, H₃,₁, H₁,₁, H₂,₀, H₀,₂ | **NEW** | template: GPT's leakage ‖P₃,₂h‖² − \|x₃\|² ≤ (123π/512)σ⁴(m − 2) (DERIVATION5 §7) |
| L5 | 7.1.1 B cost, 7.1.4/7.1.6 B–A alignment, 7.3.1/7.3.2/7.4.9 A/B forms | NC | infinitesimal margins at degree 5: 0.22–0.26 per unit |
| L5 | 7.4 joint A/B (P), 7.4.5/7.4.11–13 partial covers | open → **closable in lossy form** | 7.4.2: with cost 0.24 and content 0.24 the excess is < 1.9e-5; a 1e-4 allowance lets weaker robust constants and coarser covers through |
| L5 | 7.2.6/7.2.10 odd over remote cores | NC, **thin** | H₁,₁ margin 3–4.5 % (§2.2) against 1988/47275 at the cubic peak; must be redone first |
| L5 | 7.5.x odd premise with A/B shells (P_Ψ) | open → **plausible in lossy form** | the known positive increment +1.24e-4 (7.2.9) is inside a 5e-4 budget; needs the H₁,₁ margin |
| L5 | cross-degree groups H₁,₁, H₁,₀, H₂,₀; q-driven companions; remote quintic | **NEW** | infinitesimally stable (§2.2); finite-amplitude certificates as for 7.2.10 |
| L5 | spike layer | **NEW** | `spike-layer/` (telescoping, exact single-coordinate gains, DP over heavy coordinates); the peak row needs it too (§2.4) |
| L6 | 8.1/8.5–8.7 consumer | **NEW** | degree-5 rows, two-branch flank, ν₅ dimension, response bookkeeping with ε₁ |

**Answer to the key question.** Yes for the two open cubic pieces, with one proviso.
- **The joint A/B bound (P).** It needs a strict margin η ≈ 7.5·10⁻⁵ per unit shell energy in the cubic programme.
  With a 2.5·10⁻⁴ k-side budget the cost and content constants can drop, for example to diagonal costs 0.15–0.2
  (7.4.2 shows γ = 0.15 with m = 0 already gives 3.6·10⁻⁶ of excess). The adaptive covers (7.4.13) then need far
  less precision.
- **The odd premise with shells.** Its only known obstruction is +1.24·10⁻⁴, which the lossy budget absorbs.
- **The proviso.** Every k-side constant must be recomputed with p₁ = 1.178 instead of 1.322. The odd-sector margin
  (H₁,₁) is the one that gets thin.

---------------------------------------------------------------------------------------------------------------------

## 6. Computational plan and Lean plan

### 6.1 What is certified, and how

| item | method | size and CPU (estimates) |
|---|---|---|
| rows | about 25 rows (ℓ, β, b_A, b_B rational), 0.005 apart on [0.80, 0.886], 0.02 below; crude rows for t ≤ 0.6 | float optimisation about 10 min/row; exact check trivial |
| Ψ₅ node caps | Ψ₅(s; ν₅) is an explicit 2-D integral. Each angular circle is \|c₀ + c₁ζ + c₂ζ²\| (ζ = e^{iθ}): a complete-elliptic integral (joint-pointwise CERT_DESIGN §E), or the HJM price majorant \|a\| ≤ (w + \|a\|²/w)/2 on polar cells with exact polynomial integrals. Joint convexity in (s, ν₅) means only the vertices of a 2-D grid are needed | about 25 rows × 300 s-nodes × 10 ν₅-nodes ≈ 7.5·10⁴ nodes. Arb: about 0.1–1 s per node, i.e. 2–20 CPU-hours. The rational price-cell method: 10⁶–10⁷ operations per node |
| law layer | the existing Lean moment and Stein family; generated cuts only for t ≤ 0.76 (1.402) or everywhere (1.403) | cut generation about 1–2 CPU-hours/row (the 300-cut run) |
| cover | (t, σ, x, ν₅)-boxes; the cubic needed 15,096 boxes in (t, τ, x), and ν₅ adds a short convex dimension | 2·10⁴–10⁵ boxes; minutes–hours |
| sector layer | paper lemmas plus interval certificates (Arb/C++), as in the cubic K programme (KINT, KODD, KGAP, joint-pointwise) | 10²–10³ CPU-hours on the droplet; the joint-pointwise estimate for one cubic joint sector alone is 60–400 h |

### 6.2 Lean plan

**No change to the root lake files.** All new code goes in new modules, e.g. `Grothe/Degree5/…`. None of them is
imported by the cap rows or `CapNodes`, so the caps closure (`scripts/caps_stamp.py --list`) does not move. Existing
files in that closure are never edited. Where a cubic module must be generalised (frame, pieces, potential), copy it
into a new degree-5 file.

**Reusable as is.**
- Transfer: `Grothe.Lower.transfer_lower`, `TransferInputsL2` and `transferInputs_of_witnessCap`; only the witness
  operator and the value half are new.
- Gaussian core: `LowerAnalytic/ComplexGaussianCore`, `GaussianRadial`.
- Cubic chaos: `WickCubic`, `WickChaos`.
- All law inputs for circular cubics: `CircularFourth`, `SixthMoment`, `Bridge.gaussian_moments`,
  `RadialCut.gaussian_steinInputs`, `Lower/Stein.steinCut_of_inputs`, `GramBudget`, `Law.node_fn_of_cut`.
- Certificate machinery: `FiniteMix`, `BoxLookup`, and the pattern of `LawNodeLower.profile_bound_of_law_nodes`.
- Response penalties: `Lower/ResponsePenalty`.

**New.**

| module | content | rough size |
|---|---|---|
| (1) `Witness5` | H₃,₂ as Wick quintics: the charge-one polynomials of degree ≤ 5 orthogonal to H₁,₀ ⊕ H₂,₁, the Wick identities needed, T₅ and its value | 1–2k lines |
| (2) `Row5` | the exact row R2 | 0.5k lines |
| (3) `Sectors5` | the 18-piece decomposition and its norms | 2–3k lines; the cubic `Pieces`/`Tensor`/`FibreHermite` are the template |
| (4) `Potential5` | Ψ₅, radiality, joint convexity, Lipschitz bound | 1k lines |
| (5) `K5Hyp` | the sector layer as a hypothesis with an explicit allowance function, and `lower_of_K5 : K5Hyp η₅ → IsGrothendieckBound K → 1/(B₅ + η₅) < K` | 0.5k lines |
| (6) data | rows, law nodes and cover as native_decide facts in ordinary modules (as the current row/box checkers) | — |
| (7) caps | the Ψ₅ node caps | — |

Discharging `K5Hyp` in Lean means formalising the sector layer, which no cubic K piece has yet. That is months, after
the paper and interval programme.

**Is a new precompiled checker needed?** Not for the first milestone. The rows, boxes and law nodes run as ordinary
`native_decide` modules, as today. The Ψ₅ caps are the question:
- about 7.5·10⁴ nodes at 10⁶–10⁷ exact operations each is 10¹¹–10¹² operations;
- precompiled, that is about one CPU-hour; interpreted, 50–100× more;
- try it first in ordinary modules, split into about 50 modules for CI parallelism (GitHub-hosted, ≤ 6 h each), and
  thin the nodes with joint convexity.

If that is too slow, a new precompiled library (say `GrotheD5Kernel`) is a **lakefile change**. It needs the user's
OK, and because `lakefile.toml` is in the caps closure it forces one full node-cap rebuild (about 21 CPU-hours on a
heavy runner). The existing kernels are not suitable:
- `GrotheCapsKernel` is frozen;
- `GrotheQuadExtKernel` is for the upper bound;
- adding to `GrotheKernel` recompiles its upper-bound importers.

**Recommendation:** decide after the interpreted pilot. If the kernel is needed, bundle it with the next planned
toolchain change.

---------------------------------------------------------------------------------------------------------------------

## 7. Go / no-go and the first milestone

**1.402: GO**, conditional on a lossy K₅ with η₅ ≤ 6·10⁻⁴ per binding row (7.8·10⁻⁴ available).

Reasons:
- the binding rows have 5–8× the cubic programme's allowance;
- the law layer needs no new cuts there;
- the quintic sectors are easy pure cost;
- the two open cubic pieces become lossy-closable;
- the spike channel only needs an allowance.

Risks, in order:
1. the h-side content–deficit lemma (new; GPT's leakage constant is about 3–4× too weak in a law-only coupling);
2. the H₁,₁ odd margin (3–4.5 %) at finite amplitude;
3. mid-t rows (content ∝ σ⁴) and t ≈ 0.70 (law layer);
4. the size of the sector layer: the cubic K programme is still open after weeks; here it is the same programme with
   seven content shells and new constants.

**1.403: NO-GO for now.** It needs η₅ ≤ 2.9·10⁻⁴ including a true spike channel of about 10⁻⁴, plus possibly 10⁻⁵–4·10⁻⁵ at the
peak (§2.4, not established). That means near-sharp content–deficit constants. Revisit after the 1.402 sector layer exists.

**First milestone (M1, about 2–3 weeks).**
- **(a) The conditional certificate, exact, outside Lean first.**
  - Rows on the t-cover above (re-optimise t ∈ [0.85, 0.87] with the fixed two-branch supremum).
  - Ψ₅ node caps by Arb.
  - The moment law layer, with Stein cuts below t = 0.76.
  - The (t, σ, x, ν₅)-cover.

  Output: a rational B₅^q (expected about 0.71245) and the theorem "K₅(η₅) ⇒ K_G^ℂ > 1/(B₅^q + η₅)", so η₅ ≤ 7.7·10⁻⁴
  suffices for 1.402. The Lean port starts with `Row5`, `Potential5` and `K5Hyp`.
- **(b) The research gate, in parallel.** A sector-layer emulation at t ∈ {0.78, 0.82, 0.84, 0.86, 0.88}:
  - the content–deficit ratio over the one-spike, N-spike and K5 tensor families, with group couplings included;
  - the finite-amplitude H₁,₁ stability (the 7.2.10 analogue with p₁ = 1.178);
  - a direct (z, y, W) quadrature of one small spike in the Gaussian background at the peak (c = 0.1–0.2), to settle
    the peak signal of §2.4.

  Kill criterion: any binding row needs η₅ > 6·10⁻⁴ under candidate provable lemma forms, or H₁,₁ loses stability at
  finite amplitude.

---------------------------------------------------------------------------------------------------------------------

## 8. Files (this folder)

**Code.** In `code/`:
- `d5eng.py`: row engine (Gaussian ideal, two branches);
- `optrows.py`: row optimisation;
- `sectors.py` and `runsect.py`: parity, group ratios, variances;
- `lawlp.py`: moment law LP;
- `spike.py`, `spike87.py`, `spike_small.py`: one-spike sector expansion.

**Logs.** In `out/`: `rows_*.json`, `optrows_*.log`, `sect_*.log`, `lawlp_*.log`, `spike_*.log`.

**Sources read.** In `dl-hjm/` and `dl-saha/`: the arXiv sources of HJM 2609.25462 (§7–8 read) and Saha et al.
2608.11158 (lower-bound section read).
