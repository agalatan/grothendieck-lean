<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/WHY_THE_GAP.md (file dated 2026-10-22). Only this line was added. -->
# Why the bounds stall, and why the gap is where it is (IDE analysis, 22 Oct 2026)

## The numbers
| quantity | value |
|---|---|
| our lower bound (Lean master) | 1.401691989174 |
| ceiling of ANY certificate for the cubic witness T = P10 − εP21 (Gaussian-extremal model norm, best ε ≈ 0.756) | ≈ 1/0.71313 = 1.40227 |
| degree-9 complex game T = Σ_{j≤4} λ_j P_{j+1,j}: best challengers found [F] | 0.712056 → at most 1.40438 from that game |
| Haagerup's integral 1/γ†, γ† = ∫₀^{π/2} cos²t (1+sin²t)^{−1/2} dt (HJM's conjectured value) | 1.404575935 |
| our upper bound (Lean, with KernelHyps) | 1.404599424 (only 2.35·10⁻⁵ above 1/γ†) |
| HJM upper / Haagerup upper | 1.404898554746 / 1.40490913 |

So the upper bound has essentially converged to the conjectured value (successive improvements 1.40491 → 1.404899 → 1.404599 → 1.404596 approach 1.404576 and
slow down), while the lower bound sits 2.9·10⁻³ below it, and its method cannot exceed ~1.4023 even with a perfect proof.

## The structural reason: Gaussian (Hermite) duality
For the real constant, Heilman–Jones–Malavolta (arXiv:2610.10477, Thm 2.2) prove an exact minimax:
  1/K_G = sup over rounding schemes μ of [ c₁(μ) − Σ_{odd m≥3} |c_m(μ)| ] = inf over Hermite projection games Q = Σ_m q_m Π_m of OPT(Q),
where c_m(μ) are the Taylor coefficients of the rounding kernel H_μ(t) = E[f(X)g(Y)] and OPT(Q) = sup_{f,g Boolean} ⟨f, Q g⟩ (q₁ = 1).
The set 𝒞 of achievable kernel coefficient vectors is convex; an upper bound is a point of 𝒞 with large c₁ and small higher coefficients; a lower bound is a
supporting hyperplane of 𝒞 (a game). The complex case has the same structure with charge-one bidegrees (k+1, k) (our witness and our kernels t|t|^{2k} are exactly that).

Consequences:
1. **A game supported on degrees {1, 3} only sees the projection of 𝒞 onto (c₁, c₃).** Its best value is the best rounding that only has to kill the CUBIC
   coefficient, ignoring c₅, c₇, …. That is ≈ 1/1.4023. The remaining 2.3·10⁻³ of K is the cost of also killing degrees ≥ 5. No amount of work on the cubic
   witness (Conjecture K, response programme, Stein cuts, Lean) can recover it: the target 1.402 is just below the ceiling of the witness class, which is why
   every route saturates at 10⁻⁴-scale gains.
2. **Why cubics are the pain on both sides.** Cubic chaos is the first nonlinear constraint of 𝒞 in both directions. On the upper side, Haagerup's phase rounding
   has a large t|t|² coefficient and every improvement is about cancelling it (and then the tail). On the lower side, the witness's cubic term forces the analysis
   of non-Gaussian laws of cubic chaos (moments, Stein cuts, sixth-moment tensors, Conjecture K) because ⟨f, P21 g⟩ is governed by the law of the cubic residual
   of unimodular f. The precision demanded (~10⁻⁴ of an infinite-dimensional non-convex sup) is the same on both sides.
3. **What obstructs one direction helps the other (complementary slackness).** At an optimal pair (μ*, Q*), q*_m ≠ 0 only on degrees where the optimal
   rounding's constraint is active, with sign(q*_m) = sign of the residual c_m one cannot cancel. The degrees where our upper certificate's residual lives
   (the head coefficients of H − c t, degree ≤ 501, and the Hardy tail) are exactly the directions a better lower game must load. In the real case the certified
   game has nonzero coefficients at every odd degree 1..21 (q₃ ≈ −0.65, q₅ ≈ −0.16, q₇..q₂₁ of size 0.004–0.09); the analogue of our ε is q₃.
