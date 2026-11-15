<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/conjecture_K_report.md (file dated 2026-10-20). Only this line was added. -->
# Conjecture K: full status report

*What is proved, what is measured, what is dead, and what a proof must
do.* Claude (Anthropic), for Alin Galatan's project and for the
lower-bound GPT. Bounds updated to the state of 20 October 2026 (Lean
`master` `20eb917`); Conjecture K content through Ch. 27 of the main
document (GPT package of 15 October, 23:28).

**Current state (20 Oct 2026).** Lean-certified interval
$1.401674103<K_G^{\mathbb{C}}<1.404599424$ [\[L\]]{.sans-serif}
(`master` `20eb917`). The lower end is the common-law cover
cert-combined-e on the per-row data cert-0745e at
$\varepsilon=149/200$, $B=7134326/10^7$; it does *not* use Conjecture K.
Not merged: the rotation-gate certificate $1.401621059539$ (branch
`work/lower-rotation`; needs the extra hypothesis `RotShared`, and is
below the current bound anyway) and the upper branches
`work/upper-stable` ($1.404596071666$) and `work/upper-nested` (both
replace the Lean head computation by a `head_close` hypothesis).
$K_\eta$ with $\eta\le10^{-4}$ would give $K_G^{\mathbb{C}}>1.402$
(first section); the cap is now $1.66\cdot10^{-4}$ above the $1.402$
threshold ($0.7134326$ vs $0.713267$). Time stamps below (15 Oct) are
dated records.

Labels: [\[L\]]{.sans-serif} Lean; [\[P\]]{.sans-serif} pen-and-paper
proof (audited unless said otherwise); [\[C\]]{.sans-serif} exact or
interval computation; [\[F\]]{.sans-serif} float
numerics (grids stated in the cited files). Everything cited lives under
`~/workspaces/grothe/handoff/research-third-decimal/` (main document
`handoff-2026-10-15/main.pdf`, about 200 pages; code in `kattack-2026-10-15/`,
`L2-2026-10-15/`, `pipeline/`) or in GPT's packages under
`~/Documents/Codex/2026-10-10/plea/outputs/`.

# State on 20 October, evening (read this first) {#sec:state2010}

The rest of this report is the dated record. The current reference is Chapter 36 of the main handoff (`ch36-K-state.tex`); the proofs are in its Chapters 28–35.

**Exact reductions.**

1. One visible variable: Λ(G) = E_T[E(|ℓ(T)+R_T| + |ℓ(T)−R_T|) − E|R_T|²/ε], with R_T = q + (T−1)r_A + (T/√2)r_B + √T(Y+W) and the price exact.
2. The visible law is a Gaussian scale mixture.
3. K for all ε ⟺ Gaussian domination on every variance sphere.
4. Exact remote K ⟺ E|q| ≤ (√π/2)‖q‖₂ on H21 (PVD₀), which is implied by BNC (open).
5. Λ ≤ S − α²/10 − β²/4 − γ²/25 + D, with D the non-Gaussian gap.

**Proved.**

- remote cubics (Λ < S + 1e-5);
- the diagonal (penalties 0.571, 0.265) and the even sectors;
- the coherent one-driver Wick A family, with exact K;
- the whole Gaussian covariance class, exact K with penalties;
- shared A/B for unequal Wick sums with small coefficients;
- B only up to normalised fourth moment 3.757;
- independent blocks (weak K, O(1/N));
- remote cubics whose Hermite monomials all involve one coordinate: exact K;
- shared A/B on arbitrary Gaussian-factor drivers CᵀX + gU: Λ ≤ S + 5e-5 − (‖α‖²+‖β‖²)/200, exact once the A/B variance is ≥ 0.01.

**False.** (T); equal-variance peeling; exact K-a from the scalar inputs; fibrewise domination; every single-scale strengthening (heat kernel, characteristic function, Laplace); gluing by buffer doubling.

**Open.**

1. The crux for 1.402: D ≤ penalties + η_AB (η_AB ≈ 9.06e-5) for cubics *nonlinear in a driver shared with A/B*, e.g. cH(X) with A and B on X, then several drivers, then general coupled cubics.
2. Diagonal interactions and the row envelope, then the certificate at ε ≈ 0.7564.
3. PVD₀/BNC (exactness only).

# The statement and what it buys

Peak row $\varepsilon=0.7564$, $(\ell,\beta)=(0.8456,0.1432)$,
i.e. $L=Z\,a(|Z|^2)$, $a(u)=\ell+\beta(u-2)=0.5592+0.1432u$. For
$G\in H_{2,1}(\mathbb{C}^n)$,
$$\Lambda(G)=\mathbb{E}|L+G|+\mathbb{E}|L-G|-\|G\|_2^2/\varepsilon,\qquad S=\sup_{\sigma\ge0}\{2\mathbb{E}|L+\sigma W|-\sigma^2/\varepsilon\}=1.37395353\ (\sigma^*=0.2009).$$

::: conjecture
**Conjecture 1** (K). *$\Lambda(G)\le S$ for all $n$ and all
$G\in H_{2,1}(\mathbb{C}^n)$; weak form $K_\eta$:
$\Lambda(G)\le S+\eta$.*
:::

Exact gate-free row [\[P\]]{.sans-serif}:
$\sup\operatorname{Re}\langle f,Tg\rangle\le t^2-2\ell t+2\beta^2/\varepsilon+\sup_G\Lambda(G)$.
Under $K_\eta$ the certificate is rows $(\ell,\beta)$, the explicit
potential $\Phi_0$, the existing moment/Stein layer and the envelope:
realistic cap $0.713160+\eta$ at $\varepsilon=0.7564$, so $K_\eta$ with
$\eta\le1.0\cdot10^{-4}$ gives $K_G^{\mathbb{C}}>1.402$; $K$ itself
gives $1.4022$ (ceiling of the cubic witness $1.402258$). Decomposition
of $G$ by its dependence on $Z$ (coefficients are chaos elements of the
remote coordinates $w$):
$$G=\underbrace{q_0}_{H_{2,1}(w)}+\underbrace{r_A}_{H_{1,0}}(T-1)+\underbrace{r_B}_{H_{0,1}}\tfrac{Z^2}{\sqrt2}+\underbrace{r_Y}_{H_{1,1}}Z+\underbrace{r_W}_{H_{2,0}}\bar Z+\nu\,\tfrac{Z(T-2)}{\sqrt2},\qquad T=|Z|^2 .$$

# Status by sector

