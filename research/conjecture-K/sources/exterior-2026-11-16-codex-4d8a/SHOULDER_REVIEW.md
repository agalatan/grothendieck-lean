# Independent review of the shoulder benchmark certificate

**Verdict: PASS for the four Gaussian benchmark upper bounds and exact conditional consumer budgets. No all-sector inequality, and no new unconditional Grothendieck lower bound, is established.**

Reviewed source snapshots:

- `existing-program/certify_shoulders.py`, SHA-256 `cca846df91bf3552c469713ad9789736f4e969d8c84aa7c6f63591c88492fe75`.
- `existing-program/REPORT.md`, SHA-256 `9bdebccbd5eae8fea0e5b64672cf13bf1558bd433fc4fef11fe1294955f58a5b`.

I ran the production verifier successfully with python-flint0.9.0 at its specified100-bit precision. I also wrote and ran `replay_shoulders_direct.py`: an independent direct Rice-integrand implementation, with no integration by parts, at140-bit precision, integrating160 panels of width1/2 on `[0,80]`, instead of256 panels of width1/4 on `[0,64]`. All four direct enclosures overlap the production enclosures. The independent script also checks all eight outward rational energy-cap roundings printed in the report. Its output is `shoulder_direct_replay.json`.

## 1. Normalizations and Rice formulas

Let `T=|Z|²~Exp(1)`, `r(t)=sqrt(t)(a+bt)`, `x(t)=r(t)²/v`, and `I_ne(s)=exp(−s)I_n(s)`. For standard complex `W` with `E|W|²=1`, the conditional Rice mean is

`2 E_W |r+sqrt(v)W| = sqrt(πv)[(1+x)I_0e(x/2)+xI_1e(x/2)]`.

Its variance derivative is

`d/dv [2E_W|r+sqrt(v)W|] = sqrt(π)/(2sqrt(v)) I_0e(x/2)`.

Thus both formulas in the production code have the correct factors of2 and correct convention for a standard complex Gaussian. The four pairs have `a=ell−2beta>0`, `b=beta>0`, and all bracket endpoints have`v>0`.

The integer-order scaled Bessel convention in Acb is`exp(−z)I_n(z)`, an entire function of`z`, not the nonanalytic numerical convention`exp(−|Re z|)I_n(z)`. The direct replay was also checked against unscaled evaluations times`exp(−z)` at complex arguments. No branch-cut restriction is hidden in the integer-order Bessel calls.

## 2. Integration by parts and the finite endpoint

Since

`x'(t)=(a+bt)(a+3bt)/v`,

put

`h(t)=2x/x'=2t(a+bt)/(a+3bt)`.

Then exactly

`h'(t)=2(a²+2abt+3b²t²)/(a+3bt)²`,

which matches `dh` in the source. The scaled Bessel derivative gives

`x I_1e(x/2)=x I_0e(x/2)+h(t) d/dt I_0e(x/2)`.

Consequently, for every finite`T0>0`,

`∫_0^T0 e^(−t)[(1+x)I_0e+xI_1e]dt`

`= ∫_0^T0 e^(−t)[1+2x+h−h']I_0e dt + e^(−T0)h(T0)I_0e(x(T0)/2)`.

The lower endpoint vanishes because`h(0)=0`. The upper endpoint has a **plus** sign and is explicitly restored by the code at`T0=64`. Omitting this endpoint would undercount the finite Rice integral; the submitted source does not omit it.

The modified integrand is meromorphic in the complex integration variable (the rational`h,h'` have a pole at the negative real point`−a/(3b)`). Ignoring Acb's analytic flag is permitted for this meromorphic expression: a ball encountering the pole gives a nonfinite enclosure. The function need not be entire for this callback to be valid. All integration endpoints are exact dyadic numbers.

## 3. Tail bounds

The tail added after integration by parts is a bound on the **original Rice integral** on`[64,∞)`, not on the transformed expression. This is correct because the finite endpoint has already restored equality with the original integral on`[0,64]`.

Triangle inequality gives

`2E|r(t)+sqrt(v)W| ≤2sqrt(t)(a+bt)+sqrt(πv)`.

For`t≥64`, `sqrt(t)≤t` and`t^(3/2)≤t²`. Therefore the omitted nonnegative contribution is at most

`exp(−64)[130a+2b(64²+128+2)+sqrt(πv)]`.

