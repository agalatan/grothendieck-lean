# The complex Grothendieck constant, in Lean

The six-channel upper-bound proof on this branch targets $K_G^{\mathbb C} \le 1.40457588$. Its end-to-end Lean check is pending. The theorem for finite complex matrices and the comparison with Haagerup’s phase integral are in [the upper entrypoint](Grothe/UpperResult.lean).

**Work in progress.** The two bounds below are proved and checked by CI on every change; the work towards sharper
bounds continues, and its open problems are recorded in [`research/`](research/README.md) and in
[OVERVIEW.pdf](OVERVIEW.pdf).

A Lean 4 + Mathlib proof of these bounds on the complex Grothendieck constant:

$$1.401700322371 < K_G^{\mathbb{C}} < 1.404599395362$$

Both inequalities are one theorem without hypotheses, `Grothe.Statement.main_bounds`
([`Grothe/MainResult.lean`](Grothe/MainResult.lean)). Its proof uses the three standard axioms of Lean and
finite exact computations evaluated by compiled code (`native_decide`); see
[what is proved](#what-is-proved).

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | [Grothendieck](https://csg.igrothendieck.org/published-works/) (Résumé, Bol. Soc. Mat. São Paulo 8) | | $K < \infty$ |
| 1984 | [Davie](https://arxiv.org/abs/1101.4195) (unpublished note; reported in Pisier's survey) | $1.33807 < K$ | |
| 1987 | [Haagerup](https://doi.org/10.1007/BF02790792) (Israel J. Math. 60) | | $K < 1.40490913\ldots$ |
| Sept 2026 | [Guo, Fang, Lu](https://arxiv.org/abs/2609.07000) | $1.35584631827168 < K$ | |
| Sept 2026 | [Heilman, Jones, Malavolta](https://arxiv.org/abs/2609.25462) | $1.4 < K$ | $K < 1.404898554746$ |
| Oct–Nov 2026 | **this repository** | $\mathbf{1.401700322371 < K}$ | $\mathbf{K < 1.404599395362}$ |

Haagerup's integral $1/\gamma^\dagger = 1.4045759\ldots$, where
$\gamma^\dagger = \int_0^{\pi/2} \cos^2 t \, (1+\sin^2 t)^{-1/2} \, dt$, has been proposed as the exact value;
it lies inside the interval, about $2.35 \cdot 10^{-5}$ below our upper bound.

The lower endpoint is `Grothe.Statement.lower_target`. The upper endpoint is
`Grothe.Statement.upper_below_tight`
([`Grothe/UpperTightFinal.lean`](Grothe/UpperTightFinal.lean)); it follows from the exact rational bound
`tightValueQ`, approximately `1.4045993953612070749249`.

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
(some bound is below $c$), `LowerAbove c` (every bound is above $c$), and the two targets
`UpperTarget = UpperBelow 1.4046` and `LowerTarget = LowerAbove 1.401700322371`. `UpperTarget` retains the
earlier threshold for compatibility; the current upper theorem has the stronger type
`UpperBelow (1404599395362 / 10^12)`. A compiled theorem whose type is one of these statements and whose
axiom report is clean proves exactly that claim.
[`Grothe/StatementBridges.lean`](Grothe/StatementBridges.lean) proves what the targets say about the constant:
`UpperBelow c` gives $K_G^{\mathbb C} < c$, and `LowerAbove c` gives $c < K_G^{\mathbb C}$ once some bound exists
(the set of bounds is closed).

**The current theorems** are `lower_target : LowerTarget`,
`upper_below_tight : UpperBelow (1404599395362 / 10^12)` and
`main_bounds : 1.401700322371 < K_G^ℂ < 1.404599395362`, all in the namespace `Grothe.Statement` and without
hypotheses ([`Grothe/MainResult.lean`](Grothe/MainResult.lean),
[`Grothe/UpperTightFinal.lean`](Grothe/UpperTightFinal.lean)). The earlier `upper_target : UpperTarget`
was removed on 15 November 2026 (#405).

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

`upper_bound_tight` exhibits the exact rational Grothendieck bound `tightValueQ`
$= 1/(c - \delta)$, with $c = 0.7119483103461$ and
$\delta = 1.542247969222723794480\ldots \cdot 10^{-6}$
([`Grothe/UpperTightBudget.lean`](Grothe/UpperTightBudget.lean)). This gives the strict upper endpoint
`upper_below_tight` above.

1. **Transfer.** If the correlation $\mathbb{E}[\overline{\varepsilon_i} \, \delta_j]$ of a rounding of unit
   vectors to the unit disk is $\sum_n h_n \, z \lvert z \rvert^{2n}$ in $z = \langle x_i, y_j \rangle$, and
   $\lvert h_0 - c \rvert + \sum_{n \ge 1} \lvert h_n \rvert \le \delta < c$, then $1/(c - \delta)$ is a Grothendieck
   bound (`Grothe.transfer`, [`Grothe/Transfer.lean`](Grothe/Transfer.lean)).
2. **The rounding** `GT` ([`Grothe/UpperChaos/Rounder.lean`](Grothe/UpperChaos/Rounder.lean), with the rational
   data of [`Grothe/Upper/Data.lean`](Grothe/Upper/Data.lean)) is a Gaussian smoothing $G_T = S\,T$ of
   $T = F_0 \cdot P_3(\varphi)$ on $\mathbb{C}^2$: $F_0(z, w)$ is the phase of
   $z + \sqrt{1 + a^2} \, v(\lvert z \rvert^2) \, w$ with a twelve-term Laguerre profile $v$, $\varphi$ is a
   polynomial in $z$, $w$ and their conjugates times $e^{-\frac{21}{20}(\lvert z \rvert^2 + \lvert w \rvert^2)}$,
   and $P_3(x) = 1 + ix - x^2/2 - ix^3/6$. $G_T$ has charge one, and its values lie in the unit disk because
   $\lvert P_3(x) \rvert^2 = 1 - x^4 (3 - x^2)/36$ and $\varphi^2 \le 99/100$ everywhere (`phiT_sq_le`: checked
   bisection trees on a box, an analytic bound outside it). It is applied to two Gaussian coordinates whose
   correlations are $z\,P(\lvert z \rvert^2)$ and $z\,Q(\lvert z \rvert^2)$ in $z = \langle x_i, y_j \rangle$,
   with real polynomials $P$, $Q$ of coefficient norm at most 1. For real $t$ these are odd polynomials
   $p(t) = t\,P(t^2)$ and $-\tau(t) = t\,Q(t^2)$, and the kernel is
   $H(t) = \sum_{n,m} E[n,m] \, p(t)^n (-\tau(t))^m = \sum_j \kappa_j \, t^{2j+1}$, where $E[n,m]$ is the energy of
   $G_T$ in Hermite degree $n$ of the first coordinate and $m$ of the second (`hasSum_kernel_real`). For complex
   $z$ the rounding realises the kernel $\sum_j \kappa_j \, z \lvert z \rvert^{2j}$ of step 1 with the same
   coefficients (`rounding_diskKernel`).
3. **The residual** $\delta$ of $H$ against $c\,t$ is a sum of four bounds (`TightEndpoint.endpoint_of_comparison`,
   [`Grothe/UpperTightFinal.lean`](Grothe/UpperTightFinal.lean)). The first three concern the head: the degrees
   up to 501, to which only the index pairs with $n + 3m \le 501$ contribute (`headIdx 501`).

   - $28153/10^{12}$: the head of the kernel of a stored table of energies (`head_check`);
   - $6847009/(5 \cdot 10^{17})$: the $\ell^1$ distance, over the index pairs with $n + 3m \le 501$, from the
     table to the energies of $X = S(F_0 + v)$, where a stored finite Hermite expansion $v$ stands for $T - F_0$
     (`hclose_final`, `Grothe/UpperClose.lean`);
   - $1.492126358404\ldots \cdot 10^{-6}$ (`tightThreeBandCompareQ`): the weighted distance, over the same
     index pairs, from the energies of $X$ to those of $G_T$. With $T - F_0 = h_1 + h_2/2 + h_3/6$,
     $h_j = (i\varphi)^j F_0$, it rests on six estimates: the $L^2$ distance from $h_j$ to a stored finite Hermite
     expansion $c_j$, as a whole and on the band of lowest degrees (`TightTwist.six_of_facts`,
     [`Grothe/UpperTightSix.lean`](Grothe/UpperTightSix.lean)). The comparison regroups the existing certified
     mass squares with sharper rational ceilings and charges the quadratic error once for the four unsplit
     sources ([`Grothe/UpperTightComparison.lean`](Grothe/UpperTightComparison.lean)). Its weights are the
     coefficient costs `improvedWeight`: 51 interval-enclosed polynomial coefficients and a Wiener-norm tail at
     radius $3/2$ ([`Grothe/Upper/ImprovedHeadWeight.lean`](Grothe/Upper/ImprovedHeadWeight.lean));
   - $219549168/10^{16}$ (`tightTailQ`): the tail of the kernel of $G_T$ itself beyond degree 501. The series
     continues holomorphically past the circle of radius $4149/4000$, and its mean square there is at most
     $B = 117/100$ (`HardyReal.hardy_GT_gaussian`,
     [`Grothe/UpperChaos/HardyGaussian.lean`](Grothe/UpperChaos/HardyGaussian.lean)). A weighted Schur estimate
     that keeps the prescribed Gaussian amplitude in the positive kernel and integrates it exactly bounds the
     continued correlation by an explicit determinant expression
     ([`Grothe/UpperChaos/SchurMainGaussian.lean`](Grothe/UpperChaos/SchurMainGaussian.lean)), and an exact
     interval check bounds that expression by a quartic angular majorant whose mean over the circle is $117/100$ (`HardyGaussianCheck.charts_checked`).
     If $H_0$ is the sum of the three head allowances,
     then $\kappa_0 \ge c-H_0$. Before bounding the tail by Cauchy–Schwarz, the proof deducts
     $(c-H_0)^2 r^2$ from $B$, where $r=4149/4000$. After shifting to $\kappa_{n+1}$, the remaining budget is
     $(B-(c-H_0)^2 r^2)/r^4$ (`transfer_of_head_hardy`, [`Grothe/HeadHardy.lean`](Grothe/HeadHardy.lean)).
4. **Quadrature.** The Hermite coefficients of $F_0$ and of the $h_j$ are integrals over $s = \lvert z \rvert^2$.
   Checkers in interval arithmetic evaluate their Gauss–Legendre sums on one committed set of panels in
   $[0, 100]$ and compare them with the table (the energy facts `gradeBlockNN`) and with the $c_j$ (the port
   facts `PortFacts.jKRangeNN`, `jKFinal`). The quadrature error is proved: on each panel the integrand extends
   holomorphically to a Bernstein ellipse, the checker bounds it there, and `gauss_remainder_ellipse`
   (`Grothe/UpperQuad/GaussRemainderEllipse.lean`) turns the bound into the remainder of the rule
   (`EllCheck.quadRemainderHyp`, `TwistEllCheck.remainder_of_prodShards`). Bessel's inequality bounds the part
   outside the panels (`Tail.norm_tail_sq_le`). The current proof reuses the accepted panel certificates and
   checks their tighter total caps directly in the Lean kernel
   ([`Grothe/UpperTightPanelTotals.lean`](Grothe/UpperTightPanelTotals.lean)). Including the existing
   $10^{-15}$ tail/gap reserve, the full radii are $(9,17,1132)\cdot10^{-15}$; the low-band estimates add the
   exact table reserves $(2^{-41},2^{-42},2^{-45})$. The certified inner products give whole-source error radii
   $(6338057765,1086368451,334910976)/10^{15}$ after division by $j!$. These are the six Gaussian estimates in
   `UpperTightSix`. `upper_bound_tight` combines them with the comparison,
   the energy-table accuracy `hclose_final`, and the head/Hardy transfer.

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
  the upper bound, the kernel head, the phase cover, the Hardy circle and its region, exact moments of $\varphi$,
  the decoding and exact energies of the stored expansions, band masses of the energy table, its blocks, even
  entries and omitted pairs, the port facts, and the ellipse bounds of both quadratures.
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
  facts, the node caps and the energy table, the cache also carries a hash of their sources, written by the run
  that evaluated them and compared before the cache is used (`scripts/caps_stamp.py`). So a green check means
  that CI has evaluated every fact for exactly these sources, not that it did so in that run.

## Layout

| path | content |
|---|---|
| `Grothe/Statement.lean`, `Grothe/StatementBridges.lean` | the statement (definitions only) and what its targets say about the constant |
| `Grothe/MainResult.lean`, `Grothe/UpperTightFinal.lean` | `lower_target` and `main_bounds`; the current `upper_bound_tight`, `upper_below_tight` and `constant_lt_tight_upper` |
| `Grothe/UpperClose.lean` | certified energy-table accuracy `hclose_final` |
| `Grothe/UpperHead.lean`, `Grothe/HeadHardy.lean` | finite-head comparison and the Hardy tail after deducting the forced linear energy |
| `Grothe/UpperTightBudget.lean`, `Grothe/UpperTightComparison.lean` | current exact budgets and the comparison with independent reference mass and error radii |
| `Grothe/UpperTightSix.lean`, `Grothe/UpperTightPanelTotals.lean` | six Gaussian error estimates; kernel checks of tighter totals of the existing panel caps |
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, dominated kernels, the transfer inequality of the upper bound |
| `Grothe/Lower/` | the lower certificate: its checker in exact rational arithmetic with the soundness of rows, Stein cuts, node certificates and boxes; the generated row data; the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis of the lower bound: the witness, chaos projections, the law of cubic chaos (moments, spectral and Gram budgets, Wick expansions), the potentials $\Psi_r$ and the row reduction; the node caps (`Cap*.lean`, the generated rows `CapRowKK` and pieces `CapPieces/`) |
| `Grothe/Research/` | the box cover of the lower certificate, further node certificates, and the resulting theorem `lower_bound_of_refined_cover_data` |
| `Grothe/Haagerup/` | the phase $z/\lvert z \rvert$ of a complex Gaussian: Hermite coefficients, kernel, Laplace representation |
| `Grothe/Upper/` | the upper bound apart from Gaussian analysis: two-coordinate kernels, disk-valued roundings, tensor realisation of the preprocessors, soundness of the head computation, residual and tail arithmetic, comparison budgets; `Data.lean` holds the rounding parameters, the preprocessors and the energy table |
| `Grothe/UpperChaos/` | chaos calculus on $\mathbb{C}^2$ (Hermite basis, Mehler formula, charge, energies), the rounding, the phase cover, the Hardy tail, the comparison with $X$, the stored Hermite expansions, and generated certificate modules |
| `Grothe/UpperQuad/` | the quadrature: soundness of its checkers, the energy, port and ellipse facts, the Gauss–Legendre remainder on Bernstein ellipses |
| `GrotheKernel/`, `GrotheCapsKernel/`, `GrotheQuadKernel/`, `GrotheQuadExtKernel/` | checker programs that do not import Mathlib, precompiled by Lake: kernel head, phase cover and Hardy arcs; node caps; quadrature of the energy table; its extension to the $h_j$ and the omitted pairs |
| `Grothe.lean`, `Grothe*Kernel.lean` | the root import files, generated by `tools/gen_root_imports.py` |
| `QuadRun.lean` | `quadrun`, a diagnostic driver of the quadrature checker; not a default target, not built by CI |
| `data/` | inputs of the generated modules (certificates, recipes, plans, tables); `data/axioms/` holds the lists read by the axiom check |
| `tools/` | generators of the data modules, replay scripts and numerical cross-checks |
| `scratch/Axioms.lean`, `scripts/check_axioms.py` | the axiom report and its check |
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

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py
```

The directory `sign/` is a separate Lake package with its own instructions; these commands do not build it.

`lake build` builds the single target `Grothe`: both proofs with all their `native_decide` facts. From an empty
build directory every fact is evaluated, which takes several days of CPU time: `lakefile.toml` records about 21
CPU-hours for the fifteen range-checked cap rows and about ten hours for each energy-table fact, and there are
other facts besides. The dependencies, Mathlib and LeanCert, are pinned in the same file.

CI ([`.github/workflows/lean.yml`](.github/workflows/lean.yml)) checks pushed branches: it builds `Grothe`,
checks that the root import files are the generated ones, rejects the constructs listed
[above](#what-the-computer-checks-and-what-is-trusted) and checks the axiom report. A change that touches nothing
Lean builds or checks skips the build. Runs start from the build cache described above. When the sources of the
heaviest facts change, no cache fits them: the check of an ordinary pushed branch then fails at once and says so,
and the facts are evaluated again on a self-hosted machine by the landing check of the pull request, by the check
of `master`, or by a run dispatched for that purpose (`-f mode=caps`). Changes reach `master` through pull requests:
after review the author comments `/land <agent-id>`, and CI checks the branch merged into the current `master` and
moves `master` to that merge only if the check is green (`AGENTS.md` §7). Every update of `master` gets its own
check.

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
systems; this Lean development checks them. The certificate data is committed in `data/`, with the generators
and replay scripts in `tools/`; records of the search are archived in `handoff/` and `miscellaneous/`. No step of
the two proofs rests on a certificate that is checked outside Lean.
