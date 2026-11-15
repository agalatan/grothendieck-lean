<!-- Original research note by codex-a7c4, 15 November 2026; Refs #421. -->
# A sharp lower kernel ratio and content control for a retained B tilt

Agent-ID: **codex-a7c4**. Baseline: `ff3f6203cdf251ee7bcff71d03e50c9248b0d1dc`.
**P + C, author only, pending external review** for the new proof and exact scalar checks.
The old global kernel certificate and the completed tilted-A theorem are
inherited reviewed inputs, distinguished from the new argument below. No
Lean theorem or improvement of the proved Grothendieck bound is claimed here.

There is a new global comparison for the two raw content kernels, valid at
every positive profile `a>0,b>=0`:

\[
\boxed{\quad
 \frac{k_B(0)}{k_A(0)}k_A(v)\le k_B(v)\le\frac1{\sqrt2}k_A(v)
 \quad(v\ge0).\quad}                                      \tag{1}
\]

The lower coefficient is sharp because equality holds at zero. At the peak
it exceeds `.5053`. With the already certified upper error `.007`, the
one-sided comparison halves the projected alignment error for cubics:

\[
\boxed{\|c_B(q)-.5053c_A(q)\|_2\le .0035\sqrt{u}.}           \tag{2}
\]

More generally (2) needs only `q` in remote `L²` and `Π₁q=0`, with no energy
or dimension cutoff. That orthogonality is essential to the new centering
step; the older `.007` estimate covered arbitrary remote `L²`.

The completed tilted-A content theorem now gives a complete content bound
for the corresponding **tilted B coefficient** at the peak:

\[
\boxed{\|c_{B,\,15159/50000}(q)\|_2^2
 \le\tfrac1{10}D_+(q)+\frac{443}{10^8},
 \qquad 0\le u\le\tfrac{463}{10000}.}                       \tag{3}
\]

This controls actual first-order content in every finite-dimensional cubic
tensor. It does not provide the finite-amplitude cost of that tilted B
sector or the joint A/B cost. Three conditional raw joint budgets also
improve, as specified in section 5.

## 1. Definitions and inherited inputs

Let `T=|Z|²` for a standard complex Gaussian `Z`, and put

\[
 A(t)=a+bt,\quad J(t)=a+3bt,\quad H(t)=tA(t)^2,\quad L=ZA(T).
\]

Write `t=H^{-1}(x)`. The functions used in the previously proved positive
Laplace representations are

\[
 f_A(H(t))=\frac{e^{-t}}{A(t)^2},\qquad
 f_B(H(t))=\frac{e^{-t}}{A(t)^3J(t)}.
\]

The A and B content conventions are

\[
 F_A(z)=\mathbb E[(T-1)\operatorname{ph}(L+z)]=-z k_A(|z|^2),
\]
\[
 F_B(z)=\mathbb E[(Z^2/\sqrt2)\overline{\operatorname{ph}(L+z)}]
       =-z k_B(|z|^2),\qquad c_i(q)=\Pi_1F_i(q).
\]

Both `f_i` and `k_i` are completely monotone, with finite endpoint values;
the complete positive recurrence and transformations are in the reviewed
`../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md`, sections 1–4.
In its notation, `f_i(x)=∫e^{-λx}μ_i(dλ)` and

\[
 k_A(v)=\frac{\sqrt\pi}{2}\int\lambda^{-1/2}
            \mathbb E_\theta[\omega e^{-\lambda v\omega}]\mu_A(d\lambda),
\]
\[
 k_B(v)=\frac{\sqrt\pi}{2\sqrt2}\int\lambda^{-3/2}
            \mathbb E_\theta[\omega e^{-\lambda v\omega}]\mu_B(d\lambda),
 \qquad \omega=\cos^2\theta.                               \tag{4}
\]

These integrals and their endpoint moments converge. At the peak
`a=699/1250,b=179/1250`, the inherited global certificate states

\[
 |k_B(v)-\rho k_A(v)|<\tfrac7{1000},\qquad
 \rho=\tfrac{5053}{10000},\quad v\ge0.                     \tag{5}
\]

It is `ALIGNMENT.md` and `kernel_alignment.py` in that third-audit folder,
re-derived/replayed by the external reviewer on PR #403. Nothing below
infers (5) from a finite sample or from complete monotonicity alone.

## 2. Positive Abel transforms prove the new sharp lower ratio

Set `F(x)=∫_x^∞f_B(y)dy`. Changing variables `y=H(t)` gives

\[
 F(H(t))=\int_t^\infty\frac{e^{-r}}{A(r)^2}\,dr,
\]

and therefore

\[
 Q(H(t)):=\frac{F(H(t))}{f_A(H(t))}
   =\int_0^\infty e^{-r}
        \left(\frac{A(t)}{A(t)+br}\right)^2dr.               \tag{6}
\]

Thus `0<Q<=1` and `Q` is nondecreasing, since `H` and `A` increase and each
integrand increases with `A(t)`. This also covers `b=0`, when `Q=1`.

