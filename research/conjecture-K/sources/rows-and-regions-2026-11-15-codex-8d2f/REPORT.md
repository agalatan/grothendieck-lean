<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-rows-and-regions-2026-11-15/REPORT.md, 2026-11-15 13:37; Agent-ID: codex-8d2f. -->
# Phase 0 decision: one new row gives a usable first consumer

Agent-ID: **codex-8d2f**. 15 November 2026. Research handoff only; no tracked
repository edits. **Phase 1 has not started.**

The complete replay from tracked checkout inputs plus this standalone folder
passed in **79.42 seconds**; see `clean_checkout_verification.log`.

**Recommendation:** first target **1.40171 at the fixed witness
epsilon=149/200**, reusing the existing Lean outer rows. Only **one new
all-sector row** is needed. Its benchmark and the complete *conditional*
consumer bookkeeping now pass fresh interval/exact checks. The all-sector
premise at that row remains **open**; no new unconditional lower bound is claimed.

| Needed new row M | Exact value |
|---|---|
| epsilon | 149/200 |
| ell | 3391/4000 = .84775 |
| beta | 90686/625000 = .1450976 |
| a=ell-2 beta | .5575548 |
| response interval | [21/25,1711/2000] = [.84,.8555] |
| **S_M, fresh C enclosure** | **[2750823643/2000000000, 6877059109/5000000000]**, i.e. [1.3754118215,1.3754118218] |
| requested all-sector error | **eta_M=1/10000** |
| largest allowable error using that S upper | **270324292079477/2610684875000000000** = .0001035453549634086... |
| resulting consumer target | **K_G > 140171/100000 = 1.40171**, conditional on M |

**P + C, author only:** the 19 inherited scalar row caps, the inherited crude
row, and M cover all t in [0,sqrt(pi)/2] at the **same epsilon**, with 1773
adjacent rational cells and no gaps. Their accepted maximum is
0.7134113275357202..., strictly below 100000/140171. Without M this inexpensive
cover leaves [.84,.8555]; a finer diagnostic leaves [.8404,.8553]. Thus one
new row suffices within this construction. This is not a global minimality
claim about every conceivable certificate or a new replay of the full Lean
dependency closure.

The theorem required at M covers **every finite dimension and arbitrary
sharing**, at least for actual responses in that interval. A sufficient
stronger domain is every genuine cubic with

    u <= (3725/3782)^2 (463/10000),
    u+V+W_Q+W_P+W_nu <= (3725/3782)^2 (80051/1000000).

For u>0, all 0<=chi<=42 must be covered. At the left endpoint, the normalized
response caps are below .046265316 and .080050026, respectively. **The peak
energy range already suffices after scaling.**

## What is missing, and what can be avoided

**The missing item is a new-profile all-sector estimate**, not a larger energy
range. Existing weighted scaling 3.17 correctly handles lambda=3725/3782<1,
with no positive multiplier-cost surcharge. But the known triangle/support
profile transfer loses too much:

| Source peak result / available transfer | Bound for error at M |
|---|---:|
| profile loss alone | .000704773315774 |
| 11.51 A-only, with recosted k_lambda | .000723742031824 |
| 7.4.10 joint A/B, **conditional on (P)** | .000753389391924 |
| hypothetical full peak theorem with eta=1/10000 | .000803266176694 |
| M's maximum allowance | **.000103545354963** |

These are outward rational budgets displayed in rounded decimals. Even an
error-free peak all-sector theorem would not make this particular profile
estimate fit. The new profile is outside 3.15 and 11.53. For a source error
1e-4, the profile loss must be at most **5.0524940433e-6** to fit M's full
allowance; delivering the chosen eta_M=1e-4 leaves only
**57/37820000 = 1.50713907985e-6** for profile transfer.

The remote cap at this new profile is not supplied either: 3.3 is at the
peak, and 3.11/3.15's available transfer is too weak here. A fresh remote
anchor, or a direct all-sector response bound that bypasses a separate remote
estimate, is needed. The pointwise joint premise and the odd estimate must
also be valid at the new profile; existence at the peak alone does not imply
this. No use is made of the frozen partial gamma=1/5 certificate.

**Avoidable for this first consumer:** new K claims outside R; new exterior
t estimates; a sigma*=0 corner theorem; a uniform proof over every row in R;
the canonical flank or upper row as such. All responses outside [.84,.8555]
are already covered by the inherited fixed-operator rows. Some inherited rows
have profiles outside R, but their existing certificates require no new
Conjecture-K assertion there. The new row has v_*>.03228257, so its Gaussian
maximizer is strictly nonzero.

**Phase 1 decision proposed:** use M as the one-profile target. First try to
replay/re-optimize the remote Stein certificate at M and test the retained
joint/odd trial at that same profile. Accept continuation only if the resulting
total all-sector budget is below 1e-4. The generic peak profile transfer has
already failed the budget test, so it is not a certificate plan by itself.
Consumer formalization can then use the exact cover here and the existing
Lean scalar rows. The peak (P) and full odd-sector premises remain with their
current owners; this handoff does not take them over.

## Why the peak interval alone is insufficient; the larger target

**P:** 8.1 only covers a subinterval of actual responses. Responses with t=0
exist, and t can range to sqrt(pi)/2. A single central row theorem is not a
global witness norm cap. Even with eta=0 the existing peak row on [.84,.851]
does not attain the 1.4022 threshold at its left endpoint.