These coefficients use the exact integrals`∫_64∞t e^(−t)dt=65e^(−64)` and`∫_64∞t²e^(−t)dt=(64²+128+2)e^(−64)`. This matches the source.

The derivative integral has nonnegative tail bounded by

`sqrt(π)/(2sqrt(v)) exp(−64)`

because`0<I_0e(s)≤1` for real`s≥0`. The subtraction`−v/e` or`−1/e` is global and has no tail. Adding a ball centered at half the computed tail bound, with radius half that ball's upper radius argument, safely encloses every tail in`[0,tail.upper()]`; possible tiny outward extension below0 is harmless.

The independent `[0,80]` direct replay gives midpoint enclosures:

| Row | Direct midpoint Rice objective |
|---|---|
| 1 | `1.3300016092617117266279427660 +/- 5.47e-29` |
| 2 | `1.3583096100814315650744265396 +/- 4.37e-29` |
| 3 | `1.3923310693255570326048740246 +/- 1.60e-29` |
| 4 | `1.4080313531571769537117506391 +/- 5.64e-29` |

The independent tail bounds are below`3.71e-32`. These are midpoint values`J(v_m)`, not the global maxima by themselves.

## 4. Global concavity and maximizing brackets

The density of`X=Z(a+b|Z|²)` at planar radius`r`, where`r²=t(a+bt)²`, is

`f_X(r)=exp(−t)/[π(a+bt)(a+3bt)]`.

Because`a,b>0`, the radius map is strictly increasing and the displayed density is radial decreasing. Its density after adding`sqrt(v)W` remains radial decreasing: convolution preserves this property, by layer-cake decomposition into disks and the fact that disk intersection area is decreasing in center separation.

For`v>0`, the heat identity with generator`Δ/4` gives

`J'(v)= (1/2) E |X+sqrt(v)W|^(−1) −1/e`.

There is no missing delta mass in`Δ|x|=1/|x|` in two dimensions. The singularity`1/|x|` is locally integrable. One rigorous justification of monotonicity is to truncate this kernel by`min(N,1/|x|)`: its superlevel sets are disks. Its convolution with a radial decreasing density is maximal at the origin. An additional centered Gaussian convolution therefore decreases the value at the origin. Monotone convergence in`N` then proves that`J'(v)` is nonincreasing. Thus`J` is concave on`(0,∞)` and continuously extends to`v=0`.

The certified strict derivative signs at the supplied left and right endpoints hence bracket every global maximizing variance. The supremum is finite and attained: `J(v)≤2E|X|+sqrt(πv)−v/e→−∞`.

Concavity gives, for any maximizer`v*` in the bracket,

`J(v*)≤J(v_m)+J'(v_m)(v*−v_m)≤J(v_m)+|J'(v_m)|(v_r−v_l)`.

The final width is deliberately conservative; half the width would also work. Interval evaluation of the absolute derivative preserves validity. The accepted global upper endpoints`1.330001610`, `1.358309611`, `1.392331071`, `1.408031355` are all certified by this argument.

## 5. Exact consumer arithmetic and remaining dependencies

For each row, `t²−2ell*t+2beta²/e` is convex in`t`; its maximum on the closed interval is exactly the larger endpoint value. All endpoint inputs, errors and accepted`S` bounds are rational. The production assertions verify`requested error <500/701−endpoint envelope−S_upper` exactly.

The inherited caps decrease in`t` on the positive intervals used, so evaluating at the left endpoint is sufficient. The independent replay verifies that each printed rational energy cap strictly exceeds its interval enclosure. The two inherited Rice-tangent constants were checked against the repository's cited NOTES §3, but their original upstream proof was not independently rerun in this review.

The report correctly retains the weighted six-sector constraint and arbitrary sharing of remote coefficients. The requested premise is about the **full retained support quantity**`LambdaHat`, not just a remote Gaussian component. Nothing in this certificate proves that premise.

## 6. Minor presentation observations

- The JSON field`S_lower_interval` encloses`J(v_m)`; its lower endpoint is a lower bound for`S`, but the entire ball is not an enclosure of`S`. The report's prose treats it correctly.
- The `eta_max_decimal` float is descriptive only; acceptance uses`Fraction` arithmetic, so it creates no certification gap.
- This review audits the new benchmark/budget calculation. It does not independently certify the report's upstream Lean status, model ceilings, response-penalty theorem, or source theorem linking the retained row to the operator norm.

No blocking issue was found in the scope reviewed.
