# The constants

This page states every bound on the complex Grothendieck constant $K = K_G^{\mathbb C}$ that this repository
proves, exactly as Lean states it, and explains the other numbers that appear in the sources and documents.
`scripts/check_constants.py` reads the two bounds from `main_bounds` and the exact values behind them from
`Grothe.Upper.bound` and the `endpoint_eq` of the lower certificate that the proof of `main_bounds` uses. It checks that each bound is the outward rounding of its
exact value, and that this page and the other documents state them.

## The current bounds

$$1.4020221627 < K \le 1.404556392 < 1/\gamma^\dagger = 1.40457593\ldots$$

| | decimal | exact rational in Lean | theorem | file |
|---|---|---|---|---|
| lower bound (strict) | `1.4020221627` | `14020221627 / 10000000000` | `Grothe.Statement.main_bounds`, first part | `Grothe/MainResult.lean` |
| upper bound (weak, $\le$) | `1.404556392` | `1404556392 / 1000000000` | `Grothe.Statement.main_bounds`, second part; `Grothe.Upper.constant_le` | `Grothe/MainResult.lean`, `Grothe/Upper/Result.lean` |
| Haagerup's value (strict) | `1.40457593…` | `1 / gammaDagger` | `Haagerup.constant_lt_inv_gammaDagger` (article's package) | `haagerup-article/anc/` |

`main_bounds` reads

```lean
theorem main_bounds :
    (14020221627 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556392 / 1000000000
```

It has no hypotheses. Its axioms are Lean's three standard ones and `native_decide` facts that are all among those
listed in `data/axioms/native.txt` (the list covers every headline theorem of the repository); the set for this
theorem is what `#print axioms Grothe.Statement.main_bounds` prints (`scratch/Axioms.lean`).

Each bound is the rounding of an exact value that Lean also states.

| | exact value | decimal | theorem | rounding |
|---|---|---|---|---|
| lower endpoint ($\le K$) | the fraction `SparseEnvelope.endpoint` [below](#behind-the-lower-bound) | $1.402022162766089736\ldots$ | `Grothe.Statement.sparse_stein_endpoint` | strictly downward (`SparseEnvelope.rounded_lt`) |
| upper bound ($K \le$) | $10^{27}/711968565817136711740669035$ | $1.404556391969756991\ldots$ | `Grothe.Upper.bound` | up to nine decimals (`Grothe.Upper.constant_le`) |

**What the bounds say for one matrix.** For a finite complex matrix $A$ let $C(A)$ be the supremum of
$\lvert\sum a_{ij}\overline{\varepsilon_i}\delta_j\rvert$ over unimodular scalars and $V(A)$ the supremum of
$\lvert\sum a_{ij}\langle x_i,y_j\rangle\rvert$ over unit vectors of a complex Hilbert space
(`scalarOpt`, `vectorOpt` in `Grothe/Statement.lean`). A number $K$ is a *Grothendieck bound* (`IsBound K`) if
$V(A)\le K\,C(A)$ for every $A$, and $K_G^{\mathbb C}$ is the infimum of the Grothendieck bounds.

- Upper bound: `Grothe.Upper.bound : IsBound ((10 : ℝ) ^ 27 / 711968565817136711740669035)`. For every finite
  complex matrix, $V(A)\le [10^{27}/711968565817136711740669035]\,C(A)$.
- Lower bound: every Grothendieck bound is at least the lower endpoint; for every $K$ below the endpoint some
  matrix has $V(A) > K\,C(A)$.

## Haagerup's value

$\gamma^\dagger=\int_0^{\pi/2}\cos^2 t\,(1+\sin^2 t)^{-1/2}\,dt = 0.711958659\ldots$, and $1/\gamma^\dagger = 1.404575934\ldots$
is the value Haagerup proposed for $K$ in 1987. The comparison $K < 1/\gamma^\dagger$ is proved in the article's package [`haagerup-article/anc`](../haagerup-article/anc), `Haagerup.constant_lt_inv_gammaDagger` (from
its own bound and $0.711958633 < \gamma^\dagger < 0.711958683$); the main target does not define $\gamma^\dagger$.

The upper bound is below Haagerup's value by about $1.95\cdot10^{-5}$. Haagerup's own 1987 theorem is the weaker
bound $K < 1.40490913\ldots$

## Behind the lower bound

