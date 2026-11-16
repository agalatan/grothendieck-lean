<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/review/PROJECTION_AND_COMPACTNESS.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round2/review/PROJECTION_AND_COMPACTNESS.md -->
# Projection, compactness, and the remaining global reduction

Independent derivations by the review worker. These statements do not prove full Conjecture K. The normalized fourth excess below is that of the **whole** cubic unless explicitly restricted to its remote projection.

## 1. Exact third-chaos contraction bounds

Write a real third-chaos variable as F=I_3(f), with symmetric real tensor f and E F²=6||f||². Set M=f⊗₂f, a positive Gram operator, a=||M||²_HS, and s=||Sym(f⊗₁f)||². The product formula and Ornstein–Uhlenbeck integration by parts give

    κ₄(F)=1296a+1944s,
    0≤s≤a,
    1296a≤κ₄(F)≤3240a.                         (1)

Here ||f⊗₁f||²=||f⊗₂f||²: these are respectively the squared Hilbert–Schmidt norms of AA* and A*A for the flattening A:H→H⊙². Also

    E|D_e F|²=18⟨Me,e⟩.                       (2)

All formulas use standard real coordinates of variance one.

For a complex H₂,₁ cubic G, put U=E|G|² and δ(G)=E|G|⁴−2U². Its global phase covariance implies circularity, hence

    κ₄(Re G)=3δ(G)/8.                         (3)

## 2. Visible energy is small when total fourth excess is small

Let Z=(X+iY)/√2 be the visible coordinate. In the orthogonal sector decomposition

    G=q+(T−1)r_A+Z² conjugate(r_B)/√2+ZQ+conjugate(Z)P+νZ(T−2)/√2,

write V_A=||r_A||², V_B=||r_B||², W_Q=||Q||², W_P=||P||², W_ν=|ν|². The visible Ornstein–Uhlenbeck influence is

    I_vis(G):=E(|∂_XG|²+|∂_YG|²)
             =2(V_A+V_B)+W_Q+W_P+3W_ν.        (4)

This is the standard Hermite degree identity in the visible variables. Global phase covariance, which commutes with the visible OU generator, gives I_vis(Re G)=I_vis(G)/2. If P_vis denotes the rank-two real projection onto X,Y, equations (1)–(3) imply

    I_vis(G)=36 Tr(P_vis M)
       ≤36√2 ||M||_HS
       ≤(√3/2)√δ(G).                         (5)

In particular, for h=G−q,

    ||h||²≤(√3/2)√δ(G),
    ||q||²≥U[1−(√3/2)√χ(G)],
    χ(G)=δ(G)/U².                            (6)

This is a total-chaos statement, not a consequence of small remote kurtosis alone.

## 3. Remote projection has controlled fourth excess

Let Q be the orthogonal projection of the real Gaussian space onto the remote coordinates, and f₀=Q⊗³f the kernel of Re q. Its Gram operator M₀ satisfies

    0≤M₀≤QMQ.                                (7)

Indeed, for e in the remote space, ||f₀(e,·,·)||² is obtained from ||f(e,·,·)||² by deleting orthogonal components in its two remaining tensor slots. Consequently

    ||M₀||²_HS≤||QMQ||²_HS≤||M||²_HS.

For the first inequality, positive operators A≤B satisfy Tr A²≤Tr B², since Tr[(B−A)(B+A)]≥0. Applying (1) and then (3) proves

    δ(q)≤(5/2)δ(G).                          (8)

No monotonicity assertion δ(q)≤δ(G) is used. Combining (6)–(8), whenever the denominator is positive,

    χ(q)≤(5/2)χ(G)/[1−(√3/2)√χ(G)]².         (9)

## 4. An explicit compact energy annulus at the peak

Let p=2500/1891 and use the peak a=699/1250,b=179/1250. Write B₀=2E|L| and S=sup_v[B(v)−pv]. The previously certified gap is S−B₀>0.002074245.

The paired triangle inequality gives

    Λ(G)≤B₀+2√U−pU≤B₀+2√U.

