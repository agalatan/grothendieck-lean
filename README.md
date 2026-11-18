# The complex Grothendieck constant, in Lean

The two-sided theorem for the complex Grothendieck constant is

$$
1.401700322371 < K_G^{\mathbb C} \le 1.40457588.
$$

The upper entrypoint states that $140457588/100000000$ is admissible for every finite complex matrix. It also compares the constant with Haagerup’s proposed value,

$$
 K_G^{\mathbb C} \le 1.40457588 < 1/\gamma^\dagger, \qquad
 \gamma^\dagger=\int_0^{\pi/2}\frac{\cos^2 t}{\sqrt{1+\sin^2 t}}\,dt.
$$

The comparison uses rational bounds on the integral. [Upper theorem](Grothe/UpperResult.lean) · [Two-sided theorem](Grothe/MainResult.lean) · [Six-channel proof and build instructions](articles/haagerup/README.md).

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | [Grothendieck](https://csg.igrothendieck.org/published-works/) (Résumé, Bol. Soc. Mat. São Paulo 8) | | $K < \infty$ |
| 1984 | [Davie](https://arxiv.org/abs/1101.4195) (unpublished note; reported in Pisier's survey) | $1.33807 < K$ | |
| 1987 | [Haagerup](https://doi.org/10.1007/BF02790792) (Israel J. Math. 60) | | $K < 1.40490913\ldots$ |
| Sept 2026 | [Guo, Fang, Lu](https://arxiv.org/abs/2609.07000) | $1.35584631827168 < K$ | |
| Sept 2026 | [Heilman, Jones, Malavolta](https://arxiv.org/abs/2609.25462) | $1.4 < K$ | $K < 1.404898554746$ |
| Oct–Nov 2026 | **two-sided Lean theorem in this repository** | $\mathbf{1.401700322371 < K}$ | $\mathbf{K\le 1.40457588}$ |

## Haagerup's value is a strict upper bound

The six-channel construction places the complex Grothendieck constant strictly below
Haagerup’s proposed value $1/\gamma^\dagger = 1.4045759\ldots$. The two numerical bounds have different proofs.

| Upper bound for $K_G^{\mathbb C}$ | What establishes it |
|---|---|
| $1.40457588$ | Lean proves `Grothe.UpperSix.bound` for every finite complex matrix and discharges the six channels’ estimates. This is the upper endpoint of `Grothe.Statement.main_bounds`. [Production proof](Grothe/UpperResult.lean) · [Build instructions](#building) |
| $1.40456109$ | The paper proves domination analytically and certifies the head and tail estimates by interval arithmetic. Its Lean theorem `HaagerupBound.upper_bound` takes these facts as a `ChannelFacts` hypothesis and checks the transfer and numerical budget. [Paper](haagerup-article/main.pdf) · [Certificate verifier](haagerup-article/anc/README.md) · [Companion theorem](haagerup-article/lean/HaagerupBound/UpperBound.lean) |

The paper describes how AI helped find the reflected two-coordinate rounding and the mixture. Its numerical enclosures were reproduced with independently written code. The companion imports only Mathlib and has a [separate CI check](.github/workflows/haagerup-article.yml).

For an introduction to the upper and lower constructions, read the [overview source on this branch](docs/overview.tex) or the [PDF built from `master`](OVERVIEW.pdf).

## The constant

For a complex matrix $A = (a_{ij})$ compare two optimisation problems: over unimodular scalars,

$$C(A) = \sup_{|\varepsilon_i| = |\delta_j| = 1} \Big| \sum_{i,j} a_{ij} \, \overline{\varepsilon_i} \, \delta_j \Big|,$$

and over unit vectors in a complex Hilbert space,

$$V(A) = \sup_{\lVert x_i \rVert = \lVert y_j \rVert = 1} \Big| \sum_{i,j} a_{ij} \, \langle x_i, y_j \rangle \Big|.$$

Grothendieck's inequality (1953) says that $V(A) \le K \cdot C(A)$ for a universal constant $K$,
independent of the matrix size and of the Hilbert-space dimension. The smallest such $K$ is the
complex Grothendieck constant $K_G^{\mathbb{C}}$. Its exact value is unknown, as is that of the real
constant $K_G^{\mathbb{R}}$. The inequality governs tensor norms, absolutely summing operators, the
approximation ratio of semidefinite relaxations of quadratic optimisation, and the gap between
classical and quantum correlations in two-party Bell experiments (real case).

## What is proved

**The statement** is [`Grothe/Statement.lean`](Grothe/Statement.lean). It imports only Mathlib and holds only
definitions: C(A), V(A), Grothendieck bounds, the constant $K_G^{\mathbb C}$ as their infimum, `UpperBelow c`
(some bound is below $c$), `LowerAbove c` (every bound is above $c$), and the fixed comparison targets `UpperTarget` and `LowerTarget`.
`Grothe.UpperSix.bound` has type `Grothe.Statement.IsBound (140457588 / 100000000 : ℝ)`.
`Grothe.UpperSix.constant_le` states the corresponding weak inequality for the infimum.
`Grothe.UpperSix.constant_lt_inv_gammaDagger` states the strict comparison with the reciprocal phase integral.
`Grothe.Statement.main_bounds` combines the new upper endpoint with `Grothe.Statement.lower_target`. [Statement](Grothe/Statement.lean) · [Upper endpoint](Grothe/UpperResult.lean) · [Both bounds](Grothe/MainResult.lean).

### The lower bound

The witness is the operator $T = P_{1,0} - \tfrac{149}{200} P_{2,1}$ on $L^2$ of the standard Gaussian measure of
$\mathbb{C}^n$, where $P_{1,0}$ and $P_{2,1}$ are the orthogonal projections onto the linear functions of $z$ and
onto the cubic Wick chaos of bidegree $(2,1)$ (`witness`,
[`Grothe/LowerAnalytic/Witness.lean`](Grothe/LowerAnalytic/Witness.lean)). The proof shows that
$\lvert \langle f, Tg \rangle \rvert \le B = 891774069/1250000000 = 0.7134192552$ for all unimodular $f$, $g$ and all $n \ge 2$.

1. **Transfer.** For $u_\ell = z_\ell / \lVert z \rVert$ the sum $\sum_\ell \langle u_\ell, T u_\ell \rangle$ has
   modulus at least $1 - \tfrac{349}{200}/(n+1)$ (`norm_pairVal_witness`), so every Grothendieck bound is at least
   $1/B > 1.401700322371$ (`transfer_lower`, `Grothe/Lower/Transfer.lean`, which passes to finite matrices).
2. **Reduction.** It suffices to bound $\mathrm{Re} \langle f, Tg \rangle$ (multiply $g$ by a phase). Let
   $h = (f+g)/2$ and $k = (f-g)/2$, in coordinates where $P_{1,0} h$ lies on one coordinate. From the hypothesis
   `NodeCaps` of step 4, `reductionHyp_of_nodeCaps` (`Grothe/LowerAnalytic/Reduction.lean`) proves 19 inequalities
   for $\mathrm{Re} \langle f, Tg \rangle$, the rows. Row $r$ contains a convex function $\Psi_r$ of one real
   variable, the supremum over twelve real parameters of an explicit integral against one complex Gaussian
   variable minus a quadratic form (`rowPot`, `Grothe/LowerAnalytic/FibreSup.lean`). It is evaluated at a multiple
   of $\lvert p \rvert$, where $p$ is the cubic chaos part, in the other coordinates, of the average of $k$ over
   that coordinate. For the law of $U = \lvert p \rvert^2 / \lVert p \rVert^2$ (when $p = 0$, for example for
   $f = g$, a fixed normalised cubic chaos takes its place: `poly_rep_H21`) Lean proves what holds for every
   cubic chaos of bidegree $(2,1)$ in any number of variables: $\mathbb{E}\,U^2 \le 44$, a bound on
   $\mathbb{E}\,U^3$ from the Wick expansion of the sixth cumulant, and the Stein cuts, families of inequalities
   $\mathbb{E}\,G(U) \ge 0$ from Gaussian integration by parts (`gaussian_moments`, `steinCut_of_inputs`).
3. **A finite certificate.** Three real parameters remain: $t = \lVert P_{1,0} h \rVert$, $\tau = \lVert p \rVert$,
   and $x$ with $\mathbb{E}\,U^2 = 2 + x^2$. Boxes cover their domain; on each box a combination of rows and of
   certified bounds on $\mathbb{E}\,\Psi_r$ gives $\mathrm{Re} \langle f, Tg \rangle \le B$ (`cover_sound`,
   `box_sound`, `Grothe/Lower/Boxes.lean`). `native_decide` facts check the rows, the node certificates, every
   box and the cover. The result, in `Grothe/Research/RefinedCoverResult.lean`, is
   `lower_bound_of_completed_refinement : NodeCaps → IsGrothendieckBound K → 1.401700322371 < K`. Its cover
   has 15,096 leaves; on some of them a finite convex mixture of rows replaces a single row
   (`mixCover_bound`, `Grothe/Lower/FiniteMix.lean`), and 21 additional law witnesses are checked by one native fact
   (`certRefinementBatches`, `Grothe/Research/LowerRefinementCheck.lean`).
4. **The node caps.** `NodeCaps` says that each $\Psi_r$, less $10^{-11}$, lies below a stored rational at each
   stored node. By convexity the vertex nodes suffice (`nodeCaps_of_vertexCaps`). At a vertex node, a pointwise
   majorant with prices on a polar grid bounds the integral by a quadratic form in the parameters, whose
   coefficients are enclosed by verified interval tables; an exact $LDL^{\mathsf T}$ factorisation then certifies
   the cap for all parameters (`pot_le_of_nodeOK`, `Grothe/LowerAnalytic/CapGridOK.lean`). Some nodes of rows
   12–15 need a finer argument: pieces cut out by linear constraints cover the parameter space up to two
   symmetries of $\Psi_r$, and each piece has its own certificate (`nodeCap_of_ranges`,
   `Grothe/LowerAnalytic/CapPieces/`). `capsRest` (`Grothe/MainResult.lean`) collects the 19 rows, and
   `lower_target` is `lowerTarget_of_nodeCaps (nodeCaps_of_vertexCaps (vertexCaps_of_capsRest capsRest))`.

### The upper bound

The certificate mixes three preprocessed versions of a smoothed cell rounding, one phase rounding and two reflected tiger channels. Each of the six functions maps into the complex unit disk. The transfer theorem turns an approximately linear correlation kernel into a bound for the ratio of vector and scalar optima.

Lean adds the signed channel coefficients through index 250, bounds their joint deviation from a linear kernel, and controls each infinite tail by a Hardy circle-mean estimate. The dyadic overlap tables have finite recomputation checks and mathematical enclosure proofs. The resulting reciprocal gap yields the advertised rational endpoint. [Transfer theorem](Grothe/UpperSix/Haagerup/Transfer.lean) · [Certificate](Grothe/UpperSix/Haagerup/CertCheck.lean).

The previous single-channel proof gives the independent bound $K_G^{\mathbb C}<1.404599395362$. Its quadrature and energy-table construction are documented separately. [Single-channel proof](Grothe/UpperTightFinal.lean) · [Construction notes](docs/UPPER_STATUS.md).

### What the computer checks and what is trusted

- **The Lean kernel** checks every definition and every proof step, including the soundness theorems of the
  checkers (for example `box_sound`, `pot_le_of_nodeOK`, `head_le_of_check`). Besides the facts of the next item,
  the axiom report allows only `propext`, `Classical.choice` and `Quot.sound`.
- **Compiled code** evaluates the `native_decide` facts. Each fact is a decidable statement about committed data,
  usually that a checker program returns `true`; the programs do interval and exact rational arithmetic on finite
  data. Lean does not reduce them in the kernel: it runs them as compiled code and records each result as an
  axiom named after the fact. This trusts the Lean compiler and its runtime in addition to the kernel. The
  allowed facts are listed in `data/axioms/native.txt`: for the lower bound, the rows, node certificates, boxes
  and cover of the certificate and the node caps (chord nodes, ranges of nodes, pieces and their coverage); for
  the six-channel upper bound, the cell witnesses, overlap tables, weighted head and Hardy contour checks. The precise list is in the axiom report. The six rational tail comparisons use kernel reduction.
- **The axiom report** is produced and checked by
  `lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py`. The check fails if a theorem of
  `data/axioms/required.txt` (including the current endpoint theorems) is missing from the report, or if
  any reported theorem uses an axiom other than the three standard ones and the allowed facts. CI also rejects
  `sorry`, `axiom`, `implemented_by`, `extern`, `unsafe`, `debug.skipKernelTC` and `Task.spawn` in the sources, so
  nothing is unproved or exempt from the kernel, no code runs in place of a definition, and no checker uses
  threads. Floating point occurs in one checker, the cap checker, only to choose the cell prices of a grid; the
  soundness proof holds for every choice (`gridOK_mkGrid`).
- **Caches.** CI does not evaluate every fact in every run. It restores the build of an earlier CI run, and Lake
  reuses a stored module only if the hashes of its source, its imports and the toolchain match. For the heaviest
  facts, the node caps and the energy table, CI also checks a source digest before using the cache. A run marked
  “no proof change” inherits the parent’s proof result. The workflow log records whether it ran the Lean build and axiom audits. [Cache check](scripts/caps_stamp.py) · [Proof workflow](.github/workflows/lean.yml).

## Layout

| path | content |
|---|---|
| `Grothe/Statement.lean`, `Grothe/StatementBridges.lean` | the statement (definitions only) and what its targets say about the constant |
| `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` | Two-sided theorem and the six-channel bound for the standard constant |
| `Grothe/UpperSix/`, `articles/haagerup/` | Shared six-channel proof sources and their standalone build |
| `Grothe/UpperClose.lean` | certified energy-table accuracy `hclose_final` |
| `Grothe/UpperHead.lean`, `Grothe/HeadHardy.lean` | finite-head comparison and the Hardy tail after deducting the forced linear energy |
| `Grothe/UpperTightBudget.lean`, `Grothe/UpperTightComparison.lean` | single-channel budgets and the comparison with independent reference mass and error radii |
| `Grothe/UpperTightSix.lean`, `Grothe/UpperTightPanelTotals.lean` | six Gaussian error estimates; kernel checks of tighter totals of the existing panel caps |
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, dominated kernels, the transfer inequality used by the single-channel proof |
| `Grothe/Lower/` | the lower certificate: its checker in exact rational arithmetic with the soundness of rows, Stein cuts, node certificates and boxes; the generated row data; the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis of the lower bound: the witness, chaos projections, the law of cubic chaos (moments, spectral and Gram budgets, Wick expansions), the potentials $\Psi_r$ and the row reduction; the node caps (`Cap*.lean`, the generated rows `CapRowKK` and pieces `CapPieces/`) |
| `Grothe/Research/` | the box cover of the lower certificate, further node certificates, and the resulting theorem `lower_bound_of_refined_cover_data` |
| `Grothe/Haagerup/` | the phase $z/\lvert z \rvert$ of a complex Gaussian: Hermite coefficients, kernel, Laplace representation |
| `Grothe/Upper/` | the single-channel upper proof apart from Gaussian analysis: two-coordinate kernels, disk-valued roundings, tensor realisation of the preprocessors, soundness of the head computation, residual and tail arithmetic, comparison budgets; `Data.lean` holds the rounding parameters, the preprocessors and the energy table |
| `Grothe/UpperChaos/` | chaos calculus on $\mathbb{C}^2$ (Hermite basis, Mehler formula, charge, energies), the rounding, the phase cover, the Hardy tail, the comparison with $X$, the stored Hermite expansions, and generated certificate modules |
| `Grothe/UpperQuad/` | the quadrature: soundness of its checkers, the energy, port and ellipse facts, the Gauss–Legendre remainder on Bernstein ellipses |
| `GrotheKernel/`, `GrotheCapsKernel/`, `GrotheQuadKernel/`, `GrotheQuadExtKernel/` | checker programs that do not import Mathlib, precompiled by Lake: kernel head, phase cover and Hardy arcs; node caps; quadrature of the energy table; its extension to the $h_j$ and the omitted pairs |
| `Grothe.lean`, `Grothe*Kernel.lean` | the root import files, generated by `tools/gen_root_imports.py` |
| `QuadRun.lean` | `quadrun`, a diagnostic driver of the quadrature checker; not a default target, not built by CI |
| `data/` | inputs of the generated modules (certificates, recipes, plans, tables); `data/axioms/` holds the lists read by the axiom check |
| `tools/` | generators of the data modules, replay scripts and numerical cross-checks |
| `scratch/Axioms.lean`, `scratch/UpperSixAxioms.lean`, `scripts/check_axioms.py` | repository-wide and six-channel axiom reports and their checker |
| `scripts/`, `.github/workflows/`, `AGENTS.md` | CI, its helper scripts, and the working rules of the agents that maintain the repository |
| `docs/` | `LEAN_DETAILS.md` (inventory), `overview.tex` (source of `OVERVIEW.pdf`), and design and status notes, each describing the state at its date |
| `sign/` | GrotheSign, a separate Lake package: independent work on the coefficient signs of inverse kernel series. Not part of `Grothe`, of its axiom report or of CI; see [`sign/README.md`](sign/README.md) |
| `research/` | organised records of the open problems behind the bounds (Conjecture K, higher-degree games), with their status ledgers; not built or checked |
| `miscellaneous/`, `abandonware/`, `handoff/`, `outputs/` | archives: research modules and notes, removed code, records of the search. Outside the Lake libraries: never built or imported |

Most modules are generated: certificate data, and small modules that each check one part of it, in the kernel or
as a `native_decide` fact, so that Lake runs the checks in separate processes. The generators are in `tools/`;
most read their inputs from `data/`.

The module-by-module inventory is [docs/LEAN_DETAILS.md](docs/LEAN_DETAILS.md), and the mathematics is explained
in [OVERVIEW.pdf](OVERVIEW.pdf). Both grew with the proofs and have not yet been revised as a whole: where a
paragraph in them calls an input a hypothesis or open, the theorems named above are the current state.

## Building

### Six-channel upper bound

From a fresh checkout, run `lake exe cache get` to download compiled Mathlib dependencies. The repository pins Lean and Mathlib to `v4.34.1`. Then run these commands from the repository root in Bash or Zsh.

```bash
set -o pipefail
lake build Grothe.UpperResult
lake env lean scratch/UpperSixAxioms.lean | python3 scripts/check_axioms.py --upper-six
```

`Grothe.UpperResult` builds the upper proof independently of the lower node caps. The audit checks that every required upper theorem appears and that its transitive axioms are among Lean’s three standard axioms and the named six-channel computations. [Required theorems](data/axioms/modes/upper-six.required.txt) · [Six-channel native allowlist](data/axioms/modes/upper-six.native.txt).

### Full proof check

CI runs `lake build Grothe` for the combined development, then checks the generated imports, the sources and both axiom reports. The combined build includes all lower node caps and the single-channel energy facts. A cold build takes several CPU-days. The upper-only command above is the local build for the six-channel theorem. [Proof workflow](.github/workflows/lean.yml) · [Pinned dependencies and build costs](lakefile.toml).

Changes ordinarily reach `master` through a reviewed pull request and a check of the merged tree. During the lower-bound build for #525, `staging` serves as the integration branch. The coordination issue records when that arrangement ends. [Landing rules](AGENTS.md#7-landing-work-the-checklist) · [Staging notice](https://github.com/agalatan/grothendieck-lean/issues/225#issuecomment-6951470679).

## Related work

The table at the top lists the published bounds on the complex constant. Two recent preprints of Heilman, Jones and
Malavolta bear directly on this repository:

- S. Heilman, C. Jones, G. Malavolta, *Sharper bounds for the complex Grothendieck constant*,
  [arXiv:2609.25462](https://arxiv.org/abs/2609.25462) (September 2026): $1.4 < K_G^{\mathbb C} < 1.404898554746$.
- S. Heilman, C. Jones, G. Malavolta, *Primal/dual method for the Grothendieck constant*,
  [arXiv:2610.10477](https://arxiv.org/abs/2610.10477): a primal/dual search over Hermite projection games and
  roundings for the real constant. Its viewpoint is behind the complex search recorded in
  [`research/higher-degree/`](research/higher-degree/README.md). Its Example 3.1, a sharp $L^1$ bound on each real
  Hermite chaos, would imply by phase averaging the sharp complex bound that is an open problem here
  ([`research/conjecture-K/STATUS.md`](research/conjecture-K/STATUS.md), row 3.6).

For the complex constant see also S. Guo, E. X. Fang, J. Lu, *An improved lower bound for the complex Grothendieck
constant*, [arXiv:2609.07000](https://arxiv.org/abs/2609.07000). For the real constant, the first improvements of
the Davie–Reeds lower bound are S. Heilman, *A lower bound for Grothendieck's constant*,
[arXiv:2603.22616](https://arxiv.org/abs/2603.22616), and C. Jones, G. Malavolta, *The Grothendieck constant is
strictly larger than Davie–Reeds' bound*, [arXiv:2603.30039](https://arxiv.org/abs/2603.30039); see also R. Saha et
al., *New lower and upper bounds for the Grothendieck constant*, [arXiv:2608.11158](https://arxiv.org/abs/2608.11158).

## How this was made

The numerical constructions and certificates were produced in a collaboration between several AI research
systems; this Lean development checks them. The six-channel cell arrays and overlap tables are Lean literals in `Grothe/UpperSix/Haagerup/Data/`.
Other certificates have inputs in `data/` and generators and replay scripts in `tools/`. Search records are archived in `handoff/` and `miscellaneous/`. No step of
the two proofs rests on a certificate that is checked outside Lean.
