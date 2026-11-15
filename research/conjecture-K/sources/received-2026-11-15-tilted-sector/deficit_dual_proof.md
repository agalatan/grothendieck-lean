<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_proof.md (file dated 2026-11-15 05:52). Only this line was added. -->
# Spectral-dual certificates for content versus the actual deficit

Agent-ID: **codex-6e2b**, 15 November 2026.

**Status: P+C, full stated rectangle passed.** The analytic implications
below are **P**, using the inherited complex-cubic moment and Stein
theorems identified in the archived remote proof. The fresh default run of
`deficit_dual_cover_verify.py` accepted all **119** proposed rational duals
and certified **106** boxes, with **zero uncovered boxes**, covering
`2/125 <= u <= 463/10000` and `0 <= chi <= 42`. It regenerated the base and
extended profile caps and all Gaussian benchmark integrals in **65.69 s**.
The source implementation has also passed independent audit. The exact
polynomial and outward Arb interval acceptance is **C**. Numerical
candidate searches are **N** and are never used for acceptance. Subject
to the stated mathematical/content dependencies, this proves throughout
that rectangle

\[
\|c_{3/5}(q)\|^2\le\frac3{10}\max(D(q),0)+6\cdot10^{-6}.
\tag{1}
\]

The archive is read only. All new files are in the requested handoff
folder and have the prefix `deficit_dual`. A separate moment certificate
covers the lower energies; the precise union is checked separately.

## 1. Exact scalar reduction and mathematical dependencies

For nonzero energy `u`, write `Q=q/sqrt(u)`, `U=|Q|²`, and
`chi=E U²-2`. The supplied complex bidegree `(2,1)` chaos theorems give

\[
EU=1,\quad 0\le\chi\le42,\quad
EU^3\le6+9\chi+\frac{4045313}{100000}\chi^{3/2}.
\]

The radial Stein variables `X,r` satisfy

\[
EX=0,\quad 2P+R=\chi,\quad EX^2\le2P/3,
\quad Er^2\le2R/3,\quad R\le\chi/3,
\]

where `P=E UX`, `R=E Ur`. For the piecewise-affine tests below,
`E[Phi(U)-phi(U)]=E[X phi(U)+r d(U)]`, with
`Phi(x)=integral_0^x phi` and `d(x)=phi(x)-Phi(x)/x`.
These are precisely the inputs re-derived and source-audited in
`research/conjecture-K/sources/audit-2026-11-15-codex-a7c4/remote_strong_PROOF.md`
and `REMOTE.md`. No theorem for arbitrary pairs of real cubic chaoses is
being substituted for the intended complex bidegree theorem.

Put `h(s)=2E_Z|L+sqrt(s)|`. Then
`F(q)=E h(uU)` and `B(u)=E h(uE)`, with `E~Exp(1)`. The inherited
Bernstein-profile argument proves `h''''<=0` and

\[
-3<h''(s)\le0\qquad(s\ge0).
\tag{2}
\]

The scalar content bounds used in a box are explicit dependencies from
the accompanying content certificates:

\[
C^2\le\min\{\gamma u^2\chi,\ 3u^3\chi^{3/2},\ 1/2500,
 (19321/10^6)u\},\quad C=\|c_{3/5}(q)\|.
\tag{3}
\]

A valid coefficient `gamma` is selected at the lower energy endpoint:

| lower energy threshold | coefficient |
|---|---|
| `9/1000` | `251/5000` |
| `3/250` | `121/2500` |
| `3/200` | `467/10000` |
| `9/500` | `451/10000` |
| `1/50` | `441/10000` |
| `1/40` | `1859/43200` |
| `3/100` | `3/80` |
| `7/200` | `71/2000` |
| `1/25` | `17/500` |
| `11/250` | `13/400` |

Every coefficient is used only through the upper energy `463/10000`.
Energy cells are split at these thresholds. The generalized moment
certificate in the separate lane covers the lower-energy region; it is
not inferred from the dual boxes in this note.

## 2. A rational spectral cut on the entire half-line

For positive `lambda,mu`, nonnegative `nu`, real `t,beta`, and a continuous
piecewise-affine `phi` constant after its last knot, set

\[
f_0(x)=-(\phi(x)+\beta)/2+(2t+\lambda/3)x,
\qquad
g_0(x)=-d(x)/2+(t+\mu/3-\nu/2)x,
\]

\[
G(x)=f_0(x)^2/\lambda+g_0(x)^2/\mu
 +\Phi(x)-\phi(x)+(\nu/3-2t)(x^2-2).
\]

Expanding squares and applying the preceding identities gives

\[
EG(U)=E[\lambda(X-f_0(U)/\lambda)^2+
          \mu(r-g_0(U)/\mu)^2]
 +\lambda(2P/3-EX^2)+\mu(2R/3-Er^2)+\nu(\chi/3-R)\ge0.
\tag{4}
\]

Suppose a rational cubic `P(x)=P0+P1 x+P2 x²+P3 x³`, `P3>=0`, satisfies
`P(x)>=h(ux)+G(x)` for every `x>=0`. Then

\[
F(q)\le P_0+P_1+(2+\chi)P_2+
 (6+9\chi+C_6\chi^{3/2})P_3=:F_P(u,\chi).
\tag{5}
\]

The SOCP only proposes the rational coefficients. The verifier reconstructs
`Phi` by integrating `phi`, multiplies the profile-majorant inequality by
`x²`, and checks the resulting polynomial on every merged profile/test
interval using rational Bernstein coefficients and exhaustive subdivision.
At zero its exact `x²` factor is cancelled. The infinite tail starts at a
power of two strictly exceeding every test knot and `64/u`; expansion in
powers of `x-tail` with nonnegative coefficients covers the entire ray.
The old archive's fixed tail point `128` is not reused when it is too small.

