<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/hjm-note-2026-11-17/HJM_Example3.1_d2_d3.md (17 November 2026): a consolidation note by an outside assistant session of the user, supplied about 06:00. Its scripts verify_example31.py and certify_d2.py, and claude-b9ee's re-runs of them (runs_yo/), are in code/third-chaos-2026-11-17/hjm-note/. Only this line was added. -->
# Example 3.1 of Heilman–Jones–Malavolta for $d=2,3$: what is proved, and what is still missing

*Source:* S. Heilman, C. Jones, G. Malavolta, *Primal/Dual Method for the Grothendieck Constant*, arXiv:2610.10477v1, Example 3.1.
*This note:* consolidates the Gemini material, fixes its errors, and adds new results: Theorem 4.2, Proposition 4.3, **Theorem 4.7 (which completes $d=2$)**, the analytic single crossing in §5.3, and the $d=2$ part of Proposition 4.6. The Gemini material consists of:

- the "rigorous" log and the "chain" log;
- attachment A: martingale/isoperimetric bound and hinge-square;
- attachment B: coordinate deficit and 4-partite cubics;
- attachment C: cloning, 2-D harmonic cubics, nodal formula;
- the "End-to-End Rigorous Exposition", plus the follow-up turn on the score–Hessian identity, the Fano plane, and $K_N^{(3)}$;
- the "master summary" and the two later expositions claiming a complete $d=2$ proof (its §7 / Theorem 7.1). The last of these is the revised End-to-End with §8 on the semigroup and score–Hessian identities.

Status as of 17 Nov 2026.

**Legend.**

- **[Proved]**: a complete proof is given here.
- **[Proved + 1‑D numerics]**: the proof is complete except for evaluating explicit one-dimensional integrals or a finite search. These are done in double precision by `verify_example31.py`; that is reliable but not interval arithmetic.
- **[Proved, computer-assisted]**: every inequality is proved here, and a finite list of explicit lower bounds is evaluated by `certify_d2.py` (IEEE double, with a rounding slack; not interval arithmetic).
- **[Numerical]**: evidence only.
- **[Open]**: there is no proof.

---

## 0. Summary

1. **The claim in Example 3.1 is equivalent to a sharp Wiener-chaos inequality.** For every $d\ge 1$, $\mathrm{SDP}(\Pi_d^{(n)})\to 1$ and $\mathrm{OPT}(\Pi_d^{(n)})\ge \frac2\pi-o(1)$. Also, $\mathrm{OPT}(\Pi_d^{(n)})$ is nondecreasing in $n$. So the gap tends to $\pi/2$ **if and only if**
   $$(C_d)\qquad \mathbb E|F|\le\sqrt{2/\pi}\,\|F\|_{L^2(\gamma_n)}\quad\text{for every } n \text{ and every } F \text{ in the } d\text{-th Wiener chaos } \mathcal H_d^{(n)} .$$
   The paper gives no proof of this ("It can be shown…"), and we found none in the literature. It is the $p=1$ case of Janson's extremal problem on Wiener chaos. **[Proved]** (Theorems 1 and 2.)
2. **An exact $\pi/2$ gap with pure degree-$d$ Hermite projections.** For the tensor-type projections $\Pi^{(m)}_1\otimes\Pi^{(n)}_{d-1}$ and $(\Pi_1^{(n)})^{\otimes d}$, the gap tends to $\pi/2$. **[Proved]** (Theorem 3.) This is a variant of the claim, not the claim for $\Pi_d$ itself.
3. **Partial results on $(C_2)$ and $(C_3)$:**
   - $(C_d)$ holds on every subspace that is "linear in one block of variables", i.e. on Gaussian mixtures. This includes the exact-transversal cubics and the 2-D harmonic cubics $\mathrm{Re}(X_1+iX_2)^3$, together with closure under independent sums (Corollary 4.1, Lemma 4.1′).
   - **New: $(C_2)$ holds, with strict inequality, for every $n$ and every nonzero $F\in\mathcal H_2^{(n)}$. Hence $\mathrm{SDP}(\Pi_2^{(n)})/\mathrm{OPT}(\Pi_2^{(n)})\to\pi/2$, i.e. Example 3.1 is proved for $d=2$.**
     - Spectra with $\|\lambda\|_\infty\le1/8$ (the whole neighbourhood of the asymptotic optimizers): **[Proved]** by hand (Theorem 4.2).
     - Spectra with $\|\lambda\|_\infty\in[1/8,1]$: **[Proved, computer-assisted]** (Theorem 4.7). Every inequality is proved; the computer only checks that 5,059 explicit lower bounds are positive.
     - This is independent of Gemini's unpublished `certify_d2_complete.py`.
   - $(C_d)$ holds whenever $F$ correlates strongly with a one-dimensional Hermite polynomial $\psi_d(\langle v,X\rangle)$. For $d=3$ correlation $\ge 0.84$ suffices; for $d=2$, correlation $\ge 0.91$. **[Proved + 1‑D numerics]** (Proposition 4.3.)
   - Small dimension. **[Proved]**: every harmonic cubic, hence every square-free multilinear cubic, in $\le11$ variables. This includes the Fano-plane cubic. **[Proved + 1‑D numerics]**: all of $\mathcal H_3^{(n)}$ for $n\le 7$. (Proposition 4.4.)
   - The complete cubics $\binom N3^{-1/2}e_3(Z_1,\dots,Z_N)$ satisfy $(C_3)$ for every $N$. **[Proved + 1‑D numerics]** (Corollary 4.4′.)
   - The Gaussian limit (3.1) is a strict local maximizer, in every direction, for every $d\ge2$. **[Proved]** (Proposition 4.5.)
4. **A non-sharp but unconditional gap.** For all $n$, $\mathrm{OPT}(\Pi_2^{(n)})\le 4/5$ and $\mathrm{OPT}(\Pi_3^{(n)})\le 0.79328$. Hence $\liminf \mathrm{SDP}/\mathrm{OPT}\ge 1.25$ for $d=2$ and $\ge 1.2606$ for $d=3$. **[Proved + finite check]** (Proposition 4.6.)
5. **Still open:** only $d=3$.
   - $(C_3)$ for general cubics. In multilinear form, the open case is cubics in $N\ge 12$ variables with no exact transversal and correlation $<0.84$ with every $\psi_3(\langle v,X\rangle)$.
   - For $d=2$ the one remaining caveat is the standard one for computer-assisted proofs: `certify_d2.py` uses double precision with a slack, not interval arithmetic (see Theorem 4.7, "Floating point").

   See §6. Several "complete proofs" in the Gemini logs are wrong or incomplete; see §7.

---

## 1. Setting

- $X\sim\gamma_n$ is a standard Gaussian vector in $\mathbb R^n$.
- $\mathrm{He}_k$ are the probabilists' Hermite polynomials, and $\psi_k=\mathrm{He}_k/\sqrt{k!}$. In particular $h_2:=\psi_2=(x^2-1)/\sqrt2$ and $h_3:=\psi_3=(x^3-3x)/\sqrt6$.
- $\mathcal H_d^{(n)}=\operatorname{span}\{\psi_\alpha:|\alpha|=d\}$ is the $d$-th chaos, and $\Pi_d^{(n)}$ is the orthogonal projection onto it.
- $W_d(f)=\|\Pi_d f\|_2^2$.

For a bounded operator $Q$ on $L^2(\gamma_n)$ the paper defines
$$\mathrm{OPT}(Q)=\sup_{f,g:\mathbb R^n\to\{\pm1\}}\langle f,Qg\rangle,\qquad \mathrm{SDP}(Q)=\sup_{k}\sup_{\substack{u,v:\mathbb R^n\to S^{k-1}}}\textstyle\sum_{j}\langle u_j,Qv_j\rangle .$$
For $Q\succeq0$ one may take $f=g$ and $u=v$ by Cauchy–Schwarz. The little Grothendieck inequality gives $\mathrm{SDP}(Q)\le\frac\pi2\mathrm{OPT}(Q)$.

**Example 3.1 (paper).** For $d>1$, $f=g=\operatorname{sign}\big(n^{-1/2}\sum_i \mathrm{He}_d(X_i)\big)$ are asserted to be asymptotic optimizers of $\mathrm{OPT}(\Pi_d)$, so that $\mathrm{SDP}(\Pi_d)/\mathrm{OPT}(\Pi_d)=\frac\pi2-o_n(1)$. The paper gives no proof and no computation. Its only $\sqrt{2/\pi}$ bound (Appendix B.1) is for degree 1.

Put $\displaystyle \kappa_d^{(n)}:=\sup\{\mathbb E|F|:\ F\in\mathcal H_d^{(n)},\ \|F\|_2=1\}$.

---

## 2. The reduction (all $d\ge1$)

**Theorem 1. [Proved]** For every $d\ge1$ and $n\ge1$:

