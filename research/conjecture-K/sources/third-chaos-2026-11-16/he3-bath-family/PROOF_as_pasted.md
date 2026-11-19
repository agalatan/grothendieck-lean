<!-- Verbatim as relayed by the user on 16 November 2026: the answer of an outside session of the user to TASK.txt beside it; no other file of it exists. Kept also in /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/he3-bath-family-2026-11-16. Only this line was added. -->
The inequality is true. In fact, a strictly stronger closed-form bound holds for all real a, b, c:

$$\mathbb{E}\vert{}F\vert{} \le \frac{5}{2\sqrt{3\pi}}\sqrt{6a^2 + b^2 + c^2} < \sqrt{\frac{2}{3}}\sqrt{6a^2 + b^2 + c^2} < \sqrt{\frac{17}{25}}\sqrt{6a^2 + b^2 + c^2},$$

or equivalently, for (a, b, c) \neq (0, 0, 0),

$$\operatorname{Var}(\vert{}F\vert{}) \ge \left(1 - \frac{25}{12\pi}\right)\mathbb{E}F^2 > \frac{1}{3}\,\mathbb{E}F^2 > \frac{8}{25}\,\mathbb{E}F^2.$$

Below is a self-contained analytic proof (Deliverable 1) requiring no grid discretization, numerical optimization, or tail truncation, followed by exact boundary evaluations and remarks on the sharp constant.

1. Complete Analytic Proof

Step 1: Normalization and Two-Parameter Reduction

First verify the second moment. Since X, Y, Z \sim N(0,1) are independent with \mathbb{E}Y = \mathbb{E}Z = 0, all cross terms in F^2 have mean zero. Using the standard Gaussian moments \mathbb{E}X^2 = 1, \mathbb{E}X^4 = 3, and \mathbb{E}X^6 = 15,

$$\mathbb{E}[(X^3 - 3X)^2] = \mathbb{E}[X^6 - 6X^4 + 9X^2] = 15 - 18 + 9 = 6,$$

while \mathbb{E}[(XY)^2] = \mathbb{E}X^2 \mathbb{E}Y^2 = 1 and \mathbb{E}Z^2 = 1. Hence \mathbb{E}F^2 = 6a^2 + b^2 + c^2, and \operatorname{Var}(\vert{}F\vert{}) = \mathbb{E}F^2 - (\mathbb{E}\vert{}F\vert{})^2 \ge \frac{8}{25}\mathbb{E}F^2 is equivalent to \mathbb{E}\vert{}F\vert{} \le \sqrt{17/25}\sqrt{\mathbb{E}F^2}.

If a = b = c = 0, then F = 0 almost surely and the inequality holds trivially. Otherwise, by positive homogeneity of \mathbb{E}\vert{}\cdot\vert{}, divide F by \sqrt{6a^2 + b^2 + c^2} to assume 6a^2 + b^2 + c^2 = 1. Set

$$p = 6a^2, \qquad q = b^2, \qquad 1 - p - q = c^2,$$

so (p, q) lies in the compact triangle

$$T := \{(p, q) \in \mathbb{R}^2 : p \ge 0,\; q \ge 0,\; p + q \le 1\}.$$

Conditionally on X = x, the random variable bxY + cZ is centered Gaussian with variance v(x) := b^2 x^2 + c^2 = qx^2 + 1 - p - q \ge 0 (interpreted as the point mass at 0 when v(x) = 0). Writing \mu_a(x) = a(x^3 - 3x) and \mu(x) = \sqrt{p/6}\,(x^3 - 3x), note that \mu_a(x) = \pm \mu(x). For any \mu \in \mathbb{R} and v > 0, letting W \sim N(0,1), direct integration gives

$$\mathbb{E}_W\vert{}\mu + \sqrt{v}\,W\vert{} = \sqrt{\frac{2v}{\pi}}\exp\!\left(-\frac{\mu^2}{2v}\right) + \mu\operatorname{erf}\!\left(\frac{\mu}{\sqrt{2v}}\right) =: \Psi(\mu, v),$$

where \operatorname{erf}(u) = \frac{2}{\sqrt{\pi}}\int_0^u e^{-t^2}\,dt. When v = 0, \mathbb{E}_W\vert{}\mu + 0\cdot W\vert{} = \vert{}\mu\vert{} =: \Psi(\mu, 0). Moreover, \Psi is continuous on \mathbb{R} \times [0, \infty) because

