<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/MANUSCRIPT_DIGEST_K.md (file dated 2026-11-05). Only this line was added. -->
# Manuscript digest: Conjecture K on admissible/actual responses, and the A-shell

Digest of `<repo>/handoff/manuscript/` (git-ignored; paths below are relative to
it). Written 5 Nov 2026 by a worker of claude-b9ee for the degree-5/open-core programme. Status labels are those
of `new/legacy-reading-guide.tex` and are preserved verbatim: [L] Lean, [P] pen-and-paper, [C] exact/Arb
certificate, [C_float] padded floating validation, [F] float only, [?] unverified claim. Formulas are quoted as
written in the source (label in parentheses). Peak profile throughout: ε=1891/2500, p=1/ε=2500/1891,
a=699/1250, b=179/1250, L=Z(a+b|Z|²), T=|Z|², Λ(G)=E|L+G|+E|L−G|−p‖G‖², S=sup_v{2E|L+√vU|−pv}>1.37395,
v_*≈0.0403, B_0=2E|L|=(387/500)√π, S−B_0>0.0020476 [C]. Target 1.402 ⇔ row cap <500/701=0.713266...

## 1. The admissible/actual response class and every PROVED constraint on it

**Definition** (`legacy/ch36-K-state.tex` §"The weaker original-response route"; `legacy/ch25-parts/30-response-feasibility.tex`
§sec:fixed-first-remote-feasibility; `legacy/ch25-parts/70-canonical-ellipse.tex` §sec:canonical-response-ellipse).
Disk-valued responses |f_±|≤1 (unimodular for the norm), h=(f_++f_-)/2, k=(f_+−f_-)/2, P=P_{1,0}, Q=P_{2,1},
Ph=tZ, F=εQk, q=E[F|X] the remote projection (X = all remote coordinates), e=‖q‖². Exact objective
  `𝒩 = t² + ε‖Qk‖² − ‖Pk‖² − ε‖Qh‖² = t² + p‖F‖² − ‖Pk‖² − ε‖Qh‖²`.
Decomposition `F = q + (T−1)r_A + Z²r_B/√2 + ZY + Z̄W + νH(Z)`, H(Z)=Z(T−2)/√2, remote bidegrees
(2,1),(1,0),(0,1),(1,1),(2,0); `r_∥=(√2 r_A + r̄_B)/√3`, `r_⊥=(r_A − √2 r̄_B)/√3`, `E_ev=‖Y‖²+‖W‖²+|ν|²`.
Necessarily 0≤t≤√π/2. Raw K (Prop. prop:row, `legacy/ch7-conjectureK.tex` §sec:exactrow) is the relaxation
`Re⟨f,Tg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G)` obtained by dropping −‖Pk‖² and the Qh square: "raw K is sufficient, not
necessary".

**Response body** [P, synthesis] (70-canonical-ellipse §"The canonical target is a convex response body"): in fixed
dimension 𝒞_n = {(x,y)=(Ph+Qh, Pk+Qk): |h±k|≤1} is compact convex with support function
  `sup_{(x,y)∈𝒞_n} 2Re{⟨u,x⟩+⟨v,y⟩} = E|u+v| + E|u−v|`  (u,v ∈ ran P ⊕ ran Q),
and the exact norm problem is `sup_{𝒞_n}{‖Px‖² − ‖Py‖² − ε‖Qx‖² + ε‖Qy‖²}`. Equivalent value-function form
(`legacy/lower-bound/obstruction-1402.tex` §sec:obstruction-1402-audit; `ch25-parts/40-regional-and-cumulant-caps.tex`):
`J_n(t,F)=inf{‖Pk‖²+ε‖Qh‖² : |h±k|≤1, Ph=tZ, Qk=F/ε}` (closed convex, +∞ if infeasible), exact row
`t²+‖F‖²/ε−J_n(t,F)`, and the precise sufficient target
  (eq:obstruction-exact-response) `J_n(t,F) ≥ t² + ‖F‖²/ε − B  for every n,t,F,  B<500/701`.
Its dual is (eq:crc-canonical) [P]: for u,d∈ran P, v,C∈ran Q,
  `𝒩 ≤ t² + p‖F‖² + M(u,v,C,d) + 2pRe⟨v,F⟩ + 2Re⟨d,tZ⟩`, `M = E|u+v+C+d| + E|u+v−C−d| + ‖u‖² + p‖C‖²`,
and inf over trials = t²+p‖F‖²−J(t,F) (Fenchel). Anchor form (eq:crc-anchor) [P]:
`𝒩 ≤ t² − 2ℓt + 2pβ² + Λ(q) + p‖F−q‖² − ‖Pk‖²` (ℓ=1057/1250, β=179/1250).

Proved constraints (all hold in every dimension, all sectors present, arbitrary shared drivers, no buffer):

1. **Remote feasibility (Rice) cut** [P] (30-response-feasibility §sec:fixed-first-remote-feasibility):
   (eq:remote-feasibility-cut) `t + λpe ≤ E_X ρ(λ²|q|²)` ∀λ≥0, ρ(u)=E_Z|Z+√u|; general remote test v∈ran Q:
   `t + pRe⟨v,q⟩ ≤ Eρ(|v|²)`. (eq:unit-rice-derivative) `ρ'(u)=(1/2√π)∫_0^1 e^{−us}√((1−s)/s)ds`, ρ(0)=√π/2,
   ρ'(0)=√π/4; ρ increasing concave, ρ⁗≤0. Compares with a constant-modulus law, not a Gaussian.
2. **Rational tangent and energy ceilings** [P,C]: (eq:remote-rice-tangent) `ρ(u) ≤ A+Bu`, A=886762780/10⁹,
   B=432306903/10⁹; (eq:remote-energy-ceiling) `e ≤ 4ε²B(A−t)`: e<0.046266 (t≥0.84), <0.041319 (t≥0.845),
   <0.035383 (t≥0.851). Polynomial version (eq:remote-moment-feasibility)
   `t+λpe ≤ (√π/2)(1 + λ²e/2 − λ⁴M_4/16 + λ⁶M_6/96)`.
3. **Excluded coupled–diffuse family** [P,C]: q_N=(7/100)X[(|X|²−2)+i(|Y|²−1)]+(4/(25√N))ΣH(W_j), N≥20, any
   dependent remote Δ with ‖Δ‖≤1/1000: no response with t≥1057/1250 has E[εQk|remote]=q_N+Δ.
4. **Scalar law problem collapses to two points** [P] (§sec:response-feasible-law-reduction): with EU=1, EU²≥m,
   EU³≤M, extremal law Y on {r_-,r_+}; (eq:flr-domain) `t ≤ T_{m,M}(e)=inf_λ{(1−w)ρ(λ²er_-)+wρ(λ²er_+)−λpe}`,
   value (eq:flr-value) `(1−w)f(er_-)+wf(er_+)−pe`. Certified remote caps [P,C]: Ef(|q|²)−pe < 1.3739601 /
   1.3739481 / 1.3739276 for t≥0.847/0.849/0.851. **Limit** [P,C] (eq:flr-survivor): the law with nodes 2±√2
   passes every scalar Rice cut iff `t² + p²e ≤ π/4`; at t=1057/1250, e=161/4000 its payoff >1.37396307 >
   S+9.53·10⁻⁶ ⇒ all scalar Rice cuts plus moments improve the peak cap by <4.3·10⁻⁷ (left end <2.2·10⁻⁷).
5. **Joint response-projection constraint** [P] (eq:flr-response-stability): k̄=E[k|X], r_λ(q)=2λqρ'(λ²|q|²),
   D_λ=Eρ(λ²|q|²)−t−λpe: `‖k̄ − r_λ(q)‖² ≤ √π D_λ`; (eq:flr-both-responses) `‖h̄‖² + ‖k̄−r_λ(q)‖² ≤ √π D_λ`;
   (eq:flr-joint) `‖pq − Q_X r_λ(q)‖² + ‖P_X k̄ − P_X r_λ(q)‖² ≤ √π D_λ` (Q_X k̄ = pq);
   (eq:flr-penalty) `−‖Pk‖² ≤ −(a−√τ)_+²`, a=‖P_X r_λ(q)‖, τ=√πD_λ−b².
