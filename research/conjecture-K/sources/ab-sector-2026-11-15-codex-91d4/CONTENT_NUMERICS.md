<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/CONTENT_NUMERICS.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# B content: Phase 0 reconnaissance

Agent-ID: codex-91d4. Status: **N** for every reported numerical value. The elementary angular identities below are **P, author only**; their use in floating-point quadrature does not turn the results into certificates.

The 33 finite cubic probes support the proposed route-2 targets

\[
 \|c_{3/5}\|^2\le .15D_++6\cdot10^{-6},\qquad
 \|c_B\|^2\le .06D_++4\cdot10^{-6}.
\]

No uniform statement follows from these probes. In particular, the tested energies are only 0.01, 0.02 and 0.0463, every measured deficit is positive, and no dimension greater than 11 is tested.

## Numerical outcome

For the candidate cost matrix \(K=.23I\), the quadratic expression is
\((\|c_{3/5}\|^2+\|c_B\|^2)/.23\). The matrix itself is **not certified** here. This expression is the exact algebraic optimum of that quadratic surrogate, evaluated numerically; it is not the nonlinear retained gain obtained by freely optimizing the retained element.

| Probe at u = 0.0463 | D | tilted A content²/D | B content²/D | quadratic expression/D |
|---|---:|---:|---:|---:|
| Wick monomial | 0.0120634220 | 0.01135741 | 0.02162714 | 0.14341112 |
| Frozen two-variable tensor | 0.0088576628 | 0.01197341 | 0.02068258 | 0.14198253 |
| Frozen three-variable tensor | 0.0065517634 | 0.01267487 | 0.02008266 | 0.14242406 |

The largest B content²/D found is 0.02162714 (Wick, u=0.0463); the largest tilted-A content²/D is 0.01267487 (three-variable tensor, u=0.0463). The largest surrogate/D is 0.14341112. The proposed coefficient .06 is about 2.77 times the observed maximum B ratio, and .15 is about 11.8 times the observed maximum tilted-A ratio. These factors are numerical headroom, not proof margins. The largest observed B content²/δ is about 0.00486.

The smallest sampled differences between the proposed content bounds and the measured contents are 8.50·10^-5 for A and 3.27·10^-5 for B. This does not address small-deficit cubics outside the probe family.

## The B kernel and its convention

Put \(x=|w|\), \(r=\sqrt T(a+bT)\), and \(\operatorname{ph}(z)=z/|z|\) away from zero. The first-order B coefficient is

\[
 F_B(w)=\mathbb E_Z\frac{Z^2}{\sqrt2}\overline{\operatorname{ph}(L+w)}.
\]

Indeed, differentiating in a real amplitude multiplying \(Z^2\overline\rho/\sqrt2\) gives \(\operatorname{Re}(\overline\rho F_B(w))\). Its remote-linear projection therefore uses the same convention as the A coefficient: \(c_{B,j}=\mathbb E[\overline Y_jF_B(q)]\). Despite the conjugate on the B driver, **F_B is charge +1**, not charge -1: rotate both Z and w by a common phase.

For x,r>0 define

\[
 H_2(x,r)=\frac1{2\pi}\int_0^{2\pi} e^{2i\theta}
 \overline{\operatorname{ph}(x+r e^{i\theta})}\,d\theta.
\]

The two formulas are

\[
H_2(x,r)=
\begin{cases}
-\dfrac{x}{2r}\,{}_2F_1(-\tfrac12,\tfrac32;2;x^2/r^2),&x\le r,\\[2mm]
-\dfrac{r^2}{8x^2}\,{}_2F_1(\tfrac12,\tfrac32;3;r^2/x^2),&x\ge r.
\end{cases}
\]

Both give \(-2/(3\pi)\) at x=r. Set H₂(0,r)=0.

**Derivation.** For t=x/r<1, write the conjugate phase as
\(e^{-i\theta}(1+t e^{i\theta})^{1/2}(1+t e^{-i\theta})^{-1/2}\).
After multiplying by e^(2iθ), its constant Fourier coefficient is
\(\sum_{j\ge0}\binom{1/2}{j}\binom{-1/2}{j+1}t^{2j+1}\), which is the first hypergeometric series. For t=r/x<1 the constant coefficient is
\(\sum_{j\ge0}\binom{1/2}{j+2}\binom{-1/2}{j}t^{2j+2}\), giving the second. The binomial series converge absolutely for t<1. Bounded convergence of the phase integral gives the endpoint; Gauss's summation formula gives the displayed endpoint value. Consequently

