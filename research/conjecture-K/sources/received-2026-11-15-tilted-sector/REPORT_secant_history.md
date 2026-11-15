<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/REPORT_secant_history.md (file dated 2026-11-15 06:00). Only this line was added. -->
# Tilted sector: global secants and stronger structural content

Agent-ID: **codex-6e2b**. 15 November 2026.

**P+C: the global function-value remainder bound is proved for all complex
parameters, with no localization hypothesis or Gaussian bad-event tail.**
The complete compact cover passed with 102,104 accepted boxes. The content
improvement is also **P+C**:

\[
\boxed{\|c_{3/5}(q)\|^2\le
\frac{1077659}{27000000}\delta\le0.04\delta
\quad(0.03\le u\le0.0463).}
\]

This holds in every finite dimension and for every normalized cumulant
\(\chi=\delta/u^2\), including the requested interval \([2,10]\).
The full tilted-sector inequality for general tensors remains **O**: the
comparison with the actual same-variance deficit is not yet proved.
No new Grothendieck constant bound or Lean theorem is claimed.

Labels: **P** = supplied mathematical proof; **C** = exact or outward
interval computation; **N** = floating point only; **O** = open. A proof
using certified numerical constants is **P+C**.

## What a reviewer should check first

1. The global remainder reduction and compact-box interpolation in
   [secant_proof.md](secant_proof.md), especially the factors of two and the
   use of convexity through folds. No pointwise ring Hessian bound is used.
2. The structural content identity, angular constant, and half-line
   differential supersolution in
   [secant_content_proof.md](secant_content_proof.md). Its energy interval
   is continuous; checking its two endpoints suffices because the
   differential residual is affine in the energy.
3. The exact remaining comparison in section 4 below. The strengthened
   content estimate does not, by itself, imply that comparison.
4. Run `python3 -I verify.py`. The active replay regenerates the scalar
   data, checks every compact box, and verifies the content barrier.
   [results.txt](results.txt) records the run and source hashes.

## 1. Setting and provenance

Set

\[
a=699/1250,\quad b=179/1250,\quad p=2500/1891,\quad s=3/5,
\quad A=T-2/5,\quad L=Z(a+bT),\quad P=p-s^2.
\]

Here \(Z\) is standard complex Gaussian, \(T=|Z|^2\), and the remote
Gaussian variables are independent of \(Z\). For a remote cubic
\(q\in H_{2,1}\), put

\[
u=\mathbb E|q|^2,\qquad
\delta=\mathbb E|q|^4-2u^2\in[0,42u^2],\qquad
C=\|c_{3/5}(q)\|.
\]

Write \(F(q)=2\mathbb E|L+q|\),
\(B(u)=2\mathbb E|L+\sqrt uW|\), \(D=B(u)-F(q)\), and
\(D_+=\max(D,0)\). No sign assumption on \(D\) is made. The sector gain at
any particular remote linear form is

\[
J(q,r)=2\mathbb E|L+q+Ar|-P\|r\|^2-F(q).
\]

