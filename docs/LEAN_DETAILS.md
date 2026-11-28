# Lean development: detailed inventory

This file lists, module by module, what the Lean development proves and which inputs enter as data. The short version is in [README.md](../README.md); the mathematics is explained in [OVERVIEW.pdf](../OVERVIEW.pdf).

`Grothe.Statement.main_bounds` (`Grothe/MainResult.lean`) proves `1.4020221627 < K_G^ℂ ≤ 1.404556392` (in Lean `14020221627/10000000000` and `1404556392/1000000000`), without hypotheses. The lower half is the exact endpoint `sparse_stein_endpoint` rounded strictly downward; the upper half is `Grothe.UpperSeven.constant_le`. The upper-only module `Grothe/UpperResult.lean` has three theorems: `Grothe.UpperSeven.bound` ($V(A)\le[10^{27}/711968565817136711740669035]\,C(A)$ for every finite complex matrix $A$; the factor is $1.4045563919697\ldots$), `constant_le` (the same, rounded up to nine decimals, for the constant) and `constant_lt_inv_gammaDagger` ($K_G^{\mathbb C}<1/\gamma^\dagger$). The scalar and vector suprema of the six-channel library are definitionally equal to those in `Grothe.Statement`. [Upper entrypoint](../Grothe/UpperResult.lean) · [Combined statement](../Grothe/MainResult.lean).

The seventh channel and its proof are in `Grothe/UpperSelector/`. The Gaussian field gives a dominated radial kernel in `Transfer.lean`. The recurrence for signed Fourier moments, the clipped binomial preprocessor and the phase masses feed `PhysicalColumn.lean`, which bounds error in the whole Wiener series. `NumericWitness.lean` evaluates the mixed head and selector allowance from Lean definitions in one native comparison. `Bound.lean` combines this with the six analytic tail bounds and proves `Haagerup.AngularSelector.isBound`.

The smoothed cell, phase and reflected tiger channels share the analytic transfer in `Grothe/UpperSix/Haagerup/Transfer.lean`. The finite data are checked against the evaluators in `Grothe/UpperSix/HaagerupKernel/`. The certificate for these six channels is `Grothe/UpperSix/Certificate/`. `Parameters.lean` holds the polynomial of the first channel, the target slope and the caps. `Head.lean` checks the weighted head together with six lower bounds on the linear coefficients: the phase channel contributes 321 coefficients, from exact Haagerup moments, and each of the five cell channels 251. `Contour.lean` checks disk positivity and the circle mean for the first channel. `Bound.lean` subtracts the squared contributions of the linear coefficients from the Hardy estimates, which gives the tail caps, and proves `Haagerup.SixChannel.isBound`.

The article `haagerup-article/` is frozen and has its own Lean package under `haagerup-article/anc`, which proves the article's statement; they do not quote the bounds of this repository. [Article's Lean package](../haagerup-article/anc/README.md).

A second upper proof, of `K_G^ℂ < 1.404599395362` by a single Gaussian rounding channel (`upper_below_tight`), was removed from the libraries because the main theorem does not use it; it last existed at commit `460c76731`.

**Reading this inventory.** Most paragraphs describe one module or one result.
Where a paragraph says that a result takes an estimate as a hypothesis, or that
it gives no numerical bound, this describes that result; it is not an open
input of the main theorem, which has no hypotheses. Every module of the libraries is in the
import closure of `Grothe/MainResult.lean`. A module called
*archived* below has left the libraries and is not built or checked: a few
modules that later work would reuse are kept in `abandonware/`, and the others
are in git history only (`abandonware/README.md` lists both, with the commits).

**Different head lengths in a mixture.** A channel with a list of length $m$ encloses its true coefficients up to index $m-1$. The finite head sum pads that list with zeros. The error between the polynomial and the true kernel costs at most the channel’s absolute tail from $m$, multiplied by its mixture weight. The theorem also covers an empty list. [Lean transfer theorem](../Grothe/UpperSix/Certificate/VariableCutoff.lean).

