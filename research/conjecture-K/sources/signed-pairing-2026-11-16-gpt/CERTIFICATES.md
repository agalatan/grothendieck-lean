<!-- Verbatim from the delivery content_law_signed_pairing_20261116.zip (CERTIFICATES.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Certificate specification and replay results

## Status labels

- **P:** a universally quantified mathematical statement with a complete written proof in `PROOFS.md`.
- **C:** exact rational or Arb interval computation whose replay is included.
- **N:** floating arithmetic used only to propose certificates or inspect their quality.
- **Open:** not proved in this packet.

The supplied sources use additional historical labels. Those are not silently upgraded here. The source map fixes the exact repository revision read.

## 1. Hermitian-factor algebra: exact integers

`node scripts/verify_gamma_exact.mjs`

This uses integer polynomial arithmetic, with `m` an indeterminate, to verify

\[
E[S(mZ)^2]=17m^2+24m,\quad
E[S(mZ)N]=-22m^2-16m,\quad
E[SN^2]=44m^2+40m,
\]

where in this checker `Z=2SR/m-1` and `N=2(R-m)^2+4R-4SR`; the factors of `X` are represented by the extra `S` in the expectation. These are equalities of polynomials in `m`, not checks at finitely many dimensions. The checker also verifies the general Hermitian rational expression in `kappa`, its `5/3` factorization, and the endpoint polynomial for `kappa<=1/6` and `theta=13/10`.

For the gamma reflection result, the rational infinite-tail bound is

\[
I(m)=\frac{37m-40}{3(m-2)(m+3)}.
\]

To check `I(m)<=a/b` for every integer `m>=M`, the script expands

\[
3a(m-2)(m+3)-b(37m-40)
\]

in powers of `m-M` and checks that all three coefficients are nonnegative. The three `(M,a/b)` pairs are `(34,7/20)`, `(19,3/5)`, and `(8,13/10)`.

The six profile rows are parsed as exact decimal rationals. The inequalities establishing `|L'(z)|>=|z|/2` and the bounded profile hypotheses are checked without floating arithmetic.

**Actual outcome: C, PASS.** The theorem for arbitrary Hermitian spectra still rests on the written moment and tangent-divergence arguments, not on instance testing.

## 2. Gamma reflection: 23 Arb checks

`python scripts/certify_gamma.py`

At 160-bit precision, the script encloses the Hellinger affinity and

\[
H(m)=\frac{34m(1-\mathcal A_m)+40}{6(m+3)}
\]

for the 23 missing shapes. All integer powers, factorials, and rational thresholds are exact. Only `exp(-m)` and `pi` require interval functions. Arb supplies the outward enclosure; there is no assumption about ordinary `libm` accuracy.

| Target | Finite shapes checked | Largest enclosure, displayed rounded upward |
|---|---|---:|
| `7/20` | `22,...,33` | `< 0.341633` |
| `3/5` | `12,...,18` | `< 0.568525` |
| `13/10` | `4,...,7` | `< 1.209342` |

The exact enclosures, rather than these short decimals, are in `results/gamma_intervals.json`.

**Actual outcome: C, PASS.** Together with the rational tails and the proof, these certify all integer dimensions in Theorem 8.

## 3. Diffuse-bulk cover: BigInt rational arithmetic

`node scripts/verify_exact.mjs`

The certificate is `results/certificate.json`. Its data are:

- all Wick controls of degree at most 14 with the specified charges;
- 400 rational coefficients per cell, each with denominator `2^80`;
- 121 adjoining rational intervals covering `rho in [0,3/5]`;
- the six exact rational thresholds stated in the README.

The verifier reconstructs the operators (23) and (24) from the complex Wick product formula

\[
H_{ab}H_{ef}=\sum_{r,s}
\binom ar\binom fr r!\binom bs\binom es s!
H_{a+e-r-s,b+f-r-s}.
\]

It does not import floating arrays or normalization factors from the generator. Norms are sums of factorial weights times squared rational coefficients. On each interval, convexity bounds the entire quadratic norm by its two endpoint values; monotonicity bounds the correlation term by its upper endpoint.

| Row | Rational target | Verified upper ceiling over its entire cover |
|---|---:|---:|
| 0.80 | `7/20` | `0.324343539` |
| 0.82 | `3/5` | `0.525503558` |
| 0.84 | `13/10` | `1.280764343` |
| 0.845 | `9/5` | `1.752029849` |
| 0.85 | `12/5` | `2.364814484` |
| 0.855 | `18/5` | `3.464601529` |

**Actual outcome: C, PASS.** The script also verifies the exact obstruction `256/63` for the pure Wick cubic and `h(v)=v`.

As algebra checks on the universal null identities, the verifier pairs all 400 controls with `Q`, `Q|Q|²`, and `Q|Q|⁴` at two integer values of `rho`: 2400 exact checks pass. Reversing the derivative-transfer sign produces a detected nonzero error in 218 of them. These are checks on instances; the integration-by-parts proof, not those instances, establishes the identity for all test functions.

## 4. Proposal stage and trust boundary

`build_certificate.py` solves floating least-squares problems in normalized Wick coordinates. It quantizes the answers into dyadic rationals and writes a proposal. This stage is **N**, even if the printed residual is small. The exact checker is sufficient for replay; NumPy and SciPy are not needed to verify the delivered proposal.

The checkers trust Node's BigInt arithmetic and Python-flint/Arb. They are not Lean proofs. No simulated randomness, Monte Carlo confidence level, unchecked quadrature table, floating optimizer optimum, or external solver status enters a **C** conclusion.

## 5. Exact scope

The first class consists of actual finite-dimensional cubic chaoses. The second, diffuse-bulk table concerns a rigorously specified limit of such chaoses. A finite-bulk error term is **open** here.

The unrestricted content-law inequality and the remaining sector premises are **open**. None of these computations changes the published bounds on the complex Grothendieck constant.
