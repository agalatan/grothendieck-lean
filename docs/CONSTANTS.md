# The constants

This page states every bound on the complex Grothendieck constant $K = K_G^{\mathbb C}$ that this repository
proves, exactly as Lean states it, and explains the other numbers that appear in the sources and documents.
`scripts/check_constants.py` reads the two endpoints of `main_bounds`. It checks strict downward rounding in `lower_bound_sharp` and `lower_bound_shared_gate`, upward rounding in `main_bounds_refined` and `main_bounds_phase`, and agreement with the technical references.

## The current bounds

$$\frac{4000000000000}{2853044560237} \le K \le 1.404556407 < 1/\gamma^\dagger = 1.40457593\ldots$$

| | decimal | exact rational in Lean | theorem | file |
|---|---|---|---|---|
| coupled Stein lower bound | `1.4020110501420713…` | `4000000000000 / 2853044560237` | `Grothe.Statement.coupled_stein_endpoint`, `Grothe.Lower.CoupledStein.endpoint_eq` | `Grothe/MainResult.lean`, `Grothe/Lower/Cert/CoupledStein.lean` |
| weighted shared-gate lower bound | `1.4020063100946885…` | `500000000000 / 356631775763` | `Grothe.Statement.weighted_tight_endpoint`, `Grothe.Lower.WeightedTight.endpoint_eq` | `Grothe/MainResult.lean`, `Grothe/Lower/Cert/WeightedTight.lean` |
| lower bound in `main_bounds` (strict) | `1.402` | `1402 / 1000` | `Grothe.Statement.main_bounds`, first part; `Grothe.Statement.lower_target` | `Grothe/MainResult.lean` |
| shared-gate scalar-row lower bound (strict) | `1.4019156097` | `14019156097 / 10000000000` | `Grothe.Statement.lower_bound_shared_gate` | `Grothe/MainResult.lean` |
| sharp scalar-row lower bound (strict) | `1.4019109461` | `14019109461 / 10000000000` | `Grothe.Statement.lower_bound_sharp` | `Grothe/MainResult.lean` |
| root upper bound, rounded | `1.404556407` | `1404556407 / 1000000000` | `Grothe.Statement.main_bounds_phase`, second part | `Grothe/MainResult.lean` |
| previous root upper bound | `1.40455641` | `140455641 / 100000000` | `Grothe.Statement.main_bounds_refined`, second part | `Grothe/MainResult.lean` |
| article upper bound (weak, $\le$) | `1.40455741` | `140455741 / 100000000` | `Grothe.Statement.main_bounds`, second part; `Grothe.UpperSix.constant_le`; `Grothe.UpperSix.bound` | `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` |
| Haagerup's value (strict) | `1.40457593…` | `1 / gammaDagger` | `Grothe.UpperSix.constant_lt_inv_gammaDagger` | `Grothe/UpperResult.lean` |

`main_bounds` reads

```lean
theorem main_bounds :
    (1402 / 1000 : ℝ) < complexGrothendieckConstant ∧
      complexGrothendieckConstant ≤ 140455741 / 100000000
```

It has no hypotheses. Its axioms are Lean's three standard ones and the `native_decide` facts listed in
`data/axioms/native.txt`.

**What the bounds say for one matrix.** For a finite complex matrix $A$ let $C(A)$ be the supremum of
$\lvert\sum a_{ij}\overline{\varepsilon_i}\delta_j\rvert$ over unimodular scalars and $V(A)$ the supremum of
$\lvert\sum a_{ij}\langle x_i,y_j\rangle\rvert$ over unit vectors of a complex Hilbert space
(`scalarOpt`, `vectorOpt` in `Grothe/Statement.lean`). A number $K$ is a *Grothendieck bound* (`IsBound K`) if
$V(A)\le K\,C(A)$ for every $A$, and $K_G^{\mathbb C}$ is the infimum of the Grothendieck bounds.