$$\big\vert{}\Psi(\mu', v') - \vert{}\mu\vert{}\big\vert{} = \big\vert{}\mathbb{E}_W\vert{}\mu' + \sqrt{v'}\,W\vert{} - \mathbb{E}_W\vert{}\mu\vert{}\big\vert{} \le \vert{}\mu' - \mu\vert{} + \sqrt{v'}\,\mathbb{E}_W\vert{}W\vert{} \xrightarrow{(\mu', v') \to (\mu, 0^+)} 0,$$

and \Psi(-\mu, v) = \Psi(\mu, v) since u \mapsto u\operatorname{erf}(u) is even. By Tonelli's theorem, for all (p, q) \in T,

$$\mathbb{E}\vert{}F\vert{} = \int_{\mathbb{R}} \Psi(\mu_a(x), v(x))\,\phi(x)\,dx = \int_{\mathbb{R}} \Psi(\mu(x), v(x))\,\phi(x)\,dx =: J(p, q),$$

where \phi(x) = \frac{1}{\sqrt{2\pi}}e^{-x^2/2}.

Step 2: Elementary Rational Bounds on \pi

To verify all numerical inequalities purely over \mathbb{Q}, we record a quick rational enclosure for \pi.

Lemma 1. \dfrac{25}{8} < \pi < \dfrac{7}{2}.

Proof. Using \frac{d}{dx}\arcsin x = (1 - x^2)^{-1/2} and \sin(\pi/6) = 1/2, we have \pi = 6\int_0^{1/2} (1 - x^2)^{-1/2}\,dx. For every x \in (0, 1/2):

1. (1 - x^2)\left(1 + \frac{1}{2}x^2\right)^2 = 1 - \frac{3}{4}x^4 - \frac{1}{4}x^6 < 1, so (1 - x^2)^{-1/2} > 1 + \frac{1}{2}x^2. Integrating yields \pi > 6\int_0^{1/2}\left(1 + \frac{1}{2}x^2\right)dx = 6\left(\frac{1}{2} + \frac{1}{48}\right) = \frac{25}{8}.
2. 1 - x^2 > \frac{3}{4} = \frac{147}{196} > \frac{144}{196} = \left(\frac{6}{7}\right)^2, so (1 - x^2)^{-1/2} < \frac{7}{6}. Integrating yields \pi < 6 \cdot \frac{1}{2} \cdot \frac{7}{6} = \frac{7}{2}. \blacksquare

Step 3: Pointwise Upper Bound on \Psi(\mu, v)

Lemma 2. For all \mu \in \mathbb{R} and all v \ge 0,

$$\Psi(\mu, v) \le \sqrt{\mu^2 + \frac{2}{\pi}v}.$$

Proof. If v = 0, both sides equal \vert{}\mu\vert{}. Assume v > 0. By scaling \Psi(\mu, v) = \sqrt{v}\,\Psi(\vert{}\mu\vert{}/\sqrt{v}, 1), put y = \vert{}\mu\vert{}/\sqrt{v} \ge 0. Since \Psi(y, 1) > 0, it suffices to show D(y) := y^2 + \frac{2}{\pi} - \Psi(y, 1)^2 \ge 0 for all y \ge 0.

Observe that D(0) = \frac{2}{\pi} - \left(\sqrt{\frac{2}{\pi}}\right)^2 = 0. Differentiating \Psi(y, 1) = \sqrt{\frac{2}{\pi}}e^{-y^2/2} + y\operatorname{erf}(y/\sqrt{2}) with respect to y gives

$$\frac{d}{dy}\Psi(y, 1) = -y\sqrt{\frac{2}{\pi}}e^{-y^2/2} + \operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right) + y\sqrt{\frac{2}{\pi}}e^{-y^2/2} = \operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right).$$

Therefore,

$$D'(y) = 2y - 2\Psi(y, 1)\operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right) = 2\left[y\left(1 - \operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right)^2\right) - \sqrt{\frac{2}{\pi}}e^{-y^2/2}\operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right)\right].$$

Since 1 - \operatorname{erf}(y/\sqrt{2}) = \sqrt{\frac{2}{\pi}}\int_y^\infty e^{-s^2/2}\,ds, this factors as

