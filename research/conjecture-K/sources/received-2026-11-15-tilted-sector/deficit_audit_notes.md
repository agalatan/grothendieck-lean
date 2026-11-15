<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_audit_notes.md (file dated 2026-11-15 05:39). Only this line was added. -->
# Independent audit of the remaining content–deficit step

Agent-ID: **codex-6e2b**. These notes distinguish a rigorous scalar-relaxation obstruction from a counterexample to a chaos theorem. No counterexample to the intended tensor inequality is claimed.

## Exact target and positive-part logic [P]

Write `α=3/10`, `ε=6/10⁶`, `D=B(u)−F(q)`, and suppose `C²≤H(u,δ)` is a proved content envelope. The requested statement is `C²≤αD₊+ε`.

If `H≤ε`, the statement follows immediately, including when `D<0`. If `H>ε`, a sufficient scalar-envelope condition is

\[
 \sup_{\text{admissible normalized laws}}E f(uU)
 \le B(u)-\frac{H(u,\delta)-\varepsilon}{\alpha}.
\]

An upper certificate for `F+H/α−B` therefore suffices. It proves the stronger inequality `C²≤αD+ε` on the certified box. It is legitimate to use this stronger statement as sufficient, but it must not be mistaken for an equivalence on the negative-deficit region.

The complete low-energy result is now proved separately in `deficit_moment_verify_proof.md`: every `u≤.009`, every normalized fourth cumulant `χ≤42`, and every genuine finite-dimensional remote cubic satisfies the target.

## Exact moment-only obstruction at larger energy [P+C]

The executable `deficit_audit_moments.py` and its result file certify the following limitation of the **first-three-moment relaxation combined with separate content envelopes**.

At `u=1/25`, take an abstract radial random variable with

\[
 P(U=11/12)=288/289,\qquad P(U=25)=1/289.
\]

Then `EU=1`, `EU²=3`, `EU³=329/6`, so `χ=1`, `δ=1/625`, and the inherited sixth-moment upper bound is satisfied. Assign the surrogate content squared

\[
 H=\frac{1077659}{27000000}\delta
   =\frac{1077659}{16875000000}.
\]

It respects every separately proved content upper bound available at the time of this test: `.08δ`, `3δ^(3/2)`, `.0004`, `.019321u`, and the central coefficient `1077659/27000000`. The new `.04` energy coefficient `11/300` is smaller. Replacing the surrogate by `H_new=11δ/300` still respects all these bounds and gives the strict rational margin

`3824216666921460821496223/311876473218662400000000000000 > 1.22619e−5`.

For this particular payoff enclosure, the critical coefficient `(.3D_upper+6e−6)/δ` is `4824178809524466659501259/166334119049953280000000000 < .0290029421`. This additional conclusion is an exact rational comparison of the already certified endpoints.

Fresh directed-interval evaluations of the abstract payoff, together with the inherited certified upper bound on `sup_v(B(v)−pv)`, give

\[
 D\le0.00013468235740059,
\]

and the exact rational lower margin in the saved result is

\[
 H-[.3D_++6\cdot10^{-6}]>1.74565668538\cdot10^{-5}.
\]

The script records exact rational endpoints; the decimals above are only summaries. This is an abstract radial law plus a surrogate content value. It is **not** a genuine cubic tensor, it is **not** a feasible law for the full radial Stein identity, and it is **not** a counterexample to the requested inequality. It proves that the specified separate moment and content constraints alone do not imply that inequality.

## Pointwise carré-du-champ positivity [P]

Use the normalized variables from the archived independent-sector proof:

\[
 U=|Q|^2,\quad X=\Gamma(Q,\bar Q)/3-1,\quad
 r=\Re(\Gamma(Q,Q)\bar Q^2)/(3U)
\]

on `U>0`, with `r=0` at zero. The positive semidefinite real two-component carré-du-champ matrix implies

\[
 |\Gamma(Q,Q)|\le\Gamma(Q,\bar Q),\qquad |r|\le1+X.
\]

Consequently, if a scalar discretization stores the probability, `X`-moment, and `r`-moment on a radial bin as `pⱼ,mⱼ,nⱼ`, it must impose

\[
 p_j+m_j\ge|n_j|.
\]

These are two linear inequalities and their normalization is exact.

