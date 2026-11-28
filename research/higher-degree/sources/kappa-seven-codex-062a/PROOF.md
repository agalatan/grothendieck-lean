# A rational upper bound on the minimum spherical fourth moment at dimension seven

Agent-ID: codex-062a. Issue #507. **P + C, author only.**

Let $R$ be the trilinear form specified by the 1,029 complex coefficients in the
[dimension-seven search file](../../code/degree5-attack/ref/bulk/bulk_c7.json).
Interpret each stored decimal as a rational number. For independent uniform unit
vectors in three copies of $\mathbb C^7$, write
$\kappa(R)=\mathbb E|R|^4/(\mathbb E|R|^2)^2$. Then

$$
\kappa(R)=\frac{229501961275182140618752923233296492656641562028889}
                 {128000000000024216465428993145385152096806036316672}
\quad\in (1.79298407246202125,\ 1.79298407246202126).
$$

This gives an upper bound on the minimum over all such forms. The previous
[32-term rational construction](../kappa-spheres-2026-11-24-gemini-21d5/PROOF.md)
has fourth moment $90370589404268985/50317319709427712$. The minimum over all
forms at dimension seven remains open.

## Exact replay

A label `["mix", i, j, k]` specifies $z_i z_j\bar z_k$, with one index in each
of the three clusters. The coordinates in a cluster are independent standard
complex Gaussians for the following calculation. The verifier clears a common
denominator from the real and imaginary parts of every coefficient. This
rescaling cancels from the ratio. Distinct labeled monomials are orthonormal,
so the Gaussian second moment is the sum of squared coefficient moduli.

To compute $\mathbb E|R|^4=\lVert R^2\rVert_2^2$, expand $R^2$ in orthogonal
Gaussian polynomials. In each cluster a term has two coordinate factors.
Factors with different coordinate indices are already centered independent
products. At the same index, $z^2$ and $\bar z^2$ have squared norm two.
The mixed product splits as $z\bar z=(|z|^2-1)+1$, and these two summands
are orthogonal with squared norm one each. All resulting distinct local
basis elements are orthogonal by independence, centering and phase invariance.
Across the three clusters the squared norms multiply. Sum the complex
coefficients of identical basis elements before taking squared moduli.

For one cluster the independent squared Gaussian radius has first two
moments $c$ and $c(c+1)$. Each monomial is homogeneous of radial degree one
in each cluster, so the spherical ratio is $(c/(c+1))^3$ times the Gaussian
ratio. The calculation uses $c=7$ and reads only the dimension, labels and
coefficients from the search file. Its SHA-256 is
`846da5dba3b6f9c451d2a2325d691a4eda35adda00a3af238f3aa622c9650a4f`.

Run from the repository root with Python 3.10 or later.

```sh
python3 -IBO research/higher-degree/code/kappa-seven-codex-062a/verify.py
```

The [verifier](../../code/kappa-seven-codex-062a/verify.py) checks the reduced
fraction and both enclosure endpoints. It also recovers $4/3$ for the sharp
dimension-two form after a coordinate phase rotation and $44/27$ after reversing
one coefficient sign. The latter value exceeds the sharp target. A separate
calculation pairing the four Gaussian factors directly in each cluster gave
the same dimension-seven fraction.
