<!-- New fourth-audit note. Agent-ID: codex-a7c4. Refs #406. -->
# A certified larger region using only remote second moments

15 November 2026. **P by author, not externally reviewed; C scalar
acceptance** with `shared_a_second_moment.py`. This note re-derives the
orthogonality-only theorem behind STATUS 6.1.1, formerly R, and improves its
concave-envelope strips. The stronger fourth-moment claims in 6.1.2 are
separate inherited claims and remain R. Nothing here covers additional
visible sectors or proves Conjecture K.

## 1. Statement and what improves

Use the peak profile

\[
 a=699/1250,\quad b=179/1250,\quad p=1/\varepsilon=2500/1891,
 \quad L=Z(a+b|Z|^2),\quad B_0=2E|L|.
\]

Let q,r be any jointly distributed complex L² random variables, independent
of the visible standard complex Gaussian Z, with E[conj(q)r]=0. Put
u=E|q|², w=E|r|² and T=|Z|². There is no Gaussian, chaos, centering or mutual
independence requirement on q,r. At every amplitude,

\[
 \Lambda(q+(T-1)r)
 \le B_0+.389644u-.124324w.                         \tag{1}
\]

The coefficients are exact rational bounds, slightly sharper than the
inherited .38968 and −.12432. Using the existing independently replayed
Gaussian benchmark and the exact B₀ evaluation gives

\[
 S-B_0>.002074245.
\]

Consequently

\[
 u\le .00558+.31907w\quad\Longrightarrow\quad
 \Lambda(q+(T-1)r)<S+10^{-4}.                      \tag{2}
\]

This strengthens the old .00551+.319w cone. The independent
concave-envelope improvement below proves, throughout 0≤u≤.0463,

| Sufficient condition | Conclusion |
|---|---|
| w≥.0206 | Λ<S+10⁻⁴ |
| w≥.0208 | Λ<S |
| w≥.02105 | Λ<S−10⁻⁴ |

The old boundaries were .0223, .0225 and .0228. These are whole unbounded
strips in w, not just three sampled boundary points. For a cubic remote q
and a remote linear r, the required orthogonality is automatic. The result
also applies more broadly, and makes no assertion that these sufficient
regions are optimal.

## 2. Circular mean and a sharper concave envelope

Let

\[
 m(s)=\frac1{2\pi}\int_0^{2\pi}|1+\sqrt{s}e^{i\theta}|\,d\theta,
 \qquad C=59767/200000=.298835.
\]

The source `manuscript/legacy/lower-bound/sharp-circular.tex` proves the
near-optimal affine bound

\[
 m(s)\le1+Cs\qquad(s\ge0).                         \tag{3}
\]

Here is its independent exact acceptance. Set aₖ=binom(1/2,k)². On [0,1],
m(s)=Σaₖsᵏ, all coefficients are nonnegative and Σaₖ=4/π, so
m(s)≤1+(4/π−1)s≤1+Cs. For r≥1 use m(r²)=r m(r⁻²).
With N=12 and d=31831/25000−Σ₀ᴺaₖ>0, the exact inequality
4/π<31831/25000 gives

\[
 m(r^2)\le\sum_{k=0}^N a_kr^{1-2k}+d r^{-2N-1}.
\]

Thus (3) follows from positivity of

\[
 P(r)=Cr^{2N+3}-r^{2N+2}+r^{2N+1}
       -\sum_{k=1}^Na_kr^{2N+2-2k}-d.
\]

The new checker independently bisects [1,3] and accepts eight rational
cells by exact positive Bernstein coefficients; all coefficients of P(3+x)
are positive, proving the infinite ray. At r=581/400 the positive partial
sum through k=24 proves supₛ>₀(m(s)−1)/s>.298834. The older nearly optimal
slope is therefore confirmed, not claimed as a new result.

A stronger large-s estimate supplies the improvement. Pair θ and θ+π,
write A=1+s and c=cos θ, and put

\[
 D=\frac{\sqrt{A+2\sqrt{s}c}+\sqrt{A-2\sqrt{s}c}}2.
\]

Then

\[
 D^2=\frac{A+\sqrt{A^2-4sc^2}}2
 \le A-\frac{sc^2}{A}.
\]

The radicand is nonnegative since A²≥4s. Jensen for the square root and
Eθ cos²θ=1/2 yield the global estimate

\[
 m(s)\le h(s):=\sqrt{1+s-\frac{s}{2(1+s)}}.          \tag{4}
\]

Use the splice

\[
 g(s)=\begin{cases}
 1+Cs,&0\le s\le1,\\
 \min\{1+Cs,h(s)\},&s\ge1.
 \end{cases}                                      \tag{5}
\]