6. **Coupled cubic passing all scalar cuts but infeasible** [P,C] (§sec:coupled-projection-certificate):
   H=X(|X|²−2)/√2, J=XV, V=½Σ_{j≤4}Y_jW̄_j, q_e=√(e/10)(H+3J), E|q_e|⁴/e²=593/100. At e_0=31/800,
   t_0=1057/1250: (eq:jpc-all-scalar) `ℱ(λq)−t_0−λpe_0 > 1/100000 ∀λ≥0`, yet (eq:jpc-separated)
   `ℱ(v_*)−t_0−p⟨v_*,q_{e_0}⟩ < −1/100000`, v_*=a_0H+b_0J, a_0=λ_0c_0+7/1000, b_0=3λ_0c_0−23/10000,
   λ_0=42/25, c_0=√(31/8000). Universal two-coefficient cut (eq:jpc-universal-cut)
   `a_0|c| + b_0|d| < (a_0+3b_0)c_0 − 1/(100000p)` (c=⟨H,q⟩, d=⟨J,q⟩, orthogonal part unrestricted);
   forced penalty (eq:jpc-penalty-ball) `‖Pk‖² > 10⁻⁵` near e_1=38739/10⁶ (1/75000 at the centre).
7. **All-sector energy ellipsoid** [P,C] (§sec:sector-rice-feasibility, eq:sector-ellipsoid):
   `‖q‖²/4 + ‖r_A‖²/3 + 2‖r_B‖²/3 + (‖Y‖²+‖W‖²)/2 + 4|ν|²/7 ≤ Rε²(R−t)`, R=√π/2 (weights 2,3/2,3/4,1,1,7/8
   from E[w_k(T)/√T]/R); (eq:sector-closed-total) `‖F‖² ≤ (7/2)Rε²(R−t)`; refined (eq:sector-refined-total)
   `‖F‖² ≤ ε²{3R(R−t)+B_0(A_0−t)}`: 0.081884 / 0.071981 / 0.062431 for t≥0.84/0.8456/0.851.
8. **Two universal sector inequalities** [P]: 𝒟_t(v;q)=Eρ(|v|²)−t−pRe⟨v,q⟩;
   (eq:sector-effective-moment) `(3‖r_⊥‖² + 2E_ev)/(8ε²) ≤ 𝒟_t(v;q)`;
   (eq:sector-joint-profile) `‖p r_∥ − √(3/2) a(v)‖² + p²‖r_⊥‖² + p²E_ev ≤ 4𝒟_t(v;q)`,
   `a(v) = −(R/2)P_X{vG(|v|²)}`, `G(u)=e^{−u/2}{I_0(u/2)−I_1(u/2)} = (2/π)∫_0^1 e^{−us}√(s/(1−s))ds`, 0<G≤1.
   Score identities: `E[(|Z|²−1)k_w] = wκ(|w|²)`, `κ(u)=2f'(u)+uf''(u) = −(R/2)G(u)`; the visible A/B projection
   of k_v is exactly (a(v), ā(v)/√2), its transverse component zero for every remote v. Coupled energy cut
   (eq:sector-energy-cut) `‖q‖² + (3B_0/2)‖r_⊥‖² + B_0E_ev ≤ 4ε²B_0(A_0−t)`. Inverse-distance constants:
   `E|P_AB(Z)|²/|Z+w| ≤ 2‖P_AB‖²`, `E|T(a)(Z)|²/|Z+w| ≤ (4/3)|a|²` (T(a)={(|Z|²−1)a−Z²ā}/√3).
   "The two inequalities are valid simultaneously. Their left sides must not be added."
9. **Joint support budget** [P] (§sec:joint-response-budget): what CAN be added, by uniformity in the shift w:
   (eq:jrb-main) `‖k̄−r(v)‖²/√π + (3p²/8)‖r_⊥‖² + (p²/4)E_ev ≤ D(v)`;
   (eq:jrb-h) `(‖h̄‖² + ‖k̄−r(v)‖²)/√π + (3p²/8)‖r_⊥‖² ≤ D(v)`;
   (eq:jrb-parallel) `Φ(M,B) + (p²/4)(‖r_⊥‖²+E_ev) ≤ D(v)`, M=‖k̄−r(v)‖, B=‖p r_∥−√(3/2)a(v)‖, L_0=R√(3/8),
   K_0=R−L_0²/2, Φ = B²/4 | B²/4+(M−L_0B/2)²/(2K_0) | M²/(2R) on the three branches; a is R/2-Lipschitz.
   Ward-combined (eq:jrb-ward), only at unconstrained norm maximizers in fixed dimension. Example q_0 at
   e=38739/10⁶: `0 < D(v) − b²/√π < 1612/10⁹` ⇒ ‖r_⊥‖<0.001569, E_ev<3.689·10⁻⁶; with r_∥=−X/1000,
   r_⊥=X/1000 at a norm maximizer `‖Pk‖² + ε‖Qh+B_vis/ε‖² > 1/20000`.
10. **Canonical regional row** [P,C] (40-regional §sec:canonical-response-cap): quadratic representation
    (eq:crc-eta) `Φ(M,B)=sup_{0<η≤1}{M²/(2R+L_0²(η⁻¹−1)) + (1−η)B²/4}`; rational cut (eq:crc-rational-cut)
    with θ=250/517; transfer (eq:crc-transfer)
    `𝒩 < t²−2ℓt+2pβ²+C' + μ{D(v)−θm²} − (μθ/(1+μθ))‖a_1‖² + (μ/(μp−8))‖a_2‖² − (μp²/4−p)E_0`, μ>8/p,
    C'=2747927/2000000 (inherited remote theorem Λ(q)<C'). Region (eq:crc-region/crc-cap): `t≥1057/1250,
    Re⟨H+(113/40)J, q⟩ ≥ 58969/100000 ⇒ 𝒩 < 713260/10⁶ − 5(‖r_⊥‖²+E_ev) < 500/701`; nonempty.
11. **Cumulant complete-row criterion** [P] (§sec:cumulant-response-cap, eq:cr-main):
    `𝒩 ≤ t² − 2ℓt + 2pβ² + Λ(q) + ε(2√D_t(v;q) + χ(v))²`, χ=min{κ_v^{3/4}, √(8κ_vI_v/7)};
    (eq:cr-region) [P,C] `21/25≤t≤851/1000, κ_v≤1/1000, D_t(v;q)≤1/200000 ⇒ 𝒩 < 713254/10⁶`;
    (eq:cr-profile) `(3/2)‖a(v)‖² ≤ min{κ_v^{3/2}, (8/7)κ_vI_v}`.
12. **Anisotropic two-disk theorem** [P,C] (`ch25-parts/60-anisotropic-cap.tex`, eq:aniso-rational):
    `𝒩 ≤ t² − (759/500)t + 1272881/10⁶ + (27/50)e − (1/5)A_2 − (9/10)B_2 − (1219/1000)‖Y_R‖² −
    (1/4000)‖Y_I‖² − (417/1000)‖W‖² − (89/40)(Reν)² − (163/250)(Imν)²`;
    (eq:aniso-region) `667/1000≤t≤851/1000, e≤37/2500 ⇒ 𝒩 ≤ 89157/125000 = 0.713256`;
    A/B penalty matrix (eq:aniso-AB) `𝒫_AB = (57/125)A_2 + (43/50)Re⟨r_A,r̄_B⟩ + (1623/1000)B_2` ⪰ diag(1/5,9/10)
    and ⪰ (31/100)I; adjusted energy ℰ_adj and (eq:aniso-adjusted) `ℰ_adj ≤ 37/2500 + (3/10)(851/1000−t)`;
    sharp pointwise (eq:aniso-disk) `2Re(L̄h) + λ|k|² + {Re(L̄k)}²/λ ≤ λ + |L|²/λ`.
