# The constants

This page states every bound on the complex Grothendieck constant $K = K_G^{\mathbb C}$ that this repository
proves, exactly as Lean states it, and explains the other numbers that appear in the sources and documents.
`scripts/check_constants.py` reads the two bounds from `main_bounds` and the exact values behind them from
`Grothe.UpperSeven.bound` and the `endpoint_eq` of the lower certificate that the proof of `main_bounds` uses. It checks that each bound is the outward rounding of its
exact value, and that this page and the other documents state them.

## The current bounds

$$1.4019156097 < K \le 1.404556392 < 1/\gamma^\dagger = 1.40457593\ldots$$

| | decimal | exact rational in Lean | theorem | file |
|---|---|---|---|---|
| lower bound (strict) | `1.4019156097` | `14019156097 / 10000000000` | `Grothe.Statement.main_bounds`, first part | `Grothe/MainResult.lean` |
| upper bound (weak, $\le$) | `1.404556392` | `1404556392 / 1000000000` | `Grothe.Statement.main_bounds`, second part; `Grothe.UpperSeven.constant_le` | `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` |
| Haagerup's value (strict) | `1.40457593…` | `1 / gammaDagger` | `Grothe.UpperSeven.constant_lt_inv_gammaDagger` | `Grothe/UpperResult.lean` |

`main_bounds` reads

```lean
theorem main_bounds :
    (14019156097 / 10000000000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 1404556392 / 1000000000
```

It has no hypotheses. Its axioms are Lean's three standard ones and `native_decide` facts that are all among those
listed in `data/axioms/native.txt` (the list covers every headline theorem of the repository); the set for this
theorem is what `#print axioms Grothe.Statement.main_bounds` prints (`scratch/Axioms.lean`).

Each bound is the rounding of an exact value that Lean also states.

