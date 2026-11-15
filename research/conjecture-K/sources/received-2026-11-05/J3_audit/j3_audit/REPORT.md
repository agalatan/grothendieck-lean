<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/J3_audit/j3_audit/REPORT.md (file dated 2026-11-05). Only this line was added. -->
# J3 audit: certified scalar obstructions and corrected finite-amplitude target

The requested finite-amplitude J3 theorem is **not proved or disproved here**. No finite-amplitude diagonal loss delta is certified, for XP(Y), Gaussian-factor cubics, or self-interaction cubics. This package instead supplies independently replayable certificates that parts of the requested auxiliary package are false, and an exact counterexample to the claimed quadratic-budget implication.

The attachment was read together with the supplied research bundle. The bundle's `ai-notes/prompt-J3-finite-amplitude.txt` already corrects the scope of the B-cost and makes the scalar endpoint row-specific. Its corrected scalar targets still have the failures below. These are distinct from the original prompt's common-center residual bound.

## 1. Interval-certified scalar results

Let R(t)=sqrt(t)(a+bt), with the following exact rows:

| Row | epsilon | a | b |
|---|---|---|---|
| peak | 1891/2500 | 699/1250 | 179/1250 |
| flank | 149/200 | 14/25 | 1467/10000 |
| upper | 1891/2500 | 573/1000 | 19/125 |

Define F_A(x)=E[(T-1) ph(L+x)]=x g(|x|²) and F_B(x)=E[Z² conjugate(ph(L+x))/sqrt(2)]=x g_B(|x|²). Let rho=g_B/g, and let rho_*=rho(0) denote the exact continuous endpoint, rather than a rounded decimal.

The checker encloses the following values. The displayed open intervals deliberately round outwards beyond its computed balls.

| Row | Certified interval for rho(0) | Certified interval for h_*(1/2), where h_*(v)=|g(v)|(rho(v)-rho_*) |
|---|---|---|
| peak | (0.50534060463, 0.50534060464) | (0.0069716757, 0.0069716759) |
| flank | (0.50263200635, 0.50263200636) | (0.0071326433, 0.0071326435) |
| upper | (0.50113032381, 0.50113032382) | (0.0070598178, 0.0070598180) |

Consequences:

1. The original common ratio interval rho(v) in [0.505,0.56] is false at the flank and upper rows, already at v=0 and hence also for sufficiently small positive v.
2. Replacing the lower endpoint by rho_* does **not** make the bundle's corrected target h_*<=0.007 true: v=1/2 is a strict counterexample at both the flank and upper rows.
3. The corrected ratio interval [rho_*,rho_*+0.055] is also false at the upper row. The checker proves

   rho_upper(18)-rho_upper(0) in (0.0554912338,0.0554912340) > 0.055.

These statements use exact row parameters and interval arithmetic, not optimization results. The energy condition E|q|²<=0.0463 does not impose a pointwise restriction |q|²<=0.0463, so large kernel arguments cannot simply be omitted.

**Important distinction.** These witnesses do not disprove the original common-center comparison

    sup_v |g_B(v)-0.5053 g(v)| <= 0.007.

For example, at v=1/2 its absolute residuals are approximately 0.0069862196, 0.0061739471, and 0.0055526449 at the three rows. All are below 0.007. No global certificate for this common-center comparison is claimed here. It is a more useful target than the ratio interval: by L² projection contraction it directly implies

    ||c_B(q)-0.5053 c_A(q)||_2 <= 0.007 sqrt(E|q|²)

for every remote q in L², with no cubic or sharing restriction. One does not need a ratio lower bound for this implication.

### Derivation and enclosure of the kernels

For real x>0 define

    f(R,x)=E_theta Re ph(x+R exp(i theta)),
    b(R,x)=E_theta Re[exp(2i theta) conjugate(ph(x+R exp(i theta)))].

The binomial expansion, followed by angular coefficient extraction, gives the following exact formulas, extended continuously to R=x. Write H(A,B;C;z) for the Gauss hypergeometric function.

For R<=x, set z=R²/x²:

    f=H(-1/2,1/2;1;z),
    b=-(z/8) H(1/2,3/2;3;z).

For R>=x, set z=x²/R²:

    f=(x/(2R)) H(1/2,1/2;2;z),
    b=-(x/(2R)) H(-1/2,3/2;2;z).

Consequently

    g(v)   = int_0^infinity exp(-t)(t-1) f(R(t),sqrt(v))/sqrt(v) dt,
    g_B(v) = int_0^infinity exp(-t)t b(R(t),sqrt(v))/(sqrt(2)*sqrt(v)) dt.

