# The constants

This page states every bound on the complex Grothendieck constant $K = K_G^{\mathbb C}$ that this repository
proves, exactly as Lean states it, and explains the other numbers that appear in the sources and documents.
`scripts/check_constants.py` reads the two bounds from `main_bounds` and the exact values behind them from
`Grothe.UpperBivar.bound` and the `endpoint_eq` of the lower certificate that the proof of `main_bounds` uses. It checks that each bound is the outward rounding of its
exact value, and that this page and the other documents state them.

## The current bounds

$$1.4020237104 < K \le 1.404554025 < 1/\gamma^\dagger = 1.40457593\ldots$$

| | decimal | exact rational in Lean | theorem | file |
|---|---|---|---|---|
| lower bound (strict) | `1.4020237104` | `14020237104 / 10000000000` | `Grothe.Statement.main_bounds`, first part | `Grothe/MainResult.lean` |
| upper bound (weak, $\le$) | `1.404554025` | `1404554025 / 1000000000` | `Grothe.Statement.main_bounds`, second part; `Grothe.UpperBivar.constant_le` | `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` |
| Haagerup's value (strict) | `1.40457593…` | `1 / gammaDagger` | `Grothe.UpperBivar.constant_lt_inv_gammaDagger` | `Grothe/UpperResult.lean` |

`main_bounds` reads

```lean
theorem main_bounds :
    (14020237104 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404554025 / 1000000000
```

It has no hypotheses. Its axioms are Lean's three standard ones and `native_decide` facts that are all among those
listed in `data/axioms/native.txt` (the list covers every headline theorem of the repository); the set for this
theorem is what `#print axioms Grothe.Statement.main_bounds` prints (`scratch/Axioms.lean`).

Each bound is the rounding of an exact value that Lean also states.

| | exact value | decimal | theorem | rounding |
|---|---|---|---|---|
| lower endpoint ($\le K$) | `1000000000000 / 713254699303` | $1.402023710432206792\ldots$ | `Grothe.Statement.first_chaos_endpoint` | strictly downward (`Grothe.Lower.FirstChaos.rounded_lt`) |
| upper bound ($K \le$) | $10^{27}/711969765819834623238463058$ | $1.404554024634034818\ldots$ | `Grothe.UpperBivar.bound` | up to nine decimals (`Grothe.UpperBivar.constant_le`) |

**What the bounds say for one matrix.** For a finite complex matrix $A$ let $C(A)$ be the supremum of
$\lvert\sum a_{ij}\overline{\varepsilon_i}\delta_j\rvert$ over unimodular scalars and $V(A)$ the supremum of
$\lvert\sum a_{ij}\langle x_i,y_j\rangle\rvert$ over unit vectors of a complex Hilbert space
(`scalarOpt`, `vectorOpt` in `Grothe/Statement.lean`). A number $K$ is a *Grothendieck bound* (`IsBound K`) if
$V(A)\le K\,C(A)$ for every $A$, and $K_G^{\mathbb C}$ is the infimum of the Grothendieck bounds.

- Upper bound: `Grothe.UpperBivar.bound : IsBound ((10 : ℝ) ^ 27 / 711969765819834623238463058)`. For every finite
  complex matrix, $V(A)\le [10^{27}/711969765819834623238463058]\,C(A)$.
- Lower bound: every Grothendieck bound is at least the lower endpoint; for every $K$ below the endpoint some
  matrix has $V(A) > K\,C(A)$.

## Haagerup's value

$\gamma^\dagger=\int_0^{\pi/2}\cos^2 t\,(1+\sin^2 t)^{-1/2}\,dt = 0.711958659\ldots$ (`Haagerup.Statement.gammaDagger`,
`Grothe/UpperSix/Haagerup/Statement.lean`), and $1/\gamma^\dagger = 1.404575934\ldots$ is the value Haagerup proposed
for $K$ in 1987.

| fact | Lean |
|---|---|
| $0.711958633 < \gamma^\dagger < 0.711958683$ | `Haagerup.gammaDagger_bounds` (`Grothe/UpperSix/Haagerup/GammaDagger.lean`) |
| $K < 1/\gamma^\dagger$ | `Grothe.UpperBivar.constant_lt_inv_gammaDagger`, from $K \le 1.404554025$ and $1.404554025\cdot 0.711958683 < 1$ |

The upper bound is below Haagerup's value by about $2.19\cdot10^{-5}$. Haagerup's own 1987 theorem is the weaker
bound $K < 1.40490913\ldots$

## Behind the lower bound

Let $T_0=P_{1,0}-(191/250)P_{2,1}+(47/2000)(I-P_{1,0}-P_{2,1})$. The witness is
$T=(1-w)T_0+wP_{1,0}$. Its vector payoff tends to one, so its scalar cap $B$ gives $K\ge 1/B$.
[Payoff and transfer](../Grothe/LowerAnalytic/FirstChaosProfile.lean) · [Exact endpoint](../Grothe/Lower/Cert/FirstChaos.lean).

