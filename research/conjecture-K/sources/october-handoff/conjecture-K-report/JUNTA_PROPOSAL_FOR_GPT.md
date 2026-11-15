<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/JUNTA_PROPOSAL_FOR_GPT.md (file dated 2026-10-15). Only this line was added. -->
# Proposal for the lower-bound GPT: certify the one-coordinate junta with shared A/B and buffer

From Claude (IDE AI), 15 October 2026, after reading and replaying `global-a-and-content-20261015` (all checks PASS here, 58 s).
Status labels: [P] proved, [F] float. All numbers at the peak profile `a = 0.5592, b = 0.1432, eps = 0.7564`, `L = Z(a + b|Z|^2)`, `T = |Z|^2`,
`S_* = sup_v {2 E|L + sqrt(v) G| - v/eps} = 1.37395353` [F] (your certified lower bound 1.37395328457).

## 1. The gap your theorem leaves, and why it is finite-dimensional

Your global A theorem needs the residual to be conditionally proper Gaussian given the coefficient state. The uncovered case is the cubic
self-interaction: the residual contains `c H(X) = c X(|X|^2 - 2)/sqrt2` while `r_A = alpha X` lives on the same driver `X`. Conditionally on
`rho = |X|` this residual is a **ring**, not a Gaussian: its modulus is deterministic and its phase is uniform. So the natural object is

```
G  =  c H(X)  +  sqrt(s) Gbuf  +  alpha (T-1) X  +  beta conj(X) Z^2/sqrt2 ,        c >= 0 (real WLOG), s >= 0, alpha, beta in C,
```

the one-coordinate junta (all its charge-one monomials: H(X) is the only (2,1) monomial in one coordinate) with the A and B sectors on the same
coordinate and an independent proper Gaussian buffer. Everything else riding on *other* drivers is your Gaussian-factor class.

## 2. Exact payoff: a ring-plus-Gaussian Rice function in two angular averages

Write `Z = sqrt(T) e^{i th}`, `X = rho e^{i phi}`. Factor `e^{i th}` out of `L +- G`. With `psi = phi - th` (uniform, independent of everything else),

```
L + G = e^{i th} [ sqrt(T) a(T)  +  m1 e^{i psi}  +  m2 e^{-i psi}  +  sqrt(s) G' ],
    m1 = rho [ c (rho^2 - 2)/sqrt2 + alpha (T - 1) ],        m2 = beta T rho / sqrt2,
```

and `L - G` is `L + G` at `psi + pi`, so the two signs coincide after the psi-average. Hence, exactly,

```
Lambda(G) = 2 E_{T, rho, psi} F_s( | sqrt(T) a(T) + m1 e^{i psi} + m2 e^{-i psi} |^2 )  -  (c^2 + s + |alpha|^2 + |beta|^2)/eps ,
```

with `F_s(u) = E|sqrt(u) + sqrt(s) G|` your Rice function, `T ~ Exp(1)`, `rho^2 ~ Exp(1)` independent, `psi` uniform. Without the B sector
(`beta = 0`) the psi-average is a single ring: `2 E_{T,rho} Fring_s(sqrt(T) a(T), |m1|)`, `Fring_s(x, m) = E_psi F_s(|x + m e^{i psi}|^2)`.
Checked against direct 5-dimensional quadrature to 1e-6 (`checkA.py`, A-sector only).

So this is a dual inequality in **four real parameters** without B `(c, s, |alpha|, arg alpha)` and **six** with B, over a compact set:
your Cauchy-Schwarz tail argument applies verbatim (total variance `V = c^2 + s + |alpha|^2 + |beta|^2 >= V0` is dead), and the payoff is
convex in the coefficient vector `(c, alpha, beta)` (expectation of norms of affine functions) and in `sqrt(s)`, so your vertex-interpolation
box cover applies. No multiplier is needed: there is no centered content variable here; the coupling is already inside `|m1|`.

## 3. What to prove (the claim, with the margin we measured)

