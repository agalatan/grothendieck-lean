<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/ADDITIONAL_ANALYTIC_AUDIT.md (file dated 2026-11-13). Only this line was added. -->
# Additional analytic and provenance audit

Agent: codex-a713 (`assembly_audit`), 13 November 2026. This is a selective audit of the gate-free row, Gaussian comparison theorems, disjoint-driver arguments, and the remote-cubic numerical bound. It is not an exhaustive verification of every manuscript assertion. No Lean build or modification of existing source files was performed. Numerical premises not replayed here are explicitly identified.

The main assembly audit is [ASSEMBLY_AUDIT.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/ASSEMBLY_AUDIT.md). Its finite-amplitude joint-cost gap remains: the following valid restricted comparison theorems do not supply the missing general mixed-cost hypothesis.

## 1. The exact gate-free row: independently rederived

Source: [legacy/ch7-conjectureK.tex](/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/ch7-conjectureK.tex:13), Proposition `prop:row`.

Let the witness operator be `T_op=P−εQ`, with the orthogonal projections used in the manuscript. Put `h=(f+g)/2`, `k=(f−g)/2`, `Ph=tZ`, `B=βZ(|Z|²−2)`, `L=ℓZ+B`, and `G=εQk`. Self-adjointness gives the exact real-part identity

\[
\Re\langle f,T_{op}g\rangle
=t^2-\varepsilon\|Qh\|^2-\|Pk\|^2+\varepsilon\|Qk\|^2.
\]

The two square completions are

\[
\varepsilon\|Qk\|^2=2\Re\langle G,k\rangle-\|G\|^2/\varepsilon,
\quad
-\varepsilon\|Qh\|^2
=2\Re\langle B,h\rangle+\|B\|^2/\varepsilon
-\varepsilon\|Qh+B/\varepsilon\|^2.
\]

Here `B∈ran Q` and `||B||²=2β²`. Adding `−2ℓt+2Re⟨ℓZ,h⟩=0`, using `|f|=|g|=1`, and dropping the two nonnegative losses gives exactly

\[
\Re\langle f,T_{op}g\rangle
\le t^2-2\ell t+2\beta^2/\varepsilon+
\mathbb E|L+G|+\mathbb E|L-G|-\|G\|^2/\varepsilon.
\]

This is valid for every real `ℓ,β` and `ε>0`; the profile box is not needed for this step. The exact discarded losses are `||Pk||²`, `ε||Qh+B/ε||²`, and the pointwise phase slack. There is no hidden gate or unexplained numerical premise.

## 2. Theorem A: a complete analytic reconstruction, with the remote exclusion retained

Record: [CONJECTURE_K_MONOGRAPH.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:88). The originally named “Gaussian domination for two classes of charge-one cubics”/“gaussian-domination-cases” artifact was not located in the supplied `ai-notes` tree. Its sequel [chatgpt-thread1-remote-cubic-comparison.tex](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread1-remote-cubic-comparison.tex:36) supplies the notation and the correction concerning a remote part. The argument below independently supplies the claimed theorem rather than treating the missing original as replayed.

Write `a(t)=a+bt`, `a,b>0`, `a/b≥11/4`, `T~Exp(1)`, `L=Za(T)`. When the cubic vanishes at `Z=0`, its conditional second moment has the form

\[
\mathbb E(|G|^2\mid T=t)=t\{C+D(t-2)^2+Et\},
\qquad v=\|G\|^2=C+2D+2E,
\]

with `C,D,E≥0`. Pointwise averaging of the two square roots followed by conditional Jensen bounds `F(G)/2` by the integral of the square root of this conditional energy plus `|L|²`. Take its tangent at `t[(a+bt)²+v]`. With

\[
f(t)=((a+bt)^2+v)^{-1/2},\quad
J=\int_0^\infty\sqrt t\,e^{-t}f(t)\,dt,
\]

the corrections are half of `D I_D+E I_E`, where

\[
I_D=\int\sqrt t e^{-t}(t^2-4t+2)f(t)\,dt,
\quad I_E=\int\sqrt t e^{-t}(t-2)f(t)\,dt.
\]