13. **Closed-form response ellipse** [P,C] (70-canonical-ellipse, at ε=1891/2500, no moment input):
    (eq:cre-global-quadratic) `𝒩 ≤ 1195/2000 + (1961/10000)t² + (257/500)e − (A_2+E_2)/1250 − (101/250)B_2
    − (33/100)|ν|²`; (eq:cre-ellipse) **`e + (191/500)t² ≤ 9/40 ⇒ 𝒩 ≤ 14263/20000 = 0.71315 < 500/701`**
    (e≤0.225 at t=0, 0.1295 at t=0.5, 0.03782 at t=0.7); (eq:cre-union) `0≤t≤851/1000, e≤37/2500 ⇒
    𝒩 ≤ 0.713256`. Stronger two-disk inequality (eq:cre-full-disk)
    `2Re(L̄h) + λ|k|² + ([Re(L̄k)]² + [Im(L̄h)]²)/λ ≤ λ + |L|²/λ` (gap = (λc_0−la_0)²); exact envelope
    (eq:cre-exact-envelope) `sup{2lRe h + A(Im k)² + B(Re k)²} = max{B, Ψ_l(A)}`; weighted Bessel
    (eq:cre-isotropic-bessel) `Eλ|k|² + ‖Pk‖² ≥ p²{e/J_0 + A_2/K_A + B_2/K_B + E_2/J_1 + |ν|²/K_ν}`; master
    (eq:cre-master) with λ(T)=√(s+d_0T), s=43/2000, d_0=417/1000, J_0=(√π/√d_0)e^z erfc(√z); retained defect
    (eq:cre-defect) `ℛ_t = E([Re(L̄_t k)]²+[Im(L̄_t h)]²)/λ(T) + ε‖Qh+p𝓑_t‖²`.
14. **Weighted full-energy cap** [P,C] (`ch25-parts/85-weighted-full-energy.tex`, eq:weighted-full-energy-cap):
    `𝒩 ≤ t² − (1401/2500)t + 1701143/4000000 + (5/4)𝒱_*`,
    `𝒱_* = e + (7/10)(‖r_A‖²+‖r_B‖²) + (3/4)‖Y_R‖² + (9/10)‖Y_I‖² + (5/6)‖W‖² + (7/20)(Reν)² + (61/100)(Imν)²`;
    𝒱_*≤13/400 on 0≤t≤0.851 ⇒ 0.71321135; 𝒱_*≤234/6250 at t=1057/1250 ⇒ 0.71325087; survivor
    (eq:weighted-full-energy-survivor) `𝒱_* > (4/5){B_* − t² + (1401/2500)t − 1701143/4000000}` (0.037447304
    at the peak). Visible support penalty (eq:visible-support-penalty) `‖Pk‖² + ε‖Qh‖² ≥ (ε/2)((2−r)t − I(r))_+²`.
15. **One-erfc envelope** [P] (`ch25-parts/86-canonical-feasibility.tex` §sec:one-erfc-response): for every z>0,
    `𝒩 ≤ t² + pV − (1/2p)((z+2)t − R(z+3/2) + 2p²V/(3M_0(z)))_+²`, M_0(z)=πe^z erfc(√z)/√z; z=1/12 [C]:
    V≤0.0365, t≤0.8456 ⇒ 𝒩<0.713256459; V≤0.0318, t≤0.851 ⇒ <0.713253437. z↓0: `𝒩 ≤ t²+pV−(4t−3R)_+²/(8p)`.
16. **Clipped-response feasibility cost** [P] (§sec:clipped-response-feasibility, thm:bounded-interpolant-correction):
    A=M+P, k_0=A⁻¹U𝖦⁻¹y the unbounded Gram interpolant; (eq:clipped-gram-correction)
    `⟨k,Ak⟩ = yᵀ𝖦⁻¹y + ‖k−k_0‖²_A ≥ yᵀ𝖦⁻¹y + E d_M(k_0)`, d_M(v)=inf_{|u|≤1}(v−u)ᵀM(v−u);
    `ℓ_M(v) = (|v|−1)_+²/(nᵀM⁻¹n)`, `(8/9)d_M ≤ ℓ_M ≤ d_M`, 8/9 sharp (eigenvalue ratio ≤2); closed form
    `ℓ_M(v) = λ(λ²+l²)|v|²(|v|−1)_+² / (λ²|v|² + l²{Im(e^{−i arg L}v)}²)`. Exact clipped dual
    (eq:clipped-response-dual) `⟨k,Mk⟩ + ‖Pk‖² ≥ 2ξᵀy − ‖a‖² − Eφ_M(Uξ−a)`,
    φ_M(d)=inf_{ρ≥0}{ρ + d_1²/(m_1+ρ) + d_2²/(m_2+ρ)}. Strict (E d_M(k_0)>0) but **no uniform rate**. Superseded
    by the exact joint defect (`ch25-parts/87-joint-response-defect.tex`, sharp fraction 81/250; descent hierarchy
    retains >99.99% after 32 steps, `88-joint-dual-descent.tex`).
17. **Exact visible geometry and stop rule** [P],[P,C] (§sec:exact-visible-response-geometry):
    (eq:exact-visible-penalty) `inf{‖Qh‖²: |h|≤1, Ph=tZ} = ½[−M(t)]_+²`, t=R−2γ(3/2,r), M(t)=−t/2+2r^{3/2}e^{−r};
    at t=1057/1250, r=3/25, K=0.07, formal V=0.04: `t² + p/25 − εm²/2 > 0.7175 > 500/701` — scalar visible
    geometry plus total energy cannot prove the cap; the location of energy in the projection must be retained.
18. **Concentration/contact branches** [P,C] (`ch25-parts/89*`; summarised ch36): diagonal Wick share
    |⟨H_X,F⟩|²≥(4/5)‖F‖² ⇒ 𝒩<0.71315; mixed square X²Ȳ/√2 share ≥179/200 ⇒ <0.713225 (9/10 ⇒ 0.71295);
    ‖Π_{𝒮_X}F‖²≥0.9V ⇒ 0.71315, ‖Π_{𝒜_Y}F‖²≥0.985V ⇒ 0.713225; two slices ≥39/40 ⇒ 0.7132; phase-preserving
    (m,η_m)∈{(2,191/200),(4,49/50),(8,99/100),(16,499/500),(24,1999/2000)} ⇒ 0.71325; spherical core
    (n,η_n)∈{(2,187/200),(3,481/500),(4,122/125),(6,124/125),(8,9999/10000)} ⇒ 0.71325; one-leg module ≥499/500
    ⇒ 0.71325 (covers cQ_N, N≥999). None forces small influence (Q_N=X_1(Σ|X_j|²−N−1)/√(N+1)).
19. **L¹/L² radius** [P,C] (`legacy/ch62-spherical-kernel.tex` thm:sk-rho): `E|q| < (484754157/500000000)‖q‖₂`
    for every Wick cubic (small-ball cut eq:sk-cut `Pr(|q|≤r) ≥ (18/319)r² + (7/2500)r⁴`); later ρ≤0.95133
    (thm:real-stein-radius-20261021, C_6=40.45313). Row corollary cor:sk-row: all responses with
    0≤t≤47867/10⁶ (now 0≤t≤0.1694) are below 500/701.
20. **Polynomial-moment slabs** [P,C] (thm:response-moment-slab, `ch25-parts/80`): six-moment two-coordinate
    projection box, 0.84≤t≤0.851, ‖F‖²≤1/20 ⇒ 𝒩<0.7124; three narrower boxes up to full energy 0.070125.
21. **Spherical dual transfer** [P] (`legacy/global-response/spherical-dual-transfer.tex`,
    thm:spherical-dual-transfer): `N_G(λ) ≤ N_{S,m}(a)`, a_{m,r}=Σ_jλ_j[s^j]q_{m,r}(s); cubic tail
    (eq:spherical-dual-cubic-cap) `N_G(1,−ε) ≤ N_{S,m}(a^{[L]}) + u_{m,L+1}`; outer error
    (eq:spherical-dual-outer-error); exact HS obstruction
    `d_{m,r}|a_{m,r}|² = ((m+2r)(m+r−1)(r+1)/(m−1))(1+εr(r+m)/2)²` (not Hilbert–Schmidt); floor N_{S,m}(a)≥1/K_G^ℂ(m).