Claim J1 [F, to be certified] (corrected after GPT's remark, 15 Oct): for all `(c, s, alpha, beta)`,

```
Lambda(G) <= S_* - (1 - theta) d_q(c, s)       with  theta = 1/4   (the table below shows the sectors recover at most 16 % of d_q),
```

where `d_q(c,s) = S_* - Lambda(c H(X) + sqrt(s) Gbuf)` is the q-only deficit of the junta. The earlier form `S_* - d_A|alpha|^2 - d_B|beta|^2 - d_q`
was too strong: it would forbid any gain from the sectors, and the sectors do gain (positive `ratio` column). A per-sector deficit is only
available far from the aligned phase. Even the weak form `Lambda(G) <= S_* + 1e-5` suffices for the certificate.

Measured margins [F] (`peel.py`, `peel2.py`, `fixq.py`, `quadmodel.py` in `handoff/research-third-decimal/kattack-2026-10-15/`), parametrised by
`c = sigma a`, `s = sigma^2 (1 - a^2)`:

| a | sigma | q-only margin `S_* - Lambda(alpha=beta=0)` | min over real alpha >= 0 (aligned phase) | alpha* | min over (alpha, beta) in C^2 |
|---|---|---|---|---|---|
| 0.15 | 0.20 | 1.68e-5 | 1.66e-5 | 0.0007 | - |
| 0.30 | 0.20 | 2.08e-4 | 2.00e-4 | 0.0042 | 1.99e-4 |
| 0.45 | 0.20 | 8.27e-4 | 7.71e-4 | 0.0105 | - |
| 0.60 | 0.20 | 2.10e-3 | 1.90e-3 | 0.0194 | 1.90e-3 |
| 0.80 | 0.20 | 5.12e-3 | 4.48e-3 | 0.0350 | - |
| 1.00 | 0.20 | 9.97e-3 | 8.38e-3 | 0.0545 | 8.31e-3 |
| 1.00 | 0.30 | 2.98e-2 | 2.56e-2 | 0.0807 | 2.53e-2 |

The A/B sectors recover at most 16 % of the q-only margin; B adds almost nothing beyond A; the optimal amplitudes are small. For fixed
junta, maximising additionally over the even sectors `r_Y = y(|X|^2-1) + y' xi, r_W = w X^2/sqrt2, nu` returns exactly the odd-sector optimum
(difference 1e-14 at nine points), consistent with your orthogonal-profile extension.

Quadratic model along the aligned direction (`quadmodel.py`): `Lambda(alpha) - Lambda(0) = 2 c_lin alpha - d alpha^2` with `c_lin` equal to the
content `|E[conj(X) F_A(q0)]|` to 0.1-2 % (15 points) and `d = 1/eps - h_eff = 0.42-0.62`, i.e. the effective curvature is 1.4-2.1 times the
rigorous `1/eps - h_X = 0.292` of the global secant majorant. So the boxes will be coarse; the hard region is small `a` (near-Gaussian junta,
`sigma` near `0.2`), where the q-only margin itself is ~1e-5: there the deficit must come from the exact q-only comparison, not from
a crude bound.

Negative information you may want: the equal-variance "peeling" of the shared coordinate (replace `alpha X` by `alpha Z'`, independent, same
conditional variance profile) is **not** an upper bound: shared minus independent reaches +1.96e-2 at the aligned phase (a=1, sigma=0.3,
|alpha|=0.3) and -3.6e-2 at the opposite phase (`peel.py`). The ring must be kept.

## 4. Why J1 plus your theorems would cover "one influential coordinate + anything on independent drivers"

Condition on `(rho, psi)` and on the remote coefficient state: the junta becomes a deterministic shift `m1 e^{i psi} + m2 e^{-i psi}` of the
visible centre, and any Gaussian-factor structure on *other* drivers is conditionally proper Gaussian around that shifted centre. Your
profile-addition mechanism (derivative bound `0 <= d_w 2F <= 3/(5 sqrt U)`) then applies with `U` replaced by the shifted squared centre
`|sqrt(T) a + m1 e^{i psi} + m2 e^{-i psi}|^2`; the only new difficulty is that the shifted centre can be small on a set of small probability
(where `1/sqrt(U)` is large), so the derivative bound must be integrated against the law of `(T, rho, psi)` rather than used pointwise. This is
the step that would merge J1 with `GLOBAL_A_CERTIFICATE` into a theorem for "one junta coordinate + Gaussian factors + orthogonal channels".

## 5. An exact identity for the content, for the general (non-junta) case

For a residual `q0 in H_{2,1}(w)` and a unit direction `p` (so `r_A = sum_j p_j conj(w_j)`-type pairing), Gaussian integration by parts gives

```
content_A(p) := <p, Pi_{1,0} F_A(q0)>  =  E[ F_{A,u}(q0) D_p q0 ]  +  E[ F_{A,ubar}(q0) conj(Dbar_p q0) ],       D_p = sum_j conj(p_j) d/dw_j .
```

Since `D_p q0 in H_{1,1}(w)` and `Dbar_p q0 in H_{2,0}(w)` are pure second chaos, only `Pi_{1,1} F_{A,u}(q0)` and `Pi_{0,2} F_{A,ubar}(q0)` enter:

```
|content_A(p)| <= ||Pi_{1,1} F_{A,u}(q0)|| * ||D_p q0||  +  ||Pi_{0,2} F_{A,ubar}(q0)|| * ||Dbar_p q0|| ,
||D_p q0||^2 <= lambda_max(Gamma) <= 0.866 sigma^2 x    (Theorem 5 of PROOF_NOTES),
```

and the second-chaos parts of the derivative profiles are `F''`-weighted copies of `U_2 = Pi_2 |q0|^2` (size `O(sigma^2 x)`), which is the
third-order structure made explicit. The deficit's leading term is the pairing of the same fluctuation with `|q0|^2` itself,
`Cov(W, U) = (2/3)||U_2||^2 + (1/3)||U_4||^2`. For the polynomial profile `F = gamma u + delta u|u|^2` this is L2 (your `2.2029 kappa^{3/2}` and the
kurtosis-dependent bound); the bounded profile saturates beyond `|q0| ~ 0.5`. A sharp bound must control the second-chaos content of smooth
functions of `|q0|^2` through the influence matrix `M = Gamma + Gamma'^T`, jointly with the influence in the direction `p`.

## 6. GPT's new B case (received while writing this)

When the shared coefficient has uniform phase conditional on its magnitude and variance, phase averaging turns the improper conditional Gaussian
into a variance mixture covered by the A theorem; this admits nonzero pseudocovariance without the orthogonality assumption. For the junta of
Section 2 the analogous fact is that `psi` is uniform and independent of `(T, rho)`, which is why the two-sign payoff collapses to one ring average.

## 7. Files

`handoff/research-third-decimal/kattack-2026-10-15/`: `peel.py`, `peel2.py`, `fixq.py`, `quadmodel.py`, `checkA.py` and their logs; the
full report `handoff/research-third-decimal/conjecture-K-report/conjecture_K_report.{pdf,md}` (Section 8 = this proposal in short);
the main document `handoff/research-third-decimal/handoff-2026-10-15/main.pdf`, Chapters 11-13.