**Shared proof foundations.** `LowerAnalytic/ComplexGaussianCore.lean` contains
`gaussC`, its planar presentation, rotation invariance and radial-moment reduction.
`LowerAnalytic/ComplexGaussianSymmetry.lean` has the invariance of `gaussC` under
z ↦ z̄ and z ↦ −z (`gaussC_map_conj`, `gaussC_map_neg`, `integral_gaussC_comp`). It
imports `ComplexGaussianCore` only, and the lower fibre symmetries (`CapSymmetry`) use it.
`LowerAnalytic/IntervalSound.lean` proves the soundness of the fixed-point interval arithmetic of
`GrotheCapsKernel/Basic.lean`, for the cap checker (`CapCheckSound`, `CapTables`). The modules of the
lower bound import nothing of the upper proof (the existence of one admissible bound enters in
`Grothe/MainResult.lean`, as `Grothe.UpperSix.bound`), and the upper proof imports nothing of the lower bound.

`Lower/Stein.lean` derives `spec_of_inputs` from `gspec_of_vr` with zero shifts.
`Lower/Law.lean` proves `node_fn_of_cut` for any integrable cut with nonnegative
expectation; `TB.of_cut` applies it to Stein, spectral, general spectral and joint
nodes. The joint node retains its kurtosis-range premise.
`Lower/Gram.lean` proves `reserved_gram_budget` once for arbitrary signed reserves;
`gram_budget_of_scalars` and `gram_joint_of_scalars` specialize it through
`zero_reserve` and `joint_reserve_value`. Existing theorem statements and
certificate definitions are preserved.

`LowerAnalytic/CircularFourth.lean` proves the scale-invariant bound
`E |q|⁴ ≤ 44 (E |q|²)²` for circular third chaos, using the existing complex
contraction identities and Hilbert–Schmidt inequalities. It also proves the
sharp fluctuation range `x ≤ √42`. The bound 44 is attained by the normalized
one-coordinate Wick cubic; the analytic extremizer calculation and an
all-even-moment extension are in [CIRCULAR_FOURTH_MOMENT.md](CIRCULAR_FOURTH_MOMENT.md).
Those additional sharpness and higher-moment claims are not Lean theorems.
The law cells of the rows of the lower bound cover the larger range `x ≤ 31/4`.

`LowerAnalytic/JointSixthCore.lean` contains the common Hilbert–Schmidt,
cubic-trace, completed-square and scalar Young estimates, followed by the
circular J2/J3 inequalities. `JointContractions.lean` retains the general
tensor-to-Gram identities and specializes this core for `Circular.joint_sixth`.
`JointSixth.lean`, archived under `abandonware/Grothe/LowerAnalytic/`
and not built, uses the same identities and core for its invariant adapters
and capped/η refinements. No positivity of the symmetrized contraction
operator is assumed.

Weaker upper-bound variants, their data and their historical verification records
are in git history only ([`abandonware/README.md`](../abandonware/README.md) gives the commit).

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

**Lower bound.** `Grothe.Statement.sparse_stein_endpoint` applies `sparseSteinEndpoint_le_of_tailNodeCaps` to the witness node caps and the six-channel existence proof. It gives `25000000000000/17831387166289 ≤ K`. Rounding strictly downward gives the lower half of `main_bounds`. [Certificate](../Grothe/Lower/Cert/SparseEnvelope.lean) · [Matrix transfer](../Grothe/LowerAnalytic/SparseSteinBound.lean).

The two central rows use the fourth excess and residual scale of the same normalized circular cubic. Lean extracts eleven plain polynomials from the original rows and checks their majorants on the full nonnegative radius axis. The cut-dilation identity moves them to four target scales. The signed offset and the cubic moment bounds give fourteen additional ordinates across the shape intervals. [Dilation identity](../Grothe/Lower/CutDilation.lean) · [Moment bound for a transported node](../Grothe/Lower/SparseNodePricing.lean) · [Witnesses](../Grothe/LowerAnalytic/SparseWitnessData.lean).

For each of the nineteen common shape intervals the proof selects two expectation chords that bracket the actual scale. It checks the nine mixture prices on their closed scale intersections twice, over the full physical scale range and up to 21/100. The outward grid bounds handle interior quadratic extrema. `SparseStein.actual_deductions` combines the expectation bounds and the Gaussian gate for both physical rows. The strict curvature of the common Schur complement gives a quadratic interpolation gain. Rows 06 and 07 supply a joint deduction from quadratic majorants. On amplitude cell 34, the ordinary rows 13 and 14 use the same clipped affine weight rule as the other scalar pairs. The 38 amplitude cells then give $\hat B=8829435313/12500000000$. [Central prices](../Grothe/LowerAnalytic/SparseSteinPrices.lean) · [Actual row inequalities](../Grothe/LowerAnalytic/SparseSteinRows.lean) · [Outer rows](../Grothe/LowerAnalytic/SparseOuterRows.lean) · [Amplitude envelope](../Grothe/Lower/SparseSteinEnvelope.lean).