The function `f_A` is log-convex. In fact direct differentiation gives

\[
 -\frac{d}{dx}\log f_A(x)\Big|_{x=H(t)}
   =\frac{1+2b/A(t)}{A(t)J(t)}.                            \tag{7}
\]

The right side is nonincreasing in `t`: its nonnegative numerator is
nonincreasing and its positive denominator nondecreasing. Since `H` is
increasing, `(log f_A)'` is nondecreasing in `x`, as required. This is an
explicit proof of the needed log-convexity, not an extra assumption.

For `x>=0` define the positive, finite Abel transforms

\[
 U(x)=\int_0^\infty z^{-1/2}f_A(x+z)\,dz,\qquad
 V(x)=\int_0^\infty z^{-1/2}F(x+z)\,dz.                    \tag{8}
\]

They converge by the endpoint bounds and the stretched exponential tails;
also `0<V<=U`. We claim that `V/U` is nondecreasing. Normalize
`z^{-1/2}f_A(x+z)dz` to a probability measure `P_x`. For `h>=0`, the
density ratio, apart from normalization, is

\[
 r(z)=f_A(x+h+z)/f_A(x+z).
\]

It is nondecreasing in `z`, by (7), and bounded by one. Both `r(z)` and
`Q(x+z)` are nondecreasing, so their covariance under `P_x` is nonnegative.
Explicitly this follows by integrating
`(r(z)-r(w))(Q(x+z)-Q(x+w))>=0` against `P_x(dz)P_x(dw)`.
Together with the increase of `Q`, this proves

\[
 \frac{V(x+h)}{U(x+h)}
   =\mathbb E_{P_{x+h}}Q(x+h+z)
   \ge\mathbb E_{P_{x+h}}Q(x+z)
   \ge\mathbb E_{P_x}Q(x+z)=\frac{V(x)}{U(x)}.              \tag{9}
\]

Finally Tonelli and `∫_0^∞z^{-1/2}e^{-λz}dz=√π/√λ` transform (4) into

\[
 k_A(v)=\tfrac12\mathbb E_\theta[\omega U(v\omega)],\qquad
 k_B(v)=\tfrac1{2\sqrt2}\mathbb E_\theta[\omega V(v\omega)].\tag{10}
\]

Indeed `F` has Laplace measure `λ^{-1}μ_B`; positivity justifies every
exchange. By (9), `V(x)>=V(0)U(x)/U(0)`. Insert this into (10). Since
`Eω=1/2`, its constant is exactly `k_B(0)/k_A(0)`. The upper bound follows
from `V<=U`. This proves (1) on the entire half-line. We do **not** claim
that the ratio `k_B(v)/k_A(v)` itself is monotone; the argument only needs
the intermediate ratio `V/U` to be monotone.

## 3. Centering halves the projected alignment error

At the peak the new exact scalar checker encloses

\[
 .505340604634927485
   <k_B(0)/k_A(0)<.505340604634927486.
\]

Thus (1) and (5) imply `0<=R(v)<.007` for
`R=k_B-ρk_A`. If `Π₁q=0`, then

\[
 c_B-\rho c_A=-\Pi_1[qR(|q|^2)]
 =-\Pi_1[q(R(|q|^2)-7/2000)].
\]

Orthogonal projection contracts in `L²`, proving (2). The same observation
gives `||c_A||<=k_A(0)√u/2` from `0<=k_A(v)<=k_A(0)`. These are norm
inequalities; neither asserts positivity of the pairing of two projected
content vectors, which would require a different argument.

## 4. Transfer to a retained B coefficient

Write `F_0(z)=E ph(L+z)` and `c_0(q)=Π₁F_0(q)`. All shift coefficients
`s,t` in this section are real. The actual linear
coefficient for an A-sector shifted by `s r_A` is `c_{A,s}=c_A+s c_0`.
For a B-sector shifted by `t r_B` it is `c_{B,t}=c_B+t c_0`; the B pairing
uses `conj(r_B)` as in the definition above. Hence for every real `s`

\[
 c_{B,\rho s}=\rho c_{A,s}+e(q),\qquad
 \|e(q)\|_2\le\tfrac7{2000}\sqrt u.                       \tag{11}
\]

In a retained trial one may take `v=-s r_A-ρs r_B`; its first-chaos penalty
is `||s r_A+ρs r_B||²`. Formula (11) does not discard this penalty or
claim any cost matrix after subtracting it.

Use the completed sixth tilted-sector delivery, at `s=3/5`:

\[
 \|c_{A,3/5}(q)\|^2\le\alpha D_+(q)+\eta,
 \quad \alpha=3/10,\quad\eta=3/500000,
 \quad u\le463/10000.                                    \tag{12}
\]

This is an inherited theorem for every finite-dimensional `H_(2,1)`
cubic, not a new assumption about tensor shape. Here the matched-variance
Gaussian benchmark is `B(u)=2E|L+sqrt(u)W|`, with `W` a standard complex
Gaussian independent of `L`. Set `D=B(u)-2E|L+q|` and `D_+=max(D,0)`.
Equations (11)–(12) give the sharper unexpanded inequality