The local record and GitHub repository were read at
[`d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75`](https://github.com/agalatan/grothendieck-lean/commit/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75).
The principal record is
[STATUS.md](https://github.com/agalatan/grothendieck-lean/blob/d0bd91a1b2eeabaa0cdbb22fcf8907c5414f1a75/research/conjecture-K/STATUS.md),
especially sections 3.3, 6.3, 11(c), and the failure catalogue in section 13.
The Stein tensor budget and Gaussian calculus are existing inputs, not
claimed as new. The present contributions are their tilted scalar
certificates and the explicit consequences stated here.

The user-supplied review in the sibling `gpt-tilted-sector-2026-11-15-review`
folder supplied the secant proposal and numerical comparisons. That folder
was read only. All writes remain in this authorized output folder; there
were no Git mutations, external comments, or Lean builds.

## 2. Global function-value secant bound

Define

\[
f(w,\rho)=\mathbb E_Z|L+w+A\rho|,
\qquad
\operatorname{Rem}(w,\rho)=
2[f(w,\rho)-f(w,0)-\langle\nabla_\rho f(w,0),\rho\rangle].
\]

**Theorem (P+C).**

\[
\boxed{\operatorname{Rem}(w,\rho)\le\frac{13}{20}|\rho|^2
\quad\text{for every }w,\rho\in\mathbb C.}                 \tag{1}
\]

Rotation and conjugation reduce to real \(\rho\ge0\), \(\Im w\ge0\).
The proof in [secant_proof.md](secant_proof.md) covers the entire domain:

- **P+C, small amplitudes:** \(\rho\le33/200\). A previously certified
  scalar projection envelope, extended analytically to its exterior,
  gives \(\Theta(33/200)\le0.649660<0.65\). Integrating along the segment
  proves (1) there. The complete old curvature certificate is replayed;
  it also retains \(\Theta(0.3)\le0.75\).
- **P, large amplitudes:** \(\rho\ge60/13\). The elementary norm
  remainder bound gives \(\operatorname{Rem}\le4\mathbb E|A|\rho<3\rho\).
- **P, spatial exterior:** \(|w|\ge6\), at every amplitude. An untilted
  density estimate gives
  \(\mathbb E[A^2/|L+w|]<3603551/5604000<0.65\).
- **C, compact cover:** the remaining domain lies in
  \([33/200,5]\times[-6,6]\times[0,6]\). The checker
  [secant_verify.cpp](secant_verify.cpp) bounds function values with
  weighted Jensen/chord quadrature of the circular mean. Its positive
  series tail, source origin interval, and infinite tail are enclosed.
  The quadratic remainder bound is imposed only after averaging over
  the source variable; no uniform per-ring quadratic bound is assumed.

For a box of widths \(\Delta\rho,\Delta x,\Delta y\), let
\(G=\operatorname{Rem}-(13/20)\rho^2\). Joint convexity of \(f\) and
bounds on the untilted base terms give

\[
G\le\max_{\rm corners}G+
\frac{179/125+\rho_{hi}}4(\Delta x^2+\Delta y^2)
+\frac{13}{80}\Delta\rho^2.                            \tag{2}
\]

The completed cover accepted 102,104 boxes after 204,207 visits, with
154,239 distinct corner values and maximum subdivision depth 27. Every
non-pruned accepted compact box has a nonpositive certified right side.
Thus folds of the shifted map do not require a bounded shifted Hessian.
The linear term uses 602 freshly integrated radial values with outward
rational endpoints; its interpolation error is also included.

**P+C, consequence of (1).** Orthogonality of the first and third chaoses
identifies the linear term as \(2\Re\langle c,r\rangle\). Integrating (1)
over the remote variables and completing the square gives, for every
linear \(r\),

\[
\boxed{J(q,r)\le2C\|r\|-k\|r\|^2\le C^2/k,
\qquad k=P-13/20=59009/189100.}                        \tag{3}
\]

This conclusion has no restriction on \(\|r\|\), no maximizer assumption,
and no omitted Gaussian tail.

## 3. Stronger content estimate — P+C

The new central-energy coefficient is

\[
\gamma=\frac{1077659}{27000000}\approx0.0399132963.
\]

The shifted Gaussian resolvent \(\Psi_u\) and the existing trace-sensitive
Stein budget give

\[
C^2\le\frac23\delta\sup_R N_{\Psi_u}(R).
\]

The angular representation bounds this tensor metric by
\((11/72)\|k_u\|_\infty^2\), where

\[
k_u(x)=\int_0^1z^{2/3}\mathbb E\,m''\left(zx+
\sqrt{\frac u2(1-z^2)}G\right)\,dz,
\quad
m(x)=\mathbb E[(T-2/5)\operatorname{sign}(\Re L+x)].
\]

A rational piecewise cubic barrier, checked on 500 intervals, proves
\(\|k_u\|_\infty\le313/500\) simultaneously for
\(u\in[3/100,463/10000]\). Its differential residual is positive on
both energy endpoints, hence throughout the interval. The proof includes
both unbounded spatial tails and the barrier's derivative jump. Therefore

\[
C^2\le\frac{11}{108}(313/500)^2\delta=\gamma\delta\le\delta/25.
\]

The full proof and checker are
[secant_content_proof.md](secant_content_proof.md) and
[secant_content_verify.py](secant_content_verify.py). The witness contains
exact rational decimal strings; all source integrals are recomputed with
Arb. The numerical optimizer is not part of acceptance. Independent audit
and independent replay passed.

Throughout \(0\le u\le0.0463\), the earlier certified estimates also give

\[
C^2\le H(u,\delta):=\min\left\{
\frac2{25}\delta,\ 3\delta^{3/2},\ \frac1{2500},\
\frac{19321}{10^6}u\right\}.                         \tag{4}
\]

On the central interval add \(\gamma\delta\) to this minimum.
Their proofs are [content_profile_proof.md](content_profile_proof.md),
[content_tensor_next.md](content_tensor_next.md), and
[content_next_proof.md](content_next_proof.md). The active replay reuses
its regenerated radial table for the Gaussian-probe dual bound
\(C\le1/50\); it does not trust the old saved profile table.

## 4. Assembly and the exact remaining gap

**P+C.** Equations
(3)–(4) imply (*) with the following explicit dimension-free subclasses:

| Class | Range | \(\kappa\) | \(\eta\) |
|---|---|---:|---:|
| Every cubic | \(u\le196979/10^8=0.00196979\) | 0 | \(2\cdot10^{-5}\) |
| Small fourth cumulant | \(u\le0.0463,\ \delta\le2037/12500000=0.00016296\) | 0 | \(2\cdot10^{-5}\) |
| Positive deficit | \(u\le0.0463,\ D\ge0.00133\) | \(19/20\) | \(2\cdot10^{-5}\) |

For example, \(\delta\le42u^2\) and the third-order content estimate give
\(J\le126\sqrt{42}\,u^3/k\), proving the first row. All displayed
rational endpoints are checked in [secant_exact.py](secant_exact.py).
More generally, (*) is proved whenever
\(H(u,\delta)/k\le\kappa D_++\eta\), using the stronger central minimum
where applicable. See [secant_assembly.md](secant_assembly.md).

**O — a single remaining sufficient inequality:**

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac3{10}D(q)_+
+\frac3{500000}
\quad\text{for every cubic with }u\le0.0463.}         \tag{5}
\]

