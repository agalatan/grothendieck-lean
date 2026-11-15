<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_tail.md (file dated 2026-11-13). Only this line was added. -->
# A finite-box reduction for the joint A/B norm remainder

Agent codex-a713, 13 November 2026. **Proved here:** a uniform, dimension-free Gaussian-tail reduction with exact numerical constants, preserving arbitrary dependence of the remote cubic on the shell drivers. **Not proved here:** its remaining compact-box finite-remainder premise, Conjecture K, or a new Grothendieck lower bound.

This uses the finite norm remainder rather than integrating an infinitesimal theorem at inadmissible bases. It also avoids treating shell excursions as probabilities without their payoff weights. An analytic large-shift bound below makes the remaining parameter region genuinely compact. The scalar density bounds used below are independently replayed by [improvement_joint_tail_verify.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_tail_verify.py); its output is [improvement_joint_tail_check.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_tail_check.json).

## 1. Statement

At any of the peak, flank or upper rows, write `L=Z(a+b|Z|²)`, `p=1/epsilon`, `T=|Z|²`, and let Z be standard complex Gaussian. For constant x, alpha, beta in C set

    h=(T−1)alpha+Z² conjugate(beta)/sqrt(2),
    R(V,h)=2(|V+h|−|V|−Re[h conjugate(ph(V))]),
    r_x(alpha,beta)=E_Z R(L+x,h).

Put `d_A=p−.24`, `d_B=p−.26`, and define the robust target

    Q_x(alpha,beta)=d_A|alpha|²+d_B|beta|²+.236|alpha beta|.

(Its expression does not depend on x; the subscript only identifies the comparison with r_x.) Let `w=.0113`. Suppose a compact-amplitude inequality has been proved, for every complex x and every `|alpha|,|beta|≤R`, of the form

    r_x(alpha,beta) ≤ Q_x(alpha,beta)−eta(|alpha|²+|beta|²).       (BOX)

If

    s=R²/w,  delta=2(1+s)exp(−s)<1,
    eta ≥ (7/2)delta/(1−delta),                                 (RESERVE)

then, for every remote q and every pair of holomorphic Gaussian linear forms r_A,r_B with variances v_A,v_B≤w, irrespective of sharing with q or each other,

    E R(L+q,(T−1)r_A+Z² conjugate(r_B)/sqrt(2))
      ≤ d_A v_A+d_B v_B+.236 sqrt(v_A v_B).                     (JOINT)

This is exactly the robust finite-amplitude joint premise in REPORT §4. The theorem does not require q to be Gaussian, independent of the shells, or pointwise bounded. For finite q the conditional remainder is well defined; L has a planar density. A remote cubic automatically satisfies the needed measurability/integrability.

The exact rational checker establishes these sufficient choices of diagonal reserve:

| Amplitude box R | Robust reserve eta | Signed reserve eta (defined below) |
|---:|---:|---:|
| .300 | .022 | .0236 |
| .325 | .0064 | .0068 |
| .350 | .00163 | .00175 |
| .375 | .000371 | .000398 |
| .400 | .0000753 | .0000807 |
| .450 | .00000219 | .00000235 |

In particular, a box with each shell amplitude at most .4 needs only 7.53e−5 extra diagonal reserve. Section 5 proves that shifts |x|≥6 already have reserve .03, so only |x|≤6 remains to be checked. A box result with no reserve would instead yield an additive error at most 1.701e−6 at both energy caps. Neither assertion claims that BOX has yet been established.

## 2. A uniform all-amplitude majorant for paying the tails

The elementary square-root tangent inequality gives, for V≠0,

    0≤R(V,h)≤|h|²/|V|.

For the A field, the pushforward under Z→L(Z) of `(T−1)²` times Gaussian measure has mass one and density

    rho_A(L(Z))=(T−1)² exp(−T)/[pi(a+bT)(a+3bT)].

