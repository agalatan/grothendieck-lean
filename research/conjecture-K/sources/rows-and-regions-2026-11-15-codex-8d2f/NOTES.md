<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-rows-and-regions-2026-11-15/NOTES.md, 2026-11-15 13:31; Agent-ID: codex-8d2f. -->
# Phase 0 proof and bookkeeping notes

Agent-ID: codex-8d2f. 15 November 2026. All new proofs below are **P, author only**.
Arithmetic acceptance is **C, author only**. Numerical searches are **N**.

## 1. A one-row conditional consumer

Fix epsilon e=149/200 throughout. For every finite Gaussian dimension and every
pair of unimodular responses f,g, use the monograph's h=(f+g)/2, k=(f-g)/2,
t=||P10 h||, G=e P21 k. Thus 0<=t<=sqrt(pi)/2. The retained row inequality is

    V_e <= t² - 2 ell t + 2 beta²/e + LambdaHat_(e,ell,beta)(G).

This is the inherited reviewed MONOGRAPH 1.6 / STATUS 2.10a theorem. The proposed
single new row M is

    e=149/200, ell=3391/4000, beta=90686/625000,
    a=ell-2beta=0.5575548, b=0.1450976.

Its **missing premise M** is LambdaHat_M(G) <= S_M + 1/10000 for all actual
responses with 21/25 <= t <= 1711/2000. A sufficient stronger premise covers
every genuine cubic, with any sharing and in every finite dimension, on

    ||q||² <= lambda² (463/10000),
    ||G||² <= lambda² (80051/1000000),     lambda=3725/3782.

Here G=q+(T-1)r_A+z² conjugate(r_B)/sqrt(2)+zQ+conjugate(z)P+d z(T-2),
with the exact chaos restrictions of MONOGRAPH 1.7. The individual energies
are u=||q||², V=||r_A||²+||r_B||², W_Q=||Q||², W_P=||P||²,
W_nu=2|d|², and ||G||²=u+V+W_Q+W_P+W_nu. No independence among the remote
drivers is imposed. If u>0 the genuine-cubic restriction gives 0<=chi<=42;
the premise must cover that whole range, as well as u=0.

For any row with S<=S_hi, its largest allowable error on [l,h] at norm target
B is exactly

    eta_max = B - max_{t in {l,h}}(t²-2 ell t+2 beta²/e+S_hi).

The quadratic is convex. Endpoints, rather than a numerical t grid, therefore
control the entire closed interval. For M, B=100000/140171 and
S_hi=6877059109/5000000000 give

    eta_max=270324292079477/2610684875000000000
           =0.0001035453549634086... > 1/10000.

## 2. The inherited outer cover

The 19 existing Lean rows at e=149/200 each give

    V_e <= t²-2 ell_i t+2 beta_i²/e+cap_i+capPad
           -e ||P21 h+(beta_i/e) H||²,
    capPad=1/10^11, ||H||²=2.

The implication is `Grothe/Lower/Support.lean: rowOf_of_shared`, with
`Row.env` in `Boxes.lean`. The actual-response shared reduction and crude row
are supplied by `Grothe/LowerAnalytic/WitnessCap.lean`, the row checks by
`Grothe/Lower/Cert/Rows0.lean` through `Rows4.lean`, and their dependencies.
We inherit these already-established Lean theorems. This handoff does not
rebuild their proof closure or replace it by a claim that file hashes prove them.
The data are parsed directly from the tracked RowData01--RowData19 files.

Dropping the nonnegative square gives a valid bound at every t. The crude
bound V_e <= t²+e rho², rho=973612157/10^9, is another inherited row. No new
claim about an unrestricted sup LambdaHat is made from either kind of row.

`ledger.py` partitions [0,R_hi] into adjacent closed intervals of width
1/2000, truncating the last interval at a freshly proved rational
R_hi>sqrt(pi)/2. For each cell it selects an existing row (or the crude row)
whose two endpoint values lie strictly below B. Without M the only
unaccepted union is [21/25,1711/2000]. With M on precisely that interval,
all **1773 cells** pass. The largest accepted cap is

    822443166116215755072991319224862651340553 /
    1152831661584510380999809433600000000000000
    =0.7134113275357202... <100000/140171.

