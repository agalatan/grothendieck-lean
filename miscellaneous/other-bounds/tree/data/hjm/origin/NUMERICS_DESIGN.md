# Origin coefficient and energy certification design

Agent-ID: codex-aa04. Scope: issues142/143 under epic139. This document
separates exact algebra, generic analytic identities, imported interval data,
and the numerical theorems still needed. No numerical endpoint follows merely
from the contents of this directory.

## What is already exact, and what has a closed form

1. The polynomial coefficients, Cayley parameters, unit-circle factors,
   degree10 LEFT/RIGHT polynomials, and endpoint cancellation use only rational
   arithmetic. No quadrature is involved. The new nonvanishing certificate
   proves the stronger squared-norm margin37/100 using nine intervals and a
   positive-coefficient infinite suffix.
2. Associated Laguerre polynomials have exact integer/rational coefficients.
   Full-line moments of the constant phase reduce to Gamma half-integer
   moments: `integral_0^infinity exp(-s)*s^(k+1/2) ds = Gamma(k+3/2)`.
   Consequently the constant-phase coefficient is
   `q_n=(-1)^n*sqrt(h_n)`, with `h_0=pi/4` and
   `h_(n+1)/h_n=(2n+1)^2/[4(n+1)(n+2)]`.
   `OriginRadial` derives the radial polynomial and its ODE from Hermite
   creation operators. `OriginRadialEnergy` proves the exact squared-radius
   substitution and normalized Green-to-coefficient identity. The displayed
   constant-phase closed form still needs its separate evaluation; it is not
   supplied by an imported numerical table.
3. The L2 mass of a unit radial response omitted after R is `exp(-R)`;
   Bessel bounds the joint coefficient l2 error by `exp(-R/2)`. Hence the
   `[25,36]` extension changes the analytic norm error from `exp(-25/2)` to
   `exp(-18)`. This is one joint error, not120 independent errors.
4. Once derivative bounds are available, the near-origin energy estimate is
   elementary and the far-energy estimate integrates a quadratic against
   `exp(-s)` in closed form, as detailed below.
5. The actual finite coefficient and middle-energy integrands contain
   nonconstant polynomial phases `Q/sqrt(Re(Q)^2+Im(Q)^2)`. No useful closed
   form is supplied by the upstream proof. These portions need certified
   numerical integration or an independently proved approximation with a
   complete remainder bound.

## Exact derivative bounds without complex root isolation

For the base P write `R=Re(P)`, `I=Im(P)`, `q=R^2+I^2`, and
`c=R*I'-I*R'`. Where q>0,

```
theta'  = c/q,
theta'' = (c'*q-c*q')/q^2.
```

A lightweight exact polynomial probe has found positive Bernstein
coefficients for all four polynomials

```
12*q-c, 12*q+c, 30*q^2-(c'*q-c*q'), 30*q^2+(c'*q-c*q')
```

on the same seven panels `[0,4],[4,8],[8,16],[16,24],[24,28],[28,30],[30,32]`,
and positive shifted power coefficients beyond32. The first two have degree18,
the second two degree36. This supplies an elementary certificate route for
`|theta'|<12`, `|theta''|<30` on the radial half-line and eliminates the
upstream Rouché/root-counting dependency. Its exact polynomial coefficients, seven-panel Bernstein coefficients, and
positive shifted suffixes are now reproduced by the pinned importer in
`phase-derivative-certificate.json`. Every Bernstein/power identity and reverse
shift is checked by exact arithmetic. It is not a delivered Lean theorem; the
original lightweight discovery script and receipt remain under
`handoff/hjm-origin-codex-aa04/phase_derivative_probe.py` and
`phase-derivative-probe.json`.

For either extra linear factor `s+delta*U`, U=A or B, the root stays distance
`d=delta*|Im U|>0` from the real line. Thus the complete phase v satisfies

```
M1 = 12 + 1/d,
Mtheta2 = 30 + 1/d^2,
|v'| <= M1,   |v''| <= M2 = Mtheta2 + M1^2.
```

These statements follow from rational differentiation and norm identities;
no root-location search is needed for the linear factor.

## Energy splitting

The endpoint-subtracted radial operator in the source is

```
N_v(s) = -2*s*v''(s) + (2*s-2)*v'(s) + (v(s)-v(0))/(2*s).
E_v = integral_0^infinity exp(-s)*|N_v(s)|^2 ds.
```

`OriginRegularity` proves actual smoothness through zero and the finite-endpoint
Green condition. `OriginDenominator` supplies the uniform lower bound1/250 for
both phase denominators. `OriginPhaseQuotient` removes the apparent singularity
by an exact polynomial divided difference. If p is either numerator, r=|p|,
pD=p.divX and qD=(p*conjugatePolynomial(p)).divX, then for s>0,

```
(v(s)-v(0))/s = pD(s)/r(s) - p(0)*qD(s)/(r(s)*r(0)*(r(s)+r(0))).
```

The right-hand side is continuous at0. `OriginEnergyExtension` builds the actual
continuous energy amplitudes from it and proves finite-panel integrability,
including panels touching zero. The original totalized operator is identified
only for s>0. `OriginEndpoint` proves that the extended energy amplitude at0
is exactly −3/2 times the actual phase derivative. This replaces the apparent
division by s without independently rounding the endpoint phase.

`OriginPhaseDerivative` supplies the actual real-parameter phase derivative
formulas. Polynomial growth and the denominator floor give global Gaussian
L², all scalar pairing integrability conditions and the infinity boundary.
`OriginAnalytic` and `OriginResidualCoefficients` therefore prove the full
weighted energy identities for the actual endpoint-subtracted original
coefficients, without further analytic hypotheses. These qualitative
identities supply no numerical integral enclosure by themselves.