- For every finite complex matrix, `Grothe.UpperSix.bound_phase` gives $V(A)\le [10^{27}/711968558203721328194311213]\,C(A)$.
- Lower bound: `lower_target : LowerAbove (1402 / 1000)`. Every Grothendieck bound is above $1.402$; for every
  $K \le 1.402$ some matrix has $V(A) > K\,C(A)$.

### Stronger root certificate

The six weights come from the article. The first channel uses a degree-20 polynomial and each
Hardy budget deducts the energy carried by the linear coefficient. The five cell channels
enclose coefficients 0 through 250. The phase channel encloses coefficients 0 through 320
using exact Haagerup moments. The head cap is $4481751845/10^{15}$ and the weighted tail
cost is $42466433671805688787/10^{27}$. The tails begin at indices 251 and 321 respectively.
Thus `Grothe.UpperSix.constant_le_phase` gives
$K\le 10^{27}/711968558203721328194311213=1.404556406989340536\ldots$.
The two-sided theorem `Grothe.Statement.main_bounds_phase` rounds this up to $1.404556407$.

At a common cutoff of 251 the weighted tail cost was $42740716307457760923/10^{27}$.
The corresponding exact bound $10^{27}/711968557929438692542239077$ is available as
`Grothe.UpperSix.constant_le_exact`. Its rounded form is $1.40455641$ in
`Grothe.Statement.main_bounds_refined`.

## Haagerup's value

$\gamma^\dagger=\int_0^{\pi/2}\cos^2 t\,(1+\sin^2 t)^{-1/2}\,dt = 0.711958659\ldots$ (`Haagerup.Statement.gammaDagger`,
`Grothe/UpperSix/Haagerup/Statement.lean`), and $1/\gamma^\dagger = 1.404575934\ldots$ is the value Haagerup proposed
for $K$ in 1987.

| fact | Lean |
|---|---|
| $0.711958633 < \gamma^\dagger < 0.711958683$ | `Haagerup.gammaDagger_bounds` (`Grothe/UpperSix/Haagerup/GammaDagger.lean`) |
| $1.40455741 < 1/\gamma^\dagger$ | `Haagerup.inv_gammaDagger_gt` |
| $K < 1/\gamma^\dagger$ | `Grothe.UpperSix.constant_lt_inv_gammaDagger` |

The upper bound is below Haagerup's value by about $1.9\cdot10^{-5}$. Haagerup's own 1987 theorem is the weaker
bound $K < 1.40490913\ldots$

## Behind the lower bound

The witness is $T = P_{1,0} - \varepsilon P_{2,1} + \nu(1 - P_{1,0} - P_{2,1})$ on $L^2(\mathbb C^n,\gamma)$ with $(\varepsilon,\nu) = (191/250, 47/2000)$. Replacing the law certificates of the two binding rows `0.835` (`row08`, original `row08.cap = 1340727277285011 / 1000000000000000 = 1.340727277285011`) and `0.845` (`row09`, original `row09.cap = 1361923312769063 / 1000000000000000 = 1.361923312769063`) on the unchanged node-cap tables by two-test antiholomorphic Stein certificates (`Grothe/LowerAnalytic/AntiRows/`) and restricting the residual cubic scale via the certified cubic radius bound `93/100` (`norm_pres_le_93`) tightens their caps to `cap08Tight = 1675841 / 1250000 = 1.3406728` and `cap09Tight = 6809419 / 5000000 = 1.3618838`, giving $1/B = 10^9 / 713266399 = 1.402000713\ldots > 1.402$.