Since `f` decreases, covariance under `Gamma(3/2,1)` gives `I_E≤−J/2`. Two integrations by parts give

\[
I_D=\int\sqrt t e^{-t}\{t^2f''+tf'-f/4\}\,dt.
\]

Put `A=a/b`. Direct differentiation gives `f''≤−2f'/(A+t)` and `−f'/f≤1/(A+t)`. Thus `t²f''+tf'≤0` on `t≤A`, and on `t>A` it is at most `f t(t−A)/(A+t)²<f`. The `f`-tilted Gamma tail is at most the ordinary Gamma tail. For `A≥11/4`, that tail is less than `3/20`:

\[
\Pr(\Gamma(3/2,1)>A)
\le {e^{-A}(2\sqrt A+1/\sqrt A)\over\sqrt\pi}
\le {26\over31\sqrt{33}}<3/20.
\]

Here `π>3` and `exp(11/4)>31/2` suffice; the latter follows from its Taylor polynomial through degree seven. Consequently `I_D<−J/10`. The tangent bound is therefore at most

\[
J_0=\mathbb E[|Z|\sqrt{a(T)^2+v}].
\]

For completeness, the radial comparison `J_0≤E|Za(T)+√vW|` also has a direct proof. Set `m_v(y)=E|y+√vW|`, `R=|Z|`. For constant `c≥0`, the difference `m_v(cR)−R√(c²+v)` has expectation zero. Its derivative in `c` is

\[
R\{m_v'(cR)-c/\sqrt{c^2+v}\}.
\]

Since `m_v'` increases, this has one sign change from negative to positive, and its full integral is zero. Its integral on every upper tail is nonnegative. The sets `{a(R²)>c}` are upper tails; integrate the derivative over `c` to obtain the claimed radial comparison. Truncation handles unbounded profiles; the present linear profile is integrable. For `v=0` there is equality. Therefore `F(G)≤B(v)` at every amplitude, analytically, without quadrature.

The exclusion of a remote part is substantive. A remote variance `h` creates the additional tangent correction

\[
{h\over2}I_H,\qquad
I_H=\int t^{-1/2}(1-t)e^{-t}f(t)\,dt
=\int\sqrt t e^{-t}(f-2f')\,dt>0.
\]

This independently confirms the sequel's correction: Theorem A does not apply to `q+G_0` for arbitrary remote `q`. A quantitative extension with `(19/11)h≤D/10+E/2` is valid by `−f'/f≤b/a`; it still leaves general sector assembly open.

## 3. Theorem B: analytic proof checked, conditional variance hypothesis essential

Source: [chatgpt-thread2-gaussian_domination_note.tex](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread2-gaussian_domination_note.tex), §3.

The theorem assumes a *centered proper Gaussian conditional law* given `(Z,ℱ)`, where `ℱ` is independent of `Z`, and conditional variance

\[
s+u(T-1)^2+bT+cT^2,
\]

whose coefficients are nonnegative, `ℱ`-measurable, and integrable. It requires `0<a/β≤11/2`; no positive lower bound on the Gaussian optimizer is needed. In particular it covers the zero-optimizer corner of the stated box.

I checked the analytic chain, including the scalar bounds used instead of accepting their plotted maxima. For

\[
K_w(r)=\sqrt{\pi/w}e^{-x}I_0(x),\quad
x=r^2/(2w),\quad m(x)=2x(1-I_1/I_0),
\]

the heat derivative is `∂_w M_w=K_w/4`; logarithmic derivatives of `K` in `r,w` are `−m,(m−1)/2`. The differential identity `m'=2−2m+m²/(2x)` and the Bessel-series inequality `I₂/I₁<x/4` give `m<13/10` by the crossing barrier at `x=169/120`. The bound `rK<6/5` follows from `I₁(1)<I₀(1)/2`, the single crossing of `m=1`, and `I₀(x)≤exp(x²/4)` on `0≤x≤1`. Thus these constants are analytic bounds, not numerical premises.

For the path `w_d(t)=s+bt+ct²+u[1+d t(t−2)]`, the derivative has weight `t(t−2)` of mean zero. For `t≥3/2`, the proof's estimates `w'/w≤2/(t−1)` and `(r'/r)(t−1)≥5/21>3/13` make the kernel decrease. For `t≤3/2`, `w(t)≤w(2)` and `r(t)/r(2)≤7√3/15<5/6`, together with the single maximum of `K_w(r)` as a function of `w` and `rK<6/5`, give `K(t)≥K(2)`. Hence the weighted derivative is nonpositive. The remaining variance profile is increasing and is compared to its mean by the decreasing-kernel covariance argument. Concavity of `B(v)` handles the random coefficients. Degenerate variances follow by approximation. I found no missing numerical premise in this proof.

**An incorrect scope explanation in the monograph should be corrected.** At [CONJECTURE_K_MONOGRAPH.md:107](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:107), the record says:

> “a sign-indefinite cross term 2αγ(T−1) in the variance ... That term cannot occur in H₂,₁ (q cubic and r_A linear are uncorrelated)”

Unconditional orthogonality does not imply conditional orthogonality. For independent proper complex Gaussians `X,Y,Z`, the genuine cubic

\[
G=X\{(|Z|^2-1)+(|Y|^2-1)\}
\]

is conditionally proper Gaussian given `(Z,Y)`, with variance

\[
[(T-1)+(|Y|^2-1)]^2.
\]

It contains the sign-indefinite term `2(T−1)(|Y|²−1)`. Averaging over `Y` cancels that cross term, but conditioning on the Gaussian driver does not. This example does not contradict Theorem B; it violates its explicit variance-profile hypothesis. The original theorem is sound, while the quoted explanation wrongly suggests that all shared-driver cubics avoid this obstruction.

## 4. Disjoint-driver cores: two different routes and their premises

### 4.1 Analytic redistribution of the independent Gaussian driver

Source: [chatgpt-thread1-remote-cubic-comparison.tex](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread1-remote-cubic-comparison.tex), §2.

For `U` proper Gaussian independent of `(Z,H)`, with `H` any square-integrable complex random variable, put `b=E|U|²`, `h=E|H|²`. The stated comparison

\[
F(H+(T-1)U)\le F(H+\sqrt bW)
\]

holds when `b+h≤ℓ²`. I independently checked the derivative argument and the outer integral estimate. Along `w_d=b[1+d t(t−2)]`, the two signed weights have equal mass `N=4e^{-2}`. The negative-weight normalized mean is `(9−e²)/2<81/100`, giving a negative contribution of magnitude greater than `37N/(50ℓ)`. Radial expansion for `t≥2` reduces the positive term to

\[
P(p)=N^{-1}\int_2^\infty t(t-2)e^{-t}
\mathbb E_\theta|\sqrt t e^{i\theta}+p|^{-1}\,dt
\le {1\over2}+{7p^2\over60}.
\]

The latter follows from the positive angular series with coefficients `[binom(2n,n)/4^n]²`, the first two terms bounded separately, and for `n≥2` the bounds `a_n≤1/(3n+1)` and `sup (t−2)√t e^{-t}/N<1/6`. The remaining sum is bounded by `1/2−5/192`, yielding `1/(16√3)+(1/6)(1/2−5/192)<7/60`. The resulting positive contribution is at most `37N/(50ℓ)`. The comparison is strict when `b>0`.

The norm restriction is sufficient for the penalized supremum: along a unit direction, `F(sG)` is 2-Lipschitz, so `F(sG)−s²/ε` cannot increase for `s≥ε`; throughout the box `ε≤ℓ`. A remote Gaussian buffer can be approximated by normalized sums of fresh independent Wick cubics, using the central limit theorem and uniform second moments. Therefore a valid *remote* bound `Λ(q)≤S+η` transfers to the disjoint-driver core with the **same η**. This is conditional on the remote bound: the comparison itself does not prove exact remote Conjecture K.

### 4.2 Uniform heat-kernel cost

Source: [chatgpt-thread2-remote_cubic_and_linear_shell.tex](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread2-remote_cubic_and_linear_shell.tex), and its [chatgpt-thread2-verify_core.mjs](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-thread2-verify_core.mjs).

The claimed stronger all-amplitude result is

\[
\Lambda(q+(T-1)U)\le\Lambda(q)
-\left({1\over\varepsilon}-{199\over200\ell}\right)\|U\|^2,
\]

for independent `q,U`. Its analytic reduction is valid: a uniform bound

\[
\int_0^\infty e^{-t}(t-1)^2
\mathbb E_\theta K_{s(t-1)^2}(r(t)e^{i\theta}+y)\,dt
<1.99/\ell
\]

integrated in `s` gives the factor `199/(200ℓ)` for the two-sided mean. I inspected the supplied fixed-point rational checker, including its corrected integer square roots, exponential upper bounds, radial-disk envelope, variance/profile covering, and tail deduction. I did **not execute that checker in this additional audit**. Accordingly the stated numerical kernel inequality remains an unreplayed certificate premise here, not an independently confirmed numerical theorem. The proof implication is checked separately from that premise.

## 5. Remote K-a: analytic reduction, numerical scope, and Lean provenance

Principal source: [legacy/ch24-remote-diagonal.tex](/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/ch24-remote-diagonal.tex:6). Supporting package: [README.md](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/remote-diagonal-20261015/package/README.md), [NUMERIC_REFINEMENT.md](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/remote-diagonal-20261015/package/numeric/NUMERIC_REFINEMENT.md), [refined_residual.py](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/remote-diagonal-20261015/package/numeric/refined_residual.py), [rigorous_radial.py](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/remote-diagonal-20261015/package/numeric/rigorous_radial.py), and [AUDIT_AND_IMPROVEMENTS.md](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/remote-diagonal-20261015/package/math_audit/AUDIT_AND_IMPROVEMENTS.md).

The explicit scope statement is “the peak profile only ... the row box and the envelope are not covered.” Its remote theorem assumes, for `U=|Q|²/v`,

\[
EU=1,\quad EU^2=2+x^2,\quad
EU^3\le6+9x^2+40.45313x^3,\quad 0\le x\le31/4.
\]

It claims the all-variance cap `Eφ(|Q|²)−v/ε<2747927/2000000=1.3739635<S+10^{-5}` via 51 interval bands. The alternative published constant `C₆=50` uses 289 bands and gives `S+17·10^{-6}`. These are different from an exact `η=0` theorem and from a box-uniform theorem.

By comparison, [CONJECTURE_K_MONOGRAPH.md:121](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:121) calls the remote result “moment and Stein inputs, kernel-checked,” while its [L1 ledger](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:436) says “certified in the project (Lean/native).” Neither description should be read as a verified current Lean theorem for the complete remote cap without the additional provenance described below, and neither removes the peak-only restriction of the identified certificate.

I checked the analytic reduction:

* The inverse `ψ` of `t(a+bt)²` gives survival `P(|L|²>y)=exp(−ψ(y))`. Differentiating in `y` applies `R(t)∂_t`, with `R=[(a+bt)(a+3bt)]^{-1}`. Products and negative derivatives preserve complete monotonicity; induction proves complete monotonicity of the survival. Its mass is one and it vanishes at infinity. Bernstein representation therefore makes `L` a circular Gaussian scale mixture.
* Consequently `φ(v)=2E|L+√v|` has a completely monotone derivative. Differentiability at zero needed in the interpolation follows from the smooth survival and its finite derivative moments; it must not be inferred merely from an arbitrary Gaussian mixture.
* Given `m>1`, `M>m²`, the two roots of `t²−αt+β`, with `α=(M−m)/(m−1)`, `β=(M−m²)/(m−1)`, bracket 1. The two-point law with mean 1 has second moment `m` and third moment `M`. The cubic Hermite interpolant at the two double nodes majorizes `φ(vt)` because its fourth derivative is nonpositive. Its cubic coefficient is nonnegative and its quadratic coefficient nonpositive, so it applies to the relaxed conditions `EU²≥m`, `EU³≤M`. Each kurtosis band uses the lower endpoint for `m` and upper endpoint for `M`, as required.
* Concavity in the variance supplies the global secant envelope; the radial integration code encloses the convex angular mean by Jensen and chord bounds, with a separate tail bound. No logical defect was found in the inspected reduction.

I did **not replay the Arb package** or reconstruct all 51/289 band certificates. Stored replay claims and logs are evidence of prior computation, not a new replay by this auditor. A current verification must identify the exact package, constants, profile, interpreter/Arb versions, input hashes, interval output, and the lower bound for `S`; it cannot silently promote this package to a theorem on all rows.

The old chapter also says the scalar sixth-moment consequence is Lean-certified “under tensor hypotheses.” Current source has advanced beyond that qualification for the moment ingredient. In [CircularTensor.lean](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/CircularTensor.lean:5280), `Circular.tensorFacts` constructs the tensor facts from cubic-chaos and circularity assumptions. [Circular.lean](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/Circular.lean:587) supplies `Circular.gaussian_sixth`; [Bridge.lean](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/Bridge.lean:81), `gaussian_moments`, invokes `hc.tensorFacts` itself, with no external tensor-hypothesis premise. Thus it would be inaccurate to claim that current source still leaves the sixth-moment tensor bridge unproved.

This is a **source-level observation**, not a fresh Lean build or axiom audit. It also does not make the separate Arb remote-cap computation kernel checked. I did not locate a current Lean theorem certifying the quoted `1.3739635` remote cap. A claim that the complete remote K-a bound is “kernel/native checked” needs an exact theorem name and dependency/axiom output for the cap, as distinct from the already formalized moment input. No current build was run, per the task's restriction.

## 6. Near-Gaussian coverage is overstated by the cited source

[CONJECTURE_K_MONOGRAPH.md:144](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/CONJECTURE_K_MONOGRAPH.md:144) says “the near-Gaussian regime δ/u²≤0.05 is covered instead by the manuscript's K_η proof (x≤0.22),” and [ASSESSMENT_2026-11-04.md:716](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ASSESSMENT_2026-11-04.md:716) repeats that citation.

The cited [legacy/ch7-conjectureK.tex:145](/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/ch7-conjectureK.tex:145) actually says:

> “So K_η with η=10⁻⁴ is proved (up to the float constants and the majorant) for x≤0.22.”

That qualification matters. The same source describes `M(1.03,1.20)` as having no violation on 16,430 random points and states that uniform treatment of the diagonal parameter `ν` is “not done.” It does not supply a certified general near-Gaussian theorem. Even if those premises were proved, `x≤0.22` means `x²≤0.0484`, not `x²≤0.05`. Therefore the cited argument does not justify deleting all `δ/u²≤0.05` from the open general domain. This finding is “unsupported by the cited source”; it is not a claim that no later, unlocated proof can exist.

## 7. Status ledger

| Claim | Result of this additional audit |
|---|---|
| Gate-free row | Independently rederived, exact, no numerical premise |
| Theorem A for a cubic vanishing at the visible origin | Independently reconstructed analytically for `a/b≥11/4`; original named artifact not located |
| Theorem A extended to arbitrary remote part | Invalid inference; explicit positive tangent term survives |
| Theorem B with its specified nonnegative conditional variance profile | Analytic proof checked; no mesh premise needed |
| “Conditional cross term cannot occur in H₂,₁” | False explanation; explicit cubic counterexample above |
| Independent-driver Gaussian redistribution | Analytic proof checked; norm restriction handled for penalized maximum |
| Independent-driver cost with coefficient `199/(200ℓ)` | Analytic implication checked; numerical kernel checker inspected but not replayed here |
| Peak remote cap with `η<10⁻⁵` | Analytic moment reduction checked; Arb band computation not replayed here; peak-only |
| Sixth-moment tensor bridge in current Lean source | Source-level bridge found; no fresh build/axiom verification |
| Complete remote cap is current Lean kernel/native theorem | Not established by identified sources; exact theorem and dependencies needed |
| General near-Gaussian regime `δ/u²≤0.05` already closed | Not supported by cited ch7; qualified floating/majorant argument and cutoff mismatch |

These checks support substantial restricted theorems while preserving the general shared-driver, finite-amplitude assembly, and final row-assembly gaps already recorded in the main audit.