The witness is $T = P_{1,0} - \varepsilon P_{2,1} + \nu(1 - P_{1,0} - P_{2,1})$. Lean bounds
$\lvert\langle f, Tg\rangle\rvert$ for unimodular $f$, $g$ by $B = (1-\nu)\hat B + \nu$, and the transfer to matrices
gives $K \ge 1/B$ (`Grothe.Statement.sparse_stein_endpoint`).

| Quantity | Exact value | Role |
|---|---|---|
| $\varepsilon,\nu$ | $191/250,\ 47/2000$ | cubic coefficient and identity-tail weight |
| $\hat\varepsilon,\hat\nu$ | $25/31,\ 47/1953$ | normalized coefficients of the rows |
| $\hat B$ | $8829435313/12500000000$ | scalar cap from the transported Stein cuts, the two pairs of Gaussian gates and the curvature of the central Schur complement |
| $B=(1-\nu)\hat B+\nu$ | $17831387166289/25000000000000$ | witness scalar cap |
| $1/B$ | `25000000000000 / 17831387166289` | exact lower endpoint, $1.4020221627660897369\ldots$ |

In the central rows (0.835 and 0.845), a single circular cubic supplies the fourth excess and the residual scale.
Dilating eleven plain Stein polynomials gives fourteen additional bounds for the row expectations. Lean checks
the two expectations on each common shape interval at nine mixture weights, both globally and on scales
up to 0.21. The Schur curvature floor $2019911/10^{10}$ and the small-scale prices yield a quadratic
discount between the weights. Rows 0.82 and 0.83 use quadratic bounds for their potentials and their
joint gate. The existing scalar rows 13 and 14 interpolate on the amplitude interval containing their crossover.
Taking the maximum on the 38-cell amplitude cover gives $\hat B$. [Exact endpoint](../Grothe/Lower/Cert/SparseEnvelope.lean) · [Proof and replay](../research/identity-tail/CURVED_SCHUR.md).

The mass row uses $\lambda=1/2$, $c=2\hat\nu+\lambda=2141/3906$ and $\delta=3/4$.
At witness scale $\tau$, its potential $\varphi_c(\tau v/\delta)$ changes from quadratic to affine
at $v=c\delta/(\hat\varepsilon\tau)$. Lean checks both branches in the kernel. [Mass-row certificate](../Grothe/Lower/Cert/MassRow.lean).

## Behind the upper bound

The certificate mixes six established Gaussian rounding channels with an angular selector. The original channels are three smoothed cell roundings, one phase rounding, and two reflected tiger roundings. Their certified heads contain 321 terms for the phase channel and 251 for each of the three smoothed cell channels and the two reflected tiger channels. Their individual Hardy tail caps carry over from `Grothe/Upper/Certificate/`.

The seventh channel uses angle parameter `17/100` and polynomial `23/25 − (2/25)X`. Lean computes its first 251 signed coefficients at denominator `2^89` from 1,856 scalar phase grades, 72 folded frequencies, 240 radial terms and 296 binomial coefficients. Its full Wiener error pays for every omitted coefficient, rounding step and tail. Taking absolute values after mixing all seven heads preserves signed cancellation.

| quantity | exact value | Lean declaration |
|---|---|---|
| target slope | `1` | `NumericWitness.center` |
| weighted head deviation | at most `288031377559546 / 10^15` | `NumericWitness.head_ok` |
| seventh column's full Wiener allowance | at most `162464451464 / 10^15` | `NumericWitness.selector_budget_ok` |
| weighted sum of the six tail caps and the selector allowance | `56623317288259330965 / 10^27` | weighted error in `NumericWitness.residual` |
| total residual | `288031434182863288259330965 / 10^27` | `NumericWitness.residual_eq` |
| transfer factor | `10^27 / 711968565817136711740669035` | `Grothe.Upper.Selector.isBound`, `Grothe.Upper.bound` |
| bound rounded upward | `1404556392 / 1000000000` | `Grothe.Upper.constant_le`, `main_bounds` |

The analytic realization, integer algorithms and full-error theorem use Lean's kernel. The additional native comparison evaluates the seven weighted heads and the selector allowance from their definitions. [Physical column](../Grothe/Upper/Selector/PhysicalColumn.lean) · [Finite comparison](../Grothe/Upper/Selector/NumericWitness.lean) · [Transfer theorem](../Grothe/Upper/Selector/MixedPhysical.lean).

