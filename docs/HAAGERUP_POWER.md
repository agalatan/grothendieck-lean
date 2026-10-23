# Hypothesis-free upper bound by finite-power contraction

`Grothe.haagerup_bound` proves

\[
K_G^{\mathbb C}\le 1.404951
\]

for all finite complex matrices, with **no Gaussian, integration, or tail hypotheses**.
The sharper conditional upper bound and the lower endpoint are unchanged.

The phase-rounding identity, tensor realization, complete finite residual,
infinite-series estimate, checker soundness and residual transfer are all in
Lean. One pinned `native_decide` fact checks three finite statements using
outward integer arithmetic. An independent FLINT ball-polynomial calculation
checks the complete finite composition, not just sampled coefficients.

## The reusable improvement

A polynomial of coefficient norm one need not have every power of norm one.
If `l1 P <= 1` and `l1 (P^4) <= q < 1`, submultiplicativity yields

\[
\|X^kP^{2k+1}\|_1\le q^{\lfloor k/2\rfloor}.
\]

`Grothe.Upper.PowerTail.compTerm_power_bound` proves this for every real
polynomial. `weighted_composition` transports the individual prices through
an absolutely summable radial correlation kernel. The sum uses the same
signed coefficients before taking the absolute coefficient norm.

There is an exact obstruction for simpler preprocessors: if
`abs (P.eval (-1)) = l1 P = 1`, then `l1 (P^n) = 1` for every power.
`no_power_saving_of_boundary` proves this. In particular, a normalized
`a - bX - cX^3` with nonnegative `a,b,c` cannot save anything this way.
A negative even-index coefficient breaks that common boundary phase.

## Exact data and complete tail

The preprocessor is `p(t) = t P(t^2)` with

\[
P(X)=\frac{906284633979-93047318709X-490402143X^3
-125872719X^4-38769671X^5-13002779X^6}{10^{12}}.
\]

Its coefficient norm equals one; its fourth-power norm is below
`q = 199787/200000`. The positive normalized Haagerup coefficients satisfy
`r_0=1` and `r_(k+1)=r_k (2k+1)^2/(4(k+1)(k+2))`.
Their monotone majorant `g_k=r_k(k+1)(2k+1)` obeys
`g_2000 <= gamma = 637/1000`.

The finite checker evaluates every coefficient of
`P sum_(k<2000) r_k (X P^2)^k`, with radial cutoff 26,000, and accepts the
normalized residual `11/10^6` against `a = 906284633979/10^12`.

For the entire infinite suffix, consecutive pairs telescope:

\[
r_k+r_{k+1}\le\frac\gamma2\left(\frac1k-\frac1{k+2}\right).
\]

The finite recurrence

\[
T_{k,0}=1/k,\qquad T_{k,N+1}=1/k-1/(k+2)+qT_{k+2,N}
\]

retains the uncomputed remainder through its unweighted telescope. The
formal theorem `weighted_tail_bound` applies to any nonnegative summable
sequence with these coarse and two-step bounds. Here it proves

\[
\sum_{k\ge2000} r_k q^{\lfloor k/2\rfloor}
\le (\gamma/2)q^{1000}T_{2000,8192}<27/1250000.
\]

With the factor `pi/4`, the total residual is at most
`(pi/4) (11/10^6 + 27/1250000)`. The existing residual transfer and a proved
lower enclosure of pi give the public endpoint.

## Source and verification

- `/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/PowerTail.lean`: general contraction, weighted telescope, boundary obstruction, and finite-checker soundness.
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/GrotheKernel/PowerTail.lean`: outward fixed-point computations, using the existing 128-bit scale.
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Haagerup/PowerCheck.lean`: exact preprocessor and one sequential native certificate.
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Haagerup/Power.lean`: infinite-series proof and unconditional matrix bound.
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/haagerup-power.tex`: full manuscript proof.
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/haagerup_power_certificate.json`: portable exact parameters.

From any directory, the independent replay needs only `python-flint` and
Python's standard library:

```sh
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_haagerup_power.py /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/haagerup_power_certificate.json --out /tmp/haagerup-power-replay.json
```

The replay binds every numerical parameter to the Lean source. Floating
searches only proposed the polynomial; they are absent from acceptance.
The Lean theorem has no numerical premises. Its axiom report uses only
`propext`, `Classical.choice`, `Quot.sound`, and
`Grothe.HaagerupPower.check._native.native_decide.ax_1_1`.
The old finite preprocessor certificate is removed rather than retained as
a second public bound. No node-cap source is changed.

## Auditing the proof

The focused report prints all 28 public results in this route, and its strict
checker permits only the one native fact belonging to this certificate:

```sh
lake env lean /Users/alingalatan/workspaces/grothe-codex-joint-image/scratch/AxiomsPower.lean | python3 /Users/alingalatan/workspaces/grothe-codex-joint-image/scripts/check_axioms.py --haagerup-power
```

Run the command from the worktree root so Lake selects its pinned toolchain.
The default CI report includes the same 28 results and all other required
repository theorems. Missing results, Lean errors and numerical facts from
other certificates are rejected by the focused checker.

Fresh replay results and the axiom report are in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/verification/haagerup-power-20261023/`.
The manifest binds those results to the Lean sources and portable certificate.
The new TeX proof and updated overview compile without layout warnings.
