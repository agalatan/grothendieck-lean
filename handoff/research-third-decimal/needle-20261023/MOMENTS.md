# Exact recovery of the three phase moments

The missing numerical phase moments are now reproducible from the current Lean phase data.
All three reconstructed values are **exactly equal**, as rational numbers, to the retained
`moment_upper_premises` in `reassessment-20261023/upper/comparison-result.json`:

- `E[φ²] = 2.568529474445871816989753521770485814142e-6`;
- `E[φ⁴] = 5.714395097039324200093003591314401439131e-10`;
- `E[φ⁶] = 1.682387364301201247031707856291346863693e-11`.

The new `tools/needle_phase_moments.py` uses integer FLINT polynomial powers and one final
rational reduction per moment. No quadrature, floating-point bound, or absent source file is
needed. This restores three numerical inputs; it does not improve their values, reconstruct
the original missing JSON bytes, prove the Gaussian integration identity in Lean, or discharge
the remaining energy-comparison premises.

## Gaussian identity and normalization

The repository's `gaussC` is the proper complex Gaussian with density
`π⁻¹ exp(-|z|²)`; `UpperChaos/ComplexMoments.lean` proves `E|z|^{2n}=n!`. For independent `z,w`, put

\[
U=|z|^2,\quad V=|w|^2,\quad W=\Re(\overline zw),\quad D=\Im(\overline zw).
\]

Then `U,V` are independent exponential random variables of rate one, and their relative angle
`θ` is uniform and independent of them. In particular,

\[
W=\sqrt{UV}\cos\theta,\qquad D=\sqrt{UV}\sin\theta.
\]

For nonnegative integers `a,b,k` and `j ≥ 1`, set `λ=1+2jε`. The angular beta integral is

\[
\mathbb E_\theta[\sin^{2j}\theta\cos^{2k}\theta]
=\frac{(2j)!(2k)!}{4^{j+k}j!k!(j+k)!}.
\]

The radial integrals are

\[
\int_0^\infty u^m e^{-\lambda u}\,du=\frac{m!}{\lambda^{m+1}}.
\]

Multiplication gives

\[
\boxed{
\mathbb E[D^{2j}U^aV^bW^{2k}e^{-2j\varepsilon(U+V)}]
=\frac{(2j)!(2k)!}{4^{j+k}j!k!(j+k)!}
\frac{(a+j+k)!(b+j+k)!}{(1+2j\varepsilon)^{a+b+2j+2k+2}}.
}
\]

Odd powers of `W` integrate to zero by `θ ↦ π−θ`. There is no factor of two in the definition
of `W` or `D`. A second agent independently audited this normalization and formula.

The phase is `φ=D exp(-ε(U+V)) S(U,V,W)` with `ε=21/20`. Expand `S^{2j}` and apply the boxed
formula term by term; these are finite sums of integrable damped monomials.

## Exact arithmetic and source binding

The 1,140 coefficients of `S` have total degree at most 17. Contrary to an initial assumption,
they are not all dyadic. Their least common denominator is

```text
D0 = 302002543697172916153771578242367488000
```

It has 128 bits and odd part `14889875`. Clearing this full denominator gives the integer
polynomial `A=D0 S`. FLINT computes `A²`, `A⁴`, and `A⁶`, with respectively 7,770, 57,155, and
187,460 nonzero terms.

For a term of `A^{2j}` with even `W` exponent `2k`, write `s=j+k` and
`e=a+b+2s+2`. If `λ=p/q` is reduced, use the integer

\[
N=\frac{(a+s)!}{s!}(b+s)!\frac{(2j)!}{j!}\frac{(2k)!}{k!}.
\]

The complete moment is obtained by summing signed integers

\[
[A^{2j}]_{a,b,2k}\,N\,q^e p^{E-e}4^{K-s},
\quad K=18j,\quad E=36j+2,
\]

and dividing once by `D0^{2j} 4^K p^E`. All factorial quotients in `N` are integers, and the degree
bound gives `s ≤ K`, `e ≤ E`. This avoids a rational gcd for each of the 187,460 terms.

The parser rejects omitted or duplicated phase strings. The result binds the exact source
bytes, a comment-independent ordered phase payload, the tool, the retained comparison output,
and each integer polynomial power by SHA-256. The script also checks small normalization and
hand-expanded polynomial cases before the frozen phase calculation.

## Exact recovered values

The following are reduced rational values, not decimal enclosures:

```json
{
  "2": "860792101561283751368623317654495653072570734179043273426018625640401450527611325513377967988125/335130318777824773057986436132648297236759552754982597666313431105136324727952408640129669822144315392",
  "4": "2676433690407534354335951894081586300054749648216612704339134454505019853097749039362798855830909448093848071711087390948837169369922682613526657323300052210737988082515152725838429884368185838548109375/4683669303500237480079025210662152448106004567505193900558813382274129411242561784695757253016318500071003715774469473047195633885403404128177186511405139324427261988309272465046166108696545063337116904084996096",
  "6": "451792128418277769244642414404986232429709224611767807335253482832610053894023997486220325302530043652549648096784040880621022821325234183103152663394419963579880922546277637208745427323728702474074390885431853453737783481659705523571317967919143445908711474160405991626046412660468542855526688074885376291452136206741933322265625/26854227391676516506467429260354406985096789983824978428531451971975441567640308042997595160673607812216683521587173118422962773385918077884650447829786489234106748422412589060866004980780756340499994821453988409050404359965378601168260361654525675567004574226343673514464669562539860749043058489733707014967077676012646627355023619418750976"
}

```

## Replay and scope

The successful final run used `python-flint 0.9.0` in `/home/agalatan/stable-venv`, one FLINT
thread, `nice 19`, and a 110-second POSIX wall-clock limit. The three moments took respectively
`0.121s`, `3.014s`, `15.642s`. No run exceeded two minutes.

From an owned remote working directory containing the tool and copied inputs:

```sh
nice -n 19 /home/agalatan/stable-venv/bin/python needle_phase_moments.py \
  --data Data.lean --powers 2 4 6 --max-seconds 110 \
  --comparison comparison-result.json --output phase246.json
```

The complete durable machine output is [phase246.json](phase246.json). The tool checkpoints
each completed moment and records exact equality to all three retained old premises. The
remaining Hilbert–Schmidt source boundary is recorded separately in [HS_GAP.md](HS_GAP.md).

For Taylor vectors `(iφ)^j F₀`, the elementary pointwise bound `|F₀| ≤ 1` gives
`‖(iφ)^j F₀‖₂² ≤ E[φ^{2j}]`; smoothing can only decrease an `L²` norm. Thus the recovered moments
supply the intended total-energy caps. No rectangular Hilbert–Schmidt cutoff, coefficient
center, frozen correction, or rounding-error input follows from this calculation.

Recorded final input bindings:

- `source_sha256`: `0a64faff42fbb6ec86c492eef35e153f3af36d4eb2fe168bf5e56012b8bf156c`.
- `phase_payload_sha256`: `a00b933a08f7ddd7ec9ca656e67969a6b546e9c56cde4663699ad76b05ed0e12`.
- `tool_sha256`: `76cc9880970baef0b34dd2bc2d3e72533fe41d4adaef6186c55818e85af7ee3b`.
- `comparison_sha256`: `18f7c0d5e191467a12429094d23d243e0349fe23809c9dd19b8dea676553f5a8`.