At v=0, after t=r²,

    g(0)   = int_0^infinity exp(-r²)(r²-1)/(a+br²) dr,
    g_B(0) = -int_0^infinity exp(-r²)r²/(sqrt(2)(a+br²)) dr.

The checker uses 100-bit Arb/Acb integration, t=r², and exact rational bisection around the unique positive root r(a+br²)=sqrt(v). It excludes a rational interval of width 10/2^40 around this root. The contribution of that omitted interval is enclosed using |f|,|b|<=1, which follows directly from their angular definitions. The two remaining compact integrals are evaluated independently. Analytic integration checks that Re(z)<1 before evaluating 2F1 on a complex ball, so no unchecked branch cut is crossed.

Beyond r=10 (t=100), absolute errors are at most

    102 exp(-100)/sqrt(v),
    101 exp(-100)/(sqrt(2)*sqrt(v)),

respectively. At v=0 the bounds are exp(-100)/(20b) and exp(-100)/(20sqrt(2)b). These bounds are added to the balls before any acceptance test. A finite integral ball is accepted only after its imaginary component is checked to contain zero. Requested integration tolerance is not treated as an error bound: only the returned enclosing balls enter the assertions.

## 2. A 0.07 loss on both diagonals does not yield the stated closure

Interpret J3 with loss delta as cost matrix

    M_delta = [[0.24-delta,0.118],[0.118,0.26-delta]].

At delta=0.07 this becomes [[0.17,0.118],[0.118,0.19]]. Even granting exact alignment c_B=0.5053 c_A (zero vector-comparison error), the assumptions C_A²<=0.24 Delta and Lambda(q)<=S-Delta do not imply excess<=5.5e-5.

Here is an exact scalar quadratic-budget witness:

    c_A=0.0144,
    c_B=0.5053 c_A,
    Delta=c_A²/0.24=27/31250=0.000864,
    r_A=5866857/57425000,
    r_B=-288891/11485000.

The last two numbers are exactly M_delta^{-1}(c_A,c_B). Their squared norms are approximately 0.01043780064 and 0.00063271193, both below 0.0113. The resulting excess allowed by the weakened estimate is exactly

    c^T M_delta^{-1} c-Delta
      =30446529993/71781250000000
      =0.000424157144... > 0.000055.

`verify_algebra.mjs` checks every equality and comparison using BigInt rational arithmetic. This is a counterexample to the inference from the stated inequalities, **not** a realized cubic counterexample to J3 or Conjecture K. In particular, it does not claim a cubic with Lambda(q)=S-Delta and these contents exists.

For a positive definite matrix with coefficients k_A,k_B,m, the exact unconstrained completion is

    sup_{A,B} [2 Re<A,c_A>+2 Re<B,c_B>-k_A||A||²-k_B||B||²-2m Re<A,B>]
      = ||c_A||²/k_A
        + ||c_B-(m/k_A)c_A||²/(k_B-m²/k_A).

The amplitude restriction can improve this bound, but does not remove the explicit witness above, whose maximizing amplitudes already satisfy the restriction. A usable closure statement must report k_A,k_B,m separately and recompute this budget.

## 3. Route (b) has an extra hypothesis and a factor-of-two issue

The supplied B-cost proof assumes a base independent of Z. Its density estimate concerns the pushforward under Z -> L(Z). Replacing its remote base q(w) by q(w)+(T-1)r_A(w) changes that map. Therefore the supplied certificate cannot be applied at that base without a new estimate.

The assertion that such a cost holds at **every even L² base** is in fact false. Set

    H(Z)=L(Z) sign(Re Z),    B=Z² conjugate(W)/sqrt(2),

with W an independent standard complex Gaussian. H is even under Z -> -Z and belongs to L². For each Z, one of L+H,L-H vanishes and the other equals 2L. Averaging over W, the nonzero branch has derivative zero at s=0; the zero branch contributes |s|E|B|. The energy cross term has expectation zero. Dominated convergence, using the norm's Lipschitz bound, proves

    Lambda(H+sB)-Lambda(H)
      = (sqrt(pi)/(2sqrt(2))) |s| + o(|s|).

No finite linear functional plus a negative quadratic cost can upper-bound this cusp for both signs of s. This counterexample is to the arbitrary-even-base claim; H is not asserted to have the restricted form q+A.