22. **Common Stein kernel** [P]+[L parts] (`global-response/common-stein-kernel-20261023.tex`): finite-feature
    compression — a common square-integrable kernel for finitely many Stein tests ⇔ two augmented Grams PSD with
    s_X≤2P/3, s_r≤2Q_c/3, 2P+Q_c=χ, Q_c≤χ/3 (Riesz; `Grothe.Lower.SteinFusion.common_kernel_projection` [L]);
    fusion (eq:common-stein-fusion) `G_w = wG_1 + (1−w)G_2 − w(1−w)((f_1−f_2)² + 2(g_1−g_2)²)` [L]. Genuine-cubic
    floor [P,C] (eq:genuine-frozen-table-floor): q_128 (8,384 coordinates, law R_mG/√(m(m+1))) gives every frozen
    19-table mixture `> 14267/20000 = 0.71335 > 500/701` at ε=149/200, t=341/400, τ=239818283/10⁹: radial
    constraints alone cannot finish that architecture; "the next global certificate must change the profiles or
    retain the common response relation p=Q_wE_Zk together with the actual images Tf,Tg".
23. **Binding audit** [C] (`global-response/binding-audit-20261023.tex`): master 98f61ec, 21 batches/351 nodes/
    8,756 boxes replayed; max box 0.713421798525..; 130 boxes within 10⁻⁷, t∈[0.84425,0.8545]; rule 7234 decomposes
    as −0.719702191279+0.055407255822+1.408882874811−0.031166140839+10⁻¹¹; four atomic laws pass all 671 cuts
    with R_tab > 0.713412812507 / 0.713414640742 / 0.713406413945 / 0.713352277645 (>500/701): the fixed table+
    cut-bank relaxation has a floor. Dropped joint data: ε‖Qh+(β̄/ε)v‖², E‖Y+C⁻¹h p‖²_C; row-consensus loss
    `sup Σw_iF_i ≤ Σw_i sup F_i`. The merged-test kernel (item 22) excludes all four (expectations −0.0661,
    −0.2629, −0.0989, −0.0122) but law reoptimisation recovers them (score change ≤2.36·10⁻⁸).
24. **Joint response lift** [P]+[L parts] (`global-response/joint-response-lift-20261023.tex`
    §sec:shared-response-gram-lift): single tuple v=(fA_i, gB_j), measured X=Gr(P_0v);
    (eq:shared-gram-interval) `0 ⪯ K ⪯ V, Gr(Pv) = X+K`; (eq:shared-cross-interval) `|2k−v| ≤ R`; screen
    (eq:shared-completion-screen) `|2c+v| ≤ R+2a`; near-maximizer completion (eq:shared-stability-completion)
    `[[D_f, ε(X+K)_fg],[ε(X+K)_gf, D_g]] + 10L²√δ I ⪰ 0`; image lift (eq:shared-image-stability); quadratic
    features close the first-chaos map exactly (eq:shared-quadratic-wick, eq:shared-quadratic-closure):
    `[P(fA_M)]_l = Σ_j M̄_lj⟨z_j,Tf⟩ − ε⁻¹Σ_{ij} M̄_ij⟨W_{jl;i},Tf⟩`, giving (eq:shared-quadratic-stability)
    `⪰ −16√(3δ) I` (moments EA_M⁴≤9a⁴, EA_M⁶≤265a⁶, EA_M⁸≤14833a⁸); exact local two-disc SDP
    (eq:shared-exact-local-sdp) and moment body `conv{zz*: z=(1,u,v),|u|,|v|≤1} = {X⪰0: X_00=1, X_11,X_22≤1}`
    (complex rank-one argument); bilinear interface `‖T‖_{∞→1} ≤ sup_n‖S_λ‖_{∞→1}`. Lean: `ResponseGram.lean`,
    `TwoDisc.lean`, `QuadraticFeatures.lean`.