::: center
  piece                                                                                                                                                                                                                                                                                                                                status                                                                                                                                                                                    source / content
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  $q_0$ alone: all nonzero $X$-frequency sectors of one coordinate, $Q=cH(X)+SX+T\bar X+CX^2/\sqrt2+gG$, $(S,T,C)$ arbitrarily dependent remote, $\mathbb{E}S=0$, every amplitude and profile                                                                                                                                          [\[P\]]{.sans-serif} GPT, 13:53 package, algebra re-derived and tested here (§[\[sec:kfull\]](#sec:kfull){reference-type="ref" reference="sec:kfull"})                                    $\Lambda\le S-\sqrt\pi k(c^2+2\mathbb{E}|C|^2)/[16(M+g^2+k)^{3/2}]$, $k=$ total non-buffer variance, $M=\mathbb{E}|L|^2$; two Jensen steps on the concave visible-smoothed Rice mean (needs $L$ a Gaussian variance mixture) and one exponential IBP; worst centered law $S=\pm i\sqrt v$; open: the frequency-zero part $(|X|^2-1)V+q_0'(Y)$
  $q_0$ alone: the complete one-coordinate star $cH(X)+S_0X+T_0\bar X+CX^2/\sqrt2+D(|X|^2-1)+gG$, incl. the phase-zero channel; hence every two-coordinate cubic (winding-number choice of the coordinate); with a remote remainder $q_0$ under the budget $v_0\le\frac25c^2+\frac{33}{64}\mathbb{E}|C|^2+\frac1{32}\mathbb{E}|D|^2$   [\[P\]]{.sans-serif} GPT, 14:47 package, 169/170-leaf certificates replayed (§[\[sec:knext\]](#sec:knext){reference-type="ref" reference="sec:knext"})                                    exact K; beyond the budget $\Lambda\le S-\Delta(V)+\min\{1.81k,2/7\}B_+$, so $K_\eta$ iff $\min\{1.81k,2/7\}B_+\le\eta+\Delta(V)$; no coordinate-selection theorem for $n\ge3$
  $q_0$ alone, **every** remote cubic, every dimension, amplitude and buffer, at the peak                                                                                                                                                                                                                                              [\[P\]]{.sans-serif} GPT (upper-side, 20:01) + [\[C\]]{.sans-serif} Arb certificate replayed                                                                                              $\Lambda(q+gW)<S+2.2\cdot10^{-5}$: two-node moment theorem (cubic Hermite majorant, alternating derivatives of $\Phi_0(\sqrt u)$ from the Gaussian mixture) with $C_6=50$; refined to $<10^{-5}$ with our $C_6=40.45313$ and $1.7\cdot10^{-5}$ with $C_6=50$ (lower-bound GPT, 20:37, replayed; Ch. 24); exact relaxation loss $9.8\cdot10^{-6}$ (the $6.3\cdot10^{-5}$ of the moment LP was solver-suboptimal); row box not covered (Ch. 22 of the main document; a formula slip there, $f(u)$ for a fixed shift, corrected in Ch. 25, certificates unaffected)
  $q_0$ alone, general law in $n\ge3$ beyond the budget (K-a), moment LP                                                                                                                                                                                                                                                               [\[F\]]{.sans-serif} superseded                                                                                                                                                           moment LP: $\Lambda_{q}\le S-c_1(x)$, $c_1\approx1.2\cdot10^{-4}x^2$; moment-only comparison has a genuine loss $9.6\cdot10^{-6}$ (two-point Gauss--Laguerre law, GPT); Stein cuts (proved [\[L\]]{.sans-serif} from H1/H2) recover it; certificate-ready
  $Y,W,B$ with conditionally Gaussian $q_0$ (random variance), arbitrary latent law                                                                                                                                                                                                                                                    [\[P\]]{.sans-serif} GPT                                                                                                                                                                  visible-factor comparison: $\mathbb{E}(|L+Q|+|L-Q|)\le2\mathbb{E}|L+\sqrt vG|$; also convex order and all-threshold stop-loss
  $A$ with independent Gaussian driver, $|\alpha|^2\le a^2/2$ ($|\alpha|\le0.395$)                                                                                                                                                                                                                                                     [\[P\]]{.sans-serif} GPT                                                                                                                                                                  centered-radial comparison (derivative-ratio bound $-2\le\partial_sg/\partial_ug\le1$); joint with $Y,W,B$ when the driver is independent of all latents
  $A$ sharing its drivers with a Gaussian-factor residual $q_0=\sum_jX_jS_j+\sqrt sG$, $r_A=\sum\alpha_jX_j$, $S$ centered of arbitrary law, independent of the drivers                                                                                                                                                                [\[P\]]{.sans-serif} GPT, replayed here (PASS, 58 s)                                                                                                                                      global-A certificate: $\Lambda\le S+10^{-5}-\|\alpha\|^2/200$, all dimensions and amplitudes; conditional variance $w(T)=t+2p(T-1)+r(T-1)^2$, supporting multiplier $-\tfrac75p$ averaging to zero, payoff decreasing in $r$ at fixed $(V,p)$; 10,697 boxes / 18,019 vertices, or 228 / 321 after the covariance transfer; benchmark lower bound $1.37395328457$ computed inside the verifier (our float $S=1.37395353$ agrees)
  proper-Gaussian channels $uT+vT^2/2$ on top of that $A$ baseline, conditionally orthogonal (zero pseudocovariance)                                                                                                                                                                                                                   [\[P\]]{.sans-serif} GPT                                                                                                                                                                  deficits $\ge\tfrac35\mathbb{E}u+\tfrac{17}{20}\mathbb{E}v$ from the universal Rice derivative bound $0\le\partial_w2F\le3/(5\sqrt U)$; covers shared-driver $B$ only under $\sum S_j\beta_j=0$, $\sum\alpha_j\beta_j=0$
  $Y,W$ on top of *any* $q_0$, arbitrary dependence                                                                                                                                                                                                                                                                                    [\[P\]]{.sans-serif} GPT                                                                                                                                                                  $\Lambda(q+Zr_Y+\bar Zr_W)\le\Lambda(q)-(1/\varepsilon-\tfrac{13}{10})(\mathbb{E}|r_Y|^2+\mathbb{E}|r_W|^2)$ on the box $a\in[.5591,.5593]$, $b\in[.1431,.1433]$; sharp majorant $|x+y|+|x-y|\le2|x|+|y|^2/|x|-(\operatorname{Re}y\bar x)^2/(2|x|^3)$; constant $\tfrac{13}{10}$ improved to $\tfrac{32}{25}$ (penalty $0.022\to0.042$, Ch. 27 of the main document)
  $A$ on the Wick junta: $Q=cH(X)+\alpha(T-1)X+gG$, all $c,g\ge0$, $\alpha\in\mathbb{C}$ (and jointly random coefficients, Gaussian variance-mixture buffers)                                                                                                                                                                          [\[P\]]{.sans-serif} GPT (`junta-and-b-20261015`)                                                                                                                                         $\Lambda\le S+73/10^6$: exact ring representation, positive Bernstein integration in the two radii, circumscribed-polygon angular oracle, convex interpolation in four real parameters; 4,256 boxes, 10,198 vertices, integer interval arithmetic. The J1 proposal (A-only, weak form) realised; the slack $7.3\cdot10^{-5}$ fits the $\eta\le10^{-4}$ budget
  one shared $B$ driver with arbitrary centered content: $Q=XS_0+\beta Z^2\bar X/\sqrt2$, $S_0$ any centered variable independent of $(Z,X)$                                                                                                                                                                                           [\[P\]]{.sans-serif} GPT                                                                                                                                                                  $\Lambda\le S+10^{-5}-|\beta|^2/200$, nonzero pseudocovariance allowed; 8,833 boxes via a positive logarithmic Laplace quadrature oracle; multiplier cancels since $\mathbb{E}S_0=0$
  joint $A+B$ with nonzero shared content, $\alpha^{\top}\beta=0$, $\mathbb{E}\operatorname{Re}\langle S_0,\alpha\rangle=0$, conditional phase-spread (circular or $\pm d$)                                                                                                                                                            [\[P\]]{.sans-serif} GPT                                                                                                                                                                  deficits $\|\alpha\|^2/200+281\|\beta\|^2/400$ by circularising the pseudocovariance and a PSD congruence onto the global-$A$ dual
  $A$ and $B$ simultaneously on the Wick driver: $Q=cH(X)+\alpha(T-1)X+\beta Z^2\bar X/\sqrt2+gG$, all $c,g\ge0$, $\alpha,\beta\in\mathbb{C}$ (and independent random coefficients)                                                                                                                                                    [\[P\]]{.sans-serif} GPT, 13:13 package, replayed (§[10](#sec:kjoint){reference-type="ref" reference="sec:kjoint"})                                                                       $\Lambda\le S+10^{-4}$ by the ellipse phase ordering (perpendicular major axis maximises the Rice mean), convex envelope, Bernstein radii, integer intervals; 26,446 boxes / 79,159 vertices; the slack is intrinsic to the phase relaxation (proved), so exact K on the junta needs a phase-retaining argument; the deficit-retention form $\Lambda\le S-(1-\theta)d_q$ remains [\[F\]]{.sans-serif} ($\theta\le0.164$ on the fine J1 scan)
  joint $A{+}B$ on one Gaussian factor with buffer, arbitrary complex $\alpha,\beta$, remote state $(S_0,\alpha,\beta,g)$ with $\mathbb{E}\operatorname{Re}(S_0\bar\alpha)=\mathbb{E}\operatorname{Re}(S_0\beta)=0$; any dimension if $\alpha=\kappa\bar\beta$                                                                         [\[P\]]{.sans-serif} GPT, 13:13 package, replayed                                                                                                                                         $\Lambda\le S+8\cdot10^{-5}$; 236,786 boxes / 898,217 vertices; supersedes the $\alpha^{\top}\beta=0$ + phase-spread row above in one driver; noncollinear $A{+}B$ in dimension $\ge2$ is the open eight-parameter target
  $B$ on any conditionally proper Gaussian-factor residual $\sum S_jX_j+gG$, any dimension                                                                                                                                                                                                                                             [\[P\]]{.sans-serif} GPT, 13:13 package, replayed                                                                                                                                         $\Lambda\le S+10^{-5}-\mathbb{E}\|\beta\|^2/200$; 24,967 boxes; not for an antiholomorphic residual $\sum P_j\bar X_j$
  weakened scalar content condition (T) of Ch. 15: $(\mathcal C_A+\mathcal C_B)\lambda_{\max}(M)\le0.292(d_q+\eta)$                                                                                                                                                                                                                    **FALSE** [\[C\]]{.sans-serif} (GPT interval certificate, replayed; MC confirmed)                                                                                                         $q=\frac7{20\sqrt2}X^2\bar Y$ (kurtosis 12): left side $>0.0354$, $d_q+10^{-4}<0.0347$, while both actual contents are exactly zero (phase symmetry); the target is now (T$_0$) with the tensor contraction $c_F=\mathcal B_q(A,B)$ kept; tool: $F_D(u)=-u\int e^{-s|u|^2}\mu_D(ds)$, $\mu_A\ge0$, $\mu_B\le\mu_A/\sqrt2$ exactly, so $\Pi_{1,0}F_D(q)=-\int\Pi_{1,0}(qe^{-s|q|^2})\mu_D(ds)$
  coupled zero-content kernels $Q_n=(2n)^{-1/2}\sum X_i^2\bar X_{i+1}$                                                                                                                                                                                                                                                                 [\[P\]]{.sans-serif} GPT, MC confirmed [\[C\]]{.sans-serif}                                                                                                                               $\mathbb{E}\bar X_iF(Q_n)=0$ for every $F$ (root-of-unity rotation), $\mathbb{E}|Q_n|^4=2+18/n$, $M=\frac3nI$; in the kurtosis window for $5\le n\le300$; isolates the K-a obligation for coupled residuals (outside the star budget)
  (T$_0$) certificate format: zero-projection functions $a_j=(N-1)[qe^{-s_j|q|^2}]$, $\sum_D\|\Pi_{1,0}F_D(q)\|^2\le\sum_D\mathbb{E}|F_D(q)-\sum_j\lambda_{Dj}a_j|^2$                                                                                                                                                                  [\[P\]]{.sans-serif} GPT (crossbound, 17:22), audits replayed; ratios [\[F\]]{.sans-serif}                                                                                                keeps the tensor orientation through $(q,\Gamma(q,\bar q),\Gamma(q,q))$, no profile derivatives; float ratios $0.47$--$0.72$ of $0.292(d_q+10^{-4})$ on buffered juntas and a buffered coupled $n=2$ kernel in the kurtosis window (between the exact $\le0.39$ of Ch. 15 and the failing scalar chains $1.9$--$2.2$); needs uniform joint weighted-integral bounds
  weaker target K$_{\rm rot}$ (lower-bound GPT, 21:45): at a global norm maximiser $\Lambda(G)-\|2\beta r_A+\sqrt2\beta\bar r_B\|^2/(\varepsilon^2t^2+9\varepsilon\|G\|^2)\le S+\eta$ suffices                                                                                                                                         [\[P\]]{.sans-serif} (rotation Ward identity, finite-dimensional maximisers; seven checks replayed [\[C\]]{.sans-serif})                                                                  retains both squares dropped by the gate-free row; penalty on the parallel $A/B$ combination only; on the junta data it pays $13$--$57\%$ of the measured mixed gain, $\le12\%$ of the certified gain bound; transverse $A/B$ direction and the global cap remain open (Ch. 25 of the main document). Sharper law-sensitive denominator $\|D_pG\|^2\le9R+3\mu-2(\sqrt\mu-\sqrt R)_+^2$ ($R=V-v_0$, $\mu=\min\{3v_0,\sqrt{3\kappa_q}/2\}$) in Ch. 27. Using it in Lean would need the stationarity identity as an extra hypothesis (cf. `RotShared` below)
  K$'$ (retained first-chaos penalty): $\Lambda'(G)\le\inf_v\mathcal D_G(v)\le\Lambda(G)$                                                                                                                                                                                                                                              [\[P\]]{.sans-serif} GPT, gap identity checked here                                                                                                                                       every trial multiplier $v$ gives a valid upper bound; $\Lambda-\|Pk_0\|^2$ at the unpenalised phases is *not* one (exact counterexample); global bound on $\sup_G\inf_v\mathcal D_G$ open
  lower certificate itself (dated, 15 Oct): shared-residual refinement $1/B>1.401616861$ ($B=356730868227/500000000000$)                                                                                                                                                                                                               [\[C\]]{.sans-serif} by GPT's verifier; [\[L\]]{.sans-serif} (merged from `work/lower-mixed`, `2c54991`)                                                                                  fixed first gate coordinate, one joint moment/Stein dual for the mixed potential, kurtosis kept through interpolation; needs the shared-law form of H1 (one $(\tau,U)$ for all rows, now the hypothesis `SharedReduction`); followed at 22:4x by the regional refinement $1.401619290904$ [\[L\]]{.sans-serif}, since superseded by the ladder in the next rows (current $1.401674103$ [\[L\]]{.sans-serif}) (Ch. 18, 21 of the main document)
  exact K-a from radial moments + all Stein cuts                                                                                                                                                                                                                                                                                       **impossible** [\[P\]]{.sans-serif} (external note, GPT-reviewed; verifiers replayed [\[C\]]{.sans-serif})                                                                                artificial laws $e^{-u}(1-bL_4+b^2h)$ pass every scalar input yet exceed $S$; their excess is $<4.65\cdot10^{-6}$ (GPT), so $K_\eta$ is untouched; spectral AMMP inequalities exclude them and are candidate extra cuts for the residual layer (Ch. 19 of the main document)
  K$'$ first-chaos dual (upper-side GPT, 18:36): $\Lambda'\le\Lambda_P:=\inf_{a\in H_{1,0}}\{\|a\|^2+\mathcal F(G-a)\}-\|G\|^2/\varepsilon\le\Lambda$                                                                                                                                                                                  [\[P\]]{.sans-serif}; penalty constant [\[F\]]{.sans-serif}                                                                                                                               $=$ Ch. 17's dual restricted to first-chaos multipliers; $q$-only: $\Lambda_P(q)\le\Lambda_q-\|\Pi_{1,0}F_0(q)\|^2/(1+H_0/2)$, multiplier $0.41$ at the peak, so the usable K$'$ relief is $7$--$14\%$ of the mixed-gain allowance (not $16$--$31\%$); pinned-gate intermediate certificate $1.401615120323$ [\[C\]]{.sans-serif}, exact only, never ported to Lean (superseded) (Ch. 20 of the main document)
  lower certificate chain (frozen tables, $\varepsilon=0.745$; dated record of 15 Oct, 23:40): $1.401615098\to1.401615120\to1.401616861\to1.401619290904\to1.401621059539$                                                                                                                                                             [\[C\]]{.sans-serif} (all replayed); $1.401619290904$ [\[L\]]{.sans-serif} (`b623a59`/`794ae43`, 22:4x); $1.401621059539$ not merged as of `20eb917`                                      `work/lower-rotation` needs the extra hypothesis `RotShared` and was built on the old rows cert-0745(b), below the current bound. the frozen-table relaxation has a certified floor: cap $\ge0.7134074$, endpoint $\le1.4017236$ for any law/mesh/mixture/cover optimisation with the old gates; the last step (lower-bound GPT, 22:48) strengthens the first gate on two combined profiles by the rotation Ward identity at a global norm maximiser ($\mu=1$, bounded-response budget $\gamma(t)=2.7267-3t$), so the floor no longer binds as stated (not recomputed); then $1.9\cdot10^{-4}$ in cap from $1.402$ (Ch. 21, 26 of the main document). The Lean ladder then moved to per-row and common-law certificates, all [\[L\]]{.sans-serif} on `master`: cert-0745c $1.401629903$ (sharper anchored caps, rows $0.84$--$0.855$) $\to$ cert-combined $1.401643474\to$ cert-combined-d $1.401668504\to$ cert-combined-e $1.401674103$ (current; $1.66\cdot10^{-4}$ in cap from $1.402$). The structural looseness $\sim10^{-4}$ of the anchored caps on $s\in[0.2,0.35)$ is what the localised anchored caps ($s\in[0.2,0.4)\cup[0.525,0.6)$) of cert-combined-d/e target
  $A$-sector, shared non-Gaussian remote $Q$, every amplitude, under the finite symmetry $(Q,A)\overset{d}=(Q,iA)$                                                                                                                                                                                                                     [\[P\]]{.sans-serif} GPT (23:28), replayed [\[C\]]{.sans-serif}                                                                                                                           $\Lambda(Q+(T-1)A)\le\Lambda(Q)-\frac{999}{302560}\mathbb{E}|A|^2$ ($0.0033$; $0.03917$ under full conditional circularity); true penalties $\approx0.06/0.11$ [\[F\]]{.sans-serif}; covers e.g. $X^2\bar Y$ with $A$ along one coordinate, *not* the coherent junta $cH(X)$, $A=\alpha X$, nor generic/L2/coupled kernels (Ch. 27 of the main document)
  $B$-sector under conditional centring $\mathbb{E}[B\mid Q]=0$; with $Y/W/\nu(Q)H$ under $(Q,B,Y,W)\overset{d}=(Q,-B,Y,W)$                                                                                                                                                                                                            [\[P\]]{.sans-serif} GPT (23:28), replayed [\[C\]]{.sans-serif}                                                                                                                           penalty $609/1891=0.322$ (true $\approx0.41$ [\[F\]]{.sans-serif}); centring fails on the coherent junta ($\mathbb{E}[\bar XH|H|^2]\ne0$), as for the even channels of Ch. 24 (Ch. 27 of the main document)
  general coupled cubics (coefficients depending on the drivers); noncollinear vector $A{+}B$; antiholomorphic residuals                                                                                                                                                                                                               **open**                                                                                                                                                                                  the "remote centering + arbitrary buffer" bridge between the Wick face and the Gaussian-factor face is false (skew two-point coefficient, negative fourth cumulant, §[10](#sec:kjoint){reference-type="ref" reference="sec:kjoint"}); a bridge must keep chaos restrictions. The symmetric classes of Ch. 27 (rows above) are now proved but exclude exactly the coherent shared-driver content (they fail on the Wick junta)
  $Y,W$ on top of $A/B$                                                                                                                                                                                                                                                                                                                **open** (partial)                                                                                                                                                                        interaction obligation (§[8](#sec:interaction){reference-type="ref" reference="sec:interaction"}); proved only for $B$ under the sign symmetry $(Q,B,Y,W)\overset{d}=(Q,-B,Y,W)$ (Ch. 27)
  $\nu$ on a conditionally proper Gaussian baseline (any conditional variance), complex $\nu$; real $\nu$ on any conditionally Gaussian baseline                                                                                                                                                                                       [\[P\]]{.sans-serif} GPT, 14:47 package, constant re-verified [\[C\]]{.sans-serif}                                                                                                        $\Lambda(Q_0+\nu H)\le\Lambda(Q_0)-(1/\varepsilon-103/100)|\nu|^2$, deficit $55227/189100=0.292$, globally; $C_\nu=\mathbb{E}[\sqrt T(T-2)^2/(2(a+bT))]=0.9918\le1.0291<1.03$; the trivial radius bound $F_w'\le1/(2\sqrt u)$ made rigorous on Gaussian baselines
  $\nu$ on *every* remote residual law (no visible $A/B$) at the peak                                                                                                                                                                                                                                                                  [\[P\]]{.sans-serif} GPT (20:01) + [\[C\]]{.sans-serif}                                                                                                                                   $\Lambda(Q+\nu H)\le\Lambda(Q)-0.571(\operatorname{Re}\nu)^2-0.265(\Im\nu)^2$ on the profile box (real penalty $0.011\to0.322\to0.462\to0.571$ at 20:01, 20:37, 22:28, 23:28, the last by keeping one common shift across the eleven envelope terms, all replayed; true directional deficits $\approx0.61,0.33$ [\[F\]]{.sans-serif}); open only on top of visible $A/B$
  $Y,W$ together with $\nu$ on a remote baseline                                                                                                                                                                                                                                                                                       [\[P\]]{.sans-serif} conditional                                                                                                                                                          latest (Ch. 27, real $\nu(Q)$): $\sup_\nu\Lambda(Q+ZY+\bar ZW+\nu(Q)H)\le\Lambda(Q)-\frac{1988}{47275}J+\frac{45444512}{26996475}J_{\rm pred}$, so a net deficit $J/1100$ if $J_{\rm pred}\le J/41$ ($J/2000$ if $J_{\rm pred}\le J/123$ for complex $\nu$); earlier $\frac{417}{18910}J+\frac{13004407}{2496610}J_{\rm pred}$, threshold $J/240$ (Ch. 24). Sufficient conditions on the conditional means of $Y,W$ given $Q$, not automatic for shared-driver cubics
  $\nu$ on top of visible $A/B$ sectors                                                                                                                                                                                                                                                                                                [\[F\]]{.sans-serif} harmless                                                                                                                                                             must stay a base-profile parameter ($(z,H)$ plane secant constant $1.71>1/\varepsilon$ at a fixed non-Gaussian residual law); $|\nu|=0.05$ costs $1$--$3\cdot10^{-3}$
  polar rank-two $A{+}B$: $sX+d\bar X+gG+(T-1)(\alpha X+\gamma\bar X)+\frac{Z^2}{\sqrt2}(\beta\bar X+\delta X)$, improper residual allowed, $\mathbb{E}\operatorname{Re}(s\bar\alpha+d\bar\gamma)=\mathbb{E}\operatorname{Re}(s\beta+d\delta)=0$                                                                                       [\[P\]]{.sans-serif} GPT, 14:47 package (exact polar reduction to the replayed one-driver cover)                                                                                          $\Lambda\le S+8\cdot10^{-5}$; $A$-only face $+\nu H$: $\le S+10^{-5}-(\mathbb{E}|\alpha|^2+\mathbb{E}|\gamma|^2)/200-0.292|\nu|^2$; needs exactly two real drivers
  local exact K at the Gaussian point, all sectors $q,A,B,Y,W,\nu$ sharing drivers, free total variance, fixed dimension                                                                                                                                                                                                               [\[P\]]{.sans-serif} GPT, 13:53 package, interval Hessian replayed (46 s)                                                                                                                 certified quadratic gaps $A{+}B$ $3/20$, $Y$ $1/25$, $W$ $3/5$, $\nu$ $3/10$ on $7/200<v_*<9/200$; residual directions neutral at 2nd order, $f''(v_*)\kappa(q)t^4/4<0$ at 4th; optimal mixed coefficient $H(q)=O(\|q\|^3)$ (IFT), gain at 6th order; radius may shrink with $n$; consistent with the Ch. 10 constants $0.12$--$1.13<1.322$ [\[F\]]{.sans-serif}
:::

# Structural facts (exact)

1.  **Frequency rule / half-turn identity** [\[P\]]{.sans-serif}. Factor
    $e^{i\theta}$ ($\theta=\arg Z$) out of $L\pm G$: relative
    frequencies $q_0,A:-1$; $B:+1$; $Y,\nu:0$; $W:-2$. With $O$ the odd
    part ($q_0,A,B$) and $E$ the even part,
    $\mathbb{E}_\theta\{|x+O+E|+|x-O-E|\}=\mathbb{E}_\theta\{|x+O+E|+|x+O-E|\}$.
    Hence the first variation of the even block vanishes at every $O$,
    and first-order coupling to $q_0$ exists only for $A$ and $B$ (this
    is K1's $c_z=c_H=c_{\bar z}\equiv0$, $c_A,c_B\ne0$). The rule proves
    nothing at finite amplitude.

2.  **Coordinate reduction** [\[P\]]{.sans-serif}. After a unitary
    rotation of $w$, $r_A=\alpha w_2$ and
    $r_B\in\mathrm{span}(\bar w_2,\bar w_3)$; conditional on $w_2$ the
    residual is a polynomial of degree $\le3$ in $(w_2,\bar w_2)$ with
    coefficients in the chaos of the other coordinates. The content
    problem is thus a two-coordinate problem with random coefficients.

3.  **One-line $A$-sector formula** [\[P\]]{.sans-serif}, checked to
    $10^{-6}$: since $A(Z)=T-1$ is real,
    $\Lambda(q_0+r_A(T-1))=2\mathbb{E}_{T,w}\,\mathrm{mabs}\bigl(\sqrt T a(T),|q_0+(T-1)r_A|\bigr)-\|G\|^2/\varepsilon$,
    $\mathrm{mabs}(x,s)=\mathbb{E}_\phi|x+se^{i\phi}|$. So the
    $A$-sector is a statement about the laws of $|q_0+c\,r_A|$, $c=T-1$;
    the shared driver enters the fourth moment through
    $4c\operatorname{Re}\mathbb{E}(|q_0|^2\bar q_0r_A)$,
    $c^2\{4\mathbb{E}|q_0|^2|r_A|^2+2\operatorname{Re}\mathbb{E}(\bar q_0^2r_A^2)\}$,
    $4c^3\operatorname{Re}\mathbb{E}(\bar q_0r_A|r_A|^2)$; $q_0+cr_A$ is
    mixed chaos and can have *negative* fourth cumulant (GPT: explicit
    example, $\mathbb{E}|q|^4=2.0944$), so pure-cubic moment constraints
    cannot be applied at fixed $c$.

4.  **Exact $Y$-sector formula** [\[P\]]{.sans-serif}:
    $\Lambda(q_0+r_YZ)=\mathbb{E}[\mathrm{mabs}(\sqrt T|a+r_Y|,|q_0|)+\mathrm{mabs}(\sqrt T|a-r_Y|,|q_0|)]-\text{price}$;
    for imaginary $r_Y$ the two signs coincide. Content-free, as the
    frequency rule predicts.

5.  **Invariances of the content ratio** [\[P\]]{.sans-serif}:
    $R=\|\Pi_{1,0}(q|q|^2)\|^2/\kappa^{3/2}$ is scale-free and unchanged
    by adding an independent diffuse Gaussian to $q$ (neither the
    content nor $\kappa=\mathbb{E}|q|^4-2\sigma^4$ changes); independent
    sums of juntas never exceed the Wick value $0.4703$ ($\kappa$
    additive, content cubic).

# Numerical evidence for K {#sec:evidence}

All [\[F\]]{.sans-serif}; "excess" $=\sup\Lambda-S$ over the stated
class, optimiser with analytic gradients, every start listed returned to
the Gaussian point unless said otherwise.

::: center
  adversary class                                                                                                                excess file
  ----------------------------------------------------------------------------------------------------------- ------------------------- --------------------
  $z_1$ + one ordinary coordinate + diffuse $W$, all of $H_{2,1}(\mathbb{C}^2)$                                     $+1.4\cdot10^{-12}$ kconj att3
  $z_1$ + two ordinary + diffuse, all 18 components of $H_{2,1}(\mathbb{C}^3)$                                  $+5\cdot10^{-9}$ (grid) kconj a3
  scale mixtures with Gaussian multipliers + junta + $W$                                                                         $\le0$ kconj am
  10-parameter $S$-limit family (incl. non-circular $r_Y$, $\kappa=\mathbb{E}r_Ar_B$, $p=\mathbb{E}r_Y^2$)             $2\cdot10^{-16}$ kclt gaussfam
  $n=2$ without $W$: $\sup\Lambda=1.3649281<S=1.3669130$                                                             $-2.0\cdot10^{-3}$ gate lowdim
  real-Gaussian multiplier $w_2\xi$ inside $q_0$ + all 8 sectors, peak row, 35 starts                               $+1.5\cdot10^{-12}$ kattack attxi
  same, row $\varepsilon=0.745$, $(0.8534,0.1467)$, 25 starts                                                       $+5.9\cdot10^{-14}$ kattack attxi
  junta $q_0$ + aligned $A$-sector, 216 points (§[5](#sec:gain){reference-type="ref" reference="sec:gain"})       $\le-1.0\cdot10^{-2}$ peel
  junta $q_0$ + imaginary $Y$-sector (exact formula), $a\le1$, $c\le0.4$                                            $\le-5\cdot10^{-4}$ idealBY ($Y$ rows)
:::

Tested after this table: the L2 maximisers at $n=3,4$ with free $A/B$
sectors on all coordinates (§[5](#sec:gain){reference-type="ref"
reference="sec:gain"}, last paragraph): no violation. Untested:
tiger-like non-polynomial $G$ (constrained by $G\in H_{2,1}$); even
sectors on independent drivers combined with odd sectors on shared ones.

# The mixed gain, measured {#sec:gain}

Junta residual $q_0=\sigma(aH(w_2)+\sqrt{1-a^2}W)$, $r_A=\alpha w_2$
(shared driver), aligned phase, $W$ integrated in closed form
(`peel.py`, `peel2.py`, `quadmodel.py`).

1.  **The quadratic model is exact at first order.** Fit
    $\Lambda(\alpha)-\Lambda(0)=2c\alpha-d\alpha^2$ on
    $|\alpha|\le0.02$: $c$ equals the content
    $|\mathbb{E}[\bar w_2F_A(q_0)]|$ to within $0.1$--$2\%$ at all 15
    points ($a\in\{.3,.45,.6,.8,1\}$, $\sigma\in\{.14,.2,.3\}$). The
    curvature $d=1/\varepsilon-h_{\rm eff}$ is $0.42$--$0.62$
    ($h_{\rm eff}=0.70$--$0.90$), i.e. $1.4$--$2.1$ times the rigorous
    denominator $0.292$ of the global majorant $h_X=1.03$. So the
    reduction (R), gain $\le$ content$^2/0.292$, overestimates the
    actual maximal gain by a factor $1.4$--$2.1$ on this family.

2.  **Share of the margin.** Minimising $S-\Lambda$ over real
    $\alpha\ge0$: the gain is at most $16\%$ of the $q$-only margin (at
    $a=1$, $\sigma=0.2$; $12.5\%$ at $a=.8$; $9\%$ at $.6$; $4\%$ at
    $.3$; $1.4\%$ at $.15$), with $\alpha^*\le0.08$. Near the Gaussian
    optimum the margin itself is tiny ($1.7\cdot10^{-5}$ at $a=.15$,
    $\sigma=.2$) but the gain is $2\cdot10^{-7}$.

3.  **Content inequality**
    content$_A^2+$content$_B^2\le0.292(c_1(q)+\eta)$: holds with ratio
    $\le0.385$ (true slack, junta family, K2/K3) and $0.16$--$0.35$ on
    the L2 maximisers $n=4..8$ (the most content-rich cubic chaos known;
    Monte Carlo $8\cdot10^6$ samples with control variates, worker
    report). Factor $\ge2.6$ to spare everywhere tested. The danger zone
    remains intermediate $x$ when the slack is taken from the moment LP
    alone (ratio $0.9$--$0.95$ at the Wick monomial,
    $\sigma=.25$--$.3$): the deficit must be the true (Stein-cut) one.

#### Complete J1 map (float, `j1scan_small.py`).

Exact ring formula, grid $T$: $10\times6$, $\rho$: $9\times6$, $\psi$:
32; for each $(c,s)$ on $c\in\{.03,.06,.1,.15,.2,.3\}$,
$s\in\{0,.02,.035,.05,.08\}$ the margin $S-\Lambda$ was minimised over
$\alpha\in\mathbb{C}$ and then over $(\alpha,\beta)\in\mathbb{C}^2$
(Nelder--Mead, two starts each). Minimum margin over the whole scan
$+3.95\cdot10^{-5}$ (at $c=0.03$, $s=0.035$, where the junta is nearly
Gaussian and $d_q$ itself is $4.0\cdot10^{-5}$); the sectors recover at
most $16.3\%$ of $d_q$ (at $c=0.2$, $s=0$; $\alpha^*=0.052$,
$\beta^*=0.007$), decreasing with the buffer; the optimal $\alpha$ is
always at the aligned phase and $\beta^*$ is an order of magnitude
smaller than $\alpha^*$. So on the six-parameter junta family K holds
with positive margin everywhere tested, with the deficit-retention form
at $\theta=1/4$ satisfied ($0.163<0.25$), and GPT's certified slack
$7.3\cdot10^{-5}$ for the $A$-only case is about $10^{-4}$ above the
true worst margin. The finer droplet scan (`j1scan.py`, 30/30 points,
log `kattack-2026-10-15/j1scan_droplet_fine.log`) [\[C\]]{.sans-serif}
confirms it: minimum margin over the scan $+3.949\cdot10^{-5}$ at
$(c,s)=(0.03,0.035)$, maximum gain$/d_q=0.164$ at $(c,s)=(0.20,0)$.

#### Several coordinates of comparable influence, with free $A/B$ sectors on all of them (float, `mjunta.py`).

The one class every attack had left untested. Residual
$q=\sigma\,t$-chaos with $t$ the L2 maximiser at $n=3$ ($\kappa=20.7$)
and $n=4$ ($\kappa=16.0$, energy spread over all coordinates), sectors
$r_A=\langle\alpha,w\rangle$, $r_B=\langle\beta,\bar w\rangle$ with
$\alpha,\beta\in\mathbb{C}^n$ free; payoff by the half-turn identity
with the $(T,\theta)$ integral by quadrature ($72\times24$) and the
remote coordinates by Monte Carlo ($4\cdot10^4$ samples, common random
numbers across parameters, so differences are accurate to
$\sim10^{-5}$); L-BFGS over the $4n$ real sector parameters, three
starts (all agree):

::: center
   $n$   $\sigma$    $d_q=S-\Lambda(q)$   max gain from $A,B$   gain$/d_q$  $|\alpha^*|,|\beta^*|$   margin $S-\Lambda_{\max}$
  ----- ---------- -------------------- --------------------- ------------ ------------------------ ---------------------------
    3      0.20      $6.12\cdot10^{-3}$    $1.07\cdot10^{-3}$        0.174       0.042, 0.006            $5.1\cdot10^{-3}$
    4      0.14      $2.49\cdot10^{-3}$     $2.9\cdot10^{-4}$        0.118       0.024, 0.002            $2.2\cdot10^{-3}$
    4      0.20      $6.13\cdot10^{-3}$     $8.8\cdot10^{-4}$        0.144       0.039, 0.005            $5.3\cdot10^{-3}$
    4      0.30      $1.95\cdot10^{-2}$     $2.5\cdot10^{-3}$        0.128       0.058, 0.011            $1.7\cdot10^{-2}$
:::

K holds on these residuals with large margin; the sectors recover
$12$--$17\%$ of the $q$-only deficit (the same range as on the
one-coordinate junta, maximum $0.174$), $\beta^*$ is again an order of
magnitude below $\alpha^*$, and the deficit-retention form
$\Lambda\le S-(1-\theta)d_q$ holds with $\theta=1/4$ on every residual
tested so far (junta family, L2 maximisers, real-Gaussian multiplier
class). These residuals are very non-Gaussian ($x^2\ge16$ at
$\sigma^2=1$), so their deficits are large; the thin region remains the
near-Gaussian one, where the one-coordinate junta is now certified
($A$-only) by GPT.

# Dead strategies (do not retry) {#sec:dead}

1.  **L4, CLT monotonicity**
    $\Lambda(G)\le\Lambda((G(z,w)+G(z,w'))/\sqrt2)$: false;
    $G=cz_1(|z_2|^2-1)$ gives $+4.9\cdot10^{-4}$ ($c=.15$),
    $+7.8\cdot10^{-3}$ ($c=.4$) (K3). Reason: in the mixed directions
    the fibre potential is flat-then-linear, so heavier tails help the
    adversary. Sup-monotonicity L4\* survives at 7 points.

2.  **Peeling / equal-variance Gaussianisation of one shared
    coordinate**: false. Shared-driver minus independent-driver payoff
    at equal conditional variance profile is $+1.96\cdot10^{-2}$ at
    aligned phase ($a=1$, $\sigma=.3$, $|\alpha|=.3$),
    $-3.6\cdot10^{-2}$ at the opposite phase (`peel.py`). No proof can
    proceed coordinate by coordinate or sector by sector at equal
    variance; content and deficit must be weighed together.

3.  **Modulus-only (idealised) bounds for $B$, $W$**: the pointwise
    inequalities fail by $6.7\%$ / $9.3\%$ at small arguments,
    $u\mapsto\mathrm{mabs}(\sqrt u,s)$ is convex for $u<1.21s^2$, and
    GPT exhibited the failure inside genuine chaos
    ($G=\sigma Q_{11}+cZ^2\bar W_1$, positive $c$-derivative).

4.  **Splitting the content inequality into content$\le f(x)$ and
    slack$\ge g(x)$ through the fourth moment**: impossible (ratio
    $0.9$--$0.95$ at the Wick monomial with LP slack); proved chains
    (Thm 4: content$^2\le0.60\sigma^4x^2$; Thm 6: $\le41.2\sigma^6x^3$)
    close $K_\eta$ only for $x\le0.22$.

5.  **Chasing the L2 constant**: it is dimension-dependent
    (§[7](#sec:L2){reference-type="ref" reference="sec:L2"}); a
    constant-only route needs the saturation regime anyway.

6.  **Representing visible+residual as one Gaussian variance mixture**:
    false (oscillating radial characteristic function, GPT).

# L2 and the mechanism of the content {#sec:L2}

$\|\Pi_{1,0}(q|q|^2)\|^2\le C\kappa^{3/2}$: proved
$C\le\sqrt{142688/29403}=2.2029$ (GPT, latest; earlier today $2.598$,
before $3.674$), and the kurtosis-dependent
$V\le\max_{0\le d\le2,0\le e\le1}(1+d+e)(\kappa-2d^2-2e^2)$ for unit $q$
(coefficient $32/27$ for $\kappa\ge1$, $<0.758$ for $\kappa\ge4$, sharp
at the Wick endpoint $\kappa=42$, $V=128$; against the $n=8$ maximiser,
$\kappa=7.57$, it gives $\approx0.64$ vs the true $0.521$). Exact
Feynman evaluation (32 matchings for the content, 176 for
$\mathbb{E}|q|^4$; $v_j=8A_j+8B_j+16C_j$) and analytic-gradient
maximisation (`feyn.py`, `feyn_grad.py`, `optg.py`) give
$$\sup_tR:\ 0.477466\ (n=2),\ 0.487944,\ 0.495370,\ 0.502234,\ 0.509235,\ 0.515665,\ 0.521148,\ 0.525515,\ 0.529677\ (n=10),\ \ge0.5398\ (n=12),$$
all starts agreeing to $10^{-6}$; increments $\sim n^{-2}$, limit fitted
between $0.53$ and $0.63$ [\[F\]]{.sans-serif}. Maximisers are coupled
many-coordinate objects (Wick share shrinking, a pure cubic in the
remaining coordinates growing; $\kappa$ at the maximiser $30\to6.7$ for
$n=2\to9$ at $\sigma^2=1$). Closed-form family
$q=w_1[\alpha(|w_1|^2-2)+\sum\beta_c(|w_c|^2-1)]$:
$v_1=32\alpha^3+4\alpha P+2\alpha\Sigma_2+4\Sigma_3$,
$\kappa=168\alpha^4+16\alpha^2\operatorname{Re}\Sigma_2+24\alpha^2P+16\alpha\operatorname{Re}\Sigma_3+12\Sigma_4+2|\Sigma_2|^2+2P^2$;
saturates at $0.4903$. *Mechanism*: with
$U_2=\Pi_2|q|^2=\sum M_{kl}{:}\bar w_kw_l{:}$, $M=\Gamma+\Gamma'^{\top}$
the influence matrix, $\langle w_j,U_2q\rangle=2(t\cdot M)_j$: the
content's leading term is the chaos tensor contracted with its own
influence matrix; Cauchy--Schwarz with the full norm of $t$ gives second
order in $x$, the truth is third order because $M$ and the relevant mass
of $t$ live on the same (influential) directions. The deficit's leading
term is the pairing of the same fluctuation with $U$ itself,
$\mathrm{Cov}(W,U)=\frac23\|U_2\|^2+\frac13\|U_4\|^2$. Both sides are
functionals of the pair $(W-\sigma^2,C)$ (carré du champ), bounded by
H1: $\operatorname{Var}W+\frac12\mathbb{E}|C|^2\le\kappa/3$.

# The interaction obligation {#sec:interaction}

Test (`fixq.py`, grid $6{\times}6$, $5{\times}6{\times}12$, GH 4,
$N=17{,}280$; the same grid for both maximisations so the discretisation
bias cancels): for a fixed junta residual
$q_0=\sigma(aH(w_2)+\sqrt{1-a^2}W)$ maximise $\Lambda$ over the odd
sectors $(r_A=\alpha w_2,\ r_B=\beta\bar w_2)$ alone and over all mixed
sectors
$(\alpha,\beta,r_Y=y(|w_2|^2-1)+y'\xi,\ r_W=w\,w_2^2/\sqrt2,\ \nu)$
jointly, three starts each.

::: center
   $a$   $\sigma$       $\Lambda(q_0)-S$        $\max_{A,B}-S$    $\max_{\rm all}-S$         all $-$ odd
  ----- ---------- --------------------- --------------------- --------------------- -------------------
   0.3     0.14      $-5.82\cdot10^{-4}$   $-5.80\cdot10^{-4}$   $-5.80\cdot10^{-4}$   $-2\cdot10^{-14}$
   0.3     0.20      $-2.08\cdot10^{-4}$   $-1.99\cdot10^{-4}$   $-1.99\cdot10^{-4}$   $-4\cdot10^{-14}$
   0.3     0.30      $-3.16\cdot10^{-3}$   $-3.13\cdot10^{-3}$   $-3.13\cdot10^{-3}$   $-4\cdot10^{-14}$
   0.6     0.14      $-1.25\cdot10^{-3}$   $-1.19\cdot10^{-3}$   $-1.19\cdot10^{-3}$   $+2\cdot10^{-14}$
   0.6     0.20      $-2.10\cdot10^{-3}$   $-1.90\cdot10^{-3}$   $-1.90\cdot10^{-3}$   $-1\cdot10^{-13}$
   0.6     0.30      $-8.60\cdot10^{-3}$   $-8.07\cdot10^{-3}$   $-8.07\cdot10^{-3}$   $-4\cdot10^{-14}$
   1.0     0.14      $-4.22\cdot10^{-3}$   $-3.63\cdot10^{-3}$   $-3.63\cdot10^{-3}$   $-4\cdot10^{-15}$
   1.0     0.20      $-9.91\cdot10^{-3}$   $-8.31\cdot10^{-3}$   $-8.31\cdot10^{-3}$   $+7\cdot10^{-16}$
   1.0     0.30      $-2.97\cdot10^{-2}$   $-2.53\cdot10^{-2}$   $-2.53\cdot10^{-2}$   $-8\cdot10^{-15}$
:::

At every point the joint optimum keeps $r_Y=r_W=\nu=0$ exactly: **on
junta residuals the even sectors add nothing on top of the optimal odd
sectors** (difference at machine precision), while the odd sectors gain
$2\cdot10^{-6}$ to $4.4\cdot10^{-3}$ over $q_0$ alone (at most $16\%$ of
the $q$-only margin, as in §[5](#sec:gain){reference-type="ref"
reference="sec:gain"}; $B$ adds little beyond $A$). This is the
numerical content of the open interaction obligation: it supports
extending the $Y/W$ theorem from the $q$-only baseline to $q+$odd
sectors, at least when the even sectors share the drivers of the odd
ones. Not tested: even sectors on independent drivers combined with odd
sectors on shared ones; several remote coordinates at once.

# A proposal to finish, after the global $A$ theorem {#sec:proposal}

GPT's certificate works because, conditionally on the coefficient state,
the residual is *proper Gaussian* and the content is *bilinear*
($p=\operatorname{Re}\langle S,\alpha\rangle$, centered), so a
supporting multiplier cancels it on averaging and a three-parameter dual
can be covered by boxes. The uncovered case is the cubic
self-interaction $q_0\ni cH(X)$ with $r_A=\alpha X$ on the same driver.
Two exact observations suggest how to close it.

1.  **The junta is the opposite conditional extreme, and it is still
    finite-dimensional.** Conditionally on $\rho=|X|$ (and on the remote
    coefficient state), $cH(X)+\alpha(T-1)X=
    e^{i\theta}\rho\,[c(\rho^2-2)/\sqrt2+\alpha(T-1)]$: a *ring*
    (deterministic modulus, uniform phase), not a Gaussian. With a
    proper-Gaussian buffer of variance $s$ the conditional payoff is
    $2\,E_{T,\rho}\,\mathcal F_s\bigl(\sqrt Ta(T),\ \rho|c(\rho^2-2)/\sqrt2+\alpha(T-1)|\bigr)$,
    $\mathcal F_s(x,m)=\mathbb{E}_{\theta,G}|x+me^{i\theta}+\sqrt sG|$,
    i.e. one angular average of the Rice function already enclosed in
    his certificate. The one-coordinate junta with shared $A$ (and $B$:
    $\beta\bar X Z^2/\sqrt2$ adds a second ring term with the opposite
    $Z$-frequency) plus buffer is therefore a *four-to-six-parameter*
    dual inequality $(c,s,|\alpha|,\arg\alpha,|\beta|,\arg\beta)$ over a
    compact set (the same Cauchy--Schwarz tail argument applies),
    certifiable by exactly his box machinery. The right target is
    $\Lambda\le S-(1-\theta)d_q(c,s)$ with $d_q$ the junta-only deficit
    and $\theta\approx1/4$ (the sectors do recover up to $16\%$ of
    $d_q$, so one cannot subtract per-sector deficits as well; GPT,
    correcting a first formulation), or simply $\Lambda\le S+10^{-5}$;
    the boxes will be coarse. GPT also reports a $B$ case: when the
    shared coefficient has uniform phase given its magnitude, phase
    averaging turns the improper conditional Gaussian into a variance
    mixture covered by the $A$ theorem, allowing nonzero
    pseudocovariance. This would close "cubic self-interaction" for a
    single influential coordinate, and the Gaussian-factor theorem plus
    the profile-addition mechanism then covers everything riding on
    other, independent drivers.

2.  **The content is a pairing with the residual's own derivative, and
    only the second-chaos parts matter.** For
    $r_A=\sum p_j\bar w_j$-direction $p$ (unit vector), Gaussian
    integration by parts gives the exact identity
    $$\mathrm{content}_A(p)=\langle p,\Pi_{1,0}F_A(q_0)\rangle=\mathbb{E}\bigl[F_{A,u}(q_0)\,D_pq_0\bigr]+\mathbb{E}\bigl[F_{A,\bar u}(q_0)\,\overline{\bar D_pq_0}\bigr],\qquad D_p=\sum_j\bar p_j\partial_j,$$
    and since $D_pq_0\in H_{1,1}(w)$, $\bar D_pq_0\in H_{2,0}(w)$ are
    pure second chaos, only $\Pi_{1,1}F_{A,u}(q_0)$ and
    $\Pi_{0,2}F_{A,\bar u}(q_0)$ enter. Hence
    content$\le\|\Pi_{1,1}F_{A,u}(q_0)\|\,\|D_pq_0\|+
    \|\Pi_{0,2}F_{A,\bar u}(q_0)\|\,\|\bar D_pq_0\|$ with
    $\|D_pq_0\|^2\le\lambda_{\max}(\Gamma)\le0.866\sigma^2x$ (Theorem 5)
    and the second-chaos parts of the derivative profiles of size
    $O(\sigma^2x)$ (they are $\approx F''$-weighted $U_2$): this is the
    third-order structure made explicit, and it shows what a sharp bound
    must control: the second-chaos content of $g(|q_0|^2)$ for smooth
    $g$ in terms of $U_2,U_4$, i.e. in terms of the influence matrix,
    jointly with the influence in the direction $p$. For the polynomial
    model $F=\gamma u+\delta u|u|^2$ this is L2 (now
    $\le2.2029\kappa^{3/2}$, kurtosis-dependent
    $\le\frac{32}{27}\kappa^{3/2}$ for $\kappa\ge1$); the bounded
    profile saturates beyond $|q_0|\approx0.5$.

3.  **What is then left** is the reduction of a general cubic to "one
    (or few) influential coordinates + Gaussian factors" with an error
    paid by the deficit, i.e. a quantitative invariance principle with
    deficit-weighted error; the influence threshold needed for a
    $10^{-5}$ error is far too small for brute force ($\sim1/\tau$ junta
    coordinates), so this step needs the second observation (content
    controlled by the influence matrix, which also controls the
    deficit), not a cover.

#### Correction to the content identity.

GPT's `angular/CONTENT_IDENTITY.md` fixes the projection conventions:
the second term projects onto $\Pi_{2,0}$ (of $\bar D_pq_0$), not
$\Pi_{0,2}$; for the Wick monomial and $F(u)=u|u|^2$ the two terms are
$6\sqrt2$ and $2\sqrt2$, total $8\sqrt2=11.31$, matching $v=32t^3$ of
§[7](#sec:L2){reference-type="ref" reference="sec:L2"}.

# 15 Oct 13:13 update: joint shared-driver certificates {#sec:kjoint}

GPT's `k-joint-certified-20261015` realises the proposal of
§[9](#sec:proposal){reference-type="ref" reference="sec:proposal"} in
weak form and adds two obstructions (details, hypotheses and our replay
in Ch. 14 of `handoff-2026-10-15/main.pdf`). Replay: quick mode (87
hashes, six exact checkers) PASS in $0.6$ s; full mode (regenerated
inputs, three covers) run on the droplet, log
`kattack-2026-10-15/gpt_kjoint_full.log` (all three covers PASS with the
package's exact counts: junta 76 min, complex $A{+}B$ 63 min, $B$-buffer
6 min).

1.  **Shared Wick junta, $A$ and $B$ together, arbitrary phases**
    [\[P\]]{.sans-serif}:
    $\Lambda(cH(X)+\alpha(T-1)X+\beta Z^2\bar X/\sqrt2+gG)\le S+10^{-4}$
    for all $c,g\ge0$, $\alpha,\beta\in\mathbb{C}$ (26,446 boxes, 79,159
    vertices, 1,508 tail boxes; largest upper $96690404106435/2^{46}$,
    benchmark $96683367401312/2^{46}$, gap $0.99998\cdot10^{-4}$). The
    proof removes the Wick--$B$ relative phase by the ellipse phase
    theorem $J(x;m,n,g)\le J(x;|m|,-|n|,g)$ and covers five real
    parameters. *The slack is intrinsic*: expanding the relaxed envelope
    at the Gaussian optimum gives $Kc\beta+B\beta^2$ with
    $K=-16e^{-2}\mathbb{E}[TuF''_{w_*}(u)]>0$ because
    $\frac12\mathbb{E}[R|R-2|]=4e^{-2}$ replaces the honest
    $\frac12\mathbb{E}[R(R-2)]=0$; so this verifier can prove $K_\eta$
    but never $\eta=0$ on the junta. It spends the whole $10^{-4}$
    budget; the honest margin on the family is positive (fine J1 scan,
    min $+3.95\cdot10^{-5}$).

2.  **Joint $A{+}B$ on one Gaussian factor with buffer**
    [\[P\]]{.sans-serif}:
    $Q=\{S_0+\alpha(T-1)\}X+\beta Z^2\bar X/\sqrt2+gG$, remote state
    independent of the drivers,
    $\mathbb{E}\operatorname{Re}(S_0\bar\alpha)=\mathbb{E}\operatorname{Re}(S_0\beta)=0$
    (automatic for deterministic $\alpha,\beta$ and centered $S_0$):
    $\Lambda\le S+8\cdot10^{-5}$ (236,786 boxes, 898,217 vertices,
    $1.03\cdot10^6$ norm calls; largest upper $1.374033275968777$ vs cap
    $1.374033284570177$). No $\alpha^{\top}\beta=0$, no phase spread,
    pseudocovariance kept. Extends to any dimension for collinear
    $\alpha=\kappa\bar\beta$ (unitary alignment; the orthogonal proper
    residual is conditionally a buffer).

3.  **$B$ on any conditionally proper Gaussian-factor residual**
    [\[P\]]{.sans-serif}:
    $\Lambda(\sum S_jX_j+\frac{Z^2}{\sqrt2}\sum\beta_j\bar X_j+gG)\le S+10^{-5}-\mathbb{E}\|\beta\|^2/200$
    in any dimension (24,967 boxes). Not for $\sum P_j\bar X_j$.

4.  **Obstruction to merging the faces** [\[P\]]{.sans-serif}, identity
    verified here [\[C\]]{.sans-serif}: for $Q_c=cH(X)+S_0X+gG$ with
    real centered $S_0$, $V=S_0^2+g^2$,
    $\mathbb{E}|Q_c|^4-2(\mathbb{E}|Q_c|^2)^2=2\operatorname{Var}V+4\sqrt2c\mathbb{E}S_0^3+20c^2\mathbb{E}S_0^2+42c^4$
    (our exact expansion agrees; Monte Carlo $\kappa=-2.07\cdot10^{-5}$
    vs $-2.12\cdot10^{-5}$ at $c=0.002$). With $S_0\in\{r,-2r\}$ and
    $g^2=w_*-S_0^2$ the payoff sits on $S$ at $c=0$ and
    $\partial_c\mathbb{E}J(0)=-2\sqrt2r^3f''(w_*)>0$ (our MC slope
    $0.0058\pm0.0005$ vs GPT $0.00645$), so $\mathbb{E}J(c)>S$; but
    $\kappa(c)<0$ for small $c$, so this is not cubic chaos. Any bridge
    from "one Wick coordinate" to "Gaussian factors" must keep the chaos
    restrictions (or fix the buffer with the multiplier
    $\partial_c\lambda(0,g)=-\sqrt2(w_*-g^2)f''(w_*)$).

5.  **Eight-parameter target** [\[P\]]{.sans-serif}: the vector
    Gaussian-factor problem with simultaneous $A,B$ reduces exactly to
    $(t,r,s,p,k,\ell)$ with Schur-complement feasibility
    $t_\perp,r_\perp\ge0$, $p_\perp^2\le t_\perp r_\perp$, realised by
    two drivers $(S_1+\alpha_1A)X_1+\sqrt sB\bar X_1+(x+dA)X_2+hG$;
    item 2 is the face $d=0$; the orthogonal factor cannot be replaced
    by a constant buffer.

## 15 Oct 13:53 update: `k-full-20261015` {#sec:kfull .unnumbered}

Replayed from the scratch directory with a scratch venv
(`mpmath 1.3.0`): 48/48 hashes, all exact algebra checks and the
2,800-cell interval Hessian PASS in 46 s (log
`kattack-2026-10-15/gpt_kfull_replay.log`). Contents, with our
verification:

1.  **Global pure-residual theorem** [\[P\]]{.sans-serif}: for $L$ a
    proper Gaussian variance mixture (every $Z(a+b|Z|^2)$ is one, by
    complete monotonicity of $e^{-H^{-1}(v)}$), $X,G$ independent, $S$
    independent centered, $g$ deterministic, $k=c^2+\mathbb{E}|S|^2$:
    $2\mathbb{E}|L+cH(X)+SX+gG|\le f(g^2+k)-c^2D(k,g)$,
    $D\ge\sqrt\pi k/[16(M+g^2+k)^{3/2}]$, hence $\Lambda\le S-c^2D$;
    corollary with $T\bar X+CX^2/\sqrt2$ and arbitrary dependence among
    $(S,T,C)$. We re-derived the proof: (i) circularity of $L+gG$
    reduces to $\mathbb{E}_{R,S}P_g(R|c(R-2)/\sqrt2+S|^2)$; (ii)
    $P_g(u)=2\mathbb{E}|L+\sqrt u+gG|$ is concave in $u$ because
    conditionally on the mixing variable it is a Rice mean (the
    "concavity in the squared radius" of the main document, Ch. 11, with
    the visible variable itself as the smoothing Gaussian), so Jensen
    over the centered $S$ gives the imaginary two-point law as the exact
    worst case; (iii) the concave interpolation
    $h(t)=\mathbb{E}_RP_g(R[k+t((R-2)^2/2-1)])$ has
    $h'(0^+)=kf''+\frac12k^2f'''=-D<0$ by exponential integration by
    parts ($I_2=2F'+kF''$, $I_3=6F'+6kF''+k^2F'''$; checked). No gap
    found; the mixture property of $L$ is the load-bearing hypothesis
    (our numerical second differences of
    $u\mapsto2\mathbb{E}|L+\sqrt u|$ are all negative). **Numerical
    test** [\[C\]]{.sans-serif} (`kfull_global_check.py`, deterministic
    quadrature, 23 points, five remote laws, $V$ from $0.03$ to $0.5$):
    the bound holds everywhere, with actual/certified deficit ratio
    $13$--$41$ near $v_*$ and $6$--$16$ far away; the imaginary
    two-point law is the worst at every point. The deficit is of order
    $c^2k$ (fourth order), consistent with $f''(v_*)\kappa t^4/4$, but
    its constant is $75$--$150$ times below the true quartic coefficient
    on the Wick direction, so it certifies K-a for this family and does
    not by itself pay for shared-visible content. *Scope in our
    decomposition*: with respect to one coordinate $X$,
    $q_0=cH(X)+XS(Y)+\bar XT(Y)+\frac{X^2}{\sqrt2}C(Y)+[(|X|^2-1)V(Y)+q_0'(Y)]$;
    the theorem covers all nonzero frequencies (so coupled kernels
    $S=Y^*AY-\operatorname{tr}A$, $A$ non-normal, are in); outside are
    the phase-zero part, every shared visible sector ($A$, $B$, $Y$,
    $W$, $\nu$) at finite amplitude, and correlated buffers without
    $\mathbb{E}[S\mid\mathcal F]=0$.

2.  **Local exact K with all sectors** [\[P\]]{.sans-serif}: see the
    status table; it proves the Ch. 10 "flat at second order, quartic
    penalty" picture and the even-sector neutrality of
    §[8](#sec:interaction){reference-type="ref"
    reference="sec:interaction"} near the Gaussian point, per fixed
    dimension.

3.  **Reductions** [\[P\]]{.sans-serif}: an OU/gamma-resolvent identity
    for the first-chaos content (smoothing $1/4$, $1/7$; the weighted
    coercivity inequality is open); a law-preserving rank reduction of
    the vector Gaussian-factor $A/B$ dual to the certified one-driver
    family plus a seven-parameter two-driver family (uncertified).
    **Obstruction** [\[P\]]{.sans-serif}: the unrestricted merger fails
    for any prescribed normalised fourth moment in $[2.06,6]$; for
    quadratic remote coefficients
    $\kappa\ge2(c^2+\operatorname{tr}AA^*)^2+40c^4$. GPT cites
    arXiv:2609.07066 as context only [\[?\]]{.sans-serif}.

## 15 Oct 14:47 update: `k-next-20261015` {#sec:knext .unnumbered}

Replayed from the scratch directory: 132/132 hashes, 11 checkers PASS in
41 s (log `kattack-2026-10-15/gpt_knext_replay.log`); the only long
cover (seven-parameter vector face) is INCOMPLETE and used by nothing.
(1) **Coupled remote remainder** [\[P\]]{.sans-serif}: with
$Q=q_0+cH(X)+S_0X+T_0\bar X+CX^2/\sqrt2+D(|X|^2-1)+gG$, remote vector
arbitrarily dependent, independent of $(X,G,Z)$, $\mathbb{E}S_0=0$,
$\operatorname{Re}\mathbb{E}(q_0\bar D)=0$ (automatic for chaos types):
$\Lambda\le S-\Delta(V)+D_RB$,
$B=v_0-\frac25c^2-\frac{33}{64}\mathbb{E}|C|^2-\frac1{32}\mathbb{E}|D|^2$,
$0<D_R\le\min\{1.81k,2/7\}$. $D_R=[f(g^2+k)-f(g^2)]/k-f'(g^2+k)$ is the
chord-minus-tangent cost of a frequency-zero ($R$-independent) remote
part under the concave interpolation (the obstruction of the 13:53
package, now paid explicitly); $2/5$, $33/64$, $1/32$ are certified
lower ratios of the Wick, quadratic and centered phase-zero deficits to
$D_R$ (170-leaf certificate for $D_0\ge D_R/32$;
$D_C\ge\frac{33}{64}D_R$ from $D_0=2D_C-D_R$; $D_H/D_R=g(D_C/D_R)$ with
convex $g(z)=2z+6z^2-6z^{3/2}$, $g(33/64)>2/5$). $B$ is the surplus of
remote-constant variance over those deficits; exact K iff $B\le0$. With
$q_0=0$: exact K-a for the complete one-coordinate star at every
amplitude (169 leaves, uniform on the profile box,
$\varepsilon\le0.76$); the winding-number corollary (circle-equivariant
diagonal coefficient on $S^3$ must vanish somewhere) makes every
two-coordinate cubic a star: **exact K-a for all of
$H_{2,1}(\mathbb{C}^2)$** [\[P\]]{.sans-serif}. Not proved: that a cubic
in $n\ge3$ has a coordinate meeting the budget. (2) **Diagonal**
[\[P\]]{.sans-serif}: see the table; it refines, not contradicts, our
base-profile rule, which remains necessary for non-Gaussian residual
laws. (3) **Polar rank-two** [\[P\]]{.sans-serif}: the common visible
phase turns $|X|e^{-i\theta}$ into a fresh proper Gaussian, so an
arbitrary real-linear map of one complex driver (improper residual
included) reduces exactly to the replayed one-driver $A{+}B$ cover. (4)
**Higher-order content** [\[P\]]{.sans-serif}:
$\Pi_1F(q)=\gamma(q)\Pi_1(qU)+R$,
$\gamma(q)=\mathbb{E}[h'+2Uh''+\frac12U^2h''']=\frac12\mathbb{E}F_{uu\bar u}(q)$,
i.e. exactly our "mean third derivative" times the influence contraction
$\Pi_1(q|q|^2)$; $\|R\|\le1.3413\,\kappa^{5/4}\sup\|D^5F\|$ or
$\frac{3(3+2\sqrt3)}8\kappa\sqrt{J(q)}$,
$J(q)=\lambda_{\max}\mathbb{E}[\nabla\operatorname{Re}q\otimes\nabla\operatorname{Re}q]$
the real-coordinate analogue of $\lambda_{\max}(M)$ (trace
$\frac32\sigma^2$ vs $3\sigma^2$). Same leading order as Theorem R of
Ch. 15 of the main document, remainder one order higher; neither closes
(T): their own diagnostic puts the law-sensitive remainder $700\times$
the deficit on the Wick family. (5) arXiv:2609.07066
[\[?\]]{.sans-serif}: context; an ordered-index slip in v1's Thm 2.5 is
exhibited and repaired by symmetrisation (checked exactly); not used.

## 15 Oct 15:52 update: `k-weighted-20261015` {#sec:kweighted .unnumbered}

Manifest (JSON) 100/100; `verify_all.py –full` PASS in 31 s incl. the
copied benchmark cover (log
`kattack-2026-10-15/gpt_kweighted_replay.log`). (1) **(T) is false**
[\[C\]]{.sans-serif}: see the table; the loss is the step
$|{\rm content}|^2\le\mathcal C_F\lambda_{\max}(M)$, which discards the
directional cancellation of the tensor contraction; not a counterexample
to K (kurtosis 12, outside the window $\le6$; GPT's in-window float
scans give worst ratios $\approx0.80$ [\[F\]]{.sans-serif}). (2) **Exact
profiles** [\[P\]]{.sans-serif}, our finite-difference check
[\[C\]]{.sans-serif}: $-P_A$, $-P_B$ and $(-P_A)/\sqrt2-(-P_B)$ have
alternating differences of orders 1--4 all positive and are log-convex
on $\rho\le6$; $(-P_B)/(-P_A)\in[0.505,0.56]$. Consequence: the true
content is a positive $\mu_D$-mixture of the contents of the exponential
profiles $ze^{-s|z|^2}$, the natural route to (T$_0$) with law-weighted
(not sup-norm) derivative control. (3) **Cyclic kernels**
[\[P\]]{.sans-serif}/[\[C\]]{.sans-serif}: MC $n=3,4$:
$\mathbb{E}|Q|^4=8.05,6.50$ (claims $8,6.5$), contents
$\le1.6\cdot10^{-4}$ at noise $6\cdot10^{-5}$ vs $10^{-2}$ for the junta
control. (4) Small-core expansion
$\mathcal C_F=\frac{m_3^2}4(4A+B)\delta^4+O(\delta^6)$, Wick limit
$\mathcal C_F/\kappa\to11m_3^2/42\approx2.26$ (both profiles)
[\[F\]]{.sans-serif}; weighted constant $\sup(4A+B)/\kappa\ge2.579$
(rational nine-coordinate tensor) [\[P\]]{.sans-serif}, inside Ch. 15's
bracket $[2.06,3]$.

Open list as of 15 Oct, 15:52 (four packages; dated, see the next
section for the latest state): the remote remainder of K-a beyond
the budget in $n\ge3$ (incl. the zero-content cyclic kernels); (T$_0$)
via the exponential profiles; exact (phase-retaining) junta argument or
an enlarged budget; noncollinear vector $A{+}B$ ($d>0$); antiholomorphic
residuals; general coupled cubics with a chaos-preserving bridge; even
sectors on top of odd; $\nu$; row envelope. The certified bound is
unchanged.

# Status after the evening packages (Ch. 22--27 of the main document) {#sec:latest}

Latest K results, all at the peak profile (row box and envelope not
covered); no endpoint changes, and none of this is in Lean.

1.  **Remote cubics and diagonal done at the peak**
    [\[P\]]{.sans-serif}+[\[C\]]{.sans-serif} (Ch. 22, 24):
    $\Lambda(q+gW+\nu H)<S+\eta_0$ for every remote $q\in H_{2,1}$,
    every $n$, $\eta_0<10^{-5}$ with the project $C_6=40.45313$;
    diagonal penalty now $0.571(\operatorname{Re}\nu)^2+0.265(\Im\nu)^2$
    (Ch. 27). Room left for the shared odd sectors:
    $\eta_{AB}=9.063776\cdot10^{-5}$ (exact, Ch. 24).

2.  **The remaining $A/B$ inequality** (Ch. 23): (T$_0$) against the
    *rigorous* deficit $d^*(\sigma,x)$ (moments + all Stein cuts):
    $\|\Pi_{1,0}F_A(q)\|^2+\|\Pi_{1,0}F_B(q)\|^2\le0.292\,(d^*(\sigma,x)+\eta_{AB})$
    for all $q\in H_{2,1}$. It holds on all tested classes
    [\[F\]]{.sans-serif}, with margin as low as $9\%$; no uniform
    content bound with usable constants exists.

3.  **Weaker target K$_{\rm rot}$** [\[P\]]{.sans-serif} (Ch. 25): at a
    global norm maximiser (fixed finite dimension) it suffices that
    $\Lambda(G)-\|2\beta r_A+\sqrt2\beta\bar r_B\|^2/(\varepsilon^2t^2+9\varepsilon\|G\|^2)\le S+\eta$.
    Only the parallel combination
    $r_\parallel=(2r_A+\sqrt2\bar r_B)/\sqrt6$ is penalised; on the
    junta data it pays $13$--$57\%$ (median $29\%$) of the measured
    $A/B$ gain, so it is genuinely weaker than K but insufficient alone;
    no cap for it is proved. Ch. 27 sharpens the denominator with the
    remote variance and kurtosis. Ch. 26 inserted the rotation identity
    into a gate ($1.401621059539$ [\[C\]]{.sans-serif}); that branch is
    not merged (needs `RotShared`; Lean would have to retain both
    squares in `RowReduction` and assume stationarity at the maximiser).

4.  **Symmetric shared sectors** [\[P\]]{.sans-serif}+[\[C\]]{.sans-serif}
    (Ch. 27): $A$ at every amplitude when $(Q,A)\overset{d}=(Q,iA)$
    (penalty $999/302560$; $0.03917$ under full conditional
    circularity); $B$ when $\mathbb{E}[B\mid Q]=0$ (penalty
    $609/1891$), jointly with $Y,W,\nu(Q)H$ under
    $(Q,B,Y,W)\overset{d}=(Q,-B,Y,W)$. These hypotheses kill the
    first-order content, so they fail on exactly the families where the
    measured gain lives (coherent Wick junta $cH(X)$ with $A=\alpha X$
    or $B=\lambda\bar X$; generic, L2-maximiser and coupled kernels).

**Open crux for $1.402$** (latest form): bound the first-order $A/B$
content of an arbitrary cubic with *coherent* shared drivers, i.e.
(T$_0$) against $d^*+\eta_{AB}$ with $\eta_{AB}\approx9.06\cdot10^{-5}$
at the peak, or, at a norm maximiser, K$_{\rm rot}$, where the deficit
must still pay the transverse combination $(F_A-\sqrt2F_B)/\sqrt3$ and
the unpaid part of the parallel one. Also open: $Y,W$ and $\nu$ on top
of visible $A/B$ in general, and the extension from the peak profile to
the row box and envelope.

# What a proof must do (sufficient route)

For $\nu=0$ and the odd sectors handled by the reduction (R):

1.  **(K-a) with the true deficit**: $\Lambda_q(q)\le S-c_1(q)$ for all
    $q\in H_{2,1}$ from moments + Stein cuts (both inputs proved in
    Lean); loss of the moment-only version $\approx10^{-5}$, inside the
    $\eta$ budget. Certificate-ready. *Done at the peak profile for
    every remote cubic (Ch. 22, 24 of the main document; slack
    $<10^{-5}$); row box open.*

2.  **L1, fibre majorant** (finite-dimensional, interval arithmetic):
    $\Phi(s;m)\le\Phi_0(|s|)+2\operatorname{Re}(\bar c_Am_A+\bar c_Bm_B)+h_X(|m_A|^2+|m_B|^2)+h_Y(|m_z|^2+|m_{\bar z}|^2)$
    with $h_X\le1.05$, $h_Y\le1.25$ on the box; the measured effective
    curvature ($h_{\rm eff}=0.70$--$0.90$ along the aligned direction)
    says $h_X=1.03$ is loose but safe.

3.  **Content inequality**
    $\|\Pi_{1,0}F_A(q)\|^2+\|\Pi_{1,0}F_B(q)\|^2\le(1/\varepsilon-h_X)(c_1(q)+\eta)$
    with $c_1$ the *true* deficit. True with factor $\ge2.6$ on every
    residual tested (against the true deficit; against the rigorous
    $d^*$ the margin drops to $9\%$, see the previous section;
    K$_{\rm rot}$ pays part of the left side). A proof must couple the two sides, e.g. through the
    influence matrix / carré-du-champ fluctuation (both sides are
    pairings of $(W-\sigma^2,C)$), with the sharp third-order structure
    for small $x$ and saturation of the bounded profiles
    ($|c_A|\le0.2534$) for $x\gtrsim0.5$.

4.  **Even sectors on top of $A/B$** (interaction): extend the $Y/W$
    theorem from the $q$-only baseline to $q+$odd sectors, or show the
    odd-sector optimum is unchanged by $Y,W$
    (§[8](#sec:interaction){reference-type="ref"
    reference="sec:interaction"}).

5.  **$\nu$ uniformity**: ($\nu$ alone is removed on every remote law,
    previous section) redo 1--4 for the base profiles
    $a_\pm=\ell+(\beta\pm\nu/\sqrt2)(U-2)$, $|\nu|\lesssim0.02$.

Budget: $\eta\le1.0\cdot10^{-4}$ in total (moment loss $\sim10^{-5}$,
majorant slack, content slack), for $B\le0.713267$ and
$K_G^{\mathbb{C}}>1.402$. After the remote part,
$\eta_{AB}=9.06\cdot10^{-5}$ remains at the peak (Ch. 24).

# Files

`handoff-2026-10-15/main.pdf` Ch. 7, 10--17, 19, 20, 22--27;
`conjecture_K_handoff.md` §1--12; `pipeline/{gate,kconj,kproof,kclt}/`;
`kattack-2026-10-15/` (`attxi.py`, `kprime.py`, `stab8.py`,
`idealBY.py`, `pointwise.py`, `peel.py`, `peel2.py`, `quadmodel.py`,
`fixq.py`, logs); `L2-2026-10-15/` (`feyn.py`, `feyn_grad.py`,
`optg.py`, `optgm.py`, `kcontent.py`, logs, pkl maximisers $n=2..12$).
GPT packages: `graded-orbits-20261015`, `shared-driver-20261015`,
`handoff-reconciliation-20261015`, `profile-slack-20261015`,
`global-a-and-content-20261015` (replayed here: all checks PASS in 58
s), `junta-and-b-20261015` (replayed here: all checks PASS, 12 min 40 s,
the junta certificate alone 528 s; log
`kattack-2026-10-15/gpt_junta_replay.log`), `k-joint-certified-20261015`
(quick replay PASS 0.6 s, full replay PASS on the droplet; logs
`kattack-2026-10-15/gpt_kjoint_quick.log`, `gpt_kjoint_full.log`),
`k-full-20261015` (replay PASS 46 s, `gpt_kfull_replay.log`; our checks
`kfull_global_check*.py/.log`, `kjoint_cumulant_*`), `k-next-20261015`
(11 checkers PASS 41 s, `gpt_knext_replay.log`), `k-weighted-20261015`
(8 checkers + full countercertificate PASS 31 s,
`gpt_kweighted_replay.log`; our `kweighted_own_check.py`),
`crossbound-progress-20261015` (four audit suites PASS,
`gpt_crossbound_replay.log`; ported as Ch. 17 of the main document).
Evening packages (replays in the provenance notes of Ch. 22, 24--27):
`residual-cubics-proof` (upper-side GPT, 20:01),
`remote-diagonal-refinement-20261015`, `weak-k-20261015`,
`rotation-gates-1_401621059539`, `shared-sector-refinements-20261015`;
archived under `gpt-reviews/`.