There is also a separate algebraic issue in the proposed content estimate. Write C=Re<A,B> and a=||A||, b=||B||. The stated bound

    Re<B,c_B(q+A)-c_B(q)> <= -(m-delta) C + delta ab

does not imply J3 with mixed coefficient m and diagonal loss delta. Keeping m, it gives an error 2delta(C+ab), bounded by **2delta(a²+b²)**. Thus it spends up to 2delta on each diagonal. Equality in this bookkeeping occurs for equal aligned A,B; the exact checker verifies this case.

A sufficient estimate with the intended diagonal loss is instead

    Re<B,c_B(q+A)-c_B(q)> <= -m C + delta ab.

This follows, for example, from the correctly centered operator estimate

    ||c_B(q+A)-c_B(q)+m r_A||_2 <= delta ||r_A||_2,

provided an appropriate B-cost at q+A has first been established. The norm formulation also requires defining the first-order B content at that Z-dependent base consistently.

## 4. Route (a): preserve the joint law with q

The joint Gaussian law of (r_A,r_B) is determined by its covariance matrix, because these are holomorphic linear forms. This does not determine the joint law of (q,r_A,r_B). For example, with r_A=r_B=sqrt(w)X, the two admissible remote cubics

    q_1=sqrt(u/2) X(|X|²-2),
    q_2=sqrt(u/2) Y(|Y|²-2),

where X,Y are independent, have equal energy u and exactly the same Gaussian pair of shells. Nevertheless

    E|q_1|²|r_A|²=4uw,    E|q_2|²|r_A|²=uw.

The exact checker verifies the Wick moments behind this distinction. A valid uniform certificate must retain the conditional law of q given the shells, or take a uniform bound over q inside the shell average. Replacing this dependence by an independent shift is not justified.

The problematic amplitude |r_B|>=0.1 is also not a three-sigma tail at variance 0.0113. For a proper complex Gaussian,

    P(|r_B|>=0.1)=exp(-100/113)=0.41273243537...,
    E[|r_B|²; |r_B|>=0.1]/E|r_B|²
       =(1+100/113)exp(-100/113)=0.77798237818....

This does not refute the averaged route. It means that the principal failure region must be integrated effectively; it cannot be discarded as a rare Gaussian event.

## 5. An exact target avoiding differentiated singular kernels

Put V=L+q and H=(T-1)r_A+Z² conjugate(r_B)/sqrt(2), and define the nonnegative norm remainder

    R(V,H)=2[|V+H|-|V|-Re(H conjugate(ph(V)))].

V is nonzero almost surely for a remote q, since L has a planar density. By parity Z -> -Z, both norm terms in Lambda coincide at the even base q+H. Energy orthogonality gives

    Lambda(q+H)=Lambda(q)+2 Re<r_A,c_A(q)>+2 Re<r_B,c_B(q)>
                 -p(||r_A||²+||r_B||²)+E R(V,H).

Therefore the finite-amplitude J3 target with diagonal loss delta is exactly

    E R(V,H) <= (p-0.24+delta)||r_A||²
                +(p-0.26+delta)||r_B||²
                -0.236 Re E[r_A conjugate(r_B)].

This formulation is finite-amplitude, has no Hessian denominator, and preserves all sharing. It is a possible target for an enclosure of the actual joint law. No such uniform enclosure is supplied in this package.

For comparison, the standard Taylor identity has a **plus** sign before the Hessian integral:

    Lambda(q+H)=Lambda(q)+DLambda(q)[H]
                  + int_0^1 (1-s)D²Lambda(q+sH)[H,H] ds.

Equivalently one subtracts the integral of the negative Hessian. With K=-D²Lambda/2, the cost is int_0^1 2(1-s)K ds. The minus sign in the original prompt before D²Lambda itself is incorrect.

## Replay and status

Requirements: Node.js 20+; Python with python-flint (tested with python-flint 0.9.0). From this directory:

```sh
# j3_work/replay.sh
node verify_algebra.mjs
python3 certify_kernels.py
```

The first checker uses exact rational arithmetic; the second recomputes all scalar values with interval arithmetic. `kernel_results.json` and the logs are outputs, not trusted inputs. `explore_kernels.py` uses ordinary SciPy and is explicitly exploratory; no conclusion certified above depends on that file or its optimization results.

Proved here: the scalar counterexamples, the failure of the weakened-cost closure inference, the route-(b) factor-of-two correction, and the analytic reductions and scope obstructions described above. **Still open here: finite-amplitude J3, its exact delta and class coverage, and the global common-center residual bound.**