Alternatively, for `0<s<=epsilon=10^-7`, the fundamental theorem gives `|v(s)-v(0)|<=s*M1`, and hence

```
|N_v(s)| <= 2*epsilon*M2 + (2*epsilon+5/2)*M1,
near energy <= epsilon * [2*epsilon*M2+(2*epsilon+5/2)*M1]^2.
```

For `s>=R=50`, unit modulus gives `|v(s)-v(0)|<=2`. With
`a=2*M2+2*M1` and `b=2*M1+1/R`,

```
far energy <= exp(-R) *
 [a^2*(R^2+2*R+2) + 2*a*b*(R+1) + b^2].
```

Only `[epsilon,50]` needs energy quadrature. Preserve the source's geometric
panels near the origin layer (epsilon,10^-6,10^-5,...,1), then integer panels.
The upstream energy routine sets45 decimal digits, while the visible-energy
wrapper later sets60; neither precision setting is a Lean certificate. Its
source targets are E_left<12671/1000 and E_right<12674/1000.

## A sound quadrature interface

The numerical checker should accept exact rational panel endpoints, an
explicit Taylor polynomial or quadrature rule, an interval evaluation of all
coefficients, and a justified complete remainder bound. It should return a
rational rectangle enclosing the exact real or complex integral. Soundness
must be proved generically before any native evaluation is meaningful.

For coefficient integrals use `s=t^2`, so the integrand is

```
2*t^2*exp(-t^2)*L_n^1(t^2)*phase(Q(t^2))*(-1)^n/sqrt(n+1).
```

This removes the square-root endpoint at0. Separate real-coefficient R and I
polynomials throughout; evaluating a complex polynomial and then taking its
real part is not its analytic continuation on complex balls.

Two viable generic proofs are:

- Real Taylor quadrature with interval automatic differentiation and an
  explicit derivative remainder on each closed panel. If degree p is used
  around its midpoint with half-width h and `|f^(p+1)|<=M`, the integrated
  error is at most `2*M*h^(p+2)/[(p+1)!*(p+2)]`.
- Local power-series arithmetic: for `q=R^2+I^2`, prove on each panel that
  `|q(t)-q(center)|<=eta*q(center)` with rational eta<1. Expand the inverse
  square root using its binomial series, keeping a rigorous remainder, and
  combine it with a verified exponential expansion. This avoids invoking a
  black-box analytic integrator or global complex root theorem.

Real nonvanishing alone does not establish a common complex square-root
branch on an arbitrary complex integration ball. A complex-Cauchy variant
must additionally prove zero-free complex neighborhoods; the local relative
variation test can provide that. The source's request `analytic=analytic`
is not a replacement for a Lean theorem.

Finite scalar reconstruction and interval propagation should use the actual
serialized rational endpoints only after the integral enclosure hypotheses
are discharged. Tolerances requested from Arb are not the delivered box
widths: the stored `[0,25]` maximum component width is approximately5.23e-9,
and the `[25,36]` maximum is approximately3.46e-16.

## Visible-energy and kernel assembly

For endpoint phase v0, subtract `v0*q_n` before applying spectral energy
bounds. The weighted visible norm uses `(2n+1)` for `n<120`; its operator norm
is239. Thus the table's one joint l2 truncation error costs
`239*exp(-25/2)` once at the norm level, before squaring. The source targets
are visible energies greater than11497/1000 and11498/1000, leaving tail
energies less than1174/1000 and1176/1000.

Endpoint cancellation removes the leading h_n product. Cauchy--Schwarz then
bounds the full omitted product sequence by

```
sqrt(E_left * W) + sqrt(E_right * W)
  + sqrt(E_left*E_right)/241^2,
W = 1/(48*119^3).
```

The comparison with523/2000000 is rational after directed radical ceilings
and squaring, and does not need quadrature. The source uses ceilings
2024/10^8 for `sqrt(E_left*E_right)/241^2` and1453/10^11 for the cross radical.
These arithmetic facts do not prove the total- or visible-energy inputs.

The low-mode mixture has coefficient `Re(a_n*conjugate(b_n))`. Its truncation
error can be bounded jointly by `e*(||a||2+||b||2)+e^2`, including the proper
branch weight, rather than paying the same omitted input120 times. Gaussian
kernel validity and reflection, charge grading, the Laguerre energy identity,
and the existing scalar mixture/repair transfer remain separate prerequisites.

## Float and source audit

- Decimal polynomial literals are exact rationals, imported without execution.
- NPZ endpoints are exact binary rationals. The importer verifies their
  structure and ordering; it does not prove their enclosure claims.
- The two origin table generators check the binary64 interval contains the
  Arb ball. The generic older radial generator lacks that explicit audit;
  it is archived because it supplies P, not because its separate table is used.
- NPZ `joint_l2_tail_bound` uses ordinary libm `exp` and one `nextafter` step.
  Preserve it as metadata; use a proved exp bound in Lean instead.
- The older candidate scripts sometimes use `Fraction(repr(float(x)))` and
  threshold tiny entries. Those candidate transformations are not the exact
  origin polynomial import. They must not silently redefine current Data.
- Bernstein proof data are exact Python-generated arithmetic. Their mathematical
  interpretation is proved by the Lean checker, not by the source hash.

The recommended first delivery boundary is exact response definitions and
nonvanishing, followed by derivative bounds and generic quadrature soundness.
Only then can interval facts close the numerical assumptions in issue143.