Therefore U≤10⁻⁶ implies Λ(G)<S. At the other end, Cauchy–Schwarz followed by concavity of the square root gives

    Λ(G)≤2√(M+U)−pU,
    M=E|L|²=a²+4ab+6b²=0.75605184.            (10)

The function on the right decreases for U≥1. At U=1 it is less than 1.332, since M+1<1.326² and p>1.32, whereas S>B₀>1.37. Thus every raw counterexample has

    10⁻⁶<U<1.                               (11)

If χ(G)≤1/3, (6) further gives

    5·10⁻⁷<||q||²<1.                        (12)

This compact interval suffices to take uniform minima of the strictly positive Gaussian visible-sector cost and of −B''(u). It imposes no response-only energy cut.

There is also a ray reduction: for a unit direction H, the map r↦F(rH) is 2-Lipschitz, so Λ(rH) decreases for r≥ε=1/p. Since χ(rH) is scale invariant, checking a kurtosis cone only at U≤ε² proves it at every amplitude. This also applies to the retained functional: its unpenalized part, an infimum over the same first-chaos trial space, is 2-Lipschitz in G.

## 5. Finite influential directions, and the obstruction to a simple compactification

For a normalized real cubic F=I₃(f), E F²=1, Tr M=1/6. Equations (1)–(2) show

    max_e E|D_eF|²≥κ₄(F)/30.                 (13)

Indeed, ||M||_op≥||M||²_HS/Tr M≥κ₄(F)/540. For F=√(2/u) Re q this yields a real unit Gaussian direction e with

    E|D_eq|²≥uχ(q)/40.                       (14)

Thus the previous dimension-free near-Gaussian remote theorem forces every hypothetical remote counterexample to retain an influential direction: χ(q)>χ₀, hence the right side is at least uχ₀/40.

More generally, let Q_k project off the top k eigenvectors of M and set F_tail=I₃(Q_k⊗³ f). Its Gram operator has operator norm at most 1/[6(k+1)] and trace at most 1/6. Therefore

    κ₄(F_tail)≤90/(k+1).                     (15)

This is an **absolute**, not variance-normalized, bound. The remaining terms contain at least one of the k extracted Gaussian coordinates. Their coefficients are polynomials of degree at most two in the unextracted variables. They are not generally scalar independent Gaussian noise.

For example, with independent standard complex X,Y_j,

    q_N=X N^(−1/2)Σ_j(|Y_j|²−1)
       ⇒ X R,

where R is an independent real standard Gaussian. Every q_N lies in H₂,₁, but the limit contains a product of a degree-one Gaussian with a newly Gaussianized degree-two field. This is a genuine boundary configuration that must be handled by a compactification.

Elementary law compactness is sufficient for existence of a generalized maximizer: (10) bounds energies, Gaussian hypercontractivity gives uniform moments, and the joint laws of (Z,G) are tight. Along a weakly convergent subsequence all required second moments and paired absolute moments converge. The supremum is attained in the weak-law closure. This does not establish attainment in a fixed H₂,₁(Cⁿ), nor a computable dimension bound.

External context, not an additional premise in (1)–(15): Herry–Malicet–Poly, arXiv:2412.06749v1, Theorems 1.2/3.1, prove joint weak closure of bounded-degree Gaussian polynomial laws. Assaad, arXiv:2608.12492v2, Theorems 2.4/2.8, gives a finer weighted-chaos description; at order three its components have weights 1+1+1, 1+2, or 3. The latter is a recent external preprint, not independently re-proved in this note. Neither result supplies Gaussian norm domination.

## 6. The shortest exact algebraic target

For G=q+h with q remote and h all remaining sectors, define

    E(u)=S−[B(u)−pu]≥0,
    D(q)=B(u)−F(q),
    A(q,h)=F(q+h)−F(q)−p||h||².

Then the identity

    Λ(q+h)−S=A(q,h)−D(q)−E(u)                (16)

shows that exact raw K is precisely the assertion A(q,h)≤D(q)+E(u) for every cubic decomposition. K_η replaces the right side by D+E+η. In particular, a remote cap Λ(q)≤S+η_R does **not** imply D(q)≥−η_R.

