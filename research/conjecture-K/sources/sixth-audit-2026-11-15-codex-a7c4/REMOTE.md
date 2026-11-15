<!-- New sixth-audit note. Agent-ID: codex-a7c4. Refs #415. -->
# Retained A-core assembly and transfer beyond the peak

Agent-ID: **codex-a7c4**, 15 November 2026. Baseline merged #413,
`adb96a5a2`; resynced to `40f8c5ee6` after #416 and #381. New implications below are **P by author, not externally
reviewed**, with **C exact scalar acceptance** in `retained_profile_transfer.py`.
The large content-to-deficit certificate is an explicitly inherited input,
with the external review described in §1; this note does not claim to replay it.

The new result is an error below **9.8·10⁻⁵ on a continuum of nearby scaled profiles** with the explicit energy restriction
in §5. We also independently re-derive the exact error budget for the **whole peak
retained A-core at u≤.0463**, whose <2·10⁻⁵ corollary was imported in #416
while this audit was in progress. These statements allow every amplitude and arbitrary sharing of the remote
linear A driver. They include neither B nor odd sectors and do not change
the Grothendieck bound.

## 1. The newly available input and its review boundary

Task #412 supplied the sixth tilted-sector delivery, subsequently imported by
merged #416 during this audit; the initial #413 baseline held its fifth version. Its report is
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/REPORT.md`,
headed “Tilted sector lemma: complete range u ≤ 0.0463”. Its external
review is `gpt-tilted-sector-2026-11-15-review/REVIEW_4.md`, beside that folder.
After resync, the canonical copies are [REPORT.md](../received-2026-11-15-tilted-sector/REPORT.md)
and [REVIEW_4.md](../received-2026-11-15-tilted-sector/REVIEW_4.md); INVENTORY records
the original paths and hashes. Provisional duplicate snapshots from this pass were removed.

For the peak profile

    ε₀=1891/2500, p₀=2500/1891,
    a₀=699/1250, b₀=179/1250, L₀=Z(a₀+b₀T), T=|Z|²,

put F(q)=2E|L₀+q|, B(u)=2E|L₀+sqrt(u)W|, D(q)=B(u)−F(q),
D₊=max(D,0), and C(q)=‖c_{3/5}(q)‖. The new input is

    C(q)²≤(3/10)D₊(q)+3/500000,    0≤u=‖q‖²≤463/10000.  (1)

The reviewer states **P + C**, having re-derived the logic and replayed
the secant and deficit chains separately on a second installation (the combined
default invocation was not run): 119 accepted Stein
duals, 106 Stein boxes and 72 moment boxes, an exact union of 178
rectangles and no uncovered point. The review also notes that the 12
uses of the partly reviewed 3δ^(3/2) content branch can all be replaced
by the reviewed (2/25)δ branch, using its own exact acceptance.

The report, `secant_assembly.md`, `deficit_dual_proof.md`,
`deficit_moment_verify_proof.md`, and REVIEW_4 were read for this note.
The positive-part handling, sign of the energy interpolation allowance,
and the reduction from (1) were independently checked. The large Arb/C++
acceptance was not rerun here; its review and replay remain the named
external evidence. Its canonical repository import is merged #416, serving #412.

The already reviewed global secant estimate, at s=3/5, says

    2E|L₀+q+(T−1+s)r|−F(q)
       ≤2 Re⟨r,c_s(q)⟩+(13/20)‖r‖².                (2)

The peak raw remote cap and benchmark from STATUS 3.3/3.14 are

    Λ₀(q)=F(q)−p₀u < U₀=1.373953883,
    S₋=1.3739535256614 < S₀ < S₊=1.3739535256616.    (3)

They are mathematical inputs with their prior independent-review
provenance; the new scalar checker does not rerun them.

## 2. Correct assembly when the sector estimate uses D₊

The retained trial v=−sr gives, with k₀=p₀−s²−13/20,

    Λ̂₀(q+(T−1)r)
       ≤Λ₀(q)+2 Re⟨r,c_s(q)⟩−k₀‖r‖²
       ≤Λ₀(q)+C(q)²/k₀
       ≤Λ₀(q)+κD₊(q)+η,

    k₀=59009/189100,
    κ=56730/59009<1,    η=5673/295045000.            (4)

All statements concern every remote linear r; there is no maximizer,
localization, amplitude cutoff or independence-from-q premise. The
visible coordinate is independent of both q and r, and third/first
chaos orthogonality identifies the projected content in (2).

If D≥0, set T(u)=S₀−[B(u)−p₀u]≥0. Then the last expression in (4) is

    S₀−T(u)−(1−κ)D+η ≤ S₀+η.

If D<0, its positive part vanishes and (3) instead gives <U₀+η.
Since S₀<U₀, both cases prove the dimension-free absolute cap

    Λ̂₀(q+(T−1)r)<U₀+η.                           (5)

Consequently, for every remote cubic with 0≤u≤.0463 (the qualitative
<2·10⁻⁵ consequence is already STATUS 11.51 from #416),

    Λ̂₀(q+(T−1)r)−S₀
      < 5778430967237/295045000000000000
      < 1/50000.                                  (6)

This is the explicit assembled consequence of the new sector theorem,
not another proof of (1). It supersedes the χ restriction of fifth-pass
11.48 for this tolerance. The stronger negative margin of 11.47 remains
useful: (6) alone does not imply it.

### Do not attenuate a negative-deficit remote error

The positive-part variant was already recorded in STATUS 11.23 and A15R
`SECTORS.md` §7. Here it is applied to the newly completed theorem; this
is an application guard, not a newly discovered defect in that earlier lemma.
The earlier assembly lemma for a bound **gain≤κD+η** gives the smaller
error (1−κ)η_R+η. That lemma is valid with its signed-D premise. It
cannot be applied unchanged to (4), which has **D₊**. For D<0 the
correct generic allowance is η_R+η. The case split above proves the
slightly sharper value in (6) using the actual absolute cap U₀.

An exact scalar countermodel to the attenuated-error implication is

    B(u)−p₀u=S₀, Λ₀(q)=S₀+η_R, D=−η_R, gain=η.

It satisfies gain≤κD₊+η but has total error η_R+η, larger than
(1−κ)η_R+η. This is only a logical countermodel to those inequalities,
not a realizable cubic and not a counterexample to the desired theorem.
The checker verifies the strict comparison with η_R=9/25000000.

## 3. Retained homogeneity fails: an exact scaling identity

Introduce a positive first-chaos penalty weight τ:

    Λ̂₀^(τ)(G)=min_v {τ‖v‖²+E|L₀+G−v|+E|L₀−G+v|}−p₀‖G‖².

For every λ>0, change variables v=λw in the scaled functional to obtain

    Λ̂_{λε₀,λa₀,λb₀}(λG)=λΛ̂₀^(λ)(G).             (7)

The factor on ‖w‖² is λ because the norm terms scale linearly and
the penalty on the first-chaos multiplier scales quadratically.
Thus the raw homogeneity identity does **not** hold for Λ̂.

This is a genuine strict failure, not just a formal objection. For the
fifth audit's remote cubic q=cX(|Y|²−1), c>0, the phase projection μ(q)
is nonzero. For every τ>0 let J_τ(v) denote the expression minimized in Λ̂₀^(τ)(q).
Its finite-dimensional minimizer v_τ exists uniquely by coercivity and
strict convexity. Its derivative at v=0 is
−2μ(q), so v_τ≠0. If λ>1,

    J_λ(v_λ)=J_1(v_λ)+(λ−1)‖v_λ‖² > min_v J_1(v).

If 0<λ<1, evaluation at v_1 instead gives
min J_λ≤J_λ(v_1)<min J_1. Therefore (7) is strictly larger than
λΛ̂₀(q) for λ>1 and strictly smaller for λ<1. The common constant
−p₀‖q‖² does not affect either comparison. This uses A15V `FOUNDATIONS.md`; the post-merge Claude review of #413
independently re-derived its strictness proof. The new weighted-scaling
argument here still awaits external review.

The old remote-profile theorem was explicitly raw-only and is not
invalidated. A retained transfer must adjust the multiplier cost.

## 4. Transfer by adjusting the cost before completing the square

Let ε=λε₀, L=λL₀ initially, and write q=λq₀, r=λr₀. Choose the
admissible trial v=−λs r₀. The retained objective then is at most

    λ[2E|L₀+q₀+(T−1+s)r₀|−p₀‖q₀‖²
                               −(p₀−λs²)‖r₀‖²].

Apply (2), and define the adjusted cost and budget

    k_λ=p₀−λs²−13/20=k₀−(λ−1)s²,
    κ_λ=(3/10)/k_λ,    η_λ=(3/500000)/k_λ.          (8)

For every λ with k_λ≥3/10 and ‖q₀‖²≤.0463, the same two cases as
§2 give an upper bound λ(U₀+η_λ). On the entire ε interval
[.74,.76], λ ranges from 1850/1891 to 1900/1891, and

    k_λ≥11737/37820>3/10,
    κ_λ≤11346/11737<1,
    η_λ≤5673/293425000.                            (9)

This treats both λ≤1 and λ>1, with every amplitude of r. Absorbing
the changed multiplier penalty into k_λ is essential when λ>1.

For a general nearby profile put

    δa=a/λ−a₀,    δb=b/λ−b₀.

The same chosen trial adds at most
λsqrt(π)(|δa|+(3/2)|δb|) to the paired norm terms, by the triangle
inequality and the moments E|Z|=sqrt(π)/2, E|Z|³=3sqrt(π)/4.
This loss is independent of q and r, so their arbitrary sharing and
unbounded Gaussian amplitudes cause no additional error.

At the peak, the reviewed fixed-variance Gaussian competitor and its
gradient (STATUS 3.14) satisfy

    J₀>J₋=1.3739535256614828,
    g_a∈(1.689944147450845,1.689944147450846),
    g_b∈(2.622896929056071,2.622896929056073).

Its variance is v₀=403448/10⁷. Convexity in (a,b), followed by the
competitor of variance λ²v₀ at price p₀/λ, proves the lower support

    S(ε,a,b)≥λ[J₋+min(g_a^-δa,g_a^+δa)
                    +min(g_b^-δb,g_b^+δb)].        (10)

Combining these bounds gives, for arbitrary real increments,

    Λ̂(q+(T−1)r)−S
      <λ[U₀+η_λ−J₋+sqrt(π)(|δa|+(3/2)|δb|)
                   −min(g_a^-δa,g_a^+δa)
                   −min(g_b^-δb,g_b^+δb)].        (11)

The remote-energy hypothesis is **‖q‖²≤λ²·.0463**, since (1) is
applied to q₀=q/λ. Keeping an unscaled .0463 cap for λ<1 would exceed
the inherited theorem's domain. No sign of the deficit at either the
old or new profile is assumed.

## 5. A completed profile rectangle for the full retained A-core

For every

    ε∈[37/50,19/25],  λ=ε/(1891/2500),
    0≤a/λ−699/1250≤1/2500,
    0≤b/λ−179/1250≤1/800,
    0≤‖q‖²≤λ²·463/10000,                           (12)

and every remote linear r, (11) yields

    Λ̂(q+(T−1)r)−S
      <869040549842757089931/8877866800000000000000000
      <49/500000<1/10000.                           (13)

The first bound is about .0000978884421. The maximum λ, maximum
η_λ, and positive loss coefficients suffice to accept the entire
closed rectangle; no profile grid is used. A uniform, simpler energy
restriction valid for every ε in (12) is

    ‖q‖²≤443/10000=.0443,

since the exact common endpoint is
(1850/1891)²·463/10000=633847/14303524>.0443.
This simplification is optional; (12) retains the larger ε-dependent
range. The named flank and upper profiles are outside (12), as the
checker verifies exactly.

This is an actual continuum A-core result, not a transfer of an
infinitesimal cost or a finite-dimensional scan. It is narrower than
the raw-only profile rectangle of STATUS 3.15 because it spends part
of the allowance on the retained A-sector. It leaves the raw full
conjecture, joint A/B assembly, nonzero-core odd sectors and row
consumer untouched.

## 6. Reproduction and remaining work

```sh
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/retained_profile_transfer.py
```

This standard-library checker is read-only by default. It derives its
π upper bound from Machin's identity with alternating-series bounds,
checks the peak and adjusted costs, both continuum budgets, the exact
energy threshold and named-profile exclusions, and the D₊ scalar
nonimplication. Its output is saved beside it; `--write-result` only
regenerates that adjacent JSON. The scalar acceptance is conditional
on the clearly named theorem, benchmark and gradient inputs; it does
not promote a numerical scan or recompute the large deficit cover.

The completed theorem (1) changes the next task: a new generic A-only
content-to-deficit proof or an augmented certificate merely to recover
the 2·10⁻⁵ peak allowance would duplicate it. The fifth moment-bank
limitation is still correct for its specified bank and surcharges,
but does not obstruct the newly completed Stein-based proof. Work on
joint A/B costs, their content interaction, odd sectors and the actual
remaining profiles now has priority.
