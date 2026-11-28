# A sixth-order Gaussian upper bound for a shifted circular cubic

For every unit circular cubic $q$ of bidegree $(2,1)$ and every independent standard proper complex Gaussian $Z$, write $\mu=\sqrt\pi/2$. Then
$$
 \mathbb E|Z+\lambda q|\le
 \mu\left(1+\lambda^2/2-\lambda^4/8+\lambda^6/16\right)
 \qquad (0\le\lambda\le .345).
$$
The polynomial agrees through sixth order with $\sqrt{1+\lambda^2}$, the exact factor for an independent Gaussian shift of variance $\lambda^2$. This finite-range inequality uses the repository's unconditional circular cubic sixth-moment bound. It applies to any finite dimension.

For a physical pair $h=(f+g)/2$, $k=(f-g)/2$, let $t$ be the visible first correlation of $h$ and $\tau$ the norm of the purely remote cubic projection of $k$. Testing the disk responses against $Z\pm\lambda q$, with $q$ along that projection, gives $t+\lambda\tau\le\mathbb E|Z+\lambda q|$. The case $\tau=0$ follows from $t\le\mu$. The table gives outward-rounded implications.

| $t$ at least | Test $\lambda$ | $\tau$ strictly below |
|---:|---:|---:|
| .837652587890615 | .345 | .289392 |
| .83835 | .3425 | .287364 |
| .86183138 | .24 | .206509 |

At $t\ge .83835$, finite physical pairs can attain $\tau>.287345$. Indeed $.83835^2+.287345^2<\pi/4$, so a point on the Gaussian support circle has both coordinates strictly above those thresholds. Apply the normalized independent cubic-sum lift in [the full fifth projection calculation](FULL_FIFTH_PLANES.md). Thus the new upper bound is within $.000019$ of a realizable lower bound. In particular the negative-sign slice $t\ge .83835$, $\tau\ge .28898$ of that calculation is empty; its four affine bounds can still be used at attainable scales.

## Two scalar Rice estimates

Put $F(x)=\mathbb E|Z+\sqrt{x}|/\mu$ for $x\ge0$. Let $U=\cos^2\Theta$ for a uniform angle $\Theta$. The angular representation is
$$
 F(x)=1+\mathbb E_\Theta\int_0^1
             \frac{1-e^{-xUv^2}}{v^2}\,dv .
$$
For completeness, projection of a fixed complex number onto a uniform real line has mean absolute projection $2/\pi$ times its modulus. The real part of $Z$ has density $e^{-z^2}/\sqrt\pi$. For a real shift $a$, integrating the derivative of $\mathbb E|\operatorname{Re}Z+a|$ gives $\sqrt\pi\,\mathbb E|\operatorname{Re}Z+a|=e^{-a^2}+2a\int_0^a e^{-s^2}ds$. Integration by parts in $v$ identifies this with $1+\int_0^1(1-e^{-a^2v^2})/v^2\,dv$. Averaging gives the formula above.

The Taylor upper bound $1-e^{-s}\le s-s^2/2+s^3/6$ yields, on the full positive ray,
$$
 F(x)\le 1+x/2-x^2/16+x^3/96 .
$$
A complementary bound is
$$
 F(x)\le 1+x/2-\frac{x^2}{16(1+x/4)} .
$$
To prove it, $e^{-s}\ge(2-s)/(2+s)$ for $s\ge0$. After multiplying by $e^s$, the equivalent inequality is $2+s-(2-s)e^s\ge0$; its value and first derivative vanish at zero and its second derivative is $se^s\ge0$. The loss relative to the linear approximation $1+x/2$ is consequently at least
$$
 x^2\,\mathbb E\int_0^1\frac{U^2v^2}{2+xUv^2}\,dv .
$$
The mass of the weight $U^2v^2$ is $1/8$ and its weighted mean of $Uv^2$ is $1/2$, from $\mathbb E U^2=3/8$ and $\mathbb E U^3=5/16$. Jensen for the convex reciprocal proves the rational bound.

## Applying the circular sixth moment