$$D'(y) = 2\sqrt{\frac{2}{\pi}}\left[y\left(1 + \operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right)\right)\int_y^\infty e^{-s^2/2}\,ds - e^{-y^2/2}\operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right)\right].$$

We bound the Gaussian tail from below by Komatsu's inequality: for all y \ge 0,

$$\int_y^\infty e^{-s^2/2}\,ds > r(y)e^{-y^2/2}, \qquad r(y) := \frac{2}{\sqrt{y^2 + 4} + y} = \frac{\sqrt{y^2 + 4} - y}{2}.$$

To verify this bound, set g(y) = \int_y^\infty e^{-s^2/2}\,ds - r(y)e^{-y^2/2}. For y \ge 1, 0 \le \int_y^\infty e^{-s^2/2}\,ds \le \int_y^\infty s e^{-s^2/2}\,ds = e^{-y^2/2} and 0 < r(y) \le 1, so \lim_{y \to \infty} g(y) = 0. Furthermore, r(y)^2 + y r(y) = 1 and r'(y) = \frac{1}{2}\left(\frac{y}{\sqrt{y^2+4}} - 1\right) = -\frac{r(y)}{\sqrt{y^2+4}}, whence for all y \ge 0,

$$g'(y) = e^{-y^2/2}\big(-1 - r'(y) + y r(y)\big) = r(y)e^{-y^2/2}\left(\frac{1}{\sqrt{y^2+4}} - r(y)\right) = r(y)e^{-y^2/2}\,\frac{y\sqrt{y^2+4} - (y^2 + 2)}{2\sqrt{y^2+4}} < 0,$$

because (y^2 + 2)^2 - y^2(y^2 + 4) = 4 > 0 implies y\sqrt{y^2+4} < y^2 + 2. Thus g is strictly decreasing with \lim_{y\to\infty} g(y) = 0, proving g(y) > 0 for all y \ge 0.

Substituting \int_y^\infty e^{-s^2/2}\,ds > r(y)e^{-y^2/2} into D'(y) and using y r(y) = \frac{2y}{\sqrt{y^2+4} + y} gives

$$D'(y) \ge 2\sqrt{\frac{2}{\pi}}\,e^{-y^2/2}\,\frac{2y - (\sqrt{y^2+4} - y)\operatorname{erf}(y/\sqrt{2})}{\sqrt{y^2+4} + y}.$$

For all y \ge 0, we have 0 < \sqrt{y^2 + 4} - y = \frac{4}{\sqrt{y^2 + 4} + y} \le 2, and since e^{-s^2/2} \le 1 and \pi > \frac{25}{8} > 2 (by Lemma 1),

$$0 \le \operatorname{erf}\!\left(\frac{y}{\sqrt{2}}\right) = \sqrt{\frac{2}{\pi}}\int_0^y e^{-s^2/2}\,ds \le \sqrt{\frac{2}{\pi}}\,y < y.$$

Multiplying these two nonnegative bounds yields (\sqrt{y^2 + 4} - y)\operatorname{erf}(y/\sqrt{2}) \le 2y. Hence D'(y) \ge 0 for all y \ge 0, so D(y) \ge D(0) = 0. \blacksquare

Step 4: Affine Reduction via Exponential Weighting

For (p, q) \in T and x \in \mathbb{R}, set

$$R(p, q; x) := \mu(x)^2 + \frac{2}{\pi}v(x) = p\cdot\frac{(x^3 - 3x)^2}{6} + q\cdot\frac{2}{\pi}x^2 + (1 - p - q)\cdot\frac{2}{\pi} \ge 0.$$

Introduce the strictly positive weight function

$$w(x) := c\exp\!\left(\frac{\lambda}{2}x^2\right), \qquad \lambda = \frac{7}{25}, \qquad c = \sqrt{\frac{3}{2\pi}}.$$

By Lemma 2 and the arithmetic–geometric mean inequality \sqrt{R} \le \frac{w}{2} + \frac{R}{2w}, for all (p, q) \in T and x \in \mathbb{R},

$$\Psi(\mu(x), v(x)) \le \sqrt{R(p, q; x)} \le \frac{w(x)}{2} + \frac{R(p, q; x)}{2w(x)}.$$

Integrating against \phi(x)\,dx over \mathbb{R} gives

