<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/route2/REPORT.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Route 2 continuation for claude-b9ee

Agent-ID: **codex-91d4**. 15 November 2026. Refs [task #426](https://github.com/agalatan/grothendieck-lean/issues/426).

**There is a new global A-content theorem, a stronger certified B-content envelope, and a certified union of joint-secant regions. The full joint theorem remains open.** Everything here is handoff research, with paper proofs and numerical certificates pending Claude-side review; none is a new Lean theorem or Grothendieck bound.

## New results

Let `a=699/1250`, `b=179/1250`, `p=2500/1891`, `L=Z(a+b|Z|²)`, and let `q` be any finite-dimensional genuine complex Gaussian Wick cubic of bidegree `(2,1)` on remote coordinates. Put

    u=E|q|² ≤ .0463,
    δ=E|q|⁴−2u²,
    D=2E|L+sqrt(u)W|−2E|L+q|,   D₊=max(D,0),

where `W` is independent standard complex Gaussian. All sharing between `q` and remote linear shell drivers remains unrestricted.

**A content.** The coefficient improves from `.30` to `.28` at the same tilt, tolerance and energy range:

    ‖c_(A,3/5)(q)‖² ≤ (7/25)D₊ + 6·10⁻⁶.

Five new scalar OU barriers improve the energy-dependent fourth-cumulant envelopes. Fresh source integration, directed angular bounds, 119 rechecked spectral duals and a fresh low-energy moment cover give an exact union of **196 rectangles over 45 energy strips**. The inherited A-only global secant then improves its sector coefficient to `52948/59009 ≈ .8973`, keeping the old additive allowance. See [A_CONTENT_PROOF.md](a_content/A_CONTENT_PROOF.md) and [verify_a.py](a_content/verify_a.py).

**B content.** For the raw B profile

    c_B=Π_(1,0) E_Z[(Z²/sqrt(2)) conjugate(ph(L+q))],

new B-specific source and resolvent certificates prove:

| Closed energy interval | Certified coefficient in `‖c_B‖² ≤ coefficient · δ` |
|---|---:|
| `[.0005,.01]` | `.061` |
| `[.01,.02]` | `.056` |
| `[.02,.03]` | `.052` |
| `[.03,.04]` | `.049` |
| `[.04,.0463]` | `.046` |

The exact rational coefficients in the certificate are slightly stronger. Each source integral and all 2,500 rational Hermite cells are recomputed. The previous Phase-0 coefficient `436959/3125000 < .14` remains available below `.0005`; there `δ≤42u²` already makes B content smaller than `4·10⁻⁶`. See [B_CONTENT_PROOF.md](b_content/B_CONTENT_PROOF.md) and [b_barrier_verify.py](b_content/b_barrier_verify.py).

**Joint secant.** At tilt `(3/5,0)` define

    h=(|Z|²−2/5)α+Z²conjugate(β)/sqrt(2),
    Rem=2E_Z[|L+w+h|−|L+w|−Re(h conjugate(ph(L+w)))],
    R=sqrt(|α|²+|β|²).

The proposed cost `.23 I` means

    Rem ≤ (p−.59)|α|²+(p−.23)|β|².                     (J)

It is now proved on the union of the following regions, uniformly in all unmentioned parameters and phases:

- `|w|≥7/2`, with arbitrary amplitudes;
- `R≥5`, with arbitrary core;
- `R≤1/32000`, with arbitrary core;
- `|β|≤|α|/21` or `|α|≤|β|/56`, with arbitrary core and amplitudes.

For small amplitudes, a new interval cover proves zero-amplitude common cost `.235` on all `|w|≤3.5` using both real Hessian blocks. An exact uniform third-derivative bound is less than `480`; integration of the doubled secant contributes the factor `1/3`, extending the cost `.23` to the stated ball. Exterior arguments include both infinite tails. See [EXTERIOR_PROOF.md](secant/EXTERIOR_PROOF.md) and [SMALL_AMPLITUDE_PROOF.md](secant/SMALL_AMPLITUDE_PROOF.md).

## What still prevents the joint conclusion

The Phase-0 budget would close if one proved A content `.15 D₊+6·10⁻⁶`, B content `.06 D₊+4·10⁻⁶`, and (J) globally. **None of these three full premises is established here.** The A theorem above has `.28`, and the B theorem is a fourth-cumulant envelope, not a deficit bound.

The uncovered joint-secant set is now precisely contained in

    |w|<7/2,
    1/32000<R<5,
    |α|/21<|β|<56|α|.

After simultaneous rotation this is a bounded region with five real parameters. The small-amplitude ball removes its singular endpoint, but its very small radius still makes a direct absolute-error cover expensive. No large compact search was launched while the content budget remained unresolved.

At `u=.0463, χ=δ/u²=3`, the new clean B envelope gives about `.0002958`, while the old certified deficit lower bound makes the proposed `.06 D₊+4·10⁻⁶` allowance only about `.00005471`. This compares two estimates; it is **not a counterexample cubic**. Signed-resolvent probes show that evaluating the current uniform Hessian supremum more accurately is insufficient by itself. Plain Cauchy–Schwarz also loses substantial genuine-chaos information. The exploratory stronger deficit and coupled-content tests are recorded separately in [DIAGNOSTICS.md](DIAGNOSTICS.md), with N-only status.

Concurrent work in [PR #428](https://github.com/agalatan/grothendieck-lean/pull/428) proposes a different retained-quartic joint target that uses the old `.30` A theorem. Its pointwise premise also remains open. It was inspected for context, but its conditional conclusion is not used in any certificate here.

## Review and replay

Start with the three proof notes above. Root independently checked the B source, tails and comparison argument, and re-derived the joint Hessian/third-derivative normalization. Separate workers within this session reviewed the A continuum assembly and the secant certificates. These are **internal checks, not Claude-side independent review**. The mathematical premises inherited from the reviewed tilted-sector package are named explicitly in each proof; executable scalar checks do not reprove those analytic theorems.

For a fresh full replay, from this directory:

    python3 -I verify.py --dependency-dir /path/to/python-flint/site-packages

Use Python 3.12 with `python-flint` and `clang++`. If `python-flint` is installed normally, omit `--dependency-dir`. On this laptop the existing runtime is available read-only at:

    /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies

The wrapper rebuilds C++, recomputes all accepted source integrals and dual inequalities, checks the exact A-domain union, and replays the secant regions. Numerical search scripts are outside the acceptance path. See `replay/RESULT.json` and the component logs for timings and outcomes. `MANIFEST.json` records immutable source/input hashes and generated outputs. Keep the containing Phase-0 folder with this continuation: it supplies the bundled interval helper and old dual candidates.

No tracked repository files, Lake configuration, Lean source or tracked README were changed. No full build, CI job, push or PR was started. The research baseline is master `be905f1cae86164ad9f09939bb63cb94e4ba3024`. A final sync reached `7ec0d234b`; that delta prunes unrelated upper-bound modules and does not change `research/conjecture-K` or these inputs.