- (a) $\displaystyle 1-\frac{v_d}{n}\le \mathrm{SDP}(\Pi_d^{(n)})\le 1$, where $v_d:=\operatorname{Var}(\psi_d(G)^2)$. For example $v_2=14$ and $v_3=92$.
- (b) $\mathrm{OPT}(\Pi_d^{(n)})=\sup_{f}W_d(f)=(\kappa_d^{(n)})^2$, the function $n\mapsto\kappa^{(n)}_d$ is nondecreasing, and $\liminf_n \mathrm{OPT}(\Pi_d^{(n)})\ge 2/\pi$.
- (c) $\displaystyle\lim_{n\to\infty}\frac{\mathrm{SDP}(\Pi_d^{(n)})}{\mathrm{OPT}(\Pi_d^{(n)})}=\frac\pi2$ if and only if $(C_d)$ holds, i.e. $\kappa_d^{(n)}\le\sqrt{2/\pi}$ for all $n$.
- (d) If $(C_d)$ fails at some $n_0$, then $\limsup_n \mathrm{SDP}/\mathrm{OPT}\le 1/(\kappa_d^{(n_0)})^2<\pi/2$.

*Proof.*

(a) The upper bound holds because $\Pi_d\otimes I$ is a contraction and $\mathbb E\|u(X)\|^2=1$.

For the lower bound let $w(X)=n^{-1/2}(\psi_d(X_1),\dots,\psi_d(X_n))$, $R=\|w\|$, and $u=w/R$. Each coordinate of $w$ lies in $\mathcal H_d$, so $(\Pi_d\otimes I)w=w$. Also $\mathbb E R^2=1$. Therefore
$$\|(\Pi_d\otimes I)u\|_2\ \ge\ \langle u,w\rangle=\mathbb E R .$$
Since $(1-R)^2\le(1-R^2)^2$, we get $2(1-\mathbb ER)=\mathbb E(1-R)^2\le\operatorname{Var}(R^2)=v_d/n$. Hence $\mathrm{SDP}\ge(\mathbb ER)^2\ge 1-v_d/n$.

(b) For a projection, $\langle f,\Pi g\rangle\le\|\Pi f\|\|\Pi g\|$. Next,
$$\|\Pi_d f\|=\sup_{F\in\mathcal H_d,\ \|F\|=1}\mathbb E[fF],$$
and the supremum over $f$ of $\mathbb E[fF]$ is $\mathbb E|F|$, attained at $f=\operatorname{sign}F$.

The inclusion $\mathcal H_d^{(n)}\subset\mathcal H_d^{(n+1)}$ is isometric, which gives monotonicity.

For the lower bound take $S_n=n^{-1/2}\sum_i\psi_d(X_i)$. Then $\|S_n\|_2=1$ and $S_n\Rightarrow N(0,1)$ by the CLT. Since the second moments are bounded, $\{|S_n|\}$ is uniformly integrable, so $\mathbb E|S_n|\to\sqrt{2/\pi}$. The witness $f=\operatorname{sign}S_n$ is exactly (3.1).

(c, d) These follow from (a) and (b) together with monotonicity. $\square$

**Theorem 2 (equivalent forms of $(C_d)$). [Proved, except (iv), which cites the paper]** Each of the following is equivalent to $(C_d)$:

- (i) *Boolean form:* $W_d(f)\le 2/\pi$ for every $n$ and every $f:\mathbb R^n\to\{\pm1\}$.
- (ii) *Multilinear form:* $\mathbb E\big|\sum_{|S|=d}c_S Z^S\big|\le\sqrt{2/\pi}\,(\sum_S c_S^2)^{1/2}$ for every $N$ and every square-free homogeneous degree-$d$ polynomial, where $Z\sim\gamma_N$ and $Z^S=\prod_{i\in S}Z_i$.
- (iii) *Spherical form:* $\displaystyle\limsup_{N\to\infty}\ \sup_{Y\in\mathcal Y_d(S^{N-1})}\frac{\|Y\|_{L^1(\sigma)}}{\|Y\|_{L^2(\sigma)}}\le\sqrt{2/\pi}$, where $\mathcal Y_d$ is the space of degree-$d$ spherical harmonics.
- (iv) *Graded form:* $\mathbb E|p|\le\sqrt{2/\pi}\|p\|_2$ for every $p$ in the graded closure $\overline{\mathcal H}_d$ (paper §3.1, Thm 3.2). Moreover $\sup_n\kappa_d^{(n)}$ is attained there.

*Proof.*

(i) This is Theorem 1(b).

(ii) Multilinear forms belong to $\mathcal H_d^{(N)}$, which gives one direction.

For the converse use **Gaussian splitting**. Write $X_i=K^{-1/2}\sum_{r\le K}Z_{i,r}$ with the $Z_{i,r}$ i.i.d. $N(0,1)$. Then $X\sim\gamma_n$, so $F(X)$, viewed as a polynomial in $Z$, has the same law as before. The Hermite addition formula gives
$$\psi_k\Big(K^{-1/2}\sum_r Z_r\Big)=K^{-k/2}\sum_{|\beta|=k}\sqrt{k!/\beta!}\,\prod_r\psi_{\beta_r}(Z_r).$$
Its multilinear part (all $\beta_r\le1$) carries mass $\prod_{j<k}(1-j/K)\ge1-k^2/(2K)$. Taking products over $i$, which use disjoint blocks, and using orthogonality, we get $F(X)=H_K(Z)+E_K(Z)$. Here $H_K$ is multilinear of degree $d$, $\|H_K\|_2\le\|F\|_2$, and $\|E_K\|_2^2\le\frac{d^2}{2K}\|F\|_2^2$. Therefore
$$\mathbb E|F|\le\mathbb E|H_K|+\|E_K\|_2\le\sqrt{2/\pi}\,\|F\|_2+O(K^{-1/2}).$$

(iii) Square-free forms are harmonic and homogeneous. Harmonic homogeneous $p$ of degree $d$ lie in $\mathcal H_d$, since $Lp=\Delta p-x\cdot\nabla p=-dp$. In polar coordinates $p(X)=R^dY(\Theta)$ with $R$ independent of $\Theta$, so
$$\frac{\|p\|_{L^1(\gamma_N)}}{\|p\|_{L^2(\gamma_N)}}=a_{N,d}\,\frac{\|Y\|_{L^1(\sigma)}}{\|Y\|_{L^2(\sigma)}},\qquad a_{N,d}=\frac{\mathbb E R^d}{\sqrt{\mathbb E R^{2d}}}\uparrow1 .$$
The Gaussian ratio over harmonic forms is nondecreasing in $N$ (by embedding). So by (ii), $(C_d)$ is equivalent to the limit statement in (iii).

(iv) Theorem 3.2 of the paper (Herry–Malicet–Poly; Jones) says that the laws of unit-norm elements of $\overline{\mathcal H}_d$ form exactly the weak closure of the laws of unit-norm $F\in\bigcup_n\mathcal H_d^{(n)}$, with convergence of moments. Hypercontractivity gives $\mathbb E F^4\le 9^d$, so $\mathbb E|\cdot|$ is continuous along these limits. $\square$

**Literature.**

- $(C_d)$ is the case $p=1$, $q=2$ of **Janson's extremal problem** (*Gaussian Hilbert Spaces*, Remark 7.37). The problem asks to maximize $\|X\|_p/\|X\|_2$ over the $d$-th chaos. Janson proved that Wick powers are extremal for even $p\ge4$.
- **Larsson-Cohn** (thesis, Paper II, Theorem 2; *Ark. Mat.* 40 (2002)) showed that Wick powers are *not* extremal for $0<p<2$ and large $d$. His argument compares against exactly the CLT sums (3.1).
- Neither source proves that the Gaussian is extremal at $p=1$. We found no proof anywhere, and the Gemini searches found none either.
- For $d=2$, the subfamily of spectra in which every eigenvalue has even multiplicity consists exactly of the sums $\sum_j x_j(\mathcal E_j-1)$ of centred exponentials. **Brazitikos–Tang–Tkocz** (arXiv:2602.03058, Remark 4) *conjecture* a two-branch formula for $\sup\|\sum x_j(\mathcal E_j-1)\|_p$ on $-1<p<2$, with a phase transition at $p_0\approx-0.565$. The second branch is presumably the Gaussian value; I could not read that branch in the extracted text. If so, its $p=1$ case is a **published open special case of $(C_2)$**.

---

## 3. An exact $\pi/2$ gap with pure degree-$d$ projections

**Lemma 3.1 (Gaussian mixtures). [Proved]** Split the coordinates as $Z=(Z_A,Z_B)$, and let $F=\sum_{a\in A}Z_a\,G_a(Z_B)$ with $G_a\in L^2$. Then
$$\mathbb E|F|=\sqrt{2/\pi}\ \mathbb E\Big(\sum_aG_a^2\Big)^{1/2}\le\sqrt{2/\pi}\,\|F\|_2 ,$$
with equality if and only if $\sum_aG_a^2$ is a.s. constant. *Proof.* Conditionally on $Z_B$, $F$ is $N(0,\sum_aG_a^2)$; then apply Jensen. $\square$

**Theorem 3. [Proved]** Let $d\ge2$. Let $Q_{m,n}:=\Pi_1^{(m)}\otimes\Pi_{d-1}^{(n)}$ act on $L^2(\gamma_m\otimes\gamma_n)=L^2(\gamma_{m+n})$. This is a Hermite projection onto a subspace of $\mathcal H_d^{(m+n)}$. Then:

