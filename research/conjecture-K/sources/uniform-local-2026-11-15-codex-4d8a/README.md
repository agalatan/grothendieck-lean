<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/README.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- conjecture_k_uniform_local_codex_4d8a/README.md; Agent-ID: codex-4d8a -->
# Conjecture K: uniform local theorem and certified joint cone

15 November 2026. Agent-ID: codex-4d8a.

The principal result is a dimension-independent local proof of raw Conjecture K at the repository's peak parameters. Two additional results give an explicit global energy cone and a rigorous reduction of the remaining conditional-amplitude domain. Full Conjecture K and a new Grothendieck endpoint remain open.

## 1. Main theorem: the diffuse Gaussian boundary is uniformly stable

Use a=699/1250, b=179/1250, p=2500/1891 and L=Z(a+b|Z|²). Decompose a genuine cubic as G=q+h, where q is the remote H_(2,1) component and h comprises every visible A/B/Q/P/ν sector. All remote coefficients may share all their Gaussian variables. Set

    u=E|q|²,  δ=E|q|⁴−2u²,  e=E|h|²,
    S=max_v [2E|L+sqrt(v)W|−pv],  v*=the maximizing variance.

There exist positive constants r,δ₀,e₀,c₁,c₂,c₃, independent of dimension, such that

    |u−v*|<r,  0<δ<δ₀,  e<e₀
    imply  S−Λ(q+h) ≥ c₁(u−v*)²+c₂δ+c₃e > 0.

Here Λ(G)=E|L+G|+E|L−G|−pE|G|². The conclusion does not use an auxiliary Gaussian bath and includes unrestricted complex A/B covariance and both phases of ν. The neighborhood's numerical size is not evaluated.

The new reusable lemma, valid for every real third-chaos F and C³ test function with bounded third derivative, is

    ||Π₁ φ(F)||₂ ≤ (5/4)||φ'''||∞ κ₄(F)^(3/4).

It makes the visible first variation O(δ^(3/4)sqrt(e)). The weighted Hessian comparison costs O((δ^(1/4)+sqrt(δ))e), and a uniform unbuffered norm expansion has remainder O(e^(5/4)). Young's inequality leaves only O(δ^(3/2)), absorbed by the existing remote deficit of order δ.

Read `remote-dependence/UNIFORM_LOCAL_K.md` for the complete proof. The inherited remote deficit and Gaussian visible Hessian proofs are copied unchanged under `inputs/`. The former uses Mansanarez–Poly–Swan, *Edgeworth expansion on Wiener chaos*, Theorem 1.2, https://arxiv.org/html/2510.14002v2 . The source theorem was checked directly. Its unevaluated constant is one reason the new thresholds are existential.

## 2. Explicit all-amplitude joint region

Let V=E(|r_A|²+|r_B|²), W=E(|Q|²+|P|²)+|ν|² and S_r=|r_A|²+|r_B|². For the precise centered defect F_joint defined in `matrix/CERTIFIED_CONE.md`,

    V≤W/1400 implies
    E F_joint ≤ −W/4000−(3/2)V²−(1/2)E[|q|²S_r] ≤ 0.

This condition is on global energies, not on every sampled tuple. It allows arbitrary sharing, all amplitudes and arbitrary ν. Within the separately stated domain of the inherited frozen assembly, it supplies the missing averaged premise and gives its retained cap below S+49.36e−6.

The key sharp finite-amplitude scalar inequality is proved in `matrix/SHARP_TRADEOFF.md`. A fresh outward-interval computation covers all 320 shift intervals on [0,8]; the remaining half-line is analytic. The maximum certified matrix bound is 1.3134445486502955, below the exact rational cap 1.313445. Sources, inputs, output cells, hashes and replay scripts are included. The stronger numerically suggested cone is explicitly unproved.

## 3. Remove large driver amplitudes at explicit cost

For any two jointly proper complex Gaussian drivers and V>0,

    Pr(S_r≥xV)≤exp(−x),  x≥3.

The rank-one case attains equality. A global positive-part cap on the compensated defect then gives

    E[(F_joint)_+ 1{S_r>16V}] < 2.5e−7.

Thus, in the inherited response domain, the unresolved central obligation can be restricted to S_r≤16V with an error budget of 0.25e−6. When u≥0.04, this cutoff is at most 0.640816, instead of 2.2. The central obligation is still open. Exact shared-chaos weighted-tail bounds are also proved in `variational/DRIVER_TAILS.md`.

## Verification and provenance

- Independent workers in this session re-derived the local proof, scalar tradeoff and tail reductions. `analytic/AUDIT.md` records the local and cone audit. This is not external peer review or Lean verification.
- Exact BigInt checks pass for nine integer third-order tensors and 126 polynomial integration-by-parts identities. These checks supplement the general analytic proof.
- Exact rational checks pass for the scalar tradeoff, radial constants, driver tails, matrix-cell coverage and energy-cone arithmetic. The full 320-cell interval run completed successfully with GCC 14.2, four workers, in 210.85 seconds.
- The root reviewer inspected the new C++ diff against the previously reviewed checker: only the radial subtraction and two compensation coefficients change mathematically; all interval derivative and quadrature bounds are freshly recomputed.
- Baseline repository: https://github.com/agalatan/grothendieck-lean . Reviewed PR #447 head: e6ebb9db478350fb5be73c6d9e4548df158f192e; its master base was 6bb44599190397f806d2db89b25df4e6785b758e. `INPUTS.json` identifies the unchanged included source documents. `PACKAGE_MANIFEST.json` hashes every delivered file except itself.
- No tracked repository file or Lean theorem was changed. Earlier analytic cones are preserved in `analytic/ENERGY_CONE.md`. Floating searches in `root/`, `nearstar-numerics/` and `matrix/tradeoff_probe.*` are exploratory only and prove nothing.

## Replay

From the extracted package root, `node run_checks.mjs` runs the quick exact checks using Node.js and Python 3, with no third-party packages. For the full numerical replay, run `python3 matrix/run_certificate.py --workers 4` (requires g++). It creates a separate recomputed-results directory and leaves supplied interval outputs intact.

The next substantive gap is the central finite-amplitude, nearly-even region. Making the local thresholds numerical would require explicit remote-remainder and weighted-kernel constants; the present proof does not claim that this alone closes the remaining region.