It is an increasing concave majorant of m, with 0≤g′≤C wherever the
derivative exists. To see the concavity, put x=1+s. The sign of h″ is the
sign of

\[
 -x^4+3x^2-x+3/4.
\]

For x≥2 this polynomial is negative: its value at 2 is negative and its
derivative −4x³+6x−1 is negative and decreasing. Also h(1)>1+C, while
h(s) grows as √s and the line grows linearly. Strict concavity on [1,∞)
therefore gives exactly one crossing s*>1. At that crossing h′(s*)<C.
The splice follows the line up to s* and h thereafter, so its slope drops
and then decreases. This proof does not require a numerical crossing point.

## 3. From the envelope to every remote L² pair

Write ℓ(t)=√t(a+bt). Averaging the independent visible phase and then
applying (3), or applying conditional Jensen to (5), gives respectively

\[
 \Lambda\le B_0+(2CK-p)u+(2CJ-p)w,                 \tag{6}
\]
\[
 \Lambda\le V(u,w):=
 2E\left[\ell(T)g\left(\frac{u+(T-1)^2w}{\ell(T)^2}\right)\right]
 -p(u+w),                                        \tag{7}
\]

where K=E[1/ℓ(T)] and J=E[(T−1)²/ℓ(T)]. The equality
E|q+(t−1)r|²=u+(t−1)²w uses precisely the stipulated orthogonality.
All expectations are finite: near t=0 the inverse-radius weight is
O(t⁻¹ᐟ²), and q,r have finite second moments. Values at T=0, a null event,
can be chosen arbitrarily.

The Gaussian resolvent integral and polynomial division give

\[
 K=\frac{\pi e^{a/b}\operatorname{erfc}(\sqrt{a/b})}{\sqrt{ab}},
 \quad I_1=\frac{\sqrt\pi-aK}{b},\quad
 I_2=\frac{\sqrt\pi/2-aI_1}{b},\quad J=I_2-2I_1+K.
\]

Fresh exact series evaluation gives

\[
\begin{aligned}
 K&\in(2.863947582582862,2.863947582582863),\\
 J&\in(2.003994641645051,2.003994641645052),\\
 2CK-p&\in(.389643727250781,.389643727250782),\\
 2CJ-p&\in(-.124324346959520,-.124324346959519).
\end{aligned}
\]

These imply (1). The existing benchmark lower bound S>1.3739535256614
and B₀=(387/500)√π imply the stated gap by exact subtraction. Equation (2)
then follows because

\[
 .389644(.00558)<.002074245+.0001,
 \qquad .389644(.31907)<.124324.
\]

Finally g is C-Lipschitz and increasing, so, for w₂≥w₁,

\[
 V(u,w_2)-V(u,w_1)\le(2CJ-p)(w_2-w_1)<0.            \tag{8}
\]

This provides the unbounded-w extension in the strip theorem; the
quartic fourth-moment bound is not being extrapolated to large w.

## 4. Exact finite integration for the three strip boundaries

Fix r₀=47/200, d=r₀², u₀=463/10000 and one of
w₀∈{103/5000,13/625,421/20000}. For 0≤x≤r₀ set

\[
 h_0(x)=a+bx^2,\quad y=u+w_0(x^2-1)^2,
 \quad A=x^2h_0(x)^2+y.
\]

Throughout this interval and 0≤u≤u₀,

\[
 \frac{y}{x^2h_0(x)^2}\ge
 s_{\min}:=\frac{w_0(1-d)^2}{d(a+bd)^2}>1.          \tag{9}
\]

Thus the h branch in (4) is an upper bound for g here. Choose this branch
on T≤d and the affine branch elsewhere, whether or not each is the smaller
branch. The resulting upper bound W satisfies

\[
\begin{aligned}
 W(u,w_0)-B_0={}&(2CK-p)u+(2CJ-p)w_0\\
 &+\int_0^{r_0}e^{-x^2}\left[
 4x\left(\sqrt{A-\frac{x^2h_0(x)^2y}{2A}}-xh_0(x)\right)
 -\frac{4Cy}{h_0(x)}\right]dx.                    \tag{10}
\end{aligned}
\]

There is no truncated tail: the affine part is integrated over the whole
half-line using K,J. To cover every u in [0,u₀], differentiate the finite
integral. Since h(s)²≤1+s and
(d/ds)h(s)²=1−1/[2(1+s)²], (9) gives

\[
 \partial_u W\ge
 \frac{f_{\min}d e^{-d}}{\sqrt{d(a+bd)^2+u_0+w_0}}
 +2C\left(\frac{\sqrt\pi}{a+b/2}-\frac{2r_0}{a}\right)-p>0,
 \quad f_{\min}=1-\frac1{2(1+s_{\min})^2}.           \tag{11}
\]

