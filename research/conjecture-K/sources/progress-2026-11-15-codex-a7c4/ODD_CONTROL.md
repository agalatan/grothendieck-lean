<!-- Agent-ID: codex-a7c4. Refs #421. -->
# Uniform odd-sector costs over every remote core

Agent-ID: codex-a7c4. Baseline `ff3f6203c`. Task #421.
The new analytic arguments are **P by author, not externally reviewed**.
The six uniform scalar bounds are **C**, from fresh Arb interval arithmetic
in `code/progress-2026-11-15-codex-a7c4/odd_control.py`.
Neither the analytic reduction nor its numerical premises are Lean theorems.

## 1. New nonzero-core, all-amplitude results

Choose any one of the three canonical profiles below, and its displayed
costs κ₁,κ_ν:

| Profile | a | b | p | κ₁ for Q or P | κ_ν |
|---|---|---|---|---|---|
| Peak | 699/1250 | 179/1250 | 2500/1891 | 1/100 | 11/50 |
| Flank | 14/25 | 1467/10000 | 200/149 | 3/100 | 6/25 |
| Upper | 573/1000 | 19/125 | 2500/1891 | 1/25 | 1/4 |

Here a=ℓ−2b and p=1/ε. In the original row parameters, the flank is
(ε,ℓ,b)=(149/200,4267/5000,1467/10000), and the upper row is
(1891/2500,877/1000,19/125). The checker records both parameterizations.
Let Z be standard complex Gaussian, T=|Z|² and L=Z(a+bT).
The results are proved separately at these three rows; no interpolation
or extension to the full application box is asserted.

All remote variables below are independent of Z. Let q,Q,P be arbitrary
remote complex L² variables, with arbitrary sharing between them, and
let ν∈ℂ be constant. Write

    Λ(G)=E|L+G|+E|L−G|−p E|G|²,
    O_Q=ZQ,  O_P=conj(Z)P,  O_ν=ν Z(T−2)/√2.

Then, separately for each of these three perturbations,

    Λ(q+O_Q) ≤ Λ(q) − κ₁ E|Q|²,                        (1)
    Λ(q+O_P) ≤ Λ(q) − κ₁ E|P|²,                        (2)
    Λ(q+O_ν) ≤ Λ(q) − κ_ν |ν|².                        (3)

These statements hold at every amplitude, in every finite dimension,
without an energy cutoff, with arbitrary nonzero q. In particular they
apply to genuine remote cubic q, Q∈H₁,₁, P∈H₂,₀ and the normalized visible
cubic ν. They do not require Q or P to be independent of q.

**The same three inequalities hold with Λ̂ in place of Λ**, where Λ̂
retains the minimization over the full first chaos. Section 4 proves this
extension; it does not assume that the perturbed optimizer has no visible
component.

There is also a combined result. If

    E[Q | q]=E[P | q]=E[Q conj(P) | q]=0,                (4)

then O=O_Q+O_P+O_ν satisfies

    Λ(q+O) ≤ Λ(q) − κ₁(E|Q|²+E|P|²) − κ_ν|ν|².         (5)

A concrete genuine-chaos class satisfying (4) is: q uses a Gaussian
coordinate block X, while Q and P use a disjoint Gaussian block Y.
Q and P may share Y arbitrarily. For this class, (5) also holds for Λ̂.
There is no dimension bound or amplitude bound on either block.

These results concern a remote core q. They do not insert A=(T−1)r or
B=Z²conj(r_B)/√2 into that core, and they do not establish pure cost for
arbitrarily shared simultaneous Q, P and ν. In particular this is not a
closure of the full odd-sector problem over q+A+B. The missing mixed
terms are exhibited in §3 rather than silently discarded.

For use with the existing peak remote cap: whenever its hypothesis gives
Λ(q)≤S+3.6·10⁻⁷ (STATUS 3.3(ii), including its remote-energy restriction),
the right sides of (1)–(3) are at most this same cap minus their displayed
positive costs. The same follows for the retained functional since
Λ̂(q)≤Λ(q). Thus these nonzero-core odd classes inherit the existing
peak-row remote certificate. This does not supply the other sectors,
profile rows or consumer needed to increase the Grothendieck lower bound.

## 2. Why one scalar potential controls an entire odd sector

Parity is exact. For an even remote q and an odd O,

    Λ(q+O)−Λ(q)
      =E[|L+q+O|+|L+q−O|−2|L+q|]−p E|O|².             (6)

Indeed Z↦−Z transforms the second norm in Λ(q+O) into |L+q−O|;
it also proves E[q conj(O)]=0. No differentiation and no first-variation
approximation is involved. The elementary parallelogram estimate gives

    |X+Y|+|X−Y|−2|X|
      ≤2√(|X|²+|Y|²)−2|X| ≤ |Y|²/|X|.                 (7)

At X=0 use the extended-valued right side. The estimates below prove
integrability for the uses here.