If (5) holds, (3) proves the requested full-range lemma with

\[
\kappa=\frac{56730}{59009}<1,\qquad
\eta=\frac{5673}{295045000}<2\cdot10^{-5}.
\]

The certified factor-two improvement is a bound in terms of \(\delta\).
A general lower comparison between the actual deficit and this content
allowance is still missing. The remote theorem's headline upper bound on
\(\Lambda(q)\) alone does not supply it. A direct augmented moment/Stein
certificate for \(\Lambda(q)+C^2/k\) is another possible route; it has not
been certified here. No numerical family test is promoted to an
all-dimensional comparison.

## 5. Evidence, replay, and retained history

**N only:** independent source quadrature agrees with the review's large
margin: an optimized secant quotient is approximately \(0.599694963\)
near \(\rho=0.571923,\ w=0.631848\) real. These values are checks on the
implementation and candidates for the supremum; they are not its proof.

Run `python3 -I verify.py` from this folder. It needs a C++17 compiler with
strict directed-rounding support and python-flint. The script locates the
available interpreter, or honors `TILTED_FLINT_PYTHON`. It compiles only
small certificate executables in a temporary subdirectory of this folder,
removes them on exit, and records source hashes. The entire 602-node table
is regenerated. The complete default replay passed, reproducing the same
102,104-box cover and all content certificates. The independent audit is
recorded in [secant_audit_results.md](secant_audit_results.md). `--algebra-only` verifies just the exact scalar comparisons
and explicitly does not certify the compact cover or content integrals.

Localization O-A2 is removed from the active proof and default replay.
The earlier report and run are retained as
[REPORT_localization_history.md](REPORT_localization_history.md) and
[results_localization_history.txt](results_localization_history.txt).
The filename `localization_circle.hpp` denotes a reused circle-series
utility; it introduces no localization premise. Earlier auxiliary files
are historical unless listed as dependencies of the active replay.