For the retained functional, define A_hat(q,h)=Λ_hat(q+h)−Λ(q); then the same identity holds with A_hat. A sufficient proof can use any one admissible first-chaos trial in its defining minimum. One must specify whether the trial space is the whole H₁,₀ or only its remote part; a visible trial cZ is allowed only in the former. The current monograph uses the full first chaos; its README has a narrower wording.

The preceding local Gaussian theorem supplies a strict visible cost at price B'(u), not necessarily at the fixed price p for u≠v*. For a dimension-uniform small-total-kurtosis argument, compare to B(u+||h||²): Taylor expansion contributes B'(u)||h||², and the scalar error B(u)+B'(u)||h||²−B(u+||h||²)=O(||h||⁴) can be absorbed by the strict visible cost on (12). This avoids incorrectly assuming p−B'(u)≥0 below v*.

Full K still requires (16) at arbitrary kurtosis and arbitrary shared sectors. Local stability at the Gaussian core, a small-kurtosis cone, a zero-core sector estimate, and small-amplitude pointwise joint bounds do not by themselves cover that remaining set.

## 7. Gaussian benchmark curvature is controlled down to zero variance

The existing Gaussian scale-mixture representation writes L in law as √V W with V>0, so

    B(u)=√π E√(V+u),
    −B''(u)=(√π/4)E(V+u)^(−3/2).

The density of L at w depends on s=|w|² through

    g(s)=exp(−t)/(πD(t)),
    s=t(a+bt)²,
    D(t)=(a+bt)(a+3bt).

Its mixture representation gives g(s)=π⁻¹E[V⁻¹exp(−s/V)]. Right difference quotients at zero and monotone convergence identify

    E V⁻²=−πg'(0)=(1+4b/a)/a⁴.               (17)

Consequently, uniformly for u≥0,

    −B''(u)≤(√π/4)[(1+4b/a)/a⁴]^(3/4).      (18)

This also proves continuity of B'' down to u=0 by domination. For 0≤u≤M, Jensen's inequality gives

    −B''(u)≥√π/[4(E|L|²+M)^(3/2)]>0.        (19)

These bounds are uniform on compact profile sets with a bounded away from zero and b bounded above. In particular the tangent loss

    0≤B(u)+B'(u)v−B(u+v)≤(K/2)v²

holds whenever K is the right side of (18). This supplies the scalar estimate needed when matching total rather than remote energy.

For a **strict visible-sector gap**, the profile compact set must also remain inside b>0. At b=0 the tangential Q-sector Gaussian quadratic cost vanishes, so the current absorption argument does not extend to that boundary without another idea.

## Independent checks of other round-two lemmas

The review worker rederived the raw B angular pass in RAW_CONTENT_BOUND.md: its phase response is E[Z² conjugate(ph(L+y))/√2]. The conjugate phase contributes e^(−iθ), and rotating Z contributes e^(2iθ), leaving the same e^(iθ) angular identity as for A. Its real response is real by conjugation symmetry and odd by Z→−Z. The weighted pushforward density is w²exp(−t)/[√2π(a+bt)²D(t)], and is Schwartz uniformly on compact a>0,b≥0 sets; hence its projected second derivatives are integrable and the required third response derivative is bounded. The inherited real resolvent gives squared A/B content O(δ(q)^(3/2)).

The review worker also checked TAYLOR_REMOTE_BASE.md: the pointwise remainder interpolation, the five orthonormal visible basis functions, the weighted-density bounds 13/(πa²) and mass65, and the vector degree-two hypercontractivity are correct. The paired remainder constant430 a^(−3/2)||h||^(5/2) is valid with arbitrary sharing.

Finally UNIFORM_NEAR_GAUSSIAN_COST.md was checked for its mixed-contraction identity, carré-du-champ coefficients, conditional Gaussian Stein characterization and singular-Hessian uniform integrability. No Gaussian limit is needed for the normalized lower-chaos coefficient vector. The contradiction proof extends uniformly over compact variances including zero, using q→0 in L² at that endpoint, and over compact positive profiles by continuity of the Gaussian sector matrices. These are mathematical review conclusions; none asserts a Lean formalization or a numerical value of the resulting small-kurtosis threshold.