For x≥0 define

    U₁(x)=E_Z[T/|L+x|],
    U_ν(x)=E_Z[T(T−2)²/(2|L+x|)].                        (8)

Rotation of Z shows that any complex shift has the same potentials as
its modulus. The checker proves, uniformly on the entire half-line,

    U₁(x) < p−κ₁,       U_ν(x) < p−κ_ν.                 (9)

For the peak these targets remain 248109/189100 and 104199/94550,
respectively. The flank targets are 19553/14900 and 4106/3725;
the upper targets are 60609/47275 and 8109/7564.

Condition (7) on all remote variables. For O_Q its right side integrates
to E[|Q|² U₁(|q|)], for O_P to E[|P|² U₁(|q|)], and for O_ν to
|ν|² E[U_ν(|q|)]. Their energies are respectively E|Q|², E|P|² and
|ν|². Equations (1)–(3) follow immediately from (6) and (9).

The old failure of the inverse-norm sufficient condition over q+A+B
does not contradict (9). Its denominator includes A and B, and its odd
numerator includes Q/P cross terms. Neither feature is absorbed into
the separate scalar potentials in (8).

## 3. Mixed sectors: exact leakage and a combined theorem

For a complex remote value w set

    A₂(w)=E_Z[Z²/|L+w|],
    A₀(w)=E_Z[T(T−2)/(√2 |L+w|)],
    A₋₂(w)=E_Z[conj(Z)²(T−2)/(√2 |L+w|)].

The diagonal contributions to E[|O|²/|L+q|] are those in §2. The entire
remaining contribution is exactly

    R(q,Q,P,ν)=2 Re E[Q conj(P) A₂(q)
                        +Q conj(ν) A₀(q)+P conj(ν) A₋₂(q)]. (10)

All these terms are integrable by Cauchy–Schwarz and the uniform bounds
in (9). Angular orthogonality and E[T(T−2)]=0 give, without additional
remote assumptions,

    E|O|²=E|Q|²+E|P|²+|ν|².

Consequently the following all-amplitude estimate is valid for arbitrary
sharing:

    Λ(q+O)−Λ(q)
      ≤−κ₁(E|Q|²+E|P|²)−κ_ν|ν|²+R(q,Q,P,ν).           (11)

Under (4) each term in (10) is zero by conditioning on q, proving (5).
For the disjoint-block genuine-chaos example, E Q=E P=0. Also
E[Q conj(P)]=0: simultaneous rotation of Y leaves Q unchanged and
multiplies conj(P) by exp(−2iθ). Independence from X therefore gives (4).

Only E Q=0 does not imply E[Q A₀(q)]=0 when q and Q share variables.
Likewise the three separate cost inequalities cannot be iterated through
each other: after adding one odd sector, the base is no longer remote.
The mixed form (10) is precisely what remains to be controlled for
arbitrary sharing even before adding A and B.

## 4. The retained functional inherits the costs

Define

    Λ̂(G)=inf_{v∈H₁,₀}
      {‖v‖²+E|L+G−v|+E|L−G+v|}−p‖G‖².                (12)

For the baseline remote q, write v=cZ+v_rem. Its expression inside
braces is unchanged by c↦−c: apply Z↦−Z and exchange the two norms.
It is convex in c, so replacing c by zero cannot increase it. Hence

    Λ̂(q)=inf_{v_rem}
      {‖v_rem‖²+2E|L+q−v_rem|}−p‖q‖².                (13)

For each fixed remote trial v_rem, use (7) with remote base q−v_rem.
The pointwise uniformity of (9) gives the cost in (1), (2), or (3),
respectively; no conditional independence is lost by this change of
base. Restricting the trial set for Λ̂(q+O) to these remote v_rem is an
upper bound. Taking the infimum over them on the resulting right side
proves the retained versions of (1)–(3), using (13). This argument does
not require an attained minimum or any restriction on the true trial
minimizing Λ̂(q+O).

For the combined disjoint-block theorem, q=q(X), Q=Q(Y), P=P(Y).
The baseline infimum in (13) can be restricted further to first-chaos
trials v_X supported in X: any independent complementary linear form
v_Y has mean zero, so conditional Jensen removes it from the norm terms,
and removing its nonnegative squared norm helps as well. The same holds
for unused Gaussian coordinates. For each such v_X, q(X)−v_X still
uses only X, so the three conditional cross terms vanish. Apply (5)
at this shifted remote base and then take the infimum over v_X.

Condition (4) alone is not claimed to give the retained combined theorem:
it need not persist when q is replaced by q−v_rem.

## 5. A uniform potential certificate with no singular quadrature

The map z↦L(z) sends radius s to r=s(a+bs²). Its planar Jacobian is
(a+bt)(a+3bt), where t=s². Thus the weighted pushforward densities
whose inverse-distance potentials are (8) are

    f₁(r)=t e^(−t)/[π(a+bt)(a+3bt)],
    f_ν(r)=f₁(r)(t−2)²/2,       r=√t(a+bt).             (14)

