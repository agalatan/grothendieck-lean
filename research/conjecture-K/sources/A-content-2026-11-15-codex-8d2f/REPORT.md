<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-A-content-tightening-2026-11-15/REPORT.md, 2026-11-15 13:14; Agent-ID: codex-8d2f. -->
# Tilted A content: certified low-energy prefix and partial cover

Agent-ID: **codex-8d2f**. 15 November 2026. Source checkout: `be905f1cae86164ad9f09939bb63cb94e4ba3024`.

**Frozen at the user's request.** No further tightening is pursued. The
clean-checkout replay now uses only tracked research sources plus this folder;
`clean_checkout_verification.log` records **all PASS in 216.53 seconds**,
with the same 187 rectangles, full-χ prefix `u≤1/80`, and 40 gaps.
The one input absent from the repository is bundled as
`bundled_inputs/deficit_dual_cover_witness.json`; its bytes are pinned in both
acceptance manifests. The mathematical scope is unchanged.

**New P+C, author only:** for every finite dimension and every remote cubic,
the requested bound holds with **γ = 1/5** and **η = 3/500000 = 6·10⁻⁶**
for the entire low-energy prefix `0≤u≤1/80`, at every allowed χ. Further
certified rectangles cover parts of the range above `1/80`; their exact
boundaries and the remaining gaps are in [CONTINUATION.md](CONTINUATION.md).
Common-envelope slabs `[1/100,21/2000] × [32,42]`,
`[21/2000,11/1000] × [28,42]`, `[11/1000,3/250] × [23,42]`,
and `[3/250,1/80] × [20,42]`
close the first gaps above `u=1/100`. The preceding continuation closes
the high-χ slices from `3/320` to
`1/100` with four additional global Stein duals and a longer transfer
from the `1/100` node. The added mid-energy rectangles are
`499/25000≤u≤1/50, 9≤χ≤26` and
`1099/40000≤u≤11/400, 6≤χ≤18`; an earlier one covers
`999/40000≤u≤1/40, 4≤χ≤18`. The verifier now resolves the archived Stein
package explicitly and accepts an independently supplied repository root.
The relocated full replay passed in 219.81 seconds; the current exact
union contains 187 accepted rectangles and 40 conservative gap rectangles. Gap counts
can increase when a newly covered strip subdivides an older gap.

The prior coupled certificate covers, in particular,

    37/800 ≤ u ≤ 463/10000,     3/2 ≤ χ ≤ 9/4.

These results **do not establish γ = 1/5 on the full requested domain**.
The best reviewed full-domain coefficient remains 3/10. The coupled
derivation, transfer to a nonzero energy interval and trust boundary are in
[STEIN_COUPLING.md](STEIN_COUPLING.md). The relocated replay of the scalar
inputs and exact dual is [portability_verification.log](portability_verification.log).

**N:** Before certification, the Stein-coupled resolvent relaxation at
`u=0.0463` cleared χ = 1.5, 2 and 2.25 with the existing absolute scalar
barrier. The accepted certificate uses a single dual at the energy
endpoint and exact interpolation in χ. Its energy transfer covers only
the short interval above; the continuation adds the separately certified
regions described in CONTINUATION.md.

**N:** A further sampled scan at `u=463/10000` gives negative coupled
budgets at χ = 0.1, 0.5, 1, 3, 5 and 10; at χ = 20 and 42 they are
positive by about `1.42·10⁻⁴` and `7.28·10⁻⁴`. At those last two nodes,
numerically reevaluating the earlier separate content envelope against its
saved dual pool gives negative budgets of about `−3.25·10⁻⁴` and
`−8.02·10⁻⁴`. This suggests combining the two methods, but neither scan
certifies a continuum cover or a full-domain improvement.

