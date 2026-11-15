# Independent review of the fixed-epsilon exterior certificate

**Verdict: PASS for the stated exterior region.** The retained h-square is genuinely present in the inherited analytic row theorem; the epsilon transfer does not manufacture a gain from a scalar inequality that had already discarded it. The stronger response-energy input also has a valid independent proof. Production replay, all nineteen source-hash/header checks, the exact Rice tangent replay, and an independently implemented coarser-pi cover all pass. This is not a proof of the missing central region or of a global Grothendieck lower bound.

The verified conclusion is, at the **single common operator** `P−(299/400)Q`,

\[
\operatorname{Re}\langle f,(P-(299/400)Q)g\rangle
\le \frac{713263}{1000000}<\frac{500}{701}
\]

for every unimodular response pair in every finite Gaussian dimension whose `t=||P(f+g)/2||₂` belongs to

\[
[0,1633/2000]\ \cup\ [433/500,\sqrt\pi/2].
\]

The open interval `(1633/2000,433/500)` remains uncovered. Its endpoints are covered by neighboring accepted cells.

## 1. Retained-square provenance

I inspected the actual local Lean sources at commit `e9b0a458d06e67e9a1eee1168e98f34ef577b3a0`, rather than relying only on theorem names or scalar table entries. The relevant chain is:

1. `Grothe/Lower/RowReduction.lean`, `hside_identity`, proves the exact identity

   `t²−e0||Qh||² = t²−2ell*t+2beta²/e0+2 Re<L,h>−e0||Qh+(beta/e0)v||²`,

   for `L=ell*Z+beta*v`, `v∈H_(2,1)`, and `||v||²=2`. The proof expands the square and uses projection orthogonality; no inequality has discarded this term.
2. `VOf_frame` combines that identity with the exact polarization formula for the witness.
3. `Grothe/LowerAnalytic/RowGaussian.lean`, `rowSharedWith_frame`, combines `VOf_frame` with `fibre_integrated` and `kside`, retaining the same h-square in its conclusion. Its shared frame theorem chooses one common vector `vL 0` for all rows.
4. `Grothe/LowerAnalytic/Reduction.lean`, `reductionHyp_of_nodeCaps`, rotates the frame back and explicitly preserves every norm `||Qh+c*v||`. It supplies one vector of norm squared two for the complete shared reduction.
5. `Grothe/Lower/Support.lean`, `rowOf_of_shared`, applies the certified moment and gate bounds and still concludes the retained-square row. In `Grothe/Lower/Boxes.lean`, `RowOf` means precisely this retained-square predicate, and `Row.env.C` is exactly `2beta²/e0+cap+capPad`.

The exact constants in `RowDataTypes.lean` are `e0=149/200` and `capPad=1/100000000000`. There is no double counting of the `2beta²/e0` term when the frozen row cap is used. The nineteen `ell,beta,cap` triples and their source hashes all matched the actual checkout in the production optional verification.

The node-cap prerequisites are inherited from the production proof: `MainResult.lean` uses `nodeCaps_of_vertexCaps (vertexCaps_of_capsRest capsRest)`. I read the relevant analytic chain, but did **not** rebuild the entire Lean project or rerun its large node-cap production certificates in this review. Likewise, the five `certRows` chunks are inherited Lean checks, not freshly compiled here.

As a second mathematical check, the HJM TeX source's scalar-potential argument begins from the identical exact square completion before dropping its nonpositive square. Its subsequent potential upper bounds do not consume the square; it may therefore be retained. The local Lean theorem makes this provenance explicit, avoiding reliance on an informal reversal of a previously weakened inequality.

## 2. Change of epsilon

Put `e=299/400` and `delta=e−e0=1/400`. For the **same** responses,

\[
V_e-V_{e_0}=\delta(\|Qk\|^2-\|Qh\|^2).
\]

For `x=Qh` and `||v||²=2`, expansion proves

\[
\frac{2\beta^2}{e_0}-e_0\|x+(\beta/e_0)v\|^2-\delta\|x\|^2
=\frac{2\beta^2}{e}-e\|x+(\beta/e)v\|^2.
\]

Thus the new row legitimately has `2beta²/e`, with the charge `delta||Qk||²`; only the new square is discarded. Both expansions equal `−e||x||²−2beta Re<x,v>`. This is an exact identity, not an optimization over a freely adjustable h-vector. No old row is being interpreted as a statement for a different operator without paying the transfer charge.

## 3. Explicit response-energy inputs

Two independent bounds are used, and both concern the **unscaled** projection `Qk`:

\[
\|Qk\|\le\rho=\frac{973612157}{10^9},
\]

\[
\|Qk\|^2\le \frac32(\pi/4-t^2)+B(A-t),\quad
A=\frac{886762780}{10^9},\quad B=\frac{432306903}{10^9}.
\]

The first is the inherited `Grothe.LowerAnalytic.normQk_le_rho`. Its source proves projection duality from the universal cubic first-moment estimate; it does not depend on the changed epsilon.

I independently checked the second using the weighted Hilbert space with measure `dmu=|Z|dγ/R`, `R=sqrt(pi)/2`. The pair `(h,k)` has weighted squared norm at most one. Put `Z/|Z|` in the h-slot; put the six orthonormal cubic sectors divided by `|Z|` in the k-slot. Their weighted Gram coefficients are