Keep epsilon=1891/2500 if the target is **1.402**. The exact 8.1 allowance
remains 166713115892493/1656988750000000000; there is no reason to reduce the
peak owners' 1e-4 target. However, the old epsilon=.745 row caps cannot simply
be minimized with this row. We derived a valid operator-change bound that
keeps and recompletes the old h-square, and evaluated it exactly. The cheap
reusable envelope plus 8.1 still leaves these conservative gaps:

    [0,.418], [.618,.664], [.696,.84], [.851,.863].

These are **gaps in that envelope**, not lower bounds on the true response
values. Better exterior arguments may shrink them. They demonstrate why the
same-operator first improvement is substantially cheaper.

Here are explicit **N-only profile proposals** for some shoulders at this
fixed epsilon. They are not a complete cover, and their printed S intervals
are numerical proposals, not accepted C enclosures. Exact conditional budgets
for their proposed S upper endpoints are in `ledger_result.json`.

| t interval | ell, beta | S (N) | usable proposed eta | eta_max (N) | Missing beyond peak |
|---|---|---:|---:|---:|---|
| [.81,.83] | .800, .1305 | 1.3071243322 | .00020 | .0002126833 | new remote/profile bounds; normalized u cap .07595, total .12995 |
| [.83,.84] | .823, .137 | 1.3406058970 | .00007 | .0000736833 | new remote/profile bounds; u cap .05616, total .09686 |
| [.84,.851] | .8456, .1432 | 1.3739535256614--1.3739535256616 **inherited C** | .00010 | .0001006121 | peak full all-sector premise |
| [.851,.86] | .867, .149 | 1.4058605411 | .00013 | .0001374755 | new profile; energy domain fits, triangle/support loss .00101614 |
| [.86,.87] | .877, .152 | 1.4206263484 | .00020 | .0003910426 | upper row remote/profile bound; energy domain fits, profile loss .00145353 |

The lower two rows require larger normalized response energies than the peak
box. The left-shoulder profile transfer is particularly poor because it moves
in a negative profile direction. The remaining exterior intervals still need
work even if all entries in this table succeed. A proof for the entire box R
would not automatically settle those omitted response/energy regions.

For comparison, at epsilon=.745 a single alternative row
(ell,beta)=(.847,.1448919) on [.837,.857] numerically allows eta≈5.0403e-5
for **1.40175**. This is a stricter error target and needs normalized energies
up to .049234/.085110. It is not the recommended first step.

## Present-witness ceiling and numerical checks

**N, fresh:** a direct Rice quadrature/row optimization at 400 and 800 radial
nodes agrees to about 3e-14 in the central saddle cap:

| epsilon | central diffuse-model cap | reciprocal |
|---|---:|---:|
| .745 | .7132911728715 | 1.40195201908 |
| .750 | .7131843089342 | 1.40216208836 |
| .7564 | .7131354667923 | 1.40225812145 |
| .760 | .7131512667275 | 1.40222705428 |

Optimizing this model gives epsilon≈.7563721594 and reciprocal
**1.402258123278**. This reproduces the scale of the **recorded** universal
cubic-family ceiling 1.4022581233 (STATUS 12.2 / overview); that older ceiling's
analytic construction is not re-certified here. Our computation is a central
Gaussian saddle diagnostic, not a proof of the full norm or of attainability
of this lower bound. The exact optimum of the unrestricted witness remains
unresolved. STATUS 8.4's approximate 1.40221 is an older moment-envelope
calculation, not the intrinsic ceiling and not a completed consumer.

## Error ledger and trust boundary

- **C:** rational endpoint comparisons, exact coverage, exact target comparison,
  pi enclosure and response caps. All interval cells include their boundaries.
- **C:** fresh outward Rice integration at M, its nonzero maximizing-variance
  bracket, and S enclosure. No floating optimizer participates in acceptance.
- **P, author only:** conditional consumer composition, generalized benchmark
  concavity argument, and the explicit change-of-operator bound; see `NOTES.md`.
- **Inherited:** reviewed retained row/scaling/energy theorems and the established
  Lean old-row caps. Hashes pin their local source inputs; the verifier does not
  recompile Lean or re-prove all inherited Gaussian/Stein facts.
- **Open:** premise M, the full peak all-sector premise, and the profile transfer
  that could connect them. A PASS in this folder does not close these premises.
- With D_+, charge the entire remote error (11.23). Do not attenuate it, double
  count the A contribution already in the joint bound, or use the regional
  direct odd-sector theorem as a full-domain theorem. Any quadrature error in
  an eventual all-sector theorem must fit inside eta_M, not be added afterwards.
- The S upper endpoint and inherited capPad are already charged in this ledger.
  The new-row margin after eta_M is >3.5453e-6; the smallest global cover margin
  below 100000/140171 is >3.0021e-6.

Coordinated on #436 with codex-a7c4 and codex-91d4. The latter confirms its
regional theorem is reviewed P+C while its full peak premise is still open;
the new-row parameters and failed transfer have been recorded separately in
its consumer interface. The former's 8.1/3.17/11.53 work is used with its stated
hypotheses. No integration or new global theorem is requested at this stage.

The earlier A-content continuation is frozen. Its clean-checkout portability
replay passes in **216.53 seconds**, reading the tracked tilted-sector package
and one bundled historical witness; all chi through u=1/80 and **40 gaps** are
unchanged. Its `README.md` documents the portable command.