\[
 F_B(w)=\operatorname{ph}(w)\int_0^\infty e^{-T}\frac{T}{\sqrt2}
 H_2(|w|,\sqrt T(a+bT))\,dT.
\]

The corresponding A and tilted-A profiles use the angular phase mean H₁. The script integrates all three against the same radial density. Their linear coefficients at zero are, numerically,

\[
g_0=-.835135933\ldots,\qquad g_0+.6j_0=.02404834216\ldots,
\qquad g_{B,0}=-.422028097\ldots.
\]

The projection of any constant multiple of q onto remote first chaos is zero. The code subtracts these linear multiples before projecting, reducing cancellation error without changing the mathematical contents.

## Probes and normalization

- Wick: q=√u Y(|Y|²−2)/√2, with χ=42.
- Genuine finite bath family: q=√u X[cos(θ)(|X|²−2)/√2+sin(θ)S_m/√m], with m in {1,3,10} and θ in {.55,1.0}. Here S_m is a sum of m independent centered exponentials. Only the X projection can be nonzero; the other first-chaos projections vanish by their independent phase symmetries. No diffuse Gaussian is substituted for a finite cubic.
- Four tensors: the archived two- and three-variable shapes with largest previous retained-A ratio among stored records at u≤.0463, plus two explicit deterministic complex vectors. All coefficient vectors are renormalized to energy one before multiplying by √u. They are frozen in `content_inputs.json`; the two source files' SHA-256 hashes and original energies are included.

The tensor basis is indexed by i≤j and k, with basis element
\((Y_iY_j\overline Y_k-\mathbf1_{i=k}Y_j-\mathbf1_{j=k}Y_i)/\sqrt{1+\mathbf1_{i=j}}\).
It is orthonormal. Fixing the first coordinate's phase uses common charge-one symmetry; all quantities being integrated are invariant under that common rotation.

The reported δ is E|q|⁴−2u². It is not χ: χ=δ/u². The deficit is B(u)−2E|L+q|; the penalty pu cancels because the Gaussian comparison has the same energy. The script evaluates B(u) independently through the Rice formula using scaled Bessel functions.

## Replay and convergence

```
python3 -I content_probe.py
```

Requires NumPy and SciPy. Actual interpreter: `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3` (NumPy 2.3.5, SciPy 1.17.1). Set all BLAS/OpenMP thread counts to one; the script does so before importing NumPy. Measured full runtime: about 9.8 seconds. Optional arguments `--ka`, `--kb`, `--m` replace the candidate matrix by [[ka,m],[m,kb]] and require it to be positive definite.

Every radial/profile/angular resolution is doubled for the fine pass: profile order 10→20 and radial table density 800→1600, Wick radial order 100→200, bath 40→80, two-variable radial/phase orders (20,16)→(40,32), three-variable (12,12)→(24,24). The B angular formula is separately compared with a 131072-point angular midpoint rule at x/r=.1,.7,1,1.4,4; largest difference is 4.58·10^-11 (at the phase jump x=r).

Across all 33 probes, coarse/fine differences are at most 2.49·10^-7 in D, 1.56·10^-7 in tilted-A content², 1.33·10^-7 in B content², and 1.97·10^-4 in the joint surrogate/D. These differences are convergence diagnostics, **not rigorous error bounds**. The Gaussian benchmark changes by at most 1.4·10^-14 between orders 180 and 300. The first-chaos orthogonality residual is at most 5.3·10^-16, relative energy error at most 5.5·10^-15. The monomial's computed χ agrees with 42 to about 3·10^-13.

The full numeric fields, coefficient vectors, source hashes and script hash are in `content_results.json` and `content_inputs.json`; stdout is `content_probe.log`. These probes neither optimize over tensors nor establish a global cost, a content-vs-deficit cover, the retained theorem, the raw compact-box theorem, or a new Grothendieck bound.
