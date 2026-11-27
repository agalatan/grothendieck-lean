# An angular selector improves the eight-channel upper certificate

Agent-ID: codex-a7c4. Research task [#676](https://github.com/agalatan/grothendieck-lean/issues/676).

The current root theorem gives the exact transfer slope $711968558203721328194311213/10^{27}$. Keeping its six channels and adding two explicit three-coordinate channels gives a research certificate with slope $D>0.7119685767545$. Its reciprocal is less than **1.404556371**. Adding just the first new channel gives $D>0.7119685759810$. With the six existing preprocessors and their existing tail allowances, *every* choice of six mixture weights has certificate score below $0.7119685648573$. This comparison isolates more than $1.18\cdot10^{-8}$ of slope from the new channels. The root Lean theorem remains the formal bound. [Root statement](../../../../Grothe/UpperResult.lean) and [fixed witnesses](../../code/angular-selector-transfer-codex-a7c4/witness.json).

## Map, preprocessors and transfer

Use independent standard complex Gaussians $z,p,u$ of density $\pi^{-1}e^{-|z|^2}$. Set $T=|u|^2$, $a=17/100$, and define the common disk map
$$
 G(z,p,u)=\operatorname{ph}\bigl(z\cos(a(T-1))+p\sin(a(T-1))\bigr),\qquad \operatorname{ph}(0)=0.
$$
It has charge one. For the two new channels use $(P_z,P_p,P_u)=(R,-R,1)$, with $R(x)=23/25-2x/25$ and $R(x)=1$, respectively. Each preprocessor has absolute coefficient sum one. The standard signed tensor-power preprocessing therefore realizes these correlations. For real $0\le r<1$, the correlations in the three coordinates are $rR(r^2),-rR(r^2),r$. The full charge-one kernel is determined by this radial restriction.

If a realized kernel is $r\sum_{m\ge0}H_m r^{2m}$, the tensor-power transfer theorem gives $K_G^{\mathbb C}\le 1/D$ for $D=H_0-\sum_{m\ge1}|H_m|>0$. Mixing disk maps takes the convex combination of their kernels. In particular a Wiener-norm error $e$ (sum of absolute coefficient errors at **all** indices) can reduce the guaranteed $D$ by at most $e$. [Transfer theorem](../../../../Grothe/UpperSix/Haagerup/Transfer.lean) and [scalar phase and realization](../../../../Grothe/UpperSix/Haagerup/ChaosRealise.lean).

## Exact signed coefficients

Let $T,U$ be the squared lengths of the two selector coordinates in the correlated pair and put $x=r^2$. Conditional on $T,U$, the two linear phase arguments have variance one and real correlation
$$
 r R(x)\cos(a(T+U-2)).
$$
Indeed the reflected $p$ term contributes the negative product of the two sines. The scalar phase kernel has coefficients $r_0=\pi/4$, $r_{k+1}/r_k=(2k+1)^2/(4(k+1)(k+2))$, $\sum_{k\ge0}r_k=1$. These symbols $r_k$ denote masses, distinct from the correlation $r$. Thus the term of scalar phase degree $n=2k+1$ in the kernel divided by $r$ is $r_k x^k R(x)^n\mathbb E\cos^n(a(T+U-2))$.

Expand $\cos^n$ in positive odd frequencies $m=2f+1$, $0\le f\le k$. The coefficient of $\cos(m\theta)$ is
$$ b_{kf}=4^{-k}\binom{2k+1}{k-f},\qquad \sum_f b_{kf}=1. $$
The covariance of the two complex selector Gaussians has eigenvalues $1+r,1-r$. Their squared-norm sum has characteristic function $((1-it)^2+t^2x)^{-1}$. Including the shift by $-2$ yields
$$
 \mathbb E e^{it(T+U-2)}
 =\frac{e^{-2it}}{(1-it)^2+t^2x}
 =\sum_{j\ge0} c_t\lambda_t^j x^j,\qquad
 c_t=\frac{e^{-2it}}{(1-it)^2},\quad \lambda_t=\frac{-t^2}{(1-it)^2}.
$$
Put $t=a(2f+1)$. The exact kernel divided by $r$ is
$$
 \sum_{k\ge0} r_k x^k R(x)^{2k+1}
 \sum_{f=0}^k b_{kf}\sum_{j\ge0}\Re(c_t\lambda_t^j)x^j .
$$
Since $|c_t|=1/(1+t^2)$ and $|\lambda_t|=t^2/(1+t^2)$, each complex geometric series has Wiener norm one, and its tail starting at $J$ has norm $|\lambda_t|^J$. Taking real parts and multiplying by $R^n$ are contractions in this norm. This proves absolute convergence and justifies all reorderings used below.

## Enclosing the full Wiener error

The replay keeps $0\le k\le6000$, $0\le f<220$, $0\le j<1600$ and up to 1024 powers of $x$ in $R^n$. The tail accounting pays for the missing probabilities, including coefficients dropped in intermediate binomial recurrences. The only numerical special functions used for the new kernel are the exponential in $c_t$ and the scalar constant $\pi$. Arb encloses them at 110-bit precision. [Selector arithmetic](../../code/angular-selector-transfer-codex-a7c4/selector.py).

1. **Cosine powers.** The $b_{kf}$ are the folded distribution of a sum of $2k+1$ independent signs. Increasing $k$ by one multiplies the unfurled Fourier series by $\cos^2\theta$ and uses weights $(1/4,1/2,1/4)$ on neighboring odd frequencies. At $m=1$ the negative frequency $-1$ folds back to $+1$. Dropping high frequencies and rounding each nonnegative update down on scale $2^{50}$ produces coefficientwise lower bounds; they are rounded down again to $w_f/2^{26}$. Let $b'_f=w_f/2^{26}$. The omitted frequency contribution has norm at most $1-\sum_f b'_f$.
2. **Radial powers.** Write $J=1600$, $C=2^{34}$ and $A=2^{31}$. For each retained $f,j$, Arb verifies $|C\Re(c_t\lambda_t^j)-v_{fj}|<2$ for its selected integer $v_{fj}$. It rounds $|\lambda_t|^J$ upwards on scale $2^{24}$ to get $\tau_f$. An exact integer matrix product forms the weighted sum, flooring every output coefficient on scale $A$. The row error before preprocessing is at most
   $$
    e_k=1-\sum_f b'_f + \sum_f b'_f \tau_f +2J/C + J/A .
   $$
   In particular this covers both signs of every head error and the infinite radial tail.
3. **Linear preprocessing.** The absolute coefficient row of $(23/25-2x/25)^n$ is $\operatorname{Bin}(n,2/25)$. Increasing $n$ by two uses $(529,92,4)/625$. Truncation and downward rounding on scales $2^{50}$ and then $2^{28}$ produce a nonnegative lower vector $v$, with omitted norm $1-\sum v$. Restore the signs $(-1)^d$ at coefficient $d$ and convolve with the raw row. The approximate signed polynomial has norm at most one, the exact raw row has norm at most one, and the final integer floor costs at most $L/A$ for its $L$ output terms. The total row error is at most $e_k+1-\sum v+L/A$. For $R=1$ the raw row already suffices.
4. **Phase masses and the final tail.** Each $r_k$ is enclosed by its positive recurrence and rounded down to $r'_k$ on scale $2^{30}$. The aggregate Wiener error between the exact channel and the finite sum with weights $r'_k$ is at most $1-\sum_{k\le6000}r'_k+\sum_{k\le6000}r'_k e'_k$, where $e'_k$ is the relevant row error. This includes all uncomputed scalar phase degrees. Shift each approximate row by $x^k$ before summing. Retain coefficients 0 through 250 of their sum, adding the absolute values of its subsequent coefficients to the allowance. The complete allowances are below $0.000048285$ for the linear preprocessor and $0.000126603$ for the unit preprocessor.

Integer matrix multiplication, convolution and accumulation use signed 64-bit integers. For any partial sum of an inner product the absolute sum is bounded by $2\cdot2^{26}\cdot2^{34}$ in the moment stage and $2\cdot2^{31}\cdot2^{28}$ in the preprocessing stage. The final accumulation has absolute sum at most $2\cdot2^{31}\cdot2^{30}$ because the lower phase masses sum to at most one. The positive preprocessing recurrence is bounded by $625\cdot 2^{50}$. All four budgets are strictly below $2^{63}$. The verifier checks the lower subprobabilities and the moment and coefficient ranges used in these estimates. It also compares the first thirteen coefficients of each map against direct binomial and complex-power arithmetic computed independently of the three recurrences.

## Mixtures, control and scope

The first six columns are exactly the root's degree-20 first preprocessor, phase cutoff 320, other cutoffs 250, and certified individual tail caps. Missing coefficients in the displayed finite vectors are zero-padded and their unknown true values are paid by the corresponding tail. The original rational weights recover the current Lean slope to within $10^{-13}$. For each proposed convex mixture the replay bounds the linear coefficient from below and each absolute higher coefficient from above, then subtracts the weighted allowances. The eight weights, in order of the six root channels followed by $(R=23/25-2x/25,R=1)$, have denominator $10^{12}$ and numerators
$$
(855409711666,87472193929,156289943,109498949,56410999464,351244247,87462262,2599540).
$$
The reciprocal of the resulting rational slope lower bound is
$$
\frac{649037107316853453566312041152512000000000000000000000000000}
     {462094025557253017042090536572519135708003358649064960114841}
<1.404556371.
$$

The six-column control uses a rational vector $z$ with $|z_j|\le1$, $1\le j\le320$. For any mixture, $-\sum_{j\ge1}|H_j|\le\sum_{j\ge1}z_j H_j$ on its finite head. After charging the fixed caps, the certificate score of any choice of weights is therefore bounded above by
$$
 \max_{1\le i\le6}\left(H^{(i)}_0-a_i+\sum_{j=1}^{320}z_j H^{(i)}_j\right),
$$
using outward upper endpoints of all interval products. Here $a_i$ is the established allowance of channel $i$. The feasible rational vector in the witness makes the maximum less than $0.7119685648573$. This scope fixes the six maps, preprocessors, cutoffs and allowances; changing any of them is a different optimization. No optimizer is needed in the replay. [Mixture and dual verifier](../../code/angular-selector-transfer-codex-a7c4/verify.py).

## Replay

From the repository root, use Python 3 with NumPy and python-flint. The existing source extractor checks out the pinned six-channel overlap table and the interval-composition routine used in the preceding upper-channel studies. The verifier compares the pinned common parameters and overlap table with the current Lean files. It reads the degree-20 substitution and cutoff-dependent tail caps from the root implementation.

```sh
sources=$(mktemp -d)
bash research/upper-channels/code/fetch_sources.sh "$sources"
python3 -IB -O research/upper-channels/code/angular-selector-transfer-codex-a7c4/verify.py --sources "$sources"
```

The replay is a research computation. No Lean source, formal theorem or article file changes.
