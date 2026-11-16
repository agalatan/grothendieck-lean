<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CERT_STAGE2B.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Degree-5 conditional certificate, stage 2b (capped game)

Worker for claude-b9ee (issue #453, M1(a)), 16 November 2026. Game T = P₁,₀ − ε₁P₂,₁ + ηP₃,₂, ε₁ = 39/50,
η = 779/10000; target V ≤ 500/701 = 0.713266762. Labels: **P** proof on paper, **C** exact or interval-certified
computation (replayed), **N** floating point. Code and data: `cert2b/` beside this file (§6). Stage 2
(`CERT_STAGE2.md`, `cert2/`) is left as it was; this note supersedes its numbers. As in stage 2, the certificate is
conditional: **K₅ is a hypothesis on every row** except on [0, t₁], where the small-t theorem replaces the rows.

## 0. Answer

1. **Radius fix (C).**
   - With ρ = 95133/10⁵, **B₅ = 0.7128940126** at t = 0.8476, so **500/701 − B₅ = 3.7275·10⁻⁴**. Stage 2 had
     B₅ = 0.7128845054 and a room of 3.8226·10⁻⁴.
   - The effect is **about 10⁻⁵ (up to 5·10⁻⁵ per row), not 10⁻⁷**. In the law layer of the binding rows the radius
     constraint is active with weight dG⁺/dρ = a₁σ ≈ 14 (§1).
2. **Small-t theorem (input P + C).**
   - V ≤ (2/5)t² + 7058083/10⁷ is used on [0, t₁], with t₁ the crossing with the row envelope. The rows t = 0, 0.05
     and 0.1 are dropped.
   - The row t = 0.125 remains only where it is the minimum.
   - With the plain rows: t₁ = 0.114594, maximum 0.711061 (room 2.21·10⁻³). That beats switching at t₀ = 0.1365,
     where the bound is 0.713261 (room 5.6·10⁻⁶).
3. **Stein family in the law layer (C, with one libm assumption).**
   - Certified on the five rows t = 0.125, 0.15, 0.2, 0.25 and 0.3 (1065 Stein boxes in all).
   - C_r drops by 7.7·10⁻³, 9.6·10⁻³, 1.27·10⁻², 1.11·10⁻² and 9.1·10⁻³ (the small-t worker's N estimates: 7.4·10⁻³ at 0.1, 1.5·10⁻² at 0.2).
   - New rooms on [0, 0.65] (§4): 0.15: 9.9·10⁻³ (was 2.3·10⁻³); 0.2: 1.22·10⁻² (3.0·10⁻³); 0.25: 1.82·10⁻² (5.5·10⁻³); 0.3: 2.08·10⁻² (1.0·10⁻²); 0.4–0.55 (plain): ≥ 1.88·10⁻²; 0.6 (plain): 1.13·10⁻².
   - The smallest small-t room is now **5.83·10⁻³** (stage 2: 2.19·10⁻³), at the crossing t₁ = 0.0637 of the small-t
     bound with the Stein row 0.125.
   - Rows 0.4, 0.5, 0.55, 0.6 keep their moments + radius covers; their rooms are already ≥ 1.13·10⁻², and the time went
     elsewhere (§3).
4. **Replay (C).** One checker, `replay2b_all.py`, over everything: **ALL PASS**: 29 rows, 295,626 node caps recomputed, 29 plain covers and 5 Stein covers re-verified box by box, every C_r reproduced, both envelopes exact; the small-t certificate re-run (432 certificates of the 40 node files, 0 problems; exact assembly N = 0.705808215 ≤ 7058083/10⁷ with (1 − η′_d) − 2/5 = 2.2·10⁻¹⁷): PASS.

## 1. Correctness fix: the radius constant

- `law2.py` and `lpfloat2.py` now use **ρ = 95133/100000**, the proved statement of ledger 3.7
  (`real-stein-radius.tex`, Theorem). Its largest Arb row bound is 0.95132934139… > 9513293/10⁷, the value stage 2 used.
- Every row was covered again with the stage-2 node caps (they do not depend on ρ) and **the same targets as in
  stage 2** (`run_rows2b.py`), so the split history is the same up to the shift.
- **Size of the effect (C).** For most rows ΔC_r is 10⁻⁸ to 10⁻⁶. On the binding rows 0.82–0.886 it is 4·10⁻⁶ to
  5·10⁻⁵: 0.845 +9.8·10⁻⁶, 0.85 +9.3·10⁻⁶, 0.886 +5.1·10⁻⁵.
  - Why: there the box maximum sits at σ ≈ 0.2 with the radius constraint active, and the LP majorants put a large
    weight on it (dG⁺/dρ = a₁σ ≈ 14).
  - Result: B₅ moves by +9.5·10⁻⁶.

## 2. The small-t theorem in the envelope

- **Input (P + C, `SMALL_T.md`, `smallt/`).** V ≤ (2/5)t² + 7058083/10⁷ for every response. It rests on 412
  certificates (Stein family, moments and radius; no K₅). It is used on [0, t₁], and the rows t = 0, 0.05, 0.1 are
  dropped.
- **Choice of t₁.** t₁ is the crossing of this bound with the envelope of the remaining rows, rounded down to 10⁻⁶.
  - Any t₁ gives a valid partition of [0, √π/2]; the crossing minimises the maximum.
  - The maximum on [0, t₁] is (2/5)t₁² + 7058083/10⁷.
  - On [t₁, 886227/10⁶] the exact row envelope of stage 2 is used unchanged (`envelope.py`).
- **Where row 0.125 stays.**
  - Plain covers: t₁ = 0.114594; the row is active on [0.1146, 0.1399].
  - Stein covers: t₁ = 0.063736; the row is active on [0.0637, 0.1148].
- **Re-checked here (C).** `replay2b_all.py --smallt` re-runs the small-t certificate's own replay:
  `smallt/reverify.py` on all 40 node files, then the exact `smallt/assemble.py`. It then checks exactly that
  N(η′_d) + max(1 − η′_d − 2/5, 0)·(886227/10⁶)² ≤ 7058083/10⁷.

## 3. The scalar Stein family in the law layer

**Statement used (P).** This is `real-stein-radius.tex`, eq. (real-stein-square). Take q ∈ H₂,₁ with ‖q‖₂ = 1,
X = Re q, s = E|q|⁴ − 2. For every even, continuous, piecewise-linear w that is constant beyond its last knot, and
every μ > 0, E h_w(X) ≤ μs/24, where h_w(x) = xV_w(x) − w(x)/2 − w(x)²/(2μ).

Applied to q/σ with w(x) = W(σx) and μ = Mσ², it gives the **physical form**. The step is one line:
σ²h_w(y/σ) = yV_W(y) − (σ²/2)W(y) − W(y)²/(2M). So for ‖q‖₂ = σ,

    E h_{W,σ²}(Re q) ≤ M σ⁴ s/24,   h_{W,c}(y) = y V_W(y) − (c/2) W(y) − W(y)²/(2M).

By circular symmetry, E h(Re q) = E Ψ_h(|q|), with Ψ_h(r) = (2/π)∫₀¹ h(ru)(1 − u²)^{−1/2} du.

**Stein box (C).** A box [σ_a, σ_b] × [x_a, x_b] × [ν₀, ν₁] gets a Stein majorant (p_i, W_i, M_i) at each end ν_i:
- p_i(s) = a₀ + a₁s + a₂s² + a₄s⁴ + a₆s⁶, with a₁, a₆ ≥ 0;
- W_i is piecewise linear on the physical knots sref·KN and constant beyond the last one. KN are the small-t knots
  0, 0.05, …, 1.6, 1.8, 2, 2.3, 2.6, 3, 3.5, 4, 5, 6, 8, 10, and sref is the box's σ-midpoint rounded to 1/20;
- M_i > 0;

such that

    Q_c(s) = p_i(s) + Ψ_{h_{W_i,c}}(s) − Ψ₅(s; ν_i) ≥ 0   for all s ≥ 0,   at c = σ_a² and at c = σ_b².

Q_c is affine in c, so it holds for every σ in the box. Then, for every law in the x-box,
E Ψ₅(σR; ν_i) ≤ J_i(σ, x) + M_iσ⁴x²/24. The rest is stage 2 unchanged:
- convexity in ν;
- the cubic endpoint lemma in x (the Stein term only adds to the x² coefficient);
- the exact tensor-Bernstein bound in (σ, λ).

**Verification of Q_c ≥ 0 (C, `stein2.py`).**
- **Upper bound on Ψ₅.** On each cap segment, Ψ₅ ≤ the chord of the caps (convexity in s). Beyond the last node,
  Ψ₅ ≤ C_N + Lip(s − s_N).
- **Closed form of Ψ_h.** h is piecewise cubic, so Ψ_h = (2/π) Σ_j Σ_k h_jk s^k [I_k(u_{j+1}) − I_k(u_j)], with
  u_j = min(1, x_j/s) and I_k the primitives of u^k/√(1 − u²) for k ≤ 3.
- **Cells.** Cells of width ≤ 1/100 cover [0, 30] and are bisected up to 12 times.
- **Second-order cell bound (P).**
  - Split h = h_C¹ + Σ_j J_j (y − x_j)₊, where J_j are the jumps of h′ at the knots.
  - K_j = Ψ[(y − x_j)₊] = (2/π)(√(s² − x_j²) − x_j arccos(x_j/s))₊ is convex. So each term with J_j > 0 is replaced
    by its tangent at the left cell end, which is a lower bound.
  - What remains has second derivative ≤ p″ + ½ sup_{[0,b]} (h″)⁺ (using ∫₀¹u²/√(1 − u²) = π/4).
  - Hence on [a, b]: Q ≥ min(Q(a), Q(b) − Σ_{J_j>0} J_j [K_j(b) − K_j(a) − K_j′(a)(b − a)]) − M(b − a)²/8.
- **Arithmetic, and the one numerical assumption.** All of this runs in interval arithmetic on doubles, rounded
  outward with nextafter after every operation. numpy's arcsin is widened by 8 ulp. The one numerical assumption is
  that libm's arcsin is accurate to 4 ulp; the small-t certificate makes the same assumption. Box bounds, tails,
  tiling and envelope are exact rational arithmetic.
- **Tail, s ≥ 30.** Ψ_h ≥ its quadratic part − D x_K/s, where D is an exact bound of |h − h_quad| on [0, x_K]. Then
  s·Q(s) is bounded below by an explicit degree-7 polynomial with rational coefficients, and that polynomial is
  checked positive on [30, ∞) exactly.
- **Tests.** The checker rejects:
  - a₀ lowered by 10⁻⁴;
  - c = 1.3σ_b²;
  - a₆ = 0 with a₄ < 0.

  A float scan on 3·10⁵ points agrees with the certified cell bounds.

**Solving (N; it only selects the data).**
- cvxpy + Clarabel SOCP on about 265 points with s ≤ 30. It uses a hat basis, angular tables, and a bidiagonal
  Cholesky factor of the tridiagonal Gram matrix.
- Constraints: |W_j| ≤ 6, margin 2·10⁻⁵ + 10⁻⁶s² + 10⁻⁷s⁴. Both majorants and both c are solved at once; the
  objective is the sampled box maximum.
- A float check on about 8000 points adds solver points (≤ 3 rounds). After the rigorous check, a₀ is lifted by the
  verified deficit when that deficit is ≤ 5·10⁻⁵.

**Cover (`cover2s.py`).**
- It is the stage-2 cover with merged ν-intervals. The nodes −0.08, −0.05, −0.025, −0.012, 0, 0.012, 0.024, 0.036,
  0.045, 0.06, 0.08 are all cap nodes, and an interval is split at a cap node once its σ- and x-widths are small.
- A box gets a Stein certificate when its polynomial bound exceeds the target, its σ-width is ≤ 1/16, its x-width is
  ≤ 1/2, and σ ≥ 0.3.
- **Targets** only steer the refinement: the stage-2 G⁺, minus a drop estimated from exact Stein bounds of a few wide
  boxes (`est_stein.py`), plus a slack (2·10⁻³ for 0.125–0.2, 3·10⁻³ for 0.25, 5·10⁻³ for the others).
- G⁺ ends up at about the target: the largest boxes are polynomial boxes just below it. So **each slack is room left
  unused**, about 1.5–2·10⁻³ on 0.125, for example, where the largest Stein box bound is 0.71829 against G⁺ = 0.71978.
  A tighter target buys it back at more cost.

**Stein rows (C).** The room is that of the row's active piece in the final envelope; the plain room is that of
the moments + radius envelope.

| row t | C_r plain (ρ fixed) | C_r Stein | drop | boxes (Stein) | target slack | largest Stein box / G⁺ | room plain → Stein |
|---|---|---|---|---|---|---|---|
| 0.125 | 0.7275507 | 0.7198461 | 7.70·10⁻³ | 917 (188) | 2·10⁻³ | 0.718286 / 0.719778 | 2.21·10⁻³ → 5.83·10⁻³ |
| 0.15 | 0.7381432 | 0.7285393 | 9.60·10⁻³ | 969 (230) | 2·10⁻³ | 0.726648 / 0.728477 | 2.31·10⁻³ → 9.92·10⁻³ |
| 0.2 | 0.7580300 | 0.7452906 | 1.27·10⁻² | 1026 (289) | 2·10⁻³ | 0.743758 / 0.745253 | 3.00·10⁻³ → 1.22·10⁻² |
| 0.25 | 0.7865588 | 0.7754996 | 1.11·10⁻² | 953 (211) | 3·10⁻³ | 0.770486 / 0.775490 | 5.54·10⁻³ → 1.82·10⁻² |
| 0.3 | 0.8194945 | 0.8104403 | 9.05·10⁻³ | 857 (147) | 5·10⁻³ | 0.803722 / 0.810440 | 1.00·10⁻² → 2.08·10⁻² |

- **Row 0.3, one patched box.** The cover had kept one box, ν ∈ [−0.025, −0.012], σ ∈ [0.7375, 0.75625],
  x ∈ [1.4375, 1.5], at its polynomial bound 0.815072. Its Stein attempt had a verified deficit of 3.5·10⁻⁴, above
  the automatic lift limit of 5·10⁻⁵.
  - It was re-certified with `certify_box_stein(maxref=5, lift_max=10⁻³)`: bound 0.794906.
  - The cover file records the patch, and the replay re-verifies the patched box like every other.
- **Row 0.125 now spans less.** It is active only on [0.0637, 0.1148], so its own room is set by the crossing with
  the small-t bound.

**Cost.** Stein boxes cost 30–90 s each on the loaded `big` (load 50–57 on 48 cores; at most 20 processes of mine).
A row took 45–75 minutes on 10 processes:
- 0.125: 917 boxes, 188 Stein;
- 0.15: 969, 230 Stein;
- 0.2: 1026, 289 Stein;
- 0.25: 953, 211 Stein.

Row 0.6 was started and stopped: Clarabel returned inaccurate solutions there and its Stein boxes ran for minutes
each. Rows 0.4, 0.5 and 0.55 were not started.

## 4. Envelopes (C)

Both envelopes are on [0, 886227/10⁶]. The small-t theorem is used on [0, t₁], the rows on [t₁, 886227/10⁶]. Room
means 500/701 − the maximum on the active piece.

| piece | moments + radius: active on | room | final (Stein rows): active on | room |
|---|---|---|---|---|
| small-t theorem | [0, 0.114594] | 2.21·10⁻³ | [0, 0.063736] | 5.83·10⁻³ |
| row 0.125 | [0.1146, 0.1399] | 2.21·10⁻³ | [0.0637, 0.1148] | 5.83·10⁻³ |
| row 0.15 | [0.1399, 0.1738] | 2.31·10⁻³ | [0.1148, 0.1464] | 9.92·10⁻³ |
| row 0.2 | [0.1738, 0.2205] | 3.00·10⁻³ | [0.1464, 0.2335] | 1.22·10⁻² |
| row 0.25 | [0.2205, 0.2752] | 5.54·10⁻³ | [0.2335, 0.2920] | 1.82·10⁻² |
| row 0.3 | [0.2752, 0.3518] | 1.00·10⁻² | [0.2920, 0.4098] | 2.08·10⁻² |
| row 0.4 (plain) | [0.3518, 0.4585] | 1.55·10⁻² | [0.4098, 0.4585] | 2.01·10⁻² |
| row 0.5 (plain) | [0.4585, 0.5272] | 2.01·10⁻² | same | 2.01·10⁻² |
| row 0.55 (plain) | [0.5272, 0.5686] | 1.88·10⁻² | same | 1.88·10⁻² |
| row 0.6 (plain) | [0.5686, 0.6470] | 1.13·10⁻² | same | 1.13·10⁻² |
| rows 0.70–0.886 | as in stage 2 | 9.6·10⁻³ → **3.73·10⁻⁴** | same | same |

**B₅ = max_t min = 0.7128940126**, attained at t = 0.84760 between the rows 0.845 and 0.85, so
**500/701 − B₅ = 3.7275·10⁻⁴** (stage 2: 3.8226·10⁻⁴). The Stein rows do not change B₅; they change the small-t side.
Binding band, room per row:

| row | 0.82 | 0.83 | 0.84 | 0.845 | 0.85 | 0.855 | 0.86 | 0.865 | 0.87 | 0.875 | 0.88 | 0.886 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| room ·10⁻⁴ | 7.38 | 4.74 | 4.00 | 3.73 | 3.73 | 3.84 | 4.38 | 5.39 | 6.37 | 8.44 | 11.10 | 13.90 |

Possible additions (not done):
- A Stein version of the dropped row 0.1 would raise the room on [0.064, 0.115] above 5.8·10⁻³. You asked to drop
  that row, so it was not rebuilt.
- Tighter targets would add the unused slack of the table in §3, about 1.5–2·10⁻³ on 0.125–0.2.
- Stein covers of 0.4–0.6 were not done.

## 5. Replay

`replay2b_all.py` is the single checker; `run_final.sh` is the one-command form. On `big` it was run in parts, so
that it could start while the last Stein cover was still running:
- `replay2b_partA.log`: rows 0.125–0.79 (caps, plain covers, and the Stein covers 0.125–0.25);
- `replay2b_partA2.log`: rows 0.80–0.85;
- `replay2b_partA3.log`: rows 0.855–0.886;
- `replay2b_partB.log`: the Stein cover of 0.3 (`--only 0.300L:stein`) and both envelopes for the full spec
  `rows2b.json`. That spec differs from the part-A spec only in the 0.3 Stein entry, which was checked;
- `replay2b_smallt.log`: the small-t certificate.

For every row:
- all 10194 node caps were recomputed by psi5 and are ≤ the stored caps;
- every box of every cover was re-verified: polynomial majorants exactly; Stein majorants at both c by the interval
  cells and the exact tail; exact Bernstein box bounds ≤ the stored ones;
- the tilings of (ν, σ, x) are exact (volume and pairwise disjointness; ν-interval ends are cap nodes);
- C_r is reproduced exactly.

Result: **ALL PASS** in every part. Small-t: `smallt/reverify.py` on all 40 node files (432 certificates: the 412 used ones and the two duplicate nodes 0.61, 0.81 from `big`), 0 problems; `smallt/assemble.py` gives N(η′_d) = 0.705808215…, and N + (1 − η′_d − 2/5)·(886227/10⁶)² ≤ 7058083/10⁷ holds exactly (4169 s on 4 processes).

**What is proved, computed and assumed.**
- **P:** the physical form of the Stein family (one rescaling of the cited statement) and the cell lemma of §3.
  Everything else is as in stage 2.
- **Inputs:**
  - Lean: moments, sixth moment, C₆;
  - ledger 3.7: ρ = 95133/10⁵;
  - the scalar Stein family: manuscript P, the same status as ρ;
  - the stage-2 node caps (C, recomputed by the replay);
  - the small-t theorem (P + C, re-run by the replay);
  - **K₅**, still a hypothesis on every row.
- **C:** all covers, majorants, Stein majorants, tails, tilings and envelopes, with the arcsin assumption for the
  Stein cells.
- **N:** the SOCP and LP solves and the targets; they only select data.

## 6. Files

All under `degree5-cert/cert2b/` (the run folder on `big` is deleted).
- Code:
  - `law2.py` (ρ fixed), `lpfloat2.py` (ρ fixed);
  - `stein2.py` (Stein majorants: closed form, interval cells, exact tail, SOCP, box bound, replay check);
  - `cover2.py` (stage-2 cover), `cover2s.py` (cover with Stein boxes and merged ν);
  - `run_rows2b.py`, `run_stein2b.py` (drivers), `est_stein.py` (target estimates);
  - `assemble2b.py` (rows → `out/rows2b.json` and the tables), `replay2b_all.py` (the single replay checker),
    `run_final.sh`;
  - `caps2.py`, `psi5.cpp`, `glconsts.h`, `envelope.py` (stage 2, unchanged).
- Data in `out/`:
  - `caps_*.json` (stage-2 caps, copied);
  - `cover_*.json` (plain covers, ρ fixed) and `coverS_*.json` (Stein covers);
  - `rec_*.json`, `recS_*.json`, `rows2b*.json`, `stage2_targets.json`, `stein_slack.json`;
  - logs `run1.log`, `runS*.log`, `replay2b_*.log`.
