# Ten explicit remaining central inequalities at epsilon 299/400

**Certified benchmarks and conditional consumer; the all-sector inequalities are open.** Combine the unconditional exterior theorem in `EXTERIOR_PROOF.md` with the following finite list. Every terminating decimal in the table is an exact rational.

Fix `e=299/400`, `p=400/299`, and define the retained functional separately for each row,

\[
L_i=Z(\ell_i+\beta_i(T-2)),\qquad
\widehat\Lambda_i(G)=\inf_{\xi\in H_{1,0}}
\{\|\xi\|_2^2+\mathbb E|L_i+G-\xi|+\mathbb E|L_i-G+\xi|\}
-\frac{400}{299}\|G\|_2^2.
\]

For every actual unimodular response pair with `t` in the indicated interval, the missing sufficient inequality is

\[
\boxed{\widehat\Lambda_i(eP_{2,1}k)\le S_i^{\rm upper}+\frac1{40000}.}\tag{C_i}
\]

It must hold in every dimension with arbitrary shared remote coefficients. The Gaussian benchmark alone is not this inequality. No transfer of the peak (P), content, or odd-sector theorem to these new profiles is asserted.

| i | t interval | ell | beta | certified S upper |
|---|---|---:|---:|---:|
| 1 | [.8165,.8215] | .7900201 | .1288031 | 1.290924109 |
| 2 | [.8215,.8265] | .7994359 | .1314385 | 1.304606446 |
| 3 | [.8265,.8315] | .8090028 | .1341068 | 1.318572696 |
| 4 | [.8315,.8365] | .8187258 | .1368084 | 1.332832519 |
| 5 | [.8365,.8415] | .8286105 | .1395437 | 1.347396692 |
| 6 | [.8415,.8465] | .8386627 | .1423132 | 1.362276379 |
| 7 | [.8465,.8515] | .8488892 | .1451174 | 1.377484568 |
| 8 | [.8515,.8565] | .854 | .1465137 | 1.385111373 |
| 9 | [.8565,.8615] | .8592972 | .147957 | 1.393034927 |
| 10 | [.8615,.866] | .869895 | .1508325 | 1.408943329 |

Here

\[
S_i=\sup_{v\ge0}\{2\mathbb E|L_i+\sqrt v W|-pv\}
<S_i^{\rm upper}.
\]

All ten inequalities `S_i<S_i^upper`, all derivative sign brackets locating the maximizing variance, and all exact consumer budgets are certified by `central_7475.py --verify`. The requested all-sector allowance is exactly `1/40000=25e-6`, including any error in a future all-sector certificate; it is not an extra numerical slack to be added after certification.

## Exact implication

The inherited retained row gives

\[
V_e\le t^2-2\ell_i t+2\beta_i^2/e+\widehat\Lambda_i(G).
\]

For each table interval, the right-hand quadratic is convex, so its maximum is at an endpoint. Exact rational arithmetic establishes

\[
\max_{i,\,t\in I_i}\left[t^2-2\ell_i t+2\beta_i^2/e+S_i^{\rm upper}+1/40000\right]
\le\frac{500}{701}-\delta_c,
\]

where the **exact minimum central reserve** is

\[
\boxed{\delta_c=\frac{69664580403}{13099937500000000}
>\frac1{200000}.}
\]

The tight row is row 8. Its maximal admissible allowance is exactly
`397163017903/13099937500000000`; after spending `1/40000` the displayed reserve remains.

The exterior theorem gives `V_e<=713263/1000000` on the complementary region, and

\[
\frac{500}{701}-\frac{713263}{1000000}
=\frac{2637}{701000000}<\delta_c.
\]

Therefore, **conditional on the ten open inequalities (C_i)**, the entire response range is covered at the one fixed operator and

\[
\|P_{1,0}-(299/400)P_{2,1}\|_{\infty\to1}
\le\frac{713263}{1000000},
\qquad
K_G^{\mathbb C}\ge\frac{1000000}{713263}>\frac{701}{500}=1.402.
\]

This is a fully explicit conditional reduction, not an unconditional improvement of the current Grothendieck bound.

## Replay and trust boundary

Run `python central_7475.py --verify`. It requires Python-flint and the adjacent files `certify_shoulders.py` and `central_7475_candidates.json`. It does not import SciPy on the verification path. The optional numerical search (`python central_7475.py`) uses SciPy and does not participate in acceptance. Input candidate paths resolve relative to the script. All certificate scripts explicitly reject Python's `-O` mode because it disables assertions.

The accepted record is `central_7475_certificate.json`; the transcript is `central_7475.log`. The integration method and analytic concavity argument are the same as documented in `REPORT.md`: 100-bit Arb/Acb integration on `[0,64]`, explicit nonnegative tail estimates, opposite derivative signs, and a concavity tangent bound. Every numerical step that enters acceptance uses interval or rational arithmetic. The certificate includes the response-energy upper bounds for every interval; they remain additional useful restrictions, not assumptions replacing the actual-response requirement in (C_i).