4. **The real case shows the same pattern.** Real: certified 1.773 ≤ K_G ≤ 1.7799, heuristic primal/dual 1.77917 / 1.77982 (duality gap 6·10⁻⁴), certified
   lower bound limited by CERTIFYING OPT of a degree-21 game (they reduce it to a one-variable convex function, moment sets, sign maximisation by min-cut, and
   ~35 rows of exact inequalities). Krivine 1.7822 is the analogue of Haagerup 1.4049.

## What this means for the programme
- The 1.402 effort with P10 − εP21 is fighting for the last 10⁻⁴ below a ceiling of ~1.4023. Even success moves K by < 0.0006.
- The big move (toward 1.4045) requires a **higher-degree complex game** Q = Σ_k q_k P_{k+1,k} (k ≤ 4..10), with its OPT certified. The manuscript already has
  a numerically optimised degree-9 spectrum λ = (1, −0.957928, 0.849070, −0.851228, 0.432009) whose best challengers give 0.712056 (≤ 1.40438).
  Its certification needs the multi-chaos analogue of the row machinery: the residual of a unimodular f now lives in chaoses (2,1), (3,2), (4,3), (5,4) jointly.
- A **complex primal/dual search** (HJM real Algorithm: alternate LP over game coefficients up to degree D against a pool of best-response pairs, and LP over
  rounding mixtures) would estimate K_G^C to ~10⁻⁴ and test Haagerup's 1/γ† conjecture. That is cheap relative to certification and decides where to aim.
- On the upper side, if 1/γ† is the truth, the upper bound cannot go below 1.404576; further upper work only buys ≤ 2.35·10⁻⁵ and its value is in formal
  closure (Lean), not in the number.

## Quantum information
K_G^R is the maximal quantum/classical ratio of two-player XOR games (Tsirelson); finite-order constants K_G(d) bound qubit violations (Acín–Gisin–Toner;
K_G(3) ≥ 1.4359 via 90 icosahedral vectors and branch and bound, arXiv:1707.04719). The same duality appears there: Bell inequalities (games) vs local models
(roundings), and the hard side is again certifying the classical value (OPT, an NP-hard maximisation). Nothing found settles K_G^C; the analogy supports that
the lower side is limited by the expressiveness of the witness class plus the cost of certifying OPT.

References: HJM primal/dual real (arXiv:2610.10477); HJM complex (arXiv:2609.25462, conjectured value 1/γ†); Saha–Li–…–Meka (arXiv:2608.11158), case study
(arXiv:2608.11195); Naor–Regev, Krivine schemes are optimal (arXiv:1205.6415); Brunner et al., Bell nonlocality (arXiv:1303.2849); qutrit witness / K_G(3)
(arXiv:1707.04719); Briët–Buhrman–Toner (arXiv:0901.2009).

## Corrections and the sharper diagnosis (after GPT's reassessment, ch17-crossbound.tex sec:forest-reassessment-20261022)
- CREDIT: the ceilings were already in the manuscript (ch4-ceilings.tex): "the degree-3 witness can never certify more than 1.402258"; PROVED chirp obstructions
  cap degree ≤ 5 witnesses at 1.4036705 and degree ≤ 7 at 1.4044895 < 1/γ†. The complex minimax 1/K = sup D(c) = inf N(λ) is proved in ch17
  (sec:complex-duality-proof). This note rediscovered them.
- OVERCLAIM WITHDRAWN: "the upper bound has converged to the truth" is not justified; 1/γ† may describe a restricted rounding geometry (as Krivine's constant did
  for the real case; Naor–Regev prove completeness of general Krivine schemes, not optimality of the simple one).
- Checked [P]: GPT's shared-driver example E[conj(r) q |q|^2] = 8√2 for (H(X), X) vs 0 for (H(Y), X) (identical marginals and covariances); complex CHSH has
  no scalar/vector gap (phases (1, i) give 2√2).
