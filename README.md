# The complex Grothendieck constant, in Lean

The two-sided theorem for the complex Grothendieck constant is

$$
1.4018 < K_G^{\mathbb C} < 1.404569241261.
$$

The eighteen-channel upper proof gives an admissible rational bound for every finite complex matrix and compares it with Haagerup’s proposed value,

$$
 K_G^{\mathbb C} \le \frac{10^{15}}{711962052581159} < 1.404569241261 < 1/\gamma^\dagger, \qquad
 \gamma^\dagger=\int_0^{\pi/2}\frac{\cos^2 t}{\sqrt{1+\sin^2 t}}\,dt.
$$

The comparison uses rational bounds on the integral. [Upper theorem](Grothe/UpperResult.lean) · [Two-sided theorem](Grothe/MainResult.lean) · [Six-channel proof and build instructions](haagerup-article/anc/README.md).

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | [Grothendieck](https://csg.igrothendieck.org/published-works/) (Résumé, Bol. Soc. Mat. São Paulo 8) | | $K < \infty$ |
| 1984 | [Davie](https://arxiv.org/abs/1101.4195) (unpublished note; reported in Pisier's survey) | $1.33807 < K$ | |
| 1987 | [Haagerup](https://doi.org/10.1007/BF02790792) (Israel J. Math. 60) | | $K < 1.40490913\ldots$ |
| Sept 2026 | [Guo, Fang, Lu](https://arxiv.org/abs/2609.07000) | $1.35584631827168 < K$ | |
| Sept 2026 | [Heilman, Jones, Malavolta](https://arxiv.org/abs/2609.25462) | $1.4 < K$ | $K < 1.404898554746$ |
| Oct–Nov 2026 | **two-sided Lean theorem in this repository** | $\mathbf{1.4018 < K}$ | $\mathbf{K<1.404569241261}$ |

## Haagerup's value is a strict upper bound

**The article: [haagerup-article/main.pdf](haagerup-article/main.pdf)** (on arXiv soon). It proves that
$K_G^{\mathbb{C}}$ is strictly below Haagerup's value:

$$K_G^{\mathbb{C}} \le 1.40457588 < 1/\gamma^\dagger = 1.40457593\ldots,$$

thus resolving this conjecture of Haagerup (1987).

- **The bound.** It comes from an explicit rounding scheme: a mixture of six Gaussian rounding channels. One of them
  rounds two complex coordinates and is the one that crosses $\gamma^\dagger$.
- **The Lean proof.** The article's ancillary folder [`haagerup-article/anc/`](haagerup-article/anc) is a
  standalone Lean package that proves $K_G^{\mathbb{C}} \le 1.40457588 < 1/\gamma^\dagger$ without hypotheses. Its
  sources are a byte-for-byte copy of [`Grothe/UpperSix/`](Grothe/UpperSix), and the repository exposes the article's six-channel result through its
  [six-channel entrypoint](Grothe/UpperSixResult.lean). Its own CI job checks the
  copy, the build and the axioms. [Build instructions and trust](haagerup-article/anc/README.md).
- **How it was found.** The construction was discovered with AI, at the end of this project; the article's last
  section describes how.

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
definitions: C(A), V(A), Grothendieck bounds, the constant $K_G^{\mathbb C}$ as their infimum, `UpperBelow c`
(some bound is below $c$), `LowerAbove c` (every bound is above $c$), and the fixed comparison targets `UpperTarget` and `LowerTarget`.
`Grothe.UpperReplacement.bound` gives the eighteen-channel rational bound for every finite matrix.
`Grothe.UpperReplacement.constant_le` bounds the infimum, and `constant_lt_inv_gammaDagger` compares it with the reciprocal phase integral.
`Grothe.Statement.main_bounds` combines this upper endpoint with `Grothe.Statement.lower_target`. [Upper theorem](Grothe/UpperResult.lean) · [Lower theorem](Grothe/LowerResult.lean) · [Two-sided theorem](Grothe/MainResult.lean).

### The lower bound

The witness is the operator $T = P_{1,0} - \tfrac{191}{250} P_{2,1} + \tfrac{47}{2000}(1 - P_{1,0} - P_{2,1})$ on
$L^2$ of the standard Gaussian measure of $\mathbb{C}^n$, where $P_{1,0}$ and $P_{2,1}$ are the orthogonal
projections onto the linear functions of $z$ and onto the cubic Wick chaos of bidegree $(2,1)$, and the last term is
an identity tail on the complement of the two chaoses (`witness`,
[`Grothe/LowerAnalytic/Witness.lean`](Grothe/LowerAnalytic/Witness.lean)). The proof shows that
$\lvert \langle f, Tg \rangle \rvert \le B = (1-\nu)\,B_{\mathrm{env}} + \nu$, with $\nu = 47/2000$ and
$B_{\mathrm{env}} = 7064131/10^7$, for all unimodular $f$, $g$ and all $n \ge 2$; $1/B = 1.40191\ldots > 1.4018$.

1. **Transfer.** For $u_\ell = z_\ell / \lVert z \rVert$ the sum $\sum_\ell \langle u_\ell, T u_\ell \rangle$ has
   modulus at least $1 - (1+e)/(n+1)$ with $e = 191/250$ (`norm_pairVal_witness`), so every Grothendieck bound is
   at least $1/B$ (`transfer_lower`, `transferInputs_of_witnessCap`).
2. **Reduction.** With $h = (f+g)/2$, $k = (f-g)/2$ and $t = \lVert P_{1,0} h \rVert \le 9/10$, the polarisation
   identity gives $\mathrm{Re} \langle f, Tg \rangle = (1-\nu)\hat V + \nu$, where $\hat V$ has the weights
   $\hat\varepsilon = 25/31$ and $\hat\nu = 47/1953$ (`VOf_eq_hat`). From the hypothesis `TailNodeCaps` of step 4,
   `reductionHyp_of_nodeCaps` (`Grothe/LowerAnalytic/Reduction.lean`) proves 14 inequalities for $\hat V$, the
   rows. Row $r$ contains a convex function $\Psi_r$ of one real variable, the fibre potential with the tail
   $\hat\nu$: a supremum over real parameters of an explicit integral against one complex Gaussian variable minus a
   quadratic form (`pot`, `Grothe/LowerAnalytic/FibreSup.lean`). Lean proves the facts it uses about the law of a
   cubic chaos of bidegree $(2,1)$ in any number of variables: $\mathbb{E}\,\lvert q\rvert^4 \le 44\,(\mathbb{E}\,\lvert q\rvert^2)^2$,
   the sixth-moment inequality, and the Stein cuts from Gaussian integration by parts. A mass row bounds the
   cubic part $\lVert P_{2,1} k \rVert$ (`massRow`, `Grothe/Lower/MassRow.lean`).
3. **The envelope.** Two scalar rows mix with a weight $\theta \in [0,1]$ into a row (`RowHolds.mix`). The envelope
   has 1,800 cells covering $t \in [0, 9/10]$; on each a row, the tangent of the mass row or a mixture of two of them
   is at most $B_{\mathrm{env}}$ (`certEnvelope`, soundness `env_bound`, `Grothe/Lower/Envelope.lean`).
   `profile_bound` (`Grothe/LowerAnalytic/LowerBound.lean`) applies it to the rows of the reduction.
4. **The node caps.** `TailNodeCaps` says that each $\Psi_r$, less $10^{-11}$, lies below a stored rational at each
   stored node. `tailNodeCaps_cert` (`Grothe/LowerAnalytic/CapNodes.lean`) proves them with the checker
   `GrotheCapsKernel/CapCheckNu.lean` ([CAPS.md](docs/CAPS.md)), and `lower_target` is
   `lowerTarget_of_tailNodeCaps tailNodeCaps_cert` (`Grothe/LowerResult.lean`).

### The upper bound

The root certificate mixes ten preprocessors of the Gaussian rounding $G_T$, seven phase channels and a pair of dyadic cell responses. It adds signed coefficients through radial index 250 before taking absolute values. Each channel has a separate infinite-tail estimate. The proof also accounts for the error in the $G_T$ energy table and the finite cell truncation. [Eighteen-channel proof and exact budgets](docs/UPPER_CERTIFICATE.md).

The six-channel article uses three smoothed cell channels, one phase channel and two reflected channels. Its standalone proof gives $K_G^{\mathbb C}\le 1.40457588<1/\gamma^\dagger$. [Article certificate](Grothe/UpperSix/Haagerup/CertCheck.lean).

### What the computer checks and what is trusted

- **The Lean kernel** checks every definition and every proof step, including the soundness theorems of the
  checkers (for example `env_bound`, `pot_le_of_nodeOKNu`, `head_le_of_check`). Besides the facts of the next item,
  the axiom report allows only `propext`, `Classical.choice` and `Quot.sound`.
- **Compiled code** evaluates the `native_decide` facts. Each fact is a decidable statement about committed data,
  usually that a checker program returns `true`; the programs do interval and exact rational arithmetic on finite
  data. Lean does not reduce them in the kernel: it runs them as compiled code and records each result as an
  axiom named after the fact. This trusts the Lean compiler and its runtime in addition to the kernel. The
  allowed facts are listed in `data/axioms/native.txt`: for the lower bound, the rows, the mass row and the envelope
  of the certificate and the node caps (chord nodes, ranges of nodes, pieces and their coverage); for
  the eighteen-channel upper proof, the GT quadrature, energy tables, cell witnesses, finite head and contour checks. Rational tail comparisons are verified in the kernel. The article has its own six-channel allowlist.
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
| `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` | Two-sided theorem and the eighteen-channel bound for the standard constant |
| `Grothe/UpperSix/`, `haagerup-article/anc/` | the six-channel proof sources and their standalone copy, the article's ancillary files |
| `Grothe/UpperClose.lean` | certified energy-table accuracy `hclose_final` |
| `Grothe/UpperReplacement/` | eighteen-channel mixture, signed head, Hardy tails and error budget |
| `Grothe/UpperTightBudget.lean`, `Grothe/UpperTightComparison.lean` | GT error radii and comparison with the energy table |
| `Grothe/UpperTightSix.lean`, `Grothe/UpperTightPanelTotals.lean` | six Gaussian error estimates; kernel checks of tighter totals of the existing panel caps |
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, dominated kernels, the transfer inequality for the eighteen-channel proof |
| `Grothe/Lower/` | the lower certificate: its checker in exact rational arithmetic with the soundness of rows, Stein cuts, the mass row and the envelope; the generated row data; the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis of the lower bound: the witness, chaos projections, the law of cubic chaos (moments, spectral and Gram budgets, Wick expansions), the potentials $\Psi_r$ and the row reduction; the node caps (`Cap*.lean`, the generated rows `CapRowKK` and pieces `CapPieces/`) |
| `Grothe/Haagerup/` | the phase $z/\lvert z \rvert$ of a complex Gaussian: Hermite coefficients, kernel, Laplace representation |
| `Grothe/Upper/` | shared upper-proof definitions and arithmetic: two-coordinate kernels, disk-valued roundings, tensor realisation of the preprocessors, soundness of the head computation, residual and tail arithmetic, comparison budgets; `Data.lean` holds the rounding parameters, the preprocessors and the energy table |
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

The [module inventory](docs/LEAN_DETAILS.md) lists the proof modules. The [overview source](docs/overview.tex)
explains the mathematics on this branch. CI builds [OVERVIEW.pdf](OVERVIEW.pdf) from `master`. For current
hypotheses, consult the theorem statements linked above.

## Building

### Upper bounds

The repository pins Lean and Mathlib to `v4.34.1`. Run `lake exe cache get` to download compiled Mathlib dependencies. The root eighteen-channel theorem and the six-channel article theorem each have an upper-only build and an independent axiom audit.

```bash
set -o pipefail
lake build Grothe.UpperResult
lake env lean scratch/UpperMixtureAxioms.lean | python3 scripts/check_axioms.py --upper-mixture

lake build Grothe.UpperSixResult
lake env lean scratch/UpperSixAxioms.lean | python3 scripts/check_axioms.py --upper-six
```

Each report requires its own endpoint declarations and permits only the standard axioms and the finite computations listed for that certificate. [Eighteen-channel allowlist](data/axioms/modes/upper-mixture.native.txt) · [Six-channel allowlist](data/axioms/modes/upper-six.native.txt).

### Full proof check

CI runs `lake build Grothe` for the combined development, then checks the generated imports, the sources and the combined and focused axiom reports. The combined build includes all lower node caps and the shared GT energy-table facts. A cold build takes several CPU-days. [Proof workflow](.github/workflows/lean.yml) · [Pinned dependencies and build costs](lakefile.toml).

The `sign/` directory builds GrotheSign as a separate Lake package. [GrotheSign build instructions](sign/README.md).

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
