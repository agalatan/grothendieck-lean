# The complex Grothendieck constant, in Lean

This repository proves, in Lean 4 with Mathlib and without hypotheses ([what is trusted](#what-the-computer-checks-and-what-is-trusted)),

$$
1.4020221627 < K_G^{\mathbb C} \le 1.404556392 < 1/\gamma^\dagger = 1.40457593\ldots
$$

$K_G^{\mathbb C}$ is the complex Grothendieck constant ([definition below](#the-constant)), and $1/\gamma^\dagger$
is the value that Haagerup proposed for it in 1987, with
$\gamma^\dagger=\int_0^{\pi/2}\frac{\cos^2 t}{\sqrt{1+\sin^2 t}}dt$. So the constant is strictly below Haagerup's
value, which resolves this conjecture of Haagerup.

## The constants

| | value | exact form in Lean | theorem |
|---|---|---|---|
| lower bound | $1.4020221627 < K_G^{\mathbb C}$ | `14020221627 / 10000000000` | `Grothe.Statement.main_bounds` (first part) |
| upper bound | $K_G^{\mathbb C} \le 1.404556392$ | `1404556392 / 1000000000` | `Grothe.Statement.main_bounds` (second part), `Grothe.UpperSeven.constant_le` |
| Haagerup's value | $K_G^{\mathbb C} < 1/\gamma^\dagger = 1.40457593\ldots$ | `1 / gammaDagger` | `Grothe.UpperSeven.constant_lt_inv_gammaDagger` |

The two bounds are 0.00253 apart. [`docs/CONSTANTS.md`](docs/CONSTANTS.md) states every constant exactly, with the
parameters behind it and the other numbers that appear in the repository (earlier bounds, thresholds, targets).
Theorems: [both bounds](Grothe/MainResult.lean) · [upper bound and Haagerup's value](Grothe/UpperResult.lean) ·
[the definitions they are stated with](Grothe/Statement.lean).

## History of the bounds

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | [Grothendieck](https://csg.igrothendieck.org/published-works/) (Résumé, Bol. Soc. Mat. São Paulo 8) | | $K < \infty$ |
| 1984 | [Davie](https://arxiv.org/abs/1101.4195) (unpublished note; reported in Pisier's survey) | $1.33807 < K$ | |
| 1987 | [Haagerup](https://doi.org/10.1007/BF02790792) (Israel J. Math. 60) | | $K < 1.40490913\ldots$ |
| Sept 2026 | [Guo, Fang, Lu](https://arxiv.org/abs/2609.07000) | $1.35584631827168 < K$ | |
| Sept 2026 | [Heilman, Jones, Malavolta](https://arxiv.org/abs/2609.25462) | $1.4 < K$ | $K < 1.404898554746$ |
| Oct–Nov 2026 | **this repository (Lean theorem)** | $\mathbf{1.4020221627 < K}$ | $\mathbf{K\le 1.404556392}$ |

## Haagerup's value is a strict upper bound

**The article: [haagerup-article/main.pdf](haagerup-article/main.pdf)** (on arXiv soon). It proves that
$K_G^{\mathbb{C}}$ is strictly below Haagerup's value:

$$K_G^{\mathbb{C}} \le 1.40456 < 1/\gamma^\dagger = 1.40457593\ldots,$$

thus resolving this conjecture of Haagerup (1987).

- **The bound.** It comes from an explicit rounding scheme: a mixture of six Gaussian rounding channels. One of them
  rounds two complex coordinates and is the one that crosses $\gamma^\dagger$.
- **The Lean proof.** The article's ancillary folder [`haagerup-article/anc/`](haagerup-article/anc) is a
  Lean package of its own that proves the article's bound without hypotheses. The article is frozen: it states
  its own bound and is not updated when the bounds of this repository change. The upper bound of `main_bounds`
  adds a seventh Gaussian angular selector to the six channels
  ([the upper bound](#the-upper-bound)).
  [Build instructions and trust](haagerup-article/anc/README.md) · [The article's exact bound](docs/CONSTANTS.md#other-numbers-you-will-meet).
- **How it was found.** The construction was found by numerical optimisation with the assistance of AI systems,
  at the end of this project; the search is not part of the proof.

**New here? Read [OVERVIEW.pdf](OVERVIEW.pdf)** — an explanation of the problem, the two
constructions, what exactly the computer checks, the new inequalities and obstructions found along
the way, and why the remaining gap is hard.

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
definitions, so reading it is enough to know what the theorems say:

- `scalarOpt A` and `vectorOpt A` are $C(A)$ and $V(A)$ above, for a finite complex matrix $A$;
- `IsBound K` says that $V(A) \le K \cdot C(A)$ for every finite complex matrix $A$ of every size;
- `complexGrothendieckConstant` is the infimum of all such $K$, that is, $K_G^{\mathbb C}$;
- `UpperBelow c` says that some such $K$ is below $c$.

**The theorems.**

- `Grothe.Statement.main_bounds`: the two bounds of the table above, as the rationals given there. Since
  $K_G^{\mathbb C}$ is the infimum of the Grothendieck bounds, the first part says that every $K$ with `IsBound K`
  is above the lower bound.
- `Grothe.UpperSeven.bound : IsBound ((10 : ℝ) ^ 27 / 711968565817136711740669035)`: for every finite complex matrix
  $A$, $V(A) \le 1.4045563919697\ldots \cdot C(A)$. This is what the upper bound means for a single matrix;
  `Grothe.UpperSeven.constant_le` restates it, rounded up to nine decimals, as $K_G^{\mathbb C} \le 1.404556392$.
- `Grothe.UpperSeven.constant_lt_inv_gammaDagger`: $K_G^{\mathbb C} < 1/\gamma^\dagger$. Lean proves
  $\gamma^\dagger < 0.711958683$ from rational bounds on the integral, and $1.404556392 \cdot 0.711958683 < 1$.
- `Grothe.Statement.sparse_stein_endpoint`: $K_G^{\mathbb C}$ is at least an exact rational, the reciprocal of the
  bound $B$ below; the lower bound of `main_bounds` is this rational rounded strictly downward.

[Statement](Grothe/Statement.lean) · [Upper bound](Grothe/UpperResult.lean) · [Both bounds](Grothe/MainResult.lean).

### The lower bound

The witness is the operator $T = P_{1,0} - \tfrac{191}{250} P_{2,1} + \tfrac{47}{2000}(1 - P_{1,0} - P_{2,1})$ on
$L^2$ of the standard Gaussian measure of $\mathbb{C}^n$, where $P_{1,0}$ and $P_{2,1}$ are the orthogonal
projections onto the linear functions of $z$ and onto the cubic Wick chaos of bidegree $(2,1)$, and the last term is
an identity tail on the complement of the two chaoses (`witness`,
[`Grothe/LowerAnalytic/Witness.lean`](Grothe/LowerAnalytic/Witness.lean)). The proof shows that
$\lvert \langle f, Tg \rangle \rvert \le B = (1-\nu)\,\hat B + \nu$ for all unimodular $f$, $g$ and all $n \ge 2$, with
$\nu = 47/2000$ and an exact rational $\hat B$ (`SparseEnvelope.cap`); $1/B$ is the exact endpoint
(`SparseEnvelope.endpoint`). [`docs/CONSTANTS.md`](docs/CONSTANTS.md#behind-the-lower-bound) gives their values.

1. **Transfer.** For $u_\ell = z_\ell / \lVert z \rVert$ the sum $\sum_\ell \langle u_\ell, T u_\ell \rangle$ has
   modulus at least $1 - (1+e)/(n+1)$ with $e = 191/250$ (`norm_pairVal_witness`), so every Grothendieck bound is
   at least $1/B$ (`transfer_lower`, `transferInputs_of_witnessCap`).
2. **Reduction.** With $h = (f+g)/2$, $k = (f-g)/2$ and $t = \lVert P_{1,0} h \rVert \le 9/10$, the polarisation
   identity gives $\mathrm{Re} \langle f, Tg \rangle = (1-\nu)\hat V + \nu$, where $\hat V$ has the weights
   $\hat\varepsilon = 25/31$ and $\hat\nu = 47/1953$ (`VOf_eq_hat`). From the hypothesis `TailNodeCaps` of step 4,
   `circularReductionHyp_of_nodeCaps` (`Grothe/LowerAnalytic/Reduction.lean`) proves 14 inequalities for $\hat V$, the
   rows. Row $r$ contains a convex function $\Psi_r$ of one real variable, the fibre potential with the tail
   $\hat\nu$: a supremum over real parameters of an explicit integral against one complex Gaussian variable minus a
   quadratic form (`pot`, `Grothe/LowerAnalytic/FibreSup.lean`). Lean proves the facts it uses about the law of a
   cubic chaos of bidegree $(2,1)$ in any number of variables: $\mathbb{E}\,\lvert q\rvert^4 \le 44\,(\mathbb{E}\,\lvert q\rvert^2)^2$,
   the sixth-moment inequality, and the Stein cuts from Gaussian integration by parts. A mass row bounds the
   cubic part $\lVert P_{2,1} k \rVert$ (`massRow`, `Grothe/Lower/MassRow.lean`).
3. **The common scale and the amplitude envelope.** Rows 0.835 and 0.845 use a single circular cubic.
   Its fourth excess selects one of nineteen common shape intervals. Dilating eleven ordinary Stein polynomials
   provides fourteen further bounds on the row expectations. Nine mixture weights have separate discounts for
   the whole scale range and for scales up to 0.21. The curvature of their common Schur complement gives
   an additional quadratic discount between the weights. Two outer rows combine quadratic potential bounds
   with their joint gate. The existing scalar rows 13 and 14 interpolate across their crossover. The kernel checks the resulting upper bound on the
   scalar value throughout 38 amplitude cells. [Central row inequalities](Grothe/LowerAnalytic/SparseSteinRows.lean) ·
   [Outer rows](Grothe/LowerAnalytic/SparseOuterRows.lean) · [Amplitude bound](Grothe/Lower/SparseSteinEnvelope.lean).
4. **The node caps.** `TailNodeCaps` says that each $\Psi_r$, less $10^{-11}$, lies below a stored rational at each
   stored node. `tailNodeCaps_cert` (`Grothe/LowerAnalytic/CapNodes.lean`) proves them with the checker
   `GrotheCapsKernel/CapCheckNu.lean` ([CAPS.md](docs/CAPS.md)), and `sparse_stein_endpoint` is
   `sparseSteinEndpoint_le_of_tailNodeCaps tailNodeCaps_cert`, applied with the Grothendieck bound of the upper proof
   (`Grothe/MainResult.lean`).

### The upper bound

The certificate mixes seven Gaussian rounding channels. Three smoothed cell channels, one phase channel and two reflected tiger channels retain their certified interval heads and Hardy tail caps. The seventh channel combines an angular selector at `17/100` with the signed preprocessor `23/25 − (2/25)X`.

Lean computes the selector’s 251-entry signed head and a bound on the total absolute coefficient error. The transfer takes absolute values after summing all seven heads, then adds their weighted allowances. The resulting factor is `10^27 / 711968565817136711740669035`. [Selector and mixture](Grothe/UpperSelector/Bound.lean) · [Exact parameters and budgets](docs/CONSTANTS.md#behind-the-upper-bound).

### What the computer checks and what is trusted

- **The Lean kernel** checks every definition and every proof step, including the soundness theorems of the
  checkers (for example `SparseEnvelope.profile_bound`, `pot_le_of_nodeOKNu`, `head_le_of_check`). Besides the facts of the next item,
  the axiom report allows only `propext`, `Classical.choice` and `Quot.sound`.
- **Compiled code** evaluates the `native_decide` facts. Each fact is a decidable statement about committed data,
  usually that a checker program returns `true`; the programs do interval and exact rational arithmetic on finite
  data. Lean does not reduce them in the kernel: it runs them as compiled code and records each result as an
  axiom named after the fact. This trusts the Lean compiler and its runtime in addition to the kernel. The
  allowed facts are listed in `data/axioms/native.txt`: for the lower bound, the checks of the rows of the
  certificate and the node caps (chord nodes, ranges of nodes, pieces and their coverage); for the upper
  bound, the cell witnesses, the overlap tables, the weighted head with the lower bounds of the linear
  coefficients, the disk and circle-mean checks of the first channel, and one comparison for the seven-channel
  mixed head and full selector allowance. The mass row and the envelope of the lower
  bound, the disk and circle-mean checks of the other five channels and the six rational tail comparisons reduce in
  the kernel. The precise list is in the axiom report.
- **The axiom report** is produced and checked by
  `lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py`. The check fails if a theorem of
  `data/axioms/required.txt` (including `main_bounds` and the upper-bound theorems) is missing from the report, or if
  any reported theorem uses an axiom other than the three standard ones and the allowed facts. CI also rejects
  `sorry`, `axiom`, `implemented_by`, `extern`, `unsafe`, `debug.skipKernelTC` and `Task.spawn` in the sources, so
  nothing is unproved or exempt from the kernel, no code runs in place of a definition, and no checker uses
  threads. Floating point occurs in one checker, the cap checker, only to choose the cell prices of a grid; the
  soundness proof holds for every choice (`gridOK_mkGrid`).
- **Caches.** CI does not evaluate every fact in every run. It restores the build of an earlier CI run, and Lake
  reuses a stored module only if the hashes of its source, its imports and the toolchain match. For the heaviest
  facts, the node caps, CI also checks a source digest before using the cache. A run marked
  “no proof change” inherits the parent’s proof result. The workflow log records whether it ran the Lean build and axiom audits. [Cache check](scripts/caps_stamp.py) · [Proof workflow](.github/workflows/lean.yml).

## Layout

| path | content |
|---|---|
| `Grothe/Statement.lean`, `Grothe/StatementBridges.lean` | the statement (definitions only) and what its targets say about the constant |
| `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` | the theorem `main_bounds` with both bounds; the seven-channel upper bound and the comparison with Haagerup's value |
| `Grothe/UpperSix/`, `Grothe/UpperSix/Certificate/` | the six-channel upper proof: the library (channels, transfer theorem, interval and Hardy soundness, cell data) and the certificate of the bound (parameters, head, contour of the first channel, unequal cutoffs, `isBound`) |
| `haagerup-article/` | the article, frozen, with its own Lean package under `anc/` |
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, dominated kernels, the transfer inequality |
| `Grothe/Lower/` | the lower certificate: its checker in exact rational arithmetic with the soundness of rows, Stein cuts, the mass row and the envelope; the generated row data; the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis of the lower bound: the witness, chaos projections, the law of cubic chaos (moments, spectral and Gram budgets, Wick expansions), the potentials $\Psi_r$ and the row reduction; the node caps (`Cap*.lean`, the generated rows `CapRowKK` and pieces `CapPieces/`) |
| `GrotheCapsKernel/` | the checker program of the node caps: it does not import Mathlib and is precompiled by Lake |
| `Grothe.lean`, `GrotheCapsKernel.lean` | the root import files, generated by `tools/gen_root_imports.py` |
| `data/` | inputs of the generated modules (certificates, recipes, plans, tables); `data/axioms/` holds the lists read by the axiom check |
| `tools/` | generators of the data modules, replay scripts and numerical cross-checks |
| `scratch/Axioms.lean`, `scratch/UpperSixAxioms.lean`, `scripts/check_axioms.py` | repository-wide and six-channel axiom reports and their checker |
| `scripts/`, `.github/workflows/`, `AGENTS.md` | CI, its helper scripts, and the working rules of the agents that maintain the repository |
| `docs/` | `LEAN_DETAILS.md` (inventory), `overview.tex` (source of `OVERVIEW.pdf`), and design and status notes, each describing the state at its date |
| `research/` | organised records of the open problems behind the bounds (Conjecture K, higher-degree games), with their status ledgers; not built or checked |
| `miscellaneous/`, `abandonware/` | archives: research modules and notes, removed code. Outside the Lake libraries: never built or imported. `handoff/` is a git-ignored local folder for research files |

Most modules are generated: certificate data, and small modules that each check one part of it, in the kernel or
as a `native_decide` fact, so that Lake runs the checks in separate processes. The generators are in `tools/`;
most read their inputs from `data/`.

The [module inventory](docs/LEAN_DETAILS.md) lists the proof modules. The [overview source](docs/overview.tex)
explains the mathematics on this branch. CI builds [OVERVIEW.pdf](OVERVIEW.pdf) from `master`. For current
hypotheses, consult the theorem statements linked above.

## Building

### Upper bound

From a fresh checkout, run `lake exe cache get` to download compiled Mathlib dependencies. The repository pins Lean and Mathlib to `v4.34.1`. Then run these commands from the repository root in Bash or Zsh.

```bash
set -o pipefail
lake build Grothe.UpperResult
lake env lean scratch/UpperSixAxioms.lean | python3 scripts/check_axioms.py --upper-six
```

`Grothe.UpperResult` builds the upper proof independently of the lower node caps. The separate six-channel audit checks its inherited library and named computations. The repository-wide audit covers the seventh channel’s additional comparison. [Required theorems](data/axioms/modes/upper-six.required.txt) · [Six-channel native allowlist](data/axioms/modes/upper-six.native.txt).

### Full proof check

CI runs `lake build Grothe` for the combined development, then checks the generated imports, the sources and both axiom reports. The combined build includes all lower node caps. A cold build takes several CPU-days. The upper-only command above is the local build for the seven-channel theorem. [Proof workflow](.github/workflows/lean.yml) · [Pinned dependencies and build costs](lakefile.toml).

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
Other certificates have inputs in `data/` and generators and replay scripts in `tools/`; both folders hold only what an existing Lean module was generated from. Search records are archived in `miscellaneous/` and in git history. No step of
the two proofs rests on a certificate that is checked outside Lean.