- $\mathrm{OPT}(Q_{m,n})\le 2/\pi$ for all $m,n$;
- $\mathrm{SDP}(Q_{m,n})\ge(1-\tfrac1m)(1-\tfrac{v_{d-1}}n)$;
- consequently $\mathrm{SDP}/\mathrm{OPT}\to\pi/2$ as $m,n\to\infty$.

The same holds for $(\Pi_1^{(n)})^{\otimes d}$.

*Proof.*

*OPT.* Every $F$ in the range has the form $\sum_iX_iG_i(Y)$. Apply Lemma 3.1 and Theorem 1(b).

*SDP.* Take $u=\frac{X}{|X|}\otimes\frac{w(Y)}{|w(Y)|}$ with $w$ as in Theorem 1(a), at level $d-1$. The norm factorizes:
$$\|(Q\otimes I)u\|^2=\|(\Pi_1\otimes I)\tfrac X{|X|}\|^2\cdot\|(\Pi_{d-1}\otimes I)\tfrac w{|w|}\|^2 .$$
The first factor equals $(\mathbb E|X|)^2/m\ge1-1/m$, by the Poincaré inequality $\operatorname{Var}|X|\le1$. The second factor is $\ge1-v_{d-1}/n$, as in Theorem 1(a).

For $(\Pi_1)^{\otimes d}$, condition on all blocks but one. $\square$