Thus **conditional on M**, the inherited witness/norm theorem yields
K_G >= 140171/100000=1.40171, strictly exceeding both the old exact bound
1250000000/891774069 and the printed 1.401700322371. This is a conditional
consumer, not an unconditional improvement. The coarser cover avoids relying
on rounded root locations: the diagnostic 1/20000 mesh leaves
[2101/2500,8553/10000]=[.8404,.8553], strictly inside the proposed interval.
One new row is sufficient. No claim of a globally optimal choice of row or
of the impossibility of improving the inherited certificates is intended.

## 3. The response-energy check

Use the reviewed STATUS 2.12b ellipsoid and Rice tangent, with
A=886762780/10^9 and B=432306903/10^9:

    u/2 + 2 E_A/3 + 4 E_B/3 + W_Q+W_P+8 W_nu/7
       <= e²(pi/4-t²),
    u <= 4e² B(A-t),
    ||G||² <= e²[3(pi/4-t²)/2+B(A-t)].

The latter follows by charging every sector other than q at least 2/3
in the ellipsoid, then using the remote cap. Both right sides decrease in
the t range used. At t>=21/25, at e=149/200:

    u < .044881259,       ||G||² < .077655279.

After dividing by lambda² these are

    u/lambda² < .046265316 < .0463,
    ||G||²/lambda² < .080050026 < .080051.

The rational verifier checks these comparisons with a Machin-series enclosure
for pi. Therefore the existing peak energy box is large enough for M after
scaling. No extension below t=.84 or to larger normalized energies is required
for the recommended consumer. This does not assert that the energy box alone
implies the missing all-sector inequality.

## 4. Gaussian benchmark at the new row

Let J(v)=2 E|Z(a+b|Z|²)+sqrt(v)W|-v/e. Write x=t(a+bt)²/v. The direct Rice
formula is

    J(v)=sqrt(pi v) integral_0^infty e^-t
          [(1+x) I0e(x/2)+x I1e(x/2)] dt -v/e,
    J'(v)=sqrt(pi)/(2 sqrt(v)) integral_0^infty e^-t I0e(x/2) dt -1/e,

where Ine(z)=exp(-z) In(z). `benchmark.py` integrates on [0,64] with
Arb/Acb, plus the explicit nonnegative tails

    e^-64 [130a+2b(64²+128+2)+sqrt(pi v)],
    e^-64 sqrt(pi)/(2sqrt(v)), respectively.

These follow from E|L+sqrt(v)W|<=|L|+sqrt(pi v)/2, sqrt(t)<=t and
t^(3/2)<=t² for t>=64; for the derivative use 0<I0e(x/2)<=1 on the real axis.
The integrands are entire in the complex integration variable (integer-order
scaled Bessel functions), so the analytic callbacks have no hidden branch cut.

For completeness, concavity is valid at these new positive a,b, not only at
the peak. The plane density of L at radius r, with r²=t(a+bt)², is
e^-t/[pi(a+bt)(a+3bt)], strictly decreasing in r. Convolution of radial
nonincreasing nonnegative functions is radial nonincreasing: by layer cake,
reduce to the area of intersection of two disks as their centers separate.
The heat identity gives d(2E|L+sqrt(v)W|)/dv=(1/2)E|L+sqrt(v)W|^-1.
Convolving the density with a Gaussian preserves radial decrease. The next
Gaussian increment can only decrease its convolution with 1/r at the origin.
Truncation and monotone convergence justify the unbounded 1/r kernel; it is
locally integrable in two dimensions. Hence J' is nonincreasing and J is
concave. Positive/negative derivative signs bracket its global maximizer.

The accepted bracket is

    3228257/10^8 < v_* < 3228277/10^8,
    2750823643/2000000000 < S_M < 6877059109/5000000000.

