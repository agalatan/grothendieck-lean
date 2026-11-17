# A fourth-moment bound for trilinear forms on three spheres

Issue #507 (parent #458), 17 November 2026. The Wick bound is by claude-b9ee. The spherical projection,
sharp case, and law estimates are by codex-6d92. See [row 4.30](../../STATUS.md) and [replay code](../../code/kappa-three-cluster-2026-11-17/).

## Statement

Let x, y, w be independent standard complex Gaussian vectors in ℂ^c (E xx\* = I), c ≥ 2. Let R be a nonzero polynomial
in the span of the 3c³ monomials of #507 (one variable from each cluster, exactly one conjugated). Write
R = A(x̄, y, w) + B(x, ȳ, w) + C(x, y, w̄), with
A(x̄, y, w) = Σ A_abd x̄_a y_b w_d, B(x, ȳ, w) = Σ B_abd x_a ȳ_b w_d, C(x, y, w̄) = Σ C_abd x_a y_b w̄_d
for complex tensors A, B, C. Put α = ‖A‖², β = ‖B‖², γ = ‖C‖² (sums of squared moduli of the coefficients) and
κ(R) = (c/(c + 1))³ E|R|⁴/(E|R|²)², which is E G² for G = |R(ω)|²/E|R(ω)|² with ω uniform on the product of the three
unit spheres.

## Spherical projection and the law of G (P)

There are independent nonnegative random variables $B_c$ and $H$ such that

$$
G\ \overset{\rm law}= B_c H,\qquad B_c\sim c\,\mathrm{Beta}(1,c-1),\qquad
\mathbb EH=1,\qquad H\le3c^2 .
$$

In particular

$$
\boxed{\ \kappa(R)\ \ge\ \kappa_0(c):=\frac{2c}{c+1}\ >\ 2-\frac2c\ } .
$$

This gives $C=2$ in task 1. The same lower bound at $c=1$ follows from Jensen.
The scaled-Beta factorization and lower bound apply to any separately real-linear complex-valued form on
the product of the spheres.

**Proof.** Fix the two unit vectors $\omega_y,\omega_w$ and let $L$ be the real $2\times 2c$ matrix for
$R(\omega_x,\omega_y,\omega_w)$ as a function of $\omega_x$. Denote the eigenvalues of $LL^\top$ by
$\lambda_1\ge\lambda_2\ge0$. After orthogonal changes of basis, the conditional squared modulus has law
$\lambda_1 U_1^2+\lambda_2 U_2^2$, where $U$ is uniform on $S^{2c-1}$.
The squared length $Z=U_1^2+U_2^2$ has law $\mathrm{Beta}(1,c-1)$ by taking the ratio of independent
Gaussian squared lengths in the first two and remaining $2c-2$ real coordinates. The angle
$\theta$ of $(U_1,U_2)$ is uniform and independent of $Z$. With $m=\mathbb E|R(\omega)|^2$,
the normalized conditional law is therefore $cZ$ times

$$
H=\frac{\lambda_1+\lambda_2+(\lambda_1-\lambda_2)\cos(2\theta)}{2cm}.
$$

We can sample $Z$ independently of the conditioned vectors and of the angle. The conditional
expectation of $|R|^2$ is $(\lambda_1+\lambda_2)/(2c)$, which gives $\mathbb EH=1$.
The sphere second moment is $m=(\alpha+\beta+\gamma)/c^3$ by the three distinct phase characters
and $\mathbb E\,\omega_i\omega_i^*=I/c$ in each cluster. On unit vectors,
$|R|\le\sqrt\alpha+\sqrt\beta+\sqrt\gamma$, hence $\lambda_1\le3(\alpha+\beta+\gamma)$ and
$H\le \lambda_1/(cm)\le3c^2$.