- THE ACTUAL BOTTLENECK is certification at degree ≥ 5 (ch5-negatives.tex, neg:deg5: model norm 0.7124 but sound gated rows ≥ 0.7322; the +η‖P32 h‖² h-side
  term cannot be gated). STRUCTURAL REASON (IDE): for real ±1 responses h = (f+g)/2, k = (f−g)/2 satisfy hk = 0 pointwise (disjoint supports), so the h-side
  and k-side of any game decouple and HJM's one-variable reduction works at every degree (they certify degree 21). For complex unimodular responses
  |h|²+|k|² = 1 and Re(h conj k) = 0 force f = e^{iα}e^{iθ}, g = e^{iα}e^{−iθ}, h = e^{iα}cos θ, k = i e^{iα} sin θ: both sides are driven by ONE shared phase
  field α and never separate. This single fact underlies the visible/remote coupling of Conjecture K, the shared-driver example, the failure of h-side gates at
  degree 5, and the absence of a complex CHSH gap.
- NEXT: (1) a degree-7 game certified within 5.7e-5 in norm gives K ≥ 1.404 (ch4 "What this means for the third decimal"); build its certificate in the
  (α, θ) parametrisation, keeping the shared phase instead of relaxing it. (2) GPT's common LP certificate (pool of actual responses; width δ + τ).
  (3) 1.402 with the cubic witness is a sub-target: even full success removes < 20% of the interval.

## Step 15 finding (IDE, numerical): the cross-degree coupling is what any higher-degree certificate must keep
The paired support is the exact pointwise support of the complex response set, so support tests do keep the shared phase. Yet a support architecture with
independent-Gaussian test directions loses >= 2.0e-2 on the degree-5 game (cap >= 0.7327 vs model norm 0.7124), the same loss as the gated rows (>= 0.7322).
Mechanism: a bounded response with a large cubic part must carry a degree-5 part (through the visible fibre: Qk sees the Z-average of the remote coefficient
profile a(Z), Rk sees its (|Z|^2 - 1) profile, and boundedness makes a(Z) vary). Certificates that treat chaos grades independently cannot see this; the game's
degree-5 penalty is what pays for the cubic gain. A degree >= 5 certificate therefore needs a MULTI-GRADE FIBRE: remote grade directions W_3, W_5, ... with visible
profiles from one bounded function, and a multi-grade domination statement. Details: attack-20261022/NOTES.md (step 15/15b).

## Step 16 (IDE, numerical; CORRECTED 22 Oct night, see below): the coupling is driver sharing
Degree-5 fibre model norm of (e1, eta) = (0.8494, 0.283): 0.712464 when the degree-5 mixed sectors (|Z|^2-1)W3, Z^2 conj(W3) use the cubic's own remote
driver W3; 0.724753 when they use independent drivers (the optimum then drops all degree-5 coefficients). So a degree >= 5 certificate must keep ONE
remote residual feeding several degrees through the visible fibre. This is the same single-residual structure the cubic rows already use for their
A- and B-sectors, extended by the degree-5 visible functions of the same residual.
CORRECTION (pd_engine.py, polar grid): the shared value is 0.7124294 (old grid 3.5e-5 high); visible-only 0.7124283, so the shared W3 sectors
gain only ~1e-6 at this game. RECHECK (pd_step16_recheck.py): independent 0.7246014 in the restricted game, but the optimal pair (Krivine sign flip phase(A0 +- 0.467 W3)) carries
(|Z|^2-1)W3 and Z^2 conj W3 on its OWN driver; counted honestly it scores 0.7108923. So independent-residual certificates overestimate by ~1.2e-2:
the DESIGN RULE (one shared residual) STANDS; the VALUE gain of sharing is only 9.1e-7.
Degree-5 model primal = dual = 0.7124293 (gap 1e-7): K >= 1.403648 if Gaussian-grade domination holds at degree 5.
