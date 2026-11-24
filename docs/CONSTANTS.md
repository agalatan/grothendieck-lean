# The constants

This page states every bound on the complex Grothendieck constant $K = K_G^{\mathbb C}$ that this repository
proves, exactly as Lean states it, and explains the other numbers that appear in the sources and documents.
`scripts/check_constants.py` reads the two bounds from the Lean statement and checks that this page and the other
documents quote them.

## The current bounds

$$1.40191 < K \le 1.40455641 < 1/\gamma^\dagger = 1.40457593\ldots$$

| | decimal | exact rational in Lean | theorem | file |
|---|---|---|---|---|
| lower bound (strict) | `1.40191` | `140191 / 100000` | `Grothe.Statement.main_bounds`, first part; `Grothe.Statement.lower_target` | `Grothe/MainResult.lean` |
| root upper bound, rounded | `1.40455641` | `140455641 / 100000000` | `Grothe.Statement.main_bounds_refined`, second part | `Grothe/MainResult.lean` |
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

- Upper bound: `Grothe.UpperSix.bound : IsBound (140455741 / 100000000)`. For every finite complex matrix,
  $V(A) \le 1.40455741\,C(A)$.
- Lower bound: `lower_target : LowerAbove (140191 / 100000)`. Every Grothendieck bound is above $1.40191$; for every
  $K \le 1.40191$ some matrix has $V(A) > K\,C(A)$.

### Stronger root certificate

The root theorem `Grothe.UpperSix.constant_le_exact` gives
$K\le 10^{27}/711968557929438692542239077 = 1.404556407530439478\ldots$.
Its finite-matrix form is `Grothe.UpperSix.bound_exact`. Rounding upward gives
$1.40191 < K \le 1.40455641$ in `Grothe.Statement.main_bounds_refined`.
The six weights are those of the article. The first channel uses a degree-20 polynomial
and each tail budget deducts the energy forced by its linear coefficient. The exact head
cap is $4481751845/10^{15}$ and the weighted tail cost is $42740716307457760923/10^{27}$.

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

| quantity | value | meaning |
|---|---|---|
| $\varepsilon$ | `191/250` | weight of the cubic chaos in the witness $T = P_{1,0} - \varepsilon P_{2,1} + \nu(1 - P_{1,0} - P_{2,1})$ |
| $\nu$ | `47/2000` | weight of the identity tail |
| $B_{\mathrm{env}}$ | `7064131/10000000` | bound of the envelope certificate (1,800 cells) |
| $B = (1-\nu)B_{\mathrm{env}} + \nu$ | `14266247843/20000000000` $= 0.71331239215$ | bound on $\lvert\langle f, Tg\rangle\rvert$ for unimodular $f$, $g$ |
| $1/B$ | $1.4019103\ldots$ | what the certificate gives; the theorem states the rounded value $1.40191 < 1/B$ |
| $\hat\varepsilon$, $\hat\nu$ | `25/31`, `47/1953` | the same weights after dividing by $1-\nu$ (the "hat" normalisation of the rows) |

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