A small rational increase of `P0` repairs candidate roundoff or unsampled
narrow minima only when the complete polynomial acceptance succeeds.
No claimed numerical optimizer value enters (5).

## 3. Fresh scalar profile caps and the Gaussian benchmark

The default continuum verifier freshly replays the original 68 profile
caps on `[0,2]`, using the archived `verify.profile_caps` function with an
explicitly resolved sibling `profile` module. It also regenerates ten
additional Hermite caps on `[2,64]` and the tangent cap beyond 64 through
`deficit_dual_profile_caps.py`. Its nodes are
`2,3,4,6,8,12,16,24,32,48,64`.

If `H` interpolates `h,h'` at two positive nodes, (2)'s fourth-derivative
sign gives `h(s)<=H(s)` for every `s>=0`, including outside the interpolation
interval. Each polynomial coefficient is rounded strictly upward by Arb
bounds, preserving this global inequality. The tangent tail follows from
concavity. The old tangent at `s=2` was valid but too loose for the rare
large-radius mass in the new augmented problem; the additional caps remove
that avoidable loss.

At every energy node, `deficit_dual_exact.gaussian_B` freshly integrates the
one-dimensional Rice/Bessel formula, using exactly the integration-by-parts
identity and finite-endpoint correction from the archived Gaussian
benchmark checker. The integration range `[0,64]` and its explicit positive
exponential tail are both included. The lower endpoint of the resulting
Arb ball is used for the deficit. Saved Gaussian values are not trusted.

## 4. Continuum boxes and the interpolation direction

Fix an energy slab `[ul,uh]`, a kurtosis interval `[cl,ch]`, and ONE of the
four content branches `H` in (3), valid throughout the slab. At each energy
endpoint choose ONE accepted dual polynomial covering BOTH kurtosis
endpoints. The two energy endpoints may use different dual polynomials.

For fixed energy, (5) plus `H/(3/10)` is affine in `chi` plus a nonnegative
multiple of `chi^(3/2)`. It is convex. Thus the lower budget

\[
Q_P(u,\chi)=\frac3{10}[B(u)-F_P(u,\chi)]
 +6\cdot10^{-6}-H(u,\chi)
\]

is concave in `chi`, and its minimum on `[cl,ch]` is at an endpoint.
This is why the SAME polynomial and SAME content branch must be used at
both kurtosis endpoints of that energy node.

Now fix an actual normalized law `U` with its particular `chi` in that
interval, and define

\[
Q(u)=\frac3{10}[B(u)-E h(uU)]+6\cdot10^{-6}-H(u,\chi).
\]

Every chosen branch `H` is convex in energy. By (2), differentiation under
the expectation, and `EU²=2+chi`,

\[
Q''(u)\le\frac9{10}(2+\chi)\le\frac9{10}(2+c_h).
\]

Therefore its endpoint chord gives the lower bound

\[
Q(u)\ge\min\{Q(u_l),Q(u_h)\}
 -\frac{9(2+c_h)}{80}(u_h-u_l)^2.
\tag{6}
\]

This is an UPPER second-derivative bound used for a LOWER chord estimate.
Equivalently, an upper bound on `E h-B+H/(3/10)` requires a LOWER
second-derivative bound. These directions must not be reversed.

Four rigorous corner budgets exceeding the exact rational allowance in
(6) imply `C² <= H <= (3/10)D + 6e-6` on the whole box. Since
`D <= D_+=max(D,0)`, this proves (1) regardless of the sign of `D`.
Alternatively, if a valid branch has
`H(uh,ch)<=6e-6`, the box is exempt: `C²<=6e-6` already proves (1), with no
assumption on the sign of `D`.

The checker reconstructs the accepted energy slabs and bisects kurtosis
intervals until they pass or are explicitly recorded as uncovered. It
checks adjacent endpoints and coverage of `[0,42]` in every slab, counting
accepted and uncovered intervals separately. An overall success requires
zero uncovered boxes. A separate union checker may combine these accepted
boxes with the independently proved moment boxes, transforming `x=sqrt(chi)`
intervals by exact squaring.

## 5. Reproduction and scope of outputs

With python-flint available:

```
python3 -I -B deficit_dual_cover_verify.py
```

This replays all base and extended profile integrals, all rational global
dual inequalities, all Gaussian benchmark integrals, and the box budgets.
`--skip-base-profile-replay` is explicitly conditional on the base caps
already having been replayed in the same verification chain.

The entry point imports `deficit_dual_exact.py` and
`deficit_dual_profile_caps.py`; its sole candidate input is
`deficit_dual_cover_candidates.json`. It also reads the explicitly named
archived proof-checking helpers and base-cap proposal file. Those saved
base coefficients are accepted only after their source integrals have
been replayed. The added caps and benchmark values are recomputed afresh.

`deficit_dual_cover_witness.json` records the 119 accepted rational models,
106 accepted boxes, the empty uncovered list, and `passed: true`.
`deficit_dual_cover_results.txt` records the successful default replay.
The witness is a result of acceptance, not a replacement for replaying
the checker. `deficit_dual_cover_extra.json` and the other candidate-search
outputs are unused numerical exploration. The candidate searches and
their sampled margins remain N even when some proposed coefficients
subsequently pass the exact checker. No claim about the Grothendieck
constant follows from these files alone.