| | exact value | decimal | theorem | rounding |
|---|---|---|---|---|
| lower endpoint ($\le K$) | the fraction `SharedGate.endpoint` [below](#behind-the-lower-bound) | $1.401915609708473171\ldots$ | `Grothe.Statement.shared_gate_endpoint` | strictly downward (`SharedGate.rounded_lt`) |
| upper bound ($K \le$) | $10^{27}/711968565817136711740669035$ | $1.404556391969756991\ldots$ | `Grothe.UpperSeven.bound` | up to nine decimals (`Grothe.UpperSeven.constant_le`) |

**What the bounds say for one matrix.** For a finite complex matrix $A$ let $C(A)$ be the supremum of
$\lvert\sum a_{ij}\overline{\varepsilon_i}\delta_j\rvert$ over unimodular scalars and $V(A)$ the supremum of
$\lvert\sum a_{ij}\langle x_i,y_j\rangle\rvert$ over unit vectors of a complex Hilbert space
(`scalarOpt`, `vectorOpt` in `Grothe/Statement.lean`). A number $K$ is a *Grothendieck bound* (`IsBound K`) if
$V(A)\le K\,C(A)$ for every $A$, and $K_G^{\mathbb C}$ is the infimum of the Grothendieck bounds.

- Upper bound: `Grothe.UpperSeven.bound : IsBound ((10 : ℝ) ^ 27 / 711968565817136711740669035)`. For every finite
  complex matrix, $V(A)\le [10^{27}/711968565817136711740669035]\,C(A)$.
- Lower bound: every Grothendieck bound is at least the lower endpoint; for every $K$ below the endpoint some
  matrix has $V(A) > K\,C(A)$.

## Haagerup's value

$\gamma^\dagger=\int_0^{\pi/2}\cos^2 t\,(1+\sin^2 t)^{-1/2}\,dt = 0.711958659\ldots$ (`Haagerup.Statement.gammaDagger`,
`Grothe/UpperSix/Haagerup/Statement.lean`), and $1/\gamma^\dagger = 1.404575934\ldots$ is the value Haagerup proposed
for $K$ in 1987.

| fact | Lean |
|---|---|
| $0.711958633 < \gamma^\dagger < 0.711958683$ | `Haagerup.gammaDagger_bounds` (`Grothe/UpperSix/Haagerup/GammaDagger.lean`) |
| $K < 1/\gamma^\dagger$ | `Grothe.UpperSeven.constant_lt_inv_gammaDagger`, from $K \le 1.404556392$ and $1.404556392\cdot 0.711958683 < 1$ |

The upper bound is below Haagerup's value by about $1.95\cdot10^{-5}$. Haagerup's own 1987 theorem is the weaker
bound $K < 1.40490913\ldots$

## Behind the lower bound

The witness is $T = P_{1,0} - \varepsilon P_{2,1} + \nu(1 - P_{1,0} - P_{2,1})$. Lean bounds
$\lvert\langle f, Tg\rangle\rvert$ for unimodular $f$, $g$ by $B = (1-\nu)\hat B + \nu$, and the transfer to matrices
gives $K \ge 1/B$ (`Grothe.Statement.shared_gate_endpoint`). The value of $1/B$ in Lean
(`SharedGate.endpoint_eq`, `Grothe/Lower/Cert/SharedGate.lean`) is

```text
909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
648511116026975442270455246402044140272423714548613432977518646121820234278296395631
```

which is $1.401915609708473171\ldots$

| quantity | value | meaning |
|---|---|---|
| $\varepsilon$ | `191/250` | weight of the cubic chaos in the witness |
| $\nu$ | `47/2000` | weight of the identity tail |
| $\hat\varepsilon$, $\hat\nu$ | `25/31`, `47/1953` | the same weights after dividing by $1-\nu$ (the "hat" normalisation of the rows) |
| $\hat B_*$ | `SharpEnvelope.hatCap` $= 0.7064127708804130589\ldots$ | the maximum of the sharp envelope of the certified rows (`SharpEnvelope.check`); an exact rational, the maximum of a quadratic |
| gain | `SharedGate.gain = 243 / 100000000` | what the Gaussian gate shared by the two active rows takes off the cap (`SharedGate.check`) |
| $\hat B = \hat B_* - \text{gain}$ | `SharedGate.hatCap` $= 0.7064103408804\ldots$ | bound of the hat value |
| $B = (1-\nu)\hat B + \nu$ | $0.7133096978\ldots$ | bound on $\lvert\langle f, Tg\rangle\rvert$ for unimodular $f$, $g$ |
| $1/B$ | `SharedGate.endpoint`, the fraction above | the lower endpoint; `main_bounds` states it rounded strictly downward |

**The sharp envelope.** Fifteen intervals cover the profile parameter $t\in[0,9/10]$. On fourteen of them a fixed
mixture of two rows is at most $\hat B_*$. On the central interval $[1672/2000, 1675/2000]$ the weight of row 0.845 in
its mixture with row 0.835 varies affinely with $t$, and the maximum of the resulting quadratic is $\hat B_*$. It is
the greatest value that the scalar inequalities of the rows permit (`SharpEnvelope.exact_scalar_cap`).

**The shared gate.** The two active rows (0.835 and 0.845) constrain the same Gaussian variable. For residual scale
$\tau\ge4649/20000$, completing the joint gate gives a saving of at least $1018\tau^2/10^7$ across the two rows. For
$\tau\le4649/20000$, a quadratic majorant saves $551/10^8$ on the first row. Pricing their common saving by the smaller
of the two mixture weights lowers the cap by the gain, on a cover of sixteen intervals. The row06/row07 interval uses
the weight $12/25$; on the row12/row13 interval the weight changes from $3/5$ to $22/25$ at $1758/2000$.

The mass row uses $\lambda=1/2$, $c=2\hat\nu+\lambda=2141/3906$ and $\delta=3/4$.
At witness scale $\tau$, its potential $\varphi_c(\tau v/\delta)$ changes from quadratic to affine
at $v=c\delta/(\hat\varepsilon\tau)$. Lean checks both branches in the kernel. [Mass-row certificate](../Grothe/Lower/Cert/MassRow.lean).

## Behind the upper bound

The certificate mixes six established Gaussian rounding channels with an angular selector. The original channels are three smoothed cell roundings, one phase rounding, and two reflected tiger roundings. Their certified heads contain 321 terms for the phase channel and 251 for each of the three smoothed cell channels and the two reflected tiger channels. Their individual Hardy tail caps carry over from `Grothe/UpperSixExact/`.

The seventh channel uses angle parameter `17/100` and polynomial `23/25 − (2/25)X`. Lean computes its first 251 signed coefficients at denominator `2^89` from 1,856 scalar phase grades, 72 folded frequencies, 240 radial terms and 296 binomial coefficients. Its full Wiener error pays for every omitted coefficient, rounding step and tail. Taking absolute values after mixing all seven heads preserves signed cancellation.

| quantity | exact value | Lean declaration |
|---|---|---|
| target slope | `1` | `NumericWitness.center` |
| weighted head deviation | at most `288031377559546 / 10^15` | `NumericWitness.head_ok` |
| seventh column's full Wiener allowance | at most `162464451464 / 10^15` | `NumericWitness.selector_budget_ok` |
| weighted sum of the six tail caps and the selector allowance | `56623317288259330965 / 10^27` | weighted error in `NumericWitness.residual` |
| total residual | `288031434182863288259330965 / 10^27` | `NumericWitness.residual_eq` |
| transfer factor | `10^27 / 711968565817136711740669035` | `Haagerup.AngularSelector.isBound`, `Grothe.UpperSeven.bound` |
| bound rounded upward | `1404556392 / 1000000000` | `Grothe.UpperSeven.constant_le`, `main_bounds` |

The analytic realization, integer algorithms and full-error theorem use Lean's kernel. The additional native comparison evaluates the seven weighted heads and the selector allowance from their definitions. [Physical column](../Grothe/UpperSelector/PhysicalColumn.lean) · [Finite comparison](../Grothe/UpperSelector/NumericWitness.lean) · [Transfer theorem](../Grothe/UpperSelector/MixedPhysical.lean).

## Other numbers you will meet

None of these is the current bound.

| number | what it is | where |
|---|---|---|
| `1.40191478` | an earlier lower bound of this repository: the shared gate with its first parameters (gain $2/10^6$) | git history |
| `1.4019109461` | an earlier lower bound of this repository: the sharp envelope alone, $1/((1-\nu)\hat B_*+\nu) = 1.401910946113565640\ldots$ | `SharpEnvelope.endpoint`, `SharpEnvelope.rounded_lt` (`Grothe/Lower/Cert/SharpEnvelope.lean`) |
| `1.40191` | an earlier lower bound of this repository, $1.40191 < K$: the same witness and rows with an envelope of fixed mixtures, $B_{\mathrm{env}} = 7064131/10^7$ and $1/B = 1.4019103\ldots$ | `envB`, `lower_bound_of_tailNodeCaps` (`Grothe/LowerAnalytic/LowerBound.lean`) |
| `1.4018` | the design target of the lower certificate | `research/identity-tail/` |
| `1.401700322371` | an earlier lower bound, from the witness $\varepsilon = 1891/2500$ without identity tail | history in `research/` |
| `1.40455741` | the upper bound of the article's Lean package (`140455741 / 100000000`, `Haagerup.isBound_cert`), and an earlier upper bound of this repository, from the same certificate: $1/(c-\delta) = 1.4045574031\ldots$ rounded up | `haagerup-article/`; `Grothe/UpperSix/Haagerup/CertCheck.lean` |
| `1.40456` | the article's bound as `README.md` quotes it, rounded up to five decimals | `README.md` |
| `1.404556407` | the six-channel root certificate before adding the angular selector | `Haagerup.SixChannelExact.isBound` |
| `1.40455641` | an earlier upper bound of this repository: a six-channel certificate with a common cutoff of 251 | git history |
| `1.40457588`, `1.40455742` | earlier upper bounds of this repository | git history |
| `1.404599395362` | the bound of the older single-channel upper proof, $K < 1.404599395362$. Still proved and independent of the six-channel proof, but weaker, and above Haagerup's value | `Grothe.Statement.upper_below_tight`, `constant_lt_tight_upper` (`Grothe/UpperTightFinal.lean`); `docs/UPPER_STATUS.md` |
| `1.40490913…` | Haagerup's 1987 upper bound | prior work |
| `1.404898554746`, `1.4` | Heilman–Jones–Malavolta's bounds, September 2026 | prior work |
| `1.35584631827168` | Guo–Fang–Lu's lower bound, September 2026 | prior work |
| `1.33807` | Davie's lower bound, 1984 | prior work |
| `1.402`, `1.403`, `1.4023`, … | research targets and ceilings of methods, not theorems | `research/` |

## When a bound changes

1. Change the Lean statements (`Grothe/MainResult.lean`, `Grothe/UpperResult.lean`) and prove them.
   `Grothe/Statement.lean` holds the definitions and no number.
2. Run `python3 scripts/check_constants.py`. It lists every document that still quotes the old value.
3. Update this page, `README.md`, `docs/LEAN_DETAILS.md`, `docs/overview.tex`, the research ledgers that quote the
   bound and the project skill, until the script passes. Add the old value to the table above and, if it must not
   reappear in `README.md` or the skill, to `RETIRED` in the script.

The article in `haagerup-article/` is frozen and has its own Lean package under `haagerup-article/anc/`. The article states the
bound of its own package. It does not quote the repository's bounds, and is not updated when they change.
