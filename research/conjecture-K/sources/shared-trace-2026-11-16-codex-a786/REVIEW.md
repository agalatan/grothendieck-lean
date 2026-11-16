<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-shared-trace-2026-11-16/REVIEW.md (16 November 2026): review by a review worker of claude-b9ee. Only this line was added. -->
# Review of the third content-law package of codex-a786 ("shared trace", 16 November 2026)

Reviewer: a review worker of claude-b9ee (another session than the author's; no contact with the author).
16 November 2026. The package read the ledgers at `b3cca5048`. The statements of the rows it cites are unchanged since
(6.3.21 gained a literature note); the ledgers have grown by 6.3.26–6.3.35 and 4.20–4.26, which the package does not know.

- Package: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-shared-trace-2026-11-16/package/`
  (`README.md`, `PROOFS.md`, `SHARED_HOLOMORPHIC.md`, `TANGENT_OBSTRUCTION.md`, `AUDIT.md`, `LEDGER_PATCH.md`,
  `LITERATURE.md`, `rows.json`, `scripts/verify.mjs`, `results/replay.json`, `source_manifest.json`). All 11 files listed
  in its `SHA256SUMS` verify. `LITERATURE.md` and `source_manifest.json` hold links to private files; none is repeated here.
- Everything of mine: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-shared-trace-2026-11-16/review/`
  (`scripts/`, `logs/`, `data/`, and `package-copy/`, the scratch copy in which the replay ran). §10 lists the files.
- Labels as in `/Users/alingalatan/workspaces/grothe/research/README.md`: **P** re-derived on paper by me, **C** exact
  arithmetic (the package's replay, or my own scripts), **N** floating point (mine).
- Earlier packages of the same author and my reviews of them: ledger rows 6.3.27–6.3.29 and 4.20 (first), and
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/REVIEW.md` (second).

Notation of the package: Q_d = Y*GY − tr G with G a d × d matrix of independent standard complex Gaussians, independent
of the standard complex Gaussian vector Y ∈ ℂ^d; S = ‖Y‖² ~ Gamma(d, 1); R_d(S) = S² − 2S + d;
q = Σ_j a_jQ_{d_j} + W with independent blocks and W = Σ_b Z̄_bF_b(U). "Ratio" means ‖c[h]‖²/(δ·Ω̂[h]).

## 0. Verdict

1. **The theorems are correct and the proofs are complete, with one wrong display.** I re-derived `PROOFS.md`,
   `SHARED_HOLOMORPHIC.md` and `TANGENT_OBSTRUCTION.md` line by line. The signed Gamma identity (20) of `PROOFS.md` is
   printed with a wrong sign inside; its conclusion, the only thing used, is true (§2.3). Everything else stands.
2. **"Restricting content to the trace coordinate" is legitimate.** It is the symmetry (G, Y) → (UGU*, UY): the content,
   a linear form in G, is invariant under conjugation, so it is a multiple of tr G. Of the d² coordinates of G one
   carries content (§2.1).
3. **The no-factor step is the one of the blocks package**, in a simpler form: no sign conditioning, and the cross term
   vanishes because the fluctuation of the other blocks is centred and independent (§2.4).
4. **Every constant of the table is right**, and they are nearly sharp. The best constants valid for all profiles are
   0.520, 0.255, 0.151, 0.100, 0.040 at d = 2, 3, 4, 5, 8 (**N**, mine); the proved 6/11, 173/594, 175/888, 1361/10080,
   257/4932 are 5, 14, 31, 36, 29 % above them (§2.5).
5. **The holomorphic companions (Theorem 3)**: correct. I re-derived every identity in (d, λ) and all the "continuum
   certificates" with other software (§3).
6. **The tangent obstruction is correct and uniform in m**, not a statement at m → ∞. It is consistent with the
   constants 77/(9(m + 3)) → 0, which use the one operation the obstruction excludes. It is also nearly tight: the
   single tangent divergence of the signed-pairing package is within 2.6 % of the best that any tangent control can
   give (§2.6).
7. **Replay:** `scripts/verify.mjs` passes in a scratch copy and reproduces `results/replay.json` byte for byte.
8. **Numerics:** with the row profiles Q₂ gives at most 0.19–0.31 on the band (rows 0.80 … 0.855), Q₃ 0.13–0.19; the
   proved constants are 1.5 to 2.9 times above for single blocks (§4).
9. **Scope:** a class without self-interaction whose kurtosis falls like 8/d. It is not near the junta, Wick + shared
   drivers, H(X) + H(Y) or the spikes, and neither is the union of the classes proved so far (§5).
10. **Two additions of mine** (§2.5, §2.6). The theorem and its proof also hold at d = 1, with Θ₁ = 5/3: any number of
    independent blocks X_j(|Y_j|² − 1) with bulk (the blocks package has 39/16 there). And at d = 1 the trace argument
    *is* the tangent control of the signed-pairing package, with the multiple 1/2 in place of the best one.

## 1. Verdict per statement

| # | statement | verdict | remark |
|---|---|---|---|
| 1 | `PROOFS` §1: Q_d = Σ_a X_a(Y*H_aY − tr H_a) for a Hermitian orthonormal basis is Y*GY − tr G with G Ginibre | **correct** | the H_a are a complex orthonormal basis of M_d(ℂ) |
| 2 | (8): Σ_a(Y*H_aY − tr H_a)² = ‖YY* − I‖²_HS = R_d(S); (9): the conditional variance A | **correct** | |
| 3 | (10), (11): only the trace coordinate carries content; c_j = (a_j/√d_j)·E[(S_j − d_j)τh(Aτ)] | **correct** | §2.1 |
| 4 | (12): E[(S − d)g(S)] = E[S·g′(S)] | **correct** | |
| 5 | (13), (14): the signed pairing, N_j = (S_j − d_j)(A − u) + a_j²S_jR′(S_j) | **correct** | needs k ∈ C¹ only; equals the direct form to 2·10⁻⁸ for the row profiles (N) and exactly on 154 polynomial coordinate checks |
| 6 | (15): dual form with dμ = (Aτ/u)dP | **correct** | |
| 7 | (16), (17): u_d = d², L_d = 2d(2d² + d + 1), N_d, E N_d = 4d², E N_d² | **correct** | symbolic |
| 8 | **(20)**: E[(d − 2S)/R] = −E[S(R + R′)/R²] = −E[S(S² + d − 2)/R²] ≤ 0 | **the equalities are wrong; the inequality is true** | correct form: −E[S(R − R′)/R²], R − R′ = (S − 2)² + d − 2 ≥ 0 for d ≥ 2 (§2.3) |
| 9 | Lemma 2, (18): B_d ≤ d⁴ − d³ + 14d² + 6d + 4, b_d ≤ 1; the division (21) | **correct** | uses only the sign in (20) |
| 10 | Lemma 2, (19): the inverse-moment bounds, d > 2 | **correct** | |
| 11 | (22)–(25) and Theorem 1, formula (5): any number of blocks | **correct** | §2.4 |
| 12 | (4), (6), (26): Θ₂ = 6/11, Θ₃ = 173/594, Θ₄ = 175/888, sup_{d≥3}Θ_d = 173/594, Θ_d = O(d^{−2}) | **correct** | both requirements on θ symbolically; the second also exactly for d = 2 … 2000 |
| 13 | §6: the six profiles are continuous and bounded; p₀ > 1/2, p₁ > 1/10, p₂ > 0 | **correct** | p₀ ≥ 0.534, p₁ ≥ 0.109 on the six rows; agrees with my recomputed profiles |
| 14 | (27), (28): h(v) = v gives ‖c‖² = 16Σa_j⁶d_j³; lower coefficient 16/(3(2d² + d + 1)); χ = 4(2d² + d + 1)/d³ | **correct** | |
| 15 | `SHARED_HOLOMORPHIC` (2)–(5): A_λ = R_d + λS², u_λ, L_λ, E N_λ = 4u_λ, the two requirements | **correct** | symmetry: (G, Z, Y) → (UGU*, UZUᵀ, UY) |
| 16 | (6)–(9): E[N_λ²/A_λ] ≤ ℬ_{d,λ}; the remainder C_{d,λ}(d − 2S) + J₀ with C ≥ 0, J₀ ≤ 0 | **correct** | again only the sign in (20) |
| 17 | (10)–(12): the certificates at d = 2, 3, 4 and for d ≥ 3 | **correct** | re-derived with sympy |
| 18 | (13)–(16): the inverse-moment bound with λ; Θ^inv ≤ Θ^pol for d ≥ 5 | **correct** | re-derived with sympy |
| 19 | Theorem 3: the same Θ_d for every λ ≥ 0, any number of blocks | **correct** | |
| 20 | `TANGENT_OBSTRUCTION` (1), (2): δ = 4 + 12/m; c[h] = ⟨Z, q·k′⟩ with Z = X(2\|X\|²C − 1), C = 1 + P/√m; ⟨Z, q⟩ = 4/√m | **correct** | 6.3.23 for q = X·P_m; the Z of 4.21 |
| 21 | Theorem 2, (5)–(9): θ(Z + N) ≥ (32/m + 9μ_m²/(1 − β_m²))/(6 + 18/m) ≥ 6/e² for every N in the tangent closure | **correct** | §2.6, with a sharper floor |
| 22 | §3 there, (10)–(12): the reflection ℛ and ℛZ | **correct** | ℛ = E[· \| q, \|P\|], the conditioning of 6.3.28 and 4.22 |
| 23 | README table and the paragraph on thresholds | **correct** | |
| 24 | `LEDGER_PATCH.md` | statements correct | placement and wording: §7 |

## 2. The re-derivation: points that needed care

**2.1 Why only the trace coordinate.** Given Y (and U), q is a proper complex Gaussian of variance A, and the regression
of G_ab on q gives the content matrix E[(Ȳ_aY_b − δ_ab)·τh(Aτ)]. A depends on Y through S = ‖Y‖² only. So:
- for a ≠ b the entry vanishes (rotate the phase of Y_a alone);
- the diagonal entries are equal (permute the coordinates), each (1/d)·E[(S − d)τh(Aτ)].
The content matrix is a multiple of the identity: the content lies along tr G/√d, with the coefficient (11). In one
sentence: (G, Y) → (UGU*, UY) fixes q, so the content, a linear form in the coordinates, lies in the fixed space of
U(d), which is spanned by tr G (ledger 11.31a, here with a non-trivial fixed space). The package says it through the
conditional covariance S·I/d of Y given S; the two arguments agree. This is what makes d² directions cost nothing.

**2.2 Moments of Q_d.** u = E R_d = d²; δ = 2·Var R_d = 4d(2d² + d + 1); χ = 4(2d² + d + 1)/d³, i.e. 5.5, 3.26, 2.31,
1.79, 1.07 at d = 2, 3, 4, 5, 8, and χ ~ 8/d → 0. For h(v) = v: c = 4d^{3/2}, Ω̂ = 3d²/4, ratio 16/(3(2d² + d + 1)).
All checked symbolically (`review/logs/exact_checks3.log`).

**2.3 The identity (20) is misprinted; its sign is right.** From (12) with g = 1/R:
E[(S − d)/R] = −E[S·R′/R²], hence

    E[(d − 2S)/R] = E[S·R′/R²] − E[S/R] = −E[S(R − R′)/R²] = −E[S((S − 2)² + d − 2)/R²] ≤ 0   (d ≥ 2).

The package prints R + R′ = S² + d − 2 in place of R − R′. Numerically (30 digits): at d = 2 the left side is −0.3730
and the printed right side −1.1574; at d = 3, −0.2324 against −0.7206. The correct right side agrees to 10⁻²⁰ for
d = 2, 3, 4, 5, 8, 16. Only the sign of E[(d − 2S)/R] is used afterwards (for b_d ≤ 1, for B_d ≤ E Q_d, and in
`SHARED_HOLOMORPHIC` §2), so nothing else changes. `verify.mjs` has a check labelled "sign in Gamma identity" (line 60);
it verifies the algebra R + R′ = S² + d − 2 of the misprinted form, not the identity.

**2.4 Any number of blocks: the same step as in the blocks package.** With ξ_j = A − a_j²R_j − E[A − a_j²R_j]
(centred, independent of S_j, variance L − L_j, where L = Var A and L_j = a_j⁴L_{d_j}): N_j = a_j²N_{d_j} + (S_j − d_j)ξ_j.
- Pointwise, since Σa_j²R_j ≤ A: (Σe_ja_jN_j/√d_j)² ≤ A·Σe_j²N_j²/(d_jR_j). As in the blocks package this single
  inequality replaces the square of a sum over blocks by a sum with weights e_j².
- E[N_j²/R_j] = a_j⁴B_{d_j} + (L − L_j)b_{d_j}: the cross term is zero because ξ_j is centred and independent of block j.
- The two requirements θ ≥ (B_d + 16d²)/(3dL_d) and θ ≥ b_d/(3d) turn the sum into 3θ·Σe_j²(L_j + L − L_j) = 3θL.
  The budgets L_j and L − L_j are complementary, as J_e and χ − J_e were.
Differences from the blocks package: there is no conditioning on a sign (N_j is used as it is), no exact zero is
needed (ξ_j is centred from the start), and only k ∈ C¹ is used. The second requirement is where the bulk and the
other blocks enter. It is never the binding one: with b_d ≤ min(1, d(d + 2)/((d − 2)(d − 1)²)) it is at most 0.38·Θ_d
(at d = 3; exact, d = 2 … 2000).

**2.5 The constants, and how sharp they are.** Θ^pol_d = (B^pol_d + 16d²)/(3dL_d) and Θ^inv_d = (B^inv_d + 16d²)/(3dL_d),
both verified; Θ₂ … Θ₈ as in the table of the README; Θ^pol − Θ^inv has the sign of d⁶ − 4d⁵ − 5d⁴ + 16d³ − 10d² + 8d + 8,
positive from d = 5; (26) proves sup_{d ≥ 3}Θ_d = Θ₃. The sharp constant for all profiles is (6.3.30, one content
direction) θ*(Q_d) = (E[V·m(V)²] + 16d²)/(3dL_d) with m(V) = E[N_d/R_d | V]; the proof replaces E[V·m(V)²] by
E[N_d²/R_d] = B_d (Jensen) and then B_d by a rational bound. Values (**N**, `review/logs/sharp_trace.log`; the exact
supremum over polynomial profiles with deg k′ ≤ 5 is 0.5185, 0.2540, 0.1494, 0.0981, 0.0398 at d = 2, 3, 4, 5, 8, **C**):

| d | χ | h(v) = v | θ*(Q_d), sharp | the proof with B_d exact | proved Θ_d | Θ_d/θ* |
|---|---|---|---|---|---|---|
| 1 (see below) | 16 | 1.3333 | 1.5473 | 5/3 | (5/3) | 1.08 |
| 2 | 5.50 | 0.4848 | 0.5202 | 0.5398 | 6/11 = 0.5455 | 1.05 |
| 3 | 3.26 | 0.2424 | 0.2552 | 0.2721 | 173/594 = 0.2912 | 1.14 |
| 4 | 2.31 | 0.1441 | 0.1510 | 0.1664 | 175/888 = 0.1971 | 1.31 |
| 5 | 1.79 | 0.0952 | 0.0995 | 0.1130 | 1361/10080 = 0.1350 | 1.36 |
| 8 | 1.07 | 0.0389 | 0.0404 | 0.0484 | 257/4932 = 0.0521 | 1.29 |
| 16 | 0.52 | 0.0101 | 0.0103 | 0.0128 | 17327/1333080 = 0.0130 | 1.26 |

- No argument valid for all profiles can bring Q₂ below 0.520: the threshold 0.37 of the row 0.80 is out of reach of
  such arguments on Q₂ (the package says so with 16/33). Q₃ is below it for every profile and energy.
- θ*/(value at h = v) falls from 1.07 at d = 2 to 1.02 at d = 16: numerically the truth approaches the lower bound
  8/(3d²); the proof gives 10/(3d²).
- The rational bounds on B_d cost 1, 7, 18, 19, 8 % at d = 2, 3, 4, 5, 8; no threshold depends on it.
- With companions the same Θ_d is far from sharp: θ* = 0.227 at (d, λ) = (2, 1), 0.075 at (3, 2), 0.044 at (3, 4).

**The case d = 1 (mine; P, exact instances C).** The theorem is stated for d ≥ 2, but Q₁ = X(|Y|² − 1) is covered by the
same proof. N₁ = S²(S − 1) and R₁ = (S − 1)², so N₁²/R₁ = S⁴ and (S − 1)²/R₁ = 1: B₁ = 24, b₁ = 1, L₁ = 8, and both
requirements hold with Θ₁ = (24 + 16)/24 = 5/3 = Θ^pol₁. The identity (20) is not needed (the remainder of (21) vanishes
at d = 1), and (12)–(15), (23)–(25) do not use d ≥ 2; R₁ > 0 almost surely is enough for the weighted Cauchy–Schwarz.
So Theorem 1 holds for d_j ≥ 1 with Θ₁ = 5/3.
- It gives 5/3 for any number of independent blocks X_j(|Y_j|² − 1), any amplitudes, with bulk and mixed with blocks of
  higher dimension. Among what I have reviewed this improves 39/16 (blocks package, rank one) and 55/16 (6.3.29), and
  puts X(|Y|² − 1) + bulk below the threshold 1.88 of the row 0.845. The package's `LEDGER_PATCH.md` mentions an older
  "general-matrix 5/3 theorem" of a packet I have not seen; whether that one covers several blocks and a bulk I cannot say.
- Checks: 35 exact polynomial instances with blocks of dimension 1, alone, several, with bulk and mixed
  (`review/logs/exact_blocks3.log`); with the row profiles my trace code at d = 1 reproduces the m = 1 values of the
  second review, computed there by another formula (0.1891/0.1628 and 0.2493/0.2207 at t = 0.80, 0.82, u = 0.5u*).
- Why d = 1 is different, and d ≥ 2 easy: R_d(S) = (S − d)²/d + (1 − 1/d)S². The first term is the square of the cofactor
  of tr G, which changes sign; the second is the conditional variance of the traceless part of the block. For d ≥ 2 it
  keeps R_d ≥ d − 1 away from zero, so no sign branches arise and no sign averaging is needed. In law,
  (q, tr G/√d, S) is that of X₀·(S − d)/√d + (1 − 1/d)^{1/2}·S·ξ with X₀, ξ, Y independent standard Gaussians: an
  equal-spectrum block X₀·P_d of weight 1/d² in a bath that shares its radius.

**2.6 The tangent obstruction.**
- *Statement.* q = X·P_m, u = 1, δ = 4 + 12/m, Z = X(2|X|²C − 1) with C = 1 + P_m/√m, so that c[h] = ⟨Z, q·k′(|q|²)⟩ for
  every profile (6.3.23; in `TANGENT_OBSTRUCTION.md` S denotes |X|²). The "controls" are the elements N of 𝒯, the L²
  closure of the Gaussian divergences of smooth vector fields v of polynomial growth with D_vq = D_vq̄ = 0. The
  "Cauchy–Schwarz" is the one in the norm of the whole law: |⟨R, qk′⟩|² ≤ (‖R‖² + |⟨R, q⟩|²)·(‖qk′‖² − ½|⟨q, qk′⟩|²),
  i.e. the certificate θ(R) = (2/(3δ))(‖R‖² + |⟨R, q⟩|²). The claim: for every N ∈ 𝒯,
  θ(Z + N) ≥ (32/m + 9μ_m²/(1 − β_m²))/(6 + 18/m) ≥ 6/e², with μ_m = E|P_m|, β_m = E[P_m|P_m|].
- *Proof, checked.* F = X|P| = q·sign P is constant along every such v (D_vF = sign P·D_vq = 0; |P| is Lipschitz), so
  ⟨N, F⟩ = 0 = ⟨N, q⟩. Bessel on the orthogonal pair q, F − β_mq gives the bound, with ⟨Z, F⟩ = 3μ_m + 4β_m/√m.
  μ_m = 2m^{m−1/2}e^{−m}/(m − 1)! increases from 2/e. All the rational comparisons are right.
- *Uniform in m, not asymptotic.* The bound holds for each m ≥ 1. Its value decreases from 1.594 at m = 1 to
  3/π = 0.955 as m → ∞ (N); 6/e² = 0.812 is a convenient lower bound for all of them, not the limit.
- *A sharper form of the same obstruction (P, mine).* 𝒯 is orthogonal to every function of (q, sign P), not only to q
  and F: functions a(q)·1_{P>0} + b(q)·1_{P<0} with a, b smooth and supported away from 0 are smooth, constant along
  tangent fields, and dense in L²(σ(q, sign P)). So θ(Z + N) ≥ θ_sign := (2/(3δ))(‖E[Z | q, sign P]‖² + 16/m) for every
  N ∈ 𝒯. Values (N, `review/logs/tangent_numbers.log`, `sharp_trace.log`):

  | m | no control | one tangent divergence (4.21) | θ_sign: floor for all tangent controls | the package's bound (5) | θ*: both branches averaged | 77/(9(m+3)) |
  |---|---|---|---|---|---|---|
  | 1 | 2.375 | 1.659 | 1.639 | 1.594 | 1.547 | 2.139 |
  | 2 | 2.467 | 1.529 | 1.506 | 1.468 | 1.301 | 1.711 |
  | 4 | 2.571 | 1.379 | 1.354 | 1.323 | 0.981 | 1.222 |
  | 5 | 2.604 | 1.332 | 1.307 | 1.277 | 0.874 | 1.069 |
  | 6 | 2.630 | 1.295 | 1.270 | 1.241 | 0.788 | 0.951 |
  | 8 | 2.667 | 1.242 | 1.216 | 1.189 | 0.659 | 0.778 |
  | 21 | 2.757 | 1.111 | 1.085 | 1.062 | 0.322 | 0.356 |
  | 64 | 2.806 | 1.040 | 1.014 | 0.993 | 0.121 | 0.128 |
  | ∞ | 2.833 | 1.000 | 0.974 | 0.955 | 0 | 0 |

- *Relation to the signed-pairing package.* Its constant with ONE tangent divergence and no averaging (4.21;
  209/126 at m = 1, limit 1) is within 1.2 to 2.6 % of θ_sign: more tangent controls, of any degree, could gain at most
  that. Its values 13/10, 3/5, 7/20 for m ≥ 4, 12, 22 (4.22) come after averaging the two sign branches, which is
  outside 𝒯. The obstruction says that 3/5 and 7/20 cannot be had without it; by the sharper floor neither can 13/10
  at m = 4 and 5 (1.354, 1.307), while from m = 6 one tangent divergence gives it (1.295; 4.21 for κ ≤ 1/6).
- *Relation to θ*(q) of my first review* (1.547, 0.981, 0.322 at m = 1, 4, 21): θ* = θ(E[Z | q]) is the best constant of
  any argument valid for all profiles. E[Z | q] averages over the whole fibre {q = w}, which has two components, P > 0
  and P < 0. Tangent flows stay in one component, so they reach E[Z | q, sign P] at best: θ* ≤ θ_sign, with a gap
  that grows from 6 % at m = 1 to everything as m → ∞.
- *Consistency with 77/(9(m + 3)) → 0.* Yes. That constant (6.3.28) and those of the blocks package come from
  replacing P by E[P | |P|], which is exactly the reflection ℛ of §3 of the note: not a tangent control. At m = 1 the
  first package's 2.139 is even above the tangent values; sign averaging pays only as m grows.
- *The trace argument at d = 1 is a tangent control (C).* At m = 1 the representative of this package is
  q·N₁/R₁ = X·|Y|⁴, and X·|Y|⁴ = Z + N/2 with N = X(2P² + 4C − 4|X|²C) the tangent divergence of 4.21. Exactly:
  ‖Z‖² = 41, ⟨Z, N⟩ = −38, ‖N‖² = 84, so θ(Z) = 19/8, θ(Z + N/2) = 5/3 and the best multiple 19/42 gives 209/126.
  So the three packages sit on one line at m = 1: 19/8 → 5/3 → 209/126 → floor 1.639 → (with sign averaging) 1.547.

## 3. Replay and independent checks (C)

**Replay.** `node scripts/verify.mjs` (Node 24.14.0, 6 s) in `review/package-copy/`: status "C PASS";
`results/replay.json` reproduced byte for byte. The script imports `node:assert`, `fs`, `path`, `url` only; it reads
`rows.json` and writes that one file; no network.

**What it checks.**
- Symbolic identities in d (and in (d, λ) for Theorem 3): the Gamma moments, N_d, the polynomial division and its
  remainder, the inverse-moment formulas, the two Θ formulas; nonnegativity after a shift of d ("for all d ≥ d₀") and
  coefficient-wise in λ ("for all λ ≥ 0"). These are proofs of polynomial inequalities, not samples.
- Eight cubic models with an independent Wick-monomial engine on the entries of G (up to 60 complex coordinates):
  E|q|², E|q|⁴, E|q|⁶ and **every** content coordinate for h = 1, v, v², the zero ones included.
- 48 polynomial-profile instances (8 models × 6 profiles): the direct content equals the signed pairing (14); the
  inequality holds with Θ = max Θ_{d_j}; for h = v the content is 16Σa_j⁶u_j²/d_j.
- Six rows: rational inequalities implying p₀ > 1/2, p₁ > 1/10, p₂ > 0. No profile is evaluated.
- The rational constants of the obstruction (e < 68/25, 6/e² > 4/5).
- **Not** checked by it: the Gamma identity (20) (see §2.3), the Cauchy–Schwarz allocation, the obstruction's proof.

**The continuum certificates, independently** (`review/scripts/exact_checks3.py`, sympy): I re-derived all of them, not
two: (11) at d = 2, 3, 4 (800λ + 1220λ², 69336λ + 88020λ², 91200λ + 92832λ²); (12) (the three coefficient polynomials
at d = 3 + x); the remainder (8)–(9) and the nonnegativity of its three brackets in (d − 2, λ); (13); the factorisation
(14)–(15) and the positivity of every coefficient of F(4 + x, λ); (16). All as printed.

**Own exact instances** (`review/scripts/exact_blocks3.py`, own moment code): u and δ of the eight stored models
reproduced; (11) = (14) on 154 coordinate checks; the inequality on 91 instances (35 of them with blocks of
dimension 1); the polynomial suprema of §2.5; the identities of the last item of §2.6.

## 4. Independent numerics with the row profiles (N)

Method (`review/scripts/trace_blocks.py`): the conditional variance depends on Y_j through S_j only, so each block is a
one-dimensional Gamma integral; several blocks and the bulk by the smoothing of the second review. No Monte Carlo was
needed. Validation: h(v) = v to 10⁻¹⁵; the signed pairing (14) against the direct form (11) to 2·10⁻⁸ on every model,
row and energy; Q₁ against the second review (§2.5). Accuracy of the ratios: about 10⁻⁷ relative, given my profile
tables (those of the first review, accurate to 10⁻¹⁵ at the nodes).

Largest ratio over u/u* ∈ {0.5, 0.75, 1, 1.3} and both sectors (always at 0.5u*; the ratio decreases in u):

| model | χ | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 | at 0.02u*, t = 0.80 | u → 0 | proved Θ |
|---|---|---|---|---|---|---|---|---|---|---|
| Q₂ | 5.50 | 0.189 | 0.222 | 0.267 | 0.280 | 0.296 | 0.313 | 0.453 | 0.485 | 6/11 = 0.545 |
| Q₃ | 3.26 | 0.129 | 0.146 | 0.166 | 0.172 | 0.178 | 0.185 | 0.234 | 0.242 | 173/594 = 0.291 |
| Q₄ | 2.31 | 0.089 | 0.098 | 0.109 | 0.112 | 0.116 | 0.119 | 0.141 | 0.144 | 175/888 = 0.197 |
| Q₈ | 1.07 | 0.030 | 0.032 | 0.034 | 0.034 | 0.035 | 0.035 | 0.039 | 0.039 | 257/4932 = 0.052 |
| Q₂ with companion, λ = 1 | 4.96 | 0.101 | 0.116 | 0.134 | 0.140 | 0.146 | 0.153 | 0.205 | 0.215 | 6/11 = 0.545 |
| Q₃ with companion, λ = 2 | 3.06 | 0.042 | 0.047 | 0.052 | 0.053 | 0.055 | 0.057 | 0.068 | 0.070 | 173/594 = 0.291 |
| Q₂ + Q₃, weights ½, ½ | 2.19 | 0.113 | 0.125 | 0.141 | 0.146 | 0.150 | 0.155 | 0.191 | 0.197 | 6/11 = 0.545 |
| 2 × Q₂ (0.4, 0.4) + bulk U²Z̄ 0.2 | 2.16 | 0.095 | 0.105 | 0.118 | 0.121 | 0.125 | 0.128 | 0.154 | 0.158 | 6/11 = 0.545 |
| Q₃ (0.6) + diffuse bulk 0.4 | 1.17 | 0.083 | 0.093 | 0.105 | 0.108 | 0.112 | 0.115 | 0.141 | 0.145 | 173/594 = 0.291 |
| Q₂ (λ = 1), Q₃, Q₄ (0.3, 0.3, 0.2) + diffuse bulk 0.2 | 0.83 | 0.044 | 0.048 | 0.052 | 0.053 | 0.054 | 0.055 | 0.062 | 0.063 | 6/11 = 0.545 |
| row threshold | | 0.37 | 0.64 | 1.33 | 1.88 | 2.5 | 3.7 | | | |

- The proved constant is an upper bound in all 720 evaluations (10 models, 6 rows, 6 energies, 2 sectors).
- For single blocks it is 1.5 to 2.9 times the band values, much closer than in the first two packages (3 to 42 times):
  the constants are within 5–36 % of the sharp ones, and the ratio varies less with the energy than for X·P_m.
  With companions or several blocks it is 2.5 to 12 times above: the theorem keeps the constant of the smallest block.
- Q₂ on the row 0.80: 0.189 on the band, threshold 0.37, proved 0.545. At low energy the ratio rises (0.360 at 0.1u*,
  0.453 at 0.02u*, limit 16/33): the threshold holds on the band and fails somewhere below 0.1u*, as for X(|Y|² − 1).
  (The band value of X(|Y|² − 1) at this row is 0.189 too; a coincidence, 0.249 against 0.222 at the next row.)
- Every other pair (model, row) of the table is below its threshold at all six energies.

## 5. Scope

Q_d has d² candidate content directions, the entries of G, all sharing the cofactors Ȳ_aY_b − δ_ab; by symmetry one of
them, the trace, carries content. Its normalised fourth cumulant is χ = 4(2d² + d + 1)/d³: 5.5, 3.26, 2.31 at
d = 2, 3, 4, about 8/d for large d, so χ → 0 and the ratio falls like d^{−2}. In law the block is an equal-spectrum
factor X₀·P_d of weight 1/d² in a Gaussian bath that shares its radius (§2.5), and at d = 1 it is X(|Y|² − 1) itself
(χ = 16). So in kurtosis the small blocks lie inside the band where the content lemma is needed (its open item speaks
of χ ≈ 2–16 in `CONTENT_LEMMA_D5.md`), but in structure the family starts at the one hard family that the earlier
classes already contain and moves away from the hard corner as d grows. The union of the classes proved so far — X·P
with a Hermitian cofactor (6.3.27–6.3.28, 4.21–4.22), independent blocks of those with a decoupled bulk (blocks
package), the shared-factor classes of the signed-pairing packages (a shared block with a Hermitian basis or complex
matrices; not seen by me), and Q_d with holomorphic companions — has one common feature: every coordinate that carries
content enters linearly, with a cofactor that does not contain it. The junta X(|X|² − 2) (χ = 42), Wick + shared drivers (35.4 in the instance of
the study), H(X) + H(Y) (21) and the spikes c·H(y) + diffuse bulk (42c⁴) are all built on the Wick monomial, a driver
times a function of its own modulus; none is in the union (4.23 treats one such driver only as a limit model), and on the junta every profile-free constant
is at least 256/63 (5.000 exactly, 6.3.30), against 1.547 for X(|Y|² − 1). **The union is not near the hard
families**; of the study's families it contains only X(|Y|² − 1) and its bulk version.

Rows 0.80 and 0.82 on the band: nothing changes. The new class is below both thresholds for d ≥ 3 at all energies, and
Q₂ on the band numerically; none of this concerns the junta-like cubics that bind those rows.

## 6. What the obstruction should be recorded as

It refutes one architecture, not the inequality, and the package says so. The precise content:

> For q = X·P_m and the representative Z = X(2|X|²C − 1), C = 1 + P_m/√m, of 6.3.23, no element N of the closure of
> tangent divergences (vector fields v with D_vq = D_vq̄ = 0, any degree, any number) makes the law-norm certificate
> (2/(3δ))(‖Z + N‖² + |⟨Z + N, q⟩|²) smaller than (32/m + 9μ_m²/(1 − β_m²))/(6 + 18/m), which is at least 6/e² for every m.
> Reason: tangent fields preserve sign P on the fibres of q.

It does not concern: profile-specific estimates (properties of k′ beyond its norm), non-local operations (the
reflection (X, P) → (−X, −P), i.e. conditioning on |P|), other starting representatives that already contain such
operations, or other cubics. For a general cubic the analogous statement would need the components of the fibres of
q; the package leaves that open. Q_d with d ≥ 2 shows the other side: there the conditional variance does not vanish
and an argument without sign averaging reaches within 5–36 % of the sharp constant.
The `LEDGER_PATCH.md` proposes an entry in §13 (false statements) as well. I would not put it there: no ledger row
asserts that tangent controls suffice. One entry in §14 (routes that do not work) is enough.

## 7. Proposed ledger rows (placeholder numbers)

"KST" stands for this package. Text to be edited by claude-b9ee. The package's own placements ("after 6.3.25") predate
6.3.26–6.3.35.

**K ledger, §6.3** (columns: # | family and statement | constant | status | where):

| # | family and statement | constant | status | where |
|---|---|---|---|---|
| 6.3.D1 | **Shared matrix blocks: content in the trace direction.** Q_d = Y*GY − tr G, G a d × d matrix of independent standard complex Gaussians, Y ∈ ℂ^d standard, d ≥ 2 (d² drivers sharing all cofactors; χ = 4(2d² + d + 1)/d³). For q = Σ_ja_jQ_{d_j} + W with independent blocks, any amplitudes, any number of blocks and the bulk of 6.3.29: ‖c[h]‖² ≤ max_jΘ_{d_j}·δ·Ω̂[h] for every real continuous profile of polynomial growth and every energy, Θ_d = min(Θ^pol_d, Θ^inv_d) (the second for d ≥ 4), Θ^pol_d = (d⁴ − d³ + 30d² + 6d + 4)/(6d²(2d² + d + 1)), Θ^inv_d = (20d³ − 51d² + 28d − 4)/(3d(d − 2)(d − 1)(2d² + d + 1)). Mechanism: (G, Y) → (UGU*, UY) fixes q, so the content is a multiple of tr G (11.31a with a fixed space); the conditional variance R_d(‖Y‖²) = (S − 1)² + d − 1 depends on the radius only and does not vanish; a Gamma integration by parts gives a signed scalar pairing; blocks are combined as in 6.3.A1 with the complementary budgets L_j and L − L_j. In law the block is X₀·P_d (6.3.28, m = d) of weight 1/d² in a bath sharing its radius | Θ₂ = 6/11, Θ₃ = 173/594 = sup_{d≥3}Θ_d, Θ₄ = 175/888, Θ₅ = 1361/10080, Θ₈ = 257/4932; Θ_d ~ 10/(3d²). h(v) = v gives exactly 16/(3(2d² + d + 1)). Sharp profile-free constants θ* = 0.520, 0.255, 0.151, 0.100, 0.040 at d = 2, 3, 4, 5, 8 (**N**, review): no profile-free bound gives 0.37 at d = 2. Degree-5 row profiles on u/u* ∈ [0.5, 1.3]: at most 0.31 (d = 2), 0.19 (d = 3), 0.12 (d = 4) (**N**) | **P** (codex-a786; re-derived line by line by a review worker of claude-b9ee, who corrects the display (20): E[(d − 2S)/R] = −E[S((S − 2)² + d − 2)/R²]); constants and polynomial certificates **C** (replayed; re-derived with other software) | KST `PROOFS.md`; `scripts/verify.mjs`; `REVIEW.md` §§2–4 |
| 6.3.D1a (reviewer's addition; not in the package, not reviewed by anyone else) | **… and at d = 1.** The proof of 6.3.D1 holds for d_j ≥ 1 with Θ₁ = 5/3 (N₁²/R₁ = S⁴, (S − 1)²/R₁ = 1). So any number of independent blocks X_j(\|Y_j\|² − 1), any amplitudes, with the bulk of 6.3.29 and with blocks Q_d, has the constant 5/3 (6.3.A3 has 39/16 at rank one; 6.3.29 has 55/16). At d = 1 the representative is X·\|Y\|⁴ = Z + N/2, Z and N as in `../higher-degree/STATUS.md` 4.21, whose best multiple gives 209/126 without bulk | 5/3; sharp 1.547 for the single block (6.3.30) | **P** (a review worker of claude-b9ee, author only) + **C** (35 exact polynomial instances; the identity Z + N/2) | KST `REVIEW.md` §§2.5, 2.6 |
| 6.3.D2 | **… with holomorphic companions sharing the block.** Each block may be Q_{d,λ} = Y*GY − tr G + √λ·Σ_{a,b}Z̄_abY_aY_b, λ ≥ 0, with the same Y: the bound of 6.3.D1 holds with the same Θ_d (d ≥ 2). The conditional variance is R_d(S) + λS², still radial | same constants for every λ ≥ 0; they are then far from sharp (θ* = 0.227 at d = 2, λ = 1, **N**) | **P** (same author and review) + **C** (polynomial certificates in (d, λ), replayed and re-derived) | KST `SHARED_HOLOMORPHIC.md`; `REVIEW.md` §§2.5, 3 |

**K ledger, §14** (routes that do not work; an item in the style of that section):

14.D1. **Tangent controls instead of the averaging of sign branches.** For q = X·P_m (6.3.28) and the representative
Z = X(2|X|²C − 1) of 6.3.23, every N in the L² closure of tangent divergences (vector fields with D_vq = D_vq̄ = 0, of any
degree and number) has (2/(3δ))(‖Z + N‖² + |⟨Z + N, q⟩|²) ≥ (32/m + 9μ_m²/(1 − β_m²))/(6 + 18/m) ≥ 6/e² > 4/5,
μ_m = E|P_m|, β_m = E[P_m|P_m|], because q·sign P is constant along such fields. So the thresholds 0.37 and 0.64 cannot be
reached on these cubics by tangent controls and the law-norm Cauchy–Schwarz alone, for any m. The bound is 1.594 at
m = 1 and tends to 3/π. A sharper floor is θ(E[Z | q, sign P]) = 1.639, 1.354, 1.307, 1.085 at m = 1, 4, 5, 21 and 0.974
in the limit (the review; **N**): the one tangent divergence of `../higher-degree/STATUS.md` 4.21 is within 2.6 % of it,
and 13/10 needs the sign averaging at m = 4, 5. The constants of 6.3.28 and of 4.22 (→ 0 with m) use the reflection
(X, P) → (−X, −P), which is not a tangent control. Not excluded: profile-specific estimates, non-local operations,
other cubics (for Q_d, d ≥ 2, the conditional variance does not vanish and no sign averaging is needed, 6.3.D1). **P**
(codex-a786; re-derived by a review worker of claude-b9ee, who adds the sharper floor); the values **N**.
KST `TANGENT_OBSTRUCTION.md`; `REVIEW.md` §§2.6, 6.

**Higher-degree ledger** (columns as there):

| ID | statement | scope | status | source |
|---|---|---|---|---|
| 4.D1 | **The same-law inequality of 4.19 (v) on shared matrix blocks.** For sums of independent blocks Q_{d_j} (with or without holomorphic companions) and a decoupled bulk (`../conjecture-K/STATUS.md` 6.3.D1–6.3.D2) the inequality holds with θ = max Θ_{d_j} for both tilted profiles of the six rows and every energy: below all six thresholds if every d_j ≥ 3 (173/594), below the last five if some d_j = 2 (6/11). **It closes no row.** The class has no self-interaction and its kurtosis falls like 8/d (5.5, 3.26, 2.31 at d = 2, 3, 4); with the classes of 4.20–4.22 and 4.A1 it still contains none of the junta, Wick + shared drivers, H(X) + H(Y) and the spikes. Measured (**N**): on the band the ratio is at most 0.19, 0.22, 0.27, 0.28, 0.30, 0.31 for Q₂ and 0.13–0.19 for Q₃ (rows 0.80 … 0.855), decreasing in u; for Q₂ at t = 0.80 it is 0.36 at 0.1u* and 0.45 at 0.02u*, so that threshold holds on a band of energies only (as in 4.20), and no profile-free bound gives it (sharp constant 0.520) | a structured class; the capped game; sampled energies | **P** (see the K ledger); the comparison **N** (review worker of claude-b9ee) | KST; its `REVIEW.md` §§4–5 |

## 8. Required corrections and suggestions

**Required:**
1. `PROOFS.md` (20): replace the middle and right members by −E[S(R − R′)/R²] = −E[S((S − 2)² + d − 2)/R²], and say
   "for d ≥ 2". The inequality and all that follows are unaffected.
2. `scripts/verify.mjs`, line 60, the check "sign in Gamma identity": it should check R − R′ = (S − 2)² + d − 2. As it
   stands it confirms the algebra of the misprint.

**For the ledger text** (`LEDGER_PATCH.md`): one entry for the obstruction (§14), not two; the placements predate
6.3.26–6.3.35 and 4.20–4.26; the degree-5 note should add that the first threshold holds for Q₂ on a band of energies
only (the patch already says that the global status is unchanged).

**Suggestions:**
1. Name the symmetry behind the trace restriction, (G, Y) → (UGU*, UY).
2. State the obstruction with its m-dependent bound and the limit 3/π, and add the floor θ(E[Z | q, sign P]); say that
   the single divergence of the signed-pairing package is already within a few per cent of it.
3. Include d = 1 (Θ₁ = 5/3), and say that the trace representative is there Z + N/2 of the signed-pairing package.
4. At d = 4, 5 a sharper bound on B_d would lower the constants by about 16 % (0.166 instead of 0.197 at d = 4).
5. Theorem 3 keeps Θ_d although the ratio falls with λ; a λ-dependent constant is available from (5) of that note.

## 9. Not checked

- The two input packages named in the package's `AUDIT.md` ("shared-factors" and "signed-pairing") are not part of this
  delivery; what I say about them rests on the ledger rows 4.21–4.22 and 6.3.30. The README's comparison "d ≥ 8 there,
  d ≥ 3 here" and the "general-matrix 5/3 theorem" of `LEDGER_PATCH.md` were not checked.
- `LITERATURE.md` and `source_manifest.json` (reading notes, hashes of sources).
- No certified numerics: §4 and the tables of §2.5 and §2.6 are floating point (ratios to about 10⁻⁷; the sharp constants
  and the obstruction numbers to about 10⁻⁶, with normalisation checks to 10⁻¹⁰; θ*(Q₁) agrees with the first review).
- The Wick engine of `verify.mjs` was read and replayed, not re-implemented; my own code reproduces u, δ and the
  identity (11) = (14) on the same models, and the vanishing of the non-trace coordinates was re-derived by hand.
- Whether θ(E[Z | q, sign P]) is attained inside the tangent closure (it is a lower bound for it; equality not proved).
- My extension to d = 1 has no second reader; it does not cover companions at d = 1 (Theorem 3 was not re-examined there).
- Whether the trace representative is "Z + a tangent divergence" for d ≥ 2 as it is for d = 1.
- Bulks other than UVZ̄, U²Z̄/√2 and the diffuse limit; dimensions above 16 numerically (the proof is for all d).
- The row thresholds themselves; nothing in Lean.

## 10. Files

All under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-shared-trace-2026-11-16/review/`.
Run with `/usr/local/bin/python3 -I -B`, one process, one thread; about two minutes in all. `SHA256SUMS` lists them.

| script (`scripts/`) | log (`logs/`) | what |
|---|---|---|
| — | `verify_replay.log`, `replay.delivered.json` | the replay in `package-copy/` |
| `exact_checks3.py` | `exact_checks3.log` | every identity and constant of `PROOFS.md` and `SHARED_HOLOMORPHIC.md` (sympy); the Gamma identity (20) to 30 digits |
| `exact_blocks3.py` | `exact_blocks3.log` | own moment code: the stored models; (11) = (14); polynomial suprema; d = 1; X·\|Y\|⁴ = Z + N/2 |
| `tangent_numbers.py` | `tangent_numbers.log` | §2.6: μ_m, β_m, the bound (5), θ(E[Z \| q, sign P]), the one-divergence constant, θ* |
| `sharp_trace.py` | `sharp_trace.log` | §2.5: θ*(Q_{d,λ}); m = 4, 5, 6 of §2.6; Θ_d against h = v and the second requirement, d ≤ 2000; p₀, p₁, p₂; Q₁ against the second review |
| `trace_blocks.py` (imports `multiblock.py`, `content_ratio.py` of the earlier reviews) | `trace_blocks.log/.json` | §4 |

`content_ratio.py`, `multiblock.py` and `data/prof_hp_<k>.npz` are copies from my earlier reviews. Nothing was written
outside `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-shared-trace-2026-11-16/` (this file
and `review/`); no tracked file was touched, and there was no commit, push or post.