`witnessCap_of_circular_profile` transports that cap through the phase reduction, the mass row and `circularReductionHyp_of_nodeCaps`. `transferInputs_of_witnessCap` and `transfer_lower` convert the resulting dimension-uniform witness into a lower bound for finite matrices. The node caps enter through `tailNodeCaps_cert`. The joint-price proof uses Lean’s standard axioms. The scalar-row part inherits the existing native checks on rows 01–07 and 10–14. [Node-cap proof](CAPS.md).

**Antiholomorphic Stein calculus and `93/100` cubic radius.** `Grothe/LowerAnalytic/AntiStein.lean` proves the two
radial antiholomorphic Stein identities (`antiStein_I`, `antiStein_II`), the Cauchy–Schwarz cone inequality
(`radAB_sq_le_radC1_mul_radC2`) and the exact contraction second-moment identities for circular cubics in $H_{2,1}$.
`Grothe/LowerAnalytic/RadiusRowCheck.lean`, `RadiusCheck.lean`, `RadiusRows/Row00.lean`–`Row22.lean` and
`SharpRadius.lean` certify $\mathbb{E}|q| \le (93/100)\|q\|_2$ (`first_moment_lt_93`, `norm_pres_le_93`) by 23
kernel-checked integer-Bernstein rows generated by `tools/gen_radius_data.py` from `data/cubic-radius/cert_N_final/`.
`Grothe/LowerAnalytic/AntiSteinRowCheck.lean`, `AntiSteinChunk.lean`, `AntiSteinRowSound.lean` and `NodeListParse.lean`
check and prove the soundness (`checkAntiCells_sound`) of the two tightened rows `0.835` and `0.845` generated by
`tools/gen_antistein_rows.py` from `data/antistein-rows/`, with zero new `native_decide` axioms.

The complete registry of native facts is `data/axioms/native.txt`; the default report
is `scratch/Axioms.lean`, with its required declarations in
`data/axioms/required.txt`. CI checks the report on every pushed branch, and on
the merged tree before a pull request lands.

The repository-wide axiom audit permits `propext`, `Classical.choice`, `Quot.sound`,
and the `native_decide` facts pinned in
`data/axioms/native.txt` (read by `scripts/check_axioms.py`). That file is the
complete list; the facts fall into the following groups. The six-channel upper proof
uses the `Haagerup.Data` cell-witness and overlap-table facts (`Haagerup.Data.tcell_rows_ok`,
`tcell_sos_ok`, `tig_mu_ok`, `tig_sos_ok`) and, from its certificate `Grothe/UpperSix/Certificate/`, the weighted head with
the linear floors and the contour checks of the first channel (`Haagerup.SixChannel.head_and_floors_ok`,
`region_ok`, `mean_ok`). The disk and circle checks of the other five channels (`Haagerup.reg1_ok`–`reg5_ok`,
`Haagerup.mean1_ok`–`mean5_ok`) and the rational tail comparisons reduce directly in the kernel. The upper-six
allowlist is `data/axioms/modes/upper-six.native.txt`. The seven-channel root theorem adds the native
comparison `Haagerup.AngularSelector.NumericWitness.budgets_ok` for the signed mixed head and the full selector allowance.
The lower-bound native facts are the row checks `Grothe.Lower.certRowSS`
and the node-cap facts in `Grothe.LowerAnalytic`: the range facts `rowKKAnchorRangeJJ`
of the whole-fibre nodes, the coverage facts `pieceCover_KKx<i>` and the piece facts
`pieceRange_KKx<i>_<J>` of the localised nodes, and the chord facts `chordsOKRowKK`.
Every native check is single-threaded (no `Task.spawn`). All
other accepted finite computations (the polynomial norms, the moment covers, the positivity of
the row blocks `psdRowKK`) use proof-producing kernel reduction, including the canonical
continuation-block checks.
The report is `lake env lean scratch/Axioms.lean`, checked in CI;
the node caps are in the same report. The generic response, cubic-ceiling
and quintic-transfer lemmas are archived
and are not part of the build. No `sorry`,
no warnings.