| Quantity | Exact value | Role |
|---|---|---|
| $w$ | $3645203/50000000000$ | weight on the first-chaos projector |
| $\hat\varepsilon,\hat\nu$ | $25/31,\ 47/1953$ | normalized coefficients of the original identity-tail rows |
| $B$ | `713254699303 / 1000000000000` | physical scalar cap |
| $1/B$ | `1000000000000 / 713254699303` | exact lower endpoint in `Grothe.Lower.FirstChaos.endpoint` |
| $0\le\lambda\le w/50000000$ | $0\le\lambda\le3645203/2500000000000000000$ | extra multiplier in the companion $T+\lambda P_{3,2}$ |

For $h=(f+g)/2$ write $t=\|P_{1,0}h\|$. The certificate prices the first-chaos payoff together with
$(w/50000000)(1-t^2)$. Bessel's inequality charges the extra signed fifth-chaos contribution to this allowance.
The pure and perturbed partners attain the same cap rounded upward to $10^{-12}$. The pure partner has the
smaller unrounded upper envelope. Two rational amplitude evaluations certify that changing $w$ cannot improve
the rounded cap on the fixed first-chaos row schedule. [Replay and comparison](../research/identity-tail/RETUNED_QUINTIC.md).

In the central rows (0.835 and 0.845), a single circular cubic supplies the fourth excess and the residual scale.
Dilating eleven plain Stein polynomials gives fourteen additional bounds for the row expectations. Lean checks
the two expectations on each common shape interval at nine mixture weights, both globally and on scales
up to 0.21. The Schur curvature floor $2019911/10^{10}$ and the small-scale prices yield a quadratic
discount between the weights. Rows 0.82 and 0.83 use quadratic bounds for their potentials and their
joint gate. The existing scalar rows 13 and 14 interpolate on the amplitude interval containing their crossover.
On each closed segment the checker bounds the weighted sum of the row estimate and the $t^2$ term. Taking the maximum over all segments gives $B$. [Mixed amplitude profile](../Grothe/LowerAnalytic/FirstChaosProfile.lean) · [Original row estimates](../research/identity-tail/CURVED_SCHUR.md).

The mass row uses $\lambda=1/2$, $c=2\hat\nu+\lambda=2141/3906$ and $\delta=3/4$.
At witness scale $\tau$, its potential $\varphi_c(\tau v/\delta)$ changes from quadratic to affine
at $v=c\delta/(\hat\varepsilon\tau)$. Lean checks both branches in the kernel. [Mass-row certificate](../Grothe/Lower/Cert/MassRow.lean).

## Behind the upper bound

The certificate mixes the established Gaussian rounding channels of `Grothe/UpperSixExact/` with twelve additional preprocessors on the same three certified maps (`Grothe/UpperBivar/`): eight smoothed cell channels (`tcellRows`, 251 head terms each, including degree-3 bivariate second-coordinate polynomials `Q(X)` with `Q(0) = 0`), two phase channels (`haagMuList 321`, 321 head terms each), and two reflected tiger channels (`tigMuList`, 251 head terms each). Sixteen of the eighteen slots carry positive weight. Taking absolute values after mixing all heads preserves signed cancellation, and every new disk positivity check, Hardy circle budget, and rational tail comparison reduces in Lean's kernel (`TaylorHardy`).

| quantity | exact value | Lean declaration |
|---|---|---|
| target slope | `1` | `UpperBivar.center` |
| weighted head deviation | at most `288030166169678 / 10^15` | `UpperBivar.head_ok` |
| weighted sum of the tail caps | `68010487376761536942 / 10^27` | weighted error in `UpperBivar.residual` |
| total residual | `288030234180165376761536942 / 10^27` | `UpperBivar.residual_eq` |
| transfer factor | `10^27 / 711969765819834623238463058` | `Haagerup.UpperBivar.isBound`, `Grothe.UpperBivar.bound` |
| bound rounded upward | `1404554025 / 1000000000` | `Grothe.UpperBivar.constant_le`, `main_bounds` |

The analytic realization, kernel-checked Taylor-model contour budgets, and variable-cutoff transfer use Lean's kernel. One native comparison (`Haagerup.UpperBivar.budgets_ok`) evaluates the weighted interval head and the twelve linear floors from their definitions. [Parameters](../Grothe/UpperBivar/Parameters.lean) · [Contour checks](../Grothe/UpperBivar/ContourChecks.lean) · [Head comparison](../Grothe/UpperBivar/Head.lean) · [Transfer theorem](../Grothe/UpperBivar/Bound.lean).

## Other numbers you will meet

None of these is the current bound.