Here K≥√π/(a+b/2) is Jensen under the Gamma(1/2,1) law. The subtracted
small-radius affine derivative is at most 4Cr₀/a. The checker verifies
(9) and (11) exactly; the latter lower bounds exceed .012. It therefore
suffices to integrate (10) at u=u₀.

The interval integral uses 16,384 equal cells, 60-bit outward integer
interval arithmetic, exact integer square roots and alternating degree
8/9 Taylor bounds for exp(−x²). Acceptance produces:

| w₀ | Certified W(u₀,w₀)−B₀ upper bound | Compared with |
|---|---|---|
| .0206 | .002143066 | .002074245+.0001 |
| .0208 | .002061424 | .002074245 |
| .02105 | .001959303 | .002074245−.0001 |

All three strict comparisons pass. Combine (7), (10), monotonicity in u
and (8) to obtain the whole strips of §1.

## 5. Arithmetic trust and audit boundary

The new checker is run as

```sh
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/shared_a_second_moment.py
```

It is read-only by default; `--write-result` regenerates the adjacent JSON.
It rejects disabled assertions. The output is regenerated from definitions,
not read as numerical input.

The 220-bit interval radial library is reused from `odd_cost_check.py`; its
arithmetic was inspected here. Every construction rounds down/up to the
fixed dyadic grid. Addition, four-endpoint multiplication and reciprocal
on an interval excluding zero preserve inclusion. Square roots use exact
integer floor square roots. Machin's identity and alternating arctangent
series enclose π. The exponential Taylor tail has a geometric bound after
180 terms; the erf tail is alternating and decreasing from that index.
The recurrence for I₁,I₂ is exact. The new 60-bit finite-integral arithmetic
uses the same elementary outward-rounding principle with integer endpoints,
without sharing the old class.

For completeness, the Bernstein step is the exact identity: if
P(l+(r−l)t)=Σ₀ⁿcₖtᵏ, then

\[
 P(l+(r-l)t)=\sum_{i=0}^n b_i\binom ni t^i(1-t)^{n-i},
 \qquad b_i=\sum_{k=0}^i c_k\frac{\binom ik}{\binom nk}.
\]

The identity follows by expanding each power tᵏ in the degree-n Bernstein
basis. The basis is nonnegative and sums to one on [0,1], so a positive
minimum of the bᵢ is a uniform lower bound. The script explicitly transforms
the power coefficients to the unit interval before applying this formula.
This closes an arithmetic reasoning item excluded from the #403 review;
it is not a claim to have verified Python or integer arithmetic internals.

The monograph's L3/L4, STATUS 6, 9, 10 and failed-route list were checked
against the earlier audits. No new defect was found in the reviewed
content/occupancy theorem or in the distinction between a family theorem
and a general cubic theorem. The supplied fourth-moment files are messages
reporting numerical checks of an external derivation; this pass does not
promote 6.1.2 or its sharper .01125 cutoff. Large family certificates and
numerical searches remain inherited, with their prior evidence labels.

## 6. Integration with the later merged tilted-sector report

Master advanced during this audit to `9a93fb47264f12c74840bc671a80154abc7eca28`
(merged #408). The added `received-2026-11-15-tilted-sector/REPORT.md`,
`REVIEW_3.md` and `secant_content_proof.md` were read against STATUS 11(e).
The shifted-resolvent factors, angular norm 11/72, comparison principle with
its derivative jump, and exact coefficient (11/108)(313/500)² agree. The
central γδ estimate is uniform in energy on [.03,.0463] and in normalized
fourth cumulant; it does not imply the open comparison with D₊. The existing
independent large certificate replay is inherited, not repeated here.

Two living-summary qualifications remain necessary. The fifth-version
sentence in 11.38 says that the certified content bounds give κ=.83 “on this
family”, and 11.43 repeats that family conclusion. The deficit values in that
calculation are floating evaluations at 56 parameter pairs. The conclusion
is numerical at those sampled pairs, not a certificate for the continuum
family. Also the printed equality to 2·10⁻⁵ in 11.42 at the terminating
endpoint u=.00196979 is a rounding shorthand: the exact comparison is
126√42u³/k<2·10⁻⁵. Squaring both positive sides reduces this to rational
arithmetic. Neither qualification changes the reviewed secant or γδ theorems.

The report's .3 angular coefficient remains valid; the .298835 certificate
in §2 sharpens its scalar input. The strip theorem here concerns the raw
shared-A functional. It does not duplicate the now-completed tilted global
secant theorem, and is not a substitute for its remaining content comparison.
