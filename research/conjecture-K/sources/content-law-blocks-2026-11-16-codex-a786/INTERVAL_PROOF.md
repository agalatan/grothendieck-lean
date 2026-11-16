<!-- Verbatim from the delivery conjecture_k_content_law_blocks_codex_a786.zip (INTERVAL_PROOF.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# Certified low-rank phase constants [P + C]

This supplements the purely analytic equal-factor bounds in `PROOFS.md`.
The reduction and comparison arguments are **P**, author only. The scalar
integrals are **C**, evaluated with directed BigInt interval arithmetic by
`certify_phase.mjs`. No floating-point quadrature is a premise.

## 1. The exact one-dimensional integral [P]

For P_m=(Gamma(m,1)-m)/sqrt(m), define alpha_m as in the main proof. Put

\[
 A_m(t)=(m+t)^{m-1}e^{-t},\qquad
 B_m(t)=(m-t)^{m-1}e^t,\qquad 0\le t\le m,
 \quad\phi(a,b)=\frac{(a-b)^2}{a+b}.
\]

Folding the density, followed by t=sqrt(m) p, gives exactly

\[
 \alpha_m^2=
 \frac{e^{-m}}{(m-1)!}\int_0^m\phi(A_m(t),B_m(t))\,dt
       +e^{-2m}\sum_{j=0}^{m-1}\frac{(2m)^j}{j!}.
 \tag{1}
\]

The second term is the Gamma(m,1) tail beyond 2m, where the reflected
density vanishes. This is the sign statistic of a quadratic factor, not a
relaxation over possible laws of |q|.

## 2. Why the interval algorithm encloses (1) [P]

Every interval endpoint is an integer divided by S=2^256. All operations
are on BigInt integers with explicit floor or ceiling. Only nonnegative
intervals are multiplied or divided; each divisor has a positive lower
endpoint. Consequently interval addition, multiplication, division and
integer powers enclose their exact real counterparts by induction.

For 0<=x<=60, the code evaluates the Taylor polynomial for exp(x) through
degree 128 using directed arithmetic. It bounds the positive tail by the
first omitted term divided by 1-60/130: the successive ratios after the
degree-129 term are at most 60/130. This proves both exponential endpoints.
All arguments in the computation are at most 54. Large normalization
factors are also enclosed, rather than rounded to machine precision.

For each m, partition [0,m] into 8192 equal panels. The function A_m
decreases. For m>=2, B_m increases up to t=1 and decreases afterwards.
Their ranges on a panel therefore lie in intervals formed from its
endpoints, with the value B_m(1) added when the panel crosses 1.

On a rectangle of positive a+b, phi(a,b) is convex: it is the perspective
of the square function, in coordinates (a-b,a+b). Hence its maximum is
bounded by the maximum at the four rectangle vertices. Its minimum is
zero when the a and b intervals overlap; otherwise it is attained at the
closest pair of endpoints. Indeed its two partial derivatives have signs
sign(a-b) and sign(b-a), respectively. The code bounds all those vertex
values by exact division, then multiplies the resulting range by the panel
width. Summing the panels gives a lower and an upper integral. Enclosing
the prefactor and finite tail in (1) completes the certificate.

This is an interval Riemann enclosure, not a quadrature-rule error estimate
using unverified derivatives. The written argument and the small checker
are both needed; a saved decimal output alone is not the certificate.

## 3. Computed rational bounds [C]

| m | Certified upper bound on alpha_m² |
|---|---:|
| 2,3 | 21/100 |
| 4,5,6 | 11/100 |
| 12 | 11/250 |
| 13 | 1/20 |
| 23,24,25,26,27 | 3/125 |

For example, the saved outward decimal enclosure at m=4 is
[0.1088904785, 0.1089935059]. Every saved full endpoint is a rational with
denominator 2^256; decimal printing is also directed outwards.
`phase_intervals.json` contains all endpoints, and the default replay
regenerates them from (1).

## 4. Uniform consequences for arbitrarily many blocks [P + C]

Use the improved norm bound (31b) in `PROOFS.md`, namely

\[
 L_m=17\alpha_m^2+24/m+8\alpha_m/\sqrt m,
 \quad K=\max_i L_{m_i}/(4+12/m_i),
 \quad M=\max_i 1/[4(m_i+3)].
\]

The general theorem gives theta=(2/3)(K+16M)+a²/3, with a²=max alpha_mi².
The following bounds cover every integer rank above the stated minimum;
there is no assumption that alpha_m is monotone.

**All ranks at least 2.** For m=2 use alpha_2²<=21/100 and
sqrt(21/200)<13/40. This gives K_2<=1817/1000. For m>=3 the analytic
bound K_m<=42/[4(m+3)]<=7/4 is smaller. The certified bounds at 2,3,
and alpha_m²<=2/(3m) for m>=4, give a²<=21/100. Thus with M<=1/20,

\[
 \theta\le\frac{1361}{750}<\frac{47}{25}.
\]

**All ranks at least 4.** At m=4, alpha_4²<=11/100 and
sqrt(11/100)<1/3 give K_4<=2761/2100. For m>=5 the analytic bound
K_m<=42/[4(m+3)]<=21/16 is smaller. The certified values at 4,5,6,
and the analytic values at m>=7, give a²<=11/100. With M<=1/28,

\[
 \boxed{\quad\theta\le\frac{8153}{6300}<\frac{13}{10}.\quad}
\]

**All ranks at least 12.** At m=12 use alpha_12²<=11/250 and
sqrt(11/3000)<1/16, giving K_12<=406/625<21/32.
For m>=13 the analytic bound gives K_m<=21/32. The certified values
at 12 and 13, followed by the analytic bound for m>=14, give a²<=1/20.
With M<=1/60,

\[
 \theta\le\frac{91}{144}<\frac{16}{25}.
\]

**All ranks at least 23.** At m=23 use alpha_23²<=3/125 and
sqrt(3/2875)<1/30, giving

\[
 K_{23}\le\frac{51/125+24/23+4/15}{104/23}<\frac7{18}.
\]

For m>=24 the analytic bound gives K_m<=7/18. The certified values at
23 through 27, then the analytic bound for m>=28, give a²<=3/125.
With M<=1/104,

\[
 \boxed{\quad\theta\le\frac{16226}{43875}<\frac{37}{100}.\quad}
\]

All displayed radical comparisons and arithmetic are checked exactly in
`verify.mjs`. Combining these with the analytic rank-one bound 39/16 gives:

| t | Rational comparison target | Every active block rank at least | Valid theta |
|---|---:|---:|---:|
| 0.80 | 37/100 | 23 | 16226/43875 |
| 0.82 | 16/25 | 12 | 91/144 |
| 0.84 | 133/100 | 4 | 8153/6300 |
| 0.845 | 47/25 | 2 | 1361/750 |
| 0.85 | 5/2 | 1 | 39/16 |
| 0.855 | 37/10 | 1 | 39/16 |

Every conclusion still includes arbitrary independent bulk (1) from the
main proof, all positive u and both requested profiles. The scope remains
the independent-block class, not arbitrary H_{2,1} tensors. The displayed
room targets are comparisons, not a re-certification of the row programme.