\[
c=(2,3/2,3/4,1,1,7/8).
\]

These are exact Gamma half-moments. Different visible angular frequencies are orthogonal; the remaining remote cubic/linear cross term vanishes by chaos orthogonality, and the quadratic/visible-cubic cross term vanishes because the remote `(1,1)` chaos is centered. Arbitrary sharing among remote fields is allowed. The potentially nonzero weighted pairing of `Z` with the visible cubic lies in different response slots and therefore causes no obstruction.

Consequently Bessel's inequality gives, with unscaled squared sector energies `d_j`,

\[
\frac{d_q}{2}+\frac{2d_A}{3}+\frac{4d_B}{3}
+d_Q+d_P+\frac{8d_\nu}{7}\le\frac\pi4-t^2.
\]

Every nonremote coefficient is at least `2/3`, so

\[
\|Qk\|^2\le\tfrac32(\pi/4-t^2)+d_q/4.
\]

For the remote cubic `q`, response support gives `t+lambda*d_q <= E rhoRice(lambda²|q|²)`. The global Rice tangent is `rhoRice(u)<=A+B*u` for all `u>=0`. Setting `lambda=1/(2B)` yields `d_q<=4B(A−t)`, proving the required total-energy estimate. This derivation never uses a response energy already scaled by an old operator epsilon.

I read and reran `research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/foundations_exact.py`: PASS. It recomputes the tangent at `u=1/10` using exact rational Bessel series, exponential alternating series and outward rational square-root bounds. Its Bessel tail uses a decreasing term-ratio geometric majorant. Concavity follows from the stated positive Laplace integral for the derivative, so the tangent applies globally. I also reran `response_ellipsoid_check.py`: accepted. These scripts verify the numerical inputs; the weighted-Gram argument above supplies the analytic proof.

The energy estimate is valid throughout `0<=t<=sqrt(pi)/2`, without the central thresholds needed for some older displayed rounded energy caps. It assumes actual bounded responses, not arbitrary cubic coefficient tuples. Those are exactly the hypotheses of the exterior statement.

## 4. Cover and independent replay

The two transferred branches are convex quadratics in `t`, with leading coefficients `1` and `1−3delta/2=797/800`. Their maxima on a closed cell are therefore at endpoints. Taking the minimum of their **separate whole-cell upper bounds** is valid. The crude row has the same property. This is different from assuming the pointwise minimum itself is convex.

The production proof's Machin bound is correctly oriented: seven alternating terms upper-bound `atan(1/5)` and six lower-bound `atan(1/239)`, so `16*upper−4*lower` upper-bounds pi. Its grid endpoint `1773/2000` exceeds `sqrt(pi)/2`. Replacing pi by an upper bound is monotone in the energy branch because `delta>0`.

Production replay with source verification returned:

- accepted cells: `1674` of `1773`;
- rejected cells: exactly indices `1633,...,1731`;
- maximum accepted cap: approximately `0.7132628753936695` (display only; exact comparison used);
- strict uniform bound: `713263/1000000 < 500/701`.

The independent script `replay_exterior_independent.py` imports neither production verifier module. It parses only the frozen rational rows, uses the deliberately **coarser** certified upper bound `pi<355/113`, evaluates each branch separately at both endpoints, and checks the entire rejected-index set and every acceptance. It also returned the same `1674` cells and the same strict simple bound. Its exact maximum is

\[
\frac{18645708016773734467047873428358928649862047462653}
{26141425067084464592510443847680000000000000000000}.
\]

Replay it from any working directory:

```text
python /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/upper-batch/replay_exterior_independent.py
```

Its output is saved in `exterior_independent_replay.json`.

## 5. Limits and small robustness note

The result is unconditional with respect to Conjecture K, the even premise, the odd-sector premise and Gaussian replacement. Its production row and radius theorems remain inherited analytic/certificate inputs, explicitly identified above. The central interval is genuinely missing; the exterior certificate cannot establish the global target on its own.

At the first review the production script relied on `assert` without rejecting `python -O`. Its documented ordinary invocation is valid, but an optimized invocation could print PASS after bypassing acceptance assertions. I recommended adding an explicit `if not __debug__: raise RuntimeError(...)` guard. The independent script has that guard. This is a verifier robustness issue, not a mathematical gap in the ordinary replay.

Reviewed hashes at the time of the successful production replay:

| File | SHA-256 |
|---|---|
| `EXTERIOR_PROOF.md` | `655caf037cf57d2816d4199d74f6f16e2cc3320f8241d0ee26e25ca8863bfe5d` |
| `certify_exterior_7475.py` | `75ac5eb45db9b3be9ed7044d64c8d9a75ff5eb5cee094e76e93f69e6bd24c1cd` |
| `exterior_transfer.py` | `7521392c8b5f36c334d571a2b2be8aa3d3cb9399b61a3cb26f589518c00fe112` |
| `inherited_rows.json` | `9503bc50a3335eb611d46e858c9f26e46ee94b4fd15f27458a44b236b7ab3118` |