For the upper bound use the tangent at the bracket midpoint:
S_M<=J(v_m)+|J'(v_m)|(v_r-v_l). No floating approximation enters acceptance.
The output also proves v_*>0, so this row avoids the sigma*=0 corner.

## 5. Weighted/profile transfer and its actual shortfall

Write a=lambda(a0+da), b=lambda(b0+db), e=lambda e0. STATUS 3.17 gives

    LambdaHat_(e,lambda a0,lambda b0)(lambda G)
       =lambda LambdaHat_0^(lambda)(G).

For lambda<=1 this is at most lambda LambdaHat_0(G). For lambda>1, applying
the unweighted minimizing multiplier gives an upper surcharge
lambda(lambda-1)pi/4, by STATUS 2.13. For an explicit trial the tighter
lambda(lambda-1)_+ ||xi_trial||² can be used. The 91d4 trial has
||xi_trial||² <=(1129795281/2500000000)V; this is not a full all-sector
theorem and is not used to accept M.

The paired triangle bound for a profile perturbation is
lambda sqrt(pi)(|da|+3|db|/2). Subtract the reviewed Gaussian supporting
plane of STATUS 3.14, at variance 403448/10^7, with

    J_minus=1.3739535256614828,
    ga in [1.689944147450845,1.689944147450846],
    gb in [2.622896929056071,2.622896929056073].

Thus if a full source theorem supplies S0+eta0, the transferred error is at most

    lambda eta0 + lambda[S0_hi-J_minus
      +sqrt(pi)(|da|+3|db|/2)-ga da-gb db]
      +lambda(lambda-1)_+ pi/4.

For M, lambda=3725/3782<1, da=32065317/4656250000,
db=1198369/291015625. The weighted surcharge is zero, but the exact outward
profile term is .0007047733157734182..., alone larger than eta_max. At
eta0=1/10000 the resulting bound is .0008032661766935662... . The signed
gradient interval endpoints, absolute values and pi bound are selected
outward by the verifier.

This is failure of the available transfer estimate, not evidence that M is
false. The available profile loss would need to fall below about 5.053e-6
to fit the maximum M allowance with source eta0=1e-4; to deliver the chosen
eta_M=1e-4 it must be at most (1-lambda)/10000=1.50713907985e-6.
The source A-only theorem transferred with its recosted k_lambda yields
.0007237420; the joint peak total 4936/10^8, even under (P), yields
.0007533894. Neither is a full-sector theorem or fits this row budget.
The new profile is outside both 3.15 and 11.53.

In every D_+-based assembly the remote error is added unattenuated (11.23):
eta_total=eta_remote+eta_sector, not (1-kappa)eta_remote+eta_sector. A joint
A/B bound already contains the A contribution; do not add 11.51 again.
An odd-sector bound must keep its actual sharing/domain hypotheses. No part
of this calculation invokes the frozen partial gamma=1/5 certificate.

## 6. Comparing fixed operators for the ambitious route

Different epsilon operators cannot be minimized silently. For e>=e_old=.745,
their exact difference on the same responses is

    V_e-V_old=(e-e_old)(||P21 k||²-||P21 h||²).

Keep the old row's h-square. Completing that square with the second term
replaces 2 beta²/e_old by 2 beta²/e and yields

    V_e <= t²-2 ell t+2 beta²/e+cap+capPad
             +(e-e_old)||P21 k||².

Use ||P21 k||²<=min(rho², 3(pi/4-t²)/2+B(A-t)). Each branch is a convex
quadratic in t for the epsilon range here; test both endpoint maxima and
take their minimum. This is implemented by `old_cell`, not by minimizing
caps for unrelated operators. This extension is **P, author only**, inherited
response and old-row theorems stated above.

At e=1891/2500 and target 1.402, combining this cheap transferred envelope
with 8.1 still leaves the conservative rational gaps

    [0,209/500], [309/500,83/125],
    [87/125,21/25], [851/1000,863/1000].

They are gaps in this particular reusable envelope, not a claim that all
these responses are near extremal or that a better exterior argument must
use new Conjecture-K rows. The minimal same-operator consumer in sections
1--3 has none of these new exterior obligations.