*(For $d=3$ this is Gemini's "tripartite" Theorem 3 and its "$(1,2)$-split" theorem, with cleaner constants.)*

---

## 4. Partial results toward $(C_2)$ and $(C_3)$

### 4.1 Gaussian-mixture families

**Corollary 4.1. [Proved]** $(C_d)$ holds for:

- (a) multilinear forms whose hypergraph has an **exact transversal**, i.e. a set $A$ with $|e\cap A|=1$ for every edge $e$, after any orthogonal change of variables;
- (b) for $d=2$: every quadratic form whose spectrum is symmetric ($\lambda\leftrightarrow-\lambda$ with equal multiplicities). Equivalently these are the bilinear forms $\langle Z_A,MZ_B\rangle$, using $\lambda(X^2-Y^2)=2\lambda\,\frac{X+Y}{\sqrt2}\frac{X-Y}{\sqrt2}$;
- (c) for $d=3$: the graded subspace $cZ^{(3)}+\sum_{ij}B_{ij}Z^{(1)}_iZ^{(2)}_j$, with equality only when $B=0$;
- (d) for $d=3$: two-dimensional harmonic cubics. Indeed
  $$\tfrac1{\sqrt{24}}\,\mathrm{Re}\big((X_1+iX_2)^3\big)\ \overset d=\ \sqrt{\tfrac92V_1V_2}\;G,\qquad V_1\sim\Gamma(\tfrac13),\ V_2\sim\Gamma(\tfrac23),\ G\sim N(0,1)\ \text{independent}.$$
  *Proof.* In polar form $|\cos3\Theta|\overset d=|\cos\Theta|$. Gauss's triplication formula then gives
  $$\frac{\mathbb E|Q|^{2s}}{\mathbb E|G|^{2s}}=\frac{3^{-s}\Gamma(3s+1)}{2^s\Gamma(s+1)}=\mathbb E\big[(\tfrac92V_1V_2)^s\big]$$
  on the strip $\operatorname{Re}s>-\frac13$. This determines the law of $\log|Q|$, and $Q$ is symmetric. The same argument with the $k$-fold multiplication formula shows that $\mathrm{Re}((X_1+iX_2)^k)$ is a Gaussian mixture for every $k$. (Found in attachment C; Monte-Carlo check of $\mathbb E|\cdot|^p$, $p\in[0.5,3]$, agrees.)
- (e) independent sums of any of the above.

**Lemma 4.1′ (closure under Gaussian mixtures). [Proved]** Let $\mathcal C$ be a family on which $(C_d)$ holds, and suppose $\mathcal C$ is closed under adding an independent multiple of a Gaussian. Then $(C_d)$ also holds for $U+W$, where $U\in\mathcal C$ and $W=\sigma G$ is any independent Gaussian mixture.

*Proof.* Condition on $\sigma$, apply $(C_d)$ to $U+\sigma G$, then use Jensen on $\sqrt{\|U\|^2+\sigma^2}$. $\square$

This means any family that someday gets proved can be enlarged for free by independent blocks of types (a)–(d).

Corollary 4.1 does **not** cover $\sum_j\lambda_jh_2(X_j)$ with skewed signs, $h_3(X_1)$-type terms, or generic cubics. That is where the difficulty lies.

### 4.2 $d=2$, small influence (new)

Every unit $F\in\mathcal H_2^{(n)}$ is, after a rotation,
$$F_\lambda=\sum_j\lambda_jh_2(X_j),\qquad \sum_j\lambda_j^2=1 .$$
Put $M=\|\lambda\|_\infty$ and $L_4=\sum_j\lambda_j^4$.

**Theorem 4.2. [Proved]** If $\|\lambda\|_\infty\le 1/8$, then
$$\mathbb E|F_\lambda|\le\sqrt{2/\pi}-0.0177\,L_4<\sqrt{2/\pi}.$$

*Proof.*

**Step 0 (Fourier formula).** From $|x|=\frac2\pi\int_0^\infty(1-\cos tx)t^{-2}dt$ we get $\sqrt{2/\pi}-\mathbb E|F|=\frac2\pi I$, where
$$I=\int_0^\infty\big(\operatorname{Re}\varphi(t)-e^{-t^2/2}\big)t^{-2}\,dt .$$
The characteristic function is
$$\varphi(t)=\prod_je^{-i\lambda_jt/\sqrt2}(1-i\sqrt2\lambda_jt)^{-1/2}=R\,e^{i\Theta},$$
$$R=\prod_j(1+2\lambda_j^2t^2)^{-1/4},\qquad \Theta=\tfrac12\sum_j\big(\arctan(\sqrt2\lambda_jt)-\sqrt2\lambda_jt\big).$$

We use four elementary facts.

- **(a)** $\cos\theta\ge1-\theta^2/2$, so $\operatorname{Re}\varphi\ge R-\tfrac12R\Theta^2$.
- **(b)** $x-\log(1+x)\ge\frac{x^2}{2(1+2x/3)}$ for $x\ge0$. Indeed, the derivative of the difference is $\frac{x^3}{9(1+x)(1+2x/3)^2}\ge0$. Hence
  $$\log R+\tfrac{t^2}2\ \ge\ \sum_j\frac{\lambda_j^4t^4}{2(1+\frac43\lambda_j^2t^2)}\ \ge\ \frac{L_4t^4}{2(1+\frac43M^2t^2)}=:y(t),$$
  and therefore $R-e^{-t^2/2}\ge e^{-t^2/2}y$.
- **(c)** Since $\log(1+x)/x$ is decreasing, $R\le U_M(t):=(1+2M^2t^2)^{-1/(4M^2)}$. Moreover $U_M(t)$ is nondecreasing in $M$.
- **(d)** $0\le x-\arctan x\le x^3/3$ for $x\ge0$. Together with $\sum|\lambda_j|^3\le\sqrt{L_4}$ (Cauchy–Schwarz) this gives $\Theta^2\le\frac29L_4t^6$.

**Combining.** From (a)–(d),
$$I\ \ge\ L_4\big[A(M)-B(M)\big],$$
where
$$A(M)=\int_0^\infty\frac{t^2e^{-t^2/2}}{2(1+\frac43M^2t^2)}dt\ \ge\ \tfrac12\sqrt{\pi/2}\,(1-4M^2),$$
$$B(M)=\tfrac19\int_0^\infty t^4U_M(t)\,dt=\tfrac1{18}(2M^2)^{-5/2}\,\mathrm B\big(\tfrac52,\tfrac1{4M^2}-\tfrac52\big),$$
the latter by the substitution $s=2M^2t^2$.

For $M\le1/8$ we have $A\ge0.58749$ and $B\le B(1/8)=\tfrac1{18}32^{5/2}\mathrm B(\tfrac52,\tfrac{27}2)=0.55959$. Hence $I\ge0.0279\,L_4$. $\square$

*Remarks.*

- The asymptotic optimizers have $\lambda_j=n^{-1/2}$, so $M\to0$; Theorem 4.2 covers all of their neighbourhood.
- The true deficit to leading order is $\sqrt{2/\pi}\,(\kappa_4-\kappa_3^2)/24=\sqrt{2/\pi}\,(12L_4-8L_3^2)/24\ge\sqrt{2/\pi}\,L_4/6$, so the constant above is far from sharp.
- The obstruction to pushing $M$ higher is the crude phase bound (d), together with the polynomial tail of $U_M$.

### 4.3 High correlation with a one-dimensional Hermite polynomial (new; any $d$)

**Proposition 4.3. [Proved + 1‑D numerics]** Let $F\in\mathcal H_d^{(n)}$ with $\|F\|_2=1$. Let $v\in S^{n-1}$ and $a:=|\mathbb E[F\psi_d(\langle v,X\rangle)]|$. Then for every Borel set $S\subset\mathbb R$,
$$\mathbb E|F|\le a\,\alpha_S+\sqrt{1-a^2\beta_S},\qquad \alpha_S=\mathbb E[|\psi_d|1_S],\ \ \beta_S=\mathbb E[\psi_d^21_S].$$

With $S=\{|\psi_d|>\kappa\}$:

| $d$ | $\kappa$ | $\alpha_S$ | $\beta_S$ | range of $a$ | bound on $\mathbb E\lvert F\rvert$ |
|---|---|---|---|---|---|
| 2 | 1.16 | 0.24485 | 0.73446 | $a\ge0.966$ | $\le0.79745$ |
| 3 | 1.60 | 0.11254 | 0.66953 | $a\ge0.874$ | $\le0.79733$ |

Both bounds are $<\sqrt{2/\pi}=0.79788$.

For $d=2$, choosing $v=e_j$ gives $a\ge\|\lambda\|_\infty$. So $(C_2)$ holds whenever $\|\lambda\|_\infty\ge0.966$.

*Proof.* Take $v=e_1$ and $a\ge0$ (replace $F$ by $-F$ if necessary). Expand $F=\sum_{k\le d}\psi_k(X_1)G_k(X')$ with $G_k\in\mathcal H_{d-k}(X')$, so that $G_d=a$. For $k<d$ we have $\mathbb EG_k=0$. Hence $F-a\psi_d(X_1)\perp L^2(\sigma(X_1))$, and
$$\mathbb E|F|\le a\alpha_S+\|a\psi_d1_{S^c}+(F-a\psi_d)\|_2=a\alpha_S+\sqrt{a^2(1-\beta_S)+1-a^2}.\qquad\square$$

No stationarity in $v$ is needed. This simplifies Gemini's "rank-1 correlation" theorem, which used the cutoff $|x|=2$ and needed $a\ge0.91$.

**Proposition 4.3, part (b): conditional Cauchy–Schwarz. [Proved + 1‑D numerics]** Keep the expansion above, with $W_1=X_1$. Conditionally on $X_1=x$, the pieces $G_k(X')$ lie in distinct chaoses of $X'$, so
$$\mathbb E|F|\le\mathbb E_{x}\Big(a^2\psi_d(x)^2+\sum_{k<d}\psi_k(x)^2\|G_k\|_2^2\Big)^{1/2}.$$
Maximize over $\sum_{k<d}\|G_k\|^2=1-a^2$. The worst case is $G_0$, an independent remainder. This gives:

| $d$ | worst-case bound at $a$ | threshold for $(C_d)$ |
|---|---|---|
| 3 | $0.7951$ at $a=0.84$ | $a\ge0.84$ |
| 2 | $0.7836$ at $a=0.92$ | $a\ge0.91$ |

The $d=3$ case is the "(7.1)" bound in Gemini's latest turn, without its lossy AM–GM step.

**Proposition 4.3′ ($d=2$, large largest eigenvalue). [Proved + 1‑D numerics]** Let $M=\|\lambda\|_\infty$ and $l^2=1-M^2$. Every $t$ satisfies:

- $R\ge(1+2M^2t^2)^{-1/4}e^{-l^2t^2/2}$;
- $R\le(1+2M^2t^2)^{-1/4}(1+2l^2t^2)^{-1/4}$;
- $|\Theta|\le\Theta^+:=\tfrac12(\sqrt2Mt-\arctan\sqrt2Mt)+\tfrac3{13}l^2t^2$, using $\max_x(x-\arctan x)/x^2<\tfrac3{13}$.

Hence $\operatorname{Re}\varphi$ is bounded below by:

- $R_{\rm low}\cos\Theta^+$ where $\Theta^+\le\pi/2$;
- $R_{\rm up}\cos(\min\{\Theta^+,\pi\})$ elsewhere.

This gives a one-parameter family of one-dimensional integrals. The lower bound for $I$ is positive for all $M\in[0.75,1]$ (52-point grid; e.g. $+0.0024$ at $0.75$, $+0.025$ at $0.8$, $+0.14$ at $1$), and negative at $M=0.745$. (Gemini's Theorem 7.1(3); the inequalities are checked and the integral is recomputed here.) *Superseded by Theorem 4.7, which covers $M\in[1/8,1]$ with a rigorous quadrature.*

### 4.3″ $d=2$, the remaining range (new): completion of $(C_2)$

**Theorem 4.7. [Proved, computer-assisted]** For every unit $\lambda$ with $M:=\|\lambda\|_\infty\in[\tfrac18,1]$ we have $I(\lambda)>0$, i.e. $\mathbb E|F_\lambda|<\sqrt{2/\pi}$.

Together with Theorem 4.2 this gives, for every $n$ and every $0\ne F\in\mathcal H_2^{(n)}$,
$$\mathbb E|F|<\sqrt{2/\pi}\,\|F\|_2 .$$
Hence, by Theorem 1, $\mathrm{SDP}(\Pi_2^{(n)})/\mathrm{OPT}(\Pi_2^{(n)})\to\pi/2$.

**Notation.** Order the spectrum so that $|\lambda_1|=M$, and put:

- $S_2:=\sum_{j\ge2}\lambda_j^2=1-M^2$ and $S_4:=\sum_{j\ge2}\lambda_j^4\in[0,\min(M^2,S_2)S_2]$;
- $m:=\max_{j\ge2}|\lambda_j|\le\min(M,\sqrt{S_2},S_4^{1/4})$;
- $X_j=2\lambda_j^2t^2$, $x_j=\sqrt2|\lambda_j|t$, and $g(x)=x-\arctan x$, which is odd and increasing.

Then $R=R_1R_{\rm rest}$ with $R_1=(1+2M^2t^2)^{-1/4}$, and $|\Theta|\le\frac12g(\sqrt2Mt)+\frac12\sum_{j\ge2}g(x_j)$.

**Envelopes.** All hold for every $t>0$.

- **(E1)** $R_{\rm rest}\ge\exp\!\big(-\tfrac12S_2t^2+c(2m^2t^2)\,S_4t^4\big)$, where $c(X)=\frac{X-\log(1+X)}{X^2}=\int_0^1\frac{u\,du}{1+Xu}$ is decreasing. Indeed $\log(1+X_j)=X_j-c(X_j)X_j^2\le X_j-c(2m^2t^2)X_j^2$.
- **(E2)** Two upper bounds on $R_{\rm rest}$:
  - For every $X_0>0$, $R_{\rm rest}\le\exp\!\big(\tfrac14(2\alpha S_2t^2+4\beta S_4t^4)\big)$. Here $p(X)=\alpha X+\beta X^2$ is the parabola through $0$ that is tangent to $-\log(1+X)$ at $X_0$: $\alpha=-\frac{2\log(1+X_0)}{X_0}+\frac1{1+X_0}$ and $\beta=\frac{(1+X_0)\log(1+X_0)-X_0}{X_0^2(1+X_0)}$.
    *Proof that $p\ge-\log(1+X)$ on $[0,\infty)$:* $h:=p+\log(1+X)$ has $h(0)=h(X_0)=h'(X_0)=0$, and $h''=2\beta-(1+X)^{-2}$ is increasing. Also $h'(0)=1+\alpha>0$, which is $\sinh u>u$ with $u=\log(1+X_0)$. So $h'$ vanishes exactly at some $\xi\in(0,X_0)$ and at $X_0$, and therefore $h\ge0$.
  - $R_{\rm rest}\le(1+2m^2t^2)^{-S_2/(4m^2)}$, because $\log(1+X)/X$ is decreasing.
- **(E3)** $\frac12\sum_{j\ge2}g(x_j)\le\min\big\{S_2t^2\sqrt{\hat\psi(\min(2t^2S_4/S_2,\,2m^2t^2))},\ S_2t^2q^*(\sqrt2mt),\ \frac{\sqrt2}3\sqrt{S_2S_4}\,t^3\big\}$. The three bounds come from:
  - *First bound.* $g(x)\le\frac{x^3}{3+x^2}$: the derivative of the difference is $\frac{4x^4}{(3+x^2)^2(1+x^2)}\ge0$. Next, $\frac{x}{3+x^2}=\sqrt{\psi(x^2)}$ with $\psi(w)=\frac{w}{(3+w)^2}$. Define $\hat\psi=\psi$ on $[0,3]$ and $\hat\psi=\frac1{12}$ on $[3,\infty)$; it is concave and nondecreasing, since $\psi''=\frac{2(w-6)}{(3+w)^4}$ and $\psi'(3)=0$. With weights $p_j=x_j^2/\sum x_i^2$, Cauchy–Schwarz and then Jensen give $\sum p_j\sqrt{\psi(x_j^2)}\le\sqrt{\hat\psi(\sum p_jx_j^2)}$. Finally $\sum p_jx_j^2=2t^2S_4/S_2\le2m^2t^2$.
  - *Second bound.* $q^*(s):=\sup_{0<x\le s}g(x)/x^2$.
  - *Third bound.* $g(x)\le x^3/3$ and $\sum_{j\ge2}|\lambda_j|^3\le\sqrt{S_2S_4}$.
- **(E4) Monotonicity in $t$.** $R(t)$ is decreasing, and the phase bound $\Theta^+(t)$ assembled from (E3) and $\frac12g(\sqrt2Mt)$ is nondecreasing. So on any $[a,b]$, with $\gamma_b:=\cos\min(\Theta^+(b),\pi)$:
  - $\operatorname{Re}\varphi(t)\ge R_{\rm low}(b)\,\gamma_b$ if $\gamma_b\ge0$;
  - $\operatorname{Re}\varphi(t)\ge R_{\rm up}(a)\,\gamma_b$ if $\gamma_b<0$.

  Then $\int_a^b\operatorname{Re}\varphi\,t^{-2}dt$ is at least that constant times $(\frac1a-\frac1b)$.
- **(E5) Near $0$.** $\operatorname{Re}\varphi\ge1-\frac{t^2}2+\frac{t^4}{24}\mathbb EF^4-\frac{t^6}{720}\mathbb EF^6$. Here:
  - the cumulants are $\kappa_k=2^{k/2-1}(k-1)!\,L_k$, so $\mathbb EF^4=3+12L_4$ and $\mathbb EF^6=15+180L_4+80L_3^2+480L_6$;
  - $L_3^2\le L_4$;
  - $e^{-x}\le\sum_{k\le4}(-x)^k/k!$.

  Together these give
  $$\int_0^{0.3}\frac{\operatorname{Re}\varphi-e^{-t^2/2}}{t^2}dt\ \ge\ \frac{0.3^3}{6}L_4-\Big(\frac{13}{36}L_4+\frac23L_6\Big)\frac{0.3^5}5-\frac{0.3^7}{2688}.$$
- **(E6) Gaussian term and tail.** $\int_{0.3}^\infty e^{-t^2/2}t^{-2}dt=e^{-0.045}/0.3-\sqrt{\pi/2}\,\mathrm{erfc}(0.3/\sqrt2)$ exactly. For $t\ge T=10^5$, $\operatorname{Re}\varphi\ge-R_1(t)$, so that piece contributes at least $-(1+2M^2T^2)^{-1/4}/T$.

**Cells.** Every envelope is monotone in each of $M$, $S_2$, $S_4$, $m$ separately. So on a cell $[M_a,M_b]\times[S_a,S_b]$ one substitutes the worst endpoint of each parameter:

- $M_b$ in the lower bound for $R_1$ and in the phase term;
- $M_a$ in the upper bound for $R_1$;
- $1-M_a^2$ for $S_2$ in (E1) and in the phase bounds;
- $1-M_b^2$ for $S_2$ in (E2);
- $S_a$ in (E1) and $S_b$ elsewhere;
- $\bar m=\min(M_b,\sqrt{1-M_a^2},S_b^{1/4})$ for $m$.

**Certificate.** `certify_d2.py` partitions
$$D=\{(M,S_4):\tfrac18\le M\le1,\ 0\le S_4\le\min(M^2,1-M^2)(1-M^2)\}$$
into 5,059 cells, using bisection in $M$ and geometric bisection in $S_4$.

For each cell it evaluates the lower bound (E5) + $\sum$(E4) − (E6) − tail on a geometric grid: ratio $1+\delta$ on $[0.3,12]$ and $1+10\delta$ on $[12,10^5]$, with $\delta=10^{-4}$, refined to $10^{-5}$ for 24 cells. **All 5,059 bounds are positive; the smallest is $8.6\cdot10^{-8}$.** Run time is about 2 minutes on 2 cores.

**Floating point.** Each bound is a sum of about $1.3\cdot10^5$ (or $1.3\cdot10^6$) terms of total absolute size $\le4$, using pairwise summation and elementary functions accurate to about 1 ulp. The accumulated rounding is $\lesssim10^{-13}$, covered by a slack of $10^{-9}$ subtracted from every bound. Two further safeguards:

- the Gaussian constant in (E6) is computed to 30 digits (mpmath);
- $q^*$ is read at the next node of a $10^{-3}$-grid and increased by $10^{-7}$, which exceeds $h^2\max|q''|/8$.

Re-running the same bounds in interval arithmetic (e.g. with Arb/python-flint) would be mechanical; this has not been done.

*Sanity check.* `certify_d2.py --soundness` compares the cell bound with the true integral at 40 random spectra. The bound is below the true value in every case; the smallest difference is $0.018$.

*Relation to Gemini's Theorem 7.1.*

- (E2) is its "Hermite interpolation at $(0,X_0,X_0)$", the first bound in (E3) is its Jensen bound, and $\bar m$ is its $M_2$. All three are re-proved above.
- Its certification script (8,934 boxes, "$I/L_4\ge1.21\cdot10^{-4}$") was not available. The certificate here is independent and reaches the same conclusion.
- Its small-$M$ part ($M\le\frac1{10}$) is replaced by Theorem 4.2 ($M\le\frac18$).

### 4.4 Small dimension

**Proposition 4.4.**

- **(a) [Proved]** For $n=1$:
  $$\mathbb E|h_2|=2e^{-1/2}/\sqrt\pi=0.6844,\qquad \mathbb E|h_3|=(1+4e^{-3/2})/\sqrt{3\pi}=0.6165 .$$
  Both are $<\sqrt{2/\pi}$, so $(3.1)$ needs a diverging number of variables.
- **(b) [Proved]** For $d=3$, every harmonic cubic on $\mathbb R^N$ with $N\le11$ satisfies $(C_3)$. The proof restricts to uniformly random great circles; a cubic restricted to a circle lies in $\operatorname{span}\{\cos\alpha,\sin\alpha,\cos3\alpha,\sin3\alpha\}$, whose sharp $L^1/L^2$ constant is $C=4\sqrt5/(3\pi)=0.94902$, attained by $\sin\alpha+\frac13\sin3\alpha$. (This is Gemini's Lemma 1.1. I checked its key algebraic identity and the value numerically.) Then $a_{N,3}C\le a_{11,3}C=\sqrt{2/\pi}\cdot\frac{4096}{63\sqrt{429}\,\pi}=0.79723<\sqrt{2/\pi}$, using $\pi>3.14$. At $N=12$ the bound is $0.8073$ and the method stops.
- **(c) [Proved + 1‑D numerics]** For $d=3$ and $n\le6$, all of $\mathcal H_3^{(n)}$ satisfies $(C_3)$. Here $\mathcal H_3^{(n)}=\{\langle a,x\rangle(|x|^2-n-2)\}\oplus\{\text{harmonic cubics}\}$. In polar coordinates $P=A(\Theta)e_1(R)+B(\Theta)e_3(R)$, and $\mathbb E_\Theta[AB]=0$. Conditioning on $\Theta$ gives $\mathbb E|P|\le K_n\|P\|_2$ with $K_n=\max_\phi\mathbb E_R|\cos\phi\,e_1+\sin\phi\,e_3|$:

  | $n$ | 2 | 3 | 4 | 5 | 6 | 7 |
  |---|---|---|---|---|---|---|
  | $K_n$ | 0.6950 | 0.7266 | 0.7440 | 0.7629 | **0.7882** | 0.8086 |

  The method fails at $n=7$.

  **Better: circle slicing at fixed radius.** On a fixed sphere $|x|=R$, the restriction of $P$ to a great circle lies again in $\operatorname{span}\{\cos\alpha,\sin\alpha,\cos3\alpha,\sin3\alpha\}$. Hence
  $$\mathbb E|P|\le C\,\max_{p\in[0,1]}\mathbb E_R\sqrt{p\,e_1^2+(1-p)e_3^2},\qquad C=\tfrac{4\sqrt5}{3\pi}.$$
  This is Gemini's Theorem 6.2(2). Values:

  | $n$ | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
  |---|---|---|---|---|---|---|---|
  | bound | 0.6718 | 0.7134 | 0.7414 | 0.7623 | 0.7790 | **0.7927** | 0.8042 |

  So all of $\mathcal H_3^{(n)}$ with $n\le7$ satisfies $(C_3)$. Gemini gives a closed-form version for $n\le4$. Its claim of "$n\le9$ by joint optimization" is not reproduced here.

- **Consequence of (b).** Every square-free multilinear cubic is harmonic. So $(C_3)$ holds for **all** multilinear cubics in $N\le11$ variables, e.g. the Fano-plane cubic. By Theorem 2(ii), a counterexample to $(C_3)$ would need a multilinear cubic in $N\ge12$ variables. (Observation from Gemini's latest turn.)

**Corollary 4.4′ (complete cubics, all $N$). [Proved + 1‑D numerics]** Let $P_N=\binom N3^{-1/2}e_3(Z)$ and $W_1=N^{-1/2}\sum_iZ_i$. Newton's identity gives an orthogonal decomposition
$$P_N=a_Nh_3(W_1)-b_NW_1S(W')+c_NR(W'),\qquad a_N^2=\tfrac{(N-1)(N-2)}{N^2},\ \ b_N^2=\tfrac{3(N-2)}{N^2},\ \ c_N^2=\tfrac4{N^2}.$$
Here $S\in\mathcal H_2(W')$, $R\in\mathcal H_3(W')$, and both are unit. There is no $h_2(W_1)\times$linear term, by $S_N$-symmetry. Then Proposition 4.3(b) gives
$$\mathbb E|P_N|\le\mathbb E\sqrt{a_N^2h_3^2+b_N^2X^2+c_N^2}.$$
The right side is $0.7665$ at $N=7$, $0.7108$ at $N=12$, and $0.6188$ at $N=1000$, tending to $\mathbb E|h_3|$. (Computed at $N=7,9,11,12,13,20,50,1000$; the weights are monotone in $N$.) The case $N\le11$ is also covered by the harmonic-cubic result. Gemini's version adds a lossy AM–GM step and gets $0.9896\sqrt{2/\pi}$ at $N=12$.

*(A great-circle argument does **not** work for $d=2$: quadratics restricted to a circle contain a constant mode, so the constant is 1.)*

### 4.5 Local optimality of the Gaussian limit (all $d\ge2$)

**Proposition 4.5. [Proved]** Let $H\in\mathcal H_d^{(m)}$ with $\|H\|_2=1$, and let $Z\sim N(0,1)$ be independent. Then
$$\mathbb E\big|\sqrt{1-\varepsilon^2}Z+\varepsilon H\big|=\sqrt{2/\pi}\Big(1-\frac{\kappa_4(H)}{24}\varepsilon^4\Big)+O(\varepsilon^6),$$
and $\kappa_4(H)=\mathbb EH^4-3>0$.

In finitary form: replace $Z$ by the CLT sum (3.1) on fresh coordinates and let $n\to\infty$. So every perturbation of the asymptotic optimizer by an independent chaos element strictly decreases $\mathbb E|\cdot|$.

*Proof.* Let $m(\mu)=\mathbb E|\mu+Z|$. Then $m''=2\phi$, so
$$m(\mu)=\sqrt{2/\pi}\,(1+\mu^2/2-\mu^4/24)+O(\mu^6)$$
uniformly, because $m^{(6)}$ is bounded. Now condition on $H$ and expand; $\mathbb EH^6<\infty$ by hypercontractivity.

$\kappa_4>0$ is Nourdin–Peccati, Corollary 5.2.11. $\square$

### 4.6 Universal non-sharp bounds (circle rotations)

**Proposition 4.6. [Proved + finite check]** For all $n$ and all $f:\mathbb R^n\to[-1,1]$:
$$W_2(f)\le\tfrac45,\qquad W_3(f)\le\tfrac45,\qquad W_3(f)\le\frac{4}{7(\cos^3\frac\pi7-\cos^3\frac{3\pi}7)}=0.79328 .$$
Hence
$$\liminf_n\mathrm{SDP}(\Pi_2^{(n)})/\mathrm{OPT}(\Pi_2^{(n)})\ge1.25,\qquad \liminf_n\mathrm{SDP}(\Pi_3^{(n)})/\mathrm{OPT}(\Pi_3^{(n)})\ge1.2606 .$$

*Proof.* Let $U,V$ be independent with law $\gamma_n$, and put $x_r=\cos\frac{\pi r}N\,U+\sin\frac{\pi r}N\,V$. Then $x_{r+N}=-x_r$, and $\operatorname{corr}(x_r,x_{r+k})=c_k:=\cos\frac{\pi k}N$. Mehler's formula gives $\mathbb E[g(x_r)g(x_{r+k})]=\sum_mc_k^mW_m(g)$.

*$d=3$.* Use the odd part $g$ of $f$: it takes values in $[-1,1]$, $W_3(g)=W_3(f)$, and $\sigma_{r+N}=-\sigma_r$. With $N=5$,
$$\mathbb E\Big[\tfrac15\sum_{r<5}(\sigma_r\sigma_{r+1}-\sigma_r\sigma_{r+2})\Big]=\sum_{m\text{ odd}}(c_1^m-c_2^m)W_m\ \ge\ \tfrac12W_3,$$
since $c_1-c_2=c_1^3-c_2^3=\frac12$ and every coefficient is positive. The left side is multilinear in $(\sigma_0,\dots,\sigma_4)$, so it is maximized at a vertex of the cube. A brute-force check over the $2^5$ vertices gives maximum $2/5$. For $N=7$, use weights $\pm(c_1^3-c_3^3)^{-1}$ on $k=1,3$.

*$d=2$.* Use the even part of $f$: now $\sigma$ is $6$-periodic. With $N=6$ and weights $w_2=-0.8$, $w_5=1.6$ the coefficients are
$$\mathrm{coef}_m=1.6(3/4)^{m/2}-0.8(1/4)^{m/2}>0,\qquad \mathrm{coef}_0=0.8,\quad \mathrm{coef}_2=1 .$$
The objective is $\frac{0.8}6\sum_{r\in\mathbb Z_6}(2\sigma_r\sigma_{r+1}-\sigma_r\sigma_{r+2})$, whose maximum over vertices is $0.8$. $\square$

*(The $d=3$ bounds are Gemini's; the $d=2$ certificate was found by a small LP. Among $N\le12$, the LP optimum is $0.8$ for $d=2$ and $0.79328$ for $d=3$.)*

---

## 5. Reformulations of the missing step (tools, all [Proved])

**5.1 Heat-flow identity.** Let $F\in\mathcal H_d^{(n)}$ be unit, and set $\Gamma_F=\|\nabla F\|^2/d$, so that $\mathbb E\Gamma_F=1$. Interpolating $\rho F+\sqrt{1-\rho^2}Z$ and integrating by parts (with $-LF=dF$) gives
$$\sqrt{2/\pi}-\mathbb E|F|=\sqrt{2/\pi}\int_0^\infty\frac{s\,ds}{(1+s^2)^{3/2}}\ \mathcal D_F(s),$$
$$\mathcal D_F(s):=\mathbb E\big[e^{-s^2F^2/2}(1-\Gamma_F)\big]=\mathbb E\,e^{-s^2F^2/2}-\mathbb E\Big[F\!\int_0^F\!e^{-s^2u^2/2}du\Big].$$
The second expression follows from Stein's identity $\mathbb E[Fh(F)]=\mathbb E[h'(F)\Gamma_F]$.

So **$(\heartsuit)$: $\mathcal D_F(s)\ge0$ for all $s$** suffices for $(C_d)$. Note that $(\heartsuit)$ depends only on the *law* of $F$.

Two cautions, both from Gemini:

- **Moment constraints are not enough for $(C_d)$.** The law $\pm\sqrt{3/7}$ w.p. $\frac{14}{15}$, $\pm3$ w.p. $\frac1{15}$ has variance 1 and $\kappa_4>0$, yet $\mathbb E|U|=0.811>\sqrt{2/\pi}$.
- **No local decomposition.** $(\heartsuit)$ does not decompose coordinate by coordinate, and one-at-a-time Lindeberg replacement of a $h_3$ term can increase $\mathbb E|\cdot|$ ("Obstructions A, B").

*Status of $(\heartsuit)$ on exact-transversal cubics.* For $P=\sum_{i\in A}Z_iQ_i(Z_B)$, integrate out $Z_A$; a Sherman–Morrison term then cancels a carré-du-champ term. The result is
$$\mathbb E\big[(3\|P\|_2^2-\|\nabla P\|^2)e^{-P^2/2}\big]=-3\operatorname{Cov}\big(V,(1+V)^{-1/2}\big)>0,\qquad V=\sum_{i\in A}Q_i^2 .$$
Applied to $sP$ for every $s>0$, this says $(\heartsuit)$ itself, not merely $(C_3)$, holds there (attachment C, Theorem 2). I checked this computation by hand but not numerically.

**5.2 Zero-density route.** If $U\in\overline{\mathcal H}_d$ maximizes $\mathbb E|U|$ at unit norm, mix in an independent grade-$d$ Gaussian. Using $\int(\mathbb E|w+G|-|w|)\,dw=1$ this gives
$$\mathbb E|\sqrt{1-\varepsilon^2}U+\varepsilon G|=\mathbb E|U|+\varepsilon^2\big(p_U(0)-\tfrac12\mathbb E|U|\big)+o(\varepsilon^2),$$
for $p_U$ continuous at $0$. Hence $2p_U(0)\le\mathbb E|U|$. Equality holds for $N(0,1)$. Since a maximizer exists (Theorem 2(iv)):

> **Sufficient condition (Z):** every unit, non-Gaussian $p\in\overline{\mathcal H}_d$ has $2p_p(0)>\mathbb E|p|$.
>
> Then the only maximizers are Gaussian, which gives $(C_d)$.

Equivalent forms:

- In Nourdin–Peccati notation (Theorem 10.1.1, $2p(0)g_p(0)=\mathbb E|p|$), (Z) reads $g_p(0)=\mathbb E[\Gamma_p\mid p=0]<1$.
- Geometrically, for a polynomial $F$ with nodal set $\Sigma$ and nodal probability measure $\nu_F\propto\|\nabla F\|\phi\,d\mathcal H^{N-1}|_\Sigma$, one has $g_F(0)=\big(d\,\mathbb E_{\nu_F}\|\nabla F\|^{-2}\big)^{-1}$. This uses $\mathbb E|F|=\frac2d\int_\Sigma\|\nabla F\|\phi$.

Examples:

- For $h_3$: $2p(0)=0.7968>0.6165$.
- $Z_1Z_2Z_3$ has $p(0)=\infty$.

**5.2′ Doubling near the Gaussian.** Take $F=\sqrt{1-\varepsilon^2}Z+\varepsilon P$ with $P$ independent. Then
$$\mathbb E|(F+F')/\sqrt2|-\mathbb E|F|=\sqrt{2/\pi}\,\kappa_4(P)\varepsilon^4/48+O(\varepsilon^6)>0,$$
because doubling halves $\kappa_4$. So the doubling route (§5.4) is consistent near the optimizer. A maximizer must satisfy $\mathbb E|(F+F')/\sqrt2|\le\mathbb E|F|$, since $(F+F')/\sqrt2$ is again a unit element of $\overline{\mathcal H}_d$.

**5.3 Unimodal replacement.** For $W$ symmetric unimodal and independent, $\mathbb E|ah_3(X)+W|\le\mathbb E|aZ+W|$.

*Proof.* Use Khintchine's mixture of uniforms together with the identity
$$\mathbb E|y+W_M|=\tfrac M2+\tfrac{y^2}{2M}-\tfrac{(|y|-M)_+^2}{2M}\qquad(W_M\sim\mathrm{Unif}[-M,M]).$$
This reduces the claim to $D(M)=\mathbb E(|h_3|-M)_+^2-\mathbb E(|Z|-M)_+^2\ge0$. We have $D(0)=D(\infty)=0$ and $D'=2D_0$, where $D_0(w)=\mathbb E(|Z|-w)_+-\mathbb E(|h_3|-w)_+$. So it suffices that $D_0$ changes sign exactly once, from $+$ to $-$ (it does so at $w\approx1.405$).

**Single crossing. [Proved + one 1‑D integral]** This follows Gemini's sketch; the details are filled in here. Put $y_0=\sqrt{2/3}=\max_{|x|\le\sqrt3}|h_3|$.

- **On $[0,y_0]$.**
  - $D_0'(0)=0$, and $D_0''=2\phi-f_{|h_3|}$.
  - For $w\in(0,y_0)$ the six preimages of $\pm w$ are $\pm x_1,\pm x_2,\pm x_3$ with $x_1\in(0,1)$, $x_2\in(1,\sqrt3)$, $x_3>\sqrt3$. Differentiating $f_{|h_3|}(w)=2\sum_i\phi(x_i)/|h_3'(x_i)|$ gives
    $$\tfrac{3}{\sqrt6}f_{|h_3|}'=\frac{x_1(1+x_1^2)\phi(x_1)}{(1-x_1^2)^3}+g_*(x_2)-g_*(x_3),\qquad g_*(x)=\frac{x(x^2+1)\phi(x)}{(x^2-1)^3}.$$
  - $g_*$ is decreasing on $(1,\infty)$, because $(\log g_*)'=\frac1x+\frac{2x}{x^2+1}-x-\frac{6x}{x^2-1}<0$ there. So $f_{|h_3|}$ is increasing on $(0,y_0)$, hence $D_0''$ is decreasing and $D_0'$ is concave.
  - With $D_0'(0)=0$, $D_0$ first increases and then decreases on $[0,y_0]$, so $D_0\ge\min(D_0(0),D_0(y_0))$ there.
  - $D_0(0)=\sqrt{2/\pi}-\frac{1+4e^{-3/2}}{\sqrt{3\pi}}=0.181>0$, and $D_0(y_0)=0.138>0$ (a 1-D integral).
- **On $[y_0,\infty)$.**
  - Here $\{|h_3|>w\}=\{|x|>x_+(w)\}$, where $x_+(w)>2$ solves $h_3(x)=w$. So $D_0'(w)=2[\bar\Phi(x_+(w))-\bar\Phi(w)]$, which is negative iff $x_+(w)>w$, i.e. iff $w^2<3+\sqrt6$.
  - So $D_0$ decreases on $[y_0,\sqrt{3+\sqrt6}]$, increases afterwards, and tends to $0$. Hence it has exactly one zero, and it is negative after that zero. $\square$

(Numerically: one sign change of $D_0$ on $[0,6]$, near $1.41$.)

Consequence: $a\,h_3(X_1)+G$ satisfies $(C_3)$ whenever $G$ is an independent Gaussian mixture.

**5.4 Doubling.** If $\mathbb E|(F+F')/\sqrt2|\ge\mathbb E|F|$ for every $F\in\mathcal H_d$ (with $F'$ an independent copy), then iterating and applying the CLT gives $(C_d)$. This is false for general laws (random signs) and **open** for chaos.

---

## 6. Gaps

**Gap 1 ($d=2$). [Closed: Theorems 4.2 and 4.7]** This was the range $\tfrac18<\|\lambda\|_\infty<\tfrac34$. What remains is optional strengthening:

- Re-run `certify_d2.py` in interval arithmetic. The inequalities are already proved; only the floating-point evaluation would change.
- A computer-free proof. A natural route is the Schur-type statement "equal positive weights are optimal for each $n$". In all our searches (random spectra, plus Nelder–Mead for $n=3,5,8$) the largest value at fixed $n$ was the equal-weight one, $\mathbb E|\chi^2_n-n|/\sqrt{2n}=\frac{4(n/2)^{n/2}e^{-n/2}}{\Gamma(n/2)\sqrt{2n}}\uparrow\sqrt{2/\pi}$; for example $0.7358,\ 0.7553,\ 0.7815$ at $n=2,3,8$.

**Gap 2 ($d=3$). [Open]** Prove $(C_3)$ for multilinear cubics $\sum_{|e|=3}c_eZ^e$ that are not covered by §4.1–4.4. These are cubics:

- in $N\ge12$ variables (multilinear cubics in $\le11$ variables are harmonic, hence covered by Proposition 4.4(b));
- whose hypergraph has no exact transversal;
- with $\max_v\mathbb E[F\,h_3(\langle v,X\rangle)]<0.84$;
- that are not complete cubics.

Equivalently, by Theorem 2(iii): degree-3 spherical harmonics in high dimension have $L^1/L^2\le\sqrt{2/\pi}$ asymptotically. Sufficient routes:

- $(\heartsuit)$ (§5.1);
- the zero-density condition (Z) (§5.2);
- doubling (§5.4).

Route (Z) is the weakest requirement: a one-point inequality on the density. Gemini's numerical ascent over a 62-parameter graded family found $g_p(0)\le0.87$; I did not reproduce this. Gemini's martingale/isoperimetric functional $\mathcal R(P)$ bounds $\|P\|_1$ but is not proved $\le\sqrt{2/\pi}$.

**Gap 3 ($d=3$ subfamilies claimed but not established).**

- (i) Diagonal sums $\sum\lambda_ih_3(X_i)$ (Gemini's "Open Problem 1"). Numerically true: the maximum over random weights was $0.743$; equal weights increase to $\sqrt{2/\pi}$ from below (at $n=200$, $0.7846$).
  - The newest Gemini write-up ("End-to-End Exposition", §5) proves it by induction on $n$. Its **high-influence step** ($\|\lambda\|_\infty\ge0.72$) is **correct**: I re-derived the chord/convexity bound, and it gives $0.9980\sqrt{2/\pi}$ at $c=0.72$.
  - The **rest** relies on characteristic-function envelopes plus about 15 hand-entered numerical constants (Riemann sums $B(\xi)$, tail bound $U(\xi)$), which I have not re-derived. The envelopes I spot-checked hold, except one: the stated "$(-\psi_3)_+\le\frac14$ for all $u$" is **false** (the true maximum is $0.354$, at $u\approx4.75$). It does not appear to be used in the final estimates.
  - Status: **plausible, computer-assisted, not fully verified.**
  - Re-checked against the latest exposition (§5):
    - it still writes $\mathbb Eh_3^6=54{,}123$; the correct value is $53{,}745$. The slip is harmless, since a larger sixth moment only weakens the lower bound for $\psi_3$;
    - it still lists the false $(-\psi_3)_+\le\frac14$;
    - the envelopes it actually uses hold numerically: $|\psi_3|\le\min(\frac38,u^{-1/2})$ on $[2.4,40]$ (worst ratio $0.945$); $\psi_3>e^{-u^2/2}$ on $(0,\frac94]$; $\psi_3>0$ on $[0,2.55]$; $\psi_3\le e^{-0.09u^2}$ on $[0,2.4]$; $(-\psi_3)_+\le0.073<0.152$ on $[2.55,3.2]$.
    - The hand-entered sums $B(\xi)$ and $U(\xi)$ remain unchecked.
- (ii) The single-coordinate graded family $a(X^3-3X)+bXY+cZ$. Numerically true: on a grid of about 5,000 points of the $(p,q)$ triangle, the maximum of $\mathbb E|F|/\sqrt{2/\pi}$ is $1$, attained only at the pure Gaussian corner. Gemini's hand proof is long; I did not re-check it line by line.
- (iii) 4-partite cubics. These reduce, by conditioning on two parts, to the inequality $\mathbb E|\langle u,X\rangle+\langle v,Y\rangle+\langle X,MY\rangle|\le\sqrt{2/\pi}\|\cdot\|_2$. That inequality is unproved; Gemini's attempt treats only $\operatorname{rank}M=1$ and leaves one case hand-waved.

Note that none of these subfamilies would close Gap 2.

---

## 7. Audit of the Gemini logs

| Claim | Verdict |
|---|---|
| "Complete resolution of Open Problem 1" (diagonal $h_3$ sums), chain log, turn starting "To finish Open Problem 1 completely" | **Wrong lemma.** It uses $\psi_3(u):=\mathbb E\cos(u\,h_3(X))\ge-11/50$ for all $u$. In fact $\psi_3(4.75)\approx-0.354$. |
| Same claim, "rigorous" log version | Uses $\lvert\psi_3\rvert\le0.36$ on $[2.7,9]$, which holds with a margin of only $0.006$, plus a 128-point grid "certificate". Not a proof as written; not re-verified. |
| "Complete Unconditional Resolution of Open Problem 3 ($d=2$)" | **Overclaim.** It argues only small $M$ (with algebra corrected mid-stream) and $M\ge0.35$ (numerically). The conclusion is now proved here: Theorems 4.2 and 4.7. |
| "Theorem 2.1: $\mathcal D(sF)>0$ for all $s\le1/9$" (attachment B) | **Overclaim.** The derivation gives only $s<\frac{2\sqrt2}{7^6}\sqrt{\kappa_4(F)}$, which is useless. The identity $\mathbb E(3-\lVert\nabla F\rVert^2)^2\le2\kappa_4$ is correct (Nourdin–Peccati, Lemma 5.2.4). |
| 4-partite / $K_4^{(3)}$ theorem (attachment B) | **Incomplete** (see Gap 3(iii)). The $K_N^{(3)}\to h_3(W_1)$ observation is fine. |
| Universal bound $\lVert P\rVert_1\le1-\frac1{5^9-2}$ | Correct but superseded by Proposition 4.6. |
| Circle-rotation bounds $0.8$ and $0.79328$ for $\Pi_3$ | **Correct** (re-verified). |
| Harmonic cubics up to $n=11$; $K_n$ up to $n=6$; $C_{\rm trig,3}=4\sqrt5/(3\pi)$ | **Correct** (re-verified). |
| Graded compactification; fourth-order local optimality; Karlin–Novikoff single crossing | Correct. The single crossing is now proved (§5.3). |
| "Lemma 2.5" of the paper (odd reduction) | It is **Lemma 2.6** in v1. |
| "Paired $d=2$ chaos via $\varphi\ge e^{-t^2/2}$" | Correct; it is the symmetric-spectrum case of Corollary 4.1(b). |
| Attachment C: 2-D harmonic cubic is a Gaussian mixture (Theorem B); closure principle (Theorem C); $(\heartsuit)$ on exact transversals; nodal formula for $g_F(0)$ | **Correct** (included above). Theorem C's examples "diagonal sums (Turn 9)" and "single-coordinate family (Turn 5)" inherit the unproved status of those families. |
| Attachment C: "Theorem A — analytic proof of hinge domination for $h_3$" | It was analytic only *given* the single crossing of $D_0$; that step is now proved in §5.3. |
| Attachment C: identity for $\mathcal R(P)$ (Theorem D) | It contained a sign error, which Gemini caught and fixed. The corrected identity is not used here. |
| "End-to-End Exposition" (latest), §§1–2, 4, 6.1 | Consistent with this note. Theorem 4.1(4b): its telescoping proof replaces Gaussian-mixture blocks against a background containing the non-unimodal $h_3$ term, so the proof is invalid as written. The statement is still true (condition on the mixture scale, then apply §5.3 and Lemma 4.1′). |
| "End-to-End Exposition", §3 (single-coordinate family) | Statement numerically true; the long rational proof was not re-checked. |
| "End-to-End Exposition", §5 (diagonal sums) | See Gap 3(i). One stated envelope is false. |
| "End-to-End Exposition", §6.2 ($\mathcal H_3^{(n)}$, $n\le7$) | **Correct** for $n\le7$ (re-computed: $0.7927$ at $n=7$). The "$n\le9$" claim is not reproduced. |
| "End-to-End Exposition", §7 ($d=2$: $M\le\frac1{10}$, $M\ge\frac34$) | Small-$M$: weaker than Theorem 4.2 ($M\le\frac18$). Large-$M$: re-checked numerically (Proposition 4.3′). |
| Latest turn: "counterexample to $(\heartsuit)$ for $h_3$ at large $s$" | Retracted within the same turn. My numerics agree: $\mathbb E[(1-\Gamma)e^{-s^2h_3^2/2}]>0$ for all tested $s\le200$. |
| Latest turn: score–Hessian identity for $\mathcal D(P)$ | An exact integration-by-parts rewrite. It gives positivity of one term when the influence matrix is isotropic, but does not control the Hessian term. |
| Latest turn: multilinear cubics with $N\le11$ via harmonicity; $K_N^{(3)}$ for all $N$ | **Correct** (included as Proposition 4.4 and Corollary 4.4′). |
| Master summary / later expositions, Theorem 7.1: "complete unconditional solution for $d=2$" | **Conclusion correct; proof as written not checkable**, because `certify_d2_complete.py` is not available. Its envelope inequalities are correct; they are re-proved in Theorem 4.7, (E2)–(E3). The concavity it cites, $\hat\psi''=2(w-6)/(3+w)^4$, is for $\hat\psi$ itself; that suffices with Cauchy–Schwarz before Jensen. Its unimodal-$f_1$ splitting and $[16,\infty)$ tail were not re-checked, because Theorem 4.7 does not use them. **$d=2$ is now closed independently** (Theorems 4.2 + 4.7). |
| Same, §4.1(2) / Theorem 4.1(2): hinge-square domination for $h_3$ via single crossing | **Correct**, after filling in details: the monotonicity of $f_{\lvert h_3\rvert}$ via $g_*$, and $D_0'(0)=0$. Now §5.3, upgraded to [Proved + one 1-D integral]. |
| Same, §6: $C_{\rm trig,3}\approx0.9490026$ | Numerical typo: $4\sqrt5/(3\pi)=0.9490167$. The proofs use the exact value, so nothing breaks. |
| Same, §6.2: "2D Stiefel slicing extends to $n\le9$", "$\le0.7942$ up to $n=9$" | **Not reproduced.** My slice bound is $0.8042$ at $n=8$ (above $\sqrt{2/\pi}$). |
| Same, Theorem 4.2(2): $2.33a^2+1.09b^2>1.95$ suffices | **Correct.** The exact condition is $2.3354a^2+1.0938b^2>1.9455$, and the stated one implies it. Weaker than Proposition 4.3(b). |
| Same, §8 warning: a 4-point law with unit variance, $\kappa_4>0$ and hypercontractive moments has $\mathbb E\lvert U\rvert=0.8110>\sqrt{2/\pi}$ | **Correct** (arithmetic re-checked). It is a useful remark: moment information alone cannot prove $(C_3)$. |
| Same, Theorem 8.3(3): score–Hessian identity | **Correct.** The integration by parts is re-derived: $-L^{-1}=\frac12,\frac14$ on chaoses 2 and 4, and $\nabla\lVert\nabla P\rVert^2=2H\nabla P$; the isotropic specialization also checks. The expression of $G_2$ via $M$ was not checked. It does not settle the sign (Gap 2). |
| Same, Theorem 8.2 (martingale–isoperimetric identity), Theorem 8.1(3) (Bernstein weight) | Not checked; not used here. |

---

## 8. Reproducibility

`verify_example31.py` (numpy/scipy, about 1–2 minutes) recomputes the following:

- the $n=1$ values;
- the circle certificates, by brute force;
- the constants in Proposition 4.3 and Theorem 4.2;
- $C_{\rm trig,3}$ and $a_{11,3}C$;
- $K_2,\dots,K_7$;
- sample $d=2$ values;
- the slice bounds for $n\le8$;
- the conditional Cauchy–Schwarz thresholds;
- the complete cubics $K_N^{(3)}$;
- the $d=2$ envelope integral on $M\in[0.75,1]$.

`certify_d2.py` (numpy/scipy/mpmath; about 2 minutes on 2 cores, using all cores) is the computer-assisted part of Theorem 4.7. It prints one line per $M$-strip and ends with `CERTIFIED`. Run it with `--soundness` to compare the bounds with true integrals at random spectra.

## References

- S. Heilman, C. Jones, G. Malavolta, arXiv:2610.10477 (Example 3.1, Lemma 2.6, Theorem 3.2).
- S. Janson, *Gaussian Hilbert Spaces*, CUP 1997, Remark 7.37.
- L. Larsson-Cohn, *Lp-norms of Hermite polynomials and an extremal problem on Wiener chaos*, Ark. Mat. 40 (2002); thesis (Uppsala), Paper II, Theorem 2.
- I. Nourdin, G. Peccati, *Normal Approximations with Malliavin Calculus*, CUP 2012: Lemma 5.2.4, Corollary 5.2.11, Theorem 2.7.2 (hypercontractivity), Theorem 10.1.1 (density formula).
- R. Herry, D. Malicet, G. Poly, arXiv:2412.06749; C. Jones, "Regularity lemma for Gaussian polynomials" (graded closure).
- S. Brazitikos, C. Tang, T. Tkocz, *Moments of sums of exponentials, beyond CHS*, arXiv:2602.03058, Remark 4.
