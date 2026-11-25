# The constants

This page states every bound on the complex Grothendieck constant $K = K_G^{\mathbb C}$ that this repository
proves, exactly as Lean states it, and explains the other numbers that appear in the sources and documents.
`scripts/check_constants.py` reads the two endpoints of `main_bounds`. It checks strict downward rounding in `lower_bound_sharp` and `lower_bound_shared_gate`, upward rounding in `main_bounds_refined` and `main_bounds_phase`, and agreement with the technical references.

## The current bounds

$$1.40191478 < K \le 1.404556407 < 1/\gamma^\dagger = 1.40457593\ldots$$

| | decimal | exact rational in Lean | theorem | file |
|---|---|---|---|---|
| shared-gate lower bound (strict) | `1.40191478` | `140191478 / 100000000` | `Grothe.Statement.lower_bound_shared_gate` | `Grothe/MainResult.lean` |
| sharp scalar lower bound (strict) | `1.4019109461` | `14019109461 / 10000000000` | `Grothe.Statement.lower_bound_sharp` | `Grothe/MainResult.lean` |
| earlier lower bound (strict) | `1.40191` | `140191 / 100000` | `Grothe.Statement.main_bounds`, first part; `Grothe.Statement.lower_target` | `Grothe/MainResult.lean` |
| root upper bound, rounded | `1.404556407` | `1404556407 / 1000000000` | `Grothe.Statement.main_bounds_phase`, second part | `Grothe/MainResult.lean` |
| previous root upper bound | `1.40455641` | `140455641 / 100000000` | `Grothe.Statement.main_bounds_refined`, second part | `Grothe/MainResult.lean` |
| article upper bound (weak, $\le$) | `1.40455741` | `140455741 / 100000000` | `Grothe.Statement.main_bounds`, second part; `Grothe.UpperSix.constant_le`; `Grothe.UpperSix.bound` | `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` |
| Haagerup's value (strict) | `1.40457593…` | `1 / gammaDagger` | `Grothe.UpperSix.constant_lt_inv_gammaDagger` | `Grothe/UpperResult.lean` |

`main_bounds` reads

```lean
theorem main_bounds :
    (140191 / 100000 : ℝ) < complexGrothendieckConstant ∧
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
- Lower bound: `lower_target : LowerAbove (140191 / 100000)`. Every Grothendieck bound is above $1.40191$; for every
  $K \le 1.40191$ some matrix has $V(A) > K\,C(A)$.

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

The common Gaussian gate sharpens this lower bound to $1.40191478<K$. The theorem `Grothe.Statement.shared_gate_endpoint` gives the exact fraction

```text
909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
648511497777813650950008184495957803146263132239181429405354447721820234278296395631
```

Its decimal expansion begins at $1.4019147844610243019092$. The two active rows constrain the same Gaussian variable. For residual scale $\tau\ge21/100$, completing the joint gate gives a saving of at least $1018\tau^2/10^7$ across the two rows. For $\tau\le21/100$, a quadratic majorant saves $1/50000$ on the first row. Pricing their common saving by the smaller of the two mixture weights lowers the uniform hat cap by $2/10^6$.

The exact endpoint in `Grothe.Statement.sharp_lower_endpoint` gives $K \ge 1.401910946113565640\ldots$. Its value in Lean is

```text
909157856627679665006951532318493526757143019079598080000000000000000000000000000000 /
648513273363107644808393943072300421164120888939497691860404687721820234278296395631
```

For the same Gaussian witness and the same certified rows, `SharpEnvelope.check` bounds the hat value by
$\hat B_*=0.7064127708804130589\ldots$. On the central interval the weight of row 0.845 in its mixture with
row 0.835 varies affinely with $t$. The maximum of the resulting quadratic gives the cap. The other fourteen
intervals use fixed weights. The original witness cap is $(1-47/2000)\hat B_*+47/2000$, whose reciprocal is the
fraction above. The following table gives the earlier fixed-weight certificate.

| quantity | value | meaning |
|---|---|---|
| $\varepsilon$ | `191/250` | weight of the cubic chaos in the witness $T = P_{1,0} - \varepsilon P_{2,1} + \nu(1 - P_{1,0} - P_{2,1})$ |
| $\nu$ | `47/2000` | weight of the identity tail |
| $B_{\mathrm{env}}$ | `7064131/10000000` | bound of the 16-cell envelope certificate |
| $B = (1-\nu)B_{\mathrm{env}} + \nu$ | `14266247843/20000000000` $= 0.71331239215$ | bound on $\lvert\langle f, Tg\rangle\rvert$ for unimodular $f$, $g$ |
| $1/B$ | $1.4019103\ldots$ | what the certificate gives; the theorem states the rounded value $1.40191 < 1/B$ |
| $\hat\varepsilon$, $\hat\nu$ | `25/31`, `47/1953` | the same weights after dividing by $1-\nu$ (the "hat" normalisation of the rows) |

The mass row uses $\lambda=1/2$, $c=2\hat\nu+\lambda=2141/3906$ and $\delta=3/4$.
At witness scale $\tau$, its potential $\varphi_c(\tau v/\delta)$ changes from quadratic to affine
at $v=c\delta/(\hat\varepsilon\tau)$. Lean checks both branches in the kernel. [Mass-row certificate](../Grothe/Lower/Cert/MassRow.lean).

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
| `1.4018` | the design target of the lower certificate. The certificate reached $1/B = 1.4019103\ldots$, and the theorem states $1.40191$ | `research/identity-tail/` |
| `1.401700322371` | the previous lower bound, from the witness $\varepsilon = 1891/2500$ without identity tail. No longer the statement | history in `research/` |
| `1.40490913…` | Haagerup's 1987 upper bound | prior work |
| `1.404898554746`, `1.4` | Heilman–Jones–Malavolta's bounds, September 2026 | prior work |
| `1.35584631827168` | Guo–Fang–Lu's lower bound, September 2026 | prior work |
| `1.33807` | Davie's lower bound, 1984 | prior work |
| `1.402`, `1.403`, `1.4023`, … | research targets and ceilings of methods, not theorems | `research/` |

## When a bound changes

1. Change the Lean statement (`Grothe/Statement.lean`, `Grothe/MainResult.lean`) and prove it.
2. Run `python3 scripts/check_constants.py`. It lists every document that still quotes the old value.
3. Update this page, `README.md`, `docs/LEAN_DETAILS.md`, `docs/overview.tex`, the research ledgers that quote the
   bound and the project skill, until the script passes.

The article in `haagerup-article/` states the bound of its own Lean package, `1.40455741`. It does not quote the
repository's bounds, and is not updated when they change after it is posted.