Write $u=\lambda^2$, $W=|q|^2$, $m_2=\mathbb E W^2=2+z^2$, $m_3=\mathbb E W^3$. The [circular moment theorem](../../Grothe/LowerAnalytic/Circular.lean) gives $0\le z\le\sqrt{42}$ and
$$
 m_3\le M_3(z)=6+9z^2+(4045313/100000)z^3 .
$$
Condition on $q$ and use $\mathbb E W=1$. For $z\le1$, the cubic Taylor bound suffices. In fact $u[9+(4045313/100000)z]\le6$, so the term $-u^2 z^2/16$ pays the entire excess in $u^3m_3/96$ over $6u^3/96$.

For $z\ge1$, Cauchy–Schwarz gives
$$
 \mathbb E\frac{W^2}{1+uW/4}
 \ge\frac{m_2^2}{m_2+um_3/4}\ge 2-u .
$$
For the first inequality use the two factors $W/\sqrt{1+uW/4}$ and $W\sqrt{1+uW/4}$. For the second, the product $(2-u)(m_2+uM_3/4)$ increases in $u$ on the prescribed interval: its derivative is $(1-u)M_3/2-m_2\ge0$, since $M_3\ge3m_2$. At $u=.345^2$ the remaining inequality is a quartic in $z$. Subtract $z^2(z-23/20)^2$. The remaining cubic coefficient is nonnegative, the quadratic coefficient exceeds $1/4$, the linear coefficient vanishes, and the constant exceeds $-1/10$. Each comparison is rational, and $z\ge1$ finishes the proof. Applying the rational Rice bound now gives $1+u/2-u^2(2-u)/16$, as required.

From the repository root run `python3 -IB -O experiments/quintic-signed/code/sixth_rice_support.py`.

Agent-ID: codex-a7c4

## Finite-matrix transfer on the 117-piece schedule

At the left endpoint of each central piece, intersect the prior scale bound with the estimates at $\lambda=i/400$, $80\le i\le138$. Round the resulting upper bound on $\delta_{08}\tau$ upward to the $10^{-4}$ grid and retain the previously checked $.21$ minimum cutoff. Recompute each row-mixture deduction from its clipped chords. In outer cells 29 and 30 the same argument allows the already certified row-09 deduction $134819/250000000000$ throughout. Since row 09 enters the row 09/12 mixture with weight $1-u$, subtract $1-u$ times this deduction there. The amplitude cover remains the 117 closed pieces of [the repriced schedule](REPRICED_SIGNED_ENDPOINT.md).

Using the [all-cubic high price](JOINT_CUBIC_RICE.md) above $.885774$, the signed weight $.000049481859$ and nonzero fifth debit $10^{-8}$ give scalar cap $7132523664641/10^{13}$. Its reciprocal is **greater than 1.40202829603**. At zero debit the retuned weight $.000049461431$ instead gives $7132523642307/10^{13}$ and reciprocal **greater than 1.40202830042**. These are analytic certificates with exact replays; the complete Lean transfer using these new cutoffs is outstanding. The same original node-cap data supply the rows.

At the signed weight with its fifth debit set to zero, the outward scalar numerator already falls from 7132523664641 to 7132523648371 in units of $10^{-13}$. Retuning the pure weight to $.00004946138633$ yields scalar cap $713252364229283/10^{15}$ and reciprocal $>1.402028300432718$. The [two-contact argument](COMBINED_CENTRAL_CONTACTS.md) now uses the interior amplitudes $.81120935856$ in cell 14 and $.861937787768$ in cell 30. Their weighted lower estimate is strictly larger than $.7132523642292822+.22333265d$, placing the best reciprocal below $1.402028300432721$. For competitive weights $w\in[.000048,.000051]$ the pure upper arm above $.88$ stays below $.71325218370$. Below $.88$ every positive debit increases the sparse price, and the alternative high price has enough slack to preserve that increase. Outside this weight interval a central supporting line already exceeds the displayed pure cap. Thus every $0<d\le(1-w)/10000$ loses to an available pure setting on the updated estimates as well. This ablation concerns the same row and fifth-floor estimates; physical saturation at either contact remains open.

Run `python3 -IB -O experiments/quintic-signed/code/sixth_repriced.py` for both complete comparisons and their constituent checks.