$$J(p, q) \le L(p, q) := \frac{1}{2}\int_{\mathbb{R}} w(x)\phi(x)\,dx + \frac{1}{2}\int_{\mathbb{R}} \frac{R(p, q; x)}{w(x)}\phi(x)\,dx.$$

Because R(p, q; x) = p\,R(1, 0; x) + q\,R(0, 1; x) + (1 - p - q)\,R(0, 0; x), the functional L(p, q) is affine on T:

$$L(p, q) = p\,L(1, 0) + q\,L(0, 1) + (1 - p - q)\,L(0, 0) \le \max\big\{L(0, 0),\; L(0, 1),\; L(1, 0)\big\}.$$

Step 5: Exact Evaluation at the Three Vertices

For any s > 0, substituting t = \sqrt{s}\,x in the standard Gaussian moments gives

$$I_0(s) := \int_{\mathbb{R}} e^{-s x^2/2}\frac{dx}{\sqrt{2\pi}} = \frac{1}{\sqrt{s}}, \quad I_2(s) := \int_{\mathbb{R}} x^2 e^{-s x^2/2}\frac{dx}{\sqrt{2\pi}} = \frac{1}{s^{3/2}},$$

$$I_4(s) := \int_{\mathbb{R}} x^4 e^{-s x^2/2}\frac{dx}{\sqrt{2\pi}} = \frac{3}{s^{5/2}}, \quad I_6(s) := \int_{\mathbb{R}} x^6 e^{-s x^2/2}\frac{dx}{\sqrt{2\pi}} = \frac{15}{s^{7/2}}.$$

With \lambda = \frac{7}{25}, we have s_- := 1 - \lambda = \frac{18}{25} and s_+ := 1 + \lambda = \frac{32}{25}, so \sqrt{s_-} = \frac{3\sqrt{2}}{5} and \sqrt{s_+} = \frac{4\sqrt{2}}{5}.

First, the common weight integral is

$$\frac{1}{2}\int_{\mathbb{R}} w(x)\phi(x)\,dx = \frac{c}{2}\,I_0(s_-) = \frac{1}{2}\sqrt{\frac{3}{2\pi}}\cdot\frac{5}{3\sqrt{2}} = \frac{5}{4\sqrt{3\pi}}.$$

Now evaluate the second integral at each vertex of T:

1. Vertex (0, 0): Here R(0, 0; x) = \frac{2}{\pi}, so
   $$\frac{1}{2}\int_{\mathbb{R}} \frac{R(0, 0; x)}{w(x)}\phi(x)\,dx = \frac{1}{\pi c}\,I_0(s_+) = \frac{1}{\pi}\sqrt{\frac{2\pi}{3}}\cdot\frac{5}{4\sqrt{2}} = \frac{5}{4\sqrt{3\pi}}.$$
   Adding the first integral gives
   $$L(0, 0) = \frac{5}{4\sqrt{3\pi}} + \frac{5}{4\sqrt{3\pi}} = \frac{5}{2\sqrt{3\pi}} = \sqrt{\frac{25}{12\pi}}.$$
2. Vertex (0, 1): Here R(0, 1; x) = \frac{2}{\pi}x^2, and I_2(s_+) = \frac{1}{s_+}I_0(s_+) = \frac{25}{32}I_0(s_+), so
   $$L(0, 1) = \frac{5}{4\sqrt{3\pi}} + \frac{25}{32}\cdot\frac{5}{4\sqrt{3\pi}} = \frac{57}{64}\,L(0, 0) < L(0, 0).$$