Now $\mathbb E B_c^2=2c/(c+1)$ and $\mathbb E H^2\ge1$. Equality in the lower bound holds
exactly when $\lambda_1=\lambda_2=cm$ almost surely, since equality forces $H=1$ almost surely
and the independent angle then forces $\lambda_1-\lambda_2=0$. Equivalently the slice must have
constant conditional variance and equal squared singular values. ∎

### Sharp cases at c = 2 and c = 4 (P)

At $c=2$ the example in row 4.30 (iii) attains the bound. For fixed unit $x,y$ put
$S=\bar x_1y_1+\bar x_2y_2$ and $D=x_1y_2-x_2y_1$. The identity
$|S|^2+|D|^2=\|x\|^2\|y\|^2=1$ makes $w_2S+\bar w_1D$ a unit complex projection of
$(w_2,\bar w_1)$, which is uniform on the sphere of $\mathbb C^2$. Its normalized squared modulus
has law $2\,\mathrm{Beta}(1,1)$. Thus $\min_R\kappa(R)=4/3$ at $c=2$.

At $c=4$ write $y=(a,u)$ and $w=(b,v)$ with $a,b\in\mathbb C$ and $u,v\in\mathbb C^3$.
Use the complex bilinear dot and cross products and set

$$
F_0=ab+u\cdot v,\qquad F=\bar a\,v-b\bar u+u\times\bar v,\qquad
R_4=\bar x_0 F_0+\sum_{j=1}^3 x_j F_j .
$$

Every monomial has one conjugated factor. For the Hermitian inner product the vector $u\times\bar v$
is orthogonal to $v$ and $\bar u$. Its squared norm is $\|u\|^2\|v\|^2-|u\cdot v|^2$ by the
two-by-two minor identity. The remaining cross term in $\|\bar a\,v-b\bar u\|^2$ is
$-2\operatorname{Re}(ab\,\overline{u\cdot v})$, which cancels the cross term in $|F_0|^2$. Thus

$$
|F_0|^2+\|F\|^2=(|a|^2+\|u\|^2)(|b|^2+\|v\|^2).
$$

For unit $y,w$ this is a unit complex projection of $(\bar x_0,x_1,x_2,x_3)$, so $G$ has
law $4\,\mathrm{Beta}(1,3)$ and $\min_R\kappa(R)=8/5$. The optimal constant in task 1 is
therefore in $[8/5,2]$, since at $c=4$ the example forces $C\ge4(2-8/5)=8/5$.

### Consequences of the factorization (P)

- $B_c$ is below $G$ in convex order, by conditioning on $B_c$ and using $\mathbb EH=1$.
  The nonzero form has $H>0$ almost surely. Indeed, a nonzero entry of $L$ is a nonzero polynomial in the
  two Gaussian vectors and hence vanishes on a null set. Dividing by the two independent positive radii
  preserves this assertion on the spheres. When $L$ has rank one, only finitely many angles yield $H=0$.
  Thus the law of $G$ has a nonincreasing density, obtained by mixing the densities
  $(c-1)(1-t/(cH))^{c-2}/(cH)$ on $0<t<cH$.
- $\mathbb EH^2=\kappa/\kappa_0(c)$ gives a coupling cost
  $\mathbb E|B_c H-B_c|^2=\kappa-\kappa_0(c)$. In particular $W_2(G,B_c)\le\sqrt{\kappa-\kappa_0(c)}$,
  where $W_2$ is the quadratic Wasserstein distance. For any twice differentiable test $f$ with
  bounded second derivative, Taylor's formula and the vanishing conditional linear term give
  $|\mathbb E f(G)-\mathbb E f(B_c)|\le\|f''\|_\infty(\kappa-\kappa_0(c))/2$.
- $\mathbb E B_c^3=6c^2/((c+1)(c+2))$. Cauchy–Schwarz in the form
  $\mathbb E H^3\ge(\mathbb EH^2)^2$ implies
  $\mathbb E G^3\ge 3(c+1)\kappa^2/(2(c+2))$.