Both have total planar mass one. The checker bounds these densities
above by constant heights on 2560 annuli, with endpoints

    s_i=i/512, t_i=s_i², R_i=s_i(a+b s_i²), 0≤i≤2560.

Every R_i is rational. Heights c_i are exact rational upper bounds,
rounded upward to multiples of 2⁻⁷² from 96-bit Arb enclosures.
For f₁, monotonicity avoids interval overestimation: its t derivative
has the sign of

    a²−a²t−(4ab+3b²)t²−3b²t³.                           (15)

This polynomial decreases strictly from a positive to a negative value
on [0,1], so it has exactly one positive root. The checker brackets that
root by 72 exact rational bisections and uses the appropriate endpoint
of each interval, or the root enclosure. For f_ν, direct interval
evaluation of (14) on each t interval suffices.

Let D_R(x) be the potential of unit density on the disk of radius R.
For real x≥0,

    D_R(0)=2πR,                     D_R(R)=4R,
    D_R(x)=4R E(x²/R²),                         0<x<R,
    D_R(x)=4x[E(m)−(1−m)K(m)], m=R²/x²,          x>R,  (16)

where E,K are complete elliptic integrals in the parameter convention.
For completeness, polar coordinates centered at x cancel the inverse
distance against the area element. Inside the disk the outward ray
length is −x cos θ+√(R²−x² sin²θ); integrating gives the interior formula.
Outside, integrate the chord length 2√(R²−x² sin²θ) over the directions
meeting the disk. Substitution sin θ=(R/x)sin φ gives the exterior
formula. Thus (16) is a direct geometric identity.

Each D_R decreases with x: this follows from E inside the disk and from
increasing distance to every point of the disk outside it. With c_N=0,
the annular upper envelope has potential

    V(x)=Σ_i (c_i−c_(i+1)) D_(R_(i+1))(x).              (17)

The coefficients are exact signed rationals. On any shift interval
[l,h], bound positive terms at l and negative terms at h. This encloses
the whole interval, including every circle on which the original
angular integrand is singular. Arb evaluates (16); no sampled
quadrature or floating-point error estimate enters the acceptance.

The adaptive rational interval cover proves (9) on [0,R_N]. The support
radii R_N are 2587/125 at the peak, 1691/80 at the flank, and 4373/200
at the upper row. Beyond R_N the envelope is nonnegative and compactly
supported inside that disk, so its potential decreases. The endpoint
bound therefore covers every x≥R_N. The tails from t>25 are added
uniformly before accepting any interval.

### Tail enclosure

If a nonnegative planar density g has mass M and essential supremum D,
then, for every x,

    ∫g(y)/|y−x| dy ≤ 2√(πDM).                           (18)

To derive it, write the left side as
∫₀^∞ mass(B(x,r)) dr/r² and bound the ball mass by min(M,πDr²).
Split the integral at √(M/(πD)).

For f₁ the mass beyond t=R is (R+1)e^(−R). For f_ν it is
(R³/2−R²/2+R+1)e^(−R). At R=25 both densities are decreasing:
f₁ by (15), and for f_ν its logarithmic derivative is at most
1/25+2/23−1<0. Their values at 25 therefore bound their tail suprema.
Equation (18) gives the following common tail bounds at all three rows

    Q/P tail < 1.036·10⁻¹⁰,
    ν tail   < 2.866·10⁻⁸.

These are included in the checker, not discarded. The accepted shift
interval counts are:

| Profile | U₁ intervals | U_ν intervals |
|---|---|---|
| Peak | 40 | 29 |
| Flank | 15 | 16 |
| Upper | 13 | 19 |

The adjacent JSON records every interval,
its upper enclosure and its strictly positive margin, including all
radial tail allowances.

## 6. Reproduction and scope of the computer check

From this worktree's root:

```sh
python3 -I research/conjecture-K/code/progress-2026-11-15-codex-a7c4/odd_control.py \
  --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

Omit `--dependency-dir` if python-flint is already installed. The replay
uses python-flint 0.9.0 at 96-bit precision and takes a few seconds.
The default command is read-only. To save a fresh full transcript, add
`--output <path>`; `odd_control.json` was generated with this option.
The saved transcript is not read by the checker. All heights, the
critical-point bracket, elliptic integrals, shift intervals, radial
tails and acceptance margins are recomputed. The transcript includes
the checker SHA-256.

The acceptance proves precisely the two scalar inequalities (9) at each
of the three listed rows; all six are freshly recomputed in the same run.
The analytic work in §§2–5 is needed to turn them into (1)–(5) and the
retained versions. The joint-content worker independently re-derived the
analytic argument, inspected the checker and replayed its peak case
within this session; that is peer checking within the session, not
external review. External review remains pending.
