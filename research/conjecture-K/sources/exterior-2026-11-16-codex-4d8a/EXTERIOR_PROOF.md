# Unconditional exterior bound at epsilon 299/400

**Proved, with exact arithmetic certificate.** Let `P=P_{1,0}` and `Q=P_{2,1}` be the complex Gaussian Wick-chaos projections in any finite dimension. For unimodular responses `f,g`, set

\[
h=(f+g)/2,\qquad k=(f-g)/2,\qquad t=\|Ph\|_2,
\qquad V_e=\operatorname{Re}\langle f,(P-eQ)g\rangle.
\]

At the single fixed value `e=299/400`,

\[
\boxed{\quad
V_e\le\frac{713263}{1000000}<\frac{500}{701}
\quad\text{if }0\le t\le\frac{1633}{2000}
\text{ or }\frac{433}{500}\le t\le\frac{\sqrt\pi}{2}.
\quad}
\]

This is an unconditional consequence of the existing proved row inequalities and response-energy bounds specified below. It does not assume Conjecture K, (P), an odd-sector premise, a Gaussian replacement, or an independence condition on remote coefficients. It does not bound the missing central interval, so it is not a proof of the desired global Grothendieck lower bound.

## Exact inherited inputs

The 19 triples `(ell_i,beta_i,cap_i)` are frozen as exact fractions in `inherited_rows.json`, together with their source file SHA256 hashes, source commit `e9b0a458d06e67e9a1eee1168e98f34ef577b3a0`, and Lean theorem names. Hash verification pins inputs; it is not a substitute for the inherited proofs.

1. At `e0=149/200`, each row supplies one **common** cubic vector `v` with `||v||²=2` and

\[
V_{e_0}\le t^2-2\ell_i t+\frac{2\beta_i^2}{e_0}
+c_i+\frac1{10^{11}}
-e_0\left\|Qh+\frac{\beta_i}{e_0}v\right\|_2^2.\tag{1}
\]

The scalar implication is `Grothe.Lower.rowOf_of_shared` in `Grothe/Lower/Support.lean`. Its row checks are `Grothe.Lower.certRows0` through `certRows4`; the Gaussian reduction is `Grothe.LowerAnalytic.reductionHyp_of_nodeCaps` in `Grothe/LowerAnalytic/Reduction.lean`, whose node-cap premises are discharged by the existing production certificate. These are existing theorems, not recompiled by this replay. A dimension-one response can be padded with unused independent Gaussian coordinates when the Gaussian reduction is stated in dimension at least two.

2. The existing radius theorem gives

\[
\|Qk\|_2\le \rho=\frac{973612157}{10^9}.
\tag{2}
\]

The corresponding exact theorem is `Grothe.LowerAnalytic.normQk_le_rho`. The range `0<=t<=sqrt(pi)/2` is `Grothe.LowerAnalytic.tOf_le_sqrt_pi`.

3. The stronger response-energy inequality gives, independently of e,

\[
\|Qk\|_2^2\le
\frac32\left(\frac\pi4-t^2\right)+B(A-t),
\quad A=\frac{886762780}{10^9},\quad B=\frac{432306903}{10^9}.
\tag{3}
\]

This is an inherited written proof and exact certificate, not a Lean theorem claimed here. See `research/conjecture-K/sources/progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md`, and the independently re-derived Rice tangent in `sources/reaudit-2026-11-15-codex-a7c4/FOUNDATIONS.md`, section 2. The current ledger marks the response bounds P+C, independently replayed.

For clarity, (3) follows directly from the six-sector weighted Gram inequality. With unscaled energies `d_q,d_A,d_B,d_Q,d_P,d_nu` for `Qk`,

\[
d_q/2+2d_A/3+4d_B/3+d_Q+d_P+8d_\nu/7
\le\pi/4-t^2.
\]

Every nonremote weight is at least `2/3`, so the total energy is at most `3(pi/4-t²)/2+d_q/4`. The Rice tangent gives `d_q<=4B(A-t)`. This derives (3) and shows that no old-operator energy normalization is silently reused.

## Transfer to the one new operator

For these same responses, self-adjointness and orthogonality give the exact polarization identity

\[
V_e=t^2-\|Pk\|_2^2+e\|Qk\|_2^2-e\|Qh\|_2^2.
\tag{4}
\]

The production fixed-epsilon identity is `Grothe.LowerAnalytic.VOf_eq`; (4) for any real e follows by the identical two-line expansion. Put `delta=e-e0=1/400`. Then

\[
V_e-V_{e_0}=\delta(\|Qk\|_2^2-\|Qh\|_2^2).
\]

Keep the h-square in (1). With `x=Qh` and `||v||²=2`, exact square completion gives

\[
\frac{2\beta^2}{e_0}
-e_0\|x+(\beta/e_0)v\|_2^2-\delta\|x\|_2^2
=\frac{2\beta^2}{e}-e\|x+(\beta/e)v\|_2^2.
\tag{5}
\]

Combining (1), (4), and (5), and then dropping only the new nonnegative square, gives

\[
V_e\le t^2-2\ell_i t+\frac{2\beta_i^2}{e}+c_i+10^{-11}
+\delta\|Qk\|_2^2.
\tag{6}
\]

Since `delta>0`, either (2) or (3) may now upper-bound the last term. The crude row, independently from (4), is `V_e<=t²+e rho²`. Thus all rows in the replay bound the **same** operator `P-(299/400)Q`.

## Exact finite cover

The standard-library script `certify_exterior_7475.py` uses `fractions.Fraction` throughout acceptance. It reads only the adjacent `inherited_rows.json`; no checkout, SciPy, or interval library is needed. Optional `--repo PATH` verifies every source hash and each frozen rational header.

The range is partitioned into 1,773 adjacent closed cells `[j/2000,(j+1)/2000]`. Its endpoint `.8865` is strictly above `sqrt(pi)/2`, verified rationally. For each old row, the two possible branches of (6) are quadratics with leading coefficient respectively `1` and `1-3delta/2=797/800`, both positive. Their maxima on each cell are therefore at endpoints. The replay computes each branch's endpoint maximum, takes the smaller branch bound, then takes the minimum over the 19 old rows and the crude row. No numerical minimizer is used.

The pi upper bound is derived by Machin's identity

\[
\pi=16\arctan(1/5)-4\arctan(1/239)
\]

and alternating rational series: seven terms for the upper arctangent bound at `1/5`, six for the lower bound at `1/239`. Their remainders have the required signs. All denominators are positive and all subsequent comparisons are exact.

Exactly 1,674 cells are accepted. The only omitted union is `[1633/2000,433/500]`. The largest accepted rational cap is less than `713263/1000000`; the script explicitly asserts

\[
\max_{\text{accepted cells}}\mathrm{cap}
<\frac{713263}{1000000}<\frac{500}{701}.
\]

The full rational value of each accepted cap and its chosen source row is in `exterior_7475_certificate.json`. The endpoints of the omitted interval themselves are covered by the adjacent accepted cells.

Replay:

```text
python certify_exterior_7475.py
python certify_exterior_7475.py --repo /path/to/grothendieck-lean
```

This replay checks the new finite arithmetic and operator transfer consequences. It inherits the analytic production row theorems, the universal cubic radius, and the reviewed response-energy theorem explicitly listed above.
