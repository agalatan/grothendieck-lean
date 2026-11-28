# Increasing the cubic penalty and fifth eigenvalue together

Agent-ID: codex-a7c4. For $j=3,5$, let $\Delta_j$ be the real pairing of the actual bidegree $((j+1)/2,(j-1)/2)$ projections of two physical unimodular responses $f,g$. Adding $a(-Q+\beta F)$ to any witness, with $a>0$, changes its real payoff by $a(-\Delta_3+\beta\Delta_5)$. This direction changes the cubic coefficient that was held fixed in [the two-test ceiling](GRADED_STEP.md). Its fifth eigenvalue increases by $\beta a$.

For **every** pair and **all** finite dimensions, with $t=\|P((f+g)/2)\|$ and $\mu=\sqrt\pi/2$, the following bounds hold:
\[
 -\Delta_3+\Delta_5\le-5\mu^2/64+(35/8)\mu(\mu-t),\qquad
 -\Delta_3+2\Delta_5\le-\mu^2/32+(17/2)\mu(\mu-t).
\]
Thus the directions strictly decrease every real payoff above $55\mu/56$ and $271\mu/272$, respectively. For $\beta=2$ and $t\ge .8858$, the decrease exceeds $.0213a$. The same direction decreases the payoffs of the two [certified central responses](GRADED_STEP.md) by more than $.0025a$ and $.008a$, respectively. The central assertions are two physical tests; a general central near-maximizer remains to be priced. The real rotation used for an absolute payoff determines the $t$ in the universal estimates.

## Pure-chaos inverse-radius bound

For a unit linear Gaussian coordinate $Z$ and any polynomial $v$ in either of the *individual* chaoses $Q$ or $F$,
\[
 \mathbb E\frac{|v|^2}{|Z|}\le\sqrt\pi\,\|v\|_2^2.
\]
Choose coordinates with $Z$ first. In a pure bidegree $(p,q)$, expand $v=\sum H_{a,b}(Z)v_{p-a,q-b}$ with $0\le a\le p,0\le b\le q$. The coefficients live in orthogonal remote bidegrees, so any weight depending only on $Z$ preserves all cross-term cancellations after integrating the remote variables. In dimension one the same computation has only the visible term. The normalized weighted diagonal ratios $\mathbb E|H_{a,b}(Z)|^2/(\sqrt\pi|Z|)$, with rows $a=0,1,2,3$ and columns $b=0,1,2$, are
\[
 \begin{pmatrix}
 1&1/2&3/8\\
 1/2&3/4&7/16\\
 3/8&7/16&41/64\\
 5/16&11/32&51/128
 \end{pmatrix}.
\]
The [binomial collision formula](PURE_CHAOS_RADIAL.md) proves the same inverse-radius constant in every pure bidegree. The [rational replay](code/coupled_cubic_fifth.py) expands the normalized complex Hermites and integrates each monomial against the exponential law for $|Z|^2$. By duality and weighted Cauchy--Schwarz, for either projection $D$ and any bounded $b$, $\|Db\|^2\le\sqrt\pi\,\mathbb E[|Z||b|^2]$. Orthogonality over the remote variables is specific to a single bidegree here.

## Joint estimate

Write $h=(f+g)/2$, $k=(f-g)/2$, $Ph=tZ$, $u=\operatorname{ph}Z$, $T=|Z|^2$, $l=h-u$, $\rho=1-\operatorname{Re}(\bar u h)$. Then $\mathbb E\sqrt T\rho=\mu-t$ and $|l|^2+|k|^2=2\rho$ pointwise. Expanding the two projection squares and using the [visible radial coefficients](VISIBLE_PAIR_BUDGET.md) gives the exact identity
\[
 -\Delta_3+\beta\Delta_5=-\pi/32+3\beta\pi/256+
 \mu\mathbb E[\sqrt T\rho W_\beta(T)]
 +\|Qk\|^2-\beta\|Fk\|^2+\beta\|Fl\|^2-\|Ql\|^2,
\]
where $W_\beta(T)=(2-T)/2-\beta(3-3T+T^2/2)/4$. In particular $W_1=3/8-(T-1)^2/8$ and $W_2=1/2-(T-2)^2/4$. The squares remain available when pricing the central interval. For the uniform high-amplitude bounds use each maximum and bound the two positive projection norms by
\[
 \sqrt\pi\max(1,\beta)\mathbb E[|Z|(|k|^2+|l|^2)]
 =4\mu\max(1,\beta)(\mu-t).
\]
The operator still has Gaussian $L^2$ norm one when its first eigenvalue remains one and all other eigenvalues stay in $[-1,1]$. A full lower bound still requires an absolute payoff cap for all remaining pairs and the finite-matrix transfer for the chosen coefficients.

