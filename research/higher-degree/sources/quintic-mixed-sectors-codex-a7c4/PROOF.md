# Two unconditional Rice bounds using diffuse cubic lifts

Agent-ID: codex-a7c4. **P + C, author only.** Task [#840](https://github.com/agalatan/grothendieck-lean/issues/840). The companion [weighted Gram argument](GRAM.md) treats arbitrary energy in the five nonremote sectors. Combining a different weight with [the support test for the same pair](ALL_SECTORS.md) extends the unrestricted low-amplitude comparison. The earlier [conditional projection inequality](../quintic-conditional-debit-codex-a7c4/PROOF.md) was independently reviewed in [#837](https://github.com/agalatan/grothendieck-lean/pull/837#issuecomment-7232640967).

Let q be any unit L² complex Wick chaos of bidegree (2,1) on finitely many standard proper complex Gaussian variables, and Z an independent standard proper complex Gaussian, normalized by E|Z|²=1. Then

    E|Z + .9 q| < 1.193,       E|Z + 1.2 q| < 1.3958.

They strengthen the mixed-energy allowance of [#837](https://github.com/agalatan/grothendieck-lean/pull/837) using two radii derived here. The five earlier radii have independently been established in [#832](https://github.com/agalatan/grothendieck-lean/pull/832#issuecomment-7232661961). With its notation h=(f+g)/2, k=(f−g)/2, P₁₀h=tZ, let R be the remote projection of P₂₁k, σ=‖R‖₂ and H=P₂₁k−R. For every unimodular pair in every dimension with 0≤t≤.65, the payoff of T=P₁₀−.78P₂₁+.0779P₃₂ is below 1/1.4023 when ‖H‖²≤.00478, and below 1/1.4025 when ‖H‖²≤.00464. All remote cubics qualify. The second trial below also reaches $t=.671$ with a smaller allowance. The unrestricted mixed-energy comparison over the whole amplitude interval remains open.

## The lifted inputs

Write U=|q|², χ=EU²−2 and m=√π/2. We use the moment and radius bounds from the [Conjecture K ledger, rows 3.4 and 3.7](../../../conjecture-K/STATUS.md):

    EU=1, 0≤χ≤42, EU³≤6+9χ+40.454χ^(3/2),
    E|p| ≤ ‖p‖ min(.9148, m(1+.00529 χ_p))

for p a cubic of the same bidegree and χ_p=E|p|⁴/‖p‖⁴−2. The coefficient .00529 rounds the reviewed 26449/5000000 upward. The linear coefficient is the reviewed KNG505 estimate. The reviewed global radius combines KNG505 through χ=6 with rows 16–22 of the Level-2 cert_916.json on [6,42], as recorded in Conjecture K row 3.7. The sixth-moment coefficient rounds 4045313/100000 upward.

Write ρ(x)=E|Z+√x| for x≥0. For each z≥0,

    Eρ(zU) ≤ √(1+z) min(.9148, m[1+.00529 χ (z/(1+z))²]).                 (1)

To see this, take independent copies T_j=A_j B_j conjugate(C_j) in fresh proper coordinates and S_N=N^(−1/2)Σ_j T_j. The variables T_j are centered, circular, unit variance, ET_j²=0, E|T_j|⁴=8. Thus E|S_N|⁴=2+6/N and S_N converges in law to Z by the bivariate CLT. By independence and circularity, the normalized cubic (S_N+√z q)/√(1+z) has fourth excess (6/N+z²χ)/(1+z)², exactly. Uniform L² bounds imply uniform integrability of its modulus, giving (1) on passing to the limit. Equation (1) is used at z=2,4 and in small-excess strips at the target z=s itself.

## Scalar certificates on the positive half-ray

At either target s=.81 or 1.44, each interval [l,h] in the supplied cover of [0,42] for χ has one of two proofs. An empty coefficient vector uses (1) directly at h. A seven-entry row stores rational coefficients (a,b,d,e,f,g,j) in units of 10^−12 and proves on every r≥0

    ρ(s r²) ≤ a+b r²+d r⁴+e r⁶+f r+gρ(2r²)+jρ(4r²).                     (2)

Only a,b,d may have either sign. Substitute r=|q| and use the moment bounds and (1); for the fourth moment use 2+h if d≥0 and 2+l if d<0. The same pointwise row may be integrated on arbitrarily many smaller fourth-excess intervals. The verifier bisects [l,h] and reevaluates the same outward expectation bound on each closed subinterval until all strict budgets hold there. All source caps are evaluated in the safe direction using integer square-root enclosures. This proves the claim globally in dimension and fourth excess.

For pointwise verification let D(r) be the right side minus the left of (2). On [L,B]⊂[0,24] the mesh lower bound is min(D(L),D(B))−max(0,K)(B−L)²/8 for

    K = 2b + 12d[(d>0)? B² : L²] +30e B⁴+m(2g+4j).

Indeed u↦ρ(z u²) is convex as a mean of norms of affine functions, and its second derivative is 2zρ′(zu²)+4z²u²ρ″(zu²)≤mz. Here ρ′(x)=(m/2)E exp(−xV), V~Beta(1/2,3/2), so ρ″≤0. After subtracting K r²/2, concavity gives the stated lower bound. The checker computes outward endpoint values and recursively bisects until the full interval is covered. For r≥24 use ρ(x)≥√x by Jensen and ρ(x)≤√x+1 by the triangle inequality. The resulting lower polynomial in r has seven nonnegative coefficients after translating r=24+y, y≥0. The mesh alone never certifies the unbounded tail.

## Exact kernel enclosures

For 0<x≤16, normalize ρ(x) by m. Its Taylor expansion starts 1+x/2−x²/16+⋯. Starting at j=1, the magnitude ratio of term j+1 to term j is x(2j−1)/(2(j+1)²). The even and odd Taylor truncations bound it below and above on the entire positive ray, by the integral remainder for the exponential in the beta formula for ρ′. We use degrees 80 and 81 with integer outward rounding in units of 10^−24.

For x>16 write R=|Z|, M(v)=mean_θ |1+v exp(iθ)|, so ρ(x)=√x E M(R/√x). For 0≤v≤1,

    M(v)=Σ_{j≥0} c_j v^(2j),    c_j=binom(1/2,j)²,     Σ c_j=4/π.

The equality at 1 follows by monotone convergence for the series and continuity for the angular norm. For j≤4 use these coefficients exactly. The rest of the series is between zero and v^10/256 because 4/π−Σ_{j=0}^4 c_j<1/256. On R>√x use 1≤M(R/√x)≤1+R/√x. Since R² is mean-one exponential, E[R^(2j) 1_{R²>x}]=j! e^(−x) Σ_{i=0}^j x^i/i!, and E[R 1_{R²>x}]≤e^(−x)(√x+1/(2√x)), by integrating the Rayleigh tail. Using e^(−x)≤(1+x/64)^−64 gives both enclosures in the checker. The factor multiplying the lower square-root enclosure is positive: main≥1, while missing(x) decreases with x and missing(16)=38929787/134217728<.291. The mean m is bracketed via the alternating Machin identity for π. No floating-point functions occur in verification.

## Transfer to the operator

For each real l≥0, test the actual pair on Z and l times the normalized remote projection q=R/σ. The two phase signs of q and its independence from Z give t+lσ≤E|Z+lq|. The σ=0 endpoint is immediate. Equation (1), with both test coefficients scaled, also gives t²+σ²≤.9148². Thus four adjacent t intervals are sufficient:

| t interval | remote upper bound | payoff row |
|---|---|---|
| [0,.44] | σ²≤.9148²−t² | discarded squares |
| [.44,.55] | σ≤(1.3958−t)/1.2 | discarded squares |
| [.55,.586] | σ≤(1.3958−t)/1.2 | joint trial of #837 |
| [.586,.65] | σ≤(1.193−t)/.9 | joint trial of #837 |

The discarded bound is (1−η)t²+η+(ε−η)(σ²+‖H‖²), ε=.78, η=.0779. For the first interval the substituted quadratic has positive leading coefficient 1−ε. For the second the leading coefficient is positive as well. The joint bound in #837 is the same expression plus η[(1.79−t)²+(.93−σ)²+2(1+η/ε)·.65²+2·.185²−2.575]. The debit 2.575 is re-integrated in transfer.py using #837. The expression is convex in t and σ jointly, so check all four vertices of each trapezoid, including σ=0. Every expression increases with ‖H‖². At the two mixed budgets the minimum payoff clearances exceed 7679/10⁹ and 4281/10⁹ respectively.


## A second trial beyond amplitude 0.65

The diffuse lift also transports the *proved* normalized bound at any one scale $s_0$ to all smaller scales. For $0\le v\le1$, the unit cubic $q_N=\sqrt v\,q+\sqrt{1-v}\,S_N$ is an admissible input at $s_0$. In the limit the independent Gaussian part has variance $1+s_0(1-v)$. Factoring it out gives
$$
\mathbb E|Z+\sqrt s\,q|\le r_{s_0}\sqrt{(1+s)/(1+s_0)},\qquad
s=\frac{s_0v}{1+s_0(1-v)}.
$$
These $s$ fill $[0,s_0]$. Here $s_0=.81$ and $s=.87^2$. Test the resulting support bound $t+.87\sigma\le 1.193\sqrt{(1+.87^2)/1.81}$. In the [projection inequality, §2](../quintic-conditional-debit-codex-a7c4/PROOF.md), take $(a,c,w,g_1)=(1.97,.73,.93,.189)$. With grid 256, the same integrator proves $D>3.26$ on every tilt in $[-1,1]$. The comparison uses the four vertices of each trapezoid between $t=.65$ and the endpoint. Joining with the preceding cover gives:

| full amplitude interval | maximum $\lVert H\rVert_2^2$ at target 1.4025 |
|---|---:|
| $[0,2/3]$ | $.001$ |
| $[0,.67]$ | $.00028$ |
| $[0,.671]$ | $.00005$ |

At $.672$ this last scalar majorant exceeds the target even at zero mixed energy. This control locates a limit of the trial.

From the repository root, run `python3 -IB research/higher-degree/code/quintic-mixed-sectors-codex-a7c4/transfer.py`. The [radius checker](../../code/quintic-mixed-sectors-codex-a7c4/rays.py) reconstructs the pointwise and shape covers from the [rational witnesses](../../code/quintic-mixed-sectors-codex-a7c4/rice_rows.json). The [transfer](../../code/quintic-mixed-sectors-codex-a7c4/transfer.py) recomputes both joint integrals, checks payoff clearances and exercises the rejection controls. Both use only Python's standard library.
