<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/weak-k-20261015/package/content/GAUSSIAN_LOCALIZATION.md (file dated 2026-10-15). Only this line was added. -->
# Exact localization costs for Gaussian A/B coefficients

Let A be the vector of the two **holomorphic first-chaos** coefficients. With the convention G_A=(T−1)r_A and G_B=Z² r_B/sqrt(2), where r_B is antiholomorphic, this is A=(r_A,conj(r_B)), not (r_A,r_B). Equivalently write G_B=Z² conj(β)/sqrt(2) and A=(α,β). Assume A is a centered **jointly proper** complex Gaussian vector, with arbitrary covariance and arbitrary dependence on a cubic q. Write U=||A||² and w=EU. The two conclusions below use only the Gaussian **marginal** of A. No independence from q is required.

## 1. Stop-loss domination by a single exponential

Diagonalize the covariance: U has the law sum_j λ_j E_j, where E_j are independent unit exponentials and sum λ_j=w. For every convex φ, pointwise Jensen gives

    E φ(U) = E φ(w sum_j (λ_j/w) E_j) ≤ E φ(w E_1).

In particular, for d≥0,

    E(U−d)_+ ≤ w exp(−d/w).                         (1)

The w=0 case is immediate.

## 2. A large-amplitude tail, uniformly under coupling

For c>0 and 0≤d<c, U 1_{U>c} ≤ c(U−d)_+/(c−d). Thus

    E[U 1_{U>c}] ≤ min{ w, c exp(1−c/w) }          (2)

when c≥w, by setting d=c−w. For c<w, retain w. Equivalently, for any w≤w0≤R²,

    E[||A||² 1_{||A||>R}]
       ≤ w · (R²/w0) exp(1−R²/w0).                (3)

The factor is increasing in w0 on this range.

## 3. A q-tail event costs entropy, not Cauchy–Schwarz

For any event B, put p=P(B). Since U 1_B≤d 1_B+(U−d)_+, (1) implies

    E[U 1_B] ≤ inf_{d≥0} [dp+w exp(−d/w)]
             = w p(1−log p),                      (4)

with the endpoint values interpreted by continuity. This is valid in particular for B={|q|>s0}, however strongly q and A share their Gaussian drivers. No estimate of E[U|q|^k] is needed.

A six-moment bound gives the fallback p≤min(1,E|q|^6/s0^6), but a law LP can retain the actual tail probability and improve it. The function p(1−log p) is increasing on [0,1].

## 4. Conditional localization theorem for a fibre majorant

Suppose a global majorant has quadratic cost γ||A||², and a sharper matrix cost A*C A holds whenever |q|≤s0 and ||A||≤R. Both must have the **same** baseline and linear profile term. Let

    Δ=max(0, λmax(γ I−C)).

Then for all couplings, the expected cost is at most

    E[A*C A] + Δ w [p(1−log p)+R²/w0 exp(1−R²/w0)]          (5)

if w≤w0≤R² and P(|q|>s0)≤p. The proof uses the local cost on the good event, the global cost on its complement, and bounds the two bad events by (3) and (4). A union bound is sufficient; their overlap is harmless.

Consequently the corresponding coercive matrix is

    ε^(-1)I − C − Δ[p(1−log p)+R²/w0 exp(1−R²/w0)]I.

If positive definite, completing the square against the **actual** first-chaos profile contents is legitimate. This is a route from a jointly localized finite-amplitude certificate to a uniform statement; it is not a claim that the candidate global/local majorants have been certified.

For the tied multiplier k=r_A/3+r_B/6, the actual profiles are FA+F0/3 and FB+F0/6. Ordinary Bessel alone was numerically insufficient, so the coupled Stein/spectral constraints remain relevant after localization.

## 5. Stronger matrix form

One need not replace γI−C by its largest eigenvalue. Put D+=(γI−C)_+, its positive spectral part. The scalar variable V=A*D+A is itself a nonnegative Gaussian quadratic form. Applying (4) to V gives

    E[V 1_B] ≤ p(1−log p) E V.

Markov applied to (1), with threshold R² and d=R²−w, gives

    P(||A||>R) ≤ exp(1−R²/w) ≤ exp(1−R²/w0)

when w≤w0≤R². Thus if

    p_bad = min(1,p_q+exp(1−R²/w0)),
    θ_bad = p_bad(1−log p_bad),

the expected cost is bounded by

    E[A* (C+θ_bad D+) A].                          (6)

This is stronger than the scalar Δ correction and retains the important anisotropy of the two A/B directions. It follows by a union probability bound on the bad event. There is no claim of independence between that event and V.

## 6. A near-maximizer amplitude bound

Suppose a valid global fibre majorant has coercivity δ>0 and nonlinear first-chaos content norm at most c. If the q-only objective is at most S+η0, then every candidate whose full objective is at least S−r satisfies

    δw−2c sqrt(w) ≤ η0+r,
    sqrt(w) ≤ [c+sqrt(c²+δ(η0+r))]/δ.               (7)

This is merely solving a quadratic, but it supplies the w0 needed in (3) and (6). It is appropriate for a weakened conjecture that needs to control only near-maximizers. The constant c must be a proved uniform content bound in the relevant law/parameter cell; a measured content norm cannot be substituted.

The same principle applies to a matrix coercivity with δ its smallest eigenvalue, or more sharply in the induced norm. There is still a numerical and analytic proof obligation to certify the global fibre majorant and c. These implications do not remove that obligation.