25. **Symmetric response replicas** (`new/symmetric-response-replicas-20261023.tex`): invariant modes
    (eq:five-modes) B=(Z, Z(|Z|²−2)/√2, ZA_X, ZA_Y, q), exact best-response image Tf_c=ΣB_j(Λκ(c))_j, payoff
    (eq:finite-pair-payoff) J(c,e)=Re(κ(c)*Λκ(e)); scalar state (eq:scalar-state) q=RG/√D, A_X=(R−m)/√m,
    A_Y=(|G|²+V−d)/√d with E[A_X|q|²]=2/√m, E[A_Y|q|²]=1/√d (an independent A_Y surrogate fails); replicas
    E[qq̄']=ρ³ vs artificial (mρ+ρ³)/(m+1) [L]; limit kernel `K_∞(ρ)=H((3ρ−ρ³)/4)`, c_0=3π/16, c_1=−101π/2048;
    the price-induced witness has payoff 0.7169925... > 7169/10000 — rejected.

**Scope rule repeated everywhere**: these are conditions on actual responses; "inserting these cuts into a raw-K
supremum would be invalid"; penalties that spend the same Pk or Qh square must not be added twice; full-energy
budgets (𝒱_*, ‖F‖²) must not be substituted for remote e.

## 2. Restricted forms of Conjecture K stated in the manuscript, and status

- **K** (conj:K, ch7): `Λ(G) ≤ S(ℓ,β)` ∀n, ∀G∈H_{2,1}(ℂⁿ), range ε∈[0.74,0.76], ℓ∈[0.76,0.90], β∈[0.12,0.16];
  **K_η**: Λ≤S+η. Open. Target for 1.402 (ch36 §budget): `Λ(G) ≤ C'+η_AB = 2747927/2000000 +
  240297199/2651182000000 = 1.37405413… ≈ S+1.0061·10⁻⁴` on t∈[21/25,851/1000]; η_AB is room above C', not S
  (remote slack ≈9.97·10⁻⁶ already paid). Corner of the row box with v_*=0 (E[1/(2|L|)]≤1/ε) needs separate
  treatment. Profile uniformity and the row envelope are additional obligations.
- **K′ (retained penalty)** (ch7 §"Side experiments", Conjecture K′): `Λ′(G) := sup{Re E[(L+G)‾f + (L−G)‾g] −
  ‖G‖²/ε − ‖Pk‖² : |f|=|g|=1, εQk=G} ≤ Λ(G)`; prop:row holds with Λ′; **K′: Λ′(G) ≤ S** is weaker than K and
  still sufficient. For the diffuse Gaussian adversary the penalty vanishes (k* odd in W), so S is unchanged; for
  junta adversaries (q=H(z_2)) the remote first-chaos content of k is strictly positive. "Caveat: the penalty
  concerns the z₁-constant coefficient c₁ of k, while the mixed gain concerns the A- and B-coefficients; they are
  different functions of q." Status: idea; the measurement task "did not run" in ch7; the stationarity version
  K_rot (next) is the proved form.
- **K_rot** [P at a global norm maximizer, all sectors] (`ch25-parts/10-exact-duals-rotation-profiles.tex`
  §sec:weakk-rotation): `Re⟨f,Tg⟩ ≤ t²−2ℓt+2β²/ε+Λ(G) − ‖2βr_A+√2βr̄_B‖²/(ε²t²+9ε‖G‖²)`;
  denominator ω=min{9v, 3√(3κ_G/2)} (eq); penalties ≥‖r_∥‖²/7 (v≤1/16), /6 (v≤1/25), 6‖r_∥‖²/25 (remote
  version). Pays only 13–57% of the measured mixed gain (ch36 §Alternatives). Exact profile identity
  `ℓc_0 + 2βc_A + √2βc_B = T_q* h_even` [P], c_D=Π_{1,0}F_D(q), T_qp=Σp_j[Z∂_jq‾ + Z̄∂̄_jq]: "a matrix constraint
  coupling the content, Pk, and the retained Qh square"; r*I_q⁺r ≤ ‖h_even‖².
- **Response-body target** (eq:obstruction-exact-response) — "weaker than raw K: it needs no claim about cubics
  that cannot arise from bounded responses. Its support-function dual is already proved; the missing part is a
  uniformly successful family of dual certificates." Open. Weaker replacement (obstruction-1402 §"concrete weaker
  replacement"): existence, for every surviving central response, of a remote test v and μ>8ε with
  `ℛ_μ(v) ≤ 500/701 − B_0(t) − ζ` — labelled [?]; proportional tests v=λq provably leave a gap of 0.0007977136526
  at e=1/25 (stop rule for that family).
- **Smoothed target** (`ch25-parts/20-stability-and-smoothing.tex` §sec:k-fixed-smoothing-response):
  (eq:sg-smoothing) [P] `Λ(F) ≤ J_g(F) + pg²`; (eq:sg-new-target) `M_{1/128} ≤ S + 99/10⁷` **open**, corrected by
  the IDE to the sufficient `M_{1/128} ≤ C'+η_AB−625/7745536 ≈ S+1.992·10⁻⁵`. Companion identities [P]: ascent
  (eq:sg-ascent) `J_g(Qk_g(F)/p) − J_g(F) ≥ ‖r_g‖²/p`; pinning (eq:sg-pinning) `(𝒯_{F,g}−pI)v_j =
  (∂_{X_j}r_g, ∂̄_{X_j}r_g‾)`; (eq:sg-quantitative-pinning) `Σ_j‖(𝒯_{F,g}−pI)v_j‖² ≤ 3pδ`; stability
  (eq:sg-spectral-stability) `M_g − J_g(F) ≥ (9g³/92)(λ_max(𝒯_{F,g})−p)_+²`. The off-diagonal noise block b_g is
  invisible to separate proper-noise tests.
- **Noise-stable weak K** (§sec:noise-stable-weak-K) [P]: (eq:noise-near-max) `H_{r,s}(G) ≤ M − Λ(G)` (necessary
  cuts on near-maximizers, not universal); supremum dual (eq:noise-sup-dual); parity obstruction: on the pure odd
  A/B baseline h_0 is odd in Z, so remote first-chaos multipliers vanish.
- **PVD_0/BNC** (ch32, ch34 §"Gaussian-buffer closure"): remote K for every profile ⇔ `E|q| ≤ (√π/2)‖q‖₂` on
  H_{2,1} (open; worth ≤10⁻⁵ since K_η remote is proved with slack <10⁻⁵); buffered form equivalent [P]. K for
  every ε ⇔ Gaussian domination on every variance sphere (ch32).
- **Lemma status** (ch7 §sec:lemmas): L4 (CLT monotonicity) FALSE (G=cz₁(|z₂|²−1): +4.9·10⁻⁴ at c=0.15); L4*
  (sup-monotonicity) survives [F]; (T) FALSE (q=(7/(20√2))X²Ȳ; ch15); live (T₀) = Prop. R:
  `‖Π_{1,0}F_A(q)‖² + ‖Π_{1,0}F_B(q)‖² ≤ 0.292(S−Λ_q+η)` (measured ≤0.385–0.39 d_q); L1 majorant M(h_X,h_Y)
  with h_X*=1.0237, h_Y*=1.1937 at the peak but not uniform on the row box (h_Y*>1/ε for ℓ≤0.78); L2 proved
  3.674→2.2029, numerical 0.4775–0.54, weighted form constant 3 (sharp in [2.777,3]).
- **"No Jensen on conditionally Gaussian G with conditional cross-covariance"** (ch7 §sec:lemmas (d)): "The joint
  functional is not concave in the covariance parameters (largest Hessian eigenvalue +1.3 to +2.9), and
  conditionally Gaussian G with conditional cross-covariance (e.g. q=z₂X, r_A=z₂) leave the S-limit family with a
  first-order effect 2γ_Aaσ that cancels only on average: no Jensen argument proves K on conditionally Gaussian
  G." The polarized-class theorem (ch33 polar:main) states the same restriction: it "does not permit an arbitrary
  conditional cross covariance between the remote residual and the A/B drivers". This is exactly the boundary of
  theorem (B).

## 3. Discoveries and negative results (what was tried, why it failed, numbers)

- **No violation of K found** (ch7 §sec:Kattack): all of H_{2,1}(ℂ²)+W: +1.4·10⁻¹²; H_{2,1}(ℂ³)+W (37 real
  parameters): +4–5·10⁻⁹ grid artefact; scale mixtures ≤0; 10-parameter S-limit family 0 to 2·10⁻¹⁶; n=2 without
  W: supΛ=1.3649281<S=1.3669130. Λ(0)=S−2.07·10⁻³ is a saddle. Effective second-order constants at the Gaussian
  point (must be <1/ε=1.322): r_A circular 0.857, r_B 0.389, r_z 0.622/0.118/1.126 (imaginary worst), ν 0.153/0.897.
  Second variation at σ*W: −0.28 to −2.5 in every sector direction, only the Gaussian family flat [F] (ch25-parts/91).
- **Negative-result register** (ch36): (T) false; equal-variance peeling of a shared driver false (shared −
  independent up to +1.96·10⁻² at aligned phase); exact K-a from radial scalar inputs alone impossible (artificial
  radial laws beat the Gaussian payoff, excess <4.65·10⁻⁶); fibrewise Gaussian domination at a fixed shift false;
  every single-scale strengthening false (heat kernel, characteristic function, Laplace: counterexample
  H=z[(|z|²−2)+i(|w|²−1)]/√3 with Ee^{−30|H|²}<1/31, refuting also |A|²≥_cx‖A‖²Exp(1)); buffer doubling useless;
  conditioning without the core's deficit; law-only shared comparisons (ch35 obstruction); monotone
  Gaussianisation can lose +1.2·10⁻²; signed AB kernel need not be completely monotone; no dominant-coordinate
  reduction. "K is an averaged, multi-scale statement; the visible variable must be integrated first, and the A
  sector is the one admissible profile that is not scale-local."
- **No fibrewise domination** (ch29 §(a)): h(v,u)=E|u+√vG| is concave in v only for u≲√v, convex beyond
  (∂²_vh>0 at u=2,3, v∈[0.25,2]); E_{T'}h(T',u)−h(1,u)=+4.05·10⁻³ at u=2; at v*=0.0403 only 20% of the visible law
  is in the concave region. Pointwise devices (fibre majorant h_X, peeling, idealised B bound) fail for this reason.
- **Local pinned matrix is not a global majorant** (20-stability §"Why the local pinned matrix…"): local matrix
  M≈[[.7154593,−.2627445],[−.2627445,.3087284]], curvature in direction (2,−1) >.843 so no isotropic cost .8I;
  M+I/10 violated by >97/1000 at q=3/4, α=7/20, β=1/2, k=1/5 [C]. Unproved replacement target with C_q=C_r=2.
- **K-a from moments alone fails near σ*** (ch7 §sec:Ka qualified): dual LP with EU=1, EU²=2+x², EU³≤6+9x²+C_6x³,
  E√U≤ρ gives d(σ*,0)=−6.3·10⁻⁵; Stein cuts required. Chain content≤f(x), slack≥g(x) "cannot be split through the
  fourth moment alone" (η needed: 1.1·10⁻⁵ at x≤0.10 … 0.49 at x≤1).
- **Scalar cuts saturate** (item 4 of §1): all scalar Rice cuts + moments gain <4.3·10⁻⁷ at the peak; the exact
  visible geometry alone admits 0.7175 (item 17); binding-audit laws (item 23); genuine-cubic floor 0.71335 for the
  frozen tables (item 22); a fake degree-two moment configuration (p^±=(t,0), m_00=−5/16, m_11=±1/3) passes both
  multiplication matrices with objective t²+ε/18−25ε/512>500/701 but violates the visible support bound (ch25-parts/85).
- **Jensen buffer insertion is too crude** (obstruction-1402): `Λ(G) ≤ Λ(G+gU) + pg²`, p(9/40)²=2025/30256>0.0669
  ≫ 9.06·10⁻⁵: the buffered all-sector theorems cannot be transferred to zero buffer this way.
- **Gaussian-marginal obstruction** (ch35 §sec:gaussian-marginal-shared-obstruction) [P]: Q=√v_* X exp(2πiF_2(R)),
  F_2(r)=1−(r+1)e^{−r}, has exactly the Gaussian law, E[QX̄]=0, EQ=EQ²=E[QX]=0, hence the covariance profile of the
  Gaussian A theorem, yet `Λ(Q − it(T−1)X) = S + 4√v_*(Im J)t + o(t) > S` for small t>0. Missing assumption is
  spectral: E‖DQ‖²=v_*(1+64π²/81)>3v_* (a pure cubic has exactly 3v_*). "Every remote radial test, and every test
  depending only on adding independent Gaussian noise, sees exactly a Gaussian in this example."
- **Positive A-curvature of the pointwise tangent** (ch55 §tdb-sec:obstruction, [C at nodes, F between]):
  M_AA(0,g)=E[K_g(ℓ²)(r²−1)²]−p = +0.212 (g=0.10), +0.073 (0.14), +0.012 (0.16), +0.0002 (0.164), −0.017 (0.17),
  −0.095 (0.20); sign change at g≈0.16407, so below that buffer the pointwise majorant is unbounded in α near c=0;
  "the pointwise tangent loses the radial part of the Hessian (ρ_g''<0), roughly a factor 2 where ℓ≳g"; the true
  second variation is negative (margins ≥10⁻³ at g=0.1 [F]). Exact-anchor relaxation reaches V−S=+2.1·10⁻⁴ at
  c=(0.16,0), g=0.15 (a failure of the relaxation, not of Λ).
- **Inadmissible profile would beat the Gaussian** (ch29 §(b)): profile (T−2)²/2 earns 1.354 of its price and beats
  S by 2.2·10⁻² [F]; it is (T−2)X/√2 = (T−1)X/√2 − X/√2, containing a pure first-chaos term ∉H_{2,1}. "K's truth
  rests on the bidegree constraint: a remote first-chaos factor must carry a visible weight orthogonal to
  constants, (T−1) and not (T−2)."
- **Spherical routes** (ch62 prop:sk-obstruction) [P,C]: balanced witnesses P_β=u_1(|u|²+β|u_1|²) with
  L¹/L²=0.98632 (m=2), 0.97307 (m=3) refute the proposed S⁵ lemma (coefficient 942841/1050000); the spherical
  dual operator is not Hilbert–Schmidt (item 21), so no squared-kernel certificate.
- **Concentration tests do not force small influence**: three-cycle (X_1²X̄_2+X_2²X̄_3+X_3²X̄_1)/√6 (two-slice
  share 2/3, influence 1); Q_N has influence (N+5)/(N+1)→1 and n-core share (n+1)/(N+1)→0 — exact formulas, not
  counterexamples. Phase-averaged many-slice majorants tend to constant modulus, not to a Gaussian.
- **Response-side diagnostics** [F]: at t=0.845 the near-Gaussian stored candidates (payoff ≈1.373952) incur only
  10⁻⁹–10⁻⁸ of new support charge; strongly coupled ones up to 1.5·10⁻⁴ but already have negative scalar support gap.

## 4. The A-shell / A-sector: everything known, and mixtures with a remote cubic

Notation: A-shell = (T−1)r_A, r_A∈H_{1,0}(X) (holomorphic linear form in the remote coordinates); A(T)=T−1,
B(T)=T/√2; u=‖q‖², w=‖r_A‖² (also y=‖r_A‖², z=‖r_B‖² in ch36).

**Structure** (`legacy/ch11-structure.tex` §sec:Aline, §sec:freqrule; `legacy/ch29-forest.tex`):
- Frequency rule: after factoring e^{iθ} (Z=√Te^{iθ}), sectors carry θ-frequencies q:−1, A:−1, B:+1 (odd) and
  Y:0, W:−2, νH:0 (even). Distinct frequencies kill cross terms in E[|G|²|T] for any latent dependence; even
  sectors have no first-order coupling to q (two-sign cancellation); **content lives only in A and B**, and A is the
  one sector whose frequency equals q's, so they add coherently.
- One-line A-sector formula (eq:Aline) [checked numerically 10⁻⁶]:
  `Λ(q_0+r_AA) = 2E_{T,w} mabs(√T f(T), |q_0(w)+(T−1)r_A(w)|) − (σ_0²+‖r_A‖²)/ε`,
  `mabs(x,s) = (2/π)(x+s)E_ell(4xs/(x+s)²)`. K on the A-shell is a statement about the one-parameter family of
  laws of |q_0+c r_A|, c=T−1∈[−1,∞). Second moment has no cross term; the fourth moment has
  `4c Re E[|q_0|²q̄_0r_A] = 4c Re⟨r_A, Π_{1,0}(q_0|q_0|²)⟩`, linear in c: **this is where shared drivers enter**
  (the cubic-tensor content; sharp constant conjecturally 0.4775, proved 3.674).
- Exact one-variable form (ch29): `Λ(G)=E_T[E_w(|ℓ(T)+R_T|+|ℓ(T)−R_T|) − (1/ε)E_w|R_T|²]`,
  `R_T = q + (T−1)r_A + (T/√2)r_B + √T(Y+W)`, ℓ(T)=√T(a+bT); price exact since ET=E(T−1)²=ET²/2=1.
- Why A is hard (ch11 item 3): structured variance H(T)=v_1T+v_2T² sits where |L| is large and loses to a Gaussian
  of equal mean (IBP `E[(H−m)a(T)]=E[Tτ_Ha'(T)]`, needs H(t)/t increasing: true for t,t², **violated by (t−1)²**,
  which moves variance to T≈0 where L vanishes). Hence the separate A proof needs |α|²≤a²/2 (residual variance at
  T→0 below half the linear scale a² of |L|²≈a²T).
- **"Factor ½ of the phase average"** (my identification of the phrase): averaging the visible phase replaces the
  pointwise norm majorant `|z+u| ≤ |z| + Re(z̄u)/|z| + |u|²/(2|z|)` by the circular mean m(s)=Σa_ks^k,
  a_k=binom(1/2,k)², i.e. `m(s)=1+s/4+…` (ρ'(0)=√π/4=R/2 vs the pointwise R): the quadratic sector cost is halved
  at second order, equivalently the sector curvatures double relative to fibrewise majorants. Manifestations: the
  averaged A content constant 76c³ versus pointwise 600c³ (ch28 thm:coherent-sharp; ch29 §architecture); averaged
  A curvature d_A≈0.466 versus the rigorous pointwise 0.292 (ch29 §(b)); ch55: "the pointwise tangent loses the
  radial part of the Hessian, roughly a factor 2"; exactly `d_B = d_{Y/W} + ½d_A` (ch29, proved signs in
  ch31 avg:profile). Globally the sharp affine slope of m is C_*∈(0.298834,0.298835] (thm:sharp-circular-audit),
  `m(s) ≤ 1 + (59767/200000)s` [P,C].
- First-order profile margins [F] (ch29 table): E[wp]/Ew = 0.648 (A), 0.470 (Y,W), 0.294 (B), 0.397 (νH),
  1.354 ((T−2)²/2, inadmissible); first-order cost of a Gaussian sector of mass m: 0.466m (A), 0.70m (Y/W),
  0.93m (B). Proved [P] (ch31 avg:profile): w_v strictly decreasing and
  `d/ds E[2h(v+s(p(T)−1),ℓ(T))]|_{0+} = E[w_v'(T)A_p(T)]`, A_p=T² for (t−1)², T for t, T²/2+T for t²/2 — all
  three first variations strictly negative for every v>0.
- Profiles and constants (ch7 §sec:Kb, label \st{CA} as written): F_A(u)=E_z[A(z)ph(L(z)+u)], γ_A=−0.835136,
  γ_B=−0.422028; sup|F_{A,uū}|=0.6941, sup|F_{A,ūū}|=0.3312, sup|F_{A,uuū}|=4.30; Δ_A(s)=c_A(s)−γ_As=2.15s³+…;
  |c_A| peaks at 0.2534 near s=0.5, decays like 1/s. P_A'''(0)≈100 ("factor-100 finding": no derivative-expansion
  proof of (T) at σ≈0.2). Exact completely-monotone actual A profile [P] (ch34 eq:cm-actual-a-profile):
  `F_A(u) = (√π/4)∫ s^{−3/2} e^{−su/2} I_0(su/2) μ_1(ds)`, F_A(0)=√π(a/4+9b/8), F_A↓0; Hankel form
  `Ψ_A(k) = −(k²/4)∫s^{−2}e^{−k²/(4s)}μ_1(ds) ≤ 0`. "It does not by itself bound its first-chaos projection when q
  and the A driver share coordinates."

**Proved A results (raw K), in order of generality:**
1. **Orthogonality-only shared-A bound** [P,C] (`legacy/lower-bound/sharp-circular.tex` thm:shared-a-audit, input
   to `legacy/ch61-shared-a-regions.tex`): for ANY jointly distributed square-integrable q,r independent of Z with
   E[q̄r]=0 (no chaos degree, no Gaussianity, no independence of q from r),
   `Λ(q+(T−1)r) ≤ B_0 + 0.38968u − 0.12432w` (eq:shared-a-audit), via `Λ ≤ B_0+(2CK−p)u+(2CJ−p)w`,
   K=Eℓ(T)⁻¹=πe^z erfc(√z)/√(ab)<2.864, J=E(T−1)²/ℓ(T)<2.004. Consequences: `u ≤ 0.00525+0.319w ⇒ Λ<S`,
   `u ≤ 0.00551+0.319w ⇒ Λ<S+10⁻⁴`; strips (thm:shared-a-strip-audit): for u≤0.0463, w≥0.0228/0.0225/0.0223 ⇒
   Λ<S−10⁻⁴ / <S / <S+10⁻⁴ (uses g_C(s)=min(1+Cs,√(1+s)) and ∂_wV≤(2CJ−p)<0). Remaining shared-A rectangle
   (ch61 §"Remaining"): **`w<0.0223, u>0.00551+0.319w`** (inside the response-feasible u≤0.0463, w<0.0328).
   "Further substantial improvement requires an envelope retaining more than the second moment, or the
   original-response constraints. Merely optimizing the global affine slope has less than 10⁻⁶ left to gain."
2. **Cumulant criterion** [P by AI, not re-derived] (ch61 §sec:sar-cumulant): η=(E|q|⁴−2u²)/u²,
   `Λ ≤ S − w/10 + √(πu/3)√η + (8√π/(3e))(3/8)^{1/4}η^{1/4}√w`, so Λ≤S+5√η for u≤0.0463 — needs η≤4·10⁻¹⁰.
3. **A cost at zero buffer, any dependence** [C] (`legacy/ch46-radial-directional-bootstrap.tex` §"Certified costs
   for the shifted A sector"): q any square-integrable remote variable, r_A a Gaussian linear form on its space,
   `Λ(q+(|z|²−1)r_A) ≤ Λ(q) + 2Re E[(|z|²−1)r_A (L+q)‾/|L+q|] − κ‖r_A‖² + η`, with (‖r_A‖≤1/16: κ=19/100,
   η=10⁻¹¹), (1/10: 13/100, 10⁻¹¹), (1/8: 2/25, 10⁻⁸), (3/20: 3/200, 10⁻⁵); η=0 with a fresh buffer g≥1/8192 etc.
   This reduces A+q to a **content bound**: the linear term is 2Re⟨r_A, Π_{1,0}F_A(q)⟩. Also B-content transport
   `|𝓑_A(q;r_A,R) − 𝓑_0(q;R)| ≤ (4/5)‖r_A‖‖R‖` (later 0.563; ch36 register).
4. **Fourfold symmetry suffices** [P] (ch27 §sec:c4-a-addition, eq:c4-a-theorem): if (Q,A) =_law (Q,iA) then
   `Λ(Q+(|Z|²−1)A) ≤ Λ(Q) − (999/302560)E|A|²` (≈0.0033 per unit), via `¼Σ_{k=0}^3|z+i^kw| ≤ |z|+(5/16)|w|²/|z|`;
   conditional circularity gives the larger certified 0.039 (measured 0.11). Register: "A under fourfold symmetry;
   B under E[B|Q]=0: every amplitude".
5. **Polarized/conditionally Gaussian class** [P,C] (ch33 polar:main): R conditionally Gaussian given T with
   V(t)=g²+α²A(t)²+β²B(t)², |P(t)|≤2αβ|A(t)B(t)|: `2E|ℓ(T)+R| − (g²+α²+β²)/ε ≤ S − α²/10 − β²/4`; polar:all adds
   even channels (−e/25). Latent mixtures allowed; **not** conditional cross-covariance between residual and
   drivers. Quantitative non-Gaussian variant (polar:joint, eq.(16)):
   `Λ(R) ≤ S − α²/10 − β²/4 + 2√([p+(α+β)²][2κ/(3p²) + 8J/(9p)])`, J=Σ_{j≤2m}E|∂_{x_j}q|² on the driver
   coordinates (Nourdin–Peccati–Réveillac Wasserstein–Stein; (17) `E‖⅓(⟨Dq_i,Dq_j⟩)−pI/2‖²_HS ≤ κ/3`). Gaussian
   layer plus gap [P]: `Λ ≤ S − y/10 − z/4 − e/25 + D`, D up to 1.2·10⁻² in a cold-start example, absorbed by the A
   penalty with ratio 0.29 (ch36).
6. **Gaussian-factor drivers** [P,C] (ch35): q=CᵀX+gU with C centred, independent of X, shared A/B on any
   number of drivers: `Λ ≤ S + 5·10⁻⁵ − (y+z)/200`; three-real-variable dual (eq:centered-dual) with support
   multipliers (7/5)Re(sᾱ)+(5/7)Re(βs); inverse-radius inputs H_j(w,ℓ)≤4/(3ℓ), E_T B²/ℓ<39/50. "A coherent
   holomorphic A perturbation does not" satisfy the covariance condition — structural, not an amplitude issue.
7. **Complete coherent one-driver A/B** [P,C] (ch48, (OD),(SB)): Z,X,U independent,
   Q_0=cH(X)+α(|Z|²−1)X+βZ²X̄/√2: `Λ(Q_0+gU) ≤ S − min{3/100000, min(c⁴,c²)/32 + (|α|²+|β|²)/2000}` for all
   c,g≥0, α,β∈ℂ; `0≤g≤1/6 ⇒ Λ(Q_0+gU) < S − 3/100000`; independent latent mixtures and profile transport included.
   Float margin check: S−sup_βΛ=5.55·10⁻⁴ at (c,g,α)=(0.03,0.164,0.03). Inputs: ch28 thm:coherent-sharp
   `Λ(Q) ≤ S_0 − 21c⁴ + (20812/3)c⁶ + 76c³|Re α| − (7/20 − 48c² − 357cr − 306r²)r²` (g²∈[7/200,9/200];
   ‖K_{1,g}''‖_∞<13/8, ‖K_{2,g}''‖_∞<2 after averaging the visible profile first); unequal Wick sums with coherent A
   (thm:coherent-unequal): u≤1/100, c_*≤1/50, r≤1/1000 ⇒ `Λ(Q) ≤ S_0 − 2B_4 − r²/50`, A curvature at zero
   ≤ −7/20+12D, D=u+3c_*²; ch39/ch41 boxes (deficit 1/4000, 1/8000 via a global quadratic majorant); outer
   regions g≥41/250 (ch44), c≥0.19 (ch47), energy exclusion y+z≥4/25 (ch47).
8. **Several drivers** (ch34 Simultaneous shared A/B: Σ|c_j|²≤16/2500, max|c_j|≤1/50, r≤1/1000 ⇒
   `Λ ≤ S − (3/4)Σ|c_j|⁴ − r²/200`; content norms ‖∇_αΛ|_0‖≤51√B_6, ‖∇_βΛ|_0‖≤25√B_6); ch55 unrestricted A/B
   on small Wick drivers (c_max≤1/50, e≤1/100, g²∈[7/200,9/200]): `Λ ≤ S − (49/100)k_4 − E_AB/2000`; two drivers
   retained penalty (thm:buffered-two-driver-retained): c_j≤0.03, g∈[0.185,0.22] ⇒ `Λ ≤ S − 2k_4 − e_AB/2000`;
   two-driver regions with A (ch36): exact K for A≤√k_4/20 at every amplitude, A≤√k_4/8 for c_k≤0.141; any N:
   Λ<S−10⁻⁶ for k_4≥9/10000, A≤√k_4/175; S+87.2·10⁻⁶ for k_4≤1/40000, A≤1/1000. Cold-start [P]+[C(AI)] g≤0.164:
   |α|²+|β|²≥0.116+0.494g² or c_1²+c_2²≥0.236 or V≥0.285 ⇒ Λ<2E|L|≤S; open inside C<0.2, A+B<0.116, B<0.06.
9. **Arbitrary coupled cubic tensors with unrestricted A/B** (ch56, ch57, ch59): g≥9/40, e≤1/25, h≤e/10 ⇒
   `Λ < S − 1/40000 − E_AB/2000 − 9E_ev/100`; zero/small buffer: e≤1/200, ‖r_A‖≤3/125, 0≤g≤1/32 ⇒
   `Λ < S − 1/10000 − (A²+B²)/2000`; zero-buffer rows e≤1/100, g≤1/32: h≤e/11, A≤7/250 (deficit 1/20000);
   tensor input κ≤(14/3)tr(I_q²)≤14e‖I_q‖_op (sharp, equal-weight Wick). Slab theorem (ch51/ch54): F any H_{2,1},
   Q=E[F|Z,X], r=‖F−Q‖²+g²: `Λ(F+gU) < S − 11/8000 + (1355/961)r` (r≤961/10⁶). Conditional mean-zero
   complement [P] (ch55 lem:buffered-conditional-complement): E[J|𝒜]=0 ⇒
   `Λ(Q+J+gU) ≤ Λ(Q+gU) + (√π/(2g) − p)‖J‖²`.
10. **Global exclusions for A** (ch40, ch47, ch58): V≥13/20 or V≥1/12+(19/5)u ⇒ K; y+z≥4/25 ⇒ S−1/5000;
    √z≥0.351 or y+z+e+d≥0.217 ⇒ S−1/10000; circular-mean exclusion (thm:cm-exclusion) [P]+[C_float]: for
    G=q+gU+(T−1)r_A+Z²r_B/√2, any circular q ⊥ first chaos, `‖α‖²+‖β‖² ≥ 3/50 or E|q|²+g² ≥ 8/25 ⇒ Λ<S−1/1000`
    (needs odd charges only; even sectors excluded). Local theory: any coupled cubic near the optimal buffer,
    radius 1/20000 (ch40 thm:full-buffer-local).
11. **Response-side constraints coupling A to q** (original-response route only): parallel profile tied to
    a(v) (eq:sector-joint-profile, eq:jrb-parallel); transverse r_⊥ and even energies charged to the support gap
    (eq:sector-effective-moment, eq:jrb-main); rotation identity `ℓc_0+2βc_A+√2βc_B = T_q*h_even`; K_rot penalty
    ‖2βr_A+√2βr̄_B‖²/(ε²t²+9ε‖G‖²); anisotropic penalty matrix 𝒫_AB (⪰(31/100)I); ellipse penalty −(A_2+E_2)/1250;
    certified q_0 example: ‖r_⊥‖<0.001569 forced.

**Mixtures of the A-shell with a remote cubic (the open core G=(T−1)U+H):** what is covered: H=cH(X) with
U∝X (item 7, all amplitudes); H a small unequal Wick sum with ‖U‖≤10⁻³ (item 7/8); H Gaussian-factor with
coefficients independent of U's drivers (item 6); (U,H) with E[H̄U]=0 in the cone u≤0.00525+0.319w or strip
w≥0.0225, u≤0.0463 (item 1); ‖U‖≤3/125 with ‖H‖²≤1/200 at g≤1/32 (item 9); large amplitudes (item 10);
fourfold-symmetric (item 4); conditionally Gaussian H given U's drivers (item 5 = theorem (B)). What is NOT:
the rectangle `w<0.0223, u>0.00551+0.319w` with genuinely non-Gaussian H sharing U's drivers, small buffer
g<0.164, several drivers at finite amplitude, coefficient fields — ch36 "The crux", item 1 of "What remains".

## 5. Manuscript statements that could close the open core together with theorems (A)/(B)

(A) = same-norm domination for every cubic vanishing at z₁=0 (all shells but A); (B) = same-norm domination for
conditionally-Gaussian-given-z₁ adversaries with quadratic variance profiles (A-shell with Gaussian drivers).

1. **Orthogonality-only bound** thm:shared-a-audit [P,C] + strips thm:shared-a-strip-audit: already a statement on
   exactly G=(T−1)U+H using only E[H̄U]=0; closing the core means removing the rectangle w<0.0223,
   u>0.00551+0.319w. The method is saturated (slope within 10⁻⁶ of optimal); the next ingredient must be a law
   envelope of |H+cU| retaining more than its second moment (the fourth-moment content term 4cRe⟨U,Π_{1,0}(H|H|²)⟩).
2. **Zero-buffer A cost** (ch46, κ=19/100 for ‖U‖≤1/16) [C] reduces the core to the content inequality
   `2Re⟨U, Π_{1,0}F_A(H)⟩ ≤ (19/100)‖U‖² + (S − Λ(H))`, i.e. (T₀) with the averaged curvature 0.19 (certified) in
   place of 0.292/0.466; combine with the remote deficit Λ(H)<S+10⁻⁵ (ch22/ch24, C_6=40.45313) and the content
   theorems: second-order content `‖Π_{1,0}F(q)‖² ≤ (3/25)(4A_1²+2B_1²)σ⁴(m−2)` [P], third-order content,
   weighted content `|E[r̄q|q|²]|² ≤ 3κ α*(Γ+Γ'ᵀ/2)α` (ch15), sharp influence κ≤(14/3)tr(I_q²) [P].
3. **Joint replacement with explicit coupling cost** polar:joint (16) [P]: extends (B) to non-Gaussian H with error
   2√([p+(α+β)²][2κ/(3p²)+8J/(9p)]) — quantitative Wasserstein–Stein bridge from theorem (B); currently weak.
4. **Exact averaged first variation** avg:profile [P] + the forest architecture (ch29 §"Proposed architecture"):
   profile term `E_T2h(V(T),ℓ(T)) − EV/ε ≤ S − Σd_sec m_sec` with d_A≈0.466 (to be certified by 1-D interval
   integration) and cumulant term with every T-weight integrated before suprema; near-Gaussian regime needs
   `content² ≤ 4d_A d_q`, "about twice the room of the pointwise (T₀)".
5. **Fourfold/circular symmetry theorems** (eq:c4-a-theorem) [P]: all-amplitude A deficit whenever
   (H,U) =_law (H,iU); a symmetrisation of the core (averaging U over i^k) would reduce to the content of the
   non-symmetric part.
6. **Conditional mean-zero complement** lem:buffered-conditional-complement [P] and the slab theorem (ch51/54):
   split H = E[H|drivers of U] + J; the one-driver theorem (OD) handles the first part when it is ∝H(X); the lemma
   pays (√π/(2g)−p)‖J‖² (needs a buffer; zero-buffer transfer via (eq:sg-smoothing) costs pg², with g=1/128
   affordable: allowance M_{1/128} ≤ S+1.992·10⁻⁵).
7. **Circular-mean exclusion** thm:cm-exclusion + shared-energy exclusions (ch47) + small-amplitude tensors
   (ch56/57): outer and inner regions; the glue between ‖U‖≥3/125 and ‖U‖²<3/50 at small buffer is the gap.
8. **Gaussian-marginal obstruction** (ch35) [P] is the constraint on any proof: it must use a joint fixed-chaos
   identity (E‖DH‖²=3‖H‖², Stein inputs of the actual cubic), not the law of |H| or Gaussian-noise tests alone.
   Resolvent identity thm:resolvent [P] `E[Ȳ((3N_u^σ−p)Ψ)(q)] = 3E[ȲR_Ψ]` is the available tool of that kind.
9. **Response-side closure (if the core is attacked on admissible responses only)**: K_rot [P] penalty
   ‖2βr_A+√2βr̄_B‖²/(ε²t²+9ε‖G‖²) (pays 13–57%), rotation identity ℓc_0+2βc_A+√2βc_B=T_q*h_even [P],
   (eq:jrb-main)/(eq:sector-joint-profile) tying r_∥ to a(v) and charging r_⊥ — these restrict which (U,H) pairs
   are admissible at all (remote energy e<0.046266, ‖r_⊥‖ tiny at the certified tensors), and the ellipse/aniso/
   weighted caps already cover e≤0.0148 on the whole strip and 𝒱_*≤0.0325.
10. **PVD/BNC buffer-closure equivalence** (ch34 §"Gaussian-buffer closure") [P]: buffered and unbuffered sharp
    L¹ statements are equivalent — useful to transfer (A) between buffered and zero-buffer forms without loss.

Sources read: new/legacy-reading-guide.tex; legacy/ch7-conjectureK.tex; legacy/ch36-K-state.tex;
legacy/ch25-parts/{20,30,40,60,70,85,86,10}-*.tex; legacy/global-response/*.tex (4);
new/symmetric-response-replicas-20261023.tex; legacy/lower-bound/{obstruction-1402,sharp-circular}.tex;
legacy/ch61-shared-a-regions.tex; legacy/ch62-spherical-kernel.tex; skims of ch11, ch27, ch28, ch29, ch31, ch33,
ch34, ch35, ch40, ch46, ch48, ch55, ch58.
