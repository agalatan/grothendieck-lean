<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/secant_assembly.md (file dated 2026-11-15 05:10). Only this line was added. -->
# Consequences of a global secant bound of 13/20

Agent-ID: **codex-6e2b**, 15 November 2026.

**Status:** the conclusions below are **P+C**. The global secant
certificate `Sec<=13/20` passed its complete compact cover; the content
estimates used are also **P+C**. These implications require no
localization of `r` and no Gaussian-tail allowance.

Let `J(q,r)` be the left side of (*) minus `2 E|L+q|`, at tilt `s=3/5`.
Write `C=||c_{3/5}(q)||`, `delta=E|q|^4-2u^2`, and

\[
k=p-s^2-\frac{13}{20}
=\frac{59009}{189100}>0.
\]

The global secant inequality, integrated over the remote variables, gives

\[
J(q,r)\le2\Re\langle r,c_{3/5}(q)\rangle-k\|r\|^2
\le\boxed{C^2/k}. \tag{1}
\]

This holds for every `r`, so there is no maximizer-existence assumption.

## 1. The available upper bound

For all `0<=u<=463/10000`, define

\[
G(u,\delta)=\min\left\{
\frac2{25}\delta,\ 3\delta^{3/2},\ \frac1{2500},\
\frac{19321}{10^6}u\right\}.
\]

Then `C^2<=G`. On the central interval `3/100<=u<=463/10000`, one may
add the stronger entry

\[
\gamma\delta,\qquad
\gamma=\frac{1077659}{27000000}<\frac1{25}, \tag{2}
\]

to this minimum. This bound has no restriction on `chi=delta/u^2`.
Consequently, for any explicit `0<kappa<1`, (*) with `eta=1/50000`
is proved whenever

\[
D(q)_+\ge\frac1\kappa
\left(\frac{G(u,\delta)}k-\frac1{50000}\right)_+. \tag{3}
\]

The central version uses the additional entry (2). Formula (3), rather
than a single rectangular subclass, records all consequences of the
currently certified separate content bounds.

## 2. Explicit dimension-free subclasses

**Small energy, all tensors and all linear forms.** Since `delta<=42u^2`,

\[
J(q,r)\le\frac{126\sqrt{42}}k u^3.
\]

Thus (*) holds with `kappa=0`, `eta=1/50000` for

\[
0\le u\le
u_*:=\left(\frac{k}{50000\cdot126\sqrt{42}}\right)^{1/3}
=0.00196979264029\ldots . \tag{4}
\]

A convenient rational endpoint is
`u<=196979/100000000=0.00196979`. Its acceptance is the exact rational
inequality

\[
126^2\cdot42\left(\frac{196979}{10^8}\right)^6
<\left(\frac{k}{50000}\right)^2.
\]

This is the largest initial energy interval supplied by the listed
uniform bounds: at this endpoint the cubic-cumulant entry is smaller
than the other entries. It is not claimed to be the true maximal interval.

**Small fourth cumulant, the full energy range.** The same constants
`kappa=0`, `eta=1/50000` hold whenever

\[
\delta\le\delta_*:=
\left(\frac{k}{150000}\right)^{2/3}
=0.000162963487921\ldots . \tag{5}
\]

One rational subclass is `delta<=2037/12500000=0.00016296`.
Its acceptance is `9(2037/12500000)^3<(k/50000)^2`.
No sign assumption on `D(q)` enters (4) or (5).

**Large positive deficit, the full energy range.** From `C^2<=1/2500`,
(*) holds with `kappa=19/20`, `eta=1/50000` whenever

\[
D(q)\ge
\frac{20}{19}\left(\frac1{2500k}-\frac1{50000}\right)
=\frac{3722991}{2802927500}
=0.00132825090909\ldots . \tag{6}
\]

The simple condition `D(q)>=0.00133` therefore suffices. In the central
energy interval, a further explicit subclass follows from (2):

\[
D(q)_+\ge\frac{20}{19}
\left(\frac{\gamma\delta}{k}-\frac1{50000}\right)_+. \tag{7}
\]

## 3. A weaker remaining content target

The previous sufficient target `C^2<=D_+/5+3e-6` can now be relaxed to

\[
\boxed{C^2\le\frac3{10}D(q)_++\frac3{500000}.} \tag{8}
\]

Indeed (8) and (1) give (*) with

\[
\kappa=\frac{56730}{59009}<1,
\qquad \eta=\frac{5673}{295045000}<\frac1{50000}.
\]

Their decimal values are approximately `0.961378773` and `0.0000192275755`.
This remaining target is already proved on the subclasses

\[
\delta\le(2\cdot10^{-6})^{2/3},
\quad\text{or}\quad D(q)\ge197/150000.
\]

On the central energy interval it is also sufficient that
`D_+ >= (10 gamma/3) delta - 1/50000`. These are sufficient conditions;
they do not establish (8) for general cubics.

## 4. What the existing remote certificates do and do not absorb

The independently audited remote theorem is
`Lambda(q)<S+9/25000000`, where `Lambda(q)=2E|L+q|-pu`.
Together with the uniform content cap, it gives only

\[
\Lambda(q)+\sup_rJ(q,r)
<S+\frac9{25000000}+\frac1{2500k}
=S+0.00128219836\ldots .
\]

Thus its headline bound cannot absorb the sector contribution into an
allowance `2e-5`. Nor does it imply a positive same-variance deficit:
its consequence is
`D(q)>=-[S-(B(u)-pu)]-9/25000000`.

A complete augmented moment/Stein certificate was not constructed here.
The generic remaining routes are a proof of (8), or a new certificate for
`Lambda+C^2/k` that couples the remote upper bound with the sector allowance.
The separate headline estimates above do not supply either conclusion.
This is a limitation of those bounds, not a chaos counterexample or an
obstruction to stronger moment/Stein duals.