## Matched gain on all conditional Gaussian phase templates

On the [fixed-amplitude conditional Gaussian drivers](GAUSSIAN_DRIVER_BOUND.md), the same coupling has a provable gain over the matched pure cubic witness. At $a=.04$, $\beta=2$, hence $e'=.804$ and fifth eigenvalue $.1035$, the absolute payoff is below $1/1.4035$ for **every** dimension, amplitude and admissible remote coefficient field in that family. Remove the new fifth term alone at the very same $e',\nu$: an explicit response in dimension 21,001 has payoff greater than $1/1.4014$. At the smaller coupled change $a=.02$ the exact maximum over the family is attained by the visible phase and has reciprocal above $1.40323737$. These comparisons concern the prescribed family of responses.

In the notation of the linked phase expansion write $x$ for the squared visible input amplitude, $p=1-x$, $A=\pi/4$, $a_1=A/8$, $a_2=3A/64$. Then $\Delta_{3,*}=a_1x^3-Ap$, $\Delta_{5,*}=a_2x^5-3a_1x^2p$. The excess $L=\Delta_3-\Delta_{3,*}=Ap(1-c_2)+2a_1xp^2m_2$ is nonnegative. For an *increase* of the fifth eigenvalue we need its upper price. The exact fifth formula, $D_2\le1$, $m_4\le m_2$ and nonnegativity of the self-energies give
\[
 \Delta_5-\Delta_{5,*}\le 3a_1x^2p(1-c_2)+2a_1xp^2+
      a_2(6x^3p^2+3xp^4)m_2 \le (9/8)L+2a_1xp^2 .
\]
Indeed $3a_1/A=3/8$ and $(a_2/(2a_1))(6x^2+3p^2)\le9/8$. Put $k=e+\nu+a$, $b=2a$. Since $9b/8<k$, the $L$ term is paid. The resulting real upper bound is
\[
 A[k+(1-\nu-k+b/4)x-7bx^2/8+(5b-k)x^3/8+3bx^5/64]+\nu\Psi(2x-1).
\]
The opposite sign is bounded by $\nu+ka_1+b<.2$, using $\Delta_3\le a_1$ and $|\Delta_5|\le1$. The replay uses 614 closed intervals for $a=.04$. At $a=.02$ it uses 129 intervals and the positive derivative on $[.99,1)$ to establish attainment at $x=1$.

For the matched pure obstruction choose $x=.81$ and $N=7000$. Set $V_i=B_i\bar C_i/\sqrt N$, $T=\|V\|^2$, and $U=V/\sqrt T$. The remote directions have unit norm and the required two charges. The normalized covariance of two independent copies gives $m_2=1/N$ by independent coordinate phases and permutation symmetry. Since $V$ lies in remote degree two, $1-c_2\le\mathbb E\|U-V\|^2=\mathbb E(1-\sqrt T)^2\le\mathbb E(1-T)^2=3/N$. Relative to the reference payoff this costs at most $kA(3p+xp^2/4)/N$. The first sixteen nonnegative terms of $\Psi(2x-1)$ and the rational error bound prove the stated strict pure comparison on these actual normalized triples.

~~~sh
python3 -IB -O experiments/quintic-signed/code/coupled_cubic_fifth.py
~~~