| quantity | value | meaning |
|---|---|---|
| $\varepsilon$ | `191/250` | weight of the cubic chaos in the witness $T = P_{1,0} - \varepsilon P_{2,1} + \nu(1 - P_{1,0} - P_{2,1})$ |
| $\nu$ | `47/2000` | weight of the identity tail |
| $B_{\mathrm{env}}$ (tightened) | `353183/500000` $= 0.706366$ | bound of the kernel-checked tightened envelope certificate (`certEnvelopeTight`, 38 cells), replacing `row08.cap = 1.340727277285011` and `row09.cap = 1.361923312769063` by their antiholomorphic Stein caps `cap08Tight = 1675841/1250000` (`1.3406728`) and `cap09Tight = 6809419/5000000` (`1.3618838`) with the certified cubic radius `93/100` |
| $B = (1-\nu)B_{\mathrm{env}} + \nu$ | `713266399/1000000000` $= 0.713266399$ | bound on $\lvert\langle f, Tg\rangle\rvert$ for unimodular $f$, $g$ |
| $1/B$ | $1.4020007\ldots$ | what the tightened certificate gives; `lower_target` and `main_bounds` state the rounded value $1.402 < 1/B$ |
| $B_{\mathrm{env}}$ (earlier 16-cell scalar envelope) | `7064131/10000000` | bound of the earlier 16-cell scalar-row envelope (`envCells` in `Grothe/Lower/EnvelopeData.lean`, `B = 14266247843/20000000000`, $1/B = 1.4019103\ldots > 1.40191$) |
| $\hat\varepsilon$, $\hat\nu$ | `25/31`, `47/1953` | the same weights after dividing by $1-\nu$ (the "hat" normalisation of the rows) |

The mass row uses $\lambda=1/2$, $c=2\hat\nu+\lambda=2141/3906$ and $\delta=3/4$.
At witness scale $\tau$, its potential $\varphi_c(\tau v/\delta)$ changes from quadratic to affine
at $v=c\delta/(\hat\varepsilon\tau)$. Lean checks both branches in the kernel. [Mass-row certificate](../Grothe/Lower/Cert/MassRow.lean).

### Pricing the same gate on the tightened rows

The weighted bound completes the square after combining the two gate matrices at the actual mixture weight. The resulting Schur price is concave in that weight. The row08 quadratic law deduction and the weighted gate deduction hold simultaneously. Their uniform combined saving is bounded below by a chord between its two endpoint weights. On a central cell the mixing weight is affine until it reaches zero or one. Subtracting the chord leaves a quadratic in the cell parameter, so the checker tests its endpoints and any interior maximum. The hat cap is $176590771/250000000$, giving $500000000000/356631775763\le K$. The certificate proves the strict rounding $1.4020063100<K$. [Endpoint certificate](../Grothe/Lower/Cert/WeightedTight.lean) · [Weighted envelope](../Grothe/Lower/WeightedTightEnvelope.lean) · [Transfer](../Grothe/LowerAnalytic/WeightedTightBound.lean)

The coupled Stein profile has exact lower endpoint `4000000000000/2853044560237`. Lean proves the nine price comparisons from the two original chord banks on all closed intersections. `Grothe.Statement.coupled_stein_endpoint` combines the resulting transfer with the witness node caps and the six-channel upper bound. [Derivation and replay](../research/identity-tail/COUPLED_STEIN.md).

### Refinements of the earlier scalar-row certificate

Before the antiholomorphic Stein replacement of `row08` and `row09`, two kernel-checked refinements sharpened the earlier 16-cell scalar-row certificate (`1.40191 < K`) on the original 14 scalar rows (`rowData`).

First, for the same Gaussian witness and the original 14 scalar rows, `SharpEnvelope.check` bounds the hat value by
$\hat B_*=0.7064127708804130589\ldots$. On the central interval the weight of row `0.845` in its mixture with
row `0.835` varies affinely with $t$. The maximum of the resulting quadratic gives the cap, and the other fourteen
intervals use fixed weights. The witness cap is $(1-47/2000)\hat B_*+47/2000$; its reciprocal in `Grothe.Statement.sharp_lower_endpoint` gives $K \ge 1.401910946113565640\ldots$ (`lower_bound_sharp` states $1.4019109461 < K$), with exact value in Lean

```text
909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
648513273363107644808393943072300421164120888939497691860404687721820234278296395631
```

Second, the common Gaussian gate sharpens that scalar-row lower bound further to $1.4019156097<K$ (`lower_bound_shared_gate`). The theorem `Grothe.Statement.shared_gate_endpoint` gives the exact fraction