For the archived spectral dual `G`, completing squares gives

\[
 EG=E\{\lambda(X-f_0/\lambda)^2+
 \mu(r-g_0/\mu)^2\}+\text{nonnegative budget slacks}.
\]

One exact way to exploit positivity is to subtract the weighted squared distance to the cone `a≥|r|`, with `a=1+X`. Put `p=1+f₀/λ` and `s=|g₀|/μ`. The distance is

\[
 d^2=\begin{cases}
 0,&p\ge s,\\
 \lambda p^2+\mu s^2,&\lambda p+\mu s\le0,\\
 \dfrac{\lambda\mu}{\lambda+\mu}(s-p)^2,&\text{otherwise}.
 \end{cases}
\]

Thus `E(G−d²)≥0`, and a pointwise majorant of `f(uU)+G−d²` gives a valid stronger payoff upper bound. Nonnegative multipliers of `1+X±r` provide an equivalent dual formulation. This is an analytic refinement, not a claim that the current numerical dual search closes every parameter box.

## Why finite atomic witnesses cannot satisfy the full Stein identity [P]

The full normalized radial Stein identity is

\[
 E[(U-a)f(U)]=E[U b f'(U)],\qquad
 a=1+X,\quad b=1+X+r.
\]

Suppose `U` had finitely many atoms. At any positive atom `t`, bounded smooth tests can prescribe `f(t)` and `f′(t)` independently, while vanishing near all other atoms. The value coefficient therefore forces `E[a|U=t]=t`; the derivative coefficient forces `E[b|U=t]=0`. Hence `E[r|U=t]=−t` and

\[
 E[rU]=-EU^2<0.
\]

The separate spectral budget `Er²≤(2/3)E[rU]` implies `E[rU]≥0`, a contradiction. An atom at zero does not change this argument because its contribution to `rU` is zero.

Finite atomic moment-LP witnesses can therefore obstruct a finite-test or moment-only relaxation, but cannot themselves establish infeasibility of the full scalar Stein problem. This distinction also applies to numerical scans using the archived 85 test knots.

## Correct interpolation direction [P]

For a fixed normalized law and a single chosen content branch, define

\[
 J(u)=E f(uU)-B(u)+H(u,\chi)/\alpha.
\]

An upper bound by the endpoint chord plus `KΔu²/8` requires **`J''≥−K`**. My earlier suggestion to use the χ-independent upper bound `J''≤6+H''/α` had the direction reversed and is withdrawn.

The valid inherited estimate `−3≤f''≤0`, together with `B''≤0`, gives

\[
 J''(u)\ge-3(2+\chi)+H''(u,\chi)/\alpha.
\]

Each fixed available branch `H` is convex in `u`, so `K=3(2+χ_hi)` is safe on an energy/χ rectangle. A smaller bound can subtract a proved lower bound for `H''/α`. The chosen content branch must remain valid throughout the energy cell; split at changes of the certified energy range.

At a fixed energy, a single accepted spectral dual has payoff upper bound

\[
 P_0+P_1+(2+\chi)P_2+
 (6+9\chi+C_6\chi^{3/2})P_3,\qquad P_3\ge0.
\]

Adding one fixed content branch divided by `α` remains convex in χ. Its maximum on a χ interval occurs at an endpoint. The **same dual** must be used at both χ endpoints for this inference. Different duals may be used at the two energy endpoints, because the energy interpolation applies to the actual fixed-law function `J`.

## Additional source audits

- `deficit_gaussian.py`: direct Rice formula, Bessel scaling, finite integration, and tail are correct; fresh enclosures have the proper normalization for `B=2E|L+√uW|`.
- `deficit_dual_exact.py`: current three fixed nodes at `u=.0463` pass the mathematical audit, conditional on the explicitly inherited profile caps. Whole-half-line polynomial acceptance uses exact arithmetic; optimizer values merely propose rational coefficients. The central coefficient must be restricted to `.03≤u≤.0463` when extending the script to new inputs.
- `deficit_structure_content_verify.py`: all six energy-dependent scalar barriers pass the source and proof audit. Source interpolation, affine energy dependence, endpoint comparison, the downward derivative jump, and the ordinary/absolute lower barriers match the stated constants. An independent fresh replay passed all six barriers in 10.98 seconds; its log is `deficit_audit_content_results.txt`.