| number | what it is | where |
|---|---|---|
| `1.404556392` | an earlier upper bound of this repository: the seven-channel angular-selector certificate, $10^{27}/711968565817136711740669035 = 1.4045563919697\ldots$ rounded up to nine decimals | `Haagerup.AngularSelector.isBound` (`Grothe/UpperSelector/Bound.lean`) |
| `1.4020110501` | earlier endpoint of the identity-tail witness with the original two Stein chord tables and their common gate, $1/B=4000000000000/2853044560237$ | [original profile and replay](../research/identity-tail/COUPLED_STEIN.md) |
| `1.4019156097` | an earlier lower bound of this repository: the sharp envelope of the scalar rows with the common Gaussian gate of rows `0.835` and `0.845` (gain $243/10^8$, $1/B = 1.401915609708473171\ldots$) | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/8c08cc4285123b688dbc5f6a796c0fe78a0509b1/Grothe/Lower/Cert/SharedGate.lean) |
| `1.40191478` | an earlier lower bound of this repository: the shared gate with its first parameters (gain $2/10^6$) | git history |
| `1.4019109461` | an earlier lower bound of this repository: the sharp envelope alone, $1/((1-\nu)\hat B_*+\nu) = 1.401910946113565640\ldots$ | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/8c08cc4285123b688dbc5f6a796c0fe78a0509b1/Grothe/Lower/Cert/SharpEnvelope.lean) |
| `1.40191` | an earlier lower bound of this repository, $1.40191 < K$: the same witness and rows with an envelope of fixed mixtures, $B_{\mathrm{env}} = 7064131/10^7$ and $1/B = 1.4019103\ldots$ | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/9c82551ea8d4c744be71ff29999d547cb2adcb84/Grothe/LowerAnalytic/LowerBound.lean) |
| `1.4018` | the design target of the lower certificate | `research/identity-tail/` |
| `1.401700322371` | an earlier lower bound, from the witness $\varepsilon = 1891/2500$ without identity tail | history in `research/` |
| `1.40455741` | an earlier upper bound of this repository: the older certificate's value $1/(c-\delta) = 1.4045574031\ldots$ rounded up to eight decimals | [archived Lean certificate](https://github.com/agalatan/grothendieck-lean/blob/9c82551ea8d4c744be71ff29999d547cb2adcb84/Grothe/UpperSix/Haagerup/CertCheck.lean) |
| `1.40456` | the article's bound (`140456 / 100000`, `Haagerup.constant_le` in the article's own Lean package); the package also states its certificate's exact value $10^{24}/711968053274152967940951 = 1.4045574031\ldots$ (`Haagerup.isBound_cert`, `Haagerup.certificate_value`) | `haagerup-article/`, `haagerup-article/anc/Haagerup.lean` |
| `1.404556407` | the six-channel root certificate before adding the angular selector | `Haagerup.SixChannelExact.isBound` |
| `1.40455641` | an earlier upper bound of this repository: a six-channel certificate with a common cutoff of 251 | git history |
| `1.40457588`, `1.40455742` | earlier upper bounds of this repository | git history |
| `1.404599395362` | the bound of the older single-channel upper proof, $K < 1.404599395362$. Still proved and independent of the six-channel proof, but weaker, and above Haagerup's value | `Grothe.Statement.upper_below_tight`, `constant_lt_tight_upper` (`Grothe/UpperTightFinal.lean`); `docs/UPPER_STATUS.md` |
| `1.40490913…` | Haagerup's 1987 upper bound | prior work |
| `1.404898554746`, `1.4` | Heilman–Jones–Malavolta's bounds, September 2026 | prior work |
| `1.35584631827168` | Guo–Fang–Lu's lower bound, September 2026 | prior work |
| `1.33807` | Davie's lower bound, 1984 | prior work |
| `1.403`, `1.4023`, … | research targets and ceilings of methods, not theorems | `research/` |

## Six fixed rounding channels

For the six maps and preprocessors in `UpperSixExact`, retaining the same coefficient intervals, cutoffs and individual tail allowances, the transfer score of every convex mixture is at most `7119685648573 / 10^13`. The statement permits arbitrary real weights and arbitrary choices of enclosed coefficients. This is an upper bound on a certificate score. Its reciprocal is a limit on this fixed upper-certificate family. [Dual witness and theorem](../Grothe/UpperSixExact/ScoreCeiling.lean).

## When a bound changes

1. Change the Lean statements (`Grothe/MainResult.lean`, `Grothe/UpperResult.lean`) and prove them.
   `Grothe/Statement.lean` holds the definitions and no number.
2. Run `python3 scripts/check_constants.py`. It lists every document that still quotes the old value.
3. Update this page, `README.md`, `docs/LEAN_DETAILS.md`, `docs/overview.tex`, the research ledgers that quote the
   bound and the project skill, until the script passes. Add the old value to the table above and, if it must not
   reappear in `README.md` or the skill, to `RETIRED` in the script.

The article in `haagerup-article/` is frozen and has its own Lean package under `haagerup-article/anc/`. The article states the
bound of its own package. It does not quote the repository's bounds, and is not updated when they change.