```text
909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
648511116026975442270455246402044140272423714548613432977518646121820234278296395631
```

Its decimal expansion begins at $1.4019156097084731719682$. The two active rows constrain the same Gaussian variable. For residual scale $\tau\ge4649/20000$, completing the joint gate gives a saving of at least $1018\tau^2/10^7$ across the two rows. For $\tau\le4649/20000$, a quadratic majorant saves $551/10^8$ on the first row. Pricing their common saving by the smaller of the two mixture weights lowers the uniform hat cap by $243/10^8$ across 16 cells. The row06/row07 cell uses weight $12/25$. On the row12/row13 cell the weight changes from $3/5$ to $22/25$ at $1758/2000$.

## Behind the upper bound

The six-channel proof (`Grothe/UpperSix/`, copied byte for byte in `haagerup-article/anc/`) mixes six Gaussian
rounding channels.

| quantity | value | meaning |
|---|---|---|
| $c$ | `cCertQ = 711974258589 / 10^12` | the target linear slope: the rational that the mixed correlation kernel is compared with (the kernel's actual first coefficient differs from it by about $10^{-12}$, which the head bound counts) |
| $\delta$ | `deltaCertQ = 6205314847032059049 / 10^24` | the certified deviation of the kernel from $c\,t$: head cap $6.15785\cdot10^{-6}$ plus weighted tail caps $4.746\ldots\cdot10^{-8}$, exactly |
| $1/(c-\delta)$ | `10^24 / 711968053274152967940951` $= 1.4045574031\ldots$ | what the transfer theorem gives (an intermediate step of `Haagerup.isBound_cert`) |
| stated bound | `140455741 / 100000000` | $1/(c-\delta)$ rounded up to eight decimals: `Haagerup.isBound_cert`, `Grothe.UpperSix.bound`, `main_bounds` |

## Other numbers you will meet

None of these is the current bound.

| number | what it is | where |
|---|---|---|
| `1.404599395362` | the bound of the older single-channel upper proof, $K < 1.404599395362$. Still proved and independent of the six-channel proof, but weaker, and above Haagerup's value | `Grothe.Statement.upper_below_tight`, `constant_lt_tight_upper` (`Grothe/UpperTightFinal.lean`); `docs/UPPER_STATUS.md` |
| `1.40191` | the previous lower bound of the same identity-tail witness before antiholomorphic Stein tightening of rows `0.835` and `0.845` (16-cell scalar-row envelope `envCells`, `envB = 7064131/10000000`, $1/B = 1.4019103\ldots$) | `Grothe/LowerAnalytic/LowerBound.lean`; `Grothe/Lower/EnvelopeData.lean`; `research/identity-tail/` |
| `1.4018` | the original design target of the identity-tail lower certificate | `research/identity-tail/` |
| `1.401700322371` | the earlier lower bound, from the witness $\varepsilon = 1891/2500$ without identity tail. No longer the statement | history in `research/` |
| `1.40490913…` | Haagerup's 1987 upper bound | prior work |
| `1.404898554746`, `1.4` | Heilman–Jones–Malavolta's bounds, September 2026 | prior work |
| `1.35584631827168` | Guo–Fang–Lu's lower bound, September 2026 | prior work |
| `1.33807` | Davie's lower bound, 1984 | prior work |
| `1.4022`, `1.4023`, `1.403`, … | research targets and ceilings of methods, not theorems | `research/` |

## When a bound changes

1. Change the Lean statement (`Grothe/Statement.lean`, `Grothe/MainResult.lean`) and prove it.
2. Run `python3 scripts/check_constants.py`. It lists every document that still quotes the old value.
3. Update this page, `README.md`, `docs/LEAN_DETAILS.md`, `docs/overview.tex`, the research ledgers that quote the
   bound and the project skill, until the script passes.

The article in `haagerup-article/` states the bound of its own Lean package, `1.40455741`. It does not quote the
repository's bounds, and is not updated when they change after it is posted.