\[
 \|c_{B,\rho s}\|
 \le\rho\sqrt{\alpha D_++\eta}+e_*,\qquad
 e_*^2=(7/2000)^2(463/10000).                              \tag{13}
\]

For any `γ>ρ²α`, putting `x=√(αD_++η)` and completing the square gives

\[
 (\rho x+e_*)^2-\gamma D_+
 \le\frac{\gamma\eta}{\alpha}
       +\frac{\gamma e_*^2}{\gamma-\rho^2\alpha}.          \tag{14}
\]

With `γ=1/10`, the exact right side is
`51760323/11700786500000 <443/10^8`, proving (3). Neither (13) nor (14)
replaces `D_+` by the signed `D`. The shift is exactly
`ρs=15159/50000=.30318`.

## 5. Improved conditional raw joint budgets

These are explicit **conditional** corollaries: the corresponding joint
finite-amplitude cost and raw A-content premise remain open. A quadratic
cost controls the optimized joint gain through its inverse matrix; the
new alignment alone does not prove such a cost.

Take the favorable signed matrix
`K=[[.24,.118],[.118,.26]]` and assume `||c_A||²<=.24D`.
Square completion bounds the excess over `B(u)-pu` by

\[
 \frac{\|c_A\|^2}{.24}-D
 +\frac{\|c_B-(.118/.24)c_A\|^2}{.26-.118^2/.24}.           \tag{15}
\]

The first terms are nonpositive. Put `τ=.118/.24<ρ`. By (1), (5), and
`k_A(v)<=k_A(0)<.83514`,

\[
 0\le k_B(v)-\tau k_A(v)
 < .007+(\rho-\tau)(.83514)=\frac{9192871}{500000000}.
\]

Center this entire kernel, use `Π₁q=0`, and insert `u<=.0463` into (15).
The resulting excess is strictly less than

\[
 \frac{117382830462248349}{6059500000000000000000}
 < .000019372.                                            \tag{16}
\]

This replaces the previous `.000051525` sufficient error under the same
joint and content hypotheses. It avoids separately bounding the raw
content norm when estimating the residual kernel.

For completeness the same half-sized error in (2) divides by four the
previous quadratic residual budgets for the other two cost forms:

| joint cost hypothesis | raw content premise | new excess upper bound |
|---|---|---|
| `K=diag(.24,.26)` | `||c_A||²<=.15D` | `.000003593` |
| `K=[[.24,-.118],[-.118,.26]]` | `||c_A||²<=.10D` | `.000017953` |

The adverse row also bounds a cost whose mixed term is only known in
absolute value, by Cauchy–Schwarz. To verify both entries directly, set
`M=K^{-1}`, `v=(1,ρ)`, `A=vᵀMv`, `B=|vᵀMe_2|`, `C=e_2ᵀMe_2`.
If `||c_A||²<=γD` and `1/γ>A`, completion of the square in `||c_A||`
gives excess at most `e_*²[C+B²/(1/γ-A)]`. This calculation retains
arbitrary relative phases and does not assume aligned content vectors.

## 6. Reproduction and exact scope

Run the new standard-library check from the repository root:

```sh
python3 -I research/conjecture-K/code/progress-2026-11-15-codex-a7c4/joint_content_exact.py
```

It recomputes the endpoint moments with the existing outward 220-bit
rational interval implementation, using exact exponential/erf series.
For `J_n=∫_0^∞t^{n-1/2}e^{-t}/(a+bt)dt`, the endpoint formulas are
`k_A(0)=(J_0-J_1)/2` and `k_B(0)=J_1/(2√2)`.
It checks their ratio, the raw endpoint upper bound, all new rational
budgets, and positive definiteness. It rejects `-O`. The adjacent
`joint_content_exact_result.json` records its output.

This new short check does not replay the inherited scalar-function cover
or the large tilted-sector package. The former's separate command is

```sh
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/kernel_alignment.py
```

with `--dependency-dir` if required for an existing python-flint install.
The latter's audited proof/checker boundary is recorded in
`../received-2026-11-15-tilted-sector/REVIEW_4.md` and `REPORT.md`; its
completed content-versus-deficit theorem, rather than an older intermediate
open statement in that package, is the input (12).

New completed work: the analytic comparison (1), centered alignment (2),
dimension-free tilted B-content bound (3), and the exact **conditional**
budget improvements (16) and the table. Still open: a sufficient global
finite-amplitude joint A/B cost, odd-sector assembly over a nonzero even
core, and the remaining requirements of Conjecture K. Numerical local
cost matrices cannot be substituted for those global obligations.

The session's odd-sector worker independently re-derived the Abel
likelihood-ratio and covariance argument, the projection centering, and
the signed/adverse budget phase handling. Its real-shift qualification is
included above. This is a within-session peer review, not external review.