3. Vertex (1, 0): Here R(1, 0; x) = \frac{1}{6}(x^6 - 6x^4 + 9x^2), so
   $$\frac{1}{2}\int_{\mathbb{R}} \frac{R(1, 0; x)}{w(x)}\phi(x)\,dx = \frac{1}{12c}\big(I_6(s_+) - 6I_4(s_+) + 9I_2(s_+)\big) = \frac{I_0(s_+)}{12c}\left(\frac{15}{s_+^3} - \frac{18}{s_+^2} + \frac{9}{s_+}\right).$$
   Substituting s_+ = \frac{32}{25} gives
   $$\frac{1}{12}\left(\frac{15}{(32/25)^3} - \frac{18}{(32/25)^2} + \frac{9}{32/25}\right) = \frac{75(3125 - 4800 + 3072)}{12 \cdot 32768} = \frac{25 \cdot 1397}{4 \cdot 32768} = \frac{34925}{131072}.$$
   Since \frac{I_0(s_+)}{c} = \pi\cdot\frac{5}{4\sqrt{3\pi}} and \pi < \frac{7}{2} (Lemma 1), we have
   $$\frac{34925\,\pi}{131072} < \frac{34925 \cdot 7}{131072 \cdot 2} = \frac{244475}{262144} < 1,$$
   whence
   $$L(1, 0) = \left(1 + \frac{34925\,\pi}{131072}\right)\frac{5}{4\sqrt{3\pi}} < \frac{5}{2\sqrt{3\pi}} = L(0, 0).$$

Finally, using \pi > \frac{25}{8} from Lemma 1, we have 12\pi > 12 \cdot \frac{25}{8} = \frac{75}{2}, so

$$\sup_{(p, q) \in T} J(p, q) \le \max\big\{L(0, 0),\; L(0, 1),\; L(1, 0)\big\} = L(0, 0) = \sqrt{\frac{25}{12\pi}} < \sqrt{\frac{25}{75/2}} = \sqrt{\frac{2}{3}} < \sqrt{\frac{17}{25}},$$

since \frac{17}{25} - \frac{2}{3} = \frac{1}{75} > 0. This completes the proof. \blacksquare

2. Structural Remarks and Sharpness

To strictly separate proved results from open questions:

⚬ Proved boundary values and local optimality of (0, 0):
  ⚬ At (0, 0) (pure Gaussian F = Z), J(0, 0) = \sqrt{2/\pi} \approx 0.797885.
  ⚬ Along the edge p = 0, J(0, q) = \sqrt{2/\pi}\,\mathbb{E}\sqrt{1 + q(X^2 - 1)} is strictly concave in q with \partial_q J(0, 0) = 0, so J(0, q) \le \sqrt{2/\pi} for all q \in [0, 1], decreasing monotonically to J(0, 1) = 2/\pi \approx 0.636620.
  ⚬ At (1, 0), using (3x - x^3)\phi(x) = \frac{d}{dx}[(x^2 - 1)\phi(x)], integration on (-\infty, -\sqrt{3}], [-\sqrt{3}, 0], [0, \sqrt{3}], and [\sqrt{3}, \infty) yields the exact value J(1, 0) = \frac{1 + 4e^{-3/2}}{\sqrt{3\pi}} \approx 0.616461.
  ⚬ Expanding \Psi(\mu(x), v(x)) around (p, q) = (0, 0) gives
    $$J(p, q) = \sqrt{\frac{2}{\pi}}\left(1 - \frac{15}{4}p^2 - \frac{3}{2}pq - \frac{1}{4}q^2 + O\big((p + q)^3\big)\right),$$
    proving that (0, 0) is a strict local maximum relative to T.
  ⚬ Optimizing the parameter \lambda \in (0, 1) in Step 4 down to the threshold where L(1, 0) = L(0, 0) (\lambda \approx 0.1815) tightens the analytic upper bound from \frac{5}{2\sqrt{3\pi}} \approx 0.814338 to \frac{\sqrt{2/\pi}}{(1 - \lambda^2)^{1/4}} \approx 0.8046, without changing the structure of the proof.
⚬ Conjecture on the sharp constant:
  Because \Phi(A, B) := \Psi(\sqrt{A}, B) has \partial_{BB}\Phi(A, B) = \frac{e^{-A/(2B)}}{2\sqrt{2\pi}B^{3/2}}\left(\frac{A}{B} - 1\right) > 0 whenever A > B, the map (p, q) \mapsto \Psi(\mu(x), v(x)) is not globally concave, obstructing a one-line Jensen proof of J(p, q) \le \sqrt{2/\pi} (which is why Lemma 2 replaces \Psi(\mu, v) by its concave-in-(p, q) majorant \sqrt{\mu^2 + \frac{2}{\pi}v}). Nevertheless, based on the negative-definite Hessian at (0, 0) and the monotone decay toward (1, 0) and (0, 1), it is natural to conjecture that \max_{(p,q) \in T} J(p, q) = \sqrt{2/\pi}, attained uniquely at (p, q) = (0, 0).