For all T≥0, `(T−1)² exp(−T)≤1`: on [0,1] this is immediate; on [1,infinity) its maximum is `4exp(−3)<1`. Therefore `rho_A≤1/(pi a²)`. Any nonnegative planar density of mass one bounded by M/pi has inverse-distance potential at most `2sqrt(M)`, uniformly in its center. Indeed, for any radius r>0 the potential is at most `1/r+Mr`; minimize in r. Consequently

    J_A(x)=E[(T−1)²/|L+x|]≤2/a.

For B the corresponding density is

    rho_B(L(Z))=T² exp(−T)/[2pi(a+bT)(a+3bT)],

again of mass one. The exact caps M at the peak/flank/upper rows are 7/25, 11/40, 13/50. The supplied B-cost argument established these caps, and our checker independently verifies all three on [0,infinity): 2000 rational cells on [0,2], a positive Taylor lower bound for exp, and monotonicity past 2. Thus `J_B(x)≤2sqrt(M)`.

Cauchy–Schwarz inside the Z expectation now gives an all-amplitude bound, uniform in x. At all three rows the following common rational constants are valid:

    r_x(alpha,beta)
      ≤ (179/50)|alpha|²+(53/50)|beta|²+(39/10)|alpha beta|.      (GLOBAL)

Here `2/a≤179/50`, `2sqrt(M)≤53/50`, and `sqrt((179/50)(53/50))≤39/20`; the checker verifies these inequalities exactly. Also `p≥33/25`, so

    (179/50)−d_A≤5/2,    (53/50)−d_B≤0.

Subtracting the robust target from GLOBAL gives

    r_x−Q_x≤(5/2)|alpha|²+(458/125)|alpha beta|
            ≤(7/2)(|alpha|²+|beta|²).                          (TAIL)

The final inequality is the positivity of the two-by-two matrix with diagonals 1 and 7/2 and off-diagonal −229/125: its determinant is positive. No bound on x, alpha or beta is used in TAIL.

This majorant is intentionally used only for the tails. It cannot replace the directional argument in the main box. Already at x=0, its sharp A potential is `E[(T−1)²/|L|]≈2.004` at the peak row, exceeding p≈1.322. The actual infinitesimal A gain has an angular factor one-half. Dropping that directional information before proving BOX therefore loses even positive A cost.

## 3. Gaussian shell tails, including arbitrary correlation

Let alpha,beta be any jointly proper complex Gaussian pair with variances v_A,v_B≤w. Holomorphic linear forms of a standard complex Gaussian vector have exactly this law, including degenerate or perfectly correlated pairs. Define

    E={|alpha|>R or |beta|>R},     S=|alpha|²+|beta|².

For a proper complex Gaussian alpha,

    E[|alpha|²; |alpha|>R]=v_A(1+R²/v_A)exp(−R²/v_A).

If v_B>0 and the squared correlation is c∈[0,1], conditioning on beta gives

    E[|alpha|²; |beta|>R]
      =v_A(1+c R²/v_B)exp(−R²/v_B).

To see this, write alpha as its linear regression on beta plus an independent proper Gaussian residual. The conditional second moment is `v_A(1−c)+c(v_A/v_B)|beta|²`, and integrate the exponential |beta|² law. When v_B=0 the tail event is empty. These identities are valid without reference to q.

The function `(1+s)exp(−s)` decreases for s≥0. Using v_A,v_B≤w and the union bound therefore yields

    E[|alpha|² 1_E]≤delta v_A,
    E[|beta|² 1_E]≤delta v_B,
    E[S 1_E]≤delta(v_A+v_B),     delta=2(1+R²/w)exp(−R²/w).    (GAUSS)

This is an energy-weighted tail bound, not merely a tail-probability estimate. The factor two is conservative; it avoids any assumption on the correlation. Arbitrary dependence of q on the same drivers is harmless because BOX and TAIL are uniform in x and are applied conditionally at x=q.

## 4. Closing the reduction and signed variant