For moment relaxations one can work with the scale law on $[0,3c^2]$, with first moment 1 and second moment
$\kappa/\kappa_0(c)$. Given $r$ continuous observables $f_i(G)$, any such law can be replaced by one on
at most $r+3$ scales with the same moments and expectations. The map
$h\mapsto (h,h^2,\mathbb E f_1(B_c h),\ldots,\mathbb E f_r(B_c h))$ is continuous on the compact scale
interval, so this follows from Carathéodory's theorem in $\mathbb R^{r+2}$.

## Comparison with the moment-matched Gamma law (P)

Let $Y$ have Gamma shape $s=1/(\kappa-1)$ and scale $1/s$. For every such cubic,

$$
W_2^2(G,Y) \le
\begin{cases}
2(\kappa-1)/c,&\kappa\le2,\\
2(\kappa-2)+2/c,&\kappa\ge2 .
\end{cases}
$$

**Proof.** Draw $E\sim\mathrm{Exp}(1)$ independently of $H$ and use
$B_c=c(1-e^{-E/(c-1)})$, which has the required scaled Beta law. Then
$\mathbb E(B_c E)=c(1-((c-1)/c)^2)=2-1/c$.
If $s\ge1$, draw an independent $V\sim\mathrm{Gamma}(s-1,1)$, with $V=0$ at $s=1$, and set
$Y=(E+V)/s$. Independence of $H$ gives $\mathbb E(GY)=1+(1-1/c)/s$.
If $0<s<1$, draw $Q\sim\mathrm{Beta}(s,1-s)$ independently of $E,H$ and put $Y=QE/s$.
The Beta–Gamma identity gives the required law and $\mathbb E(Y\mid E)=E$, so $\mathbb E(GY)=2-1/c$.
In both cases, $\mathbb E|G-Y|^2=2\kappa-2\mathbb E(GY)$ gives the claimed upper bound. ∎

### Two actual cubic laws at the same κ (P)

Take $c=3$ and the diagonal form $R=\sum_i\sqrt{p_i}\,\bar x_i y_i w_i$, where $\sum_i p_i=1$.
Each Gaussian product has $2j$-th absolute moment $(j!)^3$. Orthogonality of distinct coordinate phases
in $R^j$ gives Gaussian moment $(j!)^2\sum_{k_1+\cdots+k_c=j}\prod_i k_i!\,p_i^{k_i}$.
Dividing by the independent radial moments gives the spherical normalized moments. In particular

$$
\kappa=\left(\frac{c}{c+1}\right)^3\left(2+6\sum_i p_i^2\right),\qquad
\mathbb E G^3=\left(\frac{c^2}{(c+1)(c+2)}\right)^3
\left(6+54\sum_i p_i^2+156\sum_i p_i^3\right).
$$

The weights $(4/9,4/9,1/9)$ and $(2/9,2/9,5/9)$ both give $\kappa=15/8$. Their third moments are
$5067/1000$ and $5301/1000$, respectively, on opposite sides of the matched Gamma moment $165/32$.

## Complementary Wick bound (P)

This bound retains the relative energies of the three types.

    E|R|⁴ ≥ 2(α + β + γ)² + (2/c)[(α + β)² + (β + γ)² + (γ + α)² + α² + β² + γ²],   E|R|² = α + β + γ.

Hence E|R|⁴/(E|R|²)² ≥ 2 + 10/(3c), and

    κ(R) ≥ k_Wick(c) := 2c²(3c + 5)/(3(c + 1)³) > 2 − 8/(3c).

Indeed $3c(c+1)^3(k_{\rm Wick}(c)-2+8/(3c))=6c^2+18c+8$.
The spherical floor $\kappa_0(c)$ exceeds $k_{\rm Wick}(c)$ by $2c(c+3)/(3(c+1)^3)$.
The energy-sensitive Wick estimate can be stronger, for instance for a single conjugation type.

## Proof

