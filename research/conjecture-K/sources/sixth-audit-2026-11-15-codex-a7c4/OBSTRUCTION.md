<!-- New sixth-audit note. Agent-ID: codex-a7c4. Refs #415. -->
# A finite witness for the Gaussian-marginal obstruction

Agent-ID: **codex-a7c4**, task #415, baseline `adb96a5a2`.
**P by author, not externally reviewed + C** with `gaussian_obstruction.py`.
This re-derives the qualitative obstruction in the October `ch35` and adds
an explicit finite witness. It does not claim a new obstruction mechanism.
It does not refute Conjecture K: the residual is not pure cubic chaos.

## 1. What is being checked

STATUS 6.5.1 marks as R the fact that an exactly Gaussian remote marginal,
first-chaos orthogonality and the matching covariance profile do not imply
shared-A domination. The full smooth construction is in
`sources/manuscript/legacy/ch35-gpt-gaussian-remainder.tex`, subsection
“A Gaussian-marginal obstruction to a law-only shared comparison”.
We re-derive that construction below using the now-reviewed complete
monotonicity of the A kernel, and certify a finite positive excess.
The separate historical claim of a violation of the whole 10⁻⁴ allowance
with 44% energy outside cubic chaos is not checked here.

At the peak let a=699/1250, b=179/1250, p=2500/1891 and L=Z(a+b|Z|²).
For an independent standard complex Gaussian X define

    R=|X|²,  F₂(r)=1−(r+1)e^(−r),
    u₀=403448/10000000,
    Q=sqrt(u₀) X exp(2πi F₂(R)),
    t₀=1/1250,
    G=Q−i t₀(|Z|²−1)X.

Then Q has exactly the circular complex Gaussian law with variance u₀,
is orthogonal to the full first chaos of its remote coordinate space, and

    Λ(G)>S+7/10000000.                              (1)

This explicit inequality concerns the **raw** functional. The example is
neither a cubic counterexample nor a violation of the allowance 10⁻⁴.

## 2. Marginal, orthogonality and covariance

Conditional on R, X has uniform phase. Multiplication by the phase depending
on R preserves this conditional law, and therefore Q is exactly Gaussian.
Since F₂′(r)=r e^(−r),

    E[Q conjugate(X)]/sqrt(u₀)
      =∫₀∞ r e^(−r) exp(2πiF₂(r))dr
      =∫₀¹ exp(2πiy)dy=0.                          (2)

Unused remote coordinates are independent. Global phase rotation also gives
EQ=EQ²=E[QX]=0. Consequently, conditional on T=|Z|²,

    E|Q+α(T−1)X|²=u₀+|α|²(T−1)²,
    E[Q+α(T−1)X]²=0.

These are exactly the variance and pseudovariance of the matched Gaussian
shared-A comparison. Conditional on T the residual is circular as well.
This establishes the advertised covariance scope without a chaos assumption.

## 3. A global supporting-plane lower bound

Use the reviewed kernel identity, for z∈ℂ,

    E_Z[(T−1)ph(L+z)]=z g_A(|z|²),
    k_A=−g_A,  w=k_A/2.

The function w is positive and strictly decreasing, by the positive Laplace
representation in A15T `CONTENT_KERNELS.md` §3. Its representing measure
has positive mass at positive parameters, which also makes the decrease strict.
Define

    J=E[R exp(2πiF₂(R)) w(u₀R)].

Changing variable y=F₂(r) and pairing y with 1−y yields

    Im J=∫₀^(1/2) sin(2πy)
        [w(u₀F₂⁻¹(y))−w(u₀F₂⁻¹(1−y))]dy>0.       (3)

Both factors are positive in the interior; the integral is finite since
w is bounded. Let F(Q)=2E|L+Q| and B(u)=2E|L+sqrt(u)W|. Visible parity
turns both norm terms in Λ(Q+α(T−1)X) into the same expectation. The
supporting plane of the norm gives, for every real t≥0, not only infinitesimally,

    Λ(Q−it(T−1)X)
      ≥B(u₀)−pu₀+4sqrt(u₀)(Im J)t−pt².           (4)

The norm-price cross term vanishes because E(T−1)=0. The coefficient of t
follows directly from g_A=−2w and (3); this fixes its sign and factor four.
Equation (4) strengthens the source's first-variation argument to a global
quadratic lower bound along this ray. It supplies a finite witness once
Im J is bounded below and the Gaussian benchmark gap is bounded above.

## 4. Explicit rational budget

The old derivative checker, freshly replayed by the new checker, gives

    M₁=−k_A′(0)>43/20,  M₂=k_A″(0)<117/10.

Complete monotonicity implies 0≤k_A″(v)≤M₂. Hence

    w(u₀)−w(5u₀/2)
      ≥(3u₀/4)[M₁−(5u₀/2)M₂]
      >(3u₀/4)[43/20−(5u₀/2)(117/10)].           (5)

Exact exponential enclosures give F₂(1)>1/4 and F₂(5/2)<3/4. On
y∈[1/8,1/4], therefore, F₂⁻¹(y)<1 and F₂⁻¹(1−y)>5/2, while
sin(2πy)≥sqrt(2)/2>7/10. Restricting the positive integral (3) to that
interval and using (5) proves

    Im J>(1/8)(7/10)(3u₀/4)
             [43/20−(5u₀/2)(117/10)]>1/400.        (6)

Also sqrt(u₀)>1/5. The independently reviewed direct Rice checker is
replayed in full, giving

    B(u₀)−pu₀>1.3739535256614828,
    S<1.3739535256616.

Inserting t₀=1/1250 into (4) gives a lower bound on the excess over S of

    4(1/5)(1/400)(1/1250)
      −(2500/1891)(1/1250)²
      −(1.3739535256616−1.3739535256614828)
       >7/10000000.

Every remaining comparison is rational. The checker stores the exact lower
bound, derivative enclosures, and SHA-256 hashes of the reused code. It does
not read any saved JSON as an acceptance input.

## 5. Why this does not contradict the cubic theorems

The phase transformation is smooth but not a cubic polynomial. In real
standard Gaussian coordinates X=(x+iy)/sqrt(2), write φ(r)=2πF₂(r).
The radial/tangential derivative norms give

    E‖DQ‖²=u₀[1+2E(R²φ′(R)²)]
           =u₀(1+64π²/81)>3u₀,

because φ′(r)=2πr e^(−r) and E[R⁴e^(−2R)]=24/3⁵=8/81.
A pure third-chaos variable has Dirichlet energy exactly 3 times its variance.
Adding the visible A cubic cannot remove the higher remote-chaos components.
Thus G lies outside H₂,₁. The exact Gaussian marginal does not supply the
joint fixed-chaos identities needed by the theorem in the newer tilted report.

The qualitative source statement in STATUS 6.5.1 can now carry this fresh
P/C evidence, with the separate unexamined 10⁻⁴/44% claim still marked R.
All prior sources remain unchanged.

```sh
python3 -I research/conjecture-K/code/sixth-audit-2026-11-15-codex-a7c4/gaussian_obstruction.py --dependency-dir /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies
```

The command is read-only by default; `--write-result` explicitly regenerates
only the adjacent small JSON. It uses the existing python-flint installation.
