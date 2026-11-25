# Transfer with three and four independent quadratic selectors

Agent-ID: codex-a7c4. Research follow-up to [#676](https://github.com/agalatan/grothendieck-lean/issues/676) and [#680](https://github.com/agalatan/grothendieck-lean/issues/680).

Keeping the six established root channels and adding a single explicit channel with three selectors gives $D>0.7119685862300$ and $1/D<1.404556352$. Adding two further selector columns gives $D>0.7119685873541$ and $1/D<1.404556350$. The first construction already exceeds the eight-channel slope of the [single-selector certificate](../angular-selector-transfer-codex-a7c4/PROOF.md). The earlier six-column dual also applies because the first six columns and their paid allowances are identical. These are research certificates. The root Lean theorem and article have separate endpoints.

## The kernel and its complete tail

Let $z,p,u_1,\ldots,u_d$ be independent standard complex Gaussians, $a$ rational, and set
$$
 \theta=a\sum_{i=1}^d(|u_i|^2-1),\qquad G=\operatorname{ph}(z\cos\theta+p\sin\theta).
$$
This is a common charge-one disk map. Use coordinate preprocessors $(R,-R,1,\ldots,1)$ with $R(x)=p_0-(1-p_0)x$. Write $x=r^2$ for real input correlation $r$, $n=2k+1$ for the scalar-phase degree, $r_k$ for its scalar phase mass and $b_{kf}=4^{-k}\binom{2k+1}{k-f}$ for the odd cosine-frequency probability at $m=2f+1$. The two linear arguments have conditional correlation $rR(x)\cos(\theta_1+\theta_2)$. For each frequency put $t=am$, $c=e^{-2it}/(1-it)^2$ and $\lambda=-t^2/(1-it)^2$.

Independence of the $d$ selector pairs makes the characteristic function of the sum equal to $(c/(1-\lambda x))^d$. Consequently the contribution to the kernel divided by $r$ at scalar degree $n$ and frequency $m$ is
$$
 r_k x^k R(x)^n b_{kf}
   \sum_{j\ge0}\Re\!\left[c^d\binom{d+j-1}{j}\lambda^j\right]x^j.
$$
The sum of absolute values of the complex geometric-power coefficients is one since $|c|=1-q$ with $q=|\lambda|$. Their absolute tail from $J$ is
$$
 q^J\sum_{\ell=0}^{d-1}\binom{J+\ell-1}{\ell}(1-q)^\ell.
$$
For example, interpret $\binom{d+j-1}{j}(1-q)^dq^j$ as the probability of $j$ failures before the $d$th success. At least $J$ failures before that success means that at the $J$th failure there have been $\ell<d$ successes, giving the finite sum above. This identity also holds at $q=0$ by continuity. Taking real parts only lowers the absolute tail. Every row therefore retains the same Wiener contraction and error accounting as the single-selector proof.

The transfer replay uses $J=1800$, $k\le6000$, 220 positive odd frequencies and 1025 preprocessor coefficient bins. It encloses the first 251 signed coefficients of each new column, treating the entire remaining coefficient norm and all finite rounding in one allowance. The allowance is below $0.0000522$ for both three-selector columns and below $0.0000537$ for the four-selector column. The six existing rows retain their root cutoffs and allowances. The scalar-phase and frequency submass bounds, integer coefficient aggregation, and final mixture inequality follow the [single-selector error proof](../angular-selector-transfer-codex-a7c4/PROOF.md).

For $p_0=b/e$ in reduced form, one increase of $k$ multiplies the preprocessor's absolute coefficient row by the binomial weights $(b^2,2b(e-b),(e-b)^2)/e^2$. Before applying the numerator, the checker writes each 50-bit nonnegative entry as $e^2 q+s$, $0\le s<e^2$. It applies the positive numerator separately to $q$ and $s$, then adds the quotient part to the floored remainder part. This evaluates the same downward floor using integers bounded by $2^{50}$ and $e^4$ in the two products; $e\le200$. The independent low-degree check uses closed negative-binomial powers, original cosine binomial masses and direct preprocessor coefficients.

## Fixed mixtures

The seven-channel witness uses only the first new row. The nine-channel witness uses all three.

| New column | $d$ | $a$ | $p_0$ | Seven-channel weight numerator | Nine-channel weight numerator |
|---|---:|---:|---:|---:|---:|
| 1 | 3 | $3/20$ | $197/200$ | 64380876 | 39335570 |
| 2 | 3 | $3/20$ | $39/40$ | 0 | 22953474 |
| 3 | 4 | $7/50$ | $199/200$ | 0 | 4988631 |

All weights have denominator $10^{12}$. The six established-channel numerators are $(855384964652,87541564726,156281241,74502861,56427888477,350417167)$ for seven channels and $(855461089648,87466027512,156246524,76815338,56421633549,350909754)$ for nine. The verifier checks positivity and total weight one, lower-bounds the combined linear coefficient, upper-bounds the absolute sum of the higher interval coefficients, and deducts the weighted global allowances. It prints both exact rational reciprocals. [Finite transfer verifier](../../code/multiple-selector-transfer-codex-a7c4/verify_transfer.py).

From the repository root, use Python with NumPy and python-flint.

```sh
sources=$(mktemp -d)
bash research/upper-channels/code/fetch_sources.sh "$sources"
python3 -IB -O research/upper-channels/code/multiple-selector-transfer-codex-a7c4/verify_transfer.py --sources "$sources"
```

The [diffuse-limit theorem](DIFFUSE.md) studies the alternating score and the first Hermite coefficient of this family. The transfer certificates above use finite, concentrated strengths and pay their full nonlinear error.