Apply BOX on E-complement and TAIL on E. Writing V=v_A+v_B,

    E[r_q−Q_q]≤−eta E[S 1_(E-complement)]+(7/2)E[S 1_E]
               ≤[−eta+(eta+7/2)delta]V≤0.

Finally `E|alpha beta|≤sqrt(v_A v_B)`, proving JOINT. This completes the analytic reduction.

The favorable signed target also admits the same reduction. Replace Q by

    Q_signed=d_A|alpha|²+d_B|beta|²−.236 Re(alpha conjugate(beta)).

Then GLOBAL implies `r_x−Q_signed≤(15/4)S`: the relevant two-by-two matrix has diagonal entries `15/4−5/2=5/4` and `15/4`, and off-diagonal −517/250; its determinant is positive. Thus replace 7/2 by 15/4 in RESERVE. The signed reserves in the table are exact sufficient rational numbers. Integrating this target preserves the signed covariance itself, so a successful signed BOX certificate would give the signed finite-amplitude J3 inequality without a diagonal loss.

## 5. The remote-shift tail is closed analytically

This is a finite-remainder application of the potential estimate in the supplied all-shift Hessian proof; no Hessian integration along a z-dependent base is involved. Put

    P(t)=(t−1)²+t²/2.

Pointwise Cauchy–Schwarz gives `|h|²≤P(T)S`, hence

    r_x(alpha,beta)≤S E[P(T)/|L+x|].

For |x|≥6 split at T=5. On T≤5, `|L+x|≥6−sqrt(5)(a+5b)`, while `E P(T)=2`. The inner contribution is at most `2/[6−sqrt(5)(a+5b)]`. The pushforward density of P(T) times Gaussian measure on T>5 has mass `(89/2)exp(−5)` and density at most

    exp(−5)(57/2)/[pi(a+5b)(a+15b)].

Indeed, `exp(−t)P(t)` decreases on [5,infinity), and the denominator increases. The mass/density potential bound gives

    E[P(T)/|L+x|]
      ≤ 2/[6−sqrt(5)(a+5b)]
        +2 exp(−5) sqrt[(89/2)(57/2)/((a+5b)(a+15b))]
      < .91                                                        (SHIFT)

at all three rows. The checker verifies SHIFT with rational upper bounds for square roots and for exp(−5). The actual certified upper bounds are about .893502, .897545 and .908491, respectively.

For the signed target, the largest eigenvalue of the cost matrix `[[.24,.118],[.118,.26]]` is at most its largest row sum .378. Therefore

    Q_signed≥(p−.378)S≥.942S.

The robust target is no smaller than the signed target. Consequently both targets exceed r_x by at least `.032S`, and in particular by `.03S`, whenever |x|≥6. This holds for all shell amplitudes. Every reserve in the table is below .03.

Finally simultaneous rotation of Z,x,alpha,beta makes x real and nonnegative while preserving amplitudes and `Re(alpha conjugate(beta))`. Thus the remaining certificate region is exactly

    0≤x≤6,   |alpha|≤R,   |beta|≤R,

with the two relative phases retained. For R=.4 its required reserves are those stated above.

## 6. Exact checker and remaining work

Run:

    /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_tail_verify.py

All acceptance tests use Python Fraction. For the Gaussian tail, the positive Taylor polynomial of degree 160 is a rational lower bound on exp(s), so its reciprocal gives a rational upper bound on delta. Displayed decimal diagnostics are not used for acceptance. The script rechecks B-density caps, potential/cross constants, positive-semidefinite tail matrices, the analytic large-shift bound and each table reserve. It does not mechanically check the analytic arguments or the remaining BOX premise.

The open certificate is now specific: prove BOX at R=.4 with reserve .0000753 for the robust target (or .0000807 for the signed target) on 0≤x≤6. The analytic shift and Gaussian amplitude tails then complete the full parameter domain. No amplitude truncation of q is being inferred from its L² energy.
