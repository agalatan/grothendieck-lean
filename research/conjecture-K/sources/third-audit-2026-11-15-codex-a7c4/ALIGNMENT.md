<!-- New third-audit proof/certificate note. Agent-ID: codex-a7c4. Refs #400. -->
# Global peak-row A/B kernel alignment

Agent-ID: codex-a7c4. Refs #400. Baseline
`39ae5c2393372213b52db6dcbfd647605e6d7e8b` (merged reviewer-updated #399).

**P by author + C, not externally reviewed.** The scalar target in STATUS
7.1.4 is now certified on its entire stated domain:

    |g_B(v) − (5053/10000)g(v)| < 7/1000,  for every real v≥0.       (1)

This is the peak profile `a=699/1250,b=179/1250`. No assertion at other
profiles is made. It proves, for every remote square-integrable q in every
finite dimension,

    ||c_B(q) − .5053 c_A(q)||₂ < .007 ||q||₂  if ||q||₂>0,         (2)

with equality zero when q=0. There is no cubic assumption, energy cutoff,
or assumption about sharing with other remote variables in (2).
The non-strict version is enough for all later budgets.

The new complete-monotonicity proof in [CONTENT_KERNELS](CONTENT_KERNELS.md)
supplies the analytic derivative and tail bounds. Arb enclosures at 80
dyadic nodes, exact coverage by 79 intervals, and the full infinite tail
then prove (1). This is a continuum certificate, not a maximization on a
sample grid. It does not prove the joint finite-amplitude A/B estimate or
a content inequality for arbitrary cubics, and therefore does not prove K.

## 1. What changes relative to the record

The original `.007` common-center target survived the historical J3
counterexamples: those refuted a different ratio interval and the
endpoint-centered comparison at the flank and upper rows. The first audit
replayed those finite counterexamples and checked v=.49,.50,.51 at the peak,
explicitly leaving the global target open. The second audit also left it
open. This certificate closes that exact scalar target; it does not change
the validity of the earlier counterexamples or claim a stronger ratio bound.

Exploratory ordinary quadrature suggested a maximum near v=.496, with
residual about .00698633. That observation motivated the certificate but
does not enter any acceptance decision. The saved enclosing intervals and
the proof below are the evidence for (1); no assertion of the exact maximum
or of its location is needed.

## 2. Positive kernels and a global curvature envelope

Set `A(v)=−g(v)`, `B(v)=−g_B(v)`, `rho=5053/10000`, and
`R(v)=B(v)−rho A(v)`. CONTENT_KERNELS proves that A and B are nonnegative
completely monotone functions, with finite derivatives at zero. Thus each
is a Laplace transform of a positive finite measure. In particular they
decrease, and their second derivatives are nonnegative and decrease.

For any interval [l,h] in [0,∞),

    |R''(v)| ≤ M(l),
    M(l) = rho A''(0)+B''(0)                         if l=0,
    M(l) = min(rho A''(0)+B''(0),
                4 exp(−2)[rho A(0)+B(0)]/l²)         if l>0.     (3)

Indeed, `lambda² exp(−lambda l)≤4 exp(−2)/l²` for every lambda≥0.
Integrating against the two positive representing measures proves the
second bound, and monotonicity of second derivatives proves the first.
The code uses outward upper endpoints of these bounds; choosing either
certified bound is safe even if their interval enclosures overlap.

For completeness the endpoint constants are computed without reading saved
results. Put `t=r²`, `A_t=a+bt`, `B_t=a+3bt` and

    D = −(A_t B_t)⁻¹ d/dt,
    f_A(t)=exp(−t)A_t⁻²,
    f_B(t)=exp(−t)A_t⁻³ B_t⁻¹.

The positive recurrence from CONTENT_KERNELS gives

    A''(0) = (5/32) ∫₀∞ t⁻¹/² B_t D² f_A(t) dt,
    B''(0) = (5/(32sqrt(2))) ∫₀∞ t⁻¹/² B_t D f_B(t) dt.

It only produces positive rational coefficients multiplying
`exp(−t)A_t⁻p B_t⁻q`. Substituting t=r² removes the origin singularity.
Arb integration on [0,10] and an explicit Gaussian tail enclose the two
moments. They agree with the separately implemented exact rational-series
calculation in `content_kernels_exact.py`:

    11.692061679509533 < A''(0) < 11.692061679509534,
     5.367695368406354 < B''(0) <  5.367695368406355.

The global checker uses its own wider enclosing balls, not these decimal
intervals as inputs. A(0) and B(0) come from the erfc closed forms already
derived in the first audit.

## 3. Enclosing each node and the intervals between nodes

The angular coefficients of phase give the formulas used by the first
audit's `claims_kernels.py`. For v>0, let x=sqrt(v), R=r(a+br²).
The two real coefficients divided by x are:

| region | f/x | b/x |
|---|---|---|
| R≥x, z=x²/R² | `2F1(1/2,1/2;2;z)/(2R)` | `−2F1(−1/2,3/2;2;z)/(2R)` |
| R≤x, z=R²/x² | `2F1(−1/2,1/2;1;z)/x` | `−z 2F1(1/2,3/2;3;z)/(8x)` |

Multiplying the first by `(r²−1)` and the second by `r²/sqrt(2)`, then
integrating with `2r exp(−r²)dr`, gives g and g_B. The global checker
integrates their required signed combination directly. The formulas follow
by binomial expansion and angular coefficient extraction, with continuous
values at R=x, as derived in the J3 source and first audit.

At each node, exact rational bisection encloses the unique branch radius
in an interval of width 10/2⁴⁸. The two retained real integrals are evaluated
on opposite sides. For complex analytic callbacks, `Re(z)<1` keeps the
hypergeometric argument away from its branch cut. The callback returns an
indeterminate ball otherwise, forcing subdivision. Each accepted integral
must be finite and its imaginary enclosure must contain zero.

The angular coefficients have absolute value at most one, directly from
their phase expectations. Thus the omitted branch interval and the tail
past r=10 have explicit absolute envelopes. For R(v) the latter is

    [102rho+101/sqrt(2)] exp(−100)/sqrt(v).

The script adds both omitted contributions before any comparison. The
requested quadrature tolerance is not used as an error bound; only the
returned balls and the explicit omitted-piece envelopes are used.

For a twice differentiable real function, deviation from its affine chord
on [l,h] is at most `M(l)(h−l)²/8` if (3) bounds its second derivative.
For example, subtract the chord and compare the result with
`±M(l)(v−l)(h−v)/2`; the second-derivative sign and zero endpoint values
give the two inequalities. Therefore

    |R(v)| ≤ max(|R(l)|,|R(h)|)+M(l)(h−l)²/8.                  (4)

The checker recursively bisects rational intervals until the full upper
bound in (4), including endpoint uncertainty, is strictly below .007.
It also checks exact adjacency and endpoints of the accepted cells.
The completed run has **79 cells and 80 nodes covering [0,16]**. The small
result file records every node enclosure, cell endpoint and accepted bound.

## 4. The infinite tail and the projection implication

Independent enclosures of A(16) and B(16) show

    0 < rho A(16) < .007,  0 < B(16) < .007.

Since A and B are nonnegative and decreasing, for every v≥16,

    −rho A(16) ≤ B(v)−rho A(v) ≤ B(16).

This covers the entire tail, with no extrapolation from a finite range and
no asymptotic expansion. Together with (4), it proves (1).

Finally `c_A=Π₁,₀[q g(|q|²)]` and `c_B=Π₁,₀[q g_B(|q|²)]`. The orthogonal
projection is contractive in L², so

    ||c_B−rho c_A||₂
      ≤ ||q(g_B(|q|²)−rho g(|q|²))||₂ ≤ .007||q||₂.

No invalid L¹ projection step is used. The strict inequality for nonzero q
also follows by integrating the strict pointwise inequality.

## 5. A smaller, exactly checked conditional signed budget

Suppose the still-open finite-amplitude joint bound holds with positive
cost matrix `[[.24,.118],[.118,.26]]`, and suppose `C_A²≤.24D`, where
`D=B(u)−F(q)` and u≤.0463. These are hypotheses, not consequences of (1).
Square completion bounds the gain above the Gaussian value by

    C_A²/.24 − D + ||c_B−(.118/.24)c_A||²/(.26−.118²/.24).

The first two terms are nonpositive. The paired triangle inequality gives
F(q)≥B(0), while concavity of the Gaussian benchmark gives
`B(u)−B(0)≤phi'(0)u`, and the checked peak value satisfies phi'(0)<1.432.
Consequently `C_A<.126145` and `sqrt(u)<.215175` at the stated energy cap.
Using (2) in the remaining square gives the exact rational upper bound

    374655161832121/7271400000000000000 < 2061/40000000
      = .000051525.                                             (5)

`alignment_budget.py` checks every rational comparison, including positive
definiteness. This improves the previous favourable signed numerical budget
.00005471 and makes the scalar budget **C**. It does not establish the
signed joint hypothesis, arbitrary-cubic content bound, odd-sector control,
or complementary response cover. The diagonal/adverse alternatives in
STATUS 7.4.2 keep their existing exact budgets; they can now use (2) at the
peak without assuming the kernel comparison separately.

## 6. Replay and review boundary

```sh
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/kernel_alignment.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/alignment_budget.py
```

Omit `--dependency-dir` when python-flint is installed normally. Both scripts
are read-only by default, reject `-O`, and write the adjacent JSON only with
`--write-result`. The global check uses 100-bit Arb and recomputes every
numerical input. Its angular integration code is adapted from the earlier
finite checker; it is not an independent implementation of those formulas.

The remote worker independently checked the quadrature envelopes, endpoint
moments, chord bound, exact-cover logic and infinite-tail implication. The
sector worker checked the conditional budget. These are within-session peer
checks, not external Claude-side review or Lean verification. No existing
source was edited and no new Grothendieck bound is claimed.