## Other numbers you will meet

None of these is the current bound.

| number | what it is | where |
|---|---|---|
| `1.4020110501` | earlier endpoint of the identity-tail witness with the original two Stein chord tables and their common gate, $1/B=4000000000000/2853044560237$ | [original profile and replay](../research/identity-tail/COUPLED_STEIN.md) |
| `1.4019156097` | an earlier lower bound of this repository: the sharp envelope of the scalar rows with the common Gaussian gate of rows `0.835` and `0.845` (gain $243/10^8$, $1/B = 1.401915609708473171\ldots$) | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/8c08cc4285123b688dbc5f6a796c0fe78a0509b1/Grothe/Lower/Cert/SharedGate.lean) |
| `1.40191478` | an earlier lower bound of this repository: the shared gate with its first parameters (gain $2/10^6$) | git history |
| `1.4019109461` | an earlier lower bound of this repository: the sharp envelope alone, $1/((1-\nu)\hat B_*+\nu) = 1.401910946113565640\ldots$ | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/8c08cc4285123b688dbc5f6a796c0fe78a0509b1/Grothe/Lower/Cert/SharpEnvelope.lean) |
| `1.40191` | an earlier lower bound of this repository, $1.40191 < K$: the same witness and rows with an envelope of fixed mixtures, $B_{\mathrm{env}} = 7064131/10^7$ and $1/B = 1.4019103\ldots$ | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/9c82551ea8d4c744be71ff29999d547cb2adcb84/Grothe/LowerAnalytic/LowerBound.lean) |
| `1.4018` | the design target of the lower certificate | `research/identity-tail/` |
| `1.401700322371` | an earlier lower bound, from the witness $\varepsilon = 1891/2500$ without identity tail | history in `research/` |
| `1.40455741` | an earlier upper bound of this repository: the older certificate's value $1/(c-\delta) = 1.4045574031\ldots$ rounded up to eight decimals | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/9c82551ea8d4c744be71ff29999d547cb2adcb84/Grothe/Upper/Rounding/CertCheck.lean) |
| `1.40456` | the article's bound (`140456 / 100000`, `Haagerup.constant_le` in the article's own Lean package); the package also states its certificate's exact value $10^{24}/711968053274152967940951 = 1.4045574031\ldots$ (`Grothe.Upper.isBound_cert`, `Grothe.Upper.certificate_value`) | `haagerup-article/`, `haagerup-article/anc/Grothe.Upper.lean` |
| `1.404556407` | the six-channel root certificate before adding the angular selector | `Grothe.Upper.Channels.isBound` |
| `1.40455641` | an earlier upper bound of this repository: a six-channel certificate with a common cutoff of 251 | git history |
| `1.40457588`, `1.40455742` | earlier upper bounds of this repository | git history |
| `1.404599395362` | the bound of the removed single-channel upper proof, $K < 1.404599395362$ (one Gaussian rounding channel; weaker than the current bound, and above Haagerup's value $1/\gamma^\dagger$) | `Grothe.Statement.upper_below_tight` at commit `460c76731` (`Grothe/UpperTightFinal.lean`), the last one that holds it |
| `1.40490913…` | Haagerup's 1987 upper bound | prior work |
| `1.404898554746`, `1.4` | Heilman–Jones–Malavolta's bounds, September 2026 | prior work |
| `1.35584631827168` | Guo–Fang–Lu's lower bound, September 2026 | prior work |
| `1.33807` | Davie's lower bound, 1984 | prior work |
| `1.403`, `1.4023`, … | research targets and ceilings of methods, not theorems | `research/` |

## When a bound changes

1. Change the Lean statements (`Grothe/MainResult.lean`, `Grothe/Upper/Result.lean`) and prove them.
   `Grothe/Statement.lean` holds the definitions and no number.
2. Run `python3 scripts/check_constants.py`. It lists every document that still quotes the old value.
3. Update this page, `README.md`, `docs/LEAN_DETAILS.md`, `docs/overview.tex`, the research ledgers that quote the
   bound and the project skill, until the script passes. Add the old value to the table above and, if it must not
   reappear in `README.md` or the skill, to `RETIRED` in the script.

The article in `haagerup-article/` is frozen and has its own Lean package under `haagerup-article/anc/`. The article states the
bound of its own package. It does not quote the repository's bounds, and is not updated when they change.