1. **Charges.** The Gaussian law is invariant under (x, y, w) ↦ (e^{iθ₁}x, e^{iθ₂}y, e^{iθ₃}w). Under it A, B and C carry
   the characters (−1, 1, 1), (1, −1, 1) and (1, 1, −1), so they are orthogonal and E|R|² = α + β + γ (Wick). The six
   terms of R² = A² + B² + C² + 2AB + 2AC + 2BC carry the pairwise distinct characters (−2, 2, 2), (2, −2, 2),
   (2, 2, −2), (0, 0, 2), (0, 2, 0), (2, 0, 0). Hence
   E|R|⁴ = E|R²|² = E|A|⁴ + E|B|⁴ + E|C|⁴ + 4E|AB|² + 4E|AC|² + 4E|BC|².
2. **One form.** For one trilinear form T, Wick's formula pairs, in each cluster, the two factors of T with the two of
   T̄, straight or crossed. All straight and all crossed give ‖T‖⁴ each. One cluster k crossed, or the other two, gives
   ‖P_T^k‖²_F, where P_T^k is the c × c Gram matrix of the k-th flattening, e.g. (P_T^w)_dd' = Σ_ab T_abd T̄_abd'. So
   E|T|⁴ = 2‖T‖⁴ + 2Σ_k ‖P_T^k‖²_F (the form behind 4.30 (ii)).
3. **Two forms.** Take A and B, and let w be the cluster where neither is conjugated. In E[A B Ā B̄]:
   - each of x and y is paired *across* (A with Ā, B with B̄) or *within* (A with B, Ā with B̄);
   - w is paired *straight* (A with Ā, B with B̄) or *twisted* (A with B̄, B with Ā).

   The eight terms are:
   - (across, across, straight) = αβ;
   - (across, across, twisted) = Σ_dd' (P_A^w)_dd' (P_B^w)_d'd = tr(P_A^w P_B^w) ≥ 0;
   - for each other choice on (x, y), the straight and twisted terms are Σ|Z_{I d, J d'}|² and
     Σ Z_{I d, J d'} conj(Z_{I d', J d}). Here Z is a contraction of A with B over the clusters paired within: for
     (within, within), Z_dd' = Σ_ab A_abd B_abd'; for (within, across), Z_{(b, d), (b', d')} = Σ_a A_abd B_ab'd'. Their
     sum is ½Σ|Z_{I d, J d'} + Z_{I d', J d}|² ≥ 0.

   So E|AB|² ≥ αβ + tr(P_A^w P_B^w). Likewise E|AC|² ≥ αγ + tr(P_A^y P_C^y) and E|BC|² ≥ βγ + tr(P_B^x P_C^x).
4. **Assembly by clusters.** The terms ‖T‖⁴ and αβ, αγ, βγ add up to 2(α + β + γ)². In cluster w the remaining terms are
   2‖P_A^w‖² + 2‖P_B^w‖² + 4tr(P_A^w P_B^w) + 2‖P_C^w‖² = 2‖P_A^w + P_B^w‖²_F + 2‖P_C^w‖²_F ≥ (2/c)[(α + β)² + γ²],
   because ‖P‖²_F ≥ (tr P)²/c for a positive semidefinite c × c matrix and tr P_T^k = ‖T‖². Clusters x and y give
   (2/c)[(β + γ)² + α²] and (2/c)[(γ + α)² + β²]. This is the theorem. Finally
   (α + β)² + (β + γ)² + (γ + α)² + α² + β² + γ² = (α + β + γ)² + 2(α² + β² + γ²) ≥ (5/3)(α + β + γ)².
5. **From the Gaussian to the spheres.** R(x, y, w) = r₁r₂r₃R(ω) with r_k² ~ Gamma(c) independent of ω, and
   E r⁴/(E r²)² = (c + 1)/c. So E|R(ω)|⁴/(E|R(ω)|²)² = (c/(c + 1))³ E|R|⁴/(E|R|²)² = κ. ∎

