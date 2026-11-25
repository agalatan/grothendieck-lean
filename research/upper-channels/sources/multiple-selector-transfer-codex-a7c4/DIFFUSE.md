# A cubic phase in the alternating score and its first-mass obstruction

Agent-ID: codex-a7c4. This result concerns $W=\sum_{k\ge0}(-1)^kH_k$. Its transfer scope is controlled separately by $H_0$. The finite mixture estimates are in the [transfer proof](FINITE.md).

Let $\theta=\delta+\sum_j a_j(|u_j|^2-1)$ for independent standard complex Gaussians. Use the phase map $G=\operatorname{ph}(z\cos\theta+p\sin\theta)$ with preprocessors $(1,-1,1,\ldots,1)$. Write
$$
 F(q)=\sum_{k\ge0}(-1)^k r_k q^{2k+1}
 =\frac{\pi q}{4}{}_2F_1(1/2,1/2;2;-q^2),\qquad F(\cos s)=\sum_{m\ {\rm odd}>0} b_m\cos(ms).
$$
Then
$$
 W=\sum_{m\ {\rm odd}>0} b_m\Re\!\left[e^{2im\delta}\prod_j\Psi(ma_j)\right],\qquad
 \Psi(t)=\frac{e^{-2it}}{1-2it-2t^2},\qquad |\Psi(t)|=(1+4t^4)^{-1/2}.
$$
Indeed the absolutely summable signed radial kernel has $W$ equal to its value at $x=-1$ after dividing by the input correlation. Each characteristic factor $c/(1-\lambda x)$ from the finite proof becomes $\Psi$ there. The scalar-degree factor $x^k$ supplies the alternating sign in $F$. Expanding each cosine power into cosine modes and summing is valid because the positive binomial masses for each power sum to one and $\sum r_k=1$. This proves the formula for arbitrary finitely many positive or negative strengths. The count of complex inputs is two plus the number of selectors.

With three equal strengths $a=17/100$, $\delta=0$, this gives $0.71312555<W<0.71312557$, above the article's $0.712901282245$ upper enclosure for its strongest two-coordinate cell. Twelve equal strengths $a=7/50$ give $0.71528556<W<0.71528557$. All these numbers are alternating scores. [Article enclosure](../../../../haagerup-article/main.tex).

## The diffuse limit

For $d$ equal strengths $a_d=(\pi/(32d))^{1/3}$ and $\delta=-\pi/48$, the scores converge to a number in $(0.74366907,0.74366908)$. In fact $\log\Psi(t)=4it^3/3+O(t^4)$ on the branch at zero. Thus at every fixed frequency $m$,
$$
 e^{2im\delta}\Psi(ma_d)^d\ \longrightarrow\ e^{i\pi(m^3-m)/24}
 =(-1)^{(m^3-m)/24}.
$$
For odd $m$, $(m-1)m(m+1)$ is divisible by 24. Since $|\Psi|\le1$ and the Fourier series is absolutely summable, the limiting score is $\sum_m b_m(-1)^{(m^3-m)/24}$. In particular an admissible finite-dimensional map has score above $0.743$.

## Quantitative coupling to first mass

For $z$ and $p$ the first Hermite coefficients of $G$ are $(\sqrt\pi/2)\mathbb E\cos\theta$ and $(\sqrt\pi/2)\mathbb E\sin\theta$. This follows by conditioning on the selectors and applying unitary invariance of scalar phase. Averaging first in $z,p$ annihilates all selector first coefficients. The signed first mass is therefore
$$
 H_0=\frac\pi4\Re\!\left[e^{2i\delta}\prod_j\frac{e^{-2ia_j}}{(1-ia_j)^2}\right], \qquad
 |H_0|\le\frac\pi4\prod_j(1+a_j^2)^{-1}.
$$
In the preceding cubic-phase limit $d\log(1+a_d^2)\to\infty$, hence $H_0\to0$ and $D\le H_0$.

More generally $\Psi'(t)/\Psi(t)=4it^2/(1-2it-2t^2)$, so $|\Psi'(t)|=4t^2/(1+4t^4)$ and $|\Psi(t)-1|\le4|t|^3/3$. If $|H_0|\ge h>0$, the product estimate gives $\sum a_j^2\le\pi/(4h)-1$. Telescoping the factors of the score yields the dimension-free estimate
$$
 |W-F(\cos(2\delta))|
 \le \frac43\left(\sum_{m\ {\rm odd}>0}m^3|b_m|\right)
       \left(\frac{\pi}{4h}-1\right)\max_j|a_j|.
$$
Euler's beta integral identifies $F(q)$ with $(\pi/4)$ times a positive average of $q/\sqrt{1+tq^2}$ for $0<t<1$, an increasing function of real $q$. Consequently any family retaining first mass $|H_0|\ge h$ while $\max_j|a_j|\to0$ has $\limsup W\le F(1)=\gamma^\dagger$, even with a varying offset. The much larger cubic-phase score requires loss of first mass.

## Fourier enclosures

In $|\Im s|\le1/2$, the same beta integral gives $|F(\cos s)|\le(\pi/4)\cosh(1/2)/\sqrt{1-\sinh^2(1/2)}<2$. Its complex Fourier coefficients $g_m$ obey $|g_m|\le2e^{-|m|/2}$, and $b_m=2g_m$ for $m>0$ odd by symmetry. At 256 equispaced real samples the discrete Fourier coefficient at $m$ is $\sum_j g_{m+256j}$. The total alias error after doubling is at most $8e^{-(256-m)/2}/(1-e^{-256/2})$. For $m=1,3,\ldots,81$ the checker uses 100-bit Arb enclosures of all the samples; omission of $m\ge83$ costs at most $4e^{-83/2}/(1-e^{-1})$ for each finite dimension as well as the limit. [Fourier verifier](../../code/multiple-selector-transfer-codex-a7c4/verify_score.py).

```sh
python3 -IB -O research/upper-channels/code/multiple-selector-transfer-codex-a7c4/verify_score.py
```