All intended statements here have the peak row `a=699/1250`, `b=179/1250`,
`p=2500/1891`, tilt `s=3/5`; `q` is a finite-dimensional remote complex
Gaussian Wick cubic of bidegree `(2,1)` with energy `u=E|q|²` in
`[0,463/10000]`; `D=B(u)-pu-Λ(q)`, and `D₊=max(D,0)`. The statement
is dimension-free over every such finite dimension. At `u>0` write
`χ=E|q|⁴/u²−2`; the inherited complex-cubic moment theorem gives
`0≤χ≤42`. These definitions do not assume the sign of `D`.

## First pass: what was tried

**P, author only:** orthogonality to first chaos gives the centered-profile
bound `C²≤V_k=E[|q|²(h_A(|q|²)−k)²]` for every real `k`. Unlike the
existing separate bound `C²≤γ_i u²χ`, this retains information about the
entire radial law and can be put into the same Stein dual as the deficit.
For a fixed cell the proposed target is the stronger signed inequality
`V_k+γ E h(uU)≤γ B(u)+η`; it implies the requested `D₊` statement.
Convex combinations with the existing certified `γ_i u²χ` bound are also
valid. The derivation and exact scope are in [PROOF_NOTES.md](PROOF_NOTES.md).

**N:** On two genuine cubic examples near the original difficult nodes, the
fine probes found `V_min/D≈0.093` at `(u,χ)=(0.0463,2.5)` and
`≈0.0706` at `(0.0275,11.76)`. These are quasi-Monte-Carlo estimates,
not universal bounds. The first example has identically zero actual
content by symmetry; its small reported Monte Carlo content is noise.

**N:** A radial moment-only relaxation at `(u,χ)=(0.0463,3)` is too weak.
An explicit three-point law satisfies the first three required moment
conditions exactly, yet numerical profile evaluation gives
`V_min≈0.0002067403`, `D≈0.0009216018`, and excess
`V_min−(1/5)D−6·10⁻⁶≈1.642·10⁻⁵`. This is **not a cubic** and does not
satisfy any verified Stein constraints. It rules out no theorem about
actual cubics. The moment constraints on this law are **C**, while the
profile-based excess is **N**.

**N:** Adding the archived sampled spectral Stein relaxation makes the
centered bound promising at the original node: for `γ=1/5`, center
`k=0.075` and `(u,χ)=(0.0463,3)`, the sampled signed budget is about
`−1.88·10⁻⁵`. The same test gives a positive budget at smaller χ.
Locally optimizing both the convex mixing weight and center at
`u=0.0463` gives these remaining positive budgets:

- `χ=1.5`: `+2.03·10⁻⁶`;
- `χ=2`: `+9.89·10⁻⁶`;
- `χ=2.25`: `+8.76·10⁻⁶`.

These optimizations use a finite radial grid, an unverified spline for the
new content term, numerical SOCP, and local center/weight optimization.
Positive output means these attempted candidates did not reach the budget;
it is **not** a rigorous impossibility result for the dual family or for
the target theorem. Negative output is also **N**, not acceptance.

**C, conditional on the inherited saved models and benchmark balls:** the
fixed earlier envelope pool needs coefficients greater than `0.2402212580`
and `0.2747207080` at the two original nodes with η = 6·10⁻⁶. At `γ=1/5`
the exact budget shortfalls exceed `3.39907·10⁻⁵` and `1.07151·10⁻⁴`,
respectively. These are statements about that pool, not about actual
content. The exact checker re-evaluates the saved numbers but does not
re-prove the 119 duals or recompute their benchmark balls.

## Next calculation

The coupled proof now supplies the requested link to the Stein variables
and removes this particular gap on the stated partial rectangle. The next
step is to test and certify a full energy/χ cover for that strengthened
dual. The continuation certifies additional regions but leaves gaps.

The scripts, exact and numerical replay, hashes, logs, dependencies and
timings are described in [README.md](README.md). The tracked repository was
not edited. Findings are author-only and await claude-b9ee's review.