An alternative proof of the mixed term conditions on the shared unconjugated cluster $w$. Given $w$,
write $A=x^*M y$ and $\bar B=x^*N y$. The conditional expectation over $x$ of their squared moduli
multiplied is $\|My\|^2\|Ny\|^2+|\langle My,Ny\rangle|^2$. Averaging the first term over $y$ gives
$\|M\|_F^2\|N\|_F^2+\operatorname{tr}(M^*M N^*N)\ge\|M\|_F^2\|N\|_F^2$.
The two norms squared are Gaussian quadratic forms in the same $w$. Their product has expectation
$\alpha\beta+\operatorname{tr}(P_A^w P_B^w)$, giving the retained terms.

## Checks (`../../code/kappa-three-cluster-2026-11-17/`)

- `wick4.py` (N): the Wick formula for E|R|⁴ agrees with Monte Carlo (2·10⁶ samples) on random A, B, C at c = 2 and 3,
  within the observed error of about 1 %. The known c = 2 cubic gives κ ≈ 1.333333 in this check.
- `pairs_check.py` (N), on 800 random pairs, c = 2 to 5:
  - (across, across, straight) = αβ and (across, across, twisted) = tr(P_A^w P_B^w) to a relative 10⁻⁹;
  - the three other pair sums are nonnegative;
  - on 1,500 random mixed R, c = 2 to 8, the theorem holds with margin.
- `minkappa.py` (N): local minimization gives 1.333333 at $c=2$, 1.58002 at $c=3$ and 1.600001 at $c=4$.
  The exact minima at $c=2,4$ follow from the constructions above. The search gives an upper bound on the infimum at $c=3$.
- `bound_exact.py` checks the moment and coupling constants by exact arithmetic. It also compares the floors
  with the published numerical estimates of the required κ at the two sampled energies on the piece $t=0.70$.

| c | 4 | 5 | 6 | 8 | 10 | 12 |
|---|---|---|---|---|---|---|
| κ needed (1.612u\* / 1.449u\*) | 1.285 / 1.290 | 1.402 / 1.407 | 1.483 / 1.488 | 1.591 / 1.596 | 1.658 / 1.662 | 1.705 / 1.708 |
| previous bound 2c²/(c + 1)² | 1.2800 | 1.3889 | 1.4694 | 1.5802 | 1.6529 | 1.7041 |
| Wick bound | 1.4507 | 1.5432 | 1.6093 | 1.6973 | 1.7531 | 1.7915 |
| Spherical floor | 8/5 | 5/3 | 12/7 | 16/9 | 20/11 | 24/13 |

## Consequence and what stays open

- **Numerical evidence (N).** At $\kappa=k_{\rm Wick}(c)$, the Gamma-model trials for
  $c=4,5,6,8,10,12$ give 0.1786–0.1838 at $1.612u^*$ against 0.2190 and 0.1924–0.1979
  at $1.449u^*$ against 0.2323. [Original model log](../../code/kappa-three-cluster-2026-11-17/formula_t070.log)
- For the exact $c=4$ extremal bulk, the Beta law gives sampled ratios 0.1548–0.1573 at $1.612u^*$
  and 0.1680–0.1709 at $1.449u^*$ with the rounded candidates from the original log.
  Keeping those candidates and the first two moments fixed, a two-point proxy raises the ratios
  by about 9–11% over the Gamma values. The earlier $c=6$ model point also shows an uplift of about 10%.
  These are tests of moment substitution. The factorization above restricts actual cubic laws to Beta
  scale mixtures. [Shape probe (N)](../../code/kappa-three-cluster-2026-11-17/shape_probe.log)
- **Open.** The exact minima for $c=3$ and $c\ge5$, the optimal uniform constant $C$, and the content bound
  for all profiles and actual scale laws on $t=0.70$ remain to be established. The content law
  outside the three-cluster family is open as in rows 4.19 and 4.28.
