<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_moment_verify_proof.md (file dated 2026-11-15 06:02). Only this line was added. -->
# Certified low-energy content–deficit inequality

Agent-ID: **codex-6e2b**. Status: **[P+C]**, conditional on the stated inherited mathematical moment and Bernstein-profile theorems. This certificate covers every finite tensor dimension and every genuine complex bidegree-(2,1) cubic, not just a sampled family. The complementary larger-energy region is covered by `deficit_moment_prefix_proof.md` and `deficit_dual_proof.md`.

## Statement

Let `a=699/1250`, `b=179/1250`, `L=Z(a+b|Z|²)`, and let `q` be a genuine remote Wick cubic independent of `Z`. Write

- `u=E|q|²`, `δ=E|q|⁴−2u²`, and, for `u>0`, `χ=δ/u²`;
- `F(q)=2E|L+q|` and `B(u)=2E|L+√u W|` with an independent standard complex Gaussian `W`;
- `D=B(u)−F(q)`, `D₊=max(D,0)`;
- `C=||Π₁(qh_(3/5)(|q|²))||₂`, with the content profile used in the main report.

The result is

\[
 0\le u\le\frac9{1000}\quad\Longrightarrow\quad
 \boxed{C^2\le\frac3{10}D_++\frac6{10^6}.}
\]

The zero-energy case has `q=0` almost surely and `C=0`.

## Analytic inputs [P]

For `u>0`, set `U=|q|²/u` and `x=√χ`. The inherited genuine-complex-chaos moment theorem gives

\[
 EU=1,\quad EU^2=2+x^2,\quad
 EU^3\le6+9x^2+\frac{4045313}{100000}x^3,
 \qquad 0\le x\le\sqrt{42}<\frac{13}2.
\]

Define the independent-sector profile `f(s)=2E|L+√s|`. Circular symmetry and independence give `F(q)=E f(uU)`. The inherited Bernstein-profile theorem implies `f⁽⁴⁾≤0` on `(0,∞)` and concavity on `[0,∞)`. This is the theorem and proof recorded in `research/conjecture-K/sources/audit-2026-11-15-codex-a7c4/remote_strong_PROOF.md`, §§2–3. The present checker does not claim to reprove the tensor sixth-moment theorem.

The already established content estimates used here are

\[
 C^2\le H_j(u,x),\qquad
 (H_0,H_1,H_2,H_3)=
 \left(\frac2{25}u^2x^2,\;3u^3x^3,\;\frac1{2500},\;
 \frac{19321}{10^6}u\right).
\]

Their proofs and numerical dependencies are the main report's global Hessian/resolvent, third-derivative tensor, uniform content, and profile-range certificates. No central-energy improvement is assumed here.

## Global profile caps [P+C]

For any two positive rational nodes `s₁<s₂`, let `P` be the cubic Hermite interpolant matching `f,f′` at both nodes. The Hermite remainder, including outside the interpolation interval, is

\[
 f(s)-P(s)=\frac{f^{(4)}(\xi)}{24}(s-s_1)^2(s-s_2)^2\le0.
\]

Rolle's theorem proves this formula on any positive interval containing the evaluation point and both nodes; continuity includes `s=0`. The leading cubic coefficient is nonnegative because `f'''≥0`.

`deficit_moment_verify.py` freshly recomputes `f(sᵢ),f′(sᵢ)` with the archived, audited Arb integrator `remote_stein_original/profile.py`. This integrator bisects the unique ring-crossing root, integrates on both sides using analytic hypergeometric formulas, and encloses the omitted root interval, the origin interval, and the entire tail. No stored numerical profile values are used.

The checker computes all four Hermite coefficients by interval arithmetic. It then replaces **each** coefficient by its exact outward binary upper endpoint. For every `s≥0`, all monomials are nonnegative, so the resulting rational cubic is still a global upper cap. Its cubic coefficient is checked positive. Thus, writing this rational cubic as `P(s)=ΣPⱼsʲ`,

\[
 F(q)\le P_0+P_1u+P_2u^2(2+x^2)
 +P_3u^3\left(6+9x^2+\frac{4045313}{100000}x^3\right).
 \tag{1}
\]

Floating arithmetic is used only to propose two interpolation nodes. Once rounded to exact positive rationals, their location has no role in validity. All profile integration and all final inequalities are independently certified.

## Gaussian benchmark lower chords [P+C]

`deficit_gaussian.py` freshly computes `B(u)` by the Rice formula

\[
 B(u)=\sqrt{\pi u}\int_0^\infty e^{-t-z}
 [(1+2z)I_0(z)+2zI_1(z)]\,dt,
 \quad z=\frac{t(a+bt)^2}{2u}.
\]

The scaled Bessel functions make the finite integrand analytic. Arb integrates 256 cells on `[0,64]`. The remaining nonnegative tail is at most

\[
 e^{-64}\left[2a(65)+2b(64^2+128+2)+\sqrt{\pi u}\right],
\]

by the triangle inequality and `√t≤t`, `t^(3/2)≤t²` there. At zero, `B(0)=387√π/500` is enclosed directly.

Because `B(u)=E f(uV)` with `V` exponential of mean one and `f` concave, `B` is concave. On each exact energy slab `[l,h]`, the affine interpolant of certified **lower** bounds for `B(l),B(h)` is therefore a lower bound `B_low(u)` throughout the slab. This direction uses concavity and requires no curvature allowance.

## Exact parameter cover [C]

The default invocation is

```text
python -I -B deficit_moment_verify.py --certify
```

with python-flint available. It covers `[0,9/1000]×[0,13/2]` in variables `(u,x)`, using initial energy slabs of length `1/2000`. Every subdivision is an exact rational bisection, retaining both children.

A box is accepted in one of two ways:

1. At its upper corner, one of the four nonnegative, coordinatewise increasing content bounds `Hⱼ` is at most `6/10⁶`. This proves the claim regardless of the sign of `D`.
2. For a global cubic cap, one content branch `Hⱼ`, and the slab's lower chord, every coefficient in the exact bivariate Bernstein expansion on that box is nonnegative for

\[
 \frac3{10}(B_{\rm low}(u)-\text{right side of (1)})
 +\frac6{10^6}-H_j(u,x).
\]

Every Bernstein basis function is nonnegative on the box. Hence this polynomial is nonnegative everywhere there, implying `C²≤.3D+6e−6≤.3D₊+6e−6`. In particular, the checker does not assume `D≥0`.

The full run accepts **32 boxes**, including **3 content exemptions**, after **46 visited boxes**, with maximum depth **4** and **20 fresh Hermite caps**. An additional, independent final partition check collects every energy boundary and verifies that the accepted radial intervals on each resulting vertical strip tile exactly `[0,13/2]`, with no gap or overlap. Both the origin and all shared boundaries belong to closed accepted boxes.

`deficit_moment_verify_results.txt` is the execution log. `deficit_moment_verify_witness.json` records all exact boxes, caps, benchmark lower endpoints, and SHA-256 hashes of the three numerical source files. The witness is an audit artifact; a default replay recomputes the numerical enclosures and acceptance tests rather than trusting saved results.

## Trust and scope

The arithmetic certificate trusts Python, exact `Fraction` arithmetic, python-flint/Arb, and their runtimes. This is a mathematical proof plus an interval/exact-arithmetic certificate, not a Lean kernel proof. It uses the inherited moment and Bernstein theorems and the previously certified content bounds explicitly listed above. It proves the complete energy interval `[0,.009]`; the two complementary certificates and the exact union check complete `[0,.0463]`, as recorded in `REPORT.md`.
