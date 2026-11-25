# The large-dimensional alternating ceiling for complex charge-one channels

Agent-ID: codex-a7c4. Paper proof and rational check, author only. The problem is the [alternating-sum question in the Haagerup article](https://github.com/agalatan/grothendieck-lean/blob/993f838205907bdcde328961b43febff1adb2885/haagerup-article/main.tex#L1202). Its high-dimensional construction adapts the quadratic phases of Xinyuan Xie and Haonan Zhang, *The König constant is one*, §§2–5. Their theorem concerns real Boolean functions. The choice of complex carriers and the pairing of real phase blocks below enforce the complex manuscript's common-map and charge requirements. [Xie–Zhang, arXiv:2608.14817](https://arxiv.org/html/2608.14817v1)

**Theorem.** For common charge-one disk maps with contractive real polynomial preprocessing separately in each complex coordinate,

$$\sup_{n\ge1}W_n^*=1,\qquad W_n^*\le 1-\frac{9}{128\,4^n n!}\quad(n\ge1).$$

The limiting examples use maps of modulus one almost everywhere and constant preprocessors with values in $\{-1,1\}$. For every convex mixture of channels, in arbitrary finite dimensions, $D(H)\le H_0\le\pi/4$. Thus the two open questions about finite-dimensional attainment and approximation of $\sup_n W_n^*$ by $D(H)$ both have negative answers. The exact value of $W_2^*$ is a separate question.

## 1. The Fourier representation

Identify $\mathbb C^n$ with $\mathbb R^{N}$, $N=2n$, by taking real and imaginary parts, with real dot product $x\cdot y=\operatorname{Re}\sum_j\bar x_j y_j$. The probability density of $Z$ is $\pi^{-N/2}e^{-|x|^2}$. Write $w_N(x)=\pi^{-N/4}e^{-|x|^2/2}$, $H_G=w_N G$, and choose the unitary Fourier transform with kernel $(2\pi)^{-N/2}e^{-ix\cdot y}$. Multiplication by $w_N$ is an isometry from Gaussian $L^2$ to Lebesgue $L^2$. Under it the homogeneous chaos of total real degree $d$ becomes the Hermite-function eigenspace on which $\mathcal F$ acts by $(-i)^d$. For example this follows by Fourier transforming the generating function $e^{-|x|^2/2}e^{2s\cdot x-s\cdot s}$ and comparing Taylor coefficients: the transformed expression has $s$ replaced by $-is$. Complex Hermites of bidegrees $(a_j,b_j)$ lie in this real chaos at $d=\sum_j(a_j+b_j)$. On a total-charge-one component $d$ is odd and $i(-i)^d=(-1)^{(d-1)/2}$.

For $\sigma\in\{\pm1\}^n$ let $R_\sigma$ multiply coordinate $j$ by $\sigma_j$. On a complex Hermite basis vector it contributes the factor $\prod_j\sigma_j^{a_j+b_j}$. Therefore the alternating sum of the channel with constant preprocessing $P_j=\sigma_j$ is

$$ W(G,\sigma)=\langle H_{G\circ R_\sigma}, i\mathcal F H_G\rangle. \tag{1} $$

We use the inner product conjugate-linear in the first argument. The expression is real from the Hermite expansion. Equivalently, one may put the reflected map on the integration variable of the Fourier transform: the quadratic kernel is symmetric in the spatial variables, $R_\sigma$ is an involution and commutes with $\mathcal F$. The coefficient in its double integral in real dimension $p$ is exactly $c_p=(\sqrt2\,\pi)^{-p}$, since $\pi^{-p/2}(2\pi)^{-p/2}=c_p$. In particular one unused real coordinate contributes a factor one.

For general admissible $P_j$ put $t_j=P_j(-1)\in[-1,1]$. Absolute convergence in the Wiener norm follows from Parseval and the polynomial norm bound, so evaluation at $-1$ gives the same Hermite sum with factors $\prod t_j^{a_j+b_j}$. Let $N$ be the anisotropic Gaussian averaging operator with correlation $\sqrt{|t_j|}$ in coordinate $j$. It preserves the disk and total charge one. Each Hermite coefficient of $NG$ acquires the factor $\prod |t_j|^{(a_j+b_j)/2}$, by the Wick generating function. Consequently $W(G,P)=W(NG,\operatorname{sgn}t)$, assigning either sign when $t_j=0$ and using $0^0=1$. In particular $|W|\le1$ by (1) and Plancherel.

## 2. A charge-one realization of the quadratic phases

Fix $m\ge3$ and $D\ge1$, put $d=2D$ and $\varepsilon=(2\pi/d)^{1/3}$. Introduce $2m$ complex carrier coordinates $(X_{s,0},X_{s,1})$. For each triple $I=\{j,k,\ell\}\subset[m]$, $j<k<\ell$, introduce $D$ complex triples $(U_{I,t,j},U_{I,t,k},U_{I,t,\ell})$, $1\le t\le D$. There are $n=2m+3D\binom m3$ complex coordinates in total. Define

$$ \theta_s(U)=\varepsilon\sum_{I\ni s}\sum_{t=1}^D\operatorname{Re}(\overline{U_{I,t,p}}U_{I,t,q}),\qquad \{p,q\}=I\setminus\{s\}. \tag{2} $$

If $U_p=x_p+iy_p$ then $\operatorname{Re}(\overline U_p U_q)=x_p x_q+y_p y_q$. The real and imaginary coordinates of each triple are thus precisely two of the real triples in Xie–Zhang (2.2). The real phase dimension is $M=6D\binom m3=3d\binom m3$. There is no $\sqrt2$ adjustment: these are the Fourier integration variables in (1), whose joint weight is $c_M\exp[-(|u|^2+|v|^2)/2]e^{-iu\cdot v}\,du\,dv$. This is the Xie–Zhang normalization coordinate by coordinate. Every $\theta_s$ is invariant under a simultaneous complex rotation of all coordinates, and even in $U$.

For real unit vectors in $\mathbb R^{2m}$ set

$$a(U)=m^{-1/2}(\cos\theta_1(U),\sin\theta_1(U),\ldots,\cos\theta_m(U),\sin\theta_m(U)),\qquad G(X,U)=\mathrm{ph}\left(\sum_{s,b} a_{s,b}(U) X_{s,b}\right). \tag{3}$$

Here $\mathrm{ph}(0)=0$. The coefficients have squared norm one, so the linear combination is a nondegenerate complex Gaussian at each fixed $U$ and $|G|=1$ almost everywhere. Equation (2) proves $G(e^{i\alpha}X,e^{i\alpha}U)=e^{i\alpha}G(X,U)$. Choose $R$ to negate only the $m$ sine carrier coordinates $X_{s,1}$. With $b(V)=Ra(V)$ on carrier space, the inner product of the two real unit directions is

$$t(u,v)=a(U)\cdot b(V)=m^{-1}\sum_{s=1}^m\cos(\theta_s(U)+\theta_s(V)).\tag{4}$$

## 3. Integrating the carriers first

Let $r_k$ be the squared norm of the homogeneous $2k+1$ component of complex Gaussian phase in one variable. In the manuscript $r_k=\pi\binom{2k}k^2/[4(k+1)16^k]$. Only $r_k\ge0$ and $\sum r_k=1$ are needed, both immediate by Parseval. For real unit vectors $a,b$ and complex Gaussian $X$, the scalar linear combinations $a\cdot X,b\cdot X$ have complex correlation $t=a\cdot b\in[-1,1]$. By the one-coordinate Mehler formula the inner product of their two degree $2k+1$ phase components is $r_k t^{2k+1}$, including $t=\pm1$ by continuity. Indeed each such component is the pullback along the linear form of a multiple of $\mathcal H_{k+1,k}$. A unitary change of complex coordinates sending that linear form to the first coordinate preserves total degree. Thus the double Fourier integral over the carriers, including the factor $i$ in (1), equals

$$\psi_C(t)=\sum_{k\ge0}(-1)^k r_k t^{2k+1}.\tag{5}$$

Fubini applies in the full double Fourier integral because the product of the two Gaussian envelopes is integrable in every finite dimension. Substitution of (4) and (5) in (1) gives

$$W(G,R)=\sum_{k\ge0}(-1)^k r_k T_{d,m,k},\quad T_{d,m,k}=c_M\iint e^{-(|u|^2+|v|^2)/2-iu\cdot v}\, t(u,v)^{2k+1}\,du\,dv.\tag{6}$$

For each fixed $d,m$ the series may be integrated termwise since $|t|\le1$ and $\sum r_k=1$. Evenness of every phase permits replacing $-iu\cdot v$ by $+iu\cdot v$ via $v\mapsto-v$. Thus these $T_{d,m,k}$ are exactly Xie–Zhang's numbers (2.12)–(2.15). Their real half-space coefficients are replaced by the $r_k$ in (5).

## 4. The determinant and the two limits

For a check of that identification, let $L=2k+1$, take independent uniform $\tau_1,\ldots,\tau_L\in[m]$ and independent uniform signs $s_1,\ldots,s_L$. Define the integer vector $\mu_j=\sum_a s_a\mathbf1_{\tau_a=j}$. Expanding the cosines in (4) expresses the power $t^L$ as the expectation of $\exp(i\sum_j\mu_j(\theta_j(u)+\theta_j(v)))$. For each fixed $\mu$ the integral splits over the triple blocks. For $a,b,c$ assigned to a triple let

$$ A=\begin{pmatrix}0&c&b\\c&0&a\\b&a&0\end{pmatrix},\quad \Delta_\varepsilon=\det(I-i\varepsilon A-\varepsilon^2 A^2/2),\quad \phi_\varepsilon=\Delta_\varepsilon^{-1/2},\tag{7}$$

using the continuous square root with $\phi_0=1$. Each real triple contributes $\phi_\varepsilon$. The Gaussian exponent on the paired integration variables has block matrix with diagonal blocks $I-i\varepsilon A$ and off-diagonal blocks $-iI$. The sum and difference coordinates diagonalize it into the blocks $I-i\varepsilon A\pm iI$, whose product is $2(I-i\varepsilon A-\varepsilon^2 A^2/2)$. The real part is positive definite and the normalization $c_3$ cancels the factor $2^{3/2}$ from the determinant. This proves

$$T_{d,m,k}=\mathbb E_{\tau,s}\prod_{j<\ell<h}\phi_\varepsilon(\mu_j,\mu_\ell,\mu_h)^d.\tag{8}$$

For each real eigenvalue $\lambda$ of $A$, $|1-i\varepsilon\lambda-\varepsilon^2\lambda^2/2|^2=1+\varepsilon^4\lambda^4/4$. In particular $|\phi_\varepsilon|\le1$, and $|T_{d,m,k}|\le1$ uniformly in the growing dimensions. Near zero the logarithm of the eigenvalue factor is $-i\varepsilon\lambda-i\varepsilon^3\lambda^3/6+O(\varepsilon^4\lambda^4)$. Using $\operatorname{tr}A=0$ and $\operatorname{tr}A^3=6abc$ gives $\log\phi_\varepsilon=iabc\varepsilon^3/2+O_{a,b,c}(\varepsilon^4)$. Since $d\varepsilon^3=2\pi$ and $d\varepsilon^4\to0$, $\phi_\varepsilon(a,b,c)^d\to(-1)^{abc}$, also on the required even subsequence $d=2D$. These are the determinant and parity estimates of Xie–Zhang's Proposition 3.1 through Lemma 4.1.

For fixed $m,k$, the expectation in (8) has finite support. Taking $D\to\infty$ first leaves $E_{m,k}=\mathbb E(-1)^{e_3(\mu)}$, $e_3(\mu)=\sum_{j<\ell<h}\mu_j\mu_\ell\mu_h$. The sign at this stage depends on repeated indices; it need not equal $(-1)^k$. For fixed $k$ the probability of any repeated $\tau_a$ is at most $\binom{2k+1}2/m$. Outside this event $\mu$ has $2k+1$ odd entries and all other entries vanish. Therefore $e_3(\mu)\equiv\binom{2k+1}3\equiv k\pmod2$, and $E_{m,k}\to(-1)^k$ as $m\to\infty$. Applying dominated convergence to (6) first in $D$ and then in $m$, with summable majorant $r_k$, proves

$$ \lim_{m\to\infty}\lim_{D\to\infty}W(G,R)=\sum_{k\ge0} r_k=1. \tag{9} $$

This proves the asserted supremum. Padding with unused coordinates makes $W_n^*$ nondecreasing if one wants the ordinary limit as $n\to\infty$.

### A finite witness above 0.96

Take $m=10^5$, $d=10^{96}=2D$ and retain $0\le k\le16$. These choices are for an explicit existence bound. They require no construction or storage of the full channel. Put $L=33$ and $B=16\binom m3 L^4/10^{32}$. Every frequency vector from at most $L$ draws has $\sum_j|\mu_j|\le L$, hence each eigenvalue of a triple matrix $A$ has absolute value at most $L$ by its maximum absolute row sum. Also $\varepsilon L<1$.

To bound the remainder in (7), use $f(x)=\log(1-ix-x^2/2)$ on the branch through zero. Direct differentiation gives
$$ f'(x)+i+ix^2/2=\frac{x^3/2-ix^4/4}{1-ix-x^2/2}. $$
The denominator has modulus at least one. Integrating on $|x|\le1$ bounds $|f(x)+ix+ix^3/6|$ by $3|x|^4/16$. The summed logarithmic error for the full product in (8) is at most $\binom m3 d\varepsilon^4L^4<B$, since $2\pi<8$. The modulus of the difference from $(-1)^{e_3(\mu)}$ is therefore at most $2B$ (use $|e^z-1|\le2|z|$ for $|z|\le1/2$). The squared-norm estimate in (7) gives $|T_{d,m,k}|\le1$ also for the discarded degrees. With the probability bound on collisions and $333/106<\pi$ in the retained coefficients of (5), we obtain
$$
 W\ \ge\ 1-2\left(1-\sum_{k=0}^{16}r_k\right)
      -\frac{2\binom{33}{2}}m-2B\ >\ 0.96.
$$
The two factors of two respectively allow an adversarial sign on the discarded phase mass and on a collision of indices. For three equal draws the cubic parity differs from that for three distinct draws. The rational verifier checks the stated endpoint and rejects a target of $0.97$ from this estimate.

## 5. Uniform strictness in each fixed dimension

Here is a direct bound using the zero-frequency obstruction of Xie–Zhang's Appendix A. For an arbitrary admissible response, absorb preprocessing as in §1 and write $H=w_N G$ for the resulting disk map. Charge one makes $H(-x)=-H(x)$, so $\int H=0$. Its Fourier transform is continuous and, since $|e^{-it}-1|\le|t|$,

$$ |\mathcal FH(y)|\le(2\pi)^{-N/2}\int w_N(x)|x\cdot y|\,dx=\pi^{-N/4}\sqrt{2/\pi}\,|y|. $$

Because $\|H\circ R\|_2=\|\mathcal FH\|_2=\|H\|_2$ and $\int w_N^2=1$, (1) gives

$$1-W(G,R)=\int(w_N^2-|H\circ R|^2)+\tfrac12\|H\circ R-i\mathcal FH\|_2^2.$$

For $|y|\le1/2$ write $w=w_N(y)$, $h=|H(Ry)|\le w$ and $b=|\mathcal FH(y)|$. We have $w-b\ge\pi^{-N/4}(7/8-1/2)=3\pi^{-N/4}/8$, since $e^{-1/8}\ge1-1/8$. Pointwise $w^2-h^2+(h-b)^2/2\ge(w-b)^2/2$, as the difference is $(w-h)((w+h)/2+b)$. Outside the ball the original sum of the two integrands is nonnegative. The volume of this ball is $\pi^{N/2}/[2^N\Gamma(N/2+1)]$. Integrating gives $1-W\ge9/[128\,4^n n!]$. Even the equality-only argument is immediate: $W=1$ would force $|\mathcal FH(y)|=w_N(y)$ almost everywhere and hence everywhere by continuity, in contradiction with $\mathcal FH(0)=0$.

## 6. A uniform separation from the transfer slope

The constant coefficient of one channel is $h_0=\sum_{j=1}^nP_j(0)|c_j|^2$, $c_j=\mathbb E[\bar Z_jG(Z)]$. Only the total-degree-one terms contribute. For any unit $a\in\mathbb C^n$, the Gaussian linear form $\sum a_j Z_j$ has the standard complex Gaussian law, so $|\sum\bar a_j c_j|\le\mathbb E|\sum a_j Z_j|=\sqrt\pi/2$. Hence $h_0\le\sum_j|c_j|^2\le\pi/4$. This upper bound on the first coefficient survives convex mixtures. It follows that $D(H)=H_0-\sum_{k\ge1}|H_k|\le\pi/4<1$. The manuscript's transfer lemma and any known strict Grothendieck lower bound give the separate, numerically stronger inequality $D(H)\le 1/K_G^{\mathbb C}$ whenever $D(H)>0$. Neither conclusion yields an improved Grothendieck upper bound from the large alternating sums.

### Two checks specific to the constructed sequence

For $m=3$, the sign $(-1)^{e_3(\mu)}$ is negative exactly when all three occupancy counts are odd; the independent signs do not affect these parities. For $L=2k+1$, expanding the product of the three odd-parity indicators gives probability $\tfrac18\sum_{j=0}^3(-1)^j\binom3j(1-2j/3)^L=(1-3^{1-L})/4$. Thus $E_{3,k}=1/2+(3/2)3^{-L}$ and

$$\lim_{D\to\infty}W(G,R)=\tfrac12\psi_C(1)+\tfrac32\psi_C(1/3)>0.74\quad(m=3).$$

For the last inequality use the article's $\psi_C(1)=\gamma^\dagger>0.71195$ and $\psi_C(1/3)\ge\pi/12-\pi/864$ by the first two terms of (5), a decreasing alternating series at $1/3$. The numerical value is $0.7434391955\ldots$.

The actual transfer slopes of the examples in (9) tend to $-1$ in the iterated limit. Conditional on $U$, the carrier's vector of linear Hermite coefficients is $(\sqrt\pi/2)a(U)$, and all the hidden linear coefficients vanish by integrating $X$ first. For independent standard complex Gaussians $u,v$, $\mathbb E e^{i\varepsilon\operatorname{Re}(\bar u v)}=(1+\varepsilon^2/4)^{-1}$ by conditioning on $u$. For fixed $s$, the $D\binom{m-1}2$ pair products in (2) use independent complex triples. Hence $\mathbb E\sin\theta_s=0$ and $\mathbb E\cos\theta_s=(1+\varepsilon^2/4)^{-D\binom{m-1}2}$. All surviving first coefficients lie in the positive cosine carrier directions, giving

$$ h_0=\frac\pi4(1+\varepsilon^2/4)^{-2D\binom{m-1}2}. $$

For every $m\ge3$, $h_0\to0$ as $D\to\infty$, since $D\varepsilon^2$ tends to infinity. For every finite channel in this construction $h_0\ge0$, $\sum|h_k|\le1$, and $-1\le D(h)\le h_0-|W(h)-h_0|$. Together with (9) this gives diagonal channels with $W(h)\to1$ and $D(h)\to-1$ (equivalently, both iterated upper and lower limits for $D(h)$ are $-1$ after $m\to\infty$).

For the explicit channels in (2)–(3) the separation is stronger. Condition on the auxiliary variables. The first-chaos coefficients on the carriers are $(\sqrt\pi/2)\mathbb E a_{s,b}$, and those on the auxiliary coordinates vanish because the conditional carrier phase has mean zero. The expectation of a single $e^{i\varepsilon\operatorname{Re}(\bar UV)}$ for independent standard complex $U,V$ is $(1+\varepsilon^2/4)^{-1}$, by conditioning on $U$ and using its exponential squared radius. For fixed $s$ there are $D\binom{m-1}2$ independent terms in $\theta_s$. Thus the sine averages vanish and the constant coefficient is
$$
 h_0=\frac\pi4(1+\varepsilon^2/4)^{-2D\binom{m-1}{2}}.
$$
At fixed $m\ge3$ it tends to zero as $D\to\infty$ because $D\varepsilon^2\to\infty$. Choose a diagonal sequence realizing (9) and $h_0\to0$. Along that sequence $-1\le D(h)\le h_0-|W(h)-h_0|\to-1$, using the norm bound $\sum|h_k|\le1$. Thus a single channel can have its alternating sum tending to one while its transferable slope tends to minus one.

## Replay

From the repository root run `python3 -IB research/upper-channels/code/high-dimensional-alternation-codex-a7c4/verify.py`. The high-dimensional limit follows from the determinant and the two ordered limits above. The script checks the finite witness using rational arithmetic.
